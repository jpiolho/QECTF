/*
alias "entmod" "scratch1 0;impulse 80";
alias "ent_print" "scratch1 1;impulse 80";
alias "ent_copy" "scratch1 2;impulse 80";
alias "ent_move" "scratch1 3;impulse 80";
alias "ent_rotate" "scratch1 4;impulse 80";
alias "ent_remove" "scratch1 5;impulse 80";
*/

void() Entmod_Command_Activate =
{
    entmod.active = TRUE;
    entmod.mode = ENTMOD_MODE_NONE;


    sprint(self,"Entmod activated\n");
    self.weapon = IT_SHOTGUN;
}

void() Entmod_Command_Deactivate =
{
    entmod.active = FALSE;
    sprint(self,"Entmod deactivated\n");
}

void() Entmod_Command_PrintEntity =
{
    if(!entmod.selectedEntity)
        return Entmod_Error_NoEntitySelected();
    
    eprint(entmod.selectedEntity);
}


void() Entmod_Command_GrabEntity =
{
    if(!entmod.selectedEntity)
        return Entmod_Error_NoEntitySelected();

    if(entmod.mode == ENTMOD_MODE_NONE) {
        entmod.mode = ENTMOD_MODE_MOVING;
        sprint(self,"Started moving entity\n");

        entmod.moverStartOrigin = self.origin;
        entmod.moveeStartOrigin = entmod.selectedEntity.origin;
    } 
    else if(entmod.mode == ENTMOD_MODE_MOVING) {
        entmod.mode = ENTMOD_MODE_NONE;
        sprint(self,"Stopped moving entity\n");
    }
    else {
        sprint(self,"Invalid mode\n");
    }
}

void() Entmod_Command_Copy =
{
    if(!entmod.selectedEntity)
        return Entmod_Error_NoEntitySelected();

    
    local string targetClass = entmod.selectedEntity.classname;
    if(targetClass == "func_wall" || targetClass == "func_plat" || targetClass == "func_door" || targetClass == "func_button")
    {
        local entity newEnt = spawn();
        newEnt.origin = entmod.selectedEntity.origin;
        newEnt.model = entmod.selectedEntity.model;
        newEnt.classname = "func_wall";

        local entity oself = self;
        self = newEnt;
        func_wall();
        self = oself;

        entmod.selectedEntity = newEnt;

        sprint(self,"Entity copied into func_wall\n");
    }
}

void() Entmod_Command_Rotate = 
{
    if(!entmod.selectedEntity)
        return Entmod_Error_NoEntitySelected();

    sprint(self,"Entity rotated\n");

    entmod.selectedEntity.angles_y += 90;
    //setsize(entmod.selectedEntity,entmod.selectedEntity.mins,entmod.selectedEntity.maxs);
    //setmodel (entmod.selectedEntity, entmod.selectedEntity.model);
}


void() Entmod_Command_Remove =
{
    if(!entmod.selectedEntity)
        return Entmod_Error_NoEntitySelected();

    sprint(self,"Entity removed\n");

    remove(entmod.selectedEntity);

    entmod.selectedEntity = world;
}

void() Entmod_HandleCommand =
{
    // Only the host can do it
    if(self != find(world,classname,"player"))
        return;

    if(!entmod.active)
    {
        Entmod_Command_Activate();
        return;
    }

    local float scratch = cvar("scratch1");
    switch(scratch) {
        default: sprint(self,"Unknown entmod command\n"); break;
        case 0: Entmod_Command_Deactivate(); break;
        case 1: Entmod_Command_PrintEntity(); break;
        case 2: Entmod_Command_Copy(); break;
        case 3: Entmod_Command_GrabEntity(); break;
        case 4: Entmod_Command_Rotate(); break;
        case 5: Entmod_Command_Remove(); break;
    }
    
}