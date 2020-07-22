#include <sourcemod>
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
    HookEvent("player_death", Event_PlayerDeath);
}
 
 
public Action:Event_PlayerRespawn(Handle:event, const String:name[], bool:dontBroadcast)
{
    if (GetConVarBool(g_cvHEnabled))
            return Plugin_Continue;

    new client = GetClientOfUserId(GetEventInt(event, "userid"));
    new TFClassType:PlayerClass = TF2_GetPlayerClass(client);
 
    new resource = GetPlayerResourceEntity();
    new current_maxHealth = GetEntProp(resource, Prop_Send, "m_iMaxHealth", _, client)

    if (!GetConVarBool(g_cvHMode))
    {
        new Float:new_maxHealth = (float(current_maxHealth) * GetConVarFloat(g_cvHIncrement)) + float(current_maxHealth); // Max HP + (sm_mhincrement * Max HP)
        SetEntProp(client, Prop_Data, "m_iMaxHealth", RoundFloat(new_maxHealth));   // Sets max health.
        SetEntityHealth(client, RoundFloat(new_maxHealth));                         // Sets health to max.
    } 
    else
    {
        switch(PlayerClass)
        {
            case TFClass_Heavy:
            {
                SetEntProp(client, Prop_Data, "m_iMaxHealth", GetConVarInt(g_cvHHeavy));
		        SetEntityHealth(client, GetConVarInt(g_cvHHeavy));
            }
            case TFClass_Soldier:
            {
                SetEntProp(client, Prop_Data, "m_iMaxHealth", GetConVarInt(g_cvHSoldier));
		        SetEntityHealth(client, GetConVarInt(g_cvHSoldier));
            }
            case TFClass_Pyro:
            {
                SetEntProp(client, Prop_Data, "m_iMaxHealth", GetConVarInt(g_cvHPyro));
		        SetEntityHealth(client, GetConVarInt(g_cvHPyro));
            }
            case TFClass_Spy:
            {
                SetEntProp(client, Prop_Data, "m_iMaxHealth", GetConVarInt(g_cvHSpy));
		        SetEntityHealth(client, GetConVarInt(g_cvHSpy));
            }
            case TFClass_Sniper:
            {
                SetEntProp(client, Prop_Data, "m_iMaxHealth", GetConVarInt(g_cvHSniper));
		        SetEntityHealth(client, GetConVarInt(g_cvHSniper));
            }
            case TFClass_DemoMan:
            {
                SetEntProp(client, Prop_Data, "m_iMaxHealth", GetConVarInt(g_cvHDemoman));
		        SetEntityHealth(client, GetConVarInt(g_cvHDemoman));
            }
            case TFClass_Scout:
            {
                SetEntProp(client, Prop_Data, "m_iMaxHealth", GetConVarInt(g_cvHScout));
		        SetEntityHealth(client, GetConVarInt(g_cvHScout));
            }
            case TFClass_Engineer:
            {
                SetEntProp(client, Prop_Data, "m_iMaxHealth", GetConVarInt(g_cvHEngineer));
		        SetEntityHealth(client, GetConVarInt(g_cvHEngineer));
            }
            case TFClass_Medic:
            {
                SetEntProp(client, Prop_Data, "m_iMaxHealth", GetConVarInt(g_cvHMedic));
		        SetEntityHealth(client, GetConVarInt(g_cvHMedic));
            }
        }
    }
 
    return Plugin_Continue;
}


public Action:Event_PlayerDeath(Handle:event, const String:name[], bool:dontBroadcast) 
{

}
