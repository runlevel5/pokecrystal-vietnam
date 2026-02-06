	object_const_def
	const TEAMROCKETBASEB3F_LANCE
	const TEAMROCKETBASEB3F_ROCKET1
	const TEAMROCKETBASEB3F_MOLTRES
	const TEAMROCKETBASEB3F_ROCKET_GIRL
	const TEAMROCKETBASEB3F_ROCKET2
	const TEAMROCKETBASEB3F_SCIENTIST1
	const TEAMROCKETBASEB3F_SCIENTIST2
	const TEAMROCKETBASEB3F_ROCKET3
	const TEAMROCKETBASEB3F_RIVAL
	const TEAMROCKETBASEB3F_POKE_BALL1
	const TEAMROCKETBASEB3F_POKE_BALL2
	const TEAMROCKETBASEB3F_POKE_BALL3
	const TEAMROCKETBASEB3F_POKE_BALL4
	const TEAMROCKETBASEB3F_POKE_BALL5

TeamRocketBaseB3F_MapScripts:
	def_scene_scripts
	scene_script TeamRocketBaseB3FLanceGetsPasswordScene, SCENE_TEAMROCKETBASEB3F_LANCE_GETS_PASSWORD
	scene_script TeamRocketBaseB3FNoop1Scene,             SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER
	scene_script TeamRocketBaseB3FNoop2Scene,             SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS
	scene_script TeamRocketBaseB3FNoop3Scene,             SCENE_TEAMROCKETBASEB3F_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, TeamRocketBaseB3FCheckGiovanniDoorCallback

TeamRocketBaseB3FLanceGetsPasswordScene:
	sdefer LanceGetPasswordScript
	end

TeamRocketBaseB3FNoop1Scene:
	end

TeamRocketBaseB3FNoop2Scene:
	end

TeamRocketBaseB3FNoop3Scene:
	end

TeamRocketBaseB3FCheckGiovanniDoorCallback:
	checkevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	iftrue .OpenSesame
	endcallback

.OpenSesame:
	changeblock 10, 8, $07 ; floor
	endcallback

LanceGetPasswordScript:
	turnobject PLAYER, LEFT
	pause 5
	turnobject TEAMROCKETBASEB3F_MOLTRES, RIGHT
	pause 20
	applymovement TEAMROCKETBASEB3F_LANCE, RocketBaseLanceApproachesPlayerMovement
	opentext
	writetext LanceGetPasswordText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB3F_LANCE, RocketBaseLanceLeavesMovement
	disappear TEAMROCKETBASEB3F_LANCE
	setscene SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER
	end

RocketBaseRival:
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	appear TEAMROCKETBASEB3F_RIVAL
	applymovement TEAMROCKETBASEB3F_RIVAL, RocketBaseRivalEnterMovement
	turnobject PLAYER, LEFT
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext RocketBaseRivalText
	waitbutton
	closetext
	playsound SFX_TACKLE
	applymovement PLAYER, RocketBaseRivalShovesPlayerMovement
	applymovement TEAMROCKETBASEB3F_RIVAL, RocketBaseRivalLeavesMovement
	disappear TEAMROCKETBASEB3F_RIVAL
	setscene SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS
	special RestartMapMusic
	end

TeamRocketBaseB3FRocketScript:
	jumptextfaceplayer TeamRocketBaseB3FRocketText

RocketBaseBossLeft:
	applymovement PLAYER, RocketBasePlayerApproachesBossLeftMovement
	sjump RocketBaseBoss

RocketBaseBossRight:
	applymovement PLAYER, RocketBasePlayerApproachesBossRightMovement
RocketBaseBoss:
	pause 30
	showemote EMOTE_SHOCK, TEAMROCKETBASEB3F_ROCKET1, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject TEAMROCKETBASEB3F_ROCKET1, DOWN
	opentext
	writetext ExecutiveM4BeforeText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB3F_ROCKET1, RocketBaseBossApproachesPlayerMovement
	winlosstext ExecutiveM4BeatenText, 0
	setlasttalked TEAMROCKETBASEB3F_ROCKET1
	loadtrainer EXECUTIVEM, EXECUTIVEM_4
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_4
	opentext
	writetext ExecutiveM4AfterText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB3F_ROCKET1, RocketBaseBossHitsTableMovement
	playsound SFX_TACKLE
	applymovement TEAMROCKETBASEB3F_ROCKET1, RocketBaseBossLeavesMovement
	disappear TEAMROCKETBASEB3F_ROCKET1
	setscene SCENE_TEAMROCKETBASEB3F_NOOP
	end

RocketBaseMurkrow:
	opentext
	writetext RocketBaseMurkrowText
	waitbutton
	closetext
	setevent EVENT_LEARNED_HAIL_GIOVANNI
	end

SlowpokeTailGrunt:
	trainer GRUNTF, GRUNTF_5, EVENT_BEAT_ROCKET_GRUNTF_5, GruntF5SeenText, GruntF5BeatenText, 0, GruntF5Script

GruntF5Script:
	endifjustbattled
	opentext
	writetext GruntF5AfterBattleText
	waitbutton
	closetext
	setevent EVENT_LEARNED_SLOWPOKETAIL
	end

RaticateTailGrunt:
	trainer GRUNTM, GRUNTM_28, EVENT_BEAT_ROCKET_GRUNTM_28, GruntM28SeenText, GruntM28BeatenText, 0, GruntM28Script

GruntM28Script:
	endifjustbattled
	opentext
	writetext GruntM28AfterBattleText
	waitbutton
	closetext
	setevent EVENT_LEARNED_RATICATE_TAIL
	end

TrainerScientistRoss:
	trainer SCIENTIST, ROSS, EVENT_BEAT_SCIENTIST_ROSS, ScientistRossSeenText, ScientistRossBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistRossAfterBattleText
	waitbutton
	closetext
	end

TrainerScientistMitch:
	trainer SCIENTIST, MITCH, EVENT_BEAT_SCIENTIST_MITCH, ScientistMitchSeenText, ScientistMitchBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistMitchAfterBattleText
	waitbutton
	closetext
	end

TeamRocketBaseB3FLockedDoor:
	conditional_event EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE, .Script

.Script:
	opentext
	checkevent EVENT_LEARNED_SLOWPOKETAIL
	iffalse .NeedsPassword
	checkevent EVENT_LEARNED_RATICATE_TAIL
	iffalse .NeedsPassword
	sjump .OpenSesame

.NeedsPassword:
	writetext TeamRocketBaseB3FLockedDoorNeedsPasswordText
	waitbutton
	closetext
	end

.OpenSesame:
	writetext TeamRocketBaseB3FLockedDoorOpenSesameText
	waitbutton
	playsound SFX_ENTER_DOOR
	changeblock 10, 8, $07 ; floor
	refreshmap
	closetext
	setevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	waitsfx
	end

TeamRocketBaseB3FOathScript:
	jumpstd TeamRocketOathScript

TeamRocketBaseB3FProtein:
	itemball PROTEIN

TeamRocketBaseB3FXSpecial:
	itemball X_SPECIAL

TeamRocketBaseB3FFullHeal:
	itemball FULL_HEAL

TeamRocketBaseB3FIceHeal:
	itemball ICE_HEAL

TeamRocketBaseB3FUltraBall:
	itemball ULTRA_BALL

RocketBaseLanceApproachesPlayerMovement:
	step RIGHT
	step_end

RocketBaseLanceLeavesMovement:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

RocketBasePlayerApproachesBossLeftMovement:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	turn_head UP
	step_end

RocketBasePlayerApproachesBossRightMovement:
	step UP
	step UP
	step LEFT
	step UP
	step LEFT
	step LEFT
	turn_head UP
	step_end

RocketBaseBossApproachesPlayerMovement:
	step DOWN
	step_end

RocketBaseBossHitsTableMovement:
	big_step RIGHT
	big_step RIGHT
	step_end

RocketBaseBossLeavesMovement:
	fix_facing
	fast_jump_step LEFT
	remove_fixed_facing
	step_sleep 8
	step_sleep 8
	slow_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

RocketBaseRivalEnterMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RocketBaseRivalLeavesMovement:
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

RocketBaseRivalShovesPlayerMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

LanceGetPasswordText:
	text "LANCE: Cần hai"
	line "mật khẩu để vào"

	para "phòng của tên"
	line "trùm."

	para "Chỉ vài tên"
	line "ROCKET biết mật"
	cont "khẩu đó."

	para "Tên ROCKET kia đã"
	line "tử tế cho ta"
	cont "biết."

	para "<PLAY_G>, đi lấy"
	line "mật khẩu thôi."
	done

TeamRocketBaseB3FRocketText:
	text "Urrggh… Gã mặc"
	line "áo choàng đó"
	cont "mạnh quá…"
	done

RocketBaseRivalText:
	text "…"

	para "Tao đã nói với"
	line "mày là tao sẽ"

	para "tiêu diệt"
	line "ĐỘI ROCKET chưa?"

	para "…Cho tao hỏi, gã"
	line "mặc áo choàng"

	para "dùng #MON rồng"
	line "đó là ai?"

	para "#MON của tao"
	line "không địch nổi."

	para "Tao không quan"
	line "tâm việc thua."

	para "Tao có thể thắng"
	line "hắn bằng cách có"

	para "#MON mạnh"
	line "hơn."

	para "Điều hắn nói mới"
	line "làm tao bực…"

	para "Hắn nói tao không"
	line "yêu thương và tin"

	para "tưởng #MON"
	line "của tao đủ."

	para "Tao tức vì thua"
	line "một kẻ ủy mị"
	cont "như hắn."

	para "…Hừ! Tao không"
	line "có thời gian cho"
	cont "mày đâu!"
	done

ExecutiveM4BeforeText:
	text "Gì? Ngươi là ai?"
	line "Đây là văn phòng"

	para "của thủ lĩnh"
	line "GIOVANNI."

	para "Kể từ khi giải"
	line "tán ĐỘI ROCKET"

	para "ba năm trước, ông"
	line "ấy đang tu luyện."

	para "Nhưng chúng tôi"
	line "chắc ông ấy sẽ"

	para "quay lại chỉ huy"
	line "một ngày nào đó."

	para "Đó là lý do"
	line "chúng tôi canh"
	cont "gác ở đây."

	para "Ta không để ai"
	line "quấy rầy nơi"
	cont "này!"
	done

ExecutiveM4BeatenText:
	text "Ta… Ta không làm"
	line "được gì…"

	para "GIOVANNI, xin"
	line "tha thứ cho ta…"
	done

ExecutiveM4AfterText:
	text "Không, ta không"
	line "thể để điều này"
	cont "ảnh hưởng."

	para "Ta phải thông báo"
	line "cho những người"
	cont "khác…"
	done

RocketBaseMurkrowText:
	text "MURKROW: Mật"
	line "khẩu là…"

	para "HAIL GIOVANNI."
	done

GruntF5SeenText:
	text "Tôi có biết mật"
	line "khẩu không ư?"

	para "Có thể."

	para "Nhưng kẻ yếu sẽ"
	line "không có được!"
	done

GruntF5BeatenText:
	text "Được rồi. Dừng"
	line "lại. Tôi sẽ nói."
	done

GruntF5AfterBattleText:
	text "Mật khẩu phòng"
	line "của trùm là"

	para "SLOWPOKETAIL."

	para "Nhưng vô dụng"
	line "nếu không có cả"
	cont "hai mật khẩu."
	done

GruntM28SeenText:
	text "Hức-hức-hức!"

	para "Mày đòi thách đấu"
	line "tao sao?"

	para "Ha! Mày điên,"
	line "nhưng có gan!"

	para "Tao thích điều"
	line "đó!"

	para "Nếu mày thắng"
	line "được tao, tao sẽ"

	para "cho mày mật khẩu"
	line "phòng của trùm!"
	done

GruntM28BeatenText:
	text "Hức-hức-hức!"
	line "Mày giỏi đấy!"
	done

GruntM28AfterBattleText:
	text "Hức-hức-hức!"

	para "Mật khẩu phòng"
	line "của trùm…"

	para "Ờ… Tao nghĩ là"
	line "RATICATE TAIL."
	done

ScientistRossSeenText:
	text "Tôi từng làm ở"
	line "SILPH, nhưng giờ"

	para "tôi điều hành"
	line "nghiên cứu cho"
	cont "ĐỘI ROCKET."

	para "Đứa trẻ tọc mạch"
	line "như ngươi cần"
	cont "bị trừng phạt."
	done

ScientistRossBeatenText:
	text "Chỉ là lỗi chiến"
	line "thuật nhỏ…"
	done

ScientistRossAfterBattleText:
	text "Sóng radio làm"
	line "#MON phát"
	cont "điên…"

	para "Thí nghiệm của"
	line "tôi thành công"
	cont "hoàn toàn."

	para "Tôi chắc chắn"
	line "được thăng chức."

	para "Thua trận này"
	line "chẳng nghĩa lý"
	cont "gì."
	done

ScientistMitchSeenText:
	text "Tôi không quan"
	line "tâm #MON bị"
	cont "hại vì thí"
	cont "nghiệm."
	done

ScientistMitchBeatenText:
	text "Suy nghĩ là thế"
	line "mạnh của tôi,"
	cont "không phải đấu."
	done

ScientistMitchAfterBattleText:
	text "Nếu chúng tôi"
	line "tăng công suất"

	para "sóng radio để"
	line "phát toàn quốc…"

	para "Chỉ nghĩ thôi"
	line "cũng phấn khích!"
	done

TeamRocketBaseB3FLockedDoorNeedsPasswordText:
	text "Cửa đóng rồi…"

	para "Cần hai mật khẩu"
	line "để mở."
	done

TeamRocketBaseB3FLockedDoorOpenSesameText:
	text "Cửa đóng rồi…"

	para "<PLAYER> đã nhập"
	line "hai mật khẩu."

	para "Cửa mở ra!"
	done

TeamRocketBaseB3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  2, TEAM_ROCKET_BASE_B2F, 2
	warp_event 27,  2, TEAM_ROCKET_BASE_B2F, 3
	warp_event  3,  6, TEAM_ROCKET_BASE_B2F, 4
	warp_event 27, 14, TEAM_ROCKET_BASE_B2F, 5

	def_coord_events
	coord_event 10,  8, SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS, RocketBaseBossLeft
	coord_event 11,  8, SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS, RocketBaseBossRight
	coord_event  8, 10, SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER, RocketBaseRival

	def_bg_events
	bg_event 10,  9, BGEVENT_IFNOTSET, TeamRocketBaseB3FLockedDoor
	bg_event 11,  9, BGEVENT_IFNOTSET, TeamRocketBaseB3FLockedDoor
	bg_event 10,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event 11,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event 12,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event 13,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  4, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  5, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  6, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  7, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript

	def_object_events
	object_event 25, 14, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LanceGetPasswordScript, EVENT_TEAM_ROCKET_BASE_B3F_LANCE_PASSWORDS
	object_event  8,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B3F_EXECUTIVE
	object_event  7,  2, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RocketBaseMurkrow, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 21,  7, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, SlowpokeTailGrunt, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  5, 14, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, RaticateTailGrunt, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 23, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerScientistRoss, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 11, 15, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerScientistMitch, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 24, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeamRocketBaseB3FRocketScript, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  4,  5, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_TEAM_ROCKET_BASE
	object_event  1, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FProtein, EVENT_TEAM_ROCKET_BASE_B3F_PROTEIN
	object_event  3, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FXSpecial, EVENT_TEAM_ROCKET_BASE_B3F_X_SPECIAL
	object_event 28,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FFullHeal, EVENT_TEAM_ROCKET_BASE_B3F_FULL_HEAL
	object_event 17,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FIceHeal, EVENT_TEAM_ROCKET_BASE_B3F_ICE_HEAL
	object_event 14, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FUltraBall, EVENT_TEAM_ROCKET_BASE_B3F_ULTRA_BALL
