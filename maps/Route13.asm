	object_const_def
	const ROUTE13_YOUNGSTER1
	const ROUTE13_YOUNGSTER2
	const ROUTE13_POKEFAN_M1
	const ROUTE13_POKEFAN_M2
	const ROUTE13_POKEFAN_M3

Route13_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerPokefanmAlex:
	trainer POKEFANM, ALEX, EVENT_BEAT_POKEFANM_ALEX, PokefanmAlexSeenText, PokefanmAlexBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmAlexAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmJoshua:
	trainer POKEFANM, JOSHUA, EVENT_BEAT_POKEFANM_JOSHUA, PokefanmJoshuaSeenText, PokefanmJoshuaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmJoshuaAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperPerry:
	trainer BIRD_KEEPER, PERRY, EVENT_BEAT_BIRD_KEEPER_PERRY, BirdKeeperPerrySeenText, BirdKeeperPerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperPerryAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperBret:
	trainer BIRD_KEEPER, BRET, EVENT_BEAT_BIRD_KEEPER_BRET, BirdKeeperBretSeenText, BirdKeeperBretBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBretAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerKenny:
	trainer HIKER, KENNY, EVENT_BEAT_HIKER_KENNY, HikerKennySeenText, HikerKennyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerKennyAfterBattleText
	waitbutton
	closetext
	end

Route13TrainerTips:
	jumptext Route13TrainerTipsText

Route13Sign:
	jumptext Route13SignText

Route13DirectionsSign:
	jumptext Route13DirectionsSignText

Route13HiddenCalcium:
	hiddenitem CALCIUM, EVENT_ROUTE_13_HIDDEN_CALCIUM

PokefanmAlexSeenText:
	text "Quỳ xuống trước"
	line "#MON hoàng gia!"
	done

PokefanmAlexBeatenText:
	text "Sao… Sao dám cười"
	line "nhạo hoàng tộc!"
	done

PokefanmAlexAfterBattleText:
	text "Mọi người đều"
	line "mơ ước trở thành"
	cont "vua, phải không?"
	done

PokefanmJoshuaSeenText:
	text "Nihihi! Muốn đấu"
	line "với băng đảng"
	cont "PIKACHU không?"
	done

PokefanmJoshuaBeatenText:
	text "PI-PIKACHU!"
	done

PokefanmJoshuaAfterBattleText:
	text "Trông bạn có nhiều"
	line "#MON,"

	para "nhưng PIKACHU vẫn"
	line "là tốt nhất."
	done

BirdKeeperPerrySeenText:
	text "Nhanh nhẹn là đặc"
	line "điểm chính của"
	cont "#MON chim."
	done

BirdKeeperPerryBeatenText:
	text "Bạn đánh bại tôi"
	line "bằng tốc độ…"
	done

BirdKeeperPerryAfterBattleText:
	text "#MON của bạn"
	line "được huấn luyện"
	cont "rất tốt."
	done

BirdKeeperBretSeenText:
	text "Hãy xem #MON"
	line "của tôi. Nhìn màu"

	para "sắc và bộ lông"
	line "của chúng."
	done

BirdKeeperBretBeatenText:
	text "Trời!"
	line "Chưa đủ tốt!"
	done

BirdKeeperBretAfterBattleText:
	text "Nếu bạn chăm sóc"
	line "chúng, #MON sẽ"
	cont "vui vẻ."
	done

HikerKennySeenText:
	text "Tôi nên đến ĐƯỜNG"
	line "HẦM ĐÁ để tìm"
	cont "ONIX."
	done

HikerKennyBeatenText:
	text "Tôi thua…"
	done

HikerKennyAfterBattleText:
	text "Đặc điểm địa chất"
	line "có vẻ không thay"
	cont "đổi."

	para "Nhưng chúng thực"
	line "sự thay đổi,"
	cont "từng chút một."
	done

Route13TrainerTipsText:
	text "MẸO HLV"

	para "Nhìn kìa! Ngay"
	line "đó, bên trái của"
	cont "cột biển."
	done

Route13SignText:
	text "TUYẾN ĐƯỜNG 13"

	para "ĐI BẮC ĐẾN"
	line "CẦU SILENCE"
	done

Route13DirectionsSignText:
	text "ĐI BẮC ĐẾN THỊ"
	line "TRẤN LAVENDER"

	para "ĐI TÂY ĐẾN"
	line "TP. FUCHSIA"
	done

Route13_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 29, 13, BGEVENT_READ, Route13TrainerTips
	bg_event 41, 11, BGEVENT_READ, Route13Sign
	bg_event 17, 13, BGEVENT_READ, Route13DirectionsSign
	bg_event 30, 13, BGEVENT_ITEM, Route13HiddenCalcium

	def_object_events
	object_event 42,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperPerry, -1
	object_event 43,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperBret, -1
	object_event 32,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmJoshua, -1
	object_event 14, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerHikerKenny, -1
	object_event 25,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanmAlex, -1
