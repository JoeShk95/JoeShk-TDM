#define FILTERSCRIPT
#include <a_samp>
#include <dudb>
#include <dini>
#include <LACY_modlink.inc>
//Color Defines
#define grey 0xC0C0C0AA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_MEDBLUE 0x0099FFFF
#define COLOR_GREEN 0x33FF33AA
#define COLOR_BRIGHTRED 0xFF000096
#define COLOR_LIGHTBLUE 0x33CCFFAA //pilot color
#define COLOR_RED 0xAA3333AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_ORANGE 0xFF9900AA //Swat color
#pragma tabsize 0
//===============================Checkpoint defines===================================
#define MAX_POINTS 3
#define CP_BANK 		0
#define CP_BANK_2 		1
#define CP_BANK_3 		2
//================================Checkpoints===================================
new Float:checkCoords[MAX_POINTS][4] = {
{-36.5483,-57.9948, -17.2655,-49.2967},     	//BANK
{-37.2183,-91.8006, -14.1099,-74.6845},      	//BANK_2
{-34.6621,-31.4095, -2.6782,-25.6232}  		//BANK_3
};

new Float:checkpoints[MAX_POINTS][4] = {
{-22.2549,-55.6575,1003.5469,2.5},
{-23.0664,-90.0882,1003.5469,2.5},
{-33.9593,-29.0792,1003.5573,2.5}
};

//=================================Checkpoint Type==============================
new checkpointType[MAX_POINTS] = {
	CP_BANK,
	CP_BANK_2,
	CP_BANK_3
};
//=================================Pinfo==========================
enum pInfo
{
    pBMoney,
	pKills,
	pDeaths,
	pLevel,
	pMoney,
}
//----------------------news--------------------------------
new LevelTimer;
new PlayerInfo[MAX_PLAYERS][pInfo];
new playername[MAX_PLAYER_NAME];
new logged[MAX_PLAYERS];
new giveplayerid;
new playerCheckpoint[MAX_PLAYERS];
new onlyone[MAX_PLAYERS];
//----------------------forwards------------------------------
forward Levels(playerid);
forward checkpointUpdate();
forward isPlayerInArea(playerID, Float:data[4]);
forward getCheckpointType(playerID);
forward Timer(playerid,time);
forward Timer1(playerid,time);



//=|OnFilterScriptInit|=========================================================
public OnFilterScriptInit()
{
	print("-------------------------------------------");
	print("            level  ");
	print("                bank            ");
	print("                   by yossi          ");
	print("-------------------------------------------");
	return 1;
}

//=|OnFilterScriptExit|=========================================================
public OnFilterScriptExit()
{
	print("-------------------------------------------");
	print("            level    ");
	print("               bank                 ");
	print("              by  yossi               ");
	print("-------------------------------------------");
	return 1;
}
//----------------------------
public OnGameModeInit()
{
    LevelTimer = SetTimer("Levels",5000, 1);
    SetTimer("checkpointUpdate",100, 1);
	return 1;
}
//------------------------------------------------------------------------------
public OnPlayerConnect(playerid)
{
	GetPlayerName(playerid, playername, sizeof(playername));
	if (!dini_Exists(udb_encode(playername)))
	{
        SendClientMessage(playerid,COLOR_BRIGHTRED,"Welcome to world-fun lv-dm mod israel");
	    SendClientMessage(playerid,COLOR_ORANGE,"world-fun ברוכים הבאים לשרת");
		SendClientMessage(playerid,COLOR_YELLOW,"/register <password> להירשם לשרת לחץ");
		SendClientMessage(playerid,COLOR_ORANGE,"/help לראות את כל הפקודות לחצו");
	    Timer1(playerid,120);
				}
			else {
        SendClientMessage(playerid,COLOR_BRIGHTRED,"Welcome to world-fun lv-dm mod israel");
	    SendClientMessage(playerid,COLOR_ORANGE,"world-fun ברוכים הבאים לשרת");
		SendClientMessage(playerid,COLOR_YELLOW,"/login <password> להתחבר לחץ");
		SendClientMessage(playerid,COLOR_ORANGE,"/help לראות את כל הפקודות לחצו");
	Timer(playerid,120);
	logged[playerid] = 0;
    PlayerInfo[playerid][pKills] = 0;
    PlayerInfo[playerid][pDeaths] = 0;
    PlayerInfo[playerid][pLevel] = 0;
    PlayerInfo[playerid][pBMoney] = 0;
    PlayerInfo[playerid][pMoney] = 0;
			}
		return 1;
	}

	public OnPlayerDeath(playerid, killerid, reason)
{
	if(killerid == INVALID_PLAYER_ID) {
        PlayerInfo[playerid][pDeaths] += 1;
	} else {
			PlayerInfo[playerid][pDeaths] += 1;
			PlayerInfo[killerid][pKills] += 1;
     	}
     	{
onlyone[playerid] = 0;
}
return 1;
}
//=============================On Enter Checkpoint==============================
public OnPlayerEnterCheckpoint(playerid)
{
    switch(getCheckpointType(playerid))
	{
		case CP_BANK: {
		SendClientMessage(playerid, COLOR_MEDBLUE, "/bank [amount] - להפקיד כסף בבנק ");
		SendClientMessage(playerid, COLOR_MEDBLUE, "/withdraw [amount] - למסוך כסף מהבנק");
		SendClientMessage(playerid, COLOR_MEDBLUE, "/balance - לבדוק כמה כסף יש לך בבנק");
		SendClientMessage(playerid, COLOR_MEDBLUE, "/bankid [playerid] [amount] - להעביר כסף מחשבונך לחשבון שחקן אחר");
		}
		case CP_BANK_2: {
		SendClientMessage(playerid, COLOR_MEDBLUE, "/bank [amount] - להפקיד כסף בבנק ");
		SendClientMessage(playerid, COLOR_MEDBLUE, "/withdraw [amount] - למסוך כסף מהבנק");
		SendClientMessage(playerid, COLOR_MEDBLUE, "/balance - לבדוק כמה כסף יש לך בבנק");
		SendClientMessage(playerid, COLOR_MEDBLUE, "/bankid [playerid] [amount] - להעביר כסף מחשבונך לחשבון שחקן אחר");
		}
		case CP_BANK_3: {
		SendClientMessage(playerid, COLOR_MEDBLUE, "/bank [amount] - להפקיד כסף בבנק ");
		SendClientMessage(playerid, COLOR_MEDBLUE, "/withdraw [amount] - למסוך כסף מהבנק");
		SendClientMessage(playerid, COLOR_MEDBLUE, "/balance - לבדוק כמה כסף יש לך בבנק");
		SendClientMessage(playerid, COLOR_MEDBLUE, "/bankid [playerid] [amount] - להעביר כסף מחשבונך לחשבון שחקן אחר");
	}
	}
	return 1;
}
//==============================================================================
public OnPlayerDisconnect(playerid)
{
    GetPlayerName(playerid, playername, sizeof(playername));
    PlayerInfo[playerid][pMoney] = GetPlayerMoney(playerid);
    dini_IntSet(udb_encode(playername), "Kills", PlayerInfo[playerid][pKills]);
    dini_IntSet(udb_encode(playername), "Deaths", PlayerInfo[playerid][pDeaths]);
    dini_IntSet(udb_encode(playername), "Level", PlayerInfo[playerid][pLevel]);
    dini_IntSet(udb_encode(playername), "Bank", PlayerInfo[playerid][pBMoney]);
    dini_IntSet(udb_encode(playername), "Money", PlayerInfo[playerid][pMoney]);
    logged[playerid] = 0;
}
//-------------------------------------------------
public OnPlayerCommandText(playerid, cmdtext[])
{
	new cmd[256];
	new string[256];
	new idx;
	new tmp[256];
	new tmp2[256];
    new moneys[MAX_PLAYERS];
    new giveplayer[MAX_PLAYER_NAME];
    new sendername[MAX_PLAYER_NAME];
   	new playermoney[MAX_PLAYERS];

	cmd = strtok(cmdtext, idx);

if(!strcmp(cmdtext,"/ap",true)) {
if (PlayerInfo[playerid][pKills] >= 200) {
if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
  new vehicleid = GetPlayerVehicleID(playerid);
  SetPlayerInterior(playerid, 0);
  SetVehiclePos(vehicleid,1675.1992, 1606.2216, 10.8203);
}else{
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid,1675.1992, 1606.2216, 10.8203);}
{ SendClientMessage(playerid, COLOR_ORANGE, " הגעתם לשדה תעופה");}
}else{
SendClientMessage(playerid,COLOR_GREEN," פקודה זאת מרמה 1 ומעלה");
}
return 1;
}

if(!strcmp(cmdtext,"/stret",true)) {
if (PlayerInfo[playerid][pKills] >= 200) {
if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
  new vehicleid = GetPlayerVehicleID(playerid);
  SetPlayerInterior(playerid, 0);
  SetVehiclePos(vehicleid,1012.0038,-1805.6332,535.1780);
}else{
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid,1012.0038,-1805.6332,535.1780);}
{ SendClientMessage(playerid, COLOR_ORANGE, " הגעתם לאזור הרמפות");}
}else{
SendClientMessage(playerid,COLOR_GREEN," פקודה זאת מרמה 1 ומעלה");
}
return 1;
}

if(!strcmp(cmdtext,"/trt",true)) {
if (PlayerInfo[playerid][pKills] >= 200) {
if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
  new vehicleid = GetPlayerVehicleID(playerid);
  SetPlayerInterior(playerid, 0);
  SetVehiclePos(vehicleid,-809.5623, -1911.3700, 7.9728);
}else{
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid,-809.5623, -1911.3700, 7.9728);}
{ SendClientMessage(playerid, COLOR_ORANGE, " הגעתם לאזור הביצה זהירות היא מורעלת");}
}else{
SendClientMessage(playerid,COLOR_GREEN," פקודה זאת מרמה 1 ומעלה");
}
return 1;
}

if(!strcmp(cmdtext,"/sm",true)) {
if (PlayerInfo[playerid][pKills] >= 200) {
if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
  new vehicleid = GetPlayerVehicleID(playerid);
  SetPlayerInterior(playerid, 0);
  SetVehiclePos(vehicleid,-2337.1899, 2303.0952, 4.9844);
}else{
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid,-2337.1899, 2303.0952, 4.9844);}
{ SendClientMessage(playerid, COLOR_ORANGE, " הגעתם לאזור סירות מנוע");}
}else{
SendClientMessage(playerid,COLOR_GREEN," פקודה זאת מרמה 1 ומעלה");
}
return 1;
}

if(!strcmp(cmdtext,"/minicar",true)) {
if (PlayerInfo[playerid][pKills] >= 200) {
if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
  new vehicleid = GetPlayerVehicleID(playerid);
  SetPlayerInterior(playerid, 0);
  SetVehiclePos(vehicleid,520.3225, 2372.7368, 30.3179);
}else{
SetPlayerPos(playerid,520.3225, 2372.7368, 30.3179);}
SetPlayerInterior(playerid, 0);
{ SendClientMessage(playerid, COLOR_ORANGE, " הגעתם לאוזר מכונית על שלט");}
}else{
SendClientMessage(playerid,COLOR_GREEN," פקודה זאת מרמה 1 ומעלה");
}
return 1;
}

if(!strcmp(cmdtext,"/water",true)) {
if (PlayerInfo[playerid][pKills] >= 200) {
if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
  new vehicleid = GetPlayerVehicleID(playerid);
  SetPlayerInterior(playerid, 0);
  SetVehiclePos(vehicleid,-2170.4885 ,2366.8005, -42.2403);
}else{
SetPlayerPos(playerid,-2170.4885 ,2366.8005, -42.2403);}
SetPlayerInterior(playerid, 0);
{ SendClientMessage(playerid, COLOR_ORANGE, " הגעתם למתחת למים");}
}else{
SendClientMessage(playerid,COLOR_GREEN," פקודה זאת מרמה 1 ומעלה");
}
return 1;
}

if(strcmp(cmdtext, "/healme", true)== 0) {
if(onlyone[playerid] == 0)
{
SetPlayerHealth(playerid,100);
onlyone[playerid] = 1;
return 1;
}}
//----------------------------------Give Cash-----------------------------------
	if(strcmp(cmd, "/bankid", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_LIGHTBLUE, " /bankid [playerid] [amount] :שימוש");
			return 1;
		}
		giveplayerid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
 			SendClientMessage(playerid, COLOR_LIGHTBLUE, " /bankid [playerid] [amount] :שימוש");
			return 1;
		}
		moneys[playerid] = strval(tmp);
		if (IsPlayerConnected(giveplayerid))
		{
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			playermoney[playerid] = GetPlayerMoney(playerid);
			if (moneys[playerid] > 0 && PlayerInfo[playerid][pBMoney] >= moneys[playerid])
			{
				PlayerInfo[playerid][pBMoney] = PlayerInfo[playerid][pBMoney]-moneys[playerid];
				PlayerInfo[giveplayerid][pBMoney] = PlayerInfo[giveplayerid][pBMoney]+moneys[playerid];
				format(string, sizeof(string), " $%d ,%s (id: %d) העברת לחשבון הבנק של ", giveplayer,giveplayerid, moneys[playerid]);
				SendClientMessage(playerid, COLOR_GREEN, string);
				format(string, sizeof(string), " $%d העביר לחשבון בנק שלך %s (id: %d) ", moneys[playerid], sendername, playerid);
				SendClientMessage(giveplayerid, COLOR_GREEN, string);
						}
			else {
				SendClientMessage(playerid, COLOR_BRIGHTRED, " סכום העברה שגוי ");
			}
		}
		else {
			format(string, sizeof(string), " לא מחובר ID:%d ", giveplayerid);
						SendClientMessage(playerid, COLOR_BRIGHTRED, string);
          }
     return 1;
     }
//---------------------------------Bank System----------------------------------
	if(strcmp(cmd, "/bank", true) == 0)
	{
	    if(IsPlayerInCheckpoint(playerid) == 0 || getCheckpointType(playerid) != CP_BANK && getCheckpointType(playerid) != CP_BANK_2 && getCheckpointType(playerid) != CP_BANK_3)
		{
	        SendClientMessage(playerid, COLOR_LIGHTBLUE, " אתה חייב להיות באזור הבנק");
			return 1;
		}
		new tmp8[256];
	    tmp8 = strtok(cmdtext, idx);

	    if(!strlen(tmp8))
		{
			SendClientMessage(playerid, COLOR_LIGHTBLUE, " /bank [amount] :שימוש ");
			return 1;
	    }
	    moneys[playerid] = strval(tmp8);
	    if(moneys[playerid] < 1)
		{
			SendClientMessage(playerid, COLOR_BRIGHTRED, " אתה חייב להכניס סכום יותר גדול מ 0 ");
			return 1;
		}

		if(GetPlayerMoney(playerid) < moneys[playerid])
		{
			SendClientMessage(playerid, COLOR_BRIGHTRED, " אין לך מספיק כסף ");
			return 1;
		}
		LACY_GiveMoney(playerid, 0-moneys[playerid]);
		PlayerInfo[playerid][pBMoney] = PlayerInfo[playerid][pBMoney]+moneys[playerid];
		format(string, sizeof(string), " [$%d] :הפקדת בחשבון הבנק שלך ,[$%d] :יש לך בחשבון הבנק", PlayerInfo[playerid][pBMoney], moneys[playerid]);
		SendClientMessage(playerid, COLOR_GREEN, string);
		return 1;
	}
//------------------------------Withdraw from Bank------------------------------
	if(strcmp(cmd, "/withdraw", true) == 0)
	{
	    if(IsPlayerInCheckpoint(playerid) == 0 || getCheckpointType(playerid) != CP_BANK && getCheckpointType(playerid) != CP_BANK_2 && getCheckpointType(playerid) != CP_BANK_3)
		{
	        SendClientMessage(playerid, COLOR_LIGHTBLUE, " אתה חייב להיות באזור הבנק");
			return 1;
		}
	    new tmp9[256];
	    tmp9 = strtok(cmdtext, idx);
	    if(!strlen(tmp9))
		{
			SendClientMessage(playerid, COLOR_LIGHTBLUE, " /withdraw [amount] :שימוש ");
			return 1;
	    }
	    moneys[playerid] = strval(tmp9);
	    if(moneys[playerid] < 1)
		{
			SendClientMessage(playerid, COLOR_BRIGHTRED, " אתה חייב להכניס סכום יותר גדול מ 0  ");
			return 1;
		}
  		if(moneys[playerid] > PlayerInfo[playerid][pBMoney])
		  {
    		SendClientMessage(playerid, COLOR_BRIGHTRED, " סכום משיכה שגוי ");
			return 1;
     	}
		LACY_GiveMoney(playerid, moneys[playerid]);
		PlayerInfo[playerid][pBMoney] = PlayerInfo[playerid][pBMoney]-moneys[playerid];
		format(string, sizeof(string), "[$%d] נשאר לך בחשבון הבנק ,[$%d] משכת מחשבון הנק שלך", PlayerInfo[playerid][pBMoney], moneys[playerid]);
		SendClientMessage(playerid, COLOR_GREEN, string);
		return 1;
   	}
//-----------------------------------Balance------------------------------------
	if(strcmp(cmd, "/balance", true) == 0)
	{
		if(IsPlayerInCheckpoint(playerid) == 0 || getCheckpointType(playerid) != CP_BANK && getCheckpointType(playerid) != CP_BANK_2 && getCheckpointType(playerid) != CP_BANK_3)
		{
	        SendClientMessage(playerid, COLOR_LIGHTBLUE, " אתה חייב להיות באזור הבנק");
			return 1;
		}
		format(string, sizeof(string), " [$%d] יש לך בבנק", PlayerInfo[playerid][pBMoney]);
		SendClientMessage(playerid, COLOR_GREEN, string);
		return 1;
	}
//---------------------------------Login System---------------------------------
	if(strcmp(cmd, "/login", true) == 0)
	{
		if(logged[playerid] == 1)
		{
		    SendClientMessage(playerid, COLOR_BRIGHTRED, " אתה כבר מחובר ");
  		return 1;
	}
	    tmp = strtok(cmdtext, idx);

 		GetPlayerName(playerid, playername, sizeof(playername));
	    if(!strlen(tmp))
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "/Login [password]");

		else
		{
			if (dini_Exists(udb_encode(playername)))
			{
					tmp2 = dini_Get(udb_encode(playername), "password");
			  		if (udb_hash(tmp) != strval(tmp2))
					  {
			    		SendClientMessage(playerid, COLOR_BRIGHTRED, " סיסמה שגויה ");
					}
					else {
						logged[playerid] = 1;
						dini_Set(udb_encode(playername),"pass",tmp);
                        PlayerInfo[playerid][pLevel] = dini_Int(udb_encode(playername), "Level");
		                PlayerInfo[playerid][pKills] = dini_Int(udb_encode(playername), "Kills");
		                PlayerInfo[playerid][pDeaths] = dini_Int(udb_encode(playername), "Deaths");
		                PlayerInfo[playerid][pBMoney] = dini_Int(udb_encode(playername), "Bank");
		                PlayerInfo[playerid][pMoney] = dini_Int(udb_encode(playername), "Money");
		                LACY_GiveMoney(playerid,PlayerInfo[playerid][pMoney]);
		        format(string, sizeof(string), "/stats התחברת בהצלחה כדי לראות את הסטאטס שלך [%s]", playername);
				SendClientMessage(playerid, COLOR_ORANGE, string);
				}
			}
			else {
			    format(string, sizeof(string), "/Register <Password> אתה לא רשום, נא להירשם בעזרת הפקודה %s ", playername);
				SendClientMessage(playerid, COLOR_BRIGHTRED, string);
			}
		}

		return 1;
	}
//------------------------------Registration-----------------------------
	if(strcmp(cmd, "/register", true) == 0)
	{
	    tmp = strtok(cmdtext, idx);
 		GetPlayerName(playerid, playername, sizeof(playername));
        if(20 < strlen(tmp) || strlen(tmp) < 5)
		{
			SendClientMessage(playerid, COLOR_YELLOW, " אורך הסיסמה חייב להיות בין 5-20 אותיות ");
			return 1;
		}
	    if(!strlen(tmp))
			SendClientMessage(playerid, COLOR_YELLOW, "/register [password]");

		else {
			if (!dini_Exists(udb_encode(playername)))
			{
                dini_Create(udb_encode(playername));
				dini_IntSet(udb_encode(playername), "password", udb_hash(tmp));
				dini_Set(udb_encode(playername),"pass",tmp);
   	            new year,month,day;	getdate(year, month, day);
                new strdate[20];
             	format(strdate, sizeof(strdate), "%d/%d/%d",day,month,year);
            	dini_Set(udb_encode(playername), "RegisteredDate",strdate);
				dini_IntSet(udb_encode(playername), "Deaths", 0);
    			dini_IntSet(udb_encode(playername), "Bank", 0);
    			dini_IntSet(udb_encode(playername), "Kills", 0);
    			dini_IntSet(udb_encode(playername), "Level", 0);
    			dini_IntSet(udb_encode(playername), "Money", 0);
				format(string, sizeof(string), "/login [password] להתחבר הקש [%s] הסיסמא שלך היא [%s] החשבון ", tmp, playername);
				SendClientMessage(playerid, COLOR_ORANGE, string);
			}
			else {
				format(string, sizeof(string), " אתה כבר רשום %s ", playername);
				SendClientMessage(playerid, COLOR_BRIGHTRED, string);
			}
		}

		return 1;
	}


//-----------------------------Stats------------------------

    
	if(strcmp(cmd, "/stats", true) == 0) {
    ShowScore(playerid);
    return 1; }
   	return 0; }


//------------------------------------------------------------------------------
//ShowScore
ShowScore(playerid)
{


new tmpTotal[128];
new pname[MAX_PLAYER_NAME];
GetPlayerName(playerid, pname, sizeof (pname));
new playerip[128];
GetPlayerIp(giveplayerid, playerip, sizeof(playerip));
format(tmpTotal, sizeof(tmpTotal), "name %s", pname);
SendClientMessage(playerid, COLOR_LIGHTBLUE, tmpTotal);
format(tmpTotal, sizeof(tmpTotal), "your's stats: kills[%d], Deaths[%d], level[%d], bank[$%d]", PlayerInfo[playerid][pKills],PlayerInfo[playerid][pDeaths],PlayerInfo[playerid][pLevel], PlayerInfo[playerid][pBMoney]);
SendClientMessage(playerid, COLOR_LIGHTBLUE, tmpTotal);
return 1;
}

//----------------------------------------------------------------------
// level car
forward OnPlayerStateChange(playerid, newstate, oldstate);
public OnPlayerStateChange(playerid, newstate, oldstate)
{
 if(newstate == PLAYER_STATE_DRIVER && GetVehicleModel(GetPlayerVehicleID(playerid)) == 469)
 {
 if (PlayerInfo[playerid][pLevel] < 1 && PlayerInfo[playerid][pKills] < 100)
 {
    SendClientMessage(playerid,0xAFAFAFAA," רכב זה מרמה 1 ומעלה");
    RemovePlayerFromVehicle(playerid);
 }
 }
  if(newstate == PLAYER_STATE_DRIVER && GetVehicleModel(GetPlayerVehicleID(playerid)) == 487)
 {
 if (PlayerInfo[playerid][pLevel] < 2 && PlayerInfo[playerid][pKills] < 200)
 {
    SendClientMessage(playerid,0xAFAFAFAA," רכב זה מרמה 2 ומעלה");
    RemovePlayerFromVehicle(playerid);
 }
 }
 if(newstate == PLAYER_STATE_DRIVER && GetVehicleModel(GetPlayerVehicleID(playerid)) == 520)
 {
 if (PlayerInfo[playerid][pLevel] < 5 && PlayerInfo[playerid][pKills] < 300)
 {
    SendClientMessage(playerid,0xAFAFAFAA," רכב זה מרמה 3 ומעלה");
    RemovePlayerFromVehicle(playerid);
 }
 }
  if(newstate == PLAYER_STATE_DRIVER && GetVehicleModel(GetPlayerVehicleID(playerid)) == 425)
 {
 if (PlayerInfo[playerid][pLevel] < 5 && PlayerInfo[playerid][pKills] < 300)
 {
    SendClientMessage(playerid,0xAFAFAFAA," רכב זה מרמה 3 ומעלה");
    RemovePlayerFromVehicle(playerid);
 }
 }
   if(newstate == PLAYER_STATE_DRIVER && GetVehicleModel(GetPlayerVehicleID(playerid)) == 447)
 {
 if (PlayerInfo[playerid][pLevel] < 4 && PlayerInfo[playerid][pKills] < 300)
 {
    SendClientMessage(playerid,0xAFAFAFAA," רכב זה מרמה 3 ומעלה");
    RemovePlayerFromVehicle(playerid);
 }
 }
    if(newstate == PLAYER_STATE_DRIVER && GetVehicleModel(GetPlayerVehicleID(playerid)) == 432)
 {
 if (PlayerInfo[playerid][pLevel] < 4 && PlayerInfo[playerid][pKills] < 300)
 {
    SendClientMessage(playerid,0xAFAFAFAA," רכב זה מרמה 3 ומעלה");
    RemovePlayerFromVehicle(playerid);
 }
 }
 if(newstate == PLAYER_STATE_DRIVER && GetVehicleModel(GetPlayerVehicleID(playerid)) == 476)
 {
 if (PlayerInfo[playerid][pLevel] < 1 && PlayerInfo[playerid][pKills] < 100)
 {
    SendClientMessage(playerid,0xAFAFAFAA," רכב זה מרמה 1 ומעלה");
    RemovePlayerFromVehicle(playerid);
 }
 }
 return 1;
}


public Levels(playerid)
{
if(IsPlayerConnected(playerid))
{
if (PlayerInfo[playerid][pLevel] == 0 && PlayerInfo[playerid][pKills] >= 100)
{
PlayerInfo[playerid][pLevel] +=1;
SetPlayerWantedLevel(playerid,1);
SendClientMessage(playerid,COLOR_LIGHTBLUE," מזל טוב עלית לרמה 1");
}
if (PlayerInfo[playerid][pLevel] == 1 && PlayerInfo[playerid][pKills] >= 200)
{
PlayerInfo[playerid][pLevel] +=1;
SetPlayerWantedLevel(playerid,2);
SendClientMessage(playerid,COLOR_LIGHTBLUE," מזל טוב עלית רלמה 2");
}
if (PlayerInfo[playerid][pLevel] == 2 && PlayerInfo[playerid][pKills] >= 300)
{
PlayerInfo[playerid][pLevel] +=1;
SetPlayerWantedLevel(playerid,3);
SendClientMessage(playerid,COLOR_LIGHTBLUE," מזל טוב עלית לרמה 3");
}
if (PlayerInfo[playerid][pLevel] == 3 && PlayerInfo[playerid][pKills] >= 400)
{
PlayerInfo[playerid][pLevel] +=1;
SetPlayerWantedLevel(playerid,4);
SendClientMessage(playerid,COLOR_LIGHTBLUE," מזל טוב עלית לרמה 4");
}
if (PlayerInfo[playerid][pLevel] == 4 && PlayerInfo[playerid][pKills] >= 500)
{
PlayerInfo[playerid][pLevel] +=1;
SetPlayerWantedLevel(playerid,5);
SendClientMessage(playerid,COLOR_LIGHTBLUE," מזל טוב עלית לרמה 5");
}
if (PlayerInfo[playerid][pLevel] == 5 && PlayerInfo[playerid][pKills] >= 600)
{
PlayerInfo[playerid][pLevel] +=1;
SetPlayerWantedLevel(playerid,6);
SendClientMessage(playerid,COLOR_LIGHTBLUE," מזל טוב עלית לרמה 6");
}
if (PlayerInfo[playerid][pLevel] == 6 && PlayerInfo[playerid][pKills] >= 800)
{
PlayerInfo[playerid][pLevel] +=1;
SetPlayerWantedLevel(playerid,7);
SendClientMessage(playerid,COLOR_LIGHTBLUE," מזל טוב עלית לרמה 7");
}
if (PlayerInfo[playerid][pLevel] == 7 && PlayerInfo[playerid][pKills] >= 1000)
{
PlayerInfo[playerid][pLevel] +=1;
SetPlayerWantedLevel(playerid,8);
SendClientMessage(playerid,COLOR_LIGHTBLUE," מזל טוב עלית לרמה 8");
}
if (PlayerInfo[playerid][pLevel] == 8 && PlayerInfo[playerid][pKills] >= 1200)
{
PlayerInfo[playerid][pLevel] +=1;
SetPlayerWantedLevel(playerid,9);
SendClientMessage(playerid,COLOR_LIGHTBLUE," מזל טוב עלית לרמה 9");
}
if (PlayerInfo[playerid][pLevel] == 9 && PlayerInfo[playerid][pKills] >= 1400)
{
PlayerInfo[playerid][pLevel] +=1;
SetPlayerWantedLevel(playerid,10);
SendClientMessage(playerid,COLOR_LIGHTBLUE," מזל טוב עלית לרמה 10");
KillTimer(LevelTimer);
}
}
return 1;
}

//==============================Is Player in Area===============================
public isPlayerInArea(playerID, Float:data[4])
{
	new Float:X, Float:Y, Float:Z;

	GetPlayerPos(playerID, X, Y, Z);
	if(X >= data[0] && X <= data[2] && Y >= data[1] && Y <= data[3]) {
return 1;
}
return 0;
}
//============================Get Checkpoint Type===============================
public getCheckpointType(playerID)
{
	return checkpointType[playerCheckpoint[playerID]];
}
//==============================Checkpoint Update===============================
public checkpointUpdate()
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i)) {
	        for(new j=0; j < MAX_POINTS; j++) {
	            if(isPlayerInArea(i, checkCoords[j])) {
						if(playerCheckpoint[i]!= j) {
	                    DisablePlayerCheckpoint(i);
						SetPlayerCheckpoint(i, checkpoints[j][0],checkpoints[j][1],checkpoints[j][2],checkpoints[j][3]);
						playerCheckpoint[i] = j;
					}
	            } else {
	            	if(playerCheckpoint[i]==j) {
	            	    DisablePlayerCheckpoint(i);
	            	    playerCheckpoint[i] = 999;
         	    	}
	            }
	        }
		}
	}
}
//=================================================kick login=====================
public Timer(playerid,time)
{
   if(!time)
      Kick(playerid);
   else
   {
        if(!logged[playerid]&&IsPlayerConnected(playerid))
        {
            new string[256];
            format(string,256,"~y~%d",time);
            GameTextForPlayer(playerid,string,6000,3);
            SetTimerEx("Timer",1000,0,"dd",playerid,time-1);
        }
   }
}
//=================================================kick ban=====================
public Timer1(playerid,time)
{
   if(!time)
      Kick(playerid);
   else
   {
        if(!dini_Exists(udb_encode(playername))&&IsPlayerConnected(playerid))
        {
            new string[256];
            format(string,256,"~y~%d",time);
            GameTextForPlayer(playerid,string,6000,3);
            SetTimerEx("Timer",1000,0,"dd",playerid,time-1);
        }
   }
}
