Panel_Window_PetInfo_Renew:SetShow(false)
Panel_Window_PetInfo_Renew:ignorePadSnapMoveToOtherPanel()
local petInfo = {
  _ui = {
    _static_subFrameBG = UI.getChildControl(Panel_Window_PetInfo_Renew, "Static_SubFrameBG"),
    _petInfoFrame = {
      _radioBtn_Skills = Array.new(),
      _radioBtn_Actions = Array.new()
    },
    _static_skillTooltip = UI.getChildControl(Panel_Window_PetInfo_Renew, "Static_SubSkillTooltip"),
    _skillTooltip = {}
  },
  _config = {
    _skillType_Default = 0,
    _skillType_Special = 1,
    _skillType_Max = 2,
    _skill_MaxCount = 5,
    _action_MaxCount = 10,
    _skillBtn = {
      _startX = 30,
      _startY = 240,
      _gapX = 80
    },
    _actionBtn = {
      _startX = 30,
      _startY = 370,
      _gapX = 80,
      _gapY = 80,
      _action_lineMaxCount = 5
    }
  },
  _petNo = 0,
  _currentPetLv = {}
}
function petInfo:initialize()
  self:initControl()
  self:createButton()
  self:setPosition()
end
function petInfo:oepn()
end
function petInfo:close()
  if Panel_Window_PetInfo_Renew:GetShow() then
    Panel_Window_PetInfo_Renew:SetShow(false)
  end
  local Panel_Tooltip = self._ui._static_skillTooltip
  if Panel_Tooltip:GetShow() then
    Panel_Tooltip:SetShow(false)
  end
  PaGlobalFunc_Petlist_TemporaryOpen()
end
function petInfo:update()
  local PcPetData
  local petCount = 0
  local isSet = false
  petCount = ToClient_getPetUnsealedList()
  for index = 0, petCount - 1 do
    PcPetData = ToClient_getPetUnsealedDataByIndex(index)
    if nil ~= PcPetData and self._petNo == PcPetData:getPcPetNo() then
      isSet = true
      break
    end
  end
  if false == isSet then
    return
  end
  local petStaticStatus = PcPetData:getPetStaticStatus()
  local petName = PcPetData:getName()
  local petNum_s64 = PcPetData:getPcPetNo()
  local petNum_S32 = Int64toInt32(petNum_s64)
  local petLevel = PcPetData:getLevel()
  local iconPath = PcPetData:getIconPath()
  local petTier = petStaticStatus:getPetTier() + 1
  for idx = 0, self._config._skillType_Max - 1 do
    self:setSkillInfoByType(PcPetData, idx)
  end
  local actionMaxCount = ToClient_getPetActionMax()
  local actionBtn = self._ui._petInfoFrame._radioBtn_Actions
  local uiIdx = 0
  for idx = 0, actionMaxCount - 1 do
    actionBtn[idx]._button:SetShow(false)
    local actionStaticStatus = ToClient_getPetActionStaticStatus(idx)
    local isLearn = PcPetData:isPetActionLearned(idx)
    if true == isLearn then
      actionBtn[uiIdx]._button:SetShow(true)
      actionBtn[uiIdx]._slot:ChangeTextureInfoNameAsync("Icon/" .. actionStaticStatus:getIconPath())
      actionBtn[uiIdx]._slot:SetShow(true)
      uiIdx = uiIdx + 1
    end
  end
  local skillBtn = self._ui._petInfoFrame._radioBtn_Skills
  for idx = 0, self._config._skill_MaxCount - 1 do
    skillBtn[idx]._slot:SetShow(false)
  end
  uiIdx = 0
  local baseSkillIndex = PcPetData:getPetBaseSkillIndex()
  local skillStaticStatus = ToClient_getPetBaseSkillStaticStatus(baseSkillIndex)
  if nil ~= skillStaticStatus then
    local skillTypeStaticWrapper = skillStaticStatus:getSkillTypeStaticStatusWrapper()
    if nil ~= skillTypeStaticWrapper then
      local skillNo = skillStaticStatus:getSkillNo()
      skillBtn[uiIdx]._slot:SetShow(true)
      skillBtn[uiIdx]._slot:addInputEvent("Mouse_On", "FGlobal_PetInfo_SkillTooltipOpen(" .. baseSkillIndex .. ", true, true)")
      skillBtn[uiIdx]._icon:ChangeTextureInfoNameAsync("Icon/" .. skillTypeStaticWrapper:getIconPath())
    end
  end
  uiIdx = uiIdx + 1
  local skillMaxCount = ToClient_getPetEquipSkillMax()
  for index = 0, skillMaxCount - 1 do
    local skillStaticStatus = ToClient_getPetEquipSkillStaticStatus(index)
    local isLearn = PcPetData:isPetEquipSkillLearned(index)
    if true == isLearn and nil ~= skillStaticStatus then
      local skillTypeStaticWrapper = skillStaticStatus:getSkillTypeStaticStatusWrapper()
      if nil ~= skillTypeStaticWrapper then
        local skillNo = skillStaticStatus:getSkillNo()
        skillBtn[uiIdx]._slot:SetShow(true)
        skillBtn[uiIdx]._slot:addInputEvent("Mouse_On", "FGlobal_PetInfo_SkillTooltipOpen(" .. index .. ",false, true)")
        skillBtn[uiIdx]._icon:ChangeTextureInfoNameAsync("Icon/" .. skillTypeStaticWrapper:getIconPath())
      end
      uiIdx = uiIdx + 1
      if uiIdx >= self._config._skill_MaxCount then
        break
      end
    end
  end
  local petExp_s64 = PcPetData:getExperience()
  local petExp_s32 = Int64toInt32(petExp_s64)
  local petMaxExp_s64 = PcPetData:getMaxExperience()
  local petMaxExp_s32 = Int64toInt32(petMaxExp_s64)
  local petExpPercent = petExp_s32 / petMaxExp_s32 * 100
  local petInfoUI = self._ui._petInfoFrame
  petInfoUI._static_petName:SetText(petName .. " (" .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANT_TIER", "tier", petTier) .. ")")
  petInfoUI._static_petIcon:ChangeTextureInfoNameAsync(iconPath)
  petInfoUI._static_petIconGenInfo:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANT_TIER", "tier", petTier))
  petInfoUI._progress_level:SetProgressRate(petExpPercent)
  petInfoUI._static_petLevel:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. petLevel)
  petInfoUI._static_petExp:SetText(string.format("%.1f", petExpPercent) .. "%")
  if nil == self._currentPetLv[petNum_S32] then
    self._currentPetLv[petNum_S32] = petLevel
  end
  if self._currentPetLv[petNum_S32] ~= petLevel then
    if petLevel > 1 and 1 < self._currentPetLv[petNum_S32] then
      Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PETINFO_PETLEVELUP_ACK", "petName", petName))
    end
    self._currentPetLv[petNum_S32] = petLevel
  end
end
function petInfo:perFrameUpdate()
end
function petInfo:changePlatformSpecKey()
end
function petInfo:setPosition()
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_Window_PetInfo_Renew:GetSizeX()
  local panelSizeY = Panel_Window_PetInfo_Renew:GetSizeY()
  Panel_Window_PetInfo_Renew:SetPosX(scrSizeX / 2 - panelSizeX / 2)
  Panel_Window_PetInfo_Renew:SetPosY(scrSizeY / 2 - panelSizeY / 2)
end
function petInfo:registEventHandler()
  registerEvent("FromClient_luaLoadComplete", "FromClient_PetInfo_luaLoadComplete")
end
function FromClient_PetInfo_luaLoadComplete()
  petInfo:initialize()
end
function petInfo:initControl()
  local petInfoUI = self._ui
  petInfoUI._petInfoFrame._static_petName = UI.getChildControl(petInfoUI._static_subFrameBG, "StaticText_PetName")
  petInfoUI._petInfoFrame._static_petIconSlot = UI.getChildControl(petInfoUI._static_subFrameBG, "Static_PetIconSlot")
  petInfoUI._petInfoFrame._static_petIcon = UI.getChildControl(petInfoUI._petInfoFrame._static_petIconSlot, "Static_PetIcon")
  petInfoUI._petInfoFrame._static_petIconGenInfo = UI.getChildControl(petInfoUI._petInfoFrame._static_petIconSlot, "StaticText_Gen")
  petInfoUI._petInfoFrame._static_specialSkill = UI.getChildControl(petInfoUI._static_subFrameBG, "StaticText_SpecialSkill")
  petInfoUI._petInfoFrame._static_defaultSkill = UI.getChildControl(petInfoUI._static_subFrameBG, "StaticText_DefaultSkill")
  petInfoUI._petInfoFrame._static_petLevel = UI.getChildControl(petInfoUI._static_subFrameBG, "StaticText_Level")
  petInfoUI._petInfoFrame._static_petExp = UI.getChildControl(petInfoUI._static_subFrameBG, "StaticText_Exp")
  petInfoUI._petInfoFrame._progress_level = UI.getChildControl(petInfoUI._static_subFrameBG, "Progress2_Level")
  petInfoUI._petInfoFrame._static_petSkill = UI.getChildControl(petInfoUI._static_subFrameBG, "StaticText_Skill")
  petInfoUI._petInfoFrame._static_petAction = UI.getChildControl(petInfoUI._static_subFrameBG, "StaticText_Behavior")
  petInfoUI._static_skillTooltip:SetShow(false)
  petInfoUI._static_skillTooltip._static_skillIconSlot = UI.getChildControl(petInfoUI._static_skillTooltip, "Static_PetIconSlot")
  petInfoUI._static_skillTooltip._static_skillIcon = UI.getChildControl(petInfoUI._static_skillTooltip._static_skillIconSlot, "Static_PetIcon")
  petInfoUI._static_skillTooltip._static_skillName = UI.getChildControl(petInfoUI._static_skillTooltip, "StaticText_SkillTooltipName")
  petInfoUI._static_skillTooltip._static_skillDesc = UI.getChildControl(petInfoUI._static_skillTooltip, "StaticText_SkillTooltipDesc")
  local UCT = CppEnums.PA_UI_CONTROL_TYPE
  local BottonBG = UI.getChildControl(Panel_Window_PetInfo_Renew, "Static_BottomKeyBG")
  local StaticClose = UI.getChildControl(BottonBG, "StaticText_Close_ConsoleUI")
  petInfoUI._petInfoFrame._ExitButton = UI.createControl(UCT.PA_UI_CONTROL_RADIOBUTTON, BottonBG, "ExitButton")
  CopyBaseProperty(StaticClose, petInfoUI._petInfoFrame._ExitButton)
  petInfoUI._petInfoFrame._ExitButton:addInputEvent("Mouse_LUp", "FGlobal_PetInfo_Close()")
end
function petInfo:createButton()
  local UCT = CppEnums.PA_UI_CONTROL_TYPE
  local petInfoFrame = self._ui._static_subFrameBG
  local _skillBtn = UI.getChildControl(petInfoFrame, "RadioButton_SkillBG")
  local _skillSlot = UI.getChildControl(_skillBtn, "Static_SkillSlot")
  local _actionBtn = UI.getChildControl(petInfoFrame, "RadioButton_BehaviorBG")
  local _actionSlot = UI.getChildControl(_actionBtn, "Static_BehaviorSlot")
  _skillBtn:SetShow(false)
  _actionBtn:SetShow(false)
  local skillBtn = self._ui._petInfoFrame._radioBtn_Skills
  local actionBtn = self._ui._petInfoFrame._radioBtn_Actions
  for idx = 0, self._config._skill_MaxCount - 1 do
    local info = {}
    info._slot = UI.cloneControl(_skillBtn, petInfoFrame, "SkillSlot_" .. idx)
    info._slot:SetIgnore(false)
    info._icon = UI.getChildControl(info._slot, "Static_SkillSlot")
    info._icon:ActiveMouseEventEffect(true)
    local slotConfig = self._config._skillBtn
    info._slot:SetPosX(slotConfig._startX + slotConfig._gapX * idx)
    info._slot:SetPosY(slotConfig._startY)
    skillBtn[idx] = info
  end
  for idx = 0, self._config._action_MaxCount - 1 do
    local info = {}
    info._button = UI.createControl(UCT.PA_UI_CONTROL_RADIOBUTTON, petInfoFrame, "actionBtn_" .. idx)
    CopyBaseProperty(_actionBtn, info._button)
    info._slot = UI.createControl(UCT.PA_UI_CONTROL_STATIC, info._button, "actionSlot_" .. idx)
    CopyBaseProperty(_actionSlot, info._slot)
    local slotConfig = self._config._actionBtn
    info._button:SetPosX(slotConfig._startX + slotConfig._gapX * (idx % slotConfig._action_lineMaxCount))
    info._button:SetPosY(slotConfig._startY + slotConfig._gapY * math.floor(idx / slotConfig._action_lineMaxCount))
    actionBtn[idx] = info
  end
end
function petInfo:setSkillInfoByType(PcPetData, skillNo)
  local paramText = FGlobal_SetPetSkillTextByType(PcPetData, skillNo)
  if self._config._skillType_Default == skillNo then
    self._ui._petInfoFrame._static_defaultSkill:SetShow(true)
    self._ui._petInfoFrame._static_defaultSkill:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PETINFO_BASESKILL", "paramText", paramText))
  elseif self._config._skillType_Special == skillNo then
    self._ui._petInfoFrame._static_specialSkill:SetShow(true)
    self._ui._petInfoFrame._static_specialSkill:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PETINFO_SPECIALSKILL", "paramText", paramText))
  end
end
function petInfo:setToolTipInfo(SkillIndex, isBase, isShow)
  local Panel_Tooltip = self._ui._static_skillTooltip
  if isShow ~= Panel_Tooltip:GetShow() then
    Panel_Tooltip:SetShow(isShow)
  end
  if false == isShow then
    return
  end
  audioPostEvent_SystemUi(1, 13)
  local skillStaticStatus
  if true == isBase then
    skillStaticStatus = ToClient_getPetBaseSkillStaticStatus(SkillIndex)
  else
    skillStaticStatus = ToClient_getPetEquipSkillStaticStatus(SkillIndex)
  end
  if nil == skillStaticStatus then
    return
  end
  local petSkillNo = skillStaticStatus:getSkillNo()
  local skillTypeStaticWrapper = skillStaticStatus:getSkillTypeStaticStatusWrapper()
  if nil ~= skillTypeStaticWrapper then
    Panel_Tooltip._static_skillIcon:ChangeTextureInfoNameAsync("icon/" .. skillTypeStaticWrapper:getIconPath())
    Panel_Tooltip._static_skillIconSlot:SetShow(true)
    Panel_Tooltip._static_skillName:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
    Panel_Tooltip._static_skillName:SetAutoResize(true)
    Panel_Tooltip._static_skillName:SetShow(true)
    Panel_Tooltip._static_skillName:SetText(skillTypeStaticWrapper:getName())
    Panel_Tooltip._static_skillDesc:SetText(skillTypeStaticWrapper:getDescription())
    Panel_Tooltip._static_skillDesc:SetPosY(Panel_Tooltip._static_skillName:GetTextSizeY() + 30)
    local SizeY = Panel_Tooltip._static_skillName:GetTextSizeY() + Panel_Tooltip._static_skillDesc:GetTextSizeY() + 50
    Panel_Tooltip:SetSize(Panel_Tooltip:GetSizeX(), SizeY)
  else
    Panel_Tooltip._static_skillIconSlot:SetShow(false)
    Panel_Tooltip._static_skillName:SetShow(false)
    Panel_Tooltip._static_skillDesc:SetShow(false)
  end
end
function FGlobal_PetInfo_SkillTooltipOpen(SkillIndex, isBase, isShow)
  petInfo:setToolTipInfo(SkillIndex, isBase, isShow)
end
function FGlobal_PetInfo_Open(petNo)
  petInfo._petNo = tonumber64(petNo)
  petInfo:setPosition()
  petInfo:update()
  Panel_Window_PetInfo_Renew:SetShow(true)
end
function FGlobal_PetInfo_Close()
  petInfo:close()
end
function FGlobal_SetPetSkillTextByType(PcPetData, skillNo)
  local skillParam = PcPetData:getSkillParam(skillNo)
  local paramText = ""
  if CppEnums.PetSkillType.Looting == skillParam._type then
    local petLootingType = PcPetData:getPetLootingType()
    local variableCount = skillParam:getParam(0)
    if CppEnums.PetLootingType.Precision == petLootingType then
      variableCount = variableCount + variableCount * (CppDefine.e1Percent * 10 / CppDefine.e100Percent)
    elseif CppEnums.PetLootingType.Celerity == petLootingType then
      variableCount = variableCount - variableCount * (CppDefine.e1Percent * 10 / CppDefine.e100Percent)
    end
    paramText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_ITEMGETTIME", "itemGetTime", string.format("%.1f", variableCount / 1000))
  elseif CppEnums.PetSkillType.AlertCollect == skillParam._type then
    paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_FINDGATHER")
  elseif CppEnums.PetSkillType.AlertMurderer == skillParam._type then
    paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_FINDPK")
  elseif CppEnums.PetSkillType.DetectPosition == skillParam._type then
    paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_FINDPLACE")
  elseif CppEnums.PetSkillType.Aggro == skillParam._type then
    paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_MOBAGGRO")
  elseif CppEnums.PetSkillType.FindNamedMonster == skillParam._type then
    paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_FINDRAREMONSTER")
  elseif CppEnums.PetSkillType.ReduceAutoFishingTime == skillParam._type then
    paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_REDUCEAUTOFISHINGTIME")
  elseif CppEnums.PetSkillType.RegistForRegionSkill == skillParam._type then
    paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_REGISTILL")
  elseif CppEnums.PetSkillType.Collecting == skillParam._type then
    paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_AUTOGETHERING")
  elseif CppEnums.PetSkillType.CollectingBoost == skillParam._type then
    paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_GETHERINGINCREASE")
  else
    return nil
  end
  return paramText
end
petInfo:registEventHandler()
