	object_const_def
	const SAFFRONCITY_LASS1
	const SAFFRONCITY_POKEFAN_M
	const SAFFRONCITY_COOLTRAINER_M
	const SAFFRONCITY_COOLTRAINER_F
	const SAFFRONCITY_FISHER
	const SAFFRONCITY_YOUNGSTER1
	const SAFFRONCITY_YOUNGSTER2
	const SAFFRONCITY_LASS2

SaffronCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, SaffronCityFlypointCallback

SaffronCityFlypointCallback:
	setflag ENGINE_FLYPOINT_SAFFRON
	endcallback

SaffronCityLass1Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronCityLass1Text
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronCityLass1Text_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronCityPokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronCityPokefanMText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronCityPokefanMText_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronCityCooltrainerMScript:
	jumptextfaceplayer SaffronCityCooltrainerMText

SaffronCityCooltrainerFScript:
	jumptextfaceplayer SaffronCityCooltrainerFText

SaffronCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronCityFisherText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronCityFisherText_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronCityYoungster1Script:
	jumptextfaceplayer SaffronCityYoungster1Text

SaffronCityYoungster2Script:
	jumptextfaceplayer SaffronCityYoungster2Text

SaffronCityLass2Script:
	jumptextfaceplayer SaffronCityLass2Text

SaffronCitySign:
	jumptext SaffronCitySignText

SaffronGymSign:
	jumptext SaffronGymSignText

FightingDojoSign:
	jumptext FightingDojoSignText

SilphCoSign:
	jumptext SilphCoSignText

MrPsychicsHouseSign:
	jumptext MrPsychicsHouseSignText

SaffronCityMagnetTrainStationSign:
	jumptext SaffronCityMagnetTrainStationSignText

SaffronCityPokecenterSign:
	jumpstd PokecenterSignScript

SaffronCityMartSign:
	jumpstd MartSignScript

SaffronCityLass1Text:
	text "Có một cô bé giỏi"
	line "bắt chước người"

	para "khác sống ở đây."

	para "Cô ấy thậm chí"
	line "bắt chước người"

	para "cô đang nói chuyện"
	line "Thật khó hiểu."
	done

SaffronCityLass1Text_ReturnedMachinePart:
	text "Cô bé BẮT CHƯỚC"
	line "trông buồn."

	para "Cô ấy nói bị mất"
	line "BÚP BÊ # yêu"
	cont "thích--CLEFAIRY."
	done

SaffronCityPokefanMText:
	text "Cậu đến từ JOHTO"
	line "à?"

	para "Cậu có thể về nhà"
	line "nhanh nếu TÀU TỪ"
	cont "TRƯỜNG chạy."
	done

SaffronCityPokefanMText_ReturnedMachinePart:
	text "Cậu đến từ JOHTO"
	line "à?"

	para "Cậu có thể về nhà"
	line "nhanh bằng TÀU"
	cont "TỪ TRƯỜNG."
	done

SaffronCityCooltrainerMText:
	text "Tôi đến GYM, háo"
	line "hức muốn đấu với"
	cont "các HLV…"

	para "Hóa ra tôi lạc"
	line "vào GYM bỏ hoang"

	para "bên cạnh."

	para "Trời, tôi xấu hổ"
	line "quá."
	done

SaffronCityCooltrainerFText:
	text "Đây là SILPH CO.,"
	line "nổi tiếng về hàng"
	cont "hóa #MON."

	para "Trước đây, TEAM"
	line "ROCKET muốn chiếm"

	para "công ty vì lý do"
	line "đó."
	done

SaffronCityFisherText:
	text "Nhai… Nhai…"

	para "Tôi nghe có rắc"
	line "rối lớn đang xảy"
	cont "ra ở NHÀ MÁY ĐIỆN."

	para "Nhai… Nhai…"
	done

SaffronCityFisherText_ReturnedMachinePart:
	text "Nhai… Nhai…"

	para "Tôi nghe có rắc"
	line "rối lớn ở NHÀ MÁY"
	cont "ĐIỆN."

	para "Nhai… Nhai…"
	line "Haaah, no rồi!"
	done

SaffronCityYoungster1Text:
	text "Đi vào hẻm lần"
	line "đầu làm tôi hơi"

	para "lo lắng."
	done

SaffronCityYoungster2Text:
	text "Có nơi gọi là NHÀ"
	line "HLV ở VIRIDIAN"

	para "nơi các HLV từ"
	line "khắp nơi tụ tập."
	done

SaffronCityLass2Text:
	text "TP của chúng tôi"
	line "được lên chương"
	cont "trình radio."

	para "Thật vui khi nghe"
	line "người ta khen TP"

	para "mình, nhưng cũng"
	line "hơi ngại."
	done

SaffronCitySignText:
	text "TP. SAFFRON"

	para "Vùng Đất Thương"
	line "Mại Vàng Rực"
	done

SaffronGymSignText:
	text "TP. SAFFRON"
	line "GYM #MON"
	cont "TRƯỞNG: SABRINA"

	para "Bậc Thầy #MON"
	line "Ngoại Cảm!"
	done

FightingDojoSignText:
	text "Chào Mừng Mọi"
	line "Người! VÕ ĐƯỜNG"
	done

SilphCoSignText:
	text "TÒA NHÀ VĂN PHÒNG"
	line "SILPH CO."
	done

MrPsychicsHouseSignText:
	text "NHÀ CỦA"
	line "ÔNG NGOẠI CẢM"
	done

SaffronCityMagnetTrainStationSignText:
	text "GA TÀU TỪ TRƯỜNG"
	line "TP. SAFFRON"
	done

SaffronCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 26,  3, FIGHTING_DOJO, 1
	warp_event 34,  3, SAFFRON_GYM, 1
	warp_event 25, 11, SAFFRON_MART, 2
	warp_event  9, 29, SAFFRON_POKECENTER_1F, 1
	warp_event 27, 29, MR_PSYCHICS_HOUSE, 1
	warp_event  8,  3, SAFFRON_MAGNET_TRAIN_STATION, 2
	warp_event 18, 21, SILPH_CO_1F, 1
	warp_event  9, 11, COPYCATS_HOUSE_1F, 1
	warp_event 18,  3, ROUTE_5_SAFFRON_GATE, 3
	warp_event  0, 24, ROUTE_7_SAFFRON_GATE, 3
	warp_event  0, 25, ROUTE_7_SAFFRON_GATE, 4
	warp_event 16, 33, ROUTE_6_SAFFRON_GATE, 1
	warp_event 17, 33, ROUTE_6_SAFFRON_GATE, 2
	warp_event 39, 22, ROUTE_8_SAFFRON_GATE, 1
	warp_event 39, 23, ROUTE_8_SAFFRON_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 21,  5, BGEVENT_READ, SaffronCitySign
	bg_event 33,  5, BGEVENT_READ, SaffronGymSign
	bg_event 25,  5, BGEVENT_READ, FightingDojoSign
	bg_event 15, 21, BGEVENT_READ, SilphCoSign
	bg_event 25, 29, BGEVENT_READ, MrPsychicsHouseSign
	bg_event 11,  5, BGEVENT_READ, SaffronCityMagnetTrainStationSign
	bg_event 10, 29, BGEVENT_READ, SaffronCityPokecenterSign
	bg_event 26, 11, BGEVENT_READ, SaffronCityMartSign

	def_object_events
	object_event  7, 14, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityLass1Script, -1
	object_event 19, 30, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SaffronCityPokefanMScript, -1
	object_event 32,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityCooltrainerMScript, -1
	object_event 20, 24, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityCooltrainerFScript, -1
	object_event 27, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityFisherScript, -1
	object_event 15, 19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronCityYoungster1Script, -1
	object_event 35, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityYoungster2Script, -1
	object_event 19,  8, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityLass2Script, -1
