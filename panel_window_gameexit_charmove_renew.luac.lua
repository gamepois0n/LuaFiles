-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\gameexit\console\panel_window_gameexit_charmove_renew.luac 

-- params : ...
-- function num : 0
local Window_GameExit_CharMoveInfo = {
_ui = {_static_Bottom = (UI.getChildControl)(Panel_Window_GameExit_CharMove, "Static_Bottom"), _static_main = (UI.getChildControl)(Panel_Window_GameExit_CharMove, "Static_Main"), 
_bottom = {}
, 
_main = {}
, _button_NoticeMsg = (UI.getChildControl)(Panel_Window_GameExit_CharMove, "Button_NoticeMsg")}
, 
_config = {_maxCharacterSlot = 5}
, _characterWheelValue = 0, _regionWheelvalue = 0, _currentCharacterIndex = -1, _currentRegionIndex = -1, 
_characterInfoTable = {}
, 
_currentCharacterInfoTable = {}
, 
_characterUITable = {}
, 
_deliveryRegionTable = {}
, _exitTime = -1}
Window_GameExit_CharMoveInfo.SetNoticeMsg = function(self, delayTime)
  -- function num : 0_0
  local msg = nil
  if delayTime == nil then
    ((self._ui)._button_NoticeMsg):SetIgnore(true)
    msg = PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_GO_SWAPCHARACTER")
  else
    ;
    ((self._ui)._button_NoticeMsg):SetIgnore(false)
    msg = PAGetStringParam1(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_TO_CHARACTER_CHANGE", "remainTime", tostring(delayTime))
  end
  ;
  ((self._ui)._button_NoticeMsg):SetShow(true)
  ;
  ((self._ui)._button_NoticeMsg):SetText(msg)
end

Window_GameExit_CharMoveInfo.SetDeliveryRegion = function(self)
  -- function num : 0_1
  local deliveryPersonInfoList = ToClient_DeliveryPersonInfo()
  local deliverySize = deliveryPersonInfoList:size()
  if deliverySize < 0 then
    return 
  end
  for index = 0, deliverySize - 1 do
    local deliveryPersonInfo = deliveryPersonInfoList:atPointer(index)
    local destinationRegionInfo = deliveryPersonInfo:getRegionInfo()
    local regionInfoWrapper = getRegionInfoWrapper((destinationRegionInfo._regionKey):get())
    -- DECOMPILER ERROR at PC24: Confused about usage of register: R10 in 'UnsetPending'

    ;
    (self._deliveryRegionTable)[index] = regionInfoWrapper:getAreaName()
  end
end

Window_GameExit_CharMoveInfo.Clear = function(self)
  -- function num : 0_2
  self._currentCharacterInfoTable = {}
  self._characterWheelValue = 0
  self._regionWheelvalue = 0
  self._currentCharacterIndex = -1
  self._currentRegionIndex = -1
  self._exitTime = -1
  for index = 0, (self._config)._maxCharacterSlot - 1 do
    (((self._characterUITable)[index])._radioButton_Slot):SetCheck(false)
  end
end

Window_GameExit_CharMoveInfo.Update = function(self)
  -- function num : 0_3
  self._characterInfoTable = {}
  self._characterInfoTable = PaGlobalFunc_GameExit_GetCharInfoTable()
  self:SetDeliveryRegion()
end

PaGlobalFunc_GameExitCharMove_ButtonClick_Cancel = function()
  -- function num : 0_4
  PaGlobalFunc_GameExitCharMove_SetShow(false, false)
  PaGlobalFunc_GameExit_SetShow(true, false)
end

PaGlobalFunc_GameExitCharMove_ButtonClick_Confirm = function()
  -- function num : 0_5 , upvalues : Window_GameExit_CharMoveInfo
  local self = Window_GameExit_CharMoveInfo
  if ((self._ui)._button_NoticeMsg):GetShow() == true then
    return 
  end
  if #self._deliveryRegionTable == 0 or (self._deliveryRegionTable)[self._currentRegionIndex] == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "Lua_deliveryPerson_NotDestination"))
    return 
  end
  if self._currentCharacterIndex == -1 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "Lua_deliveryPerson_SelectCharacter"))
    return 
  end
  local characterData = getCharacterDataByIndex(self._currentCharacterIndex)
  if characterData == nil then
    return 
  end
  local classType = getCharacterClassType(characterData)
  local characterNo_64 = (getSelfPlayer()):getCharacterNo_64()
  if characterNo_64 == characterData._characterNo_s64 then
    return 
  end
  if ToClient_IsCustomizeOnlyClass(classType) == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DELIVERY_PERSON_NOTCHANGE"))
    return 
  end
  if characterData._level < 5 then
    NotifyDisplay(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GAMEEXIT_DONT_CHAGECHARACTER", "iLevel", 4))
    return 
  end
  local removeTime = getCharacterDataRemoveTime(self._currentCharacterIndex)
  if removeTime ~= nil then
    NotifyDisplay(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_CHARACTER_DELETE"))
    return 
  end
  local preText = ""
  local serverUtc64 = getServerUtc64()
  if (characterData._arrivalRegionKey):get() ~= 0 and serverUtc64 < characterData._arrivalTime then
    preText = PAGetString(Defines.StringSheet_GAME, "Lua_deliveryPerson_SelectPcDelivery2") .. "\n"
  end
  local messageContent = preText .. PAGetStringParam2(Defines.StringSheet_RESOURCE, "DELIVERY_PERSON_READY_CHK", "now_character", (getSelfPlayer()):getName(), "change_character", getCharacterName(getCharacterDataByIndex(self._currentCharacterIndex)))
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "Lua_deliveryPerson_Information"), content = messageContent, functionYes = PaGlobalFunc_GameExitCharMove_ChacacterMoveConfirm, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

PaGlobalFunc_GameExitCharMove_ChacacterMoveConfirm = function()
  -- function num : 0_6 , upvalues : Window_GameExit_CharMoveInfo
  local self = Window_GameExit_CharMoveInfo
  local deliveryPersonInfoList = ToClient_DeliveryPersonInfo()
  local deliveryPersonInfo = deliveryPersonInfoList:atPointer(self._currentRegionIndex)
  local destRegionInfo = deliveryPersonInfo:getRegionInfo()
  deliveryPerson_SendReserve((destRegionInfo._regionKey):get())
end

PaGlobalFunc_FromClient_GameExitCharMove_luaLoadComplete = function()
  -- function num : 0_7 , upvalues : Window_GameExit_CharMoveInfo
  local self = Window_GameExit_CharMoveInfo
  self:Initialize()
end

Window_GameExit_CharMoveInfo.Initialize = function(self)
  -- function num : 0_8
  self:InitControl()
  self:InitEvent()
  self:InitRegister()
end

PaGlobalFunc_GameExitCharMove_ButtonClick_CharacterSlot = function(index)
  -- function num : 0_9 , upvalues : Window_GameExit_CharMoveInfo
  local self = Window_GameExit_CharMoveInfo
  self._currentCharacterIndex = self._characterWheelValue + index
end

PaGlobalFunc_GameExitCharMove_UpdateRegionList = function(value)
  -- function num : 0_10 , upvalues : Window_GameExit_CharMoveInfo
  local self = Window_GameExit_CharMoveInfo
  if ((self._ui)._button_NoticeMsg):GetShow() == true then
    return 
  end
  self._regionWheelvalue = self._regionWheelvalue + value
  if self._regionWheelvalue < 0 then
    self._regionWheelvalue = 0
  end
  if #self._deliveryRegionTable < self._regionWheelvalue then
    self._regionWheelvalue = #self._deliveryRegionTable
  end
  self._currentRegionIndex = self._regionWheelvalue
  ;
  (((self._ui)._main)._staticText_RegionName):SetText((self._deliveryRegionTable)[self._currentRegionIndex])
end

PaGlobalFunc_GameExitCharMove_UpdateChararcterList = function(value)
  -- function num : 0_11 , upvalues : Window_GameExit_CharMoveInfo
  local self = Window_GameExit_CharMoveInfo
  self:Clear()
  self._characterWheelValue = self._characterWheelValue + value
  if self._characterWheelValue < 0 then
    self._characterWheelValue = 0
  end
  if getCharacterDataCount() < self._characterWheelValue + (self._config)._maxCharacterSlot then
    self._characterWheelValue = self._characterWheelValue - 1
  end
  if getCharacterDataCount() < (self._config)._maxCharacterSlot then
    self._characterWheelValue = 0
  end
  for index = 0, (self._config)._maxCharacterSlot - 1 do
    (((self._characterUITable)[index])._radioButton_Slot):SetShow(false)
    local isSuccess = self:SetCharacterSlot((self._characterInfoTable)[index + self._characterWheelValue], (self._characterUITable)[index])
    if isSuccess == false then
      return 
    end
    ;
    (((self._characterUITable)[index])._radioButton_Slot):SetShow(true)
    -- DECOMPILER ERROR at PC62: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self._currentCharacterInfoTable)[index] = (self._characterInfoTable)[index + self._characterWheelValue]
  end
end

Window_GameExit_CharMoveInfo.SetCharacterSlot = function(self, charInfo, charSlot)
  -- function num : 0_12
  if charInfo == nil or charSlot == nil then
    return false
  end
  ;
  (charSlot._staticText_Level):SetText(PAGetString(Defines.StringSheet_RESOURCE, "CHARACTERINFO_TEXT_LEVEL") .. charInfo._level)
  ;
  (charSlot._staticText_Name):SetText(charInfo._name)
  local isCaptureExist = (charSlot._static_Picture):ChangeTextureInfoNameNotDDS(charInfo._textureName, charInfo._classType, false)
  if isCaptureExist == true then
    ((charSlot._static_Picture):getBaseTexture()):setUV(0, 0, 1, 1)
  else
    if _ContentsGroup_isUsedNewCharacterInfo == false then
      if charInfo._classType == (CppEnums.ClassType).ClassType_Warrior then
        (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 1, 1, 156, 201)
        ;
        ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
      else
        do
          if charInfo._classType == (CppEnums.ClassType).ClassType_Ranger then
            (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 157, 1, 312, 201)
            ;
            ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
          else
            do
              if charInfo._classType == (CppEnums.ClassType).ClassType_Sorcerer then
                (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 313, 1, 468, 201)
                ;
                ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                ;
                (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
              else
                do
                  if charInfo._classType == (CppEnums.ClassType).ClassType_Giant then
                    (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
                    local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 1, 202, 156, 402)
                    ;
                    ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                    ;
                    (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                  else
                    do
                      if charInfo._classType == (CppEnums.ClassType).ClassType_Tamer then
                        (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
                        local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 157, 202, 312, 402)
                        ;
                        ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                        ;
                        (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                      else
                        do
                          if charInfo._classType == (CppEnums.ClassType).ClassType_BladeMaster then
                            (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
                            local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 313, 202, 468, 402)
                            ;
                            ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                            ;
                            (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                          else
                            do
                              if charInfo._classType == (CppEnums.ClassType).ClassType_Valkyrie then
                                (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 1, 1, 156, 201)
                                ;
                                ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                                ;
                                (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                              else
                                do
                                  if charInfo._classType == (CppEnums.ClassType).ClassType_BladeMasterWomen then
                                    (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                    local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 157, 1, 312, 201)
                                    ;
                                    ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                                    ;
                                    (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                                  else
                                    do
                                      if charInfo._classType == (CppEnums.ClassType).ClassType_Wizard then
                                        (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                        local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 313, 1, 468, 201)
                                        ;
                                        ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                                        ;
                                        (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                                      else
                                        do
                                          if charInfo._classType == (CppEnums.ClassType).ClassType_WizardWomen then
                                            (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                            local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 1, 202, 156, 402)
                                            ;
                                            ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                                            ;
                                            (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                                          else
                                            do
                                              if charInfo._classType == (CppEnums.ClassType).ClassType_NinjaWomen then
                                                (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                                local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 157, 202, 312, 402)
                                                ;
                                                ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                ;
                                                (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                                              else
                                                do
                                                  if charInfo._classType == (CppEnums.ClassType).ClassType_NinjaMan then
                                                    (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                                    local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 313, 202, 468, 402)
                                                    ;
                                                    ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                    ;
                                                    (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                                                  else
                                                    do
                                                      if charInfo._classType == (CppEnums.ClassType).ClassType_DarkElf then
                                                        (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_02.dds")
                                                        local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 1, 1, 156, 201)
                                                        ;
                                                        ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                        ;
                                                        (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                                                      else
                                                        do
                                                          if charInfo._classType == (CppEnums.ClassType).ClassType_Combattant then
                                                            (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_02.dds")
                                                            local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 157, 1, 312, 201)
                                                            ;
                                                            ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                            ;
                                                            (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                                                          else
                                                            do
                                                              if charInfo._classType == (CppEnums.ClassType).ClassType_CombattantWomen then
                                                                (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_02.dds")
                                                                local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 313, 1, 468, 201)
                                                                ;
                                                                ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                ;
                                                                (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                                                              else
                                                                do
                                                                  if charInfo._classType == (CppEnums.ClassType).ClassType_Lahn then
                                                                    (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_03.dds")
                                                                    local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 1, 1, 156, 201)
                                                                    ;
                                                                    ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                    ;
                                                                    (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                                                                  else
                                                                    do
                                                                      if charInfo._classType == (CppEnums.ClassType).ClassType_Orange then
                                                                        (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_03.dds")
                                                                        local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 1, 1, 156, 201)
                                                                        ;
                                                                        ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                        ;
                                                                        (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                                                                      end
                                                                      do
                                                                        local DefaultFace = (CppEnums.ClassType_DefaultFaceTexture)[charInfo._classType]
                                                                        ;
                                                                        (charSlot._static_Picture):ChangeTextureInfoName(DefaultFace[1])
                                                                        do
                                                                          local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, DefaultFace[2], DefaultFace[3], DefaultFace[4], DefaultFace[5])
                                                                          ;
                                                                          ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                          ;
                                                                          (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                                                                          return true
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

Window_GameExit_CharMoveInfo.InitControl = function(self)
  -- function num : 0_13 , upvalues : Window_GameExit_CharMoveInfo
  local self = Window_GameExit_CharMoveInfo
  local bottom = (self._ui)._bottom
  local main = (self._ui)._main
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui)._button_Confirm = (UI.getChildControl)((self._ui)._static_Bottom, "Button_Confirm")
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui)._button_Cancel = (UI.getChildControl)((self._ui)._static_Bottom, "Button_Cancel")
  main._button_RB = (UI.getChildControl)((self._ui)._static_main, "Button_RB")
  main._button_LB = (UI.getChildControl)((self._ui)._static_main, "Button_LB")
  main._staticText_RegionName = (UI.getChildControl)((self._ui)._static_main, "StaticText_RegionName")
  bottom._button_RT = (UI.getChildControl)((self._ui)._static_Bottom, "Button_RT")
  bottom._button_LT = (UI.getChildControl)((self._ui)._static_Bottom, "Button_LT")
  bottom._staticText_Desc = (UI.getChildControl)((self._ui)._static_Bottom, "StaticText_Desc")
  ;
  (bottom._staticText_Desc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (bottom._staticText_Desc):SetTextHorizonCenter()
  ;
  (bottom._button_RT):SetShow(getCharacterDataCount() > 5)
  ;
  (bottom._button_LT):SetShow(getCharacterDataCount() > 5)
  local baseSlotBg = (UI.getChildControl)((self._ui)._static_Bottom, "RadioButton_Slot1_G0")
  local baseSlot = {_radioButton_Slot = baseSlotBg, _static_Picture = (UI.getChildControl)(baseSlotBg, "Static_CharacterImage"), _staticText_Level = (UI.getChildControl)(baseSlotBg, "StaticText_Level"), _staticText_Name = (UI.getChildControl)(baseSlotBg, "StaticText_CharacterName")}
  local UCT = CppEnums.PA_UI_CONTROL_TYPE
  for index = 0, (self._config)._maxCharacterSlot - 1 do
    local uiTable = {_radioButton_Slot, _static_Picture, _staticText_Level, _staticText_Name}
    uiTable._radioButton_Slot = (UI.createControl)(UCT.PA_UI_CONTROL_RADIOBUTTON, (self._ui)._static_Bottom, "radioButton_Slot_" .. index)
    CopyBaseProperty(baseSlot._radioButton_Slot, uiTable._radioButton_Slot)
    uiTable._static_Picture = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, uiTable._radioButton_Slot, "static_Picture_" .. index)
    CopyBaseProperty(baseSlot._static_Picture, uiTable._static_Picture)
    uiTable._staticText_Level = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, uiTable._radioButton_Slot, "staticText_Level_" .. index)
    CopyBaseProperty(baseSlot._staticText_Level, uiTable._staticText_Level)
    uiTable._staticText_Name = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, uiTable._radioButton_Slot, "staticText_Name_" .. index)
    CopyBaseProperty(baseSlot._staticText_Name, uiTable._staticText_Name)
    ;
    (uiTable._radioButton_Slot):SetPosX((uiTable._radioButton_Slot):GetPosX() + ((uiTable._radioButton_Slot):GetSizeX() + 10) * index)
    ;
    (uiTable._radioButton_Slot):SetShow(false)
    -- DECOMPILER ERROR at PC200: Confused about usage of register: R12 in 'UnsetPending'

    ;
    (self._characterUITable)[index] = uiTable
  end
  for _,control in pairs(baseSlot) do
    control:SetShow(false)
    ;
    (UI.deleteControl)(control)
  end
  -- DECOMPILER ERROR: 3 unprocessed JMP targets
end

PaGlobalFunc_GameExitCharMove_UpdatePerFrame = function(deltaTime)
  -- function num : 0_14 , upvalues : Window_GameExit_CharMoveInfo
  local self = Window_GameExit_CharMoveInfo
  if self._exitTime == -1 then
    return 
  end
  self._exitTime = self._exitTime - deltaTime
  self:SetNoticeMsg(Int64toInt32(self._exitTime))
  if self._exitTime >= 0 then
    return 
  end
  self:SetNoticeMsg()
  self._exitTime = -1
end

PaGlobalFunc_GameExitCharMove_ButtonClick_ExitCancel = function()
  -- function num : 0_15 , upvalues : Window_GameExit_CharMoveInfo
  local self = Window_GameExit_CharMoveInfo
  if ((self._ui)._button_NoticeMsg):GetShow() == false then
    return 
  end
  if self._exitTime > 2 then
    sendGameDelayExitCancel()
    self._exitTime = -1
  end
end

Window_GameExit_CharMoveInfo.InitEvent = function(self)
  -- function num : 0_16
  local bottom = (self._ui)._bottom
  local main = (self._ui)._main
  Panel_Window_GameExit_CharMove:RegisterUpdateFunc("PaGlobalFunc_GameExitCharMove_UpdatePerFrame")
  ;
  ((self._ui)._button_NoticeMsg):addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExit_ButtonClick_ExitCancel()")
  ;
  ((self._ui)._button_Cancel):addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExitCharMove_ButtonClick_Cancel()")
  ;
  ((self._ui)._button_Confirm):addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExitCharMove_ButtonClick_Confirm()")
  ;
  (main._button_RB):addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExitCharMove_UpdateRegionList(1)")
  ;
  (main._button_LB):addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExitCharMove_UpdateRegionList(-1)")
  ;
  (bottom._button_RT):addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExitCharMove_UpdateChararcterList(1)")
  ;
  (bottom._button_LT):addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExitCharMove_UpdateChararcterList(-1)")
  for index = 0, (self._config)._maxCharacterSlot - 1 do
    (((self._characterUITable)[index])._radioButton_Slot):addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExitCharMove_ButtonClick_CharacterSlot(" .. index .. ")")
  end
end

PaGlobalFunc_FromClient_GameExitCharMove_SetDelayTime = function(delayTime)
  -- function num : 0_17 , upvalues : Window_GameExit_CharMoveInfo
  local self = Window_GameExit_CharMoveInfo
  if PaGlobalFunc_GameExitCharMove_GetShow() == false then
    return 
  end
  self._exitTime = delayTime
  self:SetNoticeMsg(delayTime)
end

PaGlobalFunc_FromClient_GameExitCharMove_GameExit = function()
  -- function num : 0_18 , upvalues : Window_GameExit_CharMoveInfo
  local self = Window_GameExit_CharMoveInfo
  if PaGlobalFunc_GameExitCharMove_GetShow() == false then
    return 
  end
  local rv = swapCharacter_Select(self._currentCharacterIndex, true)
  if rv == false then
    _PA_LOG("이호�\156", "실패�\164")
  end
end

PaGlobalFunc_GameExitCharMove_Resize = function()
  -- function num : 0_19
end

PaGlobalFunc_FromClient_GameExitCharMove_Attacked = function()
  -- function num : 0_20
  PaGlobalFunc_GameExitCharMove_SetShow(false, false)
end

Window_GameExit_CharMoveInfo.InitRegister = function(self)
  -- function num : 0_21
  registerEvent("onScreenResize", "PaGlobalFunc_GameExitCharMove_Resize")
  registerEvent("EventDeliveryForPersonChangeCharacter", "PaGlobalFunc_FromClient_GameExitCharMove_GameExit()")
  registerEvent("EventGameExitDelayTime", "PaGlobalFunc_FromClient_GameExitCharMove_SetDelayTime")
  registerEvent("progressEventCancelByAttacked", "PaGlobalFunc_FromClient_GameExitCharMove_Attacked")
end

PaGlobalFunc_GameExitCharMove_SetShow = function(isShow, isAni)
  -- function num : 0_22 , upvalues : Window_GameExit_CharMoveInfo
  local self = Window_GameExit_CharMoveInfo
  if ((self._ui)._button_NoticeMsg):GetShow() == true then
    return 
  end
  if isShow == true then
    sendWaitingListOfMyCharacters()
    SetUIMode((Defines.UIMode).eUIMode_GameExit)
    self:Clear()
    self:Update()
    PaGlobalFunc_GameExitCharMove_UpdateChararcterList(0)
    PaGlobalFunc_GameExitCharMove_UpdateRegionList(0)
  else
    SetUIMode((Defines.UIMode).eUIMode_Default)
    if ((self._ui)._button_NoticeMsg):GetShow() == true then
      PaGlobalFunc_GameExitCharMove_ButtonClick_ExitCancel()
    end
  end
  Panel_Window_GameExit_CharMove:SetShow(isShow, isAni)
end

PaGlobalFunc_GameExitCharMove_GetShow = function()
  -- function num : 0_23
  return Panel_Window_GameExit_CharMove:GetShow()
end

PaGlobalFunc_GameExitCharMove_Toggle = function()
  -- function num : 0_24
  PaGlobalFunc_GameExitCharMove_SetShow(not PaGlobalFunc_GameExitCharMove_GetShow(), false)
end

Panel_Window_GameExit_CharMove:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LB, "PaGlobalFunc_GameExitCharMove_UpdateRegionList(-1)")
Panel_Window_GameExit_CharMove:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RB, "PaGlobalFunc_GameExitCharMove_UpdateRegionList(1)")
Panel_Window_GameExit_CharMove:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LT, "PaGlobalFunc_GameExitCharMove_UpdateChararcterList(-1)")
Panel_Window_GameExit_CharMove:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RT, "PaGlobalFunc_GameExitCharMove_UpdateChararcterList(1)")
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_FromClient_GameExitCharMove_luaLoadComplete")

