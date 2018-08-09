local CONTROL = CppEnums.PA_UI_CONTROL_TYPE
function PaGlobal_Option:CheckAvailableCategory(category)
  local count = 0
  for detailName, detail in pairs(PaGlobal_Option._frames[category]) do
    if self:CheckAvailableDetail(category, detailName) then
      count = count + 1
    end
  end
  return count > 0
end
function PaGlobal_Option:CheckAvailableDetail(category, detail)
  local count = 0
  for index, option in ipairs(PaGlobal_Option._frames[category][detail]) do
    if true == option._contentsOption or nil == option._contentsOption then
      count = count + 1
    end
  end
  return count > 0
end
function PaGlobal_Option:CreateControl_RadioButton(cacheNo, order, option)
  if nil ~= self._controlCache[OPTION_TYPE.RADIOBUTTON][cacheNo] then
    local MaxRadioButton = 20
    local groupTemplate = UI.getChildControl(self._ui._frameContent, "Static_TemplateRadioBtnGroup")
    local radioButtonTemplate = UI.getChildControl(groupTemplate, "RadioButton_Template")
    local xIndex = 0
    local yIndex = 0
    local radioButton
    for ii = 0, MaxRadioButton do
      if ii < option._radioButtonMapping._count then
        xIndex = ii % 3
        yIndex = math.floor(ii / 3)
        radioButton = UI.getChildControlNoneAssert(self._controlCache[OPTION_TYPE.RADIOBUTTON][cacheNo], "RadioButton_" .. tostring(ii))
        if nil == radioButton then
          radioButton = UI.cloneControl(radioButtonTemplate, self._controlCache[OPTION_TYPE.RADIOBUTTON][cacheNo], "RadioButton_" .. tostring(ii))
        end
        radioButton:addInputEvent("Mouse_LUp", "PaGlobal_Option:EventXXX( \"" .. tostring("RadioButton_" .. option._name) .. "\", " .. tostring(cacheNo) .. ", " .. tostring(ii) .. ")")
        radioButton:SetPosX(radioButtonTemplate:GetPosX() + xIndex * 270)
        radioButton:SetPosY(radioButtonTemplate:GetPosY() + yIndex * 50)
        radioButton:SetShow(true)
      else
        radioButton = UI.getChildControlNoneAssert(self._controlCache[OPTION_TYPE.RADIOBUTTON][cacheNo], "RadioButton_" .. tostring(ii))
        if nil == radioButton then
          break
        else
          radioButton:SetShow(false)
        end
      end
    end
    self._controlCache[OPTION_TYPE.RADIOBUTTON][cacheNo]:SetSize(groupTemplate:GetSizeX(), groupTemplate:GetSizeY() + 50 * yIndex)
  else
    local groupTemplate = UI.getChildControl(self._ui._frameContent, "Static_TemplateRadioBtnGroup")
    local group = UI.cloneControl(groupTemplate, self._ui._frameContent, "Static_RadioButtonGroup" .. tostring(cacheNo))
    local radioButtonTemplate = UI.getChildControl(group, "RadioButton_Template")
    local posX = radioButtonTemplate:GetPosX()
    local posY = radioButtonTemplate:GetPosY()
    local groupSizeY = group:GetSizeY()
    local xIndex = 0
    local yIndex = 0
    for ii = 0, option._radioButtonMapping._count - 1 do
      xIndex = ii % 3
      yIndex = math.floor(ii / 3)
      local raidoButton = UI.cloneControl(radioButtonTemplate, group, "RadioButton_" .. tostring(ii))
      raidoButton:addInputEvent("Mouse_LUp", "PaGlobal_Option:EventXXX(\"" .. tostring("RadioButton_" .. option._name) .. "\", " .. tostring(cacheNo) .. ", " .. tostring(ii) .. ")")
      raidoButton:SetPosX(posX + xIndex * 270)
      raidoButton:SetPosY(posY + yIndex * 50)
      raidoButton:SetShow(true)
    end
    group:SetSize(group:GetSizeX(), groupSizeY + 50 * yIndex)
    self._controlCache[OPTION_TYPE.RADIOBUTTON][cacheNo] = group
  end
  return self._controlCache[OPTION_TYPE.RADIOBUTTON][cacheNo]
end
function PaGlobal_Option:CreateControl_Slider(cacheNo, order, option)
  if nil ~= self._controlCache[OPTION_TYPE.SLIDER][cacheNo] then
    local sliderTemplate = UI.getChildControl(self._controlCache[OPTION_TYPE.SLIDER][cacheNo], "Slider_Template")
    sliderTemplate:addInputEvent("Mouse_LPress", "PaGlobal_Option:EventXXX(\"" .. tostring("Slider_" .. tostring(option._name)) .. "\" ," .. tostring(cacheNo) .. ")")
  else
    local groupTemplate = UI.getChildControl(self._ui._frameContent, "Static_TemplateSliderGroup")
    local group = UI.cloneControl(groupTemplate, self._ui._frameContent, "Static_SliderGroup" .. tostring(cacheNo))
    local sliderTemplate = UI.getChildControl(group, "Slider_Template")
    sliderTemplate:addInputEvent("Mouse_LPress", "PaGlobal_Option:EventXXX(\"" .. tostring("Slider_" .. tostring(option._name)) .. "\" ," .. tostring(cacheNo) .. ")")
    sliderTemplate:SetShow(true)
    self._controlCache[OPTION_TYPE.SLIDER][cacheNo] = group
  end
  return self._controlCache[OPTION_TYPE.SLIDER][cacheNo]
end
function PaGlobal_Option:CreateControl_CheckButton(cacheNo, order, option)
  if nil ~= self._controlCache[OPTION_TYPE.CHECKBUTTON][cacheNo] then
    local checkButtonTemplate = UI.getChildControl(self._controlCache[OPTION_TYPE.CHECKBUTTON][cacheNo], "CheckButton_Template")
    checkButtonTemplate:addInputEvent("Mouse_LUp", "PaGlobal_Option:EventXXX(\"" .. tostring("CheckButton_" .. tostring(option._name)) .. "\" ," .. tostring(cacheNo) .. ")")
  else
    local groupTemplate = UI.getChildControl(self._ui._frameContent, "Static_TemplateCheckBtnGroup")
    local group = UI.cloneControl(groupTemplate, self._ui._frameContent, "Static_CheckButtonGroup" .. tostring(cacheNo))
    local checkButtonTemplate = UI.getChildControl(group, "CheckButton_Template")
    checkButtonTemplate:addInputEvent("Mouse_LUp", "PaGlobal_Option:EventXXX(\"" .. tostring("CheckButton_" .. tostring(option._name)) .. "\" ," .. tostring(cacheNo) .. ")")
    checkButtonTemplate:SetShow(true)
    self._controlCache[OPTION_TYPE.CHECKBUTTON][cacheNo] = group
  end
  return self._controlCache[OPTION_TYPE.CHECKBUTTON][cacheNo]
end
function PaGlobal_Option:CreateControl_KeyCustomizeButton(cacheNo, order, option)
  if nil ~= self._controlCache[OPTION_TYPE.KEYCUSTOMIZE][cacheNo] then
    local buttonTemplate = UI.getChildControl(self._controlCache[OPTION_TYPE.KEYCUSTOMIZE][cacheNo], "CheckButton_Template")
    buttonTemplate:addInputEvent("Mouse_LUp", "PaGlobal_Option:EventXXX(\"" .. tostring("KeyCustomize_" .. tostring(option._name)) .. "\" ," .. tostring(cacheNo) .. ")")
  else
    local groupTemplate = UI.getChildControl(self._ui._frameContent, "Static_TemplateCheckBtnGroup")
    local group = UI.cloneControl(groupTemplate, self._ui._frameContent, "Static_KeyCustomizeButtonGroup" .. tostring(cacheNo))
    local buttonTemplate = UI.getChildControl(group, "CheckButton_Template")
    buttonTemplate:addInputEvent("Mouse_LUp", "PaGlobal_Option:EventXXX(\"" .. tostring("KeyCustomize_" .. tostring(option._name)) .. "\" ," .. tostring(cacheNo) .. ")")
    buttonTemplate:SetShow(true)
    self._controlCache[OPTION_TYPE.CHECKBUTTON][cacheNo] = group
  end
  return self._controlCache[OPTION_TYPE.CHECKBUTTON][cacheNo]
end
function PaGlobal_Option:SetTitleAndDescription(groupBg, option)
  if nil == groupBg then
    _PA_LOG("\237\155\132\236\167\132", "caching \236\157\180 \236\158\152\235\170\187\235\144\152\236\151\136\236\138\181\235\139\136\235\139\164.")
    return
  end
  local title = UI.getChildControl(groupBg, "StaticText_Title")
  local desc = UI.getChildControl(groupBg, "StaticText_Desc")
  title:SetText(PAGetString(Defines.StringSheet_RESOURCE, option._title))
  desc:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  desc:SetText(PAGetString(Defines.StringSheet_RESOURCE, option._desc))
  if option._type == OPTION_TYPE.RADIOBUTTON then
    for ii = 0, option._radioButtonMapping._count - 1 do
      local radioButton = UI.getChildControl(groupBg, "RadioButton_" .. tostring(ii))
      if nil == option._radioButtonMapping[ii] or nil == option._radioButtonMapping[ii]._string then
        _PA_LOG("\237\155\132\236\167\132", " \235\157\188\235\148\148\236\152\164 \235\178\132\237\138\188 \236\132\184\237\140\133\236\157\132 \237\153\149\236\157\184\237\149\180\236\149\188 \237\149\169\235\139\136\235\139\164.")
        radioButton:SetText("button_" .. tostring(ii))
      else
        radioButton:SetText(PAGetString(Defines.StringSheet_RESOURCE, option._radioButtonMapping[ii]._string))
      end
    end
  end
end
function PaGlobal_Option:CreateFrameException(category, detail)
  if "HDR" == detail and getHdrDiplayEnable() then
    if nil == self._controlCache[OPTION_TYPE.OTHER].HDR then
      local groupTemplate = UI.getChildControl(Panel_Window_Option_Main, "Static_HDR_ImageBgs")
      local group = UI.cloneControl(groupTemplate, self._ui._frameContent, "Static_HDR_ImageBgs_Clone")
      self._controlCache[OPTION_TYPE.OTHER].HDR = group
    end
    self._controlCache[OPTION_TYPE.OTHER].HDR:SetShow(true)
    return self._controlCache[OPTION_TYPE.OTHER].HDR:GetSizeY() + 20
  end
  return 0
end
function PaGlobal_Option:CreateFrame(category, detail)
  local radioButtonCacheNo = 0
  local checkButtonCacheNo = 0
  local sliderCacheNo = 0
  local keyCustomizeCacheNo = 0
  for index, cacheGroup in pairs(self._controlCache) do
    for index2, cacheControl in pairs(self._controlCache[index]) do
      cacheControl:SetShow(false)
    end
  end
  local offset = self:CreateFrameException(category, detail)
  local frameInfo = PaGlobal_Option._frames[category][detail]
  local tempPosY = offset
  for index, option in ipairs(frameInfo) do
    if true == option._contentsOption or nil == option._contentsOption then
      local eventControlBg
      if OPTION_TYPE.RADIOBUTTON == option._element._type then
        eventControlBg = self:CreateControl_RadioButton(radioButtonCacheNo, index, option._element)
        radioButtonCacheNo = radioButtonCacheNo + 1
      elseif OPTION_TYPE.SLIDER == option._element._type then
        eventControlBg = self:CreateControl_Slider(sliderCacheNo, index, option._element)
        sliderCacheNo = sliderCacheNo + 1
      elseif OPTION_TYPE.CHECKBUTTON == option._element._type then
        eventControlBg = self:CreateControl_CheckButton(checkButtonCacheNo, index, option._element)
        checkButtonCacheNo = checkButtonCacheNo + 1
      elseif OPTION_TYPE.KEYCUSTOMIZE == option._element._type then
        eventControlBg = self:CreateControl_KeyCustomizeButton(keyCustomizeCacheNo, index, option._element)
        keyCustomizeCacheNo = keyCustomizeCacheNo + 1
      end
      if nil == eventControlBg then
        _PA_LOG("\237\155\132\236\167\132", "caching \236\157\180 \236\158\152\235\170\187\235\144\152\236\151\136\236\138\181\235\139\136\235\139\164.")
      end
      self:SetTitleAndDescription(eventControlBg, option._element)
      eventControlBg:SetShow(true)
      eventControlBg:SetPosY(tempPosY)
      tempPosY = tempPosY + eventControlBg:GetSizeY()
      local value = option._element._initValue
      if nil ~= option._element._curValue then
        value = option._element._curValue
      elseif nil ~= option._element._applyValue then
        value = option._element._applyValue
      end
      if nil ~= value then
        self:SetControlSetting(eventControlBg, option._element, value)
      end
    end
  end
  self._ui._frameContent:SetSize(self._ui._frameContent:GetSizeX(), tempPosY)
  self._ui._frame:UpdateContentScroll()
  self._ui._frame:GetVScroll():SetControlTop()
  self._ui._frame:UpdateContentPos()
  ToClient_padSnapRefreshTarget(self._ui._frameContent)
  ToClient_padSnapSetTargetGroup(self._ui._frame)
  ToClient_padSnapResetControl()
end
function PaGlobal_Option:RemoveEventControl()
end
function PaGlobal_Option:SetXXX(option, value)
  if nil == value then
    return false
  end
  local executeResult = option:set(value)
  if false == executeResult then
    return false
  end
  opiton._applyValue = value
  opiton._curValue = nil
end
function PaGlobal_Option:EventXXX(controlName, cacheNo, order)
  local strsplit = string.split(controlName, "_")
  if nil == strsplit[1] or nil == strsplit[2] then
    _PA_LOG("\237\155\132\236\167\132", "[EventXXX][ RETURN ] control\236\157\152 \235\178\132\237\138\188 \236\157\180\235\178\164\237\138\184\234\176\128 \236\158\152\235\170\187\235\144\152\236\151\136\236\138\181\235\139\136\235\139\164. ControlName\236\157\132 \237\153\149\236\157\184\237\149\180\236\163\188\236\132\184\236\154\148. : " .. elementName)
    return
  end
  local controlTypeName = strsplit[1]
  local elementName = strsplit[2]
  local option = self._elements[elementName]
  if "table" ~= type(option) then
    _PA_LOG("\237\155\132\236\167\132", "[EventXXX][ RETURN ] element \234\176\128 \237\133\140\236\157\180\235\184\148\236\157\180 \236\149\132\235\139\153\235\139\136\235\139\164. Header \235\165\188 \237\153\149\236\157\184\237\149\180\236\163\188\236\132\184\236\154\148.  : " .. elementName)
    return
  end
  local beforeValue = option._curValue
  local type = self:GetControlTypeByControlName(controlTypeName)
  local groupBg
  if OPTION_TYPE.CHECKBUTTON == type then
    groupBg = self._controlCache[OPTION_TYPE.CHECKBUTTON][cacheNo]
    local checkButton = UI.getChildControl(groupBg, "CheckButton_Template")
    option._curValue = checkButton:IsCheck()
  elseif OPTION_TYPE.KEYCUSTOMIZE == type and (nil ~= option.actionInputType or nil ~= option.uiInputType) then
    self:SetKeyCustomMode(elementName)
  elseif OPTION_TYPE.RADIOBUTTON == type then
    groupBg = self._controlCache[OPTION_TYPE.RADIOBUTTON][cacheNo]
    option._curValue = order
  elseif OPTION_TYPE.SLIDER == type then
    groupBg = self._controlCache[OPTION_TYPE.SLIDER][cacheNo]
    local slider = UI.getChildControl(groupBg, "Slider_Template")
    option._curValue = slider:GetControlPos()
  else
    _PA_LOG("\237\155\132\236\167\132", "[EventXXX][ RETURN ] \235\172\180\236\138\168 Control \236\157\184\236\167\128 \235\170\168\235\165\180\234\178\160\236\138\181\235\139\136\235\139\164. : " .. elementName)
    return
  end
  if nil == option._curValue then
    return
  end
  self:SetControlSetting(groupBg, option, option._curValue)
  local tempCurValue = option._curValue
  self:SetXXX(option, option._curValue)
  option._curValue = tempCurValue
  option._applyValue = nil
end
function PaGlobal_Option:SetControlSetting(groupBg, option, value)
  if OPTION_TYPE.CHECKBUTTON == option._type then
    local checkButton = UI.getChildControl(groupBg, "CheckButton_Template")
    checkButton:SetCheck(value)
    if checkButton:IsCheck() then
      checkButton:SetText("ON")
    else
      checkButton:SetText("OFF")
    end
  elseif OPTION_TYPE.RADIOBUTTON == option._type then
    for ii = 0, option._radioButtonMapping._count - 1 do
      local radioButton = UI.getChildControl(groupBg, "RadioButton_" .. tostring(ii))
      radioButton:SetCheck(value == ii)
    end
  elseif OPTION_TYPE.SLIDER == option._type then
    local slider = UI.getChildControl(groupBg, "Slider_Template")
    slider:SetControlPos(value * 100)
    local displayButton = UI.getChildControl(slider, "Slider_DisplayButton")
    displayButton:SetPosX(slider:GetControlButton():GetPosX())
    displayButton:SetPosY(slider:GetControlButton():GetPosY())
    local progress = UI.getChildControl(slider, "Progress2_1")
    local offset = math.cos(value * math.pi) * 2
    progress:SetProgressRate(value * 100 + offset)
    local displayValue = self:FromSliderValueToRealValue(value, option._sliderValueMin, option._sliderValueMax)
    displayValue = math.floor(displayValue + 0.5)
    local sliderCurrentText = UI.getChildControl(groupBg, "StaticText_Current")
    sliderCurrentText:SetText(self._sliderButtonString .. displayValue .. "<PAOldColor>")
  elseif OPTION_TYPE.KEYCUSTOMIZE == option._type then
    local button = UI.getChildControl(groupBg, "CheckButton_Template")
    button:SetText(value)
  end
end
function PaGlobal_Option:ResetControlSetting(elementName)
  local option = self._elements[elementName]
  self:ResetControlSettingTable(option, elementName)
end
function PaGlobal_Option:ResetControlSettingTable(option, elementName)
  if nil == elementName then
    elementName = ""
  end
  if "table" ~= type(option) then
    return
  end
  if nil == option._eventControl then
    return
  end
  if OPTION_TYPE.CHECKBUTTON == option._type then
    for i, eventControl in pairs(option._eventControl) do
      eventControl:SetCheck(false)
    end
  elseif OPTION_TYPE.RADIOBUTTON == option._type then
    for i, eventControl in pairs(option._eventControl) do
      eventControl:SetCheck(false)
    end
    if nil == option._eventControlCount or option._eventControlCount < 1 then
      return
    end
    for index = 1, option._eventControlCount do
      for i, eventControl in pairs(option["_eventControl" .. index]) do
        eventControl:SetCheck(false)
      end
    end
  else
    if OPTION_TYPE.SLIDER == option._type then
      for i, eventControl in pairs(option._eventControl) do
        eventControl:SetControlPos(50)
      end
    else
    end
  end
end
function PaGlobal_Option:SearchOption(inputString)
  local findTable = {}
  for index, option in pairs(self._elements) do
    local rv
    if nil == option._string then
      _PA_LOG("\237\155\132\236\167\132", "[SearchOption][ RETURN ] option \236\151\144 string\236\157\180 \236\132\164\236\160\149\235\144\152\236\167\128 \236\149\138\236\149\152\236\138\181\235\139\136\235\139\164. GameOptionHeader\236\151\144 \236\132\164\236\160\149\236\157\180 \235\144\152\236\150\180\236\158\136\235\138\148\236\167\128 \237\153\149\236\157\184\237\149\180\236\163\188\236\132\184\236\154\148. ")
    else
      rv = string.find(string.lower(option._string), string.lower(inputString))
    end
    if nil == option._category or nil == option._detail then
      _PA_LOG("\237\155\132\236\167\132", "[SearchOption][ RETURN ] option \236\151\144 \236\185\180\237\133\140\234\179\160\235\166\172\234\176\128 \236\132\164\236\160\149\235\144\152\236\167\128 \236\149\138\236\149\152\236\138\181\235\139\136\235\139\164. CreateEventControl \236\151\144\236\132\156 \236\158\152\235\170\187\235\144\152\236\151\136\236\138\181\235\139\136\235\139\164." .. index)
      rv = nil
    end
    if nil ~= rv then
      for order, v in pairs(option._category) do
        findTable[#findTable + 1] = {
          _elementString = option._string,
          _category = option._category[order],
          _detail = option._detail[order],
          _isScrollEnd = option._isScrollEnd[order]
        }
      end
    end
  end
  return findTable
end
function PaGlobal_Option:EventXXXException(elementName, value, beforeValue)
  if nil == self._elements[elementName].EventException then
    return
  end
  self._elements[elementName]:EventException(value, beforeValue)
end
function PaGlobal_Option._elements.ServiceResourceType:EventException(value)
  local serviceResourceType = PaGlobal_Option:radioButtonMapping_ServiceResourceType(value)
  local chatChannelType = PaGlobal_Option._elements.ChatChannelType
  if CppEnums.ServiceResourceType.eServiceResourceType_SP == serviceResourceType then
    chatChannelType._curValue = PaGlobal_Option:radioButtonMapping_ChatChannelType(CppEnums.LangType.LangType_SP, true)
  else
    chatChannelType._curValue = PaGlobal_Option:radioButtonMapping_ChatChannelType(serviceResourceType, true)
  end
  PaGlobal_Option:ResetControlSettingTable(chatChannelType)
  PaGlobal_Option:SetControlSettingTable(chatChannelType, chatChannelType._curValue)
  local messageboxData = {
    title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"),
    content = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_LANGUAGESETTING"),
    functionApply = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageboxData)
end
function PaGlobal_Option._elements.AudioResourceType:EventException(value)
  local messageboxData = {
    title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"),
    content = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_NPCVOICE_RESTART"),
    functionApply = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageboxData)
end
function PaGlobal_Option._elements.ChatChannelType:EventException(value)
  local messageboxData = {
    title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"),
    content = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_LANGUAGESETTING"),
    functionApply = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageboxData)
end
function PaGlobal_Option._elements.GraphicOption:EventException(value, beforeValue)
  local GraphicEnum = PaGlobal_Option.GRAPHIC
  if nil == self._curValue then
    PaGlobal_Option:SetGraphicOption(self._curValue)
  else
    if nil == beforeValue then
      beforeValue = self._initValue
    end
    if beforeValue == value then
      PaGlobal_Option:SetGraphicOption(self._curValue)
    end
    local isIncrease = value > beforeValue
    if GraphicEnum.VeryVeryLow == value then
      isIncrease = false
    end
    if GraphicEnum.VeryVeryLow == beforeValue then
      isIncrease = true
    end
    PaGlobal_Option:SetGraphicOption(value, isIncrease)
  end
end
function PaGlobal_Option:KeyCustomInitValue()
  for elementName, element in pairs(self._elements) do
    element._initValue = self:KeyCustomGetString(elementName)
  end
end
function PaGlobal_Option:GetKeyCustomInputType()
  if nil == self._keyCustomInputType then
    _PA_LOG("\237\155\132\236\167\132", "[GetKeyCustomInputType][ RETURN ] \236\157\180\236\131\129\237\149\152\235\139\164....")
    return
  end
  return self._keyCustomInputType[2] or nil
end
function PaGlobal_Option:SetKeyCustomMode(elementName)
  setKeyCustomizing(false)
  SetUIMode(Defines.UIMode.eUIMode_Default)
  self:ResetKeyCustomString()
  local option = self._elements[elementName]
  if nil ~= option.actionInputType then
    self._keyCustomInputType = {
      elementName,
      option.actionInputType
    }
    if "PadFunction1" == option.actionInputType then
      SetUIMode(Defines.UIMode.eUIMode_KeyCustom_ActionPadFunc1)
      return
    elseif "PadFunction2" == option.actionInputType then
      SetUIMode(Defines.UIMode.eUIMode_KeyCustom_ActionPadFunc2)
      return
    end
    if true == self._keyCustomPadMode then
      SetUIMode(Defines.UIMode.eUIMode_KeyCustom_ActionPad)
    else
      SetUIMode(Defines.UIMode.eUIMode_KeyCustom_ActionKey)
    end
    setKeyCustomizing(true)
  elseif nil ~= option.uiInputType then
    self._keyCustomInputType = {
      elementName,
      option.uiInputType
    }
    if true == self._keyCustomPadMode then
      SetUIMode(Defines.UIMode.eUIMode_KeyCustom_UiPad)
    else
      SetUIMode(Defines.UIMode.eUIMode_KeyCustom_UiKey)
    end
    setKeyCustomizing(true)
  end
end
function PaGlobal_Option:CompleteKeyCustomMode()
  if nil == self._keyCustomInputType then
    _PA_LOG("\237\155\132\236\167\132", "[CompleteKeyCustomMode][ RETURN ] \234\184\176\236\161\180 Option \236\176\189 \236\149\132\235\139\136\235\157\188\235\169\180 \236\157\180\236\131\129\237\149\152\235\139\164")
    return
  end
  local elementName = self._keyCustomInputType[1] or nil
  if nil == elementName then
    _PA_LOG("\237\155\132\236\167\132", "[CompleteKeyCustomMode][ RETURN ] \236\157\180\236\131\129\237\149\152\235\139\164")
    return
  end
  self._elements[elementName]._keyCustomInputType = nil
  self._elements[elementName]._curValue = ""
  self:ApplyButtonEnable(true)
  self:ResetControlSetting(elementName)
  self:ResetKeyCustomString()
end
function PaGlobal_Option:KeyCustomGetString(elementName)
  local option = self._elements[elementName]
  local keyCustomString
  if nil ~= option.uiInputType then
    if true == self._keyCustomPadMode then
      keyCustomString = keyCustom_GetString_UiPad(option.uiInputType)
    else
      keyCustomString = keyCustom_GetString_UiKey(option.uiInputType)
    end
  elseif nil ~= option.actionInputType then
    if "PadFunction1" == option.actionInputType then
      return keyCustom_GetString_ActionPadFunc1()
    end
    if "PadFunction2" == option.actionInputType then
      return keyCustom_GetString_ActionPadFunc2()
    end
    if true == self._keyCustomPadMode then
      keyCustomString = keyCustom_GetString_ActionPad(option.actionInputType)
    else
      keyCustomString = keyCustom_GetString_ActionKey(option.actionInputType)
    end
  end
  return keyCustomString
end
function PaGlobal_Option._functions.KeyCustomMode(value)
  local global = PaGlobal_Option
  local beforekeyCustomPadMode = global._keyCustomPadMode
  global._keyCustomPadMode = 1 == value
  if global._keyCustomPadMode == beforekeyCustomPadMode then
    return
  end
  global:ResetKeyCustomString()
end
function PaGlobal_Option:ResetKeyCustomString()
  for elementName, option in pairs(self._elements) do
    if nil ~= option.actionInputType or nil ~= option.uiInputType then
      self:SetControlSetting(elementName, self:KeyCustomGetString(elementName))
    end
  end
end
function PaGlobal_Option:Init()
  self:InitUi()
  self:ListInit()
end
function PaGlobal_Option:InitValue(gameOptionSetting)
  for name, option in pairs(self._elements) do
    option._curValue = nil
    option._applyValue = nil
    option._name = name
    if nil ~= option.get then
      option._initValue = option:get(gameOptionSetting)
    end
  end
end
function FGlobal_Option_InitializeOption(gameOptionSetting)
  PaGlobal_Option:InitValue(gameOptionSetting)
end
function FGlobal_Option_luaLoadComplete()
  PaGlobal_Option:Init()
  ToClient_initGameOption()
  if isNeedGameOptionFromServer() == true then
    keyCustom_StartEdit()
  end
  if true == ToClient_isXBox() then
    setConsoleKeySet(1)
  end
end
function FGlobal_Option_InitializeScreenResolution(availableScreenResolution)
  PaGlobal_Option._availableResolutionList = availableScreenResolution
end
function FromClient_RefreshGameOption(gameOptionSetting)
  PaGlobal_Option._resetCheck = false
  FGlobal_Option_InitializeOption(gameOptionSetting)
end
function FromClient_OtherPlayeUpdate(isEnable, isOption)
  local isShow = isEnable
  if true == isOption then
    isEnable = false == isEnable
  else
    PaGlobal_Option:SetControlSetting("UseOtherPlayerUpdate", not isEnable)
  end
  setUseOtherPlayerUpdate(isEnable)
  if isEnable then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_PLAYERHIDEOFF"))
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_PLAYERHIDEON"))
  end
end
function FromClient_CanChangeOptionAfterSec(sec)
  local msg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CANTCHANGE_TIERICONOPTION_COOLTIME", "sec", sec)
  if nil ~= msg and "" ~= msg then
    Proc_ShowMessage_Ack(msg)
  end
end
function FromClient_RefreshMaidOptionInfo(gameOptionSetting)
end
registerEvent("EventGameOptionInitGameOption", "FGlobal_Option_InitializeOption")
registerEvent("EventGameOptionInitDisplayModeList", "FGlobal_Option_InitializeScreenResolution")
registerEvent("FromClient_luaLoadComplete", "FGlobal_Option_luaLoadComplete")
registerEvent("FromClient_OtherPlayeUpdate", "FromClient_OtherPlayeUpdate")
registerEvent("FromClient_RefreshGameOption", "FromClient_RefreshGameOption")
registerEvent("FromClient_CanChangeOptionAfterSec", "FromClient_CanChangeOptionAfterSec")
registerEvent("FromClient_RefreshMaidOptionInfo", "FromClient_RefreshMaidOptionInfo")
function PaGlobal_Option:SetSkillCommandPanel(check)
  isChecked_SkillCommand = check
  if nil ~= Panel_SkillCommand then
    if isChecked_SkillCommand then
      local pcPosition = getSelfPlayer():get():getPosition()
      local regionInfo = getRegionInfoByPosition(pcPosition)
      if false == regionInfo:get():isSafeZone() then
        FGlobal_SkillCommand_Show(true)
      end
    else
      Panel_SkillCommand:SetShow(false)
    end
  end
end
