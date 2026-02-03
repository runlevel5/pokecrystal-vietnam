	object_const_def
	const CINNABARISLAND_BLUE

CinnabarIsland_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CinnabarIslandFlypointCallback

CinnabarIslandFlypointCallback:
	setflag ENGINE_FLYPOINT_CINNABAR
	endcallback

CinnabarIslandBlue:
	faceplayer
	opentext
	writetext CinnabarIslandBlueText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement CINNABARISLAND_BLUE, CinnabarIslandBlueTeleport
	disappear CINNABARISLAND_BLUE
	clearevent EVENT_VIRIDIAN_GYM_BLUE
	end

CinnabarIslandGymSign:
	jumptext CinnabarIslandGymSignText

CinnabarIslandSign:
	jumptext CinnabarIslandSignText

CinnabarIslandPokecenterSign:
	jumpstd PokecenterSignScript

CinnabarIslandHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_CINNABAR_ISLAND_HIDDEN_RARE_CANDY

CinnabarIslandBlueTeleport:
	teleport_from
	step_end

CinnabarIslandBlueText:
	text "Bạn là ai?"

	para "À, nhìn rõ ràng"
	line "bạn là HLV…"

	para "Tôi là BLUE."

	para "Tôi từng là"
	line "NHÀ VÔ ĐỊCH, mặc"

	para "dù chỉ trong"
	line "một thời gian"
	cont "ngắn…"

	para "Thằng RED phiền"
	line "phức đã hạ tôi…"

	para "Dù sao, bạn muốn"
	line "gì? Bạn muốn"

	para "thách đấu tôi hay"
	line "gì đó?"

	para "…Tôi ghét phải"
	line "nói điều này,"

	para "nhưng tôi không"
	line "có tâm trạng chiến"
	cont "đấu bây giờ."

	para "Hãy nhìn xung"
	line "quanh bạn kỹ…"

	para "Núi lửa phun,"
	line "và chỉ cần thế,"

	para "cả thị trấn biến"
	line "mất."

	para "Ta có thể thắng"
	line "và thua trong"

	para "#MON. Nhưng nếu"
	line "thiên nhiên chỉ"

	para "cần giật mình,"
	line "ta có thể thua"
	cont "trong giây lát."

	para "…"

	para "Đó là cách nó"
	line "diễn ra…"

	para "Nhưng, dù sao,"
	line "tôi vẫn là HLV."

	para "Nếu tôi thấy đối"
	line "thủ mạnh, nó khiến"
	cont "tôi muốn chiến."

	para "Nếu bạn muốn"
	line "chiến với tôi,"
	cont "hãy đến GYM"
	cont "VIRIDIAN."

	para "Tôi sẽ đấu với"
	line "bạn lúc đó."
	done

CinnabarIslandGymSignText:
	text "Có một thông báo"
	line "ở đây…"

	para "GYM CINNABAR đã"
	line "chuyển đến ĐẢO"
	cont "BỌT BIỂN."

	para "BLAINE"
	done

CinnabarIslandSignText:
	text "ĐẢO CINNABAR"

	para "Thị Trấn Bốc Lửa"
	line "Của Khát Khao"
	done

CinnabarIsland_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 11, CINNABAR_POKECENTER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 12, 11, BGEVENT_READ, CinnabarIslandPokecenterSign
	bg_event  9, 11, BGEVENT_READ, CinnabarIslandGymSign
	bg_event  7,  7, BGEVENT_READ, CinnabarIslandSign
	bg_event  9,  1, BGEVENT_ITEM, CinnabarIslandHiddenRareCandy

	def_object_events
	object_event  9,  6, SPRITE_BLUE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarIslandBlue, EVENT_BLUE_IN_CINNABAR
