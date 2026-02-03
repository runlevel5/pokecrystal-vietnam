	object_const_def
	const ROUTE35GOLDENRODGATE_RANDY
	const ROUTE35GOLDENRODGATE_POKEFAN_F
	const ROUTE35GOLDENRODGATE_FISHER

Route35GoldenrodGate_MapScripts:
	def_scene_scripts

	def_callbacks

RandyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HP_UP_FROM_RANDY
	iftrue .gothpup
	checkevent EVENT_GAVE_KENYA
	iftrue .questcomplete
	checkevent EVENT_GOT_KENYA
	iftrue .alreadyhavekenya
	writetext Route35GoldenrodGateRandyAskTakeThisMonToMyFriendText
	yesorno
	iffalse .refused
	writetext Route35GoldenrodGateRandyThanksText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .partyfull
	writetext Route35GoldenrodGatePlayerReceivedAMonWithMailText
	playsound SFX_KEY_ITEM
	waitsfx
	givepoke SPEAROW, 10, NO_ITEM, GiftSpearowName, GiftSpearowOTName
	givepokemail GiftSpearowMail
	setevent EVENT_GOT_KENYA
.alreadyhavekenya
	writetext Route35GoldenrodGateRandyWeirdTreeBlockingRoadText
	waitbutton
	closetext
	end

.partyfull
	writetext Route35GoldenrodGateRandyCantCarryAnotherMonText
	waitbutton
	closetext
	end

.refused
	writetext Route35GoldenrodGateRandyOhNeverMindThenText
	waitbutton
	closetext
	end

.questcomplete
	writetext Route35GoldenrodGateRandySomethingForYourTroubleText
	promptbutton
	verbosegiveitem HP_UP
	iffalse .bagfull
	setevent EVENT_GOT_HP_UP_FROM_RANDY
.gothpup
	writetext Route35GoldenrodGateRandyMyPalWasSnoozingRightText
	waitbutton
.bagfull
	closetext
	end

GiftSpearowMail:
	db FLOWER_MAIL
	db   "HANG TỐI dẫn đến"
	next "con đường khác@"

GiftSpearowName:
	db "KENYA@"

GiftSpearowOTName:
	db "RANDY@"

	db 0 ; unused

Route35GoldenrodGatePokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .FoughtSudowoodo
	writetext Route35GoldenrodGatePokefanFText
	waitbutton
	closetext
	end

.FoughtSudowoodo
	writetext Route35GoldenrodGatePokefanFText_FoughtSudowoodo
	waitbutton
	closetext
	end

Route35GoldenrodGateFisherScript:
	jumptextfaceplayer Route35GoldenrodGateFisherText

Route35GoldenrodGateRandyAskTakeThisMonToMyFriendText:
	text "Xin lỗi, cậu bé!"
	line "Có thể giúp một"
	cont "việc không?"

	para "Cậu có thể mang"
	line "#MON với THƯ"
	cont "này đến bạn tôi?"

	para "Anh ta ở TUYẾN"
	line "ĐƯỜNG 31."
	done

Route35GoldenrodGateRandyThanksText:
	text "Được không? Tuyệt!"
	line "Cảm ơn cậu!"

	para "Bạn tôi là người"
	line "mập, lúc nào cũng"
	cont "ngủ gật."

	para "Cậu sẽ nhận ra"
	line "ngay thôi!"
	done

Route35GoldenrodGatePlayerReceivedAMonWithMailText:
	text "<PLAYER> nhận được"
	line "#MON với THƯ."
	done

Route35GoldenrodGateRandyWeirdTreeBlockingRoadText:
	text "Cậu có thể đọc,"
	line "nhưng đừng mất!"
	cont "TUYẾN ĐƯỜNG 31!"

	para "À đúng rồi. Có cái"
	line "cây lạ chặn đường"
	cont "ở đó."

	para "Không biết nó đã"
	line "bị dọn chưa?"
	done

Route35GoldenrodGateRandyCantCarryAnotherMonText:
	text "Cậu không thể mang"
	line "#MON khác nữa…"
	done

Route35GoldenrodGateRandyOhNeverMindThenText:
	text "À… Thôi kệ…"
	done

Route35GoldenrodGateRandySomethingForYourTroubleText:
	text "Cảm ơn, cậu bé!"
	line "Cậu đã giao hàng"
	cont "giúp tôi!"

	para "Đây là thứ gì đó"
	line "cho công sức!"
	done

Route35GoldenrodGateRandyMyPalWasSnoozingRightText:
	text "Bạn tôi đang ngủ,"
	line "đúng không? Hehe,"
	cont "tôi đã nói mà?"
	done

Route35GoldenrodGatePokefanFText:
	text "Một cây lạ đang"
	line "chặn đường."

	para "Nó ngọ nguậy nếu"
	line "bạn nói chuyện."

	para "Nghe nói nó trở"
	line "nên hoang dã khi"

	para "ai đó tưới nước"
	line "bằng BÌNH XỊT."
	done

Route35GoldenrodGatePokefanFText_FoughtSudowoodo:
	text "Tôi thích bài hát"
	line "Ru #MON trên"
	cont "radio."
	done

Route35GoldenrodGateFisherText:
	text "Không biết có bao"
	line "nhiêu loại #MON"

	para "trên thế giới."

	para "Ba năm trước, GS"
	line "OAK nói có 150"

	para "loại khác nhau."
	done

Route35GoldenrodGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_35, 1
	warp_event  5,  0, ROUTE_35, 2
	warp_event  4,  7, GOLDENROD_CITY, 12
	warp_event  5,  7, GOLDENROD_CITY, 12

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RandyScript, -1
	object_event  6,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route35GoldenrodGatePokefanFScript, -1
	object_event  3,  2, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35GoldenrodGateFisherScript, -1
