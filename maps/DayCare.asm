	object_const_def
	const DAYCARE_GRAMPS
	const DAYCARE_GRANNY

DayCare_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, DayCareEggCheckCallback

DayCareEggCheckCallback:
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .PutDayCareManOutside
	clearevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	setevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	endcallback

.PutDayCareManOutside:
	setevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	clearevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	endcallback

DayCareManScript_Inside:
	faceplayer
	opentext
	checkevent EVENT_GOT_ODD_EGG
	iftrue .AlreadyHaveOddEgg
	writetext DayCareManText_GiveOddEgg
	promptbutton
	closetext
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	special GiveOddEgg
	opentext
	writetext DayCareText_GotOddEgg
	playsound SFX_KEY_ITEM
	waitsfx
	writetext DayCareText_DescribeOddEgg
	waitbutton
	closetext
	setevent EVENT_GOT_ODD_EGG
	end

.PartyFull:
	opentext
	writetext DayCareText_PartyFull
	waitbutton
	closetext
	end

.AlreadyHaveOddEgg:
	special DayCareMan
	waitbutton
	closetext
	end

DayCareLadyScript:
	faceplayer
	opentext
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .HusbandWasLookingForYou
	special DayCareLady
	waitbutton
	closetext
	end

.HusbandWasLookingForYou:
	writetext Text_GrampsLookingForYou
	waitbutton
	closetext
	end

DayCareBookshelf:
	jumpstd DifficultBookshelfScript

Text_GrampsLookingForYou:
	text "Ông ấy đang tìm"
	line "cháu."
	done

Text_DayCareManTalksAboutEggTicket: ; unreferenced
	text "Tôi là ÔNG GIỮ"
	line "TRẺ."

	para "Có một thứ mới ở"
	line "TP.GOLDENROD"

	para "tên là QUẦY"
	line "TRAO ĐỔI."

	para "Tôi được cho một"
	line "VÉ TRỨNG có thể"

	para "đổi lấy"
	line "TRỨNG LẠ."

	para "Nhưng chúng tôi"
	line "điều hành chỗ"

	para "GIỮ TRẺ, nên"
	line "không cần nó."

	para "Bạn cứ lấy"
	line "đi nhé."
	done

DayCareManText_GiveOddEgg:
	text "Tôi là ÔNG GIỮ"
	line "TRẺ."

	para "Cháu có biết về"
	line "TRỨNG không?"

	para "Tôi đang nuôi"
	line "#MON cùng vợ."

	para "Chúng tôi sửng"
	line "sốt thấy TRỨNG!"

	para "Thật không thể"
	line "tin được!"

	para "Cháu có muốn lấy"
	line "TRỨNG này không?"

	para "Được! Cháu giữ"
	line "nó nhé!"
	done

DayCareText_ComeAgain: ; unreferenced
	text "Quay lại nhé."
	done

DayCareText_GotOddEgg:
	text "<PLAYER> nhận"
	line "TRỨNG LẠ!"
	done

DayCareText_DescribeOddEgg:
	text "Tôi tìm thấy nó"
	line "khi đang chăm sóc"

	para "#MON của người"
	line "khác trước đây."

	para "Nhưng HLV đó"
	line "không muốn TRỨNG,"

	para "nên tôi cứ giữ"
	line "nó thôi."
	done

DayCareText_PartyFull:
	text "Cháu không còn"
	line "chỗ cho nó."
	done

DayCare_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  5, ROUTE_34, 3
	warp_event  0,  6, ROUTE_34, 4
	warp_event  2,  7, ROUTE_34, 5
	warp_event  3,  7, ROUTE_34, 5

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, DayCareBookshelf
	bg_event  1,  1, BGEVENT_READ, DayCareBookshelf

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareManScript_Inside, EVENT_DAY_CARE_MAN_IN_DAY_CARE
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DayCareLadyScript, -1
