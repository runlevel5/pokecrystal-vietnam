	object_const_def
	const ROUTE3_FISHER1
	const ROUTE3_YOUNGSTER1
	const ROUTE3_YOUNGSTER2
	const ROUTE3_FISHER2

Route3_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerFirebreatherOtis:
	trainer FIREBREATHER, OTIS, EVENT_BEAT_FIREBREATHER_OTIS, FirebreatherOtisSeenText, FirebreatherOtisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherOtisAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterWarren:
	trainer YOUNGSTER, WARREN, EVENT_BEAT_YOUNGSTER_WARREN, YoungsterWarrenSeenText, YoungsterWarrenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterWarrenAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterJimmy:
	trainer YOUNGSTER, JIMMY, EVENT_BEAT_YOUNGSTER_JIMMY, YoungsterJimmySeenText, YoungsterJimmyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterJimmyAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherBurt:
	trainer FIREBREATHER, BURT, EVENT_BEAT_FIREBREATHER_BURT, FirebreatherBurtSeenText, FirebreatherBurtBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBurtAfterBattleText
	waitbutton
	closetext
	end

Route3MtMoonSquareSign:
	jumptext Route3MtMoonSquareSignText

FirebreatherOtisSeenText:
	text "À! Thời tiết đẹp"
	line "như mọi khi."
	done

FirebreatherOtisBeatenText:
	text "Trời nắng, nhưng"
	line "tôi ướt hết…"
	done

FirebreatherOtisAfterBattleText:
	text "Khi trời mưa,"
	line "khó châm lửa…"
	done

YoungsterWarrenSeenText:
	text "Hmmm… Tôi không"
	line "biết phải làm gì…"
	done

YoungsterWarrenBeatenText:
	text "Tôi biết mình sẽ"
	line "thua…"
	done

YoungsterWarrenAfterBattleText:
	text "Bạn trông mạnh."

	para "Tôi sợ đấu với"
	line "bạn…"
	done

YoungsterJimmySeenText:
	text "Tôi chạy nhanh như"
	line "gió!"
	done

YoungsterJimmyBeatenText:
	text "Bay mất rồi!"
	done

YoungsterJimmyAfterBattleText:
	text "Tôi mặc quần đùi"
	line "quanh năm."

	para "Đó là phong cách"
	line "của tôi."
	done

FirebreatherBurtSeenText:
	text "Bước lại đây và"
	line "xem nào!"
	done

FirebreatherBurtBeatenText:
	text "Úi! Nóng quá!"
	done

FirebreatherBurtAfterBattleText:
	text "Người phun lửa vĩ"
	line "đại nhất KANTO,"
	cont "đó là tôi."

	para "Nhưng không phải"
	line "HLV giỏi nhất…"
	done

Route3MtMoonSquareSignText:
	text "QUẢNG TRƯỜNG"
	line "NÚI M.TRĂNG"

	para "Đi lên cầu thang."
	done

Route3_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 52,  1, MOUNT_MOON, 1

	def_coord_events

	def_bg_events
	bg_event 49, 13, BGEVENT_READ, Route3MtMoonSquareSign

	def_object_events
	object_event 26, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherOtis, -1
	object_event 10,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterWarren, -1
	object_event 16,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerYoungsterJimmy, -1
	object_event 49,  5, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherBurt, -1
