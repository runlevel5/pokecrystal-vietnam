	object_const_def
	const AZALEAGYM_BUGSY
	const AZALEAGYM_BUG_CATCHER1
	const AZALEAGYM_BUG_CATCHER2
	const AZALEAGYM_BUG_CATCHER3
	const AZALEAGYM_TWIN1
	const AZALEAGYM_TWIN2
	const AZALEAGYM_GYM_GUIDE

AzaleaGym_MapScripts:
	def_scene_scripts

	def_callbacks

AzaleaGymBugsyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BUGSY
	iftrue .FightDone
	writetext BugsyText_INeverLose
	waitbutton
	closetext
	winlosstext BugsyText_ResearchIncomplete, 0
	loadtrainer BUGSY, BUGSY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BUGSY
	opentext
	writetext Text_ReceivedHiveBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_HIVEBADGE
	readvar VAR_BADGES
	scall AzaleaGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM49_FURY_CUTTER
	iftrue .GotFuryCutter
	setevent EVENT_BEAT_TWINS_AMY_AND_MAY
	setevent EVENT_BEAT_BUG_CATCHER_BENNY
	setevent EVENT_BEAT_BUG_CATCHER_AL
	setevent EVENT_BEAT_BUG_CATCHER_JOSH
	writetext BugsyText_HiveBadgeSpeech
	promptbutton
	verbosegiveitem TM_FURY_CUTTER
	iffalse .NoRoomForFuryCutter
	setevent EVENT_GOT_TM49_FURY_CUTTER
	writetext BugsyText_FuryCutterSpeech
	waitbutton
	closetext
	end

.GotFuryCutter:
	writetext BugsyText_BugMonsAreDeep
	waitbutton
.NoRoomForFuryCutter:
	closetext
	end

AzaleaGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerTwinsAmyandmay1:
	trainer TWINS, AMYANDMAY1, EVENT_BEAT_TWINS_AMY_AND_MAY, TwinsAmyandmay1SeenText, TwinsAmyandmay1BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinsAmyandmay1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsAmyandmay2:
	trainer TWINS, AMYANDMAY2, EVENT_BEAT_TWINS_AMY_AND_MAY, TwinsAmyandmay2SeenText, TwinsAmyandmay2BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinsAmyandmay2AfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherBenny:
	trainer BUG_CATCHER, BUG_CATCHER_BENNY, EVENT_BEAT_BUG_CATCHER_BENNY, BugCatcherBennySeenText, BugCatcherBennyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherBennyAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherAl:
	trainer BUG_CATCHER, AL, EVENT_BEAT_BUG_CATCHER_AL, BugCatcherAlSeenText, BugCatcherAlBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherAlAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherJosh:
	trainer BUG_CATCHER, JOSH, EVENT_BEAT_BUG_CATCHER_JOSH, BugCatcherJoshSeenText, BugCatcherJoshBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherJoshAfterBattleText
	waitbutton
	closetext
	end

AzaleaGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_BUGSY
	iftrue .AzaleaGymGuideWinScript
	opentext
	writetext AzaleaGymGuideText
	waitbutton
	closetext
	end

.AzaleaGymGuideWinScript:
	opentext
	writetext AzaleaGymGuideWinText
	waitbutton
	closetext
	end

AzaleaGymStatue:
	checkflag ENGINE_HIVEBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, BUGSY, BUGSY1
	jumpstd GymStatue2Script

BugsyText_INeverLose:
	text "Tôi là BUGSY!"
	line "Tôi không bao giờ"

	para "thua khi nói đến"
	line "#MON SÂU BỌ."

	para "Nghiên cứu của tôi"
	line "sẽ khiến tôi trở"

	para "thành chuyên gia"
	line "về #MON SÂU BỌ!"

	para "Để tôi cho bạn"
	line "thấy những gì tôi"
	cont "học được."
	done

BugsyText_ResearchIncomplete:
	text "Ồ, tuyệt vời!"
	line "Bạn là chuyên gia"
	cont "về #MON!"

	para "Nghiên cứu của tôi"
	line "chưa hoàn thành."

	para "OK, bạn thắng."
	line "Nhận HC này đi."
	done

Text_ReceivedHiveBadge:
	text "<PLAYER> nhận được"
	line "HC HIVE."
	done

BugsyText_HiveBadgeSpeech:
	text "Bạn có biết lợi"
	line "ích của HC HIVE"
	cont "không?"

	para "Nếu có nó, #MON"
	line "đến cấp 30 sẽ"

	para "nghe lời bạn, kể"
	line "cả loại trao đổi."

	para "#MON biết CẮT"
	line "có thể dùng nó"

	para "ngoài trận đấu"
	line "nữa."

	para "Đây, tôi cũng muốn"
	line "tặng bạn cái này."
	done

BugsyText_FuryCutterSpeech:
	text "TM49 chứa chiêu"
	line "CHÉM LIÊN."

	para "Nếu không hụt, nó"
	line "mạnh hơn mỗi lượt."

	para "Trận đấu càng dài,"
	line "nó càng tốt."

	para "Tuyệt vời không?"
	line "Tôi phát hiện ra!"
	done

BugsyText_BugMonsAreDeep:
	text "#MON SÂU BỌ rất"
	line "sâu sắc. Có nhiều"

	para "bí ẩn cần được"
	line "khám phá."

	para "Hãy nghiên cứu kỹ"
	line "những con bạn yêu"
	cont "thích."
	done

BugCatcherBennySeenText:
	text "#MON SÂU BỌ"
	line "tiến hóa sớm. Nên"

	para "chúng mạnh lên"
	line "nhanh hơn nhiều."
	done

BugCatcherBennyBeatenText:
	text "Chỉ tiến hóa thôi"
	line "là chưa đủ!"
	done

BugCatcherBennyAfterBattleText:
	text "#MON mạnh hơn"
	line "khi tiến hóa."
	cont "Thật đấy!"
	done

BugCatcherAlSeenText:
	text "#MON SÂU BỌ"
	line "ngầu và khỏe!"

	para "Tôi sẽ chứng minh"
	line "cho bạn xem!"
	done

BugCatcherAlBeatenText:
	text "Bạn chứng minh"
	line "bạn khỏe thế nào…"
	done

BugCatcherAlAfterBattleText:
	text "Chúng rất ngầu,"
	line "nhưng đa số con"

	para "gái không thích"
	line "#MON SÂU BỌ."

	para "Tôi không hiểu…"
	done

BugCatcherJoshSeenText:
	text "Bạn cứu hết"
	line "SLOWPOKE rồi à?"
	cont "Bạn giỏi quá!"

	para "Nhưng #MON lớn"
	line "của tôi cũng khá"
	cont "mạnh!"
	done

BugCatcherJoshBeatenText:
	text "Urrgggh!"
	done

BugCatcherJoshAfterBattleText:
	text "Chắc tôi nên dạy"
	line "chúng chiêu tốt"
	cont "hơn…"
	done

TwinsAmyandmay1SeenText:
	text "AMY: Chào! Bạn"
	line "thách đấu T.LĨNH"
	cont "à? Không đâu!"
	done

TwinsAmyandmay1BeatenText:
	text "AMY & MAY: Ôi,"
	line "tuyệt vời gấp đôi!"
	done

TwinsAmyandmay1AfterBattleText:
	text "AMY: Bạn giỏi"
	line "thật đấy!"
	done

TwinsAmyandmay2SeenText:
	text "MAY: Bạn muốn gặp"
	line "T.LĨNH à? Phải qua"
	cont "chúng tôi trước!"
	done

TwinsAmyandmay2BeatenText:
	text "AMY & MAY: Ôi,"
	line "tuyệt vời gấp đôi!"
	done

TwinsAmyandmay2AfterBattleText:
	text "MAY: Con bọ thua"
	line "rồi! Tiếc quá."
	done

AzaleaGymGuideText:
	text "Yo, người thách"
	line "đấu!"

	para "BUGSY còn trẻ,"
	line "nhưng kiến thức"

	para "về #MON SÂU BỌ"
	line "của cậu ấy là thật"

	para "Sẽ khó đấy nếu"
	line "không có lời"
	cont "khuyên của tôi."

	para "Để xem… #MON"
	line "SÂU BỌ không thích"
	cont "lửa."

	para "Chiêu hệ BAY LƯỢN"
	line "cũng siêu hiệu"
	cont "quả."
	done

AzaleaGymGuideWinText:
	text "Làm tốt lắm! Đó là"
	line "một trận đấu tuyệt"

	para "vời giữa các HLV"
	line "tài năng trẻ."

	para "Với những người"
	line "như bạn, tương lai"
	cont "của #MON sáng!"
	done

AzaleaGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, AZALEA_TOWN, 5
	warp_event  5, 15, AZALEA_TOWN, 5

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, AzaleaGymStatue
	bg_event  6, 13, BGEVENT_READ, AzaleaGymStatue

	def_object_events
	object_event  5,  7, SPRITE_BUGSY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AzaleaGymBugsyScript, -1
	object_event  5,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBugCatcherBenny, -1
	object_event  8,  8, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherAl, -1
	object_event  0,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherJosh, -1
	object_event  4, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAmyandmay1, -1
	object_event  5, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAmyandmay2, -1
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaGymGuideScript, -1
