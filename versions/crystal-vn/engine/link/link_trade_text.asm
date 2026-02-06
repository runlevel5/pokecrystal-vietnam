; Character translation for link cable trading between Vietnamese and English Pokemon Crystal
;
; English Crystal character map:
;   $80-$99 = UPPERCASE A-Z
;   $A0-$B9 = lowercase a-z
;
; Vietnamese Crystal character map:
;   $80-$99 = a-z (single case)
;   $A0-$DF = Vietnamese accented characters
;
; Translation needed:
;   - Outgoing (VN→EN): Vietnamese accented chars → base English letters
;   - Incoming (EN→VN): English lowercase $A0-$B9 → Vietnamese $80-$99


TranslateEnglishToVietnamese::
; Translates a string of English characters to Vietnamese character codes
; This converts English lowercase a-z ($A0-$B9) to Vietnamese a-z ($80-$99)
; Input:
;   de = source string pointer (translates in-place)
;   bc = max length of string
; Output:
;   String at de contains translated characters
;
; NOTE: Uses de instead of hl because farcall overwrites hl with the function address

	ld h, d
	ld l, e  ; hl = de = source/destination pointer

.loop
	ld a, [hl]
	cp $50 ; "@" string terminator
	jr z, .done
	
	; Check if in English lowercase range ($A0-$B9)
	cp $A0
	jr c, .no_translation
	cp $BA
	jr nc, .no_translation
	
	; Convert English lowercase ($A0-$B9) to Vietnamese ($80-$99)
	; a = a - $20 (subtract $20 to shift from $A0-$B9 to $80-$99)
	sub $20
	ld [hl], a
	
.no_translation
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .loop

.done
	ret


TranslateVietnameseToEnglish::
; Translates a string of Vietnamese characters to base English letters
; Input:
;   de = source/destination string pointer (in-place translation)
;   bc = length of string
; Output:
;   String at de contains translated characters (English character codes)
; Note: English Crystal uses $80-$99 for uppercase A-Z
;       Vietnamese a-z ($80-$99) maps directly to English A-Z (same codes!)
;       Vietnamese accented chars get converted to uppercase base letters
;
; NOTE: This function translates in-place because farcall overwrites hl,
;       so we can't pass separate source and destination pointers easily.

	ld h, d
	ld l, e  ; hl = de = source/destination pointer

.loop
	ld a, [hl]
	cp $50 ; "@" string terminator
	jr z, .done
	
	call .TranslateChar
	ld [hli], a  ; write translated char and increment
	
	dec bc
	ld a, b
	or c
	jr nz, .loop

.done
	ret

.TranslateChar:
; Translates a single Vietnamese character to its base English letter
; Input: a = Vietnamese character code
; Output: a = English character code ($80-$99 for A-Z uppercase)
; Preserves: hl, de, bc

	push hl
	push bc
	
	; Check if in Vietnamese a-z range ($80-$99)
	; These map directly to English uppercase A-Z (same codes!)
	cp $80
	jr c, .no_translation
	cp $9A
	jr c, .no_translation ; Already correct code, no change needed
	
	; a-family: á à ả ã ạ ă ắ ằ ẳ ẵ ặ â ấ ầ ẩ ẫ ậ ($A0-$B0) → 'A' ($80)
	cp $A0
	jr c, .not_a_family
	cp $B1
	jr nc, .not_a_family
	ld a, $80 ; English 'A'
	jr .no_translation
.not_a_family

	; e-family: è ẻ ẽ ẹ ê ế ề ể ễ ệ ($B1-$BA) → 'E' ($84)
	cp $B1
	jr c, .not_e_family
	cp $BB
	jr nc, .not_e_family
	ld a, $84 ; English 'E'
	jr .no_translation
.not_e_family

	; i-family: í ì ỉ ĩ ị ($BB-$BF) → 'I' ($88)
	cp $BB
	jr c, .not_i_family
	cp $C0
	jr nc, .not_i_family
	ld a, $88 ; English 'I'
	jr .no_translation
.not_i_family

	; u-family: ú ù ủ ũ ụ ư ứ ừ ử ữ ự ($C0-$CA) → 'U' ($94)
	cp $C0
	jr c, .not_u_family
	cp $CB
	jr nc, .not_u_family
	ld a, $94 ; English 'U'
	jr .no_translation
.not_u_family

	; o-family: ó ò ỏ õ ọ ô ố ồ ổ ỗ ộ ơ ớ ờ ở ỡ ợ ($CB-$DB) → 'O' ($8E)
	cp $CB
	jr c, .not_o_family
	cp $DC
	jr nc, .not_o_family
	ld a, $8E ; English 'O'
	jr .no_translation
.not_o_family

	; y-family: ý ỳ ỷ ỹ ($DC-$DF) → 'Y' ($98)
	cp $DC
	jr c, .not_y_family
	cp $E0
	jr nc, .not_y_family
	ld a, $98 ; English 'Y'
	jr .no_translation
.not_y_family

	; đ ($E5) → 'D' ($83)
	cp $E5
	jr nz, .not_d
	ld a, $83 ; English 'D'
	jr .no_translation
.not_d

	; é ($EA) → 'E' ($84)
	cp $EA
	jr nz, .no_translation
	ld a, $84 ; English 'E'

.no_translation
	pop bc
	pop hl
	ret


TranslateString_PartyMonNicknames:
; Translates party mon nicknames in wLinkData
; This is called before sending data over link cable
; wLinkData already contains the party data, we translate in-place
	
	; Skip preamble + player name + party count/list + player ID + party mon data + OT names
	; to get to the nicknames section
	ld hl, wLinkData
	ld bc, SERIAL_PREAMBLE_LENGTH + NAME_LENGTH + (1 + PARTY_LENGTH + 1) + 2
	add hl, bc
	ld bc, PARTY_LENGTH * PARTYMON_STRUCT_LENGTH
	add hl, bc
	ld bc, PARTY_LENGTH * NAME_LENGTH
	add hl, bc
	
	; Now hl points to the start of party mon nicknames
	ld b, PARTY_LENGTH
.loop
	push bc
	push hl
	ld d, h
	ld e, l
	ld bc, MON_NAME_LENGTH
	call TranslateVietnameseToEnglish
	pop hl
	ld bc, MON_NAME_LENGTH
	add hl, bc
	pop bc
	dec b
	jr nz, .loop
	ret


TranslateString_OTNames:
; Translates OT names in wLinkData  
; This is called before sending data over link cable
	
	; Skip preamble + player name + party count/list + player ID + party mon data
	; to get to the OT names section
	ld hl, wLinkData
	ld bc, SERIAL_PREAMBLE_LENGTH + NAME_LENGTH + (1 + PARTY_LENGTH + 1) + 2
	add hl, bc
	ld bc, PARTY_LENGTH * PARTYMON_STRUCT_LENGTH
	add hl, bc
	
	; Now hl points to the start of OT names
	ld b, PARTY_LENGTH
.loop
	push bc
	push hl
	ld d, h
	ld e, l
	ld bc, NAME_LENGTH
	call TranslateVietnameseToEnglish
	pop hl
	ld bc, NAME_LENGTH
	add hl, bc
	pop bc
	dec b
	jr nz, .loop
	ret


; ============================================================================
; OUTGOING DATA FIX BASED ON PEER LANGUAGE
; Called after RN exchange when peer language is known
; ============================================================================

Link_FixDataForPeerLanguage::
; Fixes outgoing data in wLinkData based on detected peer language
; Called after RN exchange, before party data exchange
; If peer is Vietnamese: keep original Vietnamese names (no changes needed)
; If peer is English: translate player name, OT names, and nicknames
	ld a, [wPeerLanguage]
	cp LANG_VN
	ret z  ; Peer is Vietnamese, data already has correct Vietnamese names

; Peer is English - apply translations for compatibility
; 1. Translate player name in wLinkData (already copied from wPlayerName)
	ld hl, wLinkData + SERIAL_PREAMBLE_LENGTH  ; Skip preamble to player name
	ld de, wLinkData + SERIAL_PREAMBLE_LENGTH
	ld bc, NAME_LENGTH
	call TranslateVietnameseToEnglish

; 2. Translate OT names and nicknames
	call TranslateString_OTNames
	jp TranslateString_PartyMonNicknames


; ============================================================================
; INCOMING TRANSLATION (English → Vietnamese)
; Called after receiving data from English Crystal
; ============================================================================

TranslateReceivedOTPlayerName:
; Translates the received OT player name from English to Vietnamese
; English lowercase a-z ($A0-$B9) → Vietnamese a-z ($80-$99)
	ld de, wOTPlayerName
	ld bc, NAME_LENGTH
	jp TranslateEnglishToVietnamese


TranslateReceivedOTPartyMonOTs:
; Translates all received OT names from English to Vietnamese
	ld de, wOTPartyMonOTs
	ld b, PARTY_LENGTH
.loop
	push bc
	push de
	ld bc, NAME_LENGTH
	call TranslateEnglishToVietnamese
	pop de
	ld hl, NAME_LENGTH
	add hl, de
	ld d, h
	ld e, l
	pop bc
	dec b
	jr nz, .loop
	ret


TranslateReceivedOTPartyMonNicknames:
; Translates all received Pokemon nicknames from English to Vietnamese
	ld de, wOTPartyMonNicknames
	ld b, PARTY_LENGTH
.loop
	push bc
	push de
	ld bc, MON_NAME_LENGTH
	call TranslateEnglishToVietnamese
	pop de
	ld hl, MON_NAME_LENGTH
	add hl, de
	ld d, h
	ld e, l
	pop bc
	dec b
	jr nz, .loop
	ret


TranslateAllReceivedOTData::
; Convenience function to translate all received text data
; Call this after copying OT data from wLinkData
; Skip translation if peer is also Vietnamese (data already in correct format)
	ld a, [wPeerLanguage]
	cp LANG_VN
	ret z
	call TranslateReceivedOTPlayerName
	call TranslateReceivedOTPartyMonOTs
	jp TranslateReceivedOTPartyMonNicknames
