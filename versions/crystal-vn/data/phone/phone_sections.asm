; Vietnamese phone text section layout
; This file redistributes phone text files to avoid section overflow
; caused by larger Vietnamese text

; ============================================
; SECTION: Crystal Phone Text
; Files: irwin_caller through erin_caller (14 files)
; ============================================
SECTION "Crystal Phone Text", ROMX

INCLUDE "versions/crystal-vn/data/phone/text/irwin_caller.asm"
INCLUDE "versions/crystal-vn/data/phone/text/arnie_caller.asm"
INCLUDE "versions/crystal-vn/data/phone/text/alan_caller.asm"
INCLUDE "versions/crystal-vn/data/phone/text/dana_caller.asm"
INCLUDE "versions/crystal-vn/data/phone/text/chad_caller.asm"
INCLUDE "versions/crystal-vn/data/phone/text/derek_caller.asm"
INCLUDE "versions/crystal-vn/data/phone/text/tully_caller.asm"
INCLUDE "versions/crystal-vn/data/phone/text/brent_caller.asm"
INCLUDE "versions/crystal-vn/data/phone/text/tiffany_caller.asm"
INCLUDE "versions/crystal-vn/data/phone/text/vance_caller.asm"
INCLUDE "versions/crystal-vn/data/phone/text/wilton_caller.asm"
INCLUDE "versions/crystal-vn/data/phone/text/kenji_caller.asm"
INCLUDE "versions/crystal-vn/data/phone/text/parry_caller.asm"
INCLUDE "versions/crystal-vn/data/phone/text/erin_caller.asm"


; ============================================
; SECTION: Crystal Phone Text 2
; Reduced: Move gina_caller to overflow section
; ============================================
SECTION "Crystal Phone Text 2", ROMX

INCLUDE "versions/crystal-vn/data/phone/text/bike_shop.asm"
INCLUDE "versions/crystal-vn/data/phone/text/jack_caller.asm"
INCLUDE "versions/crystal-vn/data/phone/text/beverly_caller.asm"
INCLUDE "versions/crystal-vn/data/phone/text/huey_caller.asm"
INCLUDE "versions/crystal-vn/data/phone/text/gaven_caller.asm"
INCLUDE "versions/crystal-vn/data/phone/text/beth_caller.asm"
INCLUDE "versions/crystal-vn/data/phone/text/jose_caller.asm"
INCLUDE "versions/crystal-vn/data/phone/text/reena_caller.asm"
INCLUDE "versions/crystal-vn/data/phone/text/joey_caller.asm"
INCLUDE "versions/crystal-vn/data/phone/text/wade_caller.asm"
INCLUDE "versions/crystal-vn/data/phone/text/ralph_caller.asm"
INCLUDE "versions/crystal-vn/data/phone/text/liz_caller.asm"
INCLUDE "versions/crystal-vn/data/phone/text/anthony_caller.asm"
INCLUDE "versions/crystal-vn/data/phone/text/todd_caller.asm"
; gina_caller moved to Phone Text Overflow section


; ============================================
; SECTION: Phone Text
; Files: anthony_overworld through erin_overworld (14 files)
; ============================================
SECTION "Phone Text", ROMX

INCLUDE "versions/crystal-vn/data/phone/text/anthony_overworld.asm"
INCLUDE "versions/crystal-vn/data/phone/text/todd_overworld.asm"
INCLUDE "versions/crystal-vn/data/phone/text/gina_overworld.asm"
INCLUDE "versions/crystal-vn/data/phone/text/irwin_overworld.asm"
INCLUDE "versions/crystal-vn/data/phone/text/arnie_overworld.asm"
INCLUDE "versions/crystal-vn/data/phone/text/alan_overworld.asm"
INCLUDE "versions/crystal-vn/data/phone/text/dana_overworld.asm"
INCLUDE "versions/crystal-vn/data/phone/text/chad_overworld.asm"
INCLUDE "versions/crystal-vn/data/phone/text/derek_overworld.asm"
INCLUDE "versions/crystal-vn/data/phone/text/tully_overworld.asm"
INCLUDE "versions/crystal-vn/data/phone/text/brent_overworld.asm"
INCLUDE "versions/crystal-vn/data/phone/text/tiffany_overworld.asm"
INCLUDE "versions/crystal-vn/data/phone/text/vance_overworld.asm"
INCLUDE "versions/crystal-vn/data/phone/text/wilton_overworld.asm"
INCLUDE "versions/crystal-vn/data/phone/text/kenji_overworld.asm"
INCLUDE "versions/crystal-vn/data/phone/text/parry_overworld.asm"
INCLUDE "versions/crystal-vn/data/phone/text/erin_overworld.asm"


; ============================================
; SECTION: Phone Text 2
; Files: std_text, jack_overworld through liz_overworld (12 files)
; ============================================
SECTION "Phone Text 2", ROMX

INCLUDE "versions/crystal-vn/data/text/std_text.asm"
INCLUDE "versions/crystal-vn/data/phone/text/jack_overworld.asm"
INCLUDE "versions/crystal-vn/data/phone/text/beverly_overworld.asm"
INCLUDE "versions/crystal-vn/data/phone/text/huey_overworld.asm"
INCLUDE "versions/crystal-vn/data/phone/text/gaven_overworld.asm"
INCLUDE "versions/crystal-vn/data/phone/text/beth_overworld.asm"
INCLUDE "versions/crystal-vn/data/phone/text/jose_overworld.asm"
INCLUDE "versions/crystal-vn/data/phone/text/reena_overworld.asm"
INCLUDE "versions/crystal-vn/data/phone/text/joey_overworld.asm"
INCLUDE "versions/crystal-vn/data/phone/text/wade_overworld.asm"
INCLUDE "versions/crystal-vn/data/phone/text/ralph_overworld.asm"
INCLUDE "versions/crystal-vn/data/phone/text/liz_overworld.asm"


; ============================================
; SECTION: Special Phone Text
; Reduced: Move last 8 callee files to overflow section
; ============================================
SECTION "Special Phone Text", ROMX

INCLUDE "versions/crystal-vn/data/phone/text/mom.asm"
INCLUDE "versions/crystal-vn/data/phone/text/bill.asm"
INCLUDE "versions/crystal-vn/data/phone/text/elm.asm"
INCLUDE "versions/crystal-vn/data/phone/text/jack_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/beverly_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/huey_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/unknown_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/gaven_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/beth_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/jose_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/reena_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/joey_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/wade_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/ralph_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/liz_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/anthony_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/todd_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/gina_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/irwin_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/arnie_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/alan_callee.asm"
; Remaining callee files moved to Phone Text Overflow section


; ============================================
; SECTION: Phone Text Overflow (VN only)
; New section for files that don't fit in original sections
; ============================================
SECTION "Phone Text Overflow VN", ROMX

; Moved from Crystal Phone Text 2
INCLUDE "versions/crystal-vn/data/phone/text/gina_caller.asm"

; Moved from Special Phone Text
INCLUDE "versions/crystal-vn/data/phone/text/dana_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/chad_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/derek_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/tully_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/brent_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/tiffany_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/vance_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/wilton_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/kenji_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/parry_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/erin_callee.asm"
INCLUDE "versions/crystal-vn/data/phone/text/unused.asm"
