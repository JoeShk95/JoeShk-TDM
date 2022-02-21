#include <a_samp>
#define ZAA 35.0

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


//new's:
#define VAS 237
new Float:AirAttack[200][4];
new AirAttackV[200][VAS];
new KillTimeraa[200];
new Stateaa[200];
new AsLevel[200];

new AirAttackOn[200];
//forward:
forward public AirAttackStart(playerid);
forward public LaunchZone(playerid);
forward public LaunchZone2(playerid);
forward public LaunchZone3(playerid);
forward public LaunchZone4(playerid);
forward public LaunchZone5(playerid);

forward public DestroyAirAttack(playerid);
forward public ResetTheVar(playerid);

public OnPlayerConnect(playerid)
{
AirAttack[playerid][0] = 0.0;
AirAttack[playerid][1] = 0.0;
AirAttack[playerid][2] = 0.0;
return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
AirAttack[playerid][0] = 0.0;
AirAttack[playerid][1] = 0.0;
AirAttack[playerid][2] = 0.0;
return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{

if(!strcmp(cmdtext,"/aasave",true))
{
GetPlayerPos(playerid,AirAttack[playerid][0],AirAttack[playerid][1],AirAttack[playerid][2]);
GetPlayerFacingAngle(playerid,AirAttack[playerid][3]);
return true;
}



if(!strcmp(cmdtext,"/aa1",true))
{
if(AirAttack[playerid][0] == 0.0 && AirAttack[playerid][1] == 0.0 && AirAttack[playerid][2] == 0.0) return SendClientMessage(playerid,red,".אין לך שום איזור שמור של התקפה אווירית");
if(AirAttackOn[playerid]) return SendClientMessage(playerid,red,".התקיפה אוורית כבר פועלת אצלך");
KillTimeraa[playerid] = SetTimerEx("AirAttackStart",1300,1,"i",playerid);
Stateaa[playerid] = 1;
AsLevel[playerid] = 1;
AirAttackOn[playerid] = 1;
return true;
}

if(!strcmp(cmdtext,"/as2",true))
{
if(AirAttack[playerid][0] == 0.0 && AirAttack[playerid][1] == 0.0 && AirAttack[playerid][2] == 0.0) return SendClientMessage(playerid,red,".אין לך שום איזור שמור של התקפה אווירית");
if(AirAttackOn[playerid]) return SendClientMessage(playerid,red,".התקיפה אוורית כבר פועלת אצלך");
KillTimeraa[playerid] = SetTimerEx("AirAttackStart",1300,1,"i",playerid);
Stateaa[playerid] = 1;
AsLevel[playerid] = 2;
AirAttackOn[playerid] = 1;
return true;
}


if(!strcmp(cmdtext,"/aa3",true))
{
if(AirAttack[playerid][0] == 0.0 && AirAttack[playerid][1] == 0.0 && AirAttack[playerid][2] == 0.0) return SendClientMessage(playerid,red,".אין לך שום איזור שמור של התקפה אווירית");
KillTimeraa[playerid] = SetTimerEx("AirAttackStart",1300,1,"i",playerid);
Stateaa[playerid] = 1;
AsLevel[playerid] = 3;
return true;
}

return 0;
}


public AirAttackStart(playerid)
{

if(Stateaa[playerid] == 1)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][0] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1000);
AirAttackV[playerid][1] =  CreateVehicle(520, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][2] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][3] =  CreateVehicle(520, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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

SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
Stateaa[playerid] = 2;
return true;
}

return true;
}
if(Stateaa[playerid] == 2)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][4] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-180.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][5] =  CreateVehicle(520, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-180.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][6] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-180.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][7] =  CreateVehicle(520, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-180.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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

SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
Stateaa[playerid] = 3;
return true;
}

return true;
}

if(Stateaa[playerid] == 3)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][8] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][9] =  CreateVehicle(520, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][10] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][11] =  CreateVehicle(520, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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

SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
Stateaa[playerid] = 4;
return true;
}

return true;
}


if(Stateaa[playerid] == 4)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][12] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][13] =  CreateVehicle(520, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][14] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][15] =  CreateVehicle(520, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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

SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
Stateaa[playerid] = 5;
return true;
}

return true;
}

if(Stateaa[playerid] == 5)
{
if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][16] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][17] =  CreateVehicle(520, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][18] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][19] =  CreateVehicle(520, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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

SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
Stateaa[playerid] = 6;
return true;
}

return true;
}

if(Stateaa[playerid] == 6)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][20] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][21] =  CreateVehicle(520, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][22] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][23] =  CreateVehicle(520, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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

SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
Stateaa[playerid] = 7;
return true;
}

return true;
}

if(Stateaa[playerid] == 7)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][24] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][25] =  CreateVehicle(520, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][26] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][27] =  CreateVehicle(520, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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

SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
Stateaa[playerid] = 8;
return true;
}

return true;
}

if(Stateaa[playerid] == 8)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][28] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-60.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][29] =  CreateVehicle(520, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-60.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][30] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-60.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][31] =  CreateVehicle(520, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-60.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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

SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
Stateaa[playerid] = 9;
return true;
}

return true;
}


if(Stateaa[playerid] == 9)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][32] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][33] =  CreateVehicle(520, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][34] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][35] =  CreateVehicle(520, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
Stateaa[playerid] = 10;
return true;
}

return true;
}

if(Stateaa[playerid] == 10)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][36] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]-20.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][37] =  CreateVehicle(520, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]-20.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][38] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]-20.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][39] =  CreateVehicle(520, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]-20.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
Stateaa[playerid] = 11;
LaunchZone4(playerid);
return true;
}


return true;
}
if(Stateaa[playerid] == 11)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][40] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1],AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][41] =  CreateVehicle(520, AirAttack[playerid][0]+10.0,AirAttack[playerid][1],AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][42] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1],AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][43] =  CreateVehicle(520, AirAttack[playerid][0]+30.0,AirAttack[playerid][1],AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
Stateaa[playerid] = 12;
return true;
}

return true;
}

if(Stateaa[playerid] == 12)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][44] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][45] =  CreateVehicle(520, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][46] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][47] =  CreateVehicle(520, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+40.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
Stateaa[playerid] = 13;
return true;
}

return true;
}

if(Stateaa[playerid] == 13)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][48] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][49] =  CreateVehicle(520, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][50] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][51] =  CreateVehicle(520, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+80.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
Stateaa[playerid] = 14;
return true;
}

return true;
}

if(Stateaa[playerid] == 14)
{
if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][52] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][53] =  CreateVehicle(520, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][54] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][55] =  CreateVehicle(520, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+100.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
Stateaa[playerid] = 15;
return true;
}

return true;
}


if(Stateaa[playerid] == 15)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][56] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][57] =  CreateVehicle(520, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][58] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][59] =  CreateVehicle(520, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+120.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
Stateaa[playerid] = 16;
return true;
}

return true;
}

if(Stateaa[playerid] == 16)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][60] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][61] =  CreateVehicle(520, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][62] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][63] =  CreateVehicle(520, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+140.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
Stateaa[playerid] = 17;
return true;
}

return true;
}

if(Stateaa[playerid] == 17)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][64] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][65] =  CreateVehicle(520, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][66] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][67] =  CreateVehicle(520, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+160.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
Stateaa[playerid] = 18;
return true;
}

return true;
}

if(Stateaa[playerid] == 18)
{

if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][64] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][65] =  CreateVehicle(520, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][66] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][67] =  CreateVehicle(520, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+200.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
Stateaa[playerid] = 19;
return true;
}


else if(AsLevel[playerid] == 3)
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);
Stateaa[playerid] = 19;
return true;
}

return true;
}


if(Stateaa[playerid] == 19)
{
if(AsLevel[playerid] == 1)
{
AirAttackV[playerid][64] =  CreateVehicle(520, AirAttack[playerid][0],AirAttack[playerid][1]+260.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][65] =  CreateVehicle(520, AirAttack[playerid][0]+10.0,AirAttack[playerid][1]+260.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][66] =  CreateVehicle(520, AirAttack[playerid][0]+20.0,AirAttack[playerid][1]+260.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
AirAttackV[playerid][67] =  CreateVehicle(520, AirAttack[playerid][0]+30.0,AirAttack[playerid][1]+260.0,AirAttack[playerid][2]+ZAA, 0.0, 0, 6, -1);
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);

KillTimer(KillTimeraa[playerid]);
for(new i=0; i<VAS; i++)
{
DestroyVehicle(AirAttackV[playerid][i]);
}
SetTimerEx("ResetTheVar",1000,0,"i",playerid);
return true;
}
}


else if(AsLevel[playerid] == 3)
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
SetTimerEx("DestroyAirAttack",450,0,"i",playerid);

KillTimer(KillTimeraa[playerid]);
for(new i=0; i<VAS; i++)
{
DestroyVehicle(AirAttackV[playerid][i]);
}
SetTimerEx("ResetTheVar",1000,0,"i",playerid);
return true;
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

CreateExplosion(AirAttack[playerid][0]+10.0,AirAttack[playerid][1],AirAttack[playerid][2]+10.0,1,1);
CreateExplosion(AirAttack[playerid][0]+20.0,AirAttack[playerid][1],AirAttack[playerid][2]+10.0,1,1);
CreateExplosion(AirAttack[playerid][0]+25.0,AirAttack[playerid][1],AirAttack[playerid][2]+10.0,1,1);
CreateExplosion(AirAttack[playerid][0]+30.0,AirAttack[playerid][1],AirAttack[playerid][2]+10.0,1,1);
CreateExplosion(AirAttack[playerid][0]+35,AirAttack[playerid][1],AirAttack[playerid][2]+10.0,1,1);
return true;
}


public LaunchZone2(playerid)
{

CreateExplosion(AirAttack[playerid][0]+10.0,AirAttack[playerid][1],AirAttack[playerid][2],8,8);
CreateExplosion(AirAttack[playerid][0]+20.0,AirAttack[playerid][1],AirAttack[playerid][2],8,8);
CreateExplosion(AirAttack[playerid][0]+25.0,AirAttack[playerid][1],AirAttack[playerid][2],8,8);
CreateExplosion(AirAttack[playerid][0]+30.0,AirAttack[playerid][1],AirAttack[playerid][2],8,8);
CreateExplosion(AirAttack[playerid][0]+35,AirAttack[playerid][1],AirAttack[playerid][2],8,8);

CreateExplosion(AirAttack[playerid][0]+10.0,AirAttack[playerid][1],AirAttack[playerid][2]+4.4,3,3);
CreateExplosion(AirAttack[playerid][0]+20.0,AirAttack[playerid][1],AirAttack[playerid][2]+4.4,3,3);
CreateExplosion(AirAttack[playerid][0]+25.0,AirAttack[playerid][1],AirAttack[playerid][2]+4.4,3,3);
CreateExplosion(AirAttack[playerid][0]+30.0,AirAttack[playerid][1],AirAttack[playerid][2]+4.4,3,3);
CreateExplosion(AirAttack[playerid][0]+35,AirAttack[playerid][1],AirAttack[playerid][2]+4.4,3,3);

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

CreateExplosion(AirAttack[playerid][0]+10.0,AirAttack[playerid][1],AirAttack[playerid][2]+4.4,3,3);
CreateExplosion(AirAttack[playerid][0]+20.0,AirAttack[playerid][1],AirAttack[playerid][2]+4.4,3,3);
CreateExplosion(AirAttack[playerid][0]+25.0,AirAttack[playerid][1],AirAttack[playerid][2]+4.4,3,3);
CreateExplosion(AirAttack[playerid][0]+30.0,AirAttack[playerid][1],AirAttack[playerid][2]+4.4,3,3);
CreateExplosion(AirAttack[playerid][0]+35,AirAttack[playerid][1],AirAttack[playerid][2]+4.4,3,3);
return true;
}

public LaunchZone4(playerid)
{
CreateExplosion(AirAttack[playerid][0]+10.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+20.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+25.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+30.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+35,AirAttack[playerid][1],AirAttack[playerid][2],10,10);

CreateExplosion(AirAttack[playerid][0]+10.0,AirAttack[playerid][1],AirAttack[playerid][2]+4.4,10,10);
CreateExplosion(AirAttack[playerid][0]+20.0,AirAttack[playerid][1],AirAttack[playerid][2]+4.4,10,10);
CreateExplosion(AirAttack[playerid][0]+25.0,AirAttack[playerid][1],AirAttack[playerid][2]+4.4,10,10);
CreateExplosion(AirAttack[playerid][0]+30.0,AirAttack[playerid][1],AirAttack[playerid][2]+4.4,10,10);
CreateExplosion(AirAttack[playerid][0]+35,AirAttack[playerid][1],AirAttack[playerid][2]+4.4,10,10);
SetTimerEx("LaunchZone5",1500,0,"i",playerid);
return 1;
}

public LaunchZone5(playerid)
{
CreateExplosion(AirAttack[playerid][0]+10.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+20.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+25.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+30.0,AirAttack[playerid][1],AirAttack[playerid][2],10,10);
CreateExplosion(AirAttack[playerid][0]+35,AirAttack[playerid][1],AirAttack[playerid][2],10,10);

CreateExplosion(AirAttack[playerid][0]+10.0,AirAttack[playerid][1],AirAttack[playerid][2]+4.4,10,10);
CreateExplosion(AirAttack[playerid][0]+20.0,AirAttack[playerid][1],AirAttack[playerid][2]+4.4,10,10);
CreateExplosion(AirAttack[playerid][0]+25.0,AirAttack[playerid][1],AirAttack[playerid][2]+4.4,10,10);
CreateExplosion(AirAttack[playerid][0]+30.0,AirAttack[playerid][1],AirAttack[playerid][2]+4.4,10,10);
CreateExplosion(AirAttack[playerid][0]+35,AirAttack[playerid][1],AirAttack[playerid][2]+4.4,10,10);
return 1;
}

public ResetTheVar(playerid)
{
Stateaa[playerid] = 0;
AirAttackOn[playerid] = 0;
return true;
}

