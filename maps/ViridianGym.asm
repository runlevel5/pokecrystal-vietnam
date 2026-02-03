	object_const_def
	const VIRIDIANGYM_BLUE
	const VIRIDIANGYM_GYM_GUIDE

ViridianGym_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianGymBlueScript:
	faceplayer
	opentext
	checkflag ENGINE_EARTHBADGE
	iftrue .FightDone
	writetext LeaderBlueBeforeText
	waitbutton
	closetext
	winlosstext LeaderBlueWinText, 0
	loadtrainer BLUE, BLUE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLUE
	opentext
	writetext Text_ReceivedEarthBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_EARTHBADGE
	writetext LeaderBlueAfterText
	waitbutton
	closetext
	end

.FightDone:
	writetext LeaderBlueEpilogueText
	waitbutton
	closetext
	end

ViridianGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BLUE
	iftrue .ViridianGymGuideWinScript
	writetext ViridianGymGuideText
	waitbutton
	closetext
	end

.ViridianGymGuideWinScript:
	writetext ViridianGymGuideWinText
	waitbutton
	closetext
	end

ViridianGymStatue:
	checkflag ENGINE_EARTHBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script

.Beaten:
	gettrainername STRING_BUFFER_4, BLUE, BLUE1
	jumpstd GymStatue2Script

LeaderBlueBeforeText:
	text "BLUE: Yo! Cuối"
	line "cùng cũng tới hả?"

	para "Tao không có hứng"
	line "ở CINNABAR,"

	para "nhưng giờ tao sẵn"
	line "sàng đấu với mày."

	para "…"

	para "Mày bảo tao rằng"
	line "mày chinh phục"
	cont "hết GYM ở JOHTO?"

	para "Heh! GYM của"
	line "JOHTO chắc yếu"
	cont "lắm nhỉ."

	para "Này, đừng lo về"
	line "điều đó."

	para "Tao sẽ biết mày"
	line "giỏi hay không"

	para "bằng cách đấu với"
	line "mày ngay bây giờ."

	para "Sẵn sàng chưa,"
	line "V.ĐỊCH JOHTO?"
	done

LeaderBlueWinText:
	text "BLUE: Cái gì?"

	para "Sao tao lại thua"
	line "mày được chứ?"

	para "…"

	para "Tch, được rồi…"
	line "Đây, cầm lấy cái"
	cont "này--EARTHBADGE."
	done

Text_ReceivedEarthBadge:
	text "<PLAYER> nhận được"
	line "EARTHBADGE."
	done

LeaderBlueAfterText:
	text "BLUE: …"

	para "Được rồi, tao đã"
	line "sai. Mày là thật."

	para "Mày là một HLV"
	line "giỏi đấy."

	para "Nhưng tao sẽ"
	line "thắng mày một"
	cont "ngày nào đó."

	para "Đừng có quên"
	line "điều đó!"
	done

LeaderBlueEpilogueText:
	text "BLUE: Nghe đây."

	para "Mày không được"
	line "thua cho đến khi"
	cont "tao thắng mày."
	cont "Hiểu chưa?"
	done

ViridianGymGuideText:
	text "Yo, V.ĐỊCH"
	line "tương lai!"

	para "Mọi thứ ổn chứ?"
	line "Có vẻ bạn đang"
	cont "thắng liên tục."

	para "T.LĨNH GYM là một"
	line "người đã đấu với"

	para "V.ĐỊCH cách đây"
	line "ba năm."

	para "Ông ấy không yếu."

	para "Hãy cố gắng hết"
	line "sức nhé!"
	done

ViridianGymGuideWinText:
	text "Ôi, bạn thật sự"
	line "quá mạnh…"

	para "Đó là một trận"
	line "đấu đầy cảm hứng"

	para "Nó khiến tôi rơi"
	line "nước mắt luôn."
	done

ViridianGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, VIRIDIAN_CITY, 1
	warp_event  5, 17, VIRIDIAN_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, ViridianGymStatue
	bg_event  6, 13, BGEVENT_READ, ViridianGymStatue

	def_object_events
	object_event  5,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianGymBlueScript, EVENT_VIRIDIAN_GYM_BLUE
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianGymGuideScript, EVENT_VIRIDIAN_GYM_BLUE
