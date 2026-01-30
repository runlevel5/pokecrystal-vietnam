	object_const_def
	const ROUTE32_FISHER1
	const ROUTE32_FISHER2
	const ROUTE32_FISHER3
	const ROUTE32_YOUNGSTER1
	const ROUTE32_YOUNGSTER2
	const ROUTE32_YOUNGSTER3
	const ROUTE32_LASS1
	const ROUTE32_COOLTRAINER_M
	const ROUTE32_YOUNGSTER4
	const ROUTE32_FISHER4
	const ROUTE32_POKE_BALL1
	const ROUTE32_FISHER5
	const ROUTE32_FRIEDA
	const ROUTE32_POKE_BALL2

Route32_MapScripts:
	def_scene_scripts
	scene_script Route32Noop1Scene, SCENE_ROUTE32_COOLTRAINER_M_BLOCKS
	scene_script Route32Noop2Scene, SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	scene_script Route32Noop3Scene, SCENE_ROUTE32_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route32FriedaCallback

Route32Noop1Scene:
	end

Route32Noop2Scene:
	end

Route32Noop3Scene:
	end

Route32FriedaCallback:
	readvar VAR_WEEKDAY
	ifequal FRIDAY, .FriedaAppears
	disappear ROUTE32_FRIEDA
	endcallback

.FriedaAppears:
	appear ROUTE32_FRIEDA
	endcallback

Route32CooltrainerMScript:
	faceplayer
Route32CooltrainerMContinueScene:
	opentext
	checkevent EVENT_GOT_MIRACLE_SEED_IN_ROUTE_32
	iftrue .GotMiracleSeed
	checkflag ENGINE_ZEPHYRBADGE
	iffalse .DontHaveZephyrBadge
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue .GiveMiracleSeed
	writetext Route32CooltrainerMText_AideIsWaiting
	waitbutton
	closetext
	end

.GoToSproutTower: ; unreferenced
	writetext Route32CooltrainerMText_UnusedSproutTower
	waitbutton
	closetext
	end

.GiveMiracleSeed:
	writetext Route32CooltrainerMText_HaveThisSeed
	promptbutton
	verbosegiveitem MIRACLE_SEED
	iffalse .BagFull
	setevent EVENT_GOT_MIRACLE_SEED_IN_ROUTE_32
	sjump .GotMiracleSeed

.DontHaveZephyrBadge:
	writetext Route32CooltrainerMText_VioletGym
	waitbutton
	closetext
	end

.GotMiracleSeed:
	writetext Route32CooltrainerMText_ExperiencesShouldBeUseful
	waitbutton
.BagFull:
	closetext
	end

Route32CooltrainerMStopsYouScene:
	turnobject ROUTE32_COOLTRAINER_M, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext Route32CooltrainerMText_WhatsTheHurry
	waitbutton
	closetext
	follow PLAYER, ROUTE32_COOLTRAINER_M
	applymovement PLAYER, Movement_Route32CooltrainerMPushesYouBackToViolet
	stopfollow
	turnobject PLAYER, DOWN
	scall Route32CooltrainerMContinueScene
	applymovement ROUTE32_COOLTRAINER_M, Movement_Route32CooltrainerMReset1
	applymovement ROUTE32_COOLTRAINER_M, Movement_Route32CooltrainerMReset2
	end

Route32RoarTMGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM05_ROAR
	iftrue .AlreadyHaveRoar
	writetext Text_RoarIntro
	promptbutton
	verbosegiveitem TM_ROAR
	iffalse .Finish
	setevent EVENT_GOT_TM05_ROAR
.AlreadyHaveRoar:
	writetext Text_RoarOutro
	waitbutton
.Finish:
	closetext
	end

Route32WannaBuyASlowpokeTailScript:
	turnobject ROUTE32_FISHER4, DOWN
	turnobject PLAYER, UP
	sjump _OfferToSellSlowpokeTail

SlowpokeTailSalesmanScript:
	faceplayer
_OfferToSellSlowpokeTail:
	setscene SCENE_ROUTE32_NOOP
	opentext
	writetext Text_MillionDollarSlowpokeTail
	yesorno
	iffalse .refused
	writetext Text_ThoughtKidsWereLoaded
	waitbutton
	closetext
	end

.refused
	writetext Text_RefusedToBuySlowpokeTail
	waitbutton
	closetext
	end

TrainerCamperRoland:
	trainer CAMPER, ROLAND, EVENT_BEAT_CAMPER_ROLAND, CamperRolandSeenText, CamperRolandBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperRolandAfterText
	waitbutton
	closetext
	end

TrainerFisherJustin:
	trainer FISHER, JUSTIN, EVENT_BEAT_FISHER_JUSTIN, FisherJustinSeenText, FisherJustinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherJustinAfterText
	waitbutton
	closetext
	end

TrainerFisherRalph1:
	trainer FISHER, RALPH1, EVENT_BEAT_FISHER_RALPH, FisherRalph1SeenText, FisherRalph1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_FISHER_RALPH
	endifjustbattled
	opentext
	checkflag ENGINE_RALPH_READY_FOR_REMATCH
	iftrue .Rematch
	checkflag ENGINE_QWILFISH_SWARM
	iftrue .Swarm
	checkcellnum PHONE_FISHER_RALPH
	iftrue .NumberAccepted
	checkevent EVENT_RALPH_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext FisherRalphAfterText
	promptbutton
	setevent EVENT_RALPH_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskAgain:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_FISHER_RALPH
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, FISHER, RALPH1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext FisherRalph1BeatenText, 0
	readmem wRalphFightCount
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
	checkflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_ECRUTEAK
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer FISHER, RALPH1
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 1
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer FISHER, RALPH2
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 2
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer FISHER, RALPH3
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 3
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer FISHER, RALPH4
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 4
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer FISHER, RALPH5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.Swarm:
	writetext FisherRalphSwarmText
	waitbutton
	closetext
	end

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.RematchStd:
	jumpstd RematchMScript
	end

TrainerFisherHenry:
	trainer FISHER, HENRY, EVENT_BEAT_FISHER_HENRY, FisherHenrySeenText, FisherHenryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherHenryAfterText
	waitbutton
	closetext
	end

TrainerPicnickerLiz1:
	trainer PICNICKER, LIZ1, EVENT_BEAT_PICNICKER_LIZ, PicnickerLiz1SeenText, PicnickerLiz1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_PICNICKER_LIZ
	endifjustbattled
	opentext
	checkflag ENGINE_LIZ_READY_FOR_REMATCH
	iftrue .Rematch
	checkcellnum PHONE_PICNICKER_LIZ
	iftrue .NumberAccepted
	checkevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext PicnickerLiz1AfterText
	promptbutton
	setevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskAgain:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_LIZ
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, PICNICKER, LIZ1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext PicnickerLiz1BeatenText, 0
	readmem wLizFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_ECRUTEAK
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, LIZ1
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 1
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer PICNICKER, LIZ2
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 2
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer PICNICKER, LIZ3
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 3
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer PICNICKER, LIZ4
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 4
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer PICNICKER, LIZ5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1FScript
	end

.AskNumber2:
	jumpstd AskNumber2FScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberFScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedFScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedFScript
	end

.PhoneFull:
	jumpstd PhoneFullFScript
	end

.RematchStd:
	jumpstd RematchFScript
	end

TrainerYoungsterAlbert:
	trainer YOUNGSTER, ALBERT, EVENT_BEAT_YOUNGSTER_ALBERT, YoungsterAlbertSeenText, YoungsterAlbertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterAlbertAfterText
	waitbutton
	closetext
	end

TrainerYoungsterGordon:
	trainer YOUNGSTER, GORDON, EVENT_BEAT_YOUNGSTER_GORDON, YoungsterGordonSeenText, YoungsterGordonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterGordonAfterText
	waitbutton
	closetext
	end

TrainerBirdKeeperPeter:
	trainer BIRD_KEEPER, PETER, EVENT_BEAT_BIRD_KEEPER_PETER, BirdKeeperPeterSeenText, BirdKeeperPeterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperPeterAfterText
	waitbutton
	closetext
	end

FriedaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	iftrue .Friday
	readvar VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checkevent EVENT_MET_FRIEDA_OF_FRIDAY
	iftrue .MetFrieda
	writetext MeetFriedaText
	promptbutton
	setevent EVENT_MET_FRIEDA_OF_FRIDAY
.MetFrieda:
	writetext FriedaGivesGiftText
	promptbutton
	verbosegiveitem POISON_BARB
	iffalse .Done
	setevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	writetext FriedaGaveGiftText
	waitbutton
	closetext
	end

.Friday:
	writetext FriedaFridayText
	waitbutton
.Done:
	closetext
	end

.NotFriday:
	writetext FriedaNotFridayText
	waitbutton
	closetext
	end

Route32GreatBall:
	itemball GREAT_BALL

Route32Repel:
	itemball REPEL

Route32Sign:
	jumptext Route32SignText

Route32RuinsSign:
	jumptext Route32RuinsSignText

Route32UnionCaveSign:
	jumptext Route32UnionCaveSignText

Route32PokecenterSign:
	jumpstd PokecenterSignScript

Route32HiddenGreatBall:
	hiddenitem GREAT_BALL, EVENT_ROUTE_32_HIDDEN_GREAT_BALL

Route32HiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ROUTE_32_HIDDEN_SUPER_POTION

Movement_Route32CooltrainerMPushesYouBackToViolet:
	step UP
	step UP
	step_end

Movement_Route32CooltrainerMReset1:
	step DOWN
	step_end

Movement_Route32CooltrainerMReset2:
	step RIGHT
	step_end

Route32CooltrainerMText_WhatsTheHurry:
	text "Đợi đã!"
	line "Sao vội thế?"
	done

Route32CooltrainerMText_AideIsWaiting:
	text "<PLAYER>, đúng ko?"
	line "Có anh chàng đeo"

	para "kính đang tìm"
	line "bạn."

	para "Tự đi mà xem."
	line "Anh ta đang chờ"

	para "bạn ở TT"
	line "#MON."
	done

Route32CooltrainerMText_UnusedSproutTower:
	text "Bạn đã đến"
	line "THÁP MẦM chưa?"

	para "Nếu có dịp đến"
	line "TP VIOLET, "

	para "họ sẽ muốn bạn"
	line "tập luyện ở đó."

	para "Đó là điều cơ bản"
	line "cho HLV. Hãy đến"
	cont "THÁP MẦM!"
	done

Route32CooltrainerMText_VioletGym:
	text "Bạn đã đến GYM"
	line "#MON chưa?"

	para "Bạn có thể thử"
	line "sức #MON và"
	cont "bản thân ở đó."

	para "Đó là nghi thức"
	line "bắt buộc cho mọi"
	cont "HLV!"
	done

Route32CooltrainerMText_HaveThisSeed:
	text "Bạn có vài #MON"
	line "tốt đấy."

	para "Chắc là nhờ tập"
	line "luyện quanh vùng"

	para "TP VIOLET"
	line "mà ra."

	para "Tập luyện ở GYM"
	line "chắc hẳn đã giúp"

	para "bạn rất"
	line "nhiều."

	para "Để kỷ niệm"
	line "TP VIOLET, hãy"
	cont "nhận cái này."

	para "Nó tăng sức mạnh"
	line "chiêu hệ cỏ."
	done

Route32CooltrainerMText_ExperiencesShouldBeUseful:
	text "Kinh nghiệm của"
	line "bạn ở TP VIOLET"

	para "sẽ có ích cho"
	line "hành trình."
	done

Text_MillionDollarSlowpokeTail:
	text "Bạn có muốn"
	line "ĐUÔI SLOWPOKE"

	para "ngon lành, bổ"
	line "dưỡng này không?"

	para "Giá hôm nay cho"
	line "bạn ¥1,000,000!"

	para "Bạn sẽ muốn đó!"
	done

Text_ThoughtKidsWereLoaded:
	text "Tch! Tao tưởng"
	line "bọn trẻ giờ"
	cont "toàn giàu…"
	done

Text_RefusedToBuySlowpokeTail:
	text "Ko muốn à?"
	line "Vậy biến đi. Xù!"
	done

FisherJustinSeenText:
	text "Ối!"

	para "Mày làm tao mất"
	line "con cá rồi!"
	done

FisherJustinBeatenText:
	text "Tõm!"
	done

FisherJustinAfterText:
	text "Bình tĩnh, tập"
	line "trung… Tinh túy"

	para "của câu cá và #-"
	line "MON giống nhau."
	done

FisherRalph1SeenText:
	text "Tao giỏi cả"
	line "câu cá lẫn"
	cont "#MON."

	para "Tao sẽ không thua"
	line "bất kỳ nhóc nào!"
	done

FisherRalph1BeatenText:
	text "Tch! Tao vội vàng"
	line "quá…"
	done

FisherRalphAfterText:
	text "Câu cá là đam mê"
	line "cả đời."

	para "#MON là bạn"
	line "cả đời!"
	done

FisherRalphSwarmText:
	text "Một, hai, ba…"
	line "Muahahaha, thật"

	para "bội thu!"
	line "Tao xong rồi! Cứ"

	para "bắt bao nhiêu"
	line "tuỳ thích, nhóc!"
	done

Route32UnusedFisher1SeenText: ; unreferenced
	text "Tao cứ bắt được"
	line "mãi cùng #MON…"

	para "Có lẽ trận đấu"
	line "sẽ thay đổi"
	cont "vận may của tao."
	done

Route32UnusedFisher1BeatenText: ; unreferenced
	text "Chẳng có gì suôn"
	line "sẻ với tao cả…"
	done

Route32UnusedFisher1AfterText: ; unreferenced
	text "Sao gã bên cạnh"
	line "lại câu được"
	cont "#MON tốt thế?"
	done

Route32UnusedFisher2SeenText: ; unreferenced
	text "Heh, hôm nay tao"
	line "may mắn. Đấu"
	cont "không, nhóc?"
	done

Route32UnusedFisher2BeatenText: ; unreferenced
	text "Oof. Lần này tao"
	line "không may rồi."
	done

Route32UnusedFisher2AfterText: ; unreferenced
	text "Phải có CẦN tốt"
	line "nếu muốn bắt"

	para "#MON"
	line "tốt."
	done

FisherHenrySeenText:
	text "#MON của tao?"
	line "Mới bắt tươi rói!"
	done

FisherHenryBeatenText:
	text "TÉ NƯỚC?"
	done

FisherHenryAfterText:
	text "#MON mới bắt"
	line "không thể sánh"

	para "với những con"
	line "được nuôi tử tế."
	done

YoungsterAlbertSeenText:
	text "Tao chưa thấy mày"
	line "ở đây bao giờ."

	para "Mày nghĩ mày"
	line "khá mạnh à?"
	done

YoungsterAlbertBeatenText:
	text "Mày mạnh thật!"
	done

YoungsterAlbertAfterText:
	text "Tao sẽ cố gắng"
	line "trở thành giỏi"
	cont "nhất với con yêu"

	para "thích của mình."
	line "Tao không dùng"

	para "#MON mạnh"
	line "như người khác."
	done

YoungsterGordonSeenText:
	text "Tao tìm được"
	line "#MON tốt trong"
	cont "bụi cỏ!"

	para "Chúng sẽ giúp"
	line "tao chiến thắng!"
	done

YoungsterGordonBeatenText:
	text "Chết. Tao tưởng"
	line "tao thắng được."
	done

YoungsterGordonAfterText:
	text "Bụi cỏ đầy những"
	line "thứ bám dính."
	done

CamperRolandSeenText:
	text "Ánh mắt đó…"
	line "Thú vị đấy."
	done

CamperRolandBeatenText:
	text "Hừm. Thật thất"
	line "vọng."
	done

CamperRolandAfterText:
	text "Nếu không muốn"
	line "đấu, chỉ cần"
	cont "tránh giao mắt."
	done

PicnickerLiz1SeenText:
	text "Ừ-hừ. Phải, rồi"
	line "bạn biết…"

	para "Sao? Đấu?"
	line "Tớ đang nghe đt."

	para "Ôi, được rồi."
	line "Nhưng nhanh nhé."
	done

PicnickerLiz1BeatenText:
	text "Ôi! Tớ phải xả"
	line "cơn tức giận!"
	done

PicnickerLiz1AfterText:
	text "Tớ đang nói"
	line "chuyện vui mà."
	done

BirdKeeperPeterSeenText:
	text "HUY HIỆU đó! Của"
	line "TP VIOLET!"

	para "Bạn thắng FALKNER"
	line "rồi à?"
	done

BirdKeeperPeterBeatenText:
	text "Tôi biết điểm yếu"
	line "của mình."
	done

BirdKeeperPeterAfterText:
	text "Tôi nên tập luyện"
	line "lại ở GYM"
	cont "TP VIOLET."
	done

Route32UnusedText: ; unreferenced
	text "Mấy ông câu cá"
	line "la tao vì làm"
	cont "phiền họ…"
	done

Text_RoarIntro:
	text "GRẦMMMM!"
	line "NGƯỜI TA CHẠY KHI"

	para "TAO GẦM! NHƯNG"
	line "MÀY LẠI TÌM ĐẾN!"

	para "ĐIỀU ĐÓ LÀM TAO"
	line "VUI! GIỜ CẦM LẤY!"
	done

Text_RoarOutro:
	text "GRẦMMMM!"
	line "ĐÓ LÀ ROAR!"

	para "CẢ #MON CŨNG"
	line "CHẠY KHI GẦM HAY!"
	done

MeetFriedaText:
	text "FRIEDA: Yahoo!"
	line "Hôm nay thứ Sáu!"

	para "Tớ là FRIEDA của"
	line "thứ Sáu!"

	para "Rất vui được"
	line "gặp bạn!"
	done

FriedaGivesGiftText:
	text "Đây là POISON"
	line "BARB cho bạn!"
	done

FriedaGaveGiftText:
	text "FRIEDA: Đưa nó"
	line "cho #MON có"
	cont "chiêu hệ độc."

	para "Ôi!"

	para "Cực kỳ lợi hại!"

	para "Bạn sẽ ngạc nhiên"
	line "về độ mạnh của"
	cont "chiêu độc đấy!"
	done

FriedaFridayText:
	text "FRIEDA: Chào!"
	line "Bạn thích thứ nào"

	para "trong tuần?"
	line "Tớ thích thứ Sáu."

	para "Không nghi ngờ gì"
	line "cả!"

	para "Bạn không nghĩ"
	line "nó tuyệt sao?"
	done

FriedaNotFridayText:
	text "FRIEDA: Hôm nay"
	line "không phải thứ"

	para "Sáu à?"
	line "Chán quá khi"

	para "không phải thứ"
	line "Sáu!"
	done

Route32SignText:
	text "ROUTE 32"

	para "VIOLET CITY -"
	line "AZALEA TOWN"
	done

Route32RuinsSignText:
	text "RUINS OF ALPH"
	line "LỐI VÀO PHÍA ĐÔNG"
	done

Route32UnionCaveSignText:
	text "UNION CAVE"
	line "PHÍA TRƯỚC"
	done

Route32_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 73, ROUTE_32_POKECENTER_1F, 1
	warp_event  4,  2, ROUTE_32_RUINS_OF_ALPH_GATE, 3
	warp_event  4,  3, ROUTE_32_RUINS_OF_ALPH_GATE, 4
	warp_event  6, 79, UNION_CAVE_1F, 4

	def_coord_events
	coord_event 18,  8, SCENE_ROUTE32_COOLTRAINER_M_BLOCKS, Route32CooltrainerMStopsYouScene
	coord_event  7, 71, SCENE_ROUTE32_OFFER_SLOWPOKETAIL, Route32WannaBuyASlowpokeTailScript

	def_bg_events
	bg_event 13,  5, BGEVENT_READ, Route32Sign
	bg_event  9,  1, BGEVENT_READ, Route32RuinsSign
	bg_event 10, 84, BGEVENT_READ, Route32UnionCaveSign
	bg_event 12, 73, BGEVENT_READ, Route32PokecenterSign
	bg_event 12, 67, BGEVENT_ITEM, Route32HiddenGreatBall
	bg_event 11, 40, BGEVENT_ITEM, Route32HiddenSuperPotion

	def_object_events
	object_event  8, 49, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherJustin, -1
	object_event 12, 56, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherRalph1, -1
	object_event  6, 48, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherHenry, -1
	object_event 12, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterAlbert, -1
	object_event  4, 63, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterGordon, -1
	object_event  3, 45, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperRoland, -1
	object_event 10, 30, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerLiz1, -1
	object_event 19,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32CooltrainerMScript, -1
	object_event 11, 82, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperPeter, -1
	object_event  7, 70, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeTailSalesmanScript, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  6, 53, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route32GreatBall, EVENT_ROUTE_32_GREAT_BALL
	object_event 15, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32RoarTMGuyScript, -1
	object_event 12, 67, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FriedaScript, EVENT_ROUTE_32_FRIEDA_OF_FRIDAY
	object_event  3, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route32Repel, EVENT_ROUTE_32_REPEL
