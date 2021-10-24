/* Convert maps from 3wctf */

void() item_flag_team1 =
{
    self.team = TEAM_BLUE;
    ctf_flag();
}

void() item_flag_team2 =
{
    self.team = TEAM_RED;
    ctf_flag();
}