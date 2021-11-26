void() PostPopulate_Mals_Combatbox =
{

}

void() Populate_Mals_Combatbox =
{
    ctf_gamemode = GAMEMODE_DEFAULT;

    Maps_CleanEntities();

    Maps_SetCfgFriendlyName("mals_combatbox");

    #if ROGUE
    Maps_SetNextLevel("ctf1");
    #else
    Maps_SetNextLevel("dm3");
    #endif

    // Blue base
    Maps_SpawnTeamKey(TEAM_BLUE,'-671 -941 56');

    Maps_TeamSpawn(TEAM_BLUE,'-842 -939 149','0 0 0');
    Maps_TeamSpawn(TEAM_BLUE,'-674 -1103 149','0 90 0');
    Maps_TeamSpawn(TEAM_BLUE,'171 -1121 149','0 90 0');
    Maps_TeamSpawn(TEAM_BLUE,'-221 -941 149','0 0 0');
    Maps_TeamSpawn(TEAM_BLUE,'-669 -585 149','0 0 0');
    Maps_TeamSpawn(TEAM_BLUE,'-851 -200 149','0 0 0');
    

    Maps_SpawnHealth(TEAM_ALL,'-870 -1005 56');
    Maps_SpawnHealth(TEAM_ALL,'-870 -973 56');
    Maps_SpawnHealth(TEAM_ALL,'-870 -941 56');
    Maps_SpawnHealth(TEAM_ALL,'-870 -909 56');
    Maps_SpawnHealth(TEAM_ALL,'-838 -1005 56');
    Maps_SpawnHealth(TEAM_ALL,'-838 -973 56');
    Maps_SpawnHealth(TEAM_ALL,'-838 -941 56');
    Maps_SpawnHealth(TEAM_ALL,'-838 -909 56');

    Maps_SpawnArmor1(TEAM_ALL,'-497 -932 56');
    Maps_SpawnArmor1(TEAM_ALL,'-671 -764 56');

    Maps_SpawnItemShells(TEAM_ALL,TRUE,'-644 -1135 59');
    Maps_SpawnItemShells(TEAM_ALL,TRUE,'-676 -1135 59');
    Maps_SpawnItemShells(TEAM_ALL,TRUE,'-644 -1103 59');
    Maps_SpawnItemShells(TEAM_ALL,TRUE,'-676 -1103 59');

    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'-708 -1135 59');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'-740 -1135 59');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'-708 -1103 59');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'-740 -1103 59');


    Maps_SpawnItemShells(TEAM_ALL,TRUE,'112 -1134 32');
    Maps_SpawnItemShells(TEAM_ALL,TRUE,'144 -1134 32');
    Maps_SpawnItemShells(TEAM_ALL,TRUE,'176 -1134 32');
    Maps_SpawnItemShells(TEAM_ALL,TRUE,'208 -1134 32');
    Maps_SpawnWeaponSuperShotgun(TEAM_ALL,'174 -1063 56');


    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'-863 -271 32');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'-863 -240 32');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'-863 -208 32');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'-863 -176 32');
    Maps_SpawnWeaponNailgun(TEAM_ALL,'-782 -198 56');

    // Red base

    Maps_SpawnTeamKey(TEAM_RED,'1024 526 56');

    
    Maps_TeamSpawn(TEAM_RED,'1025 716 149','0 -90 0');
    Maps_TeamSpawn(TEAM_RED,'1164 531 149','0 180 0');
    Maps_TeamSpawn(TEAM_RED,'556 530 149','0 180 0');
    Maps_TeamSpawn(TEAM_RED,'170 686 149','0 -90 0');
    Maps_TeamSpawn(TEAM_RED,'1184 -207 149','0 -180 0');
    Maps_TeamSpawn(TEAM_RED,'1020 256 127','0 -90 0');
    
    Maps_SpawnArmor1(TEAM_ALL,'838 531 56');
    Maps_SpawnArmor1(TEAM_ALL,'1016 368 56');

    Maps_SpawnHealth(TEAM_ALL,'1184 559 32');
    Maps_SpawnHealth(TEAM_ALL,'1184 527 32');
    Maps_SpawnHealth(TEAM_ALL,'1184 495 32');
    Maps_SpawnHealth(TEAM_ALL,'1184 463 32');
    Maps_SpawnHealth(TEAM_ALL,'1152 559 32');
    Maps_SpawnHealth(TEAM_ALL,'1152 527 32');
    Maps_SpawnHealth(TEAM_ALL,'1152 495 32');
    Maps_SpawnHealth(TEAM_ALL,'1152 463 32');
    
    Maps_SpawnItemShells(TEAM_ALL,TRUE,'962 701 32');
    Maps_SpawnItemShells(TEAM_ALL,TRUE,'994 701 32');
    Maps_SpawnItemShells(TEAM_ALL,TRUE,'962 669 32');
    Maps_SpawnItemShells(TEAM_ALL,TRUE,'994 669 32');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'1026 701 32');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'1026 701 32');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'1058 669 32');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'1058 669 32');

    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'112 703 32');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'144 703 32');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'176 703 32');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'208 703 32');
    Maps_SpawnWeaponNailgun(TEAM_ALL,'174 644 56');

    Maps_SpawnItemShells(TEAM_ALL,TRUE,'1185 -271 32');
    Maps_SpawnItemShells(TEAM_ALL,TRUE,'1185 -240 32');
    Maps_SpawnItemShells(TEAM_ALL,TRUE,'1185 -208 32');
    Maps_SpawnItemShells(TEAM_ALL,TRUE,'1185 -176 32');
    Maps_SpawnWeaponSuperShotgun(TEAM_ALL,'1131 -198 56');



    // General
    
    Maps_SpawnArmor2(TEAM_ALL,'-279 -582 56');
    Maps_SpawnArmor2(TEAM_ALL,'622 161 56');
    
    Maps_SpawnHealth(TEAM_ALL,'-147 -568 56');
    Maps_SpawnHealth(TEAM_ALL,'-270 -470 56');
    Maps_SpawnHealth(TEAM_ALL,'480 156 56');
    Maps_SpawnHealth(TEAM_ALL,'609 12 56');

    
    Maps_SpawnWeaponGrenadeLauncher(TEAM_ALL,'-670 536 56');
    Maps_SpawnItemRockets(TEAM_ALL,TRUE,'-640 700 56');
    Maps_SpawnItemRockets(TEAM_ALL,TRUE,'-728 700 56');
    Maps_SpawnItemRockets(TEAM_ALL,TRUE,'-860 559 56');
    Maps_SpawnItemRockets(TEAM_ALL,TRUE,'-860 465 56');
    
    Maps_SpawnWeaponSuperNailgun(TEAM_ALL,'1035 -939 56');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'971 -1101 56');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'1046 -1101 56');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'1178 -987 56');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'1178 -900 56');
    Maps_SpawnHealthRotten(TEAM_ALL,'841 -945 56');
    Maps_SpawnHealthRotten(TEAM_ALL,'1028 -749 56');
    
    Maps_SpawnWeaponRocketLauncher(TEAM_ALL,'158 -202 56');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'-106 153 56');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'-282 -4 56');
    Maps_SpawnItemRockets(TEAM_ALL,TRUE,'429 -564 56');
    Maps_SpawnItemRockets(TEAM_ALL,TRUE,'600 -410 56');
    Maps_SpawnHealthRotten(TEAM_ALL,'-480 529 56');
    Maps_SpawnHealthRotten(TEAM_ALL,'-674 333 56');
}