	object_const_def
	const RADIOTOWER3F_SUPER_NERD
	const RADIOTOWER3F_GYM_GUIDE
	const RADIOTOWER3F_COOLTRAINER_F
	const RADIOTOWER3F_ROCKET1
	const RADIOTOWER3F_ROCKET2
	const RADIOTOWER3F_ROCKET3
	const RADIOTOWER3F_SCIENTIST

RadioTower3F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, RadioTower3FCardKeyShutterCallback

RadioTower3FCardKeyShutterCallback:
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .Change
	endcallback

.Change:
	changeblock 14, 2, $2a ; open shutter
	changeblock 14, 4, $01 ; floor
	endcallback

RadioTower3FSuperNerdScript:
	jumptextfaceplayer RadioTower3FSuperNerdText

RadioTower3FGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoRockets
	writetext RadioTower3FGymGuideText_Rockets
	waitbutton
	closetext
	end

.NoRockets:
	writetext RadioTower3FGymGuideText
	waitbutton
	closetext
	end

RadioTower3FCooltrainerFScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SUNNY_DAY_FROM_RADIO_TOWER
	iftrue .GotSunnyDay
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoRockets
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .UsedCardKey
	writetext RadioTower3FCooltrainerFPleaseSaveDirectorText
	waitbutton
	closetext
	end

.UsedCardKey:
	writetext RadioTower3FCooltrainerFIsDirectorSafeText
	waitbutton
	closetext
	end

.NoRockets:
	writetext RadioTower3FCooltrainerFYoureMyHeroText
	promptbutton
	verbosegiveitem TM_SUNNY_DAY
	iffalse .NoRoom
	writetext RadioTower3FCooltrainerFItsSunnyDayText
	waitbutton
	closetext
	setevent EVENT_GOT_SUNNY_DAY_FROM_RADIO_TOWER
	end

.GotSunnyDay:
	writetext RadioTower3FCooltrainerFYouWereMarvelousText
	waitbutton
.NoRoom:
	closetext
	end

TrainerGruntM7:
	trainer GRUNTM, GRUNTM_7, EVENT_BEAT_ROCKET_GRUNTM_7, GruntM7SeenText, GruntM7BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM7AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM8:
	trainer GRUNTM, GRUNTM_8, EVENT_BEAT_ROCKET_GRUNTM_8, GruntM8SeenText, GruntM8BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM8AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM9:
	trainer GRUNTM, GRUNTM_9, EVENT_BEAT_ROCKET_GRUNTM_9, GruntM9SeenText, GruntM9BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM9AfterBattleText
	waitbutton
	closetext
	end

TrainerScientistMarc:
	trainer SCIENTIST, MARC, EVENT_BEAT_SCIENTIST_MARC, ScientistMarcSeenText, ScientistMarcBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistMarcAfterBattleText
	waitbutton
	closetext
	end

CardKeySlotScript::
	opentext
	writetext RadioTower3FCardKeySlotText
	waitbutton
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .UsedCardKey
	checkitem CARD_KEY
	iftrue .HaveCardKey
.UsedCardKey:
	closetext
	end

.HaveCardKey:
	writetext InsertedTheCardKeyText
	waitbutton
	setevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	playsound SFX_ENTER_DOOR
	changeblock 14, 2, $2a ; open shutter
	changeblock 14, 4, $01 ; floor
	refreshmap
	closetext
	waitsfx
	end

RadioTower3FPersonnelSign:
	jumptext RadioTower3FPersonnelSignText

RadioTower3FPokemonMusicSign:
	jumptext RadioTower3FPokemonMusicSignText

RadioTower3FSuperNerdText:
	text "Chúng tôi có bản"
	line "ghi tiếng kêu của"

	para "mọi #MON đã"
	line "được tìm thấy."

	para "Chắc có khoảng"
	line "200 loại."
	done

RadioTower3FGymGuideText_Rockets:
	text "Với HLV, #MON"
	line "là đối tác yêu"
	cont "quý của họ."

	para "Thật tệ khi"
	line "ĐỘI ROCKET đang"

	para "cố kiểm soát"
	line "#MON."
	done

RadioTower3FGymGuideText:
	text "Chúng tôi hoạt"
	line "động 24 giờ để"

	para "phát sóng chương"
	line "trình giải trí."

	para "Tôi cũng sẽ cố"
	line "gắng chạy suốt"
	cont "ngày đêm!"
	done

RadioTower3FCooltrainerFPleaseSaveDirectorText:
	text "Tên trùm"
	line "ĐỘI ROCKET đã"
	cont "nhốt mình trong."

	para "Nhưng GIÁM ĐỐC"
	line "có thể mở được."

	para "Ông ấy ở trên"
	line "tầng năm."

	para "Xin hãy cứu ông!"
	done

RadioTower3FCooltrainerFIsDirectorSafeText:
	text "GIÁM ĐỐC có an"
	line "toàn không?"
	done

RadioTower3FCooltrainerFYoureMyHeroText:
	text "Cảm ơn bạn!"
	line "Bạn là anh hùng!"

	para "Đây là lời cảm"
	line "ơn của tôi."
	done

RadioTower3FCooltrainerFItsSunnyDayText:
	text "Đó là NGÀY NẮNG."
	line "Nó tăng sức mạnh"
	cont "chiêu hệ lửa"
	cont "một thời gian."
	done

RadioTower3FCooltrainerFYouWereMarvelousText:
	text "Bạn thật tuyệt"
	line "vời!"
	done

GruntM7SeenText:
	text "Tao được lệnh"
	line "nghiêm ngặt."

	para "Tao phải nghiền"
	line "nát ai thách thức"
	cont "ĐỘI ROCKET!"
	done

GruntM7BeatenText:
	text "Cái gì?!"
	done

GruntM7AfterBattleText:
	text "Tao đã thất bại"
	line "trong nhiệm vụ…"

	para "Tao sẽ bị trừ"
	line "lương mất…"
	done

GruntM8SeenText:
	text "Thật tuyệt khi"
	line "ra lệnh #MON"
	cont "phạm tội."
	done

GruntM8BeatenText:
	text "Mày đùa tao hả!"
	done

GruntM8AfterBattleText:
	text "Tao thấy tệ vì"
	line "thua rồi!"

	para "Chết tiệt! Tao"
	line "ghét #MON vô"
	cont "dụng!"
	done

GruntM9SeenText:
	text "Sao cửa lại mở?"
	line "Mày có liên quan"

	para "đến chuyện này"
	line "không?"
	done

GruntM9BeatenText:
	text "Tao xong rồi!"
	done

GruntM9AfterBattleText:
	text "Cái gì?! Mày vượt"
	line "qua bọn tao ở"
	cont "ĐỊA ĐẠO sao?"

	para "Sao mày làm được?"
	done

ScientistMarcSeenText:
	text "Một đứa trẻ lạ"
	line "đang lang thang?"

	para "Mày là ai?"
	done

ScientistMarcBeatenText:
	text "Tch! Tao coi"
	line "thường mày quá!"
	done

ScientistMarcAfterBattleText:
	text "Bwahahaha…"

	para "Tao có thể phát"
	line "tín hiệu mạnh"
	cont "tùy ý từ đây."
	done

RadioTower3FCardKeySlotText:
	text "Đây là khe cắm"
	line "THẺ KHÓA."
	done

InsertedTheCardKeyText:
	text "<PLAYER> đã cắm"
	line "THẺ KHÓA."
	done

RadioTower3FPersonnelSignText:
	text "3F NHÂN SỰ"
	done

RadioTower3FPokemonMusicSignText:
	text "#MON MUSIC với"
	line "MC DJ BEN"
	done

RadioTower3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_2F, 1
	warp_event  7,  0, RADIO_TOWER_4F, 2
	warp_event 17,  0, RADIO_TOWER_4F, 4

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RadioTower3FPersonnelSign
	bg_event  9,  0, BGEVENT_READ, RadioTower3FPokemonMusicSign
	bg_event 14,  2, BGEVENT_UP, CardKeySlotScript

	def_object_events
	object_event  7,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower3FSuperNerdScript, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  3,  4, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower3FGymGuideScript, -1
	object_event 11,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower3FCooltrainerFScript, -1
	object_event  5,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM7, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM8, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 16,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM9, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  9,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerScientistMarc, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
