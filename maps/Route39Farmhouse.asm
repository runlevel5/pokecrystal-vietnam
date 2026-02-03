DEF ROUTE39FARMHOUSE_MILK_PRICE EQU 500

	object_const_def
	const ROUTE39FARMHOUSE_POKEFAN_M
	const ROUTE39FARMHOUSE_POKEFAN_F

Route39Farmhouse_MapScripts:
	def_scene_scripts

	def_callbacks

PokefanM_DairyFarmer:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue FarmerMScript_SellMilk
	writetext FarmerMText_SickCow
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	end

FarmerMScript_SellMilk:
	checkitem MOOMOO_MILK
	iftrue FarmerMScript_Milking
	writetext FarmerMText_BuyMilk
	special PlaceMoneyTopRight
	yesorno
	iffalse FarmerMScript_NoSale
	checkmoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
	ifequal HAVE_LESS, FarmerMScript_NoMoney
	giveitem MOOMOO_MILK
	iffalse FarmerMScript_NoRoom
	takemoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext FarmerMText_GotMilk
	promptbutton
	itemnotify
	closetext
	end

FarmerMScript_NoMoney:
	writetext FarmerMText_NoMoney
	waitbutton
	closetext
	end

FarmerMScript_NoRoom:
	writetext FarmerMText_NoRoom
	waitbutton
	closetext
	end

FarmerMScript_NoSale:
	writetext FarmerMText_NoSale
	waitbutton
	closetext
	end

FarmerMScript_Milking:
	writetext FarmerMText_Milking
	waitbutton
	closetext
	end

PokefanF_SnoreFarmer:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
	iftrue FarmerFScript_GotSnore
	checkevent EVENT_HEALED_MOOMOO
	iftrue FarmerFScript_GiveSnore
	writetext FarmerFText_InTrouble
	waitbutton
	closetext
	end

FarmerFScript_GiveSnore:
	writetext FarmerFText_HealedMiltank
	promptbutton
	verbosegiveitem TM_SNORE
	iffalse FarmerFScript_NoRoomForSnore
	setevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
FarmerFScript_GotSnore:
	writetext FarmerFText_SnoreSpeech
	waitbutton
FarmerFScript_NoRoomForSnore:
	closetext
	end

FarmhouseBookshelf:
	jumpstd PictureBookshelfScript

FarmerMText_SickCow:
	text "MILTANK của ông"
	line "không cho sữa"
	cont "nữa."

	para "FARM này nổi tiếng"
	line "với sữa."

	para "Hầu hết mọi người"
	line "đều muốn uống."

	para "Nó sẽ cho ông"
	line "nhiều sữa nếu"

	para "ông cho nó ăn"
	line "nhiều QUẢ."
	done

FarmerMText_BuyMilk:
	text "Bạn có muốn SỮA"
	line "MOOMOO của ông?"

	para "Đó là niềm tự hào"
	line "của ông."

	para "Cho #MON để hồi"
	line "phục HP!"

	para "Chỉ có"
	line "¥{d:ROUTE39FARMHOUSE_MILK_PRICE}."
	done

FarmerMText_GotMilk:
	text "Của bạn đây!"
	line "Uống và tận hưởng!"
	done

FarmerMText_NoMoney:
	text "Xin lỗi nhé."
	line "Không tiền, không"
	cont "bán!"
	done

FarmerMText_NoRoom:
	text "Ông nghĩ PACK của"
	line "bạn đầy rồi."
	done

FarmerMText_NoSale:
	text "Bạn không muốn à?"
	line "Lần sau ghé lại!"
	done

FarmerMText_Milking:
	text "Ông phải đi vắt"
	line "sữa đây."
	done

FarmerFText_InTrouble:
	text "Sữa của chúng tôi"
	line "cả KANTO mua."

	para "Vì thế nếu MILTANK"
	line "không cho sữa,"

	para "chúng tôi gặp"
	line "rắc rối lắm."
	done

FarmerFText_HealedMiltank:
	text "Con đã chữa lành"
	line "MILTANK của bà rồi"

	para "Bây giờ nó cho SỮA"
	line "MOOMOO trở lại."

	para "Đây là phần thưởng"
	line "cho công của con."
	done

Text_ReceivedTM13: ; unreferenced
	text "<PLAYER> received"
	line "TM13."
	done

FarmerFText_SnoreSpeech:
	text "Đó là NGÁY."

	para "Đó là chiêu hiếm"
	line "chỉ hoạt động"

	para "khi #MON đang"
	line "ngủ."

	para "Con nên nghĩ cách"
	line "dùng nó thế nào"
	cont "nhé."
	done

Route39Farmhouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_39, 2
	warp_event  3,  7, ROUTE_39, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, FarmhouseBookshelf
	bg_event  1,  1, BGEVENT_READ, FarmhouseBookshelf

	def_object_events
	object_event  3,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokefanM_DairyFarmer, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokefanF_SnoreFarmer, -1
