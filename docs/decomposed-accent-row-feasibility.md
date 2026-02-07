# Decomposed Accent Row — Feasibility Analysis

## Motivation

The current 8x8 tile glyphs make Vietnamese accented characters look cramped and ugly. Diacritical marks (sắc, huyền, hỏi, ngã, nặng) compete with the base letter and breve/circumflex/horn modifiers for vertical space within a single 8x8 pixel tile.

This document analyzes a **decomposed accent row** approach: keep 8x8 base glyphs but render tone marks in dedicated accent rows above/below each text line, using the gap rows that currently sit empty between text lines.

## The Concept

### Vietnamese Accent Decomposition

Each accented Vietnamese character can be decomposed into up to 3 components:

1. **Base glyph** (8x8 tile): The vowel letter, optionally with breve/circumflex/horn baked in
   - Simple vowels: a, e, i, o, u, y
   - Modified vowels: ă, â, ê, ô, ơ, ư (dedicated 8x8 tiles with the modifier shape built in)
   - These fit comfortably in 8x8 because the tone mark has been removed

2. **Above accent** (tone mark): sắc (´), huyền (\`), hỏi (̉), ngã (~)
   - Rendered in the accent row **above** the text line

3. **Below accent**: nặng (̣) — dot below
   - Rendered in the accent row **below** the text line

### Example: `ậ` = â (base) + nặng (below)

### Example: `ắ` = ă (base) + sắc (above)

### Compound Accent Row

The key insight: the gap row between two text lines is **shared**. Its top pixels display the nặng dot from the line above, and its bottom pixels display the tone mark for the line below.

This avoids wasting an extra row for each accent type.

## Textbox Layout

### Current Layout (6 tile rows)

```
Row 12: ┌──────────────────┐  (border)
Row 13: │                  │  (empty gap)
Row 14: │ Text line 1      │  (8px glyphs)
Row 15: │                  │  (empty gap)
Row 16: │ Text line 2      │  (8px glyphs)
Row 17: └──────────────────┘  (border)
```

### Proposed Layout (7 tile rows)

```
Row 11: ┌──────────────────┐  (border)
Row 12: │ ´  `  ̉   ˜       │  (tone marks above line 1)
Row 13: │ Bận              │  (base glyphs — line 1)
Row 14: │ ̣+´  ̣+˜           │  (compound: nặng from L1 + tone for L2)
Row 15: │ Bí               │  (base glyphs — line 2)
Row 16: │ ̣                  │  (nặng from line 2 only)
Row 17: └──────────────────┘  (border)
```

**Screen space cost:** +1 tile row (8px). Visible overworld shrinks from 96px to 88px.

### Row Functions

| Row | Function | Content |
|-----|----------|---------|
| 11 | Border (top) | `┌──────────────────┐` |
| 12 | Accent-above for line 1 | Tone marks only (bottom pixels of tile) |
| 13 | Text line 1 | Base glyphs (8x8) |
| 14 | Compound accent | Top pixels: nặng from L1 / Bottom pixels: tone mark for L2 |
| 15 | Text line 2 | Base glyphs (8x8) |
| 16 | Accent-below for line 2 | Nặng dots only (top pixels of tile) |
| 17 | Border (bottom) | `└──────────────────┘` |

## Accent Tile Inventory

Each accent tile is 8x8 pixels. The tile is divided into two zones:
- **Top half** (~3-4 pixels): nặng dot from line above
- **Bottom half** (~3-4 pixels): tone mark for line below

### All Possible Combinations

| # | Top (nặng) | Bottom (tone) | Used in Rows | Description |
|---|------------|---------------|-------------|-------------|
| — | (empty) | (empty) | 12, 14, 16 | Blank — reuse space tile `$7F` |
| 1 | (empty) | sắc (´) | 12, 14 | Acute accent only |
| 2 | (empty) | huyền (\`) | 12, 14 | Grave accent only |
| 3 | (empty) | hỏi (̉) | 12, 14 | Hook above only |
| 4 | (empty) | ngã (~) | 12, 14 | Tilde only |
| 5 | nặng (̣) | (empty) | 14, 16 | Dot below only |
| 6 | nặng (̣) | sắc (´) | 14 | Dot below + acute |
| 7 | nặng (̣) | huyền (\`) | 14 | Dot below + grave |
| 8 | nặng (̣) | hỏi (̉) | 14 | Dot below + hook |
| 9 | nặng (̣) | ngã (~) | 14 | Dot below + tilde |

**Total: 9 new accent tiles** + reuse of existing space tile = 10 unique tiles.

Note: tiles 1-4 (tone-only) are reused in both row 12 (accent-above) and row 14 (compound, when no nặng from line above). Tile 5 (nặng-only) is reused in both row 14 (compound, when no tone for line below) and row 16 (accent-below).

## VRAM Tile Budget

### Current System (128 tiles in `vTiles1`)

| Range | Count | Content |
|-------|-------|---------|
| `$80-$99` | 32 | a-z + `( ) : ; [ ]` |
| `$A0-$DF` | 64 | Precomposed accented vowels |
| `$E0-$EF` | 16 | Symbols, đ, é, punctuation |
| `$F0-$FF` | 16 | Currency, digits 0-9 |
| **Total** | **128** | **0 free tiles** |

### Proposed System — With Uppercase Restoration

Under decomposition, the 64 precomposed accented vowel slots (`$A0-$DF`) are freed. New tiles needed:

| Category | Lowercase | Uppercase | Tiles Needed |
|----------|-----------|-----------|-------------|
| A-Z letters | 26 (exist at `$80-$99`) | 26 (new) | 26 |
| ă, â, ê, ô, ơ, ư | 6 (new base variants) | 6 (new) | 12 |
| đ / Đ | 1 (exists at `$E5`) | 1 (new) | 1 |
| Accent tiles | — | — | 9 |
| **Total new tiles** | | | **48** |

48 ≤ 64 freed slots. **Fits with 16 tiles to spare.**

### Proposed Tile Map

| Range | Count | New Content |
|-------|-------|-------------|
| `$80-$99` | 32 | a-z lowercase + `( ) : ; [ ]` (unchanged) |
| `$A0-$B9` | 26 | **A-Z uppercase** |
| `$BA-$BF` | 6 | **Ă, Â, Ê, Ô, Ơ, Ư uppercase base variants** |
| `$C0-$C5` | 6 | **ă, â, ê, ô, ơ, ư lowercase base variants** |
| `$C6-$CE` | 9 | **Accent tiles (compound)** |
| `$CF-$DF` | 17 | **Free** (available for future use) |
| `$E0-$EF` | 16 | Symbols, đ/Đ, é, punctuation (mostly unchanged) |
| `$F0-$FF` | 16 | Currency, operators, digits (unchanged) |

### Key Benefit: Uppercase/Lowercase Restored

The current system sacrificed separate uppercase and lowercase (commit `f1f7ea4`) to fit Vietnamese accents. Under the decomposed approach, there is enough space to restore the uppercase/lowercase distinction — **a significant visual improvement** for the game.

## Character Decomposition Table

The text engine needs a lookup table to decompose precomposed character codes into (base glyph, above accent, has nặng). This table has 64 entries for the accented vowels:

| Character | Code | Base Glyph | Above Accent | Has Nặng |
|-----------|------|-----------|-------------|----------|
| á | $A0 | a | sắc | no |
| à | $A1 | a | huyền | no |
| ả | $A2 | a | hỏi | no |
| ã | $A3 | a | ngã | no |
| ạ | $A4 | a | (none) | yes |
| ă | $A5 | ă | (none) | no |
| ắ | $A6 | ă | sắc | no |
| ằ | $A7 | ă | huyền | no |
| ẳ | $A8 | ă | hỏi | no |
| ẵ | $A9 | ă | ngã | no |
| ặ | $AA | ă | (none) | yes |
| â | $AB | â | (none) | no |
| ấ | $AC | â | sắc | no |
| ầ | $AD | â | huyền | no |
| ẩ | $AE | â | hỏi | no |
| ẫ | $AF | â | ngã | no |
| ậ | $B0 | â | (none) | yes |
| è | $B1 | e | huyền | no |
| ẻ | $B2 | e | hỏi | no |
| ẽ | $B3 | e | ngã | no |
| ẹ | $B4 | e | (none) | yes |
| ê | $B5 | ê | (none) | no |
| ế | $B6 | ê | sắc | no |
| ề | $B7 | ê | huyền | no |
| ể | $B8 | ê | hỏi | no |
| ễ | $B9 | ê | ngã | no |
| ệ | $BA | ê | (none) | yes |
| í | $BB | i | sắc | no |
| ì | $BC | i | huyền | no |
| ỉ | $BD | i | hỏi | no |
| ĩ | $BE | i | ngã | no |
| ị | $BF | i | (none) | yes |
| ú | $C0 | u | sắc | no |
| ù | $C1 | u | huyền | no |
| ủ | $C2 | u | hỏi | no |
| ũ | $C3 | u | ngã | no |
| ụ | $C4 | u | (none) | yes |
| ư | $C5 | ư | (none) | no |
| ứ | $C6 | ư | sắc | no |
| ừ | $C7 | ư | huyền | no |
| ử | $C8 | ư | hỏi | no |
| ữ | $C9 | ư | ngã | no |
| ự | $CA | ư | (none) | yes |
| ó | $CB | o | sắc | no |
| ò | $CC | o | huyền | no |
| ỏ | $CD | o | hỏi | no |
| õ | $CE | o | ngã | no |
| ọ | $CF | o | (none) | yes |
| ô | $D0 | ô | (none) | no |
| ố | $D1 | ô | sắc | no |
| ồ | $D2 | ô | huyền | no |
| ổ | $D3 | ô | hỏi | no |
| ỗ | $D4 | ô | ngã | no |
| ộ | $D5 | ô | (none) | yes |
| ơ | $D6 | ơ | (none) | no |
| ớ | $D7 | ơ | sắc | no |
| ờ | $D8 | ơ | huyền | no |
| ở | $D9 | ơ | hỏi | no |
| ỡ | $DA | ơ | ngã | no |
| ợ | $DB | ơ | (none) | yes |
| ý | $DC | y | sắc | no |
| ỳ | $DD | y | huyền | no |
| ỷ | $DE | y | hỏi | no |
| ỹ | $DF | y | ngã | no |

**Storage:** 64 entries × 2 bytes (base glyph tile + accent flags byte) = **128 bytes in ROM**.

The accent flags byte could encode:
- Bits 0-2: above accent type (0=none, 1=sắc, 2=huyền, 3=hỏi, 4=ngã)
- Bit 3: has nặng (dot below)

## Text Engine Changes

### 1. `PlaceNextChar` — The `.place` Routine

**Current (1 instruction):**
```asm
.place
    ld [hli], a
    call PrintLetterDelay
    jp NextChar
```

**Proposed (pseudocode):**
```asm
.place
    ; Check if character is in accented range $A0-$DF
    cp $A0
    jr c, .plain_char
    cp $E0
    jr nc, .plain_char

    ; Decompose: look up (base, accent_flags) from table
    push de
    sub $A0                     ; index into table
    ld e, a
    ld d, 0
    ; de = index
    ; look up base glyph and accent flags from ROM table
    ; ... (load base into a, flags into b)
    pop de

    ; Place base glyph at current position
    ld [hl], base_glyph

    ; Write above accent at (hl - SCREEN_WIDTH)
    push hl
    ld bc, -SCREEN_WIDTH
    add hl, bc
    ; Read existing accent tile, combine with new tone mark
    ; Select correct compound tile from accent_tile_table
    ld [hl], accent_tile
    pop hl

    ; Write below nặng at (hl + SCREEN_WIDTH) if needed
    bit 3, flags
    jr z, .no_nang
    push hl
    ld bc, SCREEN_WIDTH
    add hl, bc
    ; Read existing accent tile, combine with nặng
    ld [hl], nang_accent_tile
    pop hl
.no_nang

    inc hl                      ; advance cursor
    call PrintLetterDelay
    jp NextChar

.plain_char
    ld [hli], a
    call PrintLetterDelay
    jp NextChar
```

**Estimated overhead:** ~30 additional instructions per accented character. Non-accented characters (a-z, digits, symbols) take the fast path with zero overhead.

### 2. `TextScroll` — Scrolling

Currently scrolls 1 tile row at a time, called twice for `<SCROLL>`/`<CONT>`.

With 7-row textbox (5 inner rows), scrolling needs to move the entire content block:
- Row 12 (accent L1) ← cleared
- Row 13 (text L1) ← Row 15 (text L2)
- Row 14 (compound) ← Row 16 (accent below L2), then rebuild as accent-above for new L2
- Row 15 (text L2) ← cleared (new text goes here)
- Row 16 (accent below L2) ← cleared

This is a more complex operation than the current simple row-copy, but still manageable. The compound row rebuild is the trickiest part — after scrolling, the new row 14 must serve as an accent-above row for the incoming line 2 text.

### 3. `<NEXT>` Line Advancement

Current: `ld bc, SCREEN_WIDTH * 2` — advances 2 tile rows.

With the new layout:
- Text L1 at row 13, Text L2 at row 15 → still 2 rows apart.
- **No change needed.** The `SCREEN_WIDTH * 2` offset still works.

### 4. `<LINE>` Direct Jump

Current: `hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY + 2`

Would need to change to point to the new text L2 row. Depending on constant definitions:
- If `TEXTBOX_INNERY` = first inner row (accent row 12): change to `TEXTBOX_INNERY + 3`
- If `TEXTBOX_INNERY` = first text row (row 13): no change needed (`+ 2` still lands on row 15)

### 5. `Paragraph` / `ClearBox`

Must clear all 5 inner rows (including accent rows) instead of current 3-4 rows. Minor constant adjustment.

### 6. `TextboxBorder`

Change `TEXTBOX_HEIGHT` from 6 to 7. Change `TEXTBOX_INNERH` from 4 to 5. The border drawing code is generic and will adapt automatically.

## Non-Textbox Contexts — The Hard Part

`PlaceString` is used throughout the game in many contexts beyond the dialog textbox:

| Context | Has Accent Rows? | Notes |
|---------|-------------------|-------|
| Dialog textbox | Yes (proposed) | Primary use case |
| Battle move selection | Maybe | Currently uses 1-row spacing between moves |
| Party Pokemon list | Maybe | Names listed vertically with gaps |
| Bag/item list | Maybe | Item names listed vertically |
| Stat screen | Tight | Labels like "Attack", "Defense" in fixed positions |
| Pokemon naming screen | Tight | Character grid layout |
| Map name popup | Separate font | Uses `overworld.png`, different system |
| Battle HUD (HP bars, names) | Very tight | Minimal space available |
| Menu headers | Single line | No accent row above border |

### Possible Approaches

**Option A: Dual rendering mode**
- Textboxes use decomposed accents (pretty)
- Tight UI contexts keep precomposed glyphs (current look)
- Requires keeping both precomposed and decomposed tiles in VRAM simultaneously
- May not have VRAM space for both sets

**Option B: Universal accent rows**
- Redesign ALL text-displaying contexts to include accent rows
- Very invasive, but ensures consistent visual quality
- Some contexts (battle HUD) may not have room

**Option C: Selective decomposition**
- Only decompose in the dialog textbox and menus that have natural gaps
- Accept that some contexts (stat screen, battle HUD) use the current look
- Pragmatic middle ground

## Comparison with 8x16 Approach

| Criteria | 8x16 Tiles | Decomposed Accent Rows |
|----------|-----------|----------------------|
| VRAM usage | 256 tiles (hard blocker) | ~86 tiles (comfortable) |
| Screen space cost | +16px (2 rows) | +8px (1 row) |
| Line spacing preserved | No (`<NEXT>` must change) | **Yes** (stays `SCREEN_WIDTH * 2`) |
| Text engine changes | Every char writes 2 tiles | Only accented chars ($A0-$DF) need extra logic |
| Scrolling complexity | Major rewrite | Moderate rewrite |
| Non-textbox impact | All contexts affected | Can be selective |
| Uppercase restoration | No room | **Yes — 16+ tiles to spare** |
| Font VRAM freed | -128 tiles (doubles usage) | **+42 tiles freed** |
| Accent visual quality | Excellent (16px tall) | Good (accent in adjacent row, ~4px) |

## Risks and Open Questions

1. **Accent visual alignment:** With accents in a separate tile row, they may not align perfectly with the base character. The accent needs to appear centered above/below the correct vowel within a word, but the accent tile covers the entire column — it will look correct as long as the tone mark glyph is horizontally centered in the 8x8 tile (which it should be, since base glyphs are also monospaced).

2. **Multi-vowel words:** Words like "người" have multiple vowels. Each column independently gets its accent tile, so this works naturally — "ườ" would have accent tiles at the ư column and the ờ column independently.

3. **Scrolling compound rebuild:** After a scroll, the compound accent row must be rebuilt correctly. If the new line 1 (previously line 2) had nặng dots, those must be preserved in the compound row while the tone marks from the incoming line 2 are added character-by-character.

4. **PlaceString outside textboxes:** The biggest engineering risk. Need an audit of every `PlaceString` call site to determine which contexts can support accent rows.

5. **Link cable compatibility:** The charmap byte codes would change significantly. The link cable translation layer (`engine/link/link_trade_text.asm`) would need updates to handle the new tile mapping for trading with English Crystal.

## Estimated Effort

| Component | Effort | Risk |
|-----------|--------|------|
| New font PNG files (base glyphs + accents) | 1-2 days | Low |
| Charmap restructuring | 1 day | Low |
| Decomposition lookup table | 0.5 days | Low |
| `PlaceNextChar` accent logic | 1-2 days | Medium |
| `TextScroll` rewrite | 1-2 days | Medium |
| Textbox constants/layout | 0.5 days | Low |
| Non-textbox context audit + fixes | 3-5 days | High |
| Link cable translation updates | 1-2 days | Medium |
| Testing across all game contexts | 2-3 days | Medium |
| **Total** | **~2-3 weeks** | |

## Recommendation

This approach is **feasible and significantly more practical than 8x16 tiles**. The VRAM budget is comfortable, the line spacing is preserved, and the change is less invasive than a full 8x16 rewrite.

The main risk is the non-textbox context problem, which can be managed with a pragmatic "selective decomposition" approach (Option C) — apply accent rows only in contexts that naturally support them, and keep the current precomposed rendering in tight UI contexts.

The bonus of restoring uppercase/lowercase distinction makes this approach even more attractive.

### Next Steps (if proceeding)

1. Design and draw the new font PNG with base glyphs + accent tiles
2. Prototype the `PlaceNextChar` accent decomposition logic
3. Adjust textbox constants and test in the dialog system
4. Audit all `PlaceString` call sites for accent row compatibility
5. Update `TextScroll` and other text engine functions
6. Update link cable translation layer
7. Full game testing
