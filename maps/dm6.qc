void() PostPopulate_DM6 =
{
    // Fix teleporters
    Maps_RemoveEntitiesByTarget("t2");    
    Maps_FindEntityByClassnameContainingPoint("trigger_teleport",'1027 -1095 7').target = "t2"; // Teleporter from middle to rocket
    Maps_RemoveEntitiesByTarget("t1");


}
void() Populate_DM6 =
{
    Maps_CleanEntities();
    Maps_SetNextLevel("e3m6");

    Maps_SpawnWeaponSuperNailgun(TEAM_ALL,'1160 -1088 -64');
Maps_SpawnWeaponGrenadeLauncher(TEAM_ALL,'1016 -848 232');
Maps_SpawnWeaponSuperShotgun(TEAM_BLUE,'440 -1880 144');
Maps_SpawnWeaponRocketLauncher(TEAM_ALL,'200 -1112 88');
Maps_SpawnWeaponLightning(TEAM_ALL,'760 -1080 -296');
Maps_SpawnItemCells(TEAM_ALL,TRUE,'600 -1064 -288');
Maps_SpawnItemCells(TEAM_ALL,TRUE,'656 -1064 -288');
Maps_SpawnItemShells(TEAM_BLUE,FALSE,'480 -1872 144');
Maps_SpawnItemSpikes(TEAM_BLUE,TRUE,'176 -1616 16');
Maps_SpawnItemSpikes(TEAM_BLUE,TRUE,'128 -1616 16');
Maps_SpawnItemShells(TEAM_BLUE,FALSE,'480 -1904 144');
Maps_SpawnItemSpikes(TEAM_BLUE,TRUE,'224 -1616 16');
Maps_SpawnItemShells(TEAM_BLUE,FALSE,'480 -1936 144');
Maps_SpawnArmor1(TEAM_BLUE,'232 -1512 16');
Maps_SpawnTeamKey(TEAM_BLUE,'72 -1992 104');
Maps_SpawnItemRockets(TEAM_ALL,FALSE,'272 -1296 88');
Maps_SpawnItemRockets(TEAM_ALL,FALSE,'96 -1296 88');
Maps_SpawnItemRockets(TEAM_BLUE,FALSE,'464 -2048 16');
Maps_SpawnTeamKey(TEAM_RED,'1320 -328 184');
Maps_SpawnWeaponSuperShotgun(TEAM_RED,'1392 -584 16');
Maps_SpawnItemShells(TEAM_RED,FALSE,'1528 -272 152');
Maps_SpawnItemShells(TEAM_RED,FALSE,'1496 -272 152');
Maps_SpawnItemSpikes(TEAM_RED,FALSE,'1664 -272 24');
Maps_SpawnItemSpikes(TEAM_RED,FALSE,'1624 -272 24');
Maps_SpawnArmor1(TEAM_RED,'1896 -184 144');
Maps_SpawnArmor1(TEAM_RED,'1864 -152 144');
Maps_SpawnArmorInv(TEAM_ALL,'896 -1456 232');
Maps_SpawnHealthMega(TEAM_ALL,'-8 -1112 240');
Maps_TeamSpawn(TEAM_BLUE,'456 -2000 168','0 90 0');
Maps_TeamSpawn(TEAM_RED,'1704 -336 168','0 225 0');
Maps_SpawnItemShells(TEAM_RED,FALSE,'1560 -272 152');
Maps_SpawnItemShells(TEAM_RED,FALSE,'1464 -272 152');
Maps_SpawnItemSpikes(TEAM_RED,FALSE,'1776 -376 24');
Maps_SpawnItemSpikes(TEAM_RED,FALSE,'1776 -408 24');
Maps_SpawnItemRockets(TEAM_RED,FALSE,'1360 -272 16');
Maps_SpawnItemRockets(TEAM_RED,FALSE,'1360 -312 16');
Maps_SpawnItemRockets(TEAM_BLUE,FALSE,'424 -2048 16');
Maps_SpawnItemSpikes(TEAM_BLUE,TRUE,'272 -1616 16');
Maps_SpawnItemShells(TEAM_BLUE,FALSE,'480 -1976 144');
Maps_SpawnArmor1(TEAM_BLUE,'192 -1512 16');
Maps_SpawnArmor1(TEAM_BLUE,'152 -1512 16');
Maps_SpawnArmor1(TEAM_RED,'1856 -192 144');
Maps_SpawnItemCells(TEAM_ALL,TRUE,'600 -1136 -288');
Maps_SpawnItemCells(TEAM_ALL,TRUE,'656 -1136 -288');
Maps_SpawnHealth(TEAM_RED,'1800 -168 144');
Maps_SpawnHealth(TEAM_RED,'1800 -200 144');
Maps_SpawnHealth(TEAM_RED,'1760 -168 144');
Maps_SpawnHealth(TEAM_RED,'1760 -200 144');
Maps_SpawnHealth(TEAM_RED,'1848 -264 144');
Maps_SpawnHealth(TEAM_RED,'1880 -264 144');
Maps_SpawnHealth(TEAM_RED,'1880 -304 144');
Maps_SpawnHealth(TEAM_RED,'1848 -304 144');
Maps_SpawnHealth(TEAM_BLUE,'72 -1512 16');
Maps_SpawnHealth(TEAM_BLUE,'104 -1512 16');
Maps_SpawnHealth(TEAM_BLUE,'104 -1544 16');
Maps_SpawnHealth(TEAM_BLUE,'72 -1544 16');
Maps_SpawnHealth(TEAM_BLUE,'320 -2064 16');
Maps_SpawnHealth(TEAM_BLUE,'280 -2064 16');
Maps_SpawnHealth(TEAM_BLUE,'280 -2024 16');
Maps_SpawnHealth(TEAM_BLUE,'320 -2024 16');
Maps_TeamSpawn(TEAM_BLUE,'456 -1912 40','0 180 0');
Maps_TeamSpawn(TEAM_BLUE,'456 -1784 40','0 180 0');
Maps_TeamSpawn(TEAM_BLUE,'32 -1656 40','0 0 0');
Maps_TeamSpawn(TEAM_RED,'1280 -576 168','0 0 0');
Maps_TeamSpawn(TEAM_RED,'1720 -344 40','0 225 0');
Maps_TeamSpawn(TEAM_RED,'1520 -280 40','0 270 0');
Maps_SpawnWeaponNailgun(TEAM_RED,'1632 -424 16');
Maps_SpawnWeaponNailgun(TEAM_BLUE,'64 -1760 16');
Maps_SpawnArmor2(TEAM_ALL,'528 -1080 -304');
Maps_SpawnItemRockets(TEAM_ALL,FALSE,'1008 -816 232');
Maps_TeamSpawn(TEAM_BLUE,'168 -1896 40','0 60 0');
Maps_TeamSpawn(TEAM_RED,'1888 -416 168','0 180 0');


    


}

