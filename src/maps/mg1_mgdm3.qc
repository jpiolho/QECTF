void() PostPopulate_mgdm3 =
{
    // Remove apartment door
    Maps_RemoveEntitiesByModel("*37");

    // Teleports
    // t1 = blue bottom left (from slime)
    // t2 = blue bottom center (from red box left, red box top, red box front, quad room)
    // t3 = blue bottom right (unused?)
    // t4 = quad room (from lava bridge)
    // t5 = red bottom center (only) (from blue box ahead, blue box top)
    // t6 = blue bottom duct (unused?)
    // t7 = red bottom duct (from blue box left)
    // t8 = center bottom duct (from blue box right, red box right)

    // Remove base bottom teleports
    Maps_RemoveEntitiesByTarget("t2");
    Maps_RemoveEntitiesByTarget("t5");

    // Remove teleport to quad room
    Maps_RemoveEntitiesByTarget("t4");

    // Remove duct teleports
    Maps_RemoveEntitiesByTarget("t6");
    Maps_RemoveEntitiesByTarget("t7");
    Maps_RemoveEntitiesByTarget("t8");
}
void() Populate_mgdm3 =
{
    // General stuff
    ctf_gamemode = GAMEMODE_DEFAULT;
    Maps_CleanEntities();
    Maps_SetNextLevel("dm3");
    Maps_SetFlags(MAP_FL_TRANSLOCATOR);

    // Lightning bridge grate to close broken bar gap?
    // Maps_CreateWall("*4",'0 0 224','0 0 0');

    // Lava bridge
    Maps_CreateWall("*11",'0 0 56','0 0 0');

    // Blue side grate
    Maps_CreateWall("*66",'0 0 384','0 0 180');
    Maps_CreateWall("*66",'0 0 640','0 0 0');

    // Red side grate
    Maps_CreateWall("*67",'-128 0 384','0 0 180');
    Maps_CreateWall("*67",'-128 0 640','0 0 0');

    // Flags
    Maps_SpawnTeamKey(TEAM_BLUE,'-675 0 380');
    Maps_SpawnTeamKey(TEAM_RED, '900 0 316');

    // Blue Team Spawns
    Maps_TeamSpawn(TEAM_BLUE,'-820 0 376','0 0 0');
    Maps_TeamSpawn(TEAM_BLUE,'-670 -610 376','0 25 0');
    Maps_TeamSpawn(TEAM_BLUE,'-710 610 376','0 -25 0');
    Maps_TeamSpawn(TEAM_BLUE,'-711 -390 376','0 30 0');

    // Red Team Spawns
    Maps_TeamSpawn(TEAM_RED,'995 0 312','0 -180 0');
    Maps_TeamSpawn(TEAM_RED,'1000 515 312','0 -160 0');
    Maps_TeamSpawn(TEAM_RED,'1015 -555 312','0 145 0');
    Maps_TeamSpawn(TEAM_RED,'1000 255 312','10 -170 0');

    // Blue RL
    Maps_SpawnItemRockets(TEAM_ALL,TRUE,'-45 -15 248');
    Maps_SpawnWeaponRocketLauncher(TEAM_ALL,'-20 0 250');
    Maps_SpawnItemRockets(TEAM_ALL,TRUE,'-45 15 248');

    // Red RL
    Maps_SpawnItemRockets(TEAM_ALL,TRUE,'415 -35 248');
    Maps_SpawnWeaponRocketLauncher(TEAM_ALL,'435 0 250');
    Maps_SpawnItemRockets(TEAM_ALL,TRUE,'415 -25 248');

    // Slime LG
    Maps_SpawnWeaponLightning(TEAM_ALL,'290 0 24');
    Maps_SpawnItemCells(TEAM_ALL,TRUE,'220 -20 24');
    Maps_SpawnItemCells(TEAM_ALL,TRUE,'325 -20 24');
    Maps_SpawnItemCells(TEAM_ALL,TRUE,'270 -70 24');
    Maps_SpawnItemCells(TEAM_ALL,TRUE,'270 30 24');

    // Blue SS
    Maps_SpawnWeaponSuperShotgun(TEAM_ALL,'-565 345 376');
    Maps_SpawnItemShells(TEAM_ALL,TRUE,'-615 375 376');
    Maps_SpawnItemShells(TEAM_ALL,TRUE,'-615 320 376');

    // Red SS
    Maps_SpawnWeaponSuperShotgun(TEAM_ALL,'740 -260 312');
    Maps_SpawnItemShells(TEAM_ALL,TRUE,'785 -295 312');
    Maps_SpawnItemShells(TEAM_ALL,TRUE,'785 -255 312');

    // Blue GL
    Maps_SpawnItemRockets(TEAM_ALL,TRUE,'-630 -765 376');
    Maps_SpawnWeaponGrenadeLauncher(TEAM_ALL,'-620 -675 380');
    Maps_SpawnItemRockets(TEAM_ALL,TRUE,'-565 -725 376');

    // Red GL
    Maps_SpawnItemRockets(TEAM_ALL,TRUE,'970 415 312');
    Maps_SpawnWeaponGrenadeLauncher(TEAM_ALL,'925 415 316');
    Maps_SpawnItemRockets(TEAM_ALL,TRUE,'850 415 312');

    // Upper room red
    Maps_SpawnArmorInv(TEAM_ALL,'225 -385 380');

    // Lava bridge red
    Maps_SpawnArmorInv(TEAM_ALL,'285 925 28');

    // Blue base
    Maps_SpawnArmor1(TEAM_BLUE,'-800 260 376');
    Maps_SpawnArmor1(TEAM_BLUE,'-540 -390 376');
    Maps_SpawnArmor1(TEAM_BLUE,'-840 -150 376');

    // Left side health
    Maps_SpawnHealth(TEAM_BLUE,'-815 500 376');
    Maps_SpawnHealth(TEAM_BLUE,'-825 430 376');

    // Right forward health
    Maps_SpawnHealth(TEAM_BLUE,'-565 -322 376');
    Maps_SpawnHealth(TEAM_BLUE,'-620 -430 376');

    // Flag health
    Maps_SpawnHealth(TEAM_BLUE,'-690 40 376');
    Maps_SpawnHealth(TEAM_BLUE,'-740 -20 376');
    Maps_SpawnHealth(TEAM_BLUE,'-690 -75 376');
    Maps_SpawnHealth(TEAM_BLUE,'-635 -20 376');

    // Right back health
    Maps_SpawnHealth(TEAM_BLUE,'-840 -310 376');
    Maps_SpawnHealth(TEAM_BLUE,'-815 -360 376');

    // Blue side yellow
    Maps_SpawnArmor2(TEAM_ALL,'-545 485 28');

    // Red base
    Maps_SpawnArmor1(TEAM_RED,'1015 -375 312');
    Maps_SpawnArmor1(TEAM_RED,'1030 0 312');
    Maps_SpawnArmor1(TEAM_RED,'725 255 312');

    // Flag health
    Maps_SpawnHealth(TEAM_RED,'960 -20 312');
    Maps_SpawnHealth(TEAM_RED,'810 -20 312');
    Maps_SpawnHealth(TEAM_RED,'880 55 312');
    Maps_SpawnHealth(TEAM_RED,'880 -95 312');

    // Left health
    Maps_SpawnHealth(TEAM_RED,'960 -600 312');
    Maps_SpawnHealth(TEAM_RED,'875 -615 312');

    // Back health
    Maps_SpawnHealth(TEAM_RED,'1030 -245 312');
    Maps_SpawnHealth(TEAM_RED,'1030 195 312');

    // Right health
    Maps_SpawnHealth(TEAM_RED,'855 520 312');
    Maps_SpawnHealth(TEAM_RED,'950 520 312');


    // Red side yellow
    Maps_SpawnArmor2(TEAM_ALL,'755 -395 24');

    // Top bridge
    Maps_SpawnHealthMega(TEAM_ALL,'210 -15 376');

    // Quad platform
    Maps_SpawnHealthMega(TEAM_ALL,'30 605 -8');

    // Slime tube
    Maps_SpawnArmorInv(TEAM_ALL,'25 0 -375');
    Maps_SpawnHealthMega(TEAM_ALL,'120 -15 -408');

    // Upper "pipe" room
    Maps_SpawnWeaponSuperNailgun(TEAM_ALL,'295 -390 504');
    Maps_SpawnWeaponNailgun(TEAM_ALL,'290 -310 504');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'220 -420 504');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'150 -420 504');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'120 -420 504');

    // Smasher apartment
    Maps_SpawnWeaponSuperNailgun(TEAM_ALL,'500 600 408');
    Maps_SpawnWeaponNailgun(TEAM_ALL,'500 700 408');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'400 550 408');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'400 625 504');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'400 700 504');
}
