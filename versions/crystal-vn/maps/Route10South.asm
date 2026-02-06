	object_const_def
	const ROUTE10SOUTH_POKEFAN_M1
	const ROUTE10SOUTH_POKEFAN_M2

Route10South_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerHikerJim:
	trainer HIKER, JIM, EVENT_BEAT_HIKER_JIM, HikerJimSeenText, HikerJimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerJimAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmRobert:
	trainer POKEFANM, ROBERT, EVENT_BEAT_POKEFANM_ROBERT, PokefanmRobertSeenText, PokefanmRobertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmRobertAfterBattleText
	waitbutton
	closetext
	end

Route10Sign:
	jumptext Route10SignText

HikerJimSeenText:
	text "Hahahah!"
	done

HikerJimBeatenText:
	text "Hahaha-hắt hơi!"
	done

HikerJimAfterBattleText:
	text "Sốt cỏ khô khiến"
	line "tôi hắt hơi!"
	cont "Ahahah-HẮT!"
	done

PokefanmRobertSeenText:
	text "Bạn cũng thích"
	line "#MON, phải hôn?"

	para "Tôi cũng thế!"
	done

PokefanmRobertBeatenText:
	text "Đó là thất bại"
	line "của tôi."
	done

PokefanmRobertAfterBattleText:
	text "Nhìn điều bạn vừa"
	line "làm #MON tôi…"

	para "Tôi sẽ không bao"
	line "giờ quên chuyện"
	cont "này…"
	done

Route10SignText:
	text "TUYẾN ĐƯỜNG 10"

	para "TP. CERULEAN -"
	line "THỊ TRẤN LAVENDER"
	done

Route10South_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  1, ROCK_TUNNEL_1F, 2

	def_coord_events

	def_bg_events
	bg_event  5,  3, BGEVENT_READ, Route10Sign

	def_object_events
	object_event 17,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerJim, -1
	object_event  8, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmRobert, -1
