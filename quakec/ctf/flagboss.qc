$cd id1/models/boss1
$origin 0 0 -15
$base base
$skin skin
$scale 5

$frame rise1 rise2 rise3 rise4 rise5 rise6 rise7 rise8 rise9 rise10
$frame rise11 rise12 rise13 rise14 rise15 rise16 rise17

$frame walk1 walk2 walk3 walk4 walk5 walk6 walk7 walk8
$frame walk9 walk10 walk11 walk12 walk13 walk14 walk15
$frame walk16 walk17 walk18 walk19 walk20 walk21 walk22
$frame walk23 walk24 walk25 walk26 walk27 walk28 walk29 walk30 walk31

$frame death1 death2 death3 death4 death5 death6 death7 death8 death9

$frame attack1 attack2 attack3 attack4 attack5 attack6 attack7 attack8
$frame attack9 attack10 attack11 attack12 attack13 attack14 attack15
$frame attack16 attack17 attack18 attack19 attack20 attack21 attack22
$frame attack23

$frame shocka1 shocka2 shocka3 shocka4 shocka5 shocka6 shocka7 shocka8
$frame shocka9 shocka10

$frame shockb1 shockb2 shockb3 shockb4 shockb5 shockb6

$frame shockc1 shockc2 shockc3 shockc4 shockc5 shockc6 shockc7 shockc8
$frame shockc9 shockc10


float FLAGBOSS_FL_AWAKEN = 1;
float FLAGBOSS_FL_AIMINGCAPTURE = 2;

enum FlagBossState {
	SLEEPING,
	AWAKENING,
	IDLE,
	DYING,
	AIMING_TOWARDS_CAPTURE,
	HAND_SIGNALING_CAPTURE
};

float() ai_face;
void() flagboss_face =
{
	// Check if the player lost the flag
	if (self.enemy && !ctf_doesPlayerHaveFlag(self.enemy))
	{
		self.enemy = world;


		// Find another player with a flag
		local entity p;
		while((p = find(p,classname,"player"))) 
		{
			if(ctf_doesPlayerHaveFlag(p))
			{
				self.enemy = p;
				break;
			}
		}
	}

	if(self.enemy) {
		ai_face();
	}
};



void(float newState) monster_flagboss_changeState =
{
	if(self.state == FlagBossState::AIMING_TOWARDS_CAPTURE)
	{
		// Remove the aiming towards entity
		if(self.enemy)
			remove(self.enemy);
	}

	self.state = newState;
}



void() flagboss_idle1	=[	$walk1, flagboss_idle2 ] { monster_flagboss_changeState(FlagBossState::IDLE); flagboss_face(); };
void() flagboss_idle2	=[	$walk2, flagboss_idle3 ] { flagboss_face(); };
void() flagboss_idle3	=[	$walk3, flagboss_idle4 ] { flagboss_face(); };
void() flagboss_idle4	=[	$walk4, flagboss_idle5 ] { flagboss_face(); };
void() flagboss_idle5	=[	$walk5, flagboss_idle6 ] { flagboss_face(); };
void() flagboss_idle6	=[	$walk6, flagboss_idle7 ] { flagboss_face(); };
void() flagboss_idle7	=[	$walk7, flagboss_idle8 ] { flagboss_face(); };
void() flagboss_idle8	=[	$walk8, flagboss_idle9 ] { flagboss_face(); };
void() flagboss_idle9	=[	$walk9, flagboss_idle10 ] { flagboss_face(); };
void() flagboss_idle10	=[	$walk10, flagboss_idle11 ] { flagboss_face(); };
void() flagboss_idle11	=[	$walk11, flagboss_idle12 ] { flagboss_face(); };
void() flagboss_idle12	=[	$walk12, flagboss_idle13 ] { flagboss_face(); };
void() flagboss_idle13	=[	$walk13, flagboss_idle14 ] { flagboss_face(); };
void() flagboss_idle14	=[	$walk14, flagboss_idle15 ] { flagboss_face(); };
void() flagboss_idle15	=[	$walk15, flagboss_idle16 ] { flagboss_face(); };
void() flagboss_idle16	=[	$walk16, flagboss_idle17 ] { flagboss_face(); };
void() flagboss_idle17	=[	$walk17, flagboss_idle18 ] { flagboss_face(); };
void() flagboss_idle18	=[	$walk18, flagboss_idle19 ] { flagboss_face(); };
void() flagboss_idle19	=[	$walk19, flagboss_idle20 ] { flagboss_face(); };
void() flagboss_idle20	=[	$walk20, flagboss_idle21 ] { flagboss_face(); };
void() flagboss_idle21	=[	$walk21, flagboss_idle22 ] { flagboss_face(); };
void() flagboss_idle22	=[	$walk22, flagboss_idle23 ] { flagboss_face(); };
void() flagboss_idle23	=[	$walk23, flagboss_idle24 ] { flagboss_face(); };
void() flagboss_idle24	=[	$walk24, flagboss_idle25 ] { flagboss_face(); };
void() flagboss_idle25	=[	$walk25, flagboss_idle26 ] { flagboss_face(); };
void() flagboss_idle26	=[	$walk26, flagboss_idle27 ] { flagboss_face(); };
void() flagboss_idle27	=[	$walk27, flagboss_idle28 ] { flagboss_face(); };
void() flagboss_idle28	=[	$walk28, flagboss_idle29 ] { flagboss_face(); };
void() flagboss_idle29	=[	$walk29, flagboss_idle30 ] { flagboss_face(); };
void() flagboss_idle30	=[	$walk30, flagboss_idle31 ] { flagboss_face(); };
void() flagboss_idle31	=[	$walk31, flagboss_idle1 ] { flagboss_face(); };



void() flagboss_hand1	=[	$attack1, flagboss_hand2 ] { monster_flagboss_changeState(FlagBossState::HAND_SIGNALING_CAPTURE); };
void() flagboss_hand2	=[	$attack2, flagboss_hand3 ] {};
void() flagboss_hand3	=[	$attack3, flagboss_hand4 ] {};
void() flagboss_hand4	=[	$attack4, flagboss_hand5 ] {};
void() flagboss_hand5	=[	$attack5, flagboss_hand6 ] {};
void() flagboss_hand6	=[	$attack6, flagboss_hand7 ] {};
void() flagboss_hand7	=[	$attack7, flagboss_hand8 ] {};
void() flagboss_hand8	=[	$attack8, flagboss_hand9 ] {};
void() flagboss_hand9	=[	$attack9, flagboss_hand10 ] { sound (self, CHAN_WEAPON, "boss1/throw.wav", 1, ATTN_NORM); };
void() flagboss_hand10	=[	$attack10, flagboss_hand11 ] {};
void() flagboss_hand11	=[	$attack11, flagboss_hand12 ] {};
void() flagboss_hand12	=[	$attack12, flagboss_hand13 ] {};
void() flagboss_hand13	=[	$attack13, flagboss_hand14 ] {};
void() flagboss_hand14	=[	$attack14, flagboss_hand15 ] {};
void() flagboss_hand15	=[	$attack15, flagboss_hand16 ] {};
void() flagboss_hand16	=[	$attack16, flagboss_hand17 ] {};
void() flagboss_hand17	=[	$attack17, flagboss_hand18 ] {};
void() flagboss_hand18	=[	$attack18, flagboss_hand19 ] {};
void() flagboss_hand19	=[	$attack19, flagboss_hand20 ] {};
void() flagboss_hand20	=[	$attack20, flagboss_hand21 ] { sound (self, CHAN_WEAPON, "boss1/throw.wav", 1, ATTN_NORM); };
void() flagboss_hand21	=[	$attack21, flagboss_hand22 ] {};
void() flagboss_hand22	=[	$attack22, flagboss_hand23 ] {};
void() flagboss_hand23	=[	$attack23, flagboss_idle1 ] { };

void() flagboss_faceCapture =
{
	if(ai_face())
	{
		remove(self.enemy); // Remove the temporary entity
		self.enemy = world;

		flagboss_hand1();
	}
}


void() flagboss_aimingTowardsCapture1	=[	$walk1, flagboss_aimingTowardsCapture2 ] { monster_flagboss_changeState(FlagBossState::AIMING_TOWARDS_CAPTURE); flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture2	=[	$walk2, flagboss_aimingTowardsCapture3 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture3	=[	$walk3, flagboss_aimingTowardsCapture4 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture4	=[	$walk4, flagboss_aimingTowardsCapture5 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture5	=[	$walk5, flagboss_aimingTowardsCapture6 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture6	=[	$walk6, flagboss_aimingTowardsCapture7 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture7	=[	$walk7, flagboss_aimingTowardsCapture8 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture8	=[	$walk8, flagboss_aimingTowardsCapture9 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture9	=[	$walk9, flagboss_aimingTowardsCapture10 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture10	=[	$walk10, flagboss_aimingTowardsCapture11 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture11	=[	$walk11, flagboss_aimingTowardsCapture12 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture12	=[	$walk12, flagboss_aimingTowardsCapture13 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture13	=[	$walk13, flagboss_aimingTowardsCapture14 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture14	=[	$walk14, flagboss_aimingTowardsCapture15 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture15	=[	$walk15, flagboss_aimingTowardsCapture16 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture16	=[	$walk16, flagboss_aimingTowardsCapture17 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture17	=[	$walk17, flagboss_aimingTowardsCapture18 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture18	=[	$walk18, flagboss_aimingTowardsCapture19 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture19	=[	$walk19, flagboss_aimingTowardsCapture20 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture20	=[	$walk20, flagboss_aimingTowardsCapture21 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture21	=[	$walk21, flagboss_aimingTowardsCapture22 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture22	=[	$walk22, flagboss_aimingTowardsCapture23 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture23	=[	$walk23, flagboss_aimingTowardsCapture24 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture24	=[	$walk24, flagboss_aimingTowardsCapture25 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture25	=[	$walk25, flagboss_aimingTowardsCapture26 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture26	=[	$walk26, flagboss_aimingTowardsCapture27 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture27	=[	$walk27, flagboss_aimingTowardsCapture28 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture28	=[	$walk28, flagboss_aimingTowardsCapture29 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture29	=[	$walk29, flagboss_aimingTowardsCapture30 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture30	=[	$walk30, flagboss_aimingTowardsCapture31 ] { flagboss_faceCapture(); };
void() flagboss_aimingTowardsCapture31	=[	$walk31, flagboss_aimingTowardsCapture1 ] { flagboss_faceCapture(); };

void() flagboss_rise1	=[	$rise1, flagboss_rise2 ] {
	monster_flagboss_changeState(FlagBossState::AWAKENING);
	sound (self, CHAN_WEAPON, "boss1/out1.wav", 1, ATTN_NORM);
};
void() flagboss_rise2	=[	$rise2, flagboss_rise3 ] {
	sound (self, CHAN_VOICE, "boss1/sight1.wav", 1, ATTN_NORM);
};
void() flagboss_rise3	=[	$rise3, flagboss_rise4 ] {};
void() flagboss_rise4	=[	$rise4, flagboss_rise5 ] {};
void() flagboss_rise5	=[	$rise5, flagboss_rise6 ] {};
void() flagboss_rise6	=[	$rise6, flagboss_rise7 ] {};
void() flagboss_rise7	=[	$rise7, flagboss_rise8 ] {};
void() flagboss_rise8	=[	$rise8, flagboss_rise9 ] {};
void() flagboss_rise9	=[	$rise9, flagboss_rise10 ] {};
void() flagboss_rise10	=[	$rise10, flagboss_rise11 ] {};
void() flagboss_rise11	=[	$rise11, flagboss_rise12 ] {};
void() flagboss_rise12	=[	$rise12, flagboss_rise13 ] {};
void() flagboss_rise13	=[	$rise13, flagboss_rise14 ] {};
void() flagboss_rise14	=[	$rise14, flagboss_rise15 ] {};
void() flagboss_rise15	=[	$rise15, flagboss_idle1 ] {};
//void() flagboss_rise16	=[	$rise16, flagboss_rise17 ] {};
//void() flagboss_rise17	=[	$rise17, flagboss_idle1 ] { };

void() flagboss_deathidle = [$death9,flagboss_deathidle] {};

void() flagboss_death1 = [$death1, flagboss_death2] {
	sound (self, CHAN_VOICE, "boss1/death.wav", 1, ATTN_NORM);
};
void() flagboss_death2 = [$death2, flagboss_death3] {};
void() flagboss_death3 = [$death3, flagboss_death4] {};
void() flagboss_death4 = [$death4, flagboss_death5] {};
void() flagboss_death5 = [$death5, flagboss_death6] {};
void() flagboss_death6 = [$death6, flagboss_death7] {};
void() flagboss_death7 = [$death7, flagboss_death8] {};
void() flagboss_death8 = [$death8, flagboss_death9] {};
void() flagboss_death9 = [$death9, flagboss_death10]
{
	sound (self, CHAN_BODY, "boss1/out1.wav", 1, ATTN_NORM);
	WriteByte (MSG_BROADCAST, SVC_TEMPENTITY);
	WriteByte (MSG_BROADCAST, TE_LAVASPLASH);
	WriteCoord (MSG_BROADCAST, self.origin_x);
	WriteCoord (MSG_BROADCAST, self.origin_y);
	WriteCoord (MSG_BROADCAST, self.origin_z);
};
void() flagboss_death10 = [$death9, flagboss_deathidle] {
	monster_flagboss_changeState(FlagBossState::SLEEPING);
	setmodel(self,string_null);

	self.wait = time + 60.0;
	self.solid = SOLID_NOT;
};

void() flagboss_shocka1 =[	$shocka1, flagboss_shocka2 ] {};
void() flagboss_shocka2 =[	$shocka2, flagboss_shocka3 ] {};
void() flagboss_shocka3 =[	$shocka3, flagboss_shocka4 ] {};
void() flagboss_shocka4 =[	$shocka4, flagboss_shocka5 ] {};
void() flagboss_shocka5 =[	$shocka5, flagboss_shocka6 ] {};
void() flagboss_shocka6 =[	$shocka6, flagboss_shocka7 ] {};
void() flagboss_shocka7 =[	$shocka7, flagboss_shocka8 ] {};
void() flagboss_shocka8 =[	$shocka8, flagboss_shocka9 ] {};
void() flagboss_shocka9 =[	$shocka9, flagboss_shocka10 ] {};
void() flagboss_shocka10 =[	$shocka10, flagboss_idle1 ] {};

void() flagboss_shockb1 =[	$shockb1, flagboss_shockb2 ] {};
void() flagboss_shockb2 =[	$shockb2, flagboss_shockb3 ] {};
void() flagboss_shockb3 =[	$shockb3, flagboss_shockb4 ] {};
void() flagboss_shockb4 =[	$shockb4, flagboss_shockb5 ] {};
void() flagboss_shockb5 =[	$shockb5, flagboss_shockb6 ] {};
void() flagboss_shockb6 =[	$shockb6, flagboss_shockb7 ] {};
void() flagboss_shockb7 =[	$shockb1, flagboss_shockb8 ] {};
void() flagboss_shockb8 =[	$shockb2, flagboss_shockb9 ] {};
void() flagboss_shockb9 =[	$shockb3, flagboss_shockb10 ] {};
void() flagboss_shockb10 =[	$shockb4, flagboss_idle1 ] {};

void() flagboss_shockc1 =[	$shockc1, flagboss_shockc2 ] { monster_flagboss_changeState(FlagBossState::DYING); };
void() flagboss_shockc2 =[	$shockc2, flagboss_shockc3 ] {};
void() flagboss_shockc3 =[	$shockc3, flagboss_shockc4 ] {};
void() flagboss_shockc4 =[	$shockc4, flagboss_shockc5 ] {};
void() flagboss_shockc5 =[	$shockc5, flagboss_shockc6 ] {};
void() flagboss_shockc6 =[	$shockc6, flagboss_shockc7 ] {};
void() flagboss_shockc7 =[	$shockc7, flagboss_shockc8 ] {};
void() flagboss_shockc8 =[	$shockc8, flagboss_shockc9 ] {};
void() flagboss_shockc9 =[	$shockc9, flagboss_shockc10 ] {};
void() flagboss_shockc10 =[	$shockc10, flagboss_death1 ] {};







void(vector captureLocation) monster_flagboss_aimForCapture =
{
	// Only aim for capture if currently idle, following a player or aiming towards another capture
	if(self.state != FlagBossState::IDLE
    && self.state != FlagBossState::AIMING_TOWARDS_CAPTURE)
		return;
		
	// Delete a current aiming target, if applicable
	if(self.state == FlagBossState::AIMING_TOWARDS_CAPTURE)
		remove(self.enemy);
	
	self.enemy = spawn();
	self.enemy.origin = captureLocation;

	flagboss_aimingTowardsCapture1();
}

void() monster_flagboss_lightning =
{
	// Only damage in these states
	if(self.state != FlagBossState::IDLE
	&& self.state != FlagBossState::HAND_SIGNALING_CAPTURE
	&& self.state != FlagBossState::AIMING_TOWARDS_CAPTURE)
		return;

	// Only play hurt animation in these states

	self.health--;

	if(self.health >= 2)
		flagboss_shocka1();
	else if(self.health == 1)
		flagboss_shockb1();			
	else if(self.health <= 0)
		flagboss_shockc1();
}

void() monster_flagboss_awake = 
{
    self.solid = SOLID_BBOX;
	self.movetype = MOVETYPE_STEP;
	self.takedamage = DAMAGE_NO;
	self.health = 6;

	setmodel (self, "progs/boss.mdl");
	setsize (self, '-128 -128 -24', '128 128 320');

	WriteByte (MSG_BROADCAST, SVC_TEMPENTITY);
	WriteByte (MSG_BROADCAST, TE_LAVASPLASH);
	WriteCoord (MSG_BROADCAST, self.origin_x);
	WriteCoord (MSG_BROADCAST, self.origin_y);
	WriteCoord (MSG_BROADCAST, self.origin_z);

	self.yaw_speed = 20;
	flagboss_rise1 ();
}

void(entity player) monster_flagboss_playerPickedUpFlag =
{
	if(self.state == FlagBossState::SLEEPING && time >= self.wait) {
		self.enemy = player;
		monster_flagboss_awake();
		return;
	}

	if(self.state != FlagBossState::IDLE
	&& self.state != FlagBossState::AIMING_TOWARDS_CAPTURE)
		return;

	flagboss_idle1();

	self.enemy = player;
}


void() monster_flagboss =
{
	monster_flagboss_changeState(FlagBossState::SLEEPING);
	self.classname = "monster_flagboss";
	self.wait = time;

    precache_model ("progs/boss.mdl");
	precache_model ("progs/lavaball.mdl");

	precache_sound ("weapons/rocket1i.wav");
	precache_sound ("boss1/out1.wav");
	precache_sound ("boss1/sight1.wav");
	precache_sound ("misc/power.wav");
	precache_sound ("boss1/throw.wav");
	precache_sound ("boss1/pain.wav");
	precache_sound ("boss1/death.wav");

}