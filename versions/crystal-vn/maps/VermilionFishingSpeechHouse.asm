	object_const_def
	const VERMILIONFISHINGSPEECHHOUSE_FISHING_GURU

VermilionFishingSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

FishingDude:
	jumptextfaceplayer FishingDudeText

FishingDudesHousePhoto:
	jumptext FishingDudesHousePhotoText

FishingDudesHouseBookshelf: ; unreferenced
	jumpstd PictureBookshelfScript

FishingDudeText:
	text "Ta là CẦN THỦ"
	line "bậc trưởng của"
	cont "ANH EM LÀNG CÂU."

	para "Con đã gặp NGƯ ÔNG"
	line "ở HỒ GIẬN DỮ"
	cont "chưa?"

	para "Ông ấy mơ về việc"
	line "nhìn thấy MAGIKARP"
	cont "vĩ đại nhất thế"
	cont "giới."

	para "Nếu con không ngại"
	line "hãy cho ông ấy"

	para "xem bất kỳ con"
	line "MAGIKARP nào con"
	cont "câu được."

	para "Ai biết được, con"
	line "có thể câu được"
	cont "MAGIKARP trong mơ"
	cont "của ông ấy."
	done

FishingDudesHousePhotoText:
	text "Đó là bức ảnh về"
	line "những người đang"
	cont "câu cá…"

	para "Họ đang có khoảng"
	line "thời gian tuyệt"
	cont "vời…"
	done

VermilionFishingSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 1
	warp_event  3,  7, VERMILION_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, FishingDudesHousePhoto

	def_object_events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FishingDude, -1
