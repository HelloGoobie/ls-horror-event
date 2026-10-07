--[[
    Morgue Horror Event
    ---------------------------------------------------------------
    Client-side script.

    This revision:
      - 6 zombie variants, re-rolled on every spawn AND every respawn.
      - Full monster audio suppression (pain, speech, ambient) applied
        at spawn time, plus an active silencing loop during the taser
        stun window.
      - Fixed control panel repair animation (mini@repair / fixing_a_player).
      - Model validation + safe fallback.
      - 5 random fuse locations from 12 options.
      - 1-5 required fuses; remaining are decoys.
      - 10-second control panel repair lock with control disabling.
      - Getting caught during repair loses 1 collected fuse.
      - 3-minute visible countdown timer after panel repair.
]]

-- ============================================================
-- CONFIG
-- ============================================================

local Config = {
    EntranceCoords = vector3(3591.5415, 3660.5994, 33.8717),

    InteriorLoadCoords   = vector3(244.9, -1374.7, 39.5),
    InteriorSpawnCoords  = vector3(245.3582, -1374.1821, 39.5344),
    InteriorHeading      = 306.9981,

    -- All six zombie variants. One is picked at random every single
    -- time a monster is created, so the zombie changes between the
    -- initial spawn and every post-taser respawn.
    MonsterModels = {
        'u_m_y_zombie_01',
        'u_m_y_zombie_02',
        'u_m_y_zombie_03',
        'u_m_y_zombie_04',
        'u_m_y_zombie_05',
        'u_m_y_zombie_06'
    },

    -- u_m_y_zombie_04 and _05 are quadruped dog peds (cloned from a
    -- rottweiler-skeleton custom ped), not humanoids. Anything in this
    -- list skips the humanoid MonsterWalkStyle clipset and uses its
    -- own dog movement clipset instead.
    QuadrupedModels = {
        u_m_y_zombie_04 = true,
        u_m_y_zombie_05 = true
    },
    DogMovementClipSet = 'CREATURES@ROTTWEILER@MOVE',

    -- Used only if every entry in MonsterModels fails IsModelValid() at
    -- runtime, so the event can never stall with no monster at all.
    FallbackMonsterModels = {
        'u_m_y_zombie_01',
        'a_m_y_hipster_01',
        'a_m_m_skidrow_01'
    },

    MonsterWalkStyle = 'move_m@injured',

    MonsterSpawnPoints = {
        { coords = vector3(296.7228, -1352.8694, 24.5378), heading = 17.2943 },
        { coords = vector3(274.7172, -1336.7670, 24.5378), heading = 220.4918 },
        { coords = vector3(253.4083, -1344.2274, 24.5378), heading = 229.3595 },
        { coords = vector3(257.3588, -1354.2167, 24.5378), heading = 60.4268 },
        { coords = vector3(246.0771, -1362.4000, 24.5378), heading = 134.5765 },
        { coords = vector3(239.7247, -1367.1034, 24.5322), heading = 212.6565 },
        { coords = vector3(239.3519, -1366.9805, 29.6483), heading = 201.5660 },
        { coords = vector3(239.4023, -1361.8411, 29.6480), heading = 294.5356 },
        { coords = vector3(254.3727, -1359.4260, 29.6494), heading = 163.2847 },
        { coords = vector3(231.6435, -1371.0513, 39.5344), heading = 314.2071 },
        { coords = vector3(268.3701, -1364.1857, 24.5378), heading = 19.8313 }
    },

    PlayerRespawnPoints = {
        { coords = vector3(249.3059, -1354.9513, 25.5544), heading = 223.2665 },
        { coords = vector3(262.0326, -1339.7024, 25.5544), heading = 232.2469 },
        { coords = vector3(294.6910, -1353.1614, 25.5824), heading = 26.0192 },
        { coords = vector3(246.8988, -1371.8922, 24.5378), heading = 286.0685 },
        { coords = vector3(237.2182, -1359.6812, 24.5378), heading = 263.3875 },
        { coords = vector3(237.2774, -1370.6906, 23.2901), heading = 323.1952 },
        { coords = vector3(242.1063, -1369.0913, 29.6484), heading = 74.3823 },
        { coords = vector3(237.8330, -1359.2549, 29.6480), heading = 295.3215 },
        { coords = vector3(255.2388, -1360.2366, 29.6494), heading = 184.2091 },
        { coords = vector3(243.5753, -1375.6437, 39.5344), heading = 314.4247 },
        { coords = vector3(261.8217, -1378.4458, 39.5344), heading = 54.6895 },
        { coords = vector3(239.9566, -1360.5629, 39.5344), heading = 142.4455 }
    },

    ExitPoints = {
        { coords = vector3(253.8832, -1372.1047, 29.6480), heading = 248.0316 },
        { coords = vector3(235.5068, -1372.8160, 21.9741), heading = 142.7319 },
        { coords = vector3(254.0336, -1372.2338, 24.5378), heading = 233.4317 },
        { coords = vector3(275.4644, -1361.2001, 24.5378), heading = 237.1073 },
        { coords = vector3(286.0244, -1350.6537, 24.5346), heading = 133.3167 }
    },

    AllFusePool = {
        vector3(234.9758, -1359.4982, 39.5344),
        vector3(229.5871, -1368.9719, 39.5344),
        vector3(248.8054, -1374.6204, 39.5344),
        vector3(253.7555, -1387.8795, 39.5344),
        vector3(256.4555, -1361.0050, 29.6494),
        vector3(239.6196, -1359.1752, 29.6480),
        vector3(239.2071, -1358.6498, 24.5378),
        vector3(246.3018, -1354.4984, 24.5378),
        vector3(258.9984, -1339.4098, 24.5378),
        vector3(278.7172, -1333.2753, 24.5378),
        vector3(294.9447, -1348.2612, 24.5378),
        vector3(263.0370, -1360.3546, 24.5378)
    },

    ControlPanel = vector3(252.9142, -1361.1176, 29.6494),

    FuseProp = 'prop_car_battery_01',

    -- Repair animation. mini@repair / fixing_a_player is a base-game
    -- dict+anim pair; the previous clubhouse dict was not a real one,
    -- which is why the repair always fell through to the error branch.
    RepairAnimDict = 'mini@repair',
    RepairAnimName = 'fixing_a_player',

    MaxCatches             = 5,
    HeadStartSeconds       = 10,
    FlashlightDrainRate    = 0.05,
    StaminaDrainRate       = 1.5,
    StaminaRegenRate       = 0.8,

    MonsterPatrolSpeed     = 0.65,
    MonsterChaseSpeed      = 1.05,
    MonsterMaxChaseSpeed   = 1.35,
    SpeedRampSeconds       = 90,

    ExitCooldownMs         = 3000,
    FlashlightLoseAimDot   = 0.70,

    JumpscareTriggerDist   = 3.2,
    JumpscareCooldownMs    = 15000,
    DecoyStaminaPenalty    = 8.0,

    ShowContentWarning     = true,
    PlayIntroCutscene      = true,
    CutsceneShotSeconds    = 3.5,
    CutsceneFOV            = 45.0,

    ModelLoadTimeoutTicks  = 200,
}

-- ============================================================
-- STATE
-- ============================================================

local isEventActive = false
local warningOpen = false
local monsterPed = nil
local countdownTimer = 5
local timesCaught = 0
local previousCamMode = 0

local flashlightBattery = 100.0
local playerStamina = 100.0
local actualRealExitIndex = 1
local exitCooldown = 0

local activeNotification = { text = "", time = 0 }
local clueObjects = {}
local activeFuseCoords = {}
local realFuseIndices = {}
local totalFusesRequired = 1
local fusesCollected = 0
local panelRepaired = false
local escapeTimerSeconds = 0

local chaseStartTime = 0
local lastJumpscareTime = 0
local focusInActive = false

local aiState = "PATROL"
local lastSeenTime = 0
local lastSeenCoords = nil
local currentPatrolTarget = nil

-- ============================================================
-- TEXT / HUD HELPERS
-- ============================================================

function ShowNotification(msg, duration)
    activeNotification = {
        text = msg,
        time = GetGameTimer() + (duration or 5000)
    }
end

local function DrawScaledText(x, y, scale, text, r, g, b, a, font, centre)
    SetTextFont(font or 4)
    SetTextProportional(1)
    SetTextScale(0.0, scale)
    SetTextColour(r, g, b, a)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 200)
    SetTextCentre(centre ~= false)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(x, y, 0)
end

CreateThread(function()
    while true do
        local sleep = 500
        if isEventActive then
            sleep = 0

            if GetGameTimer() < activeNotification.time then
                DrawScaledText(0.5, 0.15, 0.55, activeNotification.text, 255, 255, 255, 255)
            end

            local fuseStatusText = ""
            if not panelRepaired then
                fuseStatusText = string.format("Fuses: %d / %d Collected", fusesCollected, totalFusesRequired)
            else
                local mins = math.floor(escapeTimerSeconds / 60)
                local secs = escapeTimerSeconds % 60
                fuseStatusText = string.format("~r~Escape Time: %02d:%02d~s~", mins, secs)
            end

            local statusText = string.format("Battery: %d%% | %s | ~b~[TAB]~s~ Swap Tool", math.floor(flashlightBattery), fuseStatusText)
            DrawScaledText(0.75, 0.93, 0.35, statusText, 200, 200, 200, 255, 0)
        end
        Wait(sleep)
    end
end)

-- ============================================================
-- INTERIOR IPL
-- ============================================================

CreateThread(function()
    RequestIpl("Coroner_Int_on")
    local timeout = 0
    while not IsIplActive("Coroner_Int_on") and timeout < 100 do
        Wait(50)
        timeout = timeout + 1
    end

    local interiorID = GetInteriorAtCoords(Config.InteriorLoadCoords.x, Config.InteriorLoadCoords.y, Config.InteriorLoadCoords.z)
    if IsValidInterior(interiorID) then
        PinInteriorInMemory(interiorID)
    end
end)

-- ============================================================
-- CONTENT WARNING GATE
-- ============================================================

local pendingWarningCallback = nil

local function ResolveWarning(accepted)
    if not warningOpen then return end
    warningOpen = false
    FreezeEntityPosition(PlayerPedId(), false)
    DisplayRadar(true)

    local callback = pendingWarningCallback
    pendingWarningCallback = nil
    if callback then callback(accepted) end
end

RegisterCommand('_horrorWarningAccept', function()
    ResolveWarning(true)
end, false)
RegisterKeyMapping('_horrorWarningAccept', 'Confirm Horror Event Warning', 'keyboard', 'RETURN')

RegisterCommand('_horrorWarningCancel', function()
    ResolveWarning(false)
end, false)
RegisterKeyMapping('_horrorWarningCancel', 'Cancel Horror Event Warning', 'keyboard', 'BACK')

function ShowContentWarningPrompt(onResult)
    if warningOpen then return end
    if not Config.ShowContentWarning then
        onResult(true)
        return
    end

    warningOpen = true
    pendingWarningCallback = onResult
    local playerPed = PlayerPedId()
    FreezeEntityPosition(playerPed, true)
    DisplayRadar(false)

    CreateThread(function()
        while warningOpen do
            DisableAllControlActions(0)

            DrawRect(0.5, 0.5, 1.0, 1.0, 0, 0, 0, 190)

            DrawScaledText(0.5, 0.28, 0.75, "~r~CONTENT WARNING", 255, 60, 60, 255)
            DrawScaledText(0.5, 0.36, 0.40, "This experience contains ~y~flashing lights~s~, ~y~loud and sudden sounds~s~,", 255, 255, 255, 255)
            DrawScaledText(0.5, 0.40, 0.40, "and ~y~horror / jump-scare elements~s~.", 255, 255, 255, 255)
            DrawScaledText(0.5, 0.46, 0.40, "If you are sensitive to any of the above, please proceed with caution.", 255, 255, 255, 255)
            DrawScaledText(0.5, 0.50, 0.40, "~o~Play at your own risk.~s~", 255, 255, 255, 255)

            DrawScaledText(0.5, 0.60, 0.45, "~g~ENTER~s~ to Continue         ~r~BACKSPACE~s~ to Cancel", 220, 220, 220, 255)

            Wait(0)
        end
    end)
end

local function RequestStartHorrorEvent()
    if isEventActive or warningOpen then return end
    ShowContentWarningPrompt(function(accepted)
        if accepted then
            StartHorrorEvent()
        end
    end)
end

-- ============================================================
-- COMMANDS
-- ============================================================

RegisterCommand('startHorror', function()
    RequestStartHorrorEvent()
end, false)

-- ============================================================
-- ENTRANCE MARKER / TRIGGER
-- ============================================================

CreateThread(function()
    while true do
        local sleep = 1000
        if not isEventActive and not warningOpen then
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local dist = #(playerCoords - Config.EntranceCoords)

            if dist < 10.0 then
                sleep = 0
                DrawMarker(1, Config.EntranceCoords.x, Config.EntranceCoords.y, Config.EntranceCoords.z - 1.0,
                    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 0.5, 255, 0, 0, 100, false, true, 2, false, nil, nil, false)

                if dist < 2.0 then
                    BeginTextCommandDisplayHelp("STRING")
                    AddTextComponentSubstringPlayerName("Press ~INPUT_CONTEXT~ to enter the Horror Event")
                    EndTextCommandDisplayHelp(0, false, true, -1)

                    if IsControlJustReleased(0, 38) then
                        RequestStartHorrorEvent()
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

-- ============================================================
-- INTRO CUTSCENE
-- ============================================================

local function SafeDirection(target, referencePoint)
    local dx = referencePoint.x - target.x
    local dy = referencePoint.y - target.y
    local len = math.sqrt(dx * dx + dy * dy)
    if len < 0.5 then
        return 1.0, 0.0
    end
    return dx / len, dy / len
end

local function WaitForCollision(coords, maxMs)
    RequestCollisionAtCoord(coords.x, coords.y, coords.z)
    local waited = 0
    while not HasCollisionLoadedAroundEntity(PlayerPedId()) and waited < (maxMs or 1500) do
        Wait(50)
        waited = waited + 50
    end
end

local function OrbitShot(target, referencePoint, entity, radius, height, sweepDegrees, durationMs, holdMs, label)
    WaitForCollision(vector3(target.x, target.y, target.z + height), 1000)

    local dirX, dirY = SafeDirection(target, referencePoint)
    local baseAngle = math.deg(math.atan(dirY, dirX))

    local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamFov(cam, Config.CutsceneFOV)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 600, true, false)

    local startTime = GetGameTimer()
    local endTime = startTime + durationMs
    local holdEnd = endTime + holdMs

    while GetGameTimer() < holdEnd and isEventActive do
        local now = GetGameTimer()
        local t = math.min(1.0, (now - startTime) / durationMs)
        local eased = t * t * (3.0 - 2.0 * t)
        local angle = baseAngle - (sweepDegrees / 2.0) + (sweepDegrees * eased)
        local rad = math.rad(angle)

        local camX = target.x + math.cos(rad) * radius
        local camY = target.y + math.sin(rad) * radius
        local camZ = target.z + height

        SetCamCoord(cam, camX, camY, camZ)

        if entity and DoesEntityExist(entity) then
            PointCamAtEntity(cam, entity, 0.0, 0.0, 0.6, true)
        else
            PointCamAtCoord(cam, target.x, target.y, target.z + 0.6)
        end

        if label then
            DrawScaledText(0.5, 0.85, 0.5, label, 255, 255, 255, 255)
        end

        Wait(0)
    end

    return cam
end

function PlayIntroCutscene(onComplete)
    local playerPed = PlayerPedId()
    FreezeEntityPosition(playerPed, true)
    DisplayRadar(false)

    if DoesEntityExist(monsterPed) then
        ClearPedTasksImmediately(monsterPed)
        FreezeEntityPosition(monsterPed, true)
    end

    CreateThread(function()
        DoScreenFadeOut(400)
        Wait(450)
        DoScreenFadeIn(600)

        local monsterCoords = DoesEntityExist(monsterPed) and GetEntityCoords(monsterPed) or Config.InteriorSpawnCoords
        local cam1 = OrbitShot(
            monsterCoords,
            Config.InteriorSpawnCoords,
            monsterPed,
            2.6,
            1.3,
            70.0,
            math.floor(Config.CutsceneShotSeconds * 1000),
            2000,
            "~r~Something waits down here in the dark...~s~"
        )

        DoScreenFadeOut(300)
        Wait(350)
        DestroyCam(cam1, false)

        local fusePos = activeFuseCoords[1] or Config.ControlPanel
        DoScreenFadeIn(400)
        local cam2 = OrbitShot(
            fusePos,
            Config.InteriorSpawnCoords,
            nil,
            2.0,
            1.4,
            40.0,
            math.floor(Config.CutsceneShotSeconds * 1000),
            2000,
            ("~y~Search for %d fuses to repair the control panel.~s~"):format(totalFusesRequired)
        )

        DoScreenFadeOut(300)
        Wait(350)
        DestroyCam(cam2, false)

        local exitPos = Config.ExitPoints[actualRealExitIndex].coords
        DoScreenFadeIn(400)
        local cam3 = OrbitShot(
            exitPos,
            Config.InteriorSpawnCoords,
            nil,
            2.0,
            1.4,
            40.0,
            math.floor(Config.CutsceneShotSeconds * 1000),
            2000,
            "~g~...then find your way out before time runs out.~s~"
        )

        DoScreenFadeOut(300)
        Wait(350)
        DestroyCam(cam3, false)

        RenderScriptCams(false, true, 500, true, false)
        FreezeEntityPosition(playerPed, false)
        if DoesEntityExist(monsterPed) then
            FreezeEntityPosition(monsterPed, false)
        end
        DisplayRadar(true)

        DoScreenFadeIn(500)

        if onComplete then
            onComplete()
        end
    end)
end

-- ============================================================
-- EVENT START
-- ============================================================

function StartHorrorEvent()
    isEventActive = true
    countdownTimer = Config.HeadStartSeconds
    timesCaught = 0
    flashlightBattery = 100.0
    playerStamina = 100.0
    exitCooldown = 0
    lastJumpscareTime = 0
    fusesCollected = 0
    panelRepaired = false
    escapeTimerSeconds = 0

    aiState = "PATROL"
    lastSeenTime = 0
    currentPatrolTarget = nil

    math.randomseed(GetGameTimer())
    actualRealExitIndex = math.random(#Config.ExitPoints)
    totalFusesRequired = math.random(1, 5)

    local shuffledPool = {}
    for _, coord in ipairs(Config.AllFusePool) do
        table.insert(shuffledPool, coord)
    end
    for i = #shuffledPool, 2, -1 do
        local j = math.random(i)
        shuffledPool[i], shuffledPool[j] = shuffledPool[j], shuffledPool[i]
    end

    activeFuseCoords = {}
    realFuseIndices = {}
    for i = 1, 5 do
        table.insert(activeFuseCoords, shuffledPool[i])
    end

    local indices = {1, 2, 3, 4, 5}
    for i = #indices, 2, -1 do
        local j = math.random(i)
        indices[i], indices[j] = indices[j], indices[i]
    end
    for i = 1, totalFusesRequired do
        realFuseIndices[indices[i]] = true
    end

    previousCamMode = GetFollowPedCamViewMode()

    DoScreenFadeOut(500)
    Wait(500)

    local playerPed = PlayerPedId()

    SetFocusArea(Config.InteriorLoadCoords.x, Config.InteriorLoadCoords.y, Config.InteriorLoadCoords.z, 0.0, 0.0, 0.0)

    FreezeEntityPosition(playerPed, true)
    SetEntityCoords(playerPed, Config.InteriorSpawnCoords.x, Config.InteriorSpawnCoords.y, Config.InteriorSpawnCoords.z, false, false, false, true)
    SetEntityHeading(playerPed, Config.InteriorHeading)

    RequestCollisionAtCoord(Config.InteriorSpawnCoords.x, Config.InteriorSpawnCoords.y, Config.InteriorSpawnCoords.z)
    local timeout = 0
    while not HasCollisionLoadedAroundEntity(playerPed) and timeout < 50 do
        Wait(100)
        timeout = timeout + 1
    end

    ClearFocus()
    FreezeEntityPosition(playerPed, false)

    Wait(500)
    DoScreenFadeIn(500)

    ClearTimecycleModifier()
    DisableScreenblurFade()
    SetTimecycleModifier("MP_Smuggler_Int")
    SetTimecycleModifierStrength(1.0)

    local flashlightHash = GetHashKey("WEAPON_FLASHLIGHT")
    local tazerHash = GetHashKey("WEAPON_STUNGUN")
    GiveWeaponToPed(playerPed, flashlightHash, 1, false, true)
    GiveWeaponToPed(playerPed, tazerHash, 100, false, false)
    SetCurrentPedWeapon(playerPed, flashlightHash, true)

    StartWeaponLockLoop()
    StartObjectiveLoop()
    StartProximitySoundLoop()
    StartSurvivalMechanicsLoop()

    CreateMonster(function(success)
        if not success then
            ShowNotification("Failed to spawn the monster - ending event.", 6000)
            EndHorrorEvent(false)
            return
        end

        SpawnClueProps()

        local function BeginChaseSequence()
            StartDarknessEnforcementLoop()
            StartFirstPersonLoop()
            StartMonsterSilenceLoop()

            SendNUIMessage({ action = "playSound", soundId = "ambient", loop = true, volume = 0.35 })

            CreateThread(function()
                while isEventActive and countdownTimer > 0 do
                    ShowNotification("Head start... Hide or run! " .. countdownTimer, 1000)
                    Wait(1000)
                    countdownTimer = countdownTimer - 1
                end

                if isEventActive then
                    ShowNotification("IT IS COMING. FIND THE FUSES.", 5000)
                    chaseStartTime = GetGameTimer()
                    StartStalkerAI()
                end
            end)

            ShowNotification(("Collect %d fuses and repair the control panel!"):format(totalFusesRequired), 5000)
        end

        if Config.PlayIntroCutscene then
            PlayIntroCutscene(BeginChaseSequence)
        else
            BeginChaseSequence()
        end
    end)
end

-- ============================================================
-- CORE LOOPS
-- ============================================================

function StartFirstPersonLoop()
    CreateThread(function()
        while isEventActive do
            SetFollowPedCamViewMode(4)
            Wait(0)
        end
    end)
end

function StartDarknessEnforcementLoop()
    CreateThread(function()
        while isEventActive do
            NetworkOverrideClockTime(0, 0, 0)
            SetOverrideWeather("EXTRASUNNY")
            SetBlackout(true)
            Wait(0)
        end
    end)
end

--[[
    Continuously kills any vocal audio the monster tries to start.
    Config flag 32 (pain audio) alone does not stop the stun-gun
    reaction, because the shock also queues ambient speech / a pain
    voice line through a separate path. This loop cuts those off the
    frame they begin, for the whole duration of the event.
]]
function StartMonsterSilenceLoop()
    CreateThread(function()
        while isEventActive do
            if DoesEntityExist(monsterPed) then
                StopCurrentPlayingAmbientSpeech(monsterPed)
                StopCurrentPlayingSpeech(monsterPed)
                SetPedConfigFlag(monsterPed, 32, true)
            end
            Wait(0)
        end
    end)
end

-- Applies every audio-suppression call available to a freshly created ped.
function SilenceMonsterPed(ped)
    if not DoesEntityExist(ped) then return end

    -- Pain audio (grunts, hit reactions, taser shock vocalization)
    SetPedConfigFlag(ped, 32, true)
    DisablePedPainAudio(ped, true)

    -- Speech / ambient voice lines
    BlockAllSpeechFromPed(ped, true, true)
    SetAmbientVoiceName(ped, "")
    StopCurrentPlayingAmbientSpeech(ped)
    StopCurrentPlayingSpeech(ped)

    -- Stops the ped's generic ambient chatter behaviour entirely
    SetPedCanPlayAmbientAnims(ped, false)
    SetPedCanPlayAmbientBaseAnims(ped, false)
end

function StartWeaponLockLoop()
    CreateThread(function()
        local flashlightHash = GetHashKey("WEAPON_FLASHLIGHT")
        local tazerHash = GetHashKey("WEAPON_STUNGUN")

        while isEventActive do
            DisableControlAction(0, 37, true)
            DisableControlAction(1, 37, true)

            if IsDisabledControlJustReleased(0, 37) then
                local playerPed = PlayerPedId()
                local currentWep = GetSelectedPedWeapon(playerPed)

                if currentWep == flashlightHash then
                    SetCurrentPedWeapon(playerPed, tazerHash, true)
                else
                    if flashlightBattery > 0 then
                        SetCurrentPedWeapon(playerPed, flashlightHash, true)
                    end
                end
            end
            Wait(0)
        end
    end)
end

function StartSurvivalMechanicsLoop()
    CreateThread(function()
        while isEventActive do
            local playerPed = PlayerPedId()

            if IsPedSprinting(playerPed) then
                playerStamina = math.max(0, playerStamina - Config.StaminaDrainRate)
                if playerStamina == 0 then
                    SetPedMoveRateOverride(playerPed, 0.5)
                end
            elseif playerStamina < 100.0 then
                playerStamina = math.min(100.0, playerStamina + Config.StaminaRegenRate)
            end

            if flashlightBattery > 0 then
                if GetSelectedPedWeapon(playerPed) == GetHashKey("WEAPON_FLASHLIGHT") and (IsPlayerFreeAiming(PlayerId()) or IsControlPressed(0, 25)) then
                    flashlightBattery = flashlightBattery - Config.FlashlightDrainRate
                end
            else
                if HasPedGotWeapon(playerPed, GetHashKey("WEAPON_FLASHLIGHT"), false) then
                    RemoveWeaponFromPed(playerPed, GetHashKey("WEAPON_FLASHLIGHT"))
                    SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_STUNGUN"), true)
                end
            end

            if exitCooldown > 0 then
                exitCooldown = exitCooldown - 100
            end

            Wait(100)
        end
    end)
end

function StartEscapeTimerLoop()
    CreateThread(function()
        escapeTimerSeconds = 180 -- 3 minutes
        while isEventActive and panelRepaired and escapeTimerSeconds > 0 do
            Wait(1000)
            if isEventActive and panelRepaired then
                escapeTimerSeconds = escapeTimerSeconds - 1
                if escapeTimerSeconds <= 0 then
                    ShowNotification("Time has run out... You failed to escape!", 6000)
                    EndHorrorEvent(false)
                end
            end
        end
    end)
end

function StartProximitySoundLoop()
    CreateThread(function()
        local nextGrowlTime = GetGameTimer() + math.random(5000, 10000)

        while isEventActive do
            if DoesEntityExist(monsterPed) then
                local pCoords = GetEntityCoords(PlayerPedId())
                local mCoords = GetEntityCoords(monsterPed)

                local zDiff = math.abs(pCoords.z - mCoords.z)
                local dist2d = #(vector2(pCoords.x, pCoords.y) - vector2(mCoords.x, mCoords.y))

                if dist2d < 30.0 and zDiff < 4.0 then
                    if GetGameTimer() > nextGrowlTime then
                        if dist2d < 12.0 then
                            SendNUIMessage({ action = "playSound", soundId = "growl_close", volume = 0.5 })
                        else
                            SendNUIMessage({ action = "playSound", soundId = "growl_far", volume = 0.4 })
                        end
                        nextGrowlTime = GetGameTimer() + math.random(8000, 16000)
                    end
                end

                if dist2d < 20.0 and zDiff < 3.0 then
                    local intensity = 1.0 - (dist2d / 20.0)
                    local vol = 0.5 + (intensity * 0.5)
                    local spd = 1.0 + (intensity * 0.4)

                    SendNUIMessage({
                        action = "playHeartbeat",
                        volume = vol,
                        speed = spd
                    })

                    if dist2d < 6.0 and not focusInActive then
                        focusInActive = true
                        AnimpostfxPlay("FocusIn", 200, false)
                    elseif dist2d >= 6.0 and focusInActive then
                        focusInActive = false
                        AnimpostfxStop("FocusIn")
                    end

                    Wait(200)
                else
                    SendNUIMessage({ action = "stopHeartbeat" })
                    if focusInActive then
                        focusInActive = false
                        AnimpostfxStop("FocusIn")
                    end
                    Wait(300)
                end
            else
                SendNUIMessage({ action = "stopHeartbeat" })
                if focusInActive then
                    focusInActive = false
                    AnimpostfxStop("FocusIn")
                end
                Wait(1000)
            end
        end
    end)
end

-- ============================================================
-- MONSTER AI, STEALTH & JUMPSCARE
-- ============================================================

local function GetRandomPatrolNode()
    local nodes = {}
    for _, sp in ipairs(Config.MonsterSpawnPoints) do table.insert(nodes, sp.coords) end
    for _, cp in ipairs(activeFuseCoords) do table.insert(nodes, cp) end
    for _, ep in ipairs(Config.ExitPoints) do table.insert(nodes, ep.coords) end
    table.insert(nodes, Config.ControlPanel)
    return nodes[math.random(#nodes)]
end

--[[
    Picks a valid, loadable ped model from a candidate list.
    The list is shuffled every call, so each spawn/respawn rolls a
    different zombie variant rather than reusing the first entry.
    Skips any name GTA doesn't recognise (IsModelValid == false).
]]
local function PickValidModel(candidateList)
    local pool = {}
    for _, name in ipairs(candidateList) do table.insert(pool, name) end
    for i = #pool, 2, -1 do
        local j = math.random(i)
        pool[i], pool[j] = pool[j], pool[i]
    end

    for _, name in ipairs(pool) do
        local hash = GetHashKey(name)
        if IsModelValid(hash) then
            return hash, name
        else
            print(('[HORROR WARNING] "%s" is not a registered/valid model - skipping.'):format(name))
        end
    end

    return nil, nil
end

--[[
    Asynchronous. Pass a callback(success) which fires once the ped
    has either spawned or every candidate has failed to load.
    A fresh random model is chosen on every call.
]]
function CreateMonster(callback)
    CreateThread(function()
        local modelHash, modelName = PickValidModel(Config.MonsterModels)

        if not modelHash then
            print('[HORROR ERROR] No valid model found in Config.MonsterModels - trying fallback list.')
            modelHash, modelName = PickValidModel(Config.FallbackMonsterModels)
        end

        if not modelHash then
            print('[HORROR ERROR] No valid monster model available at all (primary or fallback). Aborting spawn.')
            if callback then callback(false) end
            return
        end

        RequestModel(modelHash)
        local timeout = 0
        while not HasModelLoaded(modelHash) do
            Wait(100)
            timeout = timeout + 1
            if timeout > Config.ModelLoadTimeoutTicks then
                print('[HORROR ERROR] Failed to load model: ' .. modelName)
                SetModelAsNoLongerNeeded(modelHash)
                if callback then callback(false) end
                return
            end
        end

        print('[HORROR] Spawning monster variant: ' .. modelName)

        local randomSpawn = Config.MonsterSpawnPoints[math.random(#Config.MonsterSpawnPoints)]
        monsterPed = CreatePed(4, modelHash, randomSpawn.coords.x, randomSpawn.coords.y, randomSpawn.coords.z, randomSpawn.heading, true, true)

        if DoesEntityExist(monsterPed) then
            -- Audio suppression FIRST, before the ped can react to anything.
            SilenceMonsterPed(monsterPed)

            SetPedCanRagdoll(monsterPed, true)
            SetEntityInvincible(monsterPed, false)
            SetEntityMaxHealth(monsterPed, 9999)
            SetEntityHealth(monsterPed, 9999)
            SetPedDropsWeaponsWhenDead(monsterPed, false)

            SetPedFleeAttributes(monsterPed, 0, false)
            SetPedCombatAttributes(monsterPed, 46, true)

            TaskSetBlockingOfNonTemporaryEvents(monsterPed, true)
            SetEntityVisible(monsterPed, true, false)
            SetEntityCollision(monsterPed, true, true)

            if Config.QuadrupedModels[modelName] then
                -- Dog ped: its peds.meta already declares the rottweiler
                -- clip dictionary as the default MovementClipSet, so we
                -- just make sure it's streamed in rather than forcing
                -- the humanoid clipset on top of a quadruped skeleton.
                RequestAnimDict(Config.DogMovementClipSet)
                local dogAnimTimeout = 0
                while not HasAnimDictLoaded(Config.DogMovementClipSet) and dogAnimTimeout < 100 do
                    Wait(10)
                    dogAnimTimeout = dogAnimTimeout + 1
                end
                if not HasAnimDictLoaded(Config.DogMovementClipSet) then
                    print('[HORROR WARNING] Dog movement dict failed to load: ' .. Config.DogMovementClipSet)
                end
            else
                RequestAnimSet(Config.MonsterWalkStyle)
                local animTimeout = 0
                while not HasAnimSetLoaded(Config.MonsterWalkStyle) and animTimeout < 100 do
                    Wait(10)
                    animTimeout = animTimeout + 1
                end
                if HasAnimSetLoaded(Config.MonsterWalkStyle) then
                    SetPedMovementClipset(monsterPed, Config.MonsterWalkStyle, 1.0)
                else
                    print('[HORROR WARNING] Movement clipset failed to load: ' .. Config.MonsterWalkStyle)
                end
            end

            SetModelAsNoLongerNeeded(modelHash)
            if callback then callback(true) end
        else
            print('[HORROR ERROR] CreatePed returned an invalid entity for model: ' .. modelName)
            SetModelAsNoLongerNeeded(modelHash)
            if callback then callback(false) end
        end
    end)
end

local function CanMonsterSeePlayer(monster, player)
    local mCoords = GetEntityCoords(monster)
    local pCoords = GetEntityCoords(player)

    if math.abs(pCoords.z - mCoords.z) > 3.0 then return false end

    local dist = #(pCoords - mCoords)
    if dist > 18.0 then return false end

    local hearRadius = IsPedSprinting(player) and 8.0 or 3.0
    local isWithinHearing = dist <= hearRadius

    if not isWithinHearing then
        local fwd = GetEntityForwardVector(monster)
        local dir = (pCoords - mCoords)
        local len = #dir
        if len > 0 then dir = dir / len end

        local dot = (fwd.x * dir.x) + (fwd.y * dir.y) + (fwd.z * dir.z)
        if dot < 0.64 then return false end
    end

    return HasEntityClearLosToEntity(monster, player, 17)
end

local function IsFlashlightAimedAtMonster(playerPed, monster)
    if flashlightBattery <= 0 then return false end

    if GetSelectedPedWeapon(playerPed) ~= GetHashKey("WEAPON_FLASHLIGHT") then return false end
    if not (IsPlayerFreeAiming(PlayerId()) or IsControlPressed(0, 25)) then return false end

    local pCoords = GetEntityCoords(playerPed)
    local mCoords = GetEntityCoords(monster)

    if math.abs(pCoords.z - mCoords.z) > 3.0 then return false end

    local dist = #(pCoords - mCoords)
    if dist > 12.0 then return false end

    local camCoords = GetGameplayCamCoord()
    local camRot = GetGameplayCamRot(2)
    local rotRadZ = math.rad(camRot.z)
    local rotRadX = math.rad(camRot.x)
    local camForward = vector3(-math.sin(rotRadZ) * math.abs(math.cos(rotRadX)), math.cos(rotRadZ) * math.abs(math.cos(rotRadX)), math.sin(rotRadX))

    local toMonster = vector3(mCoords.x - camCoords.x, mCoords.y - camCoords.y, mCoords.z - camCoords.z)
    local len = #toMonster
    if len > 0 then
        toMonster = toMonster / len
    end

    local dot = camForward.x * toMonster.x + camForward.y * toMonster.y + camForward.z * toMonster.z
    if dot > Config.FlashlightLoseAimDot then
        return HasEntityClearLosToEntity(playerPed, monster, 17)
    end
    return false
end

local function GetCurrentChaseSpeed()
    if chaseStartTime == 0 then return Config.MonsterChaseSpeed end
    local elapsedSec = (GetGameTimer() - chaseStartTime) / 1000.0
    local t = math.min(1.0, elapsedSec / Config.SpeedRampSeconds)
    return Config.MonsterChaseSpeed + (Config.MonsterMaxChaseSpeed - Config.MonsterChaseSpeed) * t
end

local function TriggerFaceScare(monster, playerPed)
    ClearPedTasksImmediately(monster)

    local pCoords = GetEntityCoords(playerPed)
    TaskTurnPedToFaceCoord(monster, pCoords.x, pCoords.y, pCoords.z, 0)
    Wait(20)

    local headBone = GetPedBoneIndex(monster, 31086)
    local headPos = GetWorldPositionOfEntityBone(monster, headBone)
    local fwd = GetEntityForwardVector(monster)

    local camPos = headPos + (fwd * 0.25)

    local scareCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(scareCam, camPos.x, camPos.y, camPos.z)
    PointCamAtCoord(scareCam, headPos.x, headPos.y, headPos.z)

    SetCamFov(scareCam, 130.0)
    SetCamActive(scareCam, true)
    RenderScriptCams(true, false, 0, true, false)

    ShakeCam(scareCam, "LARGE_EXPLOSION_SHAKE", 2.5)

    SendNUIMessage({ action = "playSound", soundId = "jumpscare", volume = 0.35 })
    AnimpostfxPlay("DeathFailOut", 0, false)

    local endTime = GetGameTimer() + 300
    while GetGameTimer() < endTime do
        DrawLightWithRange(camPos.x, camPos.y, camPos.z, 255, 255, 255, 5.0, 50.0)
        Wait(0)
    end

    DoScreenFadeOut(0)
    Wait(50)

    RenderScriptCams(false, false, 0, true, false)
    DestroyCam(scareCam, false)
end

function StartStalkerAI()
    CreateThread(function()
        local shaking = false
        local isStunned = false
        local tazerImmunity = 0
        aiState = "PATROL"
        currentPatrolTarget = nil

        while isEventActive and DoesEntityExist(monsterPed) do
            local playerPed = PlayerPedId()
            local pCoords = GetEntityCoords(playerPed)
            local mCoords = GetEntityCoords(monsterPed)

            local zDiff = math.abs(pCoords.z - mCoords.z)
            local dist3d = #(pCoords - mCoords)

            local canSee = CanMonsterSeePlayer(monsterPed, playerPed)
            local isLightAimed = IsFlashlightAimedAtMonster(playerPed, monsterPed)

            if GetEntityHealth(monsterPed) < 9000 then
                SetEntityHealth(monsterPed, 9999)
            end

            if not isStunned and GetGameTimer() > tazerImmunity and HasEntityBeenDamagedByWeapon(monsterPed, GetHashKey("WEAPON_STUNGUN"), 0) then
                isStunned = true
                tazerImmunity = GetGameTimer() + 8000
                ClearEntityLastWeaponDamage(monsterPed)

                -- Re-assert full silence the instant the shock lands.
                SilenceMonsterPed(monsterPed)

                aiState = "PATROL"
                currentPatrolTarget = nil

                ShowNotification("It vanished in the flash...", 3000)

                -- Aggressively cut any vocal audio for the whole stun window.
                CreateThread(function()
                    local silenceEnd = GetGameTimer() + 3000
                    while GetGameTimer() < silenceEnd do
                        if DoesEntityExist(monsterPed) then
                            StopCurrentPlayingAmbientSpeech(monsterPed)
                            StopCurrentPlayingSpeech(monsterPed)
                        end
                        Wait(0)
                    end
                end)

                CreateThread(function()
                    Wait(2500)
                    if DoesEntityExist(monsterPed) then DeleteEntity(monsterPed) end
                    monsterPed = nil

                    Wait(3000)
                    if isEventActive then
                        -- Fresh random zombie variant on every respawn.
                        CreateMonster(function(success)
                            if success then
                                local randomSpawn = Config.MonsterSpawnPoints[math.random(#Config.MonsterSpawnPoints)]
                                SetEntityCoords(monsterPed, randomSpawn.coords.x, randomSpawn.coords.y, randomSpawn.coords.z, false, false, false, true)
                                SetEntityHeading(monsterPed, randomSpawn.heading)
                                StartStalkerAI()
                            else
                                ShowNotification("The monster failed to return - ending event.", 5000)
                                EndHorrorEvent(false)
                            end
                        end)
                    end
                end)
                break

            elseif not isStunned and zDiff < 3.0 and dist3d < 1.3 then
                timesCaught = timesCaught + 1
                TriggerFaceScare(monsterPed, playerPed)

                if timesCaught >= Config.MaxCatches then
                    StopGameplayCamShaking(true)
                    AnimpostfxStopAll()
                    focusInActive = false
                    SendNUIMessage({ action = "stopAll" })
                    TriggerServerEvent('horror:playerCaught')
                    EndHorrorEvent(false)
                    break
                else
                    DoScreenFadeOut(0)
                    AnimpostfxStopAll()
                    focusInActive = false

                    if not panelRepaired and fusesCollected > 0 then
                        fusesCollected = fusesCollected - 1
                        ShowNotification("You were dragged into the dark and lost a collected fuse! (" .. fusesCollected .. "/" .. totalFusesRequired .. ")", 5000)
                    else
                        ShowNotification(("It dragged you into the dark... (%d/%d)"):format(timesCaught, Config.MaxCatches), 4000)
                    end

                    Wait(2000)
                    local randomRespawn = Config.PlayerRespawnPoints[math.random(#Config.PlayerRespawnPoints)]
                    SetEntityCoords(playerPed, randomRespawn.coords.x, randomRespawn.coords.y, randomRespawn.coords.z, false, false, false, true)
                    SetEntityHeading(playerPed, randomRespawn.heading)
                    SetPedToRagdoll(playerPed, 2000, 2000, 0, false, false, false)

                    if flashlightBattery > 0 then
                        SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_FLASHLIGHT"), true)
                    end

                    local randomSpawn = Config.MonsterSpawnPoints[math.random(#Config.MonsterSpawnPoints)]
                    SetEntityCoords(monsterPed, randomSpawn.coords.x, randomSpawn.coords.y, randomSpawn.coords.z, false, false, false, true)
                    SetEntityHeading(monsterPed, randomSpawn.heading)

                    aiState = "PATROL"
                    currentPatrolTarget = nil

                    Wait(1000)
                    DoScreenFadeIn(1500)
                end

            elseif not isStunned then
                if canSee or isLightAimed then
                    if aiState ~= "CHASE" then
                        SendNUIMessage({ action = "playSound", soundId = "screech", volume = 0.5 })
                    end
                    aiState = "CHASE"
                    lastSeenTime = GetGameTimer()
                    lastSeenCoords = pCoords
                end

                if aiState == "CHASE" then
                    if isLightAimed then
                        ClearPedTasks(monsterPed)
                        SetPedMoveRateOverride(monsterPed, 0.0)
                    else
                        TaskGoToEntity(monsterPed, playerPed, -1, 1.0, 2.0, 1073741824, 0)
                        SetPedMoveRateOverride(monsterPed, GetCurrentChaseSpeed())
                    end

                    if not canSee and not isLightAimed and (GetGameTimer() - lastSeenTime > 4000) then
                        aiState = "SEARCH"
                        TaskGoToCoordAnyMeans(monsterPed, lastSeenCoords.x, lastSeenCoords.y, lastSeenCoords.z, Config.MonsterChaseSpeed, 0, 0, 786603, 0)
                    end

                elseif aiState == "SEARCH" then
                    SetPedMoveRateOverride(monsterPed, Config.MonsterChaseSpeed)

                    if #(mCoords - lastSeenCoords) < 1.5 or (GetGameTimer() - lastSeenTime > 14000) then
                        aiState = "PATROL"
                        currentPatrolTarget = nil
                    end

                elseif aiState == "PATROL" then
                    if not currentPatrolTarget or #(mCoords - currentPatrolTarget) < 1.5 then
                        currentPatrolTarget = GetRandomPatrolNode()
                        TaskGoToCoordAnyMeans(monsterPed, currentPatrolTarget.x, currentPatrolTarget.y, currentPatrolTarget.z, Config.MonsterPatrolSpeed, 0, 0, 786603, 0)
                    end
                    SetPedMoveRateOverride(monsterPed, Config.MonsterPatrolSpeed)
                end
            end

            if zDiff < 3.0 and dist3d < 12.0 and dist3d >= 1.2 then
                ShakeGameplayCam("VIBRATE_SHAKE", ((12.0 - dist3d) / 12.0) * 2.0)
                shaking = true
            elseif shaking then
                StopGameplayCamShaking(true)
                shaking = false
            end

            Wait(100)
        end
    end)
end

-- ============================================================
-- CLUE / FUSE PROPS
-- ============================================================

function SpawnClueProps()
    local modelHash = GetHashKey(Config.FuseProp)

    if not IsModelValid(modelHash) then
        print('[HORROR ERROR] Fuse prop model is not valid: ' .. Config.FuseProp)
        return
    end

    RequestModel(modelHash)
    local timeout = 0
    while not HasModelLoaded(modelHash) and timeout < 100 do
        Wait(50)
        timeout = timeout + 1
    end
    if not HasModelLoaded(modelHash) then
        print('[HORROR ERROR] Failed to load fuse prop model: ' .. Config.FuseProp)
        return
    end

    for i, pos in ipairs(activeFuseCoords) do
        local obj = CreateObject(modelHash, pos.x, pos.y, pos.z + 0.05, false, false, false)
        if DoesEntityExist(obj) then
            SetEntityAsMissionEntity(obj, true, true)
            FreezeEntityPosition(obj, true)
            SetEntityCollision(obj, false, false)
            SetEntityAlpha(obj, realFuseIndices[i] and 255 or 190, false)
            clueObjects[i] = obj
        end
    end

    SetModelAsNoLongerNeeded(modelHash)
    StartCluePropAnimationLoop()
end

function StartCluePropAnimationLoop()
    CreateThread(function()
        local rot = 0.0
        local pulse = 0.0
        while isEventActive and next(clueObjects) ~= nil do
            rot = (rot + 1.5) % 360.0
            pulse = (pulse + 4.0) % 360.0

            for i, obj in pairs(clueObjects) do
                if DoesEntityExist(obj) then
                    local oCoords = GetEntityCoords(obj)
                    SetEntityRotation(obj, 0.0, 0.0, rot, 2, true)

                    if realFuseIndices[i] then
                        local pulseFactor = 0.6 + (math.sin(math.rad(pulse)) + 1.0) * 0.35
                        DrawLightWithRange(oCoords.x, oCoords.y, oCoords.z + 0.15, 255, 220, 120, 3.0 * pulseFactor, 2.2 * pulseFactor)
                    else
                        DrawLightWithRange(oCoords.x, oCoords.y, oCoords.z, 120, 160, 180, 1.6, 0.8)
                    end
                end
            end
            Wait(0)
        end
    end)
end

function CleanupClueProps()
    for i, obj in pairs(clueObjects) do
        if DoesEntityExist(obj) then
            DeleteEntity(obj)
        end
        clueObjects[i] = nil
    end
end

-- ============================================================
-- OBJECTIVE LOOP (clues + control panel + exits)
-- ============================================================

function StartObjectiveLoop()
    CreateThread(function()
        while isEventActive do
            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)

            for i, cluePos in ipairs(activeFuseCoords) do
                local dist = #(coords - cluePos)
                if dist < 2.0 and clueObjects[i] then
                    if realFuseIndices[i] then
                        BeginTextCommandDisplayHelp("STRING")
                        AddTextComponentSubstringPlayerName("Press ~INPUT_CONTEXT~ to pick up the Fuse")
                        EndTextCommandDisplayHelp(0, false, true, -1)

                        if IsControlJustReleased(0, 38) then
                            fusesCollected = fusesCollected + 1
                            if DoesEntityExist(clueObjects[i]) then
                                DeleteEntity(clueObjects[i])
                            end
                            clueObjects[i] = nil

                            ShowNotification(("Collected fuse! (%d/%d)"):format(fusesCollected, totalFusesRequired), 5000)
                            PlaySoundFrontend(-1, "CHALLENGE_UNLOCKED", "HUD_AWARDS_SOUNDSET", true)
                        end
                    else
                        BeginTextCommandDisplayHelp("STRING")
                        AddTextComponentSubstringPlayerName("Press ~INPUT_CONTEXT~ to search")
                        EndTextCommandDisplayHelp(0, false, true, -1)

                        if IsControlJustReleased(0, 38) then
                            PlaySoundFrontend(-1, "OOB_Cancel", "GTAO_FM_Events_Soundset", true)
                            ShowNotification("Just junk... This is a decoy.", 2500)

                            playerStamina = math.max(0, playerStamina - Config.DecoyStaminaPenalty)
                            ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.6)
                        end
                    end
                end
            end

            local panelDist = #(coords - Config.ControlPanel)
            if panelDist < 8.0 then
                DrawMarker(1, Config.ControlPanel.x, Config.ControlPanel.y, Config.ControlPanel.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.2, 1.2, 0.8, 0, 150, 255, 60, false, true, 2, false, nil, nil, false)

                if panelDist < 2.0 then
                    if not panelRepaired then
                        BeginTextCommandDisplayHelp("STRING")
                        AddTextComponentSubstringPlayerName("Press ~INPUT_CONTEXT~ to Repair Control Panel")
                        EndTextCommandDisplayHelp(0, false, true, -1)

                        if IsControlJustReleased(0, 38) then
                            if fusesCollected >= totalFusesRequired then
                                ShowNotification("Repairing control panel...", 10000)

                                local fixingDict = Config.RepairAnimDict
                                local fixingAnim = Config.RepairAnimName

                                RequestAnimDict(fixingDict)
                                local animTimeout = 0
                                while not HasAnimDictLoaded(fixingDict) and animTimeout < 50 do
                                    Wait(50)
                                    animTimeout = animTimeout + 1
                                end

                                local repairStart = GetGameTimer()
                                local repairSuccess = true

                                if HasAnimDictLoaded(fixingDict) then
                                    FreezeEntityPosition(playerPed, true)
                                    TaskPlayAnim(playerPed, fixingDict, fixingAnim, 8.0, -8.0, -1, 1, 0, false, false, false)
                                else
                                    -- Animation failed to stream, but the repair
                                    -- still proceeds so the event can't dead-end.
                                    print('[HORROR WARNING] Repair anim dict failed to load: ' .. fixingDict)
                                    FreezeEntityPosition(playerPed, true)
                                end

                                while GetGameTimer() - repairStart < 10000 do
                                    FreezeEntityPosition(playerPed, true)
                                    DisableControlAction(0, 30, true) -- Move Left/Right
                                    DisableControlAction(0, 31, true) -- Move Up/Down
                                    DisableControlAction(0, 21, true) -- Sprint
                                    DisableControlAction(0, 24, true) -- Attack
                                    DisableControlAction(0, 25, true) -- Aim

                                    Wait(0)
                                    if not isEventActive then
                                        repairSuccess = false
                                        break
                                    end
                                end

                                ClearPedTasks(playerPed)
                                FreezeEntityPosition(playerPed, false)
                                RemoveAnimDict(fixingDict)

                                if repairSuccess and isEventActive then
                                    panelRepaired = true
                                    ShowNotification("Control panel repaired! Find the exit within 3 minutes!", 6000)
                                    PlaySoundFrontend(-1, "HACKING_SUCCESS", "HUD_AWARDS_SOUNDSET", true)
                                    StartEscapeTimerLoop()
                                end
                            else
                                ShowNotification(("You need %d more fuse(s) before repairing!"):format(totalFusesRequired - fusesCollected), 3000)
                                PlaySoundFrontend(-1, "OOB_Cancel", "GTAO_FM_Events_Soundset", true)
                            end
                        end
                    end
                end
            end

            for i, exitData in ipairs(Config.ExitPoints) do
                local exitPos = exitData.coords
                local distance = #(coords - exitPos)

                if distance < 8.0 then
                    if panelRepaired and i == actualRealExitIndex then
                        DrawMarker(1, exitPos.x, exitPos.y, exitPos.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.2, 1.2, 0.8, 0, 255, 0, 60, false, true, 2, false, nil, nil, false)
                    else
                        DrawMarker(1, exitPos.x, exitPos.y, exitPos.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.2, 1.2, 0.8, 255, 0, 0, 60, false, true, 2, false, nil, nil, false)
                    end

                    if distance < 2.0 then
                        BeginTextCommandDisplayHelp("STRING")
                        AddTextComponentSubstringPlayerName("Press ~INPUT_CONTEXT~ to try the Exit")
                        EndTextCommandDisplayHelp(0, false, true, -1)

                        if IsControlJustReleased(0, 38) and exitCooldown <= 0 then
                            exitCooldown = Config.ExitCooldownMs

                            if i == actualRealExitIndex then
                                if panelRepaired then
                                    ShowNotification("You escaped successfully!", 5000)
                                    EndHorrorEvent(true)
                                    break
                                else
                                    ShowNotification("The control panel is offline! Repair it first.", 3000)
                                end
                            else
                                ShowNotification("It's a dead end! The door slams shut...", 3000)
                                PlaySoundFrontend(-1, "OOB_Cancel", "GTAO_FM_Events_Soundset", true)

                                DoScreenFadeOut(200)
                                Wait(500)

                                local randomOtherExit = Config.ExitPoints[math.random(#Config.ExitPoints)].coords
                                while randomOtherExit == exitPos do
                                    randomOtherExit = Config.ExitPoints[math.random(#Config.ExitPoints)].coords
                                end

                                SetEntityCoords(playerPed, randomOtherExit.x, randomOtherExit.y, randomOtherExit.z, false, false, false, true)
                                Wait(500)
                                DoScreenFadeIn(500)
                            end
                        end
                    end
                end
            end

            Wait(0)
        end
    end)
end

-- ============================================================
-- EVENT END / CLEANUP
-- ============================================================

function EndHorrorEvent(escaped, silent)
    isEventActive = false
    panelRepaired = false
    local playerPed = PlayerPedId()

    SetFollowPedCamViewMode(previousCamMode)
    RemoveWeaponFromPed(playerPed, GetHashKey("WEAPON_FLASHLIGHT"))
    RemoveWeaponFromPed(playerPed, GetHashKey("WEAPON_STUNGUN"))

    ClearTimecycleModifier()
    SetBlackout(false)
    NetworkClearClockTimeOverride()
    StopGameplayCamShaking(true)

    AnimpostfxStopAll()
    focusInActive = false
    SendNUIMessage({ action = "stopAll" })

    RenderScriptCams(false, false, 0, true, false)

    if DoesEntityExist(monsterPed) then
        FreezeEntityPosition(monsterPed, false)
        DeleteEntity(monsterPed)
        monsterPed = nil
    end

    CleanupClueProps()
    chaseStartTime = 0

    if not silent then
        DoScreenFadeOut(500)
        Wait(500)

        ClearFocus()
        SetEntityCoords(playerPed, Config.EntranceCoords.x, Config.EntranceCoords.y, Config.EntranceCoords.z, false, false, false, true)
        DoScreenFadeIn(500)

        if escaped then
            ShowNotification("You escaped! Caught " .. timesCaught .. " time(s) along the way.", 6000)
        elseif timesCaught >= Config.MaxCatches then
            ShowNotification("The monster consumed you...", 6000)
        else
            ShowNotification("You were caught by the monster!", 5000)
        end
    end
end

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    if isEventActive then
        EndHorrorEvent(false, true)
    end
    CleanupClueProps()
end)

-- ============================================================
-- WORLD BLIP
-- ============================================================

CreateThread(function()
    local blip = AddBlipForCoord(Config.EntranceCoords.x, Config.EntranceCoords.y, Config.EntranceCoords.z)
    SetBlipSprite(blip, 432)
    SetBlipColour(blip, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Horror Event Entrance")
    EndTextCommandSetBlipName(blip)
end)