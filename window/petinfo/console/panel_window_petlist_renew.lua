Panel_Window_PetList_Renew:SetShow(false)
local petList = {
  _ui = {
    _static_MainTitleBar = UI.getChildControl(Panel_Window_PetList_Renew, "Static_MainTitleBar"),
    _static_BottomBG = UI.getChildControl(Panel_Window_PetList_Renew, "Static_BottomBG"),
    _static_AdjustSkillList = UI.getChildControl(Panel_Window_PetList_Renew, "Static_AdjustSkillList"),
    _list2_PetList = UI.getChildControl(Panel_Window_PetList_Renew, "List2_PetList"),
    _static_FocusBg = UI.getChildControl(Panel_Window_PetList_Renew, "Static_FocusBg_ConsoleUI")
  },
  _config = {
    _maxUnsealCount = ToClient_getPetUseMaxCount(),
    _maxPercentage = ToClient_MaxPetSkillRate() / 10000,
    _maxGrade = 5,
    _maxskillTypeCount = 15,
    _defaultSkillIndex = 1,
    _baseSkillTypeString = {
      [1] = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_BASESKILLTYPE1"),
      [2] = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_BASESKILLTYPE2"),
      [3] = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_BASESKILLTYPE3"),
      [4] = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_BASESKILLTYPE4"),
      [5] = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_BASESKILLTYPE5"),
      [6] = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_BASESKILLTYPE6"),
      [7] = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_BASESKILLTYPE7"),
      [8] = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_BASESKILLTYPE8"),
      [9] = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_BASESKILLTYPE9"),
      [10] = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_BASESKILLTYPE10"),
      [11] = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_BASESKILLTYPE11"),
      [12] = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_BASESKILLTYPE12")
    },
    _skillTypeString = {
      [0] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_0"),
      [1] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_1"),
      [2] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_2"),
      [3] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_3"),
      [4] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_4"),
      [5] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_5"),
      [6] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_6"),
      [7] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_7"),
      [8] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_8"),
      [9] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_9"),
      [10] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_10"),
      [11] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_11"),
      [12] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_12"),
      [13] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_13"),
      [14] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_14")
    },
    _baseSkillTypeUnit = {
      [1] = "",
      [2] = "",
      [3] = "%",
      [4] = "%",
      [5] = "%",
      [6] = "%",
      [7] = "%",
      [8] = "%",
      [9] = "%",
      [10] = "%",
      [11] = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_BASESKILLTYPEUNIT_SECOND"),
      [12] = "LT"
    },
    _baseSkillMultiplePoint = {
      [1] = 25,
      [2] = 10,
      [3] = 1,
      [4] = 1,
      [5] = 1,
      [6] = 1,
      [7] = 1,
      [8] = 1,
      [9] = 5,
      [10] = 1,
      [11] = 5,
      [12] = 10
    },
    _plusPoint = {
      [0] = 7,
      [1] = 5,
      [2] = 3,
      [4] = 4
    },
    _PetInfoFrame = {_startX = 15, _startY = 10},
    _SpecailPetRace = 99
  },
  selectPetNo,
  selectPetIndex,
  unsealPetCount,
  sealPetCount,
  sealPetDataList = {},
  unsealPetDataList = {},
  petCommandCondition = {},
  skillInfo = {
    plusCount = {},
    skillTypeCount = {}
  }
}
function petList:initialize()
  self:initControl()
  self:setPosition()
  self.selectPetNo = -1
  self.selectPetIndex = -1
  Panel_Window_PetList_Renew:SetShow(false)
end
function petList:open()
  Panel_Window_PetList_Renew:SetShow(true)
  self:setPosition()
  self:setPetList()
  self:initSkillFrame()
  self:setSkillFrame()
end
function petList:close()
  self.selectPetNo = -1
  self.selectPetIndex = -1
  self._ui._static_FocusBg:SetShow(false)
  Panel_Window_PetList_Renew:SetShow(false)
end
function petList:openFunctionPopup(petIndex, petNo, isSealPet, isSpecialPet)
  local petListUI = self._ui
  self.selectPetNo = petNo
  self.selectPetIndex = petIndex
  petListUI._static_FocusBg:SetShow(true)
  petListUI._button_Seal:SetShow(not isSealPet)
  petListUI._button_Seal:SetCheck(false)
  petListUI._button_Feed:SetShow(not isSealPet)
  petListUI._button_Feed:SetCheck(false)
  petListUI._button_ShowInfo:SetShow(not isSealPet)
  petListUI._button_ShowInfo:SetCheck(false)
  petListUI._button_Order:SetShow(not isSealPet)
  petListUI._button_Order:SetCheck(false)
  petListUI._button_Compose:SetShow(isSealPet)
  petListUI._button_Compose:SetCheck(false)
  petListUI._button_Compose:SetMonoTone(isSpecialPet)
  petListUI._button_Compose:SetEnable(not isSpecialPet)
  petListUI._button_Unseal:SetShow(isSealPet)
  petListUI._button_Unseal:SetCheck(false)
end
function petList:closeFunctionPopup()
  self._ui._static_FocusBg:SetShow(false)
end
function petList:selectShowInfo()
  audioPostEvent_SystemUi(1, 40)
  FGlobal_PetInfo_Open(self.selectPetNo)
end
function petList:selectFeed()
  audioPostEvent_SystemUi(1, 40)
  FGlobal_PetFeedOpen(self.selectPetIndex)
end
function petList:selectSeal()
  audioPostEvent_SystemUi(1, 40)
  ToClient_requestPetSeal(self.selectPetNo)
  self:updateHungry()
  self:closeFunctionPopup()
  self:initSkillFrame()
  self:setSkillFrame()
end
function petList:selectCommand()
  audioPostEvent_SystemUi(1, 40)
  if nil == self.selectPetNo then
    return
  end
  for typeIndex = 0, PaGlobal_petCommandType._typeCount - 1 do
    FGlobal_PetList_setPetCondition(typeIndex, self.petCommandCondition[tostring(self.selectPetNo)][typeIndex])
  end
  FGlobal_PetCommand_Init(self.selectPetIndex)
end
function petList:selectUnseal()
  audioPostEvent_SystemUi(1, 40)
  if self._config._maxUnsealCount <= self.unsealPetCount then
    Proc_ShowMessage_Ack_WithOut_ChattingMessage(PAGetString(Defines.StringSheet_GAME, "LUA_UNABLE_SUMMON_PET"))
    return
  end
  ToClient_requestPetUnseal(self.selectPetNo)
  self:updateHungry()
  self:closeFunctionPopup()
  self:initSkillFrame()
  self:setSkillFrame()
end
function petList:selectCompose()
  audioPostEvent_SystemUi(1, 40)
  FGlobal_PetExchange_Open(self.selectPetNo)
end
function petList:setPosition()
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_Window_PetList_Renew:GetSizeX()
  local panelSizeY = Panel_Window_PetList_Renew:GetSizeY()
  Panel_Window_PetList_Renew:SetPosX(scrSizeX / 2 - panelSizeX / 2)
  Panel_Window_PetList_Renew:SetPosY(scrSizeY / 2 - panelSizeY / 2)
end
function petList:initControl()
  local petListUI = self._ui
  petListUI._static_TitleText = UI.getChildControl(Panel_Window_PetList_Renew, "Static_MainTitleBar")
  petListUI._list2_1_VerticalScroll = UI.getChildControl(petListUI._list2_PetList, "List2_1_VerticalScroll")
  petListUI._list2_1_HorizontalScroll = UI.getChildControl(petListUI._list2_PetList, "List2_1_HorizontalScroll")
  petListUI._button_Feed = UI.getChildControl(petListUI._static_FocusBg, "RadioButton_Unseal_Feed")
  petListUI._button_Feed:addInputEvent("Mouse_LUp", "FGlobal_PetFeed_Open()")
  petListUI._button_Order = UI.getChildControl(petListUI._static_FocusBg, "RadioButton_Unseal_Order")
  petListUI._button_Order:addInputEvent("Mouse_LUp", "FGlobal_PetCommand_Open()")
  petListUI._button_ShowInfo = UI.getChildControl(petListUI._static_FocusBg, "RadioButton_Unseal_Info")
  petListUI._button_ShowInfo:addInputEvent("Mouse_LUp", "FGlobal_PetShowInfo_Open()")
  petListUI._button_Seal = UI.getChildControl(petListUI._static_FocusBg, "RadioButton_Unseal_Seal")
  petListUI._button_Seal:addInputEvent("Mouse_LUp", "FGlobal_PetSeal_Open()")
  petListUI._button_Compose = UI.getChildControl(petListUI._static_FocusBg, "RadioButton_Seal_Compose")
  petListUI._button_Compose:addInputEvent("Mouse_LUp", "FGlobal_PetCompose_Open()")
  petListUI._button_Unseal = UI.getChildControl(petListUI._static_FocusBg, "RadioButton_Seal_Unseal")
  petListUI._button_Unseal:addInputEvent("Mouse_LUp", "FGlobal_PetUnseal_Open()")
  petListUI._static_SkillMainIcon = UI.getChildControl(petListUI._static_AdjustSkillList, "Static_SkillMainIcon")
  petListUI._static_SkillEffectTitle = UI.getChildControl(petListUI._static_AdjustSkillList, "StaticText_SkillEffectTitle")
  petListUI._static_SkillEffectDesc = UI.getChildControl(petListUI._static_AdjustSkillList, "StaticText_SkillEffectDesc")
  petListUI._static_ApplyOnlySkillTitle = UI.getChildControl(petListUI._static_AdjustSkillList, "StaticText_ApplyOnlySkillTitle")
  petListUI._static_ApplyOnlySkillDesc = UI.getChildControl(petListUI._static_ApplyOnlySkillTitle, "StaticText_ApplyOnlySkillDesc")
  petListUI._static_ApplySkillTitle = UI.getChildControl(petListUI._static_AdjustSkillList, "StaticText_ApplySkillTitle")
  petListUI._static_ApplySkillDesc = UI.getChildControl(petListUI._static_ApplySkillTitle, "StaticText_ApplySkillDesc")
  petListUI._static_Exit = UI.getChildControl(petListUI._static_BottomBG, "StaticText_Close_ConsoleUI")
  petListUI._ExitButton = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_RADIOBUTTON, petListUI._static_BottomBG, "Exit_button")
  CopyBaseProperty(petListUI._static_Exit, petListUI._ExitButton)
  petListUI._ExitButton:addInputEvent("Mouse_LUp", "FGlobal_PetList_Close()")
  Panel_Window_PetList_Renew:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_B, "FGlobal_PetList_Close()")
end
function petList:setPetList(isResetScroll)
  if not Panel_Window_PetList_Renew:GetShow() then
    return
  end
  local toIndex = 0
  local scrollvalue = 0
  local vscroll = self._ui._list2_PetList:GetVScroll()
  local hscroll = self._ui._list2_PetList:GetHScroll()
  if isResetScroll then
    toIndex = self._ui._list2_PetList:getCurrenttoIndex()
    if false == self._ui._list2_PetList:IsIgnoreVerticalScroll() then
      scrollvalue = vscroll:GetControlPos()
    elseif false == sself._ui._list2_PetList:IsIgnoreHorizontalScroll() then
      scrollvalue = hscroll:GetControlPos()
    end
  end
  self._ui._list2_PetList:getElementManager():clearKey()
  self.unsealPetCount = ToClient_getPetUnsealedList()
  self.sealPetCount = ToClient_getPetSealedList()
  self:initSkillFrame()
  self:setSkillFrame()
  local petCount = self.unsealPetCount + self.sealPetCount
  for index = 0, petCount do
    local petNo
    if index < self.unsealPetCount then
      local petData = ToClient_getPetUnsealedDataByIndex(index)
      if nil ~= petData then
        petNo = petData:getPcPetNo()
      end
    else
      index = index - self.unsealPetCount
      if 0 == self.unsealPetCount then
        index = index - 1
      end
      local petData = ToClient_getPetSealedDataByIndex(index)
      if nil ~= petData then
        petNo = petData._petNo
      end
    end
    if nil ~= petNo then
      self._ui._list2_PetList:getElementManager():pushKey(petNo)
    end
  end
  if isResetScroll then
    self._ui._list2_PetList:setCurrenttoIndex(toIndex)
    if false == self._ui._list2_PetList:IsIgnoreVerticalScroll() then
      vscroll:SetControlPos(scrollvalue)
    elseif false == self._ui._list2_PetList:IsIgnoreHorizontalScroll() then
      hscroll:SetControlPos(scrollvalue)
    end
  end
end
function petList:isUnsealPet(petNo_s64)
  local unsealPetCount = ToClient_getPetUnsealedList()
  if unsealPetCount <= 0 then
    return false
  end
  for index = 0, unsealPetCount - 1 do
    local pcPetData = ToClient_getPetUnsealedDataByIndex(index)
    if petNo_s64 == pcPetData:getPcPetNo() then
      return true
    end
  end
  return false
end
function petList:petCommandConditionInit(petNo)
  self.petCommandCondition[tostring(petNo)] = {
    [PaGlobal_petCommandType._follow] = true,
    [PaGlobal_petCommandType._getItem] = true,
    [PaGlobal_petCommandType._lootingType] = CppEnums.PetLootingType.Normal,
    [PaGlobal_petCommandType._find] = true
  }
end
function petListCreate(control, key)
  local self = petList
  local _static_UnsealPetBG = UI.getChildControl(control, "Static_UnsealPetBG")
  local _static_SealPetBG = UI.getChildControl(control, "Static_SealPetBG")
  local _static_PetIconBG = UI.getChildControl(control, "Static_PetIconBG")
  local _static_PetIcon = UI.getChildControl(control, "Static_PetIcon")
  local _progress2_Hungry = UI.getChildControl(control, "Progress2_Hungry")
  local _staticText_HungryIcon = UI.getChildControl(control, "StaticText_HungryIcon")
  local _staticText_PetLevName = UI.getChildControl(control, "StaticText_PetLevName")
  local _staticText_PetSkill = UI.getChildControl(control, "StaticText_PetSkill")
  local _staticText_PetTier = UI.getChildControl(control, "StaticText_Tier")
  local _button_Speed = UI.getChildControl(control, "Button_Speed")
  local _button_Follow = UI.getChildControl(control, "Button_Follow")
  local _button_Talent = UI.getChildControl(control, "Button_Talent")
  local _button_GetItem = UI.getChildControl(control, "Button_GetItem")
  local _static_SkillIcon = {
    [0] = UI.getChildControl(control, "Static_SkillIcon1"),
    [1] = UI.getChildControl(control, "Static_SkillIcon2"),
    [2] = UI.getChildControl(control, "Static_SkillIcon3"),
    [3] = UI.getChildControl(control, "Static_SkillIcon4")
  }
  local isUnseal = self:isUnsealPet(key)
  local petCount = 0
  local petData
  local isSet = false
  local petIndex = -1
  if true == isUnseal then
    petCount = ToClient_getPetUnsealedList()
    for index = 0, petCount - 1 do
      petData = ToClient_getPetUnsealedDataByIndex(index)
      if nil ~= petData and key == petData:getPcPetNo() then
        isSet = true
        petIndex = index
        break
      end
    end
  else
    petCount = ToClient_getPetSealedList()
    if petCount <= 0 then
      return
    end
    for index = 0, petCount - 1 do
      petData = ToClient_getPetSealedDataByIndex(index)
      if nil ~= petData and key == petData._petNo then
        isSet = true
        petIndex = index
        break
      end
    end
  end
  if false == isSet then
    control:SetShow(false)
    return
  end
  for i = 0, #_static_SkillIcon do
    _static_SkillIcon[i]:SetShow(false)
  end
  _button_Speed:SetShow(false)
  _button_Follow:SetShow(false)
  _button_Talent:SetShow(false)
  _button_GetItem:SetShow(false)
  local petStaticStatus = petData:getPetStaticStatus()
  local iconPath = petData:getIconPath()
  local petName = petData:getName()
  local petTier = petStaticStatus:getPetTier() + 1
  local petMaxHungry = petStaticStatus._maxHungry
  local petRace = petStaticStatus:getPetRace()
  local petLevel = 0
  local pethungry = 0
  if true == isUnseal then
    pethungry = petData:getHungry()
    petLevel = petData:getLevel()
  else
    pethungry = petData._hungry
    petLevel = petData._level
  end
  _static_SealPetBG:SetShow(not isUnseal)
  _static_UnsealPetBG:SetShow(isUnseal)
  _staticText_PetTier:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANT_TIER", "tier", petTier))
  _static_PetIcon:ChangeTextureInfoNameAsync(iconPath)
  local hungryPercent = pethungry / petMaxHungry * 100
  _progress2_Hungry:SetProgressRate(hungryPercent)
  _staticText_HungryIcon:SetText(string.format("%d", hungryPercent) .. "%")
  _staticText_PetLevName:SetTextMode(CppEnums.TextMode.eTextMode_LimitText)
  _staticText_PetLevName:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. petLevel .. " " .. petName)
  local skillData = petData:getSkillParam(self._config._defaultSkillIndex)
  local isPassive = false
  if nil ~= skillData then
    local skillString = FGlobal_SetPetSkillTextByType(petData, self._config._defaultSkillIndex)
    if true == isSealPet then
    else
    end
    if nil == skillString then
      _staticText_PetSkill:SetText("")
    else
      _staticText_PetSkill:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PETINFO_SPECIALSKILL", "paramText", skillString))
    end
    isPassive = skillData:isPassiveSkill()
  end
  if true == isUnseal then
    if nil == self.petCommandCondition[tostring(key)] then
      petList:petCommandConditionInit(key)
    end
    if true == isPassive then
      self.petCommandCondition[tostring(key)][PaGlobal_petCommandType._find] = isPassive
    end
    local x1, y1, x2, y2
    if self.petCommandCondition[tostring(key)][PaGlobal_petCommandType._find] then
      x1, y1, x2, y2 = setTextureUV_Func(_button_Talent, 30, 30, 58, 58)
    else
      x1, y1, x2, y2 = setTextureUV_Func(_button_Talent, 30, 1, 58, 29)
    end
    _button_Talent:getBaseTexture():setUV(x1, y1, x2, y2)
    _button_Talent:setRenderTexture(_button_Talent:getBaseTexture())
    _button_Talent:SetShow(true)
    if self.petCommandCondition[tostring(key)][PaGlobal_petCommandType._follow] then
      x1, y1, x2, y2 = setTextureUV_Func(_button_Follow, 30, 59, 58, 87)
    else
      x1, y1, x2, y2 = setTextureUV_Func(_button_Follow, 30, 88, 58, 116)
    end
    _button_Follow:getBaseTexture():setUV(x1, y1, x2, y2)
    _button_Follow:setRenderTexture(_button_Follow:getBaseTexture())
    _button_Follow:SetShow(true)
    if self.petCommandCondition[tostring(key)][PaGlobal_petCommandType._getItem] then
      x1, y1, x2, y2 = setTextureUV_Func(_button_GetItem, 1, 30, 29, 58)
    else
      x1, y1, x2, y2 = setTextureUV_Func(_button_GetItem, 1, 1, 29, 29)
    end
    _button_GetItem:getBaseTexture():setUV(x1, y1, x2, y2)
    _button_GetItem:setRenderTexture(_button_GetItem:getBaseTexture())
    _button_GetItem:SetShow(true)
    if CppEnums.PetLootingType.Celerity == self.petCommandCondition[tostring(key)][PaGlobal_petCommandType._lootingType] then
      x1, y1, x2, y2 = setTextureUV_Func(_button_Speed, 1, 59, 29, 87)
    elseif CppEnums.PetLootingType.Precision == self.petCommandCondition[tostring(key)][PaGlobal_petCommandType._lootingType] then
      x1, y1, x2, y2 = setTextureUV_Func(_button_Speed, 1, 88, 29, 116)
    else
      x1, y1, x2, y2 = setTextureUV_Func(_button_Speed, 1, 117, 29, 145)
    end
    _button_Speed:getBaseTexture():setUV(x1, y1, x2, y2)
    _button_Speed:setRenderTexture(_button_Speed:getBaseTexture())
    _button_Speed:SetShow(true)
    local uiIndex = 0
    local baseskillindex = petData:getPetBaseSkillIndex()
    local skillMaxCount = ToClient_getPetEquipSkillMax()
    local skillStaticStatus = ToClient_getPetBaseSkillStaticStatus(baseskillindex)
    if nil ~= skillStaticStatus then
      local skillTypeStaticWrapper = skillStaticStatus:getSkillTypeStaticStatusWrapper()
      if nil ~= skillTypeStaticWrapper then
        local skillNo = skillStaticStatus:getSkillNo()
        _static_SkillIcon[uiIndex]:SetShow(true)
        _static_SkillIcon[uiIndex]:ChangeTextureInfoNameAsync("Icon/" .. skillTypeStaticWrapper:getIconPath())
        uiIndex = uiIndex + 1
      end
    end
    for skill_idx = 0, skillMaxCount - 1 do
      local skillStaticStatus = ToClient_getPetEquipSkillStaticStatus(skill_idx)
      local isLearn = petData:isPetEquipSkillLearned(skill_idx)
      if true == isLearn and nil ~= skillStaticStatus then
        local skillTypeStaticWrapper = skillStaticStatus:getSkillTypeStaticStatusWrapper()
        if nil ~= skillTypeStaticWrapper then
          local skillNo = skillStaticStatus:getSkillNo()
          _static_SkillIcon[uiIndex]:SetShow(true)
          _static_SkillIcon[uiIndex]:ChangeTextureInfoNameAsync("Icon/" .. skillTypeStaticWrapper:getIconPath())
          uiIndex = uiIndex + 1
        end
      end
    end
  else
    petList:petCommandConditionInit(key)
  end
  local isSpecialPet = petRace == self._config._SpecailPetRace
  _static_UnsealPetBG:addInputEvent("Mouse_LUp", "FGlobal_PetList_OpenPopupMenu(" .. petIndex .. ", " .. tostring(key) .. " , false," .. tostring(isSpecialPet) .. ")")
  _static_SealPetBG:addInputEvent("Mouse_LUp", "FGlobal_PetList_OpenPopupMenu(" .. petIndex .. ", " .. tostring(key) .. " , true ," .. tostring(isSpecialPet) .. ")")
end
function petList:initSkillFrame()
  for skillTypeIndex = 0, self._config._maxskillTypeCount - 1 do
    self.skillInfo.plusCount[skillTypeIndex] = 0
    self.skillInfo.skillTypeCount[skillTypeIndex] = 0
  end
end
function petList:setSkillFrame()
  local SkillList = self._ui._static_AdjustSkillList
  local unsealPetCount = ToClient_getPetUnsealedList()
  if unsealPetCount <= 0 then
    SkillList:SetShow(false)
    return
  end
  SkillList:SetShow(true)
  local Config = self._config
  local baseSkillPoint = {}
  for initIndex = 1, #Config._baseSkillTypeString do
    baseSkillPoint[initIndex] = 0
  end
  for index = 0, unsealPetCount - 1 do
    local PcPetData = ToClient_getPetUnsealedDataByIndex(index)
    if nil == PcPetData then
      return
    end
    local baseSkillIndex = PcPetData:getPetBaseSkillIndex()
    local unsealPetSkillStaticStatus = ToClient_getPetBaseSkillStaticStatus(baseSkillIndex)
    local groupNo = ToClient_getBaseSkillGroupNo(baseSkillIndex)
    local petTier = baseSkillIndex % 5 + 1
    baseSkillPoint[groupNo] = baseSkillPoint[groupNo] + Config._baseSkillMultiplePoint[groupNo] * petTier
    if 9 == groupNo then
      baseSkillPoint[groupNo + 1] = baseSkillPoint[groupNo + 1] + Config._baseSkillMultiplePoint[groupNo + 1] * petTier
    elseif 12 == groupNo then
      baseSkillPoint[groupNo] = baseSkillPoint[groupNo] + 10
    end
  end
  local baseSkillString = ""
  for groupIndex = 1, #Config._baseSkillTypeString do
    if baseSkillPoint[groupIndex] > 0 then
      if "" == baseSkillString then
        baseSkillString = Config._baseSkillTypeString[groupIndex] .. baseSkillPoint[groupIndex] .. Config._baseSkillTypeUnit[groupIndex]
      else
        baseSkillString = baseSkillString .. "\n" .. Config._baseSkillTypeString[groupIndex] .. baseSkillPoint[groupIndex] .. Config._baseSkillTypeUnit[groupIndex]
      end
    end
  end
  local petListUI = self._ui
  local skillMaxCount = ToClient_getPetEquipSkillMax()
  for index = 0, unsealPetCount - 1 do
    local PcPetData = ToClient_getPetUnsealedDataByIndex(index)
    if nil == PcPetData then
      return
    end
    for skill_idx = 0, skillMaxCount - 1 do
      local skillStaticStatus = ToClient_getPetEquipSkillStaticStatus(skill_idx)
      local isLearn = PcPetData:isPetEquipSkillLearned(skill_idx)
      if true == isLearn and nil ~= skillStaticStatus then
        local skillTypeStaticWrapper = skillStaticStatus:getSkillTypeStaticStatusWrapper()
        if nil ~= skillTypeStaticWrapper then
          self:petSkillTypeCheck1(skill_idx)
        end
      end
    end
  end
  local petSkillGrade = ""
  local petSkillGradeText = ""
  local hasSkill = false
  for skillTypeIndex = 0, Config._maxskillTypeCount - 1 do
    if 0 < self.skillInfo.plusCount[skillTypeIndex] then
      if skillTypeIndex < 12 then
        petSkillGrade = "%"
      else
        petSkillGrade = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_POTENLEVEL")
      end
      if "" == petSkillGradeText then
        petSkillGradeText = string.gsub(Config._skillTypeString[skillTypeIndex], "-", "") .. self.skillInfo.plusCount[skillTypeIndex] .. petSkillGrade
      else
        petSkillGradeText = petSkillGradeText .. "\n" .. string.gsub(Config._skillTypeString[skillTypeIndex], "-", "") .. self.skillInfo.plusCount[skillTypeIndex] .. petSkillGrade
      end
      hasSkill = true
    end
  end
  petListUI._static_ApplyOnlySkillTitle:SetShow(true)
  petListUI._static_ApplyOnlySkillDesc:SetText(baseSkillString)
  if hasSkill then
    petListUI._static_ApplySkillTitle:SetShow(true)
    petListUI._static_ApplySkillDesc:SetShow(true)
    petListUI._static_ApplySkillDesc:SetText(petSkillGradeText)
  else
    petListUI._static_ApplySkillTitle:SetShow(false)
  end
end
function petList:updateHungry()
  if isFlushedUI() then
    return
  end
  local petCount = ToClient_getPetUnsealedList()
  if petCount == 0 then
    return
  end
  for index = 0, petCount - 1 do
    local pcPetData = ToClient_getPetUnsealedDataByIndex(index)
    if nil ~= pcPetData then
      local petStaticStatus = pcPetData:getPetStaticStatus()
      local petHungry = pcPetData:getHungry()
      local petNo = pcPetData:getPcPetNo()
      local petMaxHungry = petStaticStatus._maxHungry
      local petHungryPercent = petHungry / petMaxHungry * 100
      local content = self._ui._list2_PetList:GetContentByKey(petNo)
      if nli ~= content then
        local progressControl = UI.getChildControl(content, "Progress2_Hungry")
        progressControl:SetProgressRate(petHungryPercent)
        local progressControlIcon = UI.getChildControl(content, "StaticText_HungryIcon")
        progressControlIcon:SetText(string.format("%d", petHungryPercent) .. "%")
      end
    end
  end
end
function petList:petSkillTypeCheck1(skillIndex)
  local skillType
  if skillIndex >= 0 and skillIndex < 3 then
    skillType = 0
    self.skillInfo.plusCount[skillType] = math.min(self.skillInfo.plusCount[skillType] + self._config._plusPoint[skillIndex], self._config._maxPercentage)
  elseif skillIndex >= 3 and skillIndex < 6 then
    skillType = 1
    self.skillInfo.plusCount[skillType] = math.min(self.skillInfo.plusCount[skillType] + self._config._plusPoint[skillIndex % 3], self._config._maxPercentage)
  elseif skillIndex >= 6 and skillIndex < 9 then
    skillType = 2
    self.skillInfo.plusCount[skillType] = math.min(self.skillInfo.plusCount[skillType] + self._config._plusPoint[skillIndex % 3], self._config._maxPercentage)
  elseif 12 == skillIndex then
    skillType = 3
    self.skillInfo.plusCount[skillType] = math.min(self.skillInfo.plusCount[skillType] + self._config._plusPoint[0], self._config._maxPercentage)
  elseif 13 == skillIndex then
    skillType = 3
    self.skillInfo.plusCount[skillType] = math.min(self.skillInfo.plusCount[skillType] + self._config._plusPoint[4], self._config._maxPercentage)
  elseif skillIndex >= 14 and skillIndex < 17 then
    skillType = 4
    self.skillInfo.plusCount[skillType] = math.min(self.skillInfo.plusCount[skillType] + self._config._plusPoint[(skillIndex + 1) % 3], self._config._maxPercentage)
  elseif skillIndex >= 17 and skillIndex < 20 then
    skillType = 5
    self.skillInfo.plusCount[skillType] = math.min(self.skillInfo.plusCount[skillType] + self._config._plusPoint[(skillIndex + 1) % 3], self._config._maxPercentage)
  elseif skillIndex >= 20 and skillIndex < 23 then
    skillType = 6
    self.skillInfo.plusCount[skillType] = math.min(self.skillInfo.plusCount[skillType] + self._config._plusPoint[(skillIndex + 1) % 3], self._config._maxPercentage)
  elseif skillIndex >= 23 and skillIndex < 26 then
    skillType = 7
    self.skillInfo.plusCount[skillType] = math.min(self.skillInfo.plusCount[skillType] + self._config._plusPoint[(skillIndex + 1) % 3], self._config._maxPercentage)
  elseif skillIndex >= 26 and skillIndex < 29 then
    skillType = 8
    self.skillInfo.plusCount[skillType] = math.min(self.skillInfo.plusCount[skillType] + self._config._plusPoint[(skillIndex + 1) % 3], self._config._maxPercentage)
  elseif skillIndex >= 29 and skillIndex < 32 then
    skillType = 9
    self.skillInfo.plusCount[skillType] = math.min(self.skillInfo.plusCount[skillType] + self._config._plusPoint[(skillIndex + 1) % 3], self._config._maxPercentage)
  elseif skillIndex >= 32 and skillIndex < 35 then
    skillType = 10
    self.skillInfo.plusCount[skillType] = math.min(self.skillInfo.plusCount[skillType] + self._config._plusPoint[(skillIndex + 1) % 3], self._config._maxPercentage)
  elseif skillIndex >= 35 and skillIndex < 38 then
    skillType = 11
    self.skillInfo.plusCount[skillType] = math.min(self.skillInfo.plusCount[skillType] + self._config._plusPoint[(skillIndex + 1) % 3], self._config._maxPercentage)
  elseif 9 == skillIndex then
    skillType = 12
    self.skillInfo.plusCount[skillType] = math.min(self.skillInfo.plusCount[skillType] + 1, self._config._maxGrade)
  elseif 10 == skillIndex then
    skillType = 13
    self.skillInfo.plusCount[skillType] = math.min(self.skillInfo.plusCount[skillType] + 1, self._config._maxGrade)
  elseif 11 == skillIndex then
    skillType = 14
    self.skillInfo.plusCount[skillType] = math.min(self.skillInfo.plusCount[skillType] + 1, self._config._maxGrade)
  end
  self.skillInfo.skillTypeCount[skillType] = self.skillInfo.skillTypeCount[skillType] + 1
  return skillType
end
function petList:setCommand(petNo, orderType, value)
  local content = self._ui._list2_PetList:GetContentByKey(petNo)
  if nil == content then
    return
  end
  self.petCommandCondition[tostring(petNo)][orderType] = value
  self._ui._list2_PetList:requestUpdateByKey(petNo)
end
function FromClient_luaLoadComplete_PetList()
  petList:initialize()
  local btnPetIcon = UI.getChildControl(Panel_Window_PetIcon, "Button_PetIcon")
  btnPetIcon:addInputEvent("Mouse_LUp", "FGlobal_PetList_Open()")
end
function FromClient_PetUpdate()
  if not Panel_Window_PetList_Renew:GetShow() then
    return
  end
  petList:updateHungry()
  petList:setPetList(true)
  petList:initSkillFrame()
  petList:setSkillFrame()
end
function FGlobal_PetList_Open()
  if Panel_Window_PetList_Renew:GetShow() then
    return
  else
    petList:open()
  end
end
function FGlobal_PetList_Close()
  petList:close()
  FGlobal_PetFeedClose()
  FGlobal_PetInfo_Close()
end
function FGlobal_PetFeed_Open()
  petList:selectFeed()
end
function FGlobal_PetCommand_Open()
  petList:selectCommand()
end
function FGlobal_PetCommand_Setting(petNo, orderType, value)
  petList:setCommand(petNo, orderType, value)
end
function FGlobal_PetShowInfo_Open()
  petList:selectShowInfo()
end
function FGlobal_PetSeal_Open()
  petList:selectSeal()
end
function FGlobal_PetCompose_Open()
  petList:selectCompose()
end
function FGlobal_PetUnseal_Open()
  petList:selectUnseal()
end
function FGlobal_PetList_OpenPopupMenu(petIndex, petNoStr, isSealPet, isSpecialPet)
  petList:openFunctionPopup(petIndex, petNoStr, isSealPet, isSpecialPet)
end
function FGlobal_PetList_ClosePopupMenu()
  petList:closeFunctionPopup()
end
function FGlobal_PetList_setSkillFrame()
  petList:initSkillFrame()
  petList:setSkillFrame()
end
function petList:registEventHandler()
  registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_PetList")
  registerEvent("FromClient_PetAddList", "FromClient_PetUpdate")
  registerEvent("FromClient_PetInfoChanged", "FromClient_PetUpdate")
  registerEvent("FromClient_PetAddSealedList", "FromClient_PetUpdate")
  registerEvent("FromClient_PetDelSealedList", "FromClient_PetUpdate")
  self._ui._list2_PetList:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "petListCreate")
  self._ui._list2_PetList:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
end
function FGlobal_PetListNew_NoPet()
  if isFlushedUI() then
    return
  end
  if true == PaGlobal_TutorialManager:isDoingTutorial() then
    Panel_Window_PetIcon:SetShow(false)
    return
  end
  local petCount = ToClient_getPetSealedList()
  local unSealPetCount = ToClient_getPetUnsealedList()
  local PcPetData = ToClient_getPetUnsealedDataByIndex(0)
  if 0 == petCount and nil == PcPetData then
    Panel_Window_PetIcon:SetShow(false)
  else
    Panel_Window_PetIcon:SetShow(true)
    local iconCount = FGlobal_HouseIconCount() + FGlobal_ServantIconCount()
    local posX, posY
    if 0 < FGlobal_HouseIconCount() and Panel_MyHouseNavi:GetShow() then
      posX = Panel_MyHouseNavi:GetPosX() + 60 * FGlobal_HouseIconCount() - 3
      posY = Panel_MyHouseNavi:GetPosY() - 2
    elseif 0 < FGlobal_ServantIconCount() and Panel_Window_Servant:GetShow() then
      posX = Panel_Window_Servant:GetPosX() + 60 * FGlobal_ServantIconCount() - 3
      posY = Panel_Window_Servant:GetPosY() - 2
    else
      posX = 10
      posY = Panel_SelfPlayerExpGage:GetPosY() + Panel_SelfPlayerExpGage:GetSizeY() + 15
    end
    Panel_Window_PetIcon:SetPosX(posX)
    Panel_Window_PetIcon:SetPosY(posY)
  end
  FGlobal_MaidIcon_SetPos(false)
  PaGlobal_Camp:setPos()
  if true == _ContentsGroup_RenewUI_Main then
    Panel_Window_PetIcon:SetShow(false)
  end
end
petList:registEventHandler()
