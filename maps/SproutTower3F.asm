	object_const_def
	const SPROUTTOWER3F_SAGE1
	const SPROUTTOWER3F_SAGE2
	const SPROUTTOWER3F_SAGE3
	const SPROUTTOWER3F_SAGE4
	const SPROUTTOWER3F_POKE_BALL1
	const SPROUTTOWER3F_POKE_BALL2
	const SPROUTTOWER3F_RIVAL

SproutTower3F_MapScripts:
	def_scene_scripts
	scene_script SproutTower3FNoop1Scene, SCENE_SPROUTTOWER3F_RIVAL_ENCOUNTER
	scene_script SproutTower3FNoop2Scene, SCENE_SPROUTTOWER3F_NOOP

	def_callbacks

SproutTower3FNoop1Scene:
	end

SproutTower3FNoop2Scene:
	end

SproutTower3FRivalScene:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	pause 15
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	applymovement PLAYER, SproutTower3FPlayerApproachesRivalMovement
	applymovement SPROUTTOWER3F_RIVAL, SproutTower3FRivalApproachesElderMovement
	opentext
	writetext SproutTowerElderLecturesRivalText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SPROUTTOWER3F_RIVAL, 15
	turnobject SPROUTTOWER3F_RIVAL, DOWN
	pause 15
	applymovement SPROUTTOWER3F_RIVAL, SproutTower3FRivalLeavesElderMovement
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext SproutTowerRivalOnlyCareAboutStrongText
	waitbutton
	closetext
	turnobject SPROUTTOWER3F_RIVAL, UP
	opentext
	writetext SproutTowerRivalUsedEscapeRopeText
	pause 15
	closetext
	playsound SFX_WARP_TO
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear SPROUTTOWER3F_RIVAL
	waitsfx
	special FadeInFromBlack
	setscene SCENE_SPROUTTOWER3F_NOOP
	special RestartMapMusic
	end

SageLiScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM05_FLASH
	iftrue .GotFlash
	writetext SageLiSeenText
	waitbutton
	closetext
	winlosstext SageLiBeatenText, 0
	loadtrainer SAGE, LI
	startbattle
	reloadmapafterbattle
	opentext
	writetext SageLiTakeThisFlashText
	promptbutton
	verbosegiveitem HM_FLASH
	setevent EVENT_GOT_HM05_FLASH
	setevent EVENT_BEAT_SAGE_LI
	writetext SageLiFlashExplanationText
	waitbutton
	closetext
	end

.GotFlash:
	writetext SageLiAfterBattleText
	waitbutton
	closetext
	end

TrainerSageJin:
	trainer SAGE, JIN, EVENT_BEAT_SAGE_JIN, SageJinSeenText, SageJinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJinAfterBattleText
	waitbutton
	closetext
	end

TrainerSageTroy:
	trainer SAGE, TROY, EVENT_BEAT_SAGE_TROY, SageTroySeenText, SageTroyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageTroyAfterBattleText
	waitbutton
	closetext
	end

TrainerSageNeal:
	trainer SAGE, NEAL, EVENT_BEAT_SAGE_NEAL, SageNealSeenText, SageNealBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNealAfterBattleText
	waitbutton
	closetext
	end

SproutTower3FPainting:
	jumptext SproutTower3FPaintingText

SproutTower3FStatue:
	jumptext SproutTower3FStatueText

SproutTower3FPotion:
	itemball POTION

SproutTower3FEscapeRope:
	itemball ESCAPE_ROPE

SproutTower3FPlayerApproachesRivalMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

SproutTower3FRivalApproachesElderMovement:
	step UP
	step_end

SproutTower3FRivalLeavesElderMovement:
	step RIGHT
	step DOWN
	step_end

SproutTowerElderLecturesRivalText:
	text "TRƯỞNG LÃO: Con"
	line "quả thật giỏi"
	cont "như một HLV."

	para "Như đã hứa, đây"
	line "là HM của con."

	para "Nhưng để ta nói"
	line "điều này: Con nên"

	para "đối xử #MON"
	line "tốt hơn."

	para "Cách con chiến"
	line "đấu quá khắc"
	cont "nghiệt."

	para "#MON không phải"
	line "công cụ chiến…"
	done

SproutTowerRivalOnlyCareAboutStrongText:
	text "…"
	line "…Hừ!"

	para "Ông ta tự xưng"
	line "là TRƯỞNG LÃO"
	cont "nhưng lại yếu."

	para "Điều đó đúng"
	line "thôi."

	para "Tao không bao giờ"
	line "thua những kẻ"

	para "ngu ngốc ba hoa"
	line "về tử tế với"
	cont "#MON."

	para "Tao chỉ quan tâm"
	line "#MON mạnh có"
	cont "thể thắng."

	para "Tao thật sự không"
	line "quan tâm #MON"
	cont "yếu."
	done

SproutTowerRivalUsedEscapeRopeText:
	text "<RIVAL> đã dùng"
	line "DÂY THOÁT!"
	done

SageLiSeenText:
	text "Tốt khi con đến"
	line "đây!"

	para "THÁP MADATSUBOMI"
	line "là nơi tu luyện."

	para "Con người và"
	line "#MON thử thách"

	para "tình bạn để xây"
	line "tương lai tươi."

	para "Ta là thử thách"
	line "cuối cùng."

	para "Hãy để ta kiểm"
	line "tra sợi dây giữa"

	para "#MON và"
	line "con!"
	done

SageLiBeatenText:
	text "À, tuyệt vời!"
	done

SageLiTakeThisFlashText:
	text "Con và #MON"
	line "của con không có"

	para "vấn đề gì khi"
	line "dùng chiêu này."

	para "Cầm lấy HM ÁNH"
	line "CHỚP này."
	done

SageLiFlashExplanationText:
	text "ÁNH CHỚP sáng"
	line "ngay cả nơi tối"
	cont "nhất."

	para "Nhưng để dùng"
	line "ngoài chiến đấu,"

	para "con cần HUY HIỆU"
	line "từ GYM KIKYO."
	done

SageLiAfterBattleText:
	text "Ta hy vọng con"
	line "học hỏi và trưởng"
	cont "thành từ hành"
	cont "trình của con."
	done

SageJinSeenText:
	text "Tôi tu luyện để"
	line "tìm giác ngộ"
	cont "trong #MON!"
	done

SageJinBeatenText:
	text "Tu luyện của tôi"
	line "chưa hoàn thành…"
	done

SageJinAfterBattleText:
	text "Khi #MON mạnh"
	line "hơn, HLV cũng vậy"

	para "Không, đợi đã."
	line "Khi HLV mạnh hơn,"

	para "#MON cũng"
	line "mạnh theo."
	done

SageTroySeenText:
	text "Để tôi xem con"
	line "tin tưởng #MON"
	cont "bao nhiêu."
	done

SageTroyBeatenText:
	text "Đúng, niềm tin"
	line "của con là thật!"
	done

SageTroyAfterBattleText:
	text "Không còn xa đến"
	line "TRƯỞNG LÃO."
	done

SageNealSeenText:
	text "HM của TRƯỞNG LÃO"
	line "chiếu sáng bóng"
	cont "tối đen nhất."
	done

SageNealBeatenText:
	text "Chính đầu tôi"
	line "mới sáng!"
	done

SageNealAfterBattleText:
	text "Cầu cho ánh sáng"
	line "trên hành trình."
	done

SproutTower3FPaintingText:
	text "Đây là bức tranh"
	line "BELLSPROUT đầy"
	cont "uy lực."
	done

SproutTower3FStatueText:
	text "Tượng #MON…"

	para "Trông rất"
	line "uy nghi."
	done

SproutTower3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 14, SPROUT_TOWER_2F, 4

	def_coord_events
	coord_event 11,  9, SCENE_SPROUTTOWER3F_RIVAL_ENCOUNTER, SproutTower3FRivalScene

	def_bg_events
	bg_event  8,  1, BGEVENT_READ, SproutTower3FStatue
	bg_event 11,  1, BGEVENT_READ, SproutTower3FStatue
	bg_event  9,  0, BGEVENT_READ, SproutTower3FPainting
	bg_event 10,  0, BGEVENT_READ, SproutTower3FPainting
	bg_event  5, 15, BGEVENT_READ, SproutTower3FStatue
	bg_event 14, 15, BGEVENT_READ, SproutTower3FStatue

	def_object_events
	object_event  8, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageJin, -1
	object_event  8,  8, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSageTroy, -1
	object_event 10,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SageLiScript, -1
	object_event 11, 11, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageNeal, -1
	object_event  6, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower3FPotion, EVENT_SPROUT_TOWER_3F_POTION
	object_event 14,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower3FEscapeRope, EVENT_SPROUT_TOWER_3F_ESCAPE_ROPE
	object_event 10,  4, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_SPROUT_TOWER
