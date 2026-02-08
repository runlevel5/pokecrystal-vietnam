# Pokemon Generation 2 Link Cable Protocol

Technical reference for the serial link cable protocol used in Pokemon Gold, Silver, and Crystal for trading and battling between two Game Boy systems.

**Source files referenced:** `home/serial.asm`, `engine/link/link.asm`, `engine/link/link_2.asm`, `engine/link/time_capsule.asm`, `engine/link/time_capsule_2.asm`, `ram/wram.asm`, `ram/hram.asm`, `constants/serial_constants.asm`

---

## Table of Contents

1. [Physical Layer](#1-physical-layer)
2. [Serial Exchange Primitives](#2-serial-exchange-primitives)
3. [Special Byte Values](#3-special-byte-values)
4. [Gen2-Gen2 Protocol Flow](#4-gen2-gen2-protocol-flow)
5. [Gen2-Gen1 Time Capsule Protocol Flow](#5-gen2-gen1-time-capsule-protocol-flow)
6. [Data Formats](#6-data-formats)
7. [$FE Patching System](#7-fe-patching-system)
8. [In-Game Synchronization](#8-in-game-synchronization)
9. [Trade Execution](#9-trade-execution)
10. [WRAM Layout](#10-wram-layout)

---

## 1. Physical Layer

### Game Boy Serial Port

The Game Boy serial port (`rSB`, `rSC`) transfers one byte at a time between two linked systems. Communication is synchronous — one system generates the clock signal (internal clock) while the other receives it (external clock).

### Clock Roles

| Role | Constant | Value | rSC Flags | Behavior |
|------|----------|-------|-----------|----------|
| Player 1 | `USING_EXTERNAL_CLOCK` | `$01` | `SC_EXTERNAL`, `SC_START \| SC_EXTERNAL` | Receives clock from peer |
| Player 2 | `USING_INTERNAL_CLOCK` | `$02` | `SC_INTERNAL`, `SC_START \| SC_INTERNAL` | Generates clock signal |

Player 2 (internal clock) initiates each byte transfer by writing `SC_START | SC_INTERNAL` to `rSC`. Player 1 (external clock) waits passively — the hardware triggers the serial interrupt on both sides when the transfer completes.

### Connection Establishment (`WaitForLinkedFriend`)

**File:** `engine/link/link.asm:2303`

Connection is established through a polling loop where each system alternates between offering the two clock roles:

```
loop:
  if no connection established:
    1. Set rSB = USING_INTERNAL_CLOCK ($02)
       Set rSC = SC_START | SC_EXTERNAL  (listen as external clock)
    2. Wait for timeout
    3. Set rSB = USING_EXTERNAL_CLOCK ($01)
       Set rSC = SC_START | SC_INTERNAL  (transmit as internal clock)
    4. DelayFrame
    5. goto loop
```

When one system's Serial ISR receives either `USING_EXTERNAL_CLOCK` ($01) or `USING_INTERNAL_CLOCK` ($02), it assigns the complementary role via `hSerialConnectionStatus`. The first system to detect a valid byte from the peer becomes Player 1 or Player 2 accordingly.

After connection is established, both systems exchange acknowledgement bytes via `LinkDataReceived`, then wait 50 frames before proceeding.

### Serial Interrupt Handler (`Serial::`)

**File:** `home/serial.asm:1`

The serial ISR handles three cases:

1. **Connection not established** (`hSerialConnectionStatus == CONNECTION_NOT_ESTABLISHED`):
   - Reads `rSB` to check for `USING_EXTERNAL_CLOCK` or `USING_INTERNAL_CLOCK`
   - Assigns clock role accordingly
   - Player 1 (external clock) inserts a timing delay via `rDIV` before re-arming

2. **Connection established** (normal data transfer):
   - Reads received byte from `rSB` into `hSerialReceive`
   - Writes next outgoing byte from `hSerialSend` to `rSB`
   - If Player 1 (external clock): re-arms with `SC_START | SC_EXTERNAL`
   - Sets `hSerialReceivedNewData = TRUE`
   - Sets `hSerialSend = SERIAL_NO_DATA_BYTE` ($FE) as default for next transfer

3. **Mobile/Printer**: Delegates to specialized handlers (not covered here)

### Room Selection Verification

**File:** `engine/link/link.asm:2553` (`CheckBothSelectedSameRoom`)

After connection establishment, both players choose a Cable Club room (Time Capsule, Trade Center, or Colosseum). The game verifies both chose the same room using `Link_EnsureSync`:

1. Each player sends their room choice encoded as `$D0 | room_number` via `Serial_ExchangeSyncBytes`
2. The receiver extracts the low nybble and compares
3. If mismatched, `wScriptVar` is set to 0 (failure)
4. If matched, `wLinkMode` is set to `room_choice + 1` (mapping to `LINK_TIMECAPSULE`, `LINK_TRADECENTER`, or `LINK_COLOSSEUM`)

---

## 2. Serial Exchange Primitives

### `Serial_ExchangeBytes` — Bulk Transfer with Preamble Sync

**File:** `home/serial.asm:91`

The primary bulk data transfer function. Sends `bc` bytes from `[hl]` and receives `bc` bytes into `[de]`.

**Preamble synchronization algorithm:**

```
hSerialIgnoringInitialData = TRUE

loop:
  hSerialSend = [hl]              ; queue byte to send
  received = Serial_ExchangeByte() ; exchange one byte
  short_delay(48 cycles)

  if ignoring:
    hl--                           ; re-send same byte next iteration
    if received == $FD:            ; preamble byte detected
      hSerialIgnoringInitialData = FALSE
      ; do NOT store this byte, do NOT decrement bc
    goto loop
  else:
    [de] = received               ; store received byte
    de++, hl++, bc--
    if bc != 0: goto loop

return
```

**Key properties:**
- The first `$FD` byte received triggers sync and is consumed (not stored)
- Before sync, the sender re-sends byte 0 of the source buffer repeatedly
- After sync, exactly `bc` bytes are stored, regardless of how many bytes were exchanged during the sync phase
- Both peers eventually sync because both send `$FD` as their preamble bytes

### `Serial_ExchangeByte` — Single Byte Exchange

**File:** `home/serial.asm:130`

Exchanges a single byte with the peer. This is the lowest-level exchange function.

**Behavior:**
1. Clears `hSerialReceivedNewData`
2. If Player 2 (internal clock): initiates transfer by writing `SC_START | SC_INTERNAL` to `rSC`
3. Polls `hSerialReceivedNewData` until TRUE (set by Serial ISR)
4. If received byte is `$FE` (no data): retries — re-sends current byte and re-initiates transfer
5. Returns received byte in `a`

**Timeout mechanism:**
- When only `IE_SERIAL` is enabled (no vblank/timer), uses `wLinkByteTimeout` as a countdown
- If timeout expires: Player 1 returns `$FE`; Player 2 enters a 255-cycle delay then retries
- `wLinkTimeoutFrames` tracks connection-level timeouts — if both bytes reach zero, calls `SerialDisconnected` (sets `wLinkTimeoutFrames = $FFFF`)

### `ExchangeBytes` — Mail Transfer Variant

**File:** `engine/link/link.asm:565`

Similar to `Serial_ExchangeBytes` but with a different sync mechanism:

```
hSerialIgnoringInitialData = TRUE

loop:
  hSerialSend = [hl]
  received = Serial_ExchangeByte()
  short_delay(48 cycles)

  if ignoring:
    hl--                           ; re-send same byte
    hSerialIgnoringInitialData = FALSE  ; clear IMMEDIATELY after first exchange
    goto loop
  else:
    [de] = received
    de++, hl++, bc--
    if bc != 0: goto loop
```

**Key difference from `Serial_ExchangeBytes`:** There is no `$FD` check. The ignoring flag is cleared unconditionally after the very first byte exchange, regardless of what byte was received. The first byte received is discarded (not stored), then all subsequent bytes are stored normally.

This variant is used for mail exchange where the preamble is `$20` (not `$FD`).

### `Serial_ExchangeSyncBytes` — Room Verification

**File:** `home/serial.asm:256`

Exchanges exactly 2 sync bytes between `wLinkPlayerSyncBuffer` and `wLinkReceivedSyncBuffer`. Uses `Serial_ExchangeByte` directly with a simplified ignoring mechanism — clears the ignoring flag after the first exchange (like `ExchangeBytes`), then stores the next 2 received bytes.

### `WaitLinkTransfer` / `LinkTransfer` — Nybble-Based Action Exchange

**File:** `home/serial.asm:292` / `home/serial.asm:352`

Used for in-game synchronization of menu actions (trade confirmations, cancellations, cursor movements).

**`LinkTransfer`:**
1. Determines the high nybble based on `wLinkMode`:
   - Time Capsule: `$60` (`SERIAL_TIMECAPSULE`)
   - Trade Center: `$70` (`SERIAL_TRADECENTER`)
   - Colosseum: `$80` (`SERIAL_BATTLE`)
2. Combines: `hSerialSend = high_nybble + wPlayerLinkAction`
3. If Player 2: initiates transfer
4. Reads `hSerialReceive`, checks high nybble matches expected
5. If match: extracts low nybble into `wOtherPlayerLinkAction`

**`WaitLinkTransfer`:**
1. Sets `wOtherPlayerLinkAction = $FF` (not yet received)
2. Polls `LinkTransfer` + `DelayFrame` until `wOtherPlayerLinkAction != $FF`
3. After receiving: continues polling for 10 more frames (receive phase)
4. Then sends acknowledgement for 10 more frames (`LinkDataReceived`)
5. Copies final action to `wOtherPlayerLinkMode`

---

## 3. Special Byte Values

| Byte | Constant | Purpose |
|------|----------|---------|
| `$FD` | `SERIAL_PREAMBLE_BYTE` | Stream start marker. Sent as preamble before payload. Triggers sync in `Serial_ExchangeBytes`. Must be patched out of payload data. |
| `$FE` | `SERIAL_NO_DATA_BYTE` | "No data" sentinel. Sent by Serial ISR as default after each transfer. `Serial_ExchangeByte` retries when receiving this. Must be patched out of payload data. |
| `$FF` | `SERIAL_PATCH_LIST_PART_TERMINATOR` / `SERIAL_PATCH_REPLACEMENT_BYTE` | Terminates each section of the patch list. Also used as the replacement value for patched `$FE` bytes. |
| `$20` | `SERIAL_MAIL_PREAMBLE_BYTE` | Preamble byte for mail data stream. |
| `$21` | `SERIAL_MAIL_REPLACEMENT_BYTE` | Replacement for `$FE` bytes within mail message bodies. |

**Why `$FE` and `$FD` must be removed from payload:**
- `$FE` would be interpreted as "no data" by `Serial_ExchangeByte`, causing retries instead of data transfer
- `$FD` would trigger premature sync termination in `Serial_ExchangeBytes`

The [patching system](#7-fe-patching-system) handles this transparently.

---

## 4. Gen2-Gen2 Protocol Flow

**Entry point:** `Gen2ToGen2LinkComms` (`engine/link/link.asm:204`)

This is the main protocol for Crystal-Crystal (or Gold/Silver) link communication, used for both Trade Center and Colosseum.

### Step-by-Step Sequence

#### Phase 1: Data Preparation

```
1. ClearLinkData           — zero out wLinkData (1300 bytes)
2. Link_PrepPartyData_Gen2 — serialize player's party into wLinkData
3. FixDataForLinkTransfer  — generate RN preamble, patch $FE bytes, build patch lists
4. CheckLinkTimeout_Gen2   — verify connection still alive (nybble sync $5, then $6)
```

If `CheckLinkTimeout_Gen2` fails (`wScriptVar == 0`), jump to `LinkTimeout` and abort.

#### Phase 2: Clock Synchronization

Player 2 (internal clock) sends two zero bytes to synchronize timing:
```
if player 2:
  DelayFrames(3)
  send $00 via rSB, initiate transfer
  DelayFrame
  send $00 via rSB, initiate transfer
```

#### Phase 3: Serial Exchanges

All interrupts except serial are disabled (`rIE = IE_SERIAL`). Music is silenced.

**Exchange 1 — Random Numbers (17 bytes)**
```
send: wLinkBattleRNPreamble (7 bytes $FD) + wLinkBattleRNs (10 bytes random, each < $FD)
recv: wOTLinkBattleRNData (17 bytes)
terminator: $FE written after received data
```

**Exchange 2 — Party Data (453 bytes)**
```
send: wLinkData
recv: wOTPartyData
size: SERIAL_PREAMBLE_LENGTH + NAME_LENGTH + (1 + PARTY_LENGTH + 1) + 2
      + (PARTYMON_STRUCT_LENGTH + NAME_LENGTH * 2) * PARTY_LENGTH + 3
    = 6 + 11 + 8 + 2 + (48 + 22) * 6 + 3
    = 6 + 11 + 8 + 2 + 420 + 3
    = 450 bytes in buffer, 453 exchanged (with preamble sync)
terminator: $FE written after received data
```

**Exchange 3 — Patch Lists (200 bytes)**
```
send: wPlayerPatchLists
recv: wOTPatchLists
size: SERIAL_PATCH_LIST_LENGTH = 200 bytes
```

**Exchange 4 — Mail (Trade Center only)**
```
send: wLinkPlayerMail
recv: wLinkOTMail
size: wLinkPlayerMailEnd - wLinkPlayerMail
uses: ExchangeBytes (not Serial_ExchangeBytes — different sync mechanism)
```

#### Phase 4: Post-Exchange Processing

Interrupts are restored (`rIE = IE_JOYPAD | IE_SERIAL | IE_TIMER | IE_VBLANK`).

```
1.  Link_CopyRandomNumbers
      — extract RN bytes from wOTLinkBattleRNData for battle use

2.  Strip preamble from wOTPartyData
      — Link_FindFirstNonControlCharacter_SkipZero skips $00, $FD, $FE bytes

3.  Link_CopyOTData
      — copy 441 bytes from stripped data to wLinkData, skipping any $FE bytes
      — 441 = NAME_LENGTH + (1 + PARTY_LENGTH + 1) + 2
              + (PARTYMON_STRUCT_LENGTH + NAME_LENGTH * 2) * PARTY_LENGTH
      — note: this overwrites the original outgoing data in wLinkData

4.  Apply patch lists (restore $FE bytes)
      — iterate through wOTPatchLists
      — skip $00, $FD, $FE bytes (control characters in the patch list itself)
      — for each valid offset byte: wLinkPlayerData[offset - 1] = $FE
      — $FF terminates part 1; second part starts at wLinkPlayerData + SERIAL_PATCH_DATA_SIZE
      — two parts: offsets 1-252 (data1) and remainder (data2)

5.  Process mail (Trade Center only)
      — strip mail preamble ($20 bytes) from wLinkOTMail
      — replace $21 → $FE in mail message bodies
      — apply mail patch list to metadata
      — copy messages and metadata to wLinkReceivedMail (interleaved format)
      — apply European mail language conversions if applicable

6.  Copy to final WRAM destinations:
      wLinkData[0:11]   → wOTPlayerName    (11 bytes)
      wLinkData[11:19]  → wOTPartyCount    (1 + 6 + 1 = 8 bytes)
      wLinkData[19:21]  → wOTPlayerID      (2 bytes)
      wLinkData[21:441] → wOTPartyMons     (420 bytes = 288 mons + 66 OTs + 66 nicks)
```

#### Phase 5: Enter UI

- **Colosseum**: Set up battle parameters, call `StartBattle`, then `ExitLinkCommunications`
- **Trade Center**: Play route 30 music, call `InitTradeMenuDisplay`, enter trade UI

### `Link_FindFirstNonControlCharacter_SkipZero`

**File:** `engine/link/link.asm:1229`

Scans forward through a buffer, skipping bytes with values `$00`, `$FD`, or `$FE`. Returns `hl` pointing at the first non-control byte. Used to strip the preamble from received party data.

There is also a `_AllowZero` variant (`engine/link/link.asm:1241`) that only skips `$FD` and `$FE`.

---

## 5. Gen2-Gen1 Time Capsule Protocol Flow

**Entry point:** `Gen2ToGen1LinkComms` (`engine/link/link.asm:39`)

Used for trading between Gen2 (Crystal/Gold/Silver) and Gen1 (Red/Blue/Yellow) via the Time Capsule.

### Differences from Gen2-Gen2

| Aspect | Gen2-Gen2 | Gen2-Gen1 |
|--------|-----------|-----------|
| Struct format | `PARTYMON_STRUCT_LENGTH` (48 bytes) | `REDMON_STRUCT_LENGTH` (44 bytes) |
| Species indices | Gen2 native | Converted via `ConvertMon_2to1` / `ConvertMon_1to2` |
| Stats | Split SpAtk/SpDef | Unified Special |
| Connection check | `CheckLinkTimeout_Gen2` (nybble sync) | `WaitLinkTransfer` (nybble exchange) |
| Mail exchange | Yes (Trade Center) | No |
| Post-receive | Direct copy | Struct conversion (`Link_ConvertPartyStruct1to2`) |

### Protocol Sequence

```
1. ClearLinkData
2. Link_PrepPartyData_Gen1     — serialize party in Gen1 format
3. FixDataForLinkTransfer      — same as Gen2 (patch $FE, build patch lists)
4. WaitLinkTransfer            — sync via nybble exchange (no CheckLinkTimeout_Gen2)
5. Clock sync (Player 2 sends two $00 bytes)
6. Exchange RNs (17 bytes)     — recv into wEnemyMon (UNIONed with wOTLinkBattleRNData)
7. Exchange party data         — 424 bytes (6 + 11 + 8 + 264 + 66 + 66 + 3)
8. Exchange patch lists        — 200 bytes
9. Restore interrupts
10. Link_CopyRandomNumbers
11. Strip preamble, validate party count (must be 1-6, else abort)
12. Link_CopyOTData
13. Apply patch lists           — same 2-part system, uses wTimeCapsulePlayerData as base
14. Copy player name to wOTPlayerName
15. Convert species indices     — ConvertMon_1to2 for each party species
16. Convert party structs       — Link_ConvertPartyStruct1to2
17. Enter trade UI              — InitTradeMenuDisplay
```

### Gen1 Struct Conversion

**`Link_PrepPartyData_Gen1`** (`engine/link/link.asm:699`) converts Gen2 party data to Gen1 wire format:

For each party mon:
1. Convert species index via `ConvertMon_2to1`
2. Write fields in Gen1 order: species, HP, unused byte ($00), status
3. Handle Magnemite/Magneton specially (Electric/Electric instead of Electric/Steel)
4. Copy type bytes from `BaseData` for other species, plus catch rate
5. Copy moves, DVs, stat exp (same format)
6. Copy level, max HP, current stats (Atk, Def, Spd)
7. Calculate unified Special from base SpAtk using `KantoMonSpecials` table + `CalcMonStatC`

**`Link_ConvertPartyStruct1to2`** (`engine/link/time_capsule_2.asm`) converts received Gen1 data to Gen2:
1. Convert species index via `ConvertMon_1to2`
2. Reconstruct split SpAtk/SpDef from unified Special
3. Map catch rate to held item via `TimeCapsule_ReplaceTeruSama`
4. Set happiness=70, pokerus=0, caught data=0

---

## 6. Data Formats

### Gen2 Party Data Wire Format

Serialized by `Link_PrepPartyData_Gen2` (`engine/link/link.asm:869`). Total payload: 447 bytes (+ 6 byte preamble = 453 in `wLinkData`).

| Offset | Size | Content | Source |
|--------|------|---------|--------|
| 0-5 | 6 | Preamble: `$FD` x 6 | Generated |
| 6-16 | 11 | Player name | `wPlayerName` (`NAME_LENGTH`) |
| 17 | 1 | Party count | `wPartyCount` |
| 18-23 | 6 | Party species list | `wPartySpecies` |
| 24 | 1 | Species terminator (`$FF`) | `wPartyEnd` |
| 25-26 | 2 | Player ID | `wPlayerID` |
| 27-314 | 288 | 6 party mon structs | `wPartyMon1Species` (6 x 48 bytes) |
| 315-380 | 66 | 6 OT names | `wPartyMonOTs` (6 x 11 bytes) |
| 381-446 | 66 | 6 nicknames | `wPartyMonNicknames` (6 x 11 bytes) |
| 447-449 | 3 | Trailing bytes | (whatever follows in memory) |

### Gen1 Party Data Wire Format

Serialized by `Link_PrepPartyData_Gen1`. Total payload: 418 bytes (+ 6 byte preamble = 424).

| Offset | Size | Content |
|--------|------|---------|
| 0-5 | 6 | Preamble: `$FD` x 6 |
| 6-16 | 11 | Player name |
| 17 | 1 | Party count |
| 18-23 | 6 | Party species list (Gen1 indices) |
| 24 | 1 | Species terminator |
| 25-288 | 264 | 6 party mon structs (6 x 44 bytes, `REDMON_STRUCT_LENGTH`) |
| 289-354 | 66 | 6 OT names |
| 355-420 | 66 | 6 nicknames |
| 421-423 | 3 | Trailing bytes |

### Gen2 Party Mon Struct (48 bytes, `PARTYMON_STRUCT_LENGTH`)

Defined by the `party_struct` macro (`macros/ram.asm`). Each mon is 48 bytes = 32 bytes box data + 16 bytes party-only data.

Box portion (32 bytes):
| Offset | Size | Field |
|--------|------|-------|
| 0 | 1 | Species |
| 1 | 1 | Item |
| 2-5 | 4 | Moves (4 bytes) |
| 6-7 | 2 | OT ID |
| 8-10 | 3 | Experience |
| 11-12 | 2 | HP Stat Exp |
| 13-14 | 2 | Atk Stat Exp |
| 15-16 | 2 | Def Stat Exp |
| 17-18 | 2 | Spd Stat Exp |
| 19-20 | 2 | SpAtk Stat Exp |
| 21-24 | 4 | Move PP (4 bytes) |
| 25 | 1 | Happiness |
| 26 | 1 | Pokerus |
| 27-28 | 2 | Caught data (time, location) |
| 29-30 | 2 | DVs |
| 31 | 1 | Level |

Party-only portion (16 bytes):
| Offset | Size | Field |
|--------|------|-------|
| 32 | 1 | Status condition |
| 33 | 1 | Unused |
| 34-35 | 2 | Current HP |
| 36-37 | 2 | Max HP |
| 38-39 | 2 | Attack |
| 40-41 | 2 | Defense |
| 42-43 | 2 | Speed |
| 44-45 | 2 | Sp. Attack |
| 46-47 | 2 | Sp. Defense |

### Gen1 Party Mon Struct (44 bytes, `REDMON_STRUCT_LENGTH`)

| Offset | Size | Field |
|--------|------|-------|
| 0 | 1 | Species (Gen1 index) |
| 1-2 | 2 | Current HP |
| 3 | 1 | Unused ($00) |
| 4 | 1 | Status |
| 5-6 | 2 | Type 1, Type 2 |
| 7 | 1 | Catch rate |
| 8-11 | 4 | Moves |
| 12-13 | 2 | OT ID |
| 14-16 | 3 | Experience |
| 17-18 | 2 | HP Stat Exp |
| 19-20 | 2 | Atk Stat Exp |
| 21-22 | 2 | Def Stat Exp |
| 23-24 | 2 | Spd Stat Exp |
| 25-26 | 2 | Special Stat Exp |
| 27-28 | 2 | DVs |
| 29-32 | 4 | Move PP |
| 33 | 1 | Level |
| 34-35 | 2 | Max HP |
| 36-37 | 2 | Attack |
| 38-39 | 2 | Defense |
| 40-41 | 2 | Speed |
| 42-43 | 2 | Special |

### Random Number Data (17 bytes)

| Offset | Size | Content |
|--------|------|---------|
| 0-6 | 7 | Preamble: `$FD` x 7 (`SERIAL_RN_PREAMBLE_LENGTH`) |
| 7-16 | 10 | Random bytes, each < `$FD` (`SERIAL_RNS_LENGTH`) |

The RN bytes are used for battle RNG seeding. Generated by `FixDataForLinkTransfer` — each byte is rerolled if `>= $FD` to avoid collisions with special bytes.

### Patch List Format (200 bytes)

See [Section 7](#7-fe-patching-system) for details.

### Mail Wire Format

Serialized by `Link_PrepPartyData_Gen2` (Trade Center only).

**Outgoing (`wLinkPlayerMail`):**

| Offset | Size | Content |
|--------|------|---------|
| 0-4 | 5 | Preamble: `$20` x 5 (`SERIAL_MAIL_PREAMBLE_LENGTH`) |
| 5-202 | 198 | 6 mail messages (6 x 33 bytes, `MAIL_MSG_LENGTH` + 1) |
| 203-286 | 84 | 6 mail metadata (6 x 14 bytes, `MAIL_STRUCT_LENGTH` - 33) |
| 287-389 | 103 | Mail patch set (100 bytes + 3 byte preamble) |

**Key details:**
- `$FE` bytes in message bodies are replaced with `$21` (`SERIAL_MAIL_REPLACEMENT_BYTE`)
- `$FE` bytes in metadata are recorded in the mail patch set (offset list terminated by `$FF`)
- Messages and metadata are separated in the wire format but interleaved in SRAM (`sPartyMail`)
- After receiving, `$21` is restored to `$FE` in messages, and the patch set restores `$FE` in metadata
- European mail language conversion is applied based on `ParseMailLanguage`

---

## 7. $FE Patching System

### Problem

The byte values `$FD` and `$FE` have special meaning in the serial protocol:
- `$FE`: Interpreted as "no data" by `Serial_ExchangeByte`, causing retries
- `$FD`: Triggers sync detection in `Serial_ExchangeBytes`

These bytes can legitimately appear in party data (e.g., as stat values, experience bytes). They must be removed before transmission and restored after reception.

### Solution: Patch Lists

**`FixDataForLinkTransfer`** (`engine/link/link.asm:615`) scans the party data payload for `$FE` bytes, replaces each with `$FF`, and records the 1-based offset in a patch list.

**Patch area:** The patchable region starts after the preamble + player name + party header, covering the player ID and party mon structs. It is divided into two parts:

| Part | Covers | Offset Range | Max Size |
|------|--------|-------------|----------|
| data1 | First 252 bytes | Offsets 1-252 | `SERIAL_PATCH_DATA_SIZE` ($FC) |
| data2 | Remaining bytes | Offsets 1-N | Varies by format |

For Gen2: data2 covers `2 + 288 - 252 = 38` bytes (player ID + party mons beyond offset 252).
For Gen1 (Time Capsule): data2 covers `264 - 252 = 12` bytes.

**Patch list wire format** (`wPlayerPatchLists`, 200 bytes total):

```
Offset  Content
0-2     Preamble: $FD x 3 (SERIAL_PATCH_PREAMBLE_LENGTH)
3-9     Zero padding (7 bytes)
10+     Patch data:
          [data1 offsets... each is 1-based, 1 byte]
          [$FF terminator]
          [data2 offsets... each is 1-based, 1 byte]
          [$FF terminator]
          [remaining: $00 padding]
```

The first 3 bytes are `$FD` preamble. `FixDataForLinkTransfer` then clears the next 200 bytes to zero (slightly overrunning the 200-byte buffer into `wOTPatchLists`, which is overwritten by received data anyway). Patch offsets are written starting at byte 10 (`wPlayerPatchLists + SERIAL_RNS_LENGTH`), leaving bytes 3-9 as zero padding. The receiver's patch restoration loop skips `$00`, `$FD`, and `$FE` bytes, so the preamble and padding are harmlessly ignored.

### Receiver-Side Restoration

After receiving the patch list in `wOTPatchLists`, the receiver iterates through it:

```
for each byte in patch list:
  skip if $00, $FD, or $FE (control characters)
  if $FF: advance to next part (data2 base = wLinkPlayerData + SERIAL_PATCH_DATA_SIZE)
  else: wLinkPlayerData[offset - 1] = $FE  (restore the patched byte)
```

**Note on $FD in payload:** The code only patches `$FE` bytes, not `$FD`. Looking at the implementation, `$FD` bytes in the party data are NOT explicitly patched or handled. However, `$FD` bytes would be problematic during `Serial_ExchangeBytes` sync. In practice, `$FD` (253) is rare in game data — stat values rarely reach exactly 253, and the preamble sync mechanism is tolerant because it only triggers on the *first* `$FD` received while in ignoring mode. After sync is established, subsequent `$FD` bytes in the payload pass through normally.

---

## 8. In-Game Synchronization

### Nybble Exchange System

After the initial data exchange, the game enters an interactive trade/battle UI. All player actions are synchronized using the nybble exchange system (`WaitLinkTransfer` / `LinkTransfer`).

### Action Encoding

Each action is encoded as a single nybble (0-15) in `wPlayerLinkAction`. The high nybble identifies the link mode:

| Mode | High Nybble | Constant |
|------|-------------|----------|
| Time Capsule | `$60` | `SERIAL_TIMECAPSULE` |
| Trade Center | `$70` | `SERIAL_TRADECENTER` |
| Colosseum | `$80` | `SERIAL_BATTLE` |

Wire byte = `high_nybble | action_value`

The receiver validates the high nybble matches the expected mode before accepting the action. This prevents desynchronization if one player is in a different mode.

### Synchronization Flow

```
1. Sender: wPlayerLinkAction = action_value
2. call Serial_PlaceWaitingTextAndSyncAndExchangeNybble
     or call WaitLinkTransfer
3. Sender polls until wOtherPlayerLinkAction != $FF
4. After receiving: 10 more frames of receiving (settling)
5. Then 10 more frames of acknowledging (LinkDataReceived sends $00)
6. Final value in wOtherPlayerLinkMode
```

### Common Actions

| Value | Usage |
|-------|-------|
| `$0` | No action / idle |
| `$1` | Cancel / decline trade |
| `$2` | Confirm / accept trade |
| `$5` | Connection check phase 1 (used by `CheckLinkTimeout_Gen2`) |
| `$6` | Connection check phase 2 |

### `Link_EnsureSync`

**File:** `engine/link/link.asm:2638`

A more robust sync mechanism used during room selection. Encodes the sync value as `$D0 | value` and exchanges via `Serial_ExchangeSyncBytes`. The `$D0` high nybble serves as a validity marker — received bytes without `$D0` in the high nybble are rejected and the exchange retries.

---

## 9. Trade Execution

### Trade Flow (`LinkTrade`)

**File:** `engine/link/link.asm:1694`

When a player selects a Pokemon to trade:

1. **Confirmation dialog**: Ask "Trade X for Y?" with TRADE/CANCEL options
2. **Sync**: Exchange player's decision via nybble (`$1` = cancel, `$2` = accept)
3. If either player cancels: display "Too bad! The trade was canceled!" and return to trade menu

### Executing the Trade (`.do_trade`)

**File:** `engine/link/link.asm:1794`

If both players accept:

1. **Rearrange mail**: Shift mail entries to close the gap left by the traded Pokemon, copy received mail into the last slot
2. **Buffer trade data**: Save both player's and OT's trade Pokemon data (species, OT name, ID, DVs, caught data) for the trade animation
3. **Remove player's Pokemon**: `RemoveMonFromPartyOrBox` removes the traded mon from the party
4. **Add received Pokemon**: Copy OT mon struct to `wTempMon`, call `AddTempmonToParty`
5. **Force evolution check**: Set `wForceEvolution = TRUE`, call `EvolvePokemon`
6. **Trade animation**: `TradeAnimation` (Player 1) or `TradeAnimationPlayer2` (Player 2)
7. **Mew/Celebi checkbyte**: Exchange a check nybble indicating whether traded Pokemon was Mew (1) or Celebi (2) or neither (0). Loop until both sides agree. Purpose unclear — possibly anti-cheat, but non-functional.
8. **Save**: `SaveAfterLinkTrade`
9. **Display completion**: "Trade completed!"

### Re-exchange After Trade

**Critical detail:** After a trade is completed, the game **re-enters the full protocol from the beginning**:

```asm
.save
  ...
  ld a, [wLinkMode]
  cp LINK_TIMECAPSULE
  jp z, Gen2ToGen1LinkComms    ; re-enter Gen1 protocol
  jp Gen2ToGen2LinkComms       ; re-enter Gen2 protocol
```

This means after every successful trade:
1. Both parties are fully re-serialized with updated rosters
2. All serial exchanges (RNs, party data, patch lists, mail) happen again
3. Both sides receive the updated party data reflecting the completed trade
4. The trade UI is re-initialized

This ensures both games have consistent views of each other's parties after a trade. There is no incremental update mechanism — the entire protocol restarts.

---

## 10. WRAM Layout

### Key Buffers

#### `wLinkData` — Raw Link Buffer
**Location:** WRAM0, `SECTION UNION "Overworld Map"` (`ram/wram.asm:955`)
**Size:** 1300 bytes

Primary buffer for outgoing and incoming link data. Used in multiple phases:

1. **Outgoing**: `Link_PrepPartyData_Gen2` serializes player data here
2. **Incoming**: After receiving, `Link_CopyOTData` copies stripped data back here (overwriting outgoing data)
3. **Mail**: `wLinkPlayerMail` starts at offset 500, `wLinkOTMail` follows

After `Link_CopyOTData` copies stripped received data here, it has a structured view via UNION labels (all at the same base address as `wLinkData`):

| Label | Offset | Size | Content |
|-------|--------|------|---------|
| `wLinkPlayerName` | 0 | 11 | Player name |
| `wLinkPartyCount` | 11 | 1 | Party count |
| `wLinkPartySpecies` | 12 | 6 | Species list |
| `wLinkPartyEnd` | 18 | 1 | Terminator |
| `wLinkPlayerData` | 19 | — | Party data (base for patch list offsets) |
| `wLinkPlayerPartyMonOTs` | 307 | 66 | OT names (19 + 288) |
| `wLinkPlayerPartyMonNicknames` | 373 | 66 | Nicknames (19 + 288 + 66) |
| `wTimeCapsulePlayerData` | 19 | — | Same offset, Gen1 label (UNIONed) |

#### `wOTPartyData` — Final Enemy Party Storage
**Location:** WRAMX, `SECTION "Enemy Party"` (`ram/wram.asm:2739`)

Two UNIONs:

**Header UNION (29 bytes):**

| Label | Offset | Size |
|-------|--------|------|
| `wOTPlayerName` | 0 | 11 (`NAME_LENGTH`) |
| `wOTPlayerID` | 11 | 2 |
| (padding) | 13 | 8 |
| `wOTPartyCount` | 21 | 1 |
| `wOTPartySpecies` | 22 | 6 |
| `wOTPartyEnd` | 28 | 1 |

**Body UNION (420 bytes):**

| Label | Offset | Size |
|-------|--------|------|
| `wOTPartyMons` | 0 | 288 (6 x 48) |
| `wOTPartyMonOTs` | 288 | 66 (6 x 11) |
| `wOTPartyMonNicknames` | 354 | 66 (6 x 11) |

#### `wPlayerPatchLists` / `wOTPatchLists` — Patch Lists
**Location:** WRAM0, `SECTION UNION "Miscellaneous"` (`ram/wram.asm:622`)
**Size:** 200 bytes each (`SERIAL_PATCH_LIST_LENGTH`)

#### `wLinkBattleRNPreamble` / `wLinkBattleRNs` — Random Numbers
**Location:** WRAMX, `SECTION "More WRAM 1"` (`ram/wram.asm:2588`)
**Size:** 7 + 10 = 17 bytes

#### `wOTLinkBattleRNData` — Received Random Numbers
**Location:** WRAMX, UNIONed with `wEnemyMon` battle struct (`ram/wram.asm:2628`)
**Size:** 17 bytes

This UNION means the RN data and enemy battle struct share the same memory. The RN data is read and processed before battles begin, so there is no conflict.

#### Mail Buffers
**Location:** WRAM0, at `wLinkData + 500` (`ram/wram.asm:1026`)

| Label | Content |
|-------|---------|
| `wLinkPlayerMail` | Outgoing mail (preamble + messages + metadata + patchset) |
| `wLinkOTMail` | Received mail (messages + metadata + patchset + padding) |

#### HRAM Serial Variables
**Location:** HRAM (`ram/hram.asm:126`)

| Label | Size | Purpose |
|-------|------|---------|
| `hMobileReceive` | 1 | Mobile adapter flag |
| `hSerialReceivedNewData` | 1 | Set TRUE by ISR when transfer completes |
| `hSerialConnectionStatus` | 1 | `$01` (external), `$02` (internal), `$FF` (not established) |
| `hSerialIgnoringInitialData` | 1 | Preamble sync flag for `Serial_ExchangeBytes` |
| `hSerialSend` | 1 | Next byte to send (written to `rSB` by ISR) |
| `hSerialReceive` | 1 | Last byte received (read from `rSB` by ISR) |

#### Action Sync Variables
**Location:** WRAM0, `SECTION "Video"` (`ram/wram.asm:1491`)

| Label | Purpose |
|-------|---------|
| `wOtherPlayerLinkMode` | Raw received byte from `LinkTransfer` |
| `wOtherPlayerLinkAction` | Extracted low nybble (peer's action) |
| `wPlayerLinkAction` | Player's action to send |
| `wLinkReceivedSyncBuffer` | 5-byte buffer for `Serial_ExchangeSyncBytes` recv |
| `wLinkPlayerSyncBuffer` | 5-byte buffer for `Serial_ExchangeSyncBytes` send |

Note: `wOtherPlayerLinkMode` and `wLinkReceivedSyncBuffer` are UNIONed (share memory), as are `wPlayerLinkAction` and `wLinkPlayerSyncBuffer`. They are used at different protocol phases and never simultaneously.

---

## Appendix: Protocol Constants

```asm
; Link modes
LINK_NULL        EQU 0
LINK_TIMECAPSULE EQU 1
LINK_TRADECENTER EQU 2
LINK_COLOSSEUM   EQU 3
LINK_MOBILE      EQU 4

; Connection status
USING_EXTERNAL_CLOCK       EQU $01  ; Player 1
USING_INTERNAL_CLOCK       EQU $02  ; Player 2
CONNECTION_NOT_ESTABLISHED EQU $FF

; Special bytes
SERIAL_PREAMBLE_BYTE              EQU $FD
SERIAL_NO_DATA_BYTE               EQU $FE
SERIAL_PATCH_LIST_PART_TERMINATOR EQU $FF
SERIAL_PATCH_REPLACEMENT_BYTE     EQU $FF
SERIAL_MAIL_PREAMBLE_BYTE        EQU $20
SERIAL_MAIL_REPLACEMENT_BYTE     EQU $21

; Sizes
SERIAL_PREAMBLE_LENGTH       EQU 6
SERIAL_RN_PREAMBLE_LENGTH    EQU 7
SERIAL_PATCH_PREAMBLE_LENGTH EQU 3
SERIAL_RNS_LENGTH            EQU 10
SERIAL_PATCH_LIST_LENGTH     EQU 200
SERIAL_PATCH_DATA_SIZE       EQU $FC  ; 252
SERIAL_LINK_BYTE_TIMEOUT     EQU $5000

; Nybble high bytes
SERIAL_TIMECAPSULE EQU $60
SERIAL_TRADECENTER EQU $70
SERIAL_BATTLE      EQU $80

; Struct sizes
NAME_LENGTH            EQU 11
MON_NAME_LENGTH        EQU 11
PARTY_LENGTH           EQU 6
PARTYMON_STRUCT_LENGTH EQU 48
REDMON_STRUCT_LENGTH   EQU 44
MAIL_MSG_LENGTH        EQU 32
MAIL_STRUCT_LENGTH     EQU 47  ; 33 message + 14 metadata
```
