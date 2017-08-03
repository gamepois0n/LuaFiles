-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\guildstable\panel_window_guildstableinfo.luac 

-- params : ...
-- function num : 0
Panel_Window_GuildStable_Info:SetShow(false, false)
Panel_Window_GuildStable_Info:setMaskingChild(true)
Panel_Window_GuildStable_Info:ActiveMouseEventEffect(true)
Panel_Window_GuildStable_Info:SetDragEnable(true)
Panel_Window_GuildStable_Info:RegisterShowEventFunc(true, "StableInfoShowAni()")
Panel_Window_GuildStable_Info:RegisterShowEventFunc(false, "StableInfoHideAni()")
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
;
((UI.getChildControl)(Panel_Window_GuildStable_Info, "Stable_Info_Ability")):setGlassBackground(true)
;
((UI.getChildControl)(Panel_Window_GuildStable_Info, "Panel_Skill")):setGlassBackground(true)
GuildStableInfoShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV, UI_color
  Panel_Window_GuildStable_Info:SetShow(true, false)
  ;
  (UIAni.fadeInSCR_Right)(Panel_Window_GuildStable_Info)
  local aniInfo3 = Panel_Window_GuildStable_Info:addColorAnimation(0, 0.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo3:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo3.IsChangeChild = false
end

GuildStableInfoHideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
  Panel_Window_GuildStable_Info:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_Window_GuildStable_Info:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

local guildStableInfo = {
_config = {
slot = {startX = 5, startY = 5, startBGX = 10, startBGY = 38, startScrollX = 319, startScrollY = 13, buttonSizeX = 60, halfButtonSizeY = 28, gapY = 66, count = 4}
, 
skill = {startIconX = 5, startIconY = 7, startNameX = 59, startNameY = 7, startDecX = 59, startDecY = 28, startExpBGX = 0, startExpBGY = 2, startExpX = 2, startExpY = 4, startButtonX = 251, startButtonY = 4}
}
, _maleIcon = (UI.getChildControl)(Panel_Window_GuildStable_Info, "Static_MaleIcon"), _femaleIcon = (UI.getChildControl)(Panel_Window_GuildStable_Info, "Static_FemaleIcon"), _staticName = (UI.getChildControl)(Panel_Window_GuildStable_Info, "StaticText_Name"), _staticLevel = (UI.getChildControl)(Panel_Window_GuildStable_Info, "Static_Text_Level"), _staticHpGauge = (UI.getChildControl)(Panel_Window_GuildStable_Info, "HP_GaugeBar"), _staticMpGauge = (UI.getChildControl)(Panel_Window_GuildStable_Info, "MP_GaugeBar"), _staticExpGauge = (UI.getChildControl)(Panel_Window_GuildStable_Info, "EXP_GaugeBar"), _staticWeightGauge = (UI.getChildControl)(Panel_Window_GuildStable_Info, "Weight_GaugeBar"), _staticHPTitle = (UI.getChildControl)(Panel_Window_GuildStable_Info, "HP"), _staticMPTitle = (UI.getChildControl)(Panel_Window_GuildStable_Info, "MP"), _staticHP = (UI.getChildControl)(Panel_Window_GuildStable_Info, "HP_CountData"), _staticMP = (UI.getChildControl)(Panel_Window_GuildStable_Info, "MP_CountData"), _staticEXP = (UI.getChildControl)(Panel_Window_GuildStable_Info, "EXP_CountData"), _staticWeight = (UI.getChildControl)(Panel_Window_GuildStable_Info, "WHT_CountData"), _staticTitleMaxMoveSpeed = (UI.getChildControl)(Panel_Window_GuildStable_Info, "MaxMoveSpeed"), _staticTitleAcceleration = (UI.getChildControl)(Panel_Window_GuildStable_Info, "Acceleration"), _staticTitleCorneringSpeed = (UI.getChildControl)(Panel_Window_GuildStable_Info, "CorneringSpeed"), _staticTitleBrakeSpeed = (UI.getChildControl)(Panel_Window_GuildStable_Info, "BrakeSpeed"), _staticMoveSpeed = (UI.getChildControl)(Panel_Window_GuildStable_Info, "MaxMoveSpeedValue"), _staticAcceleration = (UI.getChildControl)(Panel_Window_GuildStable_Info, "AccelerationValue"), _staticCornering = (UI.getChildControl)(Panel_Window_GuildStable_Info, "CorneringSpeedValue"), _staticBrakeSpeed = (UI.getChildControl)(Panel_Window_GuildStable_Info, "BrakeSpeedValue"), _staticLife = (UI.getChildControl)(Panel_Window_GuildStable_Info, "Static_LifeCount"), _staticLifeValue = (UI.getChildControl)(Panel_Window_GuildStable_Info, "Static_LifeCountValue"), _staticSkillPanel = (UI.getChildControl)(Panel_Window_GuildStable_Info, "Panel_Skill"), _deadCount = (UI.getChildControl)(Panel_Window_GuildStable_Info, "StaticText_DeadCount"), _deadCountValue = (UI.getChildControl)(Panel_Window_GuildStable_Info, "StaticText_DeadCountValue"), _startSlotIndex = 0, _temporaySlotCount = 0, _temporayLearnSkillCount = 0, _skill = (Array.new)(), _fromSkillKey = nil, _toSkillKey = nil}
guildStableInfo.clear = function(self)
  -- function num : 0_2
  self._fromSkillKey = nil
  self._toSkillKey = nil
end

guildStableInfo.init = function(self)
  -- function num : 0_3
  self._staticSkillTitle = (UI.createAndCopyBasePropertyControl)(Panel_Window_GuildStable_Info, "Skill_Title", self._staticSkillPanel, "StableInfo_SkillTitle")
  self._staticSkillBG = (UI.createAndCopyBasePropertyControl)(Panel_Window_GuildStable_Info, "Static_SkillBG", self._staticSkillPanel, "StableInfo_SkillBG")
  self._scrollSkill = (UI.createAndCopyBasePropertyControl)(Panel_Window_GuildStable_Info, "Scroll_Skill", self._staticSkillBG, "StableInfo_SkillScroll")
  local slotConfig = (self._config).slot
  ;
  (self._staticSkillBG):SetPosX(slotConfig.startBGX)
  ;
  (self._staticSkillBG):SetPosY(slotConfig.startBGY)
  ;
  (self._scrollSkill):SetPosX(slotConfig.startScrollX)
  ;
  (self._scrollSkill):SetPosY(slotConfig.startScrollY)
  ;
  (self._staticSkillBG):addInputEvent("Mouse_UpScroll", "StableInfo_ScrollEvent( true )")
  ;
  (self._staticSkillBG):addInputEvent("Mouse_DownScroll", "StableInfo_ScrollEvent( false )")
  for ii = 0, ((self._config).slot).count - 1 do
    local slot = {}
    slot.base = (UI.createAndCopyBasePropertyControl)(Panel_Window_GuildStable_Info, "Button_Skill", self._staticSkillBG, "GuildStableInfo_Skill_" .. ii)
    slot.expBG = (UI.createAndCopyBasePropertyControl)(Panel_Window_GuildStable_Info, "Static_SkillExpBG", slot.base, "GuildStableInfo_SkillExpBG_" .. ii)
    slot.exp = (UI.createAndCopyBasePropertyControl)(Panel_Window_GuildStable_Info, "Gauge_SkillExp", slot.base, "GuildStableInfo_SkillExp_" .. ii)
    slot.icon = (UI.createAndCopyBasePropertyControl)(Panel_Window_GuildStable_Info, "Static_SkillIcon", slot.base, "GuildStableInfo_SkillIcon" .. ii)
    slot.expStr = (UI.createAndCopyBasePropertyControl)(Panel_Window_GuildStable_Info, "SkillLearn_PercentString", slot.base, "GuildStableInfo_SkillExpStr_" .. ii)
    slot.name = (UI.createAndCopyBasePropertyControl)(Panel_Window_GuildStable_Info, "Static_Text_SkillName", slot.base, "GuildStableInfo_SkillName_" .. ii)
    slot.dec = (UI.createAndCopyBasePropertyControl)(Panel_Window_GuildStable_Info, "Static_Text_SkillCondition", slot.base, "GuildStableInfo_SkillDec_" .. ii)
    slot.buttonLock = (UI.createAndCopyBasePropertyControl)(Panel_Window_GuildStable_Info, "Button_SkillLock", slot.base, "GuildStableIngo_SkillLock_" .. ii)
    ;
    (slot.base):SetPosX(slotConfig.startX)
    ;
    (slot.base):SetPosY(slotConfig.startY + slotConfig.gapY * ii)
    local skillConfig = (self._config).skill
    ;
    (slot.icon):SetPosX(skillConfig.startIconX)
    ;
    (slot.icon):SetPosY(skillConfig.startIconY)
    ;
    (slot.name):SetPosX(skillConfig.startNameX)
    ;
    (slot.name):SetPosY(skillConfig.startNameY)
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
    (slot.expStr):SetPosX(skillConfig.startIconX + 10)
    ;
    (slot.expStr):SetPosY(skillConfig.startIconY + 30)
    ;
    (slot.buttonLock):SetPosX(skillConfig.startButtonX + 10)
    ;
    (slot.buttonLock):SetPosY(skillConfig.startButtonY)
    ;
    (slot.base):addInputEvent("Mouse_UpScroll", "GuildStableInfo_ScrollEvent( true )")
    ;
    (slot.base):addInputEvent("Mouse_DownScroll", "GuildStableInfo_ScrollEvent( false )")
    slot.key = 0
    -- DECOMPILER ERROR at PC224: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (self._skill)[ii] = slot
  end
  self._staticSkillEffect = (UI.createAndCopyBasePropertyControl)(Panel_Window_GuildStable_Info, "Static_SkillIChange_EffectPanel", self._staticSkillBG, "StableInfo_SkillEffect")
end

guildStableInfo.update = function(self)
  -- function num : 0_4
  local servantInfo = guildStable_getServant(GuildStableList_SelectSlotNo())
  if servantInfo == nil then
    GuildStableInfo_Close()
    return 
  end
  ;
  (self._staticName):SetText(servantInfo:getName())
  ;
  (self._staticLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. tostring(servantInfo:getLevel()))
  ;
  (self._staticLevel):SetShow(false)
  ;
  (self._staticHP):SetText(makeDotMoney(servantInfo:getHp()) .. " / " .. makeDotMoney(servantInfo:getMaxHp()))
  ;
  (self._staticMP):SetText(makeDotMoney(servantInfo:getMp()) .. " / " .. makeDotMoney(servantInfo:getMaxMp()))
  ;
  (self._staticWeight):SetShow(false)
  ;
  (self._staticEXP):SetShow(false)
  ;
  (self._staticHpGauge):SetSize(2.5 * (servantInfo:getHp() / servantInfo:getMaxHp() * 100), 6)
  ;
  (self._staticMpGauge):SetSize(2.5 * (servantInfo:getMp() / servantInfo:getMaxMp() * 100), 6)
  local s64_exp = servantInfo:getExp_s64()
  local s64_needexp = servantInfo:getNeedExp_s64()
  local s64_exp_percent = (Defines.s64_const).s64_0
  if (Defines.s64_const).s64_0 < s64_exp then
    s64_exp_percent = 2.5 * (Int64toInt32(s64_exp) / Int64toInt32(s64_needexp) * 100)
  end
  ;
  (self._staticExpGauge):SetShow(false)
  ;
  (self._staticMoveSpeed):SetText((string.format)("%.1f", servantInfo:getStat((CppEnums.ServantStatType).Type_MaxMoveSpeed) / 10000) .. "%")
  ;
  (self._staticAcceleration):SetText((string.format)("%.1f", servantInfo:getStat((CppEnums.ServantStatType).Type_Acceleration) / 10000) .. "%")
  ;
  (self._staticCornering):SetText((string.format)("%.1f", servantInfo:getStat((CppEnums.ServantStatType).Type_CorneringSpeed) / 10000) .. "%")
  ;
  (self._staticBrakeSpeed):SetText((string.format)("%.1f", servantInfo:getStat((CppEnums.ServantStatType).Type_BrakeSpeed) / 10000) .. "%")
  ;
  (self._staticTitleMaxMoveSpeed):SetShow(true)
  ;
  (self._staticTitleAcceleration):SetShow(true)
  ;
  (self._staticTitleCorneringSpeed):SetShow(true)
  ;
  (self._staticTitleBrakeSpeed):SetShow(true)
  ;
  (self._staticMoveSpeed):SetShow(true)
  ;
  (self._staticAcceleration):SetShow(true)
  ;
  (self._staticCornering):SetShow(true)
  ;
  (self._staticBrakeSpeed):SetShow(true)
  ;
  (self._deadCount):SetShow(false)
  ;
  (self._deadCountValue):SetShow(false)
  ;
  (self._deadCount):SetShow(true)
  ;
  (self._deadCountValue):SetShow(true)
  local deadCount = servantInfo:getDeadCount()
  ;
  (self._deadCount):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDSERVANTINFO_INJURY"))
  ;
  (self._deadCountValue):SetText(deadCount * 10 .. "%")
  if servantInfo:isPeriodLimit() then
    (self._staticLifeValue):SetText(convertStringFromDatetime(servantInfo:getExpiredTime()))
  else
    ;
    (self._staticLifeValue):SetText(PAGetString(Defines.StringSheet_RESOURCE, "STABLE_INFO_TEXT_LIFEVALUE"))
  end
  ;
  (self._maleIcon):SetShow(false)
  ;
  (self._femaleIcon):SetShow(false)
  if servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Horse then
    if servantInfo:isMale() then
      (self._maleIcon):SetShow(true)
      ;
      (self._femaleIcon):SetShow(false)
    else
      ;
      (self._maleIcon):SetShow(false)
      ;
      (self._femaleIcon):SetShow(true)
    end
  else
    ;
    (self._maleIcon):SetShow(false)
    ;
    (self._femaleIcon):SetShow(false)
  end
  if servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Elephant then
    (self._staticHPTitle):addInputEvent("Mouse_On", "GuildStableInfo_SimpleTooltip( true, 0 )")
    ;
    (self._staticHPTitle):addInputEvent("Mouse_Out", "GuildStableInfo_SimpleTooltip( false, 0 )")
    ;
    (self._staticHPTitle):setTooltipEventRegistFunc("GuildStableInfo_SimpleTooltip( true, 0 )")
    ;
    (self._staticMPTitle):addInputEvent("Mouse_On", "GuildStableInfo_SimpleTooltip( true, 1 )")
    ;
    (self._staticMPTitle):addInputEvent("Mouse_On", "GuildStableInfo_SimpleTooltip( false, 1 )")
    ;
    (self._staticMPTitle):setTooltipEventRegistFunc("GuildStableInfo_SimpleTooltip( true, 1 )")
  end
  self:updateSkill(unsealType)
end

FGlobal_GuildStableInfoUpdate = function()
  -- function num : 0_5 , upvalues : guildStableInfo
  local self = guildStableInfo
  local servantInfo = guildStable_getServant(GuildStableList_SelectSlotNo())
  if servantInfo ~= nil then
    return 
  end
  ;
  (self._staticHP):SetText(tostring(servantInfo:getHp()) .. " / " .. tostring(servantInfo:getMaxHp()))
  ;
  (self._staticMP):SetText(tostring(servantInfo:getMp()) .. " / " .. tostring(servantInfo:getMaxMp()))
  ;
  (self._staticHpGauge):SetSize(2.5 * (servantInfo:getHp() / servantInfo:getMaxHp() * 100), 6)
  ;
  (self._staticMpGauge):SetSize(2.5 * (servantInfo:getMp() / servantInfo:getMaxMp() * 100), 6)
end

guildStableInfo.updateSkill = function(self)
  -- function num : 0_6
  local servantInfo = guildStable_getServant(GuildStableList_SelectSlotNo())
  if servantInfo == nil then
    return 
  end
  for ii = 0, ((self._config).slot).count - 1 do
    local slot = (self._skill)[ii]
    ;
    (slot.base):SetShow(false)
    ;
    (slot.exp):SetShow(false)
    ;
    (slot.expStr):SetShow(false)
    ;
    (slot.buttonLock):SetShow(false)
  end
  if servantInfo == nil then
    return 
  end
  if not servantInfo:doHaveVehicleSkill() then
    (self._staticSkillPanel):SetShow(true)
    ;
    (self._scrollSkill):SetShow(false)
    return 
  end
  local temporarySlotIndex = 0
  local slotNo = 0
  self._temporayLearnSkillCount = 0
  self._temporaySlotCount = servantInfo:getSkillCount()
  local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
  local regionName = regionInfo:getAreaName()
  local servantRegionName = servantInfo:getRegionName()
  for ii = 1, self._temporaySlotCount - 1 do
    local skillWrapper = servantInfo:getSkill(ii)
    if skillWrapper ~= nil then
      if slotNo < ((self._config).slot).count then
        if self._startSlotIndex <= temporarySlotIndex then
          local slot = (self._skill)[slotNo]
          slot.key = ii
          ;
          (slot.icon):ChangeTextureInfoName("Icon/" .. skillWrapper:getIconPath())
          ;
          (slot.name):SetText(skillWrapper:getName())
          ;
          (slot.dec):SetText(skillWrapper:getDescription())
          ;
          (slot.exp):SetProgressRate(servantInfo:getSkillExp(ii) / (skillWrapper:getMaxExp() / 100))
          ;
          (slot.exp):SetAniSpeed(0)
          local expTxt = tonumber((string.format)("%.0f", servantInfo:getSkillExp(ii) / (skillWrapper:getMaxExp() / 100)))
          if expTxt >= 100 then
            expTxt = 100
          end
          ;
          (slot.expStr):SetText(expTxt .. "%")
          ;
          (slot.exp):SetShow(true)
          ;
          (slot.expStr):SetShow(true)
          if servantInfo:isSkillLock(ii) and servantInfo:getStateType() ~= (CppEnums.ServantStateType).Type_SkillTraining then
            (slot.buttonLock):SetShow(true)
          end
          ;
          (slot.base):SetShow(true)
          slotNo = slotNo + 1
        end
        do
          do
            temporarySlotIndex = temporarySlotIndex + 1
            self._temporayLearnSkillCount = self._temporayLearnSkillCount + 1
            -- DECOMPILER ERROR at PC174: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC174: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC174: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC174: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC174: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  for ii = 1, self._temporaySlotCount - 1 do
    local skillWrapper = servantInfo:getSkillXXX(ii)
    if skillWrapper ~= nil and servantInfo:getStateType() ~= (CppEnums.ServantStateType).Type_SkillTraining then
      if slotNo < ((self._config).slot).count then
        do
          do
            if self._startSlotIndex <= temporarySlotIndex then
              local slot = (self._skill)[slotNo]
              slot.key = ii
              ;
              (slot.icon):ChangeTextureInfoName("Icon/" .. skillWrapper:getIconPath())
              ;
              (slot.name):SetText(skillWrapper:getName())
              ;
              (slot.dec):SetText(skillWrapper:getDescription())
              ;
              (slot.base):SetShow(true)
              slotNo = slotNo + 1
            end
            temporarySlotIndex = temporarySlotIndex + 1
            self._temporayLearnSkillCount = self._temporayLearnSkillCount + 1
            -- DECOMPILER ERROR at PC229: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC229: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC229: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC229: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC229: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  if self._temporayLearnSkillCount > 0 then
    (self._staticSkillPanel):SetShow(true)
    ;
    (UIScroll.SetButtonSize)(self._scrollSkill, ((self._config).slot).count, self._temporayLearnSkillCount)
  end
end

guildStableInfo.registEventHandler = function(self)
  -- function num : 0_7
  (self._staticSkillPanel):addInputEvent("Mouse_UpScroll", "GuildStableInfo_ScrollEvent( true )")
  ;
  (self._staticSkillPanel):addInputEvent("Mouse_DownScroll", "GuildStableInfo_ScrollEvent( false )")
  ;
  (UIScroll.InputEvent)(self._scrollSkill, "GuildStableInfo_ScrollEvent")
end

guildStableInfo.registMessageHandler = function(self)
  -- function num : 0_8
  registerEvent("onScreenResize", "GuildStableInfo_Resize")
end

GuildStableInfo_Resize = function()
  -- function num : 0_9
  Panel_Window_GuildStable_Info:SetSpanSize(20, 30)
  Panel_Window_GuildStable_Info:ComputePos()
end

GuildStableInfo_ScrollEvent = function(isScrollUp)
  -- function num : 0_10 , upvalues : guildStableInfo
  local self = guildStableInfo
  self._startSlotIndex = (UIScroll.ScrollEvent)(self._scrollSkill, isScrollUp, ((self._config).slot).count, self._temporayLearnSkillCount, self._startSlotIndex, 1)
  self:update()
end

GuildStableInfo_SimpleTooltip = function(isShow, tipType)
  -- function num : 0_11 , upvalues : guildStableInfo
  local self = guildStableInfo
  local name, desc, control = nil, nil, nil
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_HORSEHP_TOOLTIP_HORSEHP_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_HORSEHP_TOOLTIP_ELEPHANTHP_DESC")
    control = self._staticHPTitle
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_HORSEHP_TOOLTIP_CARRIAGEMP_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_HORSEHP_TOOLTIP_ELEPHANTMP_DESC")
      control = self._staticMPTitle
    end
  end
  registTooltipControl(control, Panel_Tooltip_SimpleText)
  if isShow == true then
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

GuildStableInfo_Open = function()
  -- function num : 0_12 , upvalues : guildStableInfo
  if not Panel_Window_GuildStable_Info:GetShow() then
    Panel_Window_GuildStable_Info:SetShow(true)
  end
  self = guildStableInfo
  self:clear()
  ;
  (self._scrollSkill):SetControlPos(0)
  self:update()
end

GuildStableInfo_Close = function()
  -- function num : 0_13
  if not Panel_Window_GuildStable_Info:GetShow() then
    Panel_Window_GuildStable_Info:SetShow(false)
  end
end

guildStableInfo:init()
guildStableInfo:registEventHandler()
guildStableInfo:registMessageHandler()
GuildStableInfo_Resize()

