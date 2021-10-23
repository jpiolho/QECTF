# QECTF
Quake Enhanced Capture the Flag multiplayer mod

## What is it?
This is a multiplayer deathmatch mod for Quake Enhanced that adds basic capture the flag gamemode.
Only selected maps are supported.

## How to install
1. Go to your 'Saved games' quake folder, NOT THE STEAM FOLDER. You can go to it by pressing Windows+R and typing: %userprofile%\Saved Games\Nightdive Studios\Quake\Id1
2. Create a folder called 'id1'
3. Create another folder and call it 'mpmod'. If you already have this folder, skip this step.
4. Extract zip into the 'id1' folder you created on step 2. If you already have an 'id1' folder, it's likely from another mod. Unfortunately, you'll have to replace it.

## How to run the mod
1. Open console and type 'game mpmod'
2. Start a multiplayer game

### Technical explanation
When you change to mpmod, it sets the root folder to be Saved Games, so next time the game goes into id1 it will use the files from Saved Games and override.

## How to set gamemodes
1. Open console and set the variable 'saved1' to the value you want.
2. Restart map

## Supported maps
* dm3
* dm6
* e3m6

## Adding map support
You can do this by doing simple entity replacements in the maps, or coding it directly into the code. The latter is how the supported maps were added.

Only one new entity is available:
* ctf_flag

Specify the "team" keyvalue on items, armor, spawns and flags to specify which team they belong to. trigger_teleport also supports it.

## Credits
JPiolho: Author
