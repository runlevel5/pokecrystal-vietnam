	object_const_def
	const LAKEOFRAGEHIDDENPOWERHOUSE_FISHER

LakeOfRageHiddenPowerHouse_MapScripts:
	def_scene_scripts

	def_callbacks

HiddenPowerGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM10_HIDDEN_POWER
	iftrue .AlreadyGotItem
	writetext HiddenPowerGuyText1
	promptbutton
	verbosegiveitem TM_HIDDEN_POWER
	iffalse .Done
	setevent EVENT_GOT_TM10_HIDDEN_POWER
	writetext HiddenPowerGuyText2
	waitbutton
	closetext
	end
.AlreadyGotItem:
	writetext HiddenPowerGuyText3
	waitbutton
.Done:
	closetext
	end

HiddenPowerHouseBookshelf:
	jumpstd DifficultBookshelfScript

HiddenPowerGuyText1:
	text "…Con đã đi lạc"
	line "xa…"

	para "Ở đây ta đã thiền"
	line "định. Trong ta,"

	para "một sức mạnh mới"
	line "đã được đánh thức."

	para "Để ta chia sẻ sức"
	line "mạnh của ta với"

	para "#MON của con."
	line "Nhận lấy, con ơi."
	done

HiddenPowerGuyText2:
	text "Con có thấy không?"
	line "Đó là sức mạnh ẩn!"

	para "Nó khai thác sức"
	line "mạnh của #MON"
	cont "để tấn công."

	para "Nhớ điều này: hệ"
	line "và sức mạnh của nó"
	cont "tùy thuộc vào"
	cont "#MON dùng nó."
	done

HiddenPowerGuyText3:
	text "Ta đang thiền…"
	done

LakeOfRageHiddenPowerHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAKE_OF_RAGE, 1
	warp_event  3,  7, LAKE_OF_RAGE, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, HiddenPowerHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, HiddenPowerHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HiddenPowerGuy, -1
