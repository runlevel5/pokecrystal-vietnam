	object_const_def
	const ECRUTEAKGYM_MORTY
	const ECRUTEAKGYM_SAGE1
	const ECRUTEAKGYM_SAGE2
	const ECRUTEAKGYM_GRANNY1
	const ECRUTEAKGYM_GRANNY2
	const ECRUTEAKGYM_GYM_GUIDE
	const ECRUTEAKGYM_GRAMPS

EcruteakGym_MapScripts:
	def_scene_scripts
	scene_script EcruteakGymForcedToLeaveScene, SCENE_ECRUTEAKGYM_FORCED_TO_LEAVE
	scene_script EcruteakGymNoopScene,          SCENE_ECRUTEAKGYM_NOOP

	def_callbacks

EcruteakGymForcedToLeaveScene:
	sdefer EcruteakGymClosed
	end

EcruteakGymNoopScene:
	end

EcruteakGymMortyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .FightDone
	writetext MortyIntroText
	waitbutton
	closetext
	winlosstext MortyWinLossText, 0
	loadtrainer MORTY, MORTY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MORTY
	opentext
	writetext Text_ReceivedFogBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FOGBADGE
	readvar VAR_BADGES
	scall EcruteakGymActivateRockets
	setmapscene ECRUTEAK_TIN_TOWER_ENTRANCE, SCENE_ECRUTEAKTINTOWERENTRANCE_NOOP
	setevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_RANG_CLEAR_BELL_2
.FightDone:
	checkevent EVENT_GOT_TM30_SHADOW_BALL
	iftrue .GotShadowBall
	setevent EVENT_BEAT_SAGE_JEFFREY
	setevent EVENT_BEAT_SAGE_PING
	setevent EVENT_BEAT_MEDIUM_MARTHA
	setevent EVENT_BEAT_MEDIUM_GRACE
	writetext MortyText_FogBadgeSpeech
	promptbutton
	verbosegiveitem TM_SHADOW_BALL
	iffalse .NoRoomForShadowBall
	setevent EVENT_GOT_TM30_SHADOW_BALL
	writetext MortyText_ShadowBallSpeech
	waitbutton
	closetext
	end

.GotShadowBall:
	writetext MortyFightDoneText
	waitbutton
.NoRoomForShadowBall:
	closetext
	end

EcruteakGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

EcruteakGymClosed:
	applymovement PLAYER, EcruteakGymPlayerStepUpMovement
	applymovement ECRUTEAKGYM_GRAMPS, EcruteakGymGrampsSlowStepDownMovement
	opentext
	writetext EcruteakGymClosedText
	waitbutton
	closetext
	follow PLAYER, ECRUTEAKGYM_GRAMPS
	applymovement PLAYER, EcruteakGymPlayerSlowStepDownMovement
	stopfollow
	special FadeOutToWhite
	playsound SFX_ENTER_DOOR
	waitsfx
	warp ECRUTEAK_CITY, 6, 27
	end

TrainerSageJeffrey:
	trainer SAGE, JEFFREY, EVENT_BEAT_SAGE_JEFFREY, SageJeffreySeenText, SageJeffreyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJeffreyAfterBattleText
	waitbutton
	closetext
	end

TrainerSagePing:
	trainer SAGE, PING, EVENT_BEAT_SAGE_PING, SagePingSeenText, SagePingBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SagePingAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumMartha:
	trainer MEDIUM, MARTHA, EVENT_BEAT_MEDIUM_MARTHA, MediumMarthaSeenText, MediumMarthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumMarthaAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumGrace:
	trainer MEDIUM, GRACE, EVENT_BEAT_MEDIUM_GRACE, MediumGraceSeenText, MediumGraceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumGraceAfterBattleText
	waitbutton
	closetext
	end

EcruteakGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .EcruteakGymGuideWinScript
	writetext EcruteakGymGuideText
	waitbutton
	closetext
	end

.EcruteakGymGuideWinScript:
	writetext EcruteakGymGuideWinText
	waitbutton
	closetext
	end

EcruteakGymStatue:
	checkflag ENGINE_FOGBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, MORTY, MORTY1
	jumpstd GymStatue2Script

EcruteakGymPlayerStepUpMovement:
	step UP
	step_end

EcruteakGymPlayerSlowStepDownMovement:
	fix_facing
	slow_step DOWN
	remove_fixed_facing
	step_end

EcruteakGymGrampsSlowStepDownMovement:
	slow_step DOWN
	step_end

MortyIntroText:
	text "Bạn đã đến."
	line "Tốt lắm."

	para "Tại ECRUTEAK này,"
	line "#MON được tôn"
	cont "kính."

	para "Người ta nói rằng"
	line "một #MON màu"

	para "cầu vồng sẽ xuất"
	line "hiện trước một"

	para "HLV thực sự"
	line "mạnh mẽ."

	para "Ta tin vào truyền"
	line "thuyết đó, nên ta"

	para "đã bí mật luyện"
	line "tập ở đây suốt"
	cont "đời."

	para "Kết quả là, ta có"
	line "thể thấy những gì"
	cont "người khác không."

	para "Chỉ cần thêm một"
	line "chút nữa…"

	para "Với một chút nữa,"
	line "ta có thể thấy"

	para "tương lai mà ta"
	line "gặp #MON màu"
	cont "cầu vồng."

	para "Bạn sẽ giúp ta"
	line "đạt đến tầm cao"
	cont "đó!"
	done

MortyWinLossText:
	text "Ta vẫn chưa đủ"
	line "giỏi…"

	para "Được rồi. HUY"
	line "HIỆU này là của"
	cont "bạn."
	done

Text_ReceivedFogBadge:
	text "<PLAYER> đã nhận"
	line "FOGBADGE."
	done

MortyText_FogBadgeSpeech:
	text "Với FOGBADGE,"
	line "#MON đến L50"

	para "sẽ nghe lời"
	line "bạn."

	para "Ngoài ra, #MON"
	line "biết LƯỚT SÓNG"

	para "có thể dùng chiêu"
	line "đó lúc nào cũng"
	cont "được."

	para "Ta muốn tặng bạn"
	line "thứ này nữa."
	done

MortyText_ShadowBallSpeech:
	text "Đó là BÓNG MA."
	line "Nó gây sát thương"

	para "và có thể giảm"
	line "SPCL.DEF."

	para "Hãy dùng nếu bạn"
	line "thấy phù hợp."
	done

MortyFightDoneText:
	text "Ta hiểu rồi…"

	para "Hành trình của"
	line "bạn đã đưa bạn"
	cont "đến nơi xa xôi."

	para "Và bạn đã chứng"
	line "kiến nhiều hơn"
	cont "ta."

	para "Ta ghen tị với"
	line "bạn vì điều đó…"
	done

SageJeffreySeenText:
	text "Tôi đã trải qua"
	line "mùa xuân với"
	cont "#MON của tôi."

	para "Rồi mùa hè, mùa"
	line "thu và mùa đông…"

	para "Rồi xuân lại đến."
	line "Chúng tôi đã sống"

	para "cùng nhau rất"
	line "lâu."
	done

SageJeffreyBeatenText:
	text "Thắng và thua, tôi"
	line "đều đã trải qua."
	done

SageJeffreyAfterBattleText:
	text "#MON từ đâu"
	line "mà đến?"
	done

SagePingSeenText:
	text "Bạn có thể gây"
	line "sát thương cho"
	cont "#MON của ta?"
	done

SagePingBeatenText:
	text "À! Giỏi lắm!"
	done

SagePingAfterBattleText:
	text "Chúng tôi chỉ"
	line "dùng #MON"
	cont "hệ ma."

	para "Không đòn bình"
	line "thường nào có thể"
	cont "hại được chúng!"
	done

MediumMarthaSeenText:
	text "Ta sẽ thắng!"
	done

MediumMarthaBeatenText:
	text "Ta, ta, ta thua!"
	done

MediumMarthaAfterBattleText:
	text "Ai muốn thắng"
	line "nhất--sẽ thắng!"
	done

MediumGraceSeenText:
	text "Bị bối rối bởi"
	line "sàn vô hình à?"

	para "Đánh bại ta nếu"
	line "muốn gợi ý!"
	done

MediumGraceBeatenText:
	text "Gì-gì cơ?"
	done

MediumGraceAfterBattleText:
	text "Được rồi. Ta sẽ"
	line "nói bí mật của"

	para "sàn vô hình."

	para "Con đường nằm"
	line "ngay trước mắt!"
	done

EcruteakGymGuideText:
	text "Các HLV ở đây có"
	line "động cơ bí mật."

	para "Nếu bạn thắng, họ"
	line "có thể tiết lộ"

	para "bí mật sâu xa về"
	line "ECRUTEAK."
	done

EcruteakGymGuideWinText:
	text "Chà, <PLAYER>."
	line "Bạn giỏi quá!"

	para "Tôi đã co rúm ở"
	line "góc vì quá sợ!"
	done

EcruteakGymClosedText:
	text "MORTY, T.LĨNH"
	line "GYM, đang vắng."

	para "Xin lỗi, nhưng"
	line "bạn phải đi thôi."

	para "Hohohoho."
	done

EcruteakGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, ECRUTEAK_CITY, 10
	warp_event  5, 17, ECRUTEAK_CITY, 10
	warp_event  4, 14, ECRUTEAK_GYM, 4
	warp_event  2,  4, ECRUTEAK_GYM, 3
	warp_event  3,  4, ECRUTEAK_GYM, 3
	warp_event  4,  4, ECRUTEAK_GYM, 3
	warp_event  4,  5, ECRUTEAK_GYM, 3
	warp_event  6,  7, ECRUTEAK_GYM, 3
	warp_event  7,  4, ECRUTEAK_GYM, 3
	warp_event  2,  6, ECRUTEAK_GYM, 3
	warp_event  3,  6, ECRUTEAK_GYM, 3
	warp_event  4,  6, ECRUTEAK_GYM, 3
	warp_event  5,  6, ECRUTEAK_GYM, 3
	warp_event  7,  6, ECRUTEAK_GYM, 3
	warp_event  7,  7, ECRUTEAK_GYM, 3
	warp_event  4,  8, ECRUTEAK_GYM, 3
	warp_event  5,  8, ECRUTEAK_GYM, 3
	warp_event  6,  8, ECRUTEAK_GYM, 3
	warp_event  7,  8, ECRUTEAK_GYM, 3
	warp_event  2,  8, ECRUTEAK_GYM, 3
	warp_event  2,  9, ECRUTEAK_GYM, 3
	warp_event  2, 10, ECRUTEAK_GYM, 3
	warp_event  2, 11, ECRUTEAK_GYM, 3
	warp_event  4, 10, ECRUTEAK_GYM, 3
	warp_event  5, 10, ECRUTEAK_GYM, 3
	warp_event  2, 12, ECRUTEAK_GYM, 3
	warp_event  3, 12, ECRUTEAK_GYM, 3
	warp_event  4, 12, ECRUTEAK_GYM, 3
	warp_event  5, 12, ECRUTEAK_GYM, 3
	warp_event  7, 10, ECRUTEAK_GYM, 3
	warp_event  7, 11, ECRUTEAK_GYM, 3
	warp_event  7, 12, ECRUTEAK_GYM, 3
	warp_event  7, 13, ECRUTEAK_GYM, 3

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, EcruteakGymStatue
	bg_event  6, 15, BGEVENT_READ, EcruteakGymStatue

	def_object_events
	object_event  5,  1, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, EcruteakGymMortyScript, -1
	object_event  2,  7, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSageJeffrey, -1
	object_event  3, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSagePing, -1
	object_event  7,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerMediumMartha, -1
	object_event  7,  9, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerMediumGrace, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakGymGuideScript, -1
	object_event  4, 14, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_GYM_GRAMPS
