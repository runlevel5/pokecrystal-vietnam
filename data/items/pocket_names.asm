if DEF(_CRYSTAL_VN)
INCLUDE "versions/crystal-vn/data/items/pocket_names.asm"
else

ItemPocketNames:
; entries correspond to item type constants
	table_width 2
	dw .Item
	dw .Key
	dw .Ball
	dw .TM
	assert_table_length NUM_ITEM_TYPES

.Item: db "ITEM POCKET@"
.Key:  db "KEY POCKET@"
.Ball: db "BALL POCKET@"
.TM:   db "TM POCKET@"

endc
