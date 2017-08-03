-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\stable\panel_window_stableinfo.luac 

-- params : ...
-- function num : 0
Panel_Window_StableInfo:SetShow(false, false)
Panel_Window_StableInfo:setMaskingChild(true)
Panel_Window_StableInfo:ActiveMouseEventEffect(true)
Panel_Window_StableInfo:SetDragEnable(true)
Panel_Window_StableInfo:RegisterShowEventFunc(true, "StableInfoShowAni()")
Panel_Window_StableInfo:RegisterShowEventFunc(false, "StableInfoHideAni()")
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local isContentsEnable = ToClient_IsContentsGroupOpen("60")
local isContentsStallionEnable = ToClient_IsContentsGroupOpen("243")
local isContentsNineTierEnable = ToClient_IsContentsGroupOpen("80")
;
((UI.getChildControl)(Panel_Window_StableInfo, "Stable_Info_Ability")):setGlassBackground(true)
;
((UI.getChildControl)(Panel_Window_StableInfo, "Panel_Skill")):setGlassBackground(true)
StableInfoShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV, UI_color
  Panel_Window_StableInfo:SetShow(true, false)
  ;
  (UIAni.fadeInSCR_Right)(Panel_Window_StableInfo)
  local aniInfo3 = Panel_Window_StableInfo:addColorAnimation(0, 0.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo3:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo3.IsChangeChild = false
end

StableInfoHideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
  Panel_Window_StableInfo:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_Window_StableInfo:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

local stableInfo = {
_config = {
slot = {startX = 5, startY = 5, startBGX = 10, startBGY = 38, startScrollX = 319, startScrollY = 13, buttonSizeX = 60, halfButtonSizeY = 28, gapY = 66, count = 4}
, 
skill = {startIconX = 5, startIconY = 7, startNameX = 59, startNameY = 2, startDecX = 59, startDecY = 23, startExpBGX = 0, startExpBGY = 2, startExpX = 2, startExpY = 4, startButtonX = 251, startButtonY = 4}
}
, _maleIcon = (UI.getChildControl)(Panel_Window_StableInfo, "Static_MaleIcon"), _femaleIcon = (UI.getChildControl)(Panel_Window_StableInfo, "Static_FemaleIcon"), _iconStallion = (UI.getChildControl)(Panel_Window_StableInfo, "Static_iconStallion"), _staticName = (UI.getChildControl)(Panel_Window_StableInfo, "StaticText_Name"), _staticLevel = (UI.getChildControl)(Panel_Window_StableInfo, "Static_Text_Level"), _staticHpGauge = (UI.getChildControl)(Panel_Window_StableInfo, "HP_GaugeBar"), _staticMpGauge = (UI.getChildControl)(Panel_Window_StableInfo, "MP_GaugeBar"), _staticExpGauge = (UI.getChildControl)(Panel_Window_StableInfo, "EXP_GaugeBar"), _staticWeightGauge = (UI.getChildControl)(Panel_Window_StableInfo, "Weight_GaugeBar"), _staticHPTitle = (UI.getChildControl)(Panel_Window_StableInfo, "HP"), _staticMPTitle = (UI.getChildControl)(Panel_Window_StableInfo, "MP"), _staticHP = (UI.getChildControl)(Panel_Window_StableInfo, "HP_CountData"), _staticMP = (UI.getChildControl)(Panel_Window_StableInfo, "MP_CountData"), _staticEXP = (UI.getChildControl)(Panel_Window_StableInfo, "EXP_CountData"), _staticWeight = (UI.getChildControl)(Panel_Window_StableInfo, "WHT_CountData"), _staticTitleMaxMoveSpeed = (UI.getChildControl)(Panel_Window_StableInfo, "MaxMoveSpeed"), _staticTitleAcceleration = (UI.getChildControl)(Panel_Window_StableInfo, "Acceleration"), _staticTitleCorneringSpeed = (UI.getChildControl)(Panel_Window_StableInfo, "CorneringSpeed"), _staticTitleBrakeSpeed = (UI.getChildControl)(Panel_Window_StableInfo, "BrakeSpeed"), _staticMoveSpeed = (UI.getChildControl)(Panel_Window_StableInfo, "MaxMoveSpeedValue"), _staticAcceleration = (UI.getChildControl)(Panel_Window_StableInfo, "AccelerationValue"), _staticCornering = (UI.getChildControl)(Panel_Window_StableInfo, "CorneringSpeedValue"), _staticBrakeSpeed = (UI.getChildControl)(Panel_Window_StableInfo, "BrakeSpeedValue"), _staticMatingCount = (UI.getChildControl)(Panel_Window_StableInfo, "Static_MatingCount"), _staticMatingCountValue = (UI.getChildControl)(Panel_Window_StableInfo, "Static_MatingCountValue"), _staticMatingtime = (UI.getChildControl)(Panel_Window_StableInfo, "Static_MatingTime"), _staticMatingtimeValue = (UI.getChildControl)(Panel_Window_StableInfo, "Static_MatingTimeValue"), _staticTrainingTime = (UI.getChildControl)(Panel_Window_StableInfo, "Static_TrainingTime"), _staticTrainingTimeValue = (UI.getChildControl)(Panel_Window_StableInfo, "Static_TrainingTimeValue"), _btnMatingImmediately = (UI.getChildControl)(Panel_Window_StableInfo, "Button_MatingImmediately"), _staticLife = (UI.getChildControl)(Panel_Window_StableInfo, "Static_LifeCount"), _staticLifeValue = (UI.getChildControl)(Panel_Window_StableInfo, "Static_LifeCountValue"), _staticImprint = (UI.getChildControl)(Panel_Window_StableInfo, "Static_Imprint"), _staticImprintValue = (UI.getChildControl)(Panel_Window_StableInfo, "Static_ImprintValue"), _staticSkillPanel = (UI.getChildControl)(Panel_Window_StableInfo, "Panel_Skill"), _deadCount = (UI.getChildControl)(Panel_Window_StableInfo, "StaticText_DeadCount"), _deadCountValue = (UI.getChildControl)(Panel_Window_StableInfo, "StaticText_DeadCountValue"), panel_abillity = (UI.getChildControl)(Panel_Window_StableInfo, "Stable_Info_Ability"), _staticWantSkillBG = (UI.getChildControl)(Panel_Window_StableInfo, "Static_WantSkillBG"), _staticChangeBG = (UI.getChildControl)(Panel_Window_StableInfo, "Static_ChangeSkillBG"), _staticChangeTitle = (UI.getChildControl)(Panel_Window_StableInfo, "StaticText_ChangeSkillTitle"), _staticSkillTargetName = (UI.getChildControl)(Panel_Window_StableInfo, "StaticText_ChangeSkillName"), _staticSkillTargetIcon = (UI.getChildControl)(Panel_Window_StableInfo, "Static_ChangeSkillIcon"), _staticSkillTargetCount = (UI.getChildControl)(Panel_Window_StableInfo, "StaticText_ChangeSkillCount"), _staticTextChangeDesc = (UI.getChildControl)(Panel_Window_StableInfo, "StaticText_ChangeSkillDesc"), _startSlotIndex = 0, _temporaySlotCount = 0, _temporayLearnSkillCount = 0, currentServantType = nil, _skill = (Array.new)(), _fromSkillKey = nil, _toSkillKey = nil}
local carrageInfo = {_panel = (UI.getChildControl)(Panel_Window_StableInfo, "Carriage_Info"), _title = (UI.getChildControl)(Panel_Window_StableInfo, "Static_CarriageInfo_Title"), _bg = (UI.getChildControl)(Panel_Window_StableInfo, "Static_AddHorseBG"), _maxCount = (UI.getChildControl)(Panel_Window_StableInfo, "StaticText_CarriageSlotMaxCount"), _maxCountValue = (UI.getChildControl)(Panel_Window_StableInfo, "StaticText_MaxCountValue"), _horseSlot = (UI.getChildControl)(Panel_Window_StableInfo, "Static_CarriageHorse"), _name = (UI.getChildControl)(Panel_Window_StableInfo, "StaticText_CarriageHorse_Name"), _level = (UI.getChildControl)(Panel_Window_StableInfo, "StaticText_Horse_Level"), _btnRelease = (UI.getChildControl)(Panel_Window_StableInfo, "Button_ReleaseHorse"), _expText = (UI.getChildControl)(Panel_Window_StableInfo, "Horse_EXP_CountData"), _expBg = (UI.getChildControl)(Panel_Window_StableInfo, "Horse_EXP_Bg"), _expGauge = (UI.getChildControl)(Panel_Window_StableInfo, "Horse_EXP_GaugeBar"), slotCount = 4, gapY = 68, 
baseSlot = {}
}
carrageInfo.init = function(self)
  -- function num : 0_2 , upvalues : stableInfo, carrageInfo
  (stableInfo._iconStallion):SetShow(false)
  for index = 0, self.slotCount - 1 do
    local temp = {}
    temp._horseSlot = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Window_StableInfo, "Static_HorseSlot_" .. index)
    CopyBaseProperty(self._horseSlot, temp._horseSlot)
    ;
    (temp._horseSlot):SetPosY((self._horseSlot):GetPosY() + self.gapY * index)
    temp._name = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_Window_StableInfo, "StaticText_CarriageHorse_Name_" .. index)
    CopyBaseProperty(self._name, temp._name)
    ;
    (temp._name):SetPosY((self._name):GetPosY() + self.gapY * index)
    temp._level = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_Window_StableInfo, "StaticText_Horse_Level_" .. index)
    CopyBaseProperty(self._level, temp._level)
    ;
    (temp._level):SetPosY((self._level):GetPosY() + self.gapY * index)
    temp._btnRelease = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, Panel_Window_StableInfo, "Button_ReleaseHorse_" .. index)
    CopyBaseProperty(self._btnRelease, temp._btnRelease)
    ;
    (temp._btnRelease):SetPosY((self._btnRelease):GetPosY() + self.gapY * index)
    temp._expText = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_Window_StableInfo, "Horse_EXP_CountData_" .. index)
    CopyBaseProperty(self._expText, temp._expText)
    ;
    (temp._expText):SetPosY((self._expText):GetPosY() + self.gapY * index)
    temp._expBg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Window_StableInfo, "Horse_EXP_Bg_" .. index)
    CopyBaseProperty(self._expBg, temp._expBg)
    ;
    (temp._expBg):SetPosY((self._expBg):GetPosY() + self.gapY * index)
    temp._expGauge = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Window_StableInfo, "Horse_EXP_GaugeBar_" .. index)
    CopyBaseProperty(self._expGauge, temp._expGauge)
    ;
    (temp._expGauge):SetPosY((self._expGauge):GetPosY() + self.gapY * index)
    -- DECOMPILER ERROR at PC180: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self.baseSlot)[index] = temp
  end
  local maxSizeX = (carrageInfo._maxCount):GetTextSizeX()
  local maxPosX = (carrageInfo._maxCount):GetPosX()
  local countPosX = (carrageInfo._maxCountValue):GetPosX()
  if countPosX < maxSizeX + maxPosX + 10 then
    (carrageInfo._maxCount):SetPosX((carrageInfo._maxCount):GetPosX() + (countPosX - (maxSizeX + maxPosX + 10)))
  end
end

carrageInfo:init()
carrageInfo_Check = function(carriageNo)
  -- function num : 0_3 , upvalues : stableInfo, carrageInfo
  (stableInfo._staticSkillPanel):SetShow(false)
  carrageInfo:open()
  local servantInfo = stable_getServantByServantNo(carriageNo)
  if servantInfo == nil then
    return 
  end
  ;
  (carrageInfo._maxCountValue):SetText(servantInfo:getCurrentLinkCount() .. " / " .. servantInfo:getLinkCount())
  local servantCount = ToClient_getStableCountEx(false)
  local linkedCount = 0
  for index = 0, servantCount - 1 do
    local sInfo = ToClient_getStableServantEx(index, false)
    if sInfo ~= nil and sInfo:isLink() and carriageNo == sInfo:getOwnerServantNo_s64() then
      for v,control in pairs((carrageInfo.baseSlot)[linkedCount]) do
        control:SetShow(true)
      end
      local linkedHorse = (carrageInfo.baseSlot)[linkedCount]
      ;
      (linkedHorse._horseSlot):ChangeTextureInfoName(sInfo:getIconPath1())
      ;
      (linkedHorse._name):SetText(sInfo:getName())
      ;
      (linkedHorse._level):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. tostring(sInfo:getLevel()))
      ;
      (linkedHorse._expText):SetText(makeDotMoney(sInfo:getExp_s64()) .. " / " .. makeDotMoney(sInfo:getNeedExp_s64()))
      local s64_exp = sInfo:getExp_s64()
      local s64_needexp = sInfo:getNeedExp_s64()
      local s64_exp_percent = (Defines.s64_const).s64_0
      if (Defines.s64_const).s64_0 < s64_exp then
        s64_exp_percent = 1.9 * (Int64toInt32(s64_exp) / Int64toInt32(s64_needexp) * 100)
      end
      ;
      (linkedHorse._expGauge):SetSize(s64_exp_percent, 6)
      if StableList_SelectSlotNo() == nil then
        (linkedHorse._btnRelease):addInputEvent("Mouse_LUp", "ReleaseFromCarriage()")
      else
        ;
        (linkedHorse._btnRelease):addInputEvent("Mouse_LUp", "ReleaseFromCarriage(" .. index .. ", " .. StableList_SelectSlotNo() .. ")")
      end
      linkedCount = linkedCount + 1
    end
  end
end

ReleaseFromCarriage = function(servantSlotNo, CarriageSlotNo)
  -- function num : 0_4
  if servantSlotNo == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEINFO_STABLE_ALERT"))
    return 
  end
  local releaseCarriage = function()
    -- function num : 0_4_0 , upvalues : servantSlotNo, CarriageSlotNo
    stable_link(servantSlotNo, CarriageSlotNo, false)
    FGlobal_StableList_Update()
  end

  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_STABLEINFO_CARRIAGE_UNLINK_ALERT")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_STABLEINFO_CARRIAGE_UNLINK"), content = messageBoxMemo, functionYes = releaseCarriage, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

carrageInfo.open = function(self)
  -- function num : 0_5
  if (self._panel):GetShow() then
    return 
  end
  ;
  (self._panel):SetShow(true)
  ;
  (self._title):SetShow(true)
  ;
  (self._bg):SetShow(true)
  ;
  (self._maxCount):SetShow(true)
  ;
  (self._maxCountValue):SetShow(true)
end

carrageInfo.close = function(self)
  -- function num : 0_6 , upvalues : carrageInfo
  if not (self._panel):GetShow() then
    return 
  end
  ;
  (self._panel):SetShow(false)
  ;
  (self._title):SetShow(false)
  ;
  (self._bg):SetShow(false)
  ;
  (self._maxCount):SetShow(false)
  ;
  (self._maxCountValue):SetShow(false)
  for index = 0, 3 do
    for v,control in pairs((carrageInfo.baseSlot)[index]) do
      control:SetShow(false)
    end
  end
end

stableInfo.clear = function(self)
  -- function num : 0_7
  self._fromSkillKey = nil
  self._toSkillKey = nil
end

stableInfo.init = function(self)
  -- function num : 0_8 , upvalues : UI_TM
  self._staticSkillTitle = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableInfo, "Skill_Title", self._staticSkillPanel, "StableInfo_SkillTitle")
  self._staticSkillBG = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableInfo, "Static_SkillBG", self._staticSkillPanel, "StableInfo_SkillBG")
  self._scrollSkill = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableInfo, "Scroll_Skill", self._staticSkillBG, "StableInfo_SkillScroll")
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
  ;
  (self._iconStallion):addInputEvent("Mouse_On", "StableServantInfo_StallionToolTip( true )")
  ;
  (self._iconStallion):addInputEvent("Mouse_Out", "StableServantInfo_StallionToolTip( false )")
  for ii = 0, ((self._config).slot).count - 1 do
    local slot = {}
    slot.base = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableInfo, "Button_Skill", self._staticSkillBG, "StableInfo_Skill_" .. ii)
    slot.expBG = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableInfo, "Static_SkillExpBG", slot.base, "StableInfo_SkillExpBG_" .. ii)
    slot.exp = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableInfo, "Gauge_SkillExp", slot.base, "StableInfo_SkillExp_" .. ii)
    slot.icon = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableInfo, "Static_SkillIcon", slot.base, "StableInfo_SkillIcon" .. ii)
    slot.expStr = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableInfo, "SkillLearn_PercentString", slot.base, "StableInfo_SkillExpStr_" .. ii)
    slot.name = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableInfo, "Static_Text_SkillName", slot.base, "StableInfo_SkillName_" .. ii)
    slot.dec = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableInfo, "Static_Text_SkillCondition", slot.base, "StableInfo_SkillDec_" .. ii)
    slot.button = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableInfo, "Button_SkillChange", slot.base, "StableInfo_SkillButton_" .. ii)
    slot.buttonDel = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableInfo, "Button_SkillDelete", slot.base, "StableInfo_SkillDelButton_" .. ii)
    slot.buttonLock = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableInfo, "Button_SkillLock", slot.base, "StableInfo_SkillLock_" .. ii)
    slot.buttonTarget = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableInfo, "Button_SkillTarget", slot.base, "StableInfo_SkillTarget_" .. ii)
    slot.buttonTraining = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableInfo, "Button_SkillTraining", slot.base, "StableInfo_SkillTraining_" .. ii)
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
    (slot.button):SetPosX(skillConfig.startButtonX + 10)
    ;
    (slot.button):SetPosY(skillConfig.startButtonY)
    ;
    (slot.buttonDel):SetPosX(skillConfig.startButtonX + 10)
    ;
    (slot.buttonDel):SetPosY(skillConfig.startButtonY + 30)
    ;
    (slot.buttonLock):SetPosX(skillConfig.startButtonX + 10)
    ;
    (slot.buttonLock):SetPosY(skillConfig.startButtonY)
    ;
    (slot.buttonTarget):SetPosX(skillConfig.startButtonX + 10)
    ;
    (slot.buttonTarget):SetPosY(skillConfig.startButtonY)
    ;
    (slot.buttonTraining):SetPosX(skillConfig.startButtonX - 42)
    ;
    (slot.buttonTraining):SetPosY(skillConfig.startButtonY)
    ;
    (slot.dec):SetTextMode(UI_TM.eTextMode_AutoWrap)
    ;
    (self._staticTextChangeDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
    ;
    (self._staticTextChangeDesc):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_STABLE_INFO_CHANGESKILLDESC"))
    ;
    (self._staticWantSkillBG):SetSize((self._staticWantSkillBG):GetSizeX(), (self._staticTextChangeDesc):GetTextSizeY() + 110)
    ;
    (slot.base):addInputEvent("Mouse_UpScroll", "StableInfo_ScrollEvent( true )")
    ;
    (slot.base):addInputEvent("Mouse_DownScroll", "StableInfo_ScrollEvent( false )")
    ;
    (slot.button):addInputEvent("Mouse_LUp", "Button_SkillChange(" .. ii .. ")")
    ;
    (slot.buttonDel):addInputEvent("Mouse_LUp", "Button_Skill_Delete(" .. ii .. ")")
    ;
    (slot.buttonTarget):addInputEvent("Mouse_LUp", "Button_SkillTarget(" .. ii .. ")")
    ;
    (slot.buttonTraining):addInputEvent("Mouse_LUp", "Button_SkillTraining(" .. ii .. ")")
    slot.key = 0
    -- DECOMPILER ERROR at PC371: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (self._skill)[ii] = slot
  end
  self._staticSkillEffect = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableInfo, "Static_SkillIChange_EffectPanel", self._staticSkillBG, "StableInfo_SkillEffect")
end

FGlobal_StableList_UnsealInfo = function(unsealType)
  -- function num : 0_9
  StableInfo_Open(unsealType)
end

stableInfo.update = function(self, unsealType)
  -- function num : 0_10 , upvalues : isContentsStallionEnable, stableInfo
  if unsealType == nil and StableList_SelectSlotNo() ~= nil then
    unsealType = 0
  end
  if StableList_SelectSlotNo() == nil then
    unsealType = 1
  end
  local servantInfo = nil
  do
    if unsealType == 1 then
      local temporaryWrapper = getTemporaryInformationWrapper()
      if temporaryWrapper == nil then
        return 
      end
      servantInfo = temporaryWrapper:getUnsealVehicle(stable_getServantType())
    else
    end
    if unsealType == 2 then
      servantInfo = stable_getServant(StableList_SelectSlotNo())
      if servantInfo == nil then
        StableInfo_Close()
        return 
      end
      if servantInfo:getVehicleType() ~= (CppEnums.VehicleType).Type_Horse then
        (self._staticWantSkillBG):SetShow(false)
        ;
        (self._staticChangeBG):SetShow(false)
        ;
        (self._staticChangeTitle):SetShow(false)
        ;
        (self._staticSkillTargetName):SetShow(false)
        ;
        (self._staticSkillTargetIcon):SetShow(false)
        ;
        (self._staticSkillTargetCount):SetShow(false)
        ;
        (self._staticTextChangeDesc):SetShow(false)
        ;
        (self._iconStallion):SetShow(false)
      end
      ;
      (self._iconStallion):SetShow(false)
      ;
      (self._iconStallion):SetMonoTone(true)
      ;
      (self._staticName):SetText(servantInfo:getName())
      ;
      (self._staticLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. tostring(servantInfo:getLevel()))
      ;
      (self._staticHP):SetText(makeDotMoney(servantInfo:getHp()) .. " / " .. makeDotMoney(servantInfo:getMaxHp()))
      ;
      (self._staticMP):SetText(makeDotMoney(servantInfo:getMp()) .. " / " .. makeDotMoney(servantInfo:getMaxMp()))
      ;
      (self._staticWeight):SetText(makeDotMoney(servantInfo:getMaxWeight_s64() / (Defines.s64_const).s64_10000))
      ;
      (self._staticEXP):SetText(makeDotMoney(servantInfo:getExp_s64()) .. " / " .. makeDotMoney(servantInfo:getNeedExp_s64()))
      ;
      (self._staticHpGauge):SetSize(2.7 * (servantInfo:getHp() / servantInfo:getMaxHp() * 100), 6)
      ;
      (self._staticMpGauge):SetSize(2.7 * (servantInfo:getMp() / servantInfo:getMaxMp() * 100), 6)
      if servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Horse and servantInfo:getTier() ~= 9 and servantInfo:isPcroomOnly() == false and isContentsStallionEnable then
        (self._iconStallion):SetShow(true)
        local isStallion = servantInfo:isStallion()
        if isStallion == true then
          (self._iconStallion):SetMonoTone(false)
        else
          ;
          (self._iconStallion):SetMonoTone(true)
        end
      else
        do
          ;
          (self._iconStallion):SetShow(false)
          local s64_exp = servantInfo:getExp_s64()
          local s64_needexp = servantInfo:getNeedExp_s64()
          local s64_exp_percent = (Defines.s64_const).s64_0
          if (Defines.s64_const).s64_0 < s64_exp then
            s64_exp_percent = 2.7 * (Int64toInt32(s64_exp) / Int64toInt32(s64_needexp) * 100)
          end
          ;
          (self._staticExpGauge):SetSize(s64_exp_percent, 6)
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
          if servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Horse or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Camel or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Donkey or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Elephant then
            (self._deadCount):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEINFO_KILLCOUNT"))
          else
            if servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Carriage or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_CowCarriage or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_RepairableCarriage then
              (self._deadCount):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEINFO_DESTROYCOUNT"))
            else
              if servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Boat or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Raft or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_FishingBoat or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_SailingBoat then
                (self._deadCount):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEINFO_DESTROYCOUNT"))
              end
            end
          end
          if servantInfo:doClearCountByDead() then
            deadCount = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_STABLEINFO_RESETOK", "deadCount", deadCount)
          else
            deadCount = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_STABLEINFO_RESETNO", "deadCount", deadCount)
          end
          ;
          (self._deadCountValue):SetText(deadCount)
          if servantInfo:isPeriodLimit() then
            (self._staticLifeValue):SetText(convertStringFromDatetime(servantInfo:getExpiredTime()))
          else
            ;
            (self._staticLifeValue):SetText(PAGetString(Defines.StringSheet_RESOURCE, "STABLE_INFO_TEXT_LIFEVALUE"))
          end
          if servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Carriage or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_CowCarriage or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_RepairableCarriage then
            (self._staticHPTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SERVANTINFO_DURABILITY"))
            ;
            (self._staticMPTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SERVANTINFO_LIFE"))
            ;
            (self._staticLife):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SERVANTINFO_PERIOD"))
          else
            ;
            (self._staticHPTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HORSEHP_TOOLTIP_HORSEHP_NAME"))
            ;
            (self._staticMPTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SERVANTINFO_STAMINA"))
          end
          ;
          (self._maleIcon):SetShow(false)
          ;
          (self._femaleIcon):SetShow(false)
          ;
          (self._staticMatingCount):SetShow(false)
          ;
          (self._staticMatingCountValue):SetShow(false)
          ;
          (self._staticMatingtime):SetShow(false)
          ;
          (self._staticMatingtimeValue):SetShow(false)
          ;
          (self._btnMatingImmediately):SetShow(false)
          ;
          (self._staticTrainingTime):SetShow(false)
          ;
          (self._staticTrainingTimeValue):SetShow(false)
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
          if servantInfo:doMating() and servantInfo:getTier() ~= 9 then
            local matingCount = servantInfo:getMatingCount()
            if servantInfo:doClearCountByMating() then
              matingCount = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_STABLEINFO_RESETOK", "deadCount", matingCount)
            else
              matingCount = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_STABLEINFO_RESETNO", "deadCount", matingCount)
            end
            ;
            (self._staticMatingCountValue):SetText(matingCount)
            ;
            (self._staticMatingCount):SetShow(true)
            ;
            (self._staticMatingCountValue):SetShow(true)
            if (CppEnums.ServantStateType).Type_Mating == servantInfo:getStateType() and not servantInfo:isMatingComplete() then
              (self._staticMatingtimeValue):SetText(convertStringFromDatetime(servantInfo:getMatingTime()))
              ;
              (self._staticMatingtime):SetShow(true)
              ;
              (self._staticMatingtimeValue):SetShow(true)
              if FGlobal_IsCommercialService() and not servantInfo:isMale() then
                (self._btnMatingImmediately):SetShow(true)
              end
            end
            ;
            (self._staticImprint):SetSpanSize(3, 220)
            ;
            (self._staticImprintValue):SetTextHorizonRight()
            ;
            (self._staticImprintValue):SetSpanSize(80, 220)
          else
            do
              ;
              (self._staticImprint):SetSpanSize(-195, 220)
              ;
              (self._staticImprintValue):SetTextHorizonLeft()
              ;
              (self._staticImprintValue):SetSpanSize(-97, 220)
              if servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Horse or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Camel or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Donkey or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Elephant or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_RidableBabyElephant then
                (stableInfo.panel_abillity):SetSize(370, 250)
              else
                ;
                (stableInfo.panel_abillity):SetSize(370, 225)
              end
              ;
              (self._staticImprint):SetShow(false)
              ;
              (self._staticImprintValue):SetShow(false)
              if servantInfo:isImprint() then
                (self._staticImprint):SetShow(true)
                ;
                (self._staticImprintValue):SetShow(true)
                ;
                (self._staticImprintValue):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEINFO_ISIMPRINTING"))
              else
                if servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Horse or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Camel or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Donkey or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Elephant or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_RidableBabyElephant then
                  (self._staticImprint):SetShow(true)
                  ;
                  (self._staticImprintValue):SetShow(true)
                  ;
                  (self._staticImprintValue):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEINFO_ISIMPRINTPOSSIBLE"))
                end
              end
              self:updateSkill(unsealType)
              FGlobal_StableList_Update()
            end
          end
        end
      end
    end
  end
end

FGlobal_StableInfoUpdate = function()
  -- function num : 0_11 , upvalues : stableInfo
  local self = stableInfo
  local servantInfo = stable_getServant(StableList_SelectSlotNo())
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

stableInfo.updateSkill = function(self, unsealType)
  -- function num : 0_12 , upvalues : carrageInfo, isContentsEnable
  self.currentServantType = unsealType
  local servantInfo = nil
  do
    if unsealType == 1 then
      local temporaryWrapper = getTemporaryInformationWrapper()
      if temporaryWrapper ~= nil then
        servantInfo = temporaryWrapper:getUnsealVehicle(stable_getServantType())
      end
    else
    end
    if unsealType == 2 then
      servantInfo = stable_getServant(StableList_SelectSlotNo())
      for ii = 0, ((self._config).slot).count - 1 do
        local slot = (self._skill)[ii]
        ;
        (slot.base):SetShow(false)
        ;
        (slot.button):SetShow(false)
        ;
        (slot.buttonDel):SetShow(false)
        ;
        (slot.buttonLock):SetShow(false)
        ;
        (slot.buttonTarget):SetShow(false)
        ;
        (slot.exp):SetShow(false)
        ;
        (slot.expStr):SetShow(false)
        ;
        (slot.buttonTraining):SetShow(false)
      end
      carrageInfo:close()
      if servantInfo == nil then
        return 
      end
      if not servantInfo:doHaveVehicleSkill() then
        if servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Carriage then
          local carriageNo = servantInfo:getServantNo()
          carrageInfo_Check(carriageNo)
        else
          do
            ;
            (self._staticSkillPanel):SetShow(true)
            ;
            (self._scrollSkill):SetShow(false)
            do return  end
            local temporarySlotIndex = 0
            local slotNo = 0
            self._temporayLearnSkillCount = 0
            self._temporaySlotCount = servantInfo:getSkillCount()
            local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
            local regionName = regionInfo:getAreaName()
            local servantRegionName = servantInfo:getRegionName()
            if servantInfo:getStateType() == (CppEnums.ServantStateType).Type_SkillTraining then
              if not stable_isSkillExpTrainingComplete(StableList_SelectSlotNo()) then
                (self._staticTrainingTime):SetShow(true)
                ;
                (self._staticTrainingTimeValue):SetShow(true)
                ;
                (self._staticTrainingTimeValue):SetText(convertStringFromDatetime(servantInfo:getSkillTrainingTime()))
              else
                ;
                (self._staticTrainingTime):SetShow(false)
                ;
                (self._staticTrainingTimeValue):SetShow(false)
              end
            end
            for ii = 1, self._temporaySlotCount - 1 do
              local skillWrapper = servantInfo:getSkill(R14_PC158)
              if skillWrapper ~= nil and skillWrapper:isTrainingSkill() == false then
                if slotNo < ((self._config).slot).count then
                  if self._startSlotIndex <= temporarySlotIndex then
                    local slot = (self._skill)[slotNo]
                    slot.key = ii
                    -- DECOMPILER ERROR at PC176: Overwrote pending register: R14 in 'AssignReg'

                    -- DECOMPILER ERROR at PC177: Overwrote pending register: R14 in 'AssignReg'

                    R14_PC158(R14_PC158, "Icon/" .. skillWrapper:getIconPath())
                    -- DECOMPILER ERROR at PC183: Overwrote pending register: R14 in 'AssignReg'

                    -- DECOMPILER ERROR at PC184: Overwrote pending register: R14 in 'AssignReg'

                    R14_PC158(R14_PC158, skillWrapper:getName())
                    -- DECOMPILER ERROR at PC188: Overwrote pending register: R14 in 'AssignReg'

                    -- DECOMPILER ERROR at PC189: Overwrote pending register: R14 in 'AssignReg'

                    R14_PC158(R14_PC158, servantInfo:getSkillExp(R18_PC192) / (skillWrapper:getMaxExp() / 100))
                    -- DECOMPILER ERROR at PC198: Overwrote pending register: R14 in 'AssignReg'

                    -- DECOMPILER ERROR at PC199: Overwrote pending register: R14 in 'AssignReg'

                    R14_PC158(R14_PC158, 0)
                    -- DECOMPILER ERROR at PC202: Overwrote pending register: R14 in 'AssignReg'

                    -- DECOMPILER ERROR at PC206: Overwrote pending register: R18 in 'AssignReg'

                    -- DECOMPILER ERROR at PC209: Overwrote pending register: R18 in 'AssignReg'

                    -- DECOMPILER ERROR at PC211: Overwrote pending register: R18 in 'AssignReg'

                    R14_PC158 = R14_PC158((string.format)("%.0f", servantInfo:getSkillExp(R19_PC208) / R18_PC192))
                    local expTxt = nil
                    if expTxt >= 100 then
                      expTxt = 100
                    else
                      if regionName == servantRegionName and isContentsEnable then
                        if servantInfo:isSeized() or (CppEnums.ServantStateType).Type_RegisterMarket == servantInfo:getStateType() or (CppEnums.ServantStateType).Type_RegisterMating == servantInfo:getStateType() or (CppEnums.ServantStateType).Type_Mating == servantInfo:getStateType() or servantInfo:isMatingComplete() or (CppEnums.ServantStateType).Type_Coma == servantInfo:getStateType() or (CppEnums.ServantStateType).Type_SkillTraining == servantInfo:getStateType() or servantInfo:isLink() then
                          (slot.buttonTraining):SetShow(false)
                        else
                          ;
                          (slot.buttonTraining):SetShow(false)
                          if (CppEnums.VehicleType).Type_Carriage ~= servantInfo:getVehicleType() and (CppEnums.VehicleType).Type_Donkey ~= servantInfo:getVehicleType() then
                            (slot.buttonTraining):SetShow(true)
                          end
                        end
                      end
                    end
                    -- DECOMPILER ERROR at PC306: Overwrote pending register: R18 in 'AssignReg'

                    if (slot.buttonTraining):GetShow() then
                      (slot.dec):SetSize(150, R18_PC192)
                    else
                      -- DECOMPILER ERROR at PC312: Overwrote pending register: R18 in 'AssignReg'

                      ;
                      (slot.dec):SetSize(200, R18_PC192)
                    end
                    -- DECOMPILER ERROR at PC316: Overwrote pending register: R18 in 'AssignReg'

                    ;
                    (slot.dec):SetText(skillWrapper:getDescription())
                    ;
                    (slot.expStr):SetText(expTxt .. "%")
                    ;
                    (slot.exp):SetShow(true)
                    ;
                    (slot.expStr):SetShow(true)
                    -- DECOMPILER ERROR at PC352: Unhandled construct in 'MakeBoolean' P1

                    if FGlobal_IsCommercialService() and servantInfo:isSkillLock(R17_PC339) and servantInfo:getStateType() ~= (CppEnums.ServantStateType).Type_SkillTraining then
                      (slot.buttonLock):SetShow(R17_PC339)
                    end
                    -- DECOMPILER ERROR at PC361: Overwrote pending register: R17 in 'AssignReg'

                    -- DECOMPILER ERROR at PC368: Overwrote pending register: R17 in 'AssignReg'

                    if not servantInfo:isSeized() then
                      if (CppEnums.ServantStateType).Type_SkillTraining == servantInfo:getStateType() then
                        do
                          do
                            (slot.button):SetShow(R17_PC339)
                            -- DECOMPILER ERROR at PC372: Overwrote pending register: R17 in 'AssignReg'

                            ;
                            (slot.buttonDel):SetShow(R17_PC339)
                            -- DECOMPILER ERROR at PC377: Overwrote pending register: R17 in 'AssignReg'

                            -- DECOMPILER ERROR at PC384: Overwrote pending register: R17 in 'AssignReg'

                            -- DECOMPILER ERROR at PC390: Overwrote pending register: R17 in 'AssignReg'

                            if (CppEnums.VehicleType).Type_Carriage ~= servantInfo:getVehicleType() and (CppEnums.VehicleType).Type_Donkey ~= servantInfo:getVehicleType() then
                              (slot.button):SetShow(R17_PC339)
                              -- DECOMPILER ERROR at PC394: Overwrote pending register: R17 in 'AssignReg'

                              ;
                              (slot.buttonDel):SetShow(R17_PC339)
                            end
                            -- DECOMPILER ERROR at PC398: Overwrote pending register: R17 in 'AssignReg'

                            ;
                            (slot.base):SetShow(R17_PC339)
                            slotNo = slotNo + 1
                            temporarySlotIndex = temporarySlotIndex + 1
                            self._temporayLearnSkillCount = self._temporayLearnSkillCount + 1
                            -- DECOMPILER ERROR at PC405: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC405: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC405: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC405: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC405: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC405: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC405: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC405: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC405: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC405: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC405: LeaveBlock: unexpected jumping out IF_STMT

                          end
                        end
                      end
                    end
                  end
                end
              end
            end
            for ii = 1, self._temporaySlotCount - 1 do
              local skillWrapper = servantInfo:getSkillXXX(R14_PC413)
              -- DECOMPILER ERROR at PC418: Overwrote pending register: R14 in 'AssignReg'

              -- DECOMPILER ERROR at PC419: Overwrote pending register: R14 in 'AssignReg'

              -- DECOMPILER ERROR at PC420: Overwrote pending register: R14 in 'AssignReg'

              -- DECOMPILER ERROR at PC423: Overwrote pending register: R14 in 'AssignReg'

              if skillWrapper ~= nil and servantInfo:getStateType() ~= R14_PC413 and skillWrapper:isTrainingSkill() == false then
                if slotNo < ((self._config).slot).count then
                  do
                    do
                      if self._startSlotIndex <= temporarySlotIndex then
                        local slot = (self._skill)[slotNo]
                        slot.key = ii
                        -- DECOMPILER ERROR at PC438: Overwrote pending register: R14 in 'AssignReg'

                        -- DECOMPILER ERROR at PC439: Overwrote pending register: R14 in 'AssignReg'

                        -- DECOMPILER ERROR at PC441: Overwrote pending register: R17 in 'AssignReg'

                        R14_PC413(R14_PC413, "Icon/" .. R17_PC339)
                        -- DECOMPILER ERROR at PC445: Overwrote pending register: R14 in 'AssignReg'

                        -- DECOMPILER ERROR at PC446: Overwrote pending register: R14 in 'AssignReg'

                        -- DECOMPILER ERROR at PC447: Overwrote pending register: R17 in 'AssignReg'

                        R14_PC413(R14_PC413, skillWrapper:getName())
                        -- DECOMPILER ERROR at PC450: Overwrote pending register: R14 in 'AssignReg'

                        -- DECOMPILER ERROR at PC451: Overwrote pending register: R14 in 'AssignReg'

                        R14_PC413(R14_PC413, skillWrapper:getDescription())
                        -- DECOMPILER ERROR at PC455: Overwrote pending register: R14 in 'AssignReg'

                        -- DECOMPILER ERROR at PC456: Overwrote pending register: R14 in 'AssignReg'

                        R14_PC413(R14_PC413, false)
                        -- DECOMPILER ERROR at PC459: Overwrote pending register: R14 in 'AssignReg'

                        R14_PC413 = R14_PC413()
                        if R14_PC413 then
                          R14_PC413 = CppEnums
                          R14_PC413 = R14_PC413.VehicleType
                          R14_PC413 = R14_PC413.Type_Carriage
                          if R14_PC413 ~= servantInfo:getVehicleType() then
                            R14_PC413 = CppEnums
                            R14_PC413 = R14_PC413.VehicleType
                            R14_PC413 = R14_PC413.Type_Donkey
                            if R14_PC413 ~= servantInfo:getVehicleType() then
                              R14_PC413 = slot.buttonTarget
                              R14_PC413(R14_PC413, true)
                            end
                          end
                        end
                        -- DECOMPILER ERROR at PC481: Overwrote pending register: R14 in 'AssignReg'

                        -- DECOMPILER ERROR at PC482: Overwrote pending register: R14 in 'AssignReg'

                        R14_PC413(R14_PC413, true)
                        slotNo = slotNo + 1
                      end
                      temporarySlotIndex = temporarySlotIndex + 1
                      self._temporayLearnSkillCount = self._temporayLearnSkillCount + 1
                      -- DECOMPILER ERROR at PC490: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC490: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC490: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC490: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC490: LeaveBlock: unexpected jumping out IF_STMT

                    end
                  end
                end
              end
            end
            ;
            (self._staticWantSkillBG):SetShow(false)
            ;
            (self._staticChangeBG):SetShow(false)
            ;
            (self._staticChangeTitle):SetShow(false)
            ;
            (self._staticSkillTargetIcon):SetShow(false)
            ;
            (self._staticSkillTargetName):SetShow(false)
            ;
            (self._staticSkillTargetCount):SetShow(false)
            ;
            (self._staticTextChangeDesc):SetShow(false)
            do
              if self._toSkillKey ~= nil then
                local skillWrapper = servantInfo:getSkillXXX(self._toSkillKey)
                if skillWrapper ~= nil then
                  (self._staticSkillTargetIcon):ChangeTextureInfoName("Icon/" .. skillWrapper:getIconPath())
                  ;
                  (self._staticSkillTargetName):SetText(skillWrapper:getName())
                  ;
                  (self._staticSkillTargetCount):SetText(servantInfo:getSkillFailedCount())
                  ;
                  (self._staticWantSkillBG):SetShow(true)
                  ;
                  (self._staticChangeBG):SetShow(true)
                  ;
                  (self._staticChangeTitle):SetShow(true)
                  ;
                  (self._staticSkillTargetIcon):SetShow(true)
                  ;
                  (self._staticSkillTargetName):SetShow(true)
                  ;
                  (self._staticSkillTargetCount):SetShow(true)
                  ;
                  (self._staticTextChangeDesc):SetShow(true)
                end
              end
              if self._temporayLearnSkillCount > 0 then
                (self._staticSkillPanel):SetShow(true)
                ;
                (UIScroll.SetButtonSize)(self._scrollSkill, ((self._config).slot).count, self._temporayLearnSkillCount)
              end
            end
          end
        end
      end
    end
  end
end

stableInfo.registEventHandler = function(self)
  -- function num : 0_13
  (self._staticSkillPanel):addInputEvent("Mouse_UpScroll", "StableInfo_ScrollEvent( true )")
  ;
  (self._staticSkillPanel):addInputEvent("Mouse_DownScroll", "StableInfo_ScrollEvent( false )")
  ;
  (self._btnMatingImmediately):addInputEvent("Mouse_LUp", "StableInfo_MatingImmediately_Confirm()")
  ;
  (UIScroll.InputEvent)(self._scrollSkill, "StableInfo_ScrollEvent")
end

stableInfo.registMessageHandler = function(self)
  -- function num : 0_14
  registerEvent("onScreenResize", "StableInfo_Resize")
  registerEvent("FromClient_ServantChangeSkill", "ServantChangeSkill_Complete")
  registerEvent("FromClient_ForgetServantSkill", "FromClient_ForgetServantSkill")
end

StableInfo_Resize = function()
  -- function num : 0_15
  Panel_Window_StableInfo:SetSpanSize(20, 30)
  Panel_Window_StableInfo:ComputePos()
end

Button_SkillTarget = function(slotNo)
  -- function num : 0_16 , upvalues : stableInfo
  if Panel_Win_System:GetShow() then
    return 
  end
  if StableList_SelectSlotNo() == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEINFO_STABLE_ALERT"))
    return 
  end
  local self = stableInfo
  local servantInfo = stable_getServant(StableList_SelectSlotNo())
  if servantInfo == nil then
    return 
  end
  local skillKey = ((self._skill)[slotNo]).key
  if not servantInfo:isLearnSkill(skillKey) then
    return 
  end
  self._toSkillKey = skillKey
  self:updateSkill()
end

local deleteSkillName = nil
Button_Skill_Delete = function(slotNo)
  -- function num : 0_17 , upvalues : stableInfo, deleteSkillName
  if Panel_Win_System:GetShow() then
    return 
  end
  if StableList_SelectSlotNo() == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEINFO_STABLE_ALERT"))
    return 
  end
  local self = stableInfo
  local servantInfo = stable_getServant(StableList_SelectSlotNo())
  if servantInfo == nil then
    return 
  end
  if (CppEnums.ServantStateType).Type_StallionTraining == servantInfo:getStateType() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_STABLELIST_CONDITION_STALLIONDESC"))
    return 
  end
  local servantNo = servantInfo:getServantNo()
  local skillKey = ((self._skill)[slotNo]).key
  local skillWrapper = servantInfo:getSkill(skillKey)
  if skillWrapper == nil then
    return 
  end
  local deleteServantSkill = function()
    -- function num : 0_17_0 , upvalues : deleteSkillName, skillWrapper, skillKey
    deleteSkillName = skillWrapper:getName()
    stable_forgetServantSkill(StableList_SelectSlotNo(), skillKey)
  end

  local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_SKILLINFO_1")
  local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANT_SKILLINFO_2", "skillName", skillWrapper:getName())
  local messageboxData = {title = messageBoxTitle, content = messageBoxMemo, functionYes = deleteServantSkill, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

Button_SkillTraining = function(slotNo)
  -- function num : 0_18 , upvalues : stableInfo
  local servantInfo = stable_getServant(StableList_SelectSlotNo())
  if (CppEnums.ServantStateType).Type_StallionTraining == servantInfo:getStateType() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_STABLELIST_CONDITION_STALLIONDESC"))
    return 
  end
  local skillKey = ((self._skill)[slotNo]).key
  local skillWrapper = servantInfo:getSkill(skillKey)
  local skillName = skillWrapper:getName()
  local skillCount = stable_getStallionTrainingSkillCount()
  for i = 0, skillCount - 1 do
    local stallionSkillWrapper = stable_getStallionTrainingSkillListAt(i)
    local stallionSkillWrapperName = stallionSkillWrapper:getName()
    if skillName == stallionSkillWrapperName then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEINFO_STABLE_ALERT"))
      return 
    end
  end
  if StableList_SelectSlotNo() == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEINFO_STABLE_ALERT"))
    return 
  end
  local servantInfo = stable_getServant(StableList_SelectSlotNo())
  if servantInfo == nil then
    return 
  end
  if Panel_Win_System:GetShow() then
    return 
  end
  local trainHorse = function()
    -- function num : 0_18_0 , upvalues : stableInfo, slotNo
    local skillKey = ((stableInfo._skill)[slotNo]).key
    stable_startServantSkillExpTraining(StableList_SelectSlotNo(), skillKey)
  end

  local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_STABLEINFO_SKILLTRAININGTITLE")
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_STABLEINFO_SKILLTRAININGCONTENT")
  local messageboxData = {title = messageBoxTitle, content = messageBoxMemo, functionYes = trainHorse, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

Button_SkillChange = function(slotNo)
  -- function num : 0_19 , upvalues : stableInfo
  if StableList_SelectSlotNo() == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEINFO_STABLE_ALERT"))
    return 
  end
  local self = stableInfo
  local servantInfo = stable_getServant(StableList_SelectSlotNo())
  if servantInfo == nil then
    return 
  end
  if Panel_Win_System:GetShow() then
    return 
  end
  if (CppEnums.ServantStateType).Type_StallionTraining == servantInfo:getStateType() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_STABLELIST_CONDITION_STALLIONDESC"))
    return 
  end
  local skillKey = ((self._skill)[slotNo]).key
  local skillWrapper = servantInfo:getSkill(skillKey)
  if skillWrapper == nil then
    return 
  end
  if self._toSkillKey == nil then
    local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY")
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_STABLEINFO_CHANGESKILL_BTN")
    local messageboxData = {title = messageBoxTitle, content = messageBoxMemo, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
    return 
  end
  do
    self._fromSkillKey = skillKey
    local titleString = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE")
    local contentString = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANT_STABEL_SKILLCHANGE_MSG", "skillname", skillWrapper:getName())
    local messageboxData = {title = titleString, content = contentString, functionYes = Button_SkillChangeXXX, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  end
end

Button_SkillChangeXXX = function()
  -- function num : 0_20 , upvalues : stableInfo
  audioPostEvent_SystemUi(3, 19)
  local self = stableInfo
  stable_changeSkill(StableList_SelectSlotNo(), self._fromSkillKey, self._toSkillKey)
end

StableInfo_ScrollEvent = function(isScrollUp)
  -- function num : 0_21 , upvalues : stableInfo
  local self = stableInfo
  self._startSlotIndex = (UIScroll.ScrollEvent)(self._scrollSkill, isScrollUp, ((self._config).slot).count, self._temporayLearnSkillCount, self._startSlotIndex, 1)
  if self.currentServantType ~= nil then
    self:update(self.currentServantType)
  else
    self:update()
  end
end

StableInfo_MatingImmediately_Confirm = function()
  -- function num : 0_22 , upvalues : stableInfo
  local self = stableInfo
  local servantInfo = stable_getServant(StableList_SelectSlotNo())
  if servantInfo == nil then
    return 
  end
  local titleString = PAGetString(Defines.StringSheet_GAME, "LUA_IMMDEDIATELY_MSGBOX_TITLE")
  local contentString = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_IMMDEDIATELY_MSGBOX_SERVANT_MEMO", "pearl", tostring(servantInfo:getCompleteMatingFromPearl_s64()))
  local messageboxData = {title = titleString, content = contentString, functionYes = StableInfo_MatingImmediatelyYes, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

StableInfo_MatingImmediatelyYes = function()
  -- function num : 0_23 , upvalues : stableInfo
  local self = stableInfo
  local servantInfo = stable_getServant(StableList_SelectSlotNo())
  if servantInfo == nil then
    return 
  end
  stable_requestCompleteServantMating(StableList_SelectSlotNo(), servantInfo:getCompleteMatingFromPearl_s64())
end

ServantChangeSkill_Complete = function(oldSkillKey, newSkillKey)
  -- function num : 0_24 , upvalues : stableInfo
  local self = stableInfo
  local temporaryWrapper = getTemporaryInformationWrapper()
  local servantInfo = stable_getServant(StableList_SelectSlotNo())
  local skillWrapper = servantInfo:getSkill(newSkillKey)
  local oldSkillWrapper = servantInfo:getSkillXXX(oldSkillKey)
  do
    if servantInfo ~= nil and skillWrapper ~= nil and oldSkillWrapper ~= nil then
      local msg = {main = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_STABLE_CHANGESKILL_MSG_MAIN_CHANGESKILL", "oldSkill", oldSkillWrapper:getName(), "newSkill", skillWrapper:getName()), sub = PAGetString(Defines.StringSheet_GAME, "LUA_STABLE_CHANGESKILL_MSG_SUB_CONGRATULATION")}
      Proc_ShowMessage_Ack_WithOut_ChattingMessage_For_RewardSelect(msg, 6, 32)
    end
    Panel_StableInfo_EffectFunc()
    self:update()
  end
end

Panel_StableInfo_EffectFunc = function()
  -- function num : 0_25 , upvalues : stableInfo
  local self = stableInfo
  ;
  (self._staticSkillEffect):EraseAllEffect()
  ;
  (self._staticSkillEffect):AddEffect("UI_Horse_SkillChangeEffect01", false, 205, -545)
end

FromClient_ForgetServantSkill = function(servantNo, skillKey)
  -- function num : 0_26 , upvalues : deleteSkillName, stableInfo
  local msg = nil
  if deleteSkillName ~= nil then
    msg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANT_SKILLINFO_3", "deleteSkillName", deleteSkillName)
  else
    msg = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_SKILLINFO_4")
  end
  Proc_ShowMessage_Ack_WithOut_ChattingMessage(msg)
  deleteSkillName = nil
  local self = stableInfo
  if self.currentServantType ~= nil then
    self:update(self.currentServantType)
  else
    self:update()
  end
end

StableInfo_Open = function(unsealType)
  -- function num : 0_27 , upvalues : stableInfo
  if not Panel_Window_StableInfo:GetShow() then
    Panel_Window_StableInfo:SetShow(true)
  end
  if unsealType == nil then
    unsealType = 0
  end
  self = stableInfo
  self:clear()
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R1 in 'UnsetPending'

  self._startSlotIndex = 0
  ;
  (self._scrollSkill):SetControlPos(0)
  self:update(unsealType)
end

StableInfo_Close = function()
  -- function num : 0_28
  if not Panel_Window_StableInfo:GetShow() then
    Panel_Window_StableInfo:SetShow(false)
  end
end

StableServantInfo_StallionToolTip = function(isOn)
  -- function num : 0_29 , upvalues : stableInfo, isContentsStallionEnable, isContentsNineTierEnable
  if isOn == false then
    TooltipSimple_Hide()
    return 
  end
  local self = stableInfo
  local servantInfo = stable_getServant(StableList_SelectSlotNo())
  if StableList_SelectSlotNo() == nil then
    local temporaryWrapper = getTemporaryInformationWrapper()
    if temporaryWrapper == nil then
      return 
    end
    servantInfo = temporaryWrapper:getUnsealVehicle(stable_getServantType())
  else
    do
      servantInfo = stable_getServant(StableList_SelectSlotNo())
      if servantInfo == nil then
        return 
      end
      local uiControl, name, desc = nil, nil, nil
      local isStallion = servantInfo:isStallion()
      if isStallion == true and isContentsStallionEnable then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANTINFO_TEXT_STALLIONICONNAME")
        if isContentsNineTierEnable then
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANTINFO_TEXT_STALLIONICONDESC")
          desc2 = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANTINFO_TEXT_STALLIONICONDESC2")
          desc = (string.format)("%s %s", desc, desc2)
        else
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANTINFO_TEXT_STALLIONICONDESC")
        end
      else
        name = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANTINFO_TEXT_NOTSTALLIONICONNAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANTINFO_TEXT_NOTSTALLIONICONDESC")
      end
      uiControl = stableInfo._iconStallion
      registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
      TooltipSimple_Show(uiControl, name, desc)
    end
  end
end

stableInfo:init()
stableInfo:registEventHandler()
stableInfo:registMessageHandler()
StableInfo_Resize()

