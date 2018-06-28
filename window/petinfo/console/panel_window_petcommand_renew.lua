Panel_Window_PetCommand_Renew:SetShow(false)
PaGlobal_petCommandType = {
  _follow = 0,
  _getItem = 1,
  _lootingType = 2,
  _find = 3,
  _typeCount = 4
}
local petCommand = {
  _ui = {
    _static_MainTitleBG = UI.getChildControl(Panel_Window_PetCommand_Renew, "Static_MainTitleBG"),
    _static_CenterBG = UI.getChildControl(Panel_Window_PetCommand_Renew, "Static_CenterBG"),
    _static_BottomKeyBG = UI.getChildControl(Panel_Window_PetCommand_Renew, "Static_BottomKeyBG")
  },
  _selectPetIndex,
  _selectPetCondition = {
    [PaGlobal_petCommandType._follow] = nil,
    [PaGlobal_petCommandType._getItem] = nil,
    [PaGlobal_petCommandType._lootingType] = nil,
    [PaGlobal_petCommandType._find] = nil
  }
}
function petCommand:open()
  if Panel_Window_PetCommand_Renew:GetShow() then
    return
  end
  self:setPosition()
  Panel_Window_PetCommand_Renew:SetShow(true)
end
function petCommand:close()
  if not Panel_Window_PetCommand_Renew:GetShow() then
    return
  end
  Panel_Window_PetCommand_Renew:SetShow(false)
end
function petCommand:initPetCondition()
  for index = 0, PaGlobal_petCommandType._typeCount - 1 do
    self._selectPetCondition[index] = nil
  end
end
function petCommand:initControl()
  local petCommandUI = self._ui
  local orderType = PaGlobal_petCommandType
  petCommandUI._staticText_Title = UI.getChildControl(petCommandUI._static_MainTitleBG, "StaticText_Title")
  local Static_SpeedBg = UI.getChildControl(petCommandUI._static_CenterBG, "Static_SpeedBg")
  petCommandUI._radioButton_High = UI.getChildControl(Static_SpeedBg, "RadioButton_High")
  petCommandUI._radioButton_High:addInputEvent("Mouse_LUp", "PetCommand_SelectOrder(" .. orderType._lootingType .. "," .. CppEnums.PetLootingType.Celerity .. ")")
  petCommandUI._radioButton_High:addInputEvent("Mouse_On", "PetCommand_ChangeIcon_On(" .. orderType._lootingType .. "," .. CppEnums.PetLootingType.Celerity .. ")")
  petCommandUI._radioButton_High:addInputEvent("Mouse_Out", "PetCommand_ChangeIcon_Off(" .. orderType._lootingType .. "," .. CppEnums.PetLootingType.Celerity .. ")")
  petCommandUI._radioButton_Normal = UI.getChildControl(Static_SpeedBg, "RadioButton_Normal")
  petCommandUI._radioButton_Normal:addInputEvent("Mouse_LUp", "PetCommand_SelectOrder(" .. orderType._lootingType .. "," .. CppEnums.PetLootingType.Normal .. ")")
  petCommandUI._radioButton_Normal:addInputEvent("Mouse_On", "PetCommand_ChangeIcon_On(" .. orderType._lootingType .. "," .. CppEnums.PetLootingType.Normal .. ")")
  petCommandUI._radioButton_Normal:addInputEvent("Mouse_Out", "PetCommand_ChangeIcon_Off(" .. orderType._lootingType .. "," .. CppEnums.PetLootingType.Normal .. ")")
  petCommandUI._radioButton_Slow = UI.getChildControl(Static_SpeedBg, "RadioButton_Slow")
  petCommandUI._radioButton_Slow:addInputEvent("Mouse_LUp", "PetCommand_SelectOrder(" .. orderType._lootingType .. "," .. CppEnums.PetLootingType.Precision .. ")")
  petCommandUI._radioButton_Slow:addInputEvent("Mouse_On", "PetCommand_ChangeIcon_On(" .. orderType._lootingType .. "," .. CppEnums.PetLootingType.Precision .. ")")
  petCommandUI._radioButton_Slow:addInputEvent("Mouse_Out", "PetCommand_ChangeIcon_Off(" .. orderType._lootingType .. "," .. CppEnums.PetLootingType.Precision .. ")")
  local Static_ActionBg = UI.getChildControl(petCommandUI._static_CenterBG, "Static_ActionBg")
  petCommandUI._radioButton_Follow = UI.getChildControl(Static_ActionBg, "RadioButton_Follow")
  petCommandUI._radioButton_Follow:addInputEvent("Mouse_LUp", "PetCommand_SelectOrder(" .. orderType._follow .. ", true)")
  petCommandUI._radioButton_Follow:addInputEvent("Mouse_On", "PetCommand_ChangeIcon_On(" .. orderType._follow .. ", true)")
  petCommandUI._radioButton_Follow:addInputEvent("Mouse_Out", "PetCommand_ChangeIcon_Off(" .. orderType._follow .. ", true)")
  petCommandUI._radioButton_Wait = UI.getChildControl(Static_ActionBg, "RadioButton_Wait")
  petCommandUI._radioButton_Wait:addInputEvent("Mouse_LUp", "PetCommand_SelectOrder(" .. orderType._follow .. ", false)")
  petCommandUI._radioButton_Wait:addInputEvent("Mouse_On", "PetCommand_ChangeIcon_On(" .. orderType._follow .. ", false)")
  petCommandUI._radioButton_Wait:addInputEvent("Mouse_Out", "PetCommand_ChangeIcon_Off(" .. orderType._follow .. ", false)")
  local Static_TalentBg = UI.getChildControl(petCommandUI._static_CenterBG, "Static_TalentBg")
  petCommandUI._radioButton_TalentOn = UI.getChildControl(Static_TalentBg, "RadioButton_On")
  petCommandUI._radioButton_TalentOn:addInputEvent("Mouse_LUp", "PetCommand_SelectOrder(" .. orderType._find .. ", true)")
  petCommandUI._radioButton_TalentOn:addInputEvent("Mouse_On", "PetCommand_ChangeIcon_On(" .. orderType._find .. ", true)")
  petCommandUI._radioButton_TalentOn:addInputEvent("Mouse_Out", "PetCommand_ChangeIcon_Off(" .. orderType._find .. ", true)")
  petCommandUI._radioButton_TalentOff = UI.getChildControl(Static_TalentBg, "RadioButton_Off")
  petCommandUI._radioButton_TalentOff:addInputEvent("Mouse_LUp", "PetCommand_SelectOrder(" .. orderType._find .. ", false)")
  petCommandUI._radioButton_TalentOff:addInputEvent("Mouse_On", "PetCommand_ChangeIcon_On(" .. orderType._find .. ", false)")
  petCommandUI._radioButton_TalentOff:addInputEvent("Mouse_Out", "PetCommand_ChangeIcon_Off(" .. orderType._find .. ", false)")
  local Static_GetItemBg = UI.getChildControl(petCommandUI._static_CenterBG, "Static_GetItemBg")
  petCommandUI._radioButton_GetItemOn = UI.getChildControl(Static_GetItemBg, "RadioButton_On")
  petCommandUI._radioButton_GetItemOn:addInputEvent("Mouse_LUp", "PetCommand_SelectOrder(" .. orderType._getItem .. ", true)")
  petCommandUI._radioButton_GetItemOn:addInputEvent("Mouse_On", "PetCommand_ChangeIcon_On(" .. orderType._getItem .. ", true)")
  petCommandUI._radioButton_GetItemOn:addInputEvent("Mouse_Out", "PetCommand_ChangeIcon_Off(" .. orderType._getItem .. ", true)")
  petCommandUI._radioButton_GetItemOff = UI.getChildControl(Static_GetItemBg, "RadioButton_Off")
  petCommandUI._radioButton_GetItemOff:addInputEvent("Mouse_LUp", "PetCommand_SelectOrder(" .. orderType._getItem .. ", false)")
  petCommandUI._radioButton_GetItemOff:addInputEvent("Mouse_On", "PetCommand_ChangeIcon_On(" .. orderType._getItem .. ", false)")
  petCommandUI._radioButton_GetItemOff:addInputEvent("Mouse_Out", "PetCommand_ChangeIcon_Off(" .. orderType._getItem .. ", false)")
  petCommandUI._staticText_Cancle = UI.getChildControl(petCommandUI._static_BottomKeyBG, "StaticText_Cansel_ConsoleUI")
  petCommandUI._ExitButton = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_BUTTON, petCommandUI._static_BottomKeyBG, "_exit_Button")
  CopyBaseProperty(petCommandUI._staticText_Cancle, petCommandUI._ExitButton)
  petCommandUI._ExitButton:addInputEvent("Mouse_LUp", "FGlobal_PetCommand_Close()")
end
function petCommand:initialize()
  petCommand._selectPetIndex = -1
  self:initControl()
  self:initPetCondition()
end
function petCommand:setPosition()
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_Window_PetCommand_Renew:GetSizeX()
  local panelSizeY = Panel_Window_PetCommand_Renew:GetSizeY()
  Panel_Window_PetCommand_Renew:SetPosX(scrSizeX / 2 - panelSizeX / 2)
  Panel_Window_PetCommand_Renew:SetPosY(scrSizeY / 2 - panelSizeY / 2)
end
function petCommand:update()
  local petCommandUI = self._ui
  petCommandUI._radioButton_High:SetCheck(false)
  petCommandUI._radioButton_Normal:SetCheck(false)
  petCommandUI._radioButton_Slow:SetCheck(false)
  if self._selectPetCondition[PaGlobal_petCommandType._lootingType] == CppEnums.PetLootingType.Celerity then
    petCommandUI._radioButton_High:SetCheck(true)
  elseif self._selectPetCondition[PaGlobal_petCommandType._lootingType] == CppEnums.PetLootingType.Precision then
    petCommandUI._radioButton_Slow:SetCheck(true)
  else
    petCommandUI._radioButton_Normal:SetCheck(true)
  end
  petCommandUI._radioButton_Wait:SetCheck(not self._selectPetCondition[PaGlobal_petCommandType._follow])
  petCommandUI._radioButton_Follow:SetCheck(self._selectPetCondition[PaGlobal_petCommandType._follow])
  petCommandUI._radioButton_TalentOff:SetCheck(not self._selectPetCondition[PaGlobal_petCommandType._find])
  petCommandUI._radioButton_TalentOn:SetCheck(self._selectPetCondition[PaGlobal_petCommandType._find])
  petCommandUI._radioButton_GetItemOff:SetCheck(not self._selectPetCondition[PaGlobal_petCommandType._getItem])
  petCommandUI._radioButton_GetItemOn:SetCheck(self._selectPetCondition[PaGlobal_petCommandType._getItem])
end
function petCommand:selectOrder(orderType, value)
  if nil == self._selectPetIndex or self._selectPetIndex < 0 then
    return
  end
  if nil == orderType or orderType < 0 or orderType >= PaGlobal_petCommandType._typeCount then
    return
  end
  local pcPetData = ToClient_getPetUnsealedDataByIndex(self._selectPetIndex)
  if nil == pcPetData then
    return
  end
  local petNo = pcPetData:getPcPetNo()
  if PaGlobal_petCommandType._lootingType == orderType then
    self:applyLootingCommand(petNo, value)
  elseif PaGlobal_petCommandType._follow == orderType then
    self:applyFollowCommand(petNo, value)
  elseif PaGlobal_petCommandType._find == orderType then
    self:applyFindCommand(petNo, value)
  elseif PaGlobal_petCommandType._getItem == orderType then
    self:applyGetItemCommand(petNo, value)
  end
  self._selectPetCondition[orderType] = value
  self:update()
  FGlobal_PetCommand_Setting(petNo, orderType, value)
end
function petCommand:applyFollowCommand(petNo, isFollow)
  if not isFollow then
    ToClient_callHandlerToPetNo("handlePetWaitMaster", petNo)
  else
    ToClient_callHandlerToPetNo("handlePetFollowMaster", petNo)
  end
end
function petCommand:applyLootingCommand(petNo, lootingType)
  if nil == lootingType or lootingType < 0 or lootingType >= CppEnums.PetLootingType.Count then
    return
  end
  ToClient_requestChangePetLootingType(petNo, lootingType)
end
function petCommand:applyGetItemCommand(petNo, isGetItem)
  if not isGetItem then
    ToClient_callHandlerToPetNo("handlePetGetItemOff", petNo)
  else
    ToClient_callHandlerToPetNo("handlePetGetItemOn", petNo)
  end
end
function petCommand:applyFindCommand(petNo, isGetItem)
  if not isGetItem then
    ToClient_callHandlerToPetNo("handlePetFindThatOff", petNo)
  else
    ToClient_callHandlerToPetNo("handlePetFindThatOn", petNo)
  end
end
function petCommand:changeIconOn(orderType, value)
  local petCommandUI = self._ui
  local x1, y1, x2, y2, ButtonIcon
  if PaGlobal_petCommandType._lootingType == orderType then
    if CppEnums.PetLootingType.Celerity == value then
      ButtonIcon = UI.getChildControl(petCommandUI._radioButton_High, "Static_Icon")
      x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 92, 34, 124, 66)
    elseif CppEnums.PetLootingType.Precision == value then
      ButtonIcon = UI.getChildControl(petCommandUI._radioButton_Slow, "Static_Icon")
      x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 92, 67, 124, 99)
    else
      ButtonIcon = UI.getChildControl(petCommandUI._radioButton_Normal, "Static_Icon")
      x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 92, 1, 124, 34)
    end
  elseif PaGlobal_petCommandType._follow == orderType then
    if value == true then
      ButtonIcon = UI.getChildControl(petCommandUI._radioButton_Follow, "Static_Icon")
      x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 92, 100, 124, 132)
    else
      ButtonIcon = UI.getChildControl(petCommandUI._radioButton_Wait, "Static_Icon")
      x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 92, 133, 124, 165)
    end
  elseif PaGlobal_petCommandType._find == orderType then
    if value == true then
      ButtonIcon = UI.getChildControl(petCommandUI._radioButton_TalentOn, "Static_Icon")
      x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 92, 166, 124, 198)
    else
      ButtonIcon = UI.getChildControl(petCommandUI._radioButton_TalentOff, "Static_Icon")
      x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 92, 166, 124, 198)
    end
  elseif PaGlobal_petCommandType._getItem == orderType then
    if value == true then
      ButtonIcon = UI.getChildControl(petCommandUI._radioButton_GetItemOn, "Static_Icon")
      x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 92, 199, 124, 231)
    else
      ButtonIcon = UI.getChildControl(petCommandUI._radioButton_GetItemOff, "Static_Icon")
      x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 92, 199, 124, 231)
    end
  end
  if ButtonIcon == nil then
    return
  end
  ButtonIcon:getBaseTexture():setUV(x1, y1, x2, y2)
  ButtonIcon:setRenderTexture(ButtonIcon:getBaseTexture())
end
function petCommand:changeIconOff(orderType, value)
  local petCommandUI = self._ui
  local x1, y1, x2, y2, ButtonIcon
  if PaGlobal_petCommandType._lootingType == orderType then
    if CppEnums.PetLootingType.Celerity == value then
      ButtonIcon = UI.getChildControl(petCommandUI._radioButton_High, "Static_Icon")
      if true == petCommandUI._radioButton_High:IsCheck() then
        x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 59, 34, 91, 66)
      else
        x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 125, 34, 157, 66)
      end
    elseif CppEnums.PetLootingType.Precision == value then
      ButtonIcon = UI.getChildControl(petCommandUI._radioButton_Slow, "Static_Icon")
      if true == petCommandUI._radioButton_Slow:IsCheck() then
        x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 59, 67, 91, 99)
      else
        x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 125, 67, 157, 99)
      end
    else
      ButtonIcon = UI.getChildControl(petCommandUI._radioButton_Normal, "Static_Icon")
      if true == petCommandUI._radioButton_Normal:IsCheck() then
        x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 59, 1, 91, 33)
      else
        x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 125, 1, 157, 33)
      end
    end
  elseif PaGlobal_petCommandType._follow == orderType then
    if value == true then
      ButtonIcon = UI.getChildControl(petCommandUI._radioButton_Follow, "Static_Icon")
      if true == petCommandUI._radioButton_Follow:IsCheck() then
        x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 59, 100, 91, 132)
      else
        x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 125, 100, 157, 132)
      end
    else
      ButtonIcon = UI.getChildControl(petCommandUI._radioButton_Wait, "Static_Icon")
      if true == petCommandUI._radioButton_Wait:IsCheck() then
        x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 59, 133, 91, 165)
      else
        x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 125, 133, 157, 165)
      end
    end
  elseif PaGlobal_petCommandType._find == orderType then
    if value == true then
      ButtonIcon = UI.getChildControl(petCommandUI._radioButton_TalentOn, "Static_Icon")
      if true == petCommandUI._radioButton_TalentOn:IsCheck() then
        x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 92, 166, 124, 198)
      else
        x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 125, 166, 157, 198)
      end
    else
      ButtonIcon = UI.getChildControl(petCommandUI._radioButton_TalentOff, "Static_Icon")
      if true == petCommandUI._radioButton_TalentOff:IsCheck() then
        x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 92, 166, 124, 198)
      else
        x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 125, 166, 157, 198)
      end
    end
  elseif PaGlobal_petCommandType._getItem == orderType then
    if value == true then
      ButtonIcon = UI.getChildControl(petCommandUI._radioButton_GetItemOn, "Static_Icon")
      if true == petCommandUI._radioButton_GetItemOn:IsCheck() then
        x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 59, 199, 91, 231)
      else
        x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 125, 199, 157, 231)
      end
    else
      ButtonIcon = UI.getChildControl(petCommandUI._radioButton_GetItemOff, "Static_Icon")
      if true == petCommandUI._radioButton_GetItemOff:IsCheck() then
        x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 59, 199, 91, 231)
      else
        x1, y1, x2, y2 = setTextureUV_Func(ButtonIcon, 125, 199, 157, 231)
      end
    end
  end
  if ButtonIcon == nil then
    return
  end
  ButtonIcon:getBaseTexture():setUV(x1, y1, x2, y2)
  ButtonIcon:setRenderTexture(ButtonIcon:getBaseTexture())
  ButtonIcon:SetShow(true)
end
function petCommand:updateButtonIcon()
  for index = 0, PaGlobal_petCommandType._typeCount - 1 do
  end
end
function petCommand:getSelectPetData()
  local petData
  local unsealPetCount = ToClient_getPetUnsealedList()
  if unsealPetCount <= 0 then
    return nil
  end
  for index = 0, unsealPetCount - 1 do
    local pcPetData = ToClient_getPetUnsealedDataByIndex(index)
    if petNo_s64 == pcPetData:getPcPetNo() then
      return pcPetData
    end
  end
  return nil
end
function petCommand:registEventHandler()
  registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_PetCommand")
end
function FGlobal_PetCommand_Init(petIndex)
  if nil == petIndex then
    return
  end
  petCommand._selectPetIndex = petIndex
  petCommand:open()
  petCommand:update()
  petCommand:updateButtonIcon()
end
function FGlobal_PetCommand_Close()
  petCommand:close()
end
function PetCommand_SelectOrder(orderType, value)
  petCommand:selectOrder(orderType, value)
  petCommand:changeIconOff(orderType, value)
end
function PetCommand_ChangeIcon_On(orderType, value)
  petCommand:changeIconOn(orderType, value)
end
function PetCommand_ChangeIcon_Off(orderType, value)
  petCommand:changeIconOff(orderType, value)
end
function FromClient_luaLoadComplete_PetCommand()
  petCommand:initialize()
end
function FGlobal_PetList_setPetCondition(orderType, value)
  if nil == orderType or orderType < 0 or orderType >= PaGlobal_petCommandType._typeCount then
    return
  end
  if 0 == orderType then
    petCommand:initPetCondition()
  end
  petCommand._selectPetCondition[orderType] = value
end
petCommand:registEventHandler()
