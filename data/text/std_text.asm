NurseMornText:
	text "Chào buổi sáng!"
	line "Chào mừng đến"
	cont "T.TÂM #MON."
	done

NurseDayText:
	text "Xin chào!"
	line "Chào mừng đến"
	cont "T.TÂM #MON."
	done

NurseNiteText:
	text "Chào buổi tối!"
	line "Bạn ra muộn thế."

	para "Chào mừng đến"
	line "T.TÂM #MON."
	done

PokeComNurseMornText:
	text "Chào buổi sáng!"

	para "Đây là T.TÂM"
	line "LIÊN LẠC #MON"

	para "--hay gọi là"
	line "T.TÂM #COM."
	done

PokeComNurseDayText:
	text "Xin chào!"

	para "Đây là T.TÂM"
	line "LIÊN LẠC #MON"

	para "--hay gọi là"
	line "T.TÂM #COM."
	done

PokeComNurseNiteText:
	text "Vui thấy bạn"
	line "làm việc khuya."

	para "Đây là T.TÂM"
	line "LIÊN LẠC #MON"

	para "--hay gọi là"
	line "T.TÂM #COM."
	done

NurseAskHealText:
	text "Chúng tôi có"
	line "thể hồi phục"
	cont "#MON của bạn."

	para "Bạn có muốn hồi"
	line "phục #MON?"
	done

NurseTakePokemonText:
	text "OK, cho tôi xem"
	line "#MON nhé?"
	done

NurseReturnPokemonText:
	text "Cảm ơn bạn đã"
	line "chờ đợi."

	para "#MON của bạn"
	line "đã hồi phục."
	done

NurseGoodbyeText:
	text "Hy vọng gặp lại"
	line "bạn."
	done

; not used
	text "Hy vọng gặp lại"
	line "bạn."
	done

NursePokerusText:
	text "#MON của bạn"
	line "có vẻ đã bị"

	para "nhiễm vi sinh"
	line "vật nhỏ."

	para "#MON của bạn"
	line "khỏe mạnh và"
	cont "có vẻ ổn."

	para "Nhưng chúng tôi"
	line "không nói gì"

	para "thêm ở T.TÂM"
	line "#MON."
	done

PokeComNursePokerusText:
	text "#MON của bạn"
	line "có vẻ đã bị"

	para "nhiễm vi sinh"
	line "vật nhỏ."

	para "#MON của bạn"
	line "khỏe mạnh và"
	cont "có vẻ ổn."

	para "Nhưng chúng tôi"
	line "không nói gì"
	cont "thêm được."
	done

DifficultBookshelfText:
	text "Đầy sách"
	line "khó hiểu."
	done

PictureBookshelfText:
	text "Cả bộ sưu tập"
	line "sách tranh"
	cont "#MON!"
	done

MagazineBookshelfText:
	text "Tạp chí #MON…"
	line "#MON PAL,"

	para "#MON HANDBOOK,"
	line "#MON GRAPH…"
	done

TeamRocketOathText:
	text "LỜI THỀ ROCKET"

	para "Ăn cắp #MON"
	line "để kiếm lời!"

	para "Bóc lột #MON"
	line "để kiếm lời!"

	para "Mọi #MON tồn"
	line "tại vì vinh"
	cont "quang ROCKET!"
	done

IncenseBurnerText:
	text "Cái gì đây?"

	para "À, đó là lư"
	line "đốt hương!"
	done

MerchandiseShelfText:
	text "Nhiều hàng hóa"
	line "#MON!"
	done

LookTownMapText:
	text "Đây là BẢN ĐỒ."
	done

WindowText:
	text "Bóng của tôi!"
	line "Trông đẹp đấy!"
	done

TVText:
	text "Đây là TV."
	done

HomepageText:
	text "TRANG CHỦ"
	line "BÁO #MON…"

	para "Chưa được"
	line "cập nhật…"
	done

; not used
	text "ĐÀI #MON!"

	para "Gọi điện gửi"
	line "yêu cầu ngay!"
	done

TrashCanText:
	text "Không có gì"
	line "ở đây…"
	done

; not used
	text "Có thể #MON"
	line "dời được này."
	done

; not used
	text "Có thể #MON"
	line "phá được này."
	done

PokecenterSignText:
	text "Phục hồi #MON!"
	line "T.TÂM #MON"
	done

MartSignText:
	text "Mọi Thứ Cho"
	line "#MON Của Bạn"

	para "C.HÀNG #MART"
	done

ContestResults_ReadyToJudgeText:
	text "Giờ chúng tôi"
	line "sẽ đánh giá"
	cont "#MON bạn bắt."

	para "<……>"
	line "<……>"

	para "Chúng tôi đã"
	line "chọn người thắng!"

	para "Bạn sẵn sàng"
	line "chưa?"
	done

ContestResults_PlayerWonAPrizeText:
	text "<PLAYER>, hạng @"
	text_ram wStringBuffer3
	text_start
	line "thắng giải"
	cont "@"
	text_ram wStringBuffer4
	text "!"
	done

ReceivedItemText:
	text "<PLAYER> nhận"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

ContestResults_JoinUsNextTimeText:
	text "Hãy tham gia"
	line "Cuộc Thi tới!"
	done

ContestResults_ConsolationPrizeText:
	text "Người khác"
	line "nhận BERRY làm"
	cont "giải an ủi!"
	done

ContestResults_DidNotWinText:
	text "Hy vọng bạn làm"
	line "tốt hơn lần sau."
	done

ContestResults_ReturnPartyText:
	text "Chúng tôi trả"
	line "lại #MON mà"

	para "chúng tôi giữ."
	line "Đây của bạn!"
	done

ContestResults_PartyFullText:
	text "Đội bạn đầy,"
	line "nên #MON đã"

	para "gửi vào BOX PC"
	line "của BILL."
	done

GymStatue_CityGymText:
	text_ram wStringBuffer3
	text_start
	line "GYM #MON"
	done

GymStatue_WinningTrainersText:
	text "QUÁN QUÂN: @"
	text_ram wStringBuffer4
	text_start
	para "NGƯỜI THẮNG:"
	line "<PLAYER>"
	done

CoinVendor_WelcomeText:
	text "Chào mừng đến"
	line "KHU TRÒ CHƠI."
	done

CoinVendor_NoCoinCaseText:
	text "Bạn cần xu chơi"
	line "game không?"

	para "Ồ, bạn không có"
	line "HỘP XU để đựng"
	cont "xu."
	done

CoinVendor_IntroText:
	text "Bạn cần xu chơi"
	line "game không?"

	para "¥1000 cho 50 xu."
	line "Bạn có muốn"
	cont "mua không?"
	done

CoinVendor_Buy50CoinsText:
	text "Cảm ơn!"
	line "Đây là 50 xu."
	done

CoinVendor_Buy500CoinsText:
	text "Cảm ơn! Đây"
	line "là 500 xu."
	done

CoinVendor_NotEnoughMoneyText:
	text "Bạn không có"
	line "đủ tiền."
	done

CoinVendor_CoinCaseFullText:
	text "Ối! HỘP XU"
	line "của bạn đầy."
	done

CoinVendor_CancelText:
	text "Không mua xu à?"
	line "Hẹn gặp lại!"
	done

BugContestPrizeNoRoomText:
	text "Ồ? TÚI của bạn"
	line "đầy rồi."

	para "Chúng tôi giữ"
	line "cái này hôm nay,"

	para "quay lại khi"
	line "bạn có chỗ."
	done

HappinessText3:
	text "Wow! Bạn và"
	line "#MON thực sự"
	cont "rất thân!"
	done

HappinessText2:
	text "#MON sẽ thân"
	line "thiện hơn nếu"

	para "bạn dành thời"
	line "gian với chúng."
	done

HappinessText1:
	text "Bạn chưa thuần"
	line "hóa #MON."

	para "Nếu bạn không"
	line "tốt, nó sẽ giận."
	done

RegisteredNumber1Text:
	text "<PLAYER> lưu số"
	line "của @"
	text_ram wStringBuffer3
	text "."
	done

RegisteredNumber2Text:
	text "<PLAYER> lưu số"
	line "của @"
	text_ram wStringBuffer3
	text "."
	done
