SECTION "Text 1", ROMX

if DEF(_CRYSTAL_VN)
INCLUDE "versions/crystal-vn/data/text/common_1.asm"
else
if DEF(_CRYSTAL_VN)
INCLUDE "versions/crystal-vn/data/text/common_1.asm"
else
INCLUDE "data/text/common_1.asm"
endc
endc


SECTION "Text 2", ROMX

if DEF(_CRYSTAL_VN)
INCLUDE "versions/crystal-vn/data/text/common_2.asm"
else
if DEF(_CRYSTAL_VN)
INCLUDE "versions/crystal-vn/data/text/common_2.asm"
else
INCLUDE "data/text/common_2.asm"
endc
endc


SECTION "Text 3", ROMX

if DEF(_CRYSTAL_VN)
INCLUDE "versions/crystal-vn/data/text/common_3.asm"
else
if DEF(_CRYSTAL_VN)
INCLUDE "versions/crystal-vn/data/text/common_3.asm"
else
INCLUDE "data/text/common_3.asm"
endc
endc
