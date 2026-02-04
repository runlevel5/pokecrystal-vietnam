	object_const_def
	const OLIVINEGOODRODHOUSE_FISHING_GURU

OlivineGoodRodHouse_MapScripts:
	def_scene_scripts

	def_callbacks

GoodRodGuru:
	faceplayer
	opentext
	checkevent EVENT_GOT_GOOD_ROD
	iftrue .AlreadyGotItem
	writetext OfferGoodRodText
	yesorno
	iffalse .DontWantIt
	writetext GiveGoodRodText
	promptbutton
	verbosegiveitem GOOD_ROD
	writetext GaveGoodRodText
	waitbutton
	closetext
	setevent EVENT_GOT_GOOD_ROD
	end

.DontWantIt:
	writetext DontWantGoodRodText
	waitbutton
	closetext
	end

.AlreadyGotItem:
	writetext HaveGoodRodText
	waitbutton
	closetext
	end

GoodRodHouseBookshelf: ; unreferenced
	jumpstd PictureBookshelfScript

OfferGoodRodText:
	text "ASAGI ở bên"
	line "biển!"

	para "Và nếu ở bên biển"
	line "thì chắc chắn có"
	cont "cá!"

	para "Tôi câu ở đây 30"
	line "năm rồi."

	para "Bạn có muốn đối"
	line "mặt với biển và"
	cont "câu cá không?"
	done

GiveGoodRodText:
	text "Á, hahah!"
	line "Chúng ta có thợ"
	cont "câu mới rồi!"
	done

GaveGoodRodText:
	text "Cá không chỉ có"
	line "trong biển."

	para "Chúng đi đến mọi"
	line "nơi có nước."
	done

DontWantGoodRodText:
	text "Giiiì? Bạn không"
	line "thích câu cá!?"
	cont "Không hiểu nổi!"
	done

HaveGoodRodText:
	text "Thế nào?"
	line "Bắt được con to?"
	done

OlivineGoodRodHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 6
	warp_event  3,  7, OLIVINE_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoodRodGuru, -1
