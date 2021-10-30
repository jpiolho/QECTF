float last_leader;
float current_leader;

float	intermission_running;
float	intermission_exittime;

void StartItem();


//const string SOUND_WIN = "boss2/pop2.wav";
//const string SOUND_LOSE = "boss1/pain.wav";

float(float team) tdm_game_getTeamScore =
{
	local entity p = world;
	local float team_score = 0;
	while((p = findPlayerInTeam(team,p))) {
      	if (p.frags !=0)
            {
              	team_score = team_score + p.frags;
          	}
      }
	return team_score;
}

void() tdm_game_displayGameOver = 
{

      local entity p = world;
	local float otherTeam = self.team == TEAM_BLUE ? TEAM_RED : TEAM_BLUE;
	
	local float team_score;	
	local float enemy_score;	

	team_score = tdm_game_getTeamScore(self.team);
	enemy_score = tdm_game_getTeamScore(otherTeam);

	if (team_score > enemy_score){

	      while((p = findPlayerInTeam(self.team,p)))
	      {
	          centerprint(p,"Your team won the game!\n");
	      }

	      while((p = findPlayerInTeam(otherTeam,p) && p != other))
	      {
	          centerprint(p,"Your team lost the game.\n");
	      }
	}

	if (team_score < enemy_score){

	      while((p = findPlayerInTeam(self.team,p)))
	      {
	          centerprint(p,"Your team lost the game.\n");
	      }

	      while((p = findPlayerInTeam(otherTeam,p) && p != other))
	      {
	          centerprint(p,"Your team won the game!\n");
	      }
	}
	if (team_score == enemy_score){

	      while((p = findPlayerInTeam(self.team,p)))
	      {
	          centerprint(p,"Your team tied the game!\n");
	      }

	      while((p = findPlayerInTeam(otherTeam,p) && p != other))
	      {
	          centerprint(p,"Your team tied the game!\n");
	      }
	}	
}

void(entity player) tdm_player_autoAssignTeam =
{
      local float countBlue = 0;
	local float countRed = 0;
	local entity p = world;
	while((p = findPlayer(p)))
	{
		if(p.team == TEAM_BLUE)
			countBlue++;
		else if(p.team == TEAM_RED)
			countRed++;
	}
    
    player.team = countBlue <= countRed ? TEAM_BLUE : TEAM_RED;
	
}

void(entity player) tdm_player_changeTeam =
{
	if (player.team == TEAM_BLUE) { player.team = TEAM_RED; }
	else if (player.team == TEAM_RED) { player.team = TEAM_BLUE; }
}

float() tdm_game_checkTeamBalance =
{
      local float countBlue = 0;
	local float countRed = 0;
	local entity p = world;
	while((p = findPlayer(p)))
	{
		if(p.team == TEAM_BLUE)
			countBlue++;
		else if(p.team == TEAM_RED)
			countRed++;
	}
	
	// return which team is behind in player count or if they are tied
	if (countBlue < countRed) { return TEAM_BLUE; }
	if (countBlue > countRed) { return TEAM_RED; }
	if (countBlue == countRed) { return TEAMS_BALANCED; }

	return FALSE;	
}


void(entity player) tdm_player_checkChangeTeam =
{
	if (self.impulse == 152) 
	{ 
		local float checkBalance = tdm_game_checkTeamBalance();

      	local entity p = world;
		local float otherTeam = self.team == TEAM_BLUE ? TEAM_RED : TEAM_BLUE;
		local string newColor = self.team == TEAM_BLUE ? "RED" : "BLUE";

		if (checkBalance == otherTeam)  
		{ 
			tdm_player_changeTeam(player); 

			while((p = findPlayerInTeam(self.team,p)))
      		{
          			centerprint4(p,player.netname," has switched to the ",newColor," team\n");
      		}
    
      		while((p = findPlayerInTeam(otherTeam,p) && p != other))
      		{
      	  		centerprint4(p,player.netname," has switched to the ",newColor," team\n");
      		}
		}
		else {centerprint(self,"You can't change teams right now");}
	}
}


void() tdm_game_autoBalanceTeams =
{
      local float countBlue = 0;
	local float countRed = 0;
	local entity p = world;
	while((p = findPlayer(p)))
	{
		if(p.team == TEAM_BLUE)
			countBlue++;
		else if(p.team == TEAM_RED)
			countRed++;
	}

	// red team is out of balance, move player with least frags
	if (countRed + 2 < countBlue) { 

	}

	// blue tream is out of balance, move player with least frags
	if (countBlue +2 < countRed) {

	}
	
}


void() tdm_game_displayLeaderChange =
{
      local entity p = world;
	local float otherTeam = self.team == TEAM_BLUE ? TEAM_RED : TEAM_BLUE;

      while((p = findPlayerInTeam(self.team,p)))
      {
          centerprint(p,"Your team has taken the lead\n");
      }
    
      while((p = findPlayerInTeam(otherTeam,p) && p != other))
      {
        centerprint(p,"Your team has lost the lead\n");
      }
}


void() tdm_game_checkLeaderChange =
{
	local float otherTeam = self.team == TEAM_BLUE ? TEAM_RED : TEAM_BLUE;
	local float team_score = tdm_game_getTeamScore(self.team);
	local float enemy_score = tdm_game_getTeamScore(otherTeam);

	if (team_score > enemy_score) { current_leader = self.team == TEAM_BLUE ? TEAM_BLUE : TEAM_RED ;}
	if (current_leader != last_leader) 	{ tdm_game_displayLeaderChange(); } 

	last_leader = current_leader;
}


void() tdm_game_displayScore =
{
      local entity p = world;
      local float team_score = 0;
	local float enemy_score = 0;
	local float otherTeam = self.team == TEAM_BLUE ? TEAM_RED : TEAM_BLUE;

	team_score = tdm_game_getTeamScore(self.team);
      enemy_score = tdm_game_getTeamScore(otherTeam);
		
	local float is_leading = 0;
	if (team_score >= enemy_score) { is_leading = 1; }
	else { is_leading = 0; }
	
	local	float	fraglimit;
	fraglimit = cvar("fraglimit");

	if (is_leading == 1){
		centerprint5(self,"Your team is leading with ",ftos(team_score)," frags\nYou need ", ftos(fraglimit - team_score)," more frags to win");
	}
	else {
		centerprint5(self,"Your team is behind with ",ftos(team_score)," frags\nYou need ", ftos(fraglimit - team_score)," more frags to win");
	}
}


void() tdm_player_checkKillStreak =
{
    local entity p = world;
    while((p = findPlayer(p))) 
    {
        local float kill_streak;
        kill_streak = p.frags - p.prev_frags;

        if (kill_streak == 5 && p.netname != last_spree){ 
            last_spree = p.netname;
            centerprint2(self,p.netname," is on a killing spree!\n"); 
        }
	
       if (kill_streak == 10) {}	//frenzy
       if (kill_streak == 15) {}	//fragfest
    }
}
