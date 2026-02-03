	object_const_def
	const NATIONALPARK_LASS1
	const NATIONALPARK_POKEFAN_F1
	const NATIONALPARK_TEACHER1
	const NATIONALPARK_YOUNGSTER1
	const NATIONALPARK_YOUNGSTER2
	const NATIONALPARK_TEACHER2
	const NATIONALPARK_PERSIAN
	const NATIONALPARK_YOUNGSTER3
	const NATIONALPARK_POKEFAN_F2
	const NATIONALPARK_POKEFAN_M
	const NATIONALPARK_LASS2
	const NATIONALPARK_POKE_BALL1
	const NATIONALPARK_GAMEBOY_KID
	const NATIONALPARK_POKE_BALL2

NationalPark_MapScripts:
	def_scene_scripts

	def_callbacks

NationalParkLassScript:
	jumptextfaceplayer NationalParkLassText

NationalParkPokefanFScript:
	jumptextfaceplayer NationalParkPokefanFText

NationalParkTeacher1Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_QUICK_CLAW
	iftrue .GotQuickClaw
	writetext NationalParkTeacher1Text
	promptbutton
	verbosegiveitem QUICK_CLAW
	iffalse .NoRoom
	setevent EVENT_GOT_QUICK_CLAW
.GotQuickClaw:
	writetext NationalParkTeacher1Text_GotQuickClaw
	waitbutton
.NoRoom:
	closetext
	end

NationalParkYoungster1Script:
	jumptextfaceplayer NationalParkYoungster1Text

NationalParkYoungster2Script:
	jumptextfaceplayer NationalParkYoungster2Text

NationalParkTeacher2Script:
	jumptextfaceplayer NationalParkTeacher2Text

NationalParkPersian:
	faceplayer
	opentext
	writetext NationalParkPersianText
	cry PERSIAN
	waitbutton
	closetext
	end

NationalParkGameboyKidScript:
	faceplayer
	opentext
	writetext NationalParkGameboyKidText
	waitbutton
	closetext
	turnobject NATIONALPARK_GAMEBOY_KID, DOWN
	end

TrainerSchoolboyJack1:
	trainer SCHOOLBOY, JACK1, EVENT_BEAT_SCHOOLBOY_JACK, SchoolboyJack1SeenText, SchoolboyJack1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_SCHOOLBOY_JACK
	endifjustbattled
	opentext
	checkflag ENGINE_JACK_READY_FOR_REMATCH
	iftrue .Rematch
	checkcellnum PHONE_SCHOOLBOY_JACK
	iftrue .NumberAccepted
	checkevent EVENT_JACK_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext SchoolboyJackTradeMonText
	promptbutton
	setevent EVENT_JACK_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .RequestNumber

.AskAgain:
	scall .AskNumber2
.RequestNumber:
	askforphonenumber PHONE_SCHOOLBOY_JACK
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, SCHOOLBOY, JACK1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext SchoolboyJack1BeatenText, 0
	readmem wJackFightCount
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
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer SCHOOLBOY, JACK1
	startbattle
	reloadmapafterbattle
	loadmem wJackFightCount, 1
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, JACK2
	startbattle
	reloadmapafterbattle
	loadmem wJackFightCount, 2
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, JACK3
	startbattle
	reloadmapafterbattle
	loadmem wJackFightCount, 3
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer SCHOOLBOY, JACK4
	startbattle
	reloadmapafterbattle
	loadmem wJackFightCount, 4
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer SCHOOLBOY, JACK5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JACK_READY_FOR_REMATCH
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

TrainerPokefanmWilliam:
	trainer POKEFANM, WILLIAM, EVENT_BEAT_POKEFANM_WILLIAM, PokefanmWilliamSeenText, PokefanmWilliamBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmWilliamAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfBeverly1:
	trainer POKEFANF, BEVERLY1, EVENT_BEAT_POKEFANF_BEVERLY, PokefanfBeverly1SeenText, PokefanfBeverly1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_POKEFAN_BEVERLY
	endifjustbattled
	opentext
	checkflag ENGINE_BEVERLY_HAS_NUGGET
	iftrue .GiveNugget
	checkcellnum PHONE_POKEFAN_BEVERLY
	iftrue .NumberAccepted
	checkpoke MARILL
	iffalse .NoMarill
	checkevent EVENT_BEVERLY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext PokefanBeverlyCuteMonText
	promptbutton
	setevent EVENT_BEVERLY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .RequestNumber

.AskAgain:
	scall .AskNumber2
.RequestNumber:
	askforphonenumber PHONE_POKEFAN_BEVERLY
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, POKEFANF, BEVERLY1
	scall .RegisteredNumber
	sjump .NumberAccepted

.GiveNugget:
	scall .Gift
	verbosegiveitem NUGGET
	iffalse .NoRoom
	clearflag ENGINE_BEVERLY_HAS_NUGGET
	sjump .NumberAccepted

.NoRoom:
	sjump .PackFull

.NoMarill:
	writetext PokefanFBeverlyMarillFriendText
	waitbutton
	closetext
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

.Gift:
	jumpstd GiftFScript
	end

.PackFull:
	jumpstd PackFullFScript
	end

TrainerLassKrise:
	trainer LASS, KRISE, EVENT_BEAT_LASS_KRISE, LassKriseSeenText, LassKriseBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassKriseAfterBattleText
	waitbutton
	closetext
	end

NationalParkRelaxationSquareSign:
	jumptext NationalParkRelaxationSquareText

NationalParkBattleNoticeSign:
	jumptext NationalParkBattleNoticeText

NationalParkTrainerTipsSign:
	jumptext NationalParkTrainerTipsText

NationalParkParlyzHeal:
	itemball PARLYZ_HEAL

NationalParkTMDig:
	itemball TM_DIG

NationalParkHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_NATIONAL_PARK_HIDDEN_FULL_HEAL

NationalParkLassText:
	text "Nhìn này! Xem túi"
	line "của tôi!"

	para "Tôi in các #MON"
	line "yêu thích từ"

	para "#DEX và dán lên"
	line "túi của tôi."
	done

NationalParkPokefanFText:
	text "Đây là THƯ con"
	line "gái tôi gửi."
	cont "Nó làm tôi vui."
	done

NationalParkTeacher1Text:
	text "Hãy chú ý nào!"

	para "…Ối, tôi phải"
	line "thôi suy nghĩ như"

	para "một giáo viên"
	line "mọi lúc."

	para "Bạn chắc là HLV"
	line "#MON."

	para "Vì bạn đã cố"
	line "gắng rất nhiều,"

	para "tôi muốn bạn nhận"
	line "cái này."
	done

NationalParkTeacher1Text_GotQuickClaw:
	text "Cho #MON cầm"
	line "QUICK CLAW đó."

	para "Đôi khi nó sẽ"
	line "tấn công trước"
	cont "trong trận đấu."
	done

NationalParkYoungster1Text:
	text "Tôi đang chơi với"
	line "sticker in từ"
	cont "#DEX của tôi."
	done

NationalParkYoungster2Text:
	text "Tôi sẽ lấy sticker"
	line "#DEX của bạn ấy"
	cont "nếu tôi thắng."
	done

NationalParkTeacher2Text:
	text "Tôi đi dạo trong"
	line "VƯỜN, nhưng tôi"

	para "không bao giờ đi"
	line "vào cỏ."

	para "Các HLV luôn muốn"
	line "chiến đấu…"
	done

NationalParkPersianText:
	text "PERSIAN: Fufushaa!"
	done

NationalParkGameboyKidText:
	text "Tôi đang in"
	line "#DEX của tôi."

	para "Bạn cũng có thể"
	line "in những thứ như"

	para "THƯ và PC BOXES"
	line "của bạn."
	done

SchoolboyJack1SeenText:
	text "Thế giới #MON"
	line "rất sâu sắc."

	para "Vẫn còn rất nhiều"
	line "điều chúng ta"
	cont "chưa biết."

	para "Nhưng tôi biết"
	line "nhiều hơn bạn!"
	done

SchoolboyJack1BeatenText:
	text "Cái-cái gì?"
	done

SchoolboyJackTradeMonText:
	text "Có rất nhiều thứ"
	line "để học."

	para "Ví dụ…"

	para "Có {d:NUM_TMS} TM"
	line "khác nhau."

	para "#MON trao đổi"
	line "lên cấp nhanh hơn"
	done

PokefanfBeverly1SeenText:
	text "#MON của tôi"
	line "thật đáng yêu."

	para "Để tôi nói cho bạn"
	line "biết chúng khiến"
	cont "tôi tự hào thế nào"
	done

PokefanfBeverly1BeatenText:
	text "Tôi thắng bạn về"
	line "niềm tự hào…"
	done

PokefanBeverlyCuteMonText:
	text "Tôi phải nói rằng"
	line "#MON bạn cũng"
	cont "khá dễ thương."
	done

PokefanmWilliamSeenText:
	text "Chúng tôi yêu quý"
	line "#MON của mình,"
	cont "dù chúng ghét ta."

	para "Đó là ý nghĩa của"
	line "một FAN."
	done

PokefanmWilliamBeatenText:
	text "#MON của tôi!"
	done

PokefanmWilliamAfterBattleText:
	text "Tôi thua trận đấu"
	line "nhưng #MON của"

	para "tôi thắng giải"
	line "đáng yêu nhất."
	done

PokefanFBeverlyMarillFriendText:
	text "Bạn tôi có một"
	line "con MARILL!"

	para "Tôi thấy chúng rất"
	line "đáng yêu."

	para "Ôi, tôi ước có một"
	line "con MARILL…"
	done

LassKriseSeenText:
	text "Xin chào? Sao bạn"
	line "nhìn chằm chằm?"

	para "Ồ, muốn đấu à?"
	done

LassKriseBeatenText:
	text "…Hừm…"
	done

LassKriseAfterBattleText:
	text "Tôi nghĩ bạn nhìn"
	line "tôi vì tôi dễ"
	cont "thương!"
	done

NationalParkRelaxationSquareText:
	text "QUẢNG TRƯỜNG"
	line "VƯỜN QUỐC GIA"
	done

NationalParkBattleNoticeText:
	text "Thông báo gì đây?"

	para "Vui lòng chỉ đấu"
	line "trong bãi cỏ."

	para "VƯỜN QUỐC GIA"
	line "VP QUẢN LÝ"
	done

NationalParkTrainerTipsText:
	text "MẸO CHO HLV"

	para "In THƯ bằng cách"
	line "mở nó rồi nhấn"
	cont "nút START."
	done

NationalPark_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 33, 18, ROUTE_36_NATIONAL_PARK_GATE, 1
	warp_event 33, 19, ROUTE_36_NATIONAL_PARK_GATE, 2
	warp_event 10, 47, ROUTE_35_NATIONAL_PARK_GATE, 1
	warp_event 11, 47, ROUTE_35_NATIONAL_PARK_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 14, 44, BGEVENT_READ, NationalParkRelaxationSquareSign
	bg_event 27, 31, BGEVENT_READ, NationalParkBattleNoticeSign
	bg_event  6, 47, BGEVENT_ITEM, NationalParkHiddenFullHeal
	bg_event 12,  4, BGEVENT_READ, NationalParkTrainerTipsSign

	def_object_events
	object_event 15, 24, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NationalParkLassScript, -1
	object_event 14,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkPokefanFScript, -1
	object_event 27, 40, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NationalParkTeacher1Script, -1
	object_event 11, 41, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkYoungster1Script, -1
	object_event 10, 41, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NationalParkYoungster2Script, -1
	object_event 17, 41, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkTeacher2Script, -1
	object_event 26, 40, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkPersian, -1
	object_event 27, 23, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyJack1, -1
	object_event 18, 29, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerPokefanfBeverly1, -1
	object_event 16,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerPokefanmWilliam, -1
	object_event  8, 14, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassKrise, -1
	object_event 35, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkParlyzHeal, EVENT_NATIONAL_PARK_PARLYZ_HEAL
	object_event 26,  6, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkGameboyKidScript, -1
	object_event  1, 43, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkTMDig, EVENT_NATIONAL_PARK_TM_DIG
