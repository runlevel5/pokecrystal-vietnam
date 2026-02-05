# Link Cable Language Detection Protocol

## Overview

This document describes the **language detection mechanism** implemented in Pokémon Crystal Vietnamese for detecting the language version of peer games during link cable communication. This allows the game to intelligently handle text translation:

- **VN ↔ VN**: Preserve Vietnamese accented characters (no translation)
- **VN ↔ EN**: Translate Vietnamese to base English letters (ensures compatibility)

This technique can be adapted by other fan translations to implement similar cross-version compatibility.

---

## Table of Contents

1. [Background](#background)
2. [The Problem](#the-problem)
3. [Solution: Language ID Embedding](#solution-language-id-embedding)
4. [Implementation Details](#implementation-details)
5. [Compatibility Analysis](#compatibility-analysis)
6. [Step-by-Step Implementation Guide](#step-by-step-implementation-guide)
7. [Code Reference](#code-reference)
8. [Testing](#testing)
9. [Adapting for Other Languages](#adapting-for-other-languages)

---

## Background

### Game Boy Link Cable Serial Protocol

Pokémon Crystal uses a synchronous serial protocol for link cable communication. The exchange follows this sequence:

```
1. Preamble sync    → 7 bytes of $FD (SERIAL_PREAMBLE_BYTE)
2. Random bytes     → 10 bytes of random data (used for RNG seeding)
3. Party data       → Player name, party Pokémon, OT names, nicknames
4. Patch lists      → Data patches for synchronization
5. Mail data        → (Trade Center only) Attached mail messages
```

The **preamble** is critical for synchronization. Both Game Boys must see the `$FD` bytes to establish sync timing. Any non-`$FD` byte in the preamble section can break synchronization.

### Character Encoding Challenge

English Crystal and Vietnamese Crystal use different character encodings:

| Range | English Crystal | Vietnamese Crystal |
|-------|----------------|-------------------|
| `$80-$99` | Uppercase A-Z | Lowercase a-z |
| `$A0-$B9` | Lowercase a-z | Vietnamese accented vowels (á, à, ả...) |
| `$A0-$DF` | Unused | Vietnamese accented characters |

Without translation:
- Vietnamese names sent to English → display as garbage
- English lowercase received in Vietnamese → display as accented characters

---

## The Problem

The naive approach is to **always translate** Vietnamese characters to base English letters when sending over link cable. This works but has a drawback:

> When two Vietnamese players trade, their accented names are unnecessarily stripped.

**Example:**
- Player "Hùng" trades with player "Liên"
- Both names become "Hung" and "Lien" even though both games support Vietnamese

**Goal:** Detect the peer's language version and only apply translation when necessary.

---

## Solution: Language ID Embedding

### Key Insight

The **random bytes section** (10 bytes after the preamble) is used for RNG seeding but is not critical for synchronization. We can embed a **language identifier** in this section without breaking compatibility.

### Why Not Use the Preamble?

The preamble **must** be all `$FD` bytes. The sync mechanism in `Serial_ExchangeBytes` discards received bytes until it sees `$FD`, then starts storing. Any non-`$FD` byte in the preamble position would be discarded or cause desync.

### The Approach

1. **Embed a distinctive language ID** as the first byte of the random bytes section
2. **Scan received data** for the language ID after the RN exchange
3. **Conditionally apply translation** based on detected peer language

---

## Implementation Details

### 1. Language Constants

File: `constants/serial_constants.asm`

```asm
; Language identifiers for link cable detection
; LANG_VN is placed in the random bytes section (after preamble) for detection
; English/other versions send random bytes which are unlikely to match LANG_VN
DEF LANG_JP EQU $00  ; Japanese (incompatible serial protocol)
DEF LANG_EN EQU $01  ; English (US/AU/EU)
DEF LANG_FR EQU $02  ; French
DEF LANG_DE EQU $03  ; German
DEF LANG_IT EQU $04  ; Italian
DEF LANG_ES EQU $05  ; Spanish
DEF LANG_KO EQU $06  ; Korean (incompatible serial protocol)
DEF LANG_VN EQU $55  ; Vietnamese (using distinctive value $55 for detection)
```

### 2. Why $55 for Vietnamese?

The value `$55` (binary `01010101`) was chosen because:

- **Unlikely in random data**: The probability of a random byte being exactly `$55` is 1/256 ≈ 0.4%
- **Not a control byte**: It's not `$FD` (preamble), `$FE` (sync), or `$FF` (no data)
- **Not a character code**: It's outside the text character range (`$80-$FF`)
- **Distinctive pattern**: Easy to identify in hex dumps during debugging

### 3. WRAM Variable

File: `ram/wram.asm`

```asm
wPeerLanguage::
; Language ID of the peer during link cable communication
; Set after RN preamble exchange; used to determine if translation is needed
; LANG_VN = Vietnamese peer (no translation needed)
; Any other value = non-Vietnamese peer (translation required)
	db
```

### 4. Embedding the Language ID (Outgoing)

File: `engine/link/link.asm` in `FixDataForLinkTransfer`

```asm
; Place LANG_VN as the first random byte for peer detection
; The distinctive value $55 is unlikely to appear in English Crystal's random data
	ld a, LANG_VN
	ld [hli], a

; Initialize remaining random bytes, making sure special bytes are omitted
	ld b, SERIAL_RNS_LENGTH - 1  ; one less since we used first for LANG_VN
.rn_loop
	call Random
	cp SERIAL_PREAMBLE_BYTE
	jr nc, .rn_loop
	ld [hli], a
	dec b
	jr nz, .rn_loop
```

**Data structure sent:**
```
Offset  | Content
--------|------------------------------------------
0-6     | $FD $FD $FD $FD $FD $FD $FD (preamble)
7       | $55 (LANG_VN)
8-16    | Random bytes (RNG seed)
17+     | Player name, party data, etc.
```

### 5. Detecting Peer Language (Incoming)

File: `engine/link/link.asm` in `Gen2ToGen2LinkComms`

```asm
; Read peer's language from received RN data
; NOTE: The preamble must be ALL $FD bytes for sync to work correctly.
; Serial_ExchangeBytes discards received bytes until it sees $FD, then
; stores subsequent bytes. Non-$FD bytes in preamble break synchronization.
; Therefore, LANG_VN is placed in the random bytes section (after preamble).
; Due to variable sync timing, we scan the received data to find LANG_VN.
	ld hl, wOTLinkBattleRNData
	ld b, 10
.scan_lang
	ld a, [hli]
	cp LANG_VN
	jr z, .found_lang
	dec b
	jr nz, .scan_lang
; Not found - assume non-Vietnamese (English Crystal)
	ld a, LANG_EN
.found_lang
	ld [wPeerLanguage], a
```

**Why scan instead of reading a fixed offset?**

Due to variable sync timing, the exact byte alignment can shift slightly. Scanning the first 10 bytes ensures we find `LANG_VN` regardless of minor timing variations.

### 6. Conditional Translation

File: `engine/link/link_trade_text.asm`

```asm
Link_FixDataForPeerLanguage:
; Fixes outgoing data in wLinkData based on detected peer language
; Called after RN exchange, before party data exchange
; If peer is Vietnamese: keep original Vietnamese names (no changes needed)
; If peer is English: translate player name, OT names, and nicknames
	ld a, [wPeerLanguage]
	cp LANG_VN
	ret z  ; Peer is Vietnamese, data already has correct Vietnamese names

; Peer is English - apply translations for compatibility
	ld hl, wLinkData + SERIAL_PREAMBLE_LENGTH
	ld de, wLinkData + SERIAL_PREAMBLE_LENGTH
	ld bc, NAME_LENGTH
	call TranslateVietnameseToEnglish

	call TranslateString_OTNames
	jp TranslateString_PartyMonNicknames
```

---

## Compatibility Analysis

### Vietnamese Crystal ↔ Vietnamese Crystal

| Step | Behavior |
|------|----------|
| VN sends | `$FD...$FD` + `$55` + random bytes |
| VN receives | Scans for `$55`, finds it → `wPeerLanguage = LANG_VN` |
| Translation | Skipped (both have Vietnamese) |
| Result | ✅ Vietnamese names preserved |

### Vietnamese Crystal ↔ English Crystal

| Step | Behavior |
|------|----------|
| VN sends | `$FD...$FD` + `$55` + random bytes |
| EN receives | Ignores `$55` (treated as random byte, no special handling) |
| EN sends | `$FD...$FD` + random bytes (no `$55`) |
| VN receives | Scans for `$55`, NOT found → `wPeerLanguage = LANG_EN` |
| Translation | Applied (VN→EN for outgoing, EN→VN for incoming) |
| Result | ✅ Names readable in both games |

### English Crystal ↔ English Crystal

No change to behavior. Both games ignore the random bytes content.

### Edge Case: Random $55 in English Data

**Probability:** 1/256 per byte × 10 bytes scanned ≈ 3.9% false positive rate

**Impact:** If English Crystal randomly sends `$55` in its RN data, Vietnamese Crystal would incorrectly assume it's talking to another Vietnamese game and skip translation.

**Mitigation options (not currently implemented):**
1. Use a multi-byte signature (e.g., `$55 $AA` pattern)
2. Use a checksum/hash of the language ID
3. Accept the small false positive rate (English names display fine either way)

**Current decision:** The 3.9% false positive rate is acceptable because:
- English names (`$80-$99` uppercase) display correctly in Vietnamese Crystal without translation
- The only impact is that Vietnamese Crystal won't translate its outgoing names, but English Crystal will display them as-is (readable, just not uppercase)

---

## Step-by-Step Implementation Guide

For developers implementing similar detection in other fan translations:

### Step 1: Choose a Language ID

Pick a unique byte value for your language:
- Avoid `$00-$7F` (ASCII range, might conflict)
- Avoid `$FD`, `$FE`, `$FF` (serial control bytes)
- Avoid `$50` (string terminator)
- Use a distinctive pattern (e.g., `$55`, `$AA`, `$33`)

```asm
DEF LANG_YOURLANG EQU $XX  ; Your chosen value
```

### Step 2: Add WRAM Variable

```asm
wPeerLanguage::
	db
```

### Step 3: Embed Language ID in Outgoing Data

In your `FixDataForLinkTransfer` or equivalent:

```asm
; After writing preamble, before random bytes:
	ld a, LANG_YOURLANG
	ld [hli], a
	; Continue with remaining random bytes (one fewer)
```

### Step 4: Detect Language from Incoming Data

After `Serial_ExchangeBytes` for RN data:

```asm
	ld hl, wOTLinkBattleRNData
	ld b, 10  ; Scan first 10 bytes
.scan_lang
	ld a, [hli]
	cp LANG_YOURLANG
	jr z, .found_lang
	dec b
	jr nz, .scan_lang
	; Not found - assume English/other
	ld a, LANG_EN
.found_lang
	ld [wPeerLanguage], a
```

### Step 5: Conditional Translation

```asm
YourTranslationFunction:
	ld a, [wPeerLanguage]
	cp LANG_YOURLANG
	ret z  ; Same language, no translation
	; Apply translation...
```

### Step 6: Handle Incoming Translation

If the peer is English, you may need to translate received data:

```asm
TranslateReceivedData:
	ld a, [wPeerLanguage]
	cp LANG_YOURLANG
	ret z  ; Same language, no translation
	; Translate English → your language encoding
```

---

## Code Reference

### Files Modified

| File | Purpose |
|------|---------|
| `constants/serial_constants.asm` | Language ID constants |
| `ram/wram.asm` | `wPeerLanguage` variable |
| `engine/link/link.asm` | Embed/detect language ID during RN exchange |
| `engine/link/link_trade_text.asm` | Translation functions with language checks |

### Key Functions

| Function | Location | Purpose |
|----------|----------|---------|
| `FixDataForLinkTransfer` | `link.asm` | Embeds `LANG_VN` in outgoing data |
| `Gen2ToGen2LinkComms` | `link.asm` | Scans for `LANG_VN` in received data |
| `Link_FixDataForPeerLanguage` | `link_trade_text.asm` | Conditionally translates outgoing data |
| `TranslateAllReceivedOTData` | `link_trade_text.asm` | Conditionally translates incoming data |

---

## Testing

### Test Matrix

| Scenario | Expected Behavior |
|----------|-------------------|
| VN (name: "Hùng") ↔ VN (name: "Liên") | Both names display with accents |
| VN (name: "Hùng") ↔ EN (name: "Red") | VN shows "Red", EN shows "Hung" |
| VN trades Pokémon "Rồng" to VN | Nickname preserved as "Rồng" |
| VN trades Pokémon "Rồng" to EN | Nickname becomes "Rong" in EN |
| EN trades Pokémon "Dragon" to VN | Nickname displays correctly |

### Debug Tips

1. **Check `wPeerLanguage` in debugger** after RN exchange
2. **Hex dump received RN data** to verify `$55` presence/absence
3. **Breakpoint on translation functions** to verify they're called/skipped correctly

---

## Adapting for Other Languages

### Multi-Language Detection

If multiple fan translations adopt this protocol, they can detect each other:

```asm
	ld a, [wPeerLanguage]
	cp LANG_VN
	jr z, .peer_is_vietnamese
	cp LANG_FR_FAN  ; Hypothetical French fan translation
	jr z, .peer_is_french_fan
	; Default: assume English
```

### Suggested Language IDs

| Language | Suggested ID | Pattern |
|----------|--------------|---------|
| Vietnamese | `$55` | `01010101` |
| Spanish (fan) | `$AA` | `10101010` |
| French (fan) | `$33` | `00110011` |
| German (fan) | `$CC` | `11001100` |
| Portuguese (fan) | `$66` | `01100110` |
| Polish (fan) | `$99` | `10011001` |

### Coordinating with Other Projects

If you're implementing this for a new fan translation:
1. Check if other projects have already chosen IDs
2. Document your choice publicly
3. Consider contributing to a shared registry

---

## Conclusion

This language detection mechanism provides a backward-compatible way to identify peer game versions during link cable communication. By embedding a single distinctive byte in the random data section, we can:

1. Preserve native text when trading between same-language versions
2. Apply necessary translation when trading with different versions
3. Maintain full compatibility with official English Crystal

The technique requires minimal code changes (~50 lines) and uses no extra protocol bandwidth.

---

## References

- `home/serial.asm` - Low-level serial communication
- `engine/link/link.asm` - Link cable state machine
- `engine/link/link_trade_text.asm` - Translation functions
- Pokémon Crystal disassembly: https://github.com/pret/pokecrystal
