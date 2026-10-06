local MinSecondsIntoRun = 30
local MinEscapeSeconds = 60
local MaxCatches = 5
local UseRoutingBuckets = true
local BucketBase = 7000
local runs = {}
local buckets = {}

-- ============================================================
-- ROUTING BUCKETS
-- ============================================================
local function EnterPrivateBucket(src)
    if not UseRoutingBuckets or buckets[src] ~= nil then return end
    buckets[src] = GetPlayerRoutingBucket(src)
    local bucket = BucketBase + src
    SetRoutingBucketPopulationEnabled(bucket, false)
    SetPlayerRoutingBucket(src, bucket)
end

local function LeavePrivateBucket(src)
    local previous = buckets[src]
    if previous == nil then return end
    buckets[src] = nil
    if GetPlayerName(src) then
        SetPlayerRoutingBucket(src, previous)
    end
end

-- ============================================================
-- TITLES
-- ============================================================
local Titles = {
    { id = 'night_shift',     name = 'Night Shift',          desc = 'Enter the Morgue Horror Event',
      check = function(s) return s.entered >= 1 end },
    { id = 'morgue_rat',      name = 'Morgue Rat',           desc = 'Escape the morgue x10',
      check = function(s) return s.escapes >= 10 end },
    { id = 'coroner',         name = 'Coroner',              desc = 'Escape the morgue x100',
      check = function(s) return s.escapes >= 100 end },
    { id = 'double_shift',    name = 'Double Shift',         desc = 'Escape on Hard or Extreme x25',
      check = function(s) return s.hardEscapes >= 25 end },
    { id = 'toe_tag',         name = 'Toe Tag',              desc = 'Get caught x100',
      check = function(s) return s.caught >= 100 end },
    { id = 'fuse_box',        name = 'Fuse Box',             desc = 'Collect x500 real fuses',
      check = function(s) return s.fuses >= 500 end },
    { id = 'shock_therapy',   name = 'Shock Therapy',        desc = 'Stun the monster x250',
      check = function(s) return s.stuns >= 250 end },
    { id = 'lights_out',      name = 'Lights Out',           desc = 'Lure a monster away with a thrown bottle x50',
      check = function(s) return s.lures >= 50 end },
    { id = 'teddys_keeper',   name = "Teddy's Keeper",       desc = 'Find the worn teddy bear x10',
      check = function(s) return (s.items.teddy or 0) >= 10 end },
    { id = 'lost_property',   name = 'Lost Property',        desc = 'Find every easter egg item',
      check = function(s)
          for _, id in ipairs({ 'staffcard', 'batteries', 'teddy', 'stunpack', 'tape' }) do
              if (s.items[id] or 0) < 1 then return false end
          end
          return true
      end },
    { id = 'off_the_record',  name = 'Off the Record',       desc = 'Find a Staff Note in the morgue',
      check = function(s) return s.staffNotes >= 1 end },

    { id = 'body_bag_dodger', name = 'Body Bag Dodger',      desc = 'Escape without being caught once',
      run = function(r) return r.escaped and r.caught == 0 end },
    { id = 'unplugged',       name = 'Unplugged',            desc = 'Escape a run where you spawned with no taser',
      run = function(r) return r.escaped and r.startedNoTaser end },
    { id = 'threes_a_crowd',  name = "Three's a Crowd",      desc = 'Escape on Hard or Extreme with three monsters hunting you',
      run = function(r) return r.escaped and r.difficulty ~= 'easy' and r.monsters >= 3 end },
    { id = 'last_breath',     name = 'Last Breath',          desc = 'Escape with 4/5 catches used',
      run = function(r) return r.escaped and r.caught >= MaxCatches - 1 end },
    { id = 'locker_ghost',    name = 'Locker Ghost',         desc = 'Escape on Hard or Extreme without being caught or firing a taser',
      run = function(r) return r.escaped and r.difficulty ~= 'easy' and r.caught == 0 and r.tasersFired == 0 end },
    { id = 'patient_zero',    name = 'Patient Zero',         desc = 'Escape on Hard or Extreme with no taser, without being caught',
      run = function(r) return r.escaped and r.difficulty ~= 'easy' and r.startedNoTaser and r.caught == 0 end },
    { id = 'graveyard_shift', name = 'Graveyard Shift',      desc = 'Escape on Extreme',
      run = function(r) return r.escaped and r.difficulty == 'extreme' end },
    { id = 'the_unkillable',  name = 'The Unkillable',       desc = 'Escape on Extreme without being caught',
      run = function(r) return r.escaped and r.difficulty == 'extreme' and r.caught == 0 end },
}

local ValidItems = { staffcard = true, batteries = true, teddy = true, stunpack = true, tape = true, staffnote = true }

-- ============================================================
-- TRANSPORT TYCOON HOOKS
-- ============================================================
local function PlayerKey(src)
    -- TODO(Transport Tycoon): return the vRP user_id here instead.
    return GetPlayerIdentifierByType(src, 'license') or GetPlayerIdentifiers(src)[1] or ('src:' .. src)
end

local function LoadStats(src)
    -- TODO(Transport Tycoon): load from vRP user data instead of resource KVP.
    local raw = GetResourceKvpString('stats:' .. PlayerKey(src))
    local ok, data = pcall(json.decode, raw or '')
    return (ok and type(data) == 'table') and data or {}
end

local function SaveStats(src, stats)
    -- TODO(Transport Tycoon): save to vRP user data instead of resource KVP.
    SetResourceKvp('stats:' .. PlayerKey(src), json.encode(stats))
end

local function GiveTitle(src, title)
    -- TODO(Transport Tycoon): replace this with the call that unlocks a chat title.
    print(('[HORROR] %s (%d) earned the chat title "%s" - placeholder, nothing was given'):format(GetPlayerName(src) or '?', src, title.name))
    return true
end

local function GiveStaffNote(src)
    -- TODO(Transport Tycoon): replace this with the vRP call that gives one Staff Note to the player.
    print(('[HORROR] Staff Note found by %s (%d) - placeholder, nothing was given'):format(GetPlayerName(src) or '?', src))
    return true
end

-- ============================================================
-- STATS
-- ============================================================
local function Defaults(s)
    s.entered     = s.entered or 0
    s.escapes     = s.escapes or 0
    s.hardEscapes = s.hardEscapes or 0
    s.extremeEscapes = s.extremeEscapes or 0
    s.caught      = s.caught or 0
    s.fuses       = s.fuses or 0
    s.stuns       = s.stuns or 0
    s.lures       = s.lures or 0
    s.staffNotes  = s.staffNotes or 0
    s.items       = s.items or {}
    s.titles      = s.titles or {}
    return s
end

local function GetStats(src)
    return Defaults(LoadStats(src))
end

local function CheckTitles(src, stats, run)
    local earned = {}
    for _, t in ipairs(Titles) do
        if not stats.titles[t.id] then
            local ok = false
            if t.check then ok = t.check(stats) end
            if not ok and t.run and run then ok = t.run(run) end
            if ok and GiveTitle(src, t) then
                stats.titles[t.id] = os.time()
                table.insert(earned, t)
                TriggerEvent('horror:titleEarned', src, t.id, t.name)
            end
        end
    end
    for i, t in ipairs(earned) do
        SetTimeout((i - 1) * 4000, function()
            TriggerClientEvent('horror:notify', src, ('~y~CHAT TITLE UNLOCKED:~s~ %s~n~~c~%s'):format(t.name, t.desc), 7000)
        end)
    end
end

local function Num(v, max)
    v = tonumber(v) or 0
    if v ~= v or v < 0 then return 0 end
    return math.min(math.floor(v), max)
end

local function CleanSummary(src, raw, run)
    if type(raw) ~= 'table' then return nil end
    local seconds = os.time() - run.started
    local r = {
        escaped        = raw.escaped == true and seconds >= MinEscapeSeconds,
        difficulty     = (raw.difficulty == 'hard' or raw.difficulty == 'extreme') and raw.difficulty or 'easy',
        monsters       = Num(raw.monsters, 4),
        startedNoTaser = raw.startedNoTaser == true,
        caught         = Num(raw.caught, MaxCatches),
        fuses          = Num(raw.fuses, 12),
        stuns          = Num(raw.stuns, math.floor(seconds / 20) + 2),
        tasersFired    = Num(raw.tasersFired, 999),
        lures          = Num(raw.lures, 5),
        item           = (type(raw.item) == 'string' and ValidItems[raw.item]) and raw.item or nil,
        debug          = raw.debug == true,
    }
    if r.caught >= MaxCatches then r.escaped = false end
    return r
end

-- ============================================================
-- EVENTS
-- ============================================================
RegisterNetEvent('horror:runStarted', function()
    local src = source
    EnterPrivateBucket(src)
    runs[src] = { started = os.time(), noteClaimed = false }
    local stats = GetStats(src)
    stats.entered = stats.entered + 1
    CheckTitles(src, stats, nil)
    SaveStats(src, stats)
end)

RegisterNetEvent('horror:runEnded', function(summary)
    local src = source
    LeavePrivateBucket(src)
    local run = runs[src]
    runs[src] = nil
    if not run then return end

    local r = CleanSummary(src, summary, run)
    if not r or r.debug then return end

    local stats = GetStats(src)
    if r.escaped then
        stats.escapes = stats.escapes + 1
        if r.difficulty ~= 'easy' then stats.hardEscapes = stats.hardEscapes + 1 end
        if r.difficulty == 'extreme' then stats.extremeEscapes = stats.extremeEscapes + 1 end
    end
    stats.caught = stats.caught + r.caught
    stats.fuses  = stats.fuses + r.fuses
    stats.stuns  = stats.stuns + r.stuns
    stats.lures  = stats.lures + r.lures
    if r.item and r.item ~= 'staffnote' then
        stats.items[r.item] = (stats.items[r.item] or 0) + 1
    end

    CheckTitles(src, stats, r)
    SaveStats(src, stats)
end)

RegisterNetEvent('horror:staffNoteFound', function()
    local src = source
    local run = runs[src]
    if not run or run.noteClaimed then return end
    if os.time() - run.started < MinSecondsIntoRun then return end

    run.noteClaimed = true
    if GiveStaffNote(src) then
        TriggerClientEvent('horror:notify', src, '~g~A Staff Note has been added to your account.', 6000)
        local stats = GetStats(src)
        stats.staffNotes = stats.staffNotes + 1
        CheckTitles(src, stats, nil)
        SaveStats(src, stats)
    end
end)

RegisterCommand('horrorstats', function(src)
    if src == 0 then return end
    local s = GetStats(src)
    local owned = {}
    for _, t in ipairs(Titles) do
        if s.titles[t.id] then table.insert(owned, t.name) end
    end
    TriggerClientEvent('horror:notify', src, ('Runs: %d  |  Escapes: %d (Hard+ %d, Extreme %d)  |  Caught: %d~n~Fuses: %d  |  Stuns: %d  |  Lures: %d~n~Titles: %s')
        :format(s.entered, s.escapes, s.hardEscapes, s.extremeEscapes, s.caught, s.fuses, s.stuns, s.lures, #owned > 0 and table.concat(owned, ', ') or 'none yet'), 10000)
end, false)

AddEventHandler('playerDropped', function()
    runs[source] = nil
    buckets[source] = nil
end)

AddEventHandler('onResourceStop', function(name)
    if name ~= GetCurrentResourceName() then return end
    for src in pairs(buckets) do
        LeavePrivateBucket(src)
    end
end)

exports('GetHorrorStats', function(src) return GetStats(src) end)
exports('GetHorrorTitles', function()
    local list = {}
    for _, t in ipairs(Titles) do
        table.insert(list, { id = t.id, name = t.name, desc = t.desc })
    end
    return list
end)
