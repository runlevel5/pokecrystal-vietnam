	object_const_def
	const SAFARIZONEWARDENSHOME_LASS

SafariZoneWardensHome_MapScripts:
	def_scene_scripts

	def_callbacks

WardensGranddaughter:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	iftrue .AlreadyMet
	writetext WardensGranddaughterText1
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	end
.AlreadyMet:
	writetext WardensGranddaughterText2
	waitbutton
	closetext
	end

WardenPhoto:
	jumptext WardenPhotoText

SafariZonePhoto:
	jumptext SafariZonePhotoText

WardensHomeBookshelf:
	jumpstd PictureBookshelfScript

WardensGranddaughterText1:
	text "Ông nội tôi là"
	line "QUẢN LÝ SAFARI"
	cont "ZONE."

	para "Ít nhất là trước"
	line "đây…"

	para "Ông quyết định đi"
	line "nghỉ mát và tự"

	para "bản thân bay ra"
	line "nước ngoài."

	para "Ông bỏ quản lý"
	line "KHU SAFARI ngay"
	cont "như vậy luôn."
	done

WardensGranddaughterText2:
	text "Nhiều người thất"
	line "vọng vì KHU"

	para "SAFARI đóng cửa,"
	line "nhưng Ông nội"
	cont "rất bướng bỉnh…"
	done

WardenPhotoText:
	text "Đây là ảnh của"
	line "một ông cụ đang"

	para "cười tươi được"
	line "#MON bao vây."
	done

SafariZonePhotoText:
	text "Đây là ảnh của"
	line "một đồng cỏ khổng"

	para "lồ với #MON"
	line "hiếm đang vui chơi"
	cont "trong đó."
	done

SafariZoneWardensHome_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, FUCHSIA_CITY, 6
	warp_event  3,  7, FUCHSIA_CITY, 6

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, WardensHomeBookshelf
	bg_event  1,  1, BGEVENT_READ, WardensHomeBookshelf
	bg_event  7,  0, BGEVENT_READ, WardenPhoto
	bg_event  9,  0, BGEVENT_READ, SafariZonePhoto

	def_object_events
	object_event  2,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WardensGranddaughter, -1
