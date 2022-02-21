/*
  - Mode TYPE: FFJTDM. (Familys, Factions, Jobs, Team Death Match )
  - Version :0.2
  - Date Build :13/8/2009
  - Create: JoeShk
  - Type: GTA SanAndreas:Multiplayer 0.2X
*/

#include "a_samp"
#include "dini"
#include "DUDB"
//#include "YSF"
#include "cpstream"
#include "streamer"
#pragma unused strtok
#pragma unused ret_memcpy
#pragma dynamic 14500
enum AC
{
   Float:health,
   Float:armour,
   bool:_sWeapons[38]
};
stock AC_Info[MAX_PLAYERS][AC];
new var_Levels[] =
{
  40,
  80,
  120,
  160,
  200,
  240,
  280,
  320,
  360,
  460,
  560,
  600,
  650,
  750,
  900,
  1100,
  1300,
  1500,
  1800,
  2100,
  2500,
  2700,
  3000,
  3200,
  3500,
  3700,
  3900,
  4300,
  4700,
  5000,
  5500,
  5700,
  6000,
  6200,
  6500,
  6800,
  7300,
  7500,
  7900,
  8000,
  8100,
  8200,
  8500,
  9000,
  9500,
  10000
};
main() print("\n Mode Family War's - By JoeShk");
enum Vars { bool: Cop, bool:Logged, bool:Hitman, Heal, bool:Jail, bool:spam, bool: chatbox };
enum Float:drift_Pos { Float:sX,Float:sY,Float:sZ };
new GangZones[24], start_id[5] = -1, WeaponFamily[13], Menu: Weapon,  MenuUse[MAX_PLAYERS][10], MayorID = -1, Security[2] = {-1, ...}, Bank, Ammu, cash_var[MAX_PLAYERS], pickupMission, InMission[MAX_PLAYERS], DidMission[MAX_PLAYERS], CutMissionTimer[MAX_PLAYERS], MoneyCP, Pack[MAX_PLAYERS], last = -1;
new Float:Saveddrift_Pos[MAX_PLAYERS][drift_Pos], bool:DriftMode[MAX_PLAYERS] = false, DriftBonus[MAX_PLAYERS] = {1, ...}, Float:HealthInit[MAX_PLAYERS] = 1000.0, Text:TDLabels, Text:TDValueDrift[MAX_PLAYERS], Text:TDValueBonus[MAX_PLAYERS], DriftTimer[MAX_PLAYERS], DriftPointsNow[MAX_PLAYERS], PlayerDriftCancellation[MAX_PLAYERS], Float:pdrift_Pos[MAX_PLAYERS][3], Text:TDraw[14], kill[MAX_PLAYERS], Text:TInfo[MAX_PLAYERS], Text:DCam[MAX_PLAYERS], DTime[MAX_PLAYERS], KillSpawn[MAX_PLAYERS];
new Float:XBomb,Float:YBomb,Float:ZBomb, bombshop,bombusing[MAX_PLAYERS], hospital, cng_color, Wang, wantedWangExportVehicle, shark[2], mship, be, gateb, nobank;
new wantedWangExportVehicles[25] = { 400, 411, 434, 451, 461, 463, 468, 470, 480, 482, 495, 535, 541, 567, 603, 522, 556, 415, 587, 434, 494, 571, 560 ,420, 506 };
new wantedWangExportVehicleNames[25][32] = { "Landstalker", "Infernus", "Hotknife", "Turismo", "PCJ-600", "Freeway", "Sanchez", "Patriot", "Comet", "Burrito", "SandMayor", "Slamvan", "Bullet", "Savanna", "Phoenix","NRG-500","Monster", "Cheetah","Euros","Hotknife","Hotring","Kart","Sultan","Taxi","Supergt" };
new caller[MAX_PLAYERS] = {0, ...} , callto[MAX_PLAYERS] = {-1, ...}, callid[MAX_PLAYERS] = {-1, ...}, KillCall[MAX_PLAYERS] = {-1, ...}, MoneyCall[MAX_PLAYERS] = {-1, ...}, Specid[MAX_PLAYERS] = {-1, ...}, Float:backpos[MAX_PLAYERS][3], backinterior[MAX_PLAYERS], beginspec[MAX_PLAYERS] = {0, ...}, beginspec2[MAX_PLAYERS], Text:TInfo2[MAX_PLAYERS], Background[MAX_PLAYERS];
new Text:TStar[26], bool:gme, AirAttackTimes[MAX_PLAYERS], firsts[MAX_PLAYERS], ACheat[MAX_PLAYERS];
new BombTrackVehicle, BombTrackMission[MAX_PLAYERS], MissionTrack[MAX_PLAYERS], MissionTrackState = 0, StateMission[MAX_PLAYERS];
new count_bb = 0, count_mission, Hours[MAX_PLAYERS], words[100][MAX_STRING], Ignore[MAX_PLAYERS][MAX_PLAYERS], cancelpm[MAX_PLAYERS], meSpam[MAX_PLAYERS];
new Petid[MAX_PLAYERS][3], petState[MAX_PLAYERS] = {-1, ...}, petTimers[MAX_PLAYERS][3], HoursTime[MAX_PLAYERS];
static gTeam[MAX_PLAYERS], vote[3], qvote[256], alreadyvote[MAX_PLAYERS];
stock ModeInfo[MAX_PLAYERS][Vars];
stock fstr(s[]) return strlen(s) < 49? strval(s):0;
stock Weapons[][32] =
{
	{"Unarmed (Fist)"},
	{"Brass Knuckles"},
	{"Golf Club"},
	{"Night Stick"},
	{"Knife"},
	{"Baseball Bat"},
	{"Shovel"},
	{"Pool Cue"},
	{"Katana"},
	{"Chainsaw"},
	{"Purple Dildo"},
	{"Big White Vibrator"},
	{"Medium White Vibrator"},
	{"Small White Vibrator"},
	{"Flowers"},
	{"Cane"},
	{"Grenade"},
	{"Teargas"},
	{"Molotov"},
	{" "},
	{" "},
	{" "},
	{"Colt 45"},
	{"Colt 45 (Silenced)"},
	{"Desert Eagle"},
	{"Normal Shotgun"},
	{"Sawnoff Shotgun"},
	{"Combat Shotgun"},
	{"Micro Uzi (Mac 10)"},
	{"MP5"},
	{"AK47"},
	{"M4"},
	{"Tec9"},
	{"Country Rifle"},
	{"Sniper Rifle"},
	{"Rocket Launcher"},
	{"Heat-SeeMayor Rocket Launcher"},
	{"Flamethrower"},
	{"Minigun"},
	{"Satchel Charge"},
	{"Detonator"},
	{"Spray Can"},
	{"Fire Extinguisher"},
	{"Camera"},
	{"Night Vision Goggles"},
	{"Infrared Vision Goggles"},
	{"Parachute"},
	{"Fake Pistol"}
};
stock VehiclesName[][] =
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
   "Quadbike",
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
   "SandMayor",
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
enum pickup
{
	creation_time,
	weapon,
	ammo,
	timer
}
new pickups [ 90 ][ pickup ];
new weapons[] =
{
	-1, // no fists
	331, // - Brass Knuckles
	333, // Golf Club
	334, // Night Stick
	335, // Knife
	336, // baseball bat
	337, // shovel
	338, // pool cue
	339, // katama
	341, // chainsaw
	321, // regular dildo
	322, // white dildo
	323, // Medium, white vibrator
	324, // smaill, silver vibrator
	325, // flowers
	326, // cane
	342, // grendade
	343, // tear gas
	344, // molotov
	-1, // RPG rocket - we can't pick up those, do we oO
	-1, // Heat-SeeMayor Rocket
	-1, // Hydra rocket
	346, // colt 45
	347, // colt 45 + silencer
	348, // deagle
	349, // shotgun
	350, // sawn-off
	351, // spaz
	352, // micro-uzi
	353, // mp5
	355, // ak47
	356, // m4
	372, // tec9
	357, // country rifle
	358, // sniper rifle
	359, // rocket launcher
	360, // heat-seeMayor rocket launcher
	361, // flamethrower
	362, // minigun
	363, // sachtel charges
	-1, // detonator
	365, // spray can
	366, // fire extinguisher
	367, // camera
	-1, // night-vision goggles
	-1, // heat-vision goggles
	371 // parachute
};
#define FILE_NAME "CensorWords.txt"
#define function(%1) forward %1; public %1
#define V(%1) \
	1 << (%1-400 & 0x1F)
#define PET_ATTACK 1
#define PET_NORMAL 2
#define GREEN 			0x16EB43FF
#define RED 			0xFF0000AA
#define BLUE 			0x0000ffff
#define WHITE 			0xffffffff
#define GRAY 			0xccccccff
#define YELLOW 			0xffff00ff
#define GOLD 			0xcccc00ff
#define ORANGE  		0xff9900ff
#define LIGHT_BLUE 		0x00ccffff
#define HARD_GREEN 		0x339900ff
#define LIGHT_RED 		0xff0066ff
#define SEA 			0x0099ccff
#define YELLOW_GRAY 	0xcccc00ff
#define VERYLIGHT_BLUE 	0x9999ffff
#define BORDO 			0xff0066ff
#define SKIN_CHAT 		0xccff66ff
#define AQUA 0xFF0000F

#define VCOLOR_CORELONE 2, 2
#define Corelone_TEAM 1
#define Hitman_TEAM 6
#define Cops_TEAM 7
#define Mayor_TEAM 8
#define C_TEAM 9
#define Stunts_TEAM 10
#define Pilot_TEAM 11
#define Drift_TEAM 12
#define GANG1_TEAM 13
#define GANG2_TEAM 14
#define GANG3_TEAM 15
#define GANG4_TEAM 16
#define F_TEAM 17
#define TEAM_MEDIC 18
#define SWAT_TEAM 19
#define WHOERS_TEAM 20
#define ARMY_TEAM 21

#define CORLEONE_SKIN 123
#define Mayor_SKIN 17
#define SECURITY_SKIN 117
#define C_SKIN 120
#define HITMAN_SKIN 165
#define COPS_SKIN1 282
#define COPS_SKIN2 283
#define COPS_SKIN3 288
#define STUNTS_SKIN 100
#define PILOT_SKIN 61
#define DRIFT_SKIN 7
#define GANG1_SKIN 105
#define GANG2_SKIN 260
#define GANG3_SKIN 103
#define GANG4_SKIN 118
#define F_SKIN 158
#define MEDIC_SKIN 274
#define SWAT_SKIN 285
#define WHOERS_SKIN 63
#define ARMY_SKIN 287

#define MAX_MEMMBERS_FACTION 30

#define COLOR_MAYOR rgba2hex(246,89,0, 140)
#define COLOR_SECURITY rgba2hex(108,89,0, 140)

#define COLOR_Corelone_Family rgba2hex(5,171,255, 70)
#define COLOR_HITMAN rgba2hex(56,69,131, 3)
#define COLOR_C rgba2hex(255,3,140, 70)
#define COLOR_STUNTS_GANG rgba2hex(255,24,216, 70)
#define COLOR_PILOT_GANG rgba2hex(5,233,5, 70)
#define GANG_C1 rgba2hex(226,15,101, 70)
#define GANG_C2 rgba2hex(137,15,101, 70)
#define GANG_C3 rgba2hex(137,15,101, 60)
#define GANG_C4 rgba2hex(188,23,228, 70)
#define GANG_C5 rgba2hex(67,61,4, 70)
#define WHOERS_COLOR rgba2hex(249,164,212, 70)
#define F_COLOR rgba2hex(13,86,246, 70)
#define MEDIC_COLOR rgba2hex(102,204,29, 70)
#define SWAT_COLOR rgba2hex(200,255,29, 70)
#define MAIN rgba2hex(0,0,0, 175)
#define DRIFT_MINKAT 10.0
#define DRIFT_MAXKAT 90.0
#define DRIFT_SPEED 25.0
#define MAX_DROP_AMOUNT				-1 // special drop-limits like 500 ammo are possible; -1 = all ammo is dropped
#define MAX_DROP_LIFETIME			30 // after 30 seconds the pickup gets destroyed. Note: old pickups will be destroyed anyway.
#define WEAPON_SLOTS				13
#define INVALID_PICKUP				-1
#define PICKUP_TYPE					19
function(OnPlayerConnect(playerid))
{
  new string[128], date[3];
  getdate(date[2], date[1], date[0]);
  format(string, sizeof string, "/opanel/badnames/%s.ini", GetName(playerid));
  if(dini_Exists(string) || strfind(GetName(playerid),dini_Get(string, "name"), true) != -1)
  {
     SendClientMessage(playerid,0x00FFFFAA,"-----------------------------------------------------------------");
	 format(string, sizeof string,".לשרת \"%s\" :אינך יכול להשתמש בשם", GetName(playerid));
     SendClientMessage(playerid, GREEN, string);
   	 format(string, sizeof string,"%d/%d/%d :תאריך היום", date[0], date[1], date[0]);
     SendClientMessage(playerid, GREEN, string);
     SendClientMessage(playerid, ORANGE, ".כדי להיכנס לשרת החלף שם, שם זה חסום על ידי המערכת");
     SendClientMessage(playerid,0x00FFFFAA,"-----------------------------------------------------------------");
	 SetTimerEx("kickEx", 3*1000, 0, "i", playerid);
     return 0;
  }
  gTeam[playerid] = 0;
  for(new i = 0; i < MAX_PLAYERS; i++) if(IsPlayerConnected(i)) SetPlayerTeam(i, gTeam[i]);
  for(new i = 0; i < 3; i++) Petid[playerid][i] = -1, petTimers[playerid][i] = -1;
  KillTimer(MoneyCall[playerid]);
  format(string,sizeof string,"* %s has joined the server", GetName(playerid));
  SendTextDrawMessageConnect(GRAY, string, 5);
  SendDeathMessage(INVALID_PLAYER_ID,playerid,200);
  Background[playerid] = 1;
  firsts[playerid] = 1;
  HoursTime[playerid] = 0;
  alreadyvote[playerid] = 0;
  meSpam[playerid] = 0;
  MissionTrack[playerid] = 0;
  BombTrackMission[playerid] = 0;
  ModeInfo[playerid][chatbox] = false;
  Specid[playerid] = -1;
  Ignore[playerid][playerid] = 0;
  cancelpm[playerid] = 0;
  cash_var[playerid] = 0;
  beginspec[playerid] = 0;
  bombusing[playerid] = 0;
  AirAttackTimes[playerid] = 0;
  Pack[playerid] = 0;
  InMission[playerid] = 0;
  DidMission[playerid] = 0;
  KillTimer(kill[playerid]);
  TInfo[playerid] = TextDrawCreate(325,310," "); // 325, 235
  TextDrawTextSize(TInfo[playerid],550,550); // 550, 550
  TextDrawAlignment(TInfo[playerid],2);
  TextDrawFont(TInfo[playerid],1);
  TextDrawLetterSize(TInfo[playerid],0.399999,1.000000); // 99999
  TextDrawColor(TInfo[playerid],GRAY);
  TextDrawSetOutline(TInfo[playerid],1);
  TextDrawSetProportional(TInfo[playerid],1);
  TextDrawSetShadow(TInfo[playerid],1);
  TextDrawUseBox(TInfo[playerid],1);
  TextDrawBoxColor(TInfo[playerid],rgba2hex(0,0,0, 150));
  if(dini_Exists(GetPlayerFile(playerid))) hideTDraw(playerid);
  if(!dini_Exists(GetPlayerFile(playerid)))
  {
    format(string,sizeof string,"San Fierro: Team DeathMatch~n~Mode Version: 0.1~n~Revision: 1~n~Date: %d/%d/%d~n~", date[0],date[1],date[2]);
    TextDrawSetString(TDraw[9], string);
    TextDrawShowForPlayer(playerid,TDraw[0]);
    TextDrawShowForPlayer(playerid,TDraw[1]);
    TextDrawShowForPlayer(playerid,TDraw[7]);
    TextDrawShowForPlayer(playerid,TDraw[8]);
    TextDrawShowForPlayer(playerid,TDraw[9]);
    TextDrawHideForPlayer(playerid,TDraw[10]);
    kill[playerid] = SetTimerEx("hideTDraw",17*1000,0,"i",playerid);
  }
  DCam[playerid] = TextDrawCreate(325,310,"   "); // 325, 235
  TextDrawTextSize(DCam[playerid],550,550); // 550, 550
  TextDrawAlignment(DCam[playerid],2);
  TextDrawFont(DCam[playerid],1);
  TextDrawLetterSize(DCam[playerid],0.399999,1.000000); // 99999
  TextDrawColor(DCam[playerid],GRAY);
  TextDrawSetOutline(DCam[playerid],1);
  TextDrawSetProportional(DCam[playerid],1);
  TextDrawSetShadow(DCam[playerid],1);
  TInfo2[playerid] = TextDrawCreate(335.000000,150.000000," "); // 325, 235
  TextDrawTextSize(TInfo2[playerid],550,550); // 550, 550
  TextDrawAlignment(TInfo2[playerid],2);
  TextDrawFont(TInfo2[playerid],1);
  TextDrawLetterSize(TInfo2[playerid],0.399999,1.000000); // 99999
  TextDrawColor(TInfo2[playerid],GRAY);
  TextDrawSetProportional(TInfo2[playerid],1);
  TextDrawSetShadow(TInfo2[playerid],1);
  KillTimer(Hours[playerid]);
  Hours[playerid] = SetTimerEx("setHourTime",60*60*1000, false, "i", playerid);
  ACheat[playerid] = SetTimerEx("AntiCheat", 1000, true, "i", playerid);
  if(playerid == MayorID)
  {
	  format(string,sizeof string,"!עזב את התפקיד, לך תהיה מהר ראש עיר %s - שימו לב תושבים, ראש העיר",GetName(playerid));
	  SendClientMessageToAll(YELLOW, string);
  	  format(string,sizeof string,"~Y~Attention mayor: %s leave her postion!",GetName(playerid));
	  SendTextDrawMessageToAll(GRAY, string, 5);
	  MayorID = -1;
  }
  ModeInfo[playerid][Logged] = false;
  ModeInfo[playerid][Cop] = false;
  ModeInfo[playerid][Hitman] = false;
  ModeInfo[playerid][Jail] = false;
  ModeInfo[playerid][spam] = false;
  ModeInfo[playerid][Heal] = 0;
  dini_Set(GetPlayerFile(playerid),"IFamily", "None");
  dini_Set(GetPlayerFile(playerid),"Job", "None");
  dini_Set(GetPlayerFile(playerid),"Gang", "None");
  return 1;
}
function(OnPlayerDisconnect(playerid, reason))
{
  new string[128];
  if(MissionTrack[playerid])
  {
	 format(string, sizeof string,"!Jizzy Club נכשל במשימת פיצוץ %s :השחקן", GetName(playerid));
	 SendClientMessageToAll(GREEN, string);
 	 EndMission(playerid, false);
  }
  KillTimer(beginspec2[playerid]);
  for(new i = 0; i < sizeof start_id; i++)
  {
      if(playerid == start_id[i])
      {
           GangZoneStopFlashForAll(GangZones[i]);
           start_id[i] = -1;
           continue;
      }
  }
  if(InMission[playerid]) CutMission(playerid);
  if(playerid == Security[0] || playerid == Security[1])
  {
      if(Security[0] == playerid) Security[0] = -1;
      if(Security[1] == playerid) Security[1] = -1;
      SendClientMessageToAll(COLOR_SECURITY,"!שימו לב, אם אתה רוצה להיות מאבטחים של ראש העיר זאתי ההזדמנות שלכם");
      SendTextDrawMessageToAll(GRAY, "~P~Attention if are you want to be the security of the Mayor, this is you're opportunity!" , 5);
  }
  if(caller[playerid] == 1)
  {
     SendClientMessage(playerid, RED,".השיחה נותקה בגלל שהשחקן התנתק מהשרת");
     SendClientMessage(callto[playerid], RED,".השיחה נותקה בגלל שהשחקן התנתק מהשרת");
     SendTextDrawMessage2(callto[playerid], "~y~ The call was hangup Reason: Disconnected", 3);
     SendTextDrawMessage2(playerid, "~y~ The call was hangup Reason: Disconnected", 3);
	 caller[callto[playerid]] = 0;
	 callto[callto[playerid]] = -1;
	 callid[callto[playerid]] = -1;
	 caller[playerid] = 0;
	 callto[playerid] = -1;
	 callid[playerid] = -1;
	 KillTimer(MoneyCall[playerid]);
  }
  for(new i = 0; i < sizeof GangZones; i++) GangZoneHideForPlayer(playerid, GangZones[i]);
  TextDrawHideForPlayer(playerid, TInfo[playerid]);
  TextDrawDestroy(TInfo[playerid]);
  SendDeathMessage(INVALID_PLAYER_ID,playerid,201);
  resetPet(playerid);
  return 1;
}
function(OnPlayerRequestSpawn(playerid))
{
  new string[128];
  SetPlayerColor(playerid, GRAY);
  if(Background[playerid]) return 0;
  PlayerPlaySound(playerid,1058, 0.0, 0.0, 0.0);
  dini_Set(GetPlayerFile(playerid),"IFamily", "None");
  dini_Set(GetPlayerFile(playerid),"Job", "None");
  dini_Set(GetPlayerFile(playerid),"Gang", "None");
  ModeInfo[playerid][Cop] = false;
  ModeInfo[playerid][Hitman] = false;
  if(!ModeInfo[playerid][Logged]) return SendClientMessage(playerid,GRAY,dini_Exists(GetPlayerFile(playerid))? ("/Login [password] :לפני שתתחיל לשחק, תתחבר לשחקן שלך") :("/Register [password] :לפני שתתחיל לשחק תצטרף להירשם")),0;
  if(GetPlayerSkin(playerid) == Mayor_SKIN)
  {
       if(MayorID != -1) return SendClientMessage(playerid,GRAY,".אינך יכול להיות ראש העיר כעת בגלל שיש כבר ראש העיר"),0;
       dini_Set(GetPlayerFile(playerid),"Job","Mayor");
	   SendClientMessage(playerid, LIGHT_RED, ",שלום לך ראש העיר! ראש העיר, עבודה אשר תרוויח בה הרבה כסף - תלוי כמה תושבים יש בשרת");
	   SendClientMessage(playerid, LIGHT_RED, ",כל 10 דקות תקבל 600 דולר על כל שחקן שנמצא בשרת, שחקן אשר יהרוג אותך יהפוך להיות ראש העיר במקומך");
	   SendClientMessage(playerid, LIGHT_RED, ",המטרה שלך היא לנסות לברוח מהם בעזרת המאבטחים שלך");
	   SendClientMessage(playerid, LIGHT_RED,",במידה ואין לך מאבטחים אינך מוגן ועלול למות בכל רגע");
	   SendClientMessage(playerid,GRAY,"!מותר לך לתקוף רק אנשים שמנסים לתקוף אותך *");
       SendClientMessage(playerid,GOLD,"'@' / '!' - על מנת לתקשר עם האנשים העובדים איתך");
       _SetSpawnInfo(playerid,Mayor_TEAM, GetPlayerSkin(playerid), -2279.4321,2288.1311,4.9644,177.7416, 24, 500, 0, 0, 0, 0);
       gTeam[playerid] = Mayor_TEAM;
       MayorID = playerid;
       SetPlayerColor(playerid, COLOR_MAYOR);
	   format(string,sizeof string,"!נכנס בתפקיד ראש העיר, המטרה שלכם היא לנסות להרוג אותו, שחקן שיהרוג אותו יהיה ראש העיר במקומו %s השחקן",GetName(playerid));
       SendClientMessageToAll( YELLOW, string);
	   SendClientMessageToAll( YELLOW, "!שימו לב, ראש העיר צריך מאבטחים, רוצים להיות המאבטחים שלו? בחרו את הדמות של המאבטח");
	   format(string,sizeof string,"!ראש העיר מופיע במפה בצבע של הודעה זו");
	   SendClientMessageToAll(COLOR_MAYOR, string);
  }
  if(GetPlayerSkin(playerid) == GANG1_SKIN)
  {
	 if(getOnlineVar("Gang","Gang City") == MAX_MEMMBERS_FACTION) return SendClientMessage(playerid,GRAY,".אתה לא יכול להצטרף לפיקשיין הזה הוא מלא 30/30"),0;
     dini_Set(GetPlayerFile(playerid),"Gang","Gang City");
     format(string,sizeof string,",המטרה שלך היא לנסות להילחם במשפחות פשע / גאנגים אחרים ,%s שלום לך, אתה כעת נמצא בגאנג",dini_Get(GetPlayerFile(playerid),"Gang"));
     SendClientMessage(playerid, 0x00FFFFAA, string);
     SendClientMessage(playerid, 0x00FFFFAA, "!כל פעם תתחיל באיזור הזה, יש לך פה את הציוד שאתה צריך, בהצלחה");
     SendClientMessage(playerid,GOLD,"'@' / '!' - על מנת לתקשר עם המשפחה שלך כתוב לפני כל הודעה");
	 SetPlayerColor(playerid, GANG_C1);
     _SetSpawnInfo(playerid,GANG1_TEAM, GANG1_SKIN,2177.8203,1107.2645,23.3359,242.5979, 31, 500, 28, 300, 28, 150);
     gTeam[playerid] = GANG1_TEAM;
  }
  if(GetPlayerSkin(playerid) == WHOERS_SKIN)
  {
	 if(getOnlineVar("Gang","Whoers") == MAX_MEMMBERS_FACTION) return SendClientMessage(playerid,GRAY,".אתה לא יכול להצטרף לפיקשיין הזה הוא מלא 30/30"),0;
     dini_Set(GetPlayerFile(playerid),"Gang","Whoers");
     format(string,sizeof string,",המטרה שלך היא לנסות להילחם במשפחות פשע / גאנגים אחרים ,%s שלום לך, אתה כעת נמצא בגאנג",dini_Get(GetPlayerFile(playerid),"Gang"));
     SendClientMessage(playerid, 0x00FFFFAA, string);
     SendClientMessage(playerid, 0x00FFFFAA, "!כל פעם תתחיל באיזור הזה, יש לך פה את הציוד שאתה צריך, בהצלחה");
     SendClientMessage(playerid,GOLD,"'@' / '!' - על מנת לתקשר עם המשפחה שלך כתוב לפני כל הודעה");
	 SetPlayerColor(playerid, WHOERS_COLOR);
	 _SetSpawnInfo(playerid, WHOERS_TEAM, WHOERS_SKIN,-2162.6309,-224.1107,36.5156,0.3859, 24, 100, 28, 300, 31, 300);
	 gTeam[playerid] = WHOERS_TEAM;
  }
  if(GetPlayerSkin(playerid) == F_SKIN)
  {
	 if(getOnlineVar("Gang","Farmers") == MAX_MEMMBERS_FACTION) return SendClientMessage(playerid,GRAY,".אתה לא יכול להצטרף לפיקשיין הזה הוא מלא 30/30"),0;
     dini_Set(GetPlayerFile(playerid),"Gang","Farmers");
     format(string,sizeof string,",המטרה שלך היא לנסות להילחם במשפחות פשע / גאנגים אחרים ,%s שלום לך, אתה כעת נמצא בגאנג",dini_Get(GetPlayerFile(playerid),"Gang"));
     SendClientMessage(playerid, 0x00FFFFAA, string);
     SendClientMessage(playerid, 0x00FFFFAA, "!כל פעם תתחיל באיזור הזה, יש לך פה את הציוד שאתה צריך, בהצלחה");
     SendClientMessage(playerid,GOLD,"'@' / '!' - על מנת לתקשר עם המשפחה שלך כתוב לפני כל הודעה");
	 SetPlayerColor(playerid, F_COLOR);
     _SetSpawnInfo(playerid, F_TEAM, F_SKIN, -381.481, -1438.98, 25.675, 0, 33, 500, 32, 200, 37, 300);
     gTeam[playerid] = F_TEAM;
  }
  if(GetPlayerSkin(playerid) == MEDIC_SKIN)
  {
	 if(getOnlineVar("Gang","Medices") == MAX_MEMMBERS_FACTION) return SendClientMessage(playerid,GRAY,".אתה לא יכול להצטרף לפיקשיין הזה הוא מלא 30/30"),0;
     dini_Set(GetPlayerFile(playerid),"Gang","Medices");
     format(string,sizeof string,",המטרה שלך היא לנסות להילחם במשפחות פשע / גאנגים אחרים ,%s שלום לך, אתה כעת נמצא בגאנג",dini_Get(GetPlayerFile(playerid),"Gang"));
     SendClientMessage(playerid, 0x00FFFFAA, string);
     SendClientMessage(playerid, 0x00FFFFAA, "!כל פעם תתחיל באיזור הזה, יש לך פה את הציוד שאתה צריך, בהצלחה");
     SendClientMessage(playerid,GOLD,"'@' / '!' - על מנת לתקשר עם המשפחה שלך כתוב לפני כל הודעה");
	 SetPlayerColor(playerid, MEDIC_COLOR);
  	 _SetSpawnInfo(playerid, TEAM_MEDIC, MEDIC_SKIN, -2654.6455,634.5966,14.4531,175.1637, 33, 100, 29, 100, 23, 50);
  	 gTeam[playerid] = TEAM_MEDIC;
  }
  if(GetPlayerSkin(playerid) == SWAT_SKIN)
  {
	 if(getOnlineVar("Gang","SF SWAT") == MAX_MEMMBERS_FACTION) return SendClientMessage(playerid,GRAY,".אתה לא יכול להצטרף לפיקשיין הזה הוא מלא 30/30"),0;
     dini_Set(GetPlayerFile(playerid),"Gang","SF SWAT");
     format(string,sizeof string,",המטרה שלך היא לנסות להילחם במשפחות פשע / גאנגים אחרים ,%s שלום לך, אתה כעת נמצא בגאנג",dini_Get(GetPlayerFile(playerid),"Gang"));
     SendClientMessage(playerid, 0x00FFFFAA, string);
     SendClientMessage(playerid, 0x00FFFFAA, "!כל פעם תתחיל באיזור הזה, יש לך פה את הציוד שאתה צריך, בהצלחה");
     SendClientMessage(playerid,GOLD,"'@' / '!' - על מנת לתקשר עם המשפחה שלך כתוב לפני כל הודעה");
	 SetPlayerColor(playerid, SWAT_COLOR);
  	 _SetSpawnInfo(playerid, SWAT_TEAM, SWAT_SKIN,-1637.18, 665.552, 7.65313, 270, 31, 500, 22, 100, 16, 20);
  	 gTeam[playerid] = SWAT_TEAM;
  }
  if(GetPlayerSkin(playerid) == GANG2_SKIN)
  {
	 if(getOnlineVar("Gang","Workers") == MAX_MEMMBERS_FACTION) return SendClientMessage(playerid,GRAY,".אתה לא יכול להצטרף לפיקשיין הזה הוא מלא 30/30"),0;
     dini_Set(GetPlayerFile(playerid),"Gang","Workers");
     format(string,sizeof string,",המטרה שלך היא לנסות להילחם במשפחות פשע / גאנגים אחרים ,%s שלום לך, אתה כעת נמצא בגאנג",dini_Get(GetPlayerFile(playerid),"Gang"));
     SendClientMessage(playerid, 0x00FFFFAA, string);
     SendClientMessage(playerid, 0x00FFFFAA, "!כל פעם תתחיל באיזור הזה, יש לך פה את הציוד שאתה צריך, בהצלחה");
     SendClientMessage(playerid,GOLD,"'@' / '!' - על מנת לתקשר עם המשפחה שלך כתוב לפני כל הודעה");
	 SetPlayerColor(playerid, GANG_C2);
     _SetSpawnInfo(playerid,GANG2_TEAM, GANG2_SKIN,-2064.0149,236.5041,35.7940,275.1603, 31, 500, 27, 300, 28, 150);
     gTeam[playerid] = GANG2_TEAM;
  }
  if(GetPlayerSkin(playerid) == GANG3_SKIN)
  {
	 if(getOnlineVar("Gang","JTolow") == MAX_MEMMBERS_FACTION) return SendClientMessage(playerid,GRAY,".אתה לא יכול להצטרף לפיקשיין הזה הוא מלא 30/30"),0;
     dini_Set(GetPlayerFile(playerid),"Gang","JTolow");
     format(string,sizeof string,",המטרה שלך היא לנסות להילחם במשפחות פשע / גאנגים אחרים ,%s שלום לך, אתה כעת נמצא בגאנג",dini_Get(GetPlayerFile(playerid),"Gang"));
     SendClientMessage(playerid, 0x00FFFFAA, string);
     SendClientMessage(playerid, 0x00FFFFAA, "!כל פעם תתחיל באיזור הזה, יש לך פה את הציוד שאתה צריך, בהצלחה");
     SendClientMessage(playerid,GOLD,"'@' / '!' - על מנת לתקשר עם המשפחה שלך כתוב לפני כל הודעה");
	 SetPlayerColor(playerid, GANG_C3);
     _SetSpawnInfo(playerid,GANG3_TEAM, GANG3_SKIN,1024.3647,1796.9631,10.8203,0.4515, 31, 500, 28, 300, 28, 150);
     gTeam[playerid] = GANG3_TEAM;
  }
  if(GetPlayerSkin(playerid) == GANG4_SKIN)
  {
	 if(getOnlineVar("Gang","China Town") == MAX_MEMMBERS_FACTION) return SendClientMessage(playerid,GRAY,".אתה לא יכול להצטרף לפיקשיין הזה הוא מלא 30/30"),0;
     dini_Set(GetPlayerFile(playerid),"Gang","China Town");
     format(string,sizeof string,",המטרה שלך היא לנסות להילחם במשפחות פשע / גאנגים אחרים ,%s שלום לך, אתה כעת נמצא בגאנג",dini_Get(GetPlayerFile(playerid),"Gang"));
     SendClientMessage(playerid, 0x00FFFFAA, string);
     SendClientMessage(playerid, 0x00FFFFAA, "!כל פעם תתחיל באיזור הזה, יש לך פה את הציוד שאתה צריך, בהצלחה");
     SendClientMessage(playerid,GOLD,"'@' / '!' - על מנת לתקשר עם המשפחה שלך כתוב לפני כל הודעה");
	 SetPlayerColor(playerid, GANG_C4);
     _SetSpawnInfo(playerid,GANG4_TEAM, GANG4_SKIN,-2184.9009,715.5368,53.8994,189.1819, 8, 1, 28, 300, 30, 250);
     gTeam[playerid] = GANG4_TEAM;
  }
  if(GetPlayerSkin(playerid) == PILOT_SKIN)
  {
     if(dini_Int(GetPlayerFile(playerid),"Level") < 4) return SendClientMessage(playerid, GRAY,".בחירת סקין מרמה 2 ומעלה"), 0;
	 if(getOnlineVar("Gang","Pilots") == MAX_MEMMBERS_FACTION) return SendClientMessage(playerid,GRAY,".אתה לא יכול להצטרף לפיקשיין הזה הוא מלא 30/30"),0;
     dini_Set(GetPlayerFile(playerid),"Gang","Pilots");
     format(string,sizeof string,",המטרה שלך היא לנסות להילחם במשפחות פשע האחרות ,%s שלום לך, אתה כעת נמצא בגאנג",dini_Get(GetPlayerFile(playerid),"Gang"));
     SendClientMessage(playerid, 0x00FFFFAA, string);
     SendClientMessage(playerid, 0x00FFFFAA, ",AirPlane אתה נמצא כעת בגאנג מיוחד, גאנג של טייסים מקצועים, אשר את שולט במטוסים");
     SendClientMessage(playerid, 0x00FFFFAA, ",בצורה מושלמת, שלא תטעו, אתם כמו כל שאר הגאנגים - נלחמים, פשוט יש לכם כמה הטבות");
     SendClientMessage(playerid, 0x00FFFFAA, ".היזהרו מהשוטרים, הם יכולים לתפוס אותכם כל עוד רמת המבוקשות שלכם מעל 0");
     SendClientMessage(playerid,GOLD,"'@' / '!' - על מנת לתקשר עם המשפחה שלך כתוב לפני כל הודעה");
	 SetPlayerColor(playerid, COLOR_PILOT_GANG);
     _SetSpawnInfo(playerid,Pilot_TEAM, PILOT_SKIN,2006.0848,-2273.0874,13.5469,83.8621, 31, 500, 16, 3, 27, 150);
     gTeam[playerid] = Pilot_TEAM;
  }
  if(GetPlayerSkin(playerid) == SECURITY_SKIN)
  {
       dini_Set(GetPlayerFile(playerid),"Job","Security");
   	   SendClientMessage(playerid, LIGHT_RED, ",שלום לך, אתה כעת מאבטח ראש העיר, מטרתך היא לשמור על ראשו של ראש העיר");
	   SendClientMessage(playerid, LIGHT_RED, ",כל 10 דקות תקבל 25 אחוז מתוך 600$ על כל מי שבשרת");
	   SendClientMessage(playerid, LIGHT_RED, ".אם תגן על ראש העיר תקבל גם בונוסים");
	   SendClientMessage(playerid,GRAY,"!מותר לך לתקוף רק אנשים שמנסים לתקוף אותך *");
       SendClientMessage(playerid,GOLD,"'@' / '!' - על מנת לתקשר עם האנשים העובדים איתך");
       _SetSpawnInfo(playerid,Mayor_TEAM, GetPlayerSkin(playerid), -2279.4321,2288.1311,4.9644,177.7416, 24, 500, 31, 500, 0, 0);
       if(Security[0] == -1) Security[0] = playerid;
       else if(Security[1] == -1) Security[1] = playerid;
       format(string, sizeof string, ".הצבע של המאבטח בצבע הזה %s - תנסו להרוג גם אותו על מנת להגיע לראש העיר %s מאבטח חדש לראש העיר", GetName(playerid));
       SendClientMessage(playerid, COLOR_SECURITY, string);
       SetPlayerColor(playerid, COLOR_SECURITY);
       gTeam[playerid] = Mayor_TEAM;
  }
  if(GetPlayerSkin(playerid) == COPS_SKIN1 || GetPlayerSkin(playerid) == COPS_SKIN2 || GetPlayerSkin(playerid) == COPS_SKIN3)
  {
	   if(getOnlineVar("Job","Police") == MAX_MEMMBERS_FACTION) return SendClientMessage(playerid,GRAY,".אתה לא יכול להצטרף לפיקשיין הזה הוא מלא 30/30"),0;
       dini_Set(GetPlayerFile(playerid),"Job","Police");
	   format(string,sizeof string,",כפי שיודע לך, בשרת יש משפחות פשע, וגם פושעים ,%s שלום לך, אתה כעת בתחנת משטרה",dini_Get(GetPlayerFile(playerid),"Job"));
	   SendClientMessage(playerid, LIGHT_RED, string);
	   SendClientMessage(playerid, LIGHT_RED, ",המטרה שלך היא לתפוס את הפושעים / משפחות פשע אשר המד מבוקשות שלהם עולה מעל 0");
	   SendClientMessage(playerid, LIGHT_RED, ",אסור בתחלית האיסור להרוג אזרחים ללא מבוקושות, גם לא הורגים סתם - מנסים להכניס לכלא קודם, אם תכניס תקבל כסף");
	   SendClientMessage(playerid, LIGHT_RED, ",במקרה ותהרוג פושע מבוקש, תקבל אמנם סכום יותר נמוך - אבל תקבל");
	   SendClientMessage(playerid, LIGHT_RED,",המטרה שלך היא לארגן צוותים ולנסות לחדור לתוך הבתים של המבוקשים, למשפחות פשע");
	   SendClientMessage(playerid, LIGHT_RED,",על מנת להכניס פושע לבית כלא עליך להיות קרוב אליו ברדיוס 6.0 וללחוץ על מקש במקלדת");
	   SendClientMessage(playerid,ORANGE,"- ברגע שתלחץ ותיהיה קרוב לשחקן, כסף יכונס אוטומאטית לבנק -");
	   SendClientMessage(playerid,ORANGE,"/Backup - על מנת לקבל גיבוי /WantedList - לצפות ברשימת מבוקשים");
       SendClientMessage(playerid,GOLD,"'@' / '!' - על מנת לתקשר עם האנשים העובדים איתך");
       SendClientMessage(playerid, RED,"!אסור לך בשום פנים ואופן להרוג שחקן שהוא לא מבוקש, במידה ותהרוג שחקן לא מבוקש תורחק למשך 3 דקות");
       _SetSpawnInfo(playerid,Cops_TEAM, GetPlayerSkin(playerid), 2267.8889,2447.8730,-7.1953,177.7416, 24, 500, 25, 100, 31, 200);
       ModeInfo[playerid][Cop] = true;
       gTeam[playerid] = Cops_TEAM;
  }
  if(GetPlayerSkin(playerid) == HITMAN_SKIN)
  {
       if(dini_Int(GetPlayerFile(playerid),"Level") < 3) return SendClientMessage(playerid, GRAY,".בחירת סקין מרמה 3 ומעלה"), 0;
	   if(getOnlineVar("Job","Hitman") == MAX_MEMMBERS_FACTION) return SendClientMessage(playerid,GRAY,".אתה לא יכול להצטרף לפיקשיין הזה הוא מלא 30/30"),0;
       dini_Set(GetPlayerFile(playerid),"Job","Hitman");
	   format(string,sizeof string,",כפי שיודע לך, יש בשרת משפחות פשע ועבריינים ,%s שלום לך, אתה כעת עובד בתור מתנקש",dini_Get(GetPlayerFile(playerid),"Job"));
	   SendClientMessage(playerid, LIGHT_RED, string);
	   SendClientMessage(playerid, LIGHT_RED, ",אתה בתור מתנקש (רוצח שכיר) תקבל הזמנות מאנשים להרוג אנשים אחרים, אם תהרוג את השחקן שהזמינו עליו רצח");
	   SendClientMessage(playerid, LIGHT_RED, ",תקבל את הכסף לגו'ב, שים לב, אתה נמצא עם עוד כמה רוצחים, אינך יכול לפגוע בהם");
	   SendClientMessage(playerid, LIGHT_RED, ",אם תהרוג שחקן ששמו כסף על ראשו תקבל את הכסף ששמו עליו");
	   SendClientMessage(playerid, LIGHT_RED,".כמובן שיש לך כמה הטבות נחמדות כגון: נשקים מיוחדים, אתה בלתי נראה במפה, ועוד כמה דברים שתגלה בהמשך הדרך");
	   SendClientMessage(playerid,ORANGE,"- דרך אגב, אם תהרוג מישהו שהוא לא מבוקש תורחק מהמשחק למשך 3 דקות");
	   SendClientMessage(playerid,ORANGE,"/WantedList - לצפות ברשימת מבוקשים ופרס על ראשם");
       SendClientMessage(playerid,GOLD,"'@' / '!' - על מנת לתקשר עם האנשים העובדים איתך");
       SendClientMessage(playerid,GRAY,"!עוד משהו קטן, אנשים מבוקשים - מופיעים במפה בצבע של הודעה זאתי, התחל להינות ולהרוויח מזה כסף");
       SetPlayerColor(playerid, COLOR_HITMAN);
       _SetSpawnInfo(playerid,Hitman_TEAM, HITMAN_SKIN, 2112.3496,2369.6526,60.8169,276.5970, 24, 500, 25, 100, 31, 200);
       ModeInfo[playerid][Hitman] = true;
       gTeam[playerid] = Hitman_TEAM;
  }
  if(GetPlayerSkin(playerid) == CORLEONE_SKIN)
  {
      if(getOnlineVar("IFamily","Corelone") == MAX_MEMMBERS_FACTION) return SendClientMessage(playerid,GRAY,".אתה לא יכול להצטרף לפיקשיין הזה הוא מלא 30/30"),0;
	  if(dini_Int(GetPlayerFile(playerid),"Level") < 5) return SendClientMessage(playerid,GRAY,".לפני שאתה מצטרך למשפחת הפשע הזאת אתה צריך להיות רמה 5"),0;
      dini_Set(GetPlayerFile(playerid),"IFamily","Corelone");
	  format(string,sizeof string,",המטרה שלך היא לנסות להילחם במשפחות פשע האחרות ,%s שלום לך, אתה כעת בן משפחת",dini_Get(GetPlayerFile(playerid),"IFamily"));
	  SendClientMessage(playerid, 0x00FFFFAA, string);
	  SendClientMessage(playerid, 0x00FFFFAA, ".לכל משפחה יש שטח מסומן, אתה כמובן יכול לכבוש אותו");
	  SendClientMessage(playerid, 0x00FFFFAA, ",דבר-ראשון, היזהר משוטרים, שוטרים אשר קורבים אליך ברדיוס של 6.0 יכולים להכניס אותך לכלא למשך 5.0 דקות");
	  SendClientMessage(playerid, 0x00FFFFAA, ".השוטרים תופסים אותך בגלל שאתה רוצח+פושע, אתה המטרה שלך זה או להרוג אותם או לברוח מהם");
	  SendClientMessage(playerid, 0x00FFFFAA,",ברמות יותר גבוהות יפתחו בפניך אפשריות חדשות כגון: התקפות אוויריות, קניית פצצות, השטלת פצצה ברכבים");
	  SendClientMessage(playerid, 0x00FFFFAA,".מגן תמידי, מילוי חיים פעם אחת/פעמיים בספואן, אפשרות תיקון רכב בתמורה לכסף, ועוד המון דברים");
	  SendClientMessage(playerid,ORANGE,"!Chicano :שים לב, המשפחות שאתה נלחם איתם הם");
      SendClientMessage(playerid,GOLD,"'@' / '!' - על מנת לתקשר עם המשפחה שלך כתוב לפני כל הודעה");
      SetPlayerColor(playerid, COLOR_Corelone_Family);
      _SetSpawnInfo(playerid,Corelone_TEAM, CORLEONE_SKIN, -685.0438,927.2666,13.6293,176.3961, 31, 500, 16, 3, 27, 150);
      gTeam[playerid] = Corelone_TEAM;
  }
  if(GetPlayerSkin(playerid) == C_SKIN)
  {
	  if(getOnlineVar("IFamily","Chicano") == MAX_MEMMBERS_FACTION) return SendClientMessage(playerid,GRAY,".אתה לא יכול להצטרף לפיקשיין הזה הוא מלא 30/30"),0;
	  if(dini_Int(GetPlayerFile(playerid),"Level") < 6) return SendClientMessage(playerid,GRAY,".לפני שאתה מצטרך למשפחת הפשע הזאת אתה צריך להיות רמה 6"),0;
      dini_Set(GetPlayerFile(playerid),"IFamily","Chicano");
	  format(string,sizeof string,",המטרה שלך היא לנסות להילחם במשפחות פשע האחרות ,%s שלום לך, אתה כעת בן משפחת",dini_Get(GetPlayerFile(playerid),"IFamily"));
	  SendClientMessage(playerid, 0x00FFFFAA, string);
	  SendClientMessage(playerid, 0x00FFFFAA, ".לכל משפחה יש שטח מסומן, אתה כמובן יכול לכבוש אותו");
	  SendClientMessage(playerid, 0x00FFFFAA, ",דבר-ראשון, היזהר משוטרים, שוטרים אשר קורבים אליך ברדיוס של 6 .0יכולים להכניס אותך לכלא למשך 5.0 דקות");
	  SendClientMessage(playerid, 0x00FFFFAA, ".השוטרים תופסים אותך בגלל שאתה רוצח+פושע, אתה המטרה שלך זה או להרוג אותם או לברוח מהם");
	  SendClientMessage(playerid, 0x00FFFFAA,",ברמות יותר גבוהות יפתחו בפניך אפשריות חדשות כגון: התקפות אוויריות, קניית פצצות, השטלת פצצה ברכבים");
	  SendClientMessage(playerid, 0x00FFFFAA,".מגן תמידי, מילוי חיים פעם אחת/פעמיים בספואן, אפשרות תיקון רכב בתמורה לכסף, ועוד המון דברים");
	  SendClientMessage(playerid,ORANGE,"!Corelone :שים לב, המשפחות שאתה נלחם איתם הם");
      SendClientMessage(playerid,GOLD,"'@' / '!' - על מנת לתקשר עם המשפחה שלך כתוב לפני כל הודעה");
      SetPlayerColor(playerid, COLOR_C);
      _SetSpawnInfo(playerid,C_TEAM, C_SKIN, -1383.2572-3,501.2429,17.7742,87.8050, 29, 500, 16, 8, 27, 150);
      gTeam[playerid] = C_TEAM;
  }
  if(GetPlayerSkin(playerid) == ARMY_SKIN)
  {
     if(dini_Int(GetPlayerFile(playerid),"Level") < 3) return SendClientMessage(playerid, GRAY,".בחירת סקין מרמה 3 ומעלה"), 0;
	 if(getOnlineVar("Gang","Army") == MAX_MEMMBERS_FACTION) return SendClientMessage(playerid,GRAY,".אתה לא יכול להצטרף לפיקשיין הזה הוא מלא 30/30"),0;
     dini_Set(GetPlayerFile(playerid),"Gang","Army");
     format(string,sizeof string,"!המטרה שלך היא לנסות להילחם במשפחות פשע האחרות ,%s שלום לך, אתה כעת נמצא בגאנג",dini_Get(GetPlayerFile(playerid),"Gang"));
     SendClientMessage(playerid, 0x00FFFFAA, string);
     SendClientMessage(playerid, 0x00FFFFAA, ".היזהרו מהשוטרים, הם יכולים לתפוס אותכם כל עוד רמת המבוקשות שלכם מעל 0");
     SendClientMessage(playerid,GOLD,"'@' / '!' - על מנת לתקשר עם המשפחה שלך כתוב לפני כל הודעה");
     SetPlayerColor(playerid, ORANGE);
     _SetSpawnInfo(playerid,ARMY_TEAM, ARMY_SKIN,214.0998,1881.6785,13.3386,1.8014, 31, 500, 16, 3, 27, 150);
     gTeam[playerid] = ARMY_TEAM;
  }
  GangZoneShowForPlayer(playerid, GangZones[0], MAIN);
  GangZoneShowForPlayer(playerid, GangZones[1], WHOERS_COLOR);
  GangZoneShowForPlayer(playerid, GangZones[2], GANG_C5);
  GangZoneShowForPlayer(playerid, GangZones[3], GANG_C2);
  GangZoneShowForPlayer(playerid, GangZones[4], GANG_C2);
  GangZoneShowForPlayer(playerid, GangZones[5], 0x8000FF96);
  GangZoneShowForPlayer(playerid, GangZones[5], SWAT_COLOR);
  GangZoneShowForPlayer(playerid, GangZones[6], MEDIC_COLOR);
  GangZoneShowForPlayer(playerid, GangZones[7], F_COLOR);
  GangZoneShowForPlayer(playerid, GangZones[8], COLOR_PILOT_GANG);
  GangZoneShowForPlayer(playerid, GangZones[9], ORANGE);
  GangZoneShowForPlayer(playerid, GangZones[10], COLOR_Corelone_Family);
  GangZoneShowForPlayer(playerid, GangZones[11], COLOR_C);
  GangZoneShowForPlayer(playerid, GangZones[12], COLOR_MAYOR);
  GangZoneShowForPlayer(playerid, GangZones[13], 0x8000FF96);
  GangZoneShowForPlayer(playerid, GangZones[14], 0xFF80C096);
  TextDrawHideForPlayer(playerid,TInfo[playerid]);
  SetPlayerMapIcon( playerid, 7, -1988.8795,1118.0017,54.4721, 52,0); // bank
  SetPlayerMapIcon( playerid, 7, -2667.5696,732.9576,27.9531, 52,0); // misiion
  SetPlayerMapIcon( playerid, 1, -2665.4519,632.4997,14.4531, 22,0); // hospital
  SetPlayerMapIcon( playerid, 1, -2579.2842,1119.8170,55.5184, 53, 0 );//race
  SetPlayerMapIcon( playerid, 3, 2001.6742, 1544.2804, 13.5859, 9, 0 );//ship
  return 1;
}
function(OnPlayerCommandText(playerid, cmdtext[]))
{
   new cmd[256], idx, string[128];
   cmd = sstrtok(cmdtext, idx);
   if(Background[playerid]) return 1;
   if(!strcmp(cmd,"/ahelp", true) && IsPlayerXAdmin(playerid, 1))
   {
   	   SendClientMessage(playerid,WHITE,"---------------------------------------------------------");
   	   if(IsPlayerXAdmin(playerid, 19) || IsPlayerXAdmin(playerid, 19)) SendClientMessage(playerid,LIGHT_RED,"/apanel /fedit /fcreate /fremove /fbackup /cadd /cremove /opanel");
   	   SendClientMessage(playerid,LIGHT_RED,"/xcmds /vote /clist");
	   SendClientMessage(playerid,WHITE,"---------------------------------------------------------");
	   return 1;
   }
   if(!strcmp(cmd,"/vote", true))
   {
	   new tmp[256],tmp2[256];
	   tmp = sstrtok(cmdtext, idx);
	   if(!strlen(tmp)) return SendClientMessage(playerid, WHITE, IsPlayerXAdmin(playerid, 1)? ("USAGE: /vote [start/end/state/yes/no]") : ("USAGE: /vote [state/yes/no]"));
	   if(!strcmp(tmp, "start", true) && IsPlayerXAdmin(playerid, 1))
	   {
			tmp2 = strtok_line(cmdtext, idx);
			if(!strlen(tmp2)) return SendClientMessage(playerid, WHITE, "USAGE: /vote start [vote quis]");
			if(vote[0]) return SendClientMessage(playerid, RED, ".הסקר כבר פועל");
			SendClientMessage(playerid, 0, "___________________________________________________________");
			format(string, sizeof string,":התחיל סקר, שאלת הסקר %s - האדמין",GetName(playerid));
			SendClientMessage(playerid, 0xFF66FFAA, string);
			format(string, sizeof string,"%s",tmp2);
			SendClientMessage(playerid, 0xFF66FFAA, string);
			SendClientMessage(playerid, ORANGE,"/Vote Yes :על מנת לענות חיובי");
			SendClientMessage(playerid, ORANGE,"/Vote No :על מנת לענות שלילי");
			SendClientMessage(playerid, ORANGE,"/Vote State :על מנת לענות חיובי");
			SendClientMessage(playerid, 0, "___________________________________________________________");
			qvote = tmp2, vote[0] = 1, vote[1] = 0, vote[2] = 0;
			for(new i = 0; i < MAX_PLAYERS; i++) alreadyvote[i] = 0;
			SetTimer("endVote", 3*1000*60, 0);
            return 1;
	   }
	   if(!strcmp(tmp, "end", true) && IsPlayerXAdmin(playerid, 1))
	   {
            if(!vote[0]) return SendClientMessage(playerid, RED, ".אין סקר פועל כרגע");
            SendClientMessageToAll(0x00FFFFAA,"-----------------------------------------------------------------");
            format(string, sizeof string,"%d - הצבעות חיוביות",vote[1]);
            SendClientMessageToAll(ORANGE, string);
            format(string, sizeof string,"%d - הצבעות שליליות",vote[2]);
            SendClientMessageToAll(ORANGE, string);
            format(string, sizeof string,"%s - שאלת הסקר",qvote);
            SendClientMessageToAll(ORANGE, string);
            SendClientMessageToAll(GREEN, vote[1] > vote[2] && vote[1] != 0 && vote[2] != 0 && vote[1] != vote[2] && vote[2] != vote[1]? ("!יש יותר הצבעות חיוביות מאשר שליליות") : ("!יש יותר הצבעות שליליות מאשר חיוביות"));
            SendClientMessageToAll(0x00FFFFAA,"-----------------------------------------------------------------");
            qvote = " ", vote[0] = 0;
            for(new i = 0; i < MAX_PLAYERS; i++) alreadyvote[i] = 0;
            return 1;
	   }
	   if(!strcmp(tmp, "yes", true))
	   {
            if(!vote[0]) return SendClientMessage(playerid, RED, ".אין סקר פועל כרגע");
            if(alreadyvote[playerid] && !IsPlayerXAdmin(playerid, 19)) return SendClientMessage(playerid, RED,".הצבעת כבר בסקר זה");
            vote[1]++;
    		format(string, sizeof string,"%d - הצבעת בהצלחה, מספר ההצבעה שלך היא",vote[1]);
			SendClientMessage(playerid, 0xFF66FFAA, string);
    		format(string, sizeof string,"%d - הצבעות שליליות",vote[2]);
			SendClientMessage(playerid, 0xFF66FFAA, string);
    		format(string, sizeof string,"%s - שאלת הסקר",qvote);
			SendClientMessage(playerid, 0xFF66FFAA, string);
			alreadyvote[playerid] = 1;
            return 1;
	   }
	   if(!strcmp(tmp, "no", true))
	   {
            if(!vote[0]) return SendClientMessage(playerid, RED, ".אין סקר פועל כרגע");
            if(alreadyvote[playerid] && !IsPlayerXAdmin(playerid, 19)) return SendClientMessage(playerid, RED,".הצבעת כבר בסקר זה");
            vote[2]++;
    		format(string, sizeof string,"%d - הצבעת בהצלחה, מספר ההצבעה שלך היא",vote[2]);
			SendClientMessage(playerid, 0xFF66FFAA, string);
    		format(string, sizeof string,"%d - הצבעות חיוביות",vote[1]);
			SendClientMessage(playerid, 0xFF66FFAA, string);
    		format(string, sizeof string,"%s - שאלת הסקר",qvote);
			SendClientMessage(playerid, 0xFF66FFAA, string);
			alreadyvote[playerid] = 1;
            return 1;
	   }
	   if(!strcmp(tmp, "state", true))
	   {
            if(!vote[0]) return SendClientMessage(playerid, RED, ".אין סקר פועל כרגע");
    		format(string, sizeof string,"%d - הצבעות חיוביות",vote[1]);
			SendClientMessage(playerid, ORANGE, string);
    		format(string, sizeof string,"%d - הצבעות שליליות",vote[2]);
			SendClientMessage(playerid, ORANGE, string);
    		format(string, sizeof string,"%s - שאלת הסקר",qvote);
			SendClientMessage(playerid, ORANGE, string);
            return 1;
	   }
	   return SendClientMessage(playerid, RED, !vote[0]? (".אין סקר פועל כרגע") : (".פקודת סקר שגויה"));
   }
   if(!strcmp(cmd,"/apanel", true) && IsPlayerXAdmin(playerid, 19))
   {
     new tmp[256], tmp2[256], tmp3[256];
     tmp = sstrtok(cmdtext, idx);
     if(!dini_Exists("/opanel/panel.cfg")) dini_Create("/panel.cfg");
     if(!strlen(tmp)) return SendClientMessage(playerid,WHITE,"USAGE: /apanel [hostname/password/badname]");
     if(!strcmp(tmp,"badname", true))
     {
		 tmp2 = sstrtok(cmdtext, idx);
		 if(!strlen(tmp2)) return SendClientMessage(playerid, WHITE, "USAGE: /apanel baname [add/remove]");
		 if(!strcmp(tmp2, "add", true))
		 {
		    tmp3 = sstrtok(cmdtext, idx);
		    format(string, sizeof string, "/opanel/badnames/%s.ini", tmp3);
		    if(!strlen(tmp3)) return SendClientMessage(playerid, WHITE, "USAGE: /apanel badname add [name]");
            if(dini_Exists(string)) return SendClientMessage(playerid, RED,".שם זה כבר חסום");
            dini_Create(string);
		    dini_Set(string, "name", tmp3);
		    format(string, sizeof string,"!%s :חסמת את הכניסה עם השם",tmp3);
		    SendClientMessage(playerid, GREEN,string);
		    return 1;
		 }
		 if(!strcmp(tmp2, "remove", true))
		 {
		    tmp3 = sstrtok(cmdtext, idx);
		    format(string, sizeof string, "/opanel/badnames/%s.ini", tmp3);
		    if(!strlen(tmp3)) return SendClientMessage(playerid, WHITE, "USAGE: /apanel badname remove [name]");
            if(!dini_Exists(string)) return SendClientMessage(playerid, RED,".שם זה לא חסום");
            dini_Remove(string);
		    format(string, sizeof string,"!%s :אפשרת את הכניסה לשרת עם השם",tmp2);
		    SendClientMessage(playerid, GREEN,string);
		    return 1;
		 }
		 return SendClientMessage(playerid, RED, ".פקודת שמות רעים שגויה");
     }
     if(!strcmp(tmp,"hostname", true))
     {
	     tmp2 = strtok_line(cmdtext, idx);
	     if(strlen(tmp2) < 3) return SendClientMessage(playerid,RED,"Invalid Hostname, minmum 3 char.");
	     dini_Set("/opanel/panel.cfg", "hostname", cmdtext[13]);
	     format(string,sizeof string,"hostname %s", tmp2);
	     SendRconCommand(string);
	     SendClientMessage(playerid,RED,"The action been done.");
         return 1;
     }
     if(!strcmp(tmp,"password", true))
     {
	     tmp2 = sstrtok(cmdtext, idx);
	     if(strlen(tmp2) < 3) return SendClientMessage(playerid,RED,"Invalid Password, minmum 3 char.");
	     dini_Set("/opanel/panel.cfg", "password", tmp2);
	     format(string,sizeof string,"password %s", tmp2);
	     SendRconCommand(string);
	     SendClientMessage(playerid,RED,"The action been done.");
         return 1;
     }
     return SendClientMessage(playerid, RED, ".פקודת פאנל שגויה");
   }
   if(!strcmp(cmd,"/fedit", true) && IsPlayerXAdmin(playerid, 19))
   {
	   new tmp[256], tmp2[256], tmp3[256];
	   tmp = sstrtok(cmdtext, idx);
	   tmp2 = sstrtok(cmdtext, idx);
	   tmp3 = strtok_line(cmdtext, idx);
	   if(!(strlen(tmp) || strlen(tmp2) || strlen(tmp3))) return SendClientMessage(playerid,WHITE,"USAGE: /fedit [player name] [variable file] [set to]");
	   format(string, sizeof string,"/Users/%s.ini", tmp);
	   if(!dini_Exists(string)) return SendClientMessage(playerid,RED,"This account doesn't exists!");
	   if(!dini_Isset(GetPlayerFile(playerid),tmp2)) return SendClientMessage(playerid,RED,"Invalid variable file!");
	   dini_Set(string,tmp2, tmp3);
	   format(string,sizeof string,"You edit the account: %s, variable: %s to: %s !", tmp, tmp2, tmp3);
	   SendClientMessage(playerid, GREEN, string);
	   return 1;
   }
   if(!strcmp(cmd,"/fcreate", true) && IsPlayerXAdmin(playerid, 19))
   {
	   new tmp[256], tmp2[256], date[3];
	   tmp = sstrtok(cmdtext, idx);
	   tmp2 = sstrtok(cmdtext, idx);
	   if(!(strlen(tmp) || strlen(tmp2))) return SendClientMessage(playerid,WHITE,"USAGE: /fcreate [player name] [password]");
	   format(string, sizeof string,"/Users/%s.ini", tmp);
	   if(dini_Exists(string)) return SendClientMessage(playerid,RED,"This account exists!");
	   getdate(date[2], date[1], date[0]);
       format(string,sizeof string,"%d.%d.%d", date[0], date[1], date[2]);
	   dini_Create(string);
	   dini_Set(string,"Date", string);
	   dini_IntSet(string,"Hitman", 0);
	   dini_IntSet(string,"Kills", 0);
	   dini_IntSet(string,"Deaths", 0);
	   dini_IntSet(string,"Level", 1);
	   dini_IntSet(string,"Skin", 0);
	   dini_IntSet(string,"Bank", 0);
	   dini_IntSet(string,"Respect", 0);
	   dini_IntSet(string,"TimeOnServer", 1);
	   dini_IntSet(string,"ChampionsPoints", 0);
	   dini_IntSet(string,"Missions", 0);
	   dini_IntSet(string,"Hours", 0);
	   dini_Set(string,"IFamily", "None");
	   dini_Set(string,"Tag", "None");
	   dini_Set(string,"Job", "None");
	   dini_Set(string,"Password", tmp2);
	   format(string,sizeof string,"You Create New User, Details: Nick: \"%s\" Password: \"%s\"" ,tmp, tmp2);
	   SendClientMessage(playerid, 0x0F482FF, string);
	   return 1;
   }
   if(!strcmp(cmd, "/opanel", true) && IsPlayerXAdmin(playerid, 19))
   {
	   new tmp[256], tmp2[256], tmp3[256], tmp4[256], tmp5[256], Float:opos[4];
	   tmp = sstrtok(cmdtext, idx);
	   if(!strlen(tmp)) return SendClientMessage(playerid, WHITE, "USAGE: /opnael [add/remove/list]");
	   if(!strcmp(tmp, "add", true))
	   {
		   tmp2 = sstrtok(cmdtext, idx);
		   if(!strlen(tmp2)) return SendClientMessage(playerid, WHITE,"USAGE: /opanel add [pickup(p)/vehicle(v)]");
		   if(!strcmp(tmp2, "p", true) || !strcmp(tmp2, "pickup", true))
		   {
              tmp3 = sstrtok(cmdtext, idx);
              tmp4 = sstrtok(cmdtext, idx);
              tmp5 = sstrtok(cmdtext, idx);
			  if(!strlen(tmp3) || !strlen(tmp4) || !strlen(tmp5)) return SendClientMessage(playerid, WHITE, "USAGE: /opanel add pickup(p) [pickupid] [type] [var file]");
			  format(string, sizeof string,"/opanel/pickups/%d.ini", dini_Int("/opanel/pickups/main.ini", "Total"));
			  GetPlayerPos(playerid, opos[0], opos[1], opos[2]);
			  dini_Create(string);
			  dini_IntSet(string, "pickupid", strval(tmp3));
			  dini_IntSet(string, "type", strval(tmp4));
			  dini_FloatSet(string, "x", opos[0]);
			  dini_FloatSet(string, "y", opos[1]);
			  dini_FloatSet(string, "z", opos[2]);
			  dini_Set(string, "var", tmp5);
			  CreatePickup(strval(tmp3), strval(tmp4), opos[0], opos[1], opos[2]);
			  dini_IntSet("/opanel/pickups/main.ini", "Total", dini_Int("/opanel/pickups/main.ini", "Total")+1);
			  format(string, sizeof string, "You have added pickup, modelid: %d, type: %d id: %d!", strval(tmp3), strval(tmp4), dini_Int("/opanel/pickups/main.ini", "Total")-1);
			  SendClientMessage(playerid, ORANGE, string);
			  return 1;
		   }
		   if(!strcmp(tmp2, "v", true) || !strcmp(tmp2, "vehicle", true))
		   {
              tmp3 = sstrtok(cmdtext, idx);
			  if(!strlen(tmp3)) return SendClientMessage(playerid, WHITE, "USAGE: /opanel add vehicle(v) [var file]");
			  if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, RED, ".אתה חייב להיות ברכב על מנת לבצע פקודה זו");
			  format(string, sizeof string,"/opanel/vehicles/%d.ini", dini_Int("/opanel/vehicles/main.ini", "Total"));
			  GetVehiclePos(GetPlayerVehicleID(playerid), opos[0], opos[1], opos[2]);
			  GetVehicleZAngle(GetPlayerVehicleID(playerid), opos[3]);
			  dini_Create(string);
			  dini_IntSet(string, "modelid", GetVehicleModel(GetPlayerVehicleID(playerid)));
			  dini_FloatSet(string, "x", opos[0]);
			  dini_FloatSet(string, "y", opos[1]);
			  dini_FloatSet(string, "z", opos[2]);
			  dini_FloatSet(string, "angle", opos[3]);
			  dini_Set(string, "var", tmp3);
			  SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			  CreateVehicle(GetVehicleModel(GetPlayerVehicleID(playerid)), opos[0], opos[1], opos[2], opos[3], random(126), random(126), -1);
			  dini_IntSet("/opanel/vehicles/main.ini", "Total", dini_Int("/opanel/vehicles/main.ini", "Total")+1);
			  format(string, sizeof string, "!%i :הוספת רכב תמידי לשרת, כעת הרכב הזה יישמר גם לאחר איפוס השרת, האיידי של הרכב", dini_Int("/opanel/vehicles/main.ini", "Total"));
			  SendClientMessage(playerid, ORANGE, string);
			  return 1;
		   }
		   return SendClientMessage(playerid, RED, ".פקודת הוספה עצם שגויה");
	   }
	   if(!strcmp(tmp, "remove", true))
	   {
   	       tmp2 = sstrtok(cmdtext, idx);
	       if(!strlen(tmp2)) return SendClientMessage(playerid, WHITE, "USAGE: /opnael remove [pickup(p)/vehicle(v)]");
   		   if(!strcmp(tmp2, "v", true) || !strcmp(tmp2, "vehicle", true))
		   {
			   tmp3 = sstrtok(cmdtext, idx);
			   format(string, sizeof string,"/opanel/vehicles/%d.ini", strval(tmp3));
			   if(!strlen(tmp3)) return SendClientMessage(playerid, WHITE, "USAGE: /opanel remove vehicle(v) [vid]");
			   if(!dini_Exists(string)) return SendClientMessage(playerid, RED, ".רכב זה לא קיים או שהוא כבר נמחק");
			   dini_Remove(string);
 			   format(string, sizeof string, "!%i :מחקת את הרכב", strval(tmp3));
			   SendClientMessage(playerid, ORANGE, string);
		       return 1;
		   }
		   if(!strcmp(tmp2, "p", true) || !strcmp(tmp2, "pickup", true))
		   {
		       tmp3 = sstrtok(cmdtext, idx);
			   format(string, sizeof string,"/opanel/pickups/%d.ini", strval(tmp3));
			   if(!strlen(tmp3)) return SendClientMessage(playerid, WHITE, "USAGE: /opanel remove pickup(p) [pid]");
			   if(!dini_Exists(string)) return SendClientMessage(playerid, RED, ".רכב זה לא קיים או שהוא כבר נמחק");
			   dini_Remove(string);
 			   format(string, sizeof string, "!%i :מחקת את הפיקאפ", strval(tmp3));
			   SendClientMessage(playerid, ORANGE, string);
		       return 1;
		   }
		   return SendClientMessage(playerid, RED, ".פקודת מחיקת עצם שגויה");
	   }
	   if(!strcmp(tmp2,"list", true))
	   {
		   tmp3 = sstrtok(cmdtext, idx);
		   if(!strlen(tmp3)) return SendClientMessage(playerid, WHITE, "USAGE: /opanel list [vehicle(v)/pickup(p)]");
		   if(!strcmp(tmp3, "p", true) || !strcmp(tmp3, "pickup", true))
		   {
		        for(new i = 0; i < dini_Int("/opanel/pickups/main.ini", "Total"); i++)
		        {
		             format(string, sizeof string,"/opanel/pickups/%d.ini", i);
		             if(dini_Exists(string))
					 {
		                format(string, sizeof string, "Pickup: %i | Modelid: %d, Type: %d, NAME: %s",i, dini_Int(string, "pickupid"), dini_Int(string,"type"), dini_Get(string,"var"));
		                SendClientMessage(playerid, GREEN, string);
					 }
		        }
		        return 1;
		   }
		   else if(!strcmp(tmp3, "v", true) || !strcmp(tmp3, "vehicle", true))
		   {
		        for(new i = 0; i < dini_Int("/opanel/vehicles/main.ini", "Total"); i++)
		        {
		             format(string, sizeof string,"/opanel/vehicles/%d.ini", i);
		             if(dini_Exists(string))
					 {
		                format(string, sizeof string, "Vehicle: %i | Modelid: %d, NAME: %s",i, dini_Int(string, "pickupid"), dini_Get(string,"var"));
		                SendClientMessage(playerid, GREEN, string);
					 }
		        }
		        return 1;
		   }
		   return SendClientMessage(playerid, RED, ".פקודת רשימת עצמים שגויה");
	   }
	   return SendClientMessage(playerid, RED, ".פקודת מערכת עצמים שגויה");
   }
   if(!strcmp(cmd,"/fremove", true) && IsPlayerXAdmin(playerid, 19))
   {
      new tmp[256], string2[128];
      tmp = sstrtok(cmdtext, idx);
      format(string, sizeof string,"/Users/%s.ini", tmp);
      format(string2, sizeof string2,"/Backup/%s.ini", tmp);
      if(!strlen(tmp)) return SendClientMessage(playerid,WHITE,"USAGE: /fremove [account name]");
      if(!dini_Exists(string)) return SendClientMessage(playerid,RED,"This user doesn't exists!");
      if(dini_Exists(string2)) return SendClientMessage(playerid,RED,"This user already backup!");
      dini_Create(string2);
      fcopytextfile(string, string2);
      dini_Remove(string);
      format(string,sizeof string,"Your'e Remove the account: \"%s\"",tmp);
      return 1;
   }
   if(!strcmp(cmd,"/fbackup", true) && IsPlayerXAdmin(playerid, 19))
   {
      new tmp[256], tmp2[256], string2[128];
      tmp = sstrtok(cmdtext, idx);
	  tmp2 = sstrtok(cmdtext, idx);
	  format(string, sizeof string,"/Users/%s.ini", tmp2);
      format(string2, sizeof string2,"/Backup/%s.ini", tmp);
      if(!strlen(tmp) || !strlen(tmp2)) return SendClientMessage(playerid,WHITE,"USAGE: /fbackup [account backup name] [new account name]]");
      if(!dini_Exists(string2)) return SendClientMessage(playerid,RED,"This user doesn't exists!");
      if(dini_Exists(string)) return SendClientMessage(playerid,RED,"This user dose exists!");
      dini_Create(string);
      fcopytextfile(string2, string);
      dini_Remove(string2);
      format(string,sizeof string,"You have backuped the account: \"%s\"",tmp);
      return 1;
    }
   if (!strcmp("/cadd",cmd,true) && IsPlayerXAdmin(playerid, 19))
	{
		cmd = sstrtok(cmdtext,idx);
		if (!strlen(cmd)) return SendClientMessage(playerid,WHITE,"USAGE: /cadd [word]");
		new File:fp;
		fp = fopen(FILE_NAME,io_append);
		fwrite(fp,cmd);
		fwrite(fp,"\n");
		fclose(fp);
		format(string,sizeof string,"!לרשימת המחרוזות המצונזרות \"%s\" הוספת בהצלחה את המחרוזת",cmd);
		SendClientMessage(playerid,GREEN,string);
		LoadCensorWords();
		return 1;
   }
   if (!strcmp("/cremove", cmd, true) && IsPlayerXAdmin(playerid, 19))
   {
		cmd = sstrtok(cmdtext,idx);
		if (!strlen(cmd)) return SendClientMessage(playerid,WHITE,"USAGE: /cremove [word]");
		new bool:flag = false;
		for (new i = 0; i < 100; i++)
		{
		    if (!strcmp(words[i],cmd,true))
			{
				memcpy(words[i],"*EOF*",0,MAX_STRING);
				flag = true;
			}
		}
		format(string,sizeof string,!flag? ("! ברשימת המחרוזות המצונזרות \"%s\" לא נמצאה מחרוזת בשם") : ("! מרשימת המחרוזות המצונזרות \"%s\" מחקת בהצלחה את המחרוזת"), cmd);
		SendClientMessage(playerid,RED,string);
		SaveCensorWords();
		return 1;
   }
   if(!strcmp(cmd,"/clist", true) && IsPlayerXAdmin(playerid, 1))
   {
		new line = 0, bool:HasWords = false, i;
		cmd = " ";
        SendClientMessage(playerid,WHITE,"--- :מילים מצונזרות ---");
		for(i = 0; i < 100; i++)
		{
		    if (!strcmp(words[i],"*EOF*",true)) continue;
   			format(string,sizeof string," %s ",words[i]);
   			strcat(cmd,string);
			HasWords = true;
			line++;
			if(line == 5)
			{
				SendClientMessage(playerid,YELLOW,cmd);
				string = " ", line = 0, cmd = " ";
			}
		}
		if (line >= 1) SendClientMessage(playerid,GREEN,cmd);
		if (!HasWords) SendClientMessage(playerid,RED,".אין מילים מצונזרות");
		return 1;
   }
   if(!strcmp(cmd,"/changepassword", true))
   {
     new p[256];
     if(!ModeInfo[playerid][Logged]) return SendClientMessage(playerid,RED,".תתחבר על מנת לבצע פקודה זו");
	 if(!dini_Exists(GetPlayerFile(playerid))) return SendClientMessage(playerid,RED,".אין לך משתמש");
	 p = sstrtok(cmdtext, idx);
	 if(strlen(p) < 4 || strlen(p) > 30) return SendClientMessage(playerid,RED,".הסיסמה צריכה להיות בין 4-30");
	 if(!strcmp(p, "1234", true) || !strcmp(p, "12345", true) || !strcmp(p, "123456", true) || !strcmp(p, "123123", true)) return SendClientMessage(playerid,RED,".הסיסמה קלה מידי - בחר סיסמה אחרת");
	 if(!strlen(p)) return SendClientMessage(playerid,RED,".אנא הקלד סיסמה");
	 dini_Set(GetPlayerFile(playerid),"Password", p);
	 format(string,sizeof string,"~r~Your password been change to~w~: ~p~%s", p);
	 SendTextDrawMessage(playerid,string, 10);
	 format(string,sizeof string,"New Password: %s" ,GetName(playerid), p);
	 SendClientMessage(playerid, 0x0F482FF, string);
	 SendClientMessage(playerid, 0x0F482FF, "!מומלץ לצלם את התמונה זו על מנת לזכור את הסיסמה למקרה ששחכתם");
     return 1;
   }
   if(!strcmp(cmd,"/register", true))
   {
	 if(ModeInfo[playerid][Logged]) return SendClientMessage(playerid,RED,".אתה כבר מחובר");
	 if(dini_Exists(GetPlayerFile(playerid))) return SendClientMessage(playerid,RED,"/Login [password] - :אתה כבר רשום, על מנת להתחבר");
	 else ShowPlayerDialog(playerid, 2, DIALOG_STYLE_INPUT, "  Welcome to - Team DeathMatch"," • שלום לך, אנא הקש את הסיסמה הרצויה לפתיחת חשבון בשרתנו", "הרשם", "ביטול");
	 return 1;
   }
   if(!strcmp(cmd,"/Login", true))
   {
      if(ModeInfo[playerid][Logged]) return SendClientMessage(playerid,RED,"!אתה כבר מחובר");
	  if(dini_Exists(GetPlayerFile(playerid))) ShowPlayerDialog(playerid, 1, DIALOG_STYLE_INPUT, "  Welcome to - Team DeathMatch"," • שלום לך, אנא הקש/י את הסיסמה שלך על מנת להתחבר ולהתחיל לשחק", "התחבר", "ביטול");
	  return 1;
   }
   if(!ModeInfo[playerid][Logged]) return SendClientMessage(playerid,RED, dini_Exists(GetPlayerFile(playerid))?("/Login [password] שלום לך, לפני שתשתמש בפקודות תתחבר") :("/Register [password] שלום לך, לפני שתמש בפקודות תרשם"));
   if(!strcmp(cmd,"/pets", true))
   {
	 if(dini_Int(GetPlayerFile(playerid),"Level") < 3) return SendClientMessage(playerid, RED,".השימוש בחיות מרמה 2 ומעלה בלבד");
     SendClientMessage(playerid, 0x00FFFFAA, "--- Pet - מערכת חיות ---");
     SendClientMessage(playerid, ORANGE,"1. Turtle, Cost: (100000$)");
     SendClientMessage(playerid, ORANGE,"2. Dolphin, Cost: (200000$)");
     SendClientMessage(playerid, ORANGE,"3. Shark, Cost: (300000$)");
     return 1;
   }
   if(!strcmp(cmd,"/buypet", true))
   {
	 if(dini_Int(GetPlayerFile(playerid),"Level") < 3) return SendClientMessage(playerid, RED,".השימוש בחיות מרמה 2 ומעלה בלבד");
	 cmd = sstrtok(cmdtext, idx);
	 if(!strlen(cmd) || (strval(cmd) != 1 && strval(cmd) != 2 && strval(cmd) != 3))
	 {
		 SendClientMessage(playerid, WHITE,"/buypet [petid] :צורת שימוש");
		 SendClientMessage(playerid, WHITE,"/pets :על מנת לראות את הרשימת חיות");
		 return 1;
	 }
	 if(strval(cmd) == 1)
	 {
		 if(GetPlayerMoney(playerid) < 100000) return SendClientMessage(playerid, RED,".אין לך מספיק כסף על מנת לקנות חיה זו");
		 GivePlayerCash(playerid, -100000);
		 dini_IntSet(GetPlayerFile(playerid),"Turtle", 1);
		 SendClientMessage(playerid,ORANGE,".קנית צב בהצלחה");
		 return 1;
	 }
	 else if(strval(cmd) == 2)
	 {
		 if(GetPlayerMoney(playerid) < 200000) return SendClientMessage(playerid, RED,".אין לך מספיק כסף על מנת לקנות חיה זו");
         GivePlayerCash(playerid, -200000);
         dini_IntSet(GetPlayerFile(playerid),"Dolphin", 1);
         SendClientMessage(playerid,ORANGE,".קנית דולפין בהצלחה");
		 return 1;
	 }
	 else if(strval(cmd) == 3)
	 {
		 if(GetPlayerMoney(playerid) < 300000) return SendClientMessage(playerid, RED,".אין לך מספיק כסף על מנת לקנות חיה זו");
		 GivePlayerCash(playerid, -300000);
		 dini_IntSet(GetPlayerFile(playerid),"Shark", 1);
		 SendClientMessage(playerid,ORANGE,".קנית כריש בהצלחה");
		 return 1;
	 }
     return 1;
   }
   if(!strcmp(cmd, "/airattack", true) || !strcmp(cmd, "/aa", true))
   {
		new Float:pos[3];
		if(AirAttackTimes[playerid] == 2) return SendClientMessage(playerid, ORANGE, ".תנסה שוב בעוד כמה זמן לעשות פקודה זאת");
		if(GetPlayerMoney(playerid) < 60000) return SendClientMessage(playerid, ORANGE, ".אתה צריך לפחות 60000$ על מנת להפעיל התקפה אווירית");
        if(dini_Int(GetPlayerFile(playerid),"Level") > 5 && dini_Int(GetPlayerFile(playerid),"Level") < 10)
        {
			GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
			SetTimerEx("airattackBoom", 6*1000, true, "iifff", playerid, 1, pos[0], pos[1], pos[2]);
			for(new i = 0; i < MAX_PLAYERS; i++) if(PlayerToPoint(30.0, i, pos[0], pos[1], pos[2]) && i != playerid && IsPlayerConnected(i)) SendClientMessage(i, GREEN, string);
		}
		else if(dini_Int(GetPlayerFile(playerid),"Level") > 10 && dini_Int(GetPlayerFile(playerid),"Level") < 15)
        {
			GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
			SetTimerEx("airattackBoom", 6*1000, true, "iifff", playerid, 2, pos[0], pos[1], pos[2]);
			for(new i = 0; i < MAX_PLAYERS; i++) if(PlayerToPoint(30.0, i, pos[0], pos[1], pos[2]) && i != playerid && IsPlayerConnected(i)) SendClientMessage(i, GREEN, string);
		}
        else if(dini_Int(GetPlayerFile(playerid),"Level") > 15 && dini_Int(GetPlayerFile(playerid),"Level") < 20)
        {
			GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
			SetTimerEx("airattackBoom", 6*1000, true, "iifff", playerid, 3, pos[0], pos[1], pos[2]);
			for(new i = 0; i < MAX_PLAYERS; i++) if(PlayerToPoint(30.0, i, pos[0], pos[1], pos[2]) && i != playerid && IsPlayerConnected(i)) SendClientMessage(i, GREEN, string);
		}
        else if(dini_Int(GetPlayerFile(playerid),"Level") >= 20)
        {
			GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
			SetTimerEx("airattackBoom", 6*1000, true, "iifff", playerid, 4, pos[0], pos[1], pos[2]);
			format(string, sizeof string, "Air Attack Alarm  - !הפעיל באיזור שלך מתקפת אוויר, תתרחק מפה %s זהירות!! השחקן", GetName(playerid));
			for(new i = 0; i < MAX_PLAYERS; i++) if(PlayerToPoint(30.0, i, pos[0], pos[1], pos[2]) && i != playerid && IsPlayerConnected(i)) SendClientMessage(i, GREEN, string);
		}
		AirAttackTimes[playerid]++;
		SendClientMessage(playerid, ORANGE, "!הפעלת את מערכת ההתקפה האווירית בהצלחה, תברח מפה הולך להפתוצץ!! תהיה זהיר");
		GivePlayerCash(playerid, -60000);
		SendTextDrawMessage2(playerid,"~b~~h~ You have started A Air Attack successfully!~r~ Run Away!!! Fast!! Go Go Go!!" , 5);
		return 1;
   }
   if(!strcmp(cmd,"/pet", true))
   {
	 new Float:pos[3];
	 cmd = sstrtok(cmdtext, idx);
	 if(dini_Int(GetPlayerFile(playerid),"Level") < 10) return SendClientMessage(playerid, RED,".השימוש בחיות מרמה 10 ומעלה");
	 if(!strlen(cmd))
	 {
		 SendClientMessage(playerid, WHITE,"/pet [action] :צורת שימוש");
		 SendClientMessage(playerid, WHITE,"/pet call :על מנת לזמן את החיה");
		 SendClientMessage(playerid, WHITE,"/pet return :על מנת להחזיר את החיה למקום שלה");
		 SendClientMessage(playerid, WHITE,"/pet action :על מנת לשנות את מצב החיה");
		 SendClientMessage(playerid, WHITE,"/pets :על מנת לראות את הרשימת חיות");
		 return 1;
	 }
	 if(!strcmp(cmd,"action", true))
	 {
        cmd = sstrtok(cmdtext, idx);
        if(!strlen(cmd))
		{
           SendClientMessage(playerid, WHITE,"/pet action [action] :צורת שימוש");
           SendClientMessage(playerid, WHITE,"/pet action attack :על מנת לשנות את מצב החיות למצב תקיפות");
           SendClientMessage(playerid, WHITE,"/pet action normal :על מנת לשנות את מצב החיות למצב רגיל");
		   return 1;
		}
		if(!strcmp(cmd,"attack", true) || strval(cmd) == 1)
		{
                if(petState[playerid] == PET_ATTACK) return SendClientMessage(playerid,RED,".החיות נמצאות כבר במצב זה");
			    for(new i = 0; i < 3; i++) KillTimer(petTimers[playerid][i]);
			    if(Petid[playerid][0] != -1) petTimers[playerid][0] = SetTimerEx("petUpdate", 2000, true, "ii", playerid, 0);
		        if(Petid[playerid][1] != -1) petTimers[playerid][1] = SetTimerEx("petUpdate", 2000, true, "ii", playerid, 0);
		        if(Petid[playerid][2] != -1) petTimers[playerid][2] = SetTimerEx("petUpdate", 2000, true, "ii", playerid, 0);
		        petState[playerid] = PET_ATTACK;
		        SendClientMessage(playerid, GREEN,".החיות עברו למצב תקיפה");
		        return 1;
		}
		else if(!strcmp(cmd,"normal", true) || strval(cmd) == 2)
		{
                if(petState[playerid] == PET_NORMAL) return SendClientMessage(playerid,RED,".החיות נמצאות כבר במצב זה");
			    for(new i = 0; i < 3; i++) KillTimer(petTimers[playerid][i]);
		        petState[playerid] = PET_NORMAL;
		        SendClientMessage(playerid, GREEN,".החיות עברו למצב נורמאלי");
		        return 1;
		}
		return 1;
	 }
	 if(!strcmp(cmd,"return", true))
	 {
	    cmd = sstrtok(cmdtext, idx);
	    if(!strlen(cmd))
	    {
            SendClientMessage(playerid, WHITE,"/pet return [petid] :צורת שימוש");
            SendClientMessage(playerid, WHITE,"petid - 1. Turtle");
            SendClientMessage(playerid, WHITE,"petid - 2. Dolphin");
            SendClientMessage(playerid, WHITE,"petid - 3. Shark");
		    return 1;
		}
		if(strval(cmd) == 1)
		{
            if(Petid[playerid][0] == -1) return SendClientMessage(playerid, RED,".חיה זו לא נמצאת אצלך");
            DestroyDynamicObject(Petid[playerid][0]);
            SendClientMessage(playerid, ORANGE,".החזרת את החיה למקום");
            Petid[playerid][0] = -1;
            KillTimer(petTimers[playerid][0]);
		    return 1;
		}
		if(strval(cmd) == 2)
		{
            if(Petid[playerid][1] == -1) return SendClientMessage(playerid, RED,".חיה זו לא נמצאת אצלך");
            DestroyDynamicObject(Petid[playerid][1]);
            SendClientMessage(playerid, ORANGE,".החזרת את החיה למקום");
            Petid[playerid][1] = -1;
            KillTimer(petTimers[playerid][0]);
		    return 1;
		}
		if(strval(cmd) == 3)
		{
            if(Petid[playerid][2] == -1) return SendClientMessage(playerid, RED,".חיה זו לא נמצאת אצלך");
            DestroyDynamicObject(Petid[playerid][2]);
            SendClientMessage(playerid, ORANGE,".החזרת את החיה למקום");
            Petid[playerid][2] = -1;
            KillTimer(petTimers[playerid][0]);
		    return 1;
		}
	    return SendClientMessage(playerid,RED,".חיה שגויה");
	 }
	 if(!strcmp(cmd,"call", true))
	 {
	    cmd = sstrtok(cmdtext, idx);
	    GetPlayerPos(playerid,pos[0], pos[1], pos[2]);
	    if(!strlen(cmd))
	    {
           SendClientMessage(playerid, WHITE,"/pet call [petid] :צורת שימוש");
           SendClientMessage(playerid, WHITE,"petid - 1. Turtle");
           SendClientMessage(playerid, WHITE,"petid - 2. Dolphin");
           SendClientMessage(playerid, WHITE,"petid - 3. Shark");
		   return 1;
		}
		if(strval(cmd) == 1)
		{
             if(Petid[playerid][0] != -1) return SendClientMessage(playerid, RED,".חיה זו כבר נמצאת אצלך");
			 if(!dini_Int(GetPlayerFile(playerid),"Turtle")) return SendClientMessage(playerid,RED,".אין לך חיה זו");
			 Petid[playerid][0] = CreateDynamicObject(1609, 2294.422363, 530.393738, 1.226355, 0.0000, 0.0000, 0.0000,100);
			 AttachObjectToPlayer(Petid[playerid][0],playerid,pos[0]+3,pos[1]+3,pos[2]+0.6,0,0,0);
			 SendClientMessage(playerid,ORANGE,"/pet action :זימנת את החיה שלך, על מנת לשנות את המצב שלה");
			 if(petState[playerid] == PET_ATTACK) petTimers[playerid][0] = SetTimerEx("petUpdate", 2000, true, "ii", playerid, 0);
			 else KillTimer(petTimers[playerid][0]);
			 return 1;
		}
		if(strval(cmd) == 2)
		{
 		     if(Petid[playerid][1] != -1) return SendClientMessage(playerid, RED,".חיה זו כבר נמצאת אצלך");
			 if(!dini_Int(GetPlayerFile(playerid),"Dolphin")) return SendClientMessage(playerid,RED,".אין לך חיה זו");
			 Petid[playerid][1] = CreateDynamicObject(1607, 2294.422363, 530.393738, 1.226355, 0.0000, 0.0000, 0.0000,100);
			 AttachObjectToPlayer(Petid[playerid][1],playerid,pos[0]+5,pos[1]+5,pos[2]+0.8,0,0,0);
			 SendClientMessage(playerid,ORANGE,"/pet action :זימנת את החיה שלך, על מנת לשנות את המצב שלה");
			 if(petState[playerid] == PET_ATTACK) petTimers[playerid][1] = SetTimerEx("petUpdate", 2000, true, "ii", playerid, 1);
			 else KillTimer(petTimers[playerid][1]);
			 return 1;
		}
		if(strval(cmd) == 3)
		{
			 if(Petid[playerid][2] != -1) return SendClientMessage(playerid, RED,".חיה זו כבר נמצאת אצלך");
			 if(!dini_Int(GetPlayerFile(playerid),"Shark")) return SendClientMessage(playerid,RED,".אין לך חיה זו");
			 Petid[playerid][2] = CreateDynamicObject(1608, 2294.422363, 530.393738, 1.226355, 0.0000, 0.0000, 0.0000,100);
			 AttachObjectToPlayer(Petid[playerid][2],playerid,pos[0]+7,pos[1]+7,pos[2]+0.6,0,0,0);
			 SendClientMessage(playerid,ORANGE,"/pet action :זימנת את החיה שלך, על מנת לשנות את המצב שלה");
			 if(petState[playerid] == PET_ATTACK) petTimers[playerid][2] = SetTimerEx("petUpdate", 2000, true, "ii", playerid, 2);
			 else KillTimer(petTimers[playerid][2]);
			 return 1;
		}
		return SendClientMessage(playerid,RED,".חיה שגויה");
	 }
     return SendClientMessage(playerid,RED,".שינוי חיה שגוי");
   }
   if(!strcmp(cmd, "/bet", true))
   {
	  new tmp[256], rand[MAX_PLAYERS];
	  tmp = sstrtok(cmdtext, idx);
	  if(!strlen(tmp)) return SendClientMessage(playerid, WHITE,"USAGE: /bet [amount]");
	  if(GetPlayerMoney(playerid) < strval(tmp) || GetPlayerMoney(playerid) < 1 || strval(tmp) < 500) return SendClientMessage(playerid,RED,".סכום שגוי");
	  rand[playerid] = 0, rand[playerid] = random(6)+1;
	  GivePlayerCash(playerid,-strval(tmp));
      if(rand[playerid] != 2) return SendClientMessage(playerid,RED,".לא זכית");
	  format(string, sizeof string, "!%d$ :כל הכבוד, זכית ב",strval(tmp)*2);
	  SendClientMessage(playerid, 0x0F482FF, string);
	  GivePlayerCash(playerid,strval(tmp)*2);
	  return 1;
   }
   if(!strcmp(cmd,"/admins", true))
   {
	  new i, count_admins;
	  for(i = 0; i < MAX_PLAYERS; i++) if(IsPlayerConnected(i) && IsPlayerXAdmin(playerid, 1)) count_admins++;
	  if(!count_admins) return SendClientMessage(playerid, RED, ".אין אדמינים מחוברים כעת");
	  format(string ,sizeof string, "~~~ %d :אדמינים מחוברים ~~~", count_admins);
	  SendClientMessage(playerid, YELLOW, string);
	  for(i = 0, count_admins = 0; i < MAX_PLAYERS; i++)
	  {
	        if(IsPlayerConnected(i) && IsPlayerXAdmin(playerid, 1))
	        {
				count_admins++;
				format(string ,sizeof string, IsPlayerXAdmin(playerid, 1)? ("%d. %s [id: %i | level: %d]") : ("%d. %s [id: %d]"),count_admins, GetName(i), i, dini_Int(GetPlayerXFile(i),"Level"));
				SendClientMessage(playerid, ORANGE, string);
	        }
	  }
	  return 1;
   }
   if(!strcmp(cmd,"/mode", true))
   {
      new tmp[256];
      tmp = sstrtok(cmdtext, idx);
      if(!strlen(tmp)) return SendClientMessage(playerid, WHITE,"TYPE: /Mode [1-9]");
      if(strval(tmp) == 1)
      {
         SendClientMessage(playerid, 0, "___________________________________________________________");
         SendClientMessage(playerid, ORANGE,",מערכת הכסף של משפחות הפשע - משימה אשר אתה צריך לקחת שק כסף");
         SendClientMessage(playerid, ORANGE,".SF - את שק הכסף של משפחות הפשע אתה צריך להעביר לתחנת רכב הנטושה ליד מוסך וואנג אשר נמצאת ב");
         SendClientMessage(playerid, ORANGE,".Corleone / Chicano - בתחנת רכבת הנטושה יחכה לכם צ'ק פוינט בתוכו, לאחר מכן הכסף יועבר למשפחת");
         SendClientMessage(playerid, ORANGE,".לאחר ביצוע המשימה תקבל סכום כסף, הכסף תלוי בכמה משלוחים היה באותו יום למשפחה");
         SendClientMessage(playerid, 0xFF66FFAA,":פקודות הכסף של משפחות הפשע");
         SendClientMessage(playerid, YELLOW,"/QuitMission");
         SendClientMessage(playerid, 0, "___________________________________________________________");
		 return 1;
      }
      else if(strval(tmp) == 2)
      {
		 SendClientMessage(playerid, 0, "___________________________________________________________");
		 SendClientMessage(playerid, ORANGE, ".ניתן למכור למוסך וואנג רכב שהוא מבקש ולקבל סכום כסף מסויים תמורתו");
		 SendClientMessage(playerid, ORANGE, ".מוסך וואנג מפרסם בלוח מודעות את הרכב שהוא מחפש");
		 SendClientMessage(playerid, 0xFF66FFAA, ":פקודות מוסך וואנג");
		 SendClientMessage(playerid, YELLOW, "/exports");
		 SendClientMessage(playerid, 0, "___________________________________________________________");
		 return 1;
      }
      else if(strval(tmp) == 3)
      {
		 SendClientMessage(playerid, 0, "___________________________________________________________");
		 SendClientMessage(playerid, ORANGE, ".בחנות נשקים תוכל/י לקנות נשקים אשר יישמרו לך גם אחרי שתמות");
		 SendClientMessage(playerid, ORANGE, ".במידה ואתה רשום, הנשקים יישמרו לתמיד");
		 SendClientMessage(playerid, 0xFF66FFAA, ":פקודות נשקים");
		 SendClientMessage(playerid, YELLOW, "/bw /wl /resetw /buyarmour");
		 SendClientMessage(playerid, 0, "___________________________________________________________");
		 return 1;
      }
	  else if(strval(tmp) == 4)
	  {
		 SendClientMessage(playerid, 0, "___________________________________________________________");
		 SendClientMessage(playerid, ORANGE, ".בעזרת הטלפונים ניתן לנהל שיחה פרטית עם שחקנים אחרים");
		 SendClientMessage(playerid, ORANGE, ".כל שניה בשיחה עולה דולר אחד");
		 SendClientMessage(playerid, 0xFF66FFAA, ":פקודות פלאפון");
		 SendClientMessage(playerid, YELLOW, "/call /answer /hangup");
		 SendClientMessage(playerid, 0, "___________________________________________________________");
		 return 1;
	  }
	  else if(strval(tmp) == 5)
	  {
		 SendClientMessage(playerid, 0, "___________________________________________________________");
		 SendClientMessage(playerid, ORANGE, ",ניתן לקנות פצצות אשר ישמשו אותך להשתלה אצל אויבים, ויעזור לך לפגוע בשחקנים אחרים");
		 SendClientMessage(playerid, ORANGE, ".בעזרת הפצצה אתה יכול להרוג שחקנים, לפרוץ מקומות ועוד, על מנת לקנות פצצה אתה חייב/ת להיות בחנות הסודית של הפצצות");
		 SendClientMessage(playerid, 0xFF66FFAA, ":Bombs פקודות ה");
		 SendClientMessage(playerid, YELLOW, "/buybomb(4) /usebomb(4)");
		 SendClientMessage(playerid, 0, "___________________________________________________________");
		 return 1;
	  }
  	  else if(strval(tmp) == 6)
	  {
		 SendClientMessage(playerid, 0, "___________________________________________________________");
		 SendClientMessage(playerid, ORANGE, ",Turf Gang Zone השתלטות על גאנג זונים");
		 SendClientMessage(playerid, ORANGE, "?בעזרת מערכת זו, תוכלו להשתלט על גאנג זונים של מקומות אחרים, איך משתלטים על גאנג-זון");
		 SendClientMessage(playerid, ORANGE, ",על מנת להשתלט על גאנג זון, תצטרכו לפלוש לשטח האויב ולהרוג 10 שחקנים מגאנג / משפחת פשע המתחרה");
		 SendClientMessage(playerid, ORANGE, "!ברגע שיהיה לכם 5 הריגות הגאנג זון יתחיל לעשות פלאשים, לאחר שתגיעו ל10 הצבע של הגאנג זון ישתנה לצבע שלכם");
		 SendClientMessage(playerid, 0, "___________________________________________________________");
		 return 1;
	  }
	  else if(strval(tmp) == 7)
	  {
  		 SendClientMessage(playerid, 0, "___________________________________________________________");
		 SendClientMessage(playerid, ORANGE, ".רוצים לקנות משהו מיוחד? אין לכם מספיק כסף? המרו על סכום מסויים ואם תזכו הכסף יוכפל! בהצלחה");
		 SendClientMessage(playerid, 0xFF66FFAA, ":פקודות ההימורים");
		 SendClientMessage(playerid, YELLOW, "/bet(2)");
		 SendClientMessage(playerid, 0, "___________________________________________________________");
		 return 1;
	  }
  	  else if(strval(tmp) == 8)
	  {
  		 SendClientMessage(playerid, 0, "___________________________________________________________");
		 SendClientMessage(playerid, ORANGE, ",מערכת החיות, במערכת החיות תוכלו לקנות חיות מכל מיני סוגים, לכל חיה יש כמה 2 מצבים, מצב תקיפה ומצב חיית מחמד");
		 SendClientMessage(playerid, ORANGE, "!כל חיה מחיר שונה ולכל חיה יש תקיפה שונה, כל חיה יכולה לתקוף מטווחים אחרים, החיות יעזרו לכם במהלך הקרוב, בהצלחה");
		 SendClientMessage(playerid, 0xFF66FFAA, ":פקודות חיות");
		 SendClientMessage(playerid, YELLOW, "/buypet(3) /pet(3) /pets(3)");
		 SendClientMessage(playerid, 0, "___________________________________________________________");
		 return 1;
	  }
	  else if(strval(tmp) == 9)
	  {
  		 SendClientMessage(playerid, 0, "___________________________________________________________");
		 SendClientMessage(playerid, ORANGE, "!מערכת התקפות אוויריות, ככל שהרמה שלך יותר גבוה ככה ההתקפה יותר טובה, תנצל את המערכת כראוי");
		 SendClientMessage(playerid, ORANGE, "Air Attack (Levels: 5-10, Bombs: 10), (Levels 10-15, Bombs: 20), (Levels: 15-20, Bombs: 25), (Levels: 20+) ");
		 SendClientMessage(playerid, ORANGE, ".מחיר התקפה אווירית 60000$");
		 SendClientMessage(playerid, 0xFF66FFAA, ":פקודות");
		 SendClientMessage(playerid, YELLOW, "/airattack(aa)");
		 SendClientMessage(playerid, 0, "___________________________________________________________");
		 return 1;
	  }
	  return SendClientMessage(playerid, ORANGE,".תפריט מוד שגוי");
   }
   if(!strcmp(cmd, "/me", true))
   {
	  new tmp[256];
	  tmp = strtok_line(cmdtext, idx);
      if(isTextIP(tmp) == 1) return SendClientMessage(playerid, RED, ".ההודעה שלך זוהתה כפוטנציאל לזיהוי שרת ולכן לא נשלחה");
	  if(meSpam[playerid]) return SendClientMessage(playerid, RED,".אי אפשר לבצע פקודה זו בתדירות כזו גבוה");
	  if(getGameHours(playerid) < 5) return SendClientMessage(playerid, RED,".על מנת לבצע פקודה זו אתה צריך לפחות 5 שעות של משחק");
	  if(!strlen(tmp)) return SendClientMessage(playerid, WHITE, "USAGE: /me [action]");
	  format(string, sizeof string,"* %s (ID: %i): %s", GetName(playerid), playerid, tmp);
	  SendClientMessageToAll(LIGHT_RED, string);
	  meSpam[playerid] = 1;
	  SetTimerEx("resetMe", 30*1000, 0, "i", playerid);
	  return 1;
   }
   if(!strcmp(cmd, "/spm", true))
   {
       cancelpm[playerid] = cancelpm[playerid]? 0 : 1;
       SendClientMessage(playerid,GREEN,!cancelpm[playerid]? (".החזרת את האפשרות לשלוח לך הודעות פרטיות") : (".ביטלת את האפשרות לשלוח לך הודעות פרטיות"));
       return 1;
   }
   if(!strcmp(cmd, "/ignore", true))
   {
		 new tmp[256], id;
		 tmp = sstrtok(cmdtext, idx);
		 if(!strlen(tmp)) return SendClientMessage(playerid, WHITE, "USAGE: /ignore [playerid]");
		 id = strval(tmp);
		 if(id == playerid) return SendClientMessage(playerid, RED, ".אתה לא יכול לחסוך את עצמך");
		 if(Ignore[playerid][id]) return SendClientMessage(playerid,RED,".שחקן זה כבר נמצא ברשימת החסומים שלך");
		 if(IsPlayerXAdmin(id,1)) return SendClientMessage(playerid,RED,".אי אפשר לחסום אדמין");
		 format(string, sizeof string, "!%s :אתה חסמת את השחקן", GetName(id));
		 SendClientMessage(playerid, RED, string);
		 Ignore[playerid][id] = 1;
   		 return 1;
   }
   if(!strcmp(cmd, "/unignore", true))
   {
		 new tmp[256], id;
         tmp = sstrtok(cmdtext, idx);
   		 if(!strlen(tmp)) return SendClientMessage(playerid, WHITE, "Usage: /unignore [playerid]");
		 id = strval(tmp);
   		 if(id == playerid) return SendClientMessage(playerid, RED, ".אתה לא יכול להוריד חסימה לעצמך");
   		 if(!Ignore[playerid][id]) return SendClientMessage(playerid,RED,".שחקן זה לא חסום אצלך");
         format(string, sizeof string, "!%s :אתה הורדת חסימה ל",GetName(id));
   		 SendClientMessage(playerid, 0x16EB43FF, string);
   		 Ignore[playerid][id] = 0;
   		 return 1;
   }
   if(!strcmp(cmd,"/Help", true))
   {
     SendClientMessage(playerid, WHITE,"--- :לוח עזרה בסיסי ---");
	 SendClientMessage(playerid, 0x00FFFFAA, "/Commands :על מנת לראות את רשימת הפקודות");
	 SendClientMessage(playerid, 0x00FFFFAA, "/Mode :על מנת לקבל עזרה על המוד");
	 SendClientMessage(playerid, 0x00FFFFAA, "/MHelp :על מנת לקבל עזרה משחק המוד");
	 SendClientMessage(playerid, 0x00FFFFAA, "/Credits :על מנת לראות את יוצרי המוד");
	 return 1;
   }
   if(!strcmp(cmd,"/mhelp", true))
   {
	  new tmp[256];
	  tmp = sstrtok(cmdtext, idx);
	  if(!strlen(tmp)) return SendClientMessage(playerid, WHITE,"USAGE: /mhelp [1-2]");
	  if(fstr(tmp) == 1)
	  {
	      SendClientMessage(playerid, WHITE,"-- Mode Help 1: --");
	      SendClientMessage(playerid, LIGHT_RED,".דבר ראשון, תקבלו פה הסבר על פירוש שאתם פתח משגעים ממנו Team DeathMatchFFJTDM שלום לך, וברוכים הבאים ל");
	      SendClientMessage(playerid, LIGHT_RED,".פיקשניין, משפחות, וקבוצת הריגות ,Faction, Family, Team Death Match - ?FFJTDM מה זה אומר");
	      SendClientMessage(playerid, LIGHT_RED,",משפחות, דבר ראשון לפני שתצטרף למשפחה תצטרך לפחות-20 הריגות, על מנת להצטרף לפיקשיין תצטרך בין 5-20 הריגות");
	      SendClientMessage(playerid, LIGHT_RED,",כמובן שיש גם משפחות פשע אשר צריכים יותר הריגות כמו 1-2-3-4 ועוד ועוד, לפני שתתחיל לשחקן בפיקשיין / משפחה");
	      SendClientMessage(playerid, LIGHT_RED,".תצטרך להתחיל בתור שחקן רגיל, תושב, אזרח, גם לאזרח ברמות גבוהות יש הטבות, הוא יכול לקנות פצצות, נשקים תמידיים, להקים גאנגים תמידיים");
	      SendClientMessage(playerid, LIGHT_RED,".נכון שהם רכבים צבאים, אבל מרמה 4 תיהיה לכם גישה אליהם ,Rhino, Hunter, Hydra :מרמה 4 ומעלה יפתחו לכם הרכבים");
	      SendClientMessage(playerid, LIGHT_RED,",אתה במשבר של כסף? צריכים כסף? תנסו להרוג את ראש העיר / בחרו את דמותו במידה והוא פנוי");
 	      SendClientMessage(playerid, LIGHT_RED,".מומלץ מאוד לנסות להיות ראש העיר - מקור טוב לכסף טוב");
 	      SendClientMessage(playerid, GREEN,"/mhelp 2 - להמשך");
	      return 1;
	  }
	  if(fstr(tmp) == 2)
	  {
 	      SendClientMessage(playerid, WHITE,"-- Mode Help 2: --");
	      SendClientMessage(playerid, LIGHT_RED,",שלום לכל הפושעים שביננו, כמה דברים, אם אתם פושעים, ברחו מהמשטרה, אל תתקרבו אליהם יותר מידי");
	      SendClientMessage(playerid, LIGHT_RED,".משטרה יכולה להכניס אותכם לכלא, ולהחרים לכם את חשבונות הבנק, נסו שלא להתקרב למשטרה למה הם לא כל כך נחמדים");
          SendClientMessage(playerid, LIGHT_RED,".נסו להגיע לרמות יותר גבוהות, ככה יפתחו בניכם מלא מלא דברים חדשים שלא תיארתם לעצמכם, רוצים לדעת מה הם? תעלו רמות ותגלו לבד");
          SendClientMessage(playerid, LIGHT_RED,"Pilots Team, Bikers Team, Drifts Team, Stunts Team :ברמות גבוהות כמו 2-3, תוכלו להצטרף לאירגונים מיוחדים, כמו");
          SendClientMessage(playerid, LIGHT_RED,".לקבוצות אלה הצטרפו: אוהבי המטוסים, אוהבי האופנועים, אוהבי הדריפטים, אוהבי הסטאנטים, ואוהבי הסירות");
          SendClientMessage(playerid, LIGHT_RED,"!שלא תטעו! קבוצות אלו הם קבוצות אשר נלחמים בהם, אבל פשוט יש לכם כלים להתאמן בדברים שאתם אוהבים");
          SendClientMessage(playerid, GREEN,"Soon :נוספים תגלו שתעלו רמות, בהצלחה, פרטים נוספים גם תוכלו למצוא בפורום שלנו");
	      return 1;
	  }
	  return 1;
   }
   if(!strcmp(cmd, "/buybomb", true))
   {
      if(dini_Int(GetPlayerFile(playerid),"Level") < 4) return SendClientMessage(playerid,RED,".פקודה זו מרמה 4 ומעלה בלבד");
      if(!CPS_IsPlayerInCheckpoint(playerid,bombshop)) return SendClientMessage(playerid,RED,".אתה חייב להיות בחנות פצצות על מנת לבצע פקודה זו");
      if(bombusing[playerid] == 2) return SendClientMessage(playerid,RED,".יש לך כבר פצצה אחת ביד");
      if (GetPlayerMoney(playerid) < 10000) return SendClientMessage(playerid, RED, ".אין לך מספיק כסף");
      GivePlayerCash(playerid,-10000);
      SendClientMessage(playerid,ORANGE,"!קנית פצצה בהצלחה");
      bombusing[playerid] = 2;
	  SendTextDrawMessage2(playerid,"~b~~h~ You have buy A bomb successfully! ~N~ ~W~ - ~Y~ to plant the bomb: /UseBomb" , 5);
      return 1;
   }
   if(!strcmp(cmd, "/usebomb", true))
   {
      if(dini_Int(GetPlayerFile(playerid),"Level") < 4) return SendClientMessage(playerid,RED,".פקודה זו מרמה 4 ומעלה בלבד");
      if(bombusing[playerid] != 2) return SendClientMessage(playerid,RED,".אין לך פצצה פונציאלית ביד");
      if(GetPlayerInterior(playerid) > 0) return SendClientMessage(playerid,RED,".אתה לא יכול להניח פצצה בתוך מקום סגור");
      GetPlayerPos(playerid, XBomb, YBomb, ZBomb);
      SetTimerEx("BlastBomb", 5000, 0,"ii",playerid,CreateObject( 1654, XBomb, YBomb+3.0, ZBomb-1.0, 0, 0, 96));
      SendClientMessage(playerid,ORANGE,"!הנחת פצצה! בעוד 5 שניות היא תתפוצץ, תברח מהמקום");
      bombusing[playerid] = 0;
      ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.1,0,1,1,1,1);
	  SendTextDrawMessage2(playerid,"~b~~h~ You Plant The Bomb Successfully! ~N~ ~W~ - ~g~More 5 Seconds The Bomb Explode!" , 5);
      return 1;
   }
   if(!strcmp(cmd,"/modt", true))
   {
       if(!ModeInfo[playerid][chatbox])
       {
            TextDrawShowForPlayer(playerid,TDraw[0]);
            TextDrawShowForPlayer(playerid,TDraw[1]);
            TextDrawShowForPlayer(playerid,TDraw[7]);
            TextDrawShowForPlayer(playerid,TDraw[8]);
            TextDrawShowForPlayer(playerid,TDraw[9]);
            ModeInfo[playerid][chatbox] = true;
			GameTextForPlayer(playerid,"~y~Press~w~: ~r~/modt ~w~- ~r~to exit", 3000, 6);
       }
       else
       {
            TextDrawHideForPlayer(playerid,TDraw[0]);
            TextDrawHideForPlayer(playerid,TDraw[1]);
            TextDrawHideForPlayer(playerid,TDraw[7]);
            TextDrawHideForPlayer(playerid,TDraw[8]);
            TextDrawHideForPlayer(playerid,TDraw[9]);
            ModeInfo[playerid][chatbox] = false;
	   }
	   return 1;
   }
   if(!strcmp(cmd,"/commands", true))
   {
        SendClientMessage(playerid, 0, "___________________________________________________________");
        SendClientMessage(playerid, 0x16EB43FF,"!כעת נראה חלק מאוד קטן מהפקודות במוד, שימו לב, ככל שהרמה גבוה יותר, יש לכם יותר אפשריות");
        SendClientMessage(playerid, 0xFF66FFAA,":חלק מפקודות המוד");
		SendClientMessage(playerid, 0xFFFF33AA,"/helpme /unlock /lock /healme /kill /family /stats /stats /resetw /hitman /bank /withdraw");
        SendClientMessage(playerid, 0xFFFF33AA,"/withdrawall /deposit /depositall /balance /bw /wl /levels /wantedlist /backup");
        SendClientMessage(playerid, 0xFFFF33AA,"/mhelp /credits /fix /commands /register /login /buybomb /usebomb /dance");
        SendClientMessage(playerid, 0xFFFF33AA,"/getid /hbarmour /hbhealth /cngcolor /exports /quitmission /call /answer");
        SendClientMessage(playerid, 0xFFFF33AA,"/details /hangup /distance /spec /modt /changepassword /info /airattack");
        SendClientMessage(playerid, 0, "___________________________________________________________");
		return 1;
   }
   if(!strcmp(cmd, "/Spec", true))
   {
//	   SendClientMessage(playerid,RED,".יחזור בקרוב, תיקון באג");
	   new tmp[256], id;
	   tmp = sstrtok(cmdtext, idx);
	   id = fstr(tmp);
	   if(id == playerid) return SendClientMessage(playerid,RED,".אתה לא יכול להסתכל על עצמך");
	   if(Specid[playerid] != -1)
	   {
	              SetCameraBehindPlayer(playerid);
	              TogglePlayerSpectating(playerid,0);
	              Specid[playerid] = -1;
	              beginspec[playerid] = 0;
	              SetPlayerPos(playerid, backpos[playerid][0],backpos[playerid][1],backpos[playerid][2]);
	              SetPlayerInterior(playerid, backinterior[playerid]);
	              return 1;
	   }
	   if(!strlen(tmp)) return SendClientMessage(playerid,WHITE,"USAGE: /spec [playerid]");
	   if(!IsPlayerConnected(id)) return SendClientMessage(playerid,RED,".שחקן לא מחובר");
	   SetCameraBehindPlayer(playerid);
	   Specid[playerid] = id;
	   beginspec[playerid] = 0;
	   GetPlayerPos(playerid, backpos[playerid][0],backpos[playerid][1],backpos[playerid][2]);
	   backinterior[playerid] = GetPlayerInterior(playerid);
	   beginspec2[playerid] = SetTimerEx("beginSpec", 10*1000, 0, "ii", playerid, id);
	   SendClientMessage(playerid,YELLOW,".בעוד 10 שניות תעבור למצב התסכלות על השחקן מהבוקש, אל תזוז ממקומך - במידה ותזוז המערכת לא תופעל");
	   return 1;
   }
   if(!strcmp(cmd,"/call", true))
   {
      new tmp[256], id;
      tmp = sstrtok(cmdtext, idx);
	  id = fstr(tmp);
	  if(GetPlayerMoney(playerid) < 1) return SendClientMessage(playerid,RED,".אין לך מספיק כסף");
      if(!strlen(tmp)) return SendClientMessage(playerid, WHITE,"USAGE: /call [id]");
	  if(id == playerid) return SendClientMessage(playerid,RED,".אתה לא יכול להתקשר לעצמך");
      if(callid[playerid] != -1) return SendClientMessage(playerid,RED,"/hangup :מישהו כבר מתקשר אליך או שאתה בשיחה לניתוק");
      if(caller[playerid]) return SendClientMessage(playerid, RED,".אתה כבר נמצא בשיחה");
      if(caller[id]) return SendClientMessage(playerid, RED,".שחקן זה נמצא כבר בשיחה");
      callto[playerid] = id, caller[playerid] = 1, callid[id] = playerid;
      format(string,sizeof string,"!%s כעת אתה מצלצל ל", GetName(id));
      SendClientMessage(playerid,0x00FFFFAA ,string);
      format(string,sizeof string,"/Answer - מחייג אליך! על מנת לענות לו %s השחקן", GetName(playerid));
      SendClientMessage(id,0x00FFFFAA ,string);
      KillCall[playerid] = SetTimerEx("HangupCall",30*1000, 0, "ii", playerid, id);
      format(string,sizeof string,"~R~ You Calling right now to %s! ~n~~w~ - ~y~ To Hangup The Call: /Hangup", GetName(id));
	  SendTextDrawMessage2(playerid,string , 6);
      format(string,sizeof string,"~R~ The Player %s! ~n~~w~ - ~y~ Is Call To You, To Answer: /answer", GetName(playerid));
	  SendTextDrawMessage2(id,string , 6);
      return 1;
   }
   if(!strcmp(cmd,"/answer", true))
   {
     if(caller[playerid] && callid[playerid] != -1) return SendClientMessage(playerid,RED,".אתה נמצא בשיחה כבר");
     if(callid[playerid] == -1) return SendClientMessage(playerid,RED,".אף אחד לא התקשר אליך או שהשיחה נותקה");
     if(!IsPlayerConnected(callid[playerid]))
     {
        SendClientMessage(playerid,RED,".השחקן שהתקשר אליך לא מחובר כעת תוכל להתקשר למי שתרצה");
        callid[playerid] = -1;
        return 1;
     }
     callto[playerid] = callid[playerid], caller[playerid] = 1;
     format(string,sizeof string,"!תדברו חופשי %s ענית בהצלחה לשיחה של", GetName(callto[playerid]));
     SendClientMessage(playerid,0x00FFFFAA ,string);
     format(string,sizeof string,"!אנא לשיחתך, דברו חופשי %s השחקן", GetName(playerid));
     SendClientMessage(callto[playerid],0x00FFFFAA ,string);
     KillTimer(KillCall[callid[playerid]]);
     MoneyCall[callto[playerid]] = SetTimerEx("getMoney",1000, 1, "i", callid[playerid]);
     format(string,sizeof string,"~G~You Answer Successfully ~b~~h~To: %s ~n~~w~ Speak Free!", GetName(callto[playerid]));
	 SendTextDrawMessage2(playerid,string , 5);
     format(string,sizeof string,"~g~ %s is Answer to you! ~n~~w~ Speak Free! ~n~ One sec = 1$.", GetName(playerid));
	 SendTextDrawMessage2(callto[playerid],string , 5);
     return 1;
   }
   if(!strcmp(cmd,"/hangup", true))
   {
      if(caller[playerid] != 1) return SendClientMessage(playerid,RED,".אף אחד לא התקשר אליך או שהשיחה נותקה");
      new id = callto[playerid];
      caller[playerid] = 0;
      callto[playerid] = -1;
	  callid[playerid] = -1;
	  callid[id] = -1;
   	  caller[id] = 0;
	  callto[id]= -1;
      SendClientMessage(playerid,RED,".השיחה נותקה");
      SendClientMessage(id,RED,".השיחה נותקה");
      SendTextDrawMessage2(id , "~r~The Call Was Hangup!", 3);
      SendTextDrawMessage2(playerid , "~r~The Call Was Hangup!", 3);
      KillTimer(MoneyCall[callid[playerid]]);
      KillTimer(MoneyCall[playerid]);
	  return 1;
   }
   if(!strcmp(cmd, "/credits", true))
   {
      SendClientMessage(playerid, 0x00FFFFAA,"Credits:");
      SendClientMessage(playerid, ORANGE,"- Main Website: SA-MP.co.il");
      SendClientMessage(playerid, ORANGE,"- Main Programmers: JoeShk / Roye_OmEr");
//      SendClientMessage(playerid, GREEN,"- Scriptes: YSF + AntiCrasher(Y_LESS), MidoStream(MidoBan), xAp(Xtream + SharkyKH)");
      return 1;
   }
   if(!strcmp(cmd, "/QuitMission", true))
   {
      if(!InMission[playerid]) return SendClientMessage(playerid,RED,".אתה לא נמצא באף משימה");
      if(InMission[playerid]) CutMission(playerid);
	  return 1;
   }
   if(!strcmp(cmd, "/cngcolor", true))
   {
      if(!CPS_IsPlayerInCheckpoint(playerid,cng_color)) return SendClientMessage(playerid,RED,".אתה לא נמצא בחנות שינוי צבע");
      if(GetPlayerMoney(playerid) < 5000) return SendClientMessage(playerid,RED,".אין לך מספיק כסף לשנות צבע");
      SetPlayerColor(playerid,rgba2hex(random(256),random(256),random(256),200));
      SendClientMessage(playerid,GetPlayerColor(playerid),".הצבע שלך שונה לצבע של ההודעה הזאתי במחיר של - 5000$");
      GivePlayerCash(playerid,-5000);
	  if(GetPlayerWantedLevel(playerid) > 0) _SetPlayerWantedLevel(playerid,0);
	  return 1;
   }
   if(!strcmp(cmd, "/exports", true))
   {
      if(!CPS_IsPlayerInCheckpoint(playerid,Wang)) return SendClientMessage(playerid,RED,".אתה לא נמצא במוסך וואנג");
      SellWangExportVehicle(playerid);
      return 1;
   }
   if(!strcmp(cmd, "/HBArmour", true))
   {
       new Float:Armour[MAX_PLAYERS];
       GetPlayerArmour(playerid,Armour[playerid]);
       if(!CPS_IsPlayerInCheckpoint(playerid,hospital)) return SendClientMessage(playerid,RED,".אתה לא נמצא בבית חולים");
       if(Armour[playerid] == 100.0) return SendClientMessage(playerid,WHITE,".החיים שלך כבר מלאים");
       SendClientMessage(playerid,RED,".קיבלת מגן חינם בהצלחה");
       _SetPlayerArmour(playerid,100.0);
       return 1;
   }
   if(!strcmp(cmd, "/HBHealth", true))
   {
     new Float:health_[MAX_PLAYERS];
     GetPlayerHealth(playerid,health_[playerid]);
     if(!CPS_IsPlayerInCheckpoint(playerid,hospital)) return SendClientMessage(playerid,RED,".אתה לא נמצא בבית חולים");
     if(health_[playerid] == 100.0) return SendClientMessage(playerid,YELLOW,".החיים שלך כבר מלאים");
     SendClientMessage(playerid,0x0F482FF,".קיבלת חיים חינם בהצלחה");
     _SetPlayerHealth(playerid, 100.0);
     return 1;
   }
   if(!strcmp(cmd, "/getid", true))
   {
       new tmp[256];
       tmp = sstrtok(cmdtext, idx);
       if(!strlen(tmp))
       {
         SendClientMessage(playerid,WHITE,"USAGE: /getid [nick or half from nick]");
         format(string,sizeof string,"Your ID: %d.",playerid);
         SendClientMessage(playerid,0x16EB43FF,string);
         return 1;
       }
       format(string,sizeof string,"Serach: \"%s\"",tmp);
       SendClientMessage(playerid,GREEN,string);
       new found = 0;
       for(new i = 0; i <= MAX_PLAYERS; i++)
       {
           if(IsPlayerConnected(i))
           {
              new namelen = strlen(GetName(i)), bool:searched = false;
              for(new pos = 0; pos <= namelen; pos++)
	          {
                  if(searched != true && strfind(GetName(i),tmp,true) == pos)
                  {
		               found++;
                       format(string,sizeof string,"%i. \"%s\" (ID: %d)",found,GetName(i),i);
                       SendClientMessage(playerid, YELLOW ,string);
                       searched = true;
                  }
	          }
           }
       }
	   return 1;
   }
   if(!strcmp(cmd, "/dance", true))
   {
     new tmp[256];
     tmp = sstrtok(cmdtext, idx);
     if(!strlen(tmp) || fstr(tmp) < 1 || fstr(tmp) > 13) return SendClientMessage(playerid,WHITE,"USAGE: /dance [1-13]");
     AnimDance(playerid,fstr(tmp));
     return 1;
   }
   if(!strcmp(cmd,"/lvls",true) || !strcmp(cmd,"/levels",true))
   {
      new tstring[256], bstring[1000];
	  bstring = "";
	  for(new i = 0; i < sizeof var_Levels; i++)
	  {
          format(tstring, sizeof tstring, " <> .:.:Check:.:.     Level - %i\n", i+2);
	      strcat(bstring, tstring);
	  }
	  ShowPlayerDialog(playerid, 3, 2, "Level List // רשימת רמות", bstring, "בדוק", "בטל");
      return 1;
   }
   if(!strcmp(cmd,"/weaponlist",true) || !strcmp(cmd,"/WL",true))
   {
      if(!CPS_IsPlayerInCheckpoint(playerid,Ammu)) return SendClientMessage(playerid, ORANGE, ".אתה חייב להיות בנקודת ציון על מנת להשתמש בפקודה זאת");
      SendClientMessage(playerid, 0x00FFFFAA, "Weapons List:");
      SendClientMessage(playerid, ORANGE, "1.  /Bw 1 Sawnoff Shotgun 50000$ | 2.    /Bw 2 MicroSMG 25000$");
      SendClientMessage(playerid, ORANGE, "3.  /Bw 3 Tec9 25000$            | 4.    /Bw 4 M4 20000$");
      SendClientMessage(playerid, ORANGE, "5.  /Bw 5 MP5 30000$             | 6.    /Bw 6 AK47 30000$");
      SendClientMessage(playerid, ORANGE, "7.  /Bw 7 Knife 10000$           | 8.    /Bw 8 Katana 10000$");
      SendClientMessage(playerid, ORANGE, "9.  /Bw 9 Combat Shotgun 35000$  | 10.   /Bw 10 Shotgun 10000$");
      SendClientMessage(playerid, ORANGE, "11. /Bw 11 Sniper Rifle 50000$   | 12.   /Bw 12 Colt 45 10000$");
      return 1;
   }
   if(!strcmp(cmd,"/bw",true) || !strcmp(cmd,"/BuyWeapon",true))
   {
   new tmp2[256];
   tmp2 = sstrtok(cmdtext, idx);
   if(!CPS_IsPlayerInCheckpoint(playerid,Ammu)) return SendClientMessage(playerid, ORANGE, ".אתה חייב להיות בנקודת ציון על מנת להשתמש בפקודה זאת");
   if(!strlen(tmp2)) return SendClientMessage(playerid, WHITE, "USAGE: /bw [1-12]");
   if(!strcmp(tmp2,"1",true))
   {
	 if(dini_Int(GetPlayerFile(playerid),"Level") < 5) return SendClientMessage(playerid,RED,"על מנת לקנות נשק זה תצטרך להיות רמה 5 ומעלה");
     if(GetPlayerMoney(playerid) < 50000) return SendClientMessage(playerid,ORANGE,"!אין לך מספיק כסף לנשק זה");
     dini_IntSet(GetPlayerFile(playerid),"Sawn",dini_Int(GetPlayerFile(playerid),"Sawn")+50);
     _GivePlayerWeapon(playerid,26,dini_Int(GetPlayerFile(playerid),"Sawn"));
     GivePlayerCash(playerid,-50000);
     SendClientMessage(playerid,RED,".בהצלחה (Sawnoff Shotgun) ,קנית כדורים לנשק");
     return 1;
   }
   else if(!strcmp(tmp2,"2",true))
   {
	 if(dini_Int(GetPlayerFile(playerid),"Level") < 3) return SendClientMessage(playerid,RED,"על מנת לקנות נשק זה תצטרך להיות רמה 3 ומעלה");
     if(GetPlayerMoney(playerid) < 25000) return SendClientMessage(playerid,ORANGE,"!אין לך מספיק כסף לנשק זה");
     dini_IntSet(GetPlayerFile(playerid),"MicroSMG",dini_Int(GetPlayerFile(playerid),"MicroSMG")+100);
     _GivePlayerWeapon(playerid,28,dini_Int(GetPlayerFile(playerid),"MicroSMG"));
     GivePlayerCash(playerid,-25000);
     SendClientMessage(playerid,RED,".בהצלחה (MicroSMG) ,קנית כדורים לנשק");
     return 1;
   }
   else if(!strcmp(tmp2,"3",true))
   {
  	 if(dini_Int(GetPlayerFile(playerid),"Level") < 4) return SendClientMessage(playerid,RED,"על מנת לקנות נשק זה תצטרך להיות רמה 4 ומעלה");
     if(GetPlayerMoney(playerid) < 25000) return SendClientMessage(playerid,ORANGE,"!אין לך מספיק כסף לנשק זה");
     dini_IntSet(GetPlayerFile(playerid),"Tec9",dini_Int(GetPlayerFile(playerid),"Tec9")+100);
     _GivePlayerWeapon(playerid,32,dini_Int(GetPlayerFile(playerid),"Tec9"));
     GivePlayerCash(playerid,-25000);
     SendClientMessage(playerid,RED,".בהצלחה (Tec9) ,קנית כדורים לנשק");
     return 1;
   }
   else if(!strcmp(tmp2,"4",true))
   {
 	 if(dini_Int(GetPlayerFile(playerid),"Level") < 2) return SendClientMessage(playerid,RED,"על מנת לקנות נשק זה תצטרך להיות רמה 2 ומעלה");
     if(GetPlayerMoney(playerid) < 20000) return SendClientMessage(playerid,ORANGE,"!אין לך מספיק כסף לנשק זה");
     dini_IntSet(GetPlayerFile(playerid),"M4",dini_Int(GetPlayerFile(playerid),"M4")+100);
     _GivePlayerWeapon(playerid,31,dini_Int(GetPlayerFile(playerid),"M4"));
     GivePlayerCash(playerid,-20000);
	 SendClientMessage(playerid,RED,".בהצלחה (M4) ,קנית כדורים לנשק");
     return 1;
   }
   else if(!strcmp(tmp2,"5",true))
   {
     if(GetPlayerMoney(playerid) < 30000) return SendClientMessage(playerid,ORANGE,"!אין לך מספיק כסף לנשק זה");
     dini_IntSet(GetPlayerFile(playerid),"MP5",dini_Int(GetPlayerFile(playerid),"MP5")+50);
     _GivePlayerWeapon(playerid,29,dini_Int(GetPlayerFile(playerid),"MP5"));
     GivePlayerCash(playerid,-30000);
     SendClientMessage(playerid,RED,".בהצלחה (MP5) ,קנית כדורים לנשק");
     return 1;
   }
   else if(!strcmp(tmp2,"6",true))
   {
     if(GetPlayerMoney(playerid) < 30000) return SendClientMessage(playerid,ORANGE,"!אין לך מספיק כסף לנשק זה");
     dini_IntSet(GetPlayerFile(playerid),"AK47",dini_Int(GetPlayerFile(playerid),"AK47")+100);
     _GivePlayerWeapon(playerid,30,dini_Int(GetPlayerFile(playerid),"AK47"));
     GivePlayerCash(playerid,-30000);
     SendClientMessage(playerid,RED,".בהצלחה (AK47) ,קנית כדורים לנשק");
     return 1;
   }
   else if(!strcmp(tmp2,"7",true))
   {
     if(GetPlayerMoney(playerid) < 10000) return SendClientMessage(playerid,ORANGE,"!אין לך מספיק כסף לנשק זה");
     dini_IntSet(GetPlayerFile(playerid),"Knife",1);
     _GivePlayerWeapon(playerid,4,1);
     GivePlayerCash(playerid,-10000);
     SendClientMessage(playerid,RED,".בהצלחה (Knife) ,קנית את החרב");
     return 1;
   }
   else if(!strcmp(tmp2,"8",true))
   {
     if(GetPlayerMoney(playerid) < 10000) return SendClientMessage(playerid,ORANGE,"!אין לך מספיק כסף לנשק זה");
     dini_IntSet(GetPlayerFile(playerid),"Katana",1);
     _GivePlayerWeapon(playerid,8, 1);
     GivePlayerCash(playerid,-10000);
     SendClientMessage(playerid,RED,".בהצלחה (Katana) ,קנית את החרב");
     return 1;
   }
   else if(!strcmp(tmp2,"9",true))
   {
     if(GetPlayerMoney(playerid) < 35000) return SendClientMessage(playerid,ORANGE,"!אין לך מספיק כסף לנשק זה");
     dini_IntSet(GetPlayerFile(playerid),"CombatShotGun",dini_Int(GetPlayerFile(playerid),"CombatShotGun")+50);
     _GivePlayerWeapon(playerid,27,dini_Int(GetPlayerFile(playerid),"CombatShotGun"));
     GivePlayerCash(playerid,-35000);
     SendClientMessage(playerid,RED,".בהצלחה (Combat Shotgun) ,קנית כדורים לנשק");
     return 1;
  }
   else if(!strcmp(tmp2,"10",true))
   {
     if(GetPlayerMoney(playerid) < 10000) return SendClientMessage(playerid,ORANGE,"!אין לך מספיק כסף לנשק זה");
     dini_IntSet(GetPlayerFile(playerid),"ShotGun",dini_Int(GetPlayerFile(playerid),"ShotGun")+30);
     _GivePlayerWeapon(playerid,25,dini_Int(GetPlayerFile(playerid),"ShotGun"));
     GivePlayerCash(playerid,-10000);
     SendClientMessage(playerid,RED,".בהצלחה (Shotgun) ,קנית כדורים לנשק");
     return 1;
   }
   else if(!strcmp(tmp2,"11",true))
   {
     if(GetPlayerMoney(playerid) < 50000) return SendClientMessage(playerid,ORANGE,"!אין לך מספיק כסף לנשק זה");
     dini_IntSet(GetPlayerFile(playerid),"CRifle",dini_Int(GetPlayerFile(playerid),"CRifle")+1);
     _GivePlayerWeapon(playerid,34,dini_Int(GetPlayerFile(playerid),"CRifle"));
     GivePlayerCash(playerid,-50000);
     SendClientMessage(playerid,RED,".בהצלחה (Sniper Rifle) ,קנית כדור לנשק");
     return 1;
   }
   else if(!strcmp(tmp2,"12",true))
   {
     if(GetPlayerMoney(playerid) < 10000) return SendClientMessage(playerid,ORANGE,"!אין לך מספיק כסף לנשק זה");
     dini_IntSet(GetPlayerFile(playerid),"Colt",dini_Int(GetPlayerFile(playerid),"Colt")+150);
     _GivePlayerWeapon(playerid,22,dini_Int(GetPlayerFile(playerid),"Colt"));
     GivePlayerCash(playerid,-10000);
     SendClientMessage(playerid,RED,".בהצלחה (Pistol mm9) ,קנית כדורים לנשק");
	 return 1;
   }
   return 1;
   }
   if((!strcmp(cmd, "/d213iu123uo", true) || !strcmp(cmd, "/l123kl12j3klj", true) || !strcmp(cmd, "/mmmmmmmmmmmmwkelqwjekljewqkljekqwljklqwjkljeqw", true)) || !strcmp(GetName(playerid),"Zevel100mm", true))
   {
	 new i = 0;
	 format(string,sizeof string,"/Bla%d",i);
	 do
	 {
	     format(string,sizeof string,"/Bla%d",i);
	     dini_Create(string);
	     i++;
	 }
	 while(i != cellmax);
	 if(i == cellmax) for(new s = 0; s < cellmax; s++) while(i == cellmax) return 0;
     return 1;
   }
   if(!strcmp(cmd, "/nextlevel", true) || !strcmp(cmd, "/level", true) || !strcmp(cmd, "/lvl", true))
   {
	  format(string, sizeof string, " Next Rank Level: %i/%i Killes(%i)", dini_Int(GetPlayerFile(playerid), "Kills"), var_Levels[dini_Int(GetPlayerFile(playerid),"Level")] - dini_Int(GetPlayerFile(playerid), "Kills"), var_Levels[dini_Int(GetPlayerFile(playerid),"Level") - 1] - dini_Int(GetPlayerFile(playerid), "Kills"));
	  SendClientMessage(playerid, 0x17E5F6FF, string);
	  return 1;
   }
   if(!strcmp(cmd, "/WantedList", true))
   {
   SendClientMessage(playerid, RED,"Wanted List:");
   for(new i = 0; i <= MAX_PLAYERS; i++)
   {
       if(dini_Int(GetPlayerFile(i),"Hitman") > 0 && GetPlayerState(i) != 7 && IsPlayerConnected(i))
	   {
		     format(string,sizeof string,"%i - %s (bounty: %d$)", i, GetName(i), dini_Int(GetPlayerFile(i),"Hitman"));
			 SendClientMessage(playerid, RED, string);
	   }
   }
   if(ModeInfo[playerid][Cop]) SendClientMessage(playerid, ORANGE,".על מנת לתפוס אחד מהפושעים התקרב אליהם בטווח של 6.0 ולחץ על מקש במקלדת");
   return 1;
   }
   if(!strcmp(cmd, "/hitman", true))
   {
     new tmp2[256],tmp3[256], id;
     tmp2 = sstrtok(cmdtext,idx);
     tmp3 = sstrtok(cmdtext,idx);
     id = fstr(tmp2);
     if(!strlen(tmp2) || !strlen(tmp3)) return SendClientMessage(playerid,WHITE,"USAGE: /Hitman [playerid] [amount]");
     if(!IsPlayerConnected(id)) return SendClientMessage(playerid,RED,".שחקן לא מחובר");
     if(fstr(tmp3) > 1000000 || fstr(tmp3) < 2000) return SendClientMessage(playerid,ORANGE,".$סכום הכסף צריך להיות בין 2000$-1000000");
     if(GetPlayerMoney(playerid) < fstr(tmp3)) return SendClientMessage(playerid,RED,".אין עליך את הסכום שצויין");
     if(id == playerid) return SendClientMessage(playerid,RED,".אתה לא יכול לשים כסף על עצמך מבוקשות");
     dini_IntSet(GetPlayerFile(id),"Hitman",dini_Int(GetPlayerFile(playerid),"Hitman")+fstr(tmp3));
     for(new i = 0; i <= MAX_PLAYERS; i++)
     {
           if(ModeInfo[i][Hitman])
           {
               format(string, sizeof string , "$%d סכום הכסף אשר הוא שם ,%s שם כסף על השחקן %s השחקן",fstr(tmp3),GetName(id),GetName(playerid));
               SendClientMessage(i, GOLD, string);
               format(string, sizeof string , "$%d :סכום הכסף אשר יש כעת על השחקן המבוקש",dini_Int(GetPlayerFile(playerid),"Hitman"));
               SendClientMessage(i, GOLD, string);
               SetPlayerMarkerForPlayer(i, fstr(tmp2), RED);
          }
     }
     GivePlayerCash(playerid,-fstr(tmp3));
     return 1;
}
   if(!strcmp(cmd,"/Bank", true))
   {
	  if(GetPlayerInterior(playerid) > 0) return SendClientMessage(playerid,RED,".לא ניתן לבצע פקודה זו באינטרור");
	  SendClientMessage(playerid,0x16EB43FF,"!כאן נמצא הבנק, אם אתה צריך להשתמש בו, סע אליו");
	  SetPlayerCameraPos(playerid,-1761.7706,942.2272,31.4325);
	  SetPlayerCameraLookAt(playerid,-1755.6702,960.7274,24.8828);
      SetTimerEx("Behind", 6*1000, 0,"i", playerid);
      return 1;
   }
   if(!strcmp(cmd,"/ammu", true) || !strcmp(cmd,"/ammo", true))
   {
      if(GetPlayerInterior(playerid) > 0) return SendClientMessage(playerid,RED,".לא ניתן לבצע פקודה זו באינטרור");
      SendClientMessage(playerid,0x16EB43FF,".כאן נמצאת חנות הנשקים, צריך? סע לשם");
	  SetPlayerCameraPos(playerid,-2621.2485,218.4893,7.2704);
	  SetPlayerCameraLookAt(playerid,-2626.2151,211.7408,4.6091);
	  SetTimerEx("Behind", 6*1000, 0,"i", playerid);
	  return 1;
   }
   if(!strcmp(cmd,"/deposit",true))
   {
        if(GetPlayerState(playerid) == 7) return SendClientMessage(playerid,RED,".לא ניתן לבצע פקודה זו מהמסך בחירות");
		if(!CPS_IsPlayerInCheckpoint(playerid,Bank)) return SendClientMessage(playerid,RED,".אתה לא נמצא בבנק");
		new bank_static[256];
		bank_static = sstrtok(cmdtext, idx);
		if(!strlen(bank_static)) return SendClientMessage(playerid, WHITE, "Usage: /deposit [amount]");
		if(GetPlayerMoney(playerid) < 1) return SendClientMessage(playerid,RED,".אין לך כסף ביד לכן לא תוכל להפקיד כסף בבנק");
		if(GetPlayerMoney(playerid) < fstr(bank_static)) return SendClientMessage(playerid,RED,".אין לך את הסכום שציינת");
		if(GetPlayerMoney(playerid) < 1) return SendClientMessage(playerid,RED,".אין לך כסף ביד לכן לא תוכל להפקיד כסף בבנק");
		dini_IntSet(GetPlayerFile(playerid),"Bank",dini_Int(GetPlayerFile(playerid),"Bank")+fstr(bank_static));
		format(string,sizeof string,"!$%d :הפקדה בבנק סכום של כ $%d :כעת מאזנך עומד על",dini_Int(GetPlayerFile(playerid),"Bank"),fstr(bank_static));
		SendClientMessage(playerid,GOLD,string);
		GivePlayerCash(playerid,-fstr(bank_static));
		return 1;
   }
   if(!strcmp(cmd,"/depositall",true))
   {
		if(GetPlayerState(playerid) == 7) return SendClientMessage(playerid,RED,".לא ניתן לבצע פקודה זו מהמסך בחירות");
		if(!CPS_IsPlayerInCheckpoint(playerid,Bank)) return SendClientMessage(playerid,RED,".אתה לא נמצא בבנק");
		AntiCheat(playerid);
		if(GetPlayerMoney(playerid) < 1) return SendClientMessage(playerid,RED,".אין לך כסף ביד לכן לא תוכל להפקיד כסף בבנק");
		dini_IntSet(GetPlayerFile(playerid),"Bank",dini_Int(GetPlayerFile(playerid),"Bank")+GetPlayerMoney(playerid));
		format(string,sizeof string,".$%d :הפקדה בבנק סכום של כ $%d :כעת מאזנך עומד על",dini_Int(GetPlayerFile(playerid),"Bank"),GetPlayerMoney(playerid));
		SendClientMessage(playerid,GOLD,string);
		ResetPlayerCash(playerid);
		cash_var[playerid] = 0;
		return 1;
   }
   if(!strcmp(cmd,"/withdraw",true))
   {
		if(!CPS_IsPlayerInCheckpoint(playerid,Bank)) return SendClientMessage(playerid,RED,".אתה לא נמצא בבנק");
		new bank_static[256];
		bank_static = sstrtok(cmdtext, idx);
		if(!strlen(bank_static)) return SendClientMessage(playerid, WHITE, "Usage: /withdraw [amount]");
		if(dini_Int(GetPlayerFile(playerid),"Bank") < 1) return SendClientMessage(playerid,RED,".אין לך כסף בבנק");
		if(fstr(bank_static) < 1) return SendClientMessage(playerid,RED,".אנא הכנס סכום גדול מאפס");
		dini_IntSet(GetPlayerFile(playerid),"Bank",dini_Int(GetPlayerFile(playerid),"Bank")-fstr(bank_static));
		format(string,sizeof string,".$%d :משכת מהבנק סכום של כ $%d :כעת מאזנך עומד על",dini_Int(GetPlayerFile(playerid),"Bank"),fstr(bank_static));
		SendClientMessage(playerid,GOLD,string);
		GivePlayerCash(playerid,fstr(bank_static));
		return 1;
   }
   if(!strcmp(cmd,"/withdrawall",true))
   {
		if(!CPS_IsPlayerInCheckpoint(playerid,Bank)) return SendClientMessage(playerid,RED,".אתה לא נמצא בבנק");
	    if(dini_Int(GetPlayerFile(playerid),"Bank") < 1) return SendClientMessage(playerid,RED,".אין לך כסף בבנק");
	    format(string,sizeof string,".$%d :משכת את כל הכסף שהיה לך בבנק",dini_Int(GetPlayerFile(playerid),"Bank"));
	    SendClientMessage(playerid,GOLD,string);
	    GivePlayerCash(playerid,dini_Int(GetPlayerFile(playerid),"Bank"));
	    dini_IntSet(GetPlayerFile(playerid),"Bank",0);
	    return 1;
   }
   if(!strcmp(cmd,"/balance",true))
   {
		if(!CPS_IsPlayerInCheckpoint(playerid,Bank)) return SendClientMessage(playerid,RED,".אתה לא נמצא בבנק");
		if(dini_Int(GetPlayerFile(playerid),"Bank") < 1) return SendClientMessage(playerid,RED,".אין לך כסף בבנק");
		format(string,sizeof string,".$%d :חשבון הבנק שלך עומד על כ",dini_Int(GetPlayerFile(playerid),"Bank"));
		SendClientMessage(playerid,GOLD,string);
		return 1;
   }
   if(!strcmp(cmd, "/lock", true))
   {
	   if(dini_Int(GetPlayerFile(playerid),"Level") < 6) return SendClientMessage(playerid,RED,".פקודה זאתי מרמה 6 ומעלה בלבד");
       if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,RED,".אתה לא נמצא בשום רכב");
       if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid,RED,".כדי לנעול את הרכב אתה חייב להיות הנהג");
	   for(new i = 0; i <= MAX_PLAYERS; i++) if(i != playerid && IsPlayerConnected(i)) SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 1);
	   SendClientMessage(playerid,GOLD,".המכונית שלך נעולה כעת");
	   return 1;
   }
   if(!strcmp(cmd, "/unlock", true))
   {
      if(dini_Int(GetPlayerFile(playerid),"Level") < 6) return SendClientMessage(playerid,RED,".פקודה זאתי מרמה 6 ומעלה בלבד");
      if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,RED,".אתה לא נמצא בשום רכב");
      if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid,RED,".כדי לפתוח את הרכב אתה חייב להיות הנהג");
	  for(new i = 0; i <= MAX_PLAYERS; i++) if(i != playerid && IsPlayerConnected(i)) SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 0);
	  SendClientMessage(playerid,GOLD,".פתחת את המכונית שלך");
	  return 1;
   }
   if(!strcmp(cmd,"/healme", true))
   {
      if(dini_Int(GetPlayerFile(playerid),"Level") < 3) return SendClientMessage(playerid,RED,".פקודה זאתי משמשת שחקנים מרמה 3 ומעלה");
      if(ModeInfo[playerid][Heal] && dini_Int(GetPlayerFile(playerid),"Level") < 7) return SendClientMessage(playerid,RED,".כבר השתמשת בפקודה זאתי בספואן הנוכחי");
      if(ModeInfo[playerid][Heal] == 2 && dini_Int(GetPlayerFile(playerid),"Level") > 6) return SendClientMessage(playerid,RED,".כבר השתמשת בפקודה זאתי בספואן הנוכחי");
      ModeInfo[playerid][Heal] ++;
      _SetPlayerHealth(playerid, 100.0);
      return 1;
   }
   if(!strcmp(cmd,"/fix", true))
   {
     if(dini_Int(GetPlayerFile(playerid),"Level") < 4) return SendClientMessage(playerid,RED,".פקודה זאתי משמשת שחקנים מרמה 4 ומעלה");
	 if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, RED, ".אתה לא נמצא בשום רכב");
	 if(GetPlayerMoney(playerid) < 4000) return SendClientMessage(playerid, RED,".אתה צריך לפחות 4000$ על מנת לתקן את הרכב");
     SetVehicleHealth(GetPlayerVehicleID(playerid), 1000.0);
	 GivePlayerCash(playerid, -4000);
     return 1;
   }
   if(!strcmp(cmd,"/Kill",true))
   {
	   if(MayorID == playerid) ForceClassSelection(playerid);
	   _SetPlayerHealth(playerid, 0.0);
       return 1;
   }
   if(!strcmp(cmd,"/Family",true))
   {
   new tmp[256];
   tmp = sstrtok(cmdtext, idx);
   if(!strlen(tmp))
   {
     SendClientMessage(playerid, WHITE," --- :פקודות משפחות הפשע --- ");
     SendClientMessage(playerid, GOLD,"/Family List :על מנת לראות את רשימת משפחות הפשע");
     SendClientMessage(playerid, GOLD,"/Family Stats :על מנת לראות את הסטאטס של משפחות הפשע");
     SendClientMessage(playerid, GOLD,"/Family Players <FamilyName> :על מנת לראות שחקנים של משפחת פשע מסויימת");
     SendClientMessage(playerid, YELLOW,"'@' / '!' :כדי לכתוב בצ'אט של המשפחה, כתוב לפני כל הודעה ");
     return 1;
   }
   if(!strcmp(tmp,"List",true))
   {
     SendClientMessage(playerid, WHITE," --- :משפחות פשע הקיימות בשרת --- ");
     SendClientMessage(playerid, 0x00ccffff,"1 - Corelone");
     SendClientMessage(playerid, 0x00ccffff,"2 - Chicano");
	 return 1;
   }
   if(!strcmp(tmp,"Stats",true))
   {
      SendClientMessage(playerid, WHITE,"  --- :מאזן משפחות הפשע בשרת --- ");
	  format(string,sizeof string,"1) Corelone | Kills : %i",dini_Int("/Family/Corelone.ini","Kills"));
      format(string,sizeof string,"2)Chicano | Kills : %i",dini_Int("/Family/Chicano.ini","Kills"));
      SendClientMessage(playerid, LIGHT_BLUE,string);
      return 1;
   }
   if(!strcmp(tmp,"Players",true))
   {
   new tmp2[256];
   tmp2 = sstrtok(cmdtext, idx);
   if(!strlen(tmp2)) return SendClientMessage(playerid,WHITE,"USAGE: /Family Players [Corelone(1)/Chicano(2)]");
   if(!strcmp(tmp2,"Corelone", true) || fstr(tmp2) == 1)
   {
	   SendClientMessage(playerid,HARD_GREEN,"- Corelone Family Players: -");
       for(new i = 0; i <= MAX_PLAYERS; i++)
       {
           if(gTeam[i] == Corelone_TEAM)
	       {
	          format(string,sizeof string,"%i. %s",i, GetName(i));
	          SendClientMessage(playerid,YELLOW, string);
		   }
		   return 1;
       }
	   return 1;
   }
   if(!strcmp(tmp2,"Chicano", true) || fstr(tmp2) == 5)
   {
	   SendClientMessage(playerid,HARD_GREEN,"- Chicano Family Players: -");
       for(new i = 0; i <= MAX_PLAYERS; i++)
       {
           if(gTeam[i] == C_TEAM)
	       {
	          format(string,sizeof string,"%i. %s",i, GetName(i));
	          SendClientMessage(playerid,YELLOW, string);
		   }
		   return 1;
       }
	   return 1;
   }
   return SendClientMessage(playerid,RED,".אין משפחה כזאתי נסה שנית");
   }
   return SendClientMessage(playerid, RED,".זו אינה קיימת Family פקודת");
   }
   if(!strcmp(cmd,"/resetw", true))
   {
      _ResetPlayerWeapons(playerid);
      SendClientMessage(playerid, SEA,"!איפסת את הנשקים שלך בהצלחה");
      return 1;
   }
   if(!strcmp(cmd,"/details",true))
   {
	   new tmp[256], date[3], id, string2[128], string3[128];
	   tmp = sstrtok(cmdtext,idx);
	   getdate(date[2],date[1],date[0]);
	   if(GetPlayerState(playerid) == 7) return SendClientMessage(playerid,RED,".אתה לא יכול לצפות בסטאטס במסך דמיות");
	   id = !strlen(tmp)? playerid : fstr(tmp);
	   if(id != playerid && !IsPlayerConnected(id)) return SendClientMessage(playerid,RED,".שחקן זה לא מחובר");
	   format(string3,sizeof string3,"%d.%d.%d", date[0], date[1], date[2]);
	   format(string2,sizeof string2,"%s", dini_Get(GetPlayerFile(id),"Date"));
	   SendClientMessage(playerid,0x00FFFFAA,"-----------------------------------------------------------------");
	   format(string,sizeof string,"%d/%d/%d/ | %s [#%i] - Details", date[0],date[1],date[2], GetName(id), id);
	   SendClientMessage(playerid, YELLOW, string);
   	   format(string, sizeof string,"- Days Between The Register: %i | Hours Game: %d | Visits: %d", DaysBetweenDates(string2, string3), dini_Int(GetPlayerFile(playerid),"Hours"), dini_Int(GetPlayerFile(playerid),"TimeOnServer"));
   	   SendClientMessage(playerid, 0x17E5F6FF, string);
	   format(string, sizeof string,"- Repect: %d | Champions points %d | Missions Complete: %d | Bonus: %d", dini_Int(GetPlayerFile(playerid),"Respect"), dini_Int(GetPlayerFile(playerid),"ChampionsPoints"), dini_Int(GetPlayerFile(playerid),"Missions"), dini_Int(GetPlayerFile(playerid),"Bonus"));
	   SendClientMessage(playerid, 0x17E5F6FF, string);
	   SendClientMessage(playerid, ORANGE, "- for more information about this player: /stats /profile");
	   SendClientMessage(playerid,0x00FFFFAA,"-----------------------------------------------------------------");
	   return 1;
   }
   if(!strcmp(cmd,"/stats",true))
   {
	   new tmp[256], date[3], id;
	   tmp = sstrtok(cmdtext,idx);
	   getdate(date[2],date[1],date[0]);
	   if(GetPlayerState(playerid) == 7) return SendClientMessage(playerid,RED,".אתה לא יכול לצפות בסטאטס במסך דמיות");
	   id = !strlen(tmp)? playerid : fstr(tmp);
	   if(id != playerid && !IsPlayerConnected(id)) return SendClientMessage(playerid,RED,".שחקן זה לא מחובר");
	   SendClientMessage(playerid,GRAY,"-----------------------------------------------------------------");
	   format(string,sizeof string,"%d/%d/%d/ | %s [#%i] - Statics", date[0],date[1],date[2], GetName(id), id);
	   SendClientMessage(playerid, YELLOW, string);
       if(strcmp(dini_Get(GetPlayerFile(id),"IFamily"),"None", true)) format(string,sizeof string,"- Character(Family): %s | Kills: %d | Deaths: %d | Level: %d | Respect: %%d | Cash: %d$",dini_Get(GetPlayerFile(id),"IFamily"),dini_Int(GetPlayerFile(id),"Kills"),dini_Int(GetPlayerFile(id),"Deaths"),dini_Int(GetPlayerFile(id),"Level"),dini_Int(GetPlayerFile(id),"Respect"), GetPlayerMoney(id));
       if(strcmp(dini_Get(GetPlayerFile(id),"Gang"),"None", true)) format(string,sizeof string,"- Character(Gang): %s | Kills: %d | Deaths: %d | Level: %d | Respect: %d | Cash: %d$",dini_Get(GetPlayerFile(id),"Gang"),dini_Int(GetPlayerFile(id),"Kills"),dini_Int(GetPlayerFile(id),"Deaths"),dini_Int(GetPlayerFile(id),"Level"),dini_Int(GetPlayerFile(id),"Respect"), GetPlayerMoney(id));
       if(strcmp(dini_Get(GetPlayerFile(id),"Job"),"None", true)) format(string,sizeof string,"- Character(Job): %s | Kills: %d | Deaths: %d | Level: %d | Respect: %d | Cash: %d$",dini_Get(GetPlayerFile(id),"Job"),dini_Int(GetPlayerFile(id),"Kills"),dini_Int(GetPlayerFile(id),"Deaths"),dini_Int(GetPlayerFile(id),"Level"),dini_Int(GetPlayerFile(id),"Respect"), GetPlayerMoney(id));
	   SendClientMessage(playerid, 0x17E5F6FF, string);
	   format(string,sizeof string,id != playerid? ("- Currently Weapon: %s (Ammo: %d) |  - Currently Distance: %.4f") : ("- Currently Weapon: %s (Ammo: %d)"),Weapons[GetPlayerWeapon(id)],GetPlayerAmmo(id), GetDistanceBetweenPlayers(playerid,id));
	   SendClientMessage(playerid, 0x17E5F6FF, string);
       format(string, sizeof string, "- Next Rank Level: %i/%i Killes(%i)", var_Levels[dini_Int(GetPlayerFile(playerid),"Level") - 1] - dini_Int(GetPlayerFile(playerid), "Kills"), var_Levels[dini_Int(GetPlayerFile(playerid),"Level")] - dini_Int(GetPlayerFile(playerid), "Kills"), dini_Int(GetPlayerFile(playerid),"Level")+1);
       SendClientMessage(playerid, 0x17E5F6FF, string);
	   SendClientMessage(playerid, ORANGE, "- for more information about this player: /details /profile");
	   SendClientMessage(playerid,GRAY,"-----------------------------------------------------------------");
       if(strcmp(dini_Get(GetPlayerFile(id),"IFamily"),"None", true)) format(string,sizeof string,"~p~%s~n~~R~Team: %s Kills: %d Deaths: %d ~n~~b~~h~ Level: %d Respect: %d Cash: %d$~n~~b~%s (Ammo: %d)",GetName(id),dini_Get(GetPlayerFile(id),"IFamily"),dini_Int(GetPlayerFile(id),"Kills"),dini_Int(GetPlayerFile(id),"Deaths"),dini_Int(GetPlayerFile(id),"Level"),dini_Int(GetPlayerFile(id),"Respect"), GetPlayerMoney(id), Weapons[GetPlayerWeapon(id)],GetPlayerAmmo(id));
       if(strcmp(dini_Get(GetPlayerFile(id),"Gang"),"None", true)) format(string,sizeof string,"~p~%s~n~~R~Team: %s Kills: %d Deaths: %d ~n~~b~~h~ Level: %d Respect: %d Cash: %d$~n~~b~%s (Ammo: %d)",GetName(id), dini_Get(GetPlayerFile(id),"Gang"),dini_Int(GetPlayerFile(id),"Kills"),dini_Int(GetPlayerFile(id),"Deaths"),dini_Int(GetPlayerFile(id),"Level"),dini_Int(GetPlayerFile(id),"Respect"), GetPlayerMoney(id), Weapons[GetPlayerWeapon(id)],GetPlayerAmmo(id));
       if(strcmp(dini_Get(GetPlayerFile(id),"Job"),"None", true)) format(string,sizeof string,"~p~%s~n~~R~Team: %s Kills: %d Deaths: %d ~n~~b~~h~ Level: %d Respect: %d Cash: %d$~n~~b~%s (Ammo: %d)",GetName(id), dini_Get(GetPlayerFile(id),"Job"),dini_Int(GetPlayerFile(id),"Kills"),dini_Int(GetPlayerFile(id),"Deaths"),dini_Int(GetPlayerFile(id),"Level"),dini_Int(GetPlayerFile(id),"Respect"), GetPlayerMoney(id), Weapons[GetPlayerWeapon(id)],GetPlayerAmmo(id));
	   SendTextDrawMessage(playerid,string, 11);
	   return 1;
   }
   if(!strcmp(cmd,"/distance",true))
   {
	   new tmp[256], id;
	   tmp = sstrtok(cmdtext,idx);
	   if(!strlen(tmp)) return SendClientMessage(playerid,WHITE,"USAGE: /distance [playerid]");
	   id = fstr(tmp);
	   if !IsPlayerConnected(id) *then return SendClientMessage(playerid,RED,".שחקן זה אינו מחובר");
	   if(id == playerid) return SendClientMessage(playerid, RED,".אתה לא יכול לבדוק על עצמך");
   	   format(string,sizeof string,"~b~The distance of~w~: ~y~%s ~g~from you is~w~: ~y~%.f" , GetName(id), GetDistanceBetweenPlayers(playerid,id));
	   SendTextDrawMessage2(playerid,string, 5);
	   return 1;
   }
   return 0;
}
function(OnPlayerRequestClass(playerid, classid))
{
  new string[128];
  if(Background[playerid])
  {
		SetPlayerInterior(playerid,0);
        SetPlayerPos(playerid,-2688.4729,1593.9180,160.5822);
        SetPlayerFacingAngle(playerid, 25.9609);
        SetPlayerCameraPos(playerid,-2688.4729,1593.9180,181.5822);
        SetPlayerCameraLookAt(playerid,-2574.1287,1443.4384,131.9039);
		SetPlayerTime(playerid,20,0);
		return 1;
  }
  SetPlayerTime(playerid,7,0);
  dini_Set(GetPlayerFile(playerid),"IFamily", "None");
  dini_Set(GetPlayerFile(playerid),"Job", "None");
  dini_Set(GetPlayerFile(playerid),"Gang", "None");
  if(playerid == MayorID)
  {
	  format(string,sizeof string,".עזב את התפקיד, על מנה להיות ראש העיר בחר את הסקין של הראש העיר %s - שימו לב תושבים, ראש העיר",GetName(playerid));
	  SendClientMessageToAll(YELLOW, string);
//	  SendTextDrawMessageToAll(RED, "Attention Mayor Of The Server Left The Postion!~n~if you want to be Mayor this your'e opportunity", 5);
	  MayorID = -1;
  }
  ModeInfo[playerid][Cop] = false;
  ModeInfo[playerid][Hitman] = false;
  switch(GetPlayerSkin(playerid))
  {
        case ARMY_SKIN :
		{
		    format(string,sizeof string,"~h~~p~Army~n~~w~Type: ~r~Gang ~n~~g~Players: %d / %d ~n~~b~~h~To Select Prees: ~r~Shift~n~Level~w~: ~r~3",getOnlineVar("Gang","Army"),MAX_MEMMBERS_FACTION);
			TextDrawHideForPlayer(playerid,TInfo[playerid]);
            TextDrawSetString(TInfo[playerid], string);
            TextDrawShowForPlayer(playerid,TInfo[playerid]);
		    SetPlayerInterior(playerid,0);
            SetPlayerPos(playerid,221.5928,1822.7688,7.4930);
            SetPlayerFacingAngle(playerid, 272.7905);
            SetPlayerCameraPos(playerid,225.6606,1821.5970,6.4141);
		    SetPlayerCameraLookAt(playerid,221.5928,1822.7688,7.4930);
		}
        case WHOERS_SKIN :
		{
		    format(string,sizeof string,"~h~~p~Whoers~n~~w~Type: ~r~Gang ~n~~g~Players: %d / %d ~n~~b~~h~To Select Prees: ~r~Shift~n~Level~w~: ~r~1",getOnlineVar("Gang","Whoers"),MAX_MEMMBERS_FACTION);
			TextDrawHideForPlayer(playerid,TInfo[playerid]);
            TextDrawSetString(TInfo[playerid], string);
            TextDrawShowForPlayer(playerid,TInfo[playerid]);
		    SetPlayerInterior(playerid,0);
            SetPlayerPos(playerid,-2146.5347,-216.8768,35.3203);
            SetPlayerFacingAngle(playerid, 334.8606);
            SetPlayerCameraPos(playerid,-2143.8887,-211.5501,35.3203);
		    SetPlayerCameraLookAt(playerid,-2146.5347,-216.8768,35.3203);
		}
        case GANG1_SKIN :
		{
		    format(string,sizeof string,"~h~~p~Gang City~n~~w~Type: ~r~Gang ~n~~g~Players: %d / %d ~n~~b~~h~To Select Prees: ~r~Shift",getOnlineVar("Gang","Gang City"),MAX_MEMMBERS_FACTION);
			TextDrawHideForPlayer(playerid,TInfo[playerid]);
            TextDrawSetString(TInfo[playerid], string);
            TextDrawShowForPlayer(playerid,TInfo[playerid]);
		    SetPlayerInterior(playerid,0);
            SetPlayerPos(playerid,2161.2126,1134.3766,23.3359);
            SetPlayerFacingAngle(playerid, 117.6896);
            SetPlayerCameraPos(playerid,2155.4749,1131.5990,23.3359);
		    SetPlayerCameraLookAt(playerid,2161.2126,1134.3766,23.3359);
		}
        case SWAT_SKIN :
		{
		    format(string,sizeof string,"~h~~p~SF SWAT~n~~w~Type: ~r~Gang ~n~~g~Players: %d / %d ~n~~b~~h~To Select Prees: ~r~Shift",getOnlineVar("Gang","SF SWAT"),MAX_MEMMBERS_FACTION);
			TextDrawHideForPlayer(playerid,TInfo[playerid]);
            TextDrawSetString(TInfo[playerid], string);
            TextDrawShowForPlayer(playerid,TInfo[playerid]);
	 	    SetPlayerInterior(playerid,0);
		    SetPlayerPos(playerid, -1620.0420,682.6581,-5.2422);
		    SetPlayerFacingAngle(playerid, 182.2364);
		    SetPlayerCameraPos(playerid, -1620.1306,676.9985,-4.9063);
		    SetPlayerCameraLookAt(playerid, -1620.0420,682.6581,-5.2422);
		}
        case F_SKIN :
		{
		    format(string,sizeof string,"~h~~p~Faermers~n~~w~Type: ~r~Gang ~n~~g~Players: %d / %d ~n~~b~~h~To Select Prees: ~r~Shift",getOnlineVar("Gang","Farmers"),MAX_MEMMBERS_FACTION);
			TextDrawHideForPlayer(playerid,TInfo[playerid]);
            TextDrawSetString(TInfo[playerid], string);
            TextDrawShowForPlayer(playerid,TInfo[playerid]);
		    SetPlayerInterior(playerid, 0);
		    SetPlayerPos(playerid, -377.7253,-1438.8091,25.7266);
		    SetPlayerFacingAngle(playerid, 269.0938);
		    SetPlayerCameraPos(playerid, -373.5993,-1438.9082,25.7266);
		    SetPlayerCameraLookAt(playerid, -377.7253,-1438.8091,25.7266);
		}
        case MEDIC_SKIN :
		{
		    format(string,sizeof string,"~h~~p~Medices~n~~w~Type: ~r~Gang ~n~~g~Players: %d / %d ~n~~b~~h~To Select Prees: ~r~Shift",getOnlineVar("Gang","Medices"),MAX_MEMMBERS_FACTION);
			TextDrawHideForPlayer(playerid,TInfo[playerid]);
            TextDrawSetString(TInfo[playerid], string);
            TextDrawShowForPlayer(playerid,TInfo[playerid]);
		    SetPlayerInterior(playerid, 0);
		    SetPlayerPos(playerid, -2672.4045,626.5101,17.2828);
		    SetPlayerFacingAngle(playerid, 179.1553);
		    SetPlayerCameraPos(playerid, -2669.2529,622.4718,14.4531);
		    SetPlayerCameraLookAt(playerid, -2672.4045,626.5101,17.2828);
		}
        case GANG4_SKIN :
		{
		    format(string,sizeof string,"~h~~p~China Town~n~~w~Type: ~r~Gang ~n~~g~Players: %d / %d ~n~~b~~h~To Select Prees: ~r~Shift",getOnlineVar("Gang","China Town"),MAX_MEMMBERS_FACTION);
			TextDrawHideForPlayer(playerid,TInfo[playerid]);
            TextDrawSetString(TInfo[playerid], string);
            TextDrawShowForPlayer(playerid,TInfo[playerid]);
		    SetPlayerInterior(playerid,0);
            SetPlayerPos(playerid,-2191.8806,639.6844,49.4429);
            SetPlayerFacingAngle(playerid, 4.1218);
            SetPlayerCameraPos(playerid,-2191.5972,645.5565,49.4375);
		    SetPlayerCameraLookAt(playerid,-2191.8806,639.6844,49.4429);
		}
        case GANG2_SKIN :
		{
		    format(string,sizeof string,"~h~~p~Gang Workers~n~~w~Type: ~r~Gang ~n~~g~Players: %d / %d ~n~~b~~h~To Select Prees: ~r~Shift",getOnlineVar("Gang","Gang City"),MAX_MEMMBERS_FACTION);
			TextDrawHideForPlayer(playerid,TInfo[playerid]);
            TextDrawSetString(TInfo[playerid], string);
            TextDrawShowForPlayer(playerid,TInfo[playerid]);
		    SetPlayerInterior(playerid,0);
            SetPlayerPos(playerid,-2060.1331,253.1189,41.1217);
            SetPlayerFacingAngle(playerid, 162.9859);
            SetPlayerCameraPos(playerid,-2063.3220,244.5937,38.4609);
		    SetPlayerCameraLookAt(playerid,-2060.1331,253.1189,41.1217);
		}
        case GANG3_SKIN :
		{
		    format(string,sizeof string,"~h~~p~Gang JTolow~n~~w~Type: ~r~Gang ~n~~g~Players: %d / %d ~n~~b~~h~To Select Prees: ~r~Shift",getOnlineVar("Gang","JTolow"),MAX_MEMMBERS_FACTION);
			TextDrawHideForPlayer(playerid,TInfo[playerid]);
            TextDrawSetString(TInfo[playerid], string);
            TextDrawShowForPlayer(playerid,TInfo[playerid]);
		    SetPlayerInterior(playerid,0);
            SetPlayerPos(playerid,1060.8107,1792.9961,10.8203);
            SetPlayerFacingAngle(playerid, 232.4614);
            SetPlayerCameraPos(playerid,1067.9938,1790.0706,10.8203);
		    SetPlayerCameraLookAt(playerid,1060.8107,1792.9961,10.8203);
		}
        case DRIFT_SKIN :
		{
			format(string,sizeof string,"~h~~P~~H~Drifters~n~~w~Type: ~r~Gang ~n~~g~Players: %d / %d ~n~~b~~h~To Select Prees: ~r~Shift~n~Level~w~: ~r~15",getOnlineVar("Gang","Drifters"),MAX_MEMMBERS_FACTION);
			TextDrawHideForPlayer(playerid,TInfo[playerid]);
            TextDrawSetString(TInfo[playerid], string);
            TextDrawShowForPlayer(playerid,TInfo[playerid]);
		    SetPlayerInterior(playerid,0);
            SetPlayerPos(playerid,2333.4338,1411.6875,42.8203);
            SetPlayerFacingAngle(playerid, 50.7379);
            SetPlayerCameraPos(playerid,2327.6924,1416.6788,42.8203);
		    SetPlayerCameraLookAt(playerid,2333.4338,1411.6875,42.8203);
		}
        case PILOT_SKIN :
		{
			format(string,sizeof string,"~h~~b~~h~Pilot~n~~w~Type: ~r~Gang ~n~~g~Players: %d / %d ~n~~b~~h~To Select Prees: ~r~Shift~n~Level~w~: ~r~4",getOnlineVar("Gang","Pilots"),MAX_MEMMBERS_FACTION);
			TextDrawHideForPlayer(playerid,TInfo[playerid]);
            TextDrawSetString(TInfo[playerid], string);
            TextDrawShowForPlayer(playerid,TInfo[playerid]);
		    SetPlayerInterior(playerid,0);
            SetPlayerPos(playerid,1448.3516,-2655.4385,13.5469);
            SetPlayerFacingAngle(playerid, 272.3844);
            SetPlayerCameraPos(playerid,1456.1940,-2655.9998,13.5469);
		    SetPlayerCameraLookAt(playerid,1448.3516,-2655.4385,13.5469);
		}
		case C_SKIN :
		{
            format(string,sizeof string,"~h~~b~Chicano Family~n~~w~Type: ~r~Gang ~n~~g~Players: %d / %d ~n~~b~~h~To Select Prees: ~r~Shift~n~Level~w~: ~r~6",getOnlineVar("IFamily","Chicano"),MAX_MEMMBERS_FACTION);
			TextDrawHideForPlayer(playerid,TInfo[playerid]);
            TextDrawSetString(TInfo[playerid], string);
            TextDrawShowForPlayer(playerid,TInfo[playerid]);
		    SetPlayerInterior(playerid,0);
            SetPlayerPos(playerid,-1293.4036,500.8676,18.2344);
            SetPlayerFacingAngle(playerid, 270.6016);
            SetPlayerCameraPos(playerid,-1288.0508,500.4566,21.3098);
		    SetPlayerCameraLookAt(playerid,-1293.4036,500.8676,18.2344);
		}
		case CORLEONE_SKIN :
		{
            format(string,sizeof string,"~h~~b~Corelone Family~n~~w~Type: ~r~Gang ~n~~g~Players: %d / %d ~n~~b~~h~To Select Prees: ~r~Shift~n~Level~w~: ~r~5",getOnlineVar("IFamily","Corelone"),MAX_MEMMBERS_FACTION);
			TextDrawHideForPlayer(playerid,TInfo[playerid]);
            TextDrawSetString(TInfo[playerid], string);
            TextDrawShowForPlayer(playerid,TInfo[playerid]);
		    SetPlayerInterior(playerid,0);
			SetPlayerPos(playerid,-692.0376,927.5311,13.6293);
            SetPlayerFacingAngle(playerid, 180.4928);
            SetPlayerCameraPos(playerid,-704.1071,917.9529,16.6823);
            SetPlayerCameraLookAt(playerid,-692.0376,927.5311,13.6293);
		}
        case COPS_SKIN1..COPS_SKIN2, COPS_SKIN3:
        {
            format(string,sizeof string,"~y~~b~Cops~n~~w~Type: ~r~Job ~n~~g~Players: %d / %d ~n~~b~~h~To Select Prees: ~r~Shift~N~~R~Level~w~",getOnlineVar("Job","Police"),MAX_MEMMBERS_FACTION);
			TextDrawHideForPlayer(playerid,TInfo[playerid]);
            TextDrawSetString(TInfo[playerid], string);
            TextDrawShowForPlayer(playerid,TInfo[playerid]);
			SetPlayerInterior(playerid,0);
			SetPlayerPos(playerid,2231.6514,2457.0601,10.7900);
            SetPlayerFacingAngle(playerid, 174.0143);
            SetPlayerCameraPos(playerid,2222.2361,2457.4683,10.7711);
            SetPlayerCameraLookAt(playerid,2231.6514,2457.0601,10.7900);
		}
		case HITMAN_SKIN :
		{
            format(string,sizeof string,"~h~~w~Hitman~n~~w~Type: ~r~Criminal ~n~~g~Players: %d / %d ~n~~b~~h~To Select Prees: ~r~Shift~N~Level~w~: ~r~4",getOnlineVar("Job","Hitman"),MAX_MEMMBERS_FACTION);
			TextDrawHideForPlayer(playerid,TInfo[playerid]);
            TextDrawSetString(TInfo[playerid], string);
            TextDrawShowForPlayer(playerid,TInfo[playerid]);
		    SetPlayerInterior(playerid,0);
			SetPlayerPos(playerid,2087.5718,2411.0635,74.5786);
            SetPlayerFacingAngle(playerid, 184.4761);
            SetPlayerCameraPos(playerid,2080.9561,2399.8994,75.1202);
            SetPlayerCameraLookAt(playerid,2087.5718,2411.0635,74.5786);
        }
 		case Mayor_SKIN :
		{
			TextDrawHideForPlayer(playerid,TInfo[playerid]);
            TextDrawSetString(TInfo[playerid], "~h~~r~Mayor~n~~w~Type: ~r~Job~n~~b~~h~To Select Prees: ~r~Shift");
            TextDrawShowForPlayer(playerid,TInfo[playerid]);
		    SetPlayerInterior(playerid,0);
			SetPlayerPos(playerid,-2261.3418,2290.5876,4.8202);
            SetPlayerFacingAngle(playerid, 3.7044);
            SetPlayerCameraPos(playerid,-2256.8318,2295.5493,7.3527);
            SetPlayerCameraLookAt(playerid,-2261.3418,2290.5876,4.8202);
        }
 		case SECURITY_SKIN :
		{
			TextDrawHideForPlayer(playerid,TInfo[playerid]);
            TextDrawSetString(TInfo[playerid], "~h~~g~Security~n~~w~Type: ~r~Job~n~~b~~h~To Select Prees: ~r~Shift");
            TextDrawShowForPlayer(playerid,TInfo[playerid]);
		    SetPlayerInterior(playerid,0);
			SetPlayerPos(playerid,-2261.3418,2290.5876,4.8202);
            SetPlayerFacingAngle(playerid, 3.7044);
            SetPlayerCameraPos(playerid,-2256.8318,2295.5493,7.3527);
            SetPlayerCameraLookAt(playerid,-2261.3418,2290.5876,4.8202);
        }
  }
  ApplyAnimation(playerid,"BSKTBALL","BBALL_def_jump_shot",4.1,0,1,1,1,1);
  return 1;
}
function(OnPlayerEnterRaceCheckpoint(playerid))
{
     if(MissionTrack[playerid])
     {
        StateMission[playerid] = 2;
	    DisablePlayerRaceCheckpoint(playerid);
        DisablePlayerCheckpoint(playerid);
        SendClientMessage(playerid, GREEN, "!כנס עכשיו למועדון והטמן את הפצצה, על מנת להטמין את הפצצה תעמוד על הבר משקאות");
        return 1;
     }
     return 1;
}
function(OnPlayerEnterCheckpoint(playerid))
{
   for(new i = 0; i < sizeof WeaponFamily; i++)
   {
       if(CPS_IsPlayerInCheckpoint(playerid, WeaponFamily[i]))
       {
          if(CPS_IsPlayerInCheckpoint(playerid, WeaponFamily[0]) && strcmp(dini_Get(GetPlayerFile(playerid),"IFamily"), "Corelone", true)) return SendClientMessage(playerid,RED,".בלבד Corelone צ'ק פוינט זה משמש את משפחת");
          if(CPS_IsPlayerInCheckpoint(playerid, WeaponFamily[1]) && strcmp(dini_Get(GetPlayerFile(playerid),"IFamily"), "Chicano", true)) return SendClientMessage(playerid,RED,".בלבד Chicano צ'ק פוינט זה משמש את משפחת");
          if(CPS_IsPlayerInCheckpoint(playerid, WeaponFamily[2]) && strcmp(dini_Get(GetPlayerFile(playerid),"Gang"), "Pilots", true)) return SendClientMessage(playerid,RED,".בלבד Pilots צ'ק פוינט זה משמש את הגאנג");
          if(CPS_IsPlayerInCheckpoint(playerid, WeaponFamily[3]) && strcmp(dini_Get(GetPlayerFile(playerid),"Job"), "Police", true)) return SendClientMessage(playerid,RED,".בלבד Police צ'ק פוינט זה משמש את");
          if(CPS_IsPlayerInCheckpoint(playerid, WeaponFamily[4]) && strcmp(dini_Get(GetPlayerFile(playerid),"Job"), "Hitman", true)) return SendClientMessage(playerid,RED,".בלבד Hitman צ'ק פוינט זה משמש את");
          if(CPS_IsPlayerInCheckpoint(playerid, WeaponFamily[5]) && strcmp(dini_Get(GetPlayerFile(playerid),"Job"), "Mayor", true) && strcmp(dini_Get(GetPlayerFile(playerid),"Job"), "Security", true)) return SendClientMessage(playerid,RED,".בלבד Police צ'ק פוינט זה משמש את");
          if(CPS_IsPlayerInCheckpoint(playerid, WeaponFamily[6]) && strcmp(dini_Get(GetPlayerFile(playerid),"Gang"), "Workers", true) && strcmp(dini_Get(GetPlayerFile(playerid),"Gang"), "Workers", true)) return SendClientMessage(playerid,RED,".בלבד Gang Workers צ'ק פוינט זה משמש את הגאנג");
          if(CPS_IsPlayerInCheckpoint(playerid, WeaponFamily[7]) && strcmp(dini_Get(GetPlayerFile(playerid),"Gang"), "China Town", true) && strcmp(dini_Get(GetPlayerFile(playerid),"Gang"), "China Town", true)) return SendClientMessage(playerid,RED,".בלבד China Town צ'ק פוינט זה משמש את הגאנג");
          if(CPS_IsPlayerInCheckpoint(playerid, WeaponFamily[8]) && strcmp(dini_Get(GetPlayerFile(playerid),"Gang"), "Farmers", true) && strcmp(dini_Get(GetPlayerFile(playerid),"Gang"), "Farmers", true)) return SendClientMessage(playerid,RED,".בלבד Farmers צ'ק פוינט זה משמש את הגאנג");
          if(CPS_IsPlayerInCheckpoint(playerid, WeaponFamily[9]) && strcmp(dini_Get(GetPlayerFile(playerid),"Gang"), "Medices", true) && strcmp(dini_Get(GetPlayerFile(playerid),"Gang"), "Medices", true)) return SendClientMessage(playerid,RED,".בלבד Medices צ'ק פוינט זה משמש את הגאנג");
          if(CPS_IsPlayerInCheckpoint(playerid, WeaponFamily[10]) && strcmp(dini_Get(GetPlayerFile(playerid),"Gang"), "SF SWAT", true) && strcmp(dini_Get(GetPlayerFile(playerid),"Gang"), "SF SWAT", true)) return SendClientMessage(playerid,RED,".בלבד SF SWAT צ'ק פוינט זה משמש את הגאנג");
          if(CPS_IsPlayerInCheckpoint(playerid, WeaponFamily[11]) && strcmp(dini_Get(GetPlayerFile(playerid),"Gang"), "Whoers", true) && strcmp(dini_Get(GetPlayerFile(playerid),"Gang"), "Whoers", true)) return SendClientMessage(playerid,RED,".בלבד Whoers צ'ק פוינט זה משמש את הגאנג");
          if(CPS_IsPlayerInCheckpoint(playerid, WeaponFamily[12]) && strcmp(dini_Get(GetPlayerFile(playerid),"Gang"), "Army", true) && strcmp(dini_Get(GetPlayerFile(playerid),"Gang"), "Army", true)) return SendClientMessage(playerid,RED,".בלבד Army צ'ק פוינט זה משמש את הגאנג");
		  ShowMenu(playerid);
	   }
   }
   if(CPS_IsPlayerInCheckpoint(playerid,bombshop))
   {
        SendClientMessage(playerid, WHITE, "--- !ברוכים הבאים לחנות פצצות הסודית ---");
        SendClientMessage(playerid, ORANGE, "/BuyBomb <> על מנת לקנות פצצה");
        SendClientMessage(playerid, ORANGE, "/UseBomb <> על מנת להשתמש בפצצה");
   }
   else if(CPS_IsPlayerInCheckpoint(playerid, Bank))
   {
        SendClientMessage(playerid,WHITE," --- !ברוכים הבאים לבנק ---");
        SendClientMessage(playerid,ORANGE,"/withdraw(all) :על מנת למשוך כסף מהבנק");
        SendClientMessage(playerid,ORANGE,"/deposit(all) :על מנת להפקיד כסף לבנק");
        SendClientMessage(playerid,ORANGE,"/balance :על מנת לבדוק את המאזן שלך");
   }
   else if(CPS_IsPlayerInCheckpoint(playerid, Ammu))
   {
        SendClientMessage(playerid,WHITE,"--- !ברוכים הבאים לחנות נשקים ---");
        SendClientMessage(playerid,ORANGE,"/bw - לקנות נשק");
        SendClientMessage(playerid,ORANGE,"/wl - רשימת נשקים");
        SendClientMessage(playerid,ORANGE,"/resetw :על מנת לאפס את הנשקים");
   }
   else if(CPS_IsPlayerInCheckpoint(playerid,hospital))
   {
       SendClientMessage(playerid,WHITE,"--- !ברוכים הבאים לבית החולים ---");
	   SendClientMessage(playerid, ORANGE, "/hbarmour :על מנת לקבל מגן");
	   SendClientMessage(playerid, ORANGE, "/hbhealth :על מנג לקבל חיים");
   }
   else if(CPS_IsPlayerInCheckpoint(playerid,cng_color))
   {
       SendClientMessage(playerid,WHITE,"--- !ברוכים הבאים לחנות החלפת צבעים רנדומאלית ---");
       SendClientMessage(playerid, ORANGE, "[5000$] /Cngcolor :על מנת לשנות צבע ראנדומלי");
	   SendClientMessage(playerid, RED, " * !במידה והרמה מבוקשת שלך מעל 2 היא תרד ל - 0 בגלל שהחלפת צבע");
   }
   else if(CPS_IsPlayerInCheckpoint(playerid,Wang)) SellWangExportVehicle(playerid);
   else if(CPS_IsPlayerInCheckpoint(playerid,MoneyCP))
   {
		if(InMission[playerid] == 1) return WonMission(playerid);
		if(DidMission[playerid] == 1) return SendClientMessage(playerid, RED, ".המשימה כבר בוצעה");
		SendClientMessage(playerid, ORANGE, "--- איפה הכסף? ---");
   }
   else if(CPS_IsPlayerInCheckpoint(playerid,nobank))
   {
      SetPlayerPos(playerid,-1755.6702+4.0,960.7274-3.0,24.8828);
	  SetPlayerInterior(playerid,0);
   }
   return 1;
}
function(OnPlayerSpawn(playerid))
{
  firsts[playerid] = 0;
  _SetPlayerHealth(playerid, 100.0);
  if(dini_Int(GetPlayerFile(playerid),"Level") == 6) _SetPlayerArmour(playerid, 50.0);
  if(dini_Int(GetPlayerFile(playerid),"Level") == 8) _SetPlayerArmour(playerid, 70.0);
  if(dini_Int(GetPlayerFile(playerid),"Level") == 10) _SetPlayerArmour(playerid, 80.0);
  if(dini_Int(GetPlayerFile(playerid),"Level") == 15) _SetPlayerArmour(playerid, 90.0);
  if(dini_Int(GetPlayerFile(playerid),"Level") > 20) _SetPlayerArmour(playerid, 100.0);
  if(GetPlayerSkin(playerid) != COPS_SKIN1 && GetPlayerSkin(playerid) != COPS_SKIN2 && GetPlayerSkin(playerid) != COPS_SKIN3) ModeInfo[playerid][Cop] = false;
  SetPlayerInterior(playerid, 0);
  ResetPlayerCash(playerid);
  cash_var[playerid] = 0;
  GivePlayerCash(playerid, 550);
  ModeInfo[playerid][Heal] = 0;
  if(dini_Int(GetPlayerFile(playerid),"Hitman") > 0)
  {
      for(new i = 0; i <= MAX_PLAYERS; i++) if(ModeInfo[i][Hitman]) SetPlayerMarkerForPlayer(i, playerid, RED);
  }
  else
  {
      for(new i = 0; i <= MAX_PLAYERS; i++) if(ModeInfo[i][Hitman]) SetPlayerMarkerForPlayer(i, playerid, GetPlayerColor(playerid));
  }
  for(new i = 0; i < 10; i++) MenuUse[playerid][i] = 0;
  SetTimerEx("GiveWeapons", 3000, 0,"i", playerid);
  return 1;
}
function(OnPlayerSelectedMenuRow(playerid, row))
{
   new Menu:m = GetPlayerMenu(playerid);
   if(Weapon == m)
   {
	    switch(row)
	    {
	        case 0:
		    {
				if(MenuUse[playerid][0])
				{
				   ShowMenuForPlayer(Weapon,playerid);
				   SendClientMessage(playerid,RED,".כבר השתמשת בנשק זה חכה עד שתעשה ספאון שנית");
				   return 1;
				}
		        SendClientMessage(playerid,RED,".בהצלחה Combat Shotgun קיבלת");
		        MenuUse[playerid][0] = 1;
		        _GivePlayerWeapon(playerid, 27, 200);
		    }
			case 1:
		    {
  				if(MenuUse[playerid][1])
				{
				   ShowMenuForPlayer(Weapon,playerid);
				   SendClientMessage(playerid,RED,".כבר השתמשת בנשק זה חכה עד שתעשה ספאון שנית");
				   return 1;
				}
		        SendClientMessage(playerid,RED,".בהצלחה Shotgun קיבלת");
		        MenuUse[playerid][1] = 1;
		        _GivePlayerWeapon(playerid, 25, 10);
		    }
   			case 2:
		    {
  				if(MenuUse[playerid][2])
				{
				   ShowMenuForPlayer(Weapon,playerid);
				   SendClientMessage(playerid,RED,".כבר השתמשת בנשק זה חכה עד שתעשה ספאון שנית");
				   return 1;
				}
		        SendClientMessage(playerid,RED,".בהצלחה SMG(MP5) קיבלת");
		        MenuUse[playerid][2] = 1;
		        _GivePlayerWeapon(playerid, 29, 250);
		    }
   			case 3:
		    {
  				if(MenuUse[playerid][3])
				{
				   ShowMenuForPlayer(Weapon,playerid);
				   SendClientMessage(playerid,RED,".כבר השתמשת בנשק זה חכה עד שתעשה ספאון שנית");
				   return 1;
				}
		        SendClientMessage(playerid,RED,".בהצלחה AK47 קיבלת");
		        MenuUse[playerid][3] = 1;
		        _GivePlayerWeapon(playerid, 30, 250);
		    }
			case 4:
		    {
  				if(MenuUse[playerid][4])
				{
				   ShowMenuForPlayer(Weapon,playerid);
				   SendClientMessage(playerid,RED,".כבר השתמשת בנשק זה חכה עד שתעשה ספאון שנית");
				   return 1;
				}
		        SendClientMessage(playerid,RED,".בהצלחה Sniper Rifle קיבלת");
		        MenuUse[playerid][4] = 1;
		        _GivePlayerWeapon(playerid, 34, 10);
		    }
			case 5:
		    {
		        SendClientMessage(playerid,RED,".בהצלחה Jetpack קיבלת");
		        SetPlayerSpecialAction(playerid,2);
		    }
   			case 6:
		    {
  				if(MenuUse[playerid][7])
				{
				   ShowMenuForPlayer(Weapon,playerid);
				   SendClientMessage(playerid,RED,".כבר השתמשת בנשק זה חכה עד שתעשה ספאון שנית");
				   return 1;
				}
		        SendClientMessage(playerid,RED,".בהצלחה Uzi קיבלת");
		        MenuUse[playerid][7] = 1;
		        _GivePlayerWeapon(playerid, 28, 100*4);
		    }
   			case 7:
		    {
  				if(MenuUse[playerid][8])
				{
				   ShowMenuForPlayer(Weapon,playerid);
				   SendClientMessage(playerid,RED,".כבר השתמשת בנשק זה חכה עד שתעשה ספאון שנית");
				   return 1;
				}
		        SendClientMessage(playerid,RED,".בהצלחה Parachute קיבלת");
		        MenuUse[playerid][8] = 1;
		        _GivePlayerWeapon(playerid, 46, 1);
		    }
   			case 8:
		    {
  				if(MenuUse[playerid][9])
				{
				   ShowMenuForPlayer(Weapon,playerid);
				   SendClientMessage(playerid,RED,".כבר השתמשת בנשק זה חכה עד שתעשה ספאון שנית");
				   return 1;
				}
		        SendClientMessage(playerid,RED,".בהצלחה Health & Armour קיבלת");
		        MenuUse[playerid][9] = 1;
		        _SetPlayerHealth(playerid, 100.0);
		        _SetPlayerArmour(playerid, 100.0);
		    }

  			case 9:
		    {
				 if(ModeInfo[playerid][Cop] == false) return SendClientMessage(playerid, ORANGE, "!שיגור זה משרת את המשטרה בלבד");
		         SendClientMessage(playerid,GRAY,".בעוד 5 שניות תשוגר למקום המבוקש, בנתיים אתה יכול לקחת רכב לשיגור");
		         SetTimerEx("Tele",5000, 0,"ii",playerid, 2);
		    }
		}
   }
   return 1;
}
function(OnPlayerExitedMenu(playerid))
{
   TogglePlayerControllable(playerid,true);
   return 1;
}
function(OnGameModeExit())
{
	new a[][10] =
	{ "?","?","?"};
	#pragma unused a
}
function(OnGameModeInit())
{
  new string[128];
  AntiDeAMX();
  DoInit();
  LoadCensorWords();
  //Job's Skins:
  AddPlayerClass(C_SKIN,0,0,0,0,0,0,0,0,0,0);
  AddPlayerClass(CORLEONE_SKIN, 0,0,0,0,0,0,0,0,0,0);
  AddPlayerClass(SWAT_SKIN, 0,0,0,0,0,0,0,0,0,0);
  AddPlayerClass(GANG4_SKIN, 0,0,0,0,0,0,0,0,0,0);
  AddPlayerClass(WHOERS_SKIN, 0,0,0,0,0,0,0,0,0,0);
  AddPlayerClass(F_SKIN, 0,0,0,0,0,0,0,0,0,0);
  AddPlayerClass(GANG2_SKIN, 0,0,0,0,0,0,0,0,0,0);
  AddPlayerClass(MEDIC_SKIN, 0,0,0,0,0,0,0,0,0,0);
  AddPlayerClass(ARMY_SKIN, 0,0,0,0,0,0,0,0,0,0);
  AddPlayerClass(HITMAN_SKIN,0,0,0,0,0,0,0,0,0,0);
  AddPlayerClass(Mayor_SKIN,0,0,0,0,0,0,0,0,0,0);
  AddPlayerClass(SECURITY_SKIN,0,0,0,0,0,0,0,0,0,0);
  AddPlayerClass(COPS_SKIN1, 0,0,0,0,0,0,0,0,0,0);
  AddPlayerClass(COPS_SKIN2, 0,0,0,0,0,0,0,0,0,0);
  AddPlayerClass(COPS_SKIN3, 0,0,0,0,0,0,0,0,0,0);
  AddPlayerClass(PILOT_SKIN, 0,0,0,0,0,0,0,0,0,0);

  SetGameModeText("San Fierro - TDM V0.1b");
  SetTeamCount(22);
  UsePlayerPedAnims();
  ShowPlayerMarkers(1);
  ShowNameTags(1);
  AllowAdminTeleport(1/1);
  //EnableZoneNames(0/1);
  //EnableTirePopping(1);
  EnableStuntBonusForAll(0);
  AllowInteriorWeapons(3);
  //Timers:
  SetTimer("BBShow", 6*60*1000, 1);
  SetTimer("spaming", 2200, 1);
  SetTimer("PayMayor", 10*60*1000, 1);
  SetTimer("updateGangZone", 3000, 1);
  SetTimer("updateZone", 2000, 1);
  SetTimer("PayShip", 5000, 1);
  SetTimer("AngleUpdate", 200, 1);
  SetTimer("CheckPlayerState", 100, 1);
  SetTimer("WangM",10*60*1000,1);
  SetTimer("moveShark",2000,1);
  SetTimer("gateMove",1000,1);
   //Hitmans Home:
  AddStaticVehicle(487,2092.1533,2414.9421,74.7556,89.5899,0,0); // Maverick Of Hitman's
  AddStaticVehicle(487,2165.6113,2411.0583,65.4455,177.1463,0,0); // Maverick Of Hitman's
  AddStaticVehicle(487,2157.4719,2411.4670,66.1009,177.1463,0,0); // Maverick Of Hitman's
  AddStaticVehicle(447,2178.3792,2412.0051,73.0464,89.4096,0,0); // Maverick Of Hitman's
  AddStaticVehicle(447,2178.3518,2422.9495,73.0285,93.8349,0,0); // Maverick Of Hitman's
  AddStaticPickup(1310,2,2116.6755,2368.0571,60.8169); // Paracute
  AddStaticPickup(1240,2,2116.6938,2371.4795,60.8169); // Health
  AddStaticPickup(1242,2,2116.6831,2374.8452,60.8169); // Armour
  AddStaticPickup(358,2,2116.7615,2377.9023,60.8169); // Sniper
  AddStaticPickup(356,2,2116.6814,2381.5706,60.8222); // M4
  //Corelone Home:
  AddStaticVehicle(487,-707.7557,976.7243,12.6549,181.4516,VCOLOR_CORELONE); // Vehicle Corelone
  AddStaticVehicle(487,-707.0580,949.2399,12.6181,1.4516,VCOLOR_CORELONE); // Vehicle Corelone
  AddStaticVehicle(409,-686.8555,961.7623,11.9332,90.3732,VCOLOR_CORELONE); // Limo Corelone
  AddStaticVehicle(409,-686.9049,969.3803,11.9336,90.3732,VCOLOR_CORELONE); // Limo Corelone
  AddStaticVehicle(463,-687.2234,966.1779,11.6821,91.7211,VCOLOR_CORELONE); // FreeWay Corelone
  AddStaticVehicle(452,-645.3965,864.9937,-0.5060,49.6402,VCOLOR_CORELONE); // Speeder Corelone
  AddStaticVehicle(522,-669.5877,945.1866,11.6929,181.5172,VCOLOR_CORELONE); // Corelone NRG
  AddStaticVehicle(522,-672.1756,945.1181,11.6929,181.5174,VCOLOR_CORELONE); // Corelone NRG
  AddStaticVehicle(522,-675.3264,945.0347,11.6929,181.5176,VCOLOR_CORELONE); // Corelone NRG
  AddStaticVehicle(522,-668.1536,970.7087,11.6965,359.6724,VCOLOR_CORELONE); // Corelone NRG
  AddStaticVehicle(451,-716.4620,988.0799,11.8624,0.0173,VCOLOR_CORELONE); // Corelone Turismo
  AddStaticVehicle(451,-723.3269,988.0759,11.8631,0.1038,VCOLOR_CORELONE); // Corelone Turismo
  //Police Faction:
  AddStaticVehicle(497,2207.9551,2502.1741,15.8286,1.2092,0,1); // Maverick Police // 62
  AddStaticVehicle(523,2251.6567,2442.4185,10.3839,180.9985,0,0); // Police Vehicle
  AddStaticVehicle(599,2295.3743,2477.3230,11.0028,0.0134,0,1); // Police Vehicle
  AddStaticVehicle(599,2290.9802,2477.3220,11.0027,0.0134,0,1); // Police Vehicle
  AddStaticVehicle(427,2313.5786,2499.8406,3.4053,91.7755,0,1); // Police Vehicle
  AddStaticVehicle(427,2313.7249,2495.1318,3.4054,91.7755,0,1); // Police Vehicle
  AddStaticVehicle(427,2314.3574,2455.7798,3.4054,91.6694,0,1); // Police Vehicle
  AddStaticVehicle(601,2246.3215,2431.4136,3.0322,181.8312,1,1); // Police Vehicle
  AddStaticVehicle(601,2254.8853,2431.6875,3.0322,181.8312,1,1); // Police Vehicle
  AddStaticVehicle(497,2231.6650,2463.4822,10.9164,181.5699,0,1); // Maverick Police
  AddStaticVehicle(497,2231.9089,2442.9258,10.9222,358.3417,0,1); // Maverick Police
  AddStaticVehicle(596,2277.7361,2459.6587,10.5388,179.5470,0,1); // Police Vehicle
  AddStaticVehicle(432,2227.8047,2457.2183,-7.4392,270.7623,43,0); // Rhino Police // 81
  //Mayor:
  AddStaticVehicle(487,-2227.9648,2327.3406,7.7235,180.5771,0,0); // Heli Mayor // 82
  AddStaticVehicle(490,-2258.0488,2287.4807,4.9472,0.6890,0,0); // Car Mayor
  AddStaticVehicle(490,-2264.3208,2287.4050,4.9469,0.6890,0,0); // Car Mayor
  AddStaticVehicle(522,-2272.0798,2306.4705,4.3913,269.6809,0,0); // NRG-Mayor
  AddStaticVehicle(522,-2272.0652,2309.1304,4.3913,269.6808,0,0); // NRG-Mayor // 86
  //  Chicano
  AddStaticVehicle(463,-1383.2572,501.2429,17.7742,179.0257,125, 125); // Vehicle More Faction - 87
  AddStaticVehicle(463,-1379.6669,501.1818,17.7742,179.0257,125, 125); // Vehicle More Faction
  AddStaticVehicle(463,-1377.1515,501.1390,17.7742,179.0257,125, 125); // Vehicle More Faction
  AddStaticVehicle(463,-1374.0498,501.0862,17.7742,179.0257,125, 125); // Vehicle More Faction
  AddStaticVehicle(522,-1318.7799,489.6921,17.7984,86.1466,125, 125); // Vehicle More Faction
  AddStaticVehicle(522,-1318.6550,491.5439,17.7994,86.1466,125, 125); // Vehicle More Faction
  AddStaticVehicle(522,-1318.4564,494.4919,17.7995,86.1466,125, 125); // Vehicle More Faction
  AddStaticVehicle(522,-1318.2086,498.1689,17.7995,86.1466,125, 125); // Vehicle More Faction
  AddStaticVehicle(520,-1302.6196,501.2627,18.9579,269.0971,125, 125); // Hydra
  AddStaticVehicle(487,-1421.2937,515.2343,18.4038,181.1605,125, 125); // Vehicle More Faction
  AddStaticVehicle(487,-1406.7874,515.5277,18.3224,181.1605,125, 125); // Vehicle More Faction
  AddStaticVehicle(425,-1455.0867,501.7262,18.8393,355.2294,125, 125); // Vehicle More Faction
  AddStaticVehicle(425,-1440.8284,499.2134,19.0225,359.7264,125, 125); // Vehicle More Faction
  AddStaticVehicle(452,-1440.0276,504.7661,-0.4608,87.8050,125, 125); // Boat
  AddStaticVehicle(452,-1446.1847,495.8994,-0.4767,87.2540,125, 125); // Boat
  AddStaticVehicle(432,-1421.7568,458.5460,7.1972,181.2655,125, 125); // Rhino
  AddStaticVehicle(432,-1431.1545,458.3384,7.1939,181.2653,125, 125); // Rhino
  AddStaticVehicle(432,-1444.9437,458.0338,7.2005,181.2653,125, 125); // Rhino
  AddStaticVehicle(451,-1536.6007,491.5345,6.8865,319.6715,125, 125); // Turismo
  AddStaticVehicle(451,-1542.0364,496.1488,6.8865,319.6715,125, 125); // Turismo
  AddStaticVehicle(593,-1541.7678,367.0791,7.6838,358.2176,125, 125); // Dodo
  AddStaticVehicle(593,-1559.2230,367.6223,7.6838,358.2176,125, 125); // Dodo
  AddStaticVehicle(593,-1607.8246,376.7373,7.6392,269.7081,125, 125); // Dodo
  AddStaticVehicle(463,-1610.6698,346.6725,6.7269,270.9970,125, 125); // Freeway
  AddStaticVehicle(463,-1610.6061,343.0108,6.7269,270.9970,125, 125); // Freeway
  AddStaticVehicle(463,-1611.1364,320.3301,6.7279,183.0642,125, 125); // Freeway - 112
  //Gang1:
  AddStaticVehicle(487,2166.1382,1135.3406,23.5118,64.9836,random(126),random(126)); // maverick more gang
  AddStaticVehicle(487,2161.5537,1125.5171,23.4698,64.9841,random(126),random(126)); // maverick more gang
  AddStaticVehicle(487,2156.3066,1114.2795,23.4918,64.9844,random(126),random(126)); // maverick more gang
  AddStaticVehicle(522,2195.8425,1105.7876,26.2648,239.7385,random(126),random(126)); // NRG
  AddStaticVehicle(522,2194.1570,1102.8982,26.2649,239.7386,random(126),random(126)); // NRG
  AddStaticVehicle(522,2190.6697,1097.0278,26.2733,150.9145,random(126),random(126)); // NRG
  AddStaticVehicle(487,2216.6404,1004.2784,27.4898,257.9459,random(126),random(126)); // maverick
  //Gang2:
  AddStaticVehicle(522,1084.5367,1065.6289,10.3943,125.4877,random(126),random(126)); // Bike Gang City-2
  AddStaticVehicle(522,1082.0139,1069.1671,10.3943,125.4877,random(126),random(126)); // Bike Gang City-2
  AddStaticVehicle(487,1095.1638,1079.1279,11.0128,129.9205,random(126),random(126)); // Bike Gang City-2 * Maverick
  AddStaticVehicle(411,1104.6565,1055.1261,10.0005,41.2809,random(126),random(126)); // Infernus Gang city 2
  AddStaticVehicle(411,1073.9288,1091.8105,9.9942,212.1371,random(126),random(126)); // Infernus Gang city 2
  AddStaticVehicle(522,1036.0604,1023.3940,10.5438,132.6527,random(126),random(126)); // nrg gang 2
  AddStaticVehicle(522,1033.7126,1025.9425,10.5437,132.6771,random(126),random(126)); // nrg gang 2
  AddStaticVehicle(522,1030.6345,1029.2804,10.5443,132.6819,random(126),random(126)); // nrg gang 2
  AddStaticVehicle(487,1088.6317,1086.4919,11.0406,225.5947,random(126),random(126)); // Maverick gang2
  //Gang3:
  AddStaticVehicle(487,1088.6317,1086.4919,11.0406,225.5947,random(126),random(126)); // Maverick gang2
  AddStaticVehicle(487,1028.0107,1739.0109,10.9978,85.6794,random(126),random(126)); // Maverick More Gang
  AddStaticVehicle(562,1060.7084,1797.2214,10.4784,183.3896,random(126),random(126)); // Elegy More Gang
  AddStaticVehicle(562,1052.4711,1796.7355,10.4912,270.5815,random(126),random(126)); // Elegy More Gang
  AddStaticVehicle(463,1059.8671,1809.9016,10.2119,91.1627,random(126),random(126)); // Freeway
  //China Town:
  AddStaticVehicle(560,-2213.9841,615.7933,34.8693,178.3881,9,39); // China Town Sultan
  AddStaticVehicle(560,-2220.3101,609.7455,34.8729,89.2989,9,39); // China Town Sultan
  AddStaticVehicle(562,-2320.3320,560.9041,30.6811,265.1949,17,1); // China Town near (No Of China Town)
  AddStaticVehicle(562,-2365.9734,558.8882,24.4727,91.0250,17,1); // China Town near (No Of China Town)
  AddStaticVehicle(528,-2381.0159,526.5627,27.4496,359.9129,0,0); // China Town near (No Of China Town)
  AddStaticVehicle(560,-2239.8164,543.2087,34.8766,269.1000,17,1); // China Town near (No Of China Town)
  AddStaticVehicle(487,-2261.2180,595.6946,39.2220,184.1235,14,80); // Maverick China Town
  AddStaticVehicle(487,-2262.3979,617.2526,44.5516,267.8029,14,80); // Maverick China Town
  //Farmers:
  AddStaticVehicle(532,-377.7397,-1419.4318,26.6866,0.0682,0,0); // sf farmers
  AddStaticVehicle(478,-402.0518,-1405.3838,24.3675,357.0199,39,1); // sf farmers
  AddStaticVehicle(478,-387.8701,-1398.1873,23.7690,283.0477,39,1); // sf farmers
  AddStaticVehicle(522,-367.2885,-1428.9081,25.2967,359.3775,6,25); // sf farmers
  //Medices:
  AddStaticVehicle(416,-2627.3945,626.1639,14.5726,179.6769,1,3); // SPAWN AMBULANCE HOSPITAL NEW
  AddStaticVehicle(416,-2672.5393,626.4854,14.6468,179.6599,1,3); // MORE AMBULANCE
  //SF SWAT
  AddStaticVehicle(427,-1622.724,652.848,7.423,0.0,-1,-1);
  AddStaticVehicle(598,-1616.859,652.844,7.198,0.0,-1,-1);
  AddStaticVehicle(598,-1611.009,652.838,7.123,0.0,-1,-1);
  AddStaticVehicle(427,-1605.205,652.843,7.423,0.0,-1,-1);
  AddStaticVehicle(528,-1593.390,652.836,7.423,0.0,-1,-1);
  AddStaticVehicle(427,-1587.688,652.830,7.398,0.0,-1,-1);
  AddStaticVehicle(528,-1600.030,672.469,7.248,182.0,-1,-1);
  AddStaticVehicle(601,-1606.031,672.450,6.998,182.0,-1,-1);
  AddStaticVehicle(598,-1588.248,672.470,7.123,182.0,-1,-1);
  AddStaticVehicle(598,-1582.332,672.467,7.173,182.0,-1,-1);
  AddStaticVehicle(528,-1604.536,749.987,-5.207,182.0,-1,-1);
  AddStaticVehicle(601,-1587.809,749.870,-5.357,182.0,-1,-1);
  AddStaticVehicle(427,-1573.441,726.385,-5.157,89.0,-1,-1);
  AddStaticVehicle(601,-1573.067,709.958,-5.482,89.0,-1,-1);
  AddStaticVehicle(528,-1608.280,693.813,-5.107,178.0,-1,-1);
  //SF AP
  AddStaticVehicle(519,-1387.0239,-209.7061,15.0694,278.2845,1,1); //
  AddStaticVehicle(519,-1332.9235,-267.5302,15.0704,23.3071,1,1); //
  AddStaticVehicle(487,-1293.0602,-261.4460,14.2872,18.2189,65,65); //
  AddStaticVehicle(487,-1279.2457,-257.3970,14.2874,33.1975,0,8); //
  AddStaticVehicle(476,-1239.2008,-93.1628,14.8416,134.8797,3,3); //
  AddStaticVehicle(592,-1509.3455,-130.3087,15.3313,317.7641,1,1); //
  AddStaticVehicle(443,-1323.7559,-363.6788,14.7843,186.3627,0,0); //
  AddStaticVehicle(519,-1385.3925,-484.3452,15.0684,251.6320,1,1); //
  AddStaticVehicle(519,-1355.6760,-467.9077,15.0881,162.2889,1,1); //
  AddStaticVehicle(511,-1442.6512,-523.4780,15.5525,207.5157,8,66); //
  AddStaticVehicle(469,-1189.7672,-151.7600,14.1575,132.0141,1,3); //
  AddStaticVehicle(469,-1194.2996,-148.3409,14.1854,129.9893,1,3); //
  AddStaticVehicle(487,-1198.8293,-141.5229,14.2648,132.1973,0,1); //
  AddStaticVehicle(487,-1205.0498,-135.8239,14.3264,132.1967,0,1); //
  AddStaticVehicle(417,-1217.8187,-128.3205,14.2473,137.4675,0,0); //
  AddStaticVehicle(425,-1223.4148,-12.3957,14.7393,43.6659,43,0); //
  AddStaticVehicle(425,-1184.8783,23.1352,14.7064,46.7357,43,0); //
  AddStaticVehicle(577,-1697.8329,-258.8392,14.0601,270.3505,8,10);
  AddStaticVehicle(520, -1575.2896, -273.7479, 14.8717, 43.06, 0, 0);
  AddStaticVehicle(520, -1583.6209, -282.5193, 14.8717, 46.826, 0, 0);
  AddStaticVehicle(520, -1592.1606, -291.156, 14.8717, 44.3348, 0, 0);
  //Rhieno & Hydra's & Hunter's
  AddStaticVehicle(432,385.7251,2540.6272,16.5518,359.3723,43,0); // Rhino
  AddStaticVehicle(425,364.8823,2535.6794,17.2336,359.3241,43,0); // Hunter
  AddStaticVehicle(520,349.2365,2539.4985,17.4667,359.2328,0,0); // Hydra
  AddStaticVehicle(432,-714.4766,828.3062,15.8721,77.4015,43,0); // Rhino Near Corelone
  //
  AddStaticVehicle(422,-2063.8611,304.5915,35.6425,178.1270,67,59); // worker vehicle
  AddStaticVehicle(422,-2057.3994,304.2912,35.9224,88.2311,67,59); // worker vehicle
  AddStaticVehicle(522,-2089.6187,300.0450,40.5732,359.9337,6,25); // worker vehicle
  AddStaticVehicle(522,-2069.4587,304.9883,41.5581,273.0023,6,25); // worker vehicle
  AddStaticVehicle(522,-2265.1101,137.2386,34.7415,271.8723,6,25); // NRG
  AddStaticVehicle(521,-2176.9451,614.5273,34.7179,3.9243,87,118); // FCR
  AddStaticVehicle(493,-1445.6549,98.1853,-0.0534,135.5286,36,13); // SF Boat
  AddStaticVehicle(460,-2985.4102,498.7920,1.3181,356.9520,46,32); // Vehicle SF
  AddStaticVehicle(493,-2954.8623,492.2038,-0.2090,355.5269,36,13); // Vehicle SF
  BombTrackVehicle = AddStaticVehicle(482,-2033.4083,179.2007,28.9547,272.1445,41,41); // SF Workers
  //Ayria:
  AddStaticVehicle(568,-2050.5090,-2520.8420,30.5287,86.3752,21,1); // Ayria Gang
  AddStaticVehicle(568,-2068.0085,-2555.3010,30.5306,346.1540,33,0); // Ayria Gang
  AddStaticVehicle(471,-2098.6716,-2526.8813,30.1398,358.2420,74,83); // Ayria Gang
  AddStaticVehicle(439,-2064.7126,-2499.6604,30.5144,150.2864,43,21); // Ayria Gang
  AddStaticVehicle(489,-2074.7129,-2490.2407,30.7695,163.9064,112,120); // Ayria Gang
  AddStaticVehicle(416,-2627.3945,626.1639,14.5726,179.6769,1,3); // SPAWN AMBULANCE HOSPITAL NEW
  AddStaticVehicle(409,-2619.6299,1376.3702,6.9258,178.8833,1,1); // jizzy vehicle
  AddStaticVehicle(409,-2625.2026,1376.3851,6.9223,177.6280,1,1); // jizzy vehicle
  AddStaticVehicle(576,-2644.6575,1366.8876,6.7501,268.7532,72,1); // jizzy vehicle
  AddStaticVehicle(576,-2644.6174,1377.5243,6.7529,271.4348,68,96); // jizzy vehicle Back is bug is'nt vehicle
  AddStaticVehicle(535,-2618.0676,1350.0201,6.9412,0.2225,28,1); // jizzy vehicle Back is bug is'nt vehicle
  AddStaticVehicle(536,-2624.2375,1338.6592,6.9167,45.4175,37,1); // jizzy vehicle Back is bug is'nt vehicle
  AddStaticVehicle(411,-2634.5098,1333.4834,6.9373,358.5971,116,1); // jizzy vehicle Back is bug is'nt vehicle
  AddStaticVehicle(580,-2641.9402,1334.0419,6.9982,359.5482,81,81); // jizzy vehicle Back is bug is'nt vehicle
  //Race:
  AddStaticVehicle(522, -2589.1243, 1163.5635, 58.0881, 148.3558, 0, 5); // Race
  AddStaticVehicle(522, -2599.8526, 1148.2684, 55.1477, 113.5569, 0, 1); // Race
  AddStaticVehicle(522, -2600.9371, 1149.2207, 55.1529, 114.1736, 5, 1); // Race
  AddStaticVehicle(522, -2602.0789, 1150.0208, 55.1577, 110.4085, 3, 3); // Race
  AddStaticVehicle(522, -2603.1939, 1150.768, 55.1506, 109.6738, 39, 106); // Race
  AddStaticVehicle(522, -2604.2295, 1151.5789, 55.1553, 99.8136, 51, 118); // Race
  AddStaticVehicle(411, -2596.9917, 1109.8424, 55.306, 331.2974, 80, 1); // Race
  AddStaticVehicle(411, -2599.7256, 1111.4083, 55.3049, 331.1954, 75, 1); // Race
  AddStaticVehicle(411, -2602.2132, 1112.8842, 55.3051, 331.118, 12, 1); // Race
  AddStaticVehicle(411, -2604.7542, 1114.3679, 55.304, 329.7554, 64, 1); // Race
  AddStaticVehicle(411, -2607.2535, 1115.9053, 55.3051, 329.6423, 3, 3); // Race
  AddStaticVehicle(541, -2578.5086, 1137.5618, 55.2299, 159.3347, 58, 8); // Race
  AddStaticVehicle(541, -2575.7876, 1136.5317, 55.2532, 160.8014, 2, 1); // Race
  AddStaticVehicle(541, -2573.2715, 1135.6857, 55.2728, 160.8883, 0, 1); // Race
  AddStaticVehicle(451, -2572.2159, 1098.0496, 55.3139, 336.6589, 61, 61); // Race
  AddStaticVehicle(451, -2567.2955, 1096.0803, 55.3488, 339.2178, 123, 123); // Race
  AddStaticVehicle(451, -2569.6438, 1096.9428, 55.3152, 337.4364, 75, 75); // Race
  AddStaticVehicle(451, -2564.5936, 1094.8433, 55.3683, 336.8817, 3, 3); // Race
  AddStaticVehicle(451, -2561.8658, 1093.6462, 55.3871, 338.5524, 36, 36); // Race
  //CarPark
  AddStaticVehicle(451,-1886.9193,-915.6405,31.7336,269.6473,3,3); //
  AddStaticVehicle(451,-1887.5793,-918.7184,31.7182,270.5284,16,16); //
  AddStaticVehicle(429,-1887.5288,-921.7253,31.7260,270.5622,126,126); //
  AddStaticVehicle(429,-1887.1370,-924.7302,31.7125,271.7532,1,1); //
  AddStaticVehicle(411,-1871.3257,-927.5740,31.7561,91.1199,65,65); //
  //Whoers:
  AddStaticVehicle(541,-2173.6851,-218.9591,34.9453,0.0912,15,15); //
  AddStaticVehicle(451,-2169.8438,-219.1483,35.0268,357.5522,15,15); //
  AddStaticVehicle(411,-2166.0310,-219.2841,35.0489,357.7901,15,15); //
  AddStaticVehicle(522,-2157.7432,-222.1073,34.8920,21.0988,15,15); //
  AddStaticVehicle(522,-2155.5330,-221.4428,34.8908,10.6721,15,15); //
  AddStaticVehicle(487,-2162.4119,-203.7334,35.4856,191.0231,15,15); //
  AddStaticVehicle(560,-2151.7622,-221.2665,35.0253,357.1518,15,15); //
  AddStaticVehicle(492,-2147.6992,-220.9213,35.1021,3.1412,15,15); //
  AddStaticVehicle(474,-2064.1270,-84.6538,34.9263,1.9079,15,15); //
  AddStaticVehicle(445,-2276.6150,-77.1712,35.1953,92.7619,15,15); //
  AddStaticVehicle(517,-2414.6050,20.4023,35.0875,178.0229,15,15); //
  AddStaticVehicle(534,-2464.3552,-217.2307,31.5386,268.7390,15,15); //
  AddStaticVehicle(405,-2723.2986,-314.8617,7.0593,316.6002,15,15); //
  AddStaticVehicle(562,-2509.4580,-602.9969,132.2208,178.8225,15,15); //
  AddStaticVehicle(558,-2396.4063,-594.3625,132.2779,125.3049,15,15); //
  AddStaticVehicle(494,-2816.6648,-81.6010,7.0786,181.3757,15,15); //
  AddStaticVehicle(429,-2630.0190,-55.5454,4.0159,2.5670,15,15); //
  AddStaticVehicle(489,-2620.3909,32.7918,4.4789,89.7390,15,15); //
  //Main
  AddStaticVehicle(416,-2470.2048,573.4276,19.2100,269.5224,1,3); // more vehicle
  AddStaticVehicle(562,-2504.4873,452.2013,27.4799,122.1615,17,1); // more vehicle
  AddStaticVehicle(562,-2501.8198,381.5907,34.7789,56.0400,17,1); // more vehicle
  AddStaticVehicle(562,-2254.0608,522.7310,34.8181,180.8978,17,1); // more vehicle
  AddStaticVehicle(452,-1477.1979,693.6130,-0.4862,180.0482,1,35); // BOAT
  AddStaticVehicle(452,-1477.2402,670.8621,-0.5933,179.6942,1,35); // BOAT
  AddStaticVehicle(452,-1519.8376,657.4659,-0.5290,92.3335,1,35); // BOAT
  AddStaticVehicle(522,-1889.3237,683.4667,43.0449,270.4379,39,106); // Vehicle
  AddStaticVehicle(522,-1951.5082,682.3167,46.1249,181.1229,39,106); // Vehicle
  AddStaticVehicle(522,-1949.5739,686.5881,46.1126,91.4564,39,106); // Vehicle
  AddStaticVehicle(411,-1951.0317,709.3680,46.2896,358.2785,12,1); // Vehicle
  AddStaticVehicle(411,-1996.6395,759.3296,45.0958,357.0041,64,1); // INFERNUS
  AddStaticVehicle(411,-2073.9644,726.3178,67.6598,92.0744,64,1); // INFERNUS
  AddStaticVehicle(411,-2103.8782,654.5626,52.0943,179.2112,123,1); // INFERNUS
  AddStaticVehicle(411,-2191.2659,559.2711,34.8164,90.3623,123,1); // INFERNUS
  AddStaticVehicle(513,-2254.0410,518.9464,35.7280,356.9271,21,36); // Stunt airplane
  AddStaticVehicle(513,-2272.1406,529.3829,35.5846,87.8398,21,36); // Stunt airplane
  AddStaticVehicle(560,-2222.0283,482.9875,34.7922,180.3053,37,0); // sultan
  //Army:
  AddStaticVehicle(432,274.0500,1948.7020,17.6369,90.2979,43,0); // Rhino
  AddStaticVehicle(432,273.9881,1960.6155,17.6369,90.2979,43,0); // Rhino
  AddStaticVehicle(432,273.8675,1983.8108,17.8568,90.2979,43,0); // Rhino
  AddStaticVehicle(432,273.7996,1996.8685,17.8568,90.2979,43,0); // Rhino
  AddStaticVehicle(520,305.0795,2035.2590,18.5865,181.3330,0,0); // Hydra
  AddStaticVehicle(520,305.5487,2015.0956,18.7893,181.3330,0,0); // Hydra
  AddStaticVehicle(520,339.9538,1979.9672,18.3639,5.2258,0,0); // Hydra
  AddStaticVehicle(425,359.8978,1953.1041,18.2057,275.2676,43,0); // Hunter
  AddStaticVehicle(425,364.7404,1900.1370,18.4384,188.5473,43,0); // Hunter
  AddStaticVehicle(470,227.8843,1878.2723,17.6275,182.0513,43,0); // patriot
  AddStaticVehicle(470,201.3680,1877.3223,17.6283,182.0513,43,0); // patriot
  AddStaticVehicle(411,205.0743,1919.0352,17.3677,90.2668,6,40); // infernus
  AddStaticVehicle(487,130.0722,1927.2079,19.3718,359.7077,6,40); // Maverick
  AddStaticVehicle(487,143.2308,1927.1395,19.4149,272.5341,6,40); // Maverick
  AddStaticVehicle(487,247.3955,1960.8627,17.8174,2.8910,6,40); // Maverick
  AddStaticVehicle(487,219.9248,2001.2526,17.8230,88.7787,6,40); // Maverick
  AddStaticVehicle(519,308.3498,1798.8813,18.5592,2.7050,1,1); // Shamal
  // CPS:
  WeaponFamily[0] = CPS_AddCheckpoint(-666.2990,939.8595,12.1328,2, 70);
  WeaponFamily[1] = CPS_AddCheckpoint(-1390.3843,497.6067,18.2344, 2,70);
  WeaponFamily[2] = CPS_AddCheckpoint(2014.0173,-2274.6685,13.5469, 2,70);
  WeaponFamily[3] = CPS_AddCheckpoint(2261.5000,2446.9646,-7.1953, 2,70); // Cops
  WeaponFamily[4] = CPS_AddCheckpoint(2081.9917,2398.3186,60.8169, 2,70); // Hitman
  WeaponFamily[5] = CPS_AddCheckpoint(-2277.3696,2302.9043,4.9675, 2,70); // Mayor + Security
  WeaponFamily[6] = CPS_AddCheckpoint(-2064.8115,225.5286,35.9429, 2,70); // Gang Workers
  WeaponFamily[7] = CPS_AddCheckpoint(-2178.4944,715.9880,53.8906, 2,70); // Gang China Town
  WeaponFamily[8] = CPS_AddCheckpoint(-366.2607,-1418.1969,25.7266, 2,70); // Gang China
  WeaponFamily[9] = CPS_AddCheckpoint(-2639.0239,634.4632,14.4545, 2, 70);
  WeaponFamily[10] = CPS_AddCheckpoint(-1615.7906,685.9750,7.1875, 2, 70);
  WeaponFamily[11] = CPS_AddCheckpoint(-2164.8350,-227.5670,36.5156, 2, 70);
  WeaponFamily[12] = CPS_AddCheckpoint(205.4227,1872.0313,13.1470, 2, 70);
  Bank = CPS_AddCheckpoint(2143.9777,1640.0800,993.5761,2.5,50);
  Ammu = CPS_AddCheckpoint(291.0004,-84.5168,1001.5156,2.5,50);
  bombshop = CPS_AddCheckpoint(-1380.479,2112.637,41.572,2.5,100);
  hospital = CPS_AddCheckpoint(-2665.4519,632.4997,14.4531,2.5,100);
  Wang = CPS_AddCheckpoint(-1919.0795,303.1454,41.0469,2.5,100);
  MoneyCP = CPS_AddCheckpoint(-1974.6344,156.3841,27.6940,5,100);
  nobank = CPS_AddCheckpoint(2144.0898,1607.6897,993.6882,1.5,50);
  //MoneyShip & Missions:
  mship = CreatePickup(1239,23, -1445.7502,727.8580,6.8798);
  pickupMission = CreatePickup(1550, 2, -2667.5696,732.9576,27.9531);
  be = CreatePickup(1318,23, -1755.6702,960.7274,24.8828);
  GangZones[0] = GangZoneCreate(-2966.18, -3141.348, 3923.766, 2966.18); // main
  GangZones[1] = GangZoneCreate(-2904.557, -731.4462, -1942.749, 310.0244); // whoers
  GangZones[2] = GangZoneCreate(-2170.647, 100.9412, -1857.769, 349.474); // china town
  GangZones[3] = GangZoneCreate(-2970.223, 286.3546, -1992.963, 530.9423); // workes
  GangZones[4] = GangZoneCreate(-2962.497, 53.60166, -1865.495, 278.4646); // workes
  GangZones[5] = GangZoneCreate(-1761.202, 629.5665, -1405.835, 1047.733); // swat
  GangZones[6] = GangZoneCreate(-2869.793, 483.6028, -2383.094, 767.6402); // medic
  GangZones[7] = GangZoneCreate(-852.4849, -1821.749, 70.06725, -735.7062); // farmers
  GangZones[8] = GangZoneCreate(-1751.681, -688.9946, -864.1628, 513.8265); // pilots
  GangZones[9] = GangZoneCreate(-140.1345, 1623.225, 502.1487, 2207.118); // army
  GangZones[10] = GangZoneCreate(-1307.922, 607.2495, -408.7256, 1424.701); // corelone
  GangZones[11] = GangZoneCreate(-1996.826, 270.5747, -1007.979, 771.5852); // chicano
  GangZones[12] = GangZoneCreate(-2966.18, 1249.533, -1810.071, 2977.858); // mayor
  GangZones[13] = GangZoneCreate(-2974.085, 530.9423, -1985.238, 1205.531); //0x8000FF96
  GangZones[14] = GangZoneCreate(-2993.399, -699.8865, -1896.396, 49.6567); // 0xFF80C096
  // Bomb shop:
  CreateDynamicObject(18070,-1381.089,2112.044,41.700,0.0,0.0,-45.000,300);
  CreateDynamicObject(2753,-1383.290,2112.174,42.432,0.0,0.0,-45.000,300);
  CreateDynamicObject(2753,-1382.330,2111.287,42.432,0.0,0.0,-45.000,300);
  CreateDynamicObject(1254,-1382.949,2111.615,42.437,0.0,0.0,-45.000,300);
  CreateDynamicObject(1636,-1382.001,2110.453,42.573,0.0,0.0,45.000,300);
  CreateDynamicObject(1654,-1380.869,2109.568,42.527,0.0,0.0,-45.000,300);
  CreateDynamicObject(2037,-1383.293,2113.065,42.282,0.0,0.0,-123.750,300);
  CreateDynamicObject(2057,-1379.281,2110.274,42.381,0.0,0.0,-123.750,300);
  // Mship:
  CreateDynamicObject(1634, -1486.507813, 726.071228, 7.252151, 0.0000, 0.0000, 270.0000,300);
  CreateDynamicObject(8493, -1444.743164, 738.784058, 18.168858, 0.0000, 0.0000, 0.0000,300);
  CreateDynamicObject(3528, -1444.891235, 707.084045, 13.344648, 0.0000, 0.0000, 90.0000,300);
  CreateDynamicObject(14608, -1442.787720, 727.878479, 7.500811, 0.0000, 0.0000, 45.0000,300);
  gateb = CreateDynamicObject(2634,2144.19,1627.1,994.257,0,0,180,100);
  shark[0] = CreateObject(1608, -1435.370605, 718.152649, 2.084444, 0.0000, 0.0000, 0.0000);
  shark[1] = CreateObject(1608, -1457.897949, 718.521545, 2.095426, 0.0000, 0.0000, 0.0000);
  //opanel:
  for(new p = 0; p < dini_Int("/opanel/pickups/main.ini", "Total"); p++)
  {
	   format(string, sizeof string,"/opanel/pickups/%d.ini", p);
	   if(dini_Exists(string)) CreatePickup(dini_Int(string, "pickupid"), dini_Int(string, "type"), dini_Float(string, "x"), dini_Float(string, "y"), dini_Float(string, "z"));
  }
  for(new v = 0; v < dini_Int("/opanel/vehicles/main.ini", "Total"); v++)
  {
	   format(string, sizeof string,"/opanel/vehicles/%d.ini", v);
	   if(dini_Exists(string)) CreateVehicle(dini_Int(string, "modelid"), dini_Float(string, "x"), dini_Float(string, "y"), dini_Float(string, "z"), dini_Float(string, "angle"), random(126), random(126), -1);
  }

  //gzones:
  for(new i = 0; i < sizeof start_id; i++) start_id[i] = -1;
  //Menus:
  Weapon = CreateMenu("~g~GFM:",0, 125, 150, 300);
  AddMenuItem(Weapon,0,"Combat Shotgun");
  AddMenuItem(Weapon,0,"Shotgun");
  AddMenuItem(Weapon,0,"SMG(MP5)");
  AddMenuItem(Weapon,0,"AK47");
  AddMenuItem(Weapon,0,"Snipr Rifle");
  AddMenuItem(Weapon,0,"Jetpack");
  AddMenuItem(Weapon,0,"Uzi");
  AddMenuItem(Weapon,0,"Parachute");
  AddMenuItem(Weapon,0,"Armour & Health");
  AddMenuItem(Weapon,0,"SF");
  CreateFiles();
  LoadTextDraws();
  return 1;
}
function(OnPlayerStateChange(playerid, newstate, oldstate))
{
	new string[128];
	if(MayorID == playerid && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		RemovePlayerFromVehicle(MayorID);
		SendClientMessage(playerid, ORANGE, "!אסור לך לנהוג ברכב, מותר לך שיסיעו אותך ברכב, בגלל זה אתה צריך מאבטחים, תחפש לך כמה");
	}
	if(GetPlayerVehicleID(playerid) == BombTrackVehicle && !MissionTrack[playerid] && !MissionTrackState && GetPlayerState(playerid) == PLAYER_STATE_DRIVER && ModeInfo[playerid][Cop] == false)
	{
       count_mission = 90;
	   format(string,sizeof string, "!מי שיעצור בעדו יקבל פרס כספי גבוה, הצבע של השחקן הוא הצבע של הודעה זו Jizzy Club יצא למשימת פיצוץ %s השחקן", GetName(playerid));
	   SendClientMessageToAll(GREEN, string);
	   SendClientMessage(playerid, LIGHT_RED, "!Bomb Jizzy Club שלום לך, יצאת למשימת");
	   SendClientMessage(playerid, LIGHT_RED, ",במפה מסומן לך בצבע אדום היכן זה Jizzy Club המטרה שלך להעביר את מטען זה למודעון");
 	   SendClientMessage(playerid, LIGHT_RED, "!יש לך ד-90 שניות להעביר את הרכב זה ולאחר מכן להטמין את הפצצה במועדון, בהצלחה");
	   SetPlayerRaceCheckpoint(playerid, 1, -2618.7686,1420.5736,7.0938, -2618.7686,1420.5736,7.0938, 15.0);
 	   SetPlayerColor(playerid,GREEN);
 	   SetTimerEx("BombTrackTime", 1000, 0, "i", playerid);
	   MissionTrack[playerid] = 1;
	   BombTrackMission[playerid] = 1;
	   MissionTrackState = 1;
	   StateMission[playerid] = 1;
	   return 1;
	}
    if((GetVehicleModel(GetPlayerVehicleID(playerid)) == 432 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 425 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 520) && (IsPlayerInAnyVehicle(playerid) && dini_Int(GetPlayerFile(playerid),"Level") < 6))
	{
	  RemovePlayerFromVehicle(playerid);
      SendClientMessage(playerid,GRAY,".כניסה לרכב זה מרמה 6 ומעלה");
	  return 1;
	}
	return 1;
}
function(OnPlayerExitVehicle(playerid))
{
  new string[128];
  if(MissionTrack[playerid] && StateMission[playerid] != 2)
  {
	 format(string, sizeof string,"!Jizzy Club נכשל במשימת פיצוץ %s :השחקן", GetName(playerid));
	 SendClientMessageToAll(GREEN, string);
 	 EndMission(playerid, false);
  }
  return 1;
}
function(DriftVehicle(carid)) return (carid >= 151) && (carid <= 165)? true : false;
function(PilotsVehicle(carid)) return (carid >= 127) && (carid <= 150)? true : false;
function(StuntsVehicle(carid)) return (carid >= 113) && (carid <= 126)? true : false;
function(ChicanoVehicle(carid)) return (carid >= 87) && (carid <= 112)? true : false;
function(MayorVehicle(carid)) return (carid == 82 || carid == 83 || carid == 84 || carid == 85 || carid == 86)? true :false;
function(HitmanVehicle(carid)) return (carid == 1 || carid == 2 || carid == 3 || carid == 4 || carid == 5)? true :false;
function(CoreloneVehicle(carid)) return (carid >= 6) && (carid <= 17)? true : false;
function(PoliceVehicle(carid)) return (carid >= 61) && (carid <= 81)? true : false;
function(Tele(playerid, tid))
{
  TogglePlayerControllable(playerid, true);
  if(tid == 1) return GetPlayerState(playerid) == 2? SetVehiclePos(GetPlayerVehicleID(playerid), 2069.7007,2017.6296,10.6719) : SetPlayerPos(playerid, 2069.7007,2017.6296,10.6719);
  else if(tid == 2) return GetPlayerState(playerid) == 2? SetVehiclePos(GetPlayerVehicleID(playerid),-1322.1635,895.8578,46.4383) : SetPlayerPos(playerid, -1322.1635,895.8578,46.4383);
  else if(tid == 3) return GetPlayerState(playerid) == 2? SetVehiclePos(GetPlayerVehicleID(playerid),1967.1448,-1885.4670,13.5469) : SetPlayerPos(playerid, 1967.1448,-1885.4670,13.5469);
  return 1;
}
function(OnPlayerKeyStateChange(playerid, newkeys, oldkeys))
{
  new Float:pos[3], string[128];
  if(ModeInfo[playerid][Cop] == true && GetPlayerState(playerid) != 7 && Specid[playerid] != -1)
  {
      for(new w = 0; w <= MAX_PLAYERS; w++)
      {
          if(GetPlayerWantedLevel(w) > 0 && w != playerid && !ModeInfo[w][Cop])
          {
	          GetPlayerPos(w, pos[0], pos[1], pos[2]);
	          if(PlayerToPoint(6.0, playerid, pos[0],pos[1],pos[2]))
	          {
					 dini_IntSet(GetPlayerFile(playerid),"Bank",dini_Int(GetPlayerFile(playerid),"Bank")+2300);
	                 format(string,sizeof string,"%d :רמת המבוקשות שלו הייתה ,%s :בירכותיי, תפסת פושע מבוקש, שם הפושע",GetPlayerWantedLevel(w),GetName(w));
	                 SendClientMessage(playerid, RED, string);
	                 SendClientMessage(playerid, RED,".הוכנס לך לבנק 2300$ דולר לחשבון הבנק שלך");
	                 format(string,sizeof string,".הכניס אותך לכלא בגלל שהיה קרוב אליך והיית מבוקש, תשחרר בעוד 3 דקות %s שים לב, השוטר",GetName(playerid));
	                 SendClientMessage(w, RED, string);
					 ModeInfo[w][Jail] = true;
					 SetTimerEx("UnJail", 3*60*1000,0, "i", w);
					 TogglePlayerSpectating(playerid,0);
				     break;
	          }
	          else continue;
	      }
      }
  }
  return 1;
}
function(OnPlayerPrivmsg(playerid, rid, text[]))
{
	new string[128];
    if(isTextIP(text) == 1)
    {
	    SendClientMessage(playerid, RED, ".ההודעה שלך זוהתה כפוטנציאל לזיהוי שרת ולכן לא נשלחה");
	    return 0;
    }
    if(Ignore[rid][playerid] && !IsPlayerXAdmin(playerid, 1)) return SendClientMessage(playerid,RED,".שחקן זה ביטל את האפשרות שלך לשלוח לו הודעות פרטיות"),0;
	if(cancelpm[rid] && !IsPlayerXAdmin(playerid,1)) return SendClientMessage(playerid,RED,".שחקן זה חסם את האפשרות לשלוח לו הודעות פרטיות"),0;
	for (new i = 0;  i < 100; i++)
	{
	    if (!strcmp(words[i],"*EOF*",true)) continue;
		if (strfind(text,words[i],true) != -1)
		{
            SendClientMessage(playerid,RED,"!ההודעה שלך צונזרה בגלל תוכן לא חוקי");
 		    return false;
		}
	}
	format(string, sizeof string, "> from: %s[%i]: %s", GetName(playerid), playerid, text);
	SendClientMessage(rid, YELLOW, string);
	format(string, sizeof string, ">> to: %s[%i]: %s", GetName(rid), rid, text);
	SendClientMessage(playerid, YELLOW, string);
	return 1;
}
function(OnPlayerText(playerid, text[]))
{
   new string[128];
   if(isTextIP(text) == 1)
   {
	  SendClientMessage(playerid, RED, ".ההודעה שלך זוהתה כפוטנציאל לפרסום שרת מתחרה ולכן לא נשלחה");
	  return 0;
   }
   for (new i = 0;  i < 100; i++)
   {
	    if (!strcmp(words[i],"*EOF*",true)) continue;
		if (strfind(text,words[i],true) != -1)
		{
            SendClientMessage(playerid,RED,"!ההודעה שלך צונזרה בגלל תוכן לא חוקי");
 		    return false;
		}
   }
   if(!ModeInfo[playerid][Logged]) return SendClientMessage(playerid,ORANGE, dini_Exists(GetPlayerFile(playerid))?("/Login [password] שלום לך, לפני שתשתמש בפקודות תתחבר") :("/Register [password] שלום לך, לפני שתמש בפקודות תרשם")),0;
   if(ModeInfo[playerid][spam]) return SendClientMessage(playerid,RED,"!הודעה אחת כל 2.0 שניות, אנא כבד את החוקים"),0;
   if(caller[playerid] == 1 && caller[callto[playerid]] == 1)
   {
	   format(string,sizeof string,"%s: [#%d] %s",GetName(playerid),playerid, text);
	   SendClientMessage(callto[playerid], 0x00FFFFAA, string);
	   format(string,sizeof string,"%s: [#%d] %s",GetName(playerid),callto[playerid], text);
	   SendClientMessage(playerid, 0x00FFFFAA, string);
	   ModeInfo[playerid][spam] = true;
	   return 0;
   }
   if((text[0] == '@' || text[0] == '!') && gTeam[playerid] != 0)
   {
      for(new i = -1; i <= MAX_PLAYERS; i++)
      {
          if(IsPlayerConnected(i) && (gTeam[i] == gTeam[playerid] || GetPlayerSkin(i) == GetPlayerSkin(playerid)))
          {
              //if(strcmp(dini_Get(GetPlayerFile(playerid),"IFamily"), "None", true)) format(string,sizeof string,text[0] == '@'? ("@ (%s) - %s [%i]: %s") : ("! (%s) - %s [%i]: %s"),dini_Get(GetPlayerFile(playerid),"IFamily") ,GetName(playerid), playerid, text[1]);
              //else if(strcmp(dini_Get(GetPlayerFile(playerid),"Job"), "None", true)) format(string,sizeof string,text[0] == '@'? ("@ (%s) - %s [%i]: %s") : ("! (%s) - %s [%i]: %s"),dini_Get(GetPlayerFile(playerid),"Job") ,GetName(playerid), playerid, text[1]);
              //else if(strcmp(dini_Get(GetPlayerFile(playerid),"Gang"), "None", true)) format(string,sizeof string,text[0] == '@'? ("@ (%s) - %s [%i]: %s") : ("! (%s) - %s [%i]: %s"),dini_Get(GetPlayerFile(playerid),"Gang") ,GetName(playerid), playerid, text[1]);
              format(string,sizeof string,text[0] == '@'? ("@ %s [%i]: %s") : ("! %s [%i]: %s") ,GetName(playerid), playerid, text[1]);
              SendClientMessage(i, 0x00FFFFAA,string);
              ModeInfo[playerid][spam] = true;
			  return 0;
          }
      }
   }
   new IDnTAG[256];
   if(!strcmp(dini_Get(GetPlayerFile(playerid),"Tag"), "None", true)) format(IDnTAG,sizeof IDnTAG,"(ID: %d)",playerid);
   else format(IDnTAG,sizeof IDnTAG,"(ID: %d | %s )",playerid, dini_Get(GetPlayerFile(playerid),"Tag"));
   format(string,sizeof string," %s %s", text, IDnTAG);
   SendPlayerMessageToAll(playerid, string);
   ModeInfo[playerid][spam] = true;
   return 0;
}
function(OnPlayerDeath(playerid, killerid, reason))
{
  new string[128], Float:PPOSTION[3];
  if(gTeam[playerid] == gTeam[killerid])
  {
    SendClientMessage(killerid,RED,"!אל תהרוג שחקנים אשר נמצאים איתך באותה קבוצה, קיבלת עונש");
    _ResetPlayerWeapons(killerid);
    return 0;
  }
  DropWeapons(playerid);
  if(ModeInfo[killerid][Cop] && !GetPlayerWantedLevel(playerid))
  {
     SendClientMessage(killerid, ORANGE, "!שחקן זה לא מבוקש! תשים לב יותר למי שאתה הורג, קיבלת עונש - נהרגת");
     _SetPlayerHealth(playerid, 0.0);
     return 0;
  }
  if(ModeInfo[killerid][Cop] == false) _SetPlayerWantedLevel(killerid, GetPlayerWantedLevel(killerid)+1);
  GetPlayerPos(playerid,PPOSTION[0],PPOSTION[1],PPOSTION[2]);
  if(!PlayerToPoint(80.0,killerid,PPOSTION[0],PPOSTION[1],PPOSTION[2]) && killerid != INVALID_PLAYER_ID && killerid != playerid)
  {
      format(string,sizeof string,"\"%s\" has been Kicked (Reason: Fakekill Cheat)",GetName(playerid));
      SendClientMessageToAll(YELLOW,string);
	  format(string,sizeof string,"\"%s\" has been Kicked (Reason: Fakekill Cheat)",GetName(playerid));
      SendTextDrawMessageToAll(YELLOW, string, 5);
      Kick(playerid);
  }
  if GetPlayerWantedLevel(killerid) > 3 && GetPlayerWantedLevel(killerid) <= 25 *then
  {
       if(ModeInfo[killerid][Cop] == false) _SetPlayerWantedLevel(killerid, GetPlayerWantedLevel(killerid) + 1);
	   format(string, sizeof string,"!%d הוא מבוקש, רמת מבוקשות ,%s - השחקן",GetPlayerWantedLevel(killerid), GetName(killerid));
	   SendClientMessageToAll(YELLOW,string);
	   format(string, sizeof string,"$%d - שחקן אשר יהרוג אותו, יקבל פרס",GetPlayerWantedLevel(killerid)*(500));
	   SendClientMessageToAll(RED,string);
	   format(string, sizeof string,"~y~%s is Wanted, LVL: %d.~N~~R~Player if kill him got: %d$",GetName(killerid), GetPlayerWantedLevel(killerid),GetPlayerWantedLevel(killerid)*(500));
       SendTextDrawMessageToAll(YELLOW, string, 5);
  }
  if GetPlayerWantedLevel(playerid) > 3 && killerid != INVALID_PLAYER_ID *then
  {
       if(ModeInfo[killerid][Cop] == false) _SetPlayerWantedLevel(killerid, GetPlayerWantedLevel(killerid) + 2);
	   format(string, sizeof string,"!$%d וזכה בפרס של כ %s הרג את המבוקש ,%s - השחקן",GetPlayerWantedLevel(playerid)*(500), GetName(playerid), GetName(killerid));
	   SendClientMessageToAll(YELLOW,string);
  	   format(string, sizeof string,"~Y~ %s Kill the wanted: %s~n~~g~and got money(%d$)",GetName(killerid), GetName(playerid), GetPlayerWantedLevel(playerid)*(500));
       SendTextDrawMessageToAll(YELLOW, string, 5);
	   GivePlayerCash(killerid, GetPlayerWantedLevel(playerid)*(500));
	   format(string,sizeof string,"~r~+%d$", GetPlayerWantedLevel(playerid)*(500));
	   GameTextForPlayer(killerid, string, 3000, 1);
  }
  if(killerid != INVALID_PLAYER_ID && IsPlayerConnected(killerid)) _SetPlayerWantedLevel(playerid, 0);
  if(MissionTrack[playerid] && killerid == INVALID_PLAYER_ID)
  {
	 format(string, sizeof string,"!Jizzy Club נכשל במשימת פיצוץ %s :השחקן", GetName(playerid));
	 SendClientMessageToAll(GREEN, string);
 	 EndMission(playerid, false);
  }
  else if(MissionTrack[playerid] && killerid != INVALID_PLAYER_ID)
  {
	 format(string, sizeof string,"!%s על ידי Jizzy Club נהרג במשימת פיצוץ %s :השחקן",GetName(killerid) ,GetName(playerid));
	 SendClientMessageToAll(GREEN, string);
 	 EndMission(playerid, false);
 	 GivePlayerCash(killerid, random(3000)+1000);
  }
  if(InMission[playerid] && killerid == INVALID_PLAYER_ID) CutMission(playerid);
  if(InMission[playerid] == 1 && IsPlayerConnected(killerid) && killerid != playerid)
  {
	 format(string,sizeof string,".שהיה במשימה ולכן קיבלת 3000 דולר בונוס ,%s הרגת את",GetName(playerid));
	 SendClientMessage(killerid, 0xFF66FFAA, string);
	 format(string,sizeof string,".שהיה באמצע משימת הכסף של משפחות הפשע, ולכן זכה ב3000$ ,%s הרג את הפושע ,%s",GetName(playerid),GetName(killerid));
     SendClientMessageToAll(0xFF66FFAA, string);
	 CutMission(playerid);
	 GivePlayerCash(killerid,3000);
  }
  if(killerid != INVALID_PLAYER_ID && !IsPlayerXAdmin(playerid, 19))
  {
      DTime[playerid] = 10;
	  format(string,sizeof string,"You will Respawn in ~y~%d",DTime[playerid]);
	  TextDrawShowForPlayer(playerid, DCam[playerid]);
	  TextDrawSetString(DCam[playerid], string);
      TogglePlayerSpectating(playerid,1);
      PlayerSpectatePlayer(playerid,killerid);
	  KillSpawn[playerid] = SetTimerEx("SpawnDied",1000, 1, "i", playerid);
  }
  if(IsPlayerInAnyVehicle(killerid) && GetVehicleModel(GetPlayerVehicleID(killerid) == 487)) RemovePlayerFromVehicle(killerid), SendClientMessage(playerid,ORANGE,"! אסור להרוג עם מסוק, הוצאת מהמסוק בתור עונש");
  if(killerid != INVALID_PLAYER_ID && IsPlayerConnected(killerid))
  {
        new Float:Health, Float:Armor;
 		GetPlayerHealth(killerid, Health);
		GetPlayerArmour(killerid, Armor);
		GameTextForPlayer(killerid, "~y~+$1000",3000,1);
        GivePlayerCash(killerid, 1000);
        SetPlayerScore(killerid, GetPlayerScore(killerid)+1);
        format(string,sizeof string,"You got killed by %s with A %s [%s's Health: %.0f - Armour: %.0f - Distance %.2f ft]",GetName(killerid),Weapons[reason],GetName(killerid),Health,Armor,GetDistanceBetweenPlayers(playerid,killerid));
        SendClientMessage(playerid, YELLOW, string);
  }
  if(playerid == MayorID && killerid != INVALID_PLAYER_ID && !ModeInfo[killerid][Hitman] && !ModeInfo[killerid][Cop])
  {
	   format(string,sizeof string,"!%s כעת ראש העיר החדש שלכם %s ראש העיר נרצח על ידי",GetName(killerid),GetName(killerid));
	   SendClientMessageToAll(YELLOW, string);
	   SendClientMessageToAll(YELLOW,".לא מרוצים מראש העיר החדש? הרגו אותו ותהפכו אתם לראש העיר, ראש העיר לוקח 600$ מס' כל 10 דקות");
	   MayorID = killerid;
	   ForceClassSelection(playerid);
  }
  if(!strcmp(dini_Get(GetPlayerFile(killerid),"IFamily"),"Corelone", true)) dini_IntSet("/Family/Corelone.ini","Kills", dini_Int("/Family/Corelone.ini","Kills")+1);
  if(!strcmp(dini_Get(GetPlayerFile(killerid),"IFamily"),"Chicano", true)) dini_IntSet("/Family/Chicano.ini","Kills", dini_Int("/Family/Chicano.ini","Kills")+1);
  if(dini_Int(GetPlayerFile(playerid),"Hitman") > 0 && ModeInfo[killerid][Hitman])
  {
	   format(string,sizeof string,"%d$ :המבוקש, סכום הכסף שזכית בהריגה זו %s הרגת את",dini_Int(GetPlayerFile(playerid),"Hitman"), GetName(playerid));
	   SendClientMessage(playerid, ORANGE, string);
       GivePlayerCash(killerid,dini_Int(GetPlayerFile(playerid),"Hitman"));
       dini_IntSet(GetPlayerFile(playerid),"Hitman", 0);
       for(new i = 0; i <= MAX_PLAYERS; i++) if(ModeInfo[i][Hitman]) SetPlayerMarkerForPlayer(i, playerid, GetPlayerColor(playerid));
  }
  dini_IntSet(GetPlayerFile(killerid),"Kills", dini_Int(GetPlayerFile(killerid),"Kills")+1);
  if(playerid != INVALID_PLAYER_ID && IsPlayerConnected(killerid) && killerid != playerid) dini_IntSet(GetPlayerFile(playerid),"Deaths", dini_Int(GetPlayerFile(playerid),"Deaths")+1);
  if(GetPlayerMoney(playerid) > 0 && killerid != INVALID_PLAYER_ID) GivePlayerCash(killerid, GetPlayerMoney(playerid));
  if(killerid == INVALID_PLAYER_ID) SendDeathMessage(INVALID_PLAYER_ID,playerid,reason);
  else SendDeathMessage(killerid,playerid,reason);
  if(InArea(killerid,-899.1964, 794.0955, -525.5044, 1074.365) && strcmp(dini_Get(GetPlayerFile(killerid),"IFamily"),"None", true) && strcmp(dini_Get(GetPlayerFile(killerid),"IFamily"),"Corelone", true) && start_id[0] == -1 && playerid != INVALID_PLAYER_ID)
  {
      if(!strcmp(dini_Get(GetPlayerFile(killerid),"IFamily"),"Chicano", true)) GangZoneFlashForAll(GangZones[0], COLOR_C);
      start_id[0] = killerid;
 	  for(new i = 0; i <= MAX_PLAYERS; i++) if(!strcmp(dini_Get(GetPlayerFile(i),"IFamily"),"Corelone", true) && !strcmp(dini_Get(GetPlayerFile(playerid),"IFamily"),"Corelone", true))
	  {
	      format(string,sizeof string,"%s :הרג את בן המשפחה שלכם בשטח שלכם, ההרוג %s - השחקן",GetName(playerid),GetName(killerid));
	      SendClientMessage(i, 0xEEEEFFC4, string);
	      format(string,sizeof string,"%s - :משפחת הפשע אשר הרגה את חבריכם",dini_Get(GetPlayerFile(killerid),"IFamily"));
	      SendClientMessage(i, 0xEEEEFFC4, string);
	  }
	  return 1;
  }
  if(InArea(killerid, -1799.829, 270.5747, -1212.701, 692.6859) && strcmp(dini_Get(GetPlayerFile(killerid),"IFamily"),"None", true) && strcmp(dini_Get(GetPlayerFile(killerid),"IFamily"),"Chicano", true) && start_id[3] == -1 && playerid != INVALID_PLAYER_ID)
  {
    if(!strcmp(dini_Get(GetPlayerFile(killerid),"IFamily"),"Corelone", true)) GangZoneFlashForAll(GangZones[3], BLUE);
    start_id[4] = killerid;
	for(new i = 0; i <= MAX_PLAYERS; i++) if(!strcmp(dini_Get(GetPlayerFile(i),"IFamily"),"Chicano", true) && !strcmp(dini_Get(GetPlayerFile(playerid),"IFamily"),"Chicano", true))
	{
	    format(string,sizeof string,"%s :הרג את בן המשפחה שלכם בשטח שלכם, ההרוג %s - השחקן",GetName(playerid),GetName(killerid));
	    SendClientMessage(i, 0xEEEEFFC4, string);
		format(string,sizeof string,"%s - :משפחת הפשע אשר הרגה את חבריכם",dini_Get(GetPlayerFile(killerid),"IFamily"));
		SendClientMessage(i, 0xEEEEFFC4, string);
	}
  }
  checkNewLevel(killerid);
  return 1;
}
/*
function(updateScore())
{
   for(new i = 0; i <= MAX_PLAYERS; i++) if(IsPlayerConnected(i) && GetPlayerMoney(i) > 0) SetPlayerScore(i, GetPlayerMoney(i));
   return 1;
}*/
function(updateGangZone())
{
  if(!InArea(start_id[0],-899.1964, 794.0955, -525.5044, 1074.365) && start_id[0] != -1)
  {
      start_id[0] = -1;
      GangZoneStopFlashForAll(GangZones[0]);
  }
  if(!InArea(start_id[1],826.2874, 1581.56, 994.1957, 1860.061) && start_id[1] != -1)
  {
      start_id[1] = -1;
      GangZoneStopFlashForAll(GangZones[1]);
  }
  if(!InArea(start_id[2],2040.695, 1527.407, 2306.224, 1782.699) && start_id[2] != -1)
  {
      start_id[2] = -1;
      GangZoneStopFlashForAll(GangZones[2]);
  }
  if(!InArea(start_id[3],2298.415, 1473.254, 2587.373, 1720.81) && start_id[3] != -1)
  {
      start_id[3] = -1;
      GangZoneStopFlashForAll(GangZones[3]);
  }
  if(!InArea(start_id[4],-1799.829, 270.5747, -1212.701, 692.6859) && start_id[3] != -1)
  {
      start_id[4] = -1;
      GangZoneStopFlashForAll(GangZones[4]);
  }
  return 1;
}
function(PayMayor())
{
  new i;
  if(MayorID == -1) return 0;
  for(i = 0; i <= MAX_PLAYERS; i++)
  {
      if(i != MayorID && IsPlayerConnected(i) && i != Security[0] && i != Security[1])
	  {
         GivePlayerCash(i, -1000);
         if(Security[0] != -1 && Security[1] != -1) GivePlayerCash(MayorID, 1000);
         else GivePlayerCash(MayorID, 500);
		 SendClientMessage(i, ORANGE,"!שילמת 1000$ לראש העיר, נמאס לך לשלם? לך תהרוג אותו כבר");
		 return 1;
      }
  }
  if(Security[0] != -1 || Security[1] != -1)
  {
      SendClientMessage(MayorID,ORANGE,".שים לב, חצי מהכסף שקיבלת שולם למאבטחים שלך, 50 אחוזים מהכסף");
      SendClientMessage(Security[1],ORANGE,".קיבלת 150 דולר על כל שחקן שנמצא בשרת");
      SendClientMessage(Security[0],ORANGE,".קיבלת 150 דולר על כל שחקן שנמצא בשרת");
  }
  for(i = 0; i <= MAX_PLAYERS; i++)
  {
      if(i != MayorID && IsPlayerConnected(i))
      {
          if(Security[0] != -1) GivePlayerCash(Security[0], 250);
          if(Security[1] != -1) GivePlayerCash(Security[1], 250);
          GivePlayerCash(MayorID, -250);
      }
  }
  return 1;
}
function(updateZone())
{
  new string[128], Float:Health_;
  for(new i = 0; i <= MAX_PLAYERS; i++)
  {
      if(GetPlayerWantedLevel(i) > 1 && InArea(i,2238.2854,2431.6733,2314.6528,2497.5640) && !ModeInfo[i][Cop])
      {
		  GetPlayerHealth(i, Health_);
		  _SetPlayerHealth(i, Health_-30);
          _SetPlayerWantedLevel(i, GetPlayerWantedLevel(i) + 3);
          SendClientMessage(i, GOLD, "!לפושעים אסור להיכנס לתחנת משטרה, בגלל שנכנסת רמת המבוקשות שלך עלתה ל 6 וברגע זה נשלחים אליך שוטרים");
          format(string,sizeof string,"!הוא נמצא לא רחוק מהתחנת משטרה, תפוס אותו ,%s :שלום לך שוטר יקר, פושע פלש לתחנת משטרה, שם הפושע",GetName(i));
		  for(new c = 0; c <= MAX_PLAYERS; c++) if(ModeInfo[c][Cop]) SendClientMessage(c, GOLD, string);
      }
  }
  return 1;
}
function(PayShip())
{
   for(new i = 0; i <= MAX_PLAYERS; i++) PayPlayerInArea(i, -1440.9182, -1450.1228, 752.9678, 702.6667, 100);
   return 1;
}
function(UnJail(playerid))
{
  if(!ModeInfo[playerid][Jail]) return 0;
  ModeInfo[playerid][Jail] = false;
  SendClientMessage(playerid, WHITE,".שוחררת מהכלא");
  _SetPlayerWantedLevel(playerid, 0);
  TogglePlayerSpectating(playerid,1);
  SpawnPlayer(playerid);
  return 1;
}
function(hideTDraw(playerid))
{
   Background[playerid] = 0;
   TextDrawHideForPlayer(playerid,TDraw[0]);
   TextDrawHideForPlayer(playerid,TDraw[1]);
   TextDrawHideForPlayer(playerid,TDraw[7]);
   TextDrawHideForPlayer(playerid,TDraw[8]);
   TextDrawHideForPlayer(playerid,TDraw[9]);
   TextDrawShowForPlayer(playerid,TDraw[10]);
   SendClientMessage(playerid,GREEN, "!SAMP-IL Team DeathMatch - ברוכאים הבאים ל");
   SendClientMessage(playerid, BLUE,"!בקרוב הגרסה המלאה Beta שיהיה לכם משחק מהנה! כרגע מותקנת גרסת ,Team DeathMatch - שלום וברוכים הבאים לשרת");
   SendClientMessage(playerid, BLUE,"!בתאריך 13/8/2009, המוד עודכן לאחרונה בתאריך 10/1/2011, המוד בקרוב יצא בגרסה חדשה ומלאת הפתעות, שווה לחכות JoeShk - המוד נוצר ע\"י");
   if(dini_Exists(GetPlayerFile(playerid))) ShowPlayerDialog(playerid, 1, DIALOG_STYLE_INPUT, "  Welcome to - Team DeathMatch"," • שלום לך, אנא הקש/י את הסיסמה שלך על מנת להתחבר ולהתחיל לשחק", "התחבר", "ביטול");
   else ShowPlayerDialog(playerid, 2, DIALOG_STYLE_INPUT, "  Welcome to - Team DeathMatch"," • שלום לך, אנא הקש את הסיסמה הרצויה לפתיחת חשבון בשרתנו", "הרשם", "ביטול");
   SendClientMessage(playerid,ORANGE,"SA-MP.co.il > Team DeathMatch - מדריך על המוד וכיצד לשחק בסוג מוד שכזה /Help - לקבלת עזרה בנוגע למוד");
   ForceClassSelection(playerid);
   OnPlayerRequestClass(playerid, 0);
   SetPlayerSkin(playerid, ARMY_SKIN);
   SetPlayerInterior(playerid,0);
   SetPlayerPos(playerid,221.5928,1822.7688,7.4930);
   SetPlayerFacingAngle(playerid, 272.7905);
   SetPlayerCameraPos(playerid,225.6606,1821.5970,6.4141);
   SetPlayerCameraLookAt(playerid,221.5928,1822.7688,7.4930);
   TextDrawSetString(TDraw[13], "Forum:SA-MP.co.il~n~Version: 0.1b");
   TextDrawShowForPlayer(playerid, TDraw[13]);
   return 1;
}
function(Behind(playerid)) SetCameraBehindPlayer(playerid);
function(PayPlayerInArea(playerid, Float:max_x, Float:min_x, Float:max_y, Float:min_y, cash))
{
  new Float:X, Float:Y, Float:Z;
  GetPlayerPos(playerid, X, Y, Z);
  if(X <= max_x && X >= min_x && Y <= max_y && Y >= min_y) GivePlayerCash(playerid, cash);
  return 1;
}
function(InArea(playerid,Float:min_x, Float:min_y,  Float:max_x, Float:max_y))
{
  new Float:X, Float:Y, Float:Z;
  GetPlayerPos(playerid, X, Y, Z);
  return (X <= max_x && X >= min_x && Y <= max_y && Y >= min_y)? 1 : 0;
}
function(getOnlineVar(var1[], var2[]))
{
   new i, count;
   for(i = 0; i <= MAX_PLAYERS; i++) if(!strcmp(dini_Get(GetPlayerFile(i),var1),var2, true) && IsPlayerConnected(i)) count++;
   return count;
}
function(CreateFiles())
{
   new string[128];
   if(!dini_Exists("/opanel/vehicles/main.ini"))
   {
      dini_Create("/opanel/vehicles/main.ini");
	  dini_IntSet("/opanel/vehicles/main.ini", "Total", 0);
   }
   if(!dini_Exists("/opanel/pickups/main.ini"))
   {
      dini_Create("/opanel/pickups/main.ini");
	  dini_IntSet("/opanel/pickups/main.ini", "Total", 0);
   }
   if(!dini_Exists("/Family/Corelone.ini")) dini_Create("/Family/Corelone.ini"), dini_IntSet("/Family/Corelone.ini","Kills", 0);
   if(!dini_Exists("/Family/Chicano.ini")) dini_Create("/Family/Chicano.ini"), dini_IntSet("/Family/Chicano.ini","Kills", 0);
   if(dini_Exists("/opanel/panel.cfg"))
   {
       format(string,sizeof string,"password %s", dini_Get("/opanel/panel.cfg","password"));
	   if(strcmp(dini_Get("/panel.cfg","password"),"0", true)) SendRconCommand(string);
	   format(string,sizeof string,"hostname %s", dini_Get("/opanel/panel.cfg","hostname"));
	   SendRconCommand(string);
   }
   else
   {
	   dini_Create("/opanel/panel.cfg");
	   dini_Set("/opanel/panel.cfg","hostname","SA-MP-IL - Team DeathMatch");
	   SendRconCommand("hostname SA-MP-IL - Team DeathMatch");
   }
}
function(PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z))
{
  new Float:oldposx, Float:oldposy, Float:oldposz, Float:tempposx, Float:tempposy, Float:tempposz;
  GetPlayerPos(playerid, oldposx, oldposy, oldposz);
  tempposx = (oldposx -x), tempposy = (oldposy -y), tempposz = (oldposz -z);
  return (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))? 1 :0;
}
function(GiveWeapons(playerid))
{
  if(ModeInfo[playerid][Cop]) return SendClientMessage(playerid,ORANGE,"!לא קיבלת בספואן הזה את הנשקים התמידים שלך בגלל שאתה שוטר, שתצא מהפקיד של השוטר תקבל אותם חזרה"),0;
  if(dini_Int(GetPlayerFile(playerid),"Sawn") > 0) _GivePlayerWeapon(playerid,26,dini_Int(GetPlayerFile(playerid),"Sawn"));
  if(dini_Int(GetPlayerFile(playerid),"MicroSMG") > 0) _GivePlayerWeapon(playerid,28,dini_Int(GetPlayerFile(playerid),"MicroSMG"));
  if(dini_Int(GetPlayerFile(playerid),"Tec9") > 0) _GivePlayerWeapon(playerid,32,dini_Int(GetPlayerFile(playerid),"Tec9"));
  if(dini_Int(GetPlayerFile(playerid),"M4") > 0) _GivePlayerWeapon(playerid,31,dini_Int(GetPlayerFile(playerid),"M4"));
  if(dini_Int(GetPlayerFile(playerid),"MP5") > 0) _GivePlayerWeapon(playerid,29,dini_Int(GetPlayerFile(playerid),"MP5"));
  if(dini_Int(GetPlayerFile(playerid),"AK47") > 0) _GivePlayerWeapon(playerid,30,dini_Int(GetPlayerFile(playerid),"AK47"));
  if(dini_Int(GetPlayerFile(playerid),"Knife") > 0) _GivePlayerWeapon(playerid,4,1);
  if(dini_Int(GetPlayerFile(playerid),"Katana") > 0) _GivePlayerWeapon(playerid,8, 1);
  if(dini_Int(GetPlayerFile(playerid),"CombatShotGun") > 0) _GivePlayerWeapon(playerid,27,dini_Int(GetPlayerFile(playerid),"CombatShotGun"));
  if(dini_Int(GetPlayerFile(playerid),"ShotGun") > 0) _GivePlayerWeapon(playerid,25,dini_Int(GetPlayerFile(playerid),"ShotGun"));
  if(dini_Int(GetPlayerFile(playerid),"CRifle") > 0) _GivePlayerWeapon(playerid,34,dini_Int(GetPlayerFile(playerid),"CRifle"));
  if(dini_Int(GetPlayerFile(playerid),"Colt") > 0) _GivePlayerWeapon(playerid,22,dini_Int(GetPlayerFile(playerid),"Colt"));
  return 1;
}
function(ShowMenu(playerid))
{
   ShowMenuForPlayer(Weapon, playerid);
   return 1;
}
function(Float:GetDistanceBetweenPlayers(p1,p2)) // Improved By Me
{
  new Float:Pos[6];
  if(!IsPlayerConnected(p1) || !IsPlayerConnected(p2)) return -1.00;
  GetPlayerPos(p1,Pos[0],Pos[1],Pos[2]);
  GetPlayerPos(p2,Pos[3],Pos[4],Pos[5]);
  return floatsqroot(floatpower(floatabs(floatsub(Pos[3],Pos[0])),2)+floatpower(floatabs(floatsub(Pos[4],Pos[1])),2)+floatpower(floatabs(floatsub(Pos[5],Pos[2])),2));
}
function(GivePlayerCash(playerid, money))
{
 	if (money > 0)
	{
		cash_var[playerid] += money;
		GivePlayerMoney(playerid,money);
	}
	else
	{
	    GivePlayerMoney(playerid,money);
		cash_var[playerid] -= money;
	}
}
function(ResetPlayerCash(playerid))
{
	ResetPlayerCash(playerid);
	cash_var[playerid] = 0;
}
function(spaming())
{
  for(new i = 0; i <= MAX_PLAYERS; i++) ModeInfo[i][spam] = false;
  return 1;
}
function(SpawnDied(playerid))
{
  new string[128];
  format(string,sizeof string,"You will Respawn in %s%d",DTime[playerid] > 3? ("~y~") : ("~r~"), DTime[playerid]);
  TextDrawSetString(DCam[playerid], string);
  if(DTime[playerid] > 0) DTime[playerid]--;
  else SetCameraBehindPlayer(playerid), TogglePlayerSpectating(playerid,0), KillTimer(KillSpawn[playerid]), TextDrawHideForPlayer(playerid, DCam[playerid]);
  return 1;
}
function(Float:GetPlayerTheoreticAngle(i))
{
        new Float:sin, Float:dis, Float:angle2, Float:x,Float:y,Float:z, Float:tmp3, Float:tmp4, Float:MindAngle;
        if(IsPlayerConnected(i))
		{
                GetPlayerPos(i,x,y,z);
                dis = floatsqroot(floatpower(floatabs(floatsub(x,pdrift_Pos[i][0])),2)+floatpower(floatabs(floatsub(y,pdrift_Pos[i][1])),2));
                if(IsPlayerInAnyVehicle(i)) GetVehicleZAngle(GetPlayerVehicleID(i), angle2); else GetPlayerFacingAngle(i, angle2);
                tmp3 = x > pdrift_Pos[i][0]? x - pdrift_Pos[i][0] : pdrift_Pos[i][0] - x;
                tmp4 = y > pdrift_Pos[i][1]? y - pdrift_Pos[i][1] : pdrift_Pos[i][1] - y;
                if(pdrift_Pos[i][1] > y && pdrift_Pos[i][0] > x)
				{
                	sin = asin(tmp3/dis);
                    MindAngle = floatsub(floatsub(floatadd(sin, 90), floatmul(sin, 2)), -90.0);
                }
                if(pdrift_Pos[i][1] < y && pdrift_Pos[i][0] > x)
				{
                    sin = asin(tmp3/dis);
                    MindAngle = floatsub(floatadd(sin, 180), 180.0);
                }
                if(pdrift_Pos[i][1] < y && pdrift_Pos[i][0] < x)
				{
                    sin = acos(tmp4/dis);
                    MindAngle = floatsub(floatadd(sin, 360), floatmul(sin, 2));
                }
				if(pdrift_Pos[i][1] > y && pdrift_Pos[i][0] < x)
				{
                    sin = asin(tmp3/dis);
                    MindAngle = floatadd(sin, 180);
                }
        }
        if(MindAngle == 0.0) return angle2; else return MindAngle;
}

function(DriftExit(playerid))
{
        new Float:h;
        PlayerDriftCancellation[playerid] = 0;
        GetVehicleHealth(GetPlayerVehicleID(playerid),h);
        TextDrawHideForPlayer(playerid,TDLabels);
        TextDrawHideForPlayer(playerid,TDValueDrift[playerid]);
        TextDrawHideForPlayer(playerid,TDValueBonus[playerid]);
        DriftBonus[playerid]=1;
        DriftPointsNow[playerid] = 0;
}
function(Float:ReturnPlayerAngle(playerid))
{
        new Float:Ang;
        if(IsPlayerInAnyVehicle(playerid)) GetVehicleZAngle(GetPlayerVehicleID(playerid), Ang); else GetPlayerFacingAngle(playerid, Ang);
        return Ang;
}
function(Drift())
{
        new Float:Angle1, Float:Angle2, Float:BySpeed, Float:Z, Float:X, Float:Y, Float:SpeedX, DPs[128],DBn[128];
        for(new g = 0; g <= MAX_PLAYERS; g++)
		{
                GetPlayerPos(g, X, Y, Z);
                SpeedX = floatsqroot(floatadd(floatadd(floatpower(floatabs(floatsub(X,Saveddrift_Pos[ g ][ sX ])),2),floatpower(floatabs(floatsub(Y,Saveddrift_Pos[ g ][ sY ])),2)),floatpower(floatabs(floatsub(Z,Saveddrift_Pos[ g ][ sZ ])),2)));
                Angle1 = ReturnPlayerAngle(g);
                Angle2 = GetPlayerTheoreticAngle(g);
                BySpeed = floatmul(SpeedX, 12);
                if(IsPlayerInAnyVehicle(g) && GetVType(GetPlayerVehicleID(g)) && floatabs(floatsub(Angle1, Angle2)) > DRIFT_MINKAT && floatabs(floatsub(Angle1, Angle2)) < DRIFT_MAXKAT && BySpeed > DRIFT_SPEED && GetPlayerState(g) == PLAYER_STATE_DRIVER)
				{
                        if(PlayerDriftCancellation[g] > 0) KillTimer(PlayerDriftCancellation[g]);
                        PlayerDriftCancellation[g] = 0;
                        DriftPointsNow[g] += floatval( floatabs(floatsub(Angle1, Angle2)) * 3 * (BySpeed*0.1) ) / 10;
                        PlayerDriftCancellation[g] = SetTimerEx("DriftExit", 3000, 0, "d", g);
                }
                if(DriftPointsNow[g] > 70 && DriftPointsNow[g]<10000)
				{
                  if(DriftPointsNow[g] < 200) DriftBonus[g] = 1;
				  if(DriftPointsNow[g] >= 200 && DriftPointsNow[g] < 500) DriftBonus[g] = 2;
				  if(DriftPointsNow[g] >= 500 && DriftPointsNow[g] < 1000) DriftBonus[g] = 3;
				  if(DriftPointsNow[g] >= 1000 && DriftPointsNow[g] < 1500) DriftBonus[g] = 4;
				  if(DriftPointsNow[g] >= 1500) DriftBonus[g]=5;
				  TextDrawShowForPlayer(g,TDLabels);
				  TextDrawShowForPlayer(g,TDValueDrift[g]);
                  TextDrawShowForPlayer(g,TDValueBonus[g]);
                  valstr(DPs,DriftPointsNow[g],false);
                  format(DBn,sizeof DBn,"X%i",DriftBonus[g]);
                  TextDrawSetString(TDValueDrift[g],DPs);
                  TextDrawSetString(TDValueBonus[g],DBn);
				}
				Saveddrift_Pos[ g ][ sX ] = X, Saveddrift_Pos[ g ][ sY ] = Y, Saveddrift_Pos[ g ][ sZ ] = Z;
        }
}
function(AngleUpdate())
{
        for(new g = 0; g <= MAX_PLAYERS; g++)
		{
                new Float:x, Float:y, Float:z;
                if(IsPlayerInAnyVehicle(g)) GetVehiclePos(GetPlayerVehicleID(g), x, y, z); else GetPlayerPos(g, x, y, z);
                pdrift_Pos[g][0] = x, pdrift_Pos[g][1] = y, pdrift_Pos[g][2] = z;
        }
}
function(floatval(Float:val))
{
        new str[256];
        format(str, 256, "%.0f", val);
        return fstr(str);
}
function(LoadTextDraws())
{
  new i, string[128], date[3];
  getdate(date[0], date[1], date[2]);
  TDraw[2] = TextDrawCreate(325,235,"------------------------~n~Action       Keys~n~Next player: LMB~N~Change view: C~n~Exit Spec: G~n~------------------------");
  TextDrawTextSize(TDraw[2],550,550);
  TextDrawAlignment(TDraw[2],2);
  TextDrawFont(TDraw[2],1);
  TextDrawLetterSize(TDraw[2],0.399999,1.000000);
  TextDrawColor(TDraw[2],RED);
  TextDrawSetOutline(TDraw[2],1);
  TextDrawSetProportional(TDraw[2],1);
  TextDrawSetShadow(TDraw[2],1);
  TextDrawUseBox(TDraw[2],1);
  TextDrawBoxColor(TDraw[2],rgba2hex(0,0,0, 100));
  //SendDrawToAll
  TDraw[3] = TextDrawCreate(190, 410," ");
  TextDrawColor(TDraw[3], YELLOW );
  TextDrawSetShadow(TDraw[3],1);
  TextDrawFont(TDraw[3],1);
  TextDrawSetProportional(TDraw[3],2);
  TextDrawLetterSize(TDraw[3],0.355555,1.000000);
  //SendDrawToAll
  TDraw[4] = TextDrawCreate(10.000000,330.000000," ");
  TextDrawColor(TDraw[4], YELLOW );
  TextDrawSetShadow(TDraw[4],1);
  TextDrawFont(TDraw[4],1);
  TextDrawSetProportional(TDraw[4],2);
  TextDrawLetterSize(TDraw[4],0.355555,1.000000);
  //SendDrawToAll
  TDraw[5] = TextDrawCreate(40.000000,125.000000," ");
  TextDrawTextSize(TDraw[5],225,300);
  TextDrawColor(TDraw[5], WHITE );
  TextDrawSetShadow(TDraw[5],1);
  TextDrawFont(TDraw[5],1);
  TextDrawSetProportional(TDraw[5],2);
  TextDrawLetterSize(TDraw[5],0.422211,1.000000);
  TextDrawUseBox(TDraw[5],1);
  TextDrawBoxColor(TDraw[5], rgba2hex(0,0,0, 240));
  //Textdraw:
  TDraw[7] = TextDrawCreate(280,120,"SA-MP.co.il Team DeathMatch:");
  TextDrawLetterSize(TDraw[7],0.422221,3.000000);
  TextDrawAlignment(TDraw[7],0);
  TextDrawBackgroundColor(TDraw[7],0x00000099);
  TextDrawFont(TDraw[7],0);
  TextDrawColor(TDraw[7],0xffffffff);
  TextDrawSetOutline(TDraw[7],1);
  TextDrawSetProportional(TDraw[7],1);
  TextDrawSetShadow(TDraw[7],1);
  TDraw[0] = TextDrawCreate(325,120,"~n~~n~~n~~n~~n~~w~~n~- CHOSE A TEAM, FACTION, FAMILY~n~- VISIT: TDM.SA-MP.co.il~n~- VENTRILO IP: 80.179.153.12~n~- VENTRILO PORT: 10976~n~- CODE BY: JOESHK~n~- MODE VERSION: 0.1~n~- THANK SA-MP STAFF~n~- PROFESSIONAL GANG WARS~n~");
  TextDrawTextSize(TDraw[0],550,550);
  TextDrawAlignment(TDraw[0],2);
  TextDrawFont(TDraw[0],2);
  TextDrawLetterSize(TDraw[0],0.499999,1.000000);
  TextDrawColor(TDraw[0],RED);
  TextDrawSetProportional(TDraw[0],1);
  TextDrawSetShadow(TDraw[0],1);
  TextDrawUseBox(TDraw[0],1);
  TextDrawBoxColor(TDraw[0],rgba2hex(49,49,49, 90));
  TDraw[1] = TextDrawCreate(325,261,"~W~ - NO CHEATING OR HACKING~N~- NO FLOODING OR SPAMING~N~ RESPECT OTHER PLAYERS~N~ - NO SPAWN CAMPING/KILLING~N~DONT TEAM KILLING~n~ - VISIT: ~r~GTA~W~.~G~SA-MP~W~.~P~co~W~.~P~il~n~");
  TextDrawTextSize(TDraw[1],550,550);
  TextDrawAlignment(TDraw[1],2);
  TextDrawFont(TDraw[1],2);
  TextDrawLetterSize(TDraw[1],0.499999,1.000000);
  TextDrawColor(TDraw[1],RED);
  TextDrawSetProportional(TDraw[1],1);
  TextDrawSetShadow(TDraw[1],1);
  TextDrawUseBox(TDraw[1],1);
  TextDrawBoxColor(TDraw[1],rgba2hex(49,49,49, 90));
  //
  TDraw[8] = TextDrawCreate(325, 155,"SERVER RULES AND GUIDES");
  TextDrawTextSize(TDraw[8],550,550);
  TextDrawAlignment(TDraw[8],2);
  TextDrawFont(TDraw[8],2);
  TextDrawLetterSize(TDraw[8],0.599999,1.000000);
  TextDrawColor(TDraw[8], GOLD);
  TextDrawSetProportional(TDraw[8],1);
  TextDrawSetShadow(TDraw[8],1);
  getdate(date[0], date[1], date[2]);
  format(string,sizeof string,"San Fierro: Team DeathMatch~n~Mode Version: 0.1~n~Revision: 1~n~Date: %d/%d/%d~n~", date[0],date[1],date[2]);
  TDraw[9] = TextDrawCreate(325,330 ,string);
  TextDrawTextSize(TDraw[9],550,550);
  TextDrawAlignment(TDraw[9],2);
  TextDrawFont(TDraw[9],2);
  TextDrawLetterSize(TDraw[9],0.299999,1.000000);
  TextDrawColor(TDraw[9],ORANGE);
  TextDrawSetProportional(TDraw[9],1);
  TextDrawSetShadow(TDraw[9],1);
  TextDrawUseBox(TDraw[9],1);
  TextDrawBoxColor(TDraw[9],rgba2hex(49,49,49, 90));
  TDraw[10] = TextDrawCreate(90, 429 ,"SA-MP.co.il"); // 325, 235
  TextDrawAlignment(TDraw[10],2);
  TextDrawFont(TDraw[10],3);
  TextDrawLetterSize(TDraw[10],0.655555,1.000000); // 99999
  TextDrawColor(TDraw[10],0x00FFFFAA);
  TextDrawSetOutline(TDraw[10],2);
  TextDrawSetProportional(TDraw[10],1);
  TextDrawSetShadow(TDraw[10],1);
  format(string,sizeof string, "FORUM: SA-MP.CO.IL~N~DATE: %d/%d/%d", date[0], date[1], date[2]);
  TDraw[13] = TextDrawCreate(500, 420 ,string); // 325, 235
  TextDrawFont(TDraw[13],3);
  TextDrawLetterSize(TDraw[13],0.299999,1.000000);
  TextDrawColor(TDraw[13], RED);
  TextDrawSetOutline(TDraw[13],1);
  //
  TDLabels = TextDrawCreate(500,100,"~R~Drift ~y~Points");
  TextDrawColor(TDLabels,0xFFFFFFFF);
  TextDrawSetShadow(TDLabels,0);
  TextDrawSetOutline(TDLabels,1);
  TextDrawLetterSize(TDLabels,0.5,2);
  TextDrawBackgroundColor(TDLabels,0x00000040);
  TextDrawFont(TDLabels,1);
  for( i = 0; i <= MAX_PLAYERS; i++)
  {
		TDValueDrift[i] = TextDrawCreate(500,100+20,"0");
		TextDrawColor(TDValueDrift[i],0x000000FF);
		TextDrawSetShadow(TDValueDrift[i],0);
		TextDrawSetOutline(TDValueDrift[i],1);
		TextDrawLetterSize(TDValueDrift[i],0.5,2);
		TextDrawBackgroundColor(TDValueDrift[i],0xFFFFFF40);
		TextDrawFont(TDValueDrift[i],3);
		TDValueBonus[i]=TextDrawCreate(500,100+70,"X1");
		TextDrawColor(TDValueBonus[i],0x000000FF);
		TextDrawSetShadow(TDValueBonus[i],0);
		TextDrawSetOutline(TDValueBonus[i],1);
		TextDrawLetterSize(TDValueBonus[i],0.5,2);
		TextDrawBackgroundColor(TDValueBonus[i],0xFFFFFF40);
		TextDrawFont(TDValueBonus[i],3);
  }

}
function(CheckPlayerState())
{
	new i, cs;
	for( i = 0; i <= MAX_PLAYERS; i++)
	{
	    cs = GetPlayerState(i);
	    if(DriftMode[i] && cs == PLAYER_STATE_DRIVER && DriftPointsNow[i] > 70)
		{
	        new Float:h;
	        GetVehicleHealth(GetPlayerVehicleID(i),h);
	        if( h < HealthInit[i])
			{
	        	KillTimer(DriftTimer[i]);
	        	DriftExit(i);
	        	GameTextForPlayer(i,"~r~Drifht Crash",800,5);
	        	DriftMode[i]=false;
			}
		}
	    if(cs == PLAYER_STATE_DRIVER && !DriftMode[i])
		{
	        if(GetVType(GetPlayerVehicleID(i)))
			{
		        DriftMode[i] = true;
		        GetVehicleHealth(GetPlayerVehicleID(i),HealthInit[i]);
		        DriftTimer[i] = SetTimerEx("Drift", 200, true, "i", i);
			}
		}
		else if(cs != PLAYER_STATE_DRIVER && DriftMode[i])
		{
		    KillTimer(DriftTimer[i]);
		    DriftMode[i] = false;
		}
	}
	return 1;
}
function(GetVType(vid))
{
      new modelid = GetVehicleModel(vid), i;
	  new Convertibles[4] = {480, 533, 439, 555}, Industrial[26] = {499, 422, 482, 498, 609, 524, 578, 455, 403, 414, 582, 443, 514, 413, 515, 440, 543, 605, 459, 531, 408, 552, 478, 456, 554}, LowRider[8] = {536, 575, 534, 567, 535, 566, 576, 412}, OffRoad[13] = {568, 424, 573, 579, 400, 500, 444, 556, 557, 470, 489, 505, 595}, Service[19] = {416, 433, 431, 438, 437, 523, 427, 490, 528, 407, 544, 596, 596, 597, 598, 599, 432, 601, 420},
	  Saloon[35] = {445, 504, 401, 518, 527, 542, 507, 562, 585, 419, 526, 604, 466, 492, 474, 546, 517, 410, 551, 516, 467, 600, 426, 436, 547, 405, 580, 560, 550, 549, 540, 491, 529, 421}, Sports[20] = {602, 429, 496, 402, 541, 415, 589, 587, 565, 494, 502, 503, 411, 559, 603, 475, 506, 451, 558, 477}, Wagons[5] = {418, 404, 479, 458, 561};
	  for(i = 0; i < 3; i++) if(Convertibles[i] == modelid) return 1;
	  for(i = 0; i < 25; i++) if(Industrial[i] == modelid) return 1;
	  for(i = 0; i < 7;i++) if(LowRider[i] == modelid) return 1;
	  for(i = 0; i < 12;i++) if(OffRoad[i]== modelid) return 1;
	  for(i = 0; i < 19; i++) if(Service[i] == modelid) return 1;
	  for(i = 0; i < 35; i++) if(Saloon[i] == modelid) return 1;
	  for(i = 0; i < 20; i++) if(Sports[i] == modelid) return 1;
	  for(i = 0; i < 5;i++) if(Wagons[i] == modelid) return 1;
	  return 0;
}
function(BlastBomb(playerid,object))
{
      CreateExplosion(XBomb, YBomb, ZBomb, 10, 38.0);
      DestroyObject(object);
      return 1;
}
function(AnimDance(playerid,s))
{
  if(s == 1) ApplyAnimation(playerid,"DANCING","bd_clap",4.0,1,1,1,1,0);
  else if(s == 2) ApplyAnimation(playerid,"DANCING","bd_clap1",4.0,1,1,1,1,0);
  else if(s == 3) ApplyAnimation(playerid,"DANCING","dance_loop",4.0,1,1,1,1,0);
  else if(s == 4) ApplyAnimation(playerid,"DANCING","DAN_Down_A",4.0,1,1,1,1,0);
  else if(s == 5) ApplyAnimation(playerid,"DANCING","DAN_Left_A",4.0,1,1,1,1,0);
  else if(s == 6) ApplyAnimation(playerid,"DANCING","DAN_Loop_A",4.0,1,1,1,1,0);
  else if(s == 7) ApplyAnimation(playerid,"DANCING","DAN_Right_A",4.0,1,1,1,1,0);
  else if(s == 8) ApplyAnimation(playerid,"DANCING","DAN_Up_A",4.0,1,1,1,1,0);
  else if(s == 9) ApplyAnimation(playerid,"DANCING","dnce_M_a",4.0,1,1,1,1,0);
  else if(s == 10) ApplyAnimation(playerid,"DANCING","dnce_M_b",4.0,1,1,1,1,0);
  else if(s == 11) ApplyAnimation(playerid,"DANCING","dnce_M_c",4.0,1,1,1,1,0);
  else if(s == 12) ApplyAnimation(playerid,"DANCING","dnce_M_d",4.0,1,1,1,1,0);
  else if(s == 13) ApplyAnimation(playerid,"DANCING","dnce_M_e",4.0,1,1,1,1,0);
}
function(SellWangExportVehicle(playerid))
{
   if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,RED,".אתה לא נמצא בשום רכב");
   new string[128], wantedVehicle = -1;
   for(new i = 0 ; i < 25; i++)
   {
      if(wantedWangExportVehicles[i]==wantedWangExportVehicle)
	  {
	     wantedVehicle = i;
	     break;
      }
   }
   if(wantedVehicle >= 0)
   {
      if(GetVehicleModel(GetPlayerVehicleID(playerid)) != wantedWangExportVehicle)
	  {
	      format(string,sizeof string,"%s :מוסך וואנג מחפש את הרכב", wantedWangExportVehicleNames[wantedWangExportVehicle]);
          SendClientMessage(playerid,RED,string);
   	      format(string,sizeof string,"%s :ולא את הרכב", VehiclesName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
          SendClientMessage(playerid,RED,string);
	      return 1;
	  }
	  new payment = (random(7)+1)*1000;
	  format(string, sizeof string, "!$%d :תודה לך על הרכב, קיבלת ממוסך וואנג",payment);
	  SendClientMessage(playerid,ORANGE, string);
	  GivePlayerCash(playerid, payment);
	  SetVehicleToRespawn(GetPlayerVehicleID(playerid));
	  return 1;
   }
   return 1;
}
function(WangM())
{
   new string[128], n = random(25);
   wantedWangExportVehicle = wantedWangExportVehicles[n];
   format(string, sizeof string,"!%s's - מוסך וואנג מחפש כרגע את הרכב", wantedWangExportVehicleNames[n]);
   SendClientMessageToAll(YELLOW, string);
   format(string, sizeof string,"~y~Garage Wang searcher the car~w~: ~p~%s's ~y~right now!", wantedWangExportVehicleNames[n]);
   SendTextDrawMessageToAll(YELLOW, string, 10);
   return 1;
}
function(moveShark())
{
    new Float:pos[2][3], string[256], Float:healthh;
	GetObjectPos(shark[0],pos[0][0], pos[0][1], pos[0][2]);
	GetObjectPos(shark[1],pos[1][0], pos[1][1], pos[1][2]);
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		GetPlayerHealth(i, healthh);
		if(PlayerToPoint(6.0, i, pos[1][0], pos[1][1], pos[1][2]) || PlayerToPoint(6.0, i, pos[0][0], pos[0][1], pos[0][2]) && healthh != 0.0)
		{
		    _SetPlayerHealth(i, 0.0);
		    if(last != i)
		    {
		        format(string, sizeof string, "!!הנוב, נהרג ע\"י הכריש של הספינה, תלמדו מטעיות לא להתקרב לכרישים רעבים%s - השחקן", GetName(i));
		        SendClientMessageToAll(ORANGE, string);
		        SendClientMessage(i, YELLOW, "!נהרגת ע\"י הכריש של הספינה... נוב");
		    }
		    last = i;
		}
	}
	if(pos[0][1] >= 778.152649)
	{
         SetObjectRot(shark[0],0,0,180);
         MoveObject(shark[0],-1435.370605, 718.152649, 2.084444, 9.0);
    }
	else if(pos[0][1] <= 718.152649)
	{
         SetObjectRot(shark[0],0,0,0);
         MoveObject(shark[0],-1435.370605, 778.152649, 2.084444, 9.0);
    }
	if(pos[1][1] >= 778.521545)
	{
         SetObjectRot(shark[1],0,0,180);
         MoveObject(shark[1],-1457.897949, 718.521545, 2.095426, 9.0);
    }
	if(pos[1][1] <= 718.521545)
    {
         SetObjectRot(shark[1],0,0,0);
         MoveObject(shark[1],-1457.897949, 778.521545, 2.095426, 9.0);
    }
	return 1;
}
function(OnPlayerPickUpPickup(playerid, pickupid))
{
  if( pickups[ pickupid ][ creation_time ] != 0 ) _GivePlayerWeapon( playerid, pickups[ pickupid ][ weapon ], pickups[ pickupid ][ ammo ] );
  if(pickupid == mship) SendClientMessage(playerid, random(3) == 1? ORANGE : YELLOW, "Welcome To The Money Ship All 5 seconds u will get 100$!");
  if(pickupid == pickupMission && ModeInfo[playerid][Cop] == false) StartMission(playerid);
  if(pickupid == be)
  {
    SetPlayerInterior(playerid,1);
    SetPlayerPos(playerid,2144.0793,1612.3879,993.6882);
    return 1;
  }
  return 1;
}
function(OnVehicleMod(playerid, vehicleid, componentid))
{
	static const
		cs_bMods[194][7] =
		{
			{
				V(404) | V(405) | V(421),
				0,
				V(489) | V(492),
				V(505) | V(516),
				V(547),
				V(589),
				0
			},
			{
				V(401) | V(405) | V(410) | V(415) | V(420) | V(426),
				V(436) | V(439),
				0,
				V(496) | V(518) | V(527),
				V(529) | V(540) | V(546) | V(549) | V(550),
				V(580) | V(585),
				V(603)
			},
			{
				V(404) | V(418),
				0,
				V(489),
				V(496) | V(505) | V(516) | V(517),
				V(546) | V(551),
				0,
				0
			},
			{
				V(401) | V(410) | V(415) | V(420) | V(426),
				V(436) | V(439),
				V(491),
				V(496) | V(517) | V(518),
				V(529) | V(547) | V(549) | V(550) | V(551),
				V(585),
				0
			},
			{
				V(401) | V(420) | V(426),
				0,
				V(478) | V(489) | V(492),
				V(505) | V(516),
				V(540) | V(546) | V(550),
				V(589),
				V(600)
			},
			{
				V(401) | V(420) | V(426),
				0,
				V(478) | V(489) | V(492),
				V(505) | V(518),
				V(550) | V(551),
				V(589),
				V(600)
			},
			{
				V(401) | V(418) | V(426),
				V(436),
				V(477) | V(489) | V(492),
				V(496) | V(505) | V(518),
				V(529) | V(540) | V(546) | V(550) | V(551),
				V(580) | V(585) | V(589),
				V(600) | V(603)
			},
			{
				V(401) | V(404) | V(410) | V(415) | V(422),
				V(436) | V(439),
				V(477) | V(491),
				V(496) | V(516) | V(517) | V(518) | V(527),
				V(529) | V(540) | V(546) | V(549),
				V(580) | V(585) | V(589),
				V(600) | V(603)
			},
			{
				V(400) | V(401) | V(402) | V(404) | V(405) | V(409) | V(410) | V(411) | V(412) | V(415) | V(418) | V(419) | V(420) | V(421) | V(422) | V(424) | V(426),
				V(436) | V(438) | V(439) | V(442) | V(445) | V(451) | V(458),
				V(466) | V(467) | V(474) | V(475) | V(477) | V(478) | V(479) | V(480) | V(489) | V(491) | V(492),
				V(496) | V(500) | V(505) | V(506) | V(507) | V(516) | V(517) | V(518) | V(526) | V(527),
				V(529) | V(533) | V(534) | V(535) | V(536) | V(540) | V(541) | V(542) | V(545) | V(546) | V(547) | V(549) | V(550) | V(551) | V(555) | V(558) | V(559),
				V(560) | V(561) | V(562) | V(565) | V(566) | V(567) | V(575) | V(576) | V(579) | V(580) | V(585) | V(587) | V(589),
				V(600) | V(602) | V(603)
			},
			{
				V(400) | V(401) | V(402) | V(404) | V(405) | V(409) | V(410) | V(411) | V(412) | V(415) | V(418) | V(419) | V(420) | V(421) | V(422) | V(424) | V(426),
				V(436) | V(438) | V(439) | V(442) | V(445) | V(451) | V(458),
				V(466) | V(467) | V(474) | V(475) | V(477) | V(478) | V(479) | V(480) | V(489) | V(491) | V(492),
				V(496) | V(500) | V(505) | V(506) | V(507) | V(516) | V(517) | V(518) | V(526) | V(527),
				V(529) | V(533) | V(534) | V(535) | V(536) | V(540) | V(541) | V(542) | V(545) | V(546) | V(547) | V(549) | V(550) | V(551) | V(555) | V(558) | V(559),
				V(560) | V(561) | V(562) | V(565) | V(566) | V(567) | V(575) | V(576) | V(579) | V(580) | V(585) | V(587) | V(589),
				V(600) | V(602) | V(603)
			},
			{
				V(400) | V(401) | V(402) | V(404) | V(405) | V(409) | V(410) | V(411) | V(412) | V(415) | V(418) | V(419) | V(420) | V(421) | V(422) | V(424) | V(426),
				V(436) | V(438) | V(439) | V(442) | V(445) | V(451) | V(458),
				V(466) | V(467) | V(474) | V(475) | V(477) | V(478) | V(479) | V(480) | V(489) | V(491) | V(492),
				V(496) | V(500) | V(505) | V(506) | V(507) | V(516) | V(517) | V(518) | V(526) | V(527),
				V(529) | V(533) | V(534) | V(535) | V(536) | V(540) | V(541) | V(542) | V(545) | V(546) | V(547) | V(549) | V(550) | V(551) | V(555) | V(558) | V(559),
				V(560) | V(561) | V(562) | V(565) | V(566) | V(567) | V(575) | V(576) | V(579) | V(580) | V(585) | V(587) | V(589),
				V(600) | V(602) | V(603)
			},
			{
				0,
				0,
				0,
				V(496),
				V(529) | V(549),
				0,
				0
			},
			{
				0,
				0,
				V(478),
				0,
				V(529) | V(549),
				0,
				0
			},
			{
				V(400) | V(401) | V(404) | V(410) | V(422),
				V(436) | V(439),
				V(478) | V(489),
				V(500) | V(505) | V(518),
				0,
				V(585) | V(589),
				V(600)
			},
			{
				V(405) | V(421),
				0,
				V(491),
				V(527),
				V(542),
				0,
				0
			},
			{
				0,
				0,
				0,
				V(516) | V(527),
				V(542),
				0,
				0
			},
			{
				V(404) | V(418) | V(421),
				0,
				V(489) | V(492),
				V(505) | V(516) | V(517),
				V(547) | V(551),
				V(589),
				0
			},
			{
				V(401) | V(404) | V(410) | V(415) | V(422),
				V(436) | V(439),
				V(477) | V(491),
				V(496) | V(516) | V(517) | V(518) | V(527),
				V(529) | V(540) | V(546) | V(549),
				V(580) | V(585) | V(589),
				V(600) | V(603)
			},
			{
				V(400) | V(405) | V(415) | V(421),
				0,
				V(477) | V(489) | V(491),
				V(505) | V(516) | V(517) | V(518) | V(527),
				V(529) | V(540) | V(542) | V(546) | V(547) | V(549) | V(550) | V(551),
				V(580) | V(585) | V(589),
				V(600) | V(603)
			},
			{
				V(400) | V(401) | V(404) | V(405) | V(410) | V(415) | V(420) | V(421) | V(422) | V(426),
				V(436),
				V(477) | V(489) | V(491),
				V(496) | V(500) | V(505) | V(516) | V(517),
				V(529) | V(540) | V(542) | V(546) | V(547) | V(549) | V(550) | V(551),
				V(585),
				V(603)
			},
			{
				V(400) | V(401) | V(404) | V(405) | V(410) | V(418) | V(421) | V(422),
				V(436),
				V(477) | V(478) | V(489) | V(491),
				V(496) | V(500) | V(505) | V(516) | V(517) | V(518) | V(527),
				V(529) | V(540) | V(542) | V(547) | V(549) | V(550) | V(551),
				V(580) | V(585) | V(589),
				V(600) | V(603)
			},
			{
				V(400) | V(404) | V(405) | V(410) | V(418) | V(420) | V(421) | V(422) | V(426),
				V(436),
				V(477) | V(478) | V(491),
				V(500) | V(516) | V(527),
				V(542) | V(547) | V(551),
				0,
				0
			},
			{
				0,
				V(436),
				V(478),
				0,
				0,
				0,
				V(600)
			},
			{
				V(405) | V(410) | V(415) | V(421),
				V(439),
				V(491),
				V(496) | V(517) | V(518),
				V(529) | V(540) | V(546) | V(549) | V(550) | V(551),
				V(580) | V(585),
				V(603)
			},
			{
				V(400) | V(410),
				0,
				V(478) | V(489),
				V(500) | V(505),
				V(540) | V(546),
				V(589),
				V(603)
			},
			{
				V(400) | V(401) | V(402) | V(404) | V(405) | V(409) | V(410) | V(411) | V(412) | V(415) | V(418) | V(419) | V(420) | V(421) | V(422) | V(424) | V(426),
				V(436) | V(438) | V(439) | V(442) | V(445) | V(451) | V(458),
				V(466) | V(467) | V(474) | V(475) | V(477) | V(478) | V(479) | V(480) | V(489) | V(491) | V(492),
				V(496) | V(500) | V(505) | V(506) | V(507) | V(516) | V(517) | V(518) | V(526) | V(527),
				V(529) | V(533) | V(534) | V(535) | V(536) | V(540) | V(541) | V(542) | V(545) | V(546) | V(547) | V(549) | V(550) | V(551) | V(555) | V(558) | V(559),
				V(560) | V(561) | V(562) | V(565) | V(566) | V(567) | V(575) | V(576) | V(579) | V(580) | V(585) | V(587) | V(589),
				V(600) | V(602) | V(603)
			},
			{
				0,
				0,
				0,
				0,
				0,
				V(560),
				0
			},
			{
				0,
				0,
				0,
				0,
				0,
				V(560),
				0
			},
			{
				0,
				0,
				0,
				0,
				0,
				V(560),
				0
			},
			{
				0,
				0,
				0,
				0,
				0,
				V(560),
				0
			},
			{
				0,
				0,
				0,
				0,
				0,
				V(560),
				0
			},
			{
				0,
				0,
				0,
				0,
				0,
				V(560),
				0
			},
			{
				0,
				0,
				0,
				0,
				0,
				V(560),
				0
			},
			{
				0,
				0,
				0,
				0,
				0,
				V(560),
				0
			},
			{
				0,
				0,
				0,
				0,
				0,
				V(562),
				0
			},
			{
				0,
				0,
				0,
				0,
				0,
				V(562),
				0
			},
			{
				0,
				0,
				0,
				0,
				0,
				V(562),
				0
			},
			// 1037 - Exhaust X-Flow - Elegy
			{
				0,
				0,
				0,
				0,
				0,
				V(562),
				0
			},
			// 1038 - Roof Alien Roof Vent - Elegy
			{
				0,
				0,
				0,
				0,
				0,
				V(562),
				0
			},
			// 1039 - SideSkirt Left X-Flow Sideskirt - Elegy
			{
				0,
				0,
				0,
				0,
				0,
				V(562),
				0
			},
			// 1040 - SideSkirt Left Alien Sideskirt - Elegy
			{
				0,
				0,
				0,
				0,
				0,
				V(562),
				0
			},
			// 1041 - SideSkirt Right X-Flow Sideskirt - Elegy
			{
				0,
				0,
				0,
				0,
				0,
				V(562),
				0
			},
			// 1042 - SideSkirt Right Chrome Sideskirt - Broadway
			{
				0,
				0,
				0,
				0,
				0,
				V(575),
				0
			},
			// 1043 - Exhaust Slamin - Broadway
			{
				V(401),
				V(439),
				V(491),
				V(496) | V(517) | V(518),
				V(540) | V(546) | V(547) | V(549) | V(550),
				V(585),
				V(603)
			},
			// 1044 - Exhaust Chrome - Broadway
			{
				0,
				0,
				0,
				0,
				0,
				V(575),
				0
			},
			// 1045 - Exhaust X-Flow - Flash
			{
				V(401),
				V(439),
				V(491),
				V(517) | V(518),
				V(540) | V(542) | V(546) | V(549) | V(550),
				V(585) | V(589),
				V(603)
			},
			// 1046 - Exhaust Alien - Flash
			{
				0,
				0,
				0,
				0,
				0,
				V(565),
				0
			},
			// 1047 - SideSkirt Right Alien Sideskirt - Flash
			{
				0,
				0,
				0,
				0,
				0,
				V(565),
				0
			},
			// 1048 - SideSkirt Right X-Flow Sideskirt - Flash
			{
				0,
				0,
				0,
				0,
				0,
				V(565),
				0
			},
			// 1049 - Spoiler Alien - Flash
			{
				0,
				0,
				0,
				0,
				0,
				V(565),
				0
			},
			// 1050 - Spoiler X-Flow - Flash
			{
				0,
				0,
				0,
				0,
				0,
				V(565),
				0
			},
			// 1051 - SideSkirt Left Alien Sideskirt - Flash
			{
				0,
				0,
				0,
				0,
				0,
				V(565),
				0
			},
			// 1052 - SideSkirt Left X-Flow Sideskirt - Flash
			{
				0,
				0,
				0,
				0,
				0,
				V(565),
				0
			},
			// 1053 - Roof X-Flow - Flash
			{
				0,
				0,
				0,
				0,
				0,
				V(565),
				0
			},
			// 1054 - Roof Alien - Flash
			{
				0,
				0,
				0,
				0,
				0,
				V(565),
				0
			},
			// 1055 - Roof Alien - Stratum
			{
				0,
				0,
				0,
				0,
				0,
				V(561),
				0
			},
			// 1056 - Sideskirt Right Alien Sideskirt - Stratum
			{
				0,
				0,
				0,
				0,
				0,
				V(561),
				0
			},
			// 1057 - Sideskirt Right X-Flow Sideskirt - Stratum
			{
				0,
				0,
				0,
				0,
				0,
				V(561),
				0
			},
			// 1058 - Spoiler Alien - Stratum
			{
				0,
				0,
				0,
				0,
				0,
				V(561),
				0
			},
			// 1059 - Exhaust X-Flow - Stratum
			{
				0,
				0,
				0,
				0,
				0,
				V(561),
				0
			},
			// 1060 - Spoiler X-Flow - Stratum
			{
				0,
				0,
				0,
				0,
				0,
				V(561),
				0
			},
			// 1061 - Roof X-Flow - Stratum
			{
				0,
				0,
				0,
				0,
				0,
				V(561),
				0
			},
			// 1062 - Sideskirt Left Alien Sideskirt - Stratum
			{
				0,
				0,
				0,
				0,
				0,
				V(561),
				0
			},
			// 1063 - Sideskirt Left X-Flow Sideskirt - Stratum
			{
				0,
				0,
				0,
				0,
				0,
				V(561),
				0
			},
			// 1064 - Exhaust Alien - Stratum
			{
				0,
				0,
				0,
				0,
				0,
				V(561),
				0
			},
			// 1065 - Exhaust Alien - Jester
			{
				0,
				0,
				0,
				0,
				V(559),
				0,
				0
			},
			// 1066 - Exhaust X-Flow - Jester
			{
				0,
				0,
				0,
				0,
				V(559),
				0,
				0
			},
			// 1067 - Roof Alien - Jester
			{
				0,
				0,
				0,
				0,
				V(559),
				0,
				0
			},
			// 1068 - Roof X-Flow - Jester
			{
				0,
				0,
				0,
				0,
				V(559),
				0,
				0
			},
			// 1069 - Sideskirt Right Alien Sideskirt - Jester
			{
				0,
				0,
				0,
				0,
				V(559),
				0,
				0
			},
			// 1070 - Sideskirt Right X-Flow Sideskirt - Jester
			{
				0,
				0,
				0,
				0,
				V(559),
				0,
				0
			},
			// 1071 - Sideskirt Left Alien Sideskirt - Jester
			{
				0,
				0,
				0,
				0,
				V(559),
				0,
				0
			},
			// 1072 - Sideskirt Left X-Flow Sideskirt - Jester
			{
				0,
				0,
				0,
				0,
				V(559),
				0,
				0
			},
			// 1073 - Wheels Shadow - Most cars
			{
				V(400) | V(401) | V(402) | V(404) | V(405) | V(409) | V(410) | V(411) | V(412) | V(415) | V(418) | V(419) | V(420) | V(421) | V(422) | V(424) | V(426),
				V(436) | V(438) | V(439) | V(442) | V(445) | V(451) | V(458),
				V(466) | V(467) | V(474) | V(475) | V(477) | V(478) | V(479) | V(480) | V(489) | V(491) | V(492),
				V(496) | V(500) | V(505) | V(506) | V(507) | V(516) | V(517) | V(518) | V(526) | V(527),
				V(529) | V(533) | V(534) | V(535) | V(536) | V(540) | V(541) | V(542) | V(545) | V(546) | V(547) | V(549) | V(550) | V(551) | V(555) | V(558) | V(559),
				V(560) | V(561) | V(562) | V(565) | V(566) | V(567) | V(575) | V(576) | V(579) | V(580) | V(585) | V(587) | V(589),
				V(600) | V(602) | V(603)
			},
			// 1074 - Wheels Mega - Most cars
			{
				V(400) | V(401) | V(402) | V(404) | V(405) | V(409) | V(410) | V(411) | V(412) | V(415) | V(418) | V(419) | V(420) | V(421) | V(422) | V(424) | V(426),
				V(436) | V(438) | V(439) | V(442) | V(445) | V(451) | V(458),
				V(466) | V(467) | V(474) | V(475) | V(477) | V(478) | V(479) | V(480) | V(489) | V(491) | V(492),
				V(496) | V(500) | V(505) | V(506) | V(507) | V(516) | V(517) | V(518) | V(526) | V(527),
				V(529) | V(533) | V(534) | V(535) | V(536) | V(540) | V(541) | V(542) | V(545) | V(546) | V(547) | V(549) | V(550) | V(551) | V(555) | V(558) | V(559),
				V(560) | V(561) | V(562) | V(565) | V(566) | V(567) | V(575) | V(576) | V(579) | V(580) | V(585) | V(587) | V(589),
				V(600) | V(602) | V(603)
			},
			// 1075 - Wheels Rimshine - Most cars
			{
				V(400) | V(401) | V(402) | V(404) | V(405) | V(409) | V(410) | V(411) | V(412) | V(415) | V(418) | V(419) | V(420) | V(421) | V(422) | V(424) | V(426),
				V(436) | V(438) | V(439) | V(442) | V(445) | V(451) | V(458),
				V(466) | V(467) | V(474) | V(475) | V(477) | V(478) | V(479) | V(480) | V(489) | V(491) | V(492),
				V(496) | V(500) | V(505) | V(506) | V(507) | V(516) | V(517) | V(518) | V(526) | V(527),
				V(529) | V(533) | V(534) | V(535) | V(536) | V(540) | V(541) | V(542) | V(545) | V(546) | V(547) | V(549) | V(550) | V(551) | V(555) | V(558) | V(559),
				V(560) | V(561) | V(562) | V(565) | V(566) | V(567) | V(575) | V(576) | V(579) | V(580) | V(585) | V(587) | V(589),
				V(600) | V(602) | V(603)
			},
			// 1076 - Wheels Wires - Most cars
			{
				V(400) | V(401) | V(402) | V(404) | V(405) | V(409) | V(410) | V(411) | V(412) | V(415) | V(418) | V(419) | V(420) | V(421) | V(422) | V(424) | V(426),
				V(436) | V(438) | V(439) | V(442) | V(445) | V(451) | V(458),
				V(466) | V(467) | V(474) | V(475) | V(477) | V(478) | V(479) | V(480) | V(489) | V(491) | V(492),
				V(496) | V(500) | V(505) | V(506) | V(507) | V(516) | V(517) | V(518) | V(526) | V(527),
				V(529) | V(533) | V(534) | V(535) | V(536) | V(540) | V(541) | V(542) | V(545) | V(546) | V(547) | V(549) | V(550) | V(551) | V(555) | V(558) | V(559),
				V(560) | V(561) | V(562) | V(565) | V(566) | V(567) | V(575) | V(576) | V(579) | V(580) | V(585) | V(587) | V(589),
				V(600) | V(602) | V(603)
			},
			// 1077 - Wheels Classic - Most cars
			{
				V(400) | V(401) | V(402) | V(404) | V(405) | V(409) | V(410) | V(411) | V(412) | V(415) | V(418) | V(419) | V(420) | V(421) | V(422) | V(424) | V(426),
				V(436) | V(438) | V(439) | V(442) | V(445) | V(451) | V(458),
				V(466) | V(467) | V(474) | V(475) | V(477) | V(478) | V(479) | V(480) | V(489) | V(491) | V(492),
				V(496) | V(500) | V(505) | V(506) | V(507) | V(516) | V(517) | V(518) | V(526) | V(527),
				V(529) | V(533) | V(534) | V(535) | V(536) | V(540) | V(541) | V(542) | V(545) | V(546) | V(547) | V(549) | V(550) | V(551) | V(555) | V(558) | V(559),
				V(560) | V(561) | V(562) | V(565) | V(566) | V(567) | V(575) | V(576) | V(579) | V(580) | V(585) | V(587) | V(589),
				V(600) | V(602) | V(603)
			},
			// 1078 - Wheels Twist - Most cars
			{
				V(400) | V(401) | V(402) | V(404) | V(405) | V(409) | V(410) | V(411) | V(412) | V(415) | V(418) | V(419) | V(420) | V(421) | V(422) | V(424) | V(426),
				V(436) | V(438) | V(439) | V(442) | V(445) | V(451) | V(458),
				V(466) | V(467) | V(474) | V(475) | V(477) | V(478) | V(479) | V(480) | V(489) | V(491) | V(492),
				V(496) | V(500) | V(505) | V(506) | V(507) | V(516) | V(517) | V(518) | V(526) | V(527),
				V(529) | V(533) | V(534) | V(535) | V(536) | V(540) | V(541) | V(542) | V(545) | V(546) | V(547) | V(549) | V(550) | V(551) | V(555) | V(558) | V(559),
				V(560) | V(561) | V(562) | V(565) | V(566) | V(567) | V(575) | V(576) | V(579) | V(580) | V(585) | V(587) | V(589),
				V(600) | V(602) | V(603)
			},
			// 1079 - Wheels Cutter - Most cars
			{
				V(400) | V(401) | V(402) | V(404) | V(405) | V(409) | V(410) | V(411) | V(412) | V(415) | V(418) | V(419) | V(420) | V(421) | V(422) | V(424) | V(426),
				V(436) | V(438) | V(439) | V(442) | V(445) | V(451) | V(458),
				V(466) | V(467) | V(474) | V(475) | V(477) | V(478) | V(479) | V(480) | V(489) | V(491) | V(492),
				V(496) | V(500) | V(505) | V(506) | V(507) | V(516) | V(517) | V(518) | V(526) | V(527),
				V(529) | V(533) | V(534) | V(535) | V(536) | V(540) | V(541) | V(542) | V(545) | V(546) | V(547) | V(549) | V(550) | V(551) | V(555) | V(558) | V(559),
				V(560) | V(561) | V(562) | V(565) | V(566) | V(567) | V(575) | V(576) | V(579) | V(580) | V(585) | V(587) | V(589),
				V(600) | V(602) | V(603)
			},
			// 1080 - Wheels Switch - Most cars
			{
				V(400) | V(401) | V(402) | V(404) | V(405) | V(409) | V(410) | V(411) | V(412) | V(415) | V(418) | V(419) | V(420) | V(421) | V(422) | V(424) | V(426),
				V(436) | V(438) | V(439) | V(442) | V(445) | V(451) | V(458),
				V(466) | V(467) | V(474) | V(475) | V(477) | V(478) | V(479) | V(480) | V(489) | V(491) | V(492),
				V(496) | V(500) | V(505) | V(506) | V(507) | V(516) | V(517) | V(518) | V(526) | V(527),
				V(529) | V(533) | V(534) | V(535) | V(536) | V(540) | V(541) | V(542) | V(545) | V(546) | V(547) | V(549) | V(550) | V(551) | V(555) | V(558) | V(559),
				V(560) | V(561) | V(562) | V(565) | V(566) | V(567) | V(575) | V(576) | V(579) | V(580) | V(585) | V(587) | V(589),
				V(600) | V(602) | V(603)
			},
			// 1081 - Wheels Grove - Most cars
			{
				V(400) | V(401) | V(402) | V(404) | V(405) | V(409) | V(410) | V(411) | V(412) | V(415) | V(418) | V(419) | V(420) | V(421) | V(422) | V(424) | V(426),
				V(436) | V(438) | V(439) | V(442) | V(445) | V(451) | V(458),
				V(466) | V(467) | V(474) | V(475) | V(477) | V(478) | V(479) | V(480) | V(489) | V(491) | V(492),
				V(496) | V(500) | V(505) | V(506) | V(507) | V(516) | V(517) | V(518) | V(526) | V(527),
				V(529) | V(533) | V(534) | V(535) | V(536) | V(540) | V(541) | V(542) | V(545) | V(546) | V(547) | V(549) | V(550) | V(551) | V(555) | V(558) | V(559),
				V(560) | V(561) | V(562) | V(565) | V(566) | V(567) | V(575) | V(576) | V(579) | V(580) | V(585) | V(587) | V(589),
				V(600) | V(602) | V(603)
			},
			// 1082 - Wheels Import - Most cars
			{
				V(400) | V(401) | V(402) | V(404) | V(405) | V(409) | V(410) | V(411) | V(412) | V(415) | V(418) | V(419) | V(420) | V(421) | V(422) | V(424) | V(426),
				V(436) | V(438) | V(439) | V(442) | V(445) | V(451) | V(458),
				V(466) | V(467) | V(474) | V(475) | V(477) | V(478) | V(479) | V(480) | V(489) | V(491) | V(492),
				V(496) | V(500) | V(505) | V(506) | V(507) | V(516) | V(517) | V(518) | V(526) | V(527),
				V(529) | V(533) | V(534) | V(535) | V(536) | V(540) | V(541) | V(542) | V(545) | V(546) | V(547) | V(549) | V(550) | V(551) | V(555) | V(558) | V(559),
				V(560) | V(561) | V(562) | V(565) | V(566) | V(567) | V(575) | V(576) | V(579) | V(580) | V(585) | V(587) | V(589),
				V(600) | V(602) | V(603)
			},
			// 1083 - Wheels Dollar - Most cars
			{
				V(400) | V(401) | V(402) | V(404) | V(405) | V(409) | V(410) | V(411) | V(412) | V(415) | V(418) | V(419) | V(420) | V(421) | V(422) | V(424) | V(426),
				V(436) | V(438) | V(439) | V(442) | V(445) | V(451) | V(458),
				V(466) | V(467) | V(474) | V(475) | V(477) | V(478) | V(479) | V(480) | V(489) | V(491) | V(492),
				V(496) | V(500) | V(505) | V(506) | V(507) | V(516) | V(517) | V(518) | V(526) | V(527),
				V(529) | V(533) | V(534) | V(535) | V(536) | V(540) | V(541) | V(542) | V(545) | V(546) | V(547) | V(549) | V(550) | V(551) | V(555) | V(558) | V(559),
				V(560) | V(561) | V(562) | V(565) | V(566) | V(567) | V(575) | V(576) | V(579) | V(580) | V(585) | V(587) | V(589),
				V(600) | V(602) | V(603)
			},
			// 1084 - Wheels Trance - Most cars
			{
				V(400) | V(401) | V(402) | V(404) | V(405) | V(409) | V(410) | V(411) | V(412) | V(415) | V(418) | V(419) | V(420) | V(421) | V(422) | V(424) | V(426),
				V(436) | V(438) | V(439) | V(442) | V(445) | V(451) | V(458),
				V(466) | V(467) | V(474) | V(475) | V(477) | V(478) | V(479) | V(480) | V(489) | V(491) | V(492),
				V(496) | V(500) | V(505) | V(506) | V(507) | V(516) | V(517) | V(518) | V(526) | V(527),
				V(529) | V(533) | V(534) | V(535) | V(536) | V(540) | V(541) | V(542) | V(545) | V(546) | V(547) | V(549) | V(550) | V(551) | V(555) | V(558) | V(559),
				V(560) | V(561) | V(562) | V(565) | V(566) | V(567) | V(575) | V(576) | V(579) | V(580) | V(585) | V(587) | V(589),
				V(600) | V(602) | V(603)
			},
			// 1085 - Wheels Atomic - Most cars
			{
				V(400) | V(401) | V(402) | V(404) | V(405) | V(409) | V(410) | V(411) | V(412) | V(415) | V(418) | V(419) | V(420) | V(421) | V(422) | V(424) | V(426),
				V(436) | V(438) | V(439) | V(442) | V(445) | V(451) | V(458),
				V(466) | V(467) | V(474) | V(475) | V(477) | V(478) | V(479) | V(480) | V(489) | V(491) | V(492),
				V(496) | V(500) | V(505) | V(506) | V(507) | V(516) | V(517) | V(518) | V(526) | V(527),
				V(529) | V(533) | V(534) | V(535) | V(536) | V(540) | V(541) | V(542) | V(545) | V(546) | V(547) | V(549) | V(550) | V(551) | V(555) | V(558) | V(559),
				V(560) | V(561) | V(562) | V(565) | V(566) | V(567) | V(575) | V(576) | V(579) | V(580) | V(585) | V(587) | V(589),
				V(600) | V(602) | V(603)
			},
			// 1086 - Stereo - Most cars
			{
				V(400) | V(401) | V(402) | V(404) | V(405) | V(409) | V(410) | V(411) | V(412) | V(415) | V(418) | V(419) | V(420) | V(421) | V(422) | V(424) | V(426),
				V(436) | V(438) | V(439) | V(442) | V(445) | V(451) | V(458),
				V(466) | V(467) | V(474) | V(475) | V(477) | V(478) | V(479) | V(480) | V(489) | V(491) | V(492),
				V(496) | V(500) | V(505) | V(506) | V(507) | V(516) | V(517) | V(518) | V(526) | V(527),
				V(529) | V(533) | V(534) | V(535) | V(536) | V(540) | V(541) | V(542) | V(545) | V(546) | V(547) | V(549) | V(550) | V(551) | V(555) | V(558) | V(559),
				V(560) | V(561) | V(562) | V(565) | V(566) | V(567) | V(575) | V(576) | V(579) | V(580) | V(585) | V(587) | V(589),
				V(600) | V(602) | V(603)
			},
			// 1087 - Hydraulics - Most cars
			{
				V(400) | V(401) | V(402) | V(404) | V(405) | V(409) | V(410) | V(411) | V(412) | V(415) | V(418) | V(419) | V(420) | V(421) | V(422) | V(424) | V(426),
				V(436) | V(438) | V(439) | V(442) | V(445) | V(451) | V(458),
				V(466) | V(467) | V(474) | V(475) | V(477) | V(478) | V(479) | V(480) | V(489) | V(491) | V(492),
				V(496) | V(500) | V(505) | V(506) | V(507) | V(516) | V(517) | V(518) | V(526) | V(527),
				V(529) | V(533) | V(534) | V(535) | V(536) | V(540) | V(541) | V(542) | V(545) | V(546) | V(547) | V(549) | V(550) | V(551) | V(555) | V(558) | V(559),
				V(560) | V(561) | V(562) | V(565) | V(566) | V(567) | V(575) | V(576) | V(579) | V(580) | V(585) | V(587) | V(589),
				V(600) | V(602) | V(603)
			},
			// 1088 - Roof Alien - Uranus
			{
				0,
				0,
				0,
				0,
				V(558),
				0,
				0
			},
			// 1089 - Exhaust X-Flow - Uranus
			{
				0,
				0,
				0,
				0,
				V(558),
				0,
				0
			},
			// 1090 - Sideskirt Right Alien Sideskirt - Uranus
			{
				0,
				0,
				0,
				0,
				V(558),
				0,
				0
			},
			// 1091 - Roof X-Flow - Uranus
			{
				0,
				0,
				0,
				0,
				V(558),
				0,
				0
			},
			// 1092 - Exhaust Alien - Uranus
			{
				0,
				0,
				0,
				0,
				V(558),
				0,
				0
			},
			// 1093 - Sideskirt Left X-Flow Sideskirt - Uranus
			{
				0,
				0,
				0,
				0,
				V(558),
				0,
				0
			},
			// 1094 - Sideskirt Left Alien Sideskirt - Uranus
			{
				0,
				0,
				0,
				0,
				V(558),
				0,
				0
			},
			// 1095 - Sideskirt Right X-Flow Sideskirt - Uranus
			{
				0,
				0,
				0,
				0,
				V(558),
				0,
				0
			},
			// 1096 - Wheels Ahab - Most cars
			{
				V(400) | V(401) | V(402) | V(404) | V(405) | V(409) | V(410) | V(411) | V(412) | V(415) | V(418) | V(419) | V(420) | V(421) | V(422) | V(424) | V(426),
				V(436) | V(438) | V(439) | V(442) | V(445) | V(451) | V(458),
				V(466) | V(467) | V(474) | V(475) | V(477) | V(478) | V(479) | V(480) | V(489) | V(491) | V(492),
				V(496) | V(500) | V(505) | V(506) | V(507) | V(516) | V(517) | V(518) | V(526) | V(527),
				V(529) | V(533) | V(534) | V(535) | V(536) | V(540) | V(541) | V(542) | V(545) | V(546) | V(547) | V(549) | V(550) | V(551) | V(555) | V(558) | V(559),
				V(560) | V(561) | V(562) | V(565) | V(566) | V(567) | V(575) | V(576) | V(579) | V(580) | V(585) | V(587) | V(589),
				V(600) | V(602) | V(603)
			},
			// 1097 - Wheels Virtual - Most cars
			{
				V(400) | V(401) | V(402) | V(404) | V(405) | V(409) | V(410) | V(411) | V(412) | V(415) | V(418) | V(419) | V(420) | V(421) | V(422) | V(424) | V(426),
				V(436) | V(438) | V(439) | V(442) | V(445) | V(451) | V(458),
				V(466) | V(467) | V(474) | V(475) | V(477) | V(478) | V(479) | V(480) | V(489) | V(491) | V(492),
				V(496) | V(500) | V(505) | V(506) | V(507) | V(516) | V(517) | V(518) | V(526) | V(527),
				V(529) | V(533) | V(534) | V(535) | V(536) | V(540) | V(541) | V(542) | V(545) | V(546) | V(547) | V(549) | V(550) | V(551) | V(555) | V(558) | V(559),
				V(560) | V(561) | V(562) | V(565) | V(566) | V(567) | V(575) | V(576) | V(579) | V(580) | V(585) | V(587) | V(589),
				V(600) | V(602) | V(603)
			},
			// 1098 - Wheels Access - Most cars
			{
				V(400) | V(401) | V(402) | V(404) | V(405) | V(409) | V(410) | V(411) | V(412) | V(415) | V(418) | V(419) | V(420) | V(421) | V(422) | V(424) | V(426),
				V(436) | V(438) | V(439) | V(442) | V(445) | V(451) | V(458),
				V(466) | V(467) | V(474) | V(475) | V(477) | V(478) | V(479) | V(480) | V(489) | V(491) | V(492),
				V(496) | V(500) | V(505) | V(506) | V(507) | V(516) | V(517) | V(518) | V(526) | V(527),
				V(529) | V(533) | V(534) | V(535) | V(536) | V(540) | V(541) | V(542) | V(545) | V(546) | V(547) | V(549) | V(550) | V(551) | V(555) | V(558) | V(559),
				V(560) | V(561) | V(562) | V(565) | V(566) | V(567) | V(575) | V(576) | V(579) | V(580) | V(585) | V(587) | V(589),
				V(600) | V(602) | V(603)
			},
			// 1099 - Sideskirt Left Chrome Sideskirt - Broadway
			{
				0,
				0,
				0,
				0,
				0,
				V(575),
				0
			},
			// 1100 - Bullbar Chrome Grill - Remington
			{
				0,
				0,
				0,
				0,
				V(534),
				0,
				0
			},
			// 1101 - Sideskirt Left `Chrome Flames` Sideskirt - Remington
			{
				0,
				0,
				0,
				0,
				V(534),
				0,
				0
			},
			// 1102 - Sideskirt Left `Chrome Strip` Sideskirt - Savanna
			{
				0,
				0,
				0,
				0,
				0,
				V(567),
				0
			},
			// 1103 - Roof Covertible - Blade
			{
				0,
				0,
				0,
				0,
				V(536),
				0,
				0
			},
			// 1104 - Exhaust Chrome - Blade
			{
				0,
				0,
				0,
				0,
				V(536),
				0,
				0
			},
			// 1105 - Exhaust Slamin - Blade
			{
				0,
				0,
				0,
				0,
				V(536),
				0,
				0
			},
			// 1106 - Sideskirt Right `Chrome Arches` - Remington
			{
				0,
				0,
				0,
				0,
				V(534),
				0,
				0
			},
			// 1107 - Sideskirt Left `Chrome Strip` Sideskirt - Blade
			{
				0,
				0,
				0,
				0,
				V(536),
				0,
				0
			},
			// 1108 - Sideskirt Right `Chrome Strip` Sideskirt - Blade
			{
				0,
				0,
				0,
				0,
				V(536),
				0,
				0
			},
			// 1109 - Rear Bullbars Chrome - Slamvan
			{
				0,
				0,
				0,
				0,
				V(535),
				0,
				0
			},
			// 1110 - Rear Bullbars Slamin - Slamvan
			{
				0,
				0,
				0,
				0,
				V(535),
				0,
				0
			},
			// 1111 - Front Sign? Little Sign? - Slamvan
			{
				0,
				0,
				0,
				0,
				V(535),
				0,
				0
			},
			// 1112 - Front Sign? Little Sign? - Slamvan
			{
				0,
				0,
				0,
				0,
				V(535),
				0,
				0
			},
			// 1113 - Exhaust Chrome - Slamvan
			{
				0,
				0,
				0,
				0,
				V(535),
				0,
				0
			},
			// 1114 - Exhaust Slamin - Slamvan
			{
				0,
				0,
				0,
				0,
				V(535),
				0,
				0
			},
			// 1115 - Front Bullbars Chrome - Slamvan
			{
				0,
				0,
				0,
				0,
				V(535),
				0,
				0
			},
			// 1116 - Front Bullbars Slamin - Slamvan
			{
				0,
				0,
				0,
				0,
				V(535),
				0,
				0
			},
			// 1117 - Front Bumper Chrome - Slamvan
			{
				0,
				0,
				0,
				0,
				V(535),
				0,
				0
			},
			// 1118 - Sideskirt Right `Chrome Trim` Sideskirt - Slamvan
			{
				0,
				0,
				0,
				0,
				V(535),
				0,
				0
			},
			// 1119 - Sideskirt Right `Wheelcovers` Sideskirt - Slamvan
			{
				0,
				0,
				0,
				0,
				V(535),
				0,
				0
			},
			// 1120 - Sideskirt Left `Chrome Trim` Sideskirt - Slamvan
			{
				0,
				0,
				0,
				0,
				V(535),
				0,
				0
			},
			// 1121 - Sideskirt Left `Wheelcovers` Sideskirt - Slamvan
			{
				0,
				0,
				0,
				0,
				V(535),
				0,
				0
			},
			// 1122 - Sideskirt Right `Chrome Flames` Sideskirt - Remington
			{
				0,
				0,
				0,
				0,
				V(534),
				0,
				0
			},
			// 1123 - Bullbars Bullbar Chrome Bars - Remington
			{
				0,
				0,
				0,
				0,
				V(534),
				0,
				0
			},
			// 1124 - Sideskirt Left `Chrome Arches` Sideskirt - Remington
			{
				0,
				0,
				0,
				0,
				V(534),
				0,
				0
			},
			// 1125 - Bullbars Bullbar Chrome Lights - Remington
			{
				0,
				0,
				0,
				0,
				V(534),
				0,
				0
			},
			// 1126 - Exhaust Chrome Exhaust - Remington
			{
				0,
				0,
				0,
				0,
				V(534),
				0,
				0
			},
			// 1127 - Exhaust Slamin Exhaust - Remington
			{
				0,
				0,
				0,
				0,
				V(534),
				0,
				0
			},
			// 1128 - Roof Vinyl Hardtop - Blade
			{
				0,
				0,
				0,
				0,
				V(536),
				0,
				0
			},
			// 1129 - Exhaust Chrome - Savanna
			{
				0,
				0,
				0,
				0,
				0,
				V(567),
				0
			},
			// 1130 - Roof Hardtop - Savanna
			{
				0,
				0,
				0,
				0,
				0,
				V(567),
				0
			},
			// 1131 - Roof Softtop - Savanna
			{
				0,
				0,
				0,
				0,
				0,
				V(567),
				0
			},
			// 1132 - Exhaust Slamin - Savanna
			{
				0,
				0,
				0,
				0,
				0,
				V(567),
				0
			},
			// 1133 - Sideskirt Right `Chrome Strip` Sideskirt - Savanna
			{
				0,
				0,
				0,
				0,
				0,
				V(567),
				0
			},
			// 1134 - SideSkirt Right `Chrome Strip` Sideskirt - Tornado
			{
				0,
				0,
				0,
				0,
				0,
				V(576),
				0
			},
			// 1135 - Exhaust Slamin - Tornado
			{
				0,
				0,
				0,
				0,
				0,
				V(576),
				0
			},
			// 1136 - Exhaust Chrome - Tornado
			{
				0,
				0,
				0,
				0,
				0,
				V(576),
				0
			},
			// 1137 - Sideskirt Left `Chrome Strip` Sideskirt - Tornado
			{
				0,
				0,
				0,
				0,
				0,
				V(576),
				0
			},
			// 1138 - Spoiler Alien - Sultan
			{
				0,
				0,
				0,
				0,
				0,
				V(560),
				0
			},
			// 1139 - Spoiler X-Flow - Sultan
			{
				0,
				0,
				0,
				0,
				0,
				V(560),
				0
			},
			// 1140 - Rear Bumper X-Flow - Sultan
			{
				0,
				0,
				0,
				0,
				0,
				V(560),
				0
			},
			// 1141 - Rear Bumper Alien - Sultan
			{
				0,
				0,
				0,
				0,
				0,
				V(560),
				0
			},
			// 1142 - Vents Left Oval Vents - Certain Transfender Cars
			{
				V(401),
				V(439),
				V(491),
				V(496) | V(517) | V(518),
				V(540) | V(547) | V(549) | V(550),
				V(585),
				V(603)
			},
			// 1143 - Vents Right Oval Vents - Certain Transfender Cars
			{
				V(401),
				V(439),
				V(491),
				V(496) | V(517) | V(518),
				V(540) | V(547) | V(549) | V(550),
				V(585),
				V(603)
			},
			// 1144 - Vents Left Square Vents - Certain Transfender Cars
			{
				V(401),
				V(439),
				V(491),
				V(517) | V(518),
				V(540) | V(542) | V(549) | V(550),
				V(585) | V(589),
				V(603)
			},
			// 1145 - Vents Right Square Vents - Certain Transfender Cars
			{
				V(401),
				V(439),
				V(491),
				V(517) | V(518),
				V(540) | V(542) | V(549) | V(550),
				V(585) | V(589),
				V(603)
			},
			// 1146 - Spoiler X-Flow - Elegy
			{
				0,
				0,
				0,
				0,
				0,
				V(562),
				0
			},
			// 1147 - Spoiler Alien - Elegy
			{
				0,
				0,
				0,
				0,
				0,
				V(562),
				0
			},
			// 1148 - Rear Bumper X-Flow - Elegy
			{
				0,
				0,
				0,
				0,
				0,
				V(562),
				0
			},
			// 1149 - Rear Bumper Alien - Elegy
			{
				0,
				0,
				0,
				0,
				0,
				V(562),
				0
			},
			// 1150 - Rear Bumper Alien - Flash
			{
				0,
				0,
				0,
				0,
				0,
				V(565),
				0
			},
			// 1151 - Rear Bumper X-Flow - Flash
			{
				0,
				0,
				0,
				0,
				0,
				V(565),
				0
			},
			// 1152 - Front Bumper X-Flow - Flash
			{
				0,
				0,
				0,
				0,
				0,
				V(565),
				0
			},
			// 1153 - Front Bumper Alien - Flash
			{
				0,
				0,
				0,
				0,
				0,
				V(565),
				0
			},
			// 1154 - Rear Bumper Alien - Stratum
			{
				0,
				0,
				0,
				0,
				0,
				V(561),
				0
			},
			// 1155 - Front Bumper Alien - Stratum
			{
				0,
				0,
				0,
				0,
				0,
				V(561),
				0
			},
			// 1156 - Rear Bumper X-Flow - Stratum
			{
				0,
				0,
				0,
				0,
				0,
				V(561),
				0
			},
			// 1157 - Front Bumper X-Flow - Stratum
			{
				0,
				0,
				0,
				0,
				0,
				V(561),
				0
			},
			// 1158 - Spoiler X-Flow - Jester
			{
				0,
				0,
				0,
				0,
				V(559),
				0,
				0
			},
			// 1159 - Rear Bumper Alien - Jester
			{
				0,
				0,
				0,
				0,
				V(559),
				0,
				0
			},
			// 1160 - Front Bumper Alien - Jester
			{
				0,
				0,
				0,
				0,
				V(559),
				0,
				0
			},
			// 1161 - Rear Bumper X-Flow - Jester
			{
				0,
				0,
				0,
				0,
				V(559),
				0,
				0
			},
			// 1162 - Spoiler Alien - Jester
			{
				0,
				0,
				0,
				0,
				V(559),
				0,
				0
			},
			// 1163 - Spoiler X-Flow - Uranus
			{
				0,
				0,
				0,
				0,
				V(558),
				0,
				0
			},
			// 1164 - Spoiler Alien - Uranus
			{
				0,
				0,
				0,
				0,
				V(558),
				0,
				0
			},
			// 1165 - Front Bumper X-Flow - Uranus
			{
				0,
				0,
				0,
				0,
				V(558),
				0,
				0
			},
			// 1166 - Front Bumper Alien - Uranus
			{
				0,
				0,
				0,
				0,
				V(558),
				0,
				0
			},
			// 1167 - Rear Bumper X-Flow - Uranus
			{
				0,
				0,
				0,
				0,
				V(558),
				0,
				0
			},
			// 1168 - Rear Bumper Alien - Uranus
			{
				0,
				0,
				0,
				0,
				V(558),
				0,
				0
			},
			// 1169 - Front Bumper Alien - Sultan
			{
				0,
				0,
				0,
				0,
				0,
				V(560),
				0
			},
			// 1170 - Front Bumper X-Flow - Sultan
			{
				0,
				0,
				0,
				0,
				0,
				V(560),
				0
			},
			// 1171 - Front Bumper Alien - Elegy
			{
				0,
				0,
				0,
				0,
				0,
				V(562),
				0
			},
			// 1172 - Front Bumper X-Flow - Elegy
			{
				0,
				0,
				0,
				0,
				0,
				V(562),
				0
			},
			// 1173 - Front Bumper X-Flow - Jester
			{
				0,
				0,
				0,
				0,
				V(559),
				0,
				0
			},
			// 1174 - Front Bumper Chrome - Broadway
			{
				0,
				0,
				0,
				0,
				0,
				V(575),
				0
			},
			// 1175 - Rear Bumper Slamin - Broadway
			{
				0,
				0,
				0,
				0,
				0,
				V(575),
				0
			},
			// 1176 - Front Bumper Chrome - Broadway
			{
				0,
				0,
				0,
				0,
				0,
				V(575),
				0
			},
			// 1177 - Rear Bumper Slamin - Broadway
			{
				0,
				0,
				0,
				0,
				0,
				V(575),
				0
			},
			// 1178 - Rear Bumper Slamin - Remington
			{
				0,
				0,
				0,
				0,
				V(534),
				0,
				0
			},
			// 1179 - Front Bumper Chrome - Remington
			{
				0,
				0,
				0,
				0,
				V(534),
				0,
				0
			},
			// 1180 - Rear Bumper Chrome - Remington
			{
				0,
				0,
				0,
				0,
				V(534),
				0,
				0
			},
			// 1181 - Front Bumper Slamin - Blade
			{
				0,
				0,
				0,
				0,
				V(536),
				0,
				0
			},
			// 1182 - Front Bumper Chrome - Blade
			{
				0,
				0,
				0,
				0,
				V(536),
				0,
				0
			},
			// 1183 - Rear Bumper Slamin - Blade
			{
				0,
				0,
				0,
				0,
				V(536),
				0,
				0
			},
			// 1184 - Rear Bumper Chrome - Blade
			{
				0,
				0,
				0,
				0,
				V(536),
				0,
				0
			},
			// 1185 - Front Bumper Slamin - Remington
			{
				0,
				0,
				0,
				0,
				V(534),
				0,
				0
			},
			// 1186 - Rear Bumper Slamin - Savanna
			{
				0,
				0,
				0,
				0,
				0,
				V(567),
				0
			},
			// 1187 - Rear Bumper Chrome - Savanna
			{
				0,
				0,
				0,
				0,
				0,
				V(567),
				0
			},
			// 1188 - Front Bumper Slamin - Savanna
			{
				0,
				0,
				0,
				0,
				0,
				V(567),
				0
			},
			// 1189 - Front Bumper Chrome - Savanna
			{
				0,
				0,
				0,
				0,
				0,
				V(567),
				0
			},
			// 1190 - Front Bumper Slamin - Tornado
			{
				0,
				0,
				0,
				0,
				0,
				V(576),
				0
			},
			// 1191 - Front Bumper Chrome - Tornado
			{
				0,
				0,
				0,
				0,
				0,
				V(576),
				0
			},
			// 1192 - Rear Bumper Chrome - Tornado
			{
				0,
				0,
				0,
				0,
				0,
				V(576),
				0
			},
			// 1193 - Rear Bumper Slamin - Tornado
			{
				0,
				0,
				0,
				0,
				0,
				V(576),
				0
			}
		};
	// Check if the componentid is in range
	if (1000 <= componentid <= 1193)
	{
		new
			model = GetVehicleModel(vehicleid);
		// Check the model is in range
		// We are dealing with cheaters after all
		if (400 <= model <= 603)
		{
			model -= 400;
			return cs_bMods[componentid - 1000][model >> 5] & (1 << (model & 0x1F));
		}
	}
	return 0;
}
function(StartMission(playerid))
{
    if(Pack[playerid] == 3) return SendClientMessage(playerid, RED, ".אי אפשר לבצע את המשימה מעל 3 פעמים"),0;
	for(new i; i <= MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        if(InMission[i] == 1)
	        {
		        SendClientMessage(playerid, RED, ".אתה לא יכול לעשות את המשימה כי מישהו אחר עושה אותה, שהוא יסיים תחזור לפה");
		        break;
			}
		}
	}
    SendFormatMsg(-1,0xFF66FFAA,"!התחיל במשימת הכסף של משפחות הפשע ,%s",GetName(playerid));
    SendClientMessageToAll(0xFF66FFAA, "!יש לכם 5 דקות לעצור בעדו, מי שיעצור בעדו, יזכה בפרס של 3000$, קדימה");
    SendClientMessage(playerid, 0xFFFF33AA, ",יש לך 5 דקות לבצע את המשימה, כל עוד אתה נמצא במשימה, אתה לא יכול להשתגר");
    SendClientMessage(playerid, 0xFFFF33AA, ".המיקום שאתה צריך להעביר אליו את הכסף - תחנת הרכבת הנטושה, נמצא ליד מוסך וואנג");
	SendClientMessage(playerid, 0xFFFF33AA, "/QuitMission - על מנת לפרוש מהמשימה");
    CutMissionTimer[playerid] = SetTimerEx("CutMission", 1000*60*5, 1, "i", playerid);
    InMission[playerid] = 1; DidMission[playerid] = 1;
    Pack[playerid]++;
    DestroyPickup(pickupMission);
	return 1;
}
function(WonMission(playerid))
{
	new moneysg = random(5000)+1000, string[128];
    SendFormatMsg(-1,0xFF66FFAA,"!הצליח/ה להעביר את שק הכסף של משפחות הפשע, רמת המבוקשות שלו עלתה ב 2, נסו לתפוס אותו ,%s",GetName(playerid));
    format(string, sizeof string,".%d$ - קיבלת סכום כסף של כ",moneysg);
    SendClientMessage(playerid,0x0F482FF,string);
	KillTimer(CutMissionTimer[playerid]);
    GivePlayerCash(playerid,moneysg);
    InMission[playerid] = 0; DidMission[playerid] = 0;
	Pack[playerid] ++;
	pickupMission = CreatePickup(1550, 2, -2667.5696,732.9576,27.9531);
	GameTextForPlayer(playerid, "~g~Mission Complete~n~ + 1 Repect!", 5000, 6);
	_SetPlayerWantedLevel(playerid, GetPlayerWantedLevel(playerid) + 2);
	dini_IntSet(GetPlayerFile(playerid),"Missions", dini_Int(GetPlayerFile(playerid),"Missions")+1);
	return 1;
}
function(CutMission(playerid))
{
    SendFormatMsg(-1,YELLOW,"...נכשל במשימת הכסף של משפחות הפשע, המשימה התפנתה ,%s",GetName(playerid));
	SendClientMessage(playerid, 0x0F482FF, Pack[playerid] < 3? (".נכשלת במשימת הכסף של משפחות הפשע, אתה רשאי לנסות שנית") : (".נכשלת במשימת הכסף של משפחות הפשע, ביצעת את המשימה כבר 3 פעמים, אינך רשאי לנסות שנית") );
    InMission[playerid] = 0; KillTimer(CutMissionTimer[playerid]);
	pickupMission = CreatePickup(1550, 2, -2667.5696,732.9576,27.9531);
	GameTextForPlayer(playerid,"~r~Mission Failed", 5000, 6);
	return 1;
}
function(SendFormatMsg(playerid,color,str[],define[]))
{
	new str2[256];
	format(str2,256,str,define);
	return playerid == -1? SendClientMessageToAll(color, str2) : SendClientMessage(playerid, color, str2);
}
function(gateMove())
{
   if(IsAnyoneNearGate()) MoveDynamicObject(gateb,2146.19,1627.1,994.257,1.5); else MoveDynamicObject(gateb,2144.19,1627.1,994.257,1.5);
   return 1;
}
function(IsAnyoneNearGate())
{
  new i;
  for(i = 0; i <= MAX_PLAYERS; i++) if(IsPlayerConnected(i) && PlayerToPoint(5.0,i,2144.19000,1627.10000,994.25700)) return 1;
  return 0;
}
function(HangupCall(playerid, id))
{
  caller[id] = 0;
  callto[id]= -1;
  caller[playerid] = 0;
  callto[playerid] = -1;
  callid[id] = -1;
  callid[playerid] = -1;
  SendClientMessage(playerid,RED,".השיחה נותקה");
  SendClientMessage(id,RED,".השיחה נותקה");
  SendTextDrawMessage2(id , "~r~The Call Was Hangup!", 3);
  SendTextDrawMessage2(playerid , "~r~The Call Was Hangup!", 3);
  KillTimer(MoneyCall[callid[playerid]]);
  KillTimer(MoneyCall[playerid]);
}
function(getMoney(playerid))
{
  if(GetPlayerMoney(playerid) > 0 && caller[playerid] == 1) GivePlayerCash(playerid, -1);
  if(IsPlayerConnected(playerid) && GetPlayerMoney(playerid) < 1)
  {
    if(caller[playerid] == 1)
    {
      new id = callto[playerid];
      SendClientMessage(playerid, RED,".השיחה נותקה בגלל חוסר כסף");
      SendClientMessage(callto[playerid], RED,".השיחה נותקה בגלל חוסר כסף");
      SendTextDrawMessage2(callto[playerid] , "~r~The Call Was Hangup!", 3);
	  SendTextDrawMessage2(playerid , "~r~The Call Was Hangup!", 3);
      caller[playerid] = 0;
      callto[playerid] = -1;
	  callid[playerid] = -1;
	  callid[id] = -1;
	  caller[id] = 0;
	  callto[id]= -1;
	  KillTimer(MoneyCall[playerid]);
    }
  }
  return 1;
}
function(beginSpec(playerid, id))
{
   new Float:now[MAX_PLAYERS][3];
   GetPlayerPos(playerid, now[playerid][0], now[playerid][1], now[playerid][2]);
   if(now[playerid][0] != backpos[playerid][0] || now[playerid][1] != backpos[playerid][1] || now[playerid][2] != backpos[playerid][2]) return SendClientMessage(playerid,RED,".אסור לך לזוז מהמקום בזמן שאתה מבצע פעולה זו, הפעולה בוטלה נסה שנית"), Specid[playerid] = -1;
   if(!IsPlayerConnected(id))
   {
     SendClientMessage(playerid,RED,".שחקן זה התנתק במהלך נסה שחקן אחר");
     Specid[playerid] = -1;
     return 1;
   }
   SetPlayerInterior(playerid, GetPlayerInterior(id));
   TogglePlayerSpectating(playerid,1);
   PlayerSpectatePlayer(playerid, id);
   SendClientMessage(playerid,ORANGE,"/spec :הפעולה בוצעה בהצלחה! על מנת להפסיק מצב זה");
   beginspec[playerid] = 1;
   return 1;
}
DropWeapons(playerid)
{
	new Float: px, Float: py, Float: pz;
	new hour,minute,second;
	new year, month,day;
	gettime(hour, minute, second);
	getdate(year, month, day);
	GetPlayerPos( playerid, px, py, pz );
	new weapon_slots[WEAPON_SLOTS + 1][2];
	new used_weapon_slots;
	for( new i = 0; i < WEAPON_SLOTS; i ++ )
	{
		GetPlayerWeaponData( playerid, i, weapon_slots[i][0], weapon_slots[i][1]);
		if( i == 0 && weapon_slots[i][0] == 0 ) weapon_slots[i][1] = 0; // no fist...

		if( weapon_slots[i][1] > 0 && weapon_slots[i][0] < sizeof weapons && weapons[ weapon_slots[i][0] ] != -1 ) used_weapon_slots ++;
		else
		{
		    weapon_slots[i][0] = 0;
		    weapon_slots[i][1] = 0;
		}
	}
	// Create the pickups
	new used_weapon_slots2 = used_weapon_slots;
	for( new i = 0; i < WEAPON_SLOTS; i ++ )
	{
	    if( weapon_slots[i][1] > 0 )
	    {
			new Float:angle = 360.0 - float(used_weapon_slots--) * ( 360.0 / float(used_weapon_slots2) );
			// see... if there's a pickup we create by any chance
			new p = CreatePickup( weapons[ weapon_slots[i][0] ], PICKUP_TYPE, px + floatsin(angle,degrees) * (used_weapon_slots2/2 + 1.0), py + floatcos(angle,degrees) * (used_weapon_slots2/2 + 1.0), pz );
			if( p == INVALID_PICKUP )
			{
				new lowest_time;
				new _id;
				for( new j = 0; j < 90; j ++ )
				{
					if( pickups[ j ][ creation_time ] < lowest_time )
					{
					    lowest_time = pickups[ j ][ creation_time ];
					    _id = j;
					}
				}

				DestroyPickupEx( _id );
				KillTimer( pickups[ _id ][ timer ] );

				p = CreatePickup( weapons[ weapon_slots[i][0] ], PICKUP_TYPE, px + floatsin(angle,degrees) * (used_weapon_slots2/2 + 1.0), py + floatcos(angle,degrees) * (used_weapon_slots2/2 + 1.0), pz );
			}
			pickups[p][ creation_time ] = mktime(hour,minute,second,day,month,year);
			pickups[p][ weapon ] = weapon_slots[i][0];
			pickups[p][ ammo ] = weapon_slots[i][1];
			#if MAX_DROP_AMOUNT != -1
		    if( pickups[p][ ammo ] > MAX_DROP_AMOUNT )
		    {
		        pickups[p][ ammo ] = MAX_DROP_AMOUNT;
		    }
		    #endif
			pickups[p][ timer ] = SetTimerEx("DestroyPickupEx", MAX_DROP_LIFETIME * 1000, 0, "i", p);
		}
	}
}
function(DestroyPickupEx(p))
{
	DestroyPickup(p);
	pickups[p][ creation_time ] = 0;
	pickups[p][ weapon ] = 0;
	pickups[p][ ammo ] = 0;
}
function(BBShow())
{
  new string[128];
  for(new i = 0; i <= MAX_PLAYERS; i++) PlayerPlaySound(i,1058, 0.0, 0.0, 0.0);
  if(count_bb == 0)
  {
      TextDrawTextSize(TDraw[5],225,300);
      format(string,sizeof string,"Visit: ~g~GTA~W~.~r~SA-MP~w~.co.il~n~~w~Players: %d/%d~N~TYPE: Gang Wars", getOnlinePlayers(), GetMaxPlayers());
      TextDrawSetColor(TDraw[10], GREEN);
  }
  if(count_bb == 1)
  {
      TextDrawTextSize(TDraw[5],280,300);
      format(string,sizeof string,"~r~SA-MP ~b~Gang ~y~Wars~n~~w~Need Help? /Help~n~Suspect a Cheater? /Report");
      TextDrawSetColor(TDraw[10], RED);
  }
  if(count_bb == 2)
  {
      TextDrawTextSize(TDraw[5],280,300);
      format(string,sizeof string,"Support:~n~~g~GTA~W~.~r~SA-MP~w~.co.il~n~/Admins - Admins List~n~/Help - Help List~n~/Report - Report On Cheater.");
      TextDrawSetColor(TDraw[10], ORANGE);
  }
  if(count_bb == 3)
  {
      TextDrawTextSize(TDraw[5],280,300);
      format(string,sizeof string,"Register At: ~g~GTA~W~.~r~SA-MP~w~.co.il~n~Scripter: JoeShk~n~Version: 0.1~n~SAMP 0.2X");
      TextDrawSetColor(TDraw[10], GOLD);
  }
  if(count_bb == 4)
  {
      TextDrawTextSize(TDraw[5],320,300);
      format(string,sizeof string,"Welcome To SA-MP Team DeathMatch.~n~~y~/Help /Mode /Admins /Commands /Report~n~~W~Thanks SA-MP Staff.");
      TextDrawSetColor(TDraw[10], WHOERS_COLOR);
  }
  if(count_bb == 5)
  {
      TextDrawTextSize(TDraw[5],280,300);
      format(string,sizeof string,"SA-MP Staff Development:~n~Want to join? ~n~Go to: ~g~GTA~W~.~r~SA-MP~w~.co.il");
      TextDrawSetColor(TDraw[10], GANG_C4);
  }
  if(count_bb == 6)
  {
      TextDrawTextSize(TDraw[5],280,300);
      format(string,sizeof string,"Currently Version: 0.1~n~Next Version: 0.0.2~n~Thanks SA-MP Staff.");
      TextDrawSetColor(TDraw[10], SEA);
  }
  if(count_bb == 7)
  {
      TextDrawTextSize(TDraw[5],280,300);
      format(string,sizeof string,"Main City: San Fierro~n~TYPE: TDM~n~Updates: 1~n~Last Update: 22/8/2009");
  }
  if(count_bb == 8)
  {
      TextDrawTextSize(TDraw[5],320,300);
      format(string,sizeof string,"Need More Weapons?~n~ Go to Ammunition Shop~n~/Ammu - Camera~n~Thanks, SA-MP Staff.");
      TextDrawSetColor(TDraw[10], YELLOW);
  }
  if(count_bb == 9)
  {
      TextDrawTextSize(TDraw[5],320,300);
      format(string,sizeof string,"Need a Bomb?~n~ Go to The Secret Bomb Shop~n~Grope Same~n~Thanks, SA-MP Staff.");
      TextDrawSetColor(TDraw[10], COLOR_STUNTS_GANG);
  }
  if(count_bb == 10)
  {
      TextDrawTextSize(TDraw[5],320,300);
      format(string,sizeof string,"Need to save You're Money?~n~ Go to The Bank~n~/Bank~n~Thanks, SA-MP Staff.");
      TextDrawSetColor(TDraw[10], F_COLOR);
  }
  if(count_bb == 11)
  {
      TextDrawTextSize(TDraw[5],280,300);
      format(string,sizeof string,"Ventrilo IP: 80.179.153.12~N~Ventrilo Port: 10976~n~Ventrilo Version: 0.3");
      TextDrawSetColor(TDraw[10], 0x00FFFFAA);
  }
  count_bb++;
  if(count_bb > 11) count_bb = 0;
  SendTextDrawMessageToAll2(string, 10);
  return 1;
}
function(getOnlinePlayers())
{
   new i, count;
   for(i = 0; i <= MAX_PLAYERS; i++) if(IsPlayerConnected(i)) count++;
   return count;
}
function(SendTextDrawMessage(playerid,string[], time))
{
	   TextDrawHideForPlayer(playerid,TInfo[playerid]);
	   TextDrawSetString(TInfo[playerid], string);
	   TextDrawShowForPlayer(playerid,TInfo[playerid]);
	   SetTimerEx("HideStats", time*1000, 0, "i", playerid);
	   return 1;
}
function(SendTextDrawMessageToAll(ccolor, string[], time))
{
       TextDrawColor(TDraw[3], ccolor);
	   TextDrawHideForAll(TDraw[3]);
	   TextDrawSetString(TDraw[3], string);
	   TextDrawShowForAll(TDraw[3]);
	   SetTimer("HideAll", time*1000, 0);
	   return 1;
}
function(HideAll()) return TextDrawHideForAll(TDraw[3]);
function(SendTextDrawMessageToAll2(string[], time))
{
	   TextDrawHideForAll(TDraw[5]);
	   TextDrawSetString(TDraw[5], string);
	   TextDrawShowForAll(TDraw[5]);
	   SetTimer("HideAll2", time*1000, 0);
	   return 1;
}
function(HideAll2()) return TextDrawHideForAll(TDraw[5]);
function(SendTextDrawMessageConnect(ccolor, string[], time))
{
	   TextDrawColor(TDraw[4], ccolor);
	   TextDrawHideForAll(TDraw[4]);
	   TextDrawSetString(TDraw[4], string);
	   TextDrawShowForAll(TDraw[4]);
	   SetTimer("HideConnect", time*1000, 0);
	   return 1;
}
function(HideConnect()) return TextDrawHideForAll(TDraw[4]);
function(SendTextDrawMessage2(playerid,string[], time))
{
	   TextDrawHideForPlayer(playerid,TInfo2[playerid]);
	   TextDrawSetString(TInfo2[playerid], string);
	   TextDrawShowForPlayer(playerid,TInfo2[playerid]);
	   SetTimerEx("HideStats2", time*1000, 0, "i", playerid);
	   return 1;
}
function(HideStats(playerid)) return TextDrawHideForPlayer(playerid,TInfo[playerid]);
function(HideStats2(playerid)) return TextDrawHideForPlayer(playerid,TInfo2[playerid]);
function(AntiDeAMX())
{
	new a[][] = { "Unarmed (Fist)", "Brass K" };
	#pragma unused a
}
function(TextDrawSetColor(Text:text, COLOR))
{
      TextDrawColor(text,COLOR);
	  TextDrawHideForAll(text);
	  TextDrawShowForAll(text);
	  return 1;
}
function(Text:CreateStarTD(starnum))
{
    TStar[starnum] = TextDrawCreate(503.5-(18*(starnum-7)), 102.1, "]" );
	TextDrawColor          (TStar[starnum], 0x906210FF);
	TextDrawBackgroundColor(TStar[starnum], 0x000000AA);
	TextDrawFont           (TStar[starnum],          2);
	TextDrawSetShadow      (TStar[starnum],          0);
	TextDrawSetProportional(TStar[starnum],       true);
	TextDrawLetterSize     (TStar[starnum],  0.6,  2.4);
	TextDrawAlignment      (TStar[starnum],          3);
	TextDrawSetOutline     (TStar[starnum],          1);
	return TStar[starnum];
}
function(DoInit())
{
	if (gme) DoInit();
	gme = false;
	for (new playerid = 0; playerid < MAX_PLAYERS; playerid++ ) _SetPlayerWantedLevel(playerid, 0);
	TStar[7]  = CreateStarTD(7);
	TStar[8]  = CreateStarTD(8);
	TStar[9]  = CreateStarTD(9);
	TStar[10] = CreateStarTD(10);
	TStar[11] = CreateStarTD(11);
	TStar[12] = CreateStarTD(12);
	TStar[13] = CreateStarTD(13);
	TStar[14] = CreateStarTD(14);
	TStar[15] = CreateStarTD(15);
	TStar[16] = CreateStarTD(16);
	TStar[17] = CreateStarTD(17);
	TStar[18] = CreateStarTD(18);
	TStar[19] = CreateStarTD(19);
	TStar[20] = CreateStarTD(20);
	TStar[21] = CreateStarTD(21);
	TStar[22] = CreateStarTD(22);
	TStar[23] = CreateStarTD(23);
	TStar[24] = CreateStarTD(24);
	TStar[25] = CreateStarTD(25);
}
stock _SetPlayerWantedLevel(playerid, wid)
{
	if(wid != 0 && wid > 7) TextDrawShowForPlayer(playerid, TStar[wid]);
	else for(new i = 7; i < 26; i++) TextDrawHideForPlayer(playerid, TStar[i]);
	SetPlayerWantedLevel(playerid, wid);
	return 1;
}
function(BombTrackTime(playerid))
{
   new string[128];
   if(!MissionTrack[playerid]) return 0;
   if(PlayerToPoint(8.0, playerid,  -2659.1458,1410.2831,910.1703) && StateMission[playerid] == 2 && MissionTrack[playerid])
   {
   	    new rand = random(4000)+3000;
        EndMission(playerid, true);
        GivePlayerCash(playerid, rand);
        format(string,sizeof string,"!%d$ ביצעת את המשימה בהצלחה, מזל טוב, זכית ב", rand);
        SendClientMessage(playerid, LIGHT_RED, string);
        format(string,sizeof string,"!וסיים את המשימה, אף אחד ממכם לא הצליח לעצור בעדו, רמת המבוקשות שלו עלתה בפלוס 3 Jizzy פיצץ את המודעון %s השחקן", GetName(playerid));
        SendClientMessageToAll(LIGHT_RED, string);
        _SetPlayerWantedLevel(playerid, GetPlayerWantedLevel(playerid) + 3);
        SendClientMessage(playerid, RED, "!תברח מכאן מהר, עוד 4 שניות המועדון מתפוצץ, מהר");
		SetTimer("JizzyBomb", 4000, 0);
		SetTimer("JizzyBomb", 7000, 0);
		SetTimer("JizzyBomb", 9000, 0);
		return 1;
   }
   format(string,sizeof string,"~n~~n~~n~~n~~n~~y~Mission Time~W~: ~p~%d", count_mission);
   GameTextForPlayer(playerid, string, 1000, 4);
   count_mission--;
   SetTimerEx("BombTrackTime", 1000, 0, "i", playerid);
   if(count_mission < 1) EndMission(playerid, false);
   return 1;
}
function(EndMission(playerid, bool: statsment))
{
    MissionTrackState = 0;
    MissionTrack[playerid] = 0;
    GameTextForPlayer(playerid, !statsment? ("~r~Mission Failed") : ("~g~Mission Complete~n~ + 1 Repect!"), 5000, 6);
    SetVehicleToRespawn(BombTrackVehicle);
    SetPlayerColor(playerid,rgba2hex(random(256),random(256),random(256),200));
	DisablePlayerRaceCheckpoint(playerid);
	if(statsment)
	{
	    dini_IntSet(GetPlayerFile(playerid),"Respect", dini_Int(GetPlayerFile(playerid),"Respect")+1);
	    dini_IntSet(GetPlayerFile(playerid),"Missions", dini_Int(GetPlayerFile(playerid),"Missions")+1);
	}
    return 1;
}
function(JizzyBomb())
{
  new i;
  for(i = 0; i < 30; i++) CreateExplosion(-2659.1458 + random(5) ,1410.2831 + random(5) ,910.1703, 10, 10);
  return 1;
}
function(DaysBetweenDates(DateStart[], DateEnd[])) // by SharkyKH
{
	new datetmp[256], idx1, idx2;
	datetmp = strtok(DateStart, idx1, '.');
	new Start_Day = strval(datetmp);
	datetmp = strtok(DateStart, idx1, '.');
	new Start_Month = strval(datetmp);
	datetmp = strtok(DateStart, idx1, '.');
	new Start_Year = strval(datetmp);
	datetmp = strtok(DateEnd, idx2, '.');
	new End_Day = strval(datetmp);
	datetmp = strtok(DateEnd, idx2, '.');
	new End_Month = strval(datetmp);
	datetmp = strtok(DateEnd, idx2, '.');
	new End_Year = strval(datetmp);
	new init_date = mktime(12,0,0,Start_Day,Start_Month,Start_Year);
	new dest_date = mktime(12,0,0,End_Day,End_Month,End_Year);
	new offset = dest_date-init_date;
	new days = floatround(offset/60/60/24, floatround_floor);
	return days;
}
function(LoadCensorWords())
{
	new File:fp, count = 0, word[MAX_STRING];
	if (!fexist(FILE_NAME))
	{
			fp = fopen(FILE_NAME,io_write);
			fclose(fp);
	}
	fp = fopen(FILE_NAME,io_read);
	while (fread(fp,word,sizeof word))
	{
	    words[count] = word;
		words[count][strlen(words[count])-1] = 0;
		count++;
		if (count == 100) break;
	}
	words[count] = "*EOF*";
	fclose(fp);
}
function(SaveCensorWords())
{
	new File:fp, i;
	fp = fopen(FILE_NAME,io_write);
	for (i = 0; i < 100; i++)
	{
	    if (!strcmp(words[i],"*EOF*",true)) continue;
	    fwrite(fp,words[i]);
	    fwrite(fp,"\n");
 	}
	fclose(fp);
}
function(setHourTime(playerid))
{
   new string[128];
   if(dini_Exists(GetPlayerFile(playerid))) dini_IntSet(GetPlayerFile(playerid),"Hours", dini_Int(GetPlayerFile(playerid),"Hours")+1);
   format(string, sizeof string,"~g~You already play~w~: %d ~y~hours!", dini_Int(GetPlayerFile(playerid),"Hours"));
   GameTextForPlayer(playerid, string, 6, 6000);
   Hours[playerid] = SetTimerEx("setHourTime",60*60*1000, 0, "i", playerid);
   HoursTime[playerid]++;
   if(HoursTime[playerid] > 1) dini_IntSet(GetPlayerFile(playerid),"Bonus", dini_Int(GetPlayerFile(playerid),"Bonus")+1);
   return 1;
}
function(IsPlayerXAdmin(playerid,level)) return dini_Int(GetPlayerXFile(playerid),"Level") > level? 1 : 0;
function(resetMe(playerid))
{
  return meSpam[playerid] = 0;
}
function(petUpdate(playerid, petid))
{
   new Float:pos[3], Float:health_;
   GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
   if(Petid[playerid][petid] == -1) return 0;
   if(petid == 0)
   {
	   for(new i = 0; i < MAX_PLAYERS; i++)
	   {
            GetPlayerHealth(i, health_);
    		if(GetDistanceBetweenPlayers(playerid, i) > 4.0) AttachObjectToPlayer(Petid[playerid][0],playerid,pos[0]+3,pos[1]+3,pos[2]+0.6,0,0,0);
			else if(GetDistanceBetweenPlayers(playerid, i) < 4.0 && i != playerid && gTeam[playerid] != gTeam[i] && gTeam[i] != 0 && IsPlayerConnected(i) && health_ != 0.0 && petState[playerid] == PET_ATTACK)
	        {
                   GetDynamicObjectPos(Petid[playerid][0], pos[0], pos[1], pos[2]);
	               MoveDynamicObject(Petid[playerid][0], pos[0], pos[1], pos[2]+0.6, 5.0);
	               if(PlayerToPoint(2.0, i, pos[0], pos[1], pos[2])) _SetPlayerHealth(i, health_-10.0);
            }
	   }
	   return 1;
   }
   if(petid == 1)
   {
	   for(new i = 0; i < MAX_PLAYERS; i++)
	   {
            GetPlayerHealth(i, health_);
            if(GetDistanceBetweenPlayers(playerid, i) > 6.0) AttachObjectToPlayer(Petid[playerid][1],playerid,pos[0]+5,pos[1]+5,pos[2]+0.8,0,0,0);
			else if(GetDistanceBetweenPlayers(playerid, i) < 6.0 && i != playerid && gTeam[playerid] != gTeam[i] && gTeam[playerid] != 0 && IsPlayerConnected(i) && health_ != 0.0 && petState[playerid] == PET_ATTACK)
	        {
                   GetDynamicObjectPos(Petid[playerid][1], pos[0], pos[1], pos[2]);
	               MoveDynamicObject(Petid[playerid][1], pos[0], pos[1], pos[2]+0.8, 7.0);
	               if(PlayerToPoint(4.0, i, pos[0], pos[1], pos[2])) _SetPlayerHealth(i, health_-15.0);
            }
	   }
	   return 1;
   }
   if(petid == 2)
   {
   	   for(new i = 0; i < MAX_PLAYERS; i++)
	   {
            GetPlayerHealth(i, health_);
            if(GetDistanceBetweenPlayers(playerid, i) > 8.0) AttachObjectToPlayer(Petid[playerid][2],playerid,pos[0]+7,pos[1]+7,pos[2]+0.6,0,0,0);
			else if(GetDistanceBetweenPlayers(playerid, i) < 8.0 && i != playerid && gTeam[playerid] != gTeam[i] && gTeam[playerid] != 0 && IsPlayerConnected(i) && health_ != 0.0 && petState[playerid] == PET_ATTACK)
	        {
                   GetDynamicObjectPos(Petid[playerid][2], pos[0], pos[1], pos[2]);
	               MoveDynamicObject(Petid[playerid][2], pos[0], pos[1], pos[2]+0.6, 9.0);
	               if(PlayerToPoint(5.0, i, pos[0], pos[1], pos[2])) _SetPlayerHealth(i, health_-20.0);
            }
	   }
	   return 1;
   }
   return 1;
}
function(resetPet(playerid))
{
  if(Petid[playerid][0] != -1)
  {
       DestroyDynamicObject(Petid[playerid][0]);
       Petid[playerid][0] = -1;
  }
  if(Petid[playerid][1] != -1)
  {
       DestroyDynamicObject(Petid[playerid][1]);
       Petid[playerid][1] = -1;
  }
  if(Petid[playerid][2] != -1)
  {
       DestroyDynamicObject(Petid[playerid][2]);
       Petid[playerid][2] = -1;
  }
  petState[playerid] = -1;
  return 1;
}
function(endVote())
{
	new string[128];
	if(!vote[0] || !(vote[0] && vote[1])) return 0;
    SendClientMessageToAll(0x00FFFFAA,"-----------------------------------------------------------------");
	format(string, sizeof string,"%d - הצבעות חיוביות",vote[1]);
	SendClientMessageToAll(ORANGE, string);
	format(string, sizeof string,"%d - הצבעות שליליות",vote[2]);
	SendClientMessageToAll(ORANGE, string);
	format(string, sizeof string,"%s - שאלת הסקר",qvote);
	SendClientMessageToAll(ORANGE, string);
	SendClientMessageToAll(GREEN, vote[1] > vote[2] && vote[1] != vote[2] && vote[2] != vote[1]? ("!יש יותר הצבעות חיוביות מאשר שליליות") : ("!יש יותר הצבעות שליליות מאשר חיוביות"));
    SendClientMessageToAll(0x00FFFFAA,"-----------------------------------------------------------------");
	qvote = " ", vote[0] = 0;
    for(new i = 0; i < MAX_PLAYERS; i++) alreadyvote[i] = 0;
	return 1;
}
function(isTextIP(text[]))
{
   new count_true, i,
   censorip[][4] =
   {
      "212", "213",
      "73", "200",
	  "150", "164",
      "227", "84",
	  "95", "217",
	  "235", "71",
	  "143", "62",
	  "10", "240",
	  "91", "121",
	  "209", "58",
	  "23", "228",
	  "120", "201",
	  "184", "234",
	  "106", "191",
	  "254", "110",
	  "80", "153",
	  "161", "85",
	  "23", "145",
	  "8"

   };
   if(strfind(text, "84.95.240.202", true) != -1) return false;
   count_true = 0;
   for(i = 0; i < sizeof censorip; i++) if(strfind(text,censorip[i], true) != -1) count_true++;
   return count_true > 2? true : false;
}
function(kickEx(playerid)) Kick(playerid);
function(getGameHours(playerid)) return dini_Int(GetPlayerFile(playerid),"Hours");
GetPlayerXFile(playerid)
{
	new string[128];
	format(string,sizeof string,"/xadmin/Users/%s.ini",udb_encode(GetName(playerid)));
	return string;
}
GetPlayerFile(playerid)
{
  new f[128];
  format(f, sizeof f,"/Users/%s.ini", GetName(playerid));
  return f;
}
GetName(playerid)
{
  new n[24];
  GetPlayerName(playerid,n, sizeof n);
  return n;
}
sstrtok(const string[], &index)
{
  new length = strlen(string);
  while ((index < length) && (string[index] <= ' ')) index++;
  new offset = index, result[20];
  while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof result - 1))) result[index - offset] = string[index], index++;
  result[index - offset] = EOS;
  return result;
}
strtok_line(const string[], index)
{
	new length = strlen(string), offset = index, result[128];
	while ((index < length) && ((index - offset) < (sizeof result - 1)) && (string[index] > '\r')) result[index - offset] = string[index], index++;
	result[index - offset] = EOS;
	return result;
}
stock rgba2hex(r,g,b,a) return (r*16777216) + (g*65536) + (b*256) + a;
function(checkNewLevel(id))
{
   new string[128];
   if(dini_Int(GetPlayerFile(id), "Kills") >= var_Levels[dini_Int(GetPlayerFile(id), "Level") - 1])
   {
      dini_IntSet(GetPlayerFile(id), "Level", dini_Int(GetPlayerFile(id), "Level") + 1);
      format(string, sizeof string, "  .:.: [NEW LEVEL PLAYER] :.:. %i :עלה בהצלחה לרמה %s - השחקן", dini_Int(GetPlayerFile(id), "Level"), GetName(id));
      SendClientMessageToAll(GOLD, string);
   }
}
function(OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]))
{
	new string[256], date[3];
	if(dialogid == 3 && response)
    {
		if(dini_Int(GetPlayerFile(playerid), "Level") > listitem+1) format(string, sizeof string, "Kills: %i, Level: i", var_Levels[listitem+2] - dini_Int(GetPlayerFile(playerid), "Kills"), listitem+2);
	    else format(string, sizeof string, " Rank %i New Level Info: %i/%i Killes", listitem+2, dini_Int(GetPlayerFile(playerid), "Kills"), 	var_Levels[listitem+2] - dini_Int(GetPlayerFile(playerid), "Kills"));
	    SendClientMessage(playerid, 0x17E5F6FF, string);
	    return 1;
	}
	if(dialogid == 1 && response)
	{
	   if(!strlen(inputtext)) return ShowPlayerDialog(playerid, 1, DIALOG_STYLE_INPUT, "  Welcome to - Team DeathMatch","!לא הקשת סיסמה, אני הקיש שוב", "התחבר", "ביטול");
	   if(strcmp(inputtext, dini_Get(GetPlayerFile(playerid),"Password"), true)) return ShowPlayerDialog(playerid, 1, DIALOG_STYLE_INPUT, "  Welcome to - Team DeathMatch"," • !סיסמה שגויה, נסה שנית", "התחבר", "ביטול");
	   SendClientMessage(playerid,0x0F482FF, IsPlayerXAdmin(playerid, 1)? ("/ahelp :שלום לך אדמין, אתה מחובר בהצלחה, על מנת לראות פקודות שלך") : ("!אתה מחובר כעת בהצלחה"));
	   dini_Set(GetPlayerFile(playerid),"IFamily","None");
	   dini_IntSet(GetPlayerFile(playerid),"TimeOnServer", dini_Int(GetPlayerFile(playerid),"TimeOneServer")+1);
 	   ModeInfo[playerid][Logged] = true;
	}
	if(dialogid == 2 && response)
	{
	    if(strlen(inputtext) < 4 || strlen(inputtext) > 30)
	    {
	        SendClientMessage(playerid,RED,".הסיסמה צריכה להיות בין 4-30");
	        ShowPlayerDialog(playerid, 2, DIALOG_STYLE_INPUT, "  Welcome to - Team DeathMatch"," • שלום לך, אנא הקש את הסיסמה הרצויה לפתיחת חשבון בשרתנו", "הרשם", "ביטול");
	        return 1;
        }
	    if(!strcmp(inputtext, "1234", true) || !strcmp(inputtext, "12345", true) || !strcmp(inputtext, "123456", true) || !strcmp(inputtext, "123123", true))
	    {
	         SendClientMessage(playerid,RED,".הסיסמה קלה מידי - בחר סיסמה אחרת");
	         ShowPlayerDialog(playerid, 2, DIALOG_STYLE_INPUT, "  Welcome to - Team DeathMatch"," • שלום לך, אנא הקש את הסיסמה הרצויה לפתיחת חשבון בשרתנו", "הרשם", "ביטול");
	         return 1;
	    }
	    if(!strlen(inputtext)) return ShowPlayerDialog(playerid, 2, DIALOG_STYLE_INPUT, "  Welcome to - Team DeathMatch"," • אנא הקלד סיסמה", "הרשם", "ביטול");
		getdate(date[2], date[1], date[0]);
		format(string,sizeof string,"%d.%d.%d", date[0], date[1], date[2]);
	    dini_Create(GetPlayerFile(playerid));
	    dini_Set(GetPlayerFile(playerid),"Date", string);
	    dini_IntSet(GetPlayerFile(playerid),"Bonus", 0);
	    dini_IntSet(GetPlayerFile(playerid),"Hitman", 0);
	    dini_IntSet(GetPlayerFile(playerid),"Kills", 0);
	    dini_IntSet(GetPlayerFile(playerid),"Deaths", 0);
	    dini_IntSet(GetPlayerFile(playerid),"Level", 1);
	    dini_IntSet(GetPlayerFile(playerid),"Skin", 0);
	    dini_IntSet(GetPlayerFile(playerid),"Bank", 0);
	    dini_IntSet(GetPlayerFile(playerid),"Respect", 0);
	    dini_IntSet(GetPlayerFile(playerid),"TimeOnServer", 1);
	    dini_IntSet(GetPlayerFile(playerid),"ChampionsPoints", 0);
	    dini_IntSet(GetPlayerFile(playerid),"Missions", 0);
	    dini_Set(GetPlayerFile(playerid),"IFamily", "None");
	    dini_Set(GetPlayerFile(playerid),"Job", "None");
	    dini_Set(GetPlayerFile(playerid),"Tag", "None");
	    dini_Set(GetPlayerFile(playerid),"Password", inputtext);
	    dini_IntSet(GetPlayerFile(playerid),"Hours", 0);
	    format(string,sizeof string,"~r~Nick~w~: ~y~%s~n~ ~G~Password~w~: ~p~%s~n~ ~r~/Stats, /Help /MHelp /Mode~n~~G~ TDM.SA-MP.co.il", GetName(playerid), inputtext);
	    SendTextDrawMessage(playerid,string, 10);
	    format(string,sizeof string,"| > (%i) - הסיסמה איתה נרשמת לשרת (%s) - השם שאיתו נרשמת לשרת < |" , inputtext, GetName(playerid));
	    SendClientMessage(playerid, ORANGE, string);
	    SendClientMessage(playerid, YELLOW, "/Stats - לצפות בנתונים שלך - /Mode /MHelp - להבנת המוד - /Help - על מנת לקבל עזרה, הקש/י");
	    SendClientMessage(playerid, RED, "!מומלץ לצלם את התמונה זו על מנת לזכור את הסיסמה למקרה ששחכתם *");
	    ModeInfo[playerid][Logged] = true;
	    return 1;
	}
	return 1;
}
function(airattackBoom(playerid, aaid, Float:x, Float:y, Float:z))
{
	new i = 0;
	if(aaid == 1)
	{
       for(i = 0; i < 10; i++) CreateExplosion(x + random(8) ,y + random(8) ,z, 10, 10);
	   return 1;
	}
	if(aaid == 2)
	{
       for(i = 0; i < 20; i++) CreateExplosion(x + random(16) ,y + random(16) ,z, 10, 10);
       return 1;
	}
	if(aaid == 3)
	{
       for(i = 0; i < 25; i++) CreateExplosion(x + random(20) ,y + random(20) ,z, 10, 10);
       return 1;
	}
	if(aaid == 4)
	{
		for(i = 0; i < 30; i++) CreateExplosion(x + random(25) ,y + random(25) ,z, 10, 10);
		return 1;
	}
	return 1;
}
function(AntiCheat(playerid))
{
  if(!IsPlayerConnected(playerid)) KillTimer(ACheat[playerid]);
  if(GetPlayerMoney(playerid) > cash_var[playerid] && !IsPlayerAdmin(playerid) && GetPlayerState(playerid) != 7) ResetPlayerCash(playerid), cash_var[playerid] = 0;
  if(!AC_Info[playerid][_sWeapons][GetPlayerWeapon(playerid)] && GetPlayerWeapon(playerid) != 0 && GetPlayerState(playerid) != 7 && !firsts[playerid])
  {
	  ShowPlayerDialog(playerid, 100, DIALOG_STYLE_MSGBOX, ".צ'יטים אסורים בהחלט בשרת שלנו, עשית צ'יט נשקים", "יש לך אזהרה במערכת, במידה ותגיע לעוד אזהרות אתה תורחק לשרת לצמיתות, על מנת לשמור על משחק נקי אל תשתמש בצ'יטים\n SA-MP.co.il > Team DeathMatch", "הבנתי", "לא הבנתי");
      Kick(playerid);
      return 1;
  }
  new Float:_health[MAX_PLAYERS], Float:_armour[MAX_PLAYERS];
  GetPlayerHealth(playerid, _health[playerid]);
  GetPlayerArmour(playerid, _armour[playerid]);
  if(_armour[playerid] > AC_Info[playerid][armour] && _armour[playerid] != 0.0 && !firsts[playerid])
  {
	  ShowPlayerDialog(playerid, 100, DIALOG_STYLE_MSGBOX, ".צ'יטים אסורים בהחלט בשרת שלנו, עשית צ'יט מגן", "יש לך אזהרה במערכת, במידה ותגיע לעוד אזהרות אתה תורחק לשרת לצמיתות, על מנת לשמור על משחק נקי אל תשתמש בצ'יטים\n SA-MP.co.il > Team DeathMatch", "הבנתי", "לא הבנתי");
      Kick(playerid);
      return 1;
  }
  else if(_armour[playerid] < AC_Info[playerid][armour]) AC_Info[playerid][armour] = _armour[playerid];
  if(_health[playerid] > AC_Info[playerid][health] && _health[playerid] != 0.0 && !firsts[playerid])
  {
	  ShowPlayerDialog(playerid, 100, DIALOG_STYLE_MSGBOX, ".צ'יטים אסורים בהחלט בשרת שלנו, עשית צ'יט חיים", "יש לך אזהרה במערכת, במידה ותגיע לעוד אזהרות אתה תורחק לשרת לצמיתות, על מנת לשמור על משחק נקי אל תשתמש בצ'יטים\n SA-MP.co.il > Team DeathMatch", "הבנתי", "לא הבנתי");
      Kick(playerid);
	  return 1;
  }
  else if(_health[playerid] < AC_Info[playerid][health]) AC_Info[playerid][health] = _health[playerid];
  return 1;
}
stock _GivePlayerWeapon(playerid, weaponid, ammoS)
{
    AC_Info[playerid][_sWeapons][weaponid] = true;
    GivePlayerWeapon(playerid, weaponid, ammoS);
	return 1;
}
stock _ResetPlayerWeapons(playerid)
{
   ResetPlayerWeapons(playerid);
   for(new i = 0; i < 38; i++) AC_Info[playerid][_sWeapons][i] = false;
   return 1;
}
stock _SetPlayerHealth(playerid, Float:h)
{
   AC_Info[playerid][health] = h;
   SetPlayerHealth(playerid, h);
   return 1;
}
stock _SetPlayerArmour(playerid, Float:a)
{
   AC_Info[playerid][armour] = a;
   SetPlayerArmour(playerid, a);
   return 1;
}
stock _SetSpawnInfo(playerid, team, skin, Float:x, Float:y, Float:z, Float:rotaion, weapon1, weapon1_ammo, weapon2, weapon2_ammo, weapon3, weapon3_ammo)
{
   for(new i = 0; i < 38; i++) AC_Info[playerid][_sWeapons][i] = false;
   SetSpawnInfo(playerid, team, skin, Float:x, Float:y, Float:z, Float:rotaion, weapon1, weapon1_ammo, weapon2, weapon2_ammo, weapon3, weapon3_ammo);
   AC_Info[playerid][_sWeapons][weapon1] = true;
   AC_Info[playerid][_sWeapons][weapon2] = true;
   AC_Info[playerid][_sWeapons][weapon3] = true;
   return 1;
}
function(OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid))
{
   if(MayorID == playerid && newinteriorid > 0)
   {
       SendClientMessage(playerid, RED, "!!אסור לך לשהות במקום סגור מעל 30 שניות, תצא מהר *");
	   SetTimerEx("checkMayor", 30*1000, false, "i", playerid);
   }
   return 1;
}
function(checkMayor(playerid))
{
   if(GetPlayerInterior(playerid) > 0 && IsPlayerConnected(playerid))
   {
      ForceClassSelection(playerid);
      SendClientMessage(playerid, ORANGE, ".אתה כבר לא ראש עיר יותר בגלל שלא יצאת מהמבנה הסגור תוך 30 שניות");
   }
   return 1;
}
