ErinAnswerPhoneText:
	text "Vâng, đây là"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Ồ. Chào, <PLAY_G>!"
	line "Chào buổi sáng!"
	done

ErinAnswerPhoneDayText:
	text "Vâng, đây là"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Ồ, chào, <PLAY_G>!"
	line "Yahoo!"
	done

ErinAnswerPhoneNiteText:
	text "Vâng, đây là"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Ồ, chào, <PLAY_G>!"
	done

ErinGreetText:
	text "<PLAY_G>!"

	para "Đây là @"
	text_ram wStringBuffer3
	text "!"
	line "Chào buổi sáng!"
	done

ErinGreetDayText:
	text "<PLAY_G>!"

	para "Đây là @"
	text_ram wStringBuffer3
	text "!"
	line "Làm việc chăm chỉ?"
	done

ErinGreetNiteText:
	text "<PLAY_G>!"

	para "Đây là @"
	text_ram wStringBuffer3
	text "!"
	line "Cậu còn thức à?"
	done

ErinGenericText:
	text "Cậu có nuôi"
	line "#MON không?"

	para "Này, @"
	text_ram wStringBuffer4
	text_start
	line "của @"
	text_ram wStringBuffer3
	text_start
	cont "trông tốt đấy!"
	done
