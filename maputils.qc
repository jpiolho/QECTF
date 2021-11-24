float map_removeDefaultEntities;

void() Maps_CleanEntities =
{
    map_removeDefaultEntities = 1;
    /*
    local entity ent = world;

	while(ent = nextent(ent)) {
		if(ent.classname == "item_health"
		|| ent.classname == "item_megahealth_rot"
		|| ent.classname == "item_armor1"
		|| ent.classname == "item_armor2"
		|| ent.classname == "item_armorInv"
		|| ent.classname == "item_rockets"
		|| ent.classname == "item_shells"
		|| ent.classname == "item_spikes"
		|| ent.classname == "item_cells"
		|| ent.classname == "item_weapon"
		|| ent.classname == "item_key1"
		|| ent.classname == "item_key2"
		|| ent.classname == "item_sigil"
		|| ent.classname == "item_artifact_invulnerability"
		|| ent.classname == "item_artifact_envirosuit"
		|| ent.classname == "item_artifact_invisibility"
		|| ent.classname == "item_artifact_super_damage"
		|| ent.classname == "weapon_rocketlauncher"
		|| ent.classname == "weapon_supershotgun"
		|| ent.classname == "weapon_nailgun"
		|| ent.classname == "weapon_supernailgun"
		|| ent.classname == "weapon_grenadelauncher"
		|| ent.classname == "weapon_lightning"
		) {
			remove(ent);
		}
	}
    */
}



float(entity ent) Maps_ShouldRemoveDefaultEntity =
{
    return map_removeDefaultEntities && !ent.impulse;
}

entity(string entityTarget) Maps_FindEntityByTarget =
{
	return find(world,target,entityTarget);
}

entity(string entityModel) Maps_FindEntityByModel =
{
	return find(world,model,entityModel);
}

void(string entityModel) Maps_RemoveEntitiesByModel =
{
	local entity p = world;
	while((p = find(p,model,entityModel)))
		remove(p);
}

void(string entityClassname) Maps_RemoveEntitiesByClassname =
{
	local entity p = world;
	while((p = find(p,classname,entityClassname)))
	{
		remove(p);	
	}
}

void(string entityTarget) Maps_RemoveEntitiesByTarget =
{
	local entity p = world;
	while((p = find(p,target,entityTarget)))
	{
		remove(p);	
	}
}

void(string entityTargetName) Maps_RemoveEntitiesByTargetName =
{
	local entity p = world;
	while((p = find(p,targetname,entityTargetName)))
	{
		remove(p);	
	}
}

void(string entityClassname,vector searchOrigin) Maps_RemoveEntityByClassnameContainingPoint =
{
	local entity p = world;
	while((p = find(p,classname,entityClassname)))
	{
		if(searchOrigin_x >= p.absmin_x && searchOrigin_y >= p.absmin_y && searchOrigin_z >= p.absmin_z && searchOrigin_x <= p.absmax_x && searchOrigin_y <= p.absmax_y && searchOrigin.z <= p.absmax_z)
			remove(p);
	}
}

entity(string entityClassname,vector searchOrigin) Maps_FindEntityByClassnameContainingPoint =
{
	local entity p = world;
	while((p = find(p,classname,entityClassname)))
	{
		if(searchOrigin_x >= p.absmin_x && searchOrigin_y >= p.absmin_y && searchOrigin_z >= p.absmin_z && searchOrigin_x <= p.absmax_x && searchOrigin_y <= p.absmax_y && searchOrigin.z <= p.absmax_z)
			return p;
	}

	return world;
}

void(float keyTeam,vector keyOrigin) Maps_SpawnTeamKey =
{
    local entity key = spawn();
    key.origin = keyOrigin;    
    key.team = keyTeam;
	key.impulse = 1;

    local entity oself = self;
    self = key;
    ctf_flag();
    self = oself;
}



void info_player_deathmatch();
void(float spawnTeam,vector spawnOrigin,vector spawnAngles) Maps_TeamSpawn =
{
	local entity playerSpawn = spawn();
	playerSpawn.origin = spawnOrigin;
	playerSpawn.team = spawnTeam;
	playerSpawn.impulse = 1;
	playerSpawn.angles = spawnAngles;

	local entity oself = self;
	self = playerSpawn;
	info_player_deathmatch();
	self = oself;
}

entity(float entityTeam,float entityBig,vector entityOrigin) Maps_SpawnItemShells =
{
	local entity ent = spawn();
	ent.origin = entityOrigin;
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "item_shells";

	if(entityBig)
		ent.spawnflags |= WEAPON_BIG2;

	local entity oself = self;
	self = ent;
	item_shells();
	self = oself;

	return ent;
}

entity(float entityTeam,float entityBig,vector entityOrigin) Maps_SpawnItemSpikes =
{
	local entity ent = spawn();
	ent.origin = entityOrigin;
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "item_spikes";

	if(entityBig)
		ent.spawnflags |= WEAPON_BIG2;

	local entity oself = self;
	self = ent;
	item_spikes();
	self = oself;

	return ent;
}

entity(float entityTeam,float entityBig,vector entityOrigin) Maps_SpawnItemRockets =
{
	local entity ent = spawn();
	ent.origin = entityOrigin;
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "item_rockets";

	if(entityBig)
		ent.spawnflags |= WEAPON_BIG2;

	local entity oself = self;
	self = ent;
	item_rockets();
	self = oself;

	return ent;
}

entity(float entityTeam,float entityBig,vector entityOrigin) Maps_SpawnItemCells =
{
	local entity ent = spawn();
	ent.origin = entityOrigin;
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "item_cells";

	if(entityBig)
		ent.spawnflags |= WEAPON_BIG2;

	local entity oself = self;
	self = ent;
	item_cells();
	self = oself;

	return ent;
}

entity(float entityTeam,vector entityOrigin) Maps_SpawnWeaponSuperShotgun =
{
	local entity ent = spawn();
	ent.origin = entityOrigin;
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "weapon_supershotgun";

	local entity oself = self;
	self = ent;
	weapon_supershotgun();
	self = oself;

	return ent;
}

entity(float entityTeam,vector entityOrigin) Maps_SpawnWeaponRocketLauncher =
{
	local entity ent = spawn();
	ent.origin = entityOrigin;
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "weapon_rocketlauncher";

	local entity oself = self;
	self = ent;
	weapon_rocketlauncher();
	self = oself;

	return ent;
}

entity(float entityTeam,vector entityOrigin) Maps_SpawnWeaponNailgun =
{
	local entity ent = spawn();
	ent.origin = entityOrigin;
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "weapon_nailgun";

	local entity oself = self;
	self = ent;
	weapon_nailgun();
	self = oself;

	return ent;
}

entity(float entityTeam,vector entityOrigin) Maps_SpawnWeaponSuperNailgun =
{
	local entity ent = spawn();
	ent.origin = entityOrigin;
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "weapon_supernailgun";

	local entity oself = self;
	self = ent;
	weapon_supernailgun();
	self = oself;

	return ent;
}

entity(float entityTeam,vector entityOrigin) Maps_SpawnWeaponLightning =
{
	local entity ent = spawn();
	ent.origin = entityOrigin;
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "weapon_lightning";

	local entity oself = self;
	self = ent;
	weapon_lightning();
	self = oself;

	return ent;
}

entity(float entityTeam,vector entityOrigin) Maps_SpawnWeaponGrenadeLauncher =
{
	local entity ent = spawn();
	ent.origin = entityOrigin;
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "weapon_grenadelauncher";

	local entity oself = self;
	self = ent;
	weapon_grenadelauncher();
	self = oself;

	return ent;
}


entity(float entityTeam,vector entityOrigin) Maps_SpawnArmor1 =
{
	local entity ent = spawn();
	ent.origin = entityOrigin;
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "item_armor1";

	local entity oself = self;
	self = ent;
	item_armor1();
	self = oself;

	return ent;
}

entity(float entityTeam,vector entityOrigin) Maps_SpawnArmor2 =
{
	local entity ent = spawn();
	ent.origin = entityOrigin;
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "item_armor2";

	local entity oself = self;
	self = ent;
	item_armor2();
	self = oself;

	return ent;
}

entity(float entityTeam,vector entityOrigin) Maps_SpawnArmorInv =
{
	local entity ent = spawn();
	ent.origin = entityOrigin;
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "item_armorInv";

	local entity oself = self;
	self = ent;
	item_armorInv();
	self = oself;

	return ent;
}


entity(float entityTeam,vector entityOrigin) Maps_SpawnHealth =
{
	local entity ent = spawn();
	ent.origin = entityOrigin;
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "item_health";

	local entity oself = self;
	self = ent;
	item_health();
	self = oself;

	return ent;
}

entity(float entityTeam,vector entityOrigin) Maps_SpawnHealthRotten =
{
	local entity ent = spawn();
	ent.origin = entityOrigin;
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "item_health";
	ent.spawnflags = 1;

	local entity oself = self;
	self = ent;
	item_health();
	self = oself;

	return ent;
}

entity(float entityTeam,vector entityOrigin) Maps_SpawnHealthMega =
{
	local entity ent = spawn();
	ent.origin = entityOrigin;
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "item_health";
	ent.spawnflags = 2;

	local entity oself = self;
	self = ent;
	item_health();
	self = oself;

	return ent;
}

entity(string entityModel,vector entityOrigin,vector entityAngles) Maps_CreateWall =
{
	local entity ent = spawn();
	ent.origin = entityOrigin;
	ent.model = entityModel;
	ent.classname = "func_wall";
	ent.impulse = 1;

	local entity oself = self;
	self = ent;
	func_wall();
	self = oself;

	ent.angles = entityAngles;

	return ent;
}

void(string entityModel,vector entityOriginStart,vector entityOriginEnd,vector entityAngles,float numberOfSteps) Maps_CreateStairs =
{
	local float i;
	local vector entityOrigin;

	for(i=0;i<=numberOfSteps;i++) {
		entityOrigin = entityOriginStart + (entityOriginEnd - entityOriginStart) * (i / numberOfSteps);

		Maps_CreateWall(entityModel,entityOrigin,entityAngles);
	}
}

entity(string entityName,vector entityOrigin,float entityAngle) Maps_CreateTeleportDestination =
{
	local entity ent = spawn();
	ent.origin = entityOrigin;
	ent.angles = '0 0 0';
	ent.angles_y = entityAngle;
	ent.classname = "info_teleport_destination";
	ent.targetname = entityName;
	ent.impulse = 1;

	local entity oself = self;
	self = ent;
	info_teleport_destination();
	self = oself;

	return ent;
}

entity(string entityTarget,vector entityOrigin,vector entitySize,float entityTeam,float effect) Maps_CreateTeleport =
{
	local entity ent = spawn();
	ent.origin = entityOrigin;
	ent.classname = "trigger_teleport";
	ent.target = entityTarget;
	ent.impulse = 1;

	if(effect)
		ent.spawnflags |= PARTICLE_EFFECT;

	local entity oself = self;
	self = ent;
	trigger_teleport();
	self = oself;

	local vector hullMin = '0 0 0';
	local vector hullMax = '0 0 0';
	hullMin -= entitySize / 2;
	hullMax += entitySize / 2;

	setsize(ent,hullMin,hullMax);
	ent.team = entityTeam;

	return ent;
}

void(string nextLevel) Maps_SetNextLevel = 
{
	local entity ent = spawn();
	ent.classname = "trigger_changelevel";
	ent.map = nextLevel;
	ent.impulse = 1;

	local entity oself = self;
	self = ent;
	trigger_changelevel();
	self = oself;

	setorigin(ent,'-9999 9999 -9999');
}

entity(string areaName,vector entityOrigin) Maps_CreateFlagBase =
{
	local entity ent = spawn();
	ent.origin = entityOrigin;
	ent.message = areaName;

	local entity oself = self;
	self = ent;
	ctf_base();
	self = oself;

	return ent;
}

entity(void() initializer,vector entityOrigin) Maps_CreateEntity =
{
	local entity ent = spawn();
	ent.origin = entityOrigin;

	local entity oself = self;
	self = ent;
	initializer();
	self = oself;

	return ent;
}