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

void(entity player) tdm_player_changeTeam =
{
	if (player.team == TEAM_BLUE) { player.team = TEAM_RED; }
	else if (player.team == TEAM_RED) { player.team = TEAM_BLUE; }
}

void(entity player) tdm_player_checkChangeTeam =
{
	if (self.impulse == 152) { tdm_player_changeTeam(player); }
}

float(float team) tdm_getTeamScore =
{
	local entity p = world;
	local float team_score = 0;
	while(p = findPlayerInTeam(team,p)) {
      	if (p.frags !=0)
            {
              	team_score = team_score + p.frags;
          	}
      }
}