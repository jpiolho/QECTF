

void PopulateMap() =
{
    if(mapname == "dm6")
        Populate_DM6();
    else if(mapname == "dm3")
        Populate_DM3();
}

void PostPopulateMap() {
    if(mapname == "dm6")
        PostPopulate_DM6();
    else if(mapname == "dm3")
        PostPopulate_DM3();
}

string(string title) GetMapName =
{
    if(mapname == "base32b" && title == "Base 32") {
        return "Base 32 (QECTF)";
    } else if(mapname == "death32c" && title == "Death 32") {
        return "Death 32 (QECTF)";
    } else if(mapname == "dm1" && title == "Place of Two Deaths") {
        return "Place of Two Deaths (QECTF)";
    } else if(mapname == "dm2" && title == "Claustrophobopolis") {
        return "Claustrophobopolis (QECTF)";
    } else if(mapname == "dm3" && title == "The Abandoned Base") {
        return "The Abandoned Base (QECTF)";
    } else if(mapname == "dm4" && title == "The Bad Place") {
        return "The Bad Place (QECTF)";
    } else if(mapname == "dm5" && title == "The Cistern") {
        return "The Cistern (QECTF)";
    } else if(mapname == "dm6" && title == "The Dark Zone") {
        return "The Dark Zone (QECTF)";
    } else if(mapname == "dm7" && title == "The Edge") {
        return "The Edge (QECTF)";
    } else if(mapname == "dm8" && title == "Acrophobia") {
        return "Acrophobia (QECTF)";
    } else if(mapname == "e1m1" && title == "The Slipgate Complex") {
        return "The Slipgate Complex (QECTF)";
    } else if(mapname == "e1m2" && title == "Castle of the Damned") {
        return "Castle of the Damned (QECTF)";
    } else if(mapname == "e1m3" && title == "The Necropolis") {
        return "The Necropolis (QECTF)";
    } else if(mapname == "e1m4" && title == "The Grisly Grotto") {
        return "The Grisly Grotto (QECTF)";
    } else if(mapname == "e1m5" && title == "Gloom Keep") {
        return "Gloom Keep (QECTF)";
    } else if(mapname == "e1m6" && title == "The Door To Chthon") {
        return "The Door To Chthon (QECTF)";
    } else if(mapname == "e1m7" && title == "The House of Chthon") {
        return "The House of Chthon (QECTF)";
    } else if(mapname == "e1m8" && title == "Ziggurat Vertigo") {
        return "Ziggurat Vertigo (QECTF)";
    } else if(mapname == "e2m1" && title == "The Installation") {
        return "The Installation (QECTF)";
    } else if(mapname == "e2m2" && title == "The Ogre Citadel") {
        return "The Ogre Citadel (QECTF)";
    } else if(mapname == "e2m3" && title == "The Crypt of Decay") {
        return "The Crypt of Decay (QECTF)";
    } else if(mapname == "e2m4" && title == "The Ebon Fortress") {
        return "The Ebon Fortress (QECTF)";
    } else if(mapname == "e2m5" && title == "The Wizard's Manse") {
        return "The Wizard's Manse (QECTF)";
    } else if(mapname == "e2m6" && title == "The Dismal Oubliette") {
        return "The Dismal Oubliette (QECTF)";
    } else if(mapname == "e2m7" && title == "The Underearth") {
        return "The Underearth (QECTF)";
    } else if(mapname == "e3m1" && title == "Termination Central") {
        return "Termination Central (QECTF)";
    } else if(mapname == "e3m2" && title == "The Vaults of Zin") {
        return "The Vaults of Zin (QECTF)";
    } else if(mapname == "e3m3" && title == "The Tomb of Terror") {
        return "The Tomb of Terror (QECTF)";
    } else if(mapname == "e3m4" && title == "Satan's Dark Delight") {
        return "Satan's Dark Delight (QECTF)";
    } else if(mapname == "e3m5" && title == "The Wind Tunnels") {
        return "The Wind Tunnels (QECTF)";
    } else if(mapname == "e3m6" && title == "Chambers of Torment") {
        return "Chambers of Torment (QECTF)";
    } else if(mapname == "e3m7" && title == "The Haunted Halls") {
        return "The Haunted Halls (QECTF)";
    } else if(mapname == "e4m1" && title == "The Sewage System") {
        return "The Sewage System (QECTF)";
    } else if(mapname == "e4m2" && title == "The Tower of Despair") {
        return "The Tower of Despair (QECTF)";
    } else if(mapname == "e4m3" && title == "The Elder God Shrine") {
        return "The Elder God Shrine (QECTF)";
    } else if(mapname == "e4m4" && title == "The Palace of Hate") {
        return "The Palace of Hate (QECTF)";
    } else if(mapname == "e4m5" && title == "Hell's Atrium") {
        return "Hell's Atrium (QECTF)";
    } else if(mapname == "e4m6" && title == "The Pain Maze") {
        return "The Pain Maze (QECTF)";
    } else if(mapname == "e4m7" && title == "Azure Agony") {
        return "Azure Agony (QECTF)";
    } else if(mapname == "e4m8" && title == "The Nameless City") {
        return "The Nameless City (QECTF)";
    } else if(mapname == "end" && title == "Shub-Niggurath's Pit") {
        return "Shub-Niggurath's Pit (QECTF)";
    } else if(mapname == "start" && title == "Introduction") {
        return "Introduction (QECTF)";
    }
	
	// Default
	return title;
}