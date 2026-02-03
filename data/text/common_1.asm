_FruitBearingTreeText::
	text "Đây là cây"
	line "ăn quả."
	done

_HeyItsFruitText::
	text "Ồ! Đây là"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_ObtainedFruitText::
	text "Nhận được"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_FruitPackIsFullText::
	text "Nhưng PACK"
	line "đã đầy…"
	done

_NothingHereText::
	text "Không có gì"
	line "ở đây…"
	done

_WhichApricornText::
	text "Dùng QUẢ MƠ nào?"
	done

_HowManyShouldIMakeText::
	text "Làm bao nhiêu cái?"
	done

_RecoveredSomeHPText::
	text_ram wStringBuffer1
	text_start
	line "hồi @"
	text_decimal wCurHPAnimDeltaHP, 2, 3
	text " HP!"
	done

_CuredOfPoisonText::
	text_ram wStringBuffer1
	text_start
	line "đã hết độc."
	done

_RidOfParalysisText::
	text_ram wStringBuffer1
	text_start
	line "đã hết tê liệt."
	done

_BurnWasHealedText::
	text_ram wStringBuffer1
	text_start
	line "đã hết bỏng."
	done

_WasDefrostedText::
	text_ram wStringBuffer1
	text_start
	line "đã tan băng."
	done

_WokeUpText::
	text_ram wStringBuffer1
	text_start
	line "đã thức dậy."
	done

_HealthReturnedText::
	text_ram wStringBuffer1
	text_start
	line "đã hồi phục."
	done

_RevitalizedText::
	text_ram wStringBuffer1
	text_start
	line "đã sống lại."
	done

_GrewToLevelText::
	text_ram wStringBuffer1
	text " lên"
	line "cấp @"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79 ; plays SFX_DEX_FANFARE_50_79, identical to SFX_LEVEL_UP
	text_promptbutton
	text_end

	text_end ; unreferenced

_CameToItsSensesText::
	text_ram wStringBuffer1
	text_start
	line "đã tỉnh táo lại."
	done

_EnterNewPasscodeText::
	text "Nhập một số bốn"
	line "chữ số bất kỳ."
	done

_ConfirmPasscodeText::
	text "Nhập lại số đó"
	line "để xác nhận."
	done

_PasscodesNotSameText::
	text "Hai số không"
	line "giống nhau."
	done

_PasscodeSetText::
	text "MẬT MÃ đã được"
	line "thiết lập."

	para "Nhập số này lần"
	line "sau để mở"
	cont "HỘP THẺ."

	para ""
	done

_FourZerosInvalidText::
	text "0000 không hợp lệ!"

	para ""
	done

_EnterPasscodeText::
	text "Nhập MẬT MÃ"
	next "HỘP THẺ."
	done

_IncorrectPasscodeText::
	text "MẬT MÃ sai!"

	para ""
	done

_CardFolderOpenText::
	text "Đã mở HỘP THẺ.@"
	text_end

_OakTimeWokeUpText::
	text "<……><……><……><……><……><……>"
	line "<……><……><……><……><……><……>"

	para "khò khò… hả? sao…?"
	line "Tỉnh cả ngủ!!!"

	para "Bạn làm ơn kiểm"
	line "tra giờ cho tôi"
	prompt

_OakTimeWhatTimeIsItText::
	text "Mấy giờ rồi?"
	done

_OakTimeWhatHoursText::
	text "Sao cơ?@"
	text_end

_OakTimeHoursQuestionMarkText::
	text "?"
	done

_OakTimeHowManyMinutesText::
	text "Bao nhiêu phút?"
	done

_OakTimeWhoaMinutesText::
	text "Trời!@"
	text_end

_OakTimeMinutesQuestionMarkText::
	text "?"
	done

_OakTimeOversleptText::
	text "!"
	line "Tôi ngủ quên!"
	done

_OakTimeYikesText::
	text "!"
	line "Trời ạ! tôi ngủ"
	cont "quên!"
	done

_OakTimeSoDarkText::
	text "!"
	line "Chả trách sao trời"
	cont "vẫn còn tối!"
	done

_OakTimeWhatDayIsItText::
	text "Hôm nay thứ mấy?"
	done

_OakTimeIsItText::
	text ""
	line "phải không?"
	done

; Mobile Adapter

_ThereIsNothingConnectedText:: ; unreferenced
	text "Không có gì"
	line "được kết nối."
	done

_CheckCellPhoneAdapterText:: ; unreferenced
	text "Kiểm tra adapter"
	line "điện thoại."
	done

_CheckCDMAAdapterText:: ; unreferenced
	text "Kiểm tra adapter"
	line "CDMA."
	done

_CheckDOCOMOPHSAdapterText:: ; unreferenced
	text "Kiểm tra adapter"
	line "DOCOMO PHS."
	done

_CheckDDIPHSAdapterText:: ; unreferenced
	text "Kiểm tra adapter"
	line "DDI PHS."
	done

_CheckMobileAdapterText:: ; unreferenced
	text "Kiểm tra adapter"
	line "chiến đấu"
	cont "không giới hạn."
	done

; Mobile Adapter End

_ThePasswordIsText:: ; unreferenced
	text "Mật khẩu là:"
	line ""
	done

_IsThisOKText:: ; unreferenced
	text "Được chưa?"
	done

_EnterTheIDNoText:: ; unreferenced
	text "Nhập số"
	line "ID."
	done

_EnterTheAmountText:: ; unreferenced
	text "Nhập"
	line "số lượng."
	done

_NothingToChooseText::
	text "Không có gì để"
	line "chọn."
	prompt

_WhichSidePutOnText::
	text "Bạn muốn đặt"
	line "ở bên nào?"
	done

_WhichSidePutAwayText::
	text "Bạn muốn cất"
	line "bên nào?"
	done

_PutAwayTheDecoText::
	text "Cất"
	line "@"
	text_ram wStringBuffer3
	text "."
	prompt

_NothingToPutAwayText::
	text "Không có gì"
	line "để cất."
	prompt

_SetUpTheDecoText::
	text "Đặt"
	line "@"
	text_ram wStringBuffer3
	text "."
	prompt

_PutAwayAndSetUpText::
	text "Cất"
	line "@"
	text_ram wStringBuffer3
	text_start

	para "và đặt"
	line "@"
	text_ram wStringBuffer4
	text "."
	prompt

_AlreadySetUpText::
	text "Cái đó đã đặt"
	line "sẵn rồi."
	prompt

_LookTownMapText::
	text "Đây là BẢN ĐỒ."
	done

_LookPikachuPosterText::
	text "Áp phích"
	line "PIKACHU dễ thương."
	done

_LookClefairyPosterText::
	text "Áp phích"
	line "CLEFAIRY đáng yêu."
	done

_LookJigglypuffPosterText::
	text "Áp phích"
	line "JIGGLYPUFF xinh."
	done

_LookAdorableDecoText::
	text "Một"
	line "@"
	text_ram wStringBuffer3
	text " đáng yêu."
	done

_LookGiantDecoText::
	text "Búp bê khổng lồ!"
	line "Mềm mại và ấm áp."
	done

_MomHiHowAreYouText::
	text "Chào, <PLAYER>!"
	line "bạn khỏe không?"
	prompt

_MomFoundAnItemText::
	text "mẹ tìm được một"
	line "đồ vật hữu ích,"
	prompt

_MomBoughtWithYourMoneyText::
	text "Mẹ dùng tiền của"
	line "con mua đấy!"
	prompt

_MomItsInPCText::
	text "Nó ở trong PC"
	line "của con."
	done

_MomFoundADollText::
	text "Hôm nay đi chợ"
	line "mẹ thấy búp bê"
	cont "xinh quá nên"
	prompt

_MomItsInYourRoomText::
	text "Nó trong phòng"
	line "con. Con sẽ thích!"
	done

_MonWasSentToText::
	text_ram wPlayerTrademonSpeciesName
	text " đã"
	line "gửi đến @"
	text_ram wOTTrademonSenderName
	text "."
	done

_MonNameSentToText::
	text_start
	done

_BidsFarewellToMonText::
	text_ram wOTTrademonSenderName
	text " chia"
	line "tay với"
	done

_MonNameBidsFarewellText::
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TakeGoodCareOfMonText::
	text "Hãy chăm sóc tốt"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_ForYourMonSendsText::
	text "Đổi lấy"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text " của @"
	text_ram wPlayerTrademonSenderName
	text ","
	done

_OTSendsText::
	text_ram wOTTrademonSenderName
	text " gửi"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_WillTradeText::
	text_ram wOTTrademonSenderName
	text " sẽ"
	line "đổi @"
	text_ram wOTTrademonSpeciesName
	text_end

	text_end ; unreferenced

_ForYourMonWillTradeText::
	text "lấy @"
	text_ram wPlayerTrademonSpeciesName
	text_start
	line "của @"
	text_ram wPlayerTrademonSenderName
	text "."
	done

_MobilePlayerWillTradeMonText::
	text_ram wPlayerTrademonSenderName
	text " sẽ"
	line "đổi @"
	text_ram wPlayerTrademonSpeciesName
	text_end

	text_end ; unreferenced

_MobileForPartnersMonText::
	text "lấy @"
	text_ram wOTTrademonSpeciesName
	text_start
	line "của @"
	text_ram wOTTrademonSenderName
	text "."
	done

_MobilePlayersMonTradeText::
	text_ram wPlayerTrademonSpeciesName
	text_start
	line "của @"
	text_ram wPlayerTrademonSenderName
	text " đổi…"
	done

_MobileTakeGoodCareOfMonText::
	text "Hãy chăm sóc tốt"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_MobilePlayersMonTrade2Text::
	text_ram wPlayerTrademonSpeciesName
	text_start
	line "của @"
	text_ram wPlayerTrademonSenderName
	text " đổi…"
	done

_MobileTakeGoodCareOfText::
	text "Hãy chăm sóc tốt"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_MobileTradeCameBackText::
	text_ram wOTTrademonSpeciesName
	text " đã"
	line "trở về!"
	done

; Oak's Pokémon Talk

_OPT_IntroText1::
	text_start
	line "MARY: HỘI THOẠI"
	done

_OPT_IntroText2::
	text_start
	line "#MON & GS.OAK!"
	done

_OPT_IntroText3::
	text_start
	line "Cùng tôi, MARY!"
	done

_OPT_OakText1::
	text_start
	line "OAK: @"
	text_ram wMonOrItemNameBuffer
	text_end

	text_end ; unreferenced

_OPT_OakText2::
	text_start
	line "có thể thấy ở"
	done

_OPT_OakText3::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_OPT_MaryText1::
	text_start
	line "MARY: @"
	text_ram wStringBuffer1
	text_start
	done

_OPT_SweetAdorablyText::
	text_start
	line "ngọt ngào và"
	done

_OPT_WigglySlicklyText::
	text_start
	line "nhún nhảy và"
	done

_OPT_AptlyNamedText::
	text_start
	line "tên hay và"
	done

_OPT_UndeniablyKindOfText::
	text_start
	line "không thể phủ nhận"
	done

_OPT_UnbearablyText::
	text_start
	line "quá quá là"
	done

_OPT_WowImpressivelyText::
	text_start
	line "ồ, ấn tượng"
	done

_OPT_AlmostPoisonouslyText::
	text_start
	line "gần như độc hại"
	done

_OPT_SensuallyText::
	text_start
	line "ồ, quyến rũ"
	done

_OPT_MischievouslyText::
	text_start
	line "tinh nghịch"
	done

_OPT_TopicallyText::
	text_start
	line "rất thời sự"
	done

_OPT_AddictivelyText::
	text_start
	line "gây nghiện"
	done

_OPT_LooksInWaterText::
	text_start
	line "dưới nước trông"
	done

_OPT_EvolutionMustBeText::
	text_start
	line "tiến hóa chắc là"
	done

_OPT_ProvocativelyText::
	text_start
	line "khiêu khích"
	done

_OPT_FlippedOutText::
	text_start
	line "phấn khích và"
	done

_OPT_HeartMeltinglyText::
	text_start
	line "tan chảy con tim"
	done

_OPT_CuteText::
	text_start
	line "dễ thương."
	done

_OPT_WeirdText::
	text_start
	line "kỳ lạ."
	done

_OPT_PleasantText::
	text_start
	line "dễ chịu."
	done

_OPT_BoldSortOfText::
	text_start
	line "táo bạo."
	done

_OPT_FrighteningText::
	text_start
	line "đáng sợ."
	done

_OPT_SuaveDebonairText::
	text_start
	line "lịch lãm!"
	done

_OPT_PowerfulText::
	text_start
	line "mạnh mẽ."
	done

_OPT_ExcitingText::
	text_start
	line "thú vị."
	done

_OPT_GroovyText::
	text_start
	line "sôi động!"
	done

_OPT_InspiringText::
	text_start
	line "truyền cảm hứng."
	done

_OPT_FriendlyText::
	text_start
	line "thân thiện."
	done

_OPT_HotHotHotText::
	text_start
	line "nóng bỏng!"
	done

_OPT_StimulatingText::
	text_start
	line "kích thích."
	done

_OPT_GuardedText::
	text_start
	line "thận trọng."
	done

_OPT_LovelyText::
	text_start
	line "đáng yêu."
	done

_OPT_SpeedyText::
	text_start
	line "nhanh nhẹn."
	done

_OPT_PokemonChannelText::
	text "#MON"
	done

_PokedexShowText::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unreferenced

; Pokémon Music Channel / Pokémusic

_BenIntroText1::
	text_start
	line "BEN: NHẠC #MON"
	done

_BenIntroText2::
	text_start
	line "CHANNEL!"
	done

_BenIntroText3::
	text_start
	line "Tôi đây, DJ BEN!"
	done

_FernIntroText1::
	text_start
	line "FERN: #MUSIC!"
	done

_FernIntroText2::
	text_start
	line "Cùng DJ FERN!"
	done

_BenFernText1::
	text_start
	line "Hôm nay @"
	text_today
	text ","
	done

_BenFernText2A::
	text_start
	line "hãy nhún nhảy với"
	done

_BenFernText2B::
	text_start
	line "hãy thư giãn với"
	done

_BenFernText3A::
	text_start
	line "Hành Khúc #MON!"
	done

_BenFernText3B::
	text_start
	line "Ru Ngủ #MON!"
	done

; Lucky Channel

_LC_Text1::
	text_start
	line "REED: Yee haw! Mọi"
	done

_LC_Text2::
	text_start
	line "người thế nào?"
	done

_LC_Text3::
	text_start
	line "Dù bạn đang vui"
	done

_LC_Text4::
	text_start
	line "hay đang buồn,"
	done

_LC_Text5::
	text_start
	line "đừng bỏ lỡ"
	done

_LC_Text6::
	text_start
	line "SỐ MAY MẮN!"
	done

_LC_Text7::
	text_start
	line "Số may mắn tuần"
	done

_LC_Text8::
	text_start
	line "này là @"
	text_pause
	text_ram wStringBuffer1
	text "!"
	done

_LC_Text9::
	text_start
	line "Tôi nhắc lại nhé!"
	done

_LC_Text10::
	text_start
	line "Trúng thì đến"
	done

_LC_Text11::
	text_start
	line "THÁP PHÁT THANH!"
	done

_LC_DragText1::
	text_start
	line "…Nhắc đi nhắc lại"
	done

_LC_DragText2::
	text_start
	line "chán thật…"
	done

; Places and People

_PnP_Text1::
	text_start
	line "NƠI CHỐN VÀ NGƯỜI!"
	done

_PnP_Text2::
	text_start
	line "Mang đến bởi"
	done

_PnP_Text3::
	text_start
	line "tôi, DJ LILY!"
	done

_PnP_Text4::
	text_start
	line "@"
	text_ram wStringBuffer2
	text " @"
	text_ram wStringBuffer1
	text_end

	text_end ; unreferenced

_PnP_CuteText::
	text_start
	line "dễ thương."
	done

_PnP_LazyText::
	text_start
	line "hơi lười biếng."
	done

_PnP_HappyText::
	text_start
	line "luôn vui vẻ."
	done

_PnP_NoisyText::
	text_start
	line "khá ồn ào."
	done

_PnP_PrecociousText::
	text_start
	line "sớm phát triển."
	done

_PnP_BoldText::
	text_start
	line "khá táo bạo."
	done

_PnP_PickyText::
	text_start
	line "quá kén chọn!"
	done

_PnP_SortOfOKText::
	text_start
	line "cũng tạm được."
	done

_PnP_SoSoText::
	text_start
	line "bình thường."
	done

_PnP_GreatText::
	text_start
	line "thực sự tuyệt."
	done

_PnP_MyTypeText::
	text_start
	line "đúng gu của tôi."
	done

_PnP_CoolText::
	text_start
	line "ngầu quá, phải?"
	done

_PnP_InspiringText::
	text_start
	line "truyền cảm hứng!"
	done

_PnP_WeirdText::
	text_start
	line "hơi kỳ lạ."
	done

_PnP_RightForMeText::
	text_start
	line "hợp với tôi?"
	done

_PnP_OddText::
	text_start
	line "chắc chắn lạ!"
	done

_PnP_Text5::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unreferenced

_RocketRadioText1::
	text_start
	line "… …Chúng tôi là"
	done

_RocketRadioText2::
	text_start
	line "ĐỘI ROCKET!"
	done

_RocketRadioText3::
	text_start
	line "Sau ba năm"
	done

_RocketRadioText4::
	text_start
	line "chuẩn bị, chúng"
	done

_RocketRadioText5::
	text_start
	line "tôi đã trỗi dậy"
	done

_RocketRadioText6::
	text_start
	line "từ đống tro tàn!"
	done

_RocketRadioText7::
	text_start
	line "GIOVANNI! @"
	text_pause
	text "Ngài có"
	done

_RocketRadioText8::
	text_start
	line "nghe?@"
	text_pause
	text " Ta làm được!"
	done

_RocketRadioText9::
	text_start
	line "@"
	text_pause
	text "Sếp ở đâu rồi?"
	done

_RocketRadioText10::
	text_start
	line "@"
	text_pause
	text "Sếp có nghe không?"
	done

_BuenaRadioText1::
	text_start
	line "BUENA: BUENA đây!"
	done

_BuenaRadioText2::
	text_start
	line "Mật khẩu hôm nay!"
	done

_BuenaRadioText3::
	text_start
	line "Để tôi nghĩ… Đó là"
	done

_BuenaRadioText4::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

_BuenaRadioText5::
	text_start
	line "Đừng quên nhé!"
	done

_BuenaRadioText6::
	text_start
	line "Tôi ở THÁP PHÁT"
	done

_BuenaRadioText7::
	text_start
	line "THANH GOLDENROD!"
	done

_BuenaRadioMidnightText1::
	text_start
	line "BUENA: Ôi trời…"
	done

_BuenaRadioMidnightText2::
	text_start
	line "Đã nửa đêm rồi!"
	done

_BuenaRadioMidnightText3::
	text_start
	line "Tôi phải tắt đây!"
	done

_BuenaRadioMidnightText4::
	text_start
	line "Cảm ơn đã theo dõi"
	done

_BuenaRadioMidnightText5::
	text_start
	line "đến phút cuối! Mà"
	done

_BuenaRadioMidnightText6::
	text_start
	line "đừng thức khuya"
	done

_BuenaRadioMidnightText7::
	text_start
	line "quá nhé! MC BUENA"
	done

_BuenaRadioMidnightText8::
	text_start
	line "thân tặng!"
	done

_BuenaRadioMidnightText9::
	text "Tôi đi đây!"
	done

_BuenaRadioMidnightText10::
	text "…"
	done

_BuenaOffTheAirText::
	text_start
	line ""
	done

_EnemyWithdrewText::
	text "<ENEMY>"
	line "rút lui"
	cont "@"
	text_ram wEnemyMonNickname
	text "!"
	prompt

_EnemyUsedOnText::
	text "<ENEMY>"
	line "dùng @"
	text_ram wMonOrItemNameBuffer
	text_start
	cont "cho @"
	text_ram wEnemyMonNickname
	text "!"
	prompt

_ThatCantBeUsedRightNowText:: ; unreferenced
	text "Không thể dùng"
	line "ngay bây giờ."
	prompt

_ThatItemCantBePutInThePackText:: ; unreferenced
	text "Không thể cho vật"
	line "đó vào túi."
	done

_TheItemWasPutInThePackText:: ; unreferenced
	text "@"
	text_ram wStringBuffer1
	text " đã"
	line "được cho vào"
	cont "TÚI."
	done

_RemainingTimeText:: ; unreferenced
	text "Thời gian còn"
	done

_YourMonsHPWasHealedText:: ; unreferenced
	text "HP của #MON"
	line "đã được hồi phục."
	prompt

_WarpingText:: ; unreferenced
	text "Đang dịch chuyển…"
	done

_ChangeWhichNumberText:: ; unreferenced
	text "Đổi số nào?"
	done

_WillYouPlayWithMonText:: ; unreferenced
	text "Bạn có muốn chơi"
	line "với @"
	text_ram wStringBuffer2
	text "?"
	done

_YouNeedTwoMonForBreedingText:: ; unreferenced
	text "Bạn cần hai #-"
	line "MON để nhân giống."
	prompt

_BreedingIsNotPossibleText:: ; unreferenced
	text "Không thể"
	line "nhân giống."
	prompt

_CompatibilityShouldTheyBreedText:: ; unreferenced
	text "Độ tương hợp là"
	line "@"
	text_decimal wBreedingCompatibility, 1, 3
	text ". Cho chúng"
	cont "nhân giống không?"
	done

_ThereIsNoEggText:: ; unreferenced
	text "Không có TRỨNG."
	line ""
	prompt

_ItsGoingToHatchText:: ; unreferenced
	text "Nó sắp nở!"
	prompt

_TestEventText:: ; unreferenced
	text "Sự kiện test"
	line "@"
	text_decimal wStringBuffer2, 1, 2
	text "?"
	done

_StartText:: ; unreferenced
	text "Bắt đầu!"
	done

_EndText:: ; unreferenced
	text "Kết thúc!"
	done

_ForABoyText:: ; unreferenced
	text "Dành cho con trai!"
	done

_ForAGirlText:: ; unreferenced
	text "Dành cho con gái!"
	done

_DoesntConcernABoyText:: ; unreferenced
	text "Điều này không"
	line "liên quan trai!"
	done

_TheBoxIsFullText:: ; unreferenced
	text "HỘP đã đầy!"
	done

; Mobile Adapter

_NewCardArrivedText::
	text "A new CARD arrived"
	line "from @"
	text_ram wStringBuffer2
	text "."
	done

_PutCardInCardFolderText::
	text "Lưu CARD này vào"
	line "THƯ MỤC CARD?"
	done

_CardWasListedText::
	text_ram wStringBuffer2
	text " được lưu"
	line "ở số @"
	text_decimal wStringBuffer1, 1, 2
	text "."
	prompt

_StartingLinkText::
	text "Bắt đầu kết nối."
	done

_LinkTerminatedText::
	text "Đã ngắt kết nối."
	done

_ClosingLinkText::
	text "Đang đóng liên kết"
	done

_ClearTimeLimitText:: ; unreferenced
	text "Xóa giới hạn"
	line "thời gian?"
	done

_TimeLimitWasClearedText:: ; unreferenced
	text "Đã xóa giới hạn"
	line "thời gian."
	done

_PickErrorPacketText:: ; unreferenced
	text "Chọn gói nào"
	line "để báo lỗi?"
	done

_TradingMonForOTMonText::
	text "Đang đổi @"
	text_ram wStringBuffer2
	text_start
	line "lấy @"
	text_ram wStringBuffer1
	text "…"
	done

; Mobile Adapter End

_ObtainedTheVoltorbBadgeText:: ; unreferenced
	text "Nhận được"
	line "HUY HIỆU VOLTORB!"
	done

_AskFloorElevatorText::
	text "Đi tầng mấy?"
	done

_BugCatchingContestTimeUpText::
	text "THÔNG BÁO: BÍÍÍP!"

	para "Hết giờ!"
	done

_BugCatchingContestIsOverText::
	text "THÔNG BÁO: Cuộc"
	line "thi đã kết thúc!"
	done

_RepelWoreOffText::
	text "Tác dụng của"
	line "REPEL đã hết."
	done

_PlayerFoundItemText::
	text "<PLAYER> tìm thấy"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_ButNoSpaceText::
	text "Nhưng <PLAYER>"
	line "không còn chỗ…"
	done

_JustSawSomeRareMonText::
	text "Tôi vừa thấy"
	line "@"
	text_ram wStringBuffer1
	text " quý"
	cont "ở @"
	text_ram wStringBuffer2
	text "."

	para "Tôi sẽ gọi nếu"
	line "thấy #MON quý"
	cont "hiếm khác nhé?"
	prompt

_SavingRecordText::
	text "ĐANG LƯU…"
	line "ĐỪNG TẮT MÁY!"
	done

_ReceiveItemText::
	text_ram wPlayerName
	text " nhận"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	sound_item
	text_promptbutton
	text_end

	text_end ; unreferenced

_NoCoinsText::
	text "Bạn không có xu."
	prompt

_NoCoinCaseText::
	text "Bạn không có"
	line "HỘP XU."
	prompt

_NPCTradeCableText::
	text "OK, nối cáp"
	line "Game Link."
	prompt

Text_NPCTraded::
	text "<PLAYER> đổi"
	line "@"
	text_ram wMonOrItemNameBuffer
	text " lấy"
	cont "@"
	text_ram wStringBuffer2
	text ".@"
	text_end

_NPCTradeFanfareText::
	sound_dex_fanfare_80_109
	text_pause
	text_end

	text_end ; unreferenced

_NPCTradeIntroText1::
	text "Tôi sưu tầm"
	line "#MON. Bạn có"
	cont "@"
	text_ram wStringBuffer1
	text " không?"

	para "Đổi nó lấy"
	line "@"
	text_ram wStringBuffer2
	text " của tôi nhé?"
	done

_NPCTradeCancelText1::
	text "Không muốn đổi"
	line "à? Tiếc quá…"
	done

_NPCTradeWrongText1::
	text "Hả? Đây không"
	line "phải @"
	text_ram wStringBuffer1
	text "."
	cont "Thất vọng quá…"
	done

_NPCTradeCompleteText1::
	text "Tuyệt! Tôi có"
	line "@"
	text_ram wStringBuffer1
	text " rồi!"
	cont "Cảm ơn nhé!"
	done

_NPCTradeAfterText1::
	text "Chào, @"
	text_ram wStringBuffer2
	text_start
	line "cũ của tôi sao?"
	done

_NPCTradeIntroText2::
	text "Chào, tôi đang"
	line "tìm #MON này."

	para "Nếu bạn có"
	line "@"
	text_ram wStringBuffer1
	text ", bạn có"

	para "muốn đổi lấy"
	line "@"
	text_ram wStringBuffer2
	text " không?"
	done

_NPCTradeCancelText2::
	text "Bạn cũng không"
	line "có à?"

	para "Trời, thất"
	line "vọng quá…"
	done

_NPCTradeWrongText2::
	text "Bạn không có"
	line "@"
	text_ram wStringBuffer1
	text "? Tiếc"
	cont "quá nhỉ."
	done

_NPCTradeCompleteText2::
	text "Tuyệt! Cảm ơn!"

	para "Cuối cùng tôi"
	line "có @"
	text_ram wStringBuffer1
	text "."
	done

_NPCTradeAfterText2::
	text "Chào! @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "bạn đổi cho tôi"
	cont "rất tuyệt!"
	done

_NPCTradeIntroText3::
	text_ram wMonOrItemNameBuffer
	text " dễ"
	line "thương, nhưng tôi"

	para "không có. Bạn có"
	line "@"
	text_ram wStringBuffer1
	text " không?"

	para "Đổi nó lấy"
	line "@"
	text_ram wStringBuffer2
	text " nhé?"
	done

_NPCTradeCancelText3::
	text "Không muốn đổi"
	line "à? Tiếc quá…"
	done

_NPCTradeWrongText3::
	text "Đây không phải"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "Hãy đổi với tôi"
	line "khi bạn có nhé."
	done

_NPCTradeCompleteText3::
	text "Ồ! Cảm ơn nhé!"
	line "Tôi luôn muốn"
	cont "@"
	text_ram wMonOrItemNameBuffer
	text "!"
	done

_NPCTradeAfterText3::
	text "@"
	text_ram wStringBuffer2
	text " tôi đổi"
	line "cho bạn sao rồi?"

	para "@"
	text_ram wMonOrItemNameBuffer
	text " của"
	line "bạn dễ thương!"
	done

_NPCTradeCompleteText4::
	text "Hả? Gì vậy?"
	done

_NPCTradeAfterText4::
	text "Đổi chác kỳ lạ…"

	para "Tôi còn nhiều"
	line "điều phải học."
	done

_MomLeavingText1::
	text "Ồ, #MON dễ"
	line "thương quá."

	para "Con có nó ở đâu"
	line "vậy?"

	para "…"

	para "À, con sắp đi"
	line "phiêu lưu…"

	para "Được!"
	line "Mẹ sẽ giúp con."

	para "Nhưng mẹ có thể"
	line "làm gì cho con?"

	para "À! Mẹ sẽ tiết"
	line "kiệm tiền cho con."

	para "Đi xa thì tiền"
	line "rất quan trọng."

	para "Con có muốn mẹ"
	line "giữ tiền không?"
	done

_MomLeavingText2::
	text "Được, mẹ sẽ giữ"
	line "tiền cho con."

	para "<……><……><……>"
	prompt

_MomLeavingText3::
	text "Cẩn thận nhé."

	para "#MON là bạn"
	line "của con. Hãy làm"
	cont "việc cùng nhau."

	para "Giờ đi đi!"
	done

_MomIsThisAboutYourMoneyText::
	text "Chào! Về rồi à!"
	line "Mẹ thấy con rất"
	cont "chăm chỉ."

	para "Mẹ đã dọn phòng"
	line "con gọn gàng."

	para "Hay là chuyện"
	line "tiền của con?"
	done

_MomBankWhatDoYouWantToDoText::
	text "Con muốn làm gì?"
	done

_MomStoreMoneyText::
	text "Con muốn gửi"
	line "bao nhiêu?"
	done

_MomTakeMoneyText::
	text "Con muốn lấy"
	line "bao nhiêu?"
	done

_MomSaveMoneyText::
	text "Con có muốn gửi"
	line "tiền không?"
	done

_MomHaventSavedThatMuchText::
	text "Con chưa gửi"
	line "nhiều như vậy."
	prompt

_MomNotEnoughRoomInWalletText::
	text "Con không lấy"
	line "nhiều như vậy."
	prompt

_MomInsufficientFundsInWalletText::
	text "Con không có"
	line "nhiều như vậy."
	prompt

_MomNotEnoughRoomInBankText::
	text "Con không gửi"
	line "nhiều như vậy."
	prompt

_MomStartSavingMoneyText::
	text "Được, mẹ giữ tiền"
	line "cho con. Yên tâm!"

	para "<PLAYER>, cố"
	line "lên nhé!"
	done

_MomStoredMoneyText::
	text "Tiền con an toàn"
	line "rồi! Đi đi con!"
	done

_MomTakenMoneyText::
	text "<PLAYER>, đừng"
	line "bỏ cuộc nhé!"
	done

_MomJustDoWhatYouCanText::
	text "Cứ làm những gì"
	line "con có thể."
	done

_DaycareDummyText::
	text_start
	done

_DayCareManIntroText::
	text "Tôi là ÔNG GIỮ"
	line "TRẺ. Bạn muốn tôi"
	cont "nuôi #MON hộ?"
	done

_DayCareManIntroEggText::
	text "Tôi là ÔNG GIỮ"
	line "TRẺ. Bạn có biết"
	cont "về TRỨNG không?"

	para "Tôi và vợ đang"
	line "nuôi #MON."

	para "Chúng tôi sửng"
	line "sốt thấy TRỨNG!"

	para "Thật không thể"
	line "tin được!"

	para "Vậy, bạn có muốn"
	line "gửi #MON không?"
	done

_DayCareLadyIntroText::
	text "Tôi là BÀ GIỮ"
	line "TRẺ."

	para "Tôi nuôi #MON"
	line "cho bạn nhé?"
	done

_DayCareLadyIntroEggText::
	text "Tôi là BÀ GIỮ"
	line "TRẺ. Bạn có biết"
	cont "về TRỨNG không?"

	para "Tôi và chồng đang"
	line "nuôi #MON."

	para "Chúng tôi sửng"
	line "sốt thấy TRỨNG!"

	para "Thật không thể"
	line "tin được!"

	para "Tôi nuôi #MON"
	line "cho bạn nhé?"
	done

_WhatShouldIRaiseText::
	text "Tôi nuôi con nào"
	line "cho bạn?"
	prompt

_OnlyOneMonText::
	text "Ủa? Nhưng bạn chỉ"
	line "có một #MON."
	prompt

_CantAcceptEggText::
	text "Xin lỗi, tôi không"
	line "nhận TRỨNG được."
	prompt

_RemoveMailText::
	text "Gỡ THƯ trước khi"
	line "đến gặp tôi."
	prompt

_LastHealthyMonText::
	text "Nếu đưa tôi nó,"
	line "bạn sẽ chiến đấu"
	cont "bằng gì?"
	prompt

_IllRaiseYourMonText::
	text "OK. Tôi sẽ nuôi"
	line "@"
	text_ram wStringBuffer1
	text " của bạn."
	prompt

_ComeBackLaterText::
	text "Quay lại lấy nó"
	line "sau nhé."
	done

_AreWeGeniusesText::
	text "Chúng tôi giỏi"
	line "không? Xem"
	cont "@"
	text_ram wStringBuffer1
	text " nhé?"
	done

_YourMonHasGrownText::
	text "@"
	text_ram wStringBuffer1
	text " của bạn"
	line "đã lớn nhiều."

	para "Theo cấp độ, nó"
	line "lên được @"
	text_decimal wStringBuffer2 + 1, 1, 3
	text "."

	para "Nếu muốn nhận lại"
	line "#MON, sẽ tốn"
	cont "¥@"
	text_decimal wStringBuffer2 + 2, 3, 4
	text "."
	done

_PerfectHeresYourMonText::
	text "Tuyệt! Đây là"
	line "#MON của bạn."
	prompt

_GotBackMonText::
	text "<PLAYER> nhận lại"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BackAlreadyText::
	text "Hả? Về rồi sao?"
	line "@"
	text_ram wStringBuffer1
	text " của bạn"
	para "cần thêm thời"
	line "gian với chúng tôi"

	para "Nếu muốn nhận lại"
	line "#MON, sẽ tốn"
	cont "¥100."
	done

_HaveNoRoomText::
	text "Bạn không còn chỗ"
	line "cho nó."
	prompt

_NotEnoughMoneyText::
	text "Bạn không đủ"
	line "tiền."
	prompt

_OhFineThenText::
	text "Ồ, vậy thôi."
	prompt

_ComeAgainText::
	text "Quay lại nhé."
	done

_NotYetText::
	text "Chưa đâu…"
	done

_FoundAnEggText::
	text "À, là bạn!"

	para "Chúng tôi đang"
	line "nuôi #MON của"

	para "bạn, và trời ơi,"
	line "ngạc nhiên quá!"

	para "#MON của bạn"
	line "có một TRỨNG!"

	para "Không biết sao nó"
	line "có, nhưng #MON"

	para "của bạn có TRỨNG."
	line "Bạn muốn lấy hông?"
	done

_ReceivedEggText::
	text "<PLAYER> nhận"
	line "TRỨNG!"
	done

_TakeGoodCareOfEggText::
	text "Hãy chăm sóc nó"
	line "thật tốt."
	done

_IllKeepItThanksText::
	text "Vậy thì tôi giữ"
	line "nó. Cảm ơn nhé!"
	done

_NoRoomForEggText::
	text "Bạn không còn chỗ"
	line "trong đội."
	cont "Quay lại sau nhé."
	done

_WhichMonPhotoText::
	text "Tôi chụp hình"
	line "#MON nào?"
	prompt

_HoldStillText::
	text "Được rồi. Đứng"
	line "yên một chút."
	prompt

_PrestoAllDoneText::
	text "Xong! Hẹn gặp"
	line "lại nhé?"
	done
