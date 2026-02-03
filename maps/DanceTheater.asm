	object_const_def
	const DANCETHEATER_KIMONO_GIRL1
	const DANCETHEATER_KIMONO_GIRL2
	const DANCETHEATER_KIMONO_GIRL3
	const DANCETHEATER_KIMONO_GIRL4
	const DANCETHEATER_KIMONO_GIRL5
	const DANCETHEATER_GENTLEMAN
	const DANCETHEATER_RHYDON
	const DANCETHEATER_COOLTRAINER_M
	const DANCETHEATER_GRANNY

DanceTheater_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerKimonoGirlNaoko:
	trainer KIMONO_GIRL, NAOKO, EVENT_BEAT_KIMONO_GIRL_NAOKO, KimonoGirlNaokoSeenText, KimonoGirlNaokoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlNaokoAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlSayo:
	trainer KIMONO_GIRL, SAYO, EVENT_BEAT_KIMONO_GIRL_SAYO, KimonoGirlSayoSeenText, KimonoGirlSayoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlSayoAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlZuki:
	trainer KIMONO_GIRL, ZUKI, EVENT_BEAT_KIMONO_GIRL_ZUKI, KimonoGirlZukiSeenText, KimonoGirlZukiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlZukiAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlKuni:
	trainer KIMONO_GIRL, KUNI, EVENT_BEAT_KIMONO_GIRL_KUNI, KimonoGirlKuniSeenText, KimonoGirlKuniBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlKuniAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlMiki:
	trainer KIMONO_GIRL, MIKI, EVENT_BEAT_KIMONO_GIRL_MIKI, KimonoGirlMikiSeenText, KimonoGirlMikiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlMikiAfterBattleText
	waitbutton
	closetext
	end

DanceTheaterSurfGuy:
	faceplayer
	opentext
	writetext SurfGuyNeverLeftAScratchText
	promptbutton
	checkevent EVENT_GOT_HM03_SURF
	iftrue SurfGuyAlreadyGaveSurf
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalse .KimonoGirlsUndefeated
	sjump .GetSurf

.KimonoGirlsUndefeated:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .PlayerIsFemale
	writetext SurfGuyLadGiftText
	waitbutton
	closetext
	end

.PlayerIsFemale:
	writetext SurfGuyLassieGiftText
	waitbutton
	closetext
	end

.GetSurf:
	writetext SurfGuyLikeADanceText
	promptbutton
	verbosegiveitem HM_SURF
	setevent EVENT_GOT_HM03_SURF
	writetext SurfGuySurfExplanationText
	waitbutton
	closetext
	end

SurfGuyAlreadyGaveSurf:
	writetext SurfGuyElegantKimonoGirlsText
	waitbutton
	closetext
	end

DanceTheaterRhydon:
	opentext
	writetext RhydonText
	cry RHYDON
	waitbutton
	closetext
	end

DanceTheaterCooltrainerMScript:
	jumptextfaceplayer DanceTheaterCooltrainerMText

DanceTheaterGrannyScript:
	jumptextfaceplayer DanceTheaterGrannyText

DanceTheaterFancyPanel:
	jumptext DanceTheaterFancyPanelText

KimonoGirlNaokoSeenText:
	text "Bạn có #MON"
	line "dễ thương. Cho tôi"
	cont "xem chúng đấu?"
	done

KimonoGirlNaokoBeatenText:
	text "Ôi, bạn rất mạnh."
	done

KimonoGirlNaokoAfterBattleText:
	text "Tôi thích trận"
	line "đấu đó. Muốn gặp"
	cont "lại bạn."
	done

KimonoGirlSayoSeenText:
	text "Tôi luôn nhảy múa"
	line "cùng #MON."

	para "Tất nhiên, tôi"
	line "cũng huấn luyện"
	cont "chúng."
	done

KimonoGirlSayoBeatenText:
	text "Ôi, suýt nữa!"
	line "Tôi gần thắng rồi"
	done

KimonoGirlSayoAfterBattleText:
	text "Nhịp điệu rất quan"
	line "trọng cho cả nhảy"

	para "múa và #MON."
	done

KimonoGirlZukiSeenText:
	text "Kẹp tóc của tôi"
	line "đẹp không?"

	para "Ồ. Đấu #MON à?"
	done

KimonoGirlZukiBeatenText:
	text "Tôi không còn"
	line "#MON nào…"
	done

KimonoGirlZukiAfterBattleText:
	text "Tôi cắm hoa khác"
	line "vào kẹp tóc mỗi"
	cont "tháng."
	done

KimonoGirlKuniSeenText:
	text "Ồ, bạn là HLV dễ"
	line "thương. Muốn đấu"
	cont "không?"
	done

KimonoGirlKuniBeatenText:
	text "Bạn mạnh hơn"
	line "vẻ ngoài đấy."
	done

KimonoGirlKuniAfterBattleText:
	text "Tôi luyện nhiều,"
	line "nên nghĩ tôi là"

	para "HLV giỏi."
	line "Có vẻ không phải."
	done

KimonoGirlMikiSeenText:
	text "Bạn thích điệu"
	line "nhảy của tôi?"
	cont "Tôi giỏi #MON."
	done

KimonoGirlMikiBeatenText:
	text "Ôi, bạn giỏi"
	line "#MON quá."
	done

KimonoGirlMikiAfterBattleText:
	text "Tôi có thể tiếp"
	line "tục nhảy vì có"

	para "người thích những"
	line "gì tôi làm."

	para "#MON giúp tôi"
	line "tinh thần tốt."
	done

SurfGuyNeverLeftAScratchText:
	text "Các CÔ GÁI KIMONO"
	line "không chỉ nhảy"

	para "giỏi, họ còn có kỹ"
	line "năng #MON."

	para "Tôi luôn thách đấu"
	line "họ, nhưng chưa"

	para "từng làm trầy xước"
	line "gì cả…"
	done

SurfGuyLadGiftText:
	text "Này cậu! Nếu đánh"
	line "bại hết các CÔ GÁI"

	para "KIMONO, tôi sẽ"
	line "tặng quà cho."
	done

SurfGuyLassieGiftText:
	text "Này cô! Nếu đánh"
	line "bại hết các CÔ GÁI"

	para "KIMONO, tôi sẽ"
	line "tặng quà cho."
	done

SurfGuyLikeADanceText:
	text "Cách bạn chiến"
	line "đấu, như đang xem"
	cont "điệu nhảy vậy."

	para "Thật hiếm để được"
	line "thấy điều này!"

	para "Tôi muốn tặng bạn"
	line "thứ này. Cứ nhận"
	cont "đi!"
	done

SurfGuySurfExplanationText:
	text "Đó là LƯỚT SÓNG."

	para "Đó là chiêu cho"
	line "#MON bơi qua"
	cont "nước."
	done

SurfGuyElegantKimonoGirlsText:
	text "Ước gì #MON"
	line "của tôi thanh"
	cont "nhã như CÔ GÁI"
	cont "KIMONO…"
	done

RhydonText:
	text "RHYDON: Gugooh"
	line "gugogooh!"
	done

DanceTheaterCooltrainerMText:
	text "Người đàn ông đó"
	line "luôn cùng RHYDON."

	para "Nói muốn #MON"
	line "có thể LƯỚT SÓNG"
	cont "và nhảy múa."

	para "Anh ấy đang thử"
	line "tạo #MON bơi"
	cont "nghệ thuật à?"
	done

DanceTheaterGrannyText:
	text "Các CÔ GÁI KIMONO"
	line "rất xinh đẹp…"

	para "Nhưng họ phải trải"
	line "qua huấn luyện"
	cont "nghiêm khắc."

	para "Và phải học theo"
	line "phong tục trước"

	para "khi xuất hiện"
	line "trước công chúng."

	para "Nhưng nếu yêu một"
	line "thứ, mọi thứ đều"
	cont "có thể."
	done

DanceTheaterFancyPanelText:
	text "Đó là tấm bảng"
	line "sang trọng được"
	cont "trang trí hoa."
	done

DanceTheater_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 13, ECRUTEAK_CITY, 8
	warp_event  6, 13, ECRUTEAK_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  5,  6, BGEVENT_UP, DanceTheaterFancyPanel
	bg_event  6,  6, BGEVENT_UP, DanceTheaterFancyPanel

	def_object_events
	object_event  0,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlNaoko, -1
	object_event  2,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlSayo, -1
	object_event  6,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlZuki, -1
	object_event  9,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlKuni, -1
	object_event 11,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlMiki, -1
	object_event  7, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheaterSurfGuy, -1
	object_event  6,  8, SPRITE_RHYDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DanceTheaterRhydon, -1
	object_event 10, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DanceTheaterCooltrainerMScript, -1
	object_event  3,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheaterGrannyScript, -1
