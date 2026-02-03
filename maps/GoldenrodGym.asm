	object_const_def
	const GOLDENRODGYM_WHITNEY
	const GOLDENRODGYM_LASS1
	const GOLDENRODGYM_LASS2
	const GOLDENRODGYM_BEAUTY1
	const GOLDENRODGYM_BEAUTY2
	const GOLDENRODGYM_GYM_GUIDE

GoldenrodGym_MapScripts:
	def_scene_scripts
	scene_script GoldenrodGymNoop1Scene, SCENE_GOLDENRODGYM_NOOP
	scene_script GoldenrodGymNoop2Scene, SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING

	def_callbacks

GoldenrodGymNoop1Scene:
	end

GoldenrodGymNoop2Scene:
	end

GoldenrodGymWhitneyScript:
	faceplayer
	checkevent EVENT_BEAT_WHITNEY
	iftrue .FightDone
	opentext
	writetext WhitneyBeforeText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer WHITNEY, WHITNEY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WHITNEY
	setevent EVENT_MADE_WHITNEY_CRY
	setscene SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING
	setevent EVENT_BEAT_BEAUTY_VICTORIA
	setevent EVENT_BEAT_BEAUTY_SAMANTHA
	setevent EVENT_BEAT_LASS_CARRIE
	setevent EVENT_BEAT_LASS_BRIDGET
.FightDone:
	opentext
	checkevent EVENT_MADE_WHITNEY_CRY
	iffalse .StoppedCrying
	writetext WhitneyYouMeanieText
	waitbutton
	closetext
	end

.StoppedCrying:
	checkevent EVENT_GOT_TM45_ATTRACT
	iftrue .GotAttract
	checkflag ENGINE_PLAINBADGE
	iftrue .GotPlainBadge
	writetext WhitneyWhatDoYouWantText
	promptbutton
	waitsfx
	writetext PlayerReceivedPlainBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_PLAINBADGE
	readvar VAR_BADGES
	scall GoldenrodGymActivateRockets
.GotPlainBadge:
	writetext WhitneyPlainBadgeText
	promptbutton
	verbosegiveitem TM_ATTRACT
	iffalse .NoRoomForAttract
	setevent EVENT_GOT_TM45_ATTRACT
	writetext WhitneyAttractText
	waitbutton
	closetext
	end

.GotAttract:
	writetext WhitneyGoodCryText
	waitbutton
.NoRoomForAttract:
	closetext
	end

GoldenrodGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerLassCarrie:
	trainer LASS, CARRIE, EVENT_BEAT_LASS_CARRIE, LassCarrieSeenText, LassCarrieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassCarrieAfterBattleText
	waitbutton
	closetext
	end

WhitneyCriesScript:
	showemote EMOTE_SHOCK, GOLDENRODGYM_LASS2, 15
	applymovement GOLDENRODGYM_LASS2, BridgetWalksUpMovement
	turnobject PLAYER, DOWN
	opentext
	writetext BridgetWhitneyCriesText
	waitbutton
	closetext
	applymovement GOLDENRODGYM_LASS2, BridgetWalksAwayMovement
	setscene SCENE_GOLDENRODGYM_NOOP
	clearevent EVENT_MADE_WHITNEY_CRY
	end

TrainerLassBridget:
	trainer LASS, BRIDGET, EVENT_BEAT_LASS_BRIDGET, LassBridgetSeenText, LassBridgetBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassBridgetAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyVictoria:
	trainer BEAUTY, VICTORIA, EVENT_BEAT_BEAUTY_VICTORIA, BeautyVictoriaSeenText, BeautyVictoriaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyVictoriaAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautySamantha:
	trainer BEAUTY, SAMANTHA, EVENT_BEAT_BEAUTY_SAMANTHA, BeautySamanthaSeenText, BeautySamanthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautySamanthaAfterBattleText
	waitbutton
	closetext
	end

GoldenrodGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_WHITNEY
	iftrue .GoldenrodGymGuideWinScript
	opentext
	writetext GoldenrodGymGuideText
	waitbutton
	closetext
	end

.GoldenrodGymGuideWinScript:
	opentext
	writetext GoldenrodGymGuideWinText
	waitbutton
	closetext
	end

GoldenrodGymStatue:
	checkflag ENGINE_PLAINBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, WHITNEY, WHITNEY1
	jumpstd GymStatue2Script

BridgetWalksUpMovement:
	step LEFT
	turn_head UP
	step_end

BridgetWalksAwayMovement:
	step RIGHT
	turn_head LEFT
	step_end

WhitneyBeforeText:
	text "Chào! Mình là"
	line "WHITNEY!"

	para "Mọi người đều mê"
	line "#MON, nên mình"
	cont "cũng thích luôn!"

	para "#MON dễ"
	line "thương quá đi!"

	para "Bạn muốn đấu hả?"
	line "Cảnh báo nhé--"
	cont "mình giỏi lắm!"
	done

WhitneyShouldntBeSoSeriousText:
	text "Hức…"

	para "…Huhuhuhu!"
	line "Bạn ác quá!"

	para "Sao bạn nghiêm"
	line "túc vậy! Bạn…"
	cont "đồ trẻ con!"
	done

WhitneyYouMeanieText:
	text "Huhuhu!"

	para "Huhuhu!"

	para "…Hức, hức…"
	line "…Đồ xấu xa!"
	done

WhitneyWhatDoYouWantText:
	text "…Hức…"

	para "Gì? Bạn muốn gì?"
	line "HUY HIỆU hả?"

	para "À, đúng rồi."
	line "Mình quên. Đây,"
	cont "PLAINBADGE."
	done

PlayerReceivedPlainBadgeText:
	text "<PLAYER> nhận"
	line "PLAINBADGE."
	done

WhitneyPlainBadgeText:
	text "PLAINBADGE cho"
	line "phép #MON của"

	para "bạn dùng STRENGTH"
	line "ngoài trận đấu."

	para "Nó cũng tăng"
	line "TỐC ĐỘ cho"
	cont "#MON của bạn."

	para "À, bạn cũng có"
	line "thể lấy cái này!"
	done

WhitneyAttractText:
	text "Đó là MÊ HOẶC!"
	line "Nó tận dụng hết"

	para "sức quyến rũ của"
	line "#MON."

	para "Thích hợp cho"
	line "người dễ thương"
	cont "như mình nhỉ?"
	done

WhitneyGoodCryText:
	text "À, khóc một trận"
	line "thật đã!"

	para "Ghé chơi lần nữa"
	line "nhé! Tạm biệt!"
	done

LassCarrieSeenText:
	text "Đừng để vẻ dễ"
	line "thương của #MON"

	para "tớ đánh lừa bạn."
	line "Chúng mạnh lắm!"
	done

LassCarrieBeatenText:
	text "Chà… Tớ tưởng"
	line "bạn yếu chứ…"
	done

LassCarrieAfterBattleText:
	text "#MON của tớ"
	line "có thấy tớ dễ"
	cont "thương không?"
	done

LassBridgetSeenText:
	text "Tớ thích #MON"
	line "dễ thương hơn là"
	cont "#MON mạnh."

	para "Nhưng tớ có cả"
	line "hai loại đó!"
	done

LassBridgetBeatenText:
	text "Ôi, không không!"
	done

LassBridgetAfterBattleText:
	text "Tớ đang cố thắng"
	line "WHITNEY, nhưng…"
	cont "Chán quá."

	para "Không sao! Nếu"
	line "thua, tớ sẽ cố"

	para "gắng hơn lần"
	line "sau!"
	done

BridgetWhitneyCriesText:
	text "Ôi không. Bạn làm"
	line "WHITNEY khóc rồi."

	para "Không sao. Cô ấy"
	line "sẽ ngừng thôi."

	para "Cô ấy luôn khóc"
	line "khi thua mà."
	done

BeautyVictoriaSeenText:
	text "Ồ, em là một HLV"
	line "nhỏ dễ thương!"

	para "Chị thích em,"
	line "nhưng chị không"
	cont "nương tay đâu!"
	done

BeautyVictoriaBeatenText:
	text "Để xem… Ôi,"
	line "hết rồi sao?"
	done

BeautyVictoriaAfterBattleText:
	text "Wow, em phải giỏi"
	line "lắm mới thắng"
	cont "chị! Cố lên nhé!"
	done

BeautySamanthaSeenText:
	text "Cố gắng hết sức"
	line "đi, không thì chị"
	cont "hạ gục em đó!"
	done

BeautySamanthaBeatenText:
	text "Không! Ôi, MEOWTH"
	line "chị xin lỗi!"
	done

BeautySamanthaAfterBattleText:
	text "Chị dạy MEOWTH"
	line "chiêu để đối phó"
	cont "mọi hệ…"
	done

GoldenrodGymGuideText:
	text "Yo! NHÀ VÔ ĐỊCH"
	line "tương lai!"

	para "GYM này là nhà"
	line "của các HLV hệ"
	cont "B.THƯỜNG."

	para "Tôi khuyên bạn"
	line "dùng #MON hệ"
	cont "VÕ THUẬT."
	done

GoldenrodGymGuideWinText:
	text "Bạn thắng? Tuyệt!"
	line "Tôi bận ngắm các"
	cont "cô gái ở đây."
	done

GoldenrodGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 17, GOLDENROD_CITY, 1
	warp_event  3, 17, GOLDENROD_CITY, 1

	def_coord_events
	coord_event  8,  5, SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING, WhitneyCriesScript

	def_bg_events
	bg_event  1, 15, BGEVENT_READ, GoldenrodGymStatue
	bg_event  4, 15, BGEVENT_READ, GoldenrodGymStatue

	def_object_events
	object_event  8,  3, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGymWhitneyScript, -1
	object_event  9, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerLassCarrie, -1
	object_event  9,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassBridget, -1
	object_event  0,  2, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyVictoria, -1
	object_event 19,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautySamantha, -1
	object_event  5, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGymGuideScript, -1
