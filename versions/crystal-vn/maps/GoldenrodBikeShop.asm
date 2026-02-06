	object_const_def
	const GOLDENRODBIKESHOP_CLERK

GoldenrodBikeShop_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodBikeShopNoopScene: ; unreferenced
	end

GoldenrodBikeShopClerkScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BICYCLE
	iftrue .GotBicycle
	writetext GoldenrodBikeShopClerkIntroText
	yesorno
	iffalse .Refused
	writetext GoldenrodBikeShopClerkAgreedText
	promptbutton
	waitsfx
	giveitem BICYCLE
	writetext BorrowedABicycleText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setflag ENGINE_BIKE_SHOP_CALL_ENABLED
	setevent EVENT_GOT_BICYCLE
.GotBicycle:
	writetext GoldenrodBikeShopClerkFirstRateBikesText
	waitbutton
	closetext
	end

.Refused:
	writetext GoldenrodBikeShopClerkRefusedText
	waitbutton
	closetext
	end

GoldenrodBikeShopJustReleasedCompactBike: ; unreferenced
	jumptext GoldenrodBikeShopJustReleasedCompactBikeText

GoldenrodBikeShopBicycle:
	jumptext GoldenrodBikeShopBicycleText

GoldenrodBikeShopClerkIntroText:
	text "…thở dài… Tôi dọn"
	line "đến đây nhưng mà"

	para "không bán được"
	line "XE ĐẠP. Tại sao?"

	para "Bạn có thể đạp xe"
	line "và quảng cáo cho"
	cont "tôi được không?"
	done

GoldenrodBikeShopClerkAgreedText:
	text "Thật sao? Tuyệt!"

	para "Cho tôi tên và số"
	line "điện thoại của"

	para "bạn, tôi sẽ cho"
	line "bạn mượn XE ĐẠP."
	done

BorrowedABicycleText:
	text "<PLAYER> mượn một"
	line "chiếc XE ĐẠP."
	done

GoldenrodBikeShopClerkFirstRateBikesText:
	text "XE ĐẠP của tôi là"
	line "hàng đầu! Bạn có"

	para "thể đạp đi mọi"
	line "nơi."
	done

GoldenrodBikeShopClerkRefusedText:
	text "…thở dài… Ôi, tấm"
	line "lòng tốt của mọi"
	cont "người đâu…"
	done

GoldenrodBikeShopJustReleasedCompactBikeText:
	text "Vừa ra mắt!"

	para "XE ĐẠP gọn hàng"
	line "đầu!"
	done

GoldenrodBikeShopBicycleText:
	text "Một chiếc XE ĐẠP"
	line "mới bóng!"
	done

GoldenrodBikeShop_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 2
	warp_event  3,  7, GOLDENROD_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  1,  2, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  0,  3, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  1,  3, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  0,  5, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  1,  5, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  0,  6, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  1,  6, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  6,  6, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  7,  6, BGEVENT_READ, GoldenrodBikeShopBicycle

	def_object_events
	object_event  7,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodBikeShopClerkScript, -1
