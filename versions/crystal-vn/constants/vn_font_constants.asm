; Vietnamese Decomposed Accent Font Constants
; These are VRAM tile codes (matching positions in gfx/font/font.png)

; Accent tiles ($C6-$CE) — each 8x8, split into two 4px zones:
;   Top half: nặng dot from line above
;   Bottom half: tone mark for line below
DEF ACC_SAC       EQU $C6 ; (empty) + sắc (´)
DEF ACC_HUY       EQU $C7 ; (empty) + huyền (`)
DEF ACC_HOI       EQU $C8 ; (empty) + hỏi (̉)
DEF ACC_NGA       EQU $C9 ; (empty) + ngã (~)
DEF ACC_NANG      EQU $CA ; nặng (.) + (empty)
DEF ACC_NANG_SAC  EQU $CB ; nặng + sắc
DEF ACC_NANG_HUY  EQU $CC ; nặng + huyền
DEF ACC_NANG_HOI  EQU $CD ; nặng + hỏi
DEF ACC_NANG_NGA  EQU $CE ; nặng + ngã

; Lowercase base vowel variants ($D7-$DC)
DEF TILE_ABREVE   EQU $D7 ; ă
DEF TILE_ACIRC    EQU $D8 ; â
DEF TILE_ECIRC    EQU $D9 ; ê
DEF TILE_OCIRC    EQU $DA ; ô
DEF TILE_OHORN    EQU $DB ; ơ
DEF TILE_UHORN    EQU $DC ; ư

; Uppercase base vowel variants ($BA-$BF)
DEF TILE_ABREVE_U EQU $BA ; Ă
DEF TILE_ACIRC_U  EQU $BB ; Â
DEF TILE_ECIRC_U  EQU $BC ; Ê
DEF TILE_OCIRC_U  EQU $BD ; Ô
DEF TILE_OHORN_U  EQU $BE ; Ơ
DEF TILE_UHORN_U  EQU $BF ; Ư

; Đ/đ tiles
DEF TILE_DSTROKE   EQU $DD ; đ (lowercase)
DEF TILE_DSTROKE_U EQU $CF ; Đ (uppercase)

; Accent flags encoding (1 byte per decomposition entry)
;   Bit 3:   has nặng (dot below) — 1=yes, 0=no
;   Bits 2-0: tone type:
DEF ACCENT_NONE   EQU %0000 ; no accent
DEF ACCENT_F_SAC  EQU %0001 ; sắc (´)
DEF ACCENT_F_HUY  EQU %0010 ; huyền (`)
DEF ACCENT_F_HOI  EQU %0011 ; hỏi (̉)
DEF ACCENT_F_NGA  EQU %0100 ; ngã (~)
DEF ACCENT_F_NANG EQU %1000 ; nặng only (dot below)

; Uppercase shift code — repurposed from <KOUGEKI> ($23)
; When this byte is read by the text engine, it sets hVnUpperFlag
; so the next accented character uses its uppercase base tile variant.
DEF UPPER_CHAR EQU $23

; Range of Vietnamese accented charmap codes (extended to include pass-throughs)
DEF VN_ACCENT_START EQU $A0
DEF VN_ACCENT_END   EQU $E5 ; inclusive (extended from $DF to accommodate ỳ at $E5)
