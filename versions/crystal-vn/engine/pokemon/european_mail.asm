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
; Input: 
;   de = pointer to mail message in wLinkPlayerMailMessages
;   a = mail index (0-5)
	push af
	; Translate the message (in-place)
	; de already points to message, bc = length
	push de
	ld bc, MAIL_MSG_LENGTH
	farcall TranslateVietnameseToEnglish
	pop de
	
	; Calculate metadata pointer for author name
	; wLinkPlayerMailMetadata + mailIndex * (MAIL_STRUCT_LENGTH - (MAIL_MSG_LENGTH + 1))
	; Metadata size per mail = 14 bytes (MAIL_STRUCT_LENGTH - MAIL_MSG_LENGTH - 1 = $2f - $21 = 14)
	pop af
	ld hl, wLinkPlayerMailMetadata
	; Multiply mail index by 14
	ld b, a
	ld de, MAIL_STRUCT_LENGTH - (MAIL_MSG_LENGTH + 1) ; 14
	or a
	jr z, .no_offset
.offset_loop
	add hl, de
	dec b
	jr nz, .offset_loop
.no_offset
	; hl now points to author name in metadata
	; TranslateVietnameseToEnglish expects de = source/dest pointer
	ld d, h
	ld e, l
	ld bc, PLAYER_NAME_LENGTH - 1
	farcall TranslateVietnameseToEnglish
	ret

; ConvertEnglishMailToVietnamese is not needed - incoming English mail
; is displayed using StandardEnglishFont (see mail_2.asm ReadMailMessage)
