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


/*
Entities Functions
*/

entity(vector entityOrigin) Maps_CreateEntityAtPosition =
{
	local entity ent = spawn();
	ent.origin = entityOrigin;
	return ent;
}

entity(entity ent, void() initializer) Maps_InitializeEntity =
{
	local entity oself = self;
	self = ent;
	initializer();
	self = oself;

	return ent;
}

void(float keyTeam,vector keyOrigin) Maps_SpawnTeamKey =
{
	local entity key = Maps_CreateEntityAtPosition(keyOrigin);
	key.team = keyTeam;
	key.impulse = 1;
    
	Maps_InitializeEntity(key,ctf_flag);
}



void info_player_deathmatch();
void(float spawnTeam,vector spawnOrigin,vector spawnAngles) Maps_TeamSpawn =
{
	local entity playerSpawn = Maps_CreateEntityAtPosition(spawnOrigin);
	playerSpawn.team = spawnTeam;
	playerSpawn.impulse = 1;
	playerSpawn.angles = spawnAngles;

	Maps_InitializeEntity(playerSpawn,info_player_deathmatch);
}

entity(float entityTeam,float entityBig,vector entityOrigin) Maps_SpawnItemShells =
{
	local entity ent = Maps_CreateEntityAtPosition(entityOrigin);
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "item_shells";

	if(entityBig)
		ent.spawnflags |= WEAPON_BIG2;

	return Maps_InitializeEntity(ent,item_shells);
}

entity(float entityTeam,float entityBig,vector entityOrigin) Maps_SpawnItemSpikes =
{
	local entity ent = Maps_CreateEntityAtPosition(entityOrigin);
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "item_spikes";

	if(entityBig)
		ent.spawnflags |= WEAPON_BIG2;

	return Maps_InitializeEntity(ent,item_spikes);
}

entity(float entityTeam,float entityBig,vector entityOrigin) Maps_SpawnItemRockets =
{
	local entity ent = Maps_CreateEntityAtPosition(entityOrigin);
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "item_rockets";

	if(entityBig)
		ent.spawnflags |= WEAPON_BIG2;

	return Maps_InitializeEntity(ent,item_rockets);
}

entity(float entityTeam,float entityBig,vector entityOrigin) Maps_SpawnItemCells =
{
	local entity ent = Maps_CreateEntityAtPosition(entityOrigin);
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "item_cells";

	if(entityBig)
		ent.spawnflags |= WEAPON_BIG2;

	return Maps_InitializeEntity(ent,item_cells);
}

entity(float entityTeam,vector entityOrigin) Maps_SpawnWeaponSuperShotgun =
{
	local entity ent = Maps_CreateEntityAtPosition(entityOrigin);
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "weapon_supershotgun";

	return Maps_InitializeEntity(ent,weapon_supershotgun);
}

entity(float entityTeam,vector entityOrigin) Maps_SpawnWeaponRocketLauncher =
{
	local entity ent = Maps_CreateEntityAtPosition(entityOrigin);
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "weapon_rocketlauncher";

	return Maps_InitializeEntity(ent,weapon_rocketlauncher);
}

entity(float entityTeam,vector entityOrigin) Maps_SpawnWeaponNailgun =
{
	local entity ent = Maps_CreateEntityAtPosition(entityOrigin);
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "weapon_nailgun";

	return Maps_InitializeEntity(ent,weapon_nailgun);
}

entity(float entityTeam,vector entityOrigin) Maps_SpawnWeaponSuperNailgun =
{
	local entity ent = Maps_CreateEntityAtPosition(entityOrigin);
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "weapon_supernailgun";

	return Maps_InitializeEntity(ent,weapon_supernailgun);
}

entity(float entityTeam,vector entityOrigin) Maps_SpawnWeaponLightning =
{
	local entity ent = Maps_CreateEntityAtPosition(entityOrigin);
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "weapon_lightning";

	return Maps_InitializeEntity(ent,weapon_lightning);
}

entity(float entityTeam,vector entityOrigin) Maps_SpawnWeaponGrenadeLauncher =
{
	local entity ent = Maps_CreateEntityAtPosition(entityOrigin);
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "weapon_grenadelauncher";

	return Maps_InitializeEntity(ent,weapon_grenadelauncher);
}


entity(float entityTeam,vector entityOrigin) Maps_SpawnArmor1 =
{
	local entity ent = Maps_CreateEntityAtPosition(entityOrigin);
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "item_armor1";

	return Maps_InitializeEntity(ent,item_armor1);
}

entity(float entityTeam,vector entityOrigin) Maps_SpawnArmor2 =
{
	local entity ent = Maps_CreateEntityAtPosition(entityOrigin);
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "item_armor2";

	return Maps_InitializeEntity(ent,item_armor2);
}

entity(float entityTeam,vector entityOrigin) Maps_SpawnArmorInv =
{
	local entity ent = Maps_CreateEntityAtPosition(entityOrigin);
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "item_armorInv";

	return Maps_InitializeEntity(ent,item_armorInv);
}


entity(float entityTeam,vector entityOrigin) Maps_SpawnHealth =
{
	local entity ent = Maps_CreateEntityAtPosition(entityOrigin);
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "item_health";

	return Maps_InitializeEntity(ent,item_health);
}

entity(float entityTeam,vector entityOrigin) Maps_SpawnHealthRotten =
{
	local entity ent = Maps_CreateEntityAtPosition(entityOrigin);
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "item_health";
	ent.spawnflags = 1;

	return Maps_InitializeEntity(ent,item_health);
}

entity(float entityTeam,vector entityOrigin) Maps_SpawnHealthMega =
{
	local entity ent = Maps_CreateEntityAtPosition(entityOrigin);
	ent.impulse = 1;
	ent.team = entityTeam;
	ent.classname = "item_health";
	ent.spawnflags = 2;

	return Maps_InitializeEntity(ent,item_health);
}

entity(string entityModel,vector entityOrigin,vector entityAngles) Maps_CreateWall =
{
	local entity ent = Maps_CreateEntityAtPosition(entityOrigin);
	ent.model = entityModel;
	ent.classname = "func_wall";
	ent.impulse = 1;

	Maps_InitializeEntity(ent,func_wall);

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
	local entity ent = Maps_CreateEntityAtPosition(entityOrigin);
	ent.angles = '0 0 0';
	ent.angles_y = entityAngle;
	ent.classname = "info_teleport_destination";
	ent.targetname = entityName;
	ent.impulse = 1;

	return Maps_InitializeEntity(ent,info_teleport_destination);
}

entity(string entityTarget,vector entityOrigin,vector entitySize,float entityTeam,float effect) Maps_CreateTeleport =
{
	local entity ent = Maps_CreateEntityAtPosition(entityOrigin);
	ent.classname = "trigger_teleport";
	ent.target = entityTarget;
	ent.impulse = 1;

	if(effect)
		ent.spawnflags |= PARTICLE_EFFECT;

	Maps_InitializeEntity(ent,trigger_teleport);

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

	Maps_InitializeEntity(ent,trigger_changelevel);

	setorigin(ent,'-9999 9999 -9999');
}

entity(string areaName,vector entityOrigin) Maps_CreateFlagBase =
{
	local entity ent = Maps_CreateEntityAtPosition(entityOrigin);
	ent.message = areaName;

	return Maps_InitializeEntity(ent,ctf_base);
}

