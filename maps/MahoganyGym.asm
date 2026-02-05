	object_const_def
	const MAHOGANYGYM_PRYCE
	const MAHOGANYGYM_BEAUTY1
	const MAHOGANYGYM_ROCKER1
	const MAHOGANYGYM_BEAUTY2
	const MAHOGANYGYM_ROCKER2
	const MAHOGANYGYM_ROCKER3
	const MAHOGANYGYM_GYM_GUIDE

MahoganyGym_MapScripts:
	def_scene_scripts

	def_callbacks

MahoganyGymPryceScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .FightDone
	writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Impressed, 0
	loadtrainer PRYCE, PRYCE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	opentext
	writetext Text_ReceivedGlacierBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_GLACIERBADGE
	readvar VAR_BADGES
	scall MahoganyGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM16_ICY_WIND
	iftrue PryceScript_Defeat
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_SKIER_CLARISSA
	setevent EVENT_BEAT_BOARDER_RONALD
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	writetext PryceText_GlacierBadgeSpeech
	promptbutton
	verbosegiveitem TM_ICY_WIND
	iffalse MahoganyGym_NoRoomForIcyWind
	setevent EVENT_GOT_TM16_ICY_WIND
	writetext PryceText_IcyWindSpeech
	waitbutton
	closetext
	end

PryceScript_Defeat:
	writetext PryceText_CherishYourPokemon
	waitbutton
MahoganyGym_NoRoomForIcyWind:
	closetext
	end

MahoganyGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerSkierRoxanne:
	trainer SKIER, ROXANNE, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierRoxanneAfterBattleText
	waitbutton
	closetext
	end

TrainerSkierClarissa:
	trainer SKIER, CLARISSA, EVENT_BEAT_SKIER_CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierClarissaAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderRonald:
	trainer BOARDER, RONALD, EVENT_BEAT_BOARDER_RONALD, BoarderRonaldSeenText, BoarderRonaldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderRonaldAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderBrad:
	trainer BOARDER, BRAD, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderBradAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderDouglas:
	trainer BOARDER, DOUGLAS, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderDouglasAfterBattleText
	waitbutton
	closetext
	end

MahoganyGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .MahoganyGymGuideWinScript
	writetext MahoganyGymGuideText
	waitbutton
	closetext
	end

.MahoganyGymGuideWinScript:
	writetext MahoganyGymGuideWinText
	waitbutton
	closetext
	end

MahoganyGymStatue:
	checkflag ENGINE_GLACIERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, PRYCE, PRYCE1
	jumpstd GymStatue2Script

PryceText_Intro:
	text "#MON có nhiều"
	line "trải nghiệm trong"

	para "cuộc sống, giống"
	line "như chúng ta."

	para "Ta cũng đã thấy"
	line "và chịu đựng"
	cont "nhiều trong đời."

	para "Vì ta là bậc"
	line "trưởng lão, để ta"
	cont "chỉ cho con thấy."

	para "Ta đã ở bên"
	line "#MON từ trước"

	para "khi con được"
	line "sinh ra."

	para "Ta không dễ dàng"
	line "thua đâu."

	para "Ta, PRYCE--HLV"
	line "mùa đông--"

	para "sẽ thể hiện sức"
	line "mạnh của ta!"
	done

PryceText_Impressed:
	text "À, ta rất ấn"
	line "tượng với con."

	para "Với ý chí mạnh"
	line "mẽ, ta biết con"

	para "sẽ vượt qua mọi"
	line "trở ngại đời."

	para "Con xứng đáng"
	line "với HUY HIỆU này!"
	done

Text_ReceivedGlacierBadge:
	text "<PLAYER> nhận được"
	line "HC GLACIER."
	done

PryceText_GlacierBadgeSpeech:
	text "HUY HIỆU đó sẽ"
	line "tăng chỉ số"
	cont "ĐẶC BIỆT #MON."

	para "Nó cũng cho phép"
	line "#MON dùng"
	cont "XOÁY NƯỚC để qua"
	cont "xoáy nước thật."

	para "Và đây… Đây là"
	line "quà từ ta!"
	done

PryceText_IcyWindSpeech:
	text "TM đó chứa chiêu"
	line "GIÓ LẠNH."

	para "Nó gây sát thương"
	line "và giảm tốc độ."

	para "Nó thể hiện sự"
	line "khắc nghiệt của"
	cont "mùa đông."
	done

PryceText_CherishYourPokemon:
	text "Khi băng tuyết"
	line "tan, mùa xuân"
	cont "sẽ đến."

	para "Con và #MON"
	line "của con sẽ bên"

	para "nhau nhiều năm"
	line "nữa."

	para "Hãy trân trọng"
	line "thời gian bên nhau"
	done

BoarderRonaldSeenText:
	text "Tao sẽ đóng băng"
	line "#MON của mày,"
	cont "mày hết đường!"
	done

BoarderRonaldBeatenText:
	text "Chết tiệt. Tao"
	line "không làm gì nổi."
	done

BoarderRonaldAfterBattleText:
	text "Tao nghĩ có chiêu"
	line "mà #MON dùng"

	para "được khi bị"
	line "đóng băng."
	done

BoarderBradSeenText:
	text "GYM này có sàn"
	line "trơn trượt."

	para "Vui lắm, phải"
	line "không?"

	para "Nhưng này--đây"
	line "không phải trò"
	cont "chơi đâu!"
	done

BoarderBradBeatenText:
	text "Mày thấy bọn tao"
	line "nghiêm túc chưa?"
	done

BoarderBradAfterBattleText:
	text "GYM này tuyệt vời."
	line "Tao thích trượt"
	cont "với #MON!"
	done

BoarderDouglasSeenText:
	text "Tao biết bí mật"
	line "của PRYCE."
	done

BoarderDouglasBeatenText:
	text "OK. Tao sẽ kể cho"
	line "mày bí mật PRYCE."
	done

BoarderDouglasAfterBattleText:
	text "Bí mật đằng sau"
	line "sức mạnh PRYCE…"

	para "Ông ấy thiền dưới"
	line "thác nước mỗi ngày"

	para "để rèn luyện tâm"
	line "trí và thể xác."
	done

SkierRoxanneSeenText:
	text "Để gặp PRYCE,"
	line "T.LĨNH GYM của ta,"

	para "mày cần suy nghĩ"
	line "trước khi trượt."
	done

SkierRoxanneBeatenText:
	text "Tao không thua mày"
	line "về trượt tuyết!"
	done

SkierRoxanneAfterBattleText:
	text "Nếu không trượt"
	line "chính xác,"

	para "mày sẽ không đi"
	line "xa trong GYM này."
	done

SkierClarissaSeenText:
	text "Xem cú rẽ song"
	line "song của tao này!"
	done

SkierClarissaBeatenText:
	text "Không! Mày làm"
	line "tao ngã rồi!"
	done

SkierClarissaAfterBattleText:
	text "Lẽ ra tao không"
	line "nên khoe khoang"
	cont "về trượt tuyết…"
	done

MahoganyGymGuideText:
	text "PRYCE là kỳ cựu"
	line "đã huấn luyện"

	para "#MON khoảng"
	line "50 năm rồi."

	para "Nghe nói ông ấy"
	line "giỏi đóng băng"

	para "đối thủ bằng"
	line "chiêu hệ băng."

	para "Vậy nghĩa là bạn"
	line "nên làm tan chảy"

	para "ông ấy bằng tham"
	line "vọng cháy bỏng!"
	done

MahoganyGymGuideWinText:
	text "PRYCE rất giỏi,"
	line "nhưng bạn còn"
	cont "giỏi hơn!"

	para "Đó là trận đấu"
	line "nóng bỏng đã"

	para "nối liền khoảng"
	line "cách thế hệ!"
	done

MahoganyGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, MAHOGANY_TOWN, 3
	warp_event  5, 17, MAHOGANY_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, MahoganyGymStatue
	bg_event  6, 15, BGEVENT_READ, MahoganyGymStatue

	def_object_events
	object_event  5,  3, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MahoganyGymPryceScript, -1
	object_event  4,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierRoxanne, -1
	object_event  0, 17, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderRonald, -1
	object_event  9, 17, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierClarissa, -1
	object_event  5,  9, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderBrad, -1
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderDouglas, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyGymGuideScript, -1
