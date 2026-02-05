	object_const_def
	const ROUTE45_POKEFAN_M1
	const ROUTE45_POKEFAN_M2
	const ROUTE45_POKEFAN_M3
	const ROUTE45_POKEFAN_M4
	const ROUTE45_BLACK_BELT
	const ROUTE45_COOLTRAINER_M
	const ROUTE45_COOLTRAINER_F
	const ROUTE45_FRUIT_TREE
	const ROUTE45_POKE_BALL1
	const ROUTE45_POKE_BALL2
	const ROUTE45_POKE_BALL3
	const ROUTE45_POKE_BALL4
	const ROUTE45_YOUNGSTER

Route45_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBlackbeltKenji:
	trainer BLACKBELT_T, KENJI3, EVENT_BEAT_BLACKBELT_KENJI, BlackbeltKenji3SeenText, BlackbeltKenji3BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_BLACKBELT_KENJI
	endifjustbattled
	opentext
	checkcellnum PHONE_BLACKBELT_KENJI
	iftrue .Registered
	checkevent EVENT_KENJI_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	special SampleKenjiBreakCountdown
	writetext BlackbeltKenjiAfterBattleText
	waitbutton
	setevent EVENT_KENJI_ASKED_FOR_PHONE_NUMBER
	scall Route45AskNumber1M
	sjump .AskForNumber

.AskedAlready:
	scall Route45AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_BLACKBELT_KENJI
	ifequal PHONE_CONTACTS_FULL, Route45PhoneFullM
	ifequal PHONE_CONTACT_REFUSED, Route45NumberDeclinedM
	gettrainername STRING_BUFFER_3, BLACKBELT_T, KENJI3
	scall Route45RegisteredNumberM
	sjump Route45NumberAcceptedM

.Registered:
	readvar VAR_KENJI_BREAK
	ifnotequal 1, Route45NumberAcceptedM
	checktime MORN
	iftrue .Morning
	checktime NITE
	iftrue .Night
	checkevent EVENT_KENJI_ON_BREAK
	iffalse Route45NumberAcceptedM
	scall Route45GiftM
	verbosegiveitem PP_UP
	iffalse .NoRoom
	clearevent EVENT_KENJI_ON_BREAK
	special SampleKenjiBreakCountdown
	sjump Route45NumberAcceptedM

.Morning:
	writetext BlackbeltKenjiMorningText
	waitbutton
	closetext
	end

.Night:
	writetext BlackbeltKenjiNightText
	waitbutton
	closetext
	end

.NoRoom:
	sjump Route45PackFullM

Route45AskNumber1M:
	jumpstd AskNumber1MScript
	end

Route45AskNumber2M:
	jumpstd AskNumber2MScript
	end

Route45RegisteredNumberM:
	jumpstd RegisteredNumberMScript
	end

Route45NumberAcceptedM:
	jumpstd NumberAcceptedMScript
	end

Route45NumberDeclinedM:
	jumpstd NumberDeclinedMScript
	end

Route45PhoneFullM:
	jumpstd PhoneFullMScript
	end

Route45RematchM:
	jumpstd RematchMScript
	end

Route45GiftM:
	jumpstd GiftMScript
	end

Route45PackFullM:
	jumpstd PackFullMScript
	end

HikerParryHasIron:
	setevent EVENT_PARRY_IRON
	jumpstd PackFullMScript
	end

Route45RematchGiftM:
	jumpstd RematchGiftMScript
	end

TrainerHikerErik:
	trainer HIKER, ERIK, EVENT_BEAT_HIKER_ERIK, HikerErikSeenText, HikerErikBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerErikAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerMichael:
	trainer HIKER, MICHAEL, EVENT_BEAT_HIKER_MICHAEL, HikerMichaelSeenText, HikerMichaelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerMichaelAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerParry:
	trainer HIKER, PARRY3, EVENT_BEAT_HIKER_PARRY, HikerParry3SeenText, HikerParry3BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_HIKER_PARRY
	endifjustbattled
	opentext
	checkflag ENGINE_PARRY_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_HIKER_PARRY
	iftrue Route45NumberAcceptedM
	checkevent EVENT_PARRY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext HikerParryAfterBattleText
	promptbutton
	setevent EVENT_PARRY_ASKED_FOR_PHONE_NUMBER
	scall Route45AskNumber1M
	sjump .AskForNumber

.AskedAlready:
	scall Route45AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_HIKER_PARRY
	ifequal PHONE_CONTACTS_FULL, Route45PhoneFullM
	ifequal PHONE_CONTACT_REFUSED, Route45NumberDeclinedM
	gettrainername STRING_BUFFER_3, HIKER, PARRY1
	scall Route45RegisteredNumberM
	sjump Route45NumberAcceptedM

.WantsBattle:
	scall Route45RematchM
	winlosstext HikerParry3BeatenText, 0
	readmem wParryFightCount
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight2:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer HIKER, PARRY3
	startbattle
	reloadmapafterbattle
	loadmem wParryFightCount, 1
	clearflag ENGINE_PARRY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer HIKER, PARRY1
	startbattle
	reloadmapafterbattle
	loadmem wParryFightCount, 2
	clearflag ENGINE_PARRY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer HIKER, PARRY2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_PARRY_READY_FOR_REMATCH
	checkevent EVENT_PARRY_IRON
	iftrue .HasIron
	checkevent EVENT_GOT_IRON_FROM_PARRY
	iftrue .GotIron
	scall Route45RematchGiftM
	verbosegiveitem IRON
	iffalse HikerParryHasIron
	setevent EVENT_GOT_IRON_FROM_PARRY
	sjump Route45NumberAcceptedM

.GotIron:
	end

.HasIron:
	opentext
	writetext HikerParryGivesIronText
	waitbutton
	verbosegiveitem IRON
	iffalse HikerParryHasIron
	clearevent EVENT_PARRY_IRON
	setevent EVENT_GOT_IRON_FROM_PARRY
	sjump Route45NumberAcceptedM

TrainerHikerTimothy:
	trainer HIKER, TIMOTHY, EVENT_BEAT_HIKER_TIMOTHY, HikerTimothySeenText, HikerTimothyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerTimothyAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermRyan:
	trainer COOLTRAINERM, RYAN, EVENT_BEAT_COOLTRAINERM_RYAN, CooltrainermRyanSeenText, CooltrainermRyanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermRyanAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfKelly:
	trainer COOLTRAINERF, KELLY, EVENT_BEAT_COOLTRAINERF_KELLY, CooltrainerfKellySeenText, CooltrainerfKellyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfKellyAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperQuentin:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CAMPER_QUENTIN
	iftrue .Defeated
	writetext CamperQuentinSeenText
	waitbutton
	closetext
	winlosstext CamperQuentinBeatenText, 0
	loadtrainer CAMPER, QUENTIN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CAMPER_QUENTIN
	closetext
	end

.Defeated:
	writetext CamperQuentinAfterBattleText
	waitbutton
	closetext
	end

Route45DummyScript: ; unreferenced
	writetext Route45DummyText
	waitbutton
	closetext
	end

Route45Sign:
	jumptext Route45SignText

Route45FruitTree:
	fruittree FRUITTREE_ROUTE_45

Route45Nugget:
	itemball NUGGET

Route45Revive:
	itemball REVIVE

Route45Elixer:
	itemball ELIXER

Route45MaxPotion:
	itemball MAX_POTION

Route45HiddenPpUp:
	hiddenitem PP_UP, EVENT_ROUTE_45_HIDDEN_PP_UP

HikerErikSeenText:
	text "Hãy chuẩn bị cho"
	line "mọi tình huống!"

	para "Để tôi xem #-"
	line "MON của cậu được"
	cont "nuôi tử tế chưa!"
	done

HikerErikBeatenText:
	text "Ôi, tôi thua rồi!"
	done

HikerErikAfterBattleText:
	text "Tôi sẽ về ĐỘI BĂNG"
	line "BLACKTHORN và tập"

	para "luyện thêm."
	done

HikerMichaelSeenText:
	text "Ồ! Cậu hăng hái!"
	line "Nhưng biết không?"

	para "Khi nói đến sự"
	line "hăng hái thực sự,"
	cont "tôi mới là cao"
	cont "thủ!"
	done

HikerMichaelBeatenText:
	text "#MON của tôi"
	line "chưa đủ hăng!"
	done

HikerMichaelAfterBattleText:
	text "Trời, tôi thích"
	line "HP UP quá! Ngon!"

	para "Tôi cứ uống của"
	line "#MON mình hoài!"

	para "Tôi không chịu"
	line "nổi!"
	done

HikerParry3SeenText:
	text "#MON tôi tràn"
	line "đầy sức mạnh!"
	done

HikerParry3BeatenText:
	text "Wahahah! Tôi là"
	line "người thua lớn!"
	done

HikerParryAfterBattleText:
	text "Tôi không giỏi"
	line "suy nghĩ lắm đâu."

	para "Nên tôi chỉ lao"
	line "thẳng bằng sức!"
	done

HikerTimothySeenText:
	text "Tại sao tôi leo"
	line "núi?"

	para "Vì chúng ở đó."

	para "Tại sao tôi huấn"
	line "luyện #MON?"

	para "Vì chúng ở đó!"
	done

HikerTimothyBeatenText:
	text "Thua cuộc…"
	line "Chúng cũng ở đó!"
	done

HikerTimothyAfterBattleText:
	text "Điều tốt nhất từng"
	line "xảy ra với tôi"

	para "là khám phá ra"
	line "#MON."
	done

HikerParryGivesIronText:
	text "Tôi không tìm ra"
	line "cách chiến thắng!"

	para "Cứ cố lên nhé!"

	para "Ồ, và lấy cái"
	line "này--đây là quà"

	para "cậu không thể nhận"
	line "lần trước."
	done

BlackbeltKenji3SeenText:
	text "Tôi đã tập một"
	line "mình ở đây."

	para "Hãy xem thành quả"
	line "của tôi!"
	done

BlackbeltKenji3BeatenText:
	text "Waaaargh!"
	done

BlackbeltKenjiAfterBattleText:
	text "Việc này cần biện"
	line "pháp đặc biệt."

	para "Tôi phải lên núi"
	line "và tập luyện trong"
	cont "cô độc."
	done

BlackbeltKenjiMorningText:
	text "Tôi sẽ tập thêm"
	line "chút trước khi"
	cont "nghỉ ăn trưa."
	done

BlackbeltKenjiNightText:
	text "Chúng tôi đã nghỉ"
	line "đủ lúc ăn trưa,"

	para "nên giờ sẵn sàng"
	line "tiếp tục rồi!"

	para "Chúng tôi sẽ tập"
	line "luyện tiếp!"
	done

CooltrainermRyanSeenText:
	text "Cậu nghĩ sao về"
	line "việc nuôi dưỡng"
	cont "#MON?"
	done

CooltrainermRyanBeatenText:
	text "Cậu giành được sự"
	line "tôn trọng của tôi."
	done

CooltrainermRyanAfterBattleText:
	text "Tôi thấy cậu đang"
	line "nuôi #MON với"
	cont "cẩn thận."

	para "Mối liên kết cậu"
	line "xây dựng sẽ cứu"
	cont "cậu trong tình"
	cont "huống khó khăn."
	done

CooltrainerfKellySeenText:
	text "Chiến thuật chiến"
	line "đấu của cậu là"
	cont "gì?"

	para "Dùng chiêu mạnh"
	line "bừa bãi là ngu"
	cont "ngốc."
	done

CooltrainerfKellyBeatenText:
	text "Được. Tôi thua."
	done

CooltrainerfKellyAfterBattleText:
	text "Tôi không ủng hộ"
	line "các chiêu quá"
	cont "mạnh."

	para "Tôi muốn thắng,"
	line "nhưng cũng không"
	cont "muốn làm hại"
	cont "#MON."
	done

Route45DummyText:
	text "Tôi thực sự,"
	line "thực sự mạnh!"

	para "Có chỗ nào để tôi"
	line "chứng minh mình"
	cont "mạnh thế nào không"
	cont "nhỉ?"
	done

CamperQuentinSeenText:
	text "Tôi thực sự,"
	line "thực sự mạnh!"
	done

CamperQuentinBeatenText:
	text "Tôi mạnh ở THÁP"
	line "ĐẤU mà…"
	done

CamperQuentinAfterBattleText:
	text "Cậu đã đến THÁP"
	line "ĐẤU chưa?"

	para "Tôi không bao giờ"
	line "thua ở đó, nhưng…"
	done

Route45SignText:
	text "TUYẾN ĐƯỜNG 45"
	line "ĐỐI DIỆN NÚI PHI"
	done

Route45_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  5, DARK_CAVE_BLACKTHORN_ENTRANCE, 1

	def_coord_events

	def_bg_events
	bg_event 10,  4, BGEVENT_READ, Route45Sign
	bg_event 13, 80, BGEVENT_ITEM, Route45HiddenPpUp

	def_object_events
	object_event 10, 16, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerHikerErik, -1
	object_event 15, 65, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerMichael, -1
	object_event  5, 28, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerParry, -1
	object_event  9, 65, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerHikerTimothy, -1
	object_event 11, 50, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltKenji, -1
	object_event 17, 18, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermRyan, -1
	object_event  5, 36, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfKelly, -1
	object_event 16, 82, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route45FruitTree, -1
	object_event  6, 51, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route45Nugget, EVENT_ROUTE_45_NUGGET
	object_event  5, 66, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route45Revive, EVENT_ROUTE_45_REVIVE
	object_event  6, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route45Elixer, EVENT_ROUTE_45_ELIXER
	object_event  7, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route45MaxPotion, EVENT_ROUTE_45_MAX_POTION
	object_event  4, 70, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TrainerCamperQuentin, -1
