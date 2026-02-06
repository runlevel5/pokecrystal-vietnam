	object_const_def
	const CIANWOODGYM_CHUCK
	const CIANWOODGYM_BLACK_BELT1
	const CIANWOODGYM_BLACK_BELT2
	const CIANWOODGYM_BLACK_BELT3
	const CIANWOODGYM_BLACK_BELT4
	const CIANWOODGYM_BOULDER1
	const CIANWOODGYM_BOULDER2
	const CIANWOODGYM_BOULDER3
	const CIANWOODGYM_BOULDER4

CianwoodGym_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodGymChuckScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CHUCK
	iftrue .FightDone
	writetext ChuckIntroText1
	waitbutton
	closetext
	turnobject CIANWOODGYM_CHUCK, RIGHT
	opentext
	writetext ChuckIntroText2
	waitbutton
	closetext
	applymovement CIANWOODGYM_BOULDER1, CianwoodGymMovement_ChuckChucksBoulder
	playsound SFX_STRENGTH
	earthquake 80
	disappear CIANWOODGYM_BOULDER1
	pause 30
	faceplayer
	opentext
	writetext ChuckIntroText3
	waitbutton
	closetext
	winlosstext ChuckLossText, 0
	loadtrainer CHUCK, CHUCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CHUCK
	opentext
	writetext GetStormBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_STORMBADGE
	readvar VAR_BADGES
	scall CianwoodGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM01_DYNAMICPUNCH
	iftrue .AlreadyGotTM
	setevent EVENT_BEAT_BLACKBELT_YOSHI
	setevent EVENT_BEAT_BLACKBELT_LAO
	setevent EVENT_BEAT_BLACKBELT_NOB
	setevent EVENT_BEAT_BLACKBELT_LUNG
	writetext ChuckExplainBadgeText
	promptbutton
	verbosegiveitem TM_DYNAMICPUNCH
	iffalse .BagFull
	setevent EVENT_GOT_TM01_DYNAMICPUNCH
	writetext ChuckExplainTMText
	waitbutton
	closetext
	end

.AlreadyGotTM:
	writetext ChuckAfterText
	waitbutton
.BagFull:
	closetext
	end

CianwoodGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerBlackbeltYoshi:
	trainer BLACKBELT_T, YOSHI, EVENT_BEAT_BLACKBELT_YOSHI, BlackbeltYoshiSeenText, BlackbeltYoshiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltYoshiAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLao:
	trainer BLACKBELT_T, LAO, EVENT_BEAT_BLACKBELT_LAO, BlackbeltLaoSeenText, BlackbeltLaoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLaoAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltNob:
	trainer BLACKBELT_T, NOB, EVENT_BEAT_BLACKBELT_NOB, BlackbeltNobSeenText, BlackbeltNobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltNobAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLung:
	trainer BLACKBELT_T, LUNG, EVENT_BEAT_BLACKBELT_LUNG, BlackbeltLungSeenText, BlackbeltLungBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLungAfterText
	waitbutton
	closetext
	end

CianwoodGymBoulder:
	jumpstd StrengthBoulderScript

CianwoodGymStatue:
	checkflag ENGINE_STORMBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, CHUCK, CHUCK1
	jumpstd GymStatue2Script

CianwoodGymMovement_ChuckChucksBoulder:
	set_sliding
	big_step LEFT
	big_step UP
	fast_jump_step RIGHT
	remove_sliding
	step_end

ChuckIntroText1:
	text "WAHAHAH!"

	para "Mày đã đến"
	line "được đây rồi!"

	para "Ta nói cho mà"
	line "nghe, ta mạnh lắm!"

	para "#MON của ta"
	line "nghiền nát đá và"
	cont "đập vỡ xương!"

	para "Xem đây!"
	done

ChuckIntroText2:
	text "CHUCK: Hừừừ!"
	line "…"

	para "Oooarrgh!"
	done

ChuckIntroText3:
	text "Đấy! Sợ chưa?"

	para "Cái gì?"
	line "Không liên quan"

	para "đến #MON à?"
	line "Đúng vậy!"

	para "Nào. Chiến đấu"
	line "thôi!"
	done

ChuckLossText:
	text "Hả? Cái gì?"
	line "Ta thua sao?"

	para "Hay đấy!"
	line "Mày xứng đáng"
	cont "HUY HIỆU BÃO!"
	done

GetStormBadgeText:
	text "<PLAYER> nhận được"
	line "HUY HIỆU BÃO."
	done

ChuckExplainBadgeText:
	text "HUY HIỆU BÃO khiến"
	line "mọi #MON đến"

	para "L70 vâng lời, kể"
	line "cả khi trao đổi."

	para "Nó cũng cho phép"
	line "#MON dùng BAY"

	para "khi không trong"
	line "trận đấu."

	para "Đây, lấy cái này"
	line "nữa!"
	done

ChuckExplainTMText:
	text "Đó là ĐẤM NĂNG."

	para "Nó không phải lúc"
	line "nào cũng trúng,"

	para "nhưng khi trúng,"
	line "gây ra hoang mang!"
	done

ChuckAfterText:
	text "WAHAHAH! Ta thích"
	line "đấu với mày!"

	para "Nhưng thua là"
	line "thua!"

	para "Từ giờ, ta sẽ"
	line "tập luyện 24 giờ"
	cont "mỗi ngày!"
	done

BlackbeltYoshiSeenText:
	text "#MON và tôi"
	line "gắn kết với nhau"
	cont "bởi tình bạn."

	para "Mối liên kết của"
	line "chúng tôi bất diệt"
	done

BlackbeltYoshiBeatenText:
	text "Không thể nào!"
	done

BlackbeltYoshiAfterText:
	text "Bạn có vẻ cũng có"
	line "mối liên kết mạnh"
	cont "với #MON!"
	done

BlackbeltLaoSeenText:
	text "Võ sĩ chúng tôi"
	line "không sợ gì cả!"
	done

BlackbeltLaoBeatenText:
	text "Thật sốc!"
	done

BlackbeltLaoAfterText:
	text "#MON hệ võ"
	line "sợ hệ tâm linh…"
	done

BlackbeltNobSeenText:
	text "Lời nói vô dụng."
	line "Hãy để nắm đấm"
	cont "nói thay!"
	done

BlackbeltNobBeatenText:
	text "…"
	done

BlackbeltNobAfterText:
	text "Tôi thua!"
	line "Tôi câm lặng!"
	done

BlackbeltLungSeenText:
	text "Nắm đấm cuồng nộ"
	line "của tôi sẽ nghiền"
	cont "nát #MON mày!"
	done

BlackbeltLungBeatenText:
	text "Tôi bị nghiền nát!"
	done

BlackbeltLungAfterText:
	text "#MON tôi thua…"
	line "Niềm tự hào của"
	cont "tôi… tan vỡ…"
	done

CianwoodGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, CIANWOOD_CITY, 2
	warp_event  5, 17, CIANWOOD_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, CianwoodGymStatue
	bg_event  6, 15, BGEVENT_READ, CianwoodGymStatue

	def_object_events
	object_event  4,  1, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CianwoodGymChuckScript, -1
	object_event  2, 12, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltYoshi, -1
	object_event  7, 12, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltLao, -1
	object_event  3,  9, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltNob, -1
	object_event  5,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBlackbeltLung, -1
	object_event  5,  1, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  3,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  4,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  5,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
