	object_const_def
	const DRAGONSDENB1F_POKE_BALL1
	const DRAGONSDENB1F_CLAIR
	const DRAGONSDENB1F_RIVAL
	const DRAGONSDENB1F_COOLTRAINER_M
	const DRAGONSDENB1F_COOLTRAINER_F
	const DRAGONSDENB1F_TWIN1
	const DRAGONSDENB1F_TWIN2
	const DRAGONSDENB1F_POKE_BALL2
	const DRAGONSDENB1F_POKE_BALL3

DragonsDenB1F_MapScripts:
	def_scene_scripts
	scene_script DragonsDenB1FNoop1Scene, SCENE_DRAGONSDENB1F_NOOP
	scene_script DragonsDenB1FNoop2Scene, SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM

	def_callbacks
	callback MAPCALLBACK_NEWMAP, DragonsDenB1FCheckRivalCallback

DragonsDenB1FNoop1Scene:
	end

DragonsDenB1FNoop2Scene:
	end

DragonsDenB1FCheckRivalCallback:
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iftrue .CheckDay
	disappear DRAGONSDENB1F_RIVAL
	endcallback

.CheckDay:
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .AppearRival
	ifequal THURSDAY, .AppearRival
	disappear DRAGONSDENB1F_RIVAL
	endcallback

.AppearRival:
	appear DRAGONSDENB1F_RIVAL
	endcallback

DragonsDenB1F_ClairScene:
; BUG: Clair can give TM24 Dragonbreath twice (see docs/bugs_and_glitches.md)
	appear DRAGONSDENB1F_CLAIR
	opentext
	writetext ClairText_Wait
	pause 30
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, LEFT
	playmusic MUSIC_CLAIR
	applymovement DRAGONSDENB1F_CLAIR, MovementDragonsDen_ClairWalksToYou
	opentext
	writetext ClairText_GiveDragonbreathDragonDen
	promptbutton
	giveitem TM_DRAGONBREATH
	iffalse .BagFull
	getitemname STRING_BUFFER_3, TM_DRAGONBREATH
	writetext Text_ReceivedTM24
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_TM24_DRAGONBREATH
	writetext ClairText_DescribeDragonbreathDragonDen
	promptbutton
	writetext ClairText_WhatsTheMatterDragonDen
	waitbutton
	closetext
	sjump .FinishClair

.BagFull:
	writetext ClairText_NoRoom
	waitbutton
	closetext
.FinishClair:
	applymovement DRAGONSDENB1F_CLAIR, MovementDragonsDen_ClairWalksAway
	special FadeOutMusic
	pause 30
	special RestartMapMusic
	disappear DRAGONSDENB1F_CLAIR
	setscene SCENE_DRAGONSDENB1F_NOOP
	end

TrainerCooltrainermDarin:
	trainer COOLTRAINERM, DARIN, EVENT_BEAT_COOLTRAINERM_DARIN, CooltrainermDarinSeenText, CooltrainermDarinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermDarinAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfCara:
	trainer COOLTRAINERF, CARA, EVENT_BEAT_COOLTRAINERF_CARA, CooltrainerfCaraSeenText, CooltrainerfCaraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfCaraAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsLeaandpia1:
	trainer TWINS, LEAANDPIA1, EVENT_BEAT_TWINS_LEA_AND_PIA, TwinsLeaandpia1SeenText, TwinsLeaandpia1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsLeaandpia1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsLeaandpia2:
	trainer TWINS, LEAANDPIA1, EVENT_BEAT_TWINS_LEA_AND_PIA, TwinsLeaandpia2SeenText, TwinsLeaandpia2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsLeaandpia2AfterBattleText
	waitbutton
	closetext
	end

DragonsDenB1FDragonFangScript:
; This whole script is written out rather than as an itemball
; because it's left over from the GS event.
	giveitem DRAGON_FANG
	iffalse .BagFull
	disappear DRAGONSDENB1F_POKE_BALL1
	opentext
	getitemname STRING_BUFFER_3, DRAGON_FANG
	writetext Text_FoundDragonFang
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

.BagFull:
	opentext
	getitemname STRING_BUFFER_3, DRAGON_FANG
	writetext Text_FoundDragonFang
	promptbutton
	writetext Text_NoRoomForDragonFang
	waitbutton
	closetext
	end

DragonsDenB1FRivalScript:
	playmusic MUSIC_RIVAL_ENCOUNTER
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .RivalTalkAgain
	writetext RivalText_Training1
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	special RestartMapMusic
	end

.RivalTalkAgain:
	writetext RivalText_Training2
	waitbutton
	closetext
	special RestartMapMusic
	end

DragonShrineSignpost:
	jumptext DragonShrineSignpostText

DragonsDenB1FCalcium:
	itemball CALCIUM

DragonsDenB1FMaxElixer:
	itemball MAX_ELIXER

DragonsDenB1FHiddenRevive:
	hiddenitem REVIVE, EVENT_DRAGONS_DEN_B1F_HIDDEN_REVIVE

DragonsDenB1FHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_POTION

DragonsDenB1FHiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_ELIXER

MovementDragonsDen_ClairWalksToYou:
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	step_end

MovementDragonsDen_ClairWalksAway:
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	step_end

ClairText_Wait:
	text "Đợi đã!"
	done

ClairText_GiveDragonbreathDragonDen:
	text "CLAIR: Ta xin lỗi"
	line "về chuyện này."

	para "Đây, cầm lấy như"
	line "lời xin lỗi."
	done

Text_ReceivedTM24:
	text "<PLAYER> đã nhận"
	line "TM24."
	done

ClairText_DescribeDragonbreathDragonDen:
	text "Đó chứa"
	line "HƠI RỒNG."

	para "Không, nó chẳng"
	line "liên quan gì đến"
	cont "hơi thở của ta."

	para "Nếu ngươi không"
	line "muốn, không cần"
	cont "phải nhận."
	done

ClairText_NoRoom:
	text "Ồ? Ngươi không còn"
	line "chỗ cho thứ này."

	para "Ta sẽ về GYM, hãy"
	line "dọn chỗ rồi đến"

	para "gặp ta ở đó."
	done

ClairText_WhatsTheMatterDragonDen:
	text "CLAIR: Sao vậy?"
	line "Ngươi không đi"

	para "HỘI LIÊN ĐOÀN"
	line "#MON sao?"

	para "Ngươi biết đường"
	line "đến đó không?"

	para "Từ đây, hãy đến"
	line "THỊ TRẤN NEW BARK."

	para "Rồi LƯỚT SÓNG về"
	line "đông đến HỘI LIÊN"
	cont "ĐOÀN #MON."

	para "Đường đi rất"
	line "gian nan."

	para "Đừng có dám thua"
	line "ở HỘI LIÊN ĐOÀN"
	cont "#MON!"

	para "Nếu ngươi thua,"
	line "ta sẽ còn khó"

	para "chịu hơn vì đã"
	line "thua ngươi!"

	para "Hãy cố hết sức"
	line "mình."
	done

DragonShrineSignpostText:
	text "MIẾU THỜ RỒNG"

	para "Miếu thờ tôn vinh"
	line "#MON rồng"

	para "tương truyền sống"
	line "ở HANG RỒNG."
	done

RivalText_Training1:
	text "…"
	line "Gì? <PLAYER>?"

	para "…Không, tao sẽ"
	line "không đấu giờ…"

	para "#MON của tao"
	line "chưa sẵn sàng"
	cont "đánh bại mày."

	para "Tao không thể ép"
	line "chúng quá mức."

	para "Tao phải kỷ luật"
	line "để trở thành HLV"

	para "#MON giỏi"
	line "nhất…"
	done

RivalText_Training2:
	text "…"

	para "Phù…"

	para "Học cách tránh"
	line "xa tao đi…"
	done

CooltrainermDarinSeenText:
	text "Ngươi! Sao dám"
	line "vào không mời!"
	done

CooltrainermDarinBeatenText:
	text "M-mạnh quá!"
	done

CooltrainermDarinAfterBattleText:
	text "MIẾU phía trước"
	line "là nơi ở của"

	para "BẬC THẦY gia tộc"
	line "dùng rồng."

	para "Ngươi không được"
	line "phép vào!"
	done

CooltrainerfCaraSeenText:
	text "Ngươi không nên"
	line "ở đây!"
	done

CooltrainerfCaraBeatenText:
	text "Ôi, tôi thua rồi!"
	done

CooltrainerfCaraAfterBattleText:
	text "Sớm thôi tôi sẽ"
	line "được BẬC THẦY cho"

	para "phép dùng rồng."

	para "Khi đó, tôi sẽ"
	line "trở thành HLV"

	para "rồng đáng ngưỡng"
	line "mộ và được"

	para "BẬC THẦY công"
	line "nhận."
	done

TwinsLeaandpia1SeenText:
	text "Đó là người lạ"
	line "bọn mình không"
	cont "biết."
	done

TwinsLeaandpia1BeatenText:
	text "Đau quá."
	done

TwinsLeaandpia1AfterBattleText:
	text "Như phải đấu với"
	line "LANCE vậy."
	done

TwinsLeaandpia2SeenText:
	text "Bạn là ai?"
	done

TwinsLeaandpia2BeatenText:
	text "Ác quá."
	done

TwinsLeaandpia2AfterBattleText:
	text "Bọn mình sẽ mách."

	para "BẬC THẦY sẽ giận"
	line "bạn đấy."
	done

Text_FoundDragonFang:
	text "<PLAYER> tìm thấy"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

Text_NoRoomForDragonFang:
	text "Nhưng <PLAYER>"
	line "không mang thêm"
	cont "đồ được."
	done

DragonsDenB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 20,  3, DRAGONS_DEN_1F, 3
	warp_event 19, 29, DRAGON_SHRINE, 1

	def_coord_events
	coord_event 19, 30, SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM, DragonsDenB1F_ClairScene

	def_bg_events
	bg_event 18, 24, BGEVENT_READ, DragonShrineSignpost
	bg_event 33, 29, BGEVENT_ITEM, DragonsDenB1FHiddenRevive
	bg_event 21, 17, BGEVENT_ITEM, DragonsDenB1FHiddenMaxPotion
	bg_event 31, 15, BGEVENT_ITEM, DragonsDenB1FHiddenMaxElixer

	def_object_events
	object_event 35, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonsDenB1FDragonFangScript, EVENT_DRAGONS_DEN_B1F_DRAGON_FANG
	object_event 14, 30, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DRAGONS_DEN_CLAIR
	object_event 20, 23, SPRITE_RIVAL, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonsDenB1FRivalScript, EVENT_RIVAL_DRAGONS_DEN
	object_event 20,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainermDarin, -1
	object_event  8,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfCara, -1
	object_event  4, 17, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsLeaandpia1, -1
	object_event  4, 18, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsLeaandpia2, -1
	object_event 30,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DragonsDenB1FCalcium, EVENT_DRAGONS_DEN_B1F_CALCIUM
	object_event  5, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DragonsDenB1FMaxElixer, EVENT_DRAGONS_DEN_B1F_MAX_ELIXER
