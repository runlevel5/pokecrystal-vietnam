	object_const_def
	const POKEMONFANCLUB_CHAIRMAN
	const POKEMONFANCLUB_RECEPTIONIST
	const POKEMONFANCLUB_CLEFAIRY_GUY
	const POKEMONFANCLUB_TEACHER
	const POKEMONFANCLUB_FAIRY
	const POKEMONFANCLUB_ODDISH

PokemonFanClub_MapScripts:
	def_scene_scripts

	def_callbacks

PokemonFanClubChairmanScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	iftrue .HeardSpeech
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT_BUT_BAG_WAS_FULL
	iftrue .HeardSpeechButBagFull
	writetext PokemonFanClubChairmanDidYouVisitToHearAboutMyMonText
	yesorno
	iffalse .NotListening
	writetext PokemonFanClubChairmanRapidashText
	promptbutton
.HeardSpeechButBagFull:
	writetext PokemonFanClubChairmanIWantYouToHaveThisText
	promptbutton
	verbosegiveitem RARE_CANDY
	iffalse .BagFull
	setevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	writetext PokemonFanClubChairmanItsARareCandyText
	waitbutton
	closetext
	end

.HeardSpeech:
	writetext PokemonFanClubChairmanMoreTalesToTellText
	waitbutton
	closetext
	end

.NotListening:
	writetext PokemonFanClubChairmanHowDisappointingText
	waitbutton
.BagFull:
	closetext
	end

PokemonFanClubReceptionistScript:
	jumptextfaceplayer PokemonFanClubReceptionistText

PokemonFanClubClefairyGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	iftrue .GotLostItem
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .FoundClefairyDoll
	writetext PokemonFanClubClefairyGuyClefairyIsSoAdorableText
	waitbutton
	closetext
	end

.FoundClefairyDoll:
	writetext PokemonFanClubClefairyGuyMakingDoWithADollIFoundText
	checkevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	iftrue .MetCopycat
	waitbutton
	closetext
	end

.MetCopycat:
	promptbutton
	writetext PokemonFanClubClefairyGuyTakeThisDollBackToGirlText
	promptbutton
	waitsfx
	giveitem LOST_ITEM
	iffalse .NoRoom
	disappear POKEMONFANCLUB_FAIRY
	writetext PokemonFanClubPlayerReceivedDollText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	closetext
	end

.GotLostItem:
	writetext PokemonFanClubClefairyGuyGoingToGetARealClefairyText
	waitbutton
	closetext
	end

.NoRoom:
	writetext PokemonFanClubClefairyGuyPackIsJammedFullText
	waitbutton
	closetext
	end

PokemonFanClubTeacherScript:
	jumptextfaceplayer PokemonFanClubTeacherText

PokemonFanClubClefairyDollScript:
	jumptext PokemonFanClubClefairyDollText

PokemonFanClubBayleefScript:
	opentext
	writetext PokemonFanClubBayleefText
	cry BAYLEEF
	waitbutton
	closetext
	end

PokemonFanClubListenSign:
	jumptext PokemonFanClubListenSignText

PokemonFanClubBraggingSign:
	jumptext PokemonFanClubBraggingSignText

PokemonFanClubChairmanDidYouVisitToHearAboutMyMonText:
	text "Tôi là CHỦ TỊCH"
	line "của CLB FAN"
	cont "#MON."

	para "Tôi đã nuôi hơn"
	line "150 #MON."

	para "Tôi rất khó tính"
	line "khi nói về"
	cont "#MON."

	para "Bạn đến để nghe"
	line "về #MON của"
	cont "tôi đúng không?"
	done

PokemonFanClubChairmanRapidashText:
	text "Tốt lắm!"
	line "Vậy nghe đây!"

	para "Vậy… RAPIDASH"
	line "yêu quý của tôi…"

	para "Nó… dễ thương…"
	line "thông minh… khó"
	cont "chịu nổi… thêm…"
	cont "tuyệt vời… ồ…"
	cont "bạn nghĩ vậy?…"
	cont "Quá… hoang dã…"
	cont "đẹp… hiền… yêu!"

	para "Ôm… khi… ngủ…"
	line "ấm… dễ thương…"
	cont "Ồ, và… ngoạn"
	cont "mục… tuyệt đẹp…"
	cont "hoàn hảo… Ối!"
	cont "Xem thời gian!"
	cont "Tôi giữ bạn lâu"
	cont "quá rồi!"
	done

PokemonFanClubChairmanIWantYouToHaveThisText:
	text "Cảm ơn vì đã"
	line "lắng nghe. Hãy"
	cont "nhận món này!"
	done

PokemonFanClubChairmanItsARareCandyText:
	text "Đó là KẸO HIẾM"
	line "giúp #MON"
	cont "mạnh hơn."

	para "Tôi thích làm"
	line "#MON mạnh hơn"

	para "bằng chiến đấu,"
	line "nên bạn giữ lấy."
	done

PokemonFanClubChairmanMoreTalesToTellText:
	text "Chào, <PLAY_G>!"

	para "Bạn đến để nghe"
	line "về #MON của tôi"
	cont "nữa sao?"

	para "Không? Ồ… Tôi còn"
	line "nhiều chuyện…"
	done

PokemonFanClubChairmanHowDisappointingText:
	text "Thật thất vọng…"

	para "Hãy quay lại nếu"
	line "bạn muốn nghe."
	done

PokemonFanClubReceptionistText:
	text "CHỦ TỊCH của chúng"
	line "tôi rất nhiều lời"
	cont "về #MON…"
	done

PokemonFanClubClefairyGuyClefairyIsSoAdorableText:
	text "Tôi yêu cách"
	line "CLEFAIRY vẫy"

	para "ngón tay khi nó"
	line "cố dùng"

	para "ĐIỆU NGŨ."
	line "Thật đáng yêu!"
	done

PokemonFanClubClefairyGuyMakingDoWithADollIFoundText:
	text "Tôi yêu CLEFAIRY,"
	line "nhưng không thể"

	para "bắt được. Nên tôi"
	line "tạm dùng"

	para "BÚP BÊ # mà tôi"
	line "tìm được."
	done

PokemonFanClubClefairyGuyTakeThisDollBackToGirlText:
	text "Ồ, tôi hiểu rồi."
	line "Cô bé mất"

	para "BÚP BÊ # này"
	cont "đang buồn…"

	para "OK. Bạn có thể"
	line "mang BÚP BÊ #"

	para "này trả lại cho"
	line "cô bé không?"

	para "Tôi sẽ kết bạn"
	line "với CLEFAIRY thật"

	para "một ngày nào đó."
	line "Đừng lo!"
	done

PokemonFanClubPlayerReceivedDollText:
	text "<PLAYER> nhận được"
	line "BÚP BÊ #."
	done

PokemonFanClubClefairyGuyGoingToGetARealClefairyText:
	text "Bạn xem đi. Tôi"
	line "sẽ có được một"

	para "CLEFAIRY thật làm"
	line "bạn của tôi."
	done

PokemonFanClubClefairyGuyPackIsJammedFullText:
	text "BALO của bạn"
	line "đã đầy."
	done

PokemonFanClubTeacherText:
	text "Nhìn BAYLEEF"
	line "yêu dấu của tôi!"

	para "Chiếc lá trên đầu"
	line "nó dễ thương quá!"
	done

PokemonFanClubClefairyDollText:
	text "Đó là CLEFAIRY!"
	line "Hả?"

	para "Ồ, đúng rồi. Đó là"
	line "CLEFAIRY #"
	cont "DOLL."
	done

PokemonFanClubBayleefText:
	text "BAYLEEF: Li liif!"
	done

PokemonFanClubListenSignText:
	text "Hãy lắng nghe"
	line "lịch sự HLV"
	cont "khác."
	done

PokemonFanClubBraggingSignText:
	text "Nếu ai khoe khoang"
	line "khoe lại ngay!"
	done

PokemonFanClub_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 3
	warp_event  3,  7, VERMILION_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  7,  0, BGEVENT_READ, PokemonFanClubListenSign
	bg_event  9,  0, BGEVENT_READ, PokemonFanClubBraggingSign

	def_object_events
	object_event  3,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubChairmanScript, -1
	object_event  4,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokemonFanClubReceptionistScript, -1
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubClefairyGuyScript, -1
	object_event  7,  2, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubTeacherScript, -1
	object_event  2,  4, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubClefairyDollScript, EVENT_VERMILION_FAN_CLUB_DOLL
	object_event  7,  3, SPRITE_ODDISH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokemonFanClubBayleefScript, -1
