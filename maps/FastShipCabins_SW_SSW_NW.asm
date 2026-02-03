	object_const_def
	const FASTSHIPCABINS_SW_SSW_NW_FISHER
	const FASTSHIPCABINS_SW_SSW_NW_BUG_CATCHER
	const FASTSHIPCABINS_SW_SSW_NW_BEAUTY
	const FASTSHIPCABINS_SW_SSW_NW_ROCKER

FastShipCabins_SW_SSW_NW_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerFirebreatherLyle:
	trainer FIREBREATHER, LYLE, EVENT_BEAT_FIREBREATHER_LYLE, FirebreatherLyleSeenText, FirebreatherLyleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherLyleAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherKen:
	trainer BUG_CATCHER, KEN, EVENT_BEAT_BUG_CATCHER_KEN, BugCatcherKenSeenText, BugCatcherKenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherKenAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyCassie:
	trainer BEAUTY, CASSIE, EVENT_BEAT_BEAUTY_CASSIE, BeautyCassieSeenText, BeautyCassieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyCassieAfterBattleText
	waitbutton
	closetext
	end

TrainerGuitaristClyde:
	trainer GUITARIST, CLYDE, EVENT_BEAT_GUITARIST_CLYDE, GuitaristClydeSeenText, GuitaristClydeBeatenText, 0, .Script

.Script:
	endifjustbattled
	special CheckMobileAdapterStatusSpecial
	iftrue .mobile
	opentext
	writetext GuitaristClydeAfterBattleText
	waitbutton
	closetext
	end

.mobile
	opentext
	writetext GuitaristClydeAfterBattleMobileText
	waitbutton
	closetext
	end

FastShipBed:
	opentext
	writetext FastShipBedText1
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	special FadeInFromBlack
	opentext
	writetext FastShipBedText2
	waitbutton
	closetext
	checkevent EVENT_FAST_SHIP_HAS_ARRIVED
	iftrue .AlreadyArrived
	checkevent EVENT_FAST_SHIP_FOUND_GIRL
	iftrue .CanArrive
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .CanArrive
.AlreadyArrived:
	end

.CanArrive:
	playsound SFX_ELEVATOR_END
	pause 30
	checkevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	iftrue .ArrivedOlivine
	opentext
	writetext FastShipArrivedVermilionText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	end

.ArrivedOlivine:
	opentext
	writetext FastShipArrivedOlivineText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	end

FastShipCabinsNorthwestCabinTrashcan:
	jumpstd TrashCanScript

FirebreatherLyleSeenText:
	text "Tôi sẽ đi KANTO"
	line "để biểu diễn"
	cont "phun lửa!"
	done

FirebreatherLyleBeatenText:
	text "Tắt rồi… Ngọn lửa"
	line "nhỏ xíu…"
	done

FirebreatherLyleAfterBattleText:
	text "Tôi nghĩ lửa yếu"
	line "trên biển."

	para "Không quan trọng?"
	line "Thật sao?"
	done

BugCatcherKenSeenText:
	text "Tôi đang thăm bà"
	line "để bắt côn trùng!"
	done

BugCatcherKenBeatenText:
	text "Ồ, trời."
	line "Bạn mạnh!"
	done

BugCatcherKenAfterBattleText:
	text "Bạn có thể tìm"
	line "nhiều #MON trên"
	cont "cây ở JOHTO!"
	done

BeautyCassieSeenText:
	text "Tôi đang cố quên"
	line "nỗi buồn."
	cont "Hãy đấu thôi!"
	done

BeautyCassieBeatenText:
	text "Tim tôi khóc…"
	done

BeautyCassieAfterBattleText:
	text "Du lịch tốt nhất"
	line "để vượt qua"
	cont "trái tim tan vỡ."

	para "Nhưng chuyến TÀU"
	line "NHANH quá ngắn"
	cont "để buồn."
	done

GuitaristClydeSeenText:
	text "Tôi sẽ thử giọng"
	line "tại ĐÀI RADIO của"

	para "GOLDENROD."
	done

GuitaristClydeBeatenText:
	text "Yowza!"
	line "Méo mó hết!"
	done

GuitaristClydeAfterBattleMobileText:
	text "Tôi định ra mắt"
	line "tại THÁP ĐẤU…"

	para "Tôi nên quay lại"
	line "VERMILION và luyện"
	cont "lại từ đầu…"
	done

GuitaristClydeAfterBattleText:
	text "Nói về ĐÀI RADIO,"

	para "số may mắn tuần"
	line "này là gì?"
	done

FastShipBedText1:
	text "Giường êm ái!"
	line "Đến giờ ngủ…"
	done

FastShipBedText2:
	text "Ah, sảng khoái và"
	line "hồi phục!"
	done

FastShipArrivedOlivineText:
	text "TÀU NHANH S.S.AQUA"
	line "đã tới"
	cont "TP. OLIVINE."
	done

FastShipArrivedVermilionText:
	text "TÀU NHANH S.S.AQUA"
	line "đã tới"
	cont "TP. VERMILION."
	done

FastShipCabins_SW_SSW_NW_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  0, FAST_SHIP_1F, 5
	warp_event  2, 19, FAST_SHIP_1F, 6
	warp_event  3, 19, FAST_SHIP_1F, 6
	warp_event  2, 31, FAST_SHIP_1F, 7
	warp_event  3, 31, FAST_SHIP_1F, 7

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_READ, FastShipBed
	bg_event  7,  2, BGEVENT_READ, FastShipBed
	bg_event  7,  7, BGEVENT_READ, FastShipCabinsNorthwestCabinTrashcan

	def_object_events
	object_event  1, 15, SPRITE_FISHER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherLyle, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  6, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBugCatcherKen, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  1, 26, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyCassie, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  3, 28, SPRITE_ROCKER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerGuitaristClyde, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
