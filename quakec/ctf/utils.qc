/*
Find the next player in a certain team
*/

entity findPlayerInTeam(float findTeam,entity start) {
    local entity ent = start;
    while((ent = find(ent,classname,"player"))) {
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


void stuffcmdTeamColor(entity t) {

    if(ctf_host == self)
        stuffcmd(t,"color 0 0\n");
    else if(t.ctfTeam == TEAM_BLUE) {
        stuffcmd(t,"color "PLAYERCOLOR_BLUE" "PLAYERCOLOR_BLUE"\n");
    } else if(t.ctfTeam == TEAM_RED) {
        stuffcmd(t,"color "PLAYERCOLOR_RED" "PLAYERCOLOR_RED"\n");
    }
}

entity ctf_findFlagBase(entity ent) {
    while((ent = find(ent,classname,"ctf_base")))
        return ent;
}


entity ctf_randomEntity(float(entity) condition) {
    local float count = 0;
    local entity ent = world;
    local entity previousEnt = world;
    while((ent = nextent(ent))) {
        if(condition(ent))
        {
            ent.goalentity = previousEnt;
            previousEnt = ent;
            count++;
        }
    }

    count--;
    count = rint(random() * count);
    ent = previousEnt;

    while(count-- > 0)
        ent = ent.goalentity;
    
    return ent;
}

entity ctf_findFlag(entity start, float findTeam, float inactive=FALSE) {
    local entity ent = start;

    while((ent = find(ent,classname,"ctf_flag"))) {
        if(ent.team != findTeam)
            continue;

        // Ignore inactive flags
        if(!inactive && ent.solid == SOLID_NOT)
            continue;

        return ent;
    }
    
    return world;
}

/*
 * Returns the opposite team
 */
float ctf_oppositeTeam(float t) {
    if(t == TEAM_BLUE)
        return TEAM_RED;
    else if(t == TEAM_RED)
        return TEAM_BLUE;
    else
        return t;
}

/*
 * Returns TRUE if the player <p> has a flag
 */
float ctf_playerHasFlag(entity p) {
    return p.items & (IT_KEY1 | IT_KEY2);
}

inline float ctf_getPlayerTeam(entity p) {
    return p.ctfTeam;
}