MACRO landmark
; x, y, name
	db \1 + 8, \2 + 16
	dw \3
ENDM

; Landmark names must be within 18 characters total.
; <BSP> is a line break and counts as 1 character.

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

NewBarkTownName:     db "THỊ TRẤN<BSP>WAKABA@"
CherrygroveCityName: db "TP.<BSP>YOSHINO@"
VioletCityName:      db "TP.<BSP>KIKYO@"
AzaleaTownName:      db "THỊ TRẤN<BSP>HIWADA@"
GoldenrodCityName:   db "TP.<BSP>KOGANE@"
EcruteakCityName:    db "TP.<BSP>ENJU@"
OlivineCityName:     db "TP.<BSP>ASAGI@"
CianwoodCityName:    db "TP.<BSP>TANBA@"
MahoganyTownName:    db "THỊ TRẤN<BSP>CHOUJI@"
BlackthornCityName:  db "TP.<BSP>FUSUBE@"
LakeOfRageName:      db "HỒ<BSP>GYARADOS@"
SilverCaveName:      db "HANG NÚI<BSP>BẠC@"
SproutTowerName:     db "THÁP<BSP>MADATSUBOMI@"
RuinsOfAlphName:     db "TÀN TÍCH<BSP>ALPH@"
UnionCaveName:       db "HANG ĐỘNG<BSP>UNION@"
SlowpokeWellName:    db "GIẾNG<BSP>SLOWPOKE@"
RadioTowerName:      db "THÁP<BSP>RADIO@"
PowerPlantName:      db "NHÀ MÁY<BSP>ĐIỆN@"
NationalParkName:    db "VƯỜN<BSP>QUỐC GIA@"
TinTowerName:        db "THÁP<BSP>CHUÔNG@"
LighthouseName:      db "HẢI ĐĂNG@"
WhirlIslandsName:    db "QUẦN ĐẢO<BSP>NƯỚC XOÁY@"
MtMortarName:        db "NÚI<BSP>SURIBACHI@"
DragonsDenName:      db "HANG<BSP>RỒNG@"
IcePathName:         db "LỐI<BSP>BĂNG@"
NotApplicableName:   db "N/A@" ; unreferenced ; "オバケやしき" ("HAUNTED HOUSE") in Japanese
PalletTownName:      db "THỊ TRẤN<BSP>MASARA@"
ViridianCityName:    db "TP.<BSP>TOKIWA@"
PewterCityName:      db "TP.<BSP>NIBI@"
CeruleanCityName:    db "TP.<BSP>HANADA@"
LavenderTownName:    db "THỊ TRẤN<BSP>SHION@"
VermilionCityName:   db "TP.<BSP>KUCHIBA@"
CeladonCityName:     db "TP.<BSP>TAMAMUSHI@"
SaffronCityName:     db "TP.<BSP>YAMABUKI@"
FuchsiaCityName:     db "TP.<BSP>SEKICHIKU@"
CinnabarIslandName:  db "ĐẢO<BSP>GUREN@"
IndigoPlateauName:   db "CAO NGUYÊN<BSP>SEKIEI@"
VictoryRoadName:     db "LỐI<BSP>VINH QUANG@"
MtMoonName:          db "NÚI M.TRĂNG@"
RockTunnelName:      db "ĐƯỜNG HẦM<BSP>ĐÁ@"
LavRadioTowerName:   db "ĐÀI RADIO<BSP>SHION@"
SilphCoName:         db "SILPH CO.@" ; unreferenced
SafariZoneName:      db "KHU SAFARI@" ; unreferenced
SeafoamIslandsName:  db "ĐẢO BỌT BIỂN@"
PokemonMansionName:  db "DINH THỰ<BSP>#MON@" ; unreferenced
CeruleanCaveName:    db "ĐỘNG<BSP>HANADA@" ; unreferenced
Route1Name:          db "ĐƯỜNG<BSP>1@"
Route2Name:          db "ĐƯỜNG<BSP>2@"
Route3Name:          db "ĐƯỜNG<BSP>3@"
Route4Name:          db "ĐƯỜNG<BSP>4@"
Route5Name:          db "ĐƯỜNG<BSP>5@"
Route6Name:          db "ĐƯỜNG<BSP>6@"
Route7Name:          db "ĐƯỜNG<BSP>7@"
Route8Name:          db "ĐƯỜNG<BSP>8@"
Route9Name:          db "ĐƯỜNG<BSP>9@"
Route10Name:         db "ĐƯỜNG<BSP>10@"
Route11Name:         db "ĐƯỜNG<BSP>11@"
Route12Name:         db "ĐƯỜNG<BSP>12@"
Route13Name:         db "ĐƯỜNG<BSP>13@"
Route14Name:         db "ĐƯỜNG<BSP>14@"
Route15Name:         db "ĐƯỜNG<BSP>15@"
Route16Name:         db "ĐƯỜNG<BSP>16@"
Route17Name:         db "ĐƯỜNG<BSP>17@"
Route18Name:         db "ĐƯỜNG<BSP>18@"
Route19Name:         db "ĐƯỜNG<BSP>19@"
Route20Name:         db "ĐƯỜNG<BSP>20@"
Route21Name:         db "ĐƯỜNG<BSP>21@"
Route22Name:         db "ĐƯỜNG<BSP>22@"
Route23Name:         db "ĐƯỜNG<BSP>23@"
Route24Name:         db "ĐƯỜNG<BSP>24@"
Route25Name:         db "ĐƯỜNG<BSP>25@"
Route26Name:         db "ĐƯỜNG<BSP>26@"
Route27Name:         db "ĐƯỜNG<BSP>27@"
Route28Name:         db "ĐƯỜNG<BSP>28@"
Route29Name:         db "ĐƯỜNG<BSP>29@"
Route30Name:         db "ĐƯỜNG<BSP>30@"
Route31Name:         db "ĐƯỜNG<BSP>31@"
Route32Name:         db "ĐƯỜNG<BSP>32@"
Route33Name:         db "ĐƯỜNG<BSP>33@"
Route34Name:         db "ĐƯỜNG<BSP>34@"
Route35Name:         db "ĐƯỜNG<BSP>35@"
Route36Name:         db "ĐƯỜNG<BSP>36@"
Route37Name:         db "ĐƯỜNG<BSP>37@"
Route38Name:         db "ĐƯỜNG<BSP>38@"
Route39Name:         db "ĐƯỜNG<BSP>39@"
Route40Name:         db "ĐƯỜNG<BSP>40@"
Route41Name:         db "ĐƯỜNG<BSP>41@"
Route42Name:         db "ĐƯỜNG<BSP>42@"
Route43Name:         db "ĐƯỜNG<BSP>43@"
Route44Name:         db "ĐƯỜNG<BSP>44@"
Route45Name:         db "ĐƯỜNG<BSP>45@"
Route46Name:         db "ĐƯỜNG<BSP>46@"
DarkCaveName:        db "HANG<BSP>TỐI@"
IlexForestName:      db "RỪNG<BSP>UBAME@"
BurnedTowerName:     db "THÁP<BSP>CHÁY@"
FastShipName:        db "TÀU CAO TỐC@"
ViridianForestName:  db "RỪNG<BSP>TOKIWA@" ; unreferenced
DiglettsCaveName:    db "ĐỘNG<BSP>DIGLETT@"
TohjoFallsName:      db "THÁC<BSP>TOHJO@"
UndergroundName:     db "HẦM NGẦM@"
BattleTowerName:     db "THÁP<BSP>CHIẾN ĐẤU@"
SpecialMapName:      db "ĐẶC BIỆT@"
