DEF BLUE_CARD_POINT_CAP EQU 30

	object_const_def
	const RADIOTOWER2F_SUPER_NERD
	const RADIOTOWER2F_TEACHER
	const RADIOTOWER2F_ROCKET1
	const RADIOTOWER2F_ROCKET2
	const RADIOTOWER2F_ROCKET3
	const RADIOTOWER2F_ROCKET_GIRL
	const RADIOTOWER2F_BLACK_BELT1
	const RADIOTOWER2F_BLACK_BELT2
	const RADIOTOWER2F_JIGGLYPUFF
	const RADIOTOWER2F_BUENA
	const RADIOTOWER2F_RECEPTIONIST

RadioTower2F_MapScripts:
	def_scene_scripts

	def_callbacks

RadioTower2FNoopScene: ; unreferenced
	end

RadioTower2FSuperNerdScript:
	jumptextfaceplayer RadioTower2FSuperNerdText

RadioTower2FTeacherScript:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	writetext RadioTower2FTeacherText
	waitbutton
	closetext
	end

.Rockets:
	writetext RadioTower2FTeacherText_Rockets
	waitbutton
	closetext
	end

RadioTowerJigglypuff:
	opentext
	writetext RadioTowerJigglypuffText
	cry JIGGLYPUFF
	waitbutton
	closetext
	end

RadioTower2FBlackBelt1Script:
	jumptextfaceplayer RadioTower2FBlackBelt1Text

RadioTower2FBlackBelt2Script:
	jumptextfaceplayer RadioTower2FBlackBelt2Text

TrainerGruntM4:
	trainer GRUNTM, GRUNTM_4, EVENT_BEAT_ROCKET_GRUNTM_4, GruntM4SeenText, GruntM4BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM4AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM5:
	trainer GRUNTM, GRUNTM_5, EVENT_BEAT_ROCKET_GRUNTM_5, GruntM5SeenText, GruntM5BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM5AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM6:
	trainer GRUNTM, GRUNTM_6, EVENT_BEAT_ROCKET_GRUNTM_6, GruntM6SeenText, GruntM6BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM6AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF2:
	trainer GRUNTF, GRUNTF_2, EVENT_BEAT_ROCKET_GRUNTF_2, GruntF2SeenText, GruntF2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF2AfterBattleText
	waitbutton
	closetext
	end

Buena:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover
	checkevent EVENT_MET_BUENA
	iffalse .Introduction
	checkflag ENGINE_BUENAS_PASSWORD_2
	iftrue .PlayedAlready
	readvar VAR_HOUR
	ifless NITE_HOUR, .TooEarly
	checkflag ENGINE_BUENAS_PASSWORD
	iffalse .TuneIn
	checkitem BLUE_CARD
	iffalse .NoBlueCard
	readvar VAR_BLUECARDBALANCE
	ifequal BLUE_CARD_POINT_CAP, .BlueCardCapped0
	playmusic MUSIC_BUENAS_PASSWORD
	writetext RadioTower2FBuenaDoYouKnowPasswordText
	special AskRememberPassword
	iffalse .ForgotPassword
	writetext RadioTower2FBuenaJoinTheShowText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	readvar VAR_FACING
	ifnotequal RIGHT, .DontNeedToMove
	applymovement PLAYER, RadioTower2FPlayerWalksToMicrophoneMovement
.DontNeedToMove:
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower2FBuenaEveryoneSayPasswordText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, DOWN
	reanchormap
	special BuenasPassword
	closetext
	iffalse .WrongAnswer
	opentext
	writetext RadioTower2FBuenaCorrectAnswerText
	waitbutton
	closetext
	readvar VAR_BLUECARDBALANCE
	addval 1
	writevar VAR_BLUECARDBALANCE
	waitsfx
	playsound SFX_TRANSACTION
	setflag ENGINE_BUENAS_PASSWORD_2
	pause 20
	turnobject RADIOTOWER2F_BUENA, RIGHT
	opentext
	writetext RadioTower2FBuenaThanksForComingText
	waitbutton
	closetext
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	readvar VAR_BLUECARDBALANCE
	ifequal BLUE_CARD_POINT_CAP, .BlueCardCapped1
	end

.Introduction:
	writetext RadioTower2FBuenaShowIntroductionText
	promptbutton
	setevent EVENT_MET_BUENA
	verbosegiveitem BLUE_CARD
.TuneIn:
	writetext RadioTower2FBuenaTuneInToMyShowText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered0
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered0:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.ForgotPassword:
	writetext RadioTower2FBuenaComeBackAfterListeningText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.PlayedAlready:
	writetext RadioTower2FBuenaAlreadyPlayedText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered1
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered1:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 10
	end

.WrongAnswer:
	setflag ENGINE_BUENAS_PASSWORD_2
	opentext
	writetext RadioTower2FBuenaDidYouForgetText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 20
	opentext
	writetext RadioTower2FBuenaThanksForComingText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.MidRocketTakeover:
	writetext RadioTower2FBuenaPasswordIsHelpText
	waitbutton
	closetext
	end

.NoBlueCard:
	writetext RadioTower2FBuenaNoBlueCardText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered2
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
.Registered2:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.BlueCardCapped0:
	writetext RadioTower2FBuenaCardIsFullText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered3
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
.Registered3:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.TooEarly:
	writetext RadioTower2FBuenaTuneInAfterSixText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered4
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered4:
	end

.BlueCardCapped1:
	checkcellnum PHONE_BUENA
	iftrue .HasNumber
	pause 20
	turnobject RADIOTOWER2F_BUENA, DOWN
	pause 15
	turnobject PLAYER, UP
	pause 15
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
	showemote EMOTE_SHOCK, RADIOTOWER2F_BUENA, 15
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	opentext
	writetext RadioTower2FBuenaOfferPhoneNumberText
	sjump .AskForNumber

.OfferedNumberBefore:
	opentext
	writetext RadioTower2FBuenaOfferNumberAgainText
.AskForNumber:
	askforphonenumber PHONE_BUENA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	writetext RadioTower2FRegisteredBuenasNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
	writetext RadioTower2FBuenaCallMeText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	addcellnum PHONE_BUENA
	end

.NumberDeclined:
	writetext RadioTower2FBuenaSadRejectedText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.PhoneFull:
	writetext RadioTower2FBuenaYourPhoneIsFullText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
.HasNumber:
	end

RadioTowerBuenaPrizeReceptionist:
	faceplayer
	opentext
	checkitem BLUE_CARD
	iffalse .NoCard
	writetext RadioTower2FBuenaReceptionistPointsForPrizesText
	promptbutton
	special BuenaPrize
	closetext
	end

.NoCard:
	writetext RadioTower2FBuenaReceptionistNoCardText
	promptbutton
	closetext
	end

RadioTower2FSalesSign:
	jumptext RadioTower2FSalesSignText

RadioTower2FOaksPKMNTalkSign:
	jumptext RadioTower2FOaksPKMNTalkSignText

RadioTower2FPokemonRadioSign:
	jumptext RadioTower2FPokemonRadioSignText

RadioTower2FBookshelf:
	jumpstd MagazineBookshelfScript

RadioTower2FPlayerWalksToMicrophoneMovement:
	slow_step DOWN
	slow_step RIGHT
	step_end

RadioTower2FSuperNerdText:
	text "Bạn có thể nghe"
	line "radio ở bất cứ"
	cont "đâu. Hãy nghe đi!"
	done

RadioTower2FTeacherText:
	text "Bài hát ru trên"
	line "radio có thể làm"
	cont "#MON ngủ."
	done

RadioTower2FTeacherText_Rockets:
	text "Tại sao chúng lại"
	line "muốn chiếm THÁP"
	cont "RADIO?"
	done

RadioTowerJigglypuffText:
	text "JIGGLYPUFF:"
	line "Jiggly…"
	done

RadioTower2FBlackBelt1Text:
	text "Xin lỗi. Chỉ nhân"
	line "viên được phép"
	cont "vào khu vực này."

	para "Trước đây không"
	line "như vậy."

	para "Có gì đó không ổn"
	line "với GIÁM ĐỐC…"
	done

RadioTower2FBlackBelt2Text:
	text "Cứ tự nhiên tham"
	line "quan mọi nơi."

	para "GIÁM ĐỐC đã tốt"
	line "bụng trở lại như"
	cont "trước."
	done

GruntM4SeenText:
	text "Ba năm trước,"
	line "ĐỘI ROCKET bị"
	cont "buộc giải tán."

	para "Nhưng bọn tao sẽ"
	line "trở lại ở đây!"
	done

GruntM4BeatenText:
	text "Gwah! Đừng có làm"
	line "màu!"
	done

GruntM4AfterBattleText:
	text "Bọn tao không để"
	line "mày phá hoại kế"
	cont "hoạch trở lại!"
	done

GruntM5SeenText:
	text "Bọn tao là"
	line "ĐỘI ROCKET, bọn"
	cont "bóc lột #MON!"

	para "Bọn tao thích làm"
	line "kẻ xấu! Sợ chưa?"
	done

GruntM5BeatenText:
	text "Mày tưởng mày là"
	line "anh hùng hả?"
	done

GruntM5AfterBattleText:
	text "Bọn tao không lúc"
	line "nào cũng xấu. Bọn"
	cont "tao thích gì làm"
	cont "nấy thôi."
	done

GruntM6SeenText:
	text "Này, này! Tránh"
	line "đường bọn tao ra!"
	done

GruntM6BeatenText:
	text "Argh. Tao bỏ cuộc."
	done

GruntM6AfterBattleText:
	text "Các EXECUTIVE bọn"
	line "tao đang cố chiếm"
	cont "nơi này."

	para "Họ có kế hoạch"
	line "lớn. Tao tự hỏi"
	cont "đó là gì?"
	done

GruntF2SeenText:
	text "Hahaha!"

	para "Chán thật."
	line "Chiếm nơi này"

	para "quá dễ dàng!"

	para "Nào, làm tao vui"
	line "đi nào!"
	done

GruntF2BeatenText:
	text "M-mày là ai?"
	done

GruntF2AfterBattleText:
	text "Mày đánh bại tao,"
	line "tao sẽ nhớ đấy!"
	done

RadioTower2FBuenaShowIntroductionText:
	text "BUENA: Chào! Tôi"
	line "là BUENA!"

	para "Bạn có biết về"
	line "c.trình radio tên"
	cont "MẬT KHẨU không?"

	para "Nếu bạn nói đúng"
	line "mật khẩu từ"

	para "chương trình, bạn"
	line "sẽ được điểm."

	para "Tích điểm và đổi"
	line "với cô gái xinh"

	para "đẹp kia để lấy"
	line "phần thưởng!"

	para "Đây nè!"

	para "Đây là thẻ điểm"
	line "của riêng bạn!"
	done

RadioTower2FBuenaTuneInToMyShowText:
	text "BUENA: Hãy theo"
	line "dõi SHOW MẬT KHẨU"
	cont "của tôi!"
	done

RadioTower2FBuenaDoYouKnowPasswordText:
	text "BUENA: Chào!"
	line "Bạn đã nghe chương"
	cont "trình radio chưa?"

	para "Bạn còn nhớ mật"
	line "khẩu hôm nay?"
	done

RadioTower2FBuenaJoinTheShowText:
	text "BUENA: Ồ, tuyệt!"
	line "Cảm ơn bạn!"

	para "Tên bạn là gì"
	line "nhỉ?"

	para "…<PLAY_G>, OK!"

	para "Nào, <PLAY_G>."
	line "Tham gia show đi."
	done

RadioTower2FBuenaEveryoneSayPasswordText:
	text "BUENA: Mọi người"
	line "sẵn sàng chưa?"

	para "Tôi muốn nghe các"
	line "bạn hét to mật"

	para "khẩu hôm nay cho"
	line "<PLAY_G>!"
	done

RadioTower2FBuenaComeBackAfterListeningText:
	text "BUENA: Quay lại"
	line "sau khi nghe show"

	para "của tôi nhé?"
	line "Hẹn gặp lại!"
	done

RadioTower2FBuenaAlreadyPlayedText:
	text "BUENA: Xin lỗi…"

	para "Bạn chỉ có một"
	line "cơ hội mỗi ngày."

	para "Quay lại ngày mai"
	line "để thử lại nhé!"
	done

RadioTower2FBuenaCorrectAnswerText:
	text "BUENA: YIPPEE!"
	line "Đúng rồi!"

	para "Bạn đã nghe show!"
	line "Tôi vui quá!"

	para "Bạn được một"
	line "điểm! Chúc mừng!"
	done

RadioTower2FBuenaDidYouForgetText:
	text "BUENA: Aww…"
	line "Không phải vậy…"

	para "Bạn quên mật khẩu"
	line "rồi sao?"
	done

RadioTower2FBuenaThanksForComingText:
	text "BUENA: Vâng! Thí"
	line "sinh của chúng ta"

	para "là <PLAY_G>."
	line "Cảm ơn đã đến!"

	para "Tôi hy vọng các"
	line "bạn thính giả"

	para "cũng sẽ đến!"
	line "Tôi sẽ chờ đợi!"
	done

RadioTower2FBuenaPasswordIsHelpText:
	text "BUENA: Hả?"
	line "Mật khẩu hôm nay?"

	para "HELP, dĩ nhiên!"
	done

RadioTower2FBuenaCardIsFullText:
	text "BUENA: THẺ XANH"
	line "của bạn đầy rồi."

	para "Đổi lấy phần"
	line "thưởng tuyệt vời!"
	done

RadioTower2FBuenaTuneInAfterSixText:
	text "BUENA: Hãy nghe"
	line "MẬT KHẨU mỗi"

	para "tối từ 6 giờ đến"
	line "nửa đêm!"

	para "Nghe xong thì ghé"
	line "thăm tôi nhé!"
	done

RadioTower2FBuenaNoBlueCardText:
	text "BUENA: Ồ? Bạn"
	line "quên mang THẺ"
	cont "XANH sao?"

	para "Tôi không thể cho"
	line "điểm nếu bạn"
	cont "không có nó."
	done

RadioTower2FBuenaOfferPhoneNumberText:
	text "BUENA: Ồ! THẺ"
	line "XANH của bạn đạt"

	para "30 điểm hôm nay!"
	line "Thật tuyệt vời!"

	para "Hmm… Không có giải"
	line "cho 30 điểm,"
	cont "nhưng…"

	para "Bạn ghé thường"
	line "xuyên, <PLAY_G>."

	para "Tôi sẽ cho bạn"
	line "ưu đãi đặc biệt!"

	para "Bạn có muốn số"
	line "điện thoại tôi?"
	done

RadioTower2FBuenaOfferNumberAgainText:
	text "BUENA: <PLAY_G>,"
	line "bạn có muốn đăng"

	para "ký số điện thoại"
	line "của tôi không?"
	done

RadioTower2FRegisteredBuenasNumberText:
	text "<PLAYER> đăng ký"
	line "số của BUENA."
	done

RadioTower2FBuenaCallMeText:
	text "BUENA: Tôi mong"
	line "được nghe tin"
	cont "từ bạn!"
	done

RadioTower2FBuenaSadRejectedText:
	text "BUENA: Aww… Đây"
	line "là giải đặc biệt…"
	done

RadioTower2FBuenaYourPhoneIsFullText:
	text "BUENA: <PLAY_G>,"
	line "danh bạ của bạn"

	para "không còn chỗ cho"
	line "tôi nữa…"
	done

RadioTower2FBuenaReceptionistPointsForPrizesText:
	text "Bạn có thể đổi"
	line "điểm đã tích lũy"

	para "lấy phần thưởng"
	line "tuyệt vời!"
	done

RadioTower2FBuenaReceptionistNoCardText:
	text "Bạn không thể đổi"
	line "điểm nếu không có"
	cont "THẺ XANH."

	para "Đừng quên mang"
	line "THẺ XANH nhé!"
	done

RadioTower2FSalesSignText:
	text "2F BÁN HÀNG"
	done

RadioTower2FOaksPKMNTalkSignText:
	text "GS.OAK'S #MON"
	line "TALK"

	para "C.Trình Nóng Nhất"
	line "Trên Sóng!"
	done

RadioTower2FPokemonRadioSignText:
	text "Mọi Nơi, Mọi Lúc"
	line "#MON Radio"
	done

RadioTower2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_3F, 1
	warp_event 15,  0, RADIO_TOWER_1F, 3

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RadioTower2FSalesSign
	bg_event  5,  0, BGEVENT_READ, RadioTower2FOaksPKMNTalkSign
	bg_event  9,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 10,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 11,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 13,  0, BGEVENT_READ, RadioTower2FPokemonRadioSign

	def_object_events
	object_event  6,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower2FSuperNerdScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 17,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower2FTeacherScript, -1
	object_event  1,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM5, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM6, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 10,  5, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGruntF2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  0,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FBlackBelt1Script, EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	object_event  1,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FBlackBelt2Script, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 12,  1, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTowerJigglypuff, -1
	object_event 14,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Buena, -1
	object_event 12,  7, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTowerBuenaPrizeReceptionist, EVENT_GOLDENROD_CITY_CIVILIANS
