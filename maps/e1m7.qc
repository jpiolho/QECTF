void() PostPopulate_e1m7 =
{
    // Fix teleporters
    // TODO Put level exit teleport destination onto walkway
    // Maps_FindEntityByClassnameContainingPoint("trigger_teleport",'1027 -1095 7').target = "t2";
    // Maps_RemoveEntitiesByTarget("t1");
    // Maps_RemoveEntitiesByTarget("t2");    
}
void() Populate_e1m7 =
{
    ctf_gamemode = GAMEMODE_DEFAULT;
    
    Maps_CleanEntities();
    Maps_SetNextLevel("dm3");

    // Flags
    Maps_SpawnTeamKey(TEAM_BLUE,'1024  64 216');
    Maps_SpawnTeamKey(TEAM_RED, '-256    64  232');

    // Blue Team Spawns
    Maps_TeamSpawn(TEAM_BLUE,' 1024  385 -8',   '0 180 0');
    Maps_TeamSpawn(TEAM_BLUE,' 1024 -255 -8',   '0 180 0');
    Maps_TeamSpawn(TEAM_BLUE,' 1024  350  216', '0 180 0');
    Maps_TeamSpawn(TEAM_BLUE,' 1024 -230  216', '0 180 0');

    // Red Team Spawns
    Maps_TeamSpawn(TEAM_RED, '-256 -255  56',     '0 0 0');
    Maps_TeamSpawn(TEAM_RED, '-256  385  56',     '0 0 0');
    Maps_TeamSpawn(TEAM_RED, '-256 -230  232',    '0 0 0');
    Maps_TeamSpawn(TEAM_RED, '-256  350  232',    '0 0 0');

    // TODO put some of these on the map!
    // Maps_SpawnWeaponSuperShotgun(TEAM_ALL,'440 -1880 144');
    // Maps_SpawnWeaponNailgun(TEAM_ALL,'1632 -424 16');
    // Maps_SpawnWeaponSuperNailgun(TEAM_ALL,'1160 -1088 -64');
    // Maps_SpawnWeaponGrenadeLauncher(TEAM_ALL,'1016 -848 232');
    // Maps_SpawnWeaponRocketLauncher(TEAM_ALL,'200 -1112 88');
    // Maps_SpawnWeaponLightning(TEAM_ALL,'760 -1080 -296');
    // Maps_SpawnItemCells(TEAM_ALL,TRUE,'656 -1064 -288');
    // Maps_SpawnItemRockets(TEAM_ALL,FALSE,'464 -2048 16');
    // Maps_SpawnItemShells(TEAM_ALL,FALSE,'480 -1872 144');
    // Maps_SpawnItemSpikes(TEAM_ALL,TRUE,'128 -1616 16');
    // Maps_SpawnArmor1(TEAM_ALL,'232 -1512 16');
    // Maps_SpawnArmor2(TEAM_ALL,'528 -1080 -304');
    // Maps_SpawnArmorInv(TEAM_ALL,'896 -1456 232');
    // Maps_SpawnHealthMega(TEAM_ALL,'-8 -1112 240');
    // Maps_SpawnHealth(TEAM_ALL,'1800 -168 144');
}
