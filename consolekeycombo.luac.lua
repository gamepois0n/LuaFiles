-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\skillcommand\consolekeycombo.luac 

-- params : ...
-- function num : 0
Panel_ComboCommand:SetShow(false)
local isAbleConsolePadGroup = ToClient_IsContentsGroupOpen("282")
PaGlobal_ConsoleKeyCombo = {
_ui = {_comboDelay = (UI.getChildControl)(Panel_ComboCommand, "Progress2_ComboDelay")}
, 
_firstButton = {[0] = "LT", [1] = "RT", [2] = "LB", [3] = "RB"}
, 
_secondButton = {[0] = "FRONT", [1] = "RIGHT", [2] = "BACK", [3] = "LEFT"}
, 
_thirdButton = {[0] = "X", [1] = "Y", [2] = "A", [3] = "B"}
, 
_slotConfig = {createIcon = true, createBorder = true, createCount = true, createEnchant = true, createCash = true, createEnduranceIcon = true}
, 
_skillSlotConfig = {createIcon = true, createEffect = true, createFG = true, createFGDisabled = true, createFG_Passive = true, createMinus = true, createLevel = true, createLearnButton = true, createTestimonial = true, createLockIcon = true, createMouseOver = true, 
template = {effect = (UI.getChildControl)(Panel_Window_Skill, "Static_Icon_Skill_Effect"), iconFG = (UI.getChildControl)(Panel_Window_Skill, "Static_Icon_FG"), iconFGDisabled = (UI.getChildControl)(Panel_Window_Skill, "Static_Icon_FG_DISABLE"), iconFG_Passive = (UI.getChildControl)(Panel_Window_Skill, "Static_Icon_BG"), iconMinus = (UI.getChildControl)(Panel_Window_Skill, "Static_Icon_Skill_EffectMinus"), learnButton = (UI.getChildControl)(Panel_Window_Skill, "Button_Skill_Point"), mouseOverButton = (UI.getChildControl)(Panel_Window_Skill, "Button_Skill_OverMouse"), testimonial = (UI.getChildControl)(Panel_Window_Skill, "Static_Skill_Effect"), lockIcon = (UI.getChildControl)(Panel_Window_Skill, "Static_SkillLockIcon")}
}
, 
_comboData = {
[0] = {}
, 
[1] = {}
, 
[2] = {}
}
, _maxNextSkillList = 6, _skillMaxKeyCount = 3, _buttonMaxCount = 4, _buttonIndex = 0, _showSkillIndex = 0, _currentTime = 0, _delayTime = 0, _screenSizeX = 0, _screenSizeY = 0, 
_showSkillData = {}
, _slots = (Array.new)()}
-- DECOMPILER ERROR at PC137: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyCombo.initialize = function(self)
  -- function num : 0_0
  for index = 0, self._maxNextSkillList - 1 do
    local slot = {}
    slot._skillIcon = (UI.createAndCopyBasePropertyControl)(Panel_ComboCommand, "Static_SkillIcon", Panel_ComboCommand, "skillComboCommand_SkillIcon_" .. index)
    slot._line = (UI.createAndCopyBasePropertyControl)(Panel_ComboCommand, "Static_Line", slot._skillIcon, "skillComboCommand_Line_" .. index)
    slot._name = (UI.createAndCopyBasePropertyControl)(Panel_ComboCommand, "Static_SkillName", slot._skillIcon, "skillComboCommand_SkillName_" .. index)
    slot._RB = (UI.createAndCopyBasePropertyControl)(Panel_ComboCommand, "Static_RB", slot._skillIcon, "skillComboCommand_RB_" .. index)
    slot._LB = (UI.createAndCopyBasePropertyControl)(Panel_ComboCommand, "Static_LB", slot._skillIcon, "skillComboCommand_LB_" .. index)
    slot._RT = (UI.createAndCopyBasePropertyControl)(Panel_ComboCommand, "Static_RT", slot._skillIcon, "skillComboCommand_RT_" .. index)
    slot._LT = (UI.createAndCopyBasePropertyControl)(Panel_ComboCommand, "Static_LT", slot._skillIcon, "skillComboCommand_LT_" .. index)
    slot._crossUp = (UI.createAndCopyBasePropertyControl)(Panel_ComboCommand, "Static_CrossUp", slot._skillIcon, "skillComboCommand_CrossUp_" .. index)
    slot._crossRight = (UI.createAndCopyBasePropertyControl)(Panel_ComboCommand, "Static_CrossRight", slot._skillIcon, "skillComboCommand_CrossRight_" .. index)
    slot._crossDown = (UI.createAndCopyBasePropertyControl)(Panel_ComboCommand, "Static_CrossDown", slot._skillIcon, "skillComboCommand_CrossDown_" .. index)
    slot._crossLeft = (UI.createAndCopyBasePropertyControl)(Panel_ComboCommand, "Static_CrossLeft", slot._skillIcon, "skillComboCommand_CrossLeft_" .. index)
    slot._x = (UI.createAndCopyBasePropertyControl)(Panel_ComboCommand, "Static_X", slot._skillIcon, "skillComboCommand_X_" .. index)
    slot._y = (UI.createAndCopyBasePropertyControl)(Panel_ComboCommand, "Static_Y", slot._skillIcon, "skillComboCommand_Y_" .. index)
    slot._a = (UI.createAndCopyBasePropertyControl)(Panel_ComboCommand, "Static_A", slot._skillIcon, "skillComboCommand_A_" .. index)
    slot._b = (UI.createAndCopyBasePropertyControl)(Panel_ComboCommand, "Static_B", slot._skillIcon, "skillComboCommand_B" .. index)
    for _,v in pairs(slot) do
      v:SetShow(false)
    end
    -- DECOMPILER ERROR at PC166: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._slots)[index] = slot
  end
  self._screenSizeX = getScreenSizeX() / 2 - 80
  self._screenSizeY = getScreenSizeY() / 2 + 50
  ;
  ((self._ui)._comboDelay):SetPosX(self._screenSizeX - 10)
  ;
  ((self._ui)._comboDelay):SetPosY(self._screenSizeY - 200)
end

-- DECOMPILER ERROR at PC140: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyCombo.open = function(self)
  -- function num : 0_1
end

-- DECOMPILER ERROR at PC143: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyCombo.close = function(self)
  -- function num : 0_2
end

-- DECOMPILER ERROR at PC146: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyCombo.nextSkillUpdate = function(self)
  -- function num : 0_3
  local skillCount = selfPlayerNextSkillConsoleKeySize()
  for index = 0, self._showSkillIndex - 1 do
    ((self._showSkillData)[index]):SetShow(false)
  end
  for index = 0, skillCount - 1 do
    local skillNo = selfPlayerNextSkillConsoleSkillNo(index)
    local skillWrapper = getSkillTypeStaticStatus(skillNo)
    if skillWrapper == nil then
      return 
    end
    local iconPath = skillWrapper:getIconPath()
    self._buttonIndex = 0
    ;
    (((self._slots)[index])._skillIcon):ChangeTextureInfoName("Icon/" .. iconPath)
    ;
    (((self._slots)[index])._skillIcon):SetShow(true)
    ;
    (((self._slots)[index])._skillIcon):SetPosY(((((self._slots)[index])._skillIcon):GetSizeY() + 10) * index)
    ;
    (((self._slots)[index])._name):SetText(skillWrapper:getName())
    ;
    (((self._slots)[index])._name):SetShow(true)
    local buttonKey = selfPlayerNextSkillConsoleKeyList(index)
    for buttonIndex = 0, self._skillMaxKeyCount - 1 do
      local isFind = PaGlobal_ConsoleKeyCombo:findCommand(index, buttonKey, buttonIndex)
      if isFind then
        self._buttonIndex = self._buttonIndex + 1
      end
    end
  end
end

-- DECOMPILER ERROR at PC149: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyCombo.findCommand = function(self, index, buttonKey, buttonIndex)
  -- function num : 0_4
  local button = {}
  if buttonIndex == 0 then
    button = self._firstButton
  else
    if buttonIndex == 1 then
      button = self._secondButton
    else
      if buttonIndex == 2 then
        button = self._thirdButton
      end
    end
  end
  local isFind = false
  for buttonCount = 0, self._buttonMaxCount - 1 do
    local startIndex, endIndex = (string.find)(buttonKey, button[buttonCount])
    if startIndex ~= nil and endIndex ~= nil then
      local command = (string.sub)(buttonKey, startIndex, endIndex)
      PaGlobal_ConsoleKeyCombo:showCommand(index, command)
      isFind = true
    end
  end
  return isFind
end

-- DECOMPILER ERROR at PC152: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyCombo.showCommand = function(self, index, command)
  -- function num : 0_5
  if command == "LT" then
    PaGlobal_ConsoleKeyCombo:setPosCommand(index, ((self._slots)[index])._LT, 0)
  else
    if command == "RT" then
      PaGlobal_ConsoleKeyCombo:setPosCommand(index, ((self._slots)[index])._RT, 0)
    else
      if command == "LB" then
        PaGlobal_ConsoleKeyCombo:setPosCommand(index, ((self._slots)[index])._LB, 0)
      else
        if command == "RB" then
          PaGlobal_ConsoleKeyCombo:setPosCommand(index, ((self._slots)[index])._RB, 0)
        else
          if command == "FRONT" then
            PaGlobal_ConsoleKeyCombo:setPosCommand(index, ((self._slots)[index])._crossUp, 0)
          else
            if command == "RIGHT" then
              PaGlobal_ConsoleKeyCombo:setPosCommand(index, ((self._slots)[index])._crossRight, 0)
            else
              if command == "BACK" then
                PaGlobal_ConsoleKeyCombo:setPosCommand(index, ((self._slots)[index])._crossDown, 0)
              else
                if command == "LEFT" then
                  PaGlobal_ConsoleKeyCombo:setPosCommand(index, ((self._slots)[index])._crossLeft, 0)
                else
                  if command == "X" then
                    PaGlobal_ConsoleKeyCombo:setPosCommand(index, ((self._slots)[index])._x, 1)
                  else
                    if command == "Y" then
                      PaGlobal_ConsoleKeyCombo:setPosCommand(index, ((self._slots)[index])._y, 2)
                    else
                      if command == "A" then
                        PaGlobal_ConsoleKeyCombo:setPosCommand(index, ((self._slots)[index])._a, 3)
                      else
                        if command == "B" then
                          PaGlobal_ConsoleKeyCombo:setPosCommand(index, ((self._slots)[index])._b, 4)
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC155: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyCombo.setPosCommand = function(self, skillIndex, control, posIndex)
  -- function num : 0_6
  if posIndex == 1 then
    (((self._slots)[skillIndex])._skillIcon):SetPosX(self._screenSizeX - 150)
    ;
    (((self._slots)[skillIndex])._skillIcon):SetPosY(self._screenSizeY)
  else
    if posIndex == 2 then
      (((self._slots)[skillIndex])._skillIcon):SetPosX(self._screenSizeX)
      ;
      (((self._slots)[skillIndex])._skillIcon):SetPosY(self._screenSizeY - 150)
    else
      if posIndex == 3 then
        (((self._slots)[skillIndex])._skillIcon):SetPosX(self._screenSizeX)
        ;
        (((self._slots)[skillIndex])._skillIcon):SetPosY(self._screenSizeY + 150)
      else
        if posIndex == 4 then
          (((self._slots)[skillIndex])._skillIcon):SetPosX(self._screenSizeX + 150)
          ;
          (((self._slots)[skillIndex])._skillIcon):SetPosY(self._screenSizeY)
        end
      end
    end
  end
  local nameSize = (((self._slots)[skillIndex])._name):GetTextSizeX()
  control:SetShow(true)
  control:SetPosX((control:GetSizeX() + 10) * (self._buttonIndex + 1) + nameSize)
  -- DECOMPILER ERROR at PC82: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._showSkillData)[self._showSkillIndex] = control
  self._showSkillIndex = self._showSkillIndex + 1
end

FromClient_consoleNextSkillList = function()
  -- function num : 0_7 , upvalues : isAbleConsolePadGroup
  if isAbleConsolePadGroup == false then
    return 
  end
  local self = PaGlobal_ConsoleKeyCombo
  for index = 0, self._showSkillIndex - 1 do
    ((self._showSkillData)[index]):SetShow(false)
    ;
    (((self._slots)[index])._skillIcon):SetShow(false)
  end
  self._showSkillIndex = 0
  Panel_ComboCommand:SetShow(true)
  ;
  ((self._ui)._comboDelay):SetShow(true)
  local delayTime = selfPlayerNextSkillConsoleDelayTime()
  self._currentTime = Int64toInt32(delayTime)
  self._delayTime = Int64toInt32(delayTime)
  PaGlobal_ConsoleKeyCombo:nextSkillUpdate()
end

ConsoleKeyComboUpdateTime = function(updateTime)
  -- function num : 0_8
  local isCombo = selfPlayerNextSkillConsoleSkillIsCombo()
  local self = PaGlobal_ConsoleKeyCombo
  if isCombo == false then
    for index = 0, self._showSkillIndex - 1 do
      ((self._showSkillData)[index]):SetShow(false)
      ;
      (((self._slots)[index])._skillIcon):SetShow(false)
    end
    ;
    ((self._ui)._comboDelay):SetShow(false)
    self._currentTime = 0
    return 
  end
  self._currentTime = self._currentTime - updateTime
  ;
  ((self._ui)._comboDelay):SetProgressRate(self._currentTime * 100 / self._delayTime)
end

PaGlobal_ConsoleKeyCombo:initialize()
registerEvent("FromClient_consoleNextSkillList", "FromClient_consoleNextSkillList")
Panel_ComboCommand:RegisterUpdateFunc("ConsoleKeyComboUpdateTime")

