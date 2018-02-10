-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\option\gameoptionutil.luac 

-- params : ...
-- function num : 0
local CONTROL = CppEnums.PA_UI_CONTROL_TYPE
-- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.SpectialControlComboBoxInitValue = function(self)
  -- function num : 0_0
  local option = nil
  option = (self._elements).ScreenResolution
  option._comboBoxList = {}
  option._comboBoxListCount = (self._availableResolutionList):getDisplayModeListSize()
  for ii = 0, option._comboBoxListCount - 1 do
    -- DECOMPILER ERROR at PC28: Confused about usage of register: R6 in 'UnsetPending'

    (option._comboBoxList)[ii] = tostring((self._availableResolutionList):getDisplayModeWidth(ii)) .. "x" .. tostring((self._availableResolutionList):getDisplayModeHeight(ii))
  end
end

-- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.radioButtonMapping_TextureQuality = function(self, value, fromRadioButtonToCppEnum)
  -- function num : 0_1
  local radioMap = {[0] = 2, [1] = 1, [2] = 0}
  return PaGlobal_Option:RadioButtonMapping(radioMap, value, fromRadioButtonToCppEnum)
end

-- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.radioButtonMapping_GraphicOption = function(self, value, fromRadioButtonToCppEnum)
  -- function num : 0_2
  local radioMap = {[0] = 5, [1] = 4, [2] = 3, [3] = 2, [4] = 1, [5] = 0, [6] = 6}
  return PaGlobal_Option:RadioButtonMapping(radioMap, value, fromRadioButtonToCppEnum)
end

-- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.radioButtonMapping_AudioResourceType = function(self, value, fromRadioButtonToCppEnum)
  -- function num : 0_3
  local radioMap = {}
  if isGameTypeKorea() then
    radioMap = {[0] = (CppEnums.ServiceResourceType).eServiceResourceType_KR, [1] = (CppEnums.ServiceResourceType).eServiceResourceType_JP, [2] = (CppEnums.ServiceResourceType).eServiceResourceType_EN}
  else
    if isGameTypeJapan() then
      radioMap = {[0] = (CppEnums.ServiceResourceType).eServiceResourceType_JP, [1] = (CppEnums.ServiceResourceType).eServiceResourceType_KR, [2] = (CppEnums.ServiceResourceType).eServiceResourceType_EN}
    else
    end
  end
  if not isGameTypeRussia() or isGameTypeEnglish() then
    radioMap = {[0] = (CppEnums.ServiceResourceType).eServiceResourceType_EN, [1] = (CppEnums.ServiceResourceType).eServiceResourceType_JP, [2] = (CppEnums.ServiceResourceType).eServiceResourceType_KR}
  else
    if isGameTypeTaiwan() then
      radioMap = {[0] = (CppEnums.ServiceResourceType).eServiceResourceType_TW, [1] = (CppEnums.ServiceResourceType).eServiceResourceType_JP, [2] = (CppEnums.ServiceResourceType).eServiceResourceType_KR}
    else
      if isGameTypeTR() then
        radioMap = {[0] = (CppEnums.ServiceResourceType).eServiceResourceType_TR}
      else
        if isGameTypeID() then
          radioMap = {[0] = (CppEnums.ServiceResourceType).eServiceResourceType_EN}
        else
          if isGameTypeTH() then
            radioMap = {[0] = (CppEnums.ServiceResourceType).eServiceResourceType_EN}
          end
        end
      end
    end
  end
  local val = PaGlobal_Option:RadioButtonMapping(radioMap, value, fromRadioButtonToCppEnum)
  if val == -1 then
    return 0
  end
  return val
end

-- DECOMPILER ERROR at PC16: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.radioButtonMapping_ServiceResourceType = function(self, value, fromRadioButtonToCppEnum)
  -- function num : 0_4
  local radioMap = {[0] = (CppEnums.ServiceResourceType).eServiceResourceType_EN, [1] = (CppEnums.ServiceResourceType).eServiceResourceType_FR, [2] = (CppEnums.ServiceResourceType).eServiceResourceType_ID}
  local resourceType = getGameServiceType()
  if (CppEnums.GameServiceType).eGameServiceType_DEV == resourceType then
    radioMap = {[0] = (CppEnums.ServiceResourceType).eServiceResourceType_EN, [1] = (CppEnums.ServiceResourceType).eServiceResourceType_FR, [2] = (CppEnums.ServiceResourceType).eServiceResourceType_ID}
  else
    if (CppEnums.GameServiceType).eGameServiceType_NA_ALPHA == resourceType then
      radioMap = {[0] = (CppEnums.ServiceResourceType).eServiceResourceType_EN, [1] = (CppEnums.ServiceResourceType).eServiceResourceType_FR, [2] = (CppEnums.ServiceResourceType).eServiceResourceType_DE}
    else
      if (CppEnums.GameServiceType).eGameServiceType_NA_REAL == resourceType then
        radioMap = {[0] = (CppEnums.ServiceResourceType).eServiceResourceType_EN, [1] = (CppEnums.ServiceResourceType).eServiceResourceType_FR, [2] = (CppEnums.ServiceResourceType).eServiceResourceType_DE}
      else
        if (CppEnums.GameServiceType).eGameServiceType_SA_ALPHA == resourceType then
          radioMap = {[0] = (CppEnums.ServiceResourceType).eServiceResourceType_PT, [1] = (CppEnums.ServiceResourceType).eServiceResourceType_ES}
        else
          if (CppEnums.GameServiceType).eGameServiceType_SA_REAL == resourceType then
            radioMap = {[0] = (CppEnums.ServiceResourceType).eServiceResourceType_PT, [1] = (CppEnums.ServiceResourceType).eServiceResourceType_ES}
          else
            if (CppEnums.GameServiceType).eGameServiceType_ID_ALPHA == resourceType then
              radioMap = {[0] = (CppEnums.ServiceResourceType).eServiceResourceType_ID, [1] = (CppEnums.ServiceResourceType).eServiceResourceType_EN}
            else
              if (CppEnums.GameServiceType).eGameServiceType_ID_REAL == resourceType then
                radioMap = {[0] = (CppEnums.ServiceResourceType).eServiceResourceType_ID, [1] = (CppEnums.ServiceResourceType).eServiceResourceType_EN}
              else
                if (CppEnums.GameServiceType).eGameServiceType_TR_ALPHA == resourceType then
                  radioMap = {[0] = (CppEnums.ServiceResourceType).eServiceResourceType_TR, [1] = (CppEnums.ServiceResourceType).eServiceResourceType_EN}
                else
                  if (CppEnums.GameServiceType).eGameServiceType_TR_REAL == resourceType then
                    radioMap = {[0] = (CppEnums.ServiceResourceType).eServiceResourceType_TR, [1] = (CppEnums.ServiceResourceType).eServiceResourceType_EN}
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  return PaGlobal_Option:RadioButtonMapping(radioMap, value, fromRadioButtonToCppEnum)
end

-- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.radioButtonMapping_ChatChannelType = function(self, value, fromRadioButtonToCppEnum)
  -- function num : 0_5
  local radioMap = {[0] = (CppEnums.LangType).LangType_International, [1] = (CppEnums.LangType).LangType_English, [2] = (CppEnums.LangType).LangType_French, [3] = (CppEnums.LangType).LangType_ID}
  local resourceType = getGameServiceType()
  if (CppEnums.GameServiceType).eGameServiceType_DEV == resourceType then
    radioMap = {[0] = (CppEnums.LangType).LangType_International, [1] = (CppEnums.LangType).LangType_English, [2] = (CppEnums.LangType).LangType_French, [3] = (CppEnums.LangType).LangType_ID}
  else
    if (CppEnums.GameServiceType).eGameServiceType_NA_ALPHA == resourceType then
      radioMap = {[0] = (CppEnums.LangType).LangType_International, [1] = (CppEnums.LangType).LangType_English, [2] = (CppEnums.LangType).LangType_French, [3] = (CppEnums.LangType).LangType_German}
    else
      if (CppEnums.GameServiceType).eGameServiceType_NA_REAL == resourceType then
        radioMap = {[0] = (CppEnums.LangType).LangType_International, [1] = (CppEnums.LangType).LangType_English, [2] = (CppEnums.LangType).LangType_French, [3] = (CppEnums.LangType).LangType_German}
      else
        if (CppEnums.GameServiceType).eGameServiceType_SA_ALPHA == resourceType then
          radioMap = {[0] = (CppEnums.LangType).LangType_International, [1] = (CppEnums.LangType).LangType_Pt, [2] = (CppEnums.LangType).LangType_Es}
        else
          if (CppEnums.GameServiceType).eGameServiceType_SA_REAL == resourceType then
            radioMap = {[0] = (CppEnums.LangType).LangType_International, [1] = (CppEnums.LangType).LangType_Pt, [2] = (CppEnums.LangType).LangType_Es}
          else
            if (CppEnums.GameServiceType).eGameServiceType_ID_ALPHA == resourceType then
              radioMap = {[0] = (CppEnums.LangType).LangType_International, [1] = (CppEnums.LangType).LangType_English, [2] = (CppEnums.LangType).LangType_ID}
            else
              if (CppEnums.GameServiceType).eGameServiceType_ID_REAL == resourceType then
                radioMap = {[0] = (CppEnums.LangType).LangType_International, [1] = (CppEnums.LangType).LangType_English, [2] = (CppEnums.LangType).LangType_ID}
              else
                if (CppEnums.GameServiceType).eGameServiceType_TR_ALPHA == resourceType then
                  radioMap = {[0] = (CppEnums.LangType).LangType_International, [1] = (CppEnums.LangType).LangType_TR, [2] = (CppEnums.LangType).LangType_English}
                else
                  if (CppEnums.GameServiceType).eGameServiceType_TR_REAL == resourceType then
                    radioMap = {[0] = (CppEnums.LangType).LangType_International, [1] = (CppEnums.LangType).LangType_TR, [2] = (CppEnums.LangType).LangType_English}
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  return PaGlobal_Option:RadioButtonMapping(radioMap, value, fromRadioButtonToCppEnum)
end

local isOnServiceResourceTypeTag = {[(CppEnums.ServiceResourceType).eServiceResourceType_Dev] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_DEV"), [(CppEnums.ServiceResourceType).eServiceResourceType_KR] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_KR"), [(CppEnums.ServiceResourceType).eServiceResourceType_EN] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_EN"), [(CppEnums.ServiceResourceType).eServiceResourceType_JP] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_JP"), [(CppEnums.ServiceResourceType).eServiceResourceType_CN] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_CN"), [(CppEnums.ServiceResourceType).eServiceResourceType_RU] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_RU"), [(CppEnums.ServiceResourceType).eServiceResourceType_FR] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_FR"), [(CppEnums.ServiceResourceType).eServiceResourceType_DE] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_DE"), [(CppEnums.ServiceResourceType).eServiceResourceType_ES] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_ES"), [(CppEnums.ServiceResourceType).eServiceResourceType_TW] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_TW"), [(CppEnums.ServiceResourceType).eServiceResourceType_PT] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_PT"), [(CppEnums.ServiceResourceType).eServiceResourceType_TH] = PAGetString(Defines.StringSheet_RESOURCE, "LUA_OPTION_TEXT_TH"), [(CppEnums.ServiceResourceType).eServiceResourceType_ID] = PAGetString(Defines.StringSheet_RESOURCE, "LUA_OPTION_TEXT_ID"), [(CppEnums.ServiceResourceType).eServiceResourceType_TR] = PAGetString(Defines.StringSheet_RESOURCE, "LUA_OPTION_TEXT_TR")}
local isOnServiceChatTypeTag = {[(CppEnums.LangType).LangType_Dev] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_DEV"), [(CppEnums.LangType).LangType_International] = PAGetString(Defines.StringSheet_RESOURCE, "LUA_OPTION_TEXT_INTERNATIONAL"), [(CppEnums.LangType).LangType_English] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_EN"), [(CppEnums.LangType).LangType_Jp] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_JP"), [(CppEnums.LangType).LangType_Cn] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_CN"), [(CppEnums.LangType).LangType_Ru] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_RU"), [(CppEnums.LangType).LangType_French] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_FR"), [(CppEnums.LangType).LangType_German] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_DE"), [(CppEnums.LangType).LangType_Es] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_ES"), [(CppEnums.LangType).LangType_Tw] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_TW"), [(CppEnums.LangType).LangType_Pt] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_PT"), [(CppEnums.LangType).LangType_TH] = PAGetString(Defines.StringSheet_RESOURCE, "LUA_OPTION_TEXT_TH"), [(CppEnums.LangType).LangType_ID] = PAGetString(Defines.StringSheet_RESOURCE, "LUA_OPTION_TEXT_ID"), [(CppEnums.LangType).LangType_TR] = PAGetString(Defines.StringSheet_RESOURCE, "LUA_OPTION_TEXT_TR")}
-- DECOMPILER ERROR at PC276: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Option.RadioButtonMapping = function(self, table, value, fromRadioButtonToCppEnum)
  -- function num : 0_6
  if fromRadioButtonToCppEnum == nil or fromRadioButtonToCppEnum == false then
    return table[value]
  end
  for i,v in pairs(table) do
    if v == value then
      return i
    end
  end
  return -1
end

-- DECOMPILER ERROR at PC280: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Option.GetEventTypeText = function(self, controlTypeEnum)
  -- function num : 0_7 , upvalues : CONTROL
  local eventType = nil
  if CONTROL.PA_UI_CONTROL_SLIDER == controlTypeEnum then
    eventType = "Mouse_LPress"
  else
    if CONTROL.PA_UI_CONTROL_COMBOBOX == controlTypeEnum then
      eventType = "Mouse_LUp"
    else
      if CONTROL.PA_UI_CONTROL_CHECKBUTTON == controlTypeEnum then
        eventType = "Mouse_LUp"
      else
        if CONTROL.PA_UI_CONTROL_RADIOBUTTON == controlTypeEnum then
          eventType = "Mouse_LUp"
        else
          if CONTROL.PA_UI_CONTROL_BUTTON == controlTypeEnum then
            eventType = "Mouse_LUp"
          end
        end
      end
    end
  end
  return eventType
end

-- DECOMPILER ERROR at PC284: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Option.GetControlTypeByControlName = function(self, controlName)
  -- function num : 0_8 , upvalues : CONTROL
  local controlTypeEnum = nil
  if controlName == "CheckButton" then
    controlTypeEnum = CONTROL.PA_UI_CONTROL_CHECKBUTTON
  else
    if controlName == "RadioButton" then
      controlTypeEnum = CONTROL.PA_UI_CONTROL_RADIOBUTTON
    else
      if controlName == "Slider" then
        controlTypeEnum = CONTROL.PA_UI_CONTROL_SLIDER
      else
        if controlName == "ComboBox" then
          controlTypeEnum = CONTROL.PA_UI_CONTROL_COMBOBOX
        else
          if controlName == "Button" then
            controlTypeEnum = CONTROL.PA_UI_CONTROL_BUTTON
          else
            controlTypeEnum = nil
          end
        end
      end
    end
  end
  return controlTypeEnum
end

-- DECOMPILER ERROR at PC287: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Option.FromSliderValueToRealValue = function(self, value, min, max)
  -- function num : 0_9
  clamp = function(value, lower, upper)
    -- function num : 0_9_0
    if upper < lower then
      lower = upper
    end
    return (math.max)(lower, (math.min)(upper, value))
  end

  value = clamp(value, 0, 1)
  local offset = max - min
  value = value * offset
  value = value + min
  return value
end

-- DECOMPILER ERROR at PC290: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Option.FromRealValueToSliderValue = function(self, value, lower, upper)
  -- function num : 0_10
  local offset = upper - lower
  value = value - lower
  value = (value) / offset
  return value
end

-- DECOMPILER ERROR at PC295: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Option.SpecialCreateRadioButton = function(self, elementName)
  -- function num : 0_11 , upvalues : isOnServiceResourceTypeTag, isOnServiceChatTypeTag
  if elementName == "ServiceResourceType" then
    local count = nil
    local tempCount = 10
    local controlCount = 6
    for ii = 0, tempCount do
      if self:radioButtonMapping_ServiceResourceType(ii) == nil then
        count = ii
        break
      end
    end
    do
      for i,eventControl in pairs(((self._elements)[elementName])._eventControl) do
        eventControl:SetText(isOnServiceResourceTypeTag[self:radioButtonMapping_ServiceResourceType(0)])
      end
      for ii = 1, controlCount do
        if ((self._elements)[elementName])["_eventControl" .. ii] == nil then
          break
        end
        for i,eventControl in pairs(((self._elements)[elementName])["_eventControl" .. ii]) do
          if ii < count then
            eventControl:SetShow(true)
            eventControl:SetText(isOnServiceResourceTypeTag[self:radioButtonMapping_ServiceResourceType(ii)])
          else
            eventControl:SetShow(false)
          end
        end
      end
      do
        if elementName == "ChatChannelType" then
          local count = nil
          local tempCount = 10
          local controlCount = 6
          for ii = 0, tempCount do
            if self:radioButtonMapping_ChatChannelType(ii) == nil then
              count = ii
              break
            end
          end
          do
            for i,eventControl in pairs(((self._elements)[elementName])._eventControl) do
              eventControl:SetText(isOnServiceChatTypeTag[self:radioButtonMapping_ChatChannelType(0)])
            end
            for ii = 1, controlCount do
              if ((self._elements)[elementName])["_eventControl" .. ii] == nil then
                break
              end
              for i,eventControl in pairs(((self._elements)[elementName])["_eventControl" .. ii]) do
                if ii < count then
                  eventControl:SetShow(true)
                  eventControl:SetText(isOnServiceChatTypeTag[self:radioButtonMapping_ChatChannelType(ii)])
                else
                  eventControl:SetShow(false)
                end
              end
            end
            do
              if elementName == "AudioResourceType" then
                local controlCount = 3
                for index,eventControl in pairs(((self._elements)[elementName])._eventControl) do
                  if ((self._elements)[elementName])._eventControl == nil and (((self._elements)[elementName])._eventControl)[index] == nil then
                    return 
                  else
                    if ((self._elements)[elementName])._eventControl1 == nil and (((self._elements)[elementName])._eventControl1)[index] == nil then
                      return 
                    else
                      if ((self._elements)[elementName])._eventControl2 == nil and (((self._elements)[elementName])._eventControl2)[index] == nil then
                        return 
                      end
                    end
                  end
                end
                if isGameTypeKorea() then
                  for index,eventControl in pairs(((self._elements)[elementName])._eventControl) do
                    ((((self._elements)[elementName])._eventControl)[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_KOREAN"))
                    ;
                    ((((self._elements)[elementName])._eventControl1)[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_JAPANESE"))
                    ;
                    ((((self._elements)[elementName])._eventControl2)[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ENGLISH"))
                  end
                else
                  do
                    if isGameTypeJapan() then
                      for index,eventControl in pairs(((self._elements)[elementName])._eventControl) do
                        ((((self._elements)[elementName])._eventControl)[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_JAPANESE"))
                        ;
                        ((((self._elements)[elementName])._eventControl1)[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_KOREAN"))
                        ;
                        ((((self._elements)[elementName])._eventControl2)[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ENGLISH"))
                      end
                    else
                    end
                    do
                      if not isGameTypeRussia() or isGameTypeEnglish() then
                        for index,eventControl in pairs(((self._elements)[elementName])._eventControl) do
                          ((((self._elements)[elementName])._eventControl)[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ENGLISH"))
                          ;
                          ((((self._elements)[elementName])._eventControl1)[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_JAPANESE"))
                          ;
                          ((((self._elements)[elementName])._eventControl2)[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_KOREAN"))
                        end
                      else
                        do
                          if isGameTypeTaiwan() then
                            for index,eventControl in pairs(((self._elements)[elementName])._eventControl) do
                              ((((self._elements)[elementName])._eventControl)[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ENGLISH"))
                              ;
                              ((((self._elements)[elementName])._eventControl1)[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_JAPANESE"))
                              ;
                              ((((self._elements)[elementName])._eventControl2)[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_KOREAN"))
                            end
                          else
                            do
                              if isGameTypeTR() then
                                for index,eventControl in pairs(((self._elements)[elementName])._eventControl) do
                                  ((((self._elements)[elementName])._eventControl)[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ENGLISH"))
                                  ;
                                  ((((self._elements)[elementName])._eventControl1)[index]):SetShow(false)
                                  ;
                                  ((((self._elements)[elementName])._eventControl2)[index]):SetShow(false)
                                end
                              else
                                do
                                  if isGameTypeID() then
                                    for index,eventControl in pairs(((self._elements)[elementName])._eventControl) do
                                      ((((self._elements)[elementName])._eventControl)[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ENGLISH"))
                                      ;
                                      ((((self._elements)[elementName])._eventControl1)[index]):SetShow(false)
                                      ;
                                      ((((self._elements)[elementName])._eventControl2)[index]):SetShow(false)
                                    end
                                  else
                                    do
                                      if isGameTypeTH() then
                                        for index,eventControl in pairs(((self._elements)[elementName])._eventControl) do
                                          ((((self._elements)[elementName])._eventControl)[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ENGLISH"))
                                          ;
                                          ((((self._elements)[elementName])._eventControl1)[index]):SetShow(false)
                                          ;
                                          ((((self._elements)[elementName])._eventControl2)[index]):SetShow(false)
                                        end
                                      else
                                        do
                                          _PA_LOG("LUA", "�\173 국가 리소스가 추가되면 �\180 곳도 수정 판단 해주어야합니�\164.")
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
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC298: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Option.SetUltra = function(self, value)
  -- function num : 0_12
  local graphicOption = (self._elements).GraphicOption
  if value == true then
    self:SetGraphicOption((self.GRAPHIC).VeryVeryHigh, true)
    graphicOption._beforeValue = graphicOption._initValue
    if graphicOption._applyValue ~= nil then
      graphicOption._beforeValue = graphicOption._applyValue
    end
    if graphicOption._curValue ~= nil then
      graphicOption._beforeValue = graphicOption._curValue
    end
    graphicOption._curValue = (self.GRAPHIC).VeryVeryHigh
  else
    if graphicOption._beforeValue == nil then
      return 
    end
    graphicOption._curValue = graphicOption._beforeValue
    self:SetGraphicOption(graphicOption._curValue, false)
  end
  self:ResetControlSettingTable(graphicOption)
  self:SetControlSettingTable(graphicOption, graphicOption._curValue)
end

-- DECOMPILER ERROR at PC301: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Option.SetGraphicOption = function(self, value, isIncrease)
  -- function num : 0_13
  local _SSAO = (self._elements).SSAO
  local _AntiAliasing = (self._elements).AntiAliasing
  local _Dof = (self._elements).Dof
  local _Tessellation = (self._elements).Tessellation
  if (self.GRAPHIC).VeryVeryLow == value then
    _SSAO._curValue = false
    _AntiAliasing._curValue = false
    _Dof._curValue = false
    _Tessellation._curValue = false
    for index,eventControl in pairs(_Tessellation._eventControl) do
      eventControl:SetMonoTone(true)
      eventControl:SetEnable(false)
    end
  else
    do
      if (self.GRAPHIC).VeryLow == value then
        if isIncrease == true then
          _SSAO._curValue = true
          _AntiAliasing._curValue = true
        else
          if isIncrease == false then
            _Dof._curValue = false
            _Tessellation._curValue = false
          end
        end
        for index,eventControl in pairs(_Tessellation._eventControl) do
          eventControl:SetMonoTone(true)
          eventControl:SetEnable(false)
        end
      else
        do
          if (self.GRAPHIC).Low == value then
            if isIncrease == true then
              _SSAO._curValue = true
              _AntiAliasing._curValue = true
            else
              if isIncrease == false then
                _Dof._curValue = false
                _Tessellation._curValue = false
              end
            end
            for index,eventControl in pairs(_Tessellation._eventControl) do
              eventControl:SetMonoTone(true)
              eventControl:SetEnable(false)
            end
          else
            do
              if (self.GRAPHIC).Medium == value then
                if isIncrease == true then
                  _SSAO._curValue = true
                  _AntiAliasing._curValue = true
                else
                  if isIncrease == false then
                    _Dof._curValue = false
                    _Tessellation._curValue = false
                  end
                end
                for index,eventControl in pairs(_Tessellation._eventControl) do
                  eventControl:SetMonoTone(true)
                  eventControl:SetEnable(false)
                end
              else
                do
                  if (self.GRAPHIC).High == value then
                    if isIncrease == true then
                      _SSAO._curValue = true
                      _AntiAliasing._curValue = true
                      _Dof._curValue = true
                      _Tessellation._curValue = false
                    else
                      if isIncrease == false then
                        _Tessellation._curValue = false
                      end
                    end
                    for index,eventControl in pairs(_Tessellation._eventControl) do
                      eventControl:SetMonoTone(true)
                      eventControl:SetEnable(false)
                    end
                  else
                    do
                      if (self.GRAPHIC).VeryHigh == value then
                        if isIncrease == true then
                          _SSAO._curValue = true
                          _AntiAliasing._curValue = true
                          _Dof._curValue = true
                        end
                        for index,eventControl in pairs(_Tessellation._eventControl) do
                          eventControl:SetMonoTone(false)
                          eventControl:SetEnable(true)
                        end
                      else
                        do
                          if (self.GRAPHIC).VeryVeryHigh == value then
                            if isIncrease == true then
                              _SSAO._curValue = true
                              _AntiAliasing._curValue = true
                              _Dof._curValue = true
                            end
                            for index,eventControl in pairs(_Tessellation._eventControl) do
                              eventControl:SetMonoTone(false)
                              eventControl:SetEnable(true)
                            end
                          end
                          do
                            self:SetControlSettingTable(_SSAO, _SSAO._curValue)
                            self:SetControlSettingTable(_AntiAliasing, _AntiAliasing._curValue)
                            self:SetControlSettingTable(_Dof, _Dof._curValue)
                            self:SetControlSettingTable(_Tessellation, _Tessellation._curValue)
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

-- DECOMPILER ERROR at PC304: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Option.SetSpecSetting = function(self, value)
  -- function num : 0_14
  local PETRENDER = {ALL = 0, ONLYME = 1, NONE = 2}
  local options = self._elements
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R4 in 'UnsetPending'

  if (self.SPEC).LowNormal == value then
    (options.GraphicOption)._curValue = (self.GRAPHIC).VeryLow
    self:SetGraphicOption((options.GraphicOption)._curValue, false)
    -- DECOMPILER ERROR at PC19: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (options.UseEffectFrameOptimization)._curValue = true
    -- DECOMPILER ERROR at PC21: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (options.EffectFrameOptimization)._curValue = 0.9
    -- DECOMPILER ERROR at PC23: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (options.UsePlayerEffectDistOptimization)._curValue = true
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (options.PlayerEffectDistOptimization)._curValue = 0.9
    -- DECOMPILER ERROR at PC27: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (options.UseCharacterUpdateFrameOptimize)._curValue = true
    -- DECOMPILER ERROR at PC29: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (options.UseOtherPlayerUpdate)._curValue = true
    -- DECOMPILER ERROR at PC31: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (options.WorkerVisible)._curValue = false
    -- DECOMPILER ERROR at PC34: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (options.PetRender)._curValue = PETRENDER.NONE
  else
    -- DECOMPILER ERROR at PC43: Confused about usage of register: R4 in 'UnsetPending'

    if (self.SPEC).MidNormal == value then
      (options.GraphicOption)._curValue = (self.GRAPHIC).Medium
      self:SetGraphicOption((options.GraphicOption)._curValue, false)
      -- DECOMPILER ERROR at PC50: Confused about usage of register: R4 in 'UnsetPending'

      ;
      (options.UseEffectFrameOptimization)._curValue = true
      -- DECOMPILER ERROR at PC52: Confused about usage of register: R4 in 'UnsetPending'

      ;
      (options.EffectFrameOptimization)._curValue = 0.6
      -- DECOMPILER ERROR at PC54: Confused about usage of register: R4 in 'UnsetPending'

      ;
      (options.UsePlayerEffectDistOptimization)._curValue = true
      -- DECOMPILER ERROR at PC56: Confused about usage of register: R4 in 'UnsetPending'

      ;
      (options.PlayerEffectDistOptimization)._curValue = 0.6
      -- DECOMPILER ERROR at PC58: Confused about usage of register: R4 in 'UnsetPending'

      ;
      (options.UseCharacterUpdateFrameOptimize)._curValue = true
      -- DECOMPILER ERROR at PC60: Confused about usage of register: R4 in 'UnsetPending'

      ;
      (options.UseOtherPlayerUpdate)._curValue = true
      -- DECOMPILER ERROR at PC62: Confused about usage of register: R4 in 'UnsetPending'

      ;
      (options.WorkerVisible)._curValue = false
      -- DECOMPILER ERROR at PC65: Confused about usage of register: R4 in 'UnsetPending'

      ;
      (options.PetRender)._curValue = PETRENDER.NONE
    else
      -- DECOMPILER ERROR at PC74: Confused about usage of register: R4 in 'UnsetPending'

      if (self.SPEC).HighNormal == value then
        (options.GraphicOption)._curValue = (self.GRAPHIC).VeryHigh
        self:SetGraphicOption((options.GraphicOption)._curValue, true)
        -- DECOMPILER ERROR at PC81: Confused about usage of register: R4 in 'UnsetPending'

        ;
        (options.UseEffectFrameOptimization)._curValue = true
        -- DECOMPILER ERROR at PC83: Confused about usage of register: R4 in 'UnsetPending'

        ;
        (options.EffectFrameOptimization)._curValue = 0.3
        -- DECOMPILER ERROR at PC85: Confused about usage of register: R4 in 'UnsetPending'

        ;
        (options.UsePlayerEffectDistOptimization)._curValue = true
        -- DECOMPILER ERROR at PC87: Confused about usage of register: R4 in 'UnsetPending'

        ;
        (options.PlayerEffectDistOptimization)._curValue = 0.3
        -- DECOMPILER ERROR at PC89: Confused about usage of register: R4 in 'UnsetPending'

        ;
        (options.UseCharacterUpdateFrameOptimize)._curValue = true
        -- DECOMPILER ERROR at PC91: Confused about usage of register: R4 in 'UnsetPending'

        ;
        (options.UseOtherPlayerUpdate)._curValue = false
        -- DECOMPILER ERROR at PC93: Confused about usage of register: R4 in 'UnsetPending'

        ;
        (options.WorkerVisible)._curValue = false
        -- DECOMPILER ERROR at PC96: Confused about usage of register: R4 in 'UnsetPending'

        ;
        (options.PetRender)._curValue = PETRENDER.ONLYME
      else
        -- DECOMPILER ERROR at PC105: Confused about usage of register: R4 in 'UnsetPending'

        if (self.SPEC).HighestNormal == value then
          (options.GraphicOption)._curValue = (self.GRAPHIC).VeryVeryHigh
          self:SetGraphicOption((options.GraphicOption)._curValue, true)
          -- DECOMPILER ERROR at PC112: Confused about usage of register: R4 in 'UnsetPending'

          ;
          (options.UseEffectFrameOptimization)._curValue = false
          -- DECOMPILER ERROR at PC114: Confused about usage of register: R4 in 'UnsetPending'

          ;
          (options.UsePlayerEffectDistOptimization)._curValue = false
          -- DECOMPILER ERROR at PC116: Confused about usage of register: R4 in 'UnsetPending'

          ;
          (options.UseCharacterUpdateFrameOptimize)._curValue = false
          -- DECOMPILER ERROR at PC118: Confused about usage of register: R4 in 'UnsetPending'

          ;
          (options.UseOtherPlayerUpdate)._curValue = false
          -- DECOMPILER ERROR at PC120: Confused about usage of register: R4 in 'UnsetPending'

          ;
          (options.WorkerVisible)._curValue = true
          -- DECOMPILER ERROR at PC123: Confused about usage of register: R4 in 'UnsetPending'

          ;
          (options.PetRender)._curValue = PETRENDER.ALL
        else
          -- DECOMPILER ERROR at PC132: Confused about usage of register: R4 in 'UnsetPending'

          if (self.SPEC).LowSiege == value then
            (options.GraphicOption)._curValue = (self.GRAPHIC).VeryLow
            self:SetGraphicOption((options.GraphicOption)._curValue, false)
            -- DECOMPILER ERROR at PC139: Confused about usage of register: R4 in 'UnsetPending'

            ;
            (options.UseEffectFrameOptimization)._curValue = true
            -- DECOMPILER ERROR at PC141: Confused about usage of register: R4 in 'UnsetPending'

            ;
            (options.EffectFrameOptimization)._curValue = 1
            -- DECOMPILER ERROR at PC143: Confused about usage of register: R4 in 'UnsetPending'

            ;
            (options.UsePlayerEffectDistOptimization)._curValue = true
            -- DECOMPILER ERROR at PC145: Confused about usage of register: R4 in 'UnsetPending'

            ;
            (options.PlayerEffectDistOptimization)._curValue = 1
            -- DECOMPILER ERROR at PC147: Confused about usage of register: R4 in 'UnsetPending'

            ;
            (options.UseCharacterUpdateFrameOptimize)._curValue = true
            -- DECOMPILER ERROR at PC149: Confused about usage of register: R4 in 'UnsetPending'

            ;
            (options.UseOtherPlayerUpdate)._curValue = true
            -- DECOMPILER ERROR at PC151: Confused about usage of register: R4 in 'UnsetPending'

            ;
            (options.WorkerVisible)._curValue = false
            -- DECOMPILER ERROR at PC154: Confused about usage of register: R4 in 'UnsetPending'

            ;
            (options.PetRender)._curValue = PETRENDER.NONE
          else
            -- DECOMPILER ERROR at PC163: Confused about usage of register: R4 in 'UnsetPending'

            if (self.SPEC).MidSiege == value then
              (options.GraphicOption)._curValue = (self.GRAPHIC).Medium
              self:SetGraphicOption((options.GraphicOption)._curValue, false)
              -- DECOMPILER ERROR at PC170: Confused about usage of register: R4 in 'UnsetPending'

              ;
              (options.UseEffectFrameOptimization)._curValue = true
              -- DECOMPILER ERROR at PC172: Confused about usage of register: R4 in 'UnsetPending'

              ;
              (options.EffectFrameOptimization)._curValue = 0.75
              -- DECOMPILER ERROR at PC174: Confused about usage of register: R4 in 'UnsetPending'

              ;
              (options.UsePlayerEffectDistOptimization)._curValue = true
              -- DECOMPILER ERROR at PC176: Confused about usage of register: R4 in 'UnsetPending'

              ;
              (options.PlayerEffectDistOptimization)._curValue = 0.75
              -- DECOMPILER ERROR at PC178: Confused about usage of register: R4 in 'UnsetPending'

              ;
              (options.UseCharacterUpdateFrameOptimize)._curValue = true
              -- DECOMPILER ERROR at PC180: Confused about usage of register: R4 in 'UnsetPending'

              ;
              (options.UseOtherPlayerUpdate)._curValue = true
              -- DECOMPILER ERROR at PC182: Confused about usage of register: R4 in 'UnsetPending'

              ;
              (options.WorkerVisible)._curValue = false
              -- DECOMPILER ERROR at PC185: Confused about usage of register: R4 in 'UnsetPending'

              ;
              (options.PetRender)._curValue = PETRENDER.NONE
            else
              -- DECOMPILER ERROR at PC194: Confused about usage of register: R4 in 'UnsetPending'

              if (self.SPEC).HighSiege == value then
                (options.GraphicOption)._curValue = (self.GRAPHIC).VeryHigh
                self:SetGraphicOption((options.GraphicOption)._curValue, true)
                -- DECOMPILER ERROR at PC201: Confused about usage of register: R4 in 'UnsetPending'

                ;
                (options.UseEffectFrameOptimization)._curValue = true
                -- DECOMPILER ERROR at PC203: Confused about usage of register: R4 in 'UnsetPending'

                ;
                (options.EffectFrameOptimization)._curValue = 0.5
                -- DECOMPILER ERROR at PC205: Confused about usage of register: R4 in 'UnsetPending'

                ;
                (options.UsePlayerEffectDistOptimization)._curValue = true
                -- DECOMPILER ERROR at PC207: Confused about usage of register: R4 in 'UnsetPending'

                ;
                (options.PlayerEffectDistOptimization)._curValue = 0.5
                -- DECOMPILER ERROR at PC209: Confused about usage of register: R4 in 'UnsetPending'

                ;
                (options.UseCharacterUpdateFrameOptimize)._curValue = true
                -- DECOMPILER ERROR at PC211: Confused about usage of register: R4 in 'UnsetPending'

                ;
                (options.UseOtherPlayerUpdate)._curValue = true
                -- DECOMPILER ERROR at PC213: Confused about usage of register: R4 in 'UnsetPending'

                ;
                (options.WorkerVisible)._curValue = false
                -- DECOMPILER ERROR at PC216: Confused about usage of register: R4 in 'UnsetPending'

                ;
                (options.PetRender)._curValue = PETRENDER.ONLYME
              else
                -- DECOMPILER ERROR at PC225: Confused about usage of register: R4 in 'UnsetPending'

                if (self.SPEC).HighestSiege == value then
                  (options.GraphicOption)._curValue = (self.GRAPHIC).VeryVeryHigh
                  self:SetGraphicOption((options.GraphicOption)._curValue, true)
                  -- DECOMPILER ERROR at PC232: Confused about usage of register: R4 in 'UnsetPending'

                  ;
                  (options.UseEffectFrameOptimization)._curValue = true
                  -- DECOMPILER ERROR at PC234: Confused about usage of register: R4 in 'UnsetPending'

                  ;
                  (options.EffectFrameOptimization)._curValue = 0.3
                  -- DECOMPILER ERROR at PC236: Confused about usage of register: R4 in 'UnsetPending'

                  ;
                  (options.UsePlayerEffectDistOptimization)._curValue = true
                  -- DECOMPILER ERROR at PC238: Confused about usage of register: R4 in 'UnsetPending'

                  ;
                  (options.PlayerEffectDistOptimization)._curValue = 0.3
                  -- DECOMPILER ERROR at PC240: Confused about usage of register: R4 in 'UnsetPending'

                  ;
                  (options.UseCharacterUpdateFrameOptimize)._curValue = true
                  -- DECOMPILER ERROR at PC242: Confused about usage of register: R4 in 'UnsetPending'

                  ;
                  (options.UseOtherPlayerUpdate)._curValue = false
                  -- DECOMPILER ERROR at PC244: Confused about usage of register: R4 in 'UnsetPending'

                  ;
                  (options.WorkerVisible)._curValue = false
                  -- DECOMPILER ERROR at PC247: Confused about usage of register: R4 in 'UnsetPending'

                  ;
                  (options.PetRender)._curValue = PETRENDER.ONLYME
                end
              end
            end
          end
        end
      end
    end
  end
  -- DECOMPILER ERROR at PC249: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (options.GraphicUltra)._curValue = false
  self:ClickedConfirmOption()
  self:MoveUi((self.UIMODE).Main)
end

local InitSpectionOption_LUT = function()
  -- function num : 0_15
  local parent = (UI.getChildControl)((((PaGlobal_Option._frames).Graphic).Effect)._uiFrameContent, "StaticText_BgOrder0_Import")
  ;
  ((UI.getChildControl)(parent, "Button_LUTReset")):addInputEvent("Mouse_LUp", "PaGlobal_Option:SetRecommandationLUT()")
  ;
  ((UI.getChildControl)(parent, "Button_LUTReset2")):addInputEvent("Mouse_LUp", "PaGlobal_Option:SetRecommandationLUT2()")
end

local LUTRecommandation = -1
local LUTRecommandation2 = -1
local LUTRecommandationName = "Vibrance"
local LUTRecommandationName2 = "NonContrast"
-- DECOMPILER ERROR at PC314: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_Option.SetRecommandationLUT = function(self)
  -- function num : 0_16 , upvalues : LUTRecommandation, LUTRecommandationName
  if LUTRecommandation == -1 then
    for idx = 0, 30 do
      if getCameraLUTFilterName(idx) == LUTRecommandationName then
        LUTRecommandation = idx
        LUTRecommandationName = nil
        break
      end
    end
  end
  do
    local _contrastValue = 0.7
    if LUTRecommandation ~= -1 then
      self:SetXXX("LUT", LUTRecommandation)
      self:SetXXX("ContrastValue", _contrastValue)
    end
  end
end

-- DECOMPILER ERROR at PC319: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_Option.SetRecommandationLUT2 = function(self)
  -- function num : 0_17 , upvalues : LUTRecommandation2, LUTRecommandationName2
  if LUTRecommandation2 == -1 then
    for idx = 0, 30 do
      if getCameraLUTFilterName(idx) == LUTRecommandationName2 then
        LUTRecommandation2 = idx
        LUTRecommandationName2 = nil
        break
      end
    end
  end
  do
    local _contrastValue = 0.5
    if LUTRecommandation2 ~= -1 then
      self:SetXXX("LUT", LUTRecommandation2)
      self:SetXXX("ContrastValue", _contrastValue)
    end
  end
end

-- DECOMPILER ERROR at PC323: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_Option.SpectialOptionInit = function(self)
  -- function num : 0_18 , upvalues : InitSpectionOption_LUT
  InitSpectionOption_LUT()
  InitSpectionOption_LUT = nil
end


