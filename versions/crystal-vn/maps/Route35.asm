	object_const_def
	const ROUTE35_YOUNGSTER1
	const ROUTE35_YOUNGSTER2
	const ROUTE35_LASS1
	const ROUTE35_LASS2
	const ROUTE35_YOUNGSTER3
	const ROUTE35_FISHER
	const ROUTE35_BUG_CATCHER
	const ROUTE35_SUPER_NERD
	const ROUTE35_OFFICER
	const ROUTE35_FRUIT_TREE
	const ROUTE35_POKE_BALL

Route35_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBirdKeeperBryan:
	trainer BIRD_KEEPER, BRYAN, EVENT_BEAT_BIRD_KEEPER_BRYAN, BirdKeeperBryanSeenText, BirdKeeperBryanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBryanAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerIrwin:
	trainer JUGGLER, IRWIN1, EVENT_BEAT_JUGGLER_IRWIN, JugglerIrwin1SeenText, JugglerIrwin1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_JUGGLER_IRWIN
	endifjustbattled
	opentext
	checkcellnum PHONE_JUGGLER_IRWIN
	iftrue Route35NumberAcceptedM
	checkevent EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext JugglerIrwinAfterBattleText
	promptbutton
	setevent EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
	scall Route35AskNumber1M
	sjump .AskForNumber

.AskedAlready:
	scall Route35AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_JUGGLER_IRWIN
	ifequal PHONE_CONTACTS_FULL, Route35PhoneFullM
	ifequal PHONE_CONTACT_REFUSED, Route35NumberDeclinedM
	gettrainername STRING_BUFFER_3, JUGGLER, IRWIN1
	scall Route35RegisteredNumberM
	sjump Route35NumberAcceptedM

Route35AskNumber1M:
	jumpstd AskNumber1MScript
	end

Route35AskNumber2M:
	jumpstd AskNumber2MScript
	end

Route35RegisteredNumberM:
	jumpstd RegisteredNumberMScript
	end

Route35NumberAcceptedM:
	jumpstd NumberAcceptedMScript
	end

Route35NumberDeclinedM:
	jumpstd NumberDeclinedMScript
	end

Route35PhoneFullM:
	jumpstd PhoneFullMScript
	end

Route35RematchM:
	jumpstd RematchMScript
	end

TrainerCamperIvan:
	trainer CAMPER, IVAN, EVENT_BEAT_CAMPER_IVAN, CamperIvanSeenText, CamperIvanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperIvanAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperElliot:
	trainer CAMPER, ELLIOT, EVENT_BEAT_CAMPER_ELLIOT, CamperElliotSeenText, CamperElliotBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperElliotAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerBrooke:
	trainer PICNICKER, BROOKE, EVENT_BEAT_PICNICKER_BROOKE, PicnickerBrookeSeenText, PicnickerBrookeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerBrookeAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerKim:
	trainer PICNICKER, KIM, EVENT_BEAT_PICNICKER_KIM, PicnickerKimSeenText, PicnickerKimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerKimAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherArnie:
	trainer BUG_CATCHER, ARNIE1, EVENT_BEAT_BUG_CATCHER_ARNIE, BugCatcherArnieSeenText, BugCatcherArnieBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_BUG_CATCHER_ARNIE
	endifjustbattled
	opentext
	checkflag ENGINE_ARNIE_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkflag ENGINE_YANMA_SWARM
	iftrue .YanmaSwarming
	checkcellnum PHONE_BUG_CATCHER_ARNIE
	iftrue Route35NumberAcceptedM
	checkevent EVENT_ARNIE_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext BugCatcherArnieAfterBattleText
	promptbutton
	setevent EVENT_ARNIE_ASKED_FOR_PHONE_NUMBER
	scall Route35AskNumber1M
	sjump .AskForNumber

.AskedAlready:
	scall Route35AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_BUG_CATCHER_ARNIE
	ifequal PHONE_CONTACTS_FULL, Route35PhoneFullM
	ifequal PHONE_CONTACT_REFUSED, Route35NumberDeclinedM
	gettrainername STRING_BUFFER_3, BUG_CATCHER, ARNIE1
	scall Route35RegisteredNumberM
	sjump Route35NumberAcceptedM

.WantsBattle:
	scall Route35RematchM
	winlosstext BugCatcherArnieBeatenText, 0
	readmem wArnieFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
.Fight2:
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer BUG_CATCHER, ARNIE1
	startbattle
	reloadmapafterbattle
	loadmem wArnieFightCount, 1
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer BUG_CATCHER, ARNIE2
	startbattle
	reloadmapafterbattle
	loadmem wArnieFightCount, 2
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer BUG_CATCHER, ARNIE3
	startbattle
	reloadmapafterbattle
	loadmem wArnieFightCount, 3
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer BUG_CATCHER, ARNIE4
	startbattle
	reloadmapafterbattle
	loadmem wArnieFightCount, 4
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer BUG_CATCHER, ARNIE5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.YanmaSwarming:
	writetext BugCatcherArnieYanmaText
	waitbutton
	closetext
	end

TrainerFirebreatherWalt:
	trainer FIREBREATHER, WALT, EVENT_BEAT_FIREBREATHER_WALT, FirebreatherWaltSeenText, FirebreatherWaltBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherWaltAfterBattleText
	waitbutton
	closetext
	end

TrainerOfficerDirk:
	faceplayer
	opentext
	checktime NITE
	iffalse .NotNight
	checkevent EVENT_BEAT_OFFICER_DIRK
	iftrue .AfterBattle
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerDirkSeenText
	waitbutton
	closetext
	winlosstext OfficerDirkBeatenText, 0
	loadtrainer OFFICER, DIRK
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICER_DIRK
	closetext
	end

.AfterBattle:
	writetext OfficerDirkAfterBattleText
	waitbutton
	closetext
	end

.NotNight:
	writetext OfficerDirkPrettyToughText
	waitbutton
	closetext
	end

Route35Sign:
	jumptext Route35SignText

Route35TMRollout:
	itemball TM_ROLLOUT

Route35FruitTree:
	fruittree FRUITTREE_ROUTE_35

CamperIvanSeenText:
	text "Tôi lấy dữ liệu"
	line "#MON từ radio."

	para "Tôi nghĩ mình"
	line "khá giỏi đó."
	done

CamperIvanBeatenText:
	text "Tôi đầu hàng!"
	done

CamperIvanAfterBattleText:
	text "Nhạc trên radio"
	line "thay đổi tâm trạn"
	cont "#MON hoang dã."
	done

CamperElliotSeenText:
	text "Tôi sẽ chứng minh"
	line "với bạn gái tôi"
	cont "thật tài giỏi!"
	done

CamperElliotBeatenText:
	text "Ước gì bạn thua"
	line "cho tôi…"
	done

CamperElliotAfterBattleText:
	text "Tôi bị sỉ nhục"
	line "trước mặt bạn gái"
	cont "của tôi…"
	done

PicnickerBrookeSeenText:
	text "Bạn trai tôi yếu"
	line "nên tôi không thể"
	cont "dựa vào anh ấy."
	done

PicnickerBrookeBeatenText:
	text "Ôi chao! Bạn"
	line "mạnh thật!"
	done

PicnickerBrookeAfterBattleText:
	text "Tôi tin #MON"
	line "hơn bạn trai tôi."
	done

PicnickerKimSeenText:
	text "Bạn đến GYM à?"
	line "Tôi cũng thế!"
	done

PicnickerKimBeatenText:
	text "Ôi. Tôi không thể"
	line "thắng…"
	done

PicnickerKimAfterBattleText:
	text "HUY HIỆU GYM thật"
	line "đẹp. Tôi sưu tập"
	cont "chúng."
	done

BirdKeeperBryanSeenText:
	text "Bạn dùng loại"
	line "BÓNG nào?"
	done

BirdKeeperBryanBeatenText:
	text "Chà! Không đủ"
	line "nhanh!"
	done

BirdKeeperBryanAfterBattleText:
	text "Một số #MON bỏ"
	line "chạy ngay lập tức"

	para "Hãy thử bắt chúng"
	line "với BÓNG NHANH"
	cont "của KURT."

	para "Khi tôi tìm thấy"
	line "MƠ TRẮNG, tôi"
	cont "đưa cho KURT."

	para "Ông ấy biến nó"
	line "thành BÓNG đặc bệ"
	done

JugglerIrwin1SeenText:
	text "Hãy xem khéo léo"
	line "tung BÓNG của tôi"
	done

JugglerIrwin1BeatenText:
	text "Phù! Sốc quá!"
	done

JugglerIrwinAfterBattleText:
	text "Tôi định làm bạn"
	line "kinh ngạc với con"
	cont "#MON cưng."

	para "Nhưng kỹ năng của"
	line "bạn điện tôi rồi!"
	done

BugCatcherArnieSeenText:
	text "Tôi sẽ đi bất cứ"
	line "đâu có #MON sâu"
	cont "bọ xuất hiện."
	done

BugCatcherArnieBeatenText:
	text "Hả? Tôi không nên"
	line "thua chứ…"
	done

BugCatcherArnieAfterBattleText:
	text "VENONAT của tôi"
	line "thắng cuộc thi"

	para "Bắt Sâu Bọ tại"
	line "VƯỜN QUỐC GIA."
	done

BugCatcherArnieYanmaText:
	text "Chà… Nhìn toàn bộ"
	line "những YANMA kia!"

	para "Tôi choáng ngợp"
	line "không cử động nổi"
	done

FirebreatherWaltSeenText:
	text "Tôi đang tập thổi"
	line "lửa."
	done

FirebreatherWaltBeatenText:
	text "Úi! Tôi cháy đầu"
	line "mũi rồi!"
	done

FirebreatherWaltAfterBattleText:
	text "Bản March #MON"
	line "trên radio dụ dỗ"
	cont "#MON hoang dã."
	done

OfficerDirkSeenText:
	text "Nguy hiểm rình rập"
	line "trong đêm!"
	done

OfficerDirkBeatenText:
	text "Úi!"
	done

OfficerDirkAfterBattleText:
	text "Ban đêm cũng vui"
	line "theo cách riêng."

	para "Nhưng đừng quá"
	line "đà, được chứ?"
	done

OfficerDirkPrettyToughText:
	text "#MON của bạn"
	line "trông khá mạnh."

	para "Bạn có thể đi bất"
	line "cứ đâu an toàn."
	done

Route35SignText:
	text "TUYẾN ĐƯỜNG 35"
	done

Route35_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 33, ROUTE_35_GOLDENROD_GATE, 1
	warp_event 10, 33, ROUTE_35_GOLDENROD_GATE, 2
	warp_event  3,  5, ROUTE_35_NATIONAL_PARK_GATE, 3

	def_coord_events

	def_bg_events
	bg_event  1,  7, BGEVENT_READ, Route35Sign
	bg_event 11, 31, BGEVENT_READ, Route35Sign

	def_object_events
	object_event  4, 19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperIvan, -1
	object_event  8, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperElliot, -1
	object_event  7, 20, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerBrooke, -1
	object_event 10, 26, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerKim, -1
	object_event 14, 28, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerBirdKeeperBryan, -1
	object_event  2, 10, SPRITE_FISHER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherWalt, -1
	object_event 16,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherArnie, -1
	object_event  5, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerJugglerIrwin, -1
	object_event  5,  6, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TrainerOfficerDirk, -1
	object_event  2, 25, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route35FruitTree, -1
	object_event 13, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route35TMRollout, EVENT_ROUTE_35_TM_ROLLOUT
