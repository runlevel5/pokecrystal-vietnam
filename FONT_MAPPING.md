# Pokemon Crystal Vietnamese - Font Mapping (Trading-Compatible Layout)

## Complete Character Map (font.png → charmap.asm)

This document shows the **NEW trading-compatible layout** that maximizes compatibility with English Pokemon Crystal for link cable trading/battling.

### Layout Grid (NEW - Trading Compatible)

| Row | $x0 | $x1  | $x2  | $x3 | $x4 | $x5 | $x6 | $x7 | $x8 | $x9 | $xA | $xB | $xC | $xD | $xE | $xF |
|-----|-----|------|------|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|
| $8x | a   | b    | c    | d   | e   | f   | g   | h   | i   | j   | k   | l   | m   | n   | o   | p   |
| $9x | q   | r    | s    | t   | u   | v   | w   | x   | y   | z   | (   | )   | :   | ;   | [   | ]   |
| $Ax | á   | à    | ả    | ã   | ạ   | ă   | ắ   | ằ   | ẳ   | ẵ   | ặ   | â   | ấ   | ầ   | ẩ   | ẫ   |
| $Bx | ậ   | è    | ẻ    | ẽ   | ẹ   | ê   | ế   | ề   | ể   | ễ   | ệ   | í   | ì   | ỉ   | ĩ   | ị   |
| $Cx | ú   | ù    | ủ    | ũ   | ụ   | ư   | ứ   | ừ   | ử   | ữ   | ự   | ó   | ò   | ỏ   | õ   | ọ   |
| $Dx | ô   | ố    | ồ    | ổ   | ỗ   | ộ   | ơ   | ớ   | ờ   | ở   | ỡ   | ợ   | ý   | ỳ   | ỷ   | ỹ   |
| $Ex | '   | <PK> | <MN> | -   | ←   | đ   | ?   | !   | .   | &   | é   | →   | ▷   | ▶   | ▼   | ♂   |
| $Fx | ¥   | x    | .    | /   | ,   | ♀   | 0   | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   |

### Trading Compatibility Strategy

**Problem:** Vietnamese and English versions have different font layouts. When trading Pokemon with nicknames:
- English sends `$80-$99` for lowercase a-z
- Vietnamese needs to decode these to Vietnamese a-z characters

**Solution:** This NEW layout puts a-z and punctuation at **identical positions** as English Crystal:

#### Range $80-$9F: IDENTICAL to English Crystal
| Code Range | Characters | Status |
|------------|------------|--------|
| $80-$8F | a-p | ✅ **MATCHES ENGLISH** |
| $90-$99 | q-z | ✅ **MATCHES ENGLISH** |
| $9A-$9F | ( ) : ; [ ] | ✅ **MATCHES ENGLISH** |

#### Range $A0-$DF: Vietnamese Accented Characters
Organized by **vowel families** for logical grouping:
- **$A0-$AF**: a-family (á à ả ã ạ) + ă-family (ă ắ ằ ẳ ẵ ặ) + â-family (â ấ ầ ẩ ẫ)
- **$B0-$BF**: â-family cont. (ậ) + e-family (è ẻ ẽ ẹ) + ê-family (ê ế ề ể ễ ệ) + i-family (í ì ỉ ĩ ị)
- **$C0-$CF**: u-family (ú ù ủ ũ ụ) + ư-family (ư ứ ừ ử ữ ự) + o-family (ó ò ỏ õ ọ)
- **$D0-$DF**: ô-family (ô ố ồ ổ ỗ ộ) + ơ-family (ơ ớ ờ ở ỡ ợ) + y-family (ý ỳ ỷ ỹ)

#### Range $E0-$EF: Punctuation + Special Characters
- `đ` moved to $E5 (freed $9D for semicolon `;`)
- `←` moved to $E4
- `é` at $EA

### Key Changes from OLD Layout

**Removed from $9x:**
- `đ` moved from $9D → $E5 (freed $9D for `;`)

**New positions for base vowels:**
- `ă` moved from $E4 → $A5
- `â` moved from $E5 → $AB
- `ê` moved from $A5 → $B5
- `ư` moved from $AF → $C5
- `ô` moved from $BF → $D0
- `ơ` moved from $CF → $D6

**Removed character:**
- `ỵ` (ỹ with dot below) - unused in actual Vietnamese text, freed space for reorganization

### Usage

Character codes now directly map to font positions:
- Text contains character code (e.g., `$D7` for "ớ")
- Game renders tile ID `$D7` which loads from VRAM position `$D7`
- VRAM was loaded from font.png position `$D7 - $80 = $57` (row 5, col 7)

### Uppercase Mapping

All uppercase Vietnamese letters map to their lowercase equivalents (updated positions):
- `Ă` → `$A5` (lowercase `ă`)
- `Â` → `$AB` (lowercase `â`)
- `Ê` → `$B5` (lowercase `ê`)
- `Ư` → `$C5` (lowercase `ư`)
- `Ô` → `$D0` (lowercase `ô`)
- `Ơ` → `$D6` (lowercase `ơ`)
- `Đ` → `$E5` (lowercase `đ`)
- `É` → `$EA` (lowercase `é`)

All other toned vowels (Á, À, Ả, Ắ, Ấ, Ế, Ố, etc.) map to their lowercase codes.

### Next Steps: Translation Layer

To enable trading with English Crystal, implement translation functions:

1. **TranslateEnglishToVietnamese**: Convert incoming English text ($80-$99 = a-z) to Vietnamese ($80-$99 = a-z)
   - Already compatible! No translation needed for basic a-z.

2. **TranslateVietnameseToEnglish**: Convert Vietnamese accented characters to base letters
   - á à ả ã ạ ă ắ ằ ẳ ẵ ặ â ấ ầ ẩ ẫ ậ → a
   - é è ẻ ẽ ẹ ê ế ề ể ễ ệ → e
   - í ì ỉ ĩ ị → i
   - ó ò ỏ õ ọ ô ố ồ ổ ỗ ộ ơ ớ ờ ở ỡ ợ → o
   - ú ù ủ ũ ụ ư ứ ừ ử ữ ự → u
   - ý ỳ ỷ ỹ → y
   - đ → d

3. **Hook into link cable code** in `engine/link/` to automatically translate names during trading/battling.
