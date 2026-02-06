	object_const_def
	const SAFFRONGYM_SABRINA
	const SAFFRONGYM_GRANNY1
	const SAFFRONGYM_YOUNGSTER1
	const SAFFRONGYM_GRANNY2
	const SAFFRONGYM_YOUNGSTER2
	const SAFFRONGYM_GYM_GUIDE

SaffronGym_MapScripts:
	def_scene_scripts

	def_callbacks

SaffronGymSabrinaScript:
	faceplayer
	opentext
	checkflag ENGINE_MARSHBADGE
	iftrue .FightDone
	writetext SabrinaIntroText
	waitbutton
	closetext
	winlosstext SabrinaWinLossText, 0
	loadtrainer SABRINA, SABRINA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SABRINA
	setevent EVENT_BEAT_MEDIUM_REBECCA
	setevent EVENT_BEAT_MEDIUM_DORIS
	setevent EVENT_BEAT_PSYCHIC_FRANKLIN
	setevent EVENT_BEAT_PSYCHIC_JARED
	opentext
	writetext ReceivedMarshBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MARSHBADGE
	writetext SabrinaMarshBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext SabrinaFightDoneText
	waitbutton
	closetext
	end

TrainerMediumRebecca:
	trainer MEDIUM, REBECCA, EVENT_BEAT_MEDIUM_REBECCA, MediumRebeccaSeenText, MediumRebeccaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumRebeccaAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicFranklin:
	trainer PSYCHIC_T, FRANKLIN, EVENT_BEAT_PSYCHIC_FRANKLIN, PsychicFranklinSeenText, PsychicFranklinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicFranklinAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumDoris:
	trainer MEDIUM, DORIS, EVENT_BEAT_MEDIUM_DORIS, MediumDorisSeenText, MediumDorisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumDorisAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicJared:
	trainer PSYCHIC_T, JARED, EVENT_BEAT_PSYCHIC_JARED, PsychicJaredSeenText, PsychicJaredBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicJaredAfterBattleText
	waitbutton
	closetext
	end

SaffronGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SABRINA
	iftrue .SaffronGymGuideWinScript
	writetext SaffronGymGuideText
	waitbutton
	closetext
	end

.SaffronGymGuideWinScript:
	writetext SaffronGymGuideWinText
	waitbutton
	closetext
	end

SaffronGymStatue:
	checkflag ENGINE_MARSHBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, SABRINA, SABRINA1
	jumpstd GymStatue2Script

SabrinaIntroText:
	text "SABRINA: Ta biết"
	line "ngươi sẽ đến…"

	para "Ba năm trước ta"
	line "đã thấy trước sự"
	cont "xuất hiện của"
	cont "ngươi."

	para "Ngươi muốn HC"
	line "của ta."

	para "Ta không thích"
	line "đấu, nhưng đó là"

	para "nghĩa vụ của một"
	line "T.LĨNH để trao"

	para "HUY HIỆU cho ai"
	line "chứng minh được"
	cont "bản thân."

	para "Vì ngươi muốn,"
	line "ta sẽ cho ngươi"
	cont "thấy sức mạnh"
	cont "tâm linh của ta!"
	done

SabrinaWinLossText:
	text "SABRINA: Sức mạnh"
	line "của ngươi…"

	para "Nó vượt xa những"
	line "gì ta tiên đoán…"

	para "Có lẽ không thể"
	line "dự đoán hoàn toàn"

	para "những gì tương"
	line "lai nắm giữ…"

	para "Được, ngươi thắng"
	line "Ngươi xứng đáng"
	cont "HUY HIỆU ĐẦM LẦY."
	done

ReceivedMarshBadgeText:
	text "<PLAYER> nhận được"
	line "HUY HIỆU ĐẦM LẦY."
	done

SabrinaMarshBadgeText:
	text "SABRINA: HUY HIỆU"
	line "ĐẦM LẦY khai phá"

	para "sức mạnh tiềm ẩn"
	line "của ngươi…"

	para "Dù ta không tiên"
	line "đoán chính xác"
	cont "sức mạnh ngươi,"

	para "ta biết điều này"
	line "là thật."

	para "Ngươi sẽ trở"
	line "thành một nhà"
	cont "VÔ ĐỊCH lừng"
	cont "danh và được"
	cont "yêu mến!"
	done

SabrinaFightDoneText:
	text "SABRINA: Tình yêu"
	line "của ngươi dành"

	para "cho #MON áp đảo"
	line "sức mạnh tâm linh"
	cont "của ta…"

	para "Sức mạnh của tình"
	line "yêu, ta nghĩ,"

	para "cũng là một loại"
	line "sức mạnh tâm"
	cont "linh…"
	done

MediumRebeccaSeenText:
	text "Sức mạnh của tất"
	line "cả người bạn"

	para "đánh bại đến với"
	line "tôi!"
	done

MediumRebeccaBeatenText:
	text "Mạnh quá…"
	line "Mạnh quá…"
	done

MediumRebeccaAfterBattleText:
	text "Nguồn sức mạnh"
	line "của bạn là gì?"
	done

PsychicFranklinSeenText:
	text "Sức mạnh tâm linh"
	line "là sức mạnh của"
	cont "linh hồn."
	done

PsychicFranklinBeatenText:
	text "Linh hồn bạn mạnh"
	line "hơn tôi!"
	done

PsychicFranklinAfterBattleText:
	text "Bạn làm linh hồn"
	line "mạnh hơn, không"

	para "chỉ khả năng"
	line "của bạn."
	done

MediumDorisSeenText:
	text "Hùhùhù…"
	line "Tôi thấy rõ."

	para "Tôi có thể nhìn"
	line "vào linh hồn bạn!"
	done

MediumDorisBeatenText:
	text "Dù đọc được bạn,"
	line "tôi vẫn thua…"
	done

MediumDorisAfterBattleText:
	text "Chết! Tôi quên"
	line "rằng tôi đã tiên"

	para "đoán sẽ thua"
	line "bạn."
	done

PsychicJaredSeenText:
	text "VÕ ĐƯỜNG bên cạnh"
	line "từng là GYM của"
	cont "thành phố này."
	done

PsychicJaredBeatenText:
	text "Tôi không địch"
	line "nổi…"
	done

PsychicJaredAfterBattleText:
	text "VUA KARATE, chủ"
	line "của VÕ ĐƯỜNG,"

	para "đã bị SABRINA"
	line "đánh bại hoàn"
	cont "toàn."
	done

SaffronGymGuideText:
	text "Yo, nhà vô địch"
	line "tương lai!"

	para "Một HLV giỏi như"
	line "bạn không cần ai"

	para "dạy cách đối phó"
	line "#MON tâm linh,"
	cont "phải không?"

	para "Tôi kỳ vọng lớn"
	line "vào bạn!"

	para "Chúc may mắn!"
	done

SaffronGymGuideWinText:
	text "Đó là một trận"
	line "đấu tuyệt vời!"
	done

SaffronGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 17, SAFFRON_CITY, 2
	warp_event  9, 17, SAFFRON_CITY, 2
	warp_event 11, 15, SAFFRON_GYM, 18
	warp_event 19, 15, SAFFRON_GYM, 19
	warp_event 19, 11, SAFFRON_GYM, 20
	warp_event  1, 11, SAFFRON_GYM, 21
	warp_event  5,  3, SAFFRON_GYM, 22
	warp_event 11,  5, SAFFRON_GYM, 23
	warp_event  1, 15, SAFFRON_GYM, 24
	warp_event 19,  3, SAFFRON_GYM, 25
	warp_event 15, 17, SAFFRON_GYM, 26
	warp_event  5, 17, SAFFRON_GYM, 27
	warp_event  5,  9, SAFFRON_GYM, 28
	warp_event  9,  3, SAFFRON_GYM, 29
	warp_event 15,  9, SAFFRON_GYM, 30
	warp_event 15,  5, SAFFRON_GYM, 31
	warp_event  1,  5, SAFFRON_GYM, 32
	warp_event 19, 17, SAFFRON_GYM, 3
	warp_event 19,  9, SAFFRON_GYM, 4
	warp_event  1,  9, SAFFRON_GYM, 5
	warp_event  5,  5, SAFFRON_GYM, 6
	warp_event 11,  3, SAFFRON_GYM, 7
	warp_event  1, 17, SAFFRON_GYM, 8
	warp_event 19,  5, SAFFRON_GYM, 9
	warp_event 15, 15, SAFFRON_GYM, 10
	warp_event  5, 15, SAFFRON_GYM, 11
	warp_event  5, 11, SAFFRON_GYM, 12
	warp_event  9,  5, SAFFRON_GYM, 13
	warp_event 15, 11, SAFFRON_GYM, 14
	warp_event 15,  3, SAFFRON_GYM, 15
	warp_event  1,  3, SAFFRON_GYM, 16
	warp_event 11,  9, SAFFRON_GYM, 17

	def_coord_events

	def_bg_events
	bg_event  8, 15, BGEVENT_READ, SaffronGymStatue

	def_object_events
	object_event  9,  8, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronGymSabrinaScript, -1
	object_event 17, 16, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerMediumRebecca, -1
	object_event  3, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicFranklin, -1
	object_event  3,  4, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerMediumDoris, -1
	object_event 17,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicJared, -1
	object_event  9, 14, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronGymGuideScript, -1
