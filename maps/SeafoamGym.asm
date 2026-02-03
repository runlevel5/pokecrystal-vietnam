	object_const_def
	const SEAFOAMGYM_BLAINE
	const SEAFOAMGYM_GYM_GUIDE

SeafoamGym_MapScripts:
	def_scene_scripts
	scene_script SeafoamGymNoopScene ; unusable

	def_callbacks

SeafoamGymNoopScene:
	end

SeafoamGymBlaineScript:
	faceplayer
	opentext
	checkflag ENGINE_VOLCANOBADGE
	iftrue .FightDone
	writetext BlaineIntroText
	waitbutton
	closetext
	winlosstext BlaineWinLossText, 0
	loadtrainer BLAINE, BLAINE1
	startbattle
	iftrue .ReturnAfterBattle
	appear SEAFOAMGYM_GYM_GUIDE
.ReturnAfterBattle:
	reloadmapafterbattle
	setevent EVENT_BEAT_BLAINE
	opentext
	writetext ReceivedVolcanoBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_VOLCANOBADGE
	writetext BlaineAfterBattleText
	waitbutton
	closetext
	end

.FightDone:
	writetext BlaineFightDoneText
	waitbutton
	closetext
	end

SeafoamGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_SEAFOAM_GYM_GUIDE_ONCE
	iftrue .TalkedToSeafoamGymGuideScript
	writetext SeafoamGymGuideWinText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_SEAFOAM_GYM_GUIDE_ONCE
	end

.TalkedToSeafoamGymGuideScript:
	writetext SeafoamGymGuideWinText2
	waitbutton
	closetext
	end

BlaineIntroText:
	text "BLAINE: Waaah!"

	para "GYM của ta ở"
	line "CINNABAR cháy rồi."

	para "#MON phun lửa"
	line "của ta và ta"

	para "vô gia cư vì"
	line "núi lửa."

	para "Waaah!"

	para "Nhưng ta đã trở"
	line "lại làm T.LĨNH"

	para "GYM ở đây trong"
	line "hang động này."

	para "Nếu ngươi thắng"
	line "ta, ta sẽ tặng"
	cont "ngươi HUY HIỆU."

	para "Ha! Ngươi nên có"
	line "TRỊ BỎNG sẵn đi!"
	done

BlaineWinLossText:
	text "BLAINE: Tuyệt."
	line "Ta đã cháy hết…"

	para "Ngươi xứng đáng"
	line "VOLCANOBADGE!"
	done

ReceivedVolcanoBadgeText:
	text "<PLAYER> nhận được"
	line "VOLCANOBADGE."
	done

BlaineAfterBattleText:
	text "BLAINE: Ta thua"
	line "lần này, nhưng ta"

	para "sẽ thắng vào"
	line "lần sau."

	para "Khi ta xây lại"
	line "CINNABAR GYM,"

	para "chúng ta phải"
	line "đấu lại nhé."
	done

BlaineFightDoneText:
	text "BLAINE: #MON"
	line "lửa của ta sẽ"

	para "mạnh hơn nữa."
	line "Ngươi cứ chờ xem!"
	done

SeafoamGymGuideWinText:
	text "Yo!"

	para "… Hả? Xong rồi"
	line "hả?"

	para "Xin lỗi, xin lỗi!"

	para "CINNABAR GYM biến"
	line "mất, nên tôi"

	para "không biết tìm"
	line "bạn ở đâu."

	para "Nhưng, này, bạn"
	line "khá mạnh dù không"

	para "có lời khuyên tôi"
	line "Tôi biết bạn sẽ"
	cont "thắng mà!"
	done

SeafoamGymGuideWinText2:
	text "#MON GYM có thể"
	line "ở bất cứ đâu"

	para "miễn là T.LĨNH"
	line "GYM có mặt ở đó."

	para "Không cần tòa nhà"
	line "làm gì cả."
	done

SeafoamGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, ROUTE_20, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SeafoamGymBlaineScript, -1
	object_event  6,  5, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamGymGuideScript, EVENT_SEAFOAM_GYM_GYM_GUIDE
