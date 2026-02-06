	object_const_def
	const ROUTE9_YOUNGSTER1
	const ROUTE9_LASS1
	const ROUTE9_YOUNGSTER2
	const ROUTE9_LASS2
	const ROUTE9_POKEFAN_M1
	const ROUTE9_POKEFAN_M2

Route9_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerCamperDean:
	trainer CAMPER, DEAN, EVENT_BEAT_CAMPER_DEAN, CamperDeanSeenText, CamperDeanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperDeanAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHeidi:
	trainer PICNICKER, HEIDI, EVENT_BEAT_PICNICKER_HEIDI, PicnickerHeidiSeenText, PicnickerHeidiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHeidiAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperSid:
	trainer CAMPER, SID, EVENT_BEAT_CAMPER_SID, CamperSidSeenText, CamperSidBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSidAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerEdna:
	trainer PICNICKER, EDNA, EVENT_BEAT_PICNICKER_EDNA, PicnickerEdnaSeenText, PicnickerEdnaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerEdnaAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerTim:
	trainer HIKER, TIM, EVENT_BEAT_HIKER_TIM, HikerTimSeenText, HikerTimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerTimAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerSidney:
	trainer HIKER, SIDNEY, EVENT_BEAT_HIKER_SIDNEY, HikerSidneySeenText, HikerSidneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerSidneyAfterBattleText
	waitbutton
	closetext
	end

Route9Sign:
	jumptext Route9SignText

Route9HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_9_HIDDEN_ETHER

CamperDeanSeenText:
	text "Tôi đến khám phá"
	line "ĐƯỜNG HẦM ĐÁ."
	done

CamperDeanBeatenText:
	text "Ối! Nguy hiểm quá."
	done

CamperDeanAfterBattleText:
	text "#MON của tôi bị"
	line "thương trước khi"

	para "vào ĐƯỜNG HẦM ĐÁ."

	para "Tốt nhất tôi nên"
	line "đưa chúng đến TT"
	cont "#MON ngay."
	done

PicnickerHeidiSeenText:
	text "Bạn đã từng đi dã"
	line "ngoại chưa?"

	para "Vui lắm!"
	done

PicnickerHeidiBeatenText:
	text "Ôiiiii!"
	done

PicnickerHeidiAfterBattleText:
	text "Chúng tôi nướng"
	line "nhiều đồ ngon và"

	para "chia sẻ với nhau."
	line "Ngon tuyệt!"
	done

CamperSidSeenText:
	text "Này, bạn!"
	line "Đừng vứt rác!"
	done

CamperSidBeatenText:
	text "Tôi chỉ nhắc nhở"
	line "thôi…"
	done

CamperSidAfterBattleText:
	text "Xin lỗi. Bạn không"
	line "vứt rác. Tôi lầm."
	done

PicnickerEdnaSeenText:
	text "Mọi người không"
	line "nên để lại rác"
	cont "đâu cả."
	done

PicnickerEdnaBeatenText:
	text "Ôi… Tôi thua…"
	done

PicnickerEdnaAfterBattleText:
	text "Tiết kiệm năng"
	line "lượng quan trọng,"

	para "nhưng môi trường"
	line "còn quan trọng hơn"
	done

HikerTimSeenText:
	text "Cô ấy sẽ đến vòng"
	line "quanh NÚI BẠC khi"
	cont "cô ấy đến…"

	para "NÚI BẠC ở JOHTO"
	line "phải không?"
	done

HikerTimBeatenText:
	text "Tôi mải hát quá…"
	done

HikerTimAfterBattleText:
	text "Trận đấu cần sự"
	line "tập trung."
	done

HikerSidneySeenText:
	text "Tôi sẽ nói cho bạn"
	line "điều bí mật."

	para "Nhưng trước tiên,"
	line "đấu nào!"
	done

HikerSidneyBeatenText:
	text "Ôi, chết!"
	line "Tôi thua rồi…"
	done

HikerSidneyAfterBattleText:
	text "NHÀ MÁY ĐIỆN nằm"
	line "bên kia con sông"
	cont "nhỏ."
	done

Route9SignText:
	text "TUYẾN ĐƯỜNG 9"

	para "TP. CERULEAN -"
	line "ĐƯỜNG HẦM ĐÁ"
	done

Route9_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 48, 15, ROCK_TUNNEL_1F, 1

	def_coord_events

	def_bg_events
	bg_event 15,  7, BGEVENT_READ, Route9Sign
	bg_event 41, 15, BGEVENT_ITEM, Route9HiddenEther

	def_object_events
	object_event 23, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperDean, -1
	object_event 39,  8, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerHeidi, -1
	object_event 11,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerCamperSid, -1
	object_event 12, 15, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerEdna, -1
	object_event 28,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerTim, -1
	object_event 36, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerHikerSidney, -1
