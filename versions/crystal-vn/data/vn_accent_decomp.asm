SECTION "Vietnamese Font Data", ROMX

; Decomposition table for Vietnamese accented characters ($A0-$DF).
; Each entry is 2 bytes: (base_glyph_vram_tile, accent_flags).
; PlaceAccentedChar in home/text.asm looks up this table at render time.
;
; Accent flags encoding:
;   Bit 3:    has nặng (dot below)
;   Bits 2-0: tone type (0=none, 1=sắc, 2=huyền, 3=hỏi, 4=ngã)

VnAccentDecompTable::
; $A0-$A4: á à ả ã ạ (base: a = $80)
	db $80, ACCENT_F_SAC  ; $A0 á
	db $80, ACCENT_F_HUY  ; $A1 à
	db $80, ACCENT_F_HOI  ; $A2 ả
	db $80, ACCENT_F_NGA  ; $A3 ã
	db $80, ACCENT_F_NANG ; $A4 ạ
; $A5-$AA: ă ắ ằ ẳ ẵ ặ (base: ă = TILE_ABREVE)
	db TILE_ABREVE, ACCENT_NONE  ; $A5 ă
	db TILE_ABREVE, ACCENT_F_SAC  ; $A6 ắ
	db TILE_ABREVE, ACCENT_F_HUY  ; $A7 ằ
	db TILE_ABREVE, ACCENT_F_HOI  ; $A8 ẳ
	db TILE_ABREVE, ACCENT_F_NGA  ; $A9 ẵ
	db TILE_ABREVE, ACCENT_F_NANG ; $AA ặ
; $AB-$B0: â ấ ầ ẩ ẫ ậ (base: â = TILE_ACIRC)
	db TILE_ACIRC, ACCENT_NONE  ; $AB â
	db TILE_ACIRC, ACCENT_F_SAC  ; $AC ấ
	db TILE_ACIRC, ACCENT_F_HUY  ; $AD ầ
	db TILE_ACIRC, ACCENT_F_HOI  ; $AE ẩ
	db TILE_ACIRC, ACCENT_F_NGA  ; $AF ẫ
	db TILE_ACIRC, ACCENT_F_NANG ; $B0 ậ
; $B1-$B4: è ẻ ẽ ẹ (base: e = $84)
	db $84, ACCENT_F_HUY  ; $B1 è
	db $84, ACCENT_F_HOI  ; $B2 ẻ
	db $84, ACCENT_F_NGA  ; $B3 ẽ
	db $84, ACCENT_F_NANG ; $B4 ẹ
; $B5-$BA: ê ế ề ể ễ ệ (base: ê = TILE_ECIRC)
	db TILE_ECIRC, ACCENT_NONE  ; $B5 ê
	db TILE_ECIRC, ACCENT_F_SAC  ; $B6 ế
	db TILE_ECIRC, ACCENT_F_HUY  ; $B7 ề
	db TILE_ECIRC, ACCENT_F_HOI  ; $B8 ể
	db TILE_ECIRC, ACCENT_F_NGA  ; $B9 ễ
	db TILE_ECIRC, ACCENT_F_NANG ; $BA ệ
; $BB-$BF: í ì ỉ ĩ ị (base: i = $88)
	db $88, ACCENT_F_SAC  ; $BB í
	db $88, ACCENT_F_HUY  ; $BC ì
	db $88, ACCENT_F_HOI  ; $BD ỉ
	db $88, ACCENT_F_NGA  ; $BE ĩ
	db $88, ACCENT_F_NANG ; $BF ị
; $C0-$C4: ú ù ủ ũ ụ (base: u = $94)
	db $94, ACCENT_F_SAC  ; $C0 ú
	db $94, ACCENT_F_HUY  ; $C1 ù
	db $94, ACCENT_F_HOI  ; $C2 ủ
	db $94, ACCENT_F_NGA  ; $C3 ũ
	db $94, ACCENT_F_NANG ; $C4 ụ
; $C5-$CA: ư ứ ừ ử ữ ự (base: ư = TILE_UHORN)
	db TILE_UHORN, ACCENT_NONE  ; $C5 ư
	db TILE_UHORN, ACCENT_F_SAC  ; $C6 ứ
	db TILE_UHORN, ACCENT_F_HUY  ; $C7 ừ
	db TILE_UHORN, ACCENT_F_HOI  ; $C8 ử
	db TILE_UHORN, ACCENT_F_NGA  ; $C9 ữ
	db TILE_UHORN, ACCENT_F_NANG ; $CA ự
; $CB-$CF: ó ò ỏ õ ọ (base: o = $8E)
	db $8E, ACCENT_F_SAC  ; $CB ó
	db $8E, ACCENT_F_HUY  ; $CC ò
	db $8E, ACCENT_F_HOI  ; $CD ỏ
	db $8E, ACCENT_F_NGA  ; $CE õ
	db $8E, ACCENT_F_NANG ; $CF ọ
; $D0-$D5: ô ố ồ ổ ỗ ộ (base: ô = TILE_OCIRC)
	db TILE_OCIRC, ACCENT_NONE  ; $D0 ô
	db TILE_OCIRC, ACCENT_F_SAC  ; $D1 ố
	db TILE_OCIRC, ACCENT_F_HUY  ; $D2 ồ
	db TILE_OCIRC, ACCENT_F_HOI  ; $D3 ổ
	db TILE_OCIRC, ACCENT_F_NGA  ; $D4 ỗ
	db TILE_OCIRC, ACCENT_F_NANG ; $D5 ộ
; $D6-$DB: ơ ớ ờ ở ỡ ợ (base: ơ = TILE_OHORN)
	db TILE_OHORN, ACCENT_NONE  ; $D6 ơ
	db TILE_OHORN, ACCENT_F_SAC  ; $D7 ớ
	db TILE_OHORN, ACCENT_F_HUY  ; $D8 ờ
	db TILE_OHORN, ACCENT_F_HOI  ; $D9 ở
	db TILE_OHORN, ACCENT_F_NGA  ; $DA ỡ
	db TILE_OHORN, ACCENT_F_NANG ; $DB ợ
; $DC-$DF: ý đ ỷ ỹ
	db $98, ACCENT_F_SAC  ; $DC ý
	db TILE_DSTROKE, ACCENT_NONE  ; $DD đ (base character, no accent)
	db $98, ACCENT_F_HOI  ; $DE ỷ
	db $98, ACCENT_F_NGA  ; $DF ỹ
; Extended range $E0-$E5: pass-through entries for non-Vietnamese chars + ỳ
	db $E0, ACCENT_NONE   ; $E0 ' (apostrophe pass-through)
	db $E1, ACCENT_NONE   ; $E1 <PK> (pass-through, CheckDict usually catches first)
	db $E2, ACCENT_NONE   ; $E2 <MN> (pass-through, CheckDict usually catches first)
	db $E3, ACCENT_NONE   ; $E3 - (hyphen pass-through)
	db $E4, ACCENT_NONE   ; $E4 ← (left arrow pass-through)
	db $98, ACCENT_F_HUY  ; $E5 ỳ


_PlaceAccentedChar::
; Banked implementation of Vietnamese accent decomposition.
; Called via farcall from PlaceAccentedChar in home/text.asm.
; Input:  b = charmap code ($A0-$DF), de = current tilemap position
; Output: hl = tilemap position + 1 (cursor advanced)
	; Calculate table offset: (b - VN_ACCENT_START) * 2
	ld a, b
	sub VN_ACCENT_START
	add a ; a = offset * 2
	ld c, a
	ld b, 0

	; Look up base_tile and accent_flags from table
	ld hl, VnAccentDecompTable
	add hl, bc
	ld b, [hl] ; b = base_tile
	inc hl
	ld c, [hl] ; c = accent_flags

	; Set hl = tilemap position
	ld h, d
	ld l, e

	; Check uppercase flag
	ldh a, [hVnUpperFlag]
	and a
	jr z, .write_base
	; Clear the flag
	xor a
	ldh [hVnUpperFlag], a
	; Remap base tile to uppercase if it's a special Vietnamese base char
	ld a, b
	cp TILE_DSTROKE
	jr z, .remap_dstroke
	cp TILE_ABREVE
	jr c, .write_base ; below $D7, no remap needed (plain vowels already uppercase)
	cp TILE_UHORN + 1
	jr nc, .write_base ; above $DC, no remap needed
	; $D7-$DC → $BA-$BF: subtract (TILE_ABREVE - TILE_ABREVE_U)
	sub TILE_ABREVE - TILE_ABREVE_U
	ld b, a
	jr .write_base
.remap_dstroke
	ld b, TILE_DSTROKE_U

.write_base
	; Write base glyph tile to current tilemap position
	ld [hl], b

	; Check accent_flags
	ld a, c
	and a
	jr z, .accent_done ; ACCENT_NONE: no accents to place

	; Check for tone mark (bits 2-0)
	ld a, c
	and %00000111 ; isolate tone bits
	jr z, .check_nang ; no tone, skip to nặng check

	; Place tone accent tile at hl - SCREEN_WIDTH (row above)
	push hl
	push bc
	ld bc, -SCREEN_WIDTH
	add hl, bc
	; a = tone (1-4), compute accent tile: ACC_SAC + (tone - 1) = $C5 + tone
	add ACC_SAC - 1 ; a = accent tile code for this tone
	ld b, a ; b = new tone tile

	; Check if there's already a nặng tile from another line above
	ld a, [hl]
	cp ACC_NANG
	jr nz, .write_tone
	; Existing ACC_NANG: upgrade to compound (ACC_NANG + tone)
	ld a, b
	add ACC_NANG - ACC_SAC + 1 ; convert tone tile to compound: ACC_NANG_SAC, etc.
	ld [hl], a
	jr .tone_done
.write_tone
	ld [hl], b
.tone_done
	pop bc
	pop hl

.check_nang
	; Check for nặng (bit 3)
	ld a, c
	bit 3, a
	jr z, .accent_done

	; Place nặng accent tile at hl + SCREEN_WIDTH (row below)
	push hl
	ld bc, SCREEN_WIDTH
	add hl, bc

	; Check if there's already a tone tile from another line below
	ld a, [hl]
	cp ACC_SAC
	jr c, .write_nang ; below ACC_SAC range, just write nặng
	cp ACC_NGA + 1
	jr nc, .write_nang ; above ACC_NGA range, just write nặng
	; Existing tone tile (ACC_SAC..ACC_NGA): upgrade to compound
	; compound = tone_tile + (ACC_NANG_SAC - ACC_SAC) = tone_tile + 5
	add ACC_NANG_SAC - ACC_SAC
	ld [hl], a
	jr .nang_done
.write_nang
	ld a, ACC_NANG
	ld [hl], a
.nang_done
	pop hl

.accent_done
	inc hl ; advance tilemap position (like hli)
	ret
