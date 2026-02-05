; see engine/menus/naming_screen.asm
;
; MailEntry_Page1-5: Vietnamese characters for mail composition
; Each page has 6 rows of 19 characters (114 bytes total per page)
;
; Mail messages now support full Vietnamese characters.
; When trading with English Crystal, the message is automatically
; translated (Vietnamese accented chars → base English letters).
; Nationality "VN" identifies Vietnamese mail for translation.

MailEntry_Page1:
	db "a ă â b c d đ e ê "
	db "g h i j k l m n o "
	db "ô ơ p q r s t u ư "
	db "v x y z            "
	db "                   "
	db "tiếp   xoá  xong  "

MailEntry_Page2:
	db "a á à ả ã ạ 1 2 3 "
	db "e é è ẻ ẽ ẹ 4 5 6 "
	db "i í ì ỉ ĩ ị 7 8 9 "
	db "o ó ò ỏ õ ọ   0   "
	db "                   "
	db "tiếp   xoá  xong  "

MailEntry_Page3:
	db "u ú ù ủ ũ ụ 1 2 3 "
	db "y ý ỳ ỷ ỹ   4 5 6 "
	db "ă ắ ằ ẳ ẵ ặ 7 8 9 "
	db "â ấ ầ ẩ ẫ ậ   0   "
	db "                   "
	db "tiếp   xoá  xong  "

MailEntry_Page4:
	db "ê ế ề ể ễ ệ 1 2 3 "
	db "ô ố ồ ổ ỗ ộ 4 5 6 "
	db "ơ ớ ờ ở ỡ ợ 7 8 9 "
	db "ư ứ ừ ử ữ ự   0   "
	db "                   "
	db "tiếp   xoá  xong  "

MailEntry_Page5:
	db "1 2 3 4 5 6 7 8 9 "
	db "0 - ? ! . , / ♂ ♀ "
	db "× ( ) : & [ ] <PK> <MN> "
	db "                   "
	db "                   "
	db "tiếp   xoá  xong  "
