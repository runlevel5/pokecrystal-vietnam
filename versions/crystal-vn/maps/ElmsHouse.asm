	object_const_def
	const ELMSHOUSE_ELMS_WIFE
	const ELMSHOUSE_ELMS_SON

ElmsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

ElmsWife:
	jumptextfaceplayer ElmsWifeText

ElmsSon:
	jumptextfaceplayer ElmsSonText

ElmsHousePC:
	jumptext ElmsHousePCText

ElmsHouseBookshelf:
	jumpstd DifficultBookshelfScript

ElmsWifeText:
	text "Chào, <PLAY_G>!"
	line "Chồng cô lúc nào"

	para "cũng bận--cô hy"
	line "vọng anh ấy ổn."

	para "Khi mải nghiên cứu"
	line "#MON, anh ấy"

	para "còn quên cả ăn"
	line "nữa."
	done

ElmsSonText:
	text "Khi em lớn lên, em"
	line "sẽ giúp bố!"

	para "Em sẽ trở thành"
	line "giáo sư #MON"
	cont "vĩ đại!"
	done

ElmsHouseLabFoodText: ; unreferenced
	text "Có ít thức ăn ở"
	line "đây. Chắc là cho"
	cont "phòng thí nghiệm."
	done

ElmsHousePokemonFoodText: ; unreferenced
	text "Có ít thức ăn ở"
	line "đây. Chắc là cho"
	cont "#MON."
	done

ElmsHousePCText:
	text "#MON. Chúng đến"
	line "từ đâu?"

	para "Chúng đi đâu?"

	para "Tại sao chưa ai"
	line "chứng kiến #MON"
	cont "được sinh ra?"

	para "Tôi muốn biết! Tôi"
	line "sẽ cống hiến đời"

	para "mình để nghiên"
	line "cứu #MON!"

	para "…"

	para "Đây là một phần"
	line "bài nghiên cứu"
	cont "của GS ELM."
	done

ElmsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, NEW_BARK_TOWN, 4
	warp_event  3,  7, NEW_BARK_TOWN, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, ElmsHousePC
	bg_event  6,  1, BGEVENT_READ, ElmsHouseBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsHouseBookshelf

	def_object_events
	object_event  1,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ElmsWife, -1
	object_event  5,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ElmsSon, -1
