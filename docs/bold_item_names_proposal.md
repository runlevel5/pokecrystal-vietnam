# Proposal: Bold Item Names in Acquisition Messages

**Status:** Draft / feasibility confirmed
**Date:** 2026-06-11
**Scope:** crystal-vn (Vietnamese translation)

## Goal

Make item names stand out in acquisition messages by rendering them in a bold style:

> Current: `<PLAYER> nhận LỌ THUỐC.`
> Proposed: `<PLAYER> nhận` **`LỌ THUỐC`**`.` (name in bold glyphs)

This matters more in crystal-vn than in vanilla Crystal: the Vietnamese font is
single-case (uppercase A–Z is charmapped onto the lowercase tiles), so item names
currently render with exactly the same glyphs as body text and do not stand out at all.

## Background: how text rendering works

The Game Boy has no notion of a "font" or text styles. Each byte of a string is a
tile index, and the screen shows whatever 8×8 graphic currently occupies that index
in VRAM. Mixing glyph styles in one string is therefore trivial — the game already
does it in every textbox (frame pieces, `<PO>`/`<KE>`, quotes, and letters all come
from different graphics files loaded at different tile indices).

VRAM layout during an overworld dialog:

| Tile range | Contents                                                | Source |
|------------|---------------------------------------------------------|--------|
| $60–$78    | extra glyphs: vanilla bold A–M/V/S, `<PO>`/`<KE>`, quotes, ellipsis, unused hiragana | `gfx/font/font_extra.png` via `_LoadFontsExtra1` |
| $79–$7E    | textbox frame pieces                                    | `gfx/frames/*.png` |
| $7F        | space                                                   | `gfx/font/space.2bpp` |
| $80–$FF    | main Vietnamese font (128 tiles)                        | `versions/crystal-vn/gfx/font/font.png` |

## Why a static bold font is NOT feasible

1. **The main font window is 100% full.** The Vietnamese layout
   (`versions/crystal-vn/constants/charmap.asm`) spends all 128 tiles of $80–$FF on
   lowercase letters, ~67 diacritic glyphs, digits, and punctuation. Uppercase A–Z
   already had to be remapped onto the lowercase tiles to make room.
2. **Item names are full of diacritics.** `versions/crystal-vn/data/items/names.asm`
   contains names like `ĐÁ TRĂNG`, `TRỊ TÊ LIỆT`, `MAX XUA ĐUỔI`. A static bold set
   would need bold versions of ~100 glyphs (letters + diacritics + digits).
3. Vanilla Crystal's unused bold assets (`gfx/font/unused_bold_font.png`, charmap
   codes `<BOLD_A>`–`<BOLD_M>`) cover plain A–Z only — useless for Vietnamese names
   on their own.

There is nowhere to statically park ~100 extra tiles. A full second font cannot
coexist with the main one.

## Feasible approach: dynamic bold-tile window

Item names are short: `ITEM_NAME_LENGTH` is 13 (12 visible characters max), spaces
need no bolding, and repeated characters can share a tile. The worst real name
(`MAX XUA ĐUỔI`) has only 7 unique non-space glyphs. So a name never needs more
than ~12 unique bold tiles at once.

### Mechanism

1. **Reserve ~12–16 tile slots** in the $63–$78 extra-font window as a rotating
   bold-glyph window. Verified dead during overworld dialogs:
   - `$63–$6C` — vanilla `<BOLD_D>`–`<BOLD_M>`, unused
   - `$6E–$6F` — unused hiragana `ぃ` `ぅ`
   - `$74` — unused middle dot
   - `$76–$78` — unused hiragana `ぁ` `ぇ` `ぉ`

   (`<BOLD_V>`/`<BOLD_S>` at $69–$6A are used only by the battle "VS" HUD in
   `engine/battle/trainer_huds.asm`, never in overworld dialogs.)

2. **Generate bold glyphs from the existing font** — no hand-drawn bold font needed.
   The classic emboldening transform works on any glyph, diacritics included:

   ```
   bold_row = row OR (row >> 1)
   ```

   Preferred variant: pre-generate a bold copy of `font.1bpp` at **build time**
   (small Python step over `font.png` in `tools/`), `INCBIN` it as `BoldFont` in a
   ROMX section. ROM space is abundant; the runtime then just copies glyphs instead
   of computing them, and any ugly emboldened diacritic can be hand-tuned in the PNG.

3. **At print time**, for each unique character of the item name: copy its glyph
   from `BoldFont` into the next free reserved VRAM slot (via the existing
   VBlank-safe `Get1bpp`/`Get2bpp` path), and emit the raw tile index into the
   textbox instead of the charmap code. Spaces print as normal `$7F`. The window
   resets on each new message.

4. **Hook into the text engine** as a new text command, e.g. `text_ram_bold`
   (a variant of `text_ram` / `TX_RAM` in `home/text.asm` + `macros/scripts/text.asm`).

### Call sites to update (centralized, small)

- `ReceivedItemText` — `versions/crystal-vn/data/text/std_text.asm:243`
- `_ReceivedTMHMText` — `versions/crystal-vn/data/text/common_2.asm:208`
- A handful of other "nhận được" texts using `text_ram wStringBuffer*`
  (grep `text_ram` in `versions/crystal-vn/data/text/`)

## Caveats

- **Battle context is off-limits.** `FontBattleExtra` and the HP-bar tiles overwrite
  $60–$78 during battles (`_LoadFontsBattleExtra`, `LoadBattleFontsHPBar`). In-battle
  item messages must keep the normal style, or the routine needs a context guard
  (fall back to plain `text_ram` when not in an overworld textbox).
- VRAM uploads must go through the existing VBlank-safe copy queue (already handled
  by `Get1bpp`/`Get2bpp` when the LCD is on).
- If a future name ever exceeded the reserved slot count in unique glyphs, the
  routine should degrade gracefully to plain printing (not realistic at
  `ITEM_NAME_LENGTH` = 13, but cheap to guard).

## Effort estimate

- ~100–150 lines of new ASM: glyph copy/upload routine, tile allocator with dedup,
  new text command.
- One small build-time tool/Makefile step to generate `bold_font.1bpp`.
- Minor edits to the centralized acquisition texts.
- No charmap changes, no ROM-space pressure, no save-compatibility impact.

## Alternatives considered

- **Static second font:** impossible — no free tile space (see above).
- **Colored name (GBC palette trick):** render the name with color index 1/2 of the
  text palette and load a highlight color. Needs the same dynamic-tile machinery
  *plus* palette work; bold via the OR-shift is strictly simpler.
- **Quotes/brackets (`“LỌ THUỐC”`):** zero-engineering fallback, text edits only,
  but no visual weight.
