	object_const_def
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST1
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST2
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST3

RuinsOfAlphResearchCenter_MapScripts:
	def_scene_scripts
	scene_script RuinsOfAlphResearchCenterNoopScene,        SCENE_RUINSOFALPHRESEARCHCENTER_NOOP
	scene_script RuinsOfAlphResearchCenterGetUnownDexScene, SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX

	def_callbacks
	callback MAPCALLBACK_OBJECTS, RuinsOfAlphResearchCenterScientistCallback

RuinsOfAlphResearchCenterNoopScene:
	end

RuinsOfAlphResearchCenterGetUnownDexScene:
	sdefer RuinsOfAlphResearchCenterGetUnownDexScript
	end

RuinsOfAlphResearchCenterScientistCallback:
	checkscene
	ifequal SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX, .ShowScientist
	endcallback

.ShowScientist:
	moveobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, 3, 7
	appear RUINSOFALPHRESEARCHCENTER_SCIENTIST3
	endcallback

RuinsOfAlphResearchCenterGetUnownDexScript:
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterApproachesComputerMovement
	playsound SFX_BOOT_PC
	pause 60
	playsound SFX_SWITCH_POKEMON
	pause 30
	playsound SFX_TALLY
	pause 30
	playsound SFX_TRANSACTION
	pause 30
	turnobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, DOWN
	opentext
	writetext RuinsOfAlphResearchCenterModifiedDexText
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterApproachesPlayerMovement
	opentext
	writetext RuinsOfAlphResearchCenterDexUpgradedText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_UNOWN_DEX
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterLeavesPlayerMovement
	setscene SCENE_RUINSOFALPHRESEARCHCENTER_NOOP
	special RestartMapMusic
	end

RuinsOfAlphResearchCenterScientist3Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterScientist3_PrinterAvailable
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterScientist1Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkflag ENGINE_UNOWN_DEX
	iftrue .GotUnownDex
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext RuinsOfAlphResearchCenterScientist1Text
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext RuinsOfAlphResearchCenterScientist1Text_UnownAppeared
	waitbutton
	closetext
	end

.GotUnownDex:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotUnownDex
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotAllUnown
	waitbutton
	closetext
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	end

RuinsOfAlphResearchCenterScientist2Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext RuinsOfAlphResearchCenterScientist2Text
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext RuinsOfAlphResearchCenterScientist2Text_UnownAppeared
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterScientist2Text_GotAllUnown
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterComputer:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
.SkipChecking:
	writetext RuinsOfAlphResearchCenterComputerText
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterComputerText_GotAllUnown
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterPrinter:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
.SkipChecking:
	writetext RuinsOfAlphResearchCenterPrinterText_DoesntWork
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterUnownPrinterText
	waitbutton
	special UnownPrinter
	closetext
	end

RuinsOfAlphResearchCenterPhoto: ; unreferenced
	jumptext RuinsOfAlphResearchCenterProfSilktreePhotoText

RuinsOfAlphResearchCenterBookshelf:
	jumptext RuinsOfAlphResearchCenterAcademicBooksText

RuinsOfAlphResearchCenterApproachesComputerMovement:
	step UP
	step UP
	step LEFT
	turn_head UP
	step_end

RuinsOfAlphResearchCenterApproachesPlayerMovement:
	step DOWN
	step_end

RuinsOfAlphResearchCenterLeavesPlayerMovement:
	step UP
	step_end

RuinsOfAlphResearchCenterModifiedDexText:
	text "Xong!"

	para "Tôi đã sửa đổi"
	line "#DEX của bạn."

	para "Tôi thêm #DEX"
	line "tùy chọn"

	para "để lưu dữ liệu"
	line "UNOWN."

	para "Nó ghi chúng theo"
	line "thứ tự bắt được."
	done

RuinsOfAlphResearchCenterDexUpgradedText:
	text "#DEX <PLAYER>"
	line "đã nâng cấp."
	done

RuinsOfAlphResearchCenterScientist3Text:
	text "UNOWN bạn bắt sẽ"
	line "đều được ghi lại."

	para "Kiểm tra xem có"
	line "bao nhiêu loại."
	done

RuinsOfAlphResearchCenterScientist3_PrinterAvailable:
	text "Bạn bắt hết các"
	line "biến thể UNOWN?"

	para "Đó là thành tích"
	line "tuyệt vời!"

	para "Tôi đã thiết lập"
	line "máy in ở đây cho"
	cont "UNOWN."

	para "Dùng thoải mái"
	line "bất cứ lúc nào."
	done

RuinsOfAlphResearchCenterScientist1Text:
	text "TÀN TÍCH có từ"
	line "khoảng 1500 năm"
	cont "trước."

	para "Nhưng không biết"
	line "tại sao chúng được"
	cont "xây--hay bởi ai."
	done

RuinsOfAlphResearchCenterScientist1Text_GotUnownDex:
	text "Tôi tự hỏi có bao"
	line "nhiêu loại #MON"
	cont "trong TÀN TÍCH?"
	done

RuinsOfAlphResearchCenterScientist1Text_UnownAppeared:
	text "#MON xuất hiện"
	line "trong TÀN TÍCH?"

	para "Đó là tin không"
	line "thể tin được!"

	para "Chúng ta cần điều"
	line "tra chuyện này."
	done

RuinsOfAlphResearchCenterScientist1Text_GotAllUnown:
	text "Cuộc điều tra,"
	line "với sự giúp đỡ"

	para "của bạn, đang cho"
	line "ta hiểu về TÀN"
	cont "TÍCH."

	para "TÀN TÍCH dường"
	line "như được xây"

	para "như nơi ở cho"
	line "#MON."
	done

RuinsOfAlphResearchCenterScientist2Text:
	text "Có những họa tiết"
	line "lạ vẽ trên tường"

	para "của TÀN TÍCH."

	para "Chúng hẳn là chìa"
	line "khóa để giải mã"
	cont "bí ẩn của TÀN"
	cont "TÍCH."
	done

RuinsOfAlphResearchCenterScientist2Text_UnownAppeared:
	text "#MON lạ bạn"
	line "thấy trong TÀN"
	cont "TÍCH?"

	para "Chúng có vẻ rất"
	line "giống các bức vẽ"

	para "trên tường ở đó."

	para "Hmm…"

	para "Điều đó có nghĩa"
	line "là có nhiều loại"
	cont "của chúng…"
	done

RuinsOfAlphResearchCenterUnusedText1: ; unreferenced
	text "Chúng tôi nghĩ có"
	line "điều gì đó khiến"

	para "các họa tiết bí ẩn"
	line "xuất hiện trong"
	cont "TÀN TÍCH."

	para "Chúng tôi tập"
	line "trung vào điều đó"
	done

RuinsOfAlphResearchCenterUnusedText2: ; unreferenced
	text "Theo nghiên cứu"
	line "của tôi…"

	para "Những họa tiết bí"
	line "ẩn đó xuất hiện"

	para "khi TT #COM"
	line "được xây."

	para "Điều đó có nghĩa"
	line "là sóng radio có"

	para "một dạng liên hệ"
	line "nào đó…"
	done

RuinsOfAlphResearchCenterScientist2Text_GotAllUnown:
	text "Tại sao những họa"
	line "tiết cổ đại đó"

	para "xuất hiện trên"
	line "tường bây giờ?"

	para "Bí ẩn càng sâu"
	line "thêm…"
	done

RuinsOfAlphResearchCenterComputerText:
	text "TÀN TÍCH ALPH"

	para "Khám Phá"
	line "Năm 10"
	done

RuinsOfAlphResearchCenterComputerText_GotAllUnown:
	text "#MON Bí Ẩn"
	line "Tên: UNOWN"

	para "Tổng {d:NUM_UNOWN}"
	line "loại tìm thấy."
	done

RuinsOfAlphResearchCenterPrinterText_DoesntWork:
	text "Cái này chưa hoạt"
	line "động được."
	done

RuinsOfAlphResearchCenterUnownPrinterText:
	text "UNOWN có thể được"
	line "in ra."
	done

RuinsOfAlphResearchCenterProfSilktreePhotoText:
	text "Đây là ảnh người"
	line "sáng lập TT"

	para "NGHIÊN CỨU,"
	line "GS.SILKTREE."
	done

RuinsOfAlphResearchCenterAcademicBooksText:
	text "Có nhiều sách học"
	line "thuật."

	para "Tàn Tích Cổ Đại…"
	line "Bí Ẩn Của Người"
	cont "Xưa…"
	done

RuinsOfAlphResearchCenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, RUINS_OF_ALPH_OUTSIDE, 6
	warp_event  3,  7, RUINS_OF_ALPH_OUTSIDE, 6

	def_coord_events

	def_bg_events
	bg_event  6,  5, BGEVENT_READ, RuinsOfAlphResearchCenterBookshelf
	bg_event  3,  4, BGEVENT_READ, RuinsOfAlphResearchCenterComputer
	bg_event  7,  1, BGEVENT_READ, RuinsOfAlphResearchCenterPrinter

	def_object_events
	object_event  4,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist1Script, -1
	object_event  5,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist2Script, -1
	object_event  2,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist3Script, EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
