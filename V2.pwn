/*
This Is The Mode`s, (xDeatchMatchx+5) Built by - Roy_Killer ('JoeShk'),
for `SATLA-ZONE.co.il` Data Of Build `dd/mm/yyyy`
the is create by roy.
*/
//=["inclued"]=============================================================
#include "a_samp.inc"
#include "dini.inc"
#include "cpstream"
#include "MidoStream"
#include "a_players.inc"
//=[Unused]====================================================================
#pragma unused ret_memcpy
#pragma unused RegisterPlayer
//=[Pragma/Dcmd/Dynamic]=======================================================
#pragma tabsize 0
#pragma dynamic 145000
#define dcmd(%1,%2,%3) if ((strcmp((%3)[1], #%1, true, (%2)) == 0) && ((((%3)[(%2) + 1] == 0) && (dcmd_%1(playerid, "")))||(((%3)[(%2) + 1] == 32) && (dcmd_%1(playerid, (%3)[(%2) + 2]))))) return 1 // dcmd
//=[Color`s]======================================================================
#define COLOR_BRIGHTRED 0xFF0000AA
#define COLOR_MEDBLUE 0x0099FFFF
#define COLOR_LIGHTGREEN 0x097C4FF
#define COLOR_AQUA 0xFF0000F
#define COLOR_PEACH 0xFF0000F
#define gg 0xFF0000F
#define COLOR_GREY 0xAFAFAFAA
#define COLOR_RED 0xFFFFFFAA
#define COLOR_PINK 0xFF66FFAA
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
#define COLOR_PINK 0xFF66FFAA
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
TimeOnServer,ProfileLogged,CcMode,Supportives,CarID,OwnCar
};
//=[ConfigEnums]===============================================================
enum ConfigEnum
{
MinPasswordLength,MaxPasswordLength,MaxFailedLogins,
CL_register,CL_login,CL_changenick,CL_changepass,CL_ChangeIcq
};
//=[Variables]==================================================================
stock PlayerInfo[MAX_PLAYERS][PlayerInfoData],Config[ConfigEnum];
//==[Sniper`system]=============================================================
new HpModeA[MAX_PLAYERS] = 0;
new hpmodebug[MAX_PLAYERS];
//=[Checkpoint`s,New`s]=========================================================
new CheckPointTimer;
new be;
new nobank;
new gateb;
new bcp;
new Wang;
//=[WeedSystem]=================================================================
#define WeedCost 1000
#define MAX_WEED 5
new Stoned[MAX_PLAYERS];
new PS[MAX_PLAYERS];
new CB[MAX_PLAYERS];
new offerweed[MAX_PLAYERS][MAX_PLAYERS];
new Weed[MAX_WEED];
//=Checkpoints==================================================================
#define CP_BANK	0
#define CP_PIRATE			1
#define CP_AMMU				2
#define CP_DRAGON			3
#define CP_CALIGULA			4
#define CP_SEXSHOP			5
#define CP_BAR				6
#define CP_ZIP				7
#define CP_BINCO			8
#define CP_TATOO			9
#define CP_BOTIQUE			10
#define CP_STRIPCLUB		11
#define CP_AIRSTRIP			12
#define CP_EMERALD			13
#define CP_VISAGE			14
#define CP_SPREADRANCH		15
#define CP_WANGEXPORTS		16
#define CP_LC 17
#define CP_BankP 18
//=Properties===================================================================
#define P_DRAGON			0
#define P_CALIGULA			1
#define P_SEXSHOP			2
#define P_BAR				3
#define P_ZIP				4
#define P_BINCO				5
#define P_TATOO				6
#define P_BOTIQUE			7
#define P_STRIPCLUB			8
#define P_AIRSTRIP   9
#define P_EMERALD   10
#define P_VISAGE   11
#define P_SPREADRANCH		12
#define P_LC 13
#define P_BankP 14
#define COLOR_YELLOW 0xECF60FF

new playername[MAX_PLAYER_NAME];
new antianti[MAX_PLAYERS];
new CashScoreOld;
new iSpawnSet[MAX_PLAYERS];
new bank[MAX_PLAYERS];
new bounty[MAX_PLAYERS];
new playerCheckpoint[MAX_PLAYERS];
new savePos;
//=[Weapons]====================
new file[256];
new pName[MAX_PLAYER_NAME];
new S2W[256];
new S2A[256];
new S3W[256];
new S3A[265];
new S4W[256];
new S4A[265];
new S5W[256];
new S5A[256];
new S6W[256];
new S6A[256];


new mini[MAX_PLAYERS];
new ClickedBm[MAX_PLAYERS];



//PlayerColor`S
new playerColors[100] = {
0xFF8C13FF,0xC715FFFF,0x20B2AAFF,0xDC143CFF,0x6495EDFF,0xf0e68cFF,0x778899FF,0xFF1493FF,0xF4A460FF,0xEE82EEFF,0xFFD720FF,
0x8b4513FF,0x4949A0FF,0x148b8bFF,0x14ff7fFF,0x556b2fFF,0x0FD9FAFF,0x10DC29FF,0x534081FF,0x0495CDFF,0xEF6CE8FF,0xBD34DAFF,
0x247C1BFF,0x0C8E5DFF,0x635B03FF,0xCB7ED3FF,0x65ADEBFF,0x5C1ACCFF,0xF2F853FF,0x11F891FF,0x7B39AAFF,0x53EB10FF,0x54137DFF,
0x275222FF,0xF09F5BFF,0x3D0A4FFF,0x22F767FF,0xD63034FF,0x9A6980FF,0xDFB935FF,0x3793FAFF,0x90239DFF,0xE9AB2FFF,0xAF2FF3FF,
0x057F94FF,0xB98519FF,0x388EEAFF,0x028151FF,0xA55043FF,0x0DE018FF,0x93AB1CFF,0x95BAF0FF,0x369976FF,0x18F71FFF,0x4B8987FF,
0x491B9EFF,0x829DC7FF,0xBCE635FF,0xCEA6DFFF,0x20D4ADFF,0x2D74FDFF,0x3C1C0DFF,0x12D6D4FF,0x2A51E2FF,0xE3AC12FF,
0xFC42A8FF,0x2FC827FF,0x1A30BFFF,0xB740C2FF,0x42ACF5FF,0x2FD9DEFF,0xFAFB71FF,0x05D1CDFF,0xC471BDFF,0x94436EFF,0xC1F7ECFF,
0xCE79EEFF,0xBD1EF2FF,0x93B7E4FF,0x3214AAFF,0x184D3BFF,0xAE4B99FF,0x7E49D7FF,0x4C436EFF,0xFA24CCFF,0xCE76BEFF,0xA04E0AFF,
0x9F945CFF,0xDCDE3DFF,0x10C9C5FF,0x70524DFF,0x0BE472FF,0x8A2CD7FF,0x6152C2FF,0xCF72A9FF,0xE59338FF,0xEEDC2DFF,0xD8C762FF,
0x3FE65CFF
};

enum SavePlayerPosEnum {
Float:LastX,
Float:LastY,
Float:LastZ
}


forward PayPlayerInArea(playerID, Float:x1, Float:y1, Float:x2, Float:y2, cash);
forward isPlayerInArea(playerID, Float:data[4]);
forward TimeUpdate();
forward getCheckpointType(playerID);

forward checkpointUpdate();






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
{-1132.9607,1028.6680,1345.7377},{-1128.3600,1095.9415,1345.7709},
{-1098.6946,1098.4323,1341.1632},{-1071.4646,1088.1956,1346.0206},
{-1039.4835,1100.4468,1343.1393},{-1043.1943,1041.5938,1341.3516},
{-1020.2195,1051.2196,1345.9545},{-973.8190,1060.5537,1345.6772},
{-973.6674,1027.6255,1345.0448},{-1019.2279,1071.8867,1347.4093},
{-974.3493,1089.1172,1344.9795},{-1009.8291,1080.3978,1341.0828},
{-1046.0696,1023.0779,1343.0669},{-1072.4380,1031.8779,1342.9623},
{-1104.6825,1097.2749,1341.8513},{-1129.6497,1019.8154,1345.6614}
,{-1064.0248,1032.7473,1344.5297},{-1054.4865,1058.6794,1341.3516},
{-1085.3271,1019.7804,1342.7926},{-1025.9915,1066.3752,1343.8276}
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
#define MAX_POINTS 19
new Float:checkCoords[MAX_POINTS][4] =
{
{-36.5483,-57.9948, -17.2655,-49.2967},			// Bank
{1894.6128,1445.3431, 2084.9739,1637.8186},		// Pirate
{284.0546,-86.4384, 302.9315,-56.6674},			// Ammunation
{1925.1511,968.2358, 2019.0715,1067.4276},		// FourDragons
{-115.9544,-24.2706, -99.1631,-7.1391},			// SexShop
{487.6558,-88.5900, 512.0635, -67.7503},		// Bar
{2216.7971,1638.0493, 2255.2097,1714.0806},		// Caligula
{144.9131,-96.0927, 177.4128,-70.7923},			// Zip
{201.4462,-112.4556, 218.5237,-95.1238},		// BincoShop
{-204.7623,-44.0326, -200.2330,-39.8128},		// Tatoo
{416.7485,-84.4242, 422.6890,-74.0611},			// Botique
{1201.1422,-16.6343,1223.4420,12.6656},     	// StripClub
{413.4203,2534.9907,421.4078,2542.7031},    	// AirStrip
{2099.1985,2328.5200,2179.1382,2405.8721},  	// EmeraldIsle
{1998.3783,1875.9679,2066.3425,1957.0034},  	// TheVisage
{-1924.2008,245.8384,-1897.2331,210.0660},//Wang
{1205.7026,-41.1453,1216.8755,-23.9896},
{-783.0222,500.0925,-780.2761,503.1472},//Liberty City Propo	     	// TheBigSpreadRanch	{407.1485,-2459.5288,16.5000.-181.0846}
{1431.1639,-2287.9189,1413.4166,-2287.4971}
};
//=[checkpoints]================================================
new Float:checkpoints[MAX_POINTS][6] =
{
{-22.2549,-55.6575,1003.5469},					// Bank
{2000.3132,1538.6012,13.5859},					// Pirate
{291.0004,-84.5168,1001.5156},					// Ammunation
{1989.0619,1005.5241,994.4688},					// FourDragons
{-103.5525,-22.4661,1000.7188},					// SexShop
{501.4927,-75.4323,998.7578},					// Bar
{2235.5408,1679.0402,1008.3594},				// Caligula
{161.1875,-79.9915,1001.8047},					// Zip
{207.5640,-97.8188,1005.2578},					// BincoShop
{-203.4864,-41.2045,1002.2734},					// Tatoo
{418.5547,-80.1667,1001.8047},					// Botique
{1212.3918,-10.9459,1000.9219},					// StripClub
{418.1210,2536.8762,10.0000},					// AirStrip
{2127.5940,2370.4255,10.8203},					// EmeraldIsle
{2022.5179,1916.6848,12.3397},					// TheVisage
{-1920.6711,303.1555,33.0469},					// CP_WANGEXPORTS
{1208.5027,-32.6044,1000.9531}, 				// TheBigSpreadRanch
{-781.4277,501.4098,1371.7490},
{1422.4281,-2287.8442,13.3828}//Bank


};
new checkpointType[MAX_POINTS] =
{
CP_BANK,
CP_PIRATE,CP_AMMU,
CP_DRAGON,CP_SEXSHOP,
CP_BAR,CP_CALIGULA,
CP_ZIP,CP_BINCO,
CP_TATOO,CP_BOTIQUE,
CP_STRIPCLUB,CP_AIRSTRIP,
CP_EMERALD,CP_VISAGE,
CP_SPREADRANCH,
CP_WANGEXPORTS,CP_LC
};

//=[Wang`s]=====================================================================
//forward:
forward SellWangExportVehicle(playerid);
//define:
#define MAX_WANGEXPORTVEHICLES	25
//new`s:
new Sell[MAX_PLAYERS];
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
//=[PROPERTIES`s]=====================================================================
//define:
#define MAX_PROPERTIES	16
//new`s:
new propertyNames[MAX_PROPERTIES][32] =
{
"The Four Dragons","Sex Shop",
"Shithole Bar","Caligula",
"Zip Shop","Binco Shop",
"Tatoo Parlor","Botique","Strip Club","Wang Cars",
"Verdant Meadows Air Strip","Emerald Isle",
"The Visage","The Big Spread Ranch",
"Liberty City","Bank`s Mangger"
};

new propertyValues[MAX_PROPERTIES] =
{
120000,
80000,75000,
120000,20000,
22000,45000,
23000,30000,
40000,30000,
80000,100000,
25000,250001,
24000
};
new propertyEarnings[MAX_PROPERTIES] =
{
1200,8000,7500,1200, //4
2000,2200,3000,4500,
3000,4000,8000,10000,
2300,
2500,6000
};
new propertyOwner[MAX_PROPERTIES] =
{
999,999,999,999,
999,999,999,999,
999,999,999,999,
999,999,999,999
};
//=[Gang`s]==========================================================
//define:
#define MAX_GANGS 			32
#define MAX_GANG_MEMBERS	6
#define MAX_GANG_NAME       16
new gangMembers[MAX_GANGS][MAX_GANG_MEMBERS];
new gangNames[MAX_GANGS][MAX_GANG_NAME];
new gangInfo[MAX_GANGS][3]; //0-created,1-members,2-color
new gangBank[MAX_GANGS];
new playerGang[MAX_PLAYERS];
new gangInvite[MAX_PLAYERS];
//
#define MAX_SAVE 64
new savedInfo[MAX_SAVE][4];
new savedNames[MAX_SAVE][MAX_PLAYER_NAME];
//new savedWeapons[MAX_SAVE][MAX_WEAPONS];
new gActivePlayers[MAX_PLAYERS];
new gLastGaveCash[MAX_PLAYERS];
//new playerWeapons[MAX_PLAYERS][MAX_WEAPONS];
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
main(){
print("\n----------------");
print("         This My Lift Pawn\n");
print("          Vesoin 3.3");
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
format(string, sizeof(string),"%s has quit your gang.", playernamess);
SendClientMessage(gangMembers[gangnum][j], COLOR_ORANGE, string);
}
format(string, sizeof(string),"You have quit the gang '%s' (id: %d)", gangNames[gangnum], gangnum);
SendClientMessage(playerid, COLOR_ORANGE, string);
playerGang[playerid]=0;
SetPlayerColor(playerid,playerColors[playerid]);

return;
}
}
}
else
{
SendClientMessage(playerid, COLOR_RED, " אתה לא נמצא בגאנג");
}
}
//----Rcon Admin--- CARSYS===
//#define COLOR_YELLOW 0xFFFF00AA
//#define BLUE 0x005EECAA
#define LIGHTGREEN 0xFFFF00AA
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

#define RespawnDelay 100000

#define NormPrice 50000
#define BoatPrice 75000
#define BikePrice 100000
#define PlanePrice 115000
#define Expensive 200000
#define VeryExpensive 1000000



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
//new ModCount = 0;
new ParkCount = 0;
//new ColourCount = 0;
new CreateCount = 0;

new Float:Pos[MAX_PLAYERS][4];
new Float:Angle[MAX_PLAYERS];


#define MAX_CARS 100


enum VehInfo
{
	CarID,
	CarName[30],
	CarModel,
	CarOwned,
	CarOwner[MAX_PLAYER_NAME],
	CarLocked,
	Buyable,
	Price,
	Parkedx,
	Parkedy,
	Parkedz,
	Zibori
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
public getCheckpointType(playerID) {
return checkpointType[playerCheckpoint[playerID]];}
public isPlayerInArea(playerID, Float:data[4]){
new Float:X, Float:Y, Float:Z;
GetPlayerPos(playerID, X, Y, Z);
if(X >= data[0] && X <= data[2] && Y >= data[1] && Y <= data[3]) {
return 1;}
return 0;}
public PayPlayerInArea(playerID, Float:x1, Float:y1, Float:x2, Float:y2, cash){
if(IsPlayerConnected(playerID)){
new Float:X, Float:Y, Float:Z;
GetPlayerPos(playerID, X, Y, Z);
if(X >= x1 && X <= x2 && Y >= y1 && Y <= y2){
//ne/y(playerID, cash);
LACY_GiveMoney (playerID, cash);
return 1;}}
return 0;}
forward checkpointUpdate();
public checkpointUpdate()
{
for(new i=0; i<MAX_PLAYERS; i++)
{
if(IsPlayerConnected(i))
{
for(new j=0; j < MAX_POINTS; j++)
{
if(isPlayerInArea(i, checkCoords[j]))
{
if(playerCheckpoint[i]!=j)
{
DisablePlayerCheckpoint(i);
SetPlayerCheckpoint(i, checkpoints[j][0],checkpoints[j][1],checkpoints[j][2],2);
playerCheckpoint[i] = j;
}
}
else
{
if(playerCheckpoint[i]==j)
{
DisablePlayerCheckpoint(i);
playerCheckpoint[i] = 999;
}
}
}
}
}
}

new ShipWork=1;
public PirateShipScoreUpdate()
{
for(new i=0; i<MAX_PLAYERS; i++)
{
if(ShipWork ==1) {
PayPlayerInArea(i, 1995.5, 1518.0, 2006.0, 1569.0, 100);{
}
}
}
}



forward SavedUpdate();
public SavedUpdate()
{
for(new i = 0; i < MAX_SAVE; i++)
{
if(savedInfo[i][3] < 5)
{
if(savedInfo[i][3]==4)
{
savedInfo[i][0]=savedInfo[i][1]=savedInfo[i][2]=0;
savedNames[i][0]=0;
}
savedInfo[i][3]++;
}
}
}

public MoneyGrubScoreUpdate()
{
new CashScore;
new name[MAX_PLAYER_NAME];
for(new i=0; i<MAX_PLAYERS; i++)
{
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


forward PropertyScoreUpdate();
public PropertyScoreUpdate()
{
	new owners[MAX_PROPERTIES];
	new payments[MAX_PROPERTIES];

	for(new i=0; i < MAX_PROPERTIES; i++)
	    owners[i]=999;

	for(new i=0; i < MAX_PROPERTIES; i++)
	{
		if(propertyOwner[i] < 999) {

			for(new j=0; j < MAX_PROPERTIES; j++) {
			    if(owners[j]==propertyOwner[i]) {
			        payments[j]+=propertyEarnings[i];
			        j = MAX_PROPERTIES;
			    } else if (owners[j]==999) {
					owners[j]=propertyOwner[i];
					payments[j]+=propertyEarnings[i];
			        j = MAX_PROPERTIES;
				}
			}

		}
	}

	for(new i=0; i < MAX_PROPERTIES; i++) {
		if(owners[i] < 999 && IsPlayerConnected(owners[i])) {
			new string[256];

			LACY_GiveMoney(owners[i], payments[i]);

			format(string, sizeof(string), " !$%d אתה הרווחת מהנכסים שלך מחיר של ", payments[i]);
			SendClientMessage(owners[i], COLOR_GREEN, string);
		}
	}

}


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
	CreateStreamObject(14404, X, Y, Z, 0.0, 0.0, 0.0,400);
	CreateStreamObject(1562, floatadd(X, difc[0][0]), floatadd(Y, difc[0][1]), floatsub(Z, difc[0][2]), 0.0, 0.0, difc[0][3],500);
	CreateStreamObject(1562, floatadd(X, difc[1][0]), floatsub(Y, difc[1][1]), floatsub(Z, difc[1][2]), 0.0, 0.0, difc[1][3],500);
	CreateStreamObject(1562, floatadd(X, difc[2][0]), floatsub(Y, difc[2][1]), floatsub(Z, difc[2][2]), 0.0, 0.0, difc[2][3],500);
	CreateStreamObject(1562, floatsub(X, difc[3][0]), floatsub(Y, difc[3][1]), floatsub(Z, difc[3][2]), 0.0, 0.0, difc[3][3],500);
	CreateStreamObject(1562, floatsub(X, difc[4][0]), floatsub(Y, difc[4][1]), floatsub(Z, difc[4][2]), 0.0, 0.0, difc[4][3],500);
	CreateStreamObject(1562, floatsub(X, difc[5][0]), floatsub(Y, difc[5][1]), floatsub(Z, difc[5][2]), 0.0, 0.0, difc[5][3],500);
	CreateStreamObject(1563, floatadd(X, difc[6][0]), floatadd(Y, difc[6][1]), floatsub(Z, difc[6][2]), 0.0, 0.0, difc[6][3],500);
	CreateStreamObject(1563, floatadd(X, difc[7][0]), floatsub(Y, difc[7][1]), floatsub(Z, difc[7][2]), 0.0, 0.0, difc[7][3],500);
	CreateStreamObject(1563, floatadd(X, difc[8][0]), floatsub(Y, difc[8][1]), floatsub(Z, difc[8][2]), 0.0, 0.0, difc[8][3],500);
	CreateStreamObject(1563, floatsub(X, difc[9][0]), floatsub(Y, difc[9][1]), floatsub(Z, difc[9][2]), 0.0, 0.0, difc[9][3],500);
	CreateStreamObject(1563, floatsub(X, difc[10][0]), floatsub(Y, difc[10][1]), floatsub(Z, difc[10][2]), 0.0, 0.0, difc[10][3],500);
	CreateStreamObject(1563, floatsub(X, difc[11][0]), floatsub(Y, difc[11][1]), floatsub(Z, difc[11][2]), 0.0, 0.0, difc[11][3],500);
	CreateStreamObject(14405, X, floatsub(Y, difc[12][1]), floatsub(Z, difc[12][2]), 0.0, 0.0, difc[12][3],500);
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





new Float:Sniper[][3] = {
{-1811.2028,-1618.1361,23.0156}, 
{-1824.7434,-1621.5146,23.0156},
{-1790.8617,-1648.6818,33.4375},
{-1820.1929,-1669.3990,23.7109},
{-1826.4819,-1687.6565,23.7031},
{-1826.4122,-1699.6692,24.6092},
{-1829.8638,-1704.3828,27.2813},
{-1846.5491,-1708.2533,41.1139},
{-1857.6595,-1695.8116,42.9788},
{-1927.3993,-1734.4781,22.8856},
{-1926.0743,-1689.7908,21.7500}
};
//No Chat
new NoChat[MAX_PLAYERS];

//


forward weaponanti(playerid);
new AntiOff;
//---

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
    format(msg,255,"   %s",text);
    SendClientMessage(playerid, COLOR_LIGHTBLUE, msg);
    return 1;
}
//--------------------------------
Float:GDTP(playerid,Float:x2,Float:y2,Float:z2)
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
    format(msg,255,"Satla - Phon: %s",text);
    SendClientMessage(playerid, COLOR_LIGHTBLUE, msg);
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
	    format(msg, sizeof(msg), "...[/Answer] - .לענות לשיחה, %s :מתקשר", callerName);
		SendClientMessage(receiverid,0x0F482FF,msg);
		new Float:x1,Float:y1,Float:z1;
		GetPlayerPos(receiverid,x1,y1,z1);

		return 1;
	}
	return 1;
}

//-----------------------
public ColgarTelefonino(playerid)return SetPlayerSpecialAction(playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
//=[New`s]====================
//Other:
new ship;
new spamkick[MAX_PLAYERS];
new antispam[MAX_PLAYERS];
new onspam[MAX_PLAYERS]=0;
new Text:LEVEL;
new Text:LEVELTEXT;
new spawnloged[MAX_PLAYERS];
new Text:Stats[MAX_PLAYERS];
new pickupammu;
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
new shipworked=0;
new InLcTeleport[MAX_PLAYERS];
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
new zibro,zibro2,zibro3,zibro4,zibro5,zibro6,zibro7,zibro8,zibro9,zibro10,zibro11,zibro12,zibro13,zibro14,zibro15,zibro16,zibro17;
new DriftZibori,DriftZibori1,DriftZibori2,DriftZibori4,DriftZibori5,DriftZibori6,DriftZibori7,DriftZibori8,DriftZibori9,DriftZibori10,DriftZibori11,DriftZibori12,DriftZibori13,DriftZibori14,DriftZibori15,DriftZibori16,DriftZibori3;
new NoForSell[MAX_PLAYERS];
//=[Yup`s]=======================
enum e_STATE
{
e_STATE_NONE,e_STATE_CONNECTED,e_STATE_UPDATING
}
new gLastUpdate[MAX_PLAYERS],e_STATE:gState[MAX_PLAYERS] = {e_STATE_NONE, ...};
#define MAX_AFK_TIME (2000)

forward KickUpdate();
new Sagebir[MAX_PLAYERS];
new Text:Textdraw1;
//==[ChangeHostName]=======================
new changehn = 1;
forward AutoChangeHN();
//==[LACY]===================================
#define SHOW_KICK_REASON true
// Money Cheat
#define MONEY_CHEAT_USE true
#define MONEY_CHEAT_TIMER 6000
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
new fux[256];
new KartWinner;
new KCheckTime;
new KCheckSec;
new KS;
new KK[MAX_PLAYERS];
new Fuck[MAX_PLAYERS];

//new Fucs;
#define COLOR_LIGHTBLUEGREEN 0x0F66FFF
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

//Monster-
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
//new FMonsters;



//=============================Random War Spawns================================
/*
new Float:MonsterSpawns[][4] = {
{1142.0449,1550.9158,50.8214,179.3103},
{1057.6982,1527.1439,52.2449,355.7187},//
{1058.0988,1547.7061,51.0619,160.8235},
{1068.7783,1549.1713,50.9521,176.1770},
{1078.6475,1550.6404,50.8420,166.7769},
{1089.1884,1548.9716,50.9671,189.0238},
{1099.1718,1550.4104,50.8593,165.8369},
{1109.0118,1550.2126,50.8741,188.0838},
{1124.4053,1550.9847,50.8100,175.8637},
{1134.6036,1550.7976,50.8303,176.1770}
};
*/
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
public OnPlayerConnect(playerid)
{
//ThisIsSendMessage[playerid] =0;
mini[playerid] =0;
InCall[playerid]=0;
SetPlayerVars(playerid);
TextDrawShowForPlayer(playerid,Textdraw1);
Sagebir[playerid]=0;
gState[playerid] = e_STATE_CONNECTED;
RaceCP[playerid] =0;
//ThisIsSendMessage[playerid]=0;
cancelpm[playerid]=0;
Ignore[playerid][playerid] =0;
//TextDrawShowForPlayer(playerid,Textdraw6);
playerGang[playerid]=0;
gangInvite[playerid]=0;
InShamal[playerid] = 0;
onspam[playerid] =0;
antispam[playerid] =0;
spamkick[playerid] =0;
antianti[playerid] =0;
NoChat[playerid] = 1;
//IsInAt[playerid] = 0;
isafk[playerid] = 0;
InLcTeleport[playerid] =0;
DolpYou[playerid] =0;
SharkYou[playerid] =0;
TorYou[playerid] =0;
PetInWar[playerid] =0;
ThePetsInYou[playerid] =0;
helpme[playerid] =0;
TheWeed[playerid] =0;
EnableStuntBonusForPlayer(playerid,0);
CellState[playerid]=LIBRE;
AuxiliarTel[playerid]=-1;
CellTime[playerid]=0;
TimerLLamando[playerid]=DEAD_TIMER_ID;
TimerCaidaFicha[playerid]=DEAD_TIMER_ID;
Numero_Tel[playerid]=random(8998)+1000;
borrarMemorias(playerid);
PlayerInfo[playerid][CarID] = 0;
PlayerInfo[playerid][OwnCar] = 0;

new str[256];
format(str, sizeof(str), "~y~Welcome ~y~~h~%s ~n~ ~g~Satla~w~-~r~Zone.~w~co.il" , GetName(playerid));
GameTextForPlayer(playerid, str,4000,1);
if(!dini_Exists(GetPlayerFile(playerid)))
{

format(str, sizeof(str), "/Register [password] :מערכת השרת לא זיההתה אותך להרשמה,!%s ברוך הבא" , GetName(playerid), GetName(playerid));
SendClientMessage(playerid,COLOR_LIGHTBLUE , str);
SendClientMessage(playerid,0xFFFF00AA,"/Help [1-37] :עזרה");

}
else
{
format(str, sizeof(str), "/login [password] :מערכת השרת זיההתה אותך אנא התחבר,!%s ברוך שובך" , GetName(playerid), GetName(playerid));
SendClientMessage(playerid,COLOR_LIGHTBLUE, str);
SendClientMessage(playerid,0xFFFF00AA,"/Help [1-37] :לקבל עזרה בשרת");


}

new name[MAX_PLAYER_NAME];
GetPlayerName(playerid, name, sizeof(name));
for(new i=0; i<sizeof(Bots); i++)
if(strcmp(name,Bots[i],true)==0)
{
Ban(playerid);
break;
}

new rand = random(sizeof(playerColors));
SetPlayerColor(playerid, playerColors[rand]);
SetPlayerColor(playerid,sgba2hex(random(256),random(256),random(256),55));//צבע במפה

ClickedBm[playerid] = 0;
mini[playerid] = 0 ;
new playrname[MAX_PLAYER_NAME];
gActivePlayers[playerid]++;
gLastGaveCash[playerid] = GetTickCount();
//-=-=-=-=-=-=-=-=-=-=-=-MapIcon
SetPlayerMapIcon( playerid, 1, 2057.5842, 843.3260, 6.7031, 53, 0 );//race
SetPlayerMapIcon( playerid, 3, 2001.6742, 1544.2804, 13.5859, 9, 0 );//ship
SetPlayerMapIcon( playerid, 7, 1618.8290,-238.6926,14.1484, 5, 0 );//airport
SetPlayerMapIcon( playerid, 8, 2323.6238, 1425.8101, 42.8203, 55, 0 );//drift
SetPlayerMapIcon( playerid, 9, 2386.9690, 1043.2112, 10.8203, 27, 0 );//garage
SetPlayerMapIcon( playerid, 10, 2507.1418, 1243.0775, 10.8203, 23, 0 );//club
SetPlayerMapIcon( playerid, 4, -2715.9399, 217.8603, 4.3481, 27, 0 );//מוסך
SetPlayerMapIcon( playerid, 5, 2387.1956, 1050.5073, 10.3850, 27, 0 );//מוסך
SetPlayerMapIcon( playerid, 6, 2646.3372, -2038.0317, 13.1468, 27, 0 );//מוסך
//-=-=-=-=-=-=-=-=-=-=-=-EndMapIcon

playerCheckpoint[playerid]=999;
bank[playerid]=0;
GetPlayerName(playerid, playrname, sizeof(playrname));
for(new i = 0; i < MAX_SAVE; i++) {
if(isStringSame(savedNames[i], playrname, MAX_PLAYER_NAME)) {
bank[playerid] = savedInfo[i][1];
bounty[playerid] = savedInfo[i][2];
savedInfo[i][0]=savedInfo[i][1]=savedInfo[i][2]=0;
savedNames[i][0]=0;
//-=-=zCp

}}
//-=-=
//for(new j = 0; j < MAX_WEAPONS; j++) {
//playerWeapons[playerid][j]=savedWeapons[i][j];
//savedWeapons[i][j]=0;
//}}
// }



return 1;
}



stock sgba2hex(s,g,b,a) return (s*16777216) + (g*65536) + (b*256) + a;
//-=-=-
//new isbg[MAX_PLAYERS];
//new taxiCost[MAX_PLAYERS];
//new isTaxi[MAX_PLAYERS];

//-=-=-
//-=-forward
forward Player();
forward cp(); forward unfreeze(playerid); //forward SHIP(); forward SHIP2();forward SHIP3();
forward TimeUpdate();
forward Descongelar(playerid);
forward AutoMessage(playerid);
forward SendPlayerFormattedText(playerid, const str[], define);
forward SendAllFormattedText(playerid, const str[], define);
forward getCheckpointType(playerID);
forward PlayerLeaveGang(playerid);
forward isPlayerInArea();
forward PayPlayerInArea();
forward PirateShipScoreUpdate();
forward MoneyGrubScoreUpdate();
forward Givecashdelaytimer(playerid);
forward GrubModeReset();
forward GameModeExitFunc();


//=====================================News=====================================
new WarOnr,InWarr[MAX_PLAYERS],WarPlayersr,playernamer[MAX_PLAYER_NAME],Countr,knoobr,CountFucr;
#define MinWarPlayersr 1
new Rewardr;
new knobr[256];
new WarWinnerr;
new CheckTimer;
new WSr;
new PPr[MAX_PLAYERS];
new WarWeaponsr[] = {35};



public OnPlayerDisconnect(playerid, reason)
{
if(MonsterNoTeleportion[playerid] == 1)
{
MonsterPlayers --; iNmOnster[playerid] = 0; MonsterNoTeleportion[playerid] = 0; MonsterFucker[playerid] = 0;
DestroyVehicle(MonsterSYSTEM[playerid]);
MonStart[playerid] =0;
}
if(KK[playerid] == 1)
{
ResetPlayerWeapons(playerid);
SendClientMessage(playerid,COLOR_BRIGHTRED,".Kart .עזבת את הפעילות ");
KartPlayers --; InKart[playerid] = 0; KK[playerid] = 0; Fuck[playerid] = 0;
DestroyVehicle(caridxx[playerid]);
return 1;
}
gState[playerid] = e_STATE_NONE;
NoForSell[playerid] =0;
Stoned[playerid] =0;
new vehicleid = GetPlayerVehicleID(playerid);
SetPlayerVirtualWorld(playerid,0);
SetVehicleVirtualWorld(vehicleid,0);
//GangZoneStopFlashForPlayer(playerid,VIPGangZone);
//ThisIsSendMessage[playerid] =0;
Ignore[playerid][playerid] =0;
InLcTeleport[playerid] = 0;
DolpYou[playerid] =0;
SharkYou[playerid] =0;
TorYou[playerid] =0;
if(PlayerInfo[playerid][Pets] ==1) {


if(PlayerInfo[playerid][Shark] ==1) {
DestroyStreamObject(sam33[playerid]);
SharkYou[playerid] =0;
ThePetsInYou[playerid] =0;
}
if(PlayerInfo[playerid][Dolp] ==1) {
DestroyStreamObject(sam22[playerid]);
ThePetsInYou[playerid] =0;
DolpYou[playerid] =0;
}
if(PlayerInfo[playerid][Tor] ==1) {

DestroyStreamObject(sam44[playerid]);
ThePetsInYou[playerid] =0;
TorYou[playerid] =0;
}
}

ThePetsInYou[playerid] =0;
PlayerInfo[playerid][CarID] = 0;
PlayerInfo[playerid][OwnCar] = 0;
//IsInAt[playerid] = 0;
//InRace[playerid] = 0;
PlayerInfo[playerid][FL] =0;
if(dini_Exists(GetPlayerFile(playerid)) && IsPlayerLogged(playerid)) {
PlayerInfo[playerid][Logged] = 0;
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


PlayerInfo[playerid][Warnings]=0;
dini_Set(GetPlayerFile(playerid),"State","Offine");
}

OnPlayerCommandText(playerid,"/Hangup");





if(Registertrs[playerid] ==1)
{
CPTriatlon[playerid]=0,DisablePlayerRaceCheckpoint(playerid),Registertrs[playerid] =0,CPTriatlon[playerid]=0,RunPlayers--;
}
if(YouRegister[playerid] ==1){
YouRegister[playerid] =0,DisablePlayerRaceCheckpoint(playerid),DriftPlayer--;
}
if(Youregisterrace[playerid] ==1) {
Youregisterrace[playerid] =0,RacePlayers--,DisablePlayerRaceCheckpoint(playerid);
}

if(PPw[playerid] == 1){
 ResetPlayerWeapons(playerid);
 SendClientMessage(playerid,COLOR_BRIGHTRED,".עזבת את הפעילות שבא הייתה");
 WarPlayersw --; InWarw[playerid] = 0; PPw[playerid] = 0;
}
if(PP[playerid] == 1){
ResetPlayerWeapons(playerid);
SendClientMessage(playerid,COLOR_BRIGHTRED,".עזבת את הפעילות שבא הייתה");
WarPlayers --;
InWar[playerid] = 0;
PP[playerid] = 0;
}
if(PPr[playerid] == 1){
 ResetPlayerWeapons(playerid);
SendClientMessage(playerid,COLOR_BRIGHTRED,".עזבת את הפעילות שבא הייתה");
WarPlayersr --; InWarr[playerid] = 0; PPr[playerid] = 0;
}


//Gang
PlayerLeaveGang(playerid);

  //  OnPlayerCommandText(playerid,"/bye");
	for(new i = 0; i < MAX_PROPERTIES; i++) {
		if(propertyOwner[i]==playerid) {
		    propertyOwner[i] = 999;
		    LACY_GiveMoney(playerid, propertyValues[i]);
	}  }



//-=-=
 MidoStreamDisconnect(playerid);
savedInfo[savePos][0] = GetPlayerMoney(playerid);
savedInfo[savePos][1] = bank[playerid];
savedInfo[savePos][2] = bounty[playerid];
savedInfo[savePos][3] = 0;
//for(new i = 0; i < MAX_WEAPONS; i++)
//savedWeapons[savePos][i]=playerWeapons[playerid][i];
//
savePos++;
if(savePos >= MAX_SAVE)
savePos = 0;
return 1;
}
//-==






//OnFilterScriptInit                 0xFFFFFFFF
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
//==/R/L==

if(Youregisterrace[playerid] ==1)return SendClientMessage(playerid,red,"Race אתה לא יכול לבצע פקודות באמצע קרב");
if(YouRegister[playerid] ==1) return SendClientMessage(playerid,red,"Drift אתה לא יכול לעשות פקודות באמצע קרב");
if(Registertrs[playerid] ==1) return SendClientMessage(playerid,red,"Triatlon אתה לא יכול להשתגר באמצע תחרות");
//END
if(KK[playerid] == 1) return SendClientMessage(playerid,COLOR_BRIGHTRED,".אתה לא יכול לעשות פקודות באמצע פעילות");
if(iNmOnster[playerid] == 1) return SendClientMessage(playerid,COLOR_BRIGHTRED,".אתה לא יכול לעשות פקודות באמצע פעילות");

if(PPw[playerid] == 1) return      SendClientMessage(playerid,COLOR_BRIGHTRED,".אתה לא יכול לעשות פקודות באמצע פעילות");
if(PP[playerid] == 1)return     SendClientMessage(playerid,COLOR_BRIGHTRED,".אתה לא יכול לעשות פקודות באמצע פעילות");
if(PPr[playerid] == 1) return      SendClientMessage(playerid,COLOR_BRIGHTRED,".אתה לא יכול לעשות פקודות באמצע פעילות");
//if(OSS[playerid] == 1) return      SendClientMessage(playerid,COLOR_BRIGHTRED,".אתה לא יכול לעשות פקודות באמצע פעילות");
if(PP[playerid] == 1) return      SendClientMessage(playerid,COLOR_BRIGHTRED,".אתה לא יכול לעשות פקודות באמצע פעילות");
new PlayerName[100];


if (strcmp("/afk", cmdtext, true) == 0){
if(isafk[playerid] == 1) return SendClientMessage(playerid,red,"/UNAFK על מנת לצאת מהמצב בצע/י .AFK Time אתה כבר במצע ");
isafk[playerid] = 1;
TogglePlayerControllable(playerid,0);
SendClientMessage(playerid, red, ".כעת אתה רשאי לעשות את עיניינך ללא חשש .AFK נכנסת למצב");
return 1;
}

if (strcmp("/unafk", cmdtext, true) == 0){
if(isafk[playerid] == 0) return SendClientMessage(playerid,red,".AFKאתה לא נמצא ב");
isafk[playerid] = 0;
TogglePlayerControllable(playerid,1);
SetCameraBehindPlayer(playerid);
SendClientMessage(playerid, COLOR_GREEN, ".כעת אתה יכול לחזור לשחק .AFK - יצאת ממצב");
return 1; //return value
}
if(isafk[playerid] ==1) return SendClientMessage(playerid,red,"/UNAFK - .AFK על מנת לצאת ממצב  .AFK אתה לא יכול לבצע פקודות בעת מצב");
//---


if(strcmp(cmd, "/kill", true) == 0)
{
if(HpModeA[playerid] == 1)
{
hpmodebug[playerid]=1;
HpModeA[playerid] = 0;
//DisplayTextForPlayer(playerid,"~r~Bye", 5, 1, 3);
PlayerInfo[playerid][Deaths] = PlayerInfo[playerid][Deaths] --;
return 1;
}
PlayerInfo[playerid][Deaths] = PlayerInfo[playerid][Deaths] --;
antianti[playerid] = 0;
SetPlayerHealth(playerid,0.0);
mini[playerid] = 0;
SendClientMessage(playerid,0xFFFF00AA, ".התאבדת");

return 1;
}
if(mini[playerid] == 1) return SendClientMessage(playerid,WHITE, " /Kill - כדאי לצאת מהמלחמה");

new moneysaA[MAX_PLAYERS];
///KopatGemel]
if(strcmp(cmd, "/aGemel", true) == 0)
{
if (PlayerInfo[playerid][Level] >= 4)
{
if(PlayerInfo[playerid][KopatGemel] ==1) return SendClientMessage(playerid,COLOR_WHITE,"/getgemelm כבר השקעת בקופת הגמל נסה ככה לשלוף תכסף");
if(!CPS_IsPlayerInCheckpoint(playerid,bcp)) return SendClientMessage(playerid,COLOR_WHITE,"אתה חייב להיות בבנק.");
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) return SendClientMessage(playerid,WHITE, "/aGemel [4000-20,000] :שימוש ");
moneysaA[playerid] = strval(tmp);
if(moneysaA[playerid] > 20000) return SendClientMessage(playerid, COLOR_BRIGHTRED, ".20,000 :הסכום המקסימלי ללקיחת הלואה הוא"),SendClientMessage(playerid,red, "/aGemel [4000-20,000] :אתה עברת את הסכום המותר אנא נסה שנית");
if(moneysaA[playerid] < 4000) return SendClientMessage(playerid, COLOR_BRIGHTRED, "4,000 :סכום מינימלי"),SendClientMessage(playerid,red, "/aGemel [4000-20,000] סכום ההשקעה נמוך מידי אנא נסה ככה");
moneysaA[playerid] = strval(tmp);
if(GetPlayerMoney(playerid) < moneysaA[playerid]) return SendClientMessage(playerid, COLOR_BRIGHTRED, " אין לך מספיק כסף ");

LACY_GiveMoney(playerid, -moneysaA[playerid]);
PlayerInfo[playerid][GemelLogin] =moneysaA[playerid];
PlayerInfo[playerid][KopatGemel] =1;
SendClientMessage(playerid,COLOR_WHITE,".-- קופת ההשקאות שלך --");
format(string, sizeof(string),"%d אתה השקעת בקופת הגמל שלך כ",PlayerInfo[playerid][GemelLogin]),SendClientMessage(playerid,0xFFFF00AA,string);
SendClientMessage(playerid,0xFFFF00AA,".כל שעה עגולה תקבל כ-1,200 דולר לקופת ההשקאות");
SendClientMessage(playerid,0xFFFF00AA,"/getgemelm :ללקיחת הכסף בחזרה");

}
else
{
SendClientMessage(playerid,COLOR_WHITE,"השקעה בקופת הגמל מרמה 4 ומעלה");
}
return 1;
}
if(strcmp(cmd, "/BarakST", true) == 0) {
CafolMoneyGemel();
return 1;
}
if(strcmp(cmd, "/getgemelm", true) == 0)
{
if (PlayerInfo[playerid][Level] >= 4)
{
if(!CPS_IsPlayerInCheckpoint(playerid,bcp)) return SendClientMessage(playerid,COLOR_WHITE,"אתה חייב להיות בבנק.");
if(PlayerInfo[playerid][GemelLogin] ==0) return SendClientMessage(playerid,COLOR_WHITE,"/help 37 אין לך שום השקעה לעזרה השתמש בפקודה");

format(string, sizeof(string),".%d קיבלת תכסף בחזרה מקופת ההשקעות תהנה",PlayerInfo[playerid][GemelLogin]),SendClientMessage(playerid,0xFFFF00AA,string);
LACY_GiveMoney(playerid, PlayerInfo[playerid][GemelLogin]);
PlayerInfo[playerid][GemelLogin] =0;
PlayerInfo[playerid][KopatGemel] =0;
}
else
{
SendClientMessage(playerid,COLOR_WHITE,"השקעה בקופת הגמל מרמה 4 ומעלה");
}
return 1;
}

//---

if(!strcmp(cmd, "/Profile", true))
{
if(PlayerInfo[playerid][ProfileLogged] ==0) return SendClientMessage(playerid,COLOR_WHITE,"/help profile אתה חייב לפתוח כרטיס  פרופיל קודם");
format(string, sizeof(string), "--- %s`s :הפרופיל שלך ---",GetName(playerid)),SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
format(string, sizeof(string), "icq: [%s]", dini_Get(GetPlayerFile(playerid),"ICQ")),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "messnger: [%s]", dini_Get(GetPlayerFile(playerid),"MSN")),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "sex: [%s]", dini_Get(GetPlayerFile(playerid),"SEX")),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "email: [%s]", dini_Get(GetPlayerFile(playerid),"Email")),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "age: [%d]", PlayerInfo[playerid][AggInfo]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "%s", dini_Get(GetPlayerFile(playerid),"Mispht")),SendClientMessage(playerid, COLOR_GREY, string);
return 1;
}
if(!strcmp(cmd, "/pProfile", true))
{
new sid[256], id;
sid = strtok(cmdtext,idx);
id = ReturnID(sid);
if(PlayerInfo[id][ProfileLogged] ==0) return SendClientMessage(playerid,COLOR_WHITE,"שחקנ/ית זה לא הגדיר/ה תפרופיל");
if(!strlen(sid)) return SendClientMessage(playerid, COLOR_WHITE, "/pProfile [id]");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid,WHITE,".שחקנ/ית לא מחובר/ת");
format(string, sizeof(string), "----  [%s`s] :הפרופיל של  -----",GetName(id)),SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
format(string, sizeof(string), "icq: [%s]", dini_Get(GetPlayerFile(id),"ICQ")),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "messnger [%s]", dini_Get(GetPlayerFile(id),"MSN")),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "sex: [%s]", dini_Get(GetPlayerFile(id),"SEX")),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "email: [%s]", dini_Get(GetPlayerFile(id),"Email")),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "age: [%d]", PlayerInfo[playerid][AggInfo]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "%s", dini_Get(GetPlayerFile(id),"Mispht")),SendClientMessage(playerid, COLOR_GREY, string);
return 1;
}

if(strcmp(cmd, "/GetLoan", true) == 0)
{
if (PlayerInfo[playerid][Level] >= 4)
{
if(!CPS_IsPlayerInCheckpoint(playerid,bcp)) return SendClientMessage(playerid,COLOR_WHITE," אתה חייב להיות בצ'ק פוינט של הבנק כדי להישתמש בפקודה זו ");
if(PlayerInfo[playerid][GetAloan] ==1) return format(string, sizeof(string),"%d :אתה חייב לבנק סכום כספי של",PlayerInfo[playerid][MoneyLoan]),SendClientMessage(playerid,red,string),SendClientMessage(playerid,red,".חסר לך כסף להחזרת ההלואה אנא אסוף תכסף והחזר לבנק עד אז לא תוכל להשתמש בבנק");
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) return SendClientMessage(playerid,WHITE, "/getloan [4000-20,000] :שימוש ");
moneysaA[playerid] = strval(tmp);
if(moneysaA[playerid] > 20000) return SendClientMessage(playerid, COLOR_BRIGHTRED, ".20,000 :הסכום המקסימלי ללקיחת הלואה הוא"),SendClientMessage(playerid,red, "/getloan [4000-20,000] :אתה עברת את הסכום המותר אנא נסה שנית");
moneysaA[playerid] = strval(tmp);
if(moneysaA[playerid] < 4000) return SendClientMessage(playerid, COLOR_BRIGHTRED, "4,000 :סכום מינימלי"),SendClientMessage(playerid,red, "/getloan [4000-20,000] :הסכום שהזנת קטן מידי נסה שנית");

LACY_GiveMoney(playerid, moneysaA[playerid]);
PlayerInfo[playerid][MoneyLoan] = moneysaA[playerid];
PlayerInfo[playerid][MoneyLoan] +=200;
PlayerInfo[playerid][GetAloan] =1;
format(string, sizeof(string),"%d :לקחת הלוואה בסך %d אתה צריך להחזיר לבנק כ ",PlayerInfo[playerid][MoneyLoan],PlayerInfo[playerid][MoneyLoan]-200);
SendClientMessage(playerid,0xFFFF00AA,string);
SendClientMessage(playerid,COLOR_PURPLE, ":שים לב לדברי מנהל הבנק");
SendClientMessage(playerid,COLOR_PINK, "מנהל הבנק: לא לשכוח עד שלא תחזיר תהלוואה לא תוכל להשתמש בבנק");
SendClientMessage(playerid,COLOR_PINK, ".מנהל הבנק: לא לשכוח כל 54 דק' הבנק לוקח ריבת של 200 דולר");
SendClientMessage(playerid,COLOR_GREEN, "./backloan להחזרת ההלואה");
dini_IntSet(GetPlayerFile(playerid),"MoneyLoan",PlayerInfo[playerid][MoneyLoan]);

}
else
{
SendClientMessage(playerid,COLOR_WHITE,".לקיחת הלוואה החל מרמה 4 ומעלה");
}
return 1;
}

if(strcmp(cmd, "/BackLoan", true) == 0)
{
if(!CPS_IsPlayerInCheckpoint(playerid,bcp)) return SendClientMessage(playerid,COLOR_WHITE," אתה חייב להיות בצ'ק פוינט של הבנק כדי להישתמש בפקודה זו ");
if(PlayerInfo[playerid][GetAloan] ==0) return SendClientMessage(playerid,red,".לא לקחת שום הלוואה אין מה להחזיר");
if(GetPlayerMoney(playerid) < PlayerInfo[playerid][MoneyLoan]) return format(string, sizeof(string),"%d :אתה חייב לבנק סכום כספי של",PlayerInfo[playerid][MoneyLoan]),SendClientMessage(playerid,red,string),SendClientMessage(playerid,red,".חסר לך כסף להחזרת ההלואה אנא אסוף תכסף והחזר לבנק עד אז לא תוכל להשתמש בבנק");
LACY_GiveMoney(playerid,-PlayerInfo[playerid][MoneyLoan]);
format(string, sizeof(string),"[%d] :החזרת לבנק תהלוואה סכום ההחזרה",PlayerInfo[playerid][MoneyLoan]);
SendClientMessage(playerid,0xFFFF00AA,string);
SendClientMessage(playerid,COLOR_PURPLE, ".מנהל הבנק: תודה על ההחזרת הלוואה");
SendClientMessage(playerid,COLOR_PURPLE, "מנהל הבנק: כעת אתה יכול להשתמש בבנק שנית");
SendClientMessage(playerid,COLOR_PINK, "/help bank לעזרה בבנק בצע את הפקודה");
SendClientMessage(playerid,COLOR_PINK, "/getloan .עם תרצה לקחת עוד פעם הלוואה");
PlayerInfo[playerid][GetAloan] =0;
PlayerInfo[playerid][MoneyLoan] =0;
return 1;
}


if(strcmp(cmd, "/organization", true) == 0)
{
new Roy_Killer111[256];
Roy_Killer111= strtok(cmdtext, idx);
if(!strlen(Roy_Killer111))
{
SendClientMessage(playerid, COLOR_WHITE,"/organization [function] :צורת שימוש");
SendClientMessage(playerid, COLOR_WHITE,"/organization my [organization name] :לשינוי תאג הארגון שלך");
return 1;
}

else if(strcmp(Roy_Killer111,"my",true) == 0)
{
new icqnumb[256];
CheckPlayerCMDLevel(playerid,ChangeIcq);
icqnumb = strtok(cmdtext,idx);
if(!strlen(icqnumb)) return SendClientMessage(playerid,COLOR_WHITE,"/organization [name org] :שימוש");

dini_Set(GetPlayerFile(playerid),"organization",icqnumb);
format(string, sizeof(string),"[%s] - .שינת את הארגון שלך ל",icqnumb);
SendClientMessage(playerid,0x0F482FF,string);
}
return 1;
}


if(strcmp(cmd, "/setp", true) == 0)
{
new Roy_Killer111[256];
Roy_Killer111= strtok(cmdtext, idx);
if(!strlen(Roy_Killer111))
{
SendClientMessage(playerid, COLOR_WHITE,"/setp [function] :צורת שימוש");
SendClientMessage(playerid, COLOR_WHITE,"/setp open :לפתיחת פרופיל");
SendClientMessage(playerid, COLOR_WHITE,"/setp icq [Number icq] לערוך את המספר אייסקיו");
SendClientMessage(playerid, COLOR_WHITE,"/setp msn [your msn] המסנג'ר שלך");
SendClientMessage(playerid, COLOR_WHITE,"/setp email [email] לערוך את האימייל שלך");
SendClientMessage(playerid, COLOR_WHITE,"/setp age  :לערוך את הגיל שלך");
SendClientMessage(playerid, COLOR_WHITE,"/setp sex [כדאי לערוך את המין שלך [זכר/נקבה ");
SendClientMessage(playerid, COLOR_WHITE,"/setp m [המילה English Only] מילה שאתה מתחבר אליה אנגלית בלבד");
SendClientMessage(playerid, COLOR_WHITE,"/pProfile [id] לראות פרופיל של שחקן אחר - /Profile לראות את הפרופיל שלך");

return 1;
}

if(strcmp(Roy_Killer111,"icq",true) == 0)
{
if(PlayerInfo[playerid][ProfileLogged] ==0) return SendClientMessage(playerid,COLOR_WHITE,"/help profile - אתה חייב לפתוח קודם כל פרופיל לעזרה");
new icqnumb[256];
CheckPlayerCMDLevel(playerid,ChangeIcq);
icqnumb = strtok(cmdtext,idx);
if(!strlen(icqnumb)) return SendClientMessage(playerid,COLOR_WHITE,"/setp icq [number icq] :שימוש");


if(IsNumber(icqnumb))
{
SendClientMessage(playerid,red,".מספר איסייקיו לא חוקי");
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
if(PlayerInfo[playerid][ProfileLogged] ==1) return SendClientMessage(playerid,COLOR_WHITE,"/help profile - כבר יש לך כרטיס פרופיל לעזרה");
SendClientMessage(playerid,COLOR_WHITE,"--- .כרטיס פרופיל נוצר בהצלחה ---");
SendClientMessage(playerid,0x0F482FF,"!כעת תוכל לערוך את הפרטים שלך");
SendClientMessage(playerid,0x0F482FF,"/help profile - לקבלת עזרה בצע תפקודה");
SendClientMessage(playerid,0x0F482FF,"/profile לצפייה בכרטיס שלך");
SendClientMessage(playerid,0x0F482FF,"/pprofile [id] לצפייה בכרטיס של מישהוא אחר");
PlayerInfo[playerid][ProfileLogged]=1;
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
//---
format(string,sizeof(string),"LOAN=%s\r\n","None"); fwrite(f,string);
format(string,sizeof(string),"Danger2=%s\r\n","None"); fwrite(f,string);
format(string,sizeof(string),"Danger3=%s\r\n","None"); fwrite(f,string);
format(string,sizeof(string),"Danger4=%s\r\n","None"); fwrite(f,string);
dini_IntSet(GetPlayerFile(playerid),"ProfileLogeed",PlayerInfo[playerid][ProfileLogged]);
fclose(f);
}
}
else if(strcmp(Roy_Killer111,"sex",true) == 0)
{

if(PlayerInfo[playerid][ProfileLogged] ==0) return SendClientMessage(playerid,COLOR_WHITE,"/help profile - אתה חייב לפתוח קודם כל פרופיל לעזרה");
new SexPlayer[256];
SexPlayer = strtok(cmdtext, idx);
if(!strlen(SexPlayer))
{
SendClientMessage(playerid, COLOR_WHITE, "/setp sex  [נקבה/זכר]");

return 1;
}

if(strcmp(SexPlayer,"זכר",true) == 0)
{
CheckPlayerCMDLevel(playerid,ChangeIcq);
SendClientMessage(playerid, 0x0F482FF, "[המין שלך הוגדר כ[זכר");
new File:f;
if(fexist(GetPlayerFile(playerid)))
{
f = fopen(GetPlayerFile(playerid),io_append);
dini_Set(GetPlayerFile(playerid), "SEX", "זכר");
fclose(f);
}}
else if(strcmp(SexPlayer,"נקבה",true) == 0)
{

SendClientMessage(playerid, 0x0F482FF, "[המין - שלך הוגדר כ[נקבה");

new File:f;
if(fexist(GetPlayerFile(playerid)))
{
f = fopen(GetPlayerFile(playerid),io_append);
dini_Set(GetPlayerFile(playerid), "SEX", "נקבה");
fclose(f);
}}
}
//--Email
else if(strcmp(Roy_Killer111,"email",true) == 0)
{
if(PlayerInfo[playerid][ProfileLogged] ==0) return SendClientMessage(playerid,COLOR_WHITE,"/help profile - אתה חייב לפתוח קודם כל פרופיל לעזרה");
new Msnnumb[256];
CheckPlayerCMDLevel(playerid,ChangeIcq);
Msnnumb = strtok(cmdtext,idx);
if(!strlen(Msnnumb)) return SendClientMessage(playerid,COLOR_WHITE,"/setp email [your email] :שימוש");
new File:f;
if(fexist(GetPlayerFile(playerid)))
{
f = fopen(GetPlayerFile(playerid),io_append);
dini_Set(GetPlayerFile(playerid),"Email",Msnnumb);
format(string, sizeof(string),"[%s]- :האיימיל שלך נקבע כ",Msnnumb);
SendClientMessage(playerid,0x0F482FF,string);
fclose(f);
}
}

//--Agg
else if(strcmp(Roy_Killer111,"age",true) == 0)
{
if(PlayerInfo[playerid][ProfileLogged] ==0) return SendClientMessage(playerid,COLOR_WHITE,"/help profile - אתה חייב לפתוח קודם כל פרופיל לעזרה");
/*
new AggNunb[256];
CheckPlayerCMDLevel(playerid,ChangeIcq);
AggNunb = strtok(cmdtext,idx);


if(!strlen(AggNunb)) return SendClientMessage(playerid,COLOR_WHITE,"/setp agg [age] :שימוש");
if(Config[MaxPasswordLength] < strlen(AggNunb) || strlen(AggNunb) < Config[MinPasswordLength]) {
format(string,sizeof(string),".%d-%d :גיל לא חוקי המספרים צריכים להיות בין לבין",Config[MaxPasswordLength], Config[MinPasswordLength]);
SendClientMessage(playerid,COLOR_BRIGHTRED,string);
return 1;
}


new File:f;
if(fexist(GetPlayerFile(playerid)))
{
f = fopen(GetPlayerFile(playerid),io_append);
dini_Set(GetPlayerFile(playerid),"Agg",AggNunb);
format(string, sizeof(string),"[%s]- :הגיל שלך נקבע כ",AggNunb);
SendClientMessage(playerid,0x0F482FF,string);
fclose(f);
}
*/
if(Sagebir[playerid] ==1){
Sagebir[playerid]=0;
SendClientMessage(playerid,WHITE,".כעת יצאת ממצב קביעת גיל תוכל להמשיך לכתוב בצ'אט בחופשיות");
}
if(Sagebir[playerid] ==0){
SendClientMessage(playerid,COLOR_LIGHTRED,".--- הדרכה בשימוש מערכת גילאים ---");
SendClientMessage(playerid,WHITE,"(dd/mm/yyyy):כעת תכתוב בצ'אט את התאריך לידה שלך דוגמא");
SendClientMessage(playerid,WHITE,".mm = חודש -- dd = יום -- yyyy = שנה");
SendClientMessage(playerid,WHITE,".על מנת לקבוע את גילך תכתוב את זה בצ'אט, אל תדאג הצ'אט יצנזר ורק את תראה");
SendClientMessage(playerid,WHITE,"(dd/mm/yyyy) :תכתוב בצ'אט ככה d-- .על מנת לדבר בצ'אט f6 לחץ");
SendClientMessage(playerid,WHITE,"/editproile age :על מנת לצאת ממצב קביעת גיל תחזור על הפקודה");
Sagebir[playerid]=1;
}
}
//---
else if(strcmp(Roy_Killer111,"Msn",true) == 0)
{
if(PlayerInfo[playerid][ProfileLogged] ==0) return SendClientMessage(playerid,COLOR_WHITE,"/help profile - אתה חייב לפתוח קודם כל פרופיל לעזרה");
new Msnnumb[256];
CheckPlayerCMDLevel(playerid,ChangeIcq);
Msnnumb = strtok(cmdtext,idx);
if(!strlen(Msnnumb)) return SendClientMessage(playerid,COLOR_WHITE,"/setp Msn [your email msn] :שימוש");
new File:f;
if(fexist(GetPlayerFile(playerid)))
{
f = fopen(GetPlayerFile(playerid),io_append);
dini_Set(GetPlayerFile(playerid),"Msn",Msnnumb);
format(string, sizeof(string),"[%s] - :המסן שלך נקבע כ",Msnnumb);
SendClientMessage(playerid,0x0F482FF,string);
fclose(f);
}
}
//--
else if(strcmp(Roy_Killer111,"m",true) == 0)
{
if(PlayerInfo[playerid][ProfileLogged] ==0) return SendClientMessage(playerid,COLOR_WHITE,"/help profile - אתה חייב לפתוח קודם כל פרופיל לעזרה");

new Msnnumb[256];
CheckPlayerCMDLevel(playerid,ChangeIcq);
Msnnumb = strtok(cmdtext,idx);
if(!strlen(Msnnumb)) return SendClientMessage(playerid,COLOR_WHITE,"/setp m [.מילה אחת שמגדירה אותך :D] :שימוש");
new File:f;
if(fexist(GetPlayerFile(playerid)))
{
f = fopen(GetPlayerFile(playerid),io_append);
dini_Set(GetPlayerFile(playerid),"Mispht",Msnnumb);
format(string, sizeof(string),"[%s] המילה שלך הוגדרה בהצלחה",Msnnumb);
SendClientMessage(playerid,0x0F482FF,string);
fclose(f);
}
}

return 1;
}
//----

if(strcmp(cmd, "/ignore", true) == 0)
{
tmp = strtok(cmdtext, idx);
if(!strlen(tmp))
SendClientMessage(playerid, COLOR_WHITE, "* USAGE: /ignore [playerid]");
else
{
giveplayerid = strval(tmp);
if(giveplayerid == playerid) return SendClientMessage(playerid, red, ".אתה לא יכול לחסוך את עצמך");
if(Ignore[playerid][giveplayerid] ==1) return SendClientMessage(playerid,red,"להורדת חסימה - /unignore [id] .שחקן זה כבר חסום אצלך");
if(PlayerInfo[giveplayerid][AdminsLevel] > 2) return SendClientMessage(playerid,red,".אתה רוצה לחסום אדמין? , באסה לך למה אתה לא יכול");
GetPlayerName(giveplayerid, playername, sizeof(playername));
format(string, sizeof(string), ".(ID: %d) האיידי של השחקן %s אתה חסמת את החשקן",  giveplayerid,playername);
SendClientMessage(playerid, red, string);
Ignore[playerid][giveplayerid] = 1;
}
return 1;
}
 if(strcmp(cmd, "/unignore", true) == 0)
 {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp))
SendClientMessage(playerid, COLOR_WHITE, "* USAGE: /unignore [playerid]");
else
{
giveplayerid = strval(tmp);
if(giveplayerid == playerid) return SendClientMessage(playerid, COLOR_RED, ".אתה לא יכול להוריד חסימה לעצמך");
if(Ignore[playerid][giveplayerid] ==0) return SendClientMessage(playerid,red,"/ignore לא חסמת את שחקן זה לחסימה");
GetPlayerName(giveplayerid, playername, sizeof(playername));
format(string, sizeof(string), ".(ID: %d) :איידי %s אתה הורדת חסימה ל", giveplayerid,playername);
SendClientMessage(playerid, COLOR_LIGHTRED, string);
Ignore[playerid][giveplayerid] = 0;
}
return 1;
}
		
//---
	
if(strcmp(cmd,"/GiveVIP",true) == 0)
{
if (PlayerInfo[playerid][AdminsLevel] >= 10)
{
tmp = strtok(cmdtext, idx);
new id = ReturnID(tmp);
tmp2 = strtok(cmdtext, idx);
new adlvl = strval(tmp2);
if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /GiveVIP [playerid] [level]");
if(!strlen(tmp2)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /GiveVIP [playerid] [level]");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_BLUE, "Invalid PlayerID !");
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
if (PlayerInfo[playerid][AdminsLevel] >= 10)
{
tmp = strtok(cmdtext, idx);
new id = ReturnID(tmp);
tmp2 = strtok(cmdtext, idx);
new adlvl = strval(tmp2);
if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /GiveSup [playerid] [level]");
if(!strlen(tmp2)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /GiveSup [playerid] [level]");
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
if(helpme[playerid] ==1) return SendClientMessage(playerid,COLOR_WHITE,".שלחת כבר בקשה , לשליחה שנית אנא המתן מספר שניות");
SendClientMessage(playerid,COLOR_GREY,".בקשתך נשלח בהצלחה לתומכים המחוברים");
helpme[playerid] =1;
for (new i = 0; i < MAX_PLAYERS; i++)
{

if (PlayerInfo[i][Supportives] >= 1)
{
format(string, sizeof(string), ".זקוק לעזרה בשרת אנא פנה אליו בהודעה פרטית או בשיחת טלפון ,%s",GetName(playerid));
SendClientMessage(i, COLOR_WHITE, string);
}
}

return 1;
}



//--CCBank
if(strcmp(cmd, "/Buycc", true) == 0)
{

if (PlayerInfo[playerid][Level] >= 3)
{
if(GetPlayerMoney(playerid) < 700000) return SendClientMessage(playerid,RED,".כרטיס האשראי עולה כ700000 דולר ואין לך מספיק ביד");
if(PlayerInfo[playerid][CcMode] ==1) return SendClientMessage(playerid,COLOR_WHITE,"/help cc - כבר יש לך כרטיס אשראי לעזרה");
SendClientMessage(playerid,COLOR_PURPLE,".מנהל הבנק: תתחדש על הכרטיש אשראי");
SendClientMessage(playerid,0xFFFF00AA,"?אתה: תודה רבה , רגע מה אני יכול לעשות עם כרטיס האשראי");
SendClientMessage(playerid,COLOR_PURPLE,".מנהל הבנק: עם כרטיס האשראי תוכל לעשות מגוון פקודות");
SendClientMessage(playerid,0xFFFF00AA,"?אתה: למשל");
SendClientMessage(playerid,COLOR_PURPLE,":מנהל הבנק: הנה תראה");
SendClientMessage(playerid, 0xFFFF00AA,"/help cc /buycc (3) /sellcc (3) /withdrawc (3) [amount]");
SendClientMessage(playerid,COLOR_PURPLE,":/help cc .מנהל הבנק: לעזרה נוספת");
SendClientMessage(playerid,0xFFFF00AA,"!אתה: תודה רבה");
PlayerInfo[playerid][CcMode]=1;
LACY_GiveMoney(playerid,-700000);
}
else
{
SendClientMessage(playerid,COLOR_WHITE,".קניית כרטיס אשראי זמינה מרמה 3 ומעלה");
}
return 1;
}


if(strcmp(cmd, "/SellCc", true) == 0)
{
if(PlayerInfo[playerid][CcMode] ==0) return SendClientMessage(playerid,COLOR_WHITE,"אין לך כרטיס אשראי בכלל");
SendClientMessage(playerid,COLOR_PURPLE,"מנהל הבנק: מכרת את כרטיס האשראי שלך בהצלחה וקיבלת כ350000 דולר");
SendClientMessage(playerid,0xFFFF00AA,"?אתה: למה רק חצי קיבלתי רק חצי מהכסף");
SendClientMessage(playerid,COLOR_PURPLE,".מנהל הבנק: כי השתמשת בוא");
SendClientMessage(playerid,0xFFFF00AA,".אתה: מניאק");
SendClientMessage(playerid,COLOR_PURPLE,".מנהל הבנק: תודה ביי");
SendClientMessage(playerid,COLOR_PURPLE,": D - .מנהל הבנק: ד``א דפקתי אותך");
LACY_GiveMoney(playerid,350000);
PlayerInfo[playerid][CcMode]=0;
return 1;
}

new moneysa[MAX_PLAYERS];
if(!strcmp(cmd, "/withdrawc", true))
{
if(PlayerInfo[playerid][CcMode] ==0) return SendClientMessage(playerid,COLOR_WHITE,"/cchelp אין לך כרטיס אשראי בכלל");
if(GetPlayerMoney(playerid) < 1000) return SendClientMessage(playerid,RED,"כל משיכה עולה ב1000 דולר ולך יש פחות לכן לו תוכל למשוך");
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) return SendClientMessage(playerid, 0x0C4E0FF, " /withdrawc [amount] :שימוש ");
moneysa[playerid] = strval(tmp);
if(moneysa[playerid] < 1099) return SendClientMessage(playerid, COLOR_BRIGHTRED, "! תה חייב להכניס סכום מעל 1099");
if(moneysa[playerid] > PlayerInfo[playerid][Bank]) return SendClientMessage(playerid, COLOR_BRIGHTRED, ".סכום משיכה שגוי ");
LACY_GiveMoney(playerid, moneysa[playerid]);
LACY_GiveMoney(playerid, -1000);
PlayerInfo[playerid][Bank] = PlayerInfo[playerid][Bank]-moneysa[playerid];
dini_IntSet(GetPlayerFile(playerid),"Bank",PlayerInfo[playerid][Bank]);
format(string, sizeof(string), "[$%d] נשאר לך בבנק כ ,[$%d] משכת מהרטיס אשראי שלך כ",  moneysa[playerid],PlayerInfo[playerid][Bank]);
SendClientMessage(playerid, COLOR_WHITE, string);
return 1;
}
if(!strcmp(cmd, "/balancec", true)) {
format(string, sizeof(string), "[$%d] :הכסף בכרטיס אשראי שלך הוא", PlayerInfo[playerid][Bank]);
SendClientMessage(playerid, COLOR_WHITE, string);
return 1;
}


if(strcmp(cmd, "/MessagePlayer",true)==0)
{
new dir[256];
dir = strtok(cmdtext, idx);
strmid(tmp, cmdtext, 4, strlen(cmdtext));
if(!strlen(dir))
{
SendClientMessage(playerid,COLOR_GREY,"USAGE: /MessagePlayer [message]");
return 1;
}
dir = strtok(cmdtext, idx);
GetPlayerName(playerid, sendername, sizeof(sendername));
format(string, sizeof(string), "***%s %s", sendername, tmp);
SendClientMessageToAll(COLOR_WHITE,string);
return 1;
}
//==============================================================================
	        if(strcmp("/car",cmdtext,true) == 0)
	        {
	         if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,RED,"! אתה צריך להיות במכונית שאתה רוצה ליקנות ");
             new car = GetPlayerVehicleID(playerid);
             
             			  if(NoForSell[playerid] == 1){

              format(vehname,999,".-- .מצב: רכב ציבורי לא ניתקן לקנייה [%s] :פרטי הרכב --",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,COLOR_WHITE,vehname);
             format(vehname,999,".%s :השם של הרכב",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,COLOR_GREY,vehname);
			 format(vehname,999,".%d :האיידי של הרכב",GetVehicleModel(GetPlayerVehicleID(playerid))),SendClientMessage(playerid,COLOR_GREY,vehname);
	         format(vehname,999,".%d :האיידי של הרכב במוד",GetPlayerVehicleID(playerid)),SendClientMessage(playerid,COLOR_GREY,vehname);

             new Float:healthss;
			 new vehicleid = GetPlayerVehicleID(playerid);
			 GetVehicleHealth(vehicleid, healthss);

			 format(string, sizeof(string), "%.1f  :החיים של הרכב", healthss),SendClientMessage(playerid, COLOR_GREY, string);
return 1;
}
             if(VehicleInfo[car][CarOwned] == 1) {
             new Float:healths;
			 new vehicleid = GetPlayerVehicleID(playerid);
			 GetVehicleHealth(vehicleid, healths);
             format(vehname,999,".-- .מצב: נקנה על ידי שחקן [%s] פרטי הרכב --",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
	         SendClientMessage(playerid,COLOR_WHITE,vehname);
	         format(vehname,999,".ואינו מוצע למכירה %s רכב זה שייך ל",VehicleInfo[car][CarOwner]),SendClientMessage(playerid,COLOR_GREY,vehname);
             format(vehname,999,".%s :השם של הרכב",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,COLOR_GREY,vehname);
			 format(vehname,999,".%d :האיידי של הרכב",GetVehicleModel(GetPlayerVehicleID(playerid))),SendClientMessage(playerid,COLOR_GREY,vehname);
	         format(vehname,999,".%d :האיידי של הרכב במוד",GetPlayerVehicleID(playerid)),SendClientMessage(playerid,COLOR_GREY,vehname);
             format(string, sizeof(string), "%.1f  :החיים של הרכב", healths),SendClientMessage(playerid, COLOR_GREY, string);

			 return 1;
             }

			  if(VehicleInfo[car][CarOwned] == 0){

              format(vehname,999,".-- /buycar :מצב: פנוי לרכישה [%s] :פרטי הרכב --",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,COLOR_WHITE,vehname);
             format(vehname,999,".%s :השם של הרכב",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,COLOR_GREY,vehname);
			 format(vehname,999,".%d :האיידי של הרכב",GetVehicleModel(GetPlayerVehicleID(playerid))),SendClientMessage(playerid,COLOR_GREY,vehname);
	         format(vehname,999,".%d :האיידי של הרכב במוד",GetPlayerVehicleID(playerid)),SendClientMessage(playerid,COLOR_GREY,vehname);
      
             new Float:healthss;
			 new vehicleid = GetPlayerVehicleID(playerid);
			 GetVehicleHealth(vehicleid, healthss);

			 format(string, sizeof(string), "%.1f  :החיים של הרכב", healthss),SendClientMessage(playerid, COLOR_GREY, string);
 
               return 1;
               }
 	           return 1;
               }
//==============================================================================
	if(strcmp(cmd, "/Calockallcars", true) == 0)
	{
    	if(IsPlayerAdmin(playerid))
		{
			for(new cari=0; cari < VCount; cari++) for(new i=0; i < MAX_PLAYERS; i++) SetVehicleParamsForPlayer(cari,i, 0, 0);
    		SendClientMessage(playerid, LIGHTGREEN," כל המכוניות נפתחו מנעילה");
    		PlayerPlaySound(playerid,1056,0.0,0.0,0.0);
    	}
		else
		{
			SendClientMessage(playerid, RED, "!הפקודה הזו היא לאדמינים בלבד ");
		}
		return 1;
	}


//==============================================================================
	if(strcmp(cmd, "/lock", true) == 0)
	{
		new vehicleid = GetPlayerVehicleID(playerid);

		GetPlayerName(playerid,PlayerName,30);

        if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,RED," אתה צריך להיות ברכב כדי לינעול אותו");
   		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return
    	SendClientMessage(playerid,0xFFFF00AA," רק אתה כנהג יכול לנעול את הדלתות.");
   	   	if(GetPlayerVehicleID(playerid) >= VCount) return SendClientMessage(playerid,RED," המכונית אינה ניתנת לנעילה");
		if(strcmp(PlayerName,VehicleInfo[vehicleid][CarOwner],true) != 0)return SendClientMessage(playerid,RED," זו לא המכונית שלך, אינך יכול לינעול אותה");
        if(VehicleInfo[vehicleid][CarOwned] == 0 ) return SendClientMessage(playerid,RED,"This car isnt owned therefore cannot be locked");
		if(PlayerInfo[playerid][CarID] == 0) return SendClientMessage(playerid,RED, "אין לך מכונית");

	    for (new i=0;i<MAX_PLAYERS;i++) if(i != playerid) SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 1);
		VehicleInfo[vehicleid][CarLocked] = 1;
	    SendClientMessage(playerid, 0xFFFF00AA, "! המכונית כעת נעולה ");
	    PlayerPlaySound(playerid,1056,0.0,0.0,0.0);

		return 1;
    }
//==============================================================================
	if(strcmp(cmd, "/Calock", true) == 0)
	{
		new vehicleid = GetPlayerVehicleID(playerid);

		GetPlayerName(playerid,PlayerName,30);

        if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,RED," אתה צריך להיות במכונית כדי ליפתוח אותה");
   		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return
    	SendClientMessage(playerid,0xFFFF00AA," רק אתה כנהג יכול לפתוח את הדלתות.");
   	   	if(GetPlayerVehicleID(playerid) >= VCount) return SendClientMessage(playerid,RED,"המכונית זו אינה ניתנת לפתיחה");
		if(strcmp(PlayerName,VehicleInfo[vehicleid][CarOwner],true) != 0)
   		return SendClientMessage(playerid,RED," זו לא המכונית שלך, אינך יכול ליפתוח אותה");
        if(VehicleInfo[vehicleid][CarOwned] == 0 ) return SendClientMessage(playerid,RED,"This car isnt owned therefore cannot be unlocked");
		if(PlayerInfo[playerid][CarID] == 0) return SendClientMessage(playerid,RED," אין לך מכונית");

	    for (new i=0;i<MAX_PLAYERS;i++) if(i != playerid) SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 0);
		VehicleInfo[vehicleid][CarLocked] = 0;
	    SendClientMessage(playerid, 0xFFFF00AA, " עכשיו ביטלתה את נעילת המכונית ");
	    PlayerPlaySound(playerid,1056,0.0,0.0,0.0);
		return 1;
    }



//==============================================================================*/
	if(strcmp(cmd, "/Buycar", true) == 0)
	{
	
if (PlayerInfo[playerid][Level] >= 1)
{
new vehicleid = GetPlayerVehicleID(playerid);
if(NoForSell[playerid]==1) return SendClientMessage(playerid,WHITE,"רכב זה הינו רכב ציבורי שלא ניתן לקנייה");
if(GetPlayerMoney(playerid) < VehicleInfo[vehicleid][Price]) return SendClientMessage(playerid,RED,".אין לך מספיק כסף בשביל ליקנות את המכונית הזאות ");
if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,RED,"! אתה צריך להיות במכונית שאתה רוצה ליקנות ");
if(GetPlayerVehicleID(playerid) >= VCount) return SendClientMessage(playerid,RED,"! זהו רכב ציבורי, אינו ניתן לקניה ");
if(VehicleInfo[vehicleid][CarOwned] == 1 ) return SendClientMessage(playerid,RED,".המכונית הזאות שייכת למישהו אחר ");
if(PlayerInfo[playerid][CarID] != 0) return SendClientMessage(playerid,RED,"! יש לך כבר מכונית ");
if(VehicleInfo[vehicleid][Buyable] == 0) return SendClientMessage(playerid,RED,"! זהו רכב ציבורי, אינו ניתן לקניה ");
format(file,sizeof(file),"CarSys/car%d.txt", GetPlayerVehicleID(playerid) );
GetPlayerName(playerid, PlayerName, sizeof(PlayerName));
if(!dini_Exists(file))
{
format(string,sizeof(string),"[ID %d] .המכונית הזאות לא ניתנת למכירה ", vehicleid );
SendClientMessage(playerid,RED,string);
}
else
{

dini_IntSet(file,"CarOwned",1);
dini_Set(file,"CarOwner",PlayerName);
dini_IntSet(file,"Buyable",0);
dini_Set(file,"CarOwner",PlayerName);
VehicleInfo[vehicleid][CarOwned] = 1;
strmid(VehicleInfo[vehicleid][CarOwner], PlayerName, 0, strlen(PlayerName), 255);
VehicleInfo[vehicleid][Buyable] = 0;
VehicleInfo[vehicleid][CarLocked] = 0;
PlayerInfo[playerid][CarID] = GetPlayerVehicleID(playerid);
PlayerInfo[playerid][OwnCar] = 1;
dini_IntSet(GetPlayerFile(playerid),"CarID",PlayerInfo[playerid][CarID]);
dini_IntSet(GetPlayerFile(playerid),"OwnCar",PlayerInfo[playerid][OwnCar] );
printf("[CarID] %d <> [OwnCar] %d",PlayerInfo[playerid][CarID], PlayerInfo[playerid][OwnCar] );
format(string,sizeof(string),"/carhelp :לפקודות לרכב הקש/י ,[%s] - תיתחדש, קנית רכב חדש  ",VehNames[GetVehicleModel(vehicleid)-400] );


PlayerPlaySound(playerid,1058,0.0,0.0,0.0);
SendClientMessage(playerid,MyColor,string);
LACY_GiveMoney(playerid,-VehicleInfo[vehicleid][Price]);
new File:f;
if(fexist(GetPlayerFile(playerid)))
{

dini_Set(GetPlayerFile(playerid),"Car",VehNames[GetVehicleModel(vehicleid)-400]);
f = fopen(GetPlayerFile(playerid),io_append);
fclose(f);
}
}
}
else
{
SendClientMessage(playerid,COLOR_WHITE,".קניית רכב זמינה מרמה 1 ומעלה");
}
return 1;
}

//==============================================================================
	if(strcmp(cmd, "/sellcar", true) == 0)
	{
	    new vehicleid = GetPlayerVehicleID(playerid);

	   	format(file,sizeof(file),"CarSys/car%d.txt",GetPlayerVehicleID(playerid) );
		GetPlayerName(playerid,PlayerName,30);

		if(strcmp(PlayerName,VehicleInfo[vehicleid][CarOwner],true) != 0)
    	return SendClientMessage(playerid,RED,".זאות לא המכונית שלך! אתה צריך להיות במכונית שלך בכדי לימכור אותה ");
	    if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,RED,".אתה צריך להיות בתוך המכונית שלך בכדי למכור אותה ");
	    if(PlayerInfo[playerid][CarID] == 0) return SendClientMessage(playerid,RED,"! מה אתה מנסה לעשות? אין לך מכונית ");
		if(VehicleInfo[vehicleid][CarOwned] != 1) return SendClientMessage(playerid,RED,".למכונית זו אין בעלים ולכן אי אפשר למכור אותה");

		if(!dini_Exists(file))
		{
			format(string,sizeof(string),"ID [ %d ] - מכונית זו אינה ניתנת למכירה", vehicleid );
	        SendClientMessage(playerid,RED,string);
		}
		else
		{
		   	for	(new i=0;i<MAX_PLAYERS;i++) SetVehicleParamsForPlayer(vehicleid,i, 0, 0);

		    dini_IntSet(file,"CarOwned",0);
		    dini_Set(file,"CarOwner","אין");
		    dini_IntSet(file,"CarLocked",0);
	    	dini_IntSet(file,"Buyable",1);
		    dini_IntSet(file,"Parkedx",0);
		    dini_IntSet(file,"Parkedy",0);
		    dini_IntSet(file,"Parkedz",0);


			VehicleInfo[vehicleid][CarOwned] = 0;
			strmid(VehicleInfo[vehicleid][CarOwner], dini_Get(GetPlayerFile(playerid),"CarOwner"), 0, strlen(dini_Get(GetPlayerFile(playerid),"CarOwner")), 255);
			VehicleInfo[vehicleid][Buyable] = 1;
			VehicleInfo[vehicleid][CarLocked] = 0;
			VehicleInfo[vehicleid][Parkedx] = 0;
			VehicleInfo[vehicleid][Parkedy] = 0;

			PlayerInfo[playerid][CarID] = 0;
			PlayerInfo[playerid][OwnCar] = 0;

			format(file,sizeof(file),"CarSys/Users/%s.txt",PlayerName);
			dini_IntSet(GetPlayerFile(playerid),"CarID",0);
			dini_IntSet(GetPlayerFile(playerid),"OwnCar",0);
		 SendClientMessage(playerid,LIGHTGREEN," מכרת את מכוניתך, קיבלת חצי מסכום הקנייה של הרכב");
		    LACY_GiveMoney(playerid,VehicleInfo[vehicleid][Price]/2);
		    dini_Set(GetPlayerFile(playerid),"Car","None");

	    }
	    return 1;
    }
    //--
    
    //--
//==============================================================================
  if(strcmp(cmd,"/callcar", true) == 0)
    {
        GetPlayerName(playerid,PlayerName,30);
        if(IsPlayerInAnyVehicle(playerid) ) return SendClientMessage(playerid,RED,".אתה בתוך רכב, כדי לשגר את הרכב שלך אתה חיייב לצאת");

        GetPlayerName(playerid,PlayerName,30);
        new car = PlayerInfo[playerid][CarID];

        if(VehicleInfo[car][CarOwned] == 1 && PlayerInfo[playerid][OwnCar] == 1)
        {
               if(GetPlayerMoney(playerid) < 0)
               {
                SendClientMessage(playerid,RED," ");
                }
            	else
                {
                for(new i=0;i<MAX_PLAYERS;i++) if(IsPlayerInVehicle(i,car))
                {
                    RemovePlayerFromVehicle(i);
                    format(string,sizeof(string),".זימן את הרכב שלו, הליכה נעימה ,%s",PlayerName);
                    SendClientMessage(i,WHITE,string);
                }
                GetPlayerPos(playerid,Pos[playerid][0],Pos[playerid][1],Pos[playerid][2]);
                SetPlayerCameraPos(playerid, Pos[playerid][0],Pos[playerid][1],Pos[playerid][2]);
                SetPlayerCameraLookAt(playerid, Pos[playerid][0],Pos[playerid][1],Pos[playerid][2]);
                SetVehiclePos(car,Pos[playerid][0],Pos[playerid][1],Pos[playerid][2]);
                PutPlayerInVehicle(playerid,car,0);
                GetVehicleZAngle(GetPlayerVehicleID(playerid), Angle[playerid]);
                SetTimerEx("TeleCar",4000,0,"i",playerid);
                SendClientMessage(playerid,LIGHTGREEN,"! עם רכבך לא הגיע- /repair  ! זימנת את הרכב שלך");
               }
        }
        else
        {
        SendClientMessage(playerid,RED,"! אין לך מכונית ");
        }
        return 1;
    }//=======================
    
	if(strcmp(cmd, "/repair", true) == 0)
	{

		new vehicleid = GetPlayerVehicleID(playerid);
   		GetPlayerName(playerid,PlayerName,30);

    	if(! (IsPlayerInAnyVehicle(playerid)) ) return SendClientMessage(playerid,RED,".אתה חייב להיות בתוך הרכב כדי להישתמש בשירות התיקונים");
		if(strcmp(PlayerName,VehicleInfo[vehicleid][CarOwner],true) != 0)
   		return SendClientMessage(playerid,RED,"! זו לא המכונית שלך אז אינך יכול לתקן אותה");
		if(PlayerInfo[playerid][CarID] == 0) return SendClientMessage(playerid,RED," אין לך מכונית");

		if(GetPlayerMoney(playerid) < 1000)
		{
			SendClientMessage(playerid,RED,".אין לך מספיק כסף כדי להיתמש בשירות התיקונים");
		}
		else
		{
			GetPlayerPos(playerid,Pos[playerid][0],Pos[playerid][1],Pos[playerid][2]);
			GetVehicleZAngle(GetPlayerVehicleID(playerid), Angle[playerid]);
			SetPlayerCameraPos(playerid, 1929.0, 2137.0, 11.0);
			SetPlayerCameraLookAt(playerid,1935.0, 2138.0, 11.5);
			if(IsPlayerInAnyVehicle(playerid)) SetVehiclePos(GetPlayerVehicleID(playerid), 1974.0,2162.0,11.0);
			SetVehicleZAngle(GetPlayerVehicleID(playerid), -90);
			SetTimerEx("RepairCar",5000,0,"i",playerid);
		    SendClientMessage(playerid,LIGHTGREEN,".תודה שהישתמשת בשירות התיקונים, המכונית תיהיה מוכנה תוך 5 שניות");
			LACY_GiveMoney(playerid,-1000);
		}
		return 1;
	}

//==============================================================================
	if(strcmp(cmd,"/eject", true)==0)
	{
		new pid;
		GetPlayerName(playerid,PlayerName,30);
		new vehicleid = GetPlayerVehicleID(playerid);
		tmp = strtok(cmdtext,idx);

		if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,RED,".אתה לא בתוך רכב");
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid,RED,".נוסעים לא יכולים להישתמש בפקודה זו");

		if(strcmp(PlayerName,VehicleInfo[vehicleid][CarOwner],true) != 0)
   		return SendClientMessage(playerid,RED,".זו לא המכונית שלך, אינך יכול להוציא ממנה נוסעים");

		if(!strlen(tmp)) return SendClientMessage(playerid,RED,"USAGE: /Eject [playerid]");

		pid = strval(tmp);
		if(!IsPlayerConnected(pid)) return SendClientMessage(playerid,RED," השחקן אינו מחובר");
		if(!IsPlayerInVehicle(pid,GetPlayerVehicleID(playerid)) ) return
			SendClientMessage(playerid,RED,"! שחקן זה אינו ברכב שלך");

		RemovePlayerFromVehicle(pid);
		GameTextForPlayer(pid,"~W~You Have ~R~Ejected",3000,5);
	    PlayerPlaySound(pid,1056,0.0,0.0,0.0);
		SendClientMessage(playerid,BLUE,"Player ejected");
 		return 1;
}
//--

//

//new PlayerName[100];
//XminiGun
//new namer[256];
new animationplayed;
//new PlayerName[100];
//CarSys
//WarInvite
//new name3[256];
//GetPlayerName(playerid,name3,256);









//End
//BoMB

//--


	
//-----


	if(!strcmp(cmd, "/setpass", true)) {
		new pass[256];
        CheckPlayerCMDLevel(playerid,changepass);
	    pass = strtok(cmdtext, idx);
	    if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid,COLOR_BRIGHTRED,"אתה לא מחובר ");
	    if(!strlen(pass)) return SendClientMessage(playerid,COLOR_WHITE,"/SetPass [Password] :שימוש");
        if(Config[MaxPasswordLength] < strlen(pass) || strlen(pass) < Config[MinPasswordLength]) {
		format(string,sizeof(string)," %d-%d אורך הסיסמה חייב להיות בין",Config[MaxPasswordLength], Config[MinPasswordLength]);
		SendClientMessage(playerid,COLOR_BRIGHTRED,string);
	    return 1; }


new File:f;
if(fexist(GetPlayerFile(playerid)))
{
f = fopen(GetPlayerFile(playerid),io_append);
dini_Set(GetPlayerFile(playerid),"Password",pass);
format(string, sizeof(string), "%s :הסיסמה שלך שונתה בהצלחה, סיסמה ", pass);
SendClientMessage(playerid, COLOR_YELLOW, string);
fclose(f);
}

       return 1; }



if(!strcmp(cmd, "/changenick", true))
{
CheckPlayerCMDLevel(playerid,changenick);
new newnick[256];
newnick = strtok(cmdtext, idx);if(!strlen(newnick)) return SendClientMessage(playerid,COLOR_YELLOW,"/Changenick [NewNick] :שימוש");
if(13 < strlen(newnick) || strlen(newnick) < 3) return SendClientMessage(playerid, COLOR_YELLOW, ".אורך הכינוי חייב להיות ב3-16 תודה");
if(dini_Exists(newnick))
{
format(string, sizeof(string), ".תפוס, נסה שם אחר %s השם ", GetName(playerid));
SendClientMessage(playerid, COLOR_BRIGHTRED, string);
return 1;
}
PlayerInfo[playerid][FL] =0;
PlayerInfo[playerid][Logged] = 0;
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
dini_Set(GetPlayerFile(playerid),"State","Offine");
dini_Remove(GetPlayerFile(playerid));
format(string,sizeof(string),"RLSB/Users/%s.ini",newnick);
dini_Create(string);
new File:f, date[3], time[3];
if(fexist(string))
{
f = fopen(string,io_append);
format(string,sizeof(string),"// %s's :חשבון השחקן \r\n",newnick); fwrite(f,string);
format(string,sizeof(string),"aKillsnl=%d\r\n",PlayerInfo[playerid][aKillsnl]); fwrite(f,string);
format(string,sizeof(string),"aLevelnl=%d\r\n",PlayerInfo[playerid][aLevelnl]); fwrite(f,string);
format(string,sizeof(string),"Organization=%s\r\n","None"); fwrite(f,string);
format(string,sizeof(string),"Clan=%s\r\n","None"); fwrite(f,string);
format(string,sizeof(string),"Password=%s\r\n",dini_Get(GetPlayerFile(playerid),"Password")); fwrite(f,string);
format(string,sizeof(string),"GemelLogin=%d\r\n",PlayerInfo[playerid][GemelLogin]); fwrite(f,string);
format(string,sizeof(string),"KopatGemel=%d\r\n",PlayerInfo[playerid][KopatGemel]); fwrite(f,string);
format(string,sizeof(string),"AggInfo=%d\r\n",PlayerInfo[playerid][AggInfo]); fwrite(f,string);
format(string,sizeof(string),"Level=%d\r\n",PlayerInfo[playerid][Level]); fwrite(f,string);
format(string,sizeof(string),"Tag=%s\r\n",dini_Get(GetPlayerFile(playerid),"Tag")); fwrite(f,string);
format(string,sizeof(string),"Car=%s\r\n",dini_Get(GetPlayerFile(playerid),"Car")); fwrite(f,string);
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
fclose(f);
}
format(string, sizeof(string), "--- .הכינוי שלך השתנה בהצלחה ---",newnick);
SendClientMessage(playerid, COLOR_WHITE, string);
format(string, sizeof(string), "%s :משתמש",newnick);
SendClientMessage(playerid, COLOR_YELLOW, string);
format(string, sizeof(string), "%s :סיסמה",dini_Get(GetPlayerFile(playerid),"Password"));
SendClientMessage(playerid, COLOR_YELLOW, string);
PlayerInfo[playerid][Logged] = 0;
Kick(playerid);
return 1;
}

//if(!strcmp(cmd,"/SetNick",true) || !strcmp(cmd,"/changenick",true)) return SendClientMessage(playerid,COLOR_WHITE,"!בקרוב");

if(!strcmp(cmd,"/register",true) || !strcmp(cmd,"/r",true))
{
new pass[256];


CheckPlayerCMDLevel(playerid,register);
if(IsPlayerLogged(playerid)) return SendClientMessage(playerid,COLOR_BRIGHTRED,"אתה כבר רשום");
pass = strtok(cmdtext,idx);
if(!strlen(pass)) return SendClientMessage(playerid,COLOR_WHITE,"/Register [password] :שימוש");
if(Config[MaxPasswordLength] < strlen(pass) || strlen(pass) < Config[MinPasswordLength]) {
format(string,sizeof(string)," %d-%d אורך הסיסמה חייב להיות בין",Config[MaxPasswordLength], Config[MinPasswordLength]);
SendClientMessage(playerid,COLOR_BRIGHTRED,string);
return 1;
}
if(dini_Exists(GetPlayerFile(playerid)))
{
format(string, sizeof(string), " תפוס, נסה שם אחר %s השם ", GetName(playerid));
SendClientMessage(playerid, COLOR_BRIGHTRED, string);
return 1;
}
PlayerInfo[playerid][VIPS] = 0;
PlayerInfo[playerid][armourT] = 0;
PlayerInfo[playerid][ProfileLogged] =0;
PlayerInfo[playerid][Warnings] = 0;
PlayerInfo[playerid][Weeds] = 0;
PlayerInfo[playerid][TimeOnServer]+=1;
PlayerInfo[playerid][Logged] = 1;
PlayerInfo[playerid][Level] = 0;
PlayerInfo[playerid][Kills] = 0;
PlayerInfo[playerid][Deaths] = 0;
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

dini_IntSet(GetPlayerFile(playerid),"aLevelnl",1);
dini_IntSet(GetPlayerFile(playerid),"aKillsnl",151);

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
dini_IntSet(GetPlayerFile(playerid),"TimeOnServer",1);
dini_IntSet(GetPlayerFile(playerid),"Karts",0);
dini_IntSet(GetPlayerFile(playerid),"MonsterWin",0);
dini_IntSet(GetPlayerFile(playerid),"RPGWIN",0);
dini_IntSet(GetPlayerFile(playerid),"MiniWin",0);
dini_IntSet(GetPlayerFile(playerid),"mlg",0);

dini_Create(GetPlayerFile(playerid));
//new icqnumbers[9];
RegisterPlayer(playerid,pass);
TextDrawShowForPlayer(playerid,LEVEL);
TextDrawShowForPlayer(playerid,LEVELTEXT);
SendClientMessage(playerid, COLOR_WHITE, "--- !חשבון , משתמש נוצר בהצלחה ---");
format(string, sizeof(string),"[%s] :שם משתמש ",GetName(playerid));
SendClientMessage(playerid,0x0F482FF,string);
format(string, sizeof(string),"[%s] :סיסמא ",pass);
SendClientMessage(playerid,0x0F482FF,string);
SendClientMessage(playerid, 0x0F482FF,"/help rules - כעת הקדש/י 20 שניות לקריאת החוקים");
dini_IntSet(GetPlayerFile(playerid),"Kills",0);
dini_IntSet(GetPlayerFile(playerid),"Deaths",0);
dini_IntSet(GetPlayerFile(playerid),"Bank",0);
//SetTimer("Rules",6000,0);
PlayerInfo[playerid][Logged] = 1;
PlayerInfo[playerid][Level] = 0;
PlayerInfo[playerid][Kills] = 0;
PlayerInfo[playerid][Deaths] = 0;
format(string, sizeof(string), ".נרשמ/ה לשרת  %s ", GetName(playerid));
SendClientMessageToAll(0x0F482FF, string);
NoChat[playerid] = 0;
return 1;
}
if(!strcmp(cmd,"/login",true) || !strcmp(cmd,"/www",true)) {
new pass2[256];
CheckPlayerCMDLevel(playerid,login);
if(IsPlayerLogged(playerid)) return SendClientMessage(playerid, COLOR_BRIGHTRED, ".אתה כבר מחובר");
pass2 = strtok(cmdtext,idx);
if(!strlen(pass2)) return SendClientMessage(playerid,COLOR_WHITE,"USAGE: /Login [password]");
if(Config[MaxPasswordLength] < strlen(pass2) || strlen(pass2) < Config[MinPasswordLength]) {
format(string,sizeof(string)," %d-%d אורך הסיסמה חייב להיות בין",Config[MaxPasswordLength], Config[MinPasswordLength]);
SendClientMessage(playerid,COLOR_BRIGHTRED,string);
return 1;
}
if(!dini_Exists(GetPlayerFile(playerid)))
{
format(string, sizeof(string), "/Register <> [Password] :תרשם עם הפקודה ,%s ", GetName(playerid));
SendClientMessage(playerid, COLOR_WHITE, string);
return 1;
}
if(!strcmp(pass2,dini_Get(GetPlayerFile(playerid),"Password"),true))
{
LoginPlayer(playerid);
if(dini_Exists(GetPlayerFile(playerid)))
//rr[playerid] =0;
SendClientMessage(playerid,COLOR_LIGHTBLUE, ".Satla-Zone.co.il - את/ה מחובר/ת כעת בהצלחה! תהננו. צוות");
PlayerInfo[playerid][TimeOnServer] +=1;
NoChat[playerid] =0;
format(string, sizeof(string), ".התחבר/ה לשרת %s", GetName(playerid));
SendClientMessageToAll(0x0F482FF, string);
TextDrawShowForPlayer(playerid,LEVEL);
TextDrawShowForPlayer(playerid,LEVELTEXT);
}
else
{
PlayerInfo[playerid][FL]++;
format(string,sizeof(string),"Wrong Password. - (%d/4) ", PlayerInfo[playerid][FL]);
SendClientMessage(playerid,COLOR_WHITE,string);
if(PlayerInfo[playerid][FL] >= 4)
{
Kick(playerid);
}
}
return 1;
}

if(NoChat[playerid] ==1) return SendClientMessage(playerid,red,".אתה לא יכול לעשות פקודות עד שלא תתחבר");
if(!strcmp(cmd, "/pstats", true))
{
new sid[256], id;
sid = strtok(cmdtext,idx);

id = ReturnID(sid);
if(!IsPlayerConnected(id)) return SendClientMessage(playerid,red,".המספר איידי שהזנת שגוי");
format(string, sizeof(string), ".-- [%s`s] :הסטאטס של --",GetName(id)),SendClientMessage(playerid, COLOR_WHITE, string);
format(string, sizeof(string), ".%d רמה",PlayerInfo[id][Level]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), ".%d הריגות",PlayerInfo[id][Kills]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), ".%d :הריגות לרמה הבאה של השחקן",PlayerInfo[id][aKillsnl]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), ".%d :רמה הבאה",PlayerInfo[id][aLevelnl]),SendClientMessage(playerid, COLOR_GREY, string);

format(string, sizeof(string), ".%d כסף בבנק",PlayerInfo[id][Bank]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), ".%d :רמת כבוד בשרת",PlayerInfo[id][VIPS]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "Won: Wars: %d, Karting: %d, Monster: %d, Minigun: %d ,Mlgzohot: %d ,Rpg (Bazooka): %d",PlayerInfo[id][Wars],PlayerInfo[id][Kart],PlayerInfo[id][Monster],PlayerInfo[id][MINIGUN],PlayerInfo[id][Mlg],PlayerInfo[id][RPGS]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "/pprofile %d /pdetails %d :השתמש בפקודות ,%s לעוד מידע על השחקן",id,id,GetName(id));
SendClientMessage(playerid, COLOR_GREY, string);

return 1;
}
/*
new ignore[MAX_PLAYERS];
if(!strcmp(cmd, "/ignore", true))
{
tmp = strtok(cmdtext, idx);
new id = ReturnID(tmp);
if(!strlen(tmp)) return SendClientMessage(playerid, WHITE, "/ignore [playerid] :שימוש נכון");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid,red,".המספר איידי שהזנת שגוי");
SendClinetMessage(id,COLOR_WHITE,".חסם אותך עכשיו הוא לא יראה ממך יותר הודעות %s`s השחקן",GetName(playerid));
SendClinetMessage(id,COLOR_WHITE,"!בהצלחה כעת לא תראה ממנו הודעות פרטיות ,%s חסמת את השחקן",GetName(id));
ignore[id] =1;
ignore[playerid] =1;
return 1;
}
if(!strcmp(cmd, "/unignore", true))
{
tmp = strtok(cmdtext, idx);
new id = ReturnID(tmp);
if(!strlen(tmp)) return SendClientMessage(playerid, WHITE, "/ignore [playerid] :שימוש נכון");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid,red,".המספר איידי שהזנת שגוי");
SendClinetMessage(id,COLOR_WHITE,".חסם אותך עכשיו הוא לא יראה ממך יותר הודעות %s`s השחקן",GetName(playerid));
SendClinetMessage(id,COLOR_WHITE,"!בהצלחה כעת לא תראה ממנו הודעות פרטיות ,%s חסמת את השחקן",GetName(id));
ignore[id] =0;
ignore[playerid] =1;
return 1;
}
*/
//Warnings

//End

if(!strcmp(cmd, "/stats", true))
{
format(string, sizeof(string), ".-- [%s`s] :הסטאטס שלך --",GetName(playerid)),SendClientMessage(playerid, COLOR_WHITE, string);
format(string, sizeof(string), ".%d רמה",PlayerInfo[playerid][Level]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), ".%d הריגות",PlayerInfo[playerid][Kills]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), ".%d :הריגות שנשראו לך לעלות לרמה הבאה",PlayerInfo[playerid][aKillsnl]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), ".%d :רמה הבאה",PlayerInfo[playerid][aLevelnl]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), ".%d כסף בבנק",PlayerInfo[playerid][Bank]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), ".%d :רמת כבוד בשרת",PlayerInfo[playerid][VIPS]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "Won: Wars: %d, Karting: %d, Monster: %d, Minigun: %d ,Mlgzohot: %d ,Rpg (Bazooka): %d",PlayerInfo[playerid][Wars],PlayerInfo[playerid][Kart],PlayerInfo[playerid][Monster],PlayerInfo[playerid][MINIGUN],PlayerInfo[playerid][Mlg],PlayerInfo[playerid][RPGS]);
SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "/details /profile :להציג עוד מידע",PlayerInfo[playerid][Wars],PlayerInfo[playerid][Kart],PlayerInfo[playerid][Monster],PlayerInfo[playerid][MINIGUN],PlayerInfo[playerid][Mlg],PlayerInfo[playerid][RPGS]);
SendClientMessage(playerid, COLOR_GREY, string);

return 1;
}

if(!strcmp(cmd, "/Details", true))
{
new Float:health,Float:armour;
GetPlayerHealth(playerid,health),GetPlayerArmour(playerid,armour);
format(string, sizeof(string), ".-- [%s`s] פרטי השחקן --",GetName(playerid)),SendClientMessage(playerid, COLOR_WHITE, string);
format(string, sizeof(string), "Weeds: %d/10", PlayerInfo[playerid][Weeds]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "TimeOnServer: %d",PlayerInfo[playerid][TimeOnServer]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "Exp: %d",PlayerInfo[playerid][VIPS]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "Clan: %s", dini_Get(GetPlayerFile(playerid),"Clan")),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "Organization: %s", dini_Get(GetPlayerFile(playerid),"organization")),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "Warnings: %d/10", PlayerInfo[playerid][Warnings]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "Car: %s", dini_Get(GetPlayerFile(playerid),"Car")),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "Tag: %s", dini_Get(GetPlayerFile(playerid),"Tag")),SendClientMessage(playerid, COLOR_GREY, string);
if(PlayerInfo[playerid][VIPS] == 0) return SendClientMessage(playerid,COLOR_GREY,"Team: Normal");
if(PlayerInfo[playerid][VIPS] >= 1) return format(string, sizeof(string), ".Team: VIP Level - VIP: %d ", PlayerInfo[playerid][VIPS]),SendClientMessage(playerid, COLOR_GREY, string);



return 1;

}
if(!strcmp(cmd, "/pDetails", true))
{
new sid[256], id;
sid = strtok(cmdtext,idx);

id = ReturnID(sid);
 if(!strlen(sid)) return SendClientMessage(playerid, COLOR_WHITE, "/pDetails [id]");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid,WHITE,".שחקנ/ית לא מחובר/ת");

new Float:health;
new Float:armour;
GetPlayerHealth(id,health);

GetPlayerArmour(id,armour);

format(string, sizeof(string), ".-- [%s`s] פרטי השחקן --",GetName(id)),SendClientMessage(playerid, COLOR_WHITE, string);
format(string, sizeof(string), "Weeds: %d/10", PlayerInfo[id][Weeds]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "TimeOnServer: %d",PlayerInfo[id][TimeOnServer]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "Exp: %d",PlayerInfo[id][VIPS]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "Clan: %s", dini_Get(GetPlayerFile(id),"Clan")),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "Organization: %s", dini_Get(GetPlayerFile(id),"organization")),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "Warnings: %d/10", PlayerInfo[id][Warnings]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "Car: %s", dini_Get(GetPlayerFile(id),"Car")),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "Tag: %s", dini_Get(GetPlayerFile(id),"Tag")),SendClientMessage(playerid, COLOR_GREY, string);
if(PlayerInfo[id][VIPS] == 0) return SendClientMessage(playerid,COLOR_GREY,"Team: Normal");
if(PlayerInfo[id][VIPS] >= 1) return format(string, sizeof(string), ".Team: VIP Level - VIP: %d ", PlayerInfo[id][VIPS]),SendClientMessage(playerid, COLOR_GREY, string);

return 1;
}

if(!strcmp(cmd, "/SysAdmin", true))
{
if (PlayerInfo[playerid][AdminsLevel] >= 10)
{
SendClientMessage(playerid,COLOR_WHITE,".--- עזרה לאדמינים מערכות ---");
SendClientMessage(playerid,COLOR_GREY,"/StartWar - וואר התחלה - /StartKart - קארט התחלה");
SendClientMessage(playerid,COLOR_GREY,"/sMlgzohot - מלגזות התחלה - /StartMonster - מונסטר התחלה");
SendClientMessage(playerid,COLOR_GREY,"/sRpg טילים התחלה - /sMini - מיניגאן התחלה /startrace להתחלת מירוץ");
SendClientMessage(playerid,COLOR_GREY,"/stria להתחיל טריאטלון -  /startdrift להתחלת מירוץ דריפט");

SendClientMessage(playerid,COLOR_GREY,"/Warnings אזהרה לשחקן - /SetBank ערוך בנק - /SetKills ערוך הריגות");
SendClientMessage(playerid,COLOR_GREY,"/GiveSup [playerid] [1] :כדאי לתת למישהוא להיות חבר בצוות תמיכה");
SendClientMessage(playerid,COLOR_GREY,"/GiveVip [playerid] [levelvip] .אדמינים שימו לב תתנו רק למי שבאמת משקיע בשרת VIPלתת למישהוא גישות ל");
SendClientMessage(playerid,COLOR_GREY,"!לכם אתם יכולים לתת האדמינים. תזכרו לא לתת לסתם אנשים");
SendClientMessage(playerid,COLOR_GREY,"לכל מי שאתם נותנים תתנו לא לקרוא את זה - ./help 20 VIPלעזרה מושלמת עם מערכת ה");


//
}
else
{
SendClientMessage(playerid,COLOR_WHITE,".רק אדמינים רמה 10 ומעלה יכולים לראות את הפקודות");
}
return 1;
}


if(!strcmp(cmd,"/sp",true))
{
if (PlayerInfo[playerid][Kills] >= 300)
{
new Float:p[3];
GetPlayerPos(playerid,p[0],p[1],p[2]);
if(PlayerInfo[playerid][Saved] == 1) {
SendClientMessage(playerid,WHITE,".שמרת מקום חדש");
}
else
{
SendClientMessage(playerid,WHITE,".שמרת מקום חדש");
}
PlayerInfo[playerid][Saved] = 1, PlayerInfo[playerid][SPX] = p[0], PlayerInfo[playerid][SPY] = p[1], PlayerInfo[playerid][SPZ] = p[2], PlayerInfo[playerid][SPI] = GetPlayerInterior(playerid);
dini_IntSet(GetPlayerFile(playerid),"Saved",1);
dini_FloatSet(GetPlayerFile(playerid),"SavePosX",PlayerInfo[playerid][SPX]);
dini_FloatSet(GetPlayerFile(playerid),"SavePosY",PlayerInfo[playerid][SPY]);
dini_FloatSet(GetPlayerFile(playerid),"SavePosZ",PlayerInfo[playerid][SPZ]);
dini_IntSet(GetPlayerFile(playerid),"SavePosI",PlayerInfo[playerid][SPI]);
}
else
{
SendClientMessage(playerid,COLOR_WHITE,"שמירת מיקום מרמה 2 ומעלה");
}
return 1;
}




//====================Bank Transfer
if(!strcmp(cmd, "/banktransfer", true)) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) return SendClientMessage(playerid, 0x0C4E0FF, " /banktransfer [playerid] [amount] :שימוש");
giveplayerid = strval(tmp);
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) return SendClientMessage(playerid, 0x0C4E0FF, " /banktransfer [playerid] [amount] :שימוש");
moneysa[playerid] = strval(tmp);
if(!IsPlayerConnected(giveplayerid)) {
format(string, sizeof(string), " לא מחובר ID:%d ", giveplayerid);
SendClientMessage(playerid, COLOR_BRIGHTRED, string);
return 1;
}
if(moneysa[playerid] < 0 && PlayerInfo[playerid][Bank] < moneysa[playerid]) return SendClientMessage(playerid, COLOR_BRIGHTRED, " סכום העברה שגוי ");
PlayerInfo[playerid][Bank] = PlayerInfo[playerid][Bank]-moneysa[playerid];
dini_IntSet(GetPlayerFile(playerid),"Bank",PlayerInfo[playerid][Bank]);
PlayerInfo[giveplayerid][Bank] = PlayerInfo[giveplayerid][Bank]+moneysa[playerid];
dini_IntSet(GetPlayerFile(giveplayerid),"Bank",PlayerInfo[giveplayerid][Bank]);
format(string, sizeof(string), " $%d ,%s (id: %d) העברת לחשבון הבנק של ", moneysa[playerid] , GetName(giveplayerid), giveplayerid);
SendClientMessage(playerid, COLOR_GREEN, string);
format(string, sizeof(string), " $%d העביר לחשבון בנק שלך %s (id: %d) ", moneysa[playerid], GetName(playerid), playerid);
SendClientMessage(giveplayerid, COLOR_GREEN, string);
return 1;
}

if(strcmp(cmd, "/VIP", true) == 0)
{
new Roy_Killer[256];
Roy_Killer= strtok(cmdtext, idx);
if(!strlen(Roy_Killer))
{
SendClientMessage(playerid,WHITE,"/VIP Camrea/off/list/go -  - :אפשריות ");

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
SendClientMessage(playerid,COLOR_WHITE,".בלבד VIP פקודה זאתי לחברי");
}
}
else if(strcmp(Roy_Killer,"Camrea",true) == 0)
{
if (PlayerInfo[playerid][VIPS] >= 1)
{

SetPlayerCameraPos(playerid,264.5831,1896.2504,33.8984);
SetPlayerCameraLookAt(playerid,212.5598,1895.0790,16.2901);
SendClientMessage(playerid,red,".שלך VIPכעת אתה מסתכל על מפקדת ה");
}
else
{
SendClientMessage(playerid,COLOR_WHITE,".בלבד VIP פקודה זאתי לחברי");
}
}
else if(strcmp(Roy_Killer,"Go",true) == 0)
{
if (PlayerInfo[playerid][VIPS] >= 1)
{
SetPlayerPos(playerid,212.5598,1895.0790,16.2901);
SetPlayerInterior(playerid,0);
SendClientMessage(playerid,red,".כאן התגוררו חברי השרת VIPברוכים הבאים למפקדה ה");
}
else
{
SendClientMessage(playerid,COLOR_WHITE,".בלבד VIP פקודה זאתי לחברי");
}
}
else if(strcmp(Roy_Killer,"list",true) == 0)
{
if(IsPlayerConnected(playerid))
{
format(string, 256, "--- :שמחוברים לשרת VIP חברי ---");
SendClientMessage(playerid, COLOR_WHITE, string);

for(new i = 0; i < MAX_PLAYERS; i++)
{
if(IsPlayerConnected(i))
{
if(PlayerInfo[i][VIPS] >=1)
{
format(string, 256, " %s  [%d] ", GetName(i), i);
SendClientMessage(playerid, COLOR_GREY, string);
}
}
}
}
}
return 1;
}
//====================BANK
if (strcmp("/Bank", cmdtext, true, 10) == 0) return SetPlayerPos(playerid,2144.0793,1612.3879,993.6882),SetPlayerInterior(playerid,1),ResetPlayerWeapons(playerid),GameTextForPlayer(playerid,"~w~Bank",3000,1),SendClientMessage(playerid, 0xFFFF00AA, ".ברוכים הבאים לבנק");

if (strcmp("/ser", cmdtext, true, 10) == 0)return SetPlayerPos(playerid, -2127.5107,921.3911,79.4371);
if (strcmp("/vinfo", cmdtext, true, 10) == 0){
new Float:healths;
new vehicleid = GetPlayerVehicleID(playerid);
GetVehicleHealth(vehicleid, healths);

if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,RED,"! אתה צריך להיות במכונית שאתה רוצה ליקנות ");
SendClientMessage(playerid,COLOR_WHITE,".-- .הפרטים עבור הרכב שאתה נוסע בוא --");
format(string, sizeof(string), "%.1f  :החיים של הרכב", healths),SendClientMessage(playerid, COLOR_GREY, string);
format(vehname,999,".%s :השם של הרכב",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,COLOR_GREY,vehname);
format(vehname,999,".%d :האיידי של הרכב",GetVehicleModel(GetPlayerVehicleID(playerid))),SendClientMessage(playerid,COLOR_GREY,vehname);

return 1;
}
if (strcmp("/loanplayer", cmdtext, true, 10) == 0)
{
if (PlayerInfo[playerid][AdminsLevel] >= 13)
{
loan();
}
else
{
SendClientMessage(playerid,red, ".פקודה זאתי לאדמינים רמה 13 ומעלה בלבד");
SetPlayerInterior(playerid,1);
SetPlayerPos(playerid, 2536.1401,-1675.6179,1015.4986);
}
return 1;
}
//====================Bank System
if(!strcmp(cmd, "/deposit", true))
{
if(!CPS_IsPlayerInCheckpoint(playerid,bcp)) return SendClientMessage(playerid,COLOR_WHITE," אתה חייב להיות בצ'ק פוינט של הבנק כדי להישתמש בפקודה זו ");
tmp = strtok(cmdtext, idx);
if(PlayerInfo[playerid][GetAloan] ==1) return format(string, sizeof(string),"%d :אתה חייב לבנק סכום כספי של",PlayerInfo[playerid][MoneyLoan]),SendClientMessage(playerid,red,string),SendClientMessage(playerid,red,".חסר לך כסף להחזרת ההלואה אנא אסוף תכסף והחזר לבנק עד אז לא תוכל להשתמש בבנק");
if(!strlen(tmp)) return SendClientMessage(playerid, 0x0C4E0FF, " /deposit [amount] :שימוש ");
moneysa[playerid] = strval(tmp);
if(moneysa[playerid] < 1) return SendClientMessage(playerid, COLOR_BRIGHTRED, " אתה חייב להכניס סכום יותר גדול מ 0 ");
if(PlayerInfo[playerid][Bank] > 30000000) return SendClientMessage(playerid, COLOR_BRIGHTRED,".אתה לא יכול להפקיד יותר כסף בבנק חשבונך התמלא");
if(GetPlayerMoney(playerid) < moneysa[playerid]) return SendClientMessage(playerid, COLOR_BRIGHTRED, " אין לך מספיק כסף ");
LACY_GiveMoney(playerid, 0-moneysa[playerid]);
PlayerInfo[playerid][Bank] = PlayerInfo[playerid][Bank]+moneysa[playerid];
dini_IntSet(GetPlayerFile(playerid),"Bank",PlayerInfo[playerid][Bank]);
format(string, sizeof(string), " [$%d] :הפקדת בחשבון הבנק שלך ,[$%d] :יש לך בחשבון הבנק", PlayerInfo[playerid][Bank], moneysa[playerid]);
SendClientMessage(playerid, COLOR_GREEN, string);



return 1;
}

if(!strcmp(cmd, "/depositall", true))
{
if(!CPS_IsPlayerInCheckpoint(playerid,bcp)) return SendClientMessage(playerid,COLOR_WHITE,".אתה חייב להיות בצ'ק פוינט של הבנק כדי להישתמש בפקודה זו ");
if(GetPlayerMoney(playerid) < 0) return SendClientMessage(playerid, COLOR_BRIGHTRED, " אין לך מספיק כסף ");
moneysa[playerid] = strval(tmp);
if(PlayerInfo[playerid][Bank] > 30000000) return SendClientMessage(playerid, COLOR_BRIGHTRED,".אתה לא יכול להפקיד יותר כסף בבנק חשבונך התמלא");
if(PlayerInfo[playerid][GetAloan] ==1) return format(string, sizeof(string),"%d :אתה חייב לבנק סכום כספי של",PlayerInfo[playerid][MoneyLoan]),SendClientMessage(playerid,red,string),SendClientMessage(playerid,red,".חסר לך כסף להחזרת ההלואה אנא אסוף תכסף והחזר לבנק עד אז לא תוכל להשתמש בבנק");
PlayerInfo[playerid][Bank] = PlayerInfo[playerid][Bank]+GetPlayerMoney(playerid);
dini_IntSet(GetPlayerFile(playerid),"Bank",PlayerInfo[playerid][Bank]);
format(string, sizeof(string), " [$%d] :הפקדת בחשבון הבנק שלך ,[$%d] :יש לך בחשבון הבנק", PlayerInfo[playerid][Bank], GetPlayerMoney(playerid));
SendClientMessage(playerid, COLOR_GREEN, string);
LACY_GiveMoney(playerid, 0-GetPlayerMoney(playerid));



return 1;
}
//====================Withdraw from Bank
if(!strcmp(cmd, "/withdraw", true))
{
if(!CPS_IsPlayerInCheckpoint(playerid,bcp)) return SendClientMessage(playerid,COLOR_WHITE," אתה חייב להיות בצ'ק פוינט של הבנק כדי להישתמש בפקודה זו ");
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) return SendClientMessage(playerid, 0x0C4E0FF, " /withdraw [amount] :שימוש ");
moneysa[playerid] = strval(tmp);
if(moneysa[playerid] < 1) return SendClientMessage(playerid, COLOR_BRIGHTRED, "אתה חייב להכניס סכום יותר גדול מ 0  ");
moneysa[playerid] = strval(tmp);
if(moneysa[playerid] > PlayerInfo[playerid][Bank]) return SendClientMessage(playerid, COLOR_BRIGHTRED, " סכום משיכה שגוי ");
LACY_GiveMoney(playerid, moneysa[playerid]);
PlayerInfo[playerid][Bank] = PlayerInfo[playerid][Bank]-moneysa[playerid];
dini_IntSet(GetPlayerFile(playerid),"Bank",PlayerInfo[playerid][Bank]);
format(string, sizeof(string), "[$%d] נשאר לך בחשבון הבנק ,[$%d] משכת מחשבון הבנק שלך",  moneysa[playerid],PlayerInfo[playerid][Bank]);
SendClientMessage(playerid, COLOR_GREEN, string);
return 1;
}
//====================Balance
if(!strcmp(cmd, "/balance", true)) {
if(!CPS_IsPlayerInCheckpoint(playerid,bcp)) return SendClientMessage(playerid,COLOR_WHITE," אתה חייב להיות בצ'ק פוינט של הבנק כדי להישתמש בפקודה זו ");
format(string, sizeof(string), " [$%d] יש לך בבנק", PlayerInfo[playerid][Bank]);
SendClientMessage(playerid, COLOR_GREEN, string);
return 1;
}





if(!strcmp(cmd,"/weaponlist",true) || !strcmp(cmd,"/WL",true))
{
if(IsPlayerInCheckpoint(playerid)==0 || playerCheckpoint[playerid]!=CP_AMMU) {
SendClientMessage(playerid, COLOR_WHITE, ".אתה חייב להיות בנקודת ציון בחנות נשקים");
return 1;
}




new Roy_Killer1111[256];
Roy_Killer1111= strtok(cmdtext, idx);
if(!strlen(Roy_Killer1111))
{
SendClientMessage(playerid, COLOR_BRIGHTRED, "/WL [1-2] רשימת נשקים");

return 1;
}


else if(strcmp(Roy_Killer1111,"1",true) == 0)
{

SendClientMessage(playerid, COLOR_WHITE, "-- .רשימת נשקים תמידיים --");
SendClientMessage(playerid, 0xFFFF00AA, "./Bw 1 M4 45000$");
SendClientMessage(playerid, 0xFFFF00AA, "./Bw 2 Micro MSG 15000$");
SendClientMessage(playerid, 0xFFFF00AA, "./Bw 3 Tec9 10000$");
SendClientMessage(playerid, 0xFFFF00AA, "./Bw 4 ShotGun 10000$");
SendClientMessage(playerid, 0xFFFF00AA, "./Bw 5 Sawnoff Shotgun 18000$");
SendClientMessage(playerid, 0xFFFF00AA, "./Bw 6 Rifle 10,000$");
SendClientMessage(playerid, 0xFFFF00AA, "./Bw 7 Rifle Sniper 10,000$");

return 1;
}



else if(strcmp(Roy_Killer1111,"2",true) == 0)
{

SendClientMessage(playerid, COLOR_WHITE, "--  .רשימת נשקים תמידיים מס' 2 --");
SendClientMessage(playerid, 0xFFFF00AA, "./Bw 8 (17) - 100000$ Rpg/Bazooka");


return 1;
}

return 1;
}

if(!strcmp(cmd,"/armourT",true) || !strcmp(cmd,"/armourT",true))
{

if(IsPlayerInCheckpoint(playerid)==0 || playerCheckpoint[playerid]!=CP_AMMU) {
SendClientMessage(playerid, COLOR_WHITE, ".אתה חייב להיות בנקודת ציון בחנות נשקים");
return 1;
}
if(GetPlayerMoney(playerid) < 100000) return SendClientMessage(playerid,RED,".אין לך מספיק כסף בשביל ליקנות את המכונית הזאות ");
if(PlayerInfo[playerid][armourT] ==1) return SendClientMessage(playerid,COLOR_WHITE,"/SelArmour .כבר יש לך מגן תמידי כדאי למכור אותו ולקבל חצי מהכסף");

LACY_GiveMoney(playerid,-100000);


SetPlayerArmour(playerid,100);
PlayerInfo[playerid][armourT] = 1;
dini_IntSet(GetPlayerFile(playerid),"armour",PlayerInfo[playerid][armourT]);

SendClientMessage(playerid, 0x0F482FF, ".(armour),תתחדש/י קנית מגן תמידי");

return 1;
}
if(!strcmp(cmd,"/Sellarmour",true) || !strcmp(cmd,"/armourarmourarmour",true))
{

if(IsPlayerInCheckpoint(playerid)==0 || playerCheckpoint[playerid]!=CP_AMMU) {
SendClientMessage(playerid, COLOR_WHITE, ".אתה חייב להיות בנקודת ציון בחנות נשקים");
return 1;
}
if(PlayerInfo[playerid][armourT] ==0) return SendClientMessage(playerid,COLOR_WHITE,".אין בידך שלך מגן תמידי");
SetPlayerArmour(playerid,0);
PlayerInfo[playerid][armourT] = 0;

SendClientMessage(playerid, 0x0F482FF, ".זרקת את המגן שלך בהצלחה וקיבלת חצי מסכום הקנייה");
LACY_GiveMoney(playerid,50000);
return 1;
}
new Invis[MAX_PLAYERS]=0;
if(!strcmp(cmd, "/INV", true))
{
if(PlayerInfo[playerid][AdminsLevel] < 1)return 1;

SetPlayerColor(playerid, 0xFFFFFF00);
SendClientMessage(playerid, WHITE,"/uninv .כעת אתה שקוף במפה על מנת לחזור למצב רגיל");
Invis[playerid] =1;


return 1;
}
if(!strcmp(cmd, "/unINV", true))
{
SetPlayerColor(playerid,sgba2hex(random(256),random(256),random(256),55));//צבע במפה
SendClientMessage(playerid, red,".כעת יצאת ממצב שקיפות");
Invis[playerid] =0;
return 1;
}
if(!strcmp(cmd,"/bw",true) || !strcmp(cmd,"/BuyWeapon",true))
{
if(IsPlayerInCheckpoint(playerid)==0 || playerCheckpoint[playerid]!=CP_AMMU) {
SendClientMessage(playerid, COLOR_WHITE, ".אתה חייב להיות בנקודת ציון בחנות נשקים");
return 1;
}

GetPlayerName(playerid, pName, sizeof(pName));
format(file,256,"%s.ini",pName);
S2W = dini_Get(file, "S2W");
S2A = dini_Get(file, "S2A");
S3W = dini_Get(file, "S3W");
S3A = dini_Get(file, "S3A");
S4W = dini_Get(file, "S4W");
S4A = dini_Get(file, "S4A");
S5W = dini_Get(file, "S5W");
S5A = dini_Get(file, "S5A");
S6W = dini_Get(file, "S6W");
S6A = dini_Get(file, "S6A");
new Roy_Killer1111[256];
Roy_Killer1111= strtok(cmdtext, idx);
if(!strlen(Roy_Killer1111))
{
SendClientMessage(playerid, COLOR_BRIGHTRED, "/BW [1-7] רשימת נשקים");

return 1;
}


else if(strcmp(Roy_Killer1111,"1",true) == 0)
{
GetPlayerName(playerid, pName, sizeof(pName));
format(file,256,"%s.ini",pName);
S2W = dini_Get(file, "S2W");
S2A = dini_Get(file, "S2A");
S3W = dini_Get(file, "S3W");
S3A = dini_Get(file, "S3A");
S4W = dini_Get(file, "S4W");
S4A = dini_Get(file, "S4A");
S5W = dini_Get(file, "S5W");
S5A = dini_Get(file, "S5A");
S6W = dini_Get(file, "S6W");
S6A = dini_Get(file, "S6A");
if (PlayerInfo[playerid][Level] >= 3)
{
if(GetPlayerMoney(playerid) < 45000) return SendClientMessage(playerid,RED,"אין לך מספיק כסף לקניית נשק זה");

if(strval(S5W) == 31)
{
GivePlayerWeapon(playerid,31,100);
LACY_GiveMoney(playerid, -45000);
dini_IntSet(file,"S5A",strval(S5A)+100);
}
else if(strval(S5W) !=31)
{
GivePlayerWeapon(playerid,31,100);
LACY_GiveMoney(playerid, -45000);
dini_IntSet(file, "S5A",100);
dini_IntSet(file, "S5W",31);
}
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".בהצלחה (M4)קנית 100 כדורים לנשק");



}
else
{
SendClientMessage(playerid,COLOR_WHITE,".זמינה מרמה 3 ומעלה ``M4`` קניית הנשק");
}
return 1;
}



else if(strcmp(Roy_Killer1111,"2",true) == 0)
{
GetPlayerName(playerid, pName, sizeof(pName));
format(file,256,"%s.ini",pName);
S2W = dini_Get(file, "S2W");
S2A = dini_Get(file, "S2A");
S3W = dini_Get(file, "S3W");
S3A = dini_Get(file, "S3A");
S4W = dini_Get(file, "S4W");
S4A = dini_Get(file, "S4A");
S5W = dini_Get(file, "S5W");
S5A = dini_Get(file, "S5A");
S6W = dini_Get(file, "S6W");
S6A = dini_Get(file, "S6A");

if(GetPlayerMoney(playerid) >= 15000)
{
if(strval(S4W) == 28)
{
GivePlayerWeapon(playerid,28,100);
LACY_GiveMoney(playerid, -15000);
dini_IntSet(file,"S4A",strval(S4A)+500);
}
else if(strval(S4W) !=28)
{
GivePlayerWeapon(playerid,28,500);
LACY_GiveMoney(playerid, -15000);
dini_IntSet(file, "S4A",500);
dini_IntSet(file, "S4W",28);
}
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".בהצלחה (Micro MSG)קנית 100 כדורים לנשק");

}
else
{
SendClientMessage(playerid,COLOR_BRIGHTRED," אין לך מספיק כסף כדי לקנות נשק זה ");
}
return 1;
}


else if(strcmp(Roy_Killer1111,"3",true) == 0)
{
GetPlayerName(playerid, pName, sizeof(pName));
format(file,256,"%s.ini",pName);
S2W = dini_Get(file, "S2W");
S2A = dini_Get(file, "S2A");
S3W = dini_Get(file, "S3W");
S3A = dini_Get(file, "S3A");
S4W = dini_Get(file, "S4W");
S4A = dini_Get(file, "S4A");
S5W = dini_Get(file, "S5W");
S5A = dini_Get(file, "S5A");
S6W = dini_Get(file, "S6W");
S6A = dini_Get(file, "S6A");

if(GetPlayerMoney(playerid) >= 10000)
{
if(strval(S4W) == 32)
{
GivePlayerWeapon(playerid,32,200);
LACY_GiveMoney(playerid, -10000);
dini_IntSet(file,"S4A",strval(S4A)+200);
}
else if(strval(S4W) !=32)
{
GivePlayerWeapon(playerid,32,500);
LACY_GiveMoney(playerid, -10000);
dini_IntSet(file, "S4A",500);
dini_IntSet(file, "S4W",32);
}
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".בהצלחה (Tec9)קנית 100 כדורים לנשק");
}
else
{
SendClientMessage(playerid,COLOR_BRIGHTRED," אין לך מספיק כסף כדי לקנות נשק זה ");
}
return 1;
}


else if(strcmp(Roy_Killer1111,"4",true) == 0)
{
GetPlayerName(playerid, pName, sizeof(pName));
format(file,256,"%s.ini",pName);
S2W = dini_Get(file, "S2W");
S2A = dini_Get(file, "S2A");
S3W = dini_Get(file, "S3W");
S3A = dini_Get(file, "S3A");
S4W = dini_Get(file, "S4W");
S4A = dini_Get(file, "S4A");
S5W = dini_Get(file, "S5W");
S5A = dini_Get(file, "S5A");
S6W = dini_Get(file, "S6W");
S6A = dini_Get(file, "S6A");
if(GetPlayerMoney(playerid) >= 10000)
{
if(strval(S3W) == 25)
{
GivePlayerWeapon(playerid,25,100);
LACY_GiveMoney(playerid, -10000);
dini_IntSet(file,"S3A",strval(S3A)+100);
}
else if(strval(S3W) !=25)
{
GivePlayerWeapon(playerid,25,100);
LACY_GiveMoney(playerid, -10000);
dini_IntSet(file, "S3A",100);
dini_IntSet(file, "S3W",25);
}
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".בהצלחה (Sohtgan)קנית 100 כדורים לנשק");
}
else
{
SendClientMessage(playerid,COLOR_BRIGHTRED," אין לך מספיק כסף כדי לקנות נשק זה ");
}
return 1;
}



else if(strcmp(Roy_Killer1111,"5",true) == 0)
{
GetPlayerName(playerid, pName, sizeof(pName));
format(file,256,"%s.ini",pName);
S2W = dini_Get(file, "S2W");
S2A = dini_Get(file, "S2A");
S3W = dini_Get(file, "S3W");
S3A = dini_Get(file, "S3A");
S4W = dini_Get(file, "S4W");
S4A = dini_Get(file, "S4A");
S5W = dini_Get(file, "S5W");
S5A = dini_Get(file, "S5A");
S6W = dini_Get(file, "S6W");
S6A = dini_Get(file, "S6A");

if(GetPlayerMoney(playerid) >= 18000)
{
if(strval(S3W) == 26)
{
GivePlayerWeapon(playerid,26,100);
LACY_GiveMoney(playerid, -18000);
dini_IntSet(file,"S3A",strval(S3A)+100);
}
else if(strval(S3W) !=26)
{
GivePlayerWeapon(playerid,26,100);
LACY_GiveMoney(playerid, -18000);
dini_IntSet(file, "S3A",100);
dini_IntSet(file, "S3W",26);
}
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".בהצלחה (Sawnoff Shotgun)קנית 100 כדורים לנשק");

}
else
{
SendClientMessage(playerid,COLOR_BRIGHTRED," אין לך מספיק כסף כדי לקנות נשק זה ");
}
return 1;
}
else if(strcmp(Roy_Killer1111,"6",true) == 0)
{
GetPlayerName(playerid, pName, sizeof(pName));
format(file,256,"%s.ini",pName);
S2W = dini_Get(file, "S2W");
S2A = dini_Get(file, "S2A");
S3W = dini_Get(file, "S3W");
S3A = dini_Get(file, "S3A");
S4W = dini_Get(file, "S4W");
S4A = dini_Get(file, "S4A");
S5W = dini_Get(file, "S5W");
S5A = dini_Get(file, "S5A");
S6W = dini_Get(file, "S6W");
S6A = dini_Get(file, "S6A");

if(GetPlayerMoney(playerid) >= 10000)
{
if(strval(S6W) == 33)
{
GivePlayerWeapon(playerid,33,100);
LACY_GiveMoney(playerid, -10000);
dini_IntSet(file,"S6A",strval(S6A)+100);
}
else if(strval(S6W) !=33)
{
GivePlayerWeapon(playerid,34,100);
LACY_GiveMoney(playerid, -10000);
dini_IntSet(file, "S6A",100);
dini_IntSet(file, "S6W",33);
}
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".בהצלחה (Rifle)קנית 100 כדורים לנשק");

}
else
{
SendClientMessage(playerid,COLOR_BRIGHTRED," אין לך מספיק כסף כדי לקנות נשק זה ");
}
return 1;
}

else if(strcmp(Roy_Killer1111,"7",true) == 0)
{
if(GetPlayerMoney(playerid) >= 10000)
{
if(strval(S6W) == 33)
{
GivePlayerWeapon(playerid,34,100);
LACY_GiveMoney(playerid, -10000);
dini_IntSet(file,"S6A",strval(S6A)+100);
}
else if(strval(S6W) !=34)
{
GivePlayerWeapon(playerid,34,100);
LACY_GiveMoney(playerid, -10000);
dini_IntSet(file, "S6A",100);
dini_IntSet(file, "S6W",34);
}
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".בהצלחה (Rifle Sniper)קנית 100 כדורים לנשק");


}
else
{
SendClientMessage(playerid,COLOR_BRIGHTRED," אין לך מספיק כסף כדי לקנות נשק זה ");
}
return 1;
}
else if(strcmp(Roy_Killer1111,"8",true) == 0)
{
if (PlayerInfo[playerid][Level] >= 17)
{
if(PlayerInfo[playerid][bazooka] > 0) return SendClientMessage(playerid,red,"אתה לא יכול לקנות יותר כדורים לבזוקה שלך");
if(GetPlayerMoney(playerid) < 100000) return SendClientMessage(playerid,red,".קניית זה עולה כ100000 דולר");
PlayerInfo[playerid][bazooka]=1;
GivePlayerWeapon(playerid,35,1);
dini_IntSet(GetPlayerFile(playerid),"bazooka",PlayerInfo[playerid][bazooka]);
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".בהצלחה (RPG) קנית כדור 1 לנשק");

}
else
{
SendClientMessage(playerid,COLOR_WHITE,".זמינה מרמה 17 בלבד ``Bazooka`` קניית הנשק");
}
}
return 1;
}
//---
/*
if(!strcmp(cmd, "/fastwl", true))
{
SendClientMessage(playerid, COLOR_WHITE, "-- רשימת נשקים מהירים --");
SendClientMessage(playerid, 0xFFFF00AA, "/Bw 1 Uzi 200$");
SendClientMessage(playerid, 0xFFFF00AA, "/Bw 2 SawnOff 200$");
SendClientMessage(playerid, 0xFFFF00AA, "/Bw 3 SniperRifile 200$");
SendClientMessage(playerid, 0xFFFF00AA, "/Bw 4 M4 200$");
SendClientMessage(playerid, 0xFFFF00AA, "/Bw 5 ShotGun 200$");
SendClientMessage(playerid, 0xFFFF00AA, "/Bw 6 Tec9 200");
return 1;
}
//---------Stats---------
if(strcmp(cmd,"/fastbw",true) || strcmp(cmd,"/fastBuyWeapon",true))
{
new Roy_Killer1111[256];
Roy_Killer1111= strtok(cmdtext, idx);
if(strlen(Roy_Killer1111)) {
SendClientMessage(playerid, 0x78B4F0FF, "/fastbw [1-6]");
//----------------------
return 1;}
//----------------------

else if(strcmp(Roy_Killer1111,"1",true) == 0)
{
if(GetPlayerMoney(playerid) < 200) return   SendClientMessage(playerid,0xFFFF00AA,"אתה צריך כ200 דולר לנשק זה");
GivePlayerWeapon(playerid,28,600);
SendClientMessage(playerid,0xFFFF00AA,".בחנות נשקים המהירה (Uzi) תתחדש קנית עוזי");
SendClientMessage(playerid,COLOR_PURPLE,".מוכר הנשק: שים לב הנשק לא ישמר אחרי שתהרג");
LACY_GiveMoney(playerid,-200);
return 1;
}
//----------------------
else if(strcmp(Roy_Killer1111,"2",true) == 0){
if(GetPlayerMoney(playerid) < 200) return   SendClientMessage(playerid,0xFFFF00AA,"אתה צריך כ200 דולר לנשק זה");
GivePlayerWeapon(playerid,26,600);
SendClientMessage(playerid,COLOR_PURPLE,".בחנות נשקים מהירה (SawnOff)SawnOff תתחדש קנית ");
SendClientMessage(playerid,COLOR_PURPLE,".מוכר הנשק: שים לב הנשק לא ישמר אחרי שתהרג");
LACY_GiveMoney(playerid,-200);
return 1;}
//----------------------
else if(strcmp(Roy_Killer1111,"4",true) == 0){
if(GetPlayerMoney(playerid) < 200) return   SendClientMessage(playerid,0xFFFF00AA,"אתה צריך כ200 דולר לנשק זה");
GivePlayerWeapon(playerid,31,600);
SendClientMessage(playerid,0xFFFF00AA,"בחנות נשקים מהירה (M4) M4 תתחדש קנית ");
SendClientMessage(playerid,COLOR_PURPLE,".מוכר הנשק: שים לב הנשק לא ישמר אחרי שתהרג");
LACY_GiveMoney(playerid,-200);
return 1;}
//----------------------
else if(strcmp(Roy_Killer1111,"3",true) == 0){
//----------------------
if(GetPlayerMoney(playerid) < 200) return   SendClientMessage(playerid,0xFFFF00AA,"אתה צריך כ200 דולר לנשק זה");
GivePlayerWeapon(playerid,34,25);
SendClientMessage(playerid,0xFFFF00AA,"בחנות נשקים מהירה (Rifle) Rifle תתחדש קנית ");
LACY_GiveMoney(playerid,-200);
SendClientMessage(playerid,COLOR_PURPLE,".מוכר הנשק: שים לב הנשק לא ישמר אחרי שתהרג");
return 1;
}
//----------------------
else if(strcmp(Roy_Killer1111,"5",true) == 0){
//----------------------
if(GetPlayerMoney(playerid) < 200) return   SendClientMessage(playerid,0xFFFF00AA,"אתה צריך כ200 דולר לנשק זה");
GivePlayerWeapon(playerid,25,300);
SendClientMessage(playerid,0xFFFF00AA," תתחדש קנית שוטגאן");
SendClientMessage(playerid,COLOR_PURPLE,".מוכר הנשק: שים לב הנשק לא ישמר אחרי שתהרג");
LACY_GiveMoney(playerid,-200);
return 1;
}
//----------------------
else if(strcmp(Roy_Killer1111,"6",true) == 0){
//----------------------
if(GetPlayerMoney(playerid) < 200) return   SendClientMessage(playerid,0xFFFF00AA,"אתה צריך כ200 דולר לנשק זה");
SendClientMessage(playerid,0xFFFF00AA,"Tec9 תתחדש קנית");
SendClientMessage(playerid,COLOR_PURPLE,".מוכר הנשק: שים לב הנשק לא ישמר אחרי שתהרג");
GivePlayerWeapon(playerid,32,600);
LACY_GiveMoney(playerid,-200);
return 1;
}
return 1;
}
*/
//----Weed System------
if (strcmp(cmdtext, "/useweed", true)==0)
{
new str[256];
if(Stoned[playerid] == 1)return SendClientMessage(playerid, COLOR_BRIGHTRED, " אתה עדיין תחת השפעת הסמים ");


if(PlayerInfo[playerid][Weeds] > 0)
{
PlayerInfo[playerid][Weeds] --;
format(str, sizeof(str), " השתמת במנת סמים, נשאר לך %d/10 מנות ", PlayerInfo[playerid][Weeds]);

TheWeed[playerid] =1;
Stoned[playerid]=1;
SetPlayerWantedLevel(playerid,1);
ApplyAnimation(playerid,"PED","WALK_DRUNK",4.0,1,1,1,1,0);
GameTextForPlayer(playerid,"~w~Stoned",5000,5);
}
else
{
format(str, sizeof(str), " אין לך אף מנת סמים ");
SendClientMessage(playerid, COLOR_RED, str);
}
return 1;
}



if(strcmp(cmd, "/weedinfo", true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,"-- .מערכת הסמים עזרה --");
SendClientMessage(playerid, 0xFF66FFAA,"במוד זה מותקנת מערכת סמים חכמה המערכת עובדת על ידי מכירת סמים");
SendClientMessage(playerid, 0xFF66FFAA,"המטרה במוד הסמים שמותקן בשרת זה למצוא מנות סמים ולמכורם לאנשים");
SendClientMessage(playerid, 0xFF66FFAA,"מוד זה יגרום לחווית משחק כיפית יותר , ולהרווחת כסף");
SendClientMessage(playerid, 0xFF66FFAA,":בהיותכם משתמשים בסמים תהיה בצורה ``מסטולית`` פקודות למוד");
SendClientMessage(playerid, 0x0BAEAFF,"/useweed .וכנ'ל תוכלו להשתמש בסמים /sellweed .ברגע שתמצאו סמים תוכלו למכור אותם");
SendClientMessage(playerid, 0x0BAEAFF,"/details .לבדיקת הסמים שלך /buyweed .בהיותך קיבלת הודעה לקניית סמים תוכל לקנות אותם על ידי הפקודה");
SendClientMessage(playerid, 0x0BAEAFF,".declinedeal :לביטול העסקה");
SendClientMessage(playerid,COLOR_WHITE,"--------");
return 1;
}
if(strcmp(cmd, "/bankinfo", true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,"-- .מערכת הבנק עזרה --");
SendClientMessage(playerid, 0xFF66FFAA,"במוד זה מותקנת מערכת בנק חכמה שבעזרת תוכלו לשמור את כספכם");
SendClientMessage(playerid, 0xFF66FFAA,":ניתן להשיג כסף ממגון פעיליות כגון");
SendClientMessage(playerid, 0xFF66FFAA,"הריגת שחקנים , נצחונות בפעיליות , ניצחון במערכות , מכירת סמים");
SendClientMessage(playerid, 0xFF66FFAA,"קניית נכסים ולהרוויח מהם כסף");
SendClientMessage(playerid, 0xFF66FFAA,":אחרי ההרוות הכסף תוכלו גם לשמור אותו, פקודות למערכת");
SendClientMessage(playerid, 0x0BAEAFF,"/balance לבדיקת המאזן הכספי שלך /depositall :להפקיד את כל הכסף /deposit [amount] :להפקדת הכסף");
SendClientMessage(playerid, 0x0BAEAFF,"/bankid [playerid] [amount] להעברת כסף לחשבון של שחקן אחר/withdraw [amount] :למשוך כסף מחשבונך");
SendClientMessage(playerid,COLOR_WHITE,"--------");
return 1;
}

//------------
if(strcmp(cmd, "/sellweed", true) == 0)
{
tmp = strtok(cmdtext, idx);
//----Syntex Error
if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /sellweed [playerid]");
if(PS[playerid] == 1)return SendClientMessage(playerid, COLOR_BRIGHTRED, "אתה נמצא בעסקה כבר ");
giveplayerid = strval(tmp);
if (IsPlayerConnected(giveplayerid)){
GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
GetPlayerName(playerid, sendername, sizeof(sendername));
for(new i;i<MAX_PLAYERS;i++){
if(offerweed[i][giveplayerid] == 1)return SendClientMessage(playerid,COLOR_RED,"הבנאדם שאתה מנסה למכור לו כבר נמצא בעיסקה!");
return 3;}

if (PlayerInfo[playerid][Weeds] > 0 && PlayerInfo[playerid][Weeds] <= 3)
{
format(string, sizeof(string), " [$%d] מנת סמים במחיר [ID:%d] %s הצעת ל ", WeedCost, giveplayerid, giveplayer);
SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
format(string, sizeof(string), " [$%d] מציע לך לקנית מנת סמים במחיר [ID:%d] %s ", WeedCost, playerid, sendername);
SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
format(string, sizeof(string), " /BuyWeed אם אתה רוצה לקנות את המנה תשתמש בפקודה ");
SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
offerweed[playerid][giveplayerid] = 1;
PS[playerid] = 1;
CB[giveplayerid] = 1;
}else{
SendClientMessage(playerid, 0x0C4E0FF, " אין לך סמים ");
}}else{
format(string, sizeof(string), " לא מחובר [ID:%d] ", giveplayerid);
SendClientMessage(playerid, COLOR_LIGHTBLUE, string);}
return 1;
}

if(!strcmp(cmd,"/buyweed",true))
{
if(CB[playerid] == 0) return SendClientMessage(playerid,COLOR_RED," אף אחד לא הציע לך לקנות סמים ");
if(PlayerInfo[playerid][Weeds] == 3)
{
SendClientMessage(playerid,COLOR_RED," מנות כבר ואינך יכול לקנות עוד %d/3 יש לך  ");
for(new i;i<MAX_PLAYERS;i++)
offerweed[i][playerid] = 0;
format(string, sizeof(string), " לא יכול לקנות עוד סמים [ID:%d] %s העסקה בוטלה מכיוון שהשחקן ", giveplayerid, giveplayer);
SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
return 1;
}
for(new i;i<MAX_PLAYERS;i++)
{
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
SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
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
SendClientMessage(playerid,COLOR_RED,"אין לך מספיק כסף");
}
}
else
{
SendClientMessage(playerid,COLOR_RED,"הכיס שלך כבר מלא בסמים");
}
}
}
return 1;
}



if(!strcmp(cmd,"/declinedeal",true))
{
for(new i;i<MAX_PLAYERS;i++)
{
if(offerweed[i][playerid] == 1)
{
new pname[MAX_PLAYER_NAME];
GetPlayerName(playerid,pname,sizeof(pname));
format(string,256," ביטל את העסקה [ID:%d] %s ",playerid,pname);
SendClientMessage(i, COLOR_LIGHTBLUE, string);
SendClientMessage(playerid, COLOR_BRIGHTRED, " אתה ביטלת את עיסקת הסמים ");
offerweed[i][playerid] = 0;
CB[i] = 0;
CB[playerid] = 0;
PS[playerid] = 0;
PS[i] = 0;
return 1;
}
}
SendClientMessage(playerid,COLOR_RED,"אין לך עיסקת סמים עם אף אחד");
return 1;
}
//-=-=-=-=-=-
if(strcmp(cmd, "/kill", true) == 0)
{
if(HpModeA[playerid] == 1)
{
hpmodebug[playerid]=1;
HpModeA[playerid] = 0;
//DisplayTextForPlayer(playerid,"~r~Bye", 5, 1, 3);
PlayerInfo[playerid][Deaths] = PlayerInfo[playerid][Deaths] --;
return 1;
}
PlayerInfo[playerid][Deaths] = PlayerInfo[playerid][Deaths] --;
antianti[playerid] = 0;
SetPlayerHealth(playerid,0.0);
mini[playerid] = 0;
SendClientMessage(playerid,0xFFFF00AA, ".התאבדת");

return 1;
}

/*
new DriftCP[MAX_PLAYERS]
new IFDriftOn;
new DriftPlayer;
new YouRegister[MAX_PLAYERS];
new WinnerDrift;
new DriftEnd;
*/

if(!strcmp(cmd, "/startdrift", true)) {
if(IFDriftOn==1) return SendClientMessage(playerid,red,"יש כבר קרב דריפטים מופעיל");
if (PlayerInfo[playerid][AdminsLevel] >= 10) {
DriftPlayer =0,DriftEnd=0,WinnerDrift=1,IFDriftOn=1,SetTimer("StartDrift",3000,0),SetTimer("UnFreezeDrift",49*1000,0);
}
else
{
}
return 1;
}




if(!strcmp(cmd, "/joindrift", true))
{
if(DriftEnd==1) return SendClientMessage(playerid,red,"ההרשמה כבר נסגרה");
if(DriftPlayer==22) return SendClientMessage(playerid,red,".כל המקומות נתפסו");
if(IFDriftOn==0) return SendClientMessage(playerid,red,".אין עכשיו מערכת דריפטים מופעלת");
if(YouRegister[playerid] ==1) return SendClientMessage(playerid,red,"אתה כבר רשום.");
new fstr[255];
if(!IsVehicle(playerid)) return  format(fstr,sizeof(fstr),"/drift , /race , /dj .על מנת להשתתף במירוץ דריפט Turismo אתה צריך תרכב"),SendClientMessage(playerid,red,fstr);
if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,red,".אנא כנס לרכב כדאי להירשם");

DriftPlayer++;
YouRegister[playerid] =1;
SendClientMessage(playerid, 0x0F482FF, ".הצטרפת למירוץ בהצלחה");
format(string,sizeof(string)," %d :אתה משתתף מספר",DriftPlayer);
SendClientMessage(playerid,COLOR_WHITE,string);
format(string,sizeof(string),"+ .!הצטרף למירוץ דריפט ,%s",GetName(playerid));
SendClientMessageToAll(COLOR_GREEN,string);
SetPlayerRaceCheckpoint(playerid, 0,2297.5369,1509.4496,42.8203,2290.4094,1500.1200,42.6123, 6);//CP2
TogglePlayerControllable(playerid,0);
DriftCP[playerid] =1;
new vehicleid = GetPlayerVehicleID(playerid);
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
//---RaceSystem
if(!strcmp(cmd, "/startrace", true)) {
if (PlayerInfo[playerid][AdminsLevel] >= 10) {
RaceEnd=0,WinnerRace=1,IFraceOn=1,SetTimer("StartRace",3000,0),SetTimer("UnFreezeRace",49*1000,0);
}
else
{
}
return 1;
}



if(!strcmp(cmd, "/joinrace", true))
{
if(RaceEnd==1) return SendClientMessage(playerid,red,"ההרשמה כבר נסגרה");
if(RacePlayers==15) return SendClientMessage(playerid,red,".כל המקומות נתפסו");
if(IFraceOn==0) return SendClientMessage(playerid,red,".אין עכשיו מערכת מירוצים מופעלת");
if(Youregisterrace[playerid] ==1) return SendClientMessage(playerid,red,"אתה כבר רשום.");
if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,red,".אנא כנס לרכב כדאי להירשם");
RacePlayers++;
Youregisterrace[playerid] =1;
SendClientMessage(playerid,0x0F482FF, ".הצטרפת למירוץ בהצלחה");
format(string,sizeof(string)," %d :אתה משתתף מספר",RacePlayers);
SendClientMessage(playerid,COLOR_WHITE,string);
format(string,sizeof(string),"+ .!הצטרף למירוץ ,%s",GetName(playerid));
SendClientMessageToAll(COLOR_GREEN,string);
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

if(!strcmp(cmd, "/startwar", true))
{

if (PlayerInfo[playerid][AdminsLevel] >= 10) {

tmp = strtok(cmdtext, idx);
//if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_LIGHTGREEN, "/StartWar [Reward] :שימוש ");
//if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_RED, ". אתה לא אדמין ");
//if(WarOn == 1) return SendClientMessage(playerid, COLOR_RED, ".יש כבר מלחמה פעילה ");

for(new i = 0; i < MAX_PLAYERS; i++)
{
PlayerPlaySound(i,1058, 0.0, 0.0, 0.0);
}
//Reward  = strval(tmp);
SetTimer("WarStart",3000,0);

}
else
{

}
return 1;
}



if(!strcmp(cmd, "/war", true))
{
if(WarOn == 0) return SendClientMessage(playerid, COLOR_RED, ".אין עכשיו מלחמה פעילה");
if(WS == 1) return SendClientMessage(playerid, COLOR_RED, ".המלחמה כבר התחילה, נסה פעם הבאה ");
if(WarPlayers == sizeof(sssa)) return SendClientMessage(playerid, COLOR_RED, ".כל המקומות נתפסו, נסה פעם באה");
if(InWar[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, ".הצטרפת כבר לוואר, אנא המתן");
if(TorYou[playerid] ==1) return SendClientMessage(playerid, red,"/backtor :אנא החזר/י תחיה שלך");
if(SharkYou[playerid] ==1) return SendClientMessage(playerid, red,"/backshark :אנא החזר/י תחיה שלך");
if(DolpYou[playerid] ==1) return SendClientMessage(playerid, red,"/backdolphin :אנא החזר/י תחיה שלך");
if(GetPlayerMoney(playerid) < 500) return SendClientMessage(playerid, red, ".\"500$\" :אין לך מספיק כסף להשתתף בקארט עלות השתתפות היא");

GetPlayerName(playerid, playername, sizeof(playername));
WarPlayers ++; InWar[playerid] = 1;
MoneyWinnerWar +=500;
LACY_GiveMoney(playerid,-500);
SendClientMessage(playerid, 0x0F482FF, ".הצטרפת לקרב מלחמות בהצלחה");
format(string,sizeof(string)," %d :אתה משתתף מספר",WarPlayers);
SendClientMessage(playerid,COLOR_GREEN,string);
format(string,sizeof(string),".[%d] :העלת את סכום הזכייה מלחמה ל",MoneyWinnerWar);
SendClientMessage(playerid,RED2,string);

return 1;
}

if(!strcmp(cmd, "/warend", true))
{
if(WarOn == 0) return SendClientMessage(playerid, COLOR_RED, ".אין עכשיו מלחמה פעילה");
if (PlayerInfo[playerid][AdminsLevel] <= 10) return 0;
SendClientMessage(playerid, 0x0C4E0FF, "המלחמה בוטלה בהצלחה ");
GetPlayerName(playerid, Adminname, sizeof(Adminname));
Count = 0;
WarEnd(2);
return 1;
}

if(!strcmp(cmd, "/srpg", true))
{
if (PlayerInfo[playerid][AdminsLevel] >= 10) {
tmp = strtok(cmdtext, idx);
//if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_RED, ". אתה לא אדמין ");
if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_LIGHTGREEN, " /srpg [ammunt] ");
Rewardr  = strval(tmp);
WarStartr();

}
else
{

}
return 1;
}

if(!strcmp(cmd, "/Rpg", true))
{


if(WarOnr == 0) return SendClientMessage(playerid, COLOR_RED, "אין כרגע מערכת טילים");
if(WSr == 1) return SendClientMessage(playerid, COLOR_RED, " כבר התחיל לא תוכל להירשם");
if(WarPlayersr == sizeof(gRandomWarSpawns)) return SendClientMessage(playerid, COLOR_RED, " כל המקומות נתפסו, נסה פעם באה");
if(InWarr[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "כבר השתתפת ");
if(TorYou[playerid] ==1) return SendClientMessage(playerid, red,"/backtor :אנא החזר/י תחיה שלך");
if(SharkYou[playerid] ==1) return SendClientMessage(playerid, red,"/backshark :אנא החזר/י תחיה שלך");
if(DolpYou[playerid] ==1) return SendClientMessage(playerid, red,"/backdolphin :אנא החזר/י תחיה שלך");

GetPlayerName(playerid, playernamer, sizeof(playernamer));
SendClientMessage(playerid, 0x6699FFFF, "תודה , נרשמת בהצלחה לקרובת טילים");
WarPlayersr ++; InWarr[playerid] = 1;
SendClientMessage(playerid, 0xAA3333AA, ",!הצטרפת לפעילת טילים בהצלחה ");
format(string,sizeof(string)," %d :אתה משתתף מספר",WarPlayersr);
SendClientMessage(playerid,COLOR_WHITE,string);
return 1;
}

if(!strcmp(cmd, "/Rpgend", true))
{
if(WarOnr == 0) return SendClientMessage(playerid, COLOR_RED, " אין עכשיו מלחמה פעילה");
if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_RED, " אתה לא אדמין ");
SendClientMessage(playerid, COLOR_RED, " המלחמה בוטלה בהצלחה ");
Countr = 0;
WarEndr(2);
return 1;
}


//-----

//----

if(strcmp(cmd,"/CAM",true)==0) return SetPlayerPos(playerid,696.639587, 1819.386719, 12.363261);

if(strcmp(cmd, "/flip", true) == 0)
{


new Float:X, Float:Y, Float:Z;
if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,COLOR_WHITE,"אתה לא ברכב.");
SetCameraBehindPlayer(playerid);
GetPlayerPos(playerid, X, Y, Z);
SetVehiclePos(GetPlayerVehicleID(playerid), X, Y, Z);
SetVehicleZAngle(GetPlayerVehicleID(playerid), 0);

return 1;
}


if(strcmp(cmd, "/MAXPLAYERS", true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE, "MaxPlayers: 100");
return 1;
}

if(strcmp(cmd, "/showid", true) == 0)
{
format(string, sizeof(string), "^^* ID: %i *^^",playerid);
SendClientMessage(playerid, 0xFFFF00AA, string);
return 1;
}





    if(strcmp(cmd,"/SetLevelI",true) == 0)
    {
    if (PlayerInfo[playerid][AdminsLevel] >= 10)
{

       // if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid,COLOR_RED,". אתה לא אדמין");
        tmp = strtok(cmdtext, idx);
        new id = ReturnID(tmp);
//        new tmp2[256];
        tmp2 = strtok(cmdtext, idx);
        new level = strval(tmp2);
        if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /setlevel [playerid] [level]");
        if(!strlen(tmp2)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /setlevel [playerid] [level]");
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_BLUE, "Invalid PlayerID !");
        PlayerInfo[id][Level] = level;
}
else
{

}
        return 1;
    }
    
if(strcmp(cmd,"/SetLevelAdmin",true) == 0)
{

//new adminlevelss;



if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid,COLOR_RED,".רק אדמין של רקון יכולים להשתמש בפקודות האלה");
//tmp = strtok(cmdtext, idx);
tmp = strtok(cmdtext, idx);
new id = ReturnID(tmp);
//        new tmp2[256];
tmp2 = strtok(cmdtext, idx);
new adlvl = strval(tmp2);
if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /SetLevelAdmin [playerid] [level]");
if(!strlen(tmp2)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /SetLevelAdmin [playerid] [level]");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_BLUE, "Invalid PlayerID !");
PlayerInfo[id][AdminsLevel] = adlvl;
dini_IntSet(GetPlayerFile(playerid),"Adminl",PlayerInfo[id][AdminsLevel]);
//SendClientMessage(id,COLOR_RED,"/Syshelp :מזל טוב נהיית כרגע קיבלת גישה להפעיל מערכות לעזרה");
		return 1;
    }

    if(strcmp(cmd,"/SetBank",true) == 0)
    {
if (PlayerInfo[playerid][AdminsLevel] >= 10) {

	    tmp = strtok(cmdtext, idx);
        new id = ReturnID(tmp);

        tmp2 = strtok(cmdtext, idx);
        new banke = strval(tmp2);
        if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /SetBank [playerid] [money]");
        if(!strlen(tmp2)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /SetBank [playerid] [money]");
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_BLUE, "Invalid PlayerID !");
        PlayerInfo[id][Bank] = banke;
}
else
{

}
        return 1;
    }

    if(strcmp(cmd,"/setkills",true) == 0)
    {
if (PlayerInfo[playerid][AdminsLevel] >= 10) {

       // if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid,COLOR_RED,". אתה לא אדמין");
        tmp = strtok(cmdtext, idx);
        new id = ReturnID(tmp);
//        new tmp2[256];
        tmp2 = strtok(cmdtext, idx);
        new kills = strval(tmp2);
        
        if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /setkills [playerid] [kills]");
   if(!strlen(tmp2)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /setkills [playerid] [kills]");
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_BLUE, "Invalid PlayerID !");
        PlayerInfo[id][Kills] = kills;

}
else
{

}
        return 1;
    }

    if(strcmp(cmd,"/Warnings",true) == 0)
    {
    
        if (PlayerInfo[playerid][AdminsLevel] >= 10)
{

tmp = strtok(cmdtext, idx);
new id = ReturnID(tmp);
if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /Warnings [playerid] [1]");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_BLUE, "האיידי שהזנת הינו שגוי");
//if(id == playerid) return SendClientMessage(playerid,WHITE,"אתה לא יכול לתת לעצמך אזהרה.");
if(PlayerInfo[id][AdminsLevel] > PlayerInfo[id][AdminsLevel]) return SendClientMessage(playerid,COLOR_WHITE,"אתה לא יכול לתת אזהרה לאדמין ברמה גבוה יותר ממך");
PlayerInfo[id][Warnings] ++;

SendClientMessage(id,red,".ברגע שתגיע ל10 אזהרות תורחק מהשרת");
format(string, sizeof(string), "%d/10 :אזהרות", PlayerInfo[id][Warnings]),SendClientMessage(id,red, string);
format(string, sizeof(string), "%d/10 :אזהרות של השחקן שהבאת לו אזרה ", PlayerInfo[id][Warnings]),SendClientMessage(playerid,red, string);
}
else
{
}
		return 1;
    }
//    }


    if(strcmp(cmd,"/setdeaths",true) == 0)
    {
        if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid,COLOR_RED,". אתה לא אדמין");
        tmp = strtok(cmdtext, idx);
        new id = ReturnID(tmp);
//        new tmp2[256];
        tmp2 = strtok(cmdtext, idx);
        new deaths = strval(tmp2);
        if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /setdeaths [playerid] [deaths]");
        if(!strlen(tmp2)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /setdeaths [playerid] [deaths]");
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_BLUE, "Invalid PlayerID !");
          PlayerInfo[id][Deaths] = deaths;
        return 1;
    }




if(strcmp(cmd, "/cancelpm", true) == 0)
{
if(cancelpm[playerid] ==1) return SendClientMessage(playerid,red,"[BlockPms Error] כבר חסמת את ההודעות פרטיות ! ");
cancelpm[playerid] =1;
SendClientMessage(playerid,red,"[BlockPms] חסמת את ההודעות פרטיות שלך ! כעת לא ניתן לשלוח לך הודעות");
return 1;
}
if(strcmp(cmd, "/backpm", true) == 0)
{
if(cancelpm[playerid] ==0) return SendClientMessage(playerid,red,"[BlockPms Error] /cancelpm ההודעות פרטיות שלך לא חסמות לחסימה");
cancelpm[playerid] =0;
SendClientMessage(playerid,COLOR_PURPLE,"[BlockPms] .החזרת את האפשרות לשלוח לך הודעות פרטיות");
return 1;
}
if(strcmp(cmd, "/exports", true) == 0)
{
if(!CPS_IsPlayerInCheckpoint(playerid,Wang)) return SendClientMessage(playerid,COLOR_WHITE,".אתה חייב להיות בצ'ק פוינט של מוסך וואנג על מנת למכור רכב");

SellWangExportVehicle(playerid);
return 1;
}
if(strcmp(cmd, "/setting", true) == 0)
{
new Roy_Killer[256];
Roy_Killer= strtok(cmdtext, idx);
if(!strlen(Roy_Killer))
{

SendClientMessage(playerid,COLOR_WHITE,"USAGE: /setting [שם ההגדרה]");
SendClientMessage(playerid,COLOR_WHITE,"/setting autologin :להגדיר חיבור אוטומטי לפי אייפי");
SendClientMessage(playerid,COLOR_WHITE,".בקרוב יהיו עוד מספר שינויים");
return 1;
}

if(strcmp(Roy_Killer,"autologin",true) == 0)
{
if(PlayerInfo[playerid][autologin] ==1) {
PlayerInfo[playerid][autologin] =0;

SendClientMessage(playerid,COLOR_BRIGHTRED,"--- .מעכשיו לא תתחבר לפי האייפי שלך ---");
return 1;
}
if(PlayerInfo[playerid][autologin] ==0){
SendClientMessage(playerid, COLOR_LIGHTBLUE, "--- .מעכשיו תתחבר לפי האייפי שלך ---");
PlayerInfo[playerid][autologin] =1;
return 1;
}
}

return 1;
}
//--
//===============================KartStart Command===============================

//-------------------
if(strcmp(cmd, "/Commands", true) == 0)
{

new Roy_Killer[256];
Roy_Killer= strtok(cmdtext, idx);
if(!strlen(Roy_Killer))
{
SendClientMessage(playerid, COLOR_WHITE, "/Commands [1/2/all] :צורת שימוש");

return 1;
}


//----------------------
if(strcmp(Roy_Killer,"1",true) == 0)
{

SendClientMessage(playerid,COLOR_LIGHTBLUE,"~~~~ 1 פקודות help Commands ~~~~");
SendClientMessage(playerid, 0xFFFF00AA,"/kill - מוות עצמי");
SendClientMessage(playerid, 0xFFFF00AA,"/AFK - כניסה למצב אפק");
SendClientMessage(playerid, 0xFFFF00AA,"/UNAFK - יציאה ממצב אפק");
SendClientMessage(playerid, 0xFFFF00AA,"/nextlevel - הרמה הבאה שלך");
SendClientMessage(playerid, 0xFFFF00AA,"/stats - סטאטס שלך");
SendClientMessage(playerid, 0xFFFF00AA,"/pstats [id] - סטאטס של מישהוא אחר");
SendClientMessage(playerid, 0xFFFF00AA,"/ignore - על מנת לחסום שחקן");
SendClientMessage(playerid, 0xFFFF00AA,"/unignore - על מנת להוריד חסימה לשחקן");
SendClientMessage(playerid, 0xFFFF00AA,"/showlevel [level] - על מנת לראות רמה של שחקנים מחוברים");


}
else if(strcmp(Roy_Killer,"all",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--- help Commands (2) - מוד פקודות ---");
SendClientMessage(playerid, COLOR_ORANGE,".במוד הזה מותקנת מגוון פקודות בוא נראה את חלק הקטן מהפקודות");
SendClientMessage(playerid, 0xFFFF00AA,"/maxplayers /showid /bigbang [id] (4) /nextlevel");
SendClientMessage(playerid, 0xFFFF00AA,"/sp (2) /lp /profile /pprofile [id] /stats /pstats [id]");
SendClientMessage(playerid, 0xFFFF00AA,"/details /pdetails [id] /mypet /ppet [id] /pay [id] [money]");
SendClientMessage(playerid, 0xFFFF00AA,"/kill /boome /td /setnick /setpass /saveskin /delskin");
SendClientMessage(playerid, 0xFFFF00AA,"/ignore [id] /unignore /id(/s) [id/name] /showlevel");
SendClientMessage(playerid, 0xFFFF00AA,"/commands [1/2/3/all] /vinfo /afk /unafk /me (2)");
}
else if(strcmp(Roy_Killer,"2",true) == 0)
{
SendClientMessage(playerid,COLOR_LIGHTBLUE,"~~~~ 2 פקודות help Commands ~~~~ ");
SendClientMessage(playerid, 0xFFFF00AA,"/pm [playerid] [message] - לשליחת הודעה פרטית");
SendClientMessage(playerid, 0xFFFF00AA,"/pay [Playerid] [amount] - על מנת להעביר כספים");
SendClientMessage(playerid, 0xFFFF00AA,"/call [id] להתקשר לשחקן /hangup לנתק לשחקן");
SendClientMessage(playerid, 0xFFFF00AA,"/maxplayers - גבול כניסת שחקנים");
SendClientMessage(playerid, 0xFFFF00AA,"/showid - מספר האיידי איתו אתה מופיע בשרת");
SendClientMessage(playerid, 0xFFFF00AA,"/sp (2) - שמירת מיקום");
SendClientMessage(playerid, 0xFFFF00AA,"/lp (2) - טעינת מיקום");
SendClientMessage(playerid, 0xFFFF00AA,"/id(/s) [id/name] - לחיפוש שחקן בשרת / כמה שחקנים");

}

return 1;
}


if(strcmp(cmd, "/teleports", true) == 0)
{
new Roy_Killer[256];
Roy_Killer= strtok(cmdtext, idx);
if(!strlen(Roy_Killer))
{
SendClientMessage(playerid, COLOR_WHITE, "/teleports [1/2/3/4/5/all]");
return 1;
}

if(strcmp(Roy_Killer,"1",true) == 0)
{
SendClientMessage(playerid,0x0A11FF,"• • • • • • • • • • • • • • • • • • • • • • • • • • • • • •");
SendClientMessage(playerid, 0x33CCFFAA,"* /pier :לאוניה שזזה בעזרת חיצים");
SendClientMessage(playerid, 0x33CCFFAA,"* /sf :לסאן פירו");
SendClientMessage(playerid, 0x33CCFFAA,"* /ls :ללוס סאנטוס");
SendClientMessage(playerid, 0x33CCFFAA,"* /lv :ללאס וגאס");
SendClientMessage(playerid, 0x33CCFFAA,"* /ap :לשדה תעופה");
SendClientMessage(playerid, 0x33CCFFAA,"* /race :לאיזור המירוצים");
SendClientMessage(playerid, 0x33CCFFAA,"* /ramp :לאזור הרמפות");
SendClientMessage(playerid, 0x33CCFFAA,"* /teleports 2 - .להמשך שיגורים אני בצע/י תפקודה ");
SendClientMessage(playerid,0x0A11FF,"• • • • • • • • • • • • • • • • • • • • • • • • • • • • • •");
}
else if(strcmp(Roy_Killer,"2",true) == 0)
{
SendClientMessage(playerid,0x0A11FF,"• • • • • • • • • • • • • • • • • • • • • • • • • • • • • •");
SendClientMessage(playerid, 0x33CCFFAA,"* /dj ,/sandkings לאיזור הגי'פים");
SendClientMessage(playerid, 0x33CCFFAA,"* /jump  לאיזור הקפיצה");
SendClientMessage(playerid, 0x33CCFFAA,"* /army  לבסיסים הבצאים");
SendClientMessage(playerid, 0x33CCFFAA,"* /carpark לפארק המכוניות");
SendClientMessage(playerid, 0x33CCFFAA,"* /ships לטיולי סירות");
SendClientMessage(playerid, 0x33CCFFAA,"* /cycletrip לאיזור הטיולים");
SendClientMessage(playerid, 0x33CCFFAA,"* /ShipMoney (3) לספינת פיראטים שונתנת כסף");
SendClientMessage(playerid, 0x33CCFFAA," * /teleports 3 - .להמשך שיגורים אני בצע/י תפקודה ");
SendClientMessage(playerid,0x0A11FF,"• • • • • • • • • • • • • • • • • • • • • • • • • • • • • •");
//SendClientMessage(playerid, 0x0A046FF," -- -- --");
}
else if(strcmp(Roy_Killer,"4",true) == 0)
{
//SendClientMessage(playerid, 0x0A046FF,"- - - תפריט שיגורים מס' 4--");
SendClientMessage(playerid,0x0A11FF,"• • • • • • • • • • • • • • • • • • • • • • • • • • • • • •");
SendClientMessage(playerid, 0x33CCFFAA,"* /spawn (5) להשתגר למקום באקראי");
SendClientMessage(playerid, 0x33CCFFAA,"* /arena לאיזור המלחמות של הקלאנים");
SendClientMessage(playerid, 0x33CCFFAA,"* /skydive לצניחה חופשית ");
SendClientMessage(playerid, 0x33CCFFAA,"* /drag לתחילת הדראג");
SendClientMessage(playerid, 0x33CCFFAA,"* /drift לאזור הדריפט לחץ");
SendClientMessage(playerid, 0x33CCFFAA,"* /grage למוסך");
SendClientMessage(playerid, 0x33CCFFAA," * /teleports 5 - .להמשך שיגורים אני בצע/י תפקודה ");
SendClientMessage(playerid,0x0A11FF,"• • • • • • • • • • • • • • • • • • • • • • • • • • • • • •");
//SendClientMessage(playerid, 0x0A046FF," -- -- --");
}
else if(strcmp(Roy_Killer,"3",true) == 0)
{
//SendClientMessage(playerid, 0x0A046FF,"- - - תפריט שיגורים מס' 3 --");
SendClientMessage(playerid,0x0A11FF,"• • • • • • • • • • • • • • • • • • • • • • • • • • • • • •");
SendClientMessage(playerid, 0x33CCFFAA,"* /Infernus למירוצים של הרכב המהיר ביותר");
SendClientMessage(playerid, 0x33CCFFAA,"* /busstrip לטיולי אוטובוסים");
SendClientMessage(playerid, 0x33CCFFAA,"* /bikestrip לטיוליי אופנועים");
SendClientMessage(playerid, 0x33CCFFAA,"* /fight לאיזור הפייטרים");
SendClientMessage(playerid, 0x33CCFFAA,"* /alp  להר הגבוהה ביותר");
SendClientMessage(playerid, 0x33CCFFAA,"* /snipe  לעמדת הצליפה");
SendClientMessage(playerid, 0x33CCFFAA,"* /PePe  לאגם הפיפי");
SendClientMessage(playerid, 0x33CCFFAA,"* /derby  למגרש הכדורגל");
SendClientMessage(playerid, 0x33CCFFAA," * /teleports 4 - .להמשך שיגורים אני בצע/י תפקודה ");
SendClientMessage(playerid,0x0A11FF,"• • • • • • • • • • • • • • • • • • • • • • • • • • • • • •");
}
else if(strcmp(Roy_Killer,"5",true) == 0)
{


//SendClientMessage(playerid, 0x0A046FF,"- - - תפריט שיגורים מס' 5 --");
SendClientMessage(playerid,0x0A11FF,"• • • • • • • • • • • • • • • • • • • • • • • • • • • • • •");
SendClientMessage(playerid, 0x33CCFFAA,"/kickstart לאיזור סטדיום");
SendClientMessage(playerid, 0x33CCFFAA,"/lc (1) לאיזור הלייברי");
SendClientMessage(playerid, 0x33CCFFAA,"/ammu  לחנות נשקים");
SendClientMessage(playerid, 0x33CCFFAA,"/bank לבנק");
SendClientMessage(playerid, 0x33CCFFAA,"/parkour (4) לאיזור הקפיצות");
SendClientMessage(playerid, 0x33CCFFAA,"/bazooka (10)   לאיזור הבזוקות");
SendClientMessage(playerid,0x0A11FF,"• • • • • • • • • • • • • • • • • • • • • • • • • • • • • •");
//SendClientMessage(playerid, COLOR_WHITE,"--- סוף רשימות שיגורים תהנ/י ---");

}


if(strcmp(Roy_Killer,"all",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--- help Teleport (1) - מוד שיגורים ---");
SendClientMessage(playerid, COLOR_ORANGE,".מוד שיגורים שבוא ניתן לזוז ממקום למקום בעזרת פקודה ולהגיע למקומות הריגה במהירות רבה יותר");
SendClientMessage(playerid, 0xFFFF00AA,"/pier /sf /lv /ls /ap /race /ramp /superramp");
SendClientMessage(playerid, 0xFFFF00AA,"/dj /sandkings /jump /army /carpark /cycletrip");
SendClientMessage(playerid, 0xFFFF00AA,"/spawn (5) /arena /skydive /drift  /grage");
SendClientMessage(playerid, 0xFFFF00AA,"/infernus /busstrip /bikestrip /fight /alp /snipe");
SendClientMessage(playerid, 0xFFFF00AA,"/pepe /derby /kickstart /lc (1) /bank /parkour (4) /ammu");
SendClientMessage(playerid, 0xFFFF00AA,"/bigwar /thewar /mp5 (2) /m4 (3) /deagle /dm /bazooka (10)");
SendClientMessage(playerid, 0xFFFF00AA,"/teleports [1/2/3/4/5/all] /ship /shipmoney (3) /ships /bazooka (10)");
}
return 1;
}


//===============================MonsterStart CoMonsterNoTeleportionand=================================
if(!strcmp(cmd, "/startMonster", true)) {
tmp = strtok(cmdtext, idx);

if (PlayerInfo[playerid][AdminsLevel] < 10) return 0;

if(MonsterOn == 1) return SendClientMessage(playerid, COLOR_RED, ".יש כבר גאטר פעיל ");
GetPlayerName(playerid, Adminname, sizeof(Adminname));
format(MonsterFux, sizeof(MonsterFux), "~B~~H~ /monster", playername);
GameTextForAll(MonsterFux,3000,4);
for(new i = 0; i < MAX_PLAYERS; i++) {
MonStart[i] =0;
PlayerPlaySound(i,1058, 0.0, 0.0, 0.0); }
SetTimer("MonsterStart",1200,0);
KillTimer(MCheckTimeMonster);
KillTimer(KcheckMonster);
return 1; }
//===============================MJoin CoMonsterNoTeleportionand==================================
if(!strcmp(cmd, "/monster", true))
{
if(MonsterOn == 0) return 0;
if(MoOn == 1) return SendClientMessage(playerid, COLOR_RED, ".הגאטר כבר התחיל, נסה פעם הבאה ");
if(MonsterPlayers == 10) return SendClientMessage(playerid, COLOR_RED, ".כל המקומות נתפסו, נסה פעם באה");
if(iNmOnster[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, ".הצטרפת כבר לגאטר, חכה בסבלנות");
MonsterPlayers ++; iNmOnster[playerid] = 1;
MoneyWinnerMonster +=500;
LACY_GiveMoney(playerid,-500);
SendClientMessage(playerid, 0x0F482FF, ".הצטרפת לקרב מונסטר גאטר בהצלחה");
format(string,sizeof(string)," %d :אתה משתתף מספר",MonsterPlayers);
SendClientMessage(playerid,COLOR_GREEN,string);
format(string,sizeof(string),".[%d] :העלת את סכום הזכייה במונסטר ל",MoneyWinnerMonster);
SendClientMessage(playerid,RED2,string);

if(MonsterPlayers==1)
{
TogglePlayerControllable(playerid, 0);
MonsterSYSTEM[playerid] = CreateVehicle(444,1142.0449,1550.9158,50.8214,179.3103,-1,-1,50000);
PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
AddVehicleComponent(MonsterSYSTEM[playerid], 1010); // Nitro
}
if(MonsterPlayers==2)
{
TogglePlayerControllable(playerid, 0);
MonsterSYSTEM[playerid] = CreateVehicle(444,1134.6036,1550.7976,50.8303,176.1770,-1,-1,50000);
PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
AddVehicleComponent(MonsterSYSTEM[playerid], 1010); // Nitro

}
if(MonsterPlayers==3)
{
TogglePlayerControllable(playerid, 0);
MonsterSYSTEM[playerid] = CreateVehicle(444,1124.4053,1550.9847,50.8100,175.8637,-1,-1,50000);
PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
AddVehicleComponent(MonsterSYSTEM[playerid], 1010); // Nitro

}
if(MonsterPlayers==4)
{
TogglePlayerControllable(playerid, 0);
MonsterSYSTEM[playerid] = CreateVehicle(444,1109.0118,1550.2126,50.8741,188.0838,-1,-1,50000);
PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
AddVehicleComponent(MonsterSYSTEM[playerid], 1010); // Nitro

}
//----
if(MonsterPlayers==5)
{
TogglePlayerControllable(playerid, 0);
MonsterSYSTEM[playerid] = CreateVehicle(444,1099.1718,1550.4104,50.8593,165.8369,-1,-1,50000);
PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
AddVehicleComponent(MonsterSYSTEM[playerid], 1010); // Nitro

}

if(MonsterPlayers==6)
{
TogglePlayerControllable(playerid, 0);
MonsterSYSTEM[playerid] = CreateVehicle(444,1089.1884,1548.9716,50.9671,189.0238,-1,-1,50000);
PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
AddVehicleComponent(MonsterSYSTEM[playerid], 1010); // Nitro

}
if(MonsterPlayers==7)
{
TogglePlayerControllable(playerid, 0);
MonsterSYSTEM[playerid] = CreateVehicle(444,1078.6475,1550.6404,50.8420,166.7769,-1,-1,50000);
PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
AddVehicleComponent(MonsterSYSTEM[playerid], 1010); // Nitro

}
if(MonsterPlayers==8)
{
TogglePlayerControllable(playerid, 0);
MonsterSYSTEM[playerid] = CreateVehicle(444,1068.7783,1549.1713,50.9521,176.1770,-1,-1,50000);
PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
AddVehicleComponent(MonsterSYSTEM[playerid], 1010); // Nitro

}
if(MonsterPlayers==9)
{
TogglePlayerControllable(playerid, 0);
MonsterSYSTEM[playerid] = CreateVehicle(444,1058.0988,1547.7061,51.0619,160.8235,-1,-1,50000);
PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
AddVehicleComponent(MonsterSYSTEM[playerid], 1010); // Nitro

}
if(MonsterPlayers==10)
{
TogglePlayerControllable(playerid, 0);
MonsterSYSTEM[playerid] = CreateVehicle(444,1057.6982,1527.1439,52.2449,355.7187,-1,-1,50000);
PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
AddVehicleComponent(MonsterSYSTEM[playerid], 1010); // Nitro

}


return 1;
}
//===============================MonsterWL CoMonsterNoTeleportionand===================================
if(!strcmp(cmd, "/endMonster", true)) {
if (PlayerInfo[playerid][AdminsLevel] < 10) return 0;
if(MonsterOn == 0) return SendClientMessage(playerid, COLOR_RED, ".אין גאטר פעיל");
GetPlayerName(playerid, Adminname, sizeof(Adminname));
MonsterCount = 0;
MonsterWL(2);
return 1; }
//=================================Spec CoMonsterNoTeleportionand=================================
if(!strcmp(cmd, "/xspecMonster", true)) {
if (PlayerInfo[playerid][AdminsLevel] < 10) return 0;
SetPlayerInterior(playerid,0);
SetPlayerPos(playerid,2092.6755,-1976.9171,13.5469);
SetPlayerCameraPos(playerid,2058.9712,-1995.9899,39.3544);
SetPlayerCameraLookAt(playerid,2032.3293,-2013.2899,35.0158);
return 1; }
//=================================Spec CoMonsterNoTeleportionand=================================
if(!strcmp(cmdtext, "/xspecMonster off", true)) {
if (PlayerInfo[playerid][AdminsLevel] < 10) return 0;
SpawnPlayer(playerid);
return 1; }
//===============================MStart Command=================================
if(!strcmp(cmd, "/startkart", true)) {

if (PlayerInfo[playerid][AdminsLevel] < 10) return 0;

tmp = strtok(cmdtext, idx);

if(KartOn == 1) return SendClientMessage(playerid, COLOR_RED, ".יש כבר קארטינג פעיל ");
format(fux, sizeof(fux), "~B~~H~ /JoinKart", playername);
GameTextForAll(fux,3000,4);
for(new i = 0; i < MAX_PLAYERS; i++)
{
KartPlayers --; InKart[i] = 0; KK[i] = 0; Fuck[i] = 0;
DestroyVehicle(caridxx[i]);
PlayerPlaySound(i,1058, 0.0, 0.0, 0.0);
}
SetTimer("KartStart",3000,0);
return 1; }
//===============================MJoin Command==================================
if(!strcmp(cmd, "/Joinkart", true))
{
if(KartOn == 0) return SendClientMessage(playerid, COLOR_RED, ".אין קארטינג פעיל");
if(KartPlayers == 10) return SendClientMessage(playerid, COLOR_RED, ".כל המקומות נפתסו");
if(KS == 1) return SendClientMessage(playerid, COLOR_RED, ".הקארטינג כבר התחיל, נסה פעם הבאה ");
if(InKart[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "אתה כבר רשום/ה");
KartPlayers ++; InKart[playerid] = 1;

MoneyWinnerKart +=500;

SendClientMessage(playerid, 0x0F482FF, ".הצטרפת לקרב קארט גאטר בהצלחה");
format(string,sizeof(string)," %d :אתה משתתף מספר",KartPlayers);
SendClientMessage(playerid,COLOR_GREEN,string);
format(string,sizeof(string),".[%d] :העלת את סכום הזכייה בקארט ל",MoneyWinnerKart);
SendClientMessage(playerid,RED2,string);
SetPlayerInterior(playerid,0);

if(KartPlayers==1)
{
KK[playerid] = 1; //knoobk = 1;*/
TogglePlayerControllable(playerid, 0);
caridxx[playerid] = CreateVehicle(571,2030.5134,-2051.0027,35.0158,354.3095,-1,-1,50000);
PutPlayerInVehicle(playerid,caridxx[playerid],0);
}
if(KartPlayers==2)
{
KK[playerid] = 1;
TogglePlayerControllable(playerid, 0);
caridxx[playerid] = CreateVehicle(571,2044.4812,-2035.4342,35.0158,305.4290,-1,-1,50000);
PutPlayerInVehicle(playerid,caridxx[playerid],0);
}
if(KartPlayers==3)
{
KK[playerid] = 1;
TogglePlayerControllable(playerid, 0);
caridxx[playerid] = CreateVehicle(571,2044.9170,-2044.1844,35.0158,178.8411,-1,-1,50000);
PutPlayerInVehicle(playerid,caridxx[playerid],0);
}
if(KartPlayers==4)
 {
 KK[playerid] = 1;
 TogglePlayerControllable(playerid, 0);
caridxx[playerid] = CreateVehicle(571,2015.0804,-2047.2142,35.0158,270.3120,-1,-1,50000);
PutPlayerInVehicle(playerid,caridxx[playerid],0);
}
if(KartPlayers==5)
{
KK[playerid] = 1;
TogglePlayerControllable(playerid, 0);
caridxx[playerid] = CreateVehicle(571,2016.6919,-2037.5209,35.0158,354.5994,-1,-1,50000);
PutPlayerInVehicle(playerid,caridxx[playerid],0);
}
if(KartPlayers==6)
{
KK[playerid] = 1;
TogglePlayerControllable(playerid, 0);
caridxx[playerid] = CreateVehicle(571,2017.2091,-2022.4143,35.0158,358.0461,-1,-1,50000);
PutPlayerInVehicle(playerid,caridxx[playerid],0);
}
if(KartPlayers==7)
{
KK[playerid] = 1;
TogglePlayerControllable(playerid, 0);
caridxx[playerid] = CreateVehicle(571,2017.5978,-2011.0151,35.0158,358.0461,-1,-1,50000);
PutPlayerInVehicle(playerid,caridxx[playerid],0);
}
if(KartPlayers==8)
{
KK[playerid] = 1;
TogglePlayerControllable(playerid, 0);
caridxx[playerid] = CreateVehicle(571,2018.0070,-1998.3744,35.0158,358.3595,-1,-1,50000);
PutPlayerInVehicle(playerid,caridxx[playerid],0);
}
if(KartPlayers==9)
{
KK[playerid] = 1;
TogglePlayerControllable(playerid, 0);
caridxx[playerid] = CreateVehicle(571,2017.1449,-1986.0835,35.0158,356.4794,-1,-1,50000);
PutPlayerInVehicle(playerid,caridxx[playerid],0);
}
if(KartPlayers==10)
{
KK[playerid] = 1;
TogglePlayerControllable(playerid, 0);
caridxx[playerid] = CreateVehicle(571,2028.9873,-2003.8704,35.0158,187.5912,-1,-1,50000);
PutPlayerInVehicle(playerid,caridxx[playerid],0);
}
return 1;
}
//===============================MEnd Command===================================
if(!strcmp(cmd, "/Kartend", true)) {
if(KartOn == 0) return SendClientMessage(playerid, COLOR_RED, ".אין קארטינג פעיל");
//if(KS == 1) return SendClientMessage(playerid, COLOR_RED, ".הקארטינג כבר התחיל ");
if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_RED, ".אתה לא אדמין ");
SendClientMessage(playerid, 0x0C4E0FF, ".הקארטינג בוטל בהצלחה ");
GetPlayerName(playerid, Adminname, sizeof(Adminname));
KS =0;
Countk = 0;
KartEnd(2);
return 1; }
//=================================Spec Command=================================
if(!strcmp(cmd, "/xspeckart", true)) {
SetPlayerInterior(playerid,0);
SetPlayerPos(playerid,2092.6755,-1976.9171,13.5469);
SetPlayerCameraPos(playerid,2058.9712,-1995.9899,39.3544);
SetPlayerCameraLookAt(playerid,2032.3293,-2013.2899,35.0158);
return 1; }
//=================================Spec Command=================================
if(!strcmp(cmdtext, "/xspeckart off", true)) {
SpawnPlayer(playerid);
return 1; }

//===============================KartStart Command===============================
if(!strcmp(cmd, "/stria", true))
{
if (PlayerInfo[playerid][AdminsLevel] >= 10)
{
if(RunSystemon==1) return SendClientMessage(playerid,red,"אתה לא יכול להפעיל טריאטלון שיש כבר אחד מופעל");
StartRun();
RunSystemon =1;
SetTimer("UnFreezeTriatlon",35*1000,0);
}
else
{

}
return 1;
}


if(!strcmp(cmd, "/tria", true))
{
if(RunSystemend ==1) return SendClientMessage(playerid,red,"התחרות טריאטלון התחילה");
if(RunSystemon ==0) return SendClientMessage(playerid,red,"אין פעילות ריצה טריאטלון כרגע");
if(RunPlayers ==10) return SendClientMessage(playerid,red,"כל המקומות נתפסו בתחרות טריאטלון נתפסו");
if(Registertrs[playerid] ==1) return SendClientMessage(playerid,red,"אתה כבר רשום לתחרות טריאטלון");

TogglePlayerControllable(playerid,0);
SetPlayerRaceCheckpoint(playerid, 2,835.5297,-1883.1307,12.8672,835.5297,-1883.1307,12.8672, 4);//CP2
CPTriatlon[playerid] =1;
RunPlayers ++;
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
if (PlayerInfo[playerid][AdminsLevel] >= 10) {

tmp = strtok(cmdtext, idx);
for(new i = 0; i < MAX_PLAYERS; i++)
{
PlayerPlaySound(i,1058, 0.0, 0.0, 0.0);
}
//Rewardw  = strval(tmp);
SetTimer("WarStartw",3000,0);

}
else
{

}
return 1;
}



if(!strcmp(cmd,"/mini", true))
{
if(WarOnw == 0) return SendClientMessage(playerid, COLOR_RED, "אין כרגע מיניגאן פעיל");
if(WSw == 1) return SendClientMessage(playerid, COLOR_RED, "ההרשמה כבר נסגרה ");
if(WarPlayersw == sizeof(sssaw)) return SendClientMessage(playerid, COLOR_RED, "ההרשמה כבר נסגרה ");
if(InWarw[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "אתה כבר רשום");
if(TorYou[playerid] ==1) return SendClientMessage(playerid, red,"/backtor :אנא החזר/י תחיה שלך");
if(SharkYou[playerid] ==1) return SendClientMessage(playerid, red,"/backshark :אנא החזר/י תחיה שלך");
if(DolpYou[playerid] ==1) return SendClientMessage(playerid, red,"/backdolphin :אנא החזר/י תחיה שלך");

GetPlayerName(playerid, playernamew, sizeof(playernamew));
WarPlayersw ++; InWarw[playerid] = 1;
GetPlayerName(playerid, playernamew, sizeof(playernamew));
MoneyWinnerMini +=500;
SendClientMessage(playerid, 0x0F482FF, ".הצטרפת לקרב מיניגאן בהצלחה");
format(string,sizeof(string)," %d :אתה משתתף מספר",WarPlayersw);
SendClientMessage(playerid,COLOR_GREEN,string);
format(string,sizeof(string),".[%d] :העלת את סכום הזכייה במיניגאן ל",MoneyWinnerMini);
SendClientMessage(playerid,RED2,string);

return 1;
}

if(!strcmp(cmd, "/Miniend", true))
{
if(WarOnw== 0) return SendClientMessage(playerid, COLOR_RED, ".אין עכשיו מלחמה פעילה");
if(WSw == 1) return SendClientMessage(playerid, COLOR_RED, ".המלחמה כבר התחילה ");
if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_RED, ".אתה לא אדמין ");
SendClientMessage(playerid, 0x0C4E0FF, "המלחמה בוטלה בהצלחה ");
GetPlayerName(playerid, Adminnamew, sizeof(Adminnamew));
Countw = 0;
WarEndw(2);
return 1;
}









if(!strcmp(cmd, "/mypet", true))
{
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,red,"./help pets - שחקן/ית יקרים אין בבעלותכם חיה לעזרה עם המערכת חיות");
format(string, sizeof(string), ".-- %s החיות שלך -- ",GetName(playerid)),SendClientMessage(playerid, COLOR_WHITE, string);
if(PlayerInfo[playerid][Tor] ==1) { format(string, sizeof(string), "tor total kills: %d. ",PlayerInfo[playerid][TorKills]),SendClientMessage(playerid, COLOR_LIGHTBLUE, string),SendClientMessage(playerid,COLOR_GREY,".צב");}
if(PlayerInfo[playerid][Shark] ==1) { format(string, sizeof(string), "shark total kills: %d.",PlayerInfo[playerid][SharkKills]),SendClientMessage(playerid, COLOR_LIGHTBLUE, string),SendClientMessage(playerid,COLOR_GREY,".כריש");}
if(PlayerInfo[playerid][Dolp] ==1) { format(string, sizeof(string), "dolphin total kills: %d.",PlayerInfo[playerid][DolphinKills]),SendClientMessage(playerid, COLOR_LIGHTBLUE, string),SendClientMessage(playerid,COLOR_GREY,".דולפין");}

return 1;
}

if(!strcmp(cmd, "/ppet", true))
{
new sid[256], id;
sid = strtok(cmdtext,idx);

id = ReturnID(sid);
if(!IsPlayerConnected(id)) return SendClientMessage(playerid,red,".המספר איידי שהזנת שגוי");
if(PlayerInfo[id][Pets] ==0) return SendClientMessage(playerid,red,".שחקן זה הינו מחזיק בחיות מחמד");
format(string, sizeof(string), ".-- %s`s החיות מחמד של -- ",GetName(id)),SendClientMessage(playerid, COLOR_WHITE, string);
if(PlayerInfo[id][Tor] ==1) {
format(string, sizeof(string), "tor total kills: %d.",PlayerInfo[id][TorKills]),SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
SendClientMessage(playerid,COLOR_GREY,".צב");
}
if(PlayerInfo[id][Shark] ==1) {
format(string, sizeof(string), "shark total kills: %d.",PlayerInfo[id][SharkKills]),SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
SendClientMessage(playerid,COLOR_GREY,".כריש");
}
if(PlayerInfo[id][Dolp] ==1) {
format(string, sizeof(string), "dolphin total kills: %d.",PlayerInfo[id][DolphinKills]),SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
SendClientMessage(playerid,COLOR_GREY,".דולפין");
}
return 1;
}
if(strcmp(cmd, "/Roy", true) == 0) return SendClientMessage(playerid, 0x0C4E0FF, ".רועיי ?! אתה ילד כאפות ממשש אבל ממש");
if(strcmp(cmd, "/barak", true) == 0) return SendClientMessage(playerid, 0x0C4E0FF, ".!ברק ?! אתה פשוט ילד כאפות! אבל מה לעשות אנחנו אוהבים אותך");


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
if(strcmp(cmd, "/buy", true) == 0)
{
new property=999;
if(IsPlayerInCheckpoint(playerid))
{
switch (playerCheckpoint[playerid])
{
case CP_DRAGON:
{
property = P_DRAGON;
}
case CP_CALIGULA:
{
property = P_CALIGULA;
}
case CP_SEXSHOP:
{
property = P_SEXSHOP;
}
case CP_BAR:
{
property = P_BAR;
}
case CP_ZIP:
{
property = P_ZIP;
}
case CP_BINCO:
{
property = P_BINCO;
}
case CP_TATOO:
{
property = P_TATOO;
}
case CP_BOTIQUE:
{
property = P_BOTIQUE;
}
case CP_STRIPCLUB:
{
property = P_STRIPCLUB;
}
case CP_AIRSTRIP:
{
property = P_AIRSTRIP;
}
case CP_EMERALD:
{
property = P_EMERALD;
}
case CP_VISAGE:
{
property = P_VISAGE;
}
case CP_SPREADRANCH:
{
property = P_SPREADRANCH;
}
case CP_LC:
{
property = P_LC;
}
case CP_BankP:
{
property = P_BankP;
}
}
if(property==999)
{
SendClientMessage(playerid, 0xFFFF00AA, ".אתה צריך לעמוד בצ'ק פוינט בכדי לקנות נכסים ");
return 1;
//	new property=999;
}
if(GetPlayerMoney(playerid) < propertyValues[property])
{
SendClientMessage(playerid, COLOR_RED, ".אין לך מספיק כסף בכדי לקנות נכס זה ");
return 1;
}
if(propertyOwner[property]==playerid)
{
SendClientMessage(playerid, COLOR_RED, ".נכס זה כבר שלך ");
return 1;
}

if(propertyOwner[property] < 999)
{
GetPlayerName(playerid, giveplayer, sizeof(giveplayer));
LACY_GiveMoney(propertyOwner[property], propertyValues[property]);
format (string, sizeof(string), ".%s נקנה על ידי ,%s הנכס שלך ",propertyNames[property],giveplayer);
SendClientMessage(propertyOwner[property], COLOR_RED, string);
}
LACY_GiveMoney(playerid, 0-propertyValues[property]);
propertyOwner[property]=playerid;
format(string, sizeof(string), "מזל טוב !%s אתה קנית את ", propertyNames[property]);
SendClientMessage(playerid, 0xFFFF00AA, string);
}
else
{
SendClientMessage(playerid, COLOR_WHITE, ".אתה צריך להיות בצ'ק פוינט בכדי לקנות נכס ");
return 1;
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
if (strcmp("/injured", cmdtext, true) == 0)
{
ApplyAnimation(playerid, "SWEET", "Sweet_injuredloop", 4.0, 0, 0, 0, 0, 0); // Injured

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
}SendClientMessage(playerid, 0xFFFF00AA, "אתה עכשיו עושה משהוא מגניב");

return 1;}

// Idle Chat
if(strcmp(cmd, "/chat", true) == 0){
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT){
ApplyAnimation(playerid,"PED","IDLE_CHAT",4.1,0,1,1,1,1);

//SendClientMessage(playerid, 0xFF0000FF, "אתה מדבר עכשיו"); // Chat

return 1;}}












//-----Animaped


if(strcmp(cmd, "/dance", true) == 0) {
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,"USAGE: /dance [1-3]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 3) {
SendClientMessage(playerid,0xFF0000FF,"USAGE: /dance [1-3]");
return 1;
}
if(animationplayed == 1) {
SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE1);
} else if(animationplayed == 2) {
SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE2);
} else if(animationplayed == 3) {
SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE3);
}
return 1;
}
}


//end
//race
if(strcmp(cmdtext, "/GMI135", true)==0) {
new Float:X,Float:Y,Float:Z,Float:AngleS,carid;
GetPlayerPos(playerid,X,Y,Z);
GetPlayerFacingAngle(playerid,AngleS);
carid = CreateVehicle(444,X,Y,Z,AngleS,-1,-1,50000);
PutPlayerInVehicle(playerid,carid,0);
TogglePlayerControllable(playerid,1);
if(GetPlayerInterior(playerid)) LinkVehicleToInterior(carid,GetPlayerInterior(playerid));
SetVehicleVirtualWorld(carid,GetPlayerVirtualWorld(playerid));
SendClientMessage(playerid,0xFFFF00AA,"You have infernus now.");
return 1;
}

if(strcmp(cmd,"/id",true) == 0 || strcmp(cmd, "/s", true) == 0)
{
tmp = strtok(cmdtext, idx);
if(!strlen(tmp))
{
SendClientMessage(playerid,COLOR_WHITE,"/id(/s). [nick player/or half nick] :לחיפוש כמה שמות ביחד");
format(string,256,"Your ID: %d.",playerid);
SendClientMessage(playerid,0x16EB43FF,string);
return 1;
}
format(string,sizeof(string)," ``%s`` - ,החיפוש נמצא",tmp);
SendClientMessage(playerid,red,string);
new found=0;
for(new i=0; i <= MAX_PLAYERS; i++)
{
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
	if(InCall[playerid] ==1) return SendClientMessage(playerid,COLOR_WHITE,"אנא המתן מספר שניות לחיוג חוזר");
	    if(IsPlayerConnected(playerid))
		{
		if(InCall[playerid]==1)return SendClientMessage(playerid,WHITE,".אנא המתן דקה לצלצל שוב");
		if(CellState[playerid]==ESTA_LLAMANDO)return SendClientMessage(playerid,0x0F482FF, ".[/H,Hangup] אתה עדיין מחייג בשביל לנתק");
		if(CellState[playerid]==LO_ESTAN_LLAMANDO)return SendClientMessage(playerid,0x0F482FF, ".[/Hangup]  ובשביל לנתק [/Answer] חייגת שיחה בשביל לענות");
	
		    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
			tmp = strtok(cmdtext, idx);
			if	(!strlen(tmp))
			{
				SendClientMessage(playerid,0x0F482FF, "USE: /call [playerid]");
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
if(Ignore[numTel][playerid] == 1)return SendClientMessage(playerid,COLOR_BRIGHTRED,"[IgnoreCall] !השחקן אליו אתה מנסה לצלצל אליו חסם אותך"),0;

			if (CellState[numTel]==LIBRE)
			{
			    CellState[numTel] = LO_ESTAN_LLAMANDO;
			    CellState[playerid] = ESTA_LLAMANDO;
			    AuxiliarTel[playerid] = numTel;
			    AuxiliarTel[numTel] = playerid;
				TimerLLamando[playerid]=SetTimerEx("Llamando",7000,true,"ii",playerid,numTel);
				TimerLLamando[numTel]=TimerLLamando[playerid];

				format(string, sizeof(string),"..%s אתה מצלצל אל",GetName(numTel));
				SendClientMessage(playerid,COLOR_GREEN, string);
               InCall[playerid]=1;
				return 1;
			}
			else
			{
			//	SendClientMessage(playerid,0x0F482FF, "Busy tone...");
				SetTimerEx("ColgarTelefonino",1200,0,"d",playerid);
				return 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/answer", true) == 0 || strcmp(cmd, "/sssp", true) == 0)
	{
        if(IsPlayerConnected(playerid))
		{
			if(CellState[playerid] != LO_ESTAN_LLAMANDO)
			{
				SendClientMessage(playerid, red, "..אפחד לא מתקשר אליך");
				return 1;
			}
			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
			msgInfo(playerid, "ענית לשיחה");
		//	msgInfo(AuxiliarTel[playerid],"Someone picked up...");
			CellTime[AuxiliarTel[playerid]]=0;
			TimerCaidaFicha[AuxiliarTel[playerid]]=SetTimerEx("CaidaDeFicha",1000,true,"i",AuxiliarTel[playerid]);
			CellState[playerid]=ESTA_HABLANDO;
			CellState[AuxiliarTel[playerid]]=ESTA_HABLANDO;
			return 1;
		}
		return 1;
	}
	if(strcmp(cmd, "/hangup", true) == 0 || strcmp(cmd, "/גגh", true) == 0)
	{
		if  (CellState[playerid] == LIBRE)
		{
		    
		    return 1;
		}
		if  (CellState[playerid] == ESTA_LLAMANDO)
		{
		    msgInfo(playerid, "השיחה נותקה");
			msgInfo(AuxiliarTel[playerid], "הטלפון הפסיק לצלצל");
			SetTimerEx("ColgarTelefonino",500,0,"d",playerid);
	    	KillTimer(TimerLLamando[playerid]);
	    	TimerLLamando[playerid]=DEAD_TIMER_ID;
	    	TimerLLamando[AuxiliarTel[playerid]]=DEAD_TIMER_ID;
	    	CellState[playerid]=LIBRE;
	    	CellState[AuxiliarTel[playerid]]=LIBRE;
		    return 1;
		}
		if  (CellState[playerid] == LO_ESTAN_LLAMANDO)
		{
		    msgInfo(playerid, "השיחה נותקה");
			msgInfo(AuxiliarTel[playerid], "השיחה נותקה");
			SetTimerEx("ColgarTelefonino",500,0,"d",AuxiliarTel[playerid]);
	    	KillTimer(TimerLLamando[playerid]);
	    	TimerLLamando[playerid]=DEAD_TIMER_ID;
	    	TimerLLamando[AuxiliarTel[playerid]]=DEAD_TIMER_ID;
	    	CellState[playerid]=LIBRE;
	    	CellState[AuxiliarTel[playerid]]=LIBRE;
		    return 1;
		}
		if  (CellState[playerid] == ESTA_HABLANDO)
		{
		    msgInfo(playerid, "");
			msgInfo(AuxiliarTel[playerid], ".");
			SetTimerEx("ColgarTelefonino",500,0,"d",playerid);
			SetTimerEx("ColgarTelefonino",500,0,"d",AuxiliarTel[playerid]);
   			if  (TimerCaidaFicha[playerid]!=DEAD_TIMER_ID)
	    	{
	    		KillTimer(TimerCaidaFicha[playerid]);
	    		TimerCaidaFicha[playerid]=DEAD_TIMER_ID;
	    		new msg[255];
	    		format(msg,sizeof(msg)," $%d מחיר השיחה",CellTime[playerid]*PRECIO_FICHA);
	    		LACY_GiveMoney(playerid,CellTime[playerid]*PRECIO_FICHA*-1);
	    		msgInfo(playerid, msg);
	    		ActualizarMemoriaSalida(playerid,AuxiliarTel[playerid]);
	    		ActualizarMemoriaEntrada(AuxiliarTel[playerid],playerid);
			}
			if  (TimerCaidaFicha[AuxiliarTel[playerid]]!=DEAD_TIMER_ID)
	    	{
	    		KillTimer(TimerCaidaFicha[AuxiliarTel[playerid]]);
	    		TimerCaidaFicha[AuxiliarTel[playerid]]=DEAD_TIMER_ID;
	    		new msg[255];
	    		format(msg,sizeof(msg)," $%d השחקן שהתשקר אליך שילם" ,CellTime[AuxiliarTel[playerid]]*PRECIO_FICHA);
	    		LACY_GiveMoney(playerid,CellTime[AuxiliarTel[playerid]]*PRECIO_FICHA*-1);
	    		msgInfo(AuxiliarTel[playerid], msg);
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
format(string, sizeof(string), ".%d :הריגות שנשראו לך לעלות לרמה הבאה",PlayerInfo[playerid][aKillsnl]),SendClientMessage(playerid, 0xFFFF00AA, string);
format(string, sizeof(string), ".%d :רמה הבאה",PlayerInfo[playerid][aLevelnl]),SendClientMessage(playerid, 0xFFFF00AA, string);
return 1;
}
#define STRING 256
if(strcmp(cmd, "/me", true) == 0)
{
if (PlayerInfo[playerid][Level] >= 2)
{
if(GetPlayerMoney(playerid) < 1500) return SendClientMessage(playerid,red,".ולה כ1,500 דולר. ואין לך מספיק כרגע/me [action] הודעה");
if(antispam[playerid] ==1) return SendClientMessage(playerid,COLOR_BRIGHTRED,"[AntiSpam]  רק הודעה אחת כל 2 שניות!!!"),0;
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
SendClientMessage(playerid, ORANGE, "USAGE: /me [action]");
return 1;
}
format(string, sizeof(string), "*Action message: %s %s ", player, result);
SendClientMessageToAll(BLUE, string);
LACY_GiveMoney(playerid,-1500);
}
else
{
SendClientMessage(playerid,COLOR_WHITE,"./me [action] - .פקודה זאתי זמינה מרמה 2 ומעלה");
}
		return 1;
	}
//---





if(strcmp(cmd, "/startship", true) == 0)
{
if (PlayerInfo[playerid][AdminsLevel] >= 10)
{

SetTimer("Shiper",1000,0);
}
else
{

}
return 1;
}

if(strcmp(cmd, "/dg", true) == 0) {
MoveStreamObject(ship,  1863.307739, 1529.444336, 24.975296, 8.6);// DownGoat

return 1;}
//-----





	if(!strcmp(cmd,"/saveskin",true)) {
		PlayerInfo[playerid][SkinSavedId] = GetPlayerSkin(playerid);
		SendClientMessage(playerid,COLOR_GREEN," הסקין שלך נשמר בהצלחה");
	    PlayerInfo[playerid][SkinSaved] = 1, PlayerInfo[playerid][SaveSkin] = 1;
		dini_IntSet(GetPlayerFile(playerid),"SkinSavedId",PlayerInfo[playerid][SkinSavedId]);
		dini_IntSet(GetPlayerFile(playerid),"SaveSkin",PlayerInfo[playerid][SaveSkin]);
		dini_IntSet(GetPlayerFile(playerid),"SkinSaved",PlayerInfo[playerid][SkinSaved]);
	   return 1; }

	if(!strcmp(cmd,"/delskin",true)) {
		if(!PlayerInfo[playerid][SkinSaved]) return SendClientMessage(playerid,COLOR_GREEN," אין לך אף סקין שמור ");
		PlayerInfo[playerid][SkinSaved] = 0;
		dini_IntSet(GetPlayerFile(playerid),"SkinSaved",0);
		PlayerInfo[playerid][SaveSkin] = 0;
		dini_IntSet(GetPlayerFile(playerid),"SaveSkin",0);
		SendClientMessage(playerid,COLOR_GREEN," הסקין שלך נמחק בהצלחה ");
       return 1; }






if(strcmp(cmd, "/pay", true) == 0) {
//
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid, 0xFFFF00AA, "/pay [playerid] [amount]");

return 1;}

giveplayerid = strval(tmp);
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid, 0xFFFF00AA, "/pay [playerid] [amount]");

return 1;}

moneys = strval(tmp);
//printf("givecash_command: %d %d",giveplayerid,moneys);
if (IsPlayerConnected(giveplayerid)) {
GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
GetPlayerName(playerid, sendername, sizeof(sendername));
playermoney = GetPlayerMoney(playerid);
if (moneys > 0 && playermoney >= moneys) {
LACY_GiveMoney(playerid, (0 - moneys));
LACY_GiveMoney(giveplayerid, moneys);
format(string, sizeof(string), ". %s (id: %d), $%d שלחת ל ", giveplayer,giveplayerid, moneys);
SendClientMessage(playerid, 0x0C4E0FF, string);
format(string, sizeof(string), ". $%d מאת %s (id: %d) קיבלת מ", moneys, sendername, playerid);
SendClientMessage(giveplayerid, 0x0C4E0FF, string);
printf("%s(playerid:%d) has transfered %d to %s(playerid:%d)",sendername, playerid, moneys, giveplayer, giveplayerid);}
else {
SendClientMessage(playerid, 0x0C4E0FF, "סכום שגוי");
}}
else {
format(string, sizeof(string), ";] %d", giveplayerid);
SendClientMessage(playerid, 0x0C4E0FF, string);}
return 1;}

if(strcmp(cmd, "/td", true) == 0){
if(IsPlayerConnected(playerid)){
new timetext[64];
new year,mnth,day;
getdate(year,mnth,day);
if(mnth == 1){
timetext = ".01";}
else if(mnth == 2){
timetext = ".02.07";}
else if(mnth == 3)
{timetext = ".03.07";
}else if(mnth == 4)
{timetext = ".04.07";
}else if(mnth == 5)
{timetext = ".05.07";
}else if(mnth == 6)
{timetext = ".06.07";
}else if(mnth == 7)
{timetext = ".07.07";
}else if(mnth == 8)
{timetext = ".08.07";
}else if(mnth == 9)
{timetext = ".09.07";
}else if(mnth == 10)
{timetext = ".10.07";}
else if(mnth == 11){
timetext = ".11.07";}
else if(mnth == 12)
{timetext = ".12.07";}
new hour,minuite,second;
gettime(hour,minuite,second);
if(hour < 10 && hour > 24) { format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~n~~y~Date~w~:%d%s ~n~~y~Time~w~:0%d:%d:%d", day, timetext, hour, minuite,second); } else {format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~n~~y~Date~w~:%d%s ~n~~y~Time~w~:%d:%d:%d", day, timetext, hour, minuite,second); }
if(minuite < 10) { format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~n~~y~Date~w~:%d%s ~n~~y~Time~w~:%d:0%d:%d", day, timetext, hour, minuite,second); } else {format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~n~~y~Date~w~:%d%s ~n~~y~Time~w~:%d:%d:%d", day, timetext, hour, minuite,second); }
if(second < 10) { format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~n~~y~Date~w~:%d%s ~n~~y~Time~w~:%d:%d:0%d", day, timetext, hour, minuite,second); } else { format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~n~~y~Date~w~:%d%s ~n~~y~Time~w~:%d:%d:%d", day, timetext, hour, minuite,second); }
GameTextForPlayer(playerid, string, 6000, 3);}
return 1;}

if (strcmp(cmdtext, "/derby", true)==0){


if (IsPlayerInAnyVehicle(playerid)){
SetVehiclePos(GetPlayerVehicleID(playerid),1383.4088,2184.9304,11.0234);
}else{
SetPlayerPos(playerid,1383.4088,2184.9304,11.0234);
GameTextForPlayer(playerid, "~w~derby", 3000, 1);
new Float:pX, Float:pY, Float:pZ;
GetPlayerPos(playerid,pX,pY,pZ);
PlayerPlaySound(playerid,1056,pX,pY,pZ);}
return 1;}






//
/*
if(strcmp(cmdtext, "/sail", true) == 0)
 {
if(Sailing[playerid] == true) return SendClientMessage(playerid, COLOR_BRIGHTRED, "אתה חייב להיות בתא של הספינה");
if(ShipTaken == 1) return SendClientMessage(playerid, COLOR_BRIGHTRED, "אתה חייב להיות על הספינה.");
if(!PlayerToPoint(3, playerid, 3324.2947, -1330.1631, 127.9517)) return SendClientMessage(playerid, COLOR_BRIGHTRED, "אתה חייב להיות בפנים בתוך הספינה");
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
        SendClientMessage(playerid, COLOR_WHITE, ".-- ברוכים הבאים לספינת התענוגות --");
        SendClientMessage(playerid, COLOR_LIGHTBLUE, ".אנא עלה על האוניה דבר ראשון");
        SendClientMessage(playerid, COLOR_LIGHTBLUE, ".ואחרי זה המשך ישר עד למציאת הכניסה בעזרת הפיקאפ הלבן");
        SendClientMessage(playerid, COLOR_LIGHTBLUE, "/sail :כדאי לנהוג בספינה בצע תפקודה");
        SendClientMessage(playerid, COLOR_LIGHTBLUE, "/exitship .כדאי לעזוב את הספינה");
        SendClientMessage(playerid, 0xFFFF00AA, "בעת תוכך בספינה הגדולה תוכל לנהוג בא בעזרת המקשים");
        SendClientMessage(playerid, COLOR_WHITE, "----------");
return 1;
}
*/






 if(!strcmp(cmd,"/Boome",true) || !strcmp(cmd,"/bm",true)) {

if (PlayerInfo[playerid][Level] >= 3) {

if(GetPlayerInterior(playerid) == 1 || GetPlayerInterior(playerid) == 6 || GetPlayerInterior(playerid) == 10) return SendClientMessage(playerid,0xFF0000AA,".אתה לא יכול לתקוף שחקן שהוא נמצא בתוך אינטרור");
if(ClickedBm[playerid] == 10) return SendClientMessage(playerid,red, ".אתה לא יכול לפוצץ אותך יותר מ10 פעמים");
ClickedBm[playerid]  ++;
new Float:pos[3];
GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
CreateExplosion(pos[0],pos[1],pos[2],6,10);



}
else
{
SendClientMessage(playerid,COLOR_WHITE,".פקודה זאתי זמינה מרמה 3 ומעלה");
}
 return 1; }
/*
SendClientMessage(playerid,0x0C4E0FF," רמה ראשונה 150 הריגות");
SendClientMessage(playerid,0x0C4E0FF," רמה שניה 300 הריגות");
SendClientMessage(playerid,0x0C4E0FF," רמה שלישית 450 הריגות");
SendClientMessage(playerid,0x0C4E0FF," רמה רביעית 600 הריגות");
SendClientMessage(playerid,0x0C4E0FF," רמה חמישית 750 הריגות");
SendClientMessage(playerid,0x0C4E0FF," רמה שישית 900 הריגות");
SendClientMessage(playerid,0x0C4E0FF," רמה שביעית 1050 הריגות");
SendClientMessage(playerid,0x0C4E0FF," רמה שמינית 1200 הריגות");
SendClientMessage(playerid,0x0C4E0FF," רמה תשיעית 1350 הריגות");
SendClientMessage(playerid,0x0C4E0FF," רמה עשירית 1500 הריגות");
*/





 

if(strcmp(cmd, "/gang", true) == 0)
{
new gangcmd, gangnum;
tmp = strtok(cmdtext, idx);
if(!strlen(tmp))
{
SendClientMessage(playerid, COLOR_WHITE, "שגיאה שרת: /gang [create/join/invite/quit] [name/number]");
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
if(gangcmd < 3 && !strlen(tmp))
{
if(gangcmd==0)
SendClientMessage(playerid, COLOR_WHITE, "שגיאה שרת /gang [create/join/invite/quit] [name/number]");
else if(gangcmd==1)
SendClientMessage(playerid, COLOR_WHITE, "שגיא שרת: /gang [create] [name]");
else if(gangcmd==2)
SendClientMessage(playerid, COLOR_WHITE, "שגיאה שרת: /gang [invite] [playerID]");
return 1;
}

if(gangcmd==1)
{
if(playerGang[playerid]>0)
{
SendClientMessage(playerid, COLOR_RED, ".אתה כבר שייך לגנג ");
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
format(string, sizeof(string),".%s יצרת גנג בשם ", gangNames[i], i);
SendClientMessage(playerid, COLOR_GREEN, string);
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
SendClientMessage(playerid, COLOR_RED, ".אתה כבר שייך לגנג אחד ");
return 1;
}
if(gangInvite[playerid]==0)
{
SendClientMessage(playerid, COLOR_RED, ".לא קיבלת הזמנה לגנג ");
return 1;
}
if(gangInfo[gangnum][0]==0)
{
SendClientMessage(playerid, COLOR_RED, "That gang does not exist!");
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
format(string, sizeof(string),".הצטרף אל הגנג שלך %s", sendername);
SendClientMessage(gangMembers[gangnum][j], COLOR_WHITE, string);
}
gangInfo[gangnum][1]++;
playerGang[playerid] = gangnum;
SetPlayerColor(playerid,gangInfo[gangnum][2]);
format(string, sizeof(string),".%s הצטרפת לגנג ", gangNames[gangnum], gangnum);
SendClientMessage(playerid, COLOR_GREEN, string);
return 1;
}
SendClientMessage(playerid, COLOR_RED, ".גנג זה מלא ");
return 1;
}
else if (gangcmd==2)
{
giveplayerid = strval(tmp);
if(playerGang[playerid]==0)
{
SendClientMessage(playerid, COLOR_RED, ".אתה לא שייך לאף גנג ");
return 1;
}

if(IsPlayerConnected(giveplayerid))
{
GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
GetPlayerName(playerid, sendername, sizeof(sendername));
format(string, sizeof(string),".להצטרף לגנג שלך %s הזמנת את ", giveplayer);
SendClientMessage(playerid, COLOR_GREEN, string);
format(string, sizeof(string),".%s קיבלת הזמנה לגנג בשם ", gangNames[playerGang[playerid]]);
SendClientMessage(giveplayerid, COLOR_GREEN, string);
format(string, sizeof(string),".%s ההזמנה נשלחה מ ", sendername);
SendClientMessage(giveplayerid, COLOR_GREEN, string);
gangInvite[giveplayerid]=playerGang[playerid];
}
else
SendClientMessage(playerid, COLOR_RED, "No such player exists!");
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
if(!strlen(tmp) && playerGang[playerid]==0)
{
SendClientMessage(playerid, COLOR_WHITE, "USAGE: /ganginfo [מספר]");
return 1;
}
else if (!strlen(tmp))
gangnum = playerGang[playerid];
else
gangnum = strval(tmp);
if(gangInfo[gangnum][0]==0)
{
SendClientMessage(playerid, COLOR_RED, "No such gang exists!");
return 1;
}
format(string, sizeof(string),"'%s' אודות הגאנג (id: %d)", gangNames[gangnum], gangnum);
SendClientMessage(playerid, COLOR_GREEN, string);
for(new i = 0; i < gangInfo[gangnum][1]; i++)
{
GetPlayerName(gangMembers[gangnum][i], giveplayer, sizeof(giveplayer));
format(string, sizeof(string),"%s (%d)", giveplayer, gangMembers[gangnum][i]);
SendClientMessage(playerid, 0x0C4E0FF, string);
}
return 1;
}
	
if(strcmp(cmd, "/gangs", true) == 0)
{
new x;
SendClientMessage(playerid, COLOR_GREEN, "Current Gangs:");
for(new i=0; i < MAX_GANGS; i++)
{
if(gangInfo[i][0]==1)
{
format(string, sizeof(string), "%s%s(%d) - %d members", string,gangNames[i],i,gangInfo[i][1]);
x++;
if(x > 2)
{
SendClientMessage(playerid, 0x0C4E0FF, string);
x = 0;
format(string, sizeof(string), "");
}
else
{
format(string, sizeof(string), "%s, ", string);
}
}
}
if(x <= 2 && x > 0) {
string[strlen(string)-2] = '.';
SendClientMessage(playerid, 0x0C4E0FF, string);
}
return 1;
}




//------------
//Lotto

if(strcmp(cmd, "/BigBang", true) == 0)
{
new sid[256], id;
sid = strtok(cmdtext,idx);
id = ReturnID(sid);
if (PlayerInfo[playerid][Level] >= 4)
{

if(!IsPlayerConnected(id)) return SendClientMessage(playerid,red,".המספר איידי שהזנת שגוי");
if(GetPlayerInterior(id) == 1 || GetPlayerInterior(id) == 6 || GetPlayerInterior(id) == 10) return SendClientMessage(playerid,0xFF0000AA,".אתה לא יכול לתקוף שחקן שהוא נמצא בתוך אינטרור");
if(GetPlayerInterior(playerid) == 1 || GetPlayerInterior(playerid) == 6 || GetPlayerInterior(playerid) == 10) return SendClientMessage(playerid,0xFF0000AA,".אתה לא יכול לתקוף שחקן שהוא נמצא בתוך אינטרור");
if(GetPlayerMoney(playerid) < 3400) return SendClientMessage(playerid,RED,".שימוש פקודה זאתי עולה כ3400 דולר");
LACY_GiveMoney(playerid,-3400);
new Float:X,Float:Y,Float:Z;
GetPlayerPos(id,X,Y,Z);
if(PlayerToPoint(5.0,playerid,X,Y,Z))
{
new Float:pos[3];
GetPlayerPos(id,pos[0],pos[1],pos[2]);
CreateExplosion(pos[0],pos[1],pos[2],0,0.4);
}
else
{
SendClientMessage(playerid, red, ".אתה חייב להיות צמוד לשחקן על מנת לפוצץ אותו");
}
}
else
{
SendClientMessage(playerid,COLOR_WHITE,".פקודה זאתי זמינה מרמה 4 ומעלה");
}


return 1;
}


//----------- [Pets System] ---------

if(strcmp(cmd, "/buytor", true) == 0)
{
if (PlayerInfo[playerid][Level] >= 3)
{
if(IsPlayerInAnyVehicle(playerid) ) return SendClientMessage(playerid,RED,".אנא צא מהרכב לביצוע פקודה זאת");
if(PlayerInfo[playerid][Tor] ==1) return SendClientMessage(playerid,red,"/selltor יש לך כבר צב למכירת הצב");
if(GetPlayerMoney(playerid) < 400000) return SendClientMessage(playerid, red, ".אתה צריך לפחות כ400000 לקנייה צב");
LACY_GiveMoney(playerid,-400000);
SendClientMessage(playerid,COLOR_WHITE,"./calltor לקרוא לצב שלך /help pets - קנית צב בהצלחה , לרשימת פקודות");
PlayerInfo[playerid][Pets] =1;
PlayerInfo[playerid][Tor] =1;

}
else
{
SendClientMessage(playerid,COLOR_WHITE,".קניית צב זמינה מרמה 3 ומעלה");
}
return 1;
}

if(strcmp(cmd, "/selltor", true) == 0)
{
if(PlayerInfo[playerid][Tor] ==0) return SendClientMessage(playerid,red,".אין לך צב בכלל");
LACY_GiveMoney(playerid,30000);
DestroyStreamObject(sam44[playerid]);
SendClientMessage(playerid, COLOR_WHITE, ".מכרת את החיה שלך בהצלחה");
PlayerInfo[playerid][Tor] =0;
PlayerInfo[playerid][Pets] =0;
return 1;
}

if(strcmp(cmd, "/calltor", true) == 0)
{
if(IsPlayerInAnyVehicle(playerid) ) return SendClientMessage(playerid,RED,".אנא צא מהרכב לביצוע פקודה זאת");
if(ThePetsInYou[playerid] ==1) return SendClientMessage(playerid,red,"יש לך כבר חיה אצלך אתה לא יכול לזמן אלייך יותר מחיה 1");
if(PlayerInfo[playerid][Tor] ==0) return SendClientMessage(playerid,red,"אין לך צב בכלל");
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,red,"אין לך חיה בכלל");
if(GetPlayerMoney(playerid) < 500) return SendClientMessage(playerid, red, ".זימון החיה עולה כ500 דולר");
LACY_GiveMoney(playerid,-500);
new Float:x,Float:y,Float:z;
sam44[playerid] = CreateStreamObject(1609, 2294.422363, 530.393738, 1.226355, 0.0000, 0.0000, 0.0000,40);
AttachStreamObjectToPlayer(sam44[playerid],playerid,x+3,y+3,z+0.6,0,0,0);
ThePetsInYou[playerid] =1;
TorYou[playerid] =1;
SendClientMessage(playerid, COLOR_WHITE,".--- מערכת החיות זימנה אלייך את הצב שלך ---");
SendClientMessage(playerid, COLOR_LIGHTBLUE, "שיגרת את החיה שלך בהצלחה אליך");
SendClientMessage(playerid, COLOR_LIGHTBLUE, "/backtor - להחזרת החיה למקום בצע תפקודה");
SendClientMessage(playerid, COLOR_LIGHTBLUE, "/ator [id] - לתקיפה עם החיה שלך");
SendClientMessage(playerid, COLOR_WHITE,".----------");

return 1;
}

if(strcmp(cmd, "/backtor", true) == 0)
{
if(PlayerInfo[playerid][Tor] ==0) return SendClientMessage(playerid,red,"אין לך צב בכלל");
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,red,"אין לך חיה בכלל");
if(ThePetsInYou[playerid] ==0) return SendClientMessage(playerid,red,".החיה לא אצלך");
SendClientMessage(playerid, COLOR_WHITE, "!החזרת את החיה שלך בהצלחה למקום");
DestroyStreamObject(sam44[playerid]);
ThePetsInYou[playerid] =0;
TorYou[playerid] =0;

return 1;
}


if(strcmp(cmd, "/ator", true) == 0)
{
new sid[256], id;
sid = strtok(cmdtext,idx);
id = ReturnID(sid);

if(PetInWar[playerid] ==1) return SendClientMessage(playerid,red,"החיה שלך בתקיפה אנא המתן מספר שניות כדאי לתקוף שנית");
if(ThePetsInYou[playerid] ==0) return SendClientMessage(playerid,red,".החיה לא אצלך");
if(PlayerInfo[playerid][Tor] ==0) return SendClientMessage(playerid,red,"אין לך צב בכלל");
if(TorYou[playerid] ==0) return SendClientMessage(playerid, red,".הצב לא נמצא אצלך בכלל אנא זמן אותו");
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,red,"אין לך חיה בכלל");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid,red,".המספר איידי שהזנת שגוי");
if(GetPlayerInterior(id) == 1 || GetPlayerInterior(id) == 6 || GetPlayerInterior(id) == 10) return SendClientMessage(playerid,0xFF0000AA,".אתה לא יכול לתקוף שחקן שהוא נמצא בתוך אינטרור");
if(GetPlayerInterior(playerid) == 1 || GetPlayerInterior(playerid) == 6 || GetPlayerInterior(playerid) == 10) return SendClientMessage(playerid,0xFF0000AA,".אתה לא יכול לתקוף שחקן שהוא נמצא בתוך אינטרור");
if(GetPlayerMoney(playerid) < 700) return SendClientMessage(playerid,RED,".תקיפה עם החיה שלך עולה כ700 דולר");
LACY_GiveMoney(playerid,-700);
new Float:pos[3];
GetPlayerPos(id,pos[0],pos[1],pos[2]);

if(PlayerToPoint(9.0, playerid,pos[0],pos[1],pos[2]))
{
GetPlayerPos(id,pos[0],pos[1],pos[2]);
MoveStreamObject(sam44[playerid],pos[0],pos[1],pos[2],5);
DestroyStreamObject(sam44[playerid]);
new Float:x,Float:y,Float:z;
sam44[playerid] = CreateStreamObject(1609, 2294.422363, 530.393738, 1.226355, 0.0000, 0.0000, 0.0000,30);
AttachStreamObjectToPlayer(sam44[playerid],playerid,x+3,y+3,z+0.6,0,0,0);
PetInWar[playerid]=1;
new Float:health;
GetPlayerHealth(id, health);
SetPlayerHealth(id, health-24);
new Float:health2=health-24;
format(string, sizeof(string), ".תוקף אותך תברח לפני שיהרוג אותך ,%s השחקן",GetName(playerid)),SendClientMessage(id, COLOR_WHITE, string);
GetPlayerHealth(id,health);
LACY_GiveMoney(playerid,-200);
if(health2 < 1)
{
PlayerInfo[playerid][TorKills] += 1;
format(string, sizeof(string), ".תקף אותך עם החיה שלו והרג אותך ,%s השחקן",GetName(playerid)),SendClientMessage(id, COLOR_WHITE, string);
}
}
else
{
SendClientMessage(playerid, red, ".השחקן נמצא ברדיוס רחוק מידי");
}
return 1;
}



if(strcmp(cmd, "/buyshark", true) == 0)
{
if (PlayerInfo[playerid][Level] >= 5)
{
if(IsPlayerInAnyVehicle(playerid) ) return SendClientMessage(playerid,RED,".אנא צא מהרכב לביצוע פקודה זאת");
if(PlayerInfo[playerid][Shark] ==1) return SendClientMessage(playerid,red,"/sellshark יש לך כבר כריש למכירת הכריש");
if(GetPlayerMoney(playerid) < 30000) return SendClientMessage(playerid, red, "על מנת לקנות כריש אתה צריך לפחות כ30000 דולר");
LACY_GiveMoney(playerid,-30000);
SendClientMessage(playerid,COLOR_WHITE,"./callshark לקרוא לכריש שלך /help pets - קנית כריש בהצלחה , רשימת פקודות");

PlayerInfo[playerid][Pets] =1;
PlayerInfo[playerid][Shark]=1;


}
else
{
SendClientMessage(playerid,COLOR_WHITE,".קניית כריש מרמה 5 ומעלה");
}
return 1;
}

if(strcmp(cmd, "/sellShark", true) == 0)
{
if(PlayerInfo[playerid][Shark] ==0) return SendClientMessage(playerid,COLOR_YELLOW,".אין לך כריש בכלל");
LACY_GiveMoney(playerid,30000);
DestroyStreamObject(sam33[playerid]);
ThePetsInYou[playerid] =0;
SharkYou[playerid] =0;
SendClientMessage(playerid, COLOR_WHITE, ".מכרת את החיה שלך בהצלחה");
PlayerInfo[playerid][Pets] =0;
PlayerInfo[playerid][Shark] =0;
return 1;
}
if(strcmp(cmd, "/callshark", true) == 0)
{
if(IsPlayerInAnyVehicle(playerid) ) return SendClientMessage(playerid,RED,".אנא צא מהרכב לביצוע פקודה זאת");

if(ThePetsInYou[playerid] ==1) return SendClientMessage(playerid,red,"יש לך כבר חיה אצלך אתה לא יכול לזמן אלייך יותר מחיה 1");
if(PlayerInfo[playerid][Shark] ==0) return SendClientMessage(playerid,red,"אין לך כריש בכלל");
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,red,"אין לך חיה בכלל");
if(GetPlayerMoney(playerid) < 500) return SendClientMessage(playerid, red, ".זימון החיה עולה כ500 דולר");
LACY_GiveMoney(playerid,-500);
new Float:x,Float:y,Float:z;
sam33[playerid] = CreateStreamObject(1608, 2294.422363, 530.393738, 1.226355, 0.0000, 0.0000, 0.0000,30);
AttachStreamObjectToPlayer(sam33[playerid],playerid,x+3,y+3,z+0.6,0,0,0);
ThePetsInYou[playerid] =1;
SharkYou[playerid] =1;
SendClientMessage(playerid, COLOR_WHITE,".--- מערכת החיות זימנה אלייך את הכריש בהצלחה ---");
SendClientMessage(playerid, COLOR_LIGHTBLUE, "!שיגרת אליך את החיה בהצלחה");
SendClientMessage(playerid, COLOR_LIGHTBLUE, "/backShark - להחזרת החיה למקום בצע תפקודה");
SendClientMessage(playerid, COLOR_LIGHTBLUE, "/ashark [id] - לתקיפה עם החיה שלך");
SendClientMessage(playerid, COLOR_WHITE,".---------");

return 1;
}

if(strcmp(cmd, "/ashark", true) == 0)
{
new sid[256], id;
sid = strtok(cmdtext,idx);
id = ReturnID(sid);
if(SharkYou[playerid] ==0) return SendClientMessage(playerid, red,".החיה לא נמצאת אצלך");
if(PetInWar[playerid] ==1) return SendClientMessage(playerid,red,"החיה שלך בתקיפה אנא המתן מספר שניות כדאי לתקוף שנית");
if(ThePetsInYou[playerid] ==0) return SendClientMessage(playerid,red,".החיה לא אצלך");
if(PlayerInfo[playerid][Shark] ==0) return SendClientMessage(playerid,red,"אין לך כריש בכלל");
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,red,"אין לך חיה בכלל");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid,red,".המספר איידי שהזנת שגוי");
if(GetPlayerMoney(playerid) < 700) return SendClientMessage(playerid,RED,".תקיפה עם החיה שלך עולה כ700 דולר");
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
sam33[playerid] = CreateStreamObject(1608, 2294.422363, 530.393738, 1.226355, 0.0000, 0.0000, 0.0000,30);
AttachStreamObjectToPlayer(sam33[playerid],playerid,x+3,y+3,z+0.6,0,0,0);
PetInWar[playerid]=1;
new Float:health;
GetPlayerHealth(id, health);
SetPlayerHealth(id, health-70);
new Float:health2=health-70;
format(string, sizeof(string), ".תוקף אותך תברח לפני שיהרוג אותך ,%s השחקן",GetName(playerid)),SendClientMessage(id, COLOR_WHITE, string);
GetPlayerHealth(id,health);
if(health2 < 1)
{
PlayerInfo[playerid][SharkKills] += 1;
format(string, sizeof(string), ".תקף אותך עם החיה שלו והרג אותך ,%s השחקן",GetName(playerid)),SendClientMessage(id, COLOR_WHITE, string);
}
}
else
{
SendClientMessage(playerid, red, "השחקן נמצא ברדיוס רחוק מידי");
}
return 1;
}

if(strcmp(cmd, "/backShark", true) == 0)
{
if(PlayerInfo[playerid][Shark] ==0) return SendClientMessage(playerid,red,"אין לך כריש בכלל");
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,red,"אין לך חיה בכלל");
if(ThePetsInYou[playerid] ==0) return SendClientMessage(playerid,red,".החיה לא אצלך");
SendClientMessage(playerid, COLOR_WHITE, "!החזרת את החיה שלך בהצלחה למקום");
DestroyStreamObject(sam33[playerid]);

ThePetsInYou[playerid] =0;
SharkYou[playerid] =0;
return 1;
}



//--
/*
if(strcmp(cmdtext, "/LoD" ,true)==0)
{
if(PP[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, ".אתה במלחמה ואינך יכול להשתגר ");
new file2[] = "RoX.ini";
//new pName[24];
GetPlayerName(playerid, pName, 24);
if(fsearch(file2, pName, false)==0)
{
SendClientMessage(playerid,COLOR_RED,"[LoD] אתה לא נמצא בקלאן");
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
if (!strlen(tmpp))return SendClientMessage(playerid, COLOR_GREEN, "USAGE: /iRox [id]");
pid = strval(tmpp);
if(!(IsPlayerConnected(pid)))return SendClientMessage(playerid, red, ".האיידי שהזנת הינו שגוי לחלוטין");

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
SendClientMessage(playerid,red,string);
new NAMEINVITED[MAX_PLAYER_NAME];
GetPlayerName(playerid, NAMEINVITED, sizeof(NAMEINVITED));
format(string,256,".[%s] שם הקלאן %s צורפת לקלאן ע``יי",NAMEINVITED,dini_Get(GetPlayerFile(playerid),"Clan")),SendClientMessage(pid,red,string);


return 1;
}
*/
if(strcmp(cmd, "/buydolphin", true) == 0)
{
if(PlayerInfo[playerid][Level] >=4) {
if(IsPlayerInAnyVehicle(playerid) ) return SendClientMessage(playerid,RED,".אנא צא מהרכב לביצוע פקודה זאת");
if(PlayerInfo[playerid][Dolp] ==1) return SendClientMessage(playerid,red,"/selldolphin יש לך כבר דולפין אחד למכירת הדולפין");
if(GetPlayerMoney(playerid) < 30000) return SendClientMessage(playerid, COLOR_YELLOW,"על מנת לקנות דולפין אתה צריך לפחות 30000 דולר");
LACY_GiveMoney(playerid,-30000);
SendClientMessage(playerid,COLOR_WHITE,"./calldolphin :לקרוא לדולפין שלך /help pets - קנית דולפין בהצלחה , לפקודות דולפין");
PlayerInfo[playerid][Pets] =1;
PlayerInfo[playerid][Dolp] =1;
}
else
{
SendClientMessage(playerid,COLOR_WHITE,".קניית דולפין מרמה 4 ומעלה");
}
return 1;
}

if(strcmp(cmd, "/selldolphin", true) == 0)
{
if(PlayerInfo[playerid][Dolp] ==1) return SendClientMessage(playerid,COLOR_YELLOW,".אין לך חיה בכלל");
LACY_GiveMoney(playerid,30000);
DestroyStreamObject(sam22[playerid]);
SendClientMessage(playerid, COLOR_WHITE, ".מכרת את החיה שלך בהצלחה");
PlayerInfo[playerid][Pets] =0;
PlayerInfo[playerid][Dolp] =0;
ThePetsInYou[playerid] =0;
DolpYou[playerid] =0;
return 1;
}


if(strcmp(cmd, "/calldolphin", true) == 0)
{
if(IsPlayerInAnyVehicle(playerid) ) return SendClientMessage(playerid,RED,".אנא צא מהרכב לביצוע פקודה זאת");
if(ThePetsInYou[playerid] ==1) return SendClientMessage(playerid,red,"יש לך כבר חיה אצלך אתה לא יכול לזמן אלייך יותר מחיה 1");
if(PlayerInfo[playerid][Dolp] ==0) return SendClientMessage(playerid,red,"אין לך דולפין בכלל");
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,red,"אין לך חיה בכלל");
if(GetPlayerMoney(playerid) < 500) return SendClientMessage(playerid, red, ".זימון החיה עולה כ500 דולר");
LACY_GiveMoney(playerid,-500);
new Float:x,Float:y,Float:z;
sam22[playerid] = CreateStreamObject(1607, 2294.422363, 530.393738, 1.226355, 0.0000, 0.0000, 135.0000,30);
AttachStreamObjectToPlayer(sam22[playerid],playerid,x+3,y+3,z+0.8,0,0,0);
ThePetsInYou[playerid] =1;
DolpYou[playerid] =1;
SendClientMessage(playerid, COLOR_WHITE,".--- מערכת החיות זימנה אלייך את הדולפין שלך בהצלחה ---");
SendClientMessage(playerid, COLOR_LIGHTBLUE, "!שיגרת אליך את החיה בהצלחה");
SendClientMessage(playerid, COLOR_LIGHTBLUE, "/backdolphin - להחזרת החיה למקום בצע תפקודה");
SendClientMessage(playerid, COLOR_LIGHTBLUE, "/adolp [id] - לתקיפה עם החיה שלך");
SendClientMessage(playerid, COLOR_WHITE,".-----------");

return 1;
}

if(strcmp(cmd, "/adolp", true) == 0)
{
new sid[256], id;
sid = strtok(cmdtext,idx);
id = ReturnID(sid);
if(DolpYou[playerid] ==0) return SendClientMessage(playerid, red,".הדולפין לא אצלך בכלל");
if(PetInWar[playerid] ==1) return SendClientMessage(playerid,red,"החיה שלך בתקיפה אנא המתן מספר שניות כדאי לתקוף שנית");
if(ThePetsInYou[playerid] ==0) return SendClientMessage(playerid,red,".החיה לא אצלך");
if(PlayerInfo[playerid][Dolp] ==0) return SendClientMessage(playerid,red,"אין לך דולפין בכלל");
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,red,"אין לך חיה בכלל");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid,red,".המספר איידי שהזנת שגוי");
if(GetPlayerInterior(id) == 1|| GetPlayerInterior(id) == 6 || GetPlayerInterior(id) == 10) return SendClientMessage(playerid,0xFF0000AA,".אתה לא יכול לתקוף שחקן שהוא נמצא בתוך אינטרור");
if(GetPlayerInterior(playerid) == 1 || GetPlayerInterior(playerid) == 6 || GetPlayerInterior(playerid) == 10) return SendClientMessage(playerid,0xFF0000AA,".אתה לא יכול לתקוף שחקן שהוא נמצא בתוך אינטרור");
if(GetPlayerMoney(playerid) < 700) return SendClientMessage(playerid,RED,".תקיפה עם החיה שלך עולה כ700 דולר");
LACY_GiveMoney(playerid,-700);
new Float:pos[3];
GetPlayerPos(id,pos[0],pos[1],pos[2]);
if(PlayerToPoint(9.0, playerid,pos[0],pos[1],pos[2]))
{
GetPlayerPos(id,pos[0],pos[1],pos[2]);
MoveStreamObject(sam22[playerid],Pos[playerid][0],Pos[playerid][1],Pos[playerid][2],6);
DestroyStreamObject(sam22[playerid]);
new Float:x,Float:y,Float:z;
sam22[playerid] = CreateStreamObject(1607, 2294.422363, 530.393738, 1.226355, 0.0000, 0.0000, 0.0000,30);
AttachStreamObjectToPlayer(sam22[playerid],playerid,x+3,y+3,z+0.6,0,0,0);
PetInWar[playerid]=1;
new Float:health;
GetPlayerHealth(id, health);
SetPlayerHealth(id, health-36);
new Float:health2=health-36;

format(string, sizeof(string), ".תוקף אותך תברח לפני שיהרוג אותך ,%s השחקן",GetName(playerid)),SendClientMessage(id, COLOR_WHITE, string);
GetPlayerHealth(id,health);

if(health2 < 1)
{

PlayerInfo[playerid][DolphinKills] += 1;
format(string, sizeof(string), ".תקף אותך עם החיה שלו והרג אותך ,%s השחקן",GetName(playerid)),SendClientMessage(id, COLOR_WHITE, string);
}
}
else
{
SendClientMessage(playerid, red, "השחקן נמצא ברדיוס רחוק מידי");
}
return 1;
}

if(strcmp(cmd, "/backdolphin", true) == 0)
{
if(PlayerInfo[playerid][Dolp] ==0) return SendClientMessage(playerid,red,"אין לך דולפין בכלל");
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,red,"אין לך חיה בכלל");
if(ThePetsInYou[playerid] ==0) return SendClientMessage(playerid,red,".החיה לא אצלך");
SendClientMessage(playerid, COLOR_WHITE, "!החזרת את החיה שלך בהצלחה למקום");
DestroyStreamObject(sam22[playerid]);
ThePetsInYou[playerid] =0;
DolpYou[playerid] =0;
return 1;
}
//--------- /properties
	if(strcmp(cmd, "/properties", true) == 0) {
		SendClientMessage(playerid, 0x0C4E0FF, "---[!---Property`s---!]---");
		for(new i = 0; i < MAX_PROPERTIES; i++) {
			if(propertyOwner[i] < 999) {
				GetPlayerName(propertyOwner[i], giveplayer, sizeof(giveplayer));
				format(string, sizeof(string), "%d. %s - %s", i, propertyNames[i], giveplayer);
		SendClientMessage(playerid, 0x0C4E0FF, "---[!---Property`s---!]---");
			} else
				format(string, sizeof(string), "%d. %s לא שייך לאף אחד", i, propertyNames[i]);
		SendClientMessage(playerid, 0x0C4E0FF, "---[!---Property`s---!]---");
			SendClientMessage(playerid, 0x0C4E0FF, string);
		}

		return 1;
	}
new Float:healthteleportion;
GetPlayerHealth(playerid,healthteleportion);
new CreateHealth[MAX_PLAYERS];

if(PlayerInfo[playerid][Level] == 1 && healthteleportion < 70.0) return CreateHealth[playerid]=65,SendClientMessage(playerid,red,".שים לב, אתה חייב כ-65 אחוז חיים, כדאי להשתגר");
if(PlayerInfo[playerid][Level] == 2 && healthteleportion < 65.0) return CreateHealth[playerid]=65,format(string, sizeof(string), ".אחוזי חיים על מנת להשתגר %d שים לב, אתה לפחות כ",CreateHealth[playerid]),SendClientMessage(playerid, red, string);
if(PlayerInfo[playerid][Level] == 3 && healthteleportion < 60.0) return CreateHealth[playerid]=60,format(string, sizeof(string), ".אחוזי חיים על מנת להשתגר %d שים לב, אתה לפחות כ",CreateHealth[playerid]),SendClientMessage(playerid, red, string);
if(PlayerInfo[playerid][Level] == 4 && healthteleportion < 55.0) return CreateHealth[playerid]=55,format(string, sizeof(string), ".אחוזי חיים על מנת להשתגר %d שים לב, אתה לפחות כ",CreateHealth[playerid]),SendClientMessage(playerid, red, string);
if(PlayerInfo[playerid][Level] == 5 && healthteleportion < 50.0) return CreateHealth[playerid]=50,format(string, sizeof(string), ".אחוזי חיים על מנת להשתגר %d שים לב, אתה לפחות כ",CreateHealth[playerid]),SendClientMessage(playerid, red, string);
if(PlayerInfo[playerid][Level] == 6 && healthteleportion < 45.0) return CreateHealth[playerid]=45,format(string, sizeof(string), ".אחוזי חיים על מנת להשתגר %d שים לב, אתה לפחות כ",CreateHealth[playerid]),SendClientMessage(playerid, red, string);
if(PlayerInfo[playerid][Level] == 7 && healthteleportion < 40.0) return CreateHealth[playerid]=40,format(string, sizeof(string), ".אחוזי חיים על מנת להשתגר %d שים לב, אתה לפחות כ",CreateHealth[playerid]),SendClientMessage(playerid, red, string);
if(PlayerInfo[playerid][Level] == 8 && healthteleportion < 35.0) return CreateHealth[playerid]=35,format(string, sizeof(string), ".אחוזי חיים על מנת להשתגר %d שים לב, אתה לפחות כ",CreateHealth[playerid]),SendClientMessage(playerid, red, string);
if(PlayerInfo[playerid][Level] == 9 && healthteleportion < 30.0) return CreateHealth[playerid]=30,format(string, sizeof(string), ".אחוזי חיים על מנת להשתגר %d שים לב, אתה לפחות כ",CreateHealth[playerid]),SendClientMessage(playerid, red, string);
if(PlayerInfo[playerid][Level] == 10 && healthteleportion < 25.0)return CreateHealth[playerid]=25,format(string, sizeof(string), ".אחוזי חיים על מנת להשתגר %d שים לב, אתה לפחות כ",CreateHealth[playerid]),SendClientMessage(playerid, red, string);
if(PlayerInfo[playerid][Level] == 11 && healthteleportion < 20.0)return CreateHealth[playerid]=20,format(string, sizeof(string), ".אחוזי חיים על מנת להשתגר %d שים לב, אתה לפחות כ",CreateHealth[playerid]),SendClientMessage(playerid, red, string);
if(PlayerInfo[playerid][Level] == 12 && healthteleportion < 15.0)return CreateHealth[playerid]=15,format(string, sizeof(string), ".אחוזי חיים על מנת להשתגר %d שים לב, אתה לפחות כ",CreateHealth[playerid]),SendClientMessage(playerid, red, string);
if(PlayerInfo[playerid][Level] == 13 && healthteleportion < 10.0)return CreateHealth[playerid]=10,format(string, sizeof(string), ".אחוזי חיים על מנת להשתגר %d שים לב, אתה לפחות כ",CreateHealth[playerid]),SendClientMessage(playerid, red, string);
if(PlayerInfo[playerid][Level] == 14 && healthteleportion < 5.0) return CreateHealth[playerid]=5,format(string, sizeof(string), ".אחוזי חיים על מנת להשתגר %d שים לב, אתה לפחות כ",CreateHealth[playerid]),SendClientMessage(playerid, red, string);


   if (strcmp(cmdtext, "/sandkings", true)==0)
{


 if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
  new vehicleid = GetPlayerVehicleID(playerid);
  SetVehiclePos(vehicleid,816.954528,856.656005,12.789062);
  SetVehicleZAngle(vehicleid,360.420);
SetPlayerInterior(playerid,0);
 } else {
  SetPlayerPos(playerid,816.954528,856.656005,12.789062);
  SetPlayerFacingAngle(playerid,360.420);
 }
 SendClientMessage(playerid, 0xFFFF00AA, ".SandKingS ברוך הבא ל");
GameTextForPlayer(playerid,"SandKings",5000,1);
SetPlayerInterior(playerid,0);
 return 1;
}

if(strcmp(cmdtext, "/shipMoney", true) == 0)
{


if (PlayerInfo[playerid][Kills] >= 450)
{
new cartype = GetPlayerVehicleID(playerid);
new State=GetPlayerState(playerid);
{
if(State!=PLAYER_STATE_DRIVER)
{
SetPlayerPos(playerid,2001.6730,1544.4176,13.5859);
}
else if(IsPlayerInVehicle(playerid, cartype) == 1)
{
SetVehiclePos(cartype,2001.6730,1544.4176,13.5859);
SetVehicleZAngle(cartype,261.2631);
}
else
{
SetPlayerPos(playerid,2001.6730,1544.4176,13.5859);}
GameTextForPlayer(playerid,"~w~ShipMoney",2500,1);}
SendClientMessage(playerid,0xFFFF00AA, " !שוגרת לספינת הכסף");
SetPlayerInterior(playerid,0);

}
else
{
SendClientMessage(playerid,COLOR_WHITE,".פקודה זאתי זמינה מרמה 3 ומעלה");
}
return 1;
}

if(strcmp(cmdtext, "/BS", true)==0)
{




SetPlayerInterior(playerid,0);
if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
{
new vehicleid = GetPlayerVehicleID(playerid);
SetVehiclePos(vehicleid,1829.6167,-1856.7572,13.5781);
SetVehicleZAngle(vehicleid,272.5935);
}
else
{
SetPlayerPos(playerid,1829.6167,-1856.7572,13.5781);
SetPlayerFacingAngle(playerid,272.5935);
}
SendClientMessage(playerid, 0xFFFF00AA, ".ברוך הבא לאזור המכונית הממולקדות");
GameTextForPlayer(playerid,"~w~Bomb Shop",3000,1);
SetPlayerInterior(playerid,0);
	    return 1;
 }


if (strcmp(cmdtext, "/Infernus", true)==0)
{




if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
{
new vehicleid = GetPlayerVehicleID(playerid);
SetPlayerInterior(playerid, 0);
SetVehiclePos(vehicleid, -1143.9772,1095.8036,39.2060);
SetVehicleZAngle(vehicleid, 136.3417);
}
else
{
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid, -1143.9772,1095.8036,39.2060);
SetPlayerFacingAngle(playerid, 136.3417);
}
SendClientMessage(playerid,0xFFFF00AA, ".Infernusברוכים הבאים למירוציי ");
GameTextForPlayer(playerid,"~w~Infernus",5000,1);
//DisplayTextForPlayer(playerid,"~w~Welcome to the ~b~ Infernus", 5, 1, 3);
GameTextForPlayer(playerid,"~w~Infernus",3000,1);
return 1;
}
//race
if (strcmp(cmdtext, "/alp", true)==0)
{


//
if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
{
new vehicleid = GetPlayerVehicleID(playerid);
SetPlayerInterior(playerid, 0);
SetVehiclePos(vehicleid, -2318.7485, -1643.5728, 483.7031);
SetVehicleZAngle(vehicleid, 7.1038);
}
else
{
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid, -2318.7485, -1643.5728, 483.7031);
SetPlayerFacingAngle(playerid, 7.1038);}
SendClientMessage(playerid,0xFFFF00AA, ".ברוכים הבאים להר הגבוה ביותר");
GameTextForPlayer(playerid,"~w~alp",5000,1);
//DisplayTextForPlayer(playerid,"~w~Welcome to the ~b~ Alp", 5, 1, 3);

return 1;
}


if (strcmp(cmdtext, "/sf", true)==0){



//
if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
new vehicleid = GetPlayerVehicleID(playerid);

SetVehiclePos(vehicleid, -2126.7344,919.3736,79.9157);
SetVehicleZAngle(vehicleid, 95.2643);
SetPlayerInterior(playerid, 0);
} else {
SetPlayerPos(playerid, -2126.7344,919.3736,79.9157);
SetPlayerFacingAngle(playerid, 95.2643);
SetPlayerInterior(playerid, 0);}
SendClientMessage(playerid, 0xFFFF00AA, ".San Fireo - ברוכים הבאים ל");
//GameTextForPlayer(playerid,"~w~San Fireo",5000,1);
//DisplayTextForPlayer(playerid,"~w~Welcome to the ~b~ San Fireo", 5, 1, 3);
GameTextForPlayer(playerid,"~w~San Fireo",3000,5);

return 1;
}
if (strcmp(cmdtext, "/showlevel", true)==0)
{
tmp = strtok(cmdtext, idx);
tmp2 = strtok(cmdtext, idx);
new thelevel = strval(tmp);
if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /showlevel [level 1 - 21]");
if(IsPlayerConnected(playerid))
{
SendClientMessage(playerid, COLOR_WHITE, ".-- חיפוש רמה --");
for(new i = 0; i < MAX_PLAYERS; i++)
{
if(IsPlayerConnected(i))
{
if(PlayerInfo[i][Level] == thelevel)
{

format(string, 256, "[level %d] %s  [%d] ",thelevel, GetName(i), i);
SendClientMessage(playerid, COLOR_GREY, string);
}
}
}
}
return 1;
}
if (strcmp("/ap", cmd, true, 10) == 0 || strcmp("/airport", cmd, true, 10) == 0){
if (GetPlayerState(playerid) == 2){

SetPlayerInterior(playerid,0);
SetVehiclePos(GetPlayerVehicleID(playerid),-1349.8690,-235.0491,14.1484);
SetVehicleZAngle(GetPlayerVehicleID(playerid), 317.6359);
GameTextForPlayer(playerid,"~W~ air port",5000,1);
} else {
SetPlayerInterior(playerid,0);
SetPlayerPos(playerid,-1349.8690,-235.0491,14.1484);
SetPlayerFacingAngle(playerid,317.6359);}
GameTextForPlayer(playerid,"~W~ air port",5000,1);
SendClientMessage(playerid,0xFFFF00AA, ".ברוכים הבאים לשדה התעופה");
return 1;
}

if(strcmp(cmdtext, "/Arena", true)==0)
{



SetPlayerPos(playerid, 1597.7958, 609.3694, 7.7813);
SetPlayerFacingAngle(playerid, 189.1711);
SendClientMessage(playerid,0xFFFF00AA, ".ברוכים הבאים לאיזור הטסטים");
//DisplayTextForPlayer(playerid,"~w~Welcome to the ~b~Arena", 5, 1, 3);
SetPlayerInterior(playerid,0);
return 1;}


if(strcmp(cmdtext, "/tower", true) == 0){



new playerState = GetPlayerState(playerid);
if(playerState == PLAYER_STATE_DRIVER){
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
SendClientMessage(playerid,0xFFFF00AA, ".ברוכים הבאים למגדל");
SetVehiclePos(VehicleID,1544.3235,-1353.4695,329.4740);
SetPlayerInterior(playerid,0);
}else{
SetPlayerInterior(playerid,0);
SetPlayerPos(playerid,1544.3235,-1353.4695,329.4740);}
//DisplayTextForPlayer(playerid,"~w~Welcome to the ~b~Tower", 5, 1, 3);

return 1;}


if(strcmp(cmdtext, "/ammu", true)==0) return SetPlayerPos(playerid,285.8574,-79.9114,1001.5156),SetPlayerInterior(playerid,4),SendClientMessage(playerid, 0xFFFF00AA, ".ברוך הבא לחנות נשקים");




if (strcmp(cmdtext, "/lv", true)==0){
if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
{
new vehicleid = GetPlayerVehicleID(playerid);
SetVehiclePos(vehicleid, 2034.1750, 1343.4744, 10.8203);
SetVehicleZAngle(vehicleid, 268.4005);
SetPlayerInterior(playerid, 0);
} else {
SetPlayerPos(playerid, 2034.1750, 1343.4744, 10.8203);
SetPlayerFacingAngle(playerid, 268.4005);
SetPlayerInterior(playerid, 0);}
SendClientMessage(playerid, 0xAA3333AA, " !Lvברוכים הבאים ל");
//DisplayTextForPlayer(playerid,"~w~Welcome to the ~b~LV", 5, 1, 3);

 return 1;}



if (strcmp(cmdtext, "/jump", true)==0){
if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
{
new vehicleid = GetPlayerVehicleID(playerid);
SetVehiclePos(vehicleid, -728.2830, 2306.2021, 128.271);

SetPlayerInterior(playerid, 0);
} else {
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid, -728.2830, 2306.2021, 128.271);
SetPlayerInterior(playerid, 0);
GameTextForPlayer(playerid,"~W~jump",5000,1);

}

 return 1;}
 



if (strcmp(cmdtext, "/mp5", true)==0){

if (PlayerInfo[playerid][Kills] >= 450) {
//


mini[playerid] = 1;
ResetPlayerWeapons(playerid);
GivePlayerWeapon(playerid,29,9999);
SetPlayerPos(playerid,-1525.5276,324.7059,53.4609);
}
else
{
SendClientMessage(playerid,COLOR_WHITE,".הזה זמין מרמה 2 ומעלה,`DeatchMatch` איזור ה");
}
return 1;
}
if (strcmp(cmdtext, "/m4", true)==0){
if (PlayerInfo[playerid][Kills] >= 450) {



//
mini[playerid] = 1;
ResetPlayerWeapons(playerid);
GivePlayerWeapon(playerid,31,9999);
SetPlayerPos(playerid, 1597.7958, 609.3694, 7.7813);

SetPlayerFacingAngle(playerid, 189.1711);

}
else
{
SendClientMessage(playerid,COLOR_WHITE,".הזה זמין מרמה 3 ומעלה,`DeatchMatch` איזור ה");
}
return 1;
}

if(strcmp(cmd, "/help", true) == 0)
{
new Roy_Killer[256];
Roy_Killer= strtok(cmdtext, idx);
if(!strlen(Roy_Killer))
{

SendClientMessage(playerid,COLOR_WHITE,"/help  [1 all help ] || [2 Teleport] || [3 Commands] || [4 Pets] || [5 Bank/Cc] || [6 Weed]");
SendClientMessage(playerid,COLOR_WHITE,"/help [7 Monster] || [8 Kart] || [9 Mlgzhot] || [10 Tiger] || [11 War] ");
SendClientMessage(playerid,COLOR_WHITE,"/help [12 Minigun] || [13 Bazooka/Rpg] || [14 Sail] || [15 Wang Cars] || [16 Proprties]");
SendClientMessage(playerid,COLOR_WHITE,"/help [17 Car system] || [18 Profile] || [19 Gangs] || [20 ViP] || [21 Supportives]");
SendClientMessage(playerid,COLOR_WHITE,"/help [22 Call] || [23 System] || [24 LACY] || [25 Rules] || [26 Credits] ||[27 Ship] ||[28 Mode War(players)]");
SendClientMessage(playerid,COLOR_WHITE,"/help [29 Setting] || [30 ignore sys] || [31 weapon sys] || [32 race sys] || [33 drift sys] || [34  triatlon]");
SendClientMessage(playerid,COLOR_WHITE,"/help [35 player Stats] || [36 Organization] || [37 Kopat Gemel]");


return 1;
}
if(strcmp(Roy_Killer,"1",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".• • • • • • [/help 1 - 37] • • • • • • ");
SendClientMessage(playerid, 0x33CCFFAA,"/teleports [1/2/3/4/5/all] - :כדאי לראות שיגורים בשרת");
SendClientMessage(playerid, 0x33CCFFAA,"/commands [1/2/3/all] - :לפקודות");
SendClientMessage(playerid, 0x33CCFFAA,"/help server - :על מנת לראות תומכים מחוברים");
SendClientMessage(playerid,0x33CCFFAA,"/teleports [1/2/3/4/5/all] /commands [1/2/3/all] || /help bank || /help credits || /help rules || /help anime || /help car ");
SendClientMessage(playerid,0x33CCFFAA,"/help clan || /help pets || /help cc || /help server || /help system || /help call ");
SendClientMessage(playerid,0x33CCFFAA,"/help weap || /help gang || /help deatchmatch || /help weed || /help profile || /helpme");
SendClientMessage(playerid, COLOR_WHITE,".• • • • • • [/help 1 - 37] • • • • • • ");

}


else if(strcmp(Roy_Killer,"clan",true) == 0)
{
SendClientMessage(playerid,WHITE,"בקרוב!!");
}
else if(strcmp(Roy_Killer,"pets",true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,"-- .מערכת קניית חיות --");
SendClientMessage(playerid,COLOR_GREY,"/selltor :למכירת הצב - /buytor (3) :לקניית צב");
SendClientMessage(playerid,COLOR_GREY,"/backtor :להחזרת הצב למקום /calltor (3) :לזימון הצב אלייך");
SendClientMessage(playerid,COLOR_GREY,"/sellshark - למכירת הכריש /buyshark (5) :לקניית כריש");
SendClientMessage(playerid,COLOR_GREY,"/backshark להחזרת הכריש למקום /callshark (5) :לזימון הכריש אליך");
SendClientMessage(playerid,COLOR_GREY,"/selldolphin - למכירת הדולפין /buydolphin (3) :לקנייה דולפין");
SendClientMessage(playerid,COLOR_GREY,"/backdolphin להחזרת הדולפין למקום /calldolphin (4) :לזימון הדולפין אלייך");
SendClientMessage(playerid,COLOR_GREY,"/ashark [id] לתקוף עם הכריש שלך - /ator [id] לתקוף עם הצב שלך ");
SendClientMessage(playerid,COLOR_GREY,"/adolp [id] :לתקיפה שחקן עם הדולפין שלך");
SendClientMessage(playerid,COLOR_GREY,"/ppet [id] לראות חיות מחמד של מישהו אחר /mypet :לראות את החיות שלך");
}
else if(strcmp(Roy_Killer,"cc",true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,".--- Cc help - עזרה כרטיס האשראי ---");
SendClientMessage(playerid,COLOR_ORANGE,".קניית כרטיש אשראי עולה כ700000| כשתמכור תכרטיס אשראי תקבל חזרה כ350000");
SendClientMessage(playerid,COLOR_GREEN,":פקודות כרטיס אשראי");
SendClientMessage(playerid,COLOR_GREY,"/buycc (3) :לקניית כרטיס אשראי");
SendClientMessage(playerid,COLOR_GREY,"/sellcc (3) :למכירת כרטיס האשראי");
SendClientMessage(playerid,COLOR_GREY,"/withdrawc (3) [Money] :למשיכת כסף מהכרטיס אשראי");
SendClientMessage(playerid,COLOR_GREEN,".כל משיכה מכרטיס האשראי תעלה לכם 1000 דולר");
SendClientMessage(playerid,COLOR_ORANGE,"/help 5 :לעזרה נוספת");

}

else if(strcmp(Roy_Killer,"server",true) == 0)
{
if(IsPlayerConnected(playerid))
{
SendClientMessage(playerid, COLOR_WHITE, ".-- .בקשה עזרה מהתומכים - `/help server` רשימת תומכים מחוברים --");
for(new i = 0; i < MAX_PLAYERS; i++)
{
if(IsPlayerConnected(i))
{
if(PlayerInfo[i][Supportives] >=1)
{

format(string, 256, " %s  [%d] ", GetName(i), i);
SendClientMessage(playerid, COLOR_GREY, string);
}
}
}
}
}
else if(strcmp(Roy_Killer,"system",true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,".-- מערכת השרת --");
SendClientMessage(playerid,COLOR_GREY,"/Register - ליצור משתמש חדש");
SendClientMessage(playerid,COLOR_GREY,"/login - לבצע התחברות לחשבון");
SendClientMessage(playerid,COLOR_GREY,"/SetPass - לבצע שינוי סיסמא");
SendClientMessage(playerid,COLOR_GREY,"/ChangeNick - כדאי לשנות כידנוי");
SendClientMessage(playerid,COLOR_GREY,"/Setting :מגוון שינויים במערכת המשחק");
}


else if(strcmp(Roy_Killer,"call",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE, "--- .מערכת פלאפונים ---");
SendClientMessage(playerid, COLOR_GREY, "/call [Playerid] כדאי להתקשר לשחקן");
SendClientMessage(playerid, COLOR_GREY, "/hangup כדאי לנתק את השיחה");
SendClientMessage(playerid, COLOR_GREY, "/answer כדאי להרים את הטפלפון");
}
else if(strcmp(Roy_Killer,"weed",true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,"-- .מערכת הסמים --");
SendClientMessage(playerid, COLOR_GREY,"/useweed :לשימוש בסמים");
SendClientMessage(playerid, COLOR_GREY,"/sellweed [playerid] :למכור סמים");
SendClientMessage(playerid, COLOR_GREY,"/buyweed :לקנות סמים");
SendClientMessage(playerid, COLOR_GREY,"/details :לראות כמה סמים יש לכם");
SendClientMessage(playerid, COLOR_GREY,"/declinedeal :לבטל את העסקה");
}
else if(strcmp(Roy_Killer,"Profile",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,"/setp [function] :צורת שימוש");
SendClientMessage(playerid, COLOR_WHITE,"/setp open :לפתיחת פרופיל");
SendClientMessage(playerid, COLOR_WHITE,"/setp icq [Number icq] לערוך את המספר אייסקיו");
SendClientMessage(playerid, COLOR_WHITE,"/setp msn [your msn] המסנג'ר שלך");
SendClientMessage(playerid, COLOR_WHITE,"/setp email [Email] לערוך את האימייל שלך");
SendClientMessage(playerid, COLOR_WHITE,"/setp agg [You agg] לערוך את הגיל שלך");
SendClientMessage(playerid, COLOR_WHITE,"/setp sex [כדאי לערוך את המין שלך [זכר/נקבה ");
SendClientMessage(playerid, COLOR_WHITE,"/setp m [המילה English Only] מילה שאתה מתחבר אליה אנגלית בלבד");
SendClientMessage(playerid, COLOR_WHITE,"/pProfile [id] לראות פרופיל של שחקן אחר - /Profile לראות את הפרופיל שלך");
}

//---


else if(strcmp(Roy_Killer,"bank",true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,"-- .מערכת הבנק --");
SendClientMessage(playerid, COLOR_GREY, "/deposit [amount] - להפקיד כסף בבנק ");
SendClientMessage(playerid, COLOR_GREY, "/depositall  להפקיד את כל הכסף");
SendClientMessage(playerid, COLOR_GREY, "/withdraw [amount] - למשוך כסף מהבנק");
SendClientMessage(playerid, COLOR_GREY, "/balance - לבדוק כמה כסף יש לך בבנק");
SendClientMessage(playerid, COLOR_GREY, "/bankid [playerid] [amount] - להעביר כסף מחשבונך לחשבון שחקן אחר");
SendClientMessage(playerid, COLOR_GREY, "/getloan (4) [amount] - לקחת הלוואה מהבנק");
SendClientMessage(playerid, COLOR_GREY, "/backloan להחזרת הלוואה");

}

else if(strcmp(Roy_Killer,"credits",true) == 0)
{
new str[256];
SendClientMessage(playerid, COLOR_WHITE, ".--  help Credits (25) לוח קרדיטים --");
SendClientMessage(playerid, COLOR_ORANGE, ".על בניית העזרה Roy`s Omerתודה ל");
SendClientMessage(playerid, COLOR_ORANGE, ".על התרומה של בסיס העזרה Barak STתודה ל");
format(str, sizeof(str),".על כך שנתת לאנשים תכבוד הראוי להם ,%s ותודה מיוחד לך ",GetName(playerid));
SendClientMessage(playerid, COLOR_GREY, str);
}


else if(strcmp(Roy_Killer,"rules",true) == 0)
{
SendClientMessage(playerid, COLOR_LIGHTBLUE,".-- .Satla-Zone.co.il חוקי השרת --");
SendClientMessage(playerid, COLOR_GREY," 1. .אנא דבר בכבוד לאדמינים ולחברי השרת");
SendClientMessage(playerid, COLOR_GREY, "2. .אין להציף תצ'אט בהודעות סתמיות");
SendClientMessage(playerid, COLOR_GREY, "3. .צי'טים יגררו לבאן ישירות");
SendClientMessage(playerid, COLOR_GREY, "4. .אין להרוג בשדה התעופה / רייס עם מסוק / הידרה");
SendClientMessage(playerid, COLOR_GREY, "5. .אין לפרסם כתובת מגורים / מספרי פלאפון");
SendClientMessage(playerid, COLOR_GREY, "6. .אין לעשות הרג חברי על מנת ליצר לכם סטאטס גבוה יותר");
SendClientMessage(playerid, COLOR_GREY, "7. .אין להרוג אדמין לבן - אדמין בתפקיד");
SendClientMessage(playerid, COLOR_GREY, "8. /report - .אנא אל תדווחו בשרת על צי'טירים בצ'אט אנא דווחו בפקודה");

}

else if(strcmp(Roy_Killer,"anime",true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,"-- .אנימציות השרת --");
SendClientMessage(playerid, COLOR_GREY,"/Sit /Up /Smoke /Piss /Crack /Kiss");
SendClientMessage(playerid, COLOR_GREY,"/Deal /Death /Slapass /Wave /Eat");
SendClientMessage(playerid, COLOR_GREY,"/Vomit /Yc /Ay /CopLock /FsmoKing");
SendClientMessage(playerid, COLOR_GREY,"/Slapped /Injured /WankOut/Arrested");
SendClientMessage(playerid, COLOR_GREY,"/Strip /Chat /Dance [Style 1-3]");
}
else if(strcmp(Roy_Killer,"car",true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,"-- .מערכת המכוניות --");
SendClientMessage(playerid, COLOR_GREY,"/Buycar ליקנות רכב");
SendClientMessage(playerid, COLOR_GREY,"/callcar כדי לזמן את הרכב שלך");
SendClientMessage(playerid, COLOR_GREY,"/lock לינעול את הרכב שלך");
SendClientMessage(playerid, COLOR_GREY,"/calock :לבטל את הנעילה");
SendClientMessage(playerid, COLOR_GREY,"/sellcar לימכור את רכב שלך");
SendClientMessage(playerid, COLOR_GREY,"/eject להוציא מישהו מהרכב שלך");
SendClientMessage(playerid, COLOR_GREY,"/repair לישלוח את הרכב שלך למוסך");
}

else if(strcmp(Roy_Killer,"weap",true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,"-- .מערכת נשקים עזרה --");
SendClientMessage(playerid,COLOR_ORANGE,"שלום לך, עזרה זה מחזיק מערכת נשקים תמדיים");
SendClientMessage(playerid,COLOR_ORANGE,"ברגע שתקנה נשק הוא ישמר גם אחרי שתצא");
SendClientMessage(playerid,COLOR_GREEN,":פקודות נשקים");
SendClientMessage(playerid,COLOR_GREY,"/buyweapon (/bw) [id weapon] - לקניית נשק");
SendClientMessage(playerid,COLOR_GREY,"/weaponlist (/wl) - כדאי לראות את רשימת הנשקים");
SendClientMessage(playerid,COLOR_GREY,"/armourt (armour) :לקניית מגן תמידי");
}
else if(strcmp(Roy_Killer,"gang",true) == 0)
{

SendClientMessage(playerid, COLOR_WHITE,"/gang create [name] - בכדי ליצור גנג רשום ");
SendClientMessage(playerid, COLOR_WHITE,"/gang invite [playeid] - בכדי לשלוח הזמנה לשחקן רשום ");
SendClientMessage(playerid, COLOR_WHITE,"/gang join - בכדי להצטרך לגנג רשום ");
SendClientMessage(playerid, COLOR_WHITE,"/gang quit - בכדי לצאת מהגנג שאתה נמצא בוא רשום ");
SendClientMessage(playerid, COLOR_WHITE,"/ganginfo - למידע על הגנגים שבשרת רשום ");
SendClientMessage(playerid, COLOR_WHITE,"/gangs - רשימת הגנגים שבשרת ");
SendClientMessage(playerid, COLOR_WHITE,".`!`אנא דברו בצ'אט על ידי הסימן");
}

else if(strcmp(Roy_Killer,"deatchmatch",true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,"-- .מערכת אימוני הריגות --");
SendClientMessage(playerid, COLOR_ORANGE,"מערכת אימוני השרת שבא ניתן להגיע למקום ספון יותר מהר");
SendClientMessage(playerid, COLOR_GREEN,":פקודות מערכת אימונים");
SendClientMessage(playerid, COLOR_GREY,"/thewar /mp5 (2) /bigwar /m4 (3) /deagle /dm /bazooka (10) ");

}
else if(strcmp(Roy_Killer,"2",true) == 0)
{

SendClientMessage(playerid, COLOR_WHITE,".-- `help` Teleport (2) - עזרה שיגורים --");
SendClientMessage(playerid, COLOR_ORANGE,".עזרה שיגורים שבוא ניתן לזוז ממקום למקום בעזרת פקודה ולהגיע למקומות הריגה במהירות רבה יותר");
SendClientMessage(playerid, COLOR_GREEN,":פקודות שיגורים");
SendClientMessage(playerid, COLOR_GREY,"/pier /sf /lv /ls /ap /race /ramp");
SendClientMessage(playerid, COLOR_GREY,"/dj /sandkings /jump /army /carpark /cycletrip");
SendClientMessage(playerid, COLOR_GREY,"/spawn (5) /arena /skydive /drift  /grage");
SendClientMessage(playerid, COLOR_GREY,"/infernus /busstrip /bikestrip /fight /alp /snipe");
SendClientMessage(playerid, COLOR_GREY,"/pepe /derby /kickstart /lc (1) /bank /parkour (4) /ammu");
SendClientMessage(playerid, COLOR_GREY,"/bigwar /thewar /mp5 (2) /m4 (3) /deagle /dm /bazooka (10)");
SendClientMessage(playerid, COLOR_GREY,"/teleports [1/2/3/4/5/all] /ship /shipmoney (3) /ships /bazooka (10)");
}
else if(strcmp(Roy_Killer,"3",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".-- `help` Commands (3) - עזרה פקודות --");
SendClientMessage(playerid, COLOR_ORANGE,".בעזרה הזה מותקנת מגוון פקודות בוא נראה את חלק הקטן מהפקודות");
SendClientMessage(playerid, COLOR_GREEN,":פקודות");
SendClientMessage(playerid, COLOR_GREY,"/maxplayers /showid /bigbang [id] (4) /nextlevel");
SendClientMessage(playerid, COLOR_GREY,"/sp (2) /lp /profile /pprofile [id] /stats /pstats [id]");
SendClientMessage(playerid, COLOR_GREY,"/details /pdetails [id] /mypet /ppet [id] /pay [id] [money]");
SendClientMessage(playerid, COLOR_GREY,"/kill /boome /td /setnick /setpass /saveskin /delskin");
SendClientMessage(playerid, COLOR_GREY,"/ignore [id] /unignore /id(/s) [id/name] /showlevel");
SendClientMessage(playerid, COLOR_GREY,"/commands [1/2/3/all] /vinfo /afk /unafk");
}
else if(strcmp(Roy_Killer,"4",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".-- `help` Pets (Tor/Shark/Dolphin) (4)  עזרה חיות --");
SendClientMessage(playerid, COLOR_ORANGE,".בעזרה זה מותקנת מערכת חיות איתה בא ניתן לקנות חיות");
SendClientMessage(playerid, COLOR_ORANGE,".לתקוף אנשים בעזרת החיות");
SendClientMessage(playerid, COLOR_ORANGE,".בנוסף לכל יש גם סטאטס לחיות שיראה לכם כמה הריגות יש לחיה שלכם");
SendClientMessage(playerid, COLOR_GREEN,":פקודות חיות");
SendClientMessage(playerid,COLOR_GREY,"/selltor /buytor (3) backtor /calltor (3) /ator [id]");
SendClientMessage(playerid,COLOR_GREY,"/sellshark  /buyshark (5) /backshark  /callshark (5) /ashark [id]");
SendClientMessage(playerid,COLOR_GREY,"/selldolphin /buydolphin (3) /backdolphin /calldolphin (4) /adolp [id]");
SendClientMessage(playerid,COLOR_GREY,"/help pets - /ppet [id] /mypet");

}
else if(strcmp(Roy_Killer,"5",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".-- Bank `help` (5) - עזרה --");
SendClientMessage(playerid, COLOR_ORANGE,".בבנק תוכל לשמור כסף , גם אחרי שתמות הכסף ישמר");
SendClientMessage(playerid, COLOR_ORANGE,".יש גם כרטיס אשראי שבוא תוכל להשתמש מחוץ לבנק למשיכת כספים");
SendClientMessage(playerid, COLOR_ORANGE,"קניית כרטיס אשראי עולה כ700000 | מכירת כרטיס אשראי תחזיר כ350000");
SendClientMessage(playerid, COLOR_GREEN,":פקודות בנק");
SendClientMessage(playerid, COLOR_GREY,"/deposit [amount] /depositall /withdraw [amount]");
SendClientMessage(playerid, COLOR_GREY,"/balance /bankid [playerid] [amount]");
SendClientMessage(playerid, COLOR_GREY, "/getloan (4) [amount] /backloan (4)");
SendClientMessage(playerid, COLOR_GREEN,":פקודות כרטיס אשראי");
SendClientMessage(playerid, COLOR_GREY,"/help cc /buycc (3) /sellcc (3) /withdrawc (3) [amount]");

}
else if(strcmp(Roy_Killer,"6",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Weed `help` (6) - עזרה סמים --");
SendClientMessage(playerid, COLOR_ORANGE,"בעזרה זה מותקנת מערכת סמים חממה שבא ניתן");
SendClientMessage(playerid, COLOR_ORANGE,".למכור סמים , לחפש סמים , לקנות סמים , להשתמש בסמים");
SendClientMessage(playerid, COLOR_GREEN,":פקודות סמים");
SendClientMessage(playerid, COLOR_GREY,"/useweed /sellweed /buyweed /details /declinedeal /help weed");

}
else if(strcmp(Roy_Killer,"7",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Monster `help` (7) - עזרה מכוניות מתנגשות --");
SendClientMessage(playerid, COLOR_ORANGE,".בעזרה זה מותקנת מערכת מכוניות מתנגשות");
SendClientMessage(playerid, COLOR_ORANGE,".מטרת המערכת היא להישאר אחרון על הגג ולהרוויח כסף");
SendClientMessage(playerid, COLOR_ORANGE,".בנוסף לקח אתם צריכים להתנגש אחד בשני שזה יעלה את חווית המשחק");
SendClientMessage(playerid, COLOR_GREEN,":פקודות מונסטר");
SendClientMessage(playerid, COLOR_GREY,"/Monster , /smonster (admin only , /endmonster (admin only)");
SendClientMessage(playerid, COLOR_GREY,".מספר הנצחנות של השחקן המנצח יופיע בסטאטס");

}

else if(strcmp(Roy_Killer,"8",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Kart `help` - (8) עזרה מלחמת קארט גאטרים --");
SendClientMessage(playerid, COLOR_ORANGE,"מערכת קארט גאטר. מטרה המשחק לדחוף אחד את השני מהגג");
SendClientMessage(playerid, COLOR_ORANGE,".שחקן שנופל פסול");
SendClientMessage(playerid, COLOR_GREEN,":פקודות קארטינג");
SendClientMessage(playerid, COLOR_GREY,"/joinkart /startkart (פקודות אדמין) /endkart (פקודות אדמין)");
SendClientMessage(playerid, COLOR_GREY,".מספר הנצחנות של השחקן המנצח יופיע בסטאטס");

}
else if(strcmp(Roy_Killer,"9",true) == 0)
{
SendClientMessage(playerid, COLOR_LIGHTBLUE,".--  Mlgzohot `help` (9) - עזרה מלחמת מלגזות גאטר--");
SendClientMessage(playerid, COLOR_ORANGE,"בעזרה זה מותקנת מערכת מלגזות");
SendClientMessage(playerid, COLOR_ORANGE,".כולכם משתגרים לגג והמטרה היא להרים בעזרת המטות את השחקן עם רכבו");
SendClientMessage(playerid, COLOR_GREEN,":פקודות מלגזות");
SendClientMessage(playerid, COLOR_GREY,"/joinf /smlgzohot (admin only) /endMlgzohot (admin only)");
SendClientMessage(playerid, COLOR_GREY,".מספר הנצחנות של השחקן המנצח יופיע בסטאטס");

}
else if(strcmp(Roy_Killer,"10",true) == 0)
{
SendClientMessage(playerid, COLOR_LIGHTBLUE,".--  Tiger `help` (10) - עזרה מלחמת טייגרים --");
SendClientMessage(playerid, COLOR_ORANGE,"בעזרה זה מותקנת מערכת מיני טנקים");
SendClientMessage(playerid, COLOR_ORANGE,".כולכם משתגרים לתוך אינטריור חדר סגור עם מיני טנק ומפוצציפ אחד את השני");
SendClientMessage(playerid, COLOR_GREEN,":פקודות טייגרים");
SendClientMessage(playerid, COLOR_GREY,"/Tiger /starttiger (admin only) /endtiger (admin only)");
SendClientMessage(playerid, COLOR_GREY,".מספר הנצחנות של השחקן המנצח יופיע בסטאטס");

}
else if(strcmp(Roy_Killer,"11",true) == 0)
{
SendClientMessage(playerid, COLOR_LIGHTBLUE,".--  War `help` (11) - עזרה מלחמת השרת --");
SendClientMessage(playerid, COLOR_ORANGE,"בעזרה זה מותנקת מערכת מלחמות שבא המטרה היא לשרוד אחרון בתוך עולם");
SendClientMessage(playerid, COLOR_ORANGE,".כל שחקן יקבל נשק לפי ראנדום (אקראיות) ואיתו הילחם");
SendClientMessage(playerid, COLOR_GREEN,":פקודות מלחמה");
SendClientMessage(playerid, COLOR_GREY,"/war , /swar (admin only) , /endwar (admin only)");
SendClientMessage(playerid, COLOR_GREY,".מספר הנצחנות של השחקן המנצח יופיע בסטאטס");
}
else if(strcmp(Roy_Killer,"12",true) == 0)
{
SendClientMessage(playerid, COLOR_LIGHTBLUE,".--  Minigun `help` (12) - עזרה חוררן --");
SendClientMessage(playerid, COLOR_ORANGE," כאשר איתה אתה נלחם בשחקנים ,Minigun בעזרה זה מותקנת מערכת");
SendClientMessage(playerid, COLOR_ORANGE,".ואיתו ילחם בשחקנים אחרים Minigun כל שחקן יקבל תנשק");
SendClientMessage(playerid, COLOR_GREEN,":פקודות מיניגאן");
SendClientMessage(playerid, COLOR_GREY,"/mini , /smini (admin only) , /endmini (admin only)");
SendClientMessage(playerid, COLOR_GREY,".מספר הנצחנות של השחקן המנצח יופיע בסטאטס");
}
else if(strcmp(Roy_Killer,"13",true) == 0)
{
SendClientMessage(playerid, COLOR_LIGHTBLUE,".--  Bazooka/Rpg `help` (13) - עזרה בזוקות  --");
SendClientMessage(playerid, COLOR_ORANGE," כאשר איתה אתה נלחם בשחקנים עם בזוקות.Rpg בעזרה זה מותקנת מערכת");
SendClientMessage(playerid, COLOR_ORANGE,"כל שחקן הרשום לפעילות יקבל בזוקה");
SendClientMessage(playerid, COLOR_GREEN,":פקודות מלחמת טילים");
SendClientMessage(playerid, COLOR_GREY,"/Rpg - הצטרפות , /srpg - התחלה , /endrpg - סיום");
SendClientMessage(playerid, COLOR_GREY,".מספר הנצחנות של השחקן המנצח יופיע בסטאטס");
}
else if(strcmp(Roy_Killer,"14",true) == 0)
{
SendClientMessage(playerid, COLOR_LIGHTBLUE,".-- .לא עובד כרגע * תיקון Sail `help` (14) - עזרה התענוגות  --");
SendClientMessage(playerid, COLOR_ORANGE,".בעזרה ספינת התענוגות ניתן לנהוג באוניה כמו שלא ניתן מעולם");
SendClientMessage(playerid, COLOR_GREEN,":פקודות הספינה");
SendClientMessage(playerid, COLOR_GREY, "/startpier /sail /exitship");
}
else if(strcmp(Roy_Killer,"15",true) == 0)
{
SendClientMessage(playerid, COLOR_LIGHTBLUE,".--  Wang `help` (15) - עזרה מכירת רכבים למוסך  --");
SendClientMessage(playerid, COLOR_ORANGE,".``Wang Cars`` בעזרה זה מותקן מכירת רכבים למוסך");
SendClientMessage(playerid, COLOR_ORANGE,"כל רבע שעה תופיע הודעה בצ'אט על רכב שמוסך וואנג מחפש");
SendClientMessage(playerid, COLOR_ORANGE,"/SF המטרה להגיע למוסך וואנג הוא למכור תרכב מוסך וואנג ממקום ליד");
SendClientMessage(playerid, COLOR_GREEN,":פקודות מוסך וואנג");
SendClientMessage(playerid, COLOR_GREY, "/exports - .מכירה למוסך וואנג במקרה שלא מוכר אוטומטית");
SendClientMessage(playerid, COLOR_GREY,".ב``כ שתגיע למוסך וואנג זה ימכור תרכב אוטומטי אבל פקודה למקרה חירום שלא עובד");
}
else if(strcmp(Roy_Killer,"16",true) == 0)
{
SendClientMessage(playerid, COLOR_LIGHTBLUE,".--  Proprties `help` (16) - עזרה קניית נכסים  --");
SendClientMessage(playerid, COLOR_ORANGE,".בעזרה זה מותקנת מערכת נכסים שבעזרת תוכל לקנות נכסים");
SendClientMessage(playerid, COLOR_ORANGE,"ברגע שתקנה נכס תרוויח ממנו סכום מסוים של כסף");
SendClientMessage(playerid, COLOR_GREEN,":פקודות נכסים");
SendClientMessage(playerid, COLOR_GREY, "/buy - קניית נכס");
}
else if(strcmp(Roy_Killer,"17",true) == 0)
{
SendClientMessage(playerid, COLOR_LIGHTBLUE,".--  Car system buy `help` (17) - עזרה קניית מכוניות  --");
SendClientMessage(playerid, COLOR_ORANGE,".בעזרה זה ניתן לקנות מכוניות");
SendClientMessage(playerid, COLOR_ORANGE,".ברגע שתקנה רכב הוא ישמר לך גם אחרי שתצא מהשרת. את הרכב תוכל לשגר אלייך");
SendClientMessage(playerid, COLOR_GREEN,":פקודות קניית רכבים");
SendClientMessage(playerid, COLOR_GREY, "/buycar (1) - לקנות /sellcar - למכור /lock - לנעול /unlock - ביטול נהילה /eject - הוצאת שחקן מהרכב /repair - תיקון /car - מידע על רכב מסוים");
}
else if(strcmp(Roy_Killer,"18",true) == 0)
{
SendClientMessage(playerid, COLOR_LIGHTBLUE,".--  Profile `help` (18) - עזרה פרופיל  --");
SendClientMessage(playerid, COLOR_ORANGE,":בעזרה זה מותנקת מערכת פרופיל שבא ניתן");
SendClientMessage(playerid, COLOR_ORANGE,".בעזרה זה ניתן לערוך: אייסיקיו , מסנ'גר , גיל , מילה , אימייל , מין");
SendClientMessage(playerid, COLOR_GREEN,":פקודות פרופיל");
SendClientMessage(playerid, COLOR_GREY, "/setp open /setp icq /setp msn /setp email");
SendClientMessage(playerid, COLOR_GREY, "/setp age /setp sex /setp m");
SendClientMessage(playerid, COLOR_GREY, "/profile /pprofile [id]");
}

else if(strcmp(Roy_Killer,"19",true) == 0)
{
SendClientMessage(playerid, COLOR_LIGHTBLUE,".--  Gangs `help` (19) - .עזרה כנופיות  --");
SendClientMessage(playerid, COLOR_ORANGE,":בעזרה זה מותנקת מערכת כנופיות");
SendClientMessage(playerid, COLOR_ORANGE,".ניתן להקים כנופיה / להצטרף / לדבר בצ'אט פרטי");
SendClientMessage(playerid, COLOR_GREEN,":פקודות גאנג");
SendClientMessage(playerid, COLOR_GREY,"/gang create [name] /gang invite [playeid] /gang join");
SendClientMessage(playerid, COLOR_GREY,"/gang quit /ganginfo /gangs");
}
else if(strcmp(Roy_Killer,"20",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  VIP `help` -  (20) .עזרה חברי שרת  --");
SendClientMessage(playerid, COLOR_ORANGE,":VIP בעזרה זה מותנקת מערכת");
SendClientMessage(playerid, COLOR_ORANGE,".VIP מקבל גישה למפקדת ה VIPכל מי שנמצא ב");
SendClientMessage(playerid, COLOR_ORANGE,"-VIPמחזיקה בכריש שברגע שפורץ יפרוץ למפקדת ה VIPמערכת ה");
SendClientMessage(playerid, COLOR_ORANGE,"יהרג על ידי הכריש ! גם שיכנסו למפקדה שלכם תקבלו הודעה אליכם הודעה אישית");
SendClientMessage(playerid, COLOR_GREEN,":פקודות חברי שרת");
SendClientMessage(playerid,COLOR_GREY,"/vip camrea /vip off /vip list /vip go");
SendClientMessage(playerid,COLOR_GREY,"$ [message vip] :הולך קח VIPצ'אט ה");
}
else if(strcmp(Roy_Killer,"21",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Supportives `help` (21) - .חבר תמיכה  --");
SendClientMessage(playerid, COLOR_ORANGE,":בעזרה זה מותנקת מערכת צוות תמיכה");
SendClientMessage(playerid, COLOR_ORANGE,"כאשר אתה נתקלים בבעיה / באג ניתן לפנות לאחד התומכים");
SendClientMessage(playerid, COLOR_GREEN,":פקודות תומכים");
SendClientMessage(playerid, COLOR_GREY,"/help server /helpme");
}
else if(strcmp(Roy_Killer,"22",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Private Message Call `help` (22) - .חבר טלפוני --");
SendClientMessage(playerid, COLOR_ORANGE,":PrivateMessage(/pm) בעזרה זה מצאנו שיטה לחסוך לכתוב כל הודעה פרטית");
SendClientMessage(playerid, COLOR_ORANGE,".כעת אתם יכולים להתקשר לשחקן ולדבר איתו בצ'אט חופשי בשיחה פרטית לחלוטין");
SendClientMessage(playerid, COLOR_GREEN,":פקודות");
SendClientMessage(playerid, COLOR_GREY,"/call /answer /hangup");
}
else if(strcmp(Roy_Killer,"23",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  System Server  `help`. (23) - .מערכת השרת --");
SendClientMessage(playerid, COLOR_ORANGE,".עזרה מערכת השרת בעזרה זה מותקנת מערכת שרת חכמה שבא ניתן");
SendClientMessage(playerid, COLOR_ORANGE,".להירשם לשרת / להתחבר לשרת / לשנות סיסמא / לשנות כינוי");
SendClientMessage(playerid, COLOR_GREEN,":פקודות מערכת");
SendClientMessage(playerid,COLOR_GREY,"/register /login /setpass /changenick");
}
else if(strcmp(Roy_Killer,"24",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".-- `help` LACY anti hacker (24) - האנטי צי'ט שלהשרת --");
SendClientMessage(playerid, COLOR_ORANGE,".:עזרה זה מחזיק אנטי צי'ט נגד");
SendClientMessage(playerid, COLOR_ORANGE,".כסף / מהירות / נשקים / מכוניות מעופפות");
}
else if(strcmp(Roy_Killer,"25",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".-- .rules `help` (25) Satla-Zone.co.il - .חוקי השרת --");
SendClientMessage(playerid, COLOR_ORANGE," 1. .אנא דבר בכבוד לאדמינים ולחברי השרת");
SendClientMessage(playerid, COLOR_ORANGE, "2. .אין להציף תצ'אט בהודעות סתמיות");
SendClientMessage(playerid, COLOR_ORANGE, "3. .צי'טים יגררו לבאן ישירות");
SendClientMessage(playerid, COLOR_ORANGE, "4. .אין להרוג בשדה התעופה / רייס עם מסוק / הידרה");
SendClientMessage(playerid, COLOR_ORANGE, "5. .אין לפרסם כתובת מגורים / מספרי פלאפון");
SendClientMessage(playerid, COLOR_ORANGE, "6 .אין לעשות הרג חברי על מנת ליצר לכם סטאטס גבוה יותר");
SendClientMessage(playerid, COLOR_ORANGE, "7. .אין להרוג אדמין לבן - אדמין בתפקיד");
SendClientMessage(playerid, COLOR_ORANGE, "8. /report - .אנא אל תדווחו בשרת על צי'טירים בצ'אט אנא דווחו בפקודה");
}
else if(strcmp(Roy_Killer,"26",true) == 0)
{
new str[256];
SendClientMessage(playerid, COLOR_WHITE, ".--  `help` Credits (26) לוח קרדיטים --");
SendClientMessage(playerid, COLOR_ORANGE, ".על בניית העזרה Roy`s Omerתודה ל");
SendClientMessage(playerid, COLOR_ORANGE, ".על התרומה של בסיס העזרה Barak STתודה ל");
SendClientMessage(playerid, COLOR_ORANGE, ".תודה ליוני עלה המערכת סמים");
format(str, sizeof(str),".על כך שנתת לאנשים תכבוד הראוי להם ,%s ותודה מיוחד לך ",GetName(playerid));
SendClientMessage(playerid, COLOR_GREY, str);
}
else if(strcmp(Roy_Killer,"27",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  `help` Ship (27) - מערכת ספינת הפיראטים שעולה ויורדת --");
SendClientMessage(playerid, COLOR_ORANGE,"עזרה זה מחזיק מערכת ספינה שעולה ויורדת");
SendClientMessage(playerid, COLOR_ORANGE,"מטרת המערכת היא להישאר אחרון על הסירה שעולה ויורדת");
SendClientMessage(playerid, COLOR_GREEN,":פקודות ספינת הפיראטים");
SendClientMessage(playerid,COLOR_GREY,"/ship /startship (only admin) /endship (only admin)");

}
else if(strcmp(Roy_Killer,"28",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  `help` War(players) (28) - מערכת אימוני השרת --");
SendClientMessage(playerid, COLOR_ORANGE,".בעזרה זה מותקן מערכת אימונים בה השחקנים התאמנו + יגיעו למקום הריגה מהר יותר");
SendClientMessage(playerid, COLOR_ORANGE,".בכל שיגור תקבלו נשק שונה .`DeatchMatch` האיזורים נקראים איזורי");
SendClientMessage(playerid, COLOR_GREEN,":פקודות מערכת אימונים");
SendClientMessage(playerid, COLOR_GREY,"/bigwar /thewar /mp5 (2) /m4 (3) /deagle /dm /bazooka (10)");
}
else if(strcmp(Roy_Killer,"29",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  `help` Setting (29) - מערכת שינוים בשרת --");
SendClientMessage(playerid, COLOR_ORANGE,".עזרה עריכה");
SendClientMessage(playerid, COLOR_ORANGE,"בעזרה זה ניתן לשנות דברים למשל התחברות אוטמטית הצגת דברים ועוד");
SendClientMessage(playerid, COLOR_GREEN,":פקודות הגדרות");
SendClientMessage(playerid, COLOR_GREY,"/setting autologin :בקרוב מגוון פקודות בנתיים יש רק");
}
else if(strcmp(Roy_Killer,"30",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  `help` Ignore (30) - מערכת חסימת שחקן --");
SendClientMessage(playerid, COLOR_ORANGE,"עזרה חסימת שחקן");
SendClientMessage(playerid, COLOR_ORANGE,"בעזרה זה אתה יכול לחסום שחקן שישלח לך הודעות פרטיות");
SendClientMessage(playerid, COLOR_GREEN,":פקודות חסימה");
SendClientMessage(playerid, COLOR_GREY,"/ignore [playerid] /unignore [playerid");
SendClientMessage(playerid, COLOR_ORANGE,"בנוסף תוכל לחסום את כל ההודעות פרטיות בכללי בעזרת הפקודות");
SendClientMessage(playerid, COLOR_GREEN,":פקודות לביטול שליחת הודעות פרטיות");
SendClientMessage(playerid, COLOR_GREY,"/cancelpm /backpm");
}

else if(strcmp(Roy_Killer,"31",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Ammu system (31) - מערכת נשקים --");
SendClientMessage(playerid, COLOR_ORANGE,"עזרה קניית נשקים");
SendClientMessage(playerid, COLOR_ORANGE,".בעזרה זה מותקנת אפשרות לקנות נשקים תמדיים שישמרו לאחר שתצא ותכנס");
SendClientMessage(playerid, COLOR_GREEN,":פקודות קניית נשק / מגן");
SendClientMessage(playerid, COLOR_GREY,"/buyweapon - קניית נשק (/bw) - קיצור [number weapon] /weaponlist - רשימת נשקים (/wl) [1-2] - קיצור  /armourt");
}
else if(strcmp(Roy_Killer,"32",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,". -- Race system (32) - מערכת מירוצים --");
SendClientMessage(playerid, COLOR_ORANGE,"מערכת מירוץ מכוניות");
SendClientMessage(playerid, COLOR_ORANGE,".בעזרה זה מותקנת מערכת מכוניות שבא התחרו כ10 מתחרים אחד בשני המטרה לסיים תמסלול ראשון");
SendClientMessage(playerid, COLOR_GREEN,":פקודות לשימוש במערכת מירוצים");
SendClientMessage(playerid, COLOR_GREY,"/joinrace - הצטרפות /startrace - התחלה /endrace - סיום");
}
else if(strcmp(Roy_Killer,"33",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Drift system (33) - מערכת דריפטים --");
SendClientMessage(playerid, COLOR_ORANGE,"מערכת דריפטים");
SendClientMessage(playerid, COLOR_ORANGE,".מערכת דריפטים שבא המטרה היא לבצע החלקה על הכביש ולהגיע לסוף החניון");
SendClientMessage(playerid, COLOR_GREEN,":פקודות לשימוש במערכת דריפט");
SendClientMessage(playerid, COLOR_GREY,"/joinrace /startrace /endrace");
}
else if(strcmp(Roy_Killer,"34",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Triatlon system (34) - מערכת טריאטלון --");
SendClientMessage(playerid, COLOR_ORANGE,"מערכת טריאטלון חדשה עלתה לשרת");
SendClientMessage(playerid, COLOR_ORANGE,"המערכת הולכת ככה: כל מי שמצטרף לפעילות ישתגר לאיזור מסויים של התחרות");
SendClientMessage(playerid, COLOR_ORANGE,"בהתחלת הטריאטלון אתם תרצו, אחרי זה אתם תשחו , ובסוף תסעו על אופנעיים");
SendClientMessage(playerid, COLOR_ORANGE,"הראשון שיגיע לנקודת הסיום ינצח ויוכרז עליו כמצנצח על ידי נגיעה בעיגול האדום");
SendClientMessage(playerid, COLOR_GREEN,":פקודות לשימוש במערכת טריאטלון");
SendClientMessage(playerid, COLOR_GREY,"/tria - הרשמה /stria - התחלה /endtria - סיום");
}
else if(strcmp(Roy_Killer,"35",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Stats player (35) - מערכת בדיקת מאזנים --");
SendClientMessage(playerid, COLOR_ORANGE,"בשרת זה מותקנת מערכת בדיקת מאזנים למשל: הריגות,בנק,רמה,מנות סמים,אזהרות");
SendClientMessage(playerid, COLOR_ORANGE,"נקודות ניסיון, רמת כבוד,אזהרות,קלאן,רכב,פרופיל: אייסיקיו,מסנגר");
SendClientMessage(playerid, COLOR_ORANGE,"גיל,מדינה,מין,משפט");
SendClientMessage(playerid, COLOR_ORANGE,"הנצחנות שלכם יופיעו בסטאטס למשל: נצחונות בקארט,נצחנות במונסטר,נצחונות בוואר");
SendClientMessage(playerid, COLOR_ORANGE,"נצחנות במיניגאן , נצחונות בקרב טילים,נצחנות בדריפטים,נצחונות בטריאטלון,נצחנות במירוצים");
SendClientMessage(playerid, COLOR_ORANGE,"נצחנות בקרב טיפוס על הר, ועוד הרבה דברים");
SendClientMessage(playerid, COLOR_GREEN,":פקודות לשימוש במערכת בדיקת מאזנים");
SendClientMessage(playerid, COLOR_GREY,"/stats - בדיקת מאזן /pstats - בדיקת מאזן של שחקן אחר [id] /details /pdetails [id] /mypet /ppet [id]");
SendClientMessage(playerid, COLOR_GREY,"/profile - פרופיל שלך /pprofile [id] - פרופיל של שחקן אחר");
}
else if(strcmp(Roy_Killer,"36",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Organization player (36) - עזרה ארגונים --");
SendClientMessage(playerid, COLOR_ORANGE,".מערכת ארגונים");
SendClientMessage(playerid, COLOR_ORANGE,"אז תוכל לערוך את זה בעזרת המערכת ``S`` בעזרה זה מותקנת מערכת ארגונים,זאת אומרת שניתן לשנות את הארגון שלך למשל פתחת ארגון");
SendClientMessage(playerid, COLOR_GREEN,":פקודות לשימוש במערכת ארגונים");
SendClientMessage(playerid, COLOR_GREY,"/Organization my [Organization name] :לעריכת הארגון שלך");
}
else if(strcmp(Roy_Killer,"37",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Kopat Gemel a (37) - קופת גמל השקאות --");
SendClientMessage(playerid, COLOR_ORANGE,"מערכת הרווחת כסף, ע``י קופת גמל הסבר");
SendClientMessage(playerid, COLOR_ORANGE,"בעזרה קופת ההשקאות תוכל להרוויח כסף, איך מרווחים");
SendClientMessage(playerid, COLOR_ORANGE,".סשים לב, אתה תוכל להשתמש בקופת הגמל מרמה 3 ומעלה");
SendClientMessage(playerid, COLOR_ORANGE,"[4,000-20,000] :סכום מינימלי/מקסימלי הוא");
SendClientMessage(playerid, COLOR_ORANGE,".נגיד והפקדה כ4,000 דולר , כל שעה זה יכפיל לך תכסף בקופת הגמל");
SendClientMessage(playerid, COLOR_GREEN,":פקודות לשימוש במערכת ארגונים");
SendClientMessage(playerid, COLOR_GREY,"/agemel [4,000-20,000] להפקדת הכסף בקופת הגמל /getgemelm לליקחת ההשקעה שלך בקופה");
}

return 1;
}

if (strcmp(cmdtext, "/deagle", true)==0){



//
mini[playerid] = 1;
ResetPlayerWeapons(playerid);
GivePlayerWeapon(playerid,24,9999);
SetPlayerPos(playerid,2692.2280,2784.6331,59.0212);

return 1;}
if (strcmp(cmdtext, "/dm", true)==0)
{
mini[playerid] =1;
SetPlayerPos(playerid,687.4338,1849.2729,6.9262);
return 1;
}
//-=-=
if(strcmp(cmdtext, "/TheWar", true) == 0)
{

SendClientMessage(playerid, COLOR_LIGHTBLUE,"ברוכים הבאים לאיזור `המלחמות` `ה` תהנו");
ResetPlayerWeapons(playerid);
SetPlayerInterior(playerid,0);
SetPlayerPos(playerid,-2729.083,671.718,65.754);
SetPlayerArmour(playerid, 100.0);
SetPlayerHealth(playerid, 100.0);
ResetPlayerWeapons(playerid);
GivePlayerWeapon(playerid,4,0);
GivePlayerWeapon(playerid,26,9999);
GivePlayerWeapon(playerid,31,9999);
GivePlayerWeapon(playerid,24,9999);
GivePlayerWeapon(playerid,32,9999);
mini[playerid] =1;
return 1;
}

if(strcmp(cmdtext, "/parkour", true) == 0)
{
if (PlayerInfo[playerid][Level] >= 4)
{

SendClientMessage(playerid, COLOR_LIGHTBLUE,"ברוכים הבאים לאיזור הפארקור");
ResetPlayerWeapons(playerid);
SetPlayerInterior(playerid,0);
SetPlayerPos(playerid,-2439.281,1544.843,8.059);

}
else
{
SendClientMessage(playerid,COLOR_WHITE,".שיגור זה לשחקנים רמה 4 ומעלה בלבד");
}
return 1;
}

if(strcmp(cmdtext, "/BigWar", true) == 0)
{
mini[playerid] =1;
SendClientMessage(playerid, COLOR_LIGHTBLUE,"ברוכים הבאים לאיזור הביג וואר");
ResetPlayerWeapons(playerid);
SetPlayerInterior(playerid,0);
SetPlayerPos(playerid,1777.283,-1805.586,52.129);
SetPlayerArmour(playerid, 100.0);
SetPlayerHealth(playerid, 100.0);
ResetPlayerWeapons(playerid);
GivePlayerWeapon(playerid,4,0);
GivePlayerWeapon(playerid,26,9999);
GivePlayerWeapon(playerid,31,9999);
GivePlayerWeapon(playerid,24,9999);
GivePlayerWeapon(playerid,32,9999);
return 1;
}

if (strcmp(cmdtext, "/ls", true)==0){



if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
new vehicleid = GetPlayerVehicleID(playerid);
SetVehiclePos(vehicleid, 2491.8503, -1668.1625, 13.3438);
SetVehicleZAngle(vehicleid, 159.4142);
SetPlayerInterior(playerid, 0);
} else {
SetPlayerPos(playerid, 2491.8503, -1668.1625, 13.3438);
SetPlayerFacingAngle(playerid, 49.0746);
SetPlayerInterior(playerid, 0);}
SendClientMessage(playerid, 0xFFFF00AA,".Los Santosברוכים הבאים ל");
///DisplayTextForPlayer(playerid,"~w~Welcome to the ~b~ Los Santos", 5, 1, 3);

return 1;}

if (strcmp(cmdtext, "/ramp", true)==0){


if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
new vehicleid = GetPlayerVehicleID(playerid);
SetVehiclePos(vehicleid, 1874.7780, -1391.9210, 13.5482);
SetVehicleZAngle(vehicleid, 313.1693);
SetPlayerInterior(playerid, 0);
} else {
SetPlayerPos(playerid, 1874.7780, -1391.9210, 13.5482);
SetPlayerFacingAngle(playerid, 313.1693);
SetPlayerInterior(playerid, 0);}
SendClientMessage(playerid, 0xFFFF00AA, " הגעתם לאזור הפעלולים");
//GameTextForPlayer(playerid,"~w~ramp",5000,1);
//DisplayTextForPlayer(playerid,"~w~Welcome to the ~b~ Ramp", 5, 1, 3);

return 1;}

if(strcmp(cmd, "/Drift", true) == 0)
{


if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
new vehicleid = GetPlayerVehicleID(playerid);
SetVehiclePos(vehicleid, -2402.1555,-595.5341,132.6484);
SetVehicleZAngle(vehicleid, 117.5520);
SetPlayerInterior(playerid, 0);
} else {
SetPlayerPos(playerid, -2402.1555,-595.5341,132.6484);
SetPlayerFacingAngle(playerid, 117.5520);
SetPlayerInterior(playerid, 0);}
SendClientMessage(playerid, 0xFFFF00AA, ".ברוך הבא ללאיזור הדריפטים");
//DisplayTextForPlayer(playerid,"~w~ Welcome To the ~b~ Drift 2 ", 5, 1, 3);


return 1;}

if(strcmp(cmdtext, "/drag", true)==0){

if (GetPlayerState(playerid) == 2){

SetPlayerInterior(playerid,0);
SetVehiclePos(GetPlayerVehicleID(playerid), 2088.3137,-2452.7002,13.5469);
SetVehicleZAngle(GetPlayerVehicleID(playerid), 174.9026);

} else {
SetPlayerInterior(playerid,0);
SetPlayerPos(playerid, 2088.3137,-2452.7002,13.5469);
SetPlayerFacingAngle(playerid,174.9026);}

GameTextForPlayer(playerid,"~W~ Drag",5000,1);
SendClientMessage(playerid,0xFFFF00AA, ".ברוכים הבאים לאיזור הדראג");




return 1;}

if(strcmp(cmdtext, "/Ship", true)==0){
if(shipworked ==0) return SendClientMessage(playerid,COLOR_WHITE,".ההרשמה נסגרה / אין כרגע ספינת פיראטים");
SetPlayerPos(playerid, 1844.8219,1512.9341,10.8203);
SetPlayerInterior(playerid, 0);
SendClientMessage(playerid, 0xFFFF00AA, ".ברוכים הבאים למערכת ספינת הפיראטים אנא עלה במדרגות לספינה");
ResetPlayerWeapons(playerid);
//DisplayTextForPlayer(playerid,"~W~ Welcome To The ~B~Ship ~G~Down ~P~UP", 5, 1, 3);
return 1;}

if(strcmp(cmdtext, "/survival", true)==0)
{
SetPlayerPos(playerid, 2858.6392,1328.6549,11.3906);
SetPlayerInterior(playerid, 0);
SendClientMessage(playerid, 0xFFFF00AA, ".ברוכים הבאים להישרדות");
GameTextForPlayer(playerid,"~r~s~w~urvival",5000,1);
//DisplayTextForPlayer(playerid,"~W~ Welcome To The ~r~s~w~urvival", 5, 1, 3);
return 1;
}





if (strcmp(cmdtext, "/dj", true)==0)
{
if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
{
new vehicleid = GetPlayerVehicleID(playerid);
SetVehiclePos(vehicleid,-269.0765,1530.5195,75.5625);
SetPlayerInterior(playerid, 0);
}
else
{
SetPlayerPos(playerid, -269.0765,1530.5195,75.5625);
SetPlayerFacingAngle(playerid,39.8662);
SetPlayerInterior(playerid, 0);
}
SendClientMessage(playerid, 0xFFFF00AA, ".ברוך הבא לאיזור הג'יפים");
GameTextForPlayer(playerid,"~r~d~w~rift ~r~j~w~eeps",5000,1);
return 1;
}


//army
if(strcmp(cmdtext, "/army", true)==0){
SetPlayerPos(playerid, 261.9023, 1998.1041, 17.6406);
SendClientMessage(playerid, 0xFFFF00AA, ".ברוכים הבאים לבסיס הצבאי");
GameTextForPlayer(playerid,"~r~a~w~rmy",5000,1);
SetPlayerInterior(playerid,0);
 return 1;}

//מפקדה

if(strcmp(cmd, "/skydive", true) == 0)
{
new Float:X, Float:Y, Float:Z;
GetPlayerPos(playerid, X, Y, Z);
SetPlayerPos(playerid, X, Y, Z+1000);
GivePlayerWeapon(playerid, 46, 1);
GameTextForPlayer(playerid,"~w~ skydive",5000,1);
SetPlayerInterior(playerid,0);
 return 1;
}


if(strcmp(cmdtext, "/lcout", true) == 0)
{
if(InLcTeleport[playerid] ==0) return SendClientMessage(playerid,red,".liberty city - את/ה לא נמצא באיזור של העיר");
InLcTeleport[playerid] = 0;
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid,2057.0664,843.0209,6.7031);
SetPlayerFacingAngle(playerid,357.5948);
return 1;
}
if(InLcTeleport[playerid] ==1) return SendClientMessage(playerid,red,".כדאי לצאת מהעיר הזאתי - /lcout :אנא השתמש בפקודה");

if(strcmp(cmdtext, "/lc", true) == 0)
{
if (PlayerInfo[playerid][Level] >= 1)
{
InLcTeleport[playerid] = 1;
SetPlayerInterior(playerid, 1);
SetPlayerPos(playerid, -782.0262,505.4131,1371.7422);
SendClientMessage(playerid, 0xFFFF00AA, ".3 GTAברוכים הבאים ל");
}
else
{
SendClientMessage(playerid,COLOR_WHITE,".שיגור זה לשחקנים רמה 1 ומעלה");
}
return 1;
}


if(strcmp(cmdtext, "/ryder", true) == 0){

//


new playerState = GetPlayerState(playerid);
if(playerState == PLAYER_STATE_DRIVER){
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
SendClientMessage(playerid,0xFFFF00AA,".הגעתם לטיולי האופניים");
SetVehiclePos(VehicleID,-727.5442,2306.2537,128.2241);
 GameTextForPlayer(playerid,"~w~ Ryder",5000,1);
SetPlayerInterior(playerid,0);
}else{
SetPlayerInterior(playerid,0);
SetPlayerPos(playerid,-1286.5721,2515.9258,87.1353);}

return 1;}
//--War





if(strcmp(cmdtext, "/snipe", true)==0)
{

//
    SetPlayerPos(playerid, 2320.6216, 1305.5656, 67.4688);
    SetPlayerFacingAngle(playerid, 2.8078);
    SendClientMessage(playerid, 0xFFFF00AA, ".השתגרת בהצלחה לעמדת הצליפה חכה 10 שניות ותקבל צלף");
    SetTimerEx("sniper",10000,0,"d",playerid);
SetPlayerInterior(playerid,0);
    return 1;
}
if(strcmp(cmdtext, "/sea", true)==0){
//


if(IsPlayerInCheckpoint(playerid)==0 || playerCheckpoint[playerid]!=CP_PIRATE) {

SendClientMessage(playerid, COLOR_RED, "אתה לא בנקודת ציון");
return 1;}

if (GetPlayerState(playerid) == 2){
SetVehiclePos(GetPlayerVehicleID(playerid), 2328.9553, 514.5198, -0.4966);
SetVehicleZAngle(GetPlayerVehicleID(playerid), 184.2794);
} else {
SetPlayerPos(playerid, 2328.9553, 514.5198, -0.4966);
SetPlayerFacingAngle(playerid, 184.2794);
}SendClientMessage(playerid, 0x0C4E0FF, "השתגרת בהצלחה לתוך הים");
SetPlayerInterior(playerid,0);

return 1;}


if (strcmp(cmdtext, "/pepe", true)==0){




if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
new vehicleid = GetPlayerVehicleID(playerid);
SetVehiclePos(vehicleid, -809.5623, -1911.3700, 7.9728);
SetVehicleZAngle(vehicleid, 221.2887);
SetPlayerInterior(playerid, 0);
} else {
SetPlayerPos(playerid, -809.5623, -1911.3700, 7.9728);
SetPlayerFacingAngle(playerid, 221.2887);
SetPlayerInterior(playerid, 0);}
SendClientMessage(playerid, 0xFFFF00AA, " ברוכים הבאים לאגם הפיפי");
GameTextForPlayer(playerid,"~W~pepe",5000,5);

 return 1;}
 
 
if(strcmp(cmd, "/Sniper", true) == 0)
{

if(HpModeA[playerid] == 1)
{
HpModeA[playerid] = 0;
//DisplayTextForPlayer(playerid,"~r~Sniper Out", 5, 1, 3);
GameTextForPlayer(playerid, "~r~Sniper Out", 2000, 4);
SetPlayerPos(playerid,2057.0664,843.0209,6.7031);
SetPlayerFacingAngle(playerid,357.5948);
//KillTimer(HpModeTimer[playerid]);
SendClientMessage(playerid, 0xFFFF00AA, ".יצאת בהצלחה מאיזור הצלפים");
SetPlayerColor(playerid,sgba2hex(random(256),random(256),random(256),55));//צבע במפה
ResetPlayerWeapons(playerid);
}
else
{
HpModeA[playerid] = 1;

GameTextForPlayer(playerid, "~w~Sniper 1 Shot 1 Kill ", 2000, 4);
//HpModeTimer[playerid] = SetTimer("HpMode",200, 1);
SendClientMessage(playerid, 0xFFFF00AA, ".ברוכים הבאים לסנייפר כל כדור פגיעה תהרוג בנאדם");
new rand = random(sizeof(Sniper));
//
SetPlayerPos(playerid, Sniper[rand][0], Sniper[rand][1], Sniper[rand][2]);
ResetPlayerWeapons(playerid);
GivePlayerWeapon(playerid,34,1000);
}

return 1;
}
if(HpModeA[playerid] == 1) return SendClientMessage(playerid, COLOR_WHITE, "/Sniper - כדאי לצאת ממצב סנייפר אנא הזן");

if(!strcmp(cmd,"/lp",true)) {

if(!PlayerInfo[playerid][Saved]) return SendClientMessage(playerid,COLOR_GREEN," אין לך אף מקום שמור");
if(GetPlayerMoney(playerid) < 600) return SendClientMessage(playerid,WHITE,".שחקן/ית יקרים הינכם צריכים כסף ביד בסכום של 600 דולר");
if(IsPlayerInAnyVehicle(playerid)) {
SetVehiclePos(GetPlayerVehicleID(playerid),PlayerInfo[playerid][SPX],PlayerInfo[playerid][SPY],PlayerInfo[playerid][SPZ]);
LinkVehicleToInterior(GetPlayerVehicleID(playerid),PlayerInfo[playerid][SPI]);
}
else
{
SetPlayerPos(playerid,PlayerInfo[playerid][SPX],PlayerInfo[playerid][SPY],PlayerInfo[playerid][SPZ]);
}
SetPlayerInterior(playerid,PlayerInfo[playerid][SPI]);
LACY_GiveMoney(playerid,-600);
return 1;
}
if(!strcmp(cmd,"/rsp",true)) {
if(!PlayerInfo[playerid][Saved]) return SendClientMessage(playerid,COLOR_GREEN," אין לך אף מקום שמור ");
PlayerInfo[playerid][Saved] = 0;
dini_IntSet(GetPlayerFile(playerid),"Saved",0);
SendClientMessage(playerid,0xFFFF00AA," המקום שלך נחמק בהצלחה ");
return 1;
}

if(strcmp(cmd, "/bazooka", true) == 0)
{

if (PlayerInfo[playerid][Kills] >= 1500)
{

SetPlayerInterior(playerid,16);
SetPlayerPos(playerid,-1401.0670,1265.3706,1039.8672);
GameTextForPlayer(playerid, "Bazoka", 3000,1);
//DisplayTextForPlayer(playerid,"~r~Sniper Out", 5, 1, 3);
//DisplayTextForPlayer(playerid,"~w~Welcome To the ~r~War~b~Zone", 5, 1, 3);
SendClientMessage(playerid, COLOR_GREEN, ".ברוכים הבאים לאיזור הבזוקות ");
SetPlayerInterior(playerid,16);
GivePlayerWeapon(playerid,35,1000);

}
else
{
SendClientMessage(playerid,COLOR_WHITE,".פקודה זאתי זמינה מרמה 10 ומעלה");
}
return 1;
}
if(!strcmp(cmdtext,"/grage",true))
{




if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
{
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid, 2384.5872,1021.0602,10.8203);
}
else
{
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid, 2384.5872,1021.0602,10.8203);
}
GameTextForPlayer(playerid, "~w~Grage", 3000,1);
{
SendClientMessage(playerid,0xFFFF00AA, ".ברוך הבא למוסך");
}
return 1;
}
//carpark
if(strcmp(cmdtext, "/CarPark", true)==0)
{




SetPlayerInterior(playerid,0);
if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
{
new vehicleid = GetPlayerVehicleID(playerid);
SetVehiclePos(vehicleid,-1871.1420,-880.6755,32.0234);
SetVehicleZAngle(vehicleid,173.5509);
}
else
{
SetPlayerPos(playerid,-1871.1420,-880.6755,32.0234);
SetPlayerFacingAngle(playerid,173.5509);
}
SendClientMessage(playerid, 0xFFFF00AA, ".ברוך הבא לאזור הקניית מכוניות");
//DisplayTextForPlayer(playerid,"~w~ Welcome to The ~b~ CarPark", 5, 1, 3);
GameTextForPlayer(playerid, "~w~CarPark", 3000,1);
return 1;
}
 //-----------
if(strcmp(cmdtext, "/ShipS", true)==0)
{



SetPlayerInterior(playerid,0);
SetPlayerPos(playerid,-2425.6492,2316.9875,4.6046);
SetPlayerFacingAngle(playerid,243.2094);
SendClientMessage(playerid, 0xFFFF00AA, ".ברוכים הבאים לאיזור הסירות");
//GameTextForPlayer(playerid,"ShipStrip",5000,1);
//DisplayTextForPlayer(playerid,"~w~Welcome To the ~b~ShipStrip", 5, 1, 3);
GameTextForPlayer(playerid, "Ship Strip", 3000,5);
return 1;
}



if(strcmp(cmdtext, "/cycletrip", true)==0)
{

if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
{
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid,-2406.5801,-2175.3123,33.2891);
SetPlayerFacingAngle(playerid,282.9754);
}
else
{
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid,-2406.5801,-2175.3123,33.2891);
SetPlayerFacingAngle(playerid,282.9754);
}
GameTextForPlayer(playerid,"~w~ Bike Strip",5000,5);
//DisplayTextForPlayer(playerid,"~w~Welcome To the ~b~Bike Strip", 5, 1, 3);
{
//SendClientMessage(playerid,0xFFFF00AA, ".תהנו BikeStripברוכים הבאים ל");
}
SendClientMessage(playerid, 0xFFFF00AA, ".ברוכים הבאים לאיזור הטיולים");
GameTextForPlayer(playerid,"~w~cycletrip",5000,1);
//DisplayTextForPlayer(playerid,"~w~Welcome To the ~b~Cycletrip", 5, 1, 3);
return 1;
}


if(strcmp(cmdtext, "/BusStrip", true)==0) return SetPlayerPos(playerid,-2453.9746,2247.8186,4.9141),SetPlayerFacingAngle(playerid,191.4004),SendClientMessage(playerid, 0xFFFF00AA, ".ברוכים הבאים לאיזור הטיולים של האוטובוסים"),GameTextForPlayer(playerid, "BuStrip", 3000,5);




if(!strcmp(cmdtext,"/BikeStrip",true))
{
if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
{
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid,692.0775,828.9790,-30.1775);
}
else
{
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid, 692.0775,828.9790,-30.1775);}
GameTextForPlayer(playerid,"~w~ Bike Strip",5000,5);
//DisplayTextForPlayer(playerid,"~w~Welcome To the ~b~Bike Strip", 5, 1, 3);
{
SendClientMessage(playerid,0xFFFF00AA, ".תהנו BikeStripברוכים הבאים ל");
}
return 1;
}
//

if(strcmp(cmd, "/KickStart", true) == 0)
{

SetPlayerInterior(playerid, 14);
SetPlayerPos(playerid,-1410.72,1591.16,1052.53);
SendClientMessage(playerid, 0xFFFF00AA, "Welcome To Kickstart Stadium");
SendClientMessage(playerid, 0x17E5F6FF, "/Kill כדאי לצאת החוצה");
return 1;
}
if(strcmp(cmd, "/ia", true) == 0)
{

SetPlayerInterior(playerid, 7);
SetPlayerPos(playerid,-1395.958 ,-208.197 ,1051.170);
SendClientMessage(playerid, 0xFFFF00AA, "Welcome To Kickstart Stadium");
SendClientMessage(playerid, 0x17E5F6FF, "/Kill כדאי לצאת החוצה");
return 1;
}




if(strcmp(cmdtext, "/fight", true) == 0)
{




SetPlayerInterior(playerid,0);

SetPlayerPos(playerid,-1423.2991,-926.6885,201.2265);
SetPlayerFacingAngle(playerid,104.9933);
SendClientMessage(playerid,COLOR_LIGHTBLUE, "! ברוכים הבאים לאיזור המלחמות פייטרים");
//
return 1;
}
if(!strcmp(cmdtext,"/spawn",true))
{
if (PlayerInfo[playerid][Level] >= 5)
{

new rand = random(sizeof(gRandomPlayerSpawns));
SetPlayerPos(playerid, gRandomPlayerSpawns[rand][0],gRandomPlayerSpawns[rand][1], gRandomPlayerSpawns[rand][2]);
SendClientMessage(playerid,0xFFFF00AA, ".שוגרת למקום באקראי");
}
else
{
SendClientMessage(playerid,COLOR_WHITE,".שיגור זה לשחקנים רמה 5 ומעלה");
}
return 1;
}

if (strcmp("/Bank", cmdtext, true, 10) == 0) return SetPlayerPos(playerid,1424.9977,-2285.6335,13.3828),SetPlayerInterior(playerid,0),GameTextForPlayer(playerid,"~w~Bank",3000,1),SendClientMessage(playerid, 0xFFFF00AA, ".ברוכים הבאים לבנק");
if (strcmp("/ser", cmdtext, true, 10) == 0)return SetPlayerPos(playerid, -2127.5107,921.3911,79.4371);
if(strcmp(cmdtext, "/race", true)==0)
{
if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
{

new vehicleid = GetPlayerVehicleID(playerid);
SetVehiclePos(vehicleid,2106.0349,876.7166,9.5355);
SetVehicleZAngle(vehicleid,271.3417);
}
else
{
SetPlayerPos(playerid,2057.0664,843.0209,6.7031);
SetPlayerFacingAngle(playerid,357.5948);
}
SendClientMessage(playerid, COLOR_NEUTRALGREEN, ".ברוך הבא לאזור המירוצים");


//DisplayTextForPlayer(playerid,"~w~Welcome to the ~b~Rac`ing", 5, 1, 3);
GameTextForPlayer(playerid,"~w~Race",2000,1);
SetPlayerInterior(playerid,0);
	    return 1;
 }
/*------------------/Invalid Command\------------------*/
else
        {
                format(string, sizeof(string), "/help - .אינה פקודה מוכרת/קיימת לעזרה ``%s``", cmdtext);
                SendClientMessage(playerid,COLOR_WHITE, string);
        }
return 1;
}






public OnVehicleDeath(vehicleid, killerid)
{

SetVehicleVirtualWorld(vehicleid,0);
if (GetVehicleModel(vehicleid) == 519 && ShamalExists(vehicleid))
{
CreateExplosion(ShamalPos[vehicleid][0], ShamalPos[vehicleid][1], ShamalPos[vehicleid][2], 2, 15.0);
sExplode[vehicleid] = SetTimerEx("ExplodeShamal", 700, 1, "d", vehicleid);
tCount[vehicleid] = true;
}
return 1;
}



public OnPlayerDeath(playerid, killerid, reason)
{
ResetPlayerMoney(playerid);

if(MonsterNoTeleportion[playerid] == 1) {
MonsterPlayers --; iNmOnster[playerid] = 0; MonsterNoTeleportion[playerid] = 0; MonsterFucker[playerid] = 0;
DestroyVehicle(MonsterSYSTEM[playerid]);
MonStart[playerid] =0;
}
if(KK[playerid] == 1)
{
ResetPlayerWeapons(playerid);
SendClientMessage(playerid,COLOR_BRIGHTRED,".Kart .עזבת את הפעילות ");
KartPlayers --; InKart[playerid] = 0; KK[playerid] = 0; Fuck[playerid] = 0;
DestroyVehicle(caridxx[playerid]);
return 1;
}
PlayerInfo[playerid][Deaths] += 1;
PlayerInfo[killerid][Kills] += 1;
dini_IntSet(GetPlayerFile(killerid),"Kills",PlayerInfo[killerid][Kills]);
dini_IntSet(GetPlayerFile(playerid),"Deaths",PlayerInfo[playerid][Deaths]);

new playercash;

SendDeathMessage(killerid,playerid,reason);
SetPlayerScore(killerid,GetPlayerScore(killerid)+1);
playercash = GetPlayerMoney(playerid);
LACY_GiveMoney(killerid, playercash);
ResetPlayerMoney(playerid);



mini[playerid]=0;
/*
if(GetPlayerWeapon(killerid) != reason)
{
new str[256];
format(str, 256, "[Anti FakeKill] :קיבלת קיק מהשרת סיבה.", str);
SendClientMessage(playerid, red, str);
format(str, 256, "[Anti FakeKill] :קיבל קיק מהשרת סיבה %s", GetName(playerid));
SendClientMessageToAll(red, str);
Kick(playerid);
}
*/
PlayerInfo[killerid][aKillsnl] --;

ResetPlayerMoney(playerid);
NoForSell[playerid] =0;
if(PlayerInfo[killerid][Level] >3){
SetPlayerHealth(killerid,100.0),SendClientMessage(killerid,COLOR_GREEN,".החיים שלך התמלאו אוטומאטית בגלל שהרגת שחקן");
}
if(PlayerInfo[playerid][Level] > PlayerInfo[killerid][Level]) {
LACY_GiveMoney(killerid,3002);
SendClientMessage(killerid,COLOR_ORANGE,".קיבלת 3002 דולר על כך שהרגת שחקן ברמה גבוה ממך");
}
new vehicleid = GetPlayerVehicleID(playerid);
SetPlayerVirtualWorld(playerid,0);
SetVehicleVirtualWorld(vehicleid,0);
//GangZoneStopFlashForPlayer(playerid,VIPGangZone);
//ThisIsSendMessage[playerid]=0;
InLcTeleport[playerid] = 0;
HpModeA[playerid] = 0;
DolpYou[playerid] =0;
SharkYou[playerid] =0;
TorYou[playerid] =0;
if(PlayerInfo[playerid][Pets] ==1) {

if(PlayerInfo[playerid][Shark] ==1) {
DestroyStreamObject(sam33[playerid]);
SharkYou[playerid] =0;
ThePetsInYou[playerid] =0;
}
if(PlayerInfo[playerid][Dolp] ==1) {
DestroyStreamObject(sam22[playerid]);
ThePetsInYou[playerid] =0;
DolpYou[playerid] =0;
}
if(PlayerInfo[playerid][Tor] ==1) {

DestroyStreamObject(sam44[playerid]);
ThePetsInYou[playerid] =0;
TorYou[playerid] =0;
}
}

Stoned[playerid] =0;
ThePetsInYou[playerid] =0;



if(Registertrs[playerid] ==1)
{
CPTriatlon[playerid]=0,DisablePlayerRaceCheckpoint(playerid),Registertrs[playerid] =0,CPTriatlon[playerid]=0,RunPlayers--;
}
if(YouRegister[playerid] ==1)
{
YouRegister[playerid] =0,DisablePlayerRaceCheckpoint(playerid),DriftPlayer--;
}
if(Youregisterrace[playerid] ==1)
{
Youregisterrace[playerid] =0,RacePlayers--,DisablePlayerRaceCheckpoint(playerid);
}
if(PPw[playerid] == 1)
{
ResetPlayerWeapons(playerid);
SendClientMessage(playerid,COLOR_BRIGHTRED,".עזבת את הפעילות שבא הייתה");
WarPlayersw --; InWarw[playerid] = 0; PPw[playerid] = 0;
}
if(PP[playerid] == 1)
{
ResetPlayerWeapons(playerid);
SendClientMessage(playerid,COLOR_BRIGHTRED,".עזבת את הפעילות שבא הייתה");
WarPlayers --;
InWar[playerid] = 0;
PP[playerid] = 0;
}
if(PPr[playerid] == 1)
{
ResetPlayerWeapons(playerid);
SendClientMessage(playerid,COLOR_BRIGHTRED,".עזבת את הפעילות שבא הייתה");
WarPlayersr --; InWarr[playerid] = 0; PPr[playerid] = 0;
}




if(TheWeed[playerid] ==1)
{
new string[256];
LACY_GiveMoney(killerid,3002);
format(string, sizeof(string), "!!! ``%s`` :המבוקש %s`s :שימו לב מבוקש נתפס !!! תופס המבוקש",GetName(killerid),GetName(playerid)),SendClientMessage(playerid, COLOR_BROWN, string);
TheWeed[playerid] =0;
}
if(IsPlayerInAnyVehicle(playerid))
CallRemoteFunction("OnVehicleDeath2","dd",GetPlayerVehicleID(playerid),reason);
//--EndWar
InShamal[playerid] = 0;
mini[playerid] = 0;



return 1;
}

public OnPlayerSpawn(playerid)
{
if(PlayerInfo[playerid][armourT] > 0)
{
SetPlayerArmour(playerid,100);
}
//GangZoneStopFlashForPlayer(playerid,VIPGangZone);
//GangZoneShowForPlayer(playerid,VIPGangZone,COLOR_ORANGE);
//ThisIsSendMessage[playerid]=0;
InLcTeleport[playerid] = 0;
for(new car=0 ; car < VCount; car++)
{
new PlayerName[100]; GetPlayerName(playerid,PlayerName,30);
if(VehicleInfo[car][CarLocked] == 1 && VehicleInfo[car][CarOwned] == 1 && strcmp(PlayerName,VehicleInfo[car][CarOwner],true) == 0)
{
SetVehicleParamsForPlayer(car, playerid, 0, 0);
}
else if(VehicleInfo[car][CarLocked] == 1 && VehicleInfo[car][CarOwned] == 1 && strcmp(PlayerName,VehicleInfo[car][CarOwner],true) != 0)
{
SetVehicleParamsForPlayer(car, playerid, 0, 1);
}
}



GivePlayerWeapon(playerid,24,300);
GetPlayerName(playerid, pName, sizeof(pName));
format(file,256,"%s.ini",pName);
if(!dini_Exists(file))
{
dini_Create(file);
dini_IntSet(file, "S2W",0);
dini_IntSet(file, "S2A",0);
dini_IntSet(file, "S3W",0);
dini_IntSet(file, "S3A",0);
dini_IntSet(file, "S4W",0);
dini_IntSet(file, "S4A",0);
dini_IntSet(file, "S5W",0);
dini_IntSet(file, "S5A",0);
dini_IntSet(file, "S6W",0);
dini_IntSet(file, "S6A",0);
}
else
{
S2W = dini_Get(file, "S2W");
S2A = dini_Get(file, "S2A");
S3W = dini_Get(file, "S3W");
S3A = dini_Get(file, "S3A");
S4W = dini_Get(file, "S4W");
S4A = dini_Get(file, "S4A");
S5W = dini_Get(file, "S5W");
S5A = dini_Get(file, "S5A");
S6W = dini_Get(file, "S6W");
S6A = dini_Get(file, "S6A");
//ResetPlayerWeapons(playerid);
if(strval(S2W) != 0)
{
GivePlayerWeapon(playerid,strval(S2W),strval(S2A));
}
else
{
//GivePlayerWeapon(playerid,24,100);
}
if(strval(S3W) != 0)
{
GivePlayerWeapon(playerid,strval(S3W),strval(S3A));
}
if(strval(S4W) != 0)
{
GivePlayerWeapon(playerid,strval(S4W),strval(S4A));
}
if(strval(S5W) != 0)
{
GivePlayerWeapon(playerid,strval(S5W),strval(S5A));
}
if(strval(S6W) != 0)
{
GivePlayerWeapon(playerid,strval(S6W),strval(S6A));
}
}
SetPlayerInterior(playerid,0);
new rand = random(sizeof(gRandomPlayerSpawns));
SetPlayerPos(playerid, gRandomPlayerSpawns[rand][0], gRandomPlayerSpawns[rand][1], gRandomPlayerSpawns[rand][2]); // Warp the player
//SetPlayerPos(playerid,gRandomPlayerSpawns);
LACY_GiveMoney(playerid,1000);
//SetWorldTime(10);
if(PlayerInfo[playerid][SaveSkin] == 1)
{
SetPlayerSkin(playerid, PlayerInfo[playerid][SkinSavedId]);
}


if(PlayerInfo[playerid][bazooka] > 0)
{
GivePlayerWeapon(playerid,35,1);
}
ClearAnimations(playerid);
return 1;
}




public OnPlayerEnterRaceCheckpoint(playerid)
{
new string[256];


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
LACY_GiveMoney(playerid,20000);
RunSystemend =0;
RunPlayers=0;
RunSystemon=0;
CPTriatlon[playerid]=0;
for(new i=0; i<MAX_PLAYERS; i++)
{
format(string,sizeof(string),".ניצח במקום הראשון בטריאטלון! האתגר הסתיים %s",GetName(playerid)),SendClientMessage(i,COLOR_ORANGE,string);

if(Registertrs[i] ==1){
new vehicleids = GetPlayerVehicleID(i);
SetPlayerVirtualWorld(i,0);
SetVehicleVirtualWorld(vehicleids,0);


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




if(YouRegister[playerid] ==1) {
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
SendClientMessage(playerid,COLOR_ORANGE,"!זכית במקום הראשון במירוץ וזכית ב20,000 דולר");
LACY_GiveMoney(playerid,20000);

DriftEnd =0;
WinnerDrift=0;
DriftPlayer=0;
IFDriftOn=0;
DriftCP[playerid]=0;
for(new i=0; i<MAX_PLAYERS; i++)
{

format(string,sizeof(string),".+ ניצח בקרב דריפטים במקום הראשון! הקרב דריפטים הסתיים %s",GetName(playerid)),SendClientMessage(i,COLOR_ORANGE,string);
if(YouRegister[i] ==1){
DisablePlayerRaceCheckpoint(i);
YouRegister[i] =0;
DriftCP[i]=0;
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
if(RaceCP[playerid]==15){
if(WinnerRace ==1){
SendClientMessage(playerid,COLOR_ORANGE,"!זכית במקום הראשון במירוץ וזכית ב20,000 דולר");
new vehicleid = GetPlayerVehicleID(playerid);
SetPlayerVirtualWorld(playerid,0);
SetVehicleVirtualWorld(vehicleid,0);
LACY_GiveMoney(playerid,20000);
RaceEnd =0;
WinnerRace=0;
RacePlayers=0;
IFraceOn=0;
RaceCP[playerid]=0;
for(new i=0; i<MAX_PLAYERS; i++)
{

format(string,sizeof(string),".ניצח בקרב המירוצים במקום הראשון! המשך משחק מהנה לכולם %s",GetName(playerid));
SendClientMessage(i,COLOR_ORANGE,string);

if(Youregisterrace[i] ==1){
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
return 1;
}
public OnPlayerEnterCheckpoint(playerid)
{


if(CPS_IsPlayerInCheckpoint(playerid,pickupammu)) return SetPlayerPos(playerid,290.4897,-84.4233,1001.5156),SetPlayerInterior(playerid,4),ResetPlayerWeapons(playerid);

if(CPS_IsPlayerInCheckpoint(playerid,be)) return SetPlayerPos(playerid,2144.0793,1612.3879,993.6882),SetPlayerInterior(playerid,1),ResetPlayerWeapons(playerid);
if(CPS_IsPlayerInCheckpoint(playerid,nobank))return SetPlayerPos(playerid,1424.9977,-2285.6335,13.3828),SetPlayerInterior(playerid,0);
if(CPS_IsPlayerInCheckpoint(playerid,Wang))return SellWangExportVehicle(playerid);

if(CPS_IsPlayerInCheckpoint(playerid,bcp)){

SendClientMessage(playerid, COLOR_ORANGE,  ".-מנהל הבנק: שלום לך , בבנק שלנו תוכל לשמור את הכסף שלך");
SendClientMessage(playerid, COLOR_ORANGE,  ".לקחת הלוואת , לקנות כרטיס אשראי הבנק שלנו נותן תשרות הטוב ביותר");
SendClientMessage(playerid, COLOR_PURPLE,":פקודות בנק");
SendClientMessage(playerid, 0xFFFF00AA,  "/deposit [amount] /depositall /withdraw [amount] /balance /bankid [playerid] [amount]");
SendClientMessage(playerid, 0xFFFF00AA,  "/getloan (4) [amount] /backloan (4)");
SendClientMessage(playerid,0xFFFF00AA,   "/help bank :לעזרה מפרטת על הבנק");
SendClientMessage(playerid, COLOR_PURPLE,":פקודות כרטיס אשראי");
SendClientMessage(playerid, 0xFFFF00AA,  "/buycc (3) /sellcc (3) /withdrawc (3) [amount]");
SendClientMessage(playerid, 0xFFFF00AA,  "/help cc :לעזרה מפרטת על כרטיס האשראי");
if(PlayerInfo[playerid][GetAloan] ==1) {
new string[256];
format(string, sizeof(string),"%d :שלום לך , אתה חייב לבנק סכום של",PlayerInfo[playerid][MoneyLoan]),SendClientMessage(playerid,red,string),SendClientMessage(playerid,red,".עם לא תחזיר לא תוכל להשתמש בבנק /backloan להחזרת החוב");
}
}

new string[256];
new ownplayer[MAX_PLAYER_NAME];
switch(getCheckpointType(playerid))
{
case CP_PIRATE:
{
SendClientMessage(playerid,COLOR_YELLOW, "!כל עוד שספינת הפיראטים פעילה תוכל לקבל ממנה כסף");
}
case CP_AMMU:
{
SendClientMessage(playerid,COLOR_WHITE,"-- .מערכת נשקים עזרה --");
SendClientMessage(playerid,COLOR_ORANGE,"שלום לך, מוד זה מחזיק מערכת נשקים תמדיים");
SendClientMessage(playerid,COLOR_ORANGE,"ברגע שתקנה נשק הוא ישמר גם אחרי שתצא");
SendClientMessage(playerid,COLOR_GREEN,":פקודות נשקים");
SendClientMessage(playerid,0xFFFF00AA,"/buyweapon (/bw) [id weapon] - לקניית נשק");
SendClientMessage(playerid,0xFFFF00AA,"/weaponlist (/wl) - כדאי לראות את רשימת הנשקים");
SendClientMessage(playerid,0xFFFF00AA,"/armourt (armour) :לקניית מגן תמידי");

}
}
if(getCheckpointType(playerid)>= P_OFFSET) {
SendClientMessage(playerid,COLOR_WHITE,"--. מערכת נכסים זמניים --");
format(string, sizeof(string), "./Buy בעזרת הפקודה %s אתה יכול לקנות את ", propertyNames[playerCheckpoint[playerid]-P_OFFSET], propertyValues[playerCheckpoint[playerid]-P_OFFSET]);
SendClientMessage(playerid, 0xFFFF00AA, string);
format(string, sizeof(string), ".$%d מחיר הנכס ", propertyValues[playerCheckpoint[playerid]-P_OFFSET]);
SendClientMessage(playerid, 0xFFFF00AA, string);
format(string, sizeof(string), ".$%d אתה תרוויח בכל דקה ", propertyEarnings[playerCheckpoint[playerid]-P_OFFSET]);
SendClientMessage(playerid, 0xFFFF00AA, string);


if(propertyOwner[playerCheckpoint[playerid]-P_OFFSET]<999) {
GetPlayerName(propertyOwner[playerCheckpoint[playerid]-P_OFFSET], ownplayer, sizeof(ownplayer));
}


}
return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{

	return 1;
}
public OnPlayerRequestClass(playerid, classid){

SetPlayerInterior(playerid,0);
SetPlayerPos(playerid, 2155.8408,1128.3309,23.3359);
SetPlayerFacingAngle(playerid,64.0857);
SetPlayerCameraPos(playerid,2151.4048,1131.1619,23.3359);
SetPlayerCameraLookAt(playerid, 2155.8408,1128.3309,23.3359);


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
if(!dini_Exists(GetPlayerFile(playerid))) {
format(str, sizeof(str), "/Register [Pass] <> :קודם כל הרשם/י עם לביצוע ההרשמה",0);
SendClientMessage(playerid, COLOR_WHITE , str);
spawnloged[playerid] =1;
return 0;
}
else if(dini_Exists(GetPlayerFile(playerid)) && PlayerInfo[playerid][Logged] == 0)
{
format(str, sizeof(str), "/login [Pass] <> :קודם כל התחבר/י לביצוע החיבור",0);
SendClientMessage(playerid, COLOR_WHITE, str);
spawnloged[playerid] =1;
return 0;
}

format(str, sizeof(str), "~y~Welcome ~y~~h~ %s " , GetName(playerid));
GameTextForPlayer(playerid, str,5000,1);
return 1;
}
//-=-=-=-=-=-=-=-=-=-=-=-
public GameModeExitFunc()
{
//CPS_RemoveCheckpoint(Wang);
GameModeExit();
SaveFiles();
KillTimer(CheckPointTimer);
for(new i=0;i<GetMaxPlayers();i++) {
if(dini_Exists(GetPlayerFile(i))) {


dini_IntSet(GetPlayerFile(i),"ProfileLogeed",PlayerInfo[i][ProfileLogged]);
dini_IntSet(GetPlayerFile(i),"Logged",PlayerInfo[i][Logged]);
dini_IntSet(GetPlayerFile(i),"Kills",PlayerInfo[i][Kills]);
dini_IntSet(GetPlayerFile(i),"Deaths",PlayerInfo[i][Deaths]);
dini_IntSet(GetPlayerFile(i),"Level",PlayerInfo[i][Level]);
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
dini_IntSet(GetPlayerFile(i),"armour",PlayerInfo[i][armourT]);
dini_IntSet(GetPlayerFile(i),"VIP",PlayerInfo[i][VIPS]);
dini_IntSet(GetPlayerFile(i),"CC",PlayerInfo[i][CcMode]);

CPS_RemoveCheckpoint(bcp);
CPS_RemoveCheckpoint(be);



//CPS_RemoveCheckpoint(be1);
}
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
	print(" ");
	print("    ________________________________________________");
	print("=== [ Car System Checking Files And Updating Cars ] ===");
	print(" ");
	printf("                    %d Cars Found",VCount-1);
	print("    ________________________________________________");
	print("=== [     CarID    Info                           ] ===");
	print(" ");

	for (new car=1; car < VCount; car++)
	{
		format(file,sizeof(file),"CarSys/car%d.txt",car);
		if(!dini_Exists(file))
		{
			dini_Create(file); CreateCount++;
		    dini_IntSet(file,"CarID",car);
		    dini_Set(file,"CarName",VehNames[GetVehicleModel(car)-400] );
		    dini_IntSet(file,"CarModel",GetVehicleModel(car));
		    dini_IntSet(file,"CarOwned",0);
		    dini_Set(file,"CarOwner","אין");
		    dini_IntSet(file,"CarLocked",0);
		    dini_IntSet(file,"Buyable",1);
		    dini_IntSet(file,"Price",50000);
		    dini_IntSet(file,"Parkedx",0);
		    dini_IntSet(file,"Parkedy",0);
		    dini_IntSet(file,"Parkedz",0);


   			VehicleInfo[car][CarID] = dini_Int(file,"CarID");
			strmid(VehicleInfo[car][CarName], dini_Get(file,"CarName"), 0, strlen(dini_Get(file,"CarName")), 255);
			VehicleInfo[car][CarModel] = dini_Int(file,"CarModel");
			VehicleInfo[car][CarOwned] = dini_Int(file,"CarOwned");
			strmid(VehicleInfo[car][CarOwner], dini_Get(file,"CarOwner"), 0, strlen(dini_Get(file,"CarOwner")), 255);
			VehicleInfo[car][CarLocked] = dini_Int(file,"CarLocked");
			VehicleInfo[car][Buyable] = dini_Int(file,"Buyable");
			VehicleInfo[car][Parkedx] = dini_Int(file,"Parkedx");
			VehicleInfo[car][Parkedy] = dini_Int(file,"Parkedy");
			VehicleInfo[car][Parkedz] = dini_Int(file,"Parkedz");


   			VPrice[car] = NormPrice;
     		for(new v=0; v < sizeof(boat); v++) if(VehicleInfo[car][CarModel] == boat[v][0])
   				VPrice[car] = BoatPrice;
    		for(new v=0; v < sizeof(bike); v++) if(VehicleInfo[car][CarModel] == bike[v][0])
   				VPrice[car] = BikePrice;
    		for(new v=0; v < sizeof(plane); v++) if(VehicleInfo[car][CarModel] == plane[v][0])
   				VPrice[car] = PlanePrice;
     		for(new v=0; v < sizeof(expensive); v++) if(VehicleInfo[car][CarModel] == expensive[v][0])
   				VPrice[car] = Expensive;
     		for(new v=0; v < sizeof(Vexpensive); v++) if(VehicleInfo[car][CarModel] == Vexpensive[v][0])
   				VPrice[car] = VeryExpensive;

			VehicleInfo[car][Price] = VPrice[car];
			dini_IntSet(file,"Price",VehicleInfo[car][Price]);

   		}
		else if(dini_Exists(file))
		{
			VehicleInfo[car][CarID] = dini_Int(file,"CarID");
			strmid(VehicleInfo[car][CarName], dini_Get(file,"CarName"), 0, strlen(dini_Get(file,"CarName")), 255);
			VehicleInfo[car][CarModel] = dini_Int(file,"CarModel");
			VehicleInfo[car][CarOwned] = dini_Int(file,"CarOwned");
			strmid(VehicleInfo[car][CarOwner], dini_Get(file,"CarOwner"), 0, strlen(dini_Get(file,"CarOwner")), 255);
			VehicleInfo[car][CarLocked] = dini_Int(file,"CarLocked");
			VehicleInfo[car][Buyable] = dini_Int(file,"Buyable");

			VehicleInfo[car][Price] = dini_Int(file,"Price");
			VehicleInfo[car][Parkedx] = dini_Int(file,"Parkedx");
			VehicleInfo[car][Parkedy] = dini_Int(file,"Parkedy");
			VehicleInfo[car][Parkedz] = dini_Int(file,"Parkedz");


		    if(dini_Int(file,"CarOwned") == 1)
		    {
			    printf("           %d       Owner: %s",car,VehicleInfo[car][CarOwner]);

				if((VehicleInfo[car][Parkedx] != 0) && (VehicleInfo[car][Parkedy] != 0)  )
				{
				    DestroyVehicle(car);
				   //	CreateVehicle( VehicleInfo[car][CarModel], VehicleInfo[car][Parkedx], VehicleInfo[car][Parkedy], VehicleInfo[car][Parkedz], VehicleInfo[car][ParkedAngle], VehicleInfo[car][Colour1],  VehicleInfo[car][Colour2], RespawnDelay);
					ParkCount++;
	   			}

//5				if( (VehicleInfo[car][Colour1] != -1) || (VehicleInfo[car][Colour2] != -1) ) { ChangeVehicleColor(car, VehicleInfo[car][Colour1], VehicleInfo[car][Colour2] ); ColourCount++; printf("           %d       Colour Changed", car); }
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
format(file,sizeof(file),"CarSys/car%d.txt",car);
		if(dini_Exists(file))
		{
		    dini_IntSet(file,"CarOwned",VehicleInfo[car][CarOwned]);
		    if(VehicleInfo[car][CarOwned] == 0) dini_Set(file,"CarOwner","אין");
		    if(VehicleInfo[car][CarOwned] == 1) dini_Set(file,"CarOwner",VehicleInfo[car][CarOwner]);
		    dini_IntSet(file,"CarLocked",VehicleInfo[car][CarLocked]);
		    dini_IntSet(file,"Buyable",VehicleInfo[car][Buyable]);
		    dini_IntSet(file,"Price",VehicleInfo[car][Price]);
		    dini_IntSet(file,"Parkedx",VehicleInfo[car][Parkedx]);
		    dini_IntSet(file,"Parkedy",VehicleInfo[car][Parkedy]);
		    dini_IntSet(file,"Parkedz",VehicleInfo[car][Parkedz]);

		}
	}
	print("===[CAR] Car Files Saved");
}
//ENDCAR===
//-=-=-=-=-=-=-
#define MAX_STREAM_OBJECTS 300

enum object_enum
{
	modelid,
	Float:xpos,
	Float:ypos,
	Float:zpos,
	Float:xrot,
	Float:yrot,
	Float:zrot,
	Float:viewdist,
	attached,
	Float:xoff,
	Float:yoff,
	Float:zoff,
	bool:moving,
	Float:movx,
	Float:movy,
	Float:movz,
	Float:speed,
	movetimer,
	id
}

enum player_enum
{
	pobjects[MAX_STREAM_OBJECTS],
	bool:seen[MAX_STREAM_OBJECTS]
}

new Objects[MAX_STREAM_OBJECTS][object_enum];
new PlayerObjects[MAX_PLAYERS][player_enum];
new created;

Objectnearplayer(Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2, Float:dist)
{
	x1 -= x2;
	y1 -= y2;
	z1 -= z2;
	return ((x1 * x1) + (y1 * y1) + (z1 * z1) <= dist * dist);
}

Float:GetDistance(Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2)
{
	return Float:floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
}

forward Core_CreateStreamObject(modelid2,Float:xpos2,Float:ypos2,Float:zpos2,Float:xrot2,Float:yrot2,Float:zrot2,Float:viewdist2);
public Core_CreateStreamObject(modelid2,Float:xpos2,Float:ypos2,Float:zpos2,Float:xrot2,Float:yrot2,Float:zrot2,Float:viewdist2)
{
	new i;
	for (i=0; i<MAX_STREAM_OBJECTS; i++)
	{
	    if (Objects[i][modelid] == 0)
	    {
	        Objects[i][modelid] = modelid2;
		    Objects[i][xpos] = xpos2;
		    Objects[i][ypos] = ypos2;
		    Objects[i][zpos] = zpos2;
		    Objects[i][xrot] = xrot2;
		    Objects[i][yrot] = yrot2;
		    Objects[i][zrot] = zrot2;
		    Objects[i][viewdist] = viewdist2;
		    Objects[i][attached] = -1;
		    Objects[i][moving] = false;
		    Objects[i][id] = i;
		    if (created < i)
		    {
		    	created = i;
			}
		    break;
		}
	}
	return i;
}

forward Core_DestroyStreamObject(id2);
public Core_DestroyStreamObject(id2)
{
 	Objects[id2][modelid] = 0;
 	KillTimer(Objects[id2][movetimer]);
	for (new i=0; i<MAX_PLAYERS; i++)
	{
	    if (IsPlayerConnected(i))
	    {
		    if (PlayerObjects[i][seen][id2] == true)
		    {
      			DestroyPlayerObject(i,PlayerObjects[i][pobjects][id2]);
		        PlayerObjects[i][seen][id2] = false;
			}
		}
	}
}

forward Float:Core_GetXPos(id2);
public Float:Core_GetXPos(id2)
{
	return Objects[id2][xpos];
}

forward Float:Core_GetYPos(id2);
public Float:Core_GetYPos(id2)
{
	return Objects[id2][ypos];
}

forward Float:Core_GetZPos(id2);
public Float:Core_GetZPos(id2)
{
	return Objects[id2][zpos];
}

forward Float:Core_GetXRot(id2);
public Float:Core_GetXRot(id2)
{
	return Objects[id2][xrot];
}

forward Float:Core_GetYRot(id2);
public Float:Core_GetYRot(id2)
{
	return Objects[id2][yrot];
}

forward Float:Core_GetZRot(id2);
public Float:Core_GetZRot(id2)
{
	return Objects[id2][zrot];
}

forward Core_SetStreamObjectPos(id2,Float:xpos2,Float:ypos2,Float:zpos2);
public Core_SetStreamObjectPos(id2,Float:xpos2,Float:ypos2,Float:zpos2)
{
    Objects[id2][xpos] = xpos2;
    Objects[id2][ypos] = ypos2;
    Objects[id2][zpos] = zpos2;
    for (new i=0; i<MAX_PLAYERS; i++)
    {
        if (IsPlayerConnected(i))
        {
        	if (PlayerObjects[i][seen][id2] == true)
        	{
        	    SetPlayerObjectPos(i,PlayerObjects[i][pobjects][id2],xpos2,ypos2,zpos2);
			}
		}
	}
}

forward Core_SetStreamObjectRot(id2,Float:xrot2,Float:yrot2,Float:zrot2);
public Core_SetStreamObjectRot(id2,Float:xrot2,Float:yrot2,Float:zrot2)
{
    Objects[id2][xrot] = xrot2;
    Objects[id2][yrot] = yrot2;
    Objects[id2][zrot] = zrot2;
    for (new i=0; i<MAX_PLAYERS; i++)
    {
        if (IsPlayerConnected(i))
        {
        	if (PlayerObjects[i][seen][id2] == true)
        	{
        	    SetPlayerObjectRot(i,PlayerObjects[i][pobjects][id2],xrot2,yrot2,zrot2);
			}
		}
	}
}

forward Core_AttachStreamObjectToPlayer(id2,playerid,Float:xoff2,Float:yoff2,Float:zoff2,Float:xrot2,Float:yrot2,Float:zrot2);
public Core_AttachStreamObjectToPlayer(id2,playerid,Float:xoff2,Float:yoff2,Float:zoff2,Float:xrot2,Float:yrot2,Float:zrot2)
{
    Objects[id2][attached] = playerid;
    Objects[id2][xoff] = xoff2;
    Objects[id2][yoff] = yoff2;
    Objects[id2][zoff] = zoff2;
    Objects[id2][xrot] = xrot2;
    Objects[id2][yrot] = yrot2;
    Objects[id2][zrot] = zrot2;
    for (new i=0; i<MAX_PLAYERS; i++)
    {
        if (IsPlayerConnected(i))
        {
        	if (PlayerObjects[i][seen][id2] == true)
        	{
 				AttachPlayerObjectToPlayer(i,PlayerObjects[i][pobjects][id2],playerid,xoff2,yoff2,zoff2,xrot2,yrot2,zrot2);
			}
		}
	}
}

forward Core_MoveStreamObject(id2,Float:movx2,Float:movy2,Float:movz2,Float:speed2);
public Core_MoveStreamObject(id2,Float:movx2,Float:movy2,Float:movz2,Float:speed2)
{
    Objects[id2][moving] = true;
    Objects[id2][movx] = movx2;
    Objects[id2][movy] = movy2;
    Objects[id2][movz] = movz2;
    Objects[id2][speed] = speed2;
    for (new i=0; i<MAX_PLAYERS; i++)
    {
        if (IsPlayerConnected(i))
        {
        	if (PlayerObjects[i][seen][id2] == true)
        	{
				MovePlayerObject(i,PlayerObjects[i][pobjects][id2],movx2,movy2,movz2,speed2);
   			}
		}
	}
	new Float:time = (GetDistance(Objects[id2][xpos],Objects[id2][ypos],Objects[id2][zpos],movx2,movy2,movz2)/speed2)/1.17;
	new bool:xisbigger = (movx2 >= Objects[id2][xpos]) ? true : false;
	new bool:yisbigger = (movy2 >= Objects[id2][ypos]) ? true : false;
	new bool:zisbigger = (movz2 >= Objects[id2][zpos]) ? true : false;
	new xadd = (time == 0.0) ? 0 : (xisbigger) ? floatround(((movx2 - Objects[id2][xpos])/time),floatround_ceil) : floatround(((movx2 - Objects[id2][xpos])/time),floatround_floor);
	new yadd = (time == 0.0) ? 0 : (yisbigger) ? floatround(((movy2 - Objects[id2][ypos])/time),floatround_ceil) : floatround(((movy2 - Objects[id2][ypos])/time),floatround_floor);
	new zadd = (time == 0.0) ? 0 : (zisbigger) ? floatround(((movz2 - Objects[id2][zpos])/time),floatround_ceil) : floatround(((movz2 - Objects[id2][zpos])/time),floatround_floor);
	KillTimer(Objects[id2][movetimer]);
	Objects[id2][movetimer] = SetTimerEx("MoveTimer",1000,1,"iiiibbb",id2,xadd,yadd,zadd,xisbigger,yisbigger,zisbigger);
}

forward Core_MidoStreamDisconnect(playerid);
public Core_MidoStreamDisconnect(playerid)
{
	for (new i=0; i<=created; i++)
	{
	    if (PlayerObjects[playerid][seen][i] == true)
	    {
	        DestroyPlayerObject(playerid,PlayerObjects[playerid][pobjects][i]);
	        PlayerObjects[playerid][seen][i] = false;
		}
	}
}



public OnGameModeInit()
{
//=[Timer`s]=================================================
SetTimer("AntiMinigun",4000,1);
SetTimer("AntiBaz",4000,1);
SetTimer("GateMove",1000,1);
SetTimer("KickUpdate", 100, 1);
SetTimer("Levels",1000, 1);
CheckPointTimer = SetTimer("checkpointUpdate",100, 1);
SetTimer("LoadFiles",4000,0);
SetTimer("loan",60*60*1000,1);
SetTimer("UpdateSpeed",1000, 1);
SetTimer("CWarnings",1000,1);
SetTimer("rspam",3000,1);
SetTimer("rrr",5*60*1000,1);
SetTimer("ss",45*60*1000,1);
SetTimer("MissoinpointUpdate",1000,1);
SetTimer("MoneyGrubScoreUpdate", 1000, 1);
SetTimer("checkpointUpdate", 1100, 1);
SetTimer("PirateShipScoreUpdate",3000, 1);
SetTimer("StreamTimer", 500, 1);
SetTimer("SavedUpdate",60017, 1);
SetTimer("TimeUpdate",12*60*1000,1);
SetTimer("PropertyScoreUpdate", 40005, 1);
SetTimer("GambleUpdate", 5013, 1);
SetTimer("SavedUpdate",60017, 1);
SetTimer("Rhelp",20*1000,1);
SetTimer("Rcall",120*1000,1);
SetTimer("Rpet",2*1000,1);
SetTimer("LevelUp",120*60,1);
SetTimer("CafolMoneyGemel",60*60*1000,1);
SetTimer("AutoChangeHN", 2000, 1);
#if MONEY_CHEAT_USE
SetTimer("moneycheat_check", MONEY_CHEAT_TIMER, 1);
#endif
//=[TextDraw`s]====================================================
Textdraw1 = TextDrawCreate(1.00000,420.000000,"~l~www.Satla-Zone.co.il - DeatchMatch");
TextDrawAlignment(Textdraw1,1);
TextDrawBackgroundColor(Textdraw1,-0x1E2E29FF-6);
TextDrawFont(Textdraw1,1);
TextDrawLetterSize(Textdraw1,0.5,1.1);
TextDrawSetOutline(Textdraw1,1);
TextDrawSetProportional(Textdraw1,1);
TextDrawSetShadow(Textdraw1,1);
//=[Fixesystem]====================================================
RaceEnd=1;
//=[Checkpoint]====================================================
Wang       = CPS_AddCheckpoint(-1919.0795,303.1454,41.0469,2.5,50);
bcp        = CPS_AddCheckpoint(2143.9777,1640.0800,993.5761,2.5,50);
be         = CPS_AddCheckpoint(1448.8737,-2287.2822,13.5469,1.5,50);
pickupammu = CPS_AddCheckpoint(1022.4660,-1122.3158,23.8713,1.3,12);
nobank     = CPS_AddCheckpoint(2144.0898,1607.6897,993.6882,1.5,50);
//=[Function]=====================================================
ShowPlayerMarkers(1);
ShowNameTags(1);
UsePlayerPedAnims();
AllowAdminTeleport(1/1);
EnableTirePopping(0);
EnableStuntBonusForAll(0);
AllowInteriorWeapons(10);
//=[Pickup`s]====================================================
//Weed`s:
Weed[0] = AddStaticPickup(1279, 15, 2199.3457,940.7413,10.8203);
Weed[1] = AddStaticPickup(1279, 15, 1600.4449,1160.7339,10.8125);
Weed[2] = AddStaticPickup(1279, 15, 2590.3806,1656.5795,11.0234);
Weed[3] = AddStaticPickup(1279, 15, 2495.2344,1859.9387,13.6379);
Weed[4] = AddStaticPickup(1279, 15, 2503.3037,-1701.1526,13.5491);
AddStaticPickup(359,2,209.8301,1858.4603,13.1406); //rpg2
AddStaticPickup(343,2,205.1742,1864.9158,13.1406); //Tear Gas2
//=[PlayerClass]=================================================
AddPlayerClass(1,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(2,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(293,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(290,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(291,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(292,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(294,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(295,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(296,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(297,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(298,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(299,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(277,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(278,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(279,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(288,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(47,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(48,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(49,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(50,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(51,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(52,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(53,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(54,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(55,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(56,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(57,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(58,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(59,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(60,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(61,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(62,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(63,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(64,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(66,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(67,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(68,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(69,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(70,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(71,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(72,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(73,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(75,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(76,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(78,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(79,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(80,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(81,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(82,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(83,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(84,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(85,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(87,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(88,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(89,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(91,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(92,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(93,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(95,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(96,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(97,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(98,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(99,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(100,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(101,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(102,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(103,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(104,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(105,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(106,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(107,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(108,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(109,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(110,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(111,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(112,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(113,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(114,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(115,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(116,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(117,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(118,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(120,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(121,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(122,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(123,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(124,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(125,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(126,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(127,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(128,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(129,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(131,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(133,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(134,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(135,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(136,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(137,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(138,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(139,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(140,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(141,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(142,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(143,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(144,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(145,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(146,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(147,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(148,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(150,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(151,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(152,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(153,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(154,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(155,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(156,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(157,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(158,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(159,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(160,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(161,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(162,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(163,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(164,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(165,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(166,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(167,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(168,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(169,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(170,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(171,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(172,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(173,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(174,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(175,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(176,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(177,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(178,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(179,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(180,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(181,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(182,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(183,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(184,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(185,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(186,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(187,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(188,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(189,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(190,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(191,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(192,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(193,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(194,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(195,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(196,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(197,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(198,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(199,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(200,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(201,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(202,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(203,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(204,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(205,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(206,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(207,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(209,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(210,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(211,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(212,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(213,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(214,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(215,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(216,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(217,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(218,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(219,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(220,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(221,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(222,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(223,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(224,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(225,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(226,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(227,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(228,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(229,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(230,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(231,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(232,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(233,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(234,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(235,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(236,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(237,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(238,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(239,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(240,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(241,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(242,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(243,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(244,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(245,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(246,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(247,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(248,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(249,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(250,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(251,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);
AddPlayerClass(253,2056.5640,840.7169,6.7260,269.1425,0,0,24,300,-1,-1);

//==[Car`s]==============================================================================
//Other:
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
AddStaticVehicle(522,1775.5903,893.0415,26.4481,34.2547,7,79); // NRG- 500 On Roof
AddStaticVehicle(522,1782.1559,884.3701,26.4551,39.8569,7,79); // NRG- 500 On Roof
AddStaticVehicle(522,1772.7963,895.1856,26.4488,302.6107,7,79); // NRG- 500 On Roof
AddStaticVehicle(522,1782.2245,881.4796,26.4531,132.9686,7,79); // NRG- 500 On Roof
AddStaticVehicle(481,1541.8641,-1368.9618,328.9701,188.6927,46,46); // Tower
AddStaticVehicle(481,1545.6382,-1372.3322,328.9829,177.5936,6,6); // Tower
AddStaticVehicle(522,1552.3627,-1367.2386,329.0129,256.9888,7,79); // Tower
AddStaticVehicle(522,1552.3279,-1365.2297,329.0165,267.8723,0,0); // Tower
AddPlayerClass(1,-1631.0262,1419.6545,7.1875,311.6078,0,0,0,0,0,0); // teleports docks
AddStaticVehicle(522,-1619.2017,1422.8654,6.2231,322.7849,8,82); // NRG-500 Docks
AddStaticVehicle(522,-1617.0688,1420.7104,6.2286,316.3569,6,25); // NRG-500 Docks
AddStaticVehicle(446,-1547.5950,1461.3035,-0.3796,229.6041,3,3); // boat docks
AddStaticVehicle(595,-1545.7239,1432.8759,0.3090,229.3205,112,20); // boat docks
AddStaticVehicle(473,-1530.5471,1420.0940,-0.0530,220.3543,56,53); // boat docks
AddStaticVehicle(493,-1586.5896,1419.8721,-0.0586,231.2829,36,13); // boat docks
AddStaticVehicle(472,-1583.0050,1423.7670,-0.0556,224.2101,56,15); // boat docks
AddStaticVehicle(484,-1574.1376,1429.5065,0.3448,227.7396,50,32); // boat docks
AddPlayerClass(1,-2415.9922,-587.2974,132.7586,214.4959,0,0,0,0,0,0); // drift 2
AddStaticVehicle(541,-2414.4514,-586.9969,132.2690,214.4952,22,1); // drift 2
AddStaticVehicle(541,-2411.8425,-585.0082,132.2690,215.0867,86,6); // drift 2
AddStaticVehicle(451,-2400.0386,-589.3455,132.3544,124.6732,123,123); // drift 2
AddStaticVehicle(451,-2398.1990,-591.8680,132.3351,124.4981,36,36); // drift 2
AddStaticVehicle(451,-2396.1416,-594.5746,132.3348,123.8432,16,16); // drift 2
AddStaticVehicle(411,-2397.1367,-611.5197,132.3767,34.8895,75,1); // drift 2
//drift:
DriftZibori=AddStaticVehicle(568,-302.6403,1552.9385,75.2212,315.1620,56,29); //
DriftZibori1=AddStaticVehicle(468,-306.8715,1556.4517,75.0231,304.2789,6,6); //
DriftZibori2=AddStaticVehicle(468,-309.5418,1559.0822,75.0532,317.2950,53,53); //
DriftZibori3=AddStaticVehicle(451,-293.9301,1573.5503,75.0552,134.0287,123,123); //
DriftZibori4=AddStaticVehicle(451,-296.1785,1575.9091,75.0684,131.8275,125,125); //
DriftZibori5=AddStaticVehicle(495,-270.8748,1551.7755,75.6830,134.4523,6,6); //
DriftZibori6=AddStaticVehicle(495,-268.6550,1548.7106,75.6994,131.8289,1,1); //
DriftZibori7=AddStaticVehicle(495,-266.3898,1546.2604,75.7147,131.3287,3,3); //
DriftZibori8=AddStaticVehicle(495,-264.2098,1544.0552,75.7135,133.1902,0,0); //
DriftZibori9=AddStaticVehicle(451,-2394.6299,-596.7819,132.3545,125.7884,46,46); // Cars Drift Turmiso
DriftZibori10=AddStaticVehicle(451,-2392.8037,-599.4668,132.3549,307.0936,123,123); // Cars Drift Turmiso
DriftZibori11=AddStaticVehicle(451,-2391.4617,-601.8436,132.3547,303.2639,36,36); // Cars Drift Turmiso
DriftZibori12=AddStaticVehicle(451,-2392.2429,-607.9014,132.3545,212.7252,36,36); // Cars Drift Turmiso
DriftZibori13=AddStaticVehicle(451,-2394.5376,-609.9025,132.3549,214.5427,36,36); // Cars Drift Turmiso
DriftZibori14=AddStaticVehicle(451,-2399.5781,-613.1229,132.3577,215.3579,36,36); // Cars Drift Turmiso
DriftZibori15=AddStaticVehicle(451,-2416.8135,-588.8311,132.3573,215.3587,36,36); // Cars Drift Turmiso
DriftZibori16=AddStaticVehicle(451,-2409.1899,-583.8365,132.3553,35.2171,36,36); // Cars Drift Turmiso
//main:
AddStaticVehicle(565,1555.8459,2751.5300,10.4462,269.6317,62,62); //
AddStaticVehicle(545,1597.0334,2834.4602,10.6313,0.0475,40,96); //
AddStaticVehicle(411,2297.7175,2528.5786,10.5368,270.3729,22,22); //
AddStaticVehicle(522,1893.8524,2115.7625,10.4177,359.9979,75,1); //
AddStaticVehicle(545,1634.2186,2082.1187,10.9931,269.5952,53,53); //
AddStaticVehicle(560,1512.3464,2001.3075,10.6885,180.2998,97,96); //
AddStaticVehicle(541,1603.3695,1839.0663,10.5446,179.6657,2,78); //
AddStaticVehicle(429,1623.2260,1850.8583,10.4452,1.6924,2,0); //
AddStaticVehicle(402,1529.8992,1019.6284,10.5841,1.1433,97,1); //
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
//Race:
zibro = AddStaticVehicle(451,2072.3340,824.2792,6.6042,39.6250,65,65); // a new race
zibro2 =AddStaticVehicle(451,2068.1316,823.8341,6.6358,30.0972,44,44); // a new race
zibro3 =AddStaticVehicle(451,2063.9031,823.7260,6.6593,26.6140,100,100); // a new race
zibro4 =AddStaticVehicle(451,2060.0249,823.3692,6.6860,29.1756,101,101); // a new race
zibro5 =AddStaticVehicle(451,2056.3799,822.9109,6.7383,29.6953,42,43); // a new race
zibro6 =AddStaticVehicle(451,2077.9331,822.2661,6.8169,6.7957,42,43); // a new race
zibro7=AddStaticVehicle(451,2051.0386,822.0812,6.8364,353.0449,65,65); // a new race
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
zibro8 =AddStaticVehicle(522,1863.7234,-1394.6096,13.0498,268.9947,6,25); //
zibro9 =AddStaticVehicle(522,1863.8091,-1395.6031,13.0358,267.8712,7,79); //
zibro10 =AddStaticVehicle(522,1863.7592,-1396.6364,13.0446,267.8714,8,82); //
zibro11 =AddStaticVehicle(522,1863.7101,-1397.6697,13.0417,267.8644,36,105); //
zibro12 =AddStaticVehicle(522,1863.6615,-1398.7030,13.0409,267.8569,39,106); //
zibro13=AddStaticVehicle(522,1863.6136,-1399.7357,13.0429,267.8431,51,118); //
zibro14 =AddStaticVehicle(522,1863.6149,-1400.7690,13.0617,267.6460,3,3); //
zibro15 =AddStaticVehicle(522,1863.7233,-1401.7936,13.0388,267.1754,6,25); //
zibro16 =AddStaticVehicle(522,1863.6193,-1368.1034,13.0692,269.7050,3,8); //
//sf:
AddStaticVehicle(522,-2127.5107,921.3911,79.4371,89.6080,6,25); //
AddStaticVehicle(522,-2127.8635,922.5790,79.4558,83.5254,3,8); //
AddStaticVehicle(415,-2157.3281,942.0902,79.7814,271.1159,40,1); //
AddStaticVehicle(567,-2157.1692,960.2592,79.8709,273.6004,93,64); //
AddStaticVehicle(429,-2157.5244,979.3433,79.6846,270.1410,121,1); //
AddStaticVehicle(567,-2129.4805,983.3358,79.8722,90.0618,97,96); //
AddStaticVehicle(411,-2132.1001,947.2926,79.7268,90.0917,112,1); //
AddStaticVehicle(541,-2128.5049,1000.6512,79.6158,87.5043,68,8); //
//AirPort:
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
AddPlayerClass(1,-1494.6637,-249.2101,14.1484,2.4414,0,0,0,0,0,0); //
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
AddStaticVehicle(452,-2312.3179,2313.6309,-0.5744,180.0348,1,3); // shiptripcar
AddStaticVehicle(452,-2312.9731,2296.2407,-0.4951,174.5892,1,3); // shiptripcar
AddStaticVehicle(452,-2309.2078,2284.2944,-0.4638,211.1719,1,3); // shiptripcar
AddStaticVehicle(452,-2302.3416,2264.3130,-0.6332,177.7998,1,3); // shiptripcar
AddStaticVehicle(452,-2300.4570,2232.7966,-0.4514,179.6083,1,3); // shiptripcar
AddPlayerClass(0,-2453.9746,2247.8186,4.9141,191.4004,0,0,0,0,0,0); // /bustrip
AddStaticVehicle(437,-2446.9626,2240.6790,4.9573,0.8033,105,80); // /bustrip
AddStaticVehicle(437,-2440.9917,2240.7529,4.9324,0.1807,98,80); // /bustripcar
AddStaticVehicle(437,-2458.7395,2226.5779,4.9937,180.6802,95,16); // /bustripcar
AddStaticVehicle(437,-2464.6602,2226.4697,4.9936,180.5578,87,7); // /bustripcar
AddStaticVehicle(437,-2470.7017,2226.5051,4.9432,180.2185,79,7); // /bustripcar
AddStaticVehicle(431,-2482.5310,2226.5181,4.9540,180.0431,75,59); // /bustripcar
AddStaticVehicle(538,2864.7500,1285.0447,11.2473,0.0000,1,71);
//ship(`goat`):
//=[ObjectStreamers]====================================================================
//Other:
ship = CreateStreamObject(1469, 1863.307739, 1529.444336, 24.975296, 0.0000, 0.0000, 0.0002,60);
CreateStreamObject(1521, 2005.183228, 1535.572266, 12.192604, 0.0000, 0.0000, 91.7189,80);
CreateStreamObject(3528, 2027.040283, 1539.999023, 12.709496, 0.0000, 0.0000, 354.8434,80);
CreateStreamObject(3528, 2028.901367, 1550.231689, 12.709496, 0.0000, 0.0000, 350.8555,80);
CreateStreamObject(8483, 2056.398682, 799.681274, 15.326651, 0.0000, 0.0000, 90.0000,80);
CreateStreamObject(7392, 2056.417480, 974.007202, 16.701519, 10.2096, 358.2811, 0.6959,80);
CreateStreamObject(1632, 1822.964478, 886.821411, 10.620605, 0.0000, 0.0000, 88.2038,80);
CreateStreamObject(1632, 1819.597900, 886.963928, 12.258593, 8.5944, 0.0000, 88.2038,80);
CreateStreamObject(3471, 2031.053223, 1330.126831, 11.094852, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(3471, 2030.833374, 1356.912720, 11.094852, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(3521, 2031.071289, 1323.813232, 11.373289, 0.0000, 0.0000, 270.0000,80);
CreateStreamObject(3521, 2030.774658, 1361.114624, 11.373289, 0.0000, 0.0000, 270.0000,80);
CreateStreamObject(4238, 2006.695435, 911.442200, 12.674721, 0.0000, 0.0000, 29.4529,80);
CreateStreamObject(4730, 1987.682861, 912.715088, 11.501682, 0.0000, 0.0000, 6.9528,80);
CreateStreamObject(6056, 2144.087891, 978.845154, 15.084970, 0.0000, 0.0000, 180.0000,80);
CreateStreamObject(7093, 2023.679199, 1532.308350, 19.173138, 0.8594, 0.0000, 267.4217,80);
CreateStreamObject(7415, 1813.108032, 840.828003, 19.468224, 0.0000, 0.0000, 26.7971,80);
CreateStreamObject(8323, 2358.169434, 1411.395508, 48.736763, 0.0000, 0.0000, 183.0334,80);
CreateStreamObject(8406, 2304.989990, 1383.547485, 14.620664, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(8406, 2304.646240, 1522.896729, 14.495666, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(10281, 2386.719238, 1042.336304, 14.999988, 0.0000, 335.9358, 356.5623,80);
CreateStreamObject(10838, 2057.729492, 842.475708, 21.946510, 0.0000, 0.0000, 90.0000,80);
CreateStreamObject(13722, 2138.839844, 847.560974, 21.128393, 0.0000, 0.0000, 269.9227,80);
CreateStreamObject(13831, 2139.185303, 847.403442, 19.321938, 0.0000, 0.0000, 270.0000,80);
CreateStreamObject(14467, 2157.463867, 948.656189, 12.694424, 0.0000, 0.0000, 333.9849,80);
CreateStreamObject(14467, 2157.372559, 938.326599, 12.554106, 0.0000, 0.0000, 236.2500,80);
CreateStreamObject(3877, 1996.332886, 1519.762207, 17.728241, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(3877, 2004.916992, 1520.038086, 17.733902, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(3877, 2003.205933, 1565.927368, 16.032928, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(3877, 1997.861450, 1565.795044, 16.032928, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1341, 2036.475098, 1589.429077, 10.822899, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1342, 2036.734131, 1074.655029, 10.854006, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1568, 2020.567993, 1541.135986, 9.834606, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1568, 2011.153809, 1541.003296, 11.042246, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1568, 2020.679199, 1549.083618, 9.849119, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1568, 2011.512451, 1548.672485, 10.975269, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(2780, 1817.707031, 885.646667, 4.090013, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(2773, 2020.581543, 1346.004883, 10.337541, 0.0000, 0.0000, 270.0000,80);
CreateStreamObject(2773, 2023.320068, 1346.016846, 10.330208, 0.0000, 0.0000, 270.0000,80);
CreateStreamObject(2773, 2026.446777, 1346.018188, 10.337541, 0.0000, 0.0000, 270.0000,80);
CreateStreamObject(2773, 2020.622803, 1340.653931, 10.330207, 0.0000, 0.0000, 270.0000,80);
CreateStreamObject(2773, 2023.500366, 1340.745117, 10.337541, 0.0000, 0.0000, 270.0000,80);
CreateStreamObject(2773, 2026.364380, 1340.791870, 10.337541, 0.0000, 0.0000, 270.0000,80);
CreateStreamObject(12922, 2083.201660, 1433.632813, 12.732338, 0.0000, 0.0000, 270.0000,80);
CreateStreamObject(1327, 2015.759277, 904.515564, 9.788302, 0.0000, 90.2408, 151.4839,80);
CreateStreamObject(1327, 2016.121582, 905.475098, 10.413293, 0.0000, 140.0882, 97.8895,80);
CreateStreamObject(1331, 2012.047852, 903.853455, 10.742380, 0.0000, 0.0000, 180.0000,80);
CreateStreamObject(1333, 2009.873047, 903.868958, 10.742380, 0.0000, 0.0000, 180.0000,80);
CreateStreamObject(1334, 2007.257568, 903.936157, 10.916950, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1338, 2016.412354, 907.317383, 10.531622, 0.0000, 0.0000, 270.0000,80);
CreateStreamObject(1349, 2004.325562, 904.898193, 10.390697, 0.0000, 0.0000, 337.5000,80);
CreateStreamObject(1349, 2003.087280, 904.955383, 10.390697, 0.0000, 0.0000, 270.0000,80);
CreateStreamObject(1349, 2001.722900, 904.852356, 10.390697, 0.0000, 0.0000, 213.7500,80);
CreateStreamObject(1359, 2035.738892, 866.849243, 6.624629, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(8171, 2068.853760, 842.826782, 5.844077, 0.0000, 0.0000, 90.0002,80);
CreateStreamObject(1632, 2110.957764, 1740.062866, 10.795429, 0.0000, 0.0000, 336.6406,80);
CreateStreamObject(4874, 1379.834717, 1842.699341, 13.684551, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(9241, 1286.732788, 1470.185669, 11.554216, 0.0000, 0.0000, 179.1405,80);
CreateStreamObject(9241, 1286.663818, 1435.693726, 11.504217, 0.0000, 0.0000, 180.0000,80);
CreateStreamObject(10757, 1594.513306, 1448.850464, 34.005112, 0.0000, 339.3735, 270.8595,80);
CreateStreamObject(1634, 1469.912476, 1163.807739, 14.558545, 6.0161, 0.0000, 182.6556,80);
CreateStreamObject(2931, 1523.538696, 1314.982544, 9.905440, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(2931, 1523.696411, 1314.505737, 9.980291, 0.0000, 0.8594, 179.2178,80);
CreateStreamObject(3270, 1537.623657, 1800.020630, 11.105236, 0.0000, 0.0000, 281.2500,80);
CreateStreamObject(3663, 1526.734253, 1795.381348, 11.901086, 0.0000, 0.0000, 202.5000,80);
CreateStreamObject(16098, 1544.579834, 1822.750610, 14.385656, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(3270, 1537.034424, 1844.059082, 9.030268, 0.0000, 0.0000, 96.9529,80);
CreateStreamObject(981, 1530.249512, 1785.831909, 10.771800, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(981, 1513.904175, 1802.909790, 10.771800, 0.0000, 0.0000, 270.0000,80);
CreateStreamObject(981, 1513.921631, 1840.727905, 10.771800, 0.0000, 0.0000, 270.0000,80);
CreateStreamObject(983, 1513.951782, 1821.859863, 10.503867, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(983, 1514.011108, 1858.825684, 10.503867, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(983, 1548.149048, 1785.178223, 10.503867, 0.0000, 0.0000, 90.0000,80);
CreateStreamObject(983, 1553.421265, 1785.164063, 10.503867, 0.0000, 0.0000, 90.0000,80);
CreateStreamObject(1237, 1513.277344, 1799.394897, 9.823194, 0.0000, 0.0000, 348.7500,80);
CreateStreamObject(1237, 1513.516724, 1806.921265, 9.823194, 0.0000, 0.0000, 348.7500,80);
CreateStreamObject(1237, 1513.789551, 1837.206787, 9.823194, 0.0000, 0.0000, 348.7500,80);
CreateStreamObject(1237, 1513.700439, 1845.045654, 9.823194, 0.0000, 0.0000, 348.7500,80);
CreateStreamObject(1237, 1514.138184, 1787.036499, 9.823194, 0.0000, 0.0000, 348.7500,80);
CreateStreamObject(1237, 1526.521606, 1785.383789, 9.823194, 0.0000, 0.0000, 348.7500,80);
CreateStreamObject(1237, 1533.791626, 1785.558105, 9.823194, 0.0000, 0.0000, 348.7500,80);
CreateStreamObject(1427, 1515.066528, 1785.984985, 10.367456, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(13639, 2039.699951, 941.245544, 8.462364, 0.0000, 0.0000, 0.8594,80);
CreateStreamObject(13641, 1520.227051, 1458.422729, 11.386656, 0.0000, 359.1406, 269.1406,80);
CreateStreamObject(13641, 1521.256836, 1425.973267, 11.583389, 0.0000, 0.0000, 88.2811,80);
CreateStreamObject(13645, 2039.580444, 1244.791016, 10.414734, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(13645, 2074.901367, 1254.072510, 10.414734, 0.0000, 0.0000, 180.0000,80);
CreateStreamObject(16367, 2076.855713, 1390.667480, 11.430763, 0.0000, 0.0000, 270.0000,80);
CreateStreamObject(16367, 2038.542236, 1641.391479, 11.430763, 0.0000, 0.0000, 90.0000,80);
CreateStreamObject(18451, 2092.509766, 1669.401001, 10.332739, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1633, 2126.290771, 1561.824707, 11.045605, 6.0161, 0.0000, 270.0000,80);
CreateStreamObject(1632, 2129.492920, 1561.840088, 12.095461, 12.8916, 0.0000, 270.0000,80);
CreateStreamObject(1632, 2133.081299, 1561.796387, 15.882353, 37.8152, 0.0000, 270.0000,80);
CreateStreamObject(1632, 2135.035645, 1561.790283, 21.234959, 55.0039, 0.0000, 269.1406,80);
CreateStreamObject(1632, 2135.052734, 1561.818848, 26.169271, 75.6304, 0.0000, 269.0632,80);
CreateStreamObject(1632, 2133.638672, 1561.831177, 31.011534, 93.6785, 0.0000, 269.9227,80);
CreateStreamObject(1632, 2131.579590, 1561.875610, 33.389366, 134.9316, 0.0000, 269.9227,80);
CreateStreamObject(1632, 2126.589600, 1561.924194, 35.017273, 144.3855, 0.0000, 269.9227,80);
CreateStreamObject(1632, 2119.480225, 1561.946045, 35.503044, 162.4338, 0.0000, 269.9227,80);
CreateStreamObject(1632, 2113.780518, 1562.014404, 32.454811, 196.8115, 359.1406, 269.0632,80);
CreateStreamObject(1632, 2111.317627, 1561.882568, 25.838625, 257.8315, 0.0000, 271.6415,80);
CreateStreamObject(1632, 2112.813477, 1561.916504, 20.722181, 269.0040, 359.1406, 271.6415,80);
CreateStreamObject(1568, 1996.114380, 1541.067017, 12.596844, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1568, 1996.465332, 1547.827881, 12.596844, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1696, 2060.131348, 1743.437256, 10.929100, 11.1727, 0.0000, 157.5000,80);
CreateStreamObject(5152, 2115.940430, 1763.217651, 11.193490, 359.1406, 336.7952, 348.7500,80);






LEVEL = TextDrawCreate(547.0, 24.0,"~W~LEVEL:");
LEVELTEXT = TextDrawCreate(600.1, 24.0,"0");
TextDrawLetterSize(LEVELTEXT, 0.5, 1.0);
TextDrawLetterSize(LEVEL, 0.5, 1.0);
TextDrawFont(LEVEL, 3);
//--




gateb = CreateStreamObject(2634,2144.19,1627.1,994.257,0,0,180,120);



CreateStreamObject(8210, 207.611267, 2477.144775, 18.585402, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(8210, 234.517838, 2504.629395, 18.585402, 0.0000, 0.0000, 91.1003,80);
CreateStreamObject(8210, 206.489853, 2531.725586, 18.586243, 0.0000, 0.0000, 180.4818,80);
CreateStreamObject(987, 178.609863, 2531.810791, 15.778118, 0.0000, 0.0000, 272.3375,80);
CreateStreamObject(987, 180.233917, 2488.577148, 15.484375, 0.0000, 0.0000, 268.8997,80);
CreateStreamObject(3279, 184.537628, 2526.985596, 15.860313, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(987, 180.377686, 2497.536865, 15.484375, 0.0000, 0.0000, 268.8997,80);
CreateStreamObject(16093, 228.088699, 2504.842529, 15.303051, 0.0000, 0.0000, 268.0404,80);
CreateStreamObject(8210, 28.711105, 2503.639893, 18.593210, 0.0000, 0.0000, 270.7226,80);
CreateStreamObject(8210, 55.820427, 2531.005127, 18.585402, 0.0000, 0.0000, 179.6224,80);
CreateStreamObject(8210, 56.440010, 2475.806885, 18.585402, 0.0000, 0.0000, 359.2444,80);
CreateStreamObject(987, 84.239677, 2475.260010, 15.476620, 0.0000, 0.0000, 91.1003,80);
CreateStreamObject(987, 84.109718, 2484.314697, 15.499812, 0.0000, 0.0000, 91.1003,80);
CreateStreamObject(987, 83.597260, 2519.319580, 15.484375, 0.0000, 0.0000, 91.1003,80);
CreateStreamObject(987, 83.864647, 2510.366211, 15.484375, 0.0000, 0.0000, 91.1003,80);
CreateStreamObject(3279, 79.197800, 2525.826660, 15.559992, 0.0000, 0.0000, 179.6221,80);
CreateStreamObject(3279, 79.768532, 2479.899902, 15.559992, 0.0000, 0.0000, 178.7627,80);
CreateStreamObject(16093, 36.061199, 2503.506836, 15.340288, 0.0000, 0.0000, 90.2409,80);
CreateStreamObject(987, 178.997849, 2522.794678, 15.747955, 0.0000, 0.0000, 272.3375,80);
CreateStreamObject(3279, 185.399872, 2482.322266, 15.559992, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(8172, 104.865540, 2532.627930, 33.953732, 0.0000, 90.2409, 269.7591,80);
CreateStreamObject(8172, 184.411728, 2532.325928, 34.034252, 0.0000, 90.2409, 269.7591,80);
CreateStreamObject(8172, 235.440491, 2532.075439, 34.150505, 0.0000, 90.2409, 181.2371,80);
CreateStreamObject(8172, 170.384140, 2473.939941, 33.959213, 0.0000, 90.2409, 90.9961,80);
CreateStreamObject(8172, 92.410675, 2472.568604, 34.027676, 0.0000, 90.2409, 90.9961,80);
CreateStreamObject(8172, 22.198639, 2471.332764, 34.204346, 0.0000, 90.2409, 356.4583,80);
CreateStreamObject(4866, 152.897263, 2517.432617, 54.934624, 0.0000, 179.6221, 0.0000,80);
CreateStreamObject(961, 111.613960, 2520.004883, 16.102430, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1299, 124.272034, 2489.300049, 15.948043, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1299, 136.971329, 2522.134277, 16.140163, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1299, 147.334793, 2493.311523, 15.940235, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(12957, 113.969742, 2484.230957, 16.370401, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(12957, 161.287155, 2526.691406, 16.657648, 0.0000, 0.0000, 60.1606,80);
CreateStreamObject(12957, 119.110283, 2524.758301, 16.621582, 0.0000, 0.0000, 60.1606,80);
CreateStreamObject(1225, 146.202438, 2515.334229, 16.016890, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1225, 140.914627, 2505.588135, 15.890130, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1225, 117.434624, 2498.589844, 15.897938, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1225, 156.270752, 2500.938232, 15.890130, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1225, 154.376617, 2515.000000, 15.990871, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1225, 150.388031, 2487.192139, 15.890130, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1225, 123.586205, 2520.392334, 16.081795, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1225, 133.026733, 2486.592285, 15.897939, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1225, 99.156342, 2484.273193, 15.890130, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1225, 106.407143, 2506.848145, 15.890130, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1225, 102.363586, 2525.233643, 16.089079, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1225, 102.897560, 2497.436523, 15.890130, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1225, 124.686241, 2508.337646, 15.890130, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1225, 130.111267, 2524.404785, 16.130625, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1225, 144.940369, 2523.196289, 16.107004, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1225, 163.478516, 2489.532471, 15.890130, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1225, 126.425819, 2503.299316, 15.890130, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(1225, 121.714897, 2483.095703, 15.897939, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(16337, 180.768524, 2498.850098, 16.369091, 0.0000, 0.0000, 0.0000,80);
CreateStreamObject(16337, 180.244904, 2510.944336, 16.433510, 0.0000, 0.0000, 3.4377,80);
CreateStreamObject(16337, 83.873535, 2497.074219, 16.369091, 0.0000, 0.0000, 182.2006,80);
CreateStreamObject(16337, 83.920288, 2509.700195, 16.369091, 0.0000, 0.0000, 182.2006,80);
CreateStreamObject(1696, 82.689919, 2501.250732, 16.491604, 0.0000, 0.0000, 271.4780,80);
CreateStreamObject(1696, 82.565529, 2506.270508, 16.491604, 0.0000, 0.0000, 271.4780,80);
CreateStreamObject(1696, 181.596329, 2506.815430, 16.491604, 0.0000, 0.0000, 91.9597,80);
CreateStreamObject(1696, 181.810883, 2501.852295, 16.491604, 0.0000, 0.0000, 91.9597,80);
//=[LoadConfig]=========================================================:
CreateLoadConfig();
//=[CarSystem`s]=======================================================
if(!fexist("CarSys/"))
{
print(">		WARNING:\n");
print(" The  ' CarSys '   folder is missing from scriptfiles");
print("\n Please Create This Folder And Start the Filterscript Again\n");
return 1;
}
if(!fexist("CarSys/Users"))
{
print(">		WARNING:\n");
print(" The  ' CarSys/ Users '   folder is missing from scriptfiles");
print("\n Please Create This Folder And Start the Filterscript Again\n");
return 1;
}
print("_____________________________________\n     Car Commands Filterscript      ");
print("\n         By LethaL \n_____________________________________\n");
return 1;
}


//SendPlayerFormattedText
public SendPlayerFormattedText(playerid, const str[], define){

new tmpbuf[256];

format(tmpbuf, sizeof(tmpbuf), str, define);

SendClientMessage(playerid, COLOR_LIGHTBLUE, tmpbuf);}

//SendAllFormattedText

public SendAllFormattedText(playerid, const str[], define){

new tmpbuf[256];

format(tmpbuf, sizeof(tmpbuf), str, define);

SendPlayerMessageToAll(COLOR_LIGHTBLUE, tmpbuf);}

isStringSame(const string1[], const string2[], len) {

for(new i = 0; i < len; i++) {

if(string1[i]!=string2[i])

return 0;

if(string1[i] == 0 || string1[i] == '\n')

return 1;

}return 1;}


//MSG



//NameCar
public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{



if(PlayerInfo[playerid][Pets] ==1) {


if(PlayerInfo[playerid][Shark] ==1) {
DestroyStreamObject(sam33[playerid]);
SharkYou[playerid] =0;
ThePetsInYou[playerid] =0;
}
if(PlayerInfo[playerid][Dolp] ==1) {
DestroyStreamObject(sam22[playerid]);
ThePetsInYou[playerid] =0;
DolpYou[playerid] =0;
}
if(PlayerInfo[playerid][Tor] ==1) {

DestroyStreamObject(sam44[playerid]);
ThePetsInYou[playerid] =0;
TorYou[playerid] =0;
}
}


if (GetVehicleModel(vehicleid) == 519 && ispassenger)
{
if (!ShamalExists(vehicleid))
{
CreateShamalInt(vehicleid, float(randomEx(3000)), float(randomEx(3000)), float(random(100)+800));
}
SetPlayerPosInShamal(playerid, vehicleid);
InShamal[playerid] = vehicleid;
}

new str[256];
switch(GetVehicleModel(vehicleid)){
case 400:{format(str,255," ~n~ ~w~landstal",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 401:{format(str,255," ~n~ ~w~bravura",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 402:{format(str,255," ~n~ ~w~buffalo",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 403:{format(str,255," ~n~ ~w~linerun",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 404:{format(str,255," ~n~ ~w~peren",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 405:{format(str,255," ~n~ ~w~sentinel",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 406:{format(str,255," ~n~ ~w~dumper",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 407:{format(str,255," ~n~ ~w~Firetruck",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 408:{format(str,255," ~n~ ~w~Trash",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 409:{format(str,255," ~n~ ~w~Limousine",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 410:{format(str,255," ~n~ ~w~Manana",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 411:{format(str,255," ~n~ ~w~Infernus",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 412:{format(str,255," ~n~ ~w~Voodoo",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 413:{format(str,255," ~n~ ~w~Pony",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 414:{format(str,255," ~n~ ~w~Mule",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 415:{format(str,255," ~n~ ~w~Cheetah",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 416:{format(str,255," ~n~ ~w~Ambulance",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 417:{format(str,255," ~n~ ~w~Leviathan",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 418:{format(str,255," ~n~ ~w~Moonbeam",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 419:{format(str,255," ~n~ ~w~Esperant",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 420:{format(str,255," ~n~ ~w~Taxi",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 421:{format(str,255," ~n~ ~w~Washington",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 422:{format(str,255," ~n~ ~w~Bobcat",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 423:{format(str,255," ~n~ ~w~Mr. Whoopee",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 424:{format(str,255," ~n~ ~w~BF Injection",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 425:{format(str,255," ~n~ ~w~Hunter",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 426:{format(str,255," ~n~ ~w~Premier",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 427:{format(str,255," ~n~ ~w~Enforcer",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 428:{format(str,255," ~n~ ~w~Securica",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 429:{format(str,255," ~n~ ~w~Banshee",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 430:{format(str,255," ~n~ ~w~Predator",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 431:{format(str,255," ~n~ ~w~Bus",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 432:{format(str,255," ~n~ ~w~Rhino",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 433:{format(str,255," ~n~ ~w~Barracks",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 434:{format(str,255," ~n~ ~w~Hotknife",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 435:{format(str,255," ~n~ ~w~Artict1",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 436:{format(str,255," ~n~ ~w~previon",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 437:{format(str,255," ~n~ ~w~coach",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 438:{format(str,255," ~n~ ~w~cabbie",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 439:{format(str,255," ~n~ ~w~stallion",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 440:{format(str,255," ~n~~w~rumpo",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 441:{format(str,255," ~n~ ~w~RC Bandit",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 442:{format(str,255," ~n~ ~w~Romero",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 443:{format(str,255," ~n~ ~w~Packer",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 444:{format(str,255," ~n~ ~w~monster",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 445:{format(str,255," ~n~ ~w~admiral",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 446:{format(str,255," ~n~ ~w~squalo",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 447:{format(str,255," ~n~ ~w~Sea Sparrow",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 448:{format(str,255," ~n~ ~w~Pizza Boy",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 449:{format(str,255," ~n~ ~w~Tram",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 450:{format(str,255," ~n~ ~w~artict2",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 451:{format(str,255," ~n~ ~w~turismo",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 452:{format(str,255," ~n~ ~w~speeder",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 453:{format(str,255," ~n~ ~w~reefer",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 454:{format(str,255," ~n~ ~w~tropic",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 455:{format(str,255," ~n~ ~w~flatbed",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 456:{format(str,255," ~n~ ~w~yankee",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 457:{format(str,255," ~n~ ~w~caddy",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 458:{format(str,255," ~n~ ~w~solair",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 459:{format(str,255," ~n~ ~w~RC Van",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 460:{format(str,255," ~n~ ~w~Skimmer",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 461:{format(str,255," ~n~ ~w~PCJ-600",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 462:{format(str,255," ~n~ ~w~Faggio",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 463:{format(str,255," ~n~ ~w~Freeway",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 464:{format(str,255," ~n~ ~w~RC Baron",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 465:{format(str,255," ~n~ ~w~RC Raider",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 466:{format(str,255," ~n~ ~w~Glendale",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 467:{format(str,255," ~n~ ~w~Oceanic",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 468:{format(str,255," ~n~ ~w~Sanchez",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 469:{format(str,255," ~n~ ~w~Sparrow",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 470:{format(str,255," ~n~ ~w~Patriot",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 471:{format(str,255," ~n~ ~w~Quadbike",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 472:{format(str,255," ~n~ ~w~Coastguard",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 473:{format(str,255," ~n~ ~w~Dinghy",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 474:{format(str,255," ~n~ ~w~Hermes",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 475:{format(str,255," ~n~ ~w~Sabre",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 476:{format(str,255," ~n~ ~w~Rustler",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 477:{format(str,255," ~n~ ~w~ZR3 50",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 478:{format(str,255," ~n~ ~w~Walton",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 479:{format(str,255," ~n~ ~w~Regina",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 480:{format(str,255," ~n~ ~w~Comet",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 481:{format(str,255," ~n~ ~w~BMX",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 482:{format(str,255," ~n~ ~w~Burrito",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 483:{format(str,255," ~n~ ~w~Camper",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 484:{format(str,255," ~n~ ~w~Marquis",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 485:{format(str,255," ~n~ ~w~Baggage",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 486:{format(str,255," ~n~ ~w~Dozer",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 487:{format(str,255," ~n~ ~w~Maverick",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 488:{format(str,255," ~n~ ~w~News Chopper",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 489:{format(str,255," ~n~ ~w~Rancher",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 490:{format(str,255," ~n~ ~w~FBI Rancher",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 491:{format(str,255," ~n~ ~w~Virgo",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 492:{format(str,255," ~n~ ~w~Greenwood",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 493:{format(str,255," ~n~ ~w~Jetmax",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 494:{format(str,255," ~n~ ~w~Hotring",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 495:{format(str,255," ~n~ ~w~Sandking",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 496:{format(str,255," ~n~ ~w~Blista Compact",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 497:{format(str,255," ~n~ ~w~SAMPD Maverick",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 498:{format(str,255," ~n~ ~w~AlonTextDrawville",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 499:{format(str,255," ~n~ ~w~Benson",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 500:{format(str,255," ~n~ ~w~Mesa",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 501:{format(str,255," ~n~ ~w~RC Goblin",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 502:{format(str,255," ~n~ ~w~Hotring Racer",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 503:{format(str,255," ~n~ ~w~Hotring Racer2",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 504:{format(str,255," ~n~ ~w~Bloodring Banger",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 505:{format(str,255," ~n~ ~w~Rancher",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 506:{format(str,255," ~n~ ~w~Super GT",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 507:{format(str,255," ~n~ ~w~Elegant",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 508:{format(str,255," ~n~ ~w~Journey",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 509:{format(str,255," ~n~ ~w~Bike",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 510:{format(str,255," ~n~ ~w~Mountain Bike",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 511:{format(str,255," ~n~ ~w~Beagle",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 512:{format(str,255," ~n~ ~w~Cropdust",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 513:{format(str,255," ~n~ ~w~Stunt",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 514:{format(str,255," ~n~ ~w~Tanker",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 515:{format(str,255," ~n~ ~w~RoadTrain",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 516:{format(str,255," ~n~ ~w~Nebula",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 517:{format(str,255," ~n~ ~w~Majestic",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 518:{format(str,255," ~n~ ~w~Buccaneer",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 519:{format(str,255," ~n~ ~w~Shamal",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 520:{format(str,255," ~n~ ~w~Hydra",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 521:{format(str,255," ~n~ ~w~FCR-900",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 522:{format(str,255," ~n~ ~w~NRG-500",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 523:{format(str,255," ~n~ ~w~HPV1000",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 524:{format(str,255," ~n~ ~w~Cement Truck",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 525:{format(str,255," ~n~ ~w~Tow Truck",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 526:{format(str,255," ~n~ ~w~Fortune",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 527:{format(str,255," ~n~ ~w~Cadrona",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 528:{format(str,255," ~n~ ~w~FBI Truck",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 529:{format(str,255," ~n~ ~w~Willard",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 530:{format(str,255," ~n~ ~w~Forklift",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 531:{format(str,255," ~n~ ~w~Tractor",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 532:{format(str,255," ~n~ ~W~Combine",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 533:{format(str,255," ~n~ ~W~Feltzer",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 534:{format(str,255," ~n~ ~W~Remington",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 535:{format(str,255," ~n~ ~W~Slamvan",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 536:{format(str,255," ~n~ ~W~Blade",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 537:{format(str,255," ~n~ ~W~Freight",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 538:{format(str,255," ~n~ ~W~Streak",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 539:{format(str,255," ~n~ ~W~Vortex",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 540:{format(str,255," ~n~ ~W~Vincent",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 541:{format(str,255," ~n~ ~W~Bullet",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 542:{format(str,255," ~n~ ~W~Clover",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 543:{format(str,255," ~n~ ~W~Sadler",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 544:{format(str,255," ~n~ ~W~Firetruck",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 545:{format(str,255," ~n~ ~W~Hustler",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 546:{format(str,255," ~n~ ~W~Intruder",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 547:{format(str,255," ~n~ ~W~Primo",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 548:{format(str,255," ~n~ ~W~Cargobob",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 549:{format(str,255," ~n~ ~W~Tampa",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 550:{format(str,255," ~n~ ~W~Sunrise",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 551:{format(str,255," ~n~ ~W~Merit",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 552:{format(str,255," ~n~ ~W~Utility",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 553:{format(str,255," ~n~ ~W~Nevada",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 554:{format(str,255," ~n~ ~W~Yosemite",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 555:{format(str,255," ~n~ ~W~Windsor",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 556:{format(str,255," ~n~ ~W~Monster",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 557:{format(str,255," ~n~ ~W~Monster",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 558:{format(str,255," ~n~ ~W~Uranus",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 559:{format(str,255," ~n~ ~W~Jester",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 560:{format(str,255," ~n~ ~W~Sultan",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 561:{format(str,255," ~n~ ~W~Stratum",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 562:{format(str,255," ~n~ ~W~Elegy",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 563:{format(str,255," ~n~ ~W~Raindance",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 564:{format(str,255," ~n~ ~W~RC Tiger",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 565:{format(str,255," ~n~ ~W~Flash",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 566:{format(str,255," ~n~ ~W~Tahoma",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 567:{format(str,255," ~n~ ~W~Savanna",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 568:{format(str,255," ~n~ ~W~Bandito",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 569:{format(str,255," ~n~ ~W~Freight",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 570:{format(str,255," ~n~ ~W~Trailer",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 571:{format(str,255," ~n~ ~W~Go Kart",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 572:{format(str,255," ~n~ ~W~Mower",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 573:{format(str,255," ~n~ ~W~Duneride",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 574:{format(str,255," ~n~ ~W~Sweeper",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 575:{format(str,255," ~n~ ~W~Broadway",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 576:{format(str,255," ~n~ ~W~Tornado",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 577:{format(str,255," ~n~ ~W~AT-400",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 578:{format(str,255," ~n~ ~W~DFT-30",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 579:{format(str,255," ~n~ ~W~Huntley",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 580:{format(str,255," ~n~ ~W~Stafford",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 581:{format(str,255," ~n~ ~W~BF-400",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 582:{format(str,255," ~n~ ~W~News Van",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 583:{format(str,255," ~n~ ~W~Tug",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 584:{format(str,255," ~n~ ~W~Trailer",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 585:{format(str,255," ~n~ ~W~Emperor",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 586:{format(str,255," ~n~ ~W~Wayfarer",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 587:{format(str,255," ~n~ ~W~Euros",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 588:{format(str,255," ~n~ ~W~Hotdog",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 589:{format(str,255," ~n~ ~W~Club",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 590:{format(str,255," ~n~ ~W~Trailer",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 591:{format(str,255," ~n~ ~W~Trailer",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 592:{format(str,255," ~n~ ~W~Andromada",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 593:{format(str,255," ~n~ ~W~Dodo",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 594:{format(str,255," ~n~ ~W~RC Cam",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 595:{format(str,255," ~n~ ~W~Launch",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 596:{format(str,255," ~n~ ~W~LSPD Police Car",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 597:{format(str,255," ~n~ ~W~SFPD Police Car",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 598:{format(str,255," ~n~ ~W~LVPD Police Car",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 599:{format(str,255," ~n~ ~W~Police Ranger",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 600:{format(str,255," ~n~ ~W~Picador",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 601:{format(str,255," ~n~ ~W~S.W.A.T. Truck",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 602:{format(str,255," ~n~ ~W~Alpha",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 603:{format(str,255," ~n~ ~W~Phoenix",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 604:{format(str,255," ~n~ ~W~Glenshit",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 605:{format(str,255," ~n~ ~W~Sadler",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 606:{format(str,255," ~n~ ~W~Luggage Trailer",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 607:{format(str,255," ~n~ ~W~Luggage Trailer",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 608:{format(str,255," ~n~ ~W~Stair Trailer",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 609:{format(str,255," ~n~ ~W~Sexy Car :D",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 610:{format(str,255," ~n~ ~W~Farm Plow",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1); return 1;}
case 611:{format(str,255," ~n~ ~W~Utility Trailer",vehicleid,GetVehicleModel(vehicleid));GameTextForPlayer(playerid,str,5000,1);
//GameTextForPlayer();
return 1;
}

}


return 1;
}


 
public OnPlayerPrivmsg(playerid, recieverid, text[])
{
if(Ignore[recieverid][playerid] == 1)return SendClientMessage(playerid,COLOR_BRIGHTRED,"[IgnorePms] !השחקן אליו אתה מנסה לשלוח הודעה חסם אותך"),0;
if(cancelpm[recieverid] == 1) return SendClientMessage(playerid,red,"[BlockPms] .שחקן זה חסם את האפשרות לשלוח לו הודעות פרטיות"),0;
if(antispam[playerid] ==1) return SendClientMessage(playerid,COLOR_BRIGHTRED,"[Anti-Spam] הודעה פרטית אחת כל 2 שניות !!! "),0;
if(GetPlayerMoney(playerid) < 10) return SendClientMessage(playerid,COLOR_WHITE,".אין לך מספיק כסף בידך"),0;
antispam[playerid] ++;



new str[256],str2[256];

format(str,sizeof(str),"[PM] to %s [%d]: %s ",GetName(recieverid),recieverid,text);
SendClientMessage(playerid,COLOR_LIGHTBLUE,str);
format(str2,sizeof(str2),"[PM] from: %s [%d]: %s ",GetName(playerid),playerid,text);
SendClientMessage(recieverid,0x0F482FF,str2);

if ((text[0] != '!' && text[0] != '@') && strfind(text, "213.8.26.132:2007", true)!=-1 || strfind(text, "195.189.140.155:7007", true)!=-1 || strfind(text, "80.179.149.110:1234", true)!=-1 || strfind(text, "213.8.26.132:7003", true)!=-1 || strfind(text, "www.top-games.co.il", true)!=-1 || strfind(text, "213.8.26.132:5555", true)!=-1
|| strfind(text, "62.90.136.233:7777", true)!=-1 || strfind(text, "82.80.245.35:7777", true)!=-1 || strfind(text, "195.189.140.50:7002", true)!=-1){
SendClientMessage(playerid,COLOR_RED," !תעוף מפה לא מפרסמים כאן שרתים");
for (new i=0; i<GetMaxPlayers(); i++) if (IsPlayerConnected(i)) for (new o=0; o<50; o++) SendClientMessage(i,COLOR_WHITE," ");
GetPlayerName(playerid,playername,sizeof(playername));

Ban(playerid);
return 0;
}
LACY_GiveMoney(playerid,-10);



return 0;
}
forward SendClientMessageToAdmins(color,const string[]);
public SendClientMessageToAdmins(color,const string[])
{
        for(new i = 0; i < MAX_PLAYERS; i++)
        {
                if(IsPlayerConnected(i))
                {
                       if (PlayerInfo[i][AdminsLevel] >= 10) {

                                SendClientMessage(i, COLOR_LIGHTBLUE, string);

                        }
                }
        }
        return 1;
}






public OnPlayerExitVehicle(playerid, vehicleid)
{
if(MonsterNoTeleportion[playerid] == 1) {
MonsterPlayers --; iNmOnster[playerid] = 0; MonsterNoTeleportion[playerid] = 0; MonsterFucker[playerid] = 0;
DestroyVehicle(MonsterSYSTEM[playerid]);
SpawnPlayer(playerid);
MonStart[playerid] =0;
}
if(KK[playerid] == 1)
{
ResetPlayerWeapons(playerid);
SendClientMessage(playerid,COLOR_BRIGHTRED,".Kart .עזבת את הפעילות ");
KartPlayers --; InKart[playerid] = 0; KK[playerid] = 0; Fuck[playerid] = 0;
DestroyVehicle(caridxx[playerid]);
return 1;
}
NoForSell[playerid] =0;
if(Youregisterrace[playerid] ==1){
Youregisterrace[playerid] =0;
DisablePlayerRaceCheckpoint(playerid);
RacePlayers--;
SpawnPlayer(playerid);
SetPlayerVirtualWorld(playerid,0);
SetVehicleVirtualWorld(vehicleid,0);
}
if(YouRegister[playerid] ==1){
YouRegister[playerid] =0;
DisablePlayerRaceCheckpoint(playerid);
DriftPlayer--;
SpawnPlayer(playerid);
}




//killtimer[playerid] = SetTimer("vts",10*1000,0);
return 1;
}
forward vts(playerid);
public vts(playerid) {

SetVehicleToRespawn(GetPlayerVehicleID(playerid));
return 1;
}

public OnVehicleSpawn(vehicleid)
{

SetVehicleVirtualWorld(vehicleid,0);
if( VehicleInfo[vehicleid][CarOwned] == 1 ) return SetTimerEx("UpdateCar",2000,0,"d",vehicleid);
tCount[vehicleid] = false;
new model = GetVehicleModel(vehicleid);
if(model==521||model==520||model==406||model==432||model==444||model==539||model==556||model==557) { DestroyVehicle(vehicleid); return 1; }
return 1;
}
public ExplodeShamal(vehicleid)
{
KillTimer(sExplode[vehicleid]);
if (tCount[vehicleid])
{
CreateExplosion(ShamalPos[vehicleid][0], ShamalPos[vehicleid][1], ShamalPos[vehicleid][2], 2, 15.0);
sExplode[vehicleid] = SetTimerEx("ExplodeShamal", random(1300)+100, 1, "d", vehicleid);
}
}
//car
//==============================================================================


//==============================================================================

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
{
if(InLcTeleport[playerid] ==1) return 0;

OnPlayerKeyStateChange2(playerid, newkeys, oldkeys);
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
if(IsKeyJustDown(KEY_FIRE,newkeys,oldkeys) || IsKeyJustDown(128,newkeys,oldkeys)){
if(GetPlayerInterior(playerid) == 4 || GetPlayerInterior(playerid) == 4){
SendClientMessage(playerid,0xFF0000AA,".אסור להרביץ בחנות נשקים!, אנא תכבד תחוקים");
SetPlayerPos(playerid,1022.1641,-1133.3300,23.8281);
SetPlayerInterior(playerid,0);
}
}

if(IsKeyJustDown(KEY_FIRE,newkeys,oldkeys) || IsKeyJustDown(128,newkeys,oldkeys)){
if(GetPlayerInterior(playerid) == 6 || GetPlayerInterior(playerid) == 1){
SendClientMessage(playerid,0xFF0000AA," !אסור להרביץ בבנק!, אנא תכבד תחוקים");
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
forward OnPlayerKeyStateChange2(playerid, newkeys, oldkeys);
public OnPlayerKeyStateChange2(playerid, newkeys, oldkeys)
{
if(IsKeyJustDown(KEY_SPRINT,newkeys,oldkeys))
{
StopLoopingAnim(playerid);
Stoned[playerid] =0;
}
}

StopLoopingAnim(playerid)
{
ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0);
Stoned[playerid] =0;
}







forward StreamTimer();
public StreamTimer()
{
    new Float:x,Float:y,Float:z;
    new Float:x2,Float:y2,Float:z2;
	for (new i=0; i<MAX_PLAYERS; i++)
	{
	    if (IsPlayerConnected(i))
	    {
		    GetPlayerPos(i,x,y,z);
			for (new p=0; p<=created; p++)
			{
			    if (Objects[p][modelid] != 0)
			    {
			        if (Objects[p][attached] != -1)
			        {
			            GetPlayerPos(Objects[p][attached],x2,y2,z2);
			            Objects[p][xpos] = x2+Objects[p][xoff];
			            Objects[p][ypos] = y2+Objects[p][yoff];
			            Objects[p][zpos] = z2+Objects[p][zoff];
					}
				    if (Objectnearplayer(x,y,z,Objects[p][xpos],Objects[p][ypos],Objects[p][zpos],Objects[p][viewdist]))
				    {
						if (PlayerObjects[i][seen][p] == false)
				    	{
				        	PlayerObjects[i][pobjects][p] = CreatePlayerObject(i,Objects[p][modelid],Objects[p][xpos],Objects[p][ypos],Objects[p][zpos],Objects[p][xrot],Objects[p][yrot],Objects[p][zrot]);
				        	if (Objects[p][attached] != -1)
				        	{
				        	    AttachPlayerObjectToPlayer(i,PlayerObjects[i][pobjects][p],Objects[p][attached],Objects[p][xoff],Objects[p][yoff],Objects[p][zoff],Objects[p][xrot],Objects[p][yrot],Objects[p][zrot]);
							}
							else if (Objects[p][moving] == true)
							{
							    MovePlayerObject(i,PlayerObjects[i][pobjects][p],Objects[p][movx],Objects[p][movy],Objects[p][movz],Objects[p][speed]);
							}
				        	PlayerObjects[i][seen][p] = true;
						}
					}
					else if (PlayerObjects[i][seen][p] == true)
					{
					    DestroyPlayerObject(i,PlayerObjects[i][pobjects][p]);
					    PlayerObjects[i][seen][p] = false;
					}
				}
			}
		}
	}
}

forward MoveTimer(id2,xadd,yadd,zadd,bool:xisbigger,bool:yisbigger,bool:zisbigger);
public MoveTimer(id2,xadd,yadd,zadd,bool:xisbigger,bool:yisbigger,bool:zisbigger)
{
	new bool:reached = false;
	reached = xisbigger ? ((Objects[id2][xpos] >= Objects[id2][movx]) ? true : false) : ((Objects[id2][xpos] <= Objects[id2][movx]) ? true : false);
	if (reached)
	{
	    reached = yisbigger ? ((Objects[id2][ypos] >= Objects[id2][movy]) ? true : false) : ((Objects[id2][ypos] <= Objects[id2][movy]) ? true : false);
	    if (reached)
	    {
	        reached = zisbigger ? ((Objects[id2][zpos] >= Objects[id2][movz]) ? true : false) : ((Objects[id2][zpos] <= Objects[id2][movz]) ? true : false);
		}
	}
	if (reached)
	{
	    Objects[id2][moving] = false;
	    for (new i=0; i<MAX_PLAYERS; i++)
	    {
	        if (IsPlayerConnected(i))
	        {
	        	if (PlayerObjects[i][seen][id2] == true && Objects[id2][moving] == true)
	        	{
	        		MovePlayerObject(i,PlayerObjects[i][pobjects][id2],Objects[id2][movx],Objects[id2][movy],Objects[id2][movz],Objects[id2][speed]);
				}
			}
		}
		Objects[id2][xpos] = Objects[id2][movx];
		Objects[id2][ypos] = Objects[id2][movy];
		Objects[id2][zpos] = Objects[id2][movz];
		KillTimer(Objects[id2][movetimer]);
	}
	else
	{
	    new bool:found = false;
	    for (new i=0; i<MAX_PLAYERS; i++)
	    {
	        if (IsPlayerConnected(i))
	        {
		        if (PlayerObjects[i][seen][id2] == true)
		        {
		            GetPlayerObjectPos(i,PlayerObjects[i][pobjects][id2],Objects[id2][xpos],Objects[id2][ypos],Objects[id2][zpos]);
		            found = true;
		            break;
	 			}
			}
		}
		if (!found)
		{
	        Objects[id2][xpos] = Objects[id2][xpos]+xadd;
	        Objects[id2][ypos] = Objects[id2][ypos]+yadd;
	        Objects[id2][zpos] = Objects[id2][zpos]+zadd;
		}
	}
}
//-=-=



/*
forward rvip();
public rvip() {
for(new i;i<MAX_PLAYERS;i++)
{
ThisIsSendMessage[i] =1;
}
return 1;
}
*/
forward rspam();
public rspam() {
for(new i;i<MAX_PLAYERS;i++)
{
antispam[i] =0;
onspam[i]=0;
}
return 1;
}

forward Rpet();
public Rpet() {
for(new i;i<MAX_PLAYERS;i++)
{
PetInWar[i]=0;
}
return 1;
}
forward Rhelp();
public Rhelp() {
for(new i;i<MAX_PLAYERS;i++)
{
helpme[i] =0;
}
return 1;
}

forward Rcall();
public Rcall() {
for(new i;i<MAX_PLAYERS;i++)
{
InCall[i] =0;
}
return 1;
}


public OnPlayerText(playerid, text[])
{

if((text[0] != '!' && text[0] != '@') &&
strfind(text, "227", true)!=-1 ||
strfind(text, "7003", true)!=-1 ||
strfind(text, "5555", true)!=-1 ||
strfind(text, ".145", true)!=-1 ||
strfind(text, "6666", true)!=-1 ||
strfind(text, "212", true)!=-1 ||
strfind(text, "1111", true)!=-1 ||
strfind(text, "7777", true)!=-1 ||
strfind(text, "7002", true)!=-1 ||
strfind(text, "26.", true)!=-1 ||
strfind(text, ":8888", true)!=-1 ||
strfind(text, "7 7 7 7", true)!=-1 ||
strfind(text, ".254", true)!=-1 ||
strfind(text, "2007", true)!=-1 ||
strfind(text, "7777", true)!=-1 ||
strfind(text, "26.", true)!=-1 ||strfind(text, "8.", true)!=-1 ||
strfind(text, "234.", true)!=-1 || strfind(text, "6.", true)!=-1) {
new str[256];
format(str, sizeof(str), ".``%s`` מילה לא חוקית" , text);
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
SendClientMessage(playerid,WHITE, "(USAGE: dd/mm/yyyy) :תאריך לידה לא חוקי נסה ככה");
return 0;
}
new check = year - strval(DateInfo[2]);
if(check == year)
{
SendClientMessage(playerid,WHITE, "(USAGE: dd/mm/yyyy) :תאריך לידה לא חוקי נסה ככה");
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




	if (CellState[playerid]==ESTA_HABLANDO)
 	{
	    new msg[255];
	 	new pName2[MAX_PLAYER_NAME];
	 	GetPlayerName(playerid,pName2,sizeof(pName2));
      	format(msg,sizeof(msg),"(%s): %s",pName2,text);
	 	AlTelefono(AuxiliarTel[playerid],msg);
	 	format(msg,sizeof(msg),"(Phone): %s",text);
   		new Float:x1,Float:y1,Float:z1;
		GetPlayerPos(playerid,x1,y1,z1);

		if  (DIST!=-1)
	    for (new i=0;i<MAX_PLAYERS;i++)
	    {
	        if  (GDTP(i,x1,y1,z1)<DIST)
	        {
	        	SendPlayerMessageToPlayer(i,playerid,msg);
	        }
	    }
	 	return 0;
 	}


if(antispam[playerid] ==1) return SendClientMessage(playerid,COLOR_BRIGHTRED,"[AntiSpam]  רק הודעה אחת כל 2 שניות!!!"),0;
antispam[playerid] ++;
if(NoChat[playerid] ==1) return SendClientMessage(playerid,COLOR_BRIGHTRED,".אתה חייב להיות רשום ומחובר על מנת לכתוב בצ'אט"),0;

if ((text[0] != '!' && text[0] != '@') && strfind(text, "213.8.26.132:2007", true)!=-1 || strfind(text, "195.189.140.155:7007", true)!=-1 || strfind(text, "80.179.149.110:1234", true)!=-1 || strfind(text, "213.8.26.132:7003", true)!=-1 || strfind(text, "www.top-games.co.il", true)!=-1 || strfind(text, "213.8.26.132:5555", true)!=-1
|| strfind(text, "62.90.136.233:7777", true)!=-1 || strfind(text, "82.80.245.35:7777", true)!=-1 || strfind(text, "195.189.140.50:7002", true)!=-1){
spamkick[playerid] ++;
if(spamkick[playerid]  ==1) return SendClientMessage(playerid,COLOR_BRIGHTRED,"BAN - קיבלת באן בגלל פרסום שרת"),0;
Ban(playerid);
//if(spamkick[playerid]  ==3) return SendClientMessage(playerid,COLOR_BRIGHTRED,".קיבלת אזהרה 2/3 עוד פעם 1 תקבל קיק מהשרת"),0;
//if(spamkick[playerid]  ==2) return SendClientMessage(playerid,COLOR_BRIGHTRED,"קיבלת אזהרה 1/3 עוד פעמיים תקבל קיק"),0;
//if(spamkick[playerid]  ==4) return SendClientMessage(playerid,COLOR_BRIGHTRED,"קיבלת קיק מהשרת עקב תכנים לא חוקיים"),0,TogglePlayerControllable(playerid,0),Kick(playerid);
return 0;
}
if ((text[0] != '!' && text[0] != '@') && strfind(text, "vgames", true)!=-1 || strfind(text, "7 0 0 3", true)!=-1 || strfind(text, "6666", true)!=-1 || strfind(text, "7777", true)!=-1 || strfind(text, "/q", true)!=-1 || strfind(text, "8888", true)!=-1
|| strfind(text, "fxp", true)!=-1 || strfind(text, "7007", true)!=-1 || strfind(text, "2007", true)!=-1)
{
spamkick[playerid] ++;
if(spamkick[playerid]  ==1) return SendClientMessage(playerid,COLOR_BRIGHTRED,"Warning - קיבלת אזהרה על תוכן לא חוקי"),0;
if(spamkick[playerid]  ==3) return SendClientMessage(playerid,COLOR_BRIGHTRED,".קיבלת אזהרה 2/3 עוד פעם 1 תקבל קיק מהשרת"),0;
if(spamkick[playerid]  ==2) return SendClientMessage(playerid,COLOR_BRIGHTRED,"קיבלת אזהרה 1/3 עוד פעמיים תקבל קיק"),0;
if(spamkick[playerid]  ==4) return SendClientMessage(playerid,COLOR_BRIGHTRED,"קיבלת קיק מהשרת עקב תכנים לא חוקיים"),0,TogglePlayerControllable(playerid,0);

return 0;
}







new ntext[256];
{
format(ntext, 256, "[%d] %s" ,playerid,text);
SendPlayerMessageToAll(playerid, ntext);
return false;
}
}






forward TimeUpdate();
public TimeUpdate() {
new string[256];
new n = random(MAX_WANGEXPORTVEHICLES);

format(string, sizeof(string),"***  %s's  מוסך וואנג מחפש כרגע תרכב ***", wantedWangExportVehicleNames[n]);
SendClientMessageToAll(0xFFFF00AA, string);

wantedWangExportVehicle = wantedWangExportVehicles[n];
for(new i=0;i<MAX_PLAYERS;i++) {
if(IsPlayerConnected(i))
{
Sell[i] = -1;
}
}
}



forward WarStartr();
public WarStartr()
{

SendClientMessageToAll(COLOR_WHITE,"[____________.מערכת בזוקות פעילה ____________]");
SendClientMessageToAll(COLOR_ORANGE,".כעת מערכת בזוקות החלה, מטרת המערכת היא לפוצץ אנשים בעזרה הנשק");//0xFFFF00AA
SendClientMessageToAll(COLOR_ORANGE,"כולכם תשוגרו למקום שנבנה על ידי בונה אובייקטים");//0xFFFF00AA
SendClientMessageToAll(COLOR_ORANGE,"מטרת המערכת היא לישאר חי");//0xFFFF00AA
SendClientMessageToAll(COLOR_GREEN,":פקודות מערכת הבזוקה");//0xFFFF00AA
SendClientMessageToAll(0xFFFF00AA,"/Rpg הצטרפות");//0xFFFF00AA
SendClientMessageToAll(0xFFFF00AA,".שחקן/ית אשר ישארן אחרון יזכה ב10,000 דולר");//0xFFFF00AA
SendClientMessageToAll(COLOR_WHITE,"[__________________________]");

WarOnr = 1; WarPlayersr = 0;
Countr = 30; Countdownr(); CountFucr = 1;
return 1;
}

//==================================Countdown===================================
forward Countdownr();
public Countdownr()
{
if(Countr == 25)
{
SendClientMessageToAll(COLOR_LIGHTBLUE, "/Rpg בעוד 25 שניות יתחיל הקרב להצטרפות");
}
else if(Countr == 10)
{
SendClientMessageToAll(COLOR_LIGHTBLUE, "/Rpg הזדמנות אחרונה להצטרפות לפעילות"); }
new String[256];
format(String, 256,"~w~~>~ ~w~/rpg: ~r~ %d ~<~",Countr);
GameTextForAll(String,1000,4);
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
for(new i;i<MAX_PLAYERS;i++)
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
SendClientMessageToAll(COLOR_WHITE,"[________ Bazooka מערכת טילים _______]");
SendClientMessageToAll(COLOR_LIGHTBLUE,"עוד מס' שניות יתחיל מערכת טילים");
SendClientMessageToAll(COLOR_LIGHTBLUE,"פרס עומד על 10,000");
format(string, sizeof(string), " %d מספר השחקנים שהצטרפו לטילים הוא ",WarPlayersr);
SendClientMessageToAll( COLOR_LIGHTBLUE, string);
SendClientMessageToAll(COLOR_WHITE,"[________ Bazooka מערכת טילים _______]");
//SendClientMessage(i,0x0A046FF,"-- - - -[Rpg Start]-- - - -");
for(new i;i<MAX_PLAYERS;i++)
{
if(InWarr[i] == 1) {
new rand = random(sizeof(gRandomWarSpawns));
SetPlayerPos(i, gRandomWarSpawns[rand][0], gRandomWarSpawns[rand][1], gRandomWarSpawns[rand][2]);
//SetPlayerInterior(i, 10);



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

//SetTimer("weaponanti",3000,1);
new string[256];
SendClientMessageToAll(red,".מערכת הטילים בוטלה סליחה על אי הנעימות");
format(string, sizeof(string), "צריכים לפחות כ2 שחקנים",WarPlayersr);
SendClientMessageToAll(red, string);

WarOnr = 0; WarPlayersr = 0;
for(new i;i<MAX_PLAYERS;i++)
{
InWarr[i] = 0;  PPr[i] = 0; WSr = 0; knoobr = 0;

KillTimer(CheckTimer);
}
return 1;
}
else if(statusr == 1)
{

LACY_GiveMoney(WarWinnerr, Rewardr);
GetPlayerName(WarWinnerr, playernamer, sizeof(playernamer));
format(knobr, sizeof(knobr), "The Winner %s", playernamer);
GameTextForAll(knobr, 3000, 4);
ResetPlayerWeapons(WarWinnerr);
SetPlayerInterior(WarWinnerr, 0);
SetPlayerPos(WarWinnerr, 2028.6577,1341.8792,10.8203);
//new string[256];
PlayerInfo[WarWinnerr][RPGS] ++;
SendClientMessageToAll(COLOR_WHITE,"[_________ .הכרזה על המנצח בקרב טילים _________]");
format(knobr, sizeof(knobr), "  שזכה בקרב טילים %s מזל טוב ל",GetName(WarWinnerr));
SendClientMessageToAll(0x0F482FF, knobr);
format(knobr, sizeof(knobr), " $10,000 בגלל הניצחון שלו הוא זכה ב",playername);
SendClientMessageToAll(0x0F482FF, knobr);
format(knobr, sizeof(knobr), "%d :מספר המשתתפים שהיו בקרב",WarPlayersr);
SendClientMessageToAll(0x0F482FF, knobr);
format(knobr, sizeof(knobr), "%d מספר הנצחנו שלו בפעילות זו",PlayerInfo[WarWinnerr][RPGS]);
SendClientMessageToAll(0x0F482FF, knobr);
SendClientMessageToAll(COLOR_WHITE,"[_________ .הכרזה על המנצח בקרב טילים _________]");


WarOnr = 0; WarPlayersr = 0;
LACY_GiveMoney(WarWinnerr, 10000);
SendClientMessage(WarWinnerr, COLOR_RED, knobr);
SetPlayerHealth(WarWinnerr, 100.0);
TogglePlayerControllable(WarWinnerr, 1);
//SetTimer("weaponanti",3000,1);
for(new i;i<MAX_PLAYERS;i++)
{
InWarr[i] = 0; WSr = 0; PPr[i] = 0; knoobr = 0;
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
for(new i;i<MAX_PLAYERS;i++)
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




new str[256];
if(pickupid == 1279)
{

new string[256];
//++PlayerInfo[playerid][Weeds];
PlayerInfo[playerid][Weeds] ++;
format(str, sizeof(str), "/Weedhelp :אספת מנת סמים מנות סמים שברשותך %d/10 :לעזרה עם המערכת ", PlayerInfo[playerid][Weeds]);
SendClientMessage(playerid, COLOR_WHITE, str);
format(string, sizeof(string), ".אספ/ה מנת סמים ,%s השחקן/ית",GetName(playerid)),SendClientMessage(playerid, COLOR_WHITE, string);
return 1;
}




return 0;
}









//==================================WarStart====================================
forward WarStart();
public WarStart()
{

new string[256];
MoneyWinnerWar +=500;
SendClientMessageToAll(COLOR_WHITE,"[___________ .War Mode - מוד מלחמות ___________]");
SendClientMessageToAll(COLOR_ORANGE,"מערכת מלחמות,מטרת המערכת היא לישאר אחרון חי. מקומות 40");//0xFFFF00AA
SendClientMessageToAll(COLOR_ORANGE,"ספירה: 60 שניות");
SendClientMessageToAll(COLOR_GREEN,":פקודות מערכת המלחמות");//
SendClientMessageToAll(0xFFFF00AA,"/war הצטרפות");//
format(string,sizeof(string),".[$%d] :סכום זכייה התחלתי",MoneyWinnerWar);
SendClientMessageToAll(0xFFFF00AA,string);
SendClientMessageToAll(COLOR_ORANGE, "כל שחקן אשר הצטרף לפעילות יעלה את סכום הזכייה ב500");
SendClientMessageToAll(COLOR_WHITE,"[_________________________________]");

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
format(string,sizeof(string),"/war :בעוד כ-40 שניות תתחיל פעילות הוואר בציבורי להצטרפות",Count),SendClientMessageToAll(RED2,string);
format(string,sizeof(string),".[%d] :מספר משתתפים ,[%d] סכום הזכייה בקארט עלה ל",MoneyWinnerWar,WarPlayers),SendClientMessageToAll(COLOR_GREEN,string);
}
else if(Count == 20)
{
format(string,sizeof(string),"/war :בעוד כ-20 שניות תתחיל פעילות הוואר בציבורי להצטרפות",Count),SendClientMessageToAll(RED2,string);
format(string,sizeof(string),".[%d] :מספר משתתפים ,[%d] סכום הזכייה בקארט עלה ל",MoneyWinnerWar,WarPlayers),SendClientMessageToAll(COLOR_GREEN,string);
}
else if(Count == 10)
{
format(string,sizeof(string),"/war :בעוד כ-10 שניות תתחיל פעילות הוואר בציבורי להצטרפות",Count),SendClientMessageToAll(RED2,string);
format(string,sizeof(string),".[%d] :מספר משתתפים ,[%d] סכום הזכייה בוואר על ל",MoneyWinnerWar,WarPlayers),SendClientMessageToAll(COLOR_GREEN,string);
}
new String[256];
format(String, 256,"~w~~>~ ~w~/War: ~r~ %d ~<~",Count);
for(new i = 0; i < MAX_PLAYERS; i++)
PlayerPlaySound(i,1058, 0.0, 0.0, 0.0);
GameTextForAll(String,1000,4);
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
for(new i;i<MAX_PLAYERS;i++)
{
if(PP[i] == 1)
{
TogglePlayerControllable(i, 1);
SetCameraBehindPlayer(i);
PlayerPlaySound(i,1056, 0.0, 0.0, 0.0);
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

SendClientMessageToAll(0x0F482FF,"מערכת הוואר תתחיל בועד מספר שניות");
format(string,sizeof(string)," %d :מס' משתתפים",WarPlayers),SendClientMessageToAll(0x0F482FF,string);
format(string,sizeof(string)," $%d :סכום זכייה שנקבע על ידי השחקנים הוא",MoneyWinnerWar),SendClientMessageToAll(0x0F482FF,string);

for(new i;i<MAX_PLAYERS;i++)
{
if(InWar[i] == 1)
{
//new string[256];

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
for(new i;i<MAX_PLAYERS;i++)
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
SendClientMessageToAll(red, ".הוואר בוטל סיבה: מספר משתתפים נמוך מ-2");
SendClientMessageToAll(red, ".כל שחקן שהצטרף קיבל פיצוי בסך 500 דולר");
WarOn = 0; WarPlayers = 0;
KillTimer(CTP);
KillTimer(SAS);
for(new i;i<MAX_PLAYERS;i++)
{
InWar[i] = 0;  PP[i] = 0; WS = 0; knoob = 0;
InWar[i] = 0;  PP[i] = 0; WS = 0; knoob = 0;
if(PP[i] == 1)
{
SendClientMessage(i,COLOR_ORANGE,".קיבלת פיצוי בסך [500] דולר על סיבה: חוסר משתתפים בוואר");
SetPlayerPos(i,2144.1472,1634.6127,993.5761);
SetPlayerInterior(i,1);
LACY_GiveMoney(i,500);
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
format(knob, sizeof(knob), "~W~ The Winner Is ~n~~r~%s", playername);
GameTextForAll(knob, 4000, 1);
KillTimer(CTP);
KillTimer(SAS);
ResetPlayerWeapons(WarWinner);
SetPlayerInterior(WarWinner, 0);


PP[WarWinner] =0;
InWar[WarWinner]=0;

//new string[256];
PlayerInfo[WarWinner][Wars] ++;
SendClientMessageToAll(COLOR_WHITE,"[________ מנצח בקרב וואר ________]");
SendClientMessageToAll(0xFFFF00AA, "מלחמת השרת הסתיימה");
format(fuxm, sizeof(fuxm), ".$%d נשאר אחרון וזכה בפרס של ,%s",MoneyWinnerWar, playername),SendClientMessageToAll(0xFFFF00AA, fuxm);
format(fuxm, sizeof(fuxm), ".%d :מספר הנצחנות שלו בוואר",PlayerInfo[WarWinner][Wars]),SendClientMessageToAll(0xFFFF00AA, fuxm);
format(fuxm, sizeof(fuxm), ".[%d] :המשתתפים שהשתתפו",WarPlayers),SendClientMessageToAll(0xFFFF00AA, fuxm);
SendClientMessageToAll(COLOR_WHITE,"[________ .הפעילות הסתיימה נתראה בפעילות הבאה ________]");
SetPlayerPos(WarWinner,2144.1472,1634.6127,993.5761);
SetPlayerInterior(WarWinner,1);
SendClientMessage(WarWinner,COLOR_LIGHTBLUE,".שוגרת אוטומטית לבנק");
GameTextForPlayer(WarWinner,"~w~Bank",3000,5);
MoneyWinnerWar=0;
WarOn = 0; WarPlayers = 0;
TogglePlayerControllable(WarWinner, 1);

for(new i;i<MAX_PLAYERS;i++)
{
InWar[i] = 0; WS = 0; PP[i] = 0; knoob = 0;
}
return 1;
}
else if(status == 2)
{
format(knob, sizeof(knob), ".ביטל את המילחמה \"%s\" האדמין ", Adminname);
SendClientMessageToAll(COLOR_ORANGE, knob);
WarPlayers = 0;
knoob = 0; WS = 0;
WarOn = 0;
Count = 0; CountFuc = 0;
KillTimer(CTP);
KillTimer(SAS);
for(new i;i<MAX_PLAYERS;i++)
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
SendClientMessageToAll(COLOR_WHITE,"[___________ .Minigun Mode - מוד מיניגאן ___________]");
SendClientMessageToAll(COLOR_ORANGE, " /mini :מערכת המיניגאן החלה להצטרפות");
SendClientMessageToAll(COLOR_ORANGE, ".יש לכם 35 שניות להירשם");
SendClientMessageToAll(COLOR_GREEN, ".מספר המקומות הוא 40");
format(string,sizeof(string),".[$%d] :סכום זכייה התחלתי",MoneyWinnerMini),SendClientMessageToAll(0xFFFF00AA,string);
SendClientMessageToAll(0xFFFF00AA, "שיב לב כל שחקן שמצטרף זה מעלה תסכום זכייה ב500 דולר");
SendClientMessageToAll(COLOR_WHITE,"[_________________________________]");
WarOnw = 1; WarPlayersw = 0;
Countw = 35; Countdownw(); CountFucw = 1;
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
format(string,sizeof(string),"[%d] מספר המשתתפים עלה ל ,/mini :להצטרפות",WarPlayersw);
SendClientMessageToAll(COLOR_GREEN,string);
format(string,sizeof(string),".[$%d] :סכום הזכייה במיניגאן עלה ל",MoneyWinnerMini);
SendClientMessageToAll(RED2,string);
}
else if(Countw == 15)
{
format(string,sizeof(string),"[%d] מספר המשתתפים עלה ל ,/mini :להצטרפות",WarPlayersw);
SendClientMessageToAll(COLOR_GREEN,string);
format(string,sizeof(string),".[$%d] :סכום הזכייה במיניגאן עלה ל",MoneyWinnerMini);
SendClientMessageToAll(RED2,string);
}
new String[256];
format(String, 256,"~w~/Mini: ~r~ %d ~n~~r~Players %d ",Countw,WarPlayersw);
for(new i = 0; i < MAX_PLAYERS; i++)
PlayerPlaySound(i,1058, 0.0, 0.0, 0.0);
GameTextForAll(String,1000,4);
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
for(new i;i<MAX_PLAYERS;i++)
{
if(PPw[i] == 1)
{
TogglePlayerControllable(i, 1);
SetCameraBehindPlayer(i);
PlayerPlaySound(i,1056, 0.0, 0.0, 0.0);
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
SendClientMessageToAll(0x0F482FF,"מערכת המיניגאן תתחיל בעוד מספר שניות");
format(string,sizeof(string)," %d :מס' משתתפים",WarPlayersw),SendClientMessageToAll(0x0F482FF,string);
format(string,sizeof(string)," $%d :סכום זכייה שנקבע על ידי השחקנים הוא",MoneyWinnerMini),SendClientMessageToAll(0x0F482FF,string);


for(new i;i<MAX_PLAYERS;i++)
{
if(InWarw[i] == 1)
{
//new string[256];



KillTimer(AntiOff);

new randw = random(sizeof(sssaw));
SetPlayerPos(i, sssaw[randw][0], sssaw[randw][1], sssaw[randw][2]);
//SetPlayerInterior(i, 10);
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
SendClientMessageToAll(red,"המיניגאן בוטל, סיבה חוסר משתתפים.");

WarOnw = 0; WarPlayersw = 0;
KillTimer(CTPw);
KillTimer(SASw);
for(new i;i<MAX_PLAYERS;i++)
{
InWarw[i] = 0;  PPw[i] = 0; WSw= 0; knoobw = 0;

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
SendClientMessageToAll(COLOR_WHITE,"[________ Minigun Winner - :D ________]");
SendClientMessageToAll(0xFFFF00AA, "מלחמת המיניגאן הסתיימה בהצלחה");
format(fuxm, sizeof(fuxm), ".$%d נשאר אחרון וזכה בפרס של %s",MoneyWinnerMini,GetName(WarWinnerw)),SendClientMessageToAll(0xFFFF00AA, fuxm);
format(fuxm, sizeof(fuxm), ".%d מספר הנצחנות שלו במיניגאן הוא",PlayerInfo[WarWinnerw][MINIGUN]),SendClientMessageToAll(0xFFFF00AA, fuxm);
format(fuxm, sizeof(fuxm), ".[%d] :המשתתפים שהשתתפו",WarPlayersw),SendClientMessageToAll(0xFFFF00AA, fuxm);
SendClientMessageToAll(COLOR_WHITE,"[________ .פעילות המיניגאן הסתיימה! נתראה בפעילות הבאה ________]");
SetPlayerPos(WarWinnerw,2144.1472,1634.6127,993.5761);
SetPlayerInterior(WarWinnerw,1);
MoneyWinnerMini=0;

TogglePlayerControllable(WarWinnerw, 1);
WarOnw = 0; WarPlayersw = 0;
for(new i;i<MAX_PLAYERS;i++)
{
InWarw[i] = 0; WSw = 0; PPw[i] = 0; knoobw = 0;

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
for(new i;i<MAX_PLAYERS;i++)
{
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
for(new i;i<MAX_PLAYERS;i++)
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




//=PlayerToPoint==============================================================
forward PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z);
public PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z)
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
//=Levels=========================================================================
forward Levels();
public Levels()
{
new string[256];
for(new i;i<MAX_PLAYERS;i++)
{
if(IsPlayerConnected(i))
{

if (PlayerInfo[i][Level] == 0 && PlayerInfo[i][Kills] >= 100)
{
PlayerInfo[i][Level] +=1;

SetPlayerWantedLevel(i,1);
SendClientMessage(i,COLOR_LIGHTBLUE," עכשיו אתה רמה 1 ");
format(string, sizeof(string), ".[%d] עבר/ה לרמה %s", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_GREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
PlayerInfo[i][aLevelnl]=2;
PlayerInfo[i][aKillsnl]=200;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);



}
if (PlayerInfo[i][Level] == 1 && PlayerInfo[i][Kills] >= 300)
{
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,2);
SendClientMessage(i,COLOR_LIGHTBLUE," עכשיו אתה רמה 2 ");
format(string, sizeof(string), " %d עבר/ה לרמה %s", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_GREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "בייבי סטלה זון");
PlayerInfo[i][aLevelnl]=3;
PlayerInfo[i][aKillsnl]=200;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

}
if (PlayerInfo[i][Level] == 2 && PlayerInfo[i][Kills] >= 500)
{
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,3);
SendClientMessage(i,COLOR_LIGHTBLUE," עכשיו אתה רמה 3 ");
format(string, sizeof(string), " %d עבר/ה לרמה %s", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_GREEN, string);
PlayerInfo[i][aLevelnl]=4;
PlayerInfo[i][aKillsnl]=200;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
}
if (PlayerInfo[i][Level] == 3 && PlayerInfo[i][Kills] >= 700)
{
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,4);
SendClientMessage(i,COLOR_LIGHTBLUE," עכשיו אתה רמה 4 ");
format(string, sizeof(string), " %d עבר/ה לרמה %s", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_GREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "סטלן מתפתח בסטלה זון");
PlayerInfo[i][aLevelnl]=5;
PlayerInfo[i][aKillsnl]=300;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

}
if (PlayerInfo[i][Level] == 4 && PlayerInfo[i][Kills] >= 1000) {
PlayerInfo[i][Level] +=1;
PlayerInfo[i][VIPS]++;
SetPlayerWantedLevel(i,5);
SendClientMessage(i,COLOR_LIGHTBLUE," אתה עכשיו רמה 5");
format(string, sizeof(string), " !%d :ViP עלה לרמת  %s", PlayerInfo[i][VIPS], GetName(i));
SendClientMessageToAll(COLOR_GREEN, string);
format(string, sizeof(string), " %d עבר/ה לרמה %s", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_GREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
PlayerInfo[i][aLevelnl]=6;
PlayerInfo[i][aKillsnl]=300;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

}

if (PlayerInfo[i][Level] == 5 && PlayerInfo[i][Kills] >= 1300) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,6);
SendClientMessage(i,COLOR_LIGHTBLUE,"אתה עכשיו רמה 6");
format(string, sizeof(string), " %d עבר/ה לרמה %s", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_GREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "פרו סטלה");
PlayerInfo[i][aLevelnl]=7;
PlayerInfo[i][aKillsnl]=300;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);


}
if (PlayerInfo[i][Level] == 6 && PlayerInfo[i][Kills] >= 1600) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,7);
SendClientMessage(i,COLOR_LIGHTBLUE," אתה עכשיו רמה 7 ");
format(string, sizeof(string), " %d עבר/ה לרמה %s", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_GREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
PlayerInfo[i][aLevelnl]=8;
PlayerInfo[i][aKillsnl]=100;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

}
if (PlayerInfo[i][Level] == 7 && PlayerInfo[i][Kills] >= 1700) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,8);
SendClientMessage(i,COLOR_LIGHTBLUE," עכשיו אתה רמה 8");
format(string, sizeof(string), " %d עבר/ה לרמה %s", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_GREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "סטלן רוצח פרו");
PlayerInfo[i][aLevelnl]=9;
PlayerInfo[i][aKillsnl]=200;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

}
if (PlayerInfo[i][Level] == 8 && PlayerInfo[i][Kills] >= 1900) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,9);
SendClientMessage(i,COLOR_LIGHTBLUE,"עכשיו אתה רמה 9 ");
format(string, sizeof(string), " %d עבר/ה לרמה %s", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_GREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
PlayerInfo[i][VIPS]++;
format(string, sizeof(string), " !%d :ViP עלה לרמת  %s", PlayerInfo[i][VIPS], GetName(i));
SendClientMessage(i, COLOR_GREEN, string);
PlayerInfo[i][aLevelnl]=10;
PlayerInfo[i][aKillsnl]=200;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

}
if (PlayerInfo[i][Level] == 9 && PlayerInfo[i][Kills] >= 2100) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
SendClientMessage(i,COLOR_LIGHTBLUE," עכשיו אתה רמה 10");
format(string, sizeof(string), " %d עבר/ה לרמה %s", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_GREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "רוצח כבדוניק");
PlayerInfo[i][aLevelnl]=11;
PlayerInfo[i][aKillsnl]=400;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

}
if (PlayerInfo[i][Level] == 10 && PlayerInfo[i][Kills] >= 2500) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
SendClientMessage(i,COLOR_LIGHTBLUE," עכשיו אתה רמה 11");
format(string, sizeof(string), " %d עבר/ה לרמה %s", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_GREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "הרוצח של סטלה");
PlayerInfo[i][aLevelnl]=12;
PlayerInfo[i][aKillsnl]=500;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

}
if (PlayerInfo[i][Level] == 11 && PlayerInfo[i][Kills] >= 3000) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
SendClientMessage(i,COLOR_LIGHTBLUE," עכשיו אתה רמה 12");
format(string, sizeof(string), " %d עבר/ה לרמה %s", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_GREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "מסוכן");
PlayerInfo[i][aLevelnl]=13;
PlayerInfo[i][aKillsnl]=600;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

}
if (PlayerInfo[i][Level] == 12 && PlayerInfo[i][Kills] >= 3600) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
SendClientMessage(i,COLOR_LIGHTBLUE," עכשיו אתה רמה 13");
format(string, sizeof(string), "%d עלה לרמה %s", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_GREEN, string);
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
SendClientMessage(i,COLOR_LIGHTBLUE," עכשיו אתה רמה 14");
format(string, sizeof(string), " %d עבר/ה לרמה %s", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_GREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "זה הרוצח של סטלה זון");
PlayerInfo[i][VIPS]++;
format(string, sizeof(string), " !%d :ViP עלה לרמת  %s", PlayerInfo[i][VIPS], GetName(i));
SendClientMessageToAll(COLOR_GREEN, string);
PlayerInfo[i][aLevelnl]=15;
PlayerInfo[i][aKillsnl]=600;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

}
if (PlayerInfo[i][Level] == 14 && PlayerInfo[i][Kills] >= 4600) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
SendClientMessage(i,COLOR_LIGHTBLUE," עכשיו אתה רמה 15");
format(string, sizeof(string), " %d עבר/ה לרמה %s", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_GREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "אין מילים");
PlayerInfo[i][aLevelnl]=16;
PlayerInfo[i][aKillsnl]=500;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);
}
if (PlayerInfo[i][Level] == 15 && PlayerInfo[i][Kills] >= 5100) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
SendClientMessage(i,COLOR_LIGHTBLUE," עכשיו אתה רמה 16");
format(string, sizeof(string), " %d עבר/ה לרמה %s", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_GREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "צ'מפיון רוצח");
PlayerInfo[i][aLevelnl]=17;
PlayerInfo[i][aKillsnl]=1000;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

}
if (PlayerInfo[i][Level] == 16 && PlayerInfo[i][Kills] >= 6100) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
SendClientMessage(i,COLOR_LIGHTBLUE," עכשיו אתה רמה 17");
format(string, sizeof(string), " %d עבר/ה לרמה %s", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_GREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "ההתקרבות על אחריותכם בלבד");
PlayerInfo[i][aLevelnl]=18;
PlayerInfo[i][aKillsnl]=1000;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

}
if (PlayerInfo[i][Level] == 17 && PlayerInfo[i][Kills] >= 7100) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
SendClientMessage(i,COLOR_LIGHTBLUE," עכשיו אתה רמה 18");
format(string, sizeof(string), " %d עבר/ה לרמה %s", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_GREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", ":D");
PlayerInfo[i][VIPS]++;
format(string, sizeof(string), " !%d :ViP עלה לרמת  %s", PlayerInfo[i][VIPS], GetName(i));
SendClientMessage(i, COLOR_GREEN, string);
PlayerInfo[i][aLevelnl]=19;
PlayerInfo[i][aKillsnl]=1000;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);
}
if (PlayerInfo[i][Level] == 18 && PlayerInfo[i][Kills] >= 8100) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
SendClientMessage(i,COLOR_LIGHTBLUE," עכשיו אתה רמה 19");
format(string, sizeof(string), " %d עבר/ה לרמה %s", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_GREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag","רוצח על ימין ושמאל");
PlayerInfo[i][aLevelnl]=20;
PlayerInfo[i][aKillsnl]=1000;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);


}
if (PlayerInfo[i][Level] == 19 && PlayerInfo[i][Kills] >= 9100) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
SendClientMessage(i,COLOR_LIGHTBLUE," עכשיו אתה רמה 19");
format(string, sizeof(string), " %d עבר/ה לרמה %s", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_GREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag","רוצח על ימין ושמאל++");
PlayerInfo[i][aLevelnl]=21;
PlayerInfo[i][aKillsnl]=1000;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);


}
if (PlayerInfo[i][Level] == 20 && PlayerInfo[i][Kills] >= 9100) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
SendClientMessage(i,COLOR_LIGHTBLUE," עכשיו אתה רמה 19");
format(string, sizeof(string), " %d עבר/ה לרמה %s", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_GREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag",".וותיק, שסיים תמשחק. הרג יותר מידי");


}}
}
return 1; }


forward OnPlayerStateChange(playerid, newstate, oldstate);
public OnPlayerStateChange(playerid, newstate, oldstate)
{
new msg[256];
new car = GetPlayerVehicleID(playerid);



if(PlayerInfo[playerid][Pets] ==1) {


if(PlayerInfo[playerid][Shark] ==1) {
DestroyStreamObject(sam33[playerid]);
SharkYou[playerid] =0;
ThePetsInYou[playerid] =0;
}
if(PlayerInfo[playerid][Dolp] ==1) {
DestroyStreamObject(sam22[playerid]);
ThePetsInYou[playerid] =0;
DolpYou[playerid] =0;
}
if(PlayerInfo[playerid][Tor] ==1) {

DestroyStreamObject(sam44[playerid]);
ThePetsInYou[playerid] =0;
TorYou[playerid] =0;
}
}

//new vehicleid = GetPlayerVehicleID(playerid);


if(newstate == PLAYER_STATE_DRIVER && GetVehicleModel(GetPlayerVehicleID(playerid)) == 520)
{
if (PlayerInfo[playerid][Level] < 0 && PlayerInfo[playerid][Kills] < 151)
{
SendClientMessage(playerid,COLOR_WHITE," מרמה 1 ומעךהHydra מטוס ה");
RemovePlayerFromVehicle(playerid);
}
}
 if(newstate == PLAYER_STATE_DRIVER && GetVehicleModel(GetPlayerVehicleID(playerid)) == 425)
{
if (PlayerInfo[playerid][Level] < 0 && PlayerInfo[playerid][Kills] < 151)
{
SendClientMessage(playerid,COLOR_WHITE," מרמה 1 ומעלהHunter מסוק");
RemovePlayerFromVehicle(playerid);
}
}
if(newstate == PLAYER_STATE_DRIVER && GetVehicleModel(GetPlayerVehicleID(playerid)) == 538)
{
if (PlayerInfo[playerid][AdminsLevel] >= 10)
{
new string[256];
SendClientMessageToAll(COLOR_WHITE,"[---- Survival System ----]");
format(string, sizeof(string), "!התחיל את משחק ההישרדות , %s האדמין ",GetName(playerid)),SendClientMessage(playerid, COLOR_ORANGE, string);
SendClientMessageToAll(COLOR_ORANGE,"/Survival :כדאי להצטרף למשחק הזינו תפקודה");
SendClientMessageToAll(COLOR_ORANGE,"[20,000] :המנצח יזכה בסכום כספי של");
SendClientMessageToAll(COLOR_ORANGE,"www.Satla-Zone.co.il :מי שיצלם תמונות ויעלה לפורום יזכה בפרסים לפורום");
SendClientMessageToAll(COLOR_WHITE,"[----------]");

}
else
{
SendClientMessage(playerid, COLOR_WHITE, ".רכבת ה`הישרדות` לאדמינים בלבד");
RemovePlayerFromVehicle(playerid);
}
{
}
}

if(GetPlayerVehicleID(playerid) == zibro ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro2 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro3 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro4 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro5 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro6 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro7 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro8 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro9 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro10 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro11 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro12 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro13 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro14 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro15 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro16 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro17 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori1 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori2 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori3 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori4 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori5) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori6 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori7 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori8 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori9 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori10 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori11 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori12 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori14 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori15 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori16 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori13 ) return format(msg,sizeof(msg),".הספציפי הזה הינו רכב ציבורי שלא ניתן לקנייתו [%s] רכב ה",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;

	if(GetPlayerVehicleID(playerid) >= VCount) return 1;

	

	if(newstate==PLAYER_STATE_DRIVER)
	{
		new PlayerName[100]; GetPlayerName(playerid,PlayerName,30);
		if(VehicleInfo[car][CarOwned] == 1)
		{
            if(strcmp(PlayerName,VehicleInfo[car][CarOwner],true) == 0) {
		    format(msg,sizeof(msg),".%s ,שלך [%s] - ברוך הבא לרכב ה",VehicleInfo[car][CarOwner],VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
		    SendClientMessage(playerid,0x33CCFFAA,msg);
            } else {
			format(msg,sizeof(msg),".ולכן לא ניתן לקנייה %s רכב זה הינו בבעלות [%s]",VehicleInfo[car][CarOwner],VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
	        SendClientMessage(playerid,0x33CCFFAA,msg); }



		}
		else
		{
if(NoForSell[playerid]==0){
format(msg,sizeof(msg),"[$%d] - עומד למכירה במחיר של כ [%s] שלום לך , רכב זה מסוג",VehicleInfo[car][Price], VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
SendClientMessage(playerid,COLOR_LIGHTBLUE,msg);
SendClientMessage(playerid,COLOR_LIGHTBLUE,"/Car - לפרטים על רכב זה הקלד/י");
}
if(NoForSell[playerid] ==1) {

}
}
}
//}

return 1;
}









forward HornA(playerid);
forward HornB(playerid);

public HornA(playerid)
{
new Float:X, Float:Y, Float:Z;
GetPlayerPos(playerid, X, Y, Z);
PlayerPlaySound(playerid, 1147, X, Y, Z);
}
public HornB(playerid)
{
new Float:X, Float:Y, Float:Z;
GetPlayerPos(playerid, X, Y, Z);
PlayerPlaySound(playerid, 1147, X, Y+5, Z);
}


forward NitroReset();
public NitroReset()
{
for(new i = 0; i<MAX_PLAYERS; i++)
{
if(!IsPlayerInInvalidNosVehicle(i,GetPlayerVehicleID(i))) //ty @ [fackin'] luke //notice the "."
{
new vehicle = GetPlayerVehicleID(i);
AddVehicleComponent(vehicle, 1010);
}
}
}

IsPlayerInInvalidNosVehicle(playerid,vehicleid)
{
#define MAX_INVALID_NOS_VEHICLES 29
new InvalidNosVehicles[MAX_INVALID_NOS_VEHICLES] =
{
581,523,462,521,463,522,461,448,468,586,
509,481,510,472,473,493,595,484,430,453,
452,446,454,590,569,537,538,570,449
};
vehicleid = GetPlayerVehicleID(playerid);
if(IsPlayerInVehicle(playerid,vehicleid))
{
for(new i = 0; i < MAX_INVALID_NOS_VEHICLES; i++)
{
if(GetVehicleModel(vehicleid) == InvalidNosVehicles[i])
{
return true;
}
}
}
return false;
}
/*
GivePlayerWeapons(playerid, weapon1, ammo1, weapon2, ammo2)
{
GivePlayerWeapon(playerid, weapon1, ammo1);
GivePlayerWeapon(playerid, weapon2, ammo2);
return 1;
}
*/
public SellWangExportVehicle(playerid) {
new string[256];
new wantedVehicle = -1;
for(new i=0;i<MAX_WANGEXPORTVEHICLES;i++) {
if(wantedWangExportVehicles[i]==wantedWangExportVehicle) {
wantedVehicle = i;
break;
}
}
if(wantedVehicle>=0) {
 
if(GetVehicleModel(GetPlayerVehicleID(playerid))!=wantedWangExportVehicle) {
format(string,256,".מוסך וואנג לא קונה רכב זה כרגע תודה");
SendClientMessage(playerid,WHITE,string);
return 1;
}
//if(Sell[playerid] == wantedWangExportVehicle) return SendClientMessage(playerid, 0x0C4E0FF, ".כבר מכרת רכב מסוג זה");
new payment = (random(7)+1)*1000;
format(string, sizeof(string), ".``$%d`` תודה לך על הבאת הרכב למוסך וואנג , על רכב זה קיבלת כ",payment);
SendClientMessage(playerid,red, string);
LACY_GiveMoney(playerid, payment);
SetVehicleToRespawn(GetPlayerVehicleID(playerid));
Sell[playerid] = wantedWangExportVehicle;
}

//SetPlayerPos(playerid, checkpoints[CP_WANGEXPORTS][0],checkpoints[CP_WANGEXPORTS][1],checkpoints[CP_WANGEXPORTS][2]);
return 1;
}
//CARSYS

new CountingRace;
new CountRace;
forward StartRace();
public StartRace()
{
SendClientMessageToAll(COLOR_WHITE,"[__________ Race system - מערכת מירוצים__________]");
SendClientMessageToAll(COLOR_ORANGE,"בעוד 45 שניות תתחיל מהערכת המירוצים");
SendClientMessageToAll(COLOR_ORANGE,".מטרת הפעילות זה להגיע למהירות מהירה,ולסיים את החיצים האדומים");
SendClientMessageToAll(COLOR_GREEN,":פקודות מירוץ");
SendClientMessageToAll(0xFFFF00AA,"/joinrace :להצטרפות לפעילות מירוציפ");
SendClientMessageToAll(0xFFFF00AA,".(/race/ramp/dj/carpark /drift) :מקומות מומלצים לקחת רכבים למירוץ ");
SendClientMessageToAll(0xFFFF00AA,".פרס 20,000 דולר");
SendClientMessageToAll(COLOR_WHITE,"[__________ Race system - מערכת מירוצים__________]");
CountingRace = 45; RaceCount(); CountRace = 1;
return 1;
}





new CountingDrift;
new CountDrift;
forward StartDrift();
public StartDrift()
{
SendClientMessageToAll(COLOR_WHITE,"[__________ Drift system - מערכת דריפטים__________]");
SendClientMessageToAll(COLOR_ORANGE,"בעוד 45 שניות תתחיל מהערכת הדריפטים");
SendClientMessageToAll(COLOR_ORANGE,".מטרת הפעילות זה להחליק על הכביש ולהגיע ראשון לחניון למטה,שים לב! אתה יכול להחרות רק עם הרכב");
SendClientMessageToAll(COLOR_ORANGE,"Turismo :על מנת להשתתף אתה צריך להיות ברכב");
SendClientMessageToAll(COLOR_GREEN,":פקודות מירוץ הדריפט");//0xFFFF00AA
SendClientMessageToAll(0xFFFF00AA,"/joindrift :להצטרפות לפעילות דריפטים");
SendClientMessageToAll(0xFFFF00AA,".(/race /dj /drift) :``Turismo`` מקומות בהם מוצבים הרכבים");
SendClientMessageToAll(0xFFFF00AA,".פרס 20,000 דולר ");
SendClientMessageToAll(COLOR_WHITE,"[__________ Drift system - מערכת דריפטים__________]");
CountingDrift=45; driftCount(); CountDrift=1;
return 1;
}

forward driftCount();
public driftCount() {
new string[256];
if(CountDrift == 30)
{
SendClientMessageToAll(0xFFFF00AA, "/joindrift :בעוד כ30 שניות יתחיל פעילות הדריפטים");
format(string,sizeof(string),".%d :מספר המשתתפים במירוץ דריפטים בנתיים",DriftPlayer);
SendClientMessageToAll(COLOR_GREEN,string);
}
else if(CountDrift == 15)
{
SendClientMessageToAll(0xFFFF00AA, "/joindrift :בעוד כ30 שניות יתחיל פעילות הדריפטים");
format(string,sizeof(string),".%d :מספר המשתתפים במירוץ דריפטים בנתיים",DriftPlayer);
SendClientMessageToAll(COLOR_PURPLE,string);
}
new String[256];
format(String, 256,"~w~~>~ ~w~/joindrift: ~r~ %d ~<~",CountingDrift);
for(new i = 0; i < MAX_PLAYERS; i++)
PlayerPlaySound(i,1058, 0.0, 0.0, 0.0);
GameTextForAll(String,1000,4);
if(CountingDrift > 0) {
--CountingDrift;
SetTimer("driftCount", 1000, 0);
} else {
if(CountDrift == 1) {

if(knoobk == 1) {
CountingDrift = 3; driftCount(); CountDrift = 2;
//Shiper1();
} }
if(CountDrift == 2 && CountingDrift <= 0) {

} } }


forward RaceCount();
public RaceCount() {
new string[256];
if(CountingRace == 30)
{
SendClientMessageToAll(0xFFFF00AA, "/joinrace :בעוד כ30 שניות יתחיל פעילות המירוצים להשתתפות");
format(string,sizeof(string),".%d :מספר המשתתפים במירוץ מכוניות",RacePlayers);
SendClientMessageToAll(COLOR_PURPLE,string);
}
else if(CountingRace == 15)
{
SendClientMessageToAll(0xFFFF00AA, "/joinrace :בעוד כ30 שניות יתחיל פעילות המירוצים להשתתפות");
format(string,sizeof(string),".%d :מספר המשתתפים במירוץ מכוניות",RacePlayers);
SendClientMessageToAll(COLOR_PURPLE,string); }

new String[256];
format(String, 256,"~w~~>~ ~w~/joinrace: ~r~ %d ~<~",CountingRace);
for(new i = 0; i < MAX_PLAYERS; i++)
PlayerPlaySound(i,1058, 0.0, 0.0, 0.0);
GameTextForAll(String,1000,4);
if(CountingRace > 0) {
--CountingRace;
SetTimer("RaceCount", 1000, 0);
} else {
if(CountRace == 1) {

if(knoobk == 1) {
CountingRace = 3; RaceCount(); CountRace = 2;
//Shiper1();
} }
if(CountRace == 2 && CountingRace <= 0) {

} } }
//---
new CountingRun;
new RunCount;
forward StartRun();
public StartRun()
{
SendClientMessageToAll(COLOR_WHITE,"[__________ Triatlon system - אתגר הטריאלטלון __________]");
SendClientMessageToAll(COLOR_ORANGE,"בעוד כ35 שניות יתחיל קרב הטריאטלון");
SendClientMessageToAll(COLOR_ORANGE,".במערכת יש שלושה סוגים של מירוץ 1 תחרות ריצה 2 שחיה 3 רכיבה על אופנעייפ");
SendClientMessageToAll(COLOR_GREEN,"להצטרפות לטריאטלון");
SendClientMessageToAll(0xFFFF00AA,"/tria :להצטרפות לפעילות טריאטלון");
SendClientMessageToAll(0xFFFF00AA,".פרס 20,000 דולר");
SendClientMessageToAll(COLOR_ORANGE,"בהצלחה באתגר לכל המשתתפים!!");
SendClientMessageToAll(COLOR_WHITE,"[__________ Triatlon system - אתגר הטריאלטלון __________]");
CountingRun = 35; RunCounts(); RunCount = 1;
return 1;
}


forward RunCounts();
public RunCounts() {
new string[256];
if(CountingRun == 30)
{
SendClientMessageToAll(0xFFFF00AA, "/tria :בעוד כ30 שניות יתחיל פעילות תחרות הטריאטלון להצטרפות");
format(string,sizeof(string),".%d :מספר המשתתפים במירוץ טריאטלון בנתיים",RunPlayers);
SendClientMessageToAll(COLOR_PURPLE,string);
}
else if(CountingRun == 15)
{
SendClientMessageToAll(0xFFFF00AA, "/tria :בעוד כ15 שניות יתחיל פעילות תחרות הטיראטלון להצטרפות");
format(string,sizeof(string),".%d :מספר המשתתפים במירוץ טריאטלון בנתיים",RunPlayers);
SendClientMessageToAll(COLOR_PURPLE,string);
}

new String[256];
format(String, 256,"~w~~>~ ~w~/Tria: ~r~ %d ~<~",CountingRun);
for(new i = 0; i < MAX_PLAYERS; i++)
PlayerPlaySound(i,1058, 0.0, 0.0, 0.0);
GameTextForAll(String,1000,4);
if(CountingRun > 0) {
--CountingRun;
SetTimer("RunCounts", 1000, 0);
} else {
if(RunCount == 1) {

if(knoobk == 1) {
CountingRun = 3; RunCounts(); RunCount = 2;
//Shiper1();
} }
if(RunCount == 2 && CountingRun <= 0) {

} } }




/*
forward rb2hex2();
public rb2hex2()
{

for(new i=0;i<MAX_PLAYERS;i++ && IsPlayerConnected(i))
{
if(PlayerToPoint2(220.0,i,212.5598,1895.0790,16.2901))
{
if(PlayerInfo[i][VIPS]> 1) return 0;


if(PlayerToPoint2(220.0,i,212.5598,1895.0790,16.2901))
{
new Float:pSA[3];
GetPlayerPos(i,pSA[0],pSA[1],pSA[2]);

if(pSA[2] >  26.0 && ThisIsSendMessage[i] ==0)
{
new string[256];
SendClientMessageToAll(red,".לא כדאי לך לרדת לתוך הבסיס הכריש יתקוף אותך! , ראה קיבלת אזהרה אנא תרחק מפה");

ThisIsSendMessage[i] =1;
GangZoneFlashForPlayer(i,VIPGangZone,10);
format(string,sizeof(string),".!!צאו להתקפה אווירת נגד הפולש VIPהכריש לא יכול לטפל בוא! חברי ה VIPמעל מפקדת ה,%s",GetName(i));
SendClientMessageToAll(0x0F482FF,string);
}
return 1;
}

new Float:pSA[3];
if(PlayerToPoint2(220.0,i,212.5598,1895.0790,16.2901))
{
if(pSA[2] <  26.0)
{
new TilMode;
new Float:x,Float:y,Float:z;
GetPlayerPos(i,x,y,z);
TilMode = CreateStreamObject(1608,x+4,y+4,z+1.6,0,0,0,200);
new Float:pos[3];
GetPlayerPos(i,pos[0],pos[1],pos[2]);
MoveStreamObject(TilMode,Pos[i][0],Pos[i][1],Pos[i][2],15);
new Float:health;
GetPlayerHealth(i, health);
SetPlayerHealth(i, health-80);
new Float:health2=health-80;
GetPlayerHealth(i,health);
SendClientMessage(i,red,"!לפני שתהרג !!! VIPתוקף אותך אנא צא מאיזור ה VIPזהירות !!! כריש ה");
GangZoneFlashForPlayer(i,VIPGangZone,15);


if(health2 < 1)
{
DestroyStreamObject(TilMode);
SendClientMessage(i,red,".VIPנהרגת על ידי כריש ה");
ThisIsSendMessage[i] =0;
GangZoneStopFlashForPlayer(i,VIPGangZone);
}
}
}
}
}
return 1;
}
forward inplayerinvip();
public inplayerinvip()
{
for(new i=0;i<MAX_PLAYERS;i++ && IsPlayerConnected(i))
{
if(PlayerToPoint2(220.0,i,212.5598,1895.0790,16.2901))
{
return 1;
}
}
return 0;
}

*/
/*
forward LcMove();
public LcMove()
{
if(IsAnyoneNearGateLc())
{
MoveStreamObject(lcdoor,-791.7070,494.4873,1371.7422,1.5);
}
else
{
MoveStreamObject(lcdoor,-791.7532,490.6403,1371.7500,1.5);
}
}

//AddPlayerClass(1,-791.9633,496.5938,1371.7490,359.6804,0,0,0,0,0,0); // near gate

forward IsAnyoneNearGateLc();
public IsAnyoneNearGateLc()
{
for(new i=0;i<MAX_PLAYERS;i++)
{
if(IsPlayerConnected(i))
{
if(PlayerToPoint2(6,i,-791.9633,496.5938,1371.7490))
{
return 1;
}
}
}
return 0;
}
*/
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

forward IsAnyoneNearGate();
public IsAnyoneNearGate()
{
for(new i=0;i<MAX_PLAYERS;i++)
{
if(IsPlayerConnected(i))
{
if(PlayerToPoint2(5.0,i,2144.19000,1627.10000,994.25700))
{
return 1;
}
}
}
return 0;
}
forward PlayerToPoint2(Float:radi, playerid, Float:x, Float:y, Float:z);
public PlayerToPoint2(Float:radi, playerid, Float:x, Float:y, Float:z)
{
if(IsPlayerConnected(playerid))
{
new Float:oldposx, Float:oldposy, Float:oldposz;
new Float:tempposx, Float:tempposy, Float:tempposz;
GetPlayerPos(playerid, oldposx, oldposy, oldposz);
tempposx = (oldposx -x);
tempposy = (oldposy -y);
tempposz = (oldposz -z);
//printf("DEBUG: X:%f Y:%f Z:%f",posx,posy,posz);
if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
{
return 1;
}
}
return 0;
}
//MonsterSystem





forward LevelUp();
public LevelUp()
{
new sstring[128];

for(new i;i<MAX_PLAYERS;i++)
{
if(IsPlayerConnected(i))
{

format(sstring, sizeof(sstring), "%d",PlayerInfo[i][Level]);
TextDrawSetString(LEVELTEXT, sstring);
}
}
return 1;
}
//--
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
				SendClientMessage(playerid,COLOR_BRIGHTRED,"Multiple users found, please narrow earch.");
			else
				SendClientMessage(playerid,COLOR_BRIGHTRED,"No matching user found.");
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
//=[IsPlayerLogged]===========================F==================================
/*F
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
        //dini_IntSet(ConfigFile,"Wars",0);
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
 		format(string,sizeof(string),"Clan=%s\r\n","None"); fwrite(f,string);
        format(string,sizeof(string),"Password=%s\r\n",password); fwrite(f,string);
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
		format(string,sizeof(string),"CarID=%d\r\n",0); fwrite(f,string);
		format(string,sizeof(string),"OwnCar=%d\r\n",0); fwrite(f,string);
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

		fclose(f);
	}
	return 1;
}
//=[LoginPlayer]================================================================
/*
	native LoginPlayer(playerid);
*/
stock LoginPlayer(playerid)
{
	    new date[3], time[3];
	    if(dini_Exists(GetPlayerFile(playerid)))
	    {
		PlayerInfo[playerid][Logged] = 1;
		PlayerInfo[playerid][FL] = 0;
		getdate(date[0],date[1],date[2]);
		gettime(time[0],time[1],time[2]);
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
		PlayerInfo[playerid][CarID] = dini_Int(GetPlayerFile(playerid),"CarID");
		PlayerInfo[playerid][OwnCar] = dini_Int(GetPlayerFile(playerid),"OwnCar");
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
        LACY_GiveMoney(playerid,PlayerInfo[playerid][Money]);
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

		}
	    return 1;
        }
////////////------------------------------------------
forward TeleCar(playerid);
public TeleCar(playerid) {
if(IsPlayerInAnyVehicle(playerid)) SetVehiclePos(GetPlayerVehicleID(playerid), Pos[playerid][0], Pos[playerid][1], Pos[playerid][2]+0.5);
SetVehicleZAngle(GetPlayerVehicleID(playerid), Angle[playerid]);
SetCameraBehindPlayer(playerid);
}

forward RepairCar(playerid);
public RepairCar(playerid) {
if(IsPlayerInAnyVehicle(playerid)) SetVehiclePos(GetPlayerVehicleID(playerid), Pos[playerid][0], Pos[playerid][1], Pos[playerid][2]+0.5);
SetVehicleZAngle(GetPlayerVehicleID(playerid), Angle[playerid]);
SetCameraBehindPlayer(playerid);
}
        forward UnLockCar(playerid);
        public UnLockCar(playerid){
        new PlayerName[100];
   		new vehicleid = GetPlayerVehicleID(playerid);
        GetPlayerName(playerid,PlayerName,30);
        if(!(IsPlayerInAnyVehicle(playerid))) return 1;
   		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 1;if(GetPlayerVehicleID(playerid) >= VCount) return 1;
		if(strcmp(PlayerName,VehicleInfo[vehicleid][CarOwner],true) != 0) return 1;
        if(VehicleInfo[vehicleid][CarOwned] == 0 ) return 1;
		if(PlayerInfo[playerid][CarID] == 0) return 1;
        for (new i=0;i<MAX_PLAYERS;i++) if(i != playerid) SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 0);
		VehicleInfo[vehicleid][CarLocked] = 0;
        return 1;
   }
//----
/*
forward mStats();
public mStats()
{
	for(new i = 0;i < MAX_PLAYERS;i++)
	{
		if(IsPlayerConnected(i))
		{
		    new string[256];
		    new Float:Health;
			new Float:Armour;
			new Float:X, Float:Y, Float:Z;
			new Ping = GetPlayerPing(i);
			new Interior = GetPlayerInterior(i);
			new SkinID = GetPlayerSkin(i);
			new Score = GetPlayerScore(i);
		    GetPlayerHealth(i,Health);
		    GetPlayerArmour(i,Armour);
		    GetPlayerPos(i,X,Y,Z);
		   	format(string,sizeof(string),"~n~~w~Armour: %.0f ~n~~r~Health:  %.0f ~n~~y~Score: ~w~%d ~y~~n~Skin: ~w~%d~n~~y~Ping: ~w~%d ~y~~n~Interior: ~w~%d~n~%.4f, %.4f, %.4f", Armour, Health, Score, SkinID, Ping, Interior, X, Y, Z);
			TextDrawSetString(Stats[i],string);
		}
	}
}
*/
forward mStats();
public mStats()
{
	for(new i = 0;i < MAX_PLAYERS;i++)
	{
		if(IsPlayerConnected(i))
		{
TextDrawShowForPlayer(i, Stats[i]);
new string[256];
format(string,sizeof(string),"~n~~W~Level: %d ~n~~w~Kills %d ~n~~w~Bank: %d ~n~~w~Wars: %d ~n~~w~ViP: %d",PlayerInfo[i][Level],PlayerInfo[i][Kills], PlayerInfo[i][Bank],PlayerInfo[i][Wars],PlayerInfo[i][VIPS]);
TextDrawSetString(Stats[i],string);
SetTimer("Hide",6000,0);
//format(string, sizeof(string), "Your stats: Level: %d, Kills: %d,  Bank: %d,  Wars: %d, ViP: %d,",PlayerInfo[playerid][Level],PlayerInfo[playerid][Kills], PlayerInfo[playerid][Bank],PlayerInfo[playerid][Wars],PlayerInfo[playerid][VIPS]);
//SendClientMessage(playerid, 0xF06E8DFF, string);
		}
	}
}
forward Hide(playerid);
public Hide(playerid) {
TextDrawHideForPlayer(playerid, Stats[playerid]);

return 1;
}
//--

//-----------------------
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
//-----------------------
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

//-----------------------
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

stock strcpy( dest[ ], src[ ], startdest = 0, startsrc = 0 )
{
        // Made by Peter.

        for ( new i = startsrc, j = strlen( src ); i < j; i++ )
        {
                dest[ startdest++ ] = src[ i ];
        }
        dest[ startdest ] = 0;
}

forward CWarnings();
public CWarnings() {

for(new i;i<MAX_PLAYERS;i++)
{
if(IsPlayerConnected(i))
{

if (PlayerInfo[i][Warnings] >=10)
{
Kick(i);
//Kick(i);
}
}
}
return 1;
}
//---
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
new Countker;
new CountFucker;


//-- SHIP UP Down System --
forward Shiper();
public Shiper()
{
SendClientMessageToAll(COLOR_WHITE," [ ----- ספינת הפראטים מערכת ----- ]");
SendClientMessageToAll(COLOR_LIGHTBLUE,"/ship ספינת הפיראטים תתחיל בעוד כ30 שניות על מנת להירשם");
SendClientMessageToAll(COLOR_LIGHTBLUE,".הספינה עולה ויורדת ומטרה להישאר עליה");
SendClientMessageToAll(COLOR_WHITE," [ ------------ ]");
shipworked=1;
Countker = 30; shipshipship(); CountFucker = 1;
SetTimer("Shiper1",30*1000,0);
return 1;
}
forward Shiper1();
public Shiper1()
{
MoveStreamObject(ship, 1863.319824, 1529.951660, 440.383423, 4); // UpGoat
SendClientMessageToAll(COLOR_WHITE,".ספינת הפיראטים התחילה בהצלחה");
SetTimer("Shiper2",20*1000,0);
shipworked=0;
return 1;
}
forward Shiper2();
public Shiper2()
{
MoveStreamObject(ship,  1863.307739, 1529.444336, 24.975296, 8.6);// DownGoat
SendClientMessageToAll(COLOR_WHITE,".ספינת הפיראטים מתחילה לרדת");
shipworked=0;
return 1;
}

//==================================cuntdownk===================================

forward shipshipship();
public shipshipship() {

if(Countker == 15)
{
SendClientMessageToAll(COLOR_WHITE, "/ship :בעוד 15 שניות תתחיל הספינת פיראטים שעולה ויורדת להרשמה");
}
else if(Countker == 5)
{
SendClientMessageToAll(COLOR_WHITE, "/ship :בעוד 5 שניות יתחיל הספינה פיראטים שעולה ויורדת להצטרפות");
 }

new String[256];
format(String, 256,"~w~~>~ ~w~/ship: ~r~ %d ~<~",Countker);
for(new i = 0; i < MAX_PLAYERS; i++)
PlayerPlaySound(i,1058, 0.0, 0.0, 0.0);
GameTextForAll(String,1000,4);
if(Countker > 0) {
--Countker;
SetTimer("shipshipship", 1000, 0);
} else {
if(CountFucker == 1) {

if(knoobk == 1) {
Countker = 3; shipshipship(); CountFucker = 2;
//Shiper1();
} }
if(CountFucker == 2 && Countker <= 0) {

} } }
//---
/*
forward ProxDetectorS(Float:radi, playerid, targetid);
public ProxDetectorS(Float:radi, playerid, targetid)
{
    if(IsPlayerConnected(playerid)&&IsPlayerConnected(targetid))
 {
  new Float:posx, Float:posy, Float:posz;
  new Float:oldposx, Float:oldposy, Float:oldposz;
  new Float:tempposx, Float:tempposy, Float:tempposz;
  GetPlayerPos(playerid, oldposx, oldposy, oldposz);
  //di = 2.0; //Trigger Radius
  GetPlayerPos(targetid, posx, posy, posz);
  tempposx = (oldposx -posx);
  tempposy = (oldposy -posy);
  tempposz = (oldposz -posz);
  //printf("DEBUG: X:%f Y:%f Z:%f",posx,posy,posz);
  if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
  {
   return 1;
  }
 }
 return 0;
}


forward onplayerescapebattle(playerid);
public onplayerescapebattle(playerid) {
new Float:x,Float:y,Float:z;
GetPlayerPos(playerid,x,y,z);
new distance[MAX_PLAYERS];
new playerxyz[MAX_PLAYERS];
distance[playerid] = floatsqroot(floatpower(floatabs(floatsub(x,playerxyz[playerid][LastX])),2))+floatpower(floatabs(floatsub(y,playerxyz[playerid][LastY])),2))+floatpower(floatabs(floatsub(z,playerxyz[playerid][LastZ])),2));
playerxyz[playerid][LastX] =x;
playerxyz[playerid][LastY] =y;
playerxyz[playerid][LastZ] =z;
return floatround(distance[playerid]*3.3);
}

   //if (ProxDetectorS(8.0, playerid, giveplayerid))
    // {
*/

/*
forward ProxDetectorS(Float:radi, playerid, id);
public ProxDetectorS(Float:radi, playerid, targetid)
{
    if(IsPlayerConnected(playerid)&&IsPlayerConnected(targetid))
	{
		new Float:posx, Float:posy, Float:posz;
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		//radi = 2.0; //Trigger Radius
		GetPlayerPos(targetid, posx, posy, posz);
		tempposx = (oldposx -posx);
		tempposy = (oldposy -posy);
		tempposz = (oldposz -posz);
		//printf("DEBUG: X:%f Y:%f Z:%f",posx,posy,posz);
		if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
		{
			return 1;
		}
	}
	return 0;
}
*/
forward loan();
public loan()
{
for(new i=0; i<MAX_PLAYERS; i++)
{
if(PlayerInfo[i][GetAloan] ==0) return 0;
if(PlayerInfo[i][GetAloan] ==1) {
new string[256];
PlayerInfo[i][MoneyLoan] +=200;
format(string, sizeof(string),"%d :הבנק לוחץ עליך אתה חייב להחזיר כסף לבנק בסכום של",PlayerInfo[i][MoneyLoan]),SendClientMessage(i,red,string),SendClientMessage(i,red,".כדאי לך להחזיר מהר הבנק מעלה כל פעם תחוב ב200 דולר");
}
}
return 1;
}

forward UnFreezeRace();
public UnFreezeRace(){
for(new i=0; i<MAX_PLAYERS; i++)
{
if(RacePlayers < 1) {
SendClientMessage(i,red,"המירוץ בוטל סיבה: מספר שחקנים פחות מ1");
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
EndSytems= SetTimer("UnSystemRace",3000,1);
new string[256];
SendClientMessage(i,COLOR_GREEN,"!המירוץ המכוניות התחיל! בהצלחה למשתתפים");
format(string,sizeof(string),".%d :מספר המשתתפים במירוץ",RacePlayers),SendClientMessage(i,COLOR_PURPLE,string);
format(string,sizeof(string),".מנצח המירוץ יזכה ב20,000 דולר",RacePlayers),SendClientMessage(i,0xFFFF00AA,string);
TogglePlayerControllable(i,1);
RaceEnd=1;
}
return 1;
}



forward UnSystemRace();
public UnSystemRace(){

if(RaceEnd ==0) return KillTimer(EndSytems);
if(RacePlayers < 1) {
for(new i=0; i<MAX_PLAYERS; i++)
{
SendClientMessage(i,red,".המירוץ בוטל בגלל שכל הרכבים של המשתתפים התפוצצו / הם יצאו מהרכבים שלהם / חוסר משתתפים");
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
//---

forward UnFreezeDrift();
public UnFreezeDrift(){
for(new i=0; i<MAX_PLAYERS; i++)
{
if(DriftPlayer < 1) {
SendClientMessage(i,red,"המירוץ דריפטים בוטל סיבה: בגלל שמספר השחקנים קטן מ-1");
DriftEnd =0;
WinnerDrift=0;
DriftPlayer=0;
IFDriftOn=0;
YouRegister[i] =0;
TogglePlayerControllable(i,1);

if(YouRegister[i]==1){

DisablePlayerRaceCheckpoint(i);
LACY_GiveMoney(i,500);
SendClientMessage(i,red,"קיבלת פיצוי של 500 דולר בגלל ביטול הדריפט");
}
}

UnSystems = SetTimer("UnSystem",3000,1);
new string[256];

TogglePlayerControllable(i,1);
DriftEnd=1;
SendClientMessage(i,COLOR_GREEN,"!המירוץ דריפטים התחיל! בהצלחה למשתתפים");
format(string,sizeof(string),".%d :מספר המשתתפים במירוץ דריפטים",DriftPlayer),SendClientMessage(i,COLOR_PURPLE,string);
format(string,sizeof(string),".מנצח הדריפטים יזכה ב20,000 דולר",DriftPlayer),SendClientMessage(i,0xFFFF00AA,string);

}

return 1;
}
forward UnSystem();
public UnSystem(){
for(new i=0; i<MAX_PLAYERS; i++)
{
if(DriftEnd ==0) return KillTimer(UnSystems);
if(DriftPlayer == 0) {
SendClientMessage(i,red,".המירוץ בוטל בגלל שכל הרכבים של המשתתפים התפוצצו / הם יצאו מהרכבים שלהם / חוסר משתתפים");

DriftEnd =0;
WinnerDrift=0;
DriftPlayer=0;
IFDriftOn=0;
YouRegister[i] =0;
TogglePlayerControllable(i,1);
KillTimer(UnSystems);


}
}
return 1;
}
//--
stock IsVehicle(playerid)
{
new wqewqe = GetPlayerVehicleID(playerid);
wqewqe = GetVehicleModel(wqewqe);
if(wqewqe == 451)
return 1;
else
return 0;
}
//---
/*
#define MAX_PICKUPS 100

forward CreateStreamPickup(model,type,Float:x,Float:y,Float:z,range);
forward StreamPickups();
forward Pickup_AnyPlayerToPoint(Float:radi, Float:x, Float:y, Float:z);
forward DestroyStreamPickup(ID);
enum pickuPlayerInfo
{
	pickupCreated,
	pickupVisible,
	pickupID,
	pickupRange,
	Float:pickupX,
	Float:pickupY,
	Float:pickupZ,
 	pickupType,
	pickupModel
}
new Pickup[MAX_PICKUPS+1][pickuPlayerInfo];

public CreateStreamPickup(model,type,Float:x,Float:y,Float:z,range)
{
	new FoundID = 0;
	new ID;

	for ( new i = 0; FoundID <= 0 ; i++)
	{
	    if( Pickup[i][pickupCreated] == 0 )
	    {
	        if( FoundID == 0 )
	        {
	     	   ID = i;
	     	   FoundID = 1;
	        }
	    }
	    if( i > MAX_PICKUPS )
	    {
		    FoundID = 2;
		}
	}
	if( FoundID == 2 )
	{
	    
	    return -1;
	}
	Pickup[ID][pickupCreated] = 1;
	Pickup[ID][pickupVisible] = 0;
	Pickup[ID][pickupModel] = model;
	Pickup[ID][pickupType] = type;
	Pickup[ID][pickupX] = x;
	Pickup[ID][pickupY] = y;
	Pickup[ID][pickupZ] = z;
	Pickup[ID][pickupRange] = range;
	return ID;

}
public DestroyStreamPickup(ID)
{
	Pickup[ID][pickupCreated] = 0;
	DestroyPickup(Pickup[ID][pickupID]);
}
public StreamPickups()
{
	for(new i = 0; i < MAX_PICKUPS; i++)
	{
	    if( Pickup[i][pickupCreated] == 1 )
	    {
			if( Pickup_AnyPlayerToPoint(Pickup[i][pickupRange],Pickup[i][pickupX],Pickup[i][pickupY],Pickup[i][pickupZ]) )
			{
			    if( Pickup[i][pickupVisible] == 0 )
			    {
			        Pickup[i][pickupID] = CreatePickup(Pickup[i][pickupModel],Pickup[i][pickupType],Pickup[i][pickupX],Pickup[i][pickupY],Pickup[i][pickupZ]);
			        Pickup[i][pickupVisible] = 1;
				}
			}
			else
			{
			    if( Pickup[i][pickupVisible] == 1 )
			    {
			        DestroyPickup(Pickup[i][pickupID]);
					Pickup[i][pickupVisible] = 0;
			    }
			}
	    }
	}
}
public Pickup_AnyPlayerToPoint(Float:radi, Float:x, Float:y, Float:z)
{
	for ( new i = 0; i < MAX_PLAYERS; i++ )
	{
	    if(IsPlayerConnected(i))
		{
			new Float:oldposx, Float:oldposy, Float:oldposz;
			new Float:tempposx, Float:tempposy, Float:tempposz;
			GetPlayerPos(i, oldposx, oldposy, oldposz);
			tempposx = (oldposx -x);
			tempposy = (oldposy -y);
			tempposz = (oldposz -z);
			if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
			{
				return 1;
			}
		}
	}
    return 0;
}
*/
forward OnPlayerUpdate(playerid);
public OnPlayerUpdate(playerid)
{
	// Get the time of a player's last update
	gLastUpdate[playerid] = GetTickCount();
	// When you first connect you don't send much, don't kick players for this
	gState[playerid] = e_STATE_UPDATING;
	return 1;
}

public KickUpdate()
{
	// Get the last valid time
	new
		time = GetTickCount() - MAX_AFK_TIME;
	// Loop through all players
	for (new i = 0; i < MAX_PLAYERS; i++)
	{
		if (gState[i] == e_STATE_UPDATING && time >= gLastUpdate[i])
		{
		
if(Registertrs[i] ==1)
{
CPTriatlon[i]=0,DisablePlayerRaceCheckpoint(i),Registertrs[i] =0,CPTriatlon[i]=0,RunPlayers--;
SendClientMessage(i, 0xFF0000AA, ".הוצאת מהפעילות שהייתה בא אוטומאטית");
SetPlayerVirtualWorld(i,0);
SpawnPlayer(i);
SetPlayerPos(i,2057.0664,843.0209,6.7031);
SetPlayerFacingAngle(i,357.5948);

}
if(YouRegister[i] ==1){
YouRegister[i] =0,DisablePlayerRaceCheckpoint(i),DriftPlayer--;
SendClientMessage(i, 0xFF0000AA, ".הוצאת מהפעילות שהייתה בא אוטומאטית");
SetPlayerVirtualWorld(i,0);
SpawnPlayer(i);
SetPlayerPos(i,2057.0664,843.0209,6.7031);
SetPlayerFacingAngle(i,357.5948);

}
if(Youregisterrace[i] ==1) {
Youregisterrace[i] =0,RacePlayers--,DisablePlayerRaceCheckpoint(i);
SendClientMessage(i, 0xFF0000AA, ".הוצאת מהפעילות שהייתה בא אוטומאטית");
SetPlayerVirtualWorld(i,0);
SpawnPlayer(i);
SetPlayerPos(i,2057.0664,843.0209,6.7031);
SetPlayerFacingAngle(i,357.5948);

}


if(PPw[i] == 1){
ResetPlayerWeapons(i);
SendClientMessage(i,COLOR_BRIGHTRED,".עזבת את הפעילות שבא הייתה");
WarPlayersw --; InWarw[i] = 0; PPw[i] = 0;
SetPlayerVirtualWorld(i,0);
SpawnPlayer(i);
SetPlayerPos(i,2057.0664,843.0209,6.7031);
SetPlayerFacingAngle(i,357.5948);

}
if(PP[i] == 1){
ResetPlayerWeapons(i);
SendClientMessage(i,COLOR_BRIGHTRED,".עזבת את הפעילות שבא הייתה");
WarPlayers --;
InWar[i] = 0;
PP[i] = 0;
SetPlayerVirtualWorld(i,0);
SpawnPlayer(i);
SetPlayerPos(i,2057.0664,843.0209,6.7031);
SetPlayerFacingAngle(i,357.5948);

}
if(PPr[i] == 1){
 ResetPlayerWeapons(i);
SendClientMessage(i,COLOR_BRIGHTRED,".עזבת את הפעילות שבא הייתה");
WarPlayersr --; InWarr[i] = 0; PPr[i] = 0;
SetPlayerVirtualWorld(i,0);
SpawnPlayer(i);
SetPlayerPos(i,2057.0664,843.0209,6.7031);
SetPlayerFacingAngle(i,357.5948);
}


		}
	}
}

forward split(const strsrc[], strdest[][], delimiter);
public split(const strsrc[], strdest[][], delimiter)
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

//--



public AutoChangeHN()
{
	if(changehn == 1)
 	{
  		changehn = 2;
    	SendRconCommand("hostname Satla-Zone.co.il • Hard`s, DeatchMatch.");
    	SetGameModeText("DeatchMatch • World..");
     	return 1;
    }
	else if(changehn == 2)
 	{
  		changehn = 1;
    	SendRconCommand("hostname Satla-Zone.co.il • Isreal, DeatchMatch");
    	SetGameModeText("DeatchMatch • Zone.");
    	return 1;
    }

    return 1;
}
forward CafolMoneyGemel();
public CafolMoneyGemel(){

for(new i=0; i<MAX_PLAYERS; i++)
{
if(PlayerInfo[i][KopatGemel] ==0) return 0;
if(PlayerInfo[i][KopatGemel] ==1) {
new string[256];
PlayerInfo[i][GemelLogin]+=PlayerInfo[i][GemelLogin]-300;
format(string, sizeof(string),"%d הקופת גמל הכפילה לך תסכום בהשקעה ל",PlayerInfo[i][GemelLogin]),SendClientMessage(i,0xFFFF00AA,string);

}
}


return 1;
}


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
				{	Kicked[playerid] = 2; Punishplayer(playerid, "money cheat", MONEY_CHEAT_PUNISH); }

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


Punishplayer(playerid, str[], punish)
{
	if(!IsPlayerConnected(playerid))
		return true;

	new tmp[256];
	new string[256];
	GetPlayerName(playerid, playername, MAX_PLAYER_NAME);

	switch(punish)
	{

		case 2:{ // kick player
		    format(tmp, 256, "[LACY] You were cought using %s and therefore you have been kicked.", str);
			#if SHOW_KICK_REASON
			    SendClientMessage(playerid, COLOR_REASON, tmp);
			#endif
            ResetPlayerMoney(playerid);


			format(tmp, 256, "[LACY] %s was cought using %s and was kicked.", playername, str);
			SendClientMessageToAll(COLOR_KICK_MESSAGE, tmp);
			PlayerInfo[playerid][Warnings] ++;
			SendClientMessage(playerid,red,"ברגע שתגיע ל10 אזהרות תורחק מהשרת");
			format(string, sizeof(string), "%d/10 :אזהרות", PlayerInfo[playerid][Warnings]),SendClientMessage(playerid,red, string);
			Kick(playerid);

		}

	}

	SetPlayerVars(playerid);
	return true;
}

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


stock GetPlayerDistanceToPoint(playerid,Float:x,Float:y) //By Sacky
{
	new Float:x1,Float:y1,Float:z1;
	new Float:tmpdis;
	GetPlayerPos(playerid,x1,y1,z1);
	tmpdis = floatsqroot(floatpower(floatabs(floatsub(x,x1)),2)+floatpower(floatabs(floatsub(y,y1)),2));
	return floatround(tmpdis);
}

//LACY SYSTEM
forward LACY_MoneyCheat_Allow(playerid, amount1);

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

LACY_MoneyCheat_Delete(playerid)
{
	new tmpname[256];

	format(tmpname, 256, "LACY_MoneyCheat_Allow_%d", playerid);
	if(existproperty(13, "", adler32hash(tmpname)))
	{
	    deleteproperty(13, "", adler32hash(tmpname));
	}

}
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

adler32hash(buf[]) {
 new length=strlen(buf);
 new s1 = 1;
 new s2 = 0;
 new n;
 for (n=0; n<length; n++) {
  s1 = (s1 + buf[n]) % 65521;
  s2 = (s2 + s1)     % 65521;
 }
 return (s2 << 16) + s1;
}


//LACY SYSTEM
forward LACY_GiveMoney(playerid, amount);

public LACY_GiveMoney(playerid, amount)
{
	if(amount > 0)
		LACY_MoneyCheat_Allow(playerid, amount);
	GivePlayerMoney(playerid, amount);
}


stock LACY_xBan(playerid,reason[]) //By SharkyKH
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
SendClientMessage(playerid,red,string);
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
if(RunPlayers == 0) {
SendClientMessage(i,red,"הטריאטלון בוטל בגלל חוסר משתתפים");
RunSystemend =0;

RunPlayers=0;
RunSystemon=0;
if(Registertrs[i] ==1)
{
DisablePlayerRaceCheckpoint(i);
TogglePlayerControllable(i,1);
}
}
new string[256];
EndSystemTriatlon= SetTimer("EndSystemTriatlon2",3000,1);
SendClientMessage(i,COLOR_GREEN,"הטריאטלון החל בהצלחה");
format(string,sizeof(string),".%d :מספר המשתתפים במירוץ",RunPlayers),SendClientMessage(i,COLOR_PURPLE,string);
format(string,sizeof(string),".מנצח הטריאטלון יזה ב20,000 דולר",RunPlayers),SendClientMessage(i,0xFFFF00AA,string);
TogglePlayerControllable(i,1);
RaceEnd=1;
}
return 1;
}


forward EndSystemTriatlon2();
public EndSystemTriatlon2(){

if(RunSystemend ==0) return KillTimer(EndSystemTriatlon);
if(RunPlayers ==0) {
for(new i=0; i<MAX_PLAYERS; i++)
{
SendClientMessage(i,red,"..הטריאטלון בוטל סיבה: חוסר משתתפים");
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
return 1;
}


//==================================MStart======================================
forward KartStart();
public KartStart() {
new string[256];
MoneyWinnerKart =1000;
SendClientMessageToAll(COLOR_WHITE,"[___________ .Kart Mode - קארטינג מוד התחיל ___________]");
SendClientMessageToAll(COLOR_ORANGE, ".כרגע החלה ספירה של45 שניות לתחילת פעילות הקארט,מטרת הפעילות");
SendClientMessageToAll(COLOR_ORANGE, "עלות השתתפות 500 .los santos היא להישאר בגג שנמצא בעיר");
SendClientMessageToAll(COLOR_GREEN,":פקודות קארטינג");//0xFFFF00AA
SendClientMessageToAll(0xFFFF00AA, " /joinkart הצטרפות");
format(string,sizeof(string),".[$%d] :סכום זכייה התחלתי",MoneyWinnerKart);
SendClientMessageToAll(0xFFFF00AA,string);
SendClientMessageToAll(COLOR_ORANGE, "כל שחקן אשר הצטרף לפעילות יעלה את סכום הזכייה ב500");
SendClientMessageToAll(COLOR_WHITE,"[_________________________________]");

KartOn = 1; KartPlayers = 0;
Countk = 20; cuntdownk(); CountFuck = 1;
return 1; }
//==================================MCountdown==================================
forward cuntdownk();
public cuntdownk() {
new string[256];
if(Countk == 40)
{
format(string,sizeof(string),"/joinkart :בעוד כ-40 שניות תתחיל פעילות הקארט הציבורי להצטרפות",Countk),SendClientMessageToAll(RED2,string);
format(string,sizeof(string),".[%d] :מספר משתתפים ,[%d] סכום הזכייה בקארט עלה ל",MoneyWinnerKart,KartPlayers),SendClientMessageToAll(COLOR_GREEN,string);
}
else if(Countk == 20)
{
format(string,sizeof(string),"/joinkart :בעוד כ-20 שניות תתחיל פעילות הקארט הציבורי להצטרפות",Countk),SendClientMessageToAll(RED2,string);
format(string,sizeof(string),".[%d] :מספר משתתפים ,[%d] סכום הזכייה בקארט עלה ל",MoneyWinnerKart,KartPlayers),SendClientMessageToAll(COLOR_GREEN,string);
}
else if(Countk == 10)
{
format(string,sizeof(string),"/joinkart :בעוד כ-10 שניות תתחיל פעילות הקארט הציבורי להצטרפות",Countk),SendClientMessageToAll(RED2,string);
format(string,sizeof(string),".[%d] :מספר משתתפים ,[%d] סכום הזכייה בקארט עלה ל",MoneyWinnerKart,KartPlayers),SendClientMessageToAll(COLOR_GREEN,string);
}
new String[256];
format(String, 256,"~w~~>~ ~w~/JoinKart: ~r~ %d ~<~",Countk);
for(new i = 0; i < MAX_PLAYERS; i++)
PlayerPlaySound(i,1058, 0.0, 0.0, 0.0);
GameTextForAll(String,1000,6);
if(Countk > 0) {
--Countk;
SetTimer("cuntdownk", 1000, 0);
} else {
if(CountFuck == 1) {
TeleportPlayerToKart();
if(knoobk == 1) {
Countk = 3; cuntdownk(); CountFuck = 2;
} }
if(CountFuck == 2 && Countk <= 0) {
Unfreezek();
} } }


//=============================TeleportPlayerToM==============================
forward TeleportPlayerToKart();
public TeleportPlayerToKart() {
if(KartPlayers < 1) {
KartEnd(0);
return 1; }
new string[256];

SendClientMessageToAll(COLOR_WHITE,"[____Karting info - מידע על הקארט לפני ההתחלה____]");
SendClientMessageToAll(0x0F482FF,"מערכת הקארט  תתחיל בעוד מספר שניות");
format(string,sizeof(string)," %d :מס' משתתפים",KartPlayers),SendClientMessageToAll(0x0F482FF,string);
format(string,sizeof(string)," $%d :סכום זכייה שנקבע על ידי השחקנים הוא",MoneyWinnerKart),SendClientMessageToAll(0x0F482FF,string);
SendClientMessageToAll(0x0F482FF,".כל שחקן שהצטרף זה מעלה תסכום ב500 דולר זכייה");
SendClientMessageToAll(COLOR_WHITE,"[____ .בהצלחה לכל המשתתפים / משתתפות בקרב קארט____]");

ResetPlayerWeapons(KartPlayers);
KS = 1;
for(new i;i<MAX_PLAYERS;i++)
{

if(InKart[i] == 1)
{

 KK[i] = 1; knoobk = 1;
KCheckTime = SetTimer("KCheck",1000, 1);
KCheckSec = SetTimer("KCheckSecs",1000, 1);
} }
return 1; }


forward KCheck();
public KCheck() {
if(KS == 1) {
if(KartPlayers == 1) {
for(new i;i<MAX_PLAYERS;i++) {
if(InKart[i] == 1) {
KartWinner = i; KartEnd(1);
} } } } return 1; }

forward KCheckSecs(playerid);
public KCheckSecs(playerid)
{
new Float:p[3];
if(KS == 1)
{
for(new i;i<MAX_PLAYERS;i++)
{
GetPlayerPos(i,p[0],p[1],p[2]);
if(KK[i] == 1 && p[2] <  34.0)
{
KartPlayers --; InKart[i] = 0; KK[i] = 0;
//SetPlayerPos(i,-2599.8259,1096.2352,57.1251);
SendClientMessage(i,COLOR_BRIGHTRED,".Kart - .עזבת את הפעילות ");
DestroyVehicle(caridxx[i]);
SetPlayerPos(i,2057.0664,843.0209,6.7031);

}
}
}
return 1;
}


forward Unfreezek();
public Unfreezek() {
for(new i;i<MAX_PLAYERS;i++) {
if(KK[i] == 1) {
TogglePlayerControllable(i, 1);
SetCameraBehindPlayer(i);
PlayerPlaySound(i,1056, 0.0, 0.0, 0.0);
GameTextForAll("~r~Kart ~p~Start", 3000, 0);
Fuck[i] = 1;
} } }



forward KartEnd(status);
public KartEnd(status) {
if(status == 0) {
SendClientMessageToAll(COLOR_WHITE, ".הקארטינג בוטל, סיבה:חוסר משתתפים ");
KartOn = 0; KartPlayers = 0;
KillTimer(KCheckTime);
KillTimer(KCheckSec);
KartOn =0;
for(new i=0;i<MAX_PLAYERS;i++) {
if(InKart[i] == 1) {
InKart[i] = 0;  KK[i] = 0; KS = 0; knoobk = 0; Fuck[i] = 0;
DestroyVehicle(caridxx[i]);
}}
return 1;
}
else if(status == 1)
{
new string[256];
KartOn = 0;
KartPlayers = 0;
KS = 0;
LACY_GiveMoney(KartWinner, 10000);
GetPlayerName(KartWinner, playername, sizeof(playername));
format(string, sizeof(string), "~W~The Winner Is ~n~~r~%s", (KartWinner));
GameTextForAll(string, 4000, 1);
KillTimer(KCheckTime);
KillTimer(KCheckSec);
SetPlayerInterior(KartWinner, 0);
LACY_GiveMoney(KartWinner,MoneyWinnerKart);
SpawnPlayer(KartWinner);
PlayerInfo[KartWinner][Kart] ++;
GetPlayerName(KartWinner, playername, sizeof(playername));
SendClientMessageToAll(COLOR_WHITE,"[________ Karting Winner - :D ________]");
SendClientMessageToAll(0xFFFF00AA, "!מלחמת הקארט של השרת הסתיימה בהצלחה");
format(fuxm, sizeof(fuxm), ".$%d נשאר אחרון וזכה בפרס של %s",MoneyWinnerKart, GetName(KartWinner)),SendClientMessageToAll(0xFFFF00AA, fuxm);
format(fuxm, sizeof(fuxm), ".%d מספר הנצחנות שלו בקארטינג",PlayerInfo[KartWinner][Kart]),SendClientMessageToAll(0xFFFF00AA, fuxm);
format(fuxm, sizeof(fuxm), ".[%d] :המשתתפים שהשתתפו",KartPlayers),SendClientMessageToAll(0xFFFF00AA, fuxm);
SendClientMessageToAll(COLOR_WHITE,"[________ .פעילות הקארט הסתיימה , נתראה הפעילות הבאה ________]");TogglePlayerControllable(KartWinner, 1);
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
SendClientMessageToAll(COLOR_WHITE,"[______________ Mode Monster - מערכת מונסטר פעילה ______________]");
SendClientMessageToAll(COLOR_ORANGE,"LVמערכת מונסטר כעת החלה,מטרת המערכת היא להישאר על גג שנימצא ב");
SendClientMessageToAll(COLOR_ORANGE,"אחרון, מספר מקומות 10 , תשלום השתתפות 50-");
SendClientMessageToAll(COLOR_GREEN,":פקודות מונסטר");//0xFFFF00AA
SendClientMessageToAll(0xFFFF00AA,"/monster להצטרפות");
format(string,sizeof(string),".[$%d] :סכום זכייה התחלתי",MoneyWinnerMonster);
SendClientMessageToAll(0xFFFF00AA,string);
SendClientMessageToAll(COLOR_ORANGE, "כל שחקן אשר הצטרף לפעילות יעלה את סכום הזכייה ב500");
SendClientMessageToAll(COLOR_WHITE,"[_________________________________]");

MonsterOn = 1; MonsterPlayers = 0;
MonsterCount = 45; MonsterCountdown(); CountMoneterfu = 1;
return 1; }
//==================================MonsterCountdown==================================
forward MonsterCountdown();
public MonsterCountdown() {
new string[256];
if(MonsterCount == 40)
{
format(string,sizeof(string),"/monster :בעוד כ-40 שניות תתחיל פעילות המונסטר הציבורי להצטרפות",MonsterCount),SendClientMessageToAll(RED2,string);
format(string,sizeof(string),".[%d] :מספר משתתפים ,[%d] סכום הזכייה במונסטר עלה ל",MoneyWinnerMonster,MonsterPlayers),SendClientMessageToAll(COLOR_GREEN,string);
}
else if(MonsterCount == 20)
{
format(string,sizeof(string),"/monster :בעוד כ-20 שניות תתחיל פעילות המונסטר הציבורי להצטרפות",MonsterCount),SendClientMessageToAll(RED2,string);
format(string,sizeof(string),".[%d] :מספר משתתפים ,[%d] סכום הזכייה במונסטר עלה ל",MoneyWinnerMonster,MonsterPlayers),SendClientMessageToAll(COLOR_GREEN,string);
}
else if(MonsterCount == 10)
{
format(string,sizeof(string),"/monster :בעוד כ-10 שניות תתחיל פעילות המונסטר הציבורי להצטרפות",MonsterCount),SendClientMessageToAll(RED2,string);
format(string,sizeof(string),".[%d] :מספר משתתפים ,[%d] סכום הזכייה במונסטר עלה ל",MoneyWinnerMonster,MonsterPlayers),SendClientMessageToAll(COLOR_GREEN,string);
}
new String[256];
format(String, 256,"~w~~>~ ~w~/monster: ~r~ %d ~<~",MonsterCount);
for(new i = 0; i < MAX_PLAYERS; i++)
PlayerPlaySound(i,1058, 0.0, 0.0, 0.0);
GameTextForAll(String,1000,4);
if(MonsterCount > 0) {
--MonsterCount;
SetTimer("MonsterCountdown", 1000, 0);
} else {
if(CountMoneterfu == 1) {
TeleportPlayerToMONSTER();
if(MonNoob == 1) {
MonsterCount = 10; MonsterCountdown(); CountMoneterfu = 2;
} }
if(CountMoneterfu == 2 && MonsterCount <= 0) {
UnfreezeMonster();
} } }
//==================================UnfreezeMonster====================================
forward UnfreezeMonster();
public UnfreezeMonster() {
for(new i;i<MAX_PLAYERS;i++) {
if(MonsterNoTeleportion[i] == 1)
 {
TogglePlayerControllable(i, 1);
SetCameraBehindPlayer(i);
PlayerPlaySound(i,1056, 0.0, 0.0, 0.0);
GameTextForAll("~g~Monster STARTED!", 3000, 0);
MonsterFucker[i] = 1;
MCheckTimeMonster = SetTimer("MonsterCheck",1000, 1);
SetTimer("MonsterSecs",1500,1);
MonStart[i] =1;
} } }
//=============================TeleportPlayerToMONSTER==============================
forward TeleportPlayerToMONSTER();
public TeleportPlayerToMONSTER() {
if(MonsterPlayers < MiNmOnsterPlayers) {
MonsterWL(0);
return 1; }
new string[256];
SendClientMessageToAll(COLOR_WHITE,"[____Monstering info - מידע על המונסטר לפני ההתחלה____]");
SendClientMessageToAll(0x0F482FF,"מערכת המונסטר  תתחיל בעוד מספר שניות");
format(string,sizeof(string)," %d :מס' משתתפים",MonsterPlayers),SendClientMessageToAll(0x0F482FF,string);
format(string,sizeof(string)," $%d :סכום זכייה שנקבע על ידי השחקנים הוא",MoneyWinnerMonster),SendClientMessageToAll(0x0F482FF,string);
SendClientMessageToAll(0x0F482FF,".כל שחקן שהצטרף זה מעלה תסכום ב500 דולר זכייה");
SendClientMessageToAll(COLOR_WHITE,"[____ .בהצלחה לכל המשתתפים / משתתפות בקרב מונסטר____]");

for(new i = 0; i < MAX_PLAYERS; i++){
if(IsPlayerConnected(i) && iNmOnster[i]==1){
TogglePlayerControllable(i,0);
//MonsterSYSTEM[i] = CreateVehicle(444,MonsterSpawns[FMonsters][0], MonsterSpawns[FMonsters][1], MonsterSpawns[FMonsters][2],MonsterSpawns[FMonsters][3],3,3,600000);
//FMonsters --;
SetPlayerInterior(i,0);
PutPlayerInVehicle(i,MonsterSYSTEM[i],0);
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
SendClientMessageToAll(red, ".המונסטר בוטל סיבה: מספר משתתפים פחות מ-2");
SendClientMessageToAll(red, ".כל שחקן שהצטרף קיבל פיצוי בסך 500 דולר");

MonsterOn = 0; MonsterPlayers = 0;
KillTimer(MCheckTimeMonster);
KillTimer(KcheckMonster);
for(new i=0;i<MAX_PLAYERS;i++) {
if(iNmOnster[i] == 1) {
iNmOnster[i] = 0;  MonsterNoTeleportion[i] = 0; MoOn = 0; MonNoob = 0; MonsterFucker[i] = 0;
DestroyVehicle(MonsterSYSTEM[i]);
}}
return 1; }
else if(status == 1) {
MonsterOn = 0; MonsterPlayers = 0;


KillTimer(MCheckTimeMonster);
KillTimer(KcheckMonster);
SetPlayerInterior(MonsterWinner, 0);
SpawnPlayer(MonsterWinner);
LACY_GiveMoney(MonsterWinner,MoneyWinnerMonster);
PlayerInfo[MonsterWinner][Monster] ++;
GetPlayerName(MonsterWinner, playername, sizeof(playername));
SendClientMessageToAll(COLOR_WHITE,"[________ Monstering Winner - :D ________]");
SendClientMessageToAll(0xFFFF00AA, "!מלחמת המונסטר של השרת הסתיימה בהצלחה");
format(fuxm, sizeof(fuxm), ".$%d נשאר אחרון וזכה בפרס של %s",MoneyWinnerMonster, GetName(MonsterWinner)),SendClientMessageToAll(0xFFFF00AA, fuxm);
format(fuxm, sizeof(fuxm), ".%d מספר הנצחנות שלו במונסטר",PlayerInfo[MonsterWinner][Monster]),SendClientMessageToAll(0xFFFF00AA, fuxm);
format(fuxm, sizeof(fuxm), ".[%d] :המשתתפים שהשתתפו",MonsterPlayers),SendClientMessageToAll(0xFFFF00AA, fuxm);
SendClientMessageToAll(COLOR_WHITE,"[________ .פעילות המונסטר הסתיימה , נתראה הפעילות הבאה ________]");
SetPlayerPos(MonsterWinner,2144.1472,1634.6127,993.5761);
SetPlayerInterior(MonsterWinner,1);
SendClientMessage(MonsterWinner,COLOR_LIGHTBLUE,".פעילות המונסטר שיגרה אותך אוטומטית לבנק");
GameTextForPlayer(MonsterWinner,"~w~Bank",3000,5);
MoneyWinnerMonster =0;
for(new i=0;i<MAX_PLAYERS;i++) {
iNmOnster[i] = 0; MoOn = 0; MonsterNoTeleportion[i] = 0; MonNoob = 0; MonsterFucker[i] = 0;
DestroyVehicle(MonsterSYSTEM[i]);
}
return 1;
}
else if(status == 2) {
format(MonsterFux, sizeof(MonsterFux), ".ביטל את הגאטר \"%s\" האדמין ", Adminname);
SendClientMessageToAll(COLOR_LIGHTBLUEGREEN, MonsterFux);
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
for(new i;i<MAX_PLAYERS;i++) {
if(iNmOnster[i] == 1) {
MonsterWinner = i; MonsterWL(1);
} } } } return 1; }


forward MonsterSecs();
public MonsterSecs() {
new Float:p[3];
if(MonsterOn ==1)
{
for(new i;i<MAX_PLAYERS;i++) {
GetPlayerPos(i,p[0],p[1],p[2]);
if(iNmOnster[i] == 1 && p[2] <  29.0)
{
MonsterPlayers --; iNmOnster[i] = 0; MonsterNoTeleportion[i] = 0;
DestroyVehicle(MonsterSYSTEM[i]);
SpawnPlayer(i);
} } } return 1; }


forward AntiMinigun();
public AntiMinigun()
{
new weapon;
new gunammo;
for(new i = 0; i < 100; i++)
{
for (new x = 0; x < 13; x++)
{
if(PPw[i] ==1) return 0;
GetPlayerWeaponData(i, x, weapon, gunammo);
if((weapon == 38) && gunammo > 1)
{
SendClientMessage(i,red,".קיבלת קיק מהשרת סיבה: מיניגאן");
Kick(i);
break;
}
continue;
}
}
return 1;
}

forward AntiBaz();
public AntiBaz()
{
new weapon;
new gunammo;
for(new i = 0; i < 100; i++)
{
for (new x = 0; x < 13; x++)
{
if(PlayerInfo[i][bazooka] > 0 || PPr[i] == 1) return 0;
GetPlayerWeaponData(i, x, weapon, gunammo);
if((weapon == 35 || weapon == 36) && gunammo > 1)
{
SendClientMessage(i,red,".קיבלת קיק מהשרת סיבה: בזוקה");
Kick(i);
break;
}
continue;
}
}
return 1;
}

