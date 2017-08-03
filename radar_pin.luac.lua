-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\rader\radar_pin.luac 

-- params : ...
-- function num : 0
PIN_TYPE = {PIN_PARTY = 0, PIN_PARTYMINE = 1, PIN_GUILD = 2, PIN_GUILDMINE = 3, PIN_GUILDMASTER = 4, PIN_LAST = 5}
local _listPing = {}
local _listGuild = {}
local _listParty = {}
local _listGuide = {}
local _listPingIdx = 0
local _listGuildIdx = 0
local _listPartyIdx = 0
local _listGuideIdx = 0
local _listPingMax = 80
local _listGuildMax = 40
local _listPartyMax = 4
local _listGuideMax = 46
local Radar_Mine, Pin_Party, Pin_Party_Mine, Pin_Guild, Pin_Guild_Mine, Pin_Guild_Master, SelfPlayer, Pin_GuideArrow, Ping_Effect = nil, nil, nil, nil, nil, nil, nil, nil, nil
local Pin_FindWay = (UI.getChildControl)(Panel_Radar, "icon_pin_Findway")
local Pin_FindWay_Arrow = (UI.getChildControl)(Panel_Radar, "pin_area_Findway")
local RadarSizeX = 0
local RadarSizeY = 0
local SelfPosX = 0
local SelfPosZ = 0
local RadarPixelRate = 0
local FindWay_Info = {findWay_Position = nil, isShow = false}
local CalcRadarPostionToWorldPostion = function()
  -- function num : 0_0 , upvalues : Radar_Mine, SelfPlayer
  local posX = getMousePosX() - Panel_Radar:GetPosX()
  local posY = getMousePosY() - Panel_Radar:GetPosY()
  local intervalX = posX - (Radar_Mine:GetPosX() + Radar_Mine:GetSizeX() / 2)
  local intervalZ = Radar_Mine:GetPosY() + Radar_Mine:GetSizeY() / 2 - posY
  intervalX = intervalX * (100 / (radarMap.worldDistanceToPixelRate * 2))
  intervalZ = intervalZ * (100 / (radarMap.worldDistanceToPixelRate * 2))
  local float3Pos = float3(SelfPlayer:getPositionX() + intervalX, 0, SelfPlayer:getPositionZ() + intervalZ)
  return float3Pos
end

SendPingInfo_ToClient = function(isAlways)
  -- function num : 0_1 , upvalues : CalcRadarPostionToWorldPostion
  if isKeyPressed((CppEnums.VirtualKeyCode).KeyCode_CONTROL) then
    local WorldPos = CalcRadarPostionToWorldPostion()
    ToClient_RequestSendPositionGuide(true, isAlways, true, WorldPos)
  else
    do
      if isKeyPressed((CppEnums.VirtualKeyCode).KeyCode_MENU) then
        local WorldPos = CalcRadarPostionToWorldPostion()
        ToClient_RequestSendPositionGuide(false, isAlways, true, WorldPos)
      end
    end
  end
end

InitPinInRadar = function()
  -- function num : 0_2 , upvalues : Radar_Mine, Pin_Party, Pin_Party_Mine, Pin_Guild, Pin_Guild_Mine, Pin_Guild_Master, Pin_GuideArrow, Ping_Effect, _listPingMax, _listPing, _listGuildMax, _listGuild, _listPartyMax, _listParty, _listGuideMax, _listGuide
  Radar_Mine = (radarMap.controls).icon_SelfPlayer
  Pin_Party = (radarMap.template).icon_PIN_Party
  Pin_Party_Mine = (radarMap.template).icon_PIN_PartyMine
  Pin_Guild = (radarMap.template).icon_PIN_Guild
  Pin_Guild_Mine = (radarMap.template).icon_PIN_GuildMine
  Pin_Guild_Master = (radarMap.template).icon_PIN_GuildMaster
  Pin_GuideArrow = (radarMap.template).pin_guideArrow
  Ping_Effect = (UI.getChildControl)(Panel_Radar, "Static_GetthePoint")
  local selfPlayerWrapper = getSelfPlayer()
  if selfPlayerWrapper == nil then
    return 
  end
  for i = 0, _listPingMax do
    -- DECOMPILER ERROR at PC56: Confused about usage of register: R5 in 'UnsetPending'

    _listPing[i] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Radar, "Ping_Effect" .. tostring(i))
    CopyBaseProperty(Ping_Effect, _listPing[i])
    ;
    (_listPing[i]):AddEffect("UI_WorldMap_Ping01_Small", false, 0, 0)
  end
  for i = 0, _listGuildMax do
    -- DECOMPILER ERROR at PC88: Confused about usage of register: R5 in 'UnsetPending'

    _listGuild[i] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Radar, "Radar_Guild_" .. tostring(i))
    CopyBaseProperty(Pin_Guild, _listGuild[i])
  end
  for i = 0, _listPartyMax do
    -- DECOMPILER ERROR at PC112: Confused about usage of register: R5 in 'UnsetPending'

    _listParty[i] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Radar, "Radar_Party_" .. tostring(i))
    CopyBaseProperty(Pin_Party, _listParty[i])
  end
  for i = 0, _listGuideMax do
    -- DECOMPILER ERROR at PC136: Confused about usage of register: R5 in 'UnsetPending'

    _listGuide[i] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Radar, "Radar_Guide_" .. tostring(i))
    CopyBaseProperty(Pin_GuideArrow, _listGuide[i])
  end
end

local GetPingEffect = function()
  -- function num : 0_3 , upvalues : _listPingMax, _listPingIdx, _listPing
  if _listPingMax < _listPingIdx then
    _listPingIdx = 0
  end
  local control = _listPing[_listPingIdx]
  _listPingIdx = _listPingIdx + 1
  return control
end

local GetPartyPin = function()
  -- function num : 0_4 , upvalues : _listPartyMax, _listPartyIdx, _listParty
  if _listPartyMax < _listPartyIdx then
    _listPartyIdx = 0
  end
  local control = _listParty[_listPartyIdx]
  _listPartyIdx = _listPartyIdx + 1
  return control
end

local GetGuildPin = function()
  -- function num : 0_5 , upvalues : _listGuildMax, _listGuildIdx, _listGuild
  if _listGuildMax < _listGuildIdx then
    _listGuildIdx = 0
  end
  local control = _listGuild[_listGuildIdx]
  _listGuildIdx = _listGuildIdx + 1
  return control
end

local GetGuideArrow = function()
  -- function num : 0_6 , upvalues : _listGuideMax, _listGuideIdx, _listGuide
  if _listGuideMax < _listGuideIdx then
    _listGuideIdx = 0
  end
  local control = _listGuide[_listGuideIdx]
  _listGuideIdx = _listGuideIdx + 1
  return control
end

local listActorPingParty = {}
local listActorPingGuild = {}
FromClient_ResponseSendPositionGuideToRadar = function(PinInfo)
  -- function num : 0_7 , upvalues : GetPingEffect, listActorPingParty, listActorPingGuild
  if ToClient_WorldMapIsShow() == true then
    return 
  end
  local SelfPlayerWrapper = getSelfPlayer()
  local SelfPlayer = SelfPlayerWrapper:get()
  if PinInfo._isPermanent == false then
    local controlUI = GetPingEffect()
    controlUI:EraseAllEffect()
    local RadarSizeX = Panel_Radar:GetSizeX()
    local RadarSizeY = Panel_Radar:GetSizeY()
    local pixelRate = RaderMap_GetDistanceToPixelRate() / 100 * 2
    local selfPlayerPosX = SelfPlayer:getPositionX()
    local selfPlayerPosZ = SelfPlayer:getPositionZ()
    local position = PinInfo._position
    local intervalX = (position.x - selfPlayerPosX) * pixelRate
    local intervalZ = (selfPlayerPosZ - position.z) * pixelRate
    local pinPosX = intervalX + RadarSizeX / 2
    local pinPosY = intervalZ + RadarSizeY / 2
    if pinPosX < 0 or RadarSizeX * 0.93 < pinPosX or pinPosY < 0 or RadarSizeY * 0.93 < pinPosY then
      return 
    else
      local guideParam = NavigationGuideParam()
      if PinInfo._isForGuild then
        controlUI:AddEffect("UI_WorldMap_Ping01", false, 0, 0)
        guideParam._color = float4(1, 0.8, 0.6, 1)
        guideParam._bgColor = float4(0.6, 0.2, 0.2, 0.3)
        guideParam._beamColor = float4(0.4, 0.15, 0.15, 1)
        if listActorPingParty[PinInfo:getActorKeyRaw()] ~= nil then
          ToClient_DeleteNaviGuide(listActorPingParty[PinInfo:getActorKeyRaw()])
        end
        -- DECOMPILER ERROR at PC105: Confused about usage of register: R15 in 'UnsetPending'

        listActorPingParty[PinInfo:getActorKeyRaw()] = ToClient_AddNavigationBeam(position, guideParam, PinInfo._isTopPicking)
      else
        controlUI:AddEffect("UI_WorldMap_Ping02", false, 0, 0)
        guideParam._color = float4(1, 0.8, 0.6, 1)
        guideParam._bgColor = float4(0.6, 0.2, 0.2, 0.3)
        guideParam._beamColor = float4(0.4, 0.15, 0.15, 1)
        if listActorPingGuild[PinInfo:getActorKeyRaw()] ~= nil then
          ToClient_DeleteNaviGuide(listActorPingGuild[PinInfo:getActorKeyRaw()])
        end
        -- DECOMPILER ERROR at PC154: Confused about usage of register: R15 in 'UnsetPending'

        listActorPingGuild[PinInfo:getActorKeyRaw()] = ToClient_AddNavigationBeam(position, guideParam, PinInfo._isTopPicking)
      end
      controlUI:ResetVertexAni()
      controlUI:SetShow(true)
      controlUI:SetPosX(pinPosX - controlUI:GetSizeX() / 2)
      controlUI:SetPosY(pinPosY - controlUI:GetSizeY() / 2)
    end
  end
end

FromClient_PinDelete = function(deletePathKey)
  -- function num : 0_8 , upvalues : listActorPingParty, listActorPingGuild
  for actorKeyRaw,pathKey in pairs(listActorPingParty) do
    -- DECOMPILER ERROR at PC7: Confused about usage of register: R6 in 'UnsetPending'

    if deletePathKey == pathKey then
      listActorPingParty[actorKeyRaw] = nil
      break
    end
  end
  do
    for actorKeyRaw,pathKey in pairs(listActorPingGuild) do
      -- DECOMPILER ERROR at PC18: Confused about usage of register: R6 in 'UnsetPending'

      if deletePathKey == pathKey then
        listActorPingGuild[actorKeyRaw] = nil
        break
      end
    end
  end
end

FromeClient_RadarPINCreate = function(PinInfo, control, pinGuideControl, isMine)
  -- function num : 0_9 , upvalues : Pin_Guild, Pin_Guild_Master, Pin_Guild_Mine, Pin_Party, Pin_Party_Mine, Pin_GuideArrow
  if PinInfo._positionGuideActorType == (CppEnums.PositionGuideActorType).ePositionGuideActorType_isGuildMember then
    CopyBaseProperty(Pin_Guild, control)
  else
    if PinInfo._positionGuideActorType == (CppEnums.PositionGuideActorType).ePositionGuideActorType_isGuildLeader then
      CopyBaseProperty(Pin_Guild_Master, control)
    else
      if PinInfo._positionGuideActorType == (CppEnums.PositionGuideActorType).ePositionGuideActorType_isGuildMine then
        CopyBaseProperty(Pin_Guild_Mine, control)
      else
        if PinInfo._positionGuideActorType == (CppEnums.PositionGuideActorType).ePositionGuideActorType_isPartyMember then
          CopyBaseProperty(Pin_Party, control)
        else
          if PinInfo._positionGuideActorType == (CppEnums.PositionGuideActorType).ePositionGuideActorType_isPartyMine then
            CopyBaseProperty(Pin_Party_Mine, control)
          end
        end
      end
    end
  end
  CopyBaseProperty(Pin_GuideArrow, pinGuideControl)
  local posX = Panel_Radar:GetSizeX() - pinGuideControl:GetSizeX()
  local posY = Panel_Radar:GetSizeY() - pinGuideControl:GetSizeY()
  posX = posX / 2
  posY = posY / 2
  pinGuideControl:SetPosX(posX)
  pinGuideControl:SetPosY(posY)
  ToClient_SetRadarCenterPos(float2((radarMap.pcPosBaseControl).x, (radarMap.pcPosBaseControl).y))
end

local PinNaviKey = nil
FGlobal_ShowFindWayPin = function(key, pos3D)
  -- function num : 0_10 , upvalues : PinNaviKey, FindWay_Info
  PinNaviKey = key
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R2 in 'UnsetPending'

  FindWay_Info.findWay_Position = float3(pos3D.x, pos3D.y, pos3D.z)
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R2 in 'UnsetPending'

  FindWay_Info.isShow = true
end

FGlobal_DeleteNaviCheckFindWayPin = function(key)
  -- function num : 0_11 , upvalues : PinNaviKey
  if PinNaviKey == key then
    FGlobal_HideFindWayPin()
  end
end

FGlobal_HideFindWayPin = function()
  -- function num : 0_12 , upvalues : PinNaviKey, FindWay_Info, Pin_FindWay, Pin_FindWay_Arrow
  PinNaviKey = nil
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R0 in 'UnsetPending'

  FindWay_Info.findWay_Position = nil
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

  FindWay_Info.isShow = false
  Pin_FindWay:SetShow(false)
  Pin_FindWay_Arrow:SetShow(false)
end

PositionGuideClear = function()
  -- function num : 0_13 , upvalues : _listPartyIdx, _listGuildIdx, _listGuideIdx, Pin_Guild_Master, Pin_Guild_Mine, Pin_Party_Mine, _listPartyMax, _listParty, _listGuildMax, _listGuild, _listGuideMax, _listGuide
  _listPartyIdx = 0
  _listGuildIdx = 0
  _listGuideIdx = 0
  Pin_Guild_Master:SetShow(false)
  Pin_Guild_Mine:SetShow(false)
  Pin_Party_Mine:SetShow(false)
  for index = _listPartyIdx, _listPartyMax do
    (_listParty[index]):SetShow(false)
  end
  for index = _listGuildIdx, _listGuildMax do
    (_listGuild[index]):SetShow(false)
  end
  for index = _listGuideIdx, _listGuideMax do
    (_listGuide[index]):SetShow(false)
  end
end

FGlobal_PositionGuideSetAlpha = function(alpha)
  -- function num : 0_14 , upvalues : Pin_Guild_Master, Pin_Guild_Mine, Pin_Party_Mine, _listPartyIdx, _listPartyMax, _listParty, _listGuildIdx, _listGuildMax, _listGuild, _listGuideIdx, _listGuideMax, _listGuide
  if Pin_Guild_Master == nil then
    return 
  end
  Pin_Guild_Master:SetAlpha(alpha)
  Pin_Guild_Mine:SetAlpha(alpha)
  Pin_Party_Mine:SetAlpha(alpha)
  for index = _listPartyIdx, _listPartyMax do
    (_listParty[index]):SetAlpha(alpha)
  end
  for index = _listGuildIdx, _listGuildMax do
    (_listGuild[index]):SetAlpha(alpha)
  end
  for index = _listGuideIdx, _listGuideMax do
    (_listGuide[index]):SetAlpha(alpha)
  end
end

FromClient_PositionGuildDeleteToRadar = function(pinInfo)
  -- function num : 0_15
  PositionGuideClear()
end

FGlobal_CommonPinUpdate = function(pos3D, pinControl, arrowControl, center)
  -- function num : 0_16 , upvalues : SelfPosX, RadarPixelRate, SelfPosZ, RadarSizeX, RadarSizeY
  local pcInfo = radarMap.pcInfo
  local selfPlayerPos = float3((pcInfo.position).x, (pcInfo.position).y, (pcInfo.position).z)
  local intervalX = (pos3D.x - SelfPosX) * RadarPixelRate
  local intervalZ = (SelfPosZ - pos3D.z) * RadarPixelRate
  local pinPosX = intervalX + RadarSizeX / 2
  local pinPosY = intervalZ + RadarSizeY / 2
  if pinPosX < 0 or RadarSizeX * 0.93 < pinPosX + pinControl:GetSizeX() or pinPosY < 0 or RadarSizeY * 0.93 < pinPosY then
    pinControl:SetShow(false)
    local dx = SelfPosX - pos3D.x
    local dy = SelfPosZ - pos3D.z
    local radian = (math.atan2)(dx, dy)
    local guidePosX = RadarSizeX - arrowControl:GetSizeX()
    local guidePosY = RadarSizeY - arrowControl:GetSizeY()
    arrowControl:SetPosX(guidePosX / 2)
    arrowControl:SetPosY(guidePosY / 2)
    arrowControl:SetShow(true)
    arrowControl:SetRotate(radian)
    pinControl:SetShow(false)
    if ToClient_IsViewSelfPlayer(selfPlayerPos) == false then
      arrowControl:SetShow(false)
    end
  else
    do
      if center then
        pinControl:SetPosX(pinPosX - pinControl:GetSizeX() / 2)
      else
        pinControl:SetPosX(pinPosX)
      end
      pinControl:SetPosY(pinPosY - pinControl:GetSizeY())
      pinControl:SetShow(true)
      arrowControl:SetShow(false)
    end
  end
end

FGlobal_updateFindWayPin = function()
  -- function num : 0_17 , upvalues : FindWay_Info, Pin_FindWay, Pin_FindWay_Arrow
  if FindWay_Info.findWay_Position == nil or FindWay_Info.isShow == false then
    return 
  end
  FGlobal_CommonPinUpdate(FindWay_Info.findWay_Position, Pin_FindWay, Pin_FindWay_Arrow, true)
  if radarMap.isRotateMode then
    Pin_FindWay:SetRotate(getCameraRotation() + math.pi)
  end
end

local PGAT = CppEnums.PositionGuideActorType
FGlobal_UpdateGuildnPartyPin = function()
  -- function num : 0_18 , upvalues : PGAT, GetGuildPin, Pin_Guild_Master, Pin_Guild_Mine, Pin_Party_Mine, GetPartyPin, GetGuideArrow
  local positionGuideCount = ToClient_RequestGetPositionGuideCount()
  if positionGuideCount < 1 then
    return 
  end
  PositionGuideClear()
  local positionGuide, pinUI, pinGuideUI = nil, nil, nil
  local camRot = getCameraRotation()
  for idx = 0, positionGuideCount - 1 do
    positionGuide = ToClient_GetPositionGuideAtIndex(idx)
    if positionGuide == nil then
      return 
    end
    if positionGuide._positionGuideActorType == PGAT.ePositionGuideActorType_isGuildMember then
      pinUI = GetGuildPin()
    else
      if positionGuide._positionGuideActorType == PGAT.ePositionGuideActorType_isGuildMaster then
        pinUI = Pin_Guild_Master
      else
        if positionGuide._positionGuideActorType == PGAT.ePositionGuideActorType_isGuildMine then
          pinUI = Pin_Guild_Mine
        else
          if positionGuide._positionGuideActorType == PGAT.ePositionGuideActorType_isPartyMine then
            pinUI = Pin_Party_Mine
          else
            if positionGuide._positionGuideActorType == PGAT.ePositionGuideActorType_isPartyMember then
              pinUI = GetPartyPin()
            end
          end
        end
      end
    end
    pinGuideUI = GetGuideArrow()
    local position = positionGuide._position
    FGlobal_CommonPinUpdate(position, pinUI, pinGuideUI, false)
    if radarMap.isRotateMode then
      pinUI:SetRotate(camRot + math.pi)
    end
  end
end

FGlobal_GuildPinRotateMode = function(isRotateMode)
  -- function num : 0_19 , upvalues : GetGuildPin, GetPartyPin, Pin_Party_Mine, Pin_Guild_Master, Pin_Guild_Mine
  (GetGuildPin()):SetParentRotCalc(isRotateMode)
  ;
  (GetPartyPin()):SetParentRotCalc(isRotateMode)
  Pin_Party_Mine:SetParentRotCalc(isRotateMode)
  Pin_Guild_Master:SetParentRotCalc(isRotateMode)
  Pin_Guild_Mine:SetParentRotCalc(isRotateMode)
end

FGlobal_UpdateRadarPin = function()
  -- function num : 0_20 , upvalues : SelfPlayer, RadarSizeX, RadarSizeY, RadarPixelRate, SelfPosX, SelfPosZ
  SelfPlayerWrapper = getSelfPlayer()
  if SelfPlayerWrapper == nil then
    return 
  end
  SelfPlayer = SelfPlayerWrapper:get()
  RadarSizeX = Panel_Radar:GetSizeX()
  RadarSizeY = Panel_Radar:GetSizeY()
  RadarPixelRate = RaderMap_GetDistanceToPixelRate() / 100 * 2
  SelfPosX = SelfPlayer:getPositionX()
  SelfPosZ = SelfPlayer:getPositionZ()
  FGlobal_UpdateGuildnPartyPin()
  FGlobal_updateFindWayPin()
end

resetPinRotate = function()
  -- function num : 0_21 , upvalues : Pin_FindWay, Pin_FindWay_Arrow
  Pin_FindWay:SetRotate(0)
  Pin_FindWay_Arrow:SetRotate(0)
end

FGlobal_PinRotateMode = function(isRotateMode)
  -- function num : 0_22 , upvalues : Pin_FindWay, Pin_FindWay_Arrow
  Pin_FindWay:SetParentRotCalc(isRotateMode)
  Pin_FindWay_Arrow:SetParentRotCalc(isRotateMode)
end

InitPinInRadar()
registerEvent("FromClient_ResponseSendPositionGuide", "FromClient_ResponseSendPositionGuideToRadar")
registerEvent("FromeClient_RadarPINCreate", "FromeClient_RadarPINCreate")
registerEvent("FromClient_PositionGuildDelete", "FromClient_PositionGuildDeleteToRadar")
registerEvent("FromClient_StartNavigationGuide", "FGlobal_ShowFindWayPin")
registerEvent("FromClient_DeleteNavigationGuide", "FGlobal_DeleteNaviCheckFindWayPin")
registerEvent("FromClient_DeleteNavigationGuide", "FromClient_PinDelete")
registerEvent("FromClient_ClearNavigationGuide", "FGlobal_HideFindWayPin")

