void() PostPopulate_e1m2 =
{
    // End gate
    Maps_RemoveEntitiesByModel("*61");
    Maps_RemoveEntitiesByModel("*34");
    Maps_RemoveEntitiesByModel("*33");
    
    // Red base gate
    Maps_RemoveEntitiesByModel("*24");
    Maps_RemoveEntitiesByModel("*27");
    Maps_RemoveEntitiesByModel("*23");
    Maps_RemoveEntitiesByModel("*26");
    Maps_RemoveEntitiesByModel("*25");

    // Water secret door that opens later
    Maps_RemoveEntitiesByModel("*37");

    // Secret teleporter
    Maps_FindEntityByTarget("t43").target = "tele_rocket";


    Maps_RemoveEntitiesByClassname("trigger_secret");
    total_secrets = 0;
}

void() Populate_e1m2 =
{
    ctf_gamemode = GAMEMODE_AREA_CAPTURE;

    Maps_CleanEntities();
    Maps_SetNextLevel("e3m6");

    
    // Blue spawn
    Maps_SpawnTeamKey(TEAM_BLUE,'1410 1666 288');
    Maps_SpawnTeamKey(TEAM_BLUE,'1463.5 1666 288');
    Maps_SpawnTeamKey(TEAM_BLUE,'1517 1666 288');
    Maps_SpawnTeamKey(TEAM_BLUE,'1570.5 1666 288');
    Maps_SpawnTeamKey(TEAM_BLUE,'1624 1666 288');

    Maps_TeamSpawn(TEAM_BLUE,'1336 1653 392','0 -90 0');
    Maps_TeamSpawn(TEAM_BLUE,'1681 1635 444','0 -90 0');
    Maps_TeamSpawn(TEAM_BLUE,'1774 1438 444','0 -90 0');
    Maps_TeamSpawn(TEAM_BLUE,'1276 1383 444','0 -90 0');
    Maps_TeamSpawn(TEAM_BLUE,'1495 1489 444','0 -90 0');
    Maps_TeamSpawn(TEAM_BLUE,'1298 1605 444','0 -90 0');
    
    Maps_SpawnWeaponSuperShotgun(TEAM_BLUE,'1652 1308 200');
    Maps_SpawnItemShells(TEAM_BLUE,TRUE,'1753 1264 200');
    Maps_SpawnItemShells(TEAM_BLUE,TRUE,'1753 1296 200');
    Maps_SpawnItemShells(TEAM_BLUE,TRUE,'1753 1328 200');
    Maps_SpawnItemShells(TEAM_BLUE,TRUE,'1753 1360 200');
    Maps_SpawnItemShells(TEAM_BLUE,TRUE,'1721 1264 200');
    Maps_SpawnItemShells(TEAM_BLUE,TRUE,'1721 1296 200');
    Maps_SpawnItemShells(TEAM_BLUE,TRUE,'1721 1328 200');
    Maps_SpawnItemShells(TEAM_BLUE,TRUE,'1721 1360 200');

    Maps_SpawnWeaponNailgun(TEAM_BLUE,'1372 1287 200');
    Maps_SpawnItemSpikes(TEAM_BLUE,TRUE,'1290 1251 200');
    Maps_SpawnItemSpikes(TEAM_BLUE,TRUE,'1258 1251 200');
    Maps_SpawnItemSpikes(TEAM_BLUE,TRUE,'1226 1251 200');
    Maps_SpawnItemSpikes(TEAM_BLUE,TRUE,'1194 1251 200');
    Maps_SpawnItemSpikes(TEAM_BLUE,TRUE,'1290 1283 200');
    Maps_SpawnItemSpikes(TEAM_BLUE,TRUE,'1258 1283 200');
    Maps_SpawnItemSpikes(TEAM_BLUE,TRUE,'1226 1283 200');
    Maps_SpawnItemSpikes(TEAM_BLUE,TRUE,'1194 1283 200');
    
    Maps_SpawnArmor1(TEAM_BLUE,'1782 1706 264');
    Maps_SpawnArmor1(TEAM_BLUE,'1782 1658 264');
    Maps_SpawnArmor1(TEAM_BLUE,'1782 1610 264');

    Maps_SpawnHealth(TEAM_BLUE,'1192 1719 264');
    Maps_SpawnHealth(TEAM_BLUE,'1192 1687 264');
    Maps_SpawnHealth(TEAM_BLUE,'1192 1655 264');
    Maps_SpawnHealth(TEAM_BLUE,'1192 1623 264');
    Maps_SpawnHealth(TEAM_BLUE,'1192 1591 264');
    Maps_SpawnHealth(TEAM_BLUE,'1192 1559 264');
    Maps_SpawnHealth(TEAM_BLUE,'1240 1719 264');

    Maps_SpawnHealth(TEAM_BLUE,'1289 1504 264');
    Maps_SpawnHealth(TEAM_BLUE,'1321 1504 264');
    Maps_SpawnHealth(TEAM_BLUE,'1353 1504 264');

    // Red spawn
    Maps_SpawnTeamKey(TEAM_RED,'-736 -587 480');
    Maps_SpawnTeamKey(TEAM_RED,'-736 -546.75 480');
    Maps_SpawnTeamKey(TEAM_RED,'-736 -506.5 480');
    Maps_SpawnTeamKey(TEAM_RED,'-736 -466.25 480');
    Maps_SpawnTeamKey(TEAM_RED,'-736 -426 480');

    Maps_TeamSpawn(TEAM_RED,'-532 -328 651','0 0 0');
    Maps_TeamSpawn(TEAM_RED,'-532 -454 651','0 0 0');
    Maps_TeamSpawn(TEAM_RED,'-532 -565 651','0 0 0');
    Maps_TeamSpawn(TEAM_RED,'-532 -664 651','0 0 0');
    Maps_TeamSpawn(TEAM_RED,'-286 -651 651','0 180 0');
    Maps_TeamSpawn(TEAM_RED,'-286 -374 651','0 180 0');
    Maps_TeamSpawn(TEAM_RED,'-437 -499 662','0 0 0');

    

    Maps_SpawnWeaponSuperShotgun(TEAM_RED,'-337 -622 480');
    Maps_SpawnItemShells(TEAM_RED,TRUE,'-288 -726 480');
    Maps_SpawnItemShells(TEAM_RED,TRUE,'-320 -726 480');
    Maps_SpawnItemShells(TEAM_RED,TRUE,'-352 -726 480');
    Maps_SpawnItemShells(TEAM_RED,TRUE,'-384 -726 480');
    Maps_SpawnItemShells(TEAM_RED,TRUE,'-288 -694 480');
    Maps_SpawnItemShells(TEAM_RED,TRUE,'-320 -694 480');
    Maps_SpawnItemShells(TEAM_RED,TRUE,'-352 -694 480');
    Maps_SpawnItemShells(TEAM_RED,TRUE,'-384 -694 480');

    Maps_SpawnWeaponNailgun(TEAM_RED,'-338 -385 480');
    Maps_SpawnItemSpikes(TEAM_RED,TRUE,'-288 -290 480');
    Maps_SpawnItemSpikes(TEAM_RED,TRUE,'-320 -290 480');
    Maps_SpawnItemSpikes(TEAM_RED,TRUE,'-352 -290 480');
    Maps_SpawnItemSpikes(TEAM_RED,TRUE,'-384 -290 480');
    Maps_SpawnItemSpikes(TEAM_RED,TRUE,'-288 -322 480');
    Maps_SpawnItemSpikes(TEAM_RED,TRUE,'-320 -322 480');
    Maps_SpawnItemSpikes(TEAM_RED,TRUE,'-352 -322 480');
    Maps_SpawnItemSpikes(TEAM_RED,TRUE,'-384 -322 480');

    Maps_SpawnArmor1(TEAM_RED,'-588 -719 488');
    Maps_SpawnArmor1(TEAM_RED,'-540 -719 488');
    Maps_SpawnArmor1(TEAM_RED,'-492 -719 488');

    Maps_SpawnHealth(TEAM_RED,'-494 -285 480');
    Maps_SpawnHealth(TEAM_RED,'-526 -285 480');
    Maps_SpawnHealth(TEAM_RED,'-558 -285 480');
    Maps_SpawnHealth(TEAM_RED,'-590 -285 480');
    Maps_SpawnHealth(TEAM_RED,'-494 -317 480');
    Maps_SpawnHealth(TEAM_RED,'-526 -317 480');
    Maps_SpawnHealth(TEAM_RED,'-558 -317 480');
    Maps_SpawnHealth(TEAM_RED,'-590 -317 480');


    // Yellow armors
    Maps_SpawnArmor2(TEAM_ALL,'-86 4 488'); // Courtyard
    Maps_SpawnArmor2(TEAM_ALL,'794 72 320'); // Blue Bridge
    
    // Mega health
    Maps_SpawnHealthMega(TEAM_ALL,'399 -1370 432');

    // Red armor
    Maps_SpawnArmorInv(TEAM_ALL,'1766 -569 280');

    // Rocket
    Maps_SpawnWeaponRocketLauncher(TEAM_ALL,'1335 -543 400');
    Maps_SpawnItemRockets(TEAM_ALL,TRUE,'877 -634 216');
    Maps_CreateTeleportDestination("tele_rocket",'1093 -390 483',0);

    // Super nailgun
    Maps_SpawnWeaponSuperNailgun(TEAM_ALL,'582 -1014 432');
    Maps_SpawnItemSpikes(TEAM_ALL,FALSE,'542 -1255 432');

    // Grenade launcher
    Maps_SpawnWeaponGrenadeLauncher(TEAM_ALL,'1397 230 320');
    Maps_SpawnHealthRotten(TEAM_ALL,'1520 211 320');
    Maps_SpawnItemRockets(TEAM_ALL,FALSE,'1520 290 320');


    // Lightning gun
    Maps_SpawnWeaponLightning(TEAM_ALL,'607 323 92');
    Maps_SpawnItemCells(TEAM_ALL,TRUE,'777 95 92');
    Maps_SpawnItemCells(TEAM_ALL,TRUE,'777 162 92');
    Maps_SpawnItemCells(TEAM_ALL,TRUE,'617 713 200');
    Maps_SpawnItemCells(TEAM_ALL,TRUE,'617 762 200');

    Maps_SpawnHealth(TEAM_ALL,'862 577 200');

    // Stairs at the water secret area
    Maps_CreateStairs("*17",'348 15 -403','348 181 -248','0 0 0',12);

    // Bases
    Maps_CreateFlagBase("Courtyard",'-97 210 320');
    Maps_CreateFlagBase("Bridge entrance",'1101 653 312');
    Maps_CreateFlagBase("Nail traps",'2050 -248 330');
    Maps_CreateFlagBase("Checker corridor",'396 -998 432');
    Maps_CreateFlagBase("Stairwell",'1679 -712 360');
}