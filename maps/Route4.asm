	object_const_def
	const ROUTE4_YOUNGSTER
	const ROUTE4_LASS1
	const ROUTE4_LASS2
	const ROUTE4_POKE_BALL

Route4_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBirdKeeperHank:
	trainer BIRD_KEEPER, HANK, EVENT_BEAT_BIRD_KEEPER_HANK, BirdKeeperHankSeenText, BirdKeeperHankBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperHankAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHope:
	trainer PICNICKER, HOPE, EVENT_BEAT_PICNICKER_HOPE, PicnickerHopeSeenText, PicnickerHopeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHopeAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerSharon:
	trainer PICNICKER, SHARON, EVENT_BEAT_PICNICKER_SHARON, PicnickerSharonSeenText, PicnickerSharonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerSharonAfterBattleText
	waitbutton
	closetext
	end

MtMoonSquareSign:
	jumptext MtMoonSquareSignText

Route4HPUp:
	itemball HP_UP

Route4HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_4_HIDDEN_ULTRA_BALL

BirdKeeperHankSeenText:
	text "Tôi đang nuôi"
	line "#MON. Muốn đấu"
	cont "với tôi không?"
	done

BirdKeeperHankBeatenText:
	text "Ack! Tôi thua…"
	done

BirdKeeperHankAfterBattleText:
	text "Nếu bạn có #MON"
	line "cụ thể muốn nuôi,"

	para "hãy cho nó ra"
	line "trước, rồi đổi"

	para "ngay lập tức."

	para "Đó là cách để"
	line "làm việc đó."
	done

PicnickerHopeSeenText:
	text "Tôi có cảm giác"
	line "mình sẽ thắng."

	para "Xem nào tôi có"
	line "đúng không!"
	done

PicnickerHopeBeatenText:
	text "Aww, bạn mạnh"
	line "quá."
	done

PicnickerHopeAfterBattleText:
	text "Tôi nghe CLEFAIRY"
	line "xuất hiện ở"
	cont "NÚI OTSUKIMI."

	para "Nhưng chúng ở đâu"
	line "nhỉ?"
	done

PicnickerSharonSeenText:
	text "Ừm…"
	line "Tôi…"
	done

PicnickerSharonBeatenText:
	text "…"
	done

PicnickerSharonAfterBattleText:
	text "…Tôi sẽ đi luyện"
	line "tập thêm…"
	done

MtMoonSquareSignText:
	text "QUẢNG TRƯỜNG"
	line "NÚI OTSUKIMI"

	para "Chỉ cần đi lên"
	line "cầu thang."
	done

Route4_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  5, MOUNT_MOON, 2

	def_coord_events

	def_bg_events
	bg_event  3,  7, BGEVENT_READ, MtMoonSquareSign
	bg_event 10,  3, BGEVENT_ITEM, Route4HiddenUltraBall

	def_object_events
	object_event 17,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperHank, -1
	object_event  9,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerPicnickerHope, -1
	object_event 21,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerPicnickerSharon, -1
	object_event 26,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route4HPUp, EVENT_ROUTE_4_HP_UP
