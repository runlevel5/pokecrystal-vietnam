	object_const_def
	const CELADONMANSIONROOFHOUSE_PHARMACIST

CeladonMansionRoofHouse_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonMansionRoofHousePharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM03_CURSE
	iftrue .GotCurse
	writetext CeladonMansionRoofHousePharmacistIntroText
	promptbutton
	checktime NITE
	iftrue .Night
	writetext CeladonMansionRoofHousePharmacistNotNightText
	waitbutton
	closetext
	end

.Night:
	writetext CeladonMansionRoofHousePharmacistStoryText
	promptbutton
	verbosegiveitem TM_CURSE
	iffalse .NoRoom
	setevent EVENT_GOT_TM03_CURSE
.GotCurse:
	writetext CeladonMansionRoofHousePharmacistCurseText
	waitbutton
.NoRoom:
	closetext
	end

CeladonMansionRoofHousePharmacistIntroText:
	text "Để tôi kể cho bạn"
	line "nghe câu chuyện"
	cont "đáng sợ…"
	done

CeladonMansionRoofHousePharmacistNotNightText:
	text "Thôi nhưng mà nó"
	line "không đáng sợ khi"

	para "trời còn sáng."

	para "Hãy quay lại sau"
	line "khi mặt trời lặn,"
	cont "nhé?"
	done

CeladonMansionRoofHousePharmacistStoryText:
	text "Ngày xửa ngày xưa,"
	line "có một cậu bé được"

	para "tặng chiếc XE ĐẠP"
	line "mới…"

	para "Cậu muốn thử nó"
	line "ngay lập tức…"

	para "Cậu vui đến nỗi"
	line "không để ý"

	para "mặt trời đã lặn…"

	para "Khi đạp xe về nhà"
	line "trong đêm tối mịt,"

	para "chiếc xe đột nhiên"
	line "chậm lại!"

	para "Bàn đạp trở nên"
	line "nặng!"

	para "Khi cậu ngừng đạp,"
	line "xe bắt đầu"

	para "trượt ngược lại!"

	para "Như thể chiếc xe"
	line "bị nguyền rủa"

	para "và cố kéo cậu vào"
	line "hư vô!"

	para "…"

	para "…"

	para "KHÊ KHẾ KHÊ!"

	para "Cậu bé đang đạp"
	line "lên dốc trên"
	cont "ĐƯỜNG ĐUA XE!"

	para "…"
	line "Đùng đùng đùng!"

	para "Vì nghe kiên nhẫn"
	line "như vậy, bạn có"
	cont "thể nhận TM03!"
	done

CeladonMansionRoofHousePharmacistCurseText:
	text "TM03 là LỜI NGUYỀN."

	para "Đây là chiêu đáng"
	line "sợ làm giảm dần"

	para "HP của nạn nhân."
	done

CeladonMansionRoofHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CELADON_MANSION_ROOF, 3
	warp_event  3,  7, CELADON_MANSION_ROOF, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  2, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofHousePharmacistScript, -1
