	object_const_def
	const BILLSFAMILYSHOUSE_BILL
	const BILLSFAMILYSHOUSE_POKEFAN_F
	const BILLSFAMILYSHOUSE_TWIN

BillsFamilysHouse_MapScripts:
	def_scene_scripts

	def_callbacks

BillScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_EEVEE
	iftrue .GotEevee
	writetext BillTakeThisEeveeText
	yesorno
	iffalse .Refused
	writetext BillImCountingOnYouText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedEeveeText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke EEVEE, 20
	setevent EVENT_GOT_EEVEE
	writetext BillEeveeMayEvolveText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillPartyFullText
	waitbutton
	closetext
	end

.Refused:
	writetext BillNoEeveeText
	waitbutton
	closetext
	end

.GotEevee:
	writetext BillPopWontWorkText
	waitbutton
	closetext
	end

BillsMomScript:
	faceplayer
	opentext
	checkevent EVENT_MET_BILL
	iffalse .HaventMetBill
	writetext BillsMomText_BeforeEcruteak
	waitbutton
	closetext
	end

.HaventMetBill:
	writetext BillsMomText_AfterEcruteak
	waitbutton
	closetext
	end

BillsYoungerSisterScript:
	faceplayer
	opentext
	checkcellnum PHONE_BILL
	iftrue .GotBillsNumber
	writetext BillsYoungerSisterUsefulNumberText
	askforphonenumber PHONE_BILL
	ifequal PHONE_CONTACTS_FULL, .NoRoom
	ifequal PHONE_CONTACT_REFUSED, .Refused
	waitsfx
	addcellnum PHONE_BILL
	writetext RecordedBillsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
.GotBillsNumber:
	writetext BillsYoungerSisterStorageSystemText
	waitbutton
	closetext
	end

.Refused:
	writetext BillsYoungerSisterRefusedNumberText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillsYoungerSisterPhoneFullText
	promptbutton
	sjump .Refused

BillsHouseBookshelf1:
	jumpstd PictureBookshelfScript

BillsHouseBookshelf2:
	jumpstd MagazineBookshelfScript

BillsHouseRadio:
	jumpstd Radio2Script

BillTakeThisEeveeText:
	text "BILL: Chào, "
	line "<PLAYER>! Giúp"

	para "tôi và nhận con"
	line "EEVEE này nhé."

	para "Nó xuất hiện khi"
	line "tôi đang điều"
	cont "chỉnh TIME CAPSULE"

	para "Ai đó phải chăm"
	line "sóc nó, nhưng tôi"

	para "không thích ra"
	line "ngoài lắm."

	para "Tôi có thể nhờ"
	line "bạn chơi với nó"
	cont "được không?"
	done

BillImCountingOnYouText:
	text "BILL: Tôi biết"
	line "bạn sẽ đồng ý!"

	para "Tuyệt vời! Bạn"
	line "thật sự giỏi!"

	para "OK, tôi tin tưởng"
	line "bạn nhé."

	para "Hãy chăm sóc nó"
	line "thật tốt!"
	done

ReceivedEeveeText:
	text "<PLAYER> nhận"
	line "được EEVEE!"
	done

BillEeveeMayEvolveText:
	text "BILL: GS ELM nói"
	line "EEVEE có thể tiến"

	para "hóa theo những"
	line "cách mới và chưa"
	cont "từng biết."
	done

BillPartyFullText:
	text "Khoan đã. Bạn"
	line "không thể mang"
	cont "thêm #MON."
	done

BillNoEeveeText:
	text "Ồ… Vậy giờ phải"
	line "làm sao đây?"
	done

BillPopWontWorkText:
	text "BILL: Bố tôi ấy,"
	line "ông không chịu"

	para "làm việc. Chỉ cả"
	line "ngày lang thang."

	para "Ông ấy đang trở"
	line "thành vấn đề…"
	done

BillsMomText_BeforeEcruteak:
	text "Ồ, con sưu tầm"
	line "#MON à? BILL"

	para "con trai mẹ là"
	line "chuyên gia đấy."

	para "Nó vừa được gọi"
	line "đến TT #MON ở"
	cont "TP. ENJU."

	para "Bố nó thì đi đến"
	line "GÓC GIẢI TRÍ mà"

	para "không ai gọi cả…"
	done

BillsMomText_AfterEcruteak:
	text "Bố nó từng được"
	line "gọi là #MANIAC."

	para "BILL chắc là giống"
	line "bố nó."
	done

BillsYoungerSisterUsefulNumberText:
	text "Bạn là HLV à?"

	para "Em có số điện"
	line "thoại hữu ích cho"
	cont "bạn này."
	done

RecordedBillsNumberText:
	text "<PLAYER> đã lưu số"
	line "của BILL."
	done

BillsYoungerSisterRefusedNumberText:
	text "Anh em làm hệ"
	line "thống lưu trữ"
	cont "#MON trên PC."

	para "Em định cho bạn"
	line "số của anh BILL…"
	done

BillsYoungerSisterPhoneFullText:
	text "Bạn không thể lưu"
	line "thêm số nữa."
	done

BillsYoungerSisterStorageSystemText:
	text "Anh em là BILL đã"
	line "làm hệ thống lưu"

	para "trữ #MON trên"
	line "PC đấy."
	done

BillsFamilysHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 4
	warp_event  3,  7, GOLDENROD_CITY, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, BillsHouseBookshelf2
	bg_event  1,  1, BGEVENT_READ, BillsHouseBookshelf1
	bg_event  7,  1, BGEVENT_READ, BillsHouseRadio

	def_object_events
	object_event  2,  3, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillScript, EVENT_MET_BILL
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsMomScript, -1
	object_event  5,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BillsYoungerSisterScript, -1
