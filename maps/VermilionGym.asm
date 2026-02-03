	object_const_def
	const VERMILIONGYM_SURGE
	const VERMILIONGYM_GENTLEMAN
	const VERMILIONGYM_ROCKER
	const VERMILIONGYM_SUPER_NERD
	const VERMILIONGYM_GYM_GUIDE

VermilionGym_MapScripts:
	def_scene_scripts

	def_callbacks

VermilionGymSurgeScript:
	faceplayer
	opentext
	checkflag ENGINE_THUNDERBADGE
	iftrue .FightDone
	writetext LtSurgeIntroText
	waitbutton
	closetext
	winlosstext LtSurgeWinLossText, 0
	loadtrainer LT_SURGE, LT_SURGE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LTSURGE
	setevent EVENT_BEAT_GENTLEMAN_GREGORY
	setevent EVENT_BEAT_GUITARIST_VINCENT
	setevent EVENT_BEAT_JUGGLER_HORTON
	opentext
	writetext ReceivedThunderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_THUNDERBADGE
	writetext LtSurgeThunderBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext LtSurgeFightDoneText
	waitbutton
	closetext
	end

TrainerGentlemanGregory:
	trainer GENTLEMAN, GREGORY, EVENT_BEAT_GENTLEMAN_GREGORY, GentlemanGregorySeenText, GentlemanGregoryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanGregoryAfterBattleText
	waitbutton
	closetext
	end

TrainerGuitaristVincent:
	trainer GUITARIST, VINCENT, EVENT_BEAT_GUITARIST_VINCENT, GuitaristVincentSeenText, GuitaristVincentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GuitaristVincentAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerHorton:
	trainer JUGGLER, HORTON, EVENT_BEAT_JUGGLER_HORTON, JugglerHortonSeenText, JugglerHortonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerHortonAfterBattleText
	waitbutton
	closetext
	end

VermilionGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LTSURGE
	iftrue .VermilionGymGuideWinScript
	writetext VermilionGymGuideText
	waitbutton
	closetext
	end

.VermilionGymGuideWinScript:
	writetext VermilionGymGuideWinText
	waitbutton
	closetext
	end

VermilionGymTrashCan:
	jumptext VermilionGymTrashCanText

VermilionGymStatue:
	checkflag ENGINE_THUNDERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, LT_SURGE, LT_SURGE1
	jumpstd GymStatue2Script

LtSurgeIntroText:
	text "SURGE: Này, nhóc!"

	para "Ta phải công nhận"
	line "ngươi. Thách đấu"

	para "ta không khôn,"
	line "nhưng cần dũng"
	cont "cảm!"

	para "Về #MON hệ"
	line "ĐIỆN, ta là số 1!"

	para "Ta chưa bao giờ"
	line "thua trên chiến"
	cont "trường."

	para "Ta sẽ giật điện"
	line "ngươi như ta làm"
	cont "với kẻ thù trong"
	cont "chiến tranh!"
	done

LtSurgeWinLossText:
	text "SURGE: Arrrgh!"
	line "Ngươi rất mạnh!"

	para "OK, nhóc. Ngươi"
	line "nhận THUNDERBADGE!"
	done

ReceivedThunderBadgeText:
	text "<PLAYER> nhận được"
	line "THUNDERBADGE."
	done

LtSurgeThunderBadgeText:
	text "SURGE: THUNDER-"
	line "BADGE tăng TỐC ĐỘ"
	cont "cho #MON."

	para "Hãy coi nó là"
	line "bằng chứng ngươi"

	para "đã thắng ta."
	line "Đeo nó tự hào!"
	done

LtSurgeFightDoneText:
	text "SURGE: Này, nhóc!"
	line "Vẫn đang chiến"
	cont "đấu chứ?"

	para "#MON của ta và"
	line "ta vẫn luyện tập!"
	done

GentlemanGregorySeenText:
	text "Bạn đến để đánh"
	line "bại LT.SURGE sao?"

	para "Không được nếu"
	line "tôi ngăn cản!"
	done

GentlemanGregoryBeatenText:
	text "Xin lỗi tôi đã"
	line "thất bại,"
	cont "LT.SURGE, thưa!"
	done

GentlemanGregoryAfterBattleText:
	text "Khi tôi còn trong"
	line "quân đội, LT.SURGE"

	para "đã cứu mạng tôi."
	done

GuitaristVincentSeenText:
	text "LT.SURGE đã công"
	line "nhận tiềm năng"

	para "của tôi với"
	line "#MON hệ ĐIỆN."

	para "Bạn nghĩ đánh bại"
	line "được tôi sao?"
	done

GuitaristVincentBeatenText:
	text "Ồ, thật sốc!"
	done

GuitaristVincentAfterBattleText:
	text "Nếu bẫy của GYM"
	line "còn hoạt động,"

	para "bạn đã xong đời"
	line "rồi…"
	done

JugglerHortonSeenText:
	text "Tôi sẽ hạ gục bạn!"
	line "Chuẩn bị bị giật"
	cont "điện!"
	done

JugglerHortonBeatenText:
	text "Gwaaah!"
	line "Tôi bị áp đảo…"
	done

JugglerHortonAfterBattleText:
	text "Đừng thoải mái"
	line "quá vì thắng tôi…"

	para "LT.SURGE rất"
	line "mạnh đấy."
	done

VermilionGymGuideText:
	text "Yo! NHÀ VÔ ĐỊCH"
	line "tương lai!"

	para "Bạn may mắn lần"
	line "này đấy."

	para "LT.SURGE rất cẩn"
	line "thận. Ông ấy đặt"

	para "bẫy khắp nơi"
	line "trong GYM."

	para "Nhưng--he-he--bẫy"
	line "hiện không hoạt"
	cont "động."

	para "Bạn sẽ không gặp"
	line "khó khăn khi đến"
	cont "gặp LT.SURGE."
	done

VermilionGymGuideWinText:
	text "Phù! Đó là một"
	line "trận đấu điện!"

	para "Nó khiến tôi thật"
	line "hồi hộp."
	done

VermilionGymTrashCanText:
	text "Không! Ở đây chỉ"
	line "có rác thôi."
	done

VermilionGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, VERMILION_CITY, 7
	warp_event  5, 17, VERMILION_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  1,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  1,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  1, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3, 15, BGEVENT_READ, VermilionGymStatue
	bg_event  6, 15, BGEVENT_READ, VermilionGymStatue

	def_object_events
	object_event  5,  2, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VermilionGymSurgeScript, -1
	object_event  8,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerGentlemanGregory, -1
	object_event  4,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 3, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGuitaristVincent, -1
	object_event  0, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerJugglerHorton, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, VermilionGymGuideScript, -1
