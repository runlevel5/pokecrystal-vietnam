	object_const_def
	const CIANWOODPHARMACY_PHARMACIST

CianwoodPharmacy_MapScripts:
	def_scene_scripts
	scene_script CianwoodPharmacyNoopScene ; unusable

	def_callbacks

CianwoodPharmacyNoopScene:
	end

CianwoodPharmacist:
	faceplayer
	opentext
	checkevent EVENT_GOT_SECRETPOTION_FROM_PHARMACY
	iftrue .Mart
	checkevent EVENT_JASMINE_EXPLAINED_AMPHYS_SICKNESS
	iffalse .Mart
	writetext PharmacistGiveSecretpotionText
	promptbutton
	giveitem SECRETPOTION
	writetext ReceivedSecretpotionText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_SECRETPOTION_FROM_PHARMACY
	writetext PharmacistDescribeSecretpotionText
	waitbutton
	closetext
	end

.Mart:
	pokemart MARTTYPE_PHARMACY, MART_CIANWOOD
	closetext
	end

CianwoodPharmacyBookshelf:
	jumpstd DifficultBookshelfScript

PharmacistGiveSecretpotionText:
	text "#MON của bạn"
	line "có vẻ khoẻ mạnh."

	para "Có chuyện gì"
	line "làm bạn lo lắng?"

	para "…"

	para "#MON ở HẢI ĐĂNG"
	line "gặp rắc rối à?"

	para "Tôi hiểu rồi!"

	para "Cái này sẽ giải"
	line "quyết vấn đề."
	done

ReceivedSecretpotionText:
	text "<PLAYER> nhận được"
	line "THUỐC BÍ MẬT."
	done

PharmacistDescribeSecretpotionText:
	text "THUỐC BÍ MẬT của"
	line "tôi hơi mạnh quá."

	para "Tôi chỉ đưa nó"
	line "trong trường hợp"
	cont "khẩn cấp."
	done

CianwoodPharmacy_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 4
	warp_event  3,  7, CIANWOOD_CITY, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, CianwoodPharmacyBookshelf
	bg_event  1,  1, BGEVENT_READ, CianwoodPharmacyBookshelf

	def_object_events
	object_event  2,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodPharmacist, -1
