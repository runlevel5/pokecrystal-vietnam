	object_const_def
	const OLIVINEGYM_JASMINE
	const OLIVINEGYM_GYM_GUIDE

OlivineGym_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineGymJasmineScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JASMINE
	iftrue .FightDone
	writetext Jasmine_SteelTypeIntro
	waitbutton
	closetext
	winlosstext Jasmine_BetterTrainer, 0
	loadtrainer JASMINE, JASMINE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JASMINE
	opentext
	writetext Text_ReceivedMineralBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINERALBADGE
	readvar VAR_BADGES
	scall OlivineGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM23_IRON_TAIL
	iftrue .GotIronTail
	writetext Jasmine_BadgeSpeech
	promptbutton
	verbosegiveitem TM_IRON_TAIL
	iffalse .NoRoomForIronTail
	setevent EVENT_GOT_TM23_IRON_TAIL
	writetext Jasmine_IronTailSpeech
	waitbutton
	closetext
	end

.GotIronTail:
	writetext Jasmine_GoodLuck
	waitbutton
.NoRoomForIronTail:
	closetext
	end

OlivineGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

OlivineGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_JASMINE
	iftrue .OlivineGymGuideWinScript
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iffalse .OlivineGymGuidePreScript
	opentext
	writetext OlivineGymGuideText
	waitbutton
	closetext
	end

.OlivineGymGuideWinScript:
	opentext
	writetext OlivineGymGuideWinText
	waitbutton
	closetext
	end

.OlivineGymGuidePreScript:
	opentext
	writetext OlivineGymGuidePreText
	waitbutton
	closetext
	end

OlivineGymStatue:
	checkflag ENGINE_MINERALBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, JASMINE, JASMINE1
	jumpstd GymStatue2Script

Jasmine_SteelTypeIntro:
	text "…Cảm ơn bạn đã"
	line "giúp đỡ ở"
	cont "HẢI ĐĂNG…"

	para "Nhưng đây là việc"
	line "khác. Tôi xin tự"
	cont "giới thiệu."

	para "Tôi là JASMINE,"
	line "T.LĨNH GYM. Tôi"
	cont "dùng hệ THÉP."

	para "…Bạn có biết về"
	line "hệ THÉP không?"

	para "Đó là hệ mới được"
	line "phát hiện gần"
	cont "đây."

	para "…À… Bắt đầu nhé?"
	done

Jasmine_BetterTrainer:
	text "…Bạn là HLV giỏi"
	line "hơn tôi, cả về"

	para "kỹ năng lẫn lòng"
	line "tốt bụng."

	para "Theo quy định của"
	line "LIÊN ĐOÀN, tôi"
	cont "trao cho bạn HUY"
	cont "HIỆU này."
	done

Text_ReceivedMineralBadge:
	text "<PLAYER> nhận được"
	line "MINERALBADGE."
	done

Jasmine_BadgeSpeech:
	text "MINERALBADGE"
	line "tăng THỦ cho"
	cont "#MON."

	para "…À… Xin nhận thêm"
	line "cái này…"
	done

Text_ReceivedTM09: ; unreferenced
	text "<PLAYER> nhận được"
	line "TM09."
	done

Jasmine_IronTailSpeech:
	text "…Bạn có thể dùng"
	line "TM đó để dạy"
	cont "IRON TAIL."
	done

Jasmine_GoodLuck:
	text "À… Tôi không biết"
	line "nói sao, nhưng…"
	cont "chúc may mắn…"
	done

OlivineGymGuideText:
	text "JASMINE dùng hệ"
	line "THÉP mới được"
	cont "phát hiện."

	para "Tôi không biết"
	line "nhiều về nó."
	done

OlivineGymGuideWinText:
	text "Quá tuyệt vời."

	para "Hệ THÉP, hả?"

	para "Đó là cuộc chạm"
	line "trán với một thứ"
	cont "bí ẩn!"
	done

OlivineGymGuidePreText:
	text "JASMINE, T.LĨNH"
	line "GYM, đang ở"
	cont "HẢI ĐĂNG."

	para "Cô ấy đang chăm"
	line "sóc #MON bị ốm."

	para "HLV giỏi cần có"
	line "lòng trắc ẩn."
	done

OlivineGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, OLIVINE_CITY, 2
	warp_event  5, 15, OLIVINE_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, OlivineGymStatue
	bg_event  6, 13, BGEVENT_READ, OlivineGymStatue

	def_object_events
	object_event  5,  3, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymJasmineScript, EVENT_OLIVINE_GYM_JASMINE
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymGuideScript, -1
