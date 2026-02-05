	object_const_def
	const OLIVINECAFE_SAILOR1
	const OLIVINECAFE_FISHING_GURU
	const OLIVINECAFE_SAILOR2

OlivineCafe_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineCafeStrengthSailorScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM04_STRENGTH
	iftrue .GotStrength
	writetext OlivineCafeStrengthSailorText
	promptbutton
	verbosegiveitem HM_STRENGTH
	setevent EVENT_GOT_HM04_STRENGTH
.GotStrength:
	writetext OlivineCafeStrengthSailorText_GotStrength
	waitbutton
	closetext
	end

OlivineCafeFishingGuruScript:
	jumptextfaceplayer OlivineCafeFishingGuruText

OlivineCafeSailorScript:
	jumptextfaceplayer OlivineCafeSailorText

OlivineCafeStrengthSailorText:
	text "Ha! #MON bạn"
	line "trông có vẻ yếu"
	cont "ớt!"

	para "Chúng không có sức"
	line "để đẩy tảng đá đâu"

	para "Đây, dùng cái này"
	line "và dạy chúng"
	cont "SỨC MẠNH!"
	done

OlivineCafeStrengthSailorText_GotStrength:
	text "Trên biển, điều"
	line "duy nhất bạn có"

	para "thể tin tưởng là"
	line "chính bản thân!"

	para "Tôi tự hào về cơ"
	line "bắp của mình!"
	done

OlivineCafeFishingGuruText:
	text "Thực đơn QUÁN CÀ"
	line "PHÊ OLIVINE đầy"

	para "món ăn bổ dưỡng"
	line "cho THỦ THỦY!"
	done

OlivineCafeSailorText:
	text "Mỗi khi tôi đến"
	line "thành phố này, tôi"

	para "luôn ghé QUÁN CÀ"
	line "PHÊ OLIVINE."

	para "Mọi món trong thực"
	line "đơn làm tôi cảm"

	para "thấy khỏe hơn. Tôi"
	line "không thể ngừng ăn"
	done

OlivineCafe_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 7
	warp_event  3,  7, OLIVINE_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeStrengthSailorScript, -1
	object_event  7,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeFishingGuruScript, -1
	object_event  6,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeSailorScript, -1
