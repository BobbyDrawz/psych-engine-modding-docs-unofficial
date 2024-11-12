
--[[
    Script by @Arm4GeDon_
]]
luaDebugMode = true

-- -- -- Globals -- -- --

Cams = { -- Cams the script will affect
    ["camGame"] = {
        name = 'camGame',
        bump = {
            power = 0.015,
            speed = 1,
            tween = 'quartOut',
            lerp = true,
            lerpFactor = 0.05
        }
    },
    ["camHUD"] = {
        name = 'camHUD',
        bump = {
            power = 0.03,
            speed = 1,
            tween = 'quartOut',
            lerp = true,
            lerpFactor = 0.05
        }
    }
}
MainCam = 'camGame'
AllowLerp = true
AutoFocus = true
TweenType = "quartOut"
Lock = false
LerpFactor = 0.2
FollowSpeed = 1.1
BumpModulo = 4
BumpPower = 1
Focusing = ''
--
Dynamic = {}
Dynamic.power = 10
Dynamic.angle = 5
Dynamic.speed = 4
Dynamic.tween = 'quadOut'
Dynamic.lerp = true
Dynamic.lerpFactor = 0.5

-- -- -- Useless Functions -- -- --

local function get(s,v) return getProperty(s.."."..v) end
local function set(s,v,n) setProperty(s..'.'..v, n) end

-- -- -- Cam Handling Functions -- -- --

function updateCams()
    for _,v in pairs(Cams) do
        for i,c in pairs({"funkypos;"..v.name, "funkyzoom;"..v.name, "funkyangle;"..v.name}) do
            if not luaSpriteExists(c) then
                makeLuaSprite(c, nil, i == 2 and 1 or 0)
            end
        end
    end
end
function addCam(n)
    if not Cams[n] then Cams[n]={name=n,bump={
        power = 1,
        speed = 1,
        tween = 'quartOut',
        lerp = true,
        lerpFactor = 0.05
    }} end
    updateCams()
end
function removeCam(n)
    for key, value in pairs(Cams) do
        if value.name == n then
            Cams[key] = nil
            break
        end
    end
    updateCams()
end

-- -- -- Cam Functions -- -- --

function bump(cam, zoom)
    set('funkyzoom;'..cam, 'y', zoom * BumpPower)
    if not Cams[cam].bump.lerp then doTweenY(cam..'ZoomOffset', 'funkyzoom;'..cam, 0, 1/Cams[cam].bump.speed, Cams[cam].bump.tween) end
end
function bumpMult(mult)
    mult = mult or 1
    set('funkyzoom;'..MainCam, 'y', 0.015 * mult)
    if not Cams[MainCam].bump.lerp then doTweenY(MainCam..'ZoomOffset', 'funkyzoom;'..MainCam, 0, 1/Cams[MainCam].bump.speed, Cams[MainCam].bump.tween) end
    set('funkyzoom;'..'camHUD', 'y', 0.03 * mult)
    if not Cams['camHUD'].bump.lerp then doTweenY('camHUD'..'ZoomOffset', 'funkyzoom;'..'camHUD', 0, 1/Cams['camHUD'].bump.speed, Cams['camHUD'].bump.tween) end
end
function defaultBump(zoom)
    if Cams[MainCam] then
        bump(MainCam, zoom/2 or 0.015)
    end
    if Cams['camHUD'] then
        bump('camHUD', zoom or 0.03)
    end
end

function focus(char, time)
    local tPos = "funkypos;"..MainCam
    local isBf = type(char) == 'string' and (char == 'boyfriend') or nil
    local pos
    if char == 'middle' then
        local dad = {x = getMidpointX("dad") + 150 + get('dad', 'cameraPosition[0]') + getProperty('opponentCameraOffset[0]'), y = getMidpointY("dad") - 100 + get('dad', 'cameraPosition[1]') + getProperty("opponentCameraOffset[1]")}
        local bf = {x = getMidpointX("boyfriend") - 100 - get('boyfriend', 'cameraPosition[0]') + getProperty("boyfriendCameraOffset[0]"), y = getMidpointY("boyfriend") - 100 + get('boyfriend', 'cameraPosition[1]') + getProperty("boyfriendCameraOffset[1]")}
        pos = {x = (dad.x + bf.x)/2, y = (dad.y + bf.y)/2}
    else
        pos = (type(char) == "string" and {
            x = getMidpointX(char) + (isBf and -100 or 150) + get(char, 'cameraPosition[0]') * (isBf and -1 or 1) + getProperty((char == 'dad' and 'opponent' or char).."CameraOffset[0]"),
            y = getMidpointY(char) - 100 + get(char, 'cameraPosition[1]') + getProperty((char == 'dad' and 'opponent' or char).."CameraOffset[1]")
        } or {x=get(char,'x'),y=get(char,'y')})
    end
    doTweenX(MainCam..'FocusX', tPos, pos.x, (time <= 0 and 0.001 or time) or 0.75 , TweenType)
    doTweenY(MainCam..'FocusY', tPos, pos.y, (time <= 0 and 0.001 or time) or 0.75, TweenType)
end
function snapfocus(char, y)
    local tPos = "funkypos;"..MainCam
    local isBf = (y == '' and (char == 'boyfriend') or nil)
    local pos = (y == '' and {
        x = getMidpointX(char) + (isBf and -100 or 150) + get(char, 'cameraPosition[0]') * (isBf and -1 or 1) + getProperty((char == 'dad' and 'opponent' or char).."CameraOffset[0]"),
        y = getMidpointY(char) - 100 + get(char, 'cameraPosition[1]') + getProperty((char == 'dad' and 'opponent' or char).."CameraOffset[1]")
    } or {x=tonumber(char),y=tonumber(y)})
    set(tPos, 'x', pos.x)
    set(tPos, 'y', pos.y)
    set(MainCam, 'scroll.x', get(tPos, 'x')-(screenWidth/2))
    set(MainCam, 'scroll.y', get(tPos, 'y')-(screenHeight/2))
end

function zoom(cam, zoom, time, tween)
    doTweenX((cam or MainCam)..'Zoom', 'funkyzoom;'..(cam or MainCam), zoom, time <= 0 and 0.01 or time, tween or TweenType)
end

-- -- -- Event Handling -- -- --

function onEvent(n, v1, v2)
    if n == 'fc_bump' then
        bumpMult((v1 ~= '' and tonumber(v1) or 1))
    end
    if n == 'Add Camera Zoom' then
        bump(MainCam, v1 ~= '' and tonumber(v1) or 0.015)
        bump('camHUD', v2 ~= '' and tonumber(v2) or 0.03)
    end
    if n == 'bump' then
        bump(MainCam, v1 ~= '' and tonumber(v1) or 0.015)
        bump('camHUD', v2 ~= '' and tonumber(v2) or 0.03)
    end
    if n == 'fc_defaultbump' then
        defaultBump((v1 ~= '' and tonumber(v1) or 0.015))
    end
    if n == 'fc_focus' then
        if string.find(v1, ',') then
            v1 = stringSplit(v1, ',')
            v1 = {x=tonumber(v1[1]),y=tonumber(v1[2])}
        end
        focus(v1, tonumber(v2))
    end
    if n == 'fc_zoom' then
        local s = stringSplit(v2, ', ')
        zoom(v1 == '' and MainCam or v1, tonumber(s[1]), tonumber(s[2]), s[3] or TweenType)
    end
    if n == 'fc_setvalue' then
        if v1 == 'AllowLerp' then AllowLerp = v2 == 'true' end
        if v1 == 'AutoFocus' then AutoFocus = v2 == 'true' end
        if v1 == 'TweenType' then TweenType = v2 end
        if v1 == 'Lock' then Lock = v2 == 'true' end
        if v1 == 'LerpFactor' then LerpFactor = tonumber(v2) end
        if v1 == 'FollowSpeed' then FollowSpeed = tonumber(v2) end
        if v1 == 'BumpModulo' then BumpModulo = tonumber(v2) end
        if v1 == 'BumpPower' then BumpPower = tonumber(v2) end
        --
        if v1 == 'DynamicPower' then Dynamic.power = tonumber(v2) end
        if v1 == 'DynamicAngle' then Dynamic.angle = tonumber(v2) end
        if v1 == 'DynamicSpeed' then Dynamic.speed = tonumber(v2) end
        if v1 == 'DynamicTween' then Dynamic.tween = tonumber(v2) end
        if v1 == 'DynamicLerp' then Dynamic.lerp = v2 == 'true' end
        if v1 == 'DynamicLerpFactor' then Dynamic.lerpFactor = tonumber(v2) end
    end
    if n == 'fc_snapfocus' then
        snapfocus(v1, v2)
    end
    if n == 'fc_snapzoom' then
        local t = 'funkyzoom;'..(v1 == '' and MainCam or v1)
        set(t, 'x', tonumber(v2))
        set(v1, 'zoom', (get(t, 'x') + get(t, 'y')))
    end
    if n == 'game_zoom' then
        zoom('camGame', tonumber(v1), tonumber(v2))
    end
    if n == 'fc_modulo' then
        BumpModulo = v1 ~= '' and tonumber(v1) or BumpModulo
        BumpPower = v2 ~= '' and tonumber(v2) or BumpPower
    end
    if n == 'bump_modulo' then
        BumpModulo = tonumber(v1) or BumpModulo
        BumpPower = tonumber(v2) or BumpPower
    end
    if n == 'bump_speed' then
        BumpModulo = tonumber(v1) or 4
        BumpPower = tonumber(v2) or 1
    end
end

-- -- -- Script -- -- --

function lerp(a,b,t) return a * (1-(t or 0.5)) + b * (t or 0.5) end

function onCreate() updateCams() end
function onCreatePost()
    local dad = {x = getMidpointX("dad") + 150 + get('dad', 'cameraPosition[0]') + getProperty('opponentCameraOffset[0]'), y = getMidpointY("dad") - 100 + get('dad', 'cameraPosition[1]') + getProperty("opponentCameraOffset[1]")}
	local bf = {x = getMidpointX("boyfriend") - 100 - get('boyfriend', 'cameraPosition[0]') + getProperty("boyfriendCameraOffset[0]"), y = getMidpointY("boyfriend") - 100 + get('boyfriend', 'cameraPosition[1]') + getProperty("boyfriendCameraOffset[1]")}
    set("funkypos;"..MainCam, 'x', (dad.x + bf.x) / 2); set("funkypos;"..MainCam, 'y', (dad.y + bf.y) / 2)
    set('funkyzoom;'..MainCam, 'x', getProperty('defaultCamZoom'))
    set(MainCam, 'scroll.x', get("funkypos;"..MainCam, 'x')-(screenWidth/2)); set(MainCam, 'scroll.y', get("funkypos;"..MainCam, 'y')-(screenHeight/2)) 
end

function onSongStart() if AutoFocus then
    for _,v in pairs(Cams) do
        bump(v.name, v.bump.power)
    end
    focus(mustHitSection and 'boyfriend' or 'dad', 1/FollowSpeed)
end end
function onSectionHit() if AutoFocus then
    local gay = mustHitSection and 'boyfriend' or 'dad'
    if Focusing ~= gay then
        Focusing = gay
        focus(gay, 1/FollowSpeed)
    end
end end
function onBeatHit()
    if curBeat % BumpModulo == 0 then
        for _,v in pairs(Cams) do
            bump(v.name, v.bump.power)
        end
    end
end

function goodNoteHit(i, d, t, s)
    local tPos = "funkypos;"..MainCam
    if mustHitSection then
        if not getPropertyFromGroup('notes', i, 'noAnimation') or stringStartsWith(t, 'Char ') then
            if d == 0 then
                doTweenX(MainCam..'DynamicOffsetX', tPos..'.offset', -Dynamic.power, 1/Dynamic.speed, Dynamic.tween)
                doTweenY(MainCam..'DynamicOffsetY', tPos..'.offset', 0, 1/Dynamic.speed, Dynamic.tween)
            end
            if d == 1 then
                doTweenY(MainCam..'DynamicOffsetY', tPos..'.offset', Dynamic.power, 1/Dynamic.speed, Dynamic.tween)
                doTweenX(MainCam..'DynamicOffsetX', tPos..'.offset', 0, 1/Dynamic.speed, Dynamic.tween)
            end
            if d == 2 then 
                doTweenY(MainCam..'DynamicOffsetY', tPos..'.offset', -Dynamic.power, 1/Dynamic.speed, Dynamic.tween)
                doTweenX(MainCam..'DynamicOffsetX', tPos..'.offset', 0, 1/Dynamic.speed, Dynamic.tween)
            end
            if d == 3 then
                doTweenX(MainCam..'DynamicOffsetX', tPos..'.offset', Dynamic.power, 1/Dynamic.speed, Dynamic.tween)
                doTweenY(MainCam..'DynamicOffsetY', tPos..'.offset', 0, 1/Dynamic.speed, Dynamic.tween)
            end
        end
    end
end

function opponentNoteHit(i, d, t, s)
    local tPos = "funkypos;"..MainCam
    if not mustHitSection then
        if not getPropertyFromGroup('notes', i, 'noAnimation') then
            if d == 0 then
                doTweenX(MainCam..'DynamicOffsetX', tPos..'.offset', -Dynamic.power, 1/Dynamic.speed, Dynamic.tween)
                doTweenY(MainCam..'DynamicOffsetY', tPos..'.offset', 0, 1/Dynamic.speed, Dynamic.tween)
            end
            if d == 1 then
                doTweenY(MainCam..'DynamicOffsetY', tPos..'.offset', Dynamic.power, 1/Dynamic.speed, Dynamic.tween)
                doTweenX(MainCam..'DynamicOffsetX', tPos..'.offset', 0, 1/Dynamic.speed, Dynamic.tween)
            end
            if d == 2 then 
                doTweenY(MainCam..'DynamicOffsetY', tPos..'.offset', -Dynamic.power, 1/Dynamic.speed, Dynamic.tween)
                doTweenX(MainCam..'DynamicOffsetX', tPos..'.offset', 0, 1/Dynamic.speed, Dynamic.tween)
            end
            if d == 3 then
                doTweenX(MainCam..'DynamicOffsetX', tPos..'.offset', Dynamic.power, 1/Dynamic.speed, Dynamic.tween)
                doTweenY(MainCam..'DynamicOffsetY', tPos..'.offset', 0, 1/Dynamic.speed, Dynamic.tween)
            end
        end
    end
end

function onUpdatePost(elapsed)
    set(MainCam, 'followLerp', 0)
    for _,v in pairs(Cams) do
        local tPos, tZoom, tAngle = "funkypos;"..v.name, "funkyzoom;"..v.name, "funkyangle;"..v.name
        if not Lock then
            if v.name == MainCam then
                if AllowLerp then
                    if Dynamic.lerp then
                        set(v.name, 'scroll.x', lerp(get(v.name, 'scroll.x'), (get(tPos, 'x') + get(tPos, 'offset.x'))-(screenWidth/2), LerpFactor))
                        set(v.name, 'scroll.y', lerp(get(v.name, 'scroll.y'), (get(tPos, 'y') + get(tPos, 'offset.y'))-(screenHeight/2), LerpFactor))
                    else
                        set(v.name, 'scroll.x', get(tPos,'x')-(screenWidth/2) + get(tPos,'offset.x'))
                        set(v.name, 'scroll.y', get(tPos, 'y')-(screenHeight/2) + get(tPos,'offset.y'))
                    end
                else
                    set(v.name, 'scroll.x', get(tPos,'x')-(screenWidth/2)+get(tPos,'offset.x')); set(v.name, 'scroll.y', get(tPos, 'y')-(screenHeight/2) + get(tPos,'offset.y'))
                end
                if Dynamic.lerp then
                    set(v.name, 'angle', lerp(get(v.name, 'angle'), get(tAngle, 'x') + get(tAngle, 'y'), Dynamic.lerpFactor))
                else
                    set(v.name, 'angle', get(tAngle, 'x')+get(tAngle, 'y'))
                end
            end
        end
        if v.bump.lerp then
            set(tZoom, 'y', lerp(get(tZoom, 'y'), 0, v.bump.lerpFactor))
        end
        set(v.name, 'zoom', get(tZoom, 'x') + get(tZoom, 'y'))
    end
end