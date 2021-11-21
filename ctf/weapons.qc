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
    local vector spots[] = { '0 0 32', '32 0 32', '-32 0 32', '0 32 32','0 -32 32', '0 0 -24','24 24 32','-24 24 32','-24 -24 32','24 -24 32' };

    local float i;
    for(i=0;i<spots.length;i++) {
        // Find available teleport spot
        local entity tester = spawn();

        tester.movetype = MOVETYPE_STEP;
        tester.solid = SOLID_BBOX;

        setsize (tester, VEC_HULL_MIN, VEC_HULL_MAX);
        setorigin(tester,translocator.origin + spots[i]);


        local entity oself = self;
        self = tester;

        droptofloor();
        local float walkMoveResult = walkmove(0,0);

        self = oself;

        if(walkMoveResult)
        {
            local vector result = tester.origin;

            remove(tester);

            return result;
        }

        remove(tester);
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

        self.nextthink = time;
    }
    else {
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

void() W_SetTranslocatorAmmo =
{
    self.weaponmodel = "progs/v_axe.mdl";
    self.weaponframe = 0;
    
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
		translocator.velocity = v_forward*800 + v_up * 100 + crandom()*v_right*10 + crandom()*v_up*10;
	else
	{
		translocator.velocity = aim(self, 10000);
		translocator.velocity = translocator.velocity * 800;
		translocator.velocity_z = 100;
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

	setmodel (translocator, "progs/laser.mdl");
	setsize (translocator, '0 0 0', '0 0 0');		
	setorigin (translocator, self.origin);
    
}