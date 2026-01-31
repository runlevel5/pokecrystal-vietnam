MACRO landmark
; x, y, name
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks:
; entries correspond to constants/landmark_constants.asm
	table_width 4
	landmark  -8, -16, SpecialMapName
	landmark 140, 100, NewBarkTownName
	landmark 128, 100, Route29Name
	landmark 100, 100, CherrygroveCityName
	landmark 100,  80, Route30Name
	landmark  96,  60, Route31Name
	landmark  84,  60, VioletCityName
	landmark  85,  58, SproutTowerName
	landmark  84,  92, Route32Name
	landmark  76,  76, RuinsOfAlphName
	landmark  84, 124, UnionCaveName
	landmark  82, 124, Route33Name
	landmark  68, 124, AzaleaTownName
	landmark  70, 122, SlowpokeWellName
	landmark  52, 120, IlexForestName
	landmark  52, 112, Route34Name
	landmark  52,  92, GoldenrodCityName
	landmark  50,  92, RadioTowerName
	landmark  52,  76, Route35Name
	landmark  52,  60, NationalParkName
	landmark  64,  60, Route36Name
	landmark  68,  52, Route37Name
	landmark  68,  44, EcruteakCityName
	landmark  70,  42, TinTowerName
	landmark  66,  42, BurnedTowerName
	landmark  52,  44, Route38Name
	landmark  36,  48, Route39Name
	landmark  36,  60, OlivineCityName
	landmark  38,  62, LighthouseName
	landmark  28,  56, BattleTowerName
	landmark  28,  64, Route40Name
	landmark  28,  92, WhirlIslandsName
	landmark  28, 100, Route41Name
	landmark  20, 100, CianwoodCityName
	landmark  92,  44, Route42Name
	landmark  84,  44, MtMortarName
	landmark 108,  44, MahoganyTownName
	landmark 108,  36, Route43Name
	landmark 108,  28, LakeOfRageName
	landmark 120,  44, Route44Name
	landmark 130,  38, IcePathName
	landmark 132,  44, BlackthornCityName
	landmark 132,  36, DragonsDenName
	landmark 132,  64, Route45Name
	landmark 112,  72, DarkCaveName
	landmark 124,  88, Route46Name
	landmark 148,  68, SilverCaveName
	assert_table_length KANTO_LANDMARK
	landmark  52, 108, PalletTownName
	landmark  52,  92, Route1Name
	landmark  52,  76, ViridianCityName
	landmark  52,  64, Route2Name
	landmark  52,  52, PewterCityName
	landmark  64,  52, Route3Name
	landmark  76,  52, MtMoonName
	landmark  88,  52, Route4Name
	landmark 100,  52, CeruleanCityName
	landmark 100,  44, Route24Name
	landmark 108,  36, Route25Name
	landmark 100,  60, Route5Name
	landmark 108,  76, UndergroundName
	landmark 100,  76, Route6Name
	landmark 100,  84, VermilionCityName
	landmark  88,  60, DiglettsCaveName
	landmark  88,  68, Route7Name
	landmark 116,  68, Route8Name
	landmark 116,  52, Route9Name
	landmark 132,  52, RockTunnelName
	landmark 132,  56, Route10Name
	landmark 132,  60, PowerPlantName
	landmark 132,  68, LavenderTownName
	landmark 140,  68, LavRadioTowerName
	landmark  76,  68, CeladonCityName
	landmark 100,  68, SaffronCityName
	landmark 116,  84, Route11Name
	landmark 132,  80, Route12Name
	landmark 124, 100, Route13Name
	landmark 116, 112, Route14Name
	landmark 104, 116, Route15Name
	landmark  68,  68, Route16Name
	landmark  68,  92, Route17Name
	landmark  80, 116, Route18Name
	landmark  92, 116, FuchsiaCityName
	landmark  92, 128, Route19Name
	landmark  76, 132, Route20Name
	landmark  68, 132, SeafoamIslandsName
	landmark  52, 132, CinnabarIslandName
	landmark  52, 120, Route21Name
	landmark  36,  68, Route22Name
	landmark  28,  52, VictoryRoadName
	landmark  28,  44, Route23Name
	landmark  28,  36, IndigoPlateauName
	landmark  28,  92, Route26Name
	landmark  20, 100, Route27Name
	landmark  12, 100, TohjoFallsName
	landmark  20,  68, Route28Name
	landmark 140, 116, FastShipName
	assert_table_length NUM_LANDMARKS

NewBarkTownName:     db "TRẤN NEW BARK@"
CherrygroveCityName: db "TP.<BSP>CHERRYGROVE@"
VioletCityName:      db "TP. VIOLET@"
AzaleaTownName:      db "TRẤN AZALEA@"
GoldenrodCityName:   db "TP.<BSP>GOLDENROD@"
EcruteakCityName:    db "TP.<BSP>ECRUTEAK@"
OlivineCityName:     db "TP.<BSP>OLIVINE@"
CianwoodCityName:    db "TP.<BSP>CIANWOOD@"
MahoganyTownName:    db "TRẤN<BSP>MAHOGANY@"
BlackthornCityName:  db "TP.<BSP>BLACKTHORN@"
LakeOfRageName:      db "HỒ RAGE@"
SilverCaveName:      db "HANG BẠC@"
SproutTowerName:     db "THÁP<BSP>SPROUT@"
RuinsOfAlphName:     db "TÀN TÍCH<BSP>ALPH@"
UnionCaveName:       db "ĐỘNG UNION@"
SlowpokeWellName:    db "GIẾNG<BSP>SLOWPOKE@"
RadioTowerName:      db "THÁP RADIO@"
PowerPlantName:      db "NHÀ MÁY ĐIỆN@"
NationalParkName:    db "CV.<BSP>QUỐC GIA@"
TinTowerName:        db "THÁP THIẾC@"
LighthouseName:      db "HẢI ĐĂNG@"
WhirlIslandsName:    db "Q.ĐẢO<BSP>WHIRL@"
MtMortarName:        db "NÚI MORTAR@"
DragonsDenName:      db "HANG<BSP>RỒNG@"
IcePathName:         db "LỐI BĂNG@"
NotApplicableName:   db "N/A@" ; unreferenced ; "オバケやしき" ("HAUNTED HOUSE") in Japanese
PalletTownName:      db "TRẤN PALLET@"
ViridianCityName:    db "TP.<BSP>VIRIDIAN@"
PewterCityName:      db "TP. PEWTER@"
CeruleanCityName:    db "TP.<BSP>CERULEAN@"
LavenderTownName:    db "TRẤN<BSP>LAVENDER@"
VermilionCityName:   db "TP.<BSP>VERMILION@"
CeladonCityName:     db "TP.<BSP>CELADON@"
SaffronCityName:     db "TP.<BSP>SAFFRON@"
FuchsiaCityName:     db "TP.<BSP>FUCHSIA@"
CinnabarIslandName:  db "ĐẢO<BSP>CINNABAR@"
IndigoPlateauName:   db "CAO NGUYÊN<BSP>INDIGO@"
VictoryRoadName:     db "ĐƯỜNG<BSP>C.THẮNG@"
MtMoonName:          db "NÚI MOON@"
RockTunnelName:      db "ĐƯỜNG HẦM ĐÁ@"
LavRadioTowerName:   db "THÁP RADIO<BSP>LAV@"
SilphCoName:         db "SILPH CO.@" ; unreferenced
SafariZoneName:      db "KHU SAFARI@" ; unreferenced
SeafoamIslandsName:  db "Q.ĐẢO<BSP>SEAFOAM@"
PokemonMansionName:  db "DINH THỰ<BSP>#MON@" ; unreferenced
CeruleanCaveName:    db "ĐỘNG<BSP>CERULEAN@" ; unreferenced
Route1Name:          db "TUYẾN ĐƯỜNG 1@"
Route2Name:          db "TUYẾN ĐƯỜNG 2@"
Route3Name:          db "TUYẾN ĐƯỜNG 3@"
Route4Name:          db "TUYẾN ĐƯỜNG 4@"
Route5Name:          db "TUYẾN ĐƯỜNG 5@"
Route6Name:          db "TUYẾN ĐƯỜNG 6@"
Route7Name:          db "TUYẾN ĐƯỜNG 7@"
Route8Name:          db "TUYẾN ĐƯỜNG 8@"
Route9Name:          db "TUYẾN ĐƯỜNG 9@"
Route10Name:         db "TUYẾN ĐƯỜNG 10@"
Route11Name:         db "TUYẾN ĐƯỜNG 11@"
Route12Name:         db "TUYẾN ĐƯỜNG 12@"
Route13Name:         db "TUYẾN ĐƯỜNG 13@"
Route14Name:         db "TUYẾN ĐƯỜNG 14@"
Route15Name:         db "TUYẾN ĐƯỜNG 15@"
Route16Name:         db "TUYẾN ĐƯỜNG 16@"
Route17Name:         db "TUYẾN ĐƯỜNG 17@"
Route18Name:         db "TUYẾN ĐƯỜNG 18@"
Route19Name:         db "TUYẾN ĐƯỜNG 19@"
Route20Name:         db "TUYẾN ĐƯỜNG 20@"
Route21Name:         db "TUYẾN ĐƯỜNG 21@"
Route22Name:         db "TUYẾN ĐƯỜNG 22@"
Route23Name:         db "TUYẾN ĐƯỜNG 23@"
Route24Name:         db "TUYẾN ĐƯỜNG 24@"
Route25Name:         db "TUYẾN ĐƯỜNG 25@"
Route26Name:         db "TUYẾN ĐƯỜNG 26@"
Route27Name:         db "TUYẾN ĐƯỜNG 27@"
Route28Name:         db "TUYẾN ĐƯỜNG 28@"
Route29Name:         db "TUYẾN ĐƯỜNG 29@"
Route30Name:         db "TUYẾN ĐƯỜNG 30@"
Route31Name:         db "TUYẾN ĐƯỜNG 31@"
Route32Name:         db "TUYẾN ĐƯỜNG 32@"
Route33Name:         db "TUYẾN ĐƯỜNG 33@"
Route34Name:         db "TUYẾN ĐƯỜNG 34@"
Route35Name:         db "TUYẾN ĐƯỜNG 35@"
Route36Name:         db "TUYẾN ĐƯỜNG 36@"
Route37Name:         db "TUYẾN ĐƯỜNG 37@"
Route38Name:         db "TUYẾN ĐƯỜNG 38@"
Route39Name:         db "TUYẾN ĐƯỜNG 39@"
Route40Name:         db "TUYẾN ĐƯỜNG 40@"
Route41Name:         db "TUYẾN ĐƯỜNG 41@"
Route42Name:         db "TUYẾN ĐƯỜNG 42@"
Route43Name:         db "TUYẾN ĐƯỜNG 43@"
Route44Name:         db "TUYẾN ĐƯỜNG 44@"
Route45Name:         db "TUYẾN ĐƯỜNG 45@"
Route46Name:         db "TUYẾN ĐƯỜNG 46@"
DarkCaveName:        db "HANG TỐI@"
IlexForestName:      db "RỪNG<BSP>ILEX@"
BurnedTowerName:     db "THÁP<BSP>CHÁY@"
FastShipName:        db "TÀU NHANH@"
ViridianForestName:  db "RỪNG<BSP>VIRIDIAN@" ; unreferenced
DiglettsCaveName:    db "ĐỘNG<BSP>DIGLETT@"
TohjoFallsName:      db "THÁC TOHJO@"
UndergroundName:     db "HẦM NGẦM@"
BattleTowerName:     db "THÁP<BSP>ĐẤU@"
SpecialMapName:      db "ĐẶC BIỆT@"
