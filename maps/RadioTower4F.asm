	object_const_def
	const RADIOTOWER4F_FISHER
	const RADIOTOWER4F_TEACHER
	const RADIOTOWER4F_GROWLITHE
	const RADIOTOWER4F_ROCKET1
	const RADIOTOWER4F_ROCKET2
	const RADIOTOWER4F_ROCKET_GIRL
	const RADIOTOWER4F_SCIENTIST

RadioTower4F_MapScripts:
	def_scene_scripts

	def_callbacks

RadioTower4FFisherScript:
	jumptextfaceplayer RadioTower4FFisherText

RadioTower4FDJMaryScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_MARY
	iftrue .GotPinkBow
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRockets
	writetext RadioTower4FDJMaryText
	waitbutton
	closetext
	end

.ClearedRockets:
	writetext RadioTower4FDJMaryText_ClearedRockets
	promptbutton
	verbosegiveitem PINK_BOW
	iffalse .NoRoom
	writetext RadioTower4FDJMaryText_GivePinkBow
	waitbutton
	closetext
	setevent EVENT_GOT_PINK_BOW_FROM_MARY
	end

.GotPinkBow:
	writetext RadioTower4FDJMaryText_After
	waitbutton
.NoRoom:
	closetext
	end

RadioTowerMeowth:
	opentext
	writetext RadioTowerMeowthText
	cry MEOWTH
	waitbutton
	closetext
	end

TrainerGruntM10:
	trainer GRUNTM, GRUNTM_10, EVENT_BEAT_ROCKET_GRUNTM_10, GruntM10SeenText, GruntM10BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM10AfterBattleText
	waitbutton
	closetext
	end

TrainerExecutivem2:
	trainer EXECUTIVEM, EXECUTIVEM_2, EVENT_BEAT_ROCKET_EXECUTIVEM_2, Executivem2SeenText, Executivem2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Executivem2AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF4:
	trainer GRUNTF, GRUNTF_4, EVENT_BEAT_ROCKET_GRUNTF_4, GruntF4SeenText, GruntF4BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF4AfterBattleText
	waitbutton
	closetext
	end

TrainerScientistRich:
	trainer SCIENTIST, RICH, EVENT_BEAT_SCIENTIST_RICH, ScientistRichSeenText, ScientistRichBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistRichAfterBattleText
	waitbutton
	closetext
	end

RadioTower4FProductionSign:
	jumptext RadioTower4FProductionSignText

RadioTower4FStudio2Sign:
	jumptext RadioTower4FStudio2SignText

RadioTower4FFisherText:
	text "Tôi nghe radio"
	line "khi ở TÀN TÍCH."

	para "Tôi nghe một"
	line "chương trình lạ"
	cont "ở đó."
	done

RadioTower4FDJMaryText:
	text "MARY: Tại sao? Tại"
	line "sao tôi phải chịu"
	cont "đựng điều này?"

	para "MEOWTH, giúp tôi!"
	done

RadioTower4FDJMaryText_ClearedRockets:
	text "MARY: Ồ! Bạn là"
	line "vị cứu tinh nhỏ!"

	para "Bạn nhận cái này"
	line "làm lời cảm ơn?"
	done

RadioTower4FDJMaryText_GivePinkBow:
	text "MARY: Nó phù hợp"
	line "cho #MON biết"

	para "chiêu hệ thường."
	done

RadioTower4FDJMaryText_After:
	text "MARY: Hãy theo dõi"
	line "tôi trên chương"

	para "trình GS.OAK'S"
	line "#MON TALK."
	done

RadioTowerMeowthText:
	text "MEOWTH: Meowth…"
	done

GruntM10SeenText:
	text "Mày định cứu"
	line "GIÁM ĐỐC hả?"

	para "Không thể được"
	line "vì tao sẽ đánh"
	cont "bại mày!"
	done

GruntM10BeatenText:
	text "Không! Không thể!"
	done

GruntM10AfterBattleText:
	text "Tao không tin"
	line "nổi! Tao thua rồi!"
	done

Executivem2SeenText:
	text "Dừng lại! Tao nổi"
	line "tiếng là pháo đài"
	cont "ĐỘI ROCKET!"

	para "Mày không thể"
	line "tiến thêm bước!"
	done

Executivem2BeatenText:
	text "Pháo đài đã sụp"
	line "đổ!"
	done

Executivem2AfterBattleText:
	text "Mày đã giành được"
	line "sự tôn trọng,"
	cont "nên đây là lời"
	cont "khuyên."

	para "Chưa muộn đâu."
	line "Mày vẫn có thể"
	cont "quay lại."
	done

GruntF4SeenText:
	text "Tao có nghĩ"
	line "#MON dễ thương"
	cont "không á?"

	para "Tao sẽ nghĩ #-"
	line "MON của tao dễ"

	para "thương--sau khi"
	line "chúng đánh bại"
	cont "của mày!"
	done

GruntF4BeatenText:
	text "Ồ, không! Chúng"
	line "thật vô dụng!"
	done

GruntF4AfterBattleText:
	text "Tao yêu bản thân"
	line "xinh đẹp của tao!"

	para "Ai quan tâm đến"
	line "#MON chứ?"
	done

ScientistRichSeenText:
	text "Tuyệt vời."

	para "THÁP RADIO này"
	line "sẽ thực hiện kế"
	cont "hoạch vĩ đại."
	done

ScientistRichBeatenText:
	text "Hmmm…"

	para "Mọi kế hoạch lớn"
	line "đều có trở ngại."
	done

ScientistRichAfterBattleText:
	text "Mày thật sự tin"
	line "mày có thể ngăn"
	cont "ĐỘI ROCKET sao?"
	done

RadioTower4FProductionSignText:
	text "4F SẢN XUẤT"
	done

RadioTower4FStudio2SignText:
	text "4F STUDIO 2"
	done

RadioTower4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_5F, 1
	warp_event  9,  0, RADIO_TOWER_3F, 2
	warp_event 12,  0, RADIO_TOWER_5F, 2
	warp_event 17,  0, RADIO_TOWER_3F, 3

	def_coord_events

	def_bg_events
	bg_event  7,  0, BGEVENT_READ, RadioTower4FProductionSign
	bg_event 15,  0, BGEVENT_READ, RadioTower4FStudio2Sign

	def_object_events
	object_event  6,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower4FFisherScript, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 14,  6, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower4FDJMaryScript, -1
	object_event 12,  7, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTowerMeowth, -1
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM10, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerExecutivem2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerGruntF4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerScientistRich, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
