# Pokemon Crystal Vietnamese Localization - Translation Guidelines

This document contains key decisions and guidelines for AI agents working on the Vietnamese localization of Pokemon Crystal.

## Language Decisions

### Terms Kept in English (UPPERCASE)

The following categories are intentionally kept in English to maintain consistency with the international Pokemon community and avoid confusion:

#### 1. Move Names (251 total)
All move names have been translated to Vietnamese (see Translated Moves section below).

**Moves kept in English:**
None - all 251 moves have been translated to Vietnamese.

**Translated Moves:**

To translate move names, edit the file `data/moves/names.asm`. Move names have a **12-character limit**.

**Generation I Moves (165 translated):**

| English | Vietnamese |
|---------|------------|
| POUND | ĐẬP |
| KARATE CHOP | CHẶT KARATE |
| DOUBLESLAP | TÁT ĐÔI |
| COMET PUNCH | ĐẤM SAO |
| MEGA PUNCH | MEGA ĐẤM |
| PAY DAY | VUNG TIỀN |
| FIRE PUNCH | ĐẤM LỬA |
| ICE PUNCH | ĐẤM BĂNG |
| THUNDERPUNCH | ĐẤM SẤM |
| SCRATCH | CÀO |
| VICEGRIP | KẸP |
| GUILLOTINE | CHÉM |
| RAZOR WIND | LỐC DAO |
| SWORDS DANCE | MÚA KIẾM |
| CUT | CẮT |
| GUST | LỐC |
| WING ATTACK | ĐÁNH CÁNH |
| WHIRLWIND | LỐC XOÁY |
| FLY | BAY |
| BIND | SIẾT |
| SLAM | ĐÁNH |
| VINE WHIP | ROI DÂY |
| STOMP | GIẪM |
| DOUBLE KICK | ĐÁ ĐÔI |
| MEGA KICK | MEGA ĐÁ |
| JUMP KICK | ĐÁ NHẢY |
| ROLLING KICK | ĐÁ LĂN |
| SAND-ATTACK | TUNG CÁT |
| HEADBUTT | ĐỤC ĐẦU |
| HORN ATTACK | HÚC SỪNG |
| FURY ATTACK | LIÊN ĐÒN |
| HORN DRILL | KHOAN SỪNG |
| TACKLE | ĐÁNH CHẶN |
| BODY SLAM | THỊT ĐÈ |
| WRAP | QUẤN |
| TAKE DOWN | HÚYCH |
| THRASH | LOẠN ĐÁNH |
| DOUBLE-EDGE | ĐỘ MẠO HIỂM |
| TAIL WHIP | QUẤT ĐUÔI |
| POISON STING | CHÂM ĐỘC |
| TWINEEDLE | KIM ĐÔI |
| PIN MISSILE | TÊN LỬA |
| LEER | LIẾC |
| BITE | CẮN |
| GROWL | GẦM GỪ |
| ROAR | GẦM |
| SING | HÁT |
| SUPERSONIC | SIÊU ÂM |
| SONICBOOM | BÙM ÂM |
| DISABLE | VÔ HIỆU |
| ACID | A-XÍT |
| EMBER | THAN HỒNG |
| FLAMETHROWER | PHUN LỬA |
| MIST | SƯƠNG MÙ |
| WATER GUN | SÚNG NƯỚC |
| HYDRO PUMP | BƠM NƯỚC |
| SURF | LƯỚT SÓNG |
| ICE BEAM | TIA BĂNG |
| BLIZZARD | BÃO BĂNG |
| PSYBEAM | TIA TÂM LINH |
| BUBBLEBEAM | TIA BỌT BONG |
| AURORA BEAM | TIA CỰC QG |
| HYPER BEAM | TIA HỦY DIỆT |
| PECK | MỔ |
| DRILL PECK | KHOAN MỔ |
| SUBMISSION | QUỲ GỐI |
| LOW KICK | QUÉT CHÂN |
| COUNTER | PHẢN ĐÒN |
| SEISMIC TOSS | NÉM ĐẤT |
| STRENGTH | SỨC MẠNH |
| ABSORB | HÚT |
| MEGA DRAIN | MEGA HÚT |
| LEECH SEED | KÝ SINH |
| LEECH LIFE | HÚT HP |
| GROWTH | TĂNG TRƯỞNG |
| RAZOR LEAF | LÁ DAO |
| SOLARBEAM | TIA M.TRỜI |
| POISONPOWDER | BỘT ĐỘC |
| STUN SPORE | BÀO TỬ TÊ |
| SLEEP POWDER | BỘT NGỦ |
| PETAL DANCE | ĐIỆU CÁN HOA |
| STRING SHOT | TƠ NHỆN |
| DRAGON RAGE | GIẬN RỒNG |
| FIRE SPIN | LỐC LỬA |
| THUNDERSHOCK | GIẬT ĐIỆN |
| THUNDERBOLT | SÉT ĐÁNH |
| THUNDER WAVE | SÓNG ĐIỆN |
| THUNDER | SẤM SÉT |
| ROCK THROW | NÉM ĐÁ |
| EARTHQUAKE | ĐỘNG ĐẤT |
| FISSURE | NỨT ĐẤT |
| DIG | ĐÀO |
| TOXIC | CỰC ĐỘC |
| CONFUSION | LẪN LỘN |
| PSYCHIC | NIỆM LỰC |
| HYPNOSIS | THÔI MIÊN |
| MEDITATE | THIỀN ĐỊNH |
| AGILITY | NHANH NHẸN |
| QUICK ATTACK | CÔNG TỐC |
| RAGE | NỔI GIẬN |
| TELEPORT | DI CHUYỂN |
| NIGHT SHADE | BÓng ĐÊM |
| MIMIC | BẮT CHƯỚC |
| SCREECH | GÀO TIẾNG |
| DOUBLE TEAM | NHÂN ĐÔI |
| RECOVER | HỒI PHỤC |
| HARDEN | CỨNG RẮN |
| MINIMIZE | THU NHỎ |
| SMOKESCREEN | MÀN KHÓI |
| CONFUSE RAY | TIA MỊ HOẶC |
| WITHDRAW | RÚT VỎ |
| DEFENSE CURL | CUỘN THỦ |
| BARRIER | TƯỜNG CHẮN |
| LIGHT SCREEN | MÀN SÁNG TƯƠI |
| HAZE | SƯƠNG KHÓI |
| REFLECT | PHẢN CHIẾU |
| FOCUS ENERGY | TẬP TRUNG |
| BIDE | CHỊU ĐỰNG |
| METRONOME | ĐIỆU NGŨ |
| MIRROR MOVE | SAO CHÉP |
| SELFDESTRUCT | TỰ NỔ |
| EGG BOMB | BOM TRỨNG |
| LICK | LIẾM |
| SMOG | KHÓI ĐỘC |
| SLUDGE | BÙN ĐỘC |
| BONE CLUB | GẬY XƯƠNG |
| FIRE BLAST | ĐẠI HỎA LỰC |
| WATERFALL | THÁC NƯỚC |
| CLAMP | KẸP CÀNG |
| SWIFT | SAO BAY |
| SKULL BASH | PHÁ SỌ |
| SPIKE CANNON | PHÁO GAI |
| CONSTRICT | BÓP |
| AMNESIA | QUÊN ĐI QUÁ |
| KINESIS | ĐỘNG LỰC |
| SOFTBOILED | ĐẺ TRỨNG |
| HI JUMP KICK | ĐÁ CAO |
| GLARE | NHÌN ĐE |
| DREAM EATER | ĂN MỘNG |
| POISON GAS | KHÍ ĐỘC |
| BARRAGE | PHỦ ĐẦU |
| LOVELY KISS | HÔN YÊU |
| SKY ATTACK | THẦN ĐIỂU |
| TRANSFORM | BIẾN HÌNH |
| BUBBLE | BỌT NƯỚC |
| DIZZY PUNCH | ĐẤM CHÓNG |
| SPORE | BÀO TỬ |
| FLASH | ÁNH CHỚP |
| PSYWAVE | SÓNG TÂM |
| SPLASH | VẪY VÙNG |
| ACID ARMOR | GIÁP A-XÍT |
| CRABHAMMER | BÚA CUA |
| EXPLOSION | PHÁT NỔ |
| FURY SWIPES | CÀO LOẠN |
| BONEMERANG | XƯƠNG ĐÔI |
| REST | NGHỈ NGƠI |
| ROCK SLIDE | LỞ ĐÁ |
| HYPER FANG | NANH SIÊU |
| SHARPEN | MÀI SẮC |
| CONVERSION | ĐỔI LOẠI |
| TRI ATTACK | CÔNG TAM |
| SUPER FANG | SUPER NANH |
| SLASH | CHÉM |
| SUBSTITUTE | THẾ THÂN |
| STRUGGLE | VẬT LỘN |

**Generation II Moves (86 translated):**

| English | Vietnamese |
|---------|------------|
| SKETCH | PHÁC THẢO |
| TRIPLE KICK | ĐÁ TAM |
| THIEF | TRỘM |
| SPIDER WEB | MẠNG NHỆN |
| MIND READER | ĐỌC TÂM |
| NIGHTMARE | ÁC MỘNG |
| FLAME WHEEL | BÁNH LỬA |
| SNORE | NGÁY |
| CURSE | LỜI NGUYỀN |
| FLAIL | VÙNG VẪY |
| CONVERSION2 | ĐỔI LOẠI 2 |
| AEROBLAST | KHÍ PHÁCH |
| COTTON SPORE | BÀO TỬ BON |
| REVERSAL | PHẢN CÔNG |
| SPITE | OÁN HẬN |
| POWDER SNOW | BỘT TUYẾT |
| PROTECT | BẢO VỆ |
| MACH PUNCH | ĐẤM MACH |
| SCARY FACE | MẶT ĐE DỌA |
| FAINT ATTACK | TẤN CÔNG LÉN |
| SWEET KISS | HÔN NGỌT |
| BELLY DRUM | TRỐNG BỤNG |
| SLUDGE BOMB | BOM BÙN ĐỘC |
| MUD-SLAP | VẢY BÙN |
| OCTAZOOKA | ĐẠI BÁC MỰC |
| SPIKES | RẮC ĐINH |
| ZAP CANNON | PHÁO ĐIỆN |
| FORESIGHT | THẤU THỊ |
| DESTINY BOND | ĐỒNG SINH |
| PERISH SONG | CA DIỆT VONG |
| ICY WIND | GIÓ LẠNH |
| DETECT | PHÁT HIỆN |
| BONE RUSH | XƯƠNG LIÊN |
| LOCK-ON | KHÓA ĐÍA |
| OUTRAGE | NỔI ĐIÊN |
| SANDSTORM | BÃO CÁT |
| GIGA DRAIN | SIÊU HÚT |
| ENDURE | BỀN BỈ |
| CHARM | QUỶ ẤN |
| ROLLOUT | CUỐN LĂN |
| FALSE SWIPE | CHÉM GIẢ |
| SWAGGER | KHOE KHOANG |
| MILK DRINK | UỐNG SỮA |
| SPARK | TIA LỬA |
| FURY CUTTER | CHÉM LIÊN |
| STEEL WING | CÁNH THÉP |
| MEAN LOOK | NHÌN ÁC |
| ATTRACT | MÊ HOẶC |
| SLEEP TALK | MỘNG NGÔN |
| HEAL BELL | CHUÔNG CHỮA |
| RETURN | TRẢ ƠN |
| PRESENT | QUÀ TẶNG |
| FRUSTRATION | THẤT VỌNG |
| SAFEGUARD | BẢO HỘ |
| PAIN SPLIT | CHIA ĐAU |
| SACRED FIRE | LỬA THÁNH |
| MAGNITUDE | CHẤN ĐỘ |
| DYNAMICPUNCH | ĐẤM NĂNG |
| MEGAHORN | SỪNG KHỔNG |
| DRAGONBREATH | HƠI RỒNG |
| BATON PASS | TIẾP SỨC |
| ENCORE | HÒA CA |
| PURSUIT | ĐUỔI THEO |
| RAPID SPIN | XOAY NHANH |
| SWEET SCENT | HƯƠNG NGỌT |
| IRON TAIL | ĐUÔI SẮT |
| METAL CLAW | MÓNG SẮT |
| VITAL THROW | NÉM CHIÊU |
| MORNING SUN | BÌNH MINH |
| SYNTHESIS | TỔNG HỢP |
| MOONLIGHT | ÁNH TRĂNG |
| HIDDEN POWER | SỨC ẨN |
| CROSS CHOP | CHẶT CHÉO |
| TWISTER | LỐC XOÁY |
| RAIN DANCE | CẦU MƯA |
| SUNNY DAY | NGÀY NẮNG |
| CRUNCH | CẮN VỠ |
| MIRROR COAT | ÁO GƯƠNG |
| PSYCH UP | TÂM LÝ LÊN |
| EXTREMESPEED | CỰC TỐC |
| ANCIENTPOWER | SỨC CỔ ĐẠI |
| SHADOW BALL | BÓNG MA |
| FUTURE SIGHT | TIÊN TRI |
| ROCK SMASH | ĐẬP VỠ ĐÁ |
| WHIRLPOOL | XOÁY NƯỚC |
| BEAT UP | ĐÁNH HỘI |

#### 2. Item Names

**Poké Balls (translated):**

| English | Vietnamese | Meaning |
|---------|------------|---------|
| # BALL | BÓNG # | Ball (with Poké Ball icon) |
| MASTER BALL | BÓNG MASTER | Master Ball |
| ULTRA BALL | BÓNG ULTRA | Ultra Ball |
| GREAT BALL | BÓNG SUPER | Super Ball |
| HEAVY BALL | BÓNG NẶNG | Heavy Ball |
| LEVEL BALL | BÓNG CẤP BẬC | Level Ball |
| LURE BALL | BÓNG MỒI CÂU | Lure Ball |
| FAST BALL | BÓNG NHANH | Fast Ball |
| LIGHT BALL | BÓNG ĐIỆN | Light Ball (Electric) |
| FRIEND BALL | BÓNG BẠN BÈ | Friend Ball |
| MOON BALL | BÓNG M.TRĂNG | Moon Ball |
| LOVE BALL | BÓNG ÁI TÌNH | Love Ball |
| PARK BALL | BÓNG C.VIÊN | Park Ball |

**Medicine:**

| English | Vietnamese | Meaning |
|---------|------------|---------|
| SODA POP | SÔ-ĐA POP | Soda Pop |

**Berries:**

| English | Vietnamese | Meaning |
|---------|------------|---------|
| BERRY | QUẢ | Berry/Fruit |
| GOLD BERRY | QUẢ VÀNG | Gold Berry |
| PSNCUREBERRY | QUẢ TRỊ ĐỘC | Poison Cure Berry |
| PRZCUREBERRY | QUẢ TRỊ LIỆT | Paralysis Cure Berry |
| BURNT BERRY | QUẢ CHÁY | Burnt Berry |
| ICE BERRY | QUẢ BĂNG | Ice Berry |
| BITTER BERRY | QUẢ ĐẮNG | Bitter Berry |
| MINT BERRY | QUẢ BẠC HÀ | Mint Berry |
| MIRACLEBERRY | THÁNH QUẢ | Holy/Sacred Berry |
| MYSTERYBERRY | QUẢ BÍ MẬT | Mystery Berry |

**Battle Items:**
DIRE HIT, GUARD SPEC.

**Vitamins:**

| English | Vietnamese | Meaning |
|---------|------------|---------|
| PROTEIN | ĐẠM | Protein |
| IRON | SẮT | Iron |
| CARBOS | TINH BỘT | Carbohydrate |
| CALCIUM | CANXI | Calcium |
| PP UP | NÂNG PP | PP Up |

**Evolution Items:**

| English | Vietnamese | Meaning |
|---------|------------|---------|
| MOON STONE | ĐÁ TRĂNG | Moon Stone |
| FIRE STONE | ĐÁ LỬA | Fire Stone |
| THUNDERSTONE | ĐÁ SẤM | Thunder Stone |
| WATER STONE | ĐÁ NƯỚC | Water Stone |
| LEAF STONE | ĐÁ LÁ | Leaf Stone |
| SUN STONE | ĐÁ M.TRỜI | Sun Stone (Mặt Trời) |
| DRAGON SCALE | VẢY RỒNG | Dragon Scale |
| METAL COAT | ÁO SẮT | Metal Coat |
| KING'S ROCK | HOÀNG ẤN | King's Rock (Royal Seal) |
| EVERSTONE | VÔ ĐỊNH ĐÁ | Everstone (Unchanging Stone) |

**Evolution Items kept in English:**
UP-GRADE

**Hold Items:**

| English | Vietnamese | Meaning |
|---------|------------|---------|
| BRIGHTPOWDER | BỘT SÁNG | Bright Powder |
| QUICK CLAW | MÓNG NHANH | Quick Claw |
| SOFT SAND | CÁT MỀM | Soft Sand |
| SHARP BEAK | MỎ SẮC | Sharp Beak |
| POISON BARB | NGẠNH ĐỘC | Poison Barb |
| SILVERPOWDER | BỘT BẠC | Silver Powder |
| AMULET COIN | ẤN BẢO | Amulet Coin |
| MYSTIC WATER | NƯỚC THẦN | Mystic Water |
| TWISTEDSPOON | THÌA XOẮN | Twisted Spoon |
| BLACKBELT | ĐAI ĐEN | Black Belt |
| BLACKGLASSES | KÍNH ĐEN | Black Glasses |
| PINK BOW | CUNG HỒNG | Pink Bow |
| STICK | QUE | Stick |
| SMOKE BALL | BÓNG KHÓI | Smoke Ball |
| NEVERMELTICE | ĐÁ-0-TAN | Never-Melt Ice |
| MAGNET | NAM CHÂM | Magnet |
| MIRACLE SEED | HẠT THẦN | Miracle Seed |
| THICK CLUB | XƯƠNG DÀY | Thick Club |
| FOCUS BAND | ĐAI CỔ VŨ | Focus Band |
| HARD STONE | ĐÁ CỨNG | Hard Stone |
| LUCKY EGG | TRỨNG MAY | Lucky Egg |
| CHARCOAL | THAN ĐÁ | Charcoal |
| SCOPE LENS | THẤU KÍNH | Scope Lens |
| DRAGON FANG | NANH RỒNG | Dragon Fang |
| LEFTOVERS | CƠM THỪA | Leftovers |
| BERSERK GENE | GEN DẠI | Berserk Gene |
| METAL POWDER | BỘT SẮT | Metal Powder |
| LUCKY PUNCH | G.TAY MAY | Lucky Punch (Găng Tay May) |

**Hold Items kept in English:**
CLEANSE TAG, POLKADOT BOW

**Key Items:**
GS BALL

**Apricorns:**

| English | Vietnamese | Meaning |
|---------|------------|---------|
| RED APRICORN | MƠ ĐỎ | Red Apricorn |
| BLU APRICORN | MƠ XANH BIỂN | Blue Apricorn |
| YLW APRICORN | MƠ VÀNG | Yellow Apricorn |
| GRN APRICORN | MƠ XANH LÁ | Green Apricorn |
| WHT APRICORN | MƠ TRẮNG | White Apricorn |
| BLK APRICORN | MƠ ĐEN | Black Apricorn |
| PNK APRICORN | MƠ HỒNG | Pink Apricorn |

**Miscellaneous:**
# DOLL, ETHER, MAX ETHER, ELIXER, SPELL TAG

**TMs and HMs:**
TM01-TM50, HM01-HM07

#### 3. Status Conditions
Status effect names are translated to Vietnamese in move descriptions and dialogue:

| English | Vietnamese | Meaning |
|---------|------------|---------|
| POISON | ĐỘC | Poison |
| PARALYSIS | TÊ LIỆT | Paralysis |
| BURN | BỎNG | Burn |
| FREEZE | ĐÔNG | Freeze |
| CONFUSION | LẪN LỘN | Confusion |

**Note:** Status conditions in system code/constants remain in English for technical purposes. Only user-facing text (move descriptions, battle messages, etc.) uses Vietnamese terms.

These translations align with Vietnamese item names:
- ĐỘC: GIẢI ĐỘC (Antidote), QUẢ TRỊ ĐỘC (PSNCureBerry)
- TÊ LIỆT: TRỊ TÊ LIỆT (Parlyz Heal), QUẢ TRỊ LIỆT (PRZCureBerry)
- BỎNG: TRỊ BỎNG (Burn Heal)
- ĐÔNG: TRỊ ĐÔNG (Ice Heal)
- LẪN LỘN: from battle text "lẫn lộn" (confused)

**SLEEP** is translated contextually:
- In move descriptions: "ngủ" (e.g., "Có thể làm đ.thủ ngủ" = "May make opponent sleep")
- Item name: ĐÁNH THỨC (Awakening)

#### 4. Stats
Stat names are translated to Vietnamese:

| English | Vietnamese | Meaning |
|---------|------------|---------|
| ATTACK | CÔNG | Attack/Offense |
| DEFENSE | THỦ | Defense |
| SPCL.ATK | CÔNG Đ.B | Special Attack (Đặc Biệt) |
| SPCL.DEF | THỦ Đ.B | Special Defense (Đặc Biệt) |
| SPEED | TỐC ĐỘ | Speed |
| ACCURACY | ĐÍCH XÁC | Accuracy |
| EVASION | NÉ TRÁNH | Evasion |
| SPECIAL | ĐẶC BIỆT | Special |
| HEALTH | HP | Health Points |

Note: HP and PP remain in English as they are universal gaming terms.

#### Pokemon Physical Attributes (Weight & Height)

Pokemon weight and height statistics have been **converted from imperial to SI metric units** for the Vietnamese localization:

| Attribute | Original (English) | Vietnamese Version |
|-----------|-------------------|-------------------|
| **Height** | Feet and inches (e.g., 5'11") | Meters (e.g., 1.8m) |
| **Weight** | Pounds (e.g., 150 lbs) | Kilograms (e.g., 68kg) |

**Examples:**
- Pikachu: 1'04" / 13 lbs → 0.4m / 6kg
- Charizard: 5'07" / 200 lbs → 1.7m / 91kg
- Snorlax: 6'11" / 1014 lbs → 2.1m / 460kg

**Implementation:**
- Height and weight conversions are handled in the Pokedex data files
- Display format uses Vietnamese-friendly metric units (m, kg)
- Conversions maintain reasonable precision (rounded to 1 decimal place for height, whole numbers for weight)

This change makes the game more accessible to Vietnamese players who use the metric system in daily life.

#### 5. Pokemon Names
All Pokemon species names remain in English:
- PIKACHU, RATTATA, BELLSPROUT, PIDGEY, TOGEPI, etc.
- Pokemon nicknames can be Vietnamese (e.g., STRAWBERRY → DÂU)
- **Exception**: EGG (the placeholder name for unhatched Pokemon) is translated to TRỨNG

#### 6. Special Terms
- Badge names (compound): ZEPHYRBADGE, HIVEBADGE, etc. (kept in English as item names)
- Game-specific terms: GYM (kept as GYM), RADIO (kept as RADIO)

#### 7. Game Terms (Translated to Vietnamese)

| English | Vietnamese | Notes |
|---------|------------|-------|
| BADGE (standalone) | HUY HIỆU | When referring to badges generically |
| LEAGUE | LIÊN ĐOÀN | Pokemon League |
| ELITE FOUR | TỨ ĐẠI | The Four Great Ones |
| CHAMPION | VÔ ĐỊCH | The Champion title |
| SAFARI ZONE | KHU SAFARI | Safari Zone |
| GAME CORNER | GÓC GIẢI TRÍ | Entertainment Corner |
| MAIL (standalone) | THƯ | When referring to mail generically |

**Note:** Compound badge names (THUNDERBADGE, MARSHBADGE, etc.) and specific mail item names (THƯ BIỂN, THƯ YÊU QUÝ, etc.) remain as item names - see Item Names section.

### Terms Translated to Vietnamese

#### 1. Team/Organization Names
| English | Vietnamese |
|---------|------------|
| TEAM ROCKET | ĐỘI ROCKET |
| GYM LEADER | T.LĨNH GYM |

#### 2. Trainer Class Names

All 68 trainer classes with Vietnamese translations (file: `data/trainers/class_names.asm`):

| # | English | Vietnamese | Notes |
|---|---------|------------|-------|
| 01 | FALKNER (Gym Leader) | THỦ LĨNH | Gym Leader Falkner |
| 02 | WHITNEY (Gym Leader) | THỦ LĨNH | Gym Leader Whitney |
| 03 | BUGSY (Gym Leader) | THỦ LĨNH | Gym Leader Bugsy |
| 04 | MORTY (Gym Leader) | THỦ LĨNH | Gym Leader Morty |
| 05 | PRYCE (Gym Leader) | THỦ LĨNH | Gym Leader Pryce |
| 06 | JASMINE (Gym Leader) | THỦ LĨNH | Gym Leader Jasmine |
| 07 | CHUCK (Gym Leader) | THỦ LĨNH | Gym Leader Chuck |
| 08 | CLAIR (Gym Leader) | THỦ LĨNH | Gym Leader Clair |
| 09 | RIVAL1 | ĐỐI THỦ | Rival (early game) |
| 10 | POKEMON PROF | GS.#MON | Professor |
| 11 | WILL (Elite Four) | TỨ ĐẠI | Elite Four Will |
| 12 | CAL (Elite Four) | HLV | Elite Four Cal (unused) |
| 13 | BRUNO (Elite Four) | TỨ ĐẠI | Elite Four Bruno |
| 14 | KAREN (Elite Four) | TỨ ĐẠI | Elite Four Karen |
| 15 | KOGA (Elite Four) | TỨ ĐẠI | Elite Four Koga |
| 16 | CHAMPION | VÔ ĐỊCH | Champion Lance |
| 17 | BROCK (Gym Leader) | THỦ LĨNH | Gym Leader Brock |
| 18 | MISTY (Gym Leader) | THỦ LĨNH | Gym Leader Misty |
| 19 | LT.SURGE (Gym Leader) | THỦ LĨNH | Gym Leader Lt. Surge |
| 20 | SCIENTIST | NHÀ KHOA HỌC | Scientist |
| 21 | ERIKA (Gym Leader) | THỦ LĨNH | Gym Leader Erika |
| 22 | YOUNGSTER | THIẾU NIÊN | Youngster (teenage boy) |
| 23 | SCHOOLBOY | HỌC SINH | Schoolboy |
| 24 | BIRD KEEPER | CHIM THỦ | Bird Keeper |
| 25 | LASS | THIẾU NỮ | Lass (teenage girl) |
| 26 | JANINE (Gym Leader) | THỦ LĨNH | Gym Leader Janine |
| 27 | COOLTRAINER♂ | CAO THỦ | Cooltrainer (male) |
| 28 | COOLTRAINER♀ | CAO THỦ | Cooltrainer (female) |
| 29 | BEAUTY | MỸ NHÂN | Beauty |
| 30 | POKEMANIAC | FAN #MON | Pokemaniac |
| 31 | ROCKET♂ | ROCKET | Team Rocket Grunt (male) |
| 32 | GENTLEMAN | QUÝ ÔNG | Gentleman |
| 33 | SKIER | VĐV TRƯỢT | Skier (athlete) |
| 34 | TEACHER | GIÁO VIÊN | Teacher |
| 35 | SABRINA (Gym Leader) | THỦ LĨNH | Gym Leader Sabrina |
| 36 | BUG CATCHER | BẮT SÂU | Bug Catcher |
| 37 | FISHER | CÂU CÁ | Fisher |
| 38 | SWIMMER♂ | BƠI LỘI♂ | Swimmer (male) |
| 39 | SWIMMER♀ | BƠI LỘI♀ | Swimmer (female) |
| 40 | SAILOR | THỦY THỦ | Sailor |
| 41 | SUPER NERD | MỌT SÁCH | Super Nerd (bookworm) |
| 42 | RIVAL2 | ĐỐI THỦ | Rival (late game) |
| 43 | GUITARIST | TAY ĐÀN | Guitarist |
| 44 | HIKER | LEO NÚI | Hiker (mountain climber) |
| 45 | BIKER | TAY ĐUA | Biker (racer) |
| 46 | BLAINE (Gym Leader) | THỦ LĨNH | Gym Leader Blaine |
| 47 | BURGLAR | ĐẠO CHÍCH | Burglar (thief) |
| 48 | FIREBREATHER | PHUN LỬA | Firebreather |
| 49 | JUGGLER | TẠP KỸ | Juggler (circus performer) |
| 50 | BLACKBELT | VÕ SĨ | Blackbelt (martial artist) |
| 51 | ROCKET EXECUTIVE♂ | ROCKET | Team Rocket Executive (male) |
| 52 | PSYCHIC | THẦN GIAO | Psychic |
| 53 | PICNICKER | DÃ NGOẠI | Picnicker |
| 54 | CAMPER | CẮM TRẠI | Camper |
| 55 | ROCKET EXECUTIVE♀ | ROCKET | Team Rocket Executive (female) |
| 56 | SAGE | HIỀN GIẢ | Sage (wise person) |
| 57 | MEDIUM | ĐỒNG CỐT | Medium (spiritual medium) |
| 58 | BOARDER | TRƯỢT VÁN | Boarder (snowboarder) |
| 59 | POKEFAN♂ | FAN #MON | Pokefan (male) |
| 60 | KIMONO GIRL | KIMONO | Kimono Girl |
| 61 | TWINS | SONG SINH | Twins |
| 62 | POKEFAN♀ | FAN #MON | Pokefan (female) |
| 63 | RED | HLV | Red (Trainer) |
| 64 | BLUE (Gym Leader) | THỦ LĨNH | Gym Leader Blue |
| 65 | OFFICER | CẢNH SÁT | Officer (police) |
| 66 | ROCKET♀ | ROCKET | Team Rocket Grunt (female) |
| 67 | MYSTICALMAN | BÍ ẨN | Mysticalman (mysterious) |

**Translation Notes:**
- **THỦ LĨNH** (Leader): Used for all 16 Gym Leaders
- **TỨ ĐẠI** (Elite Four): Used for Elite Four members
- **ĐỐI THỦ** (Rival): Used for the player's rival (both early and late game)
- **HLV** (Huấn Luyện Viên - Trainer): Used for generic trainers (Cal, Red)
- **ROCKET**: Team Rocket members keep English name for brand recognition
- **FAN #MON**: Pokemaniac and Pokefan classes (# expands to POKé icon)
- **CAO THỦ** (Master/Expert): Gender-neutral term for Cooltrainer
- **VĐV TRƯỢT** (Vận Động Viên Trượt - Skiing Athlete): Full form of "Skier"

**Character Limits:**
- Maximum length: 13 characters (14 bytes including null terminator)
- Defined by `TRAINER_CLASS_NAME_LENGTH` constant

#### 3. Item Names (Translated)
| English | Vietnamese |
|---------|------------|
| POTION | LỌ THUỐC |
| SUPER POTION | THUỐC SUPER |
| HYPER POTION | THUỐC HYPER |
| MAX POTION | THUỐC MAX |
| ANTIDOTE | GIẢI ĐỘC |
| BICYCLE | XE ĐẠP |
| BURN HEAL | TRỊ BỎNG |
| ICE HEAL | TRỊ ĐÔNG |
| AWAKENING | ĐÁNH THỨC |
| PARLYZ HEAL | TRỊ TÊ LIỆT |
| FULL RESTORE | H.PHỤC TOÀN |
| ESCAPE ROPE | DÂY THOÁT |
| REPEL | XUA ĐI |
| SUPER REPEL | SIÊU XUA ĐI |
| MAX REPEL | MAX XUA ĐUỔI |
| MAX ELIXER | T.NĂNG MAX |
| HP UP | TĂNG HP |
| RARE CANDY | KẸO HIẾM |
| X ACCURACY | X ĐÍCH XÁC |
| NUGGET | CỤC VÀNG |
| FULL HEAL | TRỊ TOÀN BỘ |
| REVIVE | HỒI SINH |
| MAX REVIVE | H.SINH MAX |
| FRESH WATER | NƯỚC SẠCH |
| LEMONADE | CHANH MUỐI |
| X ATTACK | X CÔNG |
| X DEFEND | X THỦ |
| X SPEED | X TỐC ĐỘ |
| X SPECIAL | X ĐẶC BIỆT |
| COIN CASE | HỘP XU |
| ITEMFINDER | MÁY TÌM ĐỒ |
| EXP.SHARE | CHIA SẺ KN |
| OLD ROD | CẦN CÂU CŨ |
| GOOD ROD | CẦN CÂU TỐT |
| SILVER LEAF | LÁ BẠC |
| SUPER ROD | SIÊU CẦN CẦU |
| RED SCALE | VẢY ĐỎ |
| SECRETPOTION | THUỐC BÍ MẬT |
| S.S.TICKET | VÉ S.S. |
| MYSTERY EGG | TRỨNG BÍ ẨN |
| CLEAR BELL | CHUÔNG PHALÊ |
| SILVER WING | CÁNH BẠC |
| MOOMOO MILK | SỮA MOOMOO |
| GOLD LEAF | LÁ VÀNG |
| TINYMUSHROOM | NẤM NHỎ |
| BIG MUSHROOM | NẤM LỚN |
| SLOWPOKETAIL | ĐUÔI SLOPOKE |
| PEARL | NGỌC TRAI |
| BIG PEARL | NG.TRAI TO |
| RAGECANDYBAR | KẸO GIÂN DỮ |
| BLUE CARD | THẺ XANH |
| ENERGYPOWDER | BỘT N.LƯỢNG |
| ENERGY ROOT | RỄ N.LƯỢNG |
| HEAL POWDER | BỘT CHỮA |
| REVIVAL HERB | LÁ HỒI SINH |
| CARD KEY | THẺ KHÓA |
| MACHINE PART | BỘ PHẬN MÁY |
| EGG TICKET | VÉ TRỨNG |
| LOST ITEM | ĐỒ BỊ MẤT |
| STARDUST | BỤI SAO |
| STAR PIECE | MẢNH SAO |
| BASEMENT KEY | KHÓA LẦU HẦM |
| PASS | THẺ ĐI |
| BERRY JUICE | NƯỚC QUẢ |
| SACRED ASH | TRO THIÊNG |
| NORMAL BOX | HỘP THƯỜNG |
| GORGEOUS BOX | HỘP ĐẸP |
| SQUIRTBOTTLE | BÌNH XỊT |
| RAINBOW WING | LÔNG VŨ 7MÀU |
| BRICK PIECE | MẢNH GẠCH |

**Mail:**

| English | Vietnamese | Meaning |
|---------|------------|---------|
| FLOWER MAIL | THƯ HOA | Flower Mail |
| SURF MAIL | THƯ BIỂN | Surf/Sea Mail |
| LITEBLUEMAIL | THƯ XANH NHẸ | Light Blue Mail |
| PORTRAITMAIL | THƯ TỰ HOẠ | Portrait Mail |
| LOVELY MAIL | THƯ YÊU QUÝ | Lovely Mail |
| EON MAIL | THƯ EON | Eon Mail |
| MORPH MAIL | THƯ THAY ĐỔI | Morph/Change Mail |
| BLUESKY MAIL | THƯ BẦU TRỜI | Blue Sky Mail |
| MUSIC MAIL | THƯ ÂM NHẠC | Music Mail |
| MIRAGE MAIL | THƯ ẢO ẢNH | Mirage Mail |

**Mail Composition Input:**

The mail composition character input screen (`data/text/mail_input_chars.asm`) uses **English-only characters** to ensure 100% compatibility with English Pokemon Crystal when trading mail items via link cable.

**Rationale:**
- Mail items can be attached to Pokemon and traded via link cable
- If mail contains Vietnamese characters, it would display as garbage in English Pokemon Crystal
- By restricting mail input to English characters only, mail messages remain readable when traded between Vietnamese and English versions
- This is a trade-off to maximize link cable trading compatibility

**Implementation:**
- File: `data/text/mail_input_chars.asm`
- Layout: 2 pages (uppercase A-Z, numbers, and punctuation)
- Page 1: A-Z uppercase letters
- Page 2: Numbers (0-9) and punctuation marks
- Button labels: "tiếp" (next), "xoá" (delete), "xong" (done) - in Vietnamese for UI consistency

**Note:** Pokemon and trainer name input (`data/text/name_input_chars.asm`) still supports full Vietnamese characters since those are handled by the translation layer during link cable trading.

## Naming Screen Character Sets

The naming screen uses different character sets depending on what is being named:

### Character Input Pages (data/text/name_input_chars.asm)

| Naming Type | Character Set | Pages | Reason |
|-------------|---------------|-------|--------|
| Player name | Vietnamese (NameInputPage1-5) | 5 | Player names can use full Vietnamese with diacritics |
| Rival name | Vietnamese (NameInputPage1-5) | 5 | Rival names can use full Vietnamese with diacritics |
| Mom's name | Vietnamese (NameInputPage1-5) | 5 | Mom's name can use full Vietnamese with diacritics |
| Friend name | Vietnamese (NameInputPage1-5) | 5 | Friend names can use full Vietnamese with diacritics |
| Pokemon nickname | English (MonNameInput1-2) | 2 | Backward compatibility with link trading |
| PC Box name | English (BoxNameInput1-2) | 2 | Backward compatibility with link trading |

### Why Pokemon Nicknames and PC Box Names Use English Only

**Backward Compatibility:** Pokemon nicknames and PC Box names are stored in save data and transmitted during link cable trading. Using Vietnamese characters would cause:

1. **Display issues in English games:** Vietnamese accented characters would display as garbage/wrong characters when a Pokemon is traded to an English Pokemon Crystal
2. **Save compatibility:** Pokemon traded from English games would display correctly, but Vietnamese-named Pokemon traded back might cause issues

**Trade-off Decision:** By restricting Pokemon nicknames and PC Box names to English characters (A-Z, a-z, 0-9, basic punctuation), these names remain readable and compatible when:
- Trading with English Pokemon Crystal via link cable
- Trading with Pokemon Stadium 2
- Transferring save data between versions

**Player/Rival/Mom/Friend Names:** These names are translated via the link cable translation layer (see "Link Cable Trading Translation Layer" section), so they can safely use Vietnamese characters. The translation layer converts Vietnamese accented characters to base English letters when sending data over link cable.

### Default Player Names

When the player doesn't enter a name (leaves it blank), the game uses default names:
- Male player: **Trung**
- Female player: **Trang**

These defaults are defined in `engine/menus/intro_menu.asm`.

#### 3. Location Names
Location names are translated with Vietnamese prefixes. Below is the complete list from `data/maps/landmarks.asm`.

**Translation Patterns:**
| English Pattern | Vietnamese Pattern |
|-----------------|-------------------|
| <NAME> CITY | TP. <NAME> or TP.<BSP><NAME> |
| <NAME> TOWN | THÔN <NAME> or THÔN<BSP><NAME> |
| <NAME> TOWER | THÁP <NAME> or THÁP<BSP><NAME> |
| <NAME> CAVE | ĐỘNG <NAME> or HANG <NAME> |
| <NAME> FOREST | RỪNG <NAME> or RỪNG<BSP><NAME> |
| <NAME> ISLAND | ĐẢO <NAME> or ĐẢO<BSP><NAME> |
| ROUTE <N> | ĐƯỜNG <N> |

Note: `<BSP>` is a line break macro used for the map name popup display when names are long.

**Complete Location List (Johto Region):**
| English | Vietnamese |
|---------|------------|
| NEW BARK TOWN | THÔN<BSP>NEW BARK |
| CHERRYGROVE CITY | TP.<BSP>CHERRYGROVE |
| VIOLET CITY | TP.<BSP>VIOLET |
| AZALEA TOWN | THÔN<BSP>AZALEA |
| GOLDENROD CITY | TP.<BSP>GOLDENROD |
| ECRUTEAK CITY | TP.<BSP>ECRUTEAK |
| OLIVINE CITY | TP.<BSP>OLIVINE |
| CIANWOOD CITY | TP.<BSP>CIANWOOD |
| MAHOGANY TOWN | THÔN<BSP>MAHOGANY |
| BLACKTHORN CITY | TP.<BSP>BLACKTHORN |
| LAKE OF RAGE | HỒ GYARADOS |
| SILVER CAVE | HANG BẠC |
| SPROUT TOWER | THÁP MẦM |
| RUINS OF ALPH | TÀN TÍCH<BSP>ALPH |
| UNION CAVE | ĐỘNG UNION |
| SLOWPOKE WELL | GIẾNG<BSP>SLOWPOKE |
| RADIO TOWER | THÁP RADIO |
| NATIONAL PARK | VỪƠN<BSP>QUỐC GIA |
| TIN TOWER | THÁP THIẾC |
| BURNED TOWER | THÁP<BSP>CHÁY |
| LIGHTHOUSE | HẢI ĐĂNG |
| BATTLE TOWER | THÁP<BSP>ĐẤU |
| WHIRL ISLANDS | Q.ĐẢO<BSP>WHIRL |
| MT.MORTAR | NÚI MORTAR |
| DRAGON'S DEN | HANG<BSP>RỒNG |
| ICE PATH | LỐI BĂNG |
| DARK CAVE | HANG TỐI |
| ILEX FOREST | RỪNG<BSP>ILEX |
| FAST SHIP | TÀU NHANH |
| TOHJO FALLS | THÁC TOHJO |

**Complete Location List (Kanto Region):**
| English | Vietnamese |
|---------|------------|
| PALLET TOWN | THÔN<BSP>PALLET |
| VIRIDIAN CITY | TP.<BSP>VIRIDIAN |
| PEWTER CITY | TP.<BSP>PEWTER |
| CERULEAN CITY | TP.<BSP>CERULEAN |
| LAVENDER TOWN | THÔN<BSP>LAVENDER |
| VERMILION CITY | TP.<BSP>VERMILION |
| CELADON CITY | TP.<BSP>CELADON |
| SAFFRON CITY | TP.<BSP>SAFFRON |
| FUCHSIA CITY | TP.<BSP>FUCHSIA |
| CINNABAR ISLAND | ĐẢO<BSP>CINNABAR |
| INDIGO PLATEAU | CAO NGUYÊN<BSP>INDIGO |
| VICTORY ROAD | LỐI<BSP>VINH QUANG |
| MT.MOON | NÚI M.TRĂNG |
| ROCK TUNNEL | ĐƯỜNG HẦM ĐÁ |
| POWER PLANT | NHÀ MÁY ĐIỆN |
| LAV RADIO TOWER | ĐÀI RADIO<BSP>LAVENDER |
| SILPH CO. | SILPH CO. |
| SAFARI ZONE | KHU SAFARI |
| SEAFOAM ISLANDS | ĐẢO<BSP>BỌT BIỂN |
| POKEMON MANSION | DINH THỰ<BSP>#MON |
| CERULEAN CAVE | ĐỘNG<BSP>CERULEAN |
| DIGLETT'S CAVE | ĐỘNG<BSP>DIGLETT |
| VIRIDIAN FOREST | RỪNG<BSP>VIRIDIAN |
| UNDERGROUND | HẦM NGẦM |

**Routes (All 46 Routes):**
| English | Vietnamese |
|---------|------------|
| ROUTE 1-28 | ĐƯỜNG 1-28 |
| ROUTE 29-46 | ĐƯỜNG 29-46 |

**Special:**
| English | Vietnamese |
|---------|------------|
| SPECIAL | ĐẶC BIỆT |
| N/A | N/A |

### Rationale

1. **Community Consistency**: Vietnamese Pokemon players are familiar with English move/item names from online resources, competitive play, and the international community.

2. **Technical Constraints**: The 18-character line limit makes it difficult to translate long move/item names while keeping them readable.

3. **Disambiguation**: English names avoid potential confusion with Vietnamese words that might have different meanings.

4. **Future Compatibility**: Keeping standardized names helps players communicate across language barriers.

## Abbreviations Used

| English | Vietnamese | Meaning |
|---------|------------|---------|
| PROF. ELM | GS ELM | Giáo Sư (Professor) |
| POKEMON CENTER | TT POKEMON | Trung Tâm (Center) |
| TRAINER | HLV | Huấn Luyện Viên |
| ROUTE | ĐƯỜNG | Road/Route |
| CITY | TP. | Thành Phố |
| TOWN | THÔN | Village/Town |
| GYM LEADER | T.LĨNH GYM | Thủ Lĩnh (Leader) |
| TEAM ROCKET | ĐỘI ROCKET | Team/Squad |
| NATIONAL PARK | VƯỜN QUỐC GIA | Công Viên (Park) |
| ISLANDS | Q.ĐẢO | Quần Đảo (Archipelago) |
| VICTORY | C.THẮNG | Chiến Thắng (Victory) |
| ELDER | TRƯỞNG LÃO | Elder/Senior |

## Character Name Translations

| English | Vietnamese | Notes |
|---------|------------|-------|
| MR. POKEMON | ÔNG LÃO POKEMON | The old man who gives you the Mystery Egg |

## Pokemon Types

All 17 Pokemon types translated to Vietnamese:

| English | Vietnamese |
|---------|------------|
| NORMAL | B.THƯỜNG |
| FIGHTING | VÕ THUẬT |
| FLYING | BAY LƯỢN |
| POISON | ĐỘC |
| GROUND | ĐẤT |
| ROCK | SỎI ĐÁ |
| BUG | SÂU BỌ |
| GHOST | MA |
| STEEL | THÉP |
| FIRE | LỬA |
| WATER | NƯỚC |
| GRASS | CỎ |
| ELECTRIC | ĐIỆN |
| PSYCHIC | TÂM LINH |
| ICE | ĐÁ BĂNG |
| DRAGON | RỒNG |
| DARK | HẮC ÁM |
| BIRD | CHIM |

Note: BIRD type exists in code but is unused. ??? (CURSE_TYPE) is a special hidden type.

## Pronoun Guidelines

Vietnamese pronouns are chosen based on relationship and context:

| Relationship | Speaker → Listener |
|--------------|-------------------|
| Rival (rude) | tao → mày |
| Mom → Child | mẹ → con |
| Elder → Youth | ta → con |
| Peer (polite) | tôi → bạn |
| NPC (respectful) | Based on age/status |

## Confirmation Dialog System

Vietnamese uses different terms for different types of confirmations:

### YesNoBox (CÓ/KHÔNG) - For Preference/Intent Questions

Use `YesNoBox` function or `yesorno` script command for questions about:
- **Preferences**: "Do you want...?" / "Would you like...?"
- **Permission**: "May I...?" / "Should I...?"
- **Knowledge**: "Do you know...?"

**Example:**
- "Con có biết dùng ĐIỆN THOẠI không?" (Do you know how to use the PHONE?)
- Uses: CÓ (Yes) / KHÔNG (No)

## Vietnamese Grammar Rules

### Adjective-Noun Word Order

In Vietnamese, adjectives come **after** nouns (opposite of English). This affects decoration names and composite item names.

**Examples:**
| English | Literal Translation | Correct Vietnamese |
|---------|--------------------|--------------------|
| PINK BED | HỒNG GIƯỜNG (wrong) | GIƯỜNG HỒNG ✓ |
| RED CARPET | ĐỎ THẢM (wrong) | THẢM ĐỎ ✓ |
| BLUE CARPET | XANH BIỂN THẢM (wrong) | THẢM XANH BIỂN ✓ |

**Implementation:**
- Decoration names in `data/decorations/names.asm` are split into parts:
  - Nouns with trailing space: "GIƯỜNG " (bed), "THẢM " (carpet)
  - Adjectives without space: "HỒNG" (pink), "ĐỎ" (red)
- The code in `engine/overworld/decorations.asm` concatenates them in Vietnamese order (noun + adjective)

**Result:** "GIƯỜNG " + "HỒNG" = "GIƯỜNG HỒNG" (Bed Pink = Pink Bed)

## Technical Constraints

- **Max 18 characters per line** (Game Boy screen width)
- Special macros expand: `#` = POKé (4), `#MON` = POKéMON (7), `#DEX` = POKéDEX (7), `#GEAR` = POKéGEAR (8)
- Player/rival names count as 8 characters max
- Pokemon names count as 10 characters max

## Font Files

There are **two font files** that must contain Vietnamese characters:

| File | Format | Used For |
|------|--------|----------|
| `gfx/font/font.png` | 1bpp, 128x64 | Dialog boxes, menus, battle text |
| `gfx/font/overworld.png` | 2bpp, 128x64 | Map name signs (location popups), overworld text |

Both fonts must have the same character layout matching the charmap in `constants/charmap.asm`.

### Vietnamese Character Set Limitations and Decisions

**Important Note**: Due to the Game Boy's hardware limitations and the font table size constraints, several compromises were made to support Vietnamese characters:

#### 1. Single-Case System (commit f1f7ea4)
- **Removed**: Separate uppercase and lowercase English alphabet characters
- **Reason**: To fit all Vietnamese accented characters (á, à, ả, ã, ạ, ă, â, ê, ư, ô, ơ, đ, etc.) into the limited font table
- **Result**: All text now uses a single case system (lowercase-style characters for both cases)
- **Implementation**: See commit `f1f7ea47353b5bf7ffdfee1f4b7e8341b853ad06` for full details

#### 2. Removal of ỵ Character (commit 9428cb5)
- **Removed**: ỵ (y with hook above AND dot below)
- **Reason**: This character is **extremely rare** in Vietnamese. It only appears in:
  - The word "ghen tỵ" (jealous) - which can be written as "ghen tị" instead
  - A few archaic or formal literary texts
- **Modern Vietnamese**: The character ỵ is not part of standard Vietnamese typography and is often replaced with "ị" or "ỵ" is simplified to other forms
- **Trade-off**: Removing this one rarely-used character freed space to reorganize the font for trading compatibility
- **Fix**: Any existing text using "ỵ" should be changed to "ị" (as done in maps/Route14.asm: "ghen tỵ" → "ghen tị")

**Note**: The 6 standard Vietnamese tones are: no tone, acute (´), grave (`), hook above (̉), tilde (˜), and dot below (̣). The character ỵ combines two tone marks (hook above + dot below) which violates standard Vietnamese orthography - a syllable can only have one tone mark.

#### 3. Trading-Compatible Layout (commit 9428cb5)

**Character Table Layout** (CURRENT - Trading Compatible):
```
| Row | $x0 | $x1  | $x2  | $x3 | $x4 | $x5 | $x6 | $x7 | $x8 | $x9 | $xA | $xB | $xC | $xD | $xE | $xF |
|-----|-----|------|------|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|
| $8x | a   | b    | c    | d   | e   | f   | g   | h   | i   | j   | k   | l   | m   | n   | o   | p   |
| $9x | q   | r    | s    | t   | u   | v   | w   | x   | y   | z   | (   | )   | :   | ;   | [   | ]   |
| $Ax | á   | à    | ả    | ã   | ạ   | ă   | ắ   | ằ   | ẳ   | ẵ   | ặ   | â   | ấ   | ầ   | ẩ   | ẫ   |
| $Bx | ậ   | è    | ẻ    | ẽ   | ẹ   | ê   | ế   | ề   | ể   | ễ   | ệ   | í   | ì   | ỉ   | ĩ   | ị   |
| $Cx | ú   | ù    | ủ    | ũ   | ụ   | ư   | ứ   | ừ   | ử   | ữ   | ự   | ó   | ò   | ỏ   | õ   | ọ   |
| $Dx | ô   | ố    | ồ    | ổ   | ỗ   | ộ   | ơ   | ớ   | ờ   | ở   | ỡ   | ợ   | ý   | ỳ   | ỷ   | ỹ   |
| $Ex | '   | <PK> | <MN> | -   | ←   | đ   | ?   | !   | .   | &   | é   | →   | ▷   | ▶   | ▼   | ♂   |
| $Fx | ¥   | x    | .    | /   | ,   | ♀   | 0   | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   |
```

**Key Features**:
- **Range $80-$9F**: IDENTICAL to English Crystal (a-z + basic punctuation)
  - This enables Pokemon nicknames with English characters to display correctly when trading between Vietnamese and English versions
- **Range $A0-$DF**: Vietnamese accented characters organized by vowel families
  - a-family (á à ả ã ạ ă ắ ằ ẳ ẵ ặ â ấ ầ ẩ ẫ ậ)
  - e-family (è ẻ ẽ ẹ ê ế ề ể ễ ệ)
  - i-family (í ì ỉ ĩ ị)
  - u-family (ú ù ủ ũ ụ ư ứ ừ ử ữ ự)
  - o-family (ó ò ỏ õ ọ ô ố ồ ổ ỗ ộ ơ ớ ờ ở ỡ ợ)
  - y-family (ý ỳ ỷ ỹ)
- **Special characters**: đ at $E5, é at $EA, punctuation at $E0-$EF

This layout allows full Vietnamese text support while maximizing compatibility with English Pokemon Crystal for link cable trading/battling. English text (Pokemon names, technical terms) remains readable in the single-case format.

## Translation Conventions

1. **UPPERCASE keywords stay in English**: If a keyword or term is written in ALL CAPS (e.g., POTION, ATTACK, PIKACHU), leave it in English. These are game-specific identifiers.

2. **Run linter after translation**: Always run the linter to ensure translated lines do not exceed the character limit. Use:
   ```bash
   source .venv/bin/activate && python tools/check_text_length.py <file.asm>
   ```
   For example:
   ```bash
   python tools/check_text_length.py data/text/common_1.asm
   ```

## Link Cable Trading Translation Layer

### Overview

To enable trading between Vietnamese and English Pokemon Crystal versions, a translation layer has been implemented that automatically converts Vietnamese accented characters to base English letters when sending data over the link cable.

### Implementation (commit bdc8045)

**Files:**
- `engine/link/link_trade_text.asm` - Core translation functions
- `engine/link/link.asm` - Integration hooks in `Link_PrepPartyData_Gen2`

**Translation Functions:**

1. **TranslateVietnameseToEnglish** - Core translation routine
   - Input: hl = source string, de = destination, bc = length
   - Converts Vietnamese accented characters to base letters
   - English characters ($80-$99 = a-z) pass through unchanged

2. **TranslateString_PlayerName** - Translates player name before sending
3. **TranslateString_OTNames** - Translates Original Trainer names
4. **TranslateString_PartyMonNicknames** - Translates Pokemon nicknames

**Translation Rules:**

| Vietnamese Characters | Base Letter |
|----------------------|-------------|
| á à ả ã ạ ă ắ ằ ẳ ẵ ặ â ấ ầ ẩ ẫ ậ | a ($80) |
| é è ẻ ẽ ẹ ê ế ề ể ễ ệ | e ($84) |
| í ì ỉ ĩ ị | i ($88) |
| ó ò ỏ õ ọ ô ố ồ ổ ỗ ộ ơ ớ ờ ở ỡ ợ | o ($8E) |
| ú ù ủ ũ ụ ư ứ ừ ử ữ ự | u ($94) |
| ý ỳ ỷ ỹ | y ($98) |
| đ | d ($83) |

### Trading Behavior

#### Vietnamese → English Trading

When a Vietnamese player trades to English:
- **English names**: Pokemon named with a-z characters (e.g., "Pikachu") display correctly in both versions due to trading-compatible font layout ($80-$99 matches English exactly)
- **Vietnamese names**: Pokemon with accented names (e.g., "Điện") are automatically translated to base letters (e.g., "Dien") in the English version
- Player names and OT names are similarly translated

#### English → Vietnamese Trading

When an English player trades to Vietnamese:
- **English names**: Display correctly in Vietnamese version due to trading-compatible font layout
- **Vietnamese display**: No translation needed - Vietnamese version displays English a-z characters correctly

### Example Scenarios

**Scenario 1: Vietnamese player names Pokemon "Rồng"**
- In Vietnamese game: Displays as "Rồng" (with accent marks)
- Traded to English game: Displays as "Rong" (accents stripped)

**Scenario 2: English player names Pokemon "Dragon"**
- In English game: Displays as "Dragon"
- Traded to Vietnamese game: Displays as "Dragon" (unchanged)

**Scenario 3: Vietnamese player names Pokemon "Pikachu"**
- In Vietnamese game: Displays as "Pikachu"
- Traded to English game: Displays as "Pikachu" (unchanged, uses a-z range)

### Technical Details

**Hook Location:**
Translation is called in `Link_PrepPartyData_Gen2` (engine/link/link.asm) after copying party data to `wLinkData` but before sending over the link cable.

**Order of Operations:**
1. Copy player name, party data, OT names, nicknames to wLinkData
2. Call TranslateString_PlayerName
3. Call TranslateString_OTNames
4. Call TranslateString_PartyMonNicknames
5. Send translated wLinkData over link cable

**Why Translation is One-Way (Vietnamese → English only):**
- The trading-compatible font layout ensures English a-z characters display correctly in Vietnamese
- Vietnamese accented characters need translation to display as readable base letters in English
- No reverse translation needed (English → Vietnamese) since English characters are already compatible

### Future Improvements

Possible enhancements for future consideration:
- Bidirectional translation for other language pairs
- Option to preserve original names (trade-off: may display as garbage in incompatible versions)
- Translation customization via configuration

## Known Build Issues

### crystal11_debug ROM0 Overflow

The `make crystal11_debug` target (Vietnamese version 1.1 with debug symbols) currently fails with a ROM0 overflow error:

```
error: The linker script assigns section "Home" to address $0150, but then it would overflow ROM0 by 17 bytes
```

**Status:** This is a pre-existing issue in the Vietnamese localization (existed before trading compatibility implementation).

**Cause:** The Home section (ROM0) is nearly full. Vietnamese text translations are slightly longer than English in some places, and conditional debug code adds an additional 17+ bytes that exceed ROM0's capacity.

**Workaround:** Use other build targets that work correctly:
- `make` or `make crystal` - Vietnamese version 1.0 (works)
- `make crystal11` - Vietnamese version 1.1 without debug symbols (works)
- `make crystal_debug` - Vietnamese version 1.0 with debug symbols (works)

**Solution (if needed):** Move some functions from Home (ROM0) to banked sections (ROMX) to free up space. This requires careful refactoring as Home functions need to be callable from any bank.
