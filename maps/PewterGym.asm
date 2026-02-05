	object_const_def
	const PEWTERGYM_BROCK
	const PEWTERGYM_YOUNGSTER
	const PEWTERGYM_GYM_GUIDE

PewterGym_MapScripts:
	def_scene_scripts

	def_callbacks

PewterGymBrockScript:
	faceplayer
	opentext
	checkflag ENGINE_BOULDERBADGE
	iftrue .FightDone
	writetext BrockIntroText
	waitbutton
	closetext
	winlosstext BrockWinLossText, 0
	loadtrainer BROCK, BROCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_CAMPER_JERRY
	opentext
	writetext ReceivedBoulderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_BOULDERBADGE
	writetext BrockBoulderBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext BrockFightDoneText
	waitbutton
	closetext
	end

TrainerCamperJerry:
	trainer CAMPER, JERRY, EVENT_BEAT_CAMPER_JERRY, CamperJerrySeenText, CamperJerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperJerryAfterBattleText
	waitbutton
	closetext
	end

PewterGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BROCK
	iftrue .PewterGymGuideWinScript
	writetext PewterGymGuideText
	waitbutton
	closetext
	end

.PewterGymGuideWinScript:
	writetext PewterGymGuideWinText
	waitbutton
	closetext
	end

PewterGymStatue:
	checkflag ENGINE_BOULDERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, BROCK, BROCK1
	jumpstd GymStatue2Script

BrockIntroText:
	text "BROCK: Ồ, thật"
	line "hiếm khi ta có"

	para "đối thủ đến từ"
	line "JOHTO."

	para "Ta là BROCK,"
	line "T.LĨNH GYM PEWTER."

	para "Ta là chuyên gia"
	line "#MON hệ SỎI ĐÁ."

	para "#MON của ta"
	line "miễn nhiễm với đa"

	para "số đòn vật lý."
	line "Ngươi sẽ rất khó"

	para "gây sát thương"
	line "được đấy."

	para "Lên đi!"
	done

BrockWinLossText:
	text "BROCK: Đòn tấn"
	line "công mạnh của"
	cont "#MON ngươi đã"
	cont "vượt qua phòng"
	cont "thủ đá cứng…"

	para "Ngươi mạnh hơn"
	line "ta tưởng…"

	para "Đây, nhận lấy"
	line "HUY HIỆU này."
	done

ReceivedBoulderBadgeText:
	text "<PLAYER> nhận được"
	line "HC BOULDER."
	done

BrockBoulderBadgeText:
	text "BROCK: <PLAY_G>,"
	line "cảm ơn. Ta thích"

	para "đấu với ngươi, dù"
	line "hơi buồn một chút."

	para "HC BOULDER sẽ"
	line "giúp #MON của"

	para "ngươi mạnh hơn"
	line "nữa."
	done

BrockFightDoneText:
	text "BROCK: Thế giới"
	line "rất rộng. Vẫn còn"

	para "nhiều HLV giỏi"
	line "như ngươi."

	para "Cứ chờ xem. Ta sẽ"
	line "còn trở nên mạnh"
	cont "hơn nhiều."
	done

CamperJerrySeenText:
	text "Các HLV ở GYM này"
	line "dùng #MON hệ"
	cont "SỎI ĐÁ."

	para "Hệ SỎI ĐÁ có chỉ"
	line "số THỦ cao."

	para "Trận đấu có thể"
	line "kéo dài. Bạn đã"

	para "sẵn sàng chưa?"
	done

CamperJerryBeatenText:
	text "Tôi phải thắng"
	line "mới được…"
	done

CamperJerryAfterBattleText:
	text "Này, HLV từ"
	line "JOHTO! BROCK rất"

	para "mạnh. Ông ấy sẽ"
	line "trừng phạt bạn"

	para "nếu bạn không"
	line "nghiêm túc đâu."
	done

PewterGymGuideText:
	text "Yo! NHÀ VÔ ĐỊCH"
	line "tương lai! Bạn"

	para "thật tuyệt vời."
	line "Bạn đang đấu"

	para "các T.LĨNH GYM"
	line "ở KANTO à?"

	para "Họ rất mạnh và"
	line "tận tâm, giống"

	para "như các T.LĨNH"
	line "GYM ở JOHTO vậy."
	done

PewterGymGuideWinText:
	text "Yo! NHÀ VÔ ĐỊCH"
	line "tương lai! GYM"

	para "này không khó"
	line "với bạn nhỉ."

	para "Cách bạn chiến"
	line "đấu thật đáng"

	para "ngưỡng mộ. Tôi"
	line "nói thật đấy."
	done

PewterGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 13, PEWTER_CITY, 2
	warp_event  5, 13, PEWTER_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  2, 11, BGEVENT_READ, PewterGymStatue
	bg_event  7, 11, BGEVENT_READ, PewterGymStatue

	def_object_events
	object_event  5,  1, SPRITE_BROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterGymBrockScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperJerry, -1
	object_event  6, 11, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, PewterGymGuideScript, -1
