	object_const_def
	const UNIONCAVEB1F_POKEFAN_M1
	const UNIONCAVEB1F_POKEFAN_M2
	const UNIONCAVEB1F_SUPER_NERD1
	const UNIONCAVEB1F_SUPER_NERD2
	const UNIONCAVEB1F_POKE_BALL1
	const UNIONCAVEB1F_BOULDER
	const UNIONCAVEB1F_POKE_BALL2

UnionCaveB1F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerPokemaniacAndrew:
	trainer POKEMANIAC, ANDREW, EVENT_BEAT_POKEMANIAC_ANDREW, PokemaniacAndrewSeenText, PokemaniacAndrewBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacAndrewAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacCalvin:
	trainer POKEMANIAC, CALVIN, EVENT_BEAT_POKEMANIAC_CALVIN, PokemaniacCalvinSeenText, PokemaniacCalvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacCalvinAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerPhillip:
	trainer HIKER, PHILLIP, EVENT_BEAT_HIKER_PHILLIP, HikerPhillipSeenText, HikerPhillipBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerPhillipAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerLeonard:
	trainer HIKER, LEONARD, EVENT_BEAT_HIKER_LEONARD, HikerLeonardSeenText, HikerLeonardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerLeonardAfterBattleText
	waitbutton
	closetext
	end

UnionCaveB1FTMSwift:
	itemball TM_SWIFT

UnionCaveB1FXDefend:
	itemball X_DEFEND

UnionCaveB1FBoulder:
	jumpstd StrengthBoulderScript

HikerPhillipSeenText:
	text "Lâu rồi mới gặp"
	line "người khác."

	para "Đừng ngại."
	line "Đấu đi!"
	done

HikerPhillipBeatenText:
	text "Uurggh…"
	done

HikerPhillipAfterBattleText:
	text "Tôi bị lạc lâu"
	line "rồi…"

	para "Tôi không phiền,"
	line "nhưng tôi đói"
	cont "quáááá!"
	done

HikerLeonardSeenText:
	text "Ồ hay! Có khách!"
	done

HikerLeonardBeatenText:
	text "Wahahah! Bạn khá"
	line "dữ đấy!"
	done

HikerLeonardAfterBattleText:
	text "Tôi sống ở đây."

	para "Bạn cũng có thể"
	line "ở nếu muốn."

	para "Chỗ rộng lắm"
	line "mà."
	done

PokemaniacAndrewSeenText:
	text "Ai đó?"

	para "Để tôi và #MON"
	line "yên!"
	done

PokemaniacAndrewBeatenText:
	text "Đi…"
	line "Đi chỗ khác đi!"
	done

PokemaniacAndrewAfterBattleText:
	text "Chỉ có tôi và"
	line "#MON. Tôi sung"
	cont "sướng điên lên."
	done

PokemaniacCalvinSeenText:
	text "Tôi đến đây để"
	line "nghiên cứu #-"
	cont "MON."

	para "Để tôi trình diễn"
	line "phát hiện trong"
	cont "trận đấu thật!"
	done

PokemaniacCalvinBeatenText:
	text "Bạn trình diễn"
	line "trên tôi rồi!"
	done

PokemaniacCalvinAfterBattleText:
	text "Tôi nên biên soạn"
	line "và công bố kết"
	cont "quả nghiên cứu."

	para "Tôi có thể nổi"
	line "tiếng như GS ELM."
	done

UnionCaveB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  3, RUINS_OF_ALPH_OUTSIDE, 7
	warp_event  3, 11, RUINS_OF_ALPH_OUTSIDE, 8
	warp_event  7, 19, UNION_CAVE_1F, 1
	warp_event  3, 33, UNION_CAVE_1F, 2
	warp_event 17, 31, UNION_CAVE_B2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerPhillip, -1
	object_event 16,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerLeonard, -1
	object_event  5, 32, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacAndrew, -1
	object_event 17, 30, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacCalvin, -1
	object_event  2, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCaveB1FTMSwift, EVENT_UNION_CAVE_B1F_TM_SWIFT
	object_event  7, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, UnionCaveB1FBoulder, -1
	object_event 17, 23, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCaveB1FXDefend, EVENT_UNION_CAVE_B1F_X_DEFEND
