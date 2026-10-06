local Config = {
    EntranceCoords  = vector3(239.2164, -1381.2512, 33.7417),
    EntranceHeading = 320.6462,
    InteriorLoadCoords   = vector3(244.9, -1374.7, 39.5),
    InteriorSpawnCoords  = vector3(245.3582, -1374.1821, 39.5344),
    InteriorHeading      = 306.9981,

    MonsterModels = {
        'u_m_y_zombie_01',
        'u_m_y_zombie_02',
        'u_m_y_zombie_03',
        'u_m_y_zombie_04',
        'u_m_y_zombie_05',
    },

    QuadrupedModels = {
        u_m_y_zombie_04 = true,
        u_m_y_zombie_05 = true
    },
    DogMovementClipSet = nil,

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
    FusePropCount = 5,
    MinFusesRequired = 1,
    MaxFusesRequired = 5,

    RepairAnimDict = 'mini@repair',
    RepairAnimName = 'fixing_a_player',
    RepairSeconds  = 10,

    MaxCatches             = 5,
    CatchDistance          = 1.5,
    HeadStartSeconds       = 10,
    EscapeTimeSeconds      = 180,
    FlashlightDrainRate    = 0.05,
    StaminaDrainRate       = 1.0,
    StaminaRegenRate       = 0.8,
    ExhaustedRecoverAt     = 30.0,

    MonsterPatrolSpeed     = 0.65,
    MonsterChaseSpeed      = 0.90,
    MonsterMaxChaseSpeed   = 1.02,
    SpeedRampSeconds       = 90,
    PatrolNodeTimeoutMs    = 25000,
    MonsterRespawnMinDist  = 20.0,

    StunCooldownMs         = 20000,

    ExitCooldownMs         = 3000,
    FlashlightLoseAimDot   = 0.70,

    JumpscareTriggerDist   = 3.2,
    JumpscareCooldownMs    = 15000,
    DecoyStaminaPenalty    = 8.0,

    Jumpscare = {
        Volume            = 0.75,
        SilenceMs         = 0,
        SoundMaxMs        = 2400,
        LungeMs           = 120,
        HoldMs            = 600,
        Strobe            = true,
        PadRumble         = true,
        DoubleScareChance = 0.35,
        DoubleScareMs     = 140,
    },

    Hunter = {
        SightRangeDark    = 9.0,
        SightRangeLit     = 28.0,
        CrouchSightMult   = 0.55,
        SightDot          = 0.45,
        CloseSenseDist    = 2.0,
        NoticeMs          = 450,

        HearSprint        = 16.0,
        HearRun           = 9.0,
        HearWalk          = 4.5,
        HearCrouch        = 1.2,
        HearThroughWalls  = 0.55,

        NoiseDecoy        = 14.0,
        NoiseFuse         = 5.0,
        NoiseDoorSlam     = 24.0,
        NoiseRepair       = 18.0,

        InvestigateLookMs = 5000,
        SearchDurationMs  = 25000,
        SearchRadius      = 14.0,
        CheckHidingChance = 0.45,
        LoseSightMs       = 3500,
        SawYouHideMs      = 1500,

        HitRecoverMs      = 2600,
    },

    CatchMode = "drag",
    CatchGraceMs = 7000,

    HidingSpots = {
    },

    NightVision = {
        Enabled    = true,
        DrainRate  = 0.10,
    },

    Cinematic = {
        FOV           = 38.0,
        HandheldShake = 0.25,
    },

    MaxDistanceFromMorgue  = 150.0,

    ShowContentWarning     = true,
    PlayIntroCutscene      = true,
    CutsceneRevealsExit    = true,
    AllowCutsceneSkip      = true,
    CutsceneShotSeconds    = 3.5,
    CutsceneFOV            = 45.0,

    ModelLoadTimeoutMs     = 8000,
}

local WEAPON_FLASHLIGHT = GetHashKey("WEAPON_FLASHLIGHT")
local WEAPON_STUNGUN    = GetHashKey("WEAPON_STUNGUN")
local WEAPON_UNARMED    = GetHashKey("WEAPON_UNARMED")
local TASK_GO_TO_ENTITY = GetHashKey("SCRIPT_TASK_GO_TO_ENTITY")
local TASK_GO_TO_COORD  = GetHashKey("SCRIPT_TASK_GO_TO_COORD_ANY_MEANS")
local TASK_NAVMESH      = GetHashKey("SCRIPT_TASK_FOLLOW_NAV_MESH_TO_COORD")

local isEventActive = false
local eventSession = 0
local warningOpen = false
local monsterPed = nil
local countdownTimer = 5
local timesCaught = 0
local previousCamMode = 0

local flashlightBattery = 100.0
local playerStamina = 100.0
local playerExhausted = false
local actualRealExitIndex = 1
local exitCooldown = 0

local activeNotification = { text = "", time = 0 }
local clueObjects = {}
local activeFuseCoords = {}
local realFuseIndices = {}
local collectedFuseStack = {}
local totalFusesRequired = 1
local fusesCollected = 0
local panelRepaired = false
local escapeTimerSeconds = 0

local chaseStartTime = 0
local lastJumpscareTime = 0
local nextStunAllowed = 0
local focusInActive = false
local heartbeatPlaying = false
local monsterMoveRate = 1.0

local cutsceneActive = false
local cutsceneSkipped = false

local aiState = "PATROL"
local monsterInPlayerView = false
local playerHidden = false
local hiddenSpot = nil
local hiddenAt = 0
local nightVisionOn = false
local lastNoise = { pos = vector3(0.0, 0.0, 0.0), radius = 0.0, time = 0 }
local lastSawPlayerAt = 0
local lastSeenPos = nil
local catchGraceUntil = 0
local stalkCooldownUntil = 0
local ambientStarted = false
local lastSeenTime = 0
local lastSeenCoords = nil
local currentPatrolTarget = nil

local selectedMonsterModelName = nil
local monsterIsQuadruped = false
local brokenModels = {}

local hadFlashlight = false
local hadStungun = false
local pinnedInterior = nil
local extraPinned = {}

local function IsSessionActive(token)
    return isEventActive and token == eventSession
end

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

local function ShowHelp(text)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

local function FloorAwareDist(a, b)
    if math.abs(a.z - b.z) > 3.0 then return 999.0 end
    return #(vector2(a.x, a.y) - vector2(b.x, b.y))
end

local function GetPointAwayFrom(points, from, minDist)
    local candidates = {}
    local furthest, furthestDist = points[1], -1.0
    for _, p in ipairs(points) do
        local d = FloorAwareDist(p.coords, from)
        if d >= minDist then table.insert(candidates, p) end
        if d > furthestDist then furthest, furthestDist = p, d end
    end
    if #candidates > 0 then
        return candidates[math.random(#candidates)]
    end
    return furthest
end

local function SafeTeleport(ped, coords, heading)
    local x, y, z = coords.x, coords.y, coords.z
    local isPlayer = (ped == PlayerPedId())

    local interior = GetInteriorAtCoords(x, y, z + 1.0)
    if interior ~= 0 then
        if interior ~= pinnedInterior and not extraPinned[interior] then
            PinInteriorInMemory(interior)
            extraPinned[interior] = true
        end
        local t = 0
        while not IsInteriorReady(interior) and t < 40 do Wait(25) t = t + 1 end
    end

    FreezeEntityPosition(ped, true)
    RequestCollisionAtCoord(x, y, z)
    SetEntityCoordsNoOffset(ped, x, y, z + 1.0, false, false, false)
    if heading then SetEntityHeading(ped, heading) end

    local waited = 0
    while not HasCollisionLoadedAroundEntity(ped) and waited < 1500 do
        RequestCollisionAtCoord(x, y, z)
        Wait(50)
        waited = waited + 50
    end

    local found, groundZ = GetGroundZFor_3dCoord(x, y, z + 1.2, false)
    if found and math.abs(groundZ - z) < 2.5 then
        z = groundZ
    end
    SetEntityCoordsNoOffset(ped, x, y, z + 1.0, false, false, false)
    if heading then SetEntityHeading(ped, heading) end
    FreezeEntityPosition(ped, false)

    local synced = false
    for _ = 1, 40 do
        Wait(0)
        local int = GetInteriorFromEntity(ped)
        if int == 0 then int = interior end
        local room = GetRoomKeyFromEntity(ped)
        if int ~= 0 and room ~= 0 then
            ForceRoomForEntity(ped, int, room)
            if isPlayer then
                ForceRoomForGameViewport(int, room)
            end
            synced = true
            break
        end
    end

    if isPlayer then
        print(('[HORROR] teleport to %.1f, %.1f, %.1f | interior %d | room %d | synced %s'):format(
            x, y, z, GetInteriorFromEntity(ped), GetRoomKeyFromEntity(ped), tostring(synced)))
        SetGameplayCamRelativeHeading(0.0)
        SetGameplayCamRelativePitch(0.0, 1.0)
        if not synced and interior ~= 0 then
            RefreshInterior(interior)
        end
    end
end

local function GetCamForward()
    local rot = GetGameplayCamRot(2)
    local rz, rx = math.rad(rot.z), math.rad(rot.x)
    local c = math.abs(math.cos(rx))
    return vector3(-math.sin(rz) * c, math.cos(rz) * c, math.sin(rx))
end

local function ClearDistanceTo(from, to, ignoreEntity)
    local handle = StartExpensiveSynchronousShapeTestLosProbe(from.x, from.y, from.z, to.x, to.y, to.z, 17, ignoreEntity or 0, 7)
    local _, hit, endCoords = GetShapeTestResult(handle)
    if hit == true or hit == 1 then
        return #(endCoords - from)
    end
    return #(to - from)
end

local function GetMonsterFace(monster)
    local headBone = GetPedBoneIndex(monster, 31086)
    if headBone and headBone ~= -1 then
        return GetWorldPositionOfEntityBone(monster, headBone)
    end
    return GetEntityCoords(monster) + vector3(0.0, 0.0, 0.6)
end

local function AimCam(cam, from, to, roll)
    local d = to - from
    local flat = math.sqrt(d.x * d.x + d.y * d.y)
    local pitch = math.deg(math.atan(d.z, flat))
    local yaw = GetHeadingFromVector_2d(d.x, d.y)
    SetCamRot(cam, pitch, roll, yaw, 2)
end

-- ============================================================
-- HUD
-- ============================================================
CreateThread(function()
    while true do
        local sleep = 500
        local showNote = GetGameTimer() < activeNotification.time

        if isEventActive or showNote then
            sleep = 0

            if showNote then
                DrawScaledText(0.5, 0.15, 0.55, activeNotification.text, 255, 255, 255, 255)
            end

            if isEventActive and not cutsceneActive then
                local objective
                if not panelRepaired then
                    objective = string.format("Fuses: ~y~%d / %d~s~", fusesCollected, totalFusesRequired)
                else
                    local mins = math.floor(escapeTimerSeconds / 60)
                    local secs = math.floor(escapeTimerSeconds % 60)
                    objective = string.format("~r~Escape: %02d:%02d~s~", mins, secs)
                end
                DrawScaledText(0.75, 0.900, 0.38, objective .. string.format("  |  Caught: %d / %d", timesCaught, Config.MaxCatches), 220, 220, 220, 255, 0)

                local staminaCol = playerExhausted and "~r~" or (playerStamina < 40 and "~o~" or "~s~")
                local batteryCol = flashlightBattery < 20 and "~r~" or "~s~"
                local status = string.format("Battery: %s%d%%~s~  |  Stamina: %s%d%%~s~  |  ~b~[TAB]~s~ Swap Tool  |  ~b~[N]~s~ Night Vision  |  ~b~[CTRL]~s~ Crouch",
                    batteryCol, math.floor(flashlightBattery), staminaCol, math.floor(playerStamina))
                DrawScaledText(0.75, 0.930, 0.35, status, 200, 200, 200, 255, 0)
            end
        end
        Wait(sleep)
    end
end)

CreateThread(function()
    RequestIpl("Coroner_Int_on")
end)

-- ============================================================
-- CONTENT WARNING (NUI)
-- ============================================================
local pendingWarningCallback = nil

local function ResolveWarning(accepted)
    if not warningOpen then return end
    warningOpen = false

    SetNuiFocus(false, false)
    SendNUIMessage({ action = "hideWarning" })
    TriggerScreenblurFadeOut(400)
    FreezeEntityPosition(PlayerPedId(), false)
    DisplayRadar(true)

    local callback = pendingWarningCallback
    pendingWarningCallback = nil
    if callback then callback(accepted) end
end

RegisterNUICallback('warningResult', function(data, cb)
    cb({})
    ResolveWarning(data and data.accepted == true)
end)

function ShowContentWarningPrompt(onResult)
    if warningOpen then return end
    if not Config.ShowContentWarning then
        onResult(true)
        return
    end

    warningOpen = true
    pendingWarningCallback = onResult
    FreezeEntityPosition(PlayerPedId(), true)
    DisplayRadar(false)
    TriggerScreenblurFadeIn(400)

    SendNUIMessage({ action = "showWarning" })
    SetNuiFocus(true, true)
end

local function RequestStartHorrorEvent()
    if isEventActive or warningOpen then return end

    local ped = PlayerPedId()
    if IsEntityDead(ped) then return end
    if IsPedInAnyVehicle(ped, false) then
        ShowNotification("Leave your vehicle first.", 3000)
        return
    end

    ShowContentWarningPrompt(function(accepted)
        if accepted then
            CreateThread(StartHorrorEvent)
        end
    end)
end

RegisterCommand('startHorror', function()
    RequestStartHorrorEvent()
end, false)

RegisterCommand('stopHorror', function()
    if isEventActive then
        CreateThread(function()
            EndHorrorEvent(false, false, "You fled the morgue.")
        end)
    end
end, false)

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
                    ShowHelp("Press ~INPUT_CONTEXT~ to enter the Horror Event")

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

local function Cine(action, data)
    data = data or {}
    data.action = action
    SendNUIMessage(data)
end

local function FindOpenAngle(origin, wantDist, ignoreEntity)
    local good, bestAng, bestFree = {}, 0.0, 0.0
    for i = 0, 23 do
        local ang = i * 15.0
        local rad = math.rad(ang)
        local probe = origin + vector3(math.cos(rad), math.sin(rad), 0.0) * wantDist
        local free = ClearDistanceTo(origin, probe, ignoreEntity)
        if free >= wantDist * 0.95 then table.insert(good, ang) end
        if free > bestFree then bestAng, bestFree = ang, free end
    end
    if #good > 0 then
        return good[math.random(#good)], wantDist
    end
    return bestAng, bestFree
end

local function IsSkipPressed()
    if not Config.AllowCutsceneSkip then return false end
    DisableControlAction(0, 22, true)
    if IsDisabledControlJustPressed(0, 22) then
        cutsceneSkipped = true
    end
    return cutsceneSkipped
end

local function PrepareShotArea(playerPed, target)
    SetEntityCoordsNoOffset(playerPed, target.x, target.y, target.z + 1.0, false, false, false)
    SetFocusPosAndVel(target.x, target.y, target.z, 0.0, 0.0, 0.0)
    RequestCollisionAtCoord(target.x, target.y, target.z)

    local waited = 0
    while waited < 2000 and not HasCollisionLoadedAroundEntity(playerPed) do
        RequestCollisionAtCoord(target.x, target.y, target.z)
        Wait(50)
        waited = waited + 50
    end
    Wait(150)

    local interior = GetInteriorFromEntity(playerPed)
    if interior == 0 then interior = GetInteriorAtCoords(target.x, target.y, target.z + 1.0) end
    if interior ~= 0 then
        local room = GetRoomKeyFromEntity(playerPed)
        if room ~= 0 then
            ForceRoomForEntity(playerPed, interior, room)
        end
    end
end

local function SetupCinematicCam(focusDist)
    local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamFov(cam, Config.Cinematic.FOV)
    SetCamUseShallowDofMode(cam, true)
    SetCamNearDof(cam, 0.05)
    SetCamFarDof(cam, focusDist + 2.5)
    SetCamDofStrength(cam, 1.0)
    ShakeCam(cam, "HAND_SHAKE", Config.Cinematic.HandheldShake)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 0, true, false)
    return cam
end

local function PushInShot(opts)
    local lookAt = opts.lookAt
    local eye = vector3(opts.subject.x, opts.subject.y, opts.subject.z + opts.camHeight)
    local ang, free = FindOpenAngle(eye, opts.far + 0.4, opts.ignore)
    local far = math.max(opts.near + 0.3, math.min(opts.far, free - 0.4))
    local dir = vector3(math.cos(math.rad(ang)), math.sin(math.rad(ang)), 0.0)

    local cam = SetupCinematicCam(far)
    local start = GetGameTimer()
    local flickerOn, nextFlicker = true, 0

    while GetGameTimer() - start < opts.durationMs and isEventActive do
        local t = math.min(1.0, (GetGameTimer() - start) / opts.durationMs)
        local eased = 1.0 - (1.0 - t) * (1.0 - t)
        local dist = far + (opts.near - far) * eased
        local pos = eye + dir * dist

        SetCamCoord(cam, pos.x, pos.y, pos.z)
        PointCamAtCoord(cam, lookAt.x, lookAt.y, lookAt.z)
        SetCamFov(cam, (opts.fovFrom or Config.Cinematic.FOV) + ((opts.fovTo or Config.Cinematic.FOV) - (opts.fovFrom or Config.Cinematic.FOV)) * eased)
        SetCamFarDof(cam, #(pos - lookAt) + 2.0)
        SetUseHiDof()

        if opts.flicker then
            local now = GetGameTimer()
            if now >= nextFlicker then
                flickerOn = math.random() < 0.65
                nextFlicker = now + (flickerOn and math.random(60, 400) or math.random(40, 160))
            end
            if flickerOn then
                local lp = lookAt + dir * 1.2 + vector3(0.0, 0.0, 0.9)
                DrawLightWithRange(lp.x, lp.y, lp.z, 190, 205, 255, 4.5, 6.0)
            end
        end
        if opts.glow then
            DrawLightWithRange(lookAt.x, lookAt.y, lookAt.z + 0.25, 255, 210, 120, 2.5, 3.0)
        end

        if IsSkipPressed() then break end
        Wait(0)
    end
    return cam
end

local function ArcShot(opts)
    local lookAt = opts.lookAt
    local eye = vector3(opts.subject.x, opts.subject.y, opts.subject.z + opts.camHeight)
    local centre = FindOpenAngle(eye, opts.radius + 0.4, opts.ignore)

    local cam = SetupCinematicCam(opts.radius)
    local start = GetGameTimer()

    while GetGameTimer() - start < opts.durationMs and isEventActive do
        local t = math.min(1.0, (GetGameTimer() - start) / opts.durationMs)
        local eased = t * t * (3.0 - 2.0 * t)
        local ang = math.rad(centre - opts.sweep / 2.0 + opts.sweep * eased)
        local dir = vector3(math.cos(ang), math.sin(ang), 0.0)
        local free = ClearDistanceTo(eye, eye + dir * (opts.radius + 0.3), opts.ignore)
        local pos = eye + dir * math.max(0.4, math.min(opts.radius, free - 0.3))

        SetCamCoord(cam, pos.x, pos.y, pos.z)
        PointCamAtCoord(cam, lookAt.x, lookAt.y, lookAt.z)
        SetCamFarDof(cam, #(pos - lookAt) + 1.5)
        SetUseHiDof()

        if opts.glow then
            DrawLightWithRange(lookAt.x, lookAt.y, lookAt.z + 0.25, 255, 210, 120, 2.5, 3.0)
        end

        if IsSkipPressed() then break end
        Wait(0)
    end
    return cam
end

local function HoldBlack(ms)
    local t = GetGameTimer() + ms
    while GetGameTimer() < t and not IsSkipPressed() do Wait(0) end
end

function PlayIntroCutscene(token, onComplete)
    cutsceneActive = true
    cutsceneSkipped = false

    local playerPed = PlayerPedId()
    FreezeEntityPosition(playerPed, true)
    SetEntityVisible(playerPed, false, false)
    SetEntityCollision(playerPed, false, false)
    DisplayRadar(false)

    if DoesEntityExist(monsterPed) then
        ClearPedTasksImmediately(monsterPed)
        FreezeEntityPosition(monsterPed, true)
    end

    CreateThread(function()
        local shotMs = math.floor(Config.CutsceneShotSeconds * 1000)
        local cam = nil

        local function NextShot(subject, build)
            if cutsceneSkipped or not IsSessionActive(token) then return end
            DoScreenFadeOut(250)
            Wait(280)
            if cam then DestroyCam(cam, false) cam = nil end
            PrepareShotArea(playerPed, subject)
            DoScreenFadeIn(450)
            cam = build()
        end

        DoScreenFadeOut(400)
        Wait(450)
        Cine("cineStart", { skip = Config.AllowCutsceneSkip })
        SendNUIMessage({ action = "playSound", soundId = "ambient", loop = true, volume = 0.35 })
        ambientStarted = true

        if DoesEntityExist(monsterPed) then
            local mCoords = GetEntityCoords(monsterPed)
            local face = GetMonsterFace(monsterPed)
            NextShot(mCoords, function()
                Cine("title", { text = "THE MORGUE", sub = "Strawberry, Los Santos  ·  00:00" })
                Cine("caption", { kicker = "It is already here", text = "Something waits down here in the dark.", delay = 2600 })
                SendNUIMessage({ action = "playSound", soundId = "growl_far", volume = 0.35 })
                local c = PushInShot({
                    subject = mCoords, lookAt = face, camHeight = monsterIsQuadruped and 0.1 or 0.35,
                    far = 4.5, near = 2.0, durationMs = shotMs + 1200, ignore = monsterPed,
                    flicker = true, fovFrom = Config.Cinematic.FOV + 6.0, fovTo = Config.Cinematic.FOV - 6.0,
                })
                return c
            end)
        end

        local fuseIndex = nil
        for i in ipairs(activeFuseCoords) do
            if realFuseIndices[i] then fuseIndex = i break end
        end
        if fuseIndex then
            local fusePos = activeFuseCoords[fuseIndex]
            NextShot(fusePos, function()
                Cine("caption", { kicker = "Objective", text = ("Find %d glowing fuse%s. Some of them are decoys."):format(totalFusesRequired, totalFusesRequired == 1 and "" or "s") })
                return ArcShot({
                    subject = fusePos, lookAt = fusePos + vector3(0.0, 0.0, 0.15), camHeight = 0.55,
                    radius = 1.5, sweep = 50.0, durationMs = shotMs, ignore = clueObjects[fuseIndex], glow = true,
                })
            end)
        end

        NextShot(Config.ControlPanel, function()
            Cine("caption", { kicker = "Then", text = "Restore power at the control panel." })
            return PushInShot({
                subject = Config.ControlPanel, lookAt = Config.ControlPanel + vector3(0.0, 0.0, 0.6), camHeight = 0.9,
                far = 3.2, near = 1.6, durationMs = shotMs,
            })
        end)

        if Config.CutsceneRevealsExit then
            local exitPos = Config.ExitPoints[actualRealExitIndex].coords
            NextShot(exitPos, function()
                Cine("caption", { kicker = "Escape", text = "Find the way out before the time runs out." })
                return PushInShot({
                    subject = exitPos, lookAt = exitPos + vector3(0.0, 0.0, 0.9), camHeight = 1.0,
                    far = 4.0, near = 2.2, durationMs = shotMs,
                })
            end)
        end

        if not cutsceneSkipped and IsSessionActive(token) then
            DoScreenFadeOut(400)
            Wait(420)
            Cine("captionHide")
            Cine("finalLine", { text = "Don't let it get behind you." })
            HoldBlack(2200)
        end

        DoScreenFadeOut(0)
        Cine("cineEnd")
        if cam then DestroyCam(cam, false) end
        RenderScriptCams(false, false, 0, true, false)
        ClearRoomForGameViewport()
        ClearFocus()

        SetEntityVisible(playerPed, true, false)
        SetEntityCollision(playerPed, true, true)
        SafeTeleport(playerPed, Config.InteriorSpawnCoords, Config.InteriorHeading)
        FreezeEntityPosition(playerPed, false)

        if DoesEntityExist(monsterPed) then
            FreezeEntityPosition(monsterPed, false)
        end
        DisplayRadar(true)
        cutsceneActive = false
        DoScreenFadeIn(800)

        if onComplete and IsSessionActive(token) then
            onComplete()
        end
    end)
end

-- ============================================================
-- EVENT START
-- ============================================================
function StartHorrorEvent()
    if isEventActive then return end

    eventSession = eventSession + 1
    local token = eventSession

    isEventActive = true
    countdownTimer = Config.HeadStartSeconds
    timesCaught = 0
    flashlightBattery = 100.0
    playerStamina = 100.0
    playerExhausted = false
    exitCooldown = 0
    lastJumpscareTime = 0
    nextStunAllowed = 0
    fusesCollected = 0
    collectedFuseStack = {}
    panelRepaired = false
    escapeTimerSeconds = 0
    chaseStartTime = 0
    monsterMoveRate = 1.0
    focusInActive = false
    heartbeatPlaying = false

    aiState = "PATROL"
    monsterInPlayerView = false
    stalkCooldownUntil = 0
    playerHidden, hiddenSpot, hiddenAt = false, nil, 0
    nightVisionOn = false
    lastNoise = { pos = vector3(0.0, 0.0, 0.0), radius = 0.0, time = 0 }
    lastSawPlayerAt, lastSeenPos = 0, nil
    catchGraceUntil = 0
    ambientStarted = false
    lastSeenTime = 0
    lastSeenCoords = nil
    currentPatrolTarget = nil
    selectedMonsterModelName = nil

    math.randomseed(GetGameTimer())
    actualRealExitIndex = math.random(#Config.ExitPoints)

    local propCount = math.min(Config.FusePropCount, #Config.AllFusePool)
    totalFusesRequired = math.random(Config.MinFusesRequired, math.min(Config.MaxFusesRequired, propCount))

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
    local indices = {}
    for i = 1, propCount do
        table.insert(activeFuseCoords, shuffledPool[i])
        table.insert(indices, i)
    end
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

    hadFlashlight = HasPedGotWeapon(playerPed, WEAPON_FLASHLIGHT, false)
    hadStungun = HasPedGotWeapon(playerPed, WEAPON_STUNGUN, false)

    SetFocusArea(Config.InteriorLoadCoords.x, Config.InteriorLoadCoords.y, Config.InteriorLoadCoords.z, 0.0, 0.0, 0.0)

    FreezeEntityPosition(playerPed, true)
    SetEntityCoords(playerPed, Config.InteriorSpawnCoords.x, Config.InteriorSpawnCoords.y, Config.InteriorSpawnCoords.z, false, false, false, true)
    SetEntityHeading(playerPed, Config.InteriorHeading)

    local interiorID = GetInteriorAtCoords(Config.InteriorLoadCoords.x, Config.InteriorLoadCoords.y, Config.InteriorLoadCoords.z)
    if IsValidInterior(interiorID) then
        PinInteriorInMemory(interiorID)
        pinnedInterior = interiorID
        local t = 0
        while not IsInteriorReady(interiorID) and t < 60 do
            Wait(50)
            t = t + 1
        end
    end

    RequestCollisionAtCoord(Config.InteriorSpawnCoords.x, Config.InteriorSpawnCoords.y, Config.InteriorSpawnCoords.z)
    local timeout = 0
    while not HasCollisionLoadedAroundEntity(playerPed) and timeout < 50 do
        Wait(100)
        timeout = timeout + 1
    end

    ClearFocus()
    FreezeEntityPosition(playerPed, false)

    if not IsSessionActive(token) then return end

    Wait(500)
    DoScreenFadeIn(500)

    ClearTimecycleModifier()
    DisableScreenblurFade()
    SetTimecycleModifier("MP_Smuggler_Int")
    SetTimecycleModifierStrength(1.0)

    GiveWeaponToPed(playerPed, WEAPON_FLASHLIGHT, 1, false, true)
    GiveWeaponToPed(playerPed, WEAPON_STUNGUN, 100, false, false)
    SetCurrentPedWeapon(playerPed, WEAPON_FLASHLIGHT, true)

    StartControlLoop(token)
    StartObjectiveLoop(token)
    StartProximitySoundLoop(token)
    StartSurvivalMechanicsLoop(token)
    StartHidingLoop(token)

    CreateMonster(token, nil, function(success)
        if not success then
            EndHorrorEvent(false, false, "Failed to spawn the monster - event cancelled.")
            return
        end

        SpawnClueProps(token)

        local function BeginChaseSequence()
            StartDarknessEnforcementLoop(token)
            StartFirstPersonLoop(token)
            StartMonsterSilenceLoop(token)

            if not ambientStarted then
                SendNUIMessage({ action = "playSound", soundId = "ambient", loop = true, volume = 0.35 })
                ambientStarted = true
            end

            CreateThread(function()
                while IsSessionActive(token) and countdownTimer > 0 do
                    ShowNotification("Head start... Hide or run! " .. countdownTimer, 1000)
                    Wait(1000)
                    countdownTimer = countdownTimer - 1
                end

                if IsSessionActive(token) then
                    ShowNotification("IT IS COMING. FIND THE FUSES.", 5000)
                    chaseStartTime = GetGameTimer()
                    StartStalkerAI(token)
                end
            end)
        end

        if Config.PlayIntroCutscene then
            PlayIntroCutscene(token, BeginChaseSequence)
        else
            BeginChaseSequence()
        end
    end)
end

-- ============================================================
-- LOOPS
-- ============================================================
function StartFirstPersonLoop(token)
    CreateThread(function()
        while IsSessionActive(token) do
            SetFollowPedCamViewMode(4)
            Wait(0)
        end
    end)
end

function StartDarknessEnforcementLoop(token)
    CreateThread(function()
        while IsSessionActive(token) do
            NetworkOverrideClockTime(0, 0, 0)
            SetOverrideWeather("EXTRASUNNY")
            SetBlackout(true)
            Wait(0)
        end
    end)
end

function StartMonsterSilenceLoop(token)
    CreateThread(function()
        while IsSessionActive(token) do
            if monsterPed and DoesEntityExist(monsterPed) then
                StopCurrentPlayingAmbientSpeech(monsterPed)
                StopCurrentPlayingSpeech(monsterPed)
                SetPedConfigFlag(monsterPed, 32, true)
            end
            Wait(0)
        end
    end)
end

function SilenceMonsterPed(ped)
    if not DoesEntityExist(ped) then return end

    SetPedConfigFlag(ped, 32, true)
    DisablePedPainAudio(ped, true)

    BlockAllSpeechFromPed(ped, true, true)
    SetAmbientVoiceName(ped, "")
    StopCurrentPlayingAmbientSpeech(ped)
    StopCurrentPlayingSpeech(ped)

    SetPedCanPlayAmbientAnims(ped, false)
    SetPedCanPlayAmbientBaseAnims(ped, false)
end

function StartControlLoop(token)
    CreateThread(function()
        while IsSessionActive(token) do
            local playerPed = PlayerPedId()

            DisableControlAction(0, 37, true)
            DisableControlAction(1, 37, true)

            if not playerHidden and IsDisabledControlJustReleased(0, 37) then
                local currentWep = GetSelectedPedWeapon(playerPed)
                if currentWep == WEAPON_FLASHLIGHT then
                    SetCurrentPedWeapon(playerPed, WEAPON_STUNGUN, true)
                elseif flashlightBattery > 0 then
                    SetCurrentPedWeapon(playerPed, WEAPON_FLASHLIGHT, true)
                end
            end

            if playerExhausted then
                DisableControlAction(0, 21, true)
                DisableControlAction(0, 22, true)
            end

            if monsterPed and DoesEntityExist(monsterPed) then
                SetPedMoveRateOverride(monsterPed, monsterMoveRate)
            end

            Wait(0)
        end
    end)
end

function StartSurvivalMechanicsLoop(token)
    CreateThread(function()
        local farSince = nil
        local nvTick = 0

        while IsSessionActive(token) do
            local playerPed = PlayerPedId()

            if IsEntityDead(playerPed) then
                ShowNotification("You died... the morgue claims another.", 6000)
                EndHorrorEvent(false, true)
                break
            end

            local pc = GetEntityCoords(playerPed)
            if not cutsceneActive and pc.z < 18.0
                and #(vector2(pc.x, pc.y) - vector2(Config.InteriorSpawnCoords.x, Config.InteriorSpawnCoords.y)) < 80.0 then
                DoScreenFadeOut(200)
                Wait(250)
                local rp = Config.PlayerRespawnPoints[math.random(#Config.PlayerRespawnPoints)]
                SafeTeleport(playerPed, rp.coords, rp.heading)
                DoScreenFadeIn(500)
            end

            if not cutsceneActive and #(GetEntityCoords(playerPed) - Config.InteriorSpawnCoords) > Config.MaxDistanceFromMorgue then
                farSince = farSince or GetGameTimer()
                if GetGameTimer() - farSince > 3000 then
                    ShowNotification("You left the morgue - the event has ended.", 5000)
                    EndHorrorEvent(false, true)
                    break
                end
            else
                farSince = nil
            end

            if IsPedSprinting(playerPed) then
                playerStamina = math.max(0.0, playerStamina - Config.StaminaDrainRate)
                if playerStamina <= 0.0 and not playerExhausted then
                    playerExhausted = true
                    ShowNotification("~r~You're out of breath!~s~", 2500)
                end
            elseif playerStamina < 100.0 then
                playerStamina = math.min(100.0, playerStamina + Config.StaminaRegenRate)
            end
            if playerExhausted and playerStamina >= Config.ExhaustedRecoverAt then
                playerExhausted = false
            end

            if flashlightBattery > 0 then
                if GetSelectedPedWeapon(playerPed) == WEAPON_FLASHLIGHT and (IsPlayerFreeAiming(PlayerId()) or IsControlPressed(0, 25)) then
                    flashlightBattery = math.max(0.0, flashlightBattery - Config.FlashlightDrainRate)
                    if flashlightBattery <= 0 then
                        ShowNotification("Your flashlight died...", 3000)
                    end
                end
            elseif HasPedGotWeapon(playerPed, WEAPON_FLASHLIGHT, false) then
                RemoveWeaponFromPed(playerPed, WEAPON_FLASHLIGHT)
                SetCurrentPedWeapon(playerPed, WEAPON_STUNGUN, true)
            end

            if nightVisionOn then
                flashlightBattery = math.max(0.0, flashlightBattery - Config.NightVision.DrainRate)
                nvTick = (nvTick or 0) + 1
                if nvTick % 10 == 0 then
                    SendNUIMessage({ action = "camcorderBattery", level = flashlightBattery })
                end
                if flashlightBattery <= 0 then
                    SetNightVision(false)
                    ShowNotification("The camcorder battery died...", 3000)
                end
            end

            if exitCooldown > 0 then
                exitCooldown = exitCooldown - 100
            end

            Wait(100)
        end
    end)
end

function StartEscapeTimerLoop(token)
    CreateThread(function()
        escapeTimerSeconds = Config.EscapeTimeSeconds
        while IsSessionActive(token) and panelRepaired and escapeTimerSeconds > 0 do
            Wait(1000)
            if IsSessionActive(token) and panelRepaired then
                escapeTimerSeconds = escapeTimerSeconds - 1
                if escapeTimerSeconds <= 0 then
                    EndHorrorEvent(false, false, "Time has run out... You failed to escape!")
                end
            end
        end
    end)
end

local function SetHeartbeat(on, vol, spd)
    if on then
        SendNUIMessage({ action = "playHeartbeat", volume = vol, speed = spd })
        heartbeatPlaying = true
    elseif heartbeatPlaying then
        SendNUIMessage({ action = "stopHeartbeat" })
        heartbeatPlaying = false
    end
end

local function SetFocusIn(on)
    if on and not focusInActive then
        focusInActive = true
        AnimpostfxPlay("FocusIn", 200, false)
    elseif not on and focusInActive then
        focusInActive = false
        AnimpostfxStop("FocusIn")
    end
end

function StartProximitySoundLoop(token)
    CreateThread(function()
        local nextGrowl = GetGameTimer() + math.random(5000, 9000)

        while IsSessionActive(token) do
            if monsterPed and DoesEntityExist(monsterPed) and not cutsceneActive then
                local now = GetGameTimer()
                local pCoords = GetEntityCoords(PlayerPedId())
                local mCoords = GetEntityCoords(monsterPed)
                local zDiff = math.abs(pCoords.z - mCoords.z)
                local dist2d = #(vector2(pCoords.x, pCoords.y) - vector2(mCoords.x, mCoords.y))
                local sameFloor = zDiff < 4.0

                if aiState == "CHASE" and sameFloor and dist2d < 30.0 then
                    local k = math.max(0.0, 1.0 - dist2d / 30.0)
                    SetHeartbeat(true, 0.6 + k * 0.4, 1.1 + k * 0.4)
                    SetFocusIn(dist2d < 6.0)
                elseif sameFloor and dist2d < 14.0 and (playerHidden or monsterInPlayerView or aiState ~= "PATROL") then
                    local k = math.max(0.0, 1.0 - dist2d / 14.0)
                    SetHeartbeat(true, 0.3 + k * 0.6, 1.0 + k * 0.35)
                    SetFocusIn(false)
                else
                    SetHeartbeat(false)
                    SetFocusIn(false)
                end

                if now > nextGrowl and sameFloor and dist2d < 32.0 then
                    if aiState == "CHASE" then
                        SendNUIMessage({ action = "playSound", soundId = "growl_close", volume = 0.6 })
                        nextGrowl = now + math.random(3000, 5500)
                    else
                        if dist2d < 12.0 then
                            SendNUIMessage({ action = "playSound", soundId = "growl_close", volume = 0.45 })
                        else
                            SendNUIMessage({ action = "playSound", soundId = "growl_far", volume = 0.35 })
                        end
                        if aiState == "SEARCH" or aiState == "INVESTIGATE" then
                            nextGrowl = now + math.random(5000, 9000)
                        else
                            nextGrowl = now + math.random(8000, 16000)
                        end
                    end
                end

                Wait(200)
            else
                SetHeartbeat(false)
                SetFocusIn(false)
                Wait(500)
            end
        end
    end)
end

-- ============================================================
-- MONSTER
-- ============================================================
local function GetRandomPatrolNode(fromCoords)
    local nodes = {}
    for _, sp in ipairs(Config.MonsterSpawnPoints) do table.insert(nodes, sp.coords) end
    for _, cp in ipairs(activeFuseCoords) do table.insert(nodes, cp) end
    for _, ep in ipairs(Config.ExitPoints) do table.insert(nodes, ep.coords) end
    table.insert(nodes, Config.ControlPanel)

    for _ = 1, 8 do
        local node = nodes[math.random(#nodes)]
        if not fromCoords or #(node - fromCoords) > 3.0 then
            return node
        end
    end
    return nodes[math.random(#nodes)]
end

local function ShuffledCopy(list)
    local pool = {}
    for _, v in ipairs(list) do table.insert(pool, v) end
    for i = #pool, 2, -1 do
        local j = math.random(i)
        pool[i], pool[j] = pool[j], pool[i]
    end
    return pool
end

local function LoadFirstWorkingModel(candidates)
    for _, name in ipairs(candidates) do
        if not brokenModels[name] then
            local hash = GetHashKey(name)
            if IsModelInCdimage(hash) and IsModelValid(hash) then
                RequestModel(hash)
                local deadline = GetGameTimer() + Config.ModelLoadTimeoutMs
                while not HasModelLoaded(hash) and GetGameTimer() < deadline do
                    Wait(50)
                end
                if HasModelLoaded(hash) then
                    return hash, name
                end
                print(('[HORROR WARNING] Model "%s" timed out while loading - check its stream files. Skipping it from now on.'):format(name))
                SetModelAsNoLongerNeeded(hash)
            else
                print(('[HORROR WARNING] "%s" is not a registered/valid model - skipping.'):format(name))
            end
            brokenModels[name] = true
        end
    end
    return nil, nil
end

function CreateMonster(token, preferredModel, callback)
    CreateThread(function()
        local candidates = ShuffledCopy(Config.MonsterModels)
        if preferredModel then
            table.insert(candidates, 1, preferredModel)
        end

        local modelHash, modelName = LoadFirstWorkingModel(candidates)
        if not modelHash then
            print('[HORROR ERROR] No working model in Config.MonsterModels - trying fallback list.')
            modelHash, modelName = LoadFirstWorkingModel(ShuffledCopy(Config.FallbackMonsterModels))
        end

        if not modelHash then
            print('[HORROR ERROR] No monster model could be loaded (primary or fallback). Aborting spawn.')
            if callback then callback(false) end
            return
        end

        if not IsSessionActive(token) then
            SetModelAsNoLongerNeeded(modelHash)
            return
        end

        print('[HORROR] Spawning monster variant: ' .. modelName)
        selectedMonsterModelName = modelName

        local spawn = GetPointAwayFrom(Config.MonsterSpawnPoints, GetEntityCoords(PlayerPedId()), Config.MonsterRespawnMinDist)

        local isQuadruped = Config.QuadrupedModels[modelName] == true
        local ped = CreatePed(isQuadruped and 28 or 4, modelHash, spawn.coords.x, spawn.coords.y, spawn.coords.z, spawn.heading, false, true)

        if not DoesEntityExist(ped) then
            print('[HORROR ERROR] CreatePed returned an invalid entity for model: ' .. modelName)
            SetModelAsNoLongerNeeded(modelHash)
            if callback then callback(false) end
            return
        end

        monsterPed = ped
        SilenceMonsterPed(ped)

        SetPedCanRagdoll(ped, true)
        SetEntityInvincible(ped, false)
        SetEntityMaxHealth(ped, 9999)
        SetEntityHealth(ped, 9999)
        SetPedDropsWeaponsWhenDead(ped, false)

        SetPedFleeAttributes(ped, 0, false)
        SetPedCombatAttributes(ped, 46, true)

        TaskSetBlockingOfNonTemporaryEvents(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetEntityVisible(ped, true, false)
        SetEntityCollision(ped, true, true)

        monsterIsQuadruped = isQuadruped

        local clipSetToApply = Config.MonsterWalkStyle
        if isQuadruped then
            clipSetToApply = Config.DogMovementClipSet
        end

        if clipSetToApply then
            RequestAnimSet(clipSetToApply)
            local animTimeout = 0
            while not HasAnimSetLoaded(clipSetToApply) and animTimeout < 100 do
                Wait(10)
                animTimeout = animTimeout + 1
            end
            if HasAnimSetLoaded(clipSetToApply) then
                SetPedMovementClipset(ped, clipSetToApply, 1.0)
            else
                print('[HORROR WARNING] Movement clipset failed to load: ' .. clipSetToApply)
            end
        end

        SetModelAsNoLongerNeeded(modelHash)
        if callback then callback(true) end
    end)
end

local function IsPlayerLightOn(playerPed)
    if flashlightBattery <= 0 then return false end
    if GetSelectedPedWeapon(playerPed) ~= WEAPON_FLASHLIGHT then return false end
    return IsFlashLightOn(playerPed) or IsPlayerFreeAiming(PlayerId()) or IsControlPressed(0, 25)
end

local function IsMonsterInPlayerView(playerPed, monster, minDot, maxDist)
    local camPos = GetGameplayCamCoord()
    local target = GetEntityCoords(monster) + vector3(0.0, 0.0, monsterIsQuadruped and 0.2 or 0.5)
    local to = target - camPos
    local dist = #to
    if dist > maxDist or dist < 0.01 then return false, dist end

    local fwd = GetCamForward()
    local dot = (fwd.x * to.x + fwd.y * to.y + fwd.z * to.z) / dist
    if dot < minDot then return false, dist end

    return HasEntityClearLosToEntity(playerPed, monster, 17), dist
end

local function MonsterCanSee(monster, playerPed)
    if playerHidden then return false end
    local h = Config.Hunter
    local m = GetEntityCoords(monster)
    local p = GetEntityCoords(playerPed)
    if math.abs(p.z - m.z) > 3.0 then return false end

    local dist = #(p - m)
    if dist < h.CloseSenseDist then
        return HasEntityClearLosToEntity(monster, playerPed, 17)
    end

    local range = IsPlayerLightOn(playerPed) and h.SightRangeLit or h.SightRangeDark
    if GetPedStealthMovement(playerPed) then range = range * h.CrouchSightMult end
    if dist > range then return false end

    local fwd = GetEntityForwardVector(monster)
    local dx, dy = (p.x - m.x) / dist, (p.y - m.y) / dist
    if fwd.x * dx + fwd.y * dy < h.SightDot then return false end

    return HasEntityClearLosToEntity(monster, playerPed, 17)
end

local function MonsterCanHear(monster, playerPed)
    if playerHidden then return false end
    local h = Config.Hunter
    local radius
    if IsPedSprinting(playerPed) then
        radius = h.HearSprint
    elseif IsPedRunning(playerPed) then
        radius = h.HearRun
    elseif GetEntitySpeed(playerPed) > 0.4 then
        radius = GetPedStealthMovement(playerPed) and h.HearCrouch or h.HearWalk
    else
        return false
    end

    local m = GetEntityCoords(monster)
    local p = GetEntityCoords(playerPed)
    local dist = #(p - m)
    if math.abs(p.z - m.z) > 3.0 then dist = dist * 2.0 end
    if not HasEntityClearLosToEntity(monster, playerPed, 17) then
        radius = radius * h.HearThroughWalls
    end
    return dist < radius
end

function MakeNoise(pos, radius)
    lastNoise = { pos = pos, radius = radius, time = GetGameTimer() }
end

-- ============================================================
-- HIDING
-- ============================================================
local hideCam = nil
local hideYaw, hidePitch = 0.0, 0.0

local function NearestHidingSpot(coords, maxDist)
    local best, bestDist = nil, maxDist
    for _, spot in ipairs(Config.HidingSpots) do
        if math.abs(spot.coords.z - coords.z) < 2.5 then
            local d = #(vector2(spot.coords.x, spot.coords.y) - vector2(coords.x, coords.y))
            if d < bestDist then best, bestDist = spot, d end
        end
    end
    return best
end

local function HidingEyePos(spot)
    return spot.coords + vector3(0.0, 0.0, spot.low and 0.35 or 1.55)
end

function EnterHiding(spot)
    if playerHidden then return end
    local playerPed = PlayerPedId()

    DoScreenFadeOut(200)
    Wait(220)

    playerHidden = true
    hiddenSpot = spot
    hiddenAt = GetGameTimer()

    FreezeEntityPosition(playerPed, true)
    SetEntityVisible(playerPed, false, false)
    SetEntityCollision(playerPed, false, false)
    SetEntityCoordsNoOffset(playerPed, spot.coords.x, spot.coords.y, spot.coords.z + 1.0, false, false, false)

    hideYaw, hidePitch = 0.0, spot.low and 4.0 or -3.0
    local eye = HidingEyePos(spot)
    hideCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(hideCam, eye.x, eye.y, eye.z)
    SetCamRot(hideCam, hidePitch, 0.0, spot.heading, 2)
    SetCamFov(hideCam, 62.0)
    SetCamActive(hideCam, true)
    RenderScriptCams(true, false, 0, true, false)

    SendNUIMessage({ action = "hideOverlay", kind = spot.low and "low" or "locker" })
    DoScreenFadeIn(300)
end

function ExitHiding(forced)
    if not playerHidden then return end
    local playerPed = PlayerPedId()
    local spot = hiddenSpot

    if not forced then
        DoScreenFadeOut(150)
        Wait(170)
    end

    if hideCam then
        RenderScriptCams(false, false, 0, true, false)
        DestroyCam(hideCam, false)
        hideCam = nil
    end
    SendNUIMessage({ action = "hideOverlay", kind = false })

    SetEntityVisible(playerPed, true, false)
    SetEntityCollision(playerPed, true, true)
    playerHidden = false
    hiddenSpot = nil

    if spot then
        SafeTeleport(playerPed, spot.coords, spot.heading)
    end
    FreezeEntityPosition(playerPed, false)

    if not forced then
        DoScreenFadeIn(250)
    end
end

function CleanupHiding()
    if hideCam then
        RenderScriptCams(false, false, 0, true, false)
        DestroyCam(hideCam, false)
        hideCam = nil
    end
    SendNUIMessage({ action = "hideOverlay", kind = false })
    playerHidden = false
    hiddenSpot = nil
end

function StartHidingLoop(token)
    CreateThread(function()
        while IsSessionActive(token) do
            local playerPed = PlayerPedId()

            if playerHidden and hiddenSpot then
                DisableAllControlActions(0)
                EnableControlAction(0, 245, true)
                EnableControlAction(0, 249, true)
                hideYaw = math.max(-40.0, math.min(40.0, hideYaw - GetDisabledControlNormal(0, 1) * 6.0))
                hidePitch = math.max(-20.0, math.min(18.0, hidePitch - GetDisabledControlNormal(0, 2) * 4.0))
                local sway = math.sin(GetGameTimer() / 900.0) * 0.6
                if hideCam then
                    SetCamRot(hideCam, hidePitch + sway, 0.0, hiddenSpot.heading + hideYaw, 2)
                end

                ShowHelp("Hiding. ~INPUT_CONTEXT~ to leave")
                if IsDisabledControlJustReleased(0, 38) then
                    ExitHiding(false)
                end
                Wait(0)
            elseif not cutsceneActive and #Config.HidingSpots > 0 then
                local spot = NearestHidingSpot(GetEntityCoords(playerPed), 1.3)
                if spot then
                    ShowHelp(spot.low and "~INPUT_CONTEXT~ Hide underneath" or "~INPUT_CONTEXT~ Hide")
                    if IsControlJustReleased(0, 38) then
                        EnterHiding(spot)
                    end
                    Wait(0)
                else
                    Wait(200)
                end
            else
                Wait(500)
            end
        end
    end)
end

RegisterCommand('horrorspot', function(_, args)
    local ped = PlayerPedId()
    local c = GetEntityCoords(ped)
    local found, groundZ = GetGroundZFor_3dCoord(c.x, c.y, c.z + 0.5, false)
    local z = found and groundZ or (c.z - 1.0)
    local low = args[1] == "low"
    local spot = { coords = vector3(c.x, c.y, z), heading = GetEntityHeading(ped), low = low }
    table.insert(Config.HidingSpots, spot)

    local line = ("        { coords = vector3(%.4f, %.4f, %.4f), heading = %.2f, low = %s },"):format(c.x, c.y, z, spot.heading, tostring(low))
    print("[HORROR] Hiding spot added for this session. Paste into Config.HidingSpots:")
    print(line)
    ShowNotification("Hiding spot saved for this session - copy the line from the F8 console.", 5000)
end, false)

-- ============================================================
-- CAMCORDER NIGHT VISION
-- ============================================================
function SetNightVision(on)
    if on and flashlightBattery <= 0 then
        ShowNotification("The camcorder battery is dead.", 2500)
        on = false
    end
    nightVisionOn = on
    SetNightvision(on)
    SendNUIMessage({ action = "camcorder", show = on, level = flashlightBattery })
    if on then PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true) end
end

RegisterCommand('horrorNightVision', function()
    if not Config.NightVision.Enabled or not isEventActive or cutsceneActive then return end
    SetNightVision(not nightVisionOn)
end, false)
RegisterKeyMapping('horrorNightVision', 'Horror event: camcorder night vision', 'keyboard', 'N')

local function MonsterWalkTo(monster, target, speed)
    if monsterIsQuadruped then
        TaskFollowNavMeshToCoord(monster, target.x, target.y, target.z, math.max(1.0, speed), -1, 1.0, 0, 0.0)
    else
        TaskGoToCoordAnyMeans(monster, target.x, target.y, target.z, speed, 0, 0, 786603, 0)
    end
end

local function IsMonsterWalkTaskDone(monster)
    return GetScriptTaskStatus(monster, monsterIsQuadruped and TASK_NAVMESH or TASK_GO_TO_COORD) == 7
end

local function GetCurrentChaseSpeed()
    if chaseStartTime == 0 then return Config.MonsterChaseSpeed end
    local elapsedSec = (GetGameTimer() - chaseStartTime) / 1000.0
    local t = math.min(1.0, elapsedSec / Config.SpeedRampSeconds)
    return Config.MonsterChaseSpeed + (Config.MonsterMaxChaseSpeed - Config.MonsterChaseSpeed) * t
end

local function ScareRumble(ms)
    if Config.Jumpscare.PadRumble then
        SetPadShake(0, ms, 255)
    end
end

local function TriggerFaceScare(monster, playerPed)
    local js = Config.Jumpscare
    ClearPedTasksImmediately(monster)

    local pCoords = GetEntityCoords(playerPed)
    local mCoords = GetEntityCoords(monster)
    SetEntityHeading(monster, GetHeadingFromVector_2d(pCoords.x - mCoords.x, pCoords.y - mCoords.y))
    FreezeEntityPosition(monster, true)

    SendNUIMessage({ action = "duck" })
    SetHeartbeat(false)
    if js.SilenceMs > 0 then
        AnimpostfxPlay("FocusIn", 0, false)
        Wait(js.SilenceMs)
    end

    local headPos = GetMonsterFace(monster)
    local fwd = GetEntityForwardVector(monster)
    local faceTarget = headPos - vector3(0.0, 0.0, 0.03)
    local roll = (math.random() < 0.5 and -1.0 or 1.0) * math.random(6, 14)

    local scareCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    local startPos = headPos + (fwd * 0.8)
    SetEntityLocallyInvisible(playerPed)
    SetCamCoord(scareCam, startPos.x, startPos.y, startPos.z)
    AimCam(scareCam, startPos, faceTarget, roll)
    SetCamFov(scareCam, 100.0)
    SetCamActive(scareCam, true)
    RenderScriptCams(true, false, 0, true, false)

    SendNUIMessage({ action = "playSound", soundId = "jumpscare", volume = js.Volume, maxMs = js.SoundMaxMs })
    SendNUIMessage({ action = "playSound", soundId = "screech", volume = js.Volume * 0.8 })
    AnimpostfxStop("FocusIn")
    AnimpostfxPlay("ExplosionJosh3", 0, false)
    AnimpostfxPlay("Rampage", 0, true)
    ShakeCam(scareCam, "LARGE_EXPLOSION_SHAKE", 0.8)
    ScareRumble(js.HoldMs + js.LungeMs)

    local lungeStart = GetGameTimer()
    local holdEnd = lungeStart + js.LungeMs + js.HoldMs
    local strobeOn = true
    local nextStrobe = 0

    while GetGameTimer() < holdEnd do
        SetEntityLocallyInvisible(playerPed)
        local now = GetGameTimer()
        local t = math.min(1.0, (now - lungeStart) / js.LungeMs)
        local eased = 1.0 - (1.0 - t) * (1.0 - t) * (1.0 - t)

        local dist = 0.8 - (0.55 * eased)
        local jitter = vector3((math.random() - 0.5) * 0.01, (math.random() - 0.5) * 0.01, (math.random() - 0.5) * 0.01)
        local camPos = headPos + (fwd * dist) + jitter
        SetCamCoord(scareCam, camPos.x, camPos.y, camPos.z)
        AimCam(scareCam, camPos, faceTarget, roll + (math.random() - 0.5) * 1.5)
        SetCamFov(scareCam, 100.0 - (30.0 * eased))

        if js.Strobe and now >= nextStrobe then
            strobeOn = not strobeOn
            nextStrobe = now + math.random(70, 130)
        end
        if strobeOn or not js.Strobe then
            DrawLightWithRange(camPos.x, camPos.y, camPos.z, 255, 255, 255, 4.0, 40.0)
        else
            local under = headPos + (fwd * 0.30) - vector3(0.0, 0.0, 0.30)
            DrawLightWithRange(under.x, under.y, under.z, 220, 10, 10, 1.5, 40.0)
        end

        Wait(0)
    end

    DoScreenFadeOut(0)
    AnimpostfxStop("Rampage")
    AnimpostfxStop("ExplosionJosh3")
    Wait(50)

    RenderScriptCams(false, false, 0, true, false)
    DestroyCam(scareCam, false)
    FreezeEntityPosition(monster, false)
end

local function TriggerDoubleScare(monster)
    if not DoesEntityExist(monster) then return end
    local js = Config.Jumpscare

    local headPos = GetMonsterFace(monster)
    local fwd = GetEntityForwardVector(monster)
    local camPos = headPos + (fwd * 0.18)
    local roll = (math.random() < 0.5 and -1.0 or 1.0) * math.random(15, 25)

    local playerPed = PlayerPedId()
    SetEntityLocallyInvisible(playerPed)

    local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(cam, camPos.x, camPos.y, camPos.z)
    AimCam(cam, camPos, headPos, roll)
    SetCamFov(cam, 65.0)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 0, true, false)

    DoScreenFadeIn(0)
    SendNUIMessage({ action = "playSound", soundId = "screech", volume = js.Volume })
    AnimpostfxPlay("ExplosionJosh3", 0, false)
    ShakeCam(cam, "LARGE_EXPLOSION_SHAKE", 1.0)
    ScareRumble(200)

    local endTime = GetGameTimer() + js.DoubleScareMs
    while GetGameTimer() < endTime do
        SetEntityLocallyInvisible(playerPed)
        DrawLightWithRange(camPos.x, camPos.y, camPos.z - 0.3, 200, 0, 0, 2.0, 60.0)
        Wait(0)
    end

    DoScreenFadeOut(0)
    AnimpostfxStop("ExplosionJosh3")
    Wait(30)
    RenderScriptCams(false, false, 0, true, false)
    DestroyCam(cam, false)
end

local function HandleMonsterStunned(token)
    nextStunAllowed = GetGameTimer() + Config.StunCooldownMs
    local stunned = monsterPed
    SilenceMonsterPed(stunned)

    aiState = "PATROL"
    currentPatrolTarget = nil
    monsterMoveRate = 1.0
    monsterInPlayerView = false
    stalkCooldownUntil = GetGameTimer() + 8000

    ShowNotification("It vanished in the flash...", 3000)

    CreateThread(function()
        Wait(2500)
        if DoesEntityExist(stunned) then DeleteEntity(stunned) end
        if monsterPed == stunned then monsterPed = nil end

        Wait(3000)
        if not IsSessionActive(token) then return end

        CreateMonster(token, selectedMonsterModelName, function(success)
            if success then
                StartStalkerAI(token)
            else
                EndHorrorEvent(false, false, "The monster failed to return - event ended.")
            end
        end)
    end)
end

local function HandlePlayerCaught(token, monster, playerPed)
    DoScreenFadeOut(0)
    AnimpostfxStopAll()
    focusInActive = false
    monsterMoveRate = 1.0

    if not panelRepaired and #collectedFuseStack > 0 then
        local lostIndex = table.remove(collectedFuseStack)
        fusesCollected = math.max(0, fusesCollected - 1)
        SpawnFuseProp(lostIndex)
        ShowNotification(("It dragged you into the dark - you dropped a fuse! It's back where you found it. (%d/%d)")
            :format(fusesCollected, totalFusesRequired), 6000)
    else
        ShowNotification(("It dragged you into the dark... (%d/%d)"):format(timesCaught, Config.MaxCatches), 4000)
    end

    if math.random() < Config.Jumpscare.DoubleScareChance then
        Wait(math.random(700, 1200))
        if not IsSessionActive(token) then return end
        TriggerDoubleScare(monster)
        Wait(900)
    else
        Wait(2000)
    end
    if not IsSessionActive(token) then return end

    local respawn = Config.PlayerRespawnPoints[math.random(#Config.PlayerRespawnPoints)]
    SafeTeleport(playerPed, respawn.coords, respawn.heading)

    if flashlightBattery > 0 then
        SetCurrentPedWeapon(playerPed, WEAPON_FLASHLIGHT, true)
    end

    if DoesEntityExist(monster) then
        local spawn = GetPointAwayFrom(Config.MonsterSpawnPoints, respawn.coords, Config.MonsterRespawnMinDist)
        ClearPedTasksImmediately(monster)
        SafeTeleport(monster, spawn.coords, spawn.heading)
    end

    aiState = "PATROL"
    currentPatrolTarget = nil

    Wait(500)
    SendNUIMessage({ action = "stopSound", soundId = "jumpscare" })
    SendNUIMessage({ action = "unduck" })
    DoScreenFadeIn(1500)

    ShakeGameplayCam("DRUNK_SHAKE", 1.2)
    CreateThread(function()
        Wait(3000)
        if IsSessionActive(token) then StopGameplayCamShaking(false) end
    end)
end

local function HandlePlayerHit(token, monster, playerPed)
    AnimpostfxStopAll()
    focusInActive = false

    if not panelRepaired and #collectedFuseStack > 0 then
        local lostIndex = table.remove(collectedFuseStack)
        fusesCollected = math.max(0, fusesCollected - 1)
        SpawnFuseProp(lostIndex)
        ShowNotification(("It knocked a fuse out of your hands - it's back where you found it. (%d/%d)")
            :format(fusesCollected, totalFusesRequired), 5000)
    else
        ShowNotification(("RUN. (%d/%d)"):format(timesCaught, Config.MaxCatches), 3000)
    end

    local p = GetEntityCoords(playerPed)
    local m = GetEntityCoords(monster)
    local away = vector3(p.x - m.x, p.y - m.y, 0.0)
    local len = #away
    if len > 0.05 then
        away = away / len
        local from = p + vector3(0.0, 0.0, 0.2)
        local push = math.min(1.4, ClearDistanceTo(from, from + away * 1.6, playerPed) - 0.4)
        if push > 0.2 then
            SetEntityCoordsNoOffset(playerPed, p.x + away.x * push, p.y + away.y * push, p.z, false, false, false)
        end
        SetEntityHeading(playerPed, GetHeadingFromVector_2d(away.x, away.y))
    end

    ClearPedTasksImmediately(monster)
    SendNUIMessage({ action = "stopSound", soundId = "jumpscare" })
    SendNUIMessage({ action = "unduck" })
    SendNUIMessage({ action = "hurt" })
    DoScreenFadeIn(200)
    ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.7)

    CreateThread(function()
        local untilT = GetGameTimer() + 1400
        while GetGameTimer() < untilT and IsSessionActive(token) do
            SetPedMoveRateOverride(PlayerPedId(), 0.75)
            DisableControlAction(0, 22, true)
            Wait(0)
        end
    end)
end

-- ============================================================
-- ============================================================
function StartStalkerAI(token)
    CreateThread(function()
        local h = Config.Hunter
        local shaking = false
        local lastTick = GetGameTimer()
        local sightAccum = 0
        local stateSince = GetGameTimer()
        local lastIssue, moveTarget = 0, nil
        local investigatePos, lookUntil, nextLook = nil, 0, 0
        local searchQueue, searchIdx, searchUntil, pauseUntil = {}, 1, 0, 0
        local pulloutSpot = nil
        local recoverUntil = 0
        local patrolIssuedAt = 0
        local noiseHandled = 0
        local lastShrugMsg = 0
        local gaitCharging = false

        aiState = "PATROL"
        currentPatrolTarget = nil

        local function SetGait(monster, charging)
            if gaitCharging == charging then return end
            gaitCharging = charging
            if monsterIsQuadruped then return end
            if charging then
                ResetPedMovementClipset(monster, 0.2)
            elseif Config.MonsterWalkStyle then
                if not HasAnimSetLoaded(Config.MonsterWalkStyle) then RequestAnimSet(Config.MonsterWalkStyle) end
                if HasAnimSetLoaded(Config.MonsterWalkStyle) then
                    SetPedMovementClipset(monster, Config.MonsterWalkStyle, 0.5)
                end
            end
        end

        local function SetState(monster, state)
            aiState = state
            stateSince = GetGameTimer()
            lastIssue, moveTarget = 0, nil
            SetGait(monster, state == "CHASE" or state == "PULLOUT")
        end

        local function GoTo(monster, target, speed, now)
            local changed = not moveTarget or #(target - moveTarget) > 0.75
            local done = (now - lastIssue > 1000) and IsMonsterWalkTaskDone(monster)
            if changed or done or now - lastIssue > 5000 then
                MonsterWalkTo(monster, target, speed)
                moveTarget, lastIssue = target, now
            end
        end

        local function LookAround(monster, now)
            if now >= nextLook then
                local a = math.rad(math.random(0, 359))
                local mc = GetEntityCoords(monster)
                TaskTurnPedToFaceCoord(monster, mc.x + math.cos(a) * 4.0, mc.y + math.sin(a) * 4.0, mc.z, 1200)
                nextLook = now + math.random(1200, 2000)
            end
        end

        local function StartChase(monster, playerPed)
            if aiState ~= "CHASE" then
                SendNUIMessage({ action = "playSound", soundId = "screech", volume = 0.7 })
            end
            TaskClearLookAt(monster)
            SetState(monster, "CHASE")
            TaskGoToEntity(monster, playerPed, -1, 1.0, 3.0, 1073741824, 0)
            lastIssue = GetGameTimer()
            if chaseStartTime == 0 then chaseStartTime = GetGameTimer() end
        end

        local function StartInvestigate(monster, pos)
            if aiState ~= "INVESTIGATE" then SetState(monster, "INVESTIGATE") end
            investigatePos = pos
            lookUntil = 0
        end

        local function StartSearch(monster, centre)
            SetState(monster, "SEARCH")
            searchUntil = GetGameTimer() + h.SearchDurationMs
            pauseUntil = 0
            searchIdx = 1
            searchQueue = { { pos = centre } }

            local extra = {}
            for _, spot in ipairs(Config.HidingSpots) do
                if #(spot.coords - centre) < h.SearchRadius then
                    if math.random() < h.CheckHidingChance then
                        table.insert(extra, { pos = spot.coords, spot = spot })
                    end
                end
            end
            local nodes = {}
            for _, sp in ipairs(Config.MonsterSpawnPoints) do
                if #(sp.coords - centre) < h.SearchRadius then table.insert(nodes, sp.coords) end
            end
            for i = 1, math.min(2, #nodes) do
                table.insert(extra, { pos = nodes[math.random(#nodes)] })
            end
            for i = #extra, 2, -1 do
                local j = math.random(i)
                extra[i], extra[j] = extra[j], extra[i]
            end
            for _, e in ipairs(extra) do table.insert(searchQueue, e) end
        end

        while IsSessionActive(token) and monsterPed and DoesEntityExist(monsterPed) do
            local monster = monsterPed
            local playerPed = PlayerPedId()
            local now = GetGameTimer()
            local dt = now - lastTick
            lastTick = now

            local pCoords = GetEntityCoords(playerPed)
            local mCoords = GetEntityCoords(monster)
            local zDiff = math.abs(pCoords.z - mCoords.z)
            local dist = #(pCoords - mCoords)

            if GetEntityHealth(monster) < 9000 and not IsEntityDead(monster) then
                SetEntityHealth(monster, 9999)
            end

            local wasStunned = HasEntityBeenDamagedByWeapon(monster, WEAPON_STUNGUN, 0)
            if wasStunned then ClearEntityLastWeaponDamage(monster) end

            if IsEntityDead(monster) or (wasStunned and now >= nextStunAllowed) then
                if shaking then StopGameplayCamShaking(true) shaking = false end
                monsterInPlayerView = false
                HandleMonsterStunned(token)
                break
            end
            if wasStunned and now - lastShrugMsg > 3000 then
                lastShrugMsg = now
                ShowNotification("It shrugs off the shock... the stun gun needs time to recharge.", 2500)
            end

            local sees = MonsterCanSee(monster, playerPed)
            local hears = MonsterCanHear(monster, playerPed)
            if sees then
                sightAccum = sightAccum + dt
                lastSawPlayerAt = now
                lastSeenPos = pCoords
            else
                sightAccum = math.max(0, sightAccum - dt * 0.5)
            end
            local heardNoise = lastNoise.time > noiseHandled and #(mCoords - lastNoise.pos) < lastNoise.radius
            if heardNoise then noiseHandled = lastNoise.time end

            monsterInPlayerView = (not playerHidden) and IsMonsterInPlayerView(playerPed, monster, 0.75, 30.0)

            local touching = not playerHidden and not cutsceneActive and aiState ~= "RECOVER"
                and now > catchGraceUntil and zDiff < 3.0 and dist < Config.CatchDistance

            if touching then
                if shaking then StopGameplayCamShaking(true) shaking = false end
                monsterInPlayerView = false
                timesCaught = timesCaught + 1
                SetHeartbeat(false)
                TriggerFaceScare(monster, playerPed)

                if timesCaught >= Config.MaxCatches then
                    TriggerServerEvent('horror:playerCaught')
                    EndHorrorEvent(false, false, "The monster consumed you...")
                    break
                end

                if Config.CatchMode == "drag" then
                    HandlePlayerCaught(token, monster, playerPed)
                    SetState(monster, "PATROL")
                    currentPatrolTarget = nil
                else
                    HandlePlayerHit(token, monster, playerPed)
                    SetState(monster, "RECOVER")
                    recoverUntil = GetGameTimer() + h.HitRecoverMs
                    TaskTurnPedToFaceEntity(monster, playerPed, h.HitRecoverMs)
                end
                sightAccum = 0
                catchGraceUntil = GetGameTimer() + Config.CatchGraceMs

            elseif aiState == "CHASE" then
                local done = (now - lastIssue > 750) and GetScriptTaskStatus(monster, TASK_GO_TO_ENTITY) == 7
                if done or now - lastIssue > 2500 then
                    TaskGoToEntity(monster, playerPed, -1, 1.0, 3.0, 1073741824, 0)
                    lastIssue = now
                end
                monsterMoveRate = GetCurrentChaseSpeed()

                if sees and dist < Config.JumpscareTriggerDist and now - lastJumpscareTime > Config.JumpscareCooldownMs then
                    lastJumpscareTime = now
                    SendNUIMessage({ action = "playSound", soundId = "screech", volume = 0.85 })
                    ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.5)
                end

                if playerHidden then
                    if hiddenSpot and hiddenAt - lastSawPlayerAt < h.SawYouHideMs then
                        pulloutSpot = hiddenSpot
                        SetState(monster, "PULLOUT")
                    else
                        StartSearch(monster, lastSeenPos or pCoords)
                    end
                elseif not sees and now - lastSawPlayerAt > h.LoseSightMs then
                    StartSearch(monster, lastSeenPos or pCoords)
                end

            elseif aiState == "PULLOUT" then
                monsterMoveRate = GetCurrentChaseSpeed()
                GoTo(monster, pulloutSpot.coords, 3.0, now)
                if #(mCoords - pulloutSpot.coords) < 1.4 then
                    if playerHidden and hiddenSpot == pulloutSpot then
                        ExitHiding(true)
                    else
                        StartSearch(monster, pulloutSpot.coords)
                    end
                elseif not playerHidden and sees then
                    StartChase(monster, playerPed)
                end

            elseif aiState == "RECOVER" then
                monsterMoveRate = 1.0
                if now > recoverUntil then
                    if sees then StartChase(monster, playerPed) else StartSearch(monster, pCoords) end
                end

            else
                if sightAccum >= h.NoticeMs then
                    StartChase(monster, playerPed)
                elseif sees then
                    StartInvestigate(monster, pCoords)
                elseif hears then
                    StartInvestigate(monster, pCoords)
                elseif heardNoise then
                    StartInvestigate(monster, lastNoise.pos)
                end

                if aiState == "PATROL" then
                    local reached = currentPatrolTarget and #(mCoords - currentPatrolTarget) < 1.5
                    local stuck = currentPatrolTarget and (now - patrolIssuedAt > Config.PatrolNodeTimeoutMs)
                    local taskDone = currentPatrolTarget and (now - patrolIssuedAt > 1500) and IsMonsterWalkTaskDone(monster)
                    if not currentPatrolTarget or reached or stuck or taskDone then
                        currentPatrolTarget = GetRandomPatrolNode(mCoords)
                        patrolIssuedAt = now
                        MonsterWalkTo(monster, currentPatrolTarget, 1.0)
                    end
                    monsterMoveRate = Config.MonsterPatrolSpeed

                elseif aiState == "INVESTIGATE" then
                    if lookUntil == 0 then
                        GoTo(monster, investigatePos, 2.0, now)
                        monsterMoveRate = 1.0
                        if #(mCoords - investigatePos) < 1.6 or (now - stateSince > 1500 and IsMonsterWalkTaskDone(monster)) then
                            lookUntil = now + h.InvestigateLookMs
                            ClearPedTasks(monster)
                        end
                    else
                        LookAround(monster, now)
                        if now > lookUntil then
                            SetState(monster, "PATROL")
                            currentPatrolTarget = nil
                        end
                    end

                elseif aiState == "SEARCH" then
                    local entry = searchQueue[searchIdx]
                    if now > searchUntil or not entry then
                        SetState(monster, "PATROL")
                        currentPatrolTarget = nil
                    elseif pauseUntil > 0 then
                        LookAround(monster, now)
                        if now > pauseUntil then
                            pauseUntil = 0
                            searchIdx = searchIdx + 1
                            lastIssue, moveTarget = 0, nil
                        end
                    else
                        GoTo(monster, entry.pos, searchIdx == 1 and 2.0 or 1.0, now)
                        monsterMoveRate = 1.0
                        if #(mCoords - entry.pos) < 1.5 or (now - lastIssue > 1500 and IsMonsterWalkTaskDone(monster)) then
                            if entry.spot and playerHidden and hiddenSpot == entry.spot then
                                ExitHiding(true)
                            else
                                ClearPedTasks(monster)
                                pauseUntil = now + math.random(1500, 2600)
                            end
                        end
                    end
                end
            end

            if aiState == "CHASE" and zDiff < 3.0 and dist < 12.0 and dist >= 1.2 then
                local amp = ((12.0 - dist) / 12.0) * 2.0
                if not shaking then
                    ShakeGameplayCam("VIBRATE_SHAKE", amp)
                    shaking = true
                else
                    SetGameplayCamShakeAmplitude(amp)
                end
            elseif shaking then
                StopGameplayCamShaking(true)
                shaking = false
            end

            Wait((dist < 6.0) and 0 or 50)
        end

        monsterInPlayerView = false
        if shaking then StopGameplayCamShaking(true) end
    end)
end

-- ============================================================
-- FUSES / OBJECTIVES
-- ============================================================
local function EnsureModelLoaded(hash, timeoutMs)
    if HasModelLoaded(hash) then return true end
    RequestModel(hash)
    local deadline = GetGameTimer() + (timeoutMs or 5000)
    while not HasModelLoaded(hash) and GetGameTimer() < deadline do
        Wait(50)
    end
    return HasModelLoaded(hash)
end

function SpawnFuseProp(i)
    local pos = activeFuseCoords[i]
    if not pos then return false end
    if clueObjects[i] and DoesEntityExist(clueObjects[i]) then return true end

    local modelHash = GetHashKey(Config.FuseProp)
    if not EnsureModelLoaded(modelHash, 5000) then
        print('[HORROR ERROR] Failed to load fuse prop model: ' .. Config.FuseProp)
        return false
    end

    local obj = CreateObject(modelHash, pos.x, pos.y, pos.z + 0.05, false, false, false)
    if DoesEntityExist(obj) then
        SetEntityAsMissionEntity(obj, true, true)
        FreezeEntityPosition(obj, true)
        SetEntityCollision(obj, false, false)
        SetEntityAlpha(obj, realFuseIndices[i] and 255 or 190, false)
        clueObjects[i] = obj
        return true
    end
    return false
end

function SpawnClueProps(token)
    local modelHash = GetHashKey(Config.FuseProp)
    if not IsModelValid(modelHash) then
        print('[HORROR ERROR] Fuse prop model is not valid: ' .. Config.FuseProp)
        return
    end

    for i = 1, #activeFuseCoords do
        SpawnFuseProp(i)
    end
    SetModelAsNoLongerNeeded(modelHash)

    StartCluePropAnimationLoop(token)
end

function StartCluePropAnimationLoop(token)
    CreateThread(function()
        local rot = 0.0
        local pulse = 0.0
        while IsSessionActive(token) do
            if next(clueObjects) == nil then
                Wait(250)
            else
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

local function DrawProgressBar(label, progress)
    progress = math.max(0.0, math.min(1.0, progress))
    local w, h, x, y = 0.20, 0.016, 0.5, 0.80
    DrawRect(x, y, w + 0.004, h + 0.006, 0, 0, 0, 180)
    DrawRect(x - (w / 2) + (w * progress / 2), y, w * progress, h, 0, 150, 255, 220)
    DrawScaledText(x, y - 0.040, 0.35, label, 255, 255, 255, 255)
end

local function DoPanelRepair(token, playerPed)
    local fixingDict = Config.RepairAnimDict
    local fixingAnim = Config.RepairAnimName
    local durationMs = Config.RepairSeconds * 1000

    RequestAnimDict(fixingDict)
    local animTimeout = 0
    while not HasAnimDictLoaded(fixingDict) and animTimeout < 50 do
        Wait(50)
        animTimeout = animTimeout + 1
    end

    local caughtAtStart = timesCaught
    local repairStart = GetGameTimer()
    local nextRepairNoise = 0
    local repairSuccess = true

    FreezeEntityPosition(playerPed, true)
    if HasAnimDictLoaded(fixingDict) then
        TaskPlayAnim(playerPed, fixingDict, fixingAnim, 8.0, -8.0, -1, 1, 0, false, false, false)
    else
        print('[HORROR WARNING] Repair anim dict failed to load: ' .. fixingDict)
    end

    while GetGameTimer() - repairStart < durationMs do
        DisableControlAction(0, 30, true)
        DisableControlAction(0, 31, true)
        DisableControlAction(0, 21, true)
        DisableControlAction(0, 24, true)
        DisableControlAction(0, 25, true)

        DrawProgressBar("Repairing control panel...", (GetGameTimer() - repairStart) / durationMs)
        if GetGameTimer() >= nextRepairNoise then
            MakeNoise(Config.ControlPanel, Config.Hunter.NoiseRepair)
            nextRepairNoise = GetGameTimer() + 3000
        end

        Wait(0)
        if not IsSessionActive(token)
            or timesCaught ~= caughtAtStart
            or #(GetEntityCoords(playerPed) - Config.ControlPanel) > 3.0 then
            repairSuccess = false
            break
        end
    end

    ClearPedTasks(playerPed)
    FreezeEntityPosition(playerPed, false)
    RemoveAnimDict(fixingDict)

    if repairSuccess and IsSessionActive(token) then
        panelRepaired = true
        ShowNotification(("Control panel repaired! Find the exit within %d:%02d!")
            :format(math.floor(Config.EscapeTimeSeconds / 60), Config.EscapeTimeSeconds % 60), 6000)
        PlaySoundFrontend(-1, "HACKING_SUCCESS", "HUD_AWARDS_SOUNDSET", true)
        StartEscapeTimerLoop(token)
    elseif IsSessionActive(token) and timesCaught == caughtAtStart then
        ShowNotification("The repair was interrupted!", 3000)
    end
end

function StartObjectiveLoop(token)
    CreateThread(function()
        while IsSessionActive(token) do
            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)
            local nearSomething = false

            for i, cluePos in ipairs(activeFuseCoords) do
                if clueObjects[i] then
                    local dist = #(coords - cluePos)
                    if dist < 8.0 then nearSomething = true end
                    if dist < 2.0 then
                        if realFuseIndices[i] then
                            ShowHelp("Press ~INPUT_CONTEXT~ to pick up the Fuse")

                            if IsControlJustReleased(0, 38) then
                                fusesCollected = fusesCollected + 1
                                table.insert(collectedFuseStack, i)
                                if DoesEntityExist(clueObjects[i]) then
                                    DeleteEntity(clueObjects[i])
                                end
                                clueObjects[i] = nil

                                if fusesCollected >= totalFusesRequired then
                                    ShowNotification(("All fuses collected! (%d/%d) Get to the control panel."):format(fusesCollected, totalFusesRequired), 5000)
                                else
                                    ShowNotification(("Collected fuse! (%d/%d)"):format(fusesCollected, totalFusesRequired), 5000)
                                    MakeNoise(cluePos, Config.Hunter.NoiseFuse)
                                end
                                PlaySoundFrontend(-1, "CHALLENGE_UNLOCKED", "HUD_AWARDS_SOUNDSET", true)
                            end
                        else
                            ShowHelp("Press ~INPUT_CONTEXT~ to search")

                            if IsControlJustReleased(0, 38) then
                                PlaySoundFrontend(-1, "OOB_Cancel", "GTAO_FM_Events_Soundset", true)
                                ShowNotification("Just junk... This is a decoy. That was loud.", 2500)
                                MakeNoise(cluePos, Config.Hunter.NoiseDecoy)

                                playerStamina = math.max(0, playerStamina - Config.DecoyStaminaPenalty)
                                ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.6)
                            end
                        end
                    end
                end
            end

            local panelDist = #(coords - Config.ControlPanel)
            if panelDist < 8.0 then
                nearSomething = true
                local r, g, b = 0, 150, 255
                if panelRepaired then r, g, b = 0, 255, 0 end
                DrawMarker(1, Config.ControlPanel.x, Config.ControlPanel.y, Config.ControlPanel.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.2, 1.2, 0.8, r, g, b, 60, false, true, 2, false, nil, nil, false)

                if panelDist < 2.0 and not panelRepaired then
                    ShowHelp("Press ~INPUT_CONTEXT~ to Repair Control Panel")

                    if IsControlJustReleased(0, 38) then
                        if fusesCollected >= totalFusesRequired then
                            DoPanelRepair(token, playerPed)
                        else
                            ShowNotification(("You need %d more fuse(s) before repairing!"):format(totalFusesRequired - fusesCollected), 3000)
                            PlaySoundFrontend(-1, "OOB_Cancel", "GTAO_FM_Events_Soundset", true)
                        end
                    end
                end
            end

            if IsSessionActive(token) then
                for i, exitData in ipairs(Config.ExitPoints) do
                    local exitPos = exitData.coords
                    local distance = #(coords - exitPos)

                    if distance < 8.0 then
                        nearSomething = true
                        if panelRepaired and i == actualRealExitIndex then
                            DrawMarker(1, exitPos.x, exitPos.y, exitPos.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.2, 1.2, 0.8, 0, 255, 0, 60, false, true, 2, false, nil, nil, false)
                        else
                            DrawMarker(1, exitPos.x, exitPos.y, exitPos.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.2, 1.2, 0.8, 255, 0, 0, 60, false, true, 2, false, nil, nil, false)
                        end

                        if distance < 2.0 then
                            ShowHelp("Press ~INPUT_CONTEXT~ to try the Exit")

                            if IsControlJustReleased(0, 38) and exitCooldown <= 0 then
                                exitCooldown = Config.ExitCooldownMs

                                if i == actualRealExitIndex then
                                    if panelRepaired then
                                        EndHorrorEvent(true)
                                        break
                                    else
                                        ShowNotification("The control panel is offline! Repair it first.", 3000)
                                    end
                                else
                                    ShowNotification("It's a dead end! The door slams shut...", 3000)
                                    MakeNoise(exitPos, Config.Hunter.NoiseDoorSlam)
                                    PlaySoundFrontend(-1, "OOB_Cancel", "GTAO_FM_Events_Soundset", true)

                                    DoScreenFadeOut(200)
                                    Wait(500)

                                    local otherIndex = i
                                    if #Config.ExitPoints > 1 then
                                        while otherIndex == i do
                                            otherIndex = math.random(#Config.ExitPoints)
                                        end
                                    end
                                    local other = Config.ExitPoints[otherIndex]

                                    SafeTeleport(playerPed, other.coords, other.heading)
                                    Wait(500)
                                    DoScreenFadeIn(500)
                                end
                            end
                        end
                    end
                end
            end

            Wait(nearSomething and 0 or 200)
        end
    end)
end

-- ============================================================
-- EVENT END
-- ============================================================
function EndHorrorEvent(escaped, silent, message)
    if not isEventActive then return end
    isEventActive = false
    panelRepaired = false
    cutsceneActive = false
    monsterMoveRate = 1.0
    playerExhausted = false

    local playerPed = PlayerPedId()

    SetFollowPedCamViewMode(previousCamMode)

    if hadFlashlight then
        if not HasPedGotWeapon(playerPed, WEAPON_FLASHLIGHT, false) then
            GiveWeaponToPed(playerPed, WEAPON_FLASHLIGHT, 1, false, false)
        end
    else
        RemoveWeaponFromPed(playerPed, WEAPON_FLASHLIGHT)
    end
    if not hadStungun then
        RemoveWeaponFromPed(playerPed, WEAPON_STUNGUN)
    end
    SetCurrentPedWeapon(playerPed, WEAPON_UNARMED, true)

    ClearTimecycleModifier()
    SetBlackout(false)
    NetworkClearClockTimeOverride()
    ClearOverrideWeather()
    StopGameplayCamShaking(true)

    AnimpostfxStopAll()
    focusInActive = false
    heartbeatPlaying = false
    SendNUIMessage({ action = "stopAll" })

    CleanupHiding()
    if nightVisionOn then SetNightVision(false) end
    SetNightvision(false)
    RenderScriptCams(false, false, 0, true, false)
    SendNUIMessage({ action = "cineEnd" })
    ClearRoomForGameViewport()
    SetEntityVisible(playerPed, true, false)
    SetEntityCollision(playerPed, true, true)
    FreezeEntityPosition(playerPed, false)
    DisplayRadar(true)
    monsterInPlayerView = false

    if monsterPed and DoesEntityExist(monsterPed) then
        FreezeEntityPosition(monsterPed, false)
        DeleteEntity(monsterPed)
    end
    monsterPed = nil

    CleanupClueProps()
    chaseStartTime = 0

    for id in pairs(extraPinned) do UnpinInterior(id) end
    extraPinned = {}
    if pinnedInterior then
        UnpinInterior(pinnedInterior)
        pinnedInterior = nil
    end

    if silent then
        ClearFocus()
        if IsScreenFadedOut() or IsScreenFadingOut() then
            DoScreenFadeIn(500)
        end
        if message then ShowNotification(message, 6000) end
        return
    end

    DoScreenFadeOut(500)
    Wait(500)

    ClearFocus()
    SetEntityCoords(playerPed, Config.EntranceCoords.x, Config.EntranceCoords.y, Config.EntranceCoords.z, false, false, false, true)
    SetEntityHeading(playerPed, Config.EntranceHeading)
    DoScreenFadeIn(500)

    if message then
        ShowNotification(message, 6000)
    elseif escaped then
        ShowNotification("You escaped! Caught " .. timesCaught .. " time(s) along the way.", 6000)
    elseif timesCaught >= Config.MaxCatches then
        ShowNotification("The monster consumed you...", 6000)
    else
        ShowNotification("The event has ended.", 5000)
    end
end

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    SetNuiFocus(false, false)
    TriggerScreenblurFadeOut(0)
    if warningOpen then
        warningOpen = false
        FreezeEntityPosition(PlayerPedId(), false)
        DisplayRadar(true)
    end
    if isEventActive then
        EndHorrorEvent(false, true)
    end
    CleanupClueProps()
end)

CreateThread(function()
    local blip = AddBlipForCoord(Config.EntranceCoords.x, Config.EntranceCoords.y, Config.EntranceCoords.z)
    SetBlipSprite(blip, 432)
    SetBlipColour(blip, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Horror Event Entrance")
    EndTextCommandSetBlipName(blip)
end)
