

//void PopulateMap() =
//{
//    if(mapname == "dm6")
//       Populate_DM6();
//    else if(mapname == "dm3")
//        Populate_DM3();
//    else if(mapname == "e3m6")
//        Populate_e3m6();
//}

//void PostPopulateMap() {
//    if(mapname == "dm6")
//        PostPopulate_DM6();
//    else if(mapname == "dm3")
//        PostPopulate_DM3();
//    else if(mapname == "e3m6")
//        PostPopulate_e3m6();
//}

string(string title) GetMapName =
{
    if(mapname == "base32b" && title == "Base 32") {
        return "Base 32 (TeamDM)";
    } else if(mapname == "death32c" && title == "Death 32") {
        return "Death 32 (TeamDM)";
    } else if(mapname == "dm1" && title == "Place of Two Deaths") {
        return "Place of Two Deaths (TeamDM)";
    } else if(mapname == "dm2" && title == "Claustrophobopolis") {
        return "Claustrophobopolis (TeamDM)";
    } else if(mapname == "dm3" && title == "The Abandoned Base") {
        return "The Abandoned Base (TeamDM)";
    } else if(mapname == "dm4" && title == "The Bad Place") {
        return "The Bad Place (TeamDM)";
    } else if(mapname == "dm5" && title == "The Cistern") {
        return "The Cistern (TeamDM)";
    } else if(mapname == "dm6" && title == "The Dark Zone") {
        return "The Dark Zone (TeamDM)";
    } else if(mapname == "dm7" && title == "The Edge") {
        return "The Edge (TeamDM)";
    } else if(mapname == "dm8" && title == "Acrophobia") {
        return "Acrophobia (TeamDM)";
    } else if(mapname == "e1m1" && title == "The Slipgate Complex") {
        return "The Slipgate Complex (TeamDM)";
    } else if(mapname == "e1m2" && title == "Castle of the Damned") {
        return "Castle of the Damned (TeamDM)";
    } else if(mapname == "e1m3" && title == "The Necropolis") {
        return "The Necropolis (TeamDM)";
    } else if(mapname == "e1m4" && title == "The Grisly Grotto") {
        return "The Grisly Grotto (TeamDM)";
    } else if(mapname == "e1m5" && title == "Gloom Keep") {
        return "Gloom Keep (TeamDM)";
    } else if(mapname == "e1m6" && title == "The Door To Chthon") {
        return "The Door To Chthon (TeamDM)";
    } else if(mapname == "e1m7" && title == "The House of Chthon") {
        return "The House of Chthon (TeamDM)";
    } else if(mapname == "e1m8" && title == "Ziggurat Vertigo") {
        return "Ziggurat Vertigo (TeamDM)";
    } else if(mapname == "e2m1" && title == "The Installation") {
        return "The Installation (TeamDM)";
    } else if(mapname == "e2m2" && title == "The Ogre Citadel") {
        return "The Ogre Citadel (TeamDM)";
    } else if(mapname == "e2m3" && title == "The Crypt of Decay") {
        return "The Crypt of Decay (TeamDM)";
    } else if(mapname == "e2m4" && title == "The Ebon Fortress") {
        return "The Ebon Fortress (TeamDM)";
    } else if(mapname == "e2m5" && title == "The Wizard's Manse") {
        return "The Wizard's Manse (TeamDM)";
    } else if(mapname == "e2m6" && title == "The Dismal Oubliette") {
        return "The Dismal Oubliette (TeamDM)";
    } else if(mapname == "e2m7" && title == "The Underearth") {
        return "The Underearth (TeamDM)";
    } else if(mapname == "e3m1" && title == "Termination Central") {
        return "Termination Central (TeamDM)";
    } else if(mapname == "e3m2" && title == "The Vaults of Zin") {
        return "The Vaults of Zin (TeamDM)";
    } else if(mapname == "e3m3" && title == "The Tomb of Terror") {
        return "The Tomb of Terror (TeamDM)";
    } else if(mapname == "e3m4" && title == "Satan's Dark Delight") {
        return "Satan's Dark Delight (TeamDM)";
    } else if(mapname == "e3m5" && title == "The Wind Tunnels") {
        return "The Wind Tunnels (TeamDM)";
    } else if(mapname == "e3m6" && title == "Chambers of Torment") {
        return "Chambers of Torment (TeamDM)";
    } else if(mapname == "e3m7" && title == "The Haunted Halls") {
        return "The Haunted Halls (TeamDM)";
    } else if(mapname == "e4m1" && title == "The Sewage System") {
        return "The Sewage System (TeamDM)";
    } else if(mapname == "e4m2" && title == "The Tower of Despair") {
        return "The Tower of Despair (TeamDM)";
    } else if(mapname == "e4m3" && title == "The Elder God Shrine") {
        return "The Elder God Shrine (TeamDM)";
    } else if(mapname == "e4m4" && title == "The Palace of Hate") {
        return "The Palace of Hate (TeamDM)";
    } else if(mapname == "e4m5" && title == "Hell's Atrium") {
        return "Hell's Atrium (TeamDM)";
    } else if(mapname == "e4m6" && title == "The Pain Maze") {
        return "The Pain Maze (TeamDM)";
    } else if(mapname == "e4m7" && title == "Azure Agony") {
        return "Azure Agony (TeamDM)";
    } else if(mapname == "e4m8" && title == "The Nameless City") {
        return "The Nameless City (TeamDM)";
    } else if(mapname == "end" && title == "Shub-Niggurath's Pit") {
        return "Shub-Niggurath's Pit (TeamDM)";
    } else if(mapname == "start" && title == "Introduction") {
        return "Introduction (TeamDM)";
    }
	
	// Default
	return title;
}