# QECTF
Quake Enhanced Capture the Flag multiplayer mod

## What is it?
This is a multiplayer deathmatch mod for Quake Enhanced that adds capture the flag gamemodes.
Only selected maps are supported. There is partial bot support.
There is currently 2 gamemodes available: Default and Area Capture.

Default is the vanilla CTF. 2 flags on each base, get the enemy flag and capture it on your own base.
Area Capture plays like Canalzone. Each team has flags that they must take to capture areas around the map. When a team captures all the areas, they win the round.


## Bot support
Bot support is partial. Currently only for Default gameplay. The bots do understand teams, however they cannot distinguish between team-owned flags / items.
They will ocasionally capture the flag.

## How to install
1. Go to your 'Saved games' quake folder, NOT THE STEAM FOLDER. You can go to it by pressing Windows+R and typing: %userprofile%\Saved Games\Nightdive Studios\Quake
2. Create a folder called 'id1'
3. Create another folder and call it 'mpmod'. If you already have this folder, skip this step.
4. Extract zip into the 'id1' folder you created on step 2. If you already have an 'id1' folder, it's likely from another mod. Unfortunately, you'll have to replace it.

## How to install support for Dissolution of Eternity
1. Go to your 'Saved games' quake folder.
2. Create a folder called 'rogue', in the same folder where you created 'id1'
3. Extract the zip into the 'rogue' folder that you created on the previous step.
4. Rename the pak0.pak file to pak1.pak
5. Go to your steam quake folder (Usually c:\program files (x86)\Steam\Steamapps\common\quake\rerelease)
6. Go to the 'rogue' folder
7. Copy the pak0.pak from here to the 'rogue' folder that you created in Step 2

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
* e1m2 (Area Capture gamemode)
* e1m7
* e3m6
* ctf1 (Requires Dissolution of Eternity support)

## Adding map support
You can do this by doing simple entity replacements in the maps, or coding it directly into the code. The latter is how the supported maps were added.

Only one new entity is available:
* ctf_flag

Specify the "team" keyvalue on items, armor, spawns and flags to specify which team they belong to. trigger_teleport also supports it.
Currently it's not possible to create an Area Capture map via entity replacement.

### Team IDs
Red: 5
Blue: 14

## Credits
JPiolho: Author
