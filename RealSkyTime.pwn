#include <a_samp>
new Params[4][8], FileData[7][128], plang[MAX_PLAYERS];


public OnPlayerConnect(playerid)
{
   new Country[256];
   GetPlayerCountry(playerid,Country);
   if(strfind(Country,"Israel", true) != -1) plang[playerid] = 1; else plang[playerid] = 0;
   return 1;
}
GetParams(Source[])
{
	new Destination[256], SLen = strlen(Source), at,pos = 0,tp = 0,i = 0, tempo[256];
	for(i = 0; i < sizeof Params; i++) format(Params[i],sizeof Params,"");
	for(at = pos; at <= SLen; at++)
	{
		strmid(tempo,Source,at,at+1,sizeof tempo);
		if(!strcmp(tempo,".",true))
		{
			if(tp <= 10)
			{
                strmid(Destination,Source,pos,at,sizeof Destination);
				format(Params[tp][0],256,"%s",Destination);
				tp = tp+1;
            }
			pos = at+1;
		}
	}
	return 1;
}
GetFileData(Source[])
{
	new Destination[256], SLen = strlen(Source), at,pos = 0,tp = 0, i = 0, tempo[256];
	for(i = 0; i < sizeof FileData; i++) format(FileData[i],sizeof FileData,"");
	for(at = pos; at <= SLen; at++)
	{
		strmid(tempo,Source,at,at+1,sizeof tempo);
		if(!strcmp(tempo,",",true))
		{
			if(tp <= 10)
			{
				strmid(Destination,Source,pos,at,sizeof Destination);
				format(FileData[tp][0],256,"%s",Destination);
				tp = tp+1;
			}
			pos = at+1;
		}
	}
	return 1;
}
GetPlayerCountry(playerid,Country[256])
{
   	new IPAddress[256], a[4],ipf, i = 0, File:IPFile, Text[256],se[2];
   	GetPlayerIp(playerid,IPAddress,sizeof IPAddress); GetParams(IPAddress);
   	for(i = 0; i < sizeof a; i++)  a[i] = strval(Params[i]);
   	if(a[0] == 127 && !a[1] && !a[2] && a[3]) return format(Country,sizeof(Country),"Localhost");
   	ipf = (16777216*a[0]) + (65536*a[1]) + (256*a[2]) + a[3];
   	if(!fexist("CountriesIPs/IPLIST.csv")) return 1;
   	IPFile=fopen("CountriesIPs/IPLIST.csv",io_read);
   	fread(IPFile,Text,sizeof(Text),false);
	while(strlen(Text) > 0)
	{
	    GetFileData(Text);
	    se[0] = strval(FileData[0]);
	    se[1] = strval(FileData[1]);
	    if(ipf >= se[0] && ipf <= se[1])
		{
			format(Country,sizeof(Country),"%s(%s)",FileData[6],FileData[5]);
			fclose(IPFile);
			return 1;
	    }
	    fread(IPFile,Text,sizeof Text,false);
	}
	fclose(IPFile);
	return 1;
}
function(SendClientMessageEx(playerid, kcolor, text1[], text2[])) return SendClientMessage(playerid, kcolor, !plang[playerid]? (text1) : (text2));

GetName(playerid)
{
    new name[24];
	GetPlayerName(playerid, name, sizeof name );
	return name;
}
