	object_const_def
	const CELADONCITY_FISHER
	const CELADONCITY_POLIWAG
	const CELADONCITY_TEACHER1
	const CELADONCITY_GRAMPS1
	const CELADONCITY_GRAMPS2
	const CELADONCITY_YOUNGSTER1
	const CELADONCITY_YOUNGSTER2
	const CELADONCITY_TEACHER2
	const CELADONCITY_LASS

CeladonCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CeladonCityFlypointCallback

CeladonCityFlypointCallback:
	setflag ENGINE_FLYPOINT_CELADON
	endcallback

CeladonCityFisherScript:
	jumptextfaceplayer CeladonCityFisherText

CeladonCityPoliwrath:
	opentext
	writetext CeladonCityPoliwrathText
	cry POLIWRATH
	waitbutton
	closetext
	end

CeladonCityTeacher1Script:
	jumptextfaceplayer CeladonCityTeacher1Text

CeladonCityGramps1Script:
	jumptextfaceplayer CeladonCityGramps1Text

CeladonCityGramps2Script:
	jumptextfaceplayer CeladonCityGramps2Text

CeladonCityYoungster1Script:
	jumptextfaceplayer CeladonCityYoungster1Text

CeladonCityYoungster2Script:
	jumptextfaceplayer CeladonCityYoungster2Text

CeladonCityTeacher2Script:
	jumptextfaceplayer CeladonCityTeacher2Text

CeladonCityLassScript:
	jumptextfaceplayer CeladonCityLassText

CeladonCitySign:
	jumptext CeladonCitySignText

CeladonGymSign:
	jumptext CeladonGymSignText

CeladonCityDeptStoreSign:
	jumptext CeladonCityDeptStoreSignText

CeladonCityMansionSign:
	jumptext CeladonCityMansionSignText

CeladonCityGameCornerSign:
	jumptext CeladonCityGameCornerSignText

CeladonCityTrainerTips:
	jumptext CeladonCityTrainerTipsText

CeladonCityPokecenterSign:
	jumpstd PokecenterSignScript

CeladonCityHiddenPpUp:
	hiddenitem PP_UP, EVENT_CELADON_CITY_HIDDEN_PP_UP

CeladonCityFisherText:
	text "Con POLIWRATH này"
	line "là bạn đồng hành."

	para "Tôi tự hỏi liệu"
	line "nó có tiến hóa"
	cont "thành ếch #MON."
	done

CeladonCityPoliwrathText:
	text "POLIWRATH: Quạc!"
	done

CeladonCityTeacher1Text:
if DEF(_CRYSTAL_AU)
	text "Tôi thua ở máy."
	done
else
	text "Tôi lại thua ở"
	line "máy đánh bạc…"

	para "Con gái bọn tôi"
	line "giờ cũng chơi rồi."

	para "Cậu cũng nên thử"
	line "xem."
	done
endc

CeladonCityGramps1Text:
	text "GRIMER xuất hiện"
	line "gần đây."

	para "Thấy cái ao trước"
	line "nhà không? GRIMER"

	para "sống ở đó bây giờ."

	para "Chúng từ đâu đến?"
	line "Đây là vấn đề"
	cont "nghiêm trọng…"
	done

CeladonCityGramps2Text:
	text "Hihihi! GYM này"
	line "tuyệt quá! Chỉ"

	para "con gái mới được"
	line "vào đây!"
	done

CeladonCityYoungster1Text:
	text "Cậu muốn biết bí"
	line "mật không?"

	para "DINH THỰ CELADON"
	line "có cửa sau bí mật."
	done

CeladonCityYoungster2Text:
	text "Họ đang tổ chức"
	line "thi ăn ở nhà hàng."

	para "Chỉ nhìn họ ăn"
	line "cũng khiến tôi"
	cont "thấy no căng…"
	done

CeladonCityTeacher2Text:
	text "TTMT CELADON có"
	line "hàng hóa đa dạng"

	para "và chất lượng"
	line "nhất."

	para "Nếu không có ở đó"
	line "thì không có ở"

	para "đâu cả."

	para "Trời… Tôi nghe như"
	line "nhân viên bán"
	cont "hàng vậy."
	done

CeladonCityLassText_Mobile: ; unreferenced
	text "Tôi thích được bao"
	line "quanh bởi cao ốc!"

	para "Có phải TT #MON"
	line "GOLDENROD đã được"

	para "làm lớn hơn nhiều"
	line "không?"

	para "Thật tuyệt! Tôi"
	line "ước KANTO có chỗ"

	para "như vậy…"
	done

CeladonCityLassText:
	text "Nhìn xuống đất"
	line "khi đi bộ làm"

	para "tôi thấy chóng"
	line "mặt."
	done

CeladonCitySignText:
	text "TP. CELADON"

	para "Thành Phố Giấc Mơ"
	line "Cầu Vồng"
	done

CeladonGymSignText:
	text "TP. CELADON"
	line "GYM #MON"
	cont "TRƯỞNG: ERIKA"

	para "Công Chúa Yêu"
	line "Thiên Nhiên"
	done

CeladonCityDeptStoreSignText:
	text "Tìm Thứ Bạn Cần"
	line "TTMT CELADON!"
	done

CeladonCityMansionSignText:
	text "DINH THỰ CELADON"
	done

CeladonCityGameCornerSignText:
if DEF(_CRYSTAL_AU)
	text "Khu Vui Chơi Cho"
	line "Người Lớn"
	cont "GÓC GIẢI TRÍ"
	done
else
	text "Sân Chơi Cho Mọi"
	line "Người"
	cont "GÓC GIẢI TRÍ"
	done
endc

CeladonCityTrainerTipsText:
	text "MẸO CHO HLV"

	para "BẢO VỆ SPEC. bảo"
	line "vệ #MON khỏi"

	para "đòn ĐẶC BIỆT như"
	line "lửa và nước."

	para "Mua vật phẩm tại"
	line "TTMT CELADON!"
	done

CeladonCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  9, CELADON_DEPT_STORE_1F, 1
	warp_event 16,  9, CELADON_MANSION_1F, 1
	warp_event 16,  3, CELADON_MANSION_1F, 3
	warp_event 17,  3, CELADON_MANSION_1F, 3
	warp_event 29,  9, CELADON_POKECENTER_1F, 1
	warp_event 18, 19, CELADON_GAME_CORNER, 1
	warp_event 23, 19, CELADON_GAME_CORNER_PRIZE_ROOM, 1
	warp_event 10, 29, CELADON_GYM, 1
	warp_event 25, 29, CELADON_CAFE, 1

	def_coord_events

	def_bg_events
	bg_event 23, 21, BGEVENT_READ, CeladonCitySign
	bg_event 11, 31, BGEVENT_READ, CeladonGymSign
	bg_event  6,  9, BGEVENT_READ, CeladonCityDeptStoreSign
	bg_event 13,  9, BGEVENT_READ, CeladonCityMansionSign
	bg_event 19, 21, BGEVENT_READ, CeladonCityGameCornerSign
	bg_event 29, 21, BGEVENT_READ, CeladonCityTrainerTips
	bg_event 30,  9, BGEVENT_READ, CeladonCityPokecenterSign
	bg_event 37, 21, BGEVENT_ITEM, CeladonCityHiddenPpUp

	def_object_events
	object_event 26, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityFisherScript, -1
	object_event 27, 11, SPRITE_POLIWAG, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCityPoliwrath, -1
	object_event 20, 24, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityTeacher1Script, -1
	object_event 14, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeladonCityGramps1Script, -1
	object_event  8, 31, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityGramps2Script, -1
	object_event 18, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCityYoungster1Script, -1
	object_event 24, 33, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityYoungster2Script, -1
	object_event  6, 14, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityTeacher2Script, -1
	object_event  7, 22, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityLassScript, -1
