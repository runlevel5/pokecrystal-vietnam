	object_const_def
	const ROUTE12_FISHER1
	const ROUTE12_FISHER2
	const ROUTE12_FISHER3
	const ROUTE12_FISHER4
	const ROUTE12_POKE_BALL1
	const ROUTE12_POKE_BALL2

Route12_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerFisherKyle:
	trainer FISHER, KYLE, EVENT_BEAT_FISHER_KYLE, FisherKyleSeenText, FisherKyleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherKyleAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMartin:
	trainer FISHER, MARTIN, EVENT_BEAT_FISHER_MARTIN, FisherMartinSeenText, FisherMartinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMartinAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherStephen:
	trainer FISHER, STEPHEN, EVENT_BEAT_FISHER_STEPHEN, FisherStephenSeenText, FisherStephenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherStephenAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherBarney:
	trainer FISHER, BARNEY, EVENT_BEAT_FISHER_BARNEY, FisherBarneySeenText, FisherBarneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherBarneyAfterBattleText
	waitbutton
	closetext
	end

Route12Sign:
	jumptext Route12SignText

FishingSpotSign:
	jumptext FishingSpotSignText

Route12Calcium:
	itemball CALCIUM

Route12Nugget:
	itemball NUGGET

Route12HiddenElixer:
	hiddenitem ELIXER, EVENT_ROUTE_12_HIDDEN_ELIXER

FisherMartinSeenText:
	text "Kiên nhẫn là chìa"
	line "khóa cho cả câu"
	cont "cá và #MON."
	done

FisherMartinBeatenText:
	text "Gwaaa!"
	done

FisherMartinAfterBattleText:
	text "Tôi quá thiếu"
	line "kiên nhẫn để câu"
	cont "cá…"
	done

FisherStephenSeenText:
	text "Tôi thấy rất hài"
	line "lòng khi câu cá và"
	cont "nghe nhạc trên"
	cont "radio."
	done

FisherStephenBeatenText:
	text "Radio ngốc của tôi"
	line "làm tôi mất tập"
	cont "trung!"
	done

FisherStephenAfterBattleText:
	text "Bạn đã xem chương"
	line "trình radio KANTO"

	para "chưa? Chúng ta có"
	line "nhiều loại ở đây."
	done

FisherBarneySeenText:
	text "Điều quan trọng"
	line "nhất trong cuộc"
	cont "sống hàng ngày là"
	cont "gì?"
	done

FisherBarneyBeatenText:
	text "Câu trả lời sắp"
	line "được tiết lộ!"
	done

FisherBarneyAfterBattleText:
	text "Tôi nghĩ điện là"
	line "thứ quan trọng"

	para "nhất trong cuộc"
	line "sống hàng ngày."

	para "Nếu không, mọi"
	line "người đã không"

	para "làm ồn ào đến vậy"
	line "khi NHÀ MÁY ĐIỆN"

	para "ngừng hoạt động."
	done

FisherKyleSeenText:
	text "Bạn có nhớ không?"
	done

FisherKyleBeatenText:
	text "Bạn có nhớ chứ?"
	done

FisherKyleAfterBattleText:
	text "Cảm giác kéo trên"
	line "CẦN CÂU khi bạn"

	para "câu được #MON…"

	para "Đó là cảm giác"
	line "tuyệt nhất đối"
	cont "với thợ câu như"
	cont "tôi."
	done

Route12SignText:
	text "TUYẾN ĐƯỜNG 12"

	para "BẮC ĐẾN THỊ TRẤN"
	line "LAVENDER"
	done

FishingSpotSignText:
	text "ĐỊA ĐIỂM CÂU CÁ"
	done

Route12_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 33, ROUTE_12_SUPER_ROD_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 11, 27, BGEVENT_READ, Route12Sign
	bg_event 13,  9, BGEVENT_READ, FishingSpotSign
	bg_event 14, 13, BGEVENT_ITEM, Route12HiddenElixer

	def_object_events
	object_event  5, 13, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherMartin, -1
	object_event 14, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherStephen, -1
	object_event 10, 38, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerFisherBarney, -1
	object_event  6,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherKyle, -1
	object_event  5, 43, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route12Calcium, EVENT_ROUTE_12_CALCIUM
	object_event  5, 51, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route12Nugget, EVENT_ROUTE_12_NUGGET
