# TF2 Set class max health 

- This is a plugin that i needed to do, since apparently no one in 11 years tought that changing the default max health for each class specifically would be of use at any time on tf2's long living history of sourcemodding.

## How to install.
- Download this repository (right top green button), and copy `setclassmaxhealth.smx` on your plugins folder.

## CVars:

cvar name, default value, description.

- "sm_mhenabled", "1", "Sets whether the plugin is enabled."
- "sm_mhteam", "1", "0: apply to all teams, 1: Only RED, 2: Only Blue"
- "sm_mhmode", "0", "Sets plugins mode, 0: sm_mhincrement = +% of the default max health for each class, 1: Custom health value for each class from each owns class cvar"
- "sm_mhincrement", "0.2", "% incremented on the default maxhealth to all classes"
- "sm_mhsoldier", "200", "Sets Soldiers max health"
- "sm_mhpyro", "200", "Sets Pyros max health"
- "sm_mhspy", "200", "Sets Spys  max health"
- "sm_mhdemoman", "200", "Sets Demomans max health"
- "sm_mhsniper", "200", "Sets Sniers max health"
- "sm_mhengineer", "200", "Sets Engineers max health"
- "sm_mhheavy", "200", "Sets Heavys max health"
- "sm_mhscout", "200", "Sets Scouts max health"
- "sm_mhmedic", "200", "Sets Medics max health"


## Config file:
- Config file located at `cfg/sourcemod/setclassmaxhealth.cfg`.

## Current known bugs:
- Ovearheals don't work.

## This plugin is not fully tested, if you find any issues, report it to [ISSUES](https://github.com/Frenzoid/TF2_SetClassMaxHealth/issues) or [send me a private message via Steam](https://steamcommunity.com/id/MrFren/).
