# QECTF
Quake Enhanced Capture the Flag

This is a multiplayer deathmatch mod for Quake Enhanced that adds capture the flag gamemodes.
Only selected maps are supported. There is partial bot support.
There is currently 2 gamemodes available: Default and Area Capture.

**Default**: The vanilla CTF. 1 flag on each base, get the enemy flag and capture it on your own flag at your base.

**Area Capture**: plays like Canalzone from _Team Fortress_. Each team has flags that they must take to capture areas around the map. When a team captures all the areas, they win the round.

# Download
* [QEThings MPMods](https://mpmods.qethings.xyz) - Automatic install, however only 'id1' is supported.
* [Github Release](https://github.com/jpiolho/QECTF/releases/latest) - Manual install, 'rogue' and 'mg1' supported.

# Information
## How to manually install
1. Go to your 'Saved games' quake folder, NOT THE STEAM FOLDER. You can go to it by pressing Windows+R and typing: `%userprofile%\Saved Games\Nightdive Studios\Quake`
2. If a folder called '`id1`' already exists, delete it.
3. Extract zip into the 'Saved games' folder.
4. Verify that `id1` and `mpmod` folder are now inside 'Saved games'.

## How to install support for non-id1
1. Install manually first (previous section), if you've done that before, move to step 2.
2. Verify that you have `id1`, `rogue`, `mg1` folders.
3. Run `Install Mod Links.bat` as administrator. Follow instructions.
4. Done!
## How to run the mod
**NOTE:** If you're using [QEThings MPMods](https://mpmods.qethings.xyz), follow the instructions for it instead.

1. Open console and type `game mpmod`
2. Start a multiplayer game

## Changing teams
When you die, you can change teams via console by typing:
* `color 3` for red team
* `color 13` for blue team

## Bot support
Bot support is partial. Currently only for available for Default gameplay. The bots do understand teams, however they do not cannot distinguish between team-owned flags / items.
They will occasionally capture the flag.

## How to set gamemode variants
1. Open console and set the variable `saved1` to the value you want. Example: `saved1 4`
2. Restart map

### Gamemode variants
#### 1: Override map hook/translocator
Overrides the map hook/translocator flags, clearing them
#### 2: Hook available
Adds hook to the map, needs gamemode 1 as well.
#### 4: Translocator available
Adds translocator to the map, needs gamemode 1 as well.

## Supported maps
| ID | Name                | Gamemode     | Addon                          |
|----|---------------------|--------------|--------------------------------|
| 1  | dm3                 | Default      |                                |
| 2  | dm6                 | Default      |                                |
| 3  | dm7                 | Default      |                                |
| 4  | e1m2                | Area Capture |                                |
| 5  | e1m7                | Default      |                                |
| 6  | e3m6                | Default      |                                |
| 7  | test/mals_combatbox | Default      |                                |
| 8  | ctf1                | Default      | Dissolution of Etenity (rogue) |
| 9  | mgdm3               | Default      | Dimension of the Machine (mg1) |

## Hosting features

### Hosting mode
This mod features a hosting mode, in which the host does not play.
To enable this mode, set `saved2 1`.

* The game host will be placed in a white-team, be granted noclip and remain invisible to other players.
* Intermissions will continue automatically.

This mode is ideally to be used with lobby cycler or 'Do not go back to lobby' patch.

### Map configs
When the game starts, the game will execute `exec qectf.cfg` and `exec qectf_<mapname>.cfg`. Use this to set any variables you wish to customize the game.

### Automatic map cycling
**This functionality will not work without 'Do not go back to lobby' patch.**

Use the map configs feature above to set the cvar `temp5` to specify what the next map should be, using the id from supported maps table.

Example: To specify e1m7 as the next map, set `temp5 5`


## Adding map support
You can do this by doing simple entity replacements in the maps, or coding it directly into the code. The latter is how the supported maps were added.

Only one new entity is available:
* ctf_flag

Specify the "team" keyvalue on items, armor, spawns and flags to specify which team they belong to. trigger_teleport also supports it.
Currently it's not possible to create an Area Capture map via entity replacement.

### Team IDs
* Red: 5
* Blue: 14

## Credits
JPiolho: Author

Ceekay: e1m7, mgdm3 and code contributions
