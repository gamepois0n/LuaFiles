-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\worldmap\worldminimappin.luac 

-- params : ...
-- function num : 0
local PIN_TYPE = {PIN_PARTY = 0, PIN_PARTYMINE = 1, PIN_GUILD = 2, PIN_GUILDMINE = 3, PIN_GUILDMASTER = 4, PIN_LAST = 5}
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
local RadarSizeX = 0
local RadarSizeY = 0
local SelfPosX = 0
local SelfPosZ = 0
local RadarPixelRate = 0
local FindWay_Info = {findWay_Position = nil, isShow = false}
FGlobal_WorldMiniMap_InitPinInRadar = function()
  -- function num : 0_0 , upvalues : Pin_Guild, Pin_Guild_Mine, Pin_Guild_Master, _listGuildMax, _listGuild
  Pin_Guild = (UI.getChildControl)(Panel_WorldMiniMap, "icon_pin_Guild")
  Pin_Guild_Mine = (UI.getChildControl)(Panel_WorldMiniMap, "icon_pin_GuildMine")
  Pin_Guild_Master = (UI.getChildControl)(Panel_WorldMiniMap, "icon_pin_GuildMaster")
  local selfPlayerWrapper = getSelfPlayer()
  if selfPlayerWrapper == nil then
    return 
  end
  for i = 0, _listGuildMax do
    -- DECOMPILER ERROR at PC40: Confused about usage of register: R5 in 'UnsetPending'

    _listGuild[i] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_WorldMiniMap, "Radar_Guild_" .. tostring(i))
    CopyBaseProperty(Pin_Guild, _listGuild[i])
  end
end

local GetPingEffect = function()
  -- function num : 0_1 , upvalues : _listPingMax, _listPingIdx, _listPing
  if _listPingMax < _listPingIdx then
    _listPingIdx = 0
  end
  local control = _listPing[_listPingIdx]
  _listPingIdx = _listPingIdx + 1
  return control
end

local GetPartyPin = function()
  -- function num : 0_2 , upvalues : _listPartyMax, _listPartyIdx, _listParty
  if _listPartyMax < _listPartyIdx then
    _listPartyIdx = 0
  end
  local control = _listParty[_listPartyIdx]
  _listPartyIdx = _listPartyIdx + 1
  return control
end

local GetGuildPin = function()
  -- function num : 0_3 , upvalues : _listGuildMax, _listGuildIdx, _listGuild
  if _listGuildMax < _listGuildIdx then
    _listGuildIdx = 0
  end
  local control = _listGuild[_listGuildIdx]
  _listGuildIdx = _listGuildIdx + 1
  return control
end

local GetGuideArrow = function()
  -- function num : 0_4 , upvalues : _listGuideMax, _listGuideIdx, _listGuide
  if _listGuideMax < _listGuideIdx then
    _listGuideIdx = 0
  end
  local control = _listGuide[_listGuideIdx]
  _listGuideIdx = _listGuideIdx + 1
  return control
end

local listActorPingParty = {}
local listActorPingGuild = {}
FromClient_WorldMiniMap_ResponseSendPositionGuideToRadar = function(PinInfo)
  -- function num : 0_5
end

local PinNaviKey = nil
WorldMiniMap_PositionGuideClear = function()
  -- function num : 0_6 , upvalues : _listGuildIdx, Pin_Guild_Master, Pin_Guild_Mine, _listGuildMax, _listGuild
  _listGuildIdx = 0
  Pin_Guild_Master:SetShow(false)
  Pin_Guild_Mine:SetShow(false)
  for index = _listGuildIdx, _listGuildMax do
    (_listGuild[index]):SetShow(false)
  end
end

FromClient_WorldMiniMap_PositionGuildDeleteToRadar = function(pinInfo)
  -- function num : 0_7
  WorldMiniMap_PositionGuideClear()
end

local PGAT = CppEnums.PositionGuideActorType
FGlobal_WorldMiniMap_UpdateGuildnPartyPin = function()
  -- function num : 0_8 , upvalues : PGAT, GetGuildPin, Pin_Guild_Master, Pin_Guild_Mine
  local positionGuideCount = ToClient_RequestGetPositionGuideCount()
  if positionGuideCount < 1 then
    return 
  end
  WorldMiniMap_PositionGuideClear()
  local positionGuide, pinUI = nil, nil
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
        end
      end
    end
    if pinUI ~= nil then
      pinUI:SetShow(true)
      Panel_WorldMiniMap:SetChildIndex(pinUI, 9999)
      ToClient_WorldminimapPinUpdatePosition(pinUI, positionGuide._position)
    end
  end
end

FGlobal_WorldMiniMap_GuildPinRotateMode = function(isRotateMode)
  -- function num : 0_9 , upvalues : GetGuildPin, Pin_Guild_Master, Pin_Guild_Mine
  if GetGuildPin() == nil then
    return 
  end
  ;
  (GetGuildPin()):SetParentRotCalc(isRotateMode)
  Pin_Guild_Master:SetParentRotCalc(isRotateMode)
  Pin_Guild_Mine:SetParentRotCalc(isRotateMode)
end

FGlobal_WorldMiniMap_UpdateRadarPin = function()
  -- function num : 0_10
  FGlobal_WorldMiniMap_UpdateGuildnPartyPin()
end

registerEvent("FromClient_luaLoadComplete", "FGlobal_WorldMiniMap_InitPinInRadar")
registerEvent("FromClient_ResponseSendPositionGuide", "FromClient_WorldMiniMap_ResponseSendPositionGuideToRadar")
registerEvent("FromClient_PositionGuildDelete", "FromClient_WorldMiniMap_PositionGuildDeleteToRadar")

