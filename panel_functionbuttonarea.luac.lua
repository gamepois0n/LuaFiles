-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\z_righttopicons\panel_functionbuttonarea.luac 

-- params : ...
-- function num : 0
Panel_FunctionButton_Area:SetShow(true)
local buttonId = {_landVehicle = 0, _horseRace = 1, _summon = 2, _seaVehicle = 3, _guildVehicle = 4, _summonElephant = 5, _house = 6, _worker = 7, _personalGarden = 8, _pet = 9, _maid = 10, _camp = 11, _siegeArea = 12, _duel = 13, _npcFind = 14, _movieGuide = 15, _voiceChat = 16, _blackSpiritTraining = 17, _militia = 18, _count = 19}
PaGlobal_FunctionButtonArea = {
_ui = {_bg = (UI.getChildControl)(Panel_FunctionButton_Area, "Static_FunctionButtonBg"), _editBg = (UI.getChildControl)(Panel_FunctionButton_Area, "Static_FunctionButtonEditBg"), _slider = (UI.getChildControl)(Panel_FunctionButton_Area, "Slider_FunctionButton"), 
_topButton = {}
, 
_editBox = {}
, _optionButton = nil, _saveButton = nil, _closeButton = nil, _effect = nil}
, 
_data = {
[buttonId._landVehicle] = {
_normal = {2, 2, 39, 39}
, 
_over = {41, 2, 78, 39}
, 
_click = {80, 2, 117, 39}
, _isOpen = true}
, 
[buttonId._horseRace] = {
_normal = {119, 470, 156, 507}
, 
_over = {158, 470, 195, 507}
, 
_click = {197, 470, 234, 507}
, _isOpen = true}
, 
[buttonId._summon] = {
_normal = {119, 431, 156, 468}
, 
_over = {158, 431, 195, 468}
, 
_click = {197, 431, 234, 468}
, _isOpen = true}
, 
[buttonId._seaVehicle] = {
_normal = {2, 275, 39, 312}
, 
_over = {41, 275, 78, 312}
, 
_click = {80, 275, 117, 312}
, _isOpen = true}
, 
[buttonId._guildVehicle] = {
_normal = {119, 158, 156, 195}
, 
_over = {158, 158, 195, 195}
, 
_click = {197, 158, 234, 195}
, _isOpen = true}
, 
[buttonId._summonElephant] = {
_normal = {2, 314, 39, 351}
, 
_over = {41, 314, 78, 351}
, 
_click = {80, 314, 117, 351}
, _isOpen = true}
, 
[buttonId._house] = {
_normal = {2, 431, 39, 468}
, 
_over = {41, 431, 78, 468}
, 
_click = {80, 431, 117, 468}
, _isOpen = true}
, 
[buttonId._worker] = {
_normal = {119, 41, 156, 78}
, 
_over = {158, 41, 195, 78}
, 
_click = {197, 41, 234, 78}
, _isOpen = true}
, 
[buttonId._personalGarden] = {
_normal = {2, 470, 39, 507}
, 
_over = {41, 470, 78, 507}
, 
_click = {80, 470, 117, 507}
, _isOpen = true}
, 
[buttonId._pet] = {
_normal = {119, 2, 156, 39}
, 
_over = {158, 2, 195, 39}
, 
_click = {197, 2, 234, 39}
, _isOpen = true}
, 
[buttonId._maid] = {
_normal = {119, 119, 156, 156}
, 
_over = {158, 119, 195, 156}
, 
_click = {197, 119, 234, 156}
, _isOpen = true}
, 
[buttonId._camp] = {
_normal = {2, 353, 39, 390}
, 
_over = {41, 353, 78, 390}
, 
_click = {80, 353, 117, 390}
, _isOpen = true}
, 
[buttonId._siegeArea] = {
_normal = {119, 353, 156, 390}
, 
_over = {158, 353, 195, 390}
, 
_click = {197, 353, 234, 390}
, _isOpen = true}
, 
[buttonId._duel] = {
_normal = {2, 197, 39, 234}
, 
_over = {41, 197, 78, 234}
, 
_click = {80, 197, 117, 234}
, _isOpen = true}
, 
[buttonId._npcFind] = {
_normal = {119, 197, 156, 234}
, 
_over = {158, 197, 195, 234}
, 
_click = {197, 197, 234, 234}
, _isOpen = true}
, 
[buttonId._movieGuide] = {
_normal = {119, 275, 156, 312}
, 
_over = {158, 275, 195, 312}
, 
_click = {197, 275, 234, 312}
, _isOpen = true}
, 
[buttonId._voiceChat] = {
_normal = {119, 236, 156, 273}
, 
_over = {158, 236, 195, 273}
, 
_click = {197, 236, 234, 273}
, _isOpen = true}
, 
[buttonId._blackSpiritTraining] = {
_normal = {119, 392, 156, 429}
, 
_over = {158, 392, 195, 429}
, 
_click = {197, 392, 234, 429}
, _isOpen = true}
, 
[buttonId._militia] = {
_normal = {2, 392, 39, 429}
, 
_over = {41, 392, 78, 429}
, 
_click = {80, 392, 117, 429}
, _isOpen = true}
}
, 
_landVehicleTextureData = {
_horseNormal = {
_normal = {2, 2, 39, 39}
, 
_over = {41, 2, 78, 39}
, 
_click = {80, 2, 117, 39}
}
, 
_horsePipe = {
_normal = {2, 80, 39, 117}
, 
_over = {41, 80, 78, 117}
, 
_click = {80, 80, 117, 117}
}
, 
_horsePcRoom = {
_normal = {2, 41, 39, 78}
, 
_over = {41, 41, 78, 78}
, 
_click = {80, 41, 117, 78}
}
, 
_camel = {
_normal = {2, 158, 39, 195}
, 
_over = {41, 158, 78, 195}
, 
_click = {80, 158, 117, 195}
}
, 
_donkey = {
_normal = {119, 80, 156, 117}
, 
_over = {158, 80, 195, 117}
, 
_click = {197, 80, 234, 117}
}
, 
_babyElephant = {
_normal = {2, 119, 39, 156}
, 
_over = {41, 119, 78, 156}
, 
_click = {80, 119, 117, 156}
}
, 
_carriage = {
_normal = {2, 236, 39, 273}
, 
_over = {41, 236, 78, 273}
, 
_click = {80, 236, 117, 273}
}
}
, 
_summonTextureData = {
_summoner = {
_normal = {119, 431, 156, 468}
, 
_over = {158, 431, 195, 468}
, 
_click = {197, 431, 234, 468}
}
, 
_wizard = {
_normal = {119, 314, 156, 351}
, 
_over = {158, 314, 195, 351}
, 
_click = {197, 314, 234, 351}
}
}
, 
_defaultGroup = {
[1] = {buttonId._npcFind + 1, buttonId._landVehicle + 1, buttonId._horseRace + 1, buttonId._pet + 1, buttonId._house + 1, buttonId._worker + 1}
, 
[2] = {0, 0, 0, 0, 0, 0}
, 
[3] = {0, 0, 0, 0, 0, 0}
}
, 
_compareGroup = {
[1] = {}
, 
[2] = {}
, 
[3] = {}
}
, _iconPath = "Renewal/Button/PC_Btn_00.dds", _topIconCount = 6, _groupCount = 3, _iconCount = 6, _isShowElephant = false, _currentGroup = 1, _currentSlot = 0}
-- DECOMPILER ERROR at PC796: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.Initialize = function(self)
  -- function num : 0_0 , upvalues : buttonId
  for index = 0, self._topIconCount - 1 do
    local tempBg = (UI.getChildControl)((self._ui)._bg, "Static_SlotBG" .. index + 1)
    -- DECOMPILER ERROR at PC20: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((self._ui)._topButton)[index] = (UI.getChildControl)(tempBg, "Button_Horse")
    ;
    (((self._ui)._topButton)[index]):addInputEvent("Mouse_LUp", "PaGlobal_FunctionButtonArea:HandleLClicked_TopSlot(" .. index .. ")")
    ;
    (((self._ui)._topButton)[index]):addInputEvent("Mouse_On", "")
    ;
    (((self._ui)._topButton)[index]):addInputEvent("Mouse_Out", "")
  end
  -- DECOMPILER ERROR at PC53: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._optionButton = (UI.getChildControl)((self._ui)._bg, "Button_OptionButton")
  ;
  ((self._ui)._optionButton):addInputEvent("Mouse_LUp", "PaGlobal_FunctionButtonArea:EditBox_ShowToggle()")
  self:OpenCheck()
  -- DECOMPILER ERROR at PC69: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._saveButton = (UI.getChildControl)((self._ui)._editBg, "Button_Save")
  ;
  ((self._ui)._saveButton):addInputEvent("Mouse_LUp", "PaGlobal_FunctionButtonArea:Save()")
  -- DECOMPILER ERROR at PC83: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._closeButton = (UI.getChildControl)((self._ui)._editBg, "Button_Close")
  ;
  ((self._ui)._closeButton):addInputEvent("Mouse_LUp", "PaGlobal_FunctionButtonArea:Close()")
  -- DECOMPILER ERROR at PC97: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._effect = (UI.getChildControl)((self._ui)._editBg, "Static_Effect")
  local editBox = (self._ui)._editBox
  editBox._radioButton = {}
  editBox._slotBg = {}
  editBox._slotIcon = {}
  for index = 0, self._groupCount - 1 do
    local tempRadioBtn = (UI.getChildControl)((self._ui)._editBg, "Radiobutton_Group" .. index + 1)
    tempRadioBtn:addInputEvent("Mouse_LUp", "")
    -- DECOMPILER ERROR at PC124: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (editBox._radioButton)[index] = tempRadioBtn
    local tempSlotBg = (UI.getChildControl)((self._ui)._editBg, "Static_SlotBg")
    local tempIcon = (UI.getChildControl)(tempSlotBg, "Button_Icon")
    -- DECOMPILER ERROR at PC138: Confused about usage of register: R9 in 'UnsetPending'

    ;
    (editBox._slotBg)[index] = {}
    -- DECOMPILER ERROR at PC141: Confused about usage of register: R9 in 'UnsetPending'

    ;
    (editBox._slotIcon)[index] = {}
    for iIndex = 0, self._iconCount - 1 do
      -- DECOMPILER ERROR at PC162: Confused about usage of register: R13 in 'UnsetPending'

      ((editBox._slotBg)[index])[iIndex] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, (self._ui)._editBg, "SlotBg_" .. index .. "_" .. iIndex)
      CopyBaseProperty(tempSlotBg, ((editBox._slotBg)[index])[iIndex])
      ;
      (((editBox._slotBg)[index])[iIndex]):SetPosX(32 + iIndex * 43)
      ;
      (((editBox._slotBg)[index])[iIndex]):SetPosY(47 + index * 46)
      ;
      (((editBox._slotBg)[index])[iIndex]):SetShow(true)
      -- DECOMPILER ERROR at PC205: Confused about usage of register: R13 in 'UnsetPending'

      ;
      ((editBox._slotIcon)[index])[iIndex] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, ((editBox._slotBg)[index])[iIndex], "SlotIcon" .. index .. "_" .. iIndex)
      CopyBaseProperty(tempIcon, ((editBox._slotIcon)[index])[iIndex])
      ;
      (((editBox._slotIcon)[index])[iIndex]):addInputEvent("Mouse_LUp", "PaGlobal_FunctionButtonArea:HandleLClicked_SelectSlot(" .. index .. "," .. iIndex .. ")")
      ;
      (((editBox._slotIcon)[index])[iIndex]):addInputEvent("Mouse_RUp", "PaGlobal_FunctionButtonArea:HandleRClicked_RemoveSlot(" .. index .. "," .. iIndex .. ")")
      ;
      (((editBox._slotIcon)[index])[iIndex]):addInputEvent("Mouse_On", "")
      ;
      (((editBox._slotIcon)[index])[iIndex]):addInputEvent("Mouse_Out", "")
      local _index = index * 6 + iIndex
      local savedIndex = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType)["OptimizationButton" .. _index])
      -- DECOMPILER ERROR at PC268: Confused about usage of register: R15 in 'UnsetPending'

      if savedIndex > 0 then
        ((self._defaultGroup)[index + 1])[iIndex + 1] = savedIndex
      end
      -- DECOMPILER ERROR at PC278: Confused about usage of register: R15 in 'UnsetPending'

      ;
      ((self._compareGroup)[index + 1])[iIndex + 1] = ((self._defaultGroup)[index + 1])[iIndex + 1]
      ;
      (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType)["OptimizationButton" .. _index], 0, (CppEnums.VariableStorageType).eVariableStorageType_User)
    end
  end
  ;
  ((self._ui)._effect):SetPosX((((editBox._slotBg)[0])[0]):GetPosX() - 1)
  ;
  ((self._ui)._effect):SetPosY((((editBox._slotBg)[0])[0]):GetPosY() - 1)
  ;
  ((self._ui)._editBg):SetChildIndex((self._ui)._effect, 100)
  local tempButtonBg = (UI.getChildControl)((self._ui)._editBg, "Static_ButtonBG")
  local tempButton = (UI.getChildControl)(tempButtonBg, "Button_HorsePipe")
  editBox._button = {}
  for index = 0, buttonId._count - 1 do
    -- DECOMPILER ERROR at PC352: Confused about usage of register: R8 in 'UnsetPending'

    (editBox._button)[index] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, tempButtonBg, "BaseButton_" .. index)
    CopyBaseProperty(tempButton, (editBox._button)[index])
    ;
    ((editBox._button)[index]):SetShow(false)
    ;
    ((editBox._button)[index]):addInputEvent("Mouse_LUp", "PaGlobal_FunctionButtonArea:HandleLClicked_SetSlot(" .. index .. ")")
    ;
    ((editBox._button)[index]):addInputEvent("Mouse_On", "")
    ;
    ((editBox._button)[index]):addInputEvent("Mouse_Out", "")
    self:ChangeTexture((editBox._button)[index], index)
  end
  ;
  ((self._ui)._editBg):SetShow(false)
  self:Update()
  Panel_FunctionButton_Area:SetPosX(getScreenSizeX() - Panel_FunctionButton_Area:GetSizeX() - 20)
  Panel_FunctionButton_Area:SetPosY(Panel_Radar:GetPosY() + Panel_Radar:GetSizeY())
end

-- DECOMPILER ERROR at PC800: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.HandleLClicked_TopSlot = function(self, index)
  -- function num : 0_1 , upvalues : buttonId
  if ((self._ui)._editBg):GetShow() then
    Proc_ShowMessage_Ack("먼저 편집�\132 종료해주세요.")
    return 
  end
  local realIndex = ((self._defaultGroup)[self._currentGroup])[index + 1] - 1
  local isActivation = self:ContentsCheck(realIndex)
  if not isActivation then
    Proc_ShowMessage_Ack("활성화가 되어 있지 않아 실행�\160 �\152 없습니다.")
    return 
  end
  if buttonId._landVehicle == realIndex then
    servant_callServant()
  else
    if buttonId._horseRace == realIndex then
      FGlobal_Raceinfo_ShowToggle()
    else
    end
  end
  if (buttonId._summon == realIndex and buttonId._seaVehicle ~= realIndex) or buttonId._guildVehicle == realIndex then
    FGlobal_GuildServantList_Open()
  else
  end
  if buttonId._summonElephant ~= realIndex or buttonId._house == realIndex then
    FGlobal_HousingList_Open()
  else
    if buttonId._worker == realIndex then
      WorkerManager_ShowToggle()
    else
      if buttonId._personalGarden == realIndex then
        HandleClicked_TentList_ShowToggle()
      else
        if buttonId._pet == realIndex then
          FGlobal_PetListNew_Toggle()
        else
          if buttonId._maid == realIndex then
            MaidList_Open()
          else
            if buttonId._camp == realIndex then
              FGlobal_Camp_Open()
            else
              if buttonId._siegeArea == realIndex then
                ToggleVillageSiegeArea()
              else
              end
            end
          end
        end
      end
    end
  end
  if buttonId._duel ~= realIndex or buttonId._npcFind == realIndex then
    NpcNavi_ShowToggle()
  else
    if buttonId._movieGuide == realIndex then
      Panel_MovieGuide_ShowToggle()
    else
      if buttonId._voiceChat == realIndex then
        FGlobal_SetVoiceChat_Toggle()
      else
      end
    end
  end
  if buttonId._blackSpiritTraining ~= realIndex or buttonId._militia == realIndex then
    FGlobal_MercenaryOpen()
  end
end

-- DECOMPILER ERROR at PC803: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.HandleLClicked_SelectSlot = function(self, groupIndex, index)
  -- function num : 0_2
  local editBox = (self._ui)._editBox
  ;
  ((self._ui)._effect):SetPosX((((editBox._slotBg)[groupIndex])[index]):GetPosX() - 1)
  ;
  ((self._ui)._effect):SetPosY((((editBox._slotBg)[groupIndex])[index]):GetPosY() - 1)
  self._currentSlot = groupIndex * 6 + index
end

-- DECOMPILER ERROR at PC806: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.HandleRClicked_RemoveSlot = function(self, groupIndex, index)
  -- function num : 0_3
  local editBox = (self._ui)._editBox
  ;
  ((self._ui)._effect):SetPosX((((editBox._slotBg)[groupIndex])[index]):GetPosX() - 1)
  ;
  ((self._ui)._effect):SetPosY((((editBox._slotBg)[groupIndex])[index]):GetPosY() - 1)
  self._currentSlot = groupIndex * 6 + index
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R4 in 'UnsetPending'

  ;
  ((self._defaultGroup)[groupIndex + 1])[index + 1] = 0
  local control = ((editBox._slotIcon)[groupIndex])[index]
  self:PlusChangeTexture(control)
end

-- DECOMPILER ERROR at PC809: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.HandleLClicked_SetSlot = function(self, index)
  -- function num : 0_4
  local editBox = (self._ui)._editBox
  local groupIndex = (math.floor)(self._currentSlot / 6)
  local slotIndex = self._currentSlot % 6
  local control = ((editBox._slotIcon)[groupIndex])[slotIndex]
  self:ChangeTexture(control, index)
  local isActivation = self:ContentsCheck(index)
  self:Button_ActivationCheck(control, isActivation)
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R7 in 'UnsetPending'

  ;
  ((self._defaultGroup)[groupIndex + 1])[slotIndex + 1] = index + 1
end

-- DECOMPILER ERROR at PC812: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.Save = function(self)
  -- function num : 0_5
  local saveIndex = function()
    -- function num : 0_5_0 , upvalues : self
    for gIndex = 0, self._groupCount - 1 do
      for sIndex = 0, self._iconCount - 1 do
        local _index = gIndex * self._iconCount + sIndex
        ;
        (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType)["OptimizationButton" .. _index], ((self._defaultGroup)[gIndex + 1])[sIndex + 1], (CppEnums.VariableStorageType).eVariableStorageType_User)
        -- DECOMPILER ERROR at PC46: Confused about usage of register: R9 in 'UnsetPending'

        ;
        ((self._compareGroup)[gIndex + 1])[sIndex + 1] = ((self._defaultGroup)[gIndex + 1])[sIndex + 1]
      end
    end
  end

  local isDifferent = self:CompareIndex()
  if isDifferent then
    local messageBoxMemo = "�\128경된 내용�\132 �\128장하시겠습니�\140?"
    local messageBoxData = {title = "기능 버튼 편집", content = messageBoxMemo, functionYes = saveIndex, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  end
end

-- DECOMPILER ERROR at PC815: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.Close = function(self)
  -- function num : 0_6
  local closeWindow = function()
    -- function num : 0_6_0 , upvalues : self
    self:EditBox_ShowToggle(false)
  end

  local isDifferent = self:CompareIndex()
  if isDifferent then
    local messageBoxMemo = "�\128경된 내용�\180 있습니다. 계속하시겠습니까?"
    local messageBoxData = {title = "기능 버튼 편집", content = messageBoxMemo, functionYes = closeWindow, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  else
    do
      closeWindow()
    end
  end
end

-- DECOMPILER ERROR at PC818: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.CompareIndex = function(self)
  -- function num : 0_7
  for gIndex = 0, self._groupCount - 1 do
    for sIndex = 0, self._iconCount - 1 do
      if ((self._defaultGroup)[gIndex + 1])[sIndex + 1] ~= ((self._compareGroup)[gIndex + 1])[sIndex + 1] then
        return true
      end
    end
  end
  return false
end

-- DECOMPILER ERROR at PC821: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.ChangeTexture = function(self, control, index)
  -- function num : 0_8
  local self = PaGlobal_FunctionButtonArea
  control:ChangeTextureInfoName(self._iconPath)
  local x1, y1, x2, y2 = setTextureUV_Func(control, (((self._data)[index])._normal)[1], (((self._data)[index])._normal)[2], (((self._data)[index])._normal)[3], (((self._data)[index])._normal)[4])
  ;
  (control:getBaseTexture()):setUV(x1, y1, x2, y2)
  control:setRenderTexture(control:getBaseTexture())
  control:ChangeOnTextureInfoName(self._iconPath)
  local x1, y1, x2, y2 = setTextureUV_Func(control, (((self._data)[index])._over)[1], (((self._data)[index])._over)[2], (((self._data)[index])._over)[3], (((self._data)[index])._over)[4])
  ;
  (control:getOnTexture()):setUV(x1, y1, x2, y2)
  control:ChangeClickTextureInfoName(self._iconPath)
  local x1, y1, x2, y2 = setTextureUV_Func(control, (((self._data)[index])._click)[1], (((self._data)[index])._click)[2], (((self._data)[index])._click)[3], (((self._data)[index])._click)[4])
  ;
  (control:getClickTexture()):setUV(x1, y1, x2, y2)
end

-- DECOMPILER ERROR at PC824: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.LandVehicleChangeTexture = function(self, index)
  -- function num : 0_9
  local self = PaGlobal_FunctionButtonArea
  local texture = {}
  if index == 0 then
    texture = (self._landVehicleTextureData)._horseNormal
  else
    if index == 1 then
      texture = (self._landVehicleTextureData)._horsePipe
    else
      if index == 2 then
        texture = (self._landVehicleTextureData)._horsePcRoom
      else
        if index == 3 then
          texture = (self._landVehicleTextureData)._camel
        else
          if index == 4 then
            texture = (self._landVehicleTextureData)._donkey
          else
            if index == 5 then
              texture = (self._landVehicleTextureData)._babyElephant
            else
              if index == 6 then
                texture = (self._landVehicleTextureData)._carriage
              else
                texture = (self._landVehicleTextureData)._horseNormal
              end
            end
          end
        end
      end
    end
  end
  control:ChangeTextureInfoName(self._iconPath)
  local x1, y1, x2, y2 = setTextureUV_Func(control, (texture._normal)[1], (texture._normal)[2], (texture._normal)[3], (texture._normal)[4])
  ;
  (control:getBaseTexture()):setUV(x1, y1, x2, y2)
  control:setRenderTexture(control:getBaseTexture())
  control:ChangeOnTextureInfoName(self._iconPath)
  local x1, y1, x2, y2 = setTextureUV_Func(control, (texture._over)[1], (texture._over)[2], (texture._over)[3], (texture._over)[4])
  ;
  (control:getOnTexture()):setUV(x1, y1, x2, y2)
  control:ChangeClickTextureInfoName(self._iconPath)
  local x1, y1, x2, y2 = setTextureUV_Func(control, (texture._click)[1], (texture._click)[2], (texture._click)[3], (texture._click)[4])
  ;
  (control:getClickTexture()):setUV(x1, y1, x2, y2)
end

-- DECOMPILER ERROR at PC827: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.SummonChangeTexture = function(self, index)
  -- function num : 0_10
  local self = PaGlobal_FunctionButtonArea
  local texture = {}
  if index == 0 then
    texture = (self._summonTextureData)._summoner
  else
    texture = (self._summonTextureData)._wizard
  end
  control:ChangeTextureInfoName(self._iconPath)
  local x1, y1, x2, y2 = setTextureUV_Func(control, (texture._normal)[1], (texture._normal)[2], (texture._normal)[3], (texture._normal)[4])
  ;
  (control:getBaseTexture()):setUV(x1, y1, x2, y2)
  control:setRenderTexture(control:getBaseTexture())
  control:ChangeOnTextureInfoName(self._iconPath)
  local x1, y1, x2, y2 = setTextureUV_Func(control, (texture._over)[1], (texture._over)[2], (texture._over)[3], (texture._over)[4])
  ;
  (control:getOnTexture()):setUV(x1, y1, x2, y2)
  control:ChangeClickTextureInfoName(self._iconPath)
  local x1, y1, x2, y2 = setTextureUV_Func(control, (texture._click)[1], (texture._click)[2], (texture._click)[3], (texture._click)[4])
  ;
  (control:getClickTexture()):setUV(x1, y1, x2, y2)
end

-- DECOMPILER ERROR at PC830: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.PlusChangeTexture = function(self, control)
  -- function num : 0_11
  control:ChangeTextureInfoName("new_ui_common_forlua/default/console_frame_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(control, 84, 108, 104, 128)
  ;
  (control:getBaseTexture()):setUV(x1, y1, x2, y2)
  control:setRenderTexture(control:getBaseTexture())
  control:ChangeOnTextureInfoName("new_ui_common_forlua/default/console_frame_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(control, 84, 108, 104, 128)
  ;
  (control:getOnTexture()):setUV(x1, y1, x2, y2)
  control:ChangeClickTextureInfoName("new_ui_common_forlua/default/console_frame_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(control, 84, 108, 104, 128)
  ;
  (control:getClickTexture()):setUV(x1, y1, x2, y2)
  control:SetColor((Defines.Color).C_FFFFFFFF)
end

-- DECOMPILER ERROR at PC833: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.EditBox_ShowToggle = function(self, isShow)
  -- function num : 0_12
  if isShow ~= nil then
    ((self._ui)._editBg):SetShow(isShow)
  else
    if ((self._ui)._editBg):GetShow() then
      ((self._ui)._editBg):SetShow(false)
    else
      ;
      ((self._ui)._editBg):SetShow(true)
    end
  end
  local editBox = (self._ui)._editBox
  ;
  ((self._ui)._effect):SetPosX((((editBox._slotBg)[0])[0]):GetPosX() - 1)
  ;
  ((self._ui)._effect):SetPosY((((editBox._slotBg)[0])[0]):GetPosY() - 1)
  self._currentSlot = 0
  self:Update()
end

-- DECOMPILER ERROR at PC837: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.OpenCheck = function(self)
  -- function num : 0_13 , upvalues : buttonId
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local classType = selfPlayer:getClassType()
  local playerLevel = (selfPlayer:get()):getLevel()
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R4 in 'UnsetPending'

  if (CppEnums.ClassType).ClassType_Tamer == classType then
    if playerLevel >= 20 then
      ((self._data)[buttonId._summon])._isOpen = true
    else
      -- DECOMPILER ERROR at PC28: Confused about usage of register: R4 in 'UnsetPending'

      ;
      ((self._data)[buttonId._summon])._isOpen = false
    end
  else
    -- DECOMPILER ERROR at PC46: Confused about usage of register: R4 in 'UnsetPending'

    if (CppEnums.ClassType).ClassType_Wizard == classType or (CppEnums.ClassType).ClassType_WizardWomen == classType then
      if playerLevel >= 56 then
        ((self._data)[buttonId._summon])._isOpen = true
      else
        -- DECOMPILER ERROR at PC52: Confused about usage of register: R4 in 'UnsetPending'

        ;
        ((self._data)[buttonId._summon])._isOpen = false
      end
    else
      -- DECOMPILER ERROR at PC58: Confused about usage of register: R4 in 'UnsetPending'

      ;
      ((self._data)[buttonId._summon])._isOpen = false
    end
  end
  local guildWrapper = ToClient_GetMyGuildInfoWrapper()
  -- DECOMPILER ERROR at PC69: Confused about usage of register: R5 in 'UnsetPending'

  ;
  ((self._data)[buttonId._guildVehicle])._isOpen = guildWrapper ~= nil
  -- DECOMPILER ERROR at PC78: Confused about usage of register: R5 in 'UnsetPending'

  ;
  ((self._data)[buttonId._summonElephant])._isOpen = guildWrapper ~= nil
  local isHaveDwelling = ToClient_IsHaveDwelling()
  -- DECOMPILER ERROR at PC85: Confused about usage of register: R6 in 'UnsetPending'

  ;
  ((self._data)[buttonId._house])._isOpen = isHaveDwelling
  local workerCount = ToClient_getMyNpcWorkerCount()
  -- DECOMPILER ERROR at PC96: Confused about usage of register: R7 in 'UnsetPending'

  ;
  ((self._data)[buttonId._worker])._isOpen = workerCount > 0
  local temporaryWrapper = getTemporaryInformationWrapper()
  local tentCheck = (temporaryWrapper ~= nil and temporaryWrapper:isSelfTent())
  -- DECOMPILER ERROR at PC110: Confused about usage of register: R9 in 'UnsetPending'

  ;
  ((self._data)[buttonId._personalGarden])._isOpen = tentCheck
  local havePetCount = ToClient_getPetUnsealedList() + ToClient_getPetSealedList()
  -- DECOMPILER ERROR at PC124: Confused about usage of register: R10 in 'UnsetPending'

  ;
  ((self._data)[buttonId._pet])._isOpen = havePetCount > 0
  local maidCount = getTotalMaidList()
  -- DECOMPILER ERROR at PC135: Confused about usage of register: R11 in 'UnsetPending'

  ;
  ((self._data)[buttonId._maid])._isOpen = maidCount >= 0
  local isRegisted = ToClient_isCampingReigsted()
  -- DECOMPILER ERROR at PC142: Confused about usage of register: R12 in 'UnsetPending'

  ;
  ((self._data)[buttonId._camp])._isOpen = isRegisted
  -- DECOMPILER ERROR at PC151: Confused about usage of register: R12 in 'UnsetPending'

  ;
  ((self._data)[buttonId._blackSpiritTraining])._isOpen = playerLevel >= 50
  do
    local isMilitia = ToClient_IsContentsGroupOpen("245")
    -- DECOMPILER ERROR at PC159: Confused about usage of register: R13 in 'UnsetPending'

    ;
    ((self._data)[buttonId._militia])._isOpen = isMilitia
    -- DECOMPILER ERROR: 8 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC841: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.Update = function(self)
  -- function num : 0_14 , upvalues : buttonId
  if ((self._ui)._editBg):GetShow() then
    local editBox = (self._ui)._editBox
    local realIndex = 0
    for index = 0, buttonId._count - 1 do
      if ((self._data)[index])._isOpen then
        ((editBox._button)[index]):SetShow(true)
        ;
        ((editBox._button)[index]):SetPosX(6 + 44 * (realIndex % 6))
        ;
        ((editBox._button)[index]):SetPosY(6 + 45 * (math.floor)(realIndex / 6))
        local isActivation = self:ContentsCheck(index)
        self:Button_ActivationCheck((editBox._button)[index], isActivation)
        realIndex = realIndex + 1
      else
        do
          do
            ;
            ((editBox._button)[index]):SetShow(false)
            -- DECOMPILER ERROR at PC57: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC57: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC57: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
    for gIndex = 0, self._groupCount - 1 do
      for sIndex = 0, self._iconCount - 1 do
        local control = ((editBox._slotIcon)[gIndex])[sIndex]
        local index = ((self._defaultGroup)[gIndex + 1])[sIndex + 1] - 1
        if index == -1 then
          self:PlusChangeTexture(control)
        else
          self:ChangeTexture(control, index)
          local isActivation = self:ContentsCheck(index)
          self:Button_ActivationCheck(control, isActivation)
        end
      end
    end
  else
    do
      for sIndex = 0, self._iconCount - 1 do
        local control = ((self._ui)._topButton)[sIndex]
        local index = ((self._defaultGroup)[self._currentGroup])[sIndex + 1] - 1
        if index == -1 then
          self:PlusChangeTexture(control)
        else
          _PA_LOG("이문�\133", "index : " .. index)
          self:ChangeTexture(control, index)
          local isActivation = self:ContentsCheck(index)
          self:Button_ActivationCheck(control, isActivation)
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC845: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.ContentsCheck = function(self, index)
  -- function num : 0_15 , upvalues : buttonId
  if buttonId._landVehicle == index then
    return self:landVehicle()
  else
    if buttonId._horseRace == index then
      return self:horseRace()
    else
      if buttonId._summon == index then
        return self:summon()
      else
        if buttonId._seaVehicle == index then
          return self:seaVehicle()
        else
          if buttonId._guildVehicle == index then
            return self:guildVehicle()
          else
            if buttonId._summonElephant == index then
              return self:summonElephant()
            else
              if buttonId._house == index then
                return self:house()
              else
                if buttonId._worker == index then
                  return self:worker()
                else
                  if buttonId._personalGarden == index then
                    return self:personalGarden()
                  else
                    if buttonId._pet == index then
                      return self:pet()
                    else
                      if buttonId._maid == index then
                        return self:maid()
                      else
                        if buttonId._camp == index then
                          return self:camp()
                        else
                          if buttonId._duel == index then
                            return self:duel()
                          else
                            if buttonId._blackSpiritTraining == index then
                              return self:blackSpiritTraining()
                            else
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

-- DECOMPILER ERROR at PC848: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.Button_ActivationCheck = function(self, control, isActivation)
  -- function num : 0_16
  local editBox = (self._ui)._editBox
  if isActivation then
    control:SetColor((Defines.Color).C_FFFFFFFF)
  else
    control:SetColor((Defines.Color).C_FFF26A6A)
  end
end

-- DECOMPILER ERROR at PC851: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.landVehicle = function(self)
  -- function num : 0_17
  local temporaryWrapper = getTemporaryInformationWrapper()
  local landVehicleWrapper = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle)
  if landVehicleWrapper == nil then
    return false
  end
  if (CppEnums.VehicleType).Type_Horse == landVehicleWrapper:getVehicleType() then
    local temporaryPCRoomWrapper = getTemporaryInformationWrapper()
    local isPremiumPcRoom = temporaryPCRoomWrapper:isPremiumPcRoom()
    local isRussiaPremiumPack = ((getSelfPlayer()):get()):isApplyChargeSkill((CppEnums.UserChargeType).eUserChargeType_RussiaPack3)
    if isPremiumPcRoom or isRussiaPremiumPack then
      self:LandVehicleChangeTexture(2)
    else
      if doHaveContentsItem(16, (CppEnums.VehicleType).Type_Horse) then
        self:LandVehicleChangeTexture(1)
      else
        self:LandVehicleChangeTexture(0)
      end
    end
  else
    do
      if (CppEnums.VehicleType).Type_Camel == landVehicleWrapper:getVehicleType() then
        self:LandVehicleChangeTexture(3)
      else
        if (CppEnums.VehicleType).Type_Donkey == landVehicleWrapper:getVehicleType() then
          self:LandVehicleChangeTexture(4)
        else
          if (CppEnums.VehicleType).Type_RidableBabyElephant == landVehicleWrapper:getVehicleType() then
            self:LandVehicleChangeTexture(5)
          else
            if (CppEnums.VehicleType).Type_Carriage == landVehicleWrapper:getVehicleType() or (CppEnums.VehicleType).Type_CowCarriage == landVehicleWrapper:getVehicleType() or (CppEnums.VehicleType).Type_RepairableCarriage == landVehicleWrapper:getVehicleType() then
              self:LandVehicleChangeTexture(6)
            end
          end
        end
      end
      return true
    end
  end
end

-- DECOMPILER ERROR at PC854: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.horseRace = function(self)
  -- function num : 0_18
  local temporaryWrapper = getTemporaryInformationWrapper()
  local landVehicleWrapper = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle)
  if landVehicleWrapper == nil then
    return false
  end
  if (CppEnums.VehicleType).Type_Horse == landVehicleWrapper:getVehicleType() then
    return true
  else
    return false
  end
end

-- DECOMPILER ERROR at PC857: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.summon = function(self)
  -- function num : 0_19
  local summonCount = (getSelfPlayer()):getSummonListCount()
  for summon_idx = 0, summonCount - 1 do
    local summonInfo = (getSelfPlayer()):getSummonDataByIndex(summon_idx)
    local characterKey = summonInfo:getCharacterKey()
    if (characterKey >= 60028 and characterKey <= 60037) or characterKey == 60068 then
      local summonWrapper = summonInfo:getActor()
      local hpRate = 0
      if summonWrapper == nil then
        hpRate = 100
      else
        local hp = (summonWrapper:get()):getHp()
        local maxHp = (summonWrapper:get()):getMaxHp()
        hpRate = hp / maxHp * 100
      end
      do
        do
          self:SummonChangeTexture(0)
          do return true end
          if characterKey == 60134 or characterKey == 60137 or characterKey == 60136 or characterKey == 60135 then
            local summonWrapper = summonInfo:getActor()
            local hpRate = 0
            if summonWrapper == nil then
              hpRate = 100
            else
              local hp = (summonWrapper:get()):getHp()
              local maxHp = (summonWrapper:get()):getMaxHp()
              hpRate = hp / maxHp * 100
            end
            do
              do
                self:SummonChangeTexture(1)
                do return true end
                -- DECOMPILER ERROR at PC74: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC74: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC74: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC74: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC74: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC74: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC74: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
  end
  return false
end

-- DECOMPILER ERROR at PC860: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.seaVehicle = function(self)
  -- function num : 0_20
  local temporaryWrapper = getTemporaryInformationWrapper()
  local seaVehicleWrapper = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Ship)
  if seaVehicleWrapper ~= nil and (CppEnums.VehicleType).Type_SailingBoat ~= seaVehicleWrapper:getVehicleType() then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC863: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.guildVehicle = function(self)
  -- function num : 0_21
  local guildVehicleCount = guildstable_getUnsealGuildServantCount()
  for index = 0, guildVehicleCount - 1 do
    local servantWrapper = guildStable_getUnsealGuildServantAt(index)
    if servantWrapper ~= nil then
      return true
    end
  end
  return false
end

-- DECOMPILER ERROR at PC866: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.summonElephant = function(self)
  -- function num : 0_22
  return self._isShowElephant
end

-- DECOMPILER ERROR at PC869: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.house = function(self)
  -- function num : 0_23
  local isHaveDwelling = ToClient_IsHaveDwelling()
  return isHaveDwelling
end

-- DECOMPILER ERROR at PC872: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.worker = function(self)
  -- function num : 0_24
  do
    local workerCount = ToClient_getMyNpcWorkerCount()
    do return workerCount > 0 end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC875: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.personalGarden = function(self)
  -- function num : 0_25
  local temporaryWrapper = getTemporaryInformationWrapper()
  do
    local tentCheck = (temporaryWrapper ~= nil and temporaryWrapper:isSelfTent())
    do return tentCheck end
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC878: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.pet = function(self)
  -- function num : 0_26
  do
    local havePetCount = ToClient_getPetUnsealedList() + ToClient_getPetSealedList()
    do return havePetCount > 0 end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC881: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.maid = function(self)
  -- function num : 0_27
  do
    local maidCount = getTotalMaidList()
    do return maidCount > 0 end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC884: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.camp = function(self)
  -- function num : 0_28
  local isRegisted = ToClient_isCampingReigsted()
  return isRegisted
end

-- DECOMPILER ERROR at PC887: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.duel = function(self)
  -- function num : 0_29
  local isPlaying = (getSelfPlayer()):isDefinedPvPMatch()
  return isPlaying
end

-- DECOMPILER ERROR at PC890: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FunctionButtonArea.blackSpiritTraining = function(self)
  -- function num : 0_30
  local autoTrain = ToClient_IsAutoLevelUp()
  return autoTrain
end

FromClient_ShowElephantBarn = function(actorKeyRaw)
  -- function num : 0_31
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_FunctionButtonArea._isShowElephant = true
end

FromClient_HideElephantBarn = function(actorKeyRaw)
  -- function num : 0_32
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_FunctionButtonArea._isShowElephant = false
end

SummonElephant_Tooltip_ShowToggle = function(isShow)
  -- function num : 0_33
  if isShow == false then
    TooltipSimple_Hide()
    return 
  end
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_SUMMONELEPHANT_TOOLTIP_TITLE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_SUMMONELEPHANT_TOOLTIP_DESC")
  TooltipSimple_Show(_btn_SummonElephant, name, desc)
end

FGlobal_Camp_Open = function()
  -- function num : 0_34
  PaGlobal_Camp:open()
end

local showSiegeArea = false
ToggleVillageSiegeArea = function()
  -- function num : 0_35 , upvalues : showSiegeArea
  showSiegeArea = not showSiegeArea
  ToClient_toggleVillageSiegeArea(showSiegeArea)
end

registerEvent("FromClient_ShowElephantBarn", "FromClient_ShowElephantBarn")
registerEvent("FromClient_HideElephantBarn", "FromClient_HideElephantBarn")
PaGlobal_FunctionButtonArea:Initialize()

