	object_const_def
	const BLACKTHORNCITY_SUPER_NERD1
	const BLACKTHORNCITY_SUPER_NERD2
	const BLACKTHORNCITY_GRAMPS1
	const BLACKTHORNCITY_GRAMPS2
	const BLACKTHORNCITY_BLACK_BELT
	const BLACKTHORNCITY_COOLTRAINER_F1
	const BLACKTHORNCITY_YOUNGSTER1
	const BLACKTHORNCITY_SANTOS
	const BLACKTHORNCITY_COOLTRAINER_F2

BlackthornCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, BlackthornCityFlypointCallback
	callback MAPCALLBACK_OBJECTS, BlackthornCitySantosCallback

BlackthornCityFlypointCallback:
	setflag ENGINE_FLYPOINT_BLACKTHORN
	endcallback

BlackthornCitySantosCallback:
	readvar VAR_WEEKDAY
	ifequal SATURDAY, .SantosAppears
	disappear BLACKTHORNCITY_SANTOS
	endcallback

.SantosAppears:
	appear BLACKTHORNCITY_SANTOS
	endcallback

BlackthornSuperNerdScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CLAIR
	iftrue .BeatClair
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetext Text_ClairIsOut
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext Text_ClairIsIn
	waitbutton
	closetext
	end

.BeatClair:
	writetext Text_ClairIsBeaten
	waitbutton
	closetext
	end

BlackthornGramps1Script:
	jumptextfaceplayer BlackthornGrampsRefusesEntryText

BlackthornGramps2Script:
	jumptextfaceplayer BlackthornGrampsGrantsEntryText

BlackthornBlackBeltScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetext BlackBeltText_WeirdRadio
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext BlackBeltText_VoicesInMyHead
	waitbutton
	closetext
	end

BlackthornCooltrainerF1Script:
	jumptextfaceplayer BlackthornCooltrainerF1Text

BlackthornYoungsterScript:
	jumptextfaceplayer BlackthornYoungsterText

BlackthornCooltrainerF2Script:
	jumptextfaceplayer BlackthornCooltrainerF2Text

SantosScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	iftrue .Saturday
	readvar VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checkevent EVENT_MET_SANTOS_OF_SATURDAY
	iftrue .MetSantos
	writetext MeetSantosText
	promptbutton
	setevent EVENT_MET_SANTOS_OF_SATURDAY
.MetSantos:
	writetext SantosGivesGiftText
	promptbutton
	verbosegiveitem SPELL_TAG
	iffalse .Done
	setevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	writetext SantosGaveGiftText
	waitbutton
	closetext
	end

.Saturday:
	writetext SantosSaturdayText
	waitbutton
.Done:
	closetext
	end

.NotSaturday:
	writetext SantosNotSaturdayText
	waitbutton
	closetext
	end

BlackthornCitySign:
	jumptext BlackthornCitySignText

BlackthornGymSign:
	jumptext BlackthornGymSignText

MoveDeletersHouseSign:
	jumptext MoveDeletersHouseSignText

DragonDensSign:
	jumptext DragonDensSignText

BlackthornCityTrainerTips:
	jumptext BlackthornCityTrainerTipsText

BlackthornCityPokecenterSign:
	jumpstd PokecenterSignScript

BlackthornCityMartSign:
	jumpstd MartSignScript

Text_ClairIsOut:
	text "Tôi xin lỗi."

	para "CLAIR, TRƯỞNG GYM"
	line "của chúng tôi,"

	para "đã vào HANG RỒNG"
	line "sau GYM rồi."

	para "Tôi không biết"
	line "khi nào TRƯỞNG"
	cont "mới về."
	done

Text_ClairIsIn:
	text "CLAIR, TRƯỞNG GYM"
	line "đang đợi cậu."

	para "Nhưng mà, với một"
	line "HLV tầm thường"

	para "thì không thể"
	line "thắng được đâu."
	done

Text_ClairIsBeaten:
	text "Cậu thắng được"
	line "CLAIR sao?"

	para "Tuyệt vời quá!"

	para "Tôi chưa nghe cô"
	line "ấy thua ai khác"

	para "ngoài LANCE cả."
	done

BlackthornGrampsRefusesEntryText:
	text "Không. Chỉ những"
	line "HLV được chọn mới"

	para "được tập ở đây."
	line "Xin hãy rời đi."
	done

BlackthornGrampsGrantsEntryText:
	text "Nếu CLAIR cho"
	line "phép, thì ông cô"
	cont "ấy--SƯ PHỤ chúng"
	cont "tôi--cũng vậy."

	para "Cậu có thể vào."
	done

BlackBeltText_WeirdRadio:
	text "Radio tôi hỏng à?"
	line "Dạo này chỉ bắt"
	cont "được tín hiệu lạ."
	done

BlackBeltText_VoicesInMyHead:
	text "Arooo! Có tiếng"
	line "trong đầu tôi!"

	para "Hả? Tôi đang nghe"
	line "radio mà!"
	done

BlackthornCooltrainerF1Text:
	text "Cậu định cho"
	line "#MON quên bớt"
	cont "chiêu thức à?"
	done

BlackthornYoungsterText:
	text "Bậc thầy Rồng đều"
	line "đến từ thành phố"
	cont "FUSUBE này."
	done

MeetSantosText:
	text "SANTOS: …"

	para "Hôm nay Thứ Bảy…"

	para "Tôi là SANTOS"
	line "của Thứ Bảy…"
	done

SantosGivesGiftText:
	text "Cậu có thể có…"
	done

SantosGaveGiftText:
	text "SANTOS: …"

	para "THẺ BÙA…"

	para "Chiêu hệ Ma sẽ"
	line "mạnh hơn…"

	para "Nó sẽ làm cậu"
	line "sợ hãi…"
	done

SantosSaturdayText:
	text "SANTOS: …"

	para "Hẹn gặp lại vào"
	line "Thứ Bảy khác…"

	para "Tôi sẽ không còn"
	line "quà nữa đâu…"
	done

SantosNotSaturdayText:
	text "SANTOS: Hôm nay"
	line "không phải T.Bảy…"
	done

BlackthornCooltrainerF2Text:
	text "Ồ, cậu đã đi qua"
	line "ĐƯỜNG BĂNG sao?"

	para "Cậu đúng là HLV"
	line "cừ khôi thật đấy!"
	done

BlackthornCitySignText:
	text "THÀNH PHỐ FUSUBE"

	para "Nơi Ẩn Dật Yên"
	line "Tĩnh Trên Núi"
	done

BlackthornGymSignText:
	text "TP. FUSUBE"
	line "GYM #MON"
	cont "TRƯỞNG: CLAIR"

	para "Người Sử Dụng"
	line "#MON Rồng"
	done

MoveDeletersHouseSignText:
	text "NHÀ NGƯỜI XÓA"
	line "CHIÊU THỨC"
	done

DragonDensSignText:
	text "HANG RỒNG"
	line "PHÍA TRƯỚC"
	done

BlackthornCityTrainerTipsText:
	text "MẸO CHO HLV"

	para "#MON cầm"
	line "THÁNH QUẢ"

	para "sẽ tự chữa mọi"
	line "vấn đề trạng"
	cont "thái."
	done

BlackthornCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 18, 11, BLACKTHORN_GYM_1F, 1
	warp_event 13, 21, BLACKTHORN_DRAGON_SPEECH_HOUSE, 1
	warp_event 29, 23, BLACKTHORN_EMYS_HOUSE, 1
	warp_event 15, 29, BLACKTHORN_MART, 2
	warp_event 21, 29, BLACKTHORN_POKECENTER_1F, 1
	warp_event  9, 31, MOVE_DELETERS_HOUSE, 1
	warp_event 36,  9, ICE_PATH_1F, 2
	warp_event 20,  1, DRAGONS_DEN_1F, 1

	def_coord_events

	def_bg_events
	bg_event 34, 24, BGEVENT_READ, BlackthornCitySign
	bg_event 17, 13, BGEVENT_READ, BlackthornGymSign
	bg_event  7, 31, BGEVENT_READ, MoveDeletersHouseSign
	bg_event 21,  3, BGEVENT_READ, DragonDensSign
	bg_event  5, 25, BGEVENT_READ, BlackthornCityTrainerTips
	bg_event 16, 29, BGEVENT_READ, BlackthornCityMartSign
	bg_event 22, 29, BGEVENT_READ, BlackthornCityPokecenterSign

	def_object_events
	object_event 18, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornSuperNerdScript, EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	object_event 19, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornSuperNerdScript, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 20,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGramps1Script, EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	object_event 21,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGramps2Script, EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	object_event 24, 31, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornBlackBeltScript, -1
	object_event  9, 25, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornCooltrainerF1Script, -1
	object_event 13, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornYoungsterScript, -1
	object_event 22, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SantosScript, EVENT_BLACKTHORN_CITY_SANTOS_OF_SATURDAY
	object_event 35, 19, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlackthornCooltrainerF2Script, -1
