	object_const_def
	const TEAMROCKETBASEB2F_ROCKET1
	const TEAMROCKETBASEB2F_ROCKET_GIRL
	const TEAMROCKETBASEB2F_LANCE
	const TEAMROCKETBASEB2F_DRAGON
	const TEAMROCKETBASEB2F_ELECTRODE1
	const TEAMROCKETBASEB2F_ELECTRODE2
	const TEAMROCKETBASEB2F_ELECTRODE3
	const TEAMROCKETBASEB2F_ELECTRODE4
	const TEAMROCKETBASEB2F_ELECTRODE5
	const TEAMROCKETBASEB2F_ELECTRODE6
	const TEAMROCKETBASEB2F_ROCKET2
	const TEAMROCKETBASEB2F_ROCKET3
	const TEAMROCKETBASEB2F_ROCKET4
	const TEAMROCKETBASEB2F_POKE_BALL

TeamRocketBaseB2F_MapScripts:
	def_scene_scripts
	scene_script TeamRocketBaseB2FNoop1Scene, SCENE_TEAMROCKETBASEB2F_LANCE_HEALS
	scene_script TeamRocketBaseB2FNoop2Scene, SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS
	scene_script TeamRocketBaseB2FNoop3Scene, SCENE_TEAMROCKETBASEB2F_ELECTRODES
	scene_script TeamRocketBaseB2FNoop4Scene, SCENE_TEAMROCKETBASEB2F_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, TeamRocketBaseB2FTransmitterDoorCallback

TeamRocketBaseB2FNoop1Scene:
	end

TeamRocketBaseB2FNoop2Scene:
	end

TeamRocketBaseB2FNoop3Scene:
	end

TeamRocketBaseB2FNoop4Scene:
	end

TeamRocketBaseB2FTransmitterDoorCallback:
	checkevent EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	iftrue .OpenDoor
	endcallback

.OpenDoor:
	changeblock 14, 12, $07 ; floor
	endcallback

RocketBaseBossFLeft:
	moveobject TEAMROCKETBASEB2F_LANCE, 9, 13
	sjump RocketBaseBossFScript

RocketBaseBossFRight:
	moveobject TEAMROCKETBASEB2F_ROCKET_GIRL, 21, 16
	moveobject TEAMROCKETBASEB2F_ROCKET1, 21, 16
	moveobject TEAMROCKETBASEB2F_DRAGON, 10, 13
	moveobject TEAMROCKETBASEB2F_LANCE, 10, 13
RocketBaseBossFScript:
	appear TEAMROCKETBASEB2F_ROCKET_GIRL
	appear TEAMROCKETBASEB2F_ROCKET1
	opentext
	writetext RocketBaseExecutiveFHoldItText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, RocketBasePlayerApproachesBossFMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, RocketBaseBossFApproachesPlayerMovement
	turnobject PLAYER, UP
	applymovement TEAMROCKETBASEB2F_ROCKET1, RocketBaseGruntApproachesPlayerMovement
	opentext
	writetext RocketBaseBossFThrashText
	waitbutton
	closetext
	cry DRAGONITE
	turnobject TEAMROCKETBASEB2F_ROCKET_GIRL, LEFT
	turnobject PLAYER, LEFT
	appear TEAMROCKETBASEB2F_DRAGON
	applymovement TEAMROCKETBASEB2F_DRAGON, RocketBaseDragoniteAttacksMovement
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, RocketBaseBossFHitMovement
	applymovement TEAMROCKETBASEB2F_ROCKET1, RocketBaseGruntProtectsBossFMovement
	appear TEAMROCKETBASEB2F_LANCE
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceApproachesBossFMovement
	opentext
	writetext RocketBaseLanceShareFunText
	waitbutton
	closetext
	turnobject PLAYER, RIGHT
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, RocketBaseBossFFacesPlayerMovement
	opentext
	writetext RocketBaseBossDontMeddleText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_ROCKET1, RocketBaseGruntBattlesLanceMovement
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, RocketBaseBossFBattlesPlayerMovement
	winlosstext RocketBaseBossWinText, 0
	setlasttalked TEAMROCKETBASEB2F_ROCKET_GIRL
	loadtrainer EXECUTIVEF, EXECUTIVEF_2
	startbattle
	disappear TEAMROCKETBASEB2F_DRAGON
	setevent EVENT_TEAM_ROCKET_BASE_B2F_EXECUTIVE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_GRUNT_WITH_EXECUTIVE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_EXECUTIVEF_2
	opentext
	writetext RocketBaseBossRetreatText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear TEAMROCKETBASEB2F_ROCKET1
	disappear TEAMROCKETBASEB2F_ROCKET_GIRL
	disappear TEAMROCKETBASEB2F_ROCKET2
	disappear TEAMROCKETBASEB2F_ROCKET3
	disappear TEAMROCKETBASEB2F_ROCKET4
	pause 15
	special FadeInFromBlack
	setscene SCENE_TEAMROCKETBASEB2F_ELECTRODES
	clearevent EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	turnobject TEAMROCKETBASEB2F_LANCE, DOWN
	opentext
	writetext RocketBaseLancePostBattleText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceChecksPlayerMovement
	turnobject PLAYER, UP
	opentext
	writetext RocketBaseLancePowerOffText
	waitbutton
	closetext
	follow TEAMROCKETBASEB2F_LANCE, PLAYER
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceApproachesMachineMovement
	stopfollow
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLancePacesMovement
	opentext
	writetext RockerBaseLanceElectrodeFaintText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceApproachesElectrodesMovement
	disappear TEAMROCKETBASEB2F_LANCE

RocketBaseCantLeaveScript:
	applymovement PLAYER, RocketBasePlayerCantLeaveElectrodesMovement
	end

RocketBaseLancesSideScript:
	opentext
	writetext RocketBaseLancesSideText
	waitbutton
	closetext
	applymovement PLAYER, RocketBasePlayerCantGoRightMovement
	end

LanceHealsScript1:
	turnobject PLAYER, UP
	sjump LanceHealsCommon

LanceHealsScript2:
	turnobject PLAYER, RIGHT
	turnobject TEAMROCKETBASEB2F_LANCE, LEFT
LanceHealsCommon:
	opentext
	writetext LanceHealsText1
	waitbutton
	closetext
	special FadeOutToWhite
	special StubbedTrainerRankings_Healings
	playsound SFX_FULL_HEAL
	special HealParty
	special FadeInFromWhite
	opentext
	writetext LanceHealsText2
	waitbutton
	closetext
	setscene SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS
	setevent EVENT_LANCE_HEALED_YOU_IN_TEAM_ROCKET_BASE
	readvar VAR_FACING
	ifequal RIGHT, .FacingRight
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceLeavesAfterHealMovement
	disappear TEAMROCKETBASEB2F_LANCE
	end

.FacingRight:
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceLeavesAfterHealRightMovement
	disappear TEAMROCKETBASEB2F_LANCE
	end

TrainerGruntM17:
	trainer GRUNTM, GRUNTM_17, EVENT_BEAT_ROCKET_GRUNTM_17, GruntM17SeenText, GruntM17BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM17AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM18:
	trainer GRUNTM, GRUNTM_18, EVENT_BEAT_ROCKET_GRUNTM_18, GruntM18SeenText, GruntM18BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM18AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM19:
	trainer GRUNTM, GRUNTM_19, EVENT_BEAT_ROCKET_GRUNTM_19, GruntM19SeenText, GruntM19BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM19AfterBattleText
	waitbutton
	closetext
	end

RocketElectrode1:
	cry ELECTRODE
	loadwildmon ELECTRODE, 23
	startbattle
	iftrue TeamRocketBaseB2FReloadMap
	disappear TEAMROCKETBASEB2F_ELECTRODE1
	disappear TEAMROCKETBASEB2F_ELECTRODE4
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	iffalse TeamRocketBaseB2FReloadMap
	reloadmapafterbattle
	special PlayMapMusic
	applymovement PLAYER, RocketBasePlayerLeavesElectrodesMovement1
	sjump RocketBaseElectrodeScript

RocketElectrode2:
	cry ELECTRODE
	loadwildmon ELECTRODE, 23
	startbattle
	iftrue TeamRocketBaseB2FReloadMap
	disappear TEAMROCKETBASEB2F_ELECTRODE2
	disappear TEAMROCKETBASEB2F_ELECTRODE5
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	iffalse TeamRocketBaseB2FReloadMap
	reloadmapafterbattle
	special PlayMapMusic
	applymovement PLAYER, RocketBasePlayerLeavesElectrodesMovement2
	sjump RocketBaseElectrodeScript

RocketElectrode3:
	cry ELECTRODE
	loadwildmon ELECTRODE, 23
	startbattle
	iftrue TeamRocketBaseB2FReloadMap
	disappear TEAMROCKETBASEB2F_ELECTRODE3
	disappear TEAMROCKETBASEB2F_ELECTRODE6
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	iffalse TeamRocketBaseB2FReloadMap
	reloadmapafterbattle
	special PlayMapMusic
	applymovement PLAYER, RocketBasePlayerLeavesElectrodesMovement3
	sjump RocketBaseElectrodeScript

TeamRocketBaseB2FReloadMap:
	reloadmapafterbattle
	end

RocketBaseElectrodeScript:
	moveobject TEAMROCKETBASEB2F_LANCE, 18, 6
	appear TEAMROCKETBASEB2F_LANCE
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceLeavesElectrodesMovement
	turnobject PLAYER, RIGHT
	opentext
	writetext RocketBaseLanceElectrodeDoneText
	promptbutton
	verbosegiveitem HM_WHIRLPOOL
	setevent EVENT_GOT_HM06_WHIRLPOOL
	writetext RocketBaseLanceWhirlpoolText
	waitbutton
	closetext
	turnobject TEAMROCKETBASEB2F_LANCE, DOWN
	opentext
	writetext RocketBaseLanceMonMasterText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceLeavesBaseMovement
	disappear TEAMROCKETBASEB2F_LANCE
	setevent EVENT_CLEARED_ROCKET_HIDEOUT
	clearflag ENGINE_ROCKET_SIGNAL_ON_CH20
	setevent EVENT_ROUTE_43_GATE_ROCKETS
	setevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	setscene SCENE_TEAMROCKETBASEB2F_NOOP
	clearevent EVENT_LAKE_OF_RAGE_CIVILIANS
	setevent EVENT_TURNED_OFF_SECURITY_CAMERAS
	setevent EVENT_SECURITY_CAMERA_1
	setevent EVENT_SECURITY_CAMERA_2
	setevent EVENT_SECURITY_CAMERA_3
	setevent EVENT_SECURITY_CAMERA_4
	setevent EVENT_SECURITY_CAMERA_5
	end

TeamRocketBaseB2FLockedDoor:
	conditional_event EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER, .Script

.Script:
	opentext
	checkevent EVENT_LEARNED_HAIL_GIOVANNI
	iftrue .KnowsPassword
	writetext RocketBaseDoorNoPasswordText
	waitbutton
	closetext
	end

.KnowsPassword:
	writetext RocketBaseDoorKnowPasswordText
	waitbutton
	playsound SFX_ENTER_DOOR
	changeblock 14, 12, $07 ; floor
	refreshmap
	closetext
	setevent EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	waitsfx
	end

TeamRocketBaseB2FTransmitterScript:
	opentext
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .Deactivated
	writetext RocketBaseB2FTransmitterText
	waitbutton
	closetext
	end

.Deactivated:
	writetext RocketBaseB2FDeactivateTransmitterText
	waitbutton
	closetext
	end

TeamRocketBaseB2FTMThief:
	itemball TM_THIEF

TeamRocketBaseB2FHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_TEAM_ROCKET_BASE_B2F_HIDDEN_FULL_HEAL

RocketBaseLanceLeavesAfterHealMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RocketBaseLanceLeavesAfterHealRightMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RocketBasePlayerApproachesBossFMovement:
	step DOWN
	step DOWN
	step DOWN
	turn_head RIGHT
	step_end

RocketBaseBossFApproachesPlayerMovement:
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	turn_head DOWN
	step_end

RocketBaseGruntApproachesPlayerMovement:
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

RocketBaseDragoniteAttacksMovement:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

RocketBaseBossFHitMovement:
	fix_facing
	set_sliding
	jump_step RIGHT
	remove_sliding
	remove_fixed_facing
	step_end

RocketBaseBossFFacesPlayerMovement:
	slow_step DOWN
	turn_head LEFT
	step_end

RocketBaseLanceApproachesBossFMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RocketBaseBossFBattlesPlayerMovement:
	big_step LEFT
	step_end

RocketBaseGruntBattlesLanceMovement:
	big_step LEFT
	step_end

RocketBaseGruntProtectsBossFMovement:
	big_step LEFT
	big_step UP
	turn_head LEFT
	step_end

RocketBaseLanceChecksPlayerMovement:
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

RocketBaseLanceApproachesMachineMovement:
	step UP
	step UP
	step UP
	step_end

RocketBaseLancePacesMovement:
	step_sleep 8
	step LEFT
	step LEFT
	turn_head UP
	step_sleep 8
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_sleep 8
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

RocketBaseLanceApproachesElectrodesMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

RocketBasePlayerCantLeaveElectrodesMovement:
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

RocketBasePlayerCantGoRightMovement:
	step LEFT
	step_end

RocketBaseLanceLeavesElectrodesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step_end

RocketBaseLanceLeavesBaseMovement:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

RocketBasePlayerLeavesElectrodesMovement1:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RocketBasePlayerLeavesElectrodesMovement2:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RocketBasePlayerLeavesElectrodesMovement3:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RocketBaseExecutiveFHoldItText:
	text "Đứng lại đó!"
	done

RocketBaseBossFThrashText:
	text "Bọn tao không thể"
	line "để một thằng nhóc"
	cont "như mày chạy quanh"
	cont "được."

	para "Mày làm tổn hại"
	line "danh dự của"
	cont "ĐỘI ROCKET đấy."

	para "Dù mày có mạnh đến"
	line "đâu, mày không thể"

	para "đánh cả hai bọn"
	line "tao cùng lúc."

	para "Xin lỗi nhé, nhóc."
	line "Chuẩn bị ăn đòn"
	cont "đi!"
	done

RocketBaseLanceShareFunText:
	text "Này! Đừng ích kỷ"
	line "thế. Hãy chia sẻ"
	cont "niềm vui nào."
	done

RocketBaseBossDontMeddleText:
	text "Cái gì? Mày có"
	line "đồng bọn à?"

	para "Danh dự của bọn"
	line "mày ở đâu rồi?"

	para "Với tư cách là"
	line "trùm tạm thời thay"

	para "GIOVANNI, tao sẽ"
	line "cho bọn mày thấy"

	para "cái giá của việc"
	line "chọc ĐỘI ROCKET!"
	done

RocketBaseBossWinText:
	text "Tch, bọn mày thật"
	line "sự mạnh."

	para "Thật đáng tiếc."

	para "Nếu mày gia nhập"
	line "ĐỘI ROCKET,"

	para "mày có thể trở"
	line "thành EXECUTIVE."
	done

RocketBaseBossRetreatText:
	text "…Sào huyệt này"
	line "xong rồi…"

	para "Nhưng không sao."
	line "Thí nghiệm phát"
	cont "sóng đã thành"
	cont "công hoàn toàn."

	para "Giờ chuyện gì xảy"
	line "ra với nơi này"
	cont "cũng không quan"
	cont "trọng nữa."

	para "Bọn tao có kế"
	line "hoạch lớn hơn."

	para "Sớm thôi mày sẽ"
	line "thấy sức mạnh thật"

	para "sự của ĐỘI"
	line "ROCKET."

	para "Cứ tận hưởng khi"
	line "còn có thể…"

	para "Hừ hừ hừ…"
	done

RocketBaseLancePostBattleText:
	text "LANCE: Xong rồi."
	line "Chúng ta đã đánh"

	para "bại hết bọn ROCKET"
	line "ở đây."

	para "Nhưng ta lo lắng"
	line "về cậu thanh niên"

	para "ta đã chiến đấu"
	line "lúc nãy…"
	done

RocketBaseLancePowerOffText:
	text "Xin lỗi, <PLAY_G>."
	line "Ta thấy con làm"

	para "tốt lắm, nên ta"
	line "chỉ đứng xem thôi."

	para "Giờ việc còn lại"
	line "là tắt tín hiệu"

	para "radio kỳ lạ kia"
	line "đi."
	done

RockerBaseLanceElectrodeFaintText:
	text "Cái máy này là"
	line "nguyên nhân gây"
	cont "ra mọi rắc rối."

	para "Ta không thấy"
	line "công tắc nào…"

	para "Không còn cách"
	line "nào khác. Chúng ta"

	para "phải làm tất cả"
	line "ELECTRODE ngất đi."

	para "Như vậy sẽ ngăn"
	line "cái máy này phát"

	para "tín hiệu kỳ lạ"
	line "kia."

	para "Không phải lỗi"
	line "của #MON, nên"

	para "ta thấy có lỗi"
	line "với chúng."

	para "<PLAY_G>, ta chia"
	line "nhau làm nhé."
	done

RocketBaseLancesSideText:
	text "LANCE: Để bên này"
	line "cho ta."
	done

RocketBaseLanceElectrodeDoneText:
	text "LANCE: Tín hiệu"
	line "kỳ lạ cuối cùng"
	cont "đã dừng."

	para "Hồ sẽ trở lại"
	line "bình thường."

	para "Con là anh hùng!"
	line "Để ta cảm ơn con"

	para "thay mặt cho tất"
	line "cả #MON."

	para "À, đúng rồi. Con"
	line "nên lấy cái này."

	para "Ta tìm thấy ở đây,"
	line "nhưng ta không cần"
	cont "nó."
	done

RocketBaseReceivedHM06Text: ; unreferenced
	text "<PLAYER> received"
	line "HM06."
	done

RocketBaseLanceWhirlpoolText:
	text "Đó là WHIRLPOOL."
	line "Dạy nó cho #MON"

	para "để vượt qua vùng"
	line "nước xoáy."

	para "Nhưng hãy nhớ"
	line "điều này."

	para "Con chỉ có thể"
	line "dùng nó ngoài"

	para "trận đấu với BADGE"
	line "từ MAHOGANY GYM."
	done

RocketBaseLanceMonMasterText:
	text "<PLAY_G>…"

	para "Hành trình trở"
	line "thành BẬC THẦY"

	para "#MON rất dài và"
	line "khó khăn."

	para "Biết vậy, con có"
	line "tiếp tục không?"

	para "…"

	para "Ta hiểu. Không,"
	line "con đúng."

	para "Nếu con dễ dàng"
	line "từ bỏ như vậy,"

	para "thì ngay từ đầu"
	line "con đã không theo"

	para "đuổi giấc mơ đó"
	line "rồi."

	para "Ta mong được gặp"
	line "lại con!"
	done

LanceHealsText1:
	text "LANCE: Con có sao"
	line "không?"

	para "#MON của con bị"
	line "thương và mệt rồi."

	para "Đây, cho chúng"
	line "uống thuốc của ta"
	cont "đi."
	done

LanceHealsText2:
	text "LANCE: <PLAY_G>,"
	line "hãy cố gắng hết"
	cont "sức vì #MON."
	done

GruntM17SeenText:
	text "Cửa không mở à?"

	para "Dĩ nhiên rồi."
	line "Nó cần mật khẩu"

	para "mà chỉ ĐỘI ROCKET"
	line "mới biết."
	done

GruntM17BeatenText:
	text "Cái gì? Tao thua?"
	done

GruntM17AfterBattleText:
	text "Heh, tao chỉ là"
	line "lính quèn."

	para "Tao không biết mật"
	line "khẩu đâu. Đen cho"
	cont "mày nhé."
	done

GruntM18SeenText:
	text "Ồ, một đứa nhóc?"
	line "Tao không thích"

	para "lắm, nhưng tao"
	line "phải diệt mày."
	done

GruntM18BeatenText:
	text "Tao biết tao sẽ"
	line "thua mà…"
	done

GruntM18AfterBattleText:
	text "Nhiệm vụ trước tao"
	line "cũng bị một đứa"
	cont "nhóc đánh bại."

	para "Lúc bọn tao đang"
	line "bắt cóc #MON,"

	para "một thằng nhóc tóc"
	line "đỏ dài với đôi mắt"

	para "hung dữ đã cho"
	line "tao ăn hành…"
	done

GruntM19SeenText:
	text "Đồ nhóc ranh hư"
	line "đốn!"
	done

GruntM19BeatenText:
	text "Grrrrr…"
	done

GruntM19AfterBattleText:
	text "Heh, chỉ có trùm"
	line "mới biết mật khẩu"
	cont "cửa đó."

	para "Trùm ở đâu à? Ai"
	line "biết? Tự đi mà"
	cont "tìm."
	done

RocketBaseDoorNoPasswordText:
	text "Cửa bị đóng…"

	para "Cần mật khẩu để"
	line "mở."
	done

RocketBaseDoorKnowPasswordText:
	text "Cửa bị đóng…"

	para "<PLAYER> đã nhập"
	line "mật khẩu."

	para "Cửa đã mở!"
	done

RocketBaseB2FTransmitterText:
	text "Đây là máy phát"
	line "sóng radio đang"

	para "gửi tín hiệu"
	line "đáng ngại."

	para "Nó đang hoạt động"
	line "hết công suất."
	done

RocketBaseB2FDeactivateTransmitterText:
	text "Máy phát sóng"
	line "radio cuối cùng"

	para "đã ngừng phát"
	line "sóng xấu xa."
	done

TeamRocketBaseB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 14, TEAM_ROCKET_BASE_B1F, 2
	warp_event  3,  2, TEAM_ROCKET_BASE_B3F, 1
	warp_event 27,  2, TEAM_ROCKET_BASE_B3F, 2
	warp_event  3,  6, TEAM_ROCKET_BASE_B3F, 3
	warp_event 27, 14, TEAM_ROCKET_BASE_B3F, 4

	def_coord_events
	coord_event  5, 14, SCENE_TEAMROCKETBASEB2F_LANCE_HEALS, LanceHealsScript1
	coord_event  4, 13, SCENE_TEAMROCKETBASEB2F_LANCE_HEALS, LanceHealsScript2
	coord_event 14, 11, SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS, RocketBaseBossFLeft
	coord_event 15, 11, SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS, RocketBaseBossFRight
	coord_event 14, 12, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseCantLeaveScript
	coord_event 15, 12, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseCantLeaveScript
	coord_event 12,  3, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseLancesSideScript
	coord_event 12, 10, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseLancesSideScript
	coord_event 12, 11, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseLancesSideScript

	def_bg_events
	bg_event 14, 12, BGEVENT_IFNOTSET, TeamRocketBaseB2FLockedDoor
	bg_event 15, 12, BGEVENT_IFNOTSET, TeamRocketBaseB2FLockedDoor
	bg_event 17,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 16,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 15,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 14,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 13,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  8, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  7, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  6, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  5, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 13,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 14,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 15,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 16,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  5, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  6, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  7, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  8, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 26,  7, BGEVENT_ITEM, TeamRocketBaseB2FHiddenFullHeal

	def_object_events
	object_event 20, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_GRUNT_WITH_EXECUTIVE
	object_event 20, 16, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_EXECUTIVE
	object_event  5, 13, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	object_event  9, 13, SPRITE_DRAGON, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_DRAGONITE
	object_event  7,  5, SPRITE_VOLTORB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketElectrode1, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	object_event  7,  7, SPRITE_VOLTORB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketElectrode2, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	object_event  7,  9, SPRITE_VOLTORB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketElectrode3, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	object_event 22,  5, SPRITE_VOLTORB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	object_event 22,  7, SPRITE_VOLTORB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	object_event 22,  9, SPRITE_VOLTORB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	object_event 25, 13, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM17, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGruntM18, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 21, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerGruntM19, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  3, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB2FTMThief, EVENT_TEAM_ROCKET_BASE_B2F_TM_THIEF
