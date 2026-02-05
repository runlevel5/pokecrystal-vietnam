; see engine/menus/naming_screen.asm
;
; MailEntry_Page1-3: Vietnamese characters for mail composition
; Each page has 6 rows of 19 characters (114 bytes total per page)
;
; Mail messages now support full Vietnamese characters.
; When trading with English Crystal, the message is automatically
; translated (Vietnamese accented chars → base English letters).
; Nationality "VN" identifies Vietnamese mail for translation.

MailEntry_Page1:
	db "a ă â b c d đ e ê g"
	db "h i j k l m n o ô ơ"
	db "p q r s t u ư v x y"
	db "z - ? ! . , / ♂ ♀ ×"
	db "( ) : & [ ]     <PK> <MN>"
	db "tiếp   xoá  xong   "

MailEntry_Page2:
	db "á à ả ã ạ ắ ằ ẳ ẵ ặ"
	db "ấ ầ ẩ ẫ ậ é è ẻ ẽ ẹ"
	db "ế ề ể ễ ệ í ì ỉ ĩ ị"
	db "ó ò ỏ õ ọ ố ồ ổ ỗ ộ"
	db "ớ ờ ở ỡ ợ ú ù ủ ũ ụ"
	db "tiếp   xoá  xong   "

MailEntry_Page3:
    db "ý ỳ ỷ ỹ            "
	db "0 1 2 3 4 5 6 7 8 9"
	db "                   "
	db "                   "
	db "                   "
	db "tiếp   xoá  xong   "
