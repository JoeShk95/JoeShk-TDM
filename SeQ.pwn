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

new Move5;
new Move6;

//--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
    public OnFilterScriptInit()
{
Object_Object();
    //--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
  	CreateDynamicObject(8210, -548.244873, -467.918640, 29.737879, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(8210, -596.329163, -467.552979, 29.640205, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(8210, -623.743652, -496.087708, 29.788527, 0.0000, 0.0000, 89.3814);
	CreateDynamicObject(8210, -623.607361, -534.831299, 29.958387, 0.0000, 0.0000, 89.3814);
	CreateDynamicObject(8210, -596.397827, -563.407532, 29.856524, 0.0000, 0.0000, 180.4818);
	CreateDynamicObject(8210, -541.141541, -562.939819, 29.788527, 0.0000, 0.0000, 180.4818);
	CreateDynamicObject(8210, -465.697205, -496.132416, 29.733112, 0.0000, 0.0000, 270.7226);
	CreateDynamicObject(8210, -465.205597, -535.402771, 29.877335, 0.0000, 0.0000, 270.7226);
	CreateDynamicObject(8210, -493.061310, -467.703125, 29.010010, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(8210, -493.045563, -467.677155, 36.117073, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(8210, -548.247803, -468.171814, 36.957001, 0.0000, 0.0000, 0.8594);
	CreateDynamicObject(8210, -623.449036, -496.090973, 36.913521, 0.0000, 0.0000, 90.2409);
	CreateDynamicObject(8210, -624.053711, -534.806152, 36.729866, 0.0000, 0.0000, 90.2409);
	CreateDynamicObject(3749, -490.547638, -564.721802, 29.966553, 1.7189, 0.0000, 0.0000);
	CreateDynamicObject(6865, -490.304047, -567.735413, 32.415680, 0.0000, 0.0000, 48.1285);
	CreateDynamicObject(3279, -509.275970, -556.808533, 24.599054, 0.0000, 0.0000, 90.2409);
	CreateDynamicObject(9833, -497.832825, -526.713806, 27.725981, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(7388, -613.278259, -549.178833, 36.518967, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(7073, -586.145813, -522.974426, 53.628269, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1655, -483.230103, -487.062042, 25.817955, 0.0000, 0.0000, 269.7591);
	CreateDynamicObject(1655, -475.974701, -487.095062, 29.011873, 0.0000, 0.0000, 269.7591);
	CreateDynamicObject(8251, -610.437561, -482.695190, 28.451252, 0.0000, 0.0000, 0.8594);
	CreateDynamicObject(14608, -613.754150, -492.930817, 26.119452, 0.0000, 0.0000, 302.4177);
	CreateDynamicObject(16152, -609.308411, -471.205048, 24.321892, 0.0000, 0.0000, 93.6786);
	CreateDynamicObject(16151, -621.219177, -480.914032, 24.915190, 0.0000, 2.5783, 184.7789);
	CreateDynamicObject(13749, -573.415527, -500.261261, 26.987152, 0.0000, 0.0000, 146.8595);
	CreateDynamicObject(13667, -619.987793, -483.377472, 48.201859, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(14637, -490.421478, -567.971802, 32.677979, 0.0000, 0.0000, 271.4780);
	CreateDynamicObject(14467, -500.823853, -541.092102, 27.257231, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(13831, -541.798035, -629.133484, 22.821482, 0.0000, 0.0000, 98.8352);
	CreateDynamicObject(11395, -473.518463, -508.939240, 32.588264, 0.0000, 0.0000, 268.8997);
	CreateDynamicObject(8644, -504.276459, -519.942932, 30.359245, 0.0000, 0.0000, 210.4578);
	
	
    //--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
	//--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
 	AddStaticPickup(1240,2,-617.0319,-471.8821,25.5234);
   	AddStaticPickup(1242,2,-620.7642,-486.9237,25.5234);
   	AddStaticPickup(350,2,-603.5403,-471.4846,25.5234);
 	AddStaticPickup(352,2,-608.1075,-493.3950,25.5234);
    //--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
    Move5 = CreateObject(980, -490.520477, -562.596069, 26.996830, 0.0000, 0.0000, 0.0000);
	Move6 = CreateObject(972, -600.864380, -484.458282, 22.520319, 0.0000, 0.0000, 0.0000);
	//--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
    CreateVehicle(522,-529.6472,-501.7393,24.4786,2.0664,1,2,50000); // nrg
	CreateVehicle(522,-520.5455,-501.1096,24.5251,0.4041,1,6,50000); // nrg
	CreateVehicle(522,-557.6766,-502.6772,24.4014,0.0438,1,44,50000); // nrg
	CreateVehicle(560,-471.9119,-518.1224,25.2223,91.5376,1,1,50000); // Sultan
	CreateVehicle(411,-538.0913,-544.9603,25.2505,180.0357,1,1,50000); // Infernus
	CreateVehicle(520,-519.5393,-523.6187,36.8687,334.9987,0,0,50000); // Hydra
	CreateVehicle(425,-536.5164,-523.0582,36.6793,344.7349,43,0,50000); // HuNTER
	//--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
	
	return 1;
 }
    //--=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=----=--=--
 	public OnPlayerCommandText(playerid, cmdtext[])
    //================================================================================
    {
    if(strcmp(cmdtext, "/Open", true) == 0) {
	if(strfind(dini_Get(GetPFile(playerid),"Clan"),"sequance",true) == 0)
{
    if(!PlayerToPoint(20.0,playerid,-490.520477, -562.596069, 26.996830)) return SendClientMessage(playerid,WHITE,".אנא תקרב לשער של המפקדה שלך");

	MoveObject(Move5, -490.520477, -562.596069, 21.621832,4);
	}
	return 1;
	}
	if(strcmp(cmdtext, "/Close", true) == 0) {
	if(strfind(dini_Get(GetPFile(playerid),"Clan"),"sequance",true) == 0)
{
    if(!PlayerToPoint(20.0,playerid,-490.520477, -562.596069, 21.621832)) return SendClientMessage(playerid,WHITE,".אנא תקרב לשער של המפקדה שלך");

	MoveObject(Move5,-490.520477, -562.596069, 26.996830,4);
	}
	SendClientMessage(playerid, WHITE, ".אין לך קלאן, או שלקלאן שלך אין מפקדה");

	return 1;
	}
	//================================================================================
    if(strcmp(cmdtext, "/Open2", true) == 0) {
    if(strfind(dini_Get(GetPFile(playerid),"Clan"),"sequance",true) == 0)
{
    if(!PlayerToPoint(20.0,playerid, -600.864380, -484.458282, 22.520319)) return SendClientMessage(playerid,WHITE,".אנא תקרב לשער של המפקדה שלך");

	MoveObject(Move6, -600.864380, -484.458282, 16.770319,4);
	}
	SendClientMessage(playerid, WHITE, ".אין לך קלאן, או שלקלאן שלך אין מפקדה");

	return 1;
	}
    if(strcmp(cmdtext, "/Close2", true) == 0) {
    if(strfind(dini_Get(GetPFile(playerid),"Clan"),"sequance",true) == 0)
{
    if(!PlayerToPoint(20.0,playerid, -600.864380, -484.458282, 16.770319)) return SendClientMessage(playerid,WHITE,".אנא תקרב לשער של המפקדה שלך");

	MoveObject(Move6,-600.864380, -484.458282, 22.520319,4);
	}
	SendClientMessage(playerid, WHITE, ".אין לך קלאן, או שלקלאן שלך אין מפקדה");

	return 1;
	}
	//================================================================================
	if(!strcmp(cmdtext,"/hq",true))
{
if(strfind(dini_Get(GetPFile(playerid),"Clan"),"sequance",true) == 0)
{
 if(IsPlayerInAnyVehicle(playerid))
 {
  SetVehiclePos(GetPlayerVehicleID(playerid),-419.2169, -631.9835, 11.3793);
  SetVehicleZAngle(GetPlayerVehicleID(playerid),109.0739);
 }
 else
 {
  SetPlayerPos(playerid,-419.2169, -631.9835, 11.3793);
  SetPlayerFacingAngle(playerid,109.0739);
  SendClientMessage(playerid, 0xFFFFFFAA, "ברוכים הבאים למפקדה SeQ.");
 }
}
SendClientMessage(playerid, WHITE, ".אין לך קלאן, או שלקלאן שלך אין מפקדה");

 return 1;
}

    //================================================================================
	return 0;
	}

public OnPlayerDisconnect(playerid, reason)
return
Object_OnPlayerDisconnect(playerid,reason);


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
