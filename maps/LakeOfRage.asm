	object_const_def
	const LAKEOFRAGE_LANCE
	const LAKEOFRAGE_GRAMPS
	const LAKEOFRAGE_SUPER_NERD1
	const LAKEOFRAGE_COOLTRAINER_F1
	const LAKEOFRAGE_FISHER1
	const LAKEOFRAGE_FISHER2
	const LAKEOFRAGE_COOLTRAINER_M
	const LAKEOFRAGE_COOLTRAINER_F2
	const LAKEOFRAGE_GYARADOS
	const LAKEOFRAGE_WESLEY
	const LAKEOFRAGE_POKE_BALL1
	const LAKEOFRAGE_POKE_BALL2

LakeOfRage_MapScripts:
	def_scene_scripts
	scene_script LakeOfRageNoop1Scene ; unusable
	scene_script LakeOfRageNoop2Scene ; unusable

	def_callbacks
	callback MAPCALLBACK_NEWMAP, LakeOfRageFlypointCallback
	callback MAPCALLBACK_OBJECTS, LakeOfRageWesleyCallback

LakeOfRageNoop1Scene:
	end

LakeOfRageNoop2Scene:
	end

LakeOfRageFlypointCallback:
	setflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	endcallback

LakeOfRageWesleyCallback:
	readvar VAR_WEEKDAY
	ifequal WEDNESDAY, .WesleyAppears
	disappear LAKEOFRAGE_WESLEY
	endcallback

.WesleyAppears:
	appear LAKEOFRAGE_WESLEY
	endcallback

LakeOfRageLanceScript:
	checkevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	iftrue .AskAgainForHelp
	opentext
	writetext LakeOfRageLanceForcedToEvolveText
	promptbutton
	faceplayer
	writetext LakeOfRageLanceIntroText
	yesorno
	iffalse .RefusedToHelp
.AgreedToHelp:
	writetext LakeOfRageLanceRadioSignalText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement LAKEOFRAGE_LANCE, LakeOfRageLanceTeleportIntoSkyMovement
	disappear LAKEOFRAGE_LANCE
	clearevent EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	setevent EVENT_DECIDED_TO_HELP_LANCE
	setmapscene MAHOGANY_MART_1F, SCENE_MAHOGANYMART1F_LANCE_UNCOVERS_STAIRS
	end

.RefusedToHelp:
	writetext LakeOfRageLanceRefusedText
	waitbutton
	closetext
	setevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	end

.AskAgainForHelp:
	faceplayer
	opentext
	writetext LakeOfRageLanceAskHelpText
	yesorno
	iffalse .RefusedToHelp
	sjump .AgreedToHelp

RedGyarados:
	opentext
	writetext LakeOfRageGyaradosCryText
	pause 15
	cry GYARADOS
	closetext
	loadwildmon GYARADOS, 30
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCESHINY
	startbattle
	ifequal LOSE, .NotBeaten
	disappear LAKEOFRAGE_GYARADOS
.NotBeaten:
	reloadmapafterbattle
	opentext
	giveitem RED_SCALE
	waitsfx
	writetext LakeOfRageGotRedScaleText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	setscene 0 ; Lake of Rage does not have a scene variable
	appear LAKEOFRAGE_LANCE
	end

LakeOfRageGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	writetext LakeOfRageGrampsText
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext LakeOfRageGrampsText_ClearedRocketHideout
	waitbutton
	closetext
	end

LakeOfRageSuperNerdScript:
	jumptextfaceplayer LakeOfRageSuperNerdText

LakeOfRageCooltrainerFScript:
	jumptextfaceplayer LakeOfRageCooltrainerFText

LakeOfRageSign:
	jumptext LakeOfRageSignText

MagikarpHouseSignScript:
	opentext
	writetext FishingGurusHouseSignText
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .MagikarpLengthRecord
	waitbutton
	closetext
	end

.MagikarpLengthRecord:
	promptbutton
	special MagikarpHouseSign
	closetext
	end

TrainerFisherAndre:
	trainer FISHER, ANDRE, EVENT_BEAT_FISHER_ANDRE, FisherAndreSeenText, FisherAndreBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherAndreAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherRaymond:
	trainer FISHER, RAYMOND, EVENT_BEAT_FISHER_RAYMOND, FisherRaymondSeenText, FisherRaymondBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherRaymondAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermAaron:
	trainer COOLTRAINERM, AARON, EVENT_BEAT_COOLTRAINERM_AARON, CooltrainermAaronSeenText, CooltrainermAaronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAaronAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfLois:
	trainer COOLTRAINERF, LOIS, EVENT_BEAT_COOLTRAINERF_LOIS, CooltrainerfLoisSeenText, CooltrainerfLoisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfLoisAfterBattleText
	waitbutton
	closetext
	end

WesleyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	iftrue WesleyWednesdayScript
	readvar VAR_WEEKDAY
	ifnotequal WEDNESDAY, WesleyNotWednesdayScript
	checkevent EVENT_MET_WESLEY_OF_WEDNESDAY
	iftrue .MetWesley
	writetext MeetWesleyText
	promptbutton
	setevent EVENT_MET_WESLEY_OF_WEDNESDAY
.MetWesley:
	writetext WesleyGivesGiftText
	promptbutton
	verbosegiveitem BLACKBELT_I
	iffalse WesleyDoneScript
	setevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	writetext WesleyGaveGiftText
	waitbutton
	closetext
	end

WesleyWednesdayScript:
	writetext WesleyWednesdayText
	waitbutton
WesleyDoneScript:
	closetext
	end

WesleyNotWednesdayScript:
	writetext WesleyNotWednesdayText
	waitbutton
	closetext
	end

LakeOfRageElixer:
	itemball ELIXER

LakeOfRageTMDetect:
	itemball TM_DETECT

LakeOfRageHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_LAKE_OF_RAGE_HIDDEN_FULL_RESTORE

LakeOfRageHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_LAKE_OF_RAGE_HIDDEN_RARE_CANDY

LakeOfRageHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_LAKE_OF_RAGE_HIDDEN_MAX_POTION

LakeOfRageLanceTeleportIntoSkyMovement:
	teleport_from
	step_end

LakeOfRageLanceForcedToEvolveText:
	text "Hồ này toàn"
	line "GYARADOS mà không"
	cont "có gì khác…"

	para "Vậy là MAGIKARP"
	line "đang bị ép phải"
	cont "tiến hóa…"
	done

LakeOfRageLanceIntroText:
	text "Con đến đây vì"
	line "nghe tin đồn à?"

	para "Con là <PLAYER>?"
	line "Ta là LANCE, một"
	cont "HLV như con."

	para "Ta nghe vài tin"
	line "đồn, nên đến đây"
	cont "điều tra…"

	para "Ta thấy cách con"
	line "chiến đấu lúc"
	cont "trước, <PLAY_G>."

	para "Ta thấy con là"
	line "một HLV có tài"
	cont "năng đáng kể."

	para "Nếu con không"
	line "ngại, con có thể"

	para "giúp ta điều tra"
	line "không?"
	done

LakeOfRageLanceRadioSignalText:
	text "LANCE: Tuyệt vời!"

	para "Hình như MAGIKARP"
	line "ở hồ đang bị ép"
	cont "phải tiến hóa."

	para "Một tín hiệu radio"
	line "bí ẩn từ MAHOGANY"
	cont "là nguyên nhân."

	para "Ta sẽ đợi con ở"
	line "đó, <PLAY_G>."
	done

LakeOfRageLanceRefusedText:
	text "Ồ… Nếu con đổi"
	line "ý, hãy giúp ta"
	cont "nhé."
	done

LakeOfRageLanceAskHelpText:
	text "LANCE: Hm? Con sẽ"
	line "giúp ta chứ?"
	done

LakeOfRageGyaradosCryText:
	text "GYARADOS: Gyashaa!"
	done

LakeOfRageGotRedScaleText:
	text "<PLAYER> nhận được"
	line "VẢY ĐỎ."
	done

LakeOfRageGrampsText:
	text "Bầy GYARADOS đang"
	line "giận dữ!"

	para "Đây là điềm xấu!"
	done

LakeOfRageGrampsText_ClearedRocketHideout:
	text "Hahah! MAGIKARP"
	line "cắn câu rồi!"
	done

LakeOfRageSuperNerdText:
	text "Tôi nghe hồ này"
	line "được tạo ra bởi"
	cont "bầy GYARADOS."

	para "Không biết có liên"
	line "quan gì đến vụ"

	para "bùng phát số lượng"
	line "hiện tại không?"
	done

LakeOfRageCooltrainerFText:
	text "Mắt tôi có bị hoa"
	line "không? Tôi thấy"

	para "một GYARADOS ĐỎ"
	line "trong hồ…"

	para "Nhưng tôi nghĩ"
	line "GYARADOS thường"
	cont "màu xanh mà?"
	done

FisherAndreSeenText:
	text "Để tôi đấu với"
	line "#MON tôi vừa"
	cont "bắt được!"
	done

FisherAndreBeatenText:
	text "Tôi có thể là tay"
	line "câu chuyên nghiệp,"

	para "nhưng huấn luyện"
	line "#MON thì tệ…"
	done

FisherAndreAfterBattleText:
	text "Câu cá thì tôi"
	line "không thua ai!"

	para "Tôi câu #MON"
	line "suốt ngày."
	done

FisherRaymondSeenText:
	text "Dù tôi làm gì, tôi"
	line "cũng chỉ bắt được"

	para "toàn cùng một loại"
	line "#MON…"
	done

FisherRaymondBeatenText:
	text "Dây câu của tôi"
	line "rối hết rồi…"
	done

FisherRaymondAfterBattleText:
	text "Sao tôi không câu"
	line "được #MON tốt?"
	done

CooltrainermAaronSeenText:
	text "Nếu một HLV thấy"
	line "HLV khác, anh ta"

	para "phải thách đấu."
	line "Đó là định mệnh"
	cont "của chúng tôi."
	done

CooltrainermAaronBeatenText:
	text "Phù…"
	line "Trận đấu hay."
	done

CooltrainermAaronAfterBattleText:
	text "#MON và HLV"
	line "trở nên mạnh mẽ"

	para "qua việc chiến"
	line "đấu liên tục."
	done

CooltrainerfLoisSeenText:
	text "Chuyện gì xảy ra"
	line "với GYARADOS ĐỎ?"

	para "Nó biến mất rồi?"

	para "Chán thật. Tôi"
	line "đến đây vô ích à?"

	para "Được rồi--hãy"
	line "đấu đi!"
	done

CooltrainerfLoisBeatenText:
	text "Giỏi lắm!"
	done

CooltrainerfLoisAfterBattleText:
	text "Nghĩ lại, tôi từng"
	line "thấy BUTTERFREE"
	cont "màu hồng."
	done

MeetWesleyText:
	text "WESLEY: Xin chào,"
	line "bạn khỏe không?"

	para "Vì hôm nay là Thứ"
	line "Tư, tôi là WESLEY"
	cont "của Thứ Tư."
	done

WesleyGivesGiftText:
	text "Rất vui được gặp"
	line "bạn. Hãy nhận món"
	cont "quà lưu niệm này."
	done

WesleyGaveGiftText:
	text "WESLEY: BLACKBELT"
	line "tăng sức mạnh của"
	cont "chiêu VÕ THUẬT."
	done

WesleyWednesdayText:
	text "WESLEY: Vì bạn tìm"
	line "được tôi, chắc bạn"

	para "đã gặp anh chị em"
	line "của tôi rồi."

	para "Hay bạn chỉ may"
	line "mắn thôi?"
	done

WesleyNotWednesdayText:
	text "WESLEY: Hôm nay"
	line "không phải Thứ Tư."
	cont "Thật đáng tiếc."
	done

LakeOfRageSignText:
	text "HỒ GYARADOS, cũng"
	line "gọi là HỒ CỦA"
	cont "SỰ GIẬN DỮ."
	done

FishingGurusHouseSignText:
	text "NHÀ CAO THỦ"
	line "CÂU CÁ"
	done

LakeOfRage_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  3, LAKE_OF_RAGE_HIDDEN_POWER_HOUSE, 1
	warp_event 27, 31, LAKE_OF_RAGE_MAGIKARP_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 21, 27, BGEVENT_READ, LakeOfRageSign
	bg_event 25, 31, BGEVENT_READ, MagikarpHouseSignScript
	bg_event 11, 28, BGEVENT_ITEM, LakeOfRageHiddenFullRestore
	bg_event  4,  4, BGEVENT_ITEM, LakeOfRageHiddenRareCandy
	bg_event 35,  5, BGEVENT_ITEM, LakeOfRageHiddenMaxPotion

	def_object_events
	object_event 21, 28, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageLanceScript, EVENT_LAKE_OF_RAGE_LANCE
	object_event 20, 26, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageGrampsScript, -1
	object_event 36, 13, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageSuperNerdScript, -1
	object_event 25, 29, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageCooltrainerFScript, -1
	object_event 30, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherAndre, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 24, 26, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherRaymond, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event  4, 15, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermAaron, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 36,  7, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerCooltrainerfLois, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 18, 22, SPRITE_GYARADOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RedGyarados, EVENT_LAKE_OF_RAGE_RED_GYARADOS
	object_event  4,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WesleyScript, EVENT_LAKE_OF_RAGE_WESLEY_OF_WEDNESDAY
	object_event  7, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LakeOfRageElixer, EVENT_LAKE_OF_RAGE_ELIXER
	object_event 35,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LakeOfRageTMDetect, EVENT_LAKE_OF_RAGE_TM_DETECT
