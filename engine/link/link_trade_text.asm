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


TranslateEnglishToVietnamese:
; Translates a string of English characters to Vietnamese character codes
; This converts English lowercase a-z ($A0-$B9) to Vietnamese a-z ($80-$99)
; Input:
;   hl = source string pointer (translates in-place)
;   bc = max length of string
; Output:
;   String at hl contains translated characters

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


TranslateVietnameseToEnglish:
; Translates a string of Vietnamese characters to base English letters
; Input:
;   hl = source string pointer
;   de = destination string pointer
;   bc = length of string
; Output:
;   String at de contains translated characters

.loop
	ld a, [hli]
	cp $50 ; "@" string terminator
	jr z, .done
	
	call .TranslateChar
	ld [de], a
	inc de
	
	dec bc
	ld a, b
	or c
	jr nz, .loop

.done
	ld a, $50 ; "@"
	ld [de], a
	ret

.TranslateChar:
; Translates a single Vietnamese character to its base letter
; Input: a = Vietnamese character code
; Output: a = base English letter code
; Preserves: hl, de, bc

	push hl
	push bc
	
	; Check if already in English range ($80-$99 = a-z)
	cp $80
	jr c, .no_translation
	cp $9A
	jr c, .no_translation
	
	; a-family: á à ả ã ạ ă ắ ằ ẳ ẵ ặ â ấ ầ ẩ ẫ ậ ($A0-$B0) → 'a' ($80)
	cp $A0
	jr c, .not_a_family
	cp $B1
	jr nc, .not_a_family
	ld a, $80 ; 'a'
	jr .no_translation
.not_a_family

	; e-family: è ẻ ẽ ẹ ê ế ề ể ễ ệ ($B1-$BA) → 'e' ($84)
	cp $B1
	jr c, .not_e_family
	cp $BB
	jr nc, .not_e_family
	ld a, $84 ; 'e'
	jr .no_translation
.not_e_family

	; i-family: í ì ỉ ĩ ị ($BB-$BF) → 'i' ($88)
	cp $BB
	jr c, .not_i_family
	cp $C0
	jr nc, .not_i_family
	ld a, $88 ; 'i'
	jr .no_translation
.not_i_family

	; u-family: ú ù ủ ũ ụ ư ứ ừ ử ữ ự ($C0-$CA) → 'u' ($94)
	cp $C0
	jr c, .not_u_family
	cp $CB
	jr nc, .not_u_family
	ld a, $94 ; 'u'
	jr .no_translation
.not_u_family

	; o-family: ó ò ỏ õ ọ ô ố ồ ổ ỗ ộ ơ ớ ờ ở ỡ ợ ($CB-$DB) → 'o' ($8E)
	cp $CB
	jr c, .not_o_family
	cp $DC
	jr nc, .not_o_family
	ld a, $8E ; 'o'
	jr .no_translation
.not_o_family

	; y-family: ý ỳ ỷ ỹ ($DC-$DF) → 'y' ($98)
	cp $DC
	jr c, .not_y_family
	cp $E0
	jr nc, .not_y_family
	ld a, $98 ; 'y'
	jr .no_translation
.not_y_family

	; đ ($E5) → 'd' ($83)
	cp $E5
	jr nz, .not_d
	ld a, $83 ; 'd'
	jr .no_translation
.not_d

	; é ($EA) → 'e' ($84)
	cp $EA
	jr nz, .no_translation
	ld a, $84 ; 'e'

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

Link_FixDataForPeerLanguage:
; Fixes outgoing data in wLinkData based on detected peer language
; Called after RN exchange, before party data exchange
; If peer is Vietnamese: keep original Vietnamese names (no changes needed)
; If peer is English: copy pre-translated player name and translate OT/nicknames
	ld a, [wPeerLanguage]
	cp LANG_VN
	ret z  ; Peer is Vietnamese, data already has correct Vietnamese names

; Peer is English - apply translations for compatibility
; 1. Copy pre-translated player name (wTradeName) over wPlayerName in wLinkData
	ld hl, wTradeName
	ld de, wLinkData + SERIAL_PREAMBLE_LENGTH  ; Skip preamble to player name
	ld bc, NAME_LENGTH
	call CopyBytes

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
	ld hl, wOTPlayerName
	ld bc, NAME_LENGTH
	jp TranslateEnglishToVietnamese


TranslateReceivedOTPartyMonOTs:
; Translates all received OT names from English to Vietnamese
	ld hl, wOTPartyMonOTs
	ld b, PARTY_LENGTH
.loop
	push bc
	push hl
	ld bc, NAME_LENGTH
	call TranslateEnglishToVietnamese
	pop hl
	ld bc, NAME_LENGTH
	add hl, bc
	pop bc
	dec b
	jr nz, .loop
	ret


TranslateReceivedOTPartyMonNicknames:
; Translates all received Pokemon nicknames from English to Vietnamese
	ld hl, wOTPartyMonNicknames
	ld b, PARTY_LENGTH
.loop
	push bc
	push hl
	ld bc, MON_NAME_LENGTH
	call TranslateEnglishToVietnamese
	pop hl
	ld bc, MON_NAME_LENGTH
	add hl, bc
	pop bc
	dec b
	jr nz, .loop
	ret


TranslateAllReceivedOTData:
; Convenience function to translate all received text data
; Call this after copying OT data from wLinkData
; Skip translation if peer is also Vietnamese (data already in correct format)
	ld a, [wPeerLanguage]
	cp LANG_VN
	ret z
	call TranslateReceivedOTPlayerName
	call TranslateReceivedOTPartyMonOTs
	jp TranslateReceivedOTPartyMonNicknames
