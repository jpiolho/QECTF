void() item_flag_team1 =
{
    ctf_compatibility = 1;

    self.team = TEAM_RED;
    ctf_flag();
}

void() item_flag_team2 =
{
    ctf_compatibility = 1;
    
    self.team = TEAM_BLUE;
    ctf_flag();
}

void() info_player_team1 =
{
	self.team = TEAM_RED;
	self.impulse = 1;
	info_player_deathmatch();
}

void() info_player_team2 =
{
	self.team = TEAM_BLUE;
	self.impulse = 1;
	info_player_deathmatch();
}