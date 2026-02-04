	object_const_def
	const ROUTE19_SWIMMER_GIRL
	const ROUTE19_SWIMMER_GUY1
	const ROUTE19_SWIMMER_GUY2
	const ROUTE19_SWIMMER_GUY3
	const ROUTE19_FISHER1
	const ROUTE19_FISHER2

Route19_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, Route19ClearRocksCallback

Route19ClearRocksCallback:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .Done
	changeblock  6,  6, $7a ; rock
	changeblock  8,  6, $7a ; rock
	changeblock 10,  6, $7a ; rock
	changeblock 12,  8, $7a ; rock
	changeblock  4,  8, $7a ; rock
	changeblock 10, 10, $7a ; rock
.Done:
	endcallback

TrainerSwimmerfDawn:
	trainer SWIMMERF, DAWN, EVENT_BEAT_SWIMMERF_DAWN, SwimmerfDawnSeenText, SwimmerfDawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDawnAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermHarold:
	trainer SWIMMERM, HAROLD, EVENT_BEAT_SWIMMERM_HAROLD, SwimmermHaroldSeenText, SwimmermHaroldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermHaroldAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermJerome:
	trainer SWIMMERM, JEROME, EVENT_BEAT_SWIMMERM_JEROME, SwimmermJeromeSeenText, SwimmermJeromeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermJeromeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermTucker:
	trainer SWIMMERM, TUCKER, EVENT_BEAT_SWIMMERM_TUCKER, SwimmermTuckerSeenText, SwimmermTuckerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermTuckerAfterBattleText
	waitbutton
	closetext
	end

Route19Fisher1Script:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext Route19Fisher1Text
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19Fisher1Text_RocksCleared
	waitbutton
	closetext
	end

Route19Fisher2Script:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext Route19Fisher2Text
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19Fisher2Text_RocksCleared
	waitbutton
	closetext
	end

Route19Sign:
	jumptext Route19SignText

CarefulSwimmingSign:
	jumptext CarefulSwimmingSignText

SwimmermHaroldSeenText:
	text "Bạn đã từng bơi ở"
	line "biển vào ban đêm"
	cont "chưa?"
	done

SwimmermHaroldBeatenText:
	text "Glub…"
	done

SwimmermHaroldAfterBattleText:
	text "Ban đêm, biển"
	line "trở nên đen. Nó"

	para "cảm giác như sẽ"
	line "nuốt chửng bạn."
	done

SwimmermTuckerSeenText:
	text "Hổn hển…"
	line "Chỉ… còn một…"

	para "chút nữa… đến…"
	line "SEKICHIKU…"
	done

SwimmermTuckerBeatenText:
	text "Tôi đang chìm!"
	done

SwimmermTuckerAfterBattleText:
	text "Tôi… hẹn bạn gái"
	line "bơi đến SEKICHIKU"
	cont "Thở hổn hển…"
	done

SwimmerfDawnSeenText:
	text "Tôi ghét những"
	line "người yếu đuối!"
	done

SwimmerfDawnBeatenText:
	text "Tôi có thể thắng"
	line "bạn ở môn bơi…"
	done

SwimmerfDawnAfterBattleText:
	text "Bơi nhanh giữa"
	line "SEKICHIKU và"

	para "ĐẢO BỌT BIỂN…"
	line "mà…"

	para "Chà, bạn trai tôi"
	line "thật là nam tính!"

	para "Thật là hèn!"
	done

SwimmermJeromeSeenText:
	text "Bơi lội à?"
	line "Tôi kém lắm."

	para "Tôi chỉ loay hoay"
	line "trong vùng nước"
	cont "nông này."
	done

SwimmermJeromeBeatenText:
	text "Tôi tưởng tôi có"
	line "thể thắng."
	done

SwimmermJeromeAfterBattleText:
	text "Tôi có thể kém bơi"
	line "nhưng tôi yêu"
	cont "biển."
	done

Route19Fisher1Text:
	text "Xin lỗi. Con đường"
	line "này đóng cửa để"
	cont "thi công."

	para "Nếu muốn đến"
	line "GUREN, tốt hơn"

	para "hãy đi về phía"
	line "nam từ MASARA."
	done

Route19Fisher1Text_RocksCleared:
	text "Tôi đầy mồ hôi."
	line "Đến lúc bơi rồi!"
	done

Route19Fisher2Text:
	text "Ai biết mất bao"
	line "lâu để di chuyển"
	cont "tảng đá này…"
	done

Route19Fisher2Text_RocksCleared:
	text "Công trình đường"
	line "cuối cùng xong."

	para "Giờ tôi có thể đi"
	line "câu cá lại."
	done

Route19SignText:
	text "ĐƯỜNG 19"

	para "TP.SEKICHIKU -"
	line "ĐẢO BỌT BIỂN"
	done

CarefulSwimmingSignText:
	text "Hãy cẩn thận nếu"
	line "bạn đang bơi đến"
	cont "ĐẢO BỌT BIỂN."

	para "C.SÁT SEKICHIKU"
	done

Route19_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  3, ROUTE_19_FUCHSIA_GATE, 3

	def_coord_events

	def_bg_events
	bg_event 11, 13, BGEVENT_READ, Route19Sign
	bg_event 11,  1, BGEVENT_READ, CarefulSwimmingSign

	def_object_events
	object_event  9, 23, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerSwimmerfDawn, -1
	object_event 13, 28, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermHarold, -1
	object_event 11, 17, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermJerome, -1
	object_event  8, 23, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerSwimmermTucker, -1
	object_event  9,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, Route19Fisher1Script, -1
	object_event 11,  5, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, Route19Fisher2Script, -1
