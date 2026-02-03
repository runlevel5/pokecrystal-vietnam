	object_const_def
	const CIANWOODPOKECENTER1F_NURSE
	const CIANWOODPOKECENTER1F_LASS
	const CIANWOODPOKECENTER1F_GYM_GUIDE
	const CIANWOODPOKECENTER1F_SUPER_NERD

CianwoodPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

CianwoodPokecenter1FLassScript:
	jumptextfaceplayer CianwoodPokecenter1FLassText

CianwoodGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_CHUCK
	iftrue .CianwoodGymGuideWinScript
	opentext
	writetext CianwoodGymGuideText
	waitbutton
	closetext
	end

.CianwoodGymGuideWinScript:
	opentext
	writetext CianwoodGymGuideWinText
	waitbutton
	closetext
	end

CianwoodPokecenter1FSuperNerdScript:
	jumptextfaceplayer CianwoodPokecenter1FSuperNerdText

CianwoodPokecenter1FLassText:
	text "Bạn gặp người"
	line "#MANIAC chưa?"

	para "Anh ta luôn khoe"
	line "khoang về #MON"
	cont "hiếm của mình."
	done

CianwoodGymGuideText:
	text "Các HLV tại GYM"
	line "#MON này đều là"
	cont "kẻ bắt nạt."

	para "Nếu tôi ở quanh"
	line "đây, chúng có thể"
	cont "đuổi theo tôi."

	para "Đây là lời khuyên:"
	line "T.LĨNH GYM dùng"
	cont "hệ võ thuật."

	para "Nên bạn hãy khiến"
	line "anh ta bối rối với"
	cont "#MON hệ TL."

	para "Quét sạch #MON"
	line "anh ta trước khi"

	para "chúng dùng sức"
	line "mạnh vật lý."

	para "Còn những tảng đá"
	line "ở giữa GYM?"

	para "Nếu bạn không di"
	line "chuyển đúng cách,"

	para "bạn sẽ không thể"
	line "đến được T.LĨNH."

	para "Nếu bị kẹt, hãy"
	line "ra ngoài."
	done

CianwoodGymGuideWinText:
	text "<PLAYER> thắng!"
	line "Nhìn là biết ngay!"
	done

CianwoodPokecenter1FUnusedText1: ; unreferenced
	text "Bạn có cảm giác"
	line "muốn khoe #MON"
	cont "với bạn bè không?"

	para "Tôi ước mình có"
	line "thể khoe #MON"

	para "tôi nuôi cho bạn"
	line "tôi ở VIOLET."
	done

CianwoodPokecenter1FUnusedText2: ; unreferenced
	text "Tôi đang đấu với"
	line "bạn tôi ở VIOLET"

	para "dùng kết nối"
	line "MOBILE ADAPTER."

	para "Tôi thua 5-7. Tôi"
	line "phải cố gắng hơn!"
	done

CianwoodPokecenter1FSuperNerdText:
	text "Tôi thích khoe"
	line "#MON tôi đã"
	cont "nuôi dưỡng."

	para "Bạn cũng vậy"
	line "không?"

	para "Tôi sẽ tham gia"
	line "nhiều trận đấu"

	para "để khoe #MON"
	line "của mình!"
	done

CianwoodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, CIANWOOD_CITY, 3
	warp_event  4,  7, CIANWOOD_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FLassScript, -1
	object_event  5,  3, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodGymGuideScript, -1
	object_event  8,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FSuperNerdScript, -1
