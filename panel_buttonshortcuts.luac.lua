-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\buttonshortcuts\panel_buttonshortcuts.luac 

-- params : ...
-- function num : 0
Panel_ButtonShortcuts:SetShow(false)
PaGlobal_ButtonShortcuts = {
_ui = {_curButtonString, _curChangeShortcutsKey; _bgAllList = (UI.getChildControl)(Panel_ButtonShortcuts, "Static_KeySetting_AllList")}
, _curId = -1, _curButtonsShortcuts = nil, _openButtonsShortcuts = nil, _altString = "Alt + ", _searchText = "", 
UIMODE = {
Current = {index = 0, size = 0}
, 
List = {index = 1, size = 0}
, 
ListOnly = {index = 2, size = 0, offset = 0}
}
, _curMode = 0, _listOriginalPos = 0, 
_buttonPos = {[0] = 0, [1] = 0, [2] = 0}
}
addButtonShortcutsEvent = function(func, keyCode)
  -- function num : 0_0
  local buttonShortcuts = ButtonShortcuts(keyCode)
  ToClent_addButtonShortcutsEvent(buttonShortcuts)
end

FGlobal_ButtonShortcuts_Open = function()
  -- function num : 0_1
  PaGlobal_ButtonShortcuts:MoveUI(((PaGlobal_ButtonShortcuts.UIMODE).ListOnly).index)
  PaGlobal_ButtonShortcuts:Open()
end

-- DECOMPILER ERROR at PC50: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.Open = function(self, index)
  -- function num : 0_2
  audioPostEvent_SystemUi(1, 0)
  ;
  ((self._ui)._checkButtonAllVeiw):SetCheck(true)
  do
    local isCurrentMode = index ~= nil
    if isCurrentMode == true then
      self._openButtonsShortcuts = ToClent_getButtonShortcutsEventAt(index)
      ;
      ((self._ui)._curButtonString):SetText((self._openButtonsShortcuts):getButtonString())
      ;
      ((self._ui)._curChangeShortcutsKey):SetText(PaGlobal_ButtonShortcuts:GetText((self._openButtonsShortcuts):getKeyCode()))
      ;
      ((self._ui)._checkButtonAllVeiw):SetCheck(false)
    end
    Panel_ButtonShortcuts:SetShow(true)
    self:UiRefresh()
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC53: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.ListRefresh = function(self)
  -- function num : 0_3
  (((self._ui)._list2):getElementManager()):clearKey()
  local count = ToClent_getButtonShortcutsEventCount()
  for index = 0, count - 1 do
    local isShow = true
    local data = ToClent_getButtonShortcutsEventAt(index)
    if self._searchText ~= "" and (string.find)(data:getButtonString(), self._searchText) == nil then
      isShow = false
    end
    if ((self._ui)._checkButtonAllVeiw):IsCheck() == false and data:getKeyCode() == 0 then
      isShow = false
    end
    if isShow == true then
      (((self._ui)._list2):getElementManager()):pushKey(toInt64(0, index))
    end
  end
end

-- DECOMPILER ERROR at PC56: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.ClickedChangeShortcuts = function(self)
  -- function num : 0_4
  self._curButtonsShortcuts = self._openButtonsShortcuts
  SetUIMode((Defines.UIMode).eUIMode_KeyCustom_ButtonShortcuts)
  ;
  ((self._ui)._curChangeShortcutsKey):SetCheck(true)
  ;
  ((self._ui)._curChangeShortcutsKey):SetText("")
  ClearFocusEdit()
end

-- DECOMPILER ERROR at PC59: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.ClickedListElementChangeShortcuts = function(self, id)
  -- function num : 0_5
  do
    if self._curId >= 0 then
      local tempId = self._curId
      self._curId = id
      ;
      ((self._ui)._list2):requestUpdateByKey(toInt64(0, tempId))
    end
    self._curId = id
    self._curButtonsShortcuts = ToClent_getButtonShortcutsEventAt(id)
    SetUIMode((Defines.UIMode).eUIMode_KeyCustom_ButtonShortcuts)
    ;
    ((self._ui)._list2):requestUpdateByKey(toInt64(0, self._curId))
    ClearFocusEdit()
  end
end

-- DECOMPILER ERROR at PC62: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.UiRefresh = function(self, index)
  -- function num : 0_6
  if self._openButtonsShortcuts ~= nil then
    ((self._ui)._curButtonString):SetText((self._openButtonsShortcuts):getButtonString())
    ;
    ((self._ui)._curChangeShortcutsKey):SetText(PaGlobal_ButtonShortcuts:GetText((self._openButtonsShortcuts):getKeyCode()))
    ;
    ((self._ui)._curChangeShortcutsKey):SetCheck(false)
  end
  self._curId = -1
  if index ~= nil then
    ((self._ui)._list2):requestUpdateByKey(toInt64(0, index))
  else
    self:ListRefresh()
  end
  ClearFocusEdit()
end

-- DECOMPILER ERROR at PC65: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.Remove = function(self)
  -- function num : 0_7
  ToClent_removeAtButtonShortcutsEvent(self._curButtonsShortcuts)
  self:UiRefresh(self._curId)
end

-- DECOMPILER ERROR at PC68: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.Register = function(self, VirtualKeyCode)
  -- function num : 0_8
  if self:IsExhibitKey(VirtualKeyCode) == true then
    self:UiRefresh(self._curId)
    self._curButtonsShortcuts = nil
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_BUTTONSHORTCUTS_DISAVAILABLE_REGISTER"))
    return 
  end
  if self._curButtonsShortcuts == nil then
    self:UiRefresh()
    return 
  end
  if ToClent_hasKeyButtonShortcuts(VirtualKeyCode) == true then
    self._registerKey = VirtualKeyCode
    local messageBoxMemo = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_BUTTONSHORTCUTS_ALEADY_KEYCODE")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = FGlobal_ButtonShortcuts_Register, functionNo = FGlobal_ButtonShortcuts_Refresh, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
    return 
  end
  do
    ToClent_addButtonShortcutsEvent(self._curButtonsShortcuts, VirtualKeyCode)
    self:UiRefresh(self._curId)
    self._curButtonsShortcuts = nil
  end
end

FGlobal_ButtonShortcuts_Register = function()
  -- function num : 0_9
  ToClent_addButtonShortcutsEvent(PaGlobal_ButtonShortcuts._curButtonsShortcuts, PaGlobal_ButtonShortcuts._registerKey)
  PaGlobal_ButtonShortcuts:UiRefresh()
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R0 in 'UnsetPending'

  self._curButtonsShortcuts = nil
end

FGlobal_ButtonShortcuts_Refresh = function()
  -- function num : 0_10
  PaGlobal_ButtonShortcuts:UiRefresh()
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

  self._curButtonsShortcuts = nil
end

-- DECOMPILER ERROR at PC75: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.SetDefault = function(self)
  -- function num : 0_11
  TooltipSimple_Hide()
  local messageBoxMemo = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_BUTTONSHORTCUTS_ALLRESETMESSAGE")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = FGlobal_ButtonShortcuts_SetDefault, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

FGlobal_ButtonShortcuts_SetDefault = function()
  -- function num : 0_12
  ToClent_setDefaultButtonShortcuts()
  PaGlobal_ButtonShortcuts:UiRefresh()
end

-- DECOMPILER ERROR at PC80: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.Close = function(self)
  -- function num : 0_13
  audioPostEvent_SystemUi(1, 1)
  Panel_ButtonShortcuts:SetShow(false)
  self._openButtonsShortcuts = nil
  setKeyCustomizing(false)
  SetUIMode((Defines.UIMode).eUIMode_Default)
end

FGlobal_ButtonShortcurs_List2EventControlCreate = function(list_content, key)
  -- function num : 0_14
  local id = Int64toInt32(key)
  local buttonShortcuts = ToClent_getButtonShortcutsEventAt(id)
  local buttonName = (UI.getChildControl)(list_content, "StaticText_ListKeySetting_Name")
  local shortcuts = (UI.getChildControl)(list_content, "Button_ListKeySetting")
  do
    local isShow = true
    buttonName:SetShow(true)
    shortcuts:SetShow(true)
    buttonName:SetText(buttonShortcuts:getButtonString())
    shortcuts:SetText(PaGlobal_ButtonShortcuts:GetText(buttonShortcuts:getKeyCode()))
    if PaGlobal_ButtonShortcuts._curId ~= nil and id == PaGlobal_ButtonShortcuts._curId then
      shortcuts:SetText("")
    end
    shortcuts:SetCheck(id == PaGlobal_ButtonShortcuts._curId)
    shortcuts:addInputEvent("Mouse_LUp", "PaGlobal_ButtonShortcuts:ClickedListElementChangeShortcuts(" .. id .. ")")
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC85: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.ToggleAllVeiw = function(self)
  -- function num : 0_15
  TooltipSimple_Hide()
  self._searchText = ""
  self:ListRefresh()
  ClearFocusEdit()
end

-- DECOMPILER ERROR at PC88: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.ClickedSearch = function(self)
  -- function num : 0_16
  self._searchText = ((self._ui)._editSearchText):GetEditText()
  self:UiRefresh()
  ClearFocusEdit()
end

-- DECOMPILER ERROR at PC91: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.ClickedEditSearchControl = function(self)
  -- function num : 0_17
  ((self._ui)._editSearchText):SetEditText("")
  self._searchText = ""
end

-- DECOMPILER ERROR at PC94: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.MoveUI = function(self, mode)
  -- function num : 0_18
  TooltipSimple_Hide()
  if mode == nil then
    return 
  end
  self._curMode = mode
  ;
  ((self._ui)._bgAllList):SetPosY(self._listOriginalPos)
  ;
  ((self._ui)._buttonSetDefault):SetPosY((self._buttonPos)[mode])
  ;
  ((self._ui)._buttonConfirm):SetPosY((self._buttonPos)[mode])
  ;
  ((self._ui)._buttonAllView):SetPosY((self._buttonPos)[mode])
  if mode == ((self.UIMODE).Current).index then
    ((self._ui)._bgAllList):SetShow(false)
    ;
    ((self._ui)._currentSettingBg):SetShow(true)
    Panel_ButtonShortcuts:SetSize(Panel_ButtonShortcuts:GetSizeX(), ((self.UIMODE).Current).size)
    ;
    ((self._ui)._buttonAllView):SetShow(true)
  else
    if mode == ((self.UIMODE).List).index then
      ((self._ui)._bgAllList):SetShow(true)
      ;
      ((self._ui)._currentSettingBg):SetShow(true)
      ;
      ((self._ui)._buttonAllView):SetShow(false)
      Panel_ButtonShortcuts:SetSize(Panel_ButtonShortcuts:GetSizeX(), ((self.UIMODE).List).size)
      self:UiRefresh()
    else
      if mode == ((self.UIMODE).ListOnly).index then
        ((self._ui)._bgAllList):SetShow(true)
        ;
        ((self._ui)._currentSettingBg):SetShow(false)
        ;
        ((self._ui)._buttonAllView):SetShow(false)
        ;
        ((self._ui)._bgAllList):SetPosY(((self._ui)._bgAllList):GetPosY() - ((self.UIMODE).ListOnly).offset)
        Panel_ButtonShortcuts:SetSize(Panel_ButtonShortcuts:GetSizeX(), ((self.UIMODE).ListOnly).size)
      end
    end
  end
end

-- DECOMPILER ERROR at PC97: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.InitUI = function(self)
  -- function num : 0_19
  self._NothingText = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_NOTHING")
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._list2 = (UI.getChildControl)((self._ui)._bgAllList, "List2_KeySetting_BG")
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._checkButtonAllVeiw = (UI.getChildControl)((self._ui)._bgAllList, "CheckButton_AllView")
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._editSearchText = (UI.getChildControl)((self._ui)._bgAllList, "Edit_SearchButtonShortcut")
  -- DECOMPILER ERROR at PC37: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._bgDesc = (UI.getChildControl)((self._ui)._bgAllList, "Static_BottomDescBG")
  -- DECOMPILER ERROR at PC44: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._buttonSetDefault = (UI.getChildControl)(Panel_ButtonShortcuts, "Button_Reset")
  -- DECOMPILER ERROR at PC51: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._buttonConfirm = (UI.getChildControl)(Panel_ButtonShortcuts, "Button_Confirm")
  -- DECOMPILER ERROR at PC57: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._scorll = ((self._ui)._list2):GetVScroll()
  local buttonshortcutsDesc = (UI.getChildControl)((self._ui)._bgDesc, "StaticText_BottomDesc")
  buttonshortcutsDesc:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  buttonshortcutsDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_BUTTONSHORTCUT_BOTTOM_DESC"))
  ;
  ((self._ui)._bgDesc):SetSize(((self._ui)._bgDesc):GetSizeX(), buttonshortcutsDesc:GetTextSizeY() + 10)
  Panel_ButtonShortcuts:SetSize(Panel_ButtonShortcuts:GetSizeX(), 530 + ((self._ui)._bgDesc):GetSizeY() + 10)
  ;
  ((self._ui)._buttonSetDefault):ComputePos()
  ;
  ((self._ui)._buttonConfirm):ComputePos()
  ;
  ((self._ui)._checkButtonAllVeiw):addInputEvent("Mouse_LUp", "PaGlobal_ButtonShortcuts:ToggleAllVeiw()")
  ;
  ((self._ui)._checkButtonAllVeiw):SetCheck(false)
  ;
  ((self._ui)._list2):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "FGlobal_ButtonShortcurs_List2EventControlCreate")
  ;
  ((self._ui)._list2):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  -- DECOMPILER ERROR at PC139: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui)._currentSettingBg = (UI.getChildControl)(Panel_ButtonShortcuts, "Static_Current_KeySetting")
  -- DECOMPILER ERROR at PC147: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui)._curButtonString = (UI.getChildControl)((self._ui)._currentSettingBg, "Static_Current_Key_Name")
  -- DECOMPILER ERROR at PC155: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui)._curChangeShortcutsKey = (UI.getChildControl)((self._ui)._currentSettingBg, "Button_Current_Key")
  ;
  ((self._ui)._curChangeShortcutsKey):addInputEvent("Mouse_LUp", "PaGlobal_ButtonShortcuts:ClickedChangeShortcuts()")
  -- DECOMPILER ERROR at PC168: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui)._buttonAllView = (UI.getChildControl)(Panel_ButtonShortcuts, "Button_ButtonShortcuts_AllView")
  ;
  ((self._ui)._buttonAllView):addInputEvent("Mouse_LUp", "PaGlobal_ButtonShortcuts:MoveUI( " .. 1 .. " )")
  ;
  ((self._ui)._buttonConfirm):addInputEvent("Mouse_LUp", "PaGlobal_ButtonShortcuts:Close()")
  ;
  ((UI.getChildControl)(Panel_ButtonShortcuts, "Button_Close")):addInputEvent("Mouse_LUp", "PaGlobal_ButtonShortcuts:Close()")
  ;
  ((UI.getChildControl)((self._ui)._editSearchText, "Button_SearchIcon")):addInputEvent("Mouse_LUp", "PaGlobal_ButtonShortcuts:ClickedSearch()")
  ;
  ((self._ui)._editSearchText):addInputEvent("Mouse_LUp", "PaGlobal_ButtonShortcuts:ClickedEditSearchControl()")
  ;
  ((self._ui)._buttonSetDefault):addInputEvent("Mouse_LUp", "PaGlobal_ButtonShortcuts:SetDefault()")
  ;
  ((self._ui)._buttonAllView):addInputEvent("Mouse_On", "PaGlobal_ButtonShortcuts_SimpleTooltips(true, 0)")
  ;
  ((self._ui)._buttonAllView):addInputEvent("Mouse_Out", "PaGlobal_ButtonShortcuts_SimpleTooltips(false)")
  ;
  ((self._ui)._buttonSetDefault):addInputEvent("Mouse_On", "PaGlobal_ButtonShortcuts_SimpleTooltips(true, 1)")
  ;
  ((self._ui)._buttonSetDefault):addInputEvent("Mouse_Out", "PaGlobal_ButtonShortcuts_SimpleTooltips(false)")
  ;
  ((self._ui)._checkButtonAllVeiw):addInputEvent("Mouse_On", "PaGlobal_ButtonShortcuts_SimpleTooltips(true, 2)")
  ;
  ((self._ui)._checkButtonAllVeiw):addInputEvent("Mouse_Out", "PaGlobal_ButtonShortcuts_SimpleTooltips(false)")
  -- DECOMPILER ERROR at PC267: Confused about usage of register: R2 in 'UnsetPending'

  ;
  ((self.UIMODE).Current).size = Panel_ButtonShortcuts:GetSizeY() - ((self._ui)._bgAllList):GetSizeY() - 10 - ((self._ui)._bgDesc):GetSizeY()
  -- DECOMPILER ERROR at PC285: Confused about usage of register: R2 in 'UnsetPending'

  ;
  ((self.UIMODE).List).size = Panel_ButtonShortcuts:GetSizeY() - ((self._ui)._bgAllList):GetSizeY() - 10 + ((self._ui)._bgAllList):GetSizeY() + 10
  -- DECOMPILER ERROR at PC297: Confused about usage of register: R2 in 'UnsetPending'

  ;
  ((self.UIMODE).ListOnly).size = Panel_ButtonShortcuts:GetSizeY() - ((self._ui)._currentSettingBg):GetSizeY() - 10
  -- DECOMPILER ERROR at PC305: Confused about usage of register: R2 in 'UnsetPending'

  ;
  ((self.UIMODE).ListOnly).offset = ((self._ui)._currentSettingBg):GetSizeY() + 10
  self._listOriginalPos = ((self._ui)._bgAllList):GetPosY()
  -- DECOMPILER ERROR at PC316: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._originalPos).button = ((self._ui)._buttonSetDefault):GetPosY()
  -- DECOMPILER ERROR at PC336: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._buttonPos)[((self.UIMODE).Current).index] = ((self._ui)._buttonSetDefault):GetPosY() - ((self._ui)._bgAllList):GetSizeY() - 10 - ((self._ui)._bgDesc):GetSizeY()
  -- DECOMPILER ERROR at PC345: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._buttonPos)[((self.UIMODE).List).index] = ((self._ui)._buttonSetDefault):GetPosY()
  -- DECOMPILER ERROR at PC360: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._buttonPos)[((self.UIMODE).ListOnly).index] = ((self._ui)._buttonSetDefault):GetPosY() - (((self._ui)._currentSettingBg):GetSizeY() + 10)
end

FGlobal_ButtonShortcuts_CheckUiEdit = function(uiEdit)
  -- function num : 0_20
  if PaGlobal_ButtonShortcuts._ui == nil or (PaGlobal_ButtonShortcuts._ui)._editSearchText == nil then
    return false
  end
  if Panel_ButtonShortcuts:GetShow() == false then
    return false
  end
  if uiEdit:GetKey() == ((PaGlobal_ButtonShortcuts._ui)._editSearchText):GetKey() then
    return true
  end
  return false
end

FromClient_InitButtonShortcuts = function()
  -- function num : 0_21
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_ButtonShortcuts._altString = "Alt + "
  PaGlobal_ButtonShortcuts:InitUI()
end

FromClient_OpenButtonShortcuts = function(index)
  -- function num : 0_22
  PaGlobal_ButtonShortcuts:Open(index)
  PaGlobal_ButtonShortcuts:MoveUI(((PaGlobal_ButtonShortcuts.UIMODE).List).index)
  PaGlobal_ButtonShortcuts:MoveUI(((PaGlobal_ButtonShortcuts.UIMODE).Current).index)
end

ToClent_setButtonShortcutsMarkIcon((UI.getChildControl)(Panel_ButtonShortcuts, "Static_ButtonShortcuts_MarkIcon"))
registerEvent("FromClient_luaLoadComplete", "FromClient_InitButtonShortcuts")
registerEvent("FromClient_luaLoadCompleteLateUdpate", "FromClient_ButtonShortcuts_luaLoadCompleteLateUdpate")
registerEvent("FromClient_OpenButtonShortcuts", "FromClient_OpenButtonShortcuts")
registerEvent("FromClient_OpenButtonShortcuts_WithElement", "FromClient_OpenButtonShortcuts_WithElement")
PaGlobal_ButtonShortcuts_SimpleTooltips = function(isShow, tipType)
  -- function num : 0_23
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  local name, desc, control = nil, nil, nil
  local self = PaGlobal_ButtonShortcuts
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_BUTTONSHORTCUT_ALL_LIST")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_BUTTONSHORTCUT_ALL_LIST_DESC")
    control = (self._ui)._buttonAllView
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_BUTTONSHORTCUT_ALL_RESET")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_BUTTONSHORTCUT_ALL_RESET_DESC")
      control = (self._ui)._buttonSetDefault
    else
      if tipType == 2 then
        name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_BUTTONSHORTCUT_ALL_VIEW")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_BUTTONSHORTCUT_ALL_VIEW_DESC")
        control = (self._ui)._checkButtonAllVeiw
      end
    end
  end
  TooltipSimple_Show(control, name, desc)
end

-- DECOMPILER ERROR at PC131: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.GetText = function(self, keyCode)
  -- function num : 0_24
  if keyCode == 0 then
    return self._NothingText
  else
    if (self.keyString)[keyCode] == nil then
      return self._NothingText
    end
    return self._altString .. (self.keyString)[keyCode]
  end
end

-- DECOMPILER ERROR at PC134: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.IsExhibitKey = function(self, keyCode)
  -- function num : 0_25
  if (CppEnums.VirtualKeyCode).KeyCode_SHIFT == keyCode or (CppEnums.VirtualKeyCode).KeyCode_TAB == keyCode or (CppEnums.VirtualKeyCode).KeyCode_BACK == keyCode or (CppEnums.VirtualKeyCode).KeyCode_CAPITAL == keyCode or (CppEnums.VirtualKeyCode).KeyCode_CONTROL == keyCode or (CppEnums.VirtualKeyCode).KeyCode_SPACE == keyCode or (CppEnums.VirtualKeyCode).KeyCode_OEM_7 == keyCode or (CppEnums.VirtualKeyCode).KeyCode_OEM_2 == keyCode or (CppEnums.VirtualKeyCode).KeyCode_OEM_3 == keyCode or self._NothingText == self:GetText(keyCode) then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC418: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.keyString = {[(CppEnums.VirtualKeyCode).KeyCode_1] = "1", [(CppEnums.VirtualKeyCode).KeyCode_2] = "2", [(CppEnums.VirtualKeyCode).KeyCode_3] = "3", [(CppEnums.VirtualKeyCode).KeyCode_4] = "4", [(CppEnums.VirtualKeyCode).KeyCode_5] = "5", [(CppEnums.VirtualKeyCode).KeyCode_6] = "6", [(CppEnums.VirtualKeyCode).KeyCode_7] = "7", [(CppEnums.VirtualKeyCode).KeyCode_8] = "8", [(CppEnums.VirtualKeyCode).KeyCode_9] = "9", [(CppEnums.VirtualKeyCode).KeyCode_0] = "0", [(CppEnums.VirtualKeyCode).KeyCode_SUBTRACT] = "-", [(CppEnums.VirtualKeyCode).KeyCode_ADD] = "+", [(CppEnums.VirtualKeyCode).KeyCode_Q] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_Q"), [(CppEnums.VirtualKeyCode).KeyCode_W] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_W"), [(CppEnums.VirtualKeyCode).KeyCode_E] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_E"), [(CppEnums.VirtualKeyCode).KeyCode_R] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_R"), [(CppEnums.VirtualKeyCode).KeyCode_T] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_T"), [(CppEnums.VirtualKeyCode).KeyCode_Y] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_Y"), [(CppEnums.VirtualKeyCode).KeyCode_U] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_U"), [(CppEnums.VirtualKeyCode).KeyCode_I] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_I"), [(CppEnums.VirtualKeyCode).KeyCode_O] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_O"), [(CppEnums.VirtualKeyCode).KeyCode_P] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_P"), [(CppEnums.VirtualKeyCode).KeyCode_A] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_A"), [(CppEnums.VirtualKeyCode).KeyCode_S] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_S"), [(CppEnums.VirtualKeyCode).KeyCode_D] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_D"), [(CppEnums.VirtualKeyCode).KeyCode_F] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_F"), [(CppEnums.VirtualKeyCode).KeyCode_G] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_G"), [(CppEnums.VirtualKeyCode).KeyCode_H] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_H"), [(CppEnums.VirtualKeyCode).KeyCode_J] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_J"), [(CppEnums.VirtualKeyCode).KeyCode_K] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_K"), [(CppEnums.VirtualKeyCode).KeyCode_L] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_L"), [(CppEnums.VirtualKeyCode).KeyCode_OEM_7] = "\'", [(CppEnums.VirtualKeyCode).KeyCode_Z] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_Z"), [(CppEnums.VirtualKeyCode).KeyCode_X] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_X"), [(CppEnums.VirtualKeyCode).KeyCode_V] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_V"), [(CppEnums.VirtualKeyCode).KeyCode_N] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_N"), [(CppEnums.VirtualKeyCode).KeyCode_M] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_M"), [(CppEnums.VirtualKeyCode).KeyCode_OEM_2] = "/", [(CppEnums.VirtualKeyCode).KeyCode_MENU] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_Alt")}

