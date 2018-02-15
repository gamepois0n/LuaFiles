-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\skillcommand\consolekeycombo.luac 

-- params : ...
-- function num : 0
Panel_ConsoleCombo:SetShow(false)
PaGlobal_ConsoleKeyCombo = {_isFirstSkillShow; 
_ui = {_static_RotateBG = (UI.getChildControl)(Panel_ConsoleCombo, "Static_Bg"), _static_X = (UI.getChildControl)(Panel_ConsoleCombo, "Static_ButtonX"), _static_Y = (UI.getChildControl)(Panel_ConsoleCombo, "Static_ButtonY"), _static_A = (UI.getChildControl)(Panel_ConsoleCombo, "Static_ButtonA"), _static_B = (UI.getChildControl)(Panel_ConsoleCombo, "Static_ButtonB"), _static_clearX = (UI.getChildControl)(Panel_ConsoleCombo, "Static_clearButtonX"), _static_clearY = (UI.getChildControl)(Panel_ConsoleCombo, "Static_clearButtonY"), _static_clearA = (UI.getChildControl)(Panel_ConsoleCombo, "Static_clearButtonA"), _static_clearB = (UI.getChildControl)(Panel_ConsoleCombo, "Static_clearButtonB"), _static_SkillIcon_Up = (UI.getChildControl)(Panel_ConsoleCombo, "Static_SkillIcon_Up"), _static_SkillIcon_Right = (UI.getChildControl)(Panel_ConsoleCombo, "Static_SkillIcon_Right"), _static_SkillIcon_Down = (UI.getChildControl)(Panel_ConsoleCombo, "Static_SkillIcon_Down"), _static_SkillIcon_Left = (UI.getChildControl)(Panel_ConsoleCombo, "Static_SkillIcon_Left"), _comboDelay = (UI.getChildControl)(Panel_ConsoleCombo, "CircularProgress_LimitTime")}
, 
_button = {[0] = "X", [1] = "Y", [2] = "A", [3] = "B"}
, 
_comboData = {
[0] = {}
, 
[1] = {}
, 
[2] = {}
}
, 
slotConfig = {createIcon = true, createEffect = false, createFG = false, createFGDisabled = false, createLevel = false, createLearnButton = false, createCooltime = true, createCooltimeText = true}
, _buttonMaxCount = 4, _isButtonClick = false, _isFirstSkillShow = false, _firstSKillButtonIndex = 0, _firstSkillButton = nil, _isSkillIng = false, _isClickPossible = false, _currentTime = 0, _delayTime = 0, _skillCoolTimeKey = nil, 
_skillCoolTimeSlots = {}
, 
_coolTimeSkillNo = {}
, 
_coolTimeSkillIndex = {}
, _analogPad = "", _weaponType = 0}
-- DECOMPILER ERROR at PC138: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleKeyCombo.initialize = function(self)
  -- function num : 0_0
  for index = 0, self._buttonMaxCount - 1 do
    local slot = {}
    ;
    (SlotSkill.new)(slot, index, Panel_ConsoleCombo, self.slotConfig)
    ;
    (slot.icon):SetIgnore(true)
    if index == 0 then
      (slot.icon):SetPosX(((self._ui)._static_SkillIcon_Left):GetPosX())
      ;
      (slot.icon):SetPosY(((self._ui)._static_SkillIcon_Left):GetPosY())
      ;
      (slot.cooltime):SetPosX(((self._ui)._static_SkillIcon_Left):GetPosX())
      ;
      (slot.cooltime):SetPosY(((self._ui)._static_SkillIcon_Left):GetPosY())
      ;
      (slot.cooltimeText):SetPosX(((self._ui)._static_SkillIcon_Left):GetPosX())
      ;
      (slot.cooltimeText):SetPosY(((self._ui)._static_SkillIcon_Left):GetPosY())
    else
      if index == 1 then
        (slot.icon):SetPosX(((self._ui)._static_SkillIcon_Up):GetPosX())
        ;
        (slot.icon):SetPosY(((self._ui)._static_SkillIcon_Up):GetPosY())
        ;
        (slot.cooltime):SetPosX(((self._ui)._static_SkillIcon_Up):GetPosX())
        ;
        (slot.cooltime):SetPosY(((self._ui)._static_SkillIcon_Up):GetPosY())
        ;
        (slot.cooltimeText):SetPosX(((self._ui)._static_SkillIcon_Up):GetPosX())
        ;
        (slot.cooltimeText):SetPosY(((self._ui)._static_SkillIcon_Up):GetPosY())
      else
        if index == 2 then
          (slot.icon):SetPosX(((self._ui)._static_SkillIcon_Down):GetPosX())
          ;
          (slot.icon):SetPosY(((self._ui)._static_SkillIcon_Down):GetPosY())
          ;
          (slot.cooltime):SetPosX(((self._ui)._static_SkillIcon_Down):GetPosX())
          ;
          (slot.cooltime):SetPosY(((self._ui)._static_SkillIcon_Down):GetPosY())
          ;
          (slot.cooltimeText):SetPosX(((self._ui)._static_SkillIcon_Down):GetPosX())
          ;
          (slot.cooltimeText):SetPosY(((self._ui)._static_SkillIcon_Down):GetPosY())
        else
          if index == 3 then
            (slot.icon):SetPosX(((self._ui)._static_SkillIcon_Right):GetPosX())
            ;
            (slot.icon):SetPosY(((self._ui)._static_SkillIcon_Right):GetPosY())
            ;
            (slot.cooltime):SetPosX(((self._ui)._static_SkillIcon_Right):GetPosX())
            ;
            (slot.cooltime):SetPosY(((self._ui)._static_SkillIcon_Right):GetPosY())
            ;
            (slot.cooltimeText):SetPosX(((self._ui)._static_SkillIcon_Right):GetPosX())
            ;
            (slot.cooltimeText):SetPosY(((self._ui)._static_SkillIcon_Right):GetPosY())
          end
        end
      end
    end
    -- DECOMPILER ERROR at PC197: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._skillCoolTimeSlots)[index] = slot
  end
end

-- DECOMPILER ERROR at PC141: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleKeyCombo.open = function(self)
  -- function num : 0_1
end

-- DECOMPILER ERROR at PC144: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleKeyCombo.close = function(self)
  -- function num : 0_2
end

-- DECOMPILER ERROR at PC147: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleKeyCombo.nextSkillUpdate = function(self, isFirstSkill, weaponType)
  -- function num : 0_3
  local skillCount = selfPlayerNextSkillConsoleKeySize()
  if isFirstSkill == true then
    PaGlobal_ConsoleKeyFirstCombo:findSkill(weaponType, true)
    return 
  end
  if skillCount ~= 0 then
    Panel_ConsoleCombo:SetShow(true)
    ;
    ((self._ui)._static_RotateBG):SetShow(true)
  end
  for index = 0, skillCount - 1 do
    local skillNo = selfPlayerNextSkillConsoleSkillNo(index)
    if skillNo ~= 0 then
      local skillWrapper = getSkillTypeStaticStatus(skillNo)
      if skillWrapper ~= nil then
        local buttonKey = selfPlayerNextSkillConsoleKeyList(index)
        PaGlobal_ConsoleKeyCombo:findCommand(index, buttonKey, skillWrapper, skillNo)
      end
    end
  end
end

-- DECOMPILER ERROR at PC150: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleKeyCombo.findCommand = function(self, index, buttonKey, skillWrapper, skillNo)
  -- function num : 0_4
  for buttonCount = 0, self._buttonMaxCount - 1 do
    local startIndex, endIndex = (string.find)(buttonKey, (self._button)[buttonCount])
    if startIndex ~= nil and endIndex ~= nil then
      local command = (string.sub)(buttonKey, startIndex, endIndex)
      PaGlobal_ConsoleKeyCombo:showCommand(index, command, skillWrapper, skillNo)
    end
  end
end

-- DECOMPILER ERROR at PC153: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleKeyCombo.showCommand = function(self, index, command, skillWrapper, skillNo)
  -- function num : 0_5
  if command == "X" then
    PaGlobal_ConsoleKeyCombo:setPosCommand(index, 0, skillWrapper, skillNo)
  else
    if command == "Y" then
      PaGlobal_ConsoleKeyCombo:setPosCommand(index, 1, skillWrapper, skillNo)
    else
      if command == "A" then
        PaGlobal_ConsoleKeyCombo:setPosCommand(index, 2, skillWrapper, skillNo)
      else
        if command == "B" then
          PaGlobal_ConsoleKeyCombo:setPosCommand(index, 3, skillWrapper, skillNo)
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC156: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleKeyCombo.setPosCommand = function(self, index, posIndex, skillWrapper, skillNo)
  -- function num : 0_6
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R5 in 'UnsetPending'

  (self._coolTimeSkillNo)[posIndex] = skillNo
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._coolTimeSkillIndex)[posIndex] = index
  ;
  ((self._skillCoolTimeSlots)[posIndex]):setSkillTypeStatic(skillWrapper)
  ;
  (((self._skillCoolTimeSlots)[posIndex]).icon):SetShow(true)
  ;
  ((self._ui)._static_X):SetShow(true)
  ;
  ((self._ui)._static_Y):SetShow(true)
  ;
  ((self._ui)._static_A):SetShow(true)
  ;
  ((self._ui)._static_B):SetShow(true)
end

-- DECOMPILER ERROR at PC159: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleKeyCombo.setSKillIconAni = function(self, control)
  -- function num : 0_7
  local aniInfo = control:addMoveAnimation(0, 0.25, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_LINEAR)
  aniInfo:SetStartPosition(control:GetPosX(), control:GetPosY())
  aniInfo:SetEndPosition(control:GetPosX(), control:GetPosY())
  control:CalcUIAniPos(aniInfo)
end

-- DECOMPILER ERROR at PC162: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleKeyCombo.findFirstCombo = function(self, command, skillWrapper, skillNo, index, weaponType)
  -- function num : 0_8
  local startIndex, endIndex = nil, nil
  if self._weaponType ~= weaponType then
    return 
  end
  if self._firstSkillButton == 5 then
    startIndex = (string.find)(command, "LT")
  else
    -- DECOMPILER ERROR at PC24: Overwrote pending register: R7 in 'AssignReg'

    if startIndex == nil or endIndex == nil then
      startIndex = (string.find)(command, "LB")
    end
  end
  if startIndex ~= nil and endIndex ~= nil then
    local commandLen = (string.len)(command)
    if commandLen ~= nil and self._analogPad == "" then
      local frontStart, frontEnd = (string.find)(command, "FRONT")
      local rightStart, rightEnd = (string.find)(command, "RIGHT")
      local backStart, backEnd = (string.find)(command, "BACK")
      local leftStart, leftEnd = (string.find)(command, "LEFT")
      if frontStart ~= nil or frontEnd ~= nil or rightStart ~= nil or rightEnd ~= nil or backStart ~= nil or backEnd ~= nil or leftStart ~= nil or leftEnd ~= nil then
        return 
      end
      local isFind = false
      local buttonCommand = (string.sub)(command, commandLen, commandLen)
      if buttonCommand == "X" then
        PaGlobal_ConsoleKeyCombo:setPosCommand(index, 0, skillWrapper, skillNo)
        isFind = true
      end
      if buttonCommand == "Y" then
        PaGlobal_ConsoleKeyCombo:setPosCommand(index, 1, skillWrapper, skillNo)
        isFind = true
      end
      if buttonCommand == "A" then
        PaGlobal_ConsoleKeyCombo:setPosCommand(index, 2, skillWrapper, skillNo)
        isFind = true
      end
      if buttonCommand == "B" then
        PaGlobal_ConsoleKeyCombo:setPosCommand(index, 3, skillWrapper, skillNo)
        isFind = true
      end
      if isFind == true then
        Panel_ConsoleCombo:SetShow(true)
        ;
        ((self._ui)._static_RotateBG):SetShow(true)
      end
    end
  end
end

FromClient_consoleNextSkillList = function()
  -- function num : 0_9
  local self = PaGlobal_ConsoleKeyCombo
  for index = 0, self._buttonMaxCount - 1 do
    (((self._skillCoolTimeSlots)[index]).icon):SetShow(false)
    ;
    (((self._skillCoolTimeSlots)[index]).cooltime):SetShow(false)
    ;
    (((self._skillCoolTimeSlots)[index]).cooltimeText):SetShow(false)
  end
  ;
  ((self._ui)._static_RotateBG):SetShow(true)
  ;
  ((self._ui)._comboDelay):SetShow(true)
  local delayTime = selfPlayerNextSkillConsoleDelayTime()
  ;
  ((self._ui)._comboDelay):SetCurrentControlPos(0)
  ;
  ((self._ui)._comboDelay):SetAniSpeed(0.1)
  self._currentTime = 0
  self._delayTime = Int64toInt32(delayTime) / 1000
  self._isButtonClick = true
  self._isFirstSkillShow = false
  PaGlobal_ConsoleKeyCombo:setSKillIconAni((self._ui)._static_SkillIcon_Right)
  PaGlobal_ConsoleKeyCombo:setSKillIconAni((self._ui)._static_SkillIcon_Left)
  PaGlobal_ConsoleKeyCombo:setSKillIconAni((self._ui)._static_SkillIcon_Up)
  PaGlobal_ConsoleKeyCombo:setSKillIconAni((self._ui)._static_SkillIcon_Down)
  PaGlobal_ConsoleKeyCombo:nextSkillUpdate()
end

FromClient_consoleEffectButton = function(buttonType)
  -- function num : 0_10
  local self = PaGlobal_ConsoleKeyCombo
  if self._isButtonClick == false then
    return 
  end
  if buttonType == 4 then
    ((self._ui)._static_clearX):SetShow(true)
    ;
    ((self._ui)._static_clearX):EraseAllEffect()
    ;
    ((self._ui)._static_clearX):AddEffect("fUI_Button_01A", false, 0, 0)
  else
    if buttonType == 13 then
      ((self._ui)._static_clearY):SetShow(true)
      ;
      ((self._ui)._static_clearY):EraseAllEffect()
      ;
      ((self._ui)._static_clearY):AddEffect("fUI_Button_01A", false, 0, 0)
    else
      if buttonType == 14 then
        ((self._ui)._static_clearB):SetShow(true)
        ;
        ((self._ui)._static_clearB):EraseAllEffect()
        ;
        ((self._ui)._static_clearB):AddEffect("fUI_Button_01A", false, 0, 0)
      else
        if buttonType == 7 then
          ((self._ui)._static_clearA):SetShow(true)
          ;
          ((self._ui)._static_clearA):EraseAllEffect()
          ;
          ((self._ui)._static_clearA):AddEffect("fUI_Button_01A", false, 0, 0)
        end
      end
    end
  end
  self._isButtonClick = false
end

FromClient_consoleFirstSkill = function(isShow, weaponType, buttonKeyIndex, analogX, analogY)
  -- function num : 0_11
  local self = PaGlobal_ConsoleKeyCombo
  self._weaponType = weaponType
  if weaponType ~= 1 and weaponType ~= 2 then
    return 
  end
  if isShow == true then
    self._firstSKillButtonIndex = buttonKeyIndex
    self._firstSkillButton = buttonKeyIndex
  end
  if isShow == false then
    if self._firstSKillButtonIndex == buttonKeyIndex then
      Panel_ConsoleCombo:SetShow(false)
      self._firstSKillButtonIndex = -1
    end
    return 
  end
  for index = 0, self._buttonMaxCount - 1 do
    (((self._skillCoolTimeSlots)[index]).icon):SetShow(false)
    ;
    (((self._skillCoolTimeSlots)[index]).cooltime):SetShow(false)
    ;
    (((self._skillCoolTimeSlots)[index]).cooltimeText):SetShow(false)
  end
  local analogPad = ""
  PaGlobal_ConsoleKeyCombo:nextSkillUpdate(true, weaponType)
  self._isFirstSkillShow = true
end

EventSkillCooltime = function(skillKey, skillNo)
  -- function num : 0_12
  local self = PaGlobal_ConsoleKeyCombo
  self._skillCoolTimeKey = skillKey
end

ConsoleKeyComboUpdateTime = function(updateTime)
  -- function num : 0_13
  local isCombo = selfPlayerNextSkillConsoleSkillIsCombo()
  local self = PaGlobal_ConsoleKeyCombo
  if isCombo == false and self._isFirstSkillShow == false then
    ((self._ui)._static_RotateBG):SetShow(false)
    ;
    ((self._ui)._static_X):SetShow(false)
    ;
    ((self._ui)._static_Y):SetShow(false)
    ;
    ((self._ui)._static_A):SetShow(false)
    ;
    ((self._ui)._static_B):SetShow(false)
    ;
    ((self._ui)._static_clearX):SetShow(false)
    ;
    ((self._ui)._static_clearY):SetShow(false)
    ;
    ((self._ui)._static_clearA):SetShow(false)
    ;
    ((self._ui)._static_clearB):SetShow(false)
    ;
    ((self._ui)._comboDelay):SetShow(false)
    for index = 0, self._buttonMaxCount - 1 do
      (((self._skillCoolTimeSlots)[index]).icon):SetShow(false)
      ;
      (((self._skillCoolTimeSlots)[index]).cooltime):SetShow(false)
      ;
      (((self._skillCoolTimeSlots)[index]).cooltimeText):SetShow(false)
    end
    Panel_ConsoleCombo:SetShow(true)
    ;
    ((self._ui)._comboDelay):SetProgressRate(0)
    self._currentTime = 0
    return 
  end
  ConsoleSkillCoolTimeUpdateTime(updateTime)
  self._currentTime = self._currentTime + updateTime
  if self._isFirstSkillShow then
    ((self._ui)._comboDelay):SetProgressRate(0)
  else
    ;
    ((self._ui)._comboDelay):SetProgressRate(self._currentTime * 100 / self._delayTime)
  end
end

ConsoleSkillCoolTimeUpdateTime = function(updateTime)
  -- function num : 0_14
  local self = PaGlobal_ConsoleKeyCombo
  for index = 0, self._buttonMaxCount - 1 do
    if (self._coolTimeSkillNo)[index] == nil then
      return 
    end
    if (self._coolTimeSkillIndex)[index] == nil then
      return 
    end
    local skillNo = (self._coolTimeSkillNo)[index]
    local skillKey = selfPlayerNextSkillConsoleSkillKey(skillNo)
    local remainTime = getSkillCooltime(skillKey)
    local skillReuseTime = 0
    local realRemainTime = 0
    local intRemainTime = 0
    if remainTime > 0 and (self._skillCoolTimeSlots)[index] ~= nil then
      local skillStaticWrapper = getSkillStaticStatus(skillNo, 1)
      if skillStaticWrapper ~= nil then
        skillReuseTime = (skillStaticWrapper:get())._reuseCycle / 1000
      end
      realRemainTime = remainTime * (skillReuseTime)
      intRemainTime = realRemainTime - realRemainTime % 1 + 1
      ;
      (((self._skillCoolTimeSlots)[index]).cooltime):UpdateCoolTime(remainTime)
      ;
      (((self._skillCoolTimeSlots)[index]).cooltimeText):SetText(Time_Formatting_ShowTop(intRemainTime))
      ;
      (((self._skillCoolTimeSlots)[index]).icon):SetShow(true)
      ;
      (((self._skillCoolTimeSlots)[index]).cooltime):SetShow(true)
      ;
      (((self._skillCoolTimeSlots)[index]).cooltimeText):SetShow(true)
    else
      do
        do
          ;
          (((self._skillCoolTimeSlots)[index]).cooltime):SetShow(false)
          ;
          (((self._skillCoolTimeSlots)[index]).cooltimeText):SetShow(false)
          -- DECOMPILER ERROR at PC92: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC92: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC92: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end

PaGlobal_ConsoleKeyCombo:initialize()
registerEvent("FromClient_consoleNextSkillList", "FromClient_consoleNextSkillList")
registerEvent("FromClient_consoleEffectButton", "FromClient_consoleEffectButton")
registerEvent("FromClient_consoleFirstSkill", "FromClient_consoleFirstSkill")
registerEvent("EventSkillCooltime", "EventSkillCooltime")
Panel_ConsoleCombo:RegisterUpdateFunc("ConsoleKeyComboUpdateTime")

