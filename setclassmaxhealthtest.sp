#include <sourcemod>
#include <sdkhooks>
#include <tf2>
#include <tf2_stocks>
 
public Plugin:myinfo =  
{  
    name = "[TF2] SetClassMaxHealth",
    author = "MrFrenzoid",
    description = "Change default max health on each class, or all classed via incremental.",
    version = "1.0",                                                             
    url = "http://www.sourcemod.net/"
}; 
 
new Handle:g_cvHIncrement;

public OnPluginStart()
{       
    g_cvHIncrement = CreateConVar("sm_mhincrement", "9999", "Max hp value");
    HookEvent("player_spawn", Event_PlayerRespawn);
}
 
 
public Action:Event_PlayerRespawn(Handle:event, const String:name[], bool:dontBroadcast)
{
    new client = GetClientOfUserId(GetEventInt(event, "userid"));
    SDKHook(client, SDKHook_GetMaxHealth, OnGetMaxHealth);
 
    return Plugin_Continue;
}

public Action:OnGetMaxHealth(client, &maxhealth) 
{
    maxhealth = GetConVarInt(g_cvHIncrement);

    return Plugin_Continue;
}
