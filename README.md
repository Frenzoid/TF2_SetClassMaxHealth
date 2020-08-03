# TF2 Set class max health 

- This is a plugin that i needed to do, since apparently no one in 11 years tought that changing the default max health for each class specifically would be of use at any time on tf2's long living history of sourcemodding.

## How to install.
- Download this repository (right top green button), and copy `setclassmaxhealth.smx` on your plugins folder.

## CVars:

cvar name, default value, description.

- "sm_mhenabled", "1", "Enables / Disables the plugin (`sm plugins reload` is needed)."
- "sm_mhteam", "1", "0: apply to all teams, 1: Only RED Team, 2: Only BLUE Team"
- "sm_mhmode", "0", "Sets plugins mode, 0: sm_mhincrement = additive value to the default max health for each class for everyone, 1: Custom additive health value for each class from each ones cvar"
- "sm_mhincrement", "100", "Additive health added to everyone."
- "sm_mhsoldier", "200", "Health to increase Soldiers max health"
- "sm_mhpyro", "200", "Health to increase Pyros max health"
- "sm_mhspy", "200", "Health to increase Spys  max health"
- "sm_mhdemoman", "200", "Health to increase Demomans max health"
- "sm_mhsniper", "200", "Health to increase Sniers max health"
- "sm_mhengineer", "200", "Health to increase Engineers max health"
- "sm_mhheavy", "200", "Health to increase Heavys max health"
- "sm_mhscout", "200", "Health to increase Scouts max health"
- "sm_mhmedic", "200", "Health to increase Medics max health"


## Config file:
- Config file located at `cfg/sourcemod/setclassmaxhealth.cfg`.

## Current known bugs:
none

## This plugin is not fully tested, if you find any issues, report it to [ISSUES](https://github.com/Frenzoid/TF2_SetClassMaxHealth/issues) or [send me a private message via Steam](https://steamcommunity.com/id/MrFren/).
