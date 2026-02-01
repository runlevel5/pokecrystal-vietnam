	object_const_def
	const ROUTE27SANDSTORMHOUSE_GRANNY

Route27SandstormHouse_MapScripts:
	def_scene_scripts

	def_callbacks

SandstormHouseWoman:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM37_SANDSTORM
	iftrue .AlreadyGotItem
	special GetFirstPokemonHappiness
	writetext SandstormHouseWomanText1
	promptbutton
	ifgreater 150 - 1, .Loyal
	sjump .Disloyal

.Loyal:
	writetext SandstormHouseWomanLoyalText
	promptbutton
	verbosegiveitem TM_SANDSTORM
	iffalse .Done
	setevent EVENT_GOT_TM37_SANDSTORM
.AlreadyGotItem:
	writetext SandstormHouseSandstormDescription
	waitbutton
.Done:
	closetext
	end

.Disloyal:
	writetext SandstormHouseWomanDisloyalText
	waitbutton
	closetext
	end

SandstormHouseBookshelf:
	jumpstd MagazineBookshelfScript

SandstormHouseWomanText1:
	text "Cháu đang đi đâu"
	line "với #MON?"

	para "GIẢI ĐẤU #MON?"

	para "#MON của cháu"
	line "có trung thành đủ"
	cont "để cháu thắng?"

	para "Để bà xem…"
	done

SandstormHouseWomanLoyalText:
	text "À! #MON cháu"
	line "rất tin cháu."

	para "Vui khi thấy HLV"
	line "giỏi."

	para "Của cháu đây. Quà"
	line "cho hành trình."
	done

SandstormHouseSandstormDescription:
	text "TM37 đó là"
	line "SANDSTORM."

	para "Đó là chiêu gây"
	line "sát thương cho cả"
	cont "hai bên."

	para "Chỉ dành cho HLV"
	line "cao cấp."

	para "Dùng nếu cháu dám"
	line "Chúc may mắn!"
	done

SandstormHouseWomanDisloyalText:
	text "Nếu nó không tin"
	line "tưởng cháu hơn,"

	para "sẽ khó khăn lắm"
	line "đấy."

	para "Lòng tin là dây"
	line "kết nối #MON và"
	cont "HLV."
	done

Route27SandstormHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_27, 1
	warp_event  3,  7, ROUTE_27, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, SandstormHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, SandstormHouseBookshelf

	def_object_events
	object_event  2,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SandstormHouseWoman, -1
