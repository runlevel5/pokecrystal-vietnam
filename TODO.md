# Pokemon Crystal Vietnamese - TODO

## Link Cable Language Detection (Future Enhancement)

### Problem

Currently, the Vietnamese version **always translates** Vietnamese accented characters to base English letters when sending data over link cable (see `TranslateVietnameseToEnglish` in `engine/link/link_trade_text.asm`). This is the safest approach for compatibility, but it means:

- Vietnamese ↔ Vietnamese trading unnecessarily strips accents from names
- No way to preserve Vietnamese names when both players have the Vietnamese version
- Cannot apply language-specific character conversion strategies for European versions

### Goal

Detect the **exact language version** of the peer's game (English, French, German, Italian, Spanish, or Vietnamese) to apply appropriate translation strategies:

| Peer Language | Strategy |
|---------------|----------|
| Vietnamese | No translation needed - preserve accents |
| English (US/AU) | Vietnamese → base English letters |
| French/German | Vietnamese → base letters, handle French/German special chars |
| Italian/Spanish | Vietnamese → base letters, handle Italian/Spanish special chars |

### Proposed Solution: Checksum-Based Language Detection

Use the ROM's global checksum (`$014E-$014F`) to identify the peer's game language during link cable communication.

#### Known Pokemon Crystal ROM Checksums

Each language version has a unique ROM checksum. These need to be collected:

| Version | Region | Checksum | Status |
|---------|--------|----------|--------|
| English v1.0 | US | `$????` | Need to verify |
| English v1.1 | US | `$????` | Need to verify |
| English | AU | `$????` | Need to verify |
| French | EU | `$????` | Need to collect |
| German | EU | `$????` | Need to collect |
| Italian | EU | `$????` | Need to collect |
| Spanish | EU | `$????` | Need to collect |
| Vietnamese | VN | `$????` | Will be known after build |

**Note:** European versions (French, German, Italian, Spanish) share a common base ROM structure (see `base1_crcs` in `tools/stadium.c`) but have different text, resulting in different checksums.

#### How to Collect Checksums

The global checksum is at ROM offset `$014E-$014F` (big-endian). To extract:

```bash
# Using xxd to read checksum from a ROM file
xxd -s 0x14E -l 2 pokemon_crystal_french.gbc
```

Or read bytes at `$014E` and `$014F` in any hex editor.

#### Implementation Plan

1. **Embed checksum in RN preamble**

   Modify `FixDataForLinkTransfer` in `engine/link/link.asm` to embed the ROM checksum in the preamble:

   ```asm
   ; Current: 7 bytes of $FD
   ; Proposed: $FD $FD $FD $FD [checksum_hi] [checksum_lo] $FD
   
   FixDataForLinkTransfer:
       ld hl, wLinkBattleRNPreamble
       ld a, SERIAL_PREAMBLE_BYTE
       ld [hli], a  ; byte 0: $FD
       ld [hli], a  ; byte 1: $FD
       ld [hli], a  ; byte 2: $FD
       ld [hli], a  ; byte 3: $FD
       ld a, [$014E]  ; ROM checksum high byte
       ld [hli], a  ; byte 4: checksum high
       ld a, [$014F]  ; ROM checksum low byte
       ld [hli], a  ; byte 5: checksum low
       ld a, SERIAL_PREAMBLE_BYTE
       ld [hli], a  ; byte 6: $FD (sync marker)
       ; ... rest of function
   ```

2. **Read peer's checksum after exchange**

   After `Serial_ExchangeBytes` for RN data, read peer's checksum from `wOTLinkBattleRNData`:

   ```asm
   ; wOTLinkBattleRNData + 4 = peer's checksum high byte
   ; wOTLinkBattleRNData + 5 = peer's checksum low byte
   ```

3. **Store peer version flag**

   Add a new WRAM variable (e.g., `wPeerIsVietnamese`) and set it based on checksum comparison:

   ```asm
   ; Compare peer checksum with known Vietnamese ROM checksum
   ; Set wPeerIsVietnamese to TRUE or FALSE
   ```

4. **Conditional translation**

   Modify `Link_PrepPartyData_Gen2` to only call translation functions when `wPeerIsVietnamese` is FALSE:

   ```asm
   ; Only translate if peer is NOT Vietnamese
       ld a, [wPeerIsVietnamese]
       and a
       jr nz, .skip_translation
       call TranslateString_PlayerName
       call TranslateString_OTNames
       call TranslateString_PartyMonNicknames
   .skip_translation:
   ```

#### Compatibility Analysis

**English Crystal behavior when receiving Vietnamese preamble:**
- Receives: `$FD $FD $FD $FD XX YY $FD` (where XX YY is Vietnamese checksum)
- `Link_FindFirstNonControlCharacter_AllowZero` skips `$FD` and `$FE` bytes
- Checksum bytes (XX YY) are treated as noise and skipped during RN data processing
- Sync mechanism still works because there are enough `$FD` bytes

**Vietnamese Crystal behavior when receiving English preamble:**
- Receives: `$FD $FD $FD $FD $FD $FD $FD`
- Bytes 4-5 are `$FD $FD`, which won't match Vietnamese checksum
- `wPeerIsVietnamese` set to FALSE → translation applied (correct behavior)

#### Required Changes

| File | Change |
|------|--------|
| `engine/link/link.asm` | Modify `FixDataForLinkTransfer` to embed checksum |
| `engine/link/link.asm` | Add checksum comparison after RN exchange |
| `engine/link/link.asm` | Add conditional translation in `Link_PrepPartyData_Gen2` |
| `ram/wram.asm` | Add `wPeerLanguage` variable (not just boolean) |
| `constants/serial_constants.asm` | Define language constants and checksum table |

#### Language Constants

```asm
; Peer language detection results
DEF LANGUAGE_UNKNOWN    EQU 0
DEF LANGUAGE_ENGLISH    EQU 1
DEF LANGUAGE_FRENCH     EQU 2
DEF LANGUAGE_GERMAN     EQU 3
DEF LANGUAGE_ITALIAN    EQU 4
DEF LANGUAGE_SPANISH    EQU 5
DEF LANGUAGE_VIETNAMESE EQU 6
```

#### Checksum Lookup Table

```asm
PeerLanguageChecksums:
; Format: checksum_hi, checksum_lo, language_id
    db $XX, $XX, LANGUAGE_ENGLISH     ; English US v1.0
    db $XX, $XX, LANGUAGE_ENGLISH     ; English US v1.1
    db $XX, $XX, LANGUAGE_ENGLISH     ; English AU
    db $XX, $XX, LANGUAGE_FRENCH      ; French
    db $XX, $XX, LANGUAGE_GERMAN      ; German
    db $XX, $XX, LANGUAGE_ITALIAN     ; Italian
    db $XX, $XX, LANGUAGE_SPANISH     ; Spanish
    db $XX, $XX, LANGUAGE_VIETNAMESE  ; Vietnamese
    db $FF, $FF, LANGUAGE_UNKNOWN     ; End marker / fallback
```

#### Language-Specific Translation Strategies

```asm
; After detecting peer language, apply appropriate strategy:

.check_peer_language:
    ld a, [wPeerLanguage]
    cp LANGUAGE_VIETNAMESE
    jr z, .no_translation           ; VN↔VN: preserve accents
    cp LANGUAGE_FRENCH
    jr z, .translate_for_french
    cp LANGUAGE_GERMAN
    jr z, .translate_for_german
    cp LANGUAGE_ITALIAN
    jr z, .translate_for_italian
    cp LANGUAGE_SPANISH
    jr z, .translate_for_spanish
    ; Default: translate to base English
    jr .translate_to_english
```

#### Notes

- The Vietnamese ROM checksum will be known after building the final ROM
- This approach is backward-compatible with all official Crystal versions
- Consider also checking for Vietnamese ROM variants (debug builds, etc.)
- European versions already have mail language detection (`ParseMailLanguage` in `engine/pokemon/european_mail.asm`) which could be referenced for character conversion strategies

### Existing European Character Handling

The game already has infrastructure for handling European language differences in mail:

| Function | File | Purpose |
|----------|------|---------|
| `ParseMailLanguage` | `engine/pokemon/european_mail.asm` | Detects mail language (E/F/G/I/S) |
| `ConvertFrenchGermanMailToEnglish` | `engine/pokemon/european_mail.asm` | Converts FR/DE special chars |
| `ConvertSpanishItalianMailToEnglish` | `engine/pokemon/european_mail.asm` | Converts ES/IT special chars |
| `FrenchGermanFont` | `engine/pokemon/european_mail.asm` | Extended font for FR/DE |
| `SpanishItalianFont` | `engine/pokemon/european_mail.asm` | Extended font for ES/IT |

This existing code could inform how to handle Vietnamese ↔ European language trades.

### Alternative Approaches Considered

1. **Custom handshake protocol** - Would break compatibility with official versions
2. **Use unused bytes in party data** - Risk of data corruption
3. **Always translate (current approach)** - Works but loses Vietnamese names in VN↔VN trades
4. **Mail nationality field** - Only works for mail items, not general trading

### References

- ROM header structure: `$014E-$014F` = global checksum (2 bytes, big-endian)
- Checksum calculated by `rgbfix` during build
- Serial protocol: `home/serial.asm`, `engine/link/link.asm`
- Current translation layer: `engine/link/link_trade_text.asm`
- European mail handling: `engine/pokemon/european_mail.asm`
- Stadium checksums (US vs EU base): `tools/stadium.c` (`base0_crcs`, `base1_crcs`)

---

## Pre-translated English Names (Optimization) - IMPLEMENTED

**Status:** Completed

### Implementation Summary

The player name is now pre-translated to English at name entry time, eliminating runtime translation during link cable trading.

#### Changes Made

1. **Added `wPlayerNameEnglish` to WRAM** (`ram/wram.asm`)
   - Stores the pre-translated English version of the player name
   - Located immediately after `wPlayerName`

2. **Added `TranslatePlayerNameForLinkCable` function** (`engine/menus/intro_menu.asm`)
   - Called at the end of `NamePlayer` after name entry is complete
   - Translates `wPlayerName` → `wPlayerNameEnglish` once

3. **Updated `Link_PrepPartyData_Gen2`** (`engine/link/link.asm`)
   - Now copies `wPlayerNameEnglish` directly instead of `wPlayerName`
   - Removed call to `TranslateString_PlayerName`

4. **Removed `TranslateString_PlayerName`** (`engine/link/link_trade_text.asm`)
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
| `ram/wram.asm` | Add `wPlayerNameEnglish`, `wRivalNameEnglish` |
| `engine/menus/naming_screen.asm` | Call translation after name input |
| `engine/link/link.asm` | Use pre-translated name instead of runtime translation |
| `engine/link/link_trade_text.asm` | Remove `TranslateString_PlayerName` (keep OT translation) |

### Note on Current Implementation Cost

The current runtime translation is **not expensive** (~4,300 cycles ≈ 1ms per trade), so this optimization is more about code simplicity than performance. The main benefit is architectural cleanliness - translate once, use everywhere.
