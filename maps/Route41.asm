	object_const_def
	const ROUTE41_OLIVINE_RIVAL1
	const ROUTE41_OLIVINE_RIVAL2
	const ROUTE41_OLIVINE_RIVAL3
	const ROUTE41_OLIVINE_RIVAL4
	const ROUTE41_OLIVINE_RIVAL5
	const ROUTE41_SWIMMER_GIRL1
	const ROUTE41_SWIMMER_GIRL2
	const ROUTE41_SWIMMER_GIRL3
	const ROUTE41_SWIMMER_GIRL4
	const ROUTE41_SWIMMER_GIRL5

Route41_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerSwimmerfKaylee:
	trainer SWIMMERF, KAYLEE, EVENT_BEAT_SWIMMERF_KAYLEE, SwimmerfKayleeSeenText, SwimmerfKayleeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKayleeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfSusie:
	trainer SWIMMERF, SUSIE, EVENT_BEAT_SWIMMERF_SUSIE, SwimmerfSusieSeenText, SwimmerfSusieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfSusieAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfDenise:
	trainer SWIMMERF, DENISE, EVENT_BEAT_SWIMMERF_DENISE, SwimmerfDeniseSeenText, SwimmerfDeniseBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDeniseAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfKara:
	trainer SWIMMERF, KARA, EVENT_BEAT_SWIMMERF_KARA, SwimmerfKaraSeenText, SwimmerfKaraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKaraAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfWendy:
	trainer SWIMMERF, WENDY, EVENT_BEAT_SWIMMERF_WENDY, SwimmerfWendySeenText, SwimmerfWendyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfWendyAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermCharlie:
	trainer SWIMMERM, CHARLIE, EVENT_BEAT_SWIMMERM_CHARLIE, SwimmermCharlieSeenText, SwimmermCharlieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCharlieAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermGeorge:
	trainer SWIMMERM, GEORGE, EVENT_BEAT_SWIMMERM_GEORGE, SwimmermGeorgeSeenText, SwimmermGeorgeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermGeorgeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermBerke:
	trainer SWIMMERM, BERKE, EVENT_BEAT_SWIMMERM_BERKE, SwimmermBerkeSeenText, SwimmermBerkeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermBerkeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermKirk:
	trainer SWIMMERM, KIRK, EVENT_BEAT_SWIMMERM_KIRK, SwimmermKirkSeenText, SwimmermKirkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermKirkAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermMathew:
	trainer SWIMMERM, MATHEW, EVENT_BEAT_SWIMMERM_MATHEW, SwimmermMathewSeenText, SwimmermMathewBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermMathewAfterBattleText
	waitbutton
	closetext
	end

Route41Rock: ; unreferenced
	jumpstd SmashRockScript

Route41HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_41_HIDDEN_MAX_ETHER

SwimmermCharlieSeenText:
	text "Nước ở đây ấm. Tôi"
	line "thả lỏng và linh"
	cont "hoạt."

	para "Chắc chắn, tôi sẽ"
	line "đấu với bạn!"
	done

SwimmermCharlieBeatenText:
	text "Yikes! Da tôi nhăn"
	line "nhúm rồi!"
	done

SwimmermCharlieAfterBattleText:
	text "Nổi như thế này có"
	line "thư giãn không?"
	done

SwimmermGeorgeSeenText:
	text "Tôi hơi mệt. Nếu"
	line "tôi thắng, cho tôi"
	cont "mượn #MON."
	done

SwimmermGeorgeBeatenText:
	text "Hổn hển, hổn…"
	done

SwimmermGeorgeAfterBattleText:
	text "CIANWOOD quá xa."

	para "Nhưng quay về"
	line "OLIVINE cũng không"
	cont "dễ."

	para "Tôi nên làm sao?"
	done

SwimmermBerkeSeenText:
	text "Thấy những hòn đảo"
	line "bị chặn bởi xoáy"
	cont "nước không?"

	para "Chắc chắn phải có"
	line "bí mật!"
	done

SwimmermBerkeBeatenText:
	text "Bí mật sức mạnh"
	line "của bạn là gì?"
	done

SwimmermBerkeAfterBattleText:
	text "Đó là một đêm tối"
	line "và có bão…"

	para "Tôi thấy #MON"
	line "khổng lồ bay từ"
	cont "đảo ra."

	para "Nó rải lông vũ từ"
	line "đôi cánh bạc."
	done

SwimmermKirkSeenText:
	text "Sóng ở đây hung dữ"

	para "Chúng làm bạn mệt"
	line "khi bơi."
	done

SwimmermKirkBeatenText:
	text "Tôi kiệt sức!"
	done

SwimmermKirkAfterBattleText:
	text "Dòng chảy ngăn tôi"
	line "đến đảo kia."
	done

SwimmermMathewSeenText:
	text "Bạn đang tìm kiếm"
	line "bí mật của Q.ĐẢO"
	cont "WHIRL?"
	done

SwimmermMathewBeatenText:
	text "Ooh, bạn có sức"
	line "bền tuyệt vời!"
	done

SwimmermMathewAfterBattleText:
	text "Bí mật về Q.ĐẢO"
	line "WHIRL…"

	para "Bên trong tối mù"
	line "mịt!"
	done

SwimmerfKayleeSeenText:
	text "Tôi đang trên"
	line "đường đến Q.ĐẢO"
	cont "WHIRL."

	para "Tôi đi khám phá"
	line "với bạn bè."
	done

SwimmerfKayleeBeatenText:
	text "Bạn làm thế à?"
	done

SwimmerfKayleeAfterBattleText:
	text "Nghe nói có #-"
	line "MON lớn ở sâu"
	cont "dưới Q.ĐẢO WHIRL."

	para "Tôi tò mò nó là"
	line "gì?"
	done

SwimmerfSusieSeenText:
	text "Bạn trông thanh"
	line "lịch, cưỡi #MON"
	cont "như vậy."
	done

SwimmerfSusieBeatenText:
	text "Tôi bị nghiền…"
	done

SwimmerfSusieAfterBattleText:
	text "Có bài hát hit về"
	line "cậu bé cưỡi"
	cont "LAPRAS phải không?"
	done

SwimmerfDeniseSeenText:
	text "Thời tiết đẹp quá,"
	line "tôi như bị mê"
	cont "mẩn!"
	done

SwimmerfDeniseBeatenText:
	text "Ohhh!"
	done

SwimmerfDeniseAfterBattleText:
	text "Cháy nắng là tệ"
	line "nhất cho da."

	para "Nhưng tôi không"
	line "dùng kem chống"
	cont "nắng."

	para "Tôi không muốn"
	line "làm ô nhiễm nước."
	done

SwimmerfKaraSeenText:
	text "Nếu cần nghỉ, chỉ"
	line "cần lặn nước."

	para "Bạn sẽ lấy lại"
	line "hơi, vì vậy bạn"

	para "có thể tiếp tục"
	line "mạnh mẽ."
	done

SwimmerfKaraBeatenText:
	text "Oh! Bạn nhiều năng"
	line "lượng hơn tôi."
	done

SwimmerfKaraAfterBattleText:
	text "Tôi nghe tiếng gầm"
	line "từ sâu bên trong"
	cont "ĐẢO."
	done

SwimmerfWendySeenText:
	text "Ban đêm, STARYU"
	line "tụ họp gần mặt"
	cont "nước."
	done

SwimmerfWendyBeatenText:
	text "Oh, trời…"
	done

SwimmerfWendyAfterBattleText:
	text "Cụm STARYU sáng"
	line "lên cùng lúc."

	para "Nó đẹp đến mức"
	line "đáng sợ."
	done

Route41_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 12, 17, WHIRL_ISLAND_NW, 1
	warp_event 36, 19, WHIRL_ISLAND_NE, 1
	warp_event 12, 37, WHIRL_ISLAND_SW, 1
	warp_event 36, 45, WHIRL_ISLAND_SE, 1

	def_coord_events

	def_bg_events
	bg_event  9, 35, BGEVENT_ITEM, Route41HiddenMaxEther

	def_object_events
	object_event 32,  6, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCharlie, -1
	object_event 46,  8, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermGeorge, -1
	object_event 20, 26, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermBerke, -1
	object_event 32, 30, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermKirk, -1
	object_event 19, 46, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermMathew, -1
	object_event 17,  4, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfKaylee, -1
	object_event 23, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfSusie, -1
	object_event 27, 34, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDenise, -1
	object_event 44, 28, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfKara, -1
	object_event  9, 50, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerSwimmerfWendy, -1
