#include "a_samp"
#include "Y_Objects"
#include "dini"
#pragma tabsize 0

//=[Color]=

#define lblue	0x00FFFFAA
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
#define WHITE 0xFFFFFFAA
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

new Move7;

public OnFilterScriptExit()
{
}
//--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
    public OnFilterScriptInit()
{
	Object_Object();
    //--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
  	CreateDynamicObject(8209, -1289.844360, 434.408020, 9.288527, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(3749, -1507.165283, 471.642609, 12.045915, 0.0000, 0.0000, 269.7591);
	CreateDynamicObject(987, -1508.003296, 465.295868, 5.937497, 0.0000, 0.0000, 269.7591);
	CreateDynamicObject(8209, -1455.763550, 481.797302, 9.288527, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(8209, -1390.169434, 481.756073, 9.238520, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(8210, -1301.380127, 481.425781, 9.288527, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(8210, -1261.727417, 481.868347, 9.281942, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(987, -1239.911011, 433.854309, 6.187500, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(987, -1233.848389, 481.562836, 6.187500, 0.0000, 0.0000, 315.3093);
	CreateDynamicObject(987, -1228.836670, 476.402191, 6.187500, 0.0000, 0.0000, 315.3093);
	CreateDynamicObject(987, -1220.637939, 467.968994, 6.187500, 0.0000, 0.0000, 269.7591);
	CreateDynamicObject(987, -1220.582642, 455.966187, 6.187500, 0.0000, 0.0000, 269.7591);
	CreateDynamicObject(987, -1220.727661, 448.983429, 6.187500, 0.0000, 0.0000, 269.7591);
	CreateDynamicObject(987, -1218.349121, 440.836456, 6.062500, 0.0000, 0.0000, 218.1929);
	CreateDynamicObject(987, -1346.638550, 442.280487, 6.180916, 0.0000, 0.0000, 317.8877);
	CreateDynamicObject(6865, -1510.140015, 471.521484, 14.469392, 0.0000, 0.0000, 314.4499);
	CreateDynamicObject(13667, -1349.910522, 490.137238, 48.877274, 0.0000, 0.0000, 286.0884);
	CreateDynamicObject(8483, -1425.990723, 447.639771, 12.568827, 0.0000, 0.0000, 87.6625);
	CreateDynamicObject(7392, -1453.641846, 490.329102, 25.204449, 0.0000, 0.0000, 85.9437);
	CreateDynamicObject(7388, -1320.460938, 467.555481, 5.681191, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(3268, -1259.524170, 444.985779, 6.180917, 0.0000, 0.0000, 273.1969);
	CreateDynamicObject(3268, -1300.637085, 445.898193, 6.187500, 0.0000, 0.0000, 268.8997);
	CreateDynamicObject(3279, -1226.948364, 464.320282, 6.263117, 0.0000, 0.0000, 179.5182);
	CreateDynamicObject(13831, -1415.122314, 447.010681, 35.627293, 0.0000, 0.0000, 179.6223);
	CreateDynamicObject(11395, -1248.841919, 476.097046, 14.251336, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(13011, -1337.208130, 481.057953, 7.945781, 0.0000, 0.0000, 359.1406);
	CreateDynamicObject(13749, -1324.325684, 479.923126, 10.719633, 0.0000, 0.0000, 325.6225);
	CreateDynamicObject(1682, -1327.163086, 447.417084, 12.641727, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(14791, -1233.905640, 445.897614, 8.232561, 0.0000, 0.0000, 0.0000);
    //--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
	//--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
 	AddStaticPickup(1240,2,-1300.5138,495.8885,11.1953);
   	AddStaticPickup(1242,2,-1300.8835,500.7399,11.1953);
   	AddStaticPickup(325,2,-1304.8390,508.5474,11.1953);
 	AddStaticPickup(371,2,-1310.6023,508.3968,11.1953);
    //--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
    Move7 = CreateObject(980, -1508.946533, 471.620514, 8.960892, 0.0000, 0.0000, 89.3814);
	//--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
    CreateVehicle(520,-1442.3999,507.4650,18.9556,269.6336,0,0,50000); // hydra
	CreateVehicle(522,-1480.2437,463.1314,6.7583,269.2059,0,0,50000); // nrg 1
	CreateVehicle(522,-1479.5474,479.3429,6.7659,266.7215,3,3,50000); // nrg2
	CreateVehicle(411,-1306.1013,444.9678,6.9146,357.6790,0,0,50000); // Infernus
	CreateVehicle(560,-1296.9946,444.8400,6.8862,1.0615,1,1,50000); // sultan
	CreateVehicle(487,-1420.2332,494.3921,18.3836,271.0446,0,0,50000); // Maverick
	CreateVehicle(431,-1260.8354,448.5393,7.2943,0.4649,0,0,50000); // Bus
	CreateVehicle(452,-1444.3159,494.1582,-0.2914,89.3229,126,6,50000); // Speeder
	//--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
	
	return 1;
 }
public OnPlayerDisconnect(playerid, reason)
return
Object_OnPlayerDisconnect(playerid,reason);

    //--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
 	public OnPlayerCommandText(playerid, cmdtext[])
    //================================================================================
    {
    if(strcmp(cmdtext, "/Open", true) == 0) {
    if(strfind(dini_Get(GetPFile(playerid),"Clan"),"[HM]",true) == 0)
{
    if(!PlayerToPoint(20.0,playerid, -1508.946533, 471.620514, 8.960892)) return SendClientMessage(playerid,WHITE,".אנא תקרב לשער של המפקדה שלך");

	MoveObject(Move7, -1508.946533, 471.620514, 3.210892,4);
}
SendClientMessage(playerid, WHITE, ".אין לך קלאן, או שלקלאן שלך אין מפקדה");

	return 1;
	}
	if(strcmp(cmdtext, "/Close", true) == 0) {
	if(strfind(dini_Get(GetPFile(playerid),"Clan"),"[HM]",true) == 0)
{
	if(!PlayerToPoint(20.0,playerid, -1508.946533, 471.620514, 8.960892)) return SendClientMessage(playerid,WHITE,".אנא תקרב לשער של המפקדה שלך");

	MoveObject(Move7, -1508.946533, 471.620514, 8.960892,4);
	}
SendClientMessage(playerid, WHITE, ".אין לך קלאן, או שלקלאן שלך אין מפקדה");

	return 1;
	}
	//================================================================================
	if(strcmp(cmdtext, "/hq", true)==0)
{
if(strfind(dini_Get(GetPFile(playerid),"Clan"),"[HM]",true) == 0)
{

	if (GetPlayerState(playerid) == 2)
	{
		SetVehiclePos(GetPlayerVehicleID(playerid), -1531.9507, 473.5179, 7.1875);
		SetVehicleZAngle(GetPlayerVehicleID(playerid), 263.7990);
	} else {
		SetPlayerPos(playerid, -1531.9507, 473.5179, 7.1875);
		SetPlayerFacingAngle(playerid, 263.7990);
	}
SendClientMessage(playerid, 0x33AA33AA, ".ברוכים הבאים למפקדה של הקלאן שלך");
}
SendClientMessage(playerid, WHITE, ".אין לך קלאן, או שלקלאן שלך אין מפקדה");

	return 1;
}
    //================================================================================
	return 0;
	}


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

stock GetPFile(playerid)
{//By - SAMP Team (Jax).
new string[256];
format(string,sizeof(string),"RLSB/Users/%s.ini",PlayerName(playerid));
return string;
}

stock PlayerName(playerid)
{
new Name[MAX_PLAYER_NAME];
GetPlayerName(playerid,Name,sizeof(Name));
return Name;
}
