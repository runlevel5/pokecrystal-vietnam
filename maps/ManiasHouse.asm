	object_const_def
	const MANIASHOUSE_ROCKER

ManiasHouse_MapScripts:
	def_scene_scripts

	def_callbacks

ManiaScript:
	faceplayer
	opentext
	checkevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	iftrue .default_postevent
	checkevent EVENT_GOT_SHUCKIE
	iftrue .alreadyhaveshuckie
	writetext ManiaText_AskLookAfterShuckle
	yesorno
	iffalse .refusetotakeshuckie
	special GiveShuckle
	iffalse .partyfull
	writetext ManiaText_TakeCareOfShuckle
	promptbutton
	waitsfx
	writetext ManiaText_GotShuckle
	playsound SFX_KEY_ITEM
	waitsfx
	closetext
	setevent EVENT_GOT_SHUCKIE
	end

.alreadyhaveshuckie
	checkflag ENGINE_GOT_SHUCKIE_TODAY
	iffalse .returnshuckie
	writetext ManiaText_TakeCareOfShuckle
	waitbutton
	closetext
	end

.partyfull
	writetext ManiaText_PartyFull
	waitbutton
	closetext
	end

.refusetotakeshuckie
	writetext ManiaText_IfHeComesBack
	waitbutton
	closetext
	end

.returnshuckie
	writetext ManiaText_CanIHaveMyMonBack
	yesorno
	iffalse .refused
	special ReturnShuckie
	ifequal SHUCKIE_WRONG_MON, .wrong
	ifequal SHUCKIE_REFUSED, .refused
	ifequal SHUCKIE_HAPPY, .superhappy
; BUG: Mania uses wrong dialogue for trying to return Shuckie with no other Pokémon (see docs/bugs_and_glitches.md)
	ifequal SHUCKIE_FAINTED, .default_postevent
	; SHUCKIE_RETURNED
	writetext ManiaText_ThankYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.wrong
	writetext ManiaText_ShuckleNotThere
	waitbutton
	closetext
	end

.superhappy
	writetext ManiaText_ShuckleLikesYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.refused
	writetext ManiaText_SameAsBeingRobbed
	waitbutton
	closetext
	end

.nothingleft ; unreferenced
	writetext ManiaText_ShuckleIsYourLastMon
	waitbutton
	closetext
	end

.default_postevent
	writetext ManiaText_HappinessSpeech
	waitbutton
	closetext
	end

ManiasHouseUnusedBookshelf: ; unreferenced
	jumpstd PictureBookshelfScript

ManiaText_AskLookAfterShuckle:
	text "T-tôi bị sốc!"

	para "Một anh chàng độ"
	line "tuổi bạn với đôi"

	para "mắt sắc bén và tóc"
	line "dài đã vào đây."

	para "Anh ta dọa tôi"
	line "đưa cho hắn #-"
	cont "MON quý của tôi!"

	para "Tôi vẫn còn một"
	line "con, nhưng nếu"
	cont "hắn quay lại thì…"

	para "Bạn trông mạnh."
	line "Bạn có thể chăm"

	para "sóc #MON của"
	line "tôi chút không?"
	done

ManiaText_TakeCareOfShuckle:
	text "Ồ, cảm ơn bạn!"

	para "Hãy chăm sóc nó"
	line "thật tốt nhé!"
	done

ManiaText_GotShuckle:
	text "<PLAYER> nhận được"
	line "một #MON."
	done

ManiaText_PartyFull:
	text "Đội #MON của"
	line "bạn đã đầy."
	done

ManiaText_IfHeComesBack:
	text "Ồ không… Tôi sẽ"
	line "làm gì nếu hắn"
	cont "quay lại?"
	done

ManiaText_CanIHaveMyMonBack:
	text "Chào! #MON tôi"
	line "thế nào?"

	para "Tôi nghĩ giờ an"
	line "toàn rồi, tôi có"
	cont "thể lấy lại không?"
	done

ManiaText_ThankYou:
	text "Cảm ơn bạn!"
	done

ManiaText_ShuckleNotThere:
	text "Này, bạn không"
	line "có #MON tôi"
	cont "bên mình."
	done

ManiaText_ShuckleLikesYou:
	text "#MON của tôi đã"
	line "thích bạn rồi."

	para "Được rồi, bạn nên"
	line "giữ nó lại."

	para "Nhưng hứa là sẽ"
	line "tốt với nó nhé!"
	done

ManiaText_SameAsBeingRobbed:
	text "Ồ không, không…"
	line "Như vậy không khác"
	cont "gì bị cướp."
	done

ManiaText_HappinessSpeech:
	text "Với #MON, hạnh"
	line "phúc là được ở"

	para "cùng người đối xử"
	line "tốt với chúng."
	done

ManiaText_ShuckleIsYourLastMon:
	text "Nếu tôi lấy lại"
	line "#MON, bạn sẽ"

	para "dùng gì trong"
	line "trận đấu?"
	done

ManiasHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 1
	warp_event  3,  7, CIANWOOD_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ManiaScript, -1
