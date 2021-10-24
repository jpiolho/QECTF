void() PostPopulate_dm7 =
{
   
}
void() Populate_dm7 =
{
    Maps_CleanEntities();
    Maps_SetNextLevel("e3m6");

    // Platforms to reach blue key
    Maps_CreateStairs("*5",'-1490 -586 -260','-1490 -566 -297','0 0 0',3); // Upstairs
    Maps_CreateStairs("*5",'-1472 -433 -322','-1472 -307 -436','0 0 0',8); // Downstairs

    // Blue base
    Maps_TeamSpawn(TEAM_BLUE,'-122 311 670','0 0 0');
    Maps_TeamSpawn(TEAM_BLUE,'485 345 490','0 180 0');
    Maps_TeamSpawn(TEAM_BLUE,'28 661 490','0 0 0');
    Maps_TeamSpawn(TEAM_BLUE,'265 736 340','0 0 0');
    Maps_TeamSpawn(TEAM_BLUE,'498 436 620','0 90 0');

    Maps_SpawnTeamKey(TEAM_BLUE,'-54 403 670');

    Maps_SpawnWeaponSuperShotgun(TEAM_BLUE,'158 458 510');
    Maps_SpawnWeaponNailgun(TEAM_BLUE,'689 734 352');
    Maps_SpawnItemShells(TEAM_BLUE,FALSE,'60 330 490');
    Maps_SpawnItemShells(TEAM_BLUE,FALSE,'60 362 490');
    Maps_SpawnItemShells(TEAM_BLUE,FALSE,'60 392 490');
    Maps_SpawnItemShells(TEAM_BLUE,FALSE,'60 422 490');

    Maps_SpawnHealth(TEAM_BLUE,'165 684 470');
    Maps_SpawnHealth(TEAM_BLUE,'165 716 470');
    Maps_SpawnHealth(TEAM_BLUE,'165 748 470');
    Maps_SpawnHealth(TEAM_BLUE,'165 780 470');
    Maps_SpawnHealth(TEAM_BLUE,'133 684 470');
    Maps_SpawnHealth(TEAM_BLUE,'133 716 470');
    Maps_SpawnHealth(TEAM_BLUE,'133 748 470');
    Maps_SpawnHealth(TEAM_BLUE,'133 780 470');

    Maps_SpawnArmor1(TEAM_BLUE,'513 365 488');
    Maps_SpawnArmor1(TEAM_BLUE,'465 365 488');
    Maps_SpawnArmor1(TEAM_BLUE,'417 365 488');

    Maps_SpawnItemSpikes(TEAM_BLUE,FALSE,'360 1036 408');
    Maps_SpawnItemSpikes(TEAM_BLUE,FALSE,'360 1004 408');
    Maps_SpawnItemSpikes(TEAM_BLUE,FALSE,'392 1036 408');
    Maps_SpawnItemSpikes(TEAM_BLUE,FALSE,'392 1004 408');

    Maps_SpawnItemRockets(TEAM_BLUE,FALSE,'409 539 530');


    // Red base
    Maps_TeamSpawn(TEAM_RED,'1882 1103 1050','0 180 0');
    Maps_TeamSpawn(TEAM_RED,'1882 966 1050','0 180 0');
    Maps_TeamSpawn(TEAM_RED,'1895 687 1050','0 180 0');
    Maps_TeamSpawn(TEAM_RED,'1571 1060 1050','0 180 0');
    Maps_TeamSpawn(TEAM_RED,'1464 1082 922','0 180 0');

    Maps_SpawnTeamKey(TEAM_RED,'1582 938 1050');

    Maps_SpawnWeaponSuperShotgun(TEAM_RED,'1728 1159 1050');

    Maps_SpawnItemShells(TEAM_RED,TRUE,'1552 1179 1048');
    Maps_SpawnItemShells(TEAM_RED,TRUE,'1552 1147 1048');

    Maps_SpawnItemSpikes(TEAM_RED,TRUE,'1584 1179 1048');
    Maps_SpawnItemSpikes(TEAM_RED,TRUE,'1584 1147 1048');

    Maps_SpawnArmor1(TEAM_RED,'1894 693 1050');
    Maps_SpawnArmor1(TEAM_RED,'1894 741 1050');
    Maps_SpawnArmor1(TEAM_RED,'1894 789 1050');

    Maps_SpawnHealth(TEAM_RED,'1871 1231 1050');
    Maps_SpawnHealth(TEAM_RED,'1871 1199 1050');
    Maps_SpawnHealth(TEAM_RED,'1871 1167 1050');
    Maps_SpawnHealth(TEAM_RED,'1839 1231 1050');
    Maps_SpawnHealth(TEAM_RED,'1839 1199 1050');
    Maps_SpawnHealth(TEAM_RED,'1839 1167 1050');
    Maps_SpawnItemRockets(TEAM_RED,FALSE,'1826 865 925');

    Maps_SpawnWeaponNailgun(TEAM_RED,'1867 449 925');



    // Other
    Maps_SpawnWeaponRocketLauncher(TEAM_ALL,'1188 666 480');
    Maps_SpawnWeaponSuperNailgun(TEAM_ALL,'888 1377 790');
    Maps_SpawnWeaponGrenadeLauncher(TEAM_ALL,'1861 -185 670');
    Maps_SpawnItemRockets(TEAM_ALL,FALSE,'2006 -215 670');
    Maps_SpawnWeaponLightning(TEAM_ALL,'141 -390 468');
    Maps_SpawnItemCells(TEAM_ALL,TRUE,'332 -499 468');
    Maps_SpawnItemCells(TEAM_ALL,TRUE,'332 -467 468');
    
    Maps_SpawnItemRockets(TEAM_ALL,TRUE,'1953 315 410');
    Maps_SpawnItemRockets(TEAM_ALL,TRUE,'2027 315 410');

    Maps_SpawnHealthMega(TEAM_ALL,'458 1398 925');
    Maps_SpawnArmorInv(TEAM_ALL,'699 88 925');
    Maps_SpawnArmor2(TEAM_ALL,'1079 1259 925');
}