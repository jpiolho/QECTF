void() StartItem;
void(float) respawn;
void() W_SetCurrentAmmo;

#define flagentity oldenemy


const string SOUND_WIN = "boss2/pop2.wav";
const string SOUND_LOSE = "boss1/pain.wav";
const string SOUND_PICKUP_OWN = "misc/basekey.wav";
const string SOUND_PICKUP_ENEMY = "ogre/ogwake.wav";
const string SOUND_RESPAWN = "items/itembk2.wav";
const string SOUND_RETURNED = "misc/trigger1.wav";
const string SOUND_CAPTURED_BASE = "misc/runekey.wav";
const string SOUND_CAPTURED_BASE_OWN = "doors/meduse.wav";
const string SOUND_HOOK_ATTACK = "hknight/hit.wav";

const string MODEL_HOOK_HEAD = "progs/v_spike.mdl";
const string MODEL_HOOK_SPIKE = "progs/s_spike.mdl";
const string MODEL_TRANSLOCATOR = "progs/laser.mdl";

#ifdef ROGUE
const string MODEL_FLAG_BASE_ROGUE = "progs/ctfbase.mdl";
const string MODEL_FLAG_ROGUE = "progs/ctfmodel.mdl";
const string MODEL_WEAPON_HOOK = "progs/v_star.mdl";
const string MODEL_WEAPON_TRANSLOCATOR = "progs/v_grpple.mdl";
#else
const string MODEL_FLAG_BLUE = "progs/b_s_key.mdl";
const string MODEL_FLAG_RED = "progs/b_g_key.mdl";
const string MODEL_FLAG_BASE = "progs/flame2.mdl";
const string MODEL_FLAG_BASE_2 = "progs/teleport.mdl";
const string MODEL_WEAPON_HOOK = "progs/v_axe.mdl";
const string MODEL_WEAPON_TRANSLOCATOR = "progs/v_axe.mdl";
#endif


float(entity ent) ctf_doesPlayerHaveFlag =
{
    return ent.items & (IT_KEY1 | IT_KEY2);
}



void() ctf_precache =
{
    precache_sound(SOUND_WIN);
    precache_sound(SOUND_LOSE);
    precache_sound(SOUND_PICKUP_ENEMY);
    precache_sound(SOUND_PICKUP_OWN);
    precache_sound(SOUND_RETURNED);
    precache_sound(SOUND_CAPTURED_BASE);
    precache_sound(SOUND_CAPTURED_BASE_OWN);
    precache_sound(SOUND_HOOK_ATTACK);

    #ifdef ROGUE
    precache_model(MODEL_FLAG_ROGUE);
    precache_model(MODEL_FLAG_BASE_ROGUE);
    #else
    precache_model(MODEL_FLAG_BLUE);
    precache_model(MODEL_FLAG_RED);
    precache_model(MODEL_FLAG_BASE);
    precache_model(MODEL_FLAG_BASE_2);
    #endif

    precache_model(MODEL_TRANSLOCATOR);
    precache_model(MODEL_HOOK_HEAD);
    precache_model(MODEL_WEAPON_HOOK);
    precache_model(MODEL_WEAPON_TRANSLOCATOR);
}



void(entity ent,float flagTeam) ctf_setFlagModel =
{
    #ifdef ROGUE
    setmodel(ent,MODEL_FLAG_ROGUE);
    ent.skin = flagTeam == TEAM_BLUE ? 1 : 0;
    #else
    setmodel(ent,flagTeam == TEAM_BLUE ? MODEL_FLAG_BLUE : MODEL_FLAG_RED);
    #endif
}

void(entity p) ctf_player_removeFlag =
{
    p.items -= p.items & (IT_KEY1 | IT_KEY2);
    p.effects -= p.effects & EF_DIMLIGHT;
    p.flagentity = world;
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
	while((p = findPlayer(p)))
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
    self.solid = SOLID_TRIGGER;
    self.cnt = FFL_NONE;
    setorigin(self,self.oldorigin);

    // Respawning sound
    sound(self, CHAN_VOICE,SOUND_RESPAWN,1,ATTN_NORM);
}

void(entity ent) ctf_returnFlag =
{
    ent.nextthink = time + 0.1;
    ent.think = ctf_flag_returned;
}


void() ctf_base_removeFlag =
{
    remove(self.flagentity);
    self.flagentity = world;
}


void() ctf_gamefinished_think =
{
    local entity p,oself;

    // Return all flags
    while((p = find(p,classname,"ctf_base")))
    {
        if(p.flagentity)
        {
            ctf_returnFlag(p.flagentity.flagentity);
            
            oself = self;
            self = p;
            ctf_base_removeFlag();
            self = oself;
            
            #ifdef ROGUE
            p.skin = 2;
            #endif
        }
    }

    // Swap teams
    while((p = find(p,classname,"player"))) {
        
        if(p.cnt & PEF_TEAM_RED) {
            p.team = TEAM_BLUE;
            p.cnt -= PEF_TEAM_RED;
            p.cnt |= PEF_TEAM_BLUE;
        } else if(p.cnt & PEF_TEAM_BLUE) {
            p.team = TEAM_RED;
            p.cnt -= PEF_TEAM_BLUE;
            p.cnt |= PEF_TEAM_RED;
        }

        oself = self;
        self = p;
        respawn(FALSE);
        self = oself;

        centerprint(p,"Teams swapped!\nYou are now on team ",p.team == TEAM_RED ? "red" : "blue");
    }


    ctf_gameflags -= GF_FINISHED;

    remove(self);
}

float() ctf_checkAreaCaptureWinCondition =
{
    local entity p;
    local float t = TEAM_ALL;

    while((p = find(p,classname,"ctf_base")))
    {
        // All bases need to have a flag
        if(!p.flagentity) {
            dprint("No flag entity\n");
            return FALSE;
        }
        
        if(t == TEAM_ALL)
        t = p.flagentity.team;
        
        // All flags need to match the same team
        if(p.flagentity.team != t) {
            dprint("Team no match\n");
            return FALSE;
        }
    }

    // Broadcast, remove flags, increase score
    while((p = find(p,classname,"player")))
    {
        if(p.team == t)
        {
            centerprint(p,"Your team has captured all bases!");
            localsound(p,SOUND_WIN);
            p.frags += 15;
        }
        else {
            centerprint(p,"The enemy team has captured all bases");
            localsound(p,SOUND_LOSE);
        }

        if(ctf_doesPlayerHaveFlag(p)) {
            ctf_returnFlag(p.flagentity);
            ctf_player_removeFlag(p);
        }
    }

    ctf_gameflags |= GF_FINISHED;


    p = spawn();

    p.think = ctf_gamefinished_think;
    p.nextthink = time + 10.0;

    return TRUE;
}

void() ctf_flag_think_return =
{
    local float otherTeam = self.team == TEAM_BLUE ? TEAM_RED : TEAM_BLUE;

    // Broadcast announcements
    local entity p = world;
    while((p = findPlayerInTeam(self.team,p)))
    {
        centerprint(p,"Your flag has returned\n");
        localsound(p,SOUND_RETURNED);
    }

    p = world;
    while((p = findPlayerInTeam(otherTeam,p)))
    {
        centerprint(p,"The enemy flag has returned\n");
        localsound(p,SOUND_RETURNED);
    }

    // Find the old flag to return it
    /*
    p = world;
    while((p = find(p,classname,"ctf_flag")))
    {
        if(p != self && p.team == self.team)
        {
            p.nextthink = time + 0.1;
            p.think = ctf_flag_returned;
            break;
        }
    }
    */
    ctf_returnFlag(self.flagentity);

    // Remove itself
    remove(self);
}

void() ctf_flag_pickup =
{
    local float otherTeam;
    otherTeam = self.team == TEAM_BLUE ? TEAM_RED : TEAM_BLUE;

    if(MapFunc_OnFlagPickedUp)
        MapFunc_OnFlagPickedUp(self,other);

    // Broadcast announcements
    local entity p = world;
    while((p = findPlayerInTeam(self.team,p)))
    {
        sprint(p,"Your flag has been taken\n");
        centerprint(p,"Your flag has been taken\n");
        localsound(p,SOUND_PICKUP_ENEMY);
    }
    
    p = world;
    while((p = findPlayerInTeam(otherTeam,p)))
    {
        if(p != other) {
            sprint(p,"Your team has the flag\n");
            centerprint(p,"Your team has the flag\n");
            localsound(p,SOUND_PICKUP_OWN);
        }
    }
    
    sprint(other,"You have the flag!\n");
    centerprint(other,"You have the flag!\n");
    localsound(other,SOUND_PICKUP_OWN);

    // Add item to the player
    other.items |= self.team == TEAM_BLUE ? IT_KEY1 : IT_KEY2;
    other.effects |= EF_DIMLIGHT;
    other.flagentity = self.flagentity ? self.flagentity : self;


    // Flash screen
    stuffcmd(other,"bf\n");

    // Hide itself
    self.oldorigin = self.origin;
    setorigin(self,'-9999 -9999 -9999');
    self.solid = SOLID_NOT;
    self.cnt = FFL_HIDDEN;
}

void() ctf_flag_pickup_areacapture = 
{
    sprint(other,"You picked up a flag. Deliver it to a flag base\n");
    centerprint(other,"You picked up a flag\nDeliver it to a flag base");

    // Add item to the player
    other.items |= self.team == TEAM_BLUE ? IT_KEY1 : IT_KEY2;
    other.effects |= EF_DIMLIGHT;
    other.flagentity = self.flagentity ? self.flagentity : self;


    // Remove weapons from player
    other.items -= other.items & (IT_SUPER_SHOTGUN | IT_NAILGUN | IT_SUPER_NAILGUN | IT_ROCKET_LAUNCHER | IT_LIGHTNING | IT_GRENADE_LAUNCHER);
    if(other.weapon != IT_SHOTGUN && other.weapon != IT_AXE) {
        other.weapon = IT_SHOTGUN;

        local entity oself = self;
        self = other;
        W_SetCurrentAmmo();
        self = oself;
    }

    // Flash screen
    stuffcmd(other,"bf\n");

    // Sound
    localsound(other,SOUND_PICKUP_OWN);

    // Hide itself
    self.oldorigin = self.origin;
    setorigin(self,'-9999 -9999 -9999');
    self.solid = SOLID_NOT;
    self.cnt = FFL_HIDDEN;
}

void() ctf_flag_capture {

    stuffcmd(other,"bf\n");

    local entity flagEntity = other.flagentity;

    // Remove flag from player
    ctf_player_removeFlag(other);

    if(MapFunc_OnFlagCapture)
        MapFunc_OnFlagCapture(self,other);

    // Broadcast announcements
    local entity p = world;
    while((p = findPlayer(p))) {
        if(p != other) {
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
    }

    sprint(other,"You captured the flag!\n");
    centerprint(other,"You captured the flag!\n");
    localsound(other,SOUND_WIN);

    // Find the other flag to return it
    if(!flagEntity) {
        dprint("Flag entity wasn't set!\n");
        p = world;
        while((p = find(p,classname,"ctf_flag")))
        {
            if(p != self && p.team != self.team)
            {
                ctf_returnFlag(p);
                break;
            }

        }
    }
    else
    {
        ctf_returnFlag(flagEntity);
    }

    // Add frags for self
    other.frags += 10;

    // Add some frags for the whole team
    p = world;
    while((p = findPlayerInTeam(self.team,p))) {
        if(p != other)
            p.frags += 4;
    }
}





void() ctf_flag_touch =
{
    if(other.classname != "player" || other.health <= 0)
        return;

    if(ctf_gamemode == GAMEMODE_DEFAULT) {
        if(other.team == self.team)
        {
            if(ctf_doesPlayerHaveFlag(other))
            {
                ctf_flag_capture();
            }

            return;
        }

        ctf_flag_pickup();
    }
    else {
        // Does the player already have a flag?
        if(ctf_doesPlayerHaveFlag(other))
            return;

        // Do not pick up the flag if the game has finished
        if(ctf_gameflags & GF_FINISHED)
            return;

        if(other.team == self.team)
            ctf_flag_pickup_areacapture();
    }

     
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



void() ctf_base_touch =
{
    // Is it a player and is it alive?
    if(other.classname != "player" || other.health <= 0)
        return;

    // Only do something if the other player is carrying a flag
    if(!(other.items & (IT_KEY1 | IT_KEY2)))
        return;

    // If there's a flag and it's already from the same team, ignore
    if(self.flagentity)
    {
        if(self.flagentity.team == other.team)
            return;

        // Return the old flag back
        ctf_returnFlag(self.flagentity.flagentity);

        ctf_base_removeFlag();
    }

    // Create the decorative flag
    local entity decorativeFlag = spawn();

    #ifdef ROGUE
    decorativeFlag.origin = self.origin + '0 0 16';
    #else
    decorativeFlag.origin = self.origin + '0 0 24';
    #endif

    decorativeFlag.flagentity = other.flagentity;
    decorativeFlag.team = other.team;
    ctf_setFlagModel(decorativeFlag,other.team);

    self.flagentity = decorativeFlag;


    #ifdef ROGUE
    // Set skin
    self.skin = other.team == TEAM_RED ? 0 : 1;
    #endif

    // Remove flag from the player
    ctf_player_removeFlag(other);

    self.frags += 5;

    if(MapFunc_OnFlagCapture)
        MapFunc_OnFlagCapture(self,other);

    if(!ctf_checkAreaCaptureWinCondition()) {
        // If the function above returned false, then broadcast as normal


        // Broadcast the capture
        local entity p;
        while((p = find(p,classname,"player"))) {
            centerprint(p,self.message,"\nhas been captured by the ",other.team == TEAM_BLUE ? "blue" : "red"," team");
            
            if(p != other) {
                if(p.team == other.team) {
                    localsound(p,SOUND_CAPTURED_BASE);
                } else {
                    localsound(p,SOUND_RETURNED);
                }
            } else {
                localsound(p,SOUND_CAPTURED_BASE_OWN);
            }
        }   
    } 

    
}

void() ctf_base_decoration_think =
{
    self.angles_y += 5;

    if(self.angles_y > 360) self.angles_y -= 360;

    self.nextthink = time + 0.1;
}

void() ctf_base =
{
    self.classname = "ctf_base";


    local vector traceEnd = self.origin - '0 0 9999';
    traceline(self.origin,traceEnd, TRUE, self);

    if(trace_fraction == 1.0)
    {
        dprint("ctf_base fell through the floor at ");
        dprint(vtos(self.origin));
        dprint("\n");
        remove(self);
    }


    #ifdef ROGUE
        self.origin = trace_endpos;
        setmodel(self,MODEL_FLAG_BASE_ROGUE);
        self.skin = 2;
    #else
        self.origin = trace_endpos + '0 0 8';
        setmodel(self,MODEL_FLAG_BASE);

        local entity decoration = spawn();
        decoration.origin = self.origin - '0 0 8';
        decoration.effects |= EF_BRIGHTFIELD;
        setmodel(decoration,MODEL_FLAG_BASE_2);
        decoration.think = ctf_base_decoration_think;
        decoration.nextthink = time + 0.1;

    #endif

    setsize(self,'-24 -24 -16','24 24 48');

    self.solid = SOLID_TRIGGER;
    self.touch = ctf_base_touch;
}

void() ctf_flag_init =
{
    ctf_setFlagModel(self,self.team);

    if(self.team == TEAM_BLUE)
    {
        self.netname = "Blue key";
    }
    else if(self.team == TEAM_RED)
    {
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
    ctf_flag_init();

    droptofloor();

    #ifdef ROGUE

    // Fix for the flag model floating
    self.origin -= '0 0 8'; 
    setsize(self,'-16 -16 24','16 16 48');

    // Decorative base
    local entity base = spawn();

    base.origin = self.origin - '0 0 16';
    base.skin = self.skin;
    setmodel(base,MODEL_FLAG_BASE_ROGUE);


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
    if(ctf_gamemode == GAMEMODE_AREA_CAPTURE)
    {
        ctf_returnFlag(self.flagentity);
        ctf_player_removeFlag(self);
        return;
    }

    local entity flag;

    flag = spawn();
    flag.origin = self.origin;
    flag.flagentity = self.flagentity; // Carry over which flag this belongs to

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