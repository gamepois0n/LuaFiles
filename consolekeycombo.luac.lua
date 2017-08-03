-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\skillcommand\consolekeycombo.luac 

-- params : ...
-- function num : 0
Panel_ConsoleCombo:SetShow(false)
local isAbleConsolePadGroup = ToClient_IsContentsGroupOpen("282")
PaGlobal_ConsoleKeyCombo = {
_ui = {_static_RotateBG = (UI.getChildControl)(Panel_ConsoleCombo, "Static_Bg"), _static_X = (UI.getChildControl)(Panel_ConsoleCombo, "Static_ButtonX"), _static_Y = (UI.getChildControl)(Panel_ConsoleCombo, "Static_ButtonY"), _static_A = (UI.getChildControl)(Panel_ConsoleCombo, "Static_ButtonA"), _static_B = (UI.getChildControl)(Panel_ConsoleCombo, "Static_ButtonB"), _static_SkillIcon_Up = (UI.getChildControl)(Panel_ConsoleCombo, "Static_SkillIcon_Up"), _static_SkillIcon_Right = (UI.getChildControl)(Panel_ConsoleCombo, "Static_SkillIcon_Right"), _static_SkillIcon_Down = (UI.getChildControl)(Panel_ConsoleCombo, "Static_SkillIcon_Down"), _static_SkillIcon_Left = (UI.getChildControl)(Panel_ConsoleCombo, "Static_SkillIcon_Left"), _comboDelay = (UI.getChildControl)(Panel_ConsoleCombo, "CircularProgress_LimitTime")}
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
, _maxNextSkillList = 12, _skillMaxKeyCount = 3, _buttonMaxCount = 4, _buttonIndex = 0, _showSkillIndex = 0, _currentTime = 0, _delayTime = 0, _screenSizeX = 0, _screenSizeY = 0, 
_showSkillData = {}
, _slots = (Array.new)()}
-- DECOMPILER ERROR at PC102: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyCombo.initialize = function(self)
  -- function num : 0_0
end

-- DECOMPILER ERROR at PC105: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyCombo.open = function(self)
  -- function num : 0_1
end

-- DECOMPILER ERROR at PC108: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyCombo.close = function(self)
  -- function num : 0_2
end

-- DECOMPILER ERROR at PC111: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyCombo.nextSkillUpdate = function(self)
  -- function num : 0_3
  local skillCount = selfPlayerNextSkillConsoleKeySize()
  for index = 0, skillCount - 1 do
    local skillNo = selfPlayerNextSkillConsoleSkillNo(index)
    local skillWrapper = getSkillTypeStaticStatus(skillNo)
    if skillWrapper == nil then
      return 
    end
    local iconPath = skillWrapper:getIconPath()
    local buttonKey = selfPlayerNextSkillConsoleKeyList(index)
    local isFind = PaGlobal_ConsoleKeyCombo:findCommand(index, buttonKey, iconPath)
  end
end

-- DECOMPILER ERROR at PC114: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyCombo.findCommand = function(self, index, buttonKey, iconPath)
  -- function num : 0_4
  for buttonCount = 0, self._buttonMaxCount - 1 do
    local startIndex, endIndex = (string.find)(buttonKey, (self._button)[buttonCount])
    if startIndex ~= nil and endIndex ~= nil then
      local command = (string.sub)(buttonKey, startIndex, endIndex)
      PaGlobal_ConsoleKeyCombo:showCommand(index, command, iconPath)
      isFind = true
    end
  end
end

-- DECOMPILER ERROR at PC117: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyCombo.showCommand = function(self, index, command, iconPath)
  -- function num : 0_5
  if command == "X" then
    PaGlobal_ConsoleKeyCombo:setPosCommand(index, 0, iconPath)
  else
    if command == "Y" then
      PaGlobal_ConsoleKeyCombo:setPosCommand(index, 1, iconPath)
    else
      if command == "A" then
        PaGlobal_ConsoleKeyCombo:setPosCommand(index, 2, iconPath)
      else
        if command == "B" then
          PaGlobal_ConsoleKeyCombo:setPosCommand(index, 3, iconPath)
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC120: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyCombo.setPosCommand = function(self, skillIndex, posIndex, iconPath)
  -- function num : 0_6
  if posIndex == 0 then
    ((self._ui)._static_X):SetShow(true)
    ;
    ((self._ui)._static_SkillIcon_Left):SetShow(true)
    ;
    ((self._ui)._static_SkillIcon_Left):ChangeTextureInfoName("Icon/" .. iconPath)
  else
    if posIndex == 1 then
      ((self._ui)._static_Y):SetShow(true)
      ;
      ((self._ui)._static_SkillIcon_Up):SetShow(true)
      ;
      ((self._ui)._static_SkillIcon_Up):ChangeTextureInfoName("Icon/" .. iconPath)
    else
      if posIndex == 2 then
        ((self._ui)._static_A):SetShow(true)
        ;
        ((self._ui)._static_SkillIcon_Down):SetShow(true)
        ;
        ((self._ui)._static_SkillIcon_Down):ChangeTextureInfoName("Icon/" .. iconPath)
      else
        if posIndex == 3 then
          ((self._ui)._static_B):SetShow(true)
          ;
          ((self._ui)._static_SkillIcon_Right):SetShow(true)
          ;
          ((self._ui)._static_SkillIcon_Right):ChangeTextureInfoName("Icon/" .. iconPath)
        end
      end
    end
  end
end

FromClient_consoleNextSkillList = function()
  -- function num : 0_7 , upvalues : isAbleConsolePadGroup
  if isAbleConsolePadGroup == false then
    return 
  end
  local self = PaGlobal_ConsoleKeyCombo
  for key,value in pairs(self._ui) do
    value:SetShow(false)
  end
  self._showSkillIndex = 0
  Panel_ConsoleCombo:SetShow(true)
  ;
  ((self._ui)._comboDelay):SetShow(true)
  local delayTime = selfPlayerNextSkillConsoleDelayTime()
  ;
  ((self._ui)._comboDelay):SetCurrentControlPos(0)
  ;
  ((self._ui)._comboDelay):SetAniSpeed(0.1)
  self._currentTime = 0
  self._delayTime = Int64toInt32(delayTime) / 1000
  PaGlobal_ConsoleKeyCombo:nextSkillUpdate()
  ;
  ((self._ui)._static_RotateBG):SetShow(true)
end

ConsoleKeyComboUpdateTime = function(updateTime)
  -- function num : 0_8
  local isCombo = selfPlayerNextSkillConsoleSkillIsCombo()
  local self = PaGlobal_ConsoleKeyCombo
  if isCombo == false then
    for key,value in pairs(self._ui) do
      value:SetShow(false)
    end
    self._currentTime = 0
    return 
  end
  self._currentTime = self._currentTime + updateTime
  ;
  ((self._ui)._comboDelay):SetProgressRate(self._currentTime * 100 / self._delayTime)
  ;
  ((self._ui)._static_RotateBG):SetRotate()
end

PaGlobal_ConsoleKeyCombo:initialize()
registerEvent("FromClient_consoleNextSkillList", "FromClient_consoleNextSkillList")
Panel_ConsoleCombo:RegisterUpdateFunc("ConsoleKeyComboUpdateTime")

