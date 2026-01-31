	object_const_def
	const VIOLETPOKECENTER1F_NURSE
	const VIOLETPOKECENTER1F_GAMEBOY_KID
	const VIOLETPOKECENTER1F_GENTLEMAN
	const VIOLETPOKECENTER1F_YOUNGSTER
	const VIOLETPOKECENTER1F_ELMS_AIDE

VioletPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

VioletPokecenterNurse:
	jumpstd PokecenterNurseScript

VioletPokecenter1F_ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	iftrue .SecondTimeAsking
	writetext VioletPokecenterElmsAideFavorText
.AskTakeEgg:
	yesorno
	iffalse .RefusedEgg
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	giveegg TOGEPI, EGG_LEVEL
	getstring STRING_BUFFER_4, .eggname
	scall .AideGivesEgg
	setevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	clearevent EVENT_ELMS_AIDE_IN_LAB
	clearevent EVENT_TOGEPI_HATCHED
	setmapscene ROUTE_32, SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	writetext VioletPokecenterElmsAideGiveEggText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal UP, .AideWalksAroundPlayer
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideWalksStraightOutOfPokecenter
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_ELMS_AIDE
	waitsfx
	end

.AideWalksAroundPlayer:
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideWalksLeftToExitPokecenter
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideFinishesLeavingPokecenter
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_ELMS_AIDE
	waitsfx
	end

.eggname
	db "TRỨNG@"

.AideGivesEgg:
	jumpstd ReceiveTogepiEggScript
	end

.PartyFull:
	writetext VioletCityElmsAideFullPartyText
	waitbutton
	closetext
	end

.RefusedEgg:
	writetext VioletPokecenterElmsAideRefuseText
	waitbutton
	closetext
	setevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	end

.SecondTimeAsking:
	writetext VioletPokecenterElmsAideAskEggText
	sjump .AskTakeEgg

VioletPokecenter1FGameboyKidScript:
	jumptextfaceplayer VioletPokecenter1FGameboyKidText

VioletPokecenter1FGentlemanScript:
	jumptextfaceplayer VioletPokecenter1FGentlemanText

VioletPokecenter1FYoungsterScript:
	jumptextfaceplayer VioletPokecenter1FYoungsterText

MovementData_AideWalksStraightOutOfPokecenter:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_AideWalksLeftToExitPokecenter:
	step LEFT
	step DOWN
	step_end

MovementData_AideFinishesLeavingPokecenter:
	step DOWN
	step DOWN
	step DOWN
	step_end

VioletPokecenterElmsAideFavorText:
	text "<PLAY_G>, lâu rồi"
	line "không gặp."

	para "GS ELM nhờ tôi"
	line "tìm bạn."

	para "Ông ấy có việc"
	line "muốn nhờ."

	para "Nhận TRỨNG #MON"
	line "được không?"
	done

VioletPokecenterElmsAideGiveEggText:
	text "Chúng tôi phát"
	line "hiện #MON không"

	para "nở cho đến khi"
	line "lớn trong TRỨNG."

	para "Nó cũng cần ở"
	line "cùng #MON khác"
	cont "đang hoạt động."

	para "<PLAY_G>, bạn là"
	line "người duy nhất"
	cont "chúng tôi tin."

	para "Hãy gọi GS ELM"
	line "khi TRỨNG nở nhé!"
	done

VioletCityElmsAideFullPartyText:
	text "Ồ không. Bạn không"
	line "mang thêm #MON"
	cont "được nữa."

	para "Tôi sẽ đợi ở đây"
	line "trong khi bạn sắp"
	cont "chỗ cho TRỨNG."
	done

VioletPokecenterElmsAideRefuseText:
	text "N-nhưng… GS ELM"
	line "đã nhờ bạn mà…"
	done

VioletPokecenterElmsAideAskEggText:
	text "<PLAY_G>, bạn nhận"
	line "TRỨNG chứ?"
	done

VioletPokecenterFarawayLinkText: ; unreferenced
	text "Tôi đang nghĩ"
	line "sẽ hay nếu có thể"

	para "kết nối và đấu với"
	line "bạn bè ở xa."
	done

VioletPokecenterMobileAdapterText: ; unreferenced
	text "Tôi vừa đấu với"
	line "bạn ở CIANWOOD"
	cont "qua kết nối."

	para "Nếu bạn nối"
	line "MOBILE ADAPTER,"

	para "bạn có thể kết"
	line "nối với bạn xa."
	done

VioletPokecenter1FGameboyKidText:
	text "Một người tên"
	line "BILL đã tạo hệ"

	para "thống lưu trữ"
	line "PC cho #MON."
	done

VioletPokecenter1FGentlemanText:
	text "Khoảng ba năm"
	line "trước."

	para "TEAM ROCKET làm"
	line "chuyện xấu với"
	cont "#MON."

	para "Nhưng công lý"
	line "chiến thắng--một"

	para "cậu bé đã phá tan"
	line "bọn chúng."
	done

VioletPokecenter1FYoungsterText:
	text "#MON thông minh"
	line "Chúng không nghe"

	para "HLV mà chúng"
	line "không tôn trọng."

	para "Không có HUY"
	line "HIỆU GYM phù hợp,"

	para "chúng sẽ làm theo"
	line "ý mình."
	done

VioletPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, VIOLET_CITY, 5
	warp_event  4,  7, VIOLET_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenterNurse, -1
	object_event  7,  6, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FGentlemanScript, -1
	object_event  8,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FYoungsterScript, -1
	object_event  4,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1F_ElmsAideScript, EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
