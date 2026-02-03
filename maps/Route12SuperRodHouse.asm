	object_const_def
	const ROUTE12SUPERRODHOUSE_FISHING_GURU

Route12SuperRodHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route12SuperRodHouseFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SUPER_ROD
	iftrue .GotSuperRod
	writetext OfferSuperRodText
	yesorno
	iffalse .Refused
	writetext GiveSuperRodText
	promptbutton
	verbosegiveitem SUPER_ROD
	iffalse .NoRoom
	setevent EVENT_GOT_SUPER_ROD
.GotSuperRod:
	writetext GaveSuperRodText
	waitbutton
	closetext
	end

.Refused:
	writetext DontWantSuperRodText
	waitbutton
.NoRoom:
	closetext
	end

SuperRodHouseBookshelf: ; unreferenced
	jumpstd PictureBookshelfScript

OfferSuperRodText:
	text "Tôi là em trai"
	line "của NGƯ ÔNG."

	para "Tôi có thể thấy"
	line "bạn thích câu cá."

	para "Không còn nghi"
	line "ngờ gì nữa!"

	para "Đúng không? Tôi"
	line "biết là đúng."
	done

GiveSuperRodText:
	text "Đúng rồi! Như tôi"
	line "nghĩ!"

	para "Người mê câu cá!"
	line "Hãy nhận này--một"
	cont "CẦN SUPER."
	done

GaveSuperRodText:
	text "Hãy thử câu cá ở"
	line "bất cứ đâu có"
	cont "nước."

	para "Nhớ nhé--bạn có"
	line "thể bắt #MON"

	para "khác nhau bằng"
	line "CẦN khác nhau."
	done

DontWantSuperRodText:
	text "Hả? Mắt tôi đã lừa"
	line "dối tôi à?"
	done

Route12SuperRodHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_12, 1
	warp_event  3,  7, ROUTE_12, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route12SuperRodHouseFishingGuruScript, -1
