-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\panel_window_servantinfo_workership.luac 

-- params : ...
-- function num : 0
Panel_WorkerShipInfo:SetShow(false, false)
Panel_WorkerShipInfo:ActiveMouseEventEffect(true)
Panel_WorkerShipInfo:SetDragEnable(true)
Panel_WorkerShipInfo:setGlassBackground(true)
Panel_WorkerShipInfo:RegisterShowEventFunc(true, "WorkerShipInfoShowAni()")
Panel_WorkerShipInfo:RegisterShowEventFunc(false, "WorkerShipInfoHideAni()")
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
local UI_VT = CppEnums.VehicleType
local UI_TM = CppEnums.TextMode
WorkerShipInfoShowAni = function()
  -- function num : 0_0
  (UIAni.fadeInSCR_Right)(Panel_WorkerShipInfo)
  audioPostEvent_SystemUi(1, 0)
end

WorkerShipInfoHideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
  Panel_WorkerShipInfo:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_WorkerShipInfo:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
  audioPostEvent_SystemUi(1, 1)
end

local workerShipInfo = {
_config = {
_itemSlot = {createIcon = false, createBorder = true, createCount = true, createEnchant = true, createCash = true, createEnduranceIcon = true}
, 
_slotNo = {3, 4, 5, 12, 25, 14, 15, 16, 26}
, 
_slotID = {[3] = "equipIcon_hull", [4] = "equipIcon_gear", [5] = "equipIcon_wheel", [12] = "equipIcon_foot", [25] = "equipIcon_body", [14] = "equipIcon_AvatarSaddle", [15] = "equipIcon_AvatarHull", [16] = "equipIcon_AvatarWheel", [26] = "equipIcon_AvatarBody"}
, 
_slotEmptyBG = {[3] = (UI.getChildControl)(Panel_WorkerShipInfo, "equipIconEmpty_Hull"), [4] = (UI.getChildControl)(Panel_WorkerShipInfo, "equipIconEmpty_Gear"), [5] = (UI.getChildControl)(Panel_WorkerShipInfo, "equipIconEmpty_Wheel"), [12] = (UI.getChildControl)(Panel_WorkerShipInfo, "equipIconEmpty_foot"), [25] = (UI.getChildControl)(Panel_WorkerShipInfo, "equipIconEmpty_Body"), [14] = (UI.getChildControl)(Panel_WorkerShipInfo, "equipIconEmpty_AvatarSaddle"), [15] = (UI.getChildControl)(Panel_WorkerShipInfo, "equipIconEmpty_AvatarHull"), [16] = (UI.getChildControl)(Panel_WorkerShipInfo, "equipIconEmpty_AvatarWheel"), [26] = (UI.getChildControl)(Panel_WorkerShipInfo, "equipIconEmpty_AvatarBody")}
, 
_skill = {startX = 1, startY = 7, startIconX = 10, startIconY = 5, startNameX = 64, startNameY = 3, startConditionX = 64, startConditionY = 21, startDecX = 64, startDecY = 35, startExpBGX = 4, startExpBGY = -1, startExpX = 6, startExpY = 1, startExpStrX = 18, startExpStrY = 35, gapY = 57, count = 4}
}
, _buttonClose = (UI.getChildControl)(Panel_WorkerShipInfo, "close_button"), _buttonQuestion = (UI.getChildControl)(Panel_WorkerShipInfo, "Button_Question"), _staticName = (UI.getChildControl)(Panel_WorkerShipInfo, "name_value"), _lv_Title = (UI.getChildControl)(Panel_WorkerShipInfo, "Lv"), _staticLevel = (UI.getChildControl)(Panel_WorkerShipInfo, "Level_value"), _staticGaugeBar_Hp = (UI.getChildControl)(Panel_WorkerShipInfo, "HP_GaugeBar"), _staticTextValue_Hp = (UI.getChildControl)(Panel_WorkerShipInfo, "StaticText_HP_Value"), _staticGaugeBar_Mp = (UI.getChildControl)(Panel_WorkerShipInfo, "MP_GaugeBar"), _staticTextValue_Mp = (UI.getChildControl)(Panel_WorkerShipInfo, "StaticText_MP_Value"), _sus_Title = (UI.getChildControl)(Panel_WorkerShipInfo, "Sus"), _staticTextValue_Sus = (UI.getChildControl)(Panel_WorkerShipInfo, "StaticText_Sus_Value"), _staticGaugeBar_Weight = (UI.getChildControl)(Panel_WorkerShipInfo, "Weight_Gauge"), _staticTextValue_Weight = (UI.getChildControl)(Panel_WorkerShipInfo, "StaticText_Weight_Value"), _staticText_MaxMoveSpeedValue = (UI.getChildControl)(Panel_WorkerShipInfo, "StaticText_MaxMoveSpeedValue"), _staticText_AccelerationValue = (UI.getChildControl)(Panel_WorkerShipInfo, "StaticText_AccelerationValue"), _staticText_CorneringSpeedValue = (UI.getChildControl)(Panel_WorkerShipInfo, "StaticText_CorneringSpeedValue"), _staticText_BrakeSpeedValue = (UI.getChildControl)(Panel_WorkerShipInfo, "StaticText_BrakeSpeedValue"), _staticText_Value_Def = (UI.getChildControl)(Panel_WorkerShipInfo, "StaticText_DefenceValue"), _staticSkilltitle = (UI.getChildControl)(Panel_WorkerShipInfo, "category_skillList"), _staticSkillBG = (UI.getChildControl)(Panel_WorkerShipInfo, "panel_skillInfo"), _skillScroll = (UI.getChildControl)(Panel_WorkerShipInfo, "skill_scroll"), _deadCountTitle = (UI.getChildControl)(Panel_WorkerShipInfo, "StaticText_DeadCount"), _deadCountValue = (UI.getChildControl)(Panel_WorkerShipInfo, "StaticText_DeadCountValue"), _vehicleAlert = (UI.getChildControl)(Panel_WorkerShipInfo, "StaticText_Alert"), _skillStart = 0, _skillCount = 0, _actorKeyRaw = nil, _itemSlots = (Array.new)(), _skillSlots = (Array.new)()}
local skillCondition = {}
local skillDescArray = {}
;
(workerShipInfo._vehicleAlert):SetTextMode(UI_TM.eTextMode_AutoWrap)
;
(workerShipInfo._vehicleAlert):SetText((workerShipInfo._vehicleAlert):GetText())
workerShipInfo.init = function(self)
  -- function num : 0_2 , upvalues : UI_TM
  (self._skillScroll):SetControlPos(0)
  for index,value in pairs((self._config)._slotNo) do
    local slot = {}
    slot.icon = (UI.getChildControl)(Panel_WorkerShipInfo, ((self._config)._slotID)[value])
    ;
    (SlotItem.new)(slot, "ShipInfoEquipment_" .. value, value, Panel_WorkerShipInfo, (self._config)._itemSlot)
    slot:createChild()
    ;
    (slot.icon):addInputEvent("Mouse_RUp", "WorkerShipInfo_RClick(" .. value .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_LUp", "WorkerShipInfo_LClick(" .. value .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_On", "WorkerShipInfo_EquipItem_MouseOn(" .. value .. ", true)")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "WorkerShipInfo_EquipItem_MouseOn(" .. value .. ", false)")
    Panel_Tooltip_Item_SetPosition(value, slot, "ServantShipEquipment")
    -- DECOMPILER ERROR at PC69: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self._itemSlots)[value] = slot
  end
  for ii = 0, ((self._config)._skill).count - 1 do
    local slot = {}
    slot.button = (UI.createAndCopyBasePropertyControl)(Panel_WorkerShipInfo, "skill_static", self._staticSkillBG, "WorkerShipInfo_Skill_" .. ii)
    slot.expBG = (UI.createAndCopyBasePropertyControl)(Panel_WorkerShipInfo, "Static_Texture_Learn_Background", slot.button, "WorkerShipInfo_Skill_ExpBG_" .. ii)
    slot.exp = (UI.createAndCopyBasePropertyControl)(Panel_WorkerShipInfo, "SkillLearn_Gauge", slot.button, "WorkerShipInfo_Skill_Exp_" .. ii)
    slot.skillBG = (UI.createAndCopyBasePropertyControl)(Panel_WorkerShipInfo, "Static_SkillbyBG", slot.button, "WorkerShipInfo_Skill_BG_" .. ii)
    slot.icon = (UI.createAndCopyBasePropertyControl)(Panel_WorkerShipInfo, "skill_icon", slot.button, "WorkerShipInfo_Skill_Icon_" .. ii)
    slot.expText = (UI.createAndCopyBasePropertyControl)(Panel_WorkerShipInfo, "SkillLearn_PercentString", slot.button, "WorkerShipInfo_Skill_ExpStr_" .. ii)
    slot.name = (UI.createAndCopyBasePropertyControl)(Panel_WorkerShipInfo, "skill_name", slot.button, "WorkerShipInfo_Skill_Name_" .. ii)
    slot.condition = (UI.createAndCopyBasePropertyControl)(Panel_WorkerShipInfo, "StaticText_SkillCondition", slot.button, "WorkerShipInfo_Skill_Condition_" .. ii)
    slot.dec = (UI.createAndCopyBasePropertyControl)(Panel_WorkerShipInfo, "skill_condition", slot.button, "WorkerShipInfo_Skill_Dec_" .. ii)
    local skillConfig = (self._config)._skill
    ;
    (slot.button):SetPosX(skillConfig.startX)
    ;
    (slot.button):SetPosY(skillConfig.startY + skillConfig.gapY * ii)
    ;
    (slot.skillBG):SetPosX(3)
    ;
    (slot.skillBG):SetPosY(0)
    ;
    (slot.icon):SetPosX(skillConfig.startIconX)
    ;
    (slot.icon):SetPosY(skillConfig.startIconY)
    ;
    (slot.expText):SetPosX(skillConfig.startExpStrX)
    ;
    (slot.expText):SetPosY(skillConfig.startExpStrY)
    ;
    (slot.name):SetPosX(skillConfig.startNameX)
    ;
    (slot.name):SetPosY(skillConfig.startNameY)
    ;
    (slot.condition):SetPosX(skillConfig.startConditionX)
    ;
    (slot.condition):SetPosY(skillConfig.startConditionY)
    ;
    (slot.dec):SetPosX(skillConfig.startDecX)
    ;
    (slot.dec):SetPosY(skillConfig.startDecY)
    ;
    (slot.expBG):SetPosX(skillConfig.startExpBGX)
    ;
    (slot.expBG):SetPosY(skillConfig.startExpBGY)
    ;
    (slot.exp):SetPosX(skillConfig.startExpX)
    ;
    (slot.exp):SetPosY(skillConfig.startExpY)
    ;
    (slot.condition):SetTextMode(UI_TM.eTextMode_LimitText)
    ;
    (slot.dec):SetTextMode(UI_TM.eTextMode_LimitText)
    ;
    (slot.expText):SetShow(false)
    ;
    (slot.expBG):SetShow(false)
    ;
    (slot.exp):SetShow(false)
    ;
    (UIScroll.InputEventByControl)(slot.button, "WorkerShipInfo_ScrollEvent")
    -- DECOMPILER ERROR at PC275: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self._skillSlots)[ii] = slot
  end
  ;
  (self._sus_Title):SetShow(false)
  ;
  (self._staticTextValue_Sus):SetShow(false)
  ;
  (self._lv_Title):SetShow(false)
  ;
  (self._staticLevel):SetShow(false)
end

workerShipInfo.clear = function(self)
  -- function num : 0_3
  self._skillStart = 0
  self._skillCount = 0
end

workerShipInfo.updateHp = function(self)
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

workerShipInfo.updateMp = function(self)
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

workerShipInfo.update = function(self)
  -- function num : 0_6 , upvalues : UI_VT, skillCondition, skillDescArray
  local servantWrapper = getServantInfoFromActorKey(self._actorKeyRaw)
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
  (self._staticGaugeBar_Hp):SetSize(1.55 * (servantWrapper:getHp() / servantWrapper:getMaxHp() * 100), 4)
  ;
  (self._staticTextValue_Hp):SetText(makeDotMoney(servantWrapper:getHp()) .. " / " .. makeDotMoney(servantWrapper:getMaxHp()))
  ;
  (self._staticGaugeBar_Mp):SetSize(1.55 * (servantWrapper:getMp() / servantWrapper:getMaxMp() * 100), 5)
  ;
  (self._staticTextValue_Mp):SetText(makeDotMoney(servantWrapper:getMp()) .. " / " .. makeDotMoney(servantWrapper:getMaxMp()))
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
  local deadCount = servantWrapper:getDeadCount()
  ;
  (self._deadCountValue):SetText(deadCount * 10 .. "%")
  local vehicleType = servantWrapper:getVehicleType()
  if UI_VT.Type_PersonTradeShip == vehicleType or UI_VT.Type_PersonalBattleShip == vehicleType then
    (self._deadCountTitle):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SHIPINFO_DEADCOUNT"))
    ;
    (self._deadCountValue):SetText(deadCount)
  end
  for index,value in pairs((self._config)._slotNo) do
    local slot = (self._itemSlots)[value]
    local itemWrapper = servantWrapper:getEquipItem(value)
    if itemWrapper ~= nil then
      (((self._config)._slotEmptyBG)[value]):SetShow(false)
      slot:setItem(itemWrapper)
    else
      slot:clearItem()
      ;
      (((self._config)._slotEmptyBG)[value]):SetShow(true)
    end
  end
  self._skillCount = 0
  for ii = 0, ((self._config)._skill).count - 1 do
    local slot = (self._skillSlots)[ii]
    ;
    (slot.button):SetShow(false)
  end
  local slotNo = 0
  local skillCount = servantWrapper:getSkillCount()
  for ii = 1, skillCount - 1 do
    local skillWrapper = servantWrapper:getSkill(ii)
    if skillWrapper ~= nil then
      if self._skillStart <= self._skillCount and slotNo < ((self._config)._skill).count then
        local expTxt = (math.floor)(servantWrapper:getSkillExp(ii) / ((skillWrapper:get())._maxExp / 100))
        if expTxt >= 100 then
          expTxt = 100
        end
        local slot = (self._skillSlots)[slotNo]
        ;
        (slot.icon):ChangeTextureInfoName("Icon/" .. skillWrapper:getIconPath())
        local skillName = skillWrapper:getName()
        local startIndex = (string.find)(skillName, " ")
        local endIndex = (string.find)(skillName, ")")
        if startIndex == nil then
          startIndex = 1
        end
        local onlySkillName = (string.sub)(skillName, 1, startIndex - 1)
        -- DECOMPILER ERROR at PC344: Confused about usage of register: R22 in 'UnsetPending'

        if startIndex ~= nil and endIndex ~= nil then
          skillCondition[ii] = (string.sub)(skillWrapper:getName(), startIndex + 2, endIndex - 1)
          ;
          (slot.name):SetText(onlySkillName)
          ;
          (slot.condition):SetText(skillCondition[ii])
          if (slot.condition):GetTextSizeX() > 140 then
            (slot.condition):addInputEvent("Mouse_On", "WorkerShipInfo_Simpletooltip( true, " .. slotNo .. ", " .. ii .. ", 0 )")
            ;
            (slot.condition):addInputEvent("Mouse_Out", "WorkerShipInfo_Simpletooltip( false, " .. slotNo .. "," .. ii .. ", 0 )")
          else
            ;
            (slot.condition):addInputEvent("Mouse_On", "")
            ;
            (slot.condition):addInputEvent("Mouse_Out", "")
          end
        end
        ;
        (slot.dec):SetText(skillWrapper:getDescription())
        -- DECOMPILER ERROR at PC398: Confused about usage of register: R22 in 'UnsetPending'

        skillDescArray[ii] = skillWrapper:getDescription()
        if (slot.dec):GetTextSizeX() > 140 then
          (slot.dec):addInputEvent("Mouse_On", "WorkerShipInfo_Simpletooltip( true, " .. slotNo .. ", " .. ii .. ", 1 )")
          ;
          (slot.dec):addInputEvent("Mouse_Out", "WorkerShipInfo_Simpletooltip( false, " .. slotNo .. "," .. ii .. ", 1 )")
        else
          ;
          (slot.dec):addInputEvent("Mouse_On", "")
          ;
          (slot.dec):addInputEvent("Mouse_Out", "")
        end
        ;
        (slot.condition):addInputEvent("Mouse_UpScroll", "WorkerShipInfo_ScrollEvent( true )")
        ;
        (slot.condition):addInputEvent("Mouse_DownScroll", "WorkerShipInfo_ScrollEvent( false )")
        ;
        (slot.dec):addInputEvent("Mouse_UpScroll", "WorkerShipInfo_ScrollEvent( true )")
        ;
        (slot.dec):addInputEvent("Mouse_DownScroll", "WorkerShipInfo_ScrollEvent( false )")
        ;
        (slot.exp):SetProgressRate(servantWrapper:getSkillExp(ii) / ((skillWrapper:get())._maxExp / 100))
        ;
        (slot.exp):SetAniSpeed(0)
        ;
        (slot.expText):SetText(expTxt .. "%")
        ;
        (slot.button):SetShow(true)
        slotNo = slotNo + 1
      end
      do
        do
          self._skillCount = self._skillCount + 1
          -- DECOMPILER ERROR at PC484: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC484: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC484: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  ;
  (self._staticSkilltitle):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANTINFO_SKILLCOUNT", "servantSkillListCnt", self._skillCount))
  ;
  (UIScroll.SetButtonSize)(self._skillScroll, ((self._config)._skill).count, self._skillCount)
end

WorkerShipInfo_Simpletooltip = function(isShow, index, conditionIndex, tipType)
  -- function num : 0_7 , upvalues : workerShipInfo, skillCondition, skillDescArray
  local self = workerShipInfo
  local name, desc, control = nil, nil, nil
  if tipType == 0 then
    name = skillCondition[conditionIndex]
    control = ((self._skillSlots)[index]).condition
  else
    if tipType == 1 then
      name = skillDescArray[conditionIndex]
      control = ((self._skillSlots)[index]).dec
    end
  end
  if isShow == true then
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

workerShipInfo.registEventHandler = function(self)
  -- function num : 0_8
  (self._buttonClose):addInputEvent("Mouse_LUp", "WorkerShipInfo_Close()")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelServantinfo\" )")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelServantinfo\", \"true\")")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelServantinfo\", \"false\")")
  ;
  (self._staticSkillBG):addInputEvent("Mouse_UpScroll", "WorkerShipInfo_ScrollEvent( true )")
  ;
  (self._staticSkillBG):addInputEvent("Mouse_DownScroll", "WorkerShipInfo_ScrollEvent( false )")
  ;
  (UIScroll.InputEvent)(self._skillScroll, "WorkerShipInfo_ScrollEvent")
end

workerShipInfo.registMessageHandler = function(self)
  -- function num : 0_9
  registerEvent("EventSelfServantUpdate", "WorkerShipInfo_Update()")
  registerEvent("EventSelfServantUpdateOnlyHp", "WorkerShipInfo_UpdateHp")
  registerEvent("EventSelfServantUpdateOnlyMp", "WorkerShipInfo_UpdateMp")
  registerEvent("EventServantEquipmentUpdate", "WorkerShipInfo_Update()")
  registerEvent("EventServantEquipItem", "WorkerShipInfo_ChangeEquipItem")
end

WorkerShipInfo_ChangeEquipItem = function(slotNo)
  -- function num : 0_10 , upvalues : workerShipInfo, UI_VT
  local self = workerShipInfo
  local slot = (self._itemSlots)[slotNo]
  if self._actorKeyRaw == nil then
    return 
  end
  local vehicleWrapper = getServantInfoFromActorKey(self._actorKeyRaw)
  if vehicleWrapper == nil then
    return 
  end
  local vehicleType = vehicleWrapper:getVehicleType()
  if UI_VT.Type_Boat ~= vehicleType or UI_VT.Type_Raft ~= vehicleType or UI_VT.Type_FishingBoat ~= vehicleType then
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

WorkerShipInfo_RClick = function(slotNo)
  -- function num : 0_11 , upvalues : workerShipInfo
  local self = workerShipInfo
  local servantWrapper = getServantInfoFromActorKey(self._actorKeyRaw)
  if servantWrapper == nil then
    return 
  end
  local itemWrapper = servantWrapper:getEquipItem(slotNo)
  if itemWrapper == nil then
    return 
  end
  servant_doUnequip(servantWrapper:getActorKeyRaw(), slotNo)
end

WorkerShipInfo_LClick = function(slotNo)
  -- function num : 0_12
  if DragManager.dragStartPanel == Panel_Window_Inventory then
    Inventory_SlotRClick(DragManager.dragSlotInfo)
    ;
    (DragManager.clearInfo)()
  end
end

WorkerShipInfo_EquipItem_MouseOn = function(slotNo, isOn)
  -- function num : 0_13 , upvalues : workerShipInfo
  local self = workerShipInfo
  local slot = (self._itemSlots)[slotNo]
  Panel_Tooltip_Item_SetPosition(slotNo, slot, "ServantShipEquipment")
  Panel_Tooltip_Item_Show_GeneralNormal(slotNo, "ServantShipEquipment", isOn)
end

WorkerShipInfo_ScrollEvent = function(isScrollUp)
  -- function num : 0_14 , upvalues : workerShipInfo
  local self = workerShipInfo
  self._skillStart = (UIScroll.ScrollEvent)(self._skillScroll, isScrollUp, ((self._config)._skill).count, self._skillCount, self._skillStart, 1)
  self:update()
  TooltipSimple_Hide()
end

WorkerShipInfo_OpenByActorKeyRaw = function(actorKeyRaw)
  -- function num : 0_15 , upvalues : workerShipInfo
  local self = workerShipInfo
  self._actorKeyRaw = actorKeyRaw
  WorkerShipInfo_Open()
end

WorkerShipInfo_GetActorKey = function()
  -- function num : 0_16 , upvalues : workerShipInfo
  local self = workerShipInfo
  return self._actorKeyRaw
end

WorkerShipInfo_Update = function()
  -- function num : 0_17 , upvalues : workerShipInfo
  if not Panel_WorkerShipInfo:GetShow() then
    return 
  end
  local self = workerShipInfo
  self:update()
end

WorkerShipInfo_UpdateHp = function()
  -- function num : 0_18 , upvalues : workerShipInfo
  if Panel_WorkerShipInfo:GetShow() == false then
    return 
  end
  local self = workerShipInfo
  self:updateHp()
end

WorkerShipInfo_UpdateMp = function()
  -- function num : 0_19 , upvalues : workerShipInfo
  if Panel_WorkerShipInfo:GetShow() == false then
    return 
  end
  local self = workerShipInfo
  self:updateMp()
end

WorkerShipInfo_Open = function()
  -- function num : 0_20 , upvalues : workerShipInfo, skillCondition, skillDescArray
  local self = workerShipInfo
  self:clear()
  skillCondition = {}
  skillDescArray = {}
  self:update()
  if Panel_WorkerShipInfo:GetShow() then
    TooltipSimple_Hide()
    Panel_WorkerShipInfo:SetShow(false, false)
    return 
  end
  Panel_WorkerShipInfo:SetShow(true, true)
  ;
  (self._skillScroll):SetControlTop()
end

WorkerShipInfo_Close = function()
  -- function num : 0_21
  if not Panel_WorkerShipInfo:GetShow() then
    return 
  end
  TooltipSimple_Hide()
  Panel_WorkerShipInfo:SetShow(false, false)
end

workerShipInfo:init()
workerShipInfo:registEventHandler()
workerShipInfo:registMessageHandler()
FGlobal_PanelMove(Panel_WorkerShipInfo, false)

