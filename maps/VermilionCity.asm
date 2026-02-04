	object_const_def
	const VERMILIONCITY_TEACHER
	const VERMILIONCITY_GRAMPS
	const VERMILIONCITY_MACHOP
	const VERMILIONCITY_SUPER_NERD
	const VERMILIONCITY_BIG_SNORLAX
	const VERMILIONCITY_POKEFAN_M

VermilionCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, VermilionCityFlypointCallback

VermilionCityFlypointCallback:
	setflag ENGINE_FLYPOINT_VERMILION
	endcallback

VermilionCityTeacherScript:
	jumptextfaceplayer VermilionCityTeacherText

VermilionMachopOwner:
	jumptextfaceplayer VermilionMachopOwnerText

VermilionMachop:
	opentext
	writetext VermilionMachopText1
	cry MACHOP
	waitbutton
	closetext
	earthquake 30
	opentext
	writetext VermilionMachopText2
	waitbutton
	closetext
	end

VermilionCitySuperNerdScript:
	jumptextfaceplayer VermilionCitySuperNerdText

VermilionSnorlax:
	opentext
	special SnorlaxAwake
	iftrue .Awake
	writetext VermilionCitySnorlaxSleepingText
	waitbutton
	closetext
	end

.Awake:
	writetext VermilionCityRadioNearSnorlaxText
	pause 15
	cry SNORLAX
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon SNORLAX, 50
	startbattle
	disappear VERMILIONCITY_BIG_SNORLAX
	setevent EVENT_FOUGHT_SNORLAX
	reloadmapafterbattle
	end

VermilionGymBadgeGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
	iftrue .AlreadyGotItem
	readvar VAR_BADGES
	ifequal NUM_BADGES, .AllBadges
	ifgreater 13, .MostBadges
	ifgreater 9, .SomeBadges
	writetext VermilionCityBadgeGuyTrainerText
	waitbutton
	closetext
	end

.SomeBadges:
	writetext VermilionCityBadgeGuySomeBadgesText
	waitbutton
	closetext
	end

.MostBadges:
	writetext VermilionCityBadgeGuyMostBadgesText
	waitbutton
	closetext
	end

.AllBadges:
	writetext VermilionCityBadgeGuyAllBadgesText
	promptbutton
	verbosegiveitem HP_UP
	iffalse .Done
	setevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
.AlreadyGotItem:
	writetext VermilionCityBadgeGuyBattleEdgeText
	waitbutton
.Done:
	closetext
	end

VermilionCitySign:
	jumptext VermilionCitySignText

VermilionGymSign:
	jumptext VermilionGymSignText

PokemonFanClubSign:
	jumptext PokemonFanClubSignText

VermilionCityDiglettsCaveSign:
	jumptext VermilionCityDiglettsCaveSignText

VermilionCityPortSign:
	jumptext VermilionCityPortSignText

VermilionCityPokecenterSign:
	jumpstd PokecenterSignScript

VermilionCityMartSign:
	jumpstd MartSignScript

VermilionCityHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_VERMILION_CITY_HIDDEN_FULL_HEAL

VermilionCityTeacherText:
	text "CẢNG KUCHIBA là"
	line "cửa ngõ biển"
	cont "của KANTO."

	para "Tàu sang trọng từ"
	line "khắp nơi cập bến"
	cont "ở đây."
	done

VermilionMachopOwnerText:
	text "#MON của tôi"
	line "đang san đất để"
	cont "xây dựng."

	para "Nhưng tôi không"
	line "có tiền để bắt"
	cont "đầu dự án…"
	done

VermilionMachopText1:
	text "MACHOP: Guooh"
	line "gogogoh!"
	done

VermilionMachopText2:
	text "MACHOP đang gầm"
	line "gừ trong khi dậm"
	cont "phẳng mặt đất."
	done

VermilionCitySuperNerdText:
	text "KANTO có tám GYM."

	para "Tòa nhà lớn đó"
	line "là GYM #MON"
	cont "của KUCHIBA."
	done

VermilionCitySnorlaxSleepingText:
	text "SNORLAX đang ngáy"
	line "yên bình…"
	done

VermilionCityRadioNearSnorlaxText:
	text "#GEAR được đặt"
	line "gần SNORLAX đang"
	cont "ngủ…"

	para "…"

	para "SNORLAX thức dậy!"
	done

VermilionCityBadgeGuyTrainerText:
	text "HLV giỏi tụ tập"
	line "ở KANTO."

	para "TRƯỞNG GYM đặc"
	line "biệt mạnh."

	para "Họ sẽ không dễ"
	line "bị đánh bại."
	done

VermilionCityBadgeGuySomeBadgesText:
	text "Cậu bắt đầu sưu"
	line "tầm HUY HIỆU GYM"
	cont "KANTO rồi hả?"

	para "Cậu có đồng ý"
	line "rằng các HLV ở"
	cont "đây rất giỏi?"
	done

VermilionCityBadgeGuyMostBadgesText:
	text "Chắc cậu sắp hoàn"
	line "thành chinh phục"

	para "các GYM KANTO"
	line "rồi."

	para "Cho tôi biết khi"
	line "cậu có đủ tám"
	cont "HUY HIỆU nhé."
	done

VermilionCityBadgeGuyAllBadgesText:
	text "Chúc mừng!"

	para "Cậu đã có đủ các"
	line "HUY HIỆU GYM KANTO"

	para "Tôi có phần thưởng"
	line "cho nỗ lực của"
	cont "cậu."
	done

VermilionCityBadgeGuyBattleEdgeText:
	text "Có nhiều loại"
	line "#MON sẽ giúp"

	para "cậu có lợi thế"
	line "trong chiến đấu."

	para "Tôi chắc HUY HIỆU"
	line "GYM KANTO sẽ giúp"
	cont "cậu."
	done

VermilionCitySignText:
	text "TP. KUCHIBA"

	para "Cảng Hoàng Hôn"
	line "Tuyệt Đẹp"
	done

VermilionGymSignText:
	text "TP. KUCHIBA"
	line "GYM #MON"
	cont "TRƯỞNG: LT.SURGE"

	para "Người Mỹ Sấm Sét"
	done

PokemonFanClubSignText:
	text "CLB FAN #MON"

	para "Chào đón mọi"
	line "Fan của #MON!"
	done

VermilionCityDiglettsCaveSignText:
	text "ĐỘNG DIGLETT"
	done

VermilionCityPortSignText:
	text "LỐI VÀO"
	line "CẢNG KUCHIBA"
	done

VermilionCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, VERMILION_FISHING_SPEECH_HOUSE, 1
	warp_event  9,  5, VERMILION_POKECENTER_1F, 1
	warp_event  7, 13, POKEMON_FAN_CLUB, 1
	warp_event 13, 13, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, 1
	warp_event 21, 13, VERMILION_MART, 2
	warp_event 21, 17, VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE, 1
	warp_event 10, 19, VERMILION_GYM, 1
	warp_event 19, 31, VERMILION_PORT_PASSAGE, 1
	warp_event 20, 31, VERMILION_PORT_PASSAGE, 2
	warp_event 34,  7, DIGLETTS_CAVE, 1

	def_coord_events

	def_bg_events
	bg_event 25,  3, BGEVENT_READ, VermilionCitySign
	bg_event  5, 19, BGEVENT_READ, VermilionGymSign
	bg_event  5, 13, BGEVENT_READ, PokemonFanClubSign
	bg_event 33,  9, BGEVENT_READ, VermilionCityDiglettsCaveSign
	bg_event 27, 15, BGEVENT_READ, VermilionCityPortSign
	bg_event 10,  5, BGEVENT_READ, VermilionCityPokecenterSign
	bg_event 22, 13, BGEVENT_READ, VermilionCityMartSign
	bg_event 12, 19, BGEVENT_ITEM, VermilionCityHiddenFullHeal

	def_object_events
	object_event 18,  9, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityTeacherScript, -1
	object_event 23,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionMachopOwner, -1
	object_event 26,  7, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VermilionMachop, -1
	object_event 14, 16, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionCitySuperNerdScript, -1
	object_event 34,  8, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionSnorlax, EVENT_VERMILION_CITY_SNORLAX
	object_event 31, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionGymBadgeGuy, -1
