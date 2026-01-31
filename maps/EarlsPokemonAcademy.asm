	object_const_def
	const EARLSPOKEMONACADEMY_EARL
	const EARLSPOKEMONACADEMY_YOUNGSTER1
	const EARLSPOKEMONACADEMY_GAMEBOY_KID1
	const EARLSPOKEMONACADEMY_GAMEBOY_KID2
	const EARLSPOKEMONACADEMY_YOUNGSTER2
	const EARLSPOKEMONACADEMY_POKEDEX

EarlsPokemonAcademy_MapScripts:
	def_scene_scripts

	def_callbacks

AcademyEarl:
	applymovement EARLSPOKEMONACADEMY_EARL, AcademyEarlSpinMovement
	faceplayer
	opentext
	writetext AcademyEarlIntroText
	yesorno
	iffalse .Part1
	writetext AcademyEarlTeachHowToWinText
	yesorno
	iffalse .Done
.Part1:
	writetext AcademyEarlTeachMoreText
	yesorno
	iffalse .Done
	writetext AcademyEarlTeachHowToRaiseWellText
	waitbutton
	closetext
	end

.Done:
	writetext AcademyEarlNoMoreToTeachText
	waitbutton
	closetext
	end

EarlsPokemonAcademyYoungster1Script:
	jumptextfaceplayer EarlsPokemonAcademyYoungster1Text

EarlsPokemonAcademyGameboyKid1Script:
	faceplayer
	opentext
	writetext EarlsPokemonAcademyGameboyKid1Text
	waitbutton
	closetext
	turnobject EARLSPOKEMONACADEMY_GAMEBOY_KID1, DOWN
	end

EarlsPokemonAcademyGameboyKid2Script:
	faceplayer
	opentext
	writetext EarlsPokemonAcademyGameboyKid2Text
	waitbutton
	closetext
	turnobject EARLSPOKEMONACADEMY_GAMEBOY_KID2, DOWN
	end

EarlsPokemonAcademyYoungster2Script:
	jumptextfaceplayer EarlsPokemonAcademyYoungster2Text

AcademyBlackboard:
	opentext
	writetext AcademyBlackboardText
.Loop:
	loadmenu .BlackboardMenuHeader
	_2dmenu
	closewindow
	ifequal 1, .Poison
	ifequal 2, .Paralysis
	ifequal 3, .Sleep
	ifequal 4, .Burn
	ifequal 5, .Freeze
	closetext
	end

.Poison:
	writetext AcademyPoisonText
	waitbutton
	sjump .Loop

.Paralysis:
	writetext AcademyParalysisText
	waitbutton
	sjump .Loop

.Sleep:
	writetext AcademySleepText
	waitbutton
	sjump .Loop

.Burn:
	writetext AcademyBurnText
	waitbutton
	sjump .Loop

.Freeze:
	writetext AcademyFreezeText
	waitbutton
	sjump .Loop

.BlackboardMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 11, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	dn 3, 2 ; rows, columns
	db 5 ; spacing
	dba .Text
	dbw BANK(@), NULL

.Text:
	db "PSN@"
	db "PAR@"
	db "SLP@"
	db "BRN@"
	db "FRZ@"
	db "THOÁT@"

AcademyNotebook:
	opentext
	writetext AcademyNotebookText
	yesorno
	iffalse .Done
	writetext AcademyNotebookText1
	yesorno
	iffalse .Done
	writetext AcademyNotebookText2
	yesorno
	iffalse .Done
	writetext AcademyNotebookText3
	waitbutton
.Done:
	closetext
	end

AcademyStickerMachine: ; unreferenced
	jumptext AcademyStickerMachineText

AcademyBookshelf:
	jumpstd DifficultBookshelfScript

AcademyEarlSpinMovement:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

AcademyEarlIntroText:
	text "Ta là EARL đây!"

	para "#MON thật kỳ"
	line "diệu, phải không!"

	para "Ta sẽ dạy ngươi"
	line "trở thành HLV"
	cont "giỏi hơn!"

	para "Ngươi muốn biết"
	line "điều gì? Muốn"
	cont "thắng trận chăng?"
	done

AcademyEarlTeachHowToWinText:
	text "Tốt lắm! Ta sẽ"
	line "dạy ngươi!"

	para "Trong trận đấu,"
	line "#MON ở đầu"
	cont "danh sách ra đầu!"

	para "Đổi thứ tự trong"
	line "danh sách, khiến"
	cont "trận đấu dễ hơn!"

	para "Ngươi còn muốn"
	line "nghe ta nói gì?"
	done

AcademyEarlTeachMoreText:
	text "Vậy, muốn biết"
	line "cách nuôi #MON"
	cont "tốt chăng?"
	done

AcademyEarlTeachHowToRaiseWellText:
	text "Được! Ta sẽ dạy"
	line "ngươi!"

	para "Nếu #MON ra"
	line "trận đấu dù chỉ"

	para "trong chốc lát,"
	line "nó vẫn nhận EXP."

	para "Đặt #MON yếu"
	line "lên đầu danh sách."

	para "Đổi trong trận"
	line "đấu nhanh chóng!"

	para "Như vậy, #MON"
	line "yếu sẽ trở nên"
	cont "mạnh mẽ!"
	done

AcademyEarlNoMoreToTeachText:
	text "Ồ! Học trò thông"
	line "minh ngươi là! Ta"
	cont "chẳng còn gì dạy!"

	para "Hãy tốt với"
	line "#MON nhé!"
	done

EarlsPokemonAcademyYoungster1Text:
	text "Tôi đang ghi chép"
	line "bài giảng của"
	cont "thầy giáo."

	para "Tôi nên chép cả"
	line "những gì trên"
	cont "bảng đen nữa."
	done

EarlsPokemonAcademyGameboyKid1Text:
	text "Tôi đã đổi #MON"
	line "tốt nhất cho bạn"
	cont "bên cạnh."
	done

EarlsPokemonAcademyGameboyKid2Text:
	text "Hử? #MON tôi"
	line "vừa nhận đang cầm"
	cont "thứ gì đó!"
	done

EarlsPokemonAcademyYoungster2Text:
	text "#MON cầm BERRY"
	line "sẽ tự chữa lành"
	cont "trong trận đấu."

	para "Nhiều vật phẩm"
	line "khác có thể được"
	cont "#MON cầm…"

	para "Ghi chép thật"
	line "khó nhằn…"
	done

AcademyBlackboardText:
	text "Bảng đen mô tả"
	line "trạng thái #MON"

	para "thay đổi trong"
	line "trận đấu."
	done

AcademyBlackboardText2: ; unreferenced
	text "Đọc chủ đề nào?"
	done

AcademyPoisonText:
	text "Nếu bị độc,"
	line "#MON sẽ liên"
	cont "tục mất HP."

	para "Độc còn lại sau"
	line "trận đấu,"

	para "và HP bị mất khi"
	line "bạn đi bộ."

	para "Để chữa, dùng"
	line "GIẢI ĐỘC."
	done

AcademyParalysisText:
	text "Tê liệt giảm tốc"
	line "độ và có thể ngăn"
	cont "di chuyển."

	para "Nó còn lại sau"
	line "trận đấu, hãy"
	cont "dùng TRỊ TÊ LIỆT."
	done

AcademySleepText:
	text "Nếu ngủ, #MON"
	line "không thể ra"
	cont "chiêu."

	para "#MON ngủ sẽ"
	line "không tỉnh sau"
	cont "trận đấu."

	para "Đánh thức nó bằng"
	line "ĐÁNH THỨC."
	done

AcademyBurnText:
	text "Bỏng sẽ liên tục"
	line "tiêu hao HP."

	para "Nó cũng giảm sức"
	line "tấn công."

	para "Bỏng còn lại sau"
	line "trận đấu."

	para "Dùng TRỊ BỎNG để"
	line "chữa."
	done

AcademyFreezeText:
	text "Nếu #MON bị"
	line "đóng băng, nó"
	cont "không làm gì được."

	para "Nó vẫn đóng băng"
	line "sau trận đấu."

	para "Rã băng bằng"
	line "TRỊ ĐÔNG."
	done

AcademyNotebookText:
	text "Đây là vở ghi của"
	line "cậu bé này…"

	para "Bắt #MON bằng"
	line "# BALL."

	para "Tối đa sáu con"
	line "trong đội."

	para "Đọc tiếp không?"
	done

AcademyNotebookText1:
	text "Trước khi ném"
	line "# BALL, làm yếu"
	cont "mục tiêu trước."

	para "#MON bị độc"
	line "hoặc bỏng sẽ dễ"
	cont "bắt hơn."

	para "Đọc tiếp không?"
	done

AcademyNotebookText2:
	text "Một số chiêu có"
	line "thể gây rối loạn."

	para "Rối loạn có thể"
	line "khiến #MON tự"
	cont "tấn công mình."

	para "Rời khỏi trận"
	line "đấu sẽ hết rối"
	cont "loạn."

	para "Đọc tiếp không?"
	done

AcademyNotebookText3:
	text "Người bắt và dùng"
	line "#MON"

	para "trong trận đấu là"
	line "HLV #MON."

	para "Họ phải đến các"
	line "GYM #MON"

	para "và đánh bại các"
	line "HLV khác."

	para "Trang kế là…"
	line "Trống rỗng!"

	para "Bạn: Hê-hê-hê…"

	para "Tôi chưa viết"
	line "thêm gì…"
	done

AcademyStickerMachineText:
	text "Cỗ máy siêu đẳng"
	line "này in dữ liệu"

	para "thành nhãn dán!"
	done

EarlsPokemonAcademy_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 15, VIOLET_CITY, 3
	warp_event  4, 15, VIOLET_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, AcademyBookshelf
	bg_event  1,  1, BGEVENT_READ, AcademyBookshelf
	bg_event  3,  0, BGEVENT_READ, AcademyBlackboard
	bg_event  4,  0, BGEVENT_READ, AcademyBlackboard

	def_object_events
	object_event  4,  2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AcademyEarl, EVENT_EARLS_ACADEMY_EARL
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyYoungster1Script, -1
	object_event  3, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyGameboyKid1Script, -1
	object_event  4, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyGameboyKid2Script, -1
	object_event  4,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyYoungster2Script, -1
	object_event  2,  4, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AcademyNotebook, -1
