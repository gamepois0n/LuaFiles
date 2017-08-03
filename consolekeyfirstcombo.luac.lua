-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\skillcommand\consolekeyfirstcombo.luac 

-- params : ...
-- function num : 0
Panel_Combo_Guide:SetShow(false)
local isAbleConsolePadGroup = ToClient_IsContentsGroupOpen("282")
PaGlobal_ConsoleKeyFirstCombo = {
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
, _maxNextSkillList = 25, _skillMaxKeyCount = 3, _buttonMaxCount = 4, _buttonIndex = 0, _showControlIndex = 0, _currentTime = 0, _beforeSkillNo = 0, 
_buttonKey = {}
, 
_showSkillData = {}
, 
_sameNameSkillData = {}
, _slots = (Array.new)()}
-- DECOMPILER ERROR at PC131: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyFirstCombo.initialize = function(self)
  -- function num : 0_0
  for index = 0, self._maxNextSkillList - 1 do
    local slot = {}
    slot._skillIcon = (UI.createAndCopyBasePropertyControl)(Panel_Combo_Guide, "Static_SkillIcon", Panel_Combo_Guide, "skillComboCommand_SkillIcon_" .. index)
    slot._line = (UI.createAndCopyBasePropertyControl)(Panel_Combo_Guide, "Static_Line", slot._skillIcon, "skillComboCommand_Line_" .. index)
    slot._name = (UI.createAndCopyBasePropertyControl)(Panel_Combo_Guide, "StaticText_SkillName", slot._skillIcon, "skillComboCommand_SkillName_" .. index)
    slot._RB = (UI.createAndCopyBasePropertyControl)(Panel_Combo_Guide, "Static_RB", slot._skillIcon, "skillComboCommand_RB_" .. index)
    slot._LB = (UI.createAndCopyBasePropertyControl)(Panel_Combo_Guide, "Static_LB", slot._skillIcon, "skillComboCommand_LB_" .. index)
    slot._RT = (UI.createAndCopyBasePropertyControl)(Panel_Combo_Guide, "Static_RT", slot._skillIcon, "skillComboCommand_RT_" .. index)
    slot._LT = (UI.createAndCopyBasePropertyControl)(Panel_Combo_Guide, "Static_LT", slot._skillIcon, "skillComboCommand_LT_" .. index)
    slot._AnalogUp = (UI.createAndCopyBasePropertyControl)(Panel_Combo_Guide, "Static_AnalogL_Up", slot._skillIcon, "skillComboCommand_CrossUp_" .. index)
    slot._AnalogRight = (UI.createAndCopyBasePropertyControl)(Panel_Combo_Guide, "Static_AnalogL_Right", slot._skillIcon, "skillComboCommand_CrossRight_" .. index)
    slot._AnalogDown = (UI.createAndCopyBasePropertyControl)(Panel_Combo_Guide, "Static_AnalogL_Down", slot._skillIcon, "skillComboCommand_CrossDown_" .. index)
    slot._AnalogLeft = (UI.createAndCopyBasePropertyControl)(Panel_Combo_Guide, "Static_AnalogL_Left", slot._skillIcon, "skillComboCommand_CrossLeft_" .. index)
    slot._x = (UI.createAndCopyBasePropertyControl)(Panel_Combo_Guide, "Static_X", slot._skillIcon, "skillComboCommand_X_" .. index)
    slot._y = (UI.createAndCopyBasePropertyControl)(Panel_Combo_Guide, "Static_Y", slot._skillIcon, "skillComboCommand_Y_" .. index)
    slot._a = (UI.createAndCopyBasePropertyControl)(Panel_Combo_Guide, "Static_A", slot._skillIcon, "skillComboCommand_A_" .. index)
    slot._b = (UI.createAndCopyBasePropertyControl)(Panel_Combo_Guide, "Static_B", slot._skillIcon, "skillComboCommand_B" .. index)
    for _,v in pairs(slot) do
      v:SetShow(false)
    end
    -- DECOMPILER ERROR at PC166: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._slots)[index] = slot
  end
end

-- DECOMPILER ERROR at PC134: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyFirstCombo.open = function(self)
  -- function num : 0_1
  Panel_Combo_Guide:SetShow(true)
end

-- DECOMPILER ERROR at PC137: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyFirstCombo.close = function(self)
  -- function num : 0_2
  for index = 0, self._maxNextSkillList - 1 do
    if (self._showSkillData)[index] ~= nil then
      ((self._showSkillData)[index]):SetShow(false)
    end
    if ((self._slots)[index])._skillIcon ~= nil then
      (((self._slots)[index])._skillIcon):SetShow(false)
    end
  end
  Panel_Combo_Guide:SetShow(false)
end

-- DECOMPILER ERROR at PC140: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyFirstCombo.update = function(self, weaponType, commonSkillCount, normalSkillCount, awakenSkillCount)
  -- function num : 0_3
  local findSkillCount = 0
  local sameSkillCount = 0
  self._beforeSkillNo = 0
  local setSkill = function(skillWrapper, index, weaponType)
    -- function num : 0_3_0 , upvalues : sameSkillCount, self, commonSkillCount
    local isSame = false
    for index = 0, sameSkillCount - 1 do
      if (self._sameNameSkillData)[index] == skillWrapper:getName() then
        isSame = true
      end
    end
    -- DECOMPILER ERROR at PC22: Confused about usage of register: R4 in 'UnsetPending'

    if isSame == false then
      (self._sameNameSkillData)[sameSkillCount] = skillWrapper:getName()
      local iconPath = skillWrapper:getIconPath()
      -- DECOMPILER ERROR at PC26: Confused about usage of register: R5 in 'UnsetPending'

      self._buttonIndex = 0
      ;
      (((self._slots)[sameSkillCount])._skillIcon):ChangeTextureInfoName("Icon/" .. iconPath)
      ;
      (((self._slots)[sameSkillCount])._skillIcon):SetShow(true)
      ;
      (((self._slots)[sameSkillCount])._skillIcon):SetPosX(100 + (math.floor)(sameSkillCount / 6) * 300)
      ;
      (((self._slots)[sameSkillCount])._skillIcon):SetPosY(150 + ((((self._slots)[sameSkillCount])._skillIcon):GetSizeY() + 30) * (sameSkillCount % 6))
      ;
      (((self._slots)[sameSkillCount])._name):SetText(skillWrapper:getName())
      ;
      (((self._slots)[sameSkillCount])._name):SetShow(true)
      local buttonKey = ""
      if index < commonSkillCount then
        buttonKey = selfPlayerFirstCommonSkillConsoleKeyList(index)
      else
        buttonKey = selfPlayerFirstSkillConsoleKeyList(weaponType, index - commonSkillCount)
      end
      -- DECOMPILER ERROR at PC113: Confused about usage of register: R6 in 'UnsetPending'

      ;
      (self._buttonKey)[sameSkillCount] = buttonKey
      for buttonIndex = 0, self._skillMaxKeyCount - 1 do
        local isFind = PaGlobal_ConsoleKeyFirstCombo:findCommand(sameSkillCount, buttonKey, buttonIndex)
        -- DECOMPILER ERROR at PC132: Confused about usage of register: R11 in 'UnsetPending'

        if isFind then
          self._buttonIndex = self._buttonIndex + 1
          -- DECOMPILER ERROR at PC135: Confused about usage of register: R11 in 'UnsetPending'

          self._beforeSkillNo = skillNo
        end
      end
      sameSkillCount = sameSkillCount + 1
    end
  end

  for index = 0, commonSkillCount - 1 do
    local skillNo = selfPlayerFirstCommonSkillConsoleSkillNo(index)
    local skillWrapper = getSkillTypeStaticStatus(skillNo)
    if skillWrapper == nil then
      break
    end
    setSkill(skillWrapper, index, weaponType)
  end
  do
    local skillCount = 0
    if weaponType == 1 then
      skillCount = normalSkillCount
    else
      if weaponType == 2 then
        skillCount = awakenSkillCount
      end
    end
    for index = commonSkillCount, skillCount + commonSkillCount - 1 do
      local skillNo = selfPlayerFirstSkillConsoleSkillNo(weaponType, index - commonSkillCount)
      local skillWrapper = getSkillTypeStaticStatus(skillNo)
      if skillWrapper == nil then
        return 
      end
      setSkill(skillWrapper, index, weaponType)
    end
  end
end

-- DECOMPILER ERROR at PC143: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyFirstCombo.findCommand = function(self, index, buttonKey, buttonIndex)
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
    local startIndex, endIndex = (string.find)((self._buttonKey)[index], button[buttonCount])
    if startIndex ~= nil and endIndex ~= nil then
      local command = (string.sub)((self._buttonKey)[index], startIndex, endIndex)
      -- DECOMPILER ERROR at PC44: Confused about usage of register: R13 in 'UnsetPending'

      ;
      (self._buttonKey)[index] = (string.gsub)((self._buttonKey)[index], command, "", 1)
      PaGlobal_ConsoleKeyFirstCombo:showCommand(index, command)
      isFind = true
    end
  end
  return isFind
end

-- DECOMPILER ERROR at PC146: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyFirstCombo.showCommand = function(self, index, command)
  -- function num : 0_5
  if command == "LT" then
    PaGlobal_ConsoleKeyFirstCombo:setPosCommand(index, ((self._slots)[index])._LT, 0)
  else
    if command == "RT" then
      PaGlobal_ConsoleKeyFirstCombo:setPosCommand(index, ((self._slots)[index])._RT, 0)
    else
      if command == "LB" then
        PaGlobal_ConsoleKeyFirstCombo:setPosCommand(index, ((self._slots)[index])._LB, 0)
      else
        if command == "RB" then
          PaGlobal_ConsoleKeyFirstCombo:setPosCommand(index, ((self._slots)[index])._RB, 0)
        else
          if command == "FRONT" then
            PaGlobal_ConsoleKeyFirstCombo:setPosCommand(index, ((self._slots)[index])._AnalogUp, 0)
          else
            if command == "RIGHT" then
              PaGlobal_ConsoleKeyFirstCombo:setPosCommand(index, ((self._slots)[index])._AnalogRight, 0)
            else
              if command == "BACK" then
                PaGlobal_ConsoleKeyFirstCombo:setPosCommand(index, ((self._slots)[index])._AnalogDown, 0)
              else
                if command == "LEFT" then
                  PaGlobal_ConsoleKeyFirstCombo:setPosCommand(index, ((self._slots)[index])._AnalogLeft, 0)
                else
                  if command == "X" then
                    PaGlobal_ConsoleKeyFirstCombo:setPosCommand(index, ((self._slots)[index])._x, 1)
                  else
                    if command == "Y" then
                      PaGlobal_ConsoleKeyFirstCombo:setPosCommand(index, ((self._slots)[index])._y, 2)
                    else
                      if command == "A" then
                        PaGlobal_ConsoleKeyFirstCombo:setPosCommand(index, ((self._slots)[index])._a, 3)
                      else
                        if command == "B" then
                          PaGlobal_ConsoleKeyFirstCombo:setPosCommand(index, ((self._slots)[index])._b, 4)
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

-- DECOMPILER ERROR at PC149: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyFirstCombo.setPosCommand = function(self, skillIndex, control, posIndex)
  -- function num : 0_6
  control:SetShow(true)
  control:SetPosX(50 + 50 * (self._buttonIndex + 1))
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._showSkillData)[self._showControlIndex] = control
  self._showSkillIndex = skillIndex
  self._showControlIndex = self._showControlIndex + 1
end

FromClient_consoleFirstKeyList = function()
  -- function num : 0_7 , upvalues : isAbleConsolePadGroup
  if isAbleConsolePadGroup == false then
    return 
  end
end

FromClient_consoleFirstSkillList = function(weaponType)
  -- function num : 0_8
  if Panel_Combo_Guide:GetShow() then
    PaGlobal_ConsoleKeyFirstCombo:close()
  else
    -- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

    PaGlobal_ConsoleKeyFirstCombo._sameNameSkillData = {}
    local commonSkillCount = selfPlayerFirstCommonSkillConsoleKeySize()
    local normalSkillCount = selfPlayerFirstSkillConsoleKeySize(weaponType)
    local awakenSkillCount = selfPlayerFirstSkillConsoleKeySize(weaponType)
    PaGlobal_ConsoleKeyFirstCombo:open()
    PaGlobal_ConsoleKeyFirstCombo:update(weaponType, commonSkillCount, normalSkillCount, awakenSkillCount)
  end
end

PaGlobal_ConsoleKeyFirstCombo:initialize()
registerEvent("FromClient_consoleFirstSkillList", "FromClient_consoleFirstSkillList")

