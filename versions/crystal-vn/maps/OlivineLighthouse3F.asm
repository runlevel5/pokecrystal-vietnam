	object_const_def
	const OLIVINELIGHTHOUSE3F_SAILOR
	const OLIVINELIGHTHOUSE3F_GENTLEMAN
	const OLIVINELIGHTHOUSE3F_YOUNGSTER
	const OLIVINELIGHTHOUSE3F_POKE_BALL

OlivineLighthouse3F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBirdKeeperTheo:
	trainer BIRD_KEEPER, THEO, EVENT_BEAT_BIRD_KEEPER_THEO, BirdKeeperTheoSeenText, BirdKeeperTheoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperTheoAfterBattleText
	waitbutton
	closetext
	end

TrainerGentlemanPreston:
	trainer GENTLEMAN, PRESTON, EVENT_BEAT_GENTLEMAN_PRESTON, GentlemanPrestonSeenText, GentlemanPrestonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanPrestonAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorTerrell:
	trainer SAILOR, TERRELL, EVENT_BEAT_SAILOR_TERRELL, SailorTerrellSeenText, SailorTerrellBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorTerrellAfterBattleText
	waitbutton
	closetext
	end

OlivineLighthouse3FEther:
	itemball ETHER

BirdKeeperTheoSeenText:
	text "Sao bạn ở đây?"
	line "Chỉ để nhìn thôi"

	para "à? Tôi khuyên bạn"
	line "nên ra về!"
	done

BirdKeeperTheoBeatenText:
	text "Bạn thật sự lo"
	line "lắng…"
	done

BirdKeeperTheoAfterBattleText:
	text "Làm sao để lên"
	line "trên được nhỉ?"

	para "Tôi muốn thăm"
	line "#MON bị ốm,"

	para "nhưng không thể"
	line "lên đó…"
	done

SailorTerrellSeenText:
	text "Thủy thủ vừa tốt"
	line "bụng vừa mạnh mẽ."
	cont "Còn bạn thì sao?"
	done

SailorTerrellBeatenText:
	text "Bạn vừa tốt bụng"
	line "vừa mạnh mẽ…"
	done

SailorTerrellAfterBattleText:
	text "Mỗi lần về đến"
	line "OLIVINE, tôi đều"
	cont "ghé GYM."

	para "Hệ #MON của"
	line "T.LĨNH GYM đã"

	para "thay đổi mà tôi"
	line "không để ý."
	done

GentlemanPrestonSeenText:
	text "Tôi đi khắp thế"
	line "giới để rèn #-"
	cont "MON. Tôi muốn đấu"
	cont "với bạn."
	done

GentlemanPrestonBeatenText:
	text "…thở dài… Tôi phải"
	line "luyện tập thêm…"
	done

GentlemanPrestonAfterBattleText:
	text "JASMINE từng dùng"
	line "#MON SỎI ĐÁ như"
	cont "ONIX."
	done

OlivineLighthouse3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  3, OLIVINE_LIGHTHOUSE_4F, 1
	warp_event  5,  3, OLIVINE_LIGHTHOUSE_2F, 2
	warp_event  9,  5, OLIVINE_LIGHTHOUSE_4F, 4
	warp_event 16, 11, OLIVINE_LIGHTHOUSE_2F, 5
	warp_event 17, 11, OLIVINE_LIGHTHOUSE_2F, 6
	warp_event 16,  9, OLIVINE_LIGHTHOUSE_4F, 5
	warp_event 17,  9, OLIVINE_LIGHTHOUSE_4F, 6
	warp_event  8,  3, OLIVINE_LIGHTHOUSE_4F, 7
	warp_event  9,  3, OLIVINE_LIGHTHOUSE_4F, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSailorTerrell, -1
	object_event 13,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerGentlemanPreston, -1
	object_event  3,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperTheo, -1
	object_event  8,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse3FEther, EVENT_OLIVINE_LIGHTHOUSE_3F_ETHER
