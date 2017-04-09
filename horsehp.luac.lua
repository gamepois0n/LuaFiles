-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\servant\horsehp.luac 

-- params : ...
-- function num : 0
local UI_VT = CppEnums.VehicleType
Panel_HorseHp:SetShow(false, false)
local servantHpBar = {_staticBar = (UI.getChildControl)(Panel_HorseHp, "HorseHpBar"), _staticText = (UI.getChildControl)(Panel_HorseHp, "StaticText_Hp"), _actorKeyRaw = 0}
HorseHP_init = function()
  -- function num : 0_0
  Panel_HorseHp:ComputePos()
end

HorseHP_Update = function()
  -- function num : 0_1 , upvalues : servantHpBar, UI_VT
  local self = servantHpBar
  local vehicleProxy = getVehicleActor(self._actorKeyRaw)
  if vehicleProxy == nil then
    return 
  end
  local vehicleType = (vehicleProxy:get()):getVehicleType()
  if UI_VT.Type_Ladder == vehicleType or UI_VT.Type_Cow == vehicleType or UI_VT.Type_Bomb == vehicleType or UI_VT.Type_QuestObjectBox == vehicleType or UI_VT.Type_QuestObjectSack == vehicleType or UI_VT.Type_QuestObjectSheep == vehicleType or UI_VT.Type_QuestObjectCart == vehicleType or UI_VT.Type_QuestObjectOak == vehicleType or UI_VT.Type_QuestObjectBoat == vehicleType or UI_VT.Type_QuestObjectPumpkin == vehicleType or UI_VT.Type_QuestObjectBrokenFrag == vehicleType or UI_VT.Type_QuestObjectHerbalMachines == vehicleType or UI_VT.Type_QuestObjectExtractor == vehicleType then
    HorseHP_Close()
    return 
  end
  ;
  (self._staticBar):SetProgressRate((vehicleProxy:get()):getHp() / (vehicleProxy:get()):getMaxHp() * 100)
  if UI_VT.Type_Horse == vehicleType or UI_VT.Type_Camel == vehicleType or UI_VT.Type_Donkey == vehicleType or UI_VT.Type_MountainGoat == vehicleType or UI_VT.Type_Elephant == vehicleType then
    (self._staticText):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_SERVANT_HPBAR_LIFE", "getHp", makeDotMoney((vehicleProxy:get()):getHp()), "getMaxHp", makeDotMoney((vehicleProxy:get()):getMaxHp())))
    Panel_HorseHp:addInputEvent("Mouse_On", "HorseHP_SimpleTooltips( true, 0 )")
    Panel_HorseHp:addInputEvent("Mouse_Out", "HorseHP_SimpleTooltips( false, 0 )")
    Panel_HorseHp:setTooltipEventRegistFunc("HorseHP_SimpleTooltips( true, 0 )")
  else
    ;
    (self._staticText):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_SERVANT_HPBAR_MACHINE", "getHp", makeDotMoney((vehicleProxy:get()):getHp()), "getMaxHp", makeDotMoney((vehicleProxy:get()):getMaxHp())))
    Panel_HorseHp:addInputEvent("Mouse_On", "HorseHP_SimpleTooltips( true, 1 )")
    Panel_HorseHp:addInputEvent("Mouse_Out", "HorseHP_SimpleTooltips( false, 1 )")
    Panel_HorseHp:setTooltipEventRegistFunc("HorseHP_SimpleTooltips( true, 1 )")
  end
end

;
(servantHpBar._staticBar):addInputEvent("Mouse_On", "HandleOn_HorseHp_Bar()")
;
(servantHpBar._staticBar):addInputEvent("Mouse_Out", "HandleOut_HorseHp_Bar()")
HandleOn_HorseHp_Bar = function()
  -- function num : 0_2 , upvalues : servantHpBar
  (servantHpBar._staticText):SetShow(true)
end

HandleOut_HorseHp_Bar = function()
  -- function num : 0_3 , upvalues : servantHpBar
  (servantHpBar._staticText):SetShow(false)
end

HorseHP_OpenByInteraction = function()
  -- function num : 0_4 , upvalues : servantHpBar
  local self = servantHpBar
  local selfPlayer = getSelfPlayer()
  local selfProxy = selfPlayer:get()
  local actorKeyRaw = selfProxy:getRideVehicleActorKeyRaw()
  self._actorKeyRaw = actorKeyRaw
  local vehicleProxy = getVehicleActor(actorKeyRaw)
  if vehicleProxy == nil then
    return 
  end
  HorseHP_Open()
end

HorseHP_SimpleTooltips = function(isShow, servantTooltipType)
  -- function num : 0_5
  local name, desc, uiControl = nil
  if servantTooltipType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_HORSEHP_TOOLTIP_HORSEHP_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_HORSEHP_TOOLTIP_HORSEHP_DESC")
  else
    if servantTooltipType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_HORSEHP_TOOLTIP_CARRIAGEHP_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_HORSEHP_TOOLTIP_CARRIAGEHP_DESC")
    else
      if servantTooltipType == 2 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_HORSEHP_TOOLTIP_HORSEHP_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_HORSEHP_TOOLTIP_ELEPHANTMP_DESC")
      end
    end
  end
  uiControl = Panel_HorseHp
  registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
  if isShow == true then
    TooltipSimple_Show(uiControl, name, desc)
  else
    TooltipSimple_Hide()
  end
end

HorseHP_Open = function()
  -- function num : 0_6
  if Panel_HorseHp:GetShow() then
    return 
  end
  if Panel_MiniGame_PowerControl:GetShow() then
    return 
  end
  if Panel_WorldMap:GetShow() then
    return 
  end
  Panel_HorseHp:SetShow(true)
  HorseHP_Update()
end

HorseHP_Close = function()
  -- function num : 0_7
  if not Panel_HorseHp:GetShow() then
    return 
  end
  Panel_HorseHp:SetShow(false)
end

HorseHP_EventSelfPlayerCarrierChanged = function(vehicleActorKeyRaw)
  -- function num : 0_8 , upvalues : servantHpBar
  local self = servantHpBar
  local characterActorProxyWrapper = getCharacterActor(vehicleActorKeyRaw)
  if characterActorProxyWrapper == nil then
    HorseHP_Close()
    return 
  end
  self._actorKeyRaw = vehicleActorKeyRaw
  HorseHP_Open()
end

registerEvent("EventSelfServantUpdate", "HorseHP_Update")
registerEvent("EventSelfPlayerRideOff", "HorseHP_Close")
registerEvent("EventSelfPlayerRideOn", "HorseHP_OpenByInteraction")
registerEvent("EventSelfPlayerCarrierChanged", "HorseHP_EventSelfPlayerCarrierChanged")
renderModechange_HorseHP_OpenByInteraction = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_9
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  HorseHP_OpenByInteraction()
end

registerEvent("FromClient_RenderModeChangeState", "renderModechange_HorseHP_OpenByInteraction")
HorseHP_init()

