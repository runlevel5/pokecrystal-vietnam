	object_const_def
	const BATTLETOWER1F_RECEPTIONIST
	const BATTLETOWER1F_YOUNGSTER
	const BATTLETOWER1F_COOLTRAINER_F
	const BATTLETOWER1F_BUG_CATCHER
	const BATTLETOWER1F_GRANNY

BattleTower1F_MapScripts:
	def_scene_scripts
	scene_script BattleTower1FCheckStateScene, SCENE_BATTLETOWER1F_CHECKSTATE
	scene_script BattleTower1FNoopScene,       SCENE_BATTLETOWER1F_NOOP

	def_callbacks

BattleTower1FCheckStateScene:
	setval BATTLETOWERACTION_CHECKSAVEFILEISYOURS
	special BattleTowerAction
	iffalse .SkipEverything
	setval BATTLETOWERACTION_GET_CHALLENGE_STATE ; readmem sBattleTowerChallengeState
	special BattleTowerAction
	ifequal $0, .SkipEverything
	ifequal $2, .LeftWithoutSaving
	ifequal $3, .SkipEverything
	ifequal $4, .SkipEverything
	opentext
	writetext Text_WeveBeenWaitingForYou
	waitbutton
	closetext
	sdefer Script_ResumeBattleTowerChallenge
	end

.LeftWithoutSaving
	sdefer BattleTower_LeftWithoutSaving
	setval BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	setval BATTLETOWERACTION_06
	special BattleTowerAction
.SkipEverything:
	setscene SCENE_BATTLETOWER1F_NOOP
	; fallthrough
BattleTower1FNoopScene:
	end

BattleTower1FRulesSign:
	opentext
	writetext Text_ReadBattleTowerRules
	yesorno
	iffalse .skip
	writetext Text_BattleTowerRules
	waitbutton
.skip:
	closetext
	end

BattleTower1FReceptionistScript:
	setval BATTLETOWERACTION_GET_CHALLENGE_STATE ; readmem sBattleTowerChallengeState
	special BattleTowerAction
	ifequal $3, Script_BeatenAllTrainers2 ; maps/BattleTowerBattleRoom.asm
	opentext
	writetext Text_BattleTowerWelcomesYou
	promptbutton
	setval BATTLETOWERACTION_CHECK_EXPLANATION_READ ; if new save file: bit 1, [sBattleTowerSaveFileFlags]
	special BattleTowerAction
	ifnotequal $0, Script_Menu_ChallengeExplanationCancel
	sjump Script_BattleTowerIntroductionYesNo

Script_Menu_ChallengeExplanationCancel:
	writetext Text_WantToGoIntoABattleRoom
	setval TRUE
	special Menu_ChallengeExplanationCancel
	ifequal 1, Script_ChooseChallenge
	ifequal 2, Script_BattleTowerExplanation
	sjump Script_BattleTowerHopeToServeYouAgain

Script_ChooseChallenge:
	setval BATTLETOWERACTION_RESETDATA ; ResetBattleTowerTrainerSRAM
	special BattleTowerAction
	special CheckForBattleTowerRules
	ifnotequal FALSE, Script_WaitButton
	writetext Text_SaveBeforeEnteringBattleRoom
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_BATTLETOWER1F_CHECKSTATE
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_BATTLETOWER1F_NOOP
	setval BATTLETOWERACTION_SET_EXPLANATION_READ ; set 1, [sBattleTowerSaveFileFlags]
	special BattleTowerAction
	special BattleTowerRoomMenu
	ifequal $a, Script_Menu_ChallengeExplanationCancel
	ifnotequal $0, Script_MobileError
	setval BATTLETOWERACTION_11
	special BattleTowerAction
	writetext Text_RightThisWayToYourBattleRoom
	waitbutton
	closetext
	setval BATTLETOWERACTION_CHOOSEREWARD
	special BattleTowerAction
	sjump Script_WalkToBattleTowerElevator

Script_ResumeBattleTowerChallenge:
	closetext
	setval BATTLETOWERACTION_LOADLEVELGROUP ; load choice of level group
	special BattleTowerAction
Script_WalkToBattleTowerElevator:
	musicfadeout MUSIC_NONE, 8
	setmapscene BATTLE_TOWER_BATTLE_ROOM, SCENE_BATTLETOWERBATTLEROOM_ENTER
	setmapscene BATTLE_TOWER_ELEVATOR, SCENE_BATTLETOWERELEVATOR_ENTER
	setmapscene BATTLE_TOWER_HALLWAY, SCENE_BATTLETOWERHALLWAY_ENTER
	follow BATTLETOWER1F_RECEPTIONIST, PLAYER
	applymovement BATTLETOWER1F_RECEPTIONIST, MovementData_BattleTower1FWalkToElevator
	setval BATTLETOWERACTION_0A
	special BattleTowerAction
	warpsound
	disappear BATTLETOWER1F_RECEPTIONIST
	stopfollow
	applymovement PLAYER, MovementData_BattleTowerHallwayPlayerEntersBattleRoom
	warpcheck
	end

Script_GivePlayerHisPrize:
	setval BATTLETOWERACTION_1C
	special BattleTowerAction
	setval BATTLETOWERACTION_GIVEREWARD
	special BattleTowerAction
	ifequal POTION, Script_YourPackIsStuffedFull
	getitemname STRING_BUFFER_4, USE_SCRIPT_VAR
	giveitem ITEM_FROM_MEM, 5
	writetext Text_PlayerGotFive
	setval BATTLETOWERACTION_1D
	special BattleTowerAction
	closetext
	end

Script_YourPackIsStuffedFull:
	writetext Text_YourPackIsStuffedFull
	waitbutton
	closetext
	end

Script_BattleTowerIntroductionYesNo:
	writetext Text_WouldYouLikeToHearAboutTheBattleTower
	yesorno
	iffalse Script_BattleTowerSkipExplanation
Script_BattleTowerExplanation:
	writetext Text_BattleTowerIntroduction_2
Script_BattleTowerSkipExplanation:
	setval BATTLETOWERACTION_SET_EXPLANATION_READ
	special BattleTowerAction
	sjump Script_Menu_ChallengeExplanationCancel

Script_BattleTowerHopeToServeYouAgain:
	writetext Text_WeHopeToServeYouAgain
	waitbutton
	closetext
	end

Script_MobileError2: ; unreferenced
	special BattleTowerMobileError
	closetext
	end

Script_WaitButton:
	waitbutton
	closetext
	end

Script_ChooseChallenge2: ; unreferenced
	writetext Text_SaveBeforeEnteringBattleRoom
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setval BATTLETOWERACTION_SET_EXPLANATION_READ
	special BattleTowerAction
	special Function1700ba
	ifequal $a, Script_Menu_ChallengeExplanationCancel
	ifnotequal $0, Script_MobileError
	writetext Text_ReceivedAListOfLeadersOnTheHonorRoll
	turnobject BATTLETOWER1F_RECEPTIONIST, LEFT
	writetext Text_PleaseConfirmOnThisMonitor
	waitbutton
	turnobject BATTLETOWER1F_RECEPTIONIST, DOWN
	closetext
	end

Script_StartChallenge: ; unreferenced
	setval BATTLETOWERACTION_LEVEL_CHECK
	special BattleTowerAction
	ifnotequal $0, Script_AMonLevelExceeds
	setval BATTLETOWERACTION_UBERS_CHECK
	special BattleTowerAction
	ifnotequal $0, Script_MayNotEnterABattleRoomUnderL70
	special CheckForBattleTowerRules
	ifnotequal FALSE, Script_WaitButton
	setval BATTLETOWERACTION_05
	special BattleTowerAction
	ifequal $0, .zero
	writetext Text_CantBeRegistered_PreviousRecordDeleted
	sjump .continue

.zero
	writetext Text_CantBeRegistered
.continue
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	writetext Text_SaveBeforeReentry
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_BATTLETOWER1F_CHECKSTATE
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_BATTLETOWER1F_NOOP
	setval BATTLETOWERACTION_06
	special BattleTowerAction
	setval BATTLETOWERACTION_12
	special BattleTowerAction
	writetext Text_RightThisWayToYourBattleRoom
	waitbutton
	sjump Script_ResumeBattleTowerChallenge

Script_ReachedBattleLimit: ; unreferenced
	writetext Text_FiveDayBattleLimit_Mobile
	waitbutton
	sjump Script_BattleTowerHopeToServeYouAgain

Script_AMonLevelExceeds:
	writetext Text_AMonLevelExceeds
	waitbutton
	sjump Script_Menu_ChallengeExplanationCancel

Script_MayNotEnterABattleRoomUnderL70:
	writetext Text_MayNotEnterABattleRoomUnderL70
	waitbutton
	sjump Script_Menu_ChallengeExplanationCancel

Script_MobileError:
	special BattleTowerMobileError
	closetext
	end

BattleTower_LeftWithoutSaving:
	opentext
	writetext Text_BattleTower_LeftWithoutSaving
	waitbutton
	sjump Script_BattleTowerHopeToServeYouAgain

BattleTower1FYoungsterScript:
	faceplayer
	opentext
	writetext Text_BattleTowerYoungster
	waitbutton
	closetext
	turnobject BATTLETOWER1F_YOUNGSTER, RIGHT
	end

BattleTower1FCooltrainerFScript:
	jumptextfaceplayer Text_BattleTowerCooltrainerF

BattleTower1FBugCatcherScript:
	jumptextfaceplayer Text_BattleTowerBugCatcher

BattleTower1FGrannyScript:
	jumptextfaceplayer Text_BattleTowerGranny

MovementData_BattleTower1FWalkToElevator:
	step UP
	step UP
	step UP
	step UP
	step UP
MovementData_BattleTowerHallwayPlayerEntersBattleRoom:
	step UP
	step_end

MovementData_BattleTowerElevatorExitElevator:
	step DOWN
	step_end

MovementData_BattleTowerHallwayWalkTo1020Room:
	step RIGHT
	step RIGHT
MovementData_BattleTowerHallwayWalkTo3040Room:
	step RIGHT
	step RIGHT
	step UP
	step RIGHT
	turn_head LEFT
	step_end

MovementData_BattleTowerHallwayWalkTo90100Room:
	step LEFT
	step LEFT
MovementData_BattleTowerHallwayWalkTo7080Room:
	step LEFT
	step LEFT
MovementData_BattleTowerHallwayWalkTo5060Room:
	step LEFT
	step LEFT
	step UP
	step LEFT
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomPlayerWalksIn:
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomOpponentWalksIn:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	turn_head LEFT
	step_end

MovementData_BattleTowerBattleRoomOpponentWalksOut:
	turn_head UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

MovementData_BattleTowerBattleRoomReceptionistWalksToPlayer:
	slow_step RIGHT
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_end

MovementData_BattleTowerBattleRoomReceptionistWalksAway:
	slow_step DOWN
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomPlayerTurnsToFaceReceptionist:
	turn_head DOWN
	step_end

MovementData_BattleTowerBattleRoomPlayerTurnsToFaceNextOpponent:
	turn_head RIGHT
	step_end

Text_BattleTowerWelcomesYou:
	text "THÁP ĐẤU"
	line "chào mừng bạn!"

	para "Tôi có thể dẫn"
	line "bạn đến PHÒNG ĐẤU"
	done

Text_WantToGoIntoABattleRoom:
	text "Bạn có muốn vào"
	line "PHÒNG ĐẤU không?"
	done

Text_RightThisWayToYourBattleRoom:
	text "Mời bạn đi bên"
	line "này đến PHÒNG ĐẤU"
	done

Text_BattleTowerIntroduction_1: ; unreferenced
	text "THÁP ĐẤU là một"
	line "cơ sở được tạo ra"
	cont "cho trận #MON."

	para "Vô số HLV #MON"
	line "tụ họp từ khắp"

	para "nơi để tham gia"
	line "trận đấu trong"

	para "PHÒNG ĐẤU được"
	line "thiết kế đặc biệt"

	para "Có rất nhiều"
	line "PHÒNG ĐẤU trong"
	cont "THÁP ĐẤU."

	para "Mỗi PHÒNG có"
	line "bảy HLV."

	para "Nếu bạn đánh bại"
	line "bảy HLV trong một"

	para "PHÒNG, và có thành"
	line "tích tốt, bạn có"

	para "thể trở thành"
	line "THỦLĨNH PHÒNG đó."

	para "Mọi THỦLĨNH sẽ"
	line "được ghi vào"

	para "BẢNG DANH DỰ để"
	line "lưu lại hậu thế."

	para "Bạn có thể thách"
	line "đấu tối đa năm"

	para "PHÒNG ĐẤU mỗi"
	line "ngày."

	para "Tuy nhiên, bạn chỉ"
	line "có thể đấu một lần"

	para "mỗi ngày trong"
	line "mỗi PHÒNG."

	para "Để tạm ngưng, bạn"
	line "phải LƯU GAME."

	para "Nếu không, bạn"
	line "sẽ không thể tiếp"

	para "tục thử thách"
	line "PHÒNG của mình."

	para ""
	done

Text_BattleTowerIntroduction_2:
	text "THÁP ĐẤU là một"
	line "cơ sở được tạo ra"
	cont "cho trận #MON."

	para "Vô số HLV #MON"
	line "tụ họp từ khắp"

	para "nơi để tham gia"
	line "trận đấu trong"

	para "PHÒNG ĐẤU được"
	line "thiết kế đặc biệt"

	para "Có rất nhiều"
	line "PHÒNG ĐẤU trong"
	cont "THÁP ĐẤU."

	para "Mỗi PHÒNG có"
	line "bảy HLV."

	para "Đánh bại tất cả,"
	line "và nhận giải!"

	para "Để tạm ngưng, bạn"
	line "phải LƯU GAME."

	para "Nếu không, bạn"
	line "sẽ không thể tiếp"

	para "tục thử thách"
	line "PHÒNG của mình."

	para ""
	done

Text_ReceivedAListOfLeadersOnTheHonorRoll:
	text "Đã nhận danh sách"
	line "THỦLĨNH trên"
	cont "BẢNG DANH DỰ."

	para ""
	done

Text_PleaseConfirmOnThisMonitor:
	text "Vui lòng xác nhận"
	line "trên màn hình này"
	done

Text_ThankYou: ; unreferenced
	text "Cảm ơn bạn!"

	para ""
	done

Text_ThanksForVisiting:
	text "Cảm ơn đã"
	line "ghé thăm!"
	done

Text_BeatenAllTheTrainers_Mobile: ; unreferenced
	text "Chúc mừng!"

	para "Bạn đã đánh bại"
	line "tất cả HLV!"

	para "Thành tích của bạn"
	line "có thể được ghi"

	para "lại, <PLAYER>. Với"
	line "kết quả này, bạn"

	para "có thể được chọn"
	line "làm THỦLĨNH PHÒNG"

	para ""
	done

Text_CongratulationsYouveBeatenAllTheTrainers:
	text "Chúc mừng!"

	para "Bạn đã đánh bại"
	line "tất cả HLV!"

	para "Vì thế, bạn nhận"
	line "phần thưởng này!"

	para ""
	done

Text_AskRegisterRecord_Mobile: ; unreferenced
	text "Bạn có muốn ghi"
	line "lại thành tích"

	para "của mình với"
	line "TRUNG TÂM không?"
	done

Text_PlayerGotFive:
	text "<PLAYER> nhận năm"
	line "@"
	text_ram wStringBuffer4
	text "!@"
	sound_item
	text_promptbutton
	text_end

Text_YourPackIsStuffedFull:
	text "Ối, TÚI của bạn"
	line "đã đầy."

	para "Xin hãy dọn chỗ"
	line "và quay lại."
	done

Text_YourRegistrationIsComplete: ; unreferenced
	text "Đăng ký của bạn"
	line "đã hoàn tất."

	para "Hẹn gặp lại!"
	done

Text_WeHopeToServeYouAgain:
	text "Mong được phục vụ"
	line "bạn lần nữa."
	done

Text_PleaseStepThisWay:
	text "Mời bạn đi bên"
	line "này."
	done

Text_WouldYouLikeToHearAboutTheBattleTower:
	text "Bạn có muốn nghe"
	line "về THÁP ĐẤU"
	cont "không?"
	done

Text_CantBeRegistered:
	text "Thành tích từ"
	line "PHÒNG ĐẤU trước"

	para "không thể ghi lại"
	line "Được chứ?"
	done

Text_CantBeRegistered_PreviousRecordDeleted:
	text "Thành tích từ"
	line "PHÒNG ĐẤU trước"

	para "không thể ghi lại"

	para "Hơn nữa, thành"
	line "tích hiện có sẽ"
	cont "bị xóa. Được chứ?"
	done

Text_CheckTheLeaderHonorRoll: ; unreferenced
	text "Xem BẢNG DANH DỰ"
	line "THỦLĨNH không?"
	done

Text_ReadBattleTowerRules:
	text "Luật THÁP ĐẤU"
	line "được viết ở đây."

	para "Đọc luật chứ?"
	done

Text_BattleTowerRules:
	text "Ba #MON có thể"
	line "tham gia trận đấu"

	para "Cả ba phải khác"
	line "nhau."

	para "Đồ họ mang cũng"
	line "phải khác nhau."

	para "Một số #MON có"
	line "thể bị giới hạn"

	para "cấp độ trong"
	line "một số PHÒNG."
	done

Text_BattleTower_LeftWithoutSaving:
	text "Xin lỗi!"
	line "Bạn đã không LƯU"

	para "trước khi thoát"
	line "PHÒNG ĐẤU."

	para "Tôi rất xin lỗi,"
	line "nhưng thử thách"

	para "của bạn sẽ bị"
	line "tuyên bố vô hiệu."
	done

Text_YourMonWillBeHealedToFullHealth:
	text "#MON của bạn"
	line "sẽ được hồi phục"
	cont "toàn bộ máu."
	done

Text_NextUpOpponentNo:
	text "Tiếp theo, đối thủ"
	line "số @"
	text_ram wStringBuffer3
	text ". Sẵn sàng?"
	done

Text_SaveBeforeConnecting_Mobile: ; unreferenced
	text "Tiến trình của bạn"
	line "sẽ được LƯU trước"

	para "khi kết nối với"
	line "TRUNG TÂM."
	done

Text_SaveBeforeEnteringBattleRoom:
	text "Trước khi vào"
	line "PHÒNG ĐẤU,"

	para "tiến trình của bạn"
	line "sẽ được lưu lại."
	done

Text_SaveAndEndTheSession:
	text "LƯU và kết thúc"
	line "phiên chơi?"
	done

Text_SaveBeforeReentry:
	text "Thành tích của bạn"
	line "sẽ được LƯU trước"

	para "khi bạn quay lại"
	line "PHÒNG trước đó."
	done

Text_CancelYourBattleRoomChallenge:
	text "Hủy thử thách"
	line "PHÒNG ĐẤU của bạn"
	done

Text_RegisterRecordOnFile_Mobile: ; unreferenced
	text "Chúng tôi có thành"
	line "tích trước của bạn"

	para "Bạn có muốn ghi nó"
	line "tại TRUNG TÂM"
	cont "không?"
	done

Text_WeveBeenWaitingForYou:
	text "Chúng tôi đang đợi"
	line "bạn. Mời đi bên"

	para "này đến PHÒNG ĐẤU,"
	line "nhé."
	done

Text_FiveDayBattleLimit_Mobile:
	text "Bạn chỉ được vào"
	line "năm PHÒNG ĐẤU"
	cont "mỗi ngày."

	para "Xin hãy quay lại"
	line "vào ngày mai."
	done

Text_TooMuchTimeElapsedNoRegister:
	text "Xin lỗi, không thể"
	line "ghi lại thành tích"

	para "hiện tại của bạn"
	line "tại TRUNG TÂM vì"

	para "đã hết quá nhiều"
	line "thời gian kể từ"

	para "khi bắt đầu thử"
	line "thách của bạn."
	done

Text_RegisterRecordTimedOut_Mobile: ; unreferenced
; duplicate of Text_TooMuchTimeElapsedNoRegister
	text "Xin lỗi, không thể"
	line "ghi lại thành tích"

	para "gần nhất của bạn"
	line "tại TRUNG TÂM vì"

	para "đã hết quá nhiều"
	line "thời gian kể từ"

	para "khi bắt đầu thử"
	line "thách của bạn."
	done

Text_AMonLevelExceeds:
	text "Một hoặc nhiều"
	line "cấp #MON của"
	cont "bạn vượt quá @"
	text_decimal wScriptVar, 1, 3
	text "."
	done

Text_MayNotEnterABattleRoomUnderL70:
	text_ram wcd49
	text " không thể"
	line "vào PHÒNG ĐẤU"
	cont "dưới L70."

	para "PHÒNG ĐẤU này"
	line "dành cho L@"
	text_decimal wScriptVar, 1, 3
	text "."
	done

Text_BattleTowerYoungster:
	text "Bị đối thủ đầu"
	line "tiên phá tan tành"

	para "trong chốc lát…"
	line "Tôi kém quá…"
	done

Text_BattleTowerCooltrainerF:
	text "Có rất nhiều"
	line "PHÒNG ĐẤU, nhưng"

	para "tôi sẽ thắng tất"
	line "cả chúng!"
	done

Text_BattleTowerGranny:
	text "Thật là một nhiệm"
	line "vụ khắc nghiệt,"

	para "không thể dùng đồ"
	line "trong trận đấu."

	para "Việc cho #MON"
	line "mang đồ là chìa"

	para "khóa để thắng"
	line "trận đấu."
	done

Text_BattleTowerBugCatcher:
	text "Tôi đang thử xem"
	line "mình đi xa được"

	para "đến đâu chỉ dùng"
	line "#MON sâu bọ."

	para "Đừng có #MON"
	line "lửa nào nhé…"
	done

BattleTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  9, BATTLE_TOWER_OUTSIDE, 3
	warp_event  8,  9, BATTLE_TOWER_OUTSIDE, 4
	warp_event  7,  0, BATTLE_TOWER_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event  6,  6, BGEVENT_READ, BattleTower1FRulesSign

	def_object_events
	object_event  7,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower1FReceptionistScript, -1
	object_event 14,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BattleTower1FYoungsterScript, -1
	object_event  4,  9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTower1FCooltrainerFScript, -1
	object_event  1,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleTower1FBugCatcherScript, -1
	object_event 14,  3, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower1FGrannyScript, -1
