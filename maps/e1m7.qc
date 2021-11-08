void() PostPopulate_e1m7 =
{
    // Bridge button
    Maps_RemoveEntitiesByModel("*16");
    // Piston-lowering buttons
    Maps_RemoveEntitiesByModel("*17");
    Maps_RemoveEntitiesByModel("*21");
    // Lightning button
    Maps_RemoveEntitiesByModel("*13");
}
void() Populate_e1m7 =
{
    ctf_gamemode = GAMEMODE_DEFAULT;

    Maps_CleanEntities();
    Maps_SetNextLevel("dm3");

    // Level exit teleport
    Maps_CreateTeleportDestination("tele_exit",'800 65 24', 180);
    Maps_CreateTeleport("tele_exit",'1020 55 -1050','48 48 48',TEAM_ALL,TRUE);

    // Exit bridge
    Maps_CreateWall("*8",'0 0 0','0 0 0');
    Maps_CreateWall("*9",'0 0 0','0 0 0');

    // Blocking columns
    Maps_CreateWall("*10",'0 0 -64','0 0 0');
    Maps_CreateWall("*10",'0 -72 -64','0 0 0');
    Maps_CreateWall("*10",'0 -72 256','0 0 0');
    Maps_CreateWall("*10",'0 -144 -64','0 0 0');
    Maps_CreateWall("*10",'0 -144 256','0 0 0');
    Maps_CreateWall("*10",'0 -216 -64','0 0 0');
    Maps_CreateWall("*10",'0 -216 256','0 0 0');
    Maps_CreateWall("*11",'0 144 -64','0 0 0');
    Maps_CreateWall("*11",'0 144 256','0 0 0');
    Maps_CreateWall("*11",'0 72 -64','0 0 0');
    Maps_CreateWall("*11",'0 72 256','0 0 0');
    Maps_CreateWall("*11",'0 0 -64','0 0 0');

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

    Maps_SpawnItemRockets(TEAM_RED,TRUE,'-60 40 8');
    Maps_SpawnWeaponRocketLauncher(TEAM_RED,'-15 65 8');
    Maps_SpawnItemRockets(TEAM_RED,TRUE,'-60 70 8');

    Maps_SpawnItemShells(TEAM_RED,TRUE,'-270 -255  56');
    Maps_SpawnItemShells(TEAM_RED,TRUE,'-270  385  56');
    Maps_SpawnItemShells(TEAM_RED,TRUE,'-270 -230  232');
    Maps_SpawnItemShells(TEAM_RED,TRUE,'-270  350  232');

    Maps_SpawnHealth(TEAM_BLUE,'1004 270 -8');
    Maps_SpawnArmor1(TEAM_BLUE,'1024 215 -8');
    Maps_SpawnHealth(TEAM_BLUE,'1004 120 -8');
    Maps_SpawnWeaponSuperShotgun(TEAM_BLUE,'1024 65 -8');
    Maps_SpawnHealth(TEAM_BLUE,'1004 -30 -8');
    Maps_SpawnArmor1(TEAM_BLUE,'1024 -85 -8');
    Maps_SpawnHealth(TEAM_BLUE,'1004 -180 -8');

    Maps_SpawnItemShells(TEAM_BLUE,TRUE,' 1004  385 -8');
    Maps_SpawnItemShells(TEAM_BLUE,TRUE,' 1004 -255 -8');
    Maps_SpawnItemShells(TEAM_BLUE,TRUE,' 1004  350  216');
    Maps_SpawnItemShells(TEAM_BLUE,TRUE,' 1004 -230  216');

    Maps_SpawnItemRockets(TEAM_BLUE,TRUE,'720 70 24');
    Maps_SpawnWeaponRocketLauncher(TEAM_BLUE,'695 65 24');
    Maps_SpawnItemRockets(TEAM_BLUE,TRUE,'720 40 24');

    Maps_SpawnArmor2(TEAM_BLUE,'1225 65 -8');
    Maps_SpawnArmor2(TEAM_RED,'-440 65 56');

    Maps_SpawnArmorInv(TEAM_ALL,'705 -355 280');
    Maps_SpawnHealthMega(TEAM_ALL,'108 -375 280');
    Maps_SpawnArmorInv(TEAM_ALL,'128 485 280');
    Maps_SpawnHealthMega(TEAM_ALL,'685 465 280');
}
