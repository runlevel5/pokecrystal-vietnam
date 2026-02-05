	object_const_def
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_CAPTAIN
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_M1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN3
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN4
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_SUPER_NERD1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_M2
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_F
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_SUPER_NERD2

FastShipCabins_SE_SSE_CaptainsCabin_MapScripts:
	def_scene_scripts

	def_callbacks

FastShipCabins_SE_SSE_CaptainsCabinNoopScene: ; unreferenced
	end

SSAquaCaptain:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .LaterTrip
	writetext SSAquaCaptainExhaustingText
	waitbutton
	closetext
	end

.LaterTrip:
	writetext SSAquaCaptainHowDoYouLikeText
	waitbutton
	closetext
	end

SSAquaGranddaughterBefore:
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2, RIGHT
	opentext
	writetext SSAquaGranddaughterCaptainPlayWithMeText
	waitbutton
	closetext
	faceplayer
	opentext
	writetext SSAquaGranddaughterHasToFindGrandpaText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2
	applymovement PLAYER, SSAquaCaptainsCabinWarpsToGrandpasCabinMovement
	moveobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, 3, 19
	appear FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1
	turnobject PLAYER, UP
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, UP
	special FadeInFromBlack
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, DOWN
	showemote EMOTE_SHOCK, FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, 15
	applymovement FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, SSAquaGranddaughterEntersCabinMovement
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, RIGHT
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .PlayerIsFemale
	opentext
	writetext SSAquaGranddaughterWasPlayingMText
	waitbutton
	closetext
	sjump .cont

.PlayerIsFemale:
	opentext
	writetext SSAquaGranddaughterWasPlayingFText
	waitbutton
	closetext
.cont:
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2, DOWN
	applymovement FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, SSAquaGrandpaApproachesPlayerMovement
	opentext
	writetext SSAquaEntertainedGranddaughterText
	promptbutton
	setevent EVENT_VERMILION_PORT_SAILOR_AT_GANGWAY
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_NOOP
	sjump SSAquaMetalCoatAndDocking

SSAquaGrandpa:
	faceplayer
	opentext
	checkevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
	iftrue SSAquaGotMetalCoat
	checkevent EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	iftrue SSAquaFoundGranddaughter
	writetext SSAquaCantFindGranddaughterText
	waitbutton
	closetext
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_NOOP
	end

SSAquaMetalCoatAndDocking:
	writetext SSAquaGrandpaHaveThisText
	promptbutton
	verbosegiveitem METAL_COAT
	iffalse .NoRoom
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
.NoRoom:
	closetext
	waitsfx
	playsound SFX_ELEVATOR_END
	pause 30
	opentext
	writetext SSAquaHasArrivedVermilionText
	waitbutton
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	setevent EVENT_FAST_SHIP_FOUND_GIRL
	closetext
	end

SSAquaFoundGranddaughter:
	writetext SSAquaGrandpaHaveThisText
	promptbutton
	verbosegiveitem METAL_COAT
	iffalse .NoRoom
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
.NoRoom:
	closetext
	end

SSAquaGotMetalCoat:
	writetext SSAquaGrandpaTravellingText
	waitbutton
	closetext
	end

SSAquaGranddaughterAfter:
	faceplayer
	opentext
	writetext SSAquaGranddaughterHadFunText
	waitbutton
	closetext
	end

TrainerPokefanmColin:
	trainer POKEFANM, COLIN, EVENT_BEAT_POKEFANM_COLIN, PokefanmColinSeenText, PokefanmColinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmColinAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsMegandpeg1:
	trainer TWINS, MEGANDPEG1, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg1SeenText, TwinsMegandpeg1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsMegandpeg1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsMegandpeg2:
	trainer TWINS, MEGANDPEG2, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg2SeenText, TwinsMegandpeg2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsMegandpeg2AfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicRodney:
	trainer PSYCHIC_T, RODNEY, EVENT_BEAT_PSYCHIC_RODNEY, PsychicRodneySeenText, PsychicRodneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicRodneyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmJeremy:
	trainer POKEFANM, JEREMY, EVENT_BEAT_POKEFANM_JEREMY, PokefanmJeremySeenText, PokefanmJeremyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmJeremyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfGeorgia:
	trainer POKEFANF, GEORGIA, EVENT_BEAT_POKEFANF_GEORGIA, PokefanfGeorgiaSeenText, PokefanfGeorgiaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfGeorgiaAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdShawn:
	trainer SUPER_NERD, SHAWN, EVENT_BEAT_SUPER_NERD_SHAWN, SupernerdShawnSeenText, SupernerdShawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdShawnAfterBattleText
	waitbutton
	closetext
	end

FastShipCaptainsCabinTrashcan:
	jumpstd TrashCanScript

SSAquaCaptainsCabinWarpsToGrandpasCabinMovement:
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

SSAquaGranddaughterEntersCabinMovement:
	step UP
	step UP
	turn_head LEFT
	step_end

SSAquaGrandpaApproachesPlayerMovement:
	step DOWN
	step_end

SSAquaCaptainExhaustingText:
	text "Phù! Cảm ơn đã"
	line "đến cùng."

	para "Giữ cho bé gái"
	line "đó vui thật mệt."
	done

SSAquaCaptainHowDoYouLikeText:
	text "Bạn thấy chuyến"
	line "đi trên S.S.AQUA"
	cont "thế nào?"

	para "Nó gần như trượt"
	line "trên mặt sóng."
	done

SSAquaCantFindGranddaughterText:
	text "Ồ, xin chào…"

	para "Tôi vẫn chưa tìm"
	line "thấy cháu gái."

	para "Nếu nó ở trên"
	line "tàu, thì ổn."

	para "Nó là đứa trẻ"
	line "năng động, nên có"

	para "thể đang làm phiền"
	line "ai đó. Tôi lo…"
	done

SSAquaEntertainedGranddaughterText:
	text "<PLAY_G>, phải"
	line "không? Tôi nghe"
	cont "bạn đã chơi với"
	cont "cháu gái tôi."

	para "Tôi muốn cảm ơn"
	line "bạn vì điều đó."
	done

SSAquaGrandpaHaveThisText:
	text "Tôi biết! Tôi"
	line "muốn tặng bạn cái"
	cont "này!"
	done

SSAquaGrandpaTravellingText:
	text "Chúng tôi đang đi"
	line "du lịch vòng quanh"
	cont "thế giới."
	done

SSAquaGranddaughterCaptainPlayWithMeText:
	text "THUYỀN TRƯỞNG,"
	line "chơi với cháu đi?"

	para "Cháu chán! Cháu"
	line "muốn chơi nữa!"
	done

SSAquaGranddaughterHasToFindGrandpaText:
	text "Chào! Bạn chơi"
	line "với mình không?"

	para "…Ồ!"

	para "Ông đang lo lắng"
	line "về mình?"

	para "Mình phải đi!"

	para "Mình phải đi tìm"
	line "Ông!"
	done

SSAquaGranddaughterWasPlayingMText:
	text "Ông ơi, cháu đây!"
	line "Cháu đang chơi"

	para "với THUYỀN TRƯỞNG"
	line "và anh này!"
	done

SSAquaGranddaughterWasPlayingFText:
	text "Ông ơi, cháu đây!"
	line "Cháu đang chơi"

	para "với THUYỀN TRƯỞNG"
	line "và chị này!"
	done

SSAquaGranddaughterHadFunText:
	text "Cháu chơi rất vui!"
	done

PokefanmColinSeenText:
	text "Này, bạn! Muốn"
	line "đấu với tôi không?"
	done

PokefanmColinBeatenText:
	text "Bạn mạnh!"
	done

PokefanmColinAfterBattleText:
	text "Bạn đi du lịch"
	line "một mình?"

	para "Mẹ bạn không lo"
	line "sao?"
	done

TwinsMegandpeg1SeenText:
	text "Bạn nghĩ tôi là"
	line "em bé?"
	cont "Không công bằng!"
	done

TwinsMegandpeg1BeatenText:
	text "Ồ! Chúng tôi thua!"
	done

TwinsMegandpeg1AfterBattleText:
	text "Em bé là cách gọi"
	line "thô lỗ đối với"
	cont "các cô gái!"
	done

TwinsMegandpeg2SeenText:
	text "Tôi không phải em"
	line "bé!"

	para "Không được nói"
	line "vậy với phụ nữ!"
	done

TwinsMegandpeg2BeatenText:
	text "Ồ! Chúng tôi thua!"
	done

TwinsMegandpeg2AfterBattleText:
	text "Đôi khi, trẻ con"
	line "thông minh hơn"
	cont "người lớn!"
	done

PsychicRodneySeenText:
	text "Shhh! Đầu tôi đang"
	line "nhận tín hiệu"
	cont "radio!"
	done

PsychicRodneyBeatenText:
	text "…Tôi nghe thấy"
	line "gì đó!"
	done

PsychicRodneyAfterBattleText:
	text "Hiểu rồi. Bạn có"
	line "thể nghe radio"
	cont "JOHTO trên TÀU"
	cont "NHANH."
	done

PokefanmJeremySeenText:
	text "Bạn nghĩ sao?"
	line "#MON của tôi"
	cont "đẹp phải không?"
	done

PokefanmJeremyBeatenText:
	text "Ôi không! #MON"
	line "xinh của tôi!"
	done

PokefanmJeremyAfterBattleText:
	text "Tôi phải đến"
	line "TIỆM #MON và"
	cont "làm đẹp cho"
	cont "chúng!"
	done

PokefanfGeorgiaSeenText:
	text "Tôi sẽ mua sắm ở"
	line "CỬA HÀNG và"
	cont "sau đó…"
	done

PokefanfGeorgiaBeatenText:
	text "Tôi định làm gì"
	line "nhỉ?"
	done

PokefanfGeorgiaAfterBattleText:
	text "Ồ, phải rồi! Tôi"
	line "phải lấy #MON"
	cont "khỏi NHÀ TRỌ!"
	done

SupernerdShawnSeenText:
	text "Bạn mang theo loại"
	line "BÓNG # nào?"
	done

SupernerdShawnBeatenText:
	text "Chờ! Dừng! Đừng!"
	line "Làm ơn!"
	done

SupernerdShawnAfterBattleText:
	text "Bạn nên dùng BALL"
	line "phù hợp với tình"
	cont "huống."
	done

SSAquaHasArrivedVermilionText:
	text "TÀU AQUA"
	line "S.S.AQUA đã tới"
	cont "TP. VERMILION."
	done

FastShipCabins_SE_SSE_CaptainsCabin_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, FAST_SHIP_1F, 8
	warp_event  3,  7, FAST_SHIP_1F, 8
	warp_event  2, 19, FAST_SHIP_1F, 9
	warp_event  3, 19, FAST_SHIP_1F, 9
	warp_event  2, 33, FAST_SHIP_1F, 10
	warp_event  3, 33, FAST_SHIP_1F, 10

	def_coord_events

	def_bg_events
	bg_event  4, 25, BGEVENT_READ, FastShipCaptainsCabinTrashcan

	def_object_events
	object_event  3, 25, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SSAquaCaptain, -1
	object_event  2, 17, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SSAquaGrandpa, EVENT_FAST_SHIP_CABINS_SE_SSE_GENTLEMAN
	object_event  3, 17, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAquaGranddaughterAfter, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_1
	object_event  2, 25, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAquaGranddaughterBefore, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	object_event  5,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerPokefanmColin, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  2,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsMegandpeg1, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  3,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsMegandpeg2, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  5,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerPsychicRodney, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmJeremy, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  5,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerPokefanfGeorgia, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  1, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerSupernerdShawn, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
