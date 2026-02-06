	object_const_def
	const DAYOFWEEKSIBLINGSHOUSE_POKEDEX

DayOfWeekSiblingsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

DayOfWeekSiblingsHousePokedexScript:
	opentext
	writetext DayOfWeekSiblingsHousePokedexText1
	yesorno
	iffalse .End
	writetext DayOfWeekSiblingsHousePokedexText2
	yesorno
	iffalse .End
	writetext DayOfWeekSiblingsHousePokedexText3
	waitbutton
.End:
	closetext
	end

DayOfWeekSiblingsHousePokedexText1:
	text "Có thứ gì đó"
	line "viết ở đây."

	para "Đọc không?"
	done

DayOfWeekSiblingsHousePokedexText2:
	text "Gửi các anh chị"
	line "em của mình:"

	para "Chúng ta tự hào"
	line "phục vụ các HLV"
	cont "#MON."

	para "Khi HLV nói với"
	line "bạn, hãy tặng họ"
	cont "thứ gì hữu ích."

	para "Yêu thương,"
	line "MONICA"

	para "Đọc tiếp không?"
	done

DayOfWeekSiblingsHousePokedexText3:
	text "T2, MONICA"
	line "TUYẾN ĐƯỜNG 40"

	para "T3, TUSCANY"
	line "TUYẾN ĐƯỜNG 29"

	para "T4, WESLEY"
	line "HỒ GIẬN DỮ"

	para "T5, ARTHUR"
	line "TUYẾN ĐƯỜNG 36"

	para "T6, FRIEDA"
	line "TUYẾN ĐƯỜNG 32"

	para "T7, SANTOS"
	line "TP. BLACKTHORN"

	para "CN, SUNNY"
	line "TUYẾN ĐƯỜNG 37"
	done

DayOfWeekSiblingsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_26, 3
	warp_event  3,  7, ROUTE_26, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayOfWeekSiblingsHousePokedexScript, -1
