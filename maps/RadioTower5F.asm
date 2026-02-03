	object_const_def
	const RADIOTOWER5F_DIRECTOR
	const RADIOTOWER5F_ROCKET
	const RADIOTOWER5F_ROCKET_GIRL
	const RADIOTOWER5F_ROCKER
	const RADIOTOWER5F_POKE_BALL

RadioTower5F_MapScripts:
	def_scene_scripts
	scene_script RadioTower5FNoop1Scene, SCENE_RADIOTOWER5F_FAKE_DIRECTOR
	scene_script RadioTower5FNoop2Scene, SCENE_RADIOTOWER5F_ROCKET_BOSS
	scene_script RadioTower5FNoop3Scene, SCENE_RADIOTOWER5F_NOOP

	def_callbacks

RadioTower5FNoop1Scene:
	end

RadioTower5FNoop2Scene:
	end

RadioTower5FNoop3Scene:
	end

FakeDirectorScript:
	turnobject RADIOTOWER5F_DIRECTOR, UP
	showemote EMOTE_SHOCK, RADIOTOWER5F_DIRECTOR, 15
	opentext
	writetext FakeDirectorTextBefore1
	waitbutton
	closetext
	applymovement RADIOTOWER5F_DIRECTOR, FakeDirectorMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext FakeDirectorTextBefore2
	waitbutton
	closetext
	winlosstext FakeDirectorWinText, 0
	setlasttalked RADIOTOWER5F_DIRECTOR
	loadtrainer EXECUTIVEM, EXECUTIVEM_3
	startbattle
	reloadmapafterbattle
	opentext
	writetext FakeDirectorTextAfter
	promptbutton
	verbosegiveitem BASEMENT_KEY
	closetext
	setscene SCENE_RADIOTOWER5F_ROCKET_BOSS
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_3
	end

Director:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TrueDirector
	writetext FakeDirectorTextAfter
	waitbutton
	closetext
	end

.TrueDirector:
	writetext RadioTower5FDirectorText
	waitbutton
	closetext
	end

TrainerExecutivef1:
	trainer EXECUTIVEF, EXECUTIVEF_1, EVENT_BEAT_ROCKET_EXECUTIVEF_1, Executivef1SeenText, Executivef1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Executivef1AfterBattleText
	waitbutton
	closetext
	end

RadioTower5FRocketBossScript:
	applymovement PLAYER, RadioTower5FPlayerTwoStepsLeftMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject RADIOTOWER5F_ROCKET, RIGHT
	opentext
	writetext RadioTower5FRocketBossBeforeText
	waitbutton
	closetext
	winlosstext RadioTower5FRocketBossWinText, 0
	setlasttalked RADIOTOWER5F_ROCKET
	loadtrainer EXECUTIVEM, EXECUTIVEM_1
	startbattle
	reloadmapafterbattle
	opentext
	writetext RadioTower5FRocketBossAfterText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear RADIOTOWER5F_ROCKET
	disappear RADIOTOWER5F_ROCKET_GIRL
	pause 15
	special FadeInFromBlack
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_1
	setevent EVENT_CLEARED_RADIO_TOWER
	clearflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	setevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_MAHOGANY_MART_OWNERS
	clearflag ENGINE_ROCKETS_IN_MAHOGANY
	clearevent EVENT_GOLDENROD_CITY_CIVILIANS
	clearevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
	setevent EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	clearevent EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	special PlayMapMusic
	disappear RADIOTOWER5F_DIRECTOR
	moveobject RADIOTOWER5F_DIRECTOR, 12, 0
	appear RADIOTOWER5F_DIRECTOR
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksIn
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower5FDirectorThankYouText
	promptbutton
	verbosegiveitem CLEAR_BELL
	writetext RadioTower5FDirectorDescribeClearBellText
	waitbutton
	closetext
	setscene SCENE_RADIOTOWER5F_NOOP
	setmapscene ECRUTEAK_TIN_TOWER_ENTRANCE, SCENE_ECRUTEAKTINTOWERENTRANCE_SAGE_BLOCKS
	setevent EVENT_GOT_CLEAR_BELL
	setevent EVENT_TEAM_ROCKET_DISBANDED
	sjump .UselessJump

.UselessJump:
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksOut
	playsound SFX_EXIT_BUILDING
	disappear RADIOTOWER5F_DIRECTOR
	end

Ben:
	jumptextfaceplayer BenText

RadioTower5FUltraBall:
	itemball ULTRA_BALL

RadioTower5FDirectorsOfficeSign:
	jumptext RadioTower5FDirectorsOfficeSignText

RadioTower5FStudio1Sign:
	jumptext RadioTower5FStudio1SignText

RadioTower5FBookshelf:
	jumpstd MagazineBookshelfScript

FakeDirectorMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

RadioTower5FDirectorWalksIn:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step_end

RadioTower5FDirectorWalksOut:
	step RIGHT
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

RadioTower5FPlayerTwoStepsLeftMovement:
	step LEFT
	step LEFT
	step_end

FakeDirectorTextBefore1:
	text "M-mày! Mày đến"
	line "cứu tao sao?"
	done

FakeDirectorTextBefore2:
	text "Đó là điều mày"
	line "mong đợi hả?"

	para "Sai rồi!"
	line "Tao là kẻ mạo"
	cont "danh!"

	para "Tao giả làm người"
	line "thật để chuẩn bị"

	para "cho cuộc tiếp"
	line "quản."

	para "Mày muốn biết bọn"
	line "tao giấu GIÁM ĐỐC"
	cont "thật ở đâu không?"

	para "Được, tao sẽ nói."
	line "Nhưng chỉ khi mày"
	cont "đánh bại tao!"
	done

FakeDirectorWinText:
	text "OK, OK. Tao sẽ nói"
	line "ông ta ở đâu."
	done

FakeDirectorTextAfter:
	text "Bọn tao giấu"
	line "GIÁM ĐỐC thật ở"

	para "KHO HẦM NGẦM."

	para "Nó ở tận cuối"
	line "HẦM NGẦM."

	para "Nhưng tao ngờ"
	line "mày đến được đó."
	done

Executivef1SeenText:
	text "Còn nhớ tao ở SÀO"
	line "HUYỆT tại THỊ TRẤN"
	cont "MAHOGANY không?"

	para "Lần đó tao thua,"
	line "nhưng lần này thì"
	cont "không."
	done

Executivef1BeatenText:
	text "Không thể như"
	line "thế được!"

	para "Tao đã chiến đấu"
	line "hết sức, nhưng vẫn"
	cont "thua…"
	done

Executivef1AfterBattleText:
	text "<PLAYER>, đúng ko?"

	para "Một thằng nhóc"
	line "như mày sẽ không"

	para "hiểu được sự vĩ"
	line "đại của"
	cont "ĐỘI ROCKET."

	para "Thật đáng tiếc."
	line "Tao thật sự ngưỡng"
	cont "mộ sức mạnh mày."
	done

RadioTower5FRocketBossBeforeText:
	text "Ồ? Mày đã đến"
	line "được tận đây?"

	para "Mày chắc phải là"
	line "HLV giỏi lắm."

	para "Bọn tao định"
	line "chiếm ĐÀI RADIO"

	para "này và thông báo"
	line "sự trở lại."

	para "Điều đó sẽ đưa"
	line "trùm GIOVANNI"

	para "trở về từ khóa"
	line "tu đơn độc."

	para "Bọn tao sẽ giành"
	line "lại vinh quang"
	cont "xưa."

	para "Tao không cho"
	line "phép mày can"
	cont "thiệp vào kế"
	cont "hoạch bọn tao."
	done

RadioTower5FRocketBossWinText:
	text "Không! Xin tha"
	line "thứ, GIOVANNI!"
	done

RadioTower5FRocketBossAfterText:
	text "Sao có thể như"
	line "thế được?"

	para "Giấc mơ của bọn"
	line "tao tan thành mây."

	para "Tao không đủ sức"
	line "cho nhiệm vụ này."

	para "Như GIOVANNI đã"
	line "làm trước tao,"

	para "tao sẽ giải tán"
	line "ĐỘI ROCKET hôm"
	cont "nay."

	para "Vĩnh biệt."
	done

RadioTower5FDirectorThankYouText:
	text "GIÁM ĐỐC:"
	line "<PLAY_G>, cảm ơn!"

	para "Hành động dũng"
	line "cảm của cháu đã"

	para "cứu #MON khắp"
	line "cả nước."

	para "Tôi biết không"
	line "nhiều, nhưng hãy"
	cont "nhận cái này."
	done

RadioTower5FDirectorDescribeClearBellText:
	text "Từng có một ngọn"
	line "tháp ngay đây ở"
	cont "TP. GOLDENROD."

	para "Nhưng nó cũ và"
	line "xuống cấp."

	para "Nên chúng tôi"
	line "thay bằng THÁP"
	cont "RADIO."

	para "Chúng tôi đào"
	line "được chuông này"
	cont "khi xây dựng."

	para "Tôi nghe rằng"
	line "nhiều loại #MON"

	para "từng sống ở"
	line "GOLDENROD trước."

	para "Có lẽ…"

	para "Chuông đó có liên"
	line "quan đến THÁP"

	para "THIẾC ở TP."
	line "ECRUTEAK…"

	para "À!"

	para "Điều đó nhắc tôi…"

	para "Tôi nghe lén"
	line "ĐỘI ROCKET thì"
	cont "thầm."

	para "Có vẻ như có"
	line "chuyện gì đó"
	cont "đang xảy ra ở"
	cont "THÁP THIẾC."

	para "Tôi không biết"
	line "đó là gì,"

	para "nhưng cháu có thể"
	line "tìm hiểu."

	para "OK, tôi phải đi"
	line "VĂN PHÒNG đây."
	done

RadioTower5FDirectorText:
	text "GIÁM ĐỐC: Chào,"
	line "<PLAY_G>!"

	para "Cháu biết không,"
	line "tôi yêu #MON."

	para "Tôi xây THÁP"
	line "RADIO này để tôi"

	para "có thể bày tỏ"
	line "tình yêu #MON."

	para "Sẽ tuyệt nếu mọi"
	line "người thích các"
	cont "chương trình."
	done

BenText:
	text "BEN: Bạn có nghe"
	line "nhạc của tôi?"
	done

RadioTower5FDirectorsOfficeSignText:
	text "5F VĂN PHÒNG"
	line "   GIÁM ĐỐC"
	done

RadioTower5FStudio1SignText:
	text "5F STUDIO 1"
	done

RadioTower5F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_4F, 1
	warp_event 12,  0, RADIO_TOWER_4F, 3

	def_coord_events
	coord_event  0,  3, SCENE_RADIOTOWER5F_FAKE_DIRECTOR, FakeDirectorScript
	coord_event 16,  5, SCENE_RADIOTOWER5F_ROCKET_BOSS, RadioTower5FRocketBossScript

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RadioTower5FDirectorsOfficeSign
	bg_event 11,  0, BGEVENT_READ, RadioTower5FStudio1Sign
	bg_event 15,  0, BGEVENT_READ, RadioTower5FStudio1Sign
	bg_event 16,  1, BGEVENT_READ, RadioTower5FBookshelf
	bg_event 17,  1, BGEVENT_READ, RadioTower5FBookshelf

	def_object_events
	object_event  3,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Director, -1
	object_event 13,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 17,  2, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerExecutivef1, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 13,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Ben, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  8,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RadioTower5FUltraBall, EVENT_RADIO_TOWER_5F_ULTRA_BALL
