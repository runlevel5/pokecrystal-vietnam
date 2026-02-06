	object_const_def
	const SOULHOUSE_MRFUJI
	const SOULHOUSE_TEACHER
	const SOULHOUSE_LASS
	const SOULHOUSE_GRANNY

SoulHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MrFuji:
	jumptextfaceplayer MrFujiText

SoulHouseTeacherScript:
	jumptextfaceplayer SoulHouseTeacherText

SoulHouseLassScript:
	jumptextfaceplayer SoulHouseLassText

SoulHouseGrannyScript:
	jumptextfaceplayer SoulHouseGrannyText

MrFujiText:
	text "MR.FUJI: Chào bạn"

	para "Hmm… Có vẻ bạn"
	line "nuôi #MON của"

	para "mình rất tốt và"
	line "yêu thương."

	para "Những người yêu"
	line "#MON đến đây"

	para "để tưởng niệm các"
	line "#MON đã mất."

	para "Hãy chia buồn cho"
	line "linh hồn các"

	para "#MON đã ra đi."

	para "Chắc điều đó sẽ"
	line "làm chúng vui."
	done

SoulHouseTeacherText:
	text "Có những mộ phần"
	line "#MON khác ở đây"
	cont "nữa."

	para "Có nhiều phòng mà"
	line "chỉ MR.FUJI mới"
	cont "được vào."
	done

SoulHouseLassText:
	text "Con đến với mẹ để"
	line "viếng mộ #MON…"
	done

SoulHouseGrannyText:
	text "#MON từng sống"
	line "với tôi…"

	para "Tôi yêu chúng như"
	line "cháu của mình…"
	done

SoulHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, LAVENDER_TOWN, 6
	warp_event  5,  7, LAVENDER_TOWN, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFuji, -1
	object_event  7,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseTeacherScript, -1
	object_event  2,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseLassScript, -1
	object_event  1,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseGrannyScript, -1
