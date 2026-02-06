	object_const_def
	const OLIVINELIGHTHOUSE2F_SAILOR
	const OLIVINELIGHTHOUSE2F_GENTLEMAN

OlivineLighthouse2F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerGentlemanAlfred:
	trainer GENTLEMAN, ALFRED, EVENT_BEAT_GENTLEMAN_ALFRED, GentlemanAlfredSeenText, GentlemanAlfredBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanAlfredAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorHuey:
	trainer SAILOR, HUEY1, EVENT_BEAT_SAILOR_HUEY, SailorHueySeenText, SailorHueyBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_SAILOR_HUEY
	endifjustbattled
	opentext
	checkflag ENGINE_HUEY_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_SAILOR_HUEY
	iftrue .NumberAccepted
	checkevent EVENT_HUEY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedBefore
	setevent EVENT_HUEY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedBefore:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_SAILOR_HUEY
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, SAILOR, HUEY1
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext SailorHueyBeatenText, 0
	readmem wHueyFightCount
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight3:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer SAILOR, HUEY1
	startbattle
	reloadmapafterbattle
	loadmem wHueyFightCount, 1
	clearflag ENGINE_HUEY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SAILOR, HUEY2
	startbattle
	reloadmapafterbattle
	loadmem wHueyFightCount, 2
	clearflag ENGINE_HUEY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SAILOR, HUEY3
	startbattle
	reloadmapafterbattle
	loadmem wHueyFightCount, 3
	clearflag ENGINE_HUEY_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer SAILOR, HUEY4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_HUEY_READY_FOR_REMATCH
	checkevent EVENT_HUEY_PROTEIN
	iftrue .HasProtein
	checkevent EVENT_GOT_PROTEIN_FROM_HUEY
	iftrue .SkipGift
	scall .RematchGift
	verbosegiveitem PROTEIN
	iffalse .PackFull
	setevent EVENT_GOT_PROTEIN_FROM_HUEY
	sjump .NumberAccepted

.SkipGift:
	end

.HasProtein:
	opentext
	writetext SailorHueyGiveProteinText
	waitbutton
	verbosegiveitem PROTEIN
	iffalse .PackFull
	clearevent EVENT_HUEY_PROTEIN
	setevent EVENT_GOT_PROTEIN_FROM_HUEY
	sjump .NumberAccepted

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

.Rematch:
	jumpstd RematchMScript
	end

.PackFull:
	setevent EVENT_HUEY_PROTEIN
	jumpstd PackFullMScript
	end

.RematchGift:
	jumpstd RematchGiftMScript
	end

SailorHueySeenText:
	text "Đàn ông của biển"
	line "cả luôn khao khát"
	cont "một trận đấu hay!"
	done

SailorHueyBeatenText:
	text "Urf!"
	line "Tôi thua!"
	done

SailorHueyUnusedText: ; unreferenced
	text "Sức mạnh thật!"
	line "Bạn có muốn ra"

	para "khơi cùng tôi"
	line "không?"
	done

GentlemanAlfredSeenText:
	text "Hm? Đây không phải"
	line "nơi để chơi đùa."
	done

GentlemanAlfredBeatenText:
	text "Ah! Tôi thấy bạn"
	line "rất nghiêm túc."
	done

GentlemanAlfredAfterBattleText:
	text "Ở trên đỉnh có"
	line "#MON giữ cho"
	cont "HẢI ĐĂNG sáng."

	para "Nhưng tôi nghe nói"
	line "nó bị ốm và"

	para "không thể chữa"
	line "bằng thuốc thường."
	done

SailorHueyGiveProteinText:
	text "Chà! Bạn vẫn cứng"
	line "cỏi như thường!"

	para "Dù sao, đây là"
	line "thuốc từ lần"
	cont "trước."
	done

OlivineLighthouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 11, OLIVINE_LIGHTHOUSE_1F, 3
	warp_event  5,  3, OLIVINE_LIGHTHOUSE_3F, 2
	warp_event 16, 13, OLIVINE_LIGHTHOUSE_1F, 4
	warp_event 17, 13, OLIVINE_LIGHTHOUSE_1F, 5
	warp_event 16, 11, OLIVINE_LIGHTHOUSE_3F, 4
	warp_event 17, 11, OLIVINE_LIGHTHOUSE_3F, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorHuey, -1
	object_event 17,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerGentlemanAlfred, -1
