	object_const_def
	const ROUTE29ROUTE46GATE_OFFICER
	const ROUTE29ROUTE46GATE_YOUNGSTER

Route29Route46Gate_MapScripts:
	def_scene_scripts

	def_callbacks

Route29Route46GateOfficerScript:
	jumptextfaceplayer Route29Route46GateOfficerText

Route29Route46GateYoungsterScript:
	jumptextfaceplayer Route29Route46GateYoungsterText

Route29Route46GateOfficerText:
	text "Bạn không thể leo"
	line "vách đá lên."

	para "Nhưng bạn có thể"
	line "nhảy xuống để"
	cont "đi tắt."
	done

Route29Route46GateYoungsterText:
	text "Nhiều loại #MON"
	line "khác nhau xuất"
	cont "hiện ở đây."

	para "Nếu muốn bắt hết"
	line "tất cả,"

	para "bạn phải tìm ở"
	line "khắp mọi nơi."
	done

Route29Route46Gate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_46, 1
	warp_event  5,  0, ROUTE_46, 2
	warp_event  4,  7, ROUTE_29, 1
	warp_event  5,  7, ROUTE_29, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route29Route46GateOfficerScript, -1
	object_event  6,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route29Route46GateYoungsterScript, -1
