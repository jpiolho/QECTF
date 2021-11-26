void() PostPopulate_Rogue_ctf1 =
{
    // Delete all info_player_deathmatch that don't belong to a team
    local entity p = world;
    while((p = find(p,classname,"info_player_deathmatch")))
    {
        if(p.team == TEAM_ALL)
            remove(p);
    }
}

void() Populate_Rogue_ctf1 =
{
    ctf_gamemode = GAMEMODE_DEFAULT;

    Maps_SetNextLevel("dm3");
    Maps_SetFlags(MAP_FL_HOOK);
}