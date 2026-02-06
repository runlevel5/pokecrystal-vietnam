	object_const_def
	const ROUTE40_OLIVINE_RIVAL1
	const ROUTE40_OLIVINE_RIVAL2
	const ROUTE40_SWIMMER_GIRL1
	const ROUTE40_SWIMMER_GIRL2
	const ROUTE40_ROCK1
	const ROUTE40_ROCK2
	const ROUTE40_ROCK3
	const ROUTE40_LASS1
	const ROUTE40_MONICA
	const ROUTE40_POKEFAN_M
	const ROUTE40_LASS2
	const ROUTE40_STANDING_YOUNGSTER

Route40_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route40MonicaCallback

Route40MonicaCallback:
	clearevent EVENT_BATTLE_TOWER_OPEN_CIVILIANS
	readvar VAR_WEEKDAY
	ifequal MONDAY, .MonicaAppears
	disappear ROUTE40_MONICA
	endcallback

.MonicaAppears:
	appear ROUTE40_MONICA
	endcallback

TrainerSwimmerfElaine:
	trainer SWIMMERF, ELAINE, EVENT_BEAT_SWIMMERF_ELAINE, SwimmerfElaineSeenText, SwimmerfElaineBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfElaineAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfPaula:
	trainer SWIMMERF, PAULA, EVENT_BEAT_SWIMMERF_PAULA, SwimmerfPaulaSeenText, SwimmerfPaulaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfPaulaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermSimon:
	trainer SWIMMERM, SIMON, EVENT_BEAT_SWIMMERM_SIMON, SwimmermSimonSeenText, SwimmermSimonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSimonAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermRandall:
	trainer SWIMMERM, RANDALL, EVENT_BEAT_SWIMMERM_RANDALL, SwimmermRandallSeenText, SwimmermRandallBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermRandallAfterBattleText
	waitbutton
	closetext
	end

Route40Lass1Script:
	jumptextfaceplayer Route40Lass1Text

Route40PokefanMScript:
	special CheckMobileAdapterStatusSpecial
	iftrue .mobile
	jumptextfaceplayer Route40PokefanMText

.mobile
	jumptextfaceplayer Route40PokefanMText_Mobile

Route40Lass2Script:
	jumptextfaceplayer Route40Lass2Text

Route40StandingYoungsterScript:
	jumptextfaceplayer Route40StandingYoungsterText

MonicaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	iftrue .Monday
	readvar VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checkevent EVENT_MET_MONICA_OF_MONDAY
	iftrue .MetMonica
	writetext MeetMonicaText
	promptbutton
	setevent EVENT_MET_MONICA_OF_MONDAY
.MetMonica:
	writetext MonicaGivesGiftText
	promptbutton
	verbosegiveitem SHARP_BEAK
	iffalse .done
	setevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	writetext MonicaGaveGiftText
	waitbutton
	closetext
	end

.Monday:
	writetext MonicaMondayText
	waitbutton
.done:
	closetext
	end

.NotMonday:
	writetext MonicaNotMondayText
	waitbutton
	closetext
	end

Route40Sign:
	jumptext Route40SignText

Route40Rock:
	jumpstd SmashRockScript

Route40HiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ROUTE_40_HIDDEN_HYPER_POTION

Route40_StepRightUp6Movement: ; unreferenced
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

Route40_StepUp5Movement: ; unreferenced
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

Route40_StepUp4Movement: ; unreferenced
	step UP
	step UP
	step UP
	step UP
	step_end

SwimmermSimonSeenText:
	text "Phải khởi động"
	line "trước khi xuống"
	cont "nước."

	para "Đó là cơ bản."
	done

SwimmermSimonBeatenText:
	text "OK! Chú! Tôi đầu!"
	done

SwimmermSimonAfterBattleText:
	text "TP. CIANWOOD xa"
	line "đây một khoảng"
	cont "khá dài."
	done

SwimmermRandallSeenText:
	text "Này, bạn trẻ và"
	line "khỏe mạnh!"

	para "Đừng cưỡi #MON"
	line "Bơi đi!"
	done

SwimmermRandallBeatenText:
	text "Uh-oh. Tôi thua…"
	done

SwimmermRandallAfterBattleText:
	text "Bơi luyện toàn"
	line "thân. Tốt cho"
	cont "sức khỏe."
	done

SwimmerfElaineSeenText:
	text "Bạn đi CIANWOOD à?"

	para "Đấu nhanh một trận"
	line "trước đi?"
	done

SwimmerfElaineBeatenText:
	text "Tôi thua rồi!"
	done

SwimmerfElaineAfterBattleText:
	text "Tôi bơi giỏi hơn"
	line "bạn đấy. Yeah!"
	done

SwimmerfPaulaSeenText:
	text "Không dùng phao"
	line "cứu sinh."

	para "Tôi bám vào #-"
	line "MON biển!"
	done

SwimmerfPaulaBeatenText:
	text "Ooh, tôi chóng mặt"
	done

SwimmerfPaulaAfterBattleText:
	text "Khi tôi nổi như"
	line "thế này, sóng sẽ"
	cont "đẩy tôi đi."
	done

Route40Lass1Text:
	text "Dù bạn không nhìn"
	line "thấy từ đây,"

	para "CIANWOOD ở bên"
	line "kia biển."
	done

Route40PokefanMText:
	text "Hm! Có tòa nhà lớn"
	line "ở phía trước!"

	para "Đó là gì?"
	done

Route40PokefanMText_Mobile:
	text "Hm! Nhìn tất cả"
	line "những HLV nghiêm"
	cont "túc kia đổ vào."

	para "Cái gì? Gì vậy?"
	done

Route40Lass2Text:
	text "Tôi đến OLIVINE"
	line "bằng tàu để xem"

	para "phong cảnh và hít"
	line "không khí."

	para "Là cảng, nó cảm"
	line "giác khác lạ so"
	cont "với thành phố lớn."
	done

Route40StandingYoungsterText:
	text "Bạn đã đến THÁP"
	line "ĐẤU chưa?"

	para "Tôi nghĩ nhiều"
	line "HLV mạnh đã tụ"

	para "họp ở đó rồi."

	para "Nhưng vì bạn có"
	line "nhiều HUY CHƯƠNG,"

	para "bạn không nên"
	line "làm tệ chút nào."
	done

MeetMonicaText:
	text "MONICA: Vui mừng"
	line "được gặp bạn. Tôi"

	para "là MONICA của"
	line "Thứ Hai."
	done

MonicaGivesGiftText:
	text "Để làm dấu tình"
	line "bạn, tôi có quà"
	cont "cho bạn!"
	done

MonicaGaveGiftText:
	text "MONICA: Đó là đồ"
	line "tăng sức mạnh cho"

	para "chiêu hệ bay."

	para "Bạn nên trang bị"
	line "cho #MON chim"
	cont "đồ đó."
	done

MonicaMondayText:
	text "MONICA: Anh chị em"
	line "tôi ở khắp nơi."

	para "Xem bạn có thể tìm"
	line "hết không!"
	done

MonicaNotMondayText:
	text "MONICA: Tôi không"
	line "nghĩ hôm nay là"
	cont "Thứ Hai. Buồn…"
	done

Route40SignText:
	text "TUYẾN ĐƯỜNG 40"

	para "TP. CIANWOOD -"
	line "TP. OLIVINE"
	done

Route40_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  5, ROUTE_40_BATTLE_TOWER_GATE, 1

	def_coord_events

	def_bg_events
	bg_event 14, 10, BGEVENT_READ, Route40Sign
	bg_event  7,  8, BGEVENT_ITEM, Route40HiddenHyperPotion

	def_object_events
	object_event 14, 15, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermSimon, -1
	object_event 18, 30, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerSwimmermRandall, -1
	object_event  3, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfElaine, -1
	object_event 10, 25, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfPaula, -1
	object_event  7, 11, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event  6,  9, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event  7,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event 11, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Lass1Script, -1
	object_event  8, 10, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MonicaScript, EVENT_ROUTE_40_MONICA_OF_MONDAY
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40PokefanMScript, -1
	object_event 13,  4, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40Lass2Script, -1
	object_event 16,  9, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route40StandingYoungsterScript, EVENT_BATTLE_TOWER_OPEN_CIVILIANS
