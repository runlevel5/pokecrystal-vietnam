	object_const_def
	const POWERPLANT_OFFICER1
	const POWERPLANT_GYM_GUIDE1
	const POWERPLANT_GYM_GUIDE2
	const POWERPLANT_OFFICER2
	const POWERPLANT_GYM_GUIDE3
	const POWERPLANT_MANAGER
	const POWERPLANT_FOREST

PowerPlant_MapScripts:
	def_scene_scripts
	scene_script PowerPlantNoop1Scene, SCENE_POWERPLANT_NOOP
	scene_script PowerPlantNoop2Scene, SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL

	def_callbacks

PowerPlantNoop1Scene:
	end

PowerPlantNoop2Scene:
	end

PowerPlantGuardPhoneScript:
	playsound SFX_CALL
	showemote EMOTE_SHOCK, POWERPLANT_OFFICER1, 15
	waitsfx
	pause 30
	applymovement POWERPLANT_OFFICER1, PowerPlantOfficer1ApproachGymGuide2Movement
	turnobject POWERPLANT_GYM_GUIDE1, DOWN
	turnobject POWERPLANT_GYM_GUIDE2, DOWN
	opentext
	writetext PowerPlantOfficer1CeruleanShadyCharacterText
	waitbutton
	closetext
	turnobject POWERPLANT_OFFICER1, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext PowerPlantOfficer1CouldIAskForYourCooperationText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement POWERPLANT_OFFICER1, PowerPlantOfficer1ReturnToPostMovement
	setscene SCENE_POWERPLANT_NOOP
	end

PowerPlantOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue .MetManager
	writetext PowerPlantOfficer1AThiefBrokeInText
	waitbutton
	closetext
	end

.MetManager:
	writetext PowerPlantOfficer1CouldIAskForYourCooperationText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantOfficer1HaveToBeefUpSecurityText
	waitbutton
	closetext
	end

PowerPlantGymGuide1Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantGymGuide1SomeoneStoleAPartText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantGymGuide1GeneratorUpAndRunningText
	waitbutton
	closetext
	end

PowerPlantGymGuide2Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantGymGuide2PowerPlantUpAndRunningText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantGymGuide2GeneratorIsRunningAgainText
	waitbutton
	closetext
	end

PowerPlantOfficer2Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantOfficer2ManagerHasBeenSadAndFuriousText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantOfficer2ManagerHasBeenCheerfulText
	waitbutton
	closetext
	end

PowerPlantGymGuide4Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantGymGuide4MagnetTrainConsumesElectricityText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantGymGuide4WeCanGetMagnetTrainRunningText
	waitbutton
	closetext
	end

PowerPlantManager:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkitem MACHINE_PART
	iftrue .FoundMachinePart
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue .MetManager
	writetext PowerPlantManagerWhoWouldRuinMyGeneratorText
	waitbutton
	closetext
	setevent EVENT_MET_MANAGER_AT_POWER_PLANT
	clearevent EVENT_CERULEAN_GYM_ROCKET
	clearevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	setmapscene CERULEAN_GYM, SCENE_CERULEANGYM_GRUNT_RUNS_OUT
	setscene SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL
	end

.MetManager:
	writetext PowerPlantManagerIWontForgiveCulpritText
	waitbutton
	closetext
	end

.FoundMachinePart:
	writetext PowerPlantManagerThatsThePartText
	promptbutton
	takeitem MACHINE_PART
	setevent EVENT_RETURNED_MACHINE_PART
	clearevent EVENT_SAFFRON_TRAIN_STATION_POPULATION
	setevent EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	setevent EVENT_ROUTE_24_ROCKET
	setevent EVENT_RESTORED_POWER_TO_KANTO
	clearevent EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
.ReturnedMachinePart:
	checkevent EVENT_GOT_TM07_ZAP_CANNON
	iftrue .GotZapCannon
	writetext PowerPlantManagerTakeThisTMText
	promptbutton
	verbosegiveitem TM_ZAP_CANNON
	iffalse .NoRoom
	setevent EVENT_GOT_TM07_ZAP_CANNON
	writetext PowerPlantManagerTM07IsZapCannonText
	waitbutton
.NoRoom:
	closetext
	end

.GotZapCannon:
	writetext PowerPlantManagerMyBelovedGeneratorText
	waitbutton
	closetext
	end

Forest:
	faceplayer
	opentext
	trade NPC_TRADE_FOREST
	waitbutton
	closetext
	end

PowerPlantBookshelf:
	jumpstd DifficultBookshelfScript

PowerPlantOfficer1ApproachGymGuide2Movement:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

PowerPlantOfficer1ReturnToPostMovement:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

PowerPlantOfficer1AThiefBrokeInText:
	text "Một tên trộm đã"
	line "đột nhập vào"
	cont "NHÀ MÁY ĐIỆN…"

	para "Thế giới này sao"
	line "lại thế này?"
	done

PowerPlantOfficer1CeruleanShadyCharacterText:
	text "Tôi vừa nhận tin"
	line "từ CERULEAN."

	para "Có vẻ như một kẻ"
	line "đáng ngờ"

	para "đang lảng vảng"
	line "quanh đó."
	done

PowerPlantOfficer1CouldIAskForYourCooperationText:
	text "Tôi có thể nhờ"
	line "bạn giúp đỡ?"
	done

PowerPlantOfficer1HaveToBeefUpSecurityText:
	text "Chúng tôi phải"
	line "tăng cường an"
	cont "ninh hơn."
	done

PowerPlantGymGuide1SomeoneStoleAPartText:
	text "Ai đó đã lấy mất"
	line "một bộ phận"

	para "cần thiết cho"
	line "máy phát điện."

	para "Không có nó, máy"
	line "phát điện mới"
	cont "vô dụng luôn!"
	done

PowerPlantGymGuide1GeneratorUpAndRunningText:
	text "Máy phát điện đã"
	line "hoạt động. Nó"

	para "đang tạo ra điện"
	line "dư thừa."
	done

PowerPlantGymGuide2PowerPlantUpAndRunningText:
	text "NHÀ MÁY ĐIỆN này"
	line "đã bị bỏ hoang"
	cont "trong quá khứ."

	para "Chúng tôi đã khôi"
	line "phục nó để"

	para "cung cấp điện cho"
	line "TÀU NAM CHÂM."
	done

PowerPlantGymGuide2GeneratorIsRunningAgainText:
	text "Máy phát điện đã"
	line "chạy lại rồi!"
	done

PowerPlantOfficer2ManagerHasBeenSadAndFuriousText:
	text "QUẢN LÝ của"
	line "NHÀ MÁY ĐIỆN ở"
	cont "phía trước."

	para "Nhưng từ khi ai"
	line "đó phá hỏng máy,"
	cont "ông ấy vừa buồn"
	cont "vừa tức giận…"
	done

PowerPlantOfficer2ManagerHasBeenCheerfulText:
	text "Từ khi máy phát"
	line "điện được sửa,"

	para "QUẢN LÝ đã vui"
	line "trở lại."
	done

PowerPlantGymGuide4MagnetTrainConsumesElectricityText:
	text "TÀU NAM CHÂM tiêu"
	line "thụ rất nhiều"
	cont "điện năng."

	para "Nó không thể chạy"
	line "nếu máy phát điện"
	cont "không hoạt động."
	done

PowerPlantGymGuide4WeCanGetMagnetTrainRunningText:
	text "Tốt lắm! Cuối"
	line "cùng chúng ta có"

	para "thể cho TÀU NAM"
	line "CHÂM chạy lại."
	done

PowerPlantManagerWhoWouldRuinMyGeneratorText:
	text "QUẢN LÝ: Tôi, tôi"
	line "tôi sẵn sàng nổ"
	cont "tung ai đó rồi!"

	para "Ai dám phá hỏng"
	line "máy phát điện?"

	para "Tôi đã dành bao"
	line "nhiêu thời gian!"

	para "Nếu bắt được hắn,"
	line "hắn sẽ phải nếm"

	para "trải PHÁO ĐIỆN"
	line "của tôi!"
	done

PowerPlantManagerIWontForgiveCulpritText:
	text "QUẢN LÝ: Tôi sẽ"
	line "không tha thứ!"

	para "Thằng thủ phạm có"
	line "thể khóc lóc xin"
	cont "lỗi,"

	para "nhưng tôi vẫn sẽ"
	line "đánh cho hắn!"

	para "Gahahahah!"
	done

PowerPlantManagerThatsThePartText:
	text "QUẢN LÝ: Ồ! Đúng!"

	para "Đó là BỘ PHẬN MÁY"
	line "bị mất từ máy"
	cont "phát điện yêu dấu"
	cont "của tôi!"
	cont "Bạn tìm thấy à?"
	done

PowerPlantManagerTakeThisTMText:
	text "Wahah! Cảm ơn!"

	para "Đây! Nhận TM này"
	line "làm phần thưởng!"
	done

PowerPlantManagerTM07IsZapCannonText:
	text "QUẢN LÝ: TM07 là"
	line "PHÁO ĐIỆN của tôi"

	para "Đó là kỹ năng"
	line "mạnh mẽ!"

	para "Không ai coi nó"
	line "là chính xác,"

	para "nhưng nó rất"
	line "mạnh!"
	done

PowerPlantManagerMyBelovedGeneratorText:
	text "QUẢN LÝ: Máy phát"
	line "điện yêu dấu của"
	cont "tôi!"

	para "Hãy tiếp tục bơm"
	line "điện ra!"
	done

PowerPlant_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 17, ROUTE_10_NORTH, 2
	warp_event  3, 17, ROUTE_10_NORTH, 2

	def_coord_events
	coord_event  5, 12, SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL, PowerPlantGuardPhoneScript

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, PowerPlantBookshelf
	bg_event  1,  1, BGEVENT_READ, PowerPlantBookshelf

	def_object_events
	object_event  4, 14, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PowerPlantOfficerScript, -1
	object_event  2,  9, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuide1Script, -1
	object_event  6, 11, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuide2Script, -1
	object_event  9,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PowerPlantOfficer2Script, -1
	object_event  7,  2, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuide4Script, -1
	object_event 14, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlantManager, -1
	object_event  5,  5, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Forest, -1
