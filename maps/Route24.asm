	object_const_def
	const ROUTE24_ROCKET

Route24_MapScripts:
	def_scene_scripts

	def_callbacks

Route24RocketScript:
	faceplayer
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext Route24RocketSeenText
	waitbutton
	closetext
	winlosstext Route24RocketBeatenText, -1
	loadtrainer GRUNTM, GRUNTM_31
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext Route24RocketAfterBattleText
	promptbutton
	special FadeOutMusic
	writetext Route24RocketDisappearsText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear ROUTE24_ROCKET
	pause 25
	special FadeInFromBlack
	playmapmusic
	end

Route24RocketSeenText:
	text "Này, con! Tao là"
	line "thành viên ĐỘI"
	cont "ROCKET đấy nhá!"

	para "Đến từ nước khác,"
	line "HLV số một, tao"
	cont "là!"

	para "Tao nghĩ, nếu"
	line "dừng nguồn điện,"

	para "sẽ hoảng loạn ở"
	line "đây người!"

	para "Bí mật là nhiệm"
	line "vụ tao, nói cho"
	cont "mày tao không!"

	para "Nhưng! Nếu thắng"
	line "mày làm với tao,"

	para "đàn ông tao sẽ và"
	line "bí mật cho mày."

	para "Này, con! Đấu"
	line "bắt đầu ta làm!"
	done

Route24RocketBeatenText:
	text "Áiii! Không, không"
	line "không, tin được"
	cont "không tao!"

	para "Mạnh rất nhiều"
	line "là mày! Ngang tao"
	cont "không với mày!"
	done

Route24RocketAfterBattleText:
	text "OK. Nói mày bí"
	line "mật tao sẽ."

	para "BỘ PHẬN MÁY ăn"
	line "cắp tao, giấu tao"

	para "làm trong GYM của"
	line "CERULEAN."

	para "Trong nước để"
	line "nó tao làm. Tìm"

	para "trong nước giữa"
	line "GYM ở."

	para "Nhưng mày quên tao"
	line "không đấy!"

	para "Đánh mày chắc"
	line "chắn sẽ ĐỘI ROCKET"

	para "Đến từ JOHTO"
	line "sẽ họ, bạn tao,"

	para "đúng. Sẽ trả thù"
	line "họ là."
	done

Route24RocketDisappearsText:
	text "…"

	para "Mày nói gì? ĐỘI"
	line "ROCKET tạm biệt đi"

	para "đi? Tan rã nó"
	line "là nói mày?"

	para "Ồ, không! Phải tao"
	line "làm gì bây giờ"
	cont "từ, tao?"
	done

Route24_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  7, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route24RocketScript, EVENT_ROUTE_24_ROCKET
