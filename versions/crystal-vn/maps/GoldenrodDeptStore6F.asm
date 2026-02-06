DEF GOLDENRODDEPTSTORE6F_FRESH_WATER_PRICE EQU 200
DEF GOLDENRODDEPTSTORE6F_SODA_POP_PRICE    EQU 300
DEF GOLDENRODDEPTSTORE6F_LEMONADE_PRICE    EQU 350

	object_const_def
	const GOLDENRODDEPTSTORE6F_LASS
	const GOLDENRODDEPTSTORE6F_SUPER_NERD

GoldenrodDeptStore6F_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodVendingMachine:
	opentext
	writetext GoldenrodVendingText
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .FreshWater
	ifequal 2, .SodaPop
	ifequal 3, .Lemonade
	closetext
	end

.FreshWater:
	checkmoney YOUR_MONEY, GOLDENRODDEPTSTORE6F_FRESH_WATER_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem FRESH_WATER
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, GOLDENRODDEPTSTORE6F_FRESH_WATER_PRICE
	getitemname STRING_BUFFER_3, FRESH_WATER
	sjump .VendItem

.SodaPop:
	checkmoney YOUR_MONEY, GOLDENRODDEPTSTORE6F_SODA_POP_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem SODA_POP
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, GOLDENRODDEPTSTORE6F_SODA_POP_PRICE
	getitemname STRING_BUFFER_3, SODA_POP
	sjump .VendItem

.Lemonade:
	checkmoney YOUR_MONEY, GOLDENRODDEPTSTORE6F_LEMONADE_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem LEMONADE
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, GOLDENRODDEPTSTORE6F_LEMONADE_PRICE
	getitemname STRING_BUFFER_3, LEMONADE
	sjump .VendItem

.VendItem:
	pause 10
	playsound SFX_ENTER_DOOR
	writetext GoldenrodClangText
	promptbutton
	itemnotify
	sjump .Start

.NotEnoughMoney:
	writetext GoldenrodVendingNoMoneyText
	waitbutton
	sjump .Start

.NotEnoughSpace:
	writetext GoldenrodVendingNoSpaceText
	waitbutton
	sjump .Start

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	; Item names must match data/items/names.asm
	db "NƯỚC SẠCH    ¥{d:GOLDENRODDEPTSTORE6F_FRESH_WATER_PRICE}@"  ; FRESH_WATER
	db "SÔ-ĐA POP    ¥{d:GOLDENRODDEPTSTORE6F_SODA_POP_PRICE}@"     ; SODA_POP
	db "CHANH MUỐI   ¥{d:GOLDENRODDEPTSTORE6F_LEMONADE_PRICE}@"     ; LEMONADE
	db "HỦY@"

GoldenrodDeptStore6FLassScript:
	jumptextfaceplayer GoldenrodDeptStore6FLassText

GoldenrodDeptStore6FSuperNerdScript:
	jumptextfaceplayer GoldenrodDeptStore6FSuperNerdText

GoldenrodDeptStore6FDirectory:
	jumptext GoldenrodDeptStore6FDirectoryText

GoldenrodDeptStore6FElevatorButton:
	jumpstd ElevatorButtonScript

GoldenrodVendingText:
	text "Máy bán hàng tự"
	line "động! Menu đây."
	done

GoldenrodClangText:
	text "Lách cách! Một lon"
	line "@"
	text_ram wStringBuffer3
	text_start
	cont "rơi ra!"
	done

GoldenrodVendingNoMoneyText:
	text "Úi, không đủ tiền."
	done

GoldenrodVendingNoSpaceText:
	text "Không còn chỗ để"
	line "đồ nữa."
	done

GoldenrodDeptStore6FLassText:
	text "Bạn có nghe LUCKY"
	line "CHANNEL không?"

	para "Nếu muốn thắng,"
	line "trao đổi #MON"

	para "với càng nhiều"
	line "người càng tốt để"

	para "có số ID khác"
	line "nhau."
	done

GoldenrodDeptStore6FSuperNerdText:
	text "Nếu mệt, thử đồ"
	line "uống từ máy bán"
	cont "tự động."

	para "#MON của bạn"
	line "cũng thích chúng."
	done

GoldenrodDeptStore6FDirectoryText:
	text "Nghỉ Ngơi Sau Khi"
	line "Mua Sắm!"

	para "6T QUẢNG TRƯỜNG"
	line "   YÊN TĨNH"
	done

GoldenrodDeptStore6F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  0, GOLDENROD_DEPT_STORE_5F, 2
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1
	warp_event 13,  0, GOLDENROD_DEPT_STORE_ROOF, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_READ, GoldenrodDeptStore6FDirectory
	bg_event  3,  0, BGEVENT_READ, GoldenrodDeptStore6FElevatorButton
	bg_event  8,  1, BGEVENT_UP, GoldenrodVendingMachine
	bg_event  9,  1, BGEVENT_UP, GoldenrodVendingMachine
	bg_event 10,  1, BGEVENT_UP, GoldenrodVendingMachine
	bg_event 11,  1, BGEVENT_UP, GoldenrodVendingMachine

	def_object_events
	object_event 10,  2, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore6FLassScript, -1
	object_event  8,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore6FSuperNerdScript, -1
