	object_const_def
	const OAKSLAB_OAK
	const OAKSLAB_SCIENTIST1
	const OAKSLAB_SCIENTIST2
	const OAKSLAB_SCIENTIST3

OaksLab_MapScripts:
	def_scene_scripts

	def_callbacks

OaksLabNoopScene: ; unreferenced
	end

Oak:
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .CheckPokedex
	checkevent EVENT_TALKED_TO_OAK_IN_KANTO
	iftrue .CheckBadges
	writetext OakWelcomeKantoText
	promptbutton
	setevent EVENT_TALKED_TO_OAK_IN_KANTO
.CheckBadges:
	readvar VAR_BADGES
	ifequal NUM_BADGES, .OpenMtSilver
	ifequal NUM_JOHTO_BADGES, .Complain
	sjump .AhGood

.CheckPokedex:
	writetext OakLabDexCheckText
	waitbutton
	special ProfOaksPCBoot
	writetext OakLabGoodbyeText
	waitbutton
	closetext
	end

.OpenMtSilver:
	writetext OakOpenMtSilverText
	promptbutton
	setevent EVENT_OPENED_MT_SILVER
	sjump .CheckPokedex

.Complain:
	writetext OakNoKantoBadgesText
	promptbutton
	sjump .CheckPokedex

.AhGood:
	writetext OakYesKantoBadgesText
	promptbutton
	sjump .CheckPokedex

OaksAssistant1Script:
	jumptextfaceplayer OaksAssistant1Text

OaksAssistant2Script:
	jumptextfaceplayer OaksAssistant2Text

OaksAssistant3Script:
	jumptextfaceplayer OaksAssistant3Text

OaksLabBookshelf:
	jumpstd DifficultBookshelfScript

OaksLabPoster1:
	jumptext OaksLabPoster1Text

OaksLabPoster2:
	jumptext OaksLabPoster2Text

OaksLabTrashcan:
	jumptext OaksLabTrashcanText

OaksLabPC:
	jumptext OaksLabPCText

OakWelcomeKantoText:
	text "OAK: Ồ, <PLAY_G>!"
	line "Tốt lắm khi bạn"

	para "đến tận KANTO"
	line "như vậy."

	para "Bạn nghĩ sao về"
	line "các HLV ở đây?"

	para "Khá khó khăn,"
	line "phải không?"
	done

OakLabDexCheckText:
	text "#DEX của bạn"
	line "thế nào rồi?"

	para "Để xem nào…"
	done

OakLabGoodbyeText:
	text "Nếu bạn qua đây,"
	line "tôi hy vọng bạn"
	cont "ghé thăm lại."
	done

OakOpenMtSilverText:
	text "OAK: Wow! Tuyệt"
	line "vời!"

	para "Bạn thu thập đủ"
	line "HUYÊN HIỆU của"
	cont "KANTO. Giỏi lắm!"

	para "Tôi đúng khi đánh"
	line "giá bạn cao."

	para "Nghe này,"
	line "<PLAY_G>. Tôi sẽ"

	para "sắp xếp để bạn"
	line "có thể đến"
	cont "NÚI BẠC."

	para "NÚI BẠC là ngọn"
	line "núi lớn, nơi ở"

	para "của nhiều #MON"
	line "hoang dã."

	para "Quá nguy hiểm cho"
	line "HLV bình thường,"

	para "nên bị cấm. Nhưng"
	line "ta có thể ngoại"

	para "lệ cho trường hợp"
	line "của bạn, <PLAY_G>."

	para "Hãy đến CAO NGUYÊN"
	line "INDIGO. Bạn có thể"

	para "đến NÚI BẠC từ"
	line "đó."
	done

OakNoKantoBadgesText:
	text "OAK: Hmm? Bạn"
	line "không thu thập"
	cont "HUYÊN HIỆU KANTO?"

	para "T.LĨNH GYM ở"
	line "KANTO cũng khó"

	para "như những người"
	line "bạn đấu ở JOHTO."

	para "Tôi khuyên bạn"
	line "nên thách đấu"
	cont "họ."
	done

OakYesKantoBadgesText:
	text "OAK: À, bạn đang"
	line "thu thập HUYÊN"
	cont "HIỆU KANTO."

	para "Tôi nghĩ là khó,"
	line "nhưng kinh nghiệm"

	para "chắc chắn sẽ giúp"
	line "ích bạn."

	para "Hãy gặp tôi khi"
	line "bạn có đủ."

	para "Tôi có quà cho"
	line "bạn."

	para "Cố gắng lên,"
	line "<PLAY_G>!"
	done

OaksAssistant1Text:
	text "Chương trình"
	line "#MON TALK radio"

	para "của GS không phát"
	line "ở KANTO."

	para "Thật tiếc--tôi"
	line "muốn nghe lắm."
	done

OaksAssistant2Text:
	text "Nhờ công việc của"
	line "bạn với #DEX,"

	para "nghiên cứu của GS"
	line "tiến triển tốt."
	done

OaksAssistant3Text:
	text "Đừng nói ai nhé,"
	line "nhưng #MON TALK"

	para "của GS OAK không"
	line "phát trực tiếp."
	done

OaksLabPoster1Text:
	text "Nhấn START để mở"
	line "MENU."
	done

OaksLabPoster2Text:
	text "Tùy chọn LƯU ở"
	line "trong MENU."

	para "Hãy dùng nó đúng"
	line "lúc."
	done

OaksLabTrashcanText:
	text "Không có gì trong"
	line "này…"
	done

OaksLabPCText:
	text "Có một tin nhắn"
	line "e-mail trên PC."

	para "…"

	para "GS OAK, nghiên cứu"
	line "của ông thế nào"
	cont "rồi?"

	para "Tôi vẫn đang tiếp"
	line "tục làm việc."

	para "Tôi nghe đồn"
	line "<PLAY_G> đang có"

	para "danh tiếng khá"
	line "tốt."

	para "Tôi rất vui khi"
	line "nghe điều đó."

	para "ELM ở THỊ TRẤN"
	line "NEW BARK 8-)"
	done

OaksLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, PALLET_TOWN, 3
	warp_event  5, 11, PALLET_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  0,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  1,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  2,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  3,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  6,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  4,  0, BGEVENT_READ, OaksLabPoster1
	bg_event  5,  0, BGEVENT_READ, OaksLabPoster2
	bg_event  9,  3, BGEVENT_READ, OaksLabTrashcan
	bg_event  0,  1, BGEVENT_READ, OaksLabPC

	def_object_events
	object_event  4,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Oak, -1
	object_event  1,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant1Script, -1
	object_event  8,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant2Script, -1
	object_event  1,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant3Script, -1
