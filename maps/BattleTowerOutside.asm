	object_const_def
	const BATTLETOWEROUTSIDE_STANDING_YOUNGSTER
	const BATTLETOWEROUTSIDE_BEAUTY
	const BATTLETOWEROUTSIDE_SAILOR
	const BATTLETOWEROUTSIDE_LASS

BattleTowerOutside_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, BattleTowerOutsideNoopCallback
	callback MAPCALLBACK_OBJECTS, BattleTowerOutsideShowCiviliansCallback

BattleTowerOutsideNoopCallback:
	endcallback

BattleTowerOutsideShowCiviliansCallback:
	clearevent EVENT_BATTLE_TOWER_OPEN_CIVILIANS
	endcallback

BattleTowerOutsideYoungsterScript:
	jumptextfaceplayer BattleTowerOutsideYoungsterText

BattleTowerOutsideBeautyScript:
	jumptextfaceplayer BattleTowerOutsideBeautyText

BattleTowerOutsideSailorScript:
	jumptextfaceplayer BattleTowerOutsideSailorText

BattleTowerOutsideSign:
	jumptext BattleTowerOutsideSignText

BattleTowerOutsideYoungsterText_NotYetOpen: ; unreferenced
	text "Ôi, THÁP ĐẤU thật"
	line "to lớn! Cổ tôi"

	para "mỏi vì cứ ngước"
	line "lên nhìn nó."
	done

BattleTowerOutsideYoungsterText_Mobile: ; unreferenced
	text "Ôi, THÁP ĐẤU thật"
	line "to lớn!"

	para "Vì có rất nhiều"
	line "HLV bên trong,"

	para "nên chắc cũng có"
	line "rất nhiều loại"

	para "#MON khác nhau"
	line "ở đây."
	done

BattleTowerOutsideYoungsterText:
	text "Ôi, THÁP ĐẤU thật"
	line "to lớn!"

	para "Chắc có nhiều loại"
	line "#MON khác nhau"
	cont "ở đó!"
	done

BattleTowerOutsideBeautyText_NotYetOpen: ; unreferenced
	text "Họ làm gì ở đây"
	line "nhỉ?"

	para "Nếu cái tên nói"
	line "lên điều gì, tôi"

	para "đoán là phải là"
	line "để đấu #MON."
	done

BattleTowerOutsideBeautyText:
	text "Chỉ dùng được ba"
	line "#MON thôi."

	para "Thật khó để quyết"
	line "định ba con nào"

	para "nên tham gia"
	line "trận đấu…"
	done

BattleTowerOutsideSailorText_Mobile: ; unreferenced
	text "Hehehe…"
	line "Tôi lén ra khỏi"
	cont "công việc để đến"

	para "Tôi sẽ không từ"
	line "bỏ cho đến khi"
	cont "trở thành THỦLĨNH"
	done

BattleTowerOutsideSailorText:
	text "Hehehe, tôi trốn"
	line "việc đến đây."

	para "Không thể bỏ về"
	line "cho đến khi thắng"

	para "Tôi phải thắng tất"
	line "cả. Nhất định!"
	done

BattleTowerOutsideSignText_NotYetOpen: ; unreferenced
; originally shown when the Battle Tower was closed
	text "THÁP ĐẤU"
	done

BattleTowerOutsideSignText:
	text "THÁP ĐẤU"

	para "Thử thách HLV"
	line "tối thượng!"
	done

BattleTowerOutsideText_DoorsClosed: ; unreferenced
; originally shown when the Battle Tower was closed
	text "Cửa THÁP ĐẤU"
	line "đóng rồi…"
	done

BattleTowerOutsideText_DoorsOpen: ; unreferenced
; originally shown after the Battle Tower opened
	text "Mở cửa rồi!"
	done

BattleTowerOutside_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 21, ROUTE_40_BATTLE_TOWER_GATE, 3
	warp_event  9, 21, ROUTE_40_BATTLE_TOWER_GATE, 4
	warp_event  8,  9, BATTLE_TOWER_1F, 1
	warp_event  9,  9, BATTLE_TOWER_1F, 2

	def_coord_events

	def_bg_events
	bg_event 10, 10, BGEVENT_READ, BattleTowerOutsideSign

	def_object_events
	object_event  6, 12, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideYoungsterScript, -1
	object_event 13, 11, SPRITE_BEAUTY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideBeautyScript, -1
	object_event 12, 18, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideSailorScript, EVENT_BATTLE_TOWER_OPEN_CIVILIANS
	object_event 12, 24, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
