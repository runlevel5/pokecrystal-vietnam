	object_const_def
	const ROUTE40BATTLETOWERGATE_ROCKER
	const ROUTE40BATTLETOWERGATE_TWIN

Route40BattleTowerGate_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, RouteBattleTowerGateShowSailorCallback

RouteBattleTowerGateShowSailorCallback:
	clearevent EVENT_BATTLE_TOWER_OPEN_CIVILIANS
	endcallback

Route40BattleTowerGateRockerScript:
	jumptextfaceplayer Route40BattleTowerGateRockerText

Route40BattleTowerGateTwinScript:
	jumptextfaceplayer Route40BattleTowerGateTwinText

Route40BattleTowerGateUnusedText1: ; unreferenced
	text "Cậu đến xem THÁP"
	line "ĐẤU cũng à?"

	para "Nhưng có lẽ cậu"
	line "chưa vào được."
	done

Route40BattleTowerGateUnusedText2: ; unreferenced
	text "THÁP ĐẤU đã"
	line "mở rồi."

	para "Tôi muốn đi, nhưng"
	line "chưa nghĩ ra câu"

	para "nói hay khi thắng"
	line "cuộc."
	done

Route40BattleTowerGateRockerText:
	text "Cậu đi đến THÁP"
	line "ĐẤU à?"

	para "Đây là bí mật,"
	line "nhưng nếu thắng"

	para "nhiều lần, cậu sẽ"
	line "nhận quà đặc biệt."
	done

Route40BattleTowerGateUnusedText3: ; unreferenced
	text "Tôi sẽ huấn luyện"
	line "#MON để sẵn"

	para "sàng cho THÁP"
	line "ĐẤU."
	done

Route40BattleTowerGateTwinText:
	text "Cấp độ #MON"
	line "tôi muốn dùng"

	para "đều khác nhau."

	para "Tôi phải đi luyện"
	line "chúng ngay!"
	done

Route40BattleTowerGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, ROUTE_40, 1
	warp_event  5,  7, ROUTE_40, 1
	warp_event  4,  0, BATTLE_TOWER_OUTSIDE, 1
	warp_event  5,  0, BATTLE_TOWER_OUTSIDE, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateRockerScript, EVENT_BATTLE_TOWER_OPEN_CIVILIANS
	object_event  7,  5, SPRITE_TWIN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateTwinScript, -1
