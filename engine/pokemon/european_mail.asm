ParseMailLanguage:
	ld c, MAIL_LANG_ENGLISH
	ld hl, sPartyMon1MailNationality - sPartyMon1Mail
	add hl, de
	ld a, [hli]
	; Check for Vietnamese: 'V' 'N'
	cp 'V'
	jr nz, .not_vietnamese
	ld a, [hl]
	cp 'N'
	jr nz, .check_european
	ld c, MAIL_LANG_VIETNAMESE
	ret
.not_vietnamese
	; Check for European languages: 'E' followed by language code
	cp 'E'
	ret nz
.check_european
	ld a, [hli]
	assert MAIL_LANG_ENGLISH + 1 == MAIL_LANG_FRENCH
	inc c
	cp 'F'
	ret z
	assert MAIL_LANG_FRENCH + 1 == MAIL_LANG_GERMAN
	inc c
	cp 'G'
	ret z
	assert MAIL_LANG_GERMAN + 1 == MAIL_LANG_ITALIAN
	inc c
	cp 'I'
	ret z
	assert MAIL_LANG_ITALIAN + 1 == MAIL_LANG_SPANISH
	inc c
	cp 'S'
	ret z
	ld c, MAIL_LANG_ENGLISH
	ret

; The regular font.
StandardEnglishFont:
INCBIN "gfx/font/english.1bpp"

; An extended font.
FrenchGermanFont:
INCBIN "gfx/font/french_german.1bpp"

; An even more extended font.
SpanishItalianFont:
INCBIN "gfx/font/spanish_italian.1bpp"

ConvertFrenchGermanMailToEnglish:
; Called when sending French or German mail
; Remaps 's from French/German character set to English 
; Converts c' d' j' from French/German character set to unused values in English
	ld b, sPartyMon1MailAuthor - sPartyMon1Mail
	ld h, d
	ld l, e
.loop
	ld a, [hl]
	cp $dc ; 's in French/German font
	jr nz, .check_intermediate_chars
	ld a, '\'s'
	jr .replace

.check_intermediate_chars
	sub '\'s'
	jr c, .dont_replace
	cp '\'v' - '\'s' + 1
	jr nc, .dont_replace
	add $cd

.replace
	ld [hl], a

.dont_replace
	inc hl
	dec b
	jr nz, .loop
	ret

ConvertEnglishMailToFrenchGerman:
; Called when receiving French or German mail
; Remaps 's from English character set to French/German 
; Converts unused values from English character set back to c' d' j' in French/German
	ld b, sPartyMon1MailAuthor - sPartyMon1Mail
	ld h, d
	ld l, e
.loop
	ld a, [hl]
	cp '\'s'
	jr nz, .check_intermediate_chars
	ld a, $dc ; 's in French/German font
	jr .replace

.check_intermediate_chars
	sub $cd
	jr c, .dont_replace
	cp '\'v' - '\'s' + 1
	jr nc, .dont_replace
	add '\'s'

.replace
	ld [hl], a

.dont_replace
	inc hl
	dec b
	jr nz, .loop
	ret

ConvertSpanishItalianMailToEnglish:
; Called when sending Spanish or Italian mail
; Converts 'd 'l 'm 'r 's 't 'v from Spanish/Italian character set to English
; Converts ì í ñ ò ó ú º from Spanish/Italian character set to unused values in English
ConvertEnglishMailToSpanishItalian:
; Called when receiving Spanish or Italian mail
; Converts 'd 'l 'm 'r 's 't 'v from English character set to Spanish/Italian
; Converts unused values from English character set back to ì í ñ ò ó ú º in Spanish/Italian
	ld b, sPartyMon1MailAuthor - sPartyMon1Mail
	ld h, d
	ld l, e
.loop
	ld a, [hl]
	and $f0
	cp $d0
	jr nz, .dont_replace
	ld a, [hl]
	add $8
	and $f
	or $d0
	ld [hl], a

.dont_replace
	inc hl
	dec b
	jr nz, .loop
	ret

ConvertVietnameseMailToEnglish:
; Called when sending Vietnamese mail to English Crystal
; Converts Vietnamese accented characters to base English letters
; Uses TranslateVietnameseToEnglish from link_trade_text.asm
; Input: de = pointer to mail message in wLinkPlayerMailMessages
	push de
	ld h, d
	ld l, e
	ld d, h
	ld e, l
	ld bc, MAIL_MSG_LENGTH
	farcall TranslateVietnameseToEnglish
	pop de
	; Also translate the author name (after message + messageEnd)
	ld hl, sPartyMon1MailAuthor - sPartyMon1Mail
	add hl, de
	ld d, h
	ld e, l
	ld bc, PLAYER_NAME_LENGTH - 1
	farcall TranslateVietnameseToEnglish
	ret

ConvertEnglishMailToVietnamese:
; Called when receiving non-Vietnamese mail in Vietnamese Crystal
; Converts:
;   - English lowercase a-z ($A0-$B9) to Vietnamese a-z ($80-$99)
;   - German umlauts Ä Ö Ü ä ö ü ($C0-$C5) to base letters a o u
;   - English contractions 'd 'l 'm 'r 's 't 'v ($D0-$D6) to base letters
; Input: de = pointer to mail message in wLinkReceivedMail
; Translates both message and author name in-place
	push de
	ld h, d
	ld l, e
	ld bc, MAIL_MSG_LENGTH
	call .translate_buffer
	pop de
	; Also translate the author name (after message + messageEnd)
	ld hl, sPartyMon1MailAuthor - sPartyMon1Mail
	add hl, de
	ld bc, PLAYER_NAME_LENGTH - 1
	; Fall through to .translate_buffer

; Translate a buffer of European/English text to Vietnamese-compatible text
; Input: hl = buffer pointer, bc = length
.translate_buffer:
.loop:
	ld a, b
	or c
	ret z
	dec bc
	ld a, [hl]
	
	; Check for terminator ($50)
	cp $50
	ret z
	
	; Check for English lowercase a-z ($A0-$B9) → Vietnamese a-z ($80-$99)
	cp $A0
	jr c, .check_umlauts
	cp $BA
	jr nc, .check_umlauts
	; Convert: subtract $20
	sub $20
	ld [hl], a
	jr .next
	
.check_umlauts:
	; Check for German umlauts ($C0-$C5)
	; $C0 = Ä → a ($80), $C1 = Ö → o ($8E), $C2 = Ü → u ($94)
	; $C3 = ä → a ($80), $C4 = ö → o ($8E), $C5 = ü → u ($94)
	cp $C0
	jr c, .check_contractions
	cp $C6
	jr nc, .check_contractions
	; Use lookup table for umlauts
	sub $C0
	push hl
	push bc
	ld hl, .umlaut_table
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	pop bc
	pop hl
	ld [hl], a
	jr .next
	
.check_contractions:
	; Check for English contractions ($D0-$D6)
	; 'd 'l 'm 'r 's 't 'v → d l m r s t v
	cp $D0
	jr c, .next
	cp $D7
	jr nc, .next
	; Use lookup table for contractions
	sub $D0
	push hl
	push bc
	ld hl, .contraction_table
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	pop bc
	pop hl
	ld [hl], a
	
.next:
	inc hl
	jr .loop

; Lookup tables for character conversion
.umlaut_table:
	; $C0=Ä→a, $C1=Ö→o, $C2=Ü→u, $C3=ä→a, $C4=ö→o, $C5=ü→u
	db $80, $8E, $94, $80, $8E, $94

.contraction_table:
	; $D0='d→d, $D1='l→l, $D2='m→m, $D3='r→r, $D4='s→s, $D5='t→t, $D6='v→v
	db $83, $8B, $8C, $91, $92, $93, $95
