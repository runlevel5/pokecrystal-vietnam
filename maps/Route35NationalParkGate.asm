	object_const_def
	const ROUTE35NATIONALPARKGATE_OFFICER1
	const ROUTE35NATIONALPARKGATE_YOUNGSTER
	const ROUTE35NATIONALPARKGATE_OFFICER2

Route35NationalParkGate_MapScripts:
	def_scene_scripts
	scene_script Route35NationalParkGateNoop1Scene,             SCENE_ROUTE35NATIONALPARKGATE_NOOP
	scene_script Route35NationalParkGateNoop2Scene,             SCENE_ROUTE35NATIONALPARKGATE_UNUSED
	scene_script Route35NationalParkGateLeaveContestEarlyScene, SCENE_ROUTE35NATIONALPARKGATE_LEAVE_CONTEST_EARLY

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route35NationalParkGateCheckIfContestRunningCallback
	callback MAPCALLBACK_OBJECTS, Route35NationalParkGateCheckIfContestAvailableCallback

Route35NationalParkGateNoop1Scene:
	end

Route35NationalParkGateNoop2Scene:
	end

Route35NationalParkGateLeaveContestEarlyScene:
	sdefer Route35NationalParkGateLeavingContestEarlyScript
	end

Route35NationalParkGateCheckIfContestRunningCallback:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue Route35NationalParkBugContestIsRunningScript
	setscene SCENE_ROUTE35NATIONALPARKGATE_NOOP
	endcallback

Route35NationalParkBugContestIsRunningScript:
	setscene SCENE_ROUTE35NATIONALPARKGATE_LEAVE_CONTEST_EARLY
	endcallback

Route35NationalParkGateCheckIfContestAvailableCallback:
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .SetContestOfficer
	ifequal THURSDAY, .SetContestOfficer
	ifequal SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue Route35NationalParkBugContestIsRunningScript
	disappear ROUTE35NATIONALPARKGATE_OFFICER1
	appear ROUTE35NATIONALPARKGATE_YOUNGSTER
	appear ROUTE35NATIONALPARKGATE_OFFICER2
	endcallback

.SetContestOfficer:
	appear ROUTE35NATIONALPARKGATE_OFFICER1
	disappear ROUTE35NATIONALPARKGATE_YOUNGSTER
	disappear ROUTE35NATIONALPARKGATE_OFFICER2
	endcallback

Route35NationalParkGateLeavingContestEarlyScript:
	applymovement PLAYER, Route35NationalParkGatePlayerApproachOfficer1Movement
	turnobject ROUTE35NATIONALPARKGATE_OFFICER1, RIGHT
	opentext
	readvar VAR_CONTESTMINUTES
	addval 1
	getnum STRING_BUFFER_3
	writetext Route35NationalParkGateOfficer1WantToFinishText
	yesorno
	iffalse .GoBackToContest
	writetext Route35NationalParkGateOfficer1WaitAtNorthGateText
	waitbutton
	closetext
	jumpstd BugContestResultsWarpScript

.GoBackToContest:
	writetext Route35NationalParkGateOfficer1OkGoFinishText
	waitbutton
	closetext
	scall Route35NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutToWhite
	waitsfx
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, 10, 47
	end

Route35OfficerScriptContest:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, Route35NationalParkGate_NoContestToday
	ifequal MONDAY, Route35NationalParkGate_NoContestToday
	ifequal WEDNESDAY, Route35NationalParkGate_NoContestToday
	ifequal FRIDAY, Route35NationalParkGate_NoContestToday
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route35NationalParkGate_ContestIsOver
	scall Route35NationalParkGate_GetDayOfWeek
	writetext Route35NationalParkGateOfficer1AskToParticipateText
	yesorno
	iffalse Route35NationalParkGate_DeclinedToParticipate
	readvar VAR_PARTYCOUNT
	ifgreater 1, Route35NationalParkGate_LeaveTheRestBehind
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
Route35NationalParkGate_OkayToProceed:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext Route35NationalParkGateOfficer1GiveParkBallsText
	promptbutton
	writetext Route35NationalParkGatePlayerReceivedParkBallsText
	playsound SFX_ITEM
	waitsfx
	writetext Route35NationalParkGateOfficer1ExplainsRulesText
	waitbutton
	closetext
	special GiveParkBalls
	scall Route35NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutToWhite
	waitsfx
	special SelectRandomBugContestContestants
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, 10, 47
	end

Route35NationalParkGate_EnterContest:
	readvar VAR_FACING
	ifequal LEFT, Route35NationalParkGate_FacingLeft
	applymovement PLAYER, Route35NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement
	end

Route35NationalParkGate_FacingLeft:
	applymovement PLAYER, Route35NationalParkGatePlayerEnterParkMovement
	end

Route35NationalParkGate_LeaveTheRestBehind:
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, Route35NationalParkGate_LessThanFullParty
	readvar VAR_BOXSPACE
	ifequal 0, Route35NationalParkGate_NoRoomInBox

Route35NationalParkGate_LessThanFullParty:
	special CheckFirstMonIsEgg
	ifequal TRUE, Route35NationalParkGate_FirstMonIsEgg
	writetext Route35NationalParkGateOfficer1AskToUseFirstMonText
	yesorno
	iffalse Route35NationalParkGate_DeclinedToLeaveMonsBehind
	special ContestDropOffMons
	iftrue Route35NationalParkGate_FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext Route35NationalParkGateOfficer1WellHoldYourMonText
	promptbutton
	writetext Route35NationalParkGatePlayersMonLeftWithHelperText
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	promptbutton
	sjump Route35NationalParkGate_OkayToProceed

Route35NationalParkGate_DeclinedToParticipate:
	writetext Route35NationalParkGateOfficer1TakePartInFutureText
	waitbutton
	closetext
	end

Route35NationalParkGate_DeclinedToLeaveMonsBehind:
	writetext Route35NationalParkGateOfficer1ChooseMonAndComeBackText
	waitbutton
	closetext
	end

Route35NationalParkGate_FirstMonIsFainted:
	writetext Route35NationalParkGateOfficer1FirstMonCantBattleText
	waitbutton
	closetext
	end

Route35NationalParkGate_NoRoomInBox:
	writetext Route35NationalParkGateOfficer1MakeRoomText
	waitbutton
	closetext
	end

Route35NationalParkGate_FirstMonIsEgg:
	writetext Route35NationalParkGateOfficer1EggAsFirstMonText
	waitbutton
	closetext
	end

Route35NationalParkGate_ContestIsOver:
	writetext Route35NationalParkGateOfficer1ContestIsOverText
	waitbutton
	closetext
	end

Route35NationalParkGate_NoContestToday:
	jumptextfaceplayer Route35NationalParkGateOfficer1WeHoldContestsText

Route35NationalParkGateOfficerScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route35NationalParkGate_ContestIsOver
	writetext Route35NationalParkGateOfficer1WeHoldContestsText
	waitbutton
	closetext
	end

Route35NationalParkGateYoungsterScript:
	jumptextfaceplayer Route35NationalParkGateYoungsterText

BugCatchingContestExplanationSign:
	jumptext BugCatchingContestExplanationText

Route35NationalParkGate_GetDayOfWeek:
	jumpstd DayToTextScript
	end

Route35NationalParkGatePlayerApproachOfficer1Movement:
	step DOWN
	turn_head LEFT
	step_end

Route35NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement:
	step RIGHT
	step UP
	step UP
	step_end

Route35NationalParkGatePlayerEnterParkMovement:
	step UP
	step_end

Route35NationalParkGateOfficer1AskToParticipateText:
	text "Hôm nay @"
	text_ram wStringBuffer3
	text "."
	line "Nghĩa là có cuộc"

	para "thi Bắt Sâu Bọ"
	line "vào hôm nay."

	para "Luật chơi rất"
	line "đơn giản."

	para "Dùng một #MON"
	line "của bạn, bắt một"

	para "#MON sâu bọ để"
	line "được chấm điểm."

	para "Bạn có muốn thử"
	line "không?"
	done

Route35NationalParkGateOfficer1GiveParkBallsText:
	text "Đây là các PARK"
	line "BALL cho cuộc thi"
	cont ""
	done

Route35NationalParkGatePlayerReceivedParkBallsText:
	text "<PLAYER> nhận"
	line "{d:BUG_CONTEST_BALLS} BÓNG PARK."
	done

Route35NationalParkGateOfficer1ExplainsRulesText:
	text "Người bắt được"
	line "#MON sâu bọ"
	cont "mạnh nhất là"
	cont "người chiến thắng"

	para "Bạn có"
	line "{d:BUG_CONTEST_MINUTES} phút."

	para "Nếu hết BÓNG PARK"
	line "là bạn xong."

	para "Bạn có thể giữ"
	line "#MON cuối cùng"
	cont "bạn bắt được."

	para "Ra ngoài và bắt"
	line "#MON sâu bọ"

	para "mạnh nhất mà bạn"
	line "tìm được nhé!"
	done

Route35NationalParkGateOfficer1AskToUseFirstMonText:
	text "Ồ…"

	para "Bạn có nhiều hơn"
	line "một #MON."

	para "Bạn sẽ phải dùng"
	line "@"
	text_ram wStringBuffer3
	text ", con"

	para "#MON đầu tiên"
	line "trong nhóm."

	para "Như vậy được"
	line "chứ?"
	done

Route35NationalParkGateOfficer1WellHoldYourMonText:
	text "Được, chúng tôi sẽ"
	line "giữ các #MON"
	cont "khác khi bạn thi."
	done

Route35NationalParkGatePlayersMonLeftWithHelperText:
	text "#MON <PLAYER>"
	line "để lại với"
	cont "TRỢ LÝ CUỘC THI."
	done

Route35NationalParkGateOfficer1ChooseMonAndComeBackText:
	text "Hãy chọn #MON"
	line "để dùng trong"

	para "cuộc thi, rồi"
	line "quay lại gặp tôi."
	done

Route35NationalParkGateOfficer1TakePartInFutureText:
	text "OK. Hy vọng bạn sẽ"
	line "tham gia lần sau."
	done

Route35NationalParkGateOfficer1FirstMonCantBattleText:
	text "Ồ…"
	line "#MON đầu tiên"

	para "trong nhóm của"
	line "bạn không thể đấu"

	para "Hãy đổi nó với"
	line "#MON bạn muốn"

	para "dùng, rồi quay"
	line "lại gặp tôi."
	done

Route35NationalParkGateOfficer1MakeRoomText:
	text "Ồ…"
	line "Cả nhóm và PC BOX"

	para "của bạn đều đầy."

	para "Bạn không có chỗ"
	line "để đặt #MON sâu"
	cont "bọ bạn bắt được."

	para "Hãy dọn chỗ trong"
	line "nhóm hoặc PC BOX,"

	para "rồi quay lại gặp"
	line "tôi."
	done

Route35NationalParkGateOfficer1EggAsFirstMonText:
	text "Ồ…"
	line "Bạn có một TRỨNG"

	para "là #MON đầu"
	line "tiên trong nhóm."

	para "Hãy đổi nó với"
	line "#MON bạn muốn"

	para "dùng, rồi quay"
	line "lại gặp tôi."
	done

Route35NationalParkGateOfficer1WantToFinishText:
	text "Bạn còn @"
	text_ram wStringBuffer3
	text_start
	line "phút."

	para "Bạn có muốn kết"
	line "thúc bây giờ?"
	done

Route35NationalParkGateOfficer1WaitAtNorthGateText:
	text "OK. Hãy đợi tại"
	line "Cổng Phía Bắc cho"

	para "việc công bố"
	line "người chiến thắng"
	done

Route35NationalParkGateOfficer1OkGoFinishText:
	text "OK. Hãy ra ngoài"
	line "và kết thúc đi."
	done

Route35NationalParkGateOfficer1ContestIsOverText:
	text "Cuộc thi hôm nay"
	line "đã kết thúc. Hy"

	para "vọng bạn sẽ tham"
	line "gia lần sau."
	done

Route35NationalParkGateOfficer1WeHoldContestsText:
	text "Chúng tôi tổ chức"
	line "cuộc thi thường"

	para "xuyên tại VƯỜN."
	line "Hãy thử nhé."
	done

Route35NationalParkGateYoungsterText:
	text "Khi nào có cuộc"
	line "thi Bắt Sâu Bọ"
	cont "tiếp theo?"
	done

BugCatchingContestExplanationText:
	text "Cuộc thi Bắt Sâu"
	line "Bọ được tổ chức"

	para "vào Thứ Ba, Thứ"
	line "Năm và Thứ Bảy."

	para "Không chỉ nhận"
	line "giải thưởng khi"

	para "tham gia, bạn còn"
	line "được giữ #MON"

	para "sâu bọ khi cuộc"
	line "thi kết thúc."
	done

Route35NationalParkGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  0, NATIONAL_PARK, 3
	warp_event  4,  0, NATIONAL_PARK, 4
	warp_event  3,  7, ROUTE_35, 3
	warp_event  4,  7, ROUTE_35, 3

	def_coord_events

	def_bg_events
	bg_event  5,  0, BGEVENT_READ, BugCatchingContestExplanationSign

	def_object_events
	object_event  2,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35OfficerScriptContest, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event  6,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route35NationalParkGateYoungsterScript, EVENT_ROUTE_35_NATIONAL_PARK_GATE_YOUNGSTER
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35NationalParkGateOfficerScript, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
