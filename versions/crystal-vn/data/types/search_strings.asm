PokedexTypeSearchStrings:
; entries correspond with PokedexTypeSearchConversionTable (see data/types/search_strings.asm)
; Each entry must be exactly POKEDEX_TYPE_STRING_LENGTH (11) bytes.
; Accented Vietnamese chars emit 2 bytes ($23 + accent_id), so entries vary in byte size.
; Padding bytes after the "@" terminator fill out shorter entries.
	table_width POKEDEX_TYPE_STRING_LENGTH
	db "  ----  @", 0, 0
	db "b.thường@"
	db "  lửa   @", 0
	db "  nước  @"
	db "   cỏ   @", 0
	db "  điện  @", 0
	db "đá băng @"
	db "võ thuật@"
	db "  độc   @", 0
	db "  đất   @", 0
	db "bay lượn@"
	db "tâm linh@", 0
	db " sâu bọ @"
	db " sỏi đá @"
	db "   ma   @", 0, 0
	db "  rồng  @", 0
	db " hắc ám @"
	db "  thép  @", 0
	assert_table_length NUM_TYPES + 1
