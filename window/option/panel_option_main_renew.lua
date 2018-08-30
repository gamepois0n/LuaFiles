Panel_Window_Option_Main:SetShow(false)
function FGlobal_Option_GetShow()
  return Panel_Window_Option_Main:GetShow()
end
function PaGlobal_Option:isOpen()
  return Panel_Window_Option_Main:GetShow()
end
function PaGlobal_Option:InitUi()
  self._ui._list2 = UI.getChildControl(Panel_Window_Option_Main, "List2_LeftMenu")
  Panel_Window_Option_Main:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "PaGlobal_Option:ClickedConfirmOption()")
  local versionUI = UI.getChildControl(self._ui._titleBg, "StaticText_Version")
  versionUI:SetText("ver." .. tostring(ToClient_getVersionString()))
end
function PaGlobal_Option:ListInit()
  local tree2 = self._ui._list2
  tree2:changeAnimationSpeed(11)
  tree2:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "FGlobal_Option_ListTreeUpdate")
  tree2:createChildContent(CppEnums.PAUIList2ElementManagerType.tree)
  tree2:getElementManager():clearKey()
  local mainElement = tree2:getElementManager():getMainElement()
  local keyIndex = 1
  local _frameOrder = {}
  local _detailOrder = {}
  _frameOrder = {
    "Performance",
    "Graphic",
    "Sound",
    "Function",
    "Interface"
  }
  _detailOrder = {
    [1] = {
      "Optimize",
      "OptimizeBeta",
      "GraphicQuality",
      "Camera",
      "Npc"
    },
    [2] = {
      "Window",
      "Quality",
      "Effect",
      "Camera",
      "ScreenShot",
      "HDR"
    },
    [3] = {"OnOff", "Volume"},
    [4] = {
      "Convenience",
      "View",
      "Alert",
      "Worldmap",
      "Nation",
      "Etc"
    },
    [5] = {
      "Action",
      "UI",
      "QuickSlot",
      "Function",
      "Mouse",
      "Pad"
    }
  }
  for index, category in ipairs(_frameOrder) do
    if true == self:CheckAvailableCategory(category) then
      local category = _frameOrder[index]
      self._list2._tree2IndexMap[keyIndex] = {
        _isMain = true,
        _category = category,
        _string = PAGetString(Defines.StringSheet_GAME, "LUA_NEWGAMEOPTION_" .. category)
      }
      local treeElement = mainElement:createChild(toInt64(0, keyIndex))
      treeElement:setIsOpen(false)
      keyIndex = keyIndex + 1
      local count = 0
      for i, table in pairs(self._frames[category]) do
        count = count + 1
      end
      if count > 1 then
        for index2, frame in pairs(_detailOrder[index]) do
          local detail = _detailOrder[index][index2]
          if true == self:CheckAvailableDetail(category, detail) then
            self._list2._tree2IndexMap[keyIndex] = {
              _isMain = false,
              _category = category,
              _detail = detail,
              _string = PAGetString(Defines.StringSheet_GAME, "LUA_NEWGAMEOPTION_" .. category .. "_" .. detail)
            }
            local subTreeElement = treeElement:createChild(toInt64(0, keyIndex))
            keyIndex = keyIndex + 1
          end
        end
      end
    end
  end
end
function PaGlobal_Option:ClickedMainCategory(key, category)
  local tree2 = self._ui._list2
  for k, value in pairs(self._list2._tree2IndexMap) do
    if true == value._isMain then
      local keyElement = tree2:getElementManager():getByKey(toInt64(0, k), false)
      keyElement:setIsOpen(false)
    end
  end
  local isOnlyOneSubCategory = 0
  local onlyOnDetail
  for k, value in pairs(self._list2._tree2IndexMap) do
    if false == value._isMain and category == value._category then
      isOnlyOneSubCategory = isOnlyOneSubCategory + 1
      onlyOnDetail = value._detail
    end
  end
  if 1 == isOnlyOneSubCategory then
    PaGlobal_Option:SelectOptionFrame(category, onlyOnDetail)
  else
    tree2:getElementManager():toggle(toInt64(0, key))
  end
  self._list2._selectedKey = key
  tree2:getElementManager():refillKeyList()
  local heightIndex = tree2:getIndexByKey(toInt64(0, key))
  tree2:moveIndex(heightIndex)
end
function PaGlobal_Option:ResetListToggleState()
  local tree2 = self._ui._list2
  for k, value in pairs(self._list2._tree2IndexMap) do
    if true == value._isMain then
      local keyint64 = toInt64(0, k)
      local keyElement = tree2:getElementManager():getByKey(keyint64, false)
      if true == keyElement:getIsOpen() then
        tree2:getElementManager():toggle(keyint64)
        self._list2._selectedKey = -1
        tree2:requestUpdateByKey(keyint64)
      end
      keyElement:setIsOpen(false)
    end
  end
end
function PaGlobal_Option:ClickedSubCategory(key, category, detail)
  self._list2._selectedSubKey = key
  self:SelectOptionFrame(category, detail)
  self._ui._list2:getElementManager():refillKeyList()
end
function PaGlobal_Option:SelectOptionFrame(category, detail)
  self:CreateFrame(category, detail)
end
function FGlobal_Option_ListTreeUpdate(contents, key)
  local idx = Int64toInt32(key)
  local indexMap = PaGlobal_Option._list2._tree2IndexMap[idx]
  local categoryBar = UI.getChildControl(contents, "RadioButton_MenuName")
  local categorySubBar = UI.getChildControl(contents, "RadioButton_SubMenuName")
  categoryBar:SetShow(true)
  categoryBar:setNotImpactScrollEvent(true)
  categorySubBar:SetShow(false)
  if indexMap._isMain then
    categoryBar:SetText(indexMap._string)
    categoryBar:addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedMainCategory(" .. idx .. ", " .. " \"" .. indexMap._category .. "\"" .. ")")
    categoryBar:SetCheck(PaGlobal_Option._list2._selectedKey == idx)
  else
    categoryBar:SetShow(false)
    categorySubBar:SetShow(true)
    categorySubBar:SetText(indexMap._string)
    categorySubBar:addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedSubCategory(" .. idx .. ", " .. "\"" .. indexMap._category .. "\"" .. ", " .. "\"" .. indexMap._detail .. "\"" .. ")")
    categorySubBar:SetCheck(PaGlobal_Option._list2._selectedKey == idx)
  end
end
function PaGlobal_Option:Open()
  ClearFocusEdit()
  if isNeedGameOptionFromServer() == true then
    keyCustom_StartEdit()
  end
  local tree2 = self._ui._list2
  for key, value in pairs(self._list2._tree2IndexMap) do
    if value._isMain then
      local keyElement = tree2:getElementManager():getByKey(toInt64(0, key), false)
      keyElement:setIsOpen(false)
    end
  end
  tree2:getElementManager():refillKeyList()
  tree2:moveTopIndex()
  local defaultIndex = 1
  self:ClickedMainCategory(defaultIndex, self._list2._tree2IndexMap[1]._category)
  if nil ~= self._list2._tree2IndexMap[2]._detail and self._list2._tree2IndexMap[2]._category == self._list2._tree2IndexMap[1]._category then
    self:ClickedSubCategory(defaultIndex, self._list2._tree2IndexMap[2]._category, self._list2._tree2IndexMap[2]._detail)
  end
  Panel_Window_Option_Main:SetShow(true, true)
  Panel_Window_Option_Main:SetIgnore(false)
  audioPostEvent_SystemUi(1, 0)
end
function PaGlobal_Option:Close()
  setKeyCustomizing(false)
  SetUIMode(Defines.UIMode.eUIMode_Default)
  Panel_Window_Option_Main:SetShow(false, true)
  if Panel_Tooltip_SimpleText:GetShow() then
    TooltipSimple_Hide()
  end
  audioPostEvent_SystemUi(1, 0)
end
function PaGlobal_Option:ClickedCancelOption()
  for elementName, option in pairs(self._elements) do
    local check = false
    if nil ~= option._curValue and true == option._settingRightNow then
      check = true
    end
    if nil ~= option._applyValue then
      check = true
    end
    if true == check then
      self:SetXXX(option, option._initValue)
    end
  end
  audioPostEvent_SystemUi(1, 0)
  setAudioOptionByConfig()
  keyCustom_RollBack()
  self:CompleteKeyCustomMode()
  ClearFocusEdit()
end
function PaGlobal_Option:ClickedApplyOption()
  local displayChange = false
  for elementName, option in pairs(self._elements) do
    if OPTION_TYPE.KEYCUSTOMIZE == option._type then
      option._curValue = nil
    elseif nil ~= option._curValue then
      self:SetXXX(option, option._curValue)
      if true == option._isChangeDisplay then
        displayChange = true
      end
    end
  end
  if true == displayChange then
    self:DisplayChanged()
    self:Close()
    return
  end
  keyCustom_applyChange()
  keyCustom_StartEdit()
  saveGameOption(false)
  local selfPlayer = getSelfPlayer()
  if selfPlayer then
    selfPlayer:saveCurrentDataForGameExit()
  end
  ClearFocusEdit()
end
function PaGlobal_Option:ClickedConfirmOption()
  if isNeedGameOptionFromServer() == true then
    FGlobal_QuestWindowRateSetting()
    Panel_UIControl_SetShow(false)
  end
  self:ClickedApplyOption()
  self:Close()
end
function PaGlobal_Option:ClickedResetAllOption()
  ClearFocusEdit()
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ALLRESETCONFIRMMESSAGE")
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"),
    content = messageBoxMemo,
    functionYes = FGlobal_Option_ResetAllOption,
    functionNo = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData)
end
function FGlobal_Option_ResetAllOption()
  PaGlobal_Option._resetCheck = true
  PaGlobal_Option:ResetAlert()
  PaGlobal_Option:SetXXX("UseNewQuickSlot", PaGlobal_Option._elements.UseNewQuickSlot._defaultValue)
  resetAllOption()
  keyCustom_SetDefaultAction()
  keyCustom_SetDefaultUI()
  if true == ToClient_isXBox() then
    setConsoleKeyType(2)
    setConsoleKeySet(1)
  end
  PaGlobal_Option:ResetKeyCustomString()
  saveGameOption(false)
end
function PaGlobal_Option:ClickedResetFrame()
  if nil == self._list2._curCategory or nil == self._list2._curDetail then
    _PA_LOG("\237\155\132\236\167\132", "[GameOption][ClickedResetFrame] \237\152\132\236\158\172 \236\132\160\237\131\157\235\144\156 \237\148\132\235\160\136\236\158\132\236\157\180 \236\151\134\236\138\181\235\139\136\235\139\164. \236\150\180\235\148\148\236\132\156 \237\149\168\236\136\152\235\165\188 \235\182\136\235\160\128\235\138\148\236\167\128 \237\153\149\236\157\184\237\149\180\236\163\188\236\132\184\236\154\148.")
    return
  end
  ClearFocusEdit()
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_NEWGAMEOPTION_CAUTION_RESET")
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"),
    content = messageBoxMemo,
    functionYes = FGlobal_Option_ResetFrame,
    functionNo = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData)
end
function FGlobal_Option_ResetFrame()
  local self = PaGlobal_Option
  local resetElements = self._frames[self._list2._curCategory][self._list2._curDetail]._containElement
  local isKeyCustomReset = false
  local rv
  for index, elementName in ipairs(resetElements) do
    local option = self._elements[elementName]
    if nil ~= option then
      if nil ~= option.actionInputType or nil ~= option.uiInputType then
        self:KeyCustomResetFrame(option)
        isKeyCustomReset = true
      elseif nil ~= option._defaultValue then
        local beforeOption = self:Get(elementName)
        self:ResetControlSetting(elementName)
        rv = self:SetXXX(elementName, option._defaultValue)
        if false == rv then
          self:SetControlSetting(elementName, beforeOption)
          option._initValue = beforeOption
        else
          option._initValue = option._defaultValue
        end
        option._applyValue = nil
        option._curValue = nil
      end
    end
  end
  if true == isKeyCustomReset then
    PaGlobal_Option:ResetKeyCustomString()
  end
  self:ApplyButtonEnable(false)
end
function PaGlobal_Option:KeyCustomResetFrame(option)
  if nil == option then
    return
  end
  if nil ~= option.actionInputType then
    if "PadFunction1" == option.actionInputType then
      keyCustom_SetDefaultPadFunc1()
    elseif "PadFunction2" == option.actionInputType then
      keyCustom_SetDefaultPadFunc2()
    else
      keyCustom_SetDefaultActionData(option.actionInputType)
    end
    return
  elseif nil ~= option.uiInputType then
    keyCustom_SetDefaultUIData(option.uiInputType)
    return
  end
end
function PaGlobal_Option:ResetAlert()
  for _, index in pairs(self.ALERT) do
    ToClient_SetMessageFilter(index, false)
  end
end
function PaGlobal_Option:DisplayChanged()
  local messageboxData = {
    title = "changeDisplay",
    content = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_DISPLAYCOMMIT_COMMENT"),
    functionApply = FGlobal_Option_ChangeDisplayApply,
    functionCancel = FGlobal_Option_ChangeDisplayCancel,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW,
    isTimeCount = true,
    countTime = 10,
    timeString = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_DISPLAYCOMMIT_TIMELEFT"),
    isStartTimer = true,
    afterFunction = FGlobal_Option_ChangeDisplayTimeOut
  }
  allClearMessageData()
  MessageBox.showMessageBox(messageboxData)
end
function FGlobal_Option_ChangeDisplayTimeOut()
  if true == MessageBox.isPopUp() then
    messageBox_CancelButtonUp()
  end
end
function FGlobal_Option_ChangeDisplayApply()
  if isNeedGameOptionFromServer() == true then
    FGlobal_QuestWindowRateSetting()
  end
  keyCustom_applyChange()
  keyCustom_StartEdit()
  PaGlobal_Option:ApplyButtonEnable(false)
  saveGameOption(true)
  reloadGameUI()
end
function FGlobal_Option_ChangeDisplayCancel()
  PaGlobal_Option:SetXXX("ScreenResolution", PaGlobal_Option._elements.ScreenResolution._initValue)
  PaGlobal_Option:SetXXX("UIScale", PaGlobal_Option._elements.UIScale._initValue)
  PaGlobal_Option:SetXXX("ScreenMode", PaGlobal_Option._elements.ScreenMode._initValue)
end
function FGlobal_Option_TogglePanel()
  if CppEnums.EProcessorInputMode.eProcessorInputMode_ChattingInputMode == UI.Get_ProcessorInputMode() then
    return
  end
  if GetUIMode() == Defines.UIMode.eUIMode_Gacha_Roulette then
    return
  end
  if false == PaGlobal_Option:isOpen() then
    PaGlobal_Option:Open()
  else
    PaGlobal_Option:Close()
  end
end
function FGlobal_Option_OnScreenResize()
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  Panel_Window_Option_Main:SetPosX((screenSizeX - Panel_Window_Option_Main:GetSizeX()) / 2)
  Panel_Window_Option_Main:SetPosY((screenSizeY - Panel_Window_Option_Main:GetSizeY()) / 2)
end
function FGlobal_PerFrameFPSTextUpdate()
  local value = math.floor(ToClient_getFPS())
  for index, control in ipairs(PaGlobal_Option._fpsTextControl) do
    if value < 20 then
      control:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_FPS") .. ": " .. "<PAColor0xfff25221>" .. tostring(value) .. "<PAOldColor>")
    else
      control:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_FPS") .. ": " .. "<PAColor0xff00f281>" .. tostring(value) .. "<PAOldColor>")
    end
  end
end
function PaGlobal_Option:SaveCutsomOption(index)
  self._curCustomOption = index
  local messageBoxMemo = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NEWGAMEOPTION_MESSAGEBOX_CUSTOM_SAVE_DESC" .. tostring(index))
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NEWGAMEOPTION_MESSAGEBOX_CUSTOM_TITLE"),
    content = messageBoxMemo,
    functionYes = FGlobal_Option_SaveCustomOption,
    functionNo = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData)
  ClearFocusEdit()
end
function FGlobal_Option_SaveCustomOption()
  local result = ToClient_saveCustimizeOption(PaGlobal_Option._curCustomOption)
end
function PaGlobal_Option:LoadCutsomOption(index)
  if not IsSelfPlayerWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_NOTCURRENTACTION_ACK"))
    return
  end
  self._curCustomOption = index
  local messageBoxMemo = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NEWGAMEOPTION_MESSAGEBOX_CUSTOM_LOAD_DESC" .. tostring(index))
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NEWGAMEOPTION_MESSAGEBOX_CUSTOM_TITLE"),
    content = messageBoxMemo,
    functionYes = FGlobal_Option_LoadCustomOption,
    functionNo = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData)
  ClearFocusEdit()
end
function FGlobal_Option_LoadCustomOption()
  local fontsize = PaGlobal_Option:Get("UIFontSizeType")
  local index = PaGlobal_Option._curCustomOption
  local result = ToClient_loadCustimizeOption(index)
  if true == result then
    for _, icon in pairs(PaGlobal_Option._ui._customLoadConfirmIcon) do
      icon:SetShow(false)
    end
    PaGlobal_Option._ui._customLoadConfirmIcon[index]:SetShow(true)
    if nil ~= PaGlobal_Option._elements.UIFontSizeType and fontsize ~= PaGlobal_Option._elements.UIFontSizeType._initValue then
      PaGlobal_Option:SetXXX("UIFontSizeType", PaGlobal_Option._elements.UIFontSizeType._initValue)
    end
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NEWGAMEOPTION_MESSAGEBOX_CUSTOM_NOLOAD"))
  end
end
function FromClient_ChangeScreenMode()
  reloadGameUI()
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_CHANGESCREENMODE_FULL")
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY"),
    content = messageBoxMemo,
    functionYes = ToClient_ChangePreScreenMode,
    functionNo = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData)
end
function FromClient_Option_PadSnapChangeTarget(fromControl, toControl)
  if false == FGlobal_Option_GetShow() then
    return
  end
  local aButton = UI.getChildControl(PaGlobal_Option._ui._bottomBg, "StaticText_A_ConsoleUI")
  if nil ~= toControl and toControl:GetType() == CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_SLIDER then
    aButton:SetShow(false)
    return
  end
  aButton:SetShow(true)
end
Panel_Window_Option_Main:RegisterUpdateFunc("FGlobal_PerFrameFPSTextUpdate")
registerEvent("EventGameOptionToggle", "FGlobal_Option_TogglePanel")
registerEvent("onScreenResize", "FGlobal_Option_OnScreenResize")
registerEvent("FromClient_ChangeScreenMode", "FromClient_ChangeScreenMode")
registerEvent("FromClient_PadSnapChangeTarget", "FromClient_Option_PadSnapChangeTarget")
function PaGlobal_Option:CheckEnableSimpleUI()
  local selfPlayer = getSelfPlayer()
  if nil ~= selfPlayer then
    if 5 < selfPlayer:get():getLevel() then
      PaGlobal_Option:SetMonoTone("EnableSimpleUI", false)
      PaGlobal_Option:SetEnable("EnableSimpleUI", true)
    else
      PaGlobal_Option:SetMonoTone("EnableSimpleUI", true)
      PaGlobal_Option:SetEnable("EnableSimpleUI", false)
    end
  else
    PaGlobal_Option:SetMonoTone("EnableSimpleUI", true)
    PaGlobal_Option:SetEnable("EnableSimpleUI", false)
  end
end
function FGlobal_GameOption_OpenByMenu(index)
  showGameOption()
  if 0 == index then
    PaGlobal_Option:MoveUi(PaGlobal_Option.UIMODE.Category)
    PaGlobal_Option:GoCategory("Graphic", "Quality")
  elseif 1 == index then
    PaGlobal_Option:MoveUi(PaGlobal_Option.UIMODE.Category)
    PaGlobal_Option:GoCategory("Sound", "OnOff")
  elseif 2 == index then
    PaGlobal_Option:MoveUi(PaGlobal_Option.UIMODE.Category)
    PaGlobal_Option:GoCategory("Function", "Convenience")
  elseif 3 == index then
    PaGlobal_Option:MoveUi(PaGlobal_Option.UIMODE.Category)
    PaGlobal_Option:GoCategory("Interface", "Action")
  elseif 4 == index then
    PaGlobal_Option:MoveUi(PaGlobal_Option.UIMODE.Category)
    PaGlobal_Option:GoCategory("Interface", "UI")
  elseif 5 == index then
    PaGlobal_Option:MoveUi(PaGlobal_Option.UIMODE.Category)
    PaGlobal_Option:GoCategory("Performance", "Optimize")
  end
end
function FGlobal_GameOptionOpen()
  if false == PaGlobal_Option:isOpen() then
    showGameOption()
  end
  PaGlobal_Option:MoveUi(PaGlobal_Option.UIMODE.Category)
  PaGlobal_Option:GoCategory("Function", "Nation")
end
function FGlobal_GetCurrentLUT()
  local gameOptionSetting = ToClient_getGameOptionControllerWrapper()
  return PaGlobal_Option._elements.LUT:get(gameOptionSetting)
end
function FGlobal_IsChecked_SkillCommand()
  return isChecked_SkillCommand
end
function GameOption_GetHideWindow()
  local gameOptionSetting = ToClient_getGameOptionControllerWrapper()
  return PaGlobal_Option._elements.HideWindowByAttacked:get(gameOptionSetting)
end
function GameOption_ShowGuildLoginMessage()
  local gameOptionSetting = ToClient_getGameOptionControllerWrapper()
  return PaGlobal_Option._elements.ShowGuildLoginMessage:get(gameOptionSetting)
end
function GameOption_GetShowStackHp()
  local gameOptionSetting = ToClient_getGameOptionControllerWrapper()
  return PaGlobal_Option._elements.ShowStackHp:get(gameOptionSetting)
end
function GameOption_UpdateOptionChanged()
end
function GameOption_Cancel()
  PaGlobal_Option:Close()
end
function FGlobal_SpiritGuide_IsShow()
  local gameOptionSetting = ToClient_getGameOptionControllerWrapper()
  return PaGlobal_Option._elements.ShowComboGuide:get(gameOptionSetting)
end
function FGlobal_getUIScale()
  local uiScale = {}
  uiScale.min = 50
  uiScale.max = 200
  return uiScale
end
function FGlobal_returnUIScale()
  local interval = PaGlobal_Option._elements.UIScale._sliderValueMax - PaGlobal_Option._elements.UIScale._sliderValueMin
  local convertedValue = (PaGlobal_Option._elements.UIScale._sliderValueMin + interval * PaGlobal_Option:Get("UIScale")) * 0.01
  convertedValue = math.floor((convertedValue + 0.002) * 100) / 100
  return convertedValue
end
function FGlobal_saveUIScale(scale)
  local sliderValue = PaGlobal_Option:FromRealValueToSliderValue(scale, 0.5, 2)
  if sliderValue >= 1 then
    return
  end
end
function getUiFontSize()
  local gameOptionSetting = ToClient_getGameOptionControllerWrapper()
  return PaGlobal_Option._elements.UIFontSizeType:get(gameOptionSetting)
end
function SimpleUI_Check(simpleUI_Check)
  local selfPlayer = getSelfPlayer()
  if nil ~= selfPlayer and 6 == selfPlayer:get():getLevel() then
    PaGlobal_Option:SetXXX(PaGlobal_Option._elements.EnableSimpleUI, simpleUI_Check)
  end
end
function GameOption_SetUIMode(uiScale)
  local uiScaleOption = PaGlobal_Option._elements.UIScale
  uiScaleOption._initValue = PaGlobal_Option:FromRealValueToSliderValue(uiScale, 0.5, 2)
end
function ResetKeyCustombyAttacked()
  if Panel_Window_Option_Main:GetShow() then
    setKeyCustomizing(false)
    SetUIMode(Defines.UIMode.eUIMode_Default)
  end
end
function GameOption_ComboGuideValueChange(isShow)
end
