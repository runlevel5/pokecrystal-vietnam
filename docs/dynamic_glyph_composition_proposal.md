# Proposal: Dynamic Glyph Composition (Dual-Case Vietnamese Text)

**Status:** Draft / feasibility confirmed
**Date:** 2026-06-11
**Scope:** crystal-vn (Vietnamese translation)
**Related:** `docs/bold_item_names_proposal.md`

## Goal

Escape the 128-tile font limit. Today every Vietnamese character (letter +
diacritic) is one precomposed 8×8 tile, the font window is 100% full, and
uppercase A–Z had to be charmapped onto the lowercase tiles — so the game has no
dual-case text at all.

This proposal: store base letterforms and diacritic marks separately in ROM,
compose them into tiles **at runtime**, and upload the composed glyphs into a
dynamic VRAM cache (the approach official Korean Gold/Silver uses for Hangul).
Result: full upper/lowercase Vietnamese everywhere, with headroom for future
glyphs (and a path to VWF later).

## Why it is feasible — three engine discoveries

1. **128 tiles of VRAM bank 1 are completely unused.** Crystal is GBC-only;
   every BG cell selects bank 0/1 via its attribute byte. `vTiles4`
   (`ram/vram.asm` — bank 1, BG tile IDs $80–$FF, the exact ID range text uses)
   has **zero references in the whole codebase**. Overworld tilesets only touch
   `vTiles5` $00–$5F (`home/map.asm:1364`); battle pics use `vTiles3`. A
   composed-glyph cache can own all 128 slots in every context, battle included.

2. **A VBlank-safe tile upload queue already exists.** `Request1bpp` /
   `Request2bpp` (`home/gfx.asm:189,263`) stream tile data to VRAM with the LCD
   on, chunked per frame. Composed glyphs ride this as-is.

3. **Per-cell tile+attr VRAM updates are a solved problem.** Letter-by-letter
   printing normally updates only the tile plane (`hBGMapMode = 1`), but
   `UpdateBGMapBuffer` (`home/video.asm:20`) — the overworld-scroll path —
   copies **paired tile+attr bytes for arbitrary cells** from `wBGMapBuffer`
   each VBlank. The text printer can enqueue `(address, tile, attr)` per
   character through it; map scroll never runs while a textbox is open. Instant
   full-string prints (menus) batch-upload glyphs, then do a one-frame
   tilemap+attrmap copy.

Also available from earlier research: the Japanese dakuten decomposition hooks
in `PlaceNextChar` (`versions/crystal-vn/home/text.asm:253-285`, `Diacritic`
stub at line 627) provide the mark-prefix pathway, and the build's rgbds 1.0.1
supports multi-byte charmap entries, so source files keep literal `ấ ờ ệ` text.

## Architecture

- **ROM assets:** dual-case base font + mark sheet (1bpp) + a build-generated
  composition table mapping each accented character → (base tile, mark tile).
- **Encoding:** mark-prefix bytes via multi-byte charmap
  (`charmap "ố", MARK_CIRC_ACUTE, "o"`). Alternative: `<UPPER>`/`<LOWER>`
  shift-state control bytes keep accented chars at 1 byte (helps fixed-length
  buffers: "TRỊ TÊ LIỆT" = 11 chars + 1 shift = 12 ≤ `ITEM_NAME_LENGTH` − 1).
- **Static page (bank 0, `vTiles1`):** plain dual-case letters, digits,
  punctuation ≈ 90 tiles; ~32–38 leftover slots hold the *most frequent*
  precomposed accented glyphs (chosen by a frequency count over the script).
  Most text renders with zero runtime cost.
- **Dynamic cache (bank 1, `vTiles4`):** 128 slots. On miss: OR base + mark
  1bpp rows, expand to 2bpp in WRAM staging, queue upload, assign next free
  slot; emit tile ID into `wTilemap` and `PAL_BG_TEXT | bank-1 bit` into
  `wAttrmap`. On hit: emit the cached ID. Cache resets on
  `ClearTilemap`/textbox open. Vietnamese has only ~134 distinct accented
  glyphs total across both cases, so overflow is theoretical; fallback is the
  bare base letter.

## Work plan

1. **Tooling** — split font PNGs (bases + marks), build-time composer for the
   static page, corpus frequency script. Python in `tools/`, ~a day.
2. **Core engine** — WRAM cache tables (~300 bytes), compose routine, upload +
   `wBGMapBuffer` integration, mark-prefix handling in `PlaceNextChar`, attr
   writes, flush hooks for instant-print paths. ~400–600 lines ASM around
   `versions/crystal-vn/home/text.asm` and `home/gfx.asm`.
3. **Charmap + buffers** — case-sensitive charmap; audit fixed-length buffers
   (`ITEM_NAME_LENGTH` etc.); naming screen and mail input need
   character-vs-byte cursor logic.
4. **Editorial (the hidden biggest cost)** — the entire script is currently
   caps-agnostic. Every string needs a re-casing pass
   ("BẠN NHẬN ĐƯỢC…" → "Bạn nhận được…"). Likely more hours than the engine.
5. **Surface audit + QA** — Game Boy Printer (uses its own `FontInversed`
   copy → needs fallback), link-battle name exchange, Town Map, credits,
   slot machines, naming screen, mail.

## Risk register

- **VBlank budget:** per-character printing adds ≤1 glyph upload + 1 buffer
  cell per frame — trivial (CGB double-speed). Menu draws with many misses may
  take 2–3 frames; imperceptible.
- **Cache overflow:** needs >128 unique uncached glyphs on one screen — doesn't
  occur; fallback = markless base letter.
- No savefile, link-protocol, or DMG-compat impact (Crystal is GBC-only).

Effort: engine work ≈ 2–3 weeks focused; script re-casing is the long tail.

---

# Font PNG Specification

Empirical metrics extracted from the current `font.1bpp` (these rules come
from the existing, proven precomposed art):

- Plain letters occupy **rows 2–7** (6 px), column 7 always blank (spacing).
- `á`: letter squeezed to **rows 3–7** (5 px), mark in rows 0–1.
- `ấ`: letter squeezed to **rows 4–7** (4 px), stacked mark in rows 0–2.
- `ạ`: dot-below **merged into the letter's bottom-row interior**
  (`#.###.#` — dot between the legs); no extra row needed.
- `ợ`: horn baked into letter body; tiny bowl + dot in row 7.

Runtime composition = pick a base form + OR a mark tile on top.

## File overview

| File | Size (px) | Tiles | Purpose |
|---|---|---|---|
| `font_compose.png` *(new)* | 128 × 64 | 16 × 8 = 128 | Base letterforms + mark tiles — raw material the engine combines at runtime. Never shown directly. |
| `font.png` *(replaces current)* | 128 × 64 | 128 | Static bank-0 page: plain dual-case glyphs + digits + punctuation. |
| *(no file)* | — | — | Bank-1 dynamic page (`vTiles4`) is runtime-generated. |

Format for both: exactly 2 colors — **white = paper, black = ink** — 8×8 px
tiles, 16 tiles per row. Build pipeline (rgbgfx → `.1bpp`) unchanged.

## Pixel zone rules

| Zone | Rows used | Notes |
|---|---|---|
| Form A (full letter) | 2–7 | Same as current glyphs; used with nothing above. |
| Form B (reduced) | 3–7 | Used under a single mark (tone or hat). |
| Form C (condensed) | 4–7 | Used under stacked hat+tone. Only a, e, o need it. |
| Single marks | 0–2 | ´ ` ̉ ˜ ̂ ̆ — columns 1–5, optically centered. |
| Stacked combo marks | 0–2 | Hat + tone drawn together (like current `ấ` rows 0–2). |
| Dot-below | bottom row, merged | Baked into "dotted" base variants (like current `ạ`/`ợ`). No separate mark tile. |
| All tiles | column 7 blank | Letter spacing. |

Composition is bitwise OR: a mark must never share a pixel row with its base
form (marks stop at row 2; forms B/C start at rows 3/4).

## `font_compose.png` tile layout

| PNG row | Tiles | Contents (left → right) |
|---|---|---|
| 0 | $00–$0F | Form A lowercase: `a b c d e f g h i j k l m n o p` |
| 1 | $10–$1F | Form A lowercase: `q r s t u v w x y z đ ơ ư` + 3 spare |
| 2 | $20–$2F | Form A uppercase: `A B C D E F G H I J K L M N O P` |
| 3 | $30–$3F | Form A uppercase: `Q R S T U V W X Y Z Đ Ơ Ư` + 3 spare |
| 4 | $40–$4F | Form B lowercase: `a e ı o u y ơ ư` · Form B uppercase: `A E I O U Y Ơ Ư` |
| 5 | $50–$5F | Form C: `a e o A E O` · Dotted Form A: `ạ ẹ ị ọ ụ ỵ Ạ Ẹ Ị Ọ` |
| 6 | $60–$6F | Dotted Form A: `Ụ Ỵ` · Dotted Form B: `a. e. o. ơ. ư.` lower + upper (10) + 4 spare |
| 7 | $70–$7F | Marks: `´ ` ̉ ˜ ̂ ̆` (6) · circumflex+tone combos (4) · breve+tone combos (4) + 2 spare |

Drawing notes:

- **Form B `ı`** is dotless — the tone replaces i's dot (current `í` already
  works this way).
- **Dotted Form A** (rows 5–6): full-height letter with dot merged into the
  bottom-row interior — copy existing `ạ ẹ ị ọ ụ` tiles directly.
- **Dotted Form B** (row 6): the squeezed-for-a-hat variants — existing
  `ậ ệ ộ ặ ợ ự` tiles minus their top marks. `ơ./ư.` keep the horn.
- **Combo marks** (row 7): trace rows 0–2 of existing `ấ ầ ẩ ẫ ắ ằ ẳ ẵ`.
- ~12 spare tiles total.

Example compositions (full ~134-entry table is build-generated, never
maintained by hand):

| Character | Base tile | Mark tile |
|---|---|---|
| á | Form B `a` ($40) | acute ($70) |
| ấ | Form C `a` ($50) | circ+acute ($76) |
| ạ | Dotted A `ạ` ($56) | *(none — copied as-is)* |
| ậ | Dotted B `a.` ($62) | circumflex ($74) |
| Ữ | Form B `Ư` ($4F) | tilde ($73) |

## `font.png` static bank-0 page layout

| PNG row | Codes | Contents | vs. today |
|---|---|---|---|
| 0 | $80–$8F | true lowercase `a b c d e f g h i j k l m n o p` | **redraw** (current art is caps-shaped) |
| 1 | $90–$9F | lowercase `q r s t u v w x y z` + `( ) : ; [ ]` | redraw letters, keep punct |
| 2 | $A0–$AF | uppercase `A B C D E F G H I J K L M N O P` | copy current $8x tiles |
| 3 | $B0–$BF | uppercase `Q R S T U V W X Y Z Đ Ơ Ư đ ơ ư` | copy current art |
| 4–5 | $C0–$DF | 32 slots: most-frequent precomposed accented glyphs | placeholder — picked by frequency count over the script |
| 6 | $E0–$EF | punctuation row, layout as today ($E5 `đ` slot freed) | keep |
| 7 | $F0–$FF | `¥ × . / , ♀` + digits `0–9` | keep |

The two real art tasks: **drawing a genuine lowercase alphabet** (doesn't exist
in the project yet — rows 0–1 of both sheets) and **decomposing the existing
accented tiles** into form/mark pieces (mostly copy-paste surgery on tiles
already drawn).

Workflow: edit copies (`font_compose.png`, `font_dualcase.png`) rather than
overwriting `font.png`, so the current build keeps working until the engine
side lands. A previewer script can compose sample glyphs from the sheets and
render ASCII/PNG proofs before any engine code exists.
