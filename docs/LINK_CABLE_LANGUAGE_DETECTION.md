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

1. **Embed a 1-byte language signature** (`$55`) as the first byte of the random bytes section
2. **Embed a 2-byte signature** (`$55`, `$AA`) in the unused trailing bytes (offsets 9-10) of the player name field as a backup
3. **Scan received RN data** for the signature byte after the RN exchange
4. **Verify via backup** after receiving party data — check the name field signature to confirm or correct the RN-based detection
5. **Conditionally apply translation** based on detected peer language

---

## Implementation Details

### 1. Language Constants

File: `constants/serial_constants.asm`

```asm
; Language identifiers for link cable detection
DEF LANG_JP EQU $00  ; Japanese (incompatible serial protocol)
DEF LANG_EN EQU $01  ; English (US/AU/EU)
DEF LANG_FR EQU $02  ; French
DEF LANG_DE EQU $03  ; German
DEF LANG_IT EQU $04  ; Italian
DEF LANG_ES EQU $05  ; Spanish
DEF LANG_KO EQU $06  ; Korean (incompatible serial protocol)

; Vietnamese language detection uses a 1-byte signature
DEF LANG_VN_BYTE1 EQU $55  ; RN signature byte and first byte of name field signature
DEF LANG_VN_BYTE2 EQU $AA  ; Second byte of name field backup signature

; Player name field signature offsets (within the NAME_LENGTH region)
DEF LANG_VN_NAME_SIG_OFFSET1 EQU NAME_LENGTH - 2  ; offset 9
DEF LANG_VN_NAME_SIG_OFFSET2 EQU NAME_LENGTH - 1  ; offset 10

; Keep LANG_VN as an alias for the primary detection byte
DEF LANG_VN EQU LANG_VN_BYTE1
```

### 2. Why $55 for RN and $55 $AA for Name Field?

The RN data section uses a single byte (`$55`) because 2-byte RN signatures caused unpredictable behavior in VN↔VN trading due to variable sync timing. The name field backup uses a 2-byte signature (`$55`, `$AA`) for reliable confirmation since player name data is exchanged reliably.

The values `$55` and `$AA` were chosen because:

- **Not control bytes**: Neither is `$FD` (preamble), `$FE` (sync), or `$50` (terminator)
- **Not character codes**: Both are outside the text character range in English Crystal
- **Distinctive patterns**: `$55` = `01010101`, `$AA` = `10101010` — easy to spot in hex dumps

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

### 4. Embedding the Language Signature (Outgoing)

File: `engine/link/link.asm` in `FixDataForLinkTransfer`

```asm
; Place Vietnamese language signature byte for peer detection.
; A single byte is used here; the name field backup provides reliable confirmation.
	ld a, LANG_VN_BYTE1
	ld [hli], a

; Initialize remaining random bytes, making sure special bytes are omitted
	ld b, SERIAL_RNS_LENGTH - 1  ; one less since we used the first byte for signature
.rn_loop
	call Random
	cp SERIAL_PREAMBLE_BYTE
	jr nc, .rn_loop
	ld [hli], a
	dec b
	jr nz, .rn_loop
```

File: `engine/link/link.asm` in `Link_PrepPartyData_Gen2`

```asm
; Embed Vietnamese language signature in the trailing bytes of the player name field.
; Player names are at most PLAYER_NAME_LENGTH (8 bytes) with $50 terminator,
; but NAME_LENGTH (11 bytes) are transmitted. The last 2 bytes are unused by
; English Crystal, so we place our signature there (same technique as European
; G/S/C mail nationality detection).
	ld hl, -2
	add hl, de    ; hl = de - 2 (offset 9 within NAME_LENGTH field)
	ld a, LANG_VN_BYTE1
	ld [hli], a
	ld a, LANG_VN_BYTE2
	ld [hl], a
```

**Data structure sent:**
```
Offset  | Content
--------|------------------------------------------
0-6     | $FD $FD $FD $FD $FD $FD $FD (preamble)
7       | $55 (LANG_VN_BYTE1)
8-16    | Random bytes (RNG seed)
17+     | Player name (with $55 $AA at offsets 9-10), party data, etc.
```

### 5. Detecting Peer Language (Incoming)

File: `engine/link/link.asm` in `Gen2ToGen2LinkComms`

**Layer 1: RN data scan (primary detection)**

```asm
; Read peer's language from received RN data by scanning for LANG_VN_BYTE1 ($55).
; Due to variable sync timing, we scan the entire received buffer for the byte.
; The name field backup (after party data exchange) provides reliable confirmation.
	ld hl, wOTLinkBattleRNData
	ld b, SERIAL_RNS_LENGTH
.scan_lang
	ld a, [hli]
	cp LANG_VN_BYTE1
	jr z, .found_lang
	dec b
	jr nz, .scan_lang
; Not found - assume non-Vietnamese (English Crystal)
	ld a, LANG_EN
	jr .set_lang
.found_lang
	ld a, LANG_VN
.set_lang
	ld [wPeerLanguage], a
```

**Layer 2: Player name field backup (after party data exchange)**

```asm
; Backup language detection: verify using player name field signature.
; After Link_CopyOTData, wLinkData contains the received player name.
; Check the last 2 bytes of the NAME_LENGTH field for our signature.
; This provides a secondary confirmation of the RN-based detection,
; following the same technique used by European G/S/C for mail nationality.
	ld hl, wLinkData + LANG_VN_NAME_SIG_OFFSET1
	ld a, [hli]
	cp LANG_VN_BYTE1
	jr nz, .name_sig_not_vn
	ld a, [hl]
	cp LANG_VN_BYTE2
	jr nz, .name_sig_not_vn
; Name field confirms Vietnamese peer
	ld a, LANG_VN
	ld [wPeerLanguage], a
	jr .name_sig_done
.name_sig_not_vn
; Name field does NOT confirm Vietnamese - override to English.
; This corrects a false positive from the RN scan (rare but possible).
	ld a, LANG_EN
	ld [wPeerLanguage], a
.name_sig_done
```

**Why two layers?**

The RN scan provides early detection (before party data exchange) so outgoing data can be translated on-the-fly. However, a single-byte RN signature has a ~3.9% false-positive rate, and 2-byte RN signatures caused unpredictable behavior in VN↔VN trading due to variable sync timing. The name field backup runs after party data is received and provides a definitive confirmation using a reliable 2-byte signature, correcting any false positives from the RN scan.

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
| VN sends | `$FD...$FD` + `$55` + random bytes; name field has `$55 $AA` at offsets 9-10 |
| VN receives | RN scan finds `$55` → `wPeerLanguage = LANG_VN` |
| Backup check | Name field confirms `$55 $AA` → `wPeerLanguage = LANG_VN` (confirmed) |
| Translation | Skipped (both have Vietnamese) |
| Result | Vietnamese names preserved |

### Vietnamese Crystal ↔ English Crystal

| Step | Behavior |
|------|----------|
| VN sends | `$FD...$FD` + `$55` + random bytes; name field has `$55 $AA` at offsets 9-10 |
| EN receives | Ignores `$55` (treated as random byte, no special handling) |
| EN sends | `$FD...$FD` + random bytes (no `$55` signature); name field has arbitrary bytes |
| VN receives | RN scan does NOT find `$55` → `wPeerLanguage = LANG_EN` |
| Backup check | Name field does NOT have `$55 $AA` → `wPeerLanguage = LANG_EN` (confirmed) |
| Translation | Applied (VN→EN for outgoing, EN→VN for incoming) |
| Result | Names readable in both games |

### English Crystal ↔ English Crystal

No change to behavior. Both games ignore the random bytes content.

### Edge Case: False Positive Analysis

**RN scan false positive probability:** For a single-byte scan, any random byte matching `$55` triggers a match. The probability is approximately `1/253` per byte × 10 bytes ≈ 3.9%. This is acceptable because the name field backup corrects false positives before incoming translation is applied.

**Why not use 2-byte RN signatures?** Testing showed that 2-byte consecutive signatures in the RN data caused unpredictable behavior in VN↔VN trading due to variable sync timing during the serial exchange. The single-byte approach is more reliable for the RN layer.

**Name field backup eliminates false positives:** Even if the RN scan produces a false positive, the backup check examines the received player name field at offsets 9-10 for the 2-byte signature `$55 $AA`. English Crystal does not write this pair there, making the combined false-positive rate effectively zero for incoming translation.

**Timing consideration:** The backup check runs after party data is received, so it can only affect incoming translation. Outgoing translation is determined by the RN scan alone. In the ~3.9% false-positive case, outgoing Vietnamese names would not be translated to an English peer — but this is mitigated by the overall rarity and the fact that the name field backup ensures incoming data is always handled correctly.

---

## Step-by-Step Implementation Guide

For developers implementing similar detection in other fan translations:

### Step 1: Choose a Language Signature

Pick a unique byte for your RN signature and a 2-byte sequence for your name field backup:
- Avoid `$FD`, `$FE`, `$FF` (serial control bytes)
- Avoid `$50` (string terminator)
- Avoid `$80-$DF` (character ranges that could cause confusion)
- Use a distinctive byte for RN that is unlikely to appear in random data

```asm
DEF LANG_YOURLANG_BYTE1 EQU $XX  ; RN signature byte and first byte of name field signature
DEF LANG_YOURLANG_BYTE2 EQU $YY  ; Second byte of name field backup signature
DEF LANG_YOURLANG EQU LANG_YOURLANG_BYTE1  ; Alias for wPeerLanguage
```

### Step 2: Add WRAM Variable

```asm
wPeerLanguage::
	db
```

### Step 3: Embed Language Signature in Outgoing Data

In your `FixDataForLinkTransfer` or equivalent:

```asm
; After writing preamble, before random bytes:
	ld a, LANG_YOURLANG_BYTE1
	ld [hli], a
	; Continue with remaining random bytes (one fewer)
```

In your `Link_PrepPartyData` or equivalent, embed the same signature in the player name field:

```asm
; After copying player name to link data buffer:
; Write signature at the last 2 bytes of NAME_LENGTH field
	ld hl, -2
	add hl, de    ; de points past the name field
	ld a, LANG_YOURLANG_BYTE1
	ld [hli], a
	ld a, LANG_YOURLANG_BYTE2
	ld [hl], a
```

### Step 4: Detect Language from Incoming Data

After `Serial_ExchangeBytes` for RN data (primary detection):

```asm
	ld hl, wOTLinkBattleRNData
	ld b, SERIAL_RNS_LENGTH
.scan_lang
	ld a, [hli]
	cp LANG_YOURLANG_BYTE1
	jr z, .found_lang
	dec b
	jr nz, .scan_lang
	; Not found - assume English/other
	ld a, LANG_EN
	jr .set_lang
.found_lang
	ld a, LANG_YOURLANG
.set_lang
	ld [wPeerLanguage], a
```

After receiving party data (backup detection):

```asm
; Check player name field offsets 9-10 for signature
	ld hl, wLinkData + NAME_LENGTH - 2
	ld a, [hli]
	cp LANG_YOURLANG_BYTE1
	jr nz, .not_yourlang
	ld a, [hl]
	cp LANG_YOURLANG_BYTE2
	jr nz, .not_yourlang
	ld a, LANG_YOURLANG
	ld [wPeerLanguage], a
	jr .backup_done
.not_yourlang
	ld a, LANG_EN
	ld [wPeerLanguage], a
.backup_done
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
| `FixDataForLinkTransfer` | `link.asm` | Embeds 1-byte signature (`$55`) in outgoing RN data |
| `Link_PrepPartyData_Gen2` | `link.asm` | Embeds 2-byte signature in player name field (backup) |
| `Gen2ToGen2LinkComms` | `link.asm` | Scans for 1-byte signature in received RN data; backup check after party data |
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

1. **Check `wPeerLanguage` in debugger** after RN exchange and again after backup detection
2. **Hex dump received RN data** to verify `$55` byte presence/absence
3. **Hex dump received player name field** to verify backup signature at offsets 9-10
4. **Breakpoint on translation functions** to verify they're called/skipped correctly

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

### Suggested Language Signatures

| Language | RN Byte | Name Byte 1 | Name Byte 2 | Pattern |
|----------|---------|-------------|-------------|---------|
| Vietnamese | `$55` | `$55` | `$AA` | `01010101` + `10101010` |
| Spanish (fan) | `$33` | `$33` | `$CC` | `00110011` + `11001100` |
| French (fan) | `$66` | `$66` | `$99` | `01100110` + `10011001` |
| German (fan) | `$3C` | `$3C` | `$C3` | `00111100` + `11000011` |
| Portuguese (fan) | `$5A` | `$5A` | `$A5` | `01011010` + `10100101` |
| Polish (fan) | `$69` | `$69` | `$96` | `01101001` + `10010110` |

### Coordinating with Other Projects

If you're implementing this for a new fan translation:
1. Check if other projects have already chosen IDs
2. Document your choice publicly
3. Consider contributing to a shared registry

---

## Conclusion

This language detection mechanism provides a backward-compatible way to identify peer game versions during link cable communication. By using a two-layer detection system — a 1-byte signature in the RN data section with a 2-byte backup verification in the player name field — we can:

1. Preserve native text when trading between same-language versions
2. Apply necessary translation when trading with different versions
3. Maintain full compatibility with official English Crystal
4. Achieve effectively zero false-positive rates (RN scan ~3.9% corrected by name field backup)

The technique mirrors the approach used by European G/S/C for mail nationality detection and requires minimal code changes (~80 lines).

---

## References

- `home/serial.asm` - Low-level serial communication
- `engine/link/link.asm` - Link cable state machine
- `engine/link/link_trade_text.asm` - Translation functions
- European G/S/C mail nationality detection: [mid-kid/pokecrystal european_mail.asm](https://github.com/mid-kid/pokecrystal/blob/b50a2efbce279c26fd16303145db5880bf52d423/engine/pokemon/european_mail.asm)
- Pokémon Crystal disassembly: https://github.com/pret/pokecrystal
