; see engine/menus/naming_screen.asm

; Page 1: Basic Vietnamese consonants and vowels
MailEntry_Page1:
	db "a ă â b c d đ e ê"
	db "g h i j k l m n o"
	db "ô ơ p q r s t u ư"
	db "v x y z          "
	db "tiếp   xoá  xong "

; Page 2: a, e, i, o with tone marks + numbers
MailEntry_Page2:
	db "a á à ả ã ạ 1 2 3"
	db "e é è ẻ ẽ ẹ 4 5 6"
	db "i í ì ỉ ĩ ị 7 8 9"
	db "o ó ò ỏ õ ọ   0  "
	db "tiếp   xoá  xong "

; Page 3: u, y, ă, â with tone marks + numbers
MailEntry_Page3:
	db "u ú ù ủ ũ ụ 1 2 3"
	db "y ý ỳ ỷ ỹ ỵ 4 5 6"
	db "ă ắ ằ ẳ ẵ ặ 7 8 9"
	db "â ấ ầ ẩ ẫ ậ   0  "
	db "tiếp   xoá  xong "

; Page 4: ê, ô, ơ, ư with tone marks + numbers
MailEntry_Page4:
	db "ê ế ề ể ễ ệ 1 2 3"
	db "ô ố ồ ổ ỗ ộ 4 5 6"
	db "ơ ớ ờ ở ỡ ợ 7 8 9"
	db "ư ứ ừ ử ữ ự   0  "
	db "tiếp   xoá  xong "

; Page 5: Numbers and punctuation
MailEntry_Page5:
	db "1 2 3 4 5 6 7 8 9"
	db "0 - ? ! . , / ♂ ♀"
	db "× ( ) : & [ ] <PK> <MN>"
	db "                 "
	db "tiếp   xoá  xong "
