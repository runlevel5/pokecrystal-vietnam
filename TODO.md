# Pokemon Crystal Vietnamese - TODO

## Link Cable Language Detection (Future Enhancement)

### Problem

Currently, the Vietnamese version **always translates** Vietnamese accented characters to base English letters when sending data over link cable (see `TranslateVietnameseToEnglish` in `engine/link/link_trade_text.asm`). This is the safest approach for compatibility, but it means:

- Vietnamese ↔ Vietnamese trading unnecessarily strips accents from names
- No way to preserve Vietnamese names when both players have the Vietnamese version

### Goal

Detect the **language version** of the peer's game to apply appropriate translation strategies:

| Peer Language | Strategy |
|---------------|----------|
| Vietnamese | No translation needed - preserve accents |
| English/Other | Vietnamese → base English letters |

### Proposed Solution: Language ID in Preamble

Embed a 1-byte language identifier in the RN preamble during link cable communication.

#### Language Constants

```asm
; Language identifiers for link cable detection
DEF LANG_JP EQU $00  ; Japanese
DEF LANG_EN EQU $01  ; English (US/AU/EU)
DEF LANG_FR EQU $02  ; French
DEF LANG_DE EQU $03  ; German
DEF LANG_IT EQU $04  ; Italian
DEF LANG_ES EQU $05  ; Spanish
DEF LANG_KO EQU $06  ; Korean
DEF LANG_VN EQU $07  ; Vietnamese
```

**Note:** Japanese and Korean Crystal have different serial protocols and are not compatible with international versions, so `LANG_JP` and `LANG_KO` are included for completeness but won't be encountered in practice with Western/Vietnamese versions.

#### Implementation Plan

1. **Embed language ID in RN preamble**

   Modify `FixDataForLinkTransfer` in `engine/link/link.asm` to embed the language byte:

   ```asm
   ; Current: 7 bytes of $FD
   ; Proposed: $FD $FD $FD $FD $FD [LANG_VN] $FD
   
   FixDataForLinkTransfer:
       ld hl, wLinkBattleRNPreamble
       ld a, SERIAL_PREAMBLE_BYTE
       ld [hli], a  ; byte 0: $FD
       ld [hli], a  ; byte 1: $FD
       ld [hli], a  ; byte 2: $FD
       ld [hli], a  ; byte 3: $FD
       ld [hli], a  ; byte 4: $FD
       ld a, LANG_VN
       ld [hli], a  ; byte 5: language ID
       ld a, SERIAL_PREAMBLE_BYTE
       ld [hli], a  ; byte 6: $FD (sync marker)
       ; ... rest of function
   ```

2. **Read peer's language ID after exchange**

   After `Serial_ExchangeBytes` for RN data, read peer's language from `wOTLinkBattleRNData`:

   ```asm
   ; wOTLinkBattleRNData + 5 = peer's language ID
   ld a, [wOTLinkBattleRNData + 5]
   ld [wPeerLanguage], a
   ```

3. **Add WRAM variable**

   ```asm
   wPeerLanguage:: db  ; Peer's language ID (LANG_EN, LANG_VN, etc.)
   ```

4. **Conditional translation**

   Modify `Link_PrepPartyData_Gen2` to only call translation functions when peer is NOT Vietnamese:

   ```asm
   ; Only translate if peer is NOT Vietnamese
       ld a, [wPeerLanguage]
       cp LANG_VN
       jr z, .skip_translation
       call TranslateString_OTNames
       call TranslateString_PartyMonNicknames
   .skip_translation:
   ```

   For future enhancement, language-specific translation strategies could be added:

   ```asm
   ; Extended language handling (future)
       ld a, [wPeerLanguage]
       cp LANG_VN
       jr z, .no_translation           ; VN↔VN: preserve accents
       cp LANG_FR
       jr z, .translate_for_french
       cp LANG_DE
       jr z, .translate_for_german
       cp LANG_IT
       jr z, .translate_for_italian
       cp LANG_ES
       jr z, .translate_for_spanish
       ; Default: translate to base English
       jr .translate_to_english
   ```

#### Compatibility Analysis

**English Crystal behavior when receiving Vietnamese preamble:**
- Receives: `$FD $FD $FD $FD $FD $02 $FD` (where $02 is LANG_VN)
- `Link_FindFirstNonControlCharacter_AllowZero` skips `$FD` and `$FE` bytes
- Language byte ($02) is treated as noise and skipped during RN data processing
- Sync mechanism still works because there are enough `$FD` bytes

**Vietnamese Crystal behavior when receiving English preamble:**
- Receives: `$FD $FD $FD $FD $FD $FD $FD`
- Byte 5 is `$FD` ($253), which won't match LANG_VN ($02)
- `wPeerLanguage` set to `$FD` → translation applied (correct behavior, any value ≠ LANG_VN triggers translation)

#### Required Changes

| File | Change |
|------|--------|
| `constants/serial_constants.asm` | Add `LANG_JP`, `LANG_EN`, `LANG_VN` constants |
| `ram/wram.asm` | Add `wPeerLanguage` variable |
| `engine/link/link.asm` | Modify `FixDataForLinkTransfer` to embed language ID |
| `engine/link/link.asm` | Read peer language after RN exchange |
| `engine/link/link.asm` | Add conditional translation in `Link_PrepPartyData_Gen2` |

#### Advantages Over Checksum Approach

| Aspect | Checksum (2 bytes) | Language ID (1 byte) |
|--------|-------------------|---------------------|
| Size | 2 bytes | 1 byte |
| Lookup | Requires checksum table | Direct comparison |
| Maintenance | Must update table for each ROM version | Single constant per language |
| Future versions | Each build has different checksum | All builds of same language use same ID |
| Simplicity | Complex lookup logic | Simple `cp LANG_VN` |
| Extensibility | Must collect checksums for all versions | Easy to add new languages |

#### Notes

- This approach is backward-compatible with all official Crystal versions
- English/European Crystal will ignore the language byte (treated as preamble noise)
- All Vietnamese ROM variants (different builds, patches) share the same language ID
- Could be extended for other fan translations using reserved language IDs
- European versions (FR/DE/IT/ES) could potentially adopt this scheme for cross-language trading improvements

### Alternative Approaches Considered

1. **Checksum-based detection** - Complex, requires lookup table, different for each build
2. **Custom handshake protocol** - Would break compatibility with official versions
3. **Use unused bytes in party data** - Risk of data corruption
4. **Always translate (current approach)** - Works but loses Vietnamese names in VN↔VN trades

### References

- Serial protocol: `home/serial.asm`, `engine/link/link.asm`
- Current translation layer: `engine/link/link_trade_text.asm`
- Preamble structure: `SERIAL_PREAMBLE_LENGTH` = 7 bytes

---

## Pre-translated English Names (Optimization) - IMPLEMENTED

**Status:** Completed

### Implementation Summary

The player name is now pre-translated to English at name entry time, eliminating runtime translation during link cable trading.

#### Changes Made

1. **Added `wTradeName` to WRAM** (`ram/wram.asm`)
   - Stores the pre-translated English version of the player name
   - Located immediately after `wPlayerName`

2. **Added `<TRADE_NAME>` text macro** (`constants/charmap.asm`, `home/text.asm`)
   - Charmap entry at `$17` for use in text scripts
   - `PrintTradeName` function to display the pre-translated name

3. **Added `TranslatePlayerNameForLinkCable` function** (`engine/menus/intro_menu.asm`)
   - Called at the end of `NamePlayer` after name entry is complete
   - Also called when continuing a saved game
   - Translates `wPlayerName` → `wTradeName` once

4. **Updated `Link_PrepPartyData_Gen2`** (`engine/link/link.asm`)
   - Now copies `wTradeName` directly instead of `wPlayerName`
   - Removed call to `TranslateString_PlayerName`

5. **Removed `TranslateString_PlayerName`** (`engine/link/link_trade_text.asm`)
   - No longer needed since player name is pre-translated

#### Remaining Runtime Translations

The following translations still occur at trade time (this is correct):
- **OT names** (`TranslateString_OTNames`) - Pokemon from other Vietnamese players have Vietnamese OT names
- **Party nicknames** (`TranslateString_PartyMonNicknames`) - Defensive measure, though nicknames should already be English-only

### Original Proposal (for reference)

4. **Handle OT names:**

   When a Pokemon is caught, its OT name is set to `wPlayerName`. We could either:
   - Store `wPlayerNameEnglish` as the OT name directly (saves translation at trade time)
   - Or continue storing Vietnamese OT name and translate at trade time (preserves Vietnamese display in-game)

   **Recommendation:** Store Vietnamese OT name, translate at trade time. This preserves the Vietnamese display when viewing Pokemon in-game, and OT translation is still needed for Pokemon caught by other Vietnamese players who trade with you.

### Benefits

- **Simpler trade code** - No runtime translation for player name
- **Consistent** - English name is always ready for trading
- **Save file compatibility** - English name stored in save, survives game restart

### Trade-offs

- **Extra WRAM** - 22 bytes (2 × NAME_LENGTH) for English name storage
- **OT names still need translation** - Pokemon from other Vietnamese players have Vietnamese OT names

### Files to Modify

| File | Change |
|------|--------|
| `ram/wram.asm` | Add `wTradeName` |
| `constants/charmap.asm` | Add `<TRADE_NAME>` charmap at `$17` |
| `home/text.asm` | Add `PrintTradeName` function |
| `engine/menus/intro_menu.asm` | Add `TranslatePlayerNameForLinkCable`, call on name entry and continue |
| `engine/link/link.asm` | Use pre-translated name instead of runtime translation |
| `engine/link/link_trade_text.asm` | Remove `TranslateString_PlayerName` (keep OT translation) |

### Note on Current Implementation Cost

The current runtime translation is **not expensive** (~4,300 cycles ≈ 1ms per trade), so this optimization is more about code simplicity than performance. The main benefit is architectural cleanliness - translate once, use everywhere.
