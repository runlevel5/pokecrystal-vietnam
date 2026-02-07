# Current 8x8 Font Solution — Design & Trade-offs

## Overview

The Vietnamese localization of Pokemon Crystal uses a **single-case 8x8 tile font** system where all 65 Vietnamese accented characters, 26 Latin letters, and essential symbols are squeezed into the Game Boy's 128-tile font space. This was achieved by eliminating the uppercase/lowercase distinction present in the original English version.

This document describes the current solution, its trade-offs, and why it was chosen over two alternative approaches.

## The Core Problem

Vietnamese requires 65 unique accented characters beyond the basic Latin alphabet:

- **5 tone marks** (dấu): sắc (´), huyền (\`), hỏi (̉), ngã (~), nặng (̣)
- **6 modified base vowels**: ă, â, ê, ô, ơ, ư
- **1 modified consonant**: đ
- These combine into **64 accented vowel characters** (á, à, ả, ã, ạ, ắ, ằ, ..., ỹ) plus đ = **65 characters**

The Game Boy's font system provides only **128 tile slots** in VRAM (`vTiles1` at `$8800-$8FFF`). The original English Crystal uses these as:

| Range | Count | English Content |
|-------|-------|-----------------|
| `$80-$99` | 26 | Uppercase A-Z |
| `$9A-$9F` | 6 | `( ) : ; [ ]` |
| `$A0-$B9` | 26 | Lowercase a-z |
| `$BA-$C5` | 12 | German umlauts (Ä Ö Ü ä ö ü) + unused |
| `$C6-$DF` | 26 | English contractions ('d 'l 'm 'r 's 't 'v) + unused |
| `$E0-$EF` | 16 | Symbols, punctuation, arrows |
| `$F0-$FF` | 16 | Currency, digits 0-9 |

Vietnamese needs 65 new character slots. There are only ~38 "disposable" slots (German umlauts, contractions, unused). That's 27 slots short.

## The Solution: Single-Case System

**Key commit:** `f1f7ea4` — "Add Vietnamese support — Get rid of the uppercase and lowercase English chars so we could squeeze in all accented Vietnamese chars"

The solution eliminates the uppercase/lowercase distinction:

1. **Lowercase a-z occupies `$80-$99`** (where uppercase A-Z was in English)
2. **Both uppercase and lowercase map to the same byte codes** via charmap aliases:
   ```asm
   charmap "a", $80
   charmap "A", $80  ; same code
   charmap "b", $81
   charmap "B", $81  ; same code
   ; ... etc
   ```
3. **The freed range `$A0-$DF` (64 slots)** is filled with Vietnamese accented characters, organized by vowel family:

### Vietnamese Font Tile Layout

```
Row 0 ($80-$8F): a b c d e f g h i j k l m n o p
Row 1 ($90-$9F): q r s t u v w x y z ( ) : ; [ ]
Row 2 ($A0-$AF): á à ả ã ạ ă ắ ằ ẳ ẵ ặ â ấ ầ ẩ ẫ
Row 3 ($B0-$BF): ậ è ẻ ẽ ẹ ê ế ề ể ễ ệ í ì ỉ ĩ ị
Row 4 ($C0-$CF): ú ù ủ ũ ụ ư ứ ừ ử ữ ự ó ò ỏ õ ọ
Row 5 ($D0-$DF): ô ố ồ ổ ỗ ộ ơ ớ ờ ở ỡ ợ ý ỳ ỷ ỹ
Row 6 ($E0-$EF): ' PK MN -  ← đ  ?  !  .  &  é  →  ▷  ▶  ▼  ♂
Row 7 ($F0-$FF): ¥  ×  .  /  ,  ♀  0  1  2  3  4  5  6  7  8  9
```

### Character Inventory

| Range | Count | Content |
|-------|-------|---------|
| `$80-$99` | 26 | a-z (single-case Latin letters) |
| `$9A-$9F` | 6 | `( ) : ; [ ]` |
| `$A0-$B0` | 17 | a-family: á à ả ã ạ ă ắ ằ ẳ ẵ ặ â ấ ầ ẩ ẫ ậ |
| `$B1-$BA` | 10 | e-family: è ẻ ẽ ẹ ê ế ề ể ễ ệ |
| `$BB-$BF` | 5 | i-family: í ì ỉ ĩ ị |
| `$C0-$CA` | 11 | u-family: ú ù ủ ũ ụ ư ứ ừ ử ữ ự |
| `$CB-$DB` | 17 | o-family: ó ò ỏ õ ọ ô ố ồ ổ ỗ ộ ơ ớ ờ ở ỡ ợ |
| `$DC-$DF` | 4 | y-family: ý ỳ ỷ ỹ |
| `$E0-$EF` | 16 | Symbols: `' PK MN - ← đ ? ! . & é → ▷ ▶ ▼ ♂` |
| `$F0-$FF` | 16 | `¥ × . / , ♀ 0 1 2 3 4 5 6 7 8 9` |
| **Total** | **128** | **0 free tiles** |

### Removal of ỵ

**Key commit:** `9428cb5` — "Reorganize Vietnamese font to trading-compatible layout"

The character ỵ (y with dot below) was removed to free one tile slot during the font reorganization. Justification:

- **Extremely rare** in Vietnamese — only appears in "ghen tỵ" (jealousy), which can be written as "ghen tị" instead
- **Violates standard Vietnamese orthography** — a syllable can only have one tone mark, but ỵ combines two diacritical modifications
- **Not part of modern standard Vietnamese typography**
- The one occurrence in the game text (`maps/Route14.asm`) was updated from "ghen tỵ" to "ghen tị"

## Link Cable Trading Backward Compatibility

A critical design goal: Vietnamese Crystal must be able to **trade Pokemon and battle** with unmodified English Crystal over the Game Boy link cable. This required careful engineering at two levels.

### Level 1: Trading-Compatible Tile Layout

**Key commit:** `9428cb5`

The `$80-$9F` range was deliberately made **byte-identical** to English Crystal:

| Code | English Crystal | Vietnamese Crystal |
|------|----------------|-------------------|
| `$80` | A (uppercase) | a (single-case) |
| `$81` | B | b |
| ... | ... | ... |
| `$99` | Z | z |
| `$9A` | ( | ( |
| `$9B` | ) | ) |
| `$9C` | : | : |
| `$9D` | ; | ; |
| `$9E` | [ | [ |
| `$9F` | ] | ] |

This means Pokemon names using basic Latin characters (e.g., "PIKACHU" = `$8F $88 $8A $80 $82 $87 $94`) are stored as **identical byte sequences** in both versions. They display correctly on both games without any translation — uppercase "PIKACHU" on English, lowercase "pikachu" on Vietnamese. The visual difference (case) is acceptable because the glyphs are recognizable either way.

### Level 2: Bidirectional Translation Layer

For characters outside the shared `$80-$9F` range, a translation layer converts text on-the-fly during link cable communication.

**Files:**
- `engine/link/link_trade_text.asm` — Translation functions
- `engine/link/link.asm` — Language detection and dispatch hooks
- `constants/serial_constants.asm` — `LANG_VN_BYTE1 = $55`, `LANG_VN_BYTE2 = $AA`

#### Language Detection

Vietnamese Crystal uses a **two-layer detection system** to identify the peer's language during link cable communication:

1. `FixDataForLinkTransfer` places `$55` as the first random byte after the `$FD` preamble
2. After receiving peer RN data, scan for `$55`
3. If found → peer is Vietnamese, set `wPeerLanguage = LANG_VN`
4. If not found → peer is English, set `wPeerLanguage = LANG_EN`
5. After receiving party data, backup check: verify `$55 $AA` at offsets 9-10 of the received player name field to confirm or correct the RN-based detection

A single byte is used for the RN signature because 2-byte RN signatures caused unpredictable behavior in VN↔VN trading due to variable sync timing. The backup name field check (mirroring the technique used by European G/S/C for mail nationality detection) uses a reliable 2-byte signature to eliminate false positives for incoming translation.

#### Outgoing Translation (Vietnamese to English)

`TranslateVietnameseToEnglish` maps each accented character family to its base English letter:

| Vietnamese Range | Base Letter | Example |
|------------------|------------|---------|
| `$A0-$B0` (a-family) | `$80` (a/A) | ắ → a |
| `$B1-$BA` (e-family) | `$84` (e/E) | ế → e |
| `$BB-$BF` (i-family) | `$88` (i/I) | ị → i |
| `$C0-$CA` (u-family) | `$94` (u/U) | ứ → u |
| `$CB-$DB` (o-family) | `$8E` (o/O) | ờ → o |
| `$DC-$DF` (y-family) | `$98` (y/Y) | ỷ → y |
| `$E5` (đ) | `$83` (d/D) | đ → d |

**Result:** A Pokemon nicknamed "Rồng" (dragon) on Vietnamese Crystal appears as "Rong" on English Crystal.

#### Incoming Translation (English to Vietnamese)

`TranslateEnglishToVietnamese` handles the reverse problem. In English Crystal, lowercase a-z uses codes `$A0-$B9`. But in Vietnamese Crystal, `$A0-$B9` are accented characters (á, à, ả, ..., ễ, ệ). Without translation, "Pikachu" received from English Crystal would display as "Piáàảãạ" — garbage.

The fix: subtract `$20` from codes in the `$A0-$B9` range, converting them to `$80-$99` (the Vietnamese a-z range).

#### Conditional Application

`Link_FixDataForPeerLanguage` checks `wPeerLanguage`:
- **VN ↔ VN:** No translation. Both peers use the same character layout, so all Vietnamese accented characters are preserved perfectly.
- **VN ↔ EN:** Apply outgoing translation to player name, OT names, and all Pokemon nicknames before transmitting. Apply incoming translation after receiving.

The translated data includes:
- Player name (11 bytes)
- 6 Original Trainer names (6 × 11 bytes)
- 6 Pokemon nicknames (6 × 11 bytes)

### Trading Behavior Summary

| Scenario | What Happens | Visual Result |
|----------|-------------|---------------|
| VN sends "PIKACHU" to EN | No translation needed (shared `$80-$9F` range) | EN sees "PIKACHU" |
| VN sends "Rồng" to EN | Accented chars translated to base letters | EN sees "Rong" |
| EN sends "Dragon" to VN | EN lowercase (`$A0-$B5`) shifted to VN codes (`$80-$95`) | VN sees "dragon" |
| VN sends "Rồng" to VN | No translation (both are Vietnamese) | VN sees "Rồng" |

## Pros and Cons of the Current 8x8 Solution

### Pros

1. **Zero changes to the rendering engine.** The text engine (`PlaceNextChar`) still does `ld [hli], a` — one instruction per character. No lookup tables, no multi-tile writes, no accent row management. The character code IS the tile index, exactly as in the original game.

2. **Zero changes to textbox layout.** The 6-row textbox, 2-line text display, `SCREEN_WIDTH * 2` line spacing, scrolling, and all menu rendering code remain untouched. No screen space is lost.

3. **Zero changes to tile addressing.** The direct charcode-to-tile mapping is preserved. No VRAM bank tricks, no dynamic tile loading, no mapping tables needed.

4. **Full backward compatibility.** Trading and battling with English Crystal works correctly via the translation layer. The `$80-$9F` shared range means basic Latin names need zero translation.

5. **Simple implementation.** The entire font change was achieved by editing the charmap file and the font PNG images. The core game engine code was not modified for font rendering at all.

6. **Both font files (dialog + overworld) use the same layout.** The `font.png` (1bpp, for dialog) and `overworld.png` (2bpp, for map name popups) share the same character positions, so the same charmap works for both.

### Cons

1. **Accented characters look cramped.** Fitting a base vowel + modifier (breve/circumflex/horn) + tone mark (sắc/huyền/hỏi/ngã) + dot below (nặng) into 8x8 pixels produces visually poor results. Characters like ặ, ậ, ệ, ộ, ợ, ự are especially difficult to read.

2. **No uppercase/lowercase distinction.** All text renders in a single case (visually lowercase). This reduces readability for proper nouns, sentence beginnings, and ALL-CAPS game terms. English text like "PIKACHU" and "pikachu" look identical.

3. **Removed ỵ character.** While extremely rare, this is technically an incomplete character set.

4. **Font table is completely full.** All 128 tile slots are used. There is zero room for additional characters, symbols, or visual improvements without removing something else.

## Three Approaches Considered

### Approach 1: 8x16 Tiles (Double-Height Glyphs)

Each character uses two vertically-stacked 8x8 tiles (16px tall), providing ample vertical space for all diacritical marks.

**Why it was not chosen:**
- **VRAM hard blocker.** 128 characters × 2 tiles = 256 tiles = the entire addressable tile space. Zero tiles remain for textbox borders, battle HUD icons, bold letters, or any other UI element.
- **Massive engine rewrite.** Every character placement (`ld [hli], a`) must write 2 tiles. `PlaceNextChar`, `PlaceString`, `ClearBox`, `TextScroll`, all menu rendering, and dozens of `hlcoord` references must be modified.
- **Textbox must grow.** From 6 to 8 tile rows, losing 16px of visible game area.
- **Scrolling breaks.** `TextScroll` copies 1 tile row at a time; 8x16 characters would produce torn glyphs during scroll.

Full analysis: [8x16 Font Feasibility](8x16-font-feasibility.md)

### Approach 2: Decomposed Accent Rows

Keep 8x8 base glyphs but move tone marks to dedicated accent rows in the tilemap. The gap rows between text lines (currently blank) become functional accent display rows. A shared "compound" accent row between two text lines combines the dot-below from the line above with the tone mark for the line below.

**Why it was not chosen (yet — under consideration):**
- **Moderate engine changes.** `PlaceNextChar` needs accent decomposition logic (~30 extra instructions per accented character), plus a 128-byte lookup table in ROM.
- **Textbox grows by 1 row** (6→7), losing 8px of game area.
- **Non-textbox contexts are hard.** `PlaceString` is used in battle screens, menus, stat pages, party lists — contexts that don't have accent rows. Each would need adaptation or a fallback to precomposed rendering.
- **Scrolling needs rework.** Compound accent rows must be rebuilt after each scroll operation.
- **Positive trade-off:** This approach would free ~50 tile slots, enough to restore the uppercase/lowercase distinction.

Full analysis: [Decomposed Accent Row Feasibility](decomposed-accent-row-feasibility.md)

### Approach 3: Single-Case 8x8 Precomposed (Current Solution) ✓

Squeeze all accented characters into 8x8 tiles by eliminating the uppercase/lowercase distinction.

**Why this was chosen:**
- **Least disruptive to the rendering engine.** Zero changes to `PlaceNextChar`, `PlaceString`, `TextScroll`, `ClearBox`, `TextboxBorder`, all menu rendering, battle UI, or any other text display code. The character code is the tile index — the fundamental assumption of the entire text engine is preserved.
- **Zero screen space cost.** The textbox and all UI layouts remain identical to the original English game.
- **Proven backward compatibility.** The trading-compatible `$80-$9F` range and bidirectional translation layer have been tested and work correctly for VN↔EN and VN↔VN link cable communication.
- **Minimal risk.** The change is confined to the charmap definition and font image files. If something goes wrong, the blast radius is limited to visual appearance, not game logic.
- **Acceptable trade-off.** While accented characters are cramped, the game is playable and all Vietnamese text is readable. The uppercase/lowercase loss is mitigated by the fact that the game already used ALL-CAPS for most important terms (Pokemon names, item names, move names).

## Technical Implementation Details

### Font Storage and Loading

| Aspect | Value |
|--------|-------|
| Font format in ROM | 1bpp (8 bytes per tile) |
| Font format in VRAM | 2bpp (16 bytes per tile, doubled from 1bpp on load) |
| VRAM location | `vTiles1` at `$8800-$8FFF` |
| Total tiles | 128 |
| Total ROM size | 1,024 bytes (font.1bpp) |
| Total VRAM size | 2,048 bytes (after 1bpp→2bpp doubling) |
| Load function | `_LoadStandardFont` in `engine/gfx/load_font.asm` |
| Doubling mechanism | `FarCopyBytesDouble` — writes each source byte twice |

### 1bpp to 2bpp Conversion

The font is stored as 1bpp to save ROM space. During loading, each byte is written twice into VRAM:

```asm
; From FarCopyBytesDouble in home/gfx.asm
.loop
    ld a, [de]     ; read 1 byte from 1bpp source
    inc de
    ld [hli], a    ; write as bitplane 0
    ld [hli], a    ; write same byte as bitplane 1 (doubling)
    dec c
    jr nz, .loop
```

This produces a 2-color rendering: pixels that are "1" in the source become palette color 3 (darkest), pixels that are "0" become palette color 0 (lightest).

### Charmap Architecture

The charmap (`versions/crystal-vn/constants/charmap.asm`) serves as the assembler-time mapping from UTF-8 source text to byte codes:

```asm
; Both cases map to the same code
charmap "a", $80
charmap "A", $80

; Vietnamese accented characters
charmap "á", $a0
charmap "Á", $a0  ; uppercase alias → same code

; The assembler converts source text like:
;   db "Bạn khoẻ không?"
; Into byte sequence:
;   $81 $a4 $8d $7f $8a $87 $8e $b2 $7f $8a $87 $8e $8d $86 $e6
```

### Two Font Files, Same Layout

| Font File | Format | Used For |
|-----------|--------|----------|
| `font.png` / `font.1bpp` | 1bpp, 128x64px | Dialog boxes, menus, battle text |
| `overworld.png` / `overworld.2bpp` | 2bpp, 128x64px | Map name sign popups |

Both files contain the same 128 characters in the same positions, ensuring the charmap works consistently regardless of which font is loaded.

## Historical Timeline

| Date | Commit | Milestone |
|------|--------|-----------|
| Jan 30 | `f1f7ea4` | Single-case system: removed upper/lowercase to fit Vietnamese |
| Jan 30 | `f864a85` | Added uppercase Vietnamese charmap aliases |
| Feb 2 | `9e0a45d` | Intermediate font layout reorganization |
| Feb 2 | `9428cb5` | Trading-compatible layout: `$80-$9F` matches English; removed ỵ; vowel family grouping |
| Feb 2 | `bdc8045` | Initial VN→EN translation layer |
| Feb 4 | `c242dd7` | Bidirectional translation (added EN→VN) |
| Feb 5 | `f9f1dbf` | Language detection (`LANG_VN = $55` in RN exchange; later enhanced to 2-byte `$55 $AA` with name field backup) |
| Feb 5 | `200346b` | Fixed VN↔VN trading (preserve accents); `Link_FixDataForPeerLanguage` |
| Feb 5 | `4455c2c` | On-the-fly player name translation; removed `wTradeName` buffer |
| Feb 5 | `170e8fb` | Full Vietnamese input for Pokemon nicknames |

## See Also

- [8x16 Font Feasibility](8x16-font-feasibility.md) — Analysis of double-height glyph approach
- [Decomposed Accent Row Feasibility](decomposed-accent-row-feasibility.md) — Analysis of separate accent row approach
