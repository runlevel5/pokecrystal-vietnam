	object_const_def
	const BRUNOSROOM_BRUNO

BrunosRoom_MapScripts:
	def_scene_scripts
	scene_script BrunosRoomLockDoorScene, SCENE_BRUNOSROOM_LOCK_DOOR
	scene_script BrunosRoomNoopScene,     SCENE_BRUNOSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, BrunosRoomDoorsCallback

BrunosRoomLockDoorScene:
	sdefer BrunosRoomDoorLocksBehindYouScript
	end

BrunosRoomNoopScene:
	end

BrunosRoomDoorsCallback:
	checkevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	endcallback

BrunosRoomDoorLocksBehindYouScript:
	applymovement PLAYER, BrunosRoom_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	refreshmap
	closetext
	setscene SCENE_BRUNOSROOM_NOOP
	setevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

BrunoScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_BRUNO
	iftrue BrunoScript_AfterBattle
	writetext BrunoScript_BrunoBeforeText
	waitbutton
	closetext
	winlosstext BrunoScript_BrunoBeatenText, 0
	loadtrainer BRUNO, BRUNO1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_BRUNO
	opentext
	writetext BrunoScript_BrunoDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	refreshmap
	closetext
	setevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	waitsfx
	end

BrunoScript_AfterBattle:
	writetext BrunoScript_BrunoDefeatText
	waitbutton
	closetext
	end

BrunosRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

BrunoScript_BrunoBeforeText:
	text "Ta là BRUNO của"
	line "TỨ ĐẠI."

	para "Ta luôn tập luyện"
	line "đến cực hạn vì ta"
	cont "tin vào tiềm năng"
	cont "của chúng ta."

	para "Đó là cách chúng"
	line "ta trở nên mạnh."

	para "Ngươi có thể chịu"
	line "được sức mạnh"
	cont "của ta không?"

	para "Hừm? Ta không"
	line "thấy sợ hãi trong"
	cont "mắt ngươi."

	para "Ngươi rất quyết"
	line "tâm. Hoàn hảo để"
	cont "chiến đấu!"

	para "Sẵn sàng chưa,"
	line "<PLAYER>? Ngươi sẽ"
	cont "phải cúi đầu"

	para "trước sức mạnh"
	line "áp đảo của ta!"

	para "Hoo hah!"
	done

BrunoScript_BrunoBeatenText:
	text "Sao? Sao ta lại"
	line "có thể thua?"
	done

BrunoScript_BrunoDefeatText:
	text "Đã thua, ta không"
	line "có quyền nói gì"
	cont "nữa…"

	para "Hãy đối mặt với"
	line "thử thách tiếp"
	cont "theo đi!"
	done

BrunosRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, KOGAS_ROOM, 3
	warp_event  5, 17, KOGAS_ROOM, 4
	warp_event  4,  2, KARENS_ROOM, 1
	warp_event  5,  2, KARENS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_BRUNO, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BrunoScript_Battle, -1
