	object_const_def
	const AZALEAPOKECENTER1F_NURSE
	const AZALEAPOKECENTER1F_GENTLEMAN
	const AZALEAPOKECENTER1F_FISHING_GURU
	const AZALEAPOKECENTER1F_POKEFAN_F

AzaleaPokecenter1F_MapScripts:
	def_scene_scripts
	scene_script AzaleaPokecenter1FNoopScene ; unusable

	def_callbacks

AzaleaPokecenter1FNoopScene:
	end

AzaleaPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

AzaleaPokecenter1FGentlemanScript:
	jumptextfaceplayer AzaleaPokecenter1FGentlemanText

AzaleaPokecenter1FFishingGuruScript:
	jumptextfaceplayer AzaleaPokecenter1FFishingGuruText

AzaleaPokecenter1FPokefanFScript:
	jumptextfaceplayer AzaleaPokecenter1FPokefanFText

AzaleaPokecenter1FGentlemanText:
	text "#MON của bạn"
	line "có biết chiêu HM"
	cont "không?"

	para "Những chiêu đó"
	line "dùng được ngay cả"

	para "khi #MON của"
	line "bạn bất tỉnh."
	done

AzaleaPokecenter1FUnusedText: ; unreferenced
	text "Anh BILL này đã"
	line "tạo ra hệ thống"

	para "lưu trữ #MON"
	line "trong PC."

	para "PC của BILL có"
	line "thể lưu đến 20"
	cont "#MON mỗi HỘP."
	done

AzaleaPokecenter1FFishingGuruText:
	text "PC của BILL có"
	line "thể lưu đến 20"
	cont "#MON mỗi HỘP."
	done

AzaleaPokecenter1FPokefanFText:
	text "Bạn biết về"
	line "MƠ không?"

	para "Bổ ra, khoét rỗng"
	line "và lắp thiết bị"
	cont "đặc biệt vào."

	para "Rồi dùng nó để"
	line "bắt #MON."

	para "Trước khi phát"
	line "minh BÓNG #,"

	para "mọi người đều"
	line "dùng MƠ."
	done

AzaleaPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, AZALEA_TOWN, 1
	warp_event  4,  7, AZALEA_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FNurseScript, -1
	object_event  9,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FGentlemanScript, -1
	object_event  6,  1, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FFishingGuruScript, -1
	object_event  1,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FPokefanFScript, -1
