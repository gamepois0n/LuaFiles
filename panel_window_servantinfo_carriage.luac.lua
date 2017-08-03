-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\panel_window_servantinfo_carriage.luac 

-- params : ...
-- function num : 0
Panel_CarriageInfo:SetShow(false, false)
Panel_CarriageInfo:ActiveMouseEventEffect(true)
Panel_CarriageInfo:SetDragEnable(true)
Panel_CarriageInfo:setGlassBackground(true)
Panel_CarriageInfo:RegisterShowEventFunc(true, "CarriageInfoShowAni()")
Panel_CarriageInfo:RegisterShowEventFunc(false, "CarriageInfoHideAni()")
Panel_LinkedHorse_Skill:SetShow(false)
Panel_LinkedHorse_Skill:ActiveMouseEventEffect(true)
Panel_LinkedHorse_Skill:SetDragEnable(true)
Panel_LinkedHorse_Skill:setGlassBackground(true)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
local UI_VT = CppEnums.VehicleType
CarriageInfoShowAni = function()
  -- function num : 0_0
  (UIAni.fadeInSCR_Right)(Panel_CarriageInfo)
  audioPostEvent_SystemUi(1, 0)
end

CarriageInfoHideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
  Panel_CarriageInfo:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_CarriageInfo:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
  audioPostEvent_SystemUi(1, 1)
end

local carriageInfo = {
_config = {
_itemSlot = {createIcon = false, createBorder = true, createCount = true, createEnchant = true, createCash = true, createEnduranceIcon = true}
, 
_slotNo = {3, 4, 5, 6, 13, 25, 14, 15, 16, 17, 26}
, 
_slotID = {[3] = "equipIcon_body", [4] = "equipIcon_cover", [5] = "equipIcon_flag", [6] = "equipIcon_mark", [13] = "equipIcon_lamp", [25] = "equipIcon_wheel", [14] = "equipIcon_AvatarBody", [15] = "equipIcon_AvatarCover", [16] = "equipIcon_AvatarFlag", [17] = "equipIcon_AvatarMark", [26] = "equipIcon_AvatarWheel"}
, 
_slotBG = {[3] = (UI.getChildControl)(Panel_CarriageInfo, "equipSlot_wheel")}
, 
_slotEmptyBG = {[3] = (UI.getChildControl)(Panel_CarriageInfo, "equipIconEmpty_body"), [4] = (UI.getChildControl)(Panel_CarriageInfo, "equipIconEmpty_cover"), [5] = (UI.getChildControl)(Panel_CarriageInfo, "equipIconEmpty_flag"), [6] = (UI.getChildControl)(Panel_CarriageInfo, "equipIconEmpty_mark"), [13] = (UI.getChildControl)(Panel_CarriageInfo, "equipIconEmpty_lamp"), [25] = (UI.getChildControl)(Panel_CarriageInfo, "equipIconEmpty_wheel"), [14] = (UI.getChildControl)(Panel_CarriageInfo, "equipIconEmpty_AvatarBody"), [15] = (UI.getChildControl)(Panel_CarriageInfo, "equipIconEmpty_AvatarCover"), [16] = (UI.getChildControl)(Panel_CarriageInfo, "equipIconEmpty_AvatarFlag"), [17] = (UI.getChildControl)(Panel_CarriageInfo, "equipIconEmpty_AvatarMark"), [26] = (UI.getChildControl)(Panel_CarriageInfo, "equipIconEmpty_AvatarWheel")}
, 
_slotText = {[3] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Carriage_Armor_25"), [4] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Carriage_Armor_4"), [5] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Carriage_Armor_5"), [6] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Carriage_Armor_6"), [13] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Carriage_Armor_13"), [25] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Carriage_Armor_3"), [14] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Carriage_Armor_26"), [15] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Carriage_Armor_15"), [16] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Carriage_Armor_16"), [17] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Carriage_Armor_17"), [26] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Carriage_Armor_14")}
, 
_skill = {startX = 0, startY = 0, startIconX = 10, startIconY = 5, startNameX = 64, startNameY = 5, startDecX = 64, startDecY = 27, startExpBGX = 7, startExpBGY = 47, startExpX = 12, startExpY = 50, gapY = 52, count = 4}
}
, _buttonClose = (UI.getChildControl)(Panel_CarriageInfo, "close_button"), _buttonQuestion = (UI.getChildControl)(Panel_CarriageInfo, "Button_Question"), _staticName = (UI.getChildControl)(Panel_CarriageInfo, "name_value"), _staticLevelTitle = (UI.getChildControl)(Panel_CarriageInfo, "Lv"), _staticLevel = (UI.getChildControl)(Panel_CarriageInfo, "Level_value"), _staticGaugeBar_Hp = (UI.getChildControl)(Panel_CarriageInfo, "HP_GaugeBar"), _staticTextValue_Hp = (UI.getChildControl)(Panel_CarriageInfo, "StaticText_HP_Value"), _staticGaugeBar_Mp = (UI.getChildControl)(Panel_CarriageInfo, "MP_GaugeBar"), _staticTextValue_Mp = (UI.getChildControl)(Panel_CarriageInfo, "StaticText_MP_Value"), _staticTextTitle_Sus = (UI.getChildControl)(Panel_CarriageInfo, "Sus"), _staticTextValue_Sus = (UI.getChildControl)(Panel_CarriageInfo, "StaticText_Sus_Value"), _staticGaugeBar_Weight = (UI.getChildControl)(Panel_CarriageInfo, "Weight_Gauge"), _staticTextValue_Weight = (UI.getChildControl)(Panel_CarriageInfo, "StaticText_Weight_Value"), _staticText_MaxMoveSpeedValue = (UI.getChildControl)(Panel_CarriageInfo, "StaticText_MaxMoveSpeedValue"), _staticText_AccelerationValue = (UI.getChildControl)(Panel_CarriageInfo, "StaticText_AccelerationValue"), _staticText_CorneringSpeedValue = (UI.getChildControl)(Panel_CarriageInfo, "StaticText_CorneringSpeedValue"), _staticText_BrakeSpeedValue = (UI.getChildControl)(Panel_CarriageInfo, "StaticText_BrakeSpeedValue"), _staticText_Value_Def = (UI.getChildControl)(Panel_CarriageInfo, "StaticText_DefenceValue"), _deadCountValue = (UI.getChildControl)(Panel_CarriageInfo, "StaticText_DeadCountValue"), _carriageHorseBg = (UI.getChildControl)(Panel_CarriageInfo, "Static_CarriageHorseBg"), _carriageHorseSlot = (UI.getChildControl)(Panel_CarriageInfo, "Static_CarriageHorseSlot"), _carriageHorse_Name = (UI.getChildControl)(Panel_CarriageInfo, "StaticText_CarriageHorse_Name"), _btn_Skill = (UI.getChildControl)(Panel_CarriageInfo, "Button_Skill"), _horse_Level = (UI.getChildControl)(Panel_CarriageInfo, "StaticText_Horse_Level"), _EXP_CountData = (UI.getChildControl)(Panel_CarriageInfo, "Horse_EXP_CountData"), _EXP_Bg = (UI.getChildControl)(Panel_CarriageInfo, "Horse_EXP_Bg"), _EXP_GaugeBar = (UI.getChildControl)(Panel_CarriageInfo, "Horse_EXP_GaugeBar"), _horseTier = (UI.getChildControl)(Panel_CarriageInfo, "StaticText_LinkedHorse_Tier"), _maxCountValue = (UI.getChildControl)(Panel_CarriageInfo, "StaticText_MaxCountValue"), _skillBg = (UI.getChildControl)(Panel_LinkedHorse_Skill, "Static_SkillBg"), _skillIcon = (UI.getChildControl)(Panel_LinkedHorse_Skill, "Static_SkillIcon"), _skillCondition = (UI.getChildControl)(Panel_LinkedHorse_Skill, "StaticText_SkillCondition"), _skillName = (UI.getChildControl)(Panel_LinkedHorse_Skill, "StaticText_SkillName"), _skillPercent = (UI.getChildControl)(Panel_LinkedHorse_Skill, "StaticText_LearningPercent"), _skillGaugeBg = (UI.getChildControl)(Panel_LinkedHorse_Skill, "Static_Texture_Learn_Background"), _skillGauge = (UI.getChildControl)(Panel_LinkedHorse_Skill, "Progress2_SkillLearn_Gauge"), _skillScroll = (UI.getChildControl)(Panel_LinkedHorse_Skill, "Scroll_Skill"), _staticSkillBG = (UI.getChildControl)(Panel_LinkedHorse_Skill, "Static_skillInfoBg"), 
_linkedHorseEquip = {
_slotNo = {3, 4, 5, 6, 12, 14, 15, 16, 17}
, 
_slotBg = {[3] = (UI.getChildControl)(Panel_LinkedHorse_Skill, "Static_EquipSlot_1"), [4] = (UI.getChildControl)(Panel_LinkedHorse_Skill, "Static_EquipSlot_2"), [5] = (UI.getChildControl)(Panel_LinkedHorse_Skill, "Static_EquipSlot_3"), [6] = (UI.getChildControl)(Panel_LinkedHorse_Skill, "Static_EquipSlot_4"), [12] = (UI.getChildControl)(Panel_LinkedHorse_Skill, "Static_EquipSlot_5"), [14] = (UI.getChildControl)(Panel_LinkedHorse_Skill, "Static_AvatarSlot_1"), [15] = (UI.getChildControl)(Panel_LinkedHorse_Skill, "Static_AvatarSlot_2"), [16] = (UI.getChildControl)(Panel_LinkedHorse_Skill, "Static_AvatarSlot_3"), [17] = (UI.getChildControl)(Panel_LinkedHorse_Skill, "Static_AvatarSlot_4")}
}
, _btnClose = (UI.getChildControl)(Panel_LinkedHorse_Skill, "Button_Close"), 
_linkedHorse = {}
, 
_linkedHorse_Skill = {}
, _gapY = 55, _skillStart = 0, _skillCount = 0, _actorKeyRaw = nil, _armorName = (Array.new)(), _itemSlots = (Array.new)(), _skillSlots = (Array.new)(), 
_linkedHorseEquipSlot = {}
}
local noLink = (UI.getChildControl)(Panel_CarriageInfo, "MultilineText_NoLink")
local noEquip = (UI.getChildControl)(Panel_CarriageInfo, "MultilineText_NoEquip")
local noAvator = (UI.getChildControl)(Panel_CarriageInfo, "MultilineText_NoAvator")
local _extendedSlotNoId = {}
local extendedSlotCheck = function(itemWrapper)
  -- function num : 0_2 , upvalues : _extendedSlotNoId, carriageInfo
  local itemSSW = itemWrapper:getStaticStatus()
  local slotNoMax = itemSSW:getExtendedSlotCount()
  for i = 1, slotNoMax do
    local extendSlotNo = itemSSW:getExtendedSlotIndex(i - 1)
    if slotNoMax ~= extendSlotNo then
      (table.insert)(_extendedSlotNoId, extendSlotNo)
      ;
      ((carriageInfo._itemSlots)[extendSlotNo]):setItem(itemWrapper)
      ;
      (((carriageInfo._itemSlots)[extendSlotNo]).icon):SetMonoTone(true)
    end
  end
end

carriageInfo.init = function(self)
  -- function num : 0_3 , upvalues : noLink, noEquip, noAvator
  for index,value in pairs((self._config)._slotNo) do
    local slot = {}
    slot.icon = (UI.getChildControl)(Panel_CarriageInfo, ((self._config)._slotID)[value])
    ;
    (SlotItem.new)(slot, "CarriageInfoEquipment_" .. value, value, Panel_CarriageInfo, (self._config)._itemSlot)
    slot:createChild()
    ;
    (slot.icon):addInputEvent("Mouse_RUp", "CarriageInfo_RClick(" .. value .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_LUp", "CarriageInfo_LClick(" .. value .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_On", "CarriageInfo_EquipItem_MouseOn(" .. value .. ", true)")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "CarriageInfo_EquipItem_MouseOn(" .. value .. ", false)")
    Panel_Tooltip_Item_SetPosition(value, slot, "ServantEquipment")
    -- DECOMPILER ERROR at PC65: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self._itemSlots)[value] = slot
    -- DECOMPILER ERROR at PC74: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self._armorName)[value] = (UI.getChildControl)(Panel_CarriageInfo, "StaticText_ArmorName" .. index)
  end
  for idx = 0, 3 do
    local temp = {}
    temp._carriageHorseBg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_CarriageInfo, "Static_CarriageHorseBg_" .. idx)
    CopyBaseProperty(self._carriageHorseBg, temp._carriageHorseBg)
    ;
    (temp._carriageHorseBg):SetPosY((self._carriageHorseBg):GetPosY() + self._gapY * idx)
    temp._carriageHorseSlot = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_CarriageInfo, "Static_CarriageHorseSlot_" .. idx)
    CopyBaseProperty(self._carriageHorseSlot, temp._carriageHorseSlot)
    ;
    (temp._carriageHorseSlot):SetPosY((self._carriageHorseSlot):GetPosY() + self._gapY * idx)
    temp._carriageHorse_Name = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_CarriageInfo, "StaticText_CarriageHorse_Name_" .. idx)
    CopyBaseProperty(self._carriageHorse_Name, temp._carriageHorse_Name)
    ;
    (temp._carriageHorse_Name):SetPosY((self._carriageHorse_Name):GetPosY() + self._gapY * idx)
    temp._btn_Skill = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, Panel_CarriageInfo, "Button_CarriageHorse_Skill_" .. idx)
    CopyBaseProperty(self._btn_Skill, temp._btn_Skill)
    ;
    (temp._btn_Skill):SetPosY((self._btn_Skill):GetPosY() + self._gapY * idx)
    ;
    (temp._btn_Skill):addInputEvent("Mouse_LUp", "HandleClicked_LinkedServant_SkillShow(" .. idx .. ", true )")
    temp._horse_Level = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_CarriageInfo, "StaticText_Horse_Level_" .. idx)
    CopyBaseProperty(self._horse_Level, temp._horse_Level)
    ;
    (temp._horse_Level):SetPosY((self._horse_Level):GetPosY() + self._gapY * idx)
    temp._EXP_CountData = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_CarriageInfo, "Horse_EXP_CountData_" .. idx)
    CopyBaseProperty(self._EXP_CountData, temp._EXP_CountData)
    ;
    (temp._EXP_CountData):SetPosY((self._EXP_CountData):GetPosY() + self._gapY * idx)
    temp._EXP_Bg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_CarriageInfo, "Horse_EXP_Bg_" .. idx)
    CopyBaseProperty(self._EXP_Bg, temp._EXP_Bg)
    ;
    (temp._EXP_Bg):SetPosY((self._EXP_Bg):GetPosY() + self._gapY * idx)
    temp._EXP_GaugeBar = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_CarriageInfo, "Horse_EXP_GaugeBar_" .. idx)
    CopyBaseProperty(self._EXP_GaugeBar, temp._EXP_GaugeBar)
    ;
    (temp._EXP_GaugeBar):SetPosY((self._EXP_GaugeBar):GetPosY() + self._gapY * idx)
    temp._tier = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_CarriageInfo, "Static_HorseTier_" .. idx)
    CopyBaseProperty(self._horseTier, temp._tier)
    ;
    (temp._tier):SetPosY((self._carriageHorseBg):GetPosY() + self._gapY * idx + 30)
    -- DECOMPILER ERROR at PC308: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._linkedHorse)[idx] = temp
  end
  for idx = 0, 3 do
    local tempSkill = {}
    tempSkill._skillBg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_LinkedHorse_Skill, "Static_SkillBg_" .. idx)
    CopyBaseProperty(self._skillBg, tempSkill._skillBg)
    ;
    (tempSkill._skillBg):SetPosY((self._skillBg):GetPosY() + self._gapY * idx + 30)
    tempSkill._skillIcon = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, tempSkill._skillBg, "Static_SkillIcon_" .. idx)
    CopyBaseProperty(self._skillIcon, tempSkill._skillIcon)
    ;
    (tempSkill._skillIcon):SetPosX(5)
    ;
    (tempSkill._skillIcon):SetPosY(0)
    ;
    (tempSkill._skillIcon):SetShow(true)
    tempSkill._skillCondition = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempSkill._skillBg, "Static_SkillCondition_" .. idx)
    CopyBaseProperty(self._skillCondition, tempSkill._skillCondition)
    ;
    (tempSkill._skillCondition):SetPosX((self._skillIcon):GetSizeX() + 15)
    ;
    (tempSkill._skillCondition):SetPosY(25)
    ;
    (tempSkill._skillCondition):SetShow(true)
    tempSkill._skillName = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempSkill._skillBg, "Static_SkillName_" .. idx)
    CopyBaseProperty(self._skillName, tempSkill._skillName)
    ;
    (tempSkill._skillName):SetPosX((self._skillIcon):GetSizeX() + 15)
    ;
    (tempSkill._skillName):SetPosY(0)
    ;
    (tempSkill._skillName):SetShow(true)
    tempSkill._skillPercent = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempSkill._skillBg, "Static_SkillPercent_" .. idx)
    CopyBaseProperty(self._skillPercent, tempSkill._skillPercent)
    ;
    (tempSkill._skillPercent):SetPosY(30)
    ;
    (tempSkill._skillPercent):SetShow(true)
    tempSkill._skillGaugeBg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, tempSkill._skillBg, "Static_SkillGaugeBg_" .. idx)
    CopyBaseProperty(self._skillGaugeBg, tempSkill._skillGaugeBg)
    ;
    (tempSkill._skillGaugeBg):SetPosX(3)
    ;
    (tempSkill._skillGaugeBg):SetPosY(45)
    ;
    (tempSkill._skillGaugeBg):SetShow(true)
    tempSkill._skillGauge = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_PROGRESS2, tempSkill._skillBg, "Static_SkillGauge_" .. idx)
    CopyBaseProperty(self._skillGauge, tempSkill._skillGauge)
    ;
    (tempSkill._skillGauge):SetPosX(8)
    ;
    (tempSkill._skillGauge):SetPosY(48)
    ;
    (tempSkill._skillGauge):SetShow(true)
    -- DECOMPILER ERROR at PC505: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._linkedHorse_Skill)[idx] = tempSkill
  end
  for index,value in pairs((self._linkedHorseEquip)._slotNo) do
    local temp = {}
    ;
    (SlotItem.new)(temp, "LinkedHorse_EquipSlot_" .. value, value, ((self._linkedHorseEquip)._slotBg)[value], (self._config)._itemSlot)
    temp:createChild()
    ;
    (temp.icon):SetPosX(4)
    ;
    (temp.icon):SetPosY(4)
    ;
    (temp.icon):addInputEvent("Mouse_On", "LinkedHorse_EquipItem_ShowTooltip(" .. value .. ")")
    ;
    (temp.icon):addInputEvent("Mouse_Out", "LinkedHorse_EquipItem_HideTooltip()")
    -- DECOMPILER ERROR at PC550: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self._linkedHorseEquipSlot)[value] = temp
  end
  noLink:SetShow(false)
  noEquip:SetShow(false)
  noAvator:SetShow(false)
end

carriageInfo.updateHp = function(self)
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

carriageInfo.updateMp = function(self)
  -- function num : 0_5
  local servantWrapper = getServantInfoFromActorKey(self._actorKeyRaw)
  if servantWrapper == nil then
    return 
  end
  ;
  (self._staticGaugeBar_Mp):SetSize(1.55 * (servantWrapper:getMp() / servantWrapper:getMaxMp() * 100), 4)
  ;
  (self._staticTextValue_Mp):SetText(makeDotMoney(servantWrapper:getMp()) .. " / " .. makeDotMoney(servantWrapper:getMaxMp()))
end

carriageInfo.update = function(self)
  -- function num : 0_6 , upvalues : _extendedSlotNoId, carriageInfo, extendedSlotCheck, UI_VT, noLink
  local servantWrapper = getServantInfoFromActorKey(self._actorKeyRaw)
  if servantWrapper == nil then
    return 
  end
  local vehicleInfo = getVehicleActor(self._actorKeyRaw)
  if vehicleInfo == nil then
    return 
  end
  local vehicleType = servantWrapper:getVehicleType()
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
  local deadCount = servantWrapper:getDeadCount()
  ;
  (self._deadCountValue):SetText(deadCount)
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
  _extendedSlotNoId = {}
  for index,value in pairs((self._config)._slotNo) do
    local slot = (self._itemSlots)[value]
    local slotText = (self._armorName)[value]
    local itemWrapper = servantWrapper:getEquipItem(value)
    if itemWrapper ~= nil then
      (((carriageInfo._config)._slotEmptyBG)[value]):SetShow(false)
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
        (((carriageInfo._config)._slotEmptyBG)[value]):SetShow(false)
      else
        slot:clearItem()
        ;
        (((carriageInfo._config)._slotEmptyBG)[value]):SetShow(true)
      end
    end
  end
  ;
  (self._maxCountValue):SetText("( " .. servantWrapper:getCurrentLinkCount() .. " / " .. servantWrapper:getLinkCount() .. " )")
  for li = 0, 3 do
    for v,control in pairs((self._linkedHorse)[li]) do
      control:SetShow(false)
    end
  end
  local trainVehicle = UI_VT.Type_Train == vehicleType
  noLink:SetShow(trainVehicle)
  ;
  (self._staticLevelTitle):SetShow(not trainVehicle)
  ;
  (self._staticLevel):SetShow(not trainVehicle)
  ;
  (self._staticTextTitle_Sus):SetShow(not trainVehicle)
  ;
  (self._staticTextValue_Sus):SetShow(not trainVehicle)
  for linkedIndex = 0, servantWrapper:getCurrentLinkCount() - 1 do
    for v,control in pairs((self._linkedHorse)[linkedIndex]) do
      control:SetShow(true)
    end
    local servantCount = servantWrapper:getLinkCount()
    for index = 0, servantCount - 1 do
      local sInfo = stable_getServantFromOwnerServant(servantWrapper:getServantNo(), index)
      if sInfo ~= nil then
        local linkedHorse = (self._linkedHorse)[index]
        ;
        (linkedHorse._carriageHorseSlot):ChangeTextureInfoName(sInfo:getIconPath1())
        ;
        (linkedHorse._carriageHorse_Name):SetText(sInfo:getName())
        ;
        (linkedHorse._horse_Level):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. tostring(sInfo:getLevel()))
        ;
        (linkedHorse._EXP_CountData):SetText(makeDotMoney(sInfo:getExp_s64()) .. " / " .. makeDotMoney(sInfo:getNeedExp_s64()))
        ;
        (linkedHorse._tier):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANT_TIER", "tier", sInfo:getTier()))
        local s64_exp = sInfo:getExp_s64()
        local s64_needexp = sInfo:getNeedExp_s64()
        local s64_exp_percent = (Defines.s64_const).s64_0
        if (Defines.s64_const).s64_0 < s64_exp then
          s64_exp_percent = 1.7 * (Int64toInt32(s64_exp) / Int64toInt32(s64_needexp) * 100)
        end
        ;
        (linkedHorse._EXP_GaugeBar):SetSize(s64_exp_percent, 6)
        local skillCount = sInfo:getSkillCount()
        if skillCount > 0 then
          (linkedHorse._btn_Skill):SetShow(true)
          ;
          (linkedHorse._btn_Skill):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LINKEDHORSE_INFOBUTTON"))
          ;
          (linkedHorse._btn_Skill):SetSize((linkedHorse._btn_Skill):GetTextSizeX() + 15, (linkedHorse._btn_Skill):GetSizeY())
          ;
          (linkedHorse._btn_Skill):SetTextHorizonCenter()
          ;
          (linkedHorse._btn_Skill):SetPosX((linkedHorse._carriageHorse_Name):GetPosX() + (linkedHorse._carriageHorse_Name):GetTextSizeX() + 5)
        else
          (linkedHorse._btn_Skill):SetShow(false)
        end
        if Panel_LinkedHorse_Skill:GetShow() then
          Skill_Update()
        end
      end
    end
  end
  -- DECOMPILER ERROR: 6 unprocessed JMP targets
end

carriageInfo.registEventHandler = function(self)
  -- function num : 0_7
  (self._buttonClose):addInputEvent("Mouse_LUp", "CarriageInfo_Close()")
  ;
  (self._btnClose):addInputEvent("Mouse_LUp", "Panel_LinkedHorse_Skill_Close()")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelServantinfo\" )")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelServantinfo\", \"true\")")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelServantinfo\", \"false\")")
  ;
  (self._staticSkillBG):addInputEvent("Mouse_UpScroll", "CarriageInfo_ScrollEvent( true )")
  ;
  (self._staticSkillBG):addInputEvent("Mouse_DownScroll", "CarriageInfo_ScrollEvent( false )")
  ;
  (UIScroll.InputEvent)(self._skillScroll, "CarriageInfo_ScrollEvent")
end

carriageInfo.registMessageHandler = function(self)
  -- function num : 0_8
  registerEvent("EventSelfServantUpdate", "CarriageInfo_Update()")
  registerEvent("EventSelfServantUpdateOnlyHp", "CarriageInfo_UpdateHp")
  registerEvent("EventSelfServantUpdateOnlyMp", "CarriageInfo_UpdateHp")
  registerEvent("EventServantEquipmentUpdate", "CarriageInfo_Update()")
  registerEvent("EventServantEquipItem", "CarriageInfo_ChangeEquipItem")
end

CarriageInfo_ChangeEquipItem = function(slotNo)
  -- function num : 0_9 , upvalues : carriageInfo, UI_VT
  local self = carriageInfo
  local slot = (self._itemSlots)[slotNo]
  if self._actorKeyRaw == nil then
    return 
  end
  local vehicleWrapper = getServantInfoFromActorKey(self._actorKeyRaw)
  if vehicleWrapper == nil then
    return 
  end
  local vehicleType = vehicleWrapper:getVehicleType()
  if UI_VT.Type_Carriage ~= vehicleType or UI_VT.Type_CowCarriage ~= vehicleType or UI_VT.Type_RepairableCarriage ~= vehicleType then
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

CarriageInfo_RClick = function(slotNo)
  -- function num : 0_10 , upvalues : carriageInfo
  local self = carriageInfo
  local temporaryWrapper = getTemporaryInformationWrapper()
  if not temporaryWrapper:isSelfVehicle() then
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

CarriageInfo_LClick = function(slotNo)
  -- function num : 0_11
  if DragManager.dragStartPanel == Panel_Window_Inventory then
    Inventory_SlotRClick(DragManager.dragSlotInfo)
    ;
    (DragManager.clearInfo)()
  end
end

CarriageInfo_EquipItem_MouseOn = function(slotNo, isOn)
  -- function num : 0_12 , upvalues : carriageInfo
  local self = carriageInfo
  local slot = (self._itemSlots)[slotNo]
  Panel_Tooltip_Item_SetPosition(slotNo, slot, "ServantEquipment")
  Panel_Tooltip_Item_Show_GeneralNormal(slotNo, "ServantEquipment", isOn)
end

LinkedHorse_EquipItem_ShowTooltip = function(slotNo)
  -- function num : 0_13 , upvalues : carriageInfo
  local self = carriageInfo
  local slot = (self._linkedHorseEquipSlot)[slotNo]
  Panel_Tooltip_Item_SetPosition(slotNo, slot, "LinkedHorseEquip")
  Panel_Tooltip_Item_Show_GeneralNormal(slotNo, "LinkedHorseEquip", true)
end

LinkedHorse_EquipItem_HideTooltip = function()
  -- function num : 0_14
  Panel_Tooltip_Item_hideTooltip()
end

local prevIndex = -1
local currentIndex = nil
HandleClicked_LinkedServant_SkillShow = function(index, isShow)
  -- function num : 0_15 , upvalues : carriageInfo, prevIndex
  local self = carriageInfo
  local carriageWrapper = getServantInfoFromActorKey(self._actorKeyRaw)
  if carriageWrapper == nil then
    return 
  end
  local servantInfo = stable_getServantFromOwnerServant(carriageWrapper:getServantNo(), index)
  if servantInfo == nil then
    return 
  end
  if Panel_LinkedHorse_Skill:GetShow() and prevIndex == index and isShow then
    Panel_LinkedHorse_Skill_Close()
    return 
  end
  if prevIndex ~= index then
    self._skillStart = 0
    prevIndex = index
  end
  Panel_LinkedHorse_Skill_Open()
  for ii = 0, 3 do
    (((self._linkedHorse_Skill)[ii])._skillBg):SetShow(false)
  end
  local skillCount = servantInfo:getSkillCount()
  local learnSkillCount = 0
  local startIndexCheck = 0
  self._skillCount = 0
  for skillIndex = 0, skillCount - 1 do
    local skillWrapper = servantInfo:getSkill(skillIndex)
    if skillWrapper ~= nil then
      -- DECOMPILER ERROR at PC67: Unhandled construct in 'MakeBoolean' P1

      if startIndexCheck == self._skillStart and learnSkillCount <= 3 then
        local slot = (self._linkedHorse_Skill)[learnSkillCount]
        ;
        (slot._skillBg):SetShow(true)
        ;
        (slot._skillIcon):ChangeTextureInfoName("Icon/" .. skillWrapper:getIconPath())
        ;
        (slot._skillName):SetText(skillWrapper:getName())
        ;
        (slot._skillCondition):SetText(skillWrapper:getDescription())
        ;
        (slot._skillGauge):SetProgressRate(servantInfo:getSkillExp(skillIndex) / ((skillWrapper:get())._maxExp / 100))
        ;
        (slot._skillGauge):SetAniSpeed(0)
        local percent = tonumber((string.format)("%.0f", servantInfo:getSkillExp(skillIndex) / ((skillWrapper:get())._maxExp / 100)))
        if percent > 100 then
          percent = 100
        end
        ;
        (slot._skillPercent):SetText(percent .. "%")
        learnSkillCount = learnSkillCount + 1
      end
      do
        do
          startIndexCheck = startIndexCheck + 1
          self._skillCount = self._skillCount + 1
          -- DECOMPILER ERROR at PC132: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC132: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC132: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  if self._skillCount > 4 then
    (self._skillScroll):SetShow(true)
    ;
    (UIScroll.SetButtonSize)(self._skillScroll, ((self._config)._skill).count, self._skillCount)
  else
    ;
    (self._skillScroll):SetShow(false)
  end
  if self._skillStart == 0 then
    (self._skillScroll):SetControlPos(0)
  end
  for index,value in pairs((self._linkedHorseEquip)._slotNo) do
    local slot = (self._linkedHorseEquipSlot)[value]
    local itemWrapper = servantInfo:getEquipItem(value)
    if itemWrapper ~= nil then
      slot:setItem(itemWrapper)
    else
      slot:clearItem()
    end
  end
end

Skill_Update = function()
  -- function num : 0_16 , upvalues : prevIndex
  HandleClicked_LinkedServant_SkillShow(prevIndex)
end

FGlobal_LinkedHorse_SelectedIndex = function()
  -- function num : 0_17 , upvalues : prevIndex
  return prevIndex
end

CarriageInfo_ScrollEvent = function(isScrollUp)
  -- function num : 0_18 , upvalues : carriageInfo
  local self = carriageInfo
  self._skillStart = (UIScroll.ScrollEvent)(self._skillScroll, isScrollUp, ((self._config)._skill).count, self._skillCount, self._skillStart, 1)
  CarriageInfo_Update()
end

Panel_LinkedHorse_Skill_Open = function()
  -- function num : 0_19
  if Panel_LinkedHorse_Skill:GetShow() then
    return 
  end
  Panel_LinkedHorse_Skill:SetShow(true)
  Panel_LinkedHorse_Skill:SetPosX(Panel_CarriageInfo:GetPosX() + Panel_CarriageInfo:GetSizeX())
  Panel_LinkedHorse_Skill:SetPosY(Panel_CarriageInfo:GetPosY())
end

Panel_LinkedHorse_Skill_Close = function()
  -- function num : 0_20 , upvalues : prevIndex
  Panel_LinkedHorse_Skill:SetShow(false)
  prevIndex = -1
end

CarriageInfo_OpenByActorKeyRaw = function(actorKeyRaw)
  -- function num : 0_21 , upvalues : carriageInfo
  local self = carriageInfo
  self._actorKeyRaw = actorKeyRaw
  CarriageInfo_Open()
end

CarriageInfo_GetActorKey = function()
  -- function num : 0_22 , upvalues : carriageInfo
  local self = carriageInfo
  return self._actorKeyRaw
end

CarriageInfo_Update = function()
  -- function num : 0_23 , upvalues : carriageInfo
  if not Panel_CarriageInfo:GetShow() then
    return 
  end
  local self = carriageInfo
  self:update()
end

CarriageInfo_UpdateHp = function()
  -- function num : 0_24 , upvalues : carriageInfo
  if Panel_CarriageInfo:GetShow() == false then
    return 
  end
  local self = carriageInfo
  self:updateHp()
end

CarriageInfo_UpdateMp = function()
  -- function num : 0_25 , upvalues : carriageInfo
  if Panel_CarriageInfo:GetShow() == false then
    return 
  end
  local self = carriageInfo
  self:updateMp()
end

CarriageInfo_Open = function()
  -- function num : 0_26 , upvalues : carriageInfo, UI_VT
  carriageInfo:update()
  if Panel_CarriageInfo:GetShow() then
    return 
  end
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local vehicleWrapper = getServantInfoFromActorKey(carriageInfo._actorKeyRaw)
  if vehicleWrapper == nil then
    return 
  end
  local vehicleType = vehicleWrapper:getVehicleType()
  local seatIndex = (selfPlayer:get()):getVehicleSeatIndex()
  if UI_VT.Type_Carriage == vehicleType or UI_VT.Type_CowCarriage == vehicleType or UI_VT.Type_RepairableCarriage == vehicleType then
    Panel_CarriageInfo:SetShow(true, true)
  else
    if UI_VT.Type_Train == vehicleType then
      if seatIndex == 1 then
        Panel_CarriageInfo:SetShow(false, false)
      else
        Panel_CarriageInfo:SetShow(true, true)
      end
    end
  end
end

CarriageInfo_Close = function()
  -- function num : 0_27
  if not Panel_CarriageInfo:GetShow() then
    return 
  end
  Panel_CarriageInfo:SetShow(false, false)
  Panel_LinkedHorse_Skill:SetShow(false)
end

carriageInfo:init()
carriageInfo:registEventHandler()
carriageInfo:registMessageHandler()
FGlobal_PanelMove(Panel_CarriageInfo, false)

