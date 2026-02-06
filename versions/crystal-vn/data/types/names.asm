; pokemon-translate-lint: max-length=8
TypeNames:
; entries correspond to types (see constants/type_constants.asm)
	table_width 2

	dw Normal
	dw Fighting
	dw Flying
	dw Poison
	dw Ground
	dw Rock
	dw Bird
	dw Bug
	dw Ghost
	dw Steel
	assert_table_length UNUSED_TYPES

rept UNUSED_TYPES_END - UNUSED_TYPES - 1 ; discount CURSE_TYPE
	dw Normal
endr
	dw CurseType
	assert_table_length UNUSED_TYPES_END

	dw Fire
	dw Water
	dw Grass
	dw Electric
	dw Psychic
	dw Ice
	dw Dragon
	dw Dark
	assert_table_length TYPES_END

Normal:    db "B.THƯỜNG@"
Fighting:  db "VÕ THUẬT@"
Flying:    db "BAY LƯỢN@"
Poison:    db "ĐỘC@"
CurseType: db "???@"
Fire:      db "LỬA@"
Water:     db "NƯỚC@"
Grass:     db "CỎ@"
Electric:  db "ĐIỆN@"
Psychic:   db "TÂM LINH@"
Ice:       db "ĐÁ BĂNG@"
Ground:    db "ĐẤT@"
Rock:      db "SỎI ĐÁ@"
Bird:      db "CHIM@"
Bug:       db "SÂU BỌ@"
Ghost:     db "MA@"
Steel:     db "THÉP@"
Dragon:    db "RỒNG@"
Dark:      db "HẮC ÁM@"
