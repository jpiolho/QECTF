float(entity ent) ctf_isBot =
{
    return (ent.flags & FL_ISBOT);
}



float() ctf_botUpdate =
{
    if(ctf_gamemode == GAMEMODE_DEFAULT) {
        if(!ctf_playerHasFlag(self))
        {
            local entity targetFlag = ctf_findFlag(world,ctf_oppositeTeam(self.ctfTeam)); // Find the enemy flag
    
            if(targetFlag) {
                bot_movetopoint(self,targetFlag.origin);
            }
        }
        else {
            // We have the flag!

            // Find our flag
            local entity targetFlag = ctf_findFlag(world,self.ctfTeam); 

            if(targetFlag) {
                // Move to our capture point
                bot_movetopoint(self,targetFlag.origin);
            } else {
                // Couldn't find our flag. Someone must have it. Lets go to our base instead
                
            }
        }
    }
}