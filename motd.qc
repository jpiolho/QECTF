/*
This file handles the Message Of The Day (MOTD)
*/


void(entity p) DisplayMOTD =
{
	if (p.motdtext == 0)
	{
	centerprint3(self,"Welcome to Team Deathmatch!\nDownload at https://tinyurl.com/quaketdm\n\nYou are on team ",self.team == TEAM_BLUE ? "BLUE" : "RED","\nHave fun!");	
	}
};

void(entity p) InitMOTD =
{
	p.motdtext = 1;		      // quantity of MOTD messages
	p.motdtime = time - 0.01;	// the past is always to late
};

void(entity p) ChangeMOTD =
{
	// next MOTD
	p.motdtext = self.motdtext - 1;	// counting down to zero

	// define timeframe of MOTD being displayed
	if (p.motdtext == 0)
	{
		p.motdtime = time + 1.5;
	}
};
