	object_const_def
	const TRAINERHOUSE1F_RECEPTIONIST
	const TRAINERHOUSE1F_COOLTRAINER_M
	const TRAINERHOUSE1F_COOLTRAINER_F
	const TRAINERHOUSE1F_YOUNGSTER
	const TRAINERHOUSE1F_GENTLEMAN

TrainerHouse1F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerHouse1FReceptionistScript:
	jumptextfaceplayer TrainerHouse1FReceptionistText

TrainerHouse1FCooltrainerMScript:
	jumptextfaceplayer TrainerHouse1FCooltrainerMText

TrainerHouse1FCooltrainerFScript:
	jumptextfaceplayer TrainerHouse1FCooltrainerFText

TrainerHouse1FYoungsterScript:
	jumptextfaceplayer TrainerHouse1FYoungsterText

TrainerHouse1FGentlemanScript:
	jumptextfaceplayer TrainerHouse1FGentlemanText

TrainerHouseSign1:
	jumptext TrainerHouseSign1Text

TrainerHouseSign2:
	jumptext TrainerHouseSign2Text

TrainerHouseIllegibleBook:
	jumptext TrainerHouseIllegibleText

TrainerHouse1FReceptionistText:
	text "Chào mừng đến"
	line "NHÀ HLV,"

	para "nơi mới nhất và"
	line "sôi động nhất ở"
	cont "TOKIWA."

	para "Chúng tôi chỉ mở"
	line "cửa cho HLV."

	para "Bạn có thể chiến"
	line "đấu với những"

	para "người giỏi nhất ở"
	line "tầng dưới."
	done

TrainerHouse1FCooltrainerMText:
	text "TOKIWA là thị"
	line "trấn gần"
	cont "CAO NGUYÊN SEKIEI"
	cont "nhất."

	para "Họ xây nơi này vì"
	line "nhiều HLV đi qua"

	para "trên đường lên"
	line "CAO NGUYÊN SEKIEI"
	done

TrainerHouse1FCooltrainerFText:
	text "Họ tổ chức trận"
	line "đấu thực hành ở"
	cont "tầng dưới."

	para "Tôi muốn xem HLV"
	line "từ JOHTO đánh"
	cont "nhau."
	done

TrainerHouse1FYoungsterText:
	text "Tôi nghĩ bạn phải"
	line "đi khắp nơi và"

	para "đánh với nhiều"
	line "người khác nhau"

	para "thì mới trở thành"
	line "VÔ ĐỊCH được."

	para "VÔ ĐỊCH từ MASARA"
	line "đã đi đến tất cả"

	para "các thành phố ở"
	line "KANTO."
	done

TrainerHouse1FGentlemanText:
	text "Phù… Tôi đang"
	line "nghỉ không đánh"
	cont "#MON."
	done

TrainerHouseSign1Text:
	text "Trận đấu thực"
	line "hành được tổ chức"

	para "ở PHÒNG LUYỆN TẬP"
	line "tầng dưới."

	para "HLV giỏi được mời"
	line "tham gia."
	done

TrainerHouseSign2Text:
	text "Không có luật lệ"
	line "cho trận đấu thực"
	cont "hành."

	para "Giống như đấu"
	line "ngoài đồng, mọi"
	cont "thứ đều được!"
	done

TrainerHouseIllegibleText:
	text "…Cái này là gì?"
	line "Ghi chú chiến"
	cont "thuật?"

	para "Chữ viết này giống"
	line "dấu chân ONIX…"

	para "Hoàn toàn không"
	line "đọc được…"
	done

TrainerHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 13, VIRIDIAN_CITY, 3
	warp_event  3, 13, VIRIDIAN_CITY, 3
	warp_event  8,  2, TRAINER_HOUSE_B1F, 1

	def_coord_events

	def_bg_events
	bg_event  5,  0, BGEVENT_READ, TrainerHouseSign1
	bg_event  7,  0, BGEVENT_READ, TrainerHouseSign2
	bg_event  7, 10, BGEVENT_READ, TrainerHouseIllegibleBook

	def_object_events
	object_event  0, 11, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FReceptionistScript, -1
	object_event  7, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FCooltrainerMScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FCooltrainerFScript, -1
	object_event  4,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FYoungsterScript, -1
	object_event  2,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FGentlemanScript, -1
