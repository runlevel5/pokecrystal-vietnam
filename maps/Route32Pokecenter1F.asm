	object_const_def
	const ROUTE32POKECENTER1F_NURSE
	const ROUTE32POKECENTER1F_FISHING_GURU
	const ROUTE32POKECENTER1F_COOLTRAINER_F

Route32Pokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

Route32Pokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

Route32Pokecenter1FFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_OLD_ROD
	iftrue .GotOldRod
	writetext Route32Pokecenter1FFishingGuruText_Question
	yesorno
	iffalse .Refused
	writetext Route32Pokecenter1FFishingGuruText_Yes
	promptbutton
	verbosegiveitem OLD_ROD
	writetext Route32Pokecenter1FFishingGuruText_GiveOldRod
	waitbutton
	closetext
	setevent EVENT_GOT_OLD_ROD
	end

.Refused:
	writetext Route32Pokecenter1FFishingGuruText_No
	waitbutton
	closetext
	end

.GotOldRod:
	writetext Route32Pokecenter1FFishingGuruText_After
	waitbutton
	closetext
	end

Route32Pokecenter1FCooltrainerFScript:
	jumptextfaceplayer Route32Pokecenter1FCooltrainerFText

Route32Pokecenter1FFishingGuruText_Question:
	text "Đây là địa điểm"
	line "câu cá tuyệt vời."

	para "Bạn thấy mọi"
	line "người câu cá? Còn"
	cont "bạn thì sao?"

	para "Bạn có muốn một"
	line "cái CẦN của tôi?"
	done

Route32Pokecenter1FFishingGuruText_Yes:
	text "Heh, hay lắm."

	para "Giờ bạn cũng là"
	line "dân câu cá rồi!"
	done

Route32Pokecenter1FFishingGuruText_GiveOldRod:
	text "Câu cá thật"
	line "tuyệt!"

	para "Nếu có nước, dù"
	line "là biển hay suối,"

	para "hãy thử dùng CẦN"
	line "của bạn."
	done

Route32Pokecenter1FFishingGuruText_No:
	text "Ồ. Thật đáng"
	line "tiếc…"
	done

Route32Pokecenter1FFishingGuruText_After:
	text "Yo, nhóc. Cá cắn"
	line "câu thế nào?"
	done

Route32Pokecenter1FCooltrainerFText:
	text "Tôi nên cho #MON"
	line "cầm vật gì đây?"

	para "Có lẽ vật phẩm"
	line "tăng sức ATTACK…"
	done

Route32Pokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ROUTE_32, 1
	warp_event  4,  7, ROUTE_32, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FNurseScript, -1
	object_event  1,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FFishingGuruScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FCooltrainerFScript, -1
