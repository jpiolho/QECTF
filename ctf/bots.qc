float(string name) ctf_getBotTeam =
{
    if(name == "[BOT] Azizam"
    || name == "[BOT] Bitterman"
    || name == "[BOT] Crapshoot"
    || name == "[BOT] Mr.Elusive"
    )
        return TEAM_RED;
    else if(name == "[BOT] Barney"
    || name == "[BOT] ClockParadox"
    || name == "[BOT] Demona"
    || name == "[BOT] FloridaMan")
        return TEAM_BLUE;

    return TEAM_ALL;
}

float(entity ent) ctf_isBot =
{
    if(ent.flags & FL_ISBOT)
        return TRUE;

    return ctf_getBotTeam(ent.netname) != TEAM_ALL;
}

/*
void(entity bot) ctf_botPreThink =
{
    dprint("Prethink (");
    dprint(bot.netname);
    dprint("): ");
    dprint(vtos(bot.velocity));
    dprint("\n");

    local entity p = world;
    while(p = find(p,classname,"ctf_flag"))
    {
        if(p.team == bot.team && !(p.cnt & FFL_HIDDEN))
        {
            draw_bounds(p.absmin,p.absmax,184,FALSE,FALSE);

            p.cnt |= FFL_BOT_HIDDEN;
            p.oldorigin = p.origin;
            p.origin = '-9999 -9999 -9999';
        }
    }
}


void(entity bot) ctf_botPostThink =
{
    dprint("Postthink (");
    dprint(bot.netname);
    dprint("): ");
    dprint(vtos(bot.velocity));
    dprint("\n");

    local entity p = world;
    while(p = find(p,classname,"ctf_flag"))
    {
        if(p.cnt & FFL_BOT_HIDDEN)
        {
            p.cnt -= FFL_BOT_HIDDEN;
            p.origin = p.oldorigin;
        }
    }
}

void(entity previousPlayer) ctf_nextBotThink =
{
    local entity p = previousPlayer;

    while(p = find(p,classname,"player"))
    {
        if(p.flags & FL_ISBOT) {
            if(previousPlayer != world && previousPlayer.flags & FL_ISBOT)
                ctf_botPostThink(previousPlayer);
            ctf_botPreThink(p);
            return;
        }
    }
    
    if(previousPlayer != world && previousPlayer.flags & FL_ISBOT)
        ctf_botPostThink(previousPlayer);
}
*/