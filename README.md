# ls-horror-event

A single-player horror event for FiveM, set in the Strawberry morgue in Los Santos.

Players walk into the hospital entrance, accept a content warning, watch a short
intro, and then have to survive the dark: find the real fuses among the decoys,
repair the control panel, and find the one working exit before time runs out,
while an Outlast-style monster hunts them through the building.

## Features

- **Outlast-style hunter AI.** The monster patrols and mutters, investigates
  noises, spots you more easily when your flashlight is on, chases you down,
  searches where it lost you and checks hiding spots. You can't fight it, only
  hide, break line of sight and run.
- **Stealth.** Sprinting is loud and crouch-walking is almost silent.
  Rummaging through decoys, slamming dead-end doors and repairing the panel all
  make noise it will come to investigate.
- **Hiding spots.** Hide in lockers or under beds and peek out. If it saw you
  get in, it will drag you out.
- **Camcorder night vision.** See in the dark without being seen, at the cost of
  battery shared with the flashlight.
- **Difficulty.** Choose Easy or Hard on the content warning. Hard spawns two
  sprinting monsters (sometimes three) that see and hear further and react faster.
- **Taser roulette.** Each run you might get a full taser, one with only 2
  charges, or none at all. Hard rolls the worse outcomes more often.
- **Surviving without a taser.** No-taser runs give you throwable bottles that
  lure the monster to the noise, an adrenaline burst when it gets close, and a
  monster that's a little slower and gives up the chase sooner.
- **Easter eggs.** One hidden item per run: a key card that reveals the real
  exit, spare batteries, a teddy that gives back a life, a taser stun pack or a
  lore tape. Each can be found once per run.
- **Staff Note.** A 5% chance per run that the easter egg is a Staff Note,
  given by the server.
- **Stats and chat titles.** The server keeps each player's lifetime stats and
  unlocks chat titles for milestones and challenge runs.
- **Objectives.** Between 3 and 6 real fuses are hidden among decoys, then
  there's a timed escape through one real exit out of five.
- **Cinematic intro.** Letterboxed shots of the monster, a fuse, the control
  panel and the exit, with captions. Players can skip it.
- **Jumpscares.** A full-screen catch scare with a chance of a second one in the
  dark.
- **Five monster variants.** Three zombies and two zombie dogs, picked at random
  each round.
- **Modern UI.** NUI content warning, captions, camcorder overlay and hiding
  overlays.
- **Per-player.** The monster and props are local to each player, so several
  people can run the event at the same time.

## Requirements

- A FiveM server (`cerulean`, Lua 5.4)
- The vanilla coroner interior (`Coroner_Int_on`), which the resource loads itself

No framework is needed, and it doesn't depend on ESX, QBCore or any other resource.

## Installation

1. Download or clone this repository into your server's `resources` folder,
   for example `resources/ls-horror`.
2. Add it to `server.cfg`:
   ```
   ensure ls-horror
   ```
3. Restart the server, or run `ensure ls-horror` in the console.

The entrance appears on the map as a red blip at the hospital.

## How to play

| Key | Action |
| --- | --- |
| `E` | Enter the event, pick up fuses, search, repair, try exits, hide |
| `TAB` | Swap between flashlight and stun gun |
| `G` | Throw a bottle (no-taser runs only) |
| `N` | Camcorder night vision (rebindable in Settings › Key Bindings › FiveM) |
| `CTRL` | Crouch, which makes you quieter and harder to see |
| `Right mouse` | Aim the flashlight |
| `Space` | Skip the intro |
| `Enter` / `Esc` | Accept or decline the content warning |
| `←` / `→` | Choose Easy or Hard on the content warning |

1. Collect the required number of **glowing** fuses. The dimmer ones are decoys,
   and searching them makes noise.
2. Repair the **control panel**. It takes 15 seconds and is loud.
3. Find the **real exit** before the escape timer ends. The wrong doors are dead
   ends.

Being caught costs a life, and you lose a fuse if you're carrying one. After
five catches, the event is over.

## Commands

| Command | Description |
| --- | --- |
| `/startHorror` | Start the event from anywhere |
| `/stopHorror` | Leave the event |
| `/horrorspot` | Add a hiding spot where you're standing, facing the way you want to peek |
| `/horrorspot low` | Same, for under-a-bed style spots |
| `/horroreggspot` | Add an easter egg spot where you're standing |
| `/horrorstats` | Show your lifetime stats and the titles you've unlocked |
| `/horrordebug` | Testing only: the monsters ignore you, and hiding and egg spots are shown as markers. Runs with debug on don't count towards stats or rewards |

`/horrorspot` and `/horroreggspot` add the spot for the current session and
print a line in the F8 console. Paste it into `Config.HidingSpots` or
`Config.EasterEggs.extraSpots` to keep it.

## Configuration

Everything lives in the `Config` table at the top of `client/horror_client.lua`.

| Section | What it controls |
| --- | --- |
| `EntranceCoords`, `EntranceHeading` | Entrance marker, map blip, and where players are returned afterwards |
| `MonsterModels`, `QuadrupedModels`, `FallbackMonsterModels` | Which monsters can spawn |
| `MonsterSpawnPoints`, `PlayerRespawnPoints`, `ExitPoints`, `AllFusePool`, `ControlPanel` | Layout of the event |
| `FusePropCount`, `MinFusesRequired`, `MaxFusesRequired` | How many fuses and decoys spawn |
| `MaxCatches`, `CatchMode`, `CatchGraceMs` | How many catches you get, and whether a catch drags you away (`"drag"`) or knocks you back (`"hit"`) |
| `HeadStartSeconds`, `EscapeTimeSeconds`, `RepairSeconds` | Timers |
| `MonsterPatrolSpeed`, `MonsterChaseSpeed`, `MonsterMaxChaseSpeed`, `SpeedRampSeconds` | Monster speed |
| `Hunter` | Sight and hearing ranges, noise radii, search and investigate behaviour |
| `DefaultDifficulty`, `Difficulty` | Easy and Hard settings: monster count, speed, senses and taser odds |
| `Unarmed` | No-taser help: bottles, lure time, adrenaline burst, slower chase |
| `EasterEggs` | Easter egg items, their effects, extra spots and the Staff Note chance |
| `HidingSpots` | Hiding spot list |
| `NightVision` | Night vision on or off, and battery drain |
| `Jumpscare` | Volume, strobe, rumble and double-scare chance |
| `ShowContentWarning`, `PlayIntroCutscene`, `CutsceneRevealsExit`, `AllowCutsceneSkip` | Intro and warning options |

## Monster models

| Model | Type |
| --- | --- |
| `u_m_y_zombie_01` | Zombie (replaces the vanilla GTA zombie's look) |
| `u_m_y_zombie_02` | Zombie |
| `u_m_y_zombie_03` | Zombie |
| `u_m_y_zombie_04` | Zombie dog |
| `u_m_y_zombie_05` | Zombie dog |

The model files live in `stream/`. `peds.meta` registers models 02 to 05, and
model 01 replaces the built-in one, so it doesn't need an entry. Each model needs
its `.ydd`, `.yft`, `.ymt` and `.ytd`.

To add your own model, put its files in `stream/`, add an entry to `peds.meta`,
and add its name to `Config.MonsterModels`. If it's a four-legged model, add it
to `Config.QuadrupedModels` as well.

If a model fails to load, the script skips it for the rest of the session and
tries another. If none load, it uses `Config.FallbackMonsterModels`, which are
vanilla peds.

## Server side

`server/horror_server.lua` tracks each run, checks the client's end-of-run
summary for impossible numbers, keeps lifetime stats and awards rewards.

### Chat titles

| Title | Requirement |
| --- | --- |
| Night Shift | Enter the Morgue Horror Event |
| Morgue Rat | Escape the morgue x10 |
| Coroner | Escape the morgue x100 |
| Double Shift | Escape on Hard x25 |
| Toe Tag | Get caught x100 |
| Fuse Box | Collect x500 real fuses |
| Shock Therapy | Stun the monster x250 |
| Lights Out | Lure a monster away with a thrown bottle x50 |
| Teddy's Keeper | Find the worn teddy bear x10 |
| Lost Property | Find every easter egg item |
| Off the Record | Find a Staff Note in the morgue |
| Body Bag Dodger | Escape without being caught once |
| Unplugged | Escape a run where you spawned with no taser |
| Three's a Crowd | Escape on Hard with three monsters hunting you |
| Last Breath | Escape with 4/5 catches used |
| Locker Ghost | Escape on Hard without being caught or firing a taser |
| Patient Zero | Escape on Hard with no taser, without being caught |

The list is the `Titles` table at the top of the server file.

### Hooking it into your server

Four functions are marked `TODO(Transport Tycoon)`:

| Function | Replace with |
| --- | --- |
| `PlayerKey` | Your player ID (for example the vRP user ID) |
| `LoadStats`, `SaveStats` | Your own storage. By default, stats are saved in resource KVP |
| `GiveTitle` | Your chat title unlock |
| `GiveStaffNote` | Giving one Staff Note |

Until they're replaced, titles and Staff Notes are only printed in the server
console. Other resources can use:

```lua
exports['ls-horror']:GetHorrorStats(source)
exports['ls-horror']:GetHorrorTitles()
AddEventHandler('horror:titleEarned', function(source, id, name) end)
```

When a player is caught for the last time, the client also fires
`horror:playerCaught`.

## File structure

```
ls-horror/
├── client/horror_client.lua   game logic and config
├── server/horror_server.lua   run checks, stats, titles and rewards
├── html/                      NUI page and sounds
├── stream/                    monster models
├── peds.meta                  model registration
└── fxmanifest.lua
```

## Credits

Made by **Goobie**.
