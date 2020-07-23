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
 
new Handle:g_cvHEnabled;
new Handle:g_cvHMode;
new Handle:g_cvHTeam;
new Handle:g_cvHIncrement;

new Handle:g_cvHSoldier;
new Handle:g_cvHPyro;
new Handle:g_cvHSpy;
new Handle:g_cvHDemoman;
new Handle:g_cvHSniper;
new Handle:g_cvHEngineer;
new Handle:g_cvHHeavy;
new Handle:g_cvHScout;
new Handle:g_cvHMedic;

public OnPluginStart()
{       
    g_cvHEnabled = CreateConVar("sm_mhenabled", "1", "Sets whether the plugin is enabled.");
    g_cvHMode = CreateConVar("sm_mhmode", "0", "Sets plugins mode, 0: sm_mhincrement = +% of the default max health for each class for everyone, 1: Custom health value for each class from each ones cvar");
    
    g_cvHTeam = CreateConVar("sm_mhteam", "0", "0: apply to all teams, 1: Only RED, 2: Only Blue");

    g_cvHIncrement = CreateConVar("sm_mhincrement", "0.5", "% incremented on the default maxhealth to all classes");

    g_cvHSoldier = CreateConVar("sm_mhsoldier", "200", "Sets Soldiers max health");
    g_cvHPyro = CreateConVar("sm_mhpyro", "200", "Sets Pyros max health");
    g_cvHSpy = CreateConVar("sm_mhspy", "200", "Sets Spys  max health");
    g_cvHDemoman = CreateConVar("sm_mhdemoman", "200", "Sets Demomans max health");
    g_cvHSniper = CreateConVar("sm_mhsniper", "200", "Sets Sniers max health");
    g_cvHEngineer = CreateConVar("sm_mhengineer", "200", "Sets Engineers max health");
    g_cvHHeavy = CreateConVar("sm_mhheavy", "200", "Sets Heavys max health");
    g_cvHScout = CreateConVar("sm_mhscout", "200", "Sets Scouts max health");
    g_cvHMedic = CreateConVar("sm_mhmedic", "200", "Sets Medics max health");

    AutoExecConfig(true, "setclassmaxhealth");
    HookEvent("player_spawn", Event_PlayerRespawn);
}
 
 
public Action:Event_PlayerRespawn(Handle:event, const String:name[], bool:dontBroadcast)
{
    if (GetConVarBool(g_cvHEnabled))
            return Plugin_Continue;

    new client = GetClientOfUserId(GetEventInt(event, "userid"));

    SDKHook(client, SDKHook_GetMaxHealth, OnGetMaxHealth);
 
    return Plugin_Continue;
}

public Action:OnGetMaxHealth(client, &maxhealth) 
{
    new TFClassType:PlayerClass = TF2_GetPlayerClass(client);
    new TFTeam:PlayerTeam = GetClientTeam(client);
    
    // If the player is from any other team that g_cvHTeam is setted to, dont do anything.
    if ((GetConVarInt(g_cvHTeam) == 1 && PlayerTeam != TFTeam_Red) || (GetConVarInt(g_cvHTeam) == 2 && PlayerTeam != TFTeam_Blue))
        return Plugin_Continue;

    // Depending on the mode, set everyones max hp depending on g_cvHIncrement's %, or set each class specifically its max health.
    if (!GetConVarBool(g_cvHMode))
    {
        new Float:new_maxHealth = (float(maxhealth) * GetConVarFloat(g_cvHIncrement)) + float(maxhealth); // Max HP + (sm_mhincrement * Max HP)
        maxhealth = RoundFloat(new_maxHealth);
    } 
    else
    {
        switch(PlayerClass)
        {
            case TFClass_Heavy:
            {
		        maxhealth = GetConVarInt(g_cvHHeavy);
            }
            case TFClass_Soldier:
            {
		        maxhealth = GetConVarInt(g_cvHSoldier);
            }
            case TFClass_Pyro:
            {
		        maxhealth = GetConVarInt(g_cvHPyro);
            }
            case TFClass_Spy:
            {
		        maxhealth = GetConVarInt(g_cvHSpy);
            }
            case TFClass_Sniper:
            {
		        maxhealth = GetConVarInt(g_cvHSniper);
            }
            case TFClass_DemoMan:
            {
		        maxhealth = GetConVarInt(g_cvHDemoman);
            }
            case TFClass_Scout:
            {
		        maxhealth = GetConVarInt(g_cvHScout);
            }
            case TFClass_Engineer:
            {
		        maxhealth = GetConVarInt(g_cvHEngineer);
            }
            case TFClass_Medic:
            {
		        maxhealth = GetConVarInt(g_cvHMedic);
            }
        }
    }

    return Plugin_Continue;
}
