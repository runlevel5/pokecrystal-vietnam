	object_const_def
	const PLAYERSHOUSE1F_MOM1
	const PLAYERSHOUSE1F_MOM2
	const PLAYERSHOUSE1F_MOM3
	const PLAYERSHOUSE1F_MOM4
	const PLAYERSHOUSE1F_POKEFAN_F

PlayersHouse1F_MapScripts:
	def_scene_scripts
	scene_script PlayersHouse1FNoop1Scene, SCENE_PLAYERSHOUSE1F_MEET_MOM
	scene_script PlayersHouse1FNoop2Scene, SCENE_PLAYERSHOUSE1F_NOOP

	def_callbacks

PlayersHouse1FNoop1Scene:
	end

PlayersHouse1FNoop2Scene:
	end

MeetMomLeftScript:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

MeetMomRightScript:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	turnobject PLAYER, LEFT
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .OnRight
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsTowardPlayerMovement
	sjump MeetMomScript

.OnRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksToPlayerMovement
MeetMomScript:
	opentext
	writetext ElmsLookingForYouText
	promptbutton
	getstring STRING_BUFFER_4, PokegearName
	scall PlayersHouse1FReceiveItemStd
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	addcellnum PHONE_MOM
	setscene SCENE_PLAYERSHOUSE1F_NOOP
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	writetext MomGivesPokegearText
	promptbutton
	special SetDayOfWeek
.SetDayOfWeek:
	writetext IsItDSTText
	yesorno
	iffalse .WrongDay
	special InitialSetDSTFlag
	yesorno
	iffalse .SetDayOfWeek
	sjump .DayOfWeekDone

.WrongDay:
	special InitialClearDSTFlag
	yesorno
	iffalse .SetDayOfWeek
.DayOfWeekDone:
	writetext ComeHomeForDSTText
	yesorno
	iffalse .ExplainPhone
	sjump .KnowPhone

.KnowPhone:
	writetext KnowTheInstructionsText
	promptbutton
	sjump .FinishPhone

.ExplainPhone:
	writetext DontKnowTheInstructionsText
	promptbutton
	sjump .FinishPhone

.FinishPhone:
	writetext InstructionsNextText
	waitbutton
	closetext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .FromRight
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iffalse .FromLeft
	sjump .Finish

.FromRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsBackMovement
	sjump .Finish

.FromLeft:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksBackMovement
	sjump .Finish

.Finish:
	special RestartMapMusic
	turnobject PLAYERSHOUSE1F_MOM1, LEFT
	end

MeetMomTalkedScript:
	playmusic MUSIC_MOM
	sjump MeetMomScript

PokegearName:
	db "#GEAR@"

PlayersHouse1FReceiveItemStd:
	jumpstd ReceiveItemScript
	end

MomScript:
	faceplayer
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	checkscene
	iffalse MeetMomTalkedScript ; SCENE_PLAYERSHOUSE1F_MEET_MOM
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	iftrue .FirstTimeBanking
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .BankOfMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .GaveMysteryEgg
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .GotAPokemon
	writetext HurryUpElmIsWaitingText
	waitbutton
	closetext
	end

.GotAPokemon:
	writetext SoWhatWasProfElmsErrandText
	waitbutton
	closetext
	end

.FirstTimeBanking:
	writetext ImBehindYouText
	waitbutton
	closetext
	end

.GaveMysteryEgg:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MOM
.BankOfMom:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	special BankOfMom
	waitbutton
	closetext
	end

NeighborScript:
	faceplayer
	opentext
	checktime MORN
	iftrue .MornScript
	checktime DAY
	iftrue .DayScript
	checktime NITE
	iftrue .NiteScript

.MornScript:
	writetext NeighborMornIntroText
	promptbutton
	sjump .Main

.DayScript:
	writetext NeighborDayIntroText
	promptbutton
	sjump .Main

.NiteScript:
	writetext NeighborNiteIntroText
	promptbutton
	sjump .Main

.Main:
	writetext NeighborText
	waitbutton
	closetext
	turnobject PLAYERSHOUSE1F_POKEFAN_F, RIGHT
	end

PlayersHouse1FTVScript:
	jumptext PlayersHouse1FTVText

PlayersHouse1FStoveScript:
	jumptext PlayersHouse1FStoveText

PlayersHouse1FSinkScript:
	jumptext PlayersHouse1FSinkText

PlayersHouse1FFridgeScript:
	jumptext PlayersHouse1FFridgeText

MomTurnsTowardPlayerMovement:
	turn_head RIGHT
	step_end

MomWalksToPlayerMovement:
	slow_step RIGHT
	step_end

MomTurnsBackMovement:
	turn_head LEFT
	step_end

MomWalksBackMovement:
	slow_step LEFT
	step_end

ElmsLookingForYouText:
	text "Ồ, <PLAYER>…! Hàng"
	line "xóm của mình,"

	para "GS ELM, đang"
	line "tìm con đấy."

	para "Ông ấy muốn con"
	line "giúp việc gì đó."

	para "Ồ! Mẹ suýt quên!"
	line "#GEAR của con"

	para "đã sửa xong rồi."

	para "Đây này!"
	done

MomGivesPokegearText:
	text "MÁY #MON, hay"
	line "gọi tắt #GEAR."

	para "Nó rất cần thiết"
	line "nếu con muốn trở"
	cont "thành HLV giỏi."

	para "À, ngày trong tuần"
	line "chưa được đặt."

	para "Con đừng quên"
	line "điều đó nhé!"
	done

IsItDSTText:
	text "Bây giờ có phải"
	line "Giờ Mùa Hè không?"
	done

ComeHomeForDSTText:
	text "Về nhà để chỉnh"
	line "đồng hồ cho Giờ"
	cont "Mùa Hè nhé."

	para "À mà, con có biết"
	line "dùng ĐIỆN THOẠI"
	cont "không?"
	done

KnowTheInstructionsText:
	text "Chỉ cần bật"
	line "#GEAR và chọn"

	para "biểu tượng ĐIỆN"
	line "THOẠI phải không?"
	done

DontKnowTheInstructionsText:
	text "Để mẹ đọc hướng"
	line "dẫn nhé."

	para "Bật #GEAR lên"
	line "và chọn biểu"
	cont "tượng ĐIỆN THOẠI."
	done

InstructionsNextText:
	text "Số điện thoại"
	line "được lưu trong"
	cont "bộ nhớ."

	para "Chỉ cần chọn tên"
	line "người muốn gọi."

	para "Tiện lợi quá"
	line "phải không nào?"
	done

HurryUpElmIsWaitingText:
	text "GS ELM đang chờ"
	line "con đấy."

	para "Nhanh lên con!"
	done

SoWhatWasProfElmsErrandText:
	text "Vậy GS ELM nhờ"
	line "con việc gì?"

	para "…"

	para "Nghe có vẻ thử"
	line "thách đấy."

	para "Nhưng, con nên tự"
	line "hào vì mọi người"
	cont "tin tưởng con."
	done

ImBehindYouText:
	text "<PLAYER>, cố lên!"

	para "Mẹ luôn ủng hộ"
	line "con!"
	done

NeighborMornIntroText:
	text "Chào buổi sáng,"
	line "<PLAY_G>!"

	para "Cô sang chơi đây!"
	done

NeighborDayIntroText:
	text "Chào, <PLAY_G>!"
	line "Cô sang chơi đây!"
	done

NeighborNiteIntroText:
	text "Chào buổi tối,"
	line "<PLAY_G>!"

	para "Cô sang chơi đây!"
	done

NeighborText:
	text "<PLAY_G>, con có"
	line "nghe chưa?"

	para "Con gái cô nhất"
	line "định muốn làm"

	para "trợ lý cho"
	line "GS ELM."

	para "Nó rất yêu"
	line "#MON!"
	done

PlayersHouse1FStoveText:
	text "Món đặc biệt"
	line "của Mẹ!"

	para "BURGER NÚI LỬA"
	line "CINNABAR!"
	done

PlayersHouse1FSinkText:
	text "Bồn rửa sạch"
	line "bóng. Mẹ thích"
	cont "sự sạch sẽ."
	done

PlayersHouse1FFridgeText:
	text "Xem trong tủ lạnh"
	line "có gì nào…"

	para "NƯỚC SUỐI và"
	line "NƯỚC CHANH ngon!"
	done

PlayersHouse1FTVText:
	text "Có phim trên TV:"
	line "Sao lấp lánh trên"

	para "bầu trời khi hai"
	line "cậu bé đi tàu…"

	para "Mình cũng phải"
	line "lên đường thôi!"
	done

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  7, NEW_BARK_TOWN, 2
	warp_event  7,  7, NEW_BARK_TOWN, 2
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	def_coord_events
	coord_event  8,  4, SCENE_PLAYERSHOUSE1F_MEET_MOM, MeetMomLeftScript
	coord_event  9,  4, SCENE_PLAYERSHOUSE1F_MEET_MOM, MeetMomRightScript

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, PlayersHouse1FStoveScript
	bg_event  1,  1, BGEVENT_READ, PlayersHouse1FSinkScript
	bg_event  2,  1, BGEVENT_READ, PlayersHouse1FFridgeScript
	bg_event  4,  1, BGEVENT_READ, PlayersHouse1FTVScript

	def_object_events
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  2,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  0,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  4,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NeighborScript, EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
