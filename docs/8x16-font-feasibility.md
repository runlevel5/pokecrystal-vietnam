# 8x16 Font Feasibility Analysis for GBC VRAM

## Motivation

The current 8x8 tile glyphs make Vietnamese accented characters look cramped and ugly due to the limited vertical space for diacritical marks. This document analyzes whether 8x16 (8px wide, 16px tall) character glyphs are a viable solution.

## Current State

| Aspect | Value |
|--------|-------|
| Font tile size | 8x8 pixels |
| Font format | 1bpp (8 bytes/tile), doubled to 2bpp (16 bytes/tile) on load |
| Total glyphs | 128 (stored in `gfx/font/font.png`, 128x64px) |
| VRAM location | `vTiles1` at `$8800-$8FFF` (128 tiles, 2048 bytes) |
| Tile-to-char mapping | Direct — the charcode byte IS the VRAM tile index (no lookup table) |

### Character Set Breakdown (from `charmap.asm`)

| Range | Count | Characters |
|-------|-------|------------|
| `$80-$99` | 26 | a-z (lowercase, single-case system) |
| `$9A-$9F` | 6 | `( ) : ; [ ]` |
| `$A0-$DF` | 64 | Vietnamese accented vowels (á à ả ã ạ ă ắ ằ...) |
| `$E0-$EF` | 16 | Symbols, đ, é, punctuation, arrows, gender |
| `$F0-$FF` | 16 | Currency, operators, comma, digits 0-9 |
| **Total** | **128** | **unique displayable glyphs** |

Uppercase A-Z and uppercase Vietnamese characters are aliases mapping to the same byte values as their lowercase counterparts.

## GBC VRAM Architecture

### VRAM Bank 0 Layout

| Region | Address | Tiles | Current Usage |
|--------|---------|-------|---------------|
| `vTiles0` | `$8000-$87FF` | 128 | Sprites, Pokemon graphics |
| `vTiles1` | `$8800-$8FFF` | 128 | **Main text font (128 glyphs)** |
| `vTiles2` | `$9000-$97FF` | 128 | UI extras (~32 used): bold letters, textbox frame, battle HUD, icons |
| `vBGMap0` | `$9800-$9BFF` | — | BG tilemap 0 |
| `vBGMap1` | `$9C00-$9FFF` | — | BG tilemap 1 |

### VRAM Bank 1 Layout (GBC-only)

| Region | Address | Tiles | Current Usage |
|--------|---------|-------|---------------|
| `vTiles3` | `$8000-$87FF` | 128 | Color attribute data / Pokemon graphics |
| `vTiles4` | `$8800-$8FFF` | 128 | Color attribute data |
| `vTiles5` | `$9000-$97FF` | 128 | Color attribute data |
| `vBGMap2` | `$9800-$9BFF` | — | BG attribute map 0 |
| `vBGMap3` | `$9C00-$9FFF` | — | BG attribute map 1 |

### Key Hardware Constants

```
TILE_WIDTH      = 8 pixels
TILE_HEIGHT     = 8 pixels
TILE_SIZE       = 16 bytes (2bpp)
TILE_1BPP_SIZE  = 8 bytes
SCREEN_WIDTH    = 20 tiles (160px)
SCREEN_HEIGHT   = 18 tiles (144px)
```

### BG Tile Addressing

Pokemon Crystal uses the `$8800` addressing mode (LCDC bit 4 = 0):
- Tile indices `$00-$7F` → `vTiles2` (`$9000-$97FF`)
- Tile indices `$80-$FF` → `vTiles1` (`$8800-$8FFF`)
- **Total addressable tiles per tilemap: 256**

## VRAM Budget for 8x16

With 8x16, each character glyph requires **2 vertically-stacked 8x8 tiles** (the GBC has no native 8x16 BG tile mode — that mode only exists for sprites).

| Resource | 8x8 (current) | 8x16 (proposed) |
|----------|---------------|-----------------|
| Tiles per glyph | 1 | 2 |
| Total tiles for 128 glyphs | 128 | **256** |
| `vTiles1` capacity | 128 tiles | 128 tiles |
| `vTiles2` capacity (free) | ~96 tiles | ~96 tiles |
| Total addressable (Bank 0) | 256 tiles | 256 tiles |

### Verdict: HARD BLOCKER

128 glyphs × 2 tiles = **256 tiles** = the **entire** addressable tile space. This leaves **zero tiles** for:
- Textbox borders (6 tiles: `┌ ─ ┐ │ └ ┘`)
- Bold letters (22 tiles)
- Battle HUD icons (25 tiles: LV, arrows, ID, etc.)
- Space tile
- Other UI elements

**Without mitigation, naive 8x16 does not fit.**

## Textbox Layout Impact

### Current Textbox (6 tile rows)

```
Row 12: ┌──────────────────┐  (border)
Row 13: │                  │  (empty gap)
Row 14: │ Text line 1      │  (8px tall glyphs)
Row 15: │                  │  (empty gap)
Row 16: │ Text line 2      │  (8px tall glyphs)
Row 17: └──────────────────┘  (border)
```

- Inner height: 4 tile rows = 32 pixels
- Text lines: 2 (at rows 14 and 16)
- Line spacing: 2 tile rows (16px) via `SCREEN_WIDTH * 2` offset

### With 8x16 Glyphs (keeping 6-row textbox)

```
Row 12: ┌──────────────────┐  (border)
Row 13: │ ████████████████ │  (line 1 TOP half)
Row 14: │ ████████████████ │  (line 1 BOTTOM half)
Row 15: │ ████████████████ │  (line 2 TOP half)
Row 16: │ ████████████████ │  (line 2 BOTTOM half)
Row 17: └──────────────────┘  (border)
```

- 2 lines of 8x16 text = 32px = exactly fills the 4 inner rows
- **No spacing between lines** — text is crammed together
- Line 2 bottom butts directly against the border

### With 8x16 Glyphs (enlarged 8-row textbox)

```
Row 10: ┌──────────────────┐  (border)
Row 11: │                  │  (gap)
Row 12: │ ████████████████ │  (line 1 TOP half)
Row 13: │ ████████████████ │  (line 1 BOTTOM half)
Row 14: │                  │  (gap between lines)
Row 15: │ ████████████████ │  (line 2 TOP half)
Row 16: │ ████████████████ │  (line 2 BOTTOM half)
Row 17: └──────────────────┘  (border)
```

- Comfortable spacing between lines
- **Cost**: Textbox grows from 6→8 tile rows, reducing visible game area by 16px (96px→80px)

## Text Engine Impact

### Character Placement

Current (`PlaceNextChar`):
```asm
.place
    ld [hli], a         ; write 1 tile index, advance right
    call PrintLetterDelay
    jp NextChar
```

Would need to become something like:
```asm
.place
    ld [hl], a          ; write top-half tile
    push hl
    ld bc, SCREEN_WIDTH
    add hl, bc
    ld [hl], a_bottom   ; write bottom-half tile
    pop hl
    inc hl              ; advance right
    call PrintLetterDelay
    jp NextChar
```

### Affected Systems

| System | Change Required | Scope |
|--------|----------------|-------|
| **Tile data:** Each glyph needs 2 tiles (top + bottom half) loaded into VRAM | New font format, double VRAM usage | High |
| **`PlaceNextChar` / `.place`:** Write 2 tile indices per character (current position and position + SCREEN_WIDTH) | Modify core text renderer | High |
| **`ClearBox`:** Must clear both halves of character positions | Modify core function | Medium |
| **`TextScroll`:** Must scroll 2 rows atomically, or redesign | Modify scroll routine | High |
| **Textbox height:** Would need to increase from 6 to at least 8 tile rows (or accept only 1 line of text) | Changes overall screen layout, reduces overworld visibility | High |
| **`TEXTBOX_INNERY + 2`:** All hardcoded references to line 2 at `+2` would need to change to `+3` or `+4` if the box is enlarged | ~20+ locations across the codebase | Medium |
| **Menu system:** `2 * SCREEN_WIDTH` row spacing would need to become `3 * SCREEN_WIDTH` or `4 * SCREEN_WIDTH` | All menu rendering code | High |
| **`w2DMenuCursorOffsets`:** Row spacing nibble ($20) would need updating | Multiple locations | Medium |
| **VRAM tile management:** Need a strategy for fitting 2x the tiles | May need bank switching or reduced character set | Very High |
| **Battle UI:** Move selection, HP bars, and other battle elements that share the screen with text | Careful layout redesign | High |

## Possible Workarounds

### Option A: VRAM Bank 1 for Bottom Halves

Store top-half tiles in Bank 0, bottom-half tiles in Bank 1. Use the BG attribute map to select the correct VRAM bank per tile row.

**Pros:**
- Doubles available tile space
- No need to reduce character set

**Cons:**
- Pokemon Crystal already uses Bank 1 for color/palette attributes
- Mixing bank selection per-tile in the BG attribute map is complex
- Every tilemap write must also update the attribute map
- May conflict with existing color system

### Option B: Reduced Character Set

Cut the glyph count to ~100, freeing space for UI tiles (200 font tiles + 56 UI tiles = 256).

**Pros:**
- Simplest VRAM solution

**Cons:**
- Would need to remove some Vietnamese characters — defeats the purpose
- Very tight margin

### Option C: Dynamic Tile Loading (Tile Cache)

Only load the glyphs actually needed for the current screen into VRAM. A typical text frame uses ~30-40 unique characters, requiring only 60-80 tiles at 8x16.

**Pros:**
- Most flexible — unlimited character set from ROM
- Only 60-80 tiles needed at any time, leaving plenty of room for UI
- Used by some GBC games with large character sets (Japanese RPGs with kanji)

**Cons:**
- Most complex to implement
- Need a tile allocation/deallocation system
- Character codes can no longer directly index VRAM — need a mapping table
- Must reload tiles when new text appears
- Performance considerations during VBlank tile loading

### Option D: Hybrid 8x8 + 8x16

Use 8x16 only for accented Vietnamese characters (`$A0-$DF`, 64 chars = 128 tiles) and keep a-z, digits, symbols as 8x8.

**Pros:**
- Targets the actual problem (accented chars are ugly, not base letters)
- Reduces VRAM cost: 128 (accented, 8x16) + 64 (base, 8x8) = 192 tiles

**Cons:**
- Mixed-height rendering is very complex
- Accented characters would be taller than base characters — visual inconsistency
- Text engine must handle both modes per character

### Option E: VWF (Variable Width Font) Engine

Instead of 8x16 tiles, implement a pixel-based Variable Width Font renderer that draws characters directly into a tile buffer. Characters can be any height (e.g., 12px or 14px).

**Pros:**
- Maximum visual quality — proportional spacing, optimal height
- Used by many GBA/GBC translations and homebrew
- Full control over glyph rendering
- Can dynamically generate only the tiles needed for current text
- Naturally solves the VRAM budget problem (like Option C)

**Cons:**
- Essentially a complete rewrite of the text rendering engine
- CPU-intensive — must render pixels to tiles in software
- Well-documented technique with existing reference implementations

## Comparison Matrix

| Criteria | A: Bank 1 | B: Reduced Set | C: Dynamic Load | D: Hybrid | E: VWF |
|----------|-----------|----------------|-----------------|-----------|--------|
| VRAM fits? | Yes | Barely | Yes | Yes | Yes |
| Visual quality | Good | Good | Good | Mixed | Best |
| Complexity | High | Low | High | Very High | Very High |
| Engine changes | Medium | Low | High | Very High | Complete rewrite |
| Character set preserved? | Yes | No | Yes | Yes | Yes |
| Estimated effort | 2-3 weeks | 1 week | 3-4 weeks | 4+ weeks | 4-6 weeks |

## Recommendation

**Option C (Dynamic Tile Loading)** is the most practical path if 8x16 is pursued. It solves the VRAM budget cleanly, preserves the full character set, and is a well-understood technique in the GBC homebrew community.

**Option E (VWF)** produces the best visual results but requires the most work. If the goal is purely to improve accented character readability, a VWF engine at 10-12px height might be the ideal solution — taller than 8px for better diacritics, but shorter than 16px to avoid wasting vertical space.

However, all options require significant changes to the text engine, textbox layout, menu system, and scrolling. This is not a small change — it touches the core rendering pipeline of the game.

## Key Questions to Answer Before Proceeding

1. Is the textbox height increase (loss of 16px game area) acceptable?
2. Is a GBC-only solution acceptable, or must it work on original Game Boy?
3. Would a VWF approach (any height, not just 8x16) be preferable?
4. How much development time is available for this change?
5. Are there reference implementations from other GBC Vietnamese/CJK translations to study?

## See Also

- [Decomposed Accent Row Feasibility](decomposed-accent-row-feasibility.md) — alternative approach that keeps 8x8 base glyphs and moves tone marks to separate accent rows
