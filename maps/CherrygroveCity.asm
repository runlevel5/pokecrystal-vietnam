	object_const_def
	const CHERRYGROVECITY_GRAMPS
	const CHERRYGROVECITY_RIVAL
	const CHERRYGROVECITY_TEACHER
	const CHERRYGROVECITY_YOUNGSTER
	const CHERRYGROVECITY_FISHER

CherrygroveCity_MapScripts:
	def_scene_scripts
	scene_script CherrygroveCityNoop1Scene, SCENE_CHERRYGROVECITY_NOOP
	scene_script CherrygroveCityNoop2Scene, SCENE_CHERRYGROVECITY_MEET_RIVAL

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CherrygroveCityFlypointCallback

CherrygroveCityNoop1Scene:
	end

CherrygroveCityNoop2Scene:
	end

CherrygroveCityFlypointCallback:
	setflag ENGINE_FLYPOINT_CHERRYGROVE
	endcallback

CherrygroveCityGuideGent:
	faceplayer
	opentext
	writetext GuideGentIntroText
	yesorno
	iffalse .No
	sjump .Yes
.Yes:
	writetext GuideGentTourText1
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow CHERRYGROVECITY_GRAMPS, PLAYER
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement1
	opentext
	writetext GuideGentPokecenterText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement2
	turnobject PLAYER, UP
	opentext
	writetext GuideGentMartText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement3
	turnobject PLAYER, UP
	opentext
	writetext GuideGentRoute30Text
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement4
	turnobject PLAYER, LEFT
	opentext
	writetext GuideGentSeaText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement5
	turnobject PLAYER, UP
	pause 60
	turnobject CHERRYGROVECITY_GRAMPS, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext GuideGentGiftText
	promptbutton
	getstring STRING_BUFFER_4, .mapcardname
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext GotMapCardText
	promptbutton
	writetext GuideGentPokegearText
	waitbutton
	closetext
	stopfollow
	special RestartMapMusic
	turnobject PLAYER, UP
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement6
	playsound SFX_ENTER_DOOR
	disappear CHERRYGROVECITY_GRAMPS
	clearevent EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE
	waitsfx
	end

.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname
	db "MAP CARD@"

.No:
	writetext GuideGentNoText
	waitbutton
	closetext
	end

CherrygroveRivalSceneSouth:
	moveobject CHERRYGROVECITY_RIVAL, 39, 7
CherrygroveRivalSceneNorth:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear CHERRYGROVECITY_RIVAL
	applymovement CHERRYGROVECITY_RIVAL, CherrygroveCity_RivalWalksToYou
	turnobject PLAYER, RIGHT
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext CherrygroveRivalText_Seen
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext RivalCherrygroveWinText, RivalCherrygroveLossText
	setlasttalked CHERRYGROVECITY_RIVAL
	loadtrainer RIVAL1, RIVAL1_1_TOTODILE
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.Totodile:
	winlosstext RivalCherrygroveWinText, RivalCherrygroveLossText
	setlasttalked CHERRYGROVECITY_RIVAL
	loadtrainer RIVAL1, RIVAL1_1_CHIKORITA
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.Chikorita:
	winlosstext RivalCherrygroveWinText, RivalCherrygroveLossText
	setlasttalked CHERRYGROVECITY_RIVAL
	loadtrainer RIVAL1, RIVAL1_1_CYNDAQUIL
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.AfterVictorious:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext CherrygroveRivalText_YouWon
	waitbutton
	closetext
	sjump .FinishRival

.AfterYourDefeat:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext CherrygroveRivalText_YouLost
	waitbutton
	closetext
.FinishRival:
	playsound SFX_TACKLE
	applymovement PLAYER, CherrygroveCity_RivalPushesYouOutOfTheWay
	turnobject PLAYER, LEFT
	applymovement CHERRYGROVECITY_RIVAL, CherrygroveCity_RivalExitsStageLeft
	disappear CHERRYGROVECITY_RIVAL
	setscene SCENE_CHERRYGROVECITY_NOOP
	special HealParty
	playmapmusic
	end

CherrygroveTeacherScript:
	faceplayer
	opentext
	checkflag ENGINE_MAP_CARD
	iftrue .HaveMapCard
	writetext CherrygroveTeacherText_NoMapCard
	waitbutton
	closetext
	end

.HaveMapCard:
	writetext CherrygroveTeacherText_HaveMapCard
	waitbutton
	closetext
	end

CherrygroveYoungsterScript:
	faceplayer
	opentext
	checkflag ENGINE_POKEDEX
	iftrue .HavePokedex
	writetext CherrygroveYoungsterText_NoPokedex
	waitbutton
	closetext
	end

.HavePokedex:
	writetext CherrygroveYoungsterText_HavePokedex
	waitbutton
	closetext
	end

MysticWaterGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE
	iftrue .After
	writetext MysticWaterGuyTextBefore
	promptbutton
	verbosegiveitem MYSTIC_WATER
	iffalse .Exit
	setevent EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE
.After:
	writetext MysticWaterGuyTextAfter
	waitbutton
.Exit:
	closetext
	end

CherrygroveCitySign:
	jumptext CherrygroveCitySignText

GuideGentsHouseSign:
	jumptext GuideGentsHouseSignText

CherrygroveCityPokecenterSign:
	jumpstd PokecenterSignScript

CherrygroveCityMartSign:
	jumpstd MartSignScript

GuideGentMovement1:
	step LEFT
	step LEFT
	step UP
	step LEFT
	turn_head UP
	step_end

GuideGentMovement2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

GuideGentMovement3:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

GuideGentMovement4:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	turn_head LEFT
	step_end

GuideGentMovement5:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

GuideGentMovement6:
	step UP
	step UP
	step_end

CherrygroveCity_RivalWalksToYou:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

CherrygroveCity_RivalPushesYouOutOfTheWay:
	big_step DOWN
	turn_head UP
	step_end

CherrygroveCity_UnusedMovementData: ; unreferenced
	step LEFT
	turn_head DOWN
	step_end

CherrygroveCity_RivalExitsStageLeft:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

GuideGentIntroText:
	text "Bạn là HLV mới vào"
	line "nghề phải không?"
	cont "Tôi nhận ra!"

	para "Không sao! Ai cũng"
	line "từng là người mới"
	cont "mà!"

	para "Nếu muốn, tôi có"
	line "thể chỉ bạn vài"
	cont "điều."
	done

GuideGentTourText1:
	text "OK, vậy thì!"
	line "Đi theo tôi!"
	done

GuideGentPokecenterText:
	text "Đây là TRUNG TÂM"
	line "#MON. Họ hồi"

	para "phục #MON của"
	line "bạn rất nhanh."

	para "Bạn sẽ cần đến"
	line "họ nhiều, nên hãy"

	para "tìm hiểu về họ"
	line "đi."
	done

GuideGentMartText:
	text "Đây là CỬA HÀNG"
	line "#MART."

	para "Họ bán BALL để"
	line "bắt #MON hoang"

	para "dã và các vật"
	line "phẩm hữu ích."
	done

GuideGentRoute30Text:
	text "TUYẾN ĐƯỜNG 30 nằm"
	line "ở phía này."

	para "Các HLV sẽ chiến"
	line "đấu #MON quý"

	para "của họ ở đó."
	done

GuideGentSeaText:
	text "Đây là biển, như"
	line "bạn thấy đó."

	para "Một số #MON"
	line "chỉ sống trong"
	cont "nước."
	done

GuideGentGiftText:
	text "Đây rồi…"

	para "Đây là nhà tôi!"
	line "Cảm ơn đã đi cùng."

	para "Để tôi tặng bạn"
	line "món quà nhỏ."
	done

GotMapCardText:
	text "POKEGEAR của"
	line "<PLAYER> có BẢN ĐỒ"
	done

GuideGentPokegearText:
	text "POKEGEAR sẽ hữu"
	line "ích hơn khi bạn"
	cont "thêm THẺ vào."

	para "Chúc bạn may mắn"
	line "trên hành trình!"
	done

GuideGentNoText:
	text "Ồ… Tôi thích làm"
	line "việc này mà…"

	para "Thôi được. Ghé"
	line "thăm tôi khi rảnh."
	done

CherrygroveRivalText_Seen:
	text "<……> <……> <……>"

	para "Mày có #MON ở"
	line "PTN rồi à."

	para "Thật phí."
	line "Đồ yếu đuối."

	para "<……> <……> <……>"

	para "Mày không hiểu tao"
	line "nói gì à?"

	para "Tao cũng có một"
	line "#MON xịn sò."

	para "Tao sẽ cho mày"
	line "thấy!"
	done

RivalCherrygroveWinText:
	text "Hừ. Mày vui vì"
	line "thắng hả?"
	done

CherrygroveRivalText_YouLost:
	text "<……> <……> <……>"

	para "Tao tên ???."

	para "Tao sẽ trở thành"
	line "HLV #MON vĩ"
	cont "đại nhất thế"
	cont "giới."
	done

RivalCherrygroveLossText:
	text "Hừ. Thật phí"
	line "thời gian."
	done

CherrygroveRivalText_YouWon:
	text "<……> <……> <……>"

	para "Tao tên ???."

	para "Tao sẽ trở thành"
	line "HLV #MON vĩ"
	cont "đại nhất thế"
	cont "giới."
	done

CherrygroveTeacherText_NoMapCard:
	text "Bạn có nói chuyện"
	line "với ông già ở TT"
	cont "#MON chưa?"

	para "Ông ấy sẽ cài BẢN"
	line "ĐỒ JOHTO vào"
	cont "POKEGEAR của bạn."
	done

CherrygroveTeacherText_HaveMapCard:
	text "Khi đi cùng"
	line "#MON, đi đâu"
	cont "cũng vui."
	done

CherrygroveYoungsterText_NoPokedex:
	text "Nhà ÔNG LÃO"
	line "#MON còn xa"
	cont "hơn phía trước."
	done

CherrygroveYoungsterText_HavePokedex:
	text "Tôi đã đấu với"
	line "các HLV trên"
	cont "đường đi."

	para "#MON tôi thua."
	line "Chúng tan tác!"

	para "Tôi phải đưa chúng"
	line "đến TT #MON."
	done

MysticWaterGuyTextBefore:
	text "#MON tôi bắt"
	line "có mang vật phẩm."

	para "Tôi nghĩ đó là"
	line "NƯỚC HUYỀN BÍ."

	para "Tôi không cần, bạn"
	line "muốn không?"
	done

MysticWaterGuyTextAfter:
	text "Tôi quay lại câu"
	line "cá đây."
	done

CherrygroveCitySignText:
	text "TP. CHERRYGROVE"

	para "Thành phố hoa"
	line "dễ thương và thơm"
	done

GuideGentsHouseSignText:
	text "NHÀ ÔNG HƯỚNG DẪN"
	done

CherrygroveCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23,  3, CHERRYGROVE_MART, 2
	warp_event 29,  3, CHERRYGROVE_POKECENTER_1F, 1
	warp_event 17,  7, CHERRYGROVE_GYM_SPEECH_HOUSE, 1
	warp_event 25,  9, GUIDE_GENTS_HOUSE, 1
	warp_event 31, 11, CHERRYGROVE_EVOLUTION_SPEECH_HOUSE, 1

	def_coord_events
	coord_event 33,  6, SCENE_CHERRYGROVECITY_MEET_RIVAL, CherrygroveRivalSceneNorth
	coord_event 33,  7, SCENE_CHERRYGROVECITY_MEET_RIVAL, CherrygroveRivalSceneSouth

	def_bg_events
	bg_event 30,  8, BGEVENT_READ, CherrygroveCitySign
	bg_event 23,  9, BGEVENT_READ, GuideGentsHouseSign
	bg_event 24,  3, BGEVENT_READ, CherrygroveCityMartSign
	bg_event 30,  3, BGEVENT_READ, CherrygroveCityPokecenterSign

	def_object_events
	object_event 32,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveCityGuideGent, EVENT_GUIDE_GENT_IN_HIS_HOUSE
	object_event 39,  6, SPRITE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_CHERRYGROVE_CITY
	object_event 27, 12, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CherrygroveTeacherScript, -1
	object_event 23,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveYoungsterScript, -1
	object_event  7, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MysticWaterGuy, -1
