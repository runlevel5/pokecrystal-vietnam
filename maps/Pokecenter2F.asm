	object_const_def
	const POKECENTER2F_TRADE_RECEPTIONIST
	const POKECENTER2F_BATTLE_RECEPTIONIST
	const POKECENTER2F_TIME_CAPSULE_RECEPTIONIST
	const POKECENTER2F_OFFICER

Pokecenter2F_MapScripts:
	def_scene_scripts
	scene_script Pokecenter2FCheckMysteryGiftScene,      SCENE_POKECENTER2F_CHECK_MYSTERY_GIFT
	scene_script Pokecenter2FLeaveTradeCenterScene,      SCENE_POKECENTER2F_LEAVE_TRADE_CENTER
	scene_script Pokecenter2FLeaveColosseumScene,        SCENE_POKECENTER2F_LEAVE_COLOSSEUM
	scene_script Pokecenter2FLeaveTimeCapsuleScene,      SCENE_POKECENTER2F_LEAVE_TIME_CAPSULE
	scene_script Pokecenter2FLeaveMobileTradeRoomScene,  SCENE_POKECENTER2F_LEAVE_MOBILE_TRADE_ROOM
	scene_script Pokecenter2FLeaveMobileBattleRoomScene, SCENE_POKECENTER2F_LEAVE_MOBILE_BATTLE_ROOM

	def_callbacks

Pokecenter2FCheckMysteryGiftScene:
	special CheckMysteryGift
	ifequal $0, .done
	clearevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .done
	sdefer Pokecenter2F_AppearMysteryGiftDeliveryGuy
.done
	end

Pokecenter2FLeaveTradeCenterScene:
	sdefer Script_LeftCableTradeCenter
	end

Pokecenter2FLeaveColosseumScene:
	sdefer Script_LeftCableColosseum
	end

Pokecenter2FLeaveTimeCapsuleScene:
	sdefer Script_LeftTimeCapsule
	end

Pokecenter2FLeaveMobileTradeRoomScene:
	sdefer Script_LeftMobileTradeRoom
	end

Pokecenter2FLeaveMobileBattleRoomScene:
	sdefer Script_LeftMobileBattleRoom
	end

Pokecenter2F_AppearMysteryGiftDeliveryGuy:
	appear POKECENTER2F_OFFICER
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	end

Script_TradeCenterClosed:
	faceplayer
	opentext
	writetext Text_TradeRoomClosed
	waitbutton
	closetext
	end

Script_BattleRoomClosed:
	faceplayer
	opentext
	writetext Text_BattleRoomClosed
	waitbutton
	closetext
	end

LinkReceptionistScript_Trade:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse Script_TradeCenterClosed
	opentext
	writetext Text_TradeReceptionistIntro
	yesorno
	iffalse .Cancel
	special CheckMobileAdapterStatusSpecial
	iffalse .NoMobile
	writetext Text_TradeReceptionistMobile
	special AskMobileOrCable
	iffalse .Cancel
	ifequal $1, .Mobile
.NoMobile:
	special SetBitsForLinkTradeRequest
	writetext Text_PleaseWait
	special WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special CheckLinkTimeout_Receptionist
	iffalse .LinkTimedOut
	readmem wOtherPlayerLinkMode
	iffalse .LinkedToFirstGen
	special CheckBothSelectedSameRoom
	iffalse .IncompatibleRooms
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	scall Pokecenter2F_CheckGender
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext YourFriendIsNotReadyText
	closetext
	end

.LinkedToFirstGen:
	special FailedLinkToPast
	writetext Text_CantLinkToThePast
	special CloseLink
	closetext
	end

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special CloseLink
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	sjump .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special WaitForOtherPlayerToExit
.Cancel:
	closetext
	end

.Mobile:
	scall .Mobile_TrySave
	iftrue .Mobile_Abort
	scall BattleTradeMobile_WalkIn
	warpcheck
	end

.Mobile_Abort:
	end

.Mobile_TrySave:
	writetext Text_MustSaveGame
	yesorno
	iffalse .Mobile_DidNotSave
	special TryQuickSave
	iffalse .Mobile_DidNotSave
	special Function1011f1
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	setval FALSE
	end

.Mobile_DidNotSave:
	writetext Text_PleaseComeAgain
	closetext
	setval TRUE
	end

BattleTradeMobile_WalkIn:
	applymovementlasttalked Pokecenter2FMobileMobileMovementData_ReceptionistWalksUpAndLeft_LookDown
	applymovement PLAYER, Pokecenter2FMobileMovementData_PlayerWalksIntoMobileBattleRoom
	end

LinkReceptionistScript_Battle:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse Script_BattleRoomClosed
	opentext
	writetext Text_BattleReceptionistIntro
	yesorno
	iffalse .Cancel
	special CheckMobileAdapterStatusSpecial
	iffalse .NoMobile
	writetext Text_BattleReceptionistMobile
	special AskMobileOrCable
	iffalse .Cancel
	ifequal $1, .Mobile
.NoMobile:
	special SetBitsForBattleRequest
	writetext Text_PleaseWait
	special WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special CheckLinkTimeout_Receptionist
	iffalse .LinkTimedOut
	readmem wOtherPlayerLinkMode
	iffalse .LinkedToFirstGen
	special CheckBothSelectedSameRoom
	iffalse .IncompatibleRooms
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	scall Pokecenter2F_CheckGender
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext YourFriendIsNotReadyText
	closetext
	end

.LinkedToFirstGen:
	special FailedLinkToPast
	writetext Text_CantLinkToThePast
	special CloseLink
	closetext
	end

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special CloseLink
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	sjump .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special WaitForOtherPlayerToExit
.Cancel:
	closetext
	end

.Mobile:
	scall .SelectThreeMons
	iffalse .Mobile_Abort
	scall .Mobile_TrySave
	iftrue .Mobile_Abort
	scall BattleTradeMobile_WalkIn
	warpcheck
	end

.Mobile_Abort:
	end

.Mobile_TrySave:
	writetext Text_MustSaveGame
	yesorno
	iffalse .Mobile_DidNotSave
	special Function103780
	iffalse .Mobile_DidNotSave
	special Function1011f1
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	setval FALSE
	end

.Mobile_DidNotSave:
	writetext Text_PleaseComeAgain
	closetext
	setval TRUE
	end

.SelectThreeMons:
	special Mobile_SelectThreeMons
	iffalse .Mobile_DidNotSelect
	ifequal $1, .Mobile_OK
	ifequal $2, .Mobile_OK
	ifequal $3, .Mobile_InvalidParty
	sjump .Mobile_DidNotSelect

.Mobile_InvalidParty:
	writetext Text_BrokeStadiumRules
	waitbutton
.Mobile_DidNotSelect:
	closetext
	setval FALSE
	end

.Mobile_OK:
	setval TRUE
	end

Script_TimeCapsuleClosed:
	faceplayer
	opentext
	writetext Text_TimeCapsuleClosed
	waitbutton
	closetext
	end

LinkReceptionistScript_TimeCapsule:
	checkevent EVENT_MET_BILL
	iftrue Script_TimeCapsuleClosed
	checkflag ENGINE_TIME_CAPSULE
	iftrue Script_TimeCapsuleClosed
	special SetBitsForTimeCapsuleRequest
	faceplayer
	opentext
	writetext Text_TimeCapsuleReceptionistIntro
	yesorno
	iffalse .Cancel
	special CheckTimeCapsuleCompatibility
	ifequal $1, .MonTooNew
	ifequal $2, .MonMoveTooNew
	ifequal $3, .MonHasMail
	writetext Text_PleaseWait
	special WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special CheckLinkTimeout_Receptionist
	iffalse .LinkTimedOut
	readmem wOtherPlayerLinkMode
	iffalse .OK
	special CheckBothSelectedSameRoom
	writetext Text_IncompatibleRooms
	special CloseLink
	closetext
	end

.OK:
	special EnterTimeCapsule
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	scall TimeCapsuleScript_CheckPlayerGender
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext YourFriendIsNotReadyText
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	sjump .Cancel

.DidNotSave:
	writetext Text_PleaseComeAgain
.Cancel:
	special WaitForOtherPlayerToExit
	closetext
	end

.MonTooNew:
	writetext Text_RejectNewMon
	closetext
	end

.MonMoveTooNew:
	writetext Text_RejectMonWithNewMove
	closetext
	end

.MonHasMail:
	writetext Text_RejectMonWithMail
	closetext
	end

Script_LeftCableTradeCenter:
	special WaitForOtherPlayerToExit
	scall Script_WalkOutOfLinkTradeRoom
	setscene SCENE_POKECENTER2F_CHECK_MYSTERY_GIFT
	setmapscene TRADE_CENTER, SCENE_TRADECENTER_INITIALIZE
	end

Script_LeftMobileTradeRoom:
	special Function101220
	scall Script_WalkOutOfMobileTradeRoom
	setscene SCENE_POKECENTER2F_CHECK_MYSTERY_GIFT
	setmapscene MOBILE_TRADE_ROOM, SCENE_MOBILETRADEROOM_INITIALIZE
	end

Script_WalkOutOfMobileTradeRoom:
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMobileMovementData_ReceptionistWalksUpAndLeft
	applymovement PLAYER, Pokecenter2FMovementData_PlayerWalksOutOfMobileRoom
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMobileMovementData_ReceptionistWalksRightAndDown
	end

Script_LeftCableColosseum:
	special WaitForOtherPlayerToExit
	scall Script_WalkOutOfLinkBattleRoom
	setscene SCENE_POKECENTER2F_CHECK_MYSTERY_GIFT
	setmapscene COLOSSEUM, SCENE_COLOSSEUM_INITIALIZE
	end

Script_LeftMobileBattleRoom:
	special Function101220
	scall Script_WalkOutOfMobileBattleRoom
	setscene SCENE_POKECENTER2F_CHECK_MYSTERY_GIFT
	setmapscene MOBILE_BATTLE_ROOM, SCENE_MOBILEBATTLEROOM_INITIALIZE
	end

Script_WalkOutOfMobileBattleRoom:
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMobileMovementData_ReceptionistWalksUpAndLeft
	applymovement PLAYER, Pokecenter2FMovementData_PlayerWalksOutOfMobileRoom
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMobileMovementData_ReceptionistWalksRightAndDown
	end

Pokecenter2F_CheckGender:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsUp
	end

.Female:
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight_2
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesTwoStepsUp
	opentext
	writetext Text_OhPleaseWait
	waitbutton
	closetext
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistLooksRight
	turnobject PLAYER, LEFT
	opentext
	writetext Text_ChangeTheLook
	waitbutton
	closetext
	playsound SFX_TINGLE
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	setval (PAL_NPC_RED << 4)
	special SetPlayerPalette
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft
	setflag ENGINE_KRIS_IN_CABLE_CLUB
	special UpdatePlayerSprite
	opentext
	writetext Text_LikeTheLook
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepUp
	end

Script_WalkOutOfLinkTradeRoom:
	checkflag ENGINE_KRIS_IN_CABLE_CLUB
	iftrue .Female
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsDown
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	end

.Female:
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepDown_2
	clearflag ENGINE_KRIS_IN_CABLE_CLUB
	playsound SFX_TINGLE
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	setval (PAL_NPC_BLUE << 4)
	special SetPlayerPalette
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft
	special UpdatePlayerSprite
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesTwoStepsDown_2
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	end

Script_WalkOutOfLinkBattleRoom:
	checkflag ENGINE_KRIS_IN_CABLE_CLUB
	iftrue .Female
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsDown
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	end

.Female:
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepDown_2
	clearflag ENGINE_KRIS_IN_CABLE_CLUB
	playsound SFX_TINGLE
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	setval (PAL_NPC_BLUE << 4)
	special SetPlayerPalette
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft
	special UpdatePlayerSprite
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesTwoStepsDown_2
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	end

TimeCapsuleScript_CheckPlayerGender:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	readvar VAR_FACING
	ifequal LEFT, .MaleFacingLeft
	ifequal RIGHT, .MaleFacingRight
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsLeftLooksDown
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesTwoStepsUp_2
	end

.MaleFacingLeft:
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsLeftLooksDown
	applymovement PLAYER, Pokecenter2FMovementData_PlayerWalksLeftAndUp
	end

.MaleFacingRight:
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsRightLooksDown
	applymovement PLAYER, Pokecenter2FMovementData_PlayerWalksRightAndUp
	end

.Female:
	readvar VAR_FACING
	ifequal RIGHT, .FemaleFacingRight
	ifequal LEFT, .FemaleFacingLeft
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsLeftLooksRight_2
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepUp_2
	sjump .FemaleContinue

.FemaleFacingRight:
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsRightLooksLeft_2
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepRight
	sjump .FemaleContinue

.FemaleFacingLeft:
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsLeftLooksRight_2
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepLeft
.FemaleContinue:
	opentext
	writetext Text_OhPleaseWait
	waitbutton
	closetext
	readvar VAR_FACING
	ifnotequal UP, .FemaleChangeApperance
	turnobject PLAYER, LEFT
.FemaleChangeApperance:
	opentext
	writetext Text_ChangeTheLook
	waitbutton
	closetext
	playsound SFX_TINGLE
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	setval (PAL_NPC_RED << 4)
	special SetPlayerPalette
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingDown
	faceobject PLAYER, POKECENTER2F_TIME_CAPSULE_RECEPTIONIST
	setflag ENGINE_KRIS_IN_CABLE_CLUB
	special UpdatePlayerSprite
	opentext
	writetext Text_LikeTheLook
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepUp_2
	end

Script_LeftTimeCapsule:
	special WaitForOtherPlayerToExit
	checkflag ENGINE_KRIS_IN_CABLE_CLUB
	iftrue .Female
	applymovement POKECENTER2F_TIME_CAPSULE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsLeftLooksRight
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesTwoStepsDown
	applymovement POKECENTER2F_TIME_CAPSULE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_2
	sjump .Done

.Female:
	applymovement POKECENTER2F_TIME_CAPSULE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsLeftLooksRight
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepDown
	clearflag ENGINE_KRIS_IN_CABLE_CLUB
	playsound SFX_TINGLE
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	setval (PAL_NPC_BLUE << 4)
	special SetPlayerPalette
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft
	special UpdatePlayerSprite
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepDown
	applymovement POKECENTER2F_TIME_CAPSULE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_2
.Done:
	setscene SCENE_POKECENTER2F_CHECK_MYSTERY_GIFT
	setmapscene TIME_CAPSULE, SCENE_TIMECAPSULE_INITIALIZE
	end

Pokecenter2FLinkRecordSign:
	reanchormap
	special DisplayLinkRecord
	closetext
	end

Pokecenter2FOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
	iftrue .AlreadyGotGift
	writetext Text_MysteryGiftDeliveryGuy_Intro
	yesorno
	iffalse .RefusedGift
	writetext Text_MysteryGiftDeliveryGuy_HereYouGo
	promptbutton
	waitsfx
	special GetMysteryGiftItem
	iffalse .BagIsFull
	itemnotify
	setevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
.AlreadyGotGift:
	writetext Text_MysteryGiftDeliveryGuy_Outro
	waitbutton
	closetext
	end

.BagIsFull:
	writetext Text_MysteryGiftDeliveryGuy_NoRoom
	waitbutton
	closetext
	end

.RefusedGift:
	writetext Text_MysteryGiftDeliveryGuy_SaidNo
	waitbutton
	closetext
	end

Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_end

Pokecenter2FMobileMobileMovementData_ReceptionistWalksUpAndLeft_LookDown:
	slow_step UP
	slow_step LEFT
	turn_head DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsLeftLooksDown:
	slow_step LEFT
	turn_head DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightLooksDown:
	slow_step RIGHT
	turn_head DOWN
	step_end

Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight_2:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_end

Pokecenter2FMovementData_ReceptionistLooksRight:
	turn_head RIGHT
	step_end

Pokecenter2FMovementData_PlayerTakesThreeStepsUp:
	step UP
	step UP
	step UP
	step_end

Pokecenter2FMovementData_PlayerTakesTwoStepsUp:
	step UP
	step UP
	step_end

Pokecenter2FMovementData_PlayerTakesOneStepUp:
	step UP
	step_end

Pokecenter2FMobileMovementData_PlayerWalksIntoMobileBattleRoom:
	step UP
	step UP
	step RIGHT
	step UP
	step_end

Pokecenter2FMovementData_PlayerTakesTwoStepsUp_2:
	step UP
	step UP
	step_end

Pokecenter2FMovementData_PlayerWalksLeftAndUp:
	step LEFT
	step UP
	step_end

Pokecenter2FMovementData_PlayerWalksRightAndUp:
	step RIGHT
	step UP
	step_end

Pokecenter2FMovementData_PlayerTakesThreeStepsDown:
	step DOWN
	step DOWN
	step DOWN
	step_end

Pokecenter2FMovementData_PlayerTakesTwoStepsDown:
	step DOWN
	step DOWN
	step_end

Pokecenter2FMovementData_PlayerTakesOneStepDown:
	step DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightAndDown:
	slow_step RIGHT
	slow_step DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_2:
	slow_step RIGHT
	turn_head DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_end

Pokecenter2FMovementData_ReceptionistStepsLeftLooksRight:
	slow_step LEFT
	turn_head RIGHT
	step_end

Pokecenter2FMobileMovementData_ReceptionistWalksUpAndLeft:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_end

Pokecenter2FMovementData_PlayerWalksOutOfMobileRoom:
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	step_end

Pokecenter2FMobileMovementData_ReceptionistWalksRightAndDown:
	slow_step RIGHT
	slow_step DOWN
	step_end

Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	step_end

Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head LEFT
	step_end

Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingDown:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

Pokecenter2FMovementData_PlayerTakesOneStepDown_2:
	step DOWN
	step_end

Pokecenter2FMovementData_PlayerTakesTwoStepsDown_2:
	step DOWN
	step DOWN
	step_end

Pokecenter2FMovementData_PlayerTakesOneStepUp_2:
	step UP
	step_end

Pokecenter2FMovementData_PlayerTakesOneStepRight:
	step RIGHT
	step_end

Pokecenter2FMovementData_PlayerTakesOneStepLeft:
	step LEFT
	step_end

Pokecenter2FMovementData_ReceptionistStepsLeftLooksRight_2:
	slow_step LEFT
	turn_head RIGHT
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightLooksLeft_2:
	slow_step RIGHT
	turn_head LEFT
	step_end

Text_BattleReceptionistMobile:
	text "Bạn muốn đấu qua"
	line "dây GAME LINK hay"

	para "qua điện thoại di"
	line "động?"
	done

Text_TradeReceptionistMobile:
	text "Bạn muốn giao dịch"
	line "qua dây GAME LINK"

	para "hay qua điện thoại"
	line "di động?"
	done

Text_ThisWayToMobileRoom: ; unreferenced
	text "Đường này đến"
	line "PHÒNG DI ĐỘNG."
	done

Text_BattleReceptionistIntro:
	text "Chào mừng đến CLB"
	line "ĐẤU TRƯỜNG QUA CÁP"

	para "Bạn có thể thi đấu"
	line "với bạn bè ở đây."

	para "Bạn có muốn thách"
	line "thức không?"
	done

Text_TradeReceptionistIntro:
	text "Chào mừng đến"
	line "TRUNG TÂM GIAO"
	cont "DỊCH QUA CÁP."

	para "Bạn có thể giao"
	line "dịch #MON ở đây"
	cont "với bạn bè."

	para "Bạn có muốn giao"
	line "dịch không?"
	done

Text_TimeCapsuleReceptionistIntro:
	text "Chào mừng đến"
	line "CỖ MÁY THỜI GIAN."

	para "Bạn có thể du"
	line "hành về quá khứ"
	cont "và giao dịch"
	cont "#MON."

	para "Bạn có muốn giao"
	line "dịch xuyên thời"
	cont "gian không?"
	done

YourFriendIsNotReadyText:
	text "Bạn bè của bạn"
	line "chưa sẵn sàng."
	prompt

Text_MustSaveGame:
	text "Trước khi mở kết"
	line "nối, bạn phải lưu"
	cont "game."
	done

Text_PleaseWait:
	text "Vui lòng đợi."
	done

Text_LinkTimedOut:
	text "Kết nối đã bị đóng"
	line "do không hoạt"
	cont "động."

	para "Hãy liên lạc với"
	line "bạn bè và quay lại"
	cont "sau."
	prompt

Text_PleaseComeAgain:
	text "Hãy quay lại nhé."
	prompt

Text_PleaseComeInDuplicate: ; unreferenced
	text "Mời bạn vào."
	prompt

Text_TemporaryStagingInLinkRoom: ; unreferenced
	text "Chúng tôi sẽ đưa"
	line "bạn vào phòng kết"
	cont "nối tạm thời."
	done

Text_CantLinkToThePast:
	text "Bạn không thể kết"
	line "nối về quá khứ ở"
	cont "đây."
	prompt

Text_IncompatibleRooms:
	text "Đã chọn các phòng"
	line "không tương thích."
	prompt

Text_PleaseComeIn:
	text "Mời bạn vào."
	done

Text_PleaseEnter: ; unreferenced
	text "Mời bạn vào."
	prompt

Text_RejectNewMon:
	text "Xin lỗi--@"
	text_ram wStringBuffer1
	text_start
	line "không thể mang đi."
	prompt

Text_RejectMonWithNewMove:
	text "Bạn không thể mang"
	line "@"
	text_ram wStringBuffer1
	text " với"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

Text_RejectMonWithMail:
	text "Bạn không thể mang"
	line "@"
	text_ram wStringBuffer1
	text " có"
	cont "THƯ theo."
	prompt

Text_TimeCapsuleClosed:
	text "Xin lỗi--MÁY THỜI"
	line "GIAN đang được bảo"
	cont "trì."
	done

Text_TradeRoomClosed:
	text "Xin lỗi--MÁY GIAO"
	line "DỊCH đang được bảo"
	cont "trì."
	done

Text_BattleRoomClosed:
	text "Xin lỗi--MÁY ĐẤU"
	line "đang được bảo trì."
	done

Text_MysteryGiftDeliveryGuy_Intro:
	text "Xin chào! Bạn là"
	line "<PLAYER>, đúng"
	cont "không?"

	para "Tôi có thứ dành"
	line "cho bạn."
	done

Text_MysteryGiftDeliveryGuy_HereYouGo:
	text "Đây này!"
	done

Text_MysteryGiftDeliveryGuy_Outro:
	text "Chúng tôi hy vọng"
	line "phục vụ bạn lần"
	cont "nữa."
	done

Text_MysteryGiftDeliveryGuy_NoRoom:
	text "Ồ, bạn không có"
	line "chỗ cho đồ này."

	para "Ghé vào bất kỳ TT"
	line "#MON nào trong"

	para "cả nước để lấy"
	line "nó."
	done

Text_MysteryGiftDeliveryGuy_SaidNo:
	text "Không? Lạ thật…"
	done

Text_OhPleaseWait:
	text "Ồ, vui lòng đợi."
	done

Text_ChangeTheLook:
	text "Chúng tôi cần đổi"
	line "diện mạo ở đây…"
	done

Text_LikeTheLook:
	text "Kiểu này bạn thấy"
	line "thế nào?"
	done

Text_BrokeStadiumRules:
	text "Xin lỗi!"

	para "Theo luật STADIUM,"
	line "hãy mang sáu"

	para "#MON khác nhau,"
	line "không bao gồm EGG."

	para "Sáu #MON phải"
	line "khác nhau."

	para "Ngoài ra, chúng"
	line "không được cầm"
	cont "đồ giống nhau."

	para "Hãy quay lại khi"
	line "bạn đã sẵn sàng."
	done

Pokecenter2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  7, POKECENTER_2F, -1
	warp_event  5,  0, TRADE_CENTER, 1
	warp_event  9,  0, COLOSSEUM, 1
	warp_event 13,  2, TIME_CAPSULE, 1
	warp_event  6,  0, MOBILE_TRADE_ROOM, 1
	warp_event 10,  0, MOBILE_BATTLE_ROOM, 1

	def_coord_events

	def_bg_events
	bg_event  7,  3, BGEVENT_READ, Pokecenter2FLinkRecordSign

	def_object_events
	object_event  5,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_Trade, -1
	object_event  9,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_Battle, -1
	object_event 13,  3, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_TimeCapsule, -1
	object_event  1,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Pokecenter2FOfficerScript, EVENT_MYSTERY_GIFT_DELIVERY_GUY
