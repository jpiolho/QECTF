vector() GetEyesPosition =
{
    return self.origin + '0 0 16';
}

vector() GetAimTargetVector =
{
    makevectors (self.v_angle);

    return GetEyesPosition() + v_forward * 10000;
}

entity() TraceForward =
{
    traceline (GetEyesPosition(), GetAimTargetVector(), FALSE, self);
	
    if (trace_fraction == 1.0)
		return FALSE;

    if(trace_ent != world)
        return trace_ent;

    return FALSE;
}

void() Entmod_RenderSelectedEntity = 
{
    if(!entmod.selectedEntity)
        return;

    local vector size = entmod.selectedEntity.absmax - entmod.selectedEntity.absmin;
    local vector center = entmod.selectedEntity.absmax - (size / 2);
    local vector eyes = self.origin + '0 0 16';

    local vector playerHeightAdjustedCenter = center;
    playerHeightAdjustedCenter_z = math_clamp(eyes_z,entmod.selectedEntity.absmin_z,entmod.selectedEntity.absmax_z);


    draw_bounds(entmod.selectedEntity.absmin,entmod.selectedEntity.absmax,192,0,FALSE);
    
    local vector textPlacement = playerHeightAdjustedCenter;
    draw_worldtext(entmod.selectedEntity.classname,textPlacement,0.1,FALSE,FALSE);

    if(entmod.selectedEntity.targetname) {
        textPlacement -= '0 0 4';
        draw_worldtext(entmod.selectedEntity.targetname,textPlacement,0.1,FALSE,FALSE);
    }

    if(entmod.selectedEntity.model) {
        textPlacement -= '0 0 4';
        draw_worldtext(entmod.selectedEntity.model,textPlacement,0.1,FALSE,FALSE);
    }
}

void() Entmod_RenderSelectionMarker =
{
    local entity targetEnt = TraceForward();
    local float markerColor = 254;

    if(targetEnt)
        markerColor = 95;

    draw_sphere(trace_endpos,5.0,markerColor,0.001,TRUE);
}

float() Entmod_PlayerPreThink =
{
    Entmod_RenderSelectedEntity();

    if(self.weapon == IT_SHOTGUN) {
        Entmod_RenderSelectionMarker();
    }


    // Handle moving mode
    if(entmod.mode == ENTMOD_MODE_MOVING) {
        local vector offset = self.origin - entmod.moverStartOrigin;
        setorigin(entmod.selectedEntity,entmod.moveeStartOrigin + offset);
    }

    return TRUE;
}

float() Entmod_PlayerPostThink =
{
    if(self.weapon != IT_SHOTGUN)
        return TRUE;
    
}

float() Entmod_PlayerAttack =
{
    if(self.weapon != IT_SHOTGUN)
        return TRUE;

    // Effects
    player_shot1 ();
    sound (self, CHAN_WEAPON, "weapons/guncock.wav", 1, ATTN_NORM);	
    self.attack_finished = time + 0.5;

    // Try to select new entity
    local entity targetEnt = TraceForward();

    // Deselect the entity
    if(entmod.selectedEntity) {
        entmod.selectedEntity = FALSE;
    }
    

    if(!targetEnt)
    {
        // Try to find an entity close to the cursor
        local entity foundEnt = findradius(trace_endpos,64);

        while(foundEnt) {
            if(foundEnt != world && foundEnt != self && foundEnt != entmod.selectedEntity)
            {
                targetEnt = foundEnt;
                break;
            }
            foundEnt = foundEnt.chain;
        }

    }

    if(targetEnt) 
        entmod.selectedEntity = targetEnt;


    return FALSE;
}


float() Entmod_HandleImpulse =
{
    if(self.impulse == 80) {
		Entmod_HandleCommand();
        return FALSE;
    }


    return TRUE;
}


void() Entmod_Error_NoEntitySelected =
{
    sprint(self,"No entity is selected\n");
}



