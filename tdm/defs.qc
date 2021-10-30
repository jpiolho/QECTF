float TEAM_ALL = 0;
float TEAM_BLUE = 14;
float TEAM_RED = 5;
float TEAMS_BALANCED = 1;

float COLOR_BLUE = 13;
float COLOR_RED = 4;

float PEF_SEEN_MESSAGE = 1;


.float motdtime;
.float motdtext;

void(entity self) DisplayMOTD;
void(entity self) InitMOTD;
void(entity self) ChangeMOTD;

// for kill sprees
.float prev_frags;
string last_spree;