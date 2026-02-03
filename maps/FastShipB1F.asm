	object_const_def
	const FASTSHIPB1F_SAILOR1
	const FASTSHIPB1F_SAILOR2
	const FASTSHIPB1F_SAILOR3
	const FASTSHIPB1F_LASS
	const FASTSHIPB1F_SUPER_NERD
	const FASTSHIPB1F_SAILOR4
	const FASTSHIPB1F_FISHER
	const FASTSHIPB1F_BLACK_BELT
	const FASTSHIPB1F_SAILOR5
	const FASTSHIPB1F_TEACHER
	const FASTSHIPB1F_YOUNGSTER1
	const FASTSHIPB1F_YOUNGSTER2

FastShipB1F_MapScripts:
	def_scene_scripts
	scene_script FastShipB1FNoop1Scene, SCENE_FASTSHIPB1F_SAILOR_BLOCKS
	scene_script FastShipB1FNoop2Scene, SCENE_FASTSHIPB1F_NOOP

	def_callbacks

FastShipB1FNoop1Scene:
	end

FastShipB1FNoop2Scene:
	end

FastShipB1FSailorBlocksLeft:
	checkevent EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	iftrue FastShipB1FAlreadyBlocked
	applymovement FASTSHIPB1F_SAILOR2, FastShipB1FSailorBlocksLeftMovement
	moveobject FASTSHIPB1F_SAILOR1, 30, 6
	appear FASTSHIPB1F_SAILOR1
	pause 5
	disappear FASTSHIPB1F_SAILOR2
	end

FastShipB1FSailorBlocksRight:
	checkevent EVENT_FAST_SHIP_B1F_SAILOR_LEFT
	iftrue FastShipB1FAlreadyBlocked
	applymovement FASTSHIPB1F_SAILOR1, FastShipB1FSailorBlocksRightMovement
	moveobject FASTSHIPB1F_SAILOR2, 31, 6
	appear FASTSHIPB1F_SAILOR2
	pause 5
	disappear FASTSHIPB1F_SAILOR1
	end

FastShipB1FAlreadyBlocked:
	end

FastShipB1FSailorScript:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .FirstTime
	checkevent EVENT_FAST_SHIP_LAZY_SAILOR
	iftrue .LazySailor
	checkevent EVENT_FAST_SHIP_INFORMED_ABOUT_LAZY_SAILOR
	iftrue .AlreadyInformed
	writetext FastShipB1FOnDutySailorText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_INFORMED_ABOUT_LAZY_SAILOR
	clearevent EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	end

.AlreadyInformed:
	writetext FastShipB1FOnDutySailorRefusedText
	waitbutton
	closetext
	end

.LazySailor:
	writetext FastShipB1FOnDutySailorThanksText
	checkevent EVENT_FAST_SHIP_FOUND_GIRL
	iffalse .NotFoundGirl
	waitbutton
	closetext
	end

.NotFoundGirl:
	promptbutton
	writetext FastShipB1FOnDutySailorSawLittleGirlText
	waitbutton
	closetext
	end

.FirstTime:
	writetext FastShipB1FOnDutySailorDirectionsText
	waitbutton
	closetext
	end

TrainerSailorJeff:
	trainer SAILOR, JEFF, EVENT_BEAT_SAILOR_JEFF, SailorJeffSeenText, SailorJeffBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorJeffAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerDebra:
	trainer PICNICKER, DEBRA, EVENT_BEAT_PICNICKER_DEBRA, PicnickerDebraSeenText, PicnickerDebraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerDebraAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerFritz:
	trainer JUGGLER, FRITZ, EVENT_BEAT_JUGGLER_FRITZ, JugglerFritzSeenText, JugglerFritzBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerFritzAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorGarrett:
	trainer SAILOR, GARRETT, EVENT_BEAT_SAILOR_GARRETT, SailorGarrettSeenText, SailorGarrettBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorGarrettAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherJonah:
	trainer FISHER, JONAH, EVENT_BEAT_FISHER_JONAH, FisherJonahSeenText, FisherJonahBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherJonahAfterBattleText
	waitbutton
	closetext
	end

TrainerBlackbeltWai:
	trainer BLACKBELT_T, WAI, EVENT_BEAT_BLACKBELT_WAI, BlackbeltWaiSeenText, BlackbeltWaiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltWaiAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorKenneth:
	trainer SAILOR, KENNETH, EVENT_BEAT_SAILOR_KENNETH, SailorKennethSeenText, SailorKennethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorKennethAfterBattleText
	waitbutton
	closetext
	end

TrainerTeacherShirley:
	trainer TEACHER, SHIRLEY, EVENT_BEAT_TEACHER_SHIRLEY, TeacherShirleySeenText, TeacherShirleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherShirleyAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyNate:
	trainer SCHOOLBOY, NATE, EVENT_BEAT_SCHOOLBOY_NATE, SchoolboyNateSeenText, SchoolboyNateBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyNateAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyRicky:
	trainer SCHOOLBOY, RICKY, EVENT_BEAT_SCHOOLBOY_RICKY, SchoolboyRickySeenText, SchoolboyRickyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyRickyAfterBattleText
	waitbutton
	closetext
	end

FastShipB1FTrashcan:
	jumpstd TrashCanScript

FastShipB1FSailorBlocksRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	turn_head DOWN
	step_end

FastShipB1FSailorBlocksLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	turn_head DOWN
	step_end

FastShipB1FOnDutySailorText:
	text "Này, bạn có thể"
	line "tìm giúp tôi đồng"
	cont "nghiệp của tôi"
	cont "không?"

	para "Hắn ta đang trốn"
	line "ở đâu đó, thằng"
	cont "lười biếng!"

	para "Tôi muốn đi tìm"
	line "hắn, nhưng tôi"
	cont "đang trực."
	done

FastShipB1FOnDutySailorRefusedText:
	text "Ôi trời…"

	para "THUYỀN TRƯỞNG sẽ"
	line "nổi giận…"
	done

FastShipB1FOnDutySailorThanksText:
	text "Cảm ơn bạn!"
	line "Tôi đã mắng hắn"

	para "để hắn không còn"
	line "lười biếng nữa!"
	done

FastShipB1FOnDutySailorSawLittleGirlText:
	text "Một cô bé?"

	para "Tôi có thể đã"
	line "thấy nó đi qua"
	cont "đây."
	done

FastShipB1FOnDutySailorDirectionsText:
	text "Phòng ăn ở phía"
	line "trước."

	para "Cầu thang ở cuối"
	line "dẫn tới cabin của"
	cont "THUYỀN TRƯỞNG."
	done

SailorJeffSeenText:
	text "Không gì bằng một"
	line "trận đấu khi tôi"
	cont "đang nghỉ."
	done

SailorJeffBeatenText:
	text "Thắng hay thua,"
	line "giờ nghỉ hết rồi!"
	done

SailorJeffAfterBattleText:
	text "Tôi không thể"
	line "thắng nếu tôi"
	cont "không nghiêm túc."
	done

PicnickerDebraSeenText:
	text "Tôi chán quá."
	line "Muốn đấu không?"
	done

PicnickerDebraBeatenText:
	text "Trời! Bạn mạnh"
	line "quá!"
	done

PicnickerDebraAfterBattleText:
	text "SAFFRON, CELADON…"
	line "Tôi nghe có nhiều"

	para "thành phố lớn ở"
	line "KANTO."
	done

JugglerFritzSeenText:
	text "Ừ…"
	line "Tôi say sóng!"
	done

JugglerFritzBeatenText:
	text "Tôi không thể di"
	line "chuyển nữa…"
	done

JugglerFritzAfterBattleText:
	text "Không đi tàu nữa."
	line "Lần sau tôi sẽ"

	para "đi TÀU ĐIỆN"
	line "MAGNET."
	done

SailorGarrettSeenText:
	text "Đây là nơi chúng"
	line "tôi làm việc!"
	done

SailorGarrettBeatenText:
	text "Tôi thua trên sân"
	line "nhà của mình…"
	done

SailorGarrettAfterBattleText:
	text "Hành khách khác"
	line "nhau giữa tuyến"

	para "TP. VERMILION đến"
	line "TP. OLIVINE."
	done

FisherJonahSeenText:
	text "Dù đang trên biển"
	line "tôi không thể câu"
	cont "cá!"

	para "Chán quá! Hãy"
	line "đấu đi!"
	done

FisherJonahBeatenText:
	text "Tôi… không còn"
	line "chán nữa…"
	done

FisherJonahAfterBattleText:
	text "Tôi dự định câu ở"
	line "bến cảng"
	cont "VERMILION."
	done

BlackbeltWaiSeenText:
	text "Tôi đang rèn luyện"
	line "chân bằng cách"

	para "chống lại sự lắc"
	line "lư của tàu!"
	done

BlackbeltWaiBeatenText:
	text "Lắc và rung"
	line "ngã rồi!"
	done

BlackbeltWaiAfterBattleText:
	text "Tôi không tìm thấy"
	line "VUA KARATE ở"
	cont "JOHTO."

	para "Hắn đang luyện"
	line "tập trong hang"
	cont "nào đó."
	done

SailorKennethSeenText:
	text "Tôi là thủy thủ!"

	para "Nhưng tôi đang"
	line "huấn luyện #MON"
	cont "để trở thành VÔ"
	cont "ĐỊCH!"
	done

SailorKennethBeatenText:
	text "Thiếu rèn luyện"
	line "quá rõ ràng…"
	done

SailorKennethAfterBattleText:
	text "Tám HUY HIỆU!"
	line "Chúng chứng minh"

	para "rằng bạn đã đánh"
	line "bại T.LĨNH GYM."

	para "Không lạ khi bạn"
	line "giỏi thế!"
	done

TeacherShirleySeenText:
	text "Đừng đụng vào học"
	line "trò của tôi!"
	done

TeacherShirleyBeatenText:
	text "Aaack!"
	done

TeacherShirleyAfterBattleText:
	text "Chúng tôi đang đi"
	line "tham quan TÀN TÍCH"
	cont "ngoài VIOLET."
	done

SchoolboyNateSeenText:
	text "Bạn có biết TÀN"
	line "TÍCH ALPH không?"
	done

SchoolboyNateBeatenText:
	text "Yaargh!"
	done

SchoolboyNateAfterBattleText:
	text "Radio bắt được"
	line "tín hiệu kỳ lạ"
	cont "trong TÀN TÍCH."
	done

SchoolboyRickySeenText:
	text "Có vài tấm đá kỳ"
	line "lạ ở TÀN TÍCH"
	cont "ALPH."
	done

SchoolboyRickyBeatenText:
	text "Tôi thua rồi!"
	done

SchoolboyRickyAfterBattleText:
	text "Tôi đọc được rằng"
	line "có bốn tấm đá"
	cont "như vậy."
	done

FastShipB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 11, FAST_SHIP_1F, 11
	warp_event 31, 13, FAST_SHIP_1F, 12

	def_coord_events
	coord_event 30,  7, SCENE_FASTSHIPB1F_SAILOR_BLOCKS, FastShipB1FSailorBlocksLeft
	coord_event 31,  7, SCENE_FASTSHIPB1F_SAILOR_BLOCKS, FastShipB1FSailorBlocksRight

	def_bg_events
	bg_event 27,  9, BGEVENT_READ, FastShipB1FTrashcan

	def_object_events
	object_event 30,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FastShipB1FSailorScript, EVENT_FAST_SHIP_B1F_SAILOR_LEFT
	object_event 31,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FastShipB1FSailorScript, EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	object_event  9, 11, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorJeff, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  6,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerDebra, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 26,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerJugglerFritz, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 17,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorGarrett, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 25,  8, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherJonah, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 15, 11, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltWai, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 23,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorKenneth, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  9, 11, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerTeacherShirley, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event 14,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyNate, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event 14, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyRicky, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
