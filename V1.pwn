#include <a_samp>
#include <core>
#include <float>

#pragma tabsize 0

#define COLOR_GREY 0xAFAFAFAA
#define COLOR_GREEN 0x33AA33AA
#define COLOR_RED 0xAA3333AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_WHITE 0xFFFFFFAA
#define PocketMoney 50000 // Amount player recieves on spawn.
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
		print("  Running LVDM ~MoneyGrub\n");
		print("         Coded By");
		print("            Jax");
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
	GameTextForPlayer(playerid,"~w~SA-MP: ~r~Las Venturas ~g~MoneyGrub",5000,5);
	SendPlayerFormattedText(playerid, "Welcome to Las Venturas MoneyGrub, For help type /help.", 0);
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

	if(strcmp(cmd, "/help", true) == 0) {
		SendPlayerFormattedText(playerid,"Las Venturas Deathmatch: Money Grub Coded By Jax and the SA-MP Team.",0);
		SendPlayerFormattedText(playerid,"Type: /objective : to find out what to do in this gamemode.",0);
		SendPlayerFormattedText(playerid,"Type: /givecash [playerid] [money-amount] to send money to other players.",0);
		SendPlayerFormattedText(playerid,"Type: /tips : to see some tips from the creator of the gamemode.", 0);
    return 1;
	}
	if(strcmp(cmd, "/objective", true) == 0) {
		SendPlayerFormattedText(playerid,"This gamemode is faily open, there's no specific win / endgame conditions to meet.",0);
		SendPlayerFormattedText(playerid,"In LVDM:Money Grub, when you kill a player, you will receive whatever money they have.",0);
		SendPlayerFormattedText(playerid,"Consequently, if you have lots of money, and you die, your killer gets your cash.",0);
		SendPlayerFormattedText(playerid,"However, you're not forced to kill players for money, you can always gamble in the", 0);
		SendPlayerFormattedText(playerid,"Casino's.", 0);
    return 1;
	}
	if(strcmp(cmd, "/tips", true) == 0) {
		SendPlayerFormattedText(playerid,"Spawning with just a desert eagle might sound lame, however the idea of this",0);
		SendPlayerFormattedText(playerid,"gamemode is to get some cash, get better guns, then go after whoever has the",0);
		SendPlayerFormattedText(playerid,"most cash. Once you've got the most cash, the idea is to stay alive(with the",0);
		SendPlayerFormattedText(playerid,"cash intact)until the game ends, simple right ?", 0);
    return 1;
	}
	
 	if(strcmp(cmd, "/givecash", true) == 0) {
	    new tmp[256];
		tmp = strtok(cmdtext, idx);

		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "USAGE: /givecash [playerid] [amount]");
			return 1;
		}
		giveplayerid = strval(tmp);
		
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "USAGE: /givecash [playerid] [amount]");
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
				format(string, sizeof(string), "You have sent %s(player: %d), $%d.", giveplayer,giveplayerid, moneys);
				SendClientMessage(playerid, COLOR_YELLOW, string);
				format(string, sizeof(string), "You have recieved $%d from %s(player: %d).", moneys, sendername, playerid);
				SendClientMessage(giveplayerid, COLOR_YELLOW, string);
				printf("%s(playerid:%d) has transfered %d to %s(playerid:%d)",sendername, playerid, moneys, giveplayer, giveplayerid);
			}
			else {
				SendClientMessage(playerid, COLOR_YELLOW, "Invalid transaction amount.");
			}
		}
		else {
				format(string, sizeof(string), "%d is not an active player.", giveplayerid);
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

	SetGameModeText("Ventura's DM~MG");

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
	AddPlayerClass(265,1958.3783,1343.1572,15.3746,270.1425,0,0,24,300,-1,-1);
	AddPlayerClass(266,1958.3783,1343.1572,15.3746,270.1425,0,0,24,300,-1,-1);
	AddPlayerClass(267,1958.3783,1343.1572,15.3746,270.1425,0,0,24,300,-1,-1);
	AddPlayerClass(268,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(269,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(270,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(271,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(272,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	
	AddPlayerClass(280,1958.3783,1343.1572,15.3746,270.1425,0,0,24,300,-1,-1);
	AddPlayerClass(281,1958.3783,1343.1572,15.3746,270.1425,0,0,24,300,-1,-1);
	AddPlayerClass(282,1958.3783,1343.1572,15.3746,270.1425,0,0,24,300,-1,-1);
	AddPlayerClass(283,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(284,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(285,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(286,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(287,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	
	AddPlayerClass(254,1958.3783,1343.1572,15.3746,0.0,0,0,24,300,-1,-1);
	AddPlayerClass(255,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(256,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(257,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(258,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(259,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(260,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(261,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(262,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(263,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(264,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(274,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(275,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(276,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	
	AddPlayerClass(1,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(2,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(290,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(291,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(292,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(293,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(294,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(295,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(296,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(297,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(298,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
    AddPlayerClass(299,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);

	AddPlayerClass(277,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(278,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(279,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(288,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(47,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(48,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(49,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(50,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(51,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(52,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(53,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(54,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(55,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(56,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(57,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(58,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(59,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(60,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(61,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(62,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(63,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(64,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(66,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(67,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(68,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(69,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(70,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(71,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(72,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(73,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(75,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(76,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(78,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(79,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(80,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(81,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(82,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(83,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(84,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(85,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(87,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(88,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(89,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(91,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(92,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(93,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(95,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(96,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(97,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(98,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(99,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(100,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(101,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(102,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(103,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(104,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(105,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(106,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(107,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(108,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(109,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(110,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(111,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(112,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(113,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(114,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(115,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(116,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(117,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(118,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(120,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(121,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(122,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(123,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(124,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(125,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(126,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(127,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(128,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(129,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(131,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(133,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(134,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(135,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(136,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(137,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(138,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(139,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(140,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(141,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(142,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(143,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(144,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(145,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(146,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(147,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(148,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(150,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(151,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(152,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(153,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(154,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(155,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(156,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(157,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(158,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(159,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(160,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(161,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(162,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(163,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(164,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(165,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(166,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(167,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(168,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(169,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(170,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(171,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(172,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(173,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(174,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(175,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(176,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(177,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(178,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(179,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(180,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(181,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(182,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(183,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(184,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(185,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(186,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(187,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(188,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(189,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(190,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(191,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(192,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(193,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(194,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(195,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(196,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(197,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(198,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(199,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(200,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(201,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(202,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(203,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(204,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(205,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(206,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(207,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(209,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(210,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(211,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(212,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(213,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(214,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(215,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(216,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(217,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(218,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(219,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(220,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(221,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(222,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(223,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(224,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(225,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(226,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(227,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(228,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(229,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(230,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(231,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(232,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(233,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(234,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(235,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(236,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(237,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(238,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(239,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(240,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(241,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(242,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(243,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(244,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(245,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(246,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(247,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(248,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(249,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(250,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(251,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(253,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);

	// Car Spawns

AddStaticVehicle(411,2045.2288,819.9606,7.2767,358.5542,0,1); // אינפרנוס נמצא ברייס
AddStaticVehicle(411,2048.1553,819.9019,7.2876,358.4722,1,1); // אינפרנוס נמצא ברייס
AddStaticVehicle(411,2051.1892,819.7206,7.3198,359.3940,3,1); // אינפרנוס נמצא ברייס
AddStaticVehicle(411,2054.1689,819.7044,7.3210,358.8867,0,1); // אינפרנוס נמצא ברייס
AddStaticVehicle(411,2057.2012,819.6973,7.3202,358.6392,1,1); // אינפרנוס נמצא ברייס
AddStaticVehicle(411,2060.1831,819.6367,7.3335,358.3737,3,1); // אינפרנוס נמצא ברייס
AddStaticVehicle(411,2063.2590,819.6016,7.3452,358.1668,0,1); // אינפרנוס נמצא ברייס
AddStaticVehicle(411,2066.2185,819.4238,7.3821,359.2484,1,1); // אינפרנוס נמצא ברייס
AddStaticVehicle(411,2069.4702,819.4650,7.3740,359.9048,3,1); // אינפרנוס נמצא ברייס
AddStaticVehicle(411,2072.5967,819.5551,7.3563,0.0357,0,1); // אינפרנוס נמצא ברייס
AddStaticVehicle(451,2084.8691,874.6403,6.8549,89.1037,1,0); // טורמיסו נמצא ברייס
AddStaticVehicle(451,2084.9263,877.2595,6.9159,88.4576,3,0); // טורמיסו נמצא ברייס
AddStaticVehicle(451,2085.0330,879.6968,6.9708,88.3055,3,1); // טורמיסו נמצא ברייס
AddStaticVehicle(451,2085.0415,882.0660,7.0227,87.6500,1,123); // טורמיסו נמצא ברייס
AddStaticVehicle(451,2085.1880,884.4664,7.0983,87.2919,2,36); // טורמיסו נמצא ברייס
AddStaticVehicle(451,2085.1860,886.8708,7.1891,87.5094,3,125); // טורמיסו נמצא ברייס
AddStaticVehicle(451,2085.1750,889.3656,7.2855,87.6808,1,46); // טורמיסו נמצא ברייס
AddStaticVehicle(451,2085.2378,891.9711,7.3860,88.1243,0,18); // טורמיסו נמצא ברייס
AddStaticVehicle(451,2085.2183,894.5524,7.4899,88.2768,3,16); // טורמיסו נמצא ברייס
AddStaticVehicle(451,2085.2097,897.0823,7.5816,89.6046,1,36); // טורמיסו נמצא ברייס
AddStaticVehicle(502,2029.4141,874.2473,7.0161,270.2141,0,88); // מכונית מרוץ נמצא ברייס
AddStaticVehicle(502,2029.2990,876.7069,7.0949,270.1921,51,75); // מכונית מרוץ נמצא ברייס
AddStaticVehicle(502,2029.3085,879.2966,7.1673,271.3690,3,75); // מכונית מרוץ נמצא ברייס
AddStaticVehicle(502,2029.3003,881.8206,7.2142,271.3430,53,75); // מכונית מרוץ נמצא ברייס
AddStaticVehicle(502,2029.2457,884.3589,7.3106,271.1004,58,67); // מכונית מרוץ נמצא ברייס
AddStaticVehicle(502,2029.2568,886.8986,7.4032,269.9294,75,61); // מכונית מרוץ נמצא ברייס
AddStaticVehicle(502,2029.2483,889.5179,7.5051,269.0068,79,62); // מכונית מרוץ נמצא ברייס
AddStaticVehicle(502,2029.2980,891.9990,7.6029,269.4046,7,94); // מכונית מרוץ נמצא ברייס
AddStaticVehicle(502,2029.3297,894.4448,7.6727,269.8139,36,88); // מכונית מרוץ נמצא ברייס
AddStaticVehicle(502,2029.3428,897.0640,7.7871,269.8835,53,75); // מכונית מרוץ נמצא ברייס
AddStaticVehicle(522,2135.4172,987.9705,10.3860,1.5892,8,82); // אופנוע נמצא בחניה של החנות נשקים
AddStaticVehicle(522,2132.3035,987.7944,10.3814,0.4980,36,105); // אופנוע נמצא בחניה של החנות נשקים
AddStaticVehicle(522,2129.1421,987.5734,10.3803,358.2170,7,79); // אופנוע נמצא בחניה של החנות נשקים
AddStaticVehicle(522,2125.7898,987.6928,10.3773,359.3650,6,25); // אופנוע נמצא בחניה של החנות נשקים
AddStaticVehicle(522,2122.5801,987.5131,10.3740,1.1743,3,8); // אופנוע נמצא בחניה של החנות נשקים
AddStaticVehicle(533,2171.5295,1012.9623,10.5294,270.1851,75,1); // פלצר נמצא בחניה של החנות נשקים
AddStaticVehicle(535,2171.7073,1022.7109,10.5858,271.7867,28,1); // ואן נמצא בחניה של החנות נשקים
AddStaticVehicle(506,2163.0222,1022.5323,10.5277,89.0215,7,7); // סוםר גי טי נמצא בחניה של החנות נשקים
AddStaticVehicle(505,2163.3989,1012.9188,10.9669,90.0394,14,123); // רנצ'ר נמצא בחניה של החנות נשקים
AddStaticVehicle(533,2141.6355,1012.8928,10.5320,270.1840,74,1); // פלצר נמצא בחניה של החנות נשקים
AddStaticVehicle(535,2141.9028,1019.3858,10.5856,270.0273,31,1); // ואן נמצא בחניה של החנות נשקים
AddStaticVehicle(526,2133.1931,1025.7271,10.5894,88.9652,9,39); // פורטונ נמצא בחניה של החנות נשקים
AddStaticVehicle(505,2133.3267,1019.3495,10.9665,91.6780,120,123); // רנצ'ר נמצא בחניה של החנות נשקים
AddStaticVehicle(506,2132.8042,1012.8610,10.5274,89.8152,6,6); // סוםר גי טי נמצא בחניה של החנות נשקים
AddStaticVehicle(409,2038.6027,1007.6799,10.4719,179.6696,1,1); // לימו בקזינו
AddStaticVehicle(409,2038.5636,999.0142,10.4742,359.5958,1,1); // לימו בקזינו
AddStaticVehicle(506,2350.3186,1440.8096,42.5256,89.1541,52,52); // דריפט
AddStaticVehicle(541,2350.4956,1437.2173,42.4447,88.2481,60,1); // דריפט
AddStaticVehicle(506,2350.5691,1433.6458,42.5252,89.2747,76,76); // דריפט
AddStaticVehicle(541,2350.8044,1430.0839,42.4454,89.7179,58,8); // דריפט
AddStaticVehicle(496,2350.7988,1426.4822,42.5375,90.1666,53,56); // דריפט
AddStaticVehicle(429,2350.8977,1422.8158,42.5030,90.1572,13,13); // דריפט
AddStaticVehicle(496,2351.1201,1419.5577,42.5319,90.6897,66,72); // דריפט
AddStaticVehicle(429,2351.0034,1415.7306,42.5019,89.6937,14,14); // דריפט
AddStaticVehicle(451,2304.2473,1415.7284,42.5212,268.7430,46,46); // דריפט
AddStaticVehicle(415,2304.0071,1419.2883,42.5962,269.4820,40,1); // דריפט
AddStaticVehicle(451,2304.3667,1422.8356,42.5302,271.5862,18,18); // דריפט
AddStaticVehicle(415,2303.9126,1426.4495,42.5935,270.0424,36,1); // דריפט
AddStaticVehicle(451,2303.9792,1430.1698,42.5305,269.9818,16,16); // דריפט
AddStaticVehicle(415,2303.7063,1433.6986,42.5942,269.9312,25,1); // דריפט
AddStaticVehicle(522,2289.2556,1388.7084,42.3753,0.2356,3,8); // דריפט
AddStaticVehicle(522,2285.7432,1388.6124,42.3761,358.4778,3,3); // דריפט
AddStaticVehicle(522,2282.5103,1388.5464,42.3753,359.2468,51,118); // דריפט
AddStaticVehicle(522,2292.7026,1388.6001,42.3833,356.4232,6,25); // דריפט
AddStaticVehicle(522,2295.8230,1388.3998,42.3824,358.2785,7,79); // דריפט
AddStaticVehicle(522,2299.2290,1388.1979,42.3911,357.6555,36,105); // דריפט
AddStaticVehicle(522,2302.5510,1388.1735,42.3851,356.6583,8,82); // דריפט
AddStaticVehicle(468,-661.0862,2332.0662,138.3438,70.8280,46,46); // ג'יפ
AddStaticVehicle(468,-661.4623,2330.3176,138.3651,72.6203,0,0); // ג'יפ
AddStaticVehicle(468,-661.4928,2327.7808,138.4054,85.7909,1,1); // ג'יפ
AddStaticVehicle(468,-661.0877,2326.3508,138.3928,90.8679,3,3); // ג'יפ
AddStaticVehicle(468,-660.9782,2323.4045,138.3887,84.7755,6,6); // ג'יפ
AddStaticVehicle(468,-661.1309,2320.8574,138.4020,86.0688,51,51); // ג'יפ
AddStaticVehicle(468,-661.2366,2319.2612,138.4091,91.0214,53,53); // ג'יפ
AddStaticVehicle(471,-673.3989,2312.1697,134.1337,82.7739,103,111); // ג'יפ
AddStaticVehicle(471,-675.9707,2315.2883,133.6638,97.4851,103,111); // ג'יפ
AddStaticVehicle(471,-676.7244,2318.6501,133.6569,92.8195,120,114); // ג'יפ
AddStaticVehicle(495,-703.9617,2360.5977,128.0502,289.7516,119,122); // ג'יפ
AddStaticVehicle(495,-706.1513,2365.9219,128.1778,285.9084,118,117); // ג'יפ
AddStaticVehicle(495,-709.2696,2370.7991,128.2297,281.6120,116,115); // ג'יפ
AddStaticVehicle(495,-711.7840,2375.0217,128.2269,275.2806,114,108); // ג'יפ
AddStaticVehicle(510,-1278.8787,2508.7788,86.5666,185.6038,46,46); // אופניים
AddStaticVehicle(510,-1280.2455,2508.2603,86.5624,188.2635,2,2); // אופניים
AddStaticVehicle(510,-1281.7510,2507.9680,86.5552,193.5175,5,5); // אופניים
AddStaticVehicle(510,-1283.1780,2507.6555,86.5526,199.9852,28,28); // אופניים
AddStaticVehicle(510,-1284.7930,2507.2146,86.5460,193.6922,39,39); // אופניים
AddStaticVehicle(510,-1286.3333,2506.7705,86.5392,187.3799,6,6); // אופניים
AddStaticVehicle(510,-1287.8503,2506.6016,86.5752,184.4386,16,16); // אופניים
AddStaticVehicle(510,-1289.1478,2506.5212,86.6165,187.5038,43,43); // אופניים
AddStaticVehicle(510,-1290.8107,2506.0295,86.6137,194.3310,39,39); // אופניים
AddStaticVehicle(510,-1292.0967,2505.6265,86.6121,191.2176,46,46); // אופניים
AddStaticVehicle(504,1172.4121,1311.2450,10.6325,88.2558,12,9); // במפר
AddStaticVehicle(504,1172.3826,1314.5492,10.6271,88.2570,51,39); // במפר
AddStaticVehicle(504,1172.4974,1317.8837,10.6253,89.5201,57,48); // במפר
AddStaticVehicle(504,1172.4471,1321.1630,10.6288,88.3307,14,15); // במפר
AddStaticVehicle(504,1172.4772,1326.3312,10.6225,90.0877,34,34); // במפר
AddStaticVehicle(504,1172.4382,1329.8645,10.6231,89.9390,12,9); // במפר
AddStaticVehicle(504,1172.3837,1333.4641,10.6210,89.3725,51,39); // במפר
AddStaticVehicle(504,1172.4282,1336.9456,10.6212,89.1815,57,48); // במפר
AddStaticVehicle(504,1172.4277,1340.4268,10.6212,89.0293,14,15); // במפר
AddStaticVehicle(504,1128.5245,1358.1954,10.6302,179.0552,34,34); // במפר
AddStaticVehicle(504,1125.1235,1358.2866,10.6275,178.3015,57,57); // במפר
AddStaticVehicle(504,1121.7476,1358.2257,10.6304,180.1494,12,12); // במפר
AddStaticVehicle(504,1118.4156,1358.2137,10.6144,180.4722,34,34); // במפר
AddStaticVehicle(504,1114.3188,1358.2488,10.6301,179.8377,51,51); // במפר
AddStaticVehicle(504,1110.4290,1358.1095,10.6122,180.0699,57,54); // במפר
AddStaticVehicle(504,1105.7198,1358.1401,10.6266,178.6116,14,14); // במפר
AddStaticVehicle(504,1101.3671,1358.1077,10.6216,180.8936,34,34); // במפר
AddStaticVehicle(504,1110.4315,1358.1145,10.6121,180.0972,57,54); // במפר
AddStaticVehicle(504,1105.6887,1358.1575,10.6248,177.9001,14,14); // במפר
AddStaticVehicle(504,1101.3423,1358.1066,10.6210,180.3472,34,34); // במפר
AddStaticVehicle(444,-1481.0994,442.8621,30.4317,270.8216,32,66); // מיני במפר
AddStaticVehicle(444,-1481.2844,437.4891,30.4221,272.6236,32,32); // מיני במפר
AddStaticVehicle(444,-1481.2766,432.4998,30.4300,272.7952,32,42); // מיני במפר
AddStaticVehicle(444,-1481.3218,427.0977,30.4310,272.3075,32,53); // מיני במפר
AddStaticVehicle(444,-1482.1659,421.8241,30.4655,271.5333,32,66); // מיני במפר
AddStaticVehicle(444,-1480.8820,417.4699,30.4350,271.3774,32,14); // מיני במפר
AddStaticVehicle(444,-1481.1809,412.3246,30.4290,269.2368,32,32); // מיני במפר
AddStaticVehicle(444,-1481.1422,407.0460,30.4300,269.3300,32,36); // מיני במפר
AddStaticVehicle(444,-1481.1918,402.2993,30.4223,268.6995,32,42); // מיני במפר
AddStaticVehicle(444,-1481.0116,397.3784,30.4653,274.4709,32,53); // מיני במפר
AddStaticVehicle(444,-1481.2733,392.3241,30.4573,270.9019,32,66); // מיני במפר
AddStaticVehicle(444,-1480.9998,387.3225,30.4331,268.7897,32,14); // מיני במפר
AddStaticVehicle(594,-1481.7073,383.3366,29.2611,276.2301,0,0); // מיני במפר
AddStaticVehicle(594,-1482.4956,380.0310,29.2679,256.1125,0,0); // מיני במפר
AddStaticVehicle(594,-1482.7979,376.4861,29.2663,251.6264,0,0); // מיני במפר
AddStaticVehicle(504,-1347.0179,401.3253,29.8777,92.1449,14,1); // מיני במפר
AddStaticVehicle(504,-1346.8864,404.9405,29.8766,91.3095,45,29); // מיני במפר
AddStaticVehicle(504,-1346.9199,408.7420,29.8784,90.6674,12,9); // מיני במפר
AddStaticVehicle(504,-1347.0706,412.7053,29.8734,93.2058,65,9); // מיני במפר
AddStaticVehicle(504,-1347.2476,416.5652,29.8783,89.0711,26,1); // מיני במפר
AddStaticVehicle(504,-1347.3284,420.5565,29.8768,90.0284,51,39); // מיני במפר
AddStaticVehicle(504,-1347.4304,424.7496,29.8817,87.6350,57,38); // מיני במפר
AddStaticVehicle(504,-1347.3153,429.1129,29.8717,89.2992,34,9); // מיני במפר
AddStaticVehicle(504,-1347.4954,433.7766,29.8772,93.6525,45,29); // מיני במפר
AddStaticVehicle(504,-1347.5918,438.7144,29.8784,94.0322,57,38); // מיני במפר
AddStaticVehicle(504,-1348.1218,443.6112,29.8748,92.6941,34,9); // מיני במפר
AddStaticVehicle(471,-1346.8999,393.9760,29.5671,90.1974,103,111); // מיני במפר
AddStaticVehicle(471,-1346.0503,385.2872,29.5680,95.4759,120,114); // מיני במפר
AddStaticVehicle(471,-1345.8169,378.6928,29.5671,93.5242,120,112); // מיני במפר
AddStaticVehicle(471,-1345.8450,372.2163,29.5669,94.2625,74,91); // מיני במפר
AddStaticVehicle(571,-1345.6766,366.3398,29.3536,90.4289,36,2); // מיני במפר
AddStaticVehicle(571,-1345.7311,361.3853,29.3743,90.7163,51,53); // מיני במפר
AddStaticVehicle(571,-1483.3646,371.3430,29.3697,269.5525,51,53); // מיני במפר
AddStaticVehicle(571,-1483.4777,365.5701,29.3697,260.8534,91,2); // מיני במפר
AddStaticVehicle(417,1678.2369,1667.3950,24.0441,183.5281,0,0); //
AddStaticVehicle(425,1642.2886,1674.4164,11.3924,353.0688,43,0); //
AddStaticVehicle(447,1627.1252,1525.0441,10.8091,12.2007,75,2); //
AddStaticVehicle(469,1647.3129,1524.0527,10.8062,20.2116,1,3); //
AddStaticVehicle(476,1337.1592,1682.5105,11.5335,266.6118,7,6); //
AddStaticVehicle(487,1635.9288,1527.6368,10.9994,17.1250,26,3); //
AddStaticVehicle(488,1658.0641,1621.2836,10.9970,209.1150,2,26); //
AddStaticVehicle(497,1591.0220,1449.3615,11.0080,79.7505,0,1); //
AddStaticVehicle(511,1281.1759,1325.0189,12.1976,270.6784,4,90); //
AddStaticVehicle(511,1278.7404,1362.9895,12.1928,271.4657,7,68); //
AddStaticVehicle(512,1280.0597,1387.9142,11.0990,268.0782,15,123); //
AddStaticVehicle(513,1280.9939,1400.7063,11.3721,272.9695,21,36); //
AddStaticVehicle(512,1279.2971,1412.5190,11.1021,267.4531,32,112); //
AddStaticVehicle(513,1281.4164,1424.3425,11.3720,261.5805,30,34); //
AddStaticVehicle(519,1331.6392,1621.7921,11.7423,270.6685,1,1); //
AddStaticVehicle(519,1326.7795,1569.7802,11.7390,263.8837,1,1); //
AddStaticVehicle(520,1597.0271,1473.4186,11.5432,77.9637,0,0); //
AddStaticVehicle(520,1595.9270,1424.0128,11.5499,109.5727,0,0); //
AddStaticVehicle(548,1551.4717,1687.7694,12.5065,98.3612,1,1); //
AddStaticVehicle(553,1395.1008,1830.0638,12.1563,191.8431,55,23); //
AddStaticVehicle(563,1608.9333,1673.3563,24.7208,186.1446,1,6); //
AddStaticVehicle(592,1582.5032,1191.4025,12.0091,4.4693,1,1); //
AddStaticVehicle(593,1285.9342,1301.3362,11.2792,269.7401,60,1); //
AddStaticVehicle(593,1291.5850,1342.2651,11.2806,267.4286,68,8); //
AddStaticVehicle(407,1306.3589,1277.9294,11.0558,359.8099,3,1); //
AddStaticVehicle(407,1328.6958,1278.0934,11.0560,0.9976,3,1); //
AddStaticVehicle(485,1309.4397,1278.7567,10.4728,0.4705,1,74); //
AddStaticVehicle(572,1312.4382,1278.9420,10.4002,357.8155,116,1); //
AddStaticVehicle(573,1315.9066,1277.8691,11.4207,358.6320,115,43); //
AddStaticVehicle(574,1318.9880,1278.2222,10.5455,359.6098,26,26); //
AddStaticVehicle(583,1322.2648,1278.4246,10.3604,0.5267,1,1); //
AddStaticVehicle(485,1325.4039,1278.2579,10.4808,1.5272,1,75); //
AddStaticVehicle(522,1713.4042,1591.6801,9.8505,77.9672,36,105); //
AddStaticVehicle(522,1712.2263,1586.7765,10.0061,78.0560,8,82); //
AddStaticVehicle(522,1711.5048,1581.4349,10.2234,86.2216,6,25); //
AddStaticVehicle(522,1710.6271,1576.2217,10.3239,86.8257,36,105); //
AddStaticVehicle(522,1710.3635,1571.2633,10.3584,90.5206,39,106); //
AddStaticVehicle(463,1712.9412,1589.2332,9.9242,80.8557,36,36); //
AddStaticVehicle(463,1712.3519,1584.2904,10.1079,85.2494,19,19); //
AddStaticVehicle(463,1712.1394,1578.6759,10.2401,89.3400,22,22); //
AddStaticVehicle(463,1712.0110,1573.7028,10.3274,88.4852,84,84); //




	
	//Monday 13th Additions ~ Jax
	AddStaticVehicle(415,2266.7336,648.4756,11.0053,177.8517,0,1); //
	AddStaticVehicle(461,2404.6636,647.9255,10.7919,183.7688,53,1); //
	AddStaticVehicle(506,2628.1047,746.8704,10.5246,352.7574,3,3); //
	AddStaticVehicle(549,2817.6445,928.3469,10.4470,359.5235,72,39); //
	// --- uncommented
	AddStaticVehicle(562,1919.8829,947.1886,10.4715,359.4453,11,1); //
	AddStaticVehicle(562,1881.6346,1006.7653,10.4783,86.9967,11,1); //
	AddStaticVehicle(562,2038.1044,1006.4022,10.4040,179.2641,11,1); //
	AddStaticVehicle(562,2038.1614,1014.8566,10.4057,179.8665,11,1); //
	AddStaticVehicle(562,2038.0966,1026.7987,10.4040,180.6107,11,1); //
	// --- uncommented end

	//Uber haxed
	AddStaticVehicle(422,9.1065,1165.5066,19.5855,2.1281,101,25); //
	AddStaticVehicle(463,19.8059,1163.7103,19.1504,346.3326,11,11); //
	AddStaticVehicle(463,12.5740,1232.2848,18.8822,121.8670,22,22); //
	//AddStaticVehicle(434,-110.8473,1133.7113,19.7091,359.7000,2,2); //hotknife
	AddStaticVehicle(586,69.4633,1217.0189,18.3304,158.9345,10,1); //
	AddStaticVehicle(586,-199.4185,1223.0405,19.2624,176.7001,25,1); //
	//AddStaticVehicle(605,-340.2598,1177.4846,19.5565,182.6176,43,8); // SMASHED UP CAR
	AddStaticVehicle(476,325.4121,2538.5999,17.5184,181.2964,71,77); //
	AddStaticVehicle(476,291.0975,2540.0410,17.5276,182.7206,7,6); //
	AddStaticVehicle(576,384.2365,2602.1763,16.0926,192.4858,72,1); //
	AddStaticVehicle(586,423.8012,2541.6870,15.9708,338.2426,10,1); //
	AddStaticVehicle(586,-244.0047,2724.5439,62.2077,51.5825,10,1); //
	AddStaticVehicle(586,-311.1414,2659.4329,62.4513,310.9601,27,1); //

	//uber haxed x 50
	//AddStaticVehicle(406,547.4633,843.0204,-39.8406,285.2948,1,1); // DUMPER
	//AddStaticVehicle(406,625.1979,828.9873,-41.4497,71.3360,1,1); // DUMPER
	//AddStaticVehicle(486,680.7997,919.0510,-40.4735,105.9145,1,1); // DOZER
	//AddStaticVehicle(486,674.3994,927.7518,-40.6087,128.6116,1,1); // DOZER
	AddStaticVehicle(543,596.8064,866.2578,-43.2617,186.8359,67,8); //
	AddStaticVehicle(543,835.0838,836.8370,11.8739,14.8920,8,90); //
	AddStaticVehicle(549,843.1893,838.8093,12.5177,18.2348,79,39); //
	//AddStaticVehicle(605,319.3803,740.2404,6.7814,271.2593,8,90); // SMASHED UP CAR
	AddStaticVehicle(400,-235.9767,1045.8623,19.8158,180.0806,75,1); //
	AddStaticVehicle(599,-211.5940,998.9857,19.8437,265.4935,0,1); //
	AddStaticVehicle(422,-304.0620,1024.1111,19.5714,94.1812,96,25); //
	AddStaticVehicle(588,-290.2229,1317.0276,54.1871,81.7529,1,1); //
	//AddStaticVehicle(424,-330.2399,1514.3022,75.1388,179.1514,2,2); //BF INJECT
	AddStaticVehicle(451,-290.3145,1567.1534,75.0654,133.1694,61,61); //
	AddStaticVehicle(470,280.4914,1945.6143,17.6317,310.3278,43,0); //
	AddStaticVehicle(470,272.2862,1949.4713,17.6367,285.9714,43,0); //
	AddStaticVehicle(470,271.6122,1961.2386,17.6373,251.9081,43,0); //
	AddStaticVehicle(470,279.8705,1966.2362,17.6436,228.4709,43,0); //
	//AddStaticVehicle(548,292.2317,1923.6440,19.2898,235.3379,1,1); // CARGOBOB
	AddStaticVehicle(433,277.6437,1985.7559,18.0772,270.4079,43,0); //
	AddStaticVehicle(433,277.4477,1994.8329,18.0773,267.7378,43,0); //
	//AddStaticVehicle(432,275.9634,2024.3629,17.6516,270.6823,43,0); // Tank (can cause scary shit to go down)
	AddStaticVehicle(568,-441.3438,2215.7026,42.2489,191.7953,41,29); //
	AddStaticVehicle(568,-422.2956,2225.2612,42.2465,0.0616,41,29); //
	AddStaticVehicle(568,-371.7973,2234.5527,42.3497,285.9481,41,29); //
	AddStaticVehicle(568,-360.1159,2203.4272,42.3039,113.6446,41,29); //
	AddStaticVehicle(468,-660.7385,2315.2642,138.3866,358.7643,6,6); //
	AddStaticVehicle(460,-1029.2648,2237.2217,42.2679,260.5732,1,3); //

	//Uber haxed x 100

    // --- uncommented
	AddStaticVehicle(419,95.0568,1056.5530,13.4068,192.1461,13,76); //
	AddStaticVehicle(429,114.7416,1048.3517,13.2890,174.9752,1,2); //
	//AddStaticVehicle(466,124.2480,1075.1835,13.3512,174.5334,78,76); // exceeds model limit
	AddStaticVehicle(411,-290.0065,1759.4958,42.4154,89.7571,116,1); //
	// --- uncommented end
	AddStaticVehicle(522,-302.5649,1777.7349,42.2514,238.5039,6,25); //
	AddStaticVehicle(522,-302.9650,1776.1152,42.2588,239.9874,8,82); //
	AddStaticVehicle(533,-301.0404,1750.8517,42.3966,268.7585,75,1); //
	AddStaticVehicle(535,-866.1774,1557.2700,23.8319,269.3263,31,1); //
	AddStaticVehicle(550,-799.3062,1518.1556,26.7488,88.5295,53,53); //
	AddStaticVehicle(521,-749.9730,1589.8435,26.5311,125.6508,92,3); //
	AddStaticVehicle(522,-867.8612,1544.5282,22.5419,296.0923,3,3); //
	AddStaticVehicle(554,-904.2978,1553.8269,25.9229,266.6985,34,30); //
	AddStaticVehicle(521,-944.2642,1424.1603,29.6783,148.5582,92,3); //
	// Exceeds model limit, cars need model adjustments
	// --- uncommented
	AddStaticVehicle(429,-237.7157,2594.8804,62.3828,178.6802,1,2); //
	//AddStaticVehicle(431,-160.5815,2693.7185,62.2031,89.4133,47,74); //
	AddStaticVehicle(463,-196.3012,2774.4395,61.4775,303.8402,22,22); //
	//AddStaticVehicle(483,-204.1827,2608.7368,62.6956,179.9914,1,5); //
	//AddStaticVehicle(490,-295.4756,2674.9141,62.7434,359.3378,0,0); //
	//AddStaticVehicle(500,-301.5293,2687.6013,62.7723,87.9509,28,119); //
	//AddStaticVehicle(500,-301.6699,2680.3293,62.7393,89.7925,13,119); //
	AddStaticVehicle(519,-1341.1079,-254.3787,15.0701,321.6338,1,1); //
	AddStaticVehicle(519,-1371.1775,-232.3967,15.0676,315.6091,1,1); //
	//AddStaticVehicle(552,-1396.2028,-196.8298,13.8434,286.2720,56,56); //
	//AddStaticVehicle(552,-1312.4509,-284.4692,13.8417,354.3546,56,56); //
	//AddStaticVehicle(552,-1393.5995,-521.0770,13.8441,187.1324,56,56); //
	//AddStaticVehicle(513,-1355.6632,-488.9562,14.7157,191.2547,48,18); //
	//AddStaticVehicle(513,-1374.4580,-499.1462,14.7482,220.4057,54,34); //
	//AddStaticVehicle(553,-1197.8773,-489.6715,15.4841,0.4029,91,87); //
	//AddStaticVehicle(553,1852.9989,-2385.4009,14.8827,200.0707,102,119); //
	//AddStaticVehicle(583,1879.9594,-2349.1919,13.0875,11.0992,1,1); //
	//AddStaticVehicle(583,1620.9697,-2431.0752,13.0951,126.3341,1,1); //
	//AddStaticVehicle(583,1545.1564,-2409.2114,13.0953,23.5581,1,1); //
	//AddStaticVehicle(583,1656.3702,-2651.7913,13.0874,352.7619,1,1); //
	AddStaticVehicle(519,1642.9850,-2425.2063,14.4744,159.8745,1,1); //
	AddStaticVehicle(519,1734.1311,-2426.7563,14.4734,172.2036,1,1); //
	// --- uncommented end
	
	AddStaticVehicle(415,-680.9882,955.4495,11.9032,84.2754,36,1); //
	AddStaticVehicle(460,-816.3951,2222.7375,43.0045,268.1861,1,3); //
	AddStaticVehicle(460,-94.6885,455.4018,1.5719,250.5473,1,3); //
	AddStaticVehicle(460,1624.5901,565.8568,1.7817,200.5292,1,3); //
	AddStaticVehicle(460,1639.3567,572.2720,1.5311,206.6160,1,3); //
	AddStaticVehicle(460,2293.4219,517.5514,1.7537,270.7889,1,3); //
	AddStaticVehicle(460,2354.4690,518.5284,1.7450,270.2214,1,3); //
	AddStaticVehicle(460,772.4293,2912.5579,1.0753,69.6706,1,3); //

	// 22/4 UPDATE
	AddStaticVehicle(560,2133.0769,1019.2366,10.5259,90.5265,9,39); //
	AddStaticVehicle(560,2142.4023,1408.5675,10.5258,0.3660,17,1); //
	AddStaticVehicle(560,2196.3340,1856.8469,10.5257,179.8070,21,1); //
	AddStaticVehicle(560,2103.4146,2069.1514,10.5249,270.1451,33,0); //
	AddStaticVehicle(560,2361.8042,2210.9951,10.3848,178.7366,37,0); //
	AddStaticVehicle(560,-1993.2465,241.5329,34.8774,310.0117,41,29); //
	AddStaticVehicle(559,-1989.3235,270.1447,34.8321,88.6822,58,8); //
	AddStaticVehicle(559,-1946.2416,273.2482,35.1302,126.4200,60,1); //
	AddStaticVehicle(558,-1956.8257,271.4941,35.0984,71.7499,24,1); //
	AddStaticVehicle(562,-1952.8894,258.8604,40.7082,51.7172,17,1); //
	AddStaticVehicle(411,-1949.8689,266.5759,40.7776,216.4882,112,1); //
	AddStaticVehicle(429,-1988.0347,305.4242,34.8553,87.0725,2,1); //
	AddStaticVehicle(559,-1657.6660,1213.6195,6.9062,282.6953,13,8); //
	AddStaticVehicle(560,-1658.3722,1213.2236,13.3806,37.9052,52,39); //
	AddStaticVehicle(558,-1660.8994,1210.7589,20.7875,317.6098,36,1); //
	AddStaticVehicle(550,-1645.2401,1303.9883,6.8482,133.6013,7,7); //
	AddStaticVehicle(460,-1333.1960,903.7660,1.5568,0.5095,46,32); //
	
	// 25/4 UPDATE
	AddStaticVehicle(411,113.8611,1068.6182,13.3395,177.1330,116,1); //
	AddStaticVehicle(429,159.5199,1185.1160,14.7324,85.5769,1,2); //
	AddStaticVehicle(411,612.4678,1694.4126,6.7192,302.5539,75,1); //
	AddStaticVehicle(522,661.7609,1720.9894,6.5641,19.1231,6,25); //
	AddStaticVehicle(522,660.0554,1719.1187,6.5642,12.7699,8,82); //
	AddStaticVehicle(567,711.4207,1947.5208,5.4056,179.3810,90,96); //
	AddStaticVehicle(567,1031.8435,1920.3726,11.3369,89.4978,97,96); //
	AddStaticVehicle(567,1112.3754,1747.8737,10.6923,270.9278,102,114); //
	AddStaticVehicle(567,1641.6802,1299.2113,10.6869,271.4891,97,96); //
	AddStaticVehicle(567,2135.8757,1408.4512,10.6867,180.4562,90,96); //
	AddStaticVehicle(567,2262.2639,1469.2202,14.9177,91.1919,99,81); //
	AddStaticVehicle(567,2461.7380,1345.5385,10.6975,0.9317,114,1); //
	AddStaticVehicle(567,2804.4365,1332.5348,10.6283,271.7682,88,64); //
	AddStaticVehicle(560,2805.1685,1361.4004,10.4548,270.2340,17,1); //
	AddStaticVehicle(506,2853.5378,1361.4677,10.5149,269.6648,7,7); //
	AddStaticVehicle(567,2633.9832,2205.7061,10.6868,180.0076,93,64); //
	AddStaticVehicle(567,2119.9751,2049.3127,10.5423,180.1963,93,64); //
	AddStaticVehicle(567,2785.0261,-1835.0374,9.6874,226.9852,93,64); //
	AddStaticVehicle(567,2787.8975,-1876.2583,9.6966,0.5804,99,81); //
	AddStaticVehicle(411,2771.2993,-1841.5620,9.4870,20.7678,116,1); //
	AddStaticVehicle(420,1713.9319,1467.8354,10.5219,342.8006,6,1); // taxi

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






