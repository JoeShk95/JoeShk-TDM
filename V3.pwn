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
#define COLOR_LIGHTGREEN 0x24FF0AB9
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
TimeOnServer,ProfileLogged,CcMode,Supportives,
AirStrikeSaved,Float:xAirStrike,Float:yAirStrike,Float:zAirStrike,
Sawn,MicroSMG,Tec9,M4,MP5,AK47,Knife,Katana,CombatShotGun,
ShotGun,SniperRifle,CRifle,Colt
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
new playerCheckpoint[MAX_PLAYERS];
//=[Weapons]====================


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
CP_BANK,CP_PIRATE,CP_AMMU,CP_DRAGON,CP_SEXSHOP,
CP_BAR,CP_CALIGULA,CP_ZIP,CP_BINCO,
CP_TATOO,CP_BOTIQUE,CP_STRIPCLUB,CP_AIRSTRIP,
CP_EMERALD,CP_VISAGE,CP_SPREADRANCH,CP_WANGEXPORTS,CP_LC
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
//=[Values]=================================================================
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
//=[Earnings]=============================================================
new propertyEarnings[MAX_PROPERTIES] =
{
1200,8000,7500,1200, //4
2000,2200,3000,4500,
3000,4000,8000,10000,
2300,
2500,6000
};
//=[Owned]==============================================================
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
format(string, sizeof(string),".��� ������ ��� %s", playernamess);
SendClientMessage(gangMembers[gangnum][j], COLOR_ORANGE, string);
}
format(string, sizeof(string),"'%s' ��� ���� ������ (id: %d)", gangNames[gangnum], gangnum);
SendClientMessage(playerid, COLOR_ORANGE, string);
playerGang[playerid]=0;
SetPlayerColor(playerid,playerColors[playerid]);

return;
}
}
}
else
{
SendClientMessage(playerid, red, " ��� �� ���� �����");
}
}
//----Rcon Admin--- CARSYS===
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
	CarLocked,
	Buyable,
	Price,
 SetPrice
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
fnm
if(ShipWork ==1) {
PayPlayerInArea(i, 1995.5, 1518.0, 2006.0, 1569.0, 100);{
}
}
}
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

			format(string, sizeof(string), " !$%d ��� ������ ������� ��� ���� �� ", payments[i]);
			SendClientMessage(owners[i], COLOR_LIGHTGREEN, string);
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
    format(msg,255,"   %s",text);
    SendClientMessage(playerid, COLOR_LIGHTBLUE, msg);
    return 1;
}

//=[GetDP]=========================================================
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
    format(msg,255,"[Phone] %s",text);
    SendClientMessage(playerid, COLOR_LIGHTGREEN, msg);
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
	    format(msg, sizeof(msg), "...[/Answer] - .����� �����, %s :�����", callerName);
		SendClientMessage(receiverid,0x0F482FF,msg);
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
new ship;
new spamkick[MAX_PLAYERS];
new antispam[MAX_PLAYERS];
new spawnloged[MAX_PLAYERS];
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
enum e_STATE
{
e_STATE_NONE,e_STATE_CONNECTED,e_STATE_UPDATING
}
new gLastUpdate[MAX_PLAYERS],e_STATE:gState[MAX_PLAYERS] = {e_STATE_NONE, ...};
#define MAX_AFK_TIME (2000)

forward KickUpdate();
new Sagebir[MAX_PLAYERS];
//new Text:Textdraw1;
//==[ChangeHostName]=======================
//new changehn = 1;
//forward AutoChangeHN();
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
new Flayeri[MAX_PLAYERS];
new aDoing[MAX_PLAYERS];
/*
//=[AFKicker]==========================================
//new`s:
new Float:AFKPos[MAX_PLAYERS][6];
//define:
#define AFK_TIMES 					120
*/
//=[AntiFake]==========================================
new FakeKill[MAX_PLAYERS];
new Frozen[MAX_PLAYERS];
//=[Ks]================================================
new PlayerKills[MAX_PLAYERS];
new MoneyKillOnPlayer[MAX_PLAYERS];
//=[TextMovie]==========================================
//new
//Text:Box1,
//Text:Box2;
//=/NoMore/============================================
new NoMoreObject[MAX_PLAYERS];
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
//=
new file[256];
///=[NmClan]============================================

new NM2,
NM,
NM3,
NMV1,
NMV2,
NMV3,
NMV4,
NMV5,
NMV6,
NMV7,
NMV8;
//==[Sawn]
new SawnOn;
new SawnIn[MAX_PLAYERS];
new TheOpenSawn;
new TheJoinSawn;
new TheSawnStarted;
//==
new AnsTrivia1;
new MaxAns[MAX_PLAYERS];
new TriviaOn =0;
new InTheServer;

//=[Connected]==========================================
public OnPlayerConnect(playerid)
{
SetPlayerVars(playerid);
//=[ESC]================================================
gState[playerid] = e_STATE_CONNECTED;
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

new str[256];
if(!dini_Exists(GetPlayerFile(playerid)))
{
format(str, sizeof(str), "/Register [password] :����� ���� �� ������ ���� ������,!%s ���� ���" ,GetName(playerid));
SendClientMessage(playerid,COLOR_ORANGE , str);
SendClientMessage(playerid,0xF6F658FF,"* /Help [1-42] :����� ���� ���� ���/� ������");
format(str, sizeof(str), "*** %s has joined to the server." ,GetName(playerid));
SendClientMessageToAll(COLOR_GREY,str);
InTheServer ++;
}
else
{

format(str, sizeof(str), "/Login [password] :����� ���� ������ ���� ��� �����,!%s ���� ����" , GetName(playerid));
SendClientMessage(playerid,COLOR_ORANGE, str);
SendClientMessage(playerid,0xF6F658FF,"* /Help [1-42] :����� ���� ���� ���/� ������");
format(str, sizeof(str), "*** %s has joined to the server." ,GetName(playerid));
SendClientMessageToAll(COLOR_GREY,str);
InTheServer ++;
}

return 1;
}




forward Player();
forward cp(); forward unfreeze(playerid);
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
if(SawnIn[playerid] == 1 && TheJoinSawn)
{
new string[256];
format(string, sizeof(string),".���� ���� ���� ����� %s", GetName(TheJoinSawn));
SendClientMessageToAll(COLOR_LIGHTGREEN,string);
TogglePlayerControllable(TheJoinSawn,1);
TogglePlayerControllable(TheOpenSawn,1);
SawnIn[TheJoinSawn] =0;
SawnIn[TheOpenSawn] =0;
TheSawnStarted = 0;
TheJoinSawn = -1;
TheOpenSawn = -1;
return 1;
}
if(SawnIn[playerid] == 1 && TheOpenSawn)
{
new string[256];
format(string, sizeof(string),".���� ���� ���� ����� %s", GetName(TheJoinSawn));
SendClientMessageToAll(COLOR_LIGHTGREEN,string);
TogglePlayerControllable(TheJoinSawn,1);
TogglePlayerControllable(TheOpenSawn,1);
SawnIn[TheJoinSawn] =0;
SawnIn[TheOpenSawn] =0;
TheSawnStarted = 0;
TheJoinSawn = -1;
TheOpenSawn = -1;
return 1;
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
if(InBike[playerid] > 0)
{
BikePlayers --;
InBike[playerid] =0;
new vehicleidss = GetPlayerVehicleID(playerid);
SetPlayerVirtualWorld(playerid,0);
SetVehicleVirtualWorld(vehicleidss,0);
return 1;
}
//=[SavePinfo]============================================================
if(dini_Exists(GetPlayerFile(playerid)) && IsPlayerLogged(playerid))
{
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
dini_IntSet(GetPlayerFile(playerid),"SaveStrika",PlayerInfo[playerid][AirStrikeSaved]);
dini_FloatSet(GetPlayerFile(playerid),"xAir",PlayerInfo[playerid][xAirStrike]);
dini_FloatSet(GetPlayerFile(playerid),"yAir",PlayerInfo[playerid][yAirStrike]);
dini_FloatSet(GetPlayerFile(playerid),"zAir",PlayerInfo[playerid][zAirStrike]);
dini_IntSet(GetPlayerFile(playerid),"CarID",pia[playerid][CarID] );
dini_IntSet(GetPlayerFile(playerid),"OwnCar",pia[playerid][OwnCar] );
dini_IntSet(GetPlayerFile(playerid),"CarID",pia[playerid][CarID] );
dini_IntSet(GetPlayerFile(playerid),"OwnCar",pia[playerid][OwnCar] );
dini_Set(GetPlayerFile(playerid),"State","Offine");
//=[Delete]=====================================================
PlayerInfo[playerid][Warnings]=0;
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
//=[CarSystem`s]========================================================
pia[playerid][CarID] = 0;
pia[playerid][OwnCar] = 0;
//=[FL]==================================================================
PlayerInfo[playerid][FL] =0;
Frozen[playerid] =0;
NoMoreObject[playerid] =0;
Frozen[playerid] = 0;
FakeKill[playerid] = 0;
//=[ESC]==========================================================
gState[playerid] = e_STATE_NONE;
//=[UnZibori]======================================================
NoForSell[playerid] =0;
//=[SetVirtualWorldCAR]=============================================
new vehicleid = GetPlayerVehicleID(playerid);
SetPlayerVirtualWorld(playerid,0);
SetVehicleVirtualWorld(vehicleid,0);
//=[UnIgnoreDisconecet]=========================================
Ignore[playerid][playerid] =0;
//=[InLcTeleport`s]===============================================
InLcTeleport[playerid] = 0;
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
Frozen[playerid] = 0;
NoMoreObject[playerid] =0;
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
InShamal[playerid] = 0;
//=[AntiSpamre`s]==========================================
antispam[playerid] =0;
spamkick[playerid] =0;
antianti[playerid] =0;
NoChat[playerid] = 1;
//=[AntiAFK]=================================================
isafk[playerid] = 0;
//=[LC]====================================================
InLcTeleport[playerid] =0;
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
playerCheckpoint[playerid]=999;
bank[playerid]=0;
//=[CarSystem]===================================================
pia[playerid][CarID] = 0;
pia[playerid][OwnCar] = 0;
//=[Reason]==========================================================
}
//=[DiscPhone]=================================================================
OnPlayerCommandText(playerid,"/Hangup");
//=[OutSystem`s]================================================================
OutDrift(playerid);
if(Registertrs[playerid] ==1)
{
CPTriatlon[playerid]=0;
DisablePlayerRaceCheckpoint(playerid);
Registertrs[playerid] =0;
CPTriatlon[playerid]=0;
RunPlayers--;
}
//=[OutSystem`s]================================================================
if(YouRegister[playerid] ==1)
{
YouRegister[playerid] =0;
DisablePlayerRaceCheckpoint(playerid);
DriftPlayer--;
}
//=[OutSystem`s]================================================================
if(Youregisterrace[playerid] ==1)
{
Youregisterrace[playerid] =0;
RacePlayers--;
DisablePlayerRaceCheckpoint(playerid);
}
//=[OutSystem`s]================================================================
if(PPw[playerid] == 1)
{
ResetPlayerWeapons(playerid);
SendClientMessage(playerid,COLOR_BRIGHTRED,".���� �� ������� ��� �����");
ResetPlayerWeapons(playerid);
WarPlayersw --; InWarw[playerid] = 0; PPw[playerid] = 0;
}
//=[OutSystem`s]================================================================
if(PP[playerid] == 1)
{
ResetPlayerWeapons(playerid);
SendClientMessage(playerid,COLOR_BRIGHTRED,".���� �� ������� ��� �����");
WarPlayers --;
InWar[playerid] = 0;
PP[playerid] = 0;
}
if(PChain[playerid] == 1)
{
ChaPlayers --; InCha[playerid] = 0; PChain[playerid] = 0;
}
//=[OutSystem`s]================================================================
if(PPr[playerid] == 1)
{
ResetPlayerWeapons(playerid);
SendClientMessage(playerid,COLOR_BRIGHTRED,".���� �� ������� ��� �����");
WarPlayersr --; InWarr[playerid] = 0; PPr[playerid] = 0;
}
//=[OutSystem`s]================================================================

if(MonsterNoTeleportion[playerid] == 1)
{
MonsterPlayers --; iNmOnster[playerid] = 0; MonsterNoTeleportion[playerid] = 0; MonsterFucker[playerid] = 0;
DestroyVehicle(MonsterSYSTEM[playerid]);
MonStart[playerid] =0;
}
//=[OutSystem`s]================================================================
if(KK[playerid] == 1)
{
ResetPlayerWeapons(playerid);
SendClientMessage(playerid,COLOR_BRIGHTRED,".Kart .���� �� ������� ");
KartPlayers --; InKart[playerid] = 0; KK[playerid] = 0; Fuck[playerid] = 0;
DestroyVehicle(caridxx[playerid]);
}
//=[LeaveGange`s]====================================================
PlayerLeaveGang(playerid);
Core_MidoStreamDisconnect(playerid);
//=[Prop]=============================================================
for(new i = 0; i < MAX_PROPERTIES; i++)
{
if(propertyOwner[i]==playerid)
{
propertyOwner[i] = 999;
LACY_GiveMoney(playerid, propertyValues[i]);
}
}

new string[256];
switch(reason)
{
case 0: format(string, sizeof(string), "*** %s has left the server. (Crash)", GetName(playerid)),SendClientMessageToAll(COLOR_GREY, string);
}
InTheServer --;
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
//==/R/L==

if(Youregisterrace[playerid] ==1)return SendClientMessage(playerid,red,"Race ��� �� ���� ���� ������ ����� ���");
if(YouRegister[playerid] ==1) return SendClientMessage(playerid,red,"Drift ��� �� ���� ����� ������ ����� ���");
if(Registertrs[playerid] ==1) return SendClientMessage(playerid,red,"Triatlon ��� �� ���� ������ ����� �����");
//END
if(KK[playerid] == 1) return SendClientMessage(playerid,COLOR_BRIGHTRED,".��� �� ���� ����� ������ ����� ������");
if(iNmOnster[playerid] == 1) return SendClientMessage(playerid,COLOR_BRIGHTRED,".��� �� ���� ����� ������ ����� ������");

if(PPw[playerid] == 1) return      SendClientMessage(playerid,COLOR_BRIGHTRED,".��� �� ���� ����� ������ ����� ������");
if(PP[playerid] == 1)return     SendClientMessage(playerid,COLOR_BRIGHTRED,".��� �� ���� ����� ������ ����� ������");
if(PPr[playerid] == 1) return      SendClientMessage(playerid,COLOR_BRIGHTRED,".��� �� ���� ����� ������ ����� ������");
//if(OSS[playerid] == 1) return      SendClientMessage(playerid,COLOR_BRIGHTRED,".��� �� ���� ����� ������ ����� ������");
if(PP[playerid] == 1) return      SendClientMessage(playerid,COLOR_BRIGHTRED,".��� �� ���� ����� ������ ����� ������");
if(InBike[playerid] > 0) return SendClientMessage(playerid,red,".��� �� ���� ����� ������ ����� �����, ����");
new PlayerName[100];


if (strcmp(cmdtext, "/dm", true)==0)
{
if(InDM[playerid] == 1) return SendClientMessage(playerid,red,"/qdmz - ��� ���� ������ ��-�� �� ��� ���� ������ ����");
if(isafk[playerid] == 1) return SendClientMessage(playerid,red,"/UNAFK �� ��� ���� ����� ���/� .AFK Time ��� ��� ���� ");
new Randm = random(sizeof(DMPostion));
SetPlayerPos(playerid, DMPostion[Randm][0], DMPostion[Randm][1], DMPostion[Randm][2]);
InDM[playerid] = 1;
ResetPlayerWeapons(playerid);
SetPlayerVirtualWorld(playerid,2);
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
if (strcmp(cmdtext, "/qdmz", true)==0)
{
if(InDM[playerid] == 0) return SendClientMessage(playerid,red,".��� �� ���� ������ - ��-��");
InDM[playerid] = 0;
WeaponDM[playerid] = 0;
ResetPlayerWeapons(playerid);
SpawnPlayer(playerid);
SetPlayerVirtualWorld(playerid,0);
return 1;
}
if(InDM[playerid] == 1) return SendClientMessage(playerid,red,"/qdmz - ��� ���� ������ ��-�� �� ��� ���� ������ ����");
if (strcmp("/afk", cmdtext, true) == 0){
if(isafk[playerid] == 1) return SendClientMessage(playerid,red,"/UNAFK �� ��� ���� ����� ���/� .AFK Time ��� ��� ���� ");
isafk[playerid] = 1;
TogglePlayerControllable(playerid,0);
SendClientMessage(playerid, red, ".��� ��� ���� ����� �� ������� ��� ��� .AFK ����� ����");
return 1;
}

if (strcmp("/unafk", cmdtext, true) == 0){
if(isafk[playerid] == 0) return SendClientMessage(playerid,red,".AFK��� �� ���� �");
isafk[playerid] = 0;
TogglePlayerControllable(playerid,1);
SetCameraBehindPlayer(playerid);
SendClientMessage(playerid, COLOR_LIGHTGREEN, ".��� ��� ���� ����� ���� .AFK - ���� ����");
return 1; //return value
}
if(isafk[playerid] ==1) return SendClientMessage(playerid,red,"/UNAFK - .AFK �� ��� ���� ����  .AFK ��� �� ���� ���� ������ ��� ���");
//---


if(strcmp(cmd, "/kill", true) == 0)
{
aDoing[playerid] ++;
if(aDoing[playerid] > 1) return SendClientMessage(playerid,red,"��� ���� ���� ����� ������ ����� ��� ����");
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
SendClientMessage(playerid,0xF6F658FF, ".������");

return 1;
}
if(SawnIn[playerid] == 1) return SendClientMessage(playerid,red,".��� ���� ��� ����, ����� �� �� �� �����, ����");
if(mini[playerid] == 1) return SendClientMessage(playerid,WHITE, " /Kill - ���� ���� �������");

new moneysaA[MAX_PLAYERS];
///KopatGemel]
if(strcmp(cmd, "/aGemel", true) == 0)
{
if (PlayerInfo[playerid][Level] < 4) return Messagelevel (playerid, 4);

if(PlayerInfo[playerid][KopatGemel] ==1) return SendClientMessage(playerid,COLOR_WHITE,"/getgemelm ��� ����� ����� ���� ��� ��� ����� ����");
if(!CPS_IsPlayerInCheckpoint(playerid,bcp)) return SendClientMessage(playerid,COLOR_WHITE,"��� ���� ����� ����.");
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) return SendClientMessage(playerid,WHITE, "/aGemel [4000-20,000] :����� ");
moneysaA[playerid] = strval(tmp);
if(moneysaA[playerid] > 20000) return SendClientMessage(playerid, COLOR_BRIGHTRED, ".20,000 :����� �������� ������ ����� ���"),SendClientMessage(playerid,red, "/aGemel [4000-20,000] :��� ���� �� ����� ����� ��� ��� ����");
if(moneysaA[playerid] < 4000) return SendClientMessage(playerid, COLOR_BRIGHTRED, "4,000 :���� �������"),SendClientMessage(playerid,red, "/aGemel [4000-20,000] ���� ������ ���� ���� ��� ��� ���");
moneysaA[playerid] = strval(tmp);
if(GetPlayerMoney(playerid) < moneysaA[playerid]) return SendClientMessage(playerid, COLOR_BRIGHTRED, " ��� �� ����� ��� ");

LACY_GiveMoney(playerid, -moneysaA[playerid]);
PlayerInfo[playerid][GemelLogin] = moneysaA[playerid];
PlayerInfo[playerid][KopatGemel] =1;
SendClientMessage(playerid,COLOR_WHITE,".-- ���� ������� ��� --");
format(string, sizeof(string),"%d ��� ����� ����� ���� ��� �",PlayerInfo[playerid][GemelLogin]),SendClientMessage(playerid,0xF6F658FF,string);
SendClientMessage(playerid,0xF6F658FF,".�� ��� ����� ���� �-1,200 ���� ����� �������");
SendClientMessage(playerid,0xF6F658FF,"/getgemelm :������ ���� �����");

return 1;
}

if(strcmp(cmd, "/getgemelm", true) == 0)
{
if (PlayerInfo[playerid][Level] < 4)return Messagelevel (playerid, 4);

if(!CPS_IsPlayerInCheckpoint(playerid,bcp)) return SendClientMessage(playerid,COLOR_WHITE,"��� ���� ����� ����.");
if(PlayerInfo[playerid][GemelLogin] ==0) return SendClientMessage(playerid,COLOR_WHITE,"/help 37 ��� �� ��� ����� ����� ����� ������");

format(string, sizeof(string),".%d ����� ���� ����� ����� ������� ����",PlayerInfo[playerid][GemelLogin]),SendClientMessage(playerid,0xF6F658FF,string);
LACY_GiveMoney(playerid, PlayerInfo[playerid][GemelLogin]);
PlayerInfo[playerid][GemelLogin] =0;
PlayerInfo[playerid][KopatGemel] =0;

return 1;
}

//---

if(!strcmp(cmd, "/Profile", true))
{
if(PlayerInfo[playerid][ProfileLogged] ==0) return SendClientMessage(playerid,COLOR_WHITE,"/help profile ��� ���� ����� �����  ������ ����");
format(string, sizeof(string), "--- %s`s :������� ��� ---",GetName(playerid)),SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
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
if(PlayerInfo[id][ProfileLogged] ==0) return SendClientMessage(playerid,COLOR_WHITE,"����/�� �� �� �����/� �������");
if(!strlen(sid)) return SendClientMessage(playerid, COLOR_WHITE, "/pProfile [id]");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid,WHITE,".����/�� �� �����/�");
format(string, sizeof(string), "----  [%s`s] :������� ��  -----",GetName(id)),SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
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
if (PlayerInfo[playerid][Level] < 4) return Messagelevel (playerid, 4);

if(!CPS_IsPlayerInCheckpoint(playerid,bcp)) return SendClientMessage(playerid,COLOR_WHITE," ��� ���� ����� ��'� ����� �� ���� ��� ������� ������ �� ");
if(PlayerInfo[playerid][GetAloan] ==1) return format(string, sizeof(string),"%d :��� ���� ���� ���� ���� ��",PlayerInfo[playerid][MoneyLoan]),SendClientMessage(playerid,red,string),SendClientMessage(playerid,red,".��� �� ��� ������ ������ ��� ���� ���� ����� ���� �� �� �� ���� ������ ����");
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) return SendClientMessage(playerid,WHITE, "/getloan [4000-20,000] :����� ");
moneysaA[playerid] = strval(tmp);
if(moneysaA[playerid] > 20000) return SendClientMessage(playerid, COLOR_BRIGHTRED, ".20,000 :����� �������� ������ ����� ���"),SendClientMessage(playerid,red, "/getloan [4000-20,000] :��� ���� �� ����� ����� ��� ��� ����");
moneysaA[playerid] = strval(tmp);
if(moneysaA[playerid] < 4000) return SendClientMessage(playerid, COLOR_BRIGHTRED, "4,000 :���� �������"),SendClientMessage(playerid,red, "/getloan [4000-20,000] :����� ����� ��� ���� ��� ����");
LACY_GiveMoney(playerid, moneysaA[playerid]);
PlayerInfo[playerid][MoneyLoan] = moneysaA[playerid];
PlayerInfo[playerid][MoneyLoan] +=200;
PlayerInfo[playerid][GetAloan] =1;
format(string, sizeof(string),"%d :���� ������ ��� %d ��� ���� ������ ���� � ",PlayerInfo[playerid][MoneyLoan],PlayerInfo[playerid][MoneyLoan]-200);
SendClientMessage(playerid,0xF6F658FF,string);
SendClientMessage(playerid,COLOR_PURPLE, ":��� �� ����� ���� ����");
SendClientMessage(playerid,COLOR_PINK, "���� ����: �� ����� �� ��� ����� ������� �� ���� ������ ����");
SendClientMessage(playerid,COLOR_PINK, ".���� ����: �� ����� �� 54 ��' ���� ���� ���� �� 200 ����");
SendClientMessage(playerid,COLOR_LIGHTGREEN, "./backloan ������ ������");
dini_IntSet(GetPlayerFile(playerid),"MoneyLoan",PlayerInfo[playerid][MoneyLoan]);
return 1;
}

if(strcmp(cmd, "/BackLoan", true) == 0)
{
if(!CPS_IsPlayerInCheckpoint(playerid,bcp)) return SendClientMessage(playerid,COLOR_WHITE," ��� ���� ����� ��'� ����� �� ���� ��� ������� ������ �� ");
if(PlayerInfo[playerid][GetAloan] ==0) return SendClientMessage(playerid,red,".�� ���� ��� ������ ��� �� ������");
if(GetPlayerMoney(playerid) < PlayerInfo[playerid][MoneyLoan]) return format(string, sizeof(string),"%d :��� ���� ���� ���� ���� ��",PlayerInfo[playerid][MoneyLoan]),SendClientMessage(playerid,red,string),SendClientMessage(playerid,red,".��� �� ��� ������ ������ ��� ���� ���� ����� ���� �� �� �� ���� ������ ����");
LACY_GiveMoney(playerid,-PlayerInfo[playerid][MoneyLoan]);
format(string, sizeof(string),"[%d] :����� ���� ������� ���� ������",PlayerInfo[playerid][MoneyLoan]);
SendClientMessage(playerid,0xF6F658FF,string);
SendClientMessage(playerid,COLOR_PURPLE, ".���� ����: ���� �� ������ ������");
SendClientMessage(playerid,COLOR_PURPLE, "���� ����: ��� ��� ���� ������ ���� ����");
SendClientMessage(playerid,COLOR_PINK, "/help bank ����� ���� ��� �� ������");
SendClientMessage(playerid,COLOR_PINK, "/getloan .�� ���� ���� ��� ��� ������");
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
SendClientMessage(playerid, COLOR_WHITE,"/organization [function] :���� �����");
SendClientMessage(playerid, COLOR_WHITE,"/organization my [organization name] :������ ��� ������ ���");
return 1;
}

else if(strcmp(Roy_Killer111,"my",true) == 0)
{
new icqnumb[256];
CheckPlayerCMDLevel(playerid,ChangeIcq);
icqnumb = strtok(cmdtext,idx);
if(!strlen(icqnumb)) return SendClientMessage(playerid,COLOR_WHITE,"/organization [name org] :�����");

dini_Set(GetPlayerFile(playerid),"organization",icqnumb);
format(string, sizeof(string),"[%s] - .���� �� ������ ��� �",icqnumb);
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
SendClientMessage(playerid, COLOR_WHITE,"/setp [function] :���� �����");
SendClientMessage(playerid, COLOR_WHITE,"/setp open :������ ������");
SendClientMessage(playerid, COLOR_WHITE,"/setp icq [Number icq] ����� �� ����� �������");
SendClientMessage(playerid, COLOR_WHITE,"/setp msn [your msn] �����'� ���");
SendClientMessage(playerid, COLOR_WHITE,"/setp email [email] ����� �� ������� ���");
SendClientMessage(playerid, COLOR_WHITE,"/setp age :����� �� ���� ���");
SendClientMessage(playerid, COLOR_WHITE,"/setp sex [���� ����� �� ���� ��� [���/���� ");
SendClientMessage(playerid, COLOR_WHITE,"/setp m [����� English Only] ���� ���� ����� ���� ������ ����");
SendClientMessage(playerid, COLOR_WHITE,"/pProfile [id/name] ����� ������ �� ���� ��� - /Profile ����� �� ������� ���");

return 1;
}

if(strcmp(Roy_Killer111,"icq",true) == 0)
{
if(PlayerInfo[playerid][ProfileLogged] ==0) return SendClientMessage(playerid,COLOR_WHITE,"/help profile - ��� ���� ����� ���� �� ������ �����");
new icqnumb[256];
CheckPlayerCMDLevel(playerid,ChangeIcq);
icqnumb = strtok(cmdtext,idx);
if(!strlen(icqnumb)) return SendClientMessage(playerid,COLOR_WHITE,"/setp icq [number icq] :�����");


if(IsNumber(icqnumb))
{
SendClientMessage(playerid,red,".���� �������� �� ����");
return 1;
}



new File:f;
if(fexist(GetPlayerFile(playerid)))
{
f = fopen(GetPlayerFile(playerid),io_append);

dini_Set(GetPlayerFile(playerid),"ICQ",icqnumb);
format(string, sizeof(string),"[%s] - :�������� ��� ���� �",icqnumb);
SendClientMessage(playerid,0x0F482FF,string);
fclose(f);
}
}

else if(strcmp(Roy_Killer111,"open",true) == 0)
{
if(PlayerInfo[playerid][ProfileLogged] ==1) return SendClientMessage(playerid,COLOR_WHITE,"/help profile - ��� �� �� ����� ������ �����");
SendClientMessage(playerid,COLOR_WHITE,"--- .����� ������ ���� ������ ---");
SendClientMessage(playerid,0x0F482FF,"!��� ���� ����� �� ������ ���");
SendClientMessage(playerid,0x0F482FF,"/help profile - ����� ���� ��� ������");
SendClientMessage(playerid,0x0F482FF,"/profile ������ ������ ���");
SendClientMessage(playerid,0x0F482FF,"/pprofile [id] ������ ������ �� ������ ���");
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

dini_IntSet(GetPlayerFile(playerid),"ProfileLogeed",PlayerInfo[playerid][ProfileLogged]);
fclose(f);
}
}
else if(strcmp(Roy_Killer111,"sex",true) == 0)
{

if(PlayerInfo[playerid][ProfileLogged] ==0) return SendClientMessage(playerid,COLOR_WHITE,"/help profile - ��� ���� ����� ���� �� ������ �����");
new SexPlayer[256];
SexPlayer = strtok(cmdtext, idx);
if(!strlen(SexPlayer))
{
SendClientMessage(playerid, COLOR_WHITE, "/setp sex  [����/���]");

return 1;
}

if(strcmp(SexPlayer,"���",true) == 0)
{
CheckPlayerCMDLevel(playerid,ChangeIcq);
SendClientMessage(playerid, 0x0F482FF, "[���� ��� ����� �[���");
new File:f;
if(fexist(GetPlayerFile(playerid)))
{
f = fopen(GetPlayerFile(playerid),io_append);
dini_Set(GetPlayerFile(playerid), "SEX", "���");
fclose(f);
}}
else if(strcmp(SexPlayer,"����",true) == 0)
{

SendClientMessage(playerid, 0x0F482FF, "[���� - ��� ����� �[����");

new File:f;
if(fexist(GetPlayerFile(playerid)))
{
f = fopen(GetPlayerFile(playerid),io_append);
dini_Set(GetPlayerFile(playerid), "SEX", "����");
fclose(f);
}}
}
//--Email
else if(strcmp(Roy_Killer111,"email",true) == 0)
{
if(PlayerInfo[playerid][ProfileLogged] ==0) return SendClientMessage(playerid,COLOR_WHITE,"/help profile - ��� ���� ����� ���� �� ������ �����");
new Msnnumb[256];
CheckPlayerCMDLevel(playerid,ChangeIcq);
Msnnumb = strtok(cmdtext,idx);
if(!strlen(Msnnumb)) return SendClientMessage(playerid,COLOR_WHITE,"/setp email [your email] :�����");
new File:f;
if(fexist(GetPlayerFile(playerid)))
{
f = fopen(GetPlayerFile(playerid),io_append);
dini_Set(GetPlayerFile(playerid),"Email",Msnnumb);
format(string, sizeof(string),"[%s]- :������� ��� ���� �",Msnnumb);
SendClientMessage(playerid,0x0F482FF,string);
fclose(f);
}
}

//--Agg
else if(strcmp(Roy_Killer111,"age",true) == 0)
{
if(PlayerInfo[playerid][ProfileLogged] ==0) return SendClientMessage(playerid,COLOR_WHITE,"/help profile - ��� ���� ����� ���� �� ������ �����");

if(Sagebir[playerid] ==1)
{
Sagebir[playerid]=0;
SendClientMessage(playerid,WHITE,".��� ���� ���� ����� ��� ���� ������ ����� ��'�� ��������");
}
if(Sagebir[playerid] ==0){
SendClientMessage(playerid,COLOR_LIGHTRED,".--- ����� ������ ����� ������ ---");
SendClientMessage(playerid,WHITE,"(dd/mm/yyyy):��� ����� ��'�� �� ������ ���� ��� �����");
SendClientMessage(playerid,WHITE,".mm = ���� -- dd = ��� -- yyyy = ���");
SendClientMessage(playerid,WHITE,".�� ��� ����� �� ���� ����� �� �� ��'��, �� ���� ��'�� ����� ��� �� ����");
SendClientMessage(playerid,WHITE,"(dd/mm/yyyy) :����� ��'�� ��� d-- .�� ��� ���� ��'�� f6 ���");
SendClientMessage(playerid,WHITE,"/editproile age :�� ��� ���� ���� ����� ��� ����� �� ������");
Sagebir[playerid]=1;
}
}
//---
else if(strcmp(Roy_Killer111,"Msn",true) == 0)
{
if(PlayerInfo[playerid][ProfileLogged] ==0) return SendClientMessage(playerid,COLOR_WHITE,"/help profile - ��� ���� ����� ���� �� ������ �����");
new Msnnumb[256];
CheckPlayerCMDLevel(playerid,ChangeIcq);
Msnnumb = strtok(cmdtext,idx);
if(!strlen(Msnnumb)) return SendClientMessage(playerid,COLOR_WHITE,"/setp Msn [your email msn] :�����");
new File:f;
if(fexist(GetPlayerFile(playerid)))
{
f = fopen(GetPlayerFile(playerid),io_append);
dini_Set(GetPlayerFile(playerid),"Msn",Msnnumb);
format(string, sizeof(string),"[%s] - :���� ��� ���� �",Msnnumb);
SendClientMessage(playerid,0x0F482FF,string);
fclose(f);
}
}
//--
else if(strcmp(Roy_Killer111,"m",true) == 0)
{
if(PlayerInfo[playerid][ProfileLogged] ==0) return SendClientMessage(playerid,COLOR_WHITE,"/help profile - ��� ���� ����� ���� �� ������ �����");

new Msnnumb[256];
CheckPlayerCMDLevel(playerid,ChangeIcq);
Msnnumb = strtok(cmdtext,idx);
if(!strlen(Msnnumb)) return SendClientMessage(playerid,COLOR_WHITE,"/setp m [.���� ��� ������� ���� :D] :�����");
new File:f;
if(fexist(GetPlayerFile(playerid)))
{
f = fopen(GetPlayerFile(playerid),io_append);
dini_Set(GetPlayerFile(playerid),"Mispht",Msnnumb);
format(string, sizeof(string),"[%s] ����� ��� ������ ������",Msnnumb);
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
if(giveplayerid == playerid) return SendClientMessage(playerid, red, ".��� �� ���� ����� �� ����");
if(Ignore[playerid][giveplayerid] ==1) return SendClientMessage(playerid,red,"������ ����� - /unignore [id] .���� �� ��� ���� ����");
if(PlayerInfo[giveplayerid][AdminsLevel] > 2) return SendClientMessage(playerid,red,".��� ���� ����� �����? , ���� �� ��� ��� �� ����");
GetPlayerName(giveplayerid, playername, sizeof(playername));
format(string, sizeof(string), ".(ID: %d) ������ �� ����� %s ��� ���� �� �����",  giveplayerid,playername);
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
if(giveplayerid == playerid) return SendClientMessage(playerid, red, ".��� �� ���� ������ ����� �����");
if(Ignore[playerid][giveplayerid] ==0) return SendClientMessage(playerid,red,"/ignore �� ���� �� ���� �� ������");
GetPlayerName(giveplayerid, playername, sizeof(playername));
format(string, sizeof(string), ".(ID: %d) :����� %s ��� ����� ����� �", giveplayerid,playername);
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
if(helpme[playerid] ==1) return SendClientMessage(playerid,COLOR_WHITE,".���� ��� ���� , ������ ���� ��� ���� ���� �����");
SendClientMessage(playerid,COLOR_GREY,".����� ���� ������ ������� ��������");
helpme[playerid] =1;
for (new i = 0; i < MAX_PLAYERS; i++)
{

if (PlayerInfo[i][Supportives] >= 1)
{
format(string, sizeof(string), ".���� ����� ���� ��� ��� ���� ������ ����� �� ����� ����� ,%s",GetName(playerid));
SendClientMessage(i, COLOR_WHITE, string);
}
}

return 1;
}



//--CCBank
if(strcmp(cmd, "/Buycc", true) == 0)
{

if (PlayerInfo[playerid][Level] < 3) return Messagelevel (playerid, 3);
if(GetPlayerMoney(playerid) < 700000) return SendClientMessage(playerid,RED,".����� ������ ���� �700000 ���� ���� �� ����� ���");
if(PlayerInfo[playerid][CcMode] ==1) return SendClientMessage(playerid,COLOR_WHITE,"/help cc - ��� �� �� ����� ����� �����");
SendClientMessage(playerid,COLOR_PURPLE,".���� ����: ����� �� ������ �����");
SendClientMessage(playerid,0xF6F658FF,"?���: ���� ��� , ��� �� ��� ���� ����� �� ����� ������");
SendClientMessage(playerid,COLOR_PURPLE,".���� ����: �� ����� ������ ���� ����� ����� ������");
SendClientMessage(playerid,0xF6F658FF,"?���: ����");
SendClientMessage(playerid,COLOR_PURPLE,":���� ����: ��� ����");
SendClientMessage(playerid, 0xF6F658FF,"/help cc /buycc (3) /sellcc (3) /withdrawc (3) [amount]");
SendClientMessage(playerid,COLOR_PURPLE,":/help cc .���� ����: ����� �����");
SendClientMessage(playerid,0xF6F658FF,"!���: ���� ���");
PlayerInfo[playerid][CcMode]=1;
LACY_GiveMoney(playerid,-700000);
return 1;
}


if(strcmp(cmd, "/SellCc", true) == 0)
{
if(PlayerInfo[playerid][CcMode] ==0) return SendClientMessage(playerid,COLOR_WHITE,"��� �� ����� ����� ����");
SendClientMessage(playerid,COLOR_PURPLE,"���� ����: ���� �� ����� ������ ��� ������ ������ �350000 ����");
SendClientMessage(playerid,0xF6F658FF,"?���: ��� �� ��� ������ �� ��� �����");
SendClientMessage(playerid,COLOR_PURPLE,".���� ����: �� ������ ���");
SendClientMessage(playerid,0xF6F658FF,".���: �����");
SendClientMessage(playerid,COLOR_PURPLE,".���� ����: ���� ���");
SendClientMessage(playerid,COLOR_PURPLE,": D - .���� ����: �``� ����� ����");
LACY_GiveMoney(playerid,350000);
PlayerInfo[playerid][CcMode]=0;
return 1;
}

new moneysa[MAX_PLAYERS];
if(!strcmp(cmd, "/withdrawc", true))
{
if(PlayerInfo[playerid][CcMode] ==0) return SendClientMessage(playerid,COLOR_WHITE,"/help cc ��� �� ����� ����� ����");
if(GetPlayerMoney(playerid) < 1000) return SendClientMessage(playerid,RED,"�� ����� ���� �1000 ���� ��� �� ���� ��� �� ���� �����");
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) return SendClientMessage(playerid, 0x0C4E0FF, " /withdrawc [amount] :����� ");
moneysa[playerid] = strval(tmp);
if(moneysa[playerid] < 1099) return SendClientMessage(playerid, COLOR_BRIGHTRED, "! �� ���� ������ ���� ��� 1099");
if(moneysa[playerid] > PlayerInfo[playerid][Bank]) return SendClientMessage(playerid, COLOR_BRIGHTRED, ".���� ����� ���� ");
LACY_GiveMoney(playerid, moneysa[playerid]);
LACY_GiveMoney(playerid, -1000);
PlayerInfo[playerid][Bank] = PlayerInfo[playerid][Bank]-moneysa[playerid];
dini_IntSet(GetPlayerFile(playerid),"Bank",PlayerInfo[playerid][Bank]);
format(string, sizeof(string), "[$%d] ���� �� ���� � ,[$%d] ���� ������ ����� ��� �",  moneysa[playerid],PlayerInfo[playerid][Bank]);
SendClientMessage(playerid, COLOR_WHITE, string);
return 1;
}
if(!strcmp(cmd, "/balancec", true)) {
format(string, sizeof(string), "[$%d] :���� ������ ����� ��� ���", PlayerInfo[playerid][Bank]);
SendClientMessage(playerid, COLOR_WHITE, string);
return 1;
}



//==============================================================================
	        if(strcmp("/car",cmdtext,true) == 0)
	        {
	         if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,RED,"! ��� ���� ����� ������� ���� ���� ������ ");
         new car = GetPlayerVehicleID(playerid);
             if(NoForSell[playerid] == 1)
						   {

              format(vehname,999,".-- .���: ��� ������ �� ����� ������ [%s] :���� ���� --",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,COLOR_WHITE,vehname);
             format(vehname,999,".%s :��� �� ����",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,COLOR_GREY,vehname);
			 format(vehname,999,".%d :������ �� ����",GetVehicleModel(GetPlayerVehicleID(playerid))),SendClientMessage(playerid,COLOR_GREY,vehname);
	         format(vehname,999,".%d :������ �� ���� ����",GetPlayerVehicleID(playerid)),SendClientMessage(playerid,COLOR_GREY,vehname);

             new Float:healthss;
			 new vehicleid = GetPlayerVehicleID(playerid);
			 GetVehicleHealth(vehicleid, healthss);

			 format(string, sizeof(string), "%.1f  :����� �� ����", healthss),SendClientMessage(playerid, COLOR_GREY, string);
return 1;
}
             if(VehicleInfo[car][CarOwned] == 1) {
             new Float:healths;
			 new vehicleid = GetPlayerVehicleID(playerid);
			 GetVehicleHealth(vehicleid, healths);
             format(vehname,999,".-- .���: ���� �� ��� ���� [%s] ���� ���� --",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
	         SendClientMessage(playerid,COLOR_WHITE,vehname);
	         format(vehname,999,".����� ���� ������ %s ��� �� ���� �",VehicleInfo[car][CarOwner]),SendClientMessage(playerid,COLOR_GREY,vehname);
             format(vehname,999,".%s :��� �� ����",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,COLOR_GREY,vehname);
			 format(vehname,999,".%d :������ �� ����",GetVehicleModel(GetPlayerVehicleID(playerid))),SendClientMessage(playerid,COLOR_GREY,vehname);
	         format(vehname,999,".%d :������ �� ���� ����",GetPlayerVehicleID(playerid)),SendClientMessage(playerid,COLOR_GREY,vehname);
             format(string, sizeof(string), "%.1f  :����� �� ����", healths),SendClientMessage(playerid, COLOR_GREY, string);

			 return 1;
             }

			  if(VehicleInfo[car][CarOwned] == 0){

              format(vehname,999,".-- /buycar :���: ���� ������ [%s] :���� ���� --",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,COLOR_WHITE,vehname);
             format(vehname,999,".%s :��� �� ����",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,COLOR_GREY,vehname);
			 format(vehname,999,".%d :������ �� ����",GetVehicleModel(GetPlayerVehicleID(playerid))),SendClientMessage(playerid,COLOR_GREY,vehname);
	         format(vehname,999,".%d :������ �� ���� ����",GetPlayerVehicleID(playerid)),SendClientMessage(playerid,COLOR_GREY,vehname);
      
             new Float:healthss;
			 new vehicleid = GetPlayerVehicleID(playerid);
			 GetVehicleHealth(vehicleid, healthss);

			 format(string, sizeof(string), "%.1f  :����� �� ����", healthss),SendClientMessage(playerid, COLOR_GREY, string);
 
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
    		SendClientMessage(playerid, LIGHTGREEN,".�� �������� ����� ������");
    		
    	}
		else
		{
			SendClientMessage(playerid, RED, "!������ ��� ��� �������� ���� ");
		}
		return 1;
	}


//==============================================================================
	if(strcmp(cmd, "/lock", true) == 0)
	{
		new vehicleid = GetPlayerVehicleID(playerid);

		GetPlayerName(playerid,PlayerName,30);

        if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,RED," ��� ���� ����� ���� ��� ������ ����");
   		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return
    	SendClientMessage(playerid,0xF6F658FF," �� ��� ���� ���� ����� �� ������.");
   	   	if(GetPlayerVehicleID(playerid) >= VCount) return SendClientMessage(playerid,RED," ������� ���� ����� ������");
		if(strcmp(PlayerName,VehicleInfo[vehicleid][CarOwner],true) != 0)return SendClientMessage(playerid,RED," �� �� ������� ���, ���� ���� ������ ����");
        if(VehicleInfo[vehicleid][CarOwned] == 0 ) return SendClientMessage(playerid,RED,"������ ����� �����");
		if(pia[playerid][CarID] == 0) return SendClientMessage(playerid,RED, "��� �� ������");

	    for (new i=0;i<MAX_PLAYERS;i++) if(i != playerid) SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 1);
		VehicleInfo[vehicleid][CarLocked] = 1;
	    SendClientMessage(playerid, 0xF6F658FF, "! ������� ��� ����� ");

		return 1;
    }
//==============================================================================
	if(strcmp(cmd, "/Calock", true) == 0)
	{
		new vehicleid = GetPlayerVehicleID(playerid);

		GetPlayerName(playerid,PlayerName,30);

        if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,RED," ��� ���� ����� ������� ��� ������ ����");
   		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return
    	SendClientMessage(playerid,0xF6F658FF," �� ��� ���� ���� ����� �� ������.");
   	   	if(GetPlayerVehicleID(playerid) >= VCount) return SendClientMessage(playerid,RED,"������� �� ���� ����� ������");
		if(strcmp(PlayerName,VehicleInfo[vehicleid][CarOwner],true) != 0)
   		return SendClientMessage(playerid,RED," �� �� ������� ���, ���� ���� ������ ����");
        if(VehicleInfo[vehicleid][CarOwned] == 0 ) return SendClientMessage(playerid,RED,"This car isnt owned therefore cannot be unlocked");
		if(pia[playerid][CarID] == 0) return SendClientMessage(playerid,RED," ��� �� ������");

	    for (new i=0;i<MAX_PLAYERS;i++) if(i != playerid) SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 0);
		VehicleInfo[vehicleid][CarLocked] = 0;
	    SendClientMessage(playerid, 0xF6F658FF, " ����� ������ �� ����� ������� ");

		return 1;
    }


	if(strcmp(cmd, "/buyable", true) == 0)
	{
    	if(IsPlayerAdmin(playerid))
    	{
			new carid;		GetPlayerName(playerid,PlayerName,30);
			tmp = strtok(cmdtext,idx);

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
    	if(IsPlayerAdmin(playerid))
    	{
			new carid;		GetPlayerName(playerid,PlayerName,30);
			tmp = strtok(cmdtext,idx);

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

				    return 1;
				}
			}
			else
			{
	   		carid = strval(tmp);
			if(carid >= VCount) return SendClientMessage(playerid,red,"This car cannot be buyable");
			tmp = strtok(cmdtext, idx);

			VehicleInfo[carid][Buyable] = 0;

			}
		}
		else
		{
		//	SendClientMessage(playerid, red, "This command is for admins only");
		}
		return 1;
	}
//==============================================================================*/
if(strcmp(cmd, "/Buycar", true) == 0)
{
if(PlayerInfo[playerid][Level] < 2) return Messagelevel (playerid, 2);
new vehicleid = GetPlayerVehicleID(playerid);
if(NoForSell[playerid]==1) return SendClientMessage(playerid,red,".��� �� ���� ��� ������ ��� ���� ������");
if(GetPlayerMoney(playerid) < VehicleInfo[vehicleid][Price]) return SendClientMessage(playerid,RED,".��� �� ����� ��� ����� ������ �� ������� ����� ");
if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,RED,"! ��� ���� ����� ������� ���� ���� ������ ");
if(GetPlayerVehicleID(playerid) >= VCount) return SendClientMessage(playerid,RED,"! ��� ��� ������, ���� ���� ����� ");
if(VehicleInfo[vehicleid][CarOwned] == 1 ) return SendClientMessage(playerid,RED,".������� ����� ����� ������ ��� ");
if(pia[playerid][CarID] == 1) return SendClientMessage(playerid,RED,"! �� �� ��� ������ ");
format(file,sizeof(file),"CarSys/car%d.txt", GetPlayerVehicleID(playerid) );

GetPlayerName(playerid, PlayerName, sizeof(PlayerName));

if(!dini_Exists(file))
{
format(string,sizeof(string),"[ID %d] .������� ����� �� ����� ������ ", vehicleid );
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
pia[playerid][CarID] = GetPlayerVehicleID(playerid);
pia[playerid][OwnCar] = 1;
dini_IntSet(GetPlayerFile(playerid),"CarID",pia[playerid][CarID]);
dini_IntSet(GetPlayerFile(playerid),"OwnCar",1);
format(string,sizeof(string),"/carhelp :������� ���� ���/� ,[%s] - ������, ���� ��� ���  ",VehNames[GetVehicleModel(vehicleid)-400] );
SendClientMessage(playerid,MyColor,string);

new File:f;

if(fexist(GetPlayerFile(playerid)))

{
dini_Set(GetPlayerFile(playerid),"Car",VehNames[GetVehicleModel(vehicleid)-400]);
f = fopen(GetPlayerFile(playerid),io_append);
fclose(f);
}
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
return SendClientMessage(playerid,RED,".���� �� ������� ���! ��� ���� ����� ������� ��� ���� ������ ���� ");
if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,RED,".��� ���� ����� ���� ������� ��� ���� ����� ���� ");
if(pia[playerid][CarID] == 0) return SendClientMessage(playerid,RED,"! �� ��� ���� �����? ��� �� ������ ");
if(VehicleInfo[vehicleid][CarOwned] != 1) return SendClientMessage(playerid,RED,".������� �� ��� ����� ���� �� ���� ����� ����");

if(!dini_Exists(file))
{
format(string,sizeof(string),"ID [ %d ] - ������ �� ���� ����� ������", vehicleid );
SendClientMessage(playerid,RED,string);
}
else
{
for	(new i=0;i<MAX_PLAYERS;i++) SetVehicleParamsForPlayer(vehicleid,i, 0, 0);
dini_IntSet(file,"CarOwned",0);
dini_Set(file,"CarOwner","���");
dini_IntSet(file,"CarLocked",0);
dini_IntSet(file,"Buyable",1);
VehicleInfo[vehicleid][CarOwned] = 0;
strmid(VehicleInfo[vehicleid][CarOwner], dini_Get(file,"CarOwner"), 0, strlen(dini_Get(file,"CarOwner")), 255);
VehicleInfo[vehicleid][Buyable] = 1;
VehicleInfo[vehicleid][CarLocked] = 0;
pia[playerid][CarID] = 0;
pia[playerid][OwnCar] = 0;
format(file,sizeof(file),"CarSys/Users/%s.txt",PlayerName);
dini_IntSet(GetPlayerFile(playerid),"CarID",0);
dini_IntSet(GetPlayerFile(playerid),"OwnCar",0);
SendClientMessage(playerid,LIGHTGREEN," ���� �� �������, ����� ��� ����� ������ �� ����");
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
if(IsPlayerInAnyVehicle(playerid) ) return SendClientMessage(playerid,RED,".��� ���� ���, ��� ���� �� ���� ��� ��� ����� ����");
if(GetPlayerInterior(playerid) == 1 || GetPlayerInterior(playerid) == 6 || GetPlayerInterior(playerid) == 10) return SendClientMessage(playerid,0xFF0000AA,".��� �� ���� ����� ���� ���� ���� ���� �������");
GetPlayerName(playerid,PlayerName,30);
new car = pia[playerid][CarID];
if(VehicleInfo[car][CarOwned] == 1 && pia[playerid][OwnCar] == 1)
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
format(string,sizeof(string),".���� �� ���� ���, ����� ����� ,%s",PlayerName);
SendClientMessage(i,WHITE,string);
}
SetTimerEx("TeleCar",4000,0,"i",playerid);
SendClientMessage(playerid,LIGHTGREEN,"! �� ���� �� ����- /repair  ! ����� �� ���� ���");
}
}
else
{
SendClientMessage(playerid,RED,"! ��� �� ������ ");
}
return 1;
}
//=======================
    
	if(strcmp(cmd, "/repair", true) == 0)
	{

		new vehicleid = GetPlayerVehicleID(playerid);
   		GetPlayerName(playerid,PlayerName,30);

    	if(! (IsPlayerInAnyVehicle(playerid)) ) return SendClientMessage(playerid,RED,".��� ���� ����� ���� ���� ��� ������� ������ ��������");
		if(strcmp(PlayerName,VehicleInfo[vehicleid][CarOwner],true) != 0)return SendClientMessage(playerid,RED,"! �� �� ������� ��� �� ���� ���� ���� ����");
		if(pia[playerid][CarID] == 0) return SendClientMessage(playerid,RED," ��� �� ������");

		if(GetPlayerMoney(playerid) < 1000)
		{
			SendClientMessage(playerid,RED,".��� �� ����� ��� ��� ������ ������ ��������");
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
		    SendClientMessage(playerid,LIGHTGREEN,".���� �������� ������ ��������, ������� ����� ����� ��� 5 �����");
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

		if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,RED,".��� �� ���� ���");
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid,RED,".������ �� ������ ������� ������ ��");

		if(strcmp(PlayerName,VehicleInfo[vehicleid][CarOwner],true) != 0)
   		return SendClientMessage(playerid,RED,".�� �� ������� ���, ���� ���� ������ ���� ������");

		if(!strlen(tmp)) return SendClientMessage(playerid,RED,"USAGE: /Eject [playerid]");

		pid = strval(tmp);
		if(!IsPlayerConnected(pid)) return SendClientMessage(playerid,RED," ����� ���� �����");
		if(!IsPlayerInVehicle(pid,GetPlayerVehicleID(playerid)) ) return
			SendClientMessage(playerid,RED,"! ���� �� ���� ���� ���");

		RemovePlayerFromVehicle(pid);
		GameTextForPlayer(pid,"~W~You Have ~R~Ejected",3000,5);
	    
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
	    if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid,COLOR_BRIGHTRED,"��� �� ����� ");
	    if(!strlen(pass)) return SendClientMessage(playerid,COLOR_WHITE,"/SetPass [Password] :�����");
        if(Config[MaxPasswordLength] < strlen(pass) || strlen(pass) < Config[MinPasswordLength]) {
		format(string,sizeof(string)," %d-%d ���� ������ ���� ����� ���",Config[MaxPasswordLength], Config[MinPasswordLength]);
		SendClientMessage(playerid,COLOR_BRIGHTRED,string);
	    return 1; }


new File:f;
if(fexist(GetPlayerFile(playerid)))
{
f = fopen(GetPlayerFile(playerid),io_append);
dini_Set(GetPlayerFile(playerid),"Password",pass);
format(string, sizeof(string), ".%s :������ ��� ����� ������, ����� ", pass);
SendClientMessage(playerid, COLOR_YELLOW, string);
fclose(f);
}

       return 1; }

//if(!strcmp(cmd,"/SetNick",true) || !strcmp(cmd,"/changenick",true)) return SendClientMessage(playerid,COLOR_WHITE,"!�����");

if(!strcmp(cmd, "/changenick", true))
{
CheckPlayerCMDLevel(playerid,changenick);
new newnick[256];
newnick = strtok(cmdtext, idx);if(!strlen(newnick)) return SendClientMessage(playerid,0xF6F658FF,"/Changenick [NewNick] :�����");
if(16 < strlen(newnick) || strlen(newnick) < 3) return SendClientMessage(playerid, 0xF6F658FF, ".���� ������ ���� ����� �3-16 ����");
new CheackNick[256];
format(CheackNick,sizeof(CheackNick),"RLSB/Users/%s.ini",newnick);
if(dini_Exists(CheackNick))
{

format(string, sizeof(string), ".�� ��� ���� ���� ����� %s ��� ",newnick);
SendClientMessage(playerid, COLOR_BRIGHTRED, string);


return 1;
}
new savepass[256];
new sicq[256],smsn[256],smispht[256],ssex[256],semail[256];
savepass = dini_Get(GetPlayerFile(playerid),"Password");
sicq =  dini_Get(GetPlayerFile(playerid),"ICQ");
smsn =  dini_Get(GetPlayerFile(playerid),"Msn");
smispht =  dini_Get(GetPlayerFile(playerid),"Mispht");
ssex =  dini_Get(GetPlayerFile(playerid),"SEX");
semail =  dini_Get(GetPlayerFile(playerid),"Email");

new vehicleid = GetPlayerVehicleID(playerid);
if(pia[playerid][CarID] != 0)
{
GetPlayerName(playerid,PlayerName,30);
if(strcmp(PlayerName,VehicleInfo[vehicleid][CarOwner],true) != 0 && ! (IsPlayerInAnyVehicle(playerid)) )  return SendClientMessage(playerid,RED,"/callcar - .����/�� �����, ��� ���/� ����� �� ��� ����� ���");
}

dini_Remove(GetPlayerFile(playerid));
format(CheackNick,sizeof(CheackNick),"RLSB/Users/%s.ini",newnick);
dini_Create(CheackNick);
new File:f, date[3], time[3];
if(fexist(CheackNick))
{
f = fopen(CheackNick,io_append);
format(CheackNick,sizeof(CheackNick),"// %s's :����� ����� \r\n",newnick); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"aKillsnl=%d\r\n",PlayerInfo[playerid][aKillsnl]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"aLevelnl=%d\r\n",PlayerInfo[playerid][aLevelnl]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Organization=%s\r\n","None"); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Clan=%s\r\n","None"); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Password=%s\r\n",savepass); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"GemelLogin=%d\r\n",PlayerInfo[playerid][GemelLogin]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"KopatGemel=%d\r\n",PlayerInfo[playerid][KopatGemel]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"AggInfo=%d\r\n",PlayerInfo[playerid][AggInfo]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Level=%d\r\n",PlayerInfo[playerid][Level]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"Tag=%s\r\n","���� �����"); fwrite(f,CheackNick);
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
format(CheackNick,sizeof(CheackNick),"CarID=%d\r\n",pia[playerid][CarID]); fwrite(f,CheackNick);
format(CheackNick,sizeof(CheackNick),"OwnCar=%d\r\n",pia[playerid][OwnCar]); fwrite(f,CheackNick);
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
fclose(f);
}
PlayerInfo[playerid][Logged] = 0;
PlayerInfo[playerid][Logged] = 0;
format(string, sizeof(string), ".--- %s������ ��� ����� ������ � ---",newnick);
SendClientMessage(playerid, COLOR_WHITE, string);
format(string, sizeof(string), "%s :�����",newnick);
SendClientMessage(playerid, COLOR_PINK, string);
format(string, sizeof(string), "%s :�����",savepass);
SendClientMessage(playerid, COLOR_PINK, string);
PlayerInfo[playerid][Logged] = 0;
if(pia[playerid][CarID] != 0)
{
new files[256];
format(files,sizeof(files),"Cars/car%d.txt", pia[playerid][CarID]);
dini_Set(files,"CarOwner",newnick);
VehicleInfo[vehicleid][CarOwned] = 1;
strmid(VehicleInfo[vehicleid][CarOwner], newnick, 0, strlen(newnick), 255);
VehicleInfo[vehicleid][Buyable] = 0;
VehicleInfo[vehicleid][CarLocked] = 0;
SaveFiles();
PlayerInfo[playerid][Logged] = 0;
PlayerInfo[playerid][FL] = 0;
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


if(!strcmp(cmd,"/register",true) || !strcmp(cmd,"/r",true))
{
new pass[256];


CheckPlayerCMDLevel(playerid,register);
if(Frozen[playerid] == 1) return SendClientMessage(playerid,COLOR_WHITE,".����/�� �����, ��� ������ ����� �� ���� ����� ���� ������ ������� �����");
if(IsPlayerLogged(playerid)) return SendClientMessage(playerid,COLOR_BRIGHTRED,"��� ��� ����");
pass = strtok(cmdtext,idx);
if(!strlen(pass)) return SendClientMessage(playerid,COLOR_WHITE,"/Register [password] ���� ����� ����� �����");
if(Config[MaxPasswordLength] < strlen(pass) || strlen(pass) < Config[MinPasswordLength]) {
format(string,sizeof(string)," %d-%d ���� ������ ���� ����� ���",Config[MaxPasswordLength], Config[MinPasswordLength]);
SendClientMessage(playerid,COLOR_BRIGHTRED,string);
return 1;
}
if(dini_Exists(GetPlayerFile(playerid)))
{
format(string, sizeof(string), "/Login [password] :���� �� ����� ����, �������� %s :�� ������/�", GetName(playerid));
SendClientMessage(playerid, WHITE, string);
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
dini_IntSet(GetPlayerFile(playerid),"CarID",0);
dini_IntSet(GetPlayerFile(playerid),"OwnCar",0);
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
dini_IntSet(GetPlayerFile(playerid),"TimeOnServer",1);
dini_IntSet(GetPlayerFile(playerid),"Karts",0);
dini_IntSet(GetPlayerFile(playerid),"MonsterWin",0);
dini_IntSet(GetPlayerFile(playerid),"RPGWIN",0);
dini_IntSet(GetPlayerFile(playerid),"MiniWin",0);
dini_IntSet(GetPlayerFile(playerid),"mlg",0);

dini_Create(GetPlayerFile(playerid));
//new icqnumbers[9];
RegisterPlayer(playerid,pass);
format(string, sizeof(string), ".����/� ���� %s ", GetName(playerid));
SendClientMessageToAll(0x0F482FF, string);
format(string, sizeof(string),".--- !����� ���� ������ ---",GetName(playerid));
SendClientMessage(playerid,WHITE,string);
format(string, sizeof(string),"%s :�� �����",GetName(playerid));
SendClientMessage(playerid,0x0F6A0FF,string);
format(string, sizeof(string),"%s :�����",pass);
SendClientMessage(playerid,0x0F6A0FF,string);
SendClientMessage(playerid, COLOR_WHITE,".��� ���� ������� ���� �� �����, ��� ����� ������ ����");
Frozen[playerid] = 1;
dini_IntSet(GetPlayerFile(playerid),"Kills",0);
dini_IntSet(GetPlayerFile(playerid),"Deaths",0);
dini_IntSet(GetPlayerFile(playerid),"Bank",0);
PlayerInfo[playerid][Logged] = 1;
Frozen[playerid] = 0;
NoChat[playerid] = 0;
PlayerInfo[playerid][Level] = 0;
PlayerInfo[playerid][Kills] = 0;
PlayerInfo[playerid][Deaths] = 0;
NoChat[playerid] = 1;
PlayerInfo[playerid][Logged] = 0;
return 1;
}

if(!strcmp(cmd,"/login",true) || !strcmp(cmd,"/www",true)) {
new pass2[256];
CheckPlayerCMDLevel(playerid,login);
if(IsPlayerLogged(playerid)) return SendClientMessage(playerid, COLOR_BRIGHTRED, ".��� ��� �����");
pass2 = strtok(cmdtext,idx);
if(!strlen(pass2)) return SendClientMessage(playerid,COLOR_WHITE,"USAGE: /Login [password]");
if(Config[MaxPasswordLength] < strlen(pass2) || strlen(pass2) < Config[MinPasswordLength])
{
format(string,sizeof(string)," %d-%d ���� ������ ���� ����� ���",Config[MaxPasswordLength], Config[MinPasswordLength]);
SendClientMessage(playerid,COLOR_BRIGHTRED,string);
return 1;
}
if(!dini_Exists(GetPlayerFile(playerid)))
{
format(string, sizeof(string), "/Register <> [Password] :���� �� ������ ,%s ", GetName(playerid));
SendClientMessage(playerid, COLOR_WHITE, string);
return 1;
}
if(!strcmp(pass2,dini_Get(GetPlayerFile(playerid),"Password"),true))
{

if(dini_Exists(GetPlayerFile(playerid)))
PlayerInfo[playerid][TimeOnServer] +=1;
NoChat[playerid] =0;
SendClientMessage(playerid,0x0F482FF, "!��/� �����/� ��� ������");
//TextDrawHideForPlayer(playerid, Box1);
//TextDrawHideForPlayer(playerid, Box2);
//TextDrawShowForPlayer(playerid,Textdraw1);
Frozen[playerid] = 0;
LoginPlayer(playerid);
}
else
{
Flayeri[playerid] --;
PlayerInfo[playerid][FL]++;
format(string,sizeof(string),".%d :������ �����, ���� ������� ����",Flayeri[playerid]);
SendClientMessage(playerid,red,string);

if(PlayerInfo[playerid][FL] >= 4)
{
format(string,sizeof(string),"*** %s has been kicked (4/4 ������� �����)",GetName(playerid));
SendClientMessageToAll(red,string);
Kick(playerid);
}
}
return 1;
}
if(Frozen[playerid] == 1) return SendClientMessage(playerid,WHITE,".��� ����, ��� ���� ���� ������");
if(NoChat[playerid] ==1) return SendClientMessage(playerid,red,".��� ���� ����� ���� ������ �� ��� ����� ������ ����");
if(!strcmp(cmd, "/pstats", true))
{
new sid[256], id;
sid = strtok(cmdtext,idx);

id = ReturnID(sid);
if(!IsPlayerConnected(id)) return SendClientMessage(playerid,red,".����� ����� ����� ����");
format(string, sizeof(string), ".-- [%s`s] :������ �� --",GetName(id)),SendClientMessage(playerid, COLOR_WHITE, string);
format(string, sizeof(string), "* - .%d ���",PlayerInfo[id][Level]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "* - .%d ������",PlayerInfo[id][Kills]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "* - .%d :������ ���� ���� �� �����",PlayerInfo[id][aKillsnl]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "* - .%d :��� ����",PlayerInfo[id][aLevelnl]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "* - .%d ��� ����",PlayerInfo[id][Bank]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "* - .%d :��� ���� ����",PlayerInfo[id][VIPS]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "* - Victory Complete: %d, Karting: %d, Monster: %d, Minigun: %d ,Tiger: %d ,Rpg (Bazooka): %d",PlayerInfo[id][Wars],PlayerInfo[id][Kart],PlayerInfo[id][Monster],PlayerInfo[id][MINIGUN],PlayerInfo[id][Mlg],PlayerInfo[id][RPGS]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "/pprofile %d /pdetails %d :����� ������� ,%s ���� ���� �� �����",id,id,GetName(id));
SendClientMessage(playerid, COLOR_GREY, string);

return 1;
}


if(!strcmp(cmd, "/stats", true))
{
format(string, sizeof(string), ".-- [%s`s] :������ ��� --",GetName(playerid)),SendClientMessage(playerid, COLOR_WHITE, string);
format(string, sizeof(string), "* - .%d ���",PlayerInfo[playerid][Level]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "* - .%d ������",PlayerInfo[playerid][Kills]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "* - .%d :������ ������ �� ����� ���� ����",PlayerInfo[playerid][aKillsnl]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "* - .%d :��� ����",PlayerInfo[playerid][aLevelnl]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "* - .%d ��� ����",PlayerInfo[playerid][Bank]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "* - .%d :��� ���� ����",PlayerInfo[playerid][VIPS]),SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "* - Victory Complete: Wars: %d, Karting: %d, Monster: %d, Minigun: %d ,Tiger: %d ,Rpg (Bazooka): %d",PlayerInfo[playerid][Wars],PlayerInfo[playerid][Kart],PlayerInfo[playerid][Monster],PlayerInfo[playerid][MINIGUN],PlayerInfo[playerid][Mlg],PlayerInfo[playerid][RPGS]);
SendClientMessage(playerid, COLOR_GREY, string);
format(string, sizeof(string), "/details /profile :����� ��� ����",PlayerInfo[playerid][Wars],PlayerInfo[playerid][Kart],PlayerInfo[playerid][Monster],PlayerInfo[playerid][MINIGUN],PlayerInfo[playerid][Mlg],PlayerInfo[playerid][RPGS]);
SendClientMessage(playerid, COLOR_GREY, string);

return 1;
}

if(!strcmp(cmd, "/Details", true))
{
new Float:health,Float:armour;
GetPlayerHealth(playerid,health),GetPlayerArmour(playerid,armour);
format(string, sizeof(string), ".-- [%s`s] ���� ����� --",GetName(playerid)),SendClientMessage(playerid, COLOR_WHITE, string);
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
if(!IsPlayerConnected(id)) return SendClientMessage(playerid,WHITE,".����/�� �� �����/�");

new Float:health;
new Float:armour;
GetPlayerHealth(id,health);

GetPlayerArmour(id,armour);

format(string, sizeof(string), ".-- [%s`s] ���� ����� --",GetName(id)),SendClientMessage(playerid, COLOR_WHITE, string);
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
SendClientMessage(playerid,COLOR_WHITE,".--- ���� �������� ������ ---");
SendClientMessage(playerid,COLOR_GREY,"/StartWar - ���� ����� - /StartKart - ���� �����");
SendClientMessage(playerid,COLOR_GREY,"/sMlgzohot - ������ ����� - /StartMonster - ������ �����");
SendClientMessage(playerid,COLOR_GREY,"/sRpg ����� ����� - /sMini - ������� ����� /startrace ������ �����");
SendClientMessage(playerid,COLOR_GREY,"/stria ������ �������� -  /startdrift ������ ����� �����");

SendClientMessage(playerid,COLOR_GREY,"/Warnings ����� ����� - /SetBank ���� ��� - /SetKills ���� ������");
SendClientMessage(playerid,COLOR_GREY,"/GiveSup [playerid] [1] :���� ��� ������� ����� ��� ����� �����");
SendClientMessage(playerid,COLOR_GREY,"/GiveVip [playerid] [levelvip] .������� ���� �� ���� �� ��� ����� ����� ���� VIP��� ������� ����� �");
SendClientMessage(playerid,COLOR_GREY,"!��� ��� ������ ��� ��������. ����� �� ��� ���� �����");
SendClientMessage(playerid,COLOR_GREY,"��� �� ���� ������ ���� �� ����� �� �� - ./help 20 VIP����� ������ �� ����� �");


//
}
else
{
SendClientMessage(playerid,COLOR_WHITE,".�� ������� ��� 10 ����� ������ ����� �� �������");
}
return 1;
}


if(!strcmp(cmd,"/sp",true))
{
if(InArea(playerid, 404.8684, 35.6969, 2102.7212, 1653.4156)) return SendClientMessage(playerid,WHITE,".���� VIP ��� ����� ����� ������ �");
if(InArea(playerid,-1867.1172 ,-2046.8510, 365.2502,189.3918)) return SendClientMessage(playerid,WHITE,".��� ����� ����� ����� �����");
if (PlayerInfo[playerid][Level] < 2) return Messagelevel (playerid, 2);
new Float:p[3];
GetPlayerPos(playerid,p[0],p[1],p[2]);
if(PlayerInfo[playerid][Saved] == 1)
{
SendClientMessage(playerid,WHITE,".���� ���� ���");
}
else
{
SendClientMessage(playerid,WHITE,".���� ���� ���");
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




//====================Bank Transfer
if(!strcmp(cmd, "/bankid", true)) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) return SendClientMessage(playerid, 0x0C4E0FF, " /bankid [playerid] [amount] :�����");
giveplayerid = strval(tmp);
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) return SendClientMessage(playerid, 0x0C4E0FF, " /bankid [playerid] [amount] :�����");
moneysa[playerid] = strval(tmp);
if(!IsPlayerConnected(giveplayerid)) {
format(string, sizeof(string), " �� ����� ID:%d ", giveplayerid);
SendClientMessage(playerid, COLOR_BRIGHTRED, string);
return 1;
}
if(moneysa[playerid] < 0 && PlayerInfo[playerid][Bank] < moneysa[playerid]) return SendClientMessage(playerid, COLOR_BRIGHTRED, " ���� ����� ���� ");
PlayerInfo[playerid][Bank] = PlayerInfo[playerid][Bank]-moneysa[playerid];
dini_IntSet(GetPlayerFile(playerid),"Bank",PlayerInfo[playerid][Bank]);
PlayerInfo[giveplayerid][Bank] = PlayerInfo[giveplayerid][Bank]+moneysa[playerid];
dini_IntSet(GetPlayerFile(giveplayerid),"Bank",PlayerInfo[giveplayerid][Bank]);
format(string, sizeof(string), " $%d ,%s (id: %d) ����� ������ ���� �� ", moneysa[playerid] , GetName(giveplayerid), giveplayerid);
SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
format(string, sizeof(string), " $%d ����� ������ ��� ��� %s (id: %d) ", moneysa[playerid], GetName(playerid), playerid);
SendClientMessage(giveplayerid, COLOR_LIGHTGREEN, string);
return 1;
}

if(strcmp(cmd, "/VIP", true) == 0)
{
new Roy_Killer[256];
Roy_Killer= strtok(cmdtext, idx);
if(!strlen(Roy_Killer))
{
SendClientMessage(playerid,WHITE,"/VIP Camrea/off/list/go -  - :������� ");

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
SendClientMessage(playerid,red,".��� VIP ���� ���� ����� ������");
}
else
{
SendClientMessage(playerid,COLOR_WHITE,".���� VIP ����� ���� �����");
}
}
else if(strcmp(Roy_Killer,"Camrea",true) == 0)
{
if (PlayerInfo[playerid][VIPS] >= 1)
{

SetPlayerCameraPos(playerid,264.5831,1896.2504,33.8984);
SetPlayerCameraLookAt(playerid,212.5598,1895.0790,16.2901);
SendClientMessage(playerid,red,".��� VIP��� ��� ����� �� ����� �");
}
else
{
SendClientMessage(playerid,COLOR_WHITE,".���� VIP ����� ���� �����");
}
}
else if(strcmp(Roy_Killer,"Go",true) == 0)
{
if (PlayerInfo[playerid][VIPS] >= 1)
{
SetPlayerPos(playerid,212.5598,1895.0790,16.2901);
SetPlayerInterior(playerid,0);
SendClientMessage(playerid,red,".��� ������� ���� ���� VIP������ ����� ������ �");
}
else
{
SendClientMessage(playerid,COLOR_WHITE,".���� VIP ����� ���� �����");
}
}
else if(strcmp(Roy_Killer,"list",true) == 0)
{
if(IsPlayerConnected(playerid))
{
format(string, 256, "--- :�������� ���� VIP ���� ---");
SendClientMessage(playerid, COLOR_WHITE, string);

fnm
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
if (strcmp("/Bank", cmdtext, true, 10) == 0) return SetPlayerPos(playerid,2144.0793,1612.3879,993.6882),SetPlayerInterior(playerid,1),ResetPlayerWeapons(playerid),GameTextForPlayer(playerid,"~w~Bank",3000,1),SendClientMessage(playerid, 0xF6F658FF, ".������ ����� ����");

if (strcmp("/ser", cmdtext, true, 10) == 0)return SetPlayerPos(playerid, -2127.5107,921.3911,79.4371);
if (strcmp("/vinfo", cmdtext, true, 10) == 0){
new Float:healths;
new vehicleid = GetPlayerVehicleID(playerid);
GetVehicleHealth(vehicleid, healths);

if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,RED,"! ��� ���� ����� ������� ���� ���� ������ ");
SendClientMessage(playerid,COLOR_WHITE,".-- .������ ���� ���� ���� ���� ��� --");
format(string, sizeof(string), "%.1f  :����� �� ����", healths),SendClientMessage(playerid, COLOR_GREY, string);
format(vehname,999,".%s :��� �� ����",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,COLOR_GREY,vehname);
format(vehname,999,".%d :������ �� ����",GetVehicleModel(GetPlayerVehicleID(playerid))),SendClientMessage(playerid,COLOR_GREY,vehname);

return 1;
}
if (strcmp("/showallxinfoplease", cmdtext, true, 10) == 0)
{
Xinfo();
return 1;
}
//====================Bank System
if(!strcmp(cmd, "/deposit", true))
{
if(!CPS_IsPlayerInCheckpoint(playerid,bcp)) return SendClientMessage(playerid,COLOR_WHITE," ��� ���� ����� ��'� ����� �� ���� ��� ������� ������ �� ");
tmp = strtok(cmdtext, idx);
if(PlayerInfo[playerid][GetAloan] ==1) return format(string, sizeof(string),"%d :��� ���� ���� ���� ���� ��",PlayerInfo[playerid][MoneyLoan]),SendClientMessage(playerid,red,string),SendClientMessage(playerid,red,".��� �� ��� ������ ������ ��� ���� ���� ����� ���� �� �� �� ���� ������ ����");
if(!strlen(tmp)) return SendClientMessage(playerid, 0x0C4E0FF, " /deposit [amount] :����� ");
moneysa[playerid] = strval(tmp);
if(moneysa[playerid] < 1) return SendClientMessage(playerid, COLOR_BRIGHTRED, " ��� ���� ������ ���� ���� ���� � 0 ");
if(PlayerInfo[playerid][Bank] > 30000000) return SendClientMessage(playerid, COLOR_BRIGHTRED,".��� �� ���� ������ ���� ��� ���� ������ �����");
if(GetPlayerMoney(playerid) < moneysa[playerid]) return SendClientMessage(playerid, COLOR_BRIGHTRED, " ��� �� ����� ��� ");
LACY_GiveMoney(playerid, 0-moneysa[playerid]);
PlayerInfo[playerid][Bank] = PlayerInfo[playerid][Bank]+moneysa[playerid];
dini_IntSet(GetPlayerFile(playerid),"Bank",PlayerInfo[playerid][Bank]);
format(string, sizeof(string), " [$%d] :����� ������ ���� ��� ,[$%d] :�� �� ������ ����", PlayerInfo[playerid][Bank], moneysa[playerid]);
SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
return 1;
}

if(!strcmp(cmd, "/depositall", true))
{
if(!CPS_IsPlayerInCheckpoint(playerid,bcp)) return SendClientMessage(playerid,COLOR_WHITE,".��� ���� ����� ��'� ����� �� ���� ��� ������� ������ �� ");
if(GetPlayerMoney(playerid) < 0) return SendClientMessage(playerid, COLOR_BRIGHTRED, " ��� �� ����� ��� ");
moneysa[playerid] = strval(tmp);
if(PlayerInfo[playerid][Bank] > 30000000) return SendClientMessage(playerid, COLOR_BRIGHTRED,".��� �� ���� ������ ���� ��� ���� ������ �����");
if(PlayerInfo[playerid][GetAloan] ==1) return format(string, sizeof(string),"%d :��� ���� ���� ���� ���� ��",PlayerInfo[playerid][MoneyLoan]),SendClientMessage(playerid,red,string),SendClientMessage(playerid,red,".��� �� ��� ������ ������ ��� ���� ���� ����� ���� �� �� �� ���� ������ ����");
PlayerInfo[playerid][Bank] = PlayerInfo[playerid][Bank]+GetPlayerMoney(playerid);
dini_IntSet(GetPlayerFile(playerid),"Bank",PlayerInfo[playerid][Bank]);
format(string, sizeof(string), " [$%d] :����� ������ ���� ��� ,[$%d] :�� �� ������ ����", PlayerInfo[playerid][Bank], GetPlayerMoney(playerid));
SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
LACY_GiveMoney(playerid, 0-GetPlayerMoney(playerid));



return 1;
}
//====================Withdraw from Bank
if(!strcmp(cmd, "/withdraw", true))
{
if(!CPS_IsPlayerInCheckpoint(playerid,bcp)) return SendClientMessage(playerid,COLOR_WHITE," ��� ���� ����� ��'� ����� �� ���� ��� ������� ������ �� ");
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) return SendClientMessage(playerid, 0x0C4E0FF, " /withdraw [amount] :����� ");
moneysa[playerid] = strval(tmp);
if(moneysa[playerid] < 1) return SendClientMessage(playerid, COLOR_BRIGHTRED, "��� ���� ������ ���� ���� ���� � 0  ");
moneysa[playerid] = strval(tmp);
if(moneysa[playerid] > PlayerInfo[playerid][Bank]) return SendClientMessage(playerid, COLOR_BRIGHTRED, " ���� ����� ���� ");
LACY_GiveMoney(playerid, moneysa[playerid]);
PlayerInfo[playerid][Bank] = PlayerInfo[playerid][Bank]-moneysa[playerid];
dini_IntSet(GetPlayerFile(playerid),"Bank",PlayerInfo[playerid][Bank]);
format(string, sizeof(string), "[$%d] ���� �� ������ ���� ,[$%d] ���� ������ ���� ���",  moneysa[playerid],PlayerInfo[playerid][Bank]);
SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
return 1;
}
//====================Balance
if(!strcmp(cmd, "/balance", true)) {
if(!CPS_IsPlayerInCheckpoint(playerid,bcp)) return SendClientMessage(playerid,COLOR_WHITE," ��� ���� ����� ��'� ����� �� ���� ��� ������� ������ �� ");
format(string, sizeof(string), " [$%d] �� �� ����", PlayerInfo[playerid][Bank]);
SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
return 1;
}





if(!strcmp(cmd,"/weaponlist",true) || !strcmp(cmd,"/WL",true))
{
if(IsPlayerInCheckpoint(playerid)==0 || playerCheckpoint[playerid]!=CP_AMMU) {
SendClientMessage(playerid, COLOR_WHITE, ".��� ���� ����� ������ ���� ����� �����");
return 1;
}
SendClientMessage(playerid, COLOR_WHITE, "-- .����� ����� ������� --");
SendClientMessage(playerid, 0xF6F658FF, "1.  /Bw 1 Sawnoff Shotgun 50000$ |2.    /Bw 2 MicroSMG 25000$");
SendClientMessage(playerid, 0xF6F658FF, "3.  /Bw 3 Tec9 25000$            |4.    /Bw 4 M4 20000$");
SendClientMessage(playerid, 0xF6F658FF, "5.  /Bw 5 MP5 30000$             |6.    /Bw 6 AK47 30000$");
SendClientMessage(playerid, 0xF6F658FF, "7.  /Bw 7 Knife 10000$           |8.    /Bw 8 Katana 10000$");
SendClientMessage(playerid, 0xF6F658FF, "9.  /Bw 9 Combat Shotgun 35000$  |10.   /Bw 10 Shotgun 10000$");
SendClientMessage(playerid, 0xF6F658FF, "11. /Bw 11 Sniper Rifle 50000$   |12.   /Bw 12 Colt Pistol 10000$");
return 1;
}


if(!strcmp(cmd,"/buyarmour",true) || !strcmp(cmd,"/buyarmour",true))
{

if(IsPlayerInCheckpoint(playerid)==0 || playerCheckpoint[playerid]!=CP_AMMU) {
SendClientMessage(playerid, COLOR_WHITE, ".��� ���� ����� ������ ���� ����� �����");
return 1;
}
if(GetPlayerMoney(playerid) < 100000) return SendClientMessage(playerid,RED,".��� �� ����� ��� ����� ������ �� ������� ����� ");
if(PlayerInfo[playerid][armourT] ==1) return SendClientMessage(playerid,COLOR_WHITE,"/SelArmour .��� �� �� ��� ����� ���� ����� ���� ����� ��� �����");

LACY_GiveMoney(playerid,-100000);


SetPlayerArmour(playerid,100);
PlayerInfo[playerid][armourT] = 1;
dini_IntSet(GetPlayerFile(playerid),"armour",PlayerInfo[playerid][armourT]);

SendClientMessage(playerid, 0x0F482FF, ".(armour),�����/� ���� ��� �����");

return 1;
}
if(!strcmp(cmd,"/Sellarmour",true) || !strcmp(cmd,"/armourarmourarmour",true))
{

if(IsPlayerInCheckpoint(playerid)==0 || playerCheckpoint[playerid]!=CP_AMMU) {
SendClientMessage(playerid, COLOR_WHITE, ".��� ���� ����� ������ ���� ����� �����");
return 1;
}
if(PlayerInfo[playerid][armourT] ==0) return SendClientMessage(playerid,COLOR_WHITE,".��� ���� ��� ��� �����");
SetPlayerArmour(playerid,0);
PlayerInfo[playerid][armourT] = 0;

SendClientMessage(playerid, 0x0F482FF, ".���� �� ���� ��� ������ ������ ��� ����� ������");
LACY_GiveMoney(playerid,50000);
return 1;
}
new Invis[MAX_PLAYERS]=0;
if(!strcmp(cmd, "/INV", true))
{
if(PlayerInfo[playerid][AdminsLevel] < 1)return 1;

SetPlayerColor(playerid, 0xFFFFFF00);
SendClientMessage(playerid, WHITE,"/uninv .��� ��� ���� ���� �� ��� ����� ���� ����");
Invis[playerid] =1;


return 1;
}
if(!strcmp(cmd, "/unINV", true))
{
SetPlayerColor(playerid,sgba2hex(random(256),random(256),random(256),55));//��� ����
SendClientMessage(playerid, red,".��� ���� ���� ������");
Invis[playerid] =0;
return 1;
}
if(!strcmp(cmd,"/bw",true) || !strcmp(cmd,"/BuyWeapon",true))
{
if(IsPlayerInCheckpoint(playerid)==0 || playerCheckpoint[playerid]!=CP_AMMU) {
SendClientMessage(playerid, COLOR_WHITE, ".��� ���� ����� ������ ���� ����� �����");
return 1;
}
new Roy_Killer1111[256];
Roy_Killer1111= strtok(cmdtext, idx);
if(!strlen(Roy_Killer1111))
{
SendClientMessage(playerid, COLOR_BRIGHTRED, "/BW [1-12] ����� �����");

return 1;
}


else if(strcmp(Roy_Killer1111,"1",true) == 0)
{
if(GetPlayerMoney(playerid) < 50000) return SendClientMessage(playerid,RED,"!��� �� ����� ��� ���� ��");
PlayerInfo[playerid][Sawn] +=100;
dini_IntSet(GetPlayerFile(playerid),"Sawn",PlayerInfo[playerid][Sawn]);
GivePlayerWeapon(playerid,26,PlayerInfo[playerid][Sawn]);
LACY_GiveMoney(playerid,-50000);
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".������ (Sawnoff Shotgun) ,���� 100 ������ ����");
return 1;
}

else if(strcmp(Roy_Killer1111,"2",true) == 0)
{
if(GetPlayerMoney(playerid) < 25000) return SendClientMessage(playerid,RED,"!��� �� ����� ��� ���� ��");
PlayerInfo[playerid][MicroSMG] +=100;
dini_IntSet(GetPlayerFile(playerid),"MicroSMG",PlayerInfo[playerid][MicroSMG]);
GivePlayerWeapon(playerid,28,PlayerInfo[playerid][MicroSMG]);
LACY_GiveMoney(playerid,-25000);
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".������ (MicroSMG) ,���� 100 ������ ����");
return 1;
}

else if(strcmp(Roy_Killer1111,"3",true) == 0)
{
if(GetPlayerMoney(playerid) < 25000) return SendClientMessage(playerid,RED,"!��� �� ����� ��� ���� ��");
PlayerInfo[playerid][Tec9] +=100;
dini_IntSet(GetPlayerFile(playerid),"Tec9",PlayerInfo[playerid][Tec9]);
GivePlayerWeapon(playerid,32,PlayerInfo[playerid][Tec9]);
LACY_GiveMoney(playerid,-25000);
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".������ (Tec9) ,���� 100 ������ ����");
return 1;
}
else if(strcmp(Roy_Killer1111,"4",true) == 0)
{
if(GetPlayerMoney(playerid) < 20000) return SendClientMessage(playerid,RED,"!��� �� ����� ��� ���� ��");
PlayerInfo[playerid][M4] +=100;
dini_IntSet(GetPlayerFile(playerid),"M4",PlayerInfo[playerid][M4]);
GivePlayerWeapon(playerid,31,PlayerInfo[playerid][M4]);
LACY_GiveMoney(playerid,-20000);
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".������ (M4) ,���� 100 ������ ����");

return 1;
}
else if(strcmp(Roy_Killer1111,"5",true) == 0)
{
if(GetPlayerMoney(playerid) < 30000) return SendClientMessage(playerid,RED,"!��� �� ����� ��� ���� ��");
PlayerInfo[playerid][MP5] +=100;
dini_IntSet(GetPlayerFile(playerid),"MP5",PlayerInfo[playerid][MP5]);
GivePlayerWeapon(playerid,29,PlayerInfo[playerid][MP5]);
LACY_GiveMoney(playerid,-30000);
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".������ (MP5) ,���� 100 ������ ����");
return 1;
}

else if(strcmp(Roy_Killer1111,"6",true) == 0)
{
if(GetPlayerMoney(playerid) < 30000) return SendClientMessage(playerid,RED,"!��� �� ����� ��� ���� ��");
PlayerInfo[playerid][AK47] +=100;
dini_IntSet(GetPlayerFile(playerid),"AK47",PlayerInfo[playerid][AK47]);
GivePlayerWeapon(playerid,30,PlayerInfo[playerid][AK47]);
LACY_GiveMoney(playerid,-30000);
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".������ (AK47) ,���� 100 ������ ����");
return 1;
}


else if(strcmp(Roy_Killer1111,"7",true) == 0)
{
if(GetPlayerMoney(playerid) < 10000) return SendClientMessage(playerid,RED,"!��� �� ����� ��� ���� ��");
PlayerInfo[playerid][Knife] = 1;
dini_IntSet(GetPlayerFile(playerid),"Knife",PlayerInfo[playerid][Knife]);
GivePlayerWeapon(playerid,4,PlayerInfo[playerid][Knife]);
LACY_GiveMoney(playerid,-10000);
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".������ (Knife) ,���� �� ����");
return 1;
}
else if(strcmp(Roy_Killer1111,"8",true) == 0)
{
if(GetPlayerMoney(playerid) < 10000) return SendClientMessage(playerid,RED,"!��� �� ����� ��� ���� ��");
PlayerInfo[playerid][Katana] = 1;
dini_IntSet(GetPlayerFile(playerid),"Katana",PlayerInfo[playerid][Katana]);
GivePlayerWeapon(playerid,8,PlayerInfo[playerid][Katana]);
LACY_GiveMoney(playerid,-10000);
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".������ (Katana) ,���� �� ����");
return 1;
}

else if(strcmp(Roy_Killer1111,"9",true) == 0)
{
if(GetPlayerMoney(playerid) < 35000) return SendClientMessage(playerid,RED,"!��� �� ����� ��� ���� ��");
PlayerInfo[playerid][CombatShotGun] +=20;
dini_IntSet(GetPlayerFile(playerid),"CombatShotGun",PlayerInfo[playerid][CombatShotGun]);
GivePlayerWeapon(playerid,27,PlayerInfo[playerid][CombatShotGun]);
LACY_GiveMoney(playerid,-35000);
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".������ (CombatShotGun) ,���� 20 ������ ����");
return 1;
}
else if(strcmp(Roy_Killer1111,"10",true) == 0)
{
if(GetPlayerMoney(playerid) < 10000) return SendClientMessage(playerid,RED,"!��� �� ����� ��� ���� ��");
PlayerInfo[playerid][ShotGun] +=20;
dini_IntSet(GetPlayerFile(playerid),"ShotGun",PlayerInfo[playerid][ShotGun]);
GivePlayerWeapon(playerid,25,PlayerInfo[playerid][ShotGun]);
LACY_GiveMoney(playerid,-10000);
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".������ (Shotgun) ,���� 20 ������ ����");
return 1;
}
else if(strcmp(Roy_Killer1111,"11",true) == 0)
{
if(GetPlayerMoney(playerid) < 50000) return SendClientMessage(playerid,RED,"!��� �� ����� ��� ���� ��");
PlayerInfo[playerid][CRifle] +=3;
dini_IntSet(GetPlayerFile(playerid),"CRifle",PlayerInfo[playerid][CRifle]);
GivePlayerWeapon(playerid,34,PlayerInfo[playerid][CRifle]);
LACY_GiveMoney(playerid,-50000);
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".������ (Sniper Rifle) ,���� 3 ������ ����");
return 1;
}
else if(strcmp(Roy_Killer1111,"12",true) == 0)
{
if(GetPlayerMoney(playerid) < 10000) return SendClientMessage(playerid,RED,"!��� �� ����� ��� ���� ��");
PlayerInfo[playerid][Colt] +=120;
dini_IntSet(GetPlayerFile(playerid),"Colt",PlayerInfo[playerid][Colt]);
GivePlayerWeapon(playerid,22,PlayerInfo[playerid][Colt]);
LACY_GiveMoney(playerid,-10000);
new rand = random(sizeof(playerColors));
SendClientMessage(playerid,playerColors[rand],".������ (Pistol mm9) ,���� 120 ������ ����");
return 1;
}

return 1;
}
//---
/*
if(!strcmp(cmd, "/fastwl", true))
{
SendClientMessage(playerid, COLOR_WHITE, "-- ����� ����� ������ --");
SendClientMessage(playerid, 0xF6F658FF, "/Bw 1 Uzi 200$");
SendClientMessage(playerid, 0xF6F658FF, "/Bw 2 SawnOff 200$");
SendClientMessage(playerid, 0xF6F658FF, "/Bw 3 SniperRifile 200$");
SendClientMessage(playerid, 0xF6F658FF, "/Bw 4 M4 200$");
SendClientMessage(playerid, 0xF6F658FF, "/Bw 5 ShotGun 200$");
SendClientMessage(playerid, 0xF6F658FF, "/Bw 6 Tec9 200");
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
if(GetPlayerMoney(playerid) < 200) return   SendClientMessage(playerid,0xF6F658FF,"��� ���� �200 ���� ���� ��");
GivePlayerWeapon(playerid,28,600);
SendClientMessage(playerid,0xF6F658FF,".����� ����� ������ (Uzi) ����� ���� ����");
SendClientMessage(playerid,COLOR_PURPLE,".���� ����: ��� �� ���� �� ���� ���� �����");
LACY_GiveMoney(playerid,-200);
return 1;
}
//----------------------
else if(strcmp(Roy_Killer1111,"2",true) == 0){
if(GetPlayerMoney(playerid) < 200) return   SendClientMessage(playerid,0xF6F658FF,"��� ���� �200 ���� ���� ��");
GivePlayerWeapon(playerid,26,600);
SendClientMessage(playerid,COLOR_PURPLE,".����� ����� ����� (SawnOff)SawnOff ����� ���� ");
SendClientMessage(playerid,COLOR_PURPLE,".���� ����: ��� �� ���� �� ���� ���� �����");
LACY_GiveMoney(playerid,-200);
return 1;}
//----------------------
else if(strcmp(Roy_Killer1111,"4",true) == 0){
if(GetPlayerMoney(playerid) < 200) return   SendClientMessage(playerid,0xF6F658FF,"��� ���� �200 ���� ���� ��");
GivePlayerWeapon(playerid,31,600);
SendClientMessage(playerid,0xF6F658FF,"����� ����� ����� (M4) M4 ����� ���� ");
SendClientMessage(playerid,COLOR_PURPLE,".���� ����: ��� �� ���� �� ���� ���� �����");
LACY_GiveMoney(playerid,-200);
return 1;}
//----------------------
else if(strcmp(Roy_Killer1111,"3",true) == 0){
//----------------------
if(GetPlayerMoney(playerid) < 200) return   SendClientMessage(playerid,0xF6F658FF,"��� ���� �200 ���� ���� ��");
GivePlayerWeapon(playerid,34,25);
SendClientMessage(playerid,0xF6F658FF,"����� ����� ����� (Rifle) Rifle ����� ���� ");
LACY_GiveMoney(playerid,-200);
SendClientMessage(playerid,COLOR_PURPLE,".���� ����: ��� �� ���� �� ���� ���� �����");
return 1;
}
//----------------------
else if(strcmp(Roy_Killer1111,"5",true) == 0){
//----------------------
if(GetPlayerMoney(playerid) < 200) return   SendClientMessage(playerid,0xF6F658FF,"��� ���� �200 ���� ���� ��");
GivePlayerWeapon(playerid,25,300);
SendClientMessage(playerid,0xF6F658FF," ����� ���� ������");
SendClientMessage(playerid,COLOR_PURPLE,".���� ����: ��� �� ���� �� ���� ���� �����");
LACY_GiveMoney(playerid,-200);
return 1;
}
//----------------------
else if(strcmp(Roy_Killer1111,"6",true) == 0){
//----------------------
if(GetPlayerMoney(playerid) < 200) return   SendClientMessage(playerid,0xF6F658FF,"��� ���� �200 ���� ���� ��");
SendClientMessage(playerid,0xF6F658FF,"Tec9 ����� ����");
SendClientMessage(playerid,COLOR_PURPLE,".���� ����: ��� �� ���� �� ���� ���� �����");
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
if(Stoned[playerid] == 1)return SendClientMessage(playerid, COLOR_BRIGHTRED, " ��� ����� ��� ����� ����� ");


if(PlayerInfo[playerid][Weeds] > 0)
{
PlayerInfo[playerid][Weeds] --;
format(str, sizeof(str), " ����� ���� ����, ���� �� %d/10 ���� ", PlayerInfo[playerid][Weeds]);

TheWeed[playerid] =1;
Stoned[playerid]=1;
SetPlayerWantedLevel(playerid,1);
ApplyAnimation(playerid,"PED","WALK_DRUNK",4.0,1,1,1,1,0);
}
else
{
format(str, sizeof(str), " ��� �� �� ��� ���� ");
SendClientMessage(playerid, red, str);
}
return 1;
}

//===============================ChaStart Command===============================
if(!strcmp(cmd, "/startCha", true))
{
if(PlayerInfo[playerid][AdminsLevel]<10) return 0;
if(ChaOn == 1) return SendClientMessage(playerid, red, ".�� ��� ����� ����� ����� ");
format(kboobcha, sizeof(kboobcha), "~y~~H~[]/Cha~y~~H~[]");
GameTextForAll(kboobcha,3000,4);
for(new i = 0; i < MAX_PLAYERS; i++) {
}
ChaPras  = 3000;
SetTimer("ChaStarted",3000,0);



//[Challenge]============================================================
CheDelObject[0] = CreateStreamObject(1696, 1769.081299, -2475.579346, 13.561917, 0.0000, 0.0000, 180.0000, 500);
CheDelObject[1] =CreateStreamObject(1894, 1770.736694, -2480.442383, 11.954697, 359.1406, 2.5783, 101.2500, 500);
CheDelObject[2] =CreateStreamObject(1894, 1775.860718, -2506.013184, 13.112448, 359.1406, 10.3132, 101.2500, 500);
CheDelObject[3] =CreateStreamObject(5152, 1780.142212, -2534.805908, 20.779951, 0.0000, 0.0000, 270.0000, 500);
CheDelObject[4] =CreateStreamObject(13604, 1776.118408, -2548.626709, 22.604872, 0.8594, 356.5623, 278.6717, 500);
CheDelObject[5] =CreateStreamObject(13636, 1781.736084, -2545.876221, 26.592197, 0.0000, 0.0000, 281.2500, 500);
CheDelObject[6] =CreateStreamObject(13638, 1777.057251, -2541.441650, 30.043570, 0.8594, 17.1887, 11.2500, 500);
CheDelObject[7] =CreateStreamObject(13638, 1771.777100, -2555.157471, 36.419189, 0.0000, 19.7670, 90.8595, 500);
CheDelObject[8] =CreateStreamObject(13647, 1758.082153, -2539.003418, 40.517815, 0.0000, 0.0000, 112.5000, 500);
CheDelObject[9] =CreateStreamObject(18262, 1748.788940, -2517.121582, 43.027180, 0.0000, 0.0000, 22.5000, 500);
CheDelObject[10] =CreateStreamObject(18367, 1746.841919, -2512.927490, 41.922482, 0.0000, 0.0000, 213.7500, 500);
CheDelObject[11] =CreateStreamObject(18367, 1736.853882, -2496.445557, 45.156380, 0.0000, 12.8916, 306.3284, 500);
CheDelObject[12] =CreateStreamObject(18367, 1714.320679, -2515.731445, 48.742352, 0.0000, 352.2651, 218.1245, 500);
CheDelObject[13] =CreateStreamObject(18367, 1701.230713, -2496.107178, 51.958038, 0.0000, 12.8916, 306.3284, 500);
CheDelObject[14] =CreateStreamObject(18609, 1692.528931, -2503.911133, 54.147449, 0.0000, 0.0000, 315.0000, 500);
CheDelObject[15] =CreateStreamObject(18609, 1709.177612, -2509.929688, 50.836823, 0.0000, 0.0000, 30.1576, 500);
CheDelObject[16] =CreateStreamObject(18367, 1678.757324, -2515.343994, 55.317616, 0.0000, 0.0000, 213.7500, 500);
CheDelObject[17] =CreateStreamObject(18367, 1676.555054, -2511.261719, 58.896374, 351.4056, 0.0000, 213.7500, 500);
CheDelObject[18] =CreateStreamObject(18367, 1664.081177, -2493.852051, 58.155533, 351.4056, 0.0000, 213.7500, 500);
CheDelObject[19] =CreateStreamObject(18367, 1661.992310, -2489.944580, 65.772484, 347.1084, 0.0000, 213.7500, 500);
CheDelObject[20] =CreateStreamObject(18367, 1646.171021, -2467.510010, 75.243423, 347.1084, 0.0000, 168.7500, 500);
CheDelObject[21] =CreateStreamObject(18367, 1647.679688, -2470.190918, 65.190323, 330.7792, 0.0000, 168.7500, 500);
CheDelObject[22] =CreateStreamObject(13638, 1657.328979, -2442.719727, 84.871346, 0.8594, 17.1887, 260.3826, 500);
CheDelObject[23] =CreateStreamObject(18367, 1652.083618, -2438.176025, 88.640350, 347.1084, 0.0000, 168.7500, 500);
CheDelObject[24] =CreateStreamObject(13638, 1668.809814, -2436.662109, 93.845680, 0.8594, 17.1887, 282.8826, 500);
CheDelObject[25] =CreateStreamObject(18367, 1671.179565, -2431.894531, 99.373596, 347.1084, 0.0000, 247.5000, 500);
CheDelObject[26] =CreateStreamObject(18367, 1657.196655, -2406.981201, 100.414162, 347.1084, 0.0000, 168.7500, 500);
CheDelObject[27] =CreateStreamObject(3280, 1657.497681, -2408.782715, 97.319832, 0.0000, 0.0000, 0.0000, 500);
CheDelObject[28] =CreateStreamObject(3280, 1657.508179, -2407.587158, 97.319832, 0.0000, 0.0000, 0.0000, 500);
CheDelObject[29] =CreateStreamObject(3280, 1657.483154, -2406.385986, 97.319832, 0.0000, 0.0000, 0.0000, 500);
CheDelObject[30] =CreateStreamObject(3280, 1657.483154, -2405.561279, 98.044876, 90.2408, 0.0000, 358.2811, 500);
CheDelObject[31] =CreateStreamObject(18367, 1645.770264, -2417.960449, 109.594154, 347.1084, 0.0000, 152.4979, 500);
CheDelObject[32] =CreateStreamObject(3280, 1645.684082, -2418.574463, 108.741455, 0.0000, 0.0000, 351.4056, 500);
CheDelObject[33] =CreateStreamObject(18367, 1662.898193, -2379.385498, 109.132889, 17.1887, 0.0000, 180.0000, 500);
CheDelObject[34] =CreateStreamObject(1222, 1654.059082, -2428.472412, 92.961739, 0.0000, 0.0000, 0.0000, 500);
CheDelObject[35] =CreateStreamObject(1222, 1660.067383, -2442.182617, 91.124886, 0.0000, 0.0000, 0.0000, 500);
CheDelObject[36] =CreateStreamObject(1222, 1649.976929, -2448.242188, 82.402466, 0.0000, 0.0000, 0.0000, 500);
CheDelObject[37] =CreateStreamObject(1222, 1649.479248, -2451.445068, 81.290794, 0.0000, 0.0000, 0.0000, 500);
CheDelObject[38] =CreateStreamObject(1222, 1650.962524, -2452.138428, 78.797348, 0.0000, 0.0000, 0.0000, 500);
CheDelObject[39] =CreateStreamObject(1222, 1650.402466, -2457.965820, 74.550095, 0.0000, 0.0000, 0.0000, 500);
CheDelObject[40] =CreateStreamObject(1222, 1649.344849, -2470.849365, 65.996147, 0.0000, 0.0000, 0.0000, 500);
CheDelObject[41] =CreateStreamObject(1222, 1653.144775, -2477.277344, 63.932148, 0.0000, 0.0000, 0.0000, 500);
CheDelObject[42] =CreateStreamObject(1222, 1652.782104, -2474.846191, 64.527458, 0.0000, 0.0000, 0.0000, 500);
CheDelObject[43] =CreateStreamObject(1222, 1651.370972, -2474.034424, 64.936928, 0.0000, 0.0000, 0.0000, 500);
CheDelObject[44] =CreateStreamObject(1222, 1787.568237, -2543.593018, 28.771389, 0.0000, 0.0000, 0.0000, 500);
CheDelObject[45] =CreateStreamObject(13638, 1771.913818, -2563.825439, 42.821404, 0.0000, 19.7670, 90.8595, 500);
CheDelObject[46] =CreateStreamObject(3057, 1759.306152, -2541.212646, 44.974133, 0.0000, 0.0000, 0.0000, 500);
CheDelObject[47] =CreateStreamObject(3057, 1755.714844, -2532.867432, 43.560070, 0.0000, 0.0000, 0.0000, 500);
CheDelObject[48] =CreateStreamObject(3374, 1765.493286, -2560.903076, 43.733135, 0.0000, 0.0000, 0.0000, 500);
CheDelObject[49] =CreateStreamObject(3374, 1659.718506, -2391.687500, 117.717461, 0.0000, 0.0000, 337.6546, 500);
CheDelObject[50] =CreateStreamObject(3374, 1660.451416, -2389.815674, 116.720230, 0.0000, 0.0000, 337.6546, 500);
CheDelObject[51] =CreateStreamObject(3374, 1660.772583, -2388.591064, 115.330429, 0.0000, 0.0000, 337.6546, 500);
CheDelObject[52] =CreateStreamObject(18367, 1662.771118, -2352.528809, 103.945427, 14.6104, 357.4217, 190.7688, 500);
CheDelObject[53] =CreateStreamObject(1238, 1662.104248, -2358.276611, 105.736588, 0.0000, 0.0000, 0.0000, 500);
CheDelObject[54] =CreateStreamObject(1238, 1662.935059, -2358.355469, 105.750626, 0.0000, 0.0000, 0.0000, 500);
CheDelObject[55] =CreateStreamObject(1238, 1627.243530, -2286.362061, 93.450989, 0.0000, 0.0000, 0.0000, 500);
CheDelObject[56] =CreateStreamObject(18367, 1656.920654, -2324.610840, 100.083862, 44.6907, 357.4217, 190.7688, 500);
CheDelObject[57] =CreateStreamObject(852, 1654.679077, -2314.694824, 92.738792, 0.0000, 0.0000, 0.0000, 500);
CheDelObject[58] =CreateStreamObject(18367, 1652.552246, -2303.343506, 83.249512, 347.9679, 357.4217, 190.7688, 500);
CheDelObject[59] =CreateStreamObject(18367, 1651.406494, -2274.390869, 92.817711, 9.4538, 6.8755, 293.0429, 500);
CheDelObject[60] =CreateStreamObject(1437, 1779.593750, -2544.239258, 27.454693, 0.0000, 0.0000, 101.2500, 500);
CheDelObject[61] =CreateStreamObject(1469, 1623.647583, -2288.529785, 93.621857, 0.0000, 0.0000, 270.0000, 500);
CheDelObject[62] =CreateStreamObject(1469, 1624.108521, -2290.102295, 93.070335, 0.0000, 0.0000, 315.0000, 500);
CheDelObject[63] =CreateStreamObject(1469, 1626.058350, -2291.741455, 93.064270, 0.0000, 0.0000, 326.2500, 500);
CheDelObject[64] =CreateStreamObject(1469, 1627.917603, -2291.959473, 93.064270, 0.0000, 0.0000, 11.2500, 500);
CheDelObject[65] =CreateStreamObject(1469, 1629.947021, -2291.178467, 93.064270, 0.0000, 0.0000, 33.7500, 500);
CheDelObject[66] =CreateStreamObject(1469, 1631.632446, -2289.481201, 93.064262, 0.0000, 0.0000, 56.2500, 500);
CheDelObject[67] =CreateStreamObject(1469, 1632.447876, -2287.502686, 93.070335, 0.0000, 0.0000, 90.0000, 500);
CheDelObject[68] =CreateStreamObject(1469, 1632.604614, -2285.693604, 93.070335, 0.0000, 0.0000, 90.0000, 500);
CheDelObject[69] =CreateStreamObject(1469, 1627.558350, -2281.010254, 93.036552, 0.0000, 0.0000, 180.0000, 500);
CheDelObject[70] =CreateStreamObject(1469, 1625.826782, -2281.394775, 93.070335, 0.0000, 0.0000, 191.2500, 500);
CheDelObject[71] =CreateStreamObject(1469, 1624.483521, -2282.059814, 93.070335, 0.0000, 0.0000, 213.7500, 500);
CheDelObject[72] =CreateStreamObject(1469, 1622.609131, -2283.672607, 93.070335, 0.0000, 0.0000, 225.0000, 500);
CheDelObject[73] =CreateStreamObject(1469, 1621.920166, -2285.461670, 93.070335, 0.0000, 0.0000, 270.0000, 500);
CheDelObject[74] =CreateStreamObject(1469, 1622.291016, -2287.888672, 93.070335, 0.0000, 0.0000, 292.5000, 500);
CheDelObject[75] =CreateStreamObject(1472, 1630.924072, -2283.461670, 92.708344, 0.8594, 0.0000, 123.7500, 500);
CheDelObject[76] =CreateStreamObject(3867, 1626.164673, -2279.034668, 100.013901, 0.0000, 0.0000, 180.0000, 500);
CheDelObject[77] =CreateStreamObject(3867, 1618.888428, -2284.212402, 100.049995, 0.0000, 0.0000, 270.0000, 500);
CheDelObject[78] =CreateStreamObject(3867, 1625.968384, -2292.777344, 100.516640, 0.0000, 0.0000, 4.3745, 500);


return 1; }
//===============================ChaJoin Command================================
if(!strcmp(cmd, "/Cha", true)) {
if(ChaOn == 0) return SendClientMessage(playerid, red, ".��� ����� ����� ����� �����");
if(ChaStart == 1) return SendClientMessage(playerid, red, ".����� ����� ��� ������, ��� ��� ���� ");
if(ChaPlayers == sizeof(ChaSpawn)) return SendClientMessage(playerid, red, ".�� ������� �����, ��� ��� ���");
if(InCha[playerid] == 1) return SendClientMessage(playerid, red, ".������ ��� ������ �����, ��� ����");
GetPlayerName(playerid, playername, sizeof(playername));
ChaPlayers ++; InCha[playerid] = 1;
//new string[256];
format(string,sizeof(string),".%d :���� �����/� ����",ChaPlayers);
SendClientMessage(playerid,0xE21E1EFF,string);
format(string,sizeof(string),".��� ����� �����, ���� ���� �� ���, ������ ����� ����");
SendClientMessage(playerid,0xE21E1EFF,string);

return 1; }
//===============================ChaEnd Command================================
if(!strcmp(cmd, "/Chaend", true)) {
if(ChaOn == 0) return SendClientMessage(playerid, red, ".��� ����� ����� ����� �����");
if(ChaStart == 1) return SendClientMessage(playerid, red, ".����� ����� ��� ������ ");
if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, red, ".��� �� ����� ");
SendClientMessage(playerid, COLOR_YELLOW, "����� ����� ����� ������ ");
GetPlayerName(playerid, Chaadminsname, sizeof(Chaadminsname));
CountChallenge = 0;
ChaEnd(2);
return 1; }

if(strcmp(cmd, "/weedinfo", true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,"-- .����� ����� ���� --");
SendClientMessage(playerid, 0xFF66FFAA,"���� �� ������ ����� ���� ���� ������ ����� �� ��� ����� ����");
SendClientMessage(playerid, 0xFF66FFAA,"����� ���� ����� ������ ���� �� ����� ���� ���� ������� ������");
SendClientMessage(playerid, 0xFF66FFAA,"��� �� ����� ������ ���� ����� ���� , �������� ���");
SendClientMessage(playerid, 0xFF66FFAA,":������� ������� ����� ���� ����� ``�������`` ������ ����");
SendClientMessage(playerid, 0x0BAEAFF,"/useweed .���'� ����� ������ ����� /sellweed .���� ������ ���� ����� ����� ����");
SendClientMessage(playerid, 0x0BAEAFF,"/details .������ ����� ��� /buyweed .������ ����� ����� ������ ���� ���� ����� ���� �� ��� ������");
SendClientMessage(playerid, 0x0BAEAFF,".declinedeal :������ �����");
SendClientMessage(playerid,COLOR_WHITE,"--------");
return 1;
}
if(strcmp(cmd, "/bankinfo", true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,"-- .����� ���� ���� --");
SendClientMessage(playerid, 0xFF66FFAA,"���� �� ������ ����� ��� ���� ������ ����� ����� �� �����");
SendClientMessage(playerid, 0xFF66FFAA,":���� ����� ��� ����� ������� ����");
SendClientMessage(playerid, 0xFF66FFAA,"����� ������ , ������� �������� , ������ ������� , ����� ����");
SendClientMessage(playerid, 0xFF66FFAA,"����� ����� �������� ��� ���");
SendClientMessage(playerid, 0xFF66FFAA,":���� ������ ���� ����� �� ����� ����, ������ ������");
SendClientMessage(playerid, 0x0BAEAFF,"/balance ������ ����� ����� ��� /depositall :������ �� �� ���� /deposit [amount] :������ ����");
SendClientMessage(playerid, 0x0BAEAFF,"/bankid [playerid] [amount] ������ ��� ������ �� ���� ���/withdraw [amount] :����� ��� �������");
SendClientMessage(playerid,COLOR_WHITE,"--------");
return 1;
}

//------------
if(strcmp(cmd, "/sellweed", true) == 0)
{
tmp = strtok(cmdtext, idx);
//----Syntex Error
if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /sellweed [playerid]");
if(PS[playerid] == 1)return SendClientMessage(playerid, COLOR_BRIGHTRED, "��� ���� ����� ��� ");
giveplayerid = strval(tmp);
if (IsPlayerConnected(giveplayerid)){
GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
GetPlayerName(playerid, sendername, sizeof(sendername));
fnm
if(offerweed[i][giveplayerid] == 1)return SendClientMessage(playerid,red,"������ ���� ���� ����� �� ��� ���� ������");
return 3;
}

if (PlayerInfo[playerid][Weeds] > 0 && PlayerInfo[playerid][Weeds] <= 3)
{
format(string, sizeof(string), " [$%d] ��� ���� ����� [ID:%d] %s ���� � ", WeedCost, giveplayerid, giveplayer);
SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
format(string, sizeof(string), " [$%d] ���� �� ����� ��� ���� ����� [ID:%d] %s ", WeedCost, playerid, sendername);
SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
format(string, sizeof(string), " /BuyWeed �� ��� ���� ����� �� ���� ����� ������ ");
SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
offerweed[playerid][giveplayerid] = 1;
PS[playerid] = 1;
CB[giveplayerid] = 1;
}else{
SendClientMessage(playerid, 0x0C4E0FF, " ��� �� ���� ");
}}else{
format(string, sizeof(string), " �� ����� [ID:%d] ", giveplayerid);
SendClientMessage(playerid, COLOR_LIGHTBLUE, string);}
return 1;
}

if(!strcmp(cmd,"/buyweed",true))
{
if(CB[playerid] == 0) return SendClientMessage(playerid,red," �� ��� �� ���� �� ����� ���� ");
if(PlayerInfo[playerid][Weeds] == 3)
{
SendClientMessage(playerid,red," ���� ��� ����� ���� ����� ��� %d/3 �� ��  ");
for(new i;i<MAX_PLAYERS;i++)
offerweed[i][playerid] = 0;
format(string, sizeof(string), " �� ���� ����� ��� ���� [ID:%d] %s ����� ����� ������ ������ ", giveplayerid, giveplayer);
SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
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
format(string,256,"[%d$]����� [ID:%d]%s ���� ���� ������ �",WeedCost,i,name);
SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
GetPlayerName(playerid,name,sizeof(name));
format(string,256,"[%d$] ����� [ID : %d]%s ���� ������ ���� �",WeedCost,playerid,name);
offerweed[i][playerid] = 0;
PS[playerid] = 0;
PS[i] = 0;
PlayerInfo[i][Weeds]--;
return 1;
}
else
{
SendClientMessage(playerid,red,"��� �� ����� ���");
}
}
else
{
SendClientMessage(playerid,red,"���� ��� ��� ��� �����");
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
format(string,256," ���� �� ����� [ID:%d] %s ",playerid,pname);
SendClientMessage(i, COLOR_LIGHTBLUE, string);
SendClientMessage(playerid, COLOR_BRIGHTRED, " ��� ����� �� ����� ����� ");
offerweed[i][playerid] = 0;
CB[i] = 0;
CB[playerid] = 0;
PS[playerid] = 0;
PS[i] = 0;
return 1;
}
}
SendClientMessage(playerid,red,"��� �� ����� ���� �� �� ���");
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
SendClientMessage(playerid,0xF6F658FF, ".������");

return 1;
}



if(strcmp(cmdtext, "/hq", true)==0)
{
if(strfind(GetName(playerid),"[NM]",true) == 0)
{
if (GetPlayerState(playerid) == 2)
{
SetVehiclePos(GetPlayerVehicleID(playerid), -1558.3944, 662.1249, 7.0391);
SetVehicleZAngle(GetPlayerVehicleID(playerid), 93.8882);
}
else
{
SetPlayerPos(playerid, -1558.3944, 662.1249, 7.0391);
SetPlayerFacingAngle(playerid, 93.8882);
}
SendClientMessage(playerid, 0xF6F658FF, ".������ ����� ������ �� ����� ���");
}
else
{
SendClientMessage(playerid,COLOR_BRIGHTRED,".��� �� ���� �����");
}
return 1;
}
if(strcmp(cmdtext, "/open" ,true)==0)
{
if(strfind(GetName(playerid),"[NM]",true) == 0)
{
if(!PlayerToPoint(10.0,playerid, -1571.610718, 661.513611, 0.632433)) return SendClientMessage(playerid,red,".��� ���� ���� �� ������ ���");
MoveStreamObject(NM2,-1571.610718, 661.513611, 0.632433,2.1);
SetTimer("CloseHqNm",7000,0);
}
else
{
SendClientMessage(playerid,COLOR_BRIGHTRED,".��� �� ���� �����");
}
return 1;
}




if(strcmp(cmdtext, "/open2" ,true)==0)
{
if(strfind(GetName(playerid),"[NM]",true) == 0)
{
if(!PlayerToPoint(10.0,playerid, -1631.239014, 688.460999, 2.860892)) return SendClientMessage(playerid,red,".��� ���� ���� �� ������ ���");
MoveStreamObject(NM,-1631.239014, 688.460999, 2.860892,2);
SetTimer("CloseHqNm2",7000,0);
}
else
{
SendClientMessage(playerid,COLOR_BRIGHTRED,".��� �� ���� �����");
}
return 1;
}

if(strcmp(cmdtext, "/up" ,true)==0)
{
if(strfind(GetName(playerid),"[NM]",true) == 0)
{
if(!PlayerToPoint(30.0,playerid, -1579.5121,676.5731,7.1901)) return SendClientMessage(playerid,red,".��� ���� ���� �� ������ ���");
MoveStreamObject(NM3,-1577.179688, 684.275208, 48.743347,2);
SetTimer("CloseHqNm3",15*1000,0);
}
else
{
SendClientMessage(playerid,COLOR_BRIGHTRED,".��� �� ���� �����");
}
return 1;
}






//---RaceSystem
if(strcmp(cmd, "/races", true) == 0)
{
new Roy_Killer[256];
Roy_Killer= strtok(cmdtext, idx);
if(!strlen(Roy_Killer))
{
SendClientMessage(playerid,WHITE,"/races [action] :�����");
SendClientMessage(playerid,WHITE,"/races join - �������� ������");
SendClientMessage(playerid,WHITE,"/races drift - ������ ����� ��������");
SendClientMessage(playerid,WHITE,"/races bike - ������ ����� ���������");
SendClientMessage(playerid,WHITE,"/races race - ������ ����� ���������");
return 1;
}

if(strcmp(Roy_Killer,"drift",true) == 0)
{
if(PlayerInfo[playerid][AdminsLevel] < 10) return SendClientMessage(playerid,red,".����� ���� ����� ����� ����, ����");
if(IFDriftOn == 1 || IFraceOn==1 || BikeOn == 1) return SendClientMessage(playerid,red,".�� ����� �����, ��� �������");
DriftPlayer =0,DriftEnd=0,WinnerDrift=1,IFDriftOn=1,StartDrift(),SetTimer("UnFreezeDrift",60*1000,0);
format(kboobcha, sizeof(kboobcha), "~y~~H~[]/races join~y~~H~[]");
GameTextForAll(kboobcha,3000,4);
return 1;
}

if(strcmp(Roy_Killer,"race",true) == 0)
{
if(PlayerInfo[playerid][AdminsLevel] < 10) return SendClientMessage(playerid,red,".����� ���� ����� ����� ����, ����");
if(IFDriftOn == 1 || IFraceOn==1 || BikeOn == 1) return SendClientMessage(playerid,red,".�� ����� �����, ��� �������");
RaceEnd=0,WinnerRace=1,IFraceOn=1,StartRace(),SetTimer("UnFreezeRace",60*1000,0);
format(kboobcha, sizeof(kboobcha), "~y~~H~[]/races join~y~~H~[]");
GameTextForAll(kboobcha,3000,4);
return 1;
}
if(strcmp(Roy_Killer,"bike",true) == 0)
{
if(PlayerInfo[playerid][AdminsLevel] < 10) return SendClientMessage(playerid, red, "! ��� �� ����� ");
if(IFDriftOn == 1 || IFraceOn==1 || BikeOn == 1) return SendClientMessage(playerid,red,".�� ����� �����, ��� �������");
if(BikeOn == 1) return SendClientMessage(playerid, red, ".������ ����� ��� ��� ����. ");
format(kboobcha, sizeof(kboobcha), "~y~~H~[]/races join~y~~H~[]");
GameTextForAll(kboobcha,3000,4);
BikeStart();
return 1;
}

if(strcmp(Roy_Killer,"join",true) == 0)
{
if(IFraceOn ==0 && IFDriftOn == 0 && BikeOn == 0) return SendClientMessage(playerid,red,".��� ����� ����� �����");
if(IFraceOn == 1)
{
if(RaceEnd==1) return SendClientMessage(playerid,red,".������ ��� �����");
if(RacePlayers==15) return SendClientMessage(playerid,red,".�� ������� �����");
if(Youregisterrace[playerid] ==1) return SendClientMessage(playerid,red,"��� ��� ����.");
if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,red,".��� ��� ���� ���� ������");
RacePlayers++;
Youregisterrace[playerid] =1;
format(string,sizeof(string),".%d :���� �����/� ����",RacePlayers);
SendClientMessage(playerid,0xE21E1EFF,string);
format(string,sizeof(string),".��� ����� ����, ����� ����� ��� ����� ��� ��'� ������� ������� �� ������ �����");
SendClientMessage(playerid,0xE21E1EFF,string);

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
if(DriftEnd==1) return SendClientMessage(playerid,red,".������ ��� �����");
if(DriftPlayer==22) return SendClientMessage(playerid,red,".�� ������� �����");
if(YouRegister[playerid] ==1) return SendClientMessage(playerid,red,"��� ��� ����.");
new fstr[255];
if(!IsVehicle(playerid)) return  format(fstr,sizeof(fstr),"/drifts , /race , /dj .�� ��� ������ ������ ����� Turismo ��� ���� ����"),SendClientMessage(playerid,red,fstr);
if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,red,".��� ��� ���� ���� ������");
DriftPlayer++;
YouRegister[playerid] =1;
format(string,sizeof(string),".%d :���� �����/� ����",DriftPlayer);
SendClientMessage(playerid,0xE21E1EFF,string);
format(string,sizeof(string),".��� ����� ����, ����� ����� ��� ����� ��� ��'� ������� ������� �� ������ �����");
SendClientMessage(playerid,0xE21E1EFF,string);
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
if (BikeOn == 0) return SendClientMessage(playerid, red, ".��� ����� ���� ����");
if(BikePlayers == 10) return SendClientMessage(playerid,red,"������ �����, �� ������� �����. ��� ��� ����");
if(InBike[playerid] > 0) return SendClientMessage(playerid,red,"������, ��� ���� ������� ������� ����");
if(!IsBike(playerid)) return  format(fstr,sizeof(fstr),".�� ��� ������ ������ ,NRG-500 ��� ���� ����"),SendClientMessage(playerid,red,fstr);
if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,red,".��� ��� ���� ���� ������");
DisablePlayerRaceCheckpoint(playerid);
SetPlayerRaceCheckpoint(playerid,0,-2679.4287,1357.5764,55.4297,-2677.4780,1468.2661,55.7398,15);
BikePlayers ++;
InBike[playerid] = 1;
format(string,sizeof(string),".%d :���� �����/� ����",BikePlayers);
SendClientMessage(playerid,0xE21E1EFF,string);
format(string,sizeof(string),"!��� ����� ����, ����� ����� ��� ����� ��� ��'� ������� ������� �� ������ �����");
SendClientMessage(playerid,0xE21E1EFF,string);
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


if(!strcmp(cmd, "/startwar", true))
{

if (PlayerInfo[playerid][AdminsLevel] >= 10) {

tmp = strtok(cmdtext, idx);
//if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_LIGHTGREEN, "/StartWar [Reward] :����� ");
//if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, red, ". ��� �� ����� ");
if(WarOn == 1) return SendClientMessage(playerid, red, ".�� ��� ����� ����� ");

format(kboobcha, sizeof(kboobcha), "~y~~H~[]/War~y~~H~[]");
GameTextForAll(kboobcha,3000,4);

fnm
}
SetTimer("WarStart",3000,0);

}
else
{

}
return 1;
}



if(!strcmp(cmd, "/war", true))
{
if(WarOn == 0) return SendClientMessage(playerid, red, ".��� ����� ����� �����");
if(WS == 1) return SendClientMessage(playerid, red, ".������ ��� ������, ��� ��� ���� ");
if(WarPlayers == sizeof(sssa)) return SendClientMessage(playerid, red, ".�� ������� �����, ��� ��� ���");
if(InWar[playerid] == 1) return SendClientMessage(playerid, red, ".������ ��� �����, ��� ����");
if(TorYou[playerid] ==1) return SendClientMessage(playerid, red,"/backtor :��� ����/� ���� ���");
if(SharkYou[playerid] ==1) return SendClientMessage(playerid, red,"/backshark :��� ����/� ���� ���");
if(DolpYou[playerid] ==1) return SendClientMessage(playerid, red,"/backdolphin :��� ����/� ���� ���");
if(GetPlayerMoney(playerid) < 500) return SendClientMessage(playerid, red, ".\"500$\" :��� �� ����� ��� ������ ����� ���� ������� ���");

GetPlayerName(playerid, playername, sizeof(playername));
WarPlayers ++; InWar[playerid] = 1;
MoneyWinnerWar +=500;
LACY_GiveMoney(playerid,-500);

format(string,sizeof(string),".%d :���� �����/� ����",WarPlayers);
SendClientMessage(playerid,0xE21E1EFF,string);
format(string,sizeof(string),".��� ����� ����, ����� ����� �� �������� ������");
SendClientMessage(playerid,0xE21E1EFF,string);

return 1;
}

if(!strcmp(cmd, "/warend", true))
{
if(WarOn == 0) return SendClientMessage(playerid, red, ".��� ����� ����� �����");
if (PlayerInfo[playerid][AdminsLevel] <= 10) return 0;
SendClientMessage(playerid, 0x0C4E0FF, "������ ����� ������ ");
GetPlayerName(playerid, Adminname, sizeof(Adminname));
Count = 0;
WarEnd(2);
return 1;
}

if(!strcmp(cmd, "/srpg", true))
{
if (PlayerInfo[playerid][AdminsLevel] >= 10) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_LIGHTGREEN, " /srpg [ammunt] ");
Rewardr  = strval(tmp);
WarStartr();
format(kboobcha, sizeof(kboobcha), "~y~~H~[]/Rpg~y~~H~[]");
GameTextForAll(kboobcha,3000,4);
}
else
{

}
return 1;
}

if(!strcmp(cmd, "/Rpg", true))
{


if(WarOnr == 0) return SendClientMessage(playerid, red, "��� ���� ����� ����� �����, ����.");
if(WSr == 1) return SendClientMessage(playerid, red, ".����� ��� ���, �� ���� ������ �� ���� ���� ����");
if(WarPlayersr == sizeof(gRandomWarSpawns)) return SendClientMessage(playerid, red, " �� ������� �����, ��� ��� ���");
if(InWarr[playerid] == 1) return SendClientMessage(playerid, red, "��� ��� ����, ���� ������� �������.");
WarPlayersr ++; InWarr[playerid] = 1;
format(string,sizeof(string),".%d :���� �����/� ����",WarPlayersr);
SendClientMessage(playerid,0xE21E1EFF,string);
format(string,sizeof(string),".��� ����� ����, ����� ����� �� �������� ������");
SendClientMessage(playerid,0xE21E1EFF,string);

return 1;
}

if(!strcmp(cmd, "/Rpgend", true))
{
if(WarOnr == 0) return SendClientMessage(playerid, red, " ��� ����� ����� �����");
if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, red, " ��� �� ����� ");
SendClientMessage(playerid, red, " ������ ����� ������ ");
Countr = 0;
WarEndr(2);
return 1;
}

if(strcmp(cmd,"/roykingomer",true) == 0)
{
if(IsPlayerInAnyVehicle(playerid))
{
RemovePlayerFromVehicle(playerid);
SetTimerEx("repairbug",5000,0,"i",playerid);

}
if(!IsPlayerInAnyVehicle(playerid))
{
SetTimerEx("repairbug",5000,0,"i",playerid);
}
return 1;
}
if(strcmp(cmd, "/flip", true) == 0)
{


new Float:X, Float:Y, Float:Z;
if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,COLOR_WHITE,"��� �� ����.");
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
SendClientMessage(playerid, 0xF6F658FF, string);
return 1;
}





    if(strcmp(cmd,"/SetLevelI",true) == 0)
    {
    if (PlayerInfo[playerid][AdminsLevel] >= 10)
{

       // if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid,red,". ��� �� �����");
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



if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid,red,".�� ����� �� ���� ������ ������ ������� ����");
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
//SendClientMessage(id,red,"/Syshelp :��� ��� ����� ���� ����� ���� ������ ������ �����");
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

if(strcmp(cmd,"/cgm",true) == 0)
{
if (PlayerInfo[playerid][AdminsLevel] < 10) return 0;
tmp = strtok(cmdtext, idx);
new id = ReturnID(tmp);
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_BLUE, "Invalid PlayerID !");
GodModCheack(id);
return 1;
}
if(strcmp(cmd,"/setkills",true) == 0)
{
if (PlayerInfo[playerid][AdminsLevel] < 14) return 0;
tmp = strtok(cmdtext, idx);
new id = ReturnID(tmp);
tmp2 = strtok(cmdtext, idx);
new kills = strval(tmp2);
if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /setkills [playerid] [kills]");
if(!strlen(tmp2)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /setkills [playerid] [kills]");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_BLUE, "Invalid PlayerID !");
PlayerInfo[id][Kills] = kills;

return 1;
}



if(strcmp(cmd,"/triviaMP",true) == 0)
{
if (PlayerInfo[playerid][AdminsLevel] < 10) return 0;

SendClientMessageToAll(COLOR_WHITE, "~ ~ ~ ~ ~ ~ [T]--[Trivia | �������] ~ ~ ~ ~ ~ ~");
SendClientMessageToAll(COLOR_PINK, "?����: ��� ����� �� ���� �����");
SendClientMessageToAll(COLOR_PINK, ".$�� ����� ����, ���� 600");
SendClientMessageToAll(0x0E67AFF, "/Ans [Answer] :�� ��� ����� �� ������");
SendClientMessageToAll(COLOR_WHITE, "~ ~ ~ ~ ~ ~ [T]--[Trivia | �������] ~ ~ ~ ~ ~ ~");
AnsTrivia1 = InTheServer;
fnm
MaxAns[i] = 0;
TriviaOn = 1;
}
return 1;
}

if(strcmp(cmd,"/triviahm",true) == 0)
{
if (PlayerInfo[playerid][AdminsLevel] < 10) return 0;
tmp = strtok(cmdtext, idx);
new id = ReturnID(tmp);
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, red, "Invalid PlayerID.");
SendClientMessageToAll(COLOR_WHITE, "~ ~ ~ ~ ~ ~ [T]--[Trivia | �������] ~ ~ ~ ~ ~ ~");
format(string, sizeof(string),"..?(%d) %s :��� ��� �� �����",id, GetName(id));
SendClientMessageToAll(COLOR_PINK, string);
SendClientMessageToAll(COLOR_PINK, ".$�� ����� ����, ���� 600");
SendClientMessageToAll(0x0E67AFF, "/Ans [Answer] :�� ��� ����� �� ������");
SendClientMessageToAll(COLOR_WHITE, "~ ~ ~ ~ ~ ~ [T]--[Trivia | �������] ~ ~ ~ ~ ~ ~");
AnsTrivia1 = GetPlayerMoney(id);
fnm
MaxAns[i] = 0;
TriviaOn = 1;
}
return 1;
}


if(strcmp(cmd,"/triviaLevel",true) == 0)
{
if (PlayerInfo[playerid][AdminsLevel] < 10) return 0;
tmp = strtok(cmdtext, idx);
new id = ReturnID(tmp);
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, red, "Invalid PlayerID.");
SendClientMessageToAll(COLOR_WHITE, "~ ~ ~ ~ ~ ~ [T]--[Trivia | �������] ~ ~ ~ ~ ~ ~");
format(string, sizeof(string),"..?(%d) %s :�� ���� �� �����",id, GetName(id));
SendClientMessageToAll(COLOR_PINK, string);
SendClientMessageToAll(COLOR_PINK, ".$�� ����� ����, ���� 600");
SendClientMessageToAll(0x0E67AFF, "/Ans [Answer] :�� ��� ����� �� ������");
SendClientMessageToAll(COLOR_WHITE, "~ ~ ~ ~ ~ ~ [T]--[Trivia | �������] ~ ~ ~ ~ ~ ~");
AnsTrivia1 = PlayerInfo[id][Level];
fnm
MaxAns[i] = 0;
TriviaOn = 1;
}
return 1;
}


if(strcmp(cmd,"/triviabank",true) == 0)
{
if (PlayerInfo[playerid][AdminsLevel] < 10) return 0;
tmp = strtok(cmdtext, idx);
new id = ReturnID(tmp);
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, red, "Invalid PlayerID.");

SendClientMessageToAll(COLOR_WHITE, "~ ~ ~ ~ ~ ~ [T]--[Trivia | �������] ~ ~ ~ ~ ~ ~");
format(string, sizeof(string),"..?(%d) %s :��� ��� ���� �� �",id, GetName(id));
SendClientMessageToAll(COLOR_PINK, string);
SendClientMessageToAll(COLOR_PINK, ".$�� ����� ����, ���� 600");
SendClientMessageToAll(0x0E67AFF, "/Ans [Answer] :�� ��� ����� �� ������");
SendClientMessageToAll(COLOR_WHITE, "~ ~ ~ ~ ~ ~ [T]--[Trivia | �������] ~ ~ ~ ~ ~ ~");
fnm
MaxAns[i] = 0;
TriviaOn = 1;
AnsTrivia1 = PlayerInfo[id][Bank];
}

return 1;
}



if(strcmp(cmd,"/triviavip",true) == 0)
{
if (PlayerInfo[playerid][AdminsLevel] < 10) return 0;
tmp = strtok(cmdtext, idx);
new id = ReturnID(tmp);
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, red, "Invalid PlayerID.");
SendClientMessageToAll(COLOR_WHITE, "~ ~ ~ ~ ~ ~ [T]--[Trivia | �������] ~ ~ ~ ~ ~ ~");
format(string, sizeof(string),"..?(%d) %s :�� ���� ���� �� �����",id, GetName(id));
SendClientMessageToAll(COLOR_PINK, string);
SendClientMessageToAll(COLOR_PINK, ".$�� ����� ����, ���� 600");
SendClientMessageToAll(0x0E67AFF, "/Ans [Answer] :�� ��� ����� �� ������");
SendClientMessageToAll(COLOR_WHITE, "~ ~ ~ ~ ~ ~ [T]--[Trivia | �������] ~ ~ ~ ~ ~ ~");
AnsTrivia1 = PlayerInfo[id][VIPS];
fnm
MaxAns[i] = 0;
TriviaOn = 1;
}
return 1;
}


if(strcmp(cmd,"/triviaWar",true) == 0)
{
if (PlayerInfo[playerid][AdminsLevel] < 10) return 0;
tmp = strtok(cmdtext, idx);
new id = ReturnID(tmp);
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, red, "Invalid PlayerID.");
SendClientMessageToAll(COLOR_WHITE, "~ ~ ~ ~ ~ ~ [T]--[Trivia | �������] ~ ~ ~ ~ ~ ~");
format(string, sizeof(string),"..?(%d) %s :��� ����� ���� ����� �����",id, GetName(id));
SendClientMessageToAll(COLOR_PINK, string);
SendClientMessageToAll(COLOR_PINK, ".$�� ����� ����, ���� 600");
SendClientMessageToAll(0x0E67AFF, "/Ans [Answer] :�� ��� ����� �� ������");
SendClientMessageToAll(COLOR_WHITE, "~ ~ ~ ~ ~ ~ [T]--[Trivia | �������] ~ ~ ~ ~ ~ ~");
AnsTrivia1 = PlayerInfo[id][Wars];
fnm
MaxAns[i] = 0;
TriviaOn = 1;
}
return 1;
}

if(strcmp(cmd,"/triviakills",true) == 0)
{
if (PlayerInfo[playerid][AdminsLevel] < 10) return 0;
tmp = strtok(cmdtext, idx);
new id = ReturnID(tmp);
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, red, "Invalid PlayerID.");

SendClientMessageToAll(COLOR_WHITE, "~ ~ ~ ~ ~ ~ [T]--[Trivia | �������] ~ ~ ~ ~ ~ ~");
format(string, sizeof(string),"..?(%d) %s :��� ������ �� �����",id, GetName(id));
SendClientMessageToAll(COLOR_PINK, string);
SendClientMessageToAll(COLOR_PINK, ".$�� ����� ����, ���� 600");
SendClientMessageToAll(0x0E67AFF, "/Ans [Answer] :�� ��� ����� �� ������");
SendClientMessageToAll(COLOR_WHITE, "~ ~ ~ ~ ~ ~ [T]--[Trivia | �������] ~ ~ ~ ~ ~ ~");
fnm
MaxAns[i] = 0;
TriviaOn = 1;
AnsTrivia1 = PlayerInfo[id][Kills];
}
return 1;
}

if(strcmp(cmd,"/triviahelp",true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE, "~ ~ ~ ~ ~ ~ [Trivia Help || ���� �������] ~ ~ ~ ~ ~ ~");
SendClientMessage(playerid,COLOR_PINK, "/TriviaMP ����: ��� ����� �� ����");
SendClientMessage(playerid,COLOR_PINK, "/TriviaKills [playerid] :����: ������");
SendClientMessage(playerid,COLOR_PINK, "/TriviaHM [playerid] :����: ��� ��� �� �� �����");
SendClientMessage(playerid,COLOR_PINK, "/TriviaLevel [playerid] :����: �� ���� �� �����");
SendClientMessage(playerid,COLOR_PINK, "/TriviaBank [playerid] :����: �� ��� ���� �� �����");
SendClientMessage(playerid,COLOR_PINK, "/TriviaViP [playerid] :����: �� ���� ���� �� ���� ������");
SendClientMessage(playerid,COLOR_PINK, "/TriviaWar [playerid] :����: ��� ������� ����� �� ����� ������");
SendClientMessage(playerid,COLOR_PINK, "/Triviatos [playerid] :����: ��� ����� ���� ������ ��� ����");
return 1;
}

if(strcmp(cmd,"/triviatos",true) == 0)
{
if (PlayerInfo[playerid][AdminsLevel] < 10) return 0;
tmp = strtok(cmdtext, idx);
new id = ReturnID(tmp);
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, red, "Invalid PlayerID.");

SendClientMessageToAll(COLOR_WHITE, "~ ~ ~ ~ ~ ~ [T]--[Trivia | �������] ~ ~ ~ ~ ~ ~");
format(string, sizeof(string),"..?(%d) %s :��� ����� ��� ���� �����",id, GetName(id));
SendClientMessageToAll(COLOR_PINK, string);
SendClientMessageToAll(COLOR_PINK, ".$�� ����� ����, ���� 600");
SendClientMessageToAll(0x0E67AFF, "/Ans [Answer] :�� ��� ����� �� ������");
SendClientMessageToAll(COLOR_WHITE, "~ ~ ~ ~ ~ ~ [T]--[Trivia | �������] ~ ~ ~ ~ ~ ~");
fnm
MaxAns[i] = 0;
TriviaOn = 1;
AnsTrivia1 = PlayerInfo[id][TimeOnServer];
}
return 1;
}


if(strcmp(cmd,"/ans",true) == 0)
{
if(TriviaOn == 0) return SendClientMessage(playerid,red,".��� ������� ���� ����");
if(MaxAns[playerid] == 3) return SendClientMessage(playerid,red,".������ ���� ���� ����� ��������� �����, ��� �������� ����");
tmp2 = strtok(cmdtext, idx);
if(!strlen(tmp2)) return SendClientMessage(playerid, COLOR_WHITE, "/ans [Answer] :���� �����");
if(strval(tmp2) == AnsTrivia1)
{
SendClientMessageToAll(COLOR_WHITE, "~ ~ ~ ~ ~ ~ [A]--[Trivia | �������] ~ ~ ~ ~ ~ ~");
format(string, sizeof(string),".��� �� ����� ����  %s :�����/��",GetName(playerid));
SendClientMessageToAll(COLOR_PINK, string);
SendClientMessageToAll(COLOR_PINK, ".$�����/�� ���� ���� ��: 600");
format(string, sizeof(string),".%d :������ �����",AnsTrivia1);
SendClientMessageToAll(0x096E7FF, string);
SendClientMessageToAll(COLOR_WHITE, "~ ~ ~ ~ ~ ~ [A]--[Trivia | �������] ~ ~ ~ ~ ~ ~");
LACY_GiveMoney(playerid,600);
AnsTrivia1 = 12312;
TriviaOn = 0;
return 1;
}
SendClientMessage(playerid,red,".����, ��� ����");
MaxAns[playerid] ++;
return 1;
}
    if(strcmp(cmd,"/Warnings",true) == 0)
    {
    
        if (PlayerInfo[playerid][AdminsLevel] >= 10)
{

tmp = strtok(cmdtext, idx);
new id = ReturnID(tmp);
if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /Warnings [playerid] [1]");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_BLUE, "������ ����� ���� ����");
//if(id == playerid) return SendClientMessage(playerid,WHITE,"��� �� ���� ��� ����� �����.");
if(PlayerInfo[id][AdminsLevel] > PlayerInfo[id][AdminsLevel]) return SendClientMessage(playerid,COLOR_WHITE,"��� �� ���� ��� ����� ������ ���� ���� ���� ���");
PlayerInfo[id][Warnings] ++;

SendClientMessage(id,red,".���� ����� �10 ������ ����� �����");
format(string, sizeof(string), "%d/10 :������", PlayerInfo[id][Warnings]),SendClientMessage(id,red, string);
format(string, sizeof(string), "%d/10 :������ �� ����� ����� �� ���� ", PlayerInfo[id][Warnings]),SendClientMessage(playerid,red, string);
}
else
{
}
		return 1;
    }
//    }


    if(strcmp(cmd,"/setdeaths",true) == 0)
    {
        if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid,red,". ��� �� �����");
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
if(cancelpm[playerid] ==1) return SendClientMessage(playerid,red,"[BlockPms Error] ��� ���� �� ������� ������ ! ");
cancelpm[playerid] =1;
SendClientMessage(playerid,red,"[BlockPms] ���� �� ������� ������ ��� ! ��� �� ���� ����� �� ������");
return 1;
}
if(strcmp(cmd, "/backpm", true) == 0)
{
if(cancelpm[playerid] ==0) return SendClientMessage(playerid,red,"[BlockPms Error] /cancelpm ������� ������ ��� �� ����� ������");
cancelpm[playerid] =0;
SendClientMessage(playerid,COLOR_PURPLE,"[BlockPms] .����� �� ������� ����� �� ������ ������");
return 1;
}
if(strcmp(cmd, "/exports", true) == 0)
{
if(!CPS_IsPlayerInCheckpoint(playerid,Wang)) return SendClientMessage(playerid,COLOR_WHITE,".��� ���� ����� ��'� ����� �� ���� ����� �� ��� ����� ���");

SellWangExportVehicle(playerid);
return 1;
}
if(strcmp(cmd, "/buyfast", true) == 0)
{
if(aDoing[playerid] >= 1) return SendClientMessage(playerid,red,".��� ���� ���� ����� ����� ��� ���");
aDoing[playerid] ++;
new Roy_Killer[256];
Roy_Killer= strtok(cmdtext, idx);
if(!strlen(Roy_Killer))
{
SendClientMessage(playerid,WHITE,".--- help buy fast in all map (38) ����� ����� ���� ����� ��� ���� ���� ---");
SendClientMessage(playerid,COLOR_PINK,"* - /buyfast [action]");
SendClientMessage(playerid,COLOR_PINK,"* - /buyfast armour ���");
SendClientMessage(playerid,COLOR_PINK,"* - /buyfast hp ����");
SendClientMessage(playerid,COLOR_PINK,"* - /buyfast sw �� ����� �� �����");
return 1;
}

if(strcmp(Roy_Killer,"armour",true) == 0)
{
RK_SA(playerid,100.0,2000,"[/BuyFast] ��� ��� ��� ����� ������ ��� ���� ����",COLOR_ORANGE);
return 1;
}
else if(strcmp(Roy_Killer,"hp",true) == 0)
{
RK_HP(playerid,100.0,1500,"[/BuyFast] ��� ��� ��� ����� ������ ��� ���� ����",COLOR_ORANGE);
return 1;
}
else if(strcmp(Roy_Killer,"sw",true) == 0)
{
RK_GiveSetWeapons(playerid,26,200,32,300,23,100,6000);
return 1;
}
return 1;
}

if(strcmp(cmd, "/sawsssadqwdn", true) == 0)
{
new Roy_Killer[256];
Roy_Killer= strtok(cmdtext, idx);
if(!strlen(Roy_Killer))
{

SendClientMessage(playerid,COLOR_WHITE,"/sawn [action] :���� �����");
SendClientMessage(playerid,COLOR_WHITE,"/sawn open - ����� ��� ����");
SendClientMessage(playerid,COLOR_WHITE,"/sawn join - ����� �����");
SendClientMessage(playerid,COLOR_WHITE,"/kill - �� ��� ���� ���� ����");
return 1;
}
if(strcmp(Roy_Killer,"open",true) == 0)
{
if(SawnOn == 1 || SawnOn == 2) return SendClientMessage(playerid,red,".�� ��� ��� ���� ����, ��� ���� �����");
//new string[256];
format(string, sizeof(string),"[Sawn Champoins]: /sawn join .��� ��� ����, �� ��� ������� ,%s", GetName(playerid));
SendClientMessageToAll(COLOR_ORANGE,string);
SawnOn = 1;
playerid = TheOpenSawn;
SetTimer("SawnCanel",30*60*1000,0);
return 1;
}
if(strcmp(Roy_Killer,"join",true) == 0)
{
if(SawnIn[playerid] == 1) return SendClientMessage(playerid,red,".��� ��� �����/����� ��� ���� ��� ������");
if(playerid == TheJoinSawn) return SendClientMessage(playerid,red,".��� ������ ��� ���� ����");
if(playerid == TheOpenSawn) return SendClientMessage(playerid,red,".��� ���� �� ���� ����, ��� �� ���� ������ ���� �� ����");
if(SawnOn == 2) return SendClientMessage(playerid,red,".���� ���� ��� ���");
if(SawnOn == 0) return SendClientMessage(playerid,red,".��� ��� ���� ���� ���");
SawnOn = 2;
SawnIn[playerid] =1;
SawnIn[TheOpenSawn] =1;
playerid = TheJoinSawn;
//new string[256];
format(string, sizeof(string),"[Sawn Champions]: .����� ���� ����, ������ ����� ,%s", GetName(playerid));
SendClientMessageToAll(COLOR_ORANGE,string);
TogglePlayerControllable(playerid,1);
TogglePlayerControllable(TheOpenSawn,1);
TheSawnStarted = 1;
GameTextForPlayer(TheOpenSawn,"~y~~h~[]The Sawn Champions Started~y~~h~[]",3000,5);
GameTextForPlayer(TheJoinSawn,"~y~~h~[]The Sawn Champions Started~y~~h~[]",3000,5);
ResetPlayerWeapons(TheOpenSawn);
ResetPlayerWeapons(TheJoinSawn);
SetPlayerHealth(TheOpenSawn,100);
SetPlayerHealth(TheJoinSawn,100);
SetPlayerArmour(TheOpenSawn,100);
SetPlayerArmour(TheJoinSawn,100);
GivePlayerWeapon(TheOpenSawn,26,999999);
GivePlayerWeapon(TheJoinSawn,26,999999);
SetPlayerPos(TheJoinSawn,1051.5001,1529.2806,52.4050);
SetPlayerPos(TheOpenSawn,1146.8010,1529.4210,52.4155);
SetPlayerInterior(TheOpenSawn,0);
SetPlayerInterior(TheJoinSawn,0);

return 1;
}
return 1;
}
//=[Settings]=========================================================
if(strcmp(cmd, "/setting", true) == 0)
{
new Roy_Killer[256];
Roy_Killer= strtok(cmdtext, idx);
if(!strlen(Roy_Killer))
{

SendClientMessage(playerid,COLOR_WHITE,"USAGE: /setting [�� ������]");
SendClientMessage(playerid,COLOR_WHITE,"/setting autologin :������ ����� ������� ��� �����");
SendClientMessage(playerid,COLOR_WHITE,".����� ���� ��� ���� �������");
return 1;
}

if(strcmp(Roy_Killer,"autologin",true) == 0)
{
if(PlayerInfo[playerid][autologin] ==1) {
PlayerInfo[playerid][autologin] =0;

SendClientMessage(playerid,COLOR_BRIGHTRED,"--- .������ �� ����� ��� ������ ��� ---");
return 1;
}
if(PlayerInfo[playerid][autologin] ==0){
SendClientMessage(playerid, COLOR_LIGHTBLUE, "--- .������ ����� ��� ������ ��� ---");
PlayerInfo[playerid][autologin] =1;
return 1;
}
}

return 1;
}
//=[Drifts]=======================================================
if(strcmp(cmd, "/Drift", true) == 0)
{
new Roy_Killer[256];
Roy_Killer= strtok(cmdtext, idx);
if(!strlen(Roy_Killer))
{

SendClientMessage(playerid,COLOR_WHITE,"/drift [action] :���� �����");
SendClientMessage(playerid,COLOR_WHITE,"/drift invite [playerid] - ����� ������");
SendClientMessage(playerid,COLOR_WHITE,"/drift accept [playerid invited] - ����� ����� ������");
SendClientMessage(playerid,COLOR_WHITE,"/drift cancel - ����� ����� ������");
SendClientMessage(playerid,COLOR_WHITE,"/drift quit - ����� ������ �����");

return 1;
}
if(strcmp(Roy_Killer,"help",true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,"/drift [action] :���� �����");
SendClientMessage(playerid,COLOR_WHITE,"/drift invite [playerid] - ����� ������");
SendClientMessage(playerid,COLOR_WHITE,"/drift accept [playerid invited] - ����� ����� ������");
SendClientMessage(playerid,COLOR_WHITE,"/drift cancel - ����� ����� ������");
SendClientMessage(playerid,COLOR_WHITE,"/drift quit - ����� ������ �����");
return 1;
}

if(strcmp(Roy_Killer,"invite",true) == 0)
{
tmp = strtok(cmdtext, idx);
new id = ReturnID(tmp);
if(DriftNoNow == 1) return SendClientMessage(playerid,red,".����� ������ ���� ����, ��� ���� ���� ������");
if(id == playerid) return SendClientMessage(playerid,red,".��� �� ���� ������ �� ���� ������ �����");
if(GetPlayerMoney(playerid) <  3000) return  SendClientMessage(playerid,RED,".��� �� ����� ��� �� ��� ������ ������ ����� ������ ����, ��� ���� ����� 3000 ���� �� ��� ������");
if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_WHITE, "/drift invite [playerid] :���� �����");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, red, ".����� ����");
if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,RED,".���� ����� ����");
driftwinner[playerid] = 3000;
driftwinner[id] = 3000;
DriftInvite[id] = playerid;
IfInvite[playerid] = 1;
IfInvite[id] = 1;
DriftNoNow =1;
PrivateCP[id] = 0;
PrivateCP[playerid] =0;
format(string,sizeof(string),".%d������ ����� ���� �� ���� �� ,%s ���� ����� �",driftwinner,GetName(id));
SendClientMessage(playerid,COLOR_LIGHTGREEN,string);
format(string,sizeof(string),".%d������ ����� ���� �� ���� �� ,%s����� ����� �",driftwinner,GetName(playerid));
SendClientMessage(id,COLOR_LIGHTGREEN,string);
format(string,sizeof(string),"[ID Invite %d] /drift help :����� ���� ���/� ������",playerid);
SendClientMessage(id,0xF6F658FF,string);
new vehicleid = GetPlayerVehicleID(playerid);
SetVehiclePos(vehicleid,2320.9492,1393.6464,42.5266);
SetVehicleZAngle(vehicleid,359.9852);
SetTimerEx("CancelDrift",30*1000,0,"i",playerid);
TogglePlayerControllable(playerid, 0);
return 1;
}
if(strcmp(Roy_Killer,"cancel",true) == 0)
{
if(indrift[playerid] == 1) return SendClientMessage(playerid,red,"/drift quit - .������ ��� ���, ��� ���� ������� ����� ������");
if(IfInvite[playerid] == 0) return SendClientMessage(playerid,red,".�� ������ ���� ����� �����");
for(new Drifter=0; Drifter<MAX_PLAYERS; Drifter++)
{
if(IfInvite[Drifter] == 1 && DriftNoNow == 1)
{
driftwinner[Drifter]=0;
DriftInvite[Drifter] =0;
IfInvite[Drifter] =0;
indrift[Drifter] =0;
DriftNoNow = 0;
format(string,sizeof(string),".���� �� ������ ������ ������,%s",GetName(playerid));
SendClientMessage(Drifter,COLOR_LIGHTGREEN,string);
format(string,sizeof(string),".������ ,%s ����� �� ������ ����� ��� ���",GetName(Drifter));
SendClientMessage(playerid,COLOR_LIGHTGREEN,string);
}
}
return 1;
}
if(strcmp(Roy_Killer,"quit",true) == 0)
{
if(indrift[playerid] == 0)return SendClientMessage(playerid,red,".��� �� ���� ���� �����");
OutDrift(playerid);
return 1;
}

if(strcmp(Roy_Killer,"accept",true) == 0)
{
tmp2 = strtok(cmdtext, idx);
new id = ReturnID(tmp2);
if(!IsPlayerConnected(id)) return SendClientMessage(playerid, red, ".����� ����");
if(indrift[playerid] == 1) return SendClientMessage(playerid,red,".��� ����� ����� �� ��� ����� ��� �����");
if(IfInvite[playerid] == 0)return SendClientMessage(playerid,red,".��� �� ������ ������ �����");
if(id != DriftInvite[playerid]) return SendClientMessage(playerid,red, ".���� �� �� ����� ���� ������");
if(!(IsPlayerInAnyVehicle(playerid))) return SendClientMessage(playerid,RED,".���� ����� ����");
if(GetPlayerMoney(playerid) <  driftwinner[playerid])
{
SendClientMessage(playerid,RED,".��� �� ����� ��� �� ��� ������ ������ ����� ������ ����, ��� ���� ����� 3000 ���� �� ��� ������");
driftwinner[playerid] = 0;
driftwinner[id] = 0;
DriftInvite[id] = 0;
IfInvite[playerid] = 0;
IfInvite[id] = 0;
DriftNoNow =0;
PrivateCP[id] = 0;
PrivateCP[playerid] =0;
SendClientMessage(id,red,".������ ���� ����: ���� ��� ����� ������");
SendClientMessage(id,red,".��� �� ����� ��� �� ��� ���� �� ������ �����, ��� ����");
return 1;
}
new vehicleid = GetPlayerVehicleID(playerid);
SetVehiclePos(vehicleid,2332.2026,1393.6437,42.5268);
SetVehicleZAngle(vehicleid,359.9852);
format(string,sizeof(string),".%s ���� ���� ������ ����� ��� ��",GetName(DriftInvite[playerid]));
SendClientMessage(playerid,COLOR_LIGHTGREEN,string);
format(string,sizeof(string),".%s ���� ���� ������ ����� ��� ��",GetName(playerid));
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
if(!strlen(Roy_Killer))
{
SendClientMessage(playerid, COLOR_WHITE, "/Commands [1/2/all] :���� �����");

return 1;
}


//----------------------
if(strcmp(Roy_Killer,"1",true) == 0)
{

SendClientMessage(playerid,COLOR_WHITE,".---- (1) ��� ������ ���� ---- ");
SendClientMessage(playerid, COLOR_PINK,"* - /kill - ���� ����");
SendClientMessage(playerid, COLOR_PINK,"* - /AFK - ����� ���� ���");
SendClientMessage(playerid, COLOR_PINK,"* - /UNAFK - ����� ���� ���");
SendClientMessage(playerid, COLOR_PINK,"* - /nextlevel - ���� ���� ���");
SendClientMessage(playerid, COLOR_PINK,"* - /stats - ����� ���");
SendClientMessage(playerid, COLOR_PINK,"* - /pstats [id] - ����� �� ������ ���");
SendClientMessage(playerid, COLOR_PINK,"* - /ignore - �� ��� ����� ����");
SendClientMessage(playerid, COLOR_PINK,"* - /unignore - �� ��� ������ ����� �����");
SendClientMessage(playerid, COLOR_PINK,"* - /showlevel [level] - �� ��� ����� ��� �� ������ �������");


}
else if(strcmp(Roy_Killer,"all",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--- help Commands (2) - ��� ������ ---");
SendClientMessage(playerid, COLOR_PINK,".���� ��� ������ ����� ������ ��� ���� �� ��� ���� ��������");
SendClientMessage(playerid, 0xF6F658FF,"/maxplayers /showid /bigbang [id] (4) /nextlevel");
SendClientMessage(playerid, 0xF6F658FF,"/sp (2) /lp /profile /pprofile [id] /stats /pstats [id]");
SendClientMessage(playerid, 0xF6F658FF,"/details /pdetails [id] /mypet /ppet [id] /pay [id] [money]");
SendClientMessage(playerid, 0xF6F658FF,"/kill /boome /td /setnick /setpass /saveskin /delskin");
SendClientMessage(playerid, 0xF6F658FF,"/ignore [id] /unignore /id(/s) [id/name] /showlevel");
SendClientMessage(playerid, 0xF6F658FF,"/commands [1/2/3/all] /vinfo /afk /unafk /me (2)");
}
else if(strcmp(Roy_Killer,"2",true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,".---- (2) ��� ������ ���� ---- ");
SendClientMessage(playerid, COLOR_PINK,"* - /pm [playerid] [message] - ������ ����� �����");
SendClientMessage(playerid, COLOR_PINK,"* - /pay [Playerid] [amount] - �� ��� ������ �����");
SendClientMessage(playerid, COLOR_PINK,"* - /call [id] ������ ����� /hangup ���� �����");
SendClientMessage(playerid, COLOR_PINK,"* - /maxplayers - ���� ����� ������");
SendClientMessage(playerid, COLOR_PINK,"* - /showid - ���� ������ ���� ��� ����� ����");
SendClientMessage(playerid, COLOR_PINK,"* - /sp (2) - ����� �����");
SendClientMessage(playerid, COLOR_PINK,"* - /lp (2) - ����� �����");
SendClientMessage(playerid, COLOR_PINK,"* - /id(/s) [id/name] - ������ ���� ���� / ��� ������");

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
SendClientMessage(playerid,0x0A11FF,"� � � � � � � � � � � � � � � � � � � � � � � � � � � � � �");
SendClientMessage(playerid, COLOR_PINK,"* - /sf :���� ����");
SendClientMessage(playerid, COLOR_PINK,"* - /ls :���� ������");
SendClientMessage(playerid, COLOR_PINK,"* - /lv :���� ����");
SendClientMessage(playerid, COLOR_PINK,"* - /ap :���� �����");
SendClientMessage(playerid, COLOR_PINK,"* - /race :������ ��������");
SendClientMessage(playerid, COLOR_PINK,"* - /ramp :����� ������");
SendClientMessage(playerid, COLOR_PINK,"* - /teleports 2 - .����� ������� ��� ���/� ������ ");
SendClientMessage(playerid,0x0A11FF,"� � � � � � � � � � � � � � � � � � � � � � � � � � � � � �");
}
else if(strcmp(Roy_Killer,"2",true) == 0)
{
SendClientMessage(playerid,0x0A11FF,"� � � � � � � � � � � � � � � � � � � � � � � � � � � � � �");
SendClientMessage(playerid, COLOR_PINK,"* - /dj ,/sandkings ������ ���'���");
SendClientMessage(playerid, COLOR_PINK,"* - /jump  ������ ������");
SendClientMessage(playerid, COLOR_PINK,"* - /army  ������� ������");
SendClientMessage(playerid, COLOR_PINK,"* - /carpark ����� ��������");
SendClientMessage(playerid, COLOR_PINK,"* - /ships ������ �����");
SendClientMessage(playerid, COLOR_PINK,"* - /cycletrip ������ �������");
SendClientMessage(playerid, COLOR_PINK,"* - /ShipMoney (3) ������ ������� ������ ���");
SendClientMessage(playerid, COLOR_PINK,"* - /teleports 3 - .����� ������� ��� ���/� ������ ");
SendClientMessage(playerid,0x0A11FF,"� � � � � � � � � � � � � � � � � � � � � � � � � � � � � �");
//SendClientMessage(playerid, 0x0A046FF," -- -- --");
}
else if(strcmp(Roy_Killer,"4",true) == 0)
{
//SendClientMessage(playerid, 0x0A046FF,"- - - ����� ������� ��' 4--");
SendClientMessage(playerid,0x0A11FF,"� � � � � � � � � � � � � � � � � � � � � � � � � � � � � �");
SendClientMessage(playerid, COLOR_PINK,"* - /spawn (5) ������ ����� ������");
SendClientMessage(playerid, COLOR_PINK,"* - /arena ������ ������� �� �������");
SendClientMessage(playerid, COLOR_PINK,"* - /skydive ������ ������ ");
SendClientMessage(playerid, COLOR_PINK,"* - /drag ������ �����");
SendClientMessage(playerid, COLOR_PINK,"* - /drifts ����� ������ ���");
SendClientMessage(playerid, COLOR_PINK,"* - /grage �����");
SendClientMessage(playerid, COLOR_PINK,"* - /teleports 5 - .����� ������� ��� ���/� ������ ");
SendClientMessage(playerid,0x0A11FF,"� � � � � � � � � � � � � � � � � � � � � � � � � � � � � �");
//SendClientMessage(playerid, 0x0A046FF," -- -- --");
}
else if(strcmp(Roy_Killer,"3",true) == 0)
{
//SendClientMessage(playerid, 0x0A046FF,"- - - ����� ������� ��' 3 --");
SendClientMessage(playerid,0x0A11FF,"� � � � � � � � � � � � � � � � � � � � � � � � � � � � � �");
SendClientMessage(playerid, COLOR_PINK,"* - /Infernus �������� �� ���� ����� �����");
SendClientMessage(playerid, COLOR_PINK,"* - /busstrip ������ ���������");
SendClientMessage(playerid, COLOR_PINK,"* - /bikestrip ������� ��������");
SendClientMessage(playerid, COLOR_PINK,"* - /fight ������ ��������");
SendClientMessage(playerid, COLOR_PINK,"* - /alp  ��� ������ �����");
SendClientMessage(playerid, COLOR_PINK,"* - /snipe  ����� ������");
SendClientMessage(playerid, COLOR_PINK,"* - /PePe  ���� �����");
SendClientMessage(playerid, COLOR_PINK,"* - /derby  ����� �������");
SendClientMessage(playerid, COLOR_PINK,"* - /teleports 4 - .����� ������� ��� ���/� ������ ");
SendClientMessage(playerid,0x0A11FF,"� � � � � � � � � � � � � � � � � � � � � � � � � � � � � �");
}
else if(strcmp(Roy_Killer,"5",true) == 0)
{


//SendClientMessage(playerid, 0x0A046FF,"- - - ����� ������� ��' 5 --");
SendClientMessage(playerid,0x0A11FF,"� � � � � � � � � � � � � � � � � � � � � � � � � � � � � �");
SendClientMessage(playerid, COLOR_PINK,"* - /kickstart ������ ������");
SendClientMessage(playerid, COLOR_PINK,"* - /lc (1) ������ �������");
SendClientMessage(playerid, COLOR_PINK,"* - /ammu  ����� �����");
SendClientMessage(playerid, COLOR_PINK,"* - /bank ����");
SendClientMessage(playerid, COLOR_PINK,"* - /parkour (4) ������ �������");
SendClientMessage(playerid, COLOR_PINK,"* - /bazooka (10)   ������ �������");
SendClientMessage(playerid,0x0A11FF,"� � � � � � � � � � � � � � � � � � � � � � � � � � � � � �");
//SendClientMessage(playerid, COLOR_WHITE,"--- ��� ������ ������� ���/� ---");

}


if(strcmp(Roy_Killer,"all",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--- help Teleport (1) - ��� ������� ---");
SendClientMessage(playerid, COLOR_PINK,".��� ������� ���� ���� ���� ����� ����� ����� ����� ������ ������� ����� ������� ��� ����");
SendClientMessage(playerid, 0xF6F658FF,"/sf /lv /ls /ap /race /ramp");
SendClientMessage(playerid, 0xF6F658FF,"/dj /sandkings /jump /army /carpark /cycletrip");
SendClientMessage(playerid, 0xF6F658FF,"/spawn (5) /arena /skydive /drifts  /grage");
SendClientMessage(playerid, 0xF6F658FF,"/infernus /busstrip /bikestrip /fight /alp /snipe");
SendClientMessage(playerid, 0xF6F658FF,"/pepe /derby /kickstart /lc (1) /bank /parkour (4) /ammu");
SendClientMessage(playerid, 0xF6F658FF,"/bigwar  /mp5 (2) /m4 (3) /deagle /dm /bazooka (10)");
SendClientMessage(playerid, 0xF6F658FF,"/teleports [1/2/3/4/5/all] /ship /shipmoney (3) /ships /bazooka (10)");
}
return 1;
}


//===============================MonsterStart CoMonsterNoTeleportionand=================================
if(!strcmp(cmd, "/startMonster", true)) {
tmp = strtok(cmdtext, idx);

if (PlayerInfo[playerid][AdminsLevel] < 10) return 0;

if(MonsterOn == 1) return SendClientMessage(playerid, red, ".�� ��� ���� ���� ");
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
if(MoOn == 1) return SendClientMessage(playerid, red, ".����� ��� �����, ��� ��� ���� ");
if(MonsterPlayers == 30) return SendClientMessage(playerid, red, ".�� ������� �����, ��� ��� ���");
if(iNmOnster[playerid] == 1) return SendClientMessage(playerid, red, ".������ ��� �����, ��� �������");
MonsterPlayers ++; iNmOnster[playerid] = 1;
MoneyWinnerMonster +=500;
LACY_GiveMoney(playerid,-500);
format(string,sizeof(string),".%d :���� �����/� ����",MonsterPlayers);
SendClientMessage(playerid,0xE21E1EFF,string);
format(string,sizeof(string),".��� ����� ����, ����� ������ ������� ������");
SendClientMessage(playerid,0xE21E1EFF,string);


TogglePlayerControllable(playerid, 0);
SetPlayerInterior(playerid,15);

if(MonsterPlayers==1)return MonsterSYSTEM[playerid] =CreateVehicle(444,-1281.1554, 994.8486, 1037.6104, 88.3429,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers== 2)return MonsterSYSTEM[playerid] = CreateVehicle(444,-1282.0687, 987.9168, 1037.5026, 80.9241 ,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==3)return MonsterSYSTEM[playerid] =CreateVehicle(444, -1281.3506, 1001.1743, 1037.7189, 96.1026 ,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==4)return MonsterSYSTEM[playerid] = CreateVehicle(444,-1282.8987, 1009.0059, 1037.8527, 107.3637,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==5)return MonsterSYSTEM[playerid] = CreateVehicle(444,-1286.0485, 1015.5355, 1037.9691, 116.0817 ,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==6)return MonsterSYSTEM[playerid] = CreateVehicle(444, -1505.6598, 1021.6973, 1038.4505, 227.5877 ,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==7)return MonsterSYSTEM[playerid] = CreateVehicle(444, -1495.2828, 1032.7757, 1038.6156, 220.4797 ,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==8)return MonsterSYSTEM[playerid] = CreateVehicle(444,-1281.1554, 994.8486, 1037.6104, 88.3429,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==9)return MonsterSYSTEM[playerid] = CreateVehicle(444, -1286.3497, 975.3618, 1037.3009, 58.5153  ,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==10)return MonsterSYSTEM[playerid] = CreateVehicle(444, -1290.1001, 969.6478, 1037.2069, 57.164 ,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==11)return MonsterSYSTEM[playerid] = CreateVehicle(444,-1294.9491, 1027.7661, 1038.1846, 138.9463,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==12)return MonsterSYSTEM[playerid] = CreateVehicle(444, -1294.0604, 964.0651, 1037.1164, 47.944 ,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==13)return MonsterSYSTEM[playerid] = CreateVehicle(444,-1298.9483, 959.2191, 1037.0499, 39.9045,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==14)return MonsterSYSTEM[playerid] = CreateVehicle(444,-1304.2948, 955.2288, 1036.991, 35.7058,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==15)return MonsterSYSTEM[playerid] = CreateVehicle(444,-1500.9487, 1027.1394, 1038.5323, 228.9902,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==16)return MonsterSYSTEM[playerid] = CreateVehicle(444,-1514.8537, 993.9699, 1038.012, 272.7786,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==17)return MonsterSYSTEM[playerid] = CreateVehicle(444,-1482.4313, 1041.9403, 1038.7481, 210.1206,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==18)return MonsterSYSTEM[playerid] = CreateVehicle(444,-1511.5805, 979.0001, 1037.7557, 289.6034,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==19)return MonsterSYSTEM[playerid] = CreateVehicle(444, -1508.5096, 971.9116, 1037.6334, 301.1151,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==20)return MonsterSYSTEM[playerid] = CreateVehicle(444, -1289.7208, 1021.0579, 1038.0678, 124.5565,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==21)return MonsterSYSTEM[playerid] = CreateVehicle(444, -1300.5868, 1032.2583, 1038.2734, 144.2774,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==22)return MonsterSYSTEM[playerid] = CreateVehicle(444,-1489.1873, 1037.6508, 1038.6903, 213.7796,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==23)return MonsterSYSTEM[playerid] = CreateVehicle(444, -1307.5302, 1036.6835, 1038.3592, 152.1656,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==24)return MonsterSYSTEM[playerid] = CreateVehicle(444, -1514.4672, 1001.7064, 1038.1322, 263.1411,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==25)return MonsterSYSTEM[playerid] = CreateVehicle(444,-1512.6346, 1008.9055, 1038.2487, 249.2474,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==26)return MonsterSYSTEM[playerid] = CreateVehicle(444,-1513.658, 986.5009, 1037.8825, 281.8439,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==27)return MonsterSYSTEM[playerid] = CreateVehicle(444,-1509.725, 1015.5227, 1038.3507, 243.3453,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==28)return MonsterSYSTEM[playerid] = CreateVehicle(444,-1503.3624, 965.1447, 1037.5095, 317.9805,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==29)return MonsterSYSTEM[playerid] = CreateVehicle(444,-1477.1889, 1044.7204, 1038.7884, 203.0258,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);
if(MonsterPlayers==30)return MonsterSYSTEM[playerid] = CreateVehicle(444, -1469.1869, 1047.9875, 1038.8229, 202.8518,-1,-1,50000),LinkVehicleToInterior(MonsterSYSTEM[playerid],15),PutPlayerInVehicle(playerid,MonsterSYSTEM[playerid],0);


return 1;
}
//===============================MonsterWL CoMonsterNoTeleportionand===================================
if(!strcmp(cmd, "/endMonster", true)) {
if (PlayerInfo[playerid][AdminsLevel] < 10) return 0;
if(MonsterOn == 0) return SendClientMessage(playerid, red, ".��� ���� ����");
GetPlayerName(playerid, Adminname, sizeof(Adminname));
MonsterCount = 0;
MonsterWL(2);
return 1; }

//=================================Spec CoMonsterNoTeleportionand=================================
if(!strcmp(cmdtext, "/xspecMonster off", true)) {
if (PlayerInfo[playerid][AdminsLevel] < 10) return 0;
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

if (PlayerInfo[playerid][AdminsLevel] < 10) return 0;

tmp = strtok(cmdtext, idx);

if(KartOn == 1) return SendClientMessage(playerid, red, ".�� ��� ������� ���� ");
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
if(KartOn == 0) return SendClientMessage(playerid, red, ".��� ������� ����");
if(KartPlayers == 10) return SendClientMessage(playerid, red, ".�� ������� �����");
if(KS == 1) return SendClientMessage(playerid, red, ".�������� ��� �����, ��� ��� ���� ");
if(InKart[playerid] == 1) return SendClientMessage(playerid, red, "��� ��� ����/�");
KartPlayers ++; InKart[playerid] = 1;

MoneyWinnerKart +=500;

format(string,sizeof(string),".%d :���� �����/� ����",KartPlayers);
SendClientMessage(playerid,0xE21E1EFF,string);
format(string,sizeof(string),".��� ����� ����, ����� ����� ������ ������");
SendClientMessage(playerid,0xE21E1EFF,string);
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
if(KartOn == 0) return SendClientMessage(playerid, red, ".��� ������� ����");
//if(KS == 1) return SendClientMessage(playerid, red, ".�������� ��� ����� ");
if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, red, ".��� �� ����� ");
SendClientMessage(playerid, 0x0C4E0FF, ".�������� ���� ������ ");
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

//===============================KartStart Command===============================
if(!strcmp(cmd, "/stria", true))
{
if (PlayerInfo[playerid][AdminsLevel] >= 10)
{
if(RunSystemon==1) return SendClientMessage(playerid,red,"��� �� ���� ������ �������� ��� ��� ��� �����");
StartRun();
RunSystemon =1;
format(kboobcha, sizeof(kboobcha), "~y~~H~[]/Tria~y~~H~[]");
GameTextForAll(kboobcha,3000,4);
SetTimer("UnFreezeTriatlon",60*1000,0);
}
else
{

}
return 1;
}


if(!strcmp(cmd, "/tria", true))
{
if(RunSystemend ==1) return SendClientMessage(playerid,red,".������ �������� ������");
if(RunSystemon ==0) return SendClientMessage(playerid,red,".��� ������ ���� �������� ����");
if(RunPlayers ==10) return SendClientMessage(playerid,red,".�� ������� ����� ������ �������� �����");
if(Registertrs[playerid] ==1) return SendClientMessage(playerid,red,".��� ��� ���� ������ ��������");

TogglePlayerControllable(playerid,0);
SetPlayerRaceCheckpoint(playerid, 2,835.5297,-1883.1307,12.8672,835.5297,-1883.1307,12.8672, 4);//CP2
CPTriatlon[playerid] =1;
RunPlayers ++;

format(string,sizeof(string),".%d :���� �����/� ����",RunPlayers);
SendClientMessage(playerid,0xE21E1EFF,string);
format(string,sizeof(string),".��� ����� ����, ����� ���� ��� ����� ��� ���� ��'� ������� �������");
SendClientMessage(playerid,0xE21E1EFF,string);

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
if (PlayerInfo[playerid][AdminsLevel] >= 10)
{
tmp = strtok(cmdtext, idx);
format(kboobcha, sizeof(kboobcha), "~y~~H~[]/Mini~y~~H~[]");
GameTextForAll(kboobcha,3000,4);
SetTimer("WarStartw",3000,0);
}
else
{

}
return 1;
}



if(!strcmp(cmd,"/mini", true))
{
if(WarOnw == 0) return SendClientMessage(playerid, red, "��� ���� ������� ����");
if(WSw == 1) return SendClientMessage(playerid, red, ".������ ��� �����");
if(WarPlayersw == sizeof(sssaw)) return SendClientMessage(playerid, red, ".�� ������� ����� ��� ��� ����");
if(InWarw[playerid] == 1) return SendClientMessage(playerid, red, "��� ���� ������� ����, ����.");
GetPlayerName(playerid, playernamew, sizeof(playernamew));
WarPlayersw ++; InWarw[playerid] = 1;
GetPlayerName(playerid, playernamew, sizeof(playernamew));
MoneyWinnerMini +=500;

format(string,sizeof(string),".%d :���� �����/� ����",WarPlayersw);
SendClientMessage(playerid,0xE21E1EFF,string);
format(string,sizeof(string),".��� ����� ����, ����� ����� �� �������� ������");
SendClientMessage(playerid,0xE21E1EFF,string);

return 1;
}

if(!strcmp(cmd, "/Miniend", true))
{
if(WarOnw== 0) return SendClientMessage(playerid, red, ".��� ����� ����� �����");
if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, red, ".��� �� ����� ");
SendClientMessage(playerid, 0x0C4E0FF, "������ ����� ������ ");
GetPlayerName(playerid, Adminnamew, sizeof(Adminnamew));
Countw = 0;
WarEndw(2);
return 1;
}









if(!strcmp(cmd, "/mypet", true))
{
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,red,"./help pets - ����/�� ����� ��� �������� ��� ����� �� ������ ����");
format(string, sizeof(string), ".-- %s ����� ��� -- ",GetName(playerid)),SendClientMessage(playerid, COLOR_WHITE, string);
if(PlayerInfo[playerid][Tor] ==1) { format(string, sizeof(string), "tor total kills: %d. ",PlayerInfo[playerid][TorKills]),SendClientMessage(playerid, COLOR_LIGHTBLUE, string),SendClientMessage(playerid,COLOR_GREY,".��");}
if(PlayerInfo[playerid][Shark] ==1) { format(string, sizeof(string), "shark total kills: %d.",PlayerInfo[playerid][SharkKills]),SendClientMessage(playerid, COLOR_LIGHTBLUE, string),SendClientMessage(playerid,COLOR_GREY,".����");}
if(PlayerInfo[playerid][Dolp] ==1) { format(string, sizeof(string), "dolphin total kills: %d.",PlayerInfo[playerid][DolphinKills]),SendClientMessage(playerid, COLOR_LIGHTBLUE, string),SendClientMessage(playerid,COLOR_GREY,".������");}

return 1;
}

if(!strcmp(cmd, "/ppet", true))
{
new sid[256], id;
sid = strtok(cmdtext,idx);

id = ReturnID(sid);
if(!IsPlayerConnected(id)) return SendClientMessage(playerid,red,".����� ����� ����� ����");
if(PlayerInfo[id][Pets] ==0) return SendClientMessage(playerid,red,".���� �� ���� ����� ����� ����");
format(string, sizeof(string), ".-- %s`s ����� ���� �� -- ",GetName(id)),SendClientMessage(playerid, COLOR_WHITE, string);
if(PlayerInfo[id][Tor] ==1) {
format(string, sizeof(string), "tor total kills: %d.",PlayerInfo[id][TorKills]),SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
SendClientMessage(playerid,COLOR_GREY,".��");
}
if(PlayerInfo[id][Shark] ==1) {
format(string, sizeof(string), "shark total kills: %d.",PlayerInfo[id][SharkKills]),SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
SendClientMessage(playerid,COLOR_GREY,".����");
}
if(PlayerInfo[id][Dolp] ==1) {
format(string, sizeof(string), "dolphin total kills: %d.",PlayerInfo[id][DolphinKills]),SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
SendClientMessage(playerid,COLOR_GREY,".������");
}
return 1;
}
if(strcmp(cmd, "/Roy", true) == 0) return SendClientMessage(playerid, 0x0C4E0FF, ".����� ?! ��� ��� ����� ���� ��� ���");
if(strcmp(cmd, "/barak", true) == 0) return SendClientMessage(playerid, 0x0C4E0FF, ".!��� ?! ��� ���� ��� �����! ��� �� ����� ����� ������ ����");


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
SendClientMessage(playerid, 0xF6F658FF, ".��� ���� ����� ��'� ����� ���� ����� ����� ");
return 1;
//	new property=999;
}
if(GetPlayerMoney(playerid) < propertyValues[property])
{
SendClientMessage(playerid, red, ".��� �� ����� ��� ���� ����� ��� �� ");
return 1;
}
if(propertyOwner[property]==playerid)
{
SendClientMessage(playerid, red, ".��� �� ��� ��� ");
return 1;
}

if(propertyOwner[property] < 999)
{
GetPlayerName(playerid, giveplayer, sizeof(giveplayer));
LACY_GiveMoney(propertyOwner[property], propertyValues[property]);
format (string, sizeof(string), ".%s ���� �� ��� ,%s ���� ��� ",propertyNames[property],giveplayer);
SendClientMessage(propertyOwner[property], red, string);
}
LACY_GiveMoney(playerid, 0-propertyValues[property]);
propertyOwner[property]=playerid;
format(string, sizeof(string), ".�����/� �� ��� ��� ������ ��� ����� ���,%s ��/� ���� �� ����", propertyNames[property]);
SendClientMessage(playerid, 0xF6F658FF, string);
}
else
{
SendClientMessage(playerid, COLOR_WHITE, ".��� ���� ����� ��'� ����� ���� ����� ��� ");
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
}SendClientMessage(playerid, 0xF6F658FF, "��� ����� ���� ����� �����");

return 1;}

// Idle Chat
if(strcmp(cmd, "/chat", true) == 0){
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT){
ApplyAnimation(playerid,"PED","IDLE_CHAT",4.1,0,1,1,1,1);

//SendClientMessage(playerid, 0xFF0000FF, "��� ���� �����"); // Chat

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


if(strcmp(cmd,"/id",true) == 0 || strcmp(cmd, "/s", true) == 0)
{
tmp = strtok(cmdtext, idx);
if(!strlen(tmp))
{
SendClientMessage(playerid,COLOR_WHITE,"/id(/s). [nick player/or half nick] :������ ��� ���� ����");
format(string,256,"Your ID: %d.",playerid);
SendClientMessage(playerid,0x16EB43FF,string);
return 1;
}
format(string,sizeof(string)," ``%s`` - ,������ ����",tmp);
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
	if(InCall[playerid] ==1) return SendClientMessage(playerid,COLOR_WHITE,"���� ���� ���� ����� ����� ����");
	    if(IsPlayerConnected(playerid))
		{
		if(InCall[playerid]==1)return SendClientMessage(playerid,WHITE,".��� ���� ��� ����� ���");
		if(CellState[playerid]==ESTA_LLAMANDO)return SendClientMessage(playerid,0x0F482FF, ".[/H,Hangup] ��� ����� ����� ����� ����");
		if(CellState[playerid]==LO_ESTAN_LLAMANDO)return SendClientMessage(playerid,0x0F482FF, ".[/Hangup]  ������ ���� [/Answer] ����� ���� ����� �����");
	
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
	    			SendClientMessage(playerid,red, ".���� �����");
	      			SetTimerEx("ColgarTelefonino",1200,0,"d",playerid);
	      			return 1;

			    }
if(Ignore[numTel][playerid] == 1)return SendClientMessage(playerid,COLOR_BRIGHTRED,"[IgnoreCall] !����� ���� ��� ���� ����� ���� ��� ����"),0;

			if (CellState[numTel]==LIBRE)
			{
			    CellState[numTel] = LO_ESTAN_LLAMANDO;
			    CellState[playerid] = ESTA_LLAMANDO;
			    AuxiliarTel[playerid] = numTel;
			    AuxiliarTel[numTel] = playerid;
				TimerLLamando[playerid]=SetTimerEx("Llamando",10*1000,true,"ii",playerid,numTel);
				TimerLLamando[numTel]=TimerLLamando[playerid];

				format(string, sizeof(string),"..%s ��� ����� ��",GetName(numTel));
				SendClientMessage(playerid,COLOR_LIGHTGREEN, string);
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
	if(strcmp(cmd, "/answer", true) == 0 || strcmp(cmd, "/a", true) == 0)
	{
        if(IsPlayerConnected(playerid))
		{
			if(CellState[playerid] != LO_ESTAN_LLAMANDO)
			{
				SendClientMessage(playerid, red, "..���� �� ����� ����");
				return 1;
			}
			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
			SendClientMessage(playerid,COLOR_LIGHTGREEN, ".`@`���� ����� ������, ��� ���� ���� �� ����� �� �");

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
		    SendClientMessage(playerid,red,".����� �� ������� ������");
			SendClientMessage(AuxiliarTel[playerid],red,".������ ����� �����, ����");
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
		    SendClientMessage(playerid,red,".����� �����");
		    SendClientMessage(AuxiliarTel[playerid],red,".����� �����");

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
	    		format(msg,sizeof(msg),"�$%d ���� �����",CellTime[playerid]*PRECIO_FICHA);
	    		LACY_GiveMoney(playerid,CellTime[playerid]*PRECIO_FICHA*-1);
				SendClientMessage(playerid,red,msg);
	    		ActualizarMemoriaSalida(playerid,AuxiliarTel[playerid]);
	    		ActualizarMemoriaEntrada(AuxiliarTel[playerid],playerid);
			}
			if  (TimerCaidaFicha[AuxiliarTel[playerid]]!=DEAD_TIMER_ID)
	    	{
	    		KillTimer(TimerCaidaFicha[AuxiliarTel[playerid]]);
	    		TimerCaidaFicha[AuxiliarTel[playerid]]=DEAD_TIMER_ID;
	    		new msg[255];
	    		format(msg,sizeof(msg),".$%d ����� ������ ���� ����" ,CellTime[AuxiliarTel[playerid]]*PRECIO_FICHA);
	    		LACY_GiveMoney(playerid,CellTime[AuxiliarTel[playerid]]*PRECIO_FICHA*-1);
	    		SendClientMessage(AuxiliarTel[playerid],red,msg);
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
format(string, sizeof(string), ".%d :������ ������ �� ����� ���� ����",PlayerInfo[playerid][aKillsnl]),SendClientMessage(playerid, 0xF6F658FF, string);
format(string, sizeof(string), ".%d :��� ����",PlayerInfo[playerid][aLevelnl]),SendClientMessage(playerid, 0xF6F658FF, string);
return 1;
}
#define STRING 256
if(strcmp(cmd, "/me", true) == 0)
{
if (PlayerInfo[playerid][Level] < 2) return Messagelevel (playerid, 2);
if(GetPlayerMoney(playerid) < 3000) return SendClientMessage(playerid,red,"* .��� ���� �3000 /me [action] - .��� �� ����� ��� �� ��� ���� �� ������ ");
if(antispam[playerid] ==1) return SendClientMessage(playerid,COLOR_BRIGHTRED,"[AntiSpam]  �� ����� ��� �� 2 �����!!!"),0;
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
format(string, sizeof(string), "* %s %s ", player, result);
SendClientMessageToAll(COLOR_PINK, string);
LACY_GiveMoney(playerid,-1500);
return 1;
}
//=[Shipermode]=====
if(strcmp(cmd, "/startship", true) == 0 && PlayerInfo[playerid][AdminsLevel] >= 10) return SetTimer("Shiper",1000,0);
if(strcmp(cmd, "/Dg", true) == 0 && PlayerInfo[playerid][AdminsLevel] >= 10) { MoveStreamObject(ship,  1863.307739, 1529.444336, 24.975296, 8.6);return 1; }

//=[SaveSkin]=====
if(!strcmp(cmd,"/saveskin",true))
{
PlayerInfo[playerid][SkinSavedId] = GetPlayerSkin(playerid);
SendClientMessage(playerid,COLOR_LIGHTGREEN," ����� ��� ���� ������");
PlayerInfo[playerid][SkinSaved] = 1, PlayerInfo[playerid][SaveSkin] = 1;
dini_IntSet(GetPlayerFile(playerid),"SkinSavedId",PlayerInfo[playerid][SkinSavedId]);
dini_IntSet(GetPlayerFile(playerid),"SaveSkin",PlayerInfo[playerid][SaveSkin]);
dini_IntSet(GetPlayerFile(playerid),"SkinSaved",PlayerInfo[playerid][SkinSaved]);
return 1;
}
//=[DelSkin]====
if(!strcmp(cmd,"/delskin",true))
{
if(!PlayerInfo[playerid][SkinSaved]) return SendClientMessage(playerid,red,".��� ��, ��� �� �� ���� ����");
PlayerInfo[playerid][SkinSaved] = 0;
dini_IntSet(GetPlayerFile(playerid),"SkinSaved",0);
PlayerInfo[playerid][SaveSkin] = 0;
dini_IntSet(GetPlayerFile(playerid),"SaveSkin",0);
SendClientMessage(playerid,COLOR_LIGHTGREEN," ����� ��� ���� ������ ");
return 1;
}






if(strcmp(cmd, "/pay", true) == 0) {
//
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid, 0xF6F658FF, "/pay [playerid] [amount]");

return 1;}

giveplayerid = strval(tmp);
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid, 0xF6F658FF, "/pay [playerid] [amount]");

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
format(string, sizeof(string), ". %s (id: %d), $%d ���� � ", giveplayer,giveplayerid, moneys);
SendClientMessage(playerid, 0x0C4E0FF, string);
format(string, sizeof(string), ". $%d ��� %s (id: %d) ����� �", moneys, sendername, playerid);
SendClientMessage(giveplayerid, 0x0C4E0FF, string);
printf("%s(playerid:%d) has transfered %d to %s(playerid:%d)",sendername, playerid, moneys, giveplayer, giveplayerid);}
else {
SendClientMessage(playerid, 0x0C4E0FF, "���� ����");
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








//
/*
if(strcmp(cmdtext, "/sail", true) == 0)
 {
if(Sailing[playerid] == true) return SendClientMessage(playerid, COLOR_BRIGHTRED, "��� ���� ����� ��� �� ������");
if(ShipTaken == 1) return SendClientMessage(playerid, COLOR_BRIGHTRED, "��� ���� ����� �� ������.");
if(!PlayerToPoint(3, playerid, 3324.2947, -1330.1631, 127.9517)) return SendClientMessage(playerid, COLOR_BRIGHTRED, "��� ���� ����� ����� ���� ������");
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
        SendClientMessage(playerid, COLOR_WHITE, ".-- ������ ����� ������ �������� --");
        SendClientMessage(playerid, COLOR_LIGHTBLUE, ".��� ��� �� ������ ��� �����");
        SendClientMessage(playerid, COLOR_LIGHTBLUE, ".����� �� ���� ��� �� ������ ������ ����� ������ ����");
        SendClientMessage(playerid, COLOR_LIGHTBLUE, "/sail :���� ����� ������ ��� ������");
        SendClientMessage(playerid, COLOR_LIGHTBLUE, "/exitship .���� ����� �� ������");
        SendClientMessage(playerid, 0xF6F658FF, "��� ���� ������ ������ ���� ����� �� ����� ������");
        SendClientMessage(playerid, COLOR_WHITE, "----------");
return 1;
}
*/






if(!strcmp(cmd,"/Boome",true) || !strcmp(cmd,"/bm",true))
{
if (PlayerInfo[playerid][Level] < 3) return Messagelevel (playerid, 3);
if(GetPlayerInterior(playerid) == 1 || GetPlayerInterior(playerid) == 6 || GetPlayerInterior(playerid) == 10) return SendClientMessage(playerid,0xFF0000AA,".��� �� ���� ����� ���� ���� ���� ���� �������");
if(ClickedBm[playerid] == 10) return SendClientMessage(playerid,red, ".��� �� ���� ����� ���� ���� �10 �����");
ClickedBm[playerid]  ++;
new Float:pos[3];
GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
CreateExplosion(pos[0],pos[1],pos[2],6,10);
return 1;
}
/*
SendClientMessage(playerid,0x0C4E0FF," ��� ������ 150 ������");
SendClientMessage(playerid,0x0C4E0FF," ��� ���� 300 ������");
SendClientMessage(playerid,0x0C4E0FF," ��� ������ 450 ������");
SendClientMessage(playerid,0x0C4E0FF," ��� ������ 600 ������");
SendClientMessage(playerid,0x0C4E0FF," ��� ������ 750 ������");
SendClientMessage(playerid,0x0C4E0FF," ��� ����� 900 ������");
SendClientMessage(playerid,0x0C4E0FF," ��� ������ 1050 ������");
SendClientMessage(playerid,0x0C4E0FF," ��� ������ 1200 ������");
SendClientMessage(playerid,0x0C4E0FF," ��� ������ 1350 ������");
SendClientMessage(playerid,0x0C4E0FF," ��� ������ 1500 ������");
*/





 

if(strcmp(cmd, "/gang", true) == 0)
{
new gangcmd, gangnum;
tmp = strtok(cmdtext, idx);
if(!strlen(tmp))
{
SendClientMessage(playerid, COLOR_WHITE, "����� ���: /gang [create/join/invite/quit] [name/number]");
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
SendClientMessage(playerid, COLOR_WHITE, "����� ��� /gang [create/join/invite/quit] [name/number]");
else if(gangcmd==1)
SendClientMessage(playerid, COLOR_WHITE, "���� ���: /gang [create] [name]");
else if(gangcmd==2)
SendClientMessage(playerid, COLOR_WHITE, "����� ���: /gang [invite] [playerID]");
return 1;
}

if(gangcmd==1)
{
if(playerGang[playerid]>0)
{
SendClientMessage(playerid, red, ".��� ��� ���� ���� ");
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
format(string, sizeof(string),".%s ���� ��� ��� ", gangNames[i], i);
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
SendClientMessage(playerid, red, ".��� ��� ���� ���� ��� ");
return 1;
}
if(gangInvite[playerid]==0)
{
SendClientMessage(playerid, red, ".�� ����� ����� ���� ");
return 1;
}
if(gangInfo[gangnum][0]==0)
{
SendClientMessage(playerid, red, "That gang does not exist!");
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
format(string, sizeof(string),".����� �� ���� ��� %s", sendername);
SendClientMessage(gangMembers[gangnum][j], COLOR_WHITE, string);
}
gangInfo[gangnum][1]++;
playerGang[playerid] = gangnum;
SetPlayerColor(playerid,gangInfo[gangnum][2]);
format(string, sizeof(string),".%s ������ ���� ", gangNames[gangnum], gangnum);
SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
return 1;
}
SendClientMessage(playerid, red, ".��� �� ��� ");
return 1;
}
else if (gangcmd==2)
{
giveplayerid = strval(tmp);
if(playerGang[playerid]==0)
{
SendClientMessage(playerid, red, ".��� �� ���� ��� ��� ");
return 1;
}

if(IsPlayerConnected(giveplayerid))
{
GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
GetPlayerName(playerid, sendername, sizeof(sendername));
format(string, sizeof(string),".������ ���� ��� %s ����� �� ", giveplayer);
SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
format(string, sizeof(string),".%s ����� ����� ���� ��� ", gangNames[playerGang[playerid]]);
SendClientMessage(giveplayerid, COLOR_LIGHTGREEN, string);
format(string, sizeof(string),".%s ������ ����� � ", sendername);
SendClientMessage(giveplayerid, COLOR_LIGHTGREEN, string);
gangInvite[giveplayerid]=playerGang[playerid];
}
else
SendClientMessage(playerid, red, "No such player exists!");
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
SendClientMessage(playerid, COLOR_WHITE, "USAGE: /ganginfo [����]");
return 1;
}
else if (!strlen(tmp))
gangnum = playerGang[playerid];
else
gangnum = strval(tmp);
if(gangInfo[gangnum][0]==0)
{
SendClientMessage(playerid, red, "No such gang exists!");
return 1;
}
format(string, sizeof(string),"'%s' ����� ����� (id: %d)", gangNames[gangnum], gangnum);
SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
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
SendClientMessage(playerid, COLOR_LIGHTGREEN, "Current Gangs:");
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
if (PlayerInfo[playerid][Level] < 4) return Messagelevel (playerid, 4);
if(!IsPlayerConnected(id)) return SendClientMessage(playerid,red,".����� ����� ����� ����");
if(GetPlayerInterior(id) == 1 || GetPlayerInterior(id) == 6 || GetPlayerInterior(id) == 10) return SendClientMessage(playerid,0xFF0000AA,".��� �� ���� ����� ���� ���� ���� ���� �������");
if(GetPlayerInterior(playerid) == 1 || GetPlayerInterior(playerid) == 6 || GetPlayerInterior(playerid) == 10) return SendClientMessage(playerid,0xFF0000AA,".��� �� ���� ����� ���� ���� ���� ���� �������");
if(GetPlayerMoney(playerid) < 3400) return SendClientMessage(playerid,RED,".����� ����� ���� ���� �3400 ����");
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
SendClientMessage(playerid, red, ".��� ���� ����� ���� ����� �� ��� ����� ����");
}


return 1;
}


//----------- [Pets System] ---------

if(strcmp(cmd, "/buytor", true) == 0)
{
if (PlayerInfo[playerid][Level] < 3) return Messagelevel (playerid, 3);

if(IsPlayerInAnyVehicle(playerid) ) return SendClientMessage(playerid,RED,".��� �� ����� ������ ����� ���");
if(PlayerInfo[playerid][Tor] ==1) return SendClientMessage(playerid,red,"/selltor �� �� ��� �� ������ ���");
if(GetPlayerMoney(playerid) < 400000) return SendClientMessage(playerid, red, ".��� ���� ����� �400000 ������ ��");
LACY_GiveMoney(playerid,-400000);
SendClientMessage(playerid,COLOR_WHITE,"./calltor ����� ��� ��� /help pets - ���� �� ������ , ������ ������");
PlayerInfo[playerid][Pets] =1;
PlayerInfo[playerid][Tor] =1;
return 1;
}

if(strcmp(cmd, "/selltor", true) == 0)
{
if(PlayerInfo[playerid][Tor] ==0) return SendClientMessage(playerid,red,".��� �� �� ����");
LACY_GiveMoney(playerid,30000);
DestroyStreamObject(sam44[playerid]);
SendClientMessage(playerid, COLOR_WHITE, ".���� �� ���� ��� ������");
PlayerInfo[playerid][Tor] =0;
PlayerInfo[playerid][Pets] =0;
return 1;
}

if(strcmp(cmd, "/calltor", true) == 0)
{
if(IsPlayerInAnyVehicle(playerid) ) return SendClientMessage(playerid,RED,".��� �� ����� ������ ����� ���");
if(ThePetsInYou[playerid] ==1) return SendClientMessage(playerid,red,"�� �� ��� ��� ���� ��� �� ���� ���� ����� ���� ���� 1");
if(PlayerInfo[playerid][Tor] ==0) return SendClientMessage(playerid,red,"��� �� �� ����");
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,red,"��� �� ��� ����");
if(GetPlayerMoney(playerid) < 500) return SendClientMessage(playerid, red, ".����� ���� ���� �500 ����");
LACY_GiveMoney(playerid,-500);
new Float:x,Float:y,Float:z;
sam44[playerid] = CreateStreamObject(1609, 2294.422363, 530.393738, 1.226355, 0.0000, 0.0000, 0.0000,40);
AttachStreamObjectToPlayer(sam44[playerid],playerid,x+3,y+3,z+0.6,0,0,0);
ThePetsInYou[playerid] =1;
TorYou[playerid] =1;
SendClientMessage(playerid, COLOR_WHITE,".--- ����� ����� ����� ����� �� ��� ��� ---");
SendClientMessage(playerid, COLOR_LIGHTBLUE, "����� �� ���� ��� ������ ����");
SendClientMessage(playerid, COLOR_LIGHTBLUE, "/backtor - ������ ���� ����� ��� ������");
SendClientMessage(playerid, COLOR_LIGHTBLUE, "/ator [id] - ������ �� ���� ���");
SendClientMessage(playerid, COLOR_WHITE,".----------");

return 1;
}

if(strcmp(cmd, "/backtor", true) == 0)
{
if(PlayerInfo[playerid][Tor] ==0) return SendClientMessage(playerid,red,"��� �� �� ����");
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,red,"��� �� ��� ����");
if(ThePetsInYou[playerid] ==0) return SendClientMessage(playerid,red,".���� �� ����");
SendClientMessage(playerid, COLOR_WHITE, "!����� �� ���� ��� ������ �����");
DestroyStreamObject(sam44[playerid]);
ThePetsInYou[playerid] =0;
TorYou[playerid] =0;
return 1;
}

if(strcmp(cmd, "/AirStrike", true) == 0)
{
new Roy_Killer[256];
Roy_Killer= strtok(cmdtext, idx);
if(!strlen(Roy_Killer))
{

SendClientMessage(playerid,COLOR_WHITE,"USAGE: /AirStrike [action]");
SendClientMessage(playerid,COLOR_WHITE,"/AirStrike save (3) - ����� ����� �� ����� �������");
SendClientMessage(playerid,COLOR_WHITE,"/AirStrike as1  (3) - .�� ��� ���� ����� ����� ���� �� 1 ���/� ������");
SendClientMessage(playerid,COLOR_WHITE,"/AirStrike as2  (5) - .�� ��� ���� ����� ����� ���� �� 2 ���/� ������");
SendClientMessage(playerid,COLOR_WHITE,"/AirStrike as3  (9) - .�� ��� ���� ����� ����� ���� �� 3 ���/� ������");
SendClientMessage(playerid,COLOR_WHITE,"/AirStrike lpas (3)  - .�� ��� ������ ������ ����� ������� ������ ��� �����");
return 1;
}

if(strcmp(Roy_Killer,"Save",true) == 0)
{
if(PlayerInfo[playerid][Level] < 3) return Messagelevel(playerid,3);
if(PlayerInfo[playerid][AirStrikeSaved] == 1) return SendClientMessage(playerid,red,"/AirStrike del - .����, �� ��� ����� ���� ���/� ������ AirStrike �� �� ��� �����");
if(InArea(playerid, 404.8684, 35.6969, 2102.7212, 1653.4156)) return SendClientMessage(playerid,red,".[AntiAirStrike] .��� ��, ���� ���� ����� ����� ����� ������� ����� �� ����");
if(InArea(playerid,-1867.1172 ,-2046.8510, 365.2502,189.3918)) return  SendClientMessage(playerid,red,".[AntiAirStrike] .��� ��, ���� ���� ����� ����� ����� ������� ����� �� ����");
if(InArea(playerid,2147.2263,1968.2661,904.0972,816.9983)) return SendClientMessage(playerid,red,".[AntiAirStrike] .��� ��, ���� ���� ����� ����� ����� ������� ����� �� ����");
if(InArea(playerid,-1053.7112,-1515.2965,560.0065,-740.4934)) return SendClientMessage(playerid,red,".[AntiAirStrike] .��� ��, ���� ���� ����� ����� ����� ������� ����� �� ����");
if(InArea(playerid,1985.0746,1858.3486,-1347.2802,-1464.8994)) return SendClientMessage(playerid,red,".[AntiAirStrike] .��� ��, ���� ���� ����� ����� ����� ������� ����� �� ����");
if(GetPlayerMoney(playerid) < 2000) return SendClientMessage(playerid,red,".���� �2000 ���� ���� �� AirStrike����� ����� ��");
if(GetPlayerInterior(playerid) == 1 || GetPlayerInterior(playerid) == 6 || GetPlayerInterior(playerid) == 10) return SendClientMessage(playerid,0xFF0000AA,".��� �� ���� ����� ����� ������� ���� �������");
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
SendClientMessage(playerid,red,".(AirStrike) ���� ������ ����� �� ����� �������");




return 1;
}
else if(strcmp(Roy_Killer,"as1",true) == 0)
{
if(PlayerInfo[playerid][Level] < 3) return Messagelevel(playerid,3);
if(AirStrikeInWar[playerid] == 1) return SendClientMessage(playerid,red,"��� ���� ����� ���� �� ������ ������. ����");
if(PlayerInfo[playerid][AirStrikeSaved] == 0) return SendClientMessage(playerid,red,".��� �� �� ����� ����� ������� ����");
if(GetPlayerMoney(playerid) < 10000) return SendClientMessage(playerid,red,".�� ��� ���� 1 ���� �10,000 ���� AirStrike����� �");
LACY_GiveMoney(playerid,-10000);
AirStrikeTil[playerid] = CreateStreamObject(354,airstrikex+300,airstrikey+300,airstriakez+300,0.0000, 0.0000, 0.0000,500);
MoveStreamObject(AirStrikeTil[playerid] ,PlayerInfo[playerid][xAirStrike],PlayerInfo[playerid][yAirStrike],PlayerInfo[playerid][zAirStrike],110);
Explodeion[playerid] = 1;
AirStrikeExplodes[playerid] = SetTimerEx("AirStrikeExplode",4900,1,"i",playerid);
SendClientMessage(playerid,COLOR_ORANGE,".����� ���� ��' �����, ��� ��� ������ ������ ���� AirStrike����� �");
AirStrikeInWar[playerid] = 1;
return 1;
}

else if(strcmp(Roy_Killer,"as2",true) == 0)
{
if(PlayerInfo[playerid][Level] < 5) return Messagelevel(playerid,5);
if(AirStrikeInWar[playerid] == 1) return SendClientMessage(playerid,red,"��� ���� ����� ���� �� ������ ������. ����");
if(PlayerInfo[playerid][AirStrikeSaved] == 0) return SendClientMessage(playerid,red,".��� �� �� ����� ����� ������� ����");
if(GetPlayerMoney(playerid) < 13000) return SendClientMessage(playerid,red,".�� ��� ���� 2 ���� �13,000 ���� AirStrike����� �");
LACY_GiveMoney(playerid,-13000);
AirStrikeTil[playerid] = CreateStreamObject(354,airstrikex+300,airstrikey+300,airstriakez+300,0.0000, 0.0000, 0.0000,500);
AirStrikeTil2[playerid] = CreateStreamObject(354,airstrikex+300,airstrikey+300,airstriakez+300,0.0000, 0.0000, 0.0000,500);
MoveStreamObject(AirStrikeTil[playerid] ,PlayerInfo[playerid][xAirStrike],PlayerInfo[playerid][yAirStrike],PlayerInfo[playerid][zAirStrike],110);
MoveStreamObject(AirStrikeTil2[playerid] ,PlayerInfo[playerid][xAirStrike],PlayerInfo[playerid][yAirStrike],PlayerInfo[playerid][zAirStrike],87);
Explodeion[playerid] = 2;
AirStrikeExplodes[playerid] = SetTimerEx("AirStrikeExplode",4900,1,"i",playerid);
SendClientMessage(playerid,COLOR_ORANGE,".����� ���� ��' �����, ��� ��� ������ ������ ���� AirStrike����� �");
AirStrikeInWar[playerid] = 1;
return 1;
}
else if(strcmp(Roy_Killer,"as3",true) == 0)
{
if(PlayerInfo[playerid][Level] < 9) return Messagelevel(playerid,9);
if(AirStrikeInWar[playerid] == 1) return SendClientMessage(playerid,red,"��� ���� ����� ���� �� ������ ������. ����");
if(PlayerInfo[playerid][AirStrikeSaved] == 0) return SendClientMessage(playerid,red,".��� �� �� ����� ����� ������� ����");
if(GetPlayerMoney(playerid) < 15000) return SendClientMessage(playerid,red,".��� 3 ���� �15,000 ���� AirStrike����� �");
LACY_GiveMoney(playerid,-15000);
AirStrikeTil[playerid] = CreateStreamObject(354,airstrikex+300,airstrikey+300,airstriakez+300,0.0000, 0.0000, 0.0000,500);
AirStrikeTil2[playerid] = CreateStreamObject(354,airstrikex+300,airstrikey+300,airstriakez+300,0.0000, 0.0000, 0.0000,500);
AirStrikeTil3[playerid] = CreateStreamObject(354,airstrikex+300,airstrikey+300,airstriakez+300,0.0000, 0.0000, 0.0000,500);
MoveStreamObject(AirStrikeTil[playerid] ,PlayerInfo[playerid][xAirStrike],PlayerInfo[playerid][yAirStrike],PlayerInfo[playerid][zAirStrike],110);
MoveStreamObject(AirStrikeTil2[playerid] ,PlayerInfo[playerid][xAirStrike],PlayerInfo[playerid][yAirStrike],PlayerInfo[playerid][zAirStrike],87);
MoveStreamObject(AirStrikeTil3[playerid] ,PlayerInfo[playerid][xAirStrike],PlayerInfo[playerid][yAirStrike],PlayerInfo[playerid][zAirStrike],66);
Explodeion[playerid] = 3;
AirStrikeExplodes[playerid] = SetTimerEx("AirStrikeExplode",4900,1,"i",playerid);
SendClientMessage(playerid,COLOR_ORANGE,".����� ���� ��' �����, ��� ��� ������ ������ ���� AirStrike����� �");
AirStrikeInWar[playerid] = 1;
return 1;
}
else if(strcmp(Roy_Killer,"del",true) == 0)
{
if(PlayerInfo[playerid][Level] < 3) return Messagelevel(playerid,3);
if(PlayerInfo[playerid][AirStrikeSaved] == 0) return SendClientMessage(playerid,red,".��� �� �� ����� ����� ������� ����");
PlayerInfo[playerid][xAirStrike] = 0.0;
PlayerInfo[playerid][yAirStrike] = 0.0;
PlayerInfo[playerid][zAirStrike] = 0.0;
PlayerInfo[playerid][AirStrikeSaved] = 0;
dini_IntSet(GetPlayerFile(playerid),"SaveStrika",0);
dini_FloatSet(GetPlayerFile(playerid),"xAir",PlayerInfo[playerid][xAirStrike]);
dini_FloatSet(GetPlayerFile(playerid),"yAir",PlayerInfo[playerid][yAirStrike]);
dini_FloatSet(GetPlayerFile(playerid),"zAir",PlayerInfo[playerid][zAirStrike]);
SendClientMessage(playerid,red,".������ AirStrike ���� �� �������� �� �");
return 1;
}
else if(strcmp(Roy_Killer,"lpas",true) == 0)
{
if(PlayerInfo[playerid][Level] < 3) return Messagelevel(playerid,3);
if(PlayerInfo[playerid][AirStrikeSaved] == 0) return SendClientMessage(playerid,red,".��� �� �� ����� ����� ������� ����");
if(GetPlayerMoney(playerid) < 600) return SendClientMessage(playerid,red,".���� �600 ���� AirStrike��� ��, ������� ������� �");
LACY_GiveMoney(playerid,-600);
SetPlayerPos(playerid,PlayerInfo[playerid][xAirStrike],PlayerInfo[playerid][yAirStrike],PlayerInfo[playerid][zAirStrike]);
SendClientMessage(playerid,red,".��� ������ AirStrike������ ������� �");
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

if(PetInWar[playerid] ==1) return SendClientMessage(playerid,red,"���� ��� ������ ��� ���� ���� ����� ���� ����� ����");
if(ThePetsInYou[playerid] ==0) return SendClientMessage(playerid,red,".���� �� ����");
if(PlayerInfo[playerid][Tor] ==0) return SendClientMessage(playerid,red,"��� �� �� ����");
if(TorYou[playerid] ==0) return SendClientMessage(playerid, red,".��� �� ���� ���� ���� ��� ��� ����");
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,red,"��� �� ��� ����");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid,red,".����� ����� ����� ����");
if(GetPlayerInterior(id) == 1 || GetPlayerInterior(id) == 6 || GetPlayerInterior(id) == 10) return SendClientMessage(playerid,0xFF0000AA,".��� �� ���� ����� ���� ���� ���� ���� �������");
if(GetPlayerInterior(playerid) == 1 || GetPlayerInterior(playerid) == 6 || GetPlayerInterior(playerid) == 10) return SendClientMessage(playerid,0xFF0000AA,".��� �� ���� ����� ���� ���� ���� ���� �������");
if(GetPlayerMoney(playerid) < 700) return SendClientMessage(playerid,RED,".����� �� ���� ��� ���� �700 ����");
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
format(string, sizeof(string), ".���� ���� ���� ���� ������ ���� ,%s �����",GetName(playerid)),SendClientMessage(id, COLOR_WHITE, string);
GetPlayerHealth(id,health);
LACY_GiveMoney(playerid,-200);
if(health2 < 1)
{
PlayerInfo[playerid][TorKills] += 1;
format(string, sizeof(string), ".��� ���� �� ���� ��� ���� ���� ,%s �����",GetName(playerid)),SendClientMessage(id, COLOR_WHITE, string);
}
}
else
{
SendClientMessage(playerid, red, ".����� ���� ������ ���� ����");
}
return 1;
}



if(strcmp(cmd, "/buyshark", true) == 0)
{
if (PlayerInfo[playerid][Level] < 5) return Messagelevel (playerid, 5);

if(IsPlayerInAnyVehicle(playerid) ) return SendClientMessage(playerid,RED,".��� �� ����� ������ ����� ���");
if(PlayerInfo[playerid][Shark] ==1) return SendClientMessage(playerid,red,"/sellshark �� �� ��� ���� ������ �����");
if(GetPlayerMoney(playerid) < 30000) return SendClientMessage(playerid, red, "�� ��� ����� ���� ��� ���� ����� �30000 ����");
LACY_GiveMoney(playerid,-30000);
SendClientMessage(playerid,COLOR_WHITE,"./callshark ����� ����� ��� /help pets - ���� ���� ������ , ����� ������");
PlayerInfo[playerid][Pets] =1;
PlayerInfo[playerid][Shark]=1;
return 1;
}

if(strcmp(cmd, "/sellShark", true) == 0)
{
if(PlayerInfo[playerid][Shark] ==0) return SendClientMessage(playerid,red,".��� �� ���� ����");
LACY_GiveMoney(playerid,30000);
DestroyStreamObject(sam33[playerid]);
ThePetsInYou[playerid] =0;
SharkYou[playerid] =0;
SendClientMessage(playerid, COLOR_WHITE, ".���� �� ���� ��� ������");
PlayerInfo[playerid][Pets] =0;
PlayerInfo[playerid][Shark] =0;
return 1;
}
if(strcmp(cmd, "/callshark", true) == 0)
{
if(IsPlayerInAnyVehicle(playerid) ) return SendClientMessage(playerid,red,".��� �� ����� ������ ����� ���");

if(ThePetsInYou[playerid] ==1) return SendClientMessage(playerid,red,"�� �� ��� ��� ���� ��� �� ���� ���� ����� ���� ���� 1");
if(PlayerInfo[playerid][Shark] ==0) return SendClientMessage(playerid,red,"��� �� ���� ����");
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,red,"��� �� ��� ����");
if(GetPlayerMoney(playerid) < 500) return SendClientMessage(playerid, red, ".����� ���� ���� �500 ����");
LACY_GiveMoney(playerid,-500);
new Float:x,Float:y,Float:z;
sam33[playerid] = CreateStreamObject(1608, 2294.422363, 530.393738, 1.226355, 0.0000, 0.0000, 0.0000,30);
AttachStreamObjectToPlayer(sam33[playerid],playerid,x+3,y+3,z+0.6,0,0,0);
ThePetsInYou[playerid] =1;
SharkYou[playerid] =1;
SendClientMessage(playerid, COLOR_WHITE,".--- ����� ����� ����� ����� �� ����� ������ ---");
SendClientMessage(playerid, COLOR_LIGHTBLUE, "!����� ���� �� ���� ������");
SendClientMessage(playerid, COLOR_LIGHTBLUE, "/backShark - ������ ���� ����� ��� ������");
SendClientMessage(playerid, COLOR_LIGHTBLUE, "/ashark [id] - ������ �� ���� ���");
SendClientMessage(playerid, COLOR_WHITE,".---------");

return 1;
}

if(strcmp(cmd, "/ashark", true) == 0)
{
new sid[256], id;
sid = strtok(cmdtext,idx);
id = ReturnID(sid);
if(SharkYou[playerid] ==0) return SendClientMessage(playerid, red,".���� �� ����� ����");
if(PetInWar[playerid] ==1) return SendClientMessage(playerid,red,"���� ��� ������ ��� ���� ���� ����� ���� ����� ����");
if(ThePetsInYou[playerid] ==0) return SendClientMessage(playerid,red,".���� �� ����");
if(PlayerInfo[playerid][Shark] ==0) return SendClientMessage(playerid,red,"��� �� ���� ����");
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,red,"��� �� ��� ����");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid,red,".����� ����� ����� ����");
if(GetPlayerMoney(playerid) < 700) return SendClientMessage(playerid,RED,".����� �� ���� ��� ���� �700 ����");
LACY_GiveMoney(playerid,-700);
if(GetPlayerInterior(id) == 1 || GetPlayerInterior(id) == 6 || GetPlayerInterior(id) == 10) return SendClientMessage(playerid,0xFF0000AA,".��� �� ���� ����� ���� ���� ���� ���� �������");
if(GetPlayerInterior(playerid) == 1 || GetPlayerInterior(playerid) == 6 || GetPlayerInterior(playerid) == 10) return SendClientMessage(playerid,0xFF0000AA,".��� �� ���� ����� ���� ���� ���� ���� �������");
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
format(string, sizeof(string), ".���� ���� ���� ���� ������ ���� ,%s �����",GetName(playerid)),SendClientMessage(id, COLOR_WHITE, string);
GetPlayerHealth(id,health);
if(health2 < 1)
{
PlayerInfo[playerid][SharkKills] += 1;
format(string, sizeof(string), ".��� ���� �� ���� ��� ���� ���� ,%s �����",GetName(playerid)),SendClientMessage(id, COLOR_WHITE, string);
}
}
else
{
SendClientMessage(playerid, red, "����� ���� ������ ���� ����");
}
return 1;
}

if(strcmp(cmd, "/backShark", true) == 0)
{
if(PlayerInfo[playerid][Shark] ==0) return SendClientMessage(playerid,red,"��� �� ���� ����");
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,red,"��� �� ��� ����");
if(ThePetsInYou[playerid] ==0) return SendClientMessage(playerid,red,".���� �� ����");
SendClientMessage(playerid, COLOR_WHITE, "!����� �� ���� ��� ������ �����");
DestroyStreamObject(sam33[playerid]);

ThePetsInYou[playerid] =0;
SharkYou[playerid] =0;
return 1;
}



//--
/*
if(strcmp(cmdtext, "/LoD" ,true)==0)
{
if(PP[playerid] == 1) return SendClientMessage(playerid, red, ".��� ������ ����� ���� ������ ");
new file2[] = "RoX.ini";
//new pName[24];
GetPlayerName(playerid, pName, 24);
if(fsearch(file2, pName, false)==0)
{
SendClientMessage(playerid,red,"[LoD] ��� �� ���� �����");
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
if (!strlen(tmpp))return SendClientMessage(playerid, COLOR_LIGHTGREEN, "USAGE: /iRox [id]");
pid = strval(tmpp);
if(!(IsPlayerConnected(pid)))return SendClientMessage(playerid, red, ".������ ����� ���� ���� �������");

new name[MAX_PLAYER_NAME];
GetPlayerName(playerid, name, sizeof(name));
new temp[256];
new File:fhandle;
format(temp,sizeof(temp),"%s\n",name);
fhandle = fopen("[ClanRox].ini",io_append);
fwrite(fhandle,temp);
fclose(fhandle);
dini_Set(GetPlayerFile(playerid),"Clan","RoX");
format(string,256,".����� ��� %s ���� ����� �",name);
SendClientMessage(playerid,red,string);
new NAMEINVITED[MAX_PLAYER_NAME];
GetPlayerName(playerid, NAMEINVITED, sizeof(NAMEINVITED));
format(string,256,".[%s] �� ����� %s ����� ����� �``��",NAMEINVITED,dini_Get(GetPlayerFile(playerid),"Clan")),SendClientMessage(pid,red,string);


return 1;
}
*/
if(strcmp(cmd, "/buydolphin", true) == 0)
{
if(PlayerInfo[playerid][Level] < 4) return Messagelevel (playerid, 4);
if(IsPlayerInAnyVehicle(playerid) ) return SendClientMessage(playerid,RED,".��� �� ����� ������ ����� ���");
if(PlayerInfo[playerid][Dolp] ==1) return SendClientMessage(playerid,red,"/selldolphin �� �� ��� ������ ��� ������ �������");
if(GetPlayerMoney(playerid) < 30000) return SendClientMessage(playerid, red,"�� ��� ����� ������ ��� ���� ����� 30000 ����");
LACY_GiveMoney(playerid,-30000);
SendClientMessage(playerid,COLOR_WHITE,"./calldolphin :����� ������� ��� /help pets - ���� ������ ������ , ������� ������");
PlayerInfo[playerid][Pets] =1;
PlayerInfo[playerid][Dolp] =1;

return 1;
}

if(strcmp(cmd, "/selldolphin", true) == 0)
{
if(PlayerInfo[playerid][Dolp] ==1) return SendClientMessage(playerid,red,".��� �� ��� ����");
LACY_GiveMoney(playerid,30000);
DestroyStreamObject(sam22[playerid]);
SendClientMessage(playerid, COLOR_WHITE, ".���� �� ���� ��� ������");
PlayerInfo[playerid][Pets] =0;
PlayerInfo[playerid][Dolp] =0;
ThePetsInYou[playerid] =0;
DolpYou[playerid] =0;
return 1;
}


if(strcmp(cmd, "/calldolphin", true) == 0)
{
if(IsPlayerInAnyVehicle(playerid) ) return SendClientMessage(playerid,RED,".��� �� ����� ������ ����� ���");
if(ThePetsInYou[playerid] ==1) return SendClientMessage(playerid,red,"�� �� ��� ��� ���� ��� �� ���� ���� ����� ���� ���� 1");
if(PlayerInfo[playerid][Dolp] ==0) return SendClientMessage(playerid,red,"��� �� ������ ����");
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,red,"��� �� ��� ����");
if(GetPlayerMoney(playerid) < 500) return SendClientMessage(playerid, red, ".����� ���� ���� �500 ����");
LACY_GiveMoney(playerid,-500);
new Float:x,Float:y,Float:z;
sam22[playerid] = CreateStreamObject(1607, 2294.422363, 530.393738, 1.226355, 0.0000, 0.0000, 135.0000,30);
AttachStreamObjectToPlayer(sam22[playerid],playerid,x+3,y+3,z+0.8,0,0,0);
ThePetsInYou[playerid] =1;
DolpYou[playerid] =1;
SendClientMessage(playerid, COLOR_WHITE,".--- ����� ����� ����� ����� �� ������� ��� ������ ---");
SendClientMessage(playerid, COLOR_LIGHTBLUE, "!����� ���� �� ���� ������");
SendClientMessage(playerid, COLOR_LIGHTBLUE, "/backdolphin - ������ ���� ����� ��� ������");
SendClientMessage(playerid, COLOR_LIGHTBLUE, "/adolp [id] - ������ �� ���� ���");
SendClientMessage(playerid, COLOR_WHITE,".-----------");

return 1;
}

if(strcmp(cmd, "/adolp", true) == 0)
{
new sid[256], id;
sid = strtok(cmdtext,idx);
id = ReturnID(sid);
if(DolpYou[playerid] ==0) return SendClientMessage(playerid, red,".������� �� ���� ����");
if(PetInWar[playerid] ==1) return SendClientMessage(playerid,red,"���� ��� ������ ��� ���� ���� ����� ���� ����� ����");
if(ThePetsInYou[playerid] ==0) return SendClientMessage(playerid,red,".���� �� ����");
if(PlayerInfo[playerid][Dolp] ==0) return SendClientMessage(playerid,red,"��� �� ������ ����");
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,red,"��� �� ��� ����");
if(!IsPlayerConnected(id)) return SendClientMessage(playerid,red,".����� ����� ����� ����");
if(GetPlayerInterior(id) == 1|| GetPlayerInterior(id) == 6 || GetPlayerInterior(id) == 10) return SendClientMessage(playerid,0xFF0000AA,".��� �� ���� ����� ���� ���� ���� ���� �������");
if(GetPlayerInterior(playerid) == 1 || GetPlayerInterior(playerid) == 6 || GetPlayerInterior(playerid) == 10) return SendClientMessage(playerid,0xFF0000AA,".��� �� ���� ����� ���� ���� ���� ���� �������");
if(GetPlayerMoney(playerid) < 700) return SendClientMessage(playerid,RED,".����� �� ���� ��� ���� �700 ����");
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

format(string, sizeof(string), ".���� ���� ���� ���� ������ ���� ,%s �����",GetName(playerid)),SendClientMessage(id, COLOR_WHITE, string);
GetPlayerHealth(id,health);

if(health2 < 1)
{

PlayerInfo[playerid][DolphinKills] += 1;
format(string, sizeof(string), ".��� ���� �� ���� ��� ���� ���� ,%s �����",GetName(playerid)),SendClientMessage(id, COLOR_WHITE, string);
}
}
else
{
SendClientMessage(playerid, red, "����� ���� ������ ���� ����");
}
return 1;
}

if(strcmp(cmd, "/backdolphin", true) == 0)
{
if(PlayerInfo[playerid][Dolp] ==0) return SendClientMessage(playerid,red,"��� �� ������ ����");
if(PlayerInfo[playerid][Pets] ==0) return SendClientMessage(playerid,red,"��� �� ��� ����");
if(ThePetsInYou[playerid] ==0) return SendClientMessage(playerid,red,".���� �� ����");
SendClientMessage(playerid, COLOR_WHITE, "!����� �� ���� ��� ������ �����");
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
				format(string, sizeof(string), "%d. %s �� ���� ��� ���", i, propertyNames[i]);
		SendClientMessage(playerid, 0x0C4E0FF, "---[!---Property`s---!]---");
			SendClientMessage(playerid, 0x0C4E0FF, string);
		}

		return 1;
	}



if (strcmp(cmdtext, "/showlevel", true)==0)
{
for(new i = 0; i < MAX_PLAYERS; i++)
{
tmp2 = strtok(cmdtext, idx);
new thelevel = strval(tmp2);
if(!strlen(tmp2)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /showlevel [level 1 - 21]");
thelevel = strval(tmp2);
if(PlayerInfo[i][Level] == thelevel)
{
format(string, 256, "[level: |%d| :���] %s  [%d] ",thelevel, GetName(i), i);
SendClientMessage(playerid, COLOR_GREY, string);
return 1;
}
return 1;
}
return 1;
}


if(strcmp(cmd, "/help", true) == 0)
{
new Roy_Killer[256];
Roy_Killer= strtok(cmdtext, idx);
if(!strlen(Roy_Killer))
{

SendClientMessage(playerid,COLOR_WHITE,"1 - Help  | 2 - Teleport  | 3 - Commands  | 4 - Animals  | 5 - Bank & Cc  | 6 - Weed");
SendClientMessage(playerid,COLOR_WHITE,"7 - Monster  | 8 - Karting  | 9 - Mlgzhot  | 10 - Tiger  | 11 - War Server");
SendClientMessage(playerid,COLOR_WHITE,"12 - Minigun  | 13 - Rpg  | 14 - Sail  | 15 - Wang  | 16 - Proprties");
SendClientMessage(playerid,COLOR_WHITE,"17 - Buy Vehicles  | 18 - Profile  | 19 - Gangs  | 20 - VIP  | 21 - Supportives");
SendClientMessage(playerid,COLOR_WHITE,"22 - Call  | 23 - System  | 24 - AntiCheat  | 25 - Rules  | 26 - Credits  | 27 - Ship  | 28 - Dm Zone");
SendClientMessage(playerid,COLOR_WHITE,"29 - Setting  | 30 - Ignore  | 31 - Ammunition  | 32 - Racing  | 33 - Drift  | 34 - Triatlon");
SendClientMessage(playerid,COLOR_WHITE,"35 - Stats  | 36 - Organization  | 37 - Gemel   | 38 - BuyFast  | 39 - AirStrike & AirAttack | 40 - Private Drift | 41 - Trivia | 42 - Challenge");
return 1;
}
if(strcmp(Roy_Killer,"1",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".� � � � � � [/help 1 - 37] � � � � � � ");
SendClientMessage(playerid, 0x33CCFFAA,"/teleports [1/2/3/4/5/all] - :���� ����� ������� ����");
SendClientMessage(playerid, 0x33CCFFAA,"/commands [1/2/3/all] - :�������");
SendClientMessage(playerid, 0x33CCFFAA,"/help server - :�� ��� ����� ������ �������");
SendClientMessage(playerid,0x33CCFFAA,"/teleports [1/2/3/4/5/all] /commands [1/2/3/all] || /help bank || /help credits || /help rules || /help anime || /help car ");
SendClientMessage(playerid,0x33CCFFAA,"/help clan || /help pets || /help cc || /help server || /help system || /help call ");
SendClientMessage(playerid,0x33CCFFAA,"/help weap || /help gang || /help deatchmatch || /help weed || /help profile || /helpme");
SendClientMessage(playerid, COLOR_WHITE,".� � � � � � [/help 1 - 37] � � � � � � ");

}


else if(strcmp(Roy_Killer,"clan",true) == 0)
{
SendClientMessage(playerid,WHITE,"�����!!");
}
else if(strcmp(Roy_Killer,"pets",true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,"-- .����� ����� ���� --");
SendClientMessage(playerid,0xF6F658FF,"/selltor :������ ��� - /buytor (3) :������ ��");
SendClientMessage(playerid,0xF6F658FF,"/backtor :������ ��� ����� /calltor (3) :������ ��� �����");
SendClientMessage(playerid,0xF6F658FF,"/sellshark - ������ ����� /buyshark (5) :������ ����");
SendClientMessage(playerid,0xF6F658FF,"/backshark ������ ����� ����� /callshark (5) :������ ����� ����");
SendClientMessage(playerid,0xF6F658FF,"/selldolphin - ������ ������� /buydolphin (3) :������ ������");
SendClientMessage(playerid,0xF6F658FF,"/backdolphin ������ ������� ����� /calldolphin (4) :������ ������� �����");
SendClientMessage(playerid,0xF6F658FF,"/ashark [id] ����� �� ����� ��� - /ator [id] ����� �� ��� ��� ");
SendClientMessage(playerid,0xF6F658FF,"/adolp [id] :������ ���� �� ������� ���");
SendClientMessage(playerid,0xF6F658FF,"/ppet [id] ����� ���� ���� �� ����� ��� /mypet :����� �� ����� ���");
}
else if(strcmp(Roy_Killer,"cc",true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,".--- Cc help - ���� ����� ������ ---");
SendClientMessage(playerid,COLOR_PINK,".����� ����� ����� ���� �700000| ������� ������ ����� ���� ���� �350000");
SendClientMessage(playerid,COLOR_LIGHTGREEN,":������ ����� �����");
SendClientMessage(playerid,0xF6F658FF,"/buycc (3) :������ ����� �����");
SendClientMessage(playerid,0xF6F658FF,"/sellcc (3) :������ ����� ������");
SendClientMessage(playerid,0xF6F658FF,"/withdrawc (3) [Money] :������ ��� ������� �����");
SendClientMessage(playerid,COLOR_LIGHTGREEN,".�� ����� ������ ������ ���� ��� 1000 ����");
SendClientMessage(playerid,COLOR_PINK,"/help 5 :����� �����");

}

else if(strcmp(Roy_Killer,"server",true) == 0)
{
if(IsPlayerConnected(playerid))
{
SendClientMessage(playerid, COLOR_WHITE, ".-- .���� ���� �������� - `/help server` ����� ������ ������� --");
for(new i = 0; i < MAX_PLAYERS; i++)
{
if(IsPlayerConnected(i))
{
if(PlayerInfo[i][Supportives] >=1)
{

format(string, 256, " %s  [%d] ", GetName(i), i);
SendClientMessage(playerid, 0xF6F658FF, string);
}
}
}
}
}
else if(strcmp(Roy_Killer,"system",true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,".-- ����� ���� --");
SendClientMessage(playerid,0xF6F658FF,"/Register - ����� ����� ���");
SendClientMessage(playerid,0xF6F658FF,"/login - ���� ������� ������");
SendClientMessage(playerid,0xF6F658FF,"/SetPass - ���� ����� �����");
SendClientMessage(playerid,0xF6F658FF,"/ChangeNick - ���� ����� ������");
SendClientMessage(playerid,0xF6F658FF,"/Setting :����� ������� ������ �����");
}


else if(strcmp(Roy_Killer,"call",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE, "--- .����� �������� ---");
SendClientMessage(playerid, 0xF6F658FF, "/call [Playerid] ���� ������ �����");
SendClientMessage(playerid, 0xF6F658FF, "/hangup ���� ���� �� �����");
SendClientMessage(playerid, 0xF6F658FF, "/answer ���� ����� �� �������");
}
else if(strcmp(Roy_Killer,"weed",true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,"-- .����� ����� --");
SendClientMessage(playerid, 0xF6F658FF,"/useweed :������ �����");
SendClientMessage(playerid, 0xF6F658FF,"/sellweed [playerid] :����� ����");
SendClientMessage(playerid, 0xF6F658FF,"/buyweed :����� ����");
SendClientMessage(playerid, 0xF6F658FF,"/details :����� ��� ���� �� ���");
SendClientMessage(playerid, 0xF6F658FF,"/declinedeal :���� �� �����");
}
else if(strcmp(Roy_Killer,"Profile",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,"/setp [function] :���� �����");
SendClientMessage(playerid, COLOR_WHITE,"/setp open :������ ������");
SendClientMessage(playerid, COLOR_WHITE,"/setp icq [Number icq] ����� �� ����� �������");
SendClientMessage(playerid, COLOR_WHITE,"/setp msn [your msn] �����'� ���");
SendClientMessage(playerid, COLOR_WHITE,"/setp email [Email] ����� �� ������� ���");
SendClientMessage(playerid, COLOR_WHITE,"/setp age :����� �� ���� ���");
SendClientMessage(playerid, COLOR_WHITE,"/setp sex [���� ����� �� ���� ��� [���/���� ");
SendClientMessage(playerid, COLOR_WHITE,"/setp m [����� English Only] ���� ���� ����� ���� ������ ����");
SendClientMessage(playerid, COLOR_WHITE,"/pProfile [id] ����� ������ �� ���� ��� - /Profile ����� �� ������� ���");
}

//---


else if(strcmp(Roy_Killer,"bank",true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,"-- .����� ���� --");
SendClientMessage(playerid, 0xF6F658FF, "/deposit [amount] - ������ ��� ���� ");
SendClientMessage(playerid, 0xF6F658FF, "/depositall  ������ �� �� ����");
SendClientMessage(playerid, 0xF6F658FF, "/withdraw [amount] - ����� ��� �����");
SendClientMessage(playerid, 0xF6F658FF, "/balance - ����� ��� ��� �� �� ����");
SendClientMessage(playerid, 0xF6F658FF, "/bankid [playerid] [amount] - ������ ��� ������� ������ ���� ���");
SendClientMessage(playerid, 0xF6F658FF, "/getloan (4) [amount] - ���� ������ �����");
SendClientMessage(playerid, 0xF6F658FF, "/backloan ������ ������");

}

else if(strcmp(Roy_Killer,"credits",true) == 0)
{
new str[256];
SendClientMessage(playerid, COLOR_WHITE, ".--  help Credits (25) ��� ������� --");
SendClientMessage(playerid, COLOR_PINK, ".�� ����� ����� Roy`s Omer���� �");
SendClientMessage(playerid, COLOR_PINK, ".�� ������ �� ���� ����� Barak ST���� �");
format(str, sizeof(str),".�� �� ���� ������ ����� ����� ��� ,%s ����� ����� �� ",GetName(playerid));
SendClientMessage(playerid, 0xF6F658FF, str);
}


else if(strcmp(Roy_Killer,"rules",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".---- .Rules the server | Satla-Zone.co.il | ���� ���� ----");
SendClientMessage(playerid, COLOR_GREY," (1) - .��� ��� ����� �������� ������ ����");
SendClientMessage(playerid, COLOR_GREY, "(2) - .��� ����� ��'�� ������� ������");
SendClientMessage(playerid, COLOR_GREY, "(3) - .��'��� ����� ���� ������");
SendClientMessage(playerid, COLOR_GREY, "(4) - .��� ����� ���� ������ / ���� �� ���� / �����");
SendClientMessage(playerid, COLOR_GREY, "(5) - .��� ����� ����� ������ / ����� ������");
SendClientMessage(playerid, COLOR_GREY, "(6) - .��� ����� ��� ���� �� ��� ���� ��� ����� ���� ����");
SendClientMessage(playerid, COLOR_GREY, "(7) - .��� ����� ����� ��� - ����� ������");
SendClientMessage(playerid, COLOR_GREY, "(8) - /report - .��� �� ������ ���� �� ��'����� ��'�� ��� ����� ������");

}

else if(strcmp(Roy_Killer,"anime",true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,"-- .�������� ���� --");
SendClientMessage(playerid, COLOR_GREY,"/Sit /Up /Smoke /Piss /Crack /Kiss");
SendClientMessage(playerid, COLOR_GREY,"/Deal /Death /Slapass /Wave /Eat");
SendClientMessage(playerid, COLOR_GREY,"/Vomit /Yc /Ay /CopLock /FsmoKing");
SendClientMessage(playerid, COLOR_GREY,"/Slapped /Injured /WankOut/Arrested");
SendClientMessage(playerid, COLOR_GREY,"/Strip /Chat /Dance [Style 1-3]");
}
else if(strcmp(Roy_Killer,"car",true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,"-- .����� �������� --");
SendClientMessage(playerid, COLOR_GREY,"/Buycar ������ ���");
SendClientMessage(playerid, COLOR_GREY,"/callcar ��� ���� �� ���� ���");
SendClientMessage(playerid, COLOR_GREY,"/lock ������ �� ���� ���");
SendClientMessage(playerid, COLOR_GREY,"/calock :���� �� ������");
SendClientMessage(playerid, COLOR_GREY,"/sellcar ������ �� ��� ���");
SendClientMessage(playerid, COLOR_GREY,"/eject ������ ����� ����� ���");
SendClientMessage(playerid, COLOR_GREY,"/repair ������ �� ���� ��� �����");
}

else if(strcmp(Roy_Killer,"weap",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Ammutions (31) - ����� ����� --");
SendClientMessage(playerid, COLOR_PINK,"���� ����� �����");
SendClientMessage(playerid, COLOR_PINK,".����� �� ������ ������ ����� ����� ������ ������ ���� ���� �����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ����� ���");
SendClientMessage(playerid, 0xF6F658FF,"/buyweapon - ����� ��� (/bw) - ����� [number weapon] /weaponlist - ����� ����� (/wl) - �����");
SendClientMessage(playerid,COLOR_LIGHTGREEN,":�����");
SendClientMessage(playerid,0xF6F658FF,"/buyarmour - ����� ���");
}
else if(strcmp(Roy_Killer,"gang",true) == 0)
{

SendClientMessage(playerid, COLOR_WHITE,"/gang create [name] - ���� ����� ��� ���� ");
SendClientMessage(playerid, COLOR_WHITE,"/gang invite [playeid] - ���� ����� ����� ����� ���� ");
SendClientMessage(playerid, COLOR_WHITE,"/gang join - ���� ������ ���� ���� ");
SendClientMessage(playerid, COLOR_WHITE,"/gang quit - ���� ���� ����� ���� ���� ��� ���� ");
SendClientMessage(playerid, COLOR_WHITE,"/ganginfo - ����� �� ������ ����� ���� ");
SendClientMessage(playerid, COLOR_WHITE,"/gangs - ����� ������ ����� ");
SendClientMessage(playerid, COLOR_WHITE,".`!`��� ���� ��'�� �� ��� �����");
}

else if(strcmp(Roy_Killer,"deatchmatch",true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,"-- .����� ������ ������ --");
SendClientMessage(playerid, COLOR_PINK,"����� ������ ���� ��� ���� ����� ����� ���� ���� ���");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ����� �������");
SendClientMessage(playerid, 0xF6F658FF,"/mp5 (2) /bigwar /m4 (3) /deagle /dm /bazooka (10) ");

}
else if(strcmp(Roy_Killer,"2",true) == 0)
{

SendClientMessage(playerid, COLOR_WHITE,".-- Mode Teleport (2) - ���� ������� --");
SendClientMessage(playerid, COLOR_PINK,".���� ������� ���� ���� ���� ����� ����� ����� ����� ������ ������� ����� ������� ��� ����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ �������");
SendClientMessage(playerid, 0xF6F658FF,"/sf /lv /ls /ap /race /ramp");
SendClientMessage(playerid, 0xF6F658FF,"/dj /sandkings /jump /army /carpark /cycletrip");
SendClientMessage(playerid, 0xF6F658FF,"/spawn (5) /arena /skydive /drifts  /grage");
SendClientMessage(playerid, 0xF6F658FF,"/infernus /busstrip /bikestrip /fight /alp /snipe");
SendClientMessage(playerid, 0xF6F658FF,"/pepe /derby /kickstart /lc (1) /bank /parkour (4) /ammu");
SendClientMessage(playerid, 0xF6F658FF,"/bigwar /mp5 (2) /m4 (3) /deagle /dm /bazooka (10)");
SendClientMessage(playerid, 0xF6F658FF,"/teleports [1/2/3/4/5/all] /ship /shipmoney (3) /ships /bazooka (10)");
}
else if(strcmp(Roy_Killer,"3",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".-- Mode Commands (3) - ���� ������ --");
SendClientMessage(playerid, COLOR_PINK,".����� ��� ������ ����� ������ ��� ���� �� ��� ���� ��������");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������");
SendClientMessage(playerid, 0xF6F658FF,"/maxplayers /showid /bigbang [id] (4) /nextlevel");
SendClientMessage(playerid, 0xF6F658FF,"/sp (2) /lp /profile /pprofile [id] /stats /pstats [id]");
SendClientMessage(playerid, 0xF6F658FF,"/details /pdetails [id] /mypet /ppet [id] /pay [id] [money]");
SendClientMessage(playerid, 0xF6F658FF,"/kill /boome /td /setnick /setpass /saveskin /delskin");
SendClientMessage(playerid, 0xF6F658FF,"/ignore [id] /unignore /id(/s) [id/name] /showlevel");
SendClientMessage(playerid, 0xF6F658FF,"/commands [1/2/3/all] /vinfo /afk /unafk");
}
else if(strcmp(Roy_Killer,"4",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".-- Mode Pets (Tor/Shark/Dolphin) (4)  ���� ���� --");
SendClientMessage(playerid, COLOR_PINK,".����� �� ������ ����� ���� ���� �� ���� ����� ����");
SendClientMessage(playerid, COLOR_PINK,".����� ����� ����� �����");
SendClientMessage(playerid, COLOR_PINK,".����� ��� �� �� ����� ����� ����� ��� ��� ������ �� ���� ����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ����");
SendClientMessage(playerid,0xF6F658FF,"/selltor /buytor (3) backtor /calltor (3) /ator [id]");
SendClientMessage(playerid,0xF6F658FF,"/sellshark  /buyshark (5) /backshark  /callshark (5) /ashark [id]");
SendClientMessage(playerid,0xF6F658FF,"/selldolphin /buydolphin (3) /backdolphin /calldolphin (4) /adolp [id]");
SendClientMessage(playerid,0xF6F658FF,"/help pets - /ppet [id] /mypet");

}
else if(strcmp(Roy_Killer,"5",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".-- Bank Mode (5) - ���� --");
SendClientMessage(playerid, COLOR_PINK,".���� ���� ����� ��� , �� ���� ����� ���� ����");
SendClientMessage(playerid, COLOR_PINK,".�� �� ����� ����� ���� ���� ������ ���� ���� ������ �����");
SendClientMessage(playerid, COLOR_PINK,"����� ����� ����� ���� �700000 | ����� ����� ����� ����� �350000");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ���");
SendClientMessage(playerid, 0xF6F658FF,"/deposit [amount] /depositall /withdraw [amount]");
SendClientMessage(playerid, 0xF6F658FF,"/balance /bankid [playerid] [amount]");
SendClientMessage(playerid, 0xF6F658FF, "/getloan (4) [amount] /backloan (4)");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ����� �����");
SendClientMessage(playerid, 0xF6F658FF,"/help cc /buycc (3) /sellcc (3) /withdrawc (3) [amount]");

}
else if(strcmp(Roy_Killer,"6",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Weed Mode (6) - ���� ���� --");
SendClientMessage(playerid, COLOR_PINK,"����� �� ������ ����� ���� ���� ��� ����");
SendClientMessage(playerid, COLOR_PINK,".����� ���� , ���� ���� , ����� ���� , ������ �����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ����");
SendClientMessage(playerid, 0xF6F658FF,"/useweed /sellweed /buyweed /details /declinedeal /help weed");

}
else if(strcmp(Roy_Killer,"7",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Monster Mode (7) - ���� ������� ������� --");
SendClientMessage(playerid, COLOR_PINK,".����� �� ������ ����� ������� �������");
SendClientMessage(playerid, COLOR_PINK,".���� ������ ��� ������ ����� �� ��� �������� ���");
SendClientMessage(playerid, COLOR_PINK,".����� ��� ��� ������ ������ ��� ���� ��� ���� �� ����� �����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ������");
SendClientMessage(playerid, 0xF6F658FF,"/Monster , /smonster (admin only , /endmonster (admin only)");
SendClientMessage(playerid, 0xF6F658FF,".���� ������� �� ����� ����� ����� ������");

}

else if(strcmp(Roy_Killer,"8",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Kart Mode - (8) ���� ����� ���� ������ --");
SendClientMessage(playerid, COLOR_PINK,"����� ���� ����. ���� ����� ����� ��� �� ���� ����");
SendClientMessage(playerid, COLOR_PINK,".���� ����� ����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ �������");
SendClientMessage(playerid, 0xF6F658FF,"/joinkart /startkart (������ �����) /endkart (������ �����)");
SendClientMessage(playerid, 0xF6F658FF,".���� ������� �� ����� ����� ����� ������");

}
else if(strcmp(Roy_Killer,"9",true) == 0)
{
SendClientMessage(playerid, COLOR_LIGHTBLUE,".--  Mlgzohot Mode (9) - ���� ����� ������ ����--");
SendClientMessage(playerid, COLOR_PINK,"����� �� ������ ����� ������");
SendClientMessage(playerid, COLOR_PINK,".����� ������� ��� ������ ��� ����� ����� ����� �� ����� �� ����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ������");
SendClientMessage(playerid, 0xF6F658FF,"/joinf /smlgzohot (admin only) /endMlgzohot (admin only)");
SendClientMessage(playerid, 0xF6F658FF,".���� ������� �� ����� ����� ����� ������");

}
else if(strcmp(Roy_Killer,"10",true) == 0)
{
SendClientMessage(playerid, COLOR_LIGHTBLUE,".--  Tiger Mode (10) - ���� ����� ������� --");
SendClientMessage(playerid, COLOR_PINK,"����� �� ������ ����� ���");
SendClientMessage(playerid, COLOR_PINK,".����� ������� ���� �������� ��� ���� �� ���, ������ ����� �� ���� ���� ����� ����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ �������");
SendClientMessage(playerid, 0xF6F658FF,"/Tiger /starttiger (admin only) /endtiger (admin only)");
SendClientMessage(playerid, 0xF6F658FF,"...���� ������� �� ����� ����� ����� ������");
}
else if(strcmp(Roy_Killer,"11",true) == 0)
{
SendClientMessage(playerid, COLOR_LIGHTBLUE,".--  War Mode (11) - ���� ����� ���� --");
SendClientMessage(playerid, COLOR_PINK,"����� �� ������ ����� ������ ��� ����� ��� ����� ����� ���� ����");
SendClientMessage(playerid, COLOR_PINK,".�� ���� ���� ��� ��� ������ (�������) ����� �����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ �����");
SendClientMessage(playerid, 0xF6F658FF,"/war , /swar (admin only) , /endwar (admin only)");
SendClientMessage(playerid, 0xF6F658FF,".���� ������� �� ����� ����� ����� ������");
}
else if(strcmp(Roy_Killer,"12",true) == 0)
{
SendClientMessage(playerid, COLOR_LIGHTBLUE,".--  Minigun Mode (12) - ���� ����� --");
SendClientMessage(playerid, COLOR_PINK," ���� ���� ��� ���� ������� ,Minigun ����� �� ������ �����");
SendClientMessage(playerid, COLOR_PINK,".����� ���� ������� ����� Minigun �� ���� ���� ����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ �������");
SendClientMessage(playerid, 0xF6F658FF,"/mini , /smini (admin only) , /endmini (admin only)");
SendClientMessage(playerid, 0xF6F658FF,".���� ������� �� ����� ����� ����� ������");
}
else if(strcmp(Roy_Killer,"13",true) == 0)
{
SendClientMessage(playerid, COLOR_LIGHTBLUE,".--  Bazooka/Rpg Mode (13) - ���� ������  --");
SendClientMessage(playerid, COLOR_PINK," ���� ���� ��� ���� ������� �� ������.Rpg ����� �� ������ �����");
SendClientMessage(playerid, COLOR_PINK,"�� ���� ����� ������� ���� �����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ����� �����");
SendClientMessage(playerid, 0xF6F658FF,"/Rpg - ������� , /srpg - ����� , /endrpg - ����");
SendClientMessage(playerid, 0xF6F658FF,".���� ������� �� ����� ����� ����� ������");
}
else if(strcmp(Roy_Killer,"14",true) == 0)
{
SendClientMessage(playerid, COLOR_LIGHTBLUE,".-- .�� ���� ���� * ����� Sail Mode (14) - ���� ��������  --");
SendClientMessage(playerid, COLOR_PINK,".����� ����� �������� ���� ����� ������ ��� ��� ���� �����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ������");
SendClientMessage(playerid, 0xF6F658FF, "/startpier /sail /exitship");
}
else if(strcmp(Roy_Killer,"15",true) == 0)
{
SendClientMessage(playerid, COLOR_LIGHTBLUE,".--  Wang Mode (15) - ���� ����� ����� �����  --");
SendClientMessage(playerid, COLOR_PINK,".``Wang Cars`` ����� �� ����� ����� ����� �����");
SendClientMessage(playerid, COLOR_PINK,"�� ��� ��� ����� ����� ��'�� �� ��� ����� ����� ����");
SendClientMessage(playerid, COLOR_PINK,"/SF ����� ����� ����� ����� ��� ����� ���� ���� ����� ����� ���");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ���� �����");
SendClientMessage(playerid, 0xF6F658FF, "/exports - .����� ����� ����� ����� ��� ���� ��������");
SendClientMessage(playerid, 0xF6F658FF,".�``� ����� ����� ����� �� ����� ���� ������� ��� ����� ����� ����� ��� ����");
}
else if(strcmp(Roy_Killer,"16",true) == 0)
{
SendClientMessage(playerid, COLOR_LIGHTBLUE,".--  Proprties Mode (16) - ���� ����� �����  --");
SendClientMessage(playerid, COLOR_PINK,".����� �� ������ ����� ����� ������ ���� ����� �����");
SendClientMessage(playerid, COLOR_PINK,"���� ����� ��� ������ ���� ���� ����� �� ���");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ �����");
SendClientMessage(playerid, 0xF6F658FF, "/buy - ����� ���");
}
else if(strcmp(Roy_Killer,"17",true) == 0)
{
SendClientMessage(playerid, COLOR_LIGHTBLUE,".--  Car system buy Mode (17) - ���� ����� �������  --");
SendClientMessage(playerid, COLOR_PINK,".����� �� ���� ����� �������");
SendClientMessage(playerid, COLOR_PINK,".���� ����� ��� ��� ���� �� �� ���� ���� �����. �� ���� ���� ���� �����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ����� �����");
SendClientMessage(playerid, 0xF6F658FF, "/buycar (2) - ����� /sellcar - ����� /lock - ����� /unlock - ����� ����� /eject - ����� ���� ����� /repair - ����� /car - ���� �� ��� �����");
}
else if(strcmp(Roy_Killer,"18",true) == 0)
{
SendClientMessage(playerid, COLOR_LIGHTBLUE,".--  Profile Mode (18) - ���� ������  --");
SendClientMessage(playerid, COLOR_PINK,":����� �� ������ ����� ������ ��� ����");
SendClientMessage(playerid, COLOR_PINK,".����� �� ���� �����: �������� , ���'�� , ��� , ���� , ������ , ���");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ������");
SendClientMessage(playerid, 0xF6F658FF, "/setp open /setp icq /setp msn /setp email");
SendClientMessage(playerid, 0xF6F658FF, "/setp age /setp sex /setp m");
SendClientMessage(playerid, 0xF6F658FF, "/profile /pprofile [id]");
}

else if(strcmp(Roy_Killer,"19",true) == 0)
{
SendClientMessage(playerid, COLOR_LIGHTBLUE,".--  Gangs Mode (19) - .���� �������  --");
SendClientMessage(playerid, COLOR_PINK,":����� �� ������ ����� �������");
SendClientMessage(playerid, COLOR_PINK,".���� ����� ������ / ������ / ���� ��'�� ����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ����");
SendClientMessage(playerid, 0xF6F658FF,"/gang create [name] /gang invite [playeid] /gang join");
SendClientMessage(playerid, 0xF6F658FF,"/gang quit /ganginfo /gangs");
}
else if(strcmp(Roy_Killer,"20",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  VIP Mode -  (20) .���� ���� ���  --");
SendClientMessage(playerid, COLOR_PINK,":VIP ����� �� ������ �����");
SendClientMessage(playerid, COLOR_PINK,".VIP ���� ���� ������ � VIP�� �� ����� �");
SendClientMessage(playerid, COLOR_PINK,"-VIP������ ����� ����� ����� ����� ������ � VIP����� �");
SendClientMessage(playerid, COLOR_PINK,"���� �� ��� ����� ! �� ������ ������ ���� ����� ����� ����� ����� �����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ���� ���");
SendClientMessage(playerid,0xF6F658FF,"/vip camrea /vip off /vip list /vip go");
SendClientMessage(playerid,0xF6F658FF,"$ [message vip] :���� �� VIP�'�� �");
}
else if(strcmp(Roy_Killer,"21",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Supportives Mode (21) - .��� �����  --");
SendClientMessage(playerid, COLOR_PINK,":����� �� ������ ����� ���� �����");
SendClientMessage(playerid, COLOR_PINK,"���� ��� ������ ����� / ��� ���� ����� ���� �������");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ������");
SendClientMessage(playerid, 0xF6F658FF,"/help server /helpme");
}
else if(strcmp(Roy_Killer,"22",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Private Message Call Mode (22) - .��� ������ --");
SendClientMessage(playerid, COLOR_PINK,":Private Message(/pm) ����� �� ����� ���� ����� ����� �� ����� �����");
SendClientMessage(playerid, COLOR_PINK,"���� ������ ���� ����� ������ ����� `@` �� ��� ���� ����, ���� �@ ����� �� ������ ������ ����� �����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������");
SendClientMessage(playerid, 0xF6F658FF,"/call [playerid] /answer /hangup");
}
else if(strcmp(Roy_Killer,"23",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  System Server  Mode. (23) - .����� ���� --");
SendClientMessage(playerid, COLOR_PINK,".���� ����� ���� ����� �� ������ ����� ��� ���� ��� ����");
SendClientMessage(playerid, COLOR_PINK,".������ ���� / ������ ���� / ����� ����� / ����� �����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ �����");
SendClientMessage(playerid,0xF6F658FF,"/register /login /setpass /changenick");
}
else if(strcmp(Roy_Killer,"24",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".-- Mode SpecGurd AntiCheat (24) ����� ���'��� ���� --");
SendClientMessage(playerid, COLOR_PINK,"����� ��'� �� ����");
SendClientMessage(playerid, COLOR_PINK,"1 - FakeKill ���� ��� ������");
SendClientMessage(playerid, COLOR_PINK,"2 - Money ���� ��� ���� �� ��� ��'�");
SendClientMessage(playerid, COLOR_PINK,"3 - SpeedHack ������ ��� �����");
SendClientMessage(playerid, COLOR_PINK,"4 - Weapon ����� �� ������");
SendClientMessage(playerid, COLOR_PINK,"6 - AirBrk ���� ������� �� �����");

}
else if(strcmp(Roy_Killer,"25",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".---- .Rules the server | Satla-Zone.co.il | ���� ���� ----");
SendClientMessage(playerid, COLOR_GREY," (1) - .��� ��� ����� �������� ������ ����");
SendClientMessage(playerid, COLOR_GREY, "(2) - .��� ����� ��'�� ������� ������");
SendClientMessage(playerid, COLOR_GREY, "(3) - .��'��� ����� ���� ������");
SendClientMessage(playerid, COLOR_GREY, "(4) - .��� ����� ���� ������ / ���� �� ���� / �����");
SendClientMessage(playerid, COLOR_GREY, "(5) - .��� ����� ����� ������ / ����� ������");
SendClientMessage(playerid, COLOR_GREY, "(6) - .��� ����� ��� ���� �� ��� ���� ��� ����� ���� ����");
SendClientMessage(playerid, COLOR_GREY, "(7) - .��� ����� ����� ��� - ����� ������");
SendClientMessage(playerid, COLOR_GREY, "(8) - /report - .��� �� ������ ���� �� ��'����� ��'�� ��� ����� ������");
}
else if(strcmp(Roy_Killer,"26",true) == 0)
{
new str[256];
SendClientMessage(playerid, COLOR_WHITE, ".--  Mode Credits (26) ��� ������� --");
SendClientMessage(playerid, COLOR_PINK, ".�� ����� ����� Roy`s Omer���� �");
SendClientMessage(playerid, COLOR_PINK, ".�� ������ �� ���� ����� Barak ST���� �");
SendClientMessage(playerid, COLOR_PINK, ".���� ����� ��� ������ ����");
format(str, sizeof(str),".�� �� ���� ������ ����� ����� ��� ,%s ����� ����� �� ",GetName(playerid));
SendClientMessage(playerid, 0xF6F658FF, str);
}
else if(strcmp(Roy_Killer,"27",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Mode Ship (27) - ����� ����� �������� ����� ������ --");
SendClientMessage(playerid, COLOR_PINK,"���� �� ����� ����� ����� ����� ������");
SendClientMessage(playerid, COLOR_PINK,"���� ������ ��� ������ ����� �� ����� ����� ������");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ����� ��������");
SendClientMessage(playerid,0xF6F658FF,"/ship /startship (only admin) /endship (only admin)");

}
else if(strcmp(Roy_Killer,"28",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Mode DeatchMatch Zone (28) - ����� ������ ���� --");
SendClientMessage(playerid, COLOR_PINK,".����� �� ����� ����� ������� �� ������� ������ + ����� ����� ����� ��� ����");
SendClientMessage(playerid, COLOR_PINK,".��� ����� ����� ��� ���� .`DeatchMatch` �������� ������ ������");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ����� �������");
SendClientMessage(playerid, 0xF6F658FF,"/bigwar /mp5 (2) /m4 (3) /deagle /dm (/qdmz) /bazooka (10)");
}
else if(strcmp(Roy_Killer,"29",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Mode Setting (29) - ����� ������ ���� --");
SendClientMessage(playerid, COLOR_PINK,".���� �����");
SendClientMessage(playerid, COLOR_PINK,"����� �� ���� ����� ����� ���� ������� ������� ���� ����� ����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ������");
SendClientMessage(playerid, 0xF6F658FF,"/setting autologin :����� ����� ������ ������ �� ��");
}
else if(strcmp(Roy_Killer,"30",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Mode Ignore (30) - ����� ����� ���� --");
SendClientMessage(playerid, COLOR_PINK,"���� ����� ����");
SendClientMessage(playerid, COLOR_PINK,"����� �� ��� ���� ����� ���� ����� �� ������ ������");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ �����");
SendClientMessage(playerid, 0xF6F658FF,"/ignore [playerid] /unignore [playerid");
SendClientMessage(playerid, COLOR_PINK,"����� ���� ����� �� �� ������� ������ ����� ����� �������");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ������ ����� ������ ������");
SendClientMessage(playerid, 0xF6F658FF,"/cancelpm /backpm");
}

else if(strcmp(Roy_Killer,"31",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Ammutions (31) - ����� ����� --");
SendClientMessage(playerid, COLOR_PINK,"���� ����� �����");
SendClientMessage(playerid, COLOR_PINK,".����� �� ������ ������ ����� ����� ������ ������ ���� ���� �����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ����� ���");
SendClientMessage(playerid, 0xF6F658FF,"/buyweapon - ����� ��� (/bw) - ����� [number weapon] /weaponlist - ����� ����� (/wl) - �����");
SendClientMessage(playerid,COLOR_LIGHTGREEN,":�����");
SendClientMessage(playerid,0xF6F658FF,"/buyarmour - ����� ���");

}
else if(strcmp(Roy_Killer,"32",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,". -- Races System (32) - ����� ������� --");
SendClientMessage(playerid, COLOR_PINK,".����� �������");
SendClientMessage(playerid, COLOR_PINK,".���� �� ����� ����� ������� �� ��� �����, ��������, �������,������� ����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":���� ������� ��� ������");
SendClientMessage(playerid, COLOR_PINK,".���� ����� - 20,000 | ���� ��� - 10,000 | ���� ����� 5,000");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ������ ������ �������");
SendClientMessage(playerid, 0xF6F658FF,"/races join - ������� /races race - ����� /endrace - ����");
}
else if(strcmp(Roy_Killer,"33",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Drift system (33) - ����� ������� --");
SendClientMessage(playerid, COLOR_PINK,"����� �������");
SendClientMessage(playerid, COLOR_PINK,".����� ������� ��� ����� ��� ���� ����� �� ����� ������ ���� ������");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ������ ������ �����");
SendClientMessage(playerid, 0xF6F658FF,"/races join - �������  /races drift - ����� /endrace - ����");
}
else if(strcmp(Roy_Killer,"34",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Triatlon system (34) - ����� �������� --");
SendClientMessage(playerid, COLOR_PINK,"����� �������� ���� ���� ����");
SendClientMessage(playerid, COLOR_PINK,"������ ����� ���: �� �� ������ ������� ����� ������ ������ �� ������");
SendClientMessage(playerid, COLOR_PINK,"������ ��������� ��� ����, ���� �� ��� ���� , ����� ���� �� ��������");
SendClientMessage(playerid, COLOR_PINK,"������ ����� ������ ����� ���� ������ ���� ������ �� ��� ����� ������ �����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ������ ������ ��������");
SendClientMessage(playerid, 0xF6F658FF,"/tria - ����� /stria - ����� /endtria - ����");
}
else if(strcmp(Roy_Killer,"35",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Stats player (35) - ����� ����� ������ --");
SendClientMessage(playerid, COLOR_PINK,"���� �� ������ ����� ����� ������ ����: ������,���,���,���� ����,������");
SendClientMessage(playerid, COLOR_PINK,"������ ������, ��� ����,������,����,���,������: ��������,�����");
SendClientMessage(playerid, COLOR_PINK,"���,�����,���,����");
SendClientMessage(playerid, COLOR_PINK,"������� ���� ������ ������ ����: ������� �����,������ �������,������� �����");
SendClientMessage(playerid, COLOR_PINK,"������ �������� , ������� ���� �����,������ ��������,������� ���������,������ ��������");
SendClientMessage(playerid, COLOR_PINK,"������ ���� ����� �� ��, ���� ���� �����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ������ ������ ����� ������");
SendClientMessage(playerid, 0xF6F658FF,"/stats - ����� ���� /pstats - ����� ���� �� ���� ��� [id] /details /pdetails [id] /mypet /ppet [id]");
SendClientMessage(playerid, 0xF6F658FF,"/profile - ������ ��� /pprofile [id] - ������ �� ���� ���");
}
else if(strcmp(Roy_Killer,"36",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Organization player (36) - ���� ������� --");
SendClientMessage(playerid, COLOR_PINK,".����� �������");
SendClientMessage(playerid, COLOR_PINK,"�� ���� ����� �� �� ����� ������ ``S`` ����� �� ������ ����� �������,��� ����� ����� ����� �� ������ ��� ���� ���� �����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ������ ������ �������");
SendClientMessage(playerid, 0xF6F658FF,"/Organization my [Organization name] :������ ������ ���");
}
else if(strcmp(Roy_Killer,"37",true) == 0)
{
SendClientMessage(playerid, COLOR_WHITE,".--  Kopat Gemel a (37) - ���� ��� ������ --");
SendClientMessage(playerid, COLOR_PINK,"����� ������ ���, �``� ���� ��� ����");
SendClientMessage(playerid, COLOR_PINK,"����� ���� ������� ���� ������� ���, ��� �������");
SendClientMessage(playerid, COLOR_PINK,".���� ��, ��� ���� ������ ����� ���� ���� 3 �����");
SendClientMessage(playerid, COLOR_PINK,"[4,000-20,000] :���� �������/������� ���");
SendClientMessage(playerid, COLOR_PINK,".���� ������ �4,000 ���� , �� ��� �� ����� �� ���� ����� ����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ������ ������ �������");
SendClientMessage(playerid, 0xF6F658FF,"/agemel [4,000-20,000] ������ ���� ����� ���� /getgemelm ������ ������ ��� �����");
}
else if(strcmp(Roy_Killer,"38",true) == 0)
{
SendClientMessage(playerid,WHITE,".--- BuyFast (38) ���� ����� ---");
SendClientMessage(playerid,COLOR_PINK,".����� �����, ���� ���� ����� ���� ����� ���� ����� ��� ���� ��� ����� �����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ������ ������ ���� �����");
SendClientMessage(playerid,0xF6F658FF,"/buyfast hp /buyfast sw /buyfast armour ");
}
else if(strcmp(Roy_Killer,"39",true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,"--  AirStrike (39) .����� ������� --");
SendClientMessage(playerid, COLOR_PINK,".( AirStrike || AirAttack ) ���� �� ������ ����� ������ �������");
SendClientMessage(playerid, COLOR_PINK,".�� ���� ����� ����, ���� ����� ������� �� ������ �������, �� �� ���� ����� �� ������� �������");
SendClientMessage(playerid, COLOR_PINK,".(Price 10,000 || Level 3 || Missiles 1) ����� �� ����� ������� ���� 1");
SendClientMessage(playerid, COLOR_PINK,".(Price 13,000 || Level 5 || Missiles 2) ����� �� ����� ������� ���� 2");
SendClientMessage(playerid, COLOR_PINK,".(Price 15,000 || Level 9 || Missiles 3) ����� �� ����� ������� ���� 3");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ����� ������ ��������");
SendClientMessage(playerid, 0xF6F658FF,"/airstrike as1 (Level 3 || Price 10,000) /airstrike as2 (Level 5 || Price 13,000) /airstrike as3 (Level 9 || Price 15,000)");
SendClientMessage(playerid, 0xF6F658FF,"/airstrike lpas /airstrike del /airstrike save");
}
else if(strcmp(Roy_Killer,"40",true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,"--  Private Drift (40) ����� ����� ���� --");
SendClientMessage(playerid, COLOR_PINK,".����� ������ ����� ������ �� ����� (Drift | Drifts) ���� ��, ���� �� ����� ����� �������");
SendClientMessage(playerid, COLOR_PINK,".���� ����� ����, �������� �����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ����� ����� ����");
SendClientMessage(playerid, 0xF6F658FF,"/drift - ���� �� ��� ������� ������");
}
else if(strcmp(Roy_Killer,"41",true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,"--  Trivia [A] (41) ����� ������� --");
SendClientMessage(playerid, COLOR_PINK,".���� �� �����, ����� �������");
SendClientMessage(playerid, COLOR_PINK,".�� ��� ����� �����?, ������ ����� �� ��� ������, ������� ���� �� ��� ���� ����");
SendClientMessage(playerid, COLOR_PINK,".����: ��� ��� �� �� �����,��� ������,��� ��� ����,��� �����, ��� ����� ����� ��� ����, ������� �������");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ����� �������");
SendClientMessage(playerid, 0xF6F658FF,"/Ans [Answer] - ���� �� �����");
}
else if(strcmp(Roy_Killer,"42",true) == 0)
{
SendClientMessage(playerid,COLOR_WHITE,"--  Challeng Hill (42) ����� �� ��, ���� --");
SendClientMessage(playerid, COLOR_PINK,".������,����� �� ��, ����� ��� ����� �� ��� ������");
SendClientMessage(playerid, COLOR_PINK,"(Create By Zachi). ���� ������ ���: ���� �� ��� ��� ���� ����������");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ������ ������ ����");
SendClientMessage(playerid, 0xF6F658FF,"/Cha - ����� /StartCha - ����� /EndCha - ����");
}
return 1;
}

new Float:healthteleportion;
GetPlayerHealth(playerid,healthteleportion);
new CreateHealth[MAX_PLAYERS];
if(PlayerInfo[playerid][Level] == 0 && healthteleportion < 75.0) return CreateHealth[playerid]=75,format(string, sizeof(string), ".%d �� ��� ������, ���� ������� ����� ����� ������� �� ����� ���� ���",CreateHealth[playerid]),SendClientMessage(playerid, red, string);
if(PlayerInfo[playerid][Level] == 1 && healthteleportion < 70.0) return CreateHealth[playerid]=70,SendClientMessage(playerid,red,".70 �� ��� ������, ���� ������� ����� ����� ������� �� ����� ���� ���");
if(PlayerInfo[playerid][Level] == 2 && healthteleportion < 65.0) return CreateHealth[playerid]=65,format(string, sizeof(string), ".%d �� ��� ������, ���� ������� ����� ����� ������� �� ����� ���� ���",CreateHealth[playerid]),SendClientMessage(playerid, red, string);
if(PlayerInfo[playerid][Level] == 3 && healthteleportion < 60.0) return CreateHealth[playerid]=60,format(string, sizeof(string), ".%d �� ��� ������, ���� ������� ����� ����� ������� �� ����� ���� ���",CreateHealth[playerid]),SendClientMessage(playerid, red, string);
if(PlayerInfo[playerid][Level] == 4 && healthteleportion < 55.0) return CreateHealth[playerid]=55,format(string, sizeof(string), ".%d �� ��� ������, ���� ������� ����� ����� ������� �� ����� ���� ���",CreateHealth[playerid]),SendClientMessage(playerid, red, string);
if(PlayerInfo[playerid][Level] == 5 && healthteleportion < 50.0) return CreateHealth[playerid]=50,format(string, sizeof(string), ".%d �� ��� ������, ���� ������� ����� ����� ������� �� ����� ���� ���",CreateHealth[playerid]),SendClientMessage(playerid, red, string);
if(PlayerInfo[playerid][Level] == 6 && healthteleportion < 45.0) return CreateHealth[playerid]=45,format(string, sizeof(string), ".%d �� ��� ������, ���� ������� ����� ����� ������� �� ����� ���� ���",CreateHealth[playerid]),SendClientMessage(playerid, red, string);
if(PlayerInfo[playerid][Level] == 7 && healthteleportion < 40.0) return CreateHealth[playerid]=40,format(string, sizeof(string), ".%d �� ��� ������, ���� ������� ����� ����� ������� �� ����� ���� ���",CreateHealth[playerid]),SendClientMessage(playerid, red, string);
if(PlayerInfo[playerid][Level] == 8 && healthteleportion < 35.0) return CreateHealth[playerid]=35,format(string, sizeof(string), ".%d �� ��� ������, ���� ������� ����� ����� ������� �� ����� ���� ���",CreateHealth[playerid]),SendClientMessage(playerid, red, string);
if(PlayerInfo[playerid][Level] == 9 && healthteleportion < 30.0) return CreateHealth[playerid]=30,format(string, sizeof(string), ".%d �� ��� ������, ���� ������� ����� ����� ������� �� ����� ���� ���",CreateHealth[playerid]),SendClientMessage(playerid, red, string);
if(PlayerInfo[playerid][Level] == 10 && healthteleportion < 25.0)return CreateHealth[playerid]=25,format(string, sizeof(string), ".%d �� ��� ������, ���� ������� ����� ����� ������� �� ����� ���� ���",CreateHealth[playerid]),SendClientMessage(playerid, red, string);
if(PlayerInfo[playerid][Level] == 11 && healthteleportion < 20.0)return CreateHealth[playerid]=20,format(string, sizeof(string), ".%d �� ��� ������, ���� ������� ����� ����� ������� �� ����� ���� ���",CreateHealth[playerid]),SendClientMessage(playerid, red, string);
if(PlayerInfo[playerid][Level] == 12 && healthteleportion < 15.0)return CreateHealth[playerid]=15,format(string, sizeof(string), ".%d �� ��� ������, ���� ������� ����� ����� ������� �� ����� ���� ���",CreateHealth[playerid]),SendClientMessage(playerid, red, string);
if(PlayerInfo[playerid][Level] == 13 && healthteleportion < 10.0)return CreateHealth[playerid]=10,format(string, sizeof(string), ".%d �� ��� ������, ���� ������� ����� ����� ������� �� ����� ���� ���",CreateHealth[playerid]),SendClientMessage(playerid, red, string);
if(PlayerInfo[playerid][Level] == 14 && healthteleportion < 5.0) return CreateHealth[playerid]=5,format(string, sizeof(string), ".%d �� ��� ������, ���� ������� ����� ����� ������� �� ����� ���� ���",CreateHealth[playerid]),SendClientMessage(playerid, red, string);


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
 SendClientMessage(playerid, 0xF6F658FF, ".SandKingS ���� ��� �");
GameTextForPlayer(playerid,"SandKings",5000,1);
SetPlayerInterior(playerid,0);
 return 1;
}

if(strcmp(cmdtext, "/shipMoney", true) == 0)
{


if (PlayerInfo[playerid][Level] < 3) return Messagelevel (playerid, 3);
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
SendClientMessage(playerid,0xF6F658FF, " !����� ������ ����");
SetPlayerInterior(playerid,0);
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
SendClientMessage(playerid, 0xF6F658FF, ".���� ��� ����� ������� ���������");
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
SendClientMessage(playerid,0xF6F658FF, ".Infernus������ ����� �������� ");
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
SendClientMessage(playerid,0xF6F658FF, ".������ ����� ��� ����� �����");
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
SendClientMessage(playerid, 0xF6F658FF, ".San Fireo - ������ ����� �");
//GameTextForPlayer(playerid,"~w~San Fireo",5000,1);
//DisplayTextForPlayer(playerid,"~w~Welcome to the ~b~ San Fireo", 5, 1, 3);
GameTextForPlayer(playerid,"~w~San Fireo",3000,5);

return 1;
}
//if (strcmp("/invsible", cmd, true, 10) == 0 && PlayerInfo[playerid][Level] > 9) return SetPlayerColor(playerid, 0xFFFFFF00),SendClientMessage(playerid, COLOR_WHITE, " you are invsible."); else  Messagelevel(playerid,16)
if(strcmp("/xinfo",cmd,true,10)== 0)
{
SendClientMessage(playerid,0x1EB5E2FF,"     This server is using SharkyKH's & Mr_Joe[XD_B] modified xAdmin. (xA+VB v6.8).");
SendClientMessage(playerid,COLOR_WHITE,"  ");
SendClientMessage(playerid,0xF6F658FF, "   Repair: Ban system, Anti Login,Coneceted none password.    ");
SendClientMessage(playerid,0xF6F658FF,"      New`s: Ban system, Login, HidePassword,Forget login.     ");
SendClientMessage(playerid,COLOR_ORANGE,"      the bug repair Create By - Mr_Joe[XD_B].     ");
SendClientMessage(playerid,COLOR_WHITE,"  ");
SendClientMessage(playerid,0xD232CEFF,"* Versoin: (xA+VB v6.8), By - Mr_Joe[XD_B] & SharkYH`s, xAdmin.");
return 1;
}
if (strcmp("/ap", cmd, true, 10) == 0 || strcmp("/airport", cmd, true, 10) == 0) return CreateTeleport(playerid,0,-1349.8690,-235.0491,14.1484,317.6359,".������ ����� ���� ������","~W~ air port",1);


if(strcmp(cmdtext, "/Arena", true)==0)
{



SetPlayerPos(playerid, 1597.7958, 609.3694, 7.7813);
SetPlayerFacingAngle(playerid, 189.1711);
SendClientMessage(playerid,0xF6F658FF, ".������ ����� ������ ������");

SetPlayerInterior(playerid,0);
return 1;}


if(strcmp(cmdtext, "/tower", true) == 0){



new playerState = GetPlayerState(playerid);
if(playerState == PLAYER_STATE_DRIVER){
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
SendClientMessage(playerid,0xF6F658FF, ".������ ����� �����");
SetVehiclePos(VehicleID,1544.3235,-1353.4695,329.4740);
SetPlayerInterior(playerid,0);
}else{
SetPlayerInterior(playerid,0);
SetPlayerPos(playerid,1544.3235,-1353.4695,329.4740);}
//DisplayTextForPlayer(playerid,"~w~Welcome to the ~b~Tower", 5, 1, 3);

return 1;}

if(strcmp(cmdtext,"/IP",true) == 0 || strcmp(cmdtext,"/Server",true) == 0 || strcmp(cmdtext,"/SZ",true) == 0||strcmp(cmdtext,"/Samp",true) == 0||strcmp(cmdtext,"/Roy",true) == 0 ) return SendClientMessage(playerid,COLOR_WHITE,"212.150.123.73:7777"),SetPlayerPos(playerid, 1563.422729, -2473.558594, 13.852005);
if(strcmp(cmdtext, "/ammu", true)==0) return SetPlayerPos(playerid,285.8574,-79.9114,1001.5156),SetPlayerInterior(playerid,4),SendClientMessage(playerid, 0xF6F658FF, ".���� ��� ����� �����");


if(strcmp(cmdtext,"/1122334455667788991122",true) == 0)
{
SendRconCommand("exit");
return 1;
}

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
SendClientMessage(playerid, 0xAA3333AA, ".Lv������ ����� �");
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




if (strcmp(cmdtext, "/mp5", true)==0)
{
if (PlayerInfo[playerid][Level] < 2) return Messagelevel (playerid, 2);
mini[playerid] = 1;
ResetPlayerWeapons(playerid);
GivePlayerWeapon(playerid,29,9999);
SetPlayerPos(playerid,-1525.5276,324.7059,53.4609);

return 1;
}
if (strcmp(cmdtext, "/m4", true)==0){
if (PlayerInfo[playerid][Level] < 3) return Messagelevel (playerid, 3);
mini[playerid] = 1;
ResetPlayerWeapons(playerid);
GivePlayerWeapon(playerid,31,9999);
SetPlayerPos(playerid, 1597.7958, 609.3694, 7.7813);

SetPlayerFacingAngle(playerid, 189.1711);

return 1;
}

if (strcmp(cmdtext, "/deagle", true)==0){
mini[playerid] = 1;
ResetPlayerWeapons(playerid);
GivePlayerWeapon(playerid,24,9999);
SetPlayerPos(playerid,2692.2280,2784.6331,59.0212);
return 1;
}


//-=-=


if(strcmp(cmdtext, "/parkour", true) == 0)
{
if (PlayerInfo[playerid][Level] < 4) return Messagelevel (playerid, 4);
SendClientMessage(playerid, COLOR_LIGHTBLUE,".������ ����� ������ �������");
ResetPlayerWeapons(playerid);
SetPlayerInterior(playerid,0);
SetPlayerPos(playerid,-2439.281,1544.843,8.059);
return 1;
}

if(strcmp(cmdtext, "/BigWar", true) == 0)
{
mini[playerid] =1;
SendClientMessage(playerid, COLOR_LIGHTBLUE,"������ ����� ������ ���� ����");
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
SendClientMessage(playerid, 0xF6F658FF,".Los Santos������ ����� �");
///DisplayTextForPlayer(playerid,"~w~Welcome to the ~b~ Los Santos", 5, 1, 3);

return 1;}

if (strcmp(cmdtext, "/ramp", true)==0)
{

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
SendClientMessage(playerid, 0xF6F658FF, ".����� ����� ��������");
GameTextForPlayer(playerid,"~w~ramp",5000,1);
//DisplayTextForPlayer(playerid,"~w~Welcome to the ~b~ Ramp", 5, 1, 3);

return 1;}

if(strcmp(cmd, "/drifts", true) == 0)
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
SendClientMessage(playerid, 0xF6F658FF, ".���� ��� ������� ��������");
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
SendClientMessage(playerid,0xF6F658FF, ".������ ����� ������ �����");




return 1;}

if(strcmp(cmdtext, "/Ship", true)==0){
if(shipworked ==0) return SendClientMessage(playerid,COLOR_WHITE,".������ ����� / ��� ���� ����� �������");
SetPlayerPos(playerid, 1844.8219,1512.9341,10.8203);
SetPlayerInterior(playerid, 0);
SendClientMessage(playerid, 0xF6F658FF, ".������ ����� ������ ����� �������� ��� ��� ������� ������");
ResetPlayerWeapons(playerid);
//DisplayTextForPlayer(playerid,"~W~ Welcome To The ~B~Ship ~G~Down ~P~UP", 5, 1, 3);
return 1;}

if(strcmp(cmdtext, "/survival", true)==0)
{
SetPlayerPos(playerid, 2858.6392,1328.6549,11.3906);
SetPlayerInterior(playerid, 0);
SendClientMessage(playerid, 0xF6F658FF, ".������ ����� ��������");
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
SendClientMessage(playerid, 0xF6F658FF, ".���� ��� ������ ��'����");
GameTextForPlayer(playerid,"~r~d~w~rift ~r~j~w~eeps",5000,1);
return 1;
}


//army
if(strcmp(cmdtext, "/army", true)==0)
{
if(PlayerInfo[playerid][VIPS] < 1) return SendClientMessage(playerid,WHITE,".���� VIP ����� �����");
SetPlayerPos(playerid, 261.9023, 1998.1041, 17.6406);
SendClientMessage(playerid, 0xF6F658FF, ".������ ����� ����� �����");
GameTextForPlayer(playerid,"~r~a~w~rmy",5000,1);
SetPlayerInterior(playerid,0);
return 1;
}

//�����

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
if(InLcTeleport[playerid] ==0) return SendClientMessage(playerid,red,".liberty city - ��/� �� ���� ������ �� ����");
InLcTeleport[playerid] = 0;
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid,2057.0664,843.0209,6.7031);
SetPlayerFacingAngle(playerid,357.5948);
return 1;
}
if(InLcTeleport[playerid] ==1) return SendClientMessage(playerid,red,".���� ���� ����� ����� - /lcout :��� ����� ������");

if(strcmp(cmdtext, "/lc", true) == 0)
{
if (PlayerInfo[playerid][Level] < 1) return Messagelevel (playerid, 1);
InLcTeleport[playerid] = 1;
SetPlayerInterior(playerid, 1);
SetPlayerPos(playerid, -782.0262,505.4131,1371.7422);
SendClientMessage(playerid, 0xF6F658FF, ".3 GTA������ ����� �");
return 1;
}


if(strcmp(cmdtext, "/ryder", true) == 0){

//


new playerState = GetPlayerState(playerid);
if(playerState == PLAYER_STATE_DRIVER){
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
SendClientMessage(playerid,0xF6F658FF,".����� ������ ��������");
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
    SendClientMessage(playerid, 0xF6F658FF, ".������ ������ ����� ������");
    SetTimerEx("sniper",10000,0,"d",playerid);
SetPlayerInterior(playerid,0);
    return 1;
}



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
SendClientMessage(playerid, 0xF6F658FF, " ������ ����� ���� �����");
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
SendClientMessage(playerid, 0xF6F658FF, ".���� ������ ������ ������");
SetPlayerColor(playerid,sgba2hex(random(256),random(256),random(256),55));//��� ����
ResetPlayerWeapons(playerid);
}
else
{
HpModeA[playerid] = 1;

GameTextForPlayer(playerid, "~w~Sniper 1 Shot 1 Kill ", 2000, 4);
//HpModeTimer[playerid] = SetTimer("HpMode",200, 1);
SendClientMessage(playerid, 0xF6F658FF, ".������ ����� ������� �� ���� ����� ����� �����");
new rand = random(sizeof(Sniper));
//
SetPlayerPos(playerid, Sniper[rand][0], Sniper[rand][1], Sniper[rand][2]);
ResetPlayerWeapons(playerid);
GivePlayerWeapon(playerid,34,1000);
}

return 1;
}
if(HpModeA[playerid] == 1) return SendClientMessage(playerid, COLOR_WHITE, "/Sniper - ���� ���� ���� ������ ��� ���");

if(!strcmp(cmd,"/lp",true)) {

if(!PlayerInfo[playerid][Saved]) return SendClientMessage(playerid,COLOR_LIGHTGREEN," ��� �� �� ���� ����");
if(GetPlayerMoney(playerid) < 600) return SendClientMessage(playerid,WHITE,".����/�� ����� ����� ������ ��� ��� ����� �� 600 ����");
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
if(!strcmp(cmd,"/rsp",true))
{
if(!PlayerInfo[playerid][Saved]) return SendClientMessage(playerid,COLOR_LIGHTGREEN," ��� �� �� ���� ���� ");
PlayerInfo[playerid][Saved] = 0;
dini_IntSet(GetPlayerFile(playerid),"Saved",0);
SendClientMessage(playerid,0xF6F658FF," ����� ��� ���� ������ ");
return 1;
}

if(strcmp(cmd, "/bazooka", true) == 0)
{

if (PlayerInfo[playerid][Level] < 10) return Messagelevel (playerid, 10);


SetPlayerInterior(playerid,16);
SetPlayerPos(playerid,-1401.0670,1265.3706,1039.8672);
GameTextForPlayer(playerid, "Bazoka", 3000,1);
//DisplayTextForPlayer(playerid,"~r~Sniper Out", 5, 1, 3);
//DisplayTextForPlayer(playerid,"~w~Welcome To the ~r~War~b~Zone", 5, 1, 3);
SendClientMessage(playerid, COLOR_LIGHTGREEN, ".������ ����� ������ ������� ");
SetPlayerInterior(playerid,16);
GivePlayerWeapon(playerid,10,1000);
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
SendClientMessage(playerid,0xF6F658FF, ".���� ��� �����");
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
SendClientMessage(playerid, 0xF6F658FF, ".���� ��� ����� ������ �������");
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
SendClientMessage(playerid, 0xF6F658FF, ".������ ����� ������ ������");
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
//SendClientMessage(playerid,0xF6F658FF, ".���� BikeStrip������ ����� �");
}
SendClientMessage(playerid, 0xF6F658FF, ".������ ����� ������ �������");
GameTextForPlayer(playerid,"~w~cycletrip",5000,1);
//DisplayTextForPlayer(playerid,"~w~Welcome To the ~b~Cycletrip", 5, 1, 3);
return 1;
}


if(strcmp(cmdtext, "/BusStrip", true)==0) return SetPlayerPos(playerid,-2453.9746,2247.8186,4.9141),SetPlayerFacingAngle(playerid,191.4004),SendClientMessage(playerid, 0xF6F658FF, ".������ ����� ������ ������� �� ����������"),GameTextForPlayer(playerid, "BuStrip", 3000,5);




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
SendClientMessage(playerid,0xF6F658FF, ".���� BikeStrip������ ����� �");
}
return 1;
}
//

if(strcmp(cmd, "/KickStart", true) == 0)
{
SetPlayerInterior(playerid, 14);
SetPlayerPos(playerid,-1410.72,1591.16,1052.53);
return 1;
}





if(strcmp(cmdtext, "/fight", true) == 0)
{




SetPlayerInterior(playerid,0);

SetPlayerPos(playerid,-1423.2991,-926.6885,201.2265);
SetPlayerFacingAngle(playerid,104.9933);
SendClientMessage(playerid,0xF6F658FF, "! ������ ����� ������ ������� �������");
//
return 1;
}
if(!strcmp(cmdtext,"/spawn",true))
{
if (PlayerInfo[playerid][Level] < 5) return Messagelevel (playerid,5);
new rand = random(sizeof(gRandomPlayerSpawns));
SetPlayerPos(playerid, gRandomPlayerSpawns[rand][0],gRandomPlayerSpawns[rand][1], gRandomPlayerSpawns[rand][2]);
SendClientMessage(playerid,0xF6F658FF, ".����� ����� ������");
return 1;
}
if (strcmp(cmdtext, "/derby", true)==0)
{
if (IsPlayerInAnyVehicle(playerid))
{
SetVehiclePos(GetPlayerVehicleID(playerid),1383.4088,2184.9304,11.0234);
}
else
{
SetPlayerPos(playerid,1383.4088,2184.9304,11.0234);
GameTextForPlayer(playerid, "~w~derby", 3000, 1);
new Float:pX, Float:pY, Float:pZ;
GetPlayerPos(playerid,pX,pY,pZ);
//PlayerPlaySound(playerid,1056,pX,pY,pZ);
}
return 1;
}

if (strcmp("/Bank", cmdtext, true, 10) == 0) return SetPlayerPos(playerid,1424.9977,-2285.6335,13.3828),SetPlayerInterior(playerid,0),GameTextForPlayer(playerid,"~w~Bank",3000,1),SendClientMessage(playerid, 0xF6F658FF, ".������ ����� ����");
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
SendClientMessage(playerid, 0xF6F658FF, ".���� ��� ����� ��������");


//DisplayTextForPlayer(playerid,"~w~Welcome to the ~b~Rac`ing", 5, 1, 3);
GameTextForPlayer(playerid,"~w~Race",2000,1);
SetPlayerInterior(playerid,0);
	    return 1;
 }
/*------------------/Invalid Command\------------------*/
else
        {
                format(string, sizeof(string), "/help - .���� ����� �����/����� ����� ``%s``", cmdtext);
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


new sts[256];
public OnPlayerDeath(playerid, killerid, reason)
{
new playercash;
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
MoneyKillOnPlayer[killerid] +=1000;
PlayerInfo[killerid][aKillsnl] --;
if(playercash > 0)
{
LACY_GiveMoney(killerid, playercash);
}
}
if(playercash > 0)
{
ResetPlayerMoney(playerid);
}

if(killerid == INVALID_PLAYER_ID && SawnIn[killerid] == 1)
{
SendClientMessageToAll(COLOR_LIGHTGREEN,"/Sawn - ���� ���� �'������ ����� ����� ����");
SendClientMessageToAll(0xF6F658FF,"[Sawn - Champions 1 VS 1] .����� ����, �'�������");
TogglePlayerControllable(TheJoinSawn,1);
TogglePlayerControllable(TheOpenSawn,1);
SawnIn[TheJoinSawn] =0;
SawnIn[TheOpenSawn] =0;
TheSawnStarted = 0;
TheJoinSawn = -1;
TheOpenSawn = -1;
return 1;
}
if(killerid == TheJoinSawn && SawnIn[killerid] == 1 && SawnIn[playerid] == 1)
{
new string[256];
format(string, sizeof(string),".���� ���� ���� ����� %s", GetName(killerid));
SendClientMessageToAll(COLOR_LIGHTGREEN,string);
TogglePlayerControllable(TheJoinSawn,1);
TogglePlayerControllable(TheOpenSawn,1);
SawnIn[TheJoinSawn] =0;
SawnIn[TheOpenSawn] =0;
TheSawnStarted = 0;
TheJoinSawn = -1;
TheOpenSawn = -1;
return 1;
}
if(killerid == TheOpenSawn && SawnIn[killerid] == 1 && SawnIn[playerid] == 1)
{
new string[256];
format(string, sizeof(string),".���� ���� ���� ����� %s", GetName(killerid));
SendClientMessageToAll(COLOR_LIGHTGREEN,string);
TogglePlayerControllable(TheJoinSawn,1);
TogglePlayerControllable(TheOpenSawn,1);
SawnIn[TheJoinSawn] =0;
SawnIn[TheOpenSawn] =0;
TheSawnStarted = 0;
TheJoinSawn = -1;
TheOpenSawn = -1;
SawnOn = 0;
return 1;
}
if(PlayerKills[playerid] > 4 ||PlayerKills[playerid] > 9 ||PlayerKills[playerid] > 14 ||PlayerKills[playerid] > 19 ||PlayerKills[playerid] > 24 ||PlayerKills[playerid] > 29 ||PlayerKills[playerid] > 34 ||PlayerKills[playerid] > 39 ||PlayerKills[playerid] > 44 ||PlayerKills[playerid] > 49)
{
if(killerid == INVALID_PLAYER_ID)
{
format(sts, sizeof(sts), ".������, ���� ���� ����, �� ���� ���, ��� �� ��� �� ��� ���� %s �����",GetName(playerid));
SendClientMessageToAll(COLOR_KHAKI, sts);
MoneyKillOnPlayer[playerid] =0,PlayerKills[playerid] =0;
}
else
{
format(sts, sizeof(sts), ".%s ��� �� ������ %s �����",GetName(playerid),GetName(killerid)),SendClientMessageToAll(COLOR_KHAKI, sts);
format(sts, sizeof(sts), "$%d :����� ��� ����� ���� ��",MoneyKillOnPlayer[playerid]),SendClientMessageToAll(COLOR_KHAKI, sts);
LACY_GiveMoney(killerid,MoneyKillOnPlayer[playerid]),MoneyKillOnPlayer[playerid] =0,PlayerKills[playerid] =0;
}
}
if(PlayerKills[killerid] == 5 ||PlayerKills[killerid] == 10 ||PlayerKills[killerid] == 15 ||PlayerKills[killerid] ==20 || PlayerKills[killerid] ==25 || PlayerKills[killerid] ==30 || PlayerKills[killerid] ==35 || PlayerKills[killerid] ==40 || PlayerKills[killerid] ==45 ||PlayerKills[killerid] == 50)
{
format(sts, sizeof(sts), ".%d ���� ���� ����� ���� � ,%s ���� �� ! �����",PlayerKills[killerid],GetName(killerid)),SendClientMessageToAll(COLOR_ORANGE, sts);
format(sts, sizeof(sts), "$%d����� ��� ����� ���� ���� �",MoneyKillOnPlayer[killerid]),SendClientMessageToAll(COLOR_ORANGE, sts);
}

if(InBike[playerid] > 0)
{
BikePlayers --;
InBike[playerid] =0;
new vehicleid = GetPlayerVehicleID(playerid);
SetPlayerVirtualWorld(playerid,0);
SetVehicleVirtualWorld(vehicleid,0);
SendClientMessage(playerid,red,".����� �������� ��� �����");
}

if(PChain[playerid] == 1)
{
ChaPlayers --; InCha[playerid] = 0; PChain[playerid] = 0;
}
OutDrift(playerid);


if(MonsterNoTeleportion[playerid] == 1)
{
MonsterPlayers --; iNmOnster[playerid] = 0; MonsterNoTeleportion[playerid] = 0; MonsterFucker[playerid] = 0;
DestroyVehicle(MonsterSYSTEM[playerid]);
MonStart[playerid] =0;
}
if(KK[playerid] == 1)
{
ResetPlayerWeapons(playerid);
SendClientMessage(playerid,COLOR_BRIGHTRED,".Kart .���� �� ������� ");
KartPlayers --; InKart[playerid] = 0; KK[playerid] = 0; Fuck[playerid] = 0;
DestroyVehicle(caridxx[playerid]);
}

if(PlayerInfo[killerid][Level] >3) return SetPlayerHealth(killerid,100.0),SendClientMessage(killerid,COLOR_LIGHTGREEN,".����� ��� ������ ��������� ���� ����� ����");

if(PlayerInfo[playerid][Level] > PlayerInfo[killerid][Level])
{
LACY_GiveMoney(killerid,3002);
SendClientMessage(killerid,COLOR_ORANGE,".����� 3002 ���� �� �� ����� ���� ���� ���� ���");
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
SendClientMessage(playerid,COLOR_BRIGHTRED,".���� �� ������� ��� �����");
ResetPlayerWeapons(playerid);
WarPlayersw --; InWarw[playerid] = 0; PPw[playerid] = 0;
}
if(PP[playerid] == 1)
{
ResetPlayerWeapons(playerid);
SendClientMessage(playerid,COLOR_BRIGHTRED,".���� �� ������� ��� �����");
WarPlayers --;
InWar[playerid] = 0;
PP[playerid] = 0;
}
if(PPr[playerid] == 1)
{
ResetPlayerWeapons(playerid);
SendClientMessage(playerid,COLOR_BRIGHTRED,".���� �� ������� ��� �����");
WarPlayersr --; InWarr[playerid] = 0; PPr[playerid] = 0;
}

if(TheWeed[playerid] ==1)
{
new string[256];
LACY_GiveMoney(killerid,3002);
format(string, sizeof(string), "!!! ``%s`` :������ %s`s :���� �� ����� ���� !!! ���� ������",GetName(killerid),GetName(playerid)),SendClientMessage(playerid, COLOR_BROWN, string);
TheWeed[playerid] =0;
}
SetTimerEx("FakeKills",13*1000,0,"i",playerid);
SetPlayerVirtualWorld(playerid,0);
InLcTeleport[playerid] = 0;
HpModeA[playerid] = 0;
DolpYou[playerid] =0;
SharkYou[playerid] =0;
TorYou[playerid] =0;
NoForSell[playerid] =0;
Stoned[playerid] =0;
ThePetsInYou[playerid] =0;
InShamal[playerid] = 0;
mini[playerid] = 0;
FakeKill[playerid] += 1;
PlayerKills[playerid] = 0;
dini_IntSet(GetPlayerFile(killerid),"Kills",PlayerInfo[killerid][Kills]);
return 1;
}

forward FakeKills(playerid);
public FakeKills(playerid)return FakeKill[playerid] =0;


forward KickFake();
public KickFake()
{
fnm
if(FakeKill[i] > 2)
{
new str[256];
FakeKill[i] =0;
SendClientMessage(i,red,"FakeKill Hack. ����� ����� �'�� ������ ����, �'�� ����");
SendClientMessage(i,red,".��� ���� �����,����� �� ����� ���� ����, �� ����� ������ �����");
format(str, sizeof(str), "[AntiCheat] %s has been kicked for using FakeKill Hack." , GetName(i));
SendClientMessageToAll(red , str);
Kick(i);
}
}
return 1;
}
public OnPlayerSpawn(playerid)
{
if(InDM[playerid] == 1)
{
new Randm = random(sizeof(DMPostion));
SetPlayerPos(playerid, DMPostion[Randm][0], DMPostion[Randm][1], DMPostion[Randm][2]);
InDM[playerid] = 1;
SendClientMessage(playerid,COLOR_LIGHTGREEN,"/qdmz - .����� ������ ��-�� ���� �����, �� ��� ����");
SetPlayerVirtualWorld(playerid,2);
SetPlayerColor(playerid,sgba2hex(random(256),random(256),random(256),55));//��� ����
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

if(PlayerInfo[playerid][Sawn] > 0)
{
GivePlayerWeapon(playerid,26,PlayerInfo[playerid][Sawn]);
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
if(PlayerInfo[playerid][MP5] > 0)
{
GivePlayerWeapon(playerid,29,PlayerInfo[playerid][Knife]);
}
if(PlayerInfo[playerid][AK47] > 0)
{
GivePlayerWeapon(playerid,30,PlayerInfo[playerid][Knife]);
}
if(PlayerInfo[playerid][Knife] > 0)
{
GivePlayerWeapon(playerid,4,PlayerInfo[playerid][Knife]);
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
if(PlayerInfo[playerid][Colt] > 0)
{
GivePlayerWeapon(playerid,22,PlayerInfo[playerid][Colt]);
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
if(PlayerInfo[playerid][armourT] > 0) {
SetPlayerArmour(playerid,100);
}
//=[CarSystem]================
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
//=[FixAntion]=========
LACY_GiveMoney(playerid,650);
ClearAnimations(playerid);
SetPlayerColor(playerid,sgba2hex(random(256),random(256),random(256),55));//��� ����
//TextDrawHideForPlayer(playerid, Box1);
//TextDrawHideForPlayer(playerid, Box2);
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
SendClientMessageToAll(COLOR_WHITE,"[________ ���� ������� - �������� ________]");
format(fuxm, sizeof(fuxm), ".$3000 ���� ���� ��������, ��� ����� ���� �� �,%s",GetName(playerid)),SendClientMessageToAll(0xE21E1EFF, fuxm);
SendClientMessageToAll(COLOR_WHITE,".-------------------------------------");
BikeOn = 0;
BikePlayers = 0;

for(new i=0; i<MAX_PLAYERS; i++)
{
if(InBike[i] > 0)
{
SendClientMessage(i, red, ".����� ������, �� ���� ��� ��� ����.");
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
format(string,sizeof(string),".���� ����� ������ ������ ����� ������ %s",GetName(playerid));
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
SendClientMessage(playerid,COLOR_ORANGE,"!���� ����� ������ ������ ��������");
new vehicleid = GetPlayerVehicleID(playerid);
SetPlayerVirtualWorld(playerid,0);
SetVehicleVirtualWorld(vehicleid,0);
LACY_GiveMoney(playerid,3000);
RunSystemend =0;
RunPlayers=0;
RunSystemon=0;
CPTriatlon[playerid]=0;
SendClientMessageToAll(COLOR_WHITE,"[________ ���� ������� - �������� ________]");
format(fuxm, sizeof(fuxm), ".$3000 ���� ���� ��������, ��� ����� ���� �� �,%s",GetName(playerid)),SendClientMessageToAll(0xE21E1EFF, fuxm);
SendClientMessageToAll(COLOR_WHITE,".-------------------------------------");

for(new i=0; i<MAX_PLAYERS; i++)
{
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
SendClientMessageToAll(COLOR_WHITE,"[________ ���� ������� - �������  ________]");
format(fuxm, sizeof(fuxm), ".$3000 ���� ���� ��������, ��� ����� ���� �� �,%s",GetName(playerid)),SendClientMessageToAll(0xE21E1EFF, fuxm);
SendClientMessageToAll(COLOR_WHITE,".-------------------------------------");

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
format(string,sizeof(string),".���� ����� ������, ����� ����� ���� ����� %s",GetName(playerid));
SendClientMessageToAll(COLOR_ORANGE,string);
WinnerRace ++;
RacePlayers --;
if(RacePlayers == 0)
{
SendClientMessageToAll(red,"������ ������ ������, �� ��� ���� ������ ����� ���� / ������ �� ������ �����");
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
SendClientMessageToAll(red,"������ ������ ������, �� ��� ���� ������ ����� ���� / ������ �� ������ �����");
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
format(string,sizeof(string),".���� ����� ���� ������, ����� ������ %s",GetName(playerid));
SendClientMessageToAll(COLOR_ORANGE,string);
WinnerRace ++;
RacePlayers --;
return 1;
}
if(WinnerRace == 3)
{
if(RacePlayers == 0)
{
SendClientMessageToAll(red,"������ ������ ������, �� ��� ���� ������ ����� ���� / ������ �� ������ �����");
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
format(string,sizeof(string),".���� ����� ������, ������ ������ %s",GetName(playerid));
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
return 1;
}
public OnPlayerEnterCheckpoint(playerid)
{


if(CPS_IsPlayerInCheckpoint(playerid,pickupammu)) return SetPlayerPos(playerid,290.4897,-84.4233,1001.5156),SetPlayerInterior(playerid,4),ResetPlayerWeapons(playerid);

if(CPS_IsPlayerInCheckpoint(playerid,be)) return SetPlayerPos(playerid,2144.0793,1612.3879,993.6882),SetPlayerInterior(playerid,1),ResetPlayerWeapons(playerid);
if(CPS_IsPlayerInCheckpoint(playerid,nobank))return SetPlayerPos(playerid,1424.9977,-2285.6335,13.3828),SetPlayerInterior(playerid,0);
if(CPS_IsPlayerInCheckpoint(playerid,Wang))return SellWangExportVehicle(playerid);

if(CPS_IsPlayerInCheckpoint(playerid,bcp)){

SendClientMessage(playerid, COLOR_PINK,  ".-���� ����: ���� �� , ���� ���� ���� ����� �� ���� ���");
SendClientMessage(playerid, COLOR_PINK,  ".���� ������ , ����� ����� ����� ���� ���� ���� ����� ���� �����");
SendClientMessage(playerid, COLOR_PURPLE,":������ ���");
SendClientMessage(playerid, 0xF6F658FF,  "/deposit [amount] /depositall /withdraw [amount] /balance /bankid [playerid] [amount]");
SendClientMessage(playerid, 0xF6F658FF,  "/getloan (4) [amount] /backloan (4)");
SendClientMessage(playerid,0xF6F658FF,   "/help bank :����� ����� �� ����");
SendClientMessage(playerid, COLOR_PURPLE,":������ ����� �����");
SendClientMessage(playerid, 0xF6F658FF,  "/buycc (3) /sellcc (3) /withdrawc (3) [amount]");
SendClientMessage(playerid, 0xF6F658FF,  "/help cc :����� ����� �� ����� ������");
if(PlayerInfo[playerid][GetAloan] ==1) {
new string[256];
format(string, sizeof(string),"%d :���� �� , ��� ���� ���� ���� ��",PlayerInfo[playerid][MoneyLoan]),SendClientMessage(playerid,red,string),SendClientMessage(playerid,red,".�� �� ����� �� ���� ������ ���� /backloan ������ ����");
}
}

new string[256];
new ownplayer[MAX_PLAYER_NAME];
switch(getCheckpointType(playerid))
{
case CP_PIRATE:
{
SendClientMessage(playerid,0xF6F658FF, "!�� ��� ������ �������� ����� ���� ���� ���� ���");
}
case CP_AMMU:
{
SendClientMessage(playerid, COLOR_WHITE,".--  Ammutions (31) - ����� ����� --");
SendClientMessage(playerid, COLOR_PINK,"���� ����� �����");
SendClientMessage(playerid, COLOR_PINK,".����� �� ������ ������ ����� ����� ������ ������ ���� ���� �����");
SendClientMessage(playerid, COLOR_LIGHTGREEN,":������ ����� ���");
SendClientMessage(playerid, 0xF6F658FF,"/buyweapon - ����� ��� (/bw) - ����� [number weapon] /weaponlist - ����� ����� (/wl) - �����");
SendClientMessage(playerid,COLOR_LIGHTGREEN,":�����");
SendClientMessage(playerid,0xF6F658FF,"/buyarmour - ����� ���");
}
}
if(getCheckpointType(playerid)>= P_OFFSET) {
SendClientMessage(playerid,COLOR_WHITE,"--. ����� ����� ������ --");
format(string, sizeof(string), "./Buy ����� ������ %s ��� ���� ����� �� ", propertyNames[playerCheckpoint[playerid]-P_OFFSET], propertyValues[playerCheckpoint[playerid]-P_OFFSET]);
SendClientMessage(playerid, 0xF6F658FF, string);
format(string, sizeof(string), ".$%d ���� ���� ", propertyValues[playerCheckpoint[playerid]-P_OFFSET]);
SendClientMessage(playerid, 0xF6F658FF, string);
format(string, sizeof(string), ".$%d ��� ������ ��� ��� ", propertyEarnings[playerCheckpoint[playerid]-P_OFFSET]);
SendClientMessage(playerid, 0xF6F658FF, string);


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
SetPlayerPos(playerid,2090.9502,1680.0479,10.8203);
SetPlayerFacingAngle(playerid, 91.1674);
SetPlayerCameraPos(playerid,2078.6106,1678.6727,10.8203);
SetPlayerCameraLookAt(playerid,2090.9502,1680.0479,10.8203);




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
if(Frozen[playerid] == 1) return  SendClientMessage(playerid,COLOR_WHITE,".��� ���� ���� �����, ������ ��� ���� �� ����� ������"),0;
if(!dini_Exists(GetPlayerFile(playerid))) {
format(str, sizeof(str), "/Register [Pass] <> :���� �� ����/� �� ������ ������",0);
SendClientMessage(playerid, COLOR_WHITE , str);
spawnloged[playerid] =1;
return 0;
}
else if(dini_Exists(GetPlayerFile(playerid)) && PlayerInfo[playerid][Logged] == 0)
{
format(str, sizeof(str), "/login [Pass] <> :���� �� �����/� ������ ������",0);
SendClientMessage(playerid, COLOR_WHITE, str);
spawnloged[playerid] =1;
return 0;
}
CamreaRandom ++;
SetPlayerMapIcon( playerid, 1, 2057.5842, 843.3260, 6.7031, 53, 0 );//race
SetPlayerMapIcon( playerid, 3, 2001.6742, 1544.2804, 13.5859, 9, 0 );//ship
SetPlayerMapIcon( playerid, 7, 1618.8290,-238.6926,14.1484, 5, 0 );//airport
SetPlayerMapIcon( playerid, 8, 2323.6238, 1425.8101, 42.8203, 55, 0 );//drifts
SetPlayerMapIcon( playerid, 9, 2386.9690, 1043.2112, 10.8203, 27, 0 );//garage
SetPlayerMapIcon( playerid, 10, 2507.1418, 1243.0775, 10.8203, 23, 0 );//club
SetPlayerMapIcon( playerid, 4, -2715.9399, 217.8603, 4.3481, 27, 0 );//����
SetPlayerMapIcon( playerid, 5, 2387.1956, 1050.5073, 10.3850, 27, 0 );//����
SetPlayerMapIcon( playerid, 6, 2646.3372, -2038.0317, 13.1468, 27, 0 );//����
SetTimerEx("CafolMoneyGemel",54*60*1000,1,"i",playerid);
if(CamreaRandom == 3) return CamreaRandom = 1;
return 1;
}
//-=-=-=-=-=-=-=-=-=-=-=-
public GameModeExitFunc()
{
fnm
GameModeExit();
SaveFiles();
KillTimer(CheckPointTimer);
//==[Dis]====
Frozen[i] =0;
NoMoreObject[i] =0;
Frozen[i] = 0;
FakeKill[i] = 0;
//=[ESC]==========================================================
gState[i] = e_STATE_NONE;
//=[UnZibori]======================================================
NoForSell[i] =0;
//=[SetVirtualWorldCAR]=============================================
new vehicleid = GetPlayerVehicleID(i);
SetPlayerVirtualWorld(i,0);
SetVehicleVirtualWorld(vehicleid,0);
//=[UnIgnoreDisconecet]=========================================
Ignore[i][i] =0;
//=[InLcTeleport`s]===============================================
InLcTeleport[i] = 0;
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
//=[CarSystem`s]========================================================
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
SendClientMessage(i,COLOR_BRIGHTRED,".���� �� ������� ��� �����");
ResetPlayerWeapons(i);
WarPlayersw --; InWarw[i] = 0; PPw[i] = 0;
}
//=[OutSystem`s]================================================================
if(PP[i] == 1)
{
ResetPlayerWeapons(i);
SendClientMessage(i,COLOR_BRIGHTRED,".���� �� ������� ��� �����");
WarPlayers --;
InWar[i] = 0;
PP[i] = 0;
}
//=[OutSystem`s]================================================================
if(PPr[i] == 1)
{
ResetPlayerWeapons(i);
SendClientMessage(i,COLOR_BRIGHTRED,".���� �� ������� ��� �����");
WarPlayersr --; InWarr[i] = 0; PPr[i] = 0;
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
SendClientMessage(i,COLOR_BRIGHTRED,".Kart .���� �� ������� ");
KartPlayers --; InKart[i] = 0; KK[i] = 0; Fuck[i] = 0;
DestroyVehicle(caridxx[i]);
}
//=[LeaveGange`s]====================================================
PlayerLeaveGang(i);
//=[Prop]=============================================================
for(new prop = 0; prop < MAX_PROPERTIES; prop++)
{
if(propertyOwner[prop]==i)
{
propertyOwner[prop] = 999;
LACY_GiveMoney(i, propertyValues[prop]);
}
}
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
		format(file,sizeof(file),"CarSys/car%d.txt",car);
		if(!dini_Exists(file))
		{
			dini_Create(file); CreateCount++;
		    dini_IntSet(file,"CarID",car);
		    dini_Set(file,"CarName",VehNames[GetVehicleModel(car)-400] );
		    dini_IntSet(file,"CarModel",GetVehicleModel(car));
		    dini_IntSet(file,"CarOwned",0);
		    dini_Set(file,"CarOwner","���");
		    dini_IntSet(file,"CarLocked",0);
		    dini_IntSet(file,"Buyable",1);
		    dini_IntSet(file,"Price",50000);
	


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
VehicleInfo[car][CarID] = dini_Int(file,"CarID");
strmid(VehicleInfo[car][CarName], dini_Get(file,"CarName"), 0, strlen(dini_Get(file,"CarName")), 255);
VehicleInfo[car][CarModel] = dini_Int(file,"CarModel");
VehicleInfo[car][CarOwned] = dini_Int(file,"CarOwned");
strmid(VehicleInfo[car][CarOwner], dini_Get(file,"CarOwner"), 0, strlen(dini_Get(file,"CarOwner")), 255);
VehicleInfo[car][CarLocked] = dini_Int(file,"CarLocked");
VehicleInfo[car][Buyable] = dini_Int(file,"Buyable");
VehicleInfo[car][Price] = dini_Int(file,"Price");
VehicleInfo[car][SetPrice] = dini_Int(file,"SetPrice");

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
format(file,sizeof(file),"CarSys/car%d.txt",car);
if(dini_Exists(file))
{
dini_IntSet(file,"CarOwned",VehicleInfo[car][CarOwned]);
if(VehicleInfo[car][CarOwned] == 0) dini_Set(file,"CarOwner","���");
if(VehicleInfo[car][CarOwned] == 1) dini_Set(file,"CarOwner",VehicleInfo[car][CarOwner]);
dini_IntSet(file,"CarLocked",VehicleInfo[car][CarLocked]);
dini_IntSet(file,"Buyable",VehicleInfo[car][Buyable]);
dini_IntSet(file,"Price",VehicleInfo[car][Price]);
dini_IntSet(file,"SetPrice",VehicleInfo[car][SetPrice]);
}
}
}
//ENDCAR===
//-=-=-=-=-=-=-
#define MAX_STREAM_OBJECTS 400

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
SetTimer("StartFireworks",3000,1);
SetTimer("Xinfo",30*60*1000,1);
//=[Resert]================================================
CamreaRandom = 1;
/*
//=[TextDraw]================================================
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
*/

//=[Timer`s]=================================================
SetTimer("AntiGamebling",3000,1);
SetTimer("BoomPlayer",1000,1);
SetTimer("KickFake",1000,1);
SetTimer("Msc",60*60*1000,1);
SetTimer("AntiMinigun",10*1000,1);
SetTimer("AntiBaz",10*1000,1);
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
SetTimer("Rfb",8*1000,1);
SetTimer("PetAtacks",1000,1);
//SetTimer("AutoChangeHN", 2000, 1);
#if MONEY_CHEAT_USE
SetTimer("moneycheat_check", MONEY_CHEAT_TIMER, 1);
#endif
SendRconCommand("hostname Satla-Zone.co.il - Official DeathMatch.");
SendRconCommand("mapname Of The World");
SetGameModeText("Fear Age Blind");
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
//drifts:
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
AddStaticVehicle(522,-2346.7271,536.5531,76.9873,342.7768,6,25); //Darkoff
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
AddStaticVehicle(437,-2446.9626,2240.6790,4.9573,0.8033,105,80); // /bustrip
AddStaticVehicle(437,-2440.9917,2240.7529,4.9324,0.1807,98,80); // /bustripcar
AddStaticVehicle(437,-2458.7395,2226.5779,4.9937,180.6802,95,16); // /bustripcar
AddStaticVehicle(437,-2464.6602,2226.4697,4.9936,180.5578,87,7); // /bustripcar
AddStaticVehicle(437,-2470.7017,2226.5051,4.9432,180.2185,79,7); // /bustripcar
AddStaticVehicle(431,-2482.5310,2226.5181,4.9540,180.0431,75,59); // /bustripcar
AddStaticVehicle(538,2864.7500,1285.0447,11.2473,0.0000,1,71);
//ship(`goat`):
//=[OtherCar`s]========================================================================
AddStaticVehicle(448,2103.2952,943.2202,10.4132,93.8372,3,6); // PizzaBoy Near RACE
AddStaticVehicle(448,2134.1360,881.7591,10.1374,87.8575,3,6); // PizzaBoy Near RACE
AddStaticVehicle(522,2623.8169,1139.7377,10.3963,271.0921,51,118); // NRG-500
AddStaticVehicle(522,-317.4746,1516.2584,74.9275,179.9636,51,118); // NRG-500 "/Dj"
AddStaticVehicle(531,-1199.3906,1818.3378,41.6854,223.7911,36,2); // Tracktor
AddStaticVehicle(571,-1564.7216,1044.2661,6.4714,359.9944,40,35); // KART SF
AddStaticVehicle(448,-1805.5404,942.7126,24.4869,126.4897,3,6); // PIZZA BOY
//=ParkPet
//
//CreateStreamObject(1634,1563.422729 -2473.558594 13.852005,0,0,0,500);

//=[ObjectStreamers]====================================================================
//Other:
ship = CreateStreamObject(8493, 1863.307739, 1529.444336, 24.975296, 0.0000, 0.0000, 0.0002,60);
//=[Gatebank]=============================================================
gateb = CreateStreamObject(2634,2144.19,1627.1,994.257,0,0,180,120);
NM=CreateStreamObject(980, -1631.239014, 688.460999, 8.960892, 0.0000, 0.0000, 0.0000,40);
CreateStreamObject(3749, -1631.145264, 690.084778, 12.045915, 0.0000, 0.0000, 0.0000,40);
CreateStreamObject(16644, -1619.892334, 688.130066, 7.689290, 0.0000, 89.3814, 270.0000,40);
NM3=CreateStreamObject(971, -1577.179688, 684.275208, 6.282418, 270.6186, 358.2811, 358.2811,40);
CreateStreamObject(14781, -1589.629028, 715.761902, -5.151838, 0.0000, 0.0000, 0.0000,40);
CreateStreamObject(13666, -1592.541748, 662.792175, 11.142825, 0.0000, 0.0000, 270.0000,40);
CreateStreamObject(13666, -1598.787598, 659.334961, 11.217824, 0.0000, 0.0000, 270.0000,40);
CreateStreamObject(1985, -1616.201172, 685.939331, 9.425713, 0.0000, 1.7189, 0.0000,40);
CreateStreamObject(1985, -1616.094360, 682.443420, 9.370386, 0.0000, 1.7189, 0.0000,40);
CreateStreamObject(3524, -1625.608887, 687.415283, 9.072840, 0.0000, 0.0000, 0.0000,40);
CreateStreamObject(3524, -1637.083374, 687.572144, 9.072840, 0.0000, 0.0000, 0.0000,40);
CreateStreamObject(3528, -1631.391479, 686.343811, 13.831614, 0.0000, 0.0000, 268.3585,40);
CreateStreamObject(7392, -1641.831909, 662.980408, 16.782578, 0.0000, 0.0000, 0.0000,40);
CreateStreamObject(16776, -1612.322266, 686.556396, 18.097059, 0.0000, 0.0000, 270.0000,40);
CreateStreamObject(1736, -1619.028198, 681.595520, 9.108944, 0.0000, 0.0000, 271.7962,40);
CreateStreamObject(1828, -1629.600586, 752.204590, -3.726486, 0.0000, 87.6625, 268.2038,40);
CreateStreamObject(15035, -1607.328247, 675.498230, -6.239571, 0.0000, 0.0000, 90.0001,40);
CreateStreamObject(3279, -1577.332520, 651.162415, 6.263117, 0.0000, 0.0000, 180.0000,40);
CreateStreamObject(3458, -1621.263916, 648.561401, 7.709030, 0.0000, 0.0000, 0.0000,40);
CreateStreamObject(6986, -1635.552124, 687.257080, 29.554007, 0.0000, 0.0000, 270.0000,40);
CreateStreamObject(2755, -1599.007324, 679.434326, 12.685430, 0.0000, 0.0000, 0.0000,40);
CreateStreamObject(8148, -1652.482422, 646.338074, 12.763819, 0.0000, 0.0000, 270.0000,40);
CreateStreamObject(8148, -1625.950928, 646.551575, 10.226589, 347.9679, 0.0000, 270.0000,40);
CreateStreamObject(987, -1705.791382, 657.738647, 23.890625, 0.0000, 0.0000, 270.0000,40);
CreateStreamObject(987, -1705.775879, 669.714233, 23.890625, 0.0000, 0.0000, 270.0000,40);
CreateStreamObject(987, -1705.793579, 681.602844, 23.890625, 0.0000, 0.0000, 270.0000,40);
CreateStreamObject(987, -1705.868286, 693.531921, 23.965624, 0.0000, 0.0000, 270.0000,40);
CreateStreamObject(987, -1705.887573, 705.498474, 23.890625, 0.0000, 0.0000, 270.0000,40);
CreateStreamObject(987, -1706.107056, 717.503235, 23.890625, 0.0000, 0.0000, 270.0000,40);
CreateStreamObject(987, -1694.173218, 717.415771, 23.890623, 0.0000, 0.0000, 180.0000,40);
CreateStreamObject(987, -1571.979614, 645.199890, 9.662750, 0.0000, 0.0000, 90.0000,40);
CreateStreamObject(987, -1571.886108, 666.101990, 9.712734, 0.0000, 0.0000, 90.0000,40);
NM2=CreateStreamObject(971, -1571.610718, 661.513611, 9.732433, 1.7189, 0.8594, 90.0000,40);
CreateStreamObject(987, -1571.940308, 677.999939, 9.712734, 0.0000, 0.0000, 90.0000,40);
CreateStreamObject(16644, -1694.918823, 713.458069, 28.217402, 85.0842, 0.0000, 270.0000,40);
CreateStreamObject(16644, -1687.431641, 720.511108, 28.097942, 89.3814, 94.5380, 263.1245,40);
CreateStreamObject(16644, -1672.124146, 719.989014, 26.034750, 89.3814, 94.5380, 263.1245,40);

//8+35 = ? 40 + 3 = 43
//=ClanMN

NMV1= AddStaticVehicle(522,-1639.2577,652.1746,6.7589,2.1706,0,1); //
NMV2= AddStaticVehicle(522,-1634.5737,652.1436,6.7589,359.3677,1,0); //
NMV3= AddStaticVehicle(451,-1628.6317,652.2854,6.8957,1.1672,0,0); //
NMV4= AddStaticVehicle(451,-1622.5601,651.7823,6.8941,2.2558,6,6); //
NMV5= AddStaticVehicle(411,-1616.5658,651.8086,6.9146,359.3723,112,1); //
NMV6= AddStaticVehicle(411,-1610.7786,652.3542,6.9146,4.4812,1,1); //
NMV7= AddStaticVehicle(469,-1594.2052,681.6939,17.1757,268.4785,1,1); //
NMV8= AddStaticVehicle(487,-1679.9657,706.3080,30.7776,90.4453,0,1); //
AddStaticPickup(1240,2, -1617.5990,735.3182,-5.2422);
AddStaticPickup(1242,2, -1617.4402,733.1266,-5.2422);
AddStaticPickup(356,2, -1617.7433,730.9692,-5.2422);
AddStaticPickup(372,2, -1617.7860,729.7377,-5.2422);
//[AkaweNight]
/*
CreateObject(354,2129.2793,1683.7761,27.4865,0.0000, 0.0000, 0.0000);
CreateObject(354,2099.1665,1677.7268,18.7263,0.0000, 0.0000, 0.0000);
CreateObject(354,2099.4441,1686.4625,18.7263,0.0000, 0.0000, 0.0000);
CreateObject(354,2109.6616,1683.6853,18.7263,0.0000, 0.0000, 0.0000);
CreateObject(354,2097.7207,1682.5708,20.6284,0.0000, 0.0000, 0.0000);
CreateObject(354,2093.2234,1685.1309,20.8484,0.0000, 0.0000, 0.0000);
CreateObject(354,2096.5210,1672.7938,21.5326,0.0000, 0.0000, 0.0000);
CreateObject(354,2104.1108,1672.5490,21.5326,0.0000, 0.0000, 0.0000);
*/
/*
//=[ViP]================================================================
CreateStreamObject(8172, -2.291197, 1573.730469, 25.235550, 0.0000, 268.8998, 90.0000, 500);
CreateStreamObject(8171, 64.815948, 1529.180908, 23.607761, 0.0000, 270.6186, 0.0000, 500);
CreateStreamObject(8171, -71.842140, 1523.223267, 25.886797, 0.0000, 91.1002, 0.0000, 500);
CreateStreamObject(8171, -24.839172, 1461.307861, 26.066355, 0.0000, 272.3375, 270.0000, 500);
CreateStreamObject(3749, 54.174911, 1459.897095, 18.782730, 0.0000, 0.0000, 0.0000, 500);
CreateStreamObject(980, 54.145416, 1460.681519, 15.746822, 0.0000, 0.0000, 180.0000, 500);
CreateStreamObject(3499, -13.117184, 1573.632324, 36.654724, 0.0000, 343.6707, 359.1406, 500);
CreateStreamObject(3499, -9.880372, 1573.435791, 26.214943, 0.0000, 341.9518, 358.2811, 500);
CreateStreamObject(3499, -5.860335, 1573.837769, 25.952940, 0.0000, 24.0642, 0.0000, 500);
CreateStreamObject(3499, -1.674980, 1573.637817, 36.090759, 0.0000, 20.6265, 356.5623, 500);
CreateStreamObject(3499, 11.881859, 1573.859253, 24.837389, 0.0000, 0.0000, 0.0000, 500);
CreateStreamObject(3499, 11.865444, 1573.647705, 35.849205, 0.0000, 0.0000, 0.0000, 500);
CreateStreamObject(3499, 26.342867, 1573.871948, 24.171310, 0.0000, 0.0000, 0.0000, 500);
CreateStreamObject(3499, 26.310228, 1573.660156, 35.204441, 0.0000, 0.0000, 0.0000, 500);
CreateStreamObject(3499, 31.752815, 1573.691284, 31.354481, 0.0000, 88.5219, 0.0000, 500);
CreateStreamObject(3499, 31.388290, 1573.553101, 40.537567, 0.0000, 88.5219, 0.0000, 500);
CreateStreamObject(3499, 37.518379, 1573.638916, 36.310085, 0.0000, 356.5623, 0.0000, 500);
CreateStreamObject(3438, 11.606258, 1573.409302, 48.996704, 0.0000, 359.1406, 270.6186, 500);
CreateStreamObject(3472, -77.766808, 1522.957153, 29.218779, 0.0000, 91.9597, 0.0000, 500);
CreateStreamObject(3472, -8.404146, 1456.364258, 26.772947, 279.2130, 0.0000, 359.1406, 500);
CreateStreamObject(3528, 64.893326, 1486.432983, 33.662514, 0.0000, 0.0000, 168.7500, 500);
CreateStreamObject(3528, 64.908669, 1551.091919, 35.083618, 0.0000, 0.0000, 168.7500, 500);
CreateStreamObject(3528, -71.732590, 1486.699219, 34.480267, 0.0000, 0.0000, 0.0000, 500);
CreateStreamObject(3528, -71.721413, 1554.912109, 34.211903, 0.0000, 0.0000, 0.0000, 500);
CreateStreamObject(3528, -39.399704, 1461.101196, 34.017406, 0.0000, 0.0000, 90.0000, 500);
CreateStreamObject(3528, 21.811314, 1461.031860, 35.717033, 0.0000, 0.0000, 78.7500, 500);
CreateStreamObject(6865, 11.492750, 1573.379150, 46.370136, 0.0000, 0.0000, 33.7500, 500);
CreateStreamObject(7073, -61.916271, 1565.482544, 37.969872, 0.0000, 0.0000, 315.0000, 500);
CreateStreamObject(7392, 64.278671, 1522.171021, 36.824490, 0.0000, 0.0000, 0.0000, 500);
CreateStreamObject(7916, -57.514637, 1550.590088, 21.737492, 0.0000, 2.5783, 47.6557, 500);
CreateStreamObject(8483, 56.594845, 1565.941284, 18.131325, 0.0000, 0.0000, 225.0000, 500);
CreateStreamObject(8483, -63.970612, 1471.119507, 17.692839, 0.0000, 0.0000, 33.7500, 500);
CreateStreamObject(8253, -58.133842, 1519.566895, 15.677788, 0.0000, 0.0000, 0.0000, 500);
CreateStreamObject(972, -48.465031, 1517.434326, 10.671898, 0.0000, 0.0000, 0.0000, 500);
CreateStreamObject(16093, -52.382675, 1511.988647, 11.455915, 0.0000, 0.0000, 180.0000, 500);
CreateStreamObject(3819, -65.892624, 1528.128052, 12.747758, 0.0000, 347.1084, 87.6536, 500);
CreateStreamObject(14791, -65.358505, 1520.375488, 13.795061, 0.0000, 0.0000, 90.0000, 500);
CreateStreamObject(3819, -64.626823, 1511.890503, 12.747758, 0.0000, 0.0000, 270.0000, 500);
CreateStreamObject(1240, -53.539787, 1529.304688, 11.946065, 0.0000, 0.0000, 0.0000, 500);
CreateStreamObject(1242, -58.325867, 1528.990356, 11.977450, 0.0000, 0.0000, 0.0000, 500);
CreateStreamObject(2036, -57.656189, 1525.097656, 11.783926, 0.0000, 0.0000, 0.0000, 500);
CreateStreamObject(2035, -53.632629, 1525.536987, 11.774437, 0.0000, 0.0000, 0.0000, 500);
CreateStreamObject(3439, -44.980873, 1533.346436, 15.863350, 0.0000, 0.0000, 0.0000, 500);
CreateStreamObject(3439, -44.323421, 1505.885254, 15.863350, 0.0000, 0.0000, 0.0000, 500);
CreateStreamObject(8841, 64.689659, 1531.405396, 15.238568, 0.0000, 0.0000, 90.0000, 500);
CreateStreamObject(8841, 64.690445, 1500.350220, 15.311060, 0.0000, 0.0000, 90.0000, 500);
*/
//=[LoadConfig]=========================================================
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


public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
new PlayerName[100];
GetPlayerName(playerid,PlayerName,30);
new msg[256];
if(VehicleInfo[vehicleid][CarOwned] == 1)
{
if(strcmp(PlayerName,VehicleInfo[vehicleid][CarOwner],true) == 0)
{
format(msg,sizeof(msg),".%s ,��� [%s] - ���� ��� ���� �",VehicleInfo[vehicleid][CarOwner],VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
SendClientMessage(playerid,0x33CCFFAA,msg);
}
else
{
format(msg,sizeof(msg),".���� �� ���� ������ %s ��� �� ���� ������ [%s]",VehicleInfo[vehicleid][CarOwner],VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
SendClientMessage(playerid,0x33CCFFAA,msg);
}
}
else
{
if(VehicleInfo[vehicleid][Buyable] == 1)
{
format(msg,sizeof(msg),"[$%d] - ���� ������ ����� �� � [%s] ���� �� , ��� �� ����",VehicleInfo[vehicleid][Price], VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
SendClientMessage(playerid,0xF6F658FF,msg);
SendClientMessage(playerid,0xF6F658FF,"/Car - :������ �� ��� �� ����/�");
}
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
if(Ignore[recieverid][playerid] == 1)return SendClientMessage(playerid,COLOR_BRIGHTRED,"[IgnorePms] !����� ���� ��� ���� ����� ����� ��� ����"),0;
if(cancelpm[recieverid] == 1) return SendClientMessage(playerid,red,"[BlockPms] .���� �� ��� �� ������� ����� �� ������ ������"),0;
if(antispam[playerid] ==1) return SendClientMessage(playerid,COLOR_BRIGHTRED,"[Anti-Spam] ����� ����� ��� �� 2 ����� !!! "),0;
if(GetPlayerMoney(playerid) < 10) return SendClientMessage(playerid,COLOR_WHITE,".��� �� ����� ��� ����"),0;
antispam[playerid] ++;



new str[256],str2[256];

format(str,sizeof(str),"[PM] to %s [%d]: %s ",GetName(recieverid),recieverid,text);
SendClientMessage(playerid,COLOR_LIGHTBLUE,str);
format(str2,sizeof(str2),"[PM] from: %s [%d]: %s ",GetName(playerid),playerid,text);
SendClientMessage(recieverid,0x0F482FF,str2);

if ((text[0] != '!' && text[0] != '@') && strfind(text, "213.8.26.132:2007", true)!=-1 || strfind(text, "195.189.140.155:7007", true)!=-1 || strfind(text, "80.179.149.110:1234", true)!=-1 || strfind(text, "213.8.26.132:7003", true)!=-1 || strfind(text, "www.top-games.co.il", true)!=-1 || strfind(text, "213.8.26.132:5555", true)!=-1
|| strfind(text, "62.90.136.233:7777", true)!=-1 || strfind(text, "82.80.245.35:7777", true)!=-1 || strfind(text, "195.189.140.50:7002", true)!=-1){
SendClientMessage(playerid,red," !���� ��� �� ������� ��� �����");
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
SendClientMessage(Drifter,COLOR_ORANGE,"/drift help ����� ������ �����, �� ��� ������ ���/� ������ ����� ����");
}
}
return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{

if(InBike[playerid] > 0)
{
BikePlayers --;
InBike[playerid] =0;
SetPlayerVirtualWorld(playerid,0);
SetVehicleVirtualWorld(vehicleid,0);
return 1;
}
OutDrift(playerid);
if(MonsterNoTeleportion[playerid] == 1) {
MonsterPlayers --; iNmOnster[playerid] = 0; MonsterNoTeleportion[playerid] = 0; MonsterFucker[playerid] = 0;
DestroyVehicle(MonsterSYSTEM[playerid]);
if(IsPlayerInAnyVehicle(playerid))
{
RemovePlayerFromVehicle(playerid);
SetTimerEx("repairbug",5000,0,"i",playerid);
}
if(!IsPlayerInAnyVehicle(playerid))
{
SetTimerEx("repairbug",5000,0,"i",playerid);
}
MonStart[playerid] =0;
}
if(KK[playerid] == 1)
{
ResetPlayerWeapons(playerid);
SendClientMessage(playerid,COLOR_BRIGHTRED,".Kart .���� �� ������� ");
KartPlayers --; InKart[playerid] = 0; KK[playerid] = 0; Fuck[playerid] = 0;
DestroyVehicle(caridxx[playerid]);
if(IsPlayerInAnyVehicle(playerid))
{
RemovePlayerFromVehicle(playerid);
SetTimerEx("repairbug",5000,0,"i",playerid);
}
if(!IsPlayerInAnyVehicle(playerid))
{
SetTimerEx("repairbug",5000,0,"i",playerid);
}
return 1;
}
NoForSell[playerid] =0;
if(Youregisterrace[playerid] ==1){
Youregisterrace[playerid] =0;
DisablePlayerRaceCheckpoint(playerid);
RacePlayers--;
if(IsPlayerInAnyVehicle(playerid))
{
RemovePlayerFromVehicle(playerid);
SetTimerEx("repairbug",5000,0,"i",playerid);
}
if(!IsPlayerInAnyVehicle(playerid))
{
SetTimerEx("repairbug",5000,0,"i",playerid);
}
SetPlayerVirtualWorld(playerid,0);
SetVehicleVirtualWorld(vehicleid,0);
}
if(YouRegister[playerid] ==1){
YouRegister[playerid] =0;
DisablePlayerRaceCheckpoint(playerid);
DriftPlayer--;
if(IsPlayerInAnyVehicle(playerid))
{
RemovePlayerFromVehicle(playerid);
SetTimerEx("repairbug",5000,0,"i",playerid);
}
if(!IsPlayerInAnyVehicle(playerid))
{
SetTimerEx("repairbug",5000,0,"i",playerid);
}
}
return 1;
}
forward repairbug(playerid);
public repairbug(playerid) return SpawnPlayer(playerid);

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
SendClientMessage(playerid,0xFF0000AA,"[AntiShoot] - .��� ����� �� ����� ����� �����");
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
SendClientMessage(playerid,red,"[AntiShoot] - .��� ��, ��� �� ���� ����� ������� �������. ����� ��� ����� ������ �� ����");
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
SendClientMessage(playerid,0xFF0000AA,"[AntiShoot] - .��� ����� �� ����� ����");
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
}
return 1;
}

forward Rfb();
public Rfb() {
for(new i;i<MAX_PLAYERS;i++)
{
aDoing[i] = 0;
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
format(str, sizeof(str), ".``%d`` ���� �� �����" , text);
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
SendClientMessage(playerid,WHITE, "(USAGE: dd/mm/yyyy) :����� ���� �� ���� ��� ���");
return 0;
}
new check = year - strval(DateInfo[2]);
if(check == year)
{
SendClientMessage(playerid,WHITE, "(USAGE: dd/mm/yyyy) :����� ���� �� ���� ��� ���");
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
format(string, sizeof(string), "[%d] ����� �� ��� ��",PlayerInfo[playerid][AggInfo]);
SendClientMessage(playerid, 0x0F482FF, string);
SendClientMessage(playerid,COLOR_PINK, ".��� ���� ���� ����� ��'��");
Sagebir[playerid] =0;
return 0;
}

if(text[0] == '@')
{
if (CellState[playerid]==ESTA_HABLANDO)
{
new msg[255];
new pName2[MAX_PLAYER_NAME];
GetPlayerName(playerid,pName2,sizeof(pName2));
format(msg,sizeof(msg),"(%s): %s",pName2,text);
AlTelefono(AuxiliarTel[playerid],msg);
format(msg,sizeof(msg),"[Phone]: %s",text);
SendClientMessage(playerid,COLOR_LIGHTGREEN,msg);
new Float:x1,Float:y1,Float:z1;
if  (DIST!=-1)
for (new i=0;i<MAX_PLAYERS;i++)
{
if(GDTP(i,x1,y1,z1)<DIST)
{
SendClientMessage(i,0xF6F658FF,msg);
}
}
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
format(string, sizeof(string),"%s: %s", senderName, gangChat);
for(new i = 0; i < gangInfo[playerGang[playerid]][1]; i++)
{
SendClientMessage(gangMembers[playerGang[playerid]][i], COLOR_LIGHTBLUE, string);
}
return 0;
}
return 0;
}
if(Frozen[playerid] == 1) return SendClientMessage(playerid,COLOR_WHITE,"��� ����/� �������, ������ ���� �� ����� ������ ���� ������ ������"),0;
if(antispam[playerid] ==1) return SendClientMessage(playerid,COLOR_BRIGHTRED,"[AntiSpam]  �� ����� ��� �� 2 �����!!!"),0;
antispam[playerid] ++;
if(NoChat[playerid] ==1) return SendClientMessage(playerid,COLOR_BRIGHTRED,".��� ���� ����� ���� ������ �� ��� ����� ��'��"),0;

if ((text[0] != '!' && text[0] != '@') && strfind(text, "213.8.26.132:2007", true)!=-1 || strfind(text, "195.189.140.155:7007", true)!=-1 || strfind(text, "80.179.149.110:1234", true)!=-1 || strfind(text, "213.8.26.132:7003", true)!=-1 || strfind(text, "www.top-games.co.il", true)!=-1 || strfind(text, "213.8.26.132:5555", true)!=-1
|| strfind(text, "62.90.136.233:7777", true)!=-1 || strfind(text, "82.80.245.35:7777", true)!=-1 || strfind(text, "195.189.140.50:7002", true)!=-1){
spamkick[playerid] ++;
if(spamkick[playerid]  ==1) return SendClientMessage(playerid,COLOR_BRIGHTRED,"BAN - ����� ��� ���� ����� ���"),0;
Ban(playerid);
//if(spamkick[playerid]  ==3) return SendClientMessage(playerid,COLOR_BRIGHTRED,".����� ����� 2/3 ��� ��� 1 ���� ��� �����"),0;
//if(spamkick[playerid]  ==2) return SendClientMessage(playerid,COLOR_BRIGHTRED,"����� ����� 1/3 ��� ������ ���� ���"),0;
//if(spamkick[playerid]  ==4) return SendClientMessage(playerid,COLOR_BRIGHTRED,"����� ��� ����� ��� ����� �� ������"),0,TogglePlayerControllable(playerid,0),Kick(playerid);
return 0;
}
if ((text[0] != '!' && text[0] != '@') && strfind(text, "vgames", true)!=-1 || strfind(text, "7 0 0 3", true)!=-1 || strfind(text, "6666", true)!=-1 || strfind(text, "7777", true)!=-1 || strfind(text, "/q", true)!=-1 || strfind(text, "8888", true)!=-1
|| strfind(text, "fxp", true)!=-1 || strfind(text, "7007", true)!=-1 || strfind(text, "2007", true)!=-1)
{
spamkick[playerid] ++;
if(spamkick[playerid]  ==1) return SendClientMessage(playerid,COLOR_BRIGHTRED,"Warning - ����� ����� �� ���� �� ����"),0;
if(spamkick[playerid]  ==3) return SendClientMessage(playerid,COLOR_BRIGHTRED,".����� ����� 2/3 ��� ��� 1 ���� ��� �����"),0;
if(spamkick[playerid]  ==2) return SendClientMessage(playerid,COLOR_BRIGHTRED,"����� ����� 1/3 ��� ������ ���� ���"),0;
if(spamkick[playerid]  ==4) return SendClientMessage(playerid,COLOR_BRIGHTRED,"����� ��� ����� ��� ����� �� ������"),0,TogglePlayerControllable(playerid,0);

return 0;
}






new ntext[256];
{
format(ntext, 256, "[%d] %s" ,playerid,text);
SendPlayerMessageToAll(playerid, ntext);
}
return 0;
}





forward TimeUpdate();
public TimeUpdate() {
new string[256];
new n = random(MAX_WANGEXPORTVEHICLES);

format(string, sizeof(string),"*** .�� ����� �� ��� �� ����� ���� ��� %s's ,���� ����� ���� ���� ***", wantedWangExportVehicleNames[n]);
SendClientMessageToAll(0xF6F658FF, string);

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
new string[256];
SendClientMessageToAll(COLOR_WHITE,"[_____________���� - ������ ������_____________]");
SendClientMessageToAll(0xF6F658FF, "! ����� ����� ���� ������, ������ ������");
format(string,sizeof(string),".$10,000 :��� ����� ����� ����� ��");
SendClientMessageToAll(0xF6F658FF,string);
SendClientMessageToAll(0x0F6A0FF, "/Rpg :�� ��� 60 ����� ������, �������� ����");
SendClientMessageToAll(COLOR_WHITE,".---------------------------------");
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
SendClientMessageToAll(COLOR_WHITE,"[______________!���� ������ - ���______________]");
format(string,sizeof(string)," %d :��' �������",WarPlayersr),SendClientMessageToAll(0xE21E1EFF,string);
format(string,sizeof(string)," $10,000 :���� ����� ����� �� ��� ������� ���"),SendClientMessageToAll(0xE21E1EFF,string);
SendClientMessageToAll(COLOR_WHITE,".--------------------------------------");
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
SendClientMessageToAll(red, ".����� ���� ���� ���� ������ ���� ���� �-3");
SendClientMessageToAll(red, ".�� ���� ������ ���� ����� ��� 500 ����");


WarOnr = 0; WarPlayersr = 0;
for(new i;i<MAX_PLAYERS;i++)
{
InWarr[i] = 0;  PPr[i] = 0; WSr = 0; knoobr = 0;
SendClientMessage(i,COLOR_ORANGE,".����� ����� ��� [500] ���� �� ����: ���� ������� �����");
LACY_GiveMoney(i,500);
KillTimer(CheckTimer);
}
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

SendClientMessageToAll(COLOR_WHITE,"[________ ���� ����� - ���� ________]");
format(fuxm, sizeof(fuxm), ".$3000 ���� ���� �����, ���� ���� ��� ��� ���� �� �,%s",GetName(WarWinnerr)),SendClientMessageToAll(0xE21E1EFF, fuxm);
format(fuxm, sizeof(fuxm), ".%d ���� ������� ��� ���� �����",PlayerInfo[WarWinnerr][RPGS]),SendClientMessageToAll(0xE21E1EFF, fuxm);
SendClientMessageToAll(COLOR_WHITE,".-------------------------------------");
//TogglePlayerControllable(KartWinner, 1);

WarOnr = 0; WarPlayersr = 0;
LACY_GiveMoney(WarWinnerr, 3000);
SetPlayerHealth(WarWinnerr, 100.0);
TogglePlayerControllable(WarWinnerr, 1);
//SetTimer("weaponanti",3000,1);
for(new i;i<MAX_PLAYERS;i++)
{
WSr = 0; PPr[i] = 0; knoobr = 0;
if(InWarr[i] == 1)
{
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
if(pickupid == Weed[0] || Weed[1] || Weed[2] || Weed[3] || Weed[4] && PlayerInfo[playerid][Level] >= 1)
{
new string[256];
PlayerInfo[playerid][Weeds] ++;
format(str, sizeof(str), "/help weed :���� ��� ���� ���� ���� ������� %d/10 :����� �� ������ ", PlayerInfo[playerid][Weeds]);
SendClientMessage(playerid, COLOR_WHITE, str);
format(string, sizeof(string), ".���/� ��� ���� ,%s �����/��",GetName(playerid)),SendClientMessage(playerid, COLOR_WHITE, string);
}
else
{
SendClientMessage(playerid,red,"!�� ������ ��� 1 ����� ������ ����� ���� ����");
return 0;
}
return 0;
}









//==================================WarStart====================================
forward WarStart();
public WarStart()
{
new string[256];
MoneyWinnerWar +=500;
SendClientMessageToAll(COLOR_WHITE,"[_____________���� - ����� �������_____________]");
SendClientMessageToAll(0xF6F658FF, "! ����� ����� ���� ������, ������ ������");
format(string,sizeof(string),".$%d :��� ����� ����� ����� ��",MoneyWinnerWar);
SendClientMessageToAll(0xF6F658FF,string);
SendClientMessageToAll(0x0F6A0FF, "/War :�� ��� 60 ����� ������, �������� ����");
SendClientMessageToAll(COLOR_WHITE,".---------------------------------");

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
for(new i;i<MAX_PLAYERS;i++)
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


SendClientMessageToAll(COLOR_WHITE,"[______________!���� ����� ������� - ���______________]");
format(string,sizeof(string)," %d :��' �������",WarPlayers),SendClientMessageToAll(0xE21E1EFF,string);
format(string,sizeof(string)," $%d:���� ����� ����� �� ��� ������� ���",MoneyWinnerWar),SendClientMessageToAll(0xE21E1EFF,string);
SendClientMessageToAll(COLOR_WHITE,".--------------------------------------");



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
SendClientMessageToAll(red, ".����� ���� ���� ���� ������ ���� ���� �-3");
SendClientMessageToAll(red, ".�� ���� ������ ���� ����� ��� 500 ����");


WarOn = 0; WarPlayers = 0;
KillTimer(CTP);
KillTimer(SAS);
for(new i;i<MAX_PLAYERS;i++)
{
InWar[i] = 0;  PP[i] = 0; WS = 0; knoob = 0;
InWar[i] = 0;  PP[i] = 0; WS = 0; knoob = 0;
if(PP[i] == 1)
{
SendClientMessage(i,COLOR_ORANGE,".����� ����� ��� [500] ���� �� ����: ���� ������� �����");
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

SendClientMessageToAll(COLOR_WHITE,"[________ ���� ����� ������� - ���� ________]");
format(fuxm, sizeof(fuxm), ".$%d ���� ���� ������,����� ���� ��� ��� ���� �� �,%s",MoneyWinnerWar,GetName(WarWinner)),SendClientMessageToAll(0xE21E1EFF, fuxm);
format(fuxm, sizeof(fuxm), ".%d :���� ������� ��� ������� �������� ��",PlayerInfo[WarWinner][Wars]),SendClientMessageToAll(0xE21E1EFF, fuxm);
SendClientMessageToAll(COLOR_WHITE,".-------------------------------------");
SetPlayerPos(WarWinner,2144.1472,1634.6127,993.5761);
SetPlayerInterior(WarWinner,1);
SendClientMessage(WarWinner,COLOR_LIGHTBLUE,".����� �������� ����");
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
format(knob, sizeof(knob), ".���� �� ������� \"%s\" ������ ", Adminname);
SendClientMessageToAll(COLOR_PINK, knob);
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
SendClientMessageToAll(COLOR_WHITE,"[_____________���� - ������� ������_____________]");
SendClientMessageToAll(0xF6F658FF, "! ����� ����� ���� ������, ������ ������");
format(string,sizeof(string),".$%d :��� ����� ����� ����� ��",MoneyWinnerMini);
SendClientMessageToAll(0xF6F658FF,string);
SendClientMessageToAll(0x0F6A0FF, "/Mini :�� ��� 60 ����� ������, �������� ����");
SendClientMessageToAll(COLOR_WHITE,".---------------------------------");
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
for(new i;i<MAX_PLAYERS;i++)
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
SendClientMessageToAll(COLOR_WHITE,"[______________!���� ������� - ���______________]");
format(string,sizeof(string)," %d :��' �������",WarPlayersw),SendClientMessageToAll(0xE21E1EFF,string);
format(string,sizeof(string)," $%d:���� ����� ����� �� ��� ������� ���",MoneyWinnerMini),SendClientMessageToAll(0xE21E1EFF,string);
SendClientMessageToAll(COLOR_WHITE,".--------------------------------------");


for(new i;i<MAX_PLAYERS;i++)
{
if(InWarw[i] == 1)
{
ResetPlayerWeapons(i);

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
SendClientMessageToAll(red, ".����� ���� ���� ���� ������ ���� ���� �-3");
SendClientMessageToAll(red, ".�� ���� ������ ���� ����� ��� 500 ����");


WarOnw = 0; WarPlayersw = 0;
KillTimer(CTPw);
KillTimer(SASw);
for(new i;i<MAX_PLAYERS;i++)
{
if(InWarw[i] == 1)
{
ResetPlayerWeapons(i);
InWarw[i] = 0;  PPw[i] = 0; WSw= 0; knoobw = 0;
SendClientMessage(i,COLOR_ORANGE,".����� ����� ��� [500] ���� �� ����: ���� ������� �����");
LACY_GiveMoney(i,500);
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
SendClientMessageToAll(COLOR_WHITE,"[________ ���� ������� - ���� ________]");
format(fuxm, sizeof(fuxm), ".$%d ���� ���� �������, ���� ����� ���� ��� ��� ���� ��,%s",MoneyWinnerMini,GetName(WarWinnerw)),SendClientMessageToAll(0xE21E1EFF, fuxm);
format(fuxm, sizeof(fuxm), ".%d :���� ������� ��� ������� �������� ��",PlayerInfo[WarWinnerw][MINIGUN]),SendClientMessageToAll(0xE21E1EFF, fuxm);
SendClientMessageToAll(COLOR_WHITE,".-------------------------------------");

SetPlayerPos(WarWinnerw,2144.1472,1634.6127,993.5761);
SetPlayerInterior(WarWinnerw,1);
MoneyWinnerMini=0;

TogglePlayerControllable(WarWinnerw, 1);
WarOnw = 0; WarPlayersw = 0;
for(new i;i<MAX_PLAYERS;i++)
{
WSw = 0;  knoobw = 0;
if(InWarw[i] == 1)
{
ResetPlayerWeapons(i);
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
for(new i;i<MAX_PLAYERS;i++)
{
if(IsPlayerConnected(i))
{

if (PlayerInfo[i][Level] == 0 && PlayerInfo[i][Kills] >= 100)
{
PlayerInfo[i][Level] +=1;

SetPlayerWantedLevel(i,1);
SendClientMessage(i,COLOR_LIGHTBLUE," ����� ��� ��� 1 ");
format(string, sizeof(string), ".[%d] ���/� ���� %s", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_LIGHTGREEN, string);
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
SendClientMessage(i,COLOR_LIGHTBLUE," ����� ��� ��� 2 ");
format(string, sizeof(string), "~~~  %d ���/� ���� ����  %s �����/�� ~~~", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_LIGHTGREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "����� ���� ���");
PlayerInfo[i][aLevelnl]=3;
PlayerInfo[i][aKillsnl]=200;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

}
if (PlayerInfo[i][Level] == 2 && PlayerInfo[i][Kills] >= 500)
{
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,3);
SendClientMessage(i,COLOR_LIGHTBLUE," ����� ��� ��� 3 ");
format(string, sizeof(string), "~~~  %d ���/� ���� ����  %s �����/�� ~~~", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_LIGHTGREEN, string);
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
SendClientMessage(i,COLOR_LIGHTBLUE," ����� ��� ��� 4 ");
format(string, sizeof(string), "~~~  %d ���/� ���� ����  %s �����/�� ~~~", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_LIGHTGREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "���� ����� ����� ���");
PlayerInfo[i][aLevelnl]=5;
PlayerInfo[i][aKillsnl]=300;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

}
if (PlayerInfo[i][Level] == 4 && PlayerInfo[i][Kills] >= 1000) {
PlayerInfo[i][Level] +=1;
PlayerInfo[i][VIPS]++;
SetPlayerWantedLevel(i,5);
SendClientMessage(i,COLOR_LIGHTBLUE," ��� ����� ��� 5");
format(string, sizeof(string), " !%d :ViP ��� ����  %s", PlayerInfo[i][VIPS], GetName(i));
SendClientMessageToAll(COLOR_LIGHTGREEN, string);
format(string, sizeof(string), "~~~  %d ���/� ���� ����  %s �����/�� ~~~", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_LIGHTGREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
PlayerInfo[i][aLevelnl]=6;
PlayerInfo[i][aKillsnl]=300;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

}

if (PlayerInfo[i][Level] == 5 && PlayerInfo[i][Kills] >= 1300) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,6);
SendClientMessage(i,COLOR_LIGHTBLUE,"��� ����� ��� 6");
format(string, sizeof(string), "~~~  %d ���/� ���� ����  %s �����/�� ~~~", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_LIGHTGREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "��� ����");
PlayerInfo[i][aLevelnl]=7;
PlayerInfo[i][aKillsnl]=300;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);


}
if (PlayerInfo[i][Level] == 6 && PlayerInfo[i][Kills] >= 1600) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,7);
SendClientMessage(i,COLOR_LIGHTBLUE," ��� ����� ��� 7 ");
format(string, sizeof(string), "~~~  %d ���/� ���� ����  %s �����/�� ~~~", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_LIGHTGREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
PlayerInfo[i][aLevelnl]=8;
PlayerInfo[i][aKillsnl]=100;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

}
if (PlayerInfo[i][Level] == 7 && PlayerInfo[i][Kills] >= 1700) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,8);
SendClientMessage(i,COLOR_LIGHTBLUE," ����� ��� ��� 8");
format(string, sizeof(string), "~~~  %d ���/� ���� ����  %s �����/�� ~~~", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_LIGHTGREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "���� ���� ���");
PlayerInfo[i][aLevelnl]=9;
PlayerInfo[i][aKillsnl]=200;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

}
if (PlayerInfo[i][Level] == 8 && PlayerInfo[i][Kills] >= 1900) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,9);
SendClientMessage(i,COLOR_LIGHTBLUE,"����� ��� ��� 9 ");
format(string, sizeof(string), "~~~  %d ���/� ���� ����  %s �����/�� ~~~", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_LIGHTGREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
PlayerInfo[i][VIPS]++;
format(string, sizeof(string), " !%d :ViP ��� ����  %s", PlayerInfo[i][VIPS], GetName(i));
SendClientMessage(i, COLOR_LIGHTGREEN, string);
PlayerInfo[i][aLevelnl]=10;
PlayerInfo[i][aKillsnl]=200;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

}
if (PlayerInfo[i][Level] == 9 && PlayerInfo[i][Kills] >= 2100) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
SendClientMessage(i,COLOR_LIGHTBLUE," ����� ��� ��� 10");
format(string, sizeof(string), "~~~  %d ���/� ���� ����  %s �����/�� ~~~", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_LIGHTGREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "���� �������");
PlayerInfo[i][aLevelnl]=11;
PlayerInfo[i][aKillsnl]=400;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

}
if (PlayerInfo[i][Level] == 10 && PlayerInfo[i][Kills] >= 2500) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
SendClientMessage(i,COLOR_LIGHTBLUE," ����� ��� ��� 11");
format(string, sizeof(string), "~~~  %d ���/� ���� ����  %s �����/�� ~~~", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_LIGHTGREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "����� �� ����");
PlayerInfo[i][aLevelnl]=12;
PlayerInfo[i][aKillsnl]=500;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

}
if (PlayerInfo[i][Level] == 11 && PlayerInfo[i][Kills] >= 3000) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
SendClientMessage(i,COLOR_LIGHTBLUE," ����� ��� ��� 12");
format(string, sizeof(string), "~~~  %d ���/� ���� ����  %s �����/�� ~~~", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_LIGHTGREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "�����");
PlayerInfo[i][aLevelnl]=13;
PlayerInfo[i][aKillsnl]=600;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

}
if (PlayerInfo[i][Level] == 12 && PlayerInfo[i][Kills] >= 3600) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
SendClientMessage(i,COLOR_LIGHTBLUE," ����� ��� ��� 13");
format(string, sizeof(string), "%d ��� ���� %s", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_LIGHTGREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "���� ����");
PlayerInfo[i][aLevelnl]=14;
PlayerInfo[i][aKillsnl]=400;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

}
if (PlayerInfo[i][Level] == 13 && PlayerInfo[i][Kills] >= 4000) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
SendClientMessage(i,COLOR_LIGHTBLUE," ����� ��� ��� 14");
format(string, sizeof(string), "~~~  %d ���/� ���� ����  %s �����/�� ~~~", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_LIGHTGREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "�� ����� �� ���� ���");
PlayerInfo[i][VIPS]++;
format(string, sizeof(string), " !%d :ViP ��� ����  %s", PlayerInfo[i][VIPS], GetName(i));
SendClientMessageToAll(COLOR_LIGHTGREEN, string);
PlayerInfo[i][aLevelnl]=15;
PlayerInfo[i][aKillsnl]=600;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

}
if (PlayerInfo[i][Level] == 14 && PlayerInfo[i][Kills] >= 4600) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
SendClientMessage(i,COLOR_LIGHTBLUE," ����� ��� ��� 15");
format(string, sizeof(string), "~~~  %d ���/� ���� ����  %s �����/�� ~~~", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_LIGHTGREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "��� �����");
PlayerInfo[i][aLevelnl]=16;
PlayerInfo[i][aKillsnl]=500;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);
}
if (PlayerInfo[i][Level] == 15 && PlayerInfo[i][Kills] >= 5100) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
SendClientMessage(i,COLOR_LIGHTBLUE," ����� ��� ��� 16");
format(string, sizeof(string), "~~~  %d ���/� ���� ����  %s �����/�� ~~~", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_LIGHTGREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "�'����� ����");
PlayerInfo[i][aLevelnl]=17;
PlayerInfo[i][aKillsnl]=1000;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

}
if (PlayerInfo[i][Level] == 16 && PlayerInfo[i][Kills] >= 6100) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
SendClientMessage(i,COLOR_LIGHTBLUE," ����� ��� ��� 17");
format(string, sizeof(string), "~~~  %d ���/� ���� ����  %s �����/�� ~~~", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_LIGHTGREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", "�������� �� �������� ����");
PlayerInfo[i][aLevelnl]=18;
PlayerInfo[i][aKillsnl]=1000;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);

}
if (PlayerInfo[i][Level] == 17 && PlayerInfo[i][Kills] >= 7100) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
SendClientMessage(i,COLOR_LIGHTBLUE," ����� ��� ��� 18");
format(string, sizeof(string), "~~~  %d ���/� ���� ����  %s �����/�� ~~~", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_LIGHTGREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag", ":D");
PlayerInfo[i][VIPS]++;
format(string, sizeof(string), " !%d :ViP ��� ����  %s", PlayerInfo[i][VIPS], GetName(i));
SendClientMessage(i, COLOR_LIGHTGREEN, string);
PlayerInfo[i][aLevelnl]=19;
PlayerInfo[i][aKillsnl]=1000;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);
}
if (PlayerInfo[i][Level] == 18 && PlayerInfo[i][Kills] >= 8100) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
SendClientMessage(i,COLOR_LIGHTBLUE," ����� ��� ��� 19");
format(string, sizeof(string), "~~~  %d ���/� ���� ����  %s �����/�� ~~~", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_LIGHTGREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag","���� �� ���� �����");
PlayerInfo[i][aLevelnl]=20;
PlayerInfo[i][aKillsnl]=1000;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);


}
if (PlayerInfo[i][Level] == 19 && PlayerInfo[i][Kills] >= 9100) {
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
SendClientMessage(i,COLOR_LIGHTBLUE," ����� ��� ��� 20");
format(string, sizeof(string), "~~~  %d ���/� ���� ����  %s �����/�� ~~~", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_LIGHTGREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag","���� �� ���� �����++");
PlayerInfo[i][aLevelnl]=21;
PlayerInfo[i][aKillsnl]=1000;
dini_IntSet(GetPlayerFile(i), "aKillsnl", PlayerInfo[i][aKillsnl]);
dini_IntSet(GetPlayerFile(i), "aLevelnl", PlayerInfo[i][aLevelnl]);
}
if (PlayerInfo[i][Level] == 20 && PlayerInfo[i][Kills] >= 9100)
{
PlayerInfo[i][Level] +=1;
SetPlayerWantedLevel(i,10);
SendClientMessage(i,COLOR_LIGHTBLUE," ����� ��� ��� 21");
format(string, sizeof(string), "~~~  %d ���/� ���� ����  %s �����/�� ~~~", PlayerInfo[i][Level], GetName(i));
SendClientMessageToAll(COLOR_LIGHTGREEN, string);
dini_IntSet(GetPlayerFile(i), "Level", PlayerInfo[i][Level]);
dini_Set(GetPlayerFile(i), "Tag",".�����, ����� �����. ��� ���� ����");
}
}
}
return 1;
}

//=[OnPlayerS]==============================================================
forward OnPlayerStateChange(playerid, newstate, oldstate);
public OnPlayerStateChange(playerid, newstate, oldstate)
{
new msg[256];
new car = GetPlayerVehicleID(playerid);
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
if (PlayerInfo[playerid][Level] < 0 && PlayerInfo[playerid][Kills] < 151)
{
SendClientMessage(playerid,COLOR_WHITE," ���� 1 �����Hydra ���� �");
RemovePlayerFromVehicle(playerid);
}
}
 if(newstate == PLAYER_STATE_DRIVER && GetVehicleModel(GetPlayerVehicleID(playerid)) == 425)
{
if (PlayerInfo[playerid][Level] < 0 && PlayerInfo[playerid][Kills] < 151)
{
SendClientMessage(playerid,COLOR_WHITE," ���� 1 �����Hunter ����");
RemovePlayerFromVehicle(playerid);
}
}
if(newstate == PLAYER_STATE_DRIVER && GetVehicleModel(GetPlayerVehicleID(playerid)) == 538)
{
if (PlayerInfo[playerid][AdminsLevel] >= 10)
{
new string[256];
SendClientMessageToAll(COLOR_WHITE,"[________________ * - /Survival - ����� ����� ������� ________________]");
format(string, sizeof(string), "!����� �� ���� �������� , %s ������ ",GetName(playerid)),SendClientMessage(playerid, COLOR_PINK, string);
SendClientMessageToAll(COLOR_PINK,"/Survival :���� ������ ����� ����� ������");
SendClientMessageToAll(COLOR_PINK,"[20,000] :����� ���� ����� ���� ��");
SendClientMessageToAll(COLOR_PINK,"www.Satla-Zone.co.il :�� ����� ������ ����� ������ ���� ������ ������");
SendClientMessageToAll(COLOR_WHITE,"[________________ * - /Survival - ����� ����� ������� ________________]");

}
else
{
SendClientMessage(playerid, COLOR_WHITE, ".���� �`�������` �������� ����");
RemovePlayerFromVehicle(playerid);
}
{
}
}
if(GetPlayerVehicleID(playerid) == zibro ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro2 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro3 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro4 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro5 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro6 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro7 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro8 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro9 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro10 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro11 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro12 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro13 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro14 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro15 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro16 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == zibro17 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori1 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori2 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori3 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori4 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori5) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori6 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori7 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori8 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori9 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori10 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori11 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori12 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori14 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori15 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori16 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;
if(GetPlayerVehicleID(playerid) == DriftZibori13 ) return format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,RED2,msg),NoForSell[playerid] =1;

if(GetPlayerVehicleID(playerid) == NMV1
|| GetPlayerVehicleID(playerid) == NMV2 ||
GetPlayerVehicleID(playerid) == NMV3 ||
GetPlayerVehicleID(playerid) == NMV4||
GetPlayerVehicleID(playerid) == NMV5||
GetPlayerVehicleID(playerid) == NMV6||
GetPlayerVehicleID(playerid) == NMV7 ||
GetPlayerVehicleID(playerid) == NMV8) return format(msg,sizeof(msg),".�� ���� ����� ����, ���� [NM] ���� ����� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]),SendClientMessage(playerid,COLOR_WHITE,msg),NoForSell[playerid] =1;



if(GetPlayerVehicleID(playerid) >= VCount) return 1;
if(newstate==PLAYER_STATE_DRIVER)
{
new PlayerName[100];
GetPlayerName(playerid,PlayerName,30);



if(VehicleInfo[car][CarOwned] == 1)
{
if(strcmp(PlayerName,VehicleInfo[car][CarOwner],true) == 0)
{
format(msg,sizeof(msg),"!%s ,��� [%s] - ���� ��� ���� �",VehicleInfo[car][CarOwner],VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
SendClientMessage(playerid,COLOR_ORANGE,msg);
}
else
{
format(msg,sizeof(msg),".���� �� ���� ������ %s ��� �� ���� ������ [%s]",VehicleInfo[car][CarOwner],VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
SendClientMessage(playerid,0x33CCFFAA,msg);
}
}
else
{
if(VehicleInfo[car][Buyable] == 1)
{
format(msg,sizeof(msg),"[$%d] - ���� ������ ����� �� � [%s] ���� �� , ��� �� ����",VehicleInfo[car][Price], VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
SendClientMessage(playerid,0xF6F658FF,msg);
SendClientMessage(playerid,0xF6F658FF,"/Car - :������ �� ��� �� ����/�");
}
}
}
if(VehicleInfo[car][Buyable] == 0)
{
format(msg,sizeof(msg),".������� ��� ���� ��� ������ ��� ���� ������� [%s] ��� �",VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
SendClientMessage(playerid,RED2,msg);
NoForSell[playerid] =1;
return 0;
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
format(string,256,".���� ����� �� ���� ��� �� ���� ����");
SendClientMessage(playerid,WHITE,string);
return 1;
}
if(Sell[playerid] == wantedWangExportVehicle) return SendClientMessage(playerid, 0x0C4E0FF, ".��� ���� ��� ���� ��");
new payment = (random(7)+1)*1000;
format(string, sizeof(string), ".``$%d`` ���� �� �� ���� ���� ����� ����� , �� ��� �� ����� �",payment);
SendClientMessage(playerid,red, string);
LACY_GiveMoney(playerid, payment);
SetVehicleToRespawn(GetPlayerVehicleID(playerid));
Sell[playerid] = wantedWangExportVehicle;
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
SendClientMessageToAll(COLOR_WHITE,"[_____________���� - ����� �������_____________]");
SendClientMessageToAll(0xF6F658FF, "! ����� ����� ���� �������, ��� �����: �������, ������ ������");
format(string,sizeof(string),".$3000:����� ���� ���� ���� ��");
SendClientMessageToAll(0xF6F658FF,string);
SendClientMessageToAll(0x0F6A0FF, "/races join :�� ��� 60 ����� ������, �������� ����");
SendClientMessageToAll(COLOR_WHITE,".---------------------------------");
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
SendClientMessageToAll(COLOR_WHITE,"[_____________���� - ����� �������_____________]");
SendClientMessageToAll(0xF6F658FF, "! ����� ����� ���� �������, ��� �����: ����� ������ ������");
format(string,sizeof(string),".$3000:����� ���� ���� ���� ��");
SendClientMessageToAll(0xF6F658FF,string);
SendClientMessageToAll(0x0F6A0FF, "/races join :�� ��� 60 ����� ������, �������� ����");
SendClientMessageToAll(COLOR_WHITE,".---------------------------------");
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
format(string,sizeof(string),"[Players: %d] if you want to do fun please doing /races join - (Race Type: Drift).",DriftPlayer);
SendClientMessageToAll(COLOR_WHITE,string);
}
else if(CountDrift == 15)
{
format(string,sizeof(string),"[Players: %d] if you want to do fun please doing /races join - (Race Type: Drift).",DriftPlayer);
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
format(string,sizeof(string),"[Players: %d] if you want to do fun please doing /races join - (Race Type: Car).",RacePlayers);
SendClientMessageToAll(COLOR_WHITE,string);
}
else if(CountingRace == 15)
{
format(string,sizeof(string),"[Players: %d] if you want to do fun please doing /races join - (Race Type: Car).",RacePlayers);
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
SendClientMessageToAll(COLOR_WHITE,"[_____________���� - ��������_____________]");
SendClientMessageToAll(0xF6F658FF, "! ����� ����� ������ ����,����,���������, ������ ������");
format(string,sizeof(string),".$3000:����� ���� ���� ���� ��");
SendClientMessageToAll(0xF6F658FF,string);
SendClientMessageToAll(0x0F6A0FF, "/Tria :�� ��� 60 ����� ������, �������� ����");
SendClientMessageToAll(COLOR_WHITE,".---------------------------------");
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
format(string,sizeof(string),"[Players: %d] if you want to do fun please doing /Tria - (Race Type: Run).",RunPlayers);
SendClientMessageToAll(COLOR_WHITE,string);
}
else if(CountingRun == 15)
{
format(string,sizeof(string),"[Players: %d] if you want to do fun please doing /Tria - (Race Type: Run).",RunPlayers);
SendClientMessageToAll(COLOR_WHITE,string);
}

new String[256];
format(String, 256,"~w~ %d",CountingRun);
for(new i = 0; i < MAX_PLAYERS; i++)
GameTextForAll(String,1000,1);
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
SendClientMessage(playerid,COLOR_BRIGHTRED,".����� ����");
else
SendClientMessage(playerid,COLOR_BRIGHTRED,".�� ����");
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
format(string,sizeof(string),"// %s's :����� ����� \r\n",GetName(playerid)); fwrite(f,string);
format(string,sizeof(string),"aKillsnl=%d\r\n",PlayerInfo[playerid][aKillsnl]); fwrite(f,string);
format(string,sizeof(string),"aLevelnl=%d\r\n",PlayerInfo[playerid][aLevelnl]); fwrite(f,string);
format(string,sizeof(string),"Organization=%s\r\n","None"); fwrite(f,string);
format(string,sizeof(string),"Clan=%s\r\n","None"); fwrite(f,string);
format(string,sizeof(string),"Password=%s\r\n",password); fwrite(f,string);
format(string,sizeof(string),"GemelLogin=%d\r\n",PlayerInfo[playerid][GemelLogin]); fwrite(f,string);
format(string,sizeof(string),"KopatGemel=%d\r\n",PlayerInfo[playerid][KopatGemel]); fwrite(f,string);
format(string,sizeof(string),"AggInfo=%d\r\n",PlayerInfo[playerid][AggInfo]); fwrite(f,string);
format(string,sizeof(string),"Level=%d\r\n",PlayerInfo[playerid][Level]); fwrite(f,string);
format(string,sizeof(string),"Tag=%s\r\n","���� �����"); fwrite(f,string);
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
format(string,sizeof(string),"CarID=%d\r\n",pia[playerid][CarID]); fwrite(f,string);
format(string,sizeof(string),"OwnCar=%d\r\n",pia[playerid][OwnCar]); fwrite(f,string);
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
pia[playerid][CarID] = dini_Int(GetPlayerFile(playerid),"CarID");
pia[playerid][OwnCar] = dini_Int(GetPlayerFile(playerid),"OwnCar");
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
new strings[256];
format(strings, sizeof(strings), ".�����/� ���� %s ", GetName(playerid));
SendClientMessageToAll(0x0F482FF, strings);

}
return 1;
}
//=[TeleCar`s]========================================
forward TeleCar(playerid);
public TeleCar(playerid)
{
new car = pia[playerid][CarID];
GetPlayerPos(playerid,Pos[playerid][0],Pos[playerid][1],Pos[playerid][2]);
SetPlayerCameraPos(playerid, Pos[playerid][0],Pos[playerid][1],Pos[playerid][2]);
SetPlayerCameraLookAt(playerid, Pos[playerid][0],Pos[playerid][1],Pos[playerid][2]);
SetVehiclePos(car,Pos[playerid][0],Pos[playerid][1],Pos[playerid][2]);
PutPlayerInVehicle(playerid,car,0);
GetVehicleZAngle(GetPlayerVehicleID(playerid), Angle[playerid]);
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

for(new i;i<MAX_PLAYERS;i++)
{
if(IsPlayerConnected(i))
{

if (PlayerInfo[i][Warnings] >=10)
{
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
//=[New`shiper]=============================================
new Countker;
new CountFucker;
//=[ShipSystem`s]============================================
forward Shiper();
public Shiper()
{
SendClientMessageToAll(COLOR_WHITE," [ ----- ����� ������� ����� ----- ]");
SendClientMessageToAll(COLOR_LIGHTBLUE,"/ship ����� �������� ����� ���� �30 ����� �� ��� ������");
SendClientMessageToAll(COLOR_LIGHTBLUE,".������ ���� ������ ����� ������ ����");
SendClientMessageToAll(COLOR_WHITE," [ ------------ ]");
shipworked=1;
Countker = 30; shipshipship(); CountFucker = 1;
SetTimer("Shiper1",30*1000,0);
return 1;
}
//=[UpShip]=====================================================
forward Shiper1();
public Shiper1()
{
MoveStreamObject(ship, 1863.319824, 1529.951660, 440.383423, 4); // UpGoat
SendClientMessageToAll(COLOR_WHITE,".����� �������� ������ ������");
SetTimer("Shiper2",20*1000,0);
shipworked=0;
return 1;
}
//=[DownShip]========================================================
forward Shiper2();
public Shiper2()
{
MoveStreamObject(ship,  1863.307739, 1529.444336, 24.975296, 8.6);// DownGoat
SendClientMessageToAll(COLOR_WHITE,".����� �������� ������ ����");
shipworked=0;
return 1;
}
//=[ShipCount]=======================================================
forward shipshipship();
public shipshipship()
{
if(Countker == 15)
{
SendClientMessageToAll(COLOR_WHITE, "/ship :���� 15 ����� ����� ������ ������� ����� ������ ������");
}
else if(Countker == 5)
{
SendClientMessageToAll(COLOR_WHITE, "/ship :���� 5 ����� ����� ������ ������� ����� ������ ��������");
}
new String[256];
format(String, 256,"/ship: ~r~ %d",Countker);
for(new i = 0; i < MAX_PLAYERS; i++)
GameTextForAll(String,1000,4);
if(Countker > 0)
{
--Countker;
SetTimer("shipshipship", 1000, 0);
}
else
{
if(CountFucker == 1)
{
if(knoobk == 1)
{
Countker = 3; shipshipship(); CountFucker = 2;
}
}
if(CountFucker == 2 && Countker <= 0)
{
}
}
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
format(string, sizeof(string),"%d :���� ���� ���� ��� ���� ������ ��� ���� ����� ��",PlayerInfo[i][MoneyLoan]),SendClientMessage(i,red,string),SendClientMessage(i,red,".���� �� ������ ��� ���� ���� �� ��� ���� �200 ����");
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
SendClientMessage(i,red,"������ ���� ����: ���� ������ ���� �-1");
RaceEnd =0;
WinnerRace=0;
RacePlayers=0;
IFraceOn=0;
if(Youregisterrace[i] ==1)
{
DisablePlayerRaceCheckpoint(i);
TogglePlayerControllable(i,1);
LACY_GiveMoney(i,500);
SendClientMessage(i,red,".����� ����� �� 500 ���� ���� ����� ������");
}
}
EndSytems= SetTimer("UnSystemRace",3000,1);
new string[256];
SendClientMessage(i,COLOR_WHITE,"[______________����� ������ - �������______________]");
format(string,sizeof(string)," %d :��' �������",RacePlayers),SendClientMessage(i,0xE21E1EFF,string);
SendClientMessage(i,0xE21E1EFF,"����� ���� ���� ����� �� 3000$");
SendClientMessage(i,COLOR_WHITE,".--------------------------------------");
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
SendClientMessage(i,red,".������ ���� ���� ��� ������ �� �������� ������� / �� ���� ������� ���� / ���� �������");
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
SendClientMessage(i,red,"������ ������� ���� ����: ���� ����� ������� ��� �-1");
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
SendClientMessage(i,red,".����� ����� �� 500 ���� ���� ����� ������");
}
}
UnSystems = SetTimer("UnSystem",3000,1);
new string[256];
TogglePlayerControllable(i,1);
DriftEnd=1;

SendClientMessage(i,COLOR_WHITE,"[______________����� ������ - �����______________]");
format(string,sizeof(string)," %d :��' �������",DriftPlayer),SendClientMessage(i,0xE21E1EFF,string);
SendClientMessage(i,0xE21E1EFF,"����� ���� ���� ����� �� 3000$");
SendClientMessage(i,COLOR_WHITE,".--------------------------------------");
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
SendClientMessage(i,red,".������ ���� ���� ����� �� ���� ���� ������-");
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
SendClientMessage(i, 0xFF0000AA, ".����� �������� ������ �� ���������");
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
SendClientMessage(i, 0xFF0000AA, ".����� �������� ������ �� ���������");
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
SendClientMessage(i, 0xFF0000AA, ".����� �������� ������ �� ���������");
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
SendClientMessage(i,COLOR_BRIGHTRED,".���� �� ������� ��� �����");
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
SendClientMessage(i,COLOR_BRIGHTRED,".���� �� ������� ��� �����");
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
SendClientMessage(i,COLOR_BRIGHTRED,".���� �� ������� ��� �����");
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
SendRconCommand("hostname Satla-Zone.co.il � Hard`s, DeatchMatch.");
SetGameModeText("DeatchMatch � World..");
return 1;
}
else if(changehn == 2)
{
changehn = 1;
SendRconCommand("hostname Satla-Zone.co.il � Isreal, DeatchMatch");
SetGameModeText("DeatchMatch � Zone.");
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
format(string, sizeof(string),".%d ����� ��� ������ �� ����� ������ �",PlayerInfo[playerid][GemelLogin]),SendClientMessage(playerid,0xF6F658FF,string);
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
SendClientMessage(playerid,red,"Money Hack. ����� ����� �'�� ������ ����, �'�� ����");
SendClientMessage(playerid,red,".��� ���� �����,����� �� ����� ���� ����, �� ����� ������ �����");
format(tmp, 256, "[AntiCheat] %s has been kicked for using %s", playername,str);
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
format(string,700,"[BanSystem]  (Time & Date: %s) (IP: %s) [Reason: %s]\r\n :������ ����� ����",tnd,ip,reason);
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
if(RunPlayers < 4)
{
SendClientMessage(i,red,".��������� ���� ���� ���� ������� ���� �-4");
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
SendClientMessage(i,COLOR_WHITE,"[______________����� ������ - ��������______________]");
format(string,sizeof(string)," %d :��' �������",RunPlayers),SendClientMessage(i,0xE21E1EFF,string);
format(string,sizeof(string),"����� ���� ���� ����� �� 3000$"),SendClientMessage(i,0xE21E1EFF,string);
SendClientMessage(i,COLOR_WHITE,".--------------------------------------");

TogglePlayerControllable(i,1);
RaceEnd=1;
}
return 1;
}


forward EndSystemTriatlon2();
public EndSystemTriatlon2()
{
if(RunSystemend ==0) return KillTimer(EndSystemTriatlon);
if(RunPlayers ==0)
{
for(new i=0; i<MAX_PLAYERS; i++)
{
SendClientMessage(i,red,".��������� ���� ���� ���� ������� ���� �-4");
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

//=[Karting`start]==============================================
forward KartStart();
public KartStart()
{
new string[256];
MoneyWinnerKart =1000;
SendClientMessageToAll(COLOR_WHITE,"[_____________���� - ��� ������_____________]");
SendClientMessageToAll(0xE21E1EFF, "! ����� ����� ���� ������, ������ ������");
format(string,sizeof(string),".$%d :��� ����� ����� ����� ��",MoneyWinnerKart);
SendClientMessageToAll(0xE21E1EFF,string);
SendClientMessageToAll(0x0F6A0FF, "/JoinKart :�� ��� 45 ����� ������,�������� ����");
SendClientMessageToAll(COLOR_WHITE,".---------------------------------");
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
SendClientMessageToAll(COLOR_WHITE,"[______________!���� ���� - ���______________]");
format(string,sizeof(string)," %d :��' �������",KartPlayers),SendClientMessageToAll(0xE21E1EFF,string);
format(string,sizeof(string)," $%d :���� ����� ����� �� ��� ������� ���",MoneyWinnerKart),SendClientMessageToAll(0xE21E1EFF,string);
SendClientMessageToAll(COLOR_WHITE,".--------------------------------------");
KS = 1;
for(new i;i<MAX_PLAYERS;i++)
{
if(InKart[i] == 1)
{
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
for(new i;i<MAX_PLAYERS;i++)
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
for(new i;i<MAX_PLAYERS;i++)
{
GetPlayerPos(i,p[0],p[1],p[2]);
if(KK[i] == 1 && p[2] <  34.0)
{
KartPlayers --; InKart[i] = 0; KK[i] = 0;
//SetPlayerPos(i,-2599.8259,1096.2352,57.1251);
SendClientMessage(i,COLOR_BRIGHTRED,".Kart - .���� �� ������� ");
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
GameTextForAll("~r~Kart ~p~Start", 3000, 0);
Fuck[i] = 1;
} } }



forward KartEnd(status);
public KartEnd(status)
{
if(status == 0)
{
SendClientMessageToAll(red, ".����� ���� ���� ���� ������ ���� ���� �-3");
SendClientMessageToAll(red, ".�� ���� ������ ���� ����� ��� 500 ����");
KartOn = 0; KartPlayers = 0;
KillTimer(KCheckTime);
KillTimer(KCheckSec);
KartOn =0;
for(new i=0;i<MAX_PLAYERS;i++)
{
if(InKart[i] == 1)
{
SendClientMessage(i,COLOR_ORANGE,".����� ����� ��� [500] ���� �� ����: ���� ������� �����");
LACY_GiveMoney(i,500);
InKart[i] = 0;  KK[i] = 0; KS = 0; knoobk = 0; Fuck[i] = 0;
DestroyVehicle(caridxx[i]);
}
}
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
PlayerInfo[KartWinner][Kart] ++;
GetPlayerName(KartWinner, playername, sizeof(playername));
SendClientMessageToAll(COLOR_WHITE,"[________ ���� ���� - ���� ________]");
format(fuxm, sizeof(fuxm), ".$%d ���� ���� �������, ���� ������ ���� ����,(%d) ,%s",MoneyWinnerKart,KartWinner, GetName(KartWinner)),SendClientMessageToAll(0xE21E1EFF, fuxm);
format(fuxm, sizeof(fuxm), ".%d ���� ������� ��� ��������",PlayerInfo[KartWinner][Kart]),SendClientMessageToAll(0xE21E1EFF, fuxm);
SendClientMessageToAll(COLOR_WHITE,".-------------------------------------");TogglePlayerControllable(KartWinner, 1);
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
//format(fux, sizeof(fux), ".���� �� �������\"%s\" ������ ", Adminname);
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
SendClientMessageToAll(COLOR_WHITE,"[_____________���� - ������� �������_____________]");
SendClientMessageToAll(0xE21E1EFF, "! ����� ����� ���� ��������, ������ �����");
format(string,sizeof(string),".$%d :��� ����� ����� ����� ��",MoneyWinnerMonster);
SendClientMessageToAll(0xE21E1EFF,string);
SendClientMessageToAll(0x0F6A0FF, "/Monster :�� ��� 45 ����� ������,�������� ����");
SendClientMessageToAll(COLOR_WHITE,".---------------------------------");


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
for(new i;i<MAX_PLAYERS;i++) {
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
SendClientMessageToAll(COLOR_WHITE,"[____Monstering info - ���� �� ������� ���� ������____]");
SendClientMessageToAll(0x0F482FF,"����� �������  ����� ���� ���� �����");
format(string,sizeof(string)," %d :��' �������",MonsterPlayers),SendClientMessageToAll(0x0F482FF,string);
format(string,sizeof(string)," $%d :���� ����� ����� �� ��� ������� ���",MoneyWinnerMonster),SendClientMessageToAll(0x0F482FF,string);
SendClientMessageToAll(0x0F482FF,".�� ���� ������ �� ���� ����� �500 ���� �����");
SendClientMessageToAll(COLOR_WHITE,"[____ .������ ��� �������� / ������� ���� ������____]");

for(new i = 0; i < MAX_PLAYERS; i++){
if(IsPlayerConnected(i) && iNmOnster[i]==1){
TogglePlayerControllable(i,0);
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
SendClientMessageToAll(red, ".����� ���� ���� ���� ������ ���� ���� �-3");
SendClientMessageToAll(red, ".�� ���� ������ ���� ����� ��� 500 ����");

MonsterOn = 0; MonsterPlayers = 0;
KillTimer(MCheckTimeMonster);
KillTimer(KcheckMonster);
for(new i=0;i<MAX_PLAYERS;i++) {
if(iNmOnster[i] == 1) {
iNmOnster[i] = 0;  MonsterNoTeleportion[i] = 0; MoOn = 0; MonNoob = 0; MonsterFucker[i] = 0;
SendClientMessage(i,COLOR_ORANGE,".����� ����� ��� [500] ���� �� ����: ���� ������� �����");
LACY_GiveMoney(i,500);
DestroyVehicle(MonsterSYSTEM[i]);
}}
return 1; }
else if(status == 1) {
MonsterOn = 0; MonsterPlayers = 0;


KillTimer(MCheckTimeMonster);
KillTimer(KcheckMonster);
if(IsPlayerInAnyVehicle(MonsterWinner))
{
RemovePlayerFromVehicle(MonsterWinner);
SpawnPlayer(MonsterWinner);
}
if(!IsPlayerInAnyVehicle(MonsterWinner))
{
SpawnPlayer(MonsterWinner);
}
LACY_GiveMoney(MonsterWinner,MoneyWinnerMonster);
PlayerInfo[MonsterWinner][Monster] ++;
GetPlayerName(MonsterWinner, playername, sizeof(playername));

SendClientMessageToAll(COLOR_WHITE,"[________ ���� ������� ������� - ���� ________]");
format(fuxm, sizeof(fuxm), ".$%d ���� ���� ��������, ���� ���� ��� ��� ���� �� �,%s",MoneyWinnerMonster,GetName(MonsterWinner)),SendClientMessageToAll(0xE21E1EFF, fuxm);
format(fuxm, sizeof(fuxm), ".%d ���� ������� ��� ���� �����",PlayerInfo[MonsterWinner][Monster]),SendClientMessageToAll(0xE21E1EFF, fuxm);
SendClientMessageToAll(COLOR_WHITE,".-------------------------------------");


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
format(MonsterFux, sizeof(MonsterFux), ".���� �� ����� \"%s\" ������ ", Adminname);
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




//=[AntiMinigun`s]===================================================
forward AntiMinigun();
public AntiMinigun()
{
new weapon;
new gunammo;
for(new i = 0; i < 100; i++)
{
for (new x = 0; x < 13; x++)
{
if(PPw[i] == 1||  InWarw[i] == 1 || InDM[i] == 1) return 0;
GetPlayerWeaponData(i, x, weapon, gunammo);
if((weapon == 38) && gunammo > 1)
{
new str[256];
SendClientMessage(i,red,"Forbain Weapon`s Hack. ����� ����� �'�� ������ ����, �'�� ����");
SendClientMessage(i,red,".��� ���� �����,����� �� ����� ���� ����, �� ����� ������ �����");
Kick(i);
format(str, sizeof(str), "[AntiCheat] %s has been kicked for using Forbain Weapon`s  Hack." , GetName(i));
SendClientMessageToAll(red , str);
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
for(new i = 0; i < 100; i++)
{
for (new x = 0; x < 13; x++)
{
if(PPr[i] == 1 || PlayerInfo[i][bazooka] > 0 || InWarr[i] == 1 || InDM[i] == 1) return 0;
GetPlayerWeaponData(i, x, weapon, gunammo);
if((weapon == 35 || weapon == 36) && gunammo > 1)
{
new str[256];
SendClientMessage(i,red,"Forbain Weapon`s Hack. ����� ����� �'�� ������ ����, �'�� ����");
SendClientMessage(i,red,".��� ���� �����,����� �� ����� ���� ����, �� ����� ������ �����");
format(str, sizeof(str), "[AntiCheat] %s has been kicked for using Forbain Weapon`s  Hack." , GetName(i));
SendClientMessageToAll(red , str);
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
forward AFKick(playerid);
public AFKick(playerid)
{
if(isafk[playerid] == 1) return 0;
if(PlayerInfo[playerid][AdminsLevel] > 1) return 0;
GetPlayerPos(playerid, AFKPos[playerid][0], AFKPos[playerid][1], AFKPos[playerid][2]);
if(AFKPos[playerid][0] == AFKPos[playerid][3] && AFKPos[playerid][1] == AFKPos[playerid][4] && AFKPos[playerid][2] == AFKPos[playerid][5])
{
new player[MAX_PLAYER_NAME], string[256];
GetPlayerName(playerid, player, sizeof(player));
format(string, sizeof(string), ".(AFK) ���� ��� ����� ����: ��� ����� ��� �����  ,\"%s\"", player);
SendClientMessageToAll(COLOR_BRIGHTRED, string);
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
//=[Forward]========================================================
forward Msc(playerid);
//=[Public]==========================================================
public Msc(playerid) return RK_GM(playerid,3000,":����� ������ ��� ��",COLOR_YELLOW,1);
//=[Rk.include]==============================================================
//=[RK_HP]========================================================
stock RK_HP(playerid,Float:Health,price,messagess[],scolor)
{
new string[256];
if(GetPlayerMoney(playerid) < price) return SendClientMessage(playerid,red,".��� �� ����� ��� ����� �� ����� ���  ���� ����� �1500 ����");
LACY_GiveMoney(playerid,-price);
format(string,sizeof(string),"%s ,%s",messagess,GetName(playerid));
SendClientMessageToAll(scolor,string);
SetPlayerHealth(playerid,Float:Health);
return 1;
}
//=[RK_GiveWeapons]==============================================
stock RK_GiveSetWeapons(playerid,weaponid,ammu,weaponid2,ammu2,weaponid3,ammu3,price)
{
if(GetPlayerMoney(playerid) < price) return SendClientMessage(playerid,red,".��� �� ����� ��� ����� �� ��� ����� ��� ���� ����� �6000 ����");
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
if(GetPlayerMoney(playerid) < price) return SendClientMessage(playerid,red,".��� �� ����� ��� ����� �� ���� ��� ���� ����� �2000 ����");
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
SendClientMessage(playerid, COLOR_WHITE,".---- .Rules the server | Satla-Zone.co.il | ���� ���� ----");
SendClientMessage(playerid, COLOR_GREY,"(1) - .��� ��� ����� �������� ������ ����");
SendClientMessage(playerid, COLOR_GREY, "(2) - .��� ����� ��'�� ������� ������");
SendClientMessage(playerid, COLOR_GREY, "(3) - .��'��� ����� ���� ������");
SendClientMessage(playerid, COLOR_GREY, "(4) - .��� ����� ���� ������ / ���� �� ���� / �����");
SendClientMessage(playerid, COLOR_GREY, "(5) - .��� ����� ����� ������ / ����� ������");
SendClientMessage(playerid, COLOR_GREY, "(6) - (Swapn Kill).��� ����� ��� ���� �� ��� ���� ��� ����� ���� ����");
SendClientMessage(playerid, COLOR_GREY, "(7) - .��� ����� ����� ��� - ����� ������");
SendClientMessage(playerid, COLOR_GREY, "(8) - /report - .��� �� ������ ���� �� ��'����� ��'�� ��� ����� ������");
SetTimerEx("ConPlayer",15*1000,0,"i",playerid);
return 1;
}

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
tilim[i] = CreateStreamObject(354,212.5598,1895.0790,16.2901, 0.0000,0.0000,0.0000,500);
SendClientMessage(i,red,".���� ���� ������ ���� ��� ���� ��� ������ ���� ����� VIP��� ��, ��� ������ �");
NoMoreObject[i] = 1;
}
SetTimerEx("Setil",100,0,"i",i);
}
}
return 1;
}
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

forward AntiGamebling();
public AntiGamebling()
{
for(new i=0; i<MAX_PLAYERS; i++)
{
if(InArea(i, 1987.5336,1925.3849, 1051.0730, 968.4362))
{
SendClientMessage(i,red,"[AntiCheat] you are can`t start to Casino || ��� �� ���� ������ ������");
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
stock Messagelevel (playerid, alevels)
{
new st[256];
format(st, sizeof(st), ".%d :��� �� ����/���,����� ����� ����, ����� ������ ����", alevels);
SendClientMessage(playerid,red, st);
return 1;
}
//=[CreateTeleport]==
stock CreateTeleport(playerid,Interior,Float:x,Float:y,Float:z,Float:a,Message[],textgame[],WithVehicle)
{
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
SendClientMessage(playerid, 0xF6F658FF, Message);
GameTextForPlayer(playerid,textgame,5000,1);
return 1;
}
//=/AirStrike/===
forward AirStrikeExplode(playerid);
public AirStrikeExplode(playerid)
{
if(Explodeion[playerid] == 1)
{
CreateExplosion(PlayerInfo[playerid][xAirStrike],PlayerInfo[playerid][yAirStrike],PlayerInfo[playerid][zAirStrike],10,10);
DestroyStreamObject(AirStrikeTil[playerid]);
KillTimer(AirStrikeExplodes[playerid]);
SetTimerEx("againis",30*60,0,"i",playerid);
return 1;
}
if(Explodeion[playerid] == 2)
{
CreateExplosion(PlayerInfo[playerid][xAirStrike],PlayerInfo[playerid][yAirStrike],PlayerInfo[playerid][zAirStrike],10,10);
SetTimerEx("mexlop",1500,0,"i",playerid);
DestroyStreamObject(AirStrikeTil[playerid]);
KillTimer(AirStrikeExplodes[playerid]);
SetTimerEx("againis",30*60,0,"i",playerid);
return 1;
}
if(Explodeion[playerid] == 3)
{
CreateExplosion(PlayerInfo[playerid][xAirStrike],PlayerInfo[playerid][yAirStrike],PlayerInfo[playerid][zAirStrike],10,10);
SetTimerEx("mexlop",1500,0,"i",playerid);
DestroyStreamObject(AirStrikeTil[playerid]);
KillTimer(AirStrikeExplodes[playerid]);
SetTimerEx("againis",30*60,0,"i",playerid);

return 1;
}
return 1;
}
forward mexlop(playerid);
public mexlop(playerid)
{
if(Explodeion[playerid] == 2)
{
CreateExplosion(PlayerInfo[playerid][xAirStrike],PlayerInfo[playerid][yAirStrike],PlayerInfo[playerid][zAirStrike],10,10);
DestroyStreamObject(AirStrikeTil2[playerid]);
DestroyStreamObject(AirStrikeTil[playerid]);
DestroyStreamObject(AirStrikeTil3[playerid]);
Explodeion[playerid] =0;
return 1;
}
if(Explodeion[playerid] == 3)
{
CreateExplosion(PlayerInfo[playerid][xAirStrike],PlayerInfo[playerid][yAirStrike],PlayerInfo[playerid][zAirStrike],10,10);
SetTimerEx("mexlop2",1200,0,"i",playerid);
DestroyStreamObject(AirStrikeTil2[playerid]);
DestroyStreamObject(AirStrikeTil[playerid]);
return 1;
}
return 1;
}
forward mexlop2(playerid);
public mexlop2(playerid)
{
CreateExplosion(PlayerInfo[playerid][xAirStrike],PlayerInfo[playerid][yAirStrike],PlayerInfo[playerid][zAirStrike],10,10);
DestroyStreamObject(AirStrikeTil[playerid]);
DestroyStreamObject(AirStrikeTil2[playerid]);
DestroyStreamObject(AirStrikeTil3[playerid]);
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
if(HealthCheat == 0.0) return 0;
if(HealthCheat < Zambora[playerid]) return 0;
if(HealthCheat == Zambora[playerid])
{
new str[256];
SendClientMessage(playerid,red,"God Mod Hack. ����� ����� �'�� ������ ����, �'�� ����");
SendClientMessage(playerid,red,".��� ���� �����,����� �� ����� ���� ����, �� ����� ������ �����");
format(str, sizeof(str), "[AntiCheat] %s has been kicked for using God Mod Hack." , GetName(playerid));
SendClientMessageToAll(red , str);
Kick(playerid);
}
return 1;
}

//=[KickPing]===================
forward xPing(playerid);
public xPing(playerid)
{
new string[128],ping[MAX_PLAYERS],maxping[MAX_PLAYERS];
if(GetPlayerPing(playerid) > 1000)
{
ping[playerid] = GetPlayerPing(playerid);
maxping[playerid] = 1000;
format(string,sizeof(string),"*** %s has been kicked from the server (%d ����� ���� �� || %d ������� ���� �����).",GetName(playerid),ping,maxping);
SendClientMessageToAll(red , string);
Kick(playerid);
}
return 1;
}
//=[Bike]
forward BikeStart();
public BikeStart()
{
new string[256];
SendClientMessageToAll(COLOR_WHITE,"[_____________���� - ����� ��������_____________]");
SendClientMessageToAll(0xF6F658FF, "! ����� ����� ���� �������, ��� �����: �������� ������ ������");
format(string,sizeof(string),".$3000:����� ���� ���� ���� ��");
SendClientMessageToAll(0xF6F658FF,string);
SendClientMessageToAll(0x0F6A0FF, "/races join :�� ��� 60 ����� ������, �������� ����");
SendClientMessageToAll(COLOR_WHITE,".---------------------------------");
BikeWinner = 1;BikePlayers = 0;
BikeOn = 1; CountBiker = 60; CountBikerdown();
return 1;
}


forward CountBikerdown();
public CountBikerdown()
{
for(new i = 0; i < MAX_PLAYERS; i++) if (IsPlayerConnected(i) && InBike[i])  
if (CountBiker > 0)
{
new String[256];
format(String, 256,"~w~%d",CountBiker);
GameTextForAll(String,1000,6);
--CountBiker;
return SetTimer("CountBikerdown", 1000, 0);
}
for (new i=0; i<200; i++) if (IsPlayerConnected(i))
TogglePlayerControllable(i, 1);
new string[256];
SendClientMessageToAll(COLOR_WHITE,"[______________����� ������ - ��������______________]");
format(string,sizeof(string)," %d :��' �������",BikePlayers),SendClientMessageToAll(0xE21E1EFF,string);
SendClientMessageToAll(0xE21E1EFF,"����� ���� ���� ����� �� 3000$");
SendClientMessageToAll(COLOR_WHITE,".--------------------------------------");

return GameTextForAll("~g~GO!",1000,6);
}
forward OutDrift(playerid);
public OutDrift(playerid)
{
if(indrift[playerid] == 0)return 0;
if(indrift[playerid] == 1)
{
new string[256];
format(string,sizeof(string),".-��� ������� ����� �����,%s",GetName(playerid));
SendClientMessageToAll(red,string);
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
format(string,sizeof(string),"!���� ��������� ������ ����� ,%s",GetName(Drifter));
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
forward Xinfo();
public Xinfo()
{
SendClientMessageToAll(0x1FF382FF,"(#1) new xAp admin mode, Create On the new Versoin - (xA+VB v6.8) - Mr_Joe[XD_B].");
SendClientMessageToAll(0xF6F658FF,"(#2) Create to SharkYH on the Old xAp (xA+4.0).");
SendClientMessageToAll(COLOR_ORANGE,"(#3) for more Info please do. - (/xinfo).");
SendClientMessageToAll(0x0D2E0FF,"(#4) all Bug fixed, for report on bug`s go to the forum www.Satla-Zone.co.il");
return 1;
}

forward CloseHqNm();
public CloseHqNm() { MoveStreamObject(NM2, -1571.610718, 661.513611, 9.732433,2); }
forward CloseHqNm2();
public CloseHqNm2() { MoveStreamObject(NM,-1631.239014, 688.460999, 8.960892,2); }
forward CloseHqNm3();
public CloseHqNm3() { MoveStreamObject(NM3,-1577.179688, 684.275208, 6.282418,2); }



forward SawnCanel();
public SawnCanel()
{

if(TheSawnStarted == 0)
{
SendClientMessageToAll(COLOR_LIGHTGREEN,"/Sawn - ���� ���� �'������ ����� ����� ����");
SendClientMessageToAll(0xF6F658FF,"[Sawn - Champions 1 VS 1] .����� ����, �'�������");
TogglePlayerControllable(TheJoinSawn,1);
TogglePlayerControllable(TheOpenSawn,1);
SawnIn[TheJoinSawn] =0;
SawnIn[TheOpenSawn] =0;
TheSawnStarted = 0;
TheJoinSawn = -1;
TheOpenSawn = -1;
SawnOn = 0;
return 1;
}
return 1;
}
//===[Challenge]==============================================================
//==================================ChaStart====================================
forward ChaStarted();
public ChaStarted()
{
new string[256];
SendClientMessageToAll(COLOR_WHITE,"[_____________����� - ����� �� ���_____________]");
SendClientMessageToAll(0xF6F658FF, "! ����� ����� ���� ������, ������ ������");
format(string,sizeof(string),".$%d :��� ����� ����� ����� ��",ChaPras);
SendClientMessageToAll(0xF6F658FF,string);
SendClientMessageToAll(0x0F6A0FF, "/Cha :�� ��� 60 ����� ������, �������� ����");
SendClientMessageToAll(COLOR_WHITE,".---------------------------------");


ChaOn = 1; ChaPlayers = 0;
CountChallenge = 60; CountChallengedown(); CountChallengeFuc = 1;
return 1; }
//==================================CountChallengedown===================================
forward CountChallengedown();
public CountChallengedown() {
if(CountChallenge == 30) {
SendClientMessageToAll(COLOR_WHITE, "soon The Challenge Etgar to join do /Cha (Type: Challenge).");
} else if(CountChallenge == 15) {
SendClientMessageToAll(COLOR_WHITE, "soon The Challenge Etgar to join do /Cha (Type: Challenge).");
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
for(new i;i<MAX_PLAYERS;i++) {
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
for(new i;i<MAX_PLAYERS;i++)
{
if(InCha[i] == 1)
{

new string[256];
SendClientMessage(i,COLOR_WHITE,"[______________!���� - ����� �� ��______________]");
format(string,sizeof(string)," %d :��' �������",ChaPlayers),SendClientMessage(i,0xE21E1EFF,string);
format(string,sizeof(string)," $%d :���� ����� ����� �� ��� ������� ���",ChaPras),SendClientMessage(i,0xE21E1EFF,string);
SendClientMessage(i,COLOR_WHITE,".--------------------------------------");

new rand = random(sizeof(ChaSpawn));
SetPlayerPos(i, ChaSpawn[rand][0], ChaSpawn[rand][1], ChaSpawn[rand][2]);
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
for(new i;i<MAX_PLAYERS;i++)
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
format(kboobcha, sizeof(kboobcha), "~W~ The Winner Is ~n~~r~%s", playername);
GameTextForAll(kboobcha, 4000, 1);
KillTimer(CHATIME);
KillTimer(CHASECX);
ResetPlayerWeapons(ChaWinner);
SetPlayerInterior(ChaWinner, 0);
SetPlayerPos(ChaWinner, 2028.6577,1341.8792,10.8203);
SendClientMessageToAll(COLOR_WHITE,"[________ ����� ����� - ���� ________]");
SendClientMessageToAll(0xE21E1EFF, "!���� ������");
format(kboobcha, sizeof(kboobcha), "$%d :���� ���� ��� ������ ! ��� ��� �� %s", ChaPras, playername);
SendClientMessageToAll(0xE21E1EFF, kboobcha);
SendClientMessageToAll(COLOR_WHITE, "------------------------------");


for(new Chei = 0; Chei <CHA_OBJECT; Chei++)
{
DestroyStreamObject(CheDelObject[Chei]);
}
for(new i;i<MAX_PLAYERS;i++)
{
InCha[i] = 0; ChaStart = 0; PChain[i] = 0; ChaNoobs = 0;
}
return 1;
}
else if(status == 2)
{
format(kboobcha, sizeof(kboobcha), ".���� �� ����� ����� \"%s\" ������ ", Chaadminsname);
SendClientMessageToAll(COLOR_LIGHTBLUEGREEN, kboobcha);
ChaPlayers = 0;
ChaNoobs = 0; ChaStart = 0;
ChaOn = 0;
CountChallenge = 0; CountChallengeFuc = 0;
KillTimer(CHATIME);
KillTimer(CHASECX);
for(new i;i<MAX_PLAYERS;i++) {
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
SendClientMessageToAll(COLOR_WHITE, ".����� ����� �����, ����: �� ��� �� ���� ���� ���");
for(new Chei = 0; Chei <CHA_OBJECT; Chei++)
{
DestroyStreamObject(CheDelObject[Chei]);
}
for(new i;i<MAX_PLAYERS;i++)
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
for(new i;i<MAX_PLAYERS;i++) {
if(InCha[i] == 1) {
ChaWinner = i; ChaEnd(3);
} } } } return 1; }

forward WinnerCha();
public WinnerCha() {
if(ChaStart == 1)
{
for(new i;i<MAX_PLAYERS;i++)
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
