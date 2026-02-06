PokedexTypeSearchStrings:
; entries correspond with PokedexTypeSearchConversionTable (see data/types/search_types.asm)
	table_width POKEDEX_TYPE_STRING_LENGTH
	db "  ----  @"
	db "B.THƯỜNG@"
	db "  LỬA   @"
	db "  NƯỚC  @"
	db "   CỎ   @"
	db "  ĐIỆN  @"
	db "ĐÁ BĂNG @"
	db "VÕ THUẬT@"
	db "  ĐỘC   @"
	db "  ĐẤT   @"
	db "BAY LƯỢN@"
	db "TÂM LINH@"
	db " SÂU BỌ @"
	db " SỎI ĐÁ @"
	db "   MA   @"
	db "  RỒNG  @"
	db " HẮC ÁM @"
	db "  THÉP  @"
	assert_table_length NUM_TYPES + 1
