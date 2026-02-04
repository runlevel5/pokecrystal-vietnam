# Pokemon Crystal Vietnamese - Font Mapping (Trading-Compatible Layout)

## Complete Character Map (font.png → charmap.asm)

This document shows the **trading-compatible layout** that maximizes compatibility with English Pokemon Crystal for link cable trading/battling.

### Layout Grid (Trading Compatible)

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

By sharing the same glyphs for $80-$9f, we can achieve IDENTICAL to English version

| Code Range | Characters | Status |
|------------|------------|--------|
| $80-$8F | A-P | ✅ **MATCHES ENGLISH** |
| $90-$99 | Q-Z | ✅ **MATCHES ENGLISH** |
| $9A-$9F | ( ) : ; [ ] | ✅ **MATCHES ENGLISH** |
| $A9-$DF | accented Vietnamese chars | **NO MATCH** |
| $E0-$EF | , PK MN, symbols | ✅ **MATCHES ENGLISH** |
| $F0-$FF | ¥ x . / , ♀, 0-9 | ✅ **MATCHES ENGLISH** |

### NOTES:

- the `$E4` and `$E5` are empty glyphs in English, so Vietnamese allocation of `←` and `đ` will ensure 100% compatability.
- `←` moved to `$E4` from `$DF` will not have any impact on compatability because this symbol is disallowed to be used for name boxes, player and Pokémons.
- There is no `ỵ` - unused in actual Vietnamese text, freed space for reorganization

### Accented Vietnamese characters organisation

Organized by **vowel families** for logical grouping:
- **$A0-$AF**: a-family (á à ả ã ạ) + ă-family (ă ắ ằ ẳ ẵ ặ) + â-family (â ấ ầ ẩ ẫ)
- **$B0-$BF**: â-family cont. (ậ) + e-family (è ẻ ẽ ẹ) + ê-family (ê ế ề ể ễ ệ) + i-family (í ì ỉ ĩ ị)
- **$C0-$CF**: u-family (ú ù ủ ũ ụ) + ư-family (ư ứ ừ ử ữ ự) + o-family (ó ò ỏ õ ọ)
- **$D0-$DF**: ô-family (ô ố ồ ổ ỗ ộ) + ơ-family (ơ ớ ờ ở ỡ ợ) + y-family (ý ỳ ỷ ỹ)

The contiguous organisation will simplify the logic of mapping accented characters to equivalent non-accented characters.

### Uppercase Mapping

There is NO concept of uppercase and lowercase in Vietnamese font system, a trade-off to squeeze all accented chars in same font sprites

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

### Trading Compatibility Strategy

**Problem:** Vietnamese and English versions have different font layouts. When trading Pokemon with nicknames:
- English sends `$A0-$B9` for lowercase a-z
- Vietnamese will wrongly render `$A0-$B9` as á-ị

**Solution:** To devise a translation layer to map them to correct glyphs on Vietnamese side. 

### Next Steps: Translation Layer

To enable trading with English Crystal, implement translation functions:

1. **TranslateEnglishToVietnamese**: Convert incoming English text (`$A0-$B9` = a-z) to Vietnamese (`$80-$99` = a-z)
   - Already compatible! No translation needed for basic a-z.

2. **TranslateVietnameseToEnglish**: Convert Vietnamese accented characters to base letters
   - á à ả ã ạ ă ắ ằ ẳ ẵ ặ â ấ ầ ẩ ẫ ậ → a (`$80`)
   - é è ẻ ẽ ẹ ê ế ề ể ễ ệ → e (`$84`)
   - í ì ỉ ĩ ị → i (`$88`)
   - ó ò ỏ õ ọ ô ố ồ ổ ỗ ộ ơ ớ ờ ở ỡ ợ → o (`$8E`)
   - ú ù ủ ũ ụ ư ứ ừ ử ữ ự → u (`$94`)
   - ý ỳ ỷ ỹ → y (`$98`)
   - đ → d (`$83`)

3. **Hook into link cable code** in `engine/link/` to automatically translate names during trading/battling.
