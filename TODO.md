# Pokemon Crystal Vietnamese - TODO

## Support Vietnamese for MAIL (Future Enhancement)

### Current Situation

Mail composition currently uses **English-only characters** to ensure 100% compatibility with English Pokemon Crystal when trading mail items via link cable.

**Current Implementation:**
- File: `data/text/mail_input_chars.asm`
- Layout: 2 pages (uppercase A-Z, numbers, and punctuation)
- Rationale: Mail items attached to Pokemon would display as garbage in English Crystal if they contained Vietnamese characters

### Goal

Allow Vietnamese players to write mail in Vietnamese while maintaining link cable compatibility with English Crystal.

### Proposed Solution

#### 1. Detect Peer Language for Mail

Leverage the existing `wPeerLanguage` detection (already implemented for trading):
- **VN ↔ VN**: Preserve Vietnamese characters in mail
- **VN ↔ EN**: Translate Vietnamese mail to base English letters before sending

#### 2. Enable Vietnamese Input for Mail

Expand `data/text/mail_input_chars.asm` to include Vietnamese characters:
- Add Vietnamese vowels with diacritics (á, à, ả, ã, ạ, ă, â, ê, ư, ô, ơ, etc.)
- Add đ character
- Increase page count from 2 to 4-5 pages

#### 3. Mail Translation Layer

Create mail-specific translation functions similar to `TranslateVietnameseToEnglish`:

```asm
TranslateMailForPeer:
    ; Check peer language
    ld a, [wPeerLanguage]
    cp LANG_VN
    ret z  ; VN peer: no translation needed
    
    ; Translate mail content to base English
    ; Similar to existing TranslateVietnameseToEnglish
    ...
```

#### 4. Implementation Details

| Component | Change |
|-----------|--------|
| `data/text/mail_input_chars.asm` | Add Vietnamese character pages |
| `engine/pokemon/mail.asm` | Hook translation before sending mail |
| `engine/link/link.asm` | Call mail translation when trading Pokemon with mail |
| `engine/link/link_trade_text.asm` | Add `TranslateMailText` function |

### Compatibility Matrix

| Scenario | Behavior |
|----------|----------|
| VN writes Vietnamese mail, trades to VN | Mail displays correctly in Vietnamese |
| VN writes Vietnamese mail, trades to EN | Mail translated to base English (readable) |
| VN writes English mail, trades to EN | Mail displays correctly (no translation needed) |
| EN writes mail, trades to VN | Mail displays correctly in English |

### Challenges

1. **Mail message length**: Translation may change character count (Vietnamese diacritics → base letters is 1:1, so this should be fine)

2. **Mail type detection**: Need to identify which mail slots contain messages that need translation

3. **Bidirectional sync**: When receiving mail from English Crystal, no translation needed (English characters already compatible)

4. **Save file handling**: Mail in PC storage doesn't need translation (only when sending over link cable)

### Files to Modify

| File | Change |
|------|--------|
| `data/text/mail_input_chars.asm` | Add Vietnamese character pages |
| `engine/pokemon/mail.asm` | Add translation hooks |
| `engine/link/link.asm` | Call mail translation during trade |
| `engine/link/link_trade_text.asm` | Add `TranslateMailText` function |
| `constants/mail_constants.asm` | Add any needed constants |

### References

- Current mail input: `data/text/mail_input_chars.asm`
- Mail composition: `engine/pokemon/mail.asm`
- Existing translation layer: `engine/link/link_trade_text.asm`
- Language detection: `wPeerLanguage` in `ram/wram.asm`

### Priority

Medium - Current English-only mail is functional, but Vietnamese mail would improve the player experience for VN ↔ VN trading.
