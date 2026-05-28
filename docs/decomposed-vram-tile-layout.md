# Decomposed Accent System — VRAM Tile Layout

## Architecture (Option A: Render-time Decomposition)

Text in ROM/RAM uses the **same charmap codes as today** (`$A0-$DF` for accented Vietnamese characters). No text strings change.

The decomposition happens at **render time** in `PlaceNextChar`:
1. Character code arrives (e.g., `$A6` = ắ)
2. Lookup decomposition table → base glyph tile + accent flags
3. Write the **base glyph VRAM tile** to the text row (e.g., ă at `$D7`)
4. Write the **accent tile** to the accent row above/below

This creates a **split** between charmap codes and VRAM tiles:
- **Charmap code** `$A6` still means "ắ" in all ROM/RAM data
- **VRAM tile** at position `$A6` now contains the glyph for lowercase "g" (not ắ)
- `PlaceNextChar` bridges the gap with the decomposition lookup

### Design Basis: English Crystal Font Layout

The Vietnamese VRAM tile layout keeps the **English Crystal font layout exactly as-is** and only uses free/unused tile slots for Vietnamese-specific characters. This is a deliberate choice:

1. **Perfect link cable compatibility** — every English Crystal tile position is preserved
2. **Minimal risk** — no English functionality is broken; German umlauts and contractions remain available
3. **Only free slots used** — Vietnamese characters occupy `$BA-$BF` (6 tiles), `$C6-$CF` (10 tiles), and `$D7-$DE` (8 tiles), all of which are empty in English Crystal

### What Changes vs What Stays the Same

| Component | Changes? | Details |
|-----------|----------|---------|
| charmap.asm codes | **No** | Single-case at `$80-$99`, accented at `$A0-$DF` (same as current VN build) |
| Vietnamese accented char codes | **No** | Still assemble to codes in `$A0-$DF` range via charmap |
| Text .asm files | **No** | All dialog text stays the same |
| Link cable translation | **No** | Unchanged for POC (operates on charmap codes, not VRAM tiles) |
| Font PNG (VRAM tiles) | **Yes** | English Crystal base + Vietnamese extensions in free slots only |
| PlaceNextChar | **Yes** | Decomposition logic added for accented chars |
| TextScroll | **Yes** | Must handle accent rows |
| Textbox constants | **Yes** | Height 6→7 |

## VRAM Tile Layout (font.png)

### English Crystal Layout (our starting point)

```
     $x0  $x1  $x2  $x3  $x4  $x5  $x6  $x7  $x8  $x9  $xA  $xB  $xC  $xD  $xE  $xF
$8x:  A    B    C    D    E    F    G    H    I    J    K    L    M    N    O    P
$9x:  Q    R    S    T    U    V    W    X    Y    Z    (    )    :    ;    [    ]
$Ax:  a    b    c    d    e    f    g    h    i    j    k    l    m    n    o    p
$Bx:  q    r    s    t    u    v    w    x    y    z    —    —    —    —    —    —
$Cx:  Ä    Ö    Ü    ä    ö    ü    —    —    —    —    —    —    —    —    —    —
$Dx: 'd   'l   'm   'r   's   't   'v    —    —    —    —    —    —    —    —    ←
$Ex:  '   <PK> <MN>  -    ←    ﾞ    ?    !    .    &    é    →    ▷    ▶    ▼    ♂
$Fx:  ¥    ×   <.>   /    ,    ♀    0    1    2    3    4    5    6    7    8    9
```

**Note:** `$BA-$BF` are empty (no glyph, only Japanese hiragana charmap entries). `$C6-$CF` and `$D7-$DE` are completely empty. German umlauts are at `$C0-$C5`, contractions at `$D0-$D6`, and `$DF` = ←.

### Proposed Vietnamese Layout

Vietnamese characters are placed **only in free/unused slots**. All English Crystal tiles remain untouched.

```
     $x0  $x1  $x2  $x3  $x4  $x5  $x6  $x7  $x8  $x9  $xA  $xB  $xC  $xD  $xE  $xF
$8x:  A    B    C    D    E    F    G    H    I    J    K    L    M    N    O    P
$9x:  Q    R    S    T    U    V    W    X    Y    Z    (    )    :    ;    [    ]
$Ax:  a    b    c    d    e    f    g    h    i    j    k    l    m    n    o    p
$Bx:  q    r    s    t    u    v    w    x    y    z   [Ă]  [Â]  [Ê]  [Ô]  [Ơ]  [Ư]
$Cx:  Ä    Ö    Ü    ä    ö    ü   [ᴬ¹] [ᴬ²] [ᴬ³] [ᴬ⁴] [ᴬ⁵] [ᴬ⁶] [ᴬ⁷] [ᴬ⁸] [ᴬ⁹] [Đ]
$Dx: 'd   'l   'm   'r   's   't   'v   [ă]  [â]  [ê]  [ô]  [ơ]  [ư]  [đ] (free) ←
$Ex:  '   <PK> <MN>  -    ←    ﾞ    ?    !    .    &    é    →    ▷    ▶    ▼    ♂
$Fx:  ¥    ×   <.>   /    ,    ♀    0    1    2    3    4    5    6    7    8    9
```

`[brackets]` = new Vietnamese tiles in previously free slots. All other positions are identical to English Crystal.

### Changes from English Crystal

| Range | English Crystal | Vietnamese | Change |
|-------|----------------|-----------|--------|
| `$80-$99` | A-Z + punctuation | A-Z + punctuation | **Identical** |
| `$A0-$B9` | a-z | a-z | **Identical** |
| `$BA-$BF` | (empty) | Ă Â Ê Ô Ơ Ư | **New** — uppercase base vowel variants |
| `$C0-$C5` | Ä Ö Ü ä ö ü | Ä Ö Ü ä ö ü | **Identical** (German umlauts kept) |
| `$C6-$CE` | (empty) | 9 accent tiles | **New** |
| `$CF` | (empty) | Đ (uppercase) | **New** |
| `$D0-$D6` | 'd 'l 'm 'r 's 't 'v | 'd 'l 'm 'r 's 't 'v | **Identical** (contractions kept) |
| `$D7-$DC` | (empty) | ă â ê ô ơ ư | **New** — lowercase base vowel variants |
| `$DD` | (empty) | đ (lowercase) | **New** |
| `$DE` | (empty) | (1 free tile) | Available for future use |
| `$DF` | ← | ← | **Identical** |
| `$E0-$FF` | symbols, digits | symbols, digits | **Identical** |

**Total Vietnamese tiles added: 23** (6 uppercase variants + 9 accent tiles + 1 Đ + 6 lowercase variants + 1 đ)
**Free tiles remaining: 1** (`$DE`)

### Accent Tiles (ᴬ¹-ᴬ⁹)

Each accent tile is 8×8 pixels divided into two zones:

```
+--------+
|  top   | ← pixels 0-3: nặng dot from line ABOVE
+--------+
| bottom | ← pixels 4-7: tone mark for line BELOW
+--------+
```

| Tile | Code | Top (nặng) | Bottom (tone) | Constant |
|------|------|-----------|--------------|----------|
| ᴬ¹ | `$C6` | (empty) | sắc (´) | `ACC_SAC` |
| ᴬ² | `$C7` | (empty) | huyền (\`) | `ACC_HUY` |
| ᴬ³ | `$C8` | (empty) | hỏi (̉) | `ACC_HOI` |
| ᴬ⁴ | `$C9` | (empty) | ngã (~) | `ACC_NGA` |
| ᴬ⁵ | `$CA` | nặng (̣) | (empty) | `ACC_NANG` |
| ᴬ⁶ | `$CB` | nặng (̣) | sắc (´) | `ACC_NANG_SAC` |
| ᴬ⁷ | `$CC` | nặng (̣) | huyền (\`) | `ACC_NANG_HUY` |
| ᴬ⁸ | `$CD` | nặng (̣) | hỏi (̉) | `ACC_NANG_HOI` |
| ᴬ⁹ | `$CE` | nặng (̣) | ngã (~) | `ACC_NANG_NGA` |

## Tile Budget Summary

| Range | Count | Content | Status |
|-------|-------|---------|--------|
| `$80-$8F` | 16 | A-P uppercase | Identical to English |
| `$90-$9F` | 16 | Q-Z + punctuation | Identical to English |
| `$A0-$AF` | 16 | a-p lowercase | Identical to English |
| `$B0-$B9` | 10 | q-z lowercase | Identical to English |
| `$BA-$BF` | 6 | Ă Â Ê Ô Ơ Ư (upper base variants) | **New** (was empty) |
| `$C0-$C5` | 6 | Ä Ö Ü ä ö ü (German umlauts) | Identical to English |
| `$C6-$CE` | 9 | Accent tiles (compound) | **New** (was empty) |
| `$CF` | 1 | Đ (uppercase) | **New** (was empty) |
| `$D0-$D6` | 7 | Contractions ('d 'l 'm 'r 's 't 'v) | Identical to English |
| `$D7-$DC` | 6 | ă â ê ô ơ ư (lower base variants) | **New** (was empty) |
| `$DD` | 1 | đ (lowercase) | **New** (was empty) |
| `$DE` | 1 | **Free** | Available for future use |
| `$DF` | 1 | ← | Identical to English |
| `$E0-$EF` | 16 | Symbols, ﾞ, é, punctuation | Identical to English |
| `$F0-$FF` | 16 | ¥, ×, digits 0-9 | Identical to English |
| **Total** | **128** | | **1 free tile** |

## POC Charmap Strategy

For the POC, the charmap stays exactly as-is (no changes needed):

```asm
; Uppercase and lowercase both map to $80-$99 (single-case, as current VN build)
charmap "A", $80  ;  charmap "a", $80
charmap "B", $81  ;  charmap "b", $81
; ...

; Accented Vietnamese chars stay at $A0-$DF
charmap "á", $A0
charmap "à", $A1
; ...
```

The font PNG at `$80-$99` shows uppercase glyphs (matching English Crystal). Text renders single-case uppercase, as it does today. The key change is that `$A0-$DF` VRAM tiles are no longer used directly — `PlaceNextChar` decomposes accented charmap codes into base tiles + accent tiles at render time.

The uppercase/lowercase split (putting lowercase at `$A0-$B9`) is a **Phase 2** enhancement that requires restructuring the charmap and auditing all text strings.

## Decomposition Lookup Table

### Accent Flags Encoding (1 byte)

```
Bit 7-4: unused (0)
Bit 3:   has nặng (dot below) — 1=yes, 0=no
Bit 2-0: above accent type:
         000 = none
         001 = sắc (´)
         010 = huyền (`)
         011 = hỏi (̉)
         100 = ngã (~)
```

### Full Decomposition Table (64 entries)

Each entry: 2 bytes = (base_glyph_vram_tile, accent_flags)

Base glyph tiles reference `$80-$99` for simple vowels or `$D7-$DC` for modified vowels:

| Charmap Code | Character | Base Glyph | Base Tile | Accent Flags | Notes |
|-------------|-----------|-----------|-----------|-------------|-------|
| `$A0` | á | a | `$80` | `$01` (sắc) | |
| `$A1` | à | a | `$80` | `$02` (huyền) | |
| `$A2` | ả | a | `$80` | `$03` (hỏi) | |
| `$A3` | ã | a | `$80` | `$04` (ngã) | |
| `$A4` | ạ | a | `$80` | `$08` (nặng) | |
| `$A5` | ă | ă | `$D7` | `$00` (none) | base variant only |
| `$A6` | ắ | ă | `$D7` | `$01` (sắc) | |
| `$A7` | ằ | ă | `$D7` | `$02` (huyền) | |
| `$A8` | ẳ | ă | `$D7` | `$03` (hỏi) | |
| `$A9` | ẵ | ă | `$D7` | `$04` (ngã) | |
| `$AA` | ặ | ă | `$D7` | `$08` (nặng) | |
| `$AB` | â | â | `$D8` | `$00` (none) | base variant only |
| `$AC` | ấ | â | `$D8` | `$01` (sắc) | |
| `$AD` | ầ | â | `$D8` | `$02` (huyền) | |
| `$AE` | ẩ | â | `$D8` | `$03` (hỏi) | |
| `$AF` | ẫ | â | `$D8` | `$04` (ngã) | |
| `$B0` | ậ | â | `$D8` | `$08` (nặng) | |
| `$B1` | è | e | `$84` | `$02` (huyền) | |
| `$B2` | ẻ | e | `$84` | `$03` (hỏi) | |
| `$B3` | ẽ | e | `$84` | `$04` (ngã) | |
| `$B4` | ẹ | e | `$84` | `$08` (nặng) | |
| `$B5` | ê | ê | `$D9` | `$00` (none) | base variant only |
| `$B6` | ế | ê | `$D9` | `$01` (sắc) | |
| `$B7` | ề | ê | `$D9` | `$02` (huyền) | |
| `$B8` | ể | ê | `$D9` | `$03` (hỏi) | |
| `$B9` | ễ | ê | `$D9` | `$04` (ngã) | |
| `$BA` | ệ | ê | `$D9` | `$08` (nặng) | |
| `$BB` | í | i | `$88` | `$01` (sắc) | |
| `$BC` | ì | i | `$88` | `$02` (huyền) | |
| `$BD` | ỉ | i | `$88` | `$03` (hỏi) | |
| `$BE` | ĩ | i | `$88` | `$04` (ngã) | |
| `$BF` | ị | i | `$88` | `$08` (nặng) | |
| `$C0` | ú | u | `$94` | `$01` (sắc) | |
| `$C1` | ù | u | `$94` | `$02` (huyền) | |
| `$C2` | ủ | u | `$94` | `$03` (hỏi) | |
| `$C3` | ũ | u | `$94` | `$04` (ngã) | |
| `$C4` | ụ | u | `$94` | `$08` (nặng) | |
| `$C5` | ư | ư | `$DC` | `$00` (none) | base variant only |
| `$C6` | ứ | ư | `$DC` | `$01` (sắc) | |
| `$C7` | ừ | ư | `$DC` | `$02` (huyền) | |
| `$C8` | ử | ư | `$DC` | `$03` (hỏi) | |
| `$C9` | ữ | ư | `$DC` | `$04` (ngã) | |
| `$CA` | ự | ư | `$DC` | `$08` (nặng) | |
| `$CB` | ó | o | `$8E` | `$01` (sắc) | |
| `$CC` | ò | o | `$8E` | `$02` (huyền) | |
| `$CD` | ỏ | o | `$8E` | `$03` (hỏi) | |
| `$CE` | õ | o | `$8E` | `$04` (ngã) | |
| `$CF` | ọ | o | `$8E` | `$08` (nặng) | |
| `$D0` | ô | ô | `$DA` | `$00` (none) | base variant only |
| `$D1` | ố | ô | `$DA` | `$01` (sắc) | |
| `$D2` | ồ | ô | `$DA` | `$02` (huyền) | |
| `$D3` | ổ | ô | `$DA` | `$03` (hỏi) | |
| `$D4` | ỗ | ô | `$DA` | `$04` (ngã) | |
| `$D5` | ộ | ô | `$DA` | `$08` (nặng) | |
| `$D6` | ơ | ơ | `$DB` | `$00` (none) | base variant only |
| `$D7` | ớ | ơ | `$DB` | `$01` (sắc) | |
| `$D8` | ờ | ơ | `$DB` | `$02` (huyền) | |
| `$D9` | ở | ơ | `$DB` | `$03` (hỏi) | |
| `$DA` | ỡ | ơ | `$DB` | `$04` (ngã) | |
| `$DB` | ợ | ơ | `$DB` | `$08` (nặng) | |
| `$DC` | ý | y | `$98` | `$01` (sắc) | |
| `$DD` | ỳ | y | `$98` | `$02` (huyền) | |
| `$DE` | ỷ | y | `$98` | `$03` (hỏi) | |
| `$DF` | ỹ | y | `$98` | `$04` (ngã) | |

**Storage:** 64 entries × 2 bytes = **128 bytes in ROM**.

### VRAM Tile Code Collision Analysis

Base glyph tiles referenced by the decomposition table:

| Base glyph | VRAM tile code | What's at that VRAM position? | OK? |
|-----------|---------------|-------------------------------|-----|
| A (`$80`) | `$80` | A (uppercase) | ✓ |
| E (`$84`) | `$84` | E (uppercase) | ✓ |
| I (`$88`) | `$88` | I (uppercase) | ✓ |
| O (`$8E`) | `$8E` | O (uppercase) | ✓ |
| U (`$94`) | `$94` | U (uppercase) | ✓ |
| Y (`$98`) | `$98` | Y (uppercase) | ✓ |
| ă (`$D7`) | `$D7` | ă (lowercase base variant) | ✓ — new tile in free slot |
| â (`$D8`) | `$D8` | â (lowercase base variant) | ✓ — new tile in free slot |
| ê (`$D9`) | `$D9` | ê (lowercase base variant) | ✓ — new tile in free slot |
| ô (`$DA`) | `$DA` | ô (lowercase base variant) | ✓ — new tile in free slot |
| ơ (`$DB`) | `$DB` | ơ (lowercase base variant) | ✓ — new tile in free slot |
| ư (`$DC`) | `$DC` | ư (lowercase base variant) | ✓ — new tile in free slot |

**No collisions.** All base glyph tile codes point to tiles that contain the correct glyph.

**Note:** Base vowels (a, e, i, o, u, y) decompose to uppercase tile codes (`$80-$99`) because the current charmap maps both cases to `$80-$99`. This means accented text renders with uppercase base letters (e.g., "ắ" → uppercase A-breve glyph + sắc accent). This is acceptable for the POC since the current VN build is already single-case.

**Phase 2 improvement:** When lowercase charmap codes are separated to `$A0-$B9`, the decomposition table would be updated to reference lowercase tiles (e.g., á → a at `$A0` instead of A at `$80`).

### Accent Tile Selection Logic

**For the accent-above row** (1 row above text):
| Flags bits 2-0 | Tile | Description |
|----------------|------|------------|
| 000 (none) | `$7F` (space) | No tone mark |
| 001 (sắc) | `$C6` | Acute accent |
| 010 (huyền) | `$C7` | Grave accent |
| 011 (hỏi) | `$C8` | Hook above |
| 100 (ngã) | `$C9` | Tilde |

**For the accent-below row** (1 row below text):
| Flags bit 3 | Tile | Description |
|-------------|------|------------|
| 0 | `$7F` (space) | No dot below |
| 1 | `$CA` | Dot below (nặng) |

**For the compound row** (between two text lines — top half = nặng from above, bottom half = tone for below):

| Existing tile | New accent | Result tile |
|---------------|-----------|-------------|
| space (`$7F`) | sắc | `$C6` |
| space (`$7F`) | huyền | `$C7` |
| space (`$7F`) | hỏi | `$C8` |
| space (`$7F`) | ngã | `$C9` |
| space (`$7F`) | nặng | `$CA` |
| ACC_SAC (`$C6`) | nặng | `$CB` |
| ACC_HUY (`$C7`) | nặng | `$CC` |
| ACC_HOI (`$C8`) | nặng | `$CD` |
| ACC_NGA (`$C9`) | nặng | `$CE` |
| ACC_NANG (`$CA`) | sắc | `$CB` |
| ACC_NANG (`$CA`) | huyền | `$CC` |
| ACC_NANG (`$CA`) | hỏi | `$CD` |
| ACC_NANG (`$CA`) | ngã | `$CE` |

## Charmap Constants

```asm
; VRAM tile codes for accent tiles
DEF ACCENT_SAC       EQU $C6  ; sắc (´) — tone only
DEF ACCENT_HUY       EQU $C7  ; huyền (`) — tone only
DEF ACCENT_HOI       EQU $C8  ; hỏi (̉) — tone only
DEF ACCENT_NGA       EQU $C9  ; ngã (~) — tone only
DEF ACCENT_NANG      EQU $CA  ; nặng (̣) — dot only
DEF ACCENT_NANG_SAC  EQU $CB  ; nặng + sắc
DEF ACCENT_NANG_HUY  EQU $CC  ; nặng + huyền
DEF ACCENT_NANG_HOI  EQU $CD  ; nặng + hỏi
DEF ACCENT_NANG_NGA  EQU $CE  ; nặng + ngã

; VRAM tile codes for lowercase base vowel variants
DEF TILE_ABREVE      EQU $D7  ; ă
DEF TILE_ACIRC       EQU $D8  ; â
DEF TILE_ECIRC       EQU $D9  ; ê
DEF TILE_OCIRC       EQU $DA  ; ô
DEF TILE_OHORN       EQU $DB  ; ơ
DEF TILE_UHORN       EQU $DC  ; ư

; VRAM tile codes for uppercase base vowel variants
DEF TILE_ABREVE_U    EQU $BA  ; Ă
DEF TILE_ACIRC_U     EQU $BB  ; Â
DEF TILE_ECIRC_U     EQU $BC  ; Ê
DEF TILE_OCIRC_U     EQU $BD  ; Ô
DEF TILE_OHORN_U     EQU $BE  ; Ơ
DEF TILE_UHORN_U     EQU $BF  ; Ư

; VRAM tile codes for đ/Đ
DEF TILE_DSTROKE      EQU $DD  ; đ (lowercase)
DEF TILE_DSTROKE_U    EQU $CF  ; Đ (uppercase)
```

## Font PNG Layout Guide (for artist)

The font.png is 128×64 pixels (16 columns × 8 rows of 8×8 tiles).

### Row-by-row guide:

| PNG Row | Tile Range | Content |
|---------|-----------|---------|
| Row 0 | `$80-$8F` | **A B C D E F G H I J K L M N O P** (identical to English Crystal) |
| Row 1 | `$90-$9F` | **Q R S T U V W X Y Z ( ) : ; [ ]** (identical to English Crystal) |
| Row 2 | `$A0-$AF` | **a b c d e f g h i j k l m n o p** (identical to English Crystal) |
| Row 3 | `$B0-$BF` | **q r s t u v w x y z** [Ă] [Â] [Ê] [Ô] [Ơ] [Ư] |
| Row 4 | `$C0-$CF` | Ä Ö Ü ä ö ü [ᴬ¹] [ᴬ²] [ᴬ³] [ᴬ⁴] [ᴬ⁵] [ᴬ⁶] [ᴬ⁷] [ᴬ⁸] [ᴬ⁹] [Đ] |
| Row 5 | `$D0-$DF` | 'd 'l 'm 'r 's 't 'v [ă] [â] [ê] [ô] [ơ] [ư] [đ] (free) ← |
| Row 6 | `$E0-$EF` | ' PK MN - ← ﾞ ? ! . & é → ▷ ▶ ▼ ♂ (identical to English Crystal) |
| Row 7 | `$F0-$FF` | ¥ × . / , ♀ 0 1 2 3 4 5 6 7 8 9 (identical to English Crystal) |

`[brackets]` = new Vietnamese tiles drawn over previously empty slots.

**Rows 0-2** are copied directly from English Crystal `gfx/font/font.png`.

**Row 3** (`$B0-$BF`): First 10 tiles (q-z) from English Crystal. Last 6 tiles (`$BA-$BF`) are new Vietnamese uppercase base variants (Ă Â Ê Ô Ơ Ư) drawn in previously empty slots.

**Row 4** (`$C0-$CF`): First 6 tiles (`$C0-$C5`) are German umlauts from English Crystal (kept as-is). Last 10 tiles (`$C6-$CF`) are new: 9 accent tiles + Đ.

**Row 5** (`$D0-$DF`): First 7 tiles (`$D0-$D6`) are English contractions (kept as-is). Next 7 tiles (`$D7-$DD`) are new Vietnamese: 6 lowercase base variants (ă â ê ô ơ ư) + đ. `$DE` is free. `$DF` = ← (kept from English).

**Rows 6-7** are identical to English Crystal.

### Accent Tile Pixel Design

Each accent tile is 8×8 pixels, divided into two zones:

**Tone mark patterns (bottom zone, pixels 4-7):**

| Tone | Shape | Example pixel pattern |
|------|-------|-----------------------|
| sắc (´) | Rising stroke | `........ / ......x. / .....x.. / ....x...` |
| huyền (\`) | Falling stroke | `........ / ....x... / .....x.. / ......x.` |
| hỏi (̉) | Small hook | `....xx.. / ......x. / .....x.. / ........` |
| ngã (~) | Wave/tilde | `........ / ...x..x. / ..x.xx.. / ........` |

**Nặng dot (top zone, pixels 0-3):**

| Mark | Shape | Example pixel pattern |
|------|-------|-----------------------|
| nặng (̣) | Centered dot | `........ / ....xx.. / ....xx.. / ........` |

## Link Cable Compatibility

### Why This Layout Maximizes Compatibility

| Range | English Crystal | Vietnamese Crystal | Trading Result |
|-------|----------------|-------------------|---------------|
| `$80-$99` | A-Z uppercase | A-Z uppercase | **Perfect match** |
| `$A0-$B9` | a-z lowercase | a-z lowercase | **Perfect match** |
| `$BA-$BF` | (empty) | Ă Â Ê Ô Ơ Ư | Displays as blank in EN (but never in traded names) |
| `$C0-$C5` | German umlauts | German umlauts | **Perfect match** |
| `$C6-$CE` | (empty) | Accent tiles | Displays as blank in EN (never in traded names) |
| `$CF` | (empty) | Đ | Displays as blank in EN (never in traded names) |
| `$D0-$D6` | Contractions | Contractions | **Perfect match** |
| `$D7-$DD` | (empty) | ă â ê ô ơ ư đ | Displays as blank in EN (never in traded names) |
| `$DE-$FF` | ← symbols digits | ← symbols digits | **Perfect match** |

**For the POC charmap** (single-case, both cases map to `$80-$99`):
The current `link_trade_text.asm` translation logic works unchanged — it operates on charmap byte codes, not VRAM tiles.

**For Phase 2** (separate uppercase/lowercase):
`TranslateEnglishToVietnamese` would need updating since English lowercase `$A0-$B9` would match Vietnamese lowercase `$A0-$B9` directly (no translation needed — they're already the same codes).

## Implementation Phases

### Phase 1: POC (this branch)

- New font.png: English Crystal base + Vietnamese tiles in free slots only
- Charmap: keep single-case (`$80-$99` for both A-Z and a-z) — no charmap changes
- Accented chars: stay at `$A0-$DF` charmap codes
- PlaceNextChar: decomposition logic
- Textbox: height 6→7
- TextScroll: accent row handling
- Link cable: unchanged

### Phase 2: Uppercase/Lowercase Split (future)

- Separate charmap codes: `$80-$99` = uppercase only, `$A0-$B9` = lowercase only
- Update all text strings to use correct case
- Update link cable translation (simplified — EN and VN layouts match)
- Update decomposition table to reference lowercase base tiles

### Fallback: Reclaim English Tiles (if more space needed)

If more Vietnamese tiles are needed in the future:
- **6 German umlaut tiles** (`$C0-$C5`): Can be repurposed — no English game text uses them
- **7 contraction tiles** (`$D0-$D6`): Can be repurposed — Vietnamese text doesn't use English contractions
- This would free up to **13 additional tiles** (total 14 free including `$DE`)
