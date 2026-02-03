# Colored Text POC for Pokemon Crystal Vietnamese - STATUS: NOT WORKING

## Current Status

**This POC is not functional.** The implementation has critical issues:

1. **Attrmap corruption**: Writing to the attribute map during character placement causes screen corruption and game hangs
2. **Timing issues**: The Game Boy Color's attribute map system requires careful timing with VBlank that conflicts with text rendering
3. **Architecture mismatch**: The text rendering system (`PlaceString`/`PlaceNextChar`) is not designed to handle attribute map updates

## What Was Attempted

The POC tried to add inline colored text by:
- Adding a `<COLOR>` character command ($17) 
- Tracking current color in `wCurrentTextColor`
- Updating `wAttrmap` during character placement in `.place`
- Adding `ColorChar` handler to change colors mid-text

## Why It Failed

The main issue is that `wAttrmap` (the attribute map that controls tile colors) cannot be safely written to during normal text rendering because:
1. It's updated asynchronously during VBlank
2. Writing to it while rendering causes race conditions
3. The offset calculation (`wAttrmap - wTilemap = $0939`) works, but writing causes memory corruption

## Alternative Approaches

To implement colored text properly would require:

1. **Deferred attrmap updates**: Collect color changes during text rendering, then apply them all at once during VBlank
2. **Pre-computed color maps**: Calculate the entire attrmap for a textbox before rendering
3. **Different palette per textbox**: Change the entire palette 7 definition rather than using different palettes per character
4. **Post-render coloring**: Render text first, then go back and update specific tiles' attributes

## Files Modified (for reference)

These files contain the non-working POC code:
- `macros/scripts/text.asm` - Added TX_COLOR command
- `constants/charmap.asm` - Added <COLOR> character  
- `constants/tileset_constants.asm` - Added TEXT_COLOR_* constants
- `home/text.asm` - Added ColorChar handler and TextCommand_COLOR
- `ram/wram.asm` - Added wCurrentTextColor variable
- `data/default_options.asm` - Added default color value

## Recommendation

For your Vietnamese localization, instead of colored text, consider:
- Using special characters (★, ►, •) to mark important terms
- Adding spacing or line breaks to emphasize key words
- Using the existing text formatting commands more creatively
- Accepting that without uppercase, some visual clarity is lost but the game remains functional

Implementing truly working colored text would require a much more extensive rewrite of the text rendering system.


## Overview

This POC adds support for inline colored text in dialog boxes to help distinguish key identifiers (like landmarks, items, Pokemon names) from regular text.

## How It Works

The system uses the Game Boy Color's attribute map (`wAttrmap`) to assign different color palettes to individual text tiles. When text is rendered:

1. Each character written to `wTilemap` also gets a palette assignment written to `wAttrmap`
2. The palette assignment is tracked in `wCurrentTextColor`
3. The `text_color` command changes the current palette for subsequent characters

## Usage

### In ASM Text Files

Use the `text_color` macro to change text color:

```asm
text "Regular text "
text_color TEXT_COLOR_RED
text "RED TEXT"
text_color TEXT_COLOR_NORMAL
text " back to normal"
done
```

### Available Colors

- `TEXT_COLOR_NORMAL` (7) - Default black text (PAL_BG_TEXT)
- `TEXT_COLOR_RED` (1) - Red-tinted text (reuses PAL_BG_RED from tileset)
- `TEXT_COLOR_BLUE` (3) - Blue-tinted text (reuses PAL_BG_WATER from tileset)
- `TEXT_COLOR_GREEN` (2) - Green-tinted text (reuses PAL_BG_GREEN from tileset)

**Note**: The colored palettes reuse existing tileset palette slots. The exact colors will vary depending on the current map's palette. This is a limitation of the POC to avoid conflicts with existing systems.

### Example

See `maps/ElmsLab.asm` line 733 for an example where "POKEMON" is colored red:

```asm
para "Thầy đang nghiên"
line "cứu "
text_color TEXT_COLOR_RED
text "#MON"
text_color TEXT_COLOR_NORMAL
text " mới."
```

## Technical Details

### Files Modified

1. **macros/scripts/text.asm** - Added `TX_COLOR` command and `text_color` macro
2. **constants/charmap.asm** - Added `<COLOR>` character mapping
3. **constants/tileset_constants.asm** - Added `TEXT_COLOR_*` constants
4. **home/text.asm** - 
   - Modified `.place` to update attribute map when placing characters
   - Added `TextCommand_COLOR` handler
   - Initialize `wCurrentTextColor` in `TextboxPalette`
5. **ram/wram.asm** - Added `wCurrentTextColor` variable
6. **data/default_options.asm** - Added default value for `wCurrentTextColor`

### New Files

- **COLORED_TEXT_POC.md** - This documentation file
- ~~Three palette files were created but are not currently used~~ (reverted to avoid palette conflicts)

### Color Palette Assignments

The system reuses existing tileset palette slots that are already loaded:
- Palette 7 (PAL_BG_TEXT) - Normal black text
- Palette 1 (PAL_BG_RED) - Red-tinted text (varies by map)
- Palette 3 (PAL_BG_WATER) - Blue-tinted text (varies by map)
- Palette 2 (PAL_BG_GREEN) - Green-tinted text (varies by map)

**Important**: The colored palettes use the same palette data as the map tiles. This means the exact colors will vary depending on which map you're on, but text will still be distinguishable from normal black text.

## Limitations

- Each character tile can only use one palette (can't have multi-colored individual characters)
- Color changes happen on a per-character basis
- **Colored text appearance varies by location** - uses existing map palettes rather than dedicated text palettes
- Not suitable for contexts where precise color control is needed
- May not look good on all maps (depends on tileset palettes)

## Future Improvements

- Add more colors if needed
- Create convenience macros like `text_red "text"` to auto-reset color
- Add color support for other text rendering contexts (menus, battle text, etc.)
- Optimize to avoid writing attribute map when color hasn't changed

## Testing

To test the POC:

1. Build the ROM: `make`
2. Run in an emulator
3. Start a new game and talk to Professor Elm
4. You should see "POKEMON" displayed in red text in his dialog

## For Translators

When translating, you can now emphasize key terms by wrapping them in color tags:

```asm
text "Đi đến "
text_color TEXT_COLOR_RED
text "TP. GOLDENROD"
text_color TEXT_COLOR_NORMAL
text " để gặp"
line "người đó."
done
```

This makes location names, item names, and other identifiers stand out even without uppercase letters.
