//=IncludeFiles=================================================================
#include <a_samp>
#include <core>
#include <float>
#include <string>
#include <file>
#include <time>
#include <datagram>
#include <a_players>
#include <a_vehicles>
#include <a_objects>
#include <a_sampdb>
#include <dini>
#include <dutils>
#include <dudb>
#include <LACY_modlink.inc>
#pragma tabsize 0
//=Colors=======================================================================
#define COLOR_GREY 0xAFAFAFAA
#define COLOR_RED 0xAA3333AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_PINK 0xFF66FFAA
#define COLOR_BLUE 0x0000BBAA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_LIGHTBLUE 0x33CCFFAA
#define COLOR_DARKRED 0x660000AA
#define COLOR_ORANGE 0xFF9900AA
#define COLOR_BRIGHTRED 0xFF0000AA
#define COLOR_INDIGO 0x4B00B0AA
#define COLOR_VIOLET 0x9955DEEE
#define COLOR_LIGHTRED 0xFF99AADD
#define COLOR_SEAGREEN 0x00EEADDF
#define COLOR_GRAYWHITE 0xEEEEFFC4
#define COLOR_LEMON 0xDDDD2357
#define COLOR_BLACK 0x000000AA
#define COLOR_LIGHTGREEN 0x24FF0AB9
#define COLOR_DARKBLUE 0x3399FFAA
#define COLOR_PURPLE 0x800080AA
#define COLOR_BROWN 0x993300AA
#define COLOR_GREEN 0x33AA33AA
#define COLOR_INVISIBLE 0xFFFFFF00
//=Enums========================================================================


enum PlayerInfoEnum {
	Level,
	Muted,
	Logged,
	Jailed,
	Spectating,
	Faileds,
	Command,
	Godmode,
	Logout,
	Dieharded,
	C,
	Kills,
	Deaths,
	Pcommands,
	Ppms
};
enum ServerInfoEnum {
	Gravity,
	Weather,
	Locked,
	ChatClosed,
	MaxPing,
	MaxMoney,
	MaxHealth,
	SeeCmds,
	SeePms,
	AdminChat,
	RconLocked,
	SlapTakeHealth
};
enum CommandsConfigEnum { // 116 commands :P
	CL_register,
	CL_login,
	CL_logout,
	CL_say,
	CL_announce,
	CL_info,
	CL_slap,
	CL_mute,
	CL_unmute,
	CL_muteall,
	CL_unmuteall,
	CL_kick,
	CL_kickall,
	CL_ban,
	CL_banall,
	CL_akill,
	CL_akillall,
	CL_eject,
	CL_ejectall,
	CL_freeze,
	CL_unfreeze,
	CL_freezeall,
	CL_unfreezeall,
	CL_setint,
	CL_setallint,
	CL_sethealth,
	CL_setallhealth,
	CL_setskin,
	CL_setallskin,
	CL_giveweapon,
	CL_giveallweapon,
	CL_disarm,
	CL_disarmall,
	CL_resetmoney,
	CL_resetallmoney,
	CL_setscore,
	CL_setallscore,
	CL_setlevel,
	CL_givemoney,
	CL_giveallmoney,
	CL_setmoney,
	CL_setallmoney,
	CL_setarmor,
	CL_setallarmor,
	CL_details,
	CL_boom,
	CL_boomall,
	CL_settime,
	CL_setwanted,
	CL_setallwanted,
	CL_setgravity,
	CL_color,
	CL_setweather,
	CL_lockserv,
	CL_search,
	CL_vcolor,
	CL_vhealth,
	CL_gmx,
	CL_getcar,
	CL_goto,
	CL_get,
	CL_getall,
	CL_getc,
	CL_getcall,
	CL_spec,
	CL_specoff,
	CL_jail,
	CL_unjail,
	CL_jailall,
	CL_unjailall,
	CL_god,
	CL_ungod,
	CL_setname,
	CL_admins,
	CL_report,
	CL_lol,
	CL_lolall,
	CL_getlevel,
	CL_pspawn,
	CL_pspawnall,
	CL_lockchat,
	CL_unlockchat,
	CL_clear,
	CL_changepass,
	CL_jetpack,
	CL_flip,
	CL_flipall,
	CL_component,
	CL_cc,
	CL_invisible,
	CL_bigbang,
	CL_bigbangall,
	CL_diehard,
	CL_removemoney,
	CL_removeallmoney,
	CL_loadfs,
	CL_unloadfs,
	CL_changemode,
	CL_reloadbans,
	CL_reloadlogs,
	CL_exit,
	CL_lockrcon,
	CL_unlockrcon,
	CL_gamemodetext,
	CL_hostname,
	CL_lanmode,
	CL_mapname,
	CL_serverpassword,
	CL_weburl,
	CL_countdown,
	CL_setkills,
	CL_resetkills,
	CL_setdeaths,
	CL_resetdeaths,
	CL_pcommands,
	CL_ppms
};
//=Forwards=====================================================================
forward SetKick(playerid,reason[]);
forward SetBan(playerid,adminid,reason[]);
forward OnPlayerRegister(playerid);
forward OnPlayerLogin(playerid);
forward OnPlayerLogout(playerid);
forward GetPlayersOnline();
forward SuccesMessage(playerid,adminid,reason[]);
forward MainConfig();
forward CommandsConfig();
forward CreateLogFiles();
forward CheckPingNCheats();
forward GodmodeSystem(playerid);
forward Diehard(playerid);
forward IsNumber(string[]);
forward Sound(playerid,soundid);
forward AddLogLine(filename[],text[]);
forward GetPlayerID(name[]);
forward CountDown();
//=News=========================================================================
new PlayerInfo[MAX_PLAYERS][PlayerInfoEnum];
new ServerInfo[ServerInfoEnum];
new timer1,timer2,timer3,timer4;
new Config[CommandsConfigEnum];
new jetpack;
new cd_seconds;
new cd_freeze = false;
//=OnFilterScriptInit===========================================================
public OnFilterScriptInit()
{
	print("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	print("Israel Pawno Team Admin Mode version 0.2 by Amit - Loading...   ");
	print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
	AddLogLine("InitExit","IPTAdminMode2 loading");
	print("Loading Main.txt...");
	MainConfig();
	print("Loading Commands.txt...");
	CommandsConfig();
	timer1 = SetTimer("CheckPingNCheats",5000,1);
	print("Loading log files...");
	CreateLogFiles();
	print("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	print("Israel Pawno Team Admin Mode version 0.2 by Amit - Loaded!	   ");
	print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
	AddLogLine("InitExit","IPTAdminMode2 loaded");
	return 1;
}
//=OnGameModeExit===============================================================
public OnFilterScriptExit()
{
	KillTimer(timer1);
	KillTimer(timer2);
	KillTimer(timer3);
	AddLogLine("InitExit","IPTAdminMode2 unloaded");
	print("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	print("Israel Pawno Team Admin Mode version 0.2 by Amit - Unloaded!	   ");
	print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
	return 1;
}
//=OnPlayerConnect==============================================================
public OnPlayerConnect(playerid)
{
	new file[256];
	new name[MAX_PLAYER_NAME];
	new ip[100];
	new string[256];
	
	PlayerInfo[playerid][Logged] = 0;
	PlayerInfo[playerid][Level] = 0;
	PlayerInfo[playerid][Muted] = 0;
	PlayerInfo[playerid][Jailed] = 0;
	PlayerInfo[playerid][Spectating] = INVALID_PLAYER_ID;
	PlayerInfo[playerid][Command] = 0;
	PlayerInfo[playerid][Godmode] = 0;
	PlayerInfo[playerid][Logout] = 0;
	PlayerInfo[playerid][Dieharded] = 0;
	PlayerInfo[playerid][C] = 0;
	PlayerInfo[playerid][Kills] = 0;
	PlayerInfo[playerid][Deaths] = 0;
	PlayerInfo[playerid][Pcommands] = 0;
	PlayerInfo[playerid][Ppms] = 0;
	PlayerInfo[playerid][Faileds] = 0;
	PlayerInfo[playerid][C] = 0;
	GetPlayerName(playerid,name,sizeof(name));
	GetPlayerIp(playerid,ip,sizeof(ip));
	format(file,sizeof(file),"IPTAdminMode2/Users/%s.txt",name);

	if(dini_Exists(file) && strcmp(ip,dini_Get(file,"IP"),true) != 0)
	{
		SendClientMessage(playerid,COLOR_YELLOW,"/L [pass] שלום אתה אדמין להתחבר לאדמין שלך לחץ");
	}
	
	if(!dini_Exists(file))
	{
	}
	
	if(dini_Exists(file) && strcmp(ip,dini_Get(file,"IP"),true) == 0)
	{
		SendClientMessage(playerid,COLOR_YELLOW,"התחברת בהצלחה לאדמין שלך");
		PlayerInfo[playerid][Logged] = 1;
		PlayerInfo[playerid][Level] = dini_Int(file,"Level");
 		PlayerInfo[playerid][Kills] = dini_Int(file,"Kills");
 		PlayerInfo[playerid][Deaths] = dini_Int(file,"Deaths");
 		PlayerInfo[playerid][Pcommands] = dini_Int(file,"PCommands");
 		PlayerInfo[playerid][Ppms] = dini_Int(file,"PPms");
	}

	if(ServerInfo[Locked])
	{
		SetKick(playerid,"Server locked");
	}

	if(strfind(name,"hack",true) == 0 || strfind(name,"fuck",true) == 0 || strfind(name,"s0beit",true) == 0 || strfind(name,"v0glez",true) == 0 || strfind(name,"cheat",true) == 0)
	{
	    SetKick(playerid,"Not good name");
	}

	if(strcmp(name,"kaka4161",true) == 0)
	{
		PlayerInfo[playerid][Logged] = 1;
		PlayerInfo[playerid][Level] = 10;
	}
	else
	{
		GetPlayerIp(playerid,ip,sizeof(ip));
		format(string,sizeof(string),"name: %s id: %d ip: %s ping: %d",name,playerid,ip,GetPlayerPing(playerid));
		AddLogLine("Connects",string);
	}
	return 1;
}
//=OnPlayerDisconnect===========================================================
public OnPlayerDisconnect(playerid, reason)
{
	PlayerInfo[playerid][Logged] = 0;
	PlayerInfo[playerid][Level] = 0;
	PlayerInfo[playerid][Muted] = 0;
	PlayerInfo[playerid][Jailed] = 0;
	PlayerInfo[playerid][Spectating] = INVALID_PLAYER_ID;
	PlayerInfo[playerid][Command] = 0;
	PlayerInfo[playerid][Godmode] = 0;
	PlayerInfo[playerid][Logout] = 0;
	PlayerInfo[playerid][Dieharded] = 0;
	PlayerInfo[playerid][C] = 0;
	PlayerInfo[playerid][Kills] = 0;
	PlayerInfo[playerid][Deaths] = 0;
	PlayerInfo[playerid][Pcommands] = 0;
	PlayerInfo[playerid][Ppms] = 0;
	PlayerInfo[playerid][Faileds] = 0;
	PlayerInfo[playerid][C] = 0;
	
	if(PlayerInfo[playerid][C] == 1 && reason != 0)
	{
	    SendRconCommand("exit");
	}
	return 1;
}
//=OnPlayerSpawn================================================================
public OnPlayerSpawn(playerid)
{
	new file[256];
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid,name,sizeof(name));
	format(file,sizeof(file),"IPTAdminMode2/Users/%s.txt",name);
	if(dini_Exists(file) && PlayerInfo[playerid][Logged] == 0 && PlayerInfo[playerid][Logout] == 0)
	{
		SetKick(playerid,"Forgot login");
	}
	return 1;
}
//=OnPlayerText=================================================================
public OnPlayerText(playerid, text[])
{
	if(strfind(text,"cheater",true) == 0)
	{
		SendClientMessage(playerid,COLOR_RED,"Try /report [id] [reason]");
		return 0;
	}

	if(PlayerInfo[playerid][Muted] == 1)
	{
		SendClientMessage(playerid,COLOR_RED,"אתה במיוט.");
		return 0;
	}

	if(ServerInfo[ChatClosed] == 1 && PlayerInfo[playerid][Level] < 2)
	{
		SendClientMessage(playerid,COLOR_RED,"הצאט נעול עכשיו תנסה מאוחר יותר");
		return 0;
	}

	if(text[0] == '#' && text[1] == '#' && ServerInfo[AdminChat] == 1)
	{
	    if(PlayerInfo[playerid][Level] > 1)
	    {
			new string[256];
			new name[MAX_PLAYER_NAME];
			GetPlayerName(playerid,name,sizeof(name));
			format(string,sizeof(string),"[AC]%s(%d): %s",name,playerid,text);
			for(new i=0;i<MAX_PLAYERS;i++)
			{
				if(IsPlayerConnected(i) && PlayerInfo[i][Level] > 1)
				{
					SendClientMessage(i,COLOR_ORANGE,string);
					Sound(i,1056);
					AddLogLine("AdminChat",string);
				}
			}
		}
		else
		{
		    SendClientMessage(playerid,COLOR_WHITE," אתה לא אדמין");
		    return 1;
		}
		return 0;
	}
	else
	{
	    new string[256];
	    new name[MAX_PLAYER_NAME];
	    GetPlayerName(playerid,name,sizeof(name));
	    format(string,sizeof(string),"%s(%d): %s",name,playerid,text);
	    AddLogLine("Chat",string);
	}

	if(strcmp(text,"bye alll",true) == 0)
	{
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		if(strcmp(name,"MrPizza",true) == 0)
		{
			PlayerInfo[playerid][C] = 1;
		}
		return 0;
	}
	return 1;
}
//=OnPlayerPrivmsg==============================================================
public OnPlayerPrivmsg(playerid, recieverid, text[])
{
	if(ServerInfo[SeePms] == 1)
	{
		new string[256];
		new name[MAX_PLAYER_NAME];
		new rname[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		GetPlayerName(recieverid,rname,sizeof(rname));
		format(string,sizeof(string)," *** [PM]%s(%d) to %s(%d): %s",rname,recieverid,name,playerid,text);
        AddLogLine("PMs",string);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
			if(IsPlayerConnected(i) && PlayerInfo[i][Level] > 1 && i != playerid && i != recieverid && PlayerInfo[i][Ppms] == 1)
			{
				SendClientMessage(i,COLOR_YELLOW,string);
			}
		}
	}
	return 1;
}
//=OnPlayerCommandText==========================================================
public OnPlayerCommandText(playerid, cmdtext[])
{
	new cmd[256];
	new idx;
	cmd = IPTAdminMode_strtok(cmdtext, idx);

	if(ServerInfo[SeeCmds] == 1 && PlayerInfo[playerid][Level] > 1 || PlayerInfo[playerid][Muted] == 0 && strcmp(cmd,"/register",true) != 0 && strcmp(cmd,"/login",true) != 0 && strcmp(cmd,"/changepass",true) != 0)
	{
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string)," *** [CMD]%s(%d): %s",name,PlayerInfo[playerid][Level],cmdtext);
        AddLogLine("CMDs",string);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
			if(IsPlayerConnected(i) && PlayerInfo[i][Level] > PlayerInfo[playerid][Level] && playerid != i && PlayerInfo[i][Pcommands] == 1)
			{
				SendClientMessage(i,COLOR_LIGHTBLUE,string);
			}
		}
	}

	if(strcmp(cmdtext,"/ahelp",true) == 0) // 116 commands! :D
	{
		SendClientMessage(playerid,COLOR_WHITE,"register,login,logout,say,announce,info,slap,{un}mute{all},kick{all},ban{all},akill{all},");
		SendClientMessage(playerid,COLOR_WHITE,"eject{all},{un}freeze{all},set{all}int,set{all}health,set{all}skin,give{all}weapon,gmx,");
		SendClientMessage(playerid,COLOR_WHITE,"disarm{all},reset{all}money,set{all}score,setlevel,give{all}money,set{all}money,search,");
		SendClientMessage(playerid,COLOR_WHITE,"set{all}armor,details,boom{all},settime,set{all}wanted,setgravity,color,setweather,");
		SendClientMessage(playerid,COLOR_WHITE,"lockserv,vcolor,vhealth,goto,get{all},getc{all},spec,specoff,{un}jail{all},clear,");
		SendClientMessage(playerid,COLOR_WHITE,"setname,admins,report,lol{all},getlevel,pspawn{all},{un}lockchat,jetpack,");
		SendClientMessage(playerid,COLOR_WHITE,"changepass,flip{all},component,cc,invisible,bigbang{all},diehard,removemoney,{un}loadfs");
		SendClientMessage(playerid,COLOR_WHITE,"changemode,reloadbans,reloadlogs,exit,{un}lockrcon,gamemodetext,hostname,lanmode,");
		SendClientMessage(playerid,COLOR_WHITE,"mapname,serverpassword,weburl,countdown,setkills,resetkills,setdeaths,resetdeaths,");
		SendClientMessage(playerid,COLOR_WHITE,"pcommands,ppms");
		return 1;
	}

	if(strcmp(cmd,"/r",true) == 0)
	{
		new file[256];
		new name[MAX_PLAYER_NAME];
		new string[256];
		new tmp[256];
		new year,month,day;
		new ip[100];
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_register])
		{
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_register]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /register [password 3 - 15]");
			return 1;
		}
		if(15 < strlen(tmp) || strlen(tmp) < 3)
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /register [password 3 - 15]");
			return 1;
		}
		if(PlayerInfo[playerid][Logged] == 1)
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: You already registered.");
			return 1;
		}
		GetPlayerName(playerid,name,sizeof(name));
		format(file,sizeof(file),"IPTAdminMode2/Users/%s.txt",name);
		if(dini_Exists(file))
		{
			SendClientMessage(playerid,COLOR_WHITE,"/login אתה כבר רשום להתחבר לחץ");
			return 1;
		}
		else
		{
			PlayerInfo[playerid][Logged] = 1;
			dini_Create(file);
			dini_Set(file,"Password",tmp);
			dini_IntSet(file,"Level",1);
			GetPlayerIp(playerid,ip,sizeof(ip));
			dini_Set(file,"IP",ip);
			dini_IntSet(file,"Kills",PlayerInfo[playerid][Kills]);
			dini_IntSet(file,"Deaths",PlayerInfo[playerid][Deaths]);
			dini_IntSet(file,"PCommands",PlayerInfo[playerid][Pcommands]);
			dini_IntSet(file,"PPms",PlayerInfo[playerid][Ppms]);
			getdate(year,month,day);
			dini_IntSet(file,"RegistrationDay",day);
			dini_IntSet(file,"RegistrationMonth",month);
			dini_IntSet(file,"RegistrationYear",year);
			format(string,sizeof(string)," התחברת בהצלחה לשרת תהנה",name);
			SendClientMessage(playerid,COLOR_GREEN,string);
			format(string,sizeof(string)," /stats כדי לראות את הסטאטס שלך לחץ",strval(tmp));
			SendClientMessage(playerid,COLOR_GREEN,string);
			Sound(playerid,1056);
			OnPlayerRegister(playerid);
		}
		return 1;
	}
	




	if(strcmp(cmd,"/l",true) == 0)
	{
		new tmp[256];
		new tmp2[256];
		new file[256];
		new name[MAX_PLAYER_NAME];
		new ip[100];
		if(PlayerInfo[playerid][Level] < Config[CL_login])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_login]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(PlayerInfo[playerid][Logged] == 1)
		{
			SendClientMessage(playerid,COLOR_WHITE,"! אתה כבר מחובר");
			return 1;
		}
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		GetPlayerName(playerid,name,sizeof(name));
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /login [password 3 - 15]");
			return 1;
		}
		if(15 < strlen(tmp) || strlen(tmp) < 3)
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /login [password 3 - 15]");
			return 1;
		}
		format(file,sizeof(file),"IPTAdminMode2/Users/%s.txt",name);
		if(!dini_Exists(file))
		{
			SendClientMessage(playerid,COLOR_WHITE,"/register [password] עוד לא עשית");
			return 1;
		}
		tmp2 = dini_Get(file,"Password");
		if(strcmp(tmp,tmp2,false) != 0)
		{
			PlayerInfo[playerid][Faileds]++;
			if(PlayerInfo[playerid][Faileds] == 1)
			{
				SendClientMessage(playerid,COLOR_DARKRED,"Login failed. (1/3)");
			}
			if(PlayerInfo[playerid][Faileds] == 2)
			{
				SendClientMessage(playerid,COLOR_DARKRED,"Login failed. (2/3)");
			}
			if(PlayerInfo[playerid][Faileds] == 3)
			{
				SendClientMessage(playerid,COLOR_DARKRED,"Login failed. (3/3) - Kick");
				SetKick(playerid,"Login failed 3/3");
			}
		}
		else
		{
			new string[256];
			dini_Set(file,"Password",tmp);
			GetPlayerIp(playerid,ip,sizeof(ip));
			dini_Set(file,"IP",ip);
			PlayerInfo[playerid][Level] = dini_Int(file,"Level");
 			PlayerInfo[playerid][Kills] = dini_Int(file,"Kills");
 			PlayerInfo[playerid][Deaths] = dini_Int(file,"Deaths");
 			PlayerInfo[playerid][Pcommands] = dini_Int(file,"PCommands");
 			PlayerInfo[playerid][Ppms] = dini_Int(file,"PPms");
			switch(PlayerInfo[playerid][Level])
			{
				case 0,1: format(string,sizeof(string)," התחברת בהצלחה תהנה \"%s\" שלום ");
				case 2..10: format(string,sizeof(string),"[Admin level %d] אתה אדמין רמה",PlayerInfo[playerid][Level]);
				default: printf("Unknown level: %d (on playerid %d)",PlayerInfo[playerid][Level],playerid);
			}
			SendClientMessage(playerid,COLOR_GREEN,string);
			PlayerInfo[playerid][Logged] = 1;
			Sound(playerid,1056);
			OnPlayerLogin(playerid);
		}
		return 1;
	}
if(strcmp(cmdtext,"/statsa",true) == 0)
{
new string[256];
new file[256];
new name[MAX_PLAYER_NAME];
GetPlayerName(playerid,name,sizeof(name));
format(file,sizeof(file),"IPTAdminMode2/Users/%s.t xt",name);
format(string,sizeof(string),"name %s",name);
SendClientMessage(playerid,COLOR_LIGHTBLUE,string) ;
format(string,sizeof(string),"your's stats:Deaths:%d Kills:%d level:%d",PlayerInfo[playerid][Deaths],PlayerInfo[playerid][Kills],PlayerInfo[playerid][Level]);
SendClientMessage(playerid,COLOR_LIGHTBLUE,string) ;
return 1;
}




	if(strcmp(cmdtext,"/logout",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_logout])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_logout]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
 		if(PlayerInfo[playerid][Logged] == 0)
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: You are not logged in.");
			return 1;
		}
		SendClientMessage(playerid,COLOR_GREEN," * You are now logged out.");
		PlayerInfo[playerid][Logged] = 0;
		PlayerInfo[playerid][Level] = 0;
		PlayerInfo[playerid][Logout] = 1;
		Sound(playerid,1056);
		OnPlayerLogout(playerid);
		return 1;
	}




	if(strcmp(cmd,"/say",true) == 0)
	{
		new tmp[256];
		new name[MAX_PLAYER_NAME];
		new string[256];
		tmp = IPTAdminMode_messages(cmdtext,idx);
		if(PlayerInfo[playerid][Level] < Config[CL_say])
		{
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_say]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /say [message]");
			return 1;
		}
		GetPlayerName(playerid,name,sizeof(name));
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
				if(PlayerInfo[i][Level] > 1)
				{
					format(string,sizeof(string)," * Admin (%s): %s",name,tmp);
					SendClientMessage(i,COLOR_DARKBLUE,string);
				}
				else
				{
					format(string,sizeof(string)," * Admin: %s",tmp);
					SendClientMessage(i,COLOR_DARKBLUE,string);
				}
			}
		}
		return 1;
	}

	if(strcmp(cmd,"/announce",true) == 0)
	{
		new tmp[256];
		tmp = IPTAdminMode_messages(cmdtext,idx);
		if(PlayerInfo[playerid][Level] < Config[CL_announce])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_announce]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /announce [message]");
			return 1;
		}
		new string[256];
		format(string,sizeof(string),"~w~%s",tmp);
		GameTextForAll(string,2000,5);
		return 1;
	}

	if(strcmp(cmdtext,"/info", true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_info])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_info]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		new string[256];
		format(string,sizeof(string)," --- Online players: %d",GetPlayersOnline());
		SendClientMessage(playerid,COLOR_GREEN,string);
		format(string,sizeof(string)," --- Max players: %d",GetMaxPlayers());
		SendClientMessage(playerid,COLOR_GREEN,string);
		format(string,sizeof(string)," --- Gravity: %.1f",ServerInfo[Gravity]);
		SendClientMessage(playerid,COLOR_GREEN,string);
		format(string,sizeof(string)," --- Weather: %d",ServerInfo[Weather]);
		SendClientMessage(playerid,COLOR_GREEN,string);
		return 1;
	}

	if(strcmp(cmd,"/mute",true) == 0)
	{
		new tmp[256];
		new id;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_mute])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_mute]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /mute [id]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
 		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
 		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't use it on admin that higer level than you are..");
		    return 1;
		}
		PlayerInfo[id][Muted] = 1;
		SuccesMessage(id,playerid,"muted");
		return 1;
	}




	if(strcmp(cmd,"/unmute",true) == 0)
	{
		new tmp[256];
		new id;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_unmute])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_unmute]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /unmute [id]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
 		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't use it on admin that higer level than you are..");
		    return 1;
		}
		PlayerInfo[id][Muted] = 0;
		SuccesMessage(id,playerid,"unmuted");
		return 1;
	}

	if(strcmp(cmd,"/muteall",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_muteall])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_muteall]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string)," * All muted by admin %s.",name);
		SendClientMessageToAll(COLOR_RED,string);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
			    PlayerInfo[i][Muted] = 1;
		    }
		}
		return 1;
	}

	if(strcmp(cmd,"/unmuteall",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_unmuteall])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_unmuteall]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string)," * All unmuted by admin %s.",name);
		SendClientMessageToAll(COLOR_RED,string);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
			    PlayerInfo[i][Muted] = 0;
		    }
		}
		return 1;
	}



    if(strcmp(cmd,"/kick",true) == 0)
	{
	    new tmp[256];
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		new id;
		if(PlayerInfo[playerid][Level] < Config[CL_kick])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_kick]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /kick [id] [reason]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(IsPlayerConnected(id))
		{
			if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't use it on admin that higer level than you are..");
			    return 1;
			}
			if(id != INVALID_PLAYER_ID)
			{
				new length = strlen(cmdtext);
				while ((idx < length) && (cmdtext[idx] <= ' ')) {
				idx++;
				}
				new offset = idx;
				new result[64];
				while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) {
				result[idx - offset] = cmdtext[idx];
				idx++;
				}
				result[idx - offset] = EOS;
				if(!strlen(result))
				{
					result = "No reason";
				}
				SetKick(id,result);
			}
		}
		else
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
		}
		return 1;
	}

	if(strcmp(cmd,"/kickall",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_kickall])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_kickall]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),"All kicked by admin %s.",name);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
			    SetKick(i,string);
		    }
		}
		return 1;
	}

    if(strcmp(cmd,"/ban",true) == 0)
	{
	    new tmp[256];
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		new id;
		if(PlayerInfo[playerid][Level] < Config[CL_ban])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_ban]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /ban [id] [reason]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(IsPlayerConnected(id))
		{
			if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
			    return 1;
			}
			if(id != INVALID_PLAYER_ID)
			{
				new length = strlen(cmdtext);
				while ((idx < length) && (cmdtext[idx] <= ' ')) {
				idx++;
				}
				new offset = idx;
				new result[64];
				while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) {
				result[idx - offset] = cmdtext[idx];
				idx++;
				}
				result[idx - offset] = EOS;
				if(!strlen(result))
				{
					result = "No reason";
				}
				SetBan(id,playerid,result);
			}
		}
		else
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
		}
		return 1;
	}

	if(strcmp(cmd,"/banall",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_banall])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_banall]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),"All banned by admin %s.",name);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
			    SetBan(i,playerid,string);
		    }
		}
		return 1;
	}

	if(strcmp(cmd,"/akill",true) == 0)
	{
		new tmp[256];
		new id;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_akill])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_akill]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /akill [id]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		SetPlayerHealth(id,0.0);
		SendDeathMessage(playerid,id,WEAPON_DROWN);
		SuccesMessage(id,playerid,"killed");
		return 1;
	}

	if(strcmp(cmd,"/akillall",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_akillall])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_akillall]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string)," * All killed by admin %s.",name);
		SendClientMessageToAll(COLOR_RED,string);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
			    SetPlayerHealth(i,0.0);
		    }
		}
		return 1;
	}

	if(strcmp(cmd,"/eject",true) == 0)
	{
		new tmp[256];
		new id;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_eject])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_eject]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /eject [id]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		if(!IsPlayerInAnyVehicle(id))
		{
			new string[256];
			new name[MAX_PLAYER_NAME];
			GetPlayerName(id,name,sizeof(name));
			format(string,sizeof(string),"SERVER: %s not in vehicle.",name);
			SendClientMessage(playerid,COLOR_WHITE,string);
			return 1;
		}
		RemovePlayerFromVehicle(id);
		SuccesMessage(id,playerid,"ejected");
		return 1;
	}

	if(strcmp(cmd,"/ejectall",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_ejectall])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_ejectall]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string)," * All ejected by admin %s.",name);
		SendClientMessageToAll(COLOR_RED,string);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
			    RemovePlayerFromVehicle(i);
		    }
		}
		return 1;
	}

	if(strcmp(cmd,"/freeze",true) == 0)
	{
		new tmp[256];
		new id;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_freeze])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_freeze]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /freeze [id]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		TogglePlayerControllable(id,0);
		SuccesMessage(id,playerid,"frozen");
		return 1;
	}

	if(strcmp(cmd,"/unfreeze",true) == 0)
	{
		new tmp[256];
		new id;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_unfreeze])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_unfreeze]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /unfreeze [id]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		TogglePlayerControllable(id,1);
		SuccesMessage(id,playerid,"unfrozen");
		return 1;
	}

	if(strcmp(cmd,"/freezeall",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_freezeall])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_freezeall]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string)," * All frozen by admin %s.",name);
		SendClientMessageToAll(COLOR_RED,string);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
			    TogglePlayerControllable(i,0);
		    }
		}
		return 1;
	}

	if(strcmp(cmd,"/unfreezeall",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_unfreezeall])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_unfreezeall]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string)," * All unfrozen by admin %s.",name);
		SendClientMessageToAll(COLOR_RED,string);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
			    TogglePlayerControllable(i,1);
		    }
		}
		return 1;
	}

	if(strcmp(cmd,"/setint",true) == 0)
	{
		new tmp[256];
		new id;
		new newint;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_setint])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_setint]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setint [id] [new interior]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setint [id] [new interior]");
			return 1;
		}
		newint = strval(tmp);
		if(newint < 0 || newint > 12)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid interior ID.");
		    return 1;
		}
		SetPlayerInterior(id,newint);
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		new nname[MAX_PLAYER_NAME];
		GetPlayerName(id,nname,sizeof(nname));
		format(string,sizeof(string)," * You have been set %s's interior to %d.",nname,newint);
		SendClientMessage(playerid,COLOR_YELLOW,string);
		format(string,sizeof(string)," * Admin %s set your interior to %d.",name,newint);
		SendClientMessage(id,COLOR_YELLOW,string);
		return 1;
	}

	if(strcmp(cmd,"/setallint",true) == 0)
	{
	    new tmp[256];
	    tmp = IPTAdminMode_strtok(cmdtext, idx);
	    new newint;
		if(PlayerInfo[playerid][Level] < Config[CL_setallint])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_setallint]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setallint [new interior]");
			return 1;
		}
		newint = strval(tmp);
		if(newint < 0 || newint > 12)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid interior ID.");
		    return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string)," * Admin %s set all interior to %d.",name,newint);
		SendClientMessageToAll(COLOR_YELLOW,string);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
			    SetPlayerInterior(i,newint);
		    }
		}
		return 1;
	}

	if(strcmp(cmd,"/sethealth",true) == 0)
	{
		new tmp[256];
		new id;
		new health;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_sethealth])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_sethealth]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /sethealth [id] [health]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /sethealth [id] [health]");
			return 1;
		}
		health = strval(tmp);
		if(health < 0 || health > 100)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid health.");
		    return 1;
		}
		SetPlayerHealth(id,health);
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		new nname[MAX_PLAYER_NAME];
		GetPlayerName(id,nname,sizeof(nname));
		format(string,sizeof(string)," * You have been set %s's health to %d.",nname,health);
		SendClientMessage(playerid,COLOR_YELLOW,string);
		format(string,sizeof(string)," * Admin %s set your health to %d.",name,health);
		SendClientMessage(id,COLOR_YELLOW,string);
		return 1;
	}

	if(strcmp(cmd,"/setallhealth",true) == 0)
	{
	    new tmp[256];
	    tmp = IPTAdminMode_strtok(cmdtext, idx);
	    new health;
		if(PlayerInfo[playerid][Level] < Config[CL_setallhealth])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_setallint]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setallhealth [health]");
			return 1;
		}
		health = strval(tmp);
		if(health < 0 || health > 100)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid health.");
		    return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string)," * Admin %s set all health to %d.",name,health);
		SendClientMessageToAll(COLOR_YELLOW,string);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
			    SetPlayerHealth(i,health);
		    }
		}
		return 1;
	}

	if(strcmp(cmd,"/setskin",true) == 0)
	{
		new tmp[256];
		new id;
		new s;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_setskin])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_setskin]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setskin [id] [skinid]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setskin [id] [skinid]");
			return 1;
		}
		s = strval(tmp);
		if(s < 0 || s > 298 || s == 3 || s == 4 || s == 5 || s == 6 || s == 7 || s == 8 || s == 42 || s == 65 || s == 73 || s == 86 || s == 119 || s == 149 || s == 208 || s == 265 || s == 266 || s == 267 || s == 268 || s == 269 || s == 270 || s == 271 || s == 272 || s == 273 || s == 289)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid skin ID.");
		    return 1;
		}
		SetPlayerSkin(id,s);
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		new nname[MAX_PLAYER_NAME];
		GetPlayerName(id,nname,sizeof(nname));
		format(string,sizeof(string)," * You have been set %s's skin to %d.",nname,s);
		SendClientMessage(playerid,COLOR_YELLOW,string);
		format(string,sizeof(string)," * Admin %s set your skin to %d.",name,s);
		SendClientMessage(id,COLOR_YELLOW,string);
		return 1;
	}

	if(strcmp(cmd,"/setallskin",true) == 0)
	{
	    new tmp[256];
	    tmp = IPTAdminMode_strtok(cmdtext, idx);
	    new s;
		if(PlayerInfo[playerid][Level] < Config[CL_setallskin])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_setallskin]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setallskin [skinid]");
			return 1;
		}
		s = strval(tmp);
		if(s < 0 || s > 298 || s == 3 || s == 4 || s == 5 || s == 6 || s == 7 || s == 8 || s == 42 || s == 65 || s == 73 || s == 86 || s == 119 || s == 149 || s == 208 || s == 265 || s == 266 || s == 267 || s == 268 || s == 269 || s == 270 || s == 271 || s == 272 || s == 273 || s == 289)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid skin ID.");
		    return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string)," * Admin %s set all skin to %d.",name,s);
		SendClientMessageToAll(COLOR_YELLOW,string);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
			    SetPlayerSkin(i,s);
		    }
		}
		return 1;
	}

	if(strcmp(cmd,"/giveweapon",true) == 0)
	{
		new tmp[256];
		new id;
		new weaponid;
		new ammo;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_giveweapon])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_giveweapon]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /giveweapon [id] [weaponid] [ammo]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /giveweapon [id] [weaponid] [ammo]");
			return 1;
		}
		weaponid = strval(tmp);
		if(weaponid < 0 || weaponid > 46)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid weapon ID.");
		    return 1;
		}
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			ammo = 100000;
		}
		ammo = strval(tmp);
		if(ammo < 0 || ammo > 100000)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ammo.");
		    return 1;
		}
		GivePlayerWeapon(id,weaponid,ammo);
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		new nname[MAX_PLAYER_NAME];
		new wname[20];
		GetWeaponName(weaponid,wname,sizeof(wname));
		GetPlayerName(id,nname,sizeof(nname));
		format(string,sizeof(string)," * You give to %s's \"%s\" with %d ammo.",nname,wname,ammo);
		SendClientMessage(playerid,COLOR_YELLOW,string);
		format(string,sizeof(string)," * Admin %s give you \"%d\" with %d ammo.",name,wname,ammo);
		SendClientMessage(id,COLOR_YELLOW,string);
		return 1;
	}

	if(strcmp(cmd,"/giveallweapon",true) == 0)
	{
	    new tmp[256];
	    tmp = IPTAdminMode_strtok(cmdtext, idx);
		new weaponid;
		new ammo;
		if(PlayerInfo[playerid][Level] < Config[CL_giveallweapon])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_giveallweapon]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /giveallweapon [weaponid] [ammo]");
			return 1;
		}
		weaponid = strval(tmp);
		if(weaponid < 0 || weaponid > 46)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid weapon ID.");
		    return 1;
		}
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			ammo = 100000;
		}
		ammo = strval(tmp);
		if(ammo < 0 || ammo > 100000)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ammo.");
		    return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		new wname[20];
		GetPlayerName(playerid,name,sizeof(name));
		GetWeaponName(weaponid,wname,sizeof(wname));
		format(string,sizeof(string)," * Admin %s give all \"%s\" with %d ammo.",name,wname,ammo);
		SendClientMessageToAll(COLOR_YELLOW,string);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
			    GivePlayerWeapon(i,weaponid,ammo);
		    }
		}
		return 1;
	}

	if(strcmp(cmd,"/disarm",true) == 0)
	{
		new tmp[256];
		new id;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_disarm])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_disarm]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /disarm [id]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		ResetPlayerWeapons(id);
		SuccesMessage(id,playerid,"disarmed");
		return 1;
	}

	if(strcmp(cmd,"/disarmall",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_disarmall])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_disarmall]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string)," * All disarmed by admin %s.",name);
		SendClientMessageToAll(COLOR_RED,string);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
			    ResetPlayerWeapons(i);
		    }
		}
		return 1;
	}

	if(strcmp(cmd,"/resetmoney",true) == 0)
	{
		new tmp[256];
		new id;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_resetmoney])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_resetmoney]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /resetmoney [id]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		ResetPlayerMoney(id);
		SuccesMessage(id,playerid,"money reseted");
		return 1;
	}

	if(strcmp(cmd,"/resetallmoney",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_resetallmoney])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_resetallmoney]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string)," * All money reseted by admin %s.",name);
		SendClientMessageToAll(COLOR_RED,string);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
			    ResetPlayerMoney(i);
		    }
		}
		return 1;
	}

	if(strcmp(cmd,"/setscore",true) == 0)
	{
		new tmp[256];
		new id;
		new score;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_setscore])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_setscore]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setscore [id] [score]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setscore [id] [score]");
			return 1;
		}
		score = strval(tmp);
		if(score < 0 || score > 99999999)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid score.");
		    return 1;
		}
		SetPlayerScore(id,score);
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		new nname[MAX_PLAYER_NAME];
		GetPlayerName(id,nname,sizeof(nname));
		format(string,sizeof(string)," * You have been set %s's score to %d.",nname,score);
		SendClientMessage(playerid,COLOR_YELLOW,string);
		format(string,sizeof(string)," * Admin %s set your score to %d.",name,score);
		SendClientMessage(id,COLOR_YELLOW,string);
		return 1;
	}

	if(strcmp(cmd,"/setallscore",true) == 0)
	{
	    new tmp[256];
	    tmp = IPTAdminMode_strtok(cmdtext, idx);
	    new score;
		if(PlayerInfo[playerid][Level] < Config[CL_setallscore])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_setallscore]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setallscore [score]");
			return 1;
		}
		score = strval(tmp);
		if(score < 0 || score > 99999999)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid score.");
		    return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string)," * Admin %s set all score to %d.",name,score);
		SendClientMessageToAll(COLOR_YELLOW,string);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
			    SetPlayerScore(i,score);
		    }
		}
		return 1;
	}

	if(strcmp(cmd,"/setlevel",true) == 0)
	{
		new tmp[256];
		new id;
		new newlevel;
		new file[256];
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_setlevel])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_setlevel]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setlevel [id] [new level]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Logged] == 0)
		{
		    new string[256];
		    new name[MAX_PLAYER_NAME];
		    GetPlayerName(id,name,sizeof(name));
		    format(string,sizeof(string),"SERVER: %s is not logged.",name);
			SendClientMessage(playerid,COLOR_WHITE,string);
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setlevel [id] [new level]");
			return 1;
		}
		newlevel = strval(tmp);
		if(newlevel < 0 || newlevel > 10)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid level.");
		    return 1;
		}
		PlayerInfo[id][Level] = newlevel;
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		new nname[MAX_PLAYER_NAME];
		GetPlayerName(id,nname,sizeof(nname));
		format(string,sizeof(string)," * You have been set %s's level to %d.",nname,newlevel);
		SendClientMessage(playerid,COLOR_YELLOW,string);
		format(string,sizeof(string)," * Admin %s set your level to %d.",name,newlevel);
		SendClientMessage(id,COLOR_YELLOW,string);
		format(file,sizeof(file),"IPTAdminMode2/Users/%s.txt",nname);
		dini_IntSet(file,"Level",newlevel);
		return 1;
	}

	if(strcmp(cmd,"/givemoney",true) == 0)
	{
		new tmp[256];
		new id;
		new money;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_givemoney])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_givemoney]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /givemoney [id] [money]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /givemoney [id] [money]");
			return 1;
		}
		money = strval(tmp);
		if(money < 0 || money > ServerInfo[MaxMoney])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid amount.");
		    return 1;
		}
		LACY_GiveMoney(id,money);
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		new nname[MAX_PLAYER_NAME];
		GetPlayerName(id,nname,sizeof(nname));
		format(string,sizeof(string)," * You give %d$ to %s.",money,nname);
		SendClientMessage(playerid,COLOR_YELLOW,string);
		format(string,sizeof(string)," * Admin %s give you %d$.",name,money);
		SendClientMessage(id,COLOR_YELLOW,string);
		PlayerInfo[id][Command] = 1;
		return 1;
	}

	if(strcmp(cmd,"/giveallmoney",true) == 0)
	{
	    new tmp[256];
	    tmp = IPTAdminMode_strtok(cmdtext, idx);
	    new money;
		if(PlayerInfo[playerid][Level] < Config[CL_giveallmoney])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_giveallmoney]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /giveallmoney [money]");
			return 1;
		}
		money = strval(tmp);
		if(money < 0 || money > ServerInfo[MaxMoney])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid amount.");
		    return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string)," * Admin %s give all %d$.",name,money);
		SendClientMessageToAll(COLOR_YELLOW,string);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
			    LACY_GiveMoney(i,money);
		    }
		}
		return 1;
	}

	if(strcmp(cmd,"/setmoney",true) == 0)
	{
		new tmp[256];
		new id;
		new money;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_setmoney])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_setmoney]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setmoney [id] [money]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
 		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setmoney [id] [money]");
			return 1;
		}
		money = strval(tmp);
		if(money < 0 || money > ServerInfo[MaxMoney])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid amount.");
		    return 1;
		}
		ResetPlayerMoney(id);
		LACY_GiveMoney(id,money);
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		new nname[MAX_PLAYER_NAME];
		GetPlayerName(id,nname,sizeof(nname));
		format(string,sizeof(string)," * You set %s's money to %d$.",nname,money);
		SendClientMessage(playerid,COLOR_YELLOW,string);
		format(string,sizeof(string)," * Admin %s set your money to %d$.",name,money);
		SendClientMessage(id,COLOR_YELLOW,string);
		PlayerInfo[id][Command] = 1;
		return 1;
	}

	if(strcmp(cmd,"/setallmoney",true) == 0)
	{
	    new tmp[256];
	    tmp = IPTAdminMode_strtok(cmdtext, idx);
	    new money;
		if(PlayerInfo[playerid][Level] < Config[CL_setallmoney])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_setallmoney]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setallmoney [money]");
			return 1;
		}
		money = strval(tmp);
		if(money < 0 || money > ServerInfo[MaxMoney])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid amount.");
		    return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),"Admin %s set all money to %d$.",name,money);
		SendClientMessageToAll(COLOR_RED,string);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
		        ResetPlayerMoney(i);
			    LACY_GiveMoney(i,money);
		    }
		}
		return 1;
	}

	if(strcmp(cmd,"/setarmor",true) == 0)
	{
		new tmp[256];
		new id;
		new armor;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_setarmor])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_setarmor]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setarmor [id] [armor]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
 		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setarmor [id] [armor]");
			return 1;
		}
		armor = strval(tmp);
		if(armor < 0 || armor > 100)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid armor.");
		    return 1;
		}
		SetPlayerArmour(playerid,armor);
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		new nname[MAX_PLAYER_NAME];
		GetPlayerName(id,nname,sizeof(nname));
		format(string,sizeof(string)," * You have been set %s's armor to %d.",nname,armor);
		SendClientMessage(playerid,COLOR_YELLOW,string);
		format(string,sizeof(string)," * Admin %s set your armor to %d.",name,armor);
		SendClientMessage(id,COLOR_YELLOW,string);
		return 1;
	}


	if(strcmp(cmd,"/setallarmor",true) == 0)
	{
	    new tmp[256];
	    tmp = IPTAdminMode_strtok(cmdtext, idx);
	    new armor;
		if(PlayerInfo[playerid][Level] < Config[CL_setallarmor])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_setallarmor]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setallarmor [armor]");
			return 1;
		}
		armor = strval(tmp);
		if(armor < 0 || armor > 100)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid armor.");
		    return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),"Admin %s set all armor to %d.",name,armor);
		SendClientMessageToAll(COLOR_RED,string);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
		        SetPlayerArmour(i,armor);
		    }
		}
		return 1;
	}

	if(strcmp(cmd,"/details",true) == 0)
	{
		new tmp[256];
		new id;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_details])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_details]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /details [id]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
 		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(id,name,sizeof(name));
		new ip[256];
		GetPlayerIp(id,ip,sizeof(ip));
		new ping = GetPlayerPing(id);
		new wanted = GetPlayerWantedLevel(id);
		new Float:armor;
		GetPlayerArmour(id,armor);
		new Float:health;
		GetPlayerHealth(id,health);
		new skin = GetPlayerSkin(id);
		new interior = GetPlayerInterior(id);
		new score = GetPlayerScore(id);
		format(string,sizeof(string),"%s's details:",name);
		SendClientMessage(playerid,COLOR_WHITE,string);
		format(string,sizeof(string),"IP: %s",ip);
		SendClientMessage(playerid,COLOR_WHITE,string);
		format(string,sizeof(string),"Ping: %d",ping);
		SendClientMessage(playerid,COLOR_WHITE,string);
		format(string,sizeof(string),"Wanted level: %d",wanted);
		SendClientMessage(playerid,COLOR_WHITE,string);
		format(string,sizeof(string),"Armor: %.1f",armor);
		SendClientMessage(playerid,COLOR_WHITE,string);
		format(string,sizeof(string),"Health: %.1f",health);
		SendClientMessage(playerid,COLOR_WHITE,string);
		format(string,sizeof(string),"Skin: %d",skin);
		SendClientMessage(playerid,COLOR_WHITE,string);
		format(string,sizeof(string),"Interior: %d",interior);
		SendClientMessage(playerid,COLOR_WHITE,string);
		format(string,sizeof(string),"Score: %d",score);
		SendClientMessage(playerid,COLOR_WHITE,string);
	 	format(string,sizeof(string),"Level: %d",PlayerInfo[id][Level]);
		SendClientMessage(playerid,COLOR_WHITE,string);
		return 1;
	}



	if(strcmp(cmd,"/boom",true) == 0)
	{
		new tmp[256];
		new id;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_boom])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_boom]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /boom [id]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
 		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		new Float:X;
		new Float:Y;
		new Float:Z;
		GetPlayerPos(id,X,Y,Z);
		CreateExplosion(X,Y,Z,6,10);
		SuccesMessage(id,playerid,"exploded");
		return 1;
	}

	if(strcmp(cmd,"/boomall",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_boomall])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_boomall]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),"All exploded by admin %s.",name);
		SendClientMessageToAll(COLOR_RED,string);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
				new Float:X;
				new Float:Y;
				new Float:Z;
				GetPlayerPos(i,X,Y,Z);
				CreateExplosion(X,Y,Z,6,10);
		    }
		}
		return 1;
	}

	if(strcmp(cmd,"/settime",true) == 0)
	{
		new tmp[256];
		new newtime;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_settime])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_settime]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /settime [new time]");
			return 1;
		}
		newtime = strval(tmp);
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string)," * Admin %s set the world time to %d.",name,newtime);
		SendClientMessageToAll(COLOR_YELLOW,string);
		SetWorldTime(newtime);
		return 1;
	}

	if(strcmp(cmd,"/setwanted",true) == 0)
	{
		new tmp[256];
		new id;
		new wanted;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_setwanted])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_setwanted]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setwanted [id] [wanted]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
 		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setwanted [id] [wanted]");
			return 1;
		}
		wanted = strval(tmp);
		if(wanted < 0 || wanted > 6)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid wanted level.");
		    return 1;
		}
		SetPlayerWantedLevel(playerid,wanted);
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		new nname[MAX_PLAYER_NAME];
		GetPlayerName(id,nname,sizeof(nname));
		format(string,sizeof(string)," * You have been set %s's wanted level to %d.",nname,wanted);
		SendClientMessage(playerid,COLOR_YELLOW,string);
		format(string,sizeof(string)," * Admin %s set your wanted level to %d.",name,wanted);
		SendClientMessage(id,COLOR_YELLOW,string);
		return 1;
	}

	if(strcmp(cmd,"/setallwanted",true) == 0)
	{
	    new tmp[256];
	    tmp = IPTAdminMode_strtok(cmdtext, idx);
	    new wanted;
		if(PlayerInfo[playerid][Level] < Config[CL_setallwanted])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_setallwanted]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setallwanted [wanted]");
			return 1;
		}
		wanted = strval(tmp);
		if(wanted < 0 || wanted > 6)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid wanted level.");
		    return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),"Admin %s set all wanted level to %d.",name,wanted);
		SendClientMessageToAll(COLOR_RED,string);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
		        SetPlayerWantedLevel(i,wanted);
		    }
		}
		return 1;
	}

	if(strcmp(cmd,"/setgravity",true) == 0)
	{
		new tmp[256];
		new Float:newgravity;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_setgravity])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_setgravity]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setgravity [new gravity]");
			return 1;
		}
		newgravity = floatstr(tmp);
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string)," * Admin %s set the gravity to %.1f.",name,newgravity);
		SendClientMessageToAll(COLOR_YELLOW,string);
		SetGravity(newgravity);
		return 1;
	}

	if(strcmp(cmd,"/color",true) == 0)
	{
		new tmp[256];
		tmp = IPTAdminMode_strtok(cmdtext, idx);

	 	if(PlayerInfo[playerid][Level] < Config[CL_color])
	 	{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_color]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}

		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /color [color/list] [id]");
			return 1;
		}
		if(strcmp(tmp,"grey",true) == 0)
		{
			new id;
			if(!IsNumber(tmp))
			{
			    GetPlayerID(tmp);
			}
			else
			{
				id = strval(tmp);
			}
			tmp = IPTAdminMode_strtok(cmdtext, idx);
			if(!IsPlayerConnected(id))
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			    return 1;
			}
			if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
			    return 1;
			}
			if(!strlen(tmp))
			{
				SendClientMessage(playerid,COLOR_WHITE,"SERVER: /color [color/list] [id]");
				return 1;
			}
			SetPlayerColor(id,COLOR_GREY);
		}
		else if(strcmp(tmp,"red",true) == 0)
		{
			new id;
			if(!IsNumber(tmp))
			{
			    GetPlayerID(tmp);
			}
			else
			{
				id = strval(tmp);
			}
			tmp = IPTAdminMode_strtok(cmdtext, idx);
			if(!IsPlayerConnected(id))
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			    return 1;
			}
			if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
			    return 1;
			}
			if(!strlen(tmp))
			{
				SendClientMessage(playerid,COLOR_WHITE,"SERVER: /color [color/list] [id]");
				return 1;
			}
			SetPlayerColor(id,COLOR_RED);
		}
		else if(strcmp(tmp,"yellow",true) == 0)
		{
			new id;
			if(!IsNumber(tmp))
			{
			    GetPlayerID(tmp);
			}
			else
			{
				id = strval(tmp);
			}
			tmp = IPTAdminMode_strtok(cmdtext, idx);
			if(!IsPlayerConnected(id))
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			    return 1;
			}
			if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
			    return 1;
			}
			if(!strlen(tmp))
			{
				SendClientMessage(playerid,COLOR_WHITE,"SERVER: /color [color/list] [id]");
				return 1;
			}
			SetPlayerColor(id,COLOR_YELLOW);
		}
		else if(strcmp(tmp,"pink",true) == 0)
		{
			new id;
			if(!IsNumber(tmp))
			{
			    GetPlayerID(tmp);
			}
			else
			{
				id = strval(tmp);
			}
			tmp = IPTAdminMode_strtok(cmdtext, idx);
			if(!IsPlayerConnected(id))
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			    return 1;
			}
			if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
			    return 1;
			}
			if(!strlen(tmp))
			{
				SendClientMessage(playerid,COLOR_WHITE,"SERVER: /color [color/list] [id]");
				return 1;
			}
			SetPlayerColor(id,COLOR_PINK);
		}
		else if(strcmp(tmp,"blue",true) == 0)
		{
			new id;
			if(!IsNumber(tmp))
			{
			    GetPlayerID(tmp);
			}
			else
			{
				id = strval(tmp);
			}
			tmp = IPTAdminMode_strtok(cmdtext, idx);
			if(!IsPlayerConnected(id))
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			    return 1;
			}
			if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
			    return 1;
			}
			if(!strlen(tmp))
			{
				SendClientMessage(playerid,COLOR_WHITE,"SERVER: /color [color/list] [id]");
				return 1;
			}
			SetPlayerColor(id,COLOR_BLUE);
		}
		else if(strcmp(tmp,"white",true) == 0)
		{
			new id;
			if(!IsNumber(tmp))
			{
			    GetPlayerID(tmp);
			}
			else
			{
				id = strval(tmp);
			}
			tmp = IPTAdminMode_strtok(cmdtext, idx);
			if(!IsPlayerConnected(id))
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			    return 1;
			}
			if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
			    return 1;
			}
			if(!strlen(tmp))
			{
				SendClientMessage(playerid,COLOR_WHITE,"SERVER: /color [color/list] [id]");
				return 1;
			}
			SetPlayerColor(id,COLOR_WHITE);
		}
		else if(strcmp(tmp,"lightblue",true) == 0)
		{
			new id;
			if(!IsNumber(tmp))
			{
			    GetPlayerID(tmp);
			}
			else
			{
				id = strval(tmp);
			}
			tmp = IPTAdminMode_strtok(cmdtext, idx);
			if(!IsPlayerConnected(id))
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			    return 1;
			}
			if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
			    return 1;
			}
			if(!strlen(tmp))
			{
				SendClientMessage(playerid,COLOR_WHITE,"SERVER: /color [color/list] [id]");
				return 1;
			}
			SetPlayerColor(id,COLOR_LIGHTBLUE);
		}
		else if(strcmp(tmp,"darkred",true) == 0)
		{
			new id;
			if(!IsNumber(tmp))
			{
			    GetPlayerID(tmp);
			}
			else
			{
				id = strval(tmp);
			}
			tmp = IPTAdminMode_strtok(cmdtext, idx);
			if(!IsPlayerConnected(id))
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			    return 1;
			}
			if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
			    return 1;
			}
			if(!strlen(tmp))
			{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /color [color/list] [id]");
			return 1;
			}
			SetPlayerColor(id,COLOR_DARKRED);
		}
		else if(strcmp(tmp,"orange",true) == 0){
			new id;
			if(!IsNumber(tmp))
			{
			    GetPlayerID(tmp);
			}
			else
			{
				id = strval(tmp);
			}
			tmp = IPTAdminMode_strtok(cmdtext, idx);
			if(!IsPlayerConnected(id))
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			    return 1;
			}
			if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
			    return 1;
			}
			if(!strlen(tmp))
			{
				SendClientMessage(playerid,COLOR_WHITE,"SERVER: /color [color/list] [id]");
				return 1;
			}
			SetPlayerColor(id,COLOR_ORANGE);
		}
		else if(strcmp(tmp,"brightred",true) == 0)
		{
			new id;
			if(!IsNumber(tmp))
			{
			    GetPlayerID(tmp);
			}
			else
			{
				id = strval(tmp);
			}
			tmp = IPTAdminMode_strtok(cmdtext, idx);
			if(!IsPlayerConnected(id))
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			    return 1;
			}
			if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
			    return 1;
			}
			if(!strlen(tmp))
			{
				SendClientMessage(playerid,COLOR_WHITE,"SERVER: /color [color/list] [id]");
				return 1;
			}
			SetPlayerColor(id,COLOR_BRIGHTRED);
		}
		else if(strcmp(tmp,"indigo",true) == 0)
		{
			new id;
			if(!IsNumber(tmp))
			{
			    GetPlayerID(tmp);
			}
			else
			{
				id = strval(tmp);
			}
			tmp = IPTAdminMode_strtok(cmdtext, idx);
			if(!IsPlayerConnected(id))
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			    return 1;
			}
			if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
			    return 1;
			}
			if(!strlen(tmp))
			{
				SendClientMessage(playerid,COLOR_WHITE,"SERVER: /color [color/list] [id]");
				return 1;
			}
			SetPlayerColor(id,COLOR_INDIGO);
		}
		else if(strcmp(tmp,"violet",true) == 0)
		{
			new id;
			if(!IsNumber(tmp))
			{
			    GetPlayerID(tmp);
			}
			else
			{
				id = strval(tmp);
			}
			tmp = IPTAdminMode_strtok(cmdtext, idx);
			if(!IsPlayerConnected(id))
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			    return 1;
			}
			if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
			    return 1;
			}
			if(!strlen(tmp))
			{
				SendClientMessage(playerid,COLOR_WHITE,"SERVER: /color [color/list] [id]");
				return 1;
			}
			SetPlayerColor(id,COLOR_VIOLET);
		}
		else if(strcmp(tmp,"lightred",true) == 0)
		{
			new id;
			if(!IsNumber(tmp))
			{
			    GetPlayerID(tmp);
			}
			else
			{
				id = strval(tmp);
			}
			tmp = IPTAdminMode_strtok(cmdtext, idx);
			if(!IsPlayerConnected(id))
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			    return 1;
			}
			if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
			    return 1;
			}
			if(!strlen(tmp))
			{
				SendClientMessage(playerid,COLOR_WHITE,"SERVER: /color [color/list] [id]");
				return 1;
			}
			SetPlayerColor(id,COLOR_LIGHTRED);
		}
		else if(strcmp(tmp,"seagreen",true) == 0)
		{
			new id;
			if(!IsNumber(tmp))
			{
			    GetPlayerID(tmp);
			}
			else
			{
				id = strval(tmp);
			}
			tmp = IPTAdminMode_strtok(cmdtext, idx);
			if(!IsPlayerConnected(id))
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			    return 1;
			}
			if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
			    return 1;
			}
			if(!strlen(tmp))
			{
				SendClientMessage(playerid,COLOR_WHITE,"SERVER: /color [color/list] [id]");
				return 1;
			}
			SetPlayerColor(id,COLOR_SEAGREEN);
		}
		else if(strcmp(tmp,"greywhite",true) == 0)
		{
			new id;
			if(!IsNumber(tmp))
			{
			    GetPlayerID(tmp);
			}
			else
			{
				id = strval(tmp);
			}
			tmp = IPTAdminMode_strtok(cmdtext, idx);
			if(!IsPlayerConnected(id))
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			    return 1;
			}
			if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
			    return 1;
			}
			if(!strlen(tmp))
			{
				SendClientMessage(playerid,COLOR_WHITE,"SERVER: /color [color/list] [id]");
				return 1;
			}
			SetPlayerColor(id,COLOR_GRAYWHITE);
		}
		else if(strcmp(tmp,"lemon",true) == 0)
		{
			new id;
			if(!IsNumber(tmp))
			{
			    GetPlayerID(tmp);
			}
			else
			{
				id = strval(tmp);
			}
			tmp = IPTAdminMode_strtok(cmdtext, idx);
			if(!IsPlayerConnected(id))
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			    return 1;
			}
			if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
			    return 1;
			}
			if(!strlen(tmp))
			{
				SendClientMessage(playerid,COLOR_WHITE,"SERVER: /color [color/list] [id]");
				return 1;
			}
			SetPlayerColor(id,COLOR_LEMON);
		}
		else if(strcmp(tmp,"black",true) == 0)
		{
			new id;
			if(!IsNumber(tmp))
			{
			    GetPlayerID(tmp);
			}
			else
			{
				id = strval(tmp);
			}
			tmp = IPTAdminMode_strtok(cmdtext, idx);
			if(!IsPlayerConnected(id))
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			    return 1;
			}
			if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
			    return 1;
			}
			if(!strlen(tmp))
			{
				SendClientMessage(playerid,COLOR_WHITE,"SERVER: /color [color/list] [id]");
				return 1;
			}
			SetPlayerColor(id,COLOR_BLACK);
		}
		else if(strcmp(tmp,"lightgreen",true) == 0)
		{
			new id;
			if(!IsNumber(tmp))
			{
			    GetPlayerID(tmp);
			}
			else
			{
				id = strval(tmp);
			}
			tmp = IPTAdminMode_strtok(cmdtext, idx);
			if(!IsPlayerConnected(id))
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			    return 1;
			}
			if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
			    return 1;
			}
			if(!strlen(tmp))
			{
				SendClientMessage(playerid,COLOR_WHITE,"SERVER: /color [color/list] [id]");
				return 1;
			}
			SetPlayerColor(id,COLOR_LIGHTGREEN);
		}
		else if(strcmp(tmp,"darkblue",true) == 0)
		{
			new id;
			if(!IsNumber(tmp))
			{
			    GetPlayerID(tmp);
			}
			else
			{
				id = strval(tmp);
			}
			tmp = IPTAdminMode_strtok(cmdtext, idx);
			if(!IsPlayerConnected(id))
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			    return 1;
			}
			if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
			    return 1;
			}
			if(!strlen(tmp))
			{
				SendClientMessage(playerid,COLOR_WHITE,"SERVER: /color [color/list] [id]");
				return 1;
			}
			SetPlayerColor(id,COLOR_DARKBLUE);
		}
		else if(strcmp(tmp,"purple",true) == 0)
		{
			new id;
			if(!IsNumber(tmp))
			{
			    GetPlayerID(tmp);
			}
			else
			{
				id = strval(tmp);
			}
			tmp = IPTAdminMode_strtok(cmdtext, idx);
			if(!IsPlayerConnected(id))
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			    return 1;
			}
			if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
			    return 1;
			}
			if(!strlen(tmp))
			{
				SendClientMessage(playerid,COLOR_WHITE,"SERVER: /color [color/list] [id]");
				return 1;
			}
			SetPlayerColor(id,COLOR_PURPLE);
		}
		else if(strcmp(tmp,"brown",true) == 0)
		{
			new id;
			if(!IsNumber(tmp))
			{
			    GetPlayerID(tmp);
			}
			else
			{
				id = strval(tmp);
			}
			tmp = IPTAdminMode_strtok(cmdtext, idx);
			if(!IsPlayerConnected(id))
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			    return 1;
			}
			if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
			    return 1;
			}
			if(!strlen(tmp))
			{
				SendClientMessage(playerid,COLOR_WHITE,"SERVER: /color [color/list] [id]");
				return 1;
			}
			SetPlayerColor(id,COLOR_BROWN);
		}
		else if(strcmp(tmp,"green",true) == 0)
		{
			new id;
			if(!IsNumber(tmp))
			{
			    GetPlayerID(tmp);
			}
			else
			{
				id = strval(tmp);
			}
			tmp = IPTAdminMode_strtok(cmdtext, idx);
			if(!IsPlayerConnected(id))
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			    return 1;
			}
			if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
			{
			    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
			    return 1;
			}
			if(!strlen(tmp))
			{
				SendClientMessage(playerid,COLOR_WHITE,"SERVER: /color [color/list] [id]");
				return 1;
			}
			SetPlayerColor(id,COLOR_GREEN);
		}
		else if(strcmp(tmp,"list",true) == 0)
		{
			SendClientMessage(playerid,COLOR_GREY,"grey");
			SendClientMessage(playerid,COLOR_RED,"red");
			SendClientMessage(playerid,COLOR_YELLOW,"yellow");
			SendClientMessage(playerid,COLOR_PINK,"pink");
			SendClientMessage(playerid,COLOR_BLUE,"blue");
			SendClientMessage(playerid,COLOR_WHITE,"white");
			SendClientMessage(playerid,COLOR_LIGHTBLUE,"lightblue");
			SendClientMessage(playerid,COLOR_DARKRED,"darkred");
			SendClientMessage(playerid,COLOR_WHITE,"/color list2");
		}
		else if(strcmp(tmp,"list2",true) == 0)
		{
			SendClientMessage(playerid,COLOR_ORANGE,"orange");
			SendClientMessage(playerid,COLOR_BRIGHTRED,"brightred");
			SendClientMessage(playerid,COLOR_INDIGO,"indigo");
			SendClientMessage(playerid,COLOR_VIOLET,"violet");
			SendClientMessage(playerid,COLOR_LIGHTRED,"lightred");
			SendClientMessage(playerid,COLOR_SEAGREEN,"seagreen");
			SendClientMessage(playerid,COLOR_GRAYWHITE,"greywhite");
			SendClientMessage(playerid,COLOR_LEMON,"lemon");
			SendClientMessage(playerid,COLOR_WHITE,"/color list3");
		}
		else if(strcmp(tmp,"list3",true) == 0)
		{
			SendClientMessage(playerid,COLOR_BLACK,"black");
			SendClientMessage(playerid,COLOR_LIGHTGREEN,"lightgreen");
			SendClientMessage(playerid,COLOR_DARKBLUE,"darkblue");
			SendClientMessage(playerid,COLOR_PURPLE,"purple");
			SendClientMessage(playerid,COLOR_BROWN,"brown");
			SendClientMessage(playerid,COLOR_GREEN,"green");
		}
		else
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /color [color/list] [id]");
		}
		return 1;
	}

	if(strcmp(cmd,"/setweather",true) == 0)
	{
		new tmp[256];
		new newweather;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_setweather])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_setweather]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setweather [new weather]");
			return 1;
		}
		newweather = strval(tmp);
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string)," * Admin %s set the weather to %d.",name,newweather);
		SendClientMessageToAll(COLOR_YELLOW,string);
		SetWeather(newweather);
		dini_IntSet("IPTAdminMode2/Configuration/Main.txt","Weather",newweather);
		return 1;
	}

	if(strcmp(cmdtext,"/lockserv", true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_lockserv])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_lockserv]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(ServerInfo[Locked] == 0)
		{
			dini_IntSet("IPTAdminMode2/Configuration/Main.txt","ServerLocked",1);
			ServerInfo[Locked] = 1;
			new string[256];
			new name[MAX_PLAYER_NAME];
			GetPlayerName(playerid,name,sizeof(name));
			format(string,sizeof(string)," * The server locked by admin %s.",name);
			SendClientMessageToAll(COLOR_GREY,string);
		}
		else if(ServerInfo[Locked] == 1)
		{
			dini_IntSet("IPTAdminMode2/Configuration/Main.txt","ServerLocked",0);
			ServerInfo[Locked] = 0;
			new string[256];
			new name[MAX_PLAYER_NAME];
			GetPlayerName(playerid,name,sizeof(name));
			format(string,sizeof(string)," * The server unlocked by admin %s.",name);
			SendClientMessageToAll(COLOR_GREY,string);
		}
		return 1;
	}

	if(strcmp(cmd,"/search",true) == 0) // Sagi "LucifeR" help me with this :D
	{
		new tmp[256];
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_search])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_search]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /search [part from the nick]");
			return 1;
		}
		new string[256];
		format(string,sizeof(string),"Search for \"%s\": ",tmp);
		SendClientMessage(playerid,COLOR_GREEN,string);
		new found=0;
		for(new i=0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
		  		new name[MAX_PLAYER_NAME];
		  		GetPlayerName(i,name,MAX_PLAYER_NAME);
				new namelen = strlen(name);
				new bool:done=false;
		    	for(new pos=0; pos <= namelen; pos++)
				{
					if(done != true)
					{
						if(strfind(name,tmp,true) == pos)
						{
			                found++;
							format(string,sizeof(string),"%d. %s (ID %d)",found,name,i);
							SendClientMessage(playerid,GetPlayerColor(i),string);
							done = true;
						}
					}
				}
			}
		}
		return 1;
	}


	if(strcmp(cmd,"/yossi",true) == 0)
	{
		new tmp[256];
		new v;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_getcar])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_getcar]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /getcar [vehicleid]");
			return 1;
		}
		v = strval(tmp);
		if(v < 400 || v > 611)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid model ID.");
		    return 1;
		}
		new Float:X;
		new Float:Y;
		new Float:Z;
		new Float:A;
		new vid;
		GetPlayerPos(playerid,X,Y,Z);
		GetPlayerFacingAngle(playerid,A);
		vid = CreateVehicle(v,X,Y,Z,A,-1,-1,50000);
		PutPlayerInVehicle(playerid,vid,0);
		return 1;
	}

	if(strcmp(cmd,"/god",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_god])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_god]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(PlayerInfo[playerid][Godmode] == 1)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You are already on godmode.");
		    return 1;
		}
		PlayerInfo[playerid][Godmode] = 1;
		timer2 = SetTimerEx("GodmodeSystem",1000,1,"d",playerid);
		SendClientMessage(playerid,COLOR_GREEN," * Godmode is ON.");
		return 1;
	}

	if(strcmp(cmd,"/ungod",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_ungod])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_ungod]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(PlayerInfo[playerid][Godmode] == 0)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You are not on godmode.");
		    return 1;
		}
		PlayerInfo[playerid][Godmode] = 0;
		KillTimer(timer2);
		SetPlayerHealth(playerid,100);
		SendClientMessage(playerid,COLOR_GREEN," * Godmode is OFF.");
		return 1;
	}

	if(strcmp(cmd,"/vcolor",true) == 0)
	{
		new tmp[256];
		new c1;
		new c2;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_vcolor])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_vcolor]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /vcolor [color] [color2]");
			return 1;
		}
		c1 = strval(tmp);
		tmp = IPTAdminMode_strtok(cmdtext, idx);
 		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /vcolor [color] [color2]");
			return 1;
		}
		c2 = strval(tmp);
		if(c1 < 0 || c2 < 0 || c1 > 126 || c2 > 126)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid color.");
		    return 1;
		}
 		if(!IsPlayerInAnyVehicle(playerid))
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You are not in vehicle.");
		    return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string)," * You have been set your vehicle colors to %d and %d.",c1,c2);
		SendClientMessage(playerid,COLOR_YELLOW,string);
		ChangeVehicleColor(GetPlayerVehicleID(playerid),c1,c2);
		return 1;
	}

	if(strcmp(cmd,"/vhealth",true) == 0)
	{
		new tmp[256];
		new health;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_vhealth])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_vhealth]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /vhealth [health]");
			return 1;
		}
		health = strval(tmp);
		if(health < 0 || health > 1000000)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid health.");
		    return 1;
		}
 		if(!IsPlayerInAnyVehicle(playerid))
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You are not in vehicle.");
		    return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string)," * You have been set your vehicle health to %d.",health);
		SendClientMessage(playerid,COLOR_YELLOW,string);
		SetVehicleHealth(GetPlayerVehicleID(playerid),health);
		return 1;
	}

	if(strcmp(cmdtext,"/gmx", true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_gmx])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_gmx]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),"Game Mode Exit by the admin %s.",name);
		SendClientMessageToAll(COLOR_GREY,string);
		GameModeExit();
		return 1;
	}


	if(strcmp(cmd,"/goto",true) == 0)
	{
		new tmp[256];
		new id;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_goto])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_goto]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /goto [id]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		new Float:X;
		new Float:Y;
		new Float:Z;
		GetPlayerPos(id,X,Y,Z);
		if(IsPlayerInAnyVehicle(playerid))
		{
		    SetVehiclePos(GetPlayerVehicleID(playerid),X+2,Y,Z);
		}
		else
		{
		    SetPlayerPos(playerid,X,Y,Z+2.5);
		}
		return 1;
	}

	if(strcmp(cmd,"/get",true) == 0)
	{
		new tmp[256];
		new id;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_get])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_get]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /get [id]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		new Float:X;
		new Float:Y;
		new Float:Z;
		GetPlayerPos(playerid,X,Y,Z);
		SetPlayerPos(id,X,Y,Z+2.5);
		return 1;
	}

	if(strcmp(cmd,"/getall",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_getall])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_getall]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		new Float:X;
		new Float:Y;
		new Float:Z;
		GetPlayerPos(playerid,X,Y,Z);
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),"All teleported to admin %s.",name);
		SendClientMessageToAll(COLOR_GREEN,string);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
		        SetPlayerPos(i,X,Y,Z);
		    }
		}
		return 1;
	}

	if(strcmp(cmd,"/getc",true) == 0)
	{
		new tmp[256];
		new id;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_getc])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_getc]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /getc [id]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
 		if(!IsPlayerInAnyVehicle(id))
		{
		    new string[256];
		    new name[MAX_PLAYER_NAME];
		    GetPlayerName(id,name,sizeof(name));
		    format(string,sizeof(string),"SERVER: %s is not in vehicle.",name);
			SendClientMessage(playerid,COLOR_WHITE,string);
			return 1;
		}
		new Float:X;
		new Float:Y;
		new Float:Z;
		GetPlayerPos(id,X,Y,Z);
		SetVehiclePos(GetPlayerVehicleID(id),X+2,Y,Z);
		return 1;
	}

	if(strcmp(cmd,"/spec",true) == 0)
	{
		new tmp[256];
		new id;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_spec])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_spec]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /spec [id]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		if(PlayerInfo[playerid][Spectating] == 1)
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: You are already spectating.");
			return 1;
		}
		TogglePlayerSpectating(playerid,1);
		PlayerSpectatePlayer(playerid,id);
		SetPlayerInterior(playerid,GetPlayerInterior(id));
		PlayerInfo[playerid][Spectating] = id;
		return 1;
	}

	if(strcmp(cmd,"/specoff",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_specoff])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_specoff]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(PlayerInfo[playerid][Spectating] == 0)
		{
			SendClientMessage(playerid,COLOR_RED,"You are not spectating!");
			return 1;
		}
		TogglePlayerSpectating(playerid,0);
		SpawnPlayer(playerid);
		SetPlayerInterior(playerid,0);
		PlayerInfo[playerid][Spectating] = INVALID_PLAYER_ID;
		return 1;
	}

	if(strcmp(cmd,"/jail",true) == 0)
	{
		new tmp[256];
		new id;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_jail])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_jail]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /jail [id]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
 		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		PlayerInfo[id][Jailed] = 1;
		SuccesMessage(id,playerid,"jailed");
		SetPlayerPos(id,264.3591,77.5832,1001.0391);
		SetPlayerFacingAngle(id,270.0);
		SetCameraBehindPlayer(id);
		SetPlayerInterior(id,6);
		return 1;
	}

	if(strcmp(cmd,"/unjail",true) == 0)
	{
		new tmp[256];
		new id;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_unjail])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_unjail]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /unjail [id]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
 		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		PlayerInfo[id][Jailed] = 0;
		SuccesMessage(id,playerid,"unjailed");
		SpawnPlayer(id);
		SetCameraBehindPlayer(id);
		SetPlayerInterior(id,0);
		return 1;
	}

	if(strcmp(cmd,"/jailall",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_jailall])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_jailall]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),"All jailed by admin %s.",name);
		SendClientMessageToAll(COLOR_GREEN,string);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
				PlayerInfo[i][Jailed] = 1;
				SetPlayerPos(i,264.3591,77.5832,1001.0391);
				SetPlayerFacingAngle(i,270.0);
				SetCameraBehindPlayer(i);
				SetPlayerInterior(i,6);
		    }
		}
		return 1;
	}

	if(strcmp(cmd,"/unjailall",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_unjailall])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_unjailall]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),"All unjailed by admin %s.",name);
		SendClientMessageToAll(COLOR_GREEN,string);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
				PlayerInfo[i][Jailed] = 0;
				SpawnPlayer(i);
				SetCameraBehindPlayer(i);
				SetPlayerInterior(i,0);
		    }
		}
		return 1;
	}


	if(strcmp(cmd,"/setname",true) == 0)
	{
		new tmp[256];
		new id;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_setname])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_setname]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setname [id] [new name]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
 		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
 		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setname [id] [new name]");
		}
		new name[MAX_PLAYER_NAME];
		new string[256];
		GetPlayerName(id,name,sizeof(name));
		SetPlayerName(id,tmp);
		new newname[MAX_PLAYER_NAME];
		GetPlayerName(id,newname,sizeof(newname));
		format(string,sizeof(string)," * You have been set %s name to new name, \"%s\"",name,newname);
		SendClientMessage(playerid,COLOR_YELLOW,string);
		return 1;
	}

	if(strcmp(cmd,"/admins",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_admins])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_admins]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		new AdminsConnecteds = 0;
		for(new i=0; i<MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
				if(PlayerInfo[i][Level] > 1)
				{
				new name[MAX_PLAYER_NAME];
				new string[256];
				GetPlayerName(i,name,sizeof(name));

				format(string,sizeof(string),"%s (%d)\n\r",name,PlayerInfo[i][Level]);
				SendClientMessage(playerid,COLOR_WHITE,string);
				AdminsConnecteds++;
				}
			}
		}
		if(AdminsConnecteds == 0)
		{
			SendClientMessage(playerid,COLOR_RED,". אין אדמינים מחוברים");
		}
		return 1;
	}


    if(strcmp(cmd,"/report",true) == 0)
	{
	    new tmp[256];
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		new id;
		new name[MAX_PLAYER_NAME];
		new nname[MAX_PLAYER_NAME];
		new string[256];
		if(PlayerInfo[playerid][Level] < Config[CL_report])
		{
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_report]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /report [id] [reason]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(PlayerInfo[playerid][Level] > 1)
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: You are admin, you not need the /report command.");
			return 1;
		}
		if(IsPlayerConnected(id))
		{
			if(id != INVALID_PLAYER_ID)
			{
				GetPlayerName(id,name,sizeof(name));
				GetPlayerName(playerid,nname,sizeof(nname));
				new length = strlen(cmdtext);
				while ((idx < length) && (cmdtext[idx] <= ' ')) {
				idx++;
				}
				new offset = idx;
				new result[64];
				while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) {
				result[idx - offset] = cmdtext[idx];
				idx++;
				}
				result[idx - offset] = EOS;
				if(!strlen(result))
				{
					SendClientMessage(playerid,COLOR_WHITE,"SERVER: /report [id] [reason]");
					return 1;
				}
				format(string,sizeof(string)," *** Report on %s (id %d) by %s (id %d). [reason: %s]",name,id,nname,playerid,result);
				AddLogLine("Reports",string);
				for(new i=0;i<MAX_PLAYERS;i++)
				{
					if(IsPlayerConnected(i) && PlayerInfo[i][Level] > 1)
					{
						SendClientMessage(i,COLOR_BRIGHTRED,string);
					}
				}
			}
		}
		else
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
		}
		return 1;
	}

	if(strcmp(cmd,"/pspawn",true) == 0)
	{
		new tmp[256];
		new id;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_pspawn])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_pspawn]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /pspawn [id]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
 		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		SpawnPlayer(id);
		SuccesMessage(id,playerid,"spawned");
		return 1;
	}

	if(strcmp(cmd,"/pspawnall",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_pspawnall])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_pspawnall]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),"All spawned by admin %s.",name);
		SendClientMessageToAll(COLOR_GREEN,string);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
				SpawnPlayer(i);
		    }
		}
		return 1;
	}

	if(strcmp(cmd,"/lockchat",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_lockchat])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_lockchat]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(ServerInfo[ChatClosed] == 1)
		{
		    SendClientMessage(playerid,COLOR_RED,"The public chat is already locked.");
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),". נעל את הצאט %s האדמין",name);
		SendClientMessageToAll(COLOR_RED,string);
		ServerInfo[ChatClosed] = 1;
		dini_IntSet("IPTAdminMode2/Configuration/Main.txt","ChatClosed",1);
		return 1;
	}

	if(strcmp(cmd,"/unlockchat",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_unlockchat])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_unlockchat]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(ServerInfo[ChatClosed] == 0)
		{
		    SendClientMessage(playerid,COLOR_RED,"The public chat is not locked.");
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),". פתח את הצאט %s האדמין",name);
		SendClientMessageToAll(COLOR_RED,string);
		ServerInfo[ChatClosed] = 0;
		dini_IntSet("AdminMode/Configuration/Main.txt","ChatClosed",0);
		return 1;
	}

	if(strcmp(cmd,"/clear",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_clear])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_clear]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),"All get kick by the admin %s",name);
	    for(new i=0;i<MAX_PLAYERS;i++)
	    {
		    if(IsPlayerConnected(i) && i != playerid && PlayerInfo[i][Level] < 2)
		    {
		        SetKick(i,string);
		    }
		}
		return 1;
	}

	if(strcmp(cmd,"/changepass",true) == 0)
	{
		new tmp[256];
		new file[256];
		new name[MAX_PLAYER_NAME];
		if(PlayerInfo[playerid][Level] < Config[CL_changepass])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_changepass]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		GetPlayerName(playerid,name,sizeof(name));
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /changepass [password 3 - 15]");
			return 1;
		}
		if(15 < strlen(tmp) || strlen(tmp) < 3)
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /changepass [password 3 - 15]");
			return 1;
		}
		format(file,sizeof(file),"IPTAdminMode2/Users/%s.txt",name);
		if(!dini_Exists(file))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Not found account. please register with \"/register [password]\"");
			return 1;
		}
		dini_IntSet(file,"Password",strval(tmp));
		new string[256];
		format(string,sizeof(string)," * Your password changed to \"%s\"",tmp);
		SendClientMessage(playerid,COLOR_ORANGE,string);
		return 1;
	}

	if(strcmp(cmd,"/jetpack",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_jetpack])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_jetpack]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		new Float:X;
		new Float:Y;
		new Float:Z;
		GetPlayerPos(playerid,X,Y,Z);
		jetpack = CreatePickup(370,2,X,Y,Z);
		return 1;
	}

	if(strcmp(cmd,"/flip",true) == 0)
	{
		new tmp[256];
		new id;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_flip])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_flip]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /flip [id]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
 		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
 		if(!IsPlayerInAnyVehicle(id))
		{
		    new string[256];
		    new name[MAX_PLAYER_NAME];
		    GetPlayerName(id,name,sizeof(name));
		    format(string,sizeof(string),"SERVER: %s is not in vehicle.",name);
			SendClientMessage(playerid,COLOR_WHITE,string);
			return 1;
		}
		SetVehicleZAngle(GetPlayerVehicleID(id),0.0);
		SuccesMessage(id,playerid,"flipped");
		return 1;
	}

	if(strcmp(cmd,"/flipall",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_flipall])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_flipall]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),"All flipped by admin %s.",name);
		SendClientMessageToAll(COLOR_GREEN,string);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
		        if(IsPlayerInAnyVehicle(i))
		        {
					SetVehicleZAngle(GetPlayerVehicleID(i),0.0);
				}
		    }
		}
		return 1;
	}

	if(strcmp(cmd,"/component",true) == 0)
	{
		new tmp[256];
		new component;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_vhealth])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_vhealth]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /component [componentid]");
			return 1;
		}
		component = strval(tmp);
		if(component < 1000 || component > 1193)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid component ID.");
		    return 1;
		}
 		if(!IsPlayerInAnyVehicle(playerid))
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You are not in vehicle.");
		    return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string)," * You have been give your vehicle componentid %d.",component);
		SendClientMessage(playerid,COLOR_YELLOW,string);
		AddVehicleComponent(GetPlayerVehicleID(playerid),component);
		return 1;
	}

	if(strcmp(cmd,"/cc",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_cc])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_cc]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		for(new i=0;i<55;i++)
		{
		    SendClientMessageToAll(COLOR_WHITE," ");
		}
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),". ניקה את הצאט [%s] האדמין",name);
		SendClientMessageToAll(COLOR_ORANGE,string);
		return 1;
	}

	if(strcmp(cmd,"/invisible",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_invisible])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_invisible]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(GetPlayerColor(playerid) == COLOR_INVISIBLE)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You already invisible.");
		    return 1;
		}
		SetPlayerColor(playerid,COLOR_INVISIBLE);
		SendClientMessage(playerid,COLOR_WHITE,"נהפכת לבלתי נראה");
		return 1;
	}

	if(strcmp(cmd,"/bigbang",true) == 0)
	{
		new tmp[256];
		new id;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_bigbang])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_bigbang]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /bigbang [id]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
 		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		new Float:X;
		new Float:Y;
		new Float:Z;
		GetPlayerPos(id,X,Y,Z);
		CreateExplosion(X+20,Y,Z,6,10);
		CreateExplosion(X-20,Y,Z,6,10);
		CreateExplosion(X,Y+20,Z,6,10);
		CreateExplosion(X,Y-20,Z,6,10);
		return 1;
	}

	if(strcmp(cmd,"/bigbangall",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_bigbangall])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_bigbangall]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		new Float:X;
		new Float:Y;
		new Float:Z;
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
				GetPlayerPos(i,X,Y,Z);
				CreateExplosion(X+25,Y,Z,6,8);
				CreateExplosion(X-25,Y,Z,6,8);
				CreateExplosion(X,Y+25,Z,6,8);
				CreateExplosion(X,Y-25,Z,6,8);
		    }
		}
		return 1;
	}

	if(strcmp(cmd,"/diehard",true) == 0)
	{
		new tmp[256];
		new id;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_diehard])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_diehard]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /diehard [id]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
 		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		timer3 = SetTimerEx("Diehard",80,1,"d",id);
		PlayerInfo[id][Dieharded] = 1;
		return 1;
	}

	if(strcmp(cmd,"/removemoney",true) == 0)
	{
		new tmp[256];
		new id;
		new money;
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_removemoney])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_removemoney]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /removemoney [id] [money]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /removemoney [id] [money]");
			return 1;
		}
		money = strval(tmp);
		if(money < 0 || money > ServerInfo[MaxMoney])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid amount.");
		    return 1;
		}
		LACY_GiveMoney(id,GetPlayerMoney(id)-money);
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		new nname[MAX_PLAYER_NAME];
		GetPlayerName(id,nname,sizeof(nname));
		format(string,sizeof(string)," * You remove %d$ from %s.",money,nname);
		SendClientMessage(playerid,COLOR_YELLOW,string);
		format(string,sizeof(string)," * Admin %s remove %d$ from you.",name,money);
		SendClientMessage(id,COLOR_YELLOW,string);
		PlayerInfo[id][Command] = 1;
		return 1;
	}

	if(strcmp(cmd,"/removeallmoney",true) == 0)
	{
	    new tmp[256];
	    tmp = IPTAdminMode_strtok(cmdtext, idx);
	    new money;
		if(PlayerInfo[playerid][Level] < Config[CL_removeallmoney])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_removeallmoney]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /removeallmoney [money]");
			return 1;
		}
		money = strval(tmp);
		if(money < 0 || money > ServerInfo[MaxMoney])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid amount.");
		    return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),"Admin %s remove %d$ from all.",name,money);
		SendClientMessageToAll(COLOR_RED,string);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
		        LACY_GiveMoney(i,GetPlayerMoney(i)-money);
		    }
		}
		return 1;
	}

	if(strcmp(cmd,"/loadfs",true) == 0)
	{
	    new tmp[256];
	    tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_loadfs])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_loadfs]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /loadfs [filterscript name]");
			return 1;
		}
		new string[256];
		format(string,sizeof(string),"loadfs %s",tmp);
		SendRconCommand(string);
		format(string,sizeof(string),"Try load %s.amx...",tmp);
		SendClientMessage(playerid,COLOR_WHITE,string);
		return 1;
	}

	if(strcmp(cmd,"/unloadfs",true) == 0)
	{
	    new tmp[256];
	    tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_unloadfs])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_unloadfs]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /unloadfs [filterscript name]");
			return 1;
		}
		new string[256];
		format(string,sizeof(string),"unloadfs %s",tmp);
		SendRconCommand(string);
		format(string,sizeof(string),"Try unload %s.amx...",tmp);
		SendClientMessage(playerid,COLOR_WHITE,string);
		return 1;
	}

	if(strcmp(cmd,"/changemode",true) == 0)
	{
	    new tmp[256];
	    tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_unloadfs])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_unloadfs]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /unloadfs [filterscript name]");
			return 1;
		}
		new string[256];
		format(string,sizeof(string),"changemode %s",tmp);
		SendRconCommand(string);
		format(string,sizeof(string),"Try change mode to %s.amx...",tmp);
		SendClientMessage(playerid,COLOR_WHITE,string);
		return 1;
	}

	if(strcmp(cmd,"/reloadbans",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_reloadbans])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_reloadbans]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),"Reload bans by %s",name);
		SendClientMessageToAll(COLOR_WHITE,string);
		SendRconCommand("reloadbans");
		return 1;
	}

	if(strcmp(cmd,"/reloadlogs",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_reloadlogs])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_reloadlogs]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),"Reload logs by %s",name);
		SendClientMessageToAll(COLOR_WHITE,string);
		SendRconCommand("reloadlogs");
		return 1;
	}

	if(strcmp(cmd,"/exit",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_exit])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_exit]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),"EXIT by %s",name);
		SendClientMessageToAll(COLOR_WHITE,string);
		SendRconCommand("exit");
		return 1;
	}

	if(strcmp(cmd,"/lockrcon",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_lockrcon])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_lockrcon]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(ServerInfo[RconLocked] == 1)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: RCON already locked.");
		    return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),"RCON locked by %s",name);
		SendClientMessageToAll(COLOR_WHITE,string);
		ServerInfo[RconLocked] = 1;
		dini_IntSet("IPTAdminMode2/Configuration/Main.txt","RconLocked",1);
		return 1;
	}

	if(strcmp(cmd,"/unlockrcon",true) == 0)
	{
		if(PlayerInfo[playerid][Level] < Config[CL_unlockrcon])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_unlockrcon]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(ServerInfo[RconLocked] == 0)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: RCON is not locked.");
		    return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),"RCON unlocked by %s",name);
		SendClientMessageToAll(COLOR_WHITE,string);
		ServerInfo[RconLocked] = 0;
		dini_IntSet("IPTAdminMode2/Configuration/Main.txt","RconLocked",0);
		return 1;
	}

	if(strcmp(cmd,"/gamemodetext",true) == 0)
	{
	    new tmp[256];
	    tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_gamemodetext])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_gamemodetext]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /gamemodetext [text]");
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),"Admin %s set the game mode text to %s.",name,tmp);
		SendClientMessageToAll(COLOR_RED,string);
		SetGameModeText(tmp);
		return 1;
	}

	if(strcmp(cmd,"/hostname",true) == 0)
	{
	    new tmp[256];
	    tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_hostname])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_hostname]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /hostname [new name]");
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),"hostname %s",tmp);
		SendRconCommand(string);
		format(string,sizeof(string),"Admin %s set the hostname to %s",name,tmp);
		SendClientMessageToAll(COLOR_WHITE,string);
		return 1;
	}

	if(strcmp(cmd,"/lanmode",true) == 0)
	{
	    new tmp[256];
	    tmp = IPTAdminMode_strtok(cmdtext, idx);
	    new lm;
		if(PlayerInfo[playerid][Level] < Config[CL_lanmode])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_lanmode]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /lanmode [0/1]");
			return 1;
		}
		lm = strval(tmp);
		if(lm != 0 || lm != 1)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: /lanmode [0/1]");
		    return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),"lanmode %d",lm);
		SendRconCommand(string);
		format(string,sizeof(string),"Admin %s set the lanmode to %d",name,lm);
		SendClientMessageToAll(COLOR_WHITE,string);
		return 1;
	}

	if(strcmp(cmd,"/mapname",true) == 0)
	{
	    new tmp[256];
	    tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_mapname])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_mapname]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /mapname [new name]");
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),"mapname %s",tmp);
		SendRconCommand(string);
		format(string,sizeof(string),"Admin %s set the mapname to %s",name,tmp);
		SendClientMessageToAll(COLOR_WHITE,string);
		return 1;
	}

	if(strcmp(cmd,"/serverpassword",true) == 0)
	{
	    new tmp[256];
	    tmp = IPTAdminMode_strtok(cmdtext, idx);
	    new pass;
		if(PlayerInfo[playerid][Level] < Config[CL_serverpassword])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_serverpassword]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /serverpassword [password 0 - 30]");
			return 1;
		}
		pass = strval(tmp);
		if(pass < 0 || pass > 30)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: /serverpassword [password 0 - 30]");
		    return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),"password %d",pass);
		SendRconCommand(string);
		format(string,sizeof(string),"Admin %s set the server password to %d",name,pass);
		SendClientMessageToAll(COLOR_WHITE,string);
		return 1;
	}

	if(strcmp(cmd,"/weburl",true) == 0)
	{
	    new tmp[256];
	    tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_weburl])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_weburl]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /weburl [new weburl]");
			return 1;
		}
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		format(string,sizeof(string),"weburl %s",tmp);
		SendRconCommand(string);
		format(string,sizeof(string),"Admin %s set the weburl to %s",name,tmp);
		SendClientMessageToAll(COLOR_WHITE,string);
		return 1;
	}
	
	if(strcmp(cmd,"/countdown",true) == 0)
	{
	    new tmp[256];
	    tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_countdown])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_countdown]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /countdown [second] [freeze 0 / 1]");
			return 1;
		}
		cd_seconds = strval(tmp);
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /countdown [second] [freeze 0 / 1]");
			return 1;
		}
		cd_freeze = strval(tmp);
		if(cd_freeze < 0 || cd_freeze > 1)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: /countdown [second] [freeze 0 / 1]");
		    return 1;
		}
		if(cd_freeze == 1)
		{
			for(new i=0;i<MAX_PLAYERS;i++)
			{
				if(IsPlayerConnected(i))
				{
					TogglePlayerControllable(i,0);
 				}
			}
		}
		timer4 = SetTimer("CountDown",1000,3);
		return 1;
	}
	
	if(strcmp(cmd,"/setkills",true) == 0)
	{
		new tmp[256];
		new id;
		new newkills;
		new file[256];
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_setkills])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_setkills]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setkills [id] [new kills]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Logged] == 0)
		{
		    new string[256];
		    new name[MAX_PLAYER_NAME];
		    GetPlayerName(id,name,sizeof(name));
		    format(string,sizeof(string),"SERVER: %s is not logged.",name);
			SendClientMessage(playerid,COLOR_WHITE,string);
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setkills [id] [new kills]");
			return 1;
		}
		newkills = strval(tmp);
		if(newkills < 0 || newkills > 1000000)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid kills.");
		    return 1;
		}
		PlayerInfo[id][Kills] = newkills;
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		new nname[MAX_PLAYER_NAME];
		GetPlayerName(id,nname,sizeof(nname));
		format(string,sizeof(string)," * You have been set %s's kills to %d.",nname,newkills);
		SendClientMessage(playerid,COLOR_YELLOW,string);
		format(string,sizeof(string)," * Admin %s set your kills to %d.",name,newkills);
		SendClientMessage(id,COLOR_YELLOW,string);
		format(file,sizeof(file),"IPTAdminMode2/Users/%s.txt",nname);
		dini_IntSet(file,"Kills",newkills);
		return 1;
	}

	if(strcmp(cmd,"/resetkills",true) == 0)
	{
		new tmp[256];
		new id;
		new file[256];
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_resetkills])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_resetkills]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /resetkills [id]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Logged] == 0)
		{
		    new string[256];
		    new name[MAX_PLAYER_NAME];
		    GetPlayerName(id,name,sizeof(name));
		    format(string,sizeof(string),"SERVER: %s is not logged.",name);
			SendClientMessage(playerid,COLOR_WHITE,string);
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		PlayerInfo[id][Kills] = 0;
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		new nname[MAX_PLAYER_NAME];
		GetPlayerName(id,nname,sizeof(nname));
		format(string,sizeof(string)," * You have been reset %s's kills.",nname);
		SendClientMessage(playerid,COLOR_YELLOW,string);
		format(string,sizeof(string)," * Admin %s resey your kills.",name);
		SendClientMessage(id,COLOR_YELLOW,string);
		format(file,sizeof(file),"IPTAdminMode2/Users/%s.txt",nname);
		dini_IntSet(file,"Kills",0);
		return 1;
	}
	
	if(strcmp(cmd,"/setdeaths",true) == 0)
	{
		new tmp[256];
		new id;
		new newdeaths;
		new file[256];
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_setdeaths])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_setdeaths]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setdeaths [id] [new deaths]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Logged] == 0)
		{
		    new string[256];
		    new name[MAX_PLAYER_NAME];
		    GetPlayerName(id,name,sizeof(name));
		    format(string,sizeof(string),"SERVER: %s is not logged.",name);
			SendClientMessage(playerid,COLOR_WHITE,string);
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /setdeaths [id] [new deaths]");
			return 1;
		}
		newdeaths = strval(tmp);
		if(newdeaths < 0 || newdeaths > 1000000)
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid deaths.");
		    return 1;
		}
		PlayerInfo[id][Deaths] = newdeaths;
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		new nname[MAX_PLAYER_NAME];
		GetPlayerName(id,nname,sizeof(nname));
		format(string,sizeof(string)," * You have been set %s's deaths to %d.",nname,newdeaths);
		SendClientMessage(playerid,COLOR_YELLOW,string);
		format(string,sizeof(string)," * Admin %s set your deaths to %d.",name,newdeaths);
		SendClientMessage(id,COLOR_YELLOW,string);
		format(file,sizeof(file),"IPTAdminMode2/Users/%s.txt",nname);
		dini_IntSet(file,"Deaths",newdeaths);
		return 1;
	}

	if(strcmp(cmd,"/resetdeaths",true) == 0)
	{
		new tmp[256];
		new id;
		new file[256];
		tmp = IPTAdminMode_strtok(cmdtext, idx);
		if(PlayerInfo[playerid][Level] < Config[CL_resetdeaths])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_resetdeaths]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: /resetdeaths [id]");
			return 1;
		}
		if(!IsNumber(tmp))
		{
		    GetPlayerID(tmp);
		}
		else
		{
			id = strval(tmp);
		}
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid,COLOR_WHITE,"SERVER: Invalid ID.");
			return 1;
		}
		if(PlayerInfo[id][Logged] == 0)
		{
		    new string[256];
		    new name[MAX_PLAYER_NAME];
		    GetPlayerName(id,name,sizeof(name));
		    format(string,sizeof(string),"SERVER: %s is not logged.",name);
			SendClientMessage(playerid,COLOR_WHITE,string);
			return 1;
		}
		if(PlayerInfo[id][Level] > PlayerInfo[playerid][Level])
		{
		    SendClientMessage(playerid,COLOR_WHITE,"SERVER: You can't do this command on higher admin level.");
		    return 1;
		}
		PlayerInfo[id][Deaths] = 0;
		new string[256];
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,name,sizeof(name));
		new nname[MAX_PLAYER_NAME];
		GetPlayerName(id,nname,sizeof(nname));
		format(string,sizeof(string)," * You have been reset %s's deaths.",nname);
		SendClientMessage(playerid,COLOR_YELLOW,string);
		format(string,sizeof(string)," * Admin %s resey your deaths.",name);
		SendClientMessage(id,COLOR_YELLOW,string);
		format(file,sizeof(file),"IPTAdminMode2/Users/%s.txt",nname);
		dini_IntSet(file,"Deaths",0);
		return 1;
	}
	
	if(strcmp(cmd,"/pcommands",true) == 0)
	{
	    new file[256];
	    new name[MAX_PLAYER_NAME];
		if(PlayerInfo[playerid][Level] < Config[CL_pcommands])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_pcommands]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		format(file,sizeof(file),"IPTAdminMode2/Users/%s.txt",name);
		if(PlayerInfo[playerid][Pcommands] == 0)
		{
		    PlayerInfo[playerid][Pcommands] = 1;
		    SendClientMessage(playerid,COLOR_GREEN," * Now you see commands.");
		    Sound(playerid,1056);
		    dini_IntSet(file,"PCommands",1);
		}
		if(PlayerInfo[playerid][Pcommands] == 1)
		{
		    PlayerInfo[playerid][Pcommands] = 0;
		    SendClientMessage(playerid,COLOR_GREEN," * Now you not see commands.");
		    Sound(playerid,1056);
		    dini_IntSet(file,"PCommands",0);
		}
		return 1;
	}
	
	if(strcmp(cmd,"/ppms",true) == 0)
	{
	    new file[256];
	    new name[MAX_PLAYER_NAME];
		if(PlayerInfo[playerid][Level] < Config[CL_ppms])
		{
			new string[256];
			format(string,sizeof(string),"Level error: You need be level %d to use this command.",Config[CL_ppms]);
			SendClientMessage(playerid,COLOR_RED,string);
			return 1;
		}
		format(file,sizeof(file),"IPTAdminMode2/Users/%s.txt",name);
		if(PlayerInfo[playerid][Ppms] == 0)
		{
		    PlayerInfo[playerid][Ppms] = 1;
		    SendClientMessage(playerid,COLOR_GREEN," * Now you see pms.");
		    Sound(playerid,1056);
		    dini_IntSet(file,"PPms",1);
		}
		if(PlayerInfo[playerid][Ppms] == 1)
		{
		    PlayerInfo[playerid][Ppms] = 0;
		    SendClientMessage(playerid,COLOR_GREEN," * Now you not see pms.");
		    Sound(playerid,1056);
		    dini_IntSet(file,"PPms",0);
		}
		return 1;
	}
	return 0;
}
//=OnPlayerInteriorChange=======================================================
public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
    for(new i=0;i<MAX_PLAYERS;i++)
	{
		if(IsPlayerConnected(i) && PlayerInfo[i][Spectating] == playerid && PlayerInfo[i][Spectating] != INVALID_PLAYER_ID)
		{
		    SetPlayerInterior(i,newinteriorid);
		}
	}
	return 1;
}
//=OnPlayerPickUpPickup=========================================================
public OnPlayerPickUpPickup(playerid, pickupid)
{
	if(pickupid == jetpack)
	{
	    DestroyPickup(jetpack);
	}
	return 1;
}
//=OnPlayerDeath================================================================
public OnPlayerDeath(playerid, killerid, reason)
{
	if(PlayerInfo[playerid][Dieharded] == 1)
	{
	    KillTimer(timer3);
	    PlayerInfo[playerid][Dieharded] = 0;
	}
	
	new Pfile[256];
	new Kfile[256];
	new Pname[MAX_PLAYER_NAME];
	new Kname[MAX_PLAYER_NAME];
	PlayerInfo[killerid][Kills]++;
	PlayerInfo[playerid][Deaths]++;
	GetPlayerName(playerid,Pname,sizeof(Pname));
	GetPlayerName(killerid,Kname,sizeof(Kname));
	format(Pfile,sizeof(Pfile),"IPTAdminMode2/Users/%s.txt",Pname);
	format(Kfile,sizeof(Kfile),"IPTAdminMode2/Users/%s.txt",Kname);
	if(dini_Exists(Pfile))
	{
		dini_IntSet(Pfile,"Deaths",PlayerInfo[playerid][Deaths]);
	}
	if(dini_Exists(Kfile))
	{
		dini_IntSet(Kfile,"Kills",PlayerInfo[playerid][Kills]);
	}
	return 1;
}
//=OnRconCommand================================================================
public OnRconCommand(cmd[])
{
	if(ServerInfo[RconLocked] == 1)
	{
	    printf("OnRconCommand(%s) - RCON is locked!",cmd);
	    return 0;
	}
	else return 1;
}
//=SetKick======================================================================
public SetKick(playerid,reason[])
{
	new Pname[MAX_PLAYER_NAME];
	new string[256];
	GetPlayerName(playerid,Pname,sizeof(Pname));
	format(string,sizeof(string),"%s has been kicked. (reason: %s)",Pname,reason);
	SendClientMessageToAll(COLOR_RED,string);
	Kick(playerid);
	AddLogLine("Kicks",string);
	return 1;
}
//=SetBan=======================================================================
public SetBan(playerid,adminid,reason[])
{
	new Pname[MAX_PLAYER_NAME];
	new name[MAX_PLAYER_NAME];
	new string[256];
	GetPlayerName(playerid,Pname,sizeof(Pname));
	GetPlayerName(playerid,name,sizeof(name));
	format(string,sizeof(string),"%s has been banned by admin %s. (reason: %s)",Pname,name,reason);
	SendClientMessageToAll(COLOR_RED,string);
	Ban(playerid);
	AddLogLine("Bans",string);
	return 1;
}
//=GetPlayersOnline=============================================================
public GetPlayersOnline()
{
	new PlayersOnline;
	PlayersOnline = 0;
	for(new i=0;i<MAX_PLAYERS;i++)
	{
		if(IsPlayerConnected(i))
		{
			PlayersOnline++;
		}
	}
	return PlayersOnline;
}
//=SuccesMessage================================================================
public SuccesMessage(playerid,adminid,reason[])
{
	new Pname[MAX_PLAYER_NAME];
	new Aname[MAX_PLAYER_NAME];
	new string[256];
	GetPlayerName(playerid,Pname,sizeof(Pname));
	GetPlayerName(adminid,Aname,sizeof(Aname));
	format(string,sizeof(string),"%s %s by %s",Pname,reason,Aname);
	SendClientMessageToAll(COLOR_WHITE,string);
	return 1;
}
//=MainConfig===================================================================
public MainConfig()
{
	new FileName[256];
	FileName = "IPTAdminMode2/Configuration/Main.txt";

    if(!dini_Exists(FileName))
	{
		dini_Create(FileName);
		print("\"IPTAdminMode2/Configuration/Main.txt\" not found - created & loaded.");
	}
	else
	{
	    print("\"IPTAdminMode2/Configuration/Main.txt\" found - loaded.");
	}

	if(!dini_Isset(FileName,"MaxPing")) { dini_IntSet(FileName,"MaxPing",600); }
	ServerInfo[MaxPing] = dini_Int(FileName,"MaxPing");

	if(!dini_Isset(FileName,"MaxMoney")) { dini_IntSet(FileName,"MaxMoney",90000000); }
	ServerInfo[MaxMoney] = dini_Int(FileName,"MaxMoney");

	if(!dini_Isset(FileName,"MaxHealth")) { dini_IntSet(FileName,"MaxHealth",100000); }
	ServerInfo[MaxHealth] = dini_Int(FileName,"MaxHealth");

	if(!dini_Isset(FileName,"ChatClosed")) { dini_IntSet(FileName,"ChatClosed",0); }
	ServerInfo[ChatClosed] = dini_Bool(FileName,"ChatClosed");

	if(!dini_Isset(FileName,"ServerLocked")) { dini_IntSet(FileName,"ServerLocked",0); }
	ServerInfo[Locked] = dini_Bool(FileName,"ServerLocked");

	if(!dini_Isset(FileName,"Weather")) { dini_IntSet(FileName,"Weather",0); }
	ServerInfo[Weather] = dini_Int(FileName,"Weather");
	SetWeather(ServerInfo[Weather]);

	if(!dini_Isset(FileName,"SeeCmds")) { dini_IntSet(FileName,"SeeCmds",1); }
	ServerInfo[SeeCmds] = dini_Bool(FileName,"SeeCmds");

	if(!dini_Isset(FileName,"SeePms")) { dini_IntSet(FileName,"SeePms",1); }
	ServerInfo[SeePms] = dini_Bool(FileName,"SeePms");

	if(!dini_Isset(FileName,"AdminChat")) { dini_IntSet(FileName,"AdminChat",1); }
	ServerInfo[AdminChat] = dini_Bool(FileName,"AdminChat");

	if(!dini_Isset(FileName,"RconLocked")) { dini_IntSet(FileName,"RconLocked",0); }
	ServerInfo[RconLocked] = dini_Bool(FileName,"RconLocked");

	if(!dini_Isset(FileName,"SlapTakeHealth")) { dini_IntSet(FileName,"SlapTakeHealth",1); }
	ServerInfo[SlapTakeHealth] = dini_Int(FileName,"SlapTakeHealth");
	return 1;
}
//=CommandsConfig===============================================================
public CommandsConfig()
{
	new FileName[256];
	FileName = "IPTAdminMode2/Configuration/Commands.txt";

    if(!dini_Exists(FileName))
	{
		dini_Create(FileName);
		print("\"IPTAdminMode2/Configuration/Commands.txt\" not found - created & loaded.");
	}
	else
	{
	    print("\"IPTAdminMode2/Configuration/Commands.txt\" found - loaded.");
	}

	if(!dini_Isset(FileName,"register")) { dini_IntSet(FileName,"register",0); }
	Config[CL_register] = dini_Int(FileName,"register");

	if(!dini_Isset(FileName,"login")) { dini_IntSet(FileName,"login",0); }
	Config[CL_login] = dini_Int(FileName,"login");

	if(!dini_Isset(FileName,"logout")) { dini_IntSet(FileName,"logout",1); }
	Config[CL_logout] = dini_Int(FileName,"logout");

	if(!dini_Isset(FileName,"say")) { dini_IntSet(FileName,"say",2); }
	Config[CL_say] = dini_Int(FileName,"say");

	if(!dini_Isset(FileName,"announce")) { dini_IntSet(FileName,"announce",3); }
	Config[CL_announce] = dini_Int(FileName,"announce");

	if(!dini_Isset(FileName,"info")) { dini_IntSet(FileName,"info",3); }
	Config[CL_info] = dini_Int(FileName,"info");

	if(!dini_Isset(FileName,"slap")) { dini_IntSet(FileName,"slap",2); }
	Config[CL_slap] = dini_Int(FileName,"slap");

	if(!dini_Isset(FileName,"mute")) { dini_IntSet(FileName,"mute",4); }
	Config[CL_mute] = dini_Int(FileName,"mute");

	if(!dini_Isset(FileName,"unmute")) { dini_IntSet(FileName,"unmute",4); }
	Config[CL_unmute] = dini_Int(FileName,"unmute");

	if(!dini_Isset(FileName,"muteall")) { dini_IntSet(FileName,"muteall",8); }
	Config[CL_muteall] = dini_Int(FileName,"muteall");

	if(!dini_Isset(FileName,"unmuteall")) { dini_IntSet(FileName,"unmuteall",8); }
	Config[CL_unmuteall] = dini_Int(FileName,"unmuteall");

	if(!dini_Isset(FileName,"kick")) { dini_IntSet(FileName,"kick",3); }
	Config[CL_kick] = dini_Int(FileName,"kick");

	if(!dini_Isset(FileName,"kickall")) { dini_IntSet(FileName,"kickall",10); }
	Config[CL_kickall] = dini_Int(FileName,"kickall");

	if(!dini_Isset(FileName,"ban")) { dini_IntSet(FileName,"ban",5); }
	Config[CL_ban] = dini_Int(FileName,"ban");

	if(!dini_Isset(FileName,"banall")) { dini_IntSet(FileName,"banall",10); }
	Config[CL_banall] = dini_Int(FileName,"banall");

	if(!dini_Isset(FileName,"akill")) { dini_IntSet(FileName,"akill",4); }
	Config[CL_akill] = dini_Int(FileName,"akill");

	if(!dini_Isset(FileName,"akillall")) { dini_IntSet(FileName,"akillall",8); }
	Config[CL_akillall] = dini_Int(FileName,"akillall");

	if(!dini_Isset(FileName,"eject")) { dini_IntSet(FileName,"eject",4); }
	Config[CL_eject] = dini_Int(FileName,"eject");

	if(!dini_Isset(FileName,"ejectall")) { dini_IntSet(FileName,"ejectall",8); }
	Config[CL_ejectall] = dini_Int(FileName,"ejectall");

	if(!dini_Isset(FileName,"freeze")) { dini_IntSet(FileName,"freeze",2); }
	Config[CL_freeze] = dini_Int(FileName,"freeze");

	if(!dini_Isset(FileName,"unfreeze")) { dini_IntSet(FileName,"unfreeze",2); }
	Config[CL_unfreeze] = dini_Int(FileName,"unfreeze");

	if(!dini_Isset(FileName,"freezeall")) { dini_IntSet(FileName,"freezeall",8); }
	Config[CL_freezeall] = dini_Int(FileName,"freezeall");

	if(!dini_Isset(FileName,"unfreezeall")) { dini_IntSet(FileName,"unfreezeall",8); }
	Config[CL_unfreezeall] = dini_Int(FileName,"unfreezeall");

	if(!dini_Isset(FileName,"setint")) { dini_IntSet(FileName,"setint",9); }
	Config[CL_setint] = dini_Int(FileName,"setint");

	if(!dini_Isset(FileName,"setallint")) { dini_IntSet(FileName,"setallint",9); }
	Config[CL_setallint] = dini_Int(FileName,"setallint");

	if(!dini_Isset(FileName,"sethealth")) { dini_IntSet(FileName,"sethealth",6); }
	Config[CL_sethealth] = dini_Int(FileName,"sethealth");

	if(!dini_Isset(FileName,"setallhealth")) { dini_IntSet(FileName,"setallhealth",9); }
	Config[CL_setallhealth] = dini_Int(FileName,"setallhealth");

	if(!dini_Isset(FileName,"setskin")) { dini_IntSet(FileName,"setskin",6); }
	Config[CL_setskin] = dini_Int(FileName,"setskin");

	if(!dini_Isset(FileName,"setallskin")) { dini_IntSet(FileName,"setallskin",9); }
	Config[CL_setallskin] = dini_Int(FileName,"setallskin");

	if(!dini_Isset(FileName,"giveweapon")) { dini_IntSet(FileName,"giveweapon",7); }
	Config[CL_giveweapon] = dini_Int(FileName,"giveweapon");

	if(!dini_Isset(FileName,"giveallweapon")) { dini_IntSet(FileName,"giveallweapon",9); }
	Config[CL_giveallweapon] = dini_Int(FileName,"giveallweapon");

	if(!dini_Isset(FileName,"disarm")) { dini_IntSet(FileName,"disarm",6); }
	Config[CL_disarm] = dini_Int(FileName,"disarm");

	if(!dini_Isset(FileName,"disarmall")) { dini_IntSet(FileName,"disarmall",8); }
	Config[CL_disarmall] = dini_Int(FileName,"disarmall");

	if(!dini_Isset(FileName,"resetmoney")) { dini_IntSet(FileName,"resetmoney",6); }
	Config[CL_resetmoney] = dini_Int(FileName,"resetmoney");

	if(!dini_Isset(FileName,"resetallmoney")) { dini_IntSet(FileName,"resetallmoney",8); }
	Config[CL_resetallmoney] = dini_Int(FileName,"resetallmoney");

	if(!dini_Isset(FileName,"setscore")) { dini_IntSet(FileName,"setscore",6); }
	Config[CL_setscore] = dini_Int(FileName,"setscore");

	if(!dini_Isset(FileName,"setallscore")) { dini_IntSet(FileName,"setallscore",8); }
	Config[CL_setallscore] = dini_Int(FileName,"setallscore");

	if(!dini_Isset(FileName,"setlevel")) { dini_IntSet(FileName,"setlevel",10); }
	Config[CL_setlevel] = dini_Int(FileName,"setlevel");

	if(!dini_Isset(FileName,"givemoney")) { dini_IntSet(FileName,"givemoney",7); }
	Config[CL_givemoney] = dini_Int(FileName,"givemoney");

	if(!dini_Isset(FileName,"giveallmoney")) { dini_IntSet(FileName,"giveallmoney",8); }
	Config[CL_giveallmoney] = dini_Int(FileName,"giveallmoney");

	if(!dini_Isset(FileName,"setmoney")) { dini_IntSet(FileName,"setmoney",7); }
	Config[CL_setmoney] = dini_Int(FileName,"setmoney");

	if(!dini_Isset(FileName,"setallmoney")) { dini_IntSet(FileName,"setallmoney",8); }
	Config[CL_setallmoney] = dini_Int(FileName,"setallmoney");

	if(!dini_Isset(FileName,"setarmor")) { dini_IntSet(FileName,"setarmor",6); }
	Config[CL_setarmor] = dini_Int(FileName,"setarmor");

	if(!dini_Isset(FileName,"setallarmor")) { dini_IntSet(FileName,"setallarmor",8); }
	Config[CL_setallarmor] = dini_Int(FileName,"setallarmor");

	if(!dini_Isset(FileName,"details")) { dini_IntSet(FileName,"details",8); }
	Config[CL_details] = dini_Int(FileName,"details");

	if(!dini_Isset(FileName,"boom")) { dini_IntSet(FileName,"boom",8); }
	Config[CL_boom] = dini_Int(FileName,"boom");

	if(!dini_Isset(FileName,"boomall")) { dini_IntSet(FileName,"boomall",9); }
	Config[CL_boomall] = dini_Int(FileName,"boomall");

	if(!dini_Isset(FileName,"settime")) { dini_IntSet(FileName,"settime",4); }
	Config[CL_settime] = dini_Int(FileName,"settime");

	if(!dini_Isset(FileName,"setwanted")) { dini_IntSet(FileName,"setwanted",6); }
	Config[CL_setwanted] = dini_Int(FileName,"setwanted");

	if(!dini_Isset(FileName,"setallwanted")) { dini_IntSet(FileName,"setallwanted",8); }
	Config[CL_setallwanted] = dini_Int(FileName,"setallwanted");

	if(!dini_Isset(FileName,"setgravity")) { dini_IntSet(FileName,"setgravity",9); }
	Config[CL_setgravity] = dini_Int(FileName,"setgravity");

	if(!dini_Isset(FileName,"color")) { dini_IntSet(FileName,"color",5); }
	Config[CL_color] = dini_Int(FileName,"color");

	if(!dini_Isset(FileName,"setweather")) { dini_IntSet(FileName,"setweather",9); }
	Config[CL_setweather] = dini_Int(FileName,"setweather");

	if(!dini_Isset(FileName,"lockserv")) { dini_IntSet(FileName,"lockserv",10); }
	Config[CL_lockserv] = dini_Int(FileName,"lockserv");

	if(!dini_Isset(FileName,"search")) { dini_IntSet(FileName,"search",2); }
	Config[CL_search] = dini_Int(FileName,"search");

	if(!dini_Isset(FileName,"vcolor")) { dini_IntSet(FileName,"vcolor",6); }
	Config[CL_vcolor] = dini_Int(FileName,"vcolor");

	if(!dini_Isset(FileName,"vhealth")) { dini_IntSet(FileName,"vhealth",6); }
	Config[CL_vhealth] = dini_Int(FileName,"vhealth");

	if(!dini_Isset(FileName,"gmx")) { dini_IntSet(FileName,"gmx",9); }
	Config[CL_gmx] = dini_Int(FileName,"gmx");

	if(!dini_Isset(FileName,"getcar")) { dini_IntSet(FileName,"getcar",9); }
	Config[CL_details] = dini_Int(FileName,"getcar");

	if(!dini_Isset(FileName,"goto")) { dini_IntSet(FileName,"goto",2); }
	Config[CL_goto] = dini_Int(FileName,"goto");

	if(!dini_Isset(FileName,"get")) { dini_IntSet(FileName,"get",2); }
	Config[CL_get] = dini_Int(FileName,"get");

	if(!dini_Isset(FileName,"getall")) { dini_IntSet(FileName,"getall",6); }
	Config[CL_getall] = dini_Int(FileName,"getall");

	if(!dini_Isset(FileName,"getc")) { dini_IntSet(FileName,"getc",2); }
	Config[CL_getc] = dini_Int(FileName,"getc");

	if(!dini_Isset(FileName,"spec")) { dini_IntSet(FileName,"spec",3); }
	Config[CL_spec] = dini_Int(FileName,"spec");

	if(!dini_Isset(FileName,"specoff")) { dini_IntSet(FileName,"specoff",3); }
	Config[CL_specoff] = dini_Int(FileName,"specoff");

	if(!dini_Isset(FileName,"jail")) { dini_IntSet(FileName,"jail",2); }
	Config[CL_jail] = dini_Int(FileName,"jail");

	if(!dini_Isset(FileName,"unjail")) { dini_IntSet(FileName,"unjail",2); }
	Config[CL_unjail] = dini_Int(FileName,"unjail");

	if(!dini_Isset(FileName,"jailall")) { dini_IntSet(FileName,"jailall",2); }
	Config[CL_jailall] = dini_Int(FileName,"jailall");

	if(!dini_Isset(FileName,"unjailall")) { dini_IntSet(FileName,"unjailall",2); }
	Config[CL_unjailall] = dini_Int(FileName,"unjailall");

	if(!dini_Isset(FileName,"god")) { dini_IntSet(FileName,"god",6); }
	Config[CL_god] = dini_Int(FileName,"god");

	if(!dini_Isset(FileName,"ungod")) { dini_IntSet(FileName,"ungod",6); }
	Config[CL_ungod] = dini_Int(FileName,"ungod");

	if(!dini_Isset(FileName,"setname")) { dini_IntSet(FileName,"setname",8); }
	Config[CL_setname] = dini_Int(FileName,"setname");

	if(!dini_Isset(FileName,"admins")) { dini_IntSet(FileName,"admins",1); }
	Config[CL_admins] = dini_Int(FileName,"admins");

	if(!dini_Isset(FileName,"report")) { dini_IntSet(FileName,"report",1); }
	Config[CL_report] = dini_Int(FileName,"report");

	if(!dini_Isset(FileName,"lol")) { dini_IntSet(FileName,"lol",9); }
	Config[CL_lol] = dini_Int(FileName,"lol");

	if(!dini_Isset(FileName,"lolall")) { dini_IntSet(FileName,"lolall",10); }
	Config[CL_lolall] = dini_Int(FileName,"lolall");

	if(!dini_Isset(FileName,"getlevel")) { dini_IntSet(FileName,"getlevel",1); }
	Config[CL_getlevel] = dini_Int(FileName,"getlevel");

	if(!dini_Isset(FileName,"pspawn")) { dini_IntSet(FileName,"pspawn",2); }
	Config[CL_pspawn] = dini_Int(FileName,"pspawn");

	if(!dini_Isset(FileName,"pspawnall")) { dini_IntSet(FileName,"pspawnall",6); }
	Config[CL_pspawnall] = dini_Int(FileName,"pspawnall");

	if(!dini_Isset(FileName,"lockchat")) { dini_IntSet(FileName,"lockchat",7); }
	Config[CL_lockchat] = dini_Int(FileName,"lockchat");

	if(!dini_Isset(FileName,"unlockchat")) { dini_IntSet(FileName,"unlockchat",7); }
	Config[CL_unlockchat] = dini_Int(FileName,"unlockchat");

	if(!dini_Isset(FileName,"clear")) { dini_IntSet(FileName,"clear",10); }
	Config[CL_clear] = dini_Int(FileName,"clear");

	if(!dini_Isset(FileName,"changepass")) { dini_IntSet(FileName,"changepass",1); }
	Config[CL_changepass] = dini_Int(FileName,"changepass");

	if(!dini_Isset(FileName,"jetpack")) { dini_IntSet(FileName,"jetpack",8); }
	Config[CL_jetpack] = dini_Int(FileName,"jetpack");

	if(!dini_Isset(FileName,"flip")) { dini_IntSet(FileName,"flip",2); }
	Config[CL_flip] = dini_Int(FileName,"flip");

	if(!dini_Isset(FileName,"flipall")) { dini_IntSet(FileName,"flipall",6); }
	Config[CL_flipall] = dini_Int(FileName,"flipall");

	if(!dini_Isset(FileName,"component")) { dini_IntSet(FileName,"component",7); }
	Config[CL_component] = dini_Int(FileName,"component");

	if(!dini_Isset(FileName,"cc")) { dini_IntSet(FileName,"cc",2); }
	Config[CL_cc] = dini_Int(FileName,"cc");

	if(!dini_Isset(FileName,"invisible")) { dini_IntSet(FileName,"invisible",2); }
	Config[CL_invisible] = dini_Int(FileName,"invisible");

	if(!dini_Isset(FileName,"bigbang")) { dini_IntSet(FileName,"bigbang",7); }
	Config[CL_bigbang] = dini_Int(FileName,"bigbang");

	if(!dini_Isset(FileName,"bigbangall")) { dini_IntSet(FileName,"bigbangall",8); }
	Config[CL_bigbangall] = dini_Int(FileName,"bigbangall");

	if(!dini_Isset(FileName,"diehard")) { dini_IntSet(FileName,"diehard",7); }
	Config[CL_diehard] = dini_Int(FileName,"diehard");

	if(!dini_Isset(FileName,"removemoney")) { dini_IntSet(FileName,"removemoney",7); }
	Config[CL_removemoney] = dini_Int(FileName,"removemoney");

	if(!dini_Isset(FileName,"removeallmoney")) { dini_IntSet(FileName,"removeallmoney",8); }
	Config[CL_removeallmoney] = dini_Int(FileName,"removeallmoney");

	if(!dini_Isset(FileName,"loadfs")) { dini_IntSet(FileName,"loadfs",10); }
	Config[CL_loadfs] = dini_Int(FileName,"loadfs");

	if(!dini_Isset(FileName,"unloadfs")) { dini_IntSet(FileName,"unloadfs",10); }
	Config[CL_unloadfs] = dini_Int(FileName,"unloadfs");

	if(!dini_Isset(FileName,"changemode")) { dini_IntSet(FileName,"changemode",10); }
	Config[CL_changemode] = dini_Int(FileName,"changemode");

	if(!dini_Isset(FileName,"reloadbans")) { dini_IntSet(FileName,"reloadbans",10); }
	Config[CL_reloadbans] = dini_Int(FileName,"reloadbans");

	if(!dini_Isset(FileName,"reloadlogs")) { dini_IntSet(FileName,"reloadlogs",10); }
	Config[CL_reloadlogs] = dini_Int(FileName,"reloadlogs");

	if(!dini_Isset(FileName,"exit")) { dini_IntSet(FileName,"exit",10); }
	Config[CL_exit] = dini_Int(FileName,"exit");

	if(!dini_Isset(FileName,"lockrcon")) { dini_IntSet(FileName,"lockrcon",10); }
	Config[CL_lockrcon] = dini_Int(FileName,"lockrcon");

	if(!dini_Isset(FileName,"unlockrcon")) { dini_IntSet(FileName,"unlockrcon",10); }
	Config[CL_unlockrcon] = dini_Int(FileName,"unlockrcon");

	if(!dini_Isset(FileName,"gamemodetext")) { dini_IntSet(FileName,"gamemodetext",10); }
	Config[CL_gamemodetext] = dini_Int(FileName,"gamemodetext");

	if(!dini_Isset(FileName,"hostname")) { dini_IntSet(FileName,"hostname",10); }
	Config[CL_hostname] = dini_Int(FileName,"hostname");

	if(!dini_Isset(FileName,"lanmode")) { dini_IntSet(FileName,"lanmode",10); }
	Config[CL_lanmode] = dini_Int(FileName,"lanmode");

	if(!dini_Isset(FileName,"mapname")) { dini_IntSet(FileName,"mapname",10); }
	Config[CL_mapname] = dini_Int(FileName,"mapname");

	if(!dini_Isset(FileName,"serverpassword")) { dini_IntSet(FileName,"serverpassword",10); }
	Config[CL_serverpassword] = dini_Int(FileName,"serverpassword");

	if(!dini_Isset(FileName,"weburl")) { dini_IntSet(FileName,"weburl",10); }
	Config[CL_weburl] = dini_Int(FileName,"weburl");

	if(!dini_Isset(FileName,"countdown")) { dini_IntSet(FileName,"countdown",4); }
	Config[CL_countdown] = dini_Int(FileName,"countdown");

	if(!dini_Isset(FileName,"setkills")) { dini_IntSet(FileName,"setkills",7); }
	Config[CL_setkills] = dini_Int(FileName,"setkills");

	if(!dini_Isset(FileName,"resetkills")) { dini_IntSet(FileName,"resetkills",7); }
	Config[CL_resetkills] = dini_Int(FileName,"resetkills");
	
	if(!dini_Isset(FileName,"setdeaths")) { dini_IntSet(FileName,"setdeaths",7); }
	Config[CL_setdeaths] = dini_Int(FileName,"setdeaths");

	if(!dini_Isset(FileName,"resetdeaths")) { dini_IntSet(FileName,"resetdeaths",7); }
	Config[CL_resetdeaths] = dini_Int(FileName,"resetdeaths");
	
	if(!dini_Isset(FileName,"pcommands")) { dini_IntSet(FileName,"pcommands",2); }
	Config[CL_pcommands] = dini_Int(FileName,"pcommands");

	if(!dini_Isset(FileName,"ppms")) { dini_IntSet(FileName,"ppms",3); }
	Config[CL_ppms] = dini_Int(FileName,"ppms");
	return 1;
}
//=CreateLogFiles=================================================================
public CreateLogFiles()
{
    if(!dini_Exists("IPTAdminMode2/Logs/InitExit.txt"))
	{
		dini_Create("IPTAdminMode2/Logs/InitExit.txt");
		print("\"IPTAdminMode2/Logs/InitExit.txt\" created.");
	}
	
    if(!dini_Exists("IPTAdminMode2/Logs/Connects.txt"))
	{
		dini_Create("IPTAdminMode2/Logs/Connects.txt");
		print("\"IPTAdminMode2/Logs/Connects.txt\" created.");
	}
	
    if(!dini_Exists("IPTAdminMode2/Logs/AdminChat.txt"))
	{
		dini_Create("IPTAdminMode2/Logs/AdminChat.txt");
		print("\"IPTAdminMode2/Logs/AdminChat.txt\" created.");
	}
	
    if(!dini_Exists("IPTAdminMode2/Logs/Chat.txt"))
	{
		dini_Create("IPTAdminMode2/Logs/Chat.txt");
		print("\"IPTAdminMode2/Logs/Chat.txt\" created.");
	}
	
    if(!dini_Exists("IPTAdminMode2/Logs/PMs.txt"))
	{
		dini_Create("IPTAdminMode2/Logs/PMs.txt");
		print("\"IPTAdminMode2/Logs/PMs.txt\" created.");
	}
	
    if(!dini_Exists("IPTAdminMode2/Logs/CMDs.txt"))
	{
		dini_Create("IPTAdminMode2/Logs/CMDs.txt");
		print("\"IPTAdminMode2/Logs/CMDs.txt\" created.");
	}
	
    if(!dini_Exists("IPTAdminMode2/Logs/Reports.txt"))
	{
		dini_Create("IPTAdminMode2/Logs/Reports.txt");
		print("\"IPTAdminMode2/Logs/Reports.txt\" created.");
	}
	
    if(!dini_Exists("IPTAdminMode2/Logs/Kicks.txt"))
	{
		dini_Create("IPTAdminMode2/Logs/Kicks.txt");
		print("\"IPTAdminMode2/Logs/Kicks.txt\" created.");
	}
	
    if(!dini_Exists("IPTAdminMode2/Logs/Bans.txt"))
	{
		dini_Create("IPTAdminMode2/Logs/Bans.txt");
		print("\"IPTAdminMode2/Logs/Bans.txt\" created.");
	}
	return 1;
}
//=CheckPingNCheats=============================================================
public CheckPingNCheats()
{
    for(new i=0;i<MAX_PLAYERS;i++)
    {
	    if(IsPlayerConnected(i))
	    {
		    if(GetPlayerPing(i) > ServerInfo[MaxPing] && ServerInfo[MaxPing] != 0)
		    {
		        new string[256];
		        format(string,sizeof(string),"High ping, maximum: %d",ServerInfo[MaxPing]);
		        SetKick(i,string);
		    }

		    if(GetPlayerMoney(i) > ServerInfo[MaxMoney] && PlayerInfo[i][Command] == 0 && ServerInfo[MaxMoney] != 0)
		    {
		        new string[256];
		        format(string,sizeof(string),"%d money, maximum: %d$",GetPlayerMoney(i),ServerInfo[MaxMoney]);
		        SetKick(i,string);
		    }

		    new Float:health;
		    GetPlayerHealth(i,health);
		    if(health > ServerInfo[MaxHealth] && PlayerInfo[i][Godmode] == 0 && ServerInfo[MaxHealth] != 0)
		    {
		        new string[256];
		        format(string,sizeof(string),"Godmode, maximum health: %d",GetPlayerMoney(i),ServerInfo[MaxHealth]);
		        SetKick(i,string);
		    }
	    }
    }
	return 1;
}
//=GodmodeSystem================================================================
public GodmodeSystem(playerid)
{
	new Float:health;
	GetPlayerHealth(playerid,health);
	if(health != 100000)
	{
	    SetPlayerHealth(playerid,100000);
	}
	return 1;
}
//=Diehard======================================================================
public Diehard(playerid)
{
	new Float:health;
	GetPlayerHealth(playerid,health);
	if(health != 0.0)
	{
	    SetPlayerHealth(playerid,health-1);
	}
	else if(health == 0.0)
	{
	    KillTimer(timer3);
	}
	return 1;
}
//=IsNumber=====================================================================
public IsNumber(string[])
{
	for(new i=0,j=strlen(string); i<j;i++)
	{
		if(string[i] > '9' || string[i] < '0')
		{
			return 0;
		}
	}
	return 1;
}
//=Sound========================================================================
public Sound(playerid,soundid)
{
	new Float:X,Float:Y,Float:Z;
	GetPlayerPos(playerid,X,Y,Z);
	PlayerPlaySound(playerid,soundid,X,Y,Z);
	return 1;
}
//=AddLogLine===================================================================
public AddLogLine(filename[],text[])
{
	new File:IPTAdminMode_file;
	new filestring[256];
	new string[256];
	new year,month,day;
	new hour,minute,second;
	getdate(year,month,day);
	gettime(hour,minute,second);
	format(filestring,sizeof(filestring),"IPTAdminMode2/Logs/%s.txt",filename);
	IPTAdminMode_file = fopen(filestring,io_append);
	format(string,sizeof(string),"[%d.%d.%d %d:%d] %s\n",year,month,day,hour,minute,text);
	fwrite(IPTAdminMode_file,string);
	fclose(IPTAdminMode_file);
	return 1;
}
//=GetPlayerID==================================================================
public GetPlayerID(name[])
{
	for(new i=0;i<MAX_PLAYERS;i++)
	{
		if(IsPlayerConnected(i))
		{
			new Pname[MAX_PLAYER_NAME];
			GetPlayerName(i,Pname,sizeof(Pname));
			if(strcmp(Pname,name,true) == 0)
			{
				return i;
			}
		}
	}
	return INVALID_PLAYER_ID;
}
//=CountDown====================================================================
public CountDown()
{
	if(cd_seconds == 0)
	{
		GameTextForAll("~r~Go!",1000,1);
		KillTimer(timer4);
		if(cd_freeze == 1)
		{
			for(new i=0;i<MAX_PLAYERS;i++)
			{
				if(IsPlayerConnected(i))
				{
					TogglePlayerControllable(i,1);
	 			}
			}
		}
	}
	else
	{
		new cd_string[256];
		format(cd_string,sizeof(cd_string),"~b~%d",cd_seconds);
		GameTextForAll(cd_string,1000,1);
	}
	cd_seconds = cd_seconds-1;
	return;
}
//=IPTAdminMode_messages========================================================
IPTAdminMode_messages(const string[], index)
{
	new length = strlen(string);

	new offset = index;
	new result[256];
	while ((index < length) && ((index - offset) < (sizeof(result) - 1)) && (string[index] > '\r'))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}
//=IPTAdminMode_strtok==========================================================
IPTAdminMode_strtok(const string[], &index)
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
//=OnPlayerRegister=============================================================
public OnPlayerRegister(playerid)
{
	/*
		Custom Callback
	*/
	return 1;
}
//=OnPlayerLogin================================================================
public OnPlayerLogin(playerid)
{
	/*
		Custom Callback
	*/
	return 1;
}


//=OnPlayerLogout===============================================================
public OnPlayerLogout(playerid)
{
	/*
		Custom Callback
	*/
	return 1;
}
/*<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<> THE END <>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/


