/*
                                   By Yosi

						   Bugs? - Yos136@walla.com

*/
#include <a_samp>
#include <dini>

//==================================forwards====================================

//================================defines_Colors================================

public OnFilterScriptInit() if(!dini_Exists("/Commands.log")) dini_Create("/Commands.log");





public OnPlayerCommandText(playerid, cmdtext[])
{
	new commands[256], second2, minute, hour2;
	gettime(hour2,minute,second2);
	format(commands, sizeof(commands), "\n[Date: %d/%d/%d] %s: %s", hour2, minute, second2, GetName(playerid), cmdtext);
	write_to_log(commands,2);
}


stock write_to_log(by_log[],logid) // By - JoeShk
{
	new the_text[256];
	format(the_text, sizeof(the_text), "%s\n\r",by_log);
	new File:file_log;

	if(logid == 1) file_log = fopen("/Chat.log", io_append);
	if(logid == 2) file_log = fopen("/Commands.log", io_append);
	if(logid == 3) file_log = fopen("/PrivateMessage.log", io_append);
	if(logid == 4) file_log = fopen("/Changenick.log", io_append);
	fwrite(file_log, the_text);
    return fclose(file_log);
}

stock GetName(playerid)
{
  new name[24];
  GetPlayerName(playerid, name, 24);
  return name;
}
