	object_const_def
	const CERULEANGYM_ROCKET
	const CERULEANGYM_MISTY
	const CERULEANGYM_SWIMMER_GIRL1
	const CERULEANGYM_SWIMMER_GIRL2
	const CERULEANGYM_SWIMMER_GUY
	const CERULEANGYM_GYM_GUIDE

CeruleanGym_MapScripts:
	def_scene_scripts
	scene_script CeruleanGymNoopScene,         SCENE_CERULEANGYM_NOOP
	scene_script CeruleanGymGruntRunsOutScene, SCENE_CERULEANGYM_GRUNT_RUNS_OUT

	def_callbacks

CeruleanGymNoopScene:
	end

CeruleanGymGruntRunsOutScene:
	sdefer CeruleanGymGruntRunsOutScript
	end

CeruleanGymGruntRunsOutScript:
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsDownMovement
	playsound SFX_TACKLE
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsIntoYouMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext CeruleanGymGruntIntroText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, CERULEANGYM_ROCKET, 15
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntBacksAwayMovement
	opentext
	writetext CeruleanGymGruntBigMistakeText
	waitbutton
	closetext
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntMovesCloseMovement
	opentext
	writetext CeruleanGymGruntByeText
	waitbutton
	closetext
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsOutMovement
	playsound SFX_EXIT_BUILDING
	disappear CERULEANGYM_ROCKET
	setevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	clearevent EVENT_ROUTE_24_ROCKET
	clearevent EVENT_ROUTE_25_MISTY_BOYFRIEND
	setscene SCENE_CERULEANGYM_NOOP
	setmapscene ROUTE_25, SCENE_ROUTE25_MISTYS_DATE
	setmapscene POWER_PLANT, SCENE_POWERPLANT_NOOP
	waitsfx
	special RestartMapMusic
	pause 15
	turnobject PLAYER, DOWN
	pause 15
	end

CeruleanGymMistyScript:
	faceplayer
	opentext
	checkflag ENGINE_CASCADEBADGE
	iftrue .FightDone
	writetext MistyIntroText
	waitbutton
	closetext
	winlosstext MistyWinLossText, 0
	loadtrainer MISTY, MISTY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MISTY
	setevent EVENT_BEAT_SWIMMERF_DIANA
	setevent EVENT_BEAT_SWIMMERF_BRIANA
	setevent EVENT_BEAT_SWIMMERM_PARKER
	opentext
	writetext ReceivedCascadeBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_CASCADEBADGE
.FightDone:
	writetext MistyFightDoneText
	waitbutton
	closetext
	end

TrainerSwimmerfDiana:
	trainer SWIMMERF, DIANA, EVENT_BEAT_SWIMMERF_DIANA, SwimmerfDianaSeenText, SwimmerfDianaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDianaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfBriana:
	trainer SWIMMERF, BRIANA, EVENT_BEAT_SWIMMERF_BRIANA, SwimmerfBrianaSeenText, SwimmerfBrianaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfBrianaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermParker:
	trainer SWIMMERM, PARKER, EVENT_BEAT_SWIMMERM_PARKER, SwimmermParkerSeenText, SwimmermParkerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermParkerAfterBattleText
	waitbutton
	closetext
	end

CeruleanGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MISTY
	iftrue .CeruleanGymGuideWinScript
	writetext CeruleanGymGuideText
	waitbutton
	closetext
	end

.CeruleanGymGuideWinScript:
	writetext CeruleanGymGuideWinText
	waitbutton
	closetext
	end

CeruleanGymHiddenMachinePart:
	hiddenitem MACHINE_PART, EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM

CeruleanGymStatue1:
	checkevent EVENT_TRAINERS_IN_CERULEAN_GYM
	iffalse CeruleanGymStatue
	opentext
	writetext CeruleanGymNote1Text
	waitbutton
	closetext
	end

CeruleanGymStatue2:
	checkevent EVENT_TRAINERS_IN_CERULEAN_GYM
	iffalse CeruleanGymStatue
	opentext
	writetext CeruleanGymNote2Text
	waitbutton
	closetext
	end

CeruleanGymStatue:
	checkflag ENGINE_CASCADEBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, MISTY, MISTY1
	jumpstd GymStatue2Script

CeruleanGymGruntRunsDownMovement:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

CeruleanGymGruntRunsOutMovement:
	big_step RIGHT
	big_step DOWN
	step_end

CeruleanGymGruntRunsIntoYouMovement:
	fix_facing
	set_sliding
	jump_step UP
	remove_sliding
	remove_fixed_facing
	step_sleep 8
	step_sleep 8
	step DOWN
	step DOWN
	step_end

CeruleanGymGruntMovesCloseMovement:
	big_step DOWN
	step_end

CeruleanGymGruntBacksAwayMovement:
	fix_facing
	slow_step UP
	remove_fixed_facing
	step_end

CeruleanGymGruntIntroText:
	text "Ối! Tôi xin lỗi!"
	line "Bạn không sao"
	cont "chứ?"

	para "Tôi rất bận. Không"
	line "có thời gian nói"
	cont "chuyện. Không tốt"
	cont "nếu bị ai nhìn"
	cont "thấy."
	done

CeruleanGymGruntBigMistakeText:
	text "Ôi không! Bạn đã"
	line "thấy tôi rồi! Tôi"
	cont "sai lầm lớn rồi!"
	done

CeruleanGymGruntByeText:
	text "Này! Quên đi là"
	line "bạn thấy tôi nhé?"

	para "Bạn không thấy,"
	line "không nghe, không"

	para "biết gì nhé?"
	line "Tạm biệt! Bye-bye!"
	done

CeruleanGymNote1Text:
	text "Xin lỗi, tôi sẽ"
	line "ra ngoài một lúc."
	cont "MISTY, T.LĨNH GYM"
	done

CeruleanGymNote2Text:
	text "Vì MISTY đi vắng,"
	line "chúng tôi cũng đi."
	cont "CÁC HLV GYM"
	done

MistyIntroText:
	text "MISTY: Ta đã chờ"
	line "ngươi, đồ phiền"
	cont "phức!"

	para "Ngươi có thể có"
	line "nhiều BADGE JOHTO,"

	para "nhưng đừng coi"
	line "thường ta."

	para "#MON hệ NƯỚC"
	line "của ta rất mạnh!"
	done

MistyWinLossText:
	text "MISTY: Ngươi thật"
	line "sự giỏi…"

	para "Ta thừa nhận"
	line "ngươi có tay nghề…"

	para "Đây, nhận lấy"
	line "CASCADEBADGE."
	done

ReceivedCascadeBadgeText:
	text "<PLAYER> nhận được"
	line "CASCADEBADGE."
	done

MistyFightDoneText:
	text "MISTY: Ở JOHTO có"
	line "nhiều HLV giỏi"
	cont "không? Như ngươi"
	cont "ấy."

	para "Ta sẽ đi du lịch"
	line "một ngày nào đó,"

	para "để đấu với các"
	line "HLV tài năng."
	done

SwimmerfDianaSeenText:
	text "Xin lỗi đã đi"
	line "vắng. Giờ bắt đầu"
	cont "thôi!"
	done

SwimmerfDianaBeatenText:
	text "Tôi chịu thua!"
	line "Bạn thắng rồi!"
	done

SwimmerfDianaAfterBattleText:
	text "Tôi sẽ bơi lặng"
	line "lẽ thôi."
	done

SwimmerfBrianaSeenText:
	text "Đừng để kiểu bơi"
	line "duyên dáng của"
	cont "tôi làm bạn lo."
	done

SwimmerfBrianaBeatenText:
	text "Ồ, bạn thản nhiên"
	line "hạ gục tôi…"
	done

SwimmerfBrianaAfterBattleText:
	text "Đừng tự mãn vì"
	line "đã thắng tôi."

	para "MISTY sẽ nghiền"
	line "nát bạn nếu bạn"
	cont "chủ quan đấy."
	done

SwimmermParkerSeenText:
	text "Glub…"

	para "Tôi đầu tiên!"
	line "Đến đây đi!"
	done

SwimmermParkerBeatenText:
	text "Không thể nào…"
	done

SwimmermParkerAfterBattleText:
	text "MISTY đã tiến bộ"
	line "rất nhiều trong"
	cont "vài năm qua."

	para "Đừng lơ là, nếu"
	line "không bạn sẽ bị"
	cont "nghiền nát!"
	done

CeruleanGymGuideText:
	text "Yo! NHÀ VÔ ĐỊCH"
	line "tương lai!"

	para "Vì MISTY đi vắng,"
	line "tôi cũng đi chơi"

	para "một chút. He-he."
	done

CeruleanGymGuideWinText:
	text "Hoo, bạn cho tôi"
	line "thấy bạn mạnh cỡ"
	cont "nào rồi đấy."

	para "Như mọi khi, đó"
	line "là một trận đấu"
	cont "tuyệt vời!"
	done

CeruleanGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, CERULEAN_CITY, 5
	warp_event  5, 15, CERULEAN_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  3,  8, BGEVENT_ITEM, CeruleanGymHiddenMachinePart
	bg_event  2, 13, BGEVENT_READ, CeruleanGymStatue1
	bg_event  6, 13, BGEVENT_READ, CeruleanGymStatue2

	def_object_events
	object_event  4, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CERULEAN_GYM_ROCKET
	object_event  5,  3, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanGymMistyScript, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  4,  6, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDiana, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  1,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerSwimmerfBriana, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  8,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermParker, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanGymGuideScript, EVENT_TRAINERS_IN_CERULEAN_GYM
