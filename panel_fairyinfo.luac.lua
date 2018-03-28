-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\fairyinfo\panel_fairyinfo.luac 

-- params : ...
-- function num : 0
local FairyMessageType = {eTurnOnLantern = 0}
Panel_FairyInfo:SetShow(false)
local UI_classType = CppEnums.ClassType
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local IM = CppEnums.EProcessorInputMode
local eFairyMaxEquipSkill = 30
local FairyInfo = {
_skillKey = {}
, _fairyNo = nil, _isUnseal = nil, _learnPotionSkill = false, _iconPath = nil, _fairyName = nil, 
_skillTooltipDesc = {}
, _fairyLevel = 0, _isFairyMaxLevel = false, currentLevel = 0, _fairyTier = 0, 
_UI = {_fairyBigIcon = (UI.getChildControl)(Panel_FairyInfo, "Static_FairyBigIcon"), _levelPosition = (UI.getChildControl)(Panel_FairyInfo, "Static_LevelPosition"), _namePosition = (UI.getChildControl)(Panel_FairyInfo, "Static_NamePosition"), _question = (UI.getChildControl)(Panel_FairyInfo, "Button_Question"), _desc = (UI.getChildControl)(Panel_FairyInfo, "StaticText_Desc"), _potionPositionBG = (UI.getChildControl)(Panel_FairyInfo, "Static_PotionPositionBG"), _skillBG = (UI.getChildControl)(Panel_FairyInfo, "Static_SkillBG"), _buttonPosition = (UI.getChildControl)(Panel_FairyInfo, "Static_ButtonPosition"), _potionPositionLockBG = (UI.getChildControl)(Panel_FairyInfo, "Static_PotionPositionLockBG"), _button_Win_Close = (UI.getChildControl)(Panel_FairyInfo, "Button_Win_Close"), _button_FairyBTN = (UI.getChildControl)(Panel_FairyInfo, "Button_FairyBTN"), _button_Lanter = (UI.getChildControl)(Panel_FairyInfo, "CheckButton_Lantern")}
, _currentHpKey = nil, _currentMpKey = nil, _isAnimate = false, _const_Ani_Time = 8.5, _timeStamp = 0, _fromWhereType = 0, _fromSlotNo = 0, _currentExpRate = 0}
PaGlobal_FairyInfo_GetFairyNo = function()
  -- function num : 0_0 , upvalues : FairyInfo
  return FairyInfo._fairyNo
end

PaGlobal_FairyInfo_GetFairyName = function()
  -- function num : 0_1 , upvalues : FairyInfo
  return FairyInfo._fairyName
end

PaGlobal_FairyInfo_GetIconPath = function()
  -- function num : 0_2 , upvalues : FairyInfo
  return FairyInfo._iconPath
end

PaGlobal_FairyInfo_GetLevel = function()
  -- function num : 0_3 , upvalues : FairyInfo
  return FairyInfo._fairyLevel
end

FairyInfo.Update = function(self)
  -- function num : 0_4 , upvalues : eFairyMaxEquipSkill
  local isUnseal = false
  local pcFairyData = nil
  local sealCount = ToClient_getFairySealedList()
  local unSealCount = ToClient_getFairyUnsealedList()
  local allCount = sealCount + unSealCount
  if allCount < 1 then
    return PaGlobal_FairyInfo_Close()
  end
  if unSealCount > 0 then
    isUnseal = true
  end
  if isUnseal == true then
    pcFairyData = ToClient_getFairyUnsealedDataByIndex(0)
  else
    pcFairyData = ToClient_getFairySealedDataByIndex(0)
  end
  self._isUnseal = isUnseal
  if pcFairyData == nil then
    return PaGlobal_FairyInfo_Close()
  end
  local fairyStaticStatus, iconPath, fairyNo_s64, fairyName, fairyLevel, fairyLovely, fairyhungry, fairyMaxLevel, fairyMaxHungry, fairyRace, fairyTier, fairyState, skillType, isPassive, tempIndex, fairyExp, MaxExp = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  if isUnseal == true then
    fairyStaticStatus = pcFairyData:getPetStaticStatus()
    self._iconPath = pcFairyData:getIconPath()
    fairyNo_s64 = pcFairyData:getPcPetNo()
    self._fairyNo = fairyNo_s64
    fairyName = pcFairyData:getName()
    self._fairyName = fairyName
    fairyTier = fairyStaticStatus:getPetTier()
    fairyLevel = pcFairyData:getLevel()
    fairyExp = Int64toInt32(pcFairyData:getExperience())
    MaxExp = Int64toInt32(fairyStaticStatus:getTotalExp(fairyLevel))
  else
    fairyStaticStatus = pcFairyData:getPetStaticStatus()
    self._iconPath = pcFairyData:getIconPath()
    fairyNo_s64 = pcFairyData._petNo
    self._fairyNo = fairyNo_s64
    fairyName = pcFairyData:getName()
    self._fairyName = fairyName
    fairyTier = fairyStaticStatus:getPetTier()
    fairyLevel = pcFairyData._level
    fairyExp = Int64toInt32(pcFairyData:getExperience())
    MaxExp = Int64toInt32(fairyStaticStatus:getTotalExp(fairyLevel))
  end
  self._fairyLevel = fairyLevel
  if (fairyTier + 1) * 10 <= fairyLevel then
    self._isFairyMaxLevel = true
  end
  self._fairyTier = fairyTier
  local remainTime = 0
  for ii = eFairyMaxEquipSkill - 2, 0, -1 do
    -- DECOMPILER ERROR at PC113: Confused about usage of register: R28 in 'UnsetPending'

    if pcFairyData:isFairyEquipSkillLearned(ii) == true then
      (self._skillKey)[ii] = true
    end
  end
  local uiRow = 0
  local skillSSW = ToClient_Fairy_EquipSkillWrraper(eFairyMaxEquipSkill - 1)
  do
    if skillSSW ~= nil then
      local skillTypeSSW = skillSSW:getSkillTypeStaticStatusWrapper()
      if skillTypeSSW ~= nil then
        (((self._UI)._skillIconBg)[uiRow]):SetShow(true)
        ;
        (((self._UI)._skillIcon)[uiRow]):ChangeTextureInfoName("Icon/" .. skillTypeSSW:getIconPath())
        ;
        (((self._UI)._skillIcon)[uiRow]):SetShow(true)
        ;
        (((self._UI)._skillDesc)[uiRow]):SetText(skillTypeSSW:getDescription())
        ;
        (((self._UI)._skillName)[uiRow]):SetText(skillTypeSSW:getName())
        ;
        (((self._UI)._skillName)[uiRow]):SetShow(true)
        ;
        (((self._UI)._skillName)[uiRow]):SetMonoTone(false)
        -- DECOMPILER ERROR at PC176: Confused about usage of register: R27 in 'UnsetPending'

        ;
        (self._skillTooltipDesc)[uiRow] = skillTypeSSW:getDescription()
        ;
        (((self._UI)._skillIcon)[uiRow]):addInputEvent("Mouse_On", "FairyInfo_SkillTooltip( true, " .. tostring(uiRow) .. ")")
        ;
        (((self._UI)._skillIcon)[uiRow]):addInputEvent("Mouse_Out", "FairyInfo_SkillTooltip( false, " .. tostring(uiRow) .. ")")
      end
    end
    do
      if self._skillKey ~= nil then
        local uiRow = 1
        for key,value in pairs(self._skillKey) do
          local skillSSW = ToClient_Fairy_EquipSkillWrraper(key)
          if skillSSW ~= nil then
            local skillTypeSSW = skillSSW:getSkillTypeStaticStatusWrapper()
            if skillTypeSSW ~= nil then
              (((self._UI)._skillIconBg)[uiRow]):SetShow(true)
              ;
              (((self._UI)._skillIcon)[uiRow]):ChangeTextureInfoName("Icon/" .. skillTypeSSW:getIconPath())
              ;
              (((self._UI)._skillIcon)[uiRow]):SetShow(true)
              ;
              (((self._UI)._skillDesc)[uiRow]):SetText(skillTypeSSW:getDescription())
              if key >= 10 and key <= 13 and isUnseal == true then
                local remainTime = ToClient_getFairyRemainTime()
                if remainTime > 0 then
                  remainTime = tostring(convertSecondsToClockTime(remainTime))
                  ;
                  (((self._UI)._skillName)[uiRow]):SetText(skillTypeSSW:getName() .. "  ( " .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FAIRYINFO_RESPAWNTIME", "time", remainTime) .. " )")
                  ;
                  (((self._UI)._skillIcon)[uiRow]):SetMonoTone(true)
                else
                  ;
                  (((self._UI)._skillName)[uiRow]):SetText(skillTypeSSW:getName())
                end
              else
                do
                  do
                    ;
                    (((self._UI)._skillName)[uiRow]):SetText(skillTypeSSW:getName())
                    ;
                    (((self._UI)._skillName)[uiRow]):SetShow(true)
                    ;
                    (((self._UI)._skillName)[uiRow]):SetMonoTone(false)
                    -- DECOMPILER ERROR at PC316: Confused about usage of register: R34 in 'UnsetPending'

                    ;
                    (self._skillTooltipDesc)[uiRow] = skillTypeSSW:getDescription()
                    ;
                    (((self._UI)._skillIcon)[uiRow]):addInputEvent("Mouse_On", "FairyInfo_SkillTooltip( true, " .. tostring(uiRow) .. ")")
                    ;
                    (((self._UI)._skillIcon)[uiRow]):addInputEvent("Mouse_Out", "FairyInfo_SkillTooltip( false, " .. tostring(uiRow) .. ")")
                    if key >= 20 then
                      self._learnPotionSkill = true
                    end
                    if isUnseal == true and key == 19 then
                      ((self._UI)._button_Lanter):SetShow(true)
                      ;
                      ((self._UI)._button_Lanter):SetCheck(ToClient_isFairyLanternOnOff() == false)
                      ;
                      ((self._UI)._button_Lanter):SetPosY(362 + uiRow * 50)
                    end
                    uiRow = uiRow + 1
                    -- DECOMPILER ERROR at PC370: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC370: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC370: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC370: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC370: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC370: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC370: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
          end
        end
      end
      do
        local SettingData = ToClient_getFairySettingData(fairyNo_s64)
        if SettingData ~= nil and self._learnPotionSkill == true then
          local ItemSSW = getItemEnchantStaticStatus(SettingData._hpItemKey)
          self._currentHpKey = SettingData._hpItemKey
          if ItemSSW ~= nil then
            ((self._UI)._hpIcon):ChangeTextureInfoName("Icon/" .. ItemSSW:getIconPath())
            ;
            ((self._UI)._hpIcon):SetShow(true)
            if SettingData._hpMinRate == 100 then
              ((self._UI)._hpSetText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FAIRYINFO_ALWAYS_HPUSE"))
            elseif SettingData._hpMinRate > 0 then
              ((self._UI)._hpSetText):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FAIRYINFO_HPPERCENT", "percent", SettingData._hpMinRate))
            end
          else
            ((self._UI)._hpIcon):SetShow(false)
          end
          ItemSSW = getItemEnchantStaticStatus(SettingData._mpItemKey)
          self._currentMpKey = SettingData._mpItemKey
          if ItemSSW ~= nil then
            ((self._UI)._mpIcon):ChangeTextureInfoName("Icon/" .. ItemSSW:getIconPath())
            ;
            ((self._UI)._mpIcon):SetShow(true)
            if SettingData._mpMinRate == 100 then
              ((self._UI)._mpSetText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FAIRYINFO_ALWAYS_MPUSE"))
            elseif SettingData._mpMinRate > 0 then
              ((self._UI)._mpSetText):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FAIRYINFO_MPPERCENT", "percent", SettingData._mpMinRate))
            end
          else
            ((self._UI)._mpIcon):SetShow(false)
          end
        else
          ((self._UI)._mpIcon):SetShow(false)
          ;
          ((self._UI)._hpIcon):SetShow(false)
        end
        if self._learnPotionSkill == true then
          ((self._UI)._potionPositionLockBG):SetShow(false)
          ;
          ((self._UI)._lockedIcon):SetShow(false)
          ;
          ((self._UI)._potionPositionBG):SetShow(true)
        else
          ((self._UI)._potionPositionLockBG):SetShow(true)
          ;
          ((self._UI)._lockedIcon):SetShow(true)
          ;
          ((self._UI)._potionPositionBG):SetShow(false)
        end
        ;
        ((self._UI)._button_PotionSet):addInputEvent("Mouse_LUp", "")
        ;
        ((self._UI)._button_PotionSet):addInputEvent("Mouse_LUp", "PaGlobal_FairySetting_Open(" .. "\"" .. tostring(fairyNo_s64) .. "\"" .. ")")
        ;
        ((self._UI)._button_PotionSet):addInputEvent("Mouse_On", "PaGlobal_FairyInfo_SimpleTooltip(true, 1)")
        ;
        ((self._UI)._button_PotionSet):addInputEvent("Mouse_Out", "PaGlobal_FairyInfo_SimpleTooltip(false)")
        ;
        ((self._UI)._fairyTier):SetText((self._GenerationStr)[fairyTier])
        ;
        ((self._UI)._fairyName):SetText(fairyName)
        ;
        ((self._UI)._level):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. tostring(fairyLevel))
        self._currentExpRate = fairyExp / MaxExp * 100
        ;
        ((self._UI)._levelExp):SetText((string.format)("%.2f", self._currentExpRate) .. "%")
        ;
        ((self._UI)._levelGauge):SetProgressRate(self._currentExpRate)
        ;
        ((self._UI)._levelGauge):SetCurrentProgressRate(self._currentExpRate)
        ;
        ((self._UI)._desc):SetText((self._InfoDescStr)[fairyTier])
        ;
        ((self._UI)._button_UnSummon):SetShow(false)
        ;
        ((self._UI)._button_Summon):SetShow(false)
        if isUnseal == true then
          ((self._UI)._button_UnSummon):SetShow(true)
          ;
          ((self._UI)._button_Summon):SetShow(false)
          ;
          ((self._UI)._button_Summon):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FAIRY_INFO_UNSUMMON"))
        else
          ((self._UI)._button_UnSummon):SetShow(false)
          ;
          ((self._UI)._button_Summon):SetShow(true)
          ;
          ((self._UI)._button_Summon):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FAIRY_INFO_SUMMON"))
        end
        -- DECOMPILER ERROR: 15 unprocessed JMP targets
      end
    end
  end
end

PaGlobal_FairyInfo_FairyTier = function()
  -- function num : 0_5 , upvalues : FairyInfo
  return FairyInfo._fairyTier
end

PaGlobal_FairyInfo_CurrentExpRate = function()
  -- function num : 0_6 , upvalues : FairyInfo
  return FairyInfo._currentExpRate
end

PaGlobal_FairyInfo_isMaxLevel = function()
  -- function num : 0_7 , upvalues : FairyInfo
  return FairyInfo._isFairyMaxLevel
end

PaGlobal_FairyInfo_Update = function()
  -- function num : 0_8 , upvalues : FairyInfo
  local self = FairyInfo
  self:Update()
end

PaGlobal_ClickSummonButton = function()
  -- function num : 0_9 , upvalues : FairyInfo
  local self = FairyInfo
  audioPostEvent_SystemUi(1, 40)
  if self._fairyNo == nil then
    return 
  end
  if self._isUnseal == true then
    ToClient_requestPetSeal(self._fairyNo)
    if Panel_Window_FairyUpgrade:GetShow() then
      PaGlobal_FairyUpgrade_Close()
    end
  else
    ToClient_requestPetUnseal(self._fairyNo)
  end
end

PaGlobal_FairyInfo_Open = function(noSetPos)
  -- function num : 0_10 , upvalues : FairyInfo
  local self = FairyInfo
  if Panel_FairyInfo:GetShow() and noSetPos == false then
    PaGlobal_FairyInfo_Close()
    return 
  end
  self:Clear()
  Panel_FairyInfo:SetShow(true)
  self:Update()
  if noSetPos == false then
    self:SetPos()
  end
end

PaGlobal_FairyInfo_Close = function()
  -- function num : 0_11
  Panel_FairyInfo:SetShow(false)
  if Panel_Window_FairySetting:GetShow() == true then
    PaGlobal_FairySetting_Close()
  end
  if Panel_Window_FairyUpgrade:GetShow() == true then
    PaGlobal_FairyUpgrade_Close()
  end
end

FairyInfo.Clear = function(self)
  -- function num : 0_12
  for _,value in pairs((self._UI)._skillIconBg) do
    value:SetShow(true)
  end
  for _,value in pairs((self._UI)._skillIcon) do
    value:SetShow(false)
    value:SetMonoTone(false)
  end
  for _,value in pairs((self._UI)._skillName) do
    value:SetShow(true)
    value:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FAIRY_INFO_NOSKILL"))
    value:SetMonoTone(true)
  end
  for _,value in pairs((self._UI)._skillDesc) do
    value:SetShow(true)
    value:SetText(" ")
    value:SetMonoTone(true)
  end
  ;
  ((self._UI)._potionPositionLockBG):SetShow(true)
  self._fairyNo = nil
  self._fairyName = nil
  self._iconPath = nil
  self._skillKey = {}
  self._learnPotionSkill = false
  self._skillTooltipDesc = {}
  self._currentHpKey = nil
  self._currentMpKey = nil
  ;
  ((self._UI)._hpSetText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FAIRYINFO_HPNONE"))
  ;
  ((self._UI)._mpSetText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FAIRYINFO_MPNONE"))
  ;
  ((self._UI)._button_Lanter):SetShow(false)
  ;
  ((self._UI)._button_Rebirth):SetIgnore(false)
  ;
  ((self._UI)._button_Rebirth):SetMonoTone(false)
  self._fairyLevel = 0
  self._isFairyMaxLevel = false
  self._currentExpRate = 0
end

FairyInfo.SetPos = function(self)
  -- function num : 0_13
  local screenX = getScreenSizeX()
  local screenY = getScreenSizeY()
  Panel_FairyInfo:GetSizeX()
  Panel_FairyInfo:SetPosX(screenX / 3 - Panel_FairyInfo:GetSizeX() / 2)
  Panel_FairyInfo:SetPosY(screenY / 2 - Panel_FairyInfo:GetSizeY() / 2)
  Panel_FairyInfo:ComputePos()
end

PaGlobal_FairyInfo_RequestRebirth = function()
  -- function num : 0_14 , upvalues : FairyInfo
  local FunctionYes = function()
    -- function num : 0_14_0 , upvalues : FairyInfo
    local self = FairyInfo
    if self._fairyNo == nil then
      return 
    end
    if self._fairyLevel < 10 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_SymbolNo, "eErrCantRebirthLessLevel"))
      return 
    end
    ToClient_FairyRebirth(self._fairyNo)
  end

  local _title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING")
  local _contenet = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRY_REBIRTH_ALERT")
  local messageBoxData = {title = _title, content = _contenet, functionYes = FunctionYes, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

PaGlobal_FairyInfo_RequestFreedom = function()
  -- function num : 0_15 , upvalues : FairyInfo
  local FunctionYes = function()
    -- function num : 0_15_0 , upvalues : FairyInfo
    local self = FairyInfo
    if self._fairyNo == nil then
      return 
    end
    ToClient_FairyFreedom(self._fairyNo)
  end

  local _title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING")
  local _contenet = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRY_FREEDOM_ALERT")
  local messageBoxData = {title = _title, content = _contenet, functionYes = FunctionYes, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

FairyInfo_SkillTooltip = function(isShow, index)
  -- function num : 0_16 , upvalues : FairyInfo
  if isShow == false then
    TooltipSimple_Hide()
    return 
  end
  local self = FairyInfo
  local uiControl, name, desc = nil, nil, nil
  uiControl = ((self._UI)._skillIcon)[index]
  name = (((self._UI)._skillName)[index]):GetText()
  desc = (self._skillTooltipDesc)[index]
  TooltipSimple_Show(uiControl, name, desc)
end

FairyInfo.Initialize = function(self)
  -- function num : 0_17
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._UI)._fairyTier = (UI.getChildControl)((self._UI)._namePosition, "StaticText_FairyTier")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._fairyName = (UI.getChildControl)((self._UI)._namePosition, "StaticText_FairyName")
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._fairyHelp = (UI.getChildControl)((self._UI)._fairyBigIcon, "Static_Help")
  ;
  ((self._UI)._fairyHelp):addInputEvent("Mouse_On", "PaGlobal_FairyInfo_SimpleTooltip(true, 6)")
  ;
  ((self._UI)._fairyHelp):addInputEvent("Mouse_Out", "PaGlobal_FairyInfo_SimpleTooltip(false)")
  -- DECOMPILER ERROR at PC43: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._level = (UI.getChildControl)((self._UI)._levelPosition, "StaticText_Level")
  -- DECOMPILER ERROR at PC51: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._levelExp = (UI.getChildControl)((self._UI)._levelPosition, "StaticText_LevelExp")
  -- DECOMPILER ERROR at PC59: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._levelGaugeBG = (UI.getChildControl)((self._UI)._levelPosition, "Static_LevelGaugeBG")
  -- DECOMPILER ERROR at PC67: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._levelGauge = (UI.getChildControl)((self._UI)._levelPosition, "Progress2_LevelGauge")
  -- DECOMPILER ERROR at PC75: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._button_Rebirth = (UI.getChildControl)((self._UI)._buttonPosition, "Button_Rebirth")
  ;
  ((self._UI)._button_Rebirth):addInputEvent("Mouse_LUp", "PaGlobal_FairyInfo_RequestRebirth()")
  ;
  ((self._UI)._button_Rebirth):addInputEvent("Mouse_On", "PaGlobal_FairyInfo_SimpleTooltip(true, 2)")
  ;
  ((self._UI)._button_Rebirth):addInputEvent("Mouse_Out", "PaGlobal_FairyInfo_SimpleTooltip(false)")
  -- DECOMPILER ERROR at PC101: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._button_Growth = (UI.getChildControl)((self._UI)._buttonPosition, "Button_Growth")
  ;
  ((self._UI)._button_Growth):addInputEvent("Mouse_LUp", "PaGlobal_FairyUpgrade_Open(true)")
  ;
  ((self._UI)._button_Growth):addInputEvent("Mouse_On", "PaGlobal_FairyInfo_SimpleTooltip(true, 3)")
  ;
  ((self._UI)._button_Growth):addInputEvent("Mouse_Out", "PaGlobal_FairyInfo_SimpleTooltip(false)")
  -- DECOMPILER ERROR at PC127: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._button_Summon = (UI.getChildControl)((self._UI)._buttonPosition, "Button_Summon")
  -- DECOMPILER ERROR at PC135: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._button_UnSummon = (UI.getChildControl)((self._UI)._buttonPosition, "Button_UnSummon")
  ;
  ((self._UI)._button_Summon):addInputEvent("Mouse_LUp", "PaGlobal_ClickSummonButton()")
  ;
  ((self._UI)._button_UnSummon):addInputEvent("Mouse_LUp", "PaGlobal_ClickSummonButton()")
  ;
  ((self._UI)._button_Summon):addInputEvent("Mouse_On", "PaGlobal_FairyInfo_SimpleTooltip(true, 4)")
  ;
  ((self._UI)._button_Summon):addInputEvent("Mouse_Out", "PaGlobal_FairyInfo_SimpleTooltip(false)")
  ;
  ((self._UI)._button_UnSummon):addInputEvent("Mouse_On", "PaGlobal_FairyInfo_SimpleTooltip(true, 5)")
  ;
  ((self._UI)._button_UnSummon):addInputEvent("Mouse_Out", "PaGlobal_FairyInfo_SimpleTooltip(false)")
  -- DECOMPILER ERROR at PC179: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._lockedIcon = (UI.getChildControl)((self._UI)._potionPositionLockBG, "StaticText_LockIcon")
  -- DECOMPILER ERROR at PC217: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._skillIconBg = {[0] = (UI.getChildControl)((self._UI)._skillBG, "Static_SkillIconBG1"), [1] = (UI.getChildControl)((self._UI)._skillBG, "Static_SkillIconBG2"), [2] = (UI.getChildControl)((self._UI)._skillBG, "Static_SkillIconBG3"), [3] = (UI.getChildControl)((self._UI)._skillBG, "Static_SkillIconBG4"), [4] = (UI.getChildControl)((self._UI)._skillBG, "Static_SkillIconBG5")}
  -- DECOMPILER ERROR at PC255: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._skillIcon = {[0] = (UI.getChildControl)((self._UI)._skillBG, "Static_SkillIcon1"), [1] = (UI.getChildControl)((self._UI)._skillBG, "Static_SkillIcon2"), [2] = (UI.getChildControl)((self._UI)._skillBG, "Static_SkillIcon3"), [3] = (UI.getChildControl)((self._UI)._skillBG, "Static_SkillIcon4"), [4] = (UI.getChildControl)((self._UI)._skillBG, "Static_SkillIcon5")}
  -- DECOMPILER ERROR at PC293: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._skillName = {[0] = (UI.getChildControl)((self._UI)._skillBG, "StaticText_SkillName1"), [1] = (UI.getChildControl)((self._UI)._skillBG, "StaticText_SkillName2"), [2] = (UI.getChildControl)((self._UI)._skillBG, "StaticText_SkillName3"), [3] = (UI.getChildControl)((self._UI)._skillBG, "StaticText_SkillName4"), [4] = (UI.getChildControl)((self._UI)._skillBG, "StaticText_SkillName5")}
  -- DECOMPILER ERROR at PC331: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._skillDesc = {[0] = (UI.getChildControl)((self._UI)._skillBG, "StaticText_SkillDesc1"), [1] = (UI.getChildControl)((self._UI)._skillBG, "StaticText_SkillDesc2"), [2] = (UI.getChildControl)((self._UI)._skillBG, "StaticText_SkillDesc3"), [3] = (UI.getChildControl)((self._UI)._skillBG, "StaticText_SkillDesc4"), [4] = (UI.getChildControl)((self._UI)._skillBG, "StaticText_SkillDesc5")}
  -- DECOMPILER ERROR at PC339: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._hpIconBG = (UI.getChildControl)((self._UI)._potionPositionBG, "Static_HpBG")
  -- DECOMPILER ERROR at PC347: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._mpIconBG = (UI.getChildControl)((self._UI)._potionPositionBG, "Static_MpBG")
  -- DECOMPILER ERROR at PC355: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._hpIcon = (UI.getChildControl)((self._UI)._hpIconBG, "Static_HpIcon")
  -- DECOMPILER ERROR at PC363: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._mpIcon = (UI.getChildControl)((self._UI)._mpIconBG, "Static_MpIcon")
  ;
  ((self._UI)._hpIcon):addInputEvent("Mouse_On", "PaGlobal_FairyInfo_ShowToolTip(true, true)")
  ;
  ((self._UI)._mpIcon):addInputEvent("Mouse_On", "PaGlobal_FairyInfo_ShowToolTip(false, true)")
  ;
  ((self._UI)._hpIcon):addInputEvent("Mouse_Out", "PaGlobal_FairyInfo_ShowToolTip(true, false)")
  ;
  ((self._UI)._mpIcon):addInputEvent("Mouse_Out", "PaGlobal_FairyInfo_ShowToolTip(false, false)")
  -- DECOMPILER ERROR at PC395: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._button_PotionSet = (UI.getChildControl)((self._UI)._potionPositionBG, "Button_PotionSet")
  ;
  ((self._UI)._button_Win_Close):addInputEvent("Mouse_LUp", "PaGlobal_FairyInfo_Close()")
  registerEvent("FromClient_PetAddSealedList", "FromClient_addSealedList_FiaryInfoOpen")
  registerEvent("FromClient_PetDelSealedList", "FromClient_delSealedList_FiaryInfoOpen")
  registerEvent("FromClient_PetDelList", "FromClient_delList_FiaryInfoOpen")
  registerEvent("FromClient_InputFairyName", "FromClient_InputFairyNameStart")
  registerEvent("FromClient_Fairy_Update", "FromClient_Fairy_Update")
  self._GenerationStr = {[0] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_FAIRY_INFO_GENERATION_1"), [1] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_FAIRY_INFO_GENERATION_2"), [2] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_FAIRY_INFO_GENERATION_3"), [3] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_FAIRY_INFO_GENERATION_4")}
  self._InfoDescStr = {[0] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_FAIRY_INFO_DESC"), [1] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_FAIRY_INFO_DESC_2"), [2] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_FAIRY_INFO_DESC_3"), [3] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_FAIRY_INFO_DESC_4")}
  ;
  ((self._UI)._button_FairyBTN):addInputEvent("Mouse_LUp", "PaGlobal_FairyInfo_RequestFreedom()")
  ;
  ((self._UI)._button_FairyBTN):addInputEvent("Mouse_On", "PaGlobal_FairyInfo_SimpleTooltip(true, 0)")
  ;
  ((self._UI)._button_FairyBTN):addInputEvent("Mouse_Out", "PaGlobal_FairyInfo_SimpleTooltip(false)")
  -- DECOMPILER ERROR at PC499: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._hpSetText = (UI.getChildControl)((self._UI)._potionPositionBG, "StaticText_HpSet")
  -- DECOMPILER ERROR at PC507: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._mpSetText = (UI.getChildControl)((self._UI)._potionPositionBG, "StaticText_MpSet")
  ;
  ((self._UI)._button_Lanter):addInputEvent("Mouse_LUp", "PaGlobal_FairyInfo_LanterOnOff()")
  ;
  ((self._UI)._button_Lanter):addInputEvent("Mouse_On", "PaGlobal_FairyInfo_SimpleTooltip(true, 7)")
  ;
  ((self._UI)._button_Lanter):addInputEvent("Mouse_Out", "PaGlobal_FairyInfo_SimpleTooltip(false)")
  ;
  ((self._UI)._question):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle(\"Fairy\")")
  ;
  ((self._UI)._question):SetShow(false)
end

local isFairyByPetNo = function(petNo)
  -- function num : 0_18
  local countUnsealed = ToClient_getFairyUnsealedList()
  local countSealed = (ToClient_getFairySealedList())
  local fairyData = nil
  if countUnsealed < countSealed then
    fairyData = ToClient_getFairySealedDataByIndex(0)
    if fairyData == nil then
      return false
    end
    if petNo == fairyData._petNo then
      return true
    end
  else
    fairyData = ToClient_getFairyUnsealedDataByIndex(0)
    if fairyData == nil then
      return false
    end
    if petNo == fairyData:getPcPetNo() then
      return true
    end
  end
  return false
end

FromClient_addSealedList_FiaryInfoOpen = function(petNo, reason, petType)
  -- function num : 0_19 , upvalues : FairyInfo, isFairyByPetNo
  local self = FairyInfo
  if isFairyByPetNo(petNo) == false then
    return 
  end
  if reason == nil then
    return 
  end
  if __ePetType_Fairy == petType then
    if Panel_FairyInfo:GetShow() == false then
      self:Clear()
      self:Update()
    else
      self:Clear()
      self:Update()
    end
  end
end

FromClient_Fairy_Update = function()
  -- function num : 0_20 , upvalues : FairyInfo
  local self = FairyInfo
  self:Clear()
  self:Update()
end

FromClient_delSealedList_FiaryInfoOpen = function(petNo)
  -- function num : 0_21 , upvalues : FairyInfo, isFairyByPetNo
  local self = FairyInfo
  if isFairyByPetNo(petNo) == false and self._fairyNo ~= petNo then
    return 
  end
  self:Clear()
  self:Update()
  PaGlobal_Fairy_SetPosIcon()
  PaGlobal_FairyUpgrade_OnlyUpdate()
end

FromClient_delList_FiaryInfoOpen = function(petNo)
  -- function num : 0_22 , upvalues : isFairyByPetNo
  if isFairyByPetNo(petNo) == false then
    return 
  end
  PaGlobal_FairyInfo_Open(true)
end

PaGlobal_FairyInfo_ShowToolTip = function(isHp, isShow)
  -- function num : 0_23 , upvalues : FairyInfo
  local self = FairyInfo
  local itemSSW = nil
  local index = 0
  local control = nil
  if isHp == true then
    itemSSW = getItemEnchantStaticStatus(self._currentHpKey)
    index = 0
    control = (self._UI)._hpIcon
  else
    itemSSW = getItemEnchantStaticStatus(self._currentMpKey)
    index = 1
    control = (self._UI)._mpIcon
  end
  if itemSSW == nil then
    return 
  end
  if isShow == true then
    Panel_Tooltip_Item_SetPosition(index, control, "fairyList")
    Panel_Tooltip_Item_Show(itemSSW, Panel_FairyInfo, true)
  else
    Panel_Tooltip_Item_hideTooltip()
  end
end

FromClient_InputFairyNameStart = function(fromWhereType, fromSlotNo)
  -- function num : 0_24 , upvalues : FairyInfo
  local self = FairyInfo
  local selfPlayer = getSelfPlayer()
  local rotation = (selfPlayer:get()):getRotation()
  self._isAnimate = true
  self._fromWhereType = fromWhereType
  self._fromSlotNo = fromSlotNo
  self._timeStamp = 0
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_SymbolNo, "eErrAppearFairy"))
  HandleClicked_InventoryWindow_Close()
end

UpdateFunc_FairyRegisterAni = function(deltaTime)
  -- function num : 0_25 , upvalues : FairyInfo
  local self = FairyInfo
  if self._isAnimate == false then
    return 
  end
  self._timeStamp = self._timeStamp + deltaTime
  if self._const_Ani_Time <= self._timeStamp then
    self._isAnimate = false
    self._timeStamp = 0
    FromClient_InputFairyName(self._fromWhereType, self._fromSlotNo)
    self._fromWhereType = 0
    self._fromSlotNo = 0
  end
end

PaGlobal_FairyInfo_SimpleTooltip = function(isShow, tipType)
  -- function num : 0_26 , upvalues : FairyInfo
  if isShow == false then
    TooltipSimple_Hide()
    return 
  end
  local self = FairyInfo
  local uiControl, name, desc = nil, nil, nil
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRY_INFO_FREEDOM_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRY_INFO_FREEDOM_DESC")
    control = (self._UI)._button_FairyBTN
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRYINFO_POTIONSETTING_TOOLTIP_TITLE")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRYINFO_POTIONSETTING_TOOLTIP_DESC")
      control = (self._UI)._button_PotionSet
    else
      if tipType == 2 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRYINFO_TOOLTIP_REBIRTH_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRYINFO_TOOLTIP_REBIRTH_DESC")
        control = (self._UI)._button_Rebirth
      else
        if tipType == 3 then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRYINFO_TOOLTIP_GROWTH_NAME")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRYINFO_TOOLTIP_GROWTH_DESC")
          control = (self._UI)._button_Growth
        else
          if tipType == 4 then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRYINFO_TOOLTIP_SUMMON_NAME")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRYINFO_TOOLTIP_SUMMON_DESC")
            control = (self._UI)._button_Summon
          else
            if tipType == 5 then
              name = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRYINFO_TOOLTIP_UNSUMMON_NAME")
              desc = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRYINFO_TOOLTIP_UNSUMMON_DESC")
              control = (self._UI)._button_UnSummon
            else
              if tipType == 6 then
                name = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRYINFO_TOOLTIP_INFO_NAME")
                desc = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRYINFO_TOOLTIP_INFO_DESC")
                control = (self._UI)._fairyHelp
              else
                if tipType == 7 then
                  name = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRYINFO_TOOLTIP_LANTERN_NAME")
                  desc = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRYINFO_TOOLTIP_LANTERN_DESC")
                  control = (self._UI)._button_Lanter
                end
              end
            end
          end
        end
      end
    end
  end
  TooltipSimple_Show(control, name, desc)
end

PaGlobal_FairyInfo_LanterOnOff = function()
  -- function num : 0_27
  ToClient_RequestFairyLanterOnOff()
  PaGlobal_FairyInfo_Open(true)
end

registerEvent("FromClient_luaLoadComplete", "LuaLoadComplete")
LuaLoadComplete = function()
  -- function num : 0_28 , upvalues : FairyInfo
  FairyInfo:Initialize()
  Panel_FairyInfo:SetShow(false)
end


