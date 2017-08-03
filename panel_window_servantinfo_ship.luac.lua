-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\panel_window_servantinfo_ship.luac 

-- params : ...
-- function num : 0
Panel_ShipInfo:SetShow(false, false)
Panel_ShipInfo:ActiveMouseEventEffect(true)
Panel_ShipInfo:SetDragEnable(true)
Panel_ShipInfo:setGlassBackground(true)
Panel_ShipInfo:RegisterShowEventFunc(true, "ShipInfoShowAni()")
Panel_ShipInfo:RegisterShowEventFunc(false, "ShipInfoHideAni()")
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
local UI_VT = CppEnums.VehicleType
ShipInfoShowAni = function()
  -- function num : 0_0
  (UIAni.fadeInSCR_Right)(Panel_ShipInfo)
  audioPostEvent_SystemUi(1, 0)
end

ShipInfoHideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
  Panel_ShipInfo:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_ShipInfo:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
  audioPostEvent_SystemUi(1, 1)
end

local shipInfo = {
_config = {
_itemSlot = {createIcon = false, createBorder = true, createCount = true, createEnchant = true, createCash = true, createEnduranceIcon = true}
, 
_slotNo = {3, 4, 5, 6, 25, 14, 15, 16, 26}
, 
_slotID = {[3] = "equipIcon_hull", [4] = "equipIcon_gear", [5] = "equipIcon_wheel", [6] = "equipIcon_totem", [25] = "equipIcon_body", [14] = "equipIcon_AvatarSaddle", [15] = "equipIcon_AvatarHull", [16] = "equipIcon_AvatarWheel", [26] = "equipIcon_AvatarBody"}
, 
_checkFlag = {[3] = 1, [4] = 2, [5] = 4, [6] = 8, [14] = 16, [15] = 32, [16] = 64, [25] = 128, [26] = 256}
, 
_slotEmptyBG = {[3] = (UI.getChildControl)(Panel_ShipInfo, "equipIconEmpty_Hull"), [4] = (UI.getChildControl)(Panel_ShipInfo, "equipIconEmpty_Gear"), [5] = (UI.getChildControl)(Panel_ShipInfo, "equipIconEmpty_Wheel"), [6] = (UI.getChildControl)(Panel_ShipInfo, "equipIconEmpty_Totem"), [25] = (UI.getChildControl)(Panel_ShipInfo, "equipIconEmpty_Body"), [14] = (UI.getChildControl)(Panel_ShipInfo, "equipIconEmpty_AvatarSaddle"), [15] = (UI.getChildControl)(Panel_ShipInfo, "equipIconEmpty_AvatarHull"), [16] = (UI.getChildControl)(Panel_ShipInfo, "equipIconEmpty_AvatarWheel"), [26] = (UI.getChildControl)(Panel_ShipInfo, "equipIconEmpty_AvatarBody")}
, 
_slotText = {[3] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Ship_Armor_25"), [4] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Ship_Armor_4"), [5] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Ship_Armor_5"), [6] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Ship_Armor_6"), [25] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Ship_Armor_3"), [14] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Ship_Armor_13"), [15] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Ship_Armor_15"), [16] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Ship_Armor_16"), [26] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Ship_Armor_14")}
, 
_skill = {startX = 0, startY = 0, startIconX = 10, startIconY = 5, startNameX = 64, startNameY = 5, startDecX = 64, startDecY = 27, startExpBGX = 7, startExpBGY = 47, startExpX = 12, startExpY = 50, gapY = 52, count = 4}
}
, _buttonClose = (UI.getChildControl)(Panel_ShipInfo, "close_button"), _buttonQuestion = (UI.getChildControl)(Panel_ShipInfo, "Button_Question"), _staticName = (UI.getChildControl)(Panel_ShipInfo, "name_value"), _staticLevel = (UI.getChildControl)(Panel_ShipInfo, "Level_value"), _staticGaugeBar_Hp = (UI.getChildControl)(Panel_ShipInfo, "HP_GaugeBar"), _staticTextValue_Hp = (UI.getChildControl)(Panel_ShipInfo, "StaticText_HP_Value"), _mp = (UI.getChildControl)(Panel_ShipInfo, "MP"), _staticGaugeBar_Mp = (UI.getChildControl)(Panel_ShipInfo, "MP_GaugeBar"), _staticTextValue_Mp = (UI.getChildControl)(Panel_ShipInfo, "StaticText_MP_Value"), _staticTextValue_Sus = (UI.getChildControl)(Panel_ShipInfo, "StaticText_Sus_Value"), _staticGaugeBar_Weight = (UI.getChildControl)(Panel_ShipInfo, "Weight_Gauge"), _staticTextValue_Weight = (UI.getChildControl)(Panel_ShipInfo, "StaticText_Weight_Value"), _staticText_MaxMoveSpeedValue = (UI.getChildControl)(Panel_ShipInfo, "StaticText_MaxMoveSpeedValue"), _staticText_AccelerationValue = (UI.getChildControl)(Panel_ShipInfo, "StaticText_AccelerationValue"), _staticText_CorneringSpeedValue = (UI.getChildControl)(Panel_ShipInfo, "StaticText_CorneringSpeedValue"), _staticText_BrakeSpeedValue = (UI.getChildControl)(Panel_ShipInfo, "StaticText_BrakeSpeedValue"), _staticText_Value_Def = (UI.getChildControl)(Panel_ShipInfo, "StaticText_DefenceValue"), _staticSkillBG = (UI.getChildControl)(Panel_ShipInfo, "panel_skillInfo"), _skillScroll = (UI.getChildControl)(Panel_ShipInfo, "skill_scroll"), _deadCountValue = (UI.getChildControl)(Panel_ShipInfo, "StaticText_DeadCountValue"), _checkBtn_TotemShow = (UI.getChildControl)(Panel_ShipInfo, "CheckButton_EquipSlot_Totem"), _skillStart = 0, _skillCount = 0, _actorKeyRaw = nil, _armorName = (Array.new)(), _itemSlots = (Array.new)(), _skillSlots = (Array.new)()}
local _extendedSlotNoId = {}
local extendedSlotCheck = function(itemWrapper)
  -- function num : 0_2 , upvalues : _extendedSlotNoId, shipInfo
  local itemSSW = itemWrapper:getStaticStatus()
  local slotNoMax = itemSSW:getExtendedSlotCount()
  for i = 1, slotNoMax do
    local extendSlotNo = itemSSW:getExtendedSlotIndex(i - 1)
    if slotNoMax ~= extendSlotNo then
      (table.insert)(_extendedSlotNoId, extendSlotNo)
      ;
      ((shipInfo._itemSlots)[extendSlotNo]):setItem(itemWrapper)
      ;
      (((shipInfo._itemSlots)[extendSlotNo]).icon):SetMonoTone(true)
    end
  end
end

shipInfo.init = function(self)
  -- function num : 0_3
  for index,value in pairs((self._config)._slotNo) do
    local slot = {}
    slot.icon = (UI.getChildControl)(Panel_ShipInfo, ((self._config)._slotID)[value])
    ;
    (SlotItem.new)(slot, "ShipInfoEquipment_" .. value, value, Panel_ShipInfo, (self._config)._itemSlot)
    slot:createChild()
    ;
    (slot.icon):addInputEvent("Mouse_RUp", "ShipInfo_RClick(" .. value .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_LUp", "ShipInfo_LClick(" .. value .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_On", "ShipInfo_EquipItem_MouseOn(" .. value .. ", true)")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "ShipInfo_EquipItem_MouseOn(" .. value .. ", false)")
    Panel_Tooltip_Item_SetPosition(value, slot, "ServantShipEquipment")
    -- DECOMPILER ERROR at PC65: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self._itemSlots)[value] = slot
  end
end

shipInfo.updateHp = function(self)
  -- function num : 0_4
  local servantWrapper = getServantInfoFromActorKey(self._actorKeyRaw)
  if servantWrapper == nil then
    return 
  end
  ;
  (self._staticGaugeBar_Hp):SetSize(1.55 * (servantWrapper:getHp() / servantWrapper:getMaxHp() * 100), 4)
  ;
  (self._staticTextValue_Hp):SetText(makeDotMoney(servantWrapper:getHp()) .. " / " .. makeDotMoney(servantWrapper:getMaxHp()))
end

shipInfo.updateMp = function(self)
  -- function num : 0_5
  local servantWrapper = getServantInfoFromActorKey(self._actorKeyRaw)
  if servantWrapper == nil then
    return 
  end
  ;
  (self._staticGaugeBar_Mp):SetSize(1.55 * (servantWrapper:getMp() / servantWrapper:getMaxMp() * 100), 5)
  ;
  (self._staticTextValue_Mp):SetText(makeDotMoney(servantWrapper:getMp()) .. " / " .. makeDotMoney(servantWrapper:getMaxMp()))
end

shipInfo.update = function(self)
  -- function num : 0_6 , upvalues : _extendedSlotNoId, shipInfo, extendedSlotCheck
  local temporaryWrapper = getTemporaryInformationWrapper()
  local servantWrapper = temporaryWrapper:getUnsealVehicleByActorKeyRaw(self._actorKeyRaw)
  if servantWrapper == nil then
    return 
  end
  local vehicleInfo = getVehicleActor(self._actorKeyRaw)
  if vehicleInfo == nil then
    return 
  end
  ;
  (self._staticName):SetText(servantWrapper:getName())
  ;
  (self._staticLevel):SetText(tostring(servantWrapper:getLevel()))
  ;
  (self._staticGaugeBar_Hp):SetSize(1.55 * (servantWrapper:getHp() / servantWrapper:getMaxHp() * 100), 4)
  ;
  (self._staticTextValue_Hp):SetText(makeDotMoney(servantWrapper:getHp()) .. " / " .. makeDotMoney(servantWrapper:getMaxHp()))
  ;
  (self._staticGaugeBar_Mp):SetSize(1.55 * (servantWrapper:getMp() / servantWrapper:getMaxMp() * 100), 5)
  ;
  (self._staticTextValue_Mp):SetText(makeDotMoney(servantWrapper:getMp()) .. " / " .. makeDotMoney(servantWrapper:getMaxMp()))
  ;
  (self._staticTextValue_Sus):SetText(servantWrapper:getSuspension())
  local max_weight = Int64toInt32(servantWrapper:getMaxWeight_s64() / (Defines.s64_const).s64_10000)
  local total_weight = Int64toInt32((servantWrapper:getInventoryWeight_s64() + servantWrapper:getEquipWeight_s64() + servantWrapper:getMoneyWeight_s64()) / (Defines.s64_const).s64_10000)
  local weightPercent = total_weight / max_weight * 100
  local weightValue = ""
  if max_weight < total_weight then
    weightPercent = 100
    weightValue = "<PAColor0xFFD20000>" .. makeDotMoney(total_weight) .. "<PAOldColor> / " .. makeDotMoney(max_weight)
  else
    weightValue = makeDotMoney(total_weight) .. " / " .. makeDotMoney(max_weight)
  end
  ;
  (self._staticGaugeBar_Weight):SetSize(weightPercent * 155 / 100, 4)
  ;
  (self._staticTextValue_Weight):SetText(weightValue)
  ;
  (self._staticText_MaxMoveSpeedValue):SetText((string.format)("%.1f", servantWrapper:getStat((CppEnums.ServantStatType).Type_MaxMoveSpeed) / 10000) .. "%")
  ;
  (self._staticText_AccelerationValue):SetText((string.format)("%.1f", servantWrapper:getStat((CppEnums.ServantStatType).Type_Acceleration) / 10000) .. "%")
  ;
  (self._staticText_CorneringSpeedValue):SetText((string.format)("%.1f", servantWrapper:getStat((CppEnums.ServantStatType).Type_CorneringSpeed) / 10000) .. "%")
  ;
  (self._staticText_BrakeSpeedValue):SetText((string.format)("%.1f", servantWrapper:getStat((CppEnums.ServantStatType).Type_BrakeSpeed) / 10000) .. "%")
  ;
  (self._staticText_Value_Def):SetText(((vehicleInfo:get()):getEquipment()):getDefense())
  local vehicleType = servantWrapper:getVehicleType()
  if (CppEnums.VehicleType).Type_PersonTradeShip == vehicleType then
    (self._mp):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SERVANT_SHIPINFO_MP"))
  else
    ;
    (self._mp):SetText(PAGetString(Defines.StringSheet_RESOURCE, "STABLE_INFO_TEXT_HEART"))
  end
  local deadCount = servantWrapper:getDeadCount()
  ;
  (self._deadCountValue):SetText(deadCount)
  _extendedSlotNoId = {}
  for index,value in pairs((self._config)._slotNo) do
    local slot = (self._itemSlots)[value]
    local itemWrapper = servantWrapper:getEquipItem(value)
    if itemWrapper ~= nil then
      (((shipInfo._config)._slotEmptyBG)[value]):SetShow(false)
      slot:setItem(itemWrapper)
      ;
      (slot.icon):SetMonoTone(false)
      extendedSlotCheck(itemWrapper)
    else
      local isExtendedSlot = false
      for _,index in pairs(_extendedSlotNoId) do
        if value == index then
          isExtendedSlot = true
        end
      end
      if isExtendedSlot then
        (((shipInfo._config)._slotEmptyBG)[value]):SetShow(false)
      else
        slot:clearItem()
        ;
        (((shipInfo._config)._slotEmptyBG)[value]):SetShow(true)
      end
    end
  end
  ;
  (UIScroll.SetButtonSize)(self._skillScroll, ((self._config)._skill).count, self._skillCount)
end

shipInfo.registEventHandler = function(self)
  -- function num : 0_7
  (self._buttonClose):addInputEvent("Mouse_LUp", "ShipInfo_Close()")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelServantinfo\" )")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelServantinfo\", \"true\")")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelServantinfo\", \"false\")")
  ;
  (self._staticSkillBG):addInputEvent("Mouse_UpScroll", "ShipInfo_ScrollEvent( true )")
  ;
  (self._staticSkillBG):addInputEvent("Mouse_DownScroll", "ShipInfo_ScrollEvent( false )")
  ;
  (self._checkBtn_TotemShow):addInputEvent("Mouse_LUp", "ShipInfo_SetShowTotem()")
  ;
  (UIScroll.InputEvent)(self._skillScroll, "ShipInfo_ScrollEvent")
end

shipInfo.registMessageHandler = function(self)
  -- function num : 0_8
  registerEvent("EventSelfServantUpdate", "ShipInfo_Update()")
  registerEvent("EventSelfServantUpdateOnlyHp", "ShipInfo_UpdateHp")
  registerEvent("EventSelfServantUpdateOnlyMp", "ShipInfo_UpdateMp")
  registerEvent("EventServantEquipmentUpdate", "ShipInfo_Update()")
  registerEvent("EventServantEquipItem", "ShipInfo_ChangeEquipItem")
end

ShipInfo_ChangeEquipItem = function(slotNo)
  -- function num : 0_9 , upvalues : shipInfo, UI_VT
  ShipInfo_SetShowTotem()
  local self = shipInfo
  local slot = (self._itemSlots)[slotNo]
  if self._actorKeyRaw == nil then
    return 
  end
  local temporaryWrapper = getTemporaryInformationWrapper()
  local vehicleWrapper = temporaryWrapper:getUnsealVehicleByActorKeyRaw(self._actorKeyRaw)
  if vehicleWrapper == nil then
    return 
  end
  local vehicleType = vehicleWrapper:getVehicleType()
  if UI_VT.Type_Boat ~= vehicleType or UI_VT.Type_Raft ~= vehicleType or UI_VT.Type_FishingBoat ~= vehicleType or UI_VT.Type_SailingBoat ~= vehicleType or UI_VT.Type_PersonalBattleShip ~= vehicleType then
    return 
  end
  ;
  (slot.icon):AddEffect("UI_ItemInstall", false, 0, 0)
  ;
  (slot.icon):AddEffect("fUI_SkillButton01", false, 0, 0)
  local itemWrapper = vehicleWrapper:getEquipItem(slotNo)
  if itemWrapper == nil then
    return 
  end
  local defence = (itemWrapper:getStaticStatus()):getDefence(0)
  if defence > 0 then
    (self._staticText_Value_Def):AddEffect("fUI_SkillButton01", false, -6, 2)
    ;
    (self._staticText_Value_Def):AddEffect("UI_SkillButton01", false, -6, 2)
  end
end

ShipInfo_RClick = function(slotNo)
  -- function num : 0_10 , upvalues : shipInfo
  local self = shipInfo
  local temporaryWrapper = getTemporaryInformationWrapper()
  if temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Ship) == nil then
    return 
  end
  local servantWrapper = temporaryWrapper:getUnsealVehicleByActorKeyRaw(self._actorKeyRaw)
  if servantWrapper == nil then
    return 
  end
  local itemWrapper = servantWrapper:getEquipItem(slotNo)
  if itemWrapper == nil then
    return 
  end
  servant_doUnequip(servantWrapper:getActorKeyRaw(), slotNo)
end

ShipInfo_LClick = function(slotNo)
  -- function num : 0_11
  if DragManager.dragStartPanel == Panel_Window_Inventory then
    Inventory_SlotRClick(DragManager.dragSlotInfo)
    ;
    (DragManager.clearInfo)()
  end
end

ShipInfo_EquipItem_MouseOn = function(slotNo, isOn)
  -- function num : 0_12 , upvalues : shipInfo
  local self = shipInfo
  local slot = (self._itemSlots)[slotNo]
  Panel_Tooltip_Item_SetPosition(slotNo, slot, "ServantShipEquipment")
  Panel_Tooltip_Item_Show_GeneralNormal(slotNo, "ServantShipEquipment", isOn)
end

ShipInfo_SetShowTotem = function()
  -- function num : 0_13 , upvalues : shipInfo
  local self = shipInfo
  local temporaryWrapper = getTemporaryInformationWrapper()
  local seaVehicleWrapper = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Ship)
  if seaVehicleWrapper == nil then
    return 
  end
  local isCheck = (self._checkBtn_TotemShow):IsCheck()
  if isCheck then
    ToClient_SetVehicleEquipSlotFlag(seaVehicleWrapper:getVehicleType(), ((self._config)._checkFlag)[6])
  else
    ToClient_ResetVehicleEquipSlotFlag(seaVehicleWrapper:getVehicleType(), ((self._config)._checkFlag)[6])
  end
  ToClient_setShowVehicleEquip((CppEnums.ServantType).Type_Ship)
end

ShipInfo_ScrollEvent = function(isScrollUp)
  -- function num : 0_14 , upvalues : shipInfo
  local self = shipInfo
  self._skillStart = (UIScroll.ScrollEvent)(self._skillScroll, isScrollUp, ((self._config)._skill).count, self._skillCount, self._skillStart, 1)
  self:update()
end

ShipInfo_OpenByActorKeyRaw = function(actorKeyRaw)
  -- function num : 0_15 , upvalues : shipInfo
  local self = shipInfo
  self._actorKeyRaw = actorKeyRaw
  ShipInfo_Open()
end

ShipInfo_GetActorKey = function()
  -- function num : 0_16 , upvalues : shipInfo
  local self = shipInfo
  return self._actorKeyRaw
end

ShipInfo_Update = function()
  -- function num : 0_17 , upvalues : shipInfo
  if not Panel_ShipInfo:GetShow() then
    return 
  end
  local self = shipInfo
  self:update()
end

ShipInfo_UpdateHp = function()
  -- function num : 0_18 , upvalues : shipInfo
  if Panel_ShipInfo:GetShow() == false then
    return 
  end
  local self = shipInfo
  self:updateHp()
end

ShipInfo_UpdateMp = function()
  -- function num : 0_19 , upvalues : shipInfo
  if Panel_ShipInfo:GetShow() == false then
    return 
  end
  local self = shipInfo
  self:updateMp()
end

ShipInfo_Open = function()
  -- function num : 0_20 , upvalues : shipInfo
  local self = shipInfo
  self:update()
  if Panel_ShipInfo:GetShow() then
    return 
  end
  Panel_ShipInfo:SetShow(true, true)
  local servantWrapper = getServantInfoFromActorKey(self._actorKeyRaw)
  if servantWrapper ~= nil then
    local isCheck = ToClient_IsSetVehicleEquipSlotFlag(servantWrapper:getVehicleType(), ((self._config)._checkFlag)[6])
    ;
    (self._checkBtn_TotemShow):SetCheck(isCheck)
  end
end

ShipInfo_Close = function()
  -- function num : 0_21
  if not Panel_ShipInfo:GetShow() then
    return 
  end
  Panel_ShipInfo:SetShow(false, false)
end

shipInfo:init()
shipInfo:registEventHandler()
shipInfo:registMessageHandler()
FGlobal_PanelMove(Panel_ShipInfo, false)

