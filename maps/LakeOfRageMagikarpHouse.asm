	object_const_def
	const LAKEOFRAGEMAGIKARPHOUSE_FISHING_GURU

LakeOfRageMagikarpHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MagikarpLengthRaterScript:
	faceplayer
	opentext
	checkevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	iftrue .GetReward
	checkevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	iftrue .AskedForMagikarp
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	checkevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	iftrue .ExplainedHistory
	writetext MagikarpLengthRaterText_LakeOfRageHistory
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	end

.ExplainedHistory:
	writetext MagikarpLengthRaterText_MenInBlack
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext MagikarpLengthRaterText_WorldsLargestMagikarp
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	end

.AskedForMagikarp:
	setval MAGIKARP
	special FindPartyMonThatSpecies
	iffalse .ClearedRocketHideout
	writetext MagikarpLengthRaterText_YouHaveAMagikarp
	waitbutton
	special CheckMagikarpLength
	ifequal MAGIKARPLENGTH_NOT_MAGIKARP, .NotMagikarp
	ifequal MAGIKARPLENGTH_REFUSED, .Refused
	ifequal MAGIKARPLENGTH_TOO_SHORT, .TooShort
	; MAGIKARPLENGTH_BEAT_RECORD
	sjump .GetReward

.GetReward:
	writetext MagikarpLengthRaterText_Memento
	promptbutton
	verbosegiveitem ELIXER
	iffalse .NoRoom
	writetext MagikarpLengthRaterText_Bonus
	waitbutton
	closetext
	clearevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.NoRoom:
	closetext
	setevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.TooShort:
	writetext MagikarpLengthRaterText_TooShort
	waitbutton
	closetext
	end

.NotMagikarp:
	writetext MagikarpLengthRaterText_NotMagikarp
	waitbutton
	closetext
	end

.Refused:
	writetext MagikarpLengthRaterText_Refused
	waitbutton
	closetext
	end

LakeOfRageMagikarpHouseUnusedRecordSign: ; unreferenced
	jumptext LakeOfRageMagikarpHouseUnusedRecordText

MagikarpHouseBookshelf:
	jumpstd DifficultBookshelfScript

MagikarpLengthRaterText_LakeOfRageHistory:
	text "HỒ PHẪN NỘ thực ra"
	line "là miệng núi lửa"

	para "do GYARADOS nổi"
	line "điên tạo ra."

	para "Miệng núi lửa chứa"
	line "đầy nước mưa"

	para "và HỒ được hình"
	line "thành."

	para "Đó là câu chuyện"
	line "được truyền lại từ"

	para "cụ cố của cố"
	line "Ông tôi."

	para "Trước đây bạn có"
	line "thể bắt được"

	para "MAGIKARP sống động"
	line "ở đó, nhưng…"

	para "Tôi không hiểu"
	line "chuyện gì xảy ra."
	done

MagikarpLengthRaterText_MenInBlack:
	text "HỒ chưa trở lại"
	line "bình thường kể từ"

	para "khi mấy người mặc"
	line "đen đến."
	done

MagikarpLengthRaterText_WorldsLargestMagikarp:
	text "HỒ PHẪN NỘ đã trở"
	line "lại bình thường."

	para "MAGIKARP đã quay"
	line "về."

	para "Tôi có thể hiện"
	line "thực hóa giấc mơ"
	cont "thấy MAGIKARP lớn"
	cont "nhất thế giới."

	para "Bạn có CẦN không?"
	line "Hãy giúp tôi nếu"
	cont "bạn có."
	done

MagikarpLengthRaterText_YouHaveAMagikarp:
	text "À, bạn có một"
	line "MAGIKARP! Hãy xem"

	para "con bé đó to như"
	line "thế nào."
	done

MagikarpLengthRaterText_Memento:
	text "Wow! Con này xuất"
	line "sắc!"

	para "Tôi cởi mũ chào"
	line "bạn!"

	para "Nhận cái này làm"
	line "kỷ niệm!"
	done

MagikarpLengthRaterText_Bonus:
	text "Kỷ lục mới là"
	line "điều quan trọng."

	para "Hãy coi đó như"
	line "tiền thưởng!"
	done

MagikarpLengthRaterText_TooShort:
	text "Wow! Con này xuất"
	line "sắc!"

	para "…Giá tôi có thể"
	line "nói thế, nhưng tôi"

	para "đã thấy con lớn"
	line "hơn trước đây."
	done

MagikarpLengthRaterText_NotMagikarp:
	text "Gì? Đó không phải"
	line "là MAGIKARP!"
	done

MagikarpLengthRaterText_Refused:
	text "Ồ… Vậy là bạn"
	line "không có con đủ"

	para "tốt để cho tôi"
	line "xem? Lần sau nhé."
	done

LakeOfRageMagikarpHouseUnusedRecordText:
	text "KỶ LỤC HIỆN TẠI"

	para "@"
	text_ram wStringBuffer3
	text " bắt bởi"
	line "@"
	text_ram wStringBuffer4
	text_end

LakeOfRageMagikarpHouseUnusedDummyText: ; unreferenced
	text_end

LakeOfRageMagikarpHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAKE_OF_RAGE, 2
	warp_event  3,  7, LAKE_OF_RAGE, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, MagikarpHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MagikarpHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MagikarpLengthRaterScript, -1
