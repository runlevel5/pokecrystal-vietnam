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
	charmap """,         $72 ; opening quote
	charmap """,         $73 ; closing quote
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

; Pokemon Crystal Vietnamese — Decomposed Accent Font Layout
;
; VRAM tile layout (font.png):
;   $80-$99: Uppercase A-Z + punctuation
;   $A0-$B9: Lowercase a-z
;   $BA:     đ (lowercase d-stroke)
;   $BB:     Đ (uppercase D-stroke)
;   $BC-$E2: Accent tiles (39 tiles)
;   $E3-$EF: Symbols and punctuation
;   $F0-$FF: Currency, digits
;
; Accented Vietnamese characters use a 2-byte encoding:
;   $23 (VN_ACCENT prefix) + accent_id
; The text engine reads $23, then reads the next byte as an accent ID.
; Bit 7 of accent_id = uppercase flag.
; Bits 6-0 = index into VnAccentDecompTable.

; Pokemon Crystal Vietnamese — font.png character layout
; Uppercase A-Z at $80-$99 (VRAM tiles, placed directly)

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
	charmap "(",         $9a
	charmap ")",         $9b
	charmap ":",         $9c
	charmap "←",         $9d
	charmap "[",         $9e
	charmap "]",         $9f

; Lowercase a-z at $A0-$B9 (VRAM tiles, placed directly)

	charmap "a",         $a0
	charmap "b",         $a1
	charmap "c",         $a2
	charmap "d",         $a3
	charmap "e",         $a4
	charmap "f",         $a5
	charmap "g",         $a6
	charmap "h",         $a7
	charmap "i",         $a8
	charmap "j",         $a9
	charmap "k",         $aa
	charmap "l",         $ab
	charmap "m",         $ac
	charmap "n",         $ad
	charmap "o",         $ae
	charmap "p",         $af
	charmap "q",         $b0
	charmap "r",         $b1
	charmap "s",         $b2
	charmap "t",         $b3
	charmap "u",         $b4
	charmap "v",         $b5
	charmap "w",         $b6
	charmap "x",         $b7
	charmap "y",         $b8
	charmap "z",         $b9

; đ/Đ (placed directly as VRAM tiles)

	charmap "đ",         $ba
	charmap "Đ",         $bb

; Vietnamese accented characters — all emit 2-byte sequence: $23 + accent_id
; $23 = VN_ACCENT prefix (repurposed from <KOUGEKI>)
; Bit 7 of accent_id: 0 = lowercase, 1 = uppercase
;
; Accent IDs (bits 6-0) — index into VnAccentDecompTable:
;   $00-$04: á à ả ã ạ      (base: a, tone/nặng only)
;   $05-$0A: ắ ằ ẳ ẵ ặ ă    (base: a, breve + tone/nặng)
;   $0B-$10: ấ ầ ẩ ẫ ậ â    (base: a, circumflex + tone/nặng)
;   $11-$15: é è ẻ ẽ ẹ      (base: e, tone/nặng only)
;   $16-$1B: ế ề ể ễ ệ ê    (base: e, circumflex + tone/nặng)
;   $1C-$20: í ì ỉ ĩ ị      (base: i, tone/nặng only)
;   $21-$25: ó ò ỏ õ ọ      (base: o, tone/nặng only)
;   $26-$2B: ố ồ ổ ỗ ộ ô    (base: o, circumflex + tone/nặng)
;   $2C-$31: ớ ờ ở ỡ ợ ơ    (base: o, horn + tone/nặng)
;   $32-$36: ú ù ủ ũ ụ      (base: u, tone/nặng only)
;   $37-$3C: ứ ừ ử ữ ự ư    (base: u, horn + tone/nặng)
;   $3D-$40: ý ỳ ỷ ỹ       (base: y, tone only)

; --- Lowercase accented (accent_id bit 7 = 0) ---

; a-family: tone only
	charmap "á",         $23, $00
	charmap "à",         $23, $01
	charmap "ả",         $23, $02
	charmap "ã",         $23, $03
	charmap "ạ",         $23, $04
; a-family: breve
	charmap "ắ",         $23, $05
	charmap "ằ",         $23, $06
	charmap "ẳ",         $23, $07
	charmap "ẵ",         $23, $08
	charmap "ặ",         $23, $09
	charmap "ă",         $23, $0a
; a-family: circumflex
	charmap "ấ",         $23, $0b
	charmap "ầ",         $23, $0c
	charmap "ẩ",         $23, $0d
	charmap "ẫ",         $23, $0e
	charmap "ậ",         $23, $0f
	charmap "â",         $23, $10
; e-family: tone only
	charmap "é",         $23, $11
	charmap "è",         $23, $12
	charmap "ẻ",         $23, $13
	charmap "ẽ",         $23, $14
	charmap "ẹ",         $23, $15
; e-family: circumflex
	charmap "ế",         $23, $16
	charmap "ề",         $23, $17
	charmap "ể",         $23, $18
	charmap "ễ",         $23, $19
	charmap "ệ",         $23, $1a
	charmap "ê",         $23, $1b
; i-family: tone only
	charmap "í",         $23, $1c
	charmap "ì",         $23, $1d
	charmap "ỉ",         $23, $1e
	charmap "ĩ",         $23, $1f
	charmap "ị",         $23, $20
; o-family: tone only
	charmap "ó",         $23, $21
	charmap "ò",         $23, $22
	charmap "ỏ",         $23, $23
	charmap "õ",         $23, $24
	charmap "ọ",         $23, $25
; o-family: circumflex
	charmap "ố",         $23, $26
	charmap "ồ",         $23, $27
	charmap "ổ",         $23, $28
	charmap "ỗ",         $23, $29
	charmap "ộ",         $23, $2a
	charmap "ô",         $23, $2b
; o-family: horn
	charmap "ớ",         $23, $2c
	charmap "ờ",         $23, $2d
	charmap "ở",         $23, $2e
	charmap "ỡ",         $23, $2f
	charmap "ợ",         $23, $30
	charmap "ơ",         $23, $31
; u-family: tone only
	charmap "ú",         $23, $32
	charmap "ù",         $23, $33
	charmap "ủ",         $23, $34
	charmap "ũ",         $23, $35
	charmap "ụ",         $23, $36
; u-family: horn
	charmap "ứ",         $23, $37
	charmap "ừ",         $23, $38
	charmap "ử",         $23, $39
	charmap "ữ",         $23, $3a
	charmap "ự",         $23, $3b
	charmap "ư",         $23, $3c
; y-family: tone only
	charmap "ý",         $23, $3d
	charmap "ỳ",         $23, $3e
	charmap "ỷ",         $23, $3f
	charmap "ỹ",         $23, $40

; --- Uppercase accented (accent_id bit 7 = 1) ---

; A-family: tone only
	charmap "Á",         $23, $80
	charmap "À",         $23, $81
	charmap "Ả",         $23, $82
	charmap "Ã",         $23, $83
	charmap "Ạ",         $23, $84
; A-family: breve
	charmap "Ắ",         $23, $85
	charmap "Ằ",         $23, $86
	charmap "Ẳ",         $23, $87
	charmap "Ẵ",         $23, $88
	charmap "Ặ",         $23, $89
	charmap "Ă",         $23, $8a
; A-family: circumflex
	charmap "Ấ",         $23, $8b
	charmap "Ầ",         $23, $8c
	charmap "Ẩ",         $23, $8d
	charmap "Ẫ",         $23, $8e
	charmap "Ậ",         $23, $8f
	charmap "Â",         $23, $90
; E-family: tone only
	charmap "É",         $23, $91
	charmap "È",         $23, $92
	charmap "Ẻ",         $23, $93
	charmap "Ẽ",         $23, $94
	charmap "Ẹ",         $23, $95
; E-family: circumflex
	charmap "Ế",         $23, $96
	charmap "Ề",         $23, $97
	charmap "Ể",         $23, $98
	charmap "Ễ",         $23, $99
	charmap "Ệ",         $23, $9a
	charmap "Ê",         $23, $9b
; I-family: tone only
	charmap "Í",         $23, $9c
	charmap "Ì",         $23, $9d
	charmap "Ỉ",         $23, $9e
	charmap "Ĩ",         $23, $9f
	charmap "Ị",         $23, $a0
; O-family: tone only
	charmap "Ó",         $23, $a1
	charmap "Ò",         $23, $a2
	charmap "Ỏ",         $23, $a3
	charmap "Õ",         $23, $a4
	charmap "Ọ",         $23, $a5
; O-family: circumflex
	charmap "Ố",         $23, $a6
	charmap "Ồ",         $23, $a7
	charmap "Ổ",         $23, $a8
	charmap "Ỗ",         $23, $a9
	charmap "Ộ",         $23, $aa
	charmap "Ô",         $23, $ab
; O-family: horn
	charmap "Ớ",         $23, $ac
	charmap "Ờ",         $23, $ad
	charmap "Ở",         $23, $ae
	charmap "Ỡ",         $23, $af
	charmap "Ợ",         $23, $b0
	charmap "Ơ",         $23, $b1
; U-family: tone only
	charmap "Ú",         $23, $b2
	charmap "Ù",         $23, $b3
	charmap "Ủ",         $23, $b4
	charmap "Ũ",         $23, $b5
	charmap "Ụ",         $23, $b6
; U-family: horn
	charmap "Ứ",         $23, $b7
	charmap "Ừ",         $23, $b8
	charmap "Ử",         $23, $b9
	charmap "Ữ",         $23, $ba
	charmap "Ự",         $23, $bb
	charmap "Ư",         $23, $bc
; Y-family: tone only
	charmap "Ý",         $23, $bd
	charmap "Ỳ",         $23, $be
	charmap "Ỷ",         $23, $bf
	charmap "Ỹ",         $23, $c0

; Row $Ex: punctuation and symbols
; $E0-$E2 are accent tiles (ACC_NANG_HUY, ACC_NANG_HOI, ACC_NANG_NGA)
	charmap "<PK>",      $e3
	charmap "<MN>",      $e4
	charmap "-",         $e5
	charmap "'",         $e6
	charmap "?",         $e7
	charmap "!",         $e8
	charmap ".",         $e9
	charmap "&",         $ea
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

; English contractions - keep for european_mail.asm compatibility
; (they'll display as Vietnamese accent tiles but code will compile)
	charmap "'d",        $d1
	charmap "'l",        $d2
	charmap "'m",        $d3
	charmap "'r",        $d4
	charmap "'s",        $d5
	charmap "'t",        $d7
	charmap "'v",        $d8

; Japanese control characters (see home/text.asm)

	charmap "<JP_18>",   $18 ; "ノ゛" (ungrammatical)
	charmap "<NI>",      $1d ; "に　"
	charmap "<TTE>",     $1e ; "って"
	charmap "<WO>",      $1f ; "を　"
	charmap "<TA!>",     $22 ; "た！"
	charmap "<KOUGEKI>", $23 ; "こうげき" — repurposed as VN_ACCENT prefix in VN build
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
