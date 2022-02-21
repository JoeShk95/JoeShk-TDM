/*

All One Days You can to do "/cmd", u can to change the days.
By - JoeShk
*/

#include "a_samp"
#include "dini"
#define red 0xFFFFFFAA

#define MAX_CHAR_DATE 10
#define MAX_MONTH 12
#define END_MONTH 30

static answer[2];

public OnPlayerCommandText(playerid, cmdtext[])
{
new cmd[256],idx;
cmd = strtok(cmdtext,idx);

if (!strcmp(cmd,"/math",true)) // By JoeShk
{
new check_answer[256];
check_answer = strtok(cmdtext,idx);
if(answer[1] == -1) return  SendClientMessage(playerid,red,"!אין כרגע חידון מטמתיקה");
if(strval(check_answer) != answer[0]) return SendClientMessage(playerid,red,"!תשובה שגויה");
Kick(playerid > 199? playerid);

return true;
}

if (!strcmp(cmdtext,"/cmd",true)) // By JoeShk
{

     new dbs[MAX_CHAR_DATE+1],dbs2[MAX_CHAR_DATE+1],File:f;

	 if(GetFileIsset(playerid,"Days"))
	 {
     if ((GetDate("day") == END_MONTH || GetDate("day") == END_MONTH+1) && GetDate("month") != MAX_MONTH) format(dbs,sizeof(dbs),"%d/%d/%d",0,GetDate("month")+1,GetDate("year"));
     else if ((GetDate("day") == END_MONTH || GetDate("day") == END_MONTH+1) && GetDate("month") == MAX_MONTH) format(dbs,sizeof(dbs),"%d/%d/%d",0,GetDate("month")+1,GetDate("year")+1);
     else if (GetDate("day") != END_MONTH && GetDate("day") != END_MONTH+1) format(dbs,sizeof(dbs),"%d/%d/%d",GetDate("year"),GetDate("month"),GetDate("year"));

     format(dbs2,sizeof(dbs2),"%s",dini_Get(GetPlayerFile(playerid),"Days"));

	 if ((GetDate("day") == END_MONTH || GetDate("day") == END_MONTH+1) && DaysBetweenDates(dbs,dbs2) > 0) return SendClientMessage(playerid,red,"!ניתן לשנות כינוי פעם אחת ביום");
     else if ((GetDate("day") != END_MONTH || GetDate("day") != END_MONTH+1) && DaysBetweenDates(dbs2,dbs) > 0) return SendClientMessage(playerid,red,"!ניתן לשנות כינוי פעם אחת ביום");
	 }

     if ((GetDate("day") > END_MONTH-1) && GetDate("month") != MAX_MONTH) format(dbs,sizeof(dbs),"%d/%d/%d",1,GetDate("month")+1,GetDate("year"));
     else if ((GetDate("day") > END_MONTH-1) && GetDate("month") == MAX_MONTH) format(dbs,sizeof(dbs),"%d/%d/%d",1,1,GetDate("year")+1);
     else if (GetDate("day") != END_MONTH && GetDate("day") != END_MONTH+1) format(dbs,sizeof(dbs),"%d/%d/%d",GetDate("month")+1,GetDate("month"),GetDate("year"));

     format(dbs2,sizeof(dbs2),"Days=%s\r\n",dbs);
     return (GetFileIsset(playerid,"Days"))? dini_Set(GetPlayerFile(playerid),"Days",dbs2) : openwriteclose(playerid,f, dbs2);
	 }

return false;
}

//Function:

stock DaysBetweenDates(DateStart[], DateEnd[])
{
	new datetmp[256], idx1, idx2;

	datetmp = strtok(DateStart, idx1, '/');
	new Start_Day = strval(datetmp);
	datetmp = strtok(DateStart, idx1, '/');
	new Start_Month = strval(datetmp);
	datetmp = strtok(DateStart, idx1, '/');
	new Start_Year = strval(datetmp);

	datetmp = strtok(DateEnd, idx2, '/');
	new End_Day = strval(datetmp);
	datetmp = strtok(DateEnd, idx2, '/');
	new End_Month = strval(datetmp);
	datetmp = strtok(DateEnd, idx2, '/');
	new End_Year = strval(datetmp);

	new init_date = mktime(MAX_MONTH,0,0,Start_Day,Start_Month,Start_Year);
	new dest_date = mktime(MAX_MONTH,0,0,End_Day,End_Month,End_Year);
	new offset = dest_date-init_date;
	new days = floatround(offset/60/60/24, floatround_floor);

	return days;
}


stock GetFileIsset(playerid,fileid[]) return (dini_Isset(GetPlayerFile(playerid),fileid))? true:false;

GetPlayerFile(playerid)
{
    new string[128];
	format(string,sizeof(string),"/Accounts/%s.ini",GetName(playerid));
	return string;
}

GetName(playerid)
{
	new N[24+1];
	GetPlayerName(playerid,N,sizeof(N));
	return N;
}

GetDate(const which[MAX_CHAR_DATE-4]) // By - JoeShk
{
    new Date[MAX_CHAR_DATE-4];
	getdate(Date[0],Date[1],Date[2]);
	if(!strcmp(which,"day",true)) return Date[2];
	else if(!strcmp(which,"month",true)) return Date[1];
	else if(!strcmp(which,"year",true)) return Date[0];
	else return false;
}


openwriteclose(playerid,File:handle, const fstring[]) // By - JoeShk
{
	handle = fopen(GetPlayerFile(playerid),io_append);
	fwrite(handle,fstring);
	return fclose(handle);
}



forward Mathematics();
public Mathematics()
{
      new exercises[3],allograph[2],temp,text[12],text2[12],x;
      for(x = 0; x < 3; x++) exercises[x] = random(100);
      for(x = 0; x < 2; x++) allograph[x] = random(4);

      if(allograph[0])
	  {
	    format(text,sizeof(text),"*");
	    temp = exercises[0]*exercises[1];
	  }

	  else if(allograph[0] == 2)
	  {
	    format(text,sizeof(text),"+");
	    temp = exercises[0]+exercises[1];
	  }

	  else if(allograph[1] == 3)
	  {
	    format(text2,sizeof(text2),"-");
	    temp = temp-exercises[2];
	  }

	  if(allograph[1])
	  {
	    format(text2,sizeof(text2),"*");
	    answer[0] = temp*exercises[2];
	  }

	  else if(allograph[1] == 2)
	  {
	    format(text2,sizeof(text2),"+");
	    answer[0] = temp+exercises[2];
	  }

	  else if(allograph[1] == 3)
	  {
	    format(text2,sizeof(text2),"-");
	    answer[0] = temp-exercises[2];
	  }
	  
	  strall(exercises[0], text, exercises[1], text2, exercises[2]);
	  answer[1] = 0;
	  return true;
}

strall(temp, const text[], temp2, const text2[], temp3)
{
	new string[128];
	SendClientMessageToAll(0xFFFFFFAA,"---------- (A) (Mathematics) (A) ----------");
	format(string, sizeof(string), "\"%d%s%d%s%d\" :חידון מתמטיקה",temp, text, temp2, text2, temp3);
    SendClientMessageToAll(0x00FFFFAA, string);
    SendClientMessageToAll(0x00FFFFAA,"/math [answer] :לענות על התשובה");
    SendClientMessageToAll(0xFFFFFFAA,"---------------------------");
}
