	object_const_def
	const GOLDENRODPOKECENTER1F_NURSE
	const GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	const GOLDENRODPOKECENTER1F_GAMEBOY_KID
	const GOLDENRODPOKECENTER1F_LASS
	const GOLDENRODPOKECENTER1F_POKEFAN_F

GoldenrodPokecenter1F_MapScripts:
	def_scene_scripts
	scene_const SCENE_GOLDENRODPOKECENTER1F_GS_BALL

	def_callbacks

GoldenrodPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

GoldenrodPokecenter1F_GSBallSceneLeft:
	setval BATTLETOWERACTION_GSBALL
	special BattleTowerAction
	ifequal GS_BALL_AVAILABLE, .gsball
	end

.gsball
	checkevent EVENT_GOT_GS_BALL_FROM_GOLDENROD_POKEMON_CENTER
	iftrue .cancel
	playsound SFX_EXIT_BUILDING
	moveobject GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, 0, 7
	disappear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtLeftDoorwayTileMovement
	turnobject PLAYER, UP
	opentext
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_GOLDENROD_POKEMON_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText
	waitbutton
	closetext
	applymovement GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromLeftDoorwayTileMovement
	special RestartMapMusic
	disappear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	playsound SFX_EXIT_BUILDING
.cancel
	end

GoldenrodPokecenter1F_GSBallSceneRight:
	setval BATTLETOWERACTION_GSBALL
	special BattleTowerAction
	ifequal GS_BALL_AVAILABLE, .gsball
	end

.gsball
	checkevent EVENT_GOT_GS_BALL_FROM_GOLDENROD_POKEMON_CENTER
	iftrue .cancel
	playsound SFX_EXIT_BUILDING
	moveobject GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, 0, 7
	disappear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtRightDoorwayTileMovement
	turnobject PLAYER, UP
	opentext
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_GOLDENROD_POKEMON_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText
	waitbutton
	closetext
	applymovement GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromRightDoorwayTileMovement
	special RestartMapMusic
	disappear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	playsound SFX_EXIT_BUILDING
.cancel
	end

GoldenrodPokecenter1FGameboyKidScript:
	jumptextfaceplayer GoldenrodPokecenter1FGameboyKidText

GoldenrodPokecenter1FLassScript:
	jumptextfaceplayer GoldenrodPokecenter1FLassText

GoldenrodPokecenter1FPokefanF:
	faceplayer
	opentext
	writetext GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText
	waitbutton
	writetext GoldenrodPokecenter1FAskGiveAwayAnEonMailText
	yesorno
	iffalse .NoEonMail
	takeitem EON_MAIL
	iffalse .NoEonMail
	writetext GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText
	waitbutton
	writetext GoldenrodPokecenter1FPokefanFThisIsForYouText
	waitbutton
	verbosegiveitem REVIVE
	iffalse .NoRoom
	writetext GoldenrodPokecenter1FPokefanFDaughterWillBeDelightedText
	waitbutton
	closetext
	end

.NoEonMail:
	writetext GoldenrodPokecenter1FPokefanFTooBadText
	waitbutton
	closetext
	end

.NoRoom:
	giveitem EON_MAIL
	writetext GoldenrodPokecenter1FPokefanFAnotherTimeThenText
	waitbutton
	closetext
	end

GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtLeftDoorwayTileMovement:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromLeftDoorwayTileMovement:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtRightDoorwayTileMovement:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromRightDoorwayTileMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

GoldenrodPokecomCenterWelcomeToTradeCornerText: ; unreferenced
	text "Xin chào! Chào"
	line "mừng đến #COM"
	cont "CENTER TRADE"
	cont "CORNER."

	para "Bạn có thể giao"
	line "dịch #MON với"
	cont "người ở xa."
	done

GoldenrodPokecomCenterWeMustHoldYourMonText: ; unreferenced
	text "Để giao dịch,"
	line "chúng tôi phải giữ"
	cont "#MON của bạn."

	para "Bạn có muốn giao"
	line "dịch không?"
	done

GoldenrodPokecomCenterWhatMonDoYouWantText: ; unreferenced
	text "Bạn muốn đổi lấy"
	line "#MON loại nào?"
	done

GoldenrodPokecomCenterWeWillTradeYourMonForMonText: ; unreferenced
	text "Được. Chúng tôi sẽ"
	line "thử giao dịch"

	para "@"
	text_ram wStringBuffer3
	text " để lấy"
	line "@"
	text_ram wStringBuffer4
	text "."

	para "Chúng tôi phải giữ"
	line "#MON bạn trong"
	cont "lúc giao dịch."

	para "Vui lòng đợi khi"
	line "chúng tôi chuẩn"
	cont "bị phòng."
	done

GoldenrodPokecomCenterWeWillTradeYourMonForNewText: ; unreferenced
	text "Được. Chúng tôi sẽ"
	line "thử giao dịch"

	para "@"
	text_ram wStringBuffer3
	text " để lấy"
	line "#MON mà bạn"
	cont "chưa từng thấy."

	para "Chúng tôi phải giữ"
	line "#MON bạn trong"
	cont "lúc giao dịch."

	para "Vui lòng đợi khi"
	line "chúng tôi chuẩn"
	cont "bị phòng."
	done

GoldenrodPokecomCenterYourMonHasBeenReceivedText: ; unreferenced
	text "#MON giao dịch"
	line "của bạn đã được"
	cont "nhận."

	para "Sẽ mất thời gian"
	line "để tìm đối tác"

	para "giao dịch. Hãy"
	line "quay lại sau."
	done

GoldenrodPokecomCenterYouHaveOnlyOneMonText: ; unreferenced
	text "Ồ? Bạn chỉ có một"
	line "#MON trong"
	cont "nhóm. "

	para "Hãy quay lại khi"
	line "bạn đã tăng số"
	cont "lượng #MON"
	cont "trong nhóm."
	done

GoldenrodPokecomCenterWeHopeToSeeYouAgainText: ; unreferenced
	text "Hy vọng gặp lại"
	line "bạn."
	done

GoldenrodPokecomCenterCommunicationErrorText: ; unreferenced
	text "Lỗi kết nối…"
	done

GoldenrodPokecomCenterCantAcceptLastMonText: ; unreferenced
	text "Nếu nhận #MON"
	line "đó, bạn sẽ đấu"
	cont "bằng gì?"
	done

GoldenrodPokecomCenterCantAcceptEggText: ; unreferenced
	text "Xin lỗi. Chúng tôi"
	line "không nhận EGG."
	done

GoldenrodPokecomCenterCantAcceptAbnormalMonText: ; unreferenced
	text "Xin lỗi, nhưng"
	line "#MON của bạn"

	para "có vẻ bất thường."
	line "Chúng tôi không"
	cont "thể nhận nó."
	done

GoldenrodPokecomCenterAlreadyHoldingMonText: ; unreferenced
	text "Ồ? Chúng tôi đang"
	line "giữ #MON của"
	cont "bạn rồi mà?"
	done

GoldenrodPokecomCenterCheckingTheRoomsText: ; unreferenced
	text "Chúng tôi sẽ kiểm"
	line "tra các phòng."

	para "Vui lòng đợi."
	done

GoldenrodPokecomCenterTradePartnerHasBeenFoundText: ; unreferenced
	text "Cảm ơn bạn đã kiên"
	line "nhẫn."

	para "Đã tìm được đối"
	line "tác giao dịch."
	done

GoldenrodPokecomCenterItsYourNewPartnerText: ; unreferenced
	text "Đây là đối tác"
	line "mới của bạn."

	para "Hãy chăm sóc nó"
	line "bằng tình yêu."

	para "Hy vọng gặp lại"
	line "bạn."
	done

GoldenrodPokecomCenterYourPartyIsFullText: ; unreferenced
	text "Ồ ồ. Nhóm của bạn"
	line "đã đầy rồi."

	para "Hãy quay lại khi"
	line "bạn có chỗ trống"
	cont "trong nhóm."
	done

GoldenrodPokecomCenterNoTradePartnerFoundText: ; unreferenced
	text "Thật đáng tiếc,"
	line "nhưng không có ai"

	para "xuất hiện làm đối"
	line "tác giao dịch."

	para "Bạn có muốn lấy"
	line "#MON lại không?"
	done

GoldenrodPokecomCenterReturnedYourMonText: ; unreferenced
	text "Chúng tôi đã trả"
	line "#MON của bạn."
	done

GoldenrodPokecomCenterYourMonIsLonelyText: ; unreferenced
	text "Thật đáng tiếc,"
	line "nhưng không có ai"

	para "xuất hiện làm đối"
	line "tác giao dịch."

	para "Chúng tôi đã giữ"
	line "#MON của bạn"

	para "trong thời gian"
	line "dài. Kết quả là"
	cont "nó rất cô đơn."

	para "Xin lỗi, nhưng"
	line "chúng tôi phải trả"
	cont "lại cho bạn."
	done

GoldenrodPokecenter1FWeHopeToSeeYouAgainText_2: ; unreferenced
	text "Hy vọng gặp lại"
	line "bạn."
	done

GoldenrodPokecomCenterContinueToHoldYourMonText: ; unreferenced
	text "Được. Chúng tôi"
	line "sẽ tiếp tục giữ"
	cont "#MON của bạn."
	done

GoldenrodPokecomCenterRecentlyLeftYourMonText: ; unreferenced
	text "Ồ? Bạn mới gửi"
	line "#MON cho chúng"
	cont "tôi mà."

	para "Hãy quay lại"
	line "sau nhé."
	done

GoldenrodPokecomCenterSaveBeforeTradeCornerText: ; unreferenced
	text "Chúng tôi sẽ SAVE"
	line "trước khi kết nối"
	cont "đến CENTER."
	done

GoldenrodPokecomCenterWhichMonToTradeText: ; unreferenced
	text "Bạn muốn giao dịch"
	line "#MON nào?"
	done

GoldenrodPokecomCenterTradeCanceledText: ; unreferenced
	text "Xin lỗi, nhưng"
	line "chúng tôi phải hủy"
	cont "giao dịch."
	done

GoldenrodPokecomCenterEggTicketText: ; unreferenced
	text "Ồ!"

	para "Tôi thấy bạn có"
	line "EGG TICKET!"

	para "Đó là phiếu mà"
	line "người đặc biệt"

	para "có thể đổi lấy"
	line "#MON đặc biệt!"
	done

GoldenrodPokecomCenterOddEggBriefingText: ; unreferenced
	text "Để tôi giải thích"
	line "nhanh cho bạn."

	para "Giao dịch tại"
	line "GÓC GIAO DỊCH là"

	para "giữa hai HLV mà"
	line "không biết danh"

	para "tính của nhau."

	para "Kết quả là, có"
	line "thể mất thời gian."

	para "Tuy nhiên, TRỨNG"
	line "LẠ có sẵn chỉ"
	cont "dành cho bạn."

	para "Nó sẽ được gửi"
	line "ngay cho bạn."

	para "Hãy chọn một"
	line "phòng trong"

	para "CENTER. TRỨNG LẠ"
	line "sẽ được gửi từ"

	para "phòng đã chọn."
	done

GoldenrodPokecomCenterPleaseWaitAMomentText: ; unreferenced
	text "Vui lòng đợi một"
	line "chút."
	done

GoldenrodPokecomCenterHereIsYourOddEggText: ; unreferenced
	text "Cảm ơn bạn đã"
	line "chờ đợi."

	para "Chúng tôi đã nhận"
	line "TRỨNG LẠ của bạn."

	para "Đây này!"

	para "Hãy nuôi nó bằng"
	line "tình yêu thương."
	done

GoldenrodPokecomCenterNoEggTicketServiceText: ; unreferenced
	text "Tôi rất xin lỗi."

	para "Dịch vụ đổi EGG"
	line "TICKET không hoạt"
	cont "động bây giờ."
	done

GoldenrodPokecomCenterNewsMachineText: ; unreferenced
	text "Đây là MÁY TIN TỨC"
	line "#MON."
	done

GoldenrodPokecomCenterWhatToDoText: ; unreferenced
	text "Bạn muốn làm gì?"
	done

GoldenrodPokecomCenterNewsMachineExplanationText: ; unreferenced
	text "TIN TỨC #MON là"
	line "tin tức tổng hợp"

	para "từ file SAVE của"
	line "các HLV #MON."

	para "Khi đọc TIN TỨC,"
	line "file SAVE của bạn"

	para "có thể được gửi"
	line "đi."

	para "Dữ liệu file SAVE"
	line "sẽ chứa nhật ký"

	para "phiêu lưu và hồ"
	line "sơ di động."

	para "Số điện thoại của"
	line "bạn sẽ không được"
	cont "gửi đi."

	para "Nội dung TIN TỨC"
	line "sẽ thay đổi tùy"

	para "thuộc vào file"
	line "SAVE được gửi bởi"

	para "bạn và các HLV"
	line "#MON khác."

	para "Bạn thậm chí có"
	line "thể có trong TIN!"
	done

GoldenrodPokecomCenterWouldYouLikeTheNewsText: ; unreferenced
	text "Bạn có muốn xem"
	line "TIN TỨC không?"
	done

GoldenrodPokecomCenterReadingTheLatestNewsText: ; unreferenced
	text "Đang đọc TIN mới"
	line "nhất… Vui lòng"
	cont "đợi."
	done

GoldenrodPokecomCenterNoOldNewsText: ; unreferenced
	text "Không có TIN cũ…"
	done

GoldenrodPokecomCenterCorruptedNewsDataText: ; unreferenced
	text "Dữ liệu TIN bị"
	line "hỏng."

	para "Hãy tải TIN lại"
	line "lần nữa."
	done

GoldenrodPokecomCenterMakingPreparationsText: ; unreferenced
	text "Chúng tôi đang"
	line "chuẩn bị."

	para "Hãy quay lại"
	line "sau nhé."
	done

GoldenrodPokecomCenterSaveBeforeNewsMachineText: ; unreferenced
	text "Chúng tôi sẽ SAVE"
	line "trước khi khởi"

	para "động MÁY TIN TỨC."
	done

GoldenrodPokecomCenterPerson1Text: ; unreferenced
	text "Ồ, TT #MON này"
	line "to quá."

	para "Họ vừa xây xong"
	line "chỗ này. Họ cũng"

	para "lắp đặt nhiều máy"
	line "mới nữa."
	done

GoldenrodPokecomCenterPerson2Text: ; unreferenced
	text "Tôi nghĩ ra trò"
	line "vui cho GÓC"
	cont "GIAO DỊCH!"

	para "Tôi cho PIDGEY"
	line "cầm THƯ, rồi"

	para "đổi nó lấy một"
	line "con khác!"

	para "Nếu mọi người đều"
	line "làm vậy, THƯ có"

	para "thể được giao với"
	line "nhiều người!"

	para "Tôi gọi nó là"
	line "THƯ PIDGEY!"

	para "Nếu nó phổ biến,"
	line "tôi có thể kết"

	para "bạn với nhiều"
	line "người mới!"
	done

GoldenrodPokecomCenterPerson3Text: ; unreferenced
	text "Họ nói bạn có thể"
	line "giao dịch #MON"

	para "với người lạ hoàn"
	line "toàn ở đây."

	para "Nhưng họ vẫn đang"
	line "điều chỉnh."
	done

GoldenrodPokecomCenterPerson4Text: ; unreferenced
	text "Một cô gái tôi"
	line "không biết gửi"

	para "HOPPIP cho tôi."
	line "Bạn nên giao dịch"

	para "để lấy #MON mà"
	line "bạn muốn."
	done

GoldenrodPokecomCenterPerson5Text: ; unreferenced
	text "Tôi nhận được"
	line "HOPPIP cái, nhưng"
	cont "tên nó STANLEY!"

	para "Đó là tên bố"
	line "tôi!"
	done

GoldenrodPokecomCenterPerson6Text: ; unreferenced
	text "MÁY TIN TỨC là"
	line "gì?"

	para "Nó lấy tin từ"
	line "khu vực rộng hơn"
	cont "radio không?"
	done

GoldenrodPokecomCenterPerson7Text: ; unreferenced
	text "#COM CENTER sẽ"
	line "liên kết với tất"

	para "cả TT #MON"
	line "trong mạng không"
	cont "dây."

	para "Điều đó có nghĩa"
	line "tôi sẽ có thể"

	para "kết nối với đủ"
	line "loại người."
	done

GoldenrodPokecomCenterPerson8Text: ; unreferenced
	text "Máy ở đây chưa"
	line "dùng được."

	para "Nhưng thật tốt khi"
	line "đến nơi hợp thời"

	para "trước người khác."
	done

GoldenrodPokecomCenterPerson9Text: ; unreferenced
	text "Bạn tôi có trong"
	line "TIN TỨC trước đây."

	para "Tôi thực sự ngạc"
	line "nhiên!"
	done

GoldenrodPokecomCenterPerson10Text: ; unreferenced
	text "Tôi lo lắng nếu"
	line "không xem TIN TỨC"
	cont "mới nhất!"
	done

GoldenrodPokecomCenterPerson11Text: ; unreferenced
	text "Nếu tôi có trong"
	line "TIN và nổi tiếng,"

	para "chắc tôi sẽ được"
	line "ngưỡng mộ."

	para "Không biết làm thế"
	line "nào để có trong"
	cont "TIN nhỉ?"
	done

GoldenrodPokecenter1FGameboyKidText:
	text "ĐẤU TRƯỜNG ở trên"
	line "là nơi đấu qua"
	cont "dây nối."

	para "Kết quả được ghi"
	line "trên tường nên"

	para "tôi không thể"
	line "thua được."
	done

GoldenrodPokecomCenterPerson12Text: ; unreferenced
	text "Tôi đến đây khi"
	line "nghe nói TT"

	para "#MON GOLDENROD"
	line "có máy mới mà"

	para "chưa ai thấy bao"
	line "giờ."

	para "Nhưng có vẻ họ vẫn"
	line "đang bận chuẩn bị…"
	done

GoldenrodPokecomCenterPerson13Text: ; unreferenced
	text "Chỉ nhìn thấy tất"
	line "cả đồ mới này"

	para "làm tôi cảm thấy"
	line "trẻ hơn!"
	done

GoldenrodPokecenter1FLassText:
	text "#MON cấp cao"
	line "không phải lúc"
	cont "nào cũng thắng."

	para "Vì nó có thể bị"
	line "bất lợi về hệ."

	para "Tôi không nghĩ"
	line "có #MON nào"

	para "mạnh nhất cả."
	done

GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText:
	text "Bạn là <PLAYER>,"
	line "đúng không?"

	para "Chúc mừng bạn!"

	para "Trong chương"
	line "trình đặc biệt,"
	cont "GS BALL được gửi!"

	para "Hãy nhận nó nhé!"
	done

GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText:
	text "Hãy ghé lại nhé!"
	done

GoldenrodPokecomCenterSignText: ; unreferenced
	text "#COM CENTER"
	line "THÔNG TIN TẦNG 1"

	para "Trái:"
	line "QUẢN LÝ"

	para "Giữa:"
	line "GÓC GIAO DỊCH"

	para "Phải:"
	line "TIN TỨC #MON"
	done

GoldenrodPokecomCenterNewsMachineNotYetText: ; unreferenced
	text "Đây là MÁY TIN TỨC"
	line "#MON!"

	para "Nó chưa hoạt động…"
	done

GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText:
	text "Ôi trời, balo bạn"
	line "nặng quá nhỉ!"

	para "À! Bạn có cái gì"
	line "tên là THƯ EON"
	cont "không?"

	para "Con gái tôi đang"
	line "muốn một cái."

	para "Bạn có thể cho"
	line "một cái chứ?"
	done

GoldenrodPokecenter1FAskGiveAwayAnEonMailText:
	text "Tặng THƯ EON?"
	done

GoldenrodPokecenter1FPokefanFThisIsForYouText:
	text "Ồ, tuyệt vời!"
	line "Cảm ơn em nhiều!"

	para "Đây, món quà đáp"
	line "lễ cho em!"
	done

GoldenrodPokecenter1FPokefanFDaughterWillBeDelightedText:
	text "Con gái tôi sẽ"
	line "rất vui mừng!"
	done

GoldenrodPokecenter1FPokefanFTooBadText:
	text "Hả? Em không có"
	line "à? Tiếc quá."
	done

GoldenrodPokecenter1FPokefanFAnotherTimeThenText:
	text "Ồ… Vậy lần sau"
	line "hãy ghé lại nhé."
	done

GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText:
	text "<PLAYER> đã tặng"
	line "THƯ EON."
	done

GoldenrodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, GOLDENROD_CITY, 15
	warp_event  4,  7, GOLDENROD_CITY, 15
	warp_event  0,  6, POKECOM_CENTER_ADMIN_OFFICE_MOBILE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events
	coord_event  3,  7, SCENE_GOLDENRODPOKECENTER1F_GS_BALL, GoldenrodPokecenter1F_GSBallSceneLeft
	coord_event  4,  7, SCENE_GOLDENRODPOKECENTER1F_GS_BALL, GoldenrodPokecenter1F_GSBallSceneRight

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FNurseScript, -1
	object_event 16,  8, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FLassScript, -1
	object_event  7,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FPokefanF, -1
