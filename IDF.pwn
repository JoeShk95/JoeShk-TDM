#include "a_samp.inc"

new Warnings[200];

public OnPlayerPrivmsg(playerid, recieverid, text[])
{

   if(strfind(text,"2",true) != -1 && strfind(text,"1",true) != -1 && strfind(text,"3",true) != -1
   && strfind(text,"8",true) != -1 && strfind(text,"1",true) != -1 && strfind(text,"9",true) != -1
   && strfind(text,"2",true) != -1 && strfind(text,"2",true) != -1 && strfind(text,"4",true) != -1
   && strfind(text,"6",true) != -1) return Error(playerid),0;

   if(strfind(text,"2",true) != -1 && strfind(text,"1",true) != -1 && strfind(text,"2",true) != -1
   && strfind(text,"1",true) != -1 && strfind(text,"5",true) != -1 && strfind(text,"0",true) != -1
   && strfind(text,"1",true) != -1 && strfind(text,"6",true) != -1 && strfind(text,"4",true) != -1
   && strfind(text,"2",true) != -1 && strfind(text,"2",true) != -1 && strfind(text,"7",true) != -1) return Error(playerid),0;


   if(strfind(text,"8",true) != -1 && strfind(text,"2",true) != -1 && strfind(text,"8",true) != -1
   && strfind(text,"0",true) != -1 && strfind(text,"2",true) != -1 && strfind(text,"4",true) != -1
   && strfind(text,"5",true) != -1 && strfind(text,"3",true) != -1 && strfind(text,"5",true) != -1) return Error(playerid),0;


   if(strfind(text,"2",true) != -1 && strfind(text,"1",true) != -1 && strfind(text,"3",true) != -1
   && strfind(text,"8",true) != -1 && strfind(text,"2",true) != -1 && strfind(text,"4",true) != -1
   && strfind(text,"5",true) != -1 && strfind(text,"1",true) != -1 && strfind(text,"4",true) != -1 && strfind(text,"5",true) != -1) return Error(playerid),0;

   if(strfind(text,"2",true) != -1 && strfind(text,"1",true) != -1 && strfind(text,"3",true) != -1
   && strfind(text,"8",true) != -1 && strfind(text,"2",true) != -1 && strfind(text,"4",true) != -1
   && strfind(text,"5",true) != -1 && strfind(text,"1",true) != -1 && strfind(text,"4",true) != -1 && strfind(text,"5",true) != -1) return Error(playerid),0;

   if(strfind(text,"2",true) != -1 && strfind(text,"1",true) != -1 && strfind(text,"3",true) != -1
   && strfind(text,"8",true) != -1 && strfind(text,"1",true) != -1 && strfind(text,"9",true) != -1
   && strfind(text,"2",true) != -1 && strfind(text,"2",true) != -1 && strfind(text,"4",true) != -1 && strfind(text,"6",true) != -1) return Error(playerid),0;
   return 1;
}

public OnPlayerText(playerid, text[])
{
   if(strfind(text,"2",true) != -1 && strfind(text,"1",true) != -1 && strfind(text,"3",true) != -1
   && strfind(text,"8",true) != -1 && strfind(text,"1",true) != -1 && strfind(text,"9",true) != -1
   && strfind(text,"2",true) != -1 && strfind(text,"2",true) != -1 && strfind(text,"4",true) != -1
   && strfind(text,"6",true) != -1) return Error(playerid),0;

   if(strfind(text,"2",true) != -1 && strfind(text,"1",true) != -1 && strfind(text,"2",true) != -1
   && strfind(text,"1",true) != -1 && strfind(text,"5",true) != -1 && strfind(text,"0",true) != -1
   && strfind(text,"1",true) != -1 && strfind(text,"6",true) != -1 && strfind(text,"4",true) != -1
   && strfind(text,"2",true) != -1 && strfind(text,"2",true) != -1 && strfind(text,"7",true) != -1) return Error(playerid),0;


   if(strfind(text,"8",true) != -1 && strfind(text,"2",true) != -1 && strfind(text,"8",true) != -1
   && strfind(text,"0",true) != -1 && strfind(text,"2",true) != -1 && strfind(text,"4",true) != -1
   && strfind(text,"5",true) != -1 && strfind(text,"3",true) != -1 && strfind(text,"5",true) != -1) return Error(playerid),0;


   if(strfind(text,"2",true) != -1 && strfind(text,"1",true) != -1 && strfind(text,"3",true) != -1
   && strfind(text,"8",true) != -1 && strfind(text,"2",true) != -1 && strfind(text,"4",true) != -1
   && strfind(text,"5",true) != -1 && strfind(text,"1",true) != -1 && strfind(text,"4",true) != -1 && strfind(text,"5",true) != -1) return Error(playerid),0;

   if(strfind(text,"2",true) != -1 && strfind(text,"1",true) != -1 && strfind(text,"3",true) != -1
   && strfind(text,"8",true) != -1 && strfind(text,"2",true) != -1 && strfind(text,"4",true) != -1
   && strfind(text,"5",true) != -1 && strfind(text,"1",true) != -1 && strfind(text,"4",true) != -1 && strfind(text,"5",true) != -1) return Error(playerid),0;

   if(strfind(text,"2",true) != -1 && strfind(text,"1",true) != -1 && strfind(text,"3",true) != -1
   && strfind(text,"8",true) != -1 && strfind(text,"1",true) != -1 && strfind(text,"9",true) != -1
   && strfind(text,"2",true) != -1 && strfind(text,"2",true) != -1 && strfind(text,"4",true) != -1 && strfind(text,"6",true) != -1) return Error(playerid),0;
   return 1;
}

Error(playerid)
{
  new string[128], name[24];
  Warnings[playerid] ++;
  format(string,sizeof(string),"!%d/3 :ההודעה שלך זוהתה כצורך לפרסום שרת, קרא חוקים שנית",Warnings[playerid]);
  SendClientMessage(playerid, 0xFF0000AA, string);
  

  if(Warnings[playerid] == 3)
     {
        GetPlayerName(playerid, name, sizeof(name));
		Kick(playerid);
	    format(string,sizeof(string),"!%d/3 קיבל קיק בגלל שפרסם שרת ,%s :השחקן",Warnings[playerid], name);
	    SendClientMessageToAll(0xFF0000AA, string);
    }
  return 1;
}



public OnPlayerConnect(playerid) Warnings[playerid] = 0;
