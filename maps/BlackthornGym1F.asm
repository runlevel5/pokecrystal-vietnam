	object_const_def
	const BLACKTHORNGYM1F_CLAIR
	const BLACKTHORNGYM1F_COOLTRAINER_M1
	const BLACKTHORNGYM1F_COOLTRAINER_M2
	const BLACKTHORNGYM1F_COOLTRAINER_F
	const BLACKTHORNGYM1F_GYM_GUIDE

BlackthornGym1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, BlackthornGym1FBouldersCallback

BlackthornGym1FBouldersCallback:
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_1
	iffalse .skip1
	changeblock 8, 2, $3b ; fallen boulder 2
.skip1
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_2
	iffalse .skip2
	changeblock 2, 4, $3a ; fallen boulder 1
.skip2
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_3
	iffalse .skip3
	changeblock 8, 6, $3b ; fallen boulder 2
.skip3
	endcallback

BlackthornGymClairScript:
	faceplayer
	opentext
	checkflag ENGINE_RISINGBADGE
	iftrue .AlreadyGotBadge
	checkevent EVENT_BEAT_CLAIR
	iftrue .FightDone
	writetext ClairIntroText
	waitbutton
	closetext
	winlosstext ClairWinText, 0
	loadtrainer CLAIR, CLAIR1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CLAIR
	opentext
	writetext ClairText_GoToDragonsDen
	waitbutton
	closetext
	setevent EVENT_BEAT_COOLTRAINERM_PAUL
	setevent EVENT_BEAT_COOLTRAINERM_CODY
	setevent EVENT_BEAT_COOLTRAINERM_MIKE
	setevent EVENT_BEAT_COOLTRAINERF_FRAN
	setevent EVENT_BEAT_COOLTRAINERF_LOLA
	clearevent EVENT_MAHOGANY_MART_OWNERS
	setevent EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	clearevent EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	end

.FightDone:
	writetext ClairText_TooMuchToExpect
	waitbutton
	closetext
	end

.AlreadyGotBadge:
	checkevent EVENT_GOT_TM24_DRAGONBREATH
	iftrue .GotTM24
	writetext BlackthornGymClairText_YouKeptMeWaiting
	promptbutton
	giveitem TM_DRAGONBREATH
	iffalse .BagFull
	getitemname STRING_BUFFER_3, TM_DRAGONBREATH
	writetext BlackthornGymText_ReceivedTM24
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_TM24_DRAGONBREATH
	writetext BlackthornGymClairText_DescribeTM24
	promptbutton
	sjump .GotTM24

.BagFull:
	writetext BlackthornGymClairText_BagFull
	waitbutton
	closetext
	end

.GotTM24:
	writetext BlackthornGymClairText_League
	waitbutton
	closetext
	end

TrainerCooltrainermPaul:
	trainer COOLTRAINERM, PAUL, EVENT_BEAT_COOLTRAINERM_PAUL, CooltrainermPaulSeenText, CooltrainermPaulBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermPaulAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermMike:
	trainer COOLTRAINERM, MIKE, EVENT_BEAT_COOLTRAINERM_MIKE, CooltrainermMikeSeenText, CooltrainermMikeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermMikeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfLola:
	trainer COOLTRAINERF, LOLA, EVENT_BEAT_COOLTRAINERF_LOLA, CooltrainerfLolaSeenText, CooltrainerfLolaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfLolaAfterBattleText
	waitbutton
	closetext
	end

BlackthornGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CLAIR
	iftrue .BlackthornGymGuideWinScript
	writetext BlackthornGymGuideText
	waitbutton
	closetext
	end

.BlackthornGymGuideWinScript:
	writetext BlackthornGymGuideWinText
	waitbutton
	closetext
	end

BlackthornGymStatue:
	checkflag ENGINE_RISINGBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, CLAIR, CLAIR1
	jumpstd GymStatue2Script

ClairIntroText:
	text "Ta là CLAIR."

	para "Bậc thầy rồng"
	line "giỏi nhất thế"
	cont "giới."

	para "Ta có thể sánh"
	line "ngang TỨ ĐẠI"

	para "của LIÊN ĐOÀN"
	line "#MON."

	para "Ngươi vẫn muốn"
	line "thách đấu ta?"

	para "…Được thôi."
	line "Bắt đầu nào!"

	para "Là một T.LĨNH"
	line "GYM, ta sẽ dùng"

	para "toàn bộ sức mạnh"
	line "với mọi đối thủ!"
	done

ClairWinText:
	text "Ta thua?"

	para "Không thể tin"
	line "được. Chắc hẳn"
	cont "có sự nhầm lẫn…"
	done

ClairText_GoToDragonsDen:
	text "Ta không công"
	line "nhận điều này."

	para "Ta có thể đã"
	line "thua, nhưng ngươi"

	para "vẫn chưa sẵn sàng"
	line "cho LIÊN ĐOÀN"
	cont "#MON."

	para "Ta biết rồi."
	line "Ngươi nên thử"

	para "thách thức của"
	line "người dùng rồng."

	para "Phía sau GYM này"
	line "là một nơi gọi"
	cont "là HANG RỒNG."

	para "Có một ngôi đền"
	line "nhỏ ở trung tâm."

	para "Hãy đến đó."

	para "Nếu ngươi chứng"
	line "minh được rằng"

	para "mình đã bỏ những"
	line "lý tưởng lười"
	cont "biếng,"

	para "ta sẽ công nhận"
	line "ngươi là HLV xứng"
	cont "đáng với HUY"
	cont "HIỆU GYM!"
	done

ClairText_TooMuchToExpect:
	text "Có chuyện gì?"

	para "Quá khó cho"
	line "ngươi sao?"
	done

BlackthornGymClairText_YouKeptMeWaiting:
	text "Ngươi để ta chờ"
	line "lâu quá!"

	para "Đây! Cầm lấy!"
	done

BlackthornGymText_ReceivedTM24:
	text "<PLAYER> nhận được"
	line "TM24."
	done

BlackthornGymClairText_DescribeTM24:
	text "Trong đó chứa"
	line "HƠI RỒNG."

	para "Không, nó chẳng"
	line "liên quan gì đến"
	cont "hơi thở của ta."

	para "Nếu ngươi không"
	line "muốn thì không"
	cont "cần phải nhận."
	done

BlackthornGymClairText_BagFull:
	text "Cái gì? Ngươi"
	line "không có chỗ à?"
	done

BlackthornGymClairText_League:
	text "Có chuyện gì vậy?"

	para "Ngươi không đi"
	line "đến LIÊN ĐOÀN"
	cont "#MON à?"

	para "Ngươi không biết"
	line "nó ở đâu sao?"

	para "Từ đây, hãy đi"
	line "đến THÔN NEW BARK"

	para "Rồi LƯỚT SÓNG về"
	line "phía đông. Đường"
	cont "đi rất gian nan."

	para "Đừng có dám thua"
	line "ở LIÊN ĐOÀN"
	cont "#MON!"

	para "Nếu ngươi thua,"
	line "ta sẽ còn cảm"

	para "thấy tệ hơn vì"
	line "đã thua ngươi!"

	para "Hãy cố gắng hết"
	line "sức mình."
	done

CooltrainermPaulSeenText:
	text "Lần đầu đấu với"
	line "rồng à?"

	para "Để tôi cho cậu"
	line "thấy chúng mạnh"
	cont "thế nào!"
	done

CooltrainermPaulBeatenText:
	text "#MON rồng của"
	line "tôi thua rồi?"
	done

CooltrainermPaulAfterBattleText:
	text "LANCE nói muốn"
	line "gặp lại cậu ư?"
	cont "Không thể nào!"
	done

CooltrainermMikeSeenText:
	text "Khả năng tôi"
	line "thua? Không có"
	cont "dù chỉ 1%!"
	done

CooltrainermMikeBeatenText:
	text "Lạ thật."
	done

CooltrainermMikeAfterBattleText:
	text "Giờ tôi biết"
	line "điểm yếu của"
	cont "mình rồi."

	para "Cảm ơn cậu đã"
	line "chỉ cho tôi!"
	done

CooltrainerfLolaSeenText:
	text "Rồng là #MON"
	line "linh thiêng."

	para "Chúng tràn đầy"
	line "sinh khí."

	para "Nếu bạn không"
	line "nghiêm túc, bạn"

	para "sẽ không thể"
	line "đánh bại chúng."
	done

CooltrainerfLolaBeatenText:
	text "Giỏi lắm!"
	done

CooltrainerfLolaAfterBattleText:
	text "Rồng yếu trước"
	line "chiêu hệ rồng."
	done

BlackthornGymGuideText:
	text "Chào! NHÀ VÔ ĐỊCH"
	line "tương lai!"

	para "Chặng đường dài"
	line "rồi, nhưng sắp"

	para "xong rồi!"
	line "Tin tôi đi!"

	para "CLAIR dùng #MON"
	line "hệ rồng huyền"
	cont "thoại và linh"
	cont "thiêng."

	para "Bạn không dễ gây"
	line "sát thương cho"
	cont "chúng đâu."

	para "Nhưng mà, chúng"
	line "có vẻ yếu trước"

	para "chiêu hệ băng"
	line "đấy."
	done

BlackthornGymGuideWinText:
	text "Bạn giỏi lắm khi"
	line "thắng CLAIR!"

	para "Chỉ còn thử thách"
	line "LIÊN ĐOÀN #MON"
	cont "nữa thôi."

	para "Bạn đang trên"
	line "đường trở thành"
	cont "NHÀ VÔ ĐỊCH"
	cont "#MON!"
	done

BlackthornGym1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, BLACKTHORN_CITY, 1
	warp_event  5, 17, BLACKTHORN_CITY, 1
	warp_event  1,  7, BLACKTHORN_GYM_2F, 1
	warp_event  7,  9, BLACKTHORN_GYM_2F, 2
	warp_event  2,  6, BLACKTHORN_GYM_2F, 3
	warp_event  7,  7, BLACKTHORN_GYM_2F, 4
	warp_event  7,  6, BLACKTHORN_GYM_2F, 5

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, BlackthornGymStatue
	bg_event  6, 15, BGEVENT_READ, BlackthornGymStatue

	def_object_events
	object_event  5,  3, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornGymClairScript, -1
	object_event  6,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermMike, -1
	object_event  1, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermPaul, -1
	object_event  9,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfLola, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornGymGuideScript, -1
