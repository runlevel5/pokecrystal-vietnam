	object_const_def
	const ROUTE15_YOUNGSTER1
	const ROUTE15_YOUNGSTER2
	const ROUTE15_YOUNGSTER3
	const ROUTE15_YOUNGSTER4
	const ROUTE15_TEACHER1
	const ROUTE15_TEACHER2
	const ROUTE15_POKE_BALL

Route15_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerTeacherColette:
	trainer TEACHER, COLETTE, EVENT_BEAT_TEACHER_COLETTE, TeacherColetteSeenText, TeacherColetteBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherColetteAfterBattleText
	waitbutton
	closetext
	end

TrainerTeacherHillary:
	trainer TEACHER, HILLARY, EVENT_BEAT_TEACHER_HILLARY, TeacherHillarySeenText, TeacherHillaryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherHillaryAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyKipp:
	trainer SCHOOLBOY, KIPP, EVENT_BEAT_SCHOOLBOY_KIP, SchoolboyKippSeenText, SchoolboyKippBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyKippAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyTommy:
	trainer SCHOOLBOY, TOMMY, EVENT_BEAT_SCHOOLBOY_TOMMY, SchoolboyTommySeenText, SchoolboyTommyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyTommyAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyJohnny:
	trainer SCHOOLBOY, JOHNNY, EVENT_BEAT_SCHOOLBOY_JOHNNY, SchoolboyJohnnySeenText, SchoolboyJohnnyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyJohnnyAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyBilly:
	trainer SCHOOLBOY, BILLY, EVENT_BEAT_SCHOOLBOY_BILLY, SchoolboyBillySeenText, SchoolboyBillyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyBillyAfterBattleText
	waitbutton
	closetext
	end

Route15Sign:
	jumptext Route15SignText

Route15PPUp:
	itemball PP_UP

TeacherColetteSeenText:
	text "Bạn có quên gì"
	line "không?"
	done

TeacherColetteBeatenText:
	text "Kyaaah!"
	done

TeacherColetteAfterBattleText:
	text "Trước khi làm giáo"
	line "viên, tôi hay quên"
	cont "nhiều thứ."
	done

TeacherHillarySeenText:
	text "Ngày nắng đẹp, tôi"
	line "nghĩ trẻ con thích"

	para "chơi ở sân trường"
	line "hơn học trong lớp"
	done

TeacherHillaryBeatenText:
	text "Tôi không muốn"
	line "thua…"
	done

TeacherHillaryAfterBattleText:
	text "Học quan trọng,"
	line "nhưng thể dục cũng"
	cont "quan trọng ngang."
	done

SchoolboyKippSeenText:
	text "Đợi chút. Tôi phải"
	line "gọi cho mẹ tôi."
	done

SchoolboyKippBeatenText:
	text "Xin lỗi mẹ!"
	line "Con bị đánh bại!"
	done

SchoolboyKippAfterBattleText:
	text "Mẹ tôi lo cho tôi"
	line "quá, nên tôi phải"

	para "gọi cho mẹ suốt"
	line "ngày."
	done

SchoolboyTommySeenText:
	text "Đấu nào."
	line "Tôi sẽ không thua!"
	done

SchoolboyTommyBeatenText:
	text "Tôi quên làm bài"
	line "tập về nhà!"
	done

SchoolboyTommyAfterBattleText:
	text "Sayonara! Tôi vừa"
	line "học từ đó trong"
	cont "lớp tiếng Nhật."
	done

SchoolboyJohnnySeenText:
	text "Chúng tôi đang đi"
	line "thực địa đến ĐÀI"

	para "RADIO LAVENDER cho"
	line "môn xã hội học."
	done

SchoolboyJohnnyBeatenText:
	text "Bạn mạnh khủng"
	line "khiếp luôn!"
	done

SchoolboyJohnnyAfterBattleText:
	text "Tôi mệt vì đi bộ."
	line "Tôi cần nghỉ một"
	cont "chút."
	done

SchoolboyBillySeenText:
	text "Môn yêu thích của"
	line "tôi là thể dục!"
	done

SchoolboyBillyBeatenText:
	text "Ôi không!"
	line "Sao tôi lại thua?"
	done

SchoolboyBillyAfterBattleText:
	text "Nếu #MON là môn"
	line "học ở trường, tôi"
	cont "sẽ giỏi nhất!"
	done

Route15SignText:
	text "TUYẾN ĐƯỜNG 15"

	para "TP. FUCHSIA -"
	line "TRẤN LAVENDER"
	done

Route15_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  4, ROUTE_15_FUCHSIA_GATE, 3
	warp_event  2,  5, ROUTE_15_FUCHSIA_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 19,  9, BGEVENT_READ, Route15Sign

	def_object_events
	object_event 10, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSchoolboyKipp, -1
	object_event 15, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyTommy, -1
	object_event 33, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyJohnny, -1
	object_event 27, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyBilly, -1
	object_event 30, 12, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerTeacherColette, -1
	object_event 20, 10, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerTeacherHillary, -1
	object_event 12,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route15PPUp, EVENT_ROUTE_15_PP_UP
