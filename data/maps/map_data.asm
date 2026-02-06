SECTION "Maps", ROMX

INCLUDE "data/maps/maps.asm"
INCLUDE "data/maps/attributes.asm"


INCLUDE "data/maps/blocks.asm"


if DEF(_CRYSTAL_VN)
INCLUDE "versions/crystal-vn/data/maps/scripts.asm"
else
INCLUDE "data/maps/scripts.asm"
endc
