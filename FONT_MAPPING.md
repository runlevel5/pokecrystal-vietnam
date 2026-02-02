# Pokemon Crystal Vietnamese - Font Mapping

## Complete Character Map (font.png → charmap.asm)

This document shows the mapping between your font.png positions and character codes in charmap.asm.

### Layout Grid

| Row | $x0 | $x1  | $x2  | $x3 | $x4 | $x5 | $x6 | $x7 | $x8 | $x9 | $xA | $xB | $xC | $xD | $xE | $xF |
|-----|-----|------|------|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|
| $8x | a   | b    | c    | d   | e   | f   | g   | h   | i   | j   | k   | l   | m   | n   | o   | p   |
| $9x | q   | r    | s    | t   | u   | v   | w   | x   | y   | z   | (   | )   | :   | đ   | [   | ]   |
| $Ax | á   | à    | ả    | ã   | ạ   | ê   | è   | ẻ   | ẽ   | ẹ   | í   | ì   | ỉ   | ĩ   | ị   | ư   |
| $Bx | ó   | ò    | ỏ    | õ   | ọ   | ú   | ù   | ủ   | ũ   | ụ   | ý   | ỳ   | ỷ   | ỹ   | ỵ   | ô   |
| $Cx | ắ   | ằ    | ẳ    | ẵ   | ặ   | ấ   | ầ   | ẩ   | ẫ   | ậ   | ế   | ề   | ể   | ễ   | ệ   | ơ   |
| $Dx | ố   | ồ    | ổ    | ỗ   | ộ   | ớ   | ờ   | ở   | ỡ   | ợ   | ứ   | ừ   | ử   | ữ   | ự   | ←   |
| $Ex | '   | <PK> | <MN> | -   | ă   | â   | ?   | !   | .   | &   | é   | →   | ▷   | ▶   | ▼   | ♂   |
| $Fx | ¥   | x    | .    | /   | ,   | ♀   | 0   | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   |

### Key Changes from Previous Layout

**Row $9x:**
- Moved: `(` `)`  `:` from $Ex to $9A, $9B, $9C
- Moved: `đ` from $AF to $9D
- Moved: `[` `]` from $BF, $CF to $9E, $9F
- Removed: `ă` `â` `ư` `ô` `ơ` (moved to other positions)

**Row $Ax:**
- Changed: `é` moved from $A5 to $EA
- Changed: `ê` moved from $9C to $A5
- Added: `ư` moved from $9D to $AF

**Row $Bx:**
- Changed: `[` removed, `ô` added at $BF (moved from $9E)

**Row $Cx:**
- Changed: `]` removed, `ơ` added at $CF (moved from $9F)

**Row $Ex:**
- Changed: `(` `)` `:` removed (moved to $9x)
- Added: `ă` at $E4 (moved from $9A)
- Added: `â` at $E5 (moved from $9B)
- Added: `é` at $EA (moved from $A5)

### Usage

Character codes now directly map to font positions:
- Text contains character code (e.g., `$D5` for "ớ")
- Game renders tile ID `$D5` which loads from VRAM position `$D5`
- VRAM was loaded from font.png position `$D5 - $80 = $55` (row 5, col 5)

### Uppercase Mapping

All uppercase Vietnamese letters map to their lowercase equivalents:
- `Ớ` → `$D5` (same as lowercase `ớ`)
- `Ă` → `$E4` (lowercase `ă`)
- `Â` → `$E5` (lowercase `â`)
- `Ê` → `$A5` (lowercase `ê`)
- `Ư` → `$AF` (lowercase `ư`)
- `Ô` → `$BF` (lowercase `ô`)
- `Ơ` → `$CF` (lowercase `ơ`)
- `Đ` → `$9D` (lowercase `đ`)
- `É` → `$EA` (lowercase `é`)

All other toned vowels (Á, À, Ả, etc.) map to their lowercase codes.
