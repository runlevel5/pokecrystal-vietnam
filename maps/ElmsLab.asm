	object_const_def
	const ELMSLAB_ELM
	const ELMSLAB_ELMS_AIDE
	const ELMSLAB_POKE_BALL1
	const ELMSLAB_POKE_BALL2
	const ELMSLAB_POKE_BALL3
	const ELMSLAB_OFFICER

ElmsLab_MapScripts:
	def_scene_scripts
	scene_script ElmsLabMeetElmScene, SCENE_ELMSLAB_MEET_ELM
	scene_script ElmsLabNoop1Scene,   SCENE_ELMSLAB_CANT_LEAVE
	scene_script ElmsLabNoop2Scene,   SCENE_ELMSLAB_NOOP
	scene_script ElmsLabNoop3Scene,   SCENE_ELMSLAB_MEET_OFFICER
	scene_script ElmsLabNoop4Scene,   SCENE_ELMSLAB_UNUSED
	scene_script ElmsLabNoop5Scene,   SCENE_ELMSLAB_AIDE_GIVES_POTION
	scene_const SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS

	def_callbacks
	callback MAPCALLBACK_OBJECTS, ElmsLabMoveElmCallback

ElmsLabMeetElmScene:
	sdefer ElmsLabWalkUpToElmScript
	end

ElmsLabNoop1Scene:
	end

ElmsLabNoop2Scene:
	end

ElmsLabNoop3Scene:
	end

ElmsLabNoop4Scene:
	end

ElmsLabNoop5Scene:
	end

ElmsLabMoveElmCallback:
	checkscene
	iftrue .Skip ; not SCENE_ELMSLAB_MEET_ELM
	moveobject ELMSLAB_ELM, 3, 4
.Skip:
	endcallback

ElmsLabWalkUpToElmScript:
	applymovement PLAYER, ElmsLab_WalkUpToElmMovement
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	turnobject ELMSLAB_ELM, RIGHT
	opentext
	writetext ElmText_Intro
.MustSayYes:
	yesorno
	iftrue .ElmGetsEmail
	writetext ElmText_Refused
	sjump .MustSayYes

.ElmGetsEmail:
	writetext ElmText_Accepted
	promptbutton
	writetext ElmText_ResearchAmbitions
	waitbutton
	closetext
	playsound SFX_GLASS_TING
	pause 30
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 10
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext ElmText_GotAnEmail
	waitbutton
	closetext
	opentext
	turnobject ELMSLAB_ELM, RIGHT
	writetext ElmText_MissionFromMrPokemon
	waitbutton
	closetext
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement1
	turnobject PLAYER, UP
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement2
	turnobject PLAYER, RIGHT
	opentext
	writetext ElmText_ChooseAPokemon
	waitbutton
	setscene SCENE_ELMSLAB_CANT_LEAVE
	closetext
	end

ProfElmScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue ElmCheckMasterBall
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue ElmGiveTicketScript
ElmCheckMasterBall:
	checkevent EVENT_GOT_MASTER_BALL_FROM_ELM
	iftrue ElmCheckEverstone
	checkflag ENGINE_RISINGBADGE
	iftrue ElmGiveMasterBallScript
ElmCheckEverstone:
	checkevent EVENT_GOT_EVERSTONE_FROM_ELM
	iftrue ElmScript_CallYou
	checkevent EVENT_SHOWED_TOGEPI_TO_ELM
	iftrue ElmGiveEverstoneScript
	checkevent EVENT_TOLD_ELM_ABOUT_TOGEPI_OVER_THE_PHONE
	iffalse ElmCheckTogepiEgg
	setval TOGEPI
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	setval TOGETIC
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	writetext ElmThoughtEggHatchedText
	waitbutton
	closetext
	end

ElmEggHatchedScript:
	setval TOGEPI
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	setval TOGETIC
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	sjump ElmCheckGotEggAgain

ElmCheckTogepiEgg:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iffalse ElmCheckGotEggAgain
	checkevent EVENT_TOGEPI_HATCHED
	iftrue ElmEggHatchedScript
ElmCheckGotEggAgain:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE ; why are we checking it again?
	iftrue ElmWaitingEggHatchScript
	checkflag ENGINE_ZEPHYRBADGE
	iftrue ElmAideHasEggScript
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue ElmStudyingEggScript
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue ElmAfterTheftScript
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue ElmDescribesMrPokemonScript
	writetext ElmText_LetYourMonBattleIt
	waitbutton
	closetext
	end

LabTryToLeaveScript:
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, ElmsLab_CantLeaveMovement
	end

CyndaquilPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	reanchormap
	pokepic CYNDAQUIL
	cry CYNDAQUIL
	waitbutton
	closepokepic
	opentext
	writetext TakeCyndaquilText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, CYNDAQUIL
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke CYNDAQUIL, 5, BERRY
	closetext
	readvar VAR_FACING
	ifequal RIGHT, ElmDirectionsScript
	applymovement PLAYER, AfterCyndaquilMovement
	sjump ElmDirectionsScript

TotodilePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	reanchormap
	pokepic TOTODILE
	cry TOTODILE
	waitbutton
	closepokepic
	opentext
	writetext TakeTotodileText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, TOTODILE
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke TOTODILE, 5, BERRY
	closetext
	applymovement PLAYER, AfterTotodileMovement
	sjump ElmDirectionsScript

ChikoritaPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	reanchormap
	pokepic CHIKORITA
	cry CHIKORITA
	waitbutton
	closepokepic
	opentext
	writetext TakeChikoritaText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, CHIKORITA
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke CHIKORITA, 5, BERRY
	closetext
	applymovement PLAYER, AfterChikoritaMovement
	sjump ElmDirectionsScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end

ElmDirectionsScript:
	turnobject PLAYER, UP
	opentext
	writetext ElmDirectionsText1
	waitbutton
	closetext
	addcellnum PHONE_ELM
	opentext
	writetext GotElmsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, LEFT
	opentext
	writetext ElmDirectionsText2
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext ElmDirectionsText3
	waitbutton
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_ELM
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setscene SCENE_ELMSLAB_AIDE_GIVES_POTION
	setmapscene NEW_BARK_TOWN, SCENE_NEWBARKTOWN_NOOP
	end

ElmDescribesMrPokemonScript:
	writetext ElmDescribesMrPokemonText
	waitbutton
	closetext
	end

LookAtElmPokeBallScript:
	opentext
	writetext ElmPokeBallText
	waitbutton
	closetext
	end

ElmsLabHealingMachine:
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .CanHeal
	writetext ElmsLabHealingMachineText1
	waitbutton
	closetext
	end

.CanHeal:
	writetext ElmsLabHealingMachineText2
	yesorno
	iftrue ElmsLabHealingMachine_HealParty
	closetext
	end

ElmsLabHealingMachine_HealParty:
	special StubbedTrainerRankings_Healings
	special HealParty
	playmusic MUSIC_NONE
	setval HEALMACHINE_ELMS_LAB
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	closetext
	end

ElmAfterTheftDoneScript:
	waitbutton
	closetext
	end

ElmAfterTheftScript:
	writetext ElmAfterTheftText1
	checkitem MYSTERY_EGG
	iffalse ElmAfterTheftDoneScript
	promptbutton
	writetext ElmAfterTheftText2
	waitbutton
	takeitem MYSTERY_EGG
	scall ElmJumpBackScript1
	writetext ElmAfterTheftText3
	waitbutton
	scall ElmJumpBackScript2
	writetext ElmAfterTheftText4
	promptbutton
	writetext ElmAfterTheftText5
	promptbutton
	setevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	setflag ENGINE_MOBILE_SYSTEM
	setmapscene ROUTE_29, SCENE_ROUTE29_CATCH_TUTORIAL
	clearevent EVENT_ROUTE_30_YOUNGSTER_JOEY
	setevent EVENT_ROUTE_30_BATTLE
	writetext ElmAfterTheftText6
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS
	end

ElmStudyingEggScript:
	writetext ElmStudyingEggText
	waitbutton
	closetext
	end

ElmAideHasEggScript:
	writetext ElmAideHasEggText
	waitbutton
	closetext
	end

ElmWaitingEggHatchScript:
	writetext ElmWaitingEggHatchText
	waitbutton
	closetext
	end

ShowElmTogepiScript:
	writetext ShowElmTogepiText1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	setevent EVENT_SHOWED_TOGEPI_TO_ELM
	opentext
	writetext ShowElmTogepiText2
	promptbutton
	writetext ShowElmTogepiText3
	promptbutton
ElmGiveEverstoneScript:
	writetext ElmGiveEverstoneText1
	promptbutton
	verbosegiveitem EVERSTONE
	iffalse ElmScript_NoRoomForEverstone
	writetext ElmGiveEverstoneText2
	waitbutton
	closetext
	setevent EVENT_GOT_EVERSTONE_FROM_ELM
	end

ElmScript_CallYou:
	writetext ElmText_CallYou
	waitbutton
ElmScript_NoRoomForEverstone:
	closetext
	end

ElmGiveMasterBallScript:
	writetext ElmGiveMasterBallText1
	promptbutton
	verbosegiveitem MASTER_BALL
	iffalse .notdone
	setevent EVENT_GOT_MASTER_BALL_FROM_ELM
	writetext ElmGiveMasterBallText2
	waitbutton
.notdone
	closetext
	end

ElmGiveTicketScript:
	writetext ElmGiveTicketText1
	promptbutton
	verbosegiveitem S_S_TICKET
	setevent EVENT_GOT_SS_TICKET_FROM_ELM
	writetext ElmGiveTicketText2
	waitbutton
	closetext
	end

ElmJumpBackScript1:
	closetext
	readvar VAR_FACING
	ifequal DOWN, ElmJumpDownScript
	ifequal UP, ElmJumpUpScript
	ifequal LEFT, ElmJumpLeftScript
	ifequal RIGHT, ElmJumpRightScript
	end

ElmJumpBackScript2:
	closetext
	readvar VAR_FACING
	ifequal DOWN, ElmJumpUpScript
	ifequal UP, ElmJumpDownScript
	ifequal LEFT, ElmJumpRightScript
	ifequal RIGHT, ElmJumpLeftScript
	end

ElmJumpUpScript:
	applymovement ELMSLAB_ELM, ElmJumpUpMovement
	opentext
	end

ElmJumpDownScript:
	applymovement ELMSLAB_ELM, ElmJumpDownMovement
	opentext
	end

ElmJumpLeftScript:
	applymovement ELMSLAB_ELM, ElmJumpLeftMovement
	opentext
	end

ElmJumpRightScript:
	applymovement ELMSLAB_ELM, ElmJumpRightMovement
	opentext
	end

AideScript_WalkPotion1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkPotion2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GivePotion:
	opentext
	writetext AideText_GiveYouPotion
	promptbutton
	verbosegiveitem POTION
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_NOOP
	end

AideScript_WalkBalls1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkBalls2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GiveYouBalls:
	opentext
	writetext AideText_GiveYouBalls
	promptbutton
	getitemname STRING_BUFFER_4, POKE_BALL
	scall AideScript_ReceiveTheBalls
	giveitem POKE_BALL, 5
	writetext AideText_ExplainBalls
	promptbutton
	itemnotify
	closetext
	setscene SCENE_ELMSLAB_NOOP
	end

AideScript_ReceiveTheBalls:
	jumpstd ReceiveItemScript
	end

ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue AideScript_AfterTheft
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue AideScript_ExplainBalls
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue AideScript_TheftTestimony
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	end

AideScript_TheftTestimony:
	writetext AideText_TheftTestimony
	waitbutton
	closetext
	end

AideScript_ExplainBalls:
	writetext AideText_ExplainBalls
	waitbutton
	closetext
	end

AideScript_AfterTheft:
	writetext AideText_AfterTheft
	waitbutton
	closetext
	end

MeetCopScript2:
	applymovement PLAYER, MeetCopScript2_StepLeft

MeetCopScript:
	applymovement PLAYER, MeetCopScript_WalkUp
CopScript:
	turnobject ELMSLAB_OFFICER, LEFT
	opentext
	writetext ElmsLabOfficerText1
	promptbutton
	special NameRival
	writetext ElmsLabOfficerText2
	waitbutton
	closetext
	applymovement ELMSLAB_OFFICER, OfficerLeavesMovement
	disappear ELMSLAB_OFFICER
	setscene SCENE_ELMSLAB_NOOP
	end

ElmsLabWindow:
	opentext
	checkflag ENGINE_FLYPOINT_VIOLET
	iftrue .Normal
	checkevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	iftrue .BreakIn
	sjump .Normal

.BreakIn:
	writetext ElmsLabWindowText2
	waitbutton
	closetext
	end

.Normal:
	writetext ElmsLabWindowText1
	waitbutton
	closetext
	end

ElmsLabTravelTip1:
	jumptext ElmsLabTravelTip1Text

ElmsLabTravelTip2:
	jumptext ElmsLabTravelTip2Text

ElmsLabTravelTip3:
	jumptext ElmsLabTravelTip3Text

ElmsLabTravelTip4:
	jumptext ElmsLabTravelTip4Text

ElmsLabTrashcan:
	jumptext ElmsLabTrashcanText

ElmsLabPC:
	jumptext ElmsLabPCText

ElmsLabTrashcan2: ; unreferenced
	jumpstd TrashCanScript

ElmsLabBookshelf:
	jumpstd DifficultBookshelfScript

ElmsLab_WalkUpToElmMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

ElmsLab_CantLeaveMovement:
	step UP
	step_end

MeetCopScript2_StepLeft:
	step LEFT
	step_end

MeetCopScript_WalkUp:
	step UP
	step UP
	turn_head RIGHT
	step_end

OfficerLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

AideWalksRight1:
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksRight2:
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksLeft1:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AideWalksLeft2:
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

ElmJumpUpMovement:
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end

ElmJumpDownMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

ElmJumpLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

ElmJumpRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

ElmsLab_ElmToDefaultPositionMovement1:
	step UP
	step_end

ElmsLab_ElmToDefaultPositionMovement2:
	step RIGHT
	step RIGHT
	step UP
	turn_head DOWN
	step_end

AfterCyndaquilMovement:
	step LEFT
	step UP
	turn_head UP
	step_end

AfterTotodileMovement:
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

AfterChikoritaMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

ElmText_Intro:
	text "ELM: <PLAY_G>!"
	line "Con đến rồi à!"

	para "Thầy cần nhờ con"
	line "một việc."

	para "Thầy đang nghiên"
	line "cứu #MON mới."

	para "Thầy muốn hỏi con"
	line "có thể giúp thầy"

	para "được không,"
	line "<PLAY_G>."

	para "Con thấy đấy…"

	para "Thầy đang viết bài"
	line "để trình bày tại"

	para "một hội nghị."

	para "Nhưng vẫn còn vài"
	line "điều thầy chưa"

	para "hiểu rõ lắm."

	para "Vậy nên!"

	para "Thầy muốn con nuôi"
	line "một #MON mà"

	para "thầy mới bắt được."
	done

ElmText_Accepted:
	text "Cảm ơn, <PLAY_G>!"

	para "Con giúp thầy"
	line "nhiều lắm!"
	done

ElmText_Refused:
	text "Nhưng… Làm ơn,"
	line "thầy cần con giúp!"
	done

ElmText_ResearchAmbitions:
	text "Khi thầy công bố"
	line "phát hiện, chắc"

	para "chắn ta sẽ hiểu"
	line "sâu hơn về nhiều"

	para "bí ẩn của #MON."

	para "Con cứ tin đi!"
	done

ElmText_GotAnEmail:
	text "Ồ, này! Thầy có"
	line "e-mail mới!"

	para "<……><……><……>"
	line "Hm… Ừ-hứ…"

	para "OK…"
	done

ElmText_MissionFromMrPokemon:
	text "Này, nghe đây."

	para "Thầy có quen một"
	line "người tên"
	cont "ÔNG LÃO #MON."

	para "Ông ấy hay tìm"
	line "được thứ lạ và"

	para "kể về phát hiện"
	line "của mình."

	para "Vừa rồi thầy nhận"
	line "được e-mail nói"

	para "rằng lần này"
	line "là thật."

	para "Nghe hấp dẫn đấy,"
	line "nhưng bọn thầy"

	para "đang bận nghiên"
	line "cứu #MON…"

	para "Khoan!"

	para "Thầy biết rồi!"

	para "<PLAY_G>, con có"
	line "thể đi thay không?"
	done

ElmText_ChooseAPokemon:
	text "Thầy muốn con nuôi"
	line "một trong những"

	para "#MON trong"
	line "các BALL này."

	para "Con sẽ là người"
	line "bạn đầu tiên của"
	cont "#MON đó,"
	cont "<PLAY_G>!"

	para "Nào. Chọn một đi!"
	done

ElmText_LetYourMonBattleIt:
	text "Nếu gặp #MON"
	line "hoang dã, cho"
	cont "#MON con đánh!"
	done

LabWhereGoingText:
	text "ELM: Khoan! Con"
	line "định đi đâu vậy?"
	done

TakeCyndaquilText:
	text "ELM: Con chọn"
	line "CYNDAQUIL, #MON"
	cont "hệ lửa chứ?"
	done

TakeTotodileText:
	text "ELM: Con muốn"
	line "TOTODILE, #MON"
	cont "hệ nước chứ?"
	done

TakeChikoritaText:
	text "ELM: Vậy con thích"
	line "CHIKORITA, #MON"
	cont "hệ cỏ chứ?"
	done

DidntChooseStarterText:
	text "ELM: Suy nghĩ kỹ"
	line "đi nhé."

	para "Bạn đồng hành rất"
	line "quan trọng đấy."
	done

ChoseStarterText:
	text "ELM: Thầy cũng"
	line "nghĩ đó là #MON"
	cont "tuyệt vời!"
	done

ReceivedStarterText:
	text "<PLAYER> nhận được"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

ElmDirectionsText1:
	text "ÔNG LÃO #MON"
	line "sống hơi xa hơn"

	para "CHERRYGROVE, thành"
	line "phố kế bên."

	para "Đường đi gần như"
	line "thẳng nên con"

	para "không thể lạc"
	line "được."

	para "Nhưng phòng khi,"
	line "đây là số điện"

	para "thoại thầy. Gọi"
	line "nếu có chuyện gì!"
	done

ElmDirectionsText2:
	text "Nếu #MON con bị"
	line "thương, con có"

	para "thể hồi phục bằng"
	line "máy này."

	para "Cứ thoải mái dùng"
	line "bất cứ lúc nào."
	done

ElmDirectionsText3:
	text "<PLAY_G>, thầy"
	line "trông cậy vào con!"
	done

GotElmsNumberText:
	text "<PLAYER> có số"
	line "của GS ELM."
	done

ElmDescribesMrPokemonText:
	text "ÔNG LÃO #MON"
	line "hay đi khắp nơi"
	cont "và tìm đồ hiếm."

	para "Tiếc là chúng chỉ"
	line "hiếm thôi chứ"
	cont "không hữu ích…"
	done

ElmPokeBallText:
	text "Bên trong là"
	line "#MON do GS"
	cont "ELM bắt được."
	done

ElmsLabHealingMachineText1:
	text "Không biết cái này"
	line "dùng để làm gì?"
	done

ElmsLabHealingMachineText2:
	text "Bạn muốn hồi phục"
	line "#MON không?"
	done

ElmAfterTheftText1:
	text "<PLAY_G>,"
	line "thật khủng khiếp…"

	para "À đúng rồi, phát"
	line "hiện của ÔNG"
	cont "#MON là gì?"
	done

ElmAfterTheftText2:
	text "<PLAYER> đưa TRỨNG"
	line "BÍ ẨN cho GS"
	cont "ELM."
	done

ElmAfterTheftText3:
	text "Cái này?"
	done

ElmAfterTheftText4:
	text "Nhưng… Đây là"
	line "TRỨNG #MON sao?"

	para "Nếu đúng, đây là"
	line "phát hiện lớn!"
	done

ElmAfterTheftText5:
	text "Gì cơ?!?"

	para "GS OAK cho con"
	line "#DEX á?"

	para "<PLAY_G>, thật"
	line "không? Thật là"
	cont "đáng kinh ngạc!"

	para "Ông ấy rất giỏi"
	line "nhìn thấy tiềm"
	cont "năng của huấn"
	cont "luyện viên."

	para "Ồ, <PLAY_G>. Con"
	line "có thể trở thành"

	para "NHÀ VÔ ĐỊCH đấy."

	para "Con có vẻ hợp"
	line "với #MON lắm."

	para "Con nên thử thách"
	line "GYM #MON đi."

	para "GYM gần nhất là ở"
	line "TP. VIOLET."
	done

ElmAfterTheftText6:
	text "…<PLAY_G>. Con"
	line "đường đến vô địch"

	para "sẽ còn dài lắm."

	para "Trước khi đi, nhớ"
	line "nói chuyện với"
	cont "mẹ con nhé."
	done

ElmStudyingEggText:
	text "Đừng bỏ cuộc!"
	line "Thầy sẽ gọi nếu"

	para "biết gì về TRỨNG"
	line "đó!"
	done

ElmAideHasEggText:
	text "ELM: <PLAY_G>?"
	line "Con không gặp trợ"
	cont "lý của thầy à?"

	para "Anh ấy đáng lẽ"
	line "gặp con với TRỨNG"

	para "tại TT #MON"
	line "TP. VIOLET."

	para "Chắc con vừa lỡ"
	line "thôi. Thử gặp anh"
	cont "ấy ở đó xem."
	done

ElmWaitingEggHatchText:
	text "ELM: Này, TRỨNG"
	line "có thay đổi gì"
	cont "chưa?"
	done

ElmThoughtEggHatchedText:
	text "<PLAY_G>? Thầy"
	line "tưởng TRỨNG nở"
	cont "rồi mà."

	para "#MON đâu rồi?"
	done

ShowElmTogepiText1:
	text "ELM: <PLAY_G>, con"
	line "trông khỏe quá!"
	done

ShowElmTogepiText2:
	text "Gì?!? #MON đó!?"
	done

ShowElmTogepiText3:
	text "TRỨNG đã nở!"
	line "Vậy #MON sinh"
	cont "ra từ TRỨNG…"

	para "Không, có lẽ không"
	line "phải tất cả."

	para "Ồ, còn rất nhiều"
	line "thứ cần nghiên"
	cont "cứu."
	done

ElmGiveEverstoneText1:
	text "Cảm ơn, <PLAY_G>!"
	line "Con đang giúp giải"

	para "bí ẩn #MON cho"
	line "bọn thầy!"

	para "Thầy muốn tặng con"
	line "thứ này để cảm ơn."
	done

ElmGiveEverstoneText2:
	text "Đó là ĐÁ BẤT BIẾN."

	para "Một số #MON sẽ"
	line "tiến hóa khi đạt"

	para "cấp độ nhất định."

	para "#MON giữ ĐÁ"
	line "BẤT BIẾN sẽ"
	cont "không tiến hóa."

	para "Đưa nó cho #MON"
	line "mà con không muốn"
	cont "tiến hóa."
	done

ElmText_CallYou:
	text "ELM: <PLAY_G>,"
	line "thầy sẽ gọi nếu"
	cont "có chuyện gì."
	done

AideText_AfterTheft:
	text "…thở dài… #MON"
	line "bị đánh cắp đó."

	para "Không biết nó"
	line "đang thế nào."

	para "Người ta nói"
	line "#MON nuôi bởi"

	para "người xấu sẽ trở"
	line "nên xấu tính."
	done

ElmGiveMasterBallText1:
	text "ELM: Chào,"
	line "<PLAY_G>! Nhờ con,"

	para "nghiên cứu thầy"
	line "tiến triển tốt!"

	para "Nhận cái này như"
	line "lời cảm ơn nhé."
	done

ElmGiveMasterBallText2:
	text "MASTER BALL là"
	line "tốt nhất!"

	para "Đó là BALL tối"
	line "thượng! Nó bắt"

	para "được mọi #MON"
	line "chắc chắn."

	para "Nó chỉ được trao"
	line "cho nhà nghiên"
	cont "cứu #MON."

	para "Thầy nghĩ con dùng"
	line "nó tốt hơn thầy,"
	cont "<PLAY_G>!"
	done

ElmGiveTicketText1:
	text "ELM: <PLAY_G>!"
	line "Con đây rồi!"

	para "Thầy gọi vì có"
	line "thứ cho con."

	para "Đây là VÉ TÀU."

	para "Giờ con có thể bắt"
	line "#MON ở KANTO."
	done

ElmGiveTicketText2:
	text "Tàu khởi hành từ"
	line "TP. OLIVINE."

	para "Nhưng con biết"
	line "rồi, <PLAY_G>."

	para "Xét cho cùng, con"
	line "đã đi khắp nơi"
	cont "với #MON."

	para "Gửi lời thăm GS"
	line "OAK ở KANTO nhé!"
	done

ElmsLabMonEggText: ; unreferenced
	text "Đây là TRỨNG #"
	line "MON được GS ELM"
	cont "nghiên cứu."
	done

AideText_GiveYouPotion:
	text "<PLAY_G>, anh muốn"
	line "đưa em cái này cho"
	cont "chuyến đi."
	done

AideText_AlwaysBusy:
	text "Chỉ có hai người"
	line "nên bọn anh luôn"
	cont "bận rộn."
	done

AideText_TheftTestimony:
	text "Có tiếng động lớn"
	line "bên ngoài…"

	para "Khi ra xem, ai đó"
	line "đã trộm #MON."

	para "Không thể tin"
	line "được có người làm"
	cont "vậy!"

	para "…thở dài… #MON"
	line "bị trộm đó."

	para "Không biết nó"
	line "đang thế nào."

	para "Người ta nói"
	line "#MON nuôi bởi"

	para "người xấu sẽ trở"
	line "nên xấu tính."
	done

AideText_GiveYouBalls:
	text "<PLAY_G>!"

	para "Dùng mấy cái này"
	line "cho #DEX nhé!"
	done

AideText_ExplainBalls:
	text "Để thêm vào"
	line "#DEX, em phải"
	cont "bắt #MON."

	para "Ném BÓNG # vào"
	line "#MON hoang dã"
	cont "để bắt chúng."
	done

ElmsLabOfficerText1:
	text "Tôi nghe có vụ"
	line "trộm #MON…"

	para "Tôi đang lấy thông"
	line "tin từ GS ELM."

	para "Hình như đó là nam"
	line "thanh niên có tóc"
	cont "dài màu đỏ…"

	para "Gì cơ?"

	para "Cậu đấu với người"
	line "như vậy à?"

	para "Cậu có biết tên"
	line "hắn không?"
	done

ElmsLabOfficerText2:
	text "OK! Vậy <RIVAL>"
	line "là tên hắn."

	para "Cảm ơn đã giúp"
	line "điều tra!"
	done

ElmsLabWindowText1:
	text "Cửa sổ đang mở."

	para "Gió mát đang thổi"
	line "vào."
	done

ElmsLabWindowText2:
	text "Hắn đột nhập qua"
	line "đây!"
	done

ElmsLabTravelTip1Text:
	text "<PLAYER> mở"
	line "một cuốn sách."

	para "Mẹo đi đường 1:"

	para "Nhấn START để"
	line "mở MENU."
	done

ElmsLabTravelTip2Text:
	text "<PLAYER> mở"
	line "một cuốn sách."

	para "Mẹo đi đường 2:"

	para "Ghi lại hành trình"
	line "bằng LƯU!"
	done

ElmsLabTravelTip3Text:
	text "<PLAYER> mở"
	line "một cuốn sách."

	para "Mẹo đi đường 3:"

	para "Mở TÚI ĐỒ và nhấn"
	line "SELECT để di"
	cont "chuyển vật phẩm."
	done

ElmsLabTravelTip4Text:
	text "<PLAYER> mở"
	line "một cuốn sách."

	para "Mẹo đi đường 4:"

	para "Xem chiêu #MON."
	line "Nhấn A để đổi"

	para "thứ tự chiêu."
	done

ElmsLabTrashcanText:
	text "Vỏ bánh GS ELM"
	line "ăn nằm trong đó…"
	done

ElmsLabPCText:
	text "QUAN SÁT VỀ"
	line "TIẾN HÓA #MON"

	para "…Trên màn hình"
	line "ghi vậy…"
	done

ElmsLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, NEW_BARK_TOWN, 1
	warp_event  5, 11, NEW_BARK_TOWN, 1

	def_coord_events
	coord_event  4,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  5,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript
	coord_event  5,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotion1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotion2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS, AideScript_WalkBalls1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS, AideScript_WalkBalls2

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, ElmsLabHealingMachine
	bg_event  6,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  0,  7, BGEVENT_READ, ElmsLabTravelTip1
	bg_event  1,  7, BGEVENT_READ, ElmsLabTravelTip2
	bg_event  2,  7, BGEVENT_READ, ElmsLabTravelTip3
	bg_event  3,  7, BGEVENT_READ, ElmsLabTravelTip4
	bg_event  6,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  3, BGEVENT_READ, ElmsLabTrashcan
	bg_event  5,  0, BGEVENT_READ, ElmsLabWindow
	bg_event  3,  5, BGEVENT_DOWN, ElmsLabPC

	def_object_events
	object_event  5,  2, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfElmScript, -1
	object_event  2,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ElmsAideScript, EVENT_ELMS_AIDE_IN_LAB
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  5,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CopScript, EVENT_COP_IN_ELMS_LAB
