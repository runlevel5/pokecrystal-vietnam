	object_const_def
	const ROUTE36NATIONALPARKGATE_OFFICER1
	const ROUTE36NATIONALPARKGATE_YOUNGSTER1
	const ROUTE36NATIONALPARKGATE_YOUNGSTER2
	const ROUTE36NATIONALPARKGATE_ROCKER
	const ROUTE36NATIONALPARKGATE_POKEFAN_M
	const ROUTE36NATIONALPARKGATE_YOUNGSTER3
	const ROUTE36NATIONALPARKGATE_YOUNGSTER4
	const ROUTE36NATIONALPARKGATE_LASS
	const ROUTE36NATIONALPARKGATE_YOUNGSTER5
	const ROUTE36NATIONALPARKGATE_YOUNGSTER6
	const ROUTE36NATIONALPARKGATE_YOUNGSTER7
	const ROUTE36NATIONALPARKGATE_OFFICER2

Route36NationalParkGate_MapScripts:
	def_scene_scripts
	scene_script Route36NationalParkGateNoop1Scene,             SCENE_ROUTE36NATIONALPARKGATE_NOOP
	scene_script Route36NationalParkGateNoop2Scene,             SCENE_ROUTE36NATIONALPARKGATE_UNUSED
	scene_script Route36NationalParkGateLeaveContestEarlyScene, SCENE_ROUTE36NATIONALPARKGATE_LEAVE_CONTEST_EARLY

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route36NationalParkGateCheckIfContestRunningCallback
	callback MAPCALLBACK_OBJECTS, Route36NationalParkGateCheckIfContestAvailableCallback

Route36NationalParkGateNoop1Scene:
	end

Route36NationalParkGateNoop2Scene:
	end

Route36NationalParkGateLeaveContestEarlyScene:
	sdefer Route36NationalParkGateLeavingContestEarlyScript
	end

Route36NationalParkGateCheckIfContestRunningCallback:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	setscene SCENE_ROUTE36NATIONALPARKGATE_NOOP
	endcallback

.BugContestIsRunning:
	setscene SCENE_ROUTE36NATIONALPARKGATE_LEAVE_CONTEST_EARLY
	endcallback

Route36NationalParkGateCheckIfContestAvailableCallback:
	checkevent EVENT_WARPED_FROM_ROUTE_35_NATIONAL_PARK_GATE
	iftrue .Return
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .SetContestOfficer
	ifequal THURSDAY, .SetContestOfficer
	ifequal SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .SetContestOfficer
	disappear ROUTE36NATIONALPARKGATE_OFFICER1
	appear ROUTE36NATIONALPARKGATE_OFFICER2
	endcallback

.SetContestOfficer:
	appear ROUTE36NATIONALPARKGATE_OFFICER1
	disappear ROUTE36NATIONALPARKGATE_OFFICER2
.Return:
	endcallback

Route36NationalParkGateLeavingContestEarlyScript:
	turnobject PLAYER, UP
	opentext
	readvar VAR_CONTESTMINUTES
	addval 1
	getnum STRING_BUFFER_3
	writetext Route36NationalParkGateOfficer1WantToFinishText
	yesorno
	iffalse .GoBackToContest
	writetext Route36NationalParkGateOfficer1WaitHereForAnnouncementText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	scall .CopyContestants
	disappear ROUTE36NATIONALPARKGATE_OFFICER1
	appear ROUTE36NATIONALPARKGATE_OFFICER2
	applymovement PLAYER, Route36NationalParkGatePlayerWaitWithContestantsMovement
	pause 15
	special FadeInFromBlack
	jumpstd BugContestResultsScript

.GoBackToContest:
	writetext Route36NationalParkGateOfficer1OkGoFinishText
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	playsound SFX_EXIT_BUILDING
	special FadeOutToWhite
	waitsfx
	warpfacing LEFT, NATIONAL_PARK_BUG_CONTEST, 33, 18
	end

.CopyContestants:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_1A
	iftrue .Not1
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER1
.Not1:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_2A
	iftrue .Not2
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER2
.Not2:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_3A
	iftrue .Not3
	appear ROUTE36NATIONALPARKGATE_ROCKER
.Not3:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_4A
	iftrue .Not4
	appear ROUTE36NATIONALPARKGATE_POKEFAN_M
.Not4:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_5A
	iftrue .Not5
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER3
.Not5:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_6A
	iftrue .Not6
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER4
.Not6:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_7A
	iftrue .Not7
	appear ROUTE36NATIONALPARKGATE_LASS
.Not7:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_8A
	iftrue .Not8
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER5
.Not8:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_9A
	iftrue .Not9
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER6
.Not9:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_10A
	iftrue .Not10
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER7
.Not10:
	special UpdateSprites
	end

Route36OfficerScriptContest:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, _ContestNotOn
	ifequal MONDAY, _ContestNotOn
	ifequal WEDNESDAY, _ContestNotOn
	ifequal FRIDAY, _ContestNotOn
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route36Officer_ContestHasConcluded
	scall Route36ParkGate_DayToText
	writetext Route36NationalParkGateOfficer1AskToParticipateText
	yesorno
	iffalse .DecidedNotToJoinContest
	readvar VAR_PARTYCOUNT
	ifgreater 1, .LeaveMonsWithOfficer
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
.ResumeStartingContest:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext Route36NationalParkGateOfficer1GiveParkBallsText
	promptbutton
	waitsfx
	writetext Route36NationalParkGatePlayerReceivedParkBallsText
	playsound SFX_ITEM
	waitsfx
	writetext Route36NationalParkGateOfficer1ExplainsRulesText
	waitbutton
	closetext
	setflag ENGINE_BUG_CONTEST_TIMER
	special GiveParkBalls
	turnobject PLAYER, LEFT
	playsound SFX_EXIT_BUILDING
	special FadeOutToWhite
	waitsfx
	special SelectRandomBugContestContestants
	warpfacing LEFT, NATIONAL_PARK_BUG_CONTEST, 33, 18
	end

.LeaveMonsWithOfficer:
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, .ContinueLeavingMons
	readvar VAR_BOXSPACE
	ifequal 0, .BoxFull
.ContinueLeavingMons:
	special CheckFirstMonIsEgg
	ifequal TRUE, .FirstMonIsEgg
	writetext Route36NationalParkGateOfficer1AskToUseFirstMonText
	yesorno
	iffalse .RefusedToLeaveMons
	special ContestDropOffMons
	iftrue .FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext Route36NationalParkGateOfficer1WellHoldYourMonText
	promptbutton
	writetext Route36NationalParkGatePlayersMonLeftWithHelperText
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	promptbutton
	sjump .ResumeStartingContest

.DecidedNotToJoinContest:
	writetext Route36NationalParkGateOfficer1TakePartInFutureText
	waitbutton
	closetext
	end

.RefusedToLeaveMons:
	writetext Route36NationalParkGateOfficer1ChooseMonAndComeBackText
	waitbutton
	closetext
	end

.FirstMonIsFainted:
	writetext Route36NationalParkGateOfficer1FirstMonCantBattleText
	waitbutton
	closetext
	end

.BoxFull:
	writetext Route36NationalParkGateOfficer1MakeRoomText
	waitbutton
	closetext
	end

.FirstMonIsEgg:
	writetext Route36NationalParkGateOfficer1EggAsFirstMonText
	waitbutton
	closetext
	end

Route36Officer_ContestHasConcluded:
	checkevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	iftrue .Sunstone
	checkevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	iftrue .Everstone
	checkevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	iftrue .GoldBerry
	checkevent EVENT_CONTEST_OFFICER_HAS_BERRY
	iftrue .Berry
	writetext Route36NationalParkGateOfficer1ContestIsOverText
	waitbutton
	closetext
	end

.Sunstone:
	writetext Route36NationalParkGateOfficer1HeresThePrizeText
	promptbutton
	verbosegiveitem SUN_STONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	closetext
	end

.Everstone:
	writetext Route36NationalParkGateOfficer1HeresThePrizeText
	promptbutton
	verbosegiveitem EVERSTONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	closetext
	end

.GoldBerry:
	writetext Route36NationalParkGateOfficer1HeresThePrizeText
	promptbutton
	verbosegiveitem GOLD_BERRY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	closetext
	end

.Berry:
	writetext Route36NationalParkGateOfficer1HeresThePrizeText
	promptbutton
	verbosegiveitem BERRY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_BERRY
	closetext
	end

.BagFull:
	writetext Route36NationalParkGateOfficer1WellHoldPrizeText
	waitbutton
	closetext
	end

_ContestNotOn:
	jumptextfaceplayer Route36NationalParkGateOfficer1SomeMonOnlySeenInParkText

Route36NationalParkGateOfficerScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route36Officer_ContestHasConcluded
	writetext Route36NationalParkGateOfficer1SomeMonOnlySeenInParkText
	waitbutton
	closetext
	end

Route36ParkGate_DayToText:
	jumpstd DayToTextScript
	end

BugCatchingContestant1BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant1BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant1BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant2BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant2BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant2BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant3BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant3BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant3BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant4BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant4BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant4BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant5BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant5BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant5BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant6BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant6BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant6BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant7BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant7BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant7BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant8BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant8BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant8BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant9BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant9BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant9BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant10BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant10BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant10BStillCompetingText
	waitbutton
	closetext
	end

UnusedBugCatchingContestExplanationSign: ; unreferenced
; duplicate of BugCatchingContestExplanationSign in Route35NationalParkGate.asm
	jumptext UnusedBugCatchingContestExplanationText

Route36NationalParkGatePlayerWaitWithContestantsMovement:
	big_step DOWN
	big_step RIGHT
	turn_head UP
	step_end

Route36NationalParkGateOfficer1AskToParticipateText:
	text "Hôm nay là @"
	text_ram wStringBuffer3
	text "."
	line "Có nghĩa là"

	para "BUG CONTEST đang"
	line "diễn ra hôm nay."

	para "Luật rất đơn"
	line "giản."

	para "Sử dụng một con"
	line "#MON, bắt một"

	para "#MON sâu bọ để"
	line "được chấm điểm."

	para "Bạn có muốn thử"
	line "không?"
	done

Route36NationalParkGateOfficer1GiveParkBallsText:
	text "Đây là các BÓNG"
	line "C.VIÊN cho cuộc"
	cont "thi."
	done

Route36NationalParkGatePlayerReceivedParkBallsText:
	text "<PLAYER> nhận được"
	line "{d:BUG_CONTEST_BALLS}"
	cont "BÓNG C.VIÊN."
	done

Route36NationalParkGateOfficer1ExplainsRulesText:
	text "Người có #MON"
	line "sâu bọ mạnh nhất"
	cont "sẽ thắng."

	para "Bạn có"
	line "{d:BUG_CONTEST_MINUTES} phút."

	para "Nếu hết BÓNG"
	line "C.VIÊN, bạn sẽ"
	cont "kết thúc."

	para "Bạn có thể giữ"
	line "#MON cuối cùng"
	cont "mà bạn bắt được."

	para "Hãy ra ngoài và"
	line "bắt con #MON"

	para "sâu bọ mạnh nhất"
	line "mà bạn tìm được!"
	done

Route36NationalParkGateOfficer1AskToUseFirstMonText:
	text "Uh-oh…"

	para "Bạn có nhiều hơn"
	line "một #MON."

	para "Bạn sẽ phải dùng"
	line "@"
	text_ram wStringBuffer3
	text ","

	para "#MON đầu tiên"
	line "trong nhóm."

	para "Bạn đồng ý"
	line "chứ?"
	done

Route36NationalParkGateOfficer1WellHoldYourMonText:
	text "Tốt, chúng tôi sẽ"
	line "giữ các #MON"
	cont "khác trong lúc bạn"
	cont "thi đấu."
	done

Route36NationalParkGatePlayersMonLeftWithHelperText:
	text "#MON của"
	line "<PLAYER> được giao"
	cont "cho TRỢ LÝ THI."
	done

Route36NationalParkGateOfficer1ChooseMonAndComeBackText:
	text "Vui lòng chọn"
	line "#MON để thi"

	para "đấu, rồi đến gặp"
	line "tôi."
	done

Route36NationalParkGateOfficer1TakePartInFutureText:
	text "OK. Chúng tôi hy"
	line "vọng bạn sẽ tham"
	cont "gia trong tương"
	cont "lai."
	done

Route36NationalParkGateOfficer1FirstMonCantBattleText:
	text "Uh-oh…"
	line "#MON đầu tiên"

	para "trong nhóm không"
	line "thể chiến đấu."

	para "Vui lòng đổi nó"
	line "với #MON mà"

	para "bạn muốn dùng,"
	line "rồi đến gặp tôi."
	done

Route36NationalParkGateOfficer1MakeRoomText:
	text "Uh-oh…"
	line "Cả nhóm và PC BOX"

	para "của bạn đều đầy"
	line "rồi."

	para "Bạn không có chỗ"
	line "để đặt #MON sâu"
	cont "bọ mà bạn bắt."

	para "Vui lòng dọn chỗ"
	line "trong nhóm hoặc"

	para "PC BOX, rồi đến"
	line "gặp tôi."
	done

Route36NationalParkGateOfficer1EggAsFirstMonText:
	text "Uh-oh…"
	line "Bạn có một TRỨNG"

	para "là #MON đầu"
	line "tiên trong nhóm."

	para "Vui lòng đổi nó"
	line "với #MON mà"

	para "bạn muốn dùng,"
	line "rồi đến gặp tôi."
	done

Route36NationalParkGateOfficer1WantToFinishText:
	text "Bạn còn @"
	text_ram wStringBuffer3
	text_start
	line "phút nữa."

	para "Bạn có muốn kết"
	line "thúc bây giờ?"
	done

Route36NationalParkGateOfficer1WaitHereForAnnouncementText:
	text "OK. Vui lòng đợi"
	line "ở đây để nghe"

	para "thông báo người"
	line "thắng."
	done

Route36NationalParkGateOfficer1OkGoFinishText:
	text "OK. Vui lòng quay"
	line "lại và hoàn thành"
	cont "cuộc thi."
	done

Route36NationalParkGateOfficer1ContestIsOverText:
	text "BUG CONTEST hôm"
	line "nay đã kết thúc."

	para "Chúng tôi hy vọng"
	line "bạn sẽ tham gia"
	cont "trong tương lai."
	done

Route36NationalParkGateOfficer1SomeMonOnlySeenInParkText:
	text "Một số #MON chỉ"
	line "được thấy trong"
	cont "CÔNG VIÊN."
	done

BugCatchingContestant1BText:
	text "DON: Wow, bạn"
	line "thắng tôi. Bạn"
	cont "giỏi đấy."
	done

BugCatchingContestant1BStillCompetingText:
	text "DON: May mắn đóng"
	line "vai trò lớn."

	para "Bạn không bao giờ"
	line "biết #MON nào"
	cont "sẽ xuất hiện."
	done

BugCatchingContestant2BText:
	text "ED: Tôi ghen tị"
	line "với bạn. Tôi"
	cont "không làm được"
	cont "lần này."
	done

BugCatchingContestant2BStillCompetingText:
	text "ED: #MON lớn"
	line "có thể sẽ thắng?"
	done

BugCatchingContestant3BText:
	text "NICK: Giỏi lắm!"
	line "Tôi sẽ nuôi"
	cont "#MON tốt hơn."
	done

BugCatchingContestant3BStillCompetingText:
	text "NICK: #MON có"
	line "màu sắc khác"

	para "thường có thể được"
	line "điểm cao hơn."
	done

BugCatchingContestant4BText:
	text "WILLIAM: Bạn là"
	line "người thắng? Bạn"
	cont "bắt được gì?"
	done

BugCatchingContestant4BStillCompetingText:
	text "WILLIAM: Tôi hài"
	line "lòng vì tôi bắt"

	para "được #MON mà"
	line "tôi muốn."
	done

BugCatchingContestant5BText:
	text "BENNY: Chúc mừng!"
	line "Bạn đã khiến tôi"
	cont "kính phục!"
	done

BugCatchingContestant5BStillCompetingText:
	text "BENNY: Tôi đã bắt"
	line "SCYTHER trước đó,"
	cont "nhưng không thắng"
	done

BugCatchingContestant6BText:
	text "BARRY: Con #-"
	line "MON bạn bắt được…"
	cont "tuyệt vời!"
	done

BugCatchingContestant6BStillCompetingText:
	text "BARRY: Dễ thắng"
	line "hơn nếu bạn bắt"

	para "#MON sâu bọ cấp"
	line "cao."

	para "Nhưng tôi nghĩ họ"
	line "cũng xét các yếu"
	cont "tố khác."
	done

BugCatchingContestant7BText:
	text "CINDY: Bạn thắng?"
	line "Tuyệt vời!"

	para "Bạn có muốn đi"
	line "tìm #MON sâu bọ"
	cont "với tôi không?"
	done

BugCatchingContestant7BStillCompetingText:
	text "CINDY: Tôi thực"
	line "sự yêu #MON"
	cont "sâu bọ!"
	done

BugCatchingContestant8BText:
	text "JOSH: Tôi… Tôi"
	line "không thể tin là"
	cont "tôi thua trong"
	cont "cuộc thi bắt sâu…"
	done

BugCatchingContestant8BStillCompetingText:
	text "JOSH: Tôi nghe nói"
	line "ai đó đã thắng"
	cont "với CATERPIE!"
	done

BugCatchingContestant9BText:
	text "SAMUEL: Lần sau,"
	line "tôi sẽ thắng."
	done

BugCatchingContestant9BStillCompetingText:
	text "SAMUEL: Chà."
	line "Tôi nghĩ tôi sẽ"
	cont "được điểm cao"
	cont "hơn…"
	done

BugCatchingContestant10BText:
	text "KIPP: Bạn có thể"
	line "chỉ cho tôi vài"
	cont "mẹo không?"

	para "Tôi muốn học"
	line "phong cách của"
	cont "bạn."
	done

BugCatchingContestant10BStillCompetingText:
	text "KIPP: Tôi học rất"
	line "nhiều, nhưng vẫn"

	para "không đủ để"
	line "thắng."
	done

UnusedSilphScope2Text: ; unreferenced
; This text is referring to Sudowoodo.
; The SILPHSCOPE2 was later reworked into the SQUIRTBOTTLE.
	text "Tôi nghe có một"
	line "#MON trông như"
	cont "một cái cây."

	para "Bạn có thể phát"
	line "hiện nó bằng"
	cont "SILPHSCOPE 2."
	done

UnusedBugCatchingContestExplanationText:
; duplicate of BugCatchingContestExplanationText in Route35NationalParkGate.asm
	text "BUG CONTEST được"
	line "tổ chức vào Thứ"

	para "Ba, Thứ Năm và"
	line "Thứ Bảy."

	para "Bạn không chỉ"
	line "nhận giải thưởng"

	para "khi tham gia, mà"
	line "còn được giữ"

	para "#MON sâu bọ mà"
	line "bạn có ở cuối"
	cont "cuộc thi."
	done

Route36NationalParkGateOfficer1WellHoldPrizeText:
	text "Uh-oh… TÚI của"
	line "bạn đầy rồi."

	para "Chúng tôi sẽ giữ"
	line "giải thưởng, nhưng"
	cont "chỉ hôm nay thôi."

	para "Vui lòng dọn chỗ,"
	line "rồi đến gặp tôi."
	done

Route36NationalParkGateOfficer1HeresThePrizeText:
	text "<PLAYER> đúng"
	line "không?"

	para "Đây là giải thưởng"
	line "chúng tôi đang giữ"
	cont "cho bạn."
	done

Route36NationalParkGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, NATIONAL_PARK, 1
	warp_event  0,  5, NATIONAL_PARK, 2
	warp_event  9,  4, ROUTE_36, 1
	warp_event  9,  5, ROUTE_36, 2

	def_coord_events

	def_bg_events
	bg_event  6,  0, BGEVENT_READ, BugCatchingContestExplanationSign

	def_object_events
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route36OfficerScriptContest, EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant1BScript, EVENT_BUG_CATCHING_CONTESTANT_1B
	object_event  4,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant2BScript, EVENT_BUG_CATCHING_CONTESTANT_2B
	object_event  2,  6, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant3BScript, EVENT_BUG_CATCHING_CONTESTANT_3B
	object_event  6,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant4BScript, EVENT_BUG_CATCHING_CONTESTANT_4B
	object_event  2,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant5BScript, EVENT_BUG_CATCHING_CONTESTANT_5B
	object_event  5,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant6BScript, EVENT_BUG_CATCHING_CONTESTANT_6B
	object_event  3,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant7BScript, EVENT_BUG_CATCHING_CONTESTANT_7B
	object_event  4,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant8BScript, EVENT_BUG_CATCHING_CONTESTANT_8B
	object_event  6,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant9BScript, EVENT_BUG_CATCHING_CONTESTANT_9B
	object_event  6,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant10BScript, EVENT_BUG_CATCHING_CONTESTANT_10B
	object_event  3,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route36NationalParkGateOfficerScript, EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
