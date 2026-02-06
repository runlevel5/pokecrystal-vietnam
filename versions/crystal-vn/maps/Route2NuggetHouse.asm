	object_const_def
	const ROUTE2NUGGETHOUSE_FISHER

Route2NuggetHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route2NuggetHouseFisherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_NUGGET_FROM_GUY
	iftrue .GotNugget
	writetext Route2NuggetHouseFisherText
	promptbutton
	verbosegiveitem NUGGET
	iffalse .NoRoom
	setevent EVENT_GOT_NUGGET_FROM_GUY
.GotNugget:
	writetext Route2NuggetHouseFisherText_GotNugget
	waitbutton
.NoRoom:
	closetext
	end

Route2NuggetHouseBookshelf: ; unreferenced
	jumpstd DifficultBookshelfScript

Route2NuggetHouseFisherText:
	text "Chào! Wow, tôi"
	line "vui lắm khi gặp"
	cont "bạn."

	para "Bạn là khách đầu"
	line "tiên sau rất lâu"
	cont "rồi."

	para "Tôi vui quá!"
	line "Để tôi tặng bạn"
	cont "món quà nhỏ này."
	done

Route2NuggetHouseFisherText_GotNugget:
	text "Đây là CỤC VÀNG."

	para "Tôi không thể"
	line "đưa cho bạn lời"

	para "khuyên quý báu,"
	line "nên đây là tất"
	cont "cả tôi có!"
	done

Route2NuggetHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_2, 1
	warp_event  3,  7, ROUTE_2, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route2NuggetHouseFisherScript, -1
