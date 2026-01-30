_OakText6::
	text "Lúc nãy bạn nói"
	line "tên bạn là?"
	prompt

_OakText7::
	text "<PLAYER>, bạn đã"
	line "sẵn sàng?"

	para "Câu chuyện"
	line "#MON chuẩn bị"
	cont "bắt đầu."

	para "Bạn sẽ đối đầu với"
	line "nhiều thử thách"
	cont "thú vị."

    para "Một thế giới của"
	line "mơ ước và phiêu"

	para "lưu với #MON"
	line "đang chờ đợi bạn!"
	cont "Hãy bắt đầu nào!"

    para "Tôi sẽ gặp bạn"
	line "sau một chút!"
	done

_ClockTimeMayBeWrongText::
	text "Giờ đồng hồ có"
	line "thể bị sai."

	para "Hãy chỉnh lại"
	line "thời gian."
	prompt

_ClockSetWithControlPadText::
	text "Dùng phím điều"
	line "hướng để chỉnh."

	para "Xác nhận: Nút A"
	line "Huỷ:      Nút B"
	done

_ClockIsThisOKText::
	text "Như vậy được chưa?"
	done

_ClockHasResetText::
	text "Đồng hồ đã được"
	line "đặt lại."
	done

_LinkTimeoutText::
	text "Đã hết thời gian."
	line "Hãy thử lại."
	cont ""
	prompt

_LinkTradeCantBattleText::
	text "Nếu bạn đổi con"
	line "#MON đó, bạn sẽ"
	cont "không đấu được."
	prompt

_LinkAbnormalMonText::
	text "@"
	text_ram wStringBuffer1
	text " của"
	line "bạn bè bạn có vẻ"
	cont "bất thường!"
	prompt

_LinkAskTradeForText::
	text "Đổi @"
	text_ram wBufferTrademonNickname
	text_start
	line "lấy @"
	text_ram wStringBuffer1
	text "?"
	done

_MobileBattleMustPickThreeMonText::
	text "Để tham gia trận"
	line "đấu di động, bạn"

	para "phải chọn đội ba"
	line "con #MON."

	para "Được chứ?"
	done

_MobileBattleMoreInfoText::
	text "Cần thêm thông tin"
	line "về đấu di động?"
	done

_MobileBattleRulesText::
	text "Để đấu di động,"
	line "chọn ba #MON."

	para "Thời gian chơi tối"
	line "đa mỗi ngày là 10"

	para "phút cho mỗi người"
	line "chơi kết nối."

	para "Nếu trận đấu không"
	line "kết thúc trong"

	para "giới hạn thời"
	line "gian, người chơi"

	para "có ít #MON ngất"
	line "nhất sẽ thắng."

	para "Nếu hoà, đội mất"
	line "ít HP nhất sẽ"

	para "thắng."
	line ""
	done

_WouldYouLikeToMobileBattleText::
	text "Thời gian còn lại"
	line "hôm nay là @"
	text_decimal wStringBuffer2, 1, 2
	text " phút"

	para "Bạn muốn đấu?"
	line ""
	done

_WantAQuickMobileBattleText::
	text "Chỉ còn @"
	text_decimal wStringBuffer2, 1, 2
	text " phút"
	line "cho hôm nay."

	para "Muốn đấu nhanh?"
	line ""
	done

_WantToRushThroughAMobileBattleText::
	text "Chỉ còn 1 phút"
	line "cho hôm nay!"

	para "Muốn đấu vội?"
	line ""
	done

_PleaseTryAgainTomorrowText::
	text "Còn ít hơn 1 phút"
	line "cho hôm nay!"

	para "Hãy thử lại vào"
	line "ngày mai."
	done

_TryAgainUsingSameSettingsText::
	text "Thử lại với cùng"
	line "cài đặt?"
	done

_MobileBattleLessThanOneMinuteLeftText::
	text "Còn ít hơn 1 phút"
	line "cho hôm nay!"
	done

_MobileBattleNoTimeLeftForLinkingText::
	text "Hết thời gian kết"
	line "nối cho hôm nay."
	done

_PickThreeMonForMobileBattleText::
	text "Chọn ba #MON"
	line "để đấu."
	done

_MobileBattleRemainingTimeText::
	text "Thời gian còn lại"
	line "hôm nay là @"
	text_decimal wStringBuffer2, 1, 2
	text " phút"
	done

_WouldYouLikeToSaveTheGameText::
	text "Bạn có muốn lưu"
	line "trò chơi không?"
	done

_SavingDontTurnOffThePowerText::
	text "ĐANG LƯU… ĐỪNG"
	line "TẮT NGUỒN."
	done

_SavedTheGameText::
	text "<PLAYER> đã lưu"
	line "trò chơi."
	done

_AlreadyASaveFileText::
	text "Đã có file lưu"
	line "rồi. Ghi đè lên"
	cont "được không?"
	done

_AnotherSaveFileText::
	text "Có một file lưu"
	line "khác. Ghi đè lên"
	cont "được không?"
	done

_SaveFileCorruptedText::
	text "File lưu đã bị"
	line "hỏng!"
	prompt

_ChangeBoxSaveText::
	text "Khi bạn đổi HỘP"
	line "#MON, dữ liệu"
	cont "sẽ được lưu. OK?"
	done

_MoveMonWOMailSaveText::
	text "Mỗi khi bạn di"
	line "chuyển #MON, dữ"
	cont "liệu sẽ lưu. OK?"
	done

_WindowAreaExceededErrorText:: ; unreferenced
	text "Vùng lưu cửa sổ"
	line "đã vượt quá."
	done

_WindowPoppingErrorText::
	text "Không có cửa sổ"
	line "nào để đóng."
	done

_CorruptedEventText:: ; unreferenced
	text "Sự kiện bị hỏng!"
	prompt

_ObjectEventText::
	text "Sự kiện đối tượng"
	done

_BGEventText::
	text "Sự kiện nền"
	done

_CoordinatesEventText::
	text "Sự kiện toạ độ"
	done

_ReceivedItemText::
	text "<PLAYER> nhận được"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

_PutItemInPocketText::
	text "<PLAYER> cất"
	line "@"
	text_ram wStringBuffer1
	text " vào"
	cont "@"
	text_ram wStringBuffer3
	text "."
	prompt

_PocketIsFullText::
	text "@"
	text_ram wStringBuffer3
	text " đã đầy…"
	prompt

_SeerSeeAllText::
	text "Ta thấy tất cả."
	line "Ta biết tất cả…"

	para "Đương nhiên, ta"
	line "biết về #MON"
	cont "của ngươi!"
	done

_SeerCantTellAThingText::
	text "Gì cơ? Ta không"
	line "thấy gì cả!"

	para "Sao ta lại không"
	line "biết điều này?"
	done

_SeerNameLocationText::
	text "Hừm… Ta thấy ngươi"
	line "gặp @"
	text_ram wSeerNickname
	text " tại:"
	cont "@"
	text_ram wSeerCaughtLocation
	text "!"
	prompt

_SeerTimeLevelText::
	text "Thời gian là"
	line "@"
	text_ram wSeerTimeOfDay
	text "!"

	para "Cấp độ của nó"
	line "là @"
	text_ram wSeerCaughtLevelString
	text "!"

	para "Ta giỏi chưa?"
	prompt

_SeerTradeText::
	text "Hừm… @"
	text_ram wSeerNickname
	text_start
	line "đến từ @"
	text_ram wSeerOT
	text_start
	cont "qua trao đổi?"

	para "@"
	text_ram wSeerCaughtLocation
	text_start
	line "là nơi @"
	text_ram wSeerOT
	text_start
	cont "gặp @"
	text_ram wSeerNickname
	text "!"
	prompt

_SeerNoLocationText::
	text "Gì!? Lạ thật!"

	para "Ta không hiểu"
	line "làm sao, nhưng"

	para "thật phi thường!"
	line "Ngươi đặc biệt."

	para "Ta không biết"
	line "ngươi gặp nó ở"
	cont "đâu, nhưng nó"

	para "ở cấp @"
	text_ram wSeerCaughtLevelString
	text "."

	para "Ta giỏi chưa?"
	prompt

_SeerEggText::
	text "Này!"

	para "Đó là TRỨNG!"

	para "Ngươi chưa thể"
	line "nói là đã gặp"
	cont "nó được…"
	done

_SeerDoNothingText::
	text "Hừ hừ hừ! Ta thấy"
	line "ngươi sẽ không"
	cont "làm gì!"
	done

_SeerMoreCareText::
	text "Nhân tiện…"

	para "Ngươi nên nuôi"
	line "#MON của mình"

	para "cẩn thận hơn"
	line "một chút."
	done

_SeerMoreConfidentText::
	text "Nhân tiện…"

	para "Có vẻ nó đã"
	line "lớn lên một chút."

	para "@"
	text_ram wSeerNickname
	text " có vẻ"
	line "đang trở nên"
	cont "tự tin hơn."
	done

_SeerMuchStrengthText::
	text "Nhân tiện…"

	para "@"
	text_ram wSeerNickname
	text " đã"
	line "trưởng thành. Nó"
	cont "mạnh hơn nhiều."
	done

_SeerMightyText::
	text "Nhân tiện…"

	para "Nó thực sự đã"
	line "trở nên hùng mạnh!"

	para "@"
	text_ram wSeerNickname
	text " này"
	line "đã trải qua"

	para "nhiều trận đấu"
	line "#MON."

	para "Nó trông tràn"
	line "đầy tự tin."
	done

_SeerImpressedText::
	text "Nhân tiện…"

	para "Ta ấn tượng với"
	line "sự tận tâm của"
	cont "ngươi."

	para "Đã lâu rồi ta"
	line "mới thấy #MON"

	para "hùng mạnh như"
	line "@"
	text_ram wSeerNickname
	text " này."

	para "Ta chắc rằng"
	line "xem @"
	text_ram wSeerNickname
	text_start

	para "chiến đấu sẽ"
	line "khiến ai cũng"
	cont "phấn khích."
	done

_CongratulationsYourPokemonText::
	text "Chúc mừng!"
	line "@"
	text_ram wStringBuffer2
	text " của bạn"
	text_end

	text_end ; unreferenced

_EvolvedIntoText::
	text_start

	para "tiến hóa thành"
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

_StoppedEvolvingText::
	text "Hả? @"
	text_ram wStringBuffer2
	text_start
	line "ngừng tiến hóa!"
	prompt

_EvolvingText::
	text "Gì? @"
	text_ram wStringBuffer2
	text_start
	line "đang tiến hóa!"
	done

_MartHowManyText::
	text "Mua bao nhiêu?"
	done

_MartFinalPriceText::
	text_decimal wItemQuantityChange, 1, 2
	text " @"
	text_ram wStringBuffer2
	text_start
	line "sẽ là ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_HerbShopLadyIntroText::
	text "Xin chào, cưng."

	para "Tôi bán thuốc thảo"
	line "dược giá rẻ."

	para "Chúng tốt lắm,"
	line "nhưng hơi đắng."

	para "#MON của bạn có"
	line "thể không thích."

	para "Hê hê hê…"
	done

_HerbalLadyHowManyText::
	text "Mua bao nhiêu?"
	done

_HerbalLadyFinalPriceText::
	text_decimal wItemQuantityChange, 1, 2
	text " @"
	text_ram wStringBuffer2
	text_start
	line "sẽ là ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_HerbalLadyThanksText::
	text "Cảm ơn cưng."
	line "Hê hê hê…"
	done

_HerbalLadyPackFullText::
	text "Ồ? BA LÔ của bạn"
	line "đầy rồi, cưng."
	done

_HerbalLadyNoMoneyText::
	text "Hê hê… Bạn không"
	line "đủ tiền."
	done

_HerbalLadyComeAgainText::
	text "Quay lại nhé cưng."
	line "Hê hê hê…"
	done

_BargainShopIntroText::
	text "Chào! Muốn xem"
	line "đồ giảm giá không?"

	para "Tôi bán đồ hiếm"
	line "mà không ai khác"

	para "có--nhưng mỗi"
	line "loại chỉ một cái."
	done

_BargainShopFinalPriceText::
	text_ram wStringBuffer2
	text " giá"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text ". Mua không?"
	done

_BargainShopThanksText::
	text "Cảm ơn."
	done

_BargainShopPackFullText::
	text "Ối, BA LÔ của bạn"
	line "đầy cứng rồi."
	done

_BargainShopSoldOutText::
	text "Bạn mua cái đó"
	line "rồi. Tôi hết hàng"
	cont "mất rồi."
	done

_BargainShopNoFundsText::
	text "Ối, bạn không"
	line "đủ tiền."
	done

_BargainShopComeAgainText::
	text "Ghé lại lần sau"
	line "nhé."
	done

_PharmacyIntroText::
	text "Có gì không? Cần"
	line "thuốc không?"
	done

_PharmacyHowManyText::
	text "Mua bao nhiêu?"
	done

_PharmacyFinalPriceText::
	text_decimal wItemQuantityChange, 1, 2
	text " @"
	text_ram wStringBuffer2
	text_start
	line "sẽ là ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_PharmacyThanksText::
	text "Cảm ơn nhiều!"
	done

_PharmacyPackFullText::
	text "Bạn không còn chỗ"
	line "nữa."
	done

_PharmacyNoMoneyText::
	text "Hả? Không đủ"
	line "tiền."
	done

_PharmacyComeAgainText::
	text "Được rồi."
	line "Hẹn gặp lại."
	done

_NothingToSellText::
	text "Bạn không có gì"
	line "để bán."
	prompt

_MartSellHowManyText::
	text "Bán bao nhiêu?"
	done

_MartSellPriceText::
	text "Tôi trả bạn"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."

	para "Được chứ?"
	done

_MartWelcomeText::
	text "Chào mừng! Tôi có"
	line "thể giúp gì?"
	done

_MartThanksText::
	text "Của bạn đây."
	line "Cảm ơn!"
	done

_MartNoMoneyText::
	text "Bạn không đủ"
	line "tiền."
	done

_MartPackFullText::
	text "Bạn không mang"
	line "thêm đồ được nữa."
	done

_MartCantBuyText::
	text "Xin lỗi, tôi không"
	line "mua được cái đó."
	prompt

_MartComeAgainText::
	text "Mời quay lại lần"
	line "sau!"
	done

_MartAskMoreText::
	text "Tôi có thể giúp"
	line "gì nữa không?"
	done

_MartBoughtText::
	text "Nhận ¥@"
	text_decimal hMoneyTemp, 3, 6
	text " cho"
	line "@"
	text_ram wStringBuffer2
	text "."
	done

_SlotsBetHowManyCoinsText::
	text "Cược bao nhiêu"
	line "xu?"
	done

_SlotsStartText::
	text "Bắt đầu!"
	done

_SlotsNotEnoughCoinsText::
	text "Không đủ xu."
	prompt

_SlotsRanOutOfCoinsText::
	text "Chết… Hết xu"
	line "rồi…"
	done

_SlotsPlayAgainText::
	text "Chơi lại không?"
	done

_SlotsLinedUpText::
	text "thẳng hàng!"
	line "Thắng @"
	text_ram wStringBuffer2
	text " xu!"
	done

_SlotsDarnText::
	text "Tiếc thật!"
	done

_MobileStadiumEntryText::
	text "Dữ liệu dùng cho"
	line "MOBILE STADIUM"

	para "của N64 #MON"
	line "STADIUM 2 có thể"
	cont "đọc ở đây."

	para "Đọc dữ liệu?"
	done

_MobileStadiumSuccessText::
	text "Chuyển dữ liệu"
	line "hoàn tất."

	para "Chúc bạn vui với"
	line "các trận MOBILE"

	para "STADIUM trong N64"
	line "#MON STADIUM 2."

	para ""
	done

_MainMenuTimeUnknownText::
	text "Không rõ giờ"
	done

_DeleteSavedLoginPasswordText::
	text "Xóa MẬT KHẨU ĐĂNG"
	line "NHẬP đã lưu?"
	done

_DeletedTheLoginPasswordText::
	text "Đã xóa MẬT KHẨU"
	line "ĐĂNG NHẬP."
	done

_MobilePickThreeMonForBattleText::
	text "Chọn ba #MON"
	line "để chiến đấu."
	prompt

_MobileUseTheseThreeMonText::
	text_ram wMobileParticipant1Nickname
	text ","
	line "@"
	text_ram wMobileParticipant2Nickname
	text " và"
	cont "@"
	text_ram wMobileParticipant3Nickname
	text "."

	para "Dùng ba con này?"
	done

_MobileOnlyThreeMonMayEnterText::
	text "Chỉ được dùng"
	line "ba #MON."
	prompt

_MobileCardFolderIntro1Text::
	text "THƯ MỤC THẺ lưu"
	line "trữ THẺ của bạn"

	para "và bạn bè."

	para "Một THẺ chứa"
	line "thông tin như"

	para "tên, số điện"
	line "thoại và hồ sơ"
	cont "của người đó."

	para ""
	done

_MobileCardFolderIntro2Text::
	text "Đây là THẺ của"
	line "bạn."

	para "Khi đã nhập số"
	line "điện thoại, bạn"

	para "có thể trao đổi"
	line "THẺ với bạn bè."

	para ""
	done

_MobileCardFolderIntro3Text::
	text "Nếu có THẺ của"
	line "bạn bè, bạn có"

	para "thể dùng nó để"
	line "gọi từ điện thoại"

	para "di động ở tầng 2"
	line "TRUNG TÂM #MON."

	para ""
	done

_MobileCardFolderIntro4Text::
	text "Để lưu trữ bộ sưu"
	line "tập THẺ an toàn,"

	para "bạn phải đặt MÃ"
	line "KHÓA cho THƯ MỤC"
	cont "THẺ."

	para ""
	done

_MobileCardFolderAskDeleteText::
	text "Nếu xóa THƯ MỤC"
	line "THẺ, tất cả THẺ"

	para "và MÃ KHÓA cũng"
	line "sẽ bị xóa."

	para "Cảnh báo--THƯ MỤC"
	line "THẺ đã xóa không"
	cont "thể khôi phục."

	para "Muốn xóa THƯ MỤC"
	line "THẺ của bạn?"
	done

_MobileCardFolderDeleteAreYouSureText::
	text "Bạn chắc chắn muốn"
	line "xóa nó không?"
	done

_MobileCardFolderDeletedText::
	text "THƯ MỤC THẺ đã"
	line "được xóa."

	para ""
	done

_MobileCardFolderAskOpenOldText::
	text "Có THƯ MỤC THẺ cũ"
	line "từ hành trình"
	cont "trước."

	para "Bạn muốn mở nó"
	line "không?"
	done

_MobileCardFolderAskDeleteOldText::
	text "Xóa THƯ MỤC THẺ"
	line "cũ?"
	done

_MobileCardFolderFinishRegisteringCardsText::
	text "Hoàn tất đăng ký"
	line "THẺ?"
	done

_PhoneWrongNumberText::
	text "Hả? Xin lỗi, sai"
	line "số rồi!"
	done

_PhoneClickText::
	text "Cạch!"
	done

_PhoneEllipseText::
	text "<……>"
	done

_PhoneOutOfAreaText::
	text "Số đó nằm ngoài"
	line "vùng phủ sóng."
	done

_PhoneJustTalkToThemText::
	text "Đi nói chuyện"
	line "trực tiếp đi!"
	done

_PhoneThankYouText::
	text "Cảm ơn!"
	done

_SpaceSpaceColonText:: ; unreferenced
	text "  :"
	done

_PasswordAskResetText::
	text "Mật khẩu đúng."
	line "Chọn TIẾP TỤC để"
	cont "đặt lại cài đặt."
	prompt

_PasswordWrongText::
	text "Sai mật khẩu!"
	prompt

_PasswordAskResetClockText::
	text "Đặt lại đồng hồ?"
	done

_PasswordAskEnterText::
	text "Vui lòng nhập"
	line "mật khẩu."
	done

_ClearAllSaveDataText::
	text "Xóa tất cả dữ"
	line "liệu đã lưu?"
	done

_LearnedMoveText::
	text_ram wMonOrItemNameBuffer
	text " đã học"
	line "@"
	text_ram wStringBuffer2
	text "!@"
	sound_dex_fanfare_50_79
	text_promptbutton
	text_end

	text_end ; unreferenced

_MoveAskForgetText::
	text "Nên quên chiêu"
	next "nào?"
	done

_StopLearningMoveText::
	text "Dừng học"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

_DidNotLearnMoveText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "đã không học"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

_AskForgetMoveText::
	text_ram wMonOrItemNameBuffer
	text " đang"
	line "cố học"
	cont "@"
	text_ram wStringBuffer2
	text "."

	para "Nhưng @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "không thể học quá"
	cont "bốn chiêu."

	para "Xóa chiêu cũ để"
	line "nhường chỗ cho"
	cont "@"
	text_ram wStringBuffer2
	text "?"
	done

Text_MoveForgetCount::
	text "1, 2 và…@"
	text_pause
	text_end

	text_end ; unreferenced

_MoveForgotText::
	text " Phù!@"
	text_pause
	text_start

	para "@"
	text_ram wMonOrItemNameBuffer
	text " đã quên"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "Và…"
	prompt

_MoveCantForgetHMText::
	text "Chiêu HM không thể"
	line "quên được."
	prompt

_CardFlipPlayWithThreeCoinsText::
	text "Chơi với ba xu?"
	done

_CardFlipNotEnoughCoinsText::
	text "Không đủ xu…"
	prompt

_CardFlipChooseACardText::
	text "Chọn một lá bài."
	done

_CardFlipPlaceYourBetText::
	text "Đặt cược đi."
	done

_CardFlipPlayAgainText::
	text "Muốn chơi lại"
	line "không?"
	done

_CardFlipShuffledText::
	text "Bài đã được"
	line "xáo."
	prompt

_CardFlipYeahText::
	text "Tuyệt!"
	done

_CardFlipDarnText::
	text "Tiếc…"
	done

_GearTodayText::
	text_today
	text_end

	text_end ; unreferenced

_GearEllipseText::
	text "<……>"
	done

_GearOutOfServiceText::
	text "Bạn đang ở ngoài"
	line "vùng phục vụ."
	prompt

_PokegearAskWhoCallText::
	text "Bạn muốn gọi cho"
	line "ai?"
	done

_PokegearPressButtonText::
	text "Nhấn nút bất kỳ"
	line "để thoát."
	done

_PokegearAskDeleteText::
	text "Xóa số điện thoại"
	line "đã lưu này?"
	done

_BuenaAskWhichPrizeText::
	text "Bạn muốn nhận"
	line "phần thưởng nào?"
	done

_BuenaIsThatRightText::
	text_ram wStringBuffer1
	text "?"
	line "Đúng không?"
	done

_BuenaHereYouGoText::
	text "Của bạn đây!"

	para ""
	done

_BuenaNotEnoughPointsText::
	text "Bạn không đủ"
	line "điểm."

	para ""
	done

_BuenaNoRoomText::
	text "Bạn không còn chỗ"
	line "cho nó."

	para ""
	done

_BuenaComeAgainText::
	text "Ồ. Mời quay lại"
	line "lần sau!"
	done

_BTExcuseMeText::
	text "Xin lỗi!"

	para ""
	done

_ExcuseMeYoureNotReadyText::
	text "Xin lỗi."
	line "Bạn chưa sẵn sàng."

	para ""
	done

_BattleTowerReturnWhenReadyText::
	text "Hãy quay lại khi"
	line "bạn sẵn sàng."
	done

_NeedAtLeastThreeMonText::
	text "Bạn cần ít nhất"
	line "ba #MON."

	para ""
	done

_EggDoesNotQualifyText::
	text "Xin lỗi, TRỨNG"
	line "không đủ điều"
	cont "kiện."

	para ""
	done

_OnlyThreeMonMayBeEnteredText::
	text "Chỉ được dùng"
	line "ba #MON."

	para ""
	done

_TheMonMustAllBeDifferentKindsText::
	text "@"
	text_ram wStringBuffer2
	text " #MON"
	line "phải khác loại"
	cont "nhau."

	para ""
	done

_TheMonMustNotHoldTheSameItemsText::
	text "@"
	text_ram wStringBuffer2
	text " #MON"
	line "không được cầm"
	cont "cùng một vật."

	para ""
	done

_YouCantTakeAnEggText::
	text "Bạn không thể mang"
	line "TRỨNG!"

	para ""
	done

_BallDodgedText::
	text "Nó né được BÓNG"
	line "ném!"

	para "#MON này không"
	line "thể bắt được!"
	prompt

_BallMissedText::
	text "Bạn ném trượt"
	line "#MON!"
	prompt

_BallBrokeFreeText::
	text "Ôi không! #MON"
	line "thoát ra rồi!"
	prompt

_BallAppearedCaughtText::
	text "Ôi! Tưởng đã"
	line "bắt được rồi!"
	prompt

_BallAlmostHadItText::
	text "Trời ơi!"
	line "Suýt nữa là được!"
	prompt

_BallSoCloseText::
	text "Tiếc thật! Suýt"
	line "chút nữa rồi!"
	prompt

Text_BallCaught::
	text "Bắt được! @"
	text_ram wEnemyMonNickname
	text_start
	line "đã bị bắt!@"
	sound_caught_mon
	text_end

	text_end ; unreferenced

_WaitButtonText::
	text_promptbutton
	text_end

	text_end ; unreferenced

_BallSentToPCText::
	text_ram wMonOrItemNameBuffer
	text " đã được"
	line "gửi đến PC BILL."
	prompt

_NewDexDataText::
	text_ram wEnemyMonNickname
	text " đã"
	line "được thêm vào"
	cont "#DEX.@"
	sound_slot_machine_start
	text_promptbutton
	text_end

	text_end ; unreferenced

_AskGiveNicknameText::
	text "Đặt biệt danh cho"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

_ItemStatRoseText::
	text_ram wStringBuffer1
	text_start
	line "@"
	text_ram wStringBuffer2
	text " tăng."
	prompt

_ItemCantUseOnMonText::
	text "Không thể dùng cho"
	line "#MON này."
	prompt

_RepelUsedEarlierIsStillInEffectText::
	text "THUỐC XỊT dùng"
	line "trước vẫn còn"
	cont "tác dụng."
	prompt

_PlayedFluteText::
	text "Đã thổi SÁO #."

	para "Giai điệu hay"
	line "thật!"
	prompt

_FluteWakeUpText::
	text "Tất cả #MON"
	line "đang ngủ tỉnh dậy."
	prompt

Text_PlayedPokeFlute::
	text "<PLAYER> đã thổi"
	line "SÁO #.@"
	text_promptbutton
	text_end

	text_end ; unreferenced

_BlueCardBalanceText::
	text "Bạn hiện có"
	line "@"
	text_decimal wBlueCardBalance, 1, 2
	text " điểm."
	done

_CoinCaseCountText::
	text "Xu:"
	line "@"
	text_decimal wCoins, 2, 4
	text_end

	text_end ; unreferenced

_RaiseThePPOfWhichMoveText::
	text "Tăng PP của chiêu"
	line "nào?"
	done

_RestoreThePPOfWhichMoveText::
	text "Phục hồi PP của"
	line "chiêu nào?"
	done

_PPIsMaxedOutText::
	text "PP của @"
	text_ram wStringBuffer2
	text_start
	line "đã tối đa."
	prompt

_PPsIncreasedText::
	text "PP của @"
	text_ram wStringBuffer2
	text_start
	line "đã tăng."
	prompt

_PPRestoredText::
	text "PP đã phục hồi."
	prompt

_SentTrophyHomeText::
	text "Có một cúp bên"
	line "trong!@"
	sound_dex_fanfare_50_79
	text_start

	para "@"
	text_ram wPlayerName
	text " đã gửi"
	line "cúp về nhà."
	prompt

_ItemLooksBitterText::
	text "Trông có vẻ đắng…"
	prompt

_ItemCantUseOnEggText::
	text "Không thể dùng cho"
	line "TRỨNG."
	prompt

_ItemOakWarningText::
	text "GS.OAK: <PLAYER>!"
	line "Giờ không phải lúc"
	cont "dùng cái đó!"
	prompt

_ItemBelongsToSomeoneElseText::
	text "Đó là của người"
	line "khác!"
	prompt

_ItemWontHaveEffectText::
	text "Nó sẽ không có"
	line "tác dụng."
	prompt

_BallBlockedText::
	text "Huấn luyện viên đã"
	line "chặn BÓNG!"
	prompt

_BallDontBeAThiefText::
	text "Đừng làm kẻ cắp!"
	prompt

_NoCyclingText::
	text "Không được đi xe"
	line "đạp ở đây."
	prompt

_ItemCantGetOnText::
	text "Không thể lên"
	line "@"
	text_ram wStringBuffer1
	text " bây giờ."
	prompt

_BallBoxFullText::
	text "HỘP #MON đầy."
	line "Không thể dùng"
	cont "bây giờ."
	prompt

_ItemUsedText::
	text "<PLAYER> dùng@"
	text_low
	text_ram wStringBuffer2
	text "."
	done

_ItemGotOnText::
	text "<PLAYER> lên@"
	text_low
	text_ram wStringBuffer2
	text "."
	prompt

_ItemGotOffText::
	text "<PLAYER> xuống@"
	text_low
	text_ram wStringBuffer2
	text "."
	prompt

_KnowsMoveText::
	text_ram wStringBuffer1
	text " biết"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_MoveKnowsOneText::
	text "#MON chỉ biết"
	line "một chiêu thôi."
	done

_AskDeleteMoveText::
	text "Ồ, muốn nó quên"
	line "@"
	text_ram wStringBuffer1
	text " à?"
	done

_DeleterForgotMoveText::
	text "Xong! #MON của"
	line "bạn đã quên chiêu."
	done

_DeleterEggText::
	text "TRỨNG không biết"
	line "chiêu nào cả!"
	done

_DeleterNoComeAgainText::
	text "Không? Hãy ghé"
	line "thăm tôi lần sau."
	done

_DeleterAskWhichMoveText::
	text "Vậy nó nên quên"
	line "chiêu nào?"
	prompt

_DeleterIntroText::
	text "Ừm… À, tôi là"
	line "NGƯỜI XÓA CHIÊU."

	para "Tôi có thể làm"
	line "#MON quên chiêu"

	para "Tôi làm #MON"
	line "quên chiêu nhé?"
	done

_DeleterAskWhichMonText::
	text "#MON nào?"
	prompt

_DSTIsThatOKText::
	text " DST,"
	line "được chứ?"
	done

_TimeAskOkayText::
	text ","
	line "được chứ?"
	done

_TimesetAskDSTText::
	text "Bạn muốn chuyển"
	line "sang Giờ Mùa Hè"
	cont "không?"
	done

_TimesetDSTText::
	text "Tôi đã chỉnh đồng"
	line "hồ lên một tiếng."
	prompt

_TimesetAskNotDSTText::
	text "Giờ Mùa Hè đã hết"
	line "chưa?"
	done

_TimesetNotDSTText::
	text "Tôi đã chỉnh đồng"
	line "hồ lùi một tiếng."
	prompt

_TimesetAskAdjustDSTText::
	text "Bạn muốn chỉnh"
	line "đồng hồ cho Giờ"

	para "Mùa Hè không?"
	done

_MomLostGearBookletText::
	text "Mẹ làm mất sách"
	line "hướng dẫn của"
	cont "#GEAR rồi."

	para "Con quay lại sau"
	line "nhé."
	prompt
