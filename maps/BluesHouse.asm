	object_const_def
	const BLUESHOUSE_DAISY

BluesHouse_MapScripts:
	def_scene_scripts

	def_callbacks

DaisyScript:
	faceplayer
	opentext
	readvar VAR_HOUR
	ifequal 15, .ThreePM
	writetext DaisyHelloText
	waitbutton
	closetext
	end

.ThreePM:
	checkflag ENGINE_DAISYS_GROOMING
	iftrue .AlreadyGroomedMon
	writetext DaisyOfferGroomingText
	yesorno
	iffalse .Refused
	writetext DaisyWhichMonText
	waitbutton
	special DaisysGrooming
	ifequal $0, .Refused
	ifequal $1, .CantGroomEgg
	setflag ENGINE_DAISYS_GROOMING
	writetext DaisyAlrightText
	waitbutton
	closetext
	special FadeOutToWhite
	playmusic MUSIC_HEAL
	pause 60
	special FadeInFromWhite
	special RestartMapMusic
	opentext
	writetext GroomedMonLooksContentText
	special PlayCurMonCry
	promptbutton
	writetext DaisyAllDoneText
	waitbutton
	closetext
	end

.AlreadyGroomedMon:
	writetext DaisyAlreadyGroomedText
	waitbutton
	closetext
	end

.Refused:
	writetext DaisyRefusedText
	waitbutton
	closetext
	end

.CantGroomEgg:
	writetext DaisyCantGroomEggText
	waitbutton
	closetext
	end

DaisyHelloText:
	text "DAISY: Chào bạn!"
	line "Em trai tôi là"

	para "THỦ LĨNH GYM ở"
	line "TP TOKIWA."

	para "Nhưng nó thường"
	line "ra ngoài thành,"

	para "gây rắc rối cho"
	line "các HLV."
	done

DaisyOfferGroomingText:
	text "DAISY: Chào! Đúng"
	line "lúc. Tôi sắp uống"
	cont "trà."

	para "Bạn muốn uống"
	line "cùng không?"

	para "Ồ, #MON của"
	line "bạn hơi bẩn."

	para "Để tôi làm đẹp"
	line "cho một con nhé?"
	done

DaisyWhichMonText:
	text "DAISY: Con nào để"
	line "tôi làm đẹp?"
	done

DaisyAlrightText:
	text "DAISY: OK, tôi sẽ"
	line "làm cho nó đẹp"
	cont "ngay thôi."
	done

GroomedMonLooksContentText:
	text_ram wStringBuffer3
	text " trông"
	line "hài lòng."
	done

DaisyAllDoneText:
	text "DAISY: Xong rồi!"
	line "Hoàn tất."

	para "Thấy không?"
	line "Trông đẹp lắm!"

	para "Thật là một con"
	line "#MON dễ thương."
	done

DaisyAlreadyGroomedText:
	text "DAISY: Tôi luôn"
	line "uống trà vào giờ"

	para "này. Hãy đến"
	line "cùng tôi nhé."
	done

DaisyRefusedText:
	text "DAISY: Bạn không"
	line "muốn làm đẹp à?"

	para "OK, chỉ uống trà"
	line "thôi."
	done

DaisyCantGroomEggText:
	text "DAISY: Ồ, xin lỗi"
	line "Tôi không thể làm"
	cont "đẹp TRỨNG được."
	done

BluesHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, PALLET_TOWN, 2
	warp_event  3,  7, PALLET_TOWN, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DaisyScript, -1
