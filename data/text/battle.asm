BattleText:: ; used only for BANK(BattleText)

BattleText_PlayerPickedUpPayDayMoney:
	text "<PLAYER> nhặt được"
	line "¥@"
	text_decimal wPayDayMoney, 3, 6
	text "!"
	prompt

WildPokemonAppearedText:
	text "@"
	text_ram wEnemyMonNickname
	text " hoang"
	line "dã xuất hiện!"
	prompt

HookedPokemonAttackedText:
	text "@"
	text_ram wEnemyMonNickname
	text_start
	line "cắn câu tấn công!"
	prompt

PokemonFellFromTreeText:
	text_ram wEnemyMonNickname
	text " rơi"
	line "ra khỏi cây!"
	prompt

WildCelebiAppearedText:
	text "@"
	text_ram wEnemyMonNickname
	text " hoang"
	line "dã xuất hiện!"
	prompt

WantsToBattleText::
	text "<ENEMY>"
	line "muốn đấu!"
	prompt

BattleText_WildFled:
	text "@"
	text_ram wEnemyMonNickname
	text " hoang"
	line "dã chạy mất!"
	prompt

BattleText_EnemyFled:
	text "@"
	text_ram wEnemyMonNickname
	text " đ.thủ"
	line "đã chạy mất!"
	prompt

HurtByPoisonText:
	text "<USER>"
	line "bị ĐỘC làm đau!"
	prompt

HurtByBurnText:
	text "<USER>"
	line "bị BỎNG làm đau!"
	prompt

LeechSeedSapsText:
	text "KÝ SINH hút"
	line "<USER>!"
	prompt

HasANightmareText:
	text "<USER>"
	line "gặp ÁC MỘNG!"
	prompt

HurtByCurseText:
	text "<USER>"
	line "bị LỜI NGUYỀN"
	cont "làm đau!"
	prompt

SandstormHitsText:
	text "BÃO CÁT đánh"
	line "<USER>!"
	prompt

PerishCountText:
	text "Số DIỆT VONG của"
	line "<USER> là @"
	text_decimal wTextDecimalByte, 1, 1
	text "!"
	prompt

BattleText_TargetRecoveredWithItem:
	text "<TARGET>"
	line "hồi phục bằng"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

BattleText_UserRecoveredPPUsing:
	text "<USER>"
	line "hồi PP bằng"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

BattleText_TargetWasHitByFutureSight:
	text "<TARGET>"
	line "bị trúng TIÊN TRI!"
	prompt

BattleText_SafeguardFaded:
	text "BẢO HỘ của"
	line "<USER> tan!"
	prompt

BattleText_MonsLightScreenFell:
	text_ram wStringBuffer1
	text " #MON"
	line "MÀN SÁNG hết!"
	prompt

BattleText_MonsReflectFaded:
	text_ram wStringBuffer1
	text " #MON"
	line "PHẢN CHIẾU hết!"
	prompt

BattleText_RainContinuesToFall:
	text "Mưa vẫn tiếp tục"
	line "rơi."
	prompt

BattleText_TheSunlightIsStrong:
	text "Ánh nắng rất"
	line "mạnh."
	prompt

BattleText_TheSandstormRages:
	text "BÃO CÁT"
	line "hoành hành."
	prompt

BattleText_TheRainStopped:
	text "Mưa đã tạnh."
	prompt

BattleText_TheSunlightFaded:
	text "Ánh nắng"
	line "đã nhạt đi."
	prompt

BattleText_TheSandstormSubsided:
	text "BÃO CÁT"
	line "đã lắng xuống."
	prompt

BattleText_EnemyMonFainted:
	text "@"
	text_ram wEnemyMonNickname
	text " đ.thủ"
	line "đã gục!"
	prompt

GotMoneyForWinningText:
	text "<PLAYER> được ¥@"
	text_decimal wBattleReward, 3, 6
	text_start
	line "vì chiến thắng!"
	prompt

BattleText_EnemyWasDefeated:
	text "<ENEMY>"
	line "đã bị đánh bại!"
	prompt

TiedAgainstText:
	text "Hòa với"
	line "<ENEMY>!"
	prompt

SentSomeToMomText:
	text "<PLAYER> được ¥@"
	text_decimal wBattleReward, 3, 6
	text_start
	line "vì chiến thắng!"
	cont "Gửi một ít cho MẸ!"
	prompt

SentHalfToMomText:
	text "Gửi một nửa cho MẸ"
	prompt

SentAllToMomText:
	text "Gửi hết cho MẸ!"
	prompt

UnusedRivalLossText: ; unreferenced
	text "<RIVAL>: Hả? Đáng"
	line "ra tao phải chọn"
	cont "#MON của mày!"
	prompt

BattleText_MonFainted:
	text_ram wBattleMonNickname
	text_start
	line "đã gục!"
	prompt

BattleText_UseNextMon:
	text "Dùng #MON tiếp?"
	done

UnusedRivalWinText: ; unreferenced
	text "<RIVAL>: Được!"
	line "Tao đã chọn đúng"
	cont "#MON rồi!"
	prompt

LostAgainstText:
	text "Thua"
	line "<ENEMY>!"
	prompt

BattleText_EnemyIsAboutToUseWillPlayerChangeMon:
	text "<ENEMY>"
	line "sắp dùng"
	cont "@"
	text_ram wEnemyMonNickname
	text "."

	para "<PLAYER> có đổi"
	line "#MON không?"
	done

BattleText_EnemySentOut:
	text "<ENEMY>"
	line "gửi ra"
	cont "@"
	text_ram wEnemyMonNickname
	text "!"
	done

BattleText_TheresNoWillToBattle:
	text "Không còn ý chí"
	line "để chiến đấu!"
	prompt

BattleText_AnEGGCantBattle:
	text "TRỨNG không thể"
	line "chiến đấu!"
	prompt

BattleText_CantEscape2:
	text "Không thể chạy!"
	prompt

BattleText_TheresNoEscapeFromTrainerBattle:
	text "Không! Không thể"
	line "chạy khỏi trận"
	cont "đấu với HLV!"
	prompt

BattleText_GotAwaySafely:
	text "Thoát an toàn!"
	prompt

BattleText_UserFledUsingAStringBuffer1:
	text "<USER>"
	line "chạy thoát bằng"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_CantEscape:
	text "Không thể chạy!"
	prompt

BattleText_UserHurtBySpikes:
	text "<USER>"
	line "bị RẮC ĐINH đâm!"
	prompt

RecoveredUsingText:
	text "<TARGET>"
	line "hồi phục bằng"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UsersStringBuffer1Activated:
	text "@"
	text_ram wStringBuffer1
	text " của"
	line "<USER>"
	cont "đã kích hoạt!"
	prompt

BattleText_ItemsCantBeUsedHere:
	text "Không thể dùng"
	line "vật phẩm ở đây."
	prompt

BattleText_MonIsAlreadyOut:
	text_ram wBattleMonNickname
	text_start
	line "đã ra trận rồi."
	prompt

BattleText_MonCantBeRecalled:
	text_ram wBattleMonNickname
	text_start
	line "không rút về được!"
	prompt

BattleText_TheresNoPPLeftForThisMove:
	text "Chiêu này hết PP"
	line "rồi!"
	prompt

BattleText_TheMoveIsDisabled:
	text "Chiêu này đã bị"
	line "VÔ HIỆU!"
	prompt

BattleText_MonHasNoMovesLeft:
	text_ram wBattleMonNickname
	text_start
	line "không còn chiêu!"
	done

BattleText_TargetsEncoreEnded:
	text "HÒA CA của"
	line "<TARGET> hết!"
	prompt

BattleText_StringBuffer1GrewToLevel:
	text_ram wStringBuffer1
	text " lên cấp"
	line "@"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79
	text_end

	text_end ; unreferenced

BattleText_WildMonIsEating:
	text "@"
	text_ram wEnemyMonNickname
	text " hoang"
	line "dã đang ăn!"
	prompt

BattleText_WildMonIsAngry:
	text "@"
	text_ram wEnemyMonNickname
	text " hoang"
	line "dã đang giận!"
	prompt

FastAsleepText:
	text "<USER>"
	line "đang ngủ say!"
	prompt

WokeUpText:
	text "<USER>"
	line "thức dậy!"
	prompt

FrozenSolidText:
	text "<USER>"
	line "bị đóng băng!"
	prompt

FlinchedText:
	text "<USER>"
	line "bị khiếp sợ!"
	prompt

MustRechargeText:
	text "<USER>"
	line "phải nạp lại sức!"
	prompt

DisabledNoMoreText:
	text "<USER>"
	line "hết bị vô hiệu!"
	prompt

IsConfusedText:
	text "<USER>"
	line "đang bối rối!"
	prompt

HurtItselfText:
	text "Nó tự làm đau mình"
	line "vì bối rối!"
	prompt

ConfusedNoMoreText:
	text "<USER>"
	line "hết bối rối rồi!"
	prompt

BecameConfusedText:
	text "<TARGET>"
	line "bị bối rối!"
	prompt

BattleText_ItemHealedConfusion:
	text "@"
	text_ram wStringBuffer1
	text " giúp"
	line "<TARGET>"
	cont "hết bối rối."
	prompt

AlreadyConfusedText:
	text "<TARGET>"
	line "đã bối rối rồi!"
	prompt

BattleText_UsersHurtByStringBuffer1:
	text "<USER>"
	line "bị đau bởi"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UserWasReleasedFromStringBuffer1:
	text "<USER>"
	line "đã thoát khỏi"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

UsedBindText:
	text "<USER>"
	line "dùng SIẾT trói"
	cont "<TARGET>!"
	prompt

WhirlpoolTrapText:
	text "<TARGET>"
	line "bị mắc bẫy!"
	prompt

FireSpinTrapText:
	text "<TARGET>"
	line "bị mắc bẫy!"
	prompt

WrappedByText:
	text "<TARGET>"
	line "bị <USER>"
	cont "QUẤN!"
	prompt

ClampedByText:
	text "<TARGET>"
	line "bị <USER>"
	cont "KẸP CÀNG!"
	prompt

StoringEnergyText:
	text "<USER>"
	line "đang tích năng"
	cont "lượng!"
	prompt

UnleashedEnergyText:
	text "<USER>"
	line "giải phóng năng"
	cont "lượng!"
	prompt

HungOnText:
	text "<TARGET>"
	line "bám trụ bằng"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

EnduredText:
	text "<TARGET>"
	line "BỀN BỈ chịu đòn!"
	prompt

InLoveWithText:
	text "<USER>"
	line "đang yêu"
	cont "<TARGET>!"
	prompt

InfatuationText:
	text "Sự mê đắm làm"
	line "<USER> không"
	cont "tấn công được!"
	prompt

DisabledMoveText:
	text "@"
	text_ram wStringBuffer1
	text " của"
	line "<USER> bị"
	cont "VÔ HIỆU!"
	prompt

LoafingAroundText:
	text_ram wBattleMonNickname
	text " đang"
	line "lười biếng."
	prompt

BeganToNapText:
	text_ram wBattleMonNickname
	text " bắt"
	line "đầu ngủ gật!"
	prompt

WontObeyText:
	text_ram wBattleMonNickname
	text " không"
	line "nghe lời!"
	prompt

TurnedAwayText:
	text_ram wBattleMonNickname
	text " quay"
	line "mặt đi!"
	prompt

IgnoredOrdersText:
	text_ram wBattleMonNickname
	text " bỏ"
	line "qua lệnh!"
	prompt

IgnoredSleepingText:
	text_ram wBattleMonNickname
	text " bỏ qua"
	line "lệnh…đang ngủ!"
	prompt

NoPPLeftText:
	text "Nhưng không còn PP"
	line "cho chiêu này!"
	prompt

HasNoPPLeftText:
	text "<USER>"
	line "hết PP cho"
	cont "@"
	text_ram wStringBuffer2
	text "!"
	prompt

WentToSleepText:
	text "<USER>"
	line "đã đi ngủ!"
	done

RestedText:
	text "<USER>"
	line "ngủ và trở nên"
	cont "khỏe mạnh!"
	done

RegainedHealthText:
	text "<USER>"
	line "hồi phục sức khỏe!"
	prompt

AttackMissedText:
	text "Đòn tấn công của"
	line "<USER>"
	cont "trượt!"
	prompt

AttackMissed2Text:
	text "Đòn tấn công của"
	line "<USER>"
	cont "trượt!"
	prompt

CrashedText:
	text "<USER>"
	line "tiếp tục lao đi"
	cont "và đâm sầm!"
	prompt

UnaffectedText:
	text "<TARGET>"
	line "không bị tác động!"
	prompt

DoesntAffectText:
	text "Không có tác dụng"
	line "với <TARGET>!"
	prompt

CriticalHitText:
	text "Đòn chí mạng!"
	prompt

OneHitKOText:
	text "Hạ gục một đòn!"
	prompt

SuperEffectiveText:
	text "Rất hiệu quả!"
	prompt

NotVeryEffectiveText:
	text "Không hiệu quả"
	line "lắm…"
	prompt

TookDownWithItText:
	text "<TARGET>"
	line "kéo theo,"
	cont "<USER>!"
	prompt

RageBuildingText:
	text "NỔI GIẬN của"
	line "<USER> tăng!"
	prompt

GotAnEncoreText:
	text "<TARGET>"
	line "bị HÒA CA!"
	prompt

SharedPainText:
	text "Hai bên chia sẻ"
	line "nỗi đau!"
	prompt

TookAimText:
	text "<USER>"
	line "đã ngắm bắn!"
	prompt

SketchedText:
	text "<USER>"
	line "đã PHÁC THẢO"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

DestinyBondEffectText:
	text "<USER>"
	line "muốn kéo đối thủ"
	cont "theo cùng!"
	prompt

SpiteEffectText:
	text "@"
	text_ram wStringBuffer1
	text " của"
	line "<TARGET> giảm"
	cont "@"
	text_decimal wTextDecimalByte, 1, 1
	text "!"
	prompt

BellChimedText:
	text "Chuông reo!"
	line ""
	prompt

FellAsleepText:
	text "<TARGET>"
	line "đã ngủ thiếp đi!"
	prompt

AlreadyAsleepText:
	text "<TARGET>"
	line "đã ngủ rồi!"
	prompt

WasPoisonedText:
	text "<TARGET>"
	line "bị trúng độc!"
	prompt

BadlyPoisonedText:
	text "<TARGET>"
	line "bị trúng độc nặng!"
	prompt

AlreadyPoisonedText:
	text "<TARGET>"
	line "đã bị độc rồi!"
	prompt

SuckedHealthText:
	text "Hút máu từ"
	line "<TARGET>!"
	prompt

DreamEatenText:
	text "Giấc mơ của"
	line "<TARGET> bị ăn!"
	prompt

WasBurnedText:
	text "<TARGET>"
	line "bị bỏng!"
	prompt

DefrostedOpponentText:
	text "<TARGET>"
	line "đã tan băng!"
	prompt

WasFrozenText:
	text "<TARGET>"
	line "bị đóng băng!"
	prompt

WontRiseAnymoreText:
	text "@"
	text_ram wStringBuffer2
	text " của"
	line "<USER> không"
	cont "tăng thêm được!"
	prompt

WontDropAnymoreText:
	text "@"
	text_ram wStringBuffer2
	text " của"
	line "<TARGET> không"
	cont "giảm thêm được!"
	prompt

FledFromBattleText::
	text "<USER>"
	line "chạy khỏi trận!"
	prompt

FledInFearText:
	text "<TARGET>"
	line "chạy vì sợ hãi!"
	prompt

BlownAwayText:
	text "<TARGET>"
	line "bị thổi bay!"
	prompt

PlayerHitTimesText:
	text "Đánh @"
	text_decimal wPlayerDamageTaken, 1, 1
	text " lần!"
	prompt

EnemyHitTimesText:
	text "Đánh @"
	text_decimal wEnemyDamageTaken, 1, 1
	text " lần!"
	prompt

MistText:
	text "<USER>"
	line "phủ SƯƠNG MÙ!"
	prompt

ProtectedByMistText:
	text "<TARGET>"
	line "được SƯƠNG MÙ"
	cont "bảo vệ."
	prompt

GettingPumpedText:
	text_pause
	text "<USER>"
	line "đang hưng phấn!"
	prompt

RecoilText:
	text "<USER>"
	line "bị phản đòn!"
	prompt

MadeSubstituteText:
	text "<USER>"
	line "tạo THẾ THÂN!"
	prompt

HasSubstituteText:
	text "<USER>"
	line "có THẾ THÂN!"
	prompt

TooWeakSubText:
	text "Quá yếu để tạo"
	line "THẾ THÂN!"
	prompt

SubTookDamageText:
	text "THẾ THÂN chịu"
	line "sát thương thay"
	cont "<TARGET>!"
	prompt

SubFadedText:
	text "THẾ THÂN của"
	line "<TARGET> tan!"
	prompt

MimicLearnedMoveText:
	text "<USER>"
	line "học được"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

WasSeededText:
	text "<TARGET>"
	line "bị gieo hạt!"
	prompt

EvadedText:
	text "<TARGET>"
	line "né được đòn!"
	prompt

WasDisabledText:
	text "@"
	text_ram wStringBuffer1
	text " của"
	line "<TARGET> bị"
	cont "VÔ HIỆU!"
	prompt

CoinsScatteredText:
	text "Tiền xu rải khắp"
	line "nơi!"
	prompt

TransformedTypeText:
	text "<USER>"
	line "biến thành hệ"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

EliminatedStatsText:
	text "Mọi thay đổi chỉ"
	line "số bị xóa bỏ!"
	prompt

TransformedText:
	text "<USER>"
	line "BIẾN HÌNH thành"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

LightScreenEffectText:
	text "SP.DEF của"
	line "<USER> tăng!"
	prompt

ReflectEffectText:
	text "PHÒNG THỦ của"
	line "<USER> tăng!"
	prompt

NothingHappenedText:
	text "Nhưng không có gì"
	line "xảy ra."
	prompt

ButItFailedText:
	text "Nhưng thất bại!"
	prompt

ItFailedText:
	text "Thất bại!"
	prompt

DidntAffect1Text:
	text "Không có tác dụng"
	line "với <TARGET>!"
	prompt

DidntAffect2Text:
	text "Không có tác dụng"
	line "với <TARGET>!"
	prompt

HPIsFullText:
	text "HP của <USER>"
	line "đã đầy!"
	prompt

DraggedOutText:
	text "<USER>"
	line "bị kéo ra ngoài!"
	prompt

ParalyzedText:
	text "<TARGET>"
	line "bị tê liệt! Có thể"
	cont "không đánh được!"
	prompt

FullyParalyzedText:
	text "<USER>"
	line "tê liệt hoàn toàn!"
	prompt

AlreadyParalyzedText:
	text "<TARGET>"
	line "đã bị tê liệt rồi!"
	prompt

ProtectedByText:
	text "<TARGET>"
	line "được bảo vệ bởi"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

MirrorMoveFailedText:
	text "SAO CHÉP"
	next "thất bại!"
	prompt

StoleText:
	text "<USER>"
	line "cướp @"
	text_ram wStringBuffer1
	text_start
	cont "từ đối thủ!"
	prompt

CantEscapeNowText:
	text "<TARGET>"
	line "không thể chạy!"
	prompt

StartedNightmareText:
	text "<TARGET>"
	line "bắt đầu gặp"
	cont "ÁC MỘNG!"
	prompt

WasDefrostedText:
	text "<USER>"
	line "đã tan băng!"
	prompt

PutACurseText:
	text "<USER>"
	line "cắt HP của mình"

	para "và NGUYỀN RỦA"
	line "<TARGET>!"
	prompt

ProtectedItselfText:
	text "<USER>"
	line "BẢO VỆ bản thân!"
	prompt

ProtectingItselfText:
	text "<TARGET>"
	line "đang BẢO VỆ!"
	done

SpikesText:
	text "RẮC ĐINH rải khắp"
	line "xung quanh"
	cont "<TARGET>!"
	prompt

IdentifiedText:
	text "<USER>"
	line "nhận diện"
	cont "<TARGET>!"
	prompt

StartPerishText:
	text "Cả hai #MON sẽ"
	line "gục sau 3 lượt!"
	prompt

SandstormBrewedText:
	text "BÃO CÁT"
	line "nổi lên!"
	prompt

BracedItselfText:
	text "<USER>"
	line "đã chuẩn bị!"
	prompt

FellInLoveText:
	text "<TARGET>"
	line "đã phải lòng!"
	prompt

CoveredByVeilText:
	text "<USER>"
	line "được che bởi màn!"
	prompt

SafeguardProtectText:
	text "<TARGET>"
	line "được bảo vệ bởi"
	cont "BẢO HỘ!"
	prompt

MagnitudeText:
	text "Cường độ @"
	text_decimal wTextDecimalByte, 1, 1
	text "!"
	prompt

ReleasedByText:
	text "<USER>"
	line "được <TARGET>"
	cont "giải thoát!"
	prompt

ShedLeechSeedText:
	text "<USER>"
	line "rũ bỏ LEECH SEED!"
	prompt

BlewSpikesText:
	text "<USER>"
	line "thổi bay SPIKES!"
	prompt

DownpourText:
	text "Mưa lớn"
	line "bắt đầu!"
	prompt

SunGotBrightText:
	text "Ánh nắng mặt trời"
	line "trở nên chói!"
	prompt

BellyDrumText:
	text "<USER>"
	line "cắt HP và tối đa"
	cont "hóa TẤN CÔNG!"
	prompt

CopiedStatsText:
	text "<USER>"
	line "sao chép thay đổi"

	para "chỉ số của"
	line "<TARGET>!"
	prompt

ForesawAttackText:
	text "<USER>"
	line "thấy trước đòn"
	cont "tấn công!"
	prompt

BeatUpAttackText:
	text_ram wStringBuffer1
	text ""
	line "tấn công!"
	done

PresentFailedText:
	text "<TARGET>"
	line "từ chối quà!"
	prompt

IgnoredOrders2Text:
	text "<USER>"
	line "bỏ qua lệnh!"
	prompt

BattleText_LinkErrorBattleCanceled:
	text "Lỗi kết nối…"

	para "Trận đấu đã bị"
	line "hủy bỏ…"
	prompt

BattleText_NoTimeLeftToday: ; unreferenced
	text "Hôm nay không còn"
	line "thời gian!"
	done
