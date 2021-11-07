void() PostPopulate_e3m6 =
{
    // Remove things
    Maps_RemoveEntitiesByTargetName("t161");
    Maps_RemoveEntitiesByTarget("t89");
    Maps_RemoveEntitiesByTargetName("t83");
    Maps_RemoveEntitiesByTarget("t83");

}

void() Populate_e3m6 =
{
    ctf_gamemode = GAMEMODE_DEFAULT;
    
    Maps_CleanEntities();
    Maps_SetNextLevel("dm3");

    // Platform for spawns at RED base
    Maps_CreateWall("*7",'-370 -896 -144','0 0 0');
    Maps_CreateWall("*7",'-237 -896 -144','0 0 0');
    Maps_CreateWall("*7",'-101 -896 -144','0 0 0');
    Maps_CreateWall("*7",'-101 -800 -144','0 0 0');
    Maps_CreateWall("*7",'-101 -704 -144','0 0 0');
    Maps_CreateWall("*7",'-101 -608 -144','0 0 0');

    Maps_CreateWall("*4",'439 -139 219','0 0 0'); // Top platform


    // Anti-stuck walls at RED base pillars
    /*
    Maps_CreateWall("*61",'162 965 107','0 0 0');
    Maps_CreateWall("*61",'191 965 107','0 0 0');
    Maps_CreateWall("*61",'225 965 107','0 0 0');
    Maps_CreateWall("*61",'-304 965 107','0 0 0');
    Maps_CreateWall("*61",'-278 965 107','0 0 0');
    Maps_CreateWall("*61",'-252 965 107','0 0 0');
    */
    Maps_CreateWall("*29",'1005 -40 428','0 0 0');
    Maps_CreateWall("*29",'966 -40 428','0 0 0');
    Maps_CreateWall("*29",'533 -40 428','0 0 0');
    Maps_CreateWall("*29",'502 -40 428','0 0 0');

    Maps_CreateTeleportDestination("tele_redbase",'709 -2422 509',180);
    Maps_CreateTeleport("tele_redbase",'708 -2423 152','48 48 48',TEAM_RED,TRUE);


    // Platform and teleport for RED bridge
    Maps_CreateWall("*7",'-512 -1327 -272','0 0 0');
    Maps_CreateTeleportDestination("tele_redbridge",'286 -3249 266',270);
    Maps_CreateTeleport("tele_redbridge",'290 -3144 24','48 48 48',TEAM_ALL,TRUE);


    Maps_TeamSpawn(TEAM_BLUE,'-1760 -608 104','0 0 0');
Maps_TeamSpawn(TEAM_BLUE,'-1760 -352 104','0 0 0');
Maps_TeamSpawn(TEAM_BLUE,'-1856 -64 -176','0 270 0');
Maps_SpawnWeaponSuperShotgun(TEAM_BLUE,'-1840 -480 64');
Maps_SpawnHealth(TEAM_BLUE,'-2032 -544 64');
Maps_SpawnHealth(TEAM_BLUE,'-1984 -544 64');
Maps_SpawnHealth(TEAM_BLUE,'-1984 -496 64');
Maps_SpawnHealth(TEAM_BLUE,'-2032 -496 64');
Maps_SpawnHealth(TEAM_BLUE,'-1984 -448 64');
Maps_SpawnHealth(TEAM_BLUE,'-2032 -448 64');
Maps_SpawnItemShells(TEAM_BLUE,FALSE,'-2016 -640 64');
Maps_SpawnItemShells(TEAM_BLUE,FALSE,'-1984 -640 64');
Maps_SpawnItemShells(TEAM_BLUE,FALSE,'-1952 -640 64');
Maps_SpawnItemShells(TEAM_BLUE,FALSE,'-1920 -640 64');
Maps_SpawnItemSpikes(TEAM_BLUE,FALSE,'-1952 -352 64');
Maps_SpawnItemSpikes(TEAM_BLUE,FALSE,'-1984 -352 64');
Maps_SpawnItemSpikes(TEAM_BLUE,FALSE,'-2016 -352 64');
Maps_SpawnItemSpikes(TEAM_BLUE,FALSE,'-1920 -352 64');
Maps_SpawnItemRockets(TEAM_ALL,FALSE,'-816 -592 -224');
Maps_SpawnHealthMega(TEAM_ALL,'-880 -576 -224');
Maps_SpawnItemRockets(TEAM_ALL,FALSE,'-816 -528 -224');
Maps_SpawnTeamKey(TEAM_BLUE,'-1088 -288 48');
Maps_TeamSpawn(TEAM_BLUE,'-1744 -480 104','0 180 0');
Maps_SpawnArmor1(TEAM_BLUE,'-2000 -576 64');
Maps_SpawnArmor1(TEAM_BLUE,'-1904 -576 64');
Maps_SpawnArmor1(TEAM_BLUE,'-1888 -384 64');
Maps_SpawnArmor1(TEAM_BLUE,'-2016 -384 64');
Maps_SpawnWeaponNailgun(TEAM_BLUE,'-928 -864 128');
Maps_SpawnArmor2(TEAM_BLUE,'-1264 -864 128');
Maps_SpawnTeamKey(TEAM_RED,'288 -3456 152');
Maps_TeamSpawn(TEAM_RED,'64 -2416 512','0 270 0');
Maps_SpawnWeaponSuperShotgun(TEAM_RED,'288 -2528 408');
Maps_SpawnItemShells(TEAM_RED,TRUE,'208 -2576 424');
Maps_SpawnItemShells(TEAM_RED,TRUE,'208 -2544 424');
Maps_SpawnItemShells(TEAM_RED,TRUE,'208 -2512 424');
Maps_SpawnItemSpikes(TEAM_RED,TRUE,'336 -2576 424');
Maps_SpawnItemSpikes(TEAM_RED,TRUE,'336 -2544 424');
Maps_SpawnItemSpikes(TEAM_RED,TRUE,'336 -2512 424');
Maps_SpawnArmor1(TEAM_RED,'-32 -2400 408');
Maps_SpawnArmor1(TEAM_RED,'16 -2400 408');
Maps_SpawnArmor1(TEAM_RED,'64 -2400 408');
Maps_SpawnHealth(TEAM_RED,'384 -2416 408');
Maps_SpawnHealth(TEAM_RED,'416 -2416 408');
Maps_SpawnHealth(TEAM_RED,'448 -2416 408');
Maps_SpawnHealth(TEAM_RED,'480 -2416 408');
Maps_SpawnHealth(TEAM_RED,'512 -2416 408');
Maps_SpawnHealth(TEAM_RED,'544 -2416 408');
Maps_SpawnWeaponNailgun(TEAM_RED,'304 -3024 0');
Maps_SpawnWeaponRocketLauncher(TEAM_ALL,'576 -1152 -48');
Maps_SpawnWeaponSuperNailgun(TEAM_ALL,'288 -1632 0');
Maps_SpawnWeaponGrenadeLauncher(TEAM_ALL,'816 -1408 56');
Maps_SpawnItemRockets(TEAM_ALL,FALSE,'608 -1408 56');
Maps_SpawnItemRockets(TEAM_ALL,FALSE,'688 -1328 56');
Maps_SpawnItemRockets(TEAM_RED,FALSE,'512 -2528 408');
Maps_SpawnItemRockets(TEAM_RED,FALSE,'48 -2528 408');
Maps_SpawnArmor2(TEAM_RED,'288 -3040 160');
Maps_SpawnHealth(TEAM_ALL,'112 -1488 -160');
Maps_SpawnHealth(TEAM_ALL,'112 -1440 -160');
Maps_TeamSpawn(TEAM_RED,'224 -2432 512','0 270 0');
Maps_TeamSpawn(TEAM_RED,'304 -2432 512','0 270 0');
Maps_TeamSpawn(TEAM_RED,'512 -2416 512','0 270 0');
Maps_TeamSpawn(TEAM_RED,'64 -2496 624','0 270 0');
Maps_TeamSpawn(TEAM_RED,'512 -2512 624','0 270 0');




}