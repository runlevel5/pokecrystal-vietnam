	object_const_def
	const SAFFRONPOKECENTER1F_NURSE
	const SAFFRONPOKECENTER1F_TEACHER
	const SAFFRONPOKECENTER1F_FISHER
	const SAFFRONPOKECENTER1F_YOUNGSTER

SaffronPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

SaffronPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

SaffronPokecenter1FTeacherScript:
	special CheckMobileAdapterStatusSpecial
	iftrue .mobile
	jumptextfaceplayer SaffronPokecenter1FTeacherText

.mobile
	jumptextfaceplayer SaffronPokecenter1FTeacherMobileText

SaffronPokecenter1FFisherScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .SolvedKantoPowerCrisis
	writetext SaffronPokecenter1FFisherText
	waitbutton
	closetext
	end

.SolvedKantoPowerCrisis:
	writetext SaffronPokecenter1FFisherReturnedMachinePartText
	waitbutton
	closetext
	end

SaffronPokecenter1FYoungsterScript:
	jumptextfaceplayer SaffronPokecenter1FYoungsterText

SaffronPokecenter1FTeacherText:
	text "TT #MON ở JOHTO"
	line "như thế nào?"

	para "…Ồ, vậy à. Cũng"
	line "không khác mấy so"

	para "với các TT ở"
	line "KANTO."

	para "Tôi có thể đến"
	line "JOHTO mà không lo"
	cont "lắng gì!"
	done

SaffronPokecenter1FTeacherMobileText:
	text "TT #MON ở JOHTO"
	line "như thế nào?"

	para "…Ồ, vậy à. Vậy"
	line "có thể kết nối"

	para "với người xa ở"
	line "đó sao?"

	para "Vậy tôi sẽ nhờ"
	line "bạn ở JOHTO bắt"

	para "MARILL rồi đổi"
	line "cho tôi!"
	done

SaffronPokecenter1FFisherText:
	text "Tôi vừa đi qua"
	line "ĐƯỜNG HẦM ĐÁ."

	para "Có chuyện gì đó"
	line "đang xảy ra ở NHÀ"
	cont "MÁY ĐIỆN."
	done

SaffronPokecenter1FFisherReturnedMachinePartText:
	text "Hang động dễ sập."

	para "Nhiều hang đã"
	line "biến mất vài năm"

	para "qua, như cái ngoài"
	line "CERULEAN."

	para "Là thợ leo núi"
	line "chuyên nghiệp, tôi"
	cont "biết chuyện đó."
	done

SaffronPokecenter1FYoungsterText:
	text "TRỤ SỞ SILPH CO."
	line "và GA TÀU TỪ"

	para "TRƯỜNG--đó là"
	line "những nơi đáng"

	para "xem ở SAFFRON."
	done

SaffronPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, SAFFRON_CITY, 4
	warp_event  4,  7, SAFFRON_CITY, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FNurseScript, -1
	object_event  7,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FTeacherScript, -1
	object_event  8,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FFisherScript, -1
	object_event  1,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FYoungsterScript, -1
