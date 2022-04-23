void() PostPopulate_DM3 =
{
    // Fix teleporters
    Maps_FindEntityByTarget("t1").team = TEAM_RED;
    Maps_FindEntityByTarget("t2").team = TEAM_BLUE;

}

void() Populate_DM3 =
{
    ctf_gamemode = GAMEMODE_DEFAULT;
    
    Maps_CleanEntities();
    Maps_SetNextLevel("dm6");
    Maps_SetFlags(MAP_FL_TRANSLOCATOR);

    Maps_SpawnHealthMega(TEAM_ALL,'564 -48 -192');
Maps_SpawnTeamKey(TEAM_RED,'1984 -448 0');
Maps_TeamSpawn(TEAM_RED,'1872 -912 -24','0 180 0');
Maps_TeamSpawn(TEAM_RED,'1680 -640 -24','0 270 0');
Maps_TeamSpawn(TEAM_RED,'1504 -912 -24','0 90 0');
Maps_SpawnWeaponSuperShotgun(TEAM_RED,'1680 -720 -48');
Maps_SpawnItemShells(TEAM_RED,FALSE,'1856 -648 -48');
Maps_SpawnItemShells(TEAM_RED,FALSE,'1816 -648 -48');
Maps_SpawnItemShells(TEAM_RED,FALSE,'1776 -648 -48');
Maps_SpawnItemShells(TEAM_RED,FALSE,'1736 -648 -48');
Maps_SpawnWeaponNailgun(TEAM_RED,'1168 464 32');
Maps_SpawnItemSpikes(TEAM_RED,FALSE,'1104 336 32');
Maps_SpawnItemSpikes(TEAM_RED,FALSE,'1144 336 32');
Maps_SpawnItemSpikes(TEAM_RED,FALSE,'1184 336 32');
Maps_SpawnItemSpikes(TEAM_RED,FALSE,'1224 336 32');
Maps_SpawnItemRockets(TEAM_RED,FALSE,'1752 -488 -48');
Maps_SpawnItemRockets(TEAM_RED,FALSE,'1704 -488 -48');
Maps_SpawnArmor2(TEAM_ALL,'1856 648 -204');
Maps_SpawnArmor2(TEAM_ALL,'-728 96 160');
Maps_SpawnTeamKey(TEAM_BLUE,'-640 -432 8');
Maps_SpawnArmorInv(TEAM_ALL,'256 -704 304');
Maps_SpawnWeaponRocketLauncher(TEAM_ALL,'728 -32 -192');
Maps_SpawnWeaponGrenadeLauncher(TEAM_ALL,'944 -32 32');
Maps_SpawnItemRockets(TEAM_BLUE,FALSE,'-552 752 -40');
Maps_SpawnItemRockets(TEAM_BLUE,FALSE,'-552 720 -40');
Maps_TeamSpawn(TEAM_BLUE,'-672 480 136','0 0 0');
Maps_TeamSpawn(TEAM_BLUE,'-344 408 200','0 0 0');
Maps_SpawnWeaponSuperShotgun(TEAM_BLUE,'-208 512 -24');
Maps_TeamSpawn(TEAM_BLUE,'-592 392 112','0 90 0');
Maps_TeamSpawn(TEAM_BLUE,'-712 624 120','0 180 0');
Maps_SpawnItemShells(TEAM_BLUE,FALSE,'-872 536 -40');
Maps_SpawnItemShells(TEAM_BLUE,FALSE,'-872 576 -40');
Maps_SpawnItemShells(TEAM_BLUE,FALSE,'-872 616 -40');
Maps_SpawnItemShells(TEAM_BLUE,FALSE,'-872 656 -40');
Maps_SpawnWeaponNailgun(TEAM_BLUE,'24 -696 -40');
Maps_SpawnItemSpikes(TEAM_BLUE,FALSE,'400 -808 -40');
Maps_SpawnItemSpikes(TEAM_BLUE,FALSE,'400 -760 -40');
Maps_SpawnItemSpikes(TEAM_BLUE,FALSE,'400 -712 -40');
Maps_SpawnItemSpikes(TEAM_BLUE,FALSE,'400 -664 -40');
Maps_SpawnItemSpikes(TEAM_BLUE,FALSE,'400 -616 -40');
Maps_SpawnItemSpikes(TEAM_ALL,FALSE,'248 -48 32');
Maps_SpawnItemRockets(TEAM_ALL,FALSE,'872 -48 32');
Maps_SpawnHealth(TEAM_RED,'1496 -648 -48');
Maps_SpawnHealth(TEAM_RED,'1528 -648 -48');
Maps_SpawnHealth(TEAM_RED,'1560 -648 -48');
Maps_SpawnHealth(TEAM_RED,'1592 -648 -48');
Maps_SpawnHealth(TEAM_RED,'1640 -816 -48');
Maps_SpawnHealth(TEAM_RED,'1544 -816 -48');
Maps_SpawnHealth(TEAM_RED,'1576 -816 -48');
Maps_SpawnHealth(TEAM_RED,'1608 -816 -48');
Maps_SpawnArmor1(TEAM_RED,'1368 -800 -48');
Maps_SpawnArmor1(TEAM_RED,'1328 -800 -48');
Maps_SpawnArmor1(TEAM_RED,'1288 -800 -48');
Maps_SpawnWeaponSuperShotgun(TEAM_BLUE,'-824 392 -40');
Maps_TeamSpawn(TEAM_BLUE,'-800 392 128','0 90 0');
Maps_SpawnArmor1(TEAM_BLUE,'-608 536 -40');
Maps_SpawnArmor1(TEAM_BLUE,'-608 480 -40');
Maps_SpawnArmor1(TEAM_BLUE,'-664 416 -40');
Maps_SpawnItemShells(TEAM_BLUE,FALSE,'-288 368 -40');
Maps_SpawnItemShells(TEAM_BLUE,FALSE,'-288 408 -40');
Maps_SpawnItemShells(TEAM_BLUE,FALSE,'-288 448 -40');
Maps_SpawnWeaponSuperNailgun(TEAM_ALL,'208 -32 32');
Maps_SpawnItemRockets(TEAM_ALL,FALSE,'768 -32 -224');
Maps_SpawnHealth(TEAM_BLUE,'-688 208 -40');
Maps_SpawnHealth(TEAM_BLUE,'-656 208 -40');
Maps_SpawnHealth(TEAM_BLUE,'-688 240 -40');
Maps_SpawnHealth(TEAM_BLUE,'-656 240 -40');
Maps_SpawnHealth(TEAM_BLUE,'-576 208 -40');
Maps_SpawnHealth(TEAM_BLUE,'-544 208 -40');
Maps_SpawnHealth(TEAM_BLUE,'-576 240 -40');
Maps_SpawnHealth(TEAM_BLUE,'-544 240 -40');
Maps_TeamSpawn(TEAM_RED,'1864 -808 -24','0 180 0');
Maps_TeamSpawn(TEAM_RED,'1488 -848 96','0 90 0');

    
    
    

}