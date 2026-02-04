	object_const_def
	const ECRUTEAKITEMFINDERHOUSE_COOLTRAINER_M
	const ECRUTEAKITEMFINDERHOUSE_POKEDEX

EcruteakItemfinderHouse_MapScripts:
	def_scene_scripts

	def_callbacks

EcruteakItemfinderGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_ITEMFINDER
	iftrue .itemfinder
	writetext EcruteakItemfinderAdventureText
	yesorno
	iffalse .no
	writetext EcruteakItemfinderTrueSpiritText
	promptbutton
	verbosegiveitem ITEMFINDER
	setevent EVENT_GOT_ITEMFINDER
.itemfinder:
	writetext ItemfinderExplanationText
	waitbutton
	closetext
	end

.no:
	writetext EcruteakItemfinderToEachHisOwnText
	waitbutton
	closetext
	end

EcruteakHistoryBook:
	opentext
	writetext EcruteakHistoryBookText
	yesorno
	iftrue .ReadBook
	closetext
	end

.ReadBook:
	writetext EcruteakTwoTowersText
	yesorno
	iftrue .KeepReading
	closetext
	end

.KeepReading:
	writetext EcruteakThreeMonText
	waitbutton
	closetext
	end

ItemFinderHouseRadio:
	jumpstd Radio2Script

EcruteakItemfinderAdventureText:
	text "À. Bạn đang phiêu"
	line "lưu cùng #MON"
	cont "của mình?"

	para "Ừm, phiêu lưu mà"
	line "không tìm kho báu"
	cont "thì thế nào?"

	para "Tôi nói đúng không"
	line "nào?"
	done

EcruteakItemfinderTrueSpiritText:
	text "Tốt! Bạn hiểu tinh"
	line "thần thực sự"

	para "của sự phiêu lưu."

	para "Tôi thích vậy!"
	line "Hãy mang theo đồ"
	cont "này."
	done

ItemfinderExplanationText:
	text "Có nhiều vật phẩm"
	line "nằm rải rác không"

	para "dễ nhìn thấy."

	para "Dùng MÁY TÌM ĐỒ"
	line "để kiểm tra xem"

	para "có vật phẩm trên"
	line "mặt đất gần bạn."

	para "Nó không chỉ chỗ"
	line "chính xác,"

	para "nên bạn phải tự"
	line "tìm."

	para "À đúng rồi--tôi"
	line "nghe có vật phẩm"

	para "ở THÁP CHÁY"
	line "ENJU."
	done

EcruteakItemfinderToEachHisOwnText:
	text "Ồ… Mỗi người một"
	line "ý…"
	done

EcruteakHistoryBookText:
	text "LỊCH SỬ"
	line "ENJU"

	para "Muốn đọc không?"
	done

EcruteakTwoTowersText:
	text "Ở ENJU, có"
	line "hai tòa tháp."

	para "Mỗi tháp là nơi"
	line "trú ngụ của #-"
	cont "MON bay mạnh mẽ."

	para "Nhưng một tháp"
	line "bị cháy rụi."

	para "Hai #MON đó"
	line "không thấy xuất"
	cont "hiện kể từ đó…"

	para "Đọc tiếp?"
	done

EcruteakThreeMonText:
	text "ENJU cũng là"
	line "nhà của ba #MON"

	para "chạy quanh thành"
	line "phố."

	para "Chúng được cho là"
	line "sinh ra từ"

	para "nước, sét"
	line "và lửa."

	para "Nhưng chúng không"
	line "thể kiềm chế sức"
	cont "mạnh quá lớn."

	para "Nên người ta nói"
	line "ba con chạy như"

	para "gió về phía đồng"
	line "cỏ."
	done

EcruteakItemfinderHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 11
	warp_event  4,  7, ECRUTEAK_CITY, 11

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, ItemFinderHouseRadio

	def_object_events
	object_event  2,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakItemfinderGuy, -1
	object_event  3,  3, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakHistoryBook, -1
