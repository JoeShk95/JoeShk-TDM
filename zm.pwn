#include <a_samp>
#include "dutils"
#pragma unused ret_memcpy
#define COLOR_WHITE 1004
#define red 1004
#define lblue 10004

enum GangWar { states, RPlayers, GPlayers };
stock PGW[GangWar];

enum PGangWar { RedTeam, GreenTeam, in };
stock PPGW[200][PGangWar];

new Float:GW_Red[][3] = {
{2613.9866,	2848.4475,	19.9922},{2647.6553,	2805.0278,	10.8203},
{2611.5500,	2845.7542,	16.7020},{2545.9243,	2839.1824,	10.8203},
{2672.9387,	2800.3374,	10.8203},{2672.8306,	2792.1057,	10.8203},
{2647.7834,	2697.5884,	19.3222},{2654.5427,	2720.3474,	19.3222},
{2653.2063,	2738.2432,	19.3222},{2685.8875,	2816.6575,	36.3222},
{2641.1350,	2703.2019,	25.8222},{2599.1304,	2700.7249,	25.8222},
{2606.1384,	2721.5237,	25.8222},{2597.3745,	2748.0884,	23.8222},
{2595.0657,	2776.6729,	23.8222},{2601.3640,	2777.8101,	23.8222},
{2584.3940,	2825.1748,	27.8203},{2631.8110,	2834.2593,	40.3281},
{2632.2852,	2834.9390,	122.9219},{2646.1997,	2817.7070,	36.3222},
{2691.1233,	2787.7883,	59.0212},{2717.8071,	2771.3464,	74.8281},
{2695.2622,	2699.5488,	22.9472},{2688.8206,	2689.0039,	28.1563},
{2655.0229,	2650.6807,	36.9154},{2570.4668,	2701.2876,	22.9507},
{2498.9915,	2704.6204,	10.9844},{2524.1584,	2743.3735,	10.9917},
{2498.3167,	2782.3357,	10.8203},{2504.5142,	2805.9763,	14.8222},
{2522.2144,	2814.7087,	24.9536},{2510.6292,	2849.6384,	14.8222},
{2618.2646,	2720.8005,	36.5386},{2690.9980,	2741.9060,	19.0722},
{2544.5032,	2805.8840,	19.9922},{2556.2554,	2832.5313,	19.9922},
{2561.9175,	2848.5532,	19.9922}
};

new Float:GW_Green[][3] = {
{2613.9866,	2848.4475,	19.9922},{2647.6553,	2805.0278,	10.8203},
{2611.5500,	2845.7542,	16.7020},{2545.9243,	2839.1824,	10.8203},
{2672.9387,	2800.3374,	10.8203},{2672.8306,	2792.1057,	10.8203},
{2647.7834,	2697.5884,	19.3222},{2654.5427,	2720.3474,	19.3222},
{2653.2063,	2738.2432,	19.3222},{2685.8875,	2816.6575,	36.3222},
{2641.1350,	2703.2019,	25.8222},{2599.1304,	2700.7249,	25.8222},
{2606.1384,	2721.5237,	25.8222},{2597.3745,	2748.0884,	23.8222},
{2595.0657,	2776.6729,	23.8222},{2601.3640,	2777.8101,	23.8222},
{2584.3940,	2825.1748,	27.8203},{2631.8110,	2834.2593,	40.3281},
{2632.2852,	2834.9390,	122.9219},{2646.1997,	2817.7070,	36.3222},
{2691.1233,	2787.7883,	59.0212},{2717.8071,	2771.3464,	74.8281},
{2695.2622,	2699.5488,	22.9472},{2688.8206,	2689.0039,	28.1563},
{2655.0229,	2650.6807,	36.9154},{2570.4668,	2701.2876,	22.9507},
{2498.9915,	2704.6204,	10.9844},{2524.1584,	2743.3735,	10.9917},
{2498.3167,	2782.3357,	10.8203},{2504.5142,	2805.9763,	14.8222},
{2522.2144,	2814.7087,	24.9536},{2510.6292,	2849.6384,	14.8222},
{2618.2646,	2720.8005,	36.5386},{2690.9980,	2741.9060,	19.0722},
{2544.5032,	2805.8840,	19.9922},{2556.2554,	2832.5313,	19.9922},
{2561.9175,	2848.5532,	19.9922}
};

public OnPlayerCommandText(playerid, cmdtext[])
{
   new cmd[256], idx;
   cmd = strtok(cmdtext, idx);
  
   if(!strcmp(cmd, "/Gangw", true))
   {
	  new cgang[256];
	  cgang = strtok(cmdtext, idx);
	  if(!strlen(cgang)) return SendClientMessage(playerid, COLOR_WHITE,IsPlayerXAdmin(playerid, 10)? ("Usage: /gangw [rjoin/gjoin/leave/start/end]") : ("Usage: /gangw [rjoin/gjoin/leave]"));

      if(!strcmp(cgang,"start", true))
	   {
	     if(!IsPlayerXAdmin(playerid, 10)) return SendClientMessage(playerid, red, ".פקודה זאתי משמשת אדמינים בלבד");
	     SetTimerEx("GW_Count", 1000, 0, "i", 120);

	     return 1;

	   }
	  return SendClientMessage(playerid, red, ".שגויה Gang War :פקודות");
   }

   return 1;
}


forward GW_Count(GWar_Count);
public GW_Count(GWar_Count)
{
    new string[128];
    if(GWar_Count == 120)
    {
        SendClientMessageToAll(0x0B01AFF,"- - - - - - - [Gang War] - - - - - - -");
        SendClientMessageToAll(lblue,"!נפתחה הרשמה לפעילות מאורגנת");
        SendClientMessageToAll(lblue,"5,000$ - פרס לקבוצה המנצחת");
        SendClientMessageToAll(lblue,"30$ - עלות השתתפות");
        SendClientMessageToAll(lblue,"!במידה ואין לך מספיק כסף להשתתף, לא תוכל להירשם");
        SendClientMessageToAll(lblue,"/Gangw GJoin :להצטרף לקבוצה הירוקה || /Gangw RJoin :להצטרף לקבוצה האדומה");
        SendClientMessageToAll(0x0B01AFF,"- - - - - - - - - - - - - - - - - -");
    }
    
    GWar_Count --;
    format(string, sizeof(string),"~P~~H~ Gang War: %s%d",GWar_Count == 10? ("~r~") : ("~w~"));
    GameTextForAll(string, 1000, 6);
    if(GWar_Count > 1) SetTimerEx("GW_Count", 1000, 0, "i", GWar_Count);
	else if(GWar_Count < 1)
	{
		for(new xi = 0; xi < 200; xi++) if(IsPlayerConnected(xi) && PPGW[xi][in])
		{
		   new rand;
		   if(PPGW[xi][GreenTeam])
		   {
              rand = random(sizeof(GW_Red));
		      SetPlayerPos(xi,GW_Red[rand][0],GW_Red[rand][1],GW_Red[rand][2]);
		   }

		   else if(PPGW[xi][RedTeam])
		   {
              rand = random(sizeof(GW_Red));
		      SetPlayerPos(xi,GW_Green[rand][0],GW_Green[rand][1],GW_Green[rand][2]);
	 	   }
           return 1;
		}
	}
    return 1;
}


stock IsPlayerXAdmin(playerid, lvl)
{
    playerid = lvl;
    return playerid;
}
