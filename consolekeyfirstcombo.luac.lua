-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\skillcommand\consolekeyfirstcombo.luac 

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
, _consolePage = 0, _maxNextSkillList = 50, _skillMaxKeyCount = 3, _buttonMaxCount = 4, _buttonIndex = 0, _showControlIndex = 0, _currentTime = 0, _isGuide = false, _differentSkillCount = 0, 
_sameSKillData = {}
, _sameCount = 0, _weaponType = 0, 
_buttonKey = {}
, 
_showSkillData = {}
, _slots = (Array.new)()}
-- DECOMPILER ERROR at PC135: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyFirstCombo.initialize = function(self)
  -- function num : 0_0
  for index = 0, self._maxNextSkillList - 1 do
    local slot = {}
    slot._skillIcon = (UI.createAndCopyBasePropertyControl)(Panel_Combo_Guide, "Static_SkillIcon", Panel_Combo_Guide, "skillComboCommand_SkillIcon_" .. index)
    slot._line = (UI.createAndCopyBasePropertyControl)(Panel_Combo_Guide, "Static_Line", slot._skillIcon, "skillComboCommand_Line_" .. index)
    slot._skillName = (UI.createAndCopyBasePropertyControl)(Panel_Combo_Guide, "StaticText_NormalSkillName", slot._skillIcon, "skillComboCommand_normalSkillName_" .. index)
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

-- DECOMPILER ERROR at PC138: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyFirstCombo.showToggle = function(self)
  -- function num : 0_1
  if Panel_Combo_Guide:GetShow() then
    self:close()
  else
    self:open()
    self:update(1)
  end
end

-- DECOMPILER ERROR at PC141: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyFirstCombo.open = function(self)
  -- function num : 0_2
  Panel_Combo_Guide:SetShow(true)
  self._sameCount = 0
  self._sameSKillData = {}
end

-- DECOMPILER ERROR at PC144: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyFirstCombo.close = function(self)
  -- function num : 0_3
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

-- DECOMPILER ERROR at PC147: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyFirstCombo.update = function(self, firstWeaponType)
  -- function num : 0_4
  local normalSkillCount = selfPlayerFirstSkillConsoleKeySize(1)
  local awakenSkillCount = selfPlayerFirstSkillConsoleKeySize(2)
  self._normalSameCount = 0
  self._awakenSameCount = 0
  self._sameSKillData = {}
  if firstWeaponType == 1 then
    for index = 0, normalSkillCount - 1 do
      local buttonKey = selfPlayerFirstSkillConsoleKeyList(1, index)
      local skillNo = selfPlayerFirstSkillConsoleSkillNo(1, index)
      if skillNo ~= 0 then
        local skillWrapper = getSkillTypeStaticStatus(skillNo)
        if skillWrapper ~= nil then
          PaGlobal_ConsoleKeyFirstCombo:setSkill(skillWrapper, index, 1, skillNo, firstWeaponType)
        end
      end
    end
  else
    do
      if firstWeaponType == 2 then
        for index = 0, awakenSkillCount - 1 do
          local buttonKey = selfPlayerFirstSkillConsoleKeyList(2, index)
          local skillNo = selfPlayerFirstSkillConsoleSkillNo(2, index)
          if skillNo ~= 0 then
            local skillWrapper = getSkillTypeStaticStatus(skillNo)
            if skillWrapper ~= nil then
              PaGlobal_ConsoleKeyFirstCombo:setSkill(skillWrapper, index, 2, skillNo, firstWeaponType)
            end
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC150: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyFirstCombo.findSkill = function(self, firstWeaponType, isNextSkill)
  -- function num : 0_5
  local normalSkillCount = selfPlayerFirstSkillConsoleKeySize(1)
  local awakenSkillCount = selfPlayerFirstSkillConsoleKeySize(2)
  local skillCount = normalSkillCount + awakenSkillCount
  local buttonKey = nil
  local skillNo = -1
  local weaponType = 0
  local skillIndex = -1
  for index = 0, skillCount - 1 do
    if index < normalSkillCount then
      skillIndex = index
      buttonKey = selfPlayerFirstSkillConsoleKeyList(1, skillIndex)
      skillNo = selfPlayerFirstSkillConsoleSkillNo(1, skillIndex)
      weaponType = 1
    else
      skillIndex = index - normalSkillCount
      buttonKey = selfPlayerFirstSkillConsoleKeyList(2, skillIndex)
      skillNo = selfPlayerFirstSkillConsoleSkillNo(2, skillIndex)
      weaponType = 2
    end
    if index == awakenSkillCount - 1 then
      isLast = true
    end
    if skillNo ~= 0 then
      local skillWrapper = getSkillTypeStaticStatus(skillNo)
      if skillWrapper ~= nil then
        PaGlobal_ConsoleKeyFirstCombo:setSkill(skillWrapper, skillIndex, weaponType, skillNo, firstWeaponType, isNextSkill)
      end
    end
  end
end

-- DECOMPILER ERROR at PC153: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyFirstCombo.setSkill = function(self, skillWrapper, index, weaponType, skillNo, firstWeaponType, isNextSkill)
  -- function num : 0_6
  local isSame = false
  local firstKey = selfPlayerFirstSkillConsoleKeyList(firstWeaponType, index)
  PaGlobal_ConsoleKeyCombo:findFirstCombo(firstKey, skillWrapper, skillNo, index, weaponType)
  if isNextSkill then
    return 
  end
  if self._sameCount >= 20 then
    return 
  end
  for count = 0, self._sameCount - 1 do
    if (self._sameSKillData)[count] == skillNo then
      isSame = true
    end
  end
  if isSame == false then
    local buttonKey = selfPlayerFirstSkillConsoleKeyList(weaponType, index)
    -- DECOMPILER ERROR at PC39: Confused about usage of register: R10 in 'UnsetPending'

    ;
    (self._sameSKillData)[self._sameCount] = skillNo
    local iconPath = skillWrapper:getIconPath()
    ;
    (((self._slots)[self._sameCount])._skillIcon):ChangeTextureInfoName("Icon/" .. iconPath)
    ;
    (((self._slots)[self._sameCount])._skillIcon):SetShow(true)
    ;
    (((self._slots)[self._sameCount])._skillIcon):SetPosX(20 + (math.floor)(self._sameCount / 5) * 260)
    ;
    (((self._slots)[self._sameCount])._skillIcon):SetPosY(self._sameCount % 5 * ((((self._slots)[self._sameCount])._skillIcon):GetSizeY() + 36) + 200)
    ;
    (((self._slots)[self._sameCount])._skillName):SetShow(true)
    ;
    (((self._slots)[self._sameCount])._skillName):SetText(skillWrapper:getName())
    self._buttonIndex = 0
    -- DECOMPILER ERROR at PC106: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self._buttonKey)[self._sameCount] = buttonKey
    for buttonIndex = 0, self._skillMaxKeyCount - 1 do
      local isFind = PaGlobal_ConsoleKeyFirstCombo:findCommand(self._sameCount, buttonKey, R19_PC118, weaponType)
      if isFind then
        self._buttonIndex = self._buttonIndex + 1
      end
    end
    self._sameCount = self._sameCount + 1
  end
end

-- DECOMPILER ERROR at PC156: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyFirstCombo.findCommand = function(self, index, buttonKey, buttonIndex, weaponType)
  -- function num : 0_7
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
      -- DECOMPILER ERROR at PC44: Confused about usage of register: R14 in 'UnsetPending'

      ;
      (self._buttonKey)[index] = (string.gsub)((self._buttonKey)[index], command, "", 1)
      PaGlobal_ConsoleKeyFirstCombo:showCommand(index, command, weaponType)
      isFind = true
    end
  end
  return isFind
end

-- DECOMPILER ERROR at PC159: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyFirstCombo.showCommand = function(self, index, command, weaponType)
  -- function num : 0_8
  if command == "LT" then
    PaGlobal_ConsoleKeyFirstCombo:setPosCommand(index, ((self._slots)[index])._LT, 0, weaponType)
  else
    if command == "RT" then
      PaGlobal_ConsoleKeyFirstCombo:setPosCommand(index, ((self._slots)[index])._RT, 0, weaponType)
    else
      if command == "LB" then
        PaGlobal_ConsoleKeyFirstCombo:setPosCommand(index, ((self._slots)[index])._LB, 0, weaponType)
      else
        if command == "RB" then
          PaGlobal_ConsoleKeyFirstCombo:setPosCommand(index, ((self._slots)[index])._RB, 0, weaponType)
        else
          if command == "FRONT" then
            PaGlobal_ConsoleKeyFirstCombo:setPosCommand(index, ((self._slots)[index])._AnalogUp, 0, weaponType)
          else
            if command == "RIGHT" then
              PaGlobal_ConsoleKeyFirstCombo:setPosCommand(index, ((self._slots)[index])._AnalogRight, 0, weaponType)
            else
              if command == "BACK" then
                PaGlobal_ConsoleKeyFirstCombo:setPosCommand(index, ((self._slots)[index])._AnalogDown, 0, weaponType)
              else
                if command == "LEFT" then
                  PaGlobal_ConsoleKeyFirstCombo:setPosCommand(index, ((self._slots)[index])._AnalogLeft, 0, weaponType)
                else
                  if command == "X" then
                    PaGlobal_ConsoleKeyFirstCombo:setPosCommand(index, ((self._slots)[index])._x, 1, weaponType)
                  else
                    if command == "Y" then
                      PaGlobal_ConsoleKeyFirstCombo:setPosCommand(index, ((self._slots)[index])._y, 2, weaponType)
                    else
                      if command == "A" then
                        PaGlobal_ConsoleKeyFirstCombo:setPosCommand(index, ((self._slots)[index])._a, 3, weaponType)
                      else
                        if command == "B" then
                          PaGlobal_ConsoleKeyFirstCombo:setPosCommand(index, ((self._slots)[index])._b, 4, weaponType)
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

-- DECOMPILER ERROR at PC162: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyFirstCombo.setPosCommand = function(self, skillIndex, control, posIndex, weaponType)
  -- function num : 0_9
  control:SetShow(true)
  control:SetPosX(10 + 50 * (self._buttonIndex + 1))
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._showSkillData)[self._showControlIndex] = control
  self._showSkillIndex = skillIndex
  self._showControlIndex = self._showControlIndex + 1
end

-- DECOMPILER ERROR at PC165: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleKeyFirstCombo.firstSkillListUpdate = function(self, weaponType)
  -- function num : 0_10
  PaGlobal_ConsoleKeyFirstCombo:update(weaponType)
end

FromClient_consoleFirstKeyList = function()
  -- function num : 0_11 , upvalues : isAbleConsolePadGroup
  if isAbleConsolePadGroup == false then
    return 
  end
end

PaGlobal_ConsoleKeyFirstCombo:initialize()

