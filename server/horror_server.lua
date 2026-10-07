local MinSecondsIntoRun = 5
local MinEscapeSeconds = 60
local MaxCatches = 5
local UseRoutingBuckets = true
local BucketBase = 7000
local NoteItems = {
    morgue = 'morgue',
    tape   = 'morgue_tape',
}
local NoteMessages = {
    morgue = 'The Morgue note has been added to your account.',
    tape   = 'A tape has been added to your account.',
}
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
    { id = 'night_shift',     name = 'Night Shift',     colour = '#7FB8A4', desc = 'Enter the Morgue Horror Event',
      check = function(s) return s.entered >= 1 end },
    { id = 'morgue_rat',      name = 'Morgue Rat',      colour = '#C97B3D', desc = 'Escape the morgue x10',
      check = function(s) return s.escapes >= 10 end },
    { id = 'lost_property',   name = 'Lost Property',   colour = '#D9B45A', desc = 'Find every easter egg item',
      check = function(s)
          for _, id in ipairs({ 'staffcard', 'batteries', 'teddy', 'stunpack', 'tape' }) do
              if (s.items[id] or 0) < 1 then return false end
          end
          return true
      end },
    { id = 'body_bag_dodger', name = 'Body Bag Dodger', colour = '#6EC1E4', desc = 'Escape without being caught once',
      run = function(r) return r.escaped and r.caught == 0 end },
    { id = 'the_unkillable',  name = 'The Unkillable',  colour = '#D7263D', desc = 'Escape on Extreme without being caught',
      run = function(r) return r.escaped and r.difficulty == 'extreme' and r.caught == 0 end },
}

local ValidItems = { staffcard = true, batteries = true, teddy = true, stunpack = true, tape = true, morgue_note = true, morgue_tape = true }

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
    print(('[HORROR] %s (%d) earned the chat title "%s" (%s) - placeholder, nothing was given'):format(GetPlayerName(src) or '?', src, title.name, title.colour))
    return true
end

local vRP
local function GetVRP()
    if vRP then return vRP end
    local ok, proxy = pcall(function()
        if type(module) == 'function' then return module("vrp", "lib/Proxy") end
        -- @vrp/lib/utils.lua isn't loaded: read vRP's Proxy.lua ourselves
        local code = LoadResourceFile("vrp", "lib/Proxy.lua")
        if not code then error('vrp/lib/Proxy.lua not found - is the vrp resource started?') end
        local f, err = load(code, '@vrp/lib/Proxy.lua')
        if not f then error(err) end
        return f()
    end)
    if not ok or not proxy then
        print('[ls-horror] could not load vrp lib/Proxy: ' .. tostring(proxy))
        return nil
    end
    local ok2, iface = pcall(function() return proxy.getInterface("vRP") end)
    if not ok2 or not iface then
        print('[ls-horror] could not get the vRP interface: ' .. tostring(iface))
        return nil
    end
    vRP = iface
    return vRP
end

local function GiveNote(src, key)
    local itemId = NoteItems[key]
    if not itemId then return false end
    local v = GetVRP()
    if not v then return false end
    local ok, userId = pcall(function() return v.getUserId({src}) end)
    if not ok then
        print('[ls-horror] vRP.getUserId errored: ' .. tostring(userId))
        return false
    end
    if not userId then
        print(('[ls-horror] vRP.getUserId returned nothing for source %s - vrp may have been restarted after ls-horror, restart ls-horror too'):format(tostring(src)))
        vRP = nil
        return false
    end
    local ok2, err = pcall(function() v.tryGiveInventoryItem({userId, itemId, 1}) end)
    if not ok2 then
        print('[ls-horror] vRP.tryGiveInventoryItem errored: ' .. tostring(err))
        return false
    end
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
    s.morgueNotes = s.morgueNotes or 0
    s.tapes       = s.tapes or 0
    s.items       = s.items or {}
    s.titles      = s.titles or {}
    s.best        = s.best or {}
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
                TriggerEvent('horror:titleEarned', src, t.id, t.name, t.colour)
            end
        end
    end
    for i, t in ipairs(earned) do
        SetTimeout((i - 1) * 4000, function()
            TriggerClientEvent('horror:notify', src, ('~y~CHAT TITLE UNLOCKED:~s~ %s~n~~c~%s'):format(t.name, t.desc), 7000)
        end)
    end
    return earned
end

-- ============================================================
-- LEADERBOARD
-- ============================================================
local BoardSize = 10
local Difficulties = { easy = true, hard = true, extreme = true }

local function LoadBoard(diff)
    local raw = GetResourceKvpString('board:' .. diff)
    local ok, data = pcall(json.decode, raw or '')
    return (ok and type(data) == 'table') and data or {}
end

local function SaveBoard(diff, board)
    SetResourceKvp('board:' .. diff, json.encode(board))
end

local function SubmitTime(src, diff, seconds)
    local key = PlayerKey(src)
    local board = LoadBoard(diff)
    local existing
    for _, e in ipairs(board) do
        if e.key == key then existing = e break end
    end
    if existing then
        if seconds < existing.seconds then
            existing.seconds = seconds
            existing.name = GetPlayerName(src) or existing.name
            existing.date = os.date('%Y-%m-%d')
        end
    else
        table.insert(board, { key = key, name = GetPlayerName(src) or 'Unknown', seconds = seconds, date = os.date('%Y-%m-%d') })
    end
    table.sort(board, function(a, b) return a.seconds < b.seconds end)
    while #board > BoardSize do table.remove(board) end
    SaveBoard(diff, board)
    for i, e in ipairs(board) do
        if e.key == key then return i end
    end
    return nil
end

local function FormatTime(seconds)
    return ('%d:%02d'):format(math.floor(seconds / 60), seconds % 60)
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
    if not r then return end

    local seconds = math.max(0, os.time() - run.started)
    local stats = GetStats(src)
    local result = { seconds = seconds, escaped = r.escaped, difficulty = r.difficulty, titles = {} }
    if r.escaped then
        local prev = stats.best[r.difficulty]
        result.previousBest = prev
        if not prev or seconds < prev then
            stats.best[r.difficulty] = seconds
            result.personalBest = true
        end
        result.rank = SubmitTime(src, r.difficulty, seconds)
    end
    if r.escaped then
        stats.escapes = stats.escapes + 1
        if r.difficulty ~= 'easy' then stats.hardEscapes = stats.hardEscapes + 1 end
        if r.difficulty == 'extreme' then stats.extremeEscapes = stats.extremeEscapes + 1 end
    end
    stats.caught = stats.caught + r.caught
    stats.fuses  = stats.fuses + r.fuses
    stats.stuns  = stats.stuns + r.stuns
    stats.lures  = stats.lures + r.lures
    if r.item and r.item ~= 'morgue_note' and r.item ~= 'morgue_tape' then
        stats.items[r.item] = (stats.items[r.item] or 0) + 1
    end

    for _, t in ipairs(CheckTitles(src, stats, r)) do
        table.insert(result.titles, { name = t.name, colour = t.colour })
    end
    SaveStats(src, stats)
    TriggerClientEvent('horror:runResult', src, result)
end)

local NoteCounters = { morgue = 'morgueNotes', tape = 'tapes' }

RegisterNetEvent('horror:noteFound', function(key)
    local src = source
    if type(key) ~= 'string' or not NoteItems[key] then return end
    local run = runs[src]
    if not run or run.noteClaimed then return end
    if os.time() - run.started < MinSecondsIntoRun then
        print(('[ls-horror] note %s ignored for %s: picked up within %ds of starting'):format(key, src, MinSecondsIntoRun))
        TriggerClientEvent('horror:notify', src, '~r~Too quick - the note crumbles. Try again next run.', 5000)
        return
    end

    run.noteClaimed = true
    if not GiveNote(src, key) then
        print(('[ls-horror] note %s could not be given to %s (vrp not running, or player has no user id)'):format(key, src))
        TriggerClientEvent('horror:notify', src, '~r~The note could not be added to your inventory.', 5000)
    else
        TriggerClientEvent('horror:notify', src, '~g~' .. NoteMessages[key], 6000)
        local stats = GetStats(src)
        local counter = NoteCounters[key]
        stats[counter] = (stats[counter] or 0) + 1
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

RegisterCommand('horrortop', function(src, args)
    local diff = (args[1] or 'easy'):lower()
    if not Difficulties[diff] then diff = 'easy' end
    local board = LoadBoard(diff)
    local lines = {}
    for i = 1, math.min(5, #board) do
        local e = board[i]
        table.insert(lines, ('%d. %s  ~y~%s~s~'):format(i, e.name, FormatTime(e.seconds)))
    end
    local text = ('~r~FASTEST ESCAPES~s~ (%s)~n~%s'):format(diff:upper(), #lines > 0 and table.concat(lines, '~n~') or 'Nobody has escaped yet.')
    if src == 0 then
        print((text:gsub('~n~', '\n'):gsub('~.-~', '')))
    else
        TriggerClientEvent('horror:notify', src, text, 12000)
    end
end, false)

exports('GetHorrorStats', function(src) return GetStats(src) end)
exports('GetHorrorLeaderboard', function(diff) return LoadBoard(Difficulties[diff] and diff or 'easy') end)
exports('GetHorrorTitles', function()
    local list = {}
    for _, t in ipairs(Titles) do
        table.insert(list, { id = t.id, name = t.name, colour = t.colour, desc = t.desc })
    end
    return list
end)
