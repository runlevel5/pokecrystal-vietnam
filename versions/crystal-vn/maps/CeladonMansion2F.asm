CeladonMansion2F_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonMansion2FComputer:
	jumptext CeladonMansion2FComputerText

CeladonMansion2FMeetingRoomSign:
	jumptext CeladonMansion2FMeetingRoomSignText

CeladonMansion2FBookshelf:
	jumpstd DifficultBookshelfScript

CeladonMansion2FComputerText:
	text "<PLAYER> bật PC."

	para "…"

	para "Có người đang soạn"
	line "e-mail dang dở."

	para "…Tôi mong bạn sẽ"
	line "đến thăm KANTO."

	para "Tôi nghĩ bạn sẽ"
	line "ngạc nhiên về sự"

	para "thay đổi nhiều ở"
	line "đây."

	para "Bạn cũng sẽ thấy"
	line "nhiều #MON"

	para "không có nguồn"
	line "gốc từ JOHTO."

	para "Gửi NHÀ SẢN XUẤT"

	para "…"
	done

CeladonMansion2FMeetingRoomSignText:
	text "GAME FREAK"
	line "PHÒNG HỌP"
	done

CeladonMansion2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, CELADON_MANSION_1F, 4
	warp_event  1,  0, CELADON_MANSION_3F, 2
	warp_event  6,  0, CELADON_MANSION_3F, 3
	warp_event  7,  0, CELADON_MANSION_1F, 5

	def_coord_events

	def_bg_events
	bg_event  0,  3, BGEVENT_READ, CeladonMansion2FComputer
	bg_event  5,  8, BGEVENT_UP, CeladonMansion2FMeetingRoomSign
	bg_event  2,  3, BGEVENT_READ, CeladonMansion2FBookshelf

	def_object_events
