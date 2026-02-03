	object_const_def
	const VIRIDIANCITY_GRAMPS1
	const VIRIDIANCITY_GRAMPS2
	const VIRIDIANCITY_FISHER
	const VIRIDIANCITY_YOUNGSTER

ViridianCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, ViridianCityFlypointCallback

ViridianCityFlypointCallback:
	setflag ENGINE_FLYPOINT_VIRIDIAN
	endcallback

ViridianCityCoffeeGramps:
	faceplayer
	opentext
	writetext ViridianCityCoffeeGrampsQuestionText
	yesorno
	iffalse .no
	writetext ViridianCityCoffeeGrampsBelievedText
	waitbutton
	closetext
	end

.no:
	writetext ViridianCityCoffeeGrampsDoubtedText
	waitbutton
	closetext
	end

ViridianCityGrampsNearGym:
	faceplayer
	opentext
	checkevent EVENT_BLUE_IN_CINNABAR
	iftrue .BlueReturned
	writetext ViridianCityGrampsNearGymText
	waitbutton
	closetext
	end

.BlueReturned:
	writetext ViridianCityGrampsNearGymBlueReturnedText
	waitbutton
	closetext
	end

ViridianCityDreamEaterFisher:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM42_DREAM_EATER
	iftrue .GotDreamEater
	writetext ViridianCityDreamEaterFisherText
	promptbutton
	verbosegiveitem TM_DREAM_EATER
	iffalse .NoRoomForDreamEater
	setevent EVENT_GOT_TM42_DREAM_EATER
.GotDreamEater:
	writetext ViridianCityDreamEaterFisherGotDreamEaterText
	waitbutton
.NoRoomForDreamEater:
	closetext
	end

ViridianCityYoungsterScript:
	jumptextfaceplayer ViridianCityYoungsterText

ViridianCitySign:
	jumptext ViridianCitySignText

ViridianGymSign:
	jumptext ViridianGymSignText

ViridianCityWelcomeSign:
	jumptext ViridianCityWelcomeSignText

TrainerHouseSign:
	jumptext TrainerHouseSignText

ViridianCityPokecenterSign:
	jumpstd PokecenterSignScript

ViridianCityMartSign:
	jumpstd MartSignScript

ViridianCityCoffeeGrampsQuestionText:
	text "Này, nhóc! Tôi"
	line "vừa uống hai ly"
	cont "cà phê đậm,"

	para "và tôi đang phấn"
	line "khích đây!"

	para "Tôi cần nói với"
	line "ai đó, nên cậu"
	cont "phải nghe vậy!"

	para "Tôi trông không"
	line "bảnh bây giờ,"

	para "nhưng tôi từng là"
	line "chuyên gia bắt"
	cont "#MON đấy."

	para "Cậu có tin không?"
	done

ViridianCityCoffeeGrampsBelievedText:
	text "Tốt, tốt. Phải,"
	line "tôi từng là người"

	para "phi thường, để"
	line "tôi kể cho nghe!"
	done

ViridianCityCoffeeGrampsDoubtedText:
	text "Cái gì? Đồ nhóc"
	line "con này!"

	para "Nếu tôi trẻ hơn"
	line "chút, tôi sẽ cho"

	para "cậu thấy một vài"
	line "điều. Hừ!"
	done

ViridianCityGrampsNearGymText:
	text "GYM này không có"
	line "TRƯỞNG cho đến"
	cont "gần đây."

	para "Một thanh niên từ"
	line "PALLET trở thành"

	para "TRƯỞNG, nhưng anh"
	line "ấy hay vắng mặt."
	done

ViridianCityGrampsNearGymBlueReturnedText:
	text "Cậu sắp đấu với"
	line "TRƯỞNG GYM sao?"

	para "Chúc cậu may mắn."
	line "Cậu sẽ cần đấy."
	done

ViridianCityDreamEaterFisherText:
	text "Ngáp!"

	para "Chắc tôi ngủ gật"
	line "dưới nắng mất."

	para "…Tôi mơ thấy"
	line "DROWZEE ăn giấc"

	para "mơ của tôi."
	line "Lạ nhỉ?"

	para "Hả?"
	line "Cái gì đây?"

	para "TM này từ đâu"
	line "ra vậy?"

	para "Ma quái quá!"
	line "Đây, cậu có thể"
	cont "có TM này."
	done

ViridianCityDreamEaterFisherGotDreamEaterText:
	text "TM42 chứa"
	line "ĂN MỘNG…"

	para "…Zzzzz…"
	done

ViridianCityYoungsterText:
	text "Tôi nghe có nhiều"
	line "vật phẩm rơi trên"

	para "mặt đất trong"
	line "VIRIDIAN FOREST."
	done

ViridianCitySignText:
	text "VIRIDIAN CITY"

	para "Thiên Đường Xanh"
	line "Mãi Mãi"
	done

ViridianGymSignText:
	text "VIRIDIAN CITY"
	line "GYM #MON"
	cont "TRƯỞNG: …"

	para "Phần còn lại của"
	line "chữ không rõ được"
	done

ViridianCityWelcomeSignText:
	text "CHÀO MỪNG ĐẾN"
	line "VIRIDIAN CITY,"

	para "CỔNG VÀO"
	line "CAO NGUYÊN INDIGO"
	done

TrainerHouseSignText:
	text "NHÀ HLV"

	para "CLB Đấu Cho"
	line "HLV Hàng Đầu"
	done

ViridianCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 32,  7, VIRIDIAN_GYM, 1
	warp_event 21,  9, VIRIDIAN_NICKNAME_SPEECH_HOUSE, 1
	warp_event 23, 15, TRAINER_HOUSE_1F, 1
	warp_event 29, 19, VIRIDIAN_MART, 2
	warp_event 23, 25, VIRIDIAN_POKECENTER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 17, 17, BGEVENT_READ, ViridianCitySign
	bg_event 27,  7, BGEVENT_READ, ViridianGymSign
	bg_event 19,  1, BGEVENT_READ, ViridianCityWelcomeSign
	bg_event 21, 15, BGEVENT_READ, TrainerHouseSign
	bg_event 24, 25, BGEVENT_READ, ViridianCityPokecenterSign
	bg_event 30, 19, BGEVENT_READ, ViridianCityMartSign

	def_object_events
	object_event 18,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianCityCoffeeGramps, -1
	object_event 30,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianCityGrampsNearGym, -1
	object_event  6, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianCityDreamEaterFisher, -1
	object_event 17, 21, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianCityYoungsterScript, -1
