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
- **Difficulty.** Choose Easy, Hard or EXTREME on the content warning. Hard spawns
  two sprinting monsters (sometimes three) that see and hear further and react faster.
  Extreme spawns three or four, needs up to 12 fuses, allows only 3 catches and gives
  you 2 minutes to escape.
- **Taser roulette.** Each run you might get a full taser, one with only 2
  charges, or none at all. Harder modes roll the worse outcomes more often.
- **Fight back.** Shine the torch in its face to make it recoil, or punch it
  (normal GTA melee) to knock it down for a few seconds. Both have a cooldown.
- **Surviving without a taser.** No-taser runs give you throwable bottles that
  lure the monster to the noise, an adrenaline burst when it gets close, and a
  monster that's a little slower and gives up the chase sooner.
- **Easter eggs.** One hidden item per run: a key card that reveals the real
  exit, spare batteries, a teddy that gives back a life, a taser stun pack or a
  lore tape. Each can be found once per run.
- **Rare notes.** On top of the normal easter egg there is a small chance that the
  hidden item is a note given by the server, on every difficulty: a Staff Note (5%),
  The Morgue note (4%) or, very rarely, the Night Shift Log tape (0.5%). Only one note
  can be found per run.
- **Stats and chat titles.** The server keeps each player's lifetime stats and
  unlocks chat titles for milestones and challenge runs.
- **Objectives.** Real fuses are hidden among identical dead ones (3–6 on Easy, up
  to 10 on Hard, up to 12 on Extreme), then there's a timed escape through one real
  exit out of five. A wrong door teleports you away from every exit, jams shut for
  the rest of the run, locks all doors for a few seconds and, during the escape,
  costs you time.
- **Caught cutscenes.** Human monsters drag you away down the corridor; dogs pin
  you to the floor.
- **Private runs.** Each player is put in their own routing bucket during a run, so
  players in the event can't see each other.
- **Run summary and leaderboard.** Every run ends with a summary card: time, catches,
  fuses, item found, leaderboard rank, personal best and any titles unlocked.
  `/horrortop` shows the fastest escapes per difficulty.
- **Accessibility.** The warning screen has a reduce-flashing toggle and a scare
  volume slider. Your choices and last difficulty are remembered.
- **Atmosphere.** Dim fluorescent lights that stutter
  and die, occasional power surges and red emergency lights by the exits. The
  minimap is hidden for the whole run.
- **Quality of life.** A dark vignette and faint growls warn you when something is
  close behind you, whispers hint at where to look if you're stuck, and dead fuses
  keep a dim red glint so you don't go back to them.
- **Cinematic intro.** Letterboxed shots of the monster, a fuse, the control
  panel and the exit, with captions. Players can skip it.
- **Jumpscares.** A full-screen catch scare with a chance of a second one in the
  dark.
- **Five monster variants.** Three zombies and two zombie dogs, picked at random
  each round.
- **Modern UI.** NUI content warning, a clean HUD panel with objective, catches,
  battery, stamina and taser status, cinematic captions, hiding overlays and a
  cinematic end screen.
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
| `R` / `Left click` | Punch, which knocks the monster down for a few seconds |
| `Backspace` | Close the end screen |
| `CTRL` | Crouch, which makes you quieter and harder to see |
| `Right mouse` | Aim the flashlight |
| `Space` | Skip the intro |
| `Enter` / `Esc` | Accept or decline the content warning |
| `←` / `→` | Choose the difficulty on the content warning |

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
| `/horrorforcenote staff|morgue|tape|off` | Debug: force the next run to hide that note |
| `/horrorstats` | Show your lifetime stats and the titles you've unlocked |
| `/horrortop [easy\|hard\|extreme]` | Show the five fastest escapes for a difficulty |
| `/horrordragtest` | Testing only, with `/horrordebug` on: replay the caught cutscene with the nearest monster |
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
| `DefaultDifficulty`, `Difficulty` | Easy, Hard and Extreme settings: monster count, fuses, catches, escape time, speed, senses and taser odds |
| `Stun` | Torch and punch stun range, duration and cooldown |
| `DragCutscene` | Caught cutscenes on or off, length, captions and positioning |
| `Assist` | Behind-you warning range and stuck-hint timings |
| `WrongDoor` | Door lockout, escape time penalty and how far from the exits a wrong door sends you |
| `FuseGlow` | How far and how strongly the real fuses glow |
| `FirstPerson` | How much wider the first-person view is during the run (restored afterwards) |
| `Atmosphere` | Flickering ceiling lights, power surges, emergency lights and the scream cooldown |
| `Unarmed` | No-taser help: bottles, lure time, adrenaline burst, slower chase |
| `EasterEggs` | Easter egg items, their effects, extra spots and the rare note chances (`rareNotes`) |
| `HidingSpots` | Hiding spot list |
| `Jumpscare` | Volume, strobe, rumble and double-scare chance |
| `ShowContentWarning`, `PlayIntroCutscene`, `CutsceneRevealsExit`, `AllowCutsceneSkip` | Intro and warning options |

## Monster models

| Model | Type |
| --- | --- |
| `u_m_y_zombie_02` | Zombie |
| `u_m_y_zombie_03` | Zombie |
| `u_m_y_zombie_04` | Zombie |
| `u_m_y_zombie_05` | Zombie dog |
| `u_m_y_zombie_06` | Zombie dog |

The model files live in `stream/` and `peds.meta` registers all five. The numbering
starts at 02 on purpose: `u_m_y_zombie_01` is GTA's own zombie, and leaving it alone
avoids clashing with other resources that replace it. Each model needs its `.ydd`,
`.yft`, `.ymt` and `.ytd`.

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

| Title | Colour | Requirement |
| --- | --- | --- |
| Night Shift | `#7FB8A4` morgue teal | Enter the Morgue Horror Event |
| Morgue Rat | `#C97B3D` rust | Escape the morgue x10 |
| Lost Property | `#D9B45A` old gold | Find every easter egg item |
| Body Bag Dodger | `#6EC1E4` ice blue | Escape without being caught once |
| The Unkillable | `#D7263D` blood red | Escape on Extreme without being caught |

The list is the `Titles` table at the top of the server file.

### Leaderboard and private runs

The server keeps the ten fastest escapes per difficulty (one entry per player) and
each player's personal best. Times are measured by the server, and debug runs never
count.

During a run each player is moved into their own routing bucket (`BucketBase` plus
their server ID, 7000 by default) and returned to their previous bucket afterwards.
Set `UseRoutingBuckets = false` at the top of the server file to turn this off.

### Hooking it into your server

Four functions are marked `TODO(Transport Tycoon)`:

| Function | Replace with |
| --- | --- |
| `PlayerKey` | Your player ID (for example the vRP user ID) |
| `LoadStats`, `SaveStats` | Your own storage. By default, stats are saved in resource KVP |
| `GiveTitle` | Your chat title unlock |
| `GiveNote` | Already calls `vRP.tryGiveInventoryItem({user_id, item, 1})`; set the item IDs in `NoteItems` at the top of `server/horror_server.lua` (`goobie`, `morgue`, `morgue_tape`) |

Until they're replaced, titles and Staff Notes are only printed in the server
console. Other resources can use:

```lua
exports['ls-horror']:GetHorrorStats(source)
exports['ls-horror']:GetHorrorTitles()
exports['ls-horror']:GetHorrorLeaderboard('easy')
AddEventHandler('horror:titleEarned', function(source, id, name, colour) end)
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

## Monster voices

Each monster model has its own pair of sounds, both generated from scratch (no samples, no
copyright):

| Model | Far (patrolling, intro, behind you) | Sees you (chase start, jumpscare range) |
| --- | --- | --- |
| `u_m_y_zombie_02` | Low shambling moan | Rasping scream |
| `u_m_y_zombie_03` | Long wail | High shriek |
| `u_m_y_zombie_04` | Deep rumbling growl | Heavy roar |
| `u_m_y_zombie_05` | Howl | Bark and snarl |
| `u_m_y_zombie_06` | Low snarling whine | Snarl and barks |

Files are `html/far_zombie_XX.mp3` and `html/see_zombie_XX.mp3`. Replace one with your own
file of the same name to change it. The "sees you" sounds share the 8 second screech
cooldown and follow the scare volume setting. `Config.MonsterSounds` lists the models that
use them; any model not listed falls back to the generic growls.
