	object_const_def
	const SLOWPOKEWELLB1F_ROCKET1
	const SLOWPOKEWELLB1F_ROCKET2
	const SLOWPOKEWELLB1F_ROCKET3
	const SLOWPOKEWELLB1F_ROCKET_GIRL
	const SLOWPOKEWELLB1F_SLOWPOKE1
	const SLOWPOKEWELLB1F_SLOWPOKE2
	const SLOWPOKEWELLB1F_KURT
	const SLOWPOKEWELLB1F_BOULDER
	const SLOWPOKEWELLB1F_POKE_BALL

SlowpokeWellB1F_MapScripts:
	def_scene_scripts

	def_callbacks

SlowpokeWellB1FKurtScript:
	jumptextfaceplayer SlowpokeWellB1FKurtText

TrainerGruntM29:
	trainer GRUNTM, GRUNTM_29, EVENT_BEAT_ROCKET_GRUNTM_29, GruntM29SeenText, GruntM29BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM29AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM1:
	trainer GRUNTM, GRUNTM_1, EVENT_BEAT_ROCKET_GRUNTM_1, GruntM1SeenText, GruntM1BeatenText, 0, .Script

.Script:
	opentext
	writetext TrainerGruntM1WhenTalkText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear SLOWPOKEWELLB1F_ROCKET1
	disappear SLOWPOKEWELLB1F_ROCKET2
	disappear SLOWPOKEWELLB1F_ROCKET3
	disappear SLOWPOKEWELLB1F_ROCKET_GIRL
	pause 15
	special FadeInFromBlack
	disappear SLOWPOKEWELLB1F_KURT
	moveobject SLOWPOKEWELLB1F_KURT, 11, 6
	appear SLOWPOKEWELLB1F_KURT
	applymovement SLOWPOKEWELLB1F_KURT, KurtSlowpokeWellVictoryMovementData
	turnobject PLAYER, RIGHT
	opentext
	writetext KurtLeaveSlowpokeWellText
	waitbutton
	closetext
	setevent EVENT_CLEARED_SLOWPOKE_WELL
	variablesprite SPRITE_AZALEA_ROCKET, SPRITE_RIVAL
	setmapscene AZALEA_TOWN, SCENE_AZALEATOWN_RIVAL_BATTLE
	clearevent EVENT_ILEX_FOREST_APPRENTICE
	clearevent EVENT_ILEX_FOREST_FARFETCHD
	setevent EVENT_CHARCOAL_KILN_FARFETCH_D
	setevent EVENT_CHARCOAL_KILN_APPRENTICE
	setevent EVENT_SLOWPOKE_WELL_SLOWPOKES
	setevent EVENT_SLOWPOKE_WELL_KURT
	clearevent EVENT_AZALEA_TOWN_SLOWPOKES
	clearevent EVENT_KURTS_HOUSE_SLOWPOKE
	clearevent EVENT_KURTS_HOUSE_KURT_1
	special FadeOutToWhite
	special HealParty
	pause 15
	warp KURTS_HOUSE, 3, 3
	end

TrainerGruntM2:
	trainer GRUNTM, GRUNTM_2, EVENT_BEAT_ROCKET_GRUNTM_2, GruntM2SeenText, GruntM2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM2AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF1:
	trainer GRUNTF, GRUNTF_1, EVENT_BEAT_ROCKET_GRUNTF_1, GruntF1SeenText, GruntF1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF1AfterBattleText
	waitbutton
	closetext
	end

SlowpokeWellB1FSlowpokeWithMailScript:
	faceplayer
	opentext
	cry SLOWPOKE
	writetext SlowpokeWellB1FSlowpokeWithMailText
	yesorno
	iftrue .ReadMail
	closetext
	end

.ReadMail:
	writetext SlowpokeWellB1FSlowpokeMailText
	waitbutton
	closetext
	end

SlowpokeWellB1FTaillessSlowpokeScript:
	faceplayer
	opentext
	writetext SlowpokeWellB1FTaillessSlowpokeText
	cry SLOWPOKE
	waitbutton
	closetext
	end

SlowpokeWellB1FBoulder:
	jumpstd StrengthBoulderScript

SlowpokeWellB1FSuperPotion:
	itemball SUPER_POTION

KurtSlowpokeWellVictoryMovementData:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step_sleep 8
	step_sleep 8
	step_sleep 8
	step LEFT
	step UP
	step UP
	step_sleep 8
	step_sleep 8
	step_sleep 8
	turn_head LEFT
	step_end

SlowpokeWellB1FKurtText:
	text "KURT: Chào con,"
	line "<PLAYER>!"

	para "Tên canh gác ở"
	line "trên đã bỏ chạy"
	cont "khi ta quát hắn."

	para "Nhưng sau đó ta"
	line "bị ngã xuống"
	cont "GIẾNG này."

	para "Ta ngã đập lưng"
	line "rất mạnh, nên"
	cont "không cử động nổi."

	para "Chán quá! Nếu ta"
	line "khỏe, #MON của"

	para "ta đã trừng phạt"
	line "bọn chúng rồi…"

	para "Thôi, không còn"
	line "cách nào khác."

	para "<PLAYER>, hãy cho"
	line "bọn chúng thấy sự"
	cont "dũng cảm của con!"
	done

KurtLeaveSlowpokeWellText:
	text "KURT: Làm tốt lắm,"
	line "<PLAYER>!"

	para "ĐỘI ROCKET đã"
	line "chuồn hết rồi."

	para "Lưng ta cũng đỡ"
	line "rồi. Chúng ta ra"
	cont "khỏi đây thôi."
	done

GruntM29SeenText:
	text "Chết tiệt! Tao"
	line "đang canh gác ở"

	para "trên thì một lão"
	line "già quát tao."

	para "Lão làm tao giật"
	line "mình đến nỗi ngã"
	cont "xuống đây."

	para "Tao sẽ trút giận"
	line "lên đầu mày cho"
	cont "bõ tức!"
	done

GruntM29BeatenText:
	text "Arrgh! Hôm nay"
	line "xui thật!"
	done

GruntM29AfterBattleText:
	text "Đúng, bọn tao chặt"
	line "đuôi SLOWPOKE rồi"

	para "đem bán."

	para "Mọi việc bọn tao"
	line "làm đều vì lợi"
	cont "nhuận."

	para "Đúng vậy đó!"
	line "Bọn tao là ĐỘI"
	cont "ROCKET,"

	para "và sẽ làm bất cứ"
	line "gì để có tiền!"
	done

GruntM1SeenText:
	text "Mày muốn gì?"

	para "Nếu mày cản trở"
	line "công việc, đừng"
	cont "mong được tha!"
	done

GruntM1BeatenText:
	text "Hôm nay mày thắng,"
	line "nhưng lần sau thì"
	cont "đừng hòng!"
	done

TrainerGruntM1WhenTalkText:
	text "Đúng, ĐỘI ROCKET"
	line "đã bị giải tán"
	cont "ba năm trước."

	para "Nhưng bọn tao vẫn"
	line "tiếp tục hoạt"
	cont "động ngầm."

	para "Giờ thì mày cứ"
	line "xem bọn tao gây"
	cont "rối nhé!"
	done

GruntM2SeenText:
	text "Ngừng lấy ĐUÔI"
	line "SLOWPOKE á?"

	para "Nếu nghe mày, uy"
	line "tín của ĐỘI"
	cont "ROCKET sẽ tiêu!"
	done

GruntM2BeatenText:
	text "Quá…"
	line "Mạnh quá…"
	done

GruntM2AfterBattleText:
	text "Bọn tao cần tiền,"
	line "nhưng bán ĐUÔI"
	cont "SLOWPOKE á?"

	para "Làm lính ROCKET"
	line "khổ thật!"
	done

GruntF1SeenText:
	text "Ngừng lấy ĐUÔI á?"

	para "Được, cứ thử đánh"
	line "thắng hết bọn tao"
	cont "đi!"
	done

GruntF1BeatenText:
	text "Đồ nhóc ranh!"
	done

GruntF1AfterBattleText:
	text "ĐUÔI SLOWPOKE"
	line "mọc lại rất nhanh!"

	para "Bán chúng thì có"
	line "gì sai?"
	done

SlowpokeWellB1FSlowpokeWithMailText:
	text "Một con SLOWPOKE"
	line "bị cắt mất ĐUÔI…"

	para "Hả? Nó có THƯ."
	line "Đọc không?"
	done

SlowpokeWellB1FSlowpokeMailText:
	text "<PLAYER> đọc"
	line "THƯ."

	para "Con ngoan nhé, ở"
	line "nhà với Ông và"

	para "SLOWPOKE."

	para "Thương con, Bố"
	done

SlowpokeWellB1FTaillessSlowpokeText:
	text "Một con SLOWPOKE"
	line "bị cắt mất ĐUÔI…"
	done

SlowpokeWellB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 15, AZALEA_TOWN, 6
	warp_event  7, 11, SLOWPOKE_WELL_B2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 15,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM29, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  5,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGruntM1, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM2, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event 10,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF1, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  7,  4, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FSlowpokeWithMailScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
	object_event  6,  2, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FTaillessSlowpokeScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
	object_event 16, 14, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FKurtScript, EVENT_SLOWPOKE_WELL_KURT
	object_event  3,  2, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FBoulder, -1
	object_event 10,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SlowpokeWellB1FSuperPotion, EVENT_SLOWPOKE_WELL_B1F_SUPER_POTION
