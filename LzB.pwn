#include <a_samp>
#include <Dini>
#pragma tabsize 0
new Kills[MAX_PLAYERS];
new Deaths[MAX_PLAYERS];
new Level[MAX_PLAYERS];
new Name[MAX_PLAYER_NAME];
new zo[MAX_PLAYERS];
new res[MAX_PLAYERS];
new cr[MAX_PLAYERS];
new bus;
#define COLOR_GREY 0xAFAFAFAA
#define COLOR_RED 0xAA3333AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_PINK 0xFF66FFAA
#define COLOR_BLUE 0x0000BBAA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_4BLUE 0x33CCFFAA
#define COLOR_DARKRED 0x660000AA
#define COLOR_ORANGE 0xFF9900AA
#define COLOR_BRIGHTRED 0xFF0000AA
#define COLOR_INDIGO 0x4B00B0AA
#define COLOR_VIOLET 0x9955DEEE
#define COLOR_LIGHTRED 0xFF99AADD
#define COLOR_SEAGREEN 0x00EEADDF
#define COLOR_GRAYWHITE 0xEEEEFFC4
#define COLOR_LIGHTNEUTRALBLUE 0xabcdef66
#define COLOR_GREENISHGOLD 0xCCFFDD56
#define COLOR_LIGHTBLUEGREEN 0x0FFDD349
#define COLOR_NEUTRALBLUE 0xABCDEF01
#define COLOR_LIGHTCYAN 0xAAFFCC33
#define vblue 0x2F62D8AA
#define vpink 0xFF32D1AA
#define COLOR_LEMON 0xDDDD2357
#define COLOR_MEDIUMBLUE 0x63AFF00A
#define COLOR_NEUTRAL 0xABCDEF97
#define COLOR_BLACK 0x00000000
#define COLOR_NEUTRALGREEN 0x81CFAB00
#define pink 0xCCFF00FFAA
#define rblue 0x1D69A1AA
#define COLOR_DARKGREEN 0x12900BBF
#define COLOR_LIGHTGREEN 0x24FF0AB9
#define COLOR_BLUEGREEN 0x46BBAA00
#define COLOR_PINK 0xFF66FFAA
#define COLOR_LIGHTBLUE 0x33CCFFAA
#define COLOR_DARKRED 0x660000AA
#define COLOR_ORANGE 0xFF9900AA
#define COLOR_PURPLE 0x800080AA
#define COLOR_GRAD1 0xB4B5B7FF
#define COLOR_GRAD2 0xBFC0C2FF
#define COLOR_RED1 0xFF0000AA
#define COLOR_GREY 0xAFAFAFAA
#define COLOR_GREEN 0x33AA33AA
#define COLOR_RED 0xAA3333AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_BROWN 0x993300AA
#define COLOR_CYAN 0x99FFFFAA
#define COLOR_TAN 0xFFFFCCAA
#define COLOR_PINK 0xFF66FFAA
#define COLOR_KHAKI 0x999900AA
#define P_OFFSET    3
#define COLOR_LIME 0x99FF00AA
#define COLOR_SYSTEM 0xEFEFF7AA
#define rr 0xFF0000AA
#define blue 0x33CCFFAA
public OnFilterScriptInit()
{
AddStaticVehicle(417,727.9064,-1457.9347,22.3099,268.2795,0,0); // zvehicle
AddStaticVehicle(446,731.1974,-1495.2788,-0.6030,181.5233,6,7); // zvehicle2
AddStaticVehicle(446,718.3168,-1496.2142,-0.5131,179.5069,126,0); // zvehicle2
AddStaticVehicle(411,726.6551,-1430.8424,13.3391,90.2348,127,122); // vzombie
AddStaticVehicle(419,739.5495,-1439.1234,13.3405,87.9707,147,0); // zviehicle
AddStaticVehicle(437,751.4882,-1433.2858,13.6570,91.9207,86,149); // vheicle
bus = AddStaticVehicle(437,403.3256,-1422.7142,33.6353,216.4155,87,7); // bustrip
	print("\n--------------------------------------");
	print(" The Scrift By Style Root.co.il");
	print("--------------------------------------\n");
	return 1;
}

public OnFilterScriptExit()
{
DestroyVehicle(bus);
	return 1;
}


public OnPlayerRequestClass(playerid, classid)
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnPlayerConnect(playerid)
{
SendClientMessage(playerid,COLOR_GREEN," על הבנייה Style קרדיט לרועי /lzb הקש LzB Mode לעזרה ב ");
OnPlayerCommandText(playerid,"/stats");

	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
cr[playerid] = 0;
	return 1;
}

public OnPlayerSpawn(playerid)
{if(zo[playerid] == 0)
{
GivePlayerWeapon(playerid,4,1);
}
if(zo[playerid] == 1)
{
ResetPlayerWeapons(playerid);
GivePlayerWeapon(playerid,9,1);
GivePlayerWeapon(playerid,16,1000);
SetPlayerSkin(playerid,213);
SetPlayerPos(playerid,737.3419,-1458.0972,22.2109);
SetPlayerColor(playerid,0x00FF06AA);
}
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
res[killerid]++;
res[playerid] = 0;
if(res[killerid] == 5)
{
cr[killerid] = 1;
SendClientMessage(killerid,COLOR_YELLOW,"/sz הרגת 5 משתמשים ולכן אתה יכול להפוך את אחד המשתמש לזומבי בעזרת הפקודה");
}
new Name2[MAX_PLAYER_NAME];
new file[256];
new file2[256];
GetPlayerName(playerid, Name, sizeof(Name));
format(file,sizeof(file),"%s.txt",Name);
GetPlayerName(killerid, Name2, sizeof(Name2));
format(file2,sizeof(file2),"%s.txt",Name2);
Kills[killerid] = dini_Int(file2,"K");
Kills[killerid]++;
dini_IntSet(file2,"K",Kills[killerid]);
Deaths[playerid] = dini_Int(file,"D");
Deaths[playerid]++;
dini_IntSet(file,"D",Deaths[playerid]);
if(zo[playerid] == 0 && zo[killerid] == 1)
{
MakePlayerNotZombie(killerid);
MakePlayerZombie(playerid);
}
if(zo[playerid] == 1 && zo[killerid] == 0)
{
Kills[killerid] = dini_Int(file2,"K");
Kills[killerid]++;
dini_IntSet(file2,"K",Kills[killerid]);
}



	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerPrivmsg(playerid, recieverid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	new file[256];
   new string[256];
      new cmd[256],tmp[256];
	new idx;
	cmd = Top_strtok(cmdtext, idx);
		new pName[MAX_PLAYER_NAME];
				GetPlayerName(playerid, pName, sizeof(pName));
	format(file,sizeof(file),"%s.txt",pName);
	Kills[playerid] = dini_Int(file,"K");
Deaths[playerid] = dini_Int(file,"D");
Level[playerid] = dini_Int(file,"L");
	if(strcmp(cmdtext, "/bustrip", true) == 0) {
    PutPlayerInVehicle(playerid,bus,1);
	SetPlayerInterior(playerid,0);
	return 1;
	}
	if(strcmp(cmdtext, "/stats", true) == 0) {

	GetPlayerName(playerid, pName, sizeof(pName));
	format(file,sizeof(file),"%s.txt",pName);
	if(!dini_Exists(file)) {
	 dini_Create(file);
	 dini_IntSet(file,"L",1);
}
Kills[playerid] = dini_Int(file,"K");
Deaths[playerid] = dini_Int(file,"D");
Level[playerid] = dini_Int(file,"L");
	GetPlayerName(playerid, Name, sizeof(Name));
	format(file,sizeof(file),"%s.txt",Name);
	format(tmp,sizeof(tmp),"Level : %d, Kills : %d, Deaths : %d",Level[playerid],Kills[playerid],Deaths[playerid]);
	SendClientMessage(playerid,COLOR_BLUE,tmp);
		return 1;
	}
	if(strcmp(cmdtext, "/zohelp", true) == 0) {
	SendClientMessage(playerid,COLOR_GREEN,"ברוכים הבאים להסבר על הזומבים בשרת זה");
	SendClientMessage(playerid,COLOR_GREEN,"זומבים שווים 2 הריגות");
	SendClientMessage(playerid,COLOR_GREEN,"לזומבים מפקדה משלהם");
	SendClientMessage(playerid,COLOR_GREEN,"אם זומבי הורג מישהו שהוא לא זומבי האיש שנהרג הופך גם לזומבי");
	SendClientMessage(playerid,COLOR_GREEN,"אם מישהו לא זומבי הורג זומבי עם סכין אז הזומבי הופך לשחקן רגיל");
	return 1;
	}
       	if (strcmp(cmd, "/lzb", true)==0)
	{
    new id;
    tmp = Top_strtok(cmdtext, idx);
	id = strval(tmp);
	if(!strlen(tmp)) {
	SendClientMessage(playerid, 0x33AA33AA, "/lzb [1-2]");
	return 1;
	}
    if(id == 1)
    {
	SendClientMessage(playerid,COLOR_YELLOW,"ברוכים הבאים לאשף העזרה");
	SendClientMessage(playerid,COLOR_YELLOW,"/stats - לקבלת מידע על רמתך ההריגות שלך והפעמים שהרגו אותך");
	SendClientMessage(playerid,COLOR_YELLOW,"/psatts - לקבל מידע על משתמש אחר רמה הריגות ומיתות");
	SendClientMessage(playerid,COLOR_YELLOW,"/uplevel - לעלות רמה");
	SendClientMessage(playerid,COLOR_YELLOW,"/bustrip - לטיול אוטובוס");
	return 1;
	}
	if(id == 2)
	{
		SendClientMessage(playerid,COLOR_YELLOW,"/myskin - לשנות את הדמות שלך");
	SendClientMessage(playerid,COLOR_YELLOW,"/vpj - לשנות את הערכת נושא של האוטו");
	SendClientMessage(playerid,COLOR_YELLOW,"/sz - אחרי שעשית רצף של חמש הריגות אתה יכול להפוך שחקן לזומבי");
	SendClientMessage(playerid,COLOR_YELLOW,"/makemetozombie - להפוך את עצמך לזומבי");
	SendClientMessage(playerid,COLOR_YELLOW,"/zohelp - מידע על זומבים");
	SendClientMessage(playerid,COLOR_YELLOW,"/mycolor - שינוי צבע שחקן");
	return 1;
	}
		SendClientMessage(playerid, 0x33AA33AA, "/lzb [1-2]");
	return 1;
	}
		if(strcmp(cmdtext, "/uplevel", true) == 0) {
		GetPlayerName(playerid, pName, sizeof(pName));
	format(file,sizeof(file),"%s.txt",pName);
	Kills[playerid] = dini_Int(file,"K");
Deaths[playerid] = dini_Int(file,"D");
Level[playerid] = dini_Int(file,"L");
if(Level[playerid] == 1 && Kills[playerid] < 100)
{
SendClientMessage(playerid,rr,"אתה צריך 100 הריגות כדי לעלות רמה");
return 1;
}
if(Level[playerid] == 2 && Kills[playerid] < 200)
{
SendClientMessage(playerid,rr,"אתה צריך 200 הריגות כדי לעלות רמה");
return 1;
}
if(Level[playerid] == 3 && Kills[playerid] < 300)
{
SendClientMessage(playerid,rr,"אתה צריך 300 הריגות כדי לעלות רמה");
return 1;
}
if(Level[playerid] == 4 && Kills[playerid] < 500)
{
SendClientMessage(playerid,rr,"אתה צריך 500 הריגות כדי לעלות רמה");
return 1;
}
if(Level[playerid] == 5 && Kills[playerid] < 700)
{
SendClientMessage(playerid,rr,"אתה צריך 700 הריגות כדי לעלות רמה");
return 1;
}
if(Level[playerid] == 6 && Kills[playerid] < 900)
{
SendClientMessage(playerid,rr,"אתה צריך 900 הריגות כדי לעלות רמה");
return 1;
}
if(Level[playerid] == 7 && Kills[playerid] < 1150)
{
SendClientMessage(playerid,rr,"אתה צריך 1150 הריגות כדי לעלות רמה");
return 1;
}
if(Level[playerid] == 8 && Kills[playerid] < 1400)
{
SendClientMessage(playerid,rr,"אתה צריך 1400 רמות כדי לעלות רמה");
return 1;
}
if(Level[playerid] == 9 && Kills[playerid] < 1500)
{
SendClientMessage(playerid,rr,"אתה צריך 1500 הריגות כדי לעלות רמה");
return 1;
}
if(Level[playerid] == 10)
{
SendClientMessage(playerid,COLOR_YELLOW,"אתה כבר ברמה המקסימלית 10");
return 1;
}
Level[playerid]++;
dini_IntSet(file,"L",Level[playerid]);
format(string,sizeof(string),"%d מזל טוב עלית לרמה",Level[playerid]);
SendClientMessage(playerid,COLOR_GREEN,string);
	return 1;
	}
		if(strcmp(cmd, "/pstats", true) == 0) {

    new id;
    tmp = Top_strtok(cmdtext, idx);
	id = strval(tmp);
	if(!IsPlayerConnected(id)) {
	SendClientMessage(playerid, 0xFAFAFAAA, "האידי שאותי הזנת לא מחובר");
	return 1;
	}
 new gName[MAX_PLAYER_NAME];
 new gfile[256];
	GetPlayerName(id, gName, sizeof(gName));
	format(gfile,sizeof(gfile),"%s.txt",gName);
	if(!dini_Exists(gfile)) {
	 dini_Create(gfile);
	 dini_IntSet(gfile,"L",1);
}
Kills[id] = dini_Int(gfile,"K");
Deaths[id] = dini_Int(gfile,"D");
Level[id] = dini_Int(gfile,"L");
	GetPlayerName(id, gName, sizeof(gName));
	format(gfile,sizeof(gfile),"%s.txt",gName);
	format(tmp,sizeof(tmp),"Level : %d, Kills : %d, Deaths : %d",Level[id],Kills[id],Deaths[id]);
	SendClientMessage(playerid,COLOR_ORANGE,tmp);
	return 1;
	}
		if(strcmp(cmd, "/vpj", true) == 0) {
	if(Level[playerid] < 3)
	{
	SendClientMessage(playerid,rr,"אתה צריך ליהיות רמה 3 כדי לבצע פקודה זה");
	return 1;
	}
	if (GetPlayerState(playerid) != PLAYER_STATE_DRIVER) {
	SendClientMessage(playerid,rr,"אתה לא נוהג בתוך רכב");
	return 1;
	}

    new ns;
    tmp = Top_strtok(cmdtext, idx);
	ns = strval(tmp);
	if(!strlen(tmp)) {
	SendClientMessage(playerid, 0x33AA33AA, "/vpj [0-5]");
	return 1;
	}
	if(ns > 5 || ns < 0)
	{
	SendClientMessage(playerid,rr,"בחרת מספר ערכת נושא שהוא לא 0 עד 5");
	return 1;
	}
	ChangeVehiclePaintjob(GetPlayerVehicleID(playerid),ns);
	SendClientMessage(playerid,blue,"שינית את הערכת נושא של הרכב בהצלחה");
	return 1;
	}
	if(strcmp(cmd, "/zombiehotel", true) == 0) {
	if(zo[playerid] != 1)
	{
	SendClientMessage(playerid,rr,"אתה לא זומבי ולכן אתה לא יכול להשתגר לזומבי הוטל");
	return 1;
	}
	SendClientMessage(playerid,COLOR_GREEN,"שוגרת לזומבי הוטל כאן תוכל לבלות עם כל שאר הזומבים");
	ResetPlayerWeapons(playerid);
GivePlayerWeapon(playerid,9,1);
GivePlayerWeapon(playerid,16,1000);
SetPlayerSkin(playerid,213);
SetPlayerPos(playerid,737.3419,-1458.0972,22.2109);
SetPlayerColor(playerid,0x00FF06AA);
return 1;
}
		if(strcmp(cmd, "/sz", true) == 0) {
if(cr[playerid] == 0)
{
SendClientMessage(playerid,rr,"לא הגעת לרצף של 5 הריגות");
return 1;
}
    new ns;
    tmp = Top_strtok(cmdtext, idx);
	ns = strval(tmp);
	if(!strlen(tmp)) {
	SendClientMessage(playerid, 0x33AA33AA, "/sz [id]");
	return 1;
	}
	if(playerid == ns)
	{
	SendClientMessage(playerid,rr,"/MakeMeZombie אתה לא יכול לשים לעצמך זומבי אם אתה רוצה ליהיות זומבי הקש את הפקודה");
	return 1;
	}
	cr[playerid] = 0;
SendClientMessage(playerid,COLOR_GREEN,"הפכת את המשתמש לזומבי בהצלחה");
MakePlayerZombie(ns);
	return 1;
 }
 if(strcmp(cmd, "/MakeMeToZombie", true) == 0) {
 MakePlayerZombie(playerid);
 return 1;
 }
	if(strcmp(cmd, "/mycolor", true) == 0) {
	if(Level[playerid] < 4)
	{
	SendClientMessage(playerid,rr,"אתה צריך ליהיות רמה 4 ומעלה כדי לבצע פקודה זו");
	return 1;
	}
	    new ns;
    tmp = Top_strtok(cmdtext, idx);
	ns = strval(tmp);
			    	if(!strlen(tmp)) {
	SendClientMessage(playerid, 0x33AA33AA, "/mycolor [1-256] [1-256] [1-256] [1-256]");
	return 1;
	}
	if(ns < 0 || ns > 256)
	{
	SendClientMessage(playerid, 0x33AA33AA, "/mycolor [1-256] [1-256] [1-256] [1-256]");
	return 1;
	}
		    new ns2;
    tmp = Top_strtok(cmdtext, idx);
	ns2 = strval(tmp);
				    	if(!strlen(tmp)) {
	SendClientMessage(playerid, 0x33AA33AA, "/mycolor [1-256] [1-256] [1-256] [1-256]");
	return 1;
	}
	if(ns2 < 0 || ns2 > 256)
	{
	SendClientMessage(playerid, 0x33AA33AA, "/mycolor [1-256] [1-256] [1-256] [1-256]");
	return 1;
	}
		    new ns3;
    tmp = Top_strtok(cmdtext, idx);
	ns3 = strval(tmp);
				    	if(!strlen(tmp)) {
	SendClientMessage(playerid, 0x33AA33AA, "/mycolor [1-256] [1-256] [1-256] [1-256]");
	return 1;
	}
	if(ns3 < 0 || ns3 > 256)
	{
	SendClientMessage(playerid, 0x33AA33AA, "/mycolor [1-256] [1-256] [1-256] [1-256]");
	return 1;
	}

		    new ns4;
    tmp = Top_strtok(cmdtext, idx);
	ns4 = strval(tmp);
				    	if(!strlen(tmp)) {
	SendClientMessage(playerid, 0x33AA33AA, "/mycolor [1-256] [1-256] [1-256] [1-256]");
	return 1;
	}
	if(ns4 < 0 || ns4 > 256)
	{
	SendClientMessage(playerid, 0x33AA33AA, "/mycolor [1-256] [1-256] [1-256] [1-256]");
	return 1;
	}
	SetPlayerColor(playerid,rgba2hex(ns, ns2, ns3, ns4));
	return 1;
	}
	if(strcmp(cmd, "/myskin", true) == 0) {
	if(Level[playerid] < 2)
	{
	SendClientMessage(playerid,rr,"אתה צריך ליהיות רמה 2 ומעלה כדי לבצע פקודה זו");
	return 1;
	}
    new ns;
    tmp = Top_strtok(cmdtext, idx);
	ns = strval(tmp);
	if(!strlen(tmp)) {
	SendClientMessage(playerid, 0x33AA33AA, "/myskin [1-10]");
	return 1;
	}
	if(ns > 10 || ns < 1)
	{
	SendClientMessage(playerid,rr,"בחרת מספר סקין שהוא לא מ1 עד 10");
	return 1;
	}
	if(ns == 1)
	{
	SetPlayerSkin(playerid,115);
	}
	if(ns == 2)
	{
	SetPlayerSkin(playerid,123);
	}
	if(ns == 3)
	{
	SetPlayerSkin(playerid,101);
	}
	if(ns == 4)
	{
	SetPlayerSkin(playerid,165);
	}
	if(ns == 5)
	{
	if(Level[playerid] < 3)
	{
	SendClientMessage(playerid,rr,"סקין זה מיוחד ואיתו מקבלים סקייטים ולכן אתה צריך ליהיות רמה 3");
	return 1;
	}
	SetPlayerSkin(playerid,99);
	}
		if(ns == 6)
	{
	SetPlayerSkin(playerid,217);
	}
		if(ns == 7)
	{
	SetPlayerSkin(playerid,192);
	}
		if(ns == 8)
	{
	SetPlayerSkin(playerid,28);
	}
			if(ns == 9)
	{
	SetPlayerSkin(playerid,23);
	}
				if(ns == 10)
	{
	SetPlayerSkin(playerid,181);
	}
	SendClientMessage(playerid,COLOR_GREEN,"שינית דמות בהצלחה");
	return 1;
	}
	return 0;
}

public OnPlayerInfoChange(playerid)
{
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
if (vehicleid == bus && ispassenger == 0)
{
new string[256];
new sName[MAX_PLAYER_NAME];
GetPlayerName(playerid, sName, sizeof(sName));
format(string,sizeof(string)," /bustrip התחיל טיול אוטובוס כדי להצתרף %s ",sName);
SendClientMessageToAll(pink,string);
return 1;
}
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}
forward MakePlayerZombie(playerid);
forward MakePlayerNotZombie(playerid);
public MakePlayerZombie(playerid)
{
zo[playerid] = 1;
SendClientMessage(playerid,COLOR_ORANGE,"אתה זומבי מואהאהאהאה");
SendClientMessage(playerid,COLOR_ORANGE,"/zohelp כדי לראות פרטים על זומבים בשרת תקיש את הפקודה");
return 1;
}
public MakePlayerNotZombie(playerid)
{
zo[playerid] = 0;
SendClientMessage(playerid,COLOR_ORANGE,"יצאת ממצב זומבי");
return 1;
}
Top_strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' ') && (string[index] > '\r'))
	{
		index++;
	}

	new offset = index;
	new result[30];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)) && (string[index] > '\r'))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}
 rgba2hex(r, g, b, a)
    return (r * 16777216) + (g * 65536) + (b * 256) + a;
