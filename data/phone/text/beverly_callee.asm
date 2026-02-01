BeverlyAnswerPhoneText:
	text "Xin chào, đây là"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Ồ! Chào buổi sáng"
	line "<PLAYER>."
	done

BeverlyAnswerPhoneDayText:
	text "Xin chào, đây là"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Ồ! Chào ngày tốt,"
	line "<PLAYER>."
	done

BeverlyAnswerPhoneNiteText:
	text "Xin chào, đây là"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Ồ! Chào buổi tối,"
	line "<PLAYER>."
	done

BeverlyGreetText:
	text "Xin chào,"
	line "<PLAYER>. Chào"
	cont "buổi sáng."

	para "Đây là @"
	text_ram wStringBuffer3
	text "."
	line "Cậu đang ngủ à?"
	done

BeverlyGreetDayText:
	text "Chào, <PLAYER>."
	line "Đây là @"
	text_ram wStringBuffer3
	text "."

	para "Cậu thế nào rồi?"
	done

BeverlyGreetNiteText:
	text "Chào, <PLAYER>."
	line "Đây là @"
	text_ram wStringBuffer3
	text "."

	para "Cậu đã thức à?"
	done

BeverlyGenericText:
	text "Giữ #MON cậu"
	line "vui vẻ chứ?"

	para "@"
	text_ram wStringBuffer4
	text " của tớ"
	line "khỏe mạnh. Nó ăn"
	cont "nhiều mỗi ngày."
	done
