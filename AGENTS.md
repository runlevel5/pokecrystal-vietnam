# Pokemon Crystal Vietnamese Localization - Translation Guidelines

This document contains key decisions and guidelines for AI agents working on the Vietnamese localization of Pokemon Crystal.

## Language Decisions

### Terms Kept in English (UPPERCASE)

The following categories are intentionally kept in English to maintain consistency with the international Pokemon community and avoid confusion:

#### 1. Move Names (251 total)
Most move names remain in English uppercase, with exceptions for common moves (see Translated Moves section below). Complete list:

**Generation I Moves:**
POUND, DOUBLESLAP, MEGA PUNCH, VICEGRIP, GUILLOTINE, RAZOR WIND, WING ATTACK, BIND, SLAM, VINE WHIP, STOMP, DOUBLE KICK, MEGA KICK, JUMP KICK, ROLLING KICK, SAND-ATTACK, HEADBUTT, HORN ATTACK, FURY ATTACK, HORN DRILL, BODY SLAM, WRAP, TAKE DOWN, THRASH, DOUBLE-EDGE, TAIL WHIP, POISON STING, TWINEEDLE, PIN MISSILE, BITE, ROAR, SING, SUPERSONIC, SONICBOOM, DISABLE, ACID, EMBER, FLAMETHROWER, MIST, WATER GUN, HYDRO PUMP, SURF, ICE BEAM, BLIZZARD, PSYBEAM, BUBBLEBEAM, AURORA BEAM, HYPER BEAM, PECK, DRILL PECK, SUBMISSION, LOW KICK, COUNTER, SEISMIC TOSS, STRENGTH, ABSORB, MEGA DRAIN, LEECH SEED, GROWTH, RAZOR LEAF, SOLARBEAM, POISONPOWDER, STUN SPORE, SLEEP POWDER, PETAL DANCE, STRING SHOT, DRAGON RAGE, FIRE SPIN, THUNDERSHOCK, THUNDERBOLT, THUNDER WAVE, THUNDER, ROCK THROW, EARTHQUAKE, FISSURE, DIG, TOXIC, CONFUSION, PSYCHIC, HYPNOSIS, MEDITATE, AGILITY, QUICK ATTACK, RAGE, TELEPORT, NIGHT SHADE, MIMIC, SCREECH, DOUBLE TEAM, RECOVER, HARDEN, MINIMIZE, CONFUSE RAY, WITHDRAW, DEFENSE CURL, BARRIER, LIGHT SCREEN, HAZE, REFLECT, FOCUS ENERGY, BIDE, METRONOME, MIRROR MOVE, SELFDESTRUCT, EGG BOMB, LICK, SMOG, SLUDGE, BONE CLUB, FIRE BLAST, WATERFALL, CLAMP, SWIFT, SKULL BASH, SPIKE CANNON, CONSTRICT, AMNESIA, KINESIS, SOFTBOILED, HI JUMP KICK, GLARE, DREAM EATER, POISON GAS, BARRAGE, LOVELY KISS, SKY ATTACK, TRANSFORM, BUBBLE, DIZZY PUNCH, SPORE, FLASH, PSYWAVE, SPLASH, ACID ARMOR, CRABHAMMER, EXPLOSION, FURY SWIPES, BONEMERANG, REST, ROCK SLIDE, HYPER FANG, SHARPEN, CONVERSION, TRI ATTACK, SUPER FANG, SLASH, SUBSTITUTE, STRUGGLE

**Generation II Moves:**
SKETCH, TRIPLE KICK, THIEF, SPIDER WEB, MIND READER, FLAME WHEEL, CURSE, FLAIL, CONVERSION2, AEROBLAST, COTTON SPORE, REVERSAL, SPITE, POWDER SNOW, MACH PUNCH, SCARY FACE, FAINT ATTACK, SWEET KISS, BELLY DRUM, SLUDGE BOMB, MUD-SLAP, OCTAZOOKA, SPIKES, ZAP CANNON, FORESIGHT, DESTINY BOND, PERISH SONG, ICY WIND, DETECT, BONE RUSH, LOCK-ON, OUTRAGE, SANDSTORM, GIGA DRAIN, ENDURE, CHARM, ROLLOUT, FALSE SWIPE, SWAGGER, SPARK, FURY CUTTER, STEEL WING, MEAN LOOK, ATTRACT, HEAL BELL, RETURN, PRESENT, FRUSTRATION, SAFEGUARD, PAIN SPLIT, SACRED FIRE, MAGNITUDE, DYNAMICPUNCH, MEGAHORN, DRAGONBREATH, BATON PASS, ENCORE, PURSUIT, RAPID SPIN, SWEET SCENT, METAL CLAW, VITAL THROW, SYNTHESIS, MOONLIGHT, HIDDEN POWER, CROSS CHOP, TWISTER, RAIN DANCE, SUNNY DAY, CRUNCH, MIRROR COAT, PSYCH UP, EXTREMESPEED, ANCIENTPOWER, SHADOW BALL, FUTURE SIGHT, ROCK SMASH, WHIRLPOOL, BEAT UP

**Translated Moves:**

To translate move names, edit the file `data/moves/names.asm`.

| English | Vietnamese |
|---------|------------|
| CUT | CẮT |
| FLY | BAY |
| TACKLE | ĐÁNH CHẶN |
| LEER | LIẾC |
| SMOKESCREEN | MÀN KHÓI |
| GROWL | GẦM GỪ |
| LEECH LIFE | HÚT HP |
| SNORE | NGÁY |
| NIGHTMARE | ÁC MỘNG |
| PROTECT | BẢO VỆ |
| IRON TAIL | ĐUÔI SẮT |
| MORNING SUN | BÌNH MINH |
| SLEEP TALK | MỘNG NGÔN |
| MILK DRINK | UỐNG SỮA |
| KARATE CHOP | CHẶT KARATE |
| COMET PUNCH | ĐẤM SAO |
| PAY DAY | VUNG TIỀN |
| FIRE PUNCH | ĐẤM LỬA |
| ICE PUNCH | ĐẤM BĂNG |
| THUNDERPUNCH | ĐẤM SẤM |
| SCRATCH | CÀO |
| SWORDS DANCE | MÚA KIẾM |
| GUST | LỐC |
| WHIRLWIND | LỐC XOÁY |

#### 2. Item Names

**Poké Balls (kept in English):**
MASTER BALL, ULTRA BALL, GREAT BALL, # BALL, HEAVY BALL, LEVEL BALL, LURE BALL, FAST BALL, LIGHT BALL, FRIEND BALL, MOON BALL, LOVE BALL, PARK BALL

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
- Badge names: ZEPHYRBADGE, HIVEBADGE, etc.
- Game-specific terms: GYM (kept as GYM)

### Terms Translated to Vietnamese

#### 1. Team/Organization Names
| English | Vietnamese |
|---------|------------|
| TEAM ROCKET | ĐỘI ROCKET |
| GYM LEADER | T.LĨNH GYM |

#### 2. Item Names (Translated)
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

#### 3. Location Names
Location names are translated with Vietnamese prefixes. Below is the complete list from `data/maps/landmarks.asm`.

**Translation Patterns:**
| English Pattern | Vietnamese Pattern |
|-----------------|-------------------|
| <NAME> CITY | TP. <NAME> or TP.<BSP><NAME> |
| <NAME> TOWN | THỊ TRẤN <NAME> or TRẤN<BSP><NAME> |
| <NAME> TOWER | THÁP <NAME> or THÁP<BSP><NAME> |
| <NAME> CAVE | ĐỘNG <NAME> or HANG <NAME> |
| <NAME> FOREST | RỪNG <NAME> or RỪNG<BSP><NAME> |
| <NAME> ISLAND | ĐẢO <NAME> or ĐẢO<BSP><NAME> |
| ROUTE <N> | TUYẾN ĐƯỜNG <N> |

Note: `<BSP>` is a line break macro used for the map name popup display when names are long.

**Complete Location List (Johto Region):**
| English | Vietnamese |
|---------|------------|
| NEW BARK TOWN | THỊ TRẤN<BSP>NEW BARK |
| CHERRYGROVE CITY | TP.<BSP>CHERRYGROVE |
| VIOLET CITY | TP.<BSP>VIOLET |
| AZALEA TOWN | THỊ TRẤN<BSP>AZALEA |
| GOLDENROD CITY | TP.<BSP>GOLDENROD |
| ECRUTEAK CITY | TP.<BSP>ECRUTEAK |
| OLIVINE CITY | TP.<BSP>OLIVINE |
| CIANWOOD CITY | TP.<BSP>CIANWOOD |
| MAHOGANY TOWN | THỊ TRẤN<BSP>MAHOGANY |
| BLACKTHORN CITY | TP.<BSP>BLACKTHORN |
| LAKE OF RAGE | HỒ GYARADOS |
| SILVER CAVE | HANG BẠC |
| SPROUT TOWER | THÁP<BSP>SPROUT |
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
| PALLET TOWN | THỊ TRẤN<BSP>PALLET |
| VIRIDIAN CITY | TP.<BSP>VIRIDIAN |
| PEWTER CITY | TP.<BSP>PEWTER |
| CERULEAN CITY | TP.<BSP>CERULEAN |
| LAVENDER TOWN | THỊ TRẤN<BSP>LAVENDER |
| VERMILION CITY | TP.<BSP>VERMILION |
| CELADON CITY | TP.<BSP>CELADON |
| SAFFRON CITY | TP.<BSP>SAFFRON |
| FUCHSIA CITY | TP.<BSP>FUCHSIA |
| CINNABAR ISLAND | ĐẢO<BSP>CINNABAR |
| INDIGO PLATEAU | CAO NGUYÊN<BSP>INDIGO |
| VICTORY ROAD | LỐI<BSP>VINH QUANG |
| MT.MOON | NÚI MOON |
| ROCK TUNNEL | ĐƯỜNG HẦM ĐÁ |
| POWER PLANT | NHÀ MÁY ĐIỆN |
| LAV RADIO TOWER | ĐÀI RADIO<BSP>LAVENDER |
| SILPH CO. | SILPH CO. |
| SAFARI ZONE | KHU SAFARI |
| SEAFOAM ISLANDS | Q.ĐẢO<BSP>SEAFOAM |
| POKEMON MANSION | DINH THỰ<BSP>#MON |
| CERULEAN CAVE | ĐỘNG<BSP>CERULEAN |
| DIGLETT'S CAVE | ĐỘNG<BSP>DIGLETT |
| VIRIDIAN FOREST | RỪNG<BSP>VIRIDIAN |
| UNDERGROUND | HẦM NGẦM |

**Routes (All 46 Routes):**
| English | Vietnamese |
|---------|------------|
| ROUTE 1-28 | TUYẾN ĐƯỜNG 1-28 |
| ROUTE 29-46 | TUYẾN ĐƯỜNG 29-46 |

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
| ROUTE | TUYẾN ĐƯỜNG | Road/Route (abbrev: TUYẾN) |
| CITY | TP. | Thành Phố |
| TOWN | TRẤN | Town/Township |
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

### Vietnamese Character Set Limitation

**Important Note**: Due to the Game Boy's hardware limitations and the font table size constraints, a compromise was made to support Vietnamese characters:

- **Removed**: Separate uppercase and lowercase English alphabet characters
- **Reason**: To fit all Vietnamese accented characters (á, à, ả, ã, ạ, ă, â, ê, ư, ô, ơ, đ, etc.) into the limited font table
- **Result**: All text now uses a single case system (lowercase-style characters for both cases)
- **Implementation**: See commit `f1f7ea47353b5bf7ffdfee1f4b7e8341b853ad06` for full details

**Character Table Layout** (from commit f1f7ea4):
```
| Row | $x0 | $x1  | $x2  | $x3 | $x4 | $x5 | $x6 | $x7 | $x8 | $x9 | $xA | $xB | $xC | $xD | $xE | $xF |
|-----|-----|------|------|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|
| $8x | a   | b    | c    | d   | e   | f   | g   | h   | i   | j   | k   | l   | m   | n   | o   | p   |
| $9x | q   | r    | s    | t   | u   | v   | w   | x   | y   | z   | ă   | â   | ê   | ư   | ô   | ơ   |
| $Ax | á   | à    | ả    | ã   | ạ   | é   | è   | ẻ   | ẽ   | ẹ   | í   | ì   | ỉ   | ĩ   | ị   | đ   |
| $Bx | ó   | ò    | ỏ    | õ   | ọ   | ú   | ù   | ủ   | ũ   | ụ   | ý   | ỳ   | ỷ   | ỹ   | ỵ   | [   |
| $Cx | ắ   | ằ    | ẳ    | ẵ   | ặ   | ấ   | ầ   | ẩ   | ẫ   | ậ   | ế   | ề   | ể   | ễ   | ệ   | ]   |
| $Dx | ố   | ồ    | ổ    | ỗ   | ộ   | ớ   | ờ   | ở   | ỡ   | ợ   | ứ   | ừ   | ử   | ữ   | ự   | ←   |
| $Ex | '   | <PK> | <MN> | -   | (   | )   | ?   | !   | .   | &   | :   | →   | ▷   | ▶   | ▼   | ♂   |
| $Fx | ¥   | x    | .    | /   | ,   | ♀   | 0   | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   |
```

This trade-off allows full Vietnamese text support while maintaining compatibility with the original Game Boy hardware. English text (Pokemon names, technical terms) remains readable in the single-case format.

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
