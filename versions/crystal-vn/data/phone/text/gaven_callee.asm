GavenAnswerPhoneText:
	text "Xin chào, đây là"
	line "@"
	text_ram wStringBuffer3
	text " đây…"

	para "Chào, <PLAY_G>!"
	line "Chào buổi sáng!"
	done

GavenAnswerPhoneDayText:
	text "Xin chào, đây là"
	line "@"
	text_ram wStringBuffer3
	text " đây…"

	para "Chào, <PLAY_G>!"
	done

GavenAnswerPhoneNiteText:
	text "Xin chào, đây là"
	line "@"
	text_ram wStringBuffer3
	text " đây…"

	para "Chào, <PLAY_G>!"
	line "Chào buổi tối!"
	done

GavenGreetText:
	text "<PLAY_G>, chào"
	line "buổi sáng!"

	para "Là mình đây, @"
	text_ram wStringBuffer3
	text "."
	line "Cậu khỏe không?"
	done

GavenGreetDayText:
	text "Chào, <PLAY_G>!"

	para "Là mình đây, @"
	text_ram wStringBuffer3
	text "."
	line "Cậu khỏe không?"
	done

GavenGreetNiteText:
	text "<PLAY_G>, chào"
	line "buổi tối!"

	para "Là mình đây, @"
	text_ram wStringBuffer3
	text "."
	line "Cậu khỏe không?"
	done

GavenGenericText:
	text "#MON của cậu"
	line "thế nào rồi?"

	para "@"
	text_ram wStringBuffer4
	text " của mình"
	line "tốt như mọi khi."

	para "Hãy cùng cố lên"
	line "và trở thành VĐQG"
	cont "#MON nhé!"
	done
