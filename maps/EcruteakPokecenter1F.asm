	object_const_def
	const ECRUTEAKPOKECENTER1F_NURSE
	const ECRUTEAKPOKECENTER1F_POKEFAN_M
	const ECRUTEAKPOKECENTER1F_COOLTRAINER_F
	const ECRUTEAKPOKECENTER1F_GYM_GUIDE
	const ECRUTEAKPOKECENTER1F_BILL

EcruteakPokecenter1F_MapScripts:
	def_scene_scripts
	scene_script EcruteakPokecenter1FMeetBillScene, SCENE_ECRUTEAKPOKECENTER1F_MEET_BILL
	scene_script EcruteakPokecenter1FNoopScene,     SCENE_ECRUTEAKPOKECENTER1F_NOOP

	def_callbacks

EcruteakPokecenter1FMeetBillScene:
	sdefer EcruteakPokcenter1FBillActivatesTimeCapsuleScript
	end

EcruteakPokecenter1FNoopScene:
	end

EcruteakPokcenter1FBillActivatesTimeCapsuleScript:
	pause 30
	playsound SFX_EXIT_BUILDING
	appear ECRUTEAKPOKECENTER1F_BILL
	waitsfx
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovement1
	applymovement PLAYER, EcruteakPokecenter1FPlayerMovement1
	turnobject ECRUTEAKPOKECENTER1F_NURSE, UP
	pause 10
	turnobject ECRUTEAKPOKECENTER1F_NURSE, DOWN
	pause 30
	turnobject ECRUTEAKPOKECENTER1F_NURSE, UP
	pause 10
	turnobject ECRUTEAKPOKECENTER1F_NURSE, DOWN
	pause 20
	turnobject ECRUTEAKPOKECENTER1F_BILL, DOWN
	pause 10
	opentext
	writetext EcruteakPokecenter1F_BillText1
	promptbutton
	sjump .PointlessJump

.PointlessJump:
	writetext EcruteakPokecenter1F_BillText2
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovement2
	playsound SFX_EXIT_BUILDING
	disappear ECRUTEAKPOKECENTER1F_BILL
	clearevent EVENT_MET_BILL
	setflag ENGINE_TIME_CAPSULE
	setscene SCENE_ECRUTEAKPOKECENTER1F_NOOP
	waitsfx
	end

EcruteakPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

EcruteakPokecenter1FPokefanMScript:
	special CheckMobileAdapterStatusSpecial
	iftrue .mobile
	jumptextfaceplayer EcruteakPokecenter1FPokefanMText

.mobile
	jumptextfaceplayer EcruteakPokecenter1FPokefanMTextMobile

EcruteakPokecenter1FCooltrainerFScript:
	jumptextfaceplayer EcruteakPokecenter1FCooltrainerFText

EcruteakPokecenter1FGymGuideScript:
	jumptextfaceplayer EcruteakPokecenter1FGymGuideText

EcruteakPokecenter1FBillMovement1:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

EcruteakPokecenter1FBillMovement2:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

EcruteakPokecenter1FPlayerMovement1:
	step UP
	step UP
	step UP
	step_end

EcruteakPokecenter1F_BillText1:
	text "Chào, tôi là BILL."
	line "Còn bạn là ai?"

	para "Hmm, <PLAYER> hả?"
	line "Bạn đến đúng lúc"
	cont "rồi."
	done

EcruteakPokecenter1F_BillText2:
	text "Tôi vừa hoàn tất"
	line "điều chỉnh TIME"
	cont "CAPSULE của tôi."

	para "Bạn biết #MON"
	line "có thể trao đổi,"
	cont "đúng không?"

	para "TIME CAPSULE của"
	line "tôi được phát"

	para "triển để trao đổi"
	line "với quá khứ."

	para "Nhưng bạn không"
	line "thể gửi thứ gì"

	para "không tồn tại"
	line "trong quá khứ."

	para "Nếu bạn làm vậy,"
	line "PC ở quá khứ sẽ"
	cont "bị hỏng."

	para "Vì vậy bạn phải"
	line "loại bỏ mọi thứ"

	para "không có trong"
	line "quá khứ."

	para "Nói đơn giản, ko"
	line "gửi chiêu mới"

	para "hay #MON mới"
	line "vào TIME CAPSULE."

	para "Đừng lo lắng."
	line "Tôi đã hoàn tất"
	cont "điều chỉnh rồi."

	para "Ngày mai, TIME"
	line "CAPSULE sẽ hoạt"

	para "động ở tất cả"
	line "TT #MON."

	para "Tôi phải mau về"
	line "GOLDENROD gặp"
	cont "gia đình."

	para "Tạm biệt!"
	done

EcruteakPokecenter1FPokefanMText:
	text "Cách các CÔ GÁI"
	line "KIMONO nhảy múa"

	para "thật kỳ diệu. Như"
	line "cách họ dùng"
	cont "#MON vậy."
	done

EcruteakPokecenter1FPokefanMTextMobile:
	text "Bạn chắc muốn đấu"
	line "với nhiều người"

	para "hơn, đúng không?"
	line "Nghe nói có một"

	para "nơi HLV tụ tập."

	para "Ở đâu ư?"

	para "Nó qua TP."
	line "OLIVINE một chút."
	done

EcruteakPokecenter1FCooltrainerFText:
	text "MORTY, T.LĨNH"
	line "GYM, rất ngầu."

	para "#MON của anh ấy"
	line "cũng rất mạnh."
	done

EcruteakPokecenter1FGymGuideText:
	text "HỒ GYARADOS…"

	para "Sự xuất hiện của"
	line "đàn GYARADOS…"

	para "Tôi ngửi thấy âm"
	line "mưu. Tôi biết mà!"
	done

EcruteakPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 6
	warp_event  4,  7, ECRUTEAK_CITY, 6
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FNurseScript, -1
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FPokefanMScript, -1
	object_event  1,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FCooltrainerFScript, -1
	object_event  7,  1, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FGymGuideScript, -1
	object_event  0,  7, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_POKE_CENTER_BILL
