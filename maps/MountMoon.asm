	object_const_def
	const MOUNTMOON_RIVAL

MountMoon_MapScripts:
	def_scene_scripts
	scene_script MountMoonRivalEncounterScene, SCENE_MOUNTMOON_RIVAL_BATTLE
	scene_script MountMoonNoopScene,           SCENE_MOUNTMOON_NOOP

	def_callbacks

MountMoonRivalEncounterScene:
	sdefer MountMoonRivalBattleScript
	end

MountMoonNoopScene:
	end

MountMoonRivalBattleScript:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	applymovement MOUNTMOON_RIVAL, MountMoonRivalMovementBefore
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext MountMoonRivalTextBefore
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext MountMoonRivalTextWin, MountMoonRivalTextLoss
	setlasttalked MOUNTMOON_RIVAL
	loadtrainer RIVAL2, RIVAL2_1_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.Totodile:
	winlosstext MountMoonRivalTextWin, MountMoonRivalTextLoss
	setlasttalked MOUNTMOON_RIVAL
	loadtrainer RIVAL2, RIVAL2_1_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.Chikorita:
	winlosstext MountMoonRivalTextWin, MountMoonRivalTextLoss
	setlasttalked MOUNTMOON_RIVAL
	loadtrainer RIVAL2, RIVAL2_1_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.FinishBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext MountMoonRivalTextAfter
	waitbutton
	closetext
	applymovement MOUNTMOON_RIVAL, MountMoonRivalMovementAfter
	disappear MOUNTMOON_RIVAL
	setscene SCENE_MOUNTMOON_NOOP
	setevent EVENT_BEAT_RIVAL_IN_MT_MOON
	playmapmusic
	end

MountMoonRivalMovementBefore:
	step LEFT
	step LEFT
	step LEFT
	step_end

MountMoonRivalMovementAfter:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MountMoonRivalTextBefore:
	text "<……> <……> <……>"

	para "Lâu rồi không gặp,"
	line "<PLAYER>."

	para "…Từ khi thua bạn,"
	line "tôi đã suy nghĩ"

	para "về điều tôi thiếu"
	line "với #MON…"

	para "Và chúng tôi đã"
	line "tìm ra câu trả lời."

	para "<PLAYER>, giờ ta sẽ"
	line "cho mày thấy!"
	done

MountMoonRivalTextWin:
	text "<……> <……> <……>"

	para "Tôi nghĩ tôi đã"
	line "nuôi #MON trở"

	para "thành mạnh nhất"
	line "có thể…"

	para "…Nhưng vẫn chưa"
	line "đủ…"
	done

MountMoonRivalTextAfter:
	text "<……> <……> <……>"

	para "…Mày thắng, rõ"
	line "ràng và minh bạch."

	para "Tao thừa nhận. Nhưng"
	line "đây không phải"
	cont "kết thúc."

	para "Tao sẽ trở thành"
	line "HLV #MON vĩ đại"
	cont "nhất."

	para "Vì những thằng"
	line "này ủng hộ tao."

	para "…Nghe này, <PLAYER>."

	para "Một ngày nào đó"
	line "tao sẽ chứng minh"

	para "tao giỏi thế nào"
	line "bằng cách đánh"
	cont "bại mày."
	done

MountMoonRivalTextLoss:
	text "<……> <……> <……>"

	para "Tao đã trả nợ"
	line "cho mày rồi."

	para "Với #MON của"
	line "tao, tao sẽ đánh"

	para "bại VÔ ĐỊCH và"
	line "trở thành HLV vĩ"
	cont "đại nhất thế giới."
	done

MountMoon_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  3, ROUTE_3, 1
	warp_event 15, 15, ROUTE_4, 1
	warp_event 13,  3, MOUNT_MOON, 7
	warp_event 15, 11, MOUNT_MOON, 8
	warp_event 25,  5, MOUNT_MOON_SQUARE, 1
	warp_event 25, 15, MOUNT_MOON_SQUARE, 2
	warp_event 25,  3, MOUNT_MOON, 3
	warp_event 25, 13, MOUNT_MOON, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  3, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MT_MOON_RIVAL
