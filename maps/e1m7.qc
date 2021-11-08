void() PostPopulate_e1m7 =
{
    // Extend bridge and remove button
    Maps_FindEntityByModel("*8").origin = '0 0 0';
    Maps_FindEntityByModel("*9").origin = '0 0 0';
    Maps_RemoveEntitiesByModel("*16");
}
void() Populate_e1m7 =
{
    ctf_gamemode = GAMEMODE_DEFAULT;

    Maps_CleanEntities();
    Maps_SetNextLevel("dm3");

    // Level exit teleport
    Maps_CreateTeleportDestination("tele_exit",'800 65 24', 180);
    Maps_CreateTeleport("tele_exit",'1020 55 -1050','48 48 48',TEAM_ALL,TRUE);

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

    Maps_SpawnWeaponGrenadeLauncher(TEAM_ALL,'350 -330 216');

    Maps_SpawnWeaponGrenadeLauncher(TEAM_ALL,'350  460 216');

    Maps_SpawnItemCells(TEAM_ALL,TRUE,'410 440 56');
    Maps_SpawnWeaponLightning(TEAM_ALL,'350  460 56');
    Maps_SpawnItemCells(TEAM_ALL,TRUE,'260 440 56');

    Maps_SpawnItemCells(TEAM_ALL,TRUE,'410 -350 56');
    Maps_SpawnWeaponLightning(TEAM_ALL,'350 -330 56');
    Maps_SpawnItemCells(TEAM_ALL,TRUE,'260 -350 56');

    Maps_SpawnHealth(TEAM_RED,'-270 270 56');
    Maps_SpawnArmor1(TEAM_RED,'-250 215 56');
    Maps_SpawnHealth(TEAM_RED,'-270 120 56');
    Maps_SpawnWeaponSuperShotgun(TEAM_RED,'-250 65 56');
    Maps_SpawnHealth(TEAM_RED,'-270 -30 56');
    Maps_SpawnArmor1(TEAM_RED,'-250 -85 56');
    Maps_SpawnHealth(TEAM_RED,'-270 -180 56');

    Maps_SpawnItemRockets(TEAM_RED,FALSE,'-60 40 8');
    Maps_SpawnWeaponRocketLauncher(TEAM_RED,'-15 65 8');
    Maps_SpawnItemRockets(TEAM_RED,FALSE,'-60 70 8');

    Maps_SpawnHealth(TEAM_BLUE,'1004 270 -8');
    Maps_SpawnArmor1(TEAM_BLUE,'1024 215 -8');
    Maps_SpawnHealth(TEAM_BLUE,'1004 120 -8');
    Maps_SpawnWeaponSuperShotgun(TEAM_BLUE,'1024 65 -8');
    Maps_SpawnHealth(TEAM_BLUE,'1004 -30 -8');
    Maps_SpawnArmor1(TEAM_BLUE,'1024 -85 -8');
    Maps_SpawnHealth(TEAM_BLUE,'1004 -180 -8');

    // On edge of exit (workaround with gross/crowded placement)
    Maps_SpawnItemRockets(TEAM_BLUE,FALSE,'765 35 24');
    Maps_SpawnWeaponRocketLauncher(TEAM_BLUE,'765 65 24');
    Maps_SpawnItemRockets(TEAM_BLUE,FALSE,'765 60 24');

    // On bridge (presently doesn't work)
    // Maps_SpawnItemRockets(TEAM_BLUE,FALSE,'720 70 24');
    // Maps_SpawnWeaponRocketLauncher(TEAM_BLUE,'695 65 24');
    // Maps_SpawnItemRockets(TEAM_BLUE,FALSE,'720 40 24');

    // TODO put some of these on the map?
    // Maps_SpawnItemShells(TEAM_ALL,FALSE,'480 -1872 144');
    // Maps_SpawnArmor1(TEAM_ALL,'232 -1512 16');
    // Maps_SpawnArmor2(TEAM_ALL,'528 -1080 -304');
    // Maps_SpawnArmorInv(TEAM_ALL,'896 -1456 232');
    // Maps_SpawnHealthMega(TEAM_ALL,'-8 -1112 240');
    // Maps_SpawnHealth(TEAM_ALL,'1800 -168 144');
}
