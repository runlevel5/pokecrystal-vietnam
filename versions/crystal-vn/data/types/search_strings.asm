PokedexTypeSearchStrings:
; entries correspond with PokedexTypeSearchConversionTable (see data/types/search_types.asm)
; NOTE: Using lowercase Vietnamese chars to avoid 2-byte <UPPER> encoding in fixed-width table.
; TODO: Widen table to support uppercase Vietnamese chars properly.
	table_width POKEDEX_TYPE_STRING_LENGTH
	db "  ----  @"
	db "b.thường@"
	db "  lửa   @"
	db "  nước  @"
	db "   cỏ   @"
	db "  điện  @"
	db "đá băng @"
	db "võ thuật@"
	db "  độc   @"
	db "  đất   @"
	db "bay lượn@"
	db "tâm linh@"
	db " sâu bọ @"
	db " sỏi đá @"
	db "   ma   @"
	db "  rồng  @"
	db " hắc ám @"
	db "  thép  @"
	assert_table_length NUM_TYPES + 1
