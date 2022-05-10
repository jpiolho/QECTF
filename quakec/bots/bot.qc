/*  Copyright (C) 1996-2022 id Software LLC

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

    See file, 'COPYING', for details.
*/


/*
 * Makes all unpickable items invisible to the current bot. To be used to mark items that the bot can't pick up (eg: Other team).
 */
void Bot_PushUnpickableItems() {
    local entity p = world;

    // Go through all entities and mark them, while adding the 'no bot' flag
    while((p = nextent(p))) {
        
        // We're only interested in entities from the other teams
        if(p.team == TEAM_ALL || p.team == self.ctfTeam)
            continue;

        if(p.touch == health_touch
        || p.touch == armor_touch
        || p.touch == weapon_touch
        || p.touch == ammo_touch) {
            p.flags |= FL_NO_BOTS;
            p.bot_flag |= BotFlags::MARKED;
        }
    }
};

/*
 * Restore unpickable items. Should be called always at the end of the bot frame whenever Bot_PushUnpickableItems gets called.
 */
void Bot_PopUnpickableItems() {
    local entity p = world;

    // Find all entities with Bot flag MARKED and remove the 'no bot' flag 
    while((p = nextent(p))) {
        if(p.bot_flag & BotFlags::MARKED) {
            p.flags -= FL_NO_BOTS;
            p.bot_flag -= BotFlags::MARKED;
        }
    }
};


void Bot_SetState(entity bot,void() state,float execute=TRUE) {
    bot.bot_state = state;
    
    if(execute) {
        local entity oself = self;
        self = bot;
        state();
        self = oself;
    }
};




void() BotState_CaptureFlag;
void() BotState_GrabFlag;
void() BotState_Idle;
void() BotState_PickupDroppedFlag;



void() Bot_Action_CheckDroppedFlag= {
    local entity ownFlag = world;
    local entity enemyFlag = world;

    local entity p = world;
    while((p = find(p,classname,"ctf_flag_dropped"))) {
        traceline(self.origin,p.origin, TRUE, self);

        if(trace_fraction == 1.0) {
            // Means we can see the flag
            if(p.team == self.ctfTeam) {
                ownFlag = p;
            } else {
                enemyFlag = p;
            }
        }
    }

    // Give priority to our own flag
    if(ownFlag) {
        self.bot_target = ownFlag;
        Bot_SetState(self,BotState_PickupDroppedFlag);
    } else if(enemyFlag) {
        self.bot_target = enemyFlag;
        Bot_SetState(self,BotState_PickupDroppedFlag);
    }
    
};



void() BotState_PickupDroppedFlag = {
    if(!self.bot_target || self.bot_target.modelindex == 0)
        return Bot_SetState(self,BotState_Idle);


    bot_movetopoint(self,self.bot_target.origin);
};


void() BotState_CaptureFlag = {
    if(!ctf_playerHasFlag(self)) {
        Bot_SetState(self,BotState_GrabFlag);
        return;
    }

    Bot_Action_CheckDroppedFlag();

    if(ctf_gamemode == GAMEMODE_DEFAULT) {
        // Find our flag
        local entity targetFlag = ctf_findFlag(world,self.ctfTeam); 

        if(targetFlag) {
            // Move to our capture point
            bot_movetopoint(self,targetFlag.origin);
        } else {
            // Couldn't find our flag. Someone must have it. Lets go to our base instead
            
        }
    }
    else if(ctf_gamemode == GAMEMODE_AREA_CAPTURE) {
        if(!self.bot_target  // Is it still valid?
        || self.bot_target.classname != "ctf_base"  // Is it a base?
        || (self.bot_target.flagentity && self.bot_target.flagentity.team == self.ctfTeam) // Is it our team already?
        ) {
            // Find another base

            local float(entity ent) isCTFBase = {
                return ent.classname == "ctf_base"
                    && !ent.flagentity
                    && ent.flagentity.team != self.ctfTeam;
            }

            self.bot_target = ctf_randomEntity(isCTFBase);
        }

        if(self.bot_target)
            bot_movetopoint(self,self.bot_target.origin);
    }
};

void() BotState_GrabFlag = {
    if(ctf_playerHasFlag(self)) {
        Bot_SetState(self,BotState_CaptureFlag);
        return;
    }

    Bot_Action_CheckDroppedFlag();

    local entity targetFlag;

    if(ctf_gamemode == GAMEMODE_DEFAULT) {
        // Find the enemy flag
        targetFlag = ctf_findFlag(world,ctf_oppositeTeam(self.ctfTeam)); 
    } else {
        targetFlag = ctf_findFlag(world,self.ctfTeam);
    }

    if(targetFlag) {
        bot_movetopoint(self,targetFlag.origin);
    }
};

void() BotState_Idle = {
    Bot_SetState(self,BotState_GrabFlag);
};


/*
========================
Bot_PreThink

Called by the engine every frame before running the bots update in C++

NOTE: "self" will be the calling bot

Example usages of this function:

	1. Telling bots what to do or where to go ( i.e. setting a high level goal ).
	2. Modifying properties on the bot player ( or other players in-game ) that the bots can see/use doing their update.
========================
*/
void Bot_PreThink() {
    Bot_PushUnpickableItems();

    if(!self.bot_state || self.bot_state == SUB_Null)
        self.bot_state = BotState_Idle;

    self.bot_state();
};

/*
========================
Bot_PostThink

Called by the engine every frame after running the bots update in C++

NOTE: "self" will be the calling bot

Example usages of this function:

	1. Overriding/modifying bot user cmds.
	2. Overriding/modifying bot player properties.
========================
*/
void Bot_PostThink() {
    Bot_PopUnpickableItems();
};
