# Pokemon Crystal Vietnamese Localization - Translation Guidelines

This document contains key decisions and guidelines for AI agents working on the Vietnamese localization of Pokemon Crystal.

**For complete English-Vietnamese term translations, see [GLOSSARY.md](GLOSSARY.md).**

## Language Decisions

### Terms Kept in English (UPPERCASE)

The following categories are intentionally kept in English to maintain consistency with the international Pokemon community and avoid confusion:

#### 1. Move Names (251 total)
All move names have been translated to Vietnamese. See [GLOSSARY.md](GLOSSARY.md) for the complete list.

To translate move names, edit the file `data/moves/names.asm`. Move names have a **12-character limit**.

#### 2. Item Names
Item names are translated to Vietnamese. See [GLOSSARY.md](GLOSSARY.md) for complete lists of:
- Poké Balls, Medicine, Berries, Vitamins
- Evolution Items, Hold Items, Apricorns
- Key Items, Mail, General Items

**Items kept in English:** ETHER, MAX ETHER, ELIXER, TM01-TM50, HM01-HM07

**Mail Composition Input:**

The mail composition character input screen (`data/text/mail_input_chars.asm`) now supports **full Vietnamese characters** with automatic translation for link cable compatibility.

**How it works:**
- Mail messages can be written using Vietnamese characters (5 pages, same as player name input)
- When trading mail to English Pokemon Crystal, Vietnamese accented characters are automatically translated to base English letters (e.g., "Xin chào bạn!" → "Xin chao ban!")
- The nationality field "VN" identifies Vietnamese mail for translation
- Mail received from English Crystal displays correctly in Vietnamese Crystal

**Implementation:**
- File: `data/text/mail_input_chars.asm`
- Layout: 5 pages of Vietnamese characters (same as player name input)
- Nationality code: "VN" (set in `engine/pokemon/mon_menu.asm:ComposeMailMessage`)
- Translation: `engine/pokemon/european_mail.asm:ConvertVietnameseMailToEnglish`
- Button labels: "tiếp" (next), "xoá" (delete), "xong" (done) - in Vietnamese for UI consistency

**Translation Flow (Outgoing):**
1. Player composes mail with Vietnamese characters
2. Mail saved with nationality = "VN"
3. When trading, `ParseMailLanguage` detects "VN" → `MAIL_LANG_VIETNAMESE`
4. `ConvertVietnameseMailToEnglish` translates message and author name
5. English Crystal receives readable base-letter text

**Note:** Pokemon and trainer name input (`data/text/name_input_chars.asm`) also supports full Vietnamese characters, handled by the same translation layer during link cable trading.

#### 3. Status Conditions
Status effect names are translated to Vietnamese in move descriptions and dialogue. See [GLOSSARY.md](GLOSSARY.md) for translations.

**Note:** Status conditions in system code/constants remain in English for technical purposes. Only user-facing text (move descriptions, battle messages, etc.) uses Vietnamese terms.

**SLEEP** is translated contextually:
- In move descriptions: "ngủ" (e.g., "Có thể làm đ.thủ ngủ" = "May make opponent sleep")
- Item name: ĐÁNH THỨC (Awakening)

#### 4. Stats
Stat names are translated to Vietnamese. See [GLOSSARY.md](GLOSSARY.md) for translations.

Note: HP and PP remain in English as they are universal gaming terms.

#### Pokemon Physical Attributes (Weight & Height)

Pokemon weight and height statistics have been **converted from imperial to SI metric units** for the Vietnamese localization:

| Attribute | Original (English) | Vietnamese Version |
|-----------|-------------------|-------------------|
| **Height** | Feet and inches (e.g., 5'11") | Meters (e.g., 1.8m) |
| **Weight** | Pounds (e.g., 150 lbs) | Kilograms (e.g., 68kg) |

**Examples:**
- Pikachu: 1'04" / 13 lbs → 0.4m / 6kg
- Charizard: 5'07" / 200 lbs → 1.7m / 91kg
- Snorlax: 6'11" / 1014 lbs → 2.1m / 460kg

**Implementation:**
- Height and weight conversions are handled in the Pokedex data files
- Display format uses Vietnamese-friendly metric units (m, kg)
- Conversions maintain reasonable precision (rounded to 1 decimal place for height, whole numbers for weight)

This change makes the game more accessible to Vietnamese players who use the metric system in daily life.

#### 5. Pokemon Names
All Pokemon species names remain in English:
- PIKACHU, RATTATA, BELLSPROUT, PIDGEY, TOGEPI, etc.
- Pokemon nicknames are **English-only** (restricted input for link cable compatibility - see "Naming Screen Character Sets" section)
- **Exception**: EGG (the placeholder name for unhatched Pokemon) is translated to TRỨNG

#### 6. Special Terms
- Badge names: Use "HC" (Huy Chương) prefix + English name (e.g., HC ZEPHYR, HC THUNDER)
- Game-specific terms: GYM (kept as GYM), RADIO (kept as RADIO)

#### 7. Game Terms
Game terms are translated to Vietnamese. See [GLOSSARY.md](GLOSSARY.md) for translations.

**Note:** Specific mail item names (THƯ BIỂN, THƯ YÊU QUÝ, etc.) remain as item names - see Item Names section.

### Terms Translated to Vietnamese

#### 1. Team/Organization Names
See [GLOSSARY.md](GLOSSARY.md) for translations of TEAM ROCKET, GYM LEADER, etc.

#### 2. Trainer Class Names
All 68 trainer classes have Vietnamese translations. See [GLOSSARY.md](GLOSSARY.md) for the complete list.

File: `data/trainers/class_names.asm`

**Translation Notes:**
- **THỦ LĨNH** (Leader): Used for all 16 Gym Leaders
- **TỨ ĐẠI** (Elite Four): Used for Elite Four members
- **ĐỐI THỦ** (Rival): Used for the player's rival (both early and late game)
- **HLV** (Huấn Luyện Viên - Trainer): Used for generic trainers (Cal, Red)
- **ROCKET**: Team Rocket members keep English name for brand recognition
- **FAN #MON**: Pokemaniac and Pokefan classes (# expands to POKé icon)
- **CAO THỦ** (Master/Expert): Gender-neutral term for Cooltrainer
- **VĐV TRƯỢT** (Vận Động Viên Trượt - Skiing Athlete): Full form of "Skier"

**Character Limits:**
- Maximum length: 13 characters (14 bytes including null terminator)
- Defined by `TRAINER_CLASS_NAME_LENGTH` constant

#### 3. Location Names
Location names are translated with Vietnamese prefixes. See [GLOSSARY.md](GLOSSARY.md) for the complete list from `data/maps/landmarks.asm`.

**Translation Patterns:**
| English Pattern | Vietnamese Pattern |
|-----------------|-------------------|
| <NAME> CITY | TP. <NAME> or TP.<BSP><NAME> |
| <NAME> TOWN | THỊ TRẤN <NAME> or THỊ TRẤN<BSP><NAME> |
| <NAME> TOWER | THÁP <NAME> or THÁP<BSP><NAME> |
| <NAME> CAVE | ĐỘNG <NAME> or HANG <NAME> |
| <NAME> FOREST | RỪNG <NAME> or RỪNG<BSP><NAME> |
| <NAME> ISLAND | ĐẢO <NAME> or ĐẢO<BSP><NAME> |
| ROUTE <N> | ĐƯỜNG <N> |

Note: `<BSP>` is a line break macro used for the map name popup display when names are long.

## Naming Screen Character Sets

The naming screen uses different character sets depending on what is being named:

### Character Input Pages (data/text/name_input_chars.asm)

| Naming Type | Character Set | Pages | Reason |
|-------------|---------------|-------|--------|
| Player name | Vietnamese (NameInputPage1-5) | 5 | Player names can use full Vietnamese with diacritics |
| Rival name | Vietnamese (NameInputPage1-5) | 5 | Rival names can use full Vietnamese with diacritics |
| Mom's name | Vietnamese (NameInputPage1-5) | 5 | Mom's name can use full Vietnamese with diacritics |
| Friend name | Vietnamese (NameInputPage1-5) | 5 | Friend names can use full Vietnamese with diacritics |
| Pokemon nickname | English (MonNameInput1-2) | 2 | Backward compatibility with link trading |
| PC Box name | Vietnamese (NameInputPage1-5) | 5 | Box names are NOT transmitted over link cable, so Vietnamese is safe |

### Why Pokemon Nicknames Use English Only

**Backward Compatibility:** Pokemon nicknames are stored in save data and transmitted during link cable trading. Using Vietnamese characters would cause:

1. **Display issues in English games:** Vietnamese accented characters would display as garbage/wrong characters when a Pokemon is traded to an English Pokemon Crystal
2. **Save compatibility:** Pokemon traded from English games would display correctly, but Vietnamese-named Pokemon traded back might cause issues

**Trade-off Decision:** By restricting Pokemon nicknames to English characters (A-Z, a-z, 0-9, basic punctuation), these names remain readable and compatible when:
- Trading with English Pokemon Crystal via link cable
- Trading with Pokemon Stadium 2
- Transferring save data between versions

**PC Box Names:** Box names are stored locally and are NOT transmitted during link cable trading. Therefore, PC Box names can safely use full Vietnamese characters. Default box names are "HỘP 1", "HỘP 2", etc.

**Player/Rival/Mom/Friend Names:** These names are translated via the link cable translation layer (see "Link Cable Trading Translation Layer" section), so they can safely use Vietnamese characters. The translation layer converts Vietnamese accented characters to base English letters when sending data over link cable.

### Default Player Names

When the player doesn't enter a name (leaves it blank), the game uses default names:
- Male player: **Trung**
- Female player: **Trang**

These defaults are defined in `engine/menus/intro_menu.asm`.

### Rationale

1. **Community Consistency**: Vietnamese Pokemon players are familiar with English move/item names from online resources, competitive play, and the international community.

2. **Technical Constraints**: The 18-character line limit makes it difficult to translate long move/item names while keeping them readable.

3. **Disambiguation**: English names avoid potential confusion with Vietnamese words that might have different meanings.

4. **Future Compatibility**: Keeping standardized names helps players communicate across language barriers.

## Pokemon Types

All 17 Pokemon types are translated to Vietnamese. See [GLOSSARY.md](GLOSSARY.md) for translations.

Note: BIRD type exists in code but is unused. ??? (CURSE_TYPE) is a special hidden type.

## Abbreviations Used

See [GLOSSARY.md](GLOSSARY.md) for the complete list of abbreviations.

## Character Name Translations

See [GLOSSARY.md](GLOSSARY.md) for character name translations.

## Pronoun Guidelines

Vietnamese pronouns are chosen based on relationship and context:

| Relationship | Speaker → Listener |
|--------------|-------------------|
| Rival (rude) | tao → mày |
| Mom → Child | mẹ → con |
| Elder → Youth | ta → con |
| Peer (polite) | tôi → bạn |
| NPC (respectful) | Based on age/status |

## Confirmation Dialog System

Vietnamese uses different terms for different types of confirmations:

### YesNoBox (CÓ/KHÔNG) - For Preference/Intent Questions

Use `YesNoBox` function or `yesorno` script command for questions about:
- **Preferences**: "Do you want...?" / "Would you like...?"
- **Permission**: "May I...?" / "Should I...?"
- **Knowledge**: "Do you know...?"

**Example:**
- "Con có biết dùng ĐIỆN THOẠI không?" (Do you know how to use the PHONE?)
- Uses: CÓ (Yes) / KHÔNG (No)

## Vietnamese Grammar Rules

### Adjective-Noun Word Order

In Vietnamese, adjectives come **after** nouns (opposite of English). This affects decoration names and composite item names.

**Examples:**
| English | Literal Translation | Correct Vietnamese |
|---------|--------------------|--------------------|
| PINK BED | HỒNG GIƯỜNG (wrong) | GIƯỜNG HỒNG ✓ |
| RED CARPET | ĐỎ THẢM (wrong) | THẢM ĐỎ ✓ |
| BLUE CARPET | XANH BIỂN THẢM (wrong) | THẢM XANH BIỂN ✓ |

**Implementation:**
- Decoration names in `data/decorations/names.asm` are split into parts:
  - Nouns with trailing space: "GIƯỜNG " (bed), "THẢM " (carpet)
  - Adjectives without space: "HỒNG" (pink), "ĐỎ" (red)
- The code in `engine/overworld/decorations.asm` concatenates them in Vietnamese order (noun + adjective)

**Result:** "GIƯỜNG " + "HỒNG" = "GIƯỜNG HỒNG" (Bed Pink = Pink Bed)

## Technical Constraints

- **Max 18 characters per line** (Game Boy screen width)
- Special macros expand: `#` = POKé (4), `#MON` = POKéMON (7), `#DEX` = POKéDEX (7), `#GEAR` = POKéGEAR (8)
- Player/rival names count as 8 characters max
- Pokemon names count as 10 characters max

## Font Files

There are **two font files** that must contain Vietnamese characters:

| File | Format | Used For |
|------|--------|----------|
| `gfx/font/font.png` | 1bpp, 128x64 | Dialog boxes, menus, battle text |
| `gfx/font/overworld.png` | 2bpp, 128x64 | Map name signs (location popups), overworld text |

Both fonts must have the same character layout matching the charmap in `constants/charmap.asm`.

### Vietnamese Character Set Limitations and Decisions

**Important Note**: Due to the Game Boy's hardware limitations and the font table size constraints, several compromises were made to support Vietnamese characters:

#### 1. Single-Case System (commit f1f7ea4)
- **Removed**: Separate uppercase and lowercase English alphabet characters
- **Reason**: To fit all Vietnamese accented characters (á, à, ả, ã, ạ, ă, â, ê, ư, ô, ơ, đ, etc.) into the limited font table
- **Result**: All text now uses a single case system (lowercase-style characters for both cases)
- **Implementation**: See commit `f1f7ea47353b5bf7ffdfee1f4b7e8341b853ad06` for full details

#### 2. Removal of ỵ Character (commit 9428cb5)
- **Removed**: ỵ (y with hook above AND dot below)
- **Reason**: This character is **extremely rare** in Vietnamese. It only appears in:
  - The word "ghen tỵ" (jealous) - which can be written as "ghen tị" instead
  - A few archaic or formal literary texts
- **Modern Vietnamese**: The character ỵ is not part of standard Vietnamese typography and is often replaced with "ị" or "ỵ" is simplified to other forms
- **Trade-off**: Removing this one rarely-used character freed space to reorganize the font for trading compatibility
- **Fix**: Any existing text using "ỵ" should be changed to "ị" (as done in maps/Route14.asm: "ghen tỵ" → "ghen tị")

**Note**: The 6 standard Vietnamese tones are: no tone, acute (´), grave (`), hook above (̉), tilde (˜), and dot below (̣). The character ỵ combines two tone marks (hook above + dot below) which violates standard Vietnamese orthography - a syllable can only have one tone mark.

#### 3. Trading-Compatible Layout (commit 9428cb5)

**Character Table Layout** (CURRENT - Trading Compatible):
```
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
```

**Key Features**:
- **Range $80-$9F**: IDENTICAL to English Crystal (a-z + basic punctuation)
  - This enables Pokemon nicknames with English characters to display correctly when trading between Vietnamese and English versions
- **Range $A0-$DF**: Vietnamese accented characters organized by vowel families
  - a-family (á à ả ã ạ ă ắ ằ ẳ ẵ ặ â ấ ầ ẩ ẫ ậ)
  - e-family (è ẻ ẽ ẹ ê ế ề ể ễ ệ)
  - i-family (í ì ỉ ĩ ị)
  - u-family (ú ù ủ ũ ụ ư ứ ừ ử ữ ự)
  - o-family (ó ò ỏ õ ọ ô ố ồ ổ ỗ ộ ơ ớ ờ ở ỡ ợ)
  - y-family (ý ỳ ỷ ỹ)
- **Special characters**: đ at $E5, é at $EA, punctuation at $E0-$EF

This layout allows full Vietnamese text support while maximizing compatibility with English Pokemon Crystal for link cable trading/battling. English text (Pokemon names, technical terms) remains readable in the single-case format.

## Translation Conventions

1. **UPPERCASE keywords stay in English**: If a keyword or term is written in ALL CAPS (e.g., POTION, ATTACK, PIKACHU), leave it in English. These are game-specific identifiers.

2. **Run linter after translation**: Always run the linter to ensure translated lines do not exceed the character limit. Use:
   ```bash
   source .venv/bin/activate && python tools/check_text_length.py <file.asm>
   ```
   For example:
   ```bash
   python tools/check_text_length.py data/text/common_1.asm
   ```

## Link Cable Trading Translation Layer

### Overview

To enable trading between Vietnamese and English Pokemon Crystal versions, a translation layer has been implemented that automatically converts Vietnamese accented characters to base English letters when sending data over the link cable.

### Implementation

**Files:**
- `engine/link/link_trade_text.asm` - Core translation functions
- `engine/link/link.asm` - Integration hooks and language detection
- `constants/serial_constants.asm` - Language identifier constants

**Language Detection:**

Vietnamese Crystal uses a language identifier (`LANG_VN = $55`) embedded in the random bytes section during the RN (random number) exchange to detect peer language:

- **VN ↔ VN**: Both peers detect `LANG_VN`, preserve Vietnamese accented characters
- **VN ↔ EN**: Vietnamese peer doesn't find `LANG_VN` in English data, applies translation

The distinctive value `$55` (binary `01010101`) is used because:
- It's unlikely to appear randomly in English Crystal's RNG data
- It's outside character ranges ($80-$DF) to avoid confusion with text
- It's not a special serial value ($FD, $FE, $FF)

**Translation Functions:**

1. **TranslateVietnameseToEnglish** - Core outgoing translation routine
   - Input: hl = source string, de = destination, bc = length
   - Converts Vietnamese accented characters to base letters
   - Vietnamese a-z ($80-$99) pass through unchanged

2. **TranslateEnglishToVietnamese** - Core incoming translation routine
   - Input: hl = string pointer (in-place), bc = length
   - Converts English lowercase a-z ($A0-$B9) to Vietnamese a-z ($80-$99)
   - English uppercase ($80-$99) already compatible, pass through unchanged

3. **Link_FixDataForPeerLanguage** - Conditionally applies translation based on detected peer
   - If peer is VN: keeps original Vietnamese names (no translation)
   - If peer is EN: translates player name, OT names, and nicknames on-the-fly

4. **TranslateString_OTNames** - Translates outgoing Original Trainer names
5. **TranslateString_PartyMonNicknames** - Translates outgoing Pokemon nicknames (defensive)
6. **TranslateAllReceivedOTData** - Translates all incoming text (player name, OT names, nicknames)

**Translation Rules:**

See [GLOSSARY.md](GLOSSARY.md) for the complete Vietnamese-to-English character mapping used in link cable trading.

### Trading Behavior

#### Vietnamese → English Trading

When a Vietnamese player trades to English:
- **English names**: Pokemon named with a-z characters (e.g., "Pikachu") display correctly in both versions due to trading-compatible font layout ($80-$99 matches English exactly)
- **Vietnamese names**: Pokemon with accented names (e.g., "Điện") are automatically translated to base letters (e.g., "Dien") in the English version
- Player names and OT names are similarly translated

#### English → Vietnamese Trading

When an English player trades to Vietnamese:
- **English uppercase**: A-Z ($80-$99) display correctly as a-z (same codes)
- **English lowercase**: a-z ($A0-$B9) are translated to Vietnamese a-z ($80-$99)
- Without translation, "Pikachu" would display as "Piáàảãạ" (garbage)

### Example Scenarios

**Scenario 1: Vietnamese player names Pokemon "Rồng"**
- In Vietnamese game: Displays as "Rồng" (with accent marks)
- Traded to English game: Displays as "Rong" (accents stripped)

**Scenario 2: English player names Pokemon "Dragon"**
- In English game: Displays as "Dragon"
- Traded to Vietnamese game: Displays as "Dragon" (unchanged)

**Scenario 3: Vietnamese player names Pokemon "Pikachu"**
- In Vietnamese game: Displays as "Pikachu"
- Traded to English game: Displays as "Pikachu" (unchanged, uses a-z range)

### Technical Details

**Hook Location:**
Language detection and conditional translation happen in `Gen2ToGen2LinkComms` (engine/link/link.asm) after the RN exchange but before party data exchange.

**Order of Operations:**
1. `Link_PrepPartyData_Gen2` copies original wPlayerName, party data, OT names, nicknames to wLinkData
2. `FixDataForLinkTransfer` sets up RN preamble (all $FD bytes) and places LANG_VN ($55) as first random byte
3. RN exchange happens via `Serial_ExchangeBytes`
4. Scan received data for LANG_VN → set wPeerLanguage
5. `Link_FixDataForPeerLanguage` conditionally applies translation based on peer language
6. Party data exchange happens
7. `TranslateAllReceivedOTData` translates incoming data if peer is English

**Note:** For VN↔VN trading, the original `wPlayerName` is preserved (no translation). For VN↔EN trading, player name is translated on-the-fly in `Link_FixDataForPeerLanguage`.

**Incoming Translation:**
After receiving data from English Crystal, `TranslateAllReceivedOTData` is called to convert English lowercase characters to Vietnamese character codes. This is hooked in both `Gen1ToGen2LinkComms` and `Gen2ToGen2LinkComms`.

**Why Translation is Bidirectional:**
- **Outgoing (VN→EN)**: Vietnamese accented characters need translation to display as readable base letters in English
- **Incoming (EN→VN)**: English lowercase a-z ($A0-$B9) must be converted to Vietnamese a-z ($80-$99) or they display as accented characters

### Future Improvements

Possible enhancements for future consideration:
- Bidirectional translation for other language pairs
- Option to preserve original names (trade-off: may display as garbage in incompatible versions)
- Translation customization via configuration