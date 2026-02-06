BethAnswerPhoneText:
	text "A lô, đây là"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Ồ, <PLAY_G>."
	line "Chào buổi sáng."

	para ""
	done

BethAnswerPhoneDayText:
	text "A lô, đây là"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Ồ. Chào, <PLAY_G>."
	done

BethAnswerPhoneNiteText:
	text "A lô, đây là"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Ồ, <PLAY_G>."
	line "Chào buổi tối."
	done

BethGreetText:
	text "Chào buổi sáng,"
	line "<PLAY_G>!"

	para "Đây là @"
	text_ram wStringBuffer3
	text "."
	line "Cậu ngủ à?"
	done

BethGreetDayText:
	text "<PLAY_G>, chào!"
	line "Đây là @"
	text_ram wStringBuffer3
	text "."

	para "Cậu có thời gian"
	line "không?"
	done

BethGreetNiteText:
	text "Chào, <PLAY_G>."
	line "Chào buổi tối."

	para "Đây là @"
	text_ram wStringBuffer3
	text "."

	para "Tớ hy vọng cậu"
	line "thức."
	done

BethGenericText:
	text "Cậu có phải loại"
	line "người hay đến TT"

	para "#MON không?"

	para "Tớ đi mỗi ngày."
	line "Chăm sóc sức khỏe"

	para "#MON là điều cơ"
	line "bản của một HLV"
	cont "#MON."
	done
