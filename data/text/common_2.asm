_NoPhotoText::
	text "Ồ, không chụp à?"
	line "Lần sau nhé!"
	done

_EggPhotoText::
	text "Quả TRỨNG? Tài"
	line "tôi quý hơn thế…"
	done

_NameRaterHelloText::
	text "Xin chào! Tôi là"
	line "ông CHẤM TÊN."

	para "Tôi chấm điểm tên"
	line "của #MON."

	para "Bạn muốn tôi chấm"
	line "điểm tên không?"
	done

_NameRaterWhichMonText::
	text "Biệt danh #MON"
	line "nào tôi cần chấm"
	cont "cho bạn?"
	prompt

_NameRaterBetterNameText::
	text "Hm… @"
	text_ram wStringBuffer1
	text "…"
	line "Cái tên khá tốt"
	cont "đấy."

	para "Nhưng, đổi sang"
	line "tên hay hơn chút"
	cont "thì sao?"

	para "Muốn tôi đặt tên"
	line "hay hơn không?"
	done

_NameRaterWhatNameText::
	text "Được rồi. Vậy"
	line "chúng ta đặt tên"
	cont "gì đây?"
	prompt

_NameRaterFinishedText::
	text "Tên này hay hơn"
	line "tên cũ rồi!"

	para "Tuyệt lắm!"
	done

_NameRaterComeAgainText::
	text "Vậy nhé. Lần sau"
	line "lại đến nhé."
	done

_NameRaterPerfectNameText::
	text "Hm… @"
	text_ram wStringBuffer1
	text "?"
	line "Tên hay quá!"
	cont "Hoàn hảo luôn."

	para "Hãy chăm sóc"
	line "@"
	text_ram wStringBuffer1
	text_start
	line "thật tốt nhé."
	done

_NameRaterEggText::
	text "Ồ… Đây chỉ là"
	line "quả TRỨNG thôi."
	done

_NameRaterSameNameText::
	text "Có vẻ giống tên"
	line "cũ thật,"

	para "nhưng tên mới này"
	line "hay hơn nhiều!"

	para "Tuyệt lắm!"
	done

_NameRaterNamedText::
	text "Được rồi. #MON"
	line "này giờ được đặt"
	cont "tên @"
	text_ram wStringBuffer1
	text "."
	prompt

Text_Gained::
	text_ram wStringBuffer1
	text " nhận@"
	text_end

_BoostedExpPointsText::
; BUG: Five-digit experience gain is printed incorrectly (see docs/bugs_and_glitches.md)
	text_start
	line "thêm @"
	text_decimal wStringBuffer2, 2, 4
	text " ĐIỂM K.N!"
	prompt

_ExpPointsText::
; BUG: Five-digit experience gain is printed incorrectly (see docs/bugs_and_glitches.md)
	text_start
	line "@"
	text_decimal wStringBuffer2, 2, 4
	text " ĐIỂM K.N!"
	prompt

_GoMonText::
	text "Lên! @"
	text_end

_DoItMonText::
	text "Nào! @"
	text_end

_GoForItMonText::
	text "Cố lên,"
	line "@"
	text_end

_YourFoesWeakGetmMonText::
	text "Đối thủ yếu rồi!"
	line "Lên, @"
	text_end

_BattleMonNicknameText::
	text_ram wBattleMonNickname
	text "!"
	done

_BattleMonNickCommaText::
	text_ram wBattleMonNickname
	text ",@"
	text_end

_ThatsEnoughComeBackText::
	text " đủ rồi!"
	line "Quay về đi!@"
	text_end

_OKComeBackText::
	text " OK!"
	line "Quay về đi!@"
	text_end

_GoodComeBackText::
	text " tốt lắm!"
	line "Quay về đi!@"
	text_end

_ComeBackText::
	text " quay"
	line "về đi!"
	done

_BootedTMText::
	text "Khởi động TM."
	prompt

_BootedHMText::
	text "Khởi động HM."
	prompt

_ContainedMoveText::
	text "Nó chứa chiêu"
	line "@"
	text_ram wStringBuffer2
	text "."

	para "Dạy @"
	text_ram wStringBuffer2
	text_start
	line "cho #MON?"
	done

_TMHMNotCompatibleText::
	text_ram wStringBuffer2
	text " không"
	line "tương thích với"
	cont "@"
	text_ram wStringBuffer1
	text "."

	para "Nó không thể học"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_NoRoomTMHMText::
	text "Bạn không còn chỗ"
	line "cho @"
	text_ram wStringBuffer1
	text " nào nữa."
	prompt

_ReceivedTMHMText::
	text "Bạn nhận được"
	line "@"
	text_ram wStringBuffer1
	text "!"
	prompt

_MysteryGiftCanceledText::
	text "Liên kết đã bị"
	line "hủy bỏ."
	prompt

_MysteryGiftCommErrorText::
	text "Lỗi kết nối."
	line ""
	prompt

_RetrieveMysteryGiftText::
	text "Phải nhận QUÀ tại"
	line "TRUNG TÂM #MON."
	prompt

_YourFriendIsNotReadyText::
	text "Bạn của bạn chưa"
	line "sẵn sàng."
	prompt

_MysteryGiftFiveADayText::
	text "Xin lỗi--chỉ được"
	line "5 QUÀ mỗi ngày."
	prompt

_MysteryGiftOneADayText::
	text "Xin lỗi. Mỗi ngày"
	line "chỉ 1 QUÀ/người."
	prompt

_MysteryGiftSentText::
	text_ram wMysteryGiftPartnerName
	text " gửi"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_MysteryGiftSentHomeText::
	text_ram wMysteryGiftPartnerName
	text " gửi"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "về nhà @"
	text_ram wMysteryGiftPlayerName
	text "."
	prompt

_NameCardReceivedCardText::
	text "Nhận được THẺ"
	line "của @"
	text_ram wMysteryGiftCardHolderName
	text "."
	prompt

_NameCardListedCardText::
	text "THẺ của @"
	text_ram wMysteryGiftCardHolderName
	text_start
	line "được xếp số @"
	text_decimal wTextDecimalByte, 1, 2
	text "."
	prompt

_NameCardNotRegisteredCardText::
	text "THẺ chưa được"
	line "đăng ký."
	prompt

_NameCardLinkCancelledText::
	text "Liên kết đã bị"
	line "hủy bỏ."
	prompt

_NameCardLinkCommErrorText::
	text "Lỗi kết nối."
	line ""
	prompt

_BadgeRequiredText::
	text "Xin lỗi! Cần có"
	line "HUY HIỆU mới."
	prompt

_CantUseItemText::
	text "Không thể dùng"
	line "ở đây."
	prompt

_UseCutText::
	text_ram wStringBuffer2
	text " dùng"
	line "CẮT!"
	prompt

_CutNothingText::
	text "Không có gì để"
	line "CẮT ở đây."
	prompt

_BlindingFlashText::
	text "ÁNH SÁNG chói"
	line "soi sáng khu vực!@"
	text_promptbutton
	text_end

	text_end ; unreferenced

_UsedSurfText::
	text_ram wStringBuffer2
	text " dùng"
	line "LƯỚT SÓNG!"
	done

_CantSurfText::
	text "Không thể LƯỚT"
	line "SÓNG ở đây."
	prompt

_AlreadySurfingText::
	text "Bạn đang LƯỚT"
	line "SÓNG rồi."
	prompt

_AskSurfText::
	text "Nước êm đềm."
	line "Muốn LƯỚT SÓNG?"
	done

_UseWaterfallText::
	text_ram wStringBuffer2
	text " dùng"
	line "THÁC NƯỚC!"
	done

_HugeWaterfallText::
	text "Wow, thác nước"
	line "lớn quá."
	done

_AskWaterfallText::
	text "Bạn muốn dùng"
	line "THÁC NƯỚC?"
	done

_UseDigText::
	text_ram wStringBuffer2
	text " dùng"
	line "ĐÀO!"
	done

_UseEscapeRopeText::
	text "<PLAYER> dùng"
	line "DÂY THOÁT HIỂM."
	done

_CantUseDigText::
	text "Không thể dùng"
	line "ở đây."
	done

_TeleportReturnText::
	text "Quay về TRUNG TÂM"
	line "#MON gần nhất."
	done

_CantUseTeleportText::
	text "Không thể dùng"
	line "ở đây."

	para ""
	done

_AlreadyUsingStrengthText::
	text "#MON đang dùng"
	line "SỨC MẠNH rồi."
	prompt

_UseStrengthText::
	text_ram wStringBuffer2
	text " dùng"
	line "SỨC MẠNH!"
	done

_MoveBoulderText::
	text_ram wStringBuffer1
	text " có thể"
	line "đẩy tảng đá."
	prompt

_AskStrengthText::
	text "#MON có thể đẩy"
	line "được vật này."

	para "Muốn dùng"
	line "SỨC MẠNH?"
	done

_BouldersMoveText::
	text "Giờ có thể đẩy"
	line "tảng đá rồi!"
	done

_BouldersMayMoveText::
	text "#MON có thể đẩy"
	line "được vật này."
	done

_UseWhirlpoolText::
	text_ram wStringBuffer2
	text " dùng"
	line "XOÁY NƯỚC!"
	prompt

_MayPassWhirlpoolText::
	text "Xoáy nước dữ"
	line "dội quá!"

	para "#MON có thể"
	line "vượt qua được."
	done

_AskWhirlpoolText::
	text "Xoáy nước chắn"
	line "đường."

	para "Muốn dùng"
	line "XOÁY NƯỚC?"
	done

_UseHeadbuttText::
	text_ram wStringBuffer2
	text " đã"
	line "HÚNG ĐẦU!"
	prompt

_HeadbuttNothingText::
	text "Không có gì…"
	done

_AskHeadbuttText::
	text "#MON có thể ở"
	line "trong cây này."

	para "Muốn HÚNG ĐẦU"
	line "vào cây?"
	done

_UseRockSmashText::
	text_ram wStringBuffer2
	text " dùng"
	line "ĐẬP ĐÁ!"
	prompt

_MaySmashText::
	text "Có lẽ #MON"
	line "đập vỡ được cái"
	cont "này."
	done

_AskRockSmashText::
	text "Tảng đá này có"
	line "vẻ vỡ được."

	para "Muốn dùng ĐẬP"
	line "ĐÁ?"
	done

_RodBiteText::
	text "Ồ!"
	line "Có cá cắn câu!"
	prompt

_RodNothingText::
	text "Chẳng có gì cắn!"
	prompt

_UnusedNothingHereText::
	text "Có vẻ không có"
	line "gì ở đây."
	prompt

_CantGetOffBikeText::
	text "Không xuống xe"
	line "được ở đây!"
	done

_GotOnBikeText::
	text "<PLAYER> lên"
	line "@"
	text_ram wStringBuffer2
	text "."
	done

_GotOffBikeText::
	text "<PLAYER> xuống"
	line "@"
	text_ram wStringBuffer2
	text "."
	done

_AskCutText::
	text "Cây này có thể"
	line "CẮT được!"

	para "Muốn dùng CẮT?"
	done

_CanCutText::
	text "Cây này có thể"
	line "CẮT được!"
	done

_FoundItemText::
	text "<PLAYER> tìm thấy"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_CantCarryItemText::
	text "Nhưng <PLAYER>"
	line "không mang thêm"
	cont "vật phẩm được."
	done

_WhitedOutText::
	text "<PLAYER> hết"
	line "#MON dùng được!"

	para "<PLAYER> ngất"
	line "xỉu rồi!"
	done

_ItemfinderItemNearbyText::
	text "Có! MÁY TÌM ĐỒ"
	line "cho thấy có vật"
	cont "phẩm gần đây."
	prompt

_ItemfinderNopeText::
	text "Không! MÁY TÌM ĐỒ"
	line "không phản hồi."
	prompt

_PoisonFaintText::
	text_ram wStringBuffer3
	text_start
	line "ngất xỉu rồi!"
	prompt

_PoisonWhiteoutText::
	text "<PLAYER> hết"
	line "#MON dùng được!"

	para "<PLAYER> ngất"
	line "xỉu rồi!"
	prompt

_UseSweetScentText::
	text_ram wStringBuffer3
	text " dùng"
	line "MÙI HƯƠNG NGỌT!"
	done

_SweetScentNothingText::
	text "Có vẻ không có"
	line "gì ở đây…"
	done

_SquirtbottleNothingText::
	text "<PLAYER> tưới"
	line "nước."

	para "Nhưng không có"
	line "gì xảy ra…"
	done

_UseSacredAshText::
	text "#MON của"
	line "<PLAYER> đã được"
	cont "hồi phục hết!"
	done

_AnEggCantHoldAnItemText::
	text "TRỨNG không thể"
	line "giữ vật phẩm."
	prompt

_PackNoItemText::
	text "Không có đồ."
	done

_AskThrowAwayText::
	text "Bỏ đi bao nhiêu?"
	line ""
	done

_AskQuantityThrowAwayText::
	text "Bỏ đi @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

_ThrewAwayText::
	text "Đã bỏ"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_OakThisIsntTheTimeText::
	text "GS.OAK: <PLAYER>!"
	line "Không phải lúc"
	cont "để dùng cái đó!"
	prompt

_YouDontHaveAMonText::
	text "Bạn không có"
	line "#MON nào!"
	prompt

_RegisteredItemText::
	text "Đã đăng ký"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_CantRegisterText::
	text "Không thể đăng ký"
	line "vật phẩm đó."
	prompt

_AskItemMoveText::
	text "Nên chuyển vật"
	line "phẩm này đi đâu?"
	done

_PackEmptyText::
	text_start
	done

_YouCantUseItInABattleText::
	text "Không dùng được"
	line "trong trận đấu."
	prompt

_AreYouABoyOrAreYouAGirlText::
	text "Bạn là nam?"
	line "hay nữ?"
	done

Text_BattleEffectActivate::
	text "<USER>"
	line "@"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_BattleStatWentWayUpText::
	text_pause
	text "<SCROLL>tăng mạnh!"
	prompt

_BattleStatWentUpText::
	text " tăng lên!"
	prompt

Text_BattleFoeEffectActivate::
	text "<TARGET>"
	line "@"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_BattleStatSharplyFellText::
	text_pause
	text "<SCROLL>giảm mạnh!"
	prompt

_BattleStatFellText::
	text " giảm!"
	prompt

Text_BattleUser::
	text "<USER>@"
	text_end

_BattleMadeWhirlwindText::
	text_start
	line "tạo gió xoáy!"
	prompt

_BattleTookSunlightText::
	text_start
	line "hấp thụ ánh nắng!"
	prompt

_BattleLoweredHeadText::
	text_start
	line "hạ thấp đầu!"
	prompt

_BattleGlowingText::
	text_start
	line "đang phát sáng!"
	prompt

_BattleFlewText::
	text_start
	line "bay lên cao!"
	prompt

_BattleDugText::
	text_start
	line "đào một cái hố!"
	prompt

_ActorNameText::
	text "<USER>@"
	text_end

_UsedMove1Text::
	text_start
	line "dùng @"
	text_end

_UsedMove2Text::
	text_start
	line "dùng @"
	text_end

_UsedInsteadText::
	text "thay vào đó,"
	cont "@"
	text_end

_MoveNameText::
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_EndUsedMove1Text::
	text "!"
	done

_EndUsedMove2Text::
	text "!"
	done

_EndUsedMove3Text::
	text "!"
	done

_EndUsedMove4Text::
	text "!"
	done

_EndUsedMove5Text::
	text "!"
	done

Text_BreedHuh::
	text "Hả?"

	para "@"
	text_end

_BreedClearboxText::
	text_start
	done

_BreedEggHatchText::
	text_ram wStringBuffer1
	text " đã"
	line "nở ra từ TRỨNG!@"
	sound_caught_mon
	text_promptbutton
	text_end

	text_end ; unreferenced

_BreedAskNicknameText::
	text "Đặt biệt danh cho"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

_LeftWithDayCareLadyText::
	text "Đó là @"
	text_ram wBreedMon2Nickname
	text_start
	line "được gửi cho BÀ"
	cont "GIỮ TRẺ."
	done

_LeftWithDayCareManText::
	text "Đó là @"
	text_ram wBreedMon1Nickname
	text_start
	line "được gửi cho ÔNG"
	cont "GIỮ TRẺ."
	done

_BreedBrimmingWithEnergyText::
	text "Nó đang tràn đầy"
	line "năng lượng."
	prompt

_BreedNoInterestText::
	text "Nó không quan tâm"
	line "đến @"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedAppearsToCareForText::
	text "Có vẻ nó quan tâm"
	line "đến @"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedFriendlyText::
	text "Nó thân thiện với"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedShowsInterestText::
	text "Nó thể hiện sự"
	line "quan tâm đến @"
	text_ram wStringBuffer1
	text "."
	prompt

_EmptyMailboxText::
	text "Không có THƯ nào"
	line "ở đây."
	prompt

_MailClearedPutAwayText::
	text "THƯ đã xoá được"
	line "cất đi."
	prompt

_MailPackFullText::
	text "BA LÔ đầy rồi."
	prompt

_MailMessageLostText::
	text "Nội dung THƯ sẽ"
	line "bị mất. Được chứ?"
	done

_MailAlreadyHoldingItemText::
	text "Nó đã cầm một"
	line "vật phẩm rồi."
	prompt

_MailEggText::
	text "TRỨNG không thể"
	line "giữ THƯ."
	prompt

_MailMovedFromBoxText::
	text "THƯ đã được chuyển"
	line "ra khỏi HỘP THƯ."
	prompt

_YesPromptText:: ; unreferenced
	text "Có"
	prompt

_NoPromptText:: ; unreferenced
	text "Không"
	prompt

_AnimationTypeText:: ; unreferenced
	text_decimal wcf64, 1, 3
	text " @"
	text_ram wStringBuffer1
	text_start
	line "Loại hiệu ứng @"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_MonNumberText:: ; unreferenced
	text "Số #MON?"
	done

_WasSentToBillsPCText::
	text_ram wStringBuffer1
	text " đã"
	line "gửi đến PC BILL."
	prompt

_PCGottaHavePokemonText::
	text "Bạn cần có #MON"
	line "mới gọi được!"
	prompt

_PCWhatText::
	text "Gì?"
	done

_PCMonHoldingMailText::
	text "Có #MON đang"
	line "giữ THƯ."

	para "Hãy lấy THƯ ra"
	line "trước."
	prompt

_PCNoSingleMonText::
	text "Bạn không có"
	line "#MON nào cả!"
	prompt

_PCCantDepositLastMonText::
	text "Không gửi #MON"
	line "cuối cùng được!"
	prompt

_PCCantTakeText::
	text "Không lấy thêm"
	line "#MON được nữa."
	prompt

_ContestCaughtMonText::
	text "Bắt được @"
	text_ram wStringBuffer1
	text "!"
	prompt

_ContestAskSwitchText::
	text "Đổi #MON?"
	done

_ContestAlreadyCaughtText::
	text "Bạn đã bắt được"
	line "một @"
	text_ram wStringBuffer1
	text " rồi."
	prompt

_ContestJudging_FirstPlaceText::
	text "Người thắng cuộc"
	line "thi Bắt Bọ là@"
	text_pause
	text "…"

	para "@"
	text_ram wBugContestWinnerName
	text ","
	line "đã bắt được"
	cont "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_FirstPlaceScoreText::
	text_start

	para "Điểm chiến thắng"
	line "là @"
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text " điểm!"
	prompt

_ContestJudging_SecondPlaceText::
	text "Xếp hạng nhì là"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "đã bắt được"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_SecondPlaceScoreText::
	text_start

	para "Điểm số là"
	line "@"
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text " điểm!"
	prompt

_ContestJudging_ThirdPlaceText::
	text "Xếp hạng ba là"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "đã bắt được"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_ThirdPlaceScoreText::
	text_start

	para "Điểm số là"
	line "@"
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text " điểm!"
	prompt

_MagikarpGuruMeasureText::
	text "Để tôi đo con"
	line "MAGIKARP đó."

	para "…Hm, nó dài"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_KarpGuruRecordText::
	text "KỶ LỤC HIỆN TẠI"

	para "@"
	text_ram wStringBuffer1
	text " bắt bởi"
	line "@"
	text_ram wMagikarpRecordHoldersName
	text_promptbutton
	text_end

	text_end ; unreferenced

_LuckyNumberMatchPartyText::
	text "Chúc mừng!"

	para "Số ID trùng khớp"
	line "với @"
	text_ram wStringBuffer1
	text_start

	para "trong đội của bạn."
	prompt

_LuckyNumberMatchPCText::
	text "Chúc mừng!"

	para "Số ID trùng khớp"
	line "với @"
	text_ram wStringBuffer1
	text_start

	para "trong HỘP PC."
	prompt

_CaughtAskNicknameText::
	text "Đặt biệt danh cho"
	line "@"
	text_ram wStringBuffer1
	text " bạn"
	cont "vừa nhận?"
	done

_PokecenterPCCantUseText::
	text "Bzzzzt! Bạn cần"
	line "có #MON mới"
	cont "dùng được cái này!"
	prompt

_PlayersPCTurnOnText::
	text "<PLAYER> bật"
	line "PC lên."
	prompt

_PlayersPCAskWhatDoText::
	text "Bạn muốn làm gì?"
	line ""
	done

_PlayersPCHowManyWithdrawText::
	text "Bạn muốn rút"
	line "bao nhiêu?"
	done

_PlayersPCWithdrewItemsText::
	text "Đã rút @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PlayersPCNoRoomWithdrawText::
	text "Không còn chỗ cho"
	line "thêm vật phẩm."
	prompt

_PlayersPCNoItemsText::
	text "Không có đồ!"
	prompt

_PlayersPCHowManyDepositText::
	text "Bạn muốn gửi"
	line "bao nhiêu?"
	done

_PlayersPCDepositItemsText::
	text "Đã gửi @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PlayersPCNoRoomDepositText::
	text "Không còn chỗ để"
	line "cất đồ."
	prompt

_PokecenterPCTurnOnText::
	text "<PLAYER> bật"
	line "PC lên."
	prompt

_PokecenterPCWhoseText::
	text "Truy cập PC ai?"
	done

_PokecenterBillsPCText::
	text "Đã truy cập"
	line "PC của BILL."

	para "Hệ thống lưu trữ"
	line "#MON đã mở."
	prompt

_PokecenterPlayersPCText::
	text "Đã truy cập PC"
	line "của mình."

	para "Hệ thống lưu trữ"
	line "vật phẩm đã mở."
	prompt

_PokecenterOaksPCText::
	text "Đã truy cập PC"
	line "của GS.OAK."

	para "Hệ thống đánh giá"
	line "#DEX đã mở."
	prompt

_PokecenterPCOaksClosedText::
	text "…"
	line "Đã đóng liên kết…"
	done

_OakPCText1::
	text "Muốn đánh giá"
	line "#DEX của bạn?"
	done

_OakPCText2::
	text "Mức hoàn thành"
	line "#DEX hiện tại:"
	prompt

_OakPCText3::
	text_ram wStringBuffer3
	text " #MON thấy"
	line "@"
	text_ram wStringBuffer4
	text " #MON sở hữu"

	para "Đánh giá của"
	line "GS.OAK:"
	done

_OakRating01::
	text "Hãy tìm #MON"
	line "trong bụi cỏ!"
	done

_OakRating02::
	text "Tốt. Tôi thấy bạn"
	line "hiểu cách dùng"
	cont "BÓNG #."
	done

_OakRating03::
	text "Bạn đang tiến bộ"
	line "đấy."

	para "Nhưng còn một"
	line "chặng đường dài."
	done

_OakRating04::
	text "Bạn cần điền đầy"
	line "#DEX."

	para "Bắt nhiều loại"
	line "#MON khác nhau!"
	done

_OakRating05::
	text "Bạn đang cố gắng"
	line "--tôi thấy điều đó"

	para "#DEX của bạn"
	line "đang hoàn thiện."
	done

_OakRating06::
	text "Để tiến hoá, một"
	line "số #MON lớn lên"

	para "số khác dùng tác"
	line "dụng của ĐÁ."
	done

_OakRating07::
	text "Bạn có CẦN CÂU"
	line "chưa? Bạn có thể"

	para "bắt #MON bằng"
	line "cách câu cá."
	done

_OakRating08::
	text "Xuất sắc! Có vẻ"
	line "bạn thích sưu tầm"
	cont "đồ vật!"
	done

_OakRating09::
	text "Một số #MON chỉ"
	line "xuất hiện vào"

	para "những thời điểm"
	line "nhất định."
	done

_OakRating10::
	text "#DEX của bạn"
	line "đang đầy dần. Hãy"
	cont "tiếp tục phát huy!"
	done

_OakRating11::
	text "Ấn tượng đấy."
	line "Bạn đang tiến hoá"

	para "#MON, không chỉ"
	line "bắt chúng."
	done

_OakRating12::
	text "Bạn gặp KURT chưa?"
	line "BÓNG tự chế của"
	cont "ông ấy sẽ giúp."
	done

_OakRating13::
	text "Wow. Bạn tìm thấy"
	line "nhiều #MON hơn"

	para "dự án nghiên cứu"
	line "#DEX trước."
	done

_OakRating14::
	text "Bạn có trao đổi"
	line "#MON không?"

	para "Làm một mình thì"
	line "khó lắm!"
	done

_OakRating15::
	text "Wow! Bạn đạt 200!"
	line "#DEX của bạn"
	cont "trông tuyệt lắm!"
	done

_OakRating16::
	text "Bạn tìm được rất"
	line "nhiều #MON!"

	para "Bạn thực sự giúp"
	line "nghiên cứu của tôi"
	done

_OakRating17::
	text "Tuyệt vời! Bạn có"
	line "thể trở thành"

	para "giáo sư #MON"
	line "ngay bây giờ!"
	done

_OakRating18::
	text "#DEX của bạn"
	line "thật tuyệt! Bạn"

	para "sẵn sàng trở"
	line "thành chuyên gia!"
	done

_OakRating19::
	text "Whoa! #DEX hoàn"
	line "hảo! Tôi đã mơ"

	para "về điều này!"
	line "Chúc mừng!"
	done

_OakPCText4::
	text "Đã đóng liên kết"
	line "với PC GS.OAK."
	done

_TrainerRankingExplanationText:: ; unreferenced
	text "Xếp hạng huấn"
	line "luyện viên ba chủ"
	cont "đề!"

	para "File SAVE bạn vừa"
	line "gửi có thể lọt"
	cont "vào bảng xếp hạng!"

	para ""
	done

_TrainerRankingNoDataText:: ; unreferenced
	text "Không có dữ liệu"
	line "xếp hạng."

	para "Kết nối để lấy"
	line "dữ liệu xếp hạng."

	para ""
	done

_MemoryGameYeahText::
	text " , hay!"
	done

_MemoryGameDarnText::
	text "Tiếc quá…"
	done

_StartMenuContestEndText::
	text "Bạn muốn kết thúc"
	line "Cuộc thi?"
	done

_ItemsTossOutHowManyText::
	text "Bỏ đi bao nhiêu"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

_ItemsThrowAwayText::
	text "Bỏ đi @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

_ItemsDiscardedText::
	text "Đã bỏ"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_ItemsTooImportantText::
	text "Vật này quá quan"
	line "trọng để bỏ đi!"
	prompt

_ItemsOakWarningText::
	text "GS.OAK: <PLAYER>!"
	line "Không phải lúc"
	cont "để dùng cái đó!"
	done

_PokemonSwapItemText::
	text "Lấy @"
	text_ram wStringBuffer1
	text_start
	line "của @"
	text_ram wMonOrItemNameBuffer
	text " và"

	para "cho nó giữ"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PokemonHoldItemText::
	text "Cho @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "giữ @"
	text_ram wStringBuffer2
	text "."
	prompt

_PokemonRemoveMailText::
	text "Hãy lấy THƯ ra"
	line "trước."
	prompt

_PokemonNotHoldingText::
	text_ram wMonOrItemNameBuffer
	text " không"
	line "giữ gì cả."
	prompt

_ItemStorageFullText::
	text "Kho vật phẩm"
	line "đã đầy."
	prompt

_PokemonTookItemText::
	text "Lấy @"
	text_ram wStringBuffer1
	text_start
	line "từ @"
	text_ram wMonOrItemNameBuffer
	text "."
	prompt

_PokemonAskSwapItemText::
	text_ram wMonOrItemNameBuffer
	text " đang"
	line "giữ"

	para "@"
	text_ram wStringBuffer1
	text "."
	line "Đổi vật phẩm?"
	done

_ItemCantHeldText::
	text "Vật này không thể"
	line "được giữ."
	prompt

_MailLoseMessageText::
	text "THƯ sẽ mất nội"
	line "dung. Được chứ?"
	done

_MailDetachedText::
	text "Đã gỡ THƯ khỏi"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_MailNoSpaceText::
	text "Không còn chỗ"
	line "để gỡ THƯ."
	prompt

_MailAskSendToPCText::
	text "Gửi THƯ đã gỡ"
	line "đến PC của bạn?"
	done

_MailboxFullText::
	text "HỘP THƯ trong PC"
	line "của bạn đầy rồi."
	prompt

_MailSentToPCText::
	text "THƯ đã được gửi"
	line "đến PC của bạn."
	prompt

_PokemonNotEnoughHPText::
	text "Không đủ HP!"
	prompt

_MayRegisterItemText::
	text "Một vật phẩm trong"
	line "BA LÔ có thể được"

	para "đăng ký để dùng"
	line "bằng nút SELECT."
	done

_OakText1::
	text "Xin chào! Xin lỗi"
	line "bắt bạn phải chờ!"

	para "Chào mừng đến với"
	line "thế giới #MON!"

	para "Tên tôi là OAK."

	para "Nguời ta gọi tôi"
	line "giáo sư #MON"
	prompt

_OakText2::
	text "Thế giới này cư"
	line "trú bởi loài vật"
	cont "chúng ta gọi là"
	cont "#MON.@"
	text_end

_OakText3::
	text_promptbutton
	text_end

	text_end ; unreferenced

_OakText4::
	text "Người và #MON"
	line "chung sống hài"

	para "hoà với nhau."

	para "Có người chơi"
	line "với #MON, có"
	cont "người thi đấu với"
	cont "chúng."
	prompt

_OakText5::
	text "Nhưng chúng ta"
	line "không biết hết về"
	cont "#MON."

	para "Còn nhiều ẩn số"
	line "vẫn chưa có lời"
	cont "giải đáp."

	para "đó là lý do tôi"
	line "miệt mài nghiên"
	cont "cứu #MON."
	prompt
