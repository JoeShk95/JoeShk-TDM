#include <a_samp>

#define COLOR_LIGHTGREEN 0x24FF0AB9
#define COLOR_GREEN 0x33FF33AA
#define COLOR_BRIGHTRED 0xFF000096
#define COLOR_LIGHTBLUE 0x33CCFFAA
#define COLOR_RED 0xAA3333AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_ORANGE 0xFF9900AA
#define COLOR_PINK 0xFF66FFAA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_BLUE 0x0B6F6FF
#define COLOR_LIGHTBLUEGREEN 0x0F66AFF

static Pickups;

enum PInfo
{
	Float:x,
	Float:y,
	Float:z,
	Float:Tx,
	Float:Ty,
	Float:Tz,
	Interior,
	PickupId
}
new PickupID[200];
new PickupInfo[][PInfo];

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print("Doors Pickups System By Dezire.");
	print("--------------------------------------\n");
	return 1;
}

public OnFilterScriptExit()
{
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
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
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
	new cmd[256],idx;
	cmd = strtok(cmdtext,idx);
	if(!strcmp(cmd,"/enter",true))
	{
		if(PickupID[playerid] == -1) return SendClientMessage(playerid,COLOR_BRIGHTRED,"You must be near a pickup");
		SetPlayerPos(playerid,PickupInfo[PickupID[playerid]][Tx],PickupInfo[PickupID[playerid]][Tz],PickupInfo[PickupID[playerid]][Tz]);
		return 1;
	}
	min(idx,idx);
	return 0;
}

public OnPlayerInfoChange(playerid)
{
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
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
	for(new i; i<Pickups; i++)
	{
	    if(PickupInfo[i][PickupId] == pickupid)
	    {
	        GameTextForPlayer(playerid,"~r~To enter this interior~n~~w~press:/enter",2500,4);
	        PickupID[playerid] = pickupid;
		}
	}
	return 1;
}
forward OnPlayerUpdate(playerid);
public OnPlayerUpdate(playerid)
{
	new num;
	for(new i; i<Pickups; i++)
	{
	    if(GetDistanceToPickup(playerid, i) > 1.0)
	    {
	        num ++;
	        if(num == Pickups)
	        {
	            PickupID[playerid] = -1;
	            break;
			}
		}
		else if(GetDistanceToPickup(playerid, i) < 1.0) PickupID[playerid] = i;

	}
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

stock AddEnterPickup(Float:X,Float:Y,Float:Z,Flaot:TX,Float:TY,Float:TZ,InteriorId)
{
	AddStaticPickup(1559,20,X,Y,Z+1);
	Pickups ++;
	PickupInfo[Pickups][Tx] = TX;
    PickupInfo[Pickups][Ty] = TY;
    PickupInfo[Pickups][Tz] = TZ;
	PickupInfo[Pickups][x] = X;
    PickupInfo[Pickups][y] = Y;
    PickupInfo[Pickups][z] = Z;
    PickupInfo[Pickups][Interior] = InteriorId;
    
}

stock strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' ')) index++;


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

forward Float:GetDistanceToPickup(playerid, Pickupid);
public Float:GetDistanceToPickup(playerid, Pickupid) { //Unknows auther, Improved by me :]
	new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2;
	GetPlayerPos(playerid,x1,y1,z1);
	x2 = PickupInfo[Pickupid][x];
	y2 = PickupInfo[Pickupid][x];
	z2 = PickupInfo[Pickupid][x];
	return floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
}

