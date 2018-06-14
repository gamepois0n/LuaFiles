-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\option\gameoptionmain.luac 

-- params : ...
-- function num : 0
local CONTROL = CppEnums.PA_UI_CONTROL_TYPE
-- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

UI.getChildControlNoneAssert = function(parent, strID)
  -- function num : 0_0
  tempUIBaseForLua = nil
  parent:getChildControl(strID)
  if tempUIBaseForLua == nil then
    return nil
  end
  return tempUIBaseForLua
end

-- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.CreateFrame = function(self, category, detail)
  -- function num : 0_1
  local optionFrame = {_category = category, _detail = detail, _uiFrame = nil, _uiFrameContent = nil, _uiScroll = nil}
  optionFrame._uiFrame = (UI.getChildControl)(Panel_Window_cOption, "Frame_" .. category .. "_" .. detail)
  optionFrame._uiFrameContent = (optionFrame._uiFrame):GetFrameContent()
  optionFrame._uiScroll = (optionFrame._uiFrame):GetVScroll()
  if ((self._frames)[category])[detail] ~= nil then
    (optionFrame._uiFrameContent):MoveChilds((optionFrame._uiFrameContent):GetID(), ((self._frames)[category])[detail])
  end
  ;
  (UIScroll.SetButtonSize)(optionFrame._uiScroll, (optionFrame._uiFrame):GetSizeY(), (optionFrame._uiFrameContent):GetSizeY())
  ;
  (optionFrame._uiFrame):SetShow(false)
  return optionFrame
end

-- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.CreateEventControl = function(self, category, detail)
  -- function num : 0_2 , upvalues : CONTROL
  local FRAME_CHILD_MAX = 15
  local RADIO_CHILD_MAX = 10
  local frame = ((self._frames)[category])[detail]
  frame._containElement = {}
  local lastElement = (UI.getChildControlByIndex)(frame._uiFrameContent, (frame._uiFrameContent):getChildControlCount() - 1)
  local limitFrameSizeY = (lastElement:GetSpanSize()).y + lastElement:GetSizeY()
  limitFrameSizeY = limitFrameSizeY * 0.55
  local curAccumulateSize = 0
  local curAccumulateFrameSize = 0
  CreateEventControlXXX = function(parent, control, controlTypeName, elementName)
    -- function num : 0_2_0 , upvalues : self, CONTROL, curAccumulateSize, curAccumulateFrameSize, limitFrameSizeY, RADIO_CHILD_MAX
    local controlName = controlTypeName .. "_" .. elementName
    local eventType = self:GetEventTypeText(((self._elements)[elementName])._controlType)
    local isRadioButton = CONTROL.PA_UI_CONTROL_RADIOBUTTON == ((self._elements)[elementName])._controlType
    local isSliderButton = CONTROL.PA_UI_CONTROL_SLIDER == ((self._elements)[elementName])._controlType
    local isButton = CONTROL.PA_UI_CONTROL_BUTTON == ((self._elements)[elementName])._controlType
    local isComboBox = CONTROL.PA_UI_CONTROL_COMBOBOX == ((self._elements)[elementName])._controlType
    local isCheckButton = CONTROL.PA_UI_CONTROL_CHECKBUTTON == ((self._elements)[elementName])._controlType
    if control == nil then
      _PA_LOG("후진", "Control�\180 제대�\156 설정�\180 되지 않았습니�\164. Xml�\132 확인해주세요. // Element Name : " .. controlName)
      return 
    end
    -- DECOMPILER ERROR at PC80: Confused about usage of register: R11 in 'UnsetPending'

    if ((self._elements)[elementName])._eventControl == nil then
      ((self._elements)[elementName])._eventControl = {}
    end
    -- DECOMPILER ERROR at PC91: Confused about usage of register: R11 in 'UnsetPending'

    if ((self._elements)[elementName])._isScrollEnd == nil then
      ((self._elements)[elementName])._isScrollEnd = {}
    end
    local eventControl = ((self._elements)[elementName])._eventControl
    local order = #eventControl + 1
    do
      local functionText = "PaGlobal_Option:EventXXX(" .. "\"" .. controlName .. "\"" .. ", " .. order .. ", 0  ) "
      eventControl[order] = control
      ;
      (eventControl[order]):addInputEvent(eventType, functionText)
      curAccumulateSize = curAccumulateFrameSize + (control:GetSpanSize()).y
      -- DECOMPILER ERROR at PC128: Confused about usage of register: R14 in 'UnsetPending'

      ;
      (((self._elements)[elementName])._isScrollEnd)[order] = limitFrameSizeY < curAccumulateSize
      if isCheckButton == true then
        (eventControl[order]):SetEnableArea(0, 0, (eventControl[order]):GetSizeX() + (eventControl[order]):GetTextSizeX(), (eventControl[order]):GetSizeY())
      end
      -- DECOMPILER ERROR at PC158: Confused about usage of register: R14 in 'UnsetPending'

      if isSliderButton == true then
        if ((self._elements)[elementName])._curvalueControl == nil then
          ((self._elements)[elementName])._curvalueControl = {}
        end
        local sliderButton = (UI.getChildControlNoneAssert)(eventControl[order], "Slider_Button")
        sliderButton:addInputEvent(eventType, functionText)
        sliderButton:addInputEvent("Mouse_LUp", functionText)
        -- DECOMPILER ERROR at PC183: Confused about usage of register: R15 in 'UnsetPending'

        ;
        (((self._elements)[elementName])._curvalueControl)[order] = (UI.getChildControlNoneAssert)(parent, "StaticText_Current_" .. elementName)
      end
      if isComboBox == true then
        (eventControl[order]):addInputEvent("Mouse_LUp", "PaGlobal_Option:EventComboBoxOpenXXX(" .. "\"" .. elementName .. "\"" .. ", " .. order .. " ) ")
        ;
        ((eventControl[order]):GetListControl()):addInputEvent("Mouse_LUp", "PaGlobal_Option:EventXXX(" .. "\"" .. controlName .. "\"" .. ", " .. order .. " ) ")
        ;
        (parent:getParent()):SetChildIndex(parent, 9999)
      end
      -- DECOMPILER ERROR at PC236: Confused about usage of register: R14 in 'UnsetPending'

      if isButton == true then
        if ((self._elements)[elementName])._eventControlLeft == nil or ((self._elements)[elementName])._eventControlRight == nil then
          ((self._elements)[elementName])._eventControlLeft = {}
          -- DECOMPILER ERROR at PC241: Confused about usage of register: R14 in 'UnsetPending'

          ;
          ((self._elements)[elementName])._eventControlRight = {}
        end
        local eventControlLeft = ((self._elements)[elementName])._eventControlLeft
        local eventControlRight = ((self._elements)[elementName])._eventControlRight
        eventControlLeft[order] = (UI.getChildControlNoneAssert)(parent, controlName .. "Left")
        ;
        (eventControlLeft[order]):addInputEvent(eventType, "PaGlobal_Option:EventXXX(" .. "\"" .. controlName .. "\"" .. ", " .. order .. ", 1 ) ")
        eventControlRight[order] = (UI.getChildControlNoneAssert)(parent, controlName .. "Right")
        ;
        (eventControlRight[order]):addInputEvent(eventType, "PaGlobal_Option:EventXXX(" .. "\"" .. controlName .. "\"" .. ", " .. order .. ", 2 ) ")
      end
      for radioIndex = 1, RADIO_CHILD_MAX do
        if isRadioButton == false then
          break
        end
        local controlNameParam = controlName .. radioIndex
        local elemParam = (UI.getChildControlNoneAssert)(parent, controlNameParam)
        if elemParam == nil then
          break
        end
        -- DECOMPILER ERROR at PC324: Confused about usage of register: R20 in 'UnsetPending'

        if ((self._elements)[elementName])["_eventControl" .. radioIndex] == nil then
          ((self._elements)[elementName])["_eventControl" .. radioIndex] = {}
        end
        local eventControlParam = ((self._elements)[elementName])["_eventControl" .. radioIndex]
        local order2 = #eventControlParam + 1
        local functionTextParam = "PaGlobal_Option:EventXXX(" .. "\"" .. controlName .. "\"" .. ", " .. order .. ", " .. radioIndex .. " ) "
        eventControlParam[order2] = elemParam
        ;
        (eventControlParam[order2]):addInputEvent(eventType, functionTextParam)
        -- DECOMPILER ERROR at PC353: Confused about usage of register: R23 in 'UnsetPending'

        ;
        ((self._elements)[elementName])._eventControlCount = radioIndex
      end
      if ((self._elements)[elementName])._isPictureTooltipOn == true then
        self:SetPictureToolTip(elementName, parent, order)
      end
      self:SpecialCreateRadioButton(elementName)
      -- DECOMPILER ERROR: 21 unprocessed JMP targets
    end
  end

  for frameIndex = 0, FRAME_CHILD_MAX do
    local bg = (UI.getChildControlNoneAssert)(frame._uiFrameContent, "StaticText_BgOrder" .. frameIndex .. "_Import")
    if bg == nil then
      break
    end
    curAccumulateFrameSize = (bg:GetSpanSize()).y
    curAccumulateSize = curAccumulateFrameSize
    local childCount = bg:getChildControlCount()
    for childIdx = 0, childCount - 1 do
      local child = (UI.getChildControlByIndex)(bg, childIdx)
      local childName = child:GetID()
      local strsplit = (string.split)(childName, "_")
      local controlname = strsplit[1]
      local elementName = strsplit[2]
      local desc = strsplit[3]
      self:FPSTextSetting(childName, child)
      if elementName ~= nil and (self._elements)[elementName] ~= nil and controlname ~= nil and self:GetControlTypeByControlName(controlname) ~= nil then
        CreateEventControlXXX(bg, child, controlname, elementName)
        -- DECOMPILER ERROR at PC99: Confused about usage of register: R26 in 'UnsetPending'

        ;
        (frame._containElement)[#frame._containElement + 1] = elementName
        local option = (self._elements)[elementName]
        option._string = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NEWGAMEOPTION_" .. elementName)
        if option._category == nil then
          option._category = {}
        end
        local categories = option._category
        local order = #option._category + 1
        -- DECOMPILER ERROR at PC121: Confused about usage of register: R29 in 'UnsetPending'

        ;
        (option._category)[order] = {}
        -- DECOMPILER ERROR at PC124: Confused about usage of register: R29 in 'UnsetPending'

        ;
        ((option._category)[order])._find = category
        -- DECOMPILER ERROR at PC134: Confused about usage of register: R29 in 'UnsetPending'

        ;
        ((option._category)[order])._string = PAGetString(Defines.StringSheet_GAME, "LUA_NEWGAMEOPTION_" .. category)
        if option._detail == nil then
          option._detail = {}
        end
        -- DECOMPILER ERROR at PC142: Confused about usage of register: R29 in 'UnsetPending'

        ;
        (option._detail)[order] = {}
        -- DECOMPILER ERROR at PC145: Confused about usage of register: R29 in 'UnsetPending'

        ;
        ((option._detail)[order])._find = detail
        -- DECOMPILER ERROR at PC157: Confused about usage of register: R29 in 'UnsetPending'

        ;
        ((option._detail)[order])._string = PAGetString(Defines.StringSheet_GAME, "LUA_NEWGAMEOPTION_" .. category .. "_" .. detail)
      else
        do
          do
            if elementName ~= nil and (self._elements)[elementName] ~= nil and desc ~= nil and desc == "Desc" then
              child:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
              child:SetText(child:GetText())
            else
            end
            -- DECOMPILER ERROR at PC185: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC185: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC185: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  do
    if elementName == nil or (self._elements)[elementName] ~= nil then
    end
  end
end

-- DECOMPILER ERROR at PC14: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.SetPictureToolTip = function(self, elementName, parent, order)
  -- function num : 0_3
  if ((self._elements)[elementName])._isPictureTooltipOn ~= true then
    return 
  end
  if parent == nil then
    return 
  end
  local pictureTooltip = (UI.getChildControlNoneAssert)(parent, "Static_Tooltip_" .. elementName)
  if pictureTooltip == nil then
    return 
  end
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R5 in 'UnsetPending'

  if ((self._elements)[elementName])._pictureTooltipControl == nil then
    ((self._elements)[elementName])._pictureTooltipControl = {}
  end
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (((self._elements)[elementName])._pictureTooltipControl)[order] = pictureTooltip
  pictureTooltip:SetShow(false)
  local eventControl = (((self._elements)[elementName])._eventControl)[order]
  eventControl:addInputEvent("Mouse_On", "PaGlobal_Option:OnPictureToolTip(" .. "\"" .. elementName .. "\"" .. " ," .. order .. ")")
  eventControl:addInputEvent("Mouse_Out", "PaGlobal_Option:OutPictureToolTip(" .. "\"" .. elementName .. "\"" .. " ," .. order .. ")")
  local RADIO_CHILD_MAX = 10
  for radioIndex = 1, RADIO_CHILD_MAX do
    local radioChildEventControl = ((self._elements)[elementName])["_eventControl" .. radioIndex]
    if radioChildEventControl == nil then
      break
    end
    local eventControl = radioChildEventControl[order]
    eventControl:addInputEvent("Mouse_On", "PaGlobal_Option:OnPictureToolTip(" .. "\"" .. elementName .. "\"" .. " ," .. order .. ")")
    eventControl:addInputEvent("Mouse_Out", "PaGlobal_Option:OutPictureToolTip(" .. "\"" .. elementName .. "\"" .. " ," .. order .. ")")
  end
end

-- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.OnPictureToolTip = function(self, elementName, index)
  -- function num : 0_4
  ((((self._elements)[elementName])._pictureTooltipControl)[index]):SetShow(true)
end

-- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.OutPictureToolTip = function(self, elementName, index)
  -- function num : 0_5
  ((((self._elements)[elementName])._pictureTooltipControl)[index]):SetShow(false)
end

-- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.FPSTextSetting = function(self, childName, element)
  -- function num : 0_6
  if element == nil or childName == nil then
    return 
  end
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R3 in 'UnsetPending'

  if childName == "StaticText_FPS" then
    (self._fpsTextControl)[#self._fpsTextControl + 1] = element
  end
end

-- DECOMPILER ERROR at PC26: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.SetXXX = function(self, elementName, value)
  -- function num : 0_7
  if (self._functions)[elementName] == nil then
    return false
  end
  if value == nil then
    return false
  end
  local executeResult = ((self._functions)[elementName])(value)
  if executeResult == false then
    return false
  end
  local opiton = (self._elements)[elementName]
  opiton._applyValue = value
  opiton._curValue = nil
  self:SetControlSetting(elementName, value)
end

-- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.EventComboBoxOpenXXX = function(self, elementName, controlIndex)
  -- function num : 0_8 , upvalues : CONTROL
  local option = (self._elements)[elementName]
  if option._controlType ~= CONTROL.PA_UI_CONTROL_COMBOBOX then
    _PA_LOG("후진", "[EventComboBoxOpenXXX][ RETURN ] combobox�\128 아니�\180 여기 들어오면 안됩니다. controlType�\132 확인해주세요. : " .. elementName)
    return 
  end
  if option._comboBoxListCount == nil then
    _PA_LOG("후진", "[EventComboBoxOpenXXX][ RETURN ] _comboBoxListCount �\128 셋팅 되지 않았습니�\164. SpectialControlComboBoxInitValue() 에서 처리해주세요.: " .. elementName)
    return 
  end
  if option._comboBoxList == nil then
    _PA_LOG("후진", "[EventComboBoxOpenXXX][ RETURN ] _comboBoxList table �\180 셋팅 되지 않았습니�\164. SpectialControlComboBoxInitValue() 에서 처리해주세요. : " .. elementName)
    return 
  end
  local combo = (option._eventControl)[controlIndex]
  combo:DeleteAllItem()
  for index = 0, option._comboBoxListCount - 1 do
    combo:AddItem((option._comboBoxList)[index], index)
  end
  combo:ToggleListbox()
  combo:SetShow(true)
end

-- DECOMPILER ERROR at PC34: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.EventXXX = function(self, controlName, controlIndex, order, param)
  -- function num : 0_9 , upvalues : CONTROL
  local strsplit = (string.split)(controlName, "_")
  if strsplit[1] == nil or strsplit[2] == nil then
    _PA_LOG("후진", "[EventXXX][ RETURN ] control�\152 버튼 이벤트가 잘못되었습니�\164. ControlName�\132 확인해주세요. : " .. elementName)
    return 
  end
  local controlTypeName = strsplit[1]
  local elementName = strsplit[2]
  local option = (self._elements)[elementName]
  if type(option) ~= "table" then
    _PA_LOG("후진", "[EventXXX][ RETURN ] element �\128 테이블이 아닙니다. Header �\188 확인해주세요.  : " .. elementName)
    return 
  end
  local beforeValue = option._curValue
  local controlType = self:GetControlTypeByControlName(controlTypeName)
  if CONTROL.PA_UI_CONTROL_CHECKBUTTON == controlType then
    option._curValue = ((option._eventControl)[controlIndex]):IsCheck()
  else
    if CONTROL.PA_UI_CONTROL_RADIOBUTTON == controlType and (option.actionInputType ~= nil or option.uiInputType ~= nil) then
      self:SetKeyCustomMode(elementName)
      self:SetControlSetting(elementName, "")
    else
      if CONTROL.PA_UI_CONTROL_RADIOBUTTON == controlType then
        for i,eventControl in pairs(option._eventControl) do
          eventControl:SetCheck(false)
        end
        for index = 1, option._eventControlCount do
          for _,eventControl in pairs(((self._elements)[elementName])["_eventControl" .. index]) do
            eventControl:SetCheck(false)
          end
        end
        option._curValue = order
      else
        if CONTROL.PA_UI_CONTROL_SLIDER == controlType then
          option._curValue = ((option._eventControl)[controlIndex]):GetControlPos()
        else
          if CONTROL.PA_UI_CONTROL_COMBOBOX == controlType then
            local combo = (option._eventControl)[controlIndex]
            option._curValue = combo:GetSelectIndex()
            combo:ToggleListbox()
          else
            do
              if CONTROL.PA_UI_CONTROL_BUTTON == controlType then
                local tempindex = option._initValue
                if option._applyValue ~= nil then
                  tempindex = option._applyValue
                end
                if option._curValue ~= nil then
                  tempindex = option._curValue
                end
                if option.GetButtonListSize == nil then
                  _PA_LOG("후진", "[SetControlSettingTable][ BUTTON ] GetButtonListSize 함수�\128 만들어지�\128 않았습니�\164. GameOptionHeader�\144 추가해주세요. " .. elementName)
                else
                  if order == 0 then
                    option._curValue = (tempindex + 1) % option:GetButtonListSize()
                  else
                    if order == 1 then
                      option._curValue = (tempindex - 1) % option:GetButtonListSize()
                    else
                      if order == 2 then
                        option._curValue = (tempindex + 1) % option:GetButtonListSize()
                      end
                    end
                  end
                end
              else
                do
                  _PA_LOG("후진", "[EventXXX][ RETURN ] 무슨 Control 인지 모르겠습니다. : " .. elementName)
                  do return  end
                  if option._curValue == nil then
                    return 
                  end
                  self:EventXXXException(elementName, option._curValue, beforeValue)
                  self:SetControlSetting(elementName, option._curValue)
                  do
                    if option._settingRightNow == true then
                      local tempCurValue = option._curValue
                      self:SetXXX(elementName, option._curValue)
                      option._curValue = tempCurValue
                      option._applyValue = nil
                    end
                    -- DECOMPILER ERROR at PC206: Unhandled construct in 'MakeBoolean' P1

                    if option._applyValue ~= nil and option._curValue == option._applyValue then
                      option._curValue = nil
                    end
                    if option._curValue == option._initValue then
                      option._curValue = nil
                    end
                    local applyButtonEnable = false
                    for _,option in pairs(self._elements) do
                      if option._curValue ~= nil then
                        applyButtonEnable = true
                      end
                    end
                    self:ApplyButtonEnable(applyButtonEnable)
                    ClearFocusEdit()
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

-- DECOMPILER ERROR at PC37: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.SetControlSetting = function(self, elementName, value)
  -- function num : 0_10
  self:SetControlSettingTable((self._elements)[elementName], value, elementName)
end

-- DECOMPILER ERROR at PC41: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.SetControlSettingTable = function(self, option, value, elementName)
  -- function num : 0_11 , upvalues : CONTROL
  if elementName == nil then
    elementName = ""
  end
  if type(option) ~= "table" then
    return 
  end
  if option._eventControl == nil then
    return 
  end
  if value == nil then
    return 
  end
  if CONTROL.PA_UI_CONTROL_CHECKBUTTON == option._controlType then
    for i,eventControl in pairs(option._eventControl) do
      eventControl:SetCheck(value)
    end
  else
    do
      if (option.actionInputType ~= nil or option.uiInputType ~= nil) and CONTROL.PA_UI_CONTROL_RADIOBUTTON == option._controlType then
        for i,eventControl in pairs(option._eventControl) do
          eventControl:SetText(value)
        end
      else
        do
          if CONTROL.PA_UI_CONTROL_RADIOBUTTON == option._controlType then
            if value == 0 then
              for i,eventControl in pairs(option._eventControl) do
                eventControl:SetCheck(true)
              end
            else
              do
                if option["_eventControl" .. value] == nil then
                  _PA_LOG("후진", "[SetControlSettingTable][ RETURN ] 라디�\164 버튼 컨트�\164 (eventcontrol 1~x) �\180 정상적으�\156 만들어지�\128 않았습니�\164/ xml 라디�\164 버튼 셋팅�\132 확인해주세요 : " .. elementName)
                  return 
                end
                for i,eventControl in pairs(option["_eventControl" .. value]) do
                  eventControl:SetCheck(true)
                end
                do
                  if CONTROL.PA_UI_CONTROL_SLIDER == option._controlType then
                    for i,eventControl in pairs(option._eventControl) do
                      eventControl:SetControlPos(value * 100)
                    end
                    for i,valueControl in pairs(option._curvalueControl) do
                      local displayValue = self:FromSliderValueToRealValue(value, option._sliderValueMin, option._sliderValueMax)
                      displayValue = (math.floor)(displayValue + 0.5)
                      valueControl:SetText(self._sliderButtonString .. displayValue .. "<PAOldColor>")
                    end
                  else
                    do
                      if CONTROL.PA_UI_CONTROL_COMBOBOX == option._controlType then
                        for i,eventControl in pairs(option._eventControl) do
                          eventControl:SetSelectItemIndex(value)
                        end
                      else
                        do
                          if CONTROL.PA_UI_CONTROL_BUTTON == option._controlType then
                            if option.GetButtonText == nil then
                              _PA_LOG("후진", "[SetControlSettingTable][ BUTTON ] GetButtonText 함수�\128 만들어지�\128 않았습니�\164. GameOptionHeader�\144 추가해주세요. " .. elementName)
                            else
                              local buttonText = option:GetButtonText(value)
                              for i,eventControl in pairs(option._eventControl) do
                                eventControl:SetText(buttonText)
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
    end
  end
end

-- DECOMPILER ERROR at PC44: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.ResetControlSetting = function(self, elementName)
  -- function num : 0_12
  local option = (self._elements)[elementName]
  self:ResetControlSettingTable(option, elementName)
end

-- DECOMPILER ERROR at PC48: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.ResetControlSettingTable = function(self, option, elementName)
  -- function num : 0_13 , upvalues : CONTROL
  if elementName == nil then
    elementName = ""
  end
  if type(option) ~= "table" then
    return 
  end
  if option._eventControl == nil then
    return 
  end
  if CONTROL.PA_UI_CONTROL_CHECKBUTTON == option._controlType then
    for i,eventControl in pairs(option._eventControl) do
      eventControl:SetCheck(false)
    end
  else
    do
      if CONTROL.PA_UI_CONTROL_RADIOBUTTON == option._controlType then
        for i,eventControl in pairs(option._eventControl) do
          eventControl:SetCheck(false)
        end
        do
          if option._eventControlCount == nil or option._eventControlCount < 1 then
            return 
          end
          for index = 1, option._eventControlCount do
            for i,eventControl in pairs(option["_eventControl" .. index]) do
              eventControl:SetCheck(false)
            end
          end
          do
            if CONTROL.PA_UI_CONTROL_SLIDER == option._controlType then
              for i,eventControl in pairs(option._eventControl) do
                eventControl:SetControlPos(50)
              end
            else
            end
            do
              if CONTROL.PA_UI_CONTROL_COMBOBOX ~= option._controlType or CONTROL.PA_UI_CONTROL_COMBOBOX == option._controlType then
              end
            end
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC51: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.SearchOption = function(self, inputString)
  -- function num : 0_14
  local findTable = {}
  for index,option in pairs(self._elements) do
    local rv = nil
    if option._string == nil then
      _PA_LOG("후진", "[SearchOption][ RETURN ] option �\144 string�\180 설정되지 않았습니�\164. GameOptionHeader�\144 설정�\180 되어있는�\128 확인해주세요. ")
    else
      rv = (string.find)((string.lower)(option._string), (string.lower)(inputString))
    end
    if option._category == nil or option._detail == nil then
      _PA_LOG("후진", "[SearchOption][ RETURN ] option �\144 카테고리�\128 설정되지 않았습니�\164. CreateEventControl 에서 잘못되었습니�\164." .. index)
      rv = nil
    end
    if rv ~= nil then
      for order,v in pairs(option._category) do
        findTable[#findTable + 1] = {_elementString = option._string, _category = (option._category)[order], _detail = (option._detail)[order], _isScrollEnd = (option._isScrollEnd)[order]}
      end
    end
  end
  return findTable
end

-- DECOMPILER ERROR at PC54: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.EventXXXException = function(self, elementName, value, beforeValue)
  -- function num : 0_15
  if ((self._elements)[elementName]).EventException == nil then
    return 
  end
  ;
  ((self._elements)[elementName]):EventException(value, beforeValue)
end

-- DECOMPILER ERROR at PC59: Confused about usage of register: R1 in 'UnsetPending'

;
((PaGlobal_Option._elements).ServiceResourceType).EventException = function(self, value)
  -- function num : 0_16
  local serviceResourceType = PaGlobal_Option:radioButtonMapping_ServiceResourceType(value)
  local chatChannelType = (PaGlobal_Option._elements).ChatChannelType
  if (CppEnums.ServiceResourceType).eServiceResourceType_SP == serviceResourceType then
    chatChannelType._curValue = PaGlobal_Option:radioButtonMapping_ChatChannelType((CppEnums.LangType).LangType_SP, true)
  else
    chatChannelType._curValue = PaGlobal_Option:radioButtonMapping_ChatChannelType(serviceResourceType, true)
  end
  PaGlobal_Option:ResetControlSettingTable(chatChannelType)
  PaGlobal_Option:SetControlSettingTable(chatChannelType, chatChannelType._curValue)
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_LANGUAGESETTING"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R1 in 'UnsetPending'

;
((PaGlobal_Option._elements).AudioResourceType).EventException = function(self, value)
  -- function num : 0_17
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_NPCVOICE_RESTART"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

-- DECOMPILER ERROR at PC69: Confused about usage of register: R1 in 'UnsetPending'

;
((PaGlobal_Option._elements).ChatChannelType).EventException = function(self, value)
  -- function num : 0_18
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_LANGUAGESETTING"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

-- DECOMPILER ERROR at PC74: Confused about usage of register: R1 in 'UnsetPending'

;
((PaGlobal_Option._elements).GraphicOption).EventException = function(self, value, beforeValue)
  -- function num : 0_19
  local GraphicEnum = PaGlobal_Option.GRAPHIC
  if self._curValue == nil then
    PaGlobal_Option:SetGraphicOption(self._curValue)
  else
    if beforeValue == nil then
      beforeValue = self._initValue
    end
    if beforeValue == value then
      PaGlobal_Option:SetGraphicOption(self._curValue)
    end
    local isIncrease = beforeValue < value
    if GraphicEnum.VeryVeryLow == value then
      isIncrease = false
    end
    if GraphicEnum.VeryVeryLow == beforeValue then
      isIncrease = true
    end
    do
      do
        if GraphicEnum.VeryVeryHigh ~= value then
          local ultra = (PaGlobal_Option._elements).GraphicUltra
          ultra._curValue = false
          PaGlobal_Option:ResetControlSettingTable(ultra)
          PaGlobal_Option:SetControlSettingTable(ultra, ultra._curValue)
        end
        PaGlobal_Option:SetGraphicOption(value, isIncrease)
        -- DECOMPILER ERROR: 5 unprocessed JMP targets
      end
    end
  end
end

-- DECOMPILER ERROR at PC79: Confused about usage of register: R1 in 'UnsetPending'

;
((PaGlobal_Option._elements).GraphicUltra).EventException = function(self, value)
  -- function num : 0_20
  PaGlobal_Option:SetUltra(value)
end

-- DECOMPILER ERROR at PC82: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.KeyCustomInitValue = function(self)
  -- function num : 0_21
  for elementName,element in pairs(self._elements) do
    element._initValue = self:KeyCustomGetString(elementName)
  end
end

-- DECOMPILER ERROR at PC85: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.GetKeyCustomInputType = function(self)
  -- function num : 0_22
  if self._keyCustomInputType == nil then
    _PA_LOG("후진", "[GetKeyCustomInputType][ RETURN ] 이상하다....")
    return 
  end
  return (self._keyCustomInputType)[2] or nil
end

-- DECOMPILER ERROR at PC88: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.SetKeyCustomMode = function(self, elementName)
  -- function num : 0_23
  setKeyCustomizing(false)
  SetUIMode((Defines.UIMode).eUIMode_Default)
  self:ResetKeyCustomString()
  local option = (self._elements)[elementName]
  if option.actionInputType ~= nil then
    self._keyCustomInputType = {elementName, option.actionInputType}
    if option.actionInputType == "PadFunction1" then
      SetUIMode((Defines.UIMode).eUIMode_KeyCustom_ActionPadFunc1)
      return 
    else
      if option.actionInputType == "PadFunction2" then
        SetUIMode((Defines.UIMode).eUIMode_KeyCustom_ActionPadFunc2)
        return 
      end
    end
    if self._keyCustomPadMode == true then
      SetUIMode((Defines.UIMode).eUIMode_KeyCustom_ActionPad)
    else
      SetUIMode((Defines.UIMode).eUIMode_KeyCustom_ActionKey)
    end
    setKeyCustomizing(true)
  else
    if option.uiInputType ~= nil then
      self._keyCustomInputType = {elementName, option.uiInputType}
      if self._keyCustomPadMode == true then
        SetUIMode((Defines.UIMode).eUIMode_KeyCustom_UiPad)
      else
        SetUIMode((Defines.UIMode).eUIMode_KeyCustom_UiKey)
      end
      setKeyCustomizing(true)
    end
  end
end

-- DECOMPILER ERROR at PC91: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.CompleteKeyCustomMode = function(self)
  -- function num : 0_24
  if self._keyCustomInputType == nil then
    _PA_LOG("후진", "[CompleteKeyCustomMode][ RETURN ] 기존 Option �\189 아니라면 이상하다")
    return 
  end
  local elementName = (self._keyCustomInputType)[1] or nil
  if elementName == nil then
    _PA_LOG("후진", "[CompleteKeyCustomMode][ RETURN ] 이상하다")
    return 
  end
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R2 in 'UnsetPending'

  ;
  ((self._elements)[elementName])._keyCustomInputType = nil
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R2 in 'UnsetPending'

  ;
  ((self._elements)[elementName])._curValue = ""
  self:ApplyButtonEnable(true)
  self:ResetControlSetting(elementName)
  self:ResetKeyCustomString()
end

-- DECOMPILER ERROR at PC94: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.KeyCustomGetString = function(self, elementName)
  -- function num : 0_25
  local option = (self._elements)[elementName]
  local keyCustomString = nil
  if option.uiInputType ~= nil then
    if self._keyCustomPadMode == true then
      keyCustomString = keyCustom_GetString_UiPad(option.uiInputType)
    else
      keyCustomString = keyCustom_GetString_UiKey(option.uiInputType)
    end
  else
    if option.actionInputType ~= nil then
      if option.actionInputType == "PadFunction1" then
        return keyCustom_GetString_ActionPadFunc1()
      end
      if option.actionInputType == "PadFunction2" then
        return keyCustom_GetString_ActionPadFunc2()
      end
      if self._keyCustomPadMode == true then
        keyCustomString = keyCustom_GetString_ActionPad(option.actionInputType)
      else
        keyCustomString = keyCustom_GetString_ActionKey(option.actionInputType)
      end
    end
  end
  return keyCustomString
end

-- DECOMPILER ERROR at PC98: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).KeyCustomMode = function(value)
  -- function num : 0_26
  local global = PaGlobal_Option
  do
    local beforekeyCustomPadMode = global._keyCustomPadMode
    global._keyCustomPadMode = value == 1
    if global._keyCustomPadMode == beforekeyCustomPadMode then
      return 
    end
    global:ResetKeyCustomString()
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC101: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.ResetKeyCustomString = function(self)
  -- function num : 0_27
  for elementName,option in pairs(self._elements) do
    if option.actionInputType ~= nil or option.uiInputType ~= nil then
      self:SetControlSetting(elementName, self:KeyCustomGetString(elementName))
    end
  end
end

-- DECOMPILER ERROR at PC104: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.Init = function(self)
  -- function num : 0_28
  for catagory,details in pairs(self._frames) do
    for detail,panel in pairs((self._frames)[catagory]) do
      -- DECOMPILER ERROR at PC15: Confused about usage of register: R11 in 'UnsetPending'

      ((self._frames)[catagory])[detail] = self:CreateFrame(catagory, detail)
    end
  end
  for catagory,details in pairs(self._frames) do
    for detail,panel in pairs((self._frames)[catagory]) do
      self:CreateEventControl(catagory, detail)
    end
  end
  self:InitUi()
  self:SpectialOptionInit()
  self:ListInit()
end

-- DECOMPILER ERROR at PC107: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.InitSetting = function(self)
  -- function num : 0_29
  for name,option in pairs(self._elements) do
    if type(option) ~= "table" then
      _PA_LOG("후진", "[ InitSetting ] option �\180 table�\180 아닙니다.")
    else
      if option._initValue == nil then
        _PA_LOG("후진", "element init value�\128 Null 입니�\164. " .. name)
      else
        self:ResetControlSetting(name)
        self:SetControlSetting(name, option._initValue)
      end
    end
  end
end

-- DECOMPILER ERROR at PC110: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.InitValue = function(self, gameOptionSetting)
  -- function num : 0_30
  local elems_ = self._elements
  for i,option in pairs(elems_) do
    option._curValue = nil
    option._applyValue = nil
  end
  self._sliderButtonString = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NEWGAMEOPTION_CURRENT_SLIDERVALUE") .. " <PAColor0xffddcd82>"
  self:SpectialControlComboBoxInitValue()
  self._keyCustomPadMode = getGamePadEnable()
  self:KeyCustomInitValue()
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R3 in 'UnsetPending'

  if self._keyCustomPadMode == true then
    (elems_.KeyCustomMode)._initValue = 1
  else
    -- DECOMPILER ERROR at PC31: Confused about usage of register: R3 in 'UnsetPending'

    ;
    (elems_.KeyCustomMode)._initValue = 0
  end
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.AimAssist)._initValue = gameOptionSetting:getAimAssist()
  -- DECOMPILER ERROR at PC44: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.UseNewQuickSlot)._initValue = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListBool((CppEnums.GlobalUIOptionType).NewQuickSlot)
  -- DECOMPILER ERROR at PC48: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.EnableSimpleUI)._initValue = gameOptionSetting:getEnableSimpleUI()
  -- DECOMPILER ERROR at PC52: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.IsOnScreenSaver)._initValue = gameOptionSetting:getIsOnScreenSaver()
  -- DECOMPILER ERROR at PC59: Confused about usage of register: R3 in 'UnsetPending'

  if elems_.UIFontSizeType ~= nil then
    (elems_.UIFontSizeType)._initValue = gameOptionSetting:getUIFontSizeType()
  end
  -- DECOMPILER ERROR at PC63: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.ShowNavPathEffectType)._initValue = gameOptionSetting:getShowNavPathEffectType()
  -- DECOMPILER ERROR at PC67: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.RefuseRequests)._initValue = gameOptionSetting:getRefuseRequests()
  -- DECOMPILER ERROR at PC71: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.IsPvpRefuse)._initValue = gameOptionSetting:getPvpRefuse()
  -- DECOMPILER ERROR at PC78: Confused about usage of register: R3 in 'UnsetPending'

  if elems_.IsExchangeRefuse ~= nil then
    (elems_.IsExchangeRefuse)._initValue = gameOptionSetting:getIsExchangeRefuse()
  end
  -- DECOMPILER ERROR at PC82: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.RotateRadarMode)._initValue = gameOptionSetting:getRadarRotateMode()
  -- DECOMPILER ERROR at PC86: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.HideWindowByAttacked)._initValue = gameOptionSetting:getHideWindowByAttacked()
  -- DECOMPILER ERROR at PC93: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.AudioResourceType)._initValue = self:radioButtonMapping_AudioResourceType(gameOptionSetting:getAudioResourceType(), true)
  -- DECOMPILER ERROR at PC100: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.ServiceResourceType)._initValue = self:radioButtonMapping_ServiceResourceType(gameOptionSetting:getServiceResType(), true)
  -- DECOMPILER ERROR at PC104: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.UseChattingFilter)._initValue = gameOptionSetting:getUseChattingFilter()
  -- DECOMPILER ERROR at PC111: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.ChatChannelType)._initValue = self:radioButtonMapping_ChatChannelType(gameOptionSetting:getChatLanguageType(), true)
  -- DECOMPILER ERROR at PC115: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.SelfPlayerNameTagVisible)._initValue = gameOptionSetting:getSelfPlayerNameTagVisible()
  -- DECOMPILER ERROR at PC126: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.OtherPlayerNameTagVisible)._initValue = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow == gameOptionSetting:getOtherPlayerNameTagVisible()
  -- DECOMPILER ERROR at PC137: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.PartyPlayerNameTagVisible)._initValue = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow == gameOptionSetting:getPartyPlayerNameTagVisible()
  -- DECOMPILER ERROR at PC148: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.GuildPlayerNameTagVisible)._initValue = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow == gameOptionSetting:getGuildPlayerNameTagVisible()
  -- DECOMPILER ERROR at PC159: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.RankingPlayerNameTagVisible)._initValue = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow == gameOptionSetting:getRankingPlayerNameTagVisible()
  -- DECOMPILER ERROR at PC164: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.GuideLineZoneChange)._initValue = gameOptionSetting:getRenderPlayerColor("ZoneChange")
  -- DECOMPILER ERROR at PC168: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.GuideLineQuestNPC)._initValue = gameOptionSetting:getShowQuestActorColor()
  -- DECOMPILER ERROR at PC172: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.GuideLineNpcIntimacy)._initValue = gameOptionSetting:getShowHumanRelation()
  -- DECOMPILER ERROR at PC177: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.GuideLineWarAlly)._initValue = gameOptionSetting:getRenderPlayerColor("WarAlly")
  -- DECOMPILER ERROR at PC182: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.GuideLineNonWarPlayer)._initValue = gameOptionSetting:getRenderPlayerColor("NonWarPlayer")
  -- DECOMPILER ERROR at PC187: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.GuideLineEnemy)._initValue = gameOptionSetting:getRenderPlayerColor("Enemy")
  -- DECOMPILER ERROR at PC192: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.GuideLineGuild)._initValue = gameOptionSetting:getRenderPlayerColor("Guild")
  -- DECOMPILER ERROR at PC197: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.GuideLineParty)._initValue = gameOptionSetting:getRenderPlayerColor("Party")
  -- DECOMPILER ERROR at PC201: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.GuideLinePartyMemberEffect)._initValue = gameOptionSetting:getRenderHitEffectParty()
  -- DECOMPILER ERROR at PC205: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.PetRender)._initValue = gameOptionSetting:getPetRender()
  -- DECOMPILER ERROR at PC211: Confused about usage of register: R3 in 'UnsetPending'

  if gameOptionSetting:getFairyRender() == true then
    (elems_.FairyRender)._initValue = 0
  else
    -- DECOMPILER ERROR at PC214: Confused about usage of register: R3 in 'UnsetPending'

    (elems_.FairyRender)._initValue = 1
  end
  -- DECOMPILER ERROR at PC218: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.MaidView)._sliderValueMax = gameOptionSetting:getMaidMaxCount()
  -- DECOMPILER ERROR at PC227: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.MaidView)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getMaidView(), 0, gameOptionSetting:getMaidMaxCount())
  do
    local frameContent = ((self._frames).Function).View
    if frameContent ~= nil then
      local maidControl = (UI.getChildControl)(frameContent._uiFrameContent, "StaticText_BgOrder6_Import")
      local maidMaxControl = (UI.getChildControl)(maidControl, "StaticText_MaxMaidView")
      maidMaxControl:SetShow(true)
      maidMaxControl:SetText(tostring(gameOptionSetting:getMaidMaxCount()))
    end
    -- DECOMPILER ERROR at PC255: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.ShowReputation)._initValue = gameOptionSetting:getShowStatTier()
    -- DECOMPILER ERROR at PC259: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.RenderHitEffect)._initValue = gameOptionSetting:getRenderHitEffect()
    -- DECOMPILER ERROR at PC263: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.DamageMeter)._initValue = gameOptionSetting:getOnDamageMeter()
    -- DECOMPILER ERROR at PC267: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.ShowComboGuide)._initValue = gameOptionSetting:getShowComboGuide()
    -- DECOMPILER ERROR at PC271: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.HideMastOnCarrier)._initValue = gameOptionSetting:getHideMastOnCarrier()
    -- DECOMPILER ERROR at PC275: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.WorkerVisible)._initValue = gameOptionSetting:getWorkerVisible()
    -- DECOMPILER ERROR at PC279: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.WorldMapOpenType)._initValue = gameOptionSetting:getWorldmapOpenType()
    -- DECOMPILER ERROR at PC283: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.WorldmapCameraPitchType)._initValue = gameOptionSetting:getWorldMapCameraPitchType()
    -- DECOMPILER ERROR at PC290: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.TextureQuality)._initValue = self:radioButtonMapping_TextureQuality(gameOptionSetting:getTextureQuality(), true)
    -- DECOMPILER ERROR at PC297: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.GraphicOption)._initValue = self:radioButtonMapping_GraphicOption(gameOptionSetting:getGraphicOption(), true)
    self:SetGraphicOption((elems_.GraphicOption)._initValue)
    -- DECOMPILER ERROR at PC305: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.AntiAliasing)._initValue = gameOptionSetting:getAntiAliasing()
    -- DECOMPILER ERROR at PC309: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.SSAO)._initValue = gameOptionSetting:getSSAO()
    -- DECOMPILER ERROR at PC317: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.PostFilter)._initValue = gameOptionSetting:getPostFilter() == 2
    -- DECOMPILER ERROR at PC321: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.Tessellation)._initValue = gameOptionSetting:getTessellation()
    -- DECOMPILER ERROR at PC325: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.GraphicUltra)._initValue = gameOptionSetting:getGraphicUltra()
    -- DECOMPILER ERROR at PC329: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.Dof)._initValue = gameOptionSetting:getDof()
    -- DECOMPILER ERROR at PC333: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.Representative)._initValue = gameOptionSetting:getRepresentative()
    -- DECOMPILER ERROR at PC337: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.CharacterEffect)._initValue = gameOptionSetting:getCharacterEffect()
    -- DECOMPILER ERROR at PC341: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.SnowPoolOnlyInSafeZone)._initValue = gameOptionSetting:getSnowPoolOnlyInSafeZone()
    -- DECOMPILER ERROR at PC349: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.BloodEffect)._initValue = gameOptionSetting:getBloodEffect() == 2
    -- DECOMPILER ERROR at PC353: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.LensBlood)._initValue = gameOptionSetting:getLensBlood()
    -- DECOMPILER ERROR at PC360: Confused about usage of register: R4 in 'UnsetPending'

    if elems_.ShowStackHp ~= nil then
      (elems_.ShowStackHp)._initValue = gameOptionSetting:getIsShowHpBar()
    end
    -- DECOMPILER ERROR at PC364: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.AutoOptimization)._initValue = gameOptionSetting:getAutoOptimization()
    -- DECOMPILER ERROR at PC372: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.AutoOptimizationFrameLimit)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getAutoOptimizationFrameLimit(), 0, 60)
    -- DECOMPILER ERROR at PC376: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.UpscaleEnable)._initValue = gameOptionSetting:getUpscaleEnable()
    -- DECOMPILER ERROR at PC380: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.SelfPlayerOnlyEffect)._initValue = gameOptionSetting:getSelfPlayerOnlyEffect()
    -- DECOMPILER ERROR at PC384: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.NearestPlayerOnlyEffect)._initValue = gameOptionSetting:getNearestPlayerOnlyEffect()
    -- DECOMPILER ERROR at PC388: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.SelfPlayerOnlyLantern)._initValue = gameOptionSetting:getSelfPlayerOnlyLantern()
    -- DECOMPILER ERROR at PC392: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.PresentLock)._initValue = gameOptionSetting:getPresentLock()
    -- DECOMPILER ERROR at PC396: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.UseEffectFrameOptimization)._initValue = gameOptionSetting:getUseOptimizationEffectFrame()
    -- DECOMPILER ERROR at PC404: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.EffectFrameOptimization)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getEffectFrameEffectOptimization(), 0.1, 25)
    -- DECOMPILER ERROR at PC408: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.UsePlayerEffectDistOptimization)._initValue = gameOptionSetting:getUsePlayerOptimizationEffectFrame()
    -- DECOMPILER ERROR at PC417: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.PlayerEffectDistOptimization)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getPlayerEffectFrameEffectOptimization() / 100, 10, 50)
    -- DECOMPILER ERROR at PC421: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.UseCharacterUpdateFrameOptimize)._initValue = gameOptionSetting:getUseCharacterDistUpdate()
    -- DECOMPILER ERROR at PC429: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.UseOtherPlayerUpdate)._initValue = gameOptionSetting:getUseOtherPlayerUpdate() ~= true
    -- DECOMPILER ERROR at PC433: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.MouseInvertX)._initValue = gameOptionSetting:getMouseInvertX()
    -- DECOMPILER ERROR at PC437: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.MouseInvertY)._initValue = gameOptionSetting:getMouseInvertY()
    -- DECOMPILER ERROR at PC445: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.MouseSensitivityX)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getMouseSensitivityX(), 0.1, 2)
    -- DECOMPILER ERROR at PC453: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.MouseSensitivityY)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getMouseSensitivityY(), 0.1, 2)
    -- DECOMPILER ERROR at PC457: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.GameMouseMode)._initValue = gameOptionSetting:getGameMouseMode()
    -- DECOMPILER ERROR at PC461: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.IsUIModeMouseLock)._initValue = gameOptionSetting:getUIModeMouseLock()
    -- DECOMPILER ERROR at PC465: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.GamePadEnable)._initValue = gameOptionSetting:getGamePadEnable()
    -- DECOMPILER ERROR at PC469: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.GamePadVibration)._initValue = gameOptionSetting:getGamePadVibration()
    -- DECOMPILER ERROR at PC473: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.GamePadInvertX)._initValue = gameOptionSetting:getGamePadInvertX()
    -- DECOMPILER ERROR at PC477: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.GamePadInvertY)._initValue = gameOptionSetting:getGamePadInvertY()
    -- DECOMPILER ERROR at PC485: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.GamePadSensitivityX)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getGamePadSensitivityX(), 0.1, 2)
    -- DECOMPILER ERROR at PC493: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.GamePadSensitivityY)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getGamePadSensitivityY(), 0.1, 2)
    -- DECOMPILER ERROR at PC500: Confused about usage of register: R4 in 'UnsetPending'

    if _ContentsGroup_isConsoleTest == true then
      (elems_.ConsolePadKeyType)._initValue = gameOptionSetting:getConsoleKeyType()
    else
      -- DECOMPILER ERROR at PC503: Confused about usage of register: R4 in 'UnsetPending'

      (elems_.ConsolePadKeyType)._initValue = 0
    end
    -- DECOMPILER ERROR at PC507: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.LUT)._initValue = gameOptionSetting:getCameraLUTFilter()
    -- DECOMPILER ERROR at PC515: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.Fov)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getFov(), 40, 70)
    -- DECOMPILER ERROR at PC523: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.CameraEffectMaster)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getCameraMasterPower(), 0, 1)
    -- DECOMPILER ERROR at PC531: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.CameraShakePower)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getCameraShakePower(), 0, 1)
    -- DECOMPILER ERROR at PC539: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.MotionBlurPower)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getMotionBlurPower(), 0, 1)
    -- DECOMPILER ERROR at PC547: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.CameraTranslatePower)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getCameraTranslatePower(), 0, 1)
    -- DECOMPILER ERROR at PC555: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.CameraFovPower)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getCameraFovPower(), 0, 1)
    -- DECOMPILER ERROR at PC559: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.ScreenShotQuality)._initValue = gameOptionSetting:getScreenShotQuality()
    -- DECOMPILER ERROR at PC563: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.ScreenShotFormat)._initValue = gameOptionSetting:getScreenShotFormat()
    -- DECOMPILER ERROR at PC571: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.WatermarkAlpha)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getWatermarkAlpha(), 0, 1)
    -- DECOMPILER ERROR at PC575: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.WatermarkScale)._initValue = gameOptionSetting:getWatermarkScale()
    -- DECOMPILER ERROR at PC579: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.WatermarkPosition)._initValue = gameOptionSetting:getWatermarkPosition()
    -- DECOMPILER ERROR at PC583: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.WatermarkService)._initValue = gameOptionSetting:getWatermarkService()
    -- DECOMPILER ERROR at PC587: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.ScreenMode)._initValue = gameOptionSetting:getScreenMode()
    -- DECOMPILER ERROR at PC591: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.AutoRunCamera)._initValue = gameOptionSetting:getAutoRunCamera()
    -- DECOMPILER ERROR at PC595: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.AutoRunCameraRotation)._initValue = gameOptionSetting:getAutoRunCameraRotation()
    -- DECOMPILER ERROR at PC604: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.ScreenResolution)._initValue = (self._availableResolutionList):findResolution(gameOptionSetting:getScreenResolutionWidth(), gameOptionSetting:getScreenResolutionHeight())
    -- DECOMPILER ERROR at PC612: Confused about usage of register: R4 in 'UnsetPending'

    if (elems_.ScreenResolution)._eventControl ~= nil then
      (self._userInitScreenResolution).width = gameOptionSetting:getScreenResolutionWidth()
      -- DECOMPILER ERROR at PC617: Confused about usage of register: R4 in 'UnsetPending'

      ;
      (self._userInitScreenResolution).height = gameOptionSetting:getScreenResolutionHeight()
      if -1 == (elems_.ScreenResolution)._initValue then
        for _,value in pairs((elems_.ScreenResolution)._eventControl) do
          value:SetText((self._userInitScreenResolution).width .. "x" .. (self._userInitScreenResolution).height)
        end
      else
        for _,value in pairs((elems_.ScreenResolution)._eventControl) do
          value:SetText(((elems_.ScreenResolution)._comboBoxList)[(elems_.ScreenResolution)._initValue])
        end
      end
    end
    -- DECOMPILER ERROR at PC660: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.CropModeEnable)._initValue = gameOptionSetting:getCropModeEnable()
    -- DECOMPILER ERROR at PC670: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.CropModeScaleX)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getCropModeScaleX(), 0.5, 1)
    -- DECOMPILER ERROR at PC680: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.CropModeScaleY)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getCropModeScaleY(), 0.5, 1)
    -- DECOMPILER ERROR at PC690: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.UIScale)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getUIScale(), 0.5, 2)
    -- DECOMPILER ERROR at PC700: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.GammaValue)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getGammaValue(), 0, 1)
    -- DECOMPILER ERROR at PC710: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.ContrastValue)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getContrastValue(), 0, 1)
    -- DECOMPILER ERROR at PC720: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.EffectAlpha)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getEffectAlpha(), 0.3, 1)
    -- DECOMPILER ERROR at PC730: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.SkillPostEffect)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getSkillPostEffect(), 0, 1)
    -- DECOMPILER ERROR at PC742: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.ColorBlind)._initValue = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ColorBlindMode)
    -- DECOMPILER ERROR at PC748: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.EnableMusic)._initValue = gameOptionSetting:getEnableMusic()
    -- DECOMPILER ERROR at PC754: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.EnableSound)._initValue = gameOptionSetting:getEnableSound()
    -- DECOMPILER ERROR at PC760: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.EnableEnv)._initValue = gameOptionSetting:getEnableEnvSound()
    -- DECOMPILER ERROR at PC766: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.EnableRidingSound)._initValue = gameOptionSetting:getEnableRidingSound()
    -- DECOMPILER ERROR at PC772: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.EnableWhisperMusic)._initValue = gameOptionSetting:getEnableWhisperSound()
    -- DECOMPILER ERROR at PC778: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.EnableTraySoundOnOff)._initValue = gameOptionSetting:getEnableTraySound()
    -- DECOMPILER ERROR at PC784: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.BattleSoundType)._initValue = gameOptionSetting:getEnableBattleSoundType()
    -- DECOMPILER ERROR at PC794: Confused about usage of register: R4 in 'UnsetPending'

    if true == gameOptionSetting:getEnableFairySound() then
      (elems_.EnableAudioFairy)._initValue = 1
    else
      -- DECOMPILER ERROR at PC799: Confused about usage of register: R4 in 'UnsetPending'

      (elems_.EnableAudioFairy)._initValue = 0
    end
    -- DECOMPILER ERROR at PC809: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.VolumeMaster)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getMasterVolume(), 0, 100)
    -- DECOMPILER ERROR at PC819: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.VolumeMusic)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getMusicVolume(), 0, 100)
    -- DECOMPILER ERROR at PC829: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.VolumeFx)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getFxVolume(), 0, 100)
    -- DECOMPILER ERROR at PC839: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.VolumeEnv)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getEnvSoundVolume(), 0, 100)
    -- DECOMPILER ERROR at PC849: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.VolumeDlg)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getDialogueVolume(), 0, 100)
    -- DECOMPILER ERROR at PC859: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.VolumeHitFxVolume)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getHitFxVolume(), 0, 100)
    -- DECOMPILER ERROR at PC869: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.VolumeHitFxWeight)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getHitFxWeight(), 0, 100)
    -- DECOMPILER ERROR at PC879: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.VolumeOtherPlayer)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getOtherPlayerVolume(), 0, 100)
    -- DECOMPILER ERROR at PC889: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.VolumeFairy)._initValue = self:FromRealValueToSliderValue(gameOptionSetting:getFairyVolume(), 0, 100)
    -- DECOMPILER ERROR at PC899: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.AlertNormalTrade)._initValue = not ToClient_GetMessageFilter((self.ALERT).NormalTrade)
    -- DECOMPILER ERROR at PC909: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.AlertRoyalTrade)._initValue = not ToClient_GetMessageFilter((self.ALERT).RoyalTrade)
    -- DECOMPILER ERROR at PC919: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.AlertOtherPlayerGetItem)._initValue = not ToClient_GetMessageFilter((self.ALERT).OtherPlayerGetItem)
    -- DECOMPILER ERROR at PC929: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.AlertLifeLevelUp)._initValue = not ToClient_GetMessageFilter((self.ALERT).LifeLevelUp)
    -- DECOMPILER ERROR at PC939: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.AlertItemMarket)._initValue = not ToClient_GetMessageFilter((self.ALERT).ItemMarket)
    -- DECOMPILER ERROR at PC949: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.AlertOtherMarket)._initValue = not ToClient_GetMessageFilter((self.ALERT).OtherMarket)
    -- DECOMPILER ERROR at PC959: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.AlertChangeRegion)._initValue = not ToClient_GetMessageFilter((self.ALERT).ChangeRegion)
    -- DECOMPILER ERROR at PC969: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.AlertFitnessLevelUp)._initValue = not ToClient_GetMessageFilter((self.ALERT).FitnessLevelUp)
    -- DECOMPILER ERROR at PC979: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.AlertTerritoryWar)._initValue = not ToClient_GetMessageFilter((self.ALERT).TerritoryWar)
    -- DECOMPILER ERROR at PC989: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.AlertGuildWar)._initValue = not ToClient_GetMessageFilter((self.ALERT).GuildWar)
    -- DECOMPILER ERROR at PC999: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.AlertEnchantSuccess)._initValue = not ToClient_GetMessageFilter((self.ALERT).EnchantSuccess)
    -- DECOMPILER ERROR at PC1009: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.AlertEnchantFail)._initValue = not ToClient_GetMessageFilter((self.ALERT).EnchantFail)
    -- DECOMPILER ERROR at PC1019: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.AlertGuildQuestMessage)._initValue = not ToClient_GetMessageFilter((self.ALERT).GuildQuestMessage)
    -- DECOMPILER ERROR at PC1029: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.AlertNearMonster)._initValue = not ToClient_GetMessageFilter((self.ALERT).NearMonster)
    -- DECOMPILER ERROR at PC1035: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.BlackSpiritNotice)._initValue = gameOptionSetting:getBlackSpiritNotice()
    -- DECOMPILER ERROR at PC1042: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.ShowCashAlert)._initValue = not gameOptionSetting:getCashAlert()
    -- DECOMPILER ERROR at PC1048: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (elems_.ShowGuildLoginMessage)._initValue = gameOptionSetting:getShowGuildLoginMessage()
    self:SetSkillCommandPanel(gameOptionSetting:getShowSkillCmd())
    setRotateRadarMode((elems_.RotateRadarMode)._initValue)
    setAutoRunCamera((elems_.AutoRunCamera)._initValue)
    setAutoRunCameraRotation((elems_.AutoRunCameraRotation)._initValue)
    -- DECOMPILER ERROR: 19 unprocessed JMP targets
  end
end

FGlobal_Option_InitializeOption = function(gameOptionSetting)
  -- function num : 0_31
  PaGlobal_Option:InitValue(gameOptionSetting)
  PaGlobal_Option:InitSetting()
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R1 in 'UnsetPending'

  if PaGlobal_Option._resetCheck == true then
    PaGlobal_Option._resetCheck = nil
    for elementName,option in pairs(PaGlobal_Option._elements) do
      option._curValue = nil
      option._applyValue = nil
      PaGlobal_Option:SetXXX(elementName, option._initValue)
    end
  end
end

FGlobal_Option_luaLoadComplete = function()
  -- function num : 0_32
  PaGlobal_Option:Init()
  ToClient_initGameOption()
  if isNeedGameOptionFromServer() == true then
    keyCustom_StartEdit()
  end
  if ToClient_isXBox() == true then
    PaGlobal_Option:SetUltra(true)
    setConsoleKeySet(1)
  end
end

FGlobal_Option_InitializeScreenResolution = function(availableScreenResolution)
  -- function num : 0_33
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_Option._availableResolutionList = availableScreenResolution
end

FromClient_RefreshGameOption = function(gameOptionSetting)
  -- function num : 0_34
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_Option._resetCheck = false
  FGlobal_Option_InitializeOption(gameOptionSetting)
end

FromClient_OtherPlayeUpdate = function(isEnable, isOption)
  -- function num : 0_35
  local isShow = isEnable
  if isEnable ~= false then
    do
      isEnable = isOption ~= true
      PaGlobal_Option:SetControlSetting("UseOtherPlayerUpdate", not isEnable)
      setUseOtherPlayerUpdate(isEnable)
      if isEnable then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_PLAYERHIDEOFF"))
      else
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_PLAYERHIDEON"))
      end
      -- DECOMPILER ERROR: 5 unprocessed JMP targets
    end
  end
end

FromClient_CanChangeOptionAfterSec = function(sec)
  -- function num : 0_36
  local msg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CANTCHANGE_TIERICONOPTION_COOLTIME", "sec", sec)
  if msg ~= nil and msg ~= "" then
    Proc_ShowMessage_Ack(msg)
  end
end

FromClient_RefreshMaidOptionInfo = function(gameOptionSetting)
  -- function num : 0_37
  local elems_ = PaGlobal_Option._elements
  local curValue = PaGlobal_Option:Get("MaidView") * (elems_.MaidView)._sliderValueMax
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.MaidView)._sliderValueMax = gameOptionSetting:getMaidMaxCount()
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (elems_.MaidView)._initValue = PaGlobal_Option:FromRealValueToSliderValue(curValue, 0, gameOptionSetting:getMaidMaxCount())
  PaGlobal_Option:SetXXX("MaidView", ((PaGlobal_Option._elements).MaidView)._initValue)
  local frameContent = ((PaGlobal_Option._frames).Function).View
  if frameContent ~= nil then
    local maidControl = (UI.getChildControl)(frameContent._uiFrameContent, "StaticText_BgOrder6_Import")
    local maidMaxControl = (UI.getChildControl)(maidControl, "StaticText_MaxMaidView")
    maidMaxControl:SetText(tostring(gameOptionSetting:getMaidMaxCount()))
  end
end

registerEvent("EventGameOptionInitGameOption", "FGlobal_Option_InitializeOption")
registerEvent("EventGameOptionInitDisplayModeList", "FGlobal_Option_InitializeScreenResolution")
registerEvent("FromClient_luaLoadComplete", "FGlobal_Option_luaLoadComplete")
registerEvent("FromClient_OtherPlayeUpdate", "FromClient_OtherPlayeUpdate")
registerEvent("FromClient_RefreshGameOption", "FromClient_RefreshGameOption")
registerEvent("FromClient_CanChangeOptionAfterSec", "FromClient_CanChangeOptionAfterSec")
registerEvent("FromClient_RefreshMaidOptionInfo", "FromClient_RefreshMaidOptionInfo")
-- DECOMPILER ERROR at PC155: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.SetSkillCommandPanel = function(self, check)
  -- function num : 0_38
  isChecked_SkillCommand = check
  if Panel_SkillCommand ~= nil then
    if isChecked_SkillCommand then
      local pcPosition = ((getSelfPlayer()):get()):getPosition()
      local regionInfo = getRegionInfoByPosition(pcPosition)
      if (regionInfo:get()):isSafeZone() == false then
        FGlobal_SkillCommand_Show(true)
      end
    else
      do
        Panel_SkillCommand:SetShow(false)
      end
    end
  end
end


