-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\panel_window_servantinfo.luac 

-- params : ...
-- function num : 0
Panel_Window_ServantInfo:SetShow(false, false)
Panel_Window_ServantInfo:ActiveMouseEventEffect(true)
Panel_Window_ServantInfo:SetDragEnable(true)
Panel_Window_ServantInfo:setGlassBackground(true)
Panel_Window_ServantInfo:RegisterShowEventFunc(true, "ServantInfoShowAni()")
Panel_Window_ServantInfo:RegisterShowEventFunc(false, "ServantInfoHideAni()")
Panel_Window_ServantInfo:RegisterUpdateFunc("ServantInfoUpdate")
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
local UI_VT = CppEnums.VehicleType
local isContentsStallionEnable = ToClient_IsContentsGroupOpen("243")
local isContentsNineTierEnable = ToClient_IsContentsGroupOpen("80")
ServantInfoShowAni = function()
  -- function num : 0_0
  (UIAni.fadeInSCR_Right)(Panel_Window_ServantInfo)
  audioPostEvent_SystemUi(1, 0)
end

ServantInfoHideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
  Panel_Window_ServantInfo:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_Window_ServantInfo:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
  audioPostEvent_SystemUi(1, 1)
end

local servantInfo = {
_config = {
_itemSlot = {createIcon = false, createBorder = true, createCount = true, createEnchant = true, createCash = true, createEnduranceIcon = true}
, 
_slotNo = {3, 4, 5, 6, 12, 14, 15, 16, 17}
, 
_slotID = {[3] = "equipIcon_helm", [4] = "equipIcon_upperArmor", [5] = "equipIcon_upperArmor2", [6] = "equipIcon_stirrups", [12] = "equipIcon_foot", [14] = "equipIcon_AvatarHelm", [15] = "equipIcon_AvatarUpperArmor", [16] = "equipIcon_AvatarUpperArmor2", [17] = "equipIcon_AvatarStirrups"}
, 
_slotEmptyBG = {[3] = (UI.getChildControl)(Panel_Window_ServantInfo, "equipIconEmpty_helm"), [4] = (UI.getChildControl)(Panel_Window_ServantInfo, "equipIconEmpty_upperArmor"), [5] = (UI.getChildControl)(Panel_Window_ServantInfo, "equipIconEmpty_upperArmor2"), [6] = (UI.getChildControl)(Panel_Window_ServantInfo, "equipIconEmpty_stirrups"), [12] = (UI.getChildControl)(Panel_Window_ServantInfo, "equipIconEmpty_foot"), [14] = (UI.getChildControl)(Panel_Window_ServantInfo, "equipIconEmpty_AvatarHelm"), [15] = (UI.getChildControl)(Panel_Window_ServantInfo, "equipIconEmpty_AvatarUpperArmor"), [16] = (UI.getChildControl)(Panel_Window_ServantInfo, "equipIconEmpty_AvatarUpperArmor2"), [17] = (UI.getChildControl)(Panel_Window_ServantInfo, "equipIconEmpty_AvatarStirrups")}
, 
_checkButtonID = {[3] = "CheckButton_EquipSlot_Helm", [4] = "CheckButton_EquipSlot_upperAmor", [5] = "CheckButton_EquipSlot_upperAmor2", [6] = "CheckButton_EquipSlot_stirrups", [12] = "CheckButton_EquipSlot_foot", [14] = "CheckButton_EquipSlot_AvatarHelm", [15] = "CheckButton_EquipSlot_AvatarUpperAmor", [16] = "CheckButton_EquipSlot_AvatarUpperAmor2", [17] = "CheckButton_EquipSlot_AvatarStirrups"}
, 
_checkFlag = {[3] = 1, [4] = 2, [5] = 4, [6] = 8, [12] = 0, [14] = 16, [15] = 32, [16] = 64, [17] = 128}
, 
_slotText = {[3] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Horse_Armor_3"), [4] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Horse_Armor_4"), [5] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Horse_Armor_5"), [6] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Horse_Armor_6"), [12] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Horse_Armor_12"), [14] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Horse_Armor_14"), [15] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Horse_Armor_15"), [16] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Horse_Armor_16"), [17] = PAGetString(Defines.StringSheet_GAME, "Lua_ServantInfo_Horse_Armor_17")}
, 
_skill = {startX = 0, startY = 0, startIconX = 10, startIconY = 5, startNameX = 64, startNameY = 5, startDecX = 64, startDecY = 27, startExpBGX = 4, startExpBGY = -1, startExpX = 6, startExpY = 1, startExpStrX = 18, startExpStrY = 35, gapY = 52, count = 4}
}
, _buttonClose = (UI.getChildControl)(Panel_Window_ServantInfo, "close_button"), _buttonQuestion = (UI.getChildControl)(Panel_Window_ServantInfo, "Button_Question"), _staticIconMale = (UI.getChildControl)(Panel_Window_ServantInfo, "Static_MaleIcon"), _staticIconFemale = (UI.getChildControl)(Panel_Window_ServantInfo, "Static_FemaleIcon"), _staticName = (UI.getChildControl)(Panel_Window_ServantInfo, "horse_name_value"), _staticGrade = (UI.getChildControl)(Panel_Window_ServantInfo, "StaticText_Grade"), _lv = (UI.getChildControl)(Panel_Window_ServantInfo, "Lv"), _staticLevel = (UI.getChildControl)(Panel_Window_ServantInfo, "Level_value"), _staticGaugeBar_Hp = (UI.getChildControl)(Panel_Window_ServantInfo, "HP_GaugeBar"), _staticTextValue_Hp = (UI.getChildControl)(Panel_Window_ServantInfo, "StaticText_HP_Value"), _mp = (UI.getChildControl)(Panel_Window_ServantInfo, "MP"), _staticGaugeBar_Mp = (UI.getChildControl)(Panel_Window_ServantInfo, "MP_GaugeBar"), _staticTextValue_Mp = (UI.getChildControl)(Panel_Window_ServantInfo, "StaticText_MP_Value"), _exp = (UI.getChildControl)(Panel_Window_ServantInfo, "EXP"), _staticGaugeBar_ExpBG = (UI.getChildControl)(Panel_Window_ServantInfo, "EXP_Gauge_Back"), _staticGaugeBar_Exp = (UI.getChildControl)(Panel_Window_ServantInfo, "EXP_GaugeBar"), _staticTextValue_Exp = (UI.getChildControl)(Panel_Window_ServantInfo, "StaticText_EXP_Value"), _weight = (UI.getChildControl)(Panel_Window_ServantInfo, "Weight"), _staticGaugeBar_WeightBG = (UI.getChildControl)(Panel_Window_ServantInfo, "Static_Texture_Weight_Background"), _staticGaugeBar_Weight = (UI.getChildControl)(Panel_Window_ServantInfo, "Weight_Gauge"), _staticTextValue_Weight = (UI.getChildControl)(Panel_Window_ServantInfo, "StaticText_Weight_Value"), _staticText_MaxMoveSpeedValue = (UI.getChildControl)(Panel_Window_ServantInfo, "MaxMoveSpeedValue"), _staticText_AccelerationValue = (UI.getChildControl)(Panel_Window_ServantInfo, "AccelerationValue"), _staticText_CorneringSpeedValue = (UI.getChildControl)(Panel_Window_ServantInfo, "CorneringSpeedValue"), _staticText_BrakeSpeedValue = (UI.getChildControl)(Panel_Window_ServantInfo, "BrakeSpeedValue"), _staticText_Life = (UI.getChildControl)(Panel_Window_ServantInfo, "category_Life"), _staticText_LifeValue = (UI.getChildControl)(Panel_Window_ServantInfo, "category_LifeValue"), _staticText_Value_Def = (UI.getChildControl)(Panel_Window_ServantInfo, "StaticText_DefenceValue"), _staticSkilltitle = (UI.getChildControl)(Panel_Window_ServantInfo, "category_skillList"), _staticSkillBG = (UI.getChildControl)(Panel_Window_ServantInfo, "panel_skillInfo"), _skillScroll = (UI.getChildControl)(Panel_Window_ServantInfo, "skill_scroll"), deadCountTitle = (UI.getChildControl)(Panel_Window_ServantInfo, "StaticText_DeadCount"), deadCountValue = (UI.getChildControl)(Panel_Window_ServantInfo, "StaticText_DeadCountValue"), _staticMatingCount = (UI.getChildControl)(Panel_Window_ServantInfo, "Static_MatingCount"), _staticMatingCountValue = (UI.getChildControl)(Panel_Window_ServantInfo, "Static_MatingCountValue"), _iconStallion = (UI.getChildControl)(Panel_Window_ServantInfo, "Static_iconStallion"), _skillStart = 0, _skillCount = 0, _actorKeyRaw = nil, _armorName = (Array.new)(), _itemSlots = (Array.new)(), _skillSlots = (Array.new)(), _checkButton = (Array.new)(), _prevCheckButton = (Array.new)(), _functionGet = nil, babyElephant_Warning = (UI.getChildControl)(Panel_Window_ServantInfo, "Static_BabyElephantTooltip")}
;
(servantInfo.babyElephant_Warning):addInputEvent("Mouse_On", "ServantInfo_BabyElephantWarning( true )")
;
(servantInfo.babyElephant_Warning):addInputEvent("Mouse_Out", "ServantInfo_BabyElephantWarning( false )")
;
(servantInfo._iconStallion):addInputEvent("Mouse_On", "ServantInfo_StallionToolTip( true )")
;
(servantInfo._iconStallion):addInputEvent("Mouse_Out", "ServantInfo_StallionToolTip( false )")
servantInfo.init = function(self)
  -- function num : 0_2
  (self._skillScroll):SetControlPos(0)
  ;
  (self._iconStallion):SetShow(false)
  for index,value in pairs((self._config)._slotNo) do
    local slot = {}
    slot.icon = (UI.getChildControl)(Panel_Window_ServantInfo, ((self._config)._slotID)[value])
    ;
    (SlotItem.new)(slot, "ServantInfoEquipment_" .. value, value, Panel_Window_ServantInfo, (self._config)._itemSlot)
    slot:createChild()
    ;
    (slot.icon):addInputEvent("Mouse_RUp", "ServantInfo_RClick(" .. value .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_LUp", "ServantInfo_LClick(" .. value .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_On", "ServantInfo_EquipItem_MouseOn(" .. value .. ", true)")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "ServantInfo_EquipItem_MouseOn(" .. value .. ", false)")
    Panel_Tooltip_Item_SetPosition(value, slot, "ServantEquipment")
    -- DECOMPILER ERROR at PC73: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self._itemSlots)[value] = slot
    -- DECOMPILER ERROR at PC82: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self._armorName)[value] = (UI.getChildControl)(Panel_Window_ServantInfo, "StaticText_ArmorName" .. index)
    -- DECOMPILER ERROR at PC91: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self._checkButton)[value] = (UI.getChildControl)(Panel_Window_ServantInfo, ((self._config)._checkButtonID)[value])
    ;
    ((self._checkButton)[value]):addInputEvent("Mouse_LUp", "ServantInfo_VehicleEquipSlot_LClick(" .. value .. ")")
  end
  ;
  ((self._checkButton)[12]):SetShow(false)
  for ii = 0, ((self._config)._skill).count - 1 do
    local slot = {}
    slot.button = (UI.createAndCopyBasePropertyControl)(Panel_Window_ServantInfo, "skill_static", self._staticSkillBG, "ServantInfo_Skill_" .. ii)
    slot.expBG = (UI.createAndCopyBasePropertyControl)(Panel_Window_ServantInfo, "Static_Texture_Learn_Background", slot.button, "ServantInfo_Skill_ExpBG_" .. ii)
    slot.exp = (UI.createAndCopyBasePropertyControl)(Panel_Window_ServantInfo, "SkillLearn_Gauge", slot.button, "ServantInfo_Skill_Exp_" .. ii)
    slot.icon = (UI.createAndCopyBasePropertyControl)(Panel_Window_ServantInfo, "skill_icon", slot.button, "ServantInfo_Skill_Icon_" .. ii)
    slot.expText = (UI.createAndCopyBasePropertyControl)(Panel_Window_ServantInfo, "SkillLearn_PercentString", slot.button, "ServantInfo_Skill_ExpStr_" .. ii)
    slot.name = (UI.createAndCopyBasePropertyControl)(Panel_Window_ServantInfo, "skill_name", slot.button, "ServantInfo_Skill_Name_" .. ii)
    slot.dec = (UI.createAndCopyBasePropertyControl)(Panel_Window_ServantInfo, "skill_condition", slot.button, "ServantInfo_Skill_Dec_" .. ii)
    local skillConfig = (self._config)._skill
    ;
    (slot.button):SetPosX(skillConfig.startX)
    ;
    (slot.button):SetPosY(skillConfig.startY + skillConfig.gapY * ii)
    ;
    (slot.expBG):SetPosX(skillConfig.startExpBGX)
    ;
    (slot.expBG):SetPosY(skillConfig.startExpBGY)
    ;
    (slot.exp):SetPosX(skillConfig.startExpX)
    ;
    (slot.exp):SetPosY(skillConfig.startExpY)
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
    (slot.dec):SetPosX(skillConfig.startDecX)
    ;
    (slot.dec):SetPosY(skillConfig.startDecY)
    ;
    (UIScroll.InputEventByControl)(slot.button, "ServantInfo_ScrollEvent")
    -- DECOMPILER ERROR at PC253: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self._skillSlots)[ii] = slot
  end
end

servantInfo.clear = function(self)
  -- function num : 0_3
  self._skillStart = 0
  self._skillCount = 0
end

ServantInfo_UpdateHp = function()
  -- function num : 0_4 , upvalues : servantInfo
  if Panel_Window_ServantInfo:GetShow() == false then
    return 
  end
  local self = servantInfo
  self:updateHp()
end

ServantInfo_UpdateMp = function()
  -- function num : 0_5 , upvalues : servantInfo
  if Panel_Window_ServantInfo:GetShow() == false then
    return 
  end
  local self = servantInfo
  self:updateMp()
end

servantInfo.updateHp = function(self)
  -- function num : 0_6
  local servantWrapper = getServantInfoFromActorKey(self._actorKeyRaw)
  if servantWrapper == nil then
    return 
  end
  ;
  (self._staticGaugeBar_Hp):SetSize(1.55 * (servantWrapper:getHp() / servantWrapper:getMaxHp() * 100), 4)
  ;
  (self._staticTextValue_Hp):SetText(makeDotMoney(servantWrapper:getHp()) .. " / " .. makeDotMoney(servantWrapper:getMaxHp()))
end

servantInfo.updateMp = function(self)
  -- function num : 0_7
  local servantWrapper = getServantInfoFromActorKey(self._actorKeyRaw)
  if servantWrapper == nil then
    return 
  end
  ;
  (self._staticGaugeBar_Mp):SetSize(1.55 * (servantWrapper:getMp() / servantWrapper:getMaxMp() * 100), 5)
  ;
  (self._staticTextValue_Mp):SetText(makeDotMoney(servantWrapper:getMp()) .. " / " .. makeDotMoney(servantWrapper:getMaxMp()))
end

local stallionIconPosX = (servantInfo._iconStallion):GetPosX()
servantInfo.update = function(self)
  -- function num : 0_8 , upvalues : isContentsStallionEnable, stallionIconPosX, servantInfo
  local servantWrapper = getServantInfoFromActorKey(self._actorKeyRaw)
  if servantWrapper == nil then
    return 
  end
  local isVehicleType = servantWrapper:getVehicleType()
  for index,value in pairs((self._config)._slotNo) do
    if (CppEnums.VehicleType).Type_Elephant == isVehicleType then
      ((self._checkButton)[value]):SetShow(false)
    else
      ;
      ((self._checkButton)[value]):SetShow(true)
    end
  end
  ;
  ((self._checkButton)[12]):SetShow(false)
  ;
  (self._staticGaugeBar_Exp):SetShow(false)
  ;
  (self._staticTextValue_Exp):SetShow(false)
  ;
  (self._staticGaugeBar_Weight):SetShow(false)
  ;
  (self._staticTextValue_Weight):SetShow(false)
  ;
  (self._staticText_Life):SetShow(false)
  ;
  (self._staticText_LifeValue):SetShow(false)
  ;
  (self._staticMatingCount):SetShow(false)
  ;
  (self._staticMatingCountValue):SetShow(false)
  ;
  (self._staticGaugeBar_ExpBG):SetShow(false)
  ;
  (self._staticGaugeBar_WeightBG):SetShow(false)
  ;
  (self._exp):SetShow(false)
  ;
  (self._weight):SetShow(false)
  ;
  (self._lv):SetShow(false)
  ;
  (self._staticLevel):SetShow(false)
  ;
  (self._iconStallion):SetShow(false)
  if (CppEnums.VehicleType).Type_Elephant ~= servantWrapper:getVehicleType() then
    (self._staticGaugeBar_Exp):SetShow(true)
    ;
    (self._staticTextValue_Exp):SetShow(true)
    ;
    (self._staticGaugeBar_Weight):SetShow(true)
    ;
    (self._staticTextValue_Weight):SetShow(true)
    ;
    (self._staticText_Life):SetShow(true)
    ;
    (self._staticText_LifeValue):SetShow(true)
    if servantWrapper:getTier() ~= 9 then
      (self._staticMatingCount):SetShow(true)
      ;
      (self._staticMatingCountValue):SetShow(true)
    else
      ;
      (self._staticMatingCount):SetShow(false)
      ;
      (self._staticMatingCountValue):SetShow(false)
    end
    ;
    (self._staticGaugeBar_ExpBG):SetShow(true)
    ;
    (self._staticGaugeBar_WeightBG):SetShow(true)
    ;
    (self._exp):SetShow(true)
    ;
    (self._weight):SetShow(true)
    ;
    (self._lv):SetShow(true)
    ;
    (self._staticLevel):SetShow(true)
  end
  ;
  (self._staticName):SetText(servantWrapper:getName())
  ;
  (self._staticLevel):SetText(tostring(servantWrapper:getLevel()))
  if (CppEnums.VehicleType).Type_Horse == servantWrapper:getVehicleType() then
    if servantWrapper:getTier() == 9 then
      (self._staticGrade):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_TEXT_TIER9"))
      ;
      (self._iconStallion):SetShow(false)
    else
      ;
      (self._staticGrade):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANT_TIER", "tier", servantWrapper:getTier()) .. "(<PAColor0xFF0FBFFF>?<PAOldColor>)")
      if servantWrapper:isPcroomOnly() == false and isContentsStallionEnable then
        local isStallion = servantWrapper:isStallion()
        ;
        (self._iconStallion):SetShow(true)
        if isStallion == true then
          (self._iconStallion):SetMonoTone(false)
        else
          ;
          (self._iconStallion):SetMonoTone(true)
        end
        local sizeX = (self._staticGrade):GetSizeX()
        local textSizeX = (self._staticGrade):GetTextSizeX()
        if sizeX < textSizeX then
          (self._iconStallion):SetPosX(stallionIconPosX + (sizeX - textSizeX))
        end
      else
        do
          ;
          (self._iconStallion):SetShow(false)
          ;
          (self._staticGrade):SetShow(true)
          ;
          (self._staticGrade):SetShow(false)
          if (CppEnums.VehicleType).Type_Elephant == servantWrapper:getVehicleType() then
            (self._mp):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SERVANTINFO_ELEPHANT_MP"))
          else
            ;
            (self._mp):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HORSEHP_TOOLTIP_HORSEMP_NAME"))
          end
          ;
          (self._staticGaugeBar_Hp):SetSize(1.55 * (servantWrapper:getHp() / servantWrapper:getMaxHp() * 100), 4)
          ;
          (self._staticTextValue_Hp):SetText(makeDotMoney(servantWrapper:getHp()) .. " / " .. makeDotMoney(servantWrapper:getMaxHp()))
          ;
          (self._staticGaugeBar_Mp):SetSize(1.55 * (servantWrapper:getMp() / servantWrapper:getMaxMp() * 100), 5)
          ;
          (self._staticTextValue_Mp):SetText(makeDotMoney(servantWrapper:getMp()) .. " / " .. makeDotMoney(servantWrapper:getMaxMp()))
          ;
          (self._staticGaugeBar_Exp):SetSize(155 * Int64toInt32(servantWrapper:getExp_s64()) / Int64toInt32(servantWrapper:getNeedExp_s64()), 4)
          ;
          (self._staticTextValue_Exp):SetText(makeDotMoney(servantWrapper:getExp_s64()) .. " / " .. makeDotMoney(servantWrapper:getNeedExp_s64()))
          local max_weight = Int64toInt32(servantWrapper:getMaxWeight_s64() / (Defines.s64_const).s64_10000)
          local total_weight = Int64toInt32((servantWrapper:getInventoryWeight_s64() + servantWrapper:getEquipWeight_s64()) / (Defines.s64_const).s64_10000)
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
          local deadCountText = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SERVANTINFO_DEADCOUNT")
          if (CppEnums.VehicleType).Type_Elephant == servantWrapper:getVehicleType() then
            deadCountText = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDSERVANTINFO_INJURY")
            deadCount = deadCount * 10 .. "%"
          end
          ;
          (self.deadCountTitle):SetText(deadCountText)
          ;
          (self.deadCountValue):SetText(deadCount)
          local matingCount = servantWrapper:getMatingCount()
          ;
          (self._staticMatingCountValue):SetText(matingCount)
          local matingCountPosX = (self._staticMatingCount):GetPosX()
          local matingCountTextX = (self._staticMatingCount):GetTextSizeX()
          local matingCountValuePosX = (self._staticMatingCountValue):GetPosX()
          if matingCountValuePosX < matingCountPosX + matingCountTextX then
            (self._staticMatingCountValue):SetPosX(matingCountValuePosX + (matingCountPosX + matingCountTextX - matingCountValuePosX) + 6)
          end
          ;
          (self._staticText_MaxMoveSpeedValue):SetText((string.format)("%.1f", servantWrapper:getStat((CppEnums.ServantStatType).Type_MaxMoveSpeed) / 10000) .. "%")
          ;
          (self._staticText_AccelerationValue):SetText((string.format)("%.1f", servantWrapper:getStat((CppEnums.ServantStatType).Type_Acceleration) / 10000) .. "%")
          ;
          (self._staticText_CorneringSpeedValue):SetText((string.format)("%.1f", servantWrapper:getStat((CppEnums.ServantStatType).Type_CorneringSpeed) / 10000) .. "%")
          ;
          (self._staticText_BrakeSpeedValue):SetText((string.format)("%.1f", servantWrapper:getStat((CppEnums.ServantStatType).Type_BrakeSpeed) / 10000) .. "%")
          local vehicleInfo = getVehicleActor(self._actorKeyRaw)
          if vehicleInfo ~= nil then
            (self._staticText_Value_Def):SetText(((vehicleInfo:get()):getEquipment()):getDefense())
          end
          if servantWrapper:isPeriodLimit() then
            (self._staticText_LifeValue):SetText(convertStringFromDatetime(servantWrapper:getExpiredTime()))
            ;
            (self._staticText_LifeValue):SetShow(true)
          else
            if (CppEnums.VehicleType).Type_Elephant ~= servantWrapper:getVehicleType() then
              (self._staticText_LifeValue):SetText(PAGetString(Defines.StringSheet_RESOURCE, "STABLE_INFO_TEXT_LIFEVALUE"))
              ;
              (self._staticText_LifeValue):SetShow(true)
            end
          end
          local lifePosX = (self._staticText_Life):GetPosX()
          local lifeTextX = (self._staticText_Life):GetTextSizeX()
          local lifeValue = (self._staticText_LifeValue):GetPosX()
          if lifeValue < lifePosX + lifeTextX then
            (self._staticText_Life):SetPosX(lifePosX + (lifeValue - (lifePosX + lifeTextX)) - 3)
          end
          ;
          (self._staticIconMale):SetShow(false)
          ;
          (self._staticIconFemale):SetShow(false)
          if servantWrapper:doMating() then
            if servantWrapper:isMale() then
              (self._staticIconMale):SetShow(true)
              ;
              (self._staticName):SetPosX((self._staticIconMale):GetPosX() + (self._staticIconMale):GetSizeX() + 3)
            else
              ;
              (self._staticIconFemale):SetShow(true)
              ;
              (self._staticName):SetPosX((self._staticIconFemale):GetPosX() + (self._staticIconFemale):GetSizeX() + 3)
            end
          end
          for index,value in pairs((self._config)._slotNo) do
            local slot = (self._itemSlots)[value]
            local slotText = (self._armorName)[value]
            local itemWrapper = servantWrapper:getEquipItem(value)
            if itemWrapper ~= nil then
              (((servantInfo._config)._slotEmptyBG)[value]):SetShow(false)
              slot:setItem(itemWrapper)
            else
              slot:clearItem()
              ;
              (((servantInfo._config)._slotEmptyBG)[value]):SetShow(true)
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
            if skillWrapper ~= nil and skillWrapper:isTrainingSkill() == false then
              if self._skillStart <= self._skillCount and slotNo < ((self._config)._skill).count then
                local expTxt = (math.floor)(servantWrapper:getSkillExp(ii) / ((skillWrapper:get())._maxExp / 100))
                if expTxt >= 100 then
                  expTxt = 100
                end
                local slot = (self._skillSlots)[slotNo]
                ;
                (slot.icon):ChangeTextureInfoName("Icon/" .. skillWrapper:getIconPath())
                ;
                (slot.name):SetText(skillWrapper:getName())
                ;
                (slot.dec):SetText(skillWrapper:getDescription())
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
                  -- DECOMPILER ERROR at PC794: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC794: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC794: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
          ;
          (self._staticSkilltitle):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANTINFO_SKILLCOUNT", "servantSkillListCnt", self._skillCount))
          ;
          (UIScroll.SetButtonSize)(self._skillScroll, ((self._config)._skill).count, self._skillCount)
        end
      end
    end
  end
end

ServantInfoGradeTooltip = function(isShow)
  -- function num : 0_9 , upvalues : servantInfo
  local self = servantInfo
  local name, desc, control = nil, nil, nil
  name = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANTINFO_GRADEINFO_TOOLTIP_TITLE")
  desc = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANTINFO_GENERATIONDESC")
  control = self._staticGrade
  if isShow == true then
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

servantInfo.registEventHandler = function(self)
  -- function num : 0_10
  (self._buttonClose):addInputEvent("Mouse_LUp", "ServantInfo_Close()")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelServantinfo\" )")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelServantinfo\", \"true\")")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelServantinfo\", \"false\")")
  ;
  (self._staticGrade):addInputEvent("Mouse_On", "ServantInfoGradeTooltip( true )")
  ;
  (self._staticGrade):addInputEvent("Mouse_Out", "ServantInfoGradeTooltip( false )")
  ;
  (self._staticSkillBG):addInputEvent("Mouse_UpScroll", "ServantInfo_ScrollEvent( true )")
  ;
  (self._staticSkillBG):addInputEvent("Mouse_DownScroll", "ServantInfo_ScrollEvent( false )")
  ;
  (UIScroll.InputEvent)(self._skillScroll, "ServantInfo_ScrollEvent")
end

servantInfo.registMessageHandler = function(self)
  -- function num : 0_11
  registerEvent("FromClient_OpenServantInformation", "ServantInfo_BeforOpenByActorKeyRaw")
  registerEvent("EventSelfServantUpdate", "ServantInfo_Update")
  registerEvent("EventSelfServantUpdateOnlyHp", "ServantInfo_UpdateHp")
  registerEvent("EventSelfServantUpdateOnlyMp", "ServantInfo_UpdateMp")
  registerEvent("EventServantEquipmentUpdate", "ServantInfo_Update")
  registerEvent("EventServantEquipItem", "ServantInfo_ChangeEquipItem")
  registerEvent("FromClient_SelfVehicleLevelUp", "FromClient_SelfVehicleLevelUp")
end

FromClient_SelfVehicleLevelUp = function(variedHp, variedMp, variedWeight_s64, variedAcceleration, variedSpeed, variedCornering, variedBrake)
  -- function num : 0_12
end

ServantInfo_ChangeEquipItem = function(slotNo)
  -- function num : 0_13 , upvalues : servantInfo
  local self = servantInfo
  local slot = (self._itemSlots)[slotNo]
  if self._actorKeyRaw == nil then
    return 
  end
  local servantWrapper = getServantInfoFromActorKey(self._actorKeyRaw)
  if servantWrapper == nil then
    return 
  end
  ;
  (slot.icon):AddEffect("UI_ItemInstall", false, 0, 0)
  ;
  (slot.icon):AddEffect("fUI_SkillButton01", false, 0, 0)
  local itemWrapper = servantWrapper:getEquipItem(slotNo)
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

local isNowEquip = false
IsNowEquipCheck = function()
  -- function num : 0_14 , upvalues : isNowEquip
  return isNowEquip
end

IsNowEquipReset = function()
  -- function num : 0_15 , upvalues : isNowEquip
  isNowEquip = false
end

ServantInfo_RClick = function(slotNo)
  -- function num : 0_16 , upvalues : servantInfo, isNowEquip
  local self = servantInfo
  local servantWrapper = getServantInfoFromActorKey(self._actorKeyRaw)
  if servantWrapper == nil then
    return 
  end
  local itemWrapper = servantWrapper:getEquipItem(slotNo)
  if itemWrapper == nil then
    return 
  end
  isNowEquip = true
  servant_doUnequip(servantWrapper:getActorKeyRaw(), slotNo)
end

ServantInfo_LClick = function(slotNo)
  -- function num : 0_17
  if DragManager.dragStartPanel == Panel_Window_Inventory then
    Inventory_SlotRClick(DragManager.dragSlotInfo)
    ;
    (DragManager.clearInfo)()
  end
end

ServantInfo_EquipItem_MouseOn = function(slotNo, isOn)
  -- function num : 0_18 , upvalues : servantInfo
  local self = servantInfo
  local slot = (self._itemSlots)[slotNo]
  Panel_Tooltip_Item_SetPosition(slotNo, slot, "ServantEquipment")
  Panel_Tooltip_Item_Show_GeneralNormal(slotNo, "ServantEquipment", isOn)
end

ServantInfo_CheckSlot = function(slotNo)
  -- function num : 0_19 , upvalues : servantInfo
  local self = servantInfo
  local checkButton = (self._checkButton)[slotNo]
end

ServantInfo_ScrollEvent = function(isScrollUp)
  -- function num : 0_20 , upvalues : servantInfo
  local self = servantInfo
  self._skillStart = (UIScroll.ScrollEvent)(self._skillScroll, isScrollUp, ((self._config)._skill).count, self._skillCount, self._skillStart, 1)
  self:update()
end

ServantInfo_BeforOpenByActorKeyRaw = function(actorKeyRaw)
  -- function num : 0_21 , upvalues : servantInfo, UI_VT
  local self = servantInfo
  local servantWrapper = getServantInfoFromActorKey(actorKeyRaw)
  if servantWrapper == nil then
    return 
  end
  local isSelfVehicle = servantWrapper:isSelfVehicle()
  local vehicleType = servantWrapper:getVehicleType()
  -- DECOMPILER ERROR at PC19: Unhandled construct in 'MakeBoolean' P1

  if servantWrapper:isGuildServant() and servantWrapper:isMyGuildServant() == false then
    return 
  end
  if isSelfVehicle == false then
    return 
  end
  if UI_VT.Type_Horse == vehicleType or UI_VT.Type_Camel == vehicleType or UI_VT.Type_Donkey == vehicleType or UI_VT.Type_Elephant == vehicleType or UI_VT.Type_RidableBabyElephant == vehicleType then
    self._functionGet = ServantInfo_GetActorKey
    ServantInfo_OpenByActorKeyRaw(actorKeyRaw)
  else
    if UI_VT.Type_Carriage == vehicleType or UI_VT.Type_CowCarriage == vehicleType or UI_VT.Type_Train == vehicleType or UI_VT.Type_RepairableCarriage == vehicleType then
      self._functionGet = CarriageInfo_GetActorKey
      CarriageInfo_OpenByActorKeyRaw(actorKeyRaw)
    else
      if UI_VT.Type_Boat == vehicleType or UI_VT.Type_Raft == vehicleType or UI_VT.Type_FishingBoat == vehicleType then
        self._functionGet = ShipInfo_GetActorKey
        ShipInfo_OpenByActorKeyRaw(actorKeyRaw)
      else
        if UI_VT.Type_SailingBoat == vehicleType or UI_VT.Type_PersonalBattleShip == vehicleType or UI_VT.Type_PersonTradeShip == vehicleType then
          self._functionGet = WorkerShipInfo_GetActorKey
          WorkerShipInfo_OpenByActorKeyRaw(actorKeyRaw)
        end
      end
    end
  end
end

ServantInfo_OpenByActorKeyRaw = function(actorKeyRaw, vehicleType)
  -- function num : 0_22 , upvalues : servantInfo
  local self = servantInfo
  self._actorKeyRaw = actorKeyRaw
  ServantInfo_Open()
end

ServantInfo_Update = function()
  -- function num : 0_23 , upvalues : servantInfo
  if not Panel_Window_ServantInfo:GetShow() then
    return 
  end
  local self = servantInfo
  self:update()
end

ServantInfo_Open = function()
  -- function num : 0_24 , upvalues : servantInfo, UI_VT
  local self = servantInfo
  self:clear()
  self:update()
  ;
  (self._skillScroll):SetControlPos(0)
  if Panel_Window_ServantInfo:GetShow() then
    return 
  end
  local servantWrapper = getServantInfoFromActorKey(self._actorKeyRaw)
  if servantWrapper == nil then
    return 
  end
  for index,value in pairs((self._config)._slotNo) do
    isCheck = ToClient_IsSetVehicleEquipSlotFlag(servantWrapper:getVehicleType(), ((self._config)._checkFlag)[value])
    ;
    ((self._checkButton)[value]):SetCheck(isCheck)
    -- DECOMPILER ERROR at PC41: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self._prevCheckButton)[value] = isCheck
  end
  Panel_Window_ServantInfo:SetShow(true, true)
  ;
  (servantInfo.babyElephant_Warning):SetShow(false)
  local temporaryWrapper = getTemporaryInformationWrapper()
  local landVehicleWrapper = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle)
  if landVehicleWrapper ~= nil and UI_VT.Type_RidableBabyElephant == landVehicleWrapper:getVehicleType() then
    (servantInfo.babyElephant_Warning):SetShow(true)
  end
end

ServantInfo_Close = function()
  -- function num : 0_25
  if not Panel_Window_ServantInfo:GetShow() then
    return 
  end
  Panel_Window_ServantInfo:SetShow(false, false)
end

ServantInfo_VehicleEquipSlot_LClick = function(slotNo)
  -- function num : 0_26 , upvalues : servantInfo
  local self = servantInfo
  local isChecked = ((self._checkButton)[slotNo]):IsCheck()
  local servantWrapper = getServantInfoFromActorKey(self._actorKeyRaw)
  if servantWrapper == nil then
    return 
  end
  if isChecked == true then
    ToClient_SetVehicleEquipSlotFlag(servantWrapper:getVehicleType(), ((self._config)._checkFlag)[slotNo])
  else
    ToClient_ResetVehicleEquipSlotFlag(servantWrapper:getVehicleType(), ((self._config)._checkFlag)[slotNo])
  end
  ToClient_setShowVehicleEquip()
end

ServantInfo_GetActorKey = function()
  -- function num : 0_27 , upvalues : servantInfo
  local self = servantInfo
  return self._actorKeyRaw
end

Servant_GetActorKeyFromItemToolTip = function()
  -- function num : 0_28 , upvalues : servantInfo
  local self = servantInfo
  return (self._functionGet)()
end

local elapseTime = 0
ServantInfoUpdate = function(deltaTime)
  -- function num : 0_29 , upvalues : elapseTime, servantInfo
  if not Panel_Window_ServantInfo:GetShow() then
    return 
  end
  elapseTime = elapseTime + deltaTime
  local isDiff = false
  if elapseTime > 0.2 then
    elapseTime = 0
    local self = servantInfo
    local servantWrapper = getServantInfoFromActorKey(self._actorKeyRaw)
    if servantWrapper == nil then
      return 
    end
    for index,value in pairs((self._config)._slotNo) do
      isCheck = ToClient_IsSetVehicleEquipSlotFlag(servantWrapper:getVehicleType(), ((self._config)._checkFlag)[value])
      if (self._prevCheckButton)[value] ~= isCheck then
        isDiff = true
        -- DECOMPILER ERROR at PC43: Confused about usage of register: R9 in 'UnsetPending'

        ;
        (self._prevCheckButton)[value] = isCheck
      end
    end
  end
  do
    if isDiff then
    end
  end
end

ServantInfo_BabyElephantWarning = function(isShow)
  -- function num : 0_30 , upvalues : servantInfo
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANTINFO_TOOLTIP_NAME_WARRING")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANTINFO_TOOLTIP_DESC_WARRING")
  local control = servantInfo.babyElephant_Warning
  TooltipSimple_Show(control, name, desc)
end

ServantInfo_StallionToolTip = function(isOn)
  -- function num : 0_31 , upvalues : servantInfo, isContentsStallionEnable, isContentsNineTierEnable
  local self = servantInfo
  local servantWrapper = getServantInfoFromActorKey(self._actorKeyRaw)
  if servantWrapper == nil then
    return 
  end
  if isOn == false then
    TooltipSimple_Hide()
    return 
  end
  local uiControl, name, desc = nil, nil, nil
  if servantWrapper:getTier() ~= 9 and isContentsStallionEnable then
    local isStallion = servantWrapper:isStallion()
    ;
    (self._iconStallion):SetShow(true)
    if isStallion == true then
      (self._iconStallion):SetMonoTone(false)
      uiControl = servantInfo._iconStallion
      name = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANTINFO_TEXT_STALLIONICONNAME")
      if isContentsNineTierEnable then
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANTINFO_TEXT_STALLIONICONDESC")
        desc2 = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANTINFO_TEXT_STALLIONICONDESC2")
        desc = (string.format)("%s %s", desc, desc2)
      else
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANTINFO_TEXT_STALLIONICONDESC")
      end
    else
      ;
      (self._iconStallion):SetMonoTone(true)
      uiControl = servantInfo._iconStallion
      name = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANTINFO_TEXT_NOTSTALLIONICONNAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANTINFO_TEXT_NOTSTALLIONICONDESC")
    end
    registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(uiControl, name, desc)
  else
    do
      ;
      (self._iconStallion):SetShow(false)
    end
  end
end

servantInfo:init()
servantInfo:registEventHandler()
servantInfo:registMessageHandler()
FGlobal_PanelMove(Panel_Window_ServantInfo, false)

