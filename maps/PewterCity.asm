	object_const_def
	const PEWTERCITY_COOLTRAINER_F
	const PEWTERCITY_BUG_CATCHER
	const PEWTERCITY_GRAMPS
	const PEWTERCITY_FRUIT_TREE1
	const PEWTERCITY_FRUIT_TREE2

PewterCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PewterCityFlypointCallback

PewterCityFlypointCallback:
	setflag ENGINE_FLYPOINT_PEWTER
	endcallback

PewterCityCooltrainerFScript:
	jumptextfaceplayer PewterCityCooltrainerFText

PewterCityBugCatcherScript:
	jumptextfaceplayer PewterCityBugCatcherText

PewterCityGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SILVER_WING
	iftrue .GotSilverWing
	writetext PewterCityGrampsText
	promptbutton
	verbosegiveitem SILVER_WING
	setevent EVENT_GOT_SILVER_WING
	closetext
	end

.GotSilverWing:
	writetext PewterCityGrampsText_GotSilverWing
	waitbutton
	closetext
	end

PewterCitySign:
	jumptext PewterCitySignText

PewterGymSign:
	jumptext PewterGymSignText

PewterMuseumSign:
	jumptext PewterMuseumSignText

PewterCityMtMoonGiftShopSign:
	jumptext PewterCityMtMoonGiftShopSignText

PewterCityWelcomeSign:
	jumptext PewterCityWelcomeSignText

PewterCityPokecenterSign:
	jumpstd PokecenterSignScript

PewterCityMartSign:
	jumpstd MartSignScript

PewterCityFruitTree1:
	fruittree FRUITTREE_PEWTER_CITY_1

PewterCityFruitTree2:
	fruittree FRUITTREE_PEWTER_CITY_2

PewterCityCooltrainerFText:
	text "Cậu đã ghé thăm"
	line "GYM PEWTER chưa?"

	para "TRƯỞNG dùng"
	line "#MON hệ Đá."
	done

PewterCityBugCatcherText:
	text "Ban đêm, CLEFAIRY"
	line "ra chơi ở MT.MOON."

	para "Nhưng không phải"
	line "đêm nào cũng thế."
	done

PewterCityGrampsText:
	text "À, cậu đã đến tận"
	line "đây từ JOHTO à?"

	para "Gợi lại ký ức xưa."
	line "Khi tôi còn trẻ,"

	para "tôi đến JOHTO để"
	line "tập luyện."

	para "Cậu làm tôi nhớ"
	line "lại chính mình"

	para "khi còn là thanh"
	line "niên."

	para "Đây. Tôi muốn tặng"
	line "cậu vật phẩm tôi"
	cont "tìm được ở JOHTO."
	done

PewterCityGrampsText_GotSilverWing:
	text "Đến những nơi mới"
	line "lạ và gặp gỡ"
	cont "người mới…"

	para "Đó là niềm vui"
	line "của du lịch."
	done

PewterCitySignText:
	text "PEWTER CITY"
	line "TP Màu Xám Đá"
	done

PewterGymSignText:
	text "PEWTER CITY"
	line "GYM #MON"
	cont "TRƯỞNG: BROCK"

	para "HLV #MON"
	line "Vững Như Đá"
	done

PewterMuseumSignText:
	text "Có thông báo"
	line "ở đây…"

	para "BẢO TÀNG KHOA HỌC"
	line "PEWTER đang đóng"
	cont "cửa tu sửa…"
	done

PewterCityMtMoonGiftShopSignText:
	text "Có thông báo"
	line "ở đây…"

	para "CỬA HÀNG QUÀ"
	line "MT.MOON ĐÃ MỞ!"
	done

PewterCityWelcomeSignText:
	text "CHÀO MỪNG ĐẾN"
	line "PEWTER CITY!"
	done

PewterCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 29, 13, PEWTER_NIDORAN_SPEECH_HOUSE, 1
	warp_event 16, 17, PEWTER_GYM, 1
	warp_event 23, 17, PEWTER_MART, 2
	warp_event 13, 25, PEWTER_POKECENTER_1F, 1
	warp_event  7, 29, PEWTER_SNOOZE_SPEECH_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 25, 23, BGEVENT_READ, PewterCitySign
	bg_event 11, 17, BGEVENT_READ, PewterGymSign
	bg_event 15,  9, BGEVENT_READ, PewterMuseumSign
	bg_event 33, 19, BGEVENT_READ, PewterCityMtMoonGiftShopSign
	bg_event 19, 29, BGEVENT_READ, PewterCityWelcomeSign
	bg_event 14, 25, BGEVENT_READ, PewterCityPokecenterSign
	bg_event 24, 17, BGEVENT_READ, PewterCityMartSign

	def_object_events
	object_event 19, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterCityCooltrainerFScript, -1
	object_event 14, 29, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterCityBugCatcherScript, -1
	object_event 29, 17, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterCityGrampsScript, -1
	object_event 32,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityFruitTree1, -1
	object_event 30,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityFruitTree2, -1
