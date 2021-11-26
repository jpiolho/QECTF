float() crandom;
void(vector) spawn_tfog;
void(vector, entity) spawn_tdeath;


vector INVALID_LOCATION = '-9999 -9999 -9999';


void() TranslocatorHitbox_Think =
{
    setorigin(self,self.owner.origin);
    self.nextthink = time;
}

void() TranslocatorHitbox_Kill =
{
    remove(self.owner);
    remove(self);
}

void() Translocator_Remove =
{
    if(self.movetarget)
        remove(self.movetarget);

    // Give back "the ammo" to the player
    if(self.owner.weapon == IT_TRANSLOCATOR)
        self.owner.currentammo++;

    remove(self);
}

void() TranslocatorTouch =
{
    local float r = random();
    if (r < 0.33)
        sound (self, CHAN_WEAPON, "weapons/ric1.wav", 1, ATTN_NORM);
    else if (r<0.66)
        sound (self, CHAN_WEAPON, "weapons/ric2.wav", 1, ATTN_NORM);
    else
        sound (self, CHAN_WEAPON, "weapons/ric3.wav", 1, ATTN_NORM);

    if (self.velocity == '0 0 0') {
		self.avelocity = '0 0 0';
    }
};


vector(entity translocator) ctf_findTranslocatorSpot =
{
    local vector spots[] = { 
        '0 0 32', '32 0 32', '-32 0 32', '0 32 32','0 -32 32', '24 24 32','-24 24 32','-24 -24 32','24 -24 32',
        '0 0 -24', '32 0 -24', '-32 0 -24', '0 32 -24','0 -32 -24', '24 24 -24','-24 24 -24','-24 -24 -24','24 -24 -24',
    };

    local float i;
    for(i=0;i<spots.length;i++) {
        local vector testOrigin = translocator.origin + spots[i];
        local vector spot = spots[i];
        
        // Drop to floor a little
        local vector down = testOrigin;
        down_z -= 32;
        traceline(testOrigin,down,FALSE,self);

        if(trace_fraction < 1.0)
            testOrigin = trace_endpos;


        // Add all the bbox corners for testing
        local vector corners[8];
        local float x;

        corners[0] = testOrigin + VEC_HULL_MIN;
        
        local vector corner = testOrigin;
        corner_x += VEC_HULL_MIN_x;
        corner_y += VEC_HULL_MAX_y;
        corner_z += VEC_HULL_MIN_z;
        corners[1] = corner;

        corner = testOrigin;
        corner_x += VEC_HULL_MAX_x;
        corner_y += VEC_HULL_MAX_y;
        corner_z += VEC_HULL_MIN_z;
        corners[2] = corner;

        corner = testOrigin;
        corner_x += VEC_HULL_MAX_x;
        corner_y += VEC_HULL_MIN_y;
        corner_z += VEC_HULL_MIN_z;
        corners[3] = corner;

        corner = testOrigin;
        corner_x += VEC_HULL_MAX_x;
        corner_y += VEC_HULL_MIN_y;
        corner_z += VEC_HULL_MAX_z;
        corners[4] = corner;

        corner = testOrigin;
        corner_x += VEC_HULL_MIN_x;
        corner_y += VEC_HULL_MIN_y;
        corner_z += VEC_HULL_MAX_z;
        corners[5] = corner;

        corner = testOrigin;
        corner_x += VEC_HULL_MIN_x;
        corner_y += VEC_HULL_MAX_y;
        corner_z += VEC_HULL_MAX_z;
        corners[6] = corner;

        corners[7] = testOrigin + VEC_HULL_MAX;

        local float valid = TRUE;
        for(x=0;x<corners.length;x++) {
            corner = corners[x];
            local float contents = pointcontents(corner);

            if(contents != CONTENT_EMPTY && contents != CONTENT_SKY) {
                valid = FALSE;
                break;
            }
        }

        if(valid) {
            traceline(corners[0],corners[1],FALSE,self);
            if(trace_fraction < 1.0)
                continue;
    
            traceline(corners[1],corners[2],FALSE,self);
            if(trace_fraction < 1.0)
                continue;
    
            traceline(corners[1],corners[2],FALSE,self);
            if(trace_fraction < 1.0)
                continue;

            traceline(corners[2],corners[3],FALSE,self);
            if(trace_fraction < 1.0)
                continue;

            traceline(corners[3],corners[0],FALSE,self);
            if(trace_fraction < 1.0)
                continue;

            traceline(corners[3],corners[4],FALSE,self);
            if(trace_fraction < 1.0)
                continue;
    
            traceline(corners[0],corners[5],FALSE,self);
            if(trace_fraction < 1.0)
                continue;

            traceline(corners[1],corners[6],FALSE,self);
            if(trace_fraction < 1.0)
                continue;
            
            traceline(corners[2],corners[7],FALSE,self);
            if(trace_fraction < 1.0)
                continue;

            traceline(corners[4],corners[5],FALSE,self);
            if(trace_fraction < 1.0)
                continue;

            traceline(corners[5],corners[6],FALSE,self);
            if(trace_fraction < 1.0)
                continue;

            traceline(corners[6],corners[7],FALSE,self);
            if(trace_fraction < 1.0)
                continue;
            
            traceline(corners[7],corners[4],FALSE,self);
            if(trace_fraction < 1.0)
                continue;

            return testOrigin;
        }
        
    }

    return INVALID_LOCATION;
}


void() TranslocatorLanded =
{
    local vector validLocation = ctf_findTranslocatorSpot(self);

    // Delete self if no valid placement was found
    if(validLocation == INVALID_LOCATION)
    {
        Translocator_Remove();
        return;
    }



    // Create the hitbox
    local entity hitbox = spawn();
    hitbox.owner = self;

    hitbox.movetype = MOVETYPE_NONE;
    hitbox.solid = SOLID_BBOX;

    hitbox.health = 1;
    hitbox.takedamage = DAMAGE_AIM;
    hitbox.th_pain = TranslocatorHitbox_Kill;
    hitbox.th_die = TranslocatorHitbox_Kill;

    setsize(hitbox,'-2 -2 -2','2 2 2');


    hitbox.think = TranslocatorHitbox_Think;
    hitbox.nextthink = time; 

    self.movetarget = hitbox;


    
}



void() TranslocatorThink =
{
    if(self.count >= 0)
    {
        if(self.velocity == '0 0 0')
        {
            if(++self.count >= 4) {
                TranslocatorLanded();
                self.count = -1;       
            }     
        }
        else {
            self.count = 0;
        }

        if(time >= self.cnt)
        {
            particle(self.origin,self.velocity * 0.1,self.owner.cnt & PEF_TEAM_RED ? COLORMAP_RED : COLORMAP_BLUE,6);
            self.cnt = time + 0.1;
        }

        self.nextthink = time;
    }
    else {

        particle(self.origin,self.velocity * 0.1,self.owner.cnt & PEF_TEAM_RED ? COLORMAP_RED : COLORMAP_BLUE,16);

        sound (self, CHAN_VOICE, "weapons/tink1.wav", 1, ATTN_STATIC);
        self.nextthink = time + 1.0;
    }
}




void(entity ent) ctf_deleteTranslocator =
{
    local entity oself = self;
    self = ent;
    Translocator_Remove();
    self = oself;
}


entity(entity who) ctf_findOwnerTranslocator =
{
    local entity ent;
    // Remove previous translocator
    while((ent = find(ent,classname,"translocator")))
    {
        if(ent.owner == who) {
            return ent;
        }
    }

    return ent;
}

void(entity who) ctf_deleteTranslocatorFromOwner =
{
    local entity ent = ctf_findOwnerTranslocator(who);

    if(ent) {
        ctf_deleteTranslocator(ent);
    }
}


void() ctf_translocator_effect_think =
{
    dprint(ftos(self.team));
    dprint("\n");
    // Make effect
    particle(self.origin,self.movedir * 4,self.team == TEAM_RED ? COLORMAP_RED : COLORMAP_BLUE,16);

    // Move
    self.origin += self.movedir * 64;

    // Did we reach destination?
    if(vlen(self.origin - self.oldorigin) >= self.t_length) {
        remove(self);
        return;
    }

    self.nextthink = time + 0.025;
}

void() ctf_translocator_effect =
{
    self.classname = "ctf_translocator_effect";
    self.think = ctf_translocator_effect_think;
    self.nextthink = time;
    self.oldorigin = self.origin;
    self.t_length = vlen(self.origin - self.dest);

}

void() W_SetTranslocatorAmmo =
{
    self.currentammo = ctf_findOwnerTranslocator(self) ? 0 : 1;
}

void() W_FireTranslocator =
{
    local entity translocator;

    if((translocator = ctf_findOwnerTranslocator(self)))
    {
        if(!translocator.finaldest)
        {
            local vector t = ctf_findTranslocatorSpot(translocator);

            if(t != INVALID_LOCATION)
            {
                if(self.items & (IT_KEY1 | IT_KEY2)) {
                    centerprint(self,"You dropped the flag\n");
		            ctf_DropFlag();
                }


                local entity effect = spawn();
                effect.origin = self.origin;
                effect.movedir = normalize(t - self.origin);
                effect.dest = t;
                effect.team = self.cnt & PEF_TEAM_RED ? TEAM_RED : TEAM_BLUE;

                local entity oself = self;
                self = effect;
                ctf_translocator_effect();
                self = oself;



                // put a tfog where the player was
                spawn_tfog (self.origin);

            // spawn a tfog flash in front of the destination
                makevectors (self.v_angle);


                
                spawn_tfog (t + 32 * v_forward);
                spawn_tdeath(t, self);

            // move the player and lock him down for a little while
                if (!self.health)
                {
                    self.origin = t;
                    self.velocity = (v_forward * self.velocity_x) + (v_forward * self.velocity_y);
                    return;
                }

                setorigin (self, t);

                self.teleport_time = time + 0.7;
                if (self.flags & FL_ONGROUND)
                    self.flags -= FL_ONGROUND;

                self.flags -= self.flags & FL_ONGROUND;
            }
        }

        ctf_deleteTranslocator(translocator);
        return;
    }


    ctf_deleteTranslocatorFromOwner(self);
    
    sound (self, CHAN_WEAPON, "weapons/grenade.wav", 1, ATTN_NORM);

    self.punchangle_x = -2;
    self.currentammo = 0;

    translocator = spawn ();
	translocator.owner = self;
	translocator.movetype = MOVETYPE_BOUNCE;
    translocator.solid = SOLID_BBOX;
	translocator.classname = "translocator";
		
// set translocator speed	

	makevectors (self.v_angle);

	if (self.v_angle_x)
		translocator.velocity = v_forward*700 + v_up * 100 + crandom()*v_right*10 + crandom()*v_up*10;
	else
	{
		translocator.velocity = aim(self, 10000);
		translocator.velocity = translocator.velocity * 700;
		translocator.velocity_z = 500;
	}

	translocator.avelocity = '300 300 300';

	translocator.angles = vectoangles(translocator.velocity);
	
    translocator.takedamage = DAMAGE_YES;
    translocator.health = 1;
    translocator.th_die = Translocator_Remove;
    translocator.th_pain = Translocator_Remove;
	translocator.touch = TranslocatorTouch;
	
// set translocator duration
	translocator.nextthink = time;
	translocator.think = TranslocatorThink;
    translocator.count = 0;

	setmodel (translocator, MODEL_TRANSLOCATOR);
	setsize (translocator, '0 0 0', '0 0 0');		
	setorigin (translocator, self.origin);
    
}