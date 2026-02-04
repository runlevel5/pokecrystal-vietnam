	object_const_def
	const MRPOKEMONSHOUSE_GENTLEMAN
	const MRPOKEMONSHOUSE_OAK

MrPokemonsHouse_MapScripts:
	def_scene_scripts
	scene_script MrPokemonsHouseMeetMrPokemonScene, SCENE_MRPOKEMONSHOUSE_MEET_MR_POKEMON
	scene_script MrPokemonsHouseNoopScene,          SCENE_MRPOKEMONSHOUSE_NOOP

	def_callbacks

MrPokemonsHouseMeetMrPokemonScene:
	sdefer MrPokemonsHouseMrPokemonEventScript
	end

MrPokemonsHouseNoopScene:
	end

MrPokemonsHouseMrPokemonEventScript:
	showemote EMOTE_SHOCK, MRPOKEMONSHOUSE_GENTLEMAN, 15
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	opentext
	writetext MrPokemonIntroText1
	waitbutton
	closetext
	applymovement PLAYER, MrPokemonsHouse_PlayerWalksToMrPokemon
	opentext
	writetext MrPokemonIntroText2
	promptbutton
	waitsfx
	giveitem MYSTERY_EGG
	writetext MrPokemonsHouse_GotEggText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	blackoutmod CHERRYGROVE_CITY
	writetext MrPokemonIntroText3
	promptbutton
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, RIGHT
	writetext MrPokemonIntroText4
	promptbutton
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	turnobject MRPOKEMONSHOUSE_OAK, LEFT
	writetext MrPokemonIntroText5
	waitbutton
	closetext
	sjump MrPokemonsHouse_OakScript

MrPokemonsHouse_MrPokemonScript:
	faceplayer
	opentext
	checkitem RED_SCALE
	iftrue .RedScale
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .AlwaysNewDiscoveries
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	end

.AlwaysNewDiscoveries:
	writetext MrPokemonText_AlwaysNewDiscoveries
	waitbutton
	closetext
	end

.RedScale:
	writetext MrPokemonText_GimmeTheScale
	yesorno
	iffalse .refused
	verbosegiveitem EXP_SHARE
	iffalse .full
	takeitem RED_SCALE
	sjump .AlwaysNewDiscoveries

.refused
	writetext MrPokemonText_Disappointed
	waitbutton
.full
	closetext
	end

MrPokemonsHouse_OakScript:
	playmusic MUSIC_PROF_OAK
	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakWalksToPlayer
	turnobject PLAYER, RIGHT
	opentext
	writetext MrPokemonsHouse_OakText1
	promptbutton
	waitsfx
	writetext MrPokemonsHouse_GetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	writetext MrPokemonsHouse_OakText2
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakExits
	playsound SFX_EXIT_BUILDING
	disappear MRPOKEMONSHOUSE_OAK
	waitsfx
	special RestartMapMusic
	pause 15
	turnobject PLAYER, UP
	opentext
	writetext MrPokemonsHouse_MrPokemonHealText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special StubbedTrainerRankings_Healings
	special HealParty
	pause 60
	special FadeInFromBlack
	special RestartMapMusic
	opentext
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	setevent EVENT_RIVAL_NEW_BARK_TOWN
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	setscene SCENE_MRPOKEMONSHOUSE_NOOP
	setmapscene CHERRYGROVE_CITY, SCENE_CHERRYGROVECITY_MEET_RIVAL
	setmapscene ELMS_LAB, SCENE_ELMSLAB_MEET_OFFICER
	specialphonecall SPECIALCALL_ROBBED
	clearevent EVENT_COP_IN_ELMS_LAB
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .RivalTakesChikorita
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .RivalTakesCyndaquil
	setevent EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesChikorita:
	setevent EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesCyndaquil:
	setevent EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	end

MrPokemonsHouse_ForeignMagazines:
	jumptext MrPokemonsHouse_ForeignMagazinesText

MrPokemonsHouse_BrokenComputer:
	jumptext MrPokemonsHouse_BrokenComputerText

MrPokemonsHouse_StrangeCoins:
	jumptext MrPokemonsHouse_StrangeCoinsText

MrPokemonsHouse_PlayerWalksToMrPokemon:
	step RIGHT
	step UP
	step_end

MrPokemonsHouse_OakWalksToPlayer:
	step DOWN
	step LEFT
	step LEFT
	step_end

MrPokemonsHouse_OakExits:
	step DOWN
	step LEFT
	turn_head DOWN
	step_sleep 2
	step_end

MrPokemonIntroText1:
	text "Xin chào! Cháu"
	line "là <PLAY_G> đúng"
	cont "không?"

	para "GS ELM nói cháu"
	line "sẽ đến đây."
	done

MrPokemonIntroText2:
	text "Đây là thứ tôi"
	line "muốn GS ELM"
	cont "nghiên cứu."
	done

MrPokemonsHouse_GotEggText:
	text "<PLAYER> nhận được"
	line "TRỨNG BÍ ẨN."
	done

MrPokemonIntroText3:
	text "Tôi biết một cặp"
	line "vợ chồng có dịch"
	cont "vụ giữ #MON."

	para "Họ đã đưa tôi"
	line "quả TRỨNG này."

	para "Tôi tò mò nên gửi"
	line "thư cho GS ELM."

	para "Về tiến hóa #-"
	line "MON thì GS ELM"
	cont "là chuyên gia."
	done

MrPokemonIntroText4:
	text "Ngay cả GS OAK"
	line "cũng công nhận."
	done

MrPokemonIntroText5:
	text "Nếu giả thuyết"
	line "của tôi đúng,"
	cont "GS ELM sẽ biết."
	done

MrPokemonsHouse_MrPokemonHealText:
	text "Cháu về chỗ"
	line "GS ELM à?"

	para "Đây. #MON của"
	line "cháu nên nghỉ"
	cont "ngơi một chút."
	done

MrPokemonText_ImDependingOnYou:
	text "Tôi trông cậy vào"
	line "cháu đấy!"
	done

MrPokemonText_AlwaysNewDiscoveries:
	text "Cuộc sống thật"
	line "tuyệt vời! Luôn"

	para "có những khám phá"
	line "mới!"
	done

MrPokemonsHouse_OakText1:
	text "OAK: A ha! Vậy"
	line "cháu là <PLAY_G>!"

	para "Ta là OAK! Nhà"
	line "nghiên cứu #MON"

	para "Ta vừa đến thăm"
	line "bạn cũ của ta,"
	cont "ÔNG #MON."

	para "Ta nghe cháu đang"
	line "đi việc cho GS"

	para "ELM, nên ta đợi"
	line "ở đây."

	para "Ồ! Cái gì đây?"
	line "Một #MON hiếm!"

	para "Để xem nào…"

	para "Hm, ta hiểu rồi!"

	para "Ta hiểu tại sao"
	line "GS ELM cho cháu"

	para "một #MON để đi"
	line "việc này."

	para "Với các nhà"
	line "nghiên cứu như"

	para "GS ELM và ta,"
	line "#MON là bạn bè."

	para "Ông ấy thấy cháu"
	line "sẽ đối xử với"

	para "#MON bằng tình"
	line "yêu và sự chăm"
	cont "sóc."

	para "…À!"

	para "Cháu có vẻ đáng"
	line "tin cậy."

	para "Cháu có muốn giúp"
	line "ta một việc không?"

	para "Đây là phiên bản"
	line "mới nhất của"
	cont "#DEX."

	para "Nó tự động ghi"
	line "lại dữ liệu về"

	para "#MON cháu đã"
	line "thấy hoặc bắt."

	para "Đây là bộ bách"
	line "khoa toàn thư"
	cont "về #MON!"
	done

MrPokemonsHouse_GetDexText:
	text "<PLAYER> nhận được"
	line "#DEX!"
	done

MrPokemonsHouse_OakText2:
	text "Hãy gặp nhiều loại"
	line "#MON và hoàn"

	para "thành #DEX đó!"

	para "Nhưng ta ở đây"
	line "hơi lâu rồi."

	para "Ta phải đến"
	line "KOGANE để làm"
	cont "chương trình đài."

	para "<PLAY_G>, ta tin"
	line "tưởng cháu!"
	done

MrPokemonText_GimmeTheScale:
	text "Hm? cái VẢY đó!"
	line "Cái gì vậy?"
	cont "GYARADOS ĐỎ?"

	para "Hiếm thật! Tôi,"
	line "tôi muốn nó…"

	para "<PLAY_G>, cháu có"
	line "muốn đổi không?"

	para "Tôi có thể đổi"
	line "CHIA SẺ K.N này"
	cont "từ GS OAK."
	done

MrPokemonText_Disappointed:
	text "Thật đáng tiếc."
	line "Cái đó rất hiếm"
	cont "đấy."
	done

MrPokemonsHouse_ForeignMagazinesText:
	text "Đầy ắp tạp chí"
	line "nước ngoài."

	para "Đọc không hiểu"
	line "tiêu đề luôn…"
	done

MrPokemonsHouse_BrokenComputerText:
	text "Một máy tính lớn."
	line "Hm. Nó bị hỏng"
	cont "rồi."
	done

MrPokemonsHouse_StrangeCoinsText:
	text "Một đống tiền xu"
	line "lạ lùng!"

	para "Có lẽ chúng từ"
	line "nước khác…"
	done

MrPokemonsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_30, 2
	warp_event  3,  7, ROUTE_30, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  1,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  6,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  7,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  6,  4, BGEVENT_READ, MrPokemonsHouse_StrangeCoins

	def_object_events
	object_event  3,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrPokemonsHouse_MrPokemonScript, -1
	object_event  6,  5, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MR_POKEMONS_HOUSE_OAK
