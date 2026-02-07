SECTION "Vietnamese Font Data", ROMX

; Decomposition table for Vietnamese accented characters.
; Indexed by accent_id (bits 6-0 of the byte following VN_ACCENT_PREFIX).
; Each entry is 2 bytes: (base_vowel_tile_lowercase, accent_flags).
;
; Base vowel tile is always the lowercase VRAM tile ($A0-$B9 range).
; The caller remaps to uppercase ($80-$99) when bit 7 of accent_id is set.
;
; Accent flags encoding:
;   Bits 7-5: modifier (000=none, 001=breve, 010=circumflex, 011=horn)
;   Bit 3:    has nặng (dot below)
;   Bits 2-0: tone type (0=none, 1=sắc, 2=huyền, 3=hỏi, 4=ngã)

VnAccentDecompTable::
; $00-$04: á à ả ã ạ (base: a = $A0, no modifier)
	db $a0, ACCENT_F_SAC              ; $00 á
	db $a0, ACCENT_F_HUY              ; $01 à
	db $a0, ACCENT_F_HOI              ; $02 ả
	db $a0, ACCENT_F_NGA              ; $03 ã
	db $a0, ACCENT_F_NANG             ; $04 ạ
; $05-$0A: ắ ằ ẳ ẵ ặ ă (base: a = $A0, breve modifier)
	db $a0, MOD_BREVE | ACCENT_F_SAC  ; $05 ắ
	db $a0, MOD_BREVE | ACCENT_F_HUY  ; $06 ằ
	db $a0, MOD_BREVE | ACCENT_F_HOI  ; $07 ẳ
	db $a0, MOD_BREVE | ACCENT_F_NGA  ; $08 ẵ
	db $a0, MOD_BREVE | ACCENT_F_NANG ; $09 ặ
	db $a0, MOD_BREVE | ACCENT_NONE   ; $0A ă
; $0B-$10: ấ ầ ẩ ẫ ậ â (base: a = $A0, circumflex modifier)
	db $a0, MOD_CIRC | ACCENT_F_SAC   ; $0B ấ
	db $a0, MOD_CIRC | ACCENT_F_HUY   ; $0C ầ
	db $a0, MOD_CIRC | ACCENT_F_HOI   ; $0D ẩ
	db $a0, MOD_CIRC | ACCENT_F_NGA   ; $0E ẫ
	db $a0, MOD_CIRC | ACCENT_F_NANG  ; $0F ậ
	db $a0, MOD_CIRC | ACCENT_NONE    ; $10 â
; $11-$15: é è ẻ ẽ ẹ (base: e = $A4, no modifier)
	db $a4, ACCENT_F_SAC              ; $11 é
	db $a4, ACCENT_F_HUY              ; $12 è
	db $a4, ACCENT_F_HOI              ; $13 ẻ
	db $a4, ACCENT_F_NGA              ; $14 ẽ
	db $a4, ACCENT_F_NANG             ; $15 ẹ
; $16-$1B: ế ề ể ễ ệ ê (base: e = $A4, circumflex modifier)
	db $a4, MOD_CIRC | ACCENT_F_SAC   ; $16 ế
	db $a4, MOD_CIRC | ACCENT_F_HUY   ; $17 ề
	db $a4, MOD_CIRC | ACCENT_F_HOI   ; $18 ể
	db $a4, MOD_CIRC | ACCENT_F_NGA   ; $19 ễ
	db $a4, MOD_CIRC | ACCENT_F_NANG  ; $1A ệ
	db $a4, MOD_CIRC | ACCENT_NONE    ; $1B ê
; $1C-$20: í ì ỉ ĩ ị (base: i = $A8, no modifier)
	db $a8, ACCENT_F_SAC              ; $1C í
	db $a8, ACCENT_F_HUY              ; $1D ì
	db $a8, ACCENT_F_HOI              ; $1E ỉ
	db $a8, ACCENT_F_NGA              ; $1F ĩ
	db $a8, ACCENT_F_NANG             ; $20 ị
; $21-$25: ó ò ỏ õ ọ (base: o = $AE, no modifier)
	db $ae, ACCENT_F_SAC              ; $21 ó
	db $ae, ACCENT_F_HUY              ; $22 ò
	db $ae, ACCENT_F_HOI              ; $23 ỏ
	db $ae, ACCENT_F_NGA              ; $24 õ
	db $ae, ACCENT_F_NANG             ; $25 ọ
; $26-$2B: ố ồ ổ ỗ ộ ô (base: o = $AE, circumflex modifier)
	db $ae, MOD_CIRC | ACCENT_F_SAC   ; $26 ố
	db $ae, MOD_CIRC | ACCENT_F_HUY   ; $27 ồ
	db $ae, MOD_CIRC | ACCENT_F_HOI   ; $28 ổ
	db $ae, MOD_CIRC | ACCENT_F_NGA   ; $29 ỗ
	db $ae, MOD_CIRC | ACCENT_F_NANG  ; $2A ộ
	db $ae, MOD_CIRC | ACCENT_NONE    ; $2B ô
; $2C-$31: ớ ờ ở ỡ ợ ơ (base: o = $AE, horn modifier)
	db $ae, MOD_HORN | ACCENT_F_SAC   ; $2C ớ
	db $ae, MOD_HORN | ACCENT_F_HUY   ; $2D ờ
	db $ae, MOD_HORN | ACCENT_F_HOI   ; $2E ở
	db $ae, MOD_HORN | ACCENT_F_NGA   ; $2F ỡ
	db $ae, MOD_HORN | ACCENT_F_NANG  ; $30 ợ
	db $ae, MOD_HORN | ACCENT_NONE    ; $31 ơ
; $32-$36: ú ù ủ ũ ụ (base: u = $B4, no modifier)
	db $b4, ACCENT_F_SAC              ; $32 ú
	db $b4, ACCENT_F_HUY              ; $33 ù
	db $b4, ACCENT_F_HOI              ; $34 ủ
	db $b4, ACCENT_F_NGA              ; $35 ũ
	db $b4, ACCENT_F_NANG             ; $36 ụ
; $37-$3C: ứ ừ ử ữ ự ư (base: u = $B4, horn modifier)
	db $b4, MOD_HORN | ACCENT_F_SAC   ; $37 ứ
	db $b4, MOD_HORN | ACCENT_F_HUY   ; $38 ừ
	db $b4, MOD_HORN | ACCENT_F_HOI   ; $39 ử
	db $b4, MOD_HORN | ACCENT_F_NGA   ; $3A ữ
	db $b4, MOD_HORN | ACCENT_F_NANG  ; $3B ự
	db $b4, MOD_HORN | ACCENT_NONE    ; $3C ư
; $3D-$40: ý ỳ ỷ ỹ (base: y = $B8, no modifier)
	db $b8, ACCENT_F_SAC              ; $3D ý
	db $b8, ACCENT_F_HUY              ; $3E ỳ
	db $b8, ACCENT_F_HOI              ; $3F ỷ
	db $b8, ACCENT_F_NGA              ; $40 ỹ


_PlaceAccentedChar::
; Banked implementation of Vietnamese accent decomposition.
; Called via farcall from PlaceAccentedChar in home/text.asm.
;
; Input:  b = accent_id (bit 7 = uppercase, bits 6-0 = table index)
;         de = current tilemap position
; Output: hl = tilemap position + 1 (cursor advanced)

	; Extract uppercase flag into carry
	ld a, b
	and VN_UPPER_MASK
	ld c, a           ; c = uppercase flag ($80 or $00)

	; Calculate table offset: (b & $7F) * 2
	ld a, b
	and VN_ID_MASK
	add a              ; a = index * 2
	ld l, a
	ld h, 0

	; Look up base_tile and accent_flags from table
	push bc
	ld bc, VnAccentDecompTable
	add hl, bc
	pop bc
	ld a, [hli]
	ld b, a            ; b = base_tile (lowercase)
	ld a, [hl]         ; a = accent_flags

	; Save accent_flags in c, keep uppercase flag in stack
	push af            ; save accent_flags
	ld a, c            ; a = uppercase flag
	and a

	; Set hl = tilemap position
	ld h, d
	ld l, e

	jr z, .write_base
	; Uppercase: remap base tile from lowercase to uppercase
	ld a, b
	sub UPPER_TO_LOWER ; $A0+ → $80+ (lowercase to uppercase)
	ld b, a

.write_base
	; Write base glyph tile to current tilemap position
	ld [hl], b

	; Restore accent_flags
	pop af             ; a = accent_flags
	ld c, a

	; If no accent flags at all, skip accent placement
	and a
	jr z, .accent_done

	; --- Determine the accent tile to place above ---
	; Extract modifier (bits 7-5) and tone (bits 2-0)
	ld a, c
	and MOD_MASK       ; isolate modifier bits
	ld b, a            ; b = modifier

	ld a, c
	and TONE_MASK      ; isolate tone bits
	ld d, a            ; d = tone (0-4)

	; Check if we have nặng (bit 3)
	bit 3, c
	jr z, .no_nang

	; --- Has nặng: need to place accent tile BELOW (row below) ---
	; Also need to compute the accent tile for row ABOVE that includes
	; both modifier and tone (if any), or just modifier, or just nặng compound.

	; First, compute and place the ABOVE accent tile
	; If modifier != 0 OR tone != 0, we need an accent tile above
	ld a, b            ; modifier
	or d               ; modifier | tone
	jr z, .nang_only

	; Has modifier and/or tone WITH nặng:
	; Place modifier/tone accent tile ABOVE the character
	call _ComputeAccentTile
	push hl
	push bc
	ld bc, -SCREEN_WIDTH
	add hl, bc
	ld [hl], a
	pop bc
	pop hl
	; Place nặng dot BELOW the character
	push hl
	push bc
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld a, ACC_NANG
	ld [hl], a
	pop bc
	pop hl
	jr .accent_done

.nang_only
	; Only nặng, no modifier, no tone
	; Place ACC_NANG below the character
	push hl
	push bc
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld a, ACC_NANG
	ld [hl], a
	pop bc
	pop hl
	jr .accent_done

.no_nang
	; No nặng — just modifier and/or tone above
	ld a, b            ; modifier
	or d               ; modifier | tone
	jr z, .accent_done ; no accent at all (shouldn't happen but safety)

	call _ComputeAccentTile
	; a = accent tile for above row
	push hl
	push bc
	ld bc, -SCREEN_WIDTH
	add hl, bc

	; Check if there's already a nặng tile from a previous line's character
	ld b, a            ; save our accent tile
	ld a, [hl]
	cp ACC_NANG
	jr nz, .write_above
	; Existing ACC_NANG: need to upgrade to nặng compound
	; Recompute using nặng variant
	ld a, b            ; restore our accent tile
	; Convert non-nặng accent tile to nặng compound
	call _ConvertToNangCompound
	ld [hl], a
	jr .above_done
.write_above
	ld [hl], b
.above_done
	pop bc
	pop hl
	jr .accent_done

.accent_done
	inc hl             ; advance tilemap position
	ret


_ComputeAccentTile:
; Compute the accent tile code for the row ABOVE the character.
; Input:  b = modifier (MOD_NONE/MOD_BREVE/MOD_CIRC/MOD_HORN, bits 7-5)
;         d = tone (TONE_NONE..TONE_NGA, bits 2-0)
; Output: a = accent VRAM tile code
; Clobbers: a

	ld a, b            ; modifier
	and a
	jr z, .tone_only

	; Has modifier — select base of modifier group
	cp MOD_BREVE
	jr z, .breve
	cp MOD_CIRC
	jr z, .circ
	; Must be MOD_HORN
	ld a, ACC_HORN     ; base for horn group
	jr .add_tone

.breve
	ld a, ACC_BREVE    ; base for breve group
	jr .add_tone

.circ
	ld a, ACC_CIRC     ; base for circumflex group
	jr .add_tone

.tone_only
	; No modifier, tone only
	ld a, d            ; tone (1-4)
	and a
	jr z, .no_accent   ; tone=0 shouldn't happen here
	add ACC_SAC - 1    ; ACC_SAC=tone1, ACC_HUY=tone2, etc.
	ret

.add_tone
	; a = group base (ACC_BREVE/ACC_CIRC/ACC_HORN)
	; d = tone (0=none means standalone modifier, 1-4 = tone)
	add d              ; base + tone offset
	ret

.no_accent
	ld a, $7f          ; space tile (shouldn't happen)
	ret


_ComputeNangAccentTile:
; Compute the accent tile for the row ABOVE when the char has nặng.
; The nặng dot occupies the TOP half of the accent tile.
; The modifier+tone occupies the BOTTOM half.
;
; Input:  b = modifier (bits 7-5), d = tone (bits 2-0)
; Output: a = nặng compound accent VRAM tile code
; Clobbers: a

	ld a, b            ; modifier
	and a
	jr z, .nang_tone_only

	; Has modifier with nặng
	cp MOD_BREVE
	jr z, .nang_breve
	cp MOD_CIRC
	jr z, .nang_circ
	; Must be MOD_HORN
	ld a, ACC_NANG_HORN ; base for nặng+horn group
	jr .add_tone

.nang_breve
	ld a, ACC_NANG_BREVE ; base for nặng+breve group
	jr .add_tone

.nang_circ
	ld a, ACC_NANG_CIRC  ; base for nặng+circumflex group
	jr .add_tone

.nang_tone_only
	; No modifier, just nặng + tone
	ld a, d            ; tone (0-4)
	and a
	jr z, .nang_standalone
	add ACC_NANG_SAC - 1 ; ACC_NANG_SAC=tone1, etc.
	ret

.nang_standalone
	ld a, ACC_NANG     ; just the dot
	ret

.add_tone
	; a = nặng group base, d = tone (0=none, 1-4)
	add d
	ret


_ConvertToNangCompound:
; Convert a non-nặng accent tile to its nặng compound equivalent.
; Called when we're writing an accent tile above but find ACC_NANG already there.
;
; Input:  a = non-nặng accent tile (ACC_SAC..ACC_NGA, ACC_BREVE..etc)
; Output: a = nặng compound tile
; Clobbers: a

	; Tone-only tiles: ACC_SAC($BC)..ACC_NGA($BF) → ACC_NANG_SAC($DF)..ACC_NANG_NGA($E2)
	cp ACC_SAC
	jr c, .try_breve
	cp ACC_NGA + 1
	jr nc, .try_breve
	add ACC_NANG_SAC - ACC_SAC ; $DF - $BC = $23
	ret

.try_breve
	; Breve tiles: ACC_BREVE($C1)..ACC_BREVE_NGA($C5) → ACC_NANG_BREVE($C6)..ACC_NANG_BREVE_NGA($CA)
	cp ACC_BREVE
	jr c, .try_circ
	cp ACC_BREVE_NGA + 1
	jr nc, .try_circ
	add ACC_NANG_BREVE - ACC_BREVE ; $C6 - $C1 = 5
	ret

.try_circ
	; Circumflex tiles: ACC_CIRC($CB)..ACC_CIRC_NGA($CF) → ACC_NANG_CIRC($D0)..ACC_NANG_CIRC_NGA($D4)
	cp ACC_CIRC
	jr c, .try_horn
	cp ACC_CIRC_NGA + 1
	jr nc, .try_horn
	add ACC_NANG_CIRC - ACC_CIRC ; $D0 - $CB = 5
	ret

.try_horn
	; Horn tiles: ACC_HORN($D5)..ACC_HORN_NGA($D9) → ACC_NANG_HORN($DA)..ACC_NANG_HORN_NGA($DE)
	cp ACC_HORN
	jr c, .unchanged
	cp ACC_HORN_NGA + 1
	jr nc, .unchanged
	add ACC_NANG_HORN - ACC_HORN ; $DA - $D5 = 5
	ret

.unchanged
	ret ; shouldn't happen, return as-is
