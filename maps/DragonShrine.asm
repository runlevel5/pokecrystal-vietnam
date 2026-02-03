	object_const_def
	const DRAGONSHRINE_ELDER1
	const DRAGONSHRINE_ELDER2
	const DRAGONSHRINE_ELDER3
	const DRAGONSHRINE_CLAIR

DragonShrine_MapScripts:
	def_scene_scripts
	scene_script DragonShrineTakeTestScene, SCENE_DRAGONSHRINE_TAKE_TEST
	scene_script DragonShrineNoopScene,     SCENE_DRAGONSHRINE_NOOP

	def_callbacks

DragonShrineTakeTestScene:
	sdefer DragonShrineTakeTestScript
	end

DragonShrineNoopScene:
	end

DragonShrineTakeTestScript:
	applymovement PLAYER, DragonShrinePlayerWalkInMovement
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderStepDownMovement
	opentext
	writetext DragonShrineElderGreetingText
	promptbutton
.Question1:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	writetext DragonShrineQuestion1Text
	promptbutton
	loadmenu DragonShrineQuestion1_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RightAnswer
	ifequal 2, .WrongAnswer
	ifequal 3, .RightAnswer
	end

.Question2:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	writetext DragonShrineQuestion2Text
	promptbutton
	loadmenu DragonShrineQuestion2_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RightAnswer
	ifequal 2, .RightAnswer
	ifequal 3, .WrongAnswer
.Question3:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	writetext DragonShrineQuestion3Text
	promptbutton
	loadmenu DragonShrineQuestion3_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .WrongAnswer
	ifequal 2, .RightAnswer
	ifequal 3, .RightAnswer
.Question4:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	writetext DragonShrineQuestion4Text
	promptbutton
	loadmenu DragonShrineQuestion4_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RightAnswer
	ifequal 2, .WrongAnswer
	ifequal 3, .RightAnswer
.Question5:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	writetext DragonShrineQuestion5Text
	promptbutton
	loadmenu DragonShrineQuestion5_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .WrongAnswer
	ifequal 2, .RightAnswer
	ifequal 3, .WrongAnswer
.RightAnswer:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	iftrue .PassedTheTest
	writetext DragonShrineRightAnswerText
	promptbutton
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iftrue .Question5
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	iftrue .Question4
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .Question3
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .Question2
.WrongAnswer:
	closetext
	turnobject DRAGONSHRINE_ELDER1, LEFT
	opentext
	writetext DragonShrineWrongAnswerText1
	waitbutton
	closetext
	turnobject DRAGONSHRINE_ELDER1, DOWN
	opentext
	writetext DragonShrineWrongAnswerText2
	waitbutton
	closetext
	setevent EVENT_ANSWERED_DRAGON_MASTER_QUIZ_WRONG
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	iftrue .Question5
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iftrue .Question4
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	iftrue .Question3
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .Question2
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .Question1
.PassedTheTest:
	writetext DragonShrinePassedTestText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_CLAIR
	appear DRAGONSHRINE_CLAIR
	waitsfx
	turnobject PLAYER, DOWN
	pause 30
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairWalkInMovement
	turnobject DRAGONSHRINE_CLAIR, RIGHT
	turnobject PLAYER, LEFT
	turnobject DRAGONSHRINE_ELDER1, LEFT
	opentext
	writetext DragonShrineClairYouPassedText
	waitbutton
	closetext
	special FadeOutMusic
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairBigStepLeftMovement
	opentext
	writetext DragonShrineClairThatCantBeText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairSlowStepLeftMovement
	opentext
	writetext DragonShrineClairYoureLyingText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkToClairMovement
	turnobject DRAGONSHRINE_CLAIR, UP
	opentext
	writetext DragonShrineMustIInformLanceText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, DRAGONSHRINE_CLAIR, 15
	opentext
	writetext DragonShrineIUnderstandText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairTwoSlowStepsRightMovement
	opentext
	writetext DragonShrineHereRisingBadgeText
	waitbutton
	setflag ENGINE_RISINGBADGE
	playsound SFX_GET_BADGE
	waitsfx
	special RestartMapMusic
	specialphonecall SPECIALCALL_MASTERBALL
	setscene SCENE_DRAGONSHRINE_NOOP
	setmapscene DRAGONS_DEN_B1F, SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM
	writetext DragonShrinePlayerReceivedRisingBadgeText
	promptbutton
	writetext DragonShrineRisingBadgeExplanationText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkAway1Movement
	turnobject DRAGONSHRINE_CLAIR, UP
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkAway2Movement
	turnobject PLAYER, UP
	opentext
	writetext DragonShrineElderScoldsClairText
	waitbutton
	closetext
	opentext
	writetext DragonShrineSpeechlessText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairWalkOutMovement
	playsound SFX_ENTER_DOOR
	disappear DRAGONSHRINE_CLAIR
	waitsfx
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

DragonShrineElder1Script:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .DontGiveDratiniYet
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	iftrue .ReceivedDratini
	checkevent EVENT_GOT_DRATINI
	iffalse .GiveDratini
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iftrue .BeatRivalInMtMoon
	writetext DragonShrineClairsGrandfatherText
	waitbutton
	closetext
	end

.GiveDratini:
	writetext DragonShrineTakeThisDratiniText
	waitbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	writetext DragonShrinePlayerReceivedDratiniText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke DRATINI, 15
	checkevent EVENT_ANSWERED_DRAGON_MASTER_QUIZ_WRONG
	special GiveDratini
	setevent EVENT_GOT_DRATINI
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	writetext DragonShrineSymbolicDragonText
	waitbutton
	closetext
	end

.PartyFull:
	writetext DragonShrinePartyFullText
	waitbutton
	closetext
	end

.BeatRivalInMtMoon:
	writetext DragonShrineRivalIsInTrainingText
	waitbutton
	closetext
	end

.DontGiveDratiniYet:
	writetext DragonShrineComeAgainText
	waitbutton
	closetext
	end

.ReceivedDratini:
	writetext DragonShrineSymbolicDragonText
	waitbutton
	closetext
	end

DragonShrineElder2Script:
	faceplayer
	opentext
	writetext DragonShrineElder2Text
	waitbutton
	closetext
	end

DragonShrineElder3Script:
	faceplayer
	opentext
	writetext DragonShrineElder3Text
	waitbutton
	closetext
	end

DragonShrineQuestion1_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 8, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Bạn bè@"
	db "Tay sai@"
	db "Tri kỷ@"

DragonShrineQuestion2_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 9, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Chiến thuật@"
	db "Nuôi dưỡng@"
	db "Gian lận@"

DragonShrineQuestion3_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 5, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Người yếu@"
	db "Người mạnh@"
	db "Bất kỳ ai@"

DragonShrineQuestion4_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 8, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Tình yêu@"
	db "Bạo lực@"
	db "Kiến thức@"

DragonShrineQuestion5_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 12, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Mạnh@"
	db "Cả hai@"
	db "Yếu@"

DragonShrinePlayerWalkInMovement:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

DragonShrineElderStepDownMovement:
	slow_step DOWN
	step_end

DragonShrineElderWalkToClairMovement:
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	turn_head DOWN
	step_end

DragonShrineElderWalkAway1Movement:
	slow_step RIGHT
	slow_step RIGHT
	step_end

DragonShrineElderWalkAway2Movement:
	slow_step RIGHT
	turn_head DOWN
	step_end

DragonShrineClairWalkInMovement:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

DragonShrineClairBigStepLeftMovement:
	fix_facing
	big_step LEFT
	step_end

DragonShrineClairSlowStepLeftMovement:
	slow_step LEFT
	remove_fixed_facing
	step_end

DragonShrineClairTwoSlowStepsRightMovement:
	slow_step RIGHT
	slow_step RIGHT
	step_end

DragonShrineClairWalkOutMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

DragonShrineElderGreetingText:
	text "Hm… Rất vui được"
	line "gặp con."

	para "Không cần giải"
	line "thích lý do."

	para "CLAIR đã gửi con"
	line "đến đây phải ko?"

	para "Cô ấy thật khó"
	line "bảo…"

	para "Ta xin lỗi, nhưng"
	line "phải thử con."

	para "Đừng lo, con chỉ"
	line "cần trả lời vài"
	cont "câu hỏi thôi."

	para "Sẵn sàng chưa?"
	done

DragonShrineQuestion1Text:
	text "#MON là gì với"
	line "con?"
	done

DragonShrineQuestion2Text:
	text "Điều gì giúp con"
	line "thắng trận?"
	done

DragonShrineQuestion3Text:
	text "Con muốn đấu với"
	line "loại HLV nào?"
	done

DragonShrineQuestion4Text:
	text "Điều gì quan"
	line "trọng nhất khi"
	cont "nuôi #MON?"
	done

DragonShrineQuestion5Text:
	text "#MON mạnh."
	line "#MON yếu."

	para "Loại nào quan"
	line "trọng hơn?"
	done

DragonShrinePassedTestText:
	text "Hm… Ta hiểu…"

	para "Con rất quan tâm"
	line "đến #MON."

	para "Rất đáng khen."

	para "Niềm tin đó mới"
	line "là điều quan"
	cont "trọng!"

	para "<PLAYER>, đừng"
	line "mất niềm tin đó."

	para "Nó sẽ giúp con ở"
	line "HỘI LIÊN ĐOÀN"
	cont "#MON."
	done

DragonShrineMustIInformLanceText:
	text "CLAIR!"

	para "Đứa trẻ này hoàn"
	line "hảo về kỹ năng"
	cont "lẫn tinh thần!"

	para "Hãy chấp nhận"
	line "thua và trao"
	cont "RISINGBADGE!"

	para "…Hay ta phải báo"
	line "LANCE về việc này?"
	done

DragonShrineElderScoldsClairText:
	text "CLAIR…"

	para "Hãy suy ngẫm về"
	line "điều con thiếu"

	para "mà đứa trẻ này"
	line "lại có."
	done

DragonShrineComeAgainText:
	text "Hãy quay lại, nếu"
	line "con muốn."
	done

DragonShrineTakeThisDratiniText:
	text "Hm… Rất vui được"
	line "gặp con."

	para "Con đến đúng lúc"
	line "may mắn."

	para "Ta có thứ này"
	line "cho con."

	para "Hãy nhận DRATINI"
	line "này như bằng"

	para "chứng ta công"
	line "nhận giá trị con."
	done

DragonShrinePlayerReceivedDratiniText:
	text "<PLAYER> đã nhận"
	line "DRATINI!"
	done

DragonShrinePartyFullText:
	text "Hm? Đội #MON"
	line "của con đã đầy."
	done

DragonShrineSymbolicDragonText:
	text "#MON Rồng là"
	line "biểu tượng của"
	cont "gia tộc ta."

	para "Con đã chứng minh"
	line "có thể được tin"

	para "tưởng giao phó"
	line "một con."
	done

DragonShrineClairsGrandfatherText:
	text "CLAIR dường như đã"
	line "học được bài học"

	para "vô giá từ con."

	para "Ta cảm ơn con với"
	line "tư cách là ông"
	cont "của cô ấy."
	done

DragonShrineRivalIsInTrainingText:
	text "Một cậu bé bằng"
	line "tuổi con đang"
	cont "tập luyện ở đây."

	para "Cậu ta giống"
	line "CLAIR khi cô ấy"

	para "còn trẻ. Điều đó"
	line "hơi đáng lo…"
	done

DragonShrineWrongAnswerText1:
	text "Hả? Ta không nghe"
	line "rõ lắm…"
	done

DragonShrineWrongAnswerText2:
	text "Con đã nói gì?"
	done

DragonShrineRightAnswerText:
	text "Ồ, ta hiểu rồi…"
	done

DragonShrineElder2Text:
	text "Đã khá lâu rồi"
	line "kể từ khi một HLV"

	para "nhận được sự tán"
	line "thành hiếm hoi"
	cont "của BẬC THẦY."

	para "Thực ra, kể từ"
	line "thầy LANCE."
	done

DragonShrineElder3Text:
	text "Con biết thầy"
	line "LANCE trẻ tuổi?"

	para "Ông ấy trông rất"
	line "giống BẬC THẦY"
	cont "thời còn trẻ."

	para "Đó là do huyết"
	line "thống."
	done

DragonShrineClairYouPassedText:
	text "Vậy kết quả sao?"

	para "Ta đoán chẳng cần"
	line "hỏi làm gì."

	para "Ngươi đã trượt?"

	para "<……><……><……><……><……><……>"

	para "…Gì? Ngươi đậu?"
	done

DragonShrineClairThatCantBeText:
	text "Không thể nào!"
	done

DragonShrineClairYoureLyingText:
	text "Ngươi nói dối!"

	para "Ngay cả ta cũng"
	line "chưa được duyệt!"
	done

DragonShrineIUnderstandText:
	text "C-cháu hiểu rồi…"
	done

DragonShrineHereRisingBadgeText:
	text "Đây, đây là"
	line "RISINGBADGE…"

	para "Nhanh lên! Lấy đi!"
	done

DragonShrinePlayerReceivedRisingBadgeText:
	text "<PLAYER> đã nhận"
	line "RISINGBADGE."
	done

DragonShrineRisingBadgeExplanationText:
	text "RISINGBADGE sẽ cho"
	line "phép #MON dùng"

	para "chiêu leo thác"
	line "nước."

	para "Ngoài ra, tất cả"
	line "#MON sẽ nhận"

	para "ngươi là HLV và"
	line "tuân theo mọi"

	para "mệnh lệnh không"
	line "thắc mắc."
	done

DragonShrineSpeechlessText:
	text "<……><……><……><……><……><……>"
	done

DragonShrine_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  9, DRAGONS_DEN_B1F, 2
	warp_event  5,  9, DRAGONS_DEN_B1F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder1Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  2,  4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder2Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  7,  4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder3Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  4,  8, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DRAGON_SHRINE_CLAIR
