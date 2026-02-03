	object_const_def
	const GOLDENRODUNDERGROUNDWAREHOUSE_ROCKET1
	const GOLDENRODUNDERGROUNDWAREHOUSE_ROCKET2
	const GOLDENRODUNDERGROUNDWAREHOUSE_ROCKET3
	const GOLDENRODUNDERGROUNDWAREHOUSE_GENTLEMAN
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL1
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL2
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL3

GoldenrodUndergroundWarehouse_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, GoldenrodUndergroundWarehouseResetSwitchesCallback

GoldenrodUndergroundWarehouseResetSwitchesCallback:
	clearevent EVENT_SWITCH_1
	clearevent EVENT_SWITCH_2
	clearevent EVENT_SWITCH_3
	clearevent EVENT_EMERGENCY_SWITCH
	clearevent EVENT_SWITCH_4
	clearevent EVENT_SWITCH_5
	clearevent EVENT_SWITCH_6
	clearevent EVENT_SWITCH_7
	clearevent EVENT_SWITCH_8
	clearevent EVENT_SWITCH_9
	clearevent EVENT_SWITCH_10
	clearevent EVENT_SWITCH_11
	clearevent EVENT_SWITCH_12
	clearevent EVENT_SWITCH_13
	clearevent EVENT_SWITCH_14
	setval 0
	writemem wUndergroundSwitchPositions
	endcallback

TrainerGruntM24:
	trainer GRUNTM, GRUNTM_24, EVENT_BEAT_ROCKET_GRUNTM_24, GruntM24SeenText, GruntM24BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM24AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM14:
	trainer GRUNTM, GRUNTM_14, EVENT_BEAT_ROCKET_GRUNTM_14, GruntM14SeenText, GruntM14BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM14AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM15:
	trainer GRUNTM, GRUNTM_15, EVENT_BEAT_ROCKET_GRUNTM_15, GruntM15SeenText, GruntM15BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM15AfterBattleText
	waitbutton
	closetext
	end

GoldenrodUndergroundWarehouseDirectorScript:
	faceplayer
	opentext
	checkevent EVENT_RECEIVED_CARD_KEY
	iftrue .GotCardKey
	writetext DirectorIntroText
	promptbutton
	verbosegiveitem CARD_KEY
	setevent EVENT_RECEIVED_CARD_KEY
	setevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_1
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_2
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_3
	writetext DirectorCardKeyText
	promptbutton
.GotCardKey:
	writetext DirectorAfterText
	waitbutton
	closetext
	end

GoldenrodUndergroundWarehouseMaxEther:
	itemball MAX_ETHER

GoldenrodUndergroundWarehouseTMSleepTalk:
	itemball TM_SLEEP_TALK

GoldenrodUndergroundWarehouseUltraBall:
	itemball ULTRA_BALL

GruntM24SeenText:
	text "Sao mày đến được"
	line "tận đây?"

	para "Hình như không thể"
	line "tránh được. Tao sẽ"
	cont "xử lý mày."
	done

GruntM24BeatenText:
	text "Tao bị xử lý…"
	done

GruntM24AfterBattleText:
	text "ĐỘI ROCKET sẽ tiếp"
	line "tục, chờ đợi sự"
	cont "trở lại của"
	cont "GIOVANNI."

	para "Chúng tao sẽ làm"
	line "bất cứ điều gì."
	done

GruntM14SeenText:
	text "Mày không đi xa"
	line "hơn nữa đâu!"

	para "Tao không thương"
	line "xót kẻ thù, ngay"
	cont "cả lũ nhóc!"
	done

GruntM14BeatenText:
	text "Chết tiệt!"
	done

GruntM14AfterBattleText:
	text "Tao thua…"

	para "Xin hãy tha thứ"
	line "cho tao, GIOVANNI!"
	done

GruntM15SeenText:
	text "Hyuck-hyuck-hyuck!"
	line "Tao nhớ mày!"

	para "Mày đánh bại tao"
	line "tại hang của tao!"
	done

GruntM15BeatenText:
	text "Hyuck-hyuck-hyuck!"
	line "Vậy là thế à?"
	done

GruntM15AfterBattleText:
	text "Hyuck-hyuck-hyuck!"
	line "Thật sảng khoái!"
	cont "Tao sẽ nhớ mày!"
	done

DirectorIntroText:
	text "GIÁM ĐỐC: Ai đó?"
	line "Gì? Bạn đến cứu"
	cont "tôi sao?"

	para "Cảm ơn bạn!"

	para "THÁP RADIO!"

	para "Chuyện gì đang"
	line "xảy ra ở đó?"

	para "Bị ĐỘI ROCKET"
	line "chiếm?"

	para "Đây. Lấy THẺ KHÓA"
	line "này."
	done

DirectorCardKeyText:
	text "GIÁM ĐỐC: Dùng nó"
	line "để mở cửa cuốn ở"
	cont "tầng 3."
	done

DirectorAfterText:
	text "Tôi cầu xin bạn"
	line "giúp đỡ."

	para "Không biết chúng"
	line "sẽ làm gì nếu"

	para "chúng kiểm soát"
	line "máy phát."

	para "Chúng thậm chí có"
	line "thể kiểm soát"

	para "#MON bằng tín"
	line "hiệu đặc biệt!"

	para "Bạn là người duy"
	line "nhất tôi có thể"
	cont "nhờ."

	para "Xin hãy cứu THÁP"
	line "RADIO…"

	para "Và tất cả #MON"
	line "trên toàn quốc!"
	done

GoldenrodUndergroundWarehouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 12, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 2
	warp_event  3, 12, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 3
	warp_event 17,  2, GOLDENROD_DEPT_STORE_B1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  8, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM24, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM14, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerGruntM15, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodUndergroundWarehouseDirectorScript, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 18, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseMaxEther, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_MAX_ETHER
	object_event 13,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseTMSleepTalk, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_TM_SLEEP_TALK
	object_event  2,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseUltraBall, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_ULTRA_BALL
