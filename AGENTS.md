# Pokemon Crystal Vietnamese Localization - Translation Guidelines

This document contains key decisions and guidelines for AI agents working on the Vietnamese localization of Pokemon Crystal.

## Language Decisions

### Terms Kept in English (UPPERCASE)

The following categories are intentionally kept in English to maintain consistency with the international Pokemon community and avoid confusion:

#### 1. Move Names
All move names remain in English uppercase:
- NIGHTMARE, CURSE, LEECH SEED, BIND, WRAP, CLAMP
- SUBSTITUTE, MIST, SKETCH, TRANSFORM, PROTECT
- SPIKES, RAGE, ENCORE, SAFEGUARD, LIGHT SCREEN
- REFLECT, FUTURE SIGHT, ENDURE, MIRROR MOVE
- PERISH SONG, MUD-SLAP, FLASH, etc.

#### 2. Item Names
All item names remain in English:
- Consumables: BERRY, POTION, ANTIDOTE, PARLYZ HEAL, etc.
- Battle items: X ACCURACY, X ATTACK, X DEFEND, etc.
- Key items: ESCAPE ROPE, PP UP, RARE CANDY, HP UP, etc.
- Technical machines: TM31, TM50, HM FLASH, etc.

#### 3. Status Conditions
Status effect names remain in English:
- POISON, PARALYSIS, BURN, FREEZE, SLEEP
- CONFUSION, INFATUATION, etc.

#### 4. Stats
Stat names remain in English:
- HP, ATTACK, DEFENSE, SP.ATK, SP.DEF, SPEED, PP

#### 5. Pokemon Names
All Pokemon species names remain in English:
- PIKACHU, RATTATA, BELLSPROUT, PIDGEY, TOGEPI, etc.
- Pokemon nicknames can be Vietnamese (e.g., STRAWBERRY → DÂU)

#### 6. Special Terms
- Badge names: ZEPHYRBADGE, HIVEBADGE, etc.
- Game-specific terms: GYM, GYM LEADER, TEAM ROCKET

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
| CITY | TP | Thành Phố |
| ELDER | TRƯỞNG LÃO | Elder/Senior |
| SPROUT TOWER | THÁP MẦM | Sprout Tower |
| DARK CAVE | HANG TỐI | Dark Cave |

## Pronoun Guidelines

Vietnamese pronouns are chosen based on relationship and context:

| Relationship | Speaker → Listener |
|--------------|-------------------|
| Rival (rude) | tao → mày |
| Mom → Child | mẹ → con |
| Elder → Youth | ta → con |
| Peer (polite) | tôi → bạn |
| NPC (respectful) | Based on age/status |

## Technical Constraints

- **Max 18 characters per line** (Game Boy screen width)
- Special macros expand: `#` = POKé (4), `#MON` = POKéMON (7), `#DEX` = POKéDEX (7), `#GEAR` = POKéGEAR (8)
- Player/rival names count as 8 characters max
- Pokemon names count as 10 characters max
