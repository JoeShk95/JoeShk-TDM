#include <a_samp>
#include <core>
#include <float>



#define COLOR_GREY 0xAFAFAFAA
#define COLOR_GREEN 0x33AA33AA
#define COLOR_RED 0xAA3333AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_BLUE 0x0000BBAA
#define COLOR_LIGHTBLUE 0x33CCFFAA
#define COLOR_ORANGE 0xFF9900AA

#pragma tabsize 0

#define COLOR_GREY 0xAFAFAFAA
#define COLOR_GREEN 0x33AA33AA
#define COLOR_RED 0xAA3333AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_WHITE 0xFFFFFFAA
#define PocketMoney 1000 // Amount player recieves on spawn.
#define INACTIVE_PLAYER_ID 255
#define GIVECASH_DELAY 5000 // Time in ms between /givecash commands.

#define NUMVALUES 4

forward MoneyGrubScoreUpdate();
forward Givecashdelaytimer(playerid);
forward SetPlayerRandomSpawn(playerid);
forward SetupPlayerForClassSelection(playerid);
forward GameModeExitFunc();
forward SendPlayerFormattedText(playerid, const str[], define);
forward public SendAllFormattedText(playerid, const str[], define);

//------------------------------------------------------------------------------------------------------

new CashScoreOld;
new iSpawnSet[MAX_PLAYERS];

new Float:gRandomPlayerSpawns[23][3] = {
{1958.3783,1343.1572,15.3746},
{2199.6531,1393.3678,10.8203},
{2483.5977,1222.0825,10.8203},
{2637.2712,1129.2743,11.1797},
{2000.0106,1521.1111,17.0625},
{2024.8190,1917.9425,12.3386},
{2261.9048,2035.9547,10.8203},
{2262.0986,2398.6572,10.8203},
{2244.2566,2523.7280,10.8203},
{2335.3228,2786.4478,10.8203},
{2150.0186,2734.2297,11.1763},
{2158.0811,2797.5488,10.8203},
{1969.8301,2722.8564,10.8203},
{1652.0555,2709.4072,10.8265},
{1564.0052,2756.9463,10.8203},
{1271.5452,2554.0227,10.8203},
{1441.5894,2567.9099,10.8203},
{1480.6473,2213.5718,11.0234},
{1400.5906,2225.6960,11.0234},
{1598.8419,2221.5676,11.0625},
{1318.7759,1251.3580,10.8203},
{1558.0731,1007.8292,10.8125},
//{-857.0551,1536.6832,22.5870},   Out of Town Spawns
//{817.3494,856.5039,12.7891},
//{116.9315,1110.1823,13.6094},
//{-18.8529,1176.0159,19.5634},
//{-315.0575,1774.0636,43.6406},
{1705.2347,1025.6808,10.8203}
};

new Float:gCopPlayerSpawns[2][3] = {
{2297.1064,2452.0115,10.8203},
{2297.0452,2468.6743,10.8203}
};

//Round code stolen from mike's Manhunt :P
//new gRoundTime = 3600000;                   // Round time - 1 hour
//new gRoundTime = 1200000;					// Round time - 20 mins
//new gRoundTime = 900000;					// Round time - 15 mins
//new gRoundTime = 600000;					// Round time - 10 mins
//new gRoundTime = 300000;					// Round time - 5 mins
//new gRoundTime = 120000;					// Round time - 2 mins
//new gRoundTime = 60000;					// Round time - 1 min

new gActivePlayers[MAX_PLAYERS];
new gLastGaveCash[MAX_PLAYERS];

//------------------------------------------------------------------------------------------------------

main()
{
		print("\n----------------------------------");
		print("     Running LVDM ~MoneyGrub\n");
		print("            Coded By");
		print("            New-World_____adam");
		print("----------------------------------\n");
}

//------------------------------------------------------------------------------------------------------

public MoneyGrubScoreUpdate()
{
	new CashScore;
	new name[MAX_PLAYER_NAME];
	//new string[256];
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
				//format(string, sizeof(string), "$$$ %s is now in the lead $$$", name);
				//SendClientMessageToAll(COLOR_YELLOW, string);
			}
		}
	}
}

//------------------------------------------------------------------------------------------------------

/*public GrubModeReset()
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if (IsPlayerConnected(i))
		{
			SetPlayerScore(i, PocketMoney);
			SetPlayerRandomSpawn(i, classid);
		}
	}

}*/

//------------------------------------------------------------------------------------------------------

public OnPlayerConnect(playerid)
{



	GameTextForPlayer(playerid,"~w~This mode ~r~Created ~g~or",5000,0);
	GameTextForPlayer(playerid,"www.idf.cos.il",5000,0);
	SendClientMessage(playerid, COLOR_ORANGE, "--------- ברוכים הבאים לשרת--------------- ) ");
	SendClientMessage(playerid, COLOR_RED,  " יוצר המוד אור כהן! KillEr_C0hEn  ");
    SendClientMessage(playerid, COLOR_RED,  " אדמינים בסרבר: roykiller,barak,KillEr_C0hEn ");
    SendClientMessage(playerid, COLOR_YELLOW, " /REGISTER PASS להרשמה ");
    SendClientMessage(playerid, COLOR_YELLOW, " /Login pass להיתחברות ");
    SendClientMessage(playerid, COLOR_YELLOW, " /tele לרשימת פקודות השיגור ");
    SendClientMessage(playerid, COLOR_YELLOW, " /Cool דברים מגניבים ");
    SendClientMessage(playerid, COLOR_YELLOW, " /help כדי להבין יותר על המוד ועל התפקידים במוד הקישו את הפקודה  ");
    SendClientMessage(playerid, COLOR_YELLOW, "/News חדשות בשרת ");
    
    	gActivePlayers[playerid]++;
	gLastGaveCash[playerid] = GetTickCount();
	
 return 1;
	}
//------------------------------------------------------------------------------------------------------
public OnPlayerDisconnect(playerid)
{
	gActivePlayers[playerid]--;
}
//------------------------------------------------------------------------------------------------------

public OnPlayerCommandText(playerid, cmdtext[])
{
	new string[256];
	new playermoney;
	new sendername[MAX_PLAYER_NAME];
	new giveplayer[MAX_PLAYER_NAME];
	new cmd[256];
	new giveplayerid, moneys, idx;

	cmd = strtok(cmdtext, idx);
//==============================================================================
	if(strcmp(cmd, "/help", true) == 0) {
		SendClientMessage(playerid, COLOR_RED, " ברוכים הבאים לתפריט המוד שלנו!! ");
		SendClientMessage(playerid, COLOR_RED, " במוד זה יהיו הרבה דברים כגון:עבודות,מלחמות,סוחרי סמים,שיגורים ועוד!! .");
        SendClientMessage(playerid, COLOR_RED, " לדעת שיגורים: /tele ");
        SendClientMessage(playerid, COLOR_RED, " לדברים מגנבים /cool ");
        SendClientMessage(playerid, COLOR_RED, " לחדשות /news ");
        SendClientMessage(playerid, COLOR_RED, "  /register pass אז כדי להמשיך לכייף הירשמו לשרת בעזרת הפקודה .");
        SendClientMessage(playerid, COLOR_YELLOW, "זכרו!!! צ'יטר שיתפס יענש בחומרה רבה!!!");
		SendClientMessage(playerid, COLOR_RED, "             Or-מתכנת ראשי .");
		SendClientMessage(playerid, COLOR_RED, "  !______________________________צוות השרת, מקווים שתהנו!!__________________________!");
    return 1;
	}
//==============================================================================
	if(strcmp(cmd, "/tele", true) == 0) {
	SendClientMessage(playerid, COLOR_ORANGE, "  /race שיגור לאזור המרוצים ");
     SendClientMessage(playerid, COLOR_ORANGE, " /jump לאזור הקפיצה ");
     SendClientMessage(playerid, COLOR_ORANGE, " /ramp לאזור הרמפות ");
    SendClientMessage(playerid, COLOR_ORANGE, " /drift  לאזור הדריפט ");
     SendClientMessage(playerid, COLOR_ORANGE, " /bumper מכוניות מיתנגשות ");
     SendClientMessage(playerid, COLOR_ORANGE, " /bicycles אזור טיולי האופניים ");
    SendClientMessage(playerid, COLOR_ORANGE, " מוד פצצה! ");
     SendClientMessage(playerid, COLOR_ORANGE, " /bank שיגור לבנק  ");
     SendClientMessage(playerid, COLOR_BLUE,"להמשך השיגורים /tele2");
      return 1;
	}
	
//==============================================================================
	if(strcmp(cmd, "/tele2", true) == 0) {
	SendClientMessage(playerid, COLOR_ORANGE, "/ap1 לנמל התעופה בעיר הראשונה");
     SendClientMessage(playerid, COLOR_ORANGE, "/ap2 לנמל התעופה בעיר השנייה");
     SendClientMessage(playerid, COLOR_ORANGE, "/ap3 לנמל התעופה בעיר השלישית");
    SendClientMessage(playerid, COLOR_ORANGE,"/drift2 לאזור הדרפיטים");
    SendClientMessage(playerid, COLOR_ORANGE,"/sf לעיר השנייה");
    SendClientMessage(playerid, COLOR_ORANGE,"/lv לעיר השלישית");
    SendClientMessage(playerid, COLOR_ORANGE,"/sa לעיר הראשונה");
    SendClientMessage(playerid, COLOR_ORANGE,"/raceboat למרוץ סירות");
    SendClientMessage(playerid, COLOR_ORANGE,"/racemoto למרוץ אופנועים");
      return 1;
	}

//==============================================================================
	if(strcmp(cmd, "/tele2", true) == 0) {
	SendClientMessage(playerid, COLOR_ORANGE, "/ap1 לנמל התעופה בעיר הראשונה");
     SendClientMessage(playerid, COLOR_ORANGE, "תהנו!");
     SendClientMessage(playerid, COLOR_ORANGE, "תהנו!");
    SendClientMessage(playerid, COLOR_ORANGE,"תהנו!");
    SendClientMessage(playerid, COLOR_ORANGE,"תהנו!");
    SendClientMessage(playerid, COLOR_ORANGE,"תהנו!");
    SendClientMessage(playerid, COLOR_ORANGE,"תהנו!");
    SendClientMessage(playerid, COLOR_ORANGE,"תהנו!");
    SendClientMessage(playerid, COLOR_ORANGE,"תהנו!");
      return 1;
	}
//==============================================================================
	 if(strcmp(cmd, "/cool", true) == 0) {
	 SendClientMessage(playerid, COLOR_YELLOW, " ברוכים הבאים לרשימת הדברים המגניבים בשרת ");
	 SendClientMessage(playerid, COLOR_YELLOW, " /kill   להרוג את עצמך ");
	 SendClientMessage(playerid, COLOR_ORANGE, " /smoke לעשן ");
 	 SendClientMessage(playerid, COLOR_ORANGE, "  /afk למצב אסקייפ ");
 	 SendClientMessage(playerid, COLOR_ORANGE, " /hey בכניסתך רשום ");
 	 SendClientMessage(playerid, COLOR_ORANGE, " /bye ביציאתך רשום ");
 	 SendClientMessage(playerid, COLOR_ORANGE, " /clean לניקוי הצאט אצלך ");
	 SendClientMessage(playerid, COLOR_ORANGE, " /jailvisit לבקר בכלא ");
	 SendClientMessage(playerid, COLOR_ORANGE, " /cs לקנות מכונית משופרת ב-2000+ ביטוח ל-2 התפוצצויות ");
	   return 1;
	}
//==============================================================================
		if(strcmp(cmd, "/cleaN", true) == 0) {
		SendClientMessage(playerid, COLOR_GREEN,"ניקית לעצמך תצ'ט!");
		SendClientMessage(playerid, COLOR_GREEN,"m");
		SendClientMessage(playerid, COLOR_GREEN,"u");
		SendClientMessage(playerid, COLOR_GREEN,"l");
		SendClientMessage(playerid, COLOR_GREEN,"t");
		SendClientMessage(playerid, COLOR_GREEN,"y");
		SendClientMessage(playerid, COLOR_GREEN,"m");
		SendClientMessage(playerid, COLOR_GREEN,"a");
		SendClientMessage(playerid, COLOR_GREEN,"x");
		SendClientMessage(playerid, COLOR_GREEN,"_");
		SendClientMessage(playerid, COLOR_GREEN,"ניקית לעצמף תצ'ט!");

		return 1;
	}
//==============================================================================
		if(strcmp(cmd, "/news", true) == 0) {
		SendClientMessage(playerid, COLOR_GREEN," דברים חדשים בשרת");
		SendClientMessage(playerid, COLOR_YELLOW,"/help");
		SendClientMessage(playerid, COLOR_YELLOW,"חדש!:מסיבה כל יום ב20:00");
		SendClientMessage(playerid, COLOR_YELLOW,"מלא עבודות חדשות");
		SendClientMessage(playerid, COLOR_YELLOW,"בקרוב עוד");
		SendClientMessage(playerid, COLOR_YELLOW,"בקרוב עוד");
		SendClientMessage(playerid, COLOR_YELLOW,"בקרוב עוד");
		return 1;
	}
//==============================================================================
	if(strcmp(cmd, "/cs", true) == 0)
	{
	SendClientMessage(playerid, COLOR_ORANGE,  "  חדש! האדמינים משפצים לכם מכוניות רק ב-2000 ואלה הסוגים: ");
     SendClientMessage(playerid, COLOR_ORANGE, " landstalker לרכב זה בקשו מהאדמינים ");
     SendClientMessage(playerid, COLOR_ORANGE, " bufallo לרכב זה בקשו מהאדמינים ");
    SendClientMessage(playerid, COLOR_ORANGE,  " stretch לרכב זה בקשו מהאדמינים ");
     SendClientMessage(playerid, COLOR_ORANGE, " infernus לרכב זה בקשו מהאדמינים ");
     SendClientMessage(playerid, COLOR_ORANGE, " voodoo לרכב זה בקשו מהאדמינים ");
    SendClientMessage(playerid, COLOR_ORANGE,  " cheetah לרכב זה ב'קשו מהאדמינים ");
     SendClientMessage(playerid, COLOR_ORANGE, " esperanto לרכב זה בקשו מהאדמינים  ");
     SendClientMessage(playerid, COLOR_BLUE,   "להמשך רשימת הרכבים עשו את פקודת /cs2");
	 	return 1;
	}
     
//==============================================================================
		if(strcmp(cmd, "/cs2", true) == 0) {
	SendClientMessage(playerid, COLOR_ORANGE,  "  חדש! האדמינים משפצים לכם מכוניות רק ב-2000 ואלה הסוגים: ");
     SendClientMessage(playerid, COLOR_ORANGE, " banshee לרכב זה בקשו מהאדמינים ");
     SendClientMessage(playerid, COLOR_ORANGE, " stallion לרכב זה בקשו מהאדמינים ");
    SendClientMessage(playerid, COLOR_ORANGE,  " turismo לרכב זה בקשו מהאדמינים ");
     SendClientMessage(playerid, COLOR_ORANGE, " comet לרכב זה בקשו מהאדמינים ");
     SendClientMessage(playerid, COLOR_ORANGE, " rancher לרכב זה בקשו מהאדמינים ");
    SendClientMessage(playerid, COLOR_ORANGE,  " virgo לרכב זה ב'קשו מהאדמינים ");
     SendClientMessage(playerid, COLOR_ORANGE, " blista compact לרכב זה בקשו מהאדמינים  ");
     SendClientMessage(playerid, COLOR_BLUE,   "להמשך רשימת הרכבים עשו את פקודת /cs3");
     	return 1;
	}
     
//==============================================================================

		if(strcmp(cmd, "/cs3", true) == 0) {
	SendClientMessage(playerid, COLOR_ORANGE,  "  חדש! האדמינים משפצים לכם מכוניות רק ב-2000 ואלה הסוגים: ");
     SendClientMessage(playerid, COLOR_ORANGE, " mesa לרכב זה בקשו מהאדמינים ");
     SendClientMessage(playerid, COLOR_ORANGE, " super gt לרכב זה בקשו מהאדמינים ");
    SendClientMessage(playerid, COLOR_ORANGE,  " feltzer לרכב זה בקשו מהאדמינים ");
     SendClientMessage(playerid, COLOR_ORANGE, " slamvan לרכב זה בקשו מהאדמינים ");
     SendClientMessage(playerid, COLOR_ORANGE, " blade לרכב זה בקשו מהאדמינים ");
    SendClientMessage(playerid, COLOR_ORANGE,  " bullet לרכב זה ב'קשו מהאדמינים ");
     SendClientMessage(playerid, COLOR_ORANGE, " windsor לרכב זה בקשו מהאדמינים  ");
     SendClientMessage(playerid, COLOR_BLUE,   " hustler לרכב זה בקשו מהאדמינים");
     	return 1;
	}
     
//==============================================================================

		if(strcmp(cmd, "/objective", true) == 0) {
		SendPlayerFormattedText(playerid,"This gamemode is faily open, there's no specific win / endgame conditions to meet.",0);
		SendPlayerFormattedText(playerid,"In LVDM:Money Grub, when you kill a player, you will receive whatever money they have.",0);
		SendPlayerFormattedText(playerid,"Consequently, if you have lots of money, and you die, your killer gets your cash.",0);
		SendPlayerFormattedText(playerid,"However, you're not forced to kill players for money, you can always gamble in the", 0);
		SendPlayerFormattedText(playerid," Casino's.", 0);
    return 1;
	}
//==============================================================================
	if(strcmp(cmd, "/tips", true) == 0) {
		SendPlayerFormattedText(playerid,"Spawning with just a desert eagle might sound lame, however the idea of this",0);
		SendPlayerFormattedText(playerid,"gamemode is to get some cash, get better guns, then go after whoever has the",0);
		SendPlayerFormattedText(playerid,"most cash. Once you've got the most cash, the idea is to stay alive(with the",0);
		SendPlayerFormattedText(playerid,"cash intact)until the game ends, simple right ?", 0);
    return 1;
	}
//==============================================================================
    //Kill Command By DarkAngelz
    if (strcmp(cmd, "/kill", true) == 0){
    SetPlayerHealth(playerid,0.0);
    return 1;
    }
//==============================================================================
    //Smoke By DarkAngelz
    if (strcmp("/smoke", cmdtext, true, 4) == 0) {
    ApplyAnimation(playerid,"SMOKING", "M_smklean_loop", 4.0, 0, 0, 0, 0, 0);
    return 1;
    }

//==============================================================================
    //afk Command By DarkAngelz
    if(strcmp(cmdtext, "/afk", true) == 0 ){
    {
    new playerName[24];
    GetPlayerName(playerid, playerName, 24);
    format(string, sizeof(string), " .לא נמצא כרגע %s", playerName);
    SendClientMessageToAll(COLOR_GREY, string);
    }
    return 1;
    }
//==============================================================================
if(strcmp(cmdtext, "/unafk", true) == 0){
new playerState = GetPlayerState(playerid);
if(playerState == PLAYER_STATE_DRIVER){
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
SendClientMessage(playerid,0x0000BBAA,"תודה שחזרת!");
SetVehiclePos(VehicleID,1552.4464,-1674.9883,16.1953);
}else{
SetPlayerPos(playerid,1552.4464,-1674.9883,16.1953);}
return 1;}


//==============================================================================
if(strcmp(cmdtext, "/jailvisit", true) == 0){
new playerState = GetPlayerState(playerid);
if(playerState == PLAYER_STATE_DRIVER){
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
SendClientMessage(playerid,0x0000BBAA,"החברים שמחים שבאתם לבקר בכלא!");
SetVehiclePos(VehicleID,268.0042,77.5562,1001.0391);
}else{
SetPlayerPos(playerid,268.0042,77.5562,1001.0391);}
return 1;}

//==============================================================================

if(strcmp(cmdtext, "/jump", true) == 0){
new playerState = GetPlayerState(playerid);
if(playerState == PLAYER_STATE_DRIVER){
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
SendClientMessage(playerid,0x0000BBAA,"הגעתם לאזור הקפיצה");
SetVehiclePos(VehicleID,-727.5442,2306.2537,128.2241);
}else{
SetPlayerPos(playerid,-727.5442,2306.2537,128.2241);}
return 1;}

//==============================================================================
if(strcmp(cmdtext, "/jeep", true) == 0){
new playerState = GetPlayerState(playerid);
if(playerState == PLAYER_STATE_DRIVER){
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
SendClientMessage(playerid,0x0000BBAA,"הגעתם לאזור טיולי הגיפים ");
SetVehiclePos(VehicleID,-727.5442,2306.2537,128.2241);
}else{
SetPlayerPos(playerid,-669.8604,2407.4175,136.3848);}
return 1;}
//==============================================================================
if(strcmp(cmdtext, "/drift", true) == 0){
new playerState = GetPlayerState(playerid);
if(playerState == PLAYER_STATE_DRIVER){
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
SendClientMessage(playerid,0x0000BBAA,"הגעתם לאזורי הדריפט ");
SetVehiclePos(VehicleID,-727.5442,2306.2537,128.2241);
}else{
SetPlayerPos(playerid,2292.9775,1397.6544,42.8203);}
return 1;
}
//==============================================================================
if(strcmp(cmdtext, "/ramp", true) == 0){
new playerState = GetPlayerState(playerid);
if(playerState == PLAYER_STATE_DRIVER){
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
SendClientMessage(playerid,0x0000BBAA,"הגעתם לאזור הרמפות ");
SetVehiclePos(VehicleID,-727.5442,2306.2537,128.2241);
}else{
SetPlayerPos(playerid,1882.6693,-1388.4972,13.5703);}
return 1;}
//==============================================================================
if(strcmp(cmdtext, "/race", true) == 0){
new playerState = GetPlayerState(playerid);
if(playerState == PLAYER_STATE_DRIVER){
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
SendClientMessage(playerid,0x0000BBAA,"הגעתם לאזורי המרוצים");
SetVehiclePos(VehicleID,-727.5442,2306.2537,128.2241);
}else{
SetPlayerPos(playerid,2057.3579,844.4807,6.7007);}
return 1;}
//==============================================================================
if(strcmp(cmdtext, "/bicycles", true) == 0){
new playerState = GetPlayerState(playerid);
if(playerState == PLAYER_STATE_DRIVER){
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
SendClientMessage(playerid,0x0000BBAA,"הגעתם לטיולי האופניים");
SetVehiclePos(VehicleID,-727.5442,2306.2537,128.2241);
}else{
SetPlayerPos(playerid,-1286.5721,2515.9258,87.1353);}
return 1;}
//==============================================================================

	if (strcmp(cmdtext, "/hey", true)==0)
{
new name[MAX_PLAYER_NAME+1];
GetPlayerName(playerid, name, sizeof(name));
format(string, sizeof(string), " אומר שלום אחים שלי ***[ID %d] : %s " ,playerid,name);
SendClientMessageToAll(COLOR_BLUE, string);
return 1;
}
//==============================================================================
	if (strcmp(cmdtext, "/bye", true)==0)
{
new name[MAX_PLAYER_NAME+1];
GetPlayerName(playerid, name, sizeof(name));
format(string, sizeof(string), " אומר בי אחים שלי ***[ID %d] : %s " ,playerid,name);
SendClientMessageToAll(COLOR_BLUE, string);
return 1;
}
//==============================================================================
if(strcmp(cmdtext, "/ap3", true) == 0){
		new playerState = GetPlayerState(playerid);
		if(playerState == PLAYER_STATE_DRIVER){
			new VehicleID;
			VehicleID = GetPlayerVehicleID(playerid);
			SendClientMessage(playerid,0x0000BBAA,"נמל התעופה! עיר 3");
			SetVehiclePos(VehicleID,1710.4714,1614.2761,10.1240);
		}else{
			SetPlayerPos(playerid,1710.4714,1614.2761,10.1240);}
		return 1;
	}
//==============================================================================
	if(strcmp(cmdtext, "/bank", true) == 0){
	new playerState = GetPlayerState(playerid);
	if(playerState == PLAYER_STATE_DRIVER){
	new VehicleID;
	VehicleID = GetPlayerVehicleID(playerid);
	SendClientMessage(playerid,0x0000BBAA,"הגעת לבנק!");
	SetVehiclePos(VehicleID,2181.5464,1988.3318,10.8203);
	}else{
	SetPlayerPos(playerid,2181.5464,1988.3318,10.8203);}
	return 1;}
//==============================================================================
	if (strcmp(cmdtext, "/1min", true)==0)
{
new name[MAX_PLAYER_NAME+1];
GetPlayerName(playerid, name, sizeof(name));
format(string, sizeof(string), " $האדמין אומר: עוד דקה מרוץ ברייס מי שיורה כלא!$ " ,playerid,name);
SendClientMessageToAll(COLOR_BLUE, string);
return 1;
}
//==============================================================================
if(strcmp(cmdtext, "/car", true) == 0){
new playerState = GetPlayerState(playerid);
if(playerState == PLAYER_STATE_DRIVER){
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
SendClientMessage(playerid,0x0000BBAA," אזור מכירת מכוניות! ");
SetVehiclePos(VehicleID,2333.1001,-1074.9899,1049.0234);
}else{
SetPlayerPos(playerid,2333.1001,-1074.9899,1049.0234);}
return 1;}
//==============================================================================

if(strcmp(cmdtext, "/ap1", true) == 0){
new playerState = GetPlayerState(playerid);
if(playerState == PLAYER_STATE_DRIVER){
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
SendClientMessage(playerid,0x0000BBAA," נמל התעופה! עיר 1");
SetVehiclePos(VehicleID,1959.9481,-2247.9575,13.5469);
}else{
SetPlayerPos(playerid,1959.9481,-2247.9575,13.5469);}
return 1;
}

//==============================================================================
if(strcmp(cmdtext, "/ap2", true) == 0){
new playerState = GetPlayerState(playerid);
if(playerState == PLAYER_STATE_DRIVER){
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
SendClientMessage(playerid,0x0000BBAA," נמל התעופה! עיר 2 ");
SetVehiclePos(VehicleID,-1545.1010,-430.1010,5.9478);
}else{
SetPlayerPos(playerid,-1545.1010,-430.1010,5.9478);}
return 1;
}
//==============================================================================
if(strcmp(cmdtext, "/drift2", true) == 0){
new playerState = GetPlayerState(playerid);
if(playerState == PLAYER_STATE_DRIVER){
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
SendClientMessage(playerid,0x0000BBAA," הגעת לדריפט 2, תהנה! ");
SetVehiclePos(VehicleID,-2376.2900,-578.2515,133.1120);
}else{
SetPlayerPos(playerid,-2376.2900,-578.2515,133.1120);}
return 1;
}

//==============================================================================
if(strcmp(cmdtext, "/sf", true) == 0){
new playerState = GetPlayerState(playerid);
if(playerState == PLAYER_STATE_DRIVER){
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
SendClientMessage(playerid,0x0000BBAA," הגעת לעיר השנייה,תהנה! ");
SetVehiclePos(VehicleID,-1965.1390,294.0665,35.4739);
}else{
SetPlayerPos(playerid,-1965.1390,294.0665,35.4739);}
return 1;
}
//==============================================================================
if(strcmp(cmdtext, "/lv", true) == 0){
new playerState = GetPlayerState(playerid);
if(playerState == PLAYER_STATE_DRIVER){
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
SendClientMessage(playerid,0x0000BBAA," הגעת לעיר השלישית,תהנה! ");
SetVehiclePos(VehicleID,2106.2363,1155.8955,11.7922);
}else{
SetPlayerPos(playerid,2106.2363,1155.8955,11.7922);}
return 1;
}
//==============================================================================

if(strcmp(cmdtext, "/fitness", true) == 0){
new playerState = GetPlayerState(playerid);
if(playerState == PLAYER_STATE_DRIVER){
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
SendClientMessage(playerid,0x0000BBAA," הגעת למכון כושר,תהנה! ");
SetVehiclePos(VehicleID,2229.1299,-1722.1300,13.5625);
}else{
SetPlayerPos(playerid,2229.1299,-1722.1300,13.5625);}
return 1;
}
//==============================================================================
if(strcmp(cmdtext, "/sa", true) == 0){
new playerState = GetPlayerState(playerid);
if(playerState == PLAYER_STATE_DRIVER){
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
SendClientMessage(playerid,0x0000BBAA," הגעת לעיר הראשונה,תהנה! ");
SetVehiclePos(VehicleID,2495.3130,-1688.4563,13.8176);
}else{
SetPlayerPos(playerid,2495.3130,-1688.4563,13.8176);}
return 1;
}
//==============================================================================

if(strcmp(cmdtext, "/raceboat", true) == 0){
new playerState = GetPlayerState(playerid);
if(playerState == PLAYER_STATE_DRIVER){
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
SendClientMessage(playerid,0x0000BBAA," הגעת למרוץ סירות,תהנה! ");
SetVehiclePos(VehicleID,953.1768,-1948.8053,-0.6957);
}else{
SetPlayerPos(playerid,953.1768,-1948.8053,-0.6957);}
return 1;
}
//==============================================================================
if(strcmp(cmdtext, "/racemoto", true) == 0){
new playerState = GetPlayerState(playerid);
if(playerState == PLAYER_STATE_DRIVER){
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
SendClientMessage(playerid,0x0000BBAA," הגעת למרוץ אופנועים על המים!!!,תהנה! מצא שותף ובקש מהאדמין ספירה! ");
SetVehiclePos(VehicleID,-1365.4066,-631.4597,14.1484);
}else{
SetPlayerPos(playerid,-1365.4066,-631.4597,14.1484);}
return 1;
}
//==============================================================================
if(strcmp(cmdtext, "/water", true) == 0){
new playerState = GetPlayerState(playerid);
if(playerState == PLAYER_STATE_DRIVER){
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
SendClientMessage(playerid,0x0000BBAA," הגעתם לתוך המים!! חח ");
SetVehiclePos(VehicleID,155.5658,388.2016,-44.4120);
}else{
SetPlayerPos(playerid,155.5658,388.2016,-44.4120);}
return 1;
}

//==============================================================================
if(strcmp(cmdtext, "/war", true) == 0)
{
{
SetPlayerInterior(playerid,6);
{
SetPlayerPos(playerid,1940.9595,2368.5161,23.8516) ;
}
SendClientMessage(playerid, 0xFF9900AA, "ברוכים הבאים לאזור המלחמה");
}
return 1;
}

//==============================================================================
if (strcmp(cmdtext, "/caropen", true)==0) { // פונקצית פתיחה
	MoveObject(971,1019.457275,-315.252655,76.676582,2); // נקודות ציון
	return 1;
	}

	if (strcmp(cmdtext, "/carclose", true)==0) { // פונקצית פתיחה
	MoveObject(971,1019.505493,-315.449280,83.988113,2); // נקודות ציון
	return 1;
	}
//==============================================================================
if (strcmp(cmdtext, "/caropen2", true)==0) { // פונקצית פתיחה
	MoveObject(971,1045.485107,-315.612091,76.783310,2); // נקודות ציון
	return 1;
	}

	if (strcmp(cmdtext, "/carclose2", true)==0) { // פונקצית פתיחה
	MoveObject(971,1045.501465,-315.808716,83.884697,2); // נקודות ציון
	return 1;
	}
//==============================================================================
if (strcmp(cmdtext, "/motoopen", true)==0) { // פונקצית פתיחה
	MoveObject(985,1097.357544,-339.125031,74.702858,2); // נקודות ציון
	return 1;
	}

	if (strcmp(cmdtext, "/motoclose", true)==0) { // פונקצית פתיחה
	MoveObject(985,1097.193726,-339.006256,81.282494,2); // נקודות ציון
	return 1;
	}
//==============================================================================
if (strcmp(cmdtext, "/repairopen", true)==0) { // פונקצית פתיחה
	MoveObject(985,1008.677551,-338.453766,74.702858,2); // נקודות ציון
	return 1;
	}

	if (strcmp(cmdtext, "/repairclose", true)==0) { // פונקצית פתיחה
	MoveObject(985,1008.841370,-338.349335,80.828957,2); // נקודות ציון
	return 1;
	}
//==============================================================================
if (strcmp(cmdtext, "/gunopen", true)==0) { // פונקצית פתיחה
	MoveObject(985,1064.638428,-315.561890,80.711227,2); // נקודות ציון
	return 1;
	}

	if (strcmp(cmdtext, "/gunclose", true)==0) { // פונקצית פתיחה
	MoveObject(985,1076.687256,-315.534485,74.702858,2); // נקודות ציון
	return 1;
	}
//==============================================================================
if (strcmp(cmdtext, "/funopen", true)==0) { // פונקצית פתיחה
	MoveObject(985,1076.687256,-315.534485,74.702858,2); // נקודות ציון
	return 1;
	}

	if (strcmp(cmdtext, "/funclose", true)==0) { // פונקצית פתיחה
	MoveObject(985,1076.673828,-315.698273,80.705574,2); // נקודות ציון
	return 1;
	}
//==============================================================================
	 if(strcmp(cmd, "/givecash", true) == 0) {
	    new tmp[256];
		tmp = strtok(cmdtext, idx);

		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "USAGE: /givecash [איידי] [סכום]");
			return 1;
		}
		giveplayerid = strval(tmp);

		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "USAGE: /givecash [איידי] [סכום]");
			return 1;
		}
 		moneys = strval(tmp);

		//printf("givecash_command: %d %d",giveplayerid,moneys);


		if (IsPlayerConnected(giveplayerid)) {
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			playermoney = GetPlayerMoney(playerid);
			if (moneys > 0 && playermoney >= moneys) {
				GivePlayerMoney(playerid, (0 - moneys));
				GivePlayerMoney(giveplayerid, moneys);
				format(string, sizeof(string), "אתה שלחת %s(לשחקן: %d), $%d.", giveplayer,giveplayerid, moneys);
				SendClientMessage(playerid, COLOR_YELLOW, string);
				format(string, sizeof(string), "קיבלת כסף $%d מ %s(שחקן: %d).", moneys, sendername, playerid);
				SendClientMessage(giveplayerid, COLOR_YELLOW, string);
				printf("%s(השחקן:%d) העביר %d to %s(לשחקן:%d)",sendername, playerid, moneys, giveplayer, giveplayerid);
			}
			else {
				SendClientMessage(playerid, COLOR_YELLOW, "תכניס את סכום העסקה.");
			}
		}
		else {
				format(string, sizeof(string), "%d אין איידי כזה כרגע.", giveplayerid);
				SendClientMessage(playerid, COLOR_YELLOW, string);
			}
		return 1;
	}

	// PROCESS OTHER COMMANDS


	return 0;
}

//------------------------------------------------------------------------------------------------------

public OnPlayerSpawn(playerid)
{
	GivePlayerMoney(playerid, PocketMoney);
	SetPlayerInterior(playerid,0);
	SetPlayerRandomSpawn(playerid);
	TogglePlayerClock(playerid,1);
	return 1;
}

public SetPlayerRandomSpawn(playerid)
{
	if (iSpawnSet[playerid] == 1)
	{
		new rand = random(sizeof(gCopPlayerSpawns));
		SetPlayerPos(playerid, gCopPlayerSpawns[rand][0], gCopPlayerSpawns[rand][1], gCopPlayerSpawns[rand][2]); // Warp the player
		SetPlayerFacingAngle(playerid, 270.0);
    }
    else if (iSpawnSet[playerid] == 0)
    {
		new rand = random(sizeof(gRandomPlayerSpawns));
		SetPlayerPos(playerid, gRandomPlayerSpawns[rand][0], gRandomPlayerSpawns[rand][1], gRandomPlayerSpawns[rand][2]); // Warp the player
	}
	return 1;
}

//------------------------------------------------------------------------------------------------------

public OnPlayerDeath(playerid, killerid, reason)
{
    new playercash;
	if(killerid == INVALID_PLAYER_ID) {
        SendDeathMessage(INVALID_PLAYER_ID,playerid,reason);
        ResetPlayerMoney(playerid);
	} else {
	    	SendDeathMessage(killerid,playerid,reason);
			SetPlayerScore(killerid,GetPlayerScore(killerid)+1);
			playercash = GetPlayerMoney(playerid);
			if (playercash > 0)  {
				GivePlayerMoney(killerid, playercash);
				ResetPlayerMoney(playerid);
			}
			else
			{
			}
     	}
 	return 1;
}

/* public OnPlayerDeath(playerid, killerid, reason)
{   haxed by teh mike
	new name[MAX_PLAYER_NAME];
	new string[256];
	new deathreason[20];
	new playercash;
	GetPlayerName(playerid, name, sizeof(name));
	GetWeaponName(reason, deathreason, 20);
	if (killerid == INVALID_PLAYER_ID) {
	    switch (reason) {
			case WEAPON_DROWN:
			{
                format(string, sizeof(string), "*** %s drowned.)", name);
			}
			default:
			{
			    if (strlen(deathreason) > 0) {
					format(string, sizeof(string), "*** %s died. (%s)", name, deathreason);
				} else {
				    format(string, sizeof(string), "*** %s died.", name);
				}
			}
		}
	}
	else {
	new killer[MAX_PLAYER_NAME];
	GetPlayerName(killerid, killer, sizeof(killer));
	if (strlen(deathreason) > 0) {
		format(string, sizeof(string), "*** %s killed %s. (%s)", killer, name, deathreason);
		} else {
				format(string, sizeof(string), "*** %s killed %s.", killer, name);
			}
		}
	SendClientMessageToAll(COLOR_RED, string);
		{
		playercash = GetPlayerMoney(playerid);
		if (playercash > 0)
		{
			GivePlayerMoney(killerid, playercash);
			ResetPlayerMoney(playerid);
		}
		else
		{
		}
	}
 	return 1;
}*/

//------------------------------------------------------------------------------------------------------

public OnPlayerRequestClass(playerid, classid)
{
	iSpawnSet[playerid] = 0;
	SetupPlayerForClassSelection(playerid);
	return 1;
}

public SetupPlayerForClassSelection(playerid)
{
 	SetPlayerInterior(playerid,14);
	SetPlayerPos(playerid,258.4893,-41.4008,1002.0234);
	SetPlayerFacingAngle(playerid, 270.0);
	SetPlayerCameraPos(playerid,256.0815,-43.0475,1004.0234);
	SetPlayerCameraLookAt(playerid,258.4893,-41.4008,1002.0234);
}

public GameModeExitFunc()
{
	GameModeExit();
}

public OnGameModeInit()
{
	SetGameModeText("MultyMax");

	ShowPlayerMarkers(1);
	ShowNameTags(1);

	// 0.2.2 specific stuff
	//DisableInteriorEnterExits();
	//SetNameTagDrawDistance(10.0);
	//EnableStuntBonusForAll(0);

	/* Was testing the new pickup limit.
	new Float:pickX=2040.0520;
	new Float:pickY=1319.2799;
	new Float:pickZ=10.3779;
	new x=0;
	while(x!=400) {
		AddStaticPickup(1272,2,pickX,pickY,pickZ);
		pickY+=1.0;
		x++;
	}*/

	// Player Class's
	AddPlayerClass(120,-2173.3540,637.8243,49.4375,82.5433,27,500,29,500,31,500); //Yakuza lender
	AddPlayerClass(122,-2173.1096,643.2039,49.4375,82.2066,31,500,32,500,0,0); //Yakuza member
	AddPlayerClass(123,-2173.1045,647.1693,49.4375,85.6534,31,500,32,500,0,0); //Yakuza Member
    AddPlayerClass(163,1462.3673,2773.4492,10.8203,269.3560,4,0,24,500,46,0); //
    AddPlayerClass(164,1462.3676,2773.4456,10.8203,268.7293,4,0,24,500,46,0); //
    AddPlayerClass(294,2092.7505,2389.1663,61.2863,180.7366,4,0,24,500,46,0); //
    AddPlayerClass(274,1607.3287,1818.5656,10.8203,359.8029,4,0,24,500,46,0); //
    AddPlayerClass(275,1607.2432,1819.1221,10.8280,357.7253,4,0,24,500,46,0); //
    AddPlayerClass(276,1607.1742,1819.3267,10.8280,357.4304,4,0,24,500,46,0); //
    AddPlayerClass(293,1271.3955,2554.2319,10.8203,272.5162,4,0,24,500,46,0); //
    AddPlayerClass(292,2206.9849,1293.4258,10.8203,180.4216,4,0,24,500,46,0); //
    AddPlayerClass(0,2637.3330,1127.2655,11.1797,180.3098,4,0,24,500,46,0); //
    AddPlayerClass(260,2604.2100,2182.5176,10.8130,182.1664,4,0,24,500,46,0); //
    AddPlayerClass(279,1563.9877,2793.6970,10.8203,81.9222,4,0,24,500,46,0); //
    AddPlayerClass(278,2533.4561,713.2686,10.8203,264.9105,4,0,24,500,46,0); //
    AddPlayerClass(263,2489.7822,918.2549,11.0234,88.9725,4,0,24,500,46,0); //
    AddPlayerClass(263,2489.7822,918.2549,11.0234,88.9725,4,0,24,500,46,0); //
    AddPlayerClass(61,1706.4266,1607.6541,10.0156,74.4459,4,0,24,500,46,0); //
    AddPlayerClass(280,2296.7195,2460.0942,10.8203,92.1564,4,0,24,500,46,0); //
    AddPlayerClass(282,2296.7195,2460.0942,10.8203,92.1564,4,0,24,500,46,0); //
    AddPlayerClass(155,375.6005,-117.2773,1001.4922,177.5149,4,0,24,500,46,0); //
	// Car Spawns

    AddStaticVehicle(522,-2178.8757,605.7239,34.7333,92.9075,1,0); //
    AddStaticVehicle(522,-2178.9561,607.9438,34.7188,90.0602,1,0); //
    AddStaticVehicle(522,-2178.9609,609.1192,34.7283,93.7805,1,0); //
    AddStaticVehicle(522,-2178.9006,606.6567,34.7348,92.2371,1,0); //
    AddStaticVehicle(522,2120.8904,1794.1383,10.2425,152.5595,1,0); //
    AddStaticVehicle(522,2114.2095,1409.7362,10.3945,179.5154,1,0); //
    AddStaticVehicle(522,2116.5732,1409.3134,10.3827,180.7104,3,0); //
    AddStaticVehicle(522,2119.9907,1410.2666,10.3821,179.7074,3,0); //
    AddStaticVehicle(522,2144.9597,1398.4966,10.3851,359.6637,0,6); //
    AddStaticVehicle(522,2125.3406,988.0945,10.3915,355.5053,0,6); //
    AddStaticVehicle(522,2121.9595,987.9102,10.3911,354.0781,12,0); //
    AddStaticVehicle(522,2128.5491,987.9460,10.3963,3.9152,4,3); //
    AddStaticVehicle(522,2131.7195,988.1965,10.3911,359.9447,1,8); //
    AddStaticVehicle(522,2135.0732,988.4063,10.3912,359.3285,0,8); //
    AddStaticVehicle(522,2138.7417,988.4958,10.3890,356.8639,0,8); //
    AddStaticVehicle(463,2148.2473,988.0759,10.3607,359.6079,84,84); //
    AddStaticVehicle(463,2151.3489,988.2056,10.3606,358.9228,0,0); //
    AddStaticVehicle(463,2154.5857,987.6367,10.3606,358.1837,0,0); //
    AddStaticVehicle(522,1864.2845,-1398.8600,13.0533,272.1923,0,1); //
    AddStaticVehicle(522,1863.8052,-1401.1104,13.0569,269.0461,8,26); //
    AddStaticVehicle(522,1863.8405,-1406.8687,13.0617,261.0995,5,25); //
    AddStaticVehicle(522,1863.8435,-1404.5809,13.0453,267.7681,6,1); //
    AddStaticVehicle(522,1864.4825,-1409.5647,13.0466,267.8684,3,25); //
    AddStaticVehicle(522,1863.9008,-1412.6896,13.0649,262.5874,6,0); //
    AddStaticVehicle(421,-2187.5735,639.8114,49.3214,88.1961,13,1); //
    AddStaticVehicle(421,-2174.1978,636.3160,49.3200,359.4301,13,1); //
    AddStaticVehicle(421,-2174.1602,655.6840,49.3199,358.8894,13,1); //
    AddStaticVehicle(421,2039.8563,1013.4601,10.5544,178.6043,25,1); //
    AddStaticVehicle(421,2039.6178,1003.6918,10.5544,178.6043,25,1); //
    AddStaticVehicle(409,2139.8833,2357.5173,10.5451,87.6338,1,1); //
    AddStaticVehicle(409,2119.9624,2357.8474,10.5431,90.5862,1,1); //
    AddStaticVehicle(409,2158.9824,1690.4554,10.5509,195.2217,1,1); //
    AddStaticVehicle(409,2160.3347,1673.8684,10.5500,171.3417,1,1); //
    AddStaticVehicle(409,2034.3362,1929.3176,12.0332,174.6694,0,0); //
    AddStaticVehicle(409,2033.9059,1908.1277,12.0503,184.4546,0,0); //
    AddStaticVehicle(522,-2178.9006,606.6567,34.7348,92.2371,1,0); //
    AddStaticVehicle(522,-2178.9609,609.1192,34.7283,93.7805,1,0); //
    AddStaticVehicle(522,-2178.9561,607.9438,34.7188,90.0602,1,0); //
    AddStaticVehicle(522,-2178.8757,605.7239,34.7333,92.9075,1,0); //
    AddStaticVehicle(468,-661.0862,2332.0662,138.3438,70.8280,46,46); //
    AddStaticVehicle(468,-661.4623,2330.3176,138.3651,72.6203,0,0); //
    AddStaticVehicle(468,-661.4928,2327.7808,138.4054,85.7909,1,1); //
    AddStaticVehicle(468,-661.0877,2326.3508,138.3928,90.8679,3,3); //
    AddStaticVehicle(468,-660.9782,2323.4045,138.3887,84.7755,6,6); //
    AddStaticVehicle(468,-661.1309,2320.8574,138.4020,86.0688,51,51); //
    AddStaticVehicle(468,-661.2366,2319.2612,138.4091,91.0214,53,53); //
    AddStaticVehicle(471,-673.3989,2312.1697,134.1337,82.7739,103,111); //
    AddStaticVehicle(471,-675.9707,2315.2883,133.6638,97.4851,103,111); //
    AddStaticVehicle(471,-676.7244,2318.6501,133.6569,92.8195,120,114); //
    AddStaticVehicle(495,-703.9617,2360.5977,128.0502,289.7516,119,122); //
    AddStaticVehicle(495,-706.1513,2365.9219,128.1778,285.9084,118,117); //
    AddStaticVehicle(495,-709.2696,2370.7991,128.2297,281.6120,116,115); //
    AddStaticVehicle(495,-711.7840,2375.0217,128.2269,275.2806,114,108); //
    AddStaticVehicle(411,2046.6619,819.6964,7.3099,2.3942,123,1); //
    AddStaticVehicle(411,2050.3169,819.8948,7.2913,358.4071,116,1); //
    AddStaticVehicle(411,2053.7595,820.1187,7.2319,357.4457,75,1); //
    AddStaticVehicle(411,2056.9736,820.1280,7.2206,357.8379,12,1); //
    AddStaticVehicle(411,2060.5090,820.1713,7.2154,354.6854,64,1); //
    AddStaticVehicle(411,2063.8667,820.2095,7.2279,0.6799,80,1); //
    AddStaticVehicle(411,2067.4976,820.3460,7.1897,1.9557,106,1); //
    AddStaticVehicle(411,2070.8289,820.6276,7.1464,4.1276,112,1); //
    AddStaticVehicle(451,2029.4680,889.7000,7.3012,268.3931,61,61); //
    AddStaticVehicle(451,2029.0834,886.0240,7.1550,268.4138,46,46); //
    AddStaticVehicle(451,2029.1476,882.2845,7.0266,270.8742,18,18); //
    AddStaticVehicle(451,2029.0201,878.7615,6.9589,267.8454,16,16); //
    AddStaticVehicle(451,2028.8832,875.1703,6.8974,270.8317,36,36); //
    AddStaticVehicle(451,2029.0842,871.8476,6.7822,272.9576,125,125); //
    AddStaticVehicle(494,2085.3506,882.2907,7.2455,89.1613,42,33); //
    AddStaticVehicle(494,2085.4731,885.8099,7.3499,91.5095,42,30); //
    AddStaticVehicle(494,2085.3596,889.2388,7.4687,93.1913,36,13); //
    AddStaticVehicle(494,2084.9519,892.8791,7.6076,91.3514,75,79); //
    AddStaticVehicle(494,2085.0574,896.4655,7.7482,92.4583,54,36); //
    AddStaticVehicle(494,2084.9092,900.1762,7.8870,90.5620,92,101); //
    AddStaticVehicle(502,2351.9709,1405.4149,42.7124,90.6755,36,8); //
    AddStaticVehicle(502,2351.5513,1409.0836,42.7127,87.5632,3,88); //
    AddStaticVehicle(502,2351.0000,1412.0164,42.7122,88.5113,36,0); //
    AddStaticVehicle(502,2351.4497,1416.1118,42.7125,86.8230,1,88); //
    AddStaticVehicle(451,2350.3904,1423.3125,42.5265,89.1314,125,10); //
    AddStaticVehicle(451,2350.6985,1426.4286,42.5256,88.1609,8,125); //
    AddStaticVehicle(451,2351.1851,1430.1686,42.5241,89.4309,6,125); //
    AddStaticVehicle(451,2350.8174,1433.7058,42.5247,88.2512,5,125); //
    AddStaticVehicle(411,2302.8528,1408.7173,42.5474,267.2258,3,0); //
    AddStaticVehicle(411,2303.3269,1412.3424,42.5474,268.5306,3,1); //
    AddStaticVehicle(411,2302.9663,1415.9281,42.5474,269.4930,123,0); //
    AddStaticVehicle(411,2301.9678,1419.3552,42.5474,270.0868,0,1); //
    AddStaticVehicle(506,2303.7456,1426.2761,42.5249,270.5527,6,6); //
    AddStaticVehicle(506,2304.6489,1430.0554,42.5247,268.9897,3,3); //
    AddStaticVehicle(506,2303.3423,1433.7932,42.5249,269.2687,7,7); //
    AddStaticVehicle(506,2303.5591,1437.5465,42.5250,268.9996,6,6); //
    AddStaticVehicle(506,2302.3672,1441.1437,42.5248,270.2278,0,0); //
    AddStaticVehicle(598,2282.2859,2477.4492,10.5675,180.0842,0,1); //
    AddStaticVehicle(598,2277.7930,2477.6707,10.5676,180.8679,0,1); //
    AddStaticVehicle(598,2273.5835,2477.8516,10.5675,180.3572,0,1); //
    AddStaticVehicle(598,2269.2009,2478.1404,10.5655,179.6230,0,1); //
    AddStaticVehicle(523,2282.2139,2459.1421,10.3801,359.5441,0,0); //
    AddStaticVehicle(523,2278.2490,2458.9585,10.3794,3.4102,0,0); //
    AddStaticVehicle(523,2273.4670,2458.3259,10.3867,358.3912,0,0); //
    AddStaticVehicle(523,2269.1240,2458.4355,10.3817,1.8339,0,0); //
    AddStaticVehicle(427,2241.4749,2435.9158,10.9541,1.0640,0,1); //
    AddStaticVehicle(427,2251.9556,2442.9583,10.9547,0.9605,0,1); //
    AddStaticVehicle(427,2260.3760,2443.0977,10.9550,358.1481,0,1); //
    AddStaticVehicle(528,2256.0486,2443.5132,10.8663,0.6401,0,0); //
    AddStaticVehicle(599,2260.6152,2478.1550,11.0236,179.9220,0,1); //
    AddStaticVehicle(599,2255.9709,2478.1033,11.0096,180.9506,0,1); //
    AddStaticVehicle(599,2252.0098,2478.4163,11.0131,179.8803,0,1); //
    AddStaticVehicle(528,2295.0457,2442.3740,10.8704,359.3319,0,0); //
    AddStaticVehicle(528,2291.0906,2442.6353,10.8743,1.3276,0,0); //
    AddStaticVehicle(424,-725.7312,2415.2637,127.4921,250.0136,6,16); //
    AddStaticVehicle(424,-727.2000,2411.7603,127.3323,246.2769,3,6); //
    AddStaticVehicle(424,-728.3664,2408.2332,127.2829,251.4595,2,2); //
    AddStaticVehicle(424,-729.5615,2404.2646,127.5802,249.3993,3,2); //
    AddStaticVehicle(495,-733.6163,2395.9778,127.6142,252.6160,101,106); //
    AddStaticVehicle(495,-734.5341,2391.6860,127.1428,253.3248,116,115); //
    AddStaticVehicle(495,-736.2187,2387.4373,126.6648,249.5775,118,117); //
    AddStaticVehicle(495,-737.2053,2383.2380,126.1765,252.6284,114,108); //
    AddStaticVehicle(468,-728.2857,2428.7688,127.3603,299.1805,46,46); //
    AddStaticVehicle(468,-727.6540,2427.4287,127.5467,299.8915,6,6); //
    AddStaticVehicle(468,-726.7321,2426.0159,127.7259,303.2407,3,3); //
    AddStaticVehicle(468,-725.7457,2424.9958,127.8734,303.5995,53,53); //
    AddStaticVehicle(510,-1278.8787,2508.7788,86.5666,185.6038,46,46); //
    AddStaticVehicle(510,-1280.2455,2508.2603,86.5624,188.2635,2,2); //
    AddStaticVehicle(510,-1281.7510,2507.9680,86.5552,193.5175,5,5); //
    AddStaticVehicle(510,-1283.1780,2507.6555,86.5526,199.9852,28,28); //
    AddStaticVehicle(510,-1284.7930,2507.2146,86.5460,193.6922,39,39); //
    AddStaticVehicle(510,-1286.3333,2506.7705,86.5392,187.3799,6,6); //
    AddStaticVehicle(510,-1287.8503,2506.6016,86.5752,184.4386,16,16); //
    AddStaticVehicle(510,-1289.1478,2506.5212,86.6165,187.5038,43,43); //
    AddStaticVehicle(510,-1290.8107,2506.0295,86.6137,194.3310,39,39); //
    AddStaticVehicle(510,-1292.0967,2505.6265,86.6121,191.2176,46,46); //
    AddStaticVehicle(504,1172.4121,1311.2450,10.6325,88.2558,12,9); //
    AddStaticVehicle(504,1172.3826,1314.5492,10.6271,88.2570,51,39); //
    AddStaticVehicle(504,1172.4974,1317.8837,10.6253,89.5201,57,48); //
    AddStaticVehicle(504,1172.4471,1321.1630,10.6288,88.3307,14,15); //
    AddStaticVehicle(504,1172.4772,1326.3312,10.6225,90.0877,34,34); //
    AddStaticVehicle(504,1172.4382,1329.8645,10.6231,89.9390,12,9); //
    AddStaticVehicle(504,1172.3837,1333.4641,10.6210,89.3725,51,39); //
    AddStaticVehicle(504,1172.4282,1336.9456,10.6212,89.1815,57,48); //
    AddStaticVehicle(504,1172.4277,1340.4268,10.6212,89.0293,14,15); //
    AddStaticVehicle(504,1128.5245,1358.1954,10.6302,179.0552,34,34); //
    AddStaticVehicle(504,1125.1235,1358.2866,10.6275,178.3015,57,57); //
    AddStaticVehicle(504,1121.7476,1358.2257,10.6304,180.1494,12,12); //
    AddStaticVehicle(504,1118.4156,1358.2137,10.6144,180.4722,34,34); //
    AddStaticVehicle(504,1114.3188,1358.2488,10.6301,179.8377,51,51); //
    AddStaticVehicle(504,1110.4290,1358.1095,10.6122,180.0699,57,54); //
    AddStaticVehicle(504,1105.7198,1358.1401,10.6266,178.6116,14,14); //
    AddStaticVehicle(504,1101.3671,1358.1077,10.6216,180.8936,34,34); //
    AddStaticVehicle(504,1110.4315,1358.1145,10.6121,180.0972,57,54); //
    AddStaticVehicle(504,1105.6887,1358.1575,10.6248,177.9001,14,14); //
    AddStaticVehicle(504,1101.3423,1358.1066,10.6210,180.3472,34,34); //
    AddStaticVehicle(522,2039.6349,1324.8890,10.2356,181.0039,3,8); //
    AddStaticVehicle(560,2131.5496,1025.5116,10.5257,271.4439,9,39); //
    AddStaticVehicle(567,2131.0432,1016.2126,10.6932,268.9042,88,64); //
    AddStaticVehicle(567,2131.8250,1012.9897,10.6835,268.4580,88,64); //
    AddStaticVehicle(567,2130.7595,1009.6799,10.6904,268.9263,88,64); //
    AddStaticVehicle(560,2132.3667,1028.7438,10.5257,268.8313,9,39); //
    AddStaticVehicle(560,2131.5496,1025.5116,10.5257,271.4439,9,39); //
    AddStaticVehicle(560,2131.4600,1022.3671,10.5251,269.8018,9,39); //
    AddStaticVehicle(587,2141.5107,1022.3376,10.5445,90.4914,40,1); //
    AddStaticVehicle(587,2142.2795,1019.1093,10.5470,91.5922,40,1); //
    AddStaticVehicle(587,2141.6379,1009.4611,10.5476,89.2224,40,1); //
    AddStaticVehicle(587,2142.1248,1006.7004,10.5457,90.6915,40,1); //
    AddStaticVehicle(587,2073.9958,1317.5225,10.3980,177.4435,40,1); //
    AddStaticVehicle(506,2155.6958,2180.1089,10.3764,182.5291,6,6); //
    AddStaticVehicle(587,2074.6973,1399.8970,10.3941,178.1072,40,1); //
    AddStaticVehicle(506,2103.2922,2049.4460,10.5246,269.2712,6,6); //
    AddStaticVehicle(506,2103.7239,2043.4187,10.5244,265.6502,6,6); //
    AddStaticVehicle(506,2154.8821,2053.4497,10.3766,180.5164,6,6); //
    AddStaticVehicle(506,2110.0291,1397.9679,10.5246,358.0203,6,6); //
    AddStaticVehicle(506,2187.0554,1978.8743,10.5248,270.2895,6,6); //
    AddStaticVehicle(506,2186.1665,1974.8232,10.5248,271.6990,6,6); //
    AddStaticVehicle(506,2129.3279,1812.3652,10.3756,151.9988,6,6); //
    AddStaticVehicle(522,2039.6349,1324.8890,10.2356,181.0039,3,8); //
    AddStaticVehicle(522,2040.3346,1517.8557,10.2367,170.0354,3,8); //
    AddStaticVehicle(522,2104.3242,2066.6143,10.3846,268.4455,3,8); //
    AddStaticVehicle(522,2185.6479,2001.3540,10.3910,273.7854,3,8); //
    AddStaticVehicle(522,2125.1082,1804.3241,10.2384,153.9949,3,8); //
    AddStaticVehicle(522,2145.6606,1409.3331,10.3852,180.8783,3,8); //
    AddStaticVehicle(522,2129.7415,1397.3192,10.3773,357.1823,3,8); //
    AddStaticVehicle(471,2015.6885,1484.7947,10.2161,244.8804,103,111); //
    AddStaticVehicle(471,2087.4502,961.8302,10.2421,168.7066,120,114); //
    AddStaticVehicle(429,-1458.6919,-1570.7756,101.4182,89.7367,13,13); //
    AddStaticVehicle(429,-1452.1200,-1570.9753,101.4320,89.6408,1,2); //
    AddStaticVehicle(439,-1446.0278,-1570.9747,101.6559,89.3774,8,17); //
    AddStaticVehicle(439,-1438.8627,-1571.4806,101.6533,85.8350,43,21); //
    AddStaticVehicle(480,-1456.6077,-1582.1116,101.5276,86.3468,2,2); //
    AddStaticVehicle(480,-1450.0270,-1582.3258,101.5315,87.4069,12,12); //
    AddStaticVehicle(451,-1443.6641,-1582.8217,101.4419,85.7105,36,36); //
    AddStaticVehicle(451,-1436.7129,-1583.0403,101.4719,85.7865,125,125); //
    AddStaticVehicle(489,-1431.0127,-1581.2522,101.9180,358.7887,14,123); //
    AddStaticVehicle(489,-1430.7214,-1573.6132,101.8991,359.1050,120,123); //
    AddStaticVehicle(400,-1444.9866,-1586.8850,101.8530,268.6926,113,1); //
    AddStaticVehicle(400,-1451.6981,-1586.7271,101.8624,269.7766,123,1); //
    AddStaticVehicle(500,-1458.7906,-1586.7048,101.8578,268.9164,40,110); //
    AddStaticVehicle(500,-1464.9415,-1586.6188,101.8674,268.0114,40,84); //
    AddStaticVehicle(491,-1463.9203,-1596.9449,101.5164,269.0760,52,66); //
    AddStaticVehicle(491,-1456.0565,-1597.1937,101.5171,268.3416,64,72); //
    AddStaticVehicle(496,-1449.6887,-1597.4280,101.4727,266.8797,66,72); //
    AddStaticVehicle(496,-1443.4753,-1597.7723,101.4907,267.9251,53,56); //
    AddStaticVehicle(402,-1451.9620,-1456.5892,101.5882,177.0055,22,22); //
    AddStaticVehicle(402,-1451.5222,-1448.9570,101.5833,176.4073,13,13); //
    AddStaticVehicle(409,-1466.3146,-1454.5392,101.5602,186.1883,1,1); //
    AddStaticVehicle(409,-1465.4783,-1464.7391,101.5570,183.9687,1,1); //
    AddStaticVehicle(411,-1422.7372,-1501.5609,104.5185,2.3881,64,1); //
    AddStaticVehicle(411,-1423.0359,-1494.3002,103.1689,2.2646,123,1); //
    AddStaticVehicle(412,-1446.7985,-1539.2845,101.5980,1.1897,10,8); //
    AddStaticVehicle(412,-1446.8224,-1531.4526,101.5972,1.1823,11,1); //
    AddStaticVehicle(415,-1446.8777,-1524.6062,101.5243,359.4897,25,1); //
    AddStaticVehicle(415,-1446.9667,-1517.9099,101.5383,0.6436,40,1); //
    AddStaticVehicle(419,-1446.9647,-1510.8601,101.5583,0.3938,47,76); //
    AddStaticVehicle(419,-1446.9673,-1503.5095,101.5552,0.5902,13,76); //
    AddStaticVehicle(506,-1446.9347,-1496.6669,101.4612,1.4226,6,6); //
    AddStaticVehicle(506,-1446.8922,-1490.0970,101.4647,359.9326,7,7); //
    AddStaticVehicle(533,-1423.0669,-1502.7183,101.3810,183.7063,75,1); //
    AddStaticVehicle(533,-1423.1971,-1496.0887,101.3810,182.5285,74,1); //
    AddStaticVehicle(545,-1439.8823,-1487.8489,101.5564,1.5683,44,96); //
    AddStaticVehicle(545,-1439.7767,-1493.0315,101.5560,1.8413,47,1); //
    AddStaticVehicle(541,-1439.7397,-1498.7594,101.3699,1.7748,60,1); //
    AddStaticVehicle(541,-1439.6848,-1505.4050,101.3728,359.9288,58,8); //
    AddStaticVehicle(536,-1439.6912,-1511.3695,101.4918,0.1267,26,96); //
    AddStaticVehicle(536,-1439.9448,-1525.9614,101.4947,358.1783,12,1); //
    AddStaticVehicle(535,-1440.2705,-1533.8409,101.5230,358.2489,28,1); //
    AddStaticVehicle(535,-1440.5137,-1541.0322,101.5248,357.7736,31,1); //
    AddStaticVehicle(555,-1414.9503,-1447.4324,101.1476,179.1043,58,1); //
    AddStaticVehicle(555,-1415.1133,-1453.8611,101.4145,177.8767,60,1); //
    AddStaticVehicle(560,2223.2710,950.9308,10.5266,0.8218,9,39); //
    AddStaticVehicle(560,2230.0007,951.4585,10.5278,1.8137,17,1); //
    AddStaticVehicle(512,1792.7686,-2402.4644,13.8387,184.4262,15,123); 
    AddStaticVehicle(513,1787.1857,-2652.3157,14.0897,3.2644,21,36); //
    AddStaticVehicle(593,1718.5226,-2649.8613,14.0049,354.0465,58,8); //
    AddStaticVehicle(497,1857.4355,-2655.4500,13.9070,5.8294,0,1); //
    AddStaticVehicle(497,1651.3168,-2660.4958,13.7240,2.4693,0,1); //
    AddStaticVehicle(511,1562.4484,-2640.3494,14.9195,0.6875,4,90); //
    AddStaticVehicle(592,1427.4370,-2592.7148,14.7409,270.3477,1,1); //
    AddStaticVehicle(592,1429.2377,-2492.3640,14.7514,269.7426,1,1); //
    AddStaticVehicle(469,1489.1201,-2408.4653,13.5664,177.9709,1,3); //
    AddStaticVehicle(476,1461.7361,-2414.9543,14.2681,183.7514,1,6); //
    AddStaticVehicle(476,1437.2798,-2416.8567,14.2652,182.5069,7,6); //
    AddStaticVehicle(522,1941.7457,-2234.1873,13.1063,176.8700,3,8); //
    AddStaticVehicle(522,1940.2887,-2234.1382,13.1295,178.3748,36,105); //
    AddStaticVehicle(522,1939.0038,-2234.2698,13.1171,176.1727,6,25); //
    AddStaticVehicle(522,1937.8607,-2234.1621,13.1176,178.2600,7,79); //
    AddStaticVehicle(522,1936.9205,-2234.1702,13.1124,176.2181,8,82); //
    AddStaticVehicle(522,1935.8270,-2233.9600,13.1164,175.8749,39,106); //
    AddStaticVehicle(512,1815.8906,-2398.6313,13.8354,180.7469,32,112); //
    AddStaticVehicle(488,1523.3662,-2412.4280,24.8900,202.2852,2,29); //
    AddStaticVehicle(488,1605.1996,-2414.3003,24.8896,183.3054,2,29); //
    AddStaticVehicle(487,1764.9182,-2409.7590,24.9929,180.2391,26,57); //
    AddStaticVehicle(519,1569.0259,-2410.7898,14.4763,177.8555,1,1); //
    AddStaticVehicle(487,1682.5886,-2411.7515,24.8868,180.8739,26,57); //
    AddStaticVehicle(519,1729.1217,-2409.1897,14.4730,179.4416,1,1); //
    AddStaticVehicle(519,1643.7136,-2414.2485,14.4754,174.2465,1,1);  //
    AddStaticVehicle(512,-1429.8330,-502.5697,14.4491,155.5246,32,112); //
    AddStaticVehicle(512,-1466.5071,-521.5792,14.4685,238.5506,15,123); //
    AddStaticVehicle(513,-1390.3442,-482.7340,14.7294,248.3777,30,34); //
    AddStaticVehicle(513,-1352.7134,-465.6237,14.7306,169.4508,21,34); //
    AddStaticVehicle(519,-1390.0391,-226.0070,15.0685,331.2106,1,1); //
    AddStaticVehicle(519,-1343.5563,-279.9077,15.0702,306.0292,1,1); //
    AddStaticVehicle(593,-1356.8508,-261.6772,14.6077,309.9718,60,1); //
    AddStaticVehicle(593,-1372.7358,-238.5883,14.6118,320.4040,58,8); //
    AddStaticVehicle(487,-1184.2764,24.3777,14.3257,36.2404,26,57); //
    AddStaticVehicle(469,-1198.7141,6.2632,14.1622,40.3846,1,3); //
    AddStaticVehicle(487,-1213.9923,-11.4228,14.3299,49.8193,29,42); //
    AddStaticVehicle(592,-1646.1006,-154.4003,15.3416,315.3347,1,1); //
    AddStaticVehicle(460,-1014.0857,478.8057,1.7290,317.3104,1,18); //
    AddStaticVehicle(522,-1563.1426,-429.6765,5.5710,306.5233,36,105); //
    AddStaticVehicle(522,-1563.5765,-428.9810,5.5697,308.3645,8,82); //
    AddStaticVehicle(522,-1563.9031,-428.3790,5.5709,310.3049,39,106); //
    AddStaticVehicle(522,-1564.4012,-427.8436,5.5627,312.6560,51,118); //
    AddStaticVehicle(522,-1564.9711,-427.2556,5.5724,318.4657,3,3); //
    AddStaticVehicle(522,-1565.4203,-426.6460,5.5646,323.3875,6,25); //
    AddStaticVehicle(555,-1538.6610,-447.3743,5.7541,312.1510,58,1); //
    AddStaticVehicle(555,-1535.7570,-450.3027,5.7806,314.2367,60,1); //
    AddStaticVehicle(451,-2390.9465,-601.8120,132.3578,124.9505,36,36); //
    AddStaticVehicle(451,-2392.7131,-599.2852,132.3492,126.6666,46,46); //
    AddStaticVehicle(451,-2394.5913,-596.9155,132.3539,124.7276,125,125); //
    AddStaticVehicle(451,-2394.2366,-597.2576,132.3573,126.7812,125,125); //
    AddStaticVehicle(451,-2398.0808,-592.1301,132.3546,124.5537,36,36); //
    AddStaticVehicle(451,-2399.7864,-589.6727,132.3481,126.1346,61,61); //
    AddStaticVehicle(451,-2401.0476,-586.8831,132.3541,123.7733,18,18); //
    AddStaticVehicle(451,-2402.9648,-584.7176,132.3553,125.2526,46,46); //
    AddStaticVehicle(541,-2416.8335,-588.8027,132.2759,216.0173,68,8); //
    AddStaticVehicle(541,-2414.3540,-587.0012,132.2679,217.9522,2,1); //
    AddStaticVehicle(541,-2411.8235,-585.3617,132.2661,213.4042,60,1); //
    AddStaticVehicle(541,-2409.2278,-583.5301,132.2759,215.8858,58,8); //
    AddStaticVehicle(415,-2399.6687,-613.4340,132.3996,35.7853,25,1); //
    AddStaticVehicle(415,-2399.5093,-613.4980,132.4205,36.3900,62,1); //
    AddStaticVehicle(415,-2397.1343,-611.5892,132.4216,35.6388,36,1); //
    AddStaticVehicle(415,-2394.6118,-609.7078,132.4152,34.8286,40,1); //
    AddStaticVehicle(522,-2385.9766,-580.4197,131.6889,138.4022,3,8); //
    AddStaticVehicle(522,-2386.4875,-579.7411,131.6792,129.6977,6,25); //
    AddStaticVehicle(522,-2386.8906,-579.1431,131.6871,128.3687,7,79); //
    AddStaticVehicle(522,-2387.3623,-578.5371,131.6884,128.5178,36,105); //
    AddStaticVehicle(522,2475.5457,-1652.2505,13.0230,178.3137,51,118); //
    AddStaticVehicle(522,2471.9258,-1652.1875,13.0306,185.2681,36,105); //
    AddStaticVehicle(522,2472.5876,-1652.0525,13.0193,178.5306,3,3); //
    AddStaticVehicle(522,2473.6470,-1651.9191,13.0336,188.7471,6,25); //
    AddStaticVehicle(522,2474.5308,-1652.1057,13.0228,182.6481,3,8); //
    AddStaticVehicle(439,2487.2378,-1654.6976,13.2919,88.2394,43,21); //
    AddStaticVehicle(419,2498.2759,-1655.9506,13.1920,79.3608,33,75); //
    AddStaticVehicle(439,2506.7664,-1662.4504,13.3098,30.0452,8,17); //
    AddStaticVehicle(419,2508.2715,-1671.7877,13.1790,348.0020,47,76); //
    AddStaticVehicle(474,-1945.4669,254.5040,35.2331,91.6450,81,1); //
    AddStaticVehicle(506,-1945.5603,273.6530,35.1812,89.6902,6,6); //
    AddStaticVehicle(496,-1944.8339,270.0969,35.1916,93.3027,66,72); //
    AddStaticVehicle(491,-1945.0740,267.2611,35.2295,92.2407,71,72); //
    AddStaticVehicle(429,-1945.3551,264.5546,35.1531,92.4913,13,13); //
    AddStaticVehicle(555,-1945.0366,262.0288,35.1372,90.7361,58,1); //
    AddStaticVehicle(451,-1944.9615,259.2213,35.1745,90.0966,125,125); //
    AddStaticVehicle(533,-1953.1833,291.6295,35.1662,91.2455,74,1); //
    AddStaticVehicle(534,-1953.2169,295.0115,35.1951,90.4148,42,42); //
    AddStaticVehicle(535,-1953.0565,298.1832,35.2300,90.2550,28,1); //
    AddStaticVehicle(541,-1952.8938,302.2056,35.0936,88.9586,58,8); //
    AddStaticVehicle(549,-1952.9830,306.7102,35.1688,90.2767,72,39); //
    AddStaticVehicle(522,-1954.6957,302.7755,40.6173,90.5051,7,79); //
    AddStaticVehicle(463,-1951.4506,265.9413,40.5874,91.7989,22,22); //
    AddStaticVehicle(463,-1951.4867,267.1980,40.5634,94.4170,19,19); //
    AddStaticVehicle(463,-1951.4852,268.4295,40.5817,89.3732,79,79); //
    AddStaticVehicle(522,-1954.7213,299.4221,40.5989,96.3384,3,8); //
    AddStaticVehicle(522,-1954.6957,302.7755,40.6078,90.5052,7,79); //
    AddStaticVehicle(522,-1954.7069,301.1224,40.6162,92.0182,36,105); //
    AddStaticVehicle(522,-1390.1002,453.2153,6.7491,356.5179,51,118); //
    AddStaticVehicle(522,-1393.2491,453.2917,6.7492,3.3031,3,3); //
    AddStaticVehicle(522,-1396.0013,453.2310,6.7496,359.0207,6,25); //
    AddStaticVehicle(522,-1398.8456,453.2303,6.7497,355.1139,7,79); //
    AddStaticVehicle(522,-1401.9338,453.1522,6.7488,2.2132,3,8); //
    AddStaticVehicle(522,-1404.6301,453.1590,6.7465,1.9923,36,105); //
    AddStaticVehicle(555,-1467.3123,455.0549,6.8707,1.4326,58,1); //
    AddStaticVehicle(555,-1460.0492,454.8849,6.8557,357.3570,60,1); //
    AddStaticVehicle(432,-1427.8864,456.5748,7.1987,358.6614,43,0); //
    AddStaticVehicle(496,-1362.9017,455.6645,6.9040,2.2109,53,56); //
    AddStaticVehicle(473,-1510.0785,486.7430,-0.3333,272.1229,56,53); //
    AddStaticVehicle(473,-1510.9210,493.6773,-0.2099,270.2419,56,15); //
    AddStaticVehicle(425,-1412.2778,500.1556,18.8070,93.1092,43,0); //
    AddStaticVehicle(473,953.9725,-1981.9916,-0.1320,171.2334,56,15); //
    AddStaticVehicle(473,956.2923,-1979.3085,-0.2996,174.7004,56,15); //
    AddStaticVehicle(473,950.0203,-1980.3384,-0.1613,175.0784,56,53); //
    AddStaticVehicle(473,950.0379,-1981.4933,-0.1494,179.2971,56,53); //
    AddStaticVehicle(473,946.8976,-1979.4149,-0.4027,172.9437,56,53); //
    AddStaticVehicle(473,944.3128,-1976.9994,-0.2306,178.1141,56,15); //
    AddStaticVehicle(473,940.9332,-1972.7695,-0.1766,178.5267,56,53); //
    AddStaticVehicle(522,-1357.8225,-641.4974,13.7159,180.6825,3,8); //
    AddStaticVehicle(522,-1358.6777,-641.4109,13.7187,178.3972,6,25); //
    AddStaticVehicle(522,-1359.5314,-641.3148,13.7114,180.3787,8,82); //
    AddStaticVehicle(522,-1360.1860,-641.2341,13.7192,181.0639,36,105); //
    AddStaticVehicle(522,-1360.9025,-641.2294,13.7188,176.9972,39,106); //
    AddStaticVehicle(522,-1361.5778,-641.1406,13.7181,179.3097,51,118); //
    AddStaticVehicle(522,-1362.2672,-641.1891,13.7183,180.4029,7,79); //
    AddStaticVehicle(468,-1374.0953,-640.9844,13.8097,176.4027,53,53); //
    AddStaticVehicle(468,-1373.2740,-640.9404,13.8176,183.4478,6,6); //
    AddStaticVehicle(468,-1372.3573,-640.6671,13.8177,187.8362,46,46); //
    AddStaticVehicle(468,-1371.2814,-640.7836,13.8176,183.0534,3,3); //
    AddStaticVehicle(468,-1370.3497,-640.6018,13.8175,181.7334,46,46); //
    AddStaticVehicle(468,-1369.6099,-640.6915,13.8177,181.5562,53,53); //
    AddStaticVehicle(468,-1368.7164,-640.4568,13.8176,187.1362,3,3); //
AddStaticVehicle(425,-2608.4680,-304.9549,23.6406,114.2961,43,0); //
AddStaticVehicle(451,-2663.5566,-286.4717,7.1432,315.1569,61,61); //
AddStaticVehicle(451,-2656.2732,-293.7188,7.1524,316.6906,75,75); //
AddStaticVehicle(411,-2659.8350,-290.0684,7.1890,135.6433,75,1); //
AddStaticVehicle(560,-2652.0496,-281.9955,7.1963,316.5591,52,39); //
AddStaticVehicle(567,-2648.0300,-285.3846,7.3591,135.4668,97,96); //
AddStaticVehicle(560,-2644.6865,-289.1743,7.1999,136.4219,9,39); //
AddStaticVehicle(567,-2655.5845,-278.6312,7.3245,316.4582,30,30); //
AddStaticVehicle(424,-2518.0552,-319.2154,39.2008,13.8361,24,53); //
AddStaticVehicle(424,-2513.4998,-317.9431,39.3500,8.3823,15,30); //
AddStaticVehicle(424,-2508.8196,-317.2989,39.5487,4.8149,35,61); //
AddStaticVehicle(522,-2541.1055,-310.3226,26.6832,95.3015,3,8); //
AddStaticVehicle(471,-2550.6797,-317.0075,25.9467,40.8013,103,111); //
AddStaticVehicle(522,-2558.3364,-316.0462,25.6051,352.7853,7,79); //
AddStaticVehicle(571,-2547.5730,-315.8978,25.9160,43.2214,91,2); //
AddStaticVehicle(571,-2543.9050,-311.8885,26.2112,53.7502,51,53); //
AddStaticVehicle(463,-2554.3276,-315.6928,25.7867,5.0391,79,79); //
AddStaticVehicle(463,-2541.6941,-307.2752,26.4880,77.1463,53,53); //
AddStaticVehicle(471,-2544.9951,-315.3224,26.2334,50.3505,120,117); //
AddStaticVehicle(522,-2525.4883,-321.6993,38.7145,8.6370,6,25); //
AddStaticVehicle(539,-2439.8843,-264.4847,35.7911,207.4327,75,75); //
AddStaticVehicle(539,-2464.3782,-281.4993,35.7856,233.8058,61,98); //
AddStaticVehicle(522,-2503.2732,-317.0514,39.4950,347.9118,3,3); //
AddStaticVehicle(539,-2496.2053,-284.6870,35.7878,276.4762,86,70); //
AddStaticVehicle(495,-2477.5569,-321.8882,42.1180,2.7294,119,122); //
AddStaticVehicle(495,-2467.0112,-321.8008,42.2311,357.8937,118,117); //
AddStaticVehicle(444,-2458.7490,-311.5925,42.1128,91.4932,32,53); //
AddStaticVehicle(444,-2459.2395,-306.2499,42.0419,92.6432,32,42); //
AddStaticVehicle(571,-2484.3420,-317.6891,40.8384,292.4745,2,35); //
AddStaticVehicle(571,-2458.6707,-319.0647,41.1912,55.0167,11,22); //
AddStaticVehicle(589,-983.2669,-676.5137,31.6682,264.0529,22,22); //
AddStaticVehicle(589,-983.9780,-687.0381,31.6707,262.2236,22,22); //
AddStaticVehicle(495,-983.8214,-623.0999,32.3600,272.3173,116,115); //
AddStaticVehicle(495,-983.2666,-633.2460,32.3588,270.9660,116,115); //
AddStaticVehicle(487,-1017.4914,-636.8539,32.1853,0.0011,54,29); //
AddStaticVehicle(487,-1077.6193,-626.7373,50.6963,287.2197,54,29); //
AddStaticVehicle(487,-1078.2465,-611.0579,50.6793,323.1404,54,29); //
AddStaticVehicle(487,-1110.4730,-613.1901,50.7266,89.6007,54,29); //
AddStaticVehicle(487,-1110.8683,-627.5208,50.6768,109.0907,54,29); //
AddStaticVehicle(487,-1058.7006,-697.0744,67.3009,3.8151,54,29); //
AddStaticVehicle(487,-1023.5349,-654.9156,32.1848,273.6596,54,29); //
AddStaticVehicle(468,-1029.9910,-622.8786,31.6756,94.4263,53,53); //
AddStaticVehicle(468,-1030.2380,-626.3697,31.6762,85.3792,53,53); //
AddStaticVehicle(468,-1029.3231,-627.9906,31.6762,96.2903,53,53); //
AddStaticVehicle(464,-1034.8806,-585.3705,31.3034,14.0834,14,75); //
AddStaticVehicle(464,-1045.2280,-585.5904,31.3032,358.3206,14,75); //
AddStaticVehicle(463,-1001.5331,-686.1107,31.5476,88.4639,22,22); //
AddStaticVehicle(463,-1006.1512,-686.2807,31.5501,91.6158,22,22); //
AddStaticVehicle(463,-1029.2770,-684.0997,31.5484,95.3781,22,22); //
AddStaticVehicle(451,-1017.4286,-689.4496,31.7150,179.1672,16,16); //
AddStaticVehicle(451,-1011.0633,-689.5233,31.7149,180.6984,16,16); //
AddStaticVehicle(447,-1054.1218,-653.2135,32.0203,0.0012,75,2); //
    







//---------------------------------אובייקטים------------------------------------





    CreateObject(13641, -1213.723267, 79.863922, 14.854208, 0.0000, 0.0000, 315.0000);
    CreateObject(16401, -1191.616821, 58.986259, 13.136963, 0.0000, 0.0000, 315.0000);
    CreateObject(18367, -1188.887573, 54.941544, 16.480129, 0.0000, 0.0000, 45.0000);
    CreateObject(18367, -1169.202393, 33.416527, 19.701488, 0.0000, 0.0000, 315.0000);
    CreateObject(3279, -1196.087036, 11.121422, 13.224054, 0.0000, 0.0000, 45.0000);
    CreateObject(3364, -1275.818848, 2.340181, 34.750809, 0.0000, 0.0000, 213.7500);
    CreateObject(18367, -1191.136230, 13.766447, 23.571373, 0.0000, 0.0000, 225.0000);
    CreateObject(18367, -1204.531006, 26.436047, 25.365465, 0.0000, 0.0000, 225.0000);
    CreateObject(18367, -1296.703857, 92.998177, 16.208542, 0.0000, 0.0000, 258.7500);
    CreateObject(3663, -1225.883789, 48.459656, 31.304802, 0.0000, 0.0000, 315.0000);
    CreateObject(3458, -1241.478882, 33.533665, 31.016504, 0.0000, 0.0000, 225.0000);
    CreateObject(13590, -1254.710083, 21.010258, 34.920818, 0.0000, 0.0000, 135.0000);
    CreateObject(13648, -1262.339722, 29.430349, 31.878784, 0.0000, 0.0000, 45.0000);
    CreateObject(18367, -1275.576294, 42.191677, 33.657513, 0.0000, 0.0000, 315.0000);
    CreateObject(18367, -1297.663208, 21.920483, 36.880779, 0.0000, 0.0000, 236.2501);
    CreateObject(18367, -1323.655273, 38.870312, 40.298626, 0.0000, 0.0000, 225.0000);
    CreateObject(18367, -1343.638184, 60.649559, 43.482502, 0.0000, 0.0000, 135.0000);
    CreateObject(18367, -1321.570068, 82.443329, 47.047550, 0.0000, 0.0000, 135.0000);
    CreateObject(18367, -1298.971313, 102.741356, 51.132088, 0.0000, 0.0000, 45.0000);
    CreateObject(18367, -1276.962769, 80.886307, 54.680794, 0.0000, 0.0000, 45.0000);
    CreateObject(18367, -1256.894775, 59.062920, 57.818718, 0.0000, 0.0000, 315.0000);
    CreateObject(18367, -1279.710449, 38.214531, 61.259647, 0.0000, 0.0000, 292.5000);
    CreateObject(18367, -1308.912598, 27.674557, 64.811806, 0.0000, 0.0000, 225.0000);
    CreateObject(18367, -1329.813965, 50.414635, 68.097366, 0.0000, 0.0000, 78.7500);
    CreateObject(18367, -1299.670898, 45.854343, 71.518997, 0.0000, 0.0000, 135.0000);
    CreateObject(18609, -1286.011108, 57.860531, 74.767502, 0.0000, 0.0000, 315.0000);
    CreateObject(1245, -1281.352051, 62.652573, 74.467209, 0.0000, 0.0000, 135.0000);
    CreateObject(1607, 2311.050781, -583.561279, 131.393372, 0.0000, 0.0000, 0.0000);
    CreateObject(1607, 1994.898193, 1549.932861, 7.627992, 0.0000, 0.0000, 0.0000);
    CreateObject(1607, 1992.530640, 1544.729248, 7.627992, 0.0000, 0.0000, 0.0000);
    CreateObject(1607, 1988.780151, 1550.114868, 7.627992, 0.0000, 0.0000, 0.0000);
    CreateObject(1608, 1976.429321, 1527.717407, 8.355778, 0.0000, 0.0000, 0.0000);
    CreateObject(1608, 1981.618042, 1534.145508, 8.355780, 0.0000, 0.0000, 0.0000);
    CreateObject(1608, 1985.835815, 1528.189697, 8.355780, 0.0000, 0.0000, 0.0000);
    CreateObject(903, 1965.604004, 1534.698486, 12.005417, 0.0000, 0.0000, 0.0000);
    CreateObject(1601, 1976.792114, 1533.839600, 6.595169, 0.0000, 0.0000, 0.0000);
    CreateObject(1240, 2102.969971, 1161.383545, 10.844502, 0.0000, 0.0000, 101.2500);
    CreateObject(1240, 2090.086426, 1420.793457, 10.016377, 0.0000, 0.0000, 78.7500);
    CreateObject(1550, 2000.722168, 1537.760864, 12.979280, 0.0000, 0.0000, 0.0000);
    CreateObject(1242, 2238.645996, 2449.294922, 10.264668, 0.0000, 0.0000, 270.0000);
    CreateObject(3819, 2032.293213, 820.505981, 7.425077, 0.0000, 0.0000, 270.0000);
    CreateObject(3819, 2023.680420, 820.646606, 7.389511, 0.0000, 0.0000, 270.0000);
    CreateObject(3819, 2019.364624, 865.661316, 7.363633, 0.0000, 0.0000, 90.0000);
    CreateObject(3819, 2010.828613, 865.651062, 7.361619, 0.0000, 0.0000, 90.0000);
    CreateObject(3279, 368.138550, 2483.148193, 15.559992, 0.0000, 0.0000, 180.0000);
    CreateObject(3279, 343.176056, 2517.791260, 15.716722, 0.0000, 0.0000, 180.0000);
    CreateObject(3279, 319.674286, 2482.899170, 15.559992, 0.0000, 0.0000, 180.0000);
    CreateObject(3279, 290.498749, 2518.048584, 15.743182, 0.0000, 0.0000, 180.0000);
    CreateObject(3279, 259.114594, 2483.241211, 15.559992, 0.0000, 0.0000, 180.0000);
    CreateObject(3279, 223.832550, 2517.885986, 15.735041, 0.0000, 0.0000, 180.0000);
    CreateObject(3279, 186.215591, 2482.851318, 15.559996, 0.0000, 0.0000, 180.0000);
    CreateObject(746, 249.438477, 2545.827393, 17.007370, 0.0000, 0.0000, 0.0000);
    CreateObject(746, 261.084656, 2539.677246, 17.015182, 0.0000, 0.0000, 0.0000);
    CreateObject(746, 249.187378, 2543.949219, 17.007370, 0.0000, 0.0000, 0.0000);
    CreateObject(746, 272.781708, 2535.934082, 17.015182, 0.0000, 0.0000, 0.0000);
    CreateObject(746, 314.542847, 2533.525635, 20.131147, 0.0000, 0.0000, 0.0000);
    CreateObject(746, 267.815063, 2548.727539, 17.015182, 0.0000, 0.0000, 0.0000);
    CreateObject(746, 267.273865, 2537.528320, 17.015182, 0.0000, 0.0000, 0.0000);
    CreateObject(645, 191.953369, 2492.170654, 15.575920, 0.0000, 0.0000, 0.0000);
    CreateObject(645, 265.985901, 2488.070557, 15.575920, 0.0000, 0.0000, 0.0000);
    CreateObject(645, 297.423309, 2508.887451, 15.606339, 0.0000, 0.0000, 0.0000);
    CreateObject(645, 322.577881, 2490.187256, 15.575920, 0.0000, 0.0000, 0.0000);
    CreateObject(645, 343.577240, 2509.829346, 15.617971, 0.0000, 0.0000, 0.0000);
    CreateObject(645, 372.139618, 2491.380615, 15.575920, 0.0000, 0.0000, 0.0000);
    CreateObject(645, 226.342102, 2509.016602, 15.610260, 0.0000, 0.0000, 0.0000);
    CreateObject(9044, 226.983612, 2495.242188, 25.985140, 0.0000, 0.0000, 270.0000);
    CreateObject(9044, 297.338867, 2495.547363, 25.985136, 0.0000, 0.0000, 258.7500);
    CreateObject(647, 336.212921, 2501.566162, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 344.751556, 2487.424072, 17.316288, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 363.500763, 2503.043457, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 349.873444, 2499.285889, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(678, 337.824432, 2492.599854, 15.595472, 0.0000, 0.0000, 0.0000);
    CreateObject(678, 357.715637, 2490.475830, 15.595472, 0.0000, 0.0000, 0.0000);
    CreateObject(678, 289.616211, 2503.329834, 15.595472, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 284.816132, 2508.320801, 17.340202, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 289.056000, 2497.506104, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 254.104431, 2495.312012, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 253.344345, 2514.065918, 17.420719, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 257.123199, 2505.134277, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 266.742981, 2513.216309, 17.409439, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 266.550385, 2497.034668, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 209.239044, 2520.944092, 17.548637, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 206.187286, 2510.546387, 17.375416, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 187.432648, 2495.295654, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 194.465485, 2520.090820, 17.539883, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 193.932007, 2508.571289, 17.340111, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 330.161407, 2487.305664, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 363.564697, 2503.185791, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 349.882721, 2499.297363, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 345.065033, 2487.330078, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 285.163391, 2507.028564, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 289.203735, 2497.168213, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 302.065613, 2503.455811, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 266.770996, 2497.838135, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 266.657013, 2513.155518, 17.408556, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 252.815277, 2513.463379, 17.412001, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 253.009552, 2513.624023, 17.414330, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 257.279358, 2504.715820, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 253.501709, 2493.580078, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 209.033295, 2521.552246, 17.557585, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 206.085220, 2510.507324, 17.374727, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 194.713287, 2520.153076, 17.540981, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 193.091339, 2506.219971, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 187.481277, 2495.203369, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(650, 342.678131, 2493.876221, 15.708267, 0.0000, 0.0000, 0.0000);
    CreateObject(650, 287.301727, 2504.440674, 15.708267, 0.0000, 0.0000, 0.0000);
    CreateObject(650, 262.302246, 2502.198242, 15.708263, 0.0000, 0.0000, 0.0000);
    CreateObject(650, 202.518280, 2505.589111, 15.708267, 0.0000, 0.0000, 0.0000);
    CreateObject(4853, -1361.886719, -696.062500, 9.679590, 0.0000, 0.0000, 281.2500);
    CreateObject(4853, -1400.564575, -731.991211, 2.873091, 0.0000, 0.0000, 0.0000);
    CreateObject(4853, -1488.030762, -732.132507, 2.869303, 0.0000, 0.0000, 0.0000);
    CreateObject(4853, -1577.288330, -732.020691, 2.799838, 0.0000, 0.0000, 0.0000);
    CreateObject(4853, -1637.567749, -702.491211, 2.855899, 0.0000, 0.0000, 315.0000);
    CreateObject(4853, -1694.080322, -653.457520, 2.773999, 0.0000, 0.0000, 326.2500);
    CreateObject(4853, -1689.229004, -668.094849, 2.762656, 0.0000, 0.0000, 315.0000);
    CreateObject(4853, -1644.975708, -721.914185, 2.895482, 0.0000, 0.0000, 303.7500);
    CreateObject(4853, -1586.327393, -749.425537, 2.861264, 0.0000, 0.0000, 0.0000);
    CreateObject(4853, -1507.109619, -762.756714, 2.900041, 0.0000, 0.0000, 337.5000);
    CreateObject(4853, -1428.764038, -777.892090, 2.917065, 0.0000, 0.0000, 0.0000);
    CreateObject(4853, -1355.770386, -778.253723, 2.944500, 0.0000, 0.0000, 0.0000);
    CreateObject(4853, -1328.877808, -751.913147, 2.854089, 0.0000, 0.0000, 45.0000);
    CreateObject(4853, -1258.109009, -712.514648, 2.861181, 0.0000, 0.0000, 11.2500);
    CreateObject(4853, -1217.586182, -662.029297, 2.882076, 0.0000, 0.0000, 90.0000);
    CreateObject(4853, -1212.236206, -593.131042, 2.921424, 0.0000, 0.0000, 78.7500);
    CreateObject(4853, -1182.305420, -525.482483, 2.920338, 0.0000, 0.0000, 56.2500);
    CreateObject(4853, -1133.519165, -453.453735, 2.995234, 0.0000, 0.0000, 56.2500);
    CreateObject(4853, -1093.963257, -378.664368, 0.133791, 0.0000, 0.0000, 67.5000);
    CreateObject(4853, -1058.696167, -293.677612, 2.936305, 0.0000, 0.0000, 67.5000);
    CreateObject(4853, -1037.310425, -220.384567, 3.007310, 0.0000, 0.0000, 78.7500);
    CreateObject(4853, -1010.196716, -97.964088, 2.786757, 0.0000, 0.0000, 78.7500);
    CreateObject(4853, -1019.583618, -96.429840, 2.944777, 0.0000, 0.0000, 78.7500);
    CreateObject(4853, -1046.886108, -218.155029, 2.856363, 0.0000, 0.0000, 78.7500);
    CreateObject(1633, -1028.420532, -177.290298, 7.468818, 0.0000, 0.0000, 348.7500);
    CreateObject(1633, -1035.959229, -177.371674, 7.689799, 0.0000, 0.0000, 348.7500);
    CreateObject(4853, -1028.995605, -94.740402, 2.965393, 0.0000, 0.0000, 78.7500);
    CreateObject(4853, -1008.708862, -16.315342, 2.939443, 0.0000, 0.0000, 78.7500);
    CreateObject(4853, -998.945313, -17.136656, 2.816826, 0.0000, 0.0000, 78.7500);
    CreateObject(4853, -986.899231, 66.731323, 2.923963, 0.0000, 0.0000, 78.7500);
    CreateObject(4853, -971.822388, 143.284286, 2.876786, 0.0000, 0.0000, 78.7500);
    CreateObject(4853, -955.522034, 225.810867, 2.866648, 0.0000, 0.0000, 78.7500);
    CreateObject(1633, -946.675476, 269.352325, 7.331001, 0.0000, 0.0000, 348.7500);
    CreateObject(1634, -940.070374, 282.823303, 1.333179, 0.0000, 0.0000, 168.7500);
    CreateObject(1634, -944.139038, 283.801514, 1.317675, 0.0000, 0.0000, 168.7500);
    CreateObject(1634, -947.948364, 284.627869, 1.343522, 0.0000, 0.0000, 168.7500);
    CreateObject(1633, -938.126770, 294.097260, 1.341806, 0.0000, 0.0000, 348.7500);
    CreateObject(1633, -942.139709, 294.860413, 1.268769, 0.0000, 0.0000, 348.7500);
    CreateObject(1633, -946.016357, 295.691162, 1.256015, 0.0000, 0.0000, 348.7500);
    CreateObject(4853, -932.616943, 340.160950, 2.881953, 0.0000, 0.0000, 78.7500);
    CreateObject(4853, -928.614929, 339.682007, 2.858426, 0.0000, 0.0000, 78.7500);
    CreateObject(4853, -913.216675, 425.876282, 2.917506, 0.0000, 0.0000, 78.7500);
    CreateObject(4853, -897.112793, 506.461121, 2.896724, 0.0000, 0.0000, 78.7500);
    CreateObject(4853, -849.323914, 535.581543, 2.858943, 0.0000, 0.0000, 0.0000);
    CreateObject(4853, -794.754761, 573.073730, 2.952592, 0.0000, 0.0000, 67.5000);
    CreateObject(4853, -742.099792, 613.347351, 3.042515, 0.0000, 0.0000, 11.2500);
    CreateObject(4853, -742.759827, 647.624023, 3.564421, 0.0000, 0.0000, 315.0000);
    CreateObject(1633, -1077.411987, -339.569824, 4.598143, 0.0000, 0.0000, 337.5000);
    CreateObject(4853, -808.324951, 658.130188, 3.442898, 0.0000, 0.0000, 11.2500);
    CreateObject(4853, -889.435242, 659.392517, 2.986965, 0.0000, 0.0000, 348.7500);
    CreateObject(4853, -974.382813, 676.351257, 2.920941, 0.0000, 0.0000, 348.7500);
    CreateObject(4853, -1059.800293, 693.554810, 2.880421, 0.0000, 0.0000, 348.7500);
    CreateObject(4853, -1144.769287, 731.130127, 2.958657, 0.0000, 0.0000, 326.2500);
    CreateObject(16401, -1153.670532, 731.549805, 6.764538, 0.0000, 0.0000, 157.5000);
    CreateObject(16401, -1151.785889, 734.746094, 7.080140, 0.0000, 0.0000, 146.2500);
    CreateObject(16401, -1149.207031, 737.453979, 7.326222, 0.0000, 0.0000, 146.2500);
    CreateObject(16644, -1103.962280, 702.015503, 6.144282, 0.0000, 0.0000, 326.2500);
    CreateObject(16644, -1103.411743, 705.483521, 6.580790, 0.0000, 0.0000, 326.2500);
    CreateObject(4853, -1242.458618, 785.376831, 2.379051, 0.0000, 0.0000, 326.2500);
    CreateObject(4853, -1237.148438, 792.879578, 2.924706, 0.0000, 0.0000, 326.2500);
    CreateObject(4853, -1232.217285, 801.188782, 2.709717, 0.0000, 0.0000, 326.2500);
    CreateObject(4853, -1300.742920, 812.565063, 2.962103, 0.0000, 0.0000, 326.2500);
    CreateObject(4853, -1306.076172, 804.952942, 2.876609, 0.0000, 0.0000, 326.2500);
    CreateObject(4853, -1363.573364, 858.916504, 3.014575, 0.0000, 0.0000, 315.0000);
    CreateObject(4853, -1388.111206, 913.047058, 2.838492, 0.0000, 0.0000, 281.2500);
    CreateObject(4853, -1403.754517, 991.565186, 2.928335, 0.0000, 0.0000, 281.2500);
    CreateObject(4853, -1419.308350, 1069.547974, 3.048881, 0.0000, 0.0000, 281.2500);
    CreateObject(4853, -1438.061890, 1163.208496, 2.961485, 0.0000, 0.0000, 281.2500);
    CreateObject(4853, -1404.989380, 1210.000488, 2.948951, 0.0000, 0.0000, 191.2500);
    CreateObject(4853, -1374.250977, 1257.888306, 2.791880, 0.0000, 0.0000, 281.2500);
    CreateObject(4853, -1390.440796, 1336.950073, 2.868832, 0.0000, 0.0000, 281.2500);
    CreateObject(4853, -1404.041504, 1405.138184, 2.831259, 0.0000, 0.0000, 281.2500);
    CreateObject(4853, -1451.888306, 1439.941284, 2.704900, 0.0000, 0.0000, 0.0000);
    CreateObject(4853, -1508.343872, 1481.851074, 2.809514, 0.0000, 0.0000, 292.5000);
    CreateObject(4853, -1474.830688, 1507.246338, 2.881285, 0.0000, 0.0000, 0.0000);
    CreateObject(979, -1452.969971, 1507.050415, 6.885568, 0.0000, 0.0000, 270.0000);
    CreateObject(1225, -1177.907593, 765.028198, 0.408112, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1183.584351, 765.679382, 0.453116, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1182.242676, 760.810791, 0.457261, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1186.357910, 760.972351, 0.447303, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1184.782349, 755.600769, 0.378926, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1189.440796, 755.249207, 0.384872, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1188.484375, 768.685852, 0.383776, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1191.670044, 764.142639, 0.340480, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1194.602905, 759.424194, 0.385252, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1027.168823, -104.905685, 7.058357, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1025.229858, -104.029266, 7.080317, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1023.278564, -105.436745, 6.628898, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1021.148132, -105.860512, 6.413950, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1018.896851, -106.308319, 6.713952, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1016.737183, -105.414757, 7.154665, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1013.922180, -106.964920, 6.457181, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1028.747559, -103.236694, 6.773712, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1031.629395, -103.118690, 6.629096, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1011.399841, -107.466644, 6.191104, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1032.988281, -180.657211, 7.060245, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1054.652344, -284.082977, 6.506124, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1071.052856, -322.919098, 6.506123, 0.0000, 0.0000, 0.0000);
    CreateObject(4853, -1211.222412, -587.437500, 2.790803, 0.0000, 0.0000, 78.7500);
    CreateObject(1225, -1204.483276, -556.828247, 6.595703, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1217.662720, -705.076111, 6.471177, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1383.867432, -732.050964, 6.442908, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1379.171143, -738.954346, 0.244397, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1373.908936, -739.002930, 0.382682, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1379.294678, -721.327576, 0.429851, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1373.826660, -721.197083, 0.486506, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1369.236328, -721.769836, 0.456163, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1368.869507, -738.866333, 0.325326, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1544.814697, -749.213867, 6.710848, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1715.829590, -639.834412, 6.460529, 0.0000, 0.0000, 0.0000);
    CreateObject(1225, -1707.423584, -646.880371, 6.606608, 0.0000, 0.0000, 0.0000);
    CreateObject(3279, 368.138550, 2483.148193, 15.559992, 0.0000, 0.0000, 180.0000);
    CreateObject(3279, 343.176056, 2517.791260, 15.716722, 0.0000, 0.0000, 180.0000);
    CreateObject(3279, 319.674286, 2482.899170, 15.559992, 0.0000, 0.0000, 180.0000);
    CreateObject(3279, 290.498749, 2518.048584, 15.743182, 0.0000, 0.0000, 180.0000);
    CreateObject(3279, 259.114594, 2483.241211, 15.559992, 0.0000, 0.0000, 180.0000);
    CreateObject(3279, 223.832550, 2517.885986, 15.735041, 0.0000, 0.0000, 180.0000);
    CreateObject(3279, 186.215591, 2482.851318, 15.559996, 0.0000, 0.0000, 180.0000);
    CreateObject(746, 249.438477, 2545.827393, 17.007370, 0.0000, 0.0000, 0.0000);
    CreateObject(746, 261.084656, 2539.677246, 17.015182, 0.0000, 0.0000, 0.0000);
    CreateObject(746, 249.187378, 2543.949219, 17.007370, 0.0000, 0.0000, 0.0000);
    CreateObject(746, 272.781708, 2535.934082, 17.015182, 0.0000, 0.0000, 0.0000);
    CreateObject(746, 314.542847, 2533.525635, 20.131147, 0.0000, 0.0000, 0.0000);
    CreateObject(746, 267.815063, 2548.727539, 17.015182, 0.0000, 0.0000, 0.0000);
    CreateObject(746, 267.273865, 2537.528320, 17.015182, 0.0000, 0.0000, 0.0000);
    CreateObject(645, 191.953369, 2492.170654, 15.575920, 0.0000, 0.0000, 0.0000);
    CreateObject(645, 265.985901, 2488.070557, 15.575920, 0.0000, 0.0000, 0.0000);
    CreateObject(645, 297.423309, 2508.887451, 15.606339, 0.0000, 0.0000, 0.0000);
    CreateObject(645, 322.577881, 2490.187256, 15.575920, 0.0000, 0.0000, 0.0000);
    CreateObject(645, 343.577240, 2509.829346, 15.617971, 0.0000, 0.0000, 0.0000);
    CreateObject(645, 372.139618, 2491.380615, 15.575920, 0.0000, 0.0000, 0.0000);
    CreateObject(645, 226.342102, 2509.016602, 15.610260, 0.0000, 0.0000, 0.0000);
    CreateObject(9044, 226.983612, 2495.242188, 25.985140, 0.0000, 0.0000, 270.0000);
    CreateObject(9044, 297.338867, 2495.547363, 25.985136, 0.0000, 0.0000, 258.7500);
    CreateObject(647, 336.212921, 2501.566162, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 344.751556, 2487.424072, 17.316288, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 363.500763, 2503.043457, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 349.873444, 2499.285889, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(678, 337.824432, 2492.599854, 15.595472, 0.0000, 0.0000, 0.0000);
    CreateObject(678, 357.715637, 2490.475830, 15.595472, 0.0000, 0.0000, 0.0000);
    CreateObject(678, 289.616211, 2503.329834, 15.595472, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 284.816132, 2508.320801, 17.340202, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 289.056000, 2497.506104, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 254.104431, 2495.312012, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 253.344345, 2514.065918, 17.420719, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 257.123199, 2505.134277, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 266.742981, 2513.216309, 17.409439, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 266.550385, 2497.034668, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 209.239044, 2520.944092, 17.548637, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 206.187286, 2510.546387, 17.375416, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 187.432648, 2495.295654, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 194.465485, 2520.090820, 17.539883, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 193.932007, 2508.571289, 17.340111, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 330.161407, 2487.305664, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 363.564697, 2503.185791, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 349.882721, 2499.297363, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 345.065033, 2487.330078, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 285.163391, 2507.028564, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 289.203735, 2497.168213, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 302.065613, 2503.455811, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 266.770996, 2497.838135, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 266.657013, 2513.155518, 17.408556, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 252.815277, 2513.463379, 17.412001, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 253.009552, 2513.624023, 17.414330, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 257.279358, 2504.715820, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 253.501709, 2493.580078, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 209.033295, 2521.552246, 17.557585, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 206.085220, 2510.507324, 17.374727, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 194.713287, 2520.153076, 17.540981, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 193.091339, 2506.219971, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(647, 187.481277, 2495.203369, 17.316292, 0.0000, 0.0000, 0.0000);
    CreateObject(650, 342.678131, 2493.876221, 15.708267, 0.0000, 0.0000, 0.0000);
    CreateObject(650, 287.301727, 2504.440674, 15.708267, 0.0000, 0.0000, 0.0000);
    CreateObject(650, 262.302246, 2502.198242, 15.708263, 0.0000, 0.0000, 0.0000);
    CreateObject(650, 202.518280, 2505.589111, 15.708267, 0.0000, 0.0000, 0.0000);

CreateObject(2780, -2653.164063, -288.488312, 6.543470, 0.0000, 0.0000, 0.0000);
CreateObject(3528, -2485.518799, -284.676636, 41.963470, 0.0000, 0.0000, 180.0000);
CreateObject(7073, -2608.132568, -245.372269, 36.443340, 0.0000, 0.0000, 270.0000);
CreateObject(14608, -2560.390137, -250.009979, 22.664890, 0.0000, 0.0000, 101.2500);






	AddStaticPickup(371, 15, 1710.3359,1614.3585,10.1191); //para
	AddStaticPickup(371, 15, 1964.4523,1917.0341,130.9375); //para
	AddStaticPickup(371, 15, 2055.7258,2395.8589,150.4766); //para
	AddStaticPickup(371, 15, 2265.0120,1672.3837,94.9219); //para
	AddStaticPickup(371, 15, 2265.9739,1623.4060,94.9219); //para

	SetTimer("MoneyGrubScoreUpdate", 1000, 1);
	//SetTimer("GameModeExitFunc", gRoundTime, 0);

	return 1;
}

public SendPlayerFormattedText(playerid, const str[], define)
{
	new tmpbuf[256];
	format(tmpbuf, sizeof(tmpbuf), str, define);
	SendClientMessage(playerid, 0xFF004040, tmpbuf);
}

public SendAllFormattedText(playerid, const str[], define)
{
	new tmpbuf[256];
	format(tmpbuf, sizeof(tmpbuf), str, define);
	SendClientMessageToAll(0xFFFF00AA, tmpbuf);
}

strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}



