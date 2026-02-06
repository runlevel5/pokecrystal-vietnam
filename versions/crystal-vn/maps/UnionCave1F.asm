	object_const_def
	const UNIONCAVE1F_POKEFAN_M1
	const UNIONCAVE1F_SUPER_NERD
	const UNIONCAVE1F_POKEFAN_M2
	const UNIONCAVE1F_FISHER1
	const UNIONCAVE1F_FISHER2
	const UNIONCAVE1F_POKE_BALL1
	const UNIONCAVE1F_POKE_BALL2
	const UNIONCAVE1F_POKE_BALL3
	const UNIONCAVE1F_POKE_BALL4

UnionCave1F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerPokemaniacLarry:
	trainer POKEMANIAC, LARRY, EVENT_BEAT_POKEMANIAC_LARRY, PokemaniacLarrySeenText, PokemaniacLarryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacLarryAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerRussell:
	trainer HIKER, RUSSELL, EVENT_BEAT_HIKER_RUSSELL, HikerRussellSeenText, HikerRussellBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerRussellAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerDaniel:
	trainer HIKER, DANIEL, EVENT_BEAT_HIKER_DANIEL, HikerDanielSeenText, HikerDanielBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerDanielAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherBill:
	trainer FIREBREATHER, BILL, EVENT_BEAT_FIREBREATHER_BILL, FirebreatherBillSeenText, FirebreatherBillBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBillAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherRay:
	trainer FIREBREATHER, RAY, EVENT_BEAT_FIREBREATHER_RAY, FirebreatherRaySeenText, FirebreatherRayBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherRayAfterBattleText
	waitbutton
	closetext
	end

UnionCave1FGreatBall:
	itemball GREAT_BALL

UnionCave1FXAttack:
	itemball X_ATTACK

UnionCave1FPotion:
	itemball POTION

UnionCave1FAwakening:
	itemball AWAKENING

UnionCave1FUnusedSign: ; unreferenced
	jumptext UnionCave1FUnusedSignText

HikerRussellSeenText:
	text "Bạn đi AZALEA à?"

	para "#MON của tôi sẽ"
	line "kiểm tra xem bạn"
	cont "mạnh không!"
	done

HikerRussellBeatenText:
	text "Ôi, ôi, ôi!"
	done

HikerRussellAfterBattleText:
	text "Được rồi!"
	line "Tôi đã quyết định"

	para "Tôi sẽ không rời"
	line "đây cho đến khi"
	cont "#MON mạnh hơn!"
	done

PokemaniacLarrySeenText:
	text "Tôi đi khắp nơi"
	line "để tìm #MON."

	para "Bạn cũng đang"
	line "tìm #MON à?"

	para "Vậy thì bạn là"
	line "đối thủ của tôi!"
	done

PokemaniacLarryBeatenText:
	text "Uh. #MON"
	line "tội nghiệp của tôi"
	done

PokemaniacLarryAfterBattleText:
	text "Mỗi thứ Sáu, bạn"
	line "có thể nghe tiếng"

	para "#MON gầm từ sâu"
	line "trong hang động."
	done

HikerDanielSeenText:
	text "Ồ! Bất ngờ quá!"

	para "Tôi không ngờ có"
	line "ai ở đây!"
	done

HikerDanielBeatenText:
	text "Ồ! Tôi thua nặng!"
	done

HikerDanielAfterBattleText:
	text "Tôi bị lừa mua"
	line "ĐUÔI SLOWPOKE."

	para "Tôi thấy thương"
	line "cho #MON tội"
	cont "nghiệp đó."
	done

FirebreatherBillSeenText:
	text "SIÊU ÂM của"
	line "ZUBAT cứ làm #-"
	cont "MON tôi bối rối."

	para "Tôi rất bực mình"
	line "về chuyện đó!"
	done

FirebreatherBillBeatenText:
	text "Tôi tắt ngúm rồi!"
	done

FirebreatherBillAfterBattleText:
	text "Cuối tuần, bạn có"
	line "thể nghe tiếng gầm"

	para "lạ từ sâu trong"
	line "hang động."
	done

FirebreatherRaySeenText:
	text "Nếu có ánh sáng,"
	line "hang động không"
	cont "đáng sợ."

	para "Nếu bạn mạnh,"
	line "#MON cũng không"
	cont "đáng sợ."
	done

FirebreatherRayBeatenText:
	text "LOÁNG!"
	done

FirebreatherRayAfterBattleText:
	text "Lửa #MON tôi"
	line "chiếu sáng hang"
	cont "động này."
	done

UnionCave1FUnusedSignText:
	text "ĐỘNG UNION"
	done

UnionCave1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 19, UNION_CAVE_B1F, 3
	warp_event  3, 33, UNION_CAVE_B1F, 4
	warp_event 17, 31, ROUTE_33, 1
	warp_event 17,  3, ROUTE_32, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerDaniel, -1
	object_event  4, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacLarry, -1
	object_event 11,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerHikerRussell, -1
	object_event 15, 27, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerFirebreatherRay, -1
	object_event 14, 19, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerFirebreatherBill, -1
	object_event 17, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FGreatBall, EVENT_UNION_CAVE_1F_GREAT_BALL
	object_event  4,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FXAttack, EVENT_UNION_CAVE_1F_X_ATTACK
	object_event  4, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FPotion, EVENT_UNION_CAVE_1F_POTION
	object_event 12, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FAwakening, EVENT_UNION_CAVE_1F_AWAKENING
