	object_const_def
	const WISETRIOSROOM_SAGE1
	const WISETRIOSROOM_SAGE2
	const WISETRIOSROOM_SAGE3
	const WISETRIOSROOM_SAGE4
	const WISETRIOSROOM_SAGE5
	const WISETRIOSROOM_SAGE6

WiseTriosRoom_MapScripts:
	def_scene_scripts
	scene_script WiseTriosRoomNoop1Scene, SCENE_WISETRIOSROOM_SAGE_BLOCKS
	scene_script WiseTriosRoomNoop2Scene, SCENE_WISETRIOSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, WiseTriosRoomWiseTrioCallback

WiseTriosRoomNoop1Scene:
	end

WiseTriosRoomNoop2Scene:
	end

WiseTriosRoomWiseTrioCallback:
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue .NoWiseTrio
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .WiseTrio2
	checkitem CLEAR_BELL
	iftrue .WiseTrio2
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	endcallback

.WiseTrio2:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	endcallback

.NoWiseTrio:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	endcallback

WiseTriosRoomSage1Script:
	jumptextfaceplayer WiseTriosRoomSage1Text

WiseTriosRoomSage2Script:
	jumptextfaceplayer WiseTriosRoomSage2Text

WiseTriosRoomSage3Script:
	jumptextfaceplayer WiseTriosRoomSage3Text

WiseTriosRoom_CannotEnterTinTowerScript:
	turnobject WISETRIOSROOM_SAGE3, UP
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, WISETRIOSROOM_SAGE3, 20
	follow PLAYER, WISETRIOSROOM_SAGE3
	applymovement PLAYER, WiseTriosRoomSageBlocksPlayerMovement
	stopfollow
	turnobject PLAYER, RIGHT
	opentext
	writetext WiseTriosRoomSage3BlocksExitText
	waitbutton
	closetext
	applymovement WISETRIOSROOM_SAGE3, WiseTriosRoomSageReturnsMovement
	turnobject WISETRIOSROOM_SAGE3, LEFT
	end

TrainerSageGaku:
	trainer SAGE, GAKU, EVENT_BEAT_SAGE_GAKU, SageGakuSeenText, SageGakuBeatenText, 0, .Script

.Script:
	opentext
	writetext SageGakuAfterBattleText
	waitbutton
	closetext
	end

TrainerSageMasa:
	trainer SAGE, MASA, EVENT_BEAT_SAGE_MASA, SageMasaSeenText, SageMasaBeatenText, 0, .Script

.Script:
	opentext
	writetext SageMasaAfterBattleText
	waitbutton
	closetext
	end

TrainerSageKoji:
	trainer SAGE, KOJI, EVENT_BEAT_SAGE_KOJI, SageKojiSeenText, SageKojiBeatenText, 0, .Script

.Script:
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .KojiAllowsPassage
	pause 10
	showemote EMOTE_SHOCK, WISETRIOSROOM_SAGE6, 20
	opentext
	writetext SageKojiAfterBattleQuestionText
	promptbutton
	writetext SageKojiAfterBattleSpeechText
	waitbutton
	closetext
	applymovement WISETRIOSROOM_SAGE6, WiseTriosRoomSageAllowsPassageMovement
	turnobject WISETRIOSROOM_SAGE6, UP
	setevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	setscene SCENE_WISETRIOSROOM_NOOP
	end

.KojiAllowsPassage:
	opentext
	writetext SageKojiAfterBattleFinalText
	waitbutton
	closetext
	end

WiseTriosRoomSageBlocksPlayerMovement:
	step LEFT
	step LEFT
	step_end

WiseTriosRoomSageReturnsMovement:
	step RIGHT
	step DOWN
	step_end

WiseTriosRoomSageAllowsPassageMovement:
	step RIGHT
	step DOWN
	step_end

WiseTriosRoomSage1Text:
	text "Kinh ngạc…"

	para "SUICUNE, ENTEI và"
	line "RAIKOU đã tỉnh"
	cont "giấc…"

	para "Truyền thuyết có"
	line "thành sự thật?"
	done

WiseTriosRoomSage2Text:
	text "Chúng tôi rèn"
	line "luyện tại THÁP"
	cont "CHÁY,"

	para "nhưng chúng tôi"
	line "chưa từng nghe có"

	para "lỗ hổng xuất hiện"
	line "ở đó trước đây."

	para "Hẳn đã cố ý được"
	line "tạo ra bởi ai đó."
	done

WiseTriosRoomSage3BlocksExitText:
	text "THÁP CHUÔNG chỉ có"
	line "thể vào bởi người"

	para "sở hữu HUY HIỆU"
	line "GYM ENJU."

	para "Tuy nhiên, giờ"
	line "SUICUNE, RAIKOU"

	para "và ENTEI đã thức"
	line "dậy, tôi yêu cầu"

	para "bạn không được"
	line "vào!"
	done

WiseTriosRoomSage3Text:
	text "Chúng tôi, BA"
	line "HIỀN TRÍ, là người"

	para "bảo vệ các #MON"
	line "huyền thoại."
	done

SageGakuSeenText:
	text "Truyền thuyết nói"
	line "rằng khi xuất hiện"

	para "HLV có khả năng"
	line "chạm đến tâm hồn"

	para "của #MON, một"
	line "#MON sẽ đến để"

	para "thử thách HLV đó"
	line "tại THÁP CHUÔNG."

	para "Truyền thuyết đã"
	line "thành sự thật!"

	para "#MON huyền"
	line "thoại SUICUNE đã"
	cont "đến!"

	para "Chúng tôi, BA HIỀN"
	line "TRÍ, sẽ kiểm tra"

	para "xem bạn có đủ tư"
	line "cách để vào!"
	done

SageGakuBeatenText:
	text "Mạnh hơn chúng tôi"
	line "nghĩ? Có lẽ…"
	done

SageGakuAfterBattleText:
	text "À, vậy bạn là"
	line "người nói đã thấy"

	para "SUICUNE, ENTEI và"
	line "RAIKOU khi chúng"
	cont "ngủ?"

	para "Không thể tin được"

	para "Truyền thuyết nói"
	line "rằng không thể"

	para "nhìn thấy chúng"
	line "khi chúng ngủ…"
	done

SageMasaSeenText:
	text "Bạn có thể được"
	line "tin tưởng với sự"
	cont "thật không?"

	para "Tôi phải xác nhận"
	line "tư cách của bạn."
	done

SageMasaBeatenText:
	text "…Tôi sẽ nói cho"
	line "bạn sự thật…"
	done

SageMasaAfterBattleText:
	text "Ngày xưa, có hai"
	line "tòa tháp chín tầng"
	cont "ở đây."

	para "THÁP ĐỒNG, được"
	line "nói là đánh thức"

	para "#MON, và THÁP"
	line "THIẾC, nơi #MON"

	para "được nói là nghỉ"
	line "ngơi."

	para "Quang cảnh từ đỉnh"
	line "các THÁP hẳn rất"

	para "tráng lệ."

	para "Vào thời đó, một"
	line "#MON to lớn màu"

	para "bạc được cho là"
	line "đậu trên đỉnh"

	para "THÁP ĐỒNG."

	para "Tuy nhiên…"

	para "Khoảng 150 năm"
	line "trước, một tia sét"

	para "đánh trúng một"
	line "trong hai THÁP."

	para "Nó bị nuốt trong"
	line "lửa cháy ba ngày"
	cont "ba đêm."

	para "Một trận mưa đột"
	line "ngột cuối cùng"

	para "dập tắt ngọn lửa."

	para "Và đó là cách THÁP"
	line "CHÁY ra đời."
	done

SageKojiSeenText:
	text "Hãy cho tôi thấy"
	line "sức mạnh của bạn!"
	done

SageKojiBeatenText:
	text "Quá mạnh!"
	line "Sao vậy?"
	done

SageKojiAfterBattleQuestionText:
	text "Bạn… Bạn có phải"
	line "là HLV được chờ"

	para "đợi bởi #MON"
	line "huyền thoại?"
	done

SageKojiAfterBattleSpeechText:
	text "Tôi hiểu rồi…"

	para "Chúng tôi, BA HIỀN"
	line "TRÍ, được giao"

	para "trách nhiệm bảo vệ"
	line "#MON huyền"
	cont "thoại."

	para "Chúng tôi chỉ cho"
	line "phép những người"

	para "sở hữu sức mạnh"
	line "và linh hồn sự"
	cont "thật qua."

	para "Xin hãy tiếp tục"
	line "và vào THÁP CHUÔNG"
	cont "phía trước."

	para "SUICUNE sẽ kiểm"
	line "tra bạn."
	done

SageKojiAfterBattleFinalText:
	text "Xin hãy tiếp tục."

	para "SUICUNE sẽ kiểm"
	line "tra bạn."
	done

WiseTriosRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  4, ECRUTEAK_CITY, 4
	warp_event  7,  5, ECRUTEAK_CITY, 5
	warp_event  1,  4, ECRUTEAK_TIN_TOWER_ENTRANCE, 5

	def_coord_events
	coord_event  7,  4, SCENE_WISETRIOSROOM_SAGE_BLOCKS, WiseTriosRoom_CannotEnterTinTowerScript

	def_bg_events

	def_object_events
	object_event  6,  2, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage1Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  6,  7, SPRITE_SAGE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage2Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  7,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage3Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  4,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageGaku, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  4,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageMasa, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  6,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageKoji, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
