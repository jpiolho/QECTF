float ctf_compatibility;
float ctf_gamemode;

float ctf_mutator;

float ctf_gameflags;

entity ctf_host;

float GAMEMODE_DEFAULT = 0;
float GAMEMODE_AREA_CAPTURE = 1;

float GF_FINISHED = 1;

float TEAM_ALL = 0;
float TEAM_HOST = 1;
float TEAM_BLUE = 14;
float TEAM_RED = 5;

#define PLAYERCOLOR_BLUE    "13"
#define PLAYERCOLOR_RED     "4"


float FFL_NONE = 0;
float FFL_HIDDEN = 1 << 0;
float FFL_BOT_HIDDEN = 1 << 1;

float PEF_SEEN_MESSAGE = 1 << 0;
float PEF_FIRST_SPAWN = 1 << 1;
float PEF_IGNORE_INVULNERABILITY_MESSAGE = 1 << 2;
float PEF_IGNORE_ATTACK_BUTTON_UNTIL_RELEASED = 1 << 3;


float COLORMAP_BLUE = 47;
float COLORMAP_RED = 225;

float IT_TRANSLOCATOR = 256;
float IT_HOOK = 512;

float SPAWN_FL_INVULNERABILITY = 1;
float SPAWN_FL_SHORT_INVULNERABILITY = 2;


float MAP_FL_HOOK = 1;
float MAP_FL_TRANSLOCATOR = 2;

float SERVERSETTINGS_HOSTMODE = 1;

float MUTATOR_OVERRIDE_TRANSPORT_WEAPONS = 1;
float MUTATOR_TRANSPORT_HOOK = 2;
float MUTATOR_TRANSPORT_TRANSLOCATOR = 4;

.float ctfTeam;