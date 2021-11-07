void StartItem();


const string SOUND_WIN = "boss2/pop2.wav";
const string SOUND_LOSE = "boss1/pain.wav";
const string SOUND_PICKUP_OWN = "misc/basekey.wav";
const string SOUND_PICKUP_ENEMY = "ogre/ogwake.wav";
const string SOUND_RESPAWN = "items/itembk2.wav";
const string SOUND_RETURNED = "misc/trigger1.wav";

const string MODEL_FLAG_BASE = "progs/ctfbase.mdl";
const string MODEL_FLAG_ROGUE = "progs/ctfmodel.mdl";


void(entity p) ctf_player_removeFlag =
{
    p.items -= p.items & (IT_KEY1 | IT_KEY2);
    p.effects -= p.effects & EF_DIMLIGHT;
}

void(entity player) ctf_player_autoAssignTeam =
{
    // Handle bots
    if(ctf_isBot(player))
    {
        player.team = ctf_getBotTeam(player.netname);
        return;
    }


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

    if(countBlue < countRed)
        player.team = TEAM_BLUE;
    else if(countRed < countBlue)
        player.team = TEAM_RED;
    else
        player.team = random() >= 0.5 ? TEAM_BLUE : TEAM_RED;
	
    if(player.team == TEAM_BLUE) player.cnt |= PEF_TEAM_BLUE;
    else if(player.team == TEAM_RED) player.cnt |= PEF_TEAM_RED;

	//player.team = countRed <= countBlue ? TEAM_RED : TEAM_BLUE;
}

void() ctf_flag_returned =
{
    // Move it back
    setorigin(self,self.oldorigin);
    self.solid = SOLID_TRIGGER;
    self.cnt = FFL_NONE;

    // Respawning sound
    sound(self, CHAN_VOICE,SOUND_RESPAWN,1,ATTN_NORM);
}

void() ctf_flag_think_return =
{
    local float otherTeam = self.team == TEAM_BLUE ? TEAM_RED : TEAM_BLUE;

    // Broadcast announcements
    local entity p = world;
    while(p = findPlayerInTeam(self.team,p))
    {
        centerprint(p,"Your flag has returned\n");
        localsound(p,SOUND_RETURNED);
    }

    p = world;
    while(p = findPlayerInTeam(otherTeam,p))
    {
        centerprint(p,"The enemy flag has returned\n");
        localsound(p,SOUND_RETURNED);
    }

    // Find the old flag to return it
    p = world;
    while(p = find(p,classname,"ctf_flag"))
    {
        if(p != self && p.team == self.team)
        {
            p.nextthink = time + 0.1;
            p.think = ctf_flag_returned;
            break;
        }
    }

    // Remove itself
    remove(self);
}

void() ctf_flag_pickup =
{
    local float otherTeam;
    otherTeam = self.team == TEAM_BLUE ? TEAM_RED : TEAM_BLUE;

    // Broadcast announcements
    local entity p = world;
    while(p = findPlayerInTeam(self.team,p))
    {
        sprint(p,"Your flag has been taken\n");
        centerprint(p,"Your flag has been taken\n");
        localsound(p,SOUND_PICKUP_ENEMY);
    }
    
    p = world;
    while(p = findPlayerInTeam(otherTeam,p) && p != other)
    {
        sprint(p,"Your team has the flag\n");
        centerprint(p,"Your team has the flag\n");
        localsound(p,SOUND_PICKUP_OWN);
    }
    
    sprint(other,"You have the flag!\n");
    centerprint(other,"You have the flag!\n");
    localsound(other,SOUND_PICKUP_OWN);

    // Add item to the player
    other.items |= self.team == TEAM_BLUE ? IT_KEY1 : IT_KEY2;
    other.effects |= EF_DIMLIGHT;

    // Flash screen
    stuffcmd(other,"bf\n");

    // Hide itself
    self.oldorigin = self.origin;
    setorigin(self,'-9999 -9999 -9999');
    self.solid = SOLID_NOT;
    self.cnt = FFL_HIDDEN;
}

void() ctf_flag_capture() {

    stuffcmd(other,"bf\n");

    // Remove flag from player
    ctf_player_removeFlag(other);

    // Broadcast announcements
    local entity p = world;
    while(p = findPlayer(p) && p != other) {
        if(p.team == self.team)
        {
            sprint(p,"Your team captured the flag!\n");
            centerprint(p,"Your team captured the flag!\n");
            localsound(p,SOUND_WIN);
        }
        else {
            sprint(p,"The enemy team captured the flag\n");
            centerprint(p,"The enemy team captured the flag\n");
            localsound(p,SOUND_LOSE);
        }
    }

    sprint(other,"You captured the flag!\n");
    centerprint(other,"You captured the flag!\n");
    localsound(other,SOUND_WIN);

    // Find the other flag to return it
    p = world;
    while(p = find(p,classname,"ctf_flag"))
    {
        if(p != self && p.team != self.team)
        {
            p.nextthink = time + 0.1;
            p.think = ctf_flag_returned;
            break;
        }

    }

    // Add frags for self
    other.frags += 10;

    // Add some frags for the whole team
    p = world;
    while(p = findPlayerInTeam(self.team,p) && p != other) {
        p.frags += 4;
    }
}





void() ctf_flag_touch =
{
    if(other.classname != "player" || other.health <= 0)
        return;
        
    if(other.team == self.team)
    {
        if(other.items & IT_KEY1 || other.items & IT_KEY2)
        {
            ctf_flag_capture();
        }

        return;
    }

    ctf_flag_pickup();    
}

void() ctf_flag_dropped_touch = 
{
    if(other.classname != "player" || other.health <= 0)
        return;

    if(other.team == self.team)
    {
        ctf_flag_think_return();
        return;
    }

    ctf_flag_pickup();

    remove(self); // Destroy
}


void() ctf_base =
{
    setmodel(self,MODEL_FLAG_BASE);
}

void() ctf_flag_init =
{
    if(self.team == TEAM_BLUE)
    {
        setmodel (self, "progs/b_s_key.mdl");

        #ifdef ROGUE
        setmodel( self, MODEL_FLAG_ROGUE);
        self.skin = 1;
        #endif

        self.netname = "Blue key";
    }
    else if(self.team == TEAM_RED)
    {
        setmodel (self, "progs/b_g_key.mdl");

        #ifdef ROGUE
        setmodel( self, MODEL_FLAG_ROGUE);
        self.skin = 0;
        #endif

        self.netname = "Red key";
    }

    self.classname = "ctf_flag";
    setsize(self,'-16 -16 -24','16 16 32');
    setorigin(self,self.origin);

    self.touch = ctf_flag_touch;
    self.flags = FL_ITEM;		
	self.solid = SOLID_TRIGGER;
	self.movetype = MOVETYPE_TOSS;	
    self.velocity = '0 0 0';
	self.origin_z = self.origin_z + 6;
}

void() ctf_flag =
{
    precache_sound(SOUND_WIN);
    precache_sound(SOUND_LOSE);
    precache_sound(SOUND_PICKUP_ENEMY);
    precache_sound(SOUND_PICKUP_OWN);
    precache_sound(SOUND_RETURNED);
    precache_model("progs/b_s_key.mdl");
    precache_model("progs/b_g_key.mdl");

    #ifdef ROGUE
    precache_model(MODEL_FLAG_ROGUE);
    precache_model(MODEL_FLAG_BASE);
    #endif

    ctf_flag_init();

    droptofloor();

    #ifdef ROGUE

    // Fix for the flag model floating
    self.origin -= '0 0 8'; 
    setsize(self,'-16 -16 24','16 16 48');

    local entity base = spawn();

    base.origin = self.origin - '0 0 16';
    base.skin = self.skin;
    base.classname = "ctf_base";

    self = base;
    ctf_base();

    #endif
}

void() ctf_flag_dropped =
{
    ctf_flag_init();

    self.touch = ctf_flag_dropped_touch;
    self.classname = "ctf_flag_dropped";
    self.think = ctf_flag_think_return;
    self.nextthink = time + 30.0;

    self.effects |= EF_DIMLIGHT;

    /*
    if(!droptofloor()) {
        dprint("Dropped flag clipped through the world!\n");
        ctf_flag_think_return();
    }
    */
}






void() ctf_DropFlag =
{
    local entity flag;

    flag = spawn();
    flag.origin = self.origin;

    if(self.items & IT_KEY1) {
        flag.team = TEAM_BLUE;
    }
    else if(self.items & IT_KEY2) {
        flag.team = TEAM_RED;
    }
    else {
        dprint("Attempted to drop flag but without carrying a flag!");
        remove(flag);
        return;
    }

    ctf_player_removeFlag(self);

    local entity oself = self;
    self = flag;
    ctf_flag_dropped();
    self = oself;


}