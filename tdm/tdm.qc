void StartItem();


const string SOUND_WIN = "boss2/pop2.wav";
const string SOUND_LOSE = "boss1/pain.wav";
const string SOUND_PICKUP_OWN = "misc/basekey.wav";
const string SOUND_PICKUP_ENEMY = "ogre/ogwake.wav";
const string SOUND_RESPAWN = "items/itembk2.wav";
const string SOUND_RETURNED = "misc/trigger1.wav";


void(entity player) tdm_player_autoAssignTeam =
{
    local float countBlue = 0;
	local float countRed = 0;
	local entity p = world;
	while(p = findPlayer(p))
	{
		if(p.team == TEAM_BLUE)
			countBlue++;
		else if(p.team == TEAM_RED)
			countRed++;
	}

    
    player.team = countBlue <= countRed ? TEAM_BLUE : TEAM_RED;
	
	//player.team = countRed <= countBlue ? TEAM_RED : TEAM_BLUE;
}


float() tdm_GetTeamScore =
{   
    local entity p = world;
    local float team_score = 0;

    // get sum of all frags on players current team
    p = world;
    while(p = findPlayerInTeam(self.team,p) && p != other) {
       team_score += p.frags;
    }

    return team_score;
}

float() tdm_GetEnemyTeamScore =
{   
    local entity p = world;
    local float team_score = 0;

    // get sum of all frags on players current team
    p = world;
    while(p = findPlayerInTeam(self.team,p) && p = other) {
       team_score += p.frags;
    }

    return team_score;
}