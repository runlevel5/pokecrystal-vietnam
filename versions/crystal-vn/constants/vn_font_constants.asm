; Vietnamese Decomposed Accent Font Constants
; These are VRAM tile codes (matching positions in gfx/font/font.png)

; === Base character tiles ===

; Uppercase A-Z: $80-$99 (same codes as English Crystal for link compatibility)
; Lowercase a-z: $A0-$B9 (visually distinct lowercase glyphs)
; Uppercase-to-lowercase offset: $A0 - $80 = $20
DEF UPPER_TO_LOWER EQU $20

; đ/Đ tiles (placed directly, no decomposition needed)
DEF TILE_DSTROKE   EQU $BA ; đ (lowercase)
DEF TILE_DSTROKE_U EQU $BB ; Đ (uppercase)

; === VN_ACCENT prefix byte ===
; All accented Vietnamese characters emit a 2-byte sequence in the text stream:
;   VN_ACCENT_PREFIX ($23) + accent_id
; The text engine reads $23, then reads the next byte as accent_id.
; Bit 7 of accent_id: uppercase flag (0=lowercase, 1=uppercase)
; Bits 6-0: index into VnAccentDecompTable
DEF VN_ACCENT_PREFIX EQU $23
DEF VN_UPPER_BIT     EQU 7
DEF VN_UPPER_MASK    EQU $80
DEF VN_ID_MASK       EQU $7f
DEF VN_ACCENT_COUNT  EQU 65 ; number of entries in VnAccentDecompTable ($00-$40)

; === Accent tiles (VRAM tile codes) ===

; Tone-only accents (4 tiles: $BC-$BF)
DEF ACC_SAC       EQU $BC ; sắc (´)
DEF ACC_HUY       EQU $BD ; huyền (`)
DEF ACC_HOI       EQU $BE ; hỏi (̉)
DEF ACC_NGA       EQU $BF ; ngã (~)

; Nặng dot (1 tile: $C0)
DEF ACC_NANG      EQU $C0 ; nặng (.)

; Breve accents — ˘ for ă (10 tiles: $C1-$CA)
DEF ACC_BREVE          EQU $C1 ; ˘ (standalone breve)
DEF ACC_BREVE_SAC      EQU $C2 ; ˘´
DEF ACC_BREVE_HUY      EQU $C3 ; ˘`
DEF ACC_BREVE_HOI      EQU $C4 ; ˘̉
DEF ACC_BREVE_NGA      EQU $C5 ; ˘~
DEF ACC_NANG_BREVE     EQU $C6 ; .˘ (nặng from above + breve from below)
DEF ACC_NANG_BREVE_SAC EQU $C7 ; .˘´
DEF ACC_NANG_BREVE_HUY EQU $C8 ; .˘`
DEF ACC_NANG_BREVE_HOI EQU $C9 ; .˘̉
DEF ACC_NANG_BREVE_NGA EQU $CA ; .˘~

; Circumflex accents — ^ for â/ê/ô (10 tiles: $CB-$D4)
DEF ACC_CIRC          EQU $CB ; ^ (standalone circumflex)
DEF ACC_CIRC_SAC      EQU $CC ; ^´
DEF ACC_CIRC_HUY      EQU $CD ; ^`
DEF ACC_CIRC_HOI      EQU $CE ; ^̉
DEF ACC_CIRC_NGA      EQU $CF ; ^~
DEF ACC_NANG_CIRC     EQU $D0 ; .^ (nặng from above + circumflex from below)
DEF ACC_NANG_CIRC_SAC EQU $D1 ; .^´
DEF ACC_NANG_CIRC_HUY EQU $D2 ; .^`
DEF ACC_NANG_CIRC_HOI EQU $D3 ; .^̉
DEF ACC_NANG_CIRC_NGA EQU $D4 ; .^~

; Horn accents — ʾ for ơ/ư (10 tiles: $D5-$DE)
DEF ACC_HORN          EQU $D5 ; ʾ (standalone horn)
DEF ACC_HORN_SAC      EQU $D6 ; ʾ´
DEF ACC_HORN_HUY      EQU $D7 ; ʾ`
DEF ACC_HORN_HOI      EQU $D8 ; ʾ̉
DEF ACC_HORN_NGA      EQU $D9 ; ʾ~
DEF ACC_NANG_HORN     EQU $DA ; .ʾ (nặng from above + horn from below)
DEF ACC_NANG_HORN_SAC EQU $DB ; .ʾ´
DEF ACC_NANG_HORN_HUY EQU $DC ; .ʾ`
DEF ACC_NANG_HORN_HOI EQU $DD ; .ʾ̉
DEF ACC_NANG_HORN_NGA EQU $DE ; .ʾ~

; Nặng + tone compounds (4 tiles: $DF-$E2)
; Used when nặng dot from line above meets tone mark from line below
DEF ACC_NANG_SAC  EQU $DF ; .´
DEF ACC_NANG_HUY  EQU $E0 ; .`
DEF ACC_NANG_HOI  EQU $E1 ; .̉
DEF ACC_NANG_NGA  EQU $E2 ; .~

; === Accent flags encoding ===
; Each decomposition table entry has 1 byte of accent flags:
;   Bits 7-5: modifier (000=none, 001=breve, 010=circumflex, 011=horn)
;   Bit 3:    has nặng (dot below)
;   Bits 2-0: tone (0=none, 1=sắc, 2=huyền, 3=hỏi, 4=ngã)

; Modifier values (bits 7-5)
DEF MOD_NONE  EQU %00000000
DEF MOD_BREVE EQU %00100000
DEF MOD_CIRC  EQU %01000000
DEF MOD_HORN  EQU %01100000
DEF MOD_MASK  EQU %11100000

; Tone values (bits 2-0)
DEF TONE_NONE EQU %000
DEF TONE_SAC  EQU %001 ; sắc (´)
DEF TONE_HUY  EQU %010 ; huyền (`)
DEF TONE_HOI  EQU %011 ; hỏi (̉)
DEF TONE_NGA  EQU %100 ; ngã (~)
DEF TONE_MASK EQU %00000111

; Nặng flag (bit 3)
DEF NANG_FLAG EQU %00001000

; Combined flag shortcuts for decomposition table
DEF ACCENT_NONE      EQU 0
DEF ACCENT_F_SAC     EQU TONE_SAC
DEF ACCENT_F_HUY     EQU TONE_HUY
DEF ACCENT_F_HOI     EQU TONE_HOI
DEF ACCENT_F_NGA     EQU TONE_NGA
DEF ACCENT_F_NANG    EQU NANG_FLAG
