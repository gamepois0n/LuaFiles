-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\skillcommand\ui_widget_skillcommand.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_classType = CppEnums.ClassType
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local IM = CppEnums.EProcessorInputMode
local UIMode = Defines.UIMode
Panel_SkillCommand:setMaskingChild(true)
Panel_SkillCommand:ActiveMouseEventEffect(true)
Panel_SkillCommand:setGlassBackground(true)
Panel_SkillCommand:RegisterShowEventFunc(true, "Panel_SkkillCommand_ShowAni()")
Panel_SkillCommand:RegisterShowEventFunc(false, "Panel_SkkillCommand_HideAni()")
local skillCommand = {
_config = {
pos = {gapY = 35, startX = 0, startY = 0}
}
, 
_copyCommand = {}
, _slots = (Array.new)(), 
skilldatatable = {}
, skillCount = 0, lvupSkillCount = 0, recommandSkillCount = 0, 
skillCommand = {}
, 
skillCommandControl = {}
, skillCommandCount = 0, elapsedTime = 0, 
skillCommandIndex = {}
, 
skillCommandShowkeep = {}
, color = (Defines.Color).C_FF444444, viewableMaxSkillCount = 11, skillNameSizeX = 0, isLevelUp = false, sizeUpCount = 0}
Panel_SkkillCommand_ShowAni = function()
  -- function num : 0_0
end

Panel_SkkillCommand_HideAni = function()
  -- function num : 0_1
end

skillCommand.Init = function(self)
  -- function num : 0_2
  for i = 0, self.viewableMaxSkillCount - 1 do
    local slot = {}
    slot._mainBG = (UI.createAndCopyBasePropertyControl)(Panel_SkillCommand, "Static_C_SkillBG", Panel_SkillCommand, "skillCommand_mainBG_" .. i)
    slot._blueBG = (UI.createAndCopyBasePropertyControl)(Panel_SkillCommand, "Static_C_SkillBlueBG", slot._mainBG, "skillCommand_blueBG_" .. i)
    slot._skillIcon = (UI.createAndCopyBasePropertyControl)(Panel_SkillCommand, "Static_C_SkillIcon", slot._mainBG, "skillCommand_skillIcon_" .. i)
    slot._skillName = (UI.createAndCopyBasePropertyControl)(Panel_SkillCommand, "StaticText_C_SkillName", slot._mainBG, "skillCommand_skillName_" .. i)
    slot._skillCommandBody = (UI.createAndCopyBasePropertyControl)(Panel_SkillCommand, "Static_SkillCommandBody", slot._mainBG, "skillCommand_skillCommandBody_" .. i)
    slot._skillCommand = (UI.createAndCopyBasePropertyControl)(Panel_SkillCommand, "StaticText_C_SkillCommand", slot._mainBG, "skillCommand_skillCommand_" .. i)
    ;
    (slot._mainBG):SetShow(false)
    ;
    (slot._blueBG):SetShow(false)
    ;
    (slot._skillIcon):SetShow(false)
    ;
    (slot._skillName):SetShow(false)
    ;
    (slot._skillCommandBody):SetShow(false)
    ;
    (slot._skillCommand):SetShow(false)
    ;
    (slot._mainBG):addInputEvent("Mouse_LUp", "SkillCommand_Click(" .. i .. ")")
    -- DECOMPILER ERROR at PC99: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._slots)[i] = slot
  end
  Panel_SkillCommand:SetSize(300, 250)
end

skillCommand.Open = function(self)
  -- function num : 0_3 , upvalues : skillCommand
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  if (selfPlayer:get()):getLevel() < 7 then
    return 
  end
  if self.skillCount == 0 then
    return 
  end
  for i = 0, self.skillCount - 1 do
    local slot = (self._slots)[i]
    local slotConfig = (self._config).pos
    ;
    (slot._mainBG):SetShow(true)
    ;
    (slot._skillIcon):SetShow(true)
    ;
    (slot._skillName):SetShow(true)
    ;
    (slot._skillCommandBody):SetShow(true)
    ;
    (slot._blueBG):SetShow(false)
  end
  self.sizeUpCount = 0
  skillCommand:SetSkill()
  Panel_SkillCommand:SetShow(true)
end

FromClient_SkillCommandList = function(skillNo)
  -- function num : 0_4 , upvalues : skillCommand
  local self = skillCommand
  if #self.skilldatatable > 0 then
    local skillCheck = false
    for index = 1, #self.skilldatatable do
      if (self.skilldatatable)[index] == skillNo then
        skillCheck = true
      end
    end
    if not skillCheck then
      (table.insert)(self.skilldatatable, skillNo)
      self.recommandSkillCount = self.recommandSkillCount + 1
    end
  else
    do
      ;
      (table.insert)(self.skilldatatable, skillNo)
      self.recommandSkillCount = self.recommandSkillCount + 1
      -- DECOMPILER ERROR at PC41: Confused about usage of register: R2 in 'UnsetPending'

      ;
      (self.skillCommandShowkeep)[self.lvupSkillCount + self.recommandSkillCount - 1] = false
      self.elapsedTime = 0
    end
  end
end

FromClient_SkillCommandListonLevelUp = function(skillNo)
  -- function num : 0_5 , upvalues : skillCommand
  local self = skillCommand
  if #self.skilldatatable > 0 then
    local skillCheck = false
    for index = 1, #self.skilldatatable do
      if (self.skilldatatable)[index] == skillNo then
        skillCheck = true
      end
    end
    if not skillCheck then
      (table.insert)(self.skilldatatable, skillNo)
      self.lvupSkillCount = self.lvupSkillCount + 1
    end
  else
    do
      ;
      (table.insert)(self.skilldatatable, skillNo)
      self.lvupSkillCount = self.lvupSkillCount + 1
      -- DECOMPILER ERROR at PC39: Confused about usage of register: R2 in 'UnsetPending'

      ;
      (self.skillCommandShowkeep)[self.lvupSkillCount - 1] = true
      self.elapsedTime = 0
    end
  end
end

FromClient_CheckLevelUpforSkillCommand = function()
  -- function num : 0_6 , upvalues : skillCommand
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  skillCommand.lvupSkillCount = 0
  SkillCommand_Reset()
end

FromClient_SkillCommandDataSet = function()
  -- function num : 0_7 , upvalues : skillCommand
  SkillCommand_Reset()
  if getSelfPlayer() == nil then
    return 
  end
  local pcPosition = ((getSelfPlayer()):get()):getPosition()
  local regionInfo = getRegionInfoByPosition(pcPosition)
  if (regionInfo:get()):isSafeZone() then
    return 
  end
  ToClient_RequestCommandList()
  local self = skillCommand
  self.skillCount = self.recommandSkillCount + self.lvupSkillCount
  if self.skillCount == 0 then
    return 
  end
  if isChecked_SkillCommand then
    self:Open()
  end
  self.lvupSkillCount = 0
end

skillCommand.SetSkill = function(self)
  -- function num : 0_8 , upvalues : skillCommand
  for i = 0, self.skillCount - 1 do
    local skillWrapper = getSkillCommandStatus((self.skilldatatable)[i + 1])
    local iconPath = skillWrapper:getIconPath()
    local name = skillWrapper:getName()
    local slot = (self._slots)[i]
    ;
    (slot._skillIcon):ChangeTextureInfoName("Icon/" .. iconPath)
    ;
    (slot._skillName):SetText(name)
    self.skillNameSizeX = (math.max)(self.skillNameSizeX, (slot._skillName):GetPosX() + (slot._skillName):GetTextSizeX())
  end
  local maxBgSizeX = 0
  for i = 0, self.skillCount - 1 do
    local skillWrapper = getSkillCommandStatus((self.skilldatatable)[i + 1])
    local command = skillWrapper:getCommand()
    local slot = (self._slots)[i]
    -- DECOMPILER ERROR at PC55: Confused about usage of register: R9 in 'UnsetPending'

    ;
    (self.skillCommand)[i] = 0
    -- DECOMPILER ERROR at PC58: Confused about usage of register: R9 in 'UnsetPending'

    ;
    (self.skillCommandControl)[i] = {}
    command = SkillCommand_SearchCommand(command, i, (self.skilldatatable)[i + 1])
    ;
    (slot._skillCommandBody):SetPosX(self.skillNameSizeX)
    ;
    (((self._slots)[i])._mainBG):SetPosY(0 + (i + self.sizeUpCount) * 30 + i * 2)
    if Panel_SkillCommand:GetSizeX() < (slot._skillCommandBody):GetPosX() + (slot._skillCommandBody):GetSizeX() then
      skillCommand:CommandControl_RePos(i)
      ;
      (slot._skillIcon):SetPosY(17)
      ;
      (slot._skillName):SetPosY(15)
      self.sizeUpCount = self.sizeUpCount + 1
    else
      ;
      (slot._skillIcon):SetPosY(2)
      ;
      (slot._skillName):SetPosY(0)
    end
    maxBgSizeX = (math.max)(maxBgSizeX, self.skillNameSizeX + (slot._skillCommandBody):GetSizeX())
  end
  for i = 0, self.skillCount - 1 do
    local slot = (self._slots)[i]
    ;
    (slot._mainBG):SetSize(maxBgSizeX, (slot._skillCommandBody):GetSizeY())
    ;
    (slot._blueBG):SetSize(maxBgSizeX, (slot._skillCommandBody):GetSizeY())
  end
  for i = 0, self.skillCount - 1 do
    if (self.skillCommandShowkeep)[i] then
      (((self._slots)[i])._blueBG):SetShow(true)
    end
  end
end

skillCommand.CommandControl_RePos = function(self, index)
  -- function num : 0_9
  local slot = (self._slots)[index]
  local basePosX = (slot._skillCommandBody):GetPosX()
  local tempPosX = 5
  for controlCountIndex = 0, #(self.skillCommandControl)[index] do
    local controlPos = (((self.skillCommandControl)[index])[controlCountIndex]):GetPosX() + (((self.skillCommandControl)[index])[controlCountIndex]):GetSizeX() + basePosX
    if Panel_SkillCommand:GetSizeX() < controlPos then
      (((self.skillCommandControl)[index])[controlCountIndex]):SetPosX(tempPosX)
      ;
      (((self.skillCommandControl)[index])[controlCountIndex]):SetPosY((((self.skillCommandControl)[index])[controlCountIndex]):GetPosY() + 30)
      tempPosX = tempPosX + (((self.skillCommandControl)[index])[controlCountIndex]):GetSizeX() + 5
    end
  end
  ;
  (slot._skillCommandBody):SetSize(Panel_SkillCommand:GetSizeX() - (slot._skillCommandBody):GetPosX(), 60)
end

SkillCommand_StringMatchForConvert = function(commandIndex, stringIndex, plusIndex)
  -- function num : 0_10
  local returnValue = nil
  if commandIndex ~= nil then
    returnValue = 0
    if stringIndex ~= nil then
      if stringIndex < commandIndex then
        returnValue = 1
      end
      if plusIndex ~= nil and plusIndex < (math.min)(commandIndex, stringIndex) then
        returnValue = 2
      end
    else
      if plusIndex ~= nil and plusIndex < commandIndex then
        returnValue = 2
      end
    end
  else
    if stringIndex ~= nil then
      returnValue = 1
      if plusIndex ~= nil and plusIndex < stringIndex then
        returnValue = 2
      end
    else
      if plusIndex ~= nil then
        returnValue = 2
      end
    end
  end
  return returnValue
end

skillCommand.commandControlSet = function(self, controlType, text, uiIndex)
  -- function num : 0_11
  local tempControl = nil
  if controlType == 0 then
    if text == "LB" then
      tempControl = (UI.createAndCopyBasePropertyControl)(Panel_SkillCommand, "Static_CommandLMouse", ((self._slots)[uiIndex])._skillCommandBody, "Static_CommandLMouse_" .. uiIndex .. "_" .. (self.skillCommand)[uiIndex])
    else
      if text == "RB" then
        tempControl = (UI.createAndCopyBasePropertyControl)(Panel_SkillCommand, "Static_CommandRMouse", ((self._slots)[uiIndex])._skillCommandBody, "Static_CommandRMouse_" .. uiIndex .. "_" .. (self.skillCommand)[uiIndex])
      else
        tempControl = (UI.createAndCopyBasePropertyControl)(Panel_SkillCommand, "StaticText_CommandBg", ((self._slots)[uiIndex])._skillCommandBody, "StaticText_CommandBG_" .. uiIndex .. "_" .. (self.skillCommand)[uiIndex])
        tempControl:SetText(text)
        tempControl:SetSize(tempControl:GetTextSizeX() + 10, tempControl:GetSizeY())
        tempControl:SetPosY(2)
      end
    end
  else
    if controlType == 1 then
      tempControl = (UI.createAndCopyBasePropertyControl)(Panel_SkillCommand, "StaticText_Command", ((self._slots)[uiIndex])._skillCommandBody, "StaticText_Command_" .. uiIndex .. "_" .. (self.skillCommand)[uiIndex])
      tempControl:SetText(text)
      tempControl:SetSize(tempControl:GetTextSizeX() + 10, tempControl:GetSizeY())
    else
      if controlType == 2 then
        tempControl = (UI.createAndCopyBasePropertyControl)(Panel_SkillCommand, "Static_CommandPlus", ((self._slots)[uiIndex])._skillCommandBody, "Static_CommandPlus_" .. uiIndex .. "_" .. (self.skillCommand)[uiIndex])
        tempControl:SetPosY(6)
      end
    end
  end
  tempControl:SetShow(true)
  local tempPosX = (((self._slots)[uiIndex])._skillCommandBody):GetSizeX()
  tempControl:SetPosX(tempPosX)
  ;
  (((self._slots)[uiIndex])._skillCommandBody):SetSize(tempPosX + tempControl:GetSizeX() + 5, (((self._slots)[uiIndex])._skillCommandBody):GetSizeY())
  -- DECOMPILER ERROR at PC144: Confused about usage of register: R6 in 'UnsetPending'

  ;
  ((self.skillCommandControl)[uiIndex])[(self.skillCommand)[uiIndex]] = tempControl
  -- DECOMPILER ERROR at PC149: Confused about usage of register: R6 in 'UnsetPending'

  ;
  (self.skillCommand)[uiIndex] = (self.skillCommand)[uiIndex] + 1
end

SkillCommand_SearchCommand = function(command, index, skillNo)
  -- function num : 0_12 , upvalues : skillCommand
  local self = skillCommand
  local commandIndex = (string.find)(command, "<")
  local stringIndex = (string.find)(command, "[%[]")
  local plusIndex = (string.find)(command, "+")
  local swapIndex = SkillCommand_StringMatchForConvert(commandIndex, stringIndex, plusIndex)
  if swapIndex == 0 then
    local text = (string.sub)(command, commandIndex + 1, (string.find)(command, ">") - 1)
    self:commandControlSet(0, text, index)
    command = (string.gsub)(command, "<" .. text .. ">", "", 1)
  else
    do
      if swapIndex == 1 then
        local text = (string.sub)(command, stringIndex + 1, (string.find)(command, "[%]]") - 1)
        self:commandControlSet(1, text, index)
        command = (string.gsub)(command, "[%[]" .. text .. "[%]]", "", 1)
      else
        do
          if swapIndex == 2 then
            local text = (string.sub)(command, plusIndex, plusIndex)
            self:commandControlSet(2, text, index)
            command = (string.gsub)(command, "+", "", 1)
          else
            do
              do return  end
              command = SkillCommand_SearchCommand(command, index, skillNo)
            end
          end
        end
      end
    end
  end
end

SkillCommand_UpdateTime = function(updateTime)
  -- function num : 0_13 , upvalues : skillCommand
  local self = skillCommand
  if not self.isLevelUp then
    return 
  end
  if self.skilldatatable == nil then
    SkillCommand_Reset()
    return 
  end
  self.elapsedTime = self.elapsedTime + updateTime
  if self.elapsedTime > 30 then
    self.lvupSkillCount = 0
    SkillCommand_Reset()
    FromClient_SkillCommandDataSet()
    self.elapsedTime = 0
    self.isLevelUp = false
    for i = 0, self.skillCount - 1 do
      (((self._slots)[i])._blueBG):SetShow(false)
    end
  end
end

SkillCommand_Reset = function()
  -- function num : 0_14 , upvalues : skillCommand
  local self = skillCommand
  if self.skillCount > 0 then
    for i = 0, self.skillCount - 1 do
      (((self._slots)[i])._mainBG):SetShow(false)
      ;
      (((self._slots)[i])._skillIcon):SetShow(false)
      ;
      (((self._slots)[i])._skillName):SetShow(false)
      ;
      (((self._slots)[i])._skillCommand):SetShow(false)
      ;
      (((self._slots)[i])._skillCommandBody):SetShow(false)
      ;
      (((self._slots)[i])._skillCommandBody):SetSize(5, 30)
      ;
      (table.remove)(self.skilldatatable, self.skillCount - i)
    end
    self.skilldatatable = {}
    for index = 0, self.skillCount - 1 do
      if (self.skillCommandControl)[index] ~= nil then
        for controlCountIndex = 0, #(self.skillCommandControl)[index] do
          (UI.deleteControl)(((self.skillCommandControl)[index])[controlCountIndex])
        end
      end
    end
  end
  do
    self.elapsedTime = 0
    self.skillCount = 0
    self.recommandSkillCount = 0
    self.skillCommand = {}
  end
end

SkillCommand_Click = function(index)
  -- function num : 0_15
  HandleMLUp_SkillWindow_OpenForLearn()
end

FGlobal_SkillCommand_ResetPosition = function()
  -- function num : 0_16
  local scrX = getScreenSizeX()
  local scrY = getScreenSizeY()
  if CppDefine.ChangeUIAndResolution == true then
    if Panel_SkillCommand:GetRelativePosX() == -1 and Panel_SkillCommand:GetRelativePosY() == 1 then
      local initPosX = scrX / 2 * 1.2
      local initPosY = scrY / 2 * 0.85
      Panel_SkillCommand:SetPosX(initPosX)
      Panel_SkillCommand:SetPosY(initPosY)
      changePositionBySever(Panel_SkillCommand, (CppEnums.PAGameUIType).PAGameUIPanel_SkillCommand, false, true, false)
      FGlobal_InitPanelRelativePos(Panel_SkillCommand, initPosX, initPosY)
    else
      do
        if Panel_SkillCommand:GetRelativePosX() == 0 and Panel_SkillCommand:GetRelativePosY() == 0 then
          Panel_SkillCommand:SetPosX(scrX / 2 * 1.2)
          Panel_SkillCommand:SetPosY(scrY / 2 * 0.85)
        else
          Panel_SkillCommand:SetPosX(scrX * Panel_SkillCommand:GetRelativePosX() - Panel_SkillCommand:GetSizeX() / 2)
          Panel_SkillCommand:SetPosY(scrY * Panel_SkillCommand:GetRelativePosY() - Panel_SkillCommand:GetSizeY() / 2)
        end
        Panel_SkillCommand:SetPosX(scrX / 2 * 1.2)
        Panel_SkillCommand:SetPosY(scrY / 2 * 0.85)
        changePositionBySever(Panel_SkillCommand, (CppEnums.PAGameUIType).PAGameUIPanel_SkillCommand, false, true, false)
        FGlobal_PanelRepostionbyScreenOut(Panel_SkillCommand)
      end
    end
  end
end

ScreenReisze_RePosCommand = function()
  -- function num : 0_17
  changePositionBySever(Panel_SkillCommand, (CppEnums.PAGameUIType).PAGameUIPanel_SkillCommand, false, true, false)
end

FromClient_RegionChange = function(regionData)
  -- function num : 0_18
  if regionData == nil then
    return 
  end
  if not isChecked_SkillCommand then
    return 
  end
  local isSaftyZone = (regionData:get()):isSafeZone()
  if not isSafeZone then
    FromClient_SkillCommandDataSet()
  end
end

FGlobal_SkillCommand_Show = function(isShow)
  -- function num : 0_19
  if isShow then
    FromClient_SkillCommandDataSet()
  end
end

SkillCommand_LimitLevelCheck = function()
  -- function num : 0_20 , upvalues : skillCommand
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  if not isChecked_SkillCommand then
    return 
  end
  if (selfPlayer:get()):getLevel() == 50 then
    setShowSkillCmd(false)
    isChecked_SkillCommand = false
    GameOption_UpdateOptionChanged()
    return 
  end
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R1 in 'UnsetPending'

  skillCommand.isLevelUp = true
  FromClient_SkillCommandDataSet()
end

SkillCommand_Effect = function(skillWrapper)
  -- function num : 0_21 , upvalues : skillCommand
  if not Panel_SkillCommand:GetShow() then
    return 
  end
  local self = skillCommand
  if skillWrapper ~= nil then
    local skillNo = skillWrapper:getSkillNo()
    for i = 0, self.skillCount - 1 do
      if skillNo == (self.skilldatatable)[i + 1] then
        (((self._slots)[i])._skillIcon):AddEffect("UI_ButtonLineRight_WhiteLong", false, 50, 0)
      end
    end
  end
end

skillCommand:Init()
Panel_SkillCommand:RegisterUpdateFunc("SkillCommand_UpdateTime")
registerEvent("FromClient_CheckLevelUpforSkillCommand", "FromClient_CheckLevelUpforSkillCommand")
registerEvent("FromClient_SkillCommandListonLevelUp", "FromClient_SkillCommandListonLevelUp")
registerEvent("EventSelfPlayerLevelUp", "SkillCommand_LimitLevelCheck")
registerEvent("FromClient_SkillCommandList", "FromClient_SkillCommandList")
registerEvent("onScreenResize", "FGlobal_SkillCommand_ResetPosition")
registerEvent("selfPlayer_regionChanged", "FromClient_RegionChange")
registerEvent("FromClient_RenderModeChangeState", "FGlobal_SkillCommand_ResetPosition")

