BillPhoneMornGreetingText:
	text "Chào buổi sáng!"

	para "Đây là DỊCH VỤ"
	line "QUẢN LÝ HỆ THỐNG"

	para "LƯU TRỮ"
	line "#MON."
	done

BillPhoneDayGreetingText:
	text "Xin chào!"

	para "Đây là DỊCH VỤ"
	line "QUẢN LÝ HỆ THỐNG"

	para "LƯU TRỮ"
	line "#MON."
	done

BillPhoneNiteGreetingText:
	text "Chào buổi tối!"

	para "Đây là DỊCH VỤ"
	line "QUẢN LÝ HỆ THỐNG"

	para "LƯU TRỮ"
	line "#MON."
	done

BillPhoneGenericText:
	text "Ai đang gọi vậy?"

	para "<PLAY_G> phải ko?"
	line "Đợi một chút…"

	para "<……>"
	line "<……>"
	done

BillPhoneNotFullText:
	text "Cảm ơn đã chờ"
	line "đợi!"

	para "<PLAY_G>, BOX còn"
	line "chỗ cho @"
	text_ram wStringBuffer3
	text_start
	cont "#MON nữa."

	para "Ra ngoài và lấp"
	line "đầy nó đi!"
	done

BillPhoneNearlyFullText:
	text "Cảm ơn đã chờ"
	line "đợi!"

	para "<PLAY_G>, BOX chỉ"
	line "còn chỗ cho"
	cont "@"
	text_ram wStringBuffer3
	text " #MON nữa."

	para "Có lẽ bạn nên đổi"
	line "BOX đi."
	done

BillPhoneFullText:
	text "Cảm ơn đã chờ"
	line "đợi!"

	para "<PLAY_G>, BOX của"
	line "bạn đã đầy!"

	para "Bạn phải đổi BOX"
	line "nếu muốn bắt thêm"

	para "#MON."
	done

BillPhoneNewlyFullText:
	text "Chào, <PLAY_G>?"
	line "Tôi là BILL đây!"

	para "Cảm ơn đã dùng HỆ"
	line "THỐNG LƯU TRỮ."

	para "#MON vừa gửi đã"
	line "làm đầy BOX"
	cont "của bạn."

	para "Bạn phải đổi BOX"
	line "nếu muốn bắt thêm"

	para "#MON nữa."

	para "Tạm biệt nhé!"
	done
