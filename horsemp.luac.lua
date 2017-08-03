-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\horsemp.luac 

-- params : ...
-- function num : 0
local UI_VT = CppEnums.VehicleType
local servantMpBar = {_staticBarBG = (UI.getChildControl)(Panel_HorseMp, "Static_3"), _staticBar = (UI.getChildControl)(Panel_HorseMp, "HorseMpBar"), _staticText = (UI.getChildControl)(Panel_HorseMp, "StaticText_Mp"), _actorKeyRaw = 0, _button_AutoCarrot = (UI.getChildControl)(Panel_HorseMp, "CheckButton_AutoCarrot")}
local staminaAlert = (UI.getChildControl)(Panel_HorseMp, "StaticText_AlertStamina")
local repair_AutoNavi = (UI.getChildControl)(Panel_HorseMp, "CheckButton_Repair_AutoNavi")
local repair_Navi = (UI.getChildControl)(Panel_HorseMp, "Checkbox_Repair_Navi")
local horseCarrotItemKey = {[0] = 19945, [1] = 54001, [2] = 54004, [3] = 54005}
local camelCarrotItemKey = {[0] = 54012, [1] = 54020, [2] = 54021, [3] = 54022}
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_HorseMp")
registerEvent("EventSelfServantUpdate", "HorseMP_Update")
registerEvent("EventSelfServantUpdateOnlyMp", "HorseMP_Update")
registerEvent("EventSelfPlayerRideOn", "HorseMP_OpenByInteraction")
registerEvent("FromClient_RenderModeChangeState", "renderModechange_HorseMP_OpenByInteraction")
registerEvent("EventSelfPlayerCarrierChanged", "HorseMP_EventSelfPlayerCarrierChanged")
registerEvent("EventSelfPlayerRideOff", "HorseMP_Close")
FromClient_luaLoadComplete_HorseMp = function()
  -- function num : 0_0 , upvalues : staminaAlert, repair_AutoNavi, repair_Navi, servantMpBar
  HorseMP_init()
  staminaAlert:SetShow(false)
  repair_AutoNavi:SetShow(false)
  repair_Navi:SetShow(false)
  repair_AutoNavi:addInputEvent("Mouse_LUp", "HandleClick_Horse_Repair_Navi(true)")
  repair_Navi:addInputEvent("Mouse_LUp", "HandleClick_Horse_Repair_Navi(false)")
  ;
  (servantMpBar._button_AutoCarrot):addInputEvent("Mouse_On", "HorseMP_SimpleTooltips( true, 2, nil )")
  ;
  (servantMpBar._button_AutoCarrot):setTooltipEventRegistFunc("HorseMP_SimpleTooltips( true, 2, nil )")
  ;
  (servantMpBar._button_AutoCarrot):addInputEvent("Mouse_Out", "HorseMP_SimpleTooltips( false, 2 )")
end

HorseMP_init = function()
  -- function num : 0_1 , upvalues : servantMpBar
  Panel_HorseMp:SetShow(false, false)
  Panel_HorseMp:ComputePos()
  ;
  (servantMpBar._button_AutoCarrot):SetShow(false)
end

HorseMp_InitStaminaAlertText = function(vehicleType)
  -- function num : 0_2 , upvalues : staminaAlert
  local alertText = ""
  if (CppEnums.VehicleType).Type_Carriage == vehicleType or (CppEnums.VehicleType).Type_CowCarriage == vehicleType then
    alertText = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_STAMINA_ALERT_1")
  else
    if (CppEnums.VehicleType).Type_RepairableCarriage == vehicleType then
      alertText = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_STAMINA_ALERT_5")
    else
      if (CppEnums.VehicleType).Type_Boat == vehicleType or (CppEnums.VehicleType).Type_Raft == vehicleType or (CppEnums.VehicleType).Type_FishingBoat == vehicleType then
        alertText = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_STAMINA_ALERT_3")
      else
        if (CppEnums.VehicleType).Type_PersonTradeShip == vehicleType or (CppEnums.VehicleType).Type_SailingBoat == vehicleType or (CppEnums.VehicleType).Type_PersonalBattleShip == vehicleType then
          alertText = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_STAMINA_ALERT_4")
        else
          alertText = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_STAMINA_ALERT_2")
        end
      end
    end
  end
  staminaAlert:SetAutoResize()
  staminaAlert:SetText(alertText)
end

HorseMP_Update = function()
  -- function num : 0_3 , upvalues : servantMpBar, repair_AutoNavi, repair_Navi, UI_VT, horseCarrotItemKey, camelCarrotItemKey
  if Panel_HorseMp:GetShow() == false then
    return 
  end
  local self = servantMpBar
  local vehicleProxy = getVehicleActor(self._actorKeyRaw)
  if vehicleProxy == nil then
    return 
  end
  local vehicleType = ((vehicleProxy:get()):getVehicleType())
  local staminaPercent = nil
  staminaPercent = (vehicleProxy:get()):getMp() / (vehicleProxy:get()):getMaxMp() * 100
  if (CppEnums.VehicleType).Type_Carriage ~= vehicleType and (CppEnums.VehicleType).Type_CowCarriage ~= vehicleType and (CppEnums.VehicleType).Type_Boat ~= vehicleType and (CppEnums.VehicleType).Type_Raft ~= vehicleType and (CppEnums.VehicleType).Type_FishingBoat ~= vehicleType and (CppEnums.VehicleType).Type_SailingBoat ~= vehicleType and (CppEnums.VehicleType).Type_PersonalBattleShip ~= vehicleType and (CppEnums.VehicleType).Type_PersonTradeShip ~= vehicleType then
    if staminaPercent < 10 then
      (self._staticBarBG):EraseAllEffect()
      ;
      (self._staticBarBG):AddEffect("fUI_Horse_Gauge01", true, 0, 0)
      repair_AutoNavi:SetShow(true)
      repair_Navi:SetShow(true)
    else
      ;
      (self._staticBarBG):EraseAllEffect()
      repair_AutoNavi:SetShow(false)
      repair_Navi:SetShow(false)
    end
  end
  ;
  (self._staticBar):SetProgressRate(staminaPercent)
  if UI_VT.Type_Horse == vehicleType or UI_VT.Type_Camel == vehicleType or UI_VT.Type_Donkey == vehicleType or UI_VT.Type_MountainGoat == vehicleType then
    (self._staticText):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_SERVANT_MPBAR_LIFE", "getMp", makeDotMoney((vehicleProxy:get()):getMp()), "getMaxMp", makeDotMoney((vehicleProxy:get()):getMaxMp())))
    ;
    (self._staticBar):addInputEvent("Mouse_On", "HorseMP_SimpleTooltips( true, 0, " .. staminaPercent .. ")")
    ;
    (self._staticBar):addInputEvent("Mouse_Out", "HorseMP_SimpleTooltips( false, 0 )")
    ;
    (self._staticBar):setTooltipEventRegistFunc("HorseMP_SimpleTooltips( true, 0, " .. staminaPercent .. ")")
  else
    ;
    (self._staticText):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_SERVANT_MPBAR_MACHINE", "getMp", makeDotMoney((vehicleProxy:get()):getMp()), "getMaxMp", makeDotMoney((vehicleProxy:get()):getMaxMp())))
    if UI_VT.Type_Elephant == vehicleType then
      (self._staticBar):addInputEvent("Mouse_On", "HorseMP_SimpleTooltips( true, 3, " .. staminaPercent .. ")")
      ;
      (self._staticBar):addInputEvent("Mouse_Out", "HorseMP_SimpleTooltips( false, 3 )")
      ;
      (self._staticBar):setTooltipEventRegistFunc("HorseMP_SimpleTooltips( true, 3, " .. staminaPercent .. ")")
    else
      if UI_VT.Type_RidableBabyElephant == vehicleType then
        (self._staticText):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_SERVANT_MPBAR_LIFE", "getMp", makeDotMoney((vehicleProxy:get()):getMp()), "getMaxMp", makeDotMoney((vehicleProxy:get()):getMaxMp())))
        ;
        (self._staticBar):addInputEvent("Mouse_On", "HorseMP_SimpleTooltips( true, 0, " .. staminaPercent .. ")")
        ;
        (self._staticBar):addInputEvent("Mouse_Out", "HorseMP_SimpleTooltips( false, 0 )")
        ;
        (self._staticBar):setTooltipEventRegistFunc("HorseMP_SimpleTooltips( true, 0, " .. staminaPercent .. ")")
      else
        if UI_VT.Type_PersonTradeShip == vehicleType or UI_VT.Type_SailingBoat == vehicleType or UI_VT.Type_PersonalBattleShip == vehicleType then
          (self._staticText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HORSEHP_TOOLTIP_GUILDSHIP_NAME") .. " : " .. makeDotMoney((vehicleProxy:get()):getMp()) .. "/" .. makeDotMoney((vehicleProxy:get()):getMaxMp()))
          ;
          (self._staticBar):addInputEvent("Mouse_On", "HorseMP_SimpleTooltips( true, 4, " .. staminaPercent .. ")")
          ;
          (self._staticBar):addInputEvent("Mouse_Out", "HorseMP_SimpleTooltips( false, 4 )")
          ;
          (self._staticBar):setTooltipEventRegistFunc("HorseMP_SimpleTooltips( true, 4, " .. staminaPercent .. ")")
        else
          ;
          (self._staticBar):addInputEvent("Mouse_On", "HorseMP_SimpleTooltips( true, 1, " .. staminaPercent .. ")")
          ;
          (self._staticBar):addInputEvent("Mouse_Out", "HorseMP_SimpleTooltips( false, 1 )")
          ;
          (self._staticBar):setTooltipEventRegistFunc("HorseMP_SimpleTooltips( true, 1, " .. staminaPercent .. ")")
        end
      end
    end
  end
  if (getSelfPlayer()):isNavigationLoop() and (getSelfPlayer()):isNavigationMoving() then
    if UI_VT.Type_Boat == vehicleType or UI_VT.Type_Raft == vehicleType or UI_VT.Type_FishingBoat == vehicleType or UI_VT.Type_Carriage == vehicleType or UI_VT.Type_CowCarriage == vehicleType or UI_VT.Type_RepairableCarriage == vehicleType or UI_VT.Type_Cannon == vehicleType or UI_VT.Type_PracticeCannon == vehicleType or UI_VT.Type_Elephant == vehicleType or UI_VT.Type_BabyElephant == vehicleType or UI_VT.Type_ThrowFire == vehicleType or UI_VT.Type_ThrowStone == vehicleType or UI_VT.Type_SailingBoat == vehicleType or UI_VT.Type_PersonalBattleShip == vehicleType or UI_VT.Type_PersonTradeShip == vehicleType then
      (servantMpBar._button_AutoCarrot):SetShow(false)
    else
      ;
      (servantMpBar._button_AutoCarrot):SetShow(true)
      if staminaPercent <= 10 and (servantMpBar._button_AutoCarrot):IsCheck() == true then
        if UI_VT.Type_Horse == vehicleType or UI_VT.Type_Donkey == vehicleType or UI_VT.Type_RidableBabyElephant == vehicleType then
          HorseAutoCarrotFunc(horseCarrotItemKey)
        else
          if UI_VT.Type_Camel == vehicleType then
            HorseAutoCarrotFunc(camelCarrotItemKey)
          end
        end
      end
    end
  else
    ;
    (servantMpBar._button_AutoCarrot):SetShow(false)
  end
end

HorseAutoCarrotFunc = function(carrotItemKey)
  -- function num : 0_4
  local useAutoCarrot = function(invenSlot)
    -- function num : 0_4_0
    local itemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eInventory, invenSlot)
    local itemStatic = (itemWrapper:getStaticStatus()):get()
    local selfProxy = (getSelfPlayer()):get()
    if selfProxy == nil then
      return 
    end
    if selfProxy:doRideMyVehicle() and itemStatic:isUseToVehicle() then
      local equipSlotNo = (itemWrapper:getStaticStatus()):getEquipSlotNo()
      local carrotName = (itemWrapper:getStaticStatus()):getName()
      inventoryUseItem((CppEnums.ItemWhereType).eInventory, invenSlot, equipSlotNo, false)
      Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANT_AUTO_USE_CARROT", "carrotName", carrotName))
    end
  end

  local inventory = ((getSelfPlayer()):get()):getInventory()
  local invenSize = inventory:sizeXXX()
  local carrotItemSlot = {
[0] = {slot = "", key = ""}
, 
[1] = {slot = "", key = ""}
, 
[2] = {slot = "", key = ""}
, 
[3] = {slot = "", key = ""}
}
  for invenidx = 2, invenSize - 1 do
    local itemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eInventory, invenidx)
    if itemWrapper ~= nil then
      local itemKey = ((itemWrapper:get()):getKey()):getItemKey()
      if carrotItemKey[0] == itemKey or carrotItemKey[1] == itemKey or carrotItemKey[2] == itemKey or carrotItemKey[3] == itemKey then
        local carrotCoolTime = getItemCooltime((CppEnums.ItemWhereType).eInventory, invenidx)
        if carrotCoolTime == 0 then
          for idx = 0, 3 do
            -- DECOMPILER ERROR at PC72: Confused about usage of register: R16 in 'UnsetPending'

            if carrotItemKey[idx] == itemKey then
              (carrotItemSlot[idx]).slot = invenidx
              -- DECOMPILER ERROR at PC74: Confused about usage of register: R16 in 'UnsetPending'

              ;
              (carrotItemSlot[idx]).key = itemKey
            end
          end
        else
          do
            do
              do return  end
              -- DECOMPILER ERROR at PC78: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC78: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC78: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC78: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC78: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC78: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC78: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
  if (carrotItemSlot[0]).slot ~= "" and carrotItemKey[0] == (carrotItemSlot[0]).key then
    useAutoCarrot((carrotItemSlot[0]).slot)
    return 
  else
    if (carrotItemSlot[1]).slot ~= "" and carrotItemKey[1] == (carrotItemSlot[1]).key then
      useAutoCarrot((carrotItemSlot[1]).slot)
      return 
    else
      if (carrotItemSlot[2]).slot ~= "" and carrotItemKey[2] == (carrotItemSlot[2]).key then
        useAutoCarrot((carrotItemSlot[2]).slot)
        return 
      else
        if (carrotItemSlot[3]).slot ~= "" and carrotItemKey[3] == (carrotItemSlot[3]).key then
          useAutoCarrot((carrotItemSlot[3]).slot)
          return 
        end
      end
    end
  end
end

HandleOn_HorseMp_Bar = function()
  -- function num : 0_5 , upvalues : servantMpBar
  (servantMpBar._staticText):SetShow(true)
end

HandleOut_HorseMp_Bar = function()
  -- function num : 0_6 , upvalues : servantMpBar
  (servantMpBar._staticText):SetShow(false)
end

HorseMP_OpenByInteraction = function()
  -- function num : 0_7 , upvalues : servantMpBar, UI_VT
  local self = servantMpBar
  local selfPlayer = getSelfPlayer()
  local selfProxy = selfPlayer:get()
  local actorKeyRaw = selfProxy:getRideVehicleActorKeyRaw()
  local vehicleProxy = getVehicleActor(actorKeyRaw)
  if vehicleProxy == nil then
    return 
  end
  local vehicleType = (vehicleProxy:get()):getVehicleType()
  if UI_VT.Type_ThrowFire == vehicleType or UI_VT.Type_ThrowStone == vehicleType or UI_VT.Type_Cannon == vehicleType then
    return 
  end
  self._actorKeyRaw = actorKeyRaw
  HorseMP_Open()
  FGlobal_ServantIcon_IsNearMonster_Effect(false)
end

HorseMP_SimpleTooltips = function(isShow, servantTooltipType, staminaStatus)
  -- function num : 0_8 , upvalues : servantMpBar, staminaAlert
  local name, desc, uiControl = nil
  if servantTooltipType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_HORSEHP_TOOLTIP_HORSEMP_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_HORSEHP_TOOLTIP_HORSEMP_DESC")
    uiControl = Panel_HorseHp
  else
    if servantTooltipType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_HORSEHP_TOOLTIP_CARRIAGEMP_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_HORSEHP_TOOLTIP_CARRIAGEMP_DESC")
      uiControl = Panel_HorseHp
    else
      if servantTooltipType == 2 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_HORSEMP_TOOLTIP_AUTO_USE_CARROT_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_HORSEMP_TOOLTIP_AUTO_USE_CARROT_DESC")
        uiControl = servantMpBar._button_AutoCarrot
      else
        if servantTooltipType == 3 then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_HORSEHP_TOOLTIP_CARRIAGEMP_NAME")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_HORSEHP_TOOLTIP_ELEPHANTMP_DESC")
          uiControl = Panel_HorseMp
        else
          if servantTooltipType == 4 then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_HORSEHP_TOOLTIP_GUILDSHIP_NAME")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_HORSEHP_TOOLTIP_GUILDSHIP_DESC")
            uiControl = Panel_HorseMp
          end
        end
      end
    end
  end
  if isShow == true and staminaStatus ~= nil then
    registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(uiControl, name, desc)
    HandleOn_HorseMp_Bar()
    if staminaStatus < 30 then
      staminaAlert:SetShow(true)
    else
      staminaAlert:SetShow(false)
    end
  else
    if isShow == true and staminaStatus == nil then
      registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
      TooltipSimple_Show(uiControl, name, desc)
    else
      TooltipSimple_Hide()
      HandleOut_HorseMp_Bar()
      staminaAlert:SetShow(false)
    end
  end
end

HorseMP_Open = function()
  -- function num : 0_9 , upvalues : servantMpBar, UI_VT, repair_AutoNavi, repair_Navi
  if Panel_HorseMp:GetShow() then
    return 
  end
  if Panel_WorldMap:GetShow() then
    return 
  end
  local selfPlayer = getSelfPlayer()
  local selfProxy = selfPlayer:get()
  local isDriver = selfProxy:isVehicleDriver()
  if isDriver == false then
    local self = servantMpBar
    local vehicleProxy = getVehicleActor(self._actorKeyRaw)
    if vehicleProxy == nil then
      return 
    end
    local vehicleType = (vehicleProxy:get()):getVehicleType()
    if UI_VT.Type_Ladder == vehicleType or UI_VT.Type_Cow == vehicleType or UI_VT.Type_Bomb == vehicleType or UI_VT.Type_QuestObjectBox == vehicleType or UI_VT.Type_QuestObjectSack == vehicleType or UI_VT.Type_QuestObjectSheep == vehicleType or UI_VT.Type_QuestObjectCart == vehicleType or UI_VT.Type_QuestObjectOak == vehicleType or UI_VT.Type_QuestObjectBoat == vehicleType or UI_VT.Type_QuestObjectPumpkin == vehicleType or UI_VT.Type_QuestObjectBrokenFrag == vehicleType or UI_VT.Type_QuestObjectHerbalMachines == vehicleType or UI_VT.Type_QuestObjectExtractor == vehicleType then
      return 
    end
    Panel_HorseMp:SetShow(true)
    repair_AutoNavi:SetShow(false)
    repair_Navi:SetShow(false)
    HorseMp_InitStaminaAlertText(vehicleType)
    HorseMP_Update()
  end
end

HorseMP_Close = function()
  -- function num : 0_10
  if not Panel_HorseMp:GetShow() then
    return 
  end
  Panel_HorseMp:SetShow(false)
end

HandleClick_Horse_Repair_Navi = function(isAuto)
  -- function num : 0_11 , upvalues : repair_AutoNavi, repair_Navi
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  ToClient_DeleteNaviGuideByGroup(0)
  if ToClient_IsShowNaviGuideGroup(0) then
    if isAuto == true and repair_AutoNavi:IsCheck() == true then
      repair_Navi:SetCheck(true)
      repair_AutoNavi:SetCheck(true)
    else
      repair_Navi:SetCheck(false)
      repair_AutoNavi:SetCheck(false)
      audioPostEvent_SystemUi(0, 15)
      return 
    end
  else
    if isAuto == true then
      repair_Navi:SetCheck(true)
      repair_AutoNavi:SetCheck(true)
    else
      repair_Navi:SetCheck(true)
      repair_AutoNavi:SetCheck(false)
    end
  end
  local position = player:get3DPos()
  local spawnType = (CppEnums.SpawnType).eSpawnType_Stable
  local nearNpcInfo = getNearNpcInfoByType(spawnType, position)
  if nearNpcInfo ~= nil then
    local pos = nearNpcInfo:getPosition()
    local repairNaviKey = ToClient_WorldMapNaviStart(pos, NavigationGuideParam(), isAuto, true)
    audioPostEvent_SystemUi(0, 14)
    local selfPlayer = (getSelfPlayer()):get()
    selfPlayer:setNavigationMovePath(repairNaviKey)
    selfPlayer:checkNaviPathUI(repairNaviKey)
  end
end

HorseMP_EventSelfPlayerCarrierChanged = function(vehicleActorKeyRaw)
  -- function num : 0_12 , upvalues : servantMpBar
  local self = servantMpBar
  local characterActorProxyWrapper = getCharacterActor(vehicleActorKeyRaw)
  if characterActorProxyWrapper == nil then
    HorseMP_Close()
    return 
  end
  self._actorKeyRaw = vehicleActorKeyRaw
  HorseMP_Open()
end

renderModechange_HorseMP_OpenByInteraction = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_13
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  HorseMP_OpenByInteraction()
end

FGlobal_ToggleServantAutoCarrot = function()
  -- function num : 0_14 , upvalues : servantMpBar
  (servantMpBar._button_AutoCarrot):SetCheck(true)
end


