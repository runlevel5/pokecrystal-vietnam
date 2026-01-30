	object_const_def
	const VIOLETGYM_FALKNER
	const VIOLETGYM_YOUNGSTER1
	const VIOLETGYM_YOUNGSTER2
	const VIOLETGYM_GYM_GUIDE

VioletGym_MapScripts:
	def_scene_scripts

	def_callbacks

VioletGymFalknerScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .FightDone
	writetext FalknerIntroText
	waitbutton
	closetext
	winlosstext FalknerWinLossText, 0
	loadtrainer FALKNER, FALKNER1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
	opentext
	writetext ReceivedZephyrBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ZEPHYRBADGE
	readvar VAR_BADGES
	scall VioletGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue .SpeechAfterTM
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	setmapscene ELMS_LAB, SCENE_ELMSLAB_NOOP
	specialphonecall SPECIALCALL_ASSISTANT
	writetext FalknerZephyrBadgeText
	promptbutton
	verbosegiveitem TM_MUD_SLAP
	iffalse .NoRoomForMudSlap
	setevent EVENT_GOT_TM31_MUD_SLAP
	writetext FalknerTMMudSlapText
	waitbutton
	closetext
	end

.SpeechAfterTM:
	writetext FalknerFightDoneText
	waitbutton
.NoRoomForMudSlap:
	closetext
	end

VioletGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerBirdKeeperRod:
	trainer BIRD_KEEPER, ROD, EVENT_BEAT_BIRD_KEEPER_ROD, BirdKeeperRodSeenText, BirdKeeperRodBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRodAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperAbe:
	trainer BIRD_KEEPER, ABE, EVENT_BEAT_BIRD_KEEPER_ABE, BirdKeeperAbeSeenText, BirdKeeperAbeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperAbeAfterBattleText
	waitbutton
	closetext
	end

VioletGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .VioletGymGuideWinScript
	writetext VioletGymGuideText
	waitbutton
	closetext
	end

.VioletGymGuideWinScript:
	writetext VioletGymGuideWinText
	waitbutton
	closetext
	end

VioletGymStatue:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, FALKNER, FALKNER1
	jumpstd GymStatue2Script

FalknerIntroText:
	text "Tôi là FALKNER,"
	line "GYM LEADER #MON"
	cont "TP VIOLET!"

	para "Người ta nói có"
	line "thể cắt cánh"

	para "#MON hệ bay"
	line "bằng điện giật…"

	para "Tôi không chấp"
	line "nhận sự xúc phạm"
	cont "chim #MON!"

	para "Tôi sẽ cho bạn"
	line "thấy sức mạnh"

	para "thật sự của chim"
	line "#MON hùng vĩ!"
	done

FalknerWinLossText:
	text "…Chết! Chim #MON"
	line "quý của cha tôi…"

	para "Thôi được."
	line "Cầm lấy cái này."

	para "Đây là huy hiệu"
	line "chính thức"
	cont "ZEPHYRBADGE."
	done

ReceivedZephyrBadgeText:
	text "<PLAYER> nhận được"
	line "ZEPHYRBADGE."
	done

FalknerZephyrBadgeText:
	text "ZEPHYRBADGE"
	line "tăng sức tấn công"
	cont "của #MON."

	para "Nó cũng cho phép"
	line "#MON sử dụng"

	para "FLASH bất cứ"
	line "lúc nào."

	para "Đây--cầm luôn"
	line "cái này."
	done

FalknerTMMudSlapText:
	text "Dùng TM, #MON"
	line "sẽ học chiêu mới"
	cont "ngay lập tức."

	para "Suy nghĩ trước"
	line "khi dùng--TM chỉ"
	cont "dùng được một lần"

	para "TM31 chứa"
	line "MUD-SLAP."

	para "Nó giảm độ chính"
	line "xác của đối thủ"

	para "trong khi gây"
	line "sát thương."

	para "Nói cách khác, nó"
	line "vừa phòng thủ"
	cont "vừa tấn công."
	done

FalknerFightDoneText:
	text "Có các GYM #MON"
	line "ở các thành phố"
	cont "phía trước."

	para "Bạn nên thử sức"
	line "tại các GYM đó."

	para "Tôi sẽ tập luyện"
	line "chăm hơn để trở"

	para "thành bậc thầy"
	line "chim vĩ đại nhất!"
	done

BirdKeeperRodSeenText:
	text "Từ khóa là"
	line "quyết tâm!"

	para "Những người ở đây"
	line "tập ngày đêm để"

	para "thành bậc thầy"
	line "chim #MON."

	para "Lên nào!"
	done

BirdKeeperRodBeatenText:
	text "Gaaah!"
	done

BirdKeeperRodAfterBattleText:
	text "Kỹ năng FALKNER"
	line "là thật!"

	para "Đừng tự mãn chỉ"
	line "vì thắng tôi!"
	done

BirdKeeperAbeSeenText:
	text "Để tôi xem bạn"
	line "có đủ giỏi để"
	cont "đấu FALKNER không!"
	done

BirdKeeperAbeBeatenText:
	text "Không thể"
	line "tin được!"
	done

BirdKeeperAbeAfterBattleText:
	text "Thật xấu hổ,"
	line "thua một HLV"
	cont "mới vào nghề…"
	done

VioletGymGuideText:
	text "Này! Tôi không"
	line "phải HLV nhưng"
	cont "cho lời khuyên!"

	para "Tin tôi đi!"
	line "Nếu bạn tin, giấc"

	para "mơ vô địch có"
	line "thể thành sự thật"

	para "Bạn tin không?"
	line "Vậy thì nghe đây."

	para "Hệ cỏ yếu trước"
	line "hệ bay. Nhớ"
	cont "điều này nhé."
	done

VioletGymGuideWinText:
	text "Trận hay! Tiếp"
	line "tục như vậy, bạn"

	para "sẽ thành VÔ ĐỊCH"
	line "trong chớp mắt!"
	done

VioletGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, VIOLET_CITY, 2
	warp_event  5, 15, VIOLET_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, VioletGymStatue
	bg_event  6, 13, BGEVENT_READ, VioletGymStatue

	def_object_events
	object_event  5,  1, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletGymFalknerScript, -1
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRod, -1
	object_event  2, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperAbe, -1
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletGymGuideScript, -1
