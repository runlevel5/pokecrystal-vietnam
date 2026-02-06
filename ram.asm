INCLUDE "macros/ram.asm"


INCLUDE "ram/vram.asm"
if DEF(_CRYSTAL_VN)
INCLUDE "versions/crystal-vn/ram/wram.asm"
else
INCLUDE "ram/wram.asm"
endc
INCLUDE "ram/sram.asm"
INCLUDE "ram/hram.asm"
