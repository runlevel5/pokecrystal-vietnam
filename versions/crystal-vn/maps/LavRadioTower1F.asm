	object_const_def
	const LAVRADIOTOWER1F_RECEPTIONIST
	const LAVRADIOTOWER1F_OFFICER
	const LAVRADIOTOWER1F_SUPER_NERD1
	const LAVRADIOTOWER1F_GENTLEMAN
	const LAVRADIOTOWER1F_SUPER_NERD2

LavRadioTower1F_MapScripts:
	def_scene_scripts

	def_callbacks

LavRadioTower1FReceptionistScript:
	jumptextfaceplayer LavRadioTower1FReceptionistText

LavRadioTower1FOfficerScript:
	jumptextfaceplayer LavRadioTower1FOfficerText

LavRadioTower1FSuperNerd1Script:
	jumptextfaceplayer LavRadioTower1FSuperNerd1Text

LavRadioTower1FGentlemanScript:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue .GotExpnCard
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext LavRadioTower1FGentlemanText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext LavRadioTower1FGentlemanText_ReturnedMachinePart
	promptbutton
	getstring STRING_BUFFER_4, .expncardname
	scall .receiveitem
	setflag ENGINE_EXPN_CARD
.GotExpnCard:
	writetext LavRadioTower1FGentlemanText_GotExpnCard
	waitbutton
	closetext
	end

.receiveitem:
	jumpstd ReceiveItemScript
	end

.expncardname
	db "EXPN CARD@"

LavRadioTower1FSuperNerd2Script:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue .GotExpnCard
	writetext LavRadioTower1FSuperNerd2Text
	waitbutton
	closetext
	end

.GotExpnCard:
	writetext LavRadioTower1FSuperNerd2Text_GotExpnCard
	waitbutton
	closetext
	end

LavRadioTower1FDirectory:
	jumptext LavRadioTower1FDirectoryText

LavRadioTower1FPokeFluteSign:
	jumptext LavRadioTower1FPokeFluteSignText

LavRadioTower1FReferenceLibrary: ; unreferenced
	jumptext LavRadioTower1FReferenceLibraryText

LavRadioTower1FReceptionistText:
	text "Chào mừng!"
	line "Cứ tự nhiên tham"

	para "quan bất kỳ đâu ở"
	line "tầng này."
	done

LavRadioTower1FOfficerText:
	text "Xin lỗi, nhưng bạn"
	line "chỉ được tham quan"
	cont "tầng trệt."

	para "Kể từ khi THÁP"
	line "RADIO của JOHTO bị"

	para "băng đảng tội phạm"
	line "chiếm đóng, chúng"

	para "tôi đã phải tăng"
	line "cường an ninh."
	done

LavRadioTower1FSuperNerd1Text:
	text "Nhiều người đang"
	line "làm việc chăm chỉ"

	para "tại THÁP RADIO."

	para "Họ chắc đang cố"
	line "gắng hết sức để có"
	cont "chương trình hay."
	done

LavRadioTower1FGentlemanText:
	text "Ôi, không, không!"

	para "Chúng tôi đã ngừng"
	line "phát sóng kể từ"

	para "khi NHÀ MÁY ĐIỆN"
	line "ngừng hoạt động."

	para "Mọi nỗ lực của"
	line "tôi để khởi động"

	para "đài này sẽ công"
	line "cốc nếu tôi không"

	para "thể phát sóng."

	para "Tôi sẽ tan nát"
	line "mất!"
	done

LavRadioTower1FGentlemanText_ReturnedMachinePart:
	text "À! Vậy bạn là"
	line "<PLAY_G> đã giải"

	para "quyết vấn đề của"
	line "NHÀ MÁY ĐIỆN?"

	para "Nhờ bạn, tôi không"
	line "bao giờ mất việc."

	para "Tôi nói thật, bạn"
	line "là cứu tinh!"

	para "Hãy nhận cái này"
	line "để tôi cảm ơn."
	done

LavRadioTower1FGentlemanText_GotExpnCard:
	text "Với cái đó, bạn"
	line "có thể bắt được"

	para "các chương trình"
	line "radio ở KANTO."

	para "Gahahahaha!"
	done

LavRadioTower1FSuperNerd2Text:
	text "Chào bạn!"

	para "Tôi là GIÁM ĐỐC"
	line "ÂM NHẠC siêu đẳng!"

	para "Hả? #GEAR của"
	line "bạn không bắt được"

	para "chương trình âm"
	line "nhạc của tôi à."

	para "Thật đáng tiếc!"

	para "Nếu bạn nâng cấp"
	line "EXPN CARD, bạn sẽ"

	para "bắt được. Tốt nhất"
	line "là lấy một cái!"
	done

LavRadioTower1FSuperNerd2Text_GotExpnCard:
	text "Chào bạn!"

	para "Tôi là GIÁM ĐỐC"
	line "ÂM NHẠC siêu đẳng!"

	para "Tôi chịu trách"
	line "nhiệm về những"

	para "giai điệu tuyệt"
	line "đẹp phát trên sóng"

	para "Đừng lỗi thời."
	line "Nghe nhạc của tôi"
	cont "trên sóng đi!"
	done

LavRadioTower1FDirectoryText:
	text "1F TIẾP TÂN"
	line "2F BÁN HÀNG"

	para "3F NHÂN SỰ"
	line "4F SẢN XUẤT"

	para "5F VĂN PHÒNG"
	line "   GIÁM ĐỐC"
	done

LavRadioTower1FPokeFluteSignText:
	text "Làm #MON Tỉnh"
	line "Táo Với Âm Thanh"

	para "Êm Dịu Của #"
	line "FLUTE Ở KÊNH 20"
	done

LavRadioTower1FReferenceLibraryText:
	text "Wow! Đầy đủ CD"
	line "và video #MON."

	para "Đây chắc là thư"
	line "viện tham khảo."
	done

LavRadioTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAVENDER_TOWN, 7
	warp_event  3,  7, LAVENDER_TOWN, 7

	def_coord_events

	def_bg_events
	bg_event 11,  0, BGEVENT_READ, LavRadioTower1FDirectory
	bg_event  5,  0, BGEVENT_READ, LavRadioTower1FPokeFluteSign

	def_object_events
	object_event  6,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FReceptionistScript, -1
	object_event 15,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FOfficerScript, -1
	object_event  1,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd1Script, -1
	object_event  9,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FGentlemanScript, -1
	object_event 14,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd2Script, -1
