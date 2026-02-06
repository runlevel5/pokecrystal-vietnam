	object_const_def
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST1
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST2
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST3

PokecomCenterAdminOfficeMobile_MapScripts:
	def_scene_scripts

	def_callbacks

PokecomCenterAdminOfficeMobileScientist1Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist1Text

PokecomCenterAdminOfficeMobileScientist2Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist2Text

PokecomCenterAdminOfficeMobileScientist3Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist3Text

PokecomCenterAdminOfficeMobileComputer1:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text
	waitbutton
.loop:
	refreshmap
	loadmenu .Computer1MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .PokeComClub
	ifequal 2, .MobileCenter
	sjump .Quit

.PokeComClub:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text_PokeComClub
	waitbutton
	sjump .loop

.MobileCenter:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text_MobileCenter
	waitbutton
	sjump .loop

.Quit:
	closetext
	end

.Computer1MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "<POKEMON>　つうしん　クラブ@" ; # COM CLUB
	db "モバイルセンター@" ; MOBILE CENTER
	db "やめる@" ; QUIT

PokecomCenterAdminOfficeMobileComputer2:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text
	waitbutton
.loop:
	refreshmap
	loadmenu .Computer2MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .UsePhone
	ifequal 2, .DontUsePhone
	sjump .Quit

.UsePhone:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text_UsePhone
	waitbutton
	sjump .loop

.DontUsePhone:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text_DontUsePhone
	waitbutton
	sjump .loop

.Quit:
	closetext
	end

.Computer2MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "でんわ<WO>つかうとき@" ; Use phone
	db "でんわ<GA>つながらないとき@" ; Don't use phone
	db "やめる@" ; QUIT

PokecomCenterAdminOfficeMobileComputer3:
	jumptext PokecomCenterAdminOfficeMobileComputer3Text

PokecomCenterAdminOfficeMobileScientist1Text:
	text "T.TÂM #COM và"
	line "TT DI ĐỘNG được"

	para "xây dựng để đáp"
	line "ứng nhu cầu đổi"

	para "và đấu với HLV ở"
	line "xa và với người"

	para "hoàn toàn xa lạ."
	done

PokecomCenterAdminOfficeMobileScientist2Text:
	text "Khi bạn kết nối"
	line "với ai đó qua"

	para "điện thoại di động"
	line "lần đầu tiên,"

	para "bạn có ấn tượng"
	line "không?"

	para "Lần đầu của tôi"
	line "thành công, tôi"

	para "ấn tượng đến nỗi"
	line "tôi run lên!"
	done

PokecomCenterAdminOfficeMobileScientist3Text:
	text "Họ có thể xây cơ"
	line "sở lớn này nhờ"

	para "tiến bộ công nghệ"
	line "không dây."
	done

PokecomCenterAdminOfficeMobileComputer1Text:
	text "Đây là thông báo"
	line "về nơi BỘ CHUYỂN"

	para "ĐỔI DI ĐỘNG được"
	line "sử dụng…"
	done

PokecomCenterAdminOfficeMobileComputer1Text_PokeComClub:
	text "Có CLB #COM ở"
	line "tầng trên của bất"

	para "kỳ T.TÂM #MON"
	line "nào."

	para "Ở đó, bạn có thể"
	line "đấu hoặc đổi với"

	para "bạn bè ở xa bằng"
	line "BỘ CHUYỂN ĐỔI DI"
	cont "ĐỘNG."

	para "Để kết nối, bạn"
	line "bè phải có cùng"

	para "loại BỘ CHUYỂN ĐỔI"
	line "DI ĐỘNG như bạn."
	done

PokecomCenterAdminOfficeMobileComputer1Text_MobileCenter:
	text "Để dùng GÓC ĐỔI"
	line "hoặc đọc TIN TỨC"

	para "#MON, bạn cần"
	line "gọi TT DI ĐỘNG."

	para "Bạn phải đăng ký"
	line "tại TT DI ĐỘNG"

	para "trước khi kết nối"
	line "vào đó."
	done

PokecomCenterAdminOfficeMobileComputer2Text:
	text "Đây là thông báo"
	line "về việc sử dụng"
	cont "điện thoại…"
	done

PokecomCenterAdminOfficeMobileComputer2Text_UsePhone:
	text "Hãy đảm bảo điện"
	line "thoại và BỘ"

	para "CHUYỂN ĐỔI DI ĐỘNG"
	line "được kết nối đúng"

	para "Hãy chắc chắn tín"
	line "hiệu điện thoại"

	para "không dây mạnh."

	para "Đừng chạm hoặc"
	line "ngắt điện thoại"
	cont "khi kết nối."
	done

PokecomCenterAdminOfficeMobileComputer2Text_DontUsePhone:
	text "Nếu máy chủ bận,"
	line "có thể không thể"

	para "đăng nhập được."

	para "Nếu vậy, hãy gọi"
	line "lại sau."

	para "Nếu bạn không thể"
	line "đăng nhập hoặc"

	para "không hiểu thông"
	line "báo lỗi,"

	para "hãy gọi trung tâm"
	line "hỗ trợ hoặc đọc"
	cont "hướng dẫn."
	done

PokecomCenterAdminOfficeMobileComputer3Text:
	text "VĂN PHÒNG QUẢN TRỊ"
	line "nhận được e-mail."
	cont "Nó nói…"

	para "<……> <……> <……>"

	para "Gửi nhân viên"
	line "T.TÂM #COM…"

	para "Truyền thông không"
	line "dây đã cho phép"

	para "HLV #MON tương"
	line "tác trên toàn"

	para "quốc. Hãy tiếp tục"
	line "làm việc cho ngày"

	para "tất cả HLV trên"
	line "thế giới có thể"

	para "kết nối không rào"
	line "cản!"

	para "<……> <……> <……>"
	done

PokecomCenterAdminOfficeMobile_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0, 31, GOLDENROD_POKECENTER_1F, 3
	warp_event  1, 31, GOLDENROD_POKECENTER_1F, 3

	def_coord_events

	def_bg_events
	bg_event  6, 26, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer1
	bg_event  6, 28, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer2
	bg_event  3, 26, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer3

	def_object_events
	object_event  4, 28, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist1Script, -1
	object_event  7, 27, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist2Script, -1
	object_event  7, 29, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist3Script, -1
