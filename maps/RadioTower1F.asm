	object_const_def
	const RADIOTOWER1F_RECEPTIONIST
	const RADIOTOWER1F_LASS
	const RADIOTOWER1F_YOUNGSTER
	const RADIOTOWER1F_ROCKET
	const RADIOTOWER1F_LUCKYNUMBERMAN
	const RADIOTOWER1F_CARD_WOMAN

RadioTower1F_MapScripts:
	def_scene_scripts

	def_callbacks

RadioTower1FReceptionistScript:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	writetext RadioTower1FReceptionistWelcomeText
	waitbutton
	closetext
	end

.Rockets:
	writetext RadioTower1FReceptionistNoToursText
	waitbutton
	closetext
	end

RadioTower1FLuckyNumberManScript:
	faceplayer
	opentext
	writetext RadioTower1FLuckyNumberManAskToPlayText
	promptbutton
	special CheckLuckyNumberShowFlag
	iffalse .skip
	special ResetLuckyNumberShowFlag
.skip
	special PrintTodaysLuckyNumber
	checkflag ENGINE_LUCKY_NUMBER_SHOW
	iftrue .GameOver
	writetext RadioTower1FLuckyNumberManThisWeeksIdIsText
	promptbutton
	closetext
	applymovement RADIOTOWER1F_LUCKYNUMBERMAN, RadioTower1FLuckyNumberManGoToPCMovement
	opentext
	writetext RadioTower1FLuckyNumberManCheckIfMatchText
	promptbutton
	waitsfx
	writetext RadioTower1FLuckyNumberManDotDotDotText
	playsound SFX_DEX_FANFARE_20_49
	waitsfx
	promptbutton
	special CheckForLuckyNumberWinners
	closetext
	applymovement RADIOTOWER1F_LUCKYNUMBERMAN, RadioTower1FLuckyNumberManReturnToPlayerMovement
	opentext
	ifequal 1, .FirstPlace
	ifequal 2, .SecondPlace
	ifequal 3, .ThirdPlace
	sjump .NoPrize

.GameOver:
	writetext RadioTower1FLuckyNumberManComeAgainText
	waitbutton
	closetext
	end

.FirstPlace:
	writetext RadioTower1FLuckyNumberManPerfectMatchText
	playsound SFX_1ST_PLACE
	waitsfx
	promptbutton
	giveitem MASTER_BALL
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.SecondPlace:
	writetext RadioTower1FLuckyNumberManOkayMatchText
	playsound SFX_2ND_PLACE
	waitsfx
	promptbutton
	giveitem EXP_SHARE
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.ThirdPlace:
	writetext RadioTower1FLuckyNumberManWeakMatchText
	playsound SFX_3RD_PLACE
	waitsfx
	promptbutton
	giveitem PP_UP
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.NoPrize:
	writetext RadioTower1FLuckyNumberManNoneOfYourIDNumbersMatchText
	waitbutton
	closetext
	end

.BagFull:
	writetext RadioTower1FLuckyNumberManNoRoomForYourPrizeText
	waitbutton
	closetext
	end

RadioTower1FRadioCardWomanScript:
	faceplayer
	opentext
	checkflag ENGINE_RADIO_CARD
	iftrue .GotCard
	writetext RadioTower1FRadioCardWomanOfferQuizText
	yesorno
	iffalse .NoQuiz
	writetext RadioTower1FRadioCardWomanQuestion1Text
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion2Text
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion3Text
	yesorno
	iftrue .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion4Text
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion5Text
	yesorno
	iftrue .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanYouWinText
	promptbutton
	getstring STRING_BUFFER_4, .RadioCardText
	scall .ReceiveItem
	writetext RadioTower1FPokegearIsARadioText
	promptbutton
	setflag ENGINE_RADIO_CARD
.GotCard:
	writetext RadioTower1FRadioCardWomanTuneInText
	waitbutton
	closetext
	end

.RadioCardText:
	db "RADIO CARD@"

.ReceiveItem:
	jumpstd ReceiveItemScript
	end

.WrongAnswer:
	playsound SFX_WRONG
	writetext RadioTower1FRadioCardWomanWrongAnswerText
	waitbutton
	closetext
	end

.NoQuiz:
	writetext RadioTower1FRadioCardWomanNotTakingQuizText
	waitbutton
	closetext
	end

RadioTower1FLassScript:
	jumptextfaceplayer RadioTower1FLassText

RadioTower1FYoungsterScript:
	jumptextfaceplayer RadioTower1FYoungsterText

TrainerGruntM3:
	trainer GRUNTM, GRUNTM_3, EVENT_BEAT_ROCKET_GRUNTM_3, GruntM3SeenText, GruntM3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM3AfterBattleText
	waitbutton
	closetext
	end

RadioTower1FDirectory:
	jumptext RadioTower1FDirectoryText

RadioTower1FLuckyChannelSign:
	jumptext RadioTower1FLuckyChannelSignText

RadioTower1FLuckyNumberManGoToPCMovement:
	step RIGHT
	turn_head UP
	step_end

RadioTower1FLuckyNumberManReturnToPlayerMovement:
	step LEFT
	turn_head UP
	step_end

RadioTower1FReceptionistWelcomeText:
	text "Chào mừng!"
	done

RadioTower1FReceptionistNoToursText:
	text "Xin chào. Tôi xin"
	line "lỗi, nhưng hôm"
	cont "nay chúng tôi"
	cont "không tham quan."
	done

RadioTower1FLuckyNumberManAskToPlayText:
	text "Chào, bạn đến đây"
	line "vì LUCKY NUMBER"
	cont "SHOW sao?"

	para "Bạn muốn tôi kiểm"
	line "tra số ID của"
	cont "#MON bạn không?"

	para "Nếu may mắn, bạn"
	line "sẽ thắng giải!"
	done

RadioTower1FLuckyNumberManThisWeeksIdIsText:
	text "Số ID tuần này"
	line "là @"
	text_ram wStringBuffer3
	text "."
	done

RadioTower1FLuckyNumberManCheckIfMatchText:
	text "Để xem bạn có"
	line "trùng số không."
	done

RadioTower1FLuckyNumberManDotDotDotText:
	text "<……>"
	line "<……>"
	done

RadioTower1FLuckyNumberManComeAgainText:
	text "Hãy quay lại tuần"
	line "sau để xem LUCKY"
	cont "NUMBER tiếp theo."
	done

RadioTower1FLuckyNumberManPerfectMatchText:
	text "Wow! Bạn trùng"
	line "khớp hoàn hảo cả"
	cont "năm số!"

	para "Chúng ta có người"
	line "thắng giải lớn!"

	para "Bạn đã thắng một"
	line "BÓNG MASTER!"
	done

RadioTower1FLuckyNumberManOkayMatchText:
	text "Này! Bạn đã trùng"
	line "ba số cuối!"

	para "Bạn đã thắng giải"
	line "nhì, một CHIA SẺ"
	cont "KN!"
	done

RadioTower1FLuckyNumberManWeakMatchText:
	text "Ồ, bạn đã trùng"
	line "hai số cuối."

	para "Bạn đã thắng giải"
	line "ba, một PP UP."
	done

RadioTower1FLuckyNumberManNoneOfYourIDNumbersMatchText:
	text "Không, không có"
	line "số ID nào trùng."
	done

RadioTower1FLuckyNumberManNoRoomForYourPrizeText:
	text "Bạn không có chỗ"
	line "cho phần thưởng."

	para "Hãy dọn chỗ và"
	line "quay lại ngay."
	done

RadioTower1FRadioCardWomanOfferQuizText:
	text "Chúng tôi có"
	line "chiến dịch đố vui"
	cont "đặc biệt."

	para "Trả lời đúng năm"
	line "câu hỏi để thắng"
	cont "RADIO CARD."

	para "Gắn nó vào"
	line "#GEAR để nghe"

	para "radio mọi lúc,"
	line "mọi nơi."

	para "Bạn có muốn làm"
	line "bài đố không?"
	done

RadioTower1FRadioCardWomanQuestion1Text:
	text "Câu hỏi 1:"

	para "Có #MON chỉ"
	line "xuất hiện vào"
	cont "buổi sáng không?"
	done

RadioTower1FRadioCardWomanQuestion2Text:
	text "Đúng rồi!"
	line "Câu hỏi 2:"

	para "Câu này đúng"
	line "không?"

	para "Bạn không thể mua"
	line "QUẢ ở MART."
	done

RadioTower1FRadioCardWomanQuestion3Text:
	text "Chính xác!"
	line "Câu hỏi 3:"

	para "HM01 có chứa chiêu"
	line "CẮT không?"
	done

RadioTower1FRadioCardWomanQuestion4Text:
	text "Tốt lắm!"
	line "Câu hỏi 4:"

	para "FALKNER có phải"
	line "T.LĨNH GYM VIOLET"

	para "dùng #MON chim"
	line "không?"
	done

RadioTower1FRadioCardWomanQuestion5Text:
	text "Wow! Đúng nữa!"
	line "Đây là câu hỏi"
	cont "cuối cùng:"

	para "Máy đánh bạc ở"
	line "GOLDENROD GAME"

	para "CORNER có hình"
	line "CHARMANDER không?"
	done

RadioTower1FRadioCardWomanYouWinText:
	text "Bingo! Bạn đúng!"
	line "Chúc mừng!"

	para "Đây là giải của"
	line "bạn, RADIO CARD!"
	done

RadioTower1FPokegearIsARadioText:
	text "#GEAR của"
	line "<PLAYER> giờ có"
	cont "thể làm radio!"
	done

RadioTower1FRadioCardWomanTuneInText:
	text "Hãy theo dõi các"
	line "chương trình của"
	cont "chúng tôi."
	done

RadioTower1FRadioCardWomanWrongAnswerText:
	text "Ôi, không."
	line "Xin lỗi, bạn"

	para "trả lời sai rồi."
	line "Hãy thử lại nhé!"
	done

RadioTower1FRadioCardWomanNotTakingQuizText:
	text "À. Tôi hiểu. Hãy"
	line "gặp tôi nếu bạn"
	cont "đổi ý nhé."
	done

RadioTower1FLassText:
	text "BEN là một DJ"
	line "tuyệt vời."

	para "Giọng ngọt ngào"
	line "làm tôi tan chảy!"
	done

RadioTower1FYoungsterText:
	text "Tôi yêu MARY, từ"
	line "#MON TALK."

	para "Tôi chỉ biết"
	line "giọng cô ấy"
	cont "thôi."
	done

GruntM3SeenText:
	text "Cuối cùng bọn tao"
	line "đã chiếm được"
	cont "THÁP RADIO!"

	para "Giờ mọi người sẽ"
	line "được trải nghiệm"

	para "nỗi kinh hoàng"
	line "của ĐỘI ROCKET!"

	para "Bọn tao sẽ cho"
	line "mày thấy độ đáng"
	cont "sợ của bọn tao!"
	done

GruntM3BeatenText:
	text "Quá mạnh! Bọn tao"
	line "phải canh chừng…"
	done

GruntM3AfterBattleText:
	text "Mày quá mạnh."

	para "Kế hoạch có thể"
	line "hỏng. Tao phải"
	cont "cảnh báo bọn kia…"
	done

RadioTower1FDirectoryText:
	text "1F LỄ TÂN"
	line "2F BÁN HÀNG"

	para "3F NHÂN SỰ"
	line "4F SẢN XUẤT"

	para "5F VĂN PHÒNG"
	line "   GIÁM ĐỐC"
	done

RadioTower1FLuckyChannelSignText:
	text "LUCKY CHANNEL!"

	para "Thắng với số ID"
	line "#MON!"

	para "Trao đổi #MON"
	line "để thu thập nhiều"
	cont "số ID khác nhau!"
	done

RadioTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 11
	warp_event  3,  7, GOLDENROD_CITY, 11
	warp_event 15,  0, RADIO_TOWER_2F, 2

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RadioTower1FDirectory
	bg_event 13,  0, BGEVENT_READ, RadioTower1FLuckyChannelSign

	def_object_events
	object_event  5,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower1FReceptionistScript, -1
	object_event 16,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower1FLassScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 15,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FYoungsterScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 14,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM3, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FLuckyNumberManScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 12,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower1FRadioCardWomanScript, EVENT_GOLDENROD_CITY_CIVILIANS
