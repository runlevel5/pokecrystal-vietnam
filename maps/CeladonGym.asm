	object_const_def
	const CELADONGYM_ERIKA
	const CELADONGYM_LASS1
	const CELADONGYM_LASS2
	const CELADONGYM_BEAUTY
	const CELADONGYM_TWIN1
	const CELADONGYM_TWIN2

CeladonGym_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonGymErikaScript:
	faceplayer
	opentext
	checkflag ENGINE_RAINBOWBADGE
	iftrue .FightDone
	writetext ErikaBeforeBattleText
	waitbutton
	closetext
	winlosstext ErikaBeatenText, 0
	loadtrainer ERIKA, ERIKA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ERIKA
	setevent EVENT_BEAT_LASS_MICHELLE
	setevent EVENT_BEAT_PICNICKER_TANYA
	setevent EVENT_BEAT_BEAUTY_JULIA
	setevent EVENT_BEAT_TWINS_JO_AND_ZOE
	opentext
	writetext PlayerReceivedRainbowBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_RAINBOWBADGE
.FightDone:
	checkevent EVENT_GOT_TM19_GIGA_DRAIN
	iftrue .GotGigaDrain
	writetext ErikaExplainTMText
	promptbutton
	verbosegiveitem TM_GIGA_DRAIN
	iffalse .GotGigaDrain
	setevent EVENT_GOT_TM19_GIGA_DRAIN
.GotGigaDrain:
	writetext ErikaAfterBattleText
	waitbutton
	closetext
	end

TrainerLassMichelle:
	trainer LASS, MICHELLE, EVENT_BEAT_LASS_MICHELLE, LassMichelleSeenText, LassMichelleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassMichelleAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerTanya:
	trainer PICNICKER, TANYA, EVENT_BEAT_PICNICKER_TANYA, PicnickerTanyaSeenText, PicnickerTanyaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerTanyaAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyJulia:
	trainer BEAUTY, JULIA, EVENT_BEAT_BEAUTY_JULIA, BeautyJuliaSeenText, BeautyJuliaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyJuliaAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsJoAndZoe1:
	trainer TWINS, JOANDZOE1, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoAndZoe1SeenText, TwinsJoAndZoe1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsJoAndZoe1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsJoAndZoe2:
	trainer TWINS, JOANDZOE2, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoAndZoe2SeenText, TwinsJoAndZoe2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsJoAndZoe2AfterBattleText
	waitbutton
	closetext
	end

CeladonGymStatue:
	checkflag ENGINE_RAINBOWBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, ERIKA, ERIKA1
	jumpstd GymStatue2Script

ErikaBeforeBattleText:
	text "ERIKA: Xin chào…"
	line "Thời tiết đẹp"

	para "quá, phải không?"
	line "Thật dễ chịu…"

	para "…Ta e rằng ta"
	line "sắp ngủ gật mất…"

	para "Ta tên ERIKA."
	line "Ta là THỦ LĨNH GYM"
	cont "CELADON."

	para "…Ồ? Ngươi đến từ"
	line "tận JOHTO sao?"
	cont "Thật tuyệt…"

	para "Ồ. Xin lỗi, ta"
	line "không nhận ra"

	para "ngươi muốn thách"
	line "đấu với ta."

	para "Được thôi, nhưng"
	line "ta sẽ không thua."
	done

ErikaBeatenText:
	text "ERIKA: Ôi!"
	line "Ta chịu thua…"

	para "Ngươi thật sự"
	line "rất mạnh…"

	para "Ta sẽ trao cho"
	line "ngươi HC RAINBOW"
	done

PlayerReceivedRainbowBadgeText:
	text "<PLAYER> nhận được"
	line "HC RAINBOW."
	done

ErikaExplainTMText:
	text "ERIKA: Đó là một"
	line "trận đấu thú vị."

	para "Ta cảm thấy được"
	line "truyền cảm hứng."

	para "Xin hãy nhận TM"
	line "này."

	para "Đó là SIÊU HÚT."

	para "Đây là chiêu tuyệt"
	line "vời hút nửa sát"

	para "thương gây ra để"
	line "hồi máu #MON"
	cont "của ngươi."

	para "Hãy dùng nó nếu"
	line "ngươi thích…"
	done

ErikaAfterBattleText:
	text "ERIKA: Thua cuộc"
	line "để lại dư vị"
	cont "đắng…"

	para "Nhưng biết rằng"
	line "có những HLV"

	para "mạnh thúc đẩy ta"
	line "cố gắng hơn…"
	done

LassMichelleSeenText:
	text "Bạn nghĩ GYM toàn"
	line "nữ là hiếm sao?"
	done

LassMichelleBeatenText:
	text "Ôi, tệ quá!"
	done

LassMichelleAfterBattleText:
	text "Tôi chỉ bất cẩn"
	line "thôi, có vậy!"
	done

PicnickerTanyaSeenText:
	text "Ồ, đấu hả?"
	line "Hơi đáng sợ,"
	cont "nhưng được!"
	done

PicnickerTanyaBeatenText:
	text "Ồ, vậy thôi à?"
	done

PicnickerTanyaAfterBattleText:
	text "Ồ, nhìn tất cả"
	line "HUY HIỆU của bạn."

	para "Không lạ gì tôi"
	line "không thắng nổi!"
	done

BeautyJuliaSeenText:
	text "Bạn đang nhìn hoa"
	line "hay nhìn tôi?"
	done

BeautyJuliaBeatenText:
	text "Thật khó chịu!"
	done

BeautyJuliaAfterBattleText:
	text "Làm sao để trở"
	line "nên thanh lịch"
	cont "như ERIKA nhỉ?"
	done

TwinsJoAndZoe1SeenText:
	text "Chúng tôi sẽ cho"
	line "bạn xem chiêu"
	cont "ERIKA dạy chúng"
	cont "tôi!"
	done

TwinsJoAndZoe1BeatenText:
	text "Ồ… Thua rồi…"
	done

TwinsJoAndZoe1AfterBattleText:
	text "ERIKA sẽ trả thù"
	line "cho chúng tôi!"
	done

TwinsJoAndZoe2SeenText:
	text "Chúng tôi sẽ bảo"
	line "vệ ERIKA!"
	done

TwinsJoAndZoe2BeatenText:
	text "Không thắng nổi…"
	done

TwinsJoAndZoe2AfterBattleText:
	text "ERIKA còn mạnh"
	line "hơn nhiều!"
	done

CeladonGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, CELADON_CITY, 8
	warp_event  5, 17, CELADON_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, CeladonGymStatue
	bg_event  6, 15, BGEVENT_READ, CeladonGymStatue

	def_object_events
	object_event  5,  3, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGymErikaScript, -1
	object_event  7,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassMichelle, -1
	object_event  2,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerTanya, -1
	object_event  3,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBeautyJulia, -1
	object_event  4, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsJoAndZoe1, -1
	object_event  5, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsJoAndZoe2, -1
