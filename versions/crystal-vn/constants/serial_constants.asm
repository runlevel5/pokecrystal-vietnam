; wLinkMode
	const_def
	const LINK_NULL        ; 0
	const LINK_TIMECAPSULE ; 1
	const LINK_TRADECENTER ; 2
	const LINK_COLOSSEUM   ; 3
	const LINK_MOBILE      ; 4

; hSerialReceive high nybbles
DEF SERIAL_TIMECAPSULE EQU $60
DEF SERIAL_TRADECENTER EQU $70
DEF SERIAL_BATTLE      EQU $80

DEF ESTABLISH_CONNECTION_WITH_INTERNAL_CLOCK EQU $01
DEF ESTABLISH_CONNECTION_WITH_EXTERNAL_CLOCK EQU $02

; hSerialConnectionStatus
DEF USING_EXTERNAL_CLOCK       EQU $01
DEF USING_INTERNAL_CLOCK       EQU $02
DEF CONNECTION_NOT_ESTABLISHED EQU $ff

; length of a patch list
DEF SERIAL_PATCH_LIST_LENGTH          EQU 200
; size of the patch area (offsets into this area may not have special values)
DEF SERIAL_PATCH_DATA_SIZE            EQU $fc
; signals the start of an array of bytes transferred over the link cable
DEF SERIAL_PREAMBLE_BYTE              EQU $fd
; this byte is used when there is no data to send
DEF SERIAL_NO_DATA_BYTE               EQU $fe
; signals the end of one part of a patch list (there are two parts) for player/enemy party data
DEF SERIAL_PATCH_LIST_PART_TERMINATOR EQU $ff
; used to replace SERIAL_NO_DATA_BYTE
DEF SERIAL_PATCH_REPLACEMENT_BYTE     EQU $ff

DEF SERIAL_PREAMBLE_LENGTH       EQU 6
DEF SERIAL_RN_PREAMBLE_LENGTH    EQU 7
DEF SERIAL_PATCH_PREAMBLE_LENGTH EQU 3
DEF SERIAL_RNS_LENGTH            EQU 10

DEF SERIAL_MAIL_PREAMBLE_BYTE    EQU $20
DEF SERIAL_MAIL_PREAMBLE_LENGTH  EQU 5
; used to replace SERIAL_NO_DATA_BYTE
DEF SERIAL_MAIL_REPLACEMENT_BYTE EQU $21

; timeout duration after exchanging a byte
DEF SERIAL_LINK_BYTE_TIMEOUT EQU $5000

DEF MAX_MYSTERY_GIFT_PARTNERS EQU 5

; Language identifiers for link cable detection
DEF LANG_JP EQU $00  ; Japanese (incompatible serial protocol)
DEF LANG_EN EQU $01  ; English (US/AU/EU)
DEF LANG_FR EQU $02  ; French
DEF LANG_DE EQU $03  ; German
DEF LANG_IT EQU $04  ; Italian
DEF LANG_ES EQU $05  ; Spanish
DEF LANG_KO EQU $06  ; Korean (incompatible serial protocol)

; Vietnamese language detection uses a 1-byte signature in the RN data section
; and a 2-byte backup signature in the player name field trailing bytes.
;
; Primary detection (RN data): LANG_VN_BYTE1 is placed as the first random byte.
; This provides a quick early detection before party data exchange. The single-byte
; approach was chosen because 2-byte RN signatures caused unpredictable behavior
; in VN↔VN trading due to variable sync timing.
;
; Backup detection (player name field): NAME_LENGTH is 11 bytes but player names
; are at most PLAYER_NAME_LENGTH (8) bytes including the $50 terminator. The last
; two bytes (offsets 9 and 10) are unused by English Crystal and are filled with
; LANG_VN_BYTE1 and LANG_VN_BYTE2. This mirrors the technique used by European
; G/S/C for mail nationality detection (see european_mail.asm). The backup
; provides reliable confirmation and corrects any false positives from the RN scan.
;
; Both $55 and $AA are safe: below SERIAL_PREAMBLE_BYTE ($FD), not equal to
; SERIAL_NO_DATA_BYTE ($FE), and outside the $50 terminator range.
DEF LANG_VN_BYTE1 EQU $55  ; RN signature byte and first byte of name field signature
DEF LANG_VN_BYTE2 EQU $AA  ; Second byte of name field backup signature

; Player name field signature offsets (within the NAME_LENGTH region)
; These are the last 2 bytes of the 11-byte NAME_LENGTH field
DEF LANG_VN_NAME_SIG_OFFSET1 EQU NAME_LENGTH - 2  ; offset 9
DEF LANG_VN_NAME_SIG_OFFSET2 EQU NAME_LENGTH - 1  ; offset 10

; Keep LANG_VN as an alias for the primary detection byte (used by wPeerLanguage)
DEF LANG_VN EQU LANG_VN_BYTE1
