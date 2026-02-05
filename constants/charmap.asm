; $00-$16 are TX_* constants (see macros/scripts/text.asm)

; Control characters (see home/text.asm)

	charmap "<NULL>",    $00
	charmap "<PLAY_G>",  $14 ; "<PLAYER>くん" or "<PLAYER>ちゃん"; same as "<PLAYER>" in English
	charmap "<MOBILE>",  $15
	charmap "<CR>",      $16
	charmap "<BSP>",     $1f ; breakable space (usually " ", or "<LF>" on the Town Map)
	charmap "<LF>",      $22
	charmap "<POKE>",    $24 ; "<PO><KE>"
	charmap "<WBR>",     $25 ; word-break opportunity (usually skipped, or "<LF>" on the Town Map)
	charmap "<RED>",     $38 ; wRedsName
	charmap "<GREEN>",   $39 ; wGreensName
	charmap "<ENEMY>",   $3f
	charmap "<MOM>",     $49 ; wMomsName
	charmap "<PKMN>",    $4a ; "<PK><MN>"
	charmap "<_CONT>",   $4b ; implements "<CONT>"
	charmap "<SCROLL>",  $4c
	charmap "<NEXT>",    $4e
	charmap "<LINE>",    $4f
	charmap "@",         $50 ; string terminator
	charmap "<PARA>",    $51
	charmap "<PLAYER>",  $52 ; wPlayerName
	charmap "<RIVAL>",   $53 ; wRivalName
	charmap "#",         $54 ; "POKé"
	charmap "<CONT>",    $55
	charmap "<……>",      $56 ; "……"
	charmap "<DONE>",    $57
	charmap "<PROMPT>",  $58
	charmap "<TARGET>",  $59
	charmap "<USER>",    $5a
	charmap "<PC>",      $5b ; "PC"
	charmap "<TM>",      $5c ; "TM"
	charmap "<TRAINER>", $5d ; "TRAINER"
	charmap "<ROCKET>",  $5e ; "ROCKET"
	charmap "<DEXEND>",  $5f

; Actual characters (from gfx/font/font_extra.png)

	charmap "<BOLD_A>",  $60 ; unused
	charmap "<BOLD_B>",  $61 ; unused
	charmap "<BOLD_C>",  $62 ; unused
	charmap "<BOLD_D>",  $63 ; unused
	charmap "<BOLD_E>",  $64 ; unused
	charmap "<BOLD_F>",  $65 ; unused
	charmap "<BOLD_G>",  $66 ; unused
	charmap "<BOLD_H>",  $67 ; unused
	charmap "<BOLD_I>",  $68 ; unused
	charmap "<BOLD_V>",  $69
	charmap "<BOLD_S>",  $6a
	charmap "<BOLD_L>",  $6b ; unused
	charmap "<BOLD_M>",  $6c ; unused
	charmap "<COLON>",   $6d ; colon with tinier dots than ":"
	charmap "ぃ",         $6e ; hiragana small i, unused
	charmap "ぅ",         $6f ; hiragana small u, unused
	charmap "<PO>",      $70
	charmap "<KE>",      $71
	charmap "“",         $72 ; opening quote
	charmap "”",         $73 ; closing quote
	charmap "·",         $74 ; middle dot, unused
	charmap "…",         $75 ; ellipsis
	charmap "ぁ",         $76 ; hiragana small a, unused
	charmap "ぇ",         $77 ; hiragana small e, unused
	charmap "ぉ",         $78 ; hiragana small o, unused

	charmap "┌",         $79
	charmap "─",         $7a
	charmap "┐",         $7b
	charmap "│",         $7c
	charmap "└",         $7d
	charmap "┘",         $7e
	charmap " ",         $7f

; Actual characters (from gfx/font/font_battle_extra.png)

	charmap "<LV>",      $6e

	charmap "<DO>",      $70 ; precomposed hiragana do (ど), unused
	charmap "◀",         $71
	charmap "『",         $72 ; Japanese opening quote, unused
	charmap "<ID>",      $73
	charmap "№",         $74

; Actual characters (from other graphics files)

	; needed for _LoadFontsExtra1 (see engine/gfx/load_font.asm)
	charmap "■",         $60 ; gfx/font/black.2bpp
	charmap "▲",         $61 ; gfx/font/up_arrow.png
	charmap "☎",         $62 ; gfx/font/phone_icon.2bpp

	; needed for MagikarpHouseSign (see engine/events/magikarp.asm)
	charmap "′",         $6e ; gfx/font/feet_inches.png
	charmap "″",         $6f ; gfx/font/feet_inches.png

	; needed for StatsScreen_PlaceShinyIcon and PrintPartyMonPage1
	charmap "⁂",         $3f ; gfx/stats/stats_tiles.png, tile 14

; Actual characters (from gfx/font/font.png)
; Vietnamese localization font layout
; Pokemon Crystal Vietnamese - New Layout 2025

; Row $8x: a-p (lowercase letters)
	charmap "a",         $80
	charmap "b",         $81
	charmap "c",         $82
	charmap "d",         $83
	charmap "e",         $84
	charmap "f",         $85
	charmap "g",         $86
	charmap "h",         $87
	charmap "i",         $88
	charmap "j",         $89
	charmap "k",         $8a
	charmap "l",         $8b
	charmap "m",         $8c
	charmap "n",         $8d
	charmap "o",         $8e
	charmap "p",         $8f

; Row $9x: q-z + punctuation (English-compatible)
	charmap "q",         $90
	charmap "r",         $91
	charmap "s",         $92
	charmap "t",         $93
	charmap "u",         $94
	charmap "v",         $95
	charmap "w",         $96
	charmap "x",         $97
	charmap "y",         $98
	charmap "z",         $99
	charmap "(",         $9a
	charmap ")",         $9b
	charmap ":",         $9c
	charmap ";",         $9d
	charmap "[",         $9e
	charmap "]",         $9f

; Row $Ax: a-family (á à ả ã ạ) + ă-family (ă ắ ằ ẳ ẵ ặ) + â-family (â ấ ầ ẩ ẫ)
	charmap "á",         $a0
	charmap "à",         $a1
	charmap "ả",         $a2
	charmap "ã",         $a3
	charmap "ạ",         $a4
	charmap "ă",         $a5
	charmap "ắ",         $a6
	charmap "ằ",         $a7
	charmap "ẳ",         $a8
	charmap "ẵ",         $a9
	charmap "ặ",         $aa
	charmap "â",         $ab
	charmap "ấ",         $ac
	charmap "ầ",         $ad
	charmap "ẩ",         $ae
	charmap "ẫ",         $af

; Row $Bx: â-family cont. (ậ) + e-family (è ẻ ẽ ẹ) + ê-family (ê ế ề ể ễ ệ) + i-family (í ì ỉ ĩ ị)
	charmap "ậ",         $b0
	charmap "è",         $b1
	charmap "ẻ",         $b2
	charmap "ẽ",         $b3
	charmap "ẹ",         $b4
	charmap "ê",         $b5
	charmap "ế",         $b6
	charmap "ề",         $b7
	charmap "ể",         $b8
	charmap "ễ",         $b9
	charmap "ệ",         $ba
	charmap "í",         $bb
	charmap "ì",         $bc
	charmap "ỉ",         $bd
	charmap "ĩ",         $be
	charmap "ị",         $bf

; Row $Cx: u-family (ú ù ủ ũ ụ) + ư-family (ư ứ ừ ử ữ ự) + o-family (ó ò ỏ õ ọ)
	charmap "ú",         $c0
	charmap "ù",         $c1
	charmap "ủ",         $c2
	charmap "ũ",         $c3
	charmap "ụ",         $c4
	charmap "ư",         $c5
	charmap "ứ",         $c6
	charmap "ừ",         $c7
	charmap "ử",         $c8
	charmap "ữ",         $c9
	charmap "ự",         $ca
	charmap "ó",         $cb
	charmap "ò",         $cc
	charmap "ỏ",         $cd
	charmap "õ",         $ce
	charmap "ọ",         $cf

; Row $Dx: ô-family (ô ố ồ ổ ỗ ộ) + ơ-family (ơ ớ ờ ở ỡ ợ) + y-family (ý ỳ ỷ ỹ)
	charmap "ô",         $d0
	charmap "ố",         $d1
	charmap "ồ",         $d2
	charmap "ổ",         $d3
	charmap "ỗ",         $d4
	charmap "ộ",         $d5
	charmap "ơ",         $d6
	charmap "ớ",         $d7
	charmap "ờ",         $d8
	charmap "ở",         $d9
	charmap "ỡ",         $da
	charmap "ợ",         $db
	charmap "ý",         $dc
	charmap "ỳ",         $dd
	charmap "ỷ",         $de
	charmap "ỹ",         $df

; Row $Ex: punctuation and symbols + đ, é
	charmap "'",         $e0
	charmap "<PK>",      $e1
	charmap "<MN>",      $e2
	charmap "-",         $e3
	charmap "←",         $e4
	charmap "đ",         $e5
	charmap "?",         $e6
	charmap "!",         $e7
	charmap ".",         $e8
	charmap "&",         $e9
	charmap "é",         $ea

; Uppercase letters map to lowercase (for compatibility with existing English text)
	charmap "A",         $80
	charmap "B",         $81
	charmap "C",         $82
	charmap "D",         $83
	charmap "E",         $84
	charmap "F",         $85
	charmap "G",         $86
	charmap "H",         $87
	charmap "I",         $88
	charmap "J",         $89
	charmap "K",         $8a
	charmap "L",         $8b
	charmap "M",         $8c
	charmap "N",         $8d
	charmap "O",         $8e
	charmap "P",         $8f
	charmap "Q",         $90
	charmap "R",         $91
	charmap "S",         $92
	charmap "T",         $93
	charmap "U",         $94
	charmap "V",         $95
	charmap "W",         $96
	charmap "X",         $97
	charmap "Y",         $98
	charmap "Z",         $99

; Uppercase Vietnamese characters map to lowercase equivalents
	charmap "Ă",         $a5
	charmap "Â",         $ab
	charmap "Ê",         $b5
	charmap "Ư",         $c5
	charmap "Ô",         $d0
	charmap "Ơ",         $d6
	charmap "Á",         $a0
	charmap "À",         $a1
	charmap "Ả",         $a2
	charmap "Ã",         $a3
	charmap "Ạ",         $a4
	charmap "É",         $ea
	charmap "È",         $b1
	charmap "Ẻ",         $b2
	charmap "Ẽ",         $b3
	charmap "Ẹ",         $b4
	charmap "Í",         $bb
	charmap "Ì",         $bc
	charmap "Ỉ",         $bd
	charmap "Ĩ",         $be
	charmap "Ị",         $bf
	charmap "Đ",         $e5
	charmap "Ó",         $cb
	charmap "Ò",         $cc
	charmap "Ỏ",         $cd
	charmap "Õ",         $ce
	charmap "Ọ",         $cf
	charmap "Ú",         $c0
	charmap "Ù",         $c1
	charmap "Ủ",         $c2
	charmap "Ũ",         $c3
	charmap "Ụ",         $c4
	charmap "Ý",         $dc
	charmap "Ỳ",         $dd
	charmap "Ỷ",         $de
	charmap "Ỹ",         $df
	charmap "Ắ",         $a6
	charmap "Ằ",         $a7
	charmap "Ẳ",         $a8
	charmap "Ẵ",         $a9
	charmap "Ặ",         $aa
	charmap "Ấ",         $ac
	charmap "Ầ",         $ad
	charmap "Ẩ",         $ae
	charmap "Ẫ",         $af
	charmap "Ậ",         $b0
	charmap "Ế",         $b6
	charmap "Ề",         $b7
	charmap "Ể",         $b8
	charmap "Ễ",         $b9
	charmap "Ệ",         $ba
	charmap "Ố",         $d1
	charmap "Ồ",         $d2
	charmap "Ổ",         $d3
	charmap "Ỗ",         $d4
	charmap "Ộ",         $d5
	charmap "Ớ",         $d7
	charmap "Ờ",         $d8
	charmap "Ở",         $d9
	charmap "Ỡ",         $da
	charmap "Ợ",         $db
	charmap "Ứ",         $c6
	charmap "Ừ",         $c7
	charmap "Ử",         $c8
	charmap "Ữ",         $c9
	charmap "Ự",         $ca

; English contractions - keep for european_mail.asm compatibility
; (they'll display as Vietnamese chars but code will compile)
	charmap "'d",        $d1 ; ố
	charmap "'l",        $d2 ; ồ
	charmap "'m",        $d3 ; ổ
	charmap "'r",        $d4 ; ỗ
	charmap "'s",        $d5 ; ộ
	charmap "'t",        $d7 ; ớ
	charmap "'v",        $d8 ; ờ

; Row $Ex continued: arrows and symbols
	charmap "→",         $eb
	charmap "▷",         $ec
	charmap "▶",         $ed
	charmap "▼",         $ee
	charmap "♂",         $ef
	charmap "¥",         $f0 ; Poké Dollar sign
	charmap "×",         $f1
	charmap "<DOT>",     $f2 ; decimal point; same as "." in English
	charmap "/",         $f3
	charmap ",",         $f4
	charmap "♀",         $f5

	charmap "0",         $f6
	charmap "1",         $f7
	charmap "2",         $f8
	charmap "3",         $f9
	charmap "4",         $fa
	charmap "5",         $fb
	charmap "6",         $fc
	charmap "7",         $fd
	charmap "8",         $fe
	charmap "9",         $ff

; Japanese control characters (see home/text.asm)

	charmap "<JP_18>",   $18 ; "ノ゛" (ungrammatical)
	charmap "<NI>",      $1d ; "に　"
	charmap "<TTE>",     $1e ; "って"
	charmap "<WO>",      $1f ; "を　"
	charmap "<TA!>",     $22 ; "た！"
	charmap "<KOUGEKI>", $23 ; "こうげき"
	charmap "<WA>",      $24 ; "は　"
	charmap "<NO>",      $25 ; "の　"
	charmap "<ROUTE>",   $35 ; "ばん　どうろ"
	charmap "<WATASHI>", $36 ; "わたし"
	charmap "<KOKO_WA>", $37 ; "ここは"
	charmap "<GA>",      $4a ; "が　"
	charmap "<POKEMON>", $54 ; "ポケモン"

; Japanese kana, for those bits of text that were not translated to English

	charmap "ガ", $05
	charmap "ギ", $06
	charmap "グ", $07
	charmap "ゲ", $08
	charmap "ゴ", $09
	charmap "ザ", $0a
	charmap "ジ", $0b
	charmap "ズ", $0c
	charmap "ゼ", $0d
	charmap "ゾ", $0e
	charmap "ダ", $0f
	charmap "ヂ", $10
	charmap "ヅ", $11
	charmap "デ", $12
	charmap "ド", $13

	charmap "バ", $19
	charmap "ビ", $1a
	charmap "ブ", $1b
	charmap "ボ", $1c

	charmap "が", $26
	charmap "ぎ", $27
	charmap "ぐ", $28
	charmap "げ", $29
	charmap "ご", $2a
	charmap "ざ", $2b
	charmap "じ", $2c
	charmap "ず", $2d
	charmap "ぜ", $2e
	charmap "ぞ", $2f
	charmap "だ", $30
	charmap "ぢ", $31
	charmap "づ", $32
	charmap "で", $33
	charmap "ど", $34

	charmap "ば", $3a
	charmap "び", $3b
	charmap "ぶ", $3c
	charmap "べ", $3d
	charmap "ぼ", $3e

	charmap "パ", $40
	charmap "ピ", $41
	charmap "プ", $42
	charmap "ポ", $43
	charmap "ぱ", $44
	charmap "ぴ", $45
	charmap "ぷ", $46
	charmap "ぺ", $47
	charmap "ぽ", $48

	charmap "「", $70
	charmap "」", $71
	charmap "』", $73
	charmap "・", $74
	charmap "⋯", $75

	charmap "　", $7f

	charmap "ア", $80
	charmap "イ", $81
	charmap "ウ", $82
	charmap "エ", $83
	charmap "オ", $84
	charmap "カ", $85
	charmap "キ", $86
	charmap "ク", $87
	charmap "ケ", $88
	charmap "コ", $89
	charmap "サ", $8a
	charmap "シ", $8b
	charmap "ス", $8c
	charmap "セ", $8d
	charmap "ソ", $8e
	charmap "タ", $8f
	charmap "チ", $90
	charmap "ツ", $91
	charmap "テ", $92
	charmap "ト", $93
	charmap "ナ", $94
	charmap "ニ", $95
	charmap "ヌ", $96
	charmap "ネ", $97
	charmap "ノ", $98
	charmap "ハ", $99
	charmap "ヒ", $9a
	charmap "フ", $9b
	charmap "ホ", $9c
	charmap "マ", $9d
	charmap "ミ", $9e
	charmap "ム", $9f
	charmap "メ", $a0
	charmap "モ", $a1
	charmap "ヤ", $a2
	charmap "ユ", $a3
	charmap "ヨ", $a4
	charmap "ラ", $a5
	charmap "ル", $a6
	charmap "レ", $a7
	charmap "ロ", $a8
	charmap "ワ", $a9
	charmap "ヲ", $aa
	charmap "ン", $ab
	charmap "ッ", $ac
	charmap "ャ", $ad
	charmap "ュ", $ae
	charmap "ョ", $af
	charmap "ィ", $b0

	charmap "あ", $b1
	charmap "い", $b2
	charmap "う", $b3
	charmap "え", $b4
	charmap "お", $b5
	charmap "か", $b6
	charmap "き", $b7
	charmap "く", $b8
	charmap "け", $b9
	charmap "こ", $ba
	charmap "さ", $bb
	charmap "し", $bc
	charmap "す", $bd
	charmap "せ", $be
	charmap "そ", $bf
	charmap "た", $c0
	charmap "ち", $c1
	charmap "つ", $c2
	charmap "て", $c3
	charmap "と", $c4
	charmap "な", $c5
	charmap "に", $c6
	charmap "ぬ", $c7
	charmap "ね", $c8
	charmap "の", $c9
	charmap "は", $ca
	charmap "ひ", $cb
	charmap "ふ", $cc
	charmap "へ", $cd
	charmap "ほ", $ce
	charmap "ま", $cf
	charmap "み", $d0
	charmap "む", $d1
	charmap "め", $d2
	charmap "も", $d3
	charmap "や", $d4
	charmap "ゆ", $d5
	charmap "よ", $d6
	charmap "ら", $d7
	charmap "り", $d8
	charmap "る", $d9
	charmap "れ", $da
	charmap "ろ", $db
	charmap "わ", $dc
	charmap "を", $dd
	charmap "ん", $de
	charmap "っ", $df
	charmap "ゃ", $e0
	charmap "ゅ", $e1
	charmap "ょ", $e2

	charmap "ー", $e3
	charmap "ﾟ", $e4
	charmap "ﾞ", $e5

	charmap "？", $e6
	charmap "！", $e7
	charmap "。", $e8

	charmap "ァ", $e9
	charmap "ゥ", $ea
	charmap "ェ", $eb

	charmap "円", $f0

	charmap "．", $f2
	charmap "／", $f3

	charmap "ォ", $f4

	charmap "０", $f6
	charmap "１", $f7
	charmap "２", $f8
	charmap "３", $f9
	charmap "４", $fa
	charmap "５", $fb
	charmap "６", $fc
	charmap "７", $fd
	charmap "８", $fe
	charmap "９", $ff

; Unown charmap, for Unown words (see gfx/tilesets/ruins_of_alph.png)
pushc
	newcharmap unown
	DEF PRINTABLE_UNOWN EQUS "ABCDEFGHIJKLMNOPQRSTUVWXYZ-"
	for i, STRLEN(#PRINTABLE_UNOWN)
		charmap STRSLICE(#PRINTABLE_UNOWN, i, i + 1), $10 * (i / 8) + 2 * i
	endr
	charmap "@", $ff ; end
popc

; ASCII charmap, for mobile functions
pushc
	newcharmap ascii
	DEF PRINTABLE_ASCII EQUS " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz\{|}~"
	for i, STRLEN(#PRINTABLE_ASCII)
		charmap STRSLICE(#PRINTABLE_ASCII, i, i + 1), i + $20
	endr
	charmap "\t", $09
	charmap "\n", $0a
	charmap "\r", $0d
popc
