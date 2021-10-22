/*
Find the next player in a certain team
*/
entity findPlayerInTeam(float findTeam,entity start) {
    local entity ent = start;
    while(ent = find(ent,classname,"player")) {
        if(ent.team == findTeam)
            return ent;
    }

    return FALSE;
}

entity findPlayer(entity start) {
    return find(start,classname,"player");
}

entity findPlayerSpawn(entity start,float findTeam) {
    local entity ent = start;

    while(1) {
        ent = find(ent,classname,"info_player_deathmatch");

        if(!ent)
            return findPlayerSpawn(world,findTeam);

        if(ent.team != TEAM_ALL || ent.team != findTeam)
            continue;

        return ent;
    }
    
    return FALSE;
}