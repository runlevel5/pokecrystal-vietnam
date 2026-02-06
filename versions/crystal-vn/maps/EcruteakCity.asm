	object_const_def
	const ECRUTEAKCITY_GRAMPS1
	const ECRUTEAKCITY_GRAMPS2
	const ECRUTEAKCITY_LASS1
	const ECRUTEAKCITY_LASS2
	const ECRUTEAKCITY_FISHER
	const ECRUTEAKCITY_YOUNGSTER
	const ECRUTEAKCITY_GRAMPS3

EcruteakCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, EcruteakCityFlypointCallback

EcruteakCityFlypointCallback:
	setflag ENGINE_FLYPOINT_ECRUTEAK
	endcallback

EcruteakCityGramps1Script:
	jumptextfaceplayer EcruteakCityGramps1Text

EcruteakCityGramps2Script:
	jumptextfaceplayer EcruteakCityGramps2Text

EcruteakCityGramps3Script:
	jumptextfaceplayer EcruteakCityGramps3Text

EcruteakCityLass1Script:
	jumptextfaceplayer EcruteakCityLass1Text

EcruteakCityLass2Script:
	faceplayer
	opentext
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue .ReleasedBeasts
	writetext EcruteakCityLass2Text
	waitbutton
	closetext
	end

.ReleasedBeasts:
	writetext EcruteakCityLass2Text_ReleasedBeasts
	waitbutton
	closetext
	end

EcruteakCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue .JasmineReturned
	writetext EcruteakCityFisherText
	waitbutton
	closetext
	end

.JasmineReturned:
	writetext EcruteakCityFisherText_JasmineReturned
	waitbutton
	closetext
	end

EcruteakCityYoungsterScript:
	jumptextfaceplayer EcruteakCityYoungsterText

EcruteakCitySign:
	jumptext EcruteakCitySignText

TinTowerSign:
	jumptext TinTowerSignText

EcruteakGymSign:
	jumptext EcruteakGymSignText

EcruteakDanceTheaterSign:
	jumptext EcruteakDanceTheaterSignText

BurnedTowerSign:
	jumptext BurnedTowerSignText

EcruteakCityPokecenterSign:
	jumpstd PokecenterSignScript

EcruteakCityMartSign:
	jumpstd MartSignScript

EcruteakCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ECRUTEAK_CITY_HIDDEN_HYPER_POTION

UnusedMissingDaughterText: ; unreferenced
	text "Ôi không. Ôi ko…"

	para "Con gái tôi mất"
	line "tích."

	para "Không… Nó không"
	line "thể đến THÁP CHÁY"
	cont "được."

	para "Tôi đã bảo nó"
	line "đừng lại gần…"

	para "Người ta dường"
	line "như biến mất ở đó"

	para "Ôi, tôi phải làm"
	line "sao đây…?"
	done

EcruteakCityGramps1Text:
	text "ECRUTEAK từng có"
	line "hai tháp:"

	para "một ở phía đông"
	line "và một phía tây."
	done

EcruteakCityGramps2Text:
	text "À, cháu bé."
	line "Cháu đã học nhảy"

	para "như các CÔ GÁI"
	line "KIMONO chưa?"

	para "Nếu cháu đến NHÀ"
	line "HÁT MÚA, một ông"

	para "già kỳ lạ sẽ cho"
	line "cháu thứ hay ho,"
	cont "nghe nói vậy."
	done

EcruteakCityLass1Text:
	text "Tôi sẽ tập luyện"
	line "ở NHÀ HÁT MÚA."

	para "Bạn có muốn đi"
	line "cùng không?"
	done

EcruteakCityLass2Text:
	text "Cái tháp từng ở"
	line "đây…"

	para "Bà tôi nói nó"
	line "từng cao hơn"
	cont "nhiều."
	done

EcruteakCityLass2Text_ReleasedBeasts:
	text "Ba #MON lớn"
	line "chạy đi các hướng"
	cont "khác nhau."
	cont "Chúng là gì vậy?"
	done

EcruteakCityFisherText:
	text "Tôi nghe tin đồn"
	line "về HẢI ĐĂNG"
	cont "OLIVINE."

	para "#MON dùng làm"
	line "đèn hiệu đã"

	para "bị ốm. Nghe như"
	line "họ đang gặp"
	cont "rắc rối."
	done

EcruteakCityFisherText_JasmineReturned:
	text "#MON ở HẢI"
	line "ĐĂNG OLIVINE đã"
	cont "được chữa khỏi."

	para "Thuyền có thể ra"
	line "khơi an toàn vào"
	cont "ban đêm lại rồi."
	done

EcruteakCityYoungsterText:
	text "Tôi nghe #MON"
	line "đang nổi loạn ở"

	para "HỒ GIẬN DỮ. Tôi"
	line "muốn xem lắm."
	done

EcruteakCityGramps3Text:
	text "Trong quá khứ xa"
	line "xưa…"

	para "Tháp này bị cháy."
	line "Ba #MON vô danh"

	para "đã chết trong"
	line "đám cháy."

	para "Một #MON màu"
	line "cầu vồng từ trên"

	para "trời bay xuống và"
	line "hồi sinh chúng…"

	para "Đó là truyền"
	line "thuyết được lưu"

	para "truyền bởi các"
	line "T.LĨNH GYM ECRU-"
	cont "TEAK."

	para "Tôi à?"

	para "Tôi từng là HLV"
	line "ngày xưa."
	cont "Hohoho!"
	done

EcruteakCitySignText:
	text "THÀNH PHỐ ECRUTEAK"
	line "Thành phố lịch sử"

	para "Nơi quá khứ gặp"
	line "hiện tại"
	done

TinTowerSignText:
	text "THÁP THIẾC"

	para "#MON huyền"
	line "thoại được cho là"
	cont "đậu ở đây."
	done

EcruteakGymSignText:
	text "TP ECRUTEAK"
	line "GYM #MON"
	cont "T.LĨNH: MORTY"

	para "Nhà tiên tri thần"
	line "bí của tương lai"
	done

EcruteakDanceTheaterSignText:
	text "NHÀ HÁT MÚA"
	line "ECRUTEAK"
	done

BurnedTowerSignText:
	text "THÁP CHÁY"

	para "Nó bị phá hủy bởi"
	line "một trận hỏa hoạn"
	cont "bí ẩn."

	para "Xin tránh xa,"
	line "vì không an toàn."
	done

EcruteakCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 35, 26, ROUTE_42_ECRUTEAK_GATE, 1
	warp_event 35, 27, ROUTE_42_ECRUTEAK_GATE, 2
	warp_event 18, 11, ECRUTEAK_TIN_TOWER_ENTRANCE, 1
	warp_event 20,  2, WISE_TRIOS_ROOM, 1
	warp_event 20,  3, WISE_TRIOS_ROOM, 2
	warp_event 23, 27, ECRUTEAK_POKECENTER_1F, 1
	warp_event  5, 21, ECRUTEAK_LUGIA_SPEECH_HOUSE, 1
	warp_event 23, 21, DANCE_THEATER, 1
	warp_event 29, 21, ECRUTEAK_MART, 2
	warp_event  6, 27, ECRUTEAK_GYM, 1
	warp_event 13, 27, ECRUTEAK_ITEMFINDER_HOUSE, 1
	warp_event 37,  7, TIN_TOWER_1F, 1
	warp_event  5,  5, BURNED_TOWER_1F, 1
	warp_event  0, 18, ROUTE_38_ECRUTEAK_GATE, 3
	warp_event  0, 19, ROUTE_38_ECRUTEAK_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 15, 21, BGEVENT_READ, EcruteakCitySign
	bg_event 38, 10, BGEVENT_READ, TinTowerSign
	bg_event  8, 28, BGEVENT_READ, EcruteakGymSign
	bg_event 21, 21, BGEVENT_READ, EcruteakDanceTheaterSign
	bg_event  2, 10, BGEVENT_READ, BurnedTowerSign
	bg_event 24, 27, BGEVENT_READ, EcruteakCityPokecenterSign
	bg_event 30, 21, BGEVENT_READ, EcruteakCityMartSign
	bg_event 23, 14, BGEVENT_ITEM, EcruteakCityHiddenHyperPotion

	def_object_events
	object_event 18, 15, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps1Script, -1
	object_event 20, 21, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps2Script, -1
	object_event 21, 29, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass1Script, -1
	object_event  3,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass2Script, -1
	object_event  9, 22, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakCityFisherScript, -1
	object_event 10, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakCityYoungsterScript, -1
	object_event  3,  7, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps3Script, EVENT_ECRUTEAK_CITY_GRAMPS
