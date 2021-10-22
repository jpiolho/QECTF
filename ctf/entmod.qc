void() Entmod_HandleCommand =
{
    if(self != find(world,classname,"player"))
        return;

    local entity thing = world;
    while(thing = nextent(thing))
    {
        draw_point(thing.origin,self.colormap,10.0,FALSE);
    }
}