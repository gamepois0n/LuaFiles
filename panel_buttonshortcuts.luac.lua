-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\buttonshortcuts\panel_buttonshortcuts.luac 

-- params : ...
-- function num : 0
Panel_ButtonShortcuts:SetShow(false)
PaGlobal_ButtonShortcuts = {
_ui = {_curButtonString, _curChangeeShortcutsKey; _curButtonBg = (UI.getChildControl)(Panel_ButtonShortcuts, "Static_Current_Key_BG"), _list2 = (UI.getChildControl)(Panel_ButtonShortcuts, "List2_KeySetting_BG"), _checkButtonAllVeiw = (UI.getChildControl)(Panel_ButtonShortcuts, "CheckButton_AllView"), _editSearchText = (UI.getChildControl)(Panel_ButtonShortcuts, "Edit_SearchOption")}
, _curId = -1, _curButtonsShortcuts = nil, _altString = "Alt + ", _searchText = ""}
addButtonShortcutsEvent = function(func, keyCode)
  -- function num : 0_0
  local buttonShortcuts = ButtonShortcuts(keyCode)
  ToClent_addButtonShortcutsEvent(buttonShortcuts)
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.Open = function(self, index)
  -- function num : 0_1
  Panel_ButtonShortcuts:SetShow(true)
  self:ListRefresh()
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.ListRefresh = function(self)
  -- function num : 0_2
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

-- DECOMPILER ERROR at PC49: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.ClickedChangeShortcuts = function(self)
  -- function num : 0_3
  SetUIMode((Defines.UIMode).eUIMode_KeyCustom_ButtonShortcuts)
  ;
  ((self._ui)._curChangeeShortcutsKey):SetCheck(true)
  ;
  ((self._ui)._curChangeeShortcutsKey):SetText("")
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.ClickedListElementChangeShortcuts = function(self, id)
  -- function num : 0_4
  self._curId = id
  self._curButtonsShortcuts = ToClent_getButtonShortcutsEventAt(id)
  SetUIMode((Defines.UIMode).eUIMode_KeyCustom_ButtonShortcuts)
  ;
  ((self._ui)._list2):requestUpdateByKey(toInt64(0, self._curId))
end

-- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.Remove = function(self)
  -- function num : 0_5
  self._curId = -1
  ToClent_removeAtButtonShortcutsEvent(self._curButtonsShortcuts)
  self:ListRefresh()
end

-- DECOMPILER ERROR at PC58: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.Register = function(self, VirtualKeyCode)
  -- function num : 0_6
  if self:IsExhibitKey(VirtualKeyCode) == true then
    return 
  end
  local id = self._curId
  self._curId = -1
  ToClent_addButtonShortcutsEvent(self._curButtonsShortcuts, VirtualKeyCode)
  self:ListRefresh()
end

-- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.Close = function(self)
  -- function num : 0_7
  Panel_ButtonShortcuts:SetShow(false)
end

FGlobal_ButtonShortcurs_List2EventControlCreate = function(list_content, key)
  -- function num : 0_8
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
    _PA_LOG("후진", "buttonShortcuts:getKeyCode() : " .. buttonShortcuts:getKeyCode())
    if PaGlobal_ButtonShortcuts._curId ~= nil and id == PaGlobal_ButtonShortcuts._curId then
      shortcuts:SetText("")
    end
    shortcuts:SetCheck(id == PaGlobal_ButtonShortcuts._curId)
    shortcuts:addInputEvent("Mouse_LUp", "PaGlobal_ButtonShortcuts:ClickedListElementChangeShortcuts(" .. id .. ")")
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC66: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.ToggleAllVeiw = function(self)
  -- function num : 0_9
  self._searchText = ""
  self:ListRefresh()
  ClearFocusEdit()
end

-- DECOMPILER ERROR at PC69: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.ClickedSearch = function(self)
  -- function num : 0_10
  self._searchText = ((self._ui)._editSearchText):GetEditText()
  self:ListRefresh()
  ;
  ((self._ui)._editSearchText):SetEditText("")
  self._searchText = ""
  ClearFocusEdit()
end

FromClient_InitButtonShortcuts = function()
  -- function num : 0_11
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_ButtonShortcuts._altString = "Alt + "
  ;
  ((PaGlobal_ButtonShortcuts._ui)._checkButtonAllVeiw):addInputEvent("Mouse_LUp", "PaGlobal_ButtonShortcuts:ToggleAllVeiw()")
  ;
  ((PaGlobal_ButtonShortcuts._ui)._checkButtonAllVeiw):SetCheck(true)
  ;
  ((PaGlobal_ButtonShortcuts._ui)._list2):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "FGlobal_ButtonShortcurs_List2EventControlCreate")
  ;
  ((PaGlobal_ButtonShortcuts._ui)._list2):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  ((UI.getChildControl)(Panel_ButtonShortcuts, "Button_Close")):addInputEvent("Mouse_LUp", "PaGlobal_ButtonShortcuts:Close()")
  ;
  ((UI.getChildControl)((PaGlobal_ButtonShortcuts._ui)._editSearchText, "Button_SearchIcon")):addInputEvent("Mouse_LUp", "PaGlobal_ButtonShortcuts:ClickedSearch()")
end

FromClient_ButtonShortcuts_luaLoadCompleteLateUdpate = function()
  -- function num : 0_12
  if false then
    ToClent_updateButtonShortcutsGameVariable()
  end
end

FromClient_OpenButtonShortcuts = function(index)
  -- function num : 0_13
  if false then
    PaGlobal_ButtonShortcuts:Open(index)
  end
end

registerEvent("FromClient_luaLoadComplete", "FromClient_InitButtonShortcuts")
registerEvent("FromClient_luaLoadCompleteLateUdpate", "FromClient_ButtonShortcuts_luaLoadCompleteLateUdpate")
registerEvent("FromClient_OpenButtonShortcuts", "FromClient_OpenButtonShortcuts")
registerEvent("FromClient_OpenButtonShortcuts_WithElement", "FromClient_OpenButtonShortcuts_WithElement")
-- DECOMPILER ERROR at PC94: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.GetText = function(self, keyCode)
  -- function num : 0_14
  if keyCode == 0 then
    return ""
  else
    return self._altString .. (self.keyString)[keyCode]
  end
end

-- DECOMPILER ERROR at PC97: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.IsExhibitKey = function(self, keyCode)
  -- function num : 0_15
  if (CppEnums.VirtualKeyCode).KeyCode_SHIFT == keyCode or (CppEnums.VirtualKeyCode).KeyCode_TAB == keyCode or (CppEnums.VirtualKeyCode).KeyCode_BACK == keyCode or (CppEnums.VirtualKeyCode).KeyCode_CAPITAL == keyCode or (CppEnums.VirtualKeyCode).KeyCode_CONTROL == keyCode or (CppEnums.VirtualKeyCode).KeyCode_SPACE == keyCode or (CppEnums.VirtualKeyCode).KeyCode_OEM_7 == keyCode or (CppEnums.VirtualKeyCode).KeyCode_OEM_2 == keyCode or (CppEnums.VirtualKeyCode).KeyCode_OEM_3 == keyCode then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC577: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ButtonShortcuts.keyString = {[(CppEnums.VirtualKeyCode).KeyCode_ESCAPE] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_Esc"), [(CppEnums.VirtualKeyCode).KeyCode_F1] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_F1"), [(CppEnums.VirtualKeyCode).KeyCode_F2] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_F2"), [(CppEnums.VirtualKeyCode).KeyCode_F3] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_F3"), [(CppEnums.VirtualKeyCode).KeyCode_F4] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_F4"), [(CppEnums.VirtualKeyCode).KeyCode_F5] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_F5"), [(CppEnums.VirtualKeyCode).KeyCode_F6] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_F6"), [(CppEnums.VirtualKeyCode).KeyCode_F7] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_F7"), [(CppEnums.VirtualKeyCode).KeyCode_F8] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_F8"), [(CppEnums.VirtualKeyCode).KeyCode_F9] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_F9"), [(CppEnums.VirtualKeyCode).KeyCode_F10] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_F10"), [(CppEnums.VirtualKeyCode).KeyCode_F11] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_F11"), [(CppEnums.VirtualKeyCode).KeyCode_F12] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_F12"), [(CppEnums.VirtualKeyCode).KeyCode_OEM_3] = "OEM_3", [(CppEnums.VirtualKeyCode).KeyCode_1] = "1", [(CppEnums.VirtualKeyCode).KeyCode_2] = "2", [(CppEnums.VirtualKeyCode).KeyCode_3] = "3", [(CppEnums.VirtualKeyCode).KeyCode_4] = "4", [(CppEnums.VirtualKeyCode).KeyCode_5] = "5", [(CppEnums.VirtualKeyCode).KeyCode_6] = "6", [(CppEnums.VirtualKeyCode).KeyCode_7] = "7", [(CppEnums.VirtualKeyCode).KeyCode_8] = "8", [(CppEnums.VirtualKeyCode).KeyCode_9] = "9", [(CppEnums.VirtualKeyCode).KeyCode_0] = "0", [(CppEnums.VirtualKeyCode).KeyCode_SUBTRACT] = "SUBTRACT", [(CppEnums.VirtualKeyCode).KeyCode_ADD] = "ADD", [(CppEnums.VirtualKeyCode).KeyCode_BACK] = "BACK", [(CppEnums.VirtualKeyCode).KeyCode_TAB] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_Tab"), [(CppEnums.VirtualKeyCode).KeyCode_Q] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_Q"), [(CppEnums.VirtualKeyCode).KeyCode_W] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_W"), [(CppEnums.VirtualKeyCode).KeyCode_E] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_E"), [(CppEnums.VirtualKeyCode).KeyCode_R] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_R"), [(CppEnums.VirtualKeyCode).KeyCode_T] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_T"), [(CppEnums.VirtualKeyCode).KeyCode_Y] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_Y"), [(CppEnums.VirtualKeyCode).KeyCode_U] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_U"), [(CppEnums.VirtualKeyCode).KeyCode_I] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_I"), [(CppEnums.VirtualKeyCode).KeyCode_O] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_O"), [(CppEnums.VirtualKeyCode).KeyCode_P] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_P"), [(CppEnums.VirtualKeyCode).KeyCode_CAPITAL] = "CAPITAL", [(CppEnums.VirtualKeyCode).KeyCode_A] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_A"), [(CppEnums.VirtualKeyCode).KeyCode_S] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_S"), [(CppEnums.VirtualKeyCode).KeyCode_D] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_D"), [(CppEnums.VirtualKeyCode).KeyCode_F] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_F"), [(CppEnums.VirtualKeyCode).KeyCode_G] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_G"), [(CppEnums.VirtualKeyCode).KeyCode_H] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_H"), [(CppEnums.VirtualKeyCode).KeyCode_J] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_J"), [(CppEnums.VirtualKeyCode).KeyCode_K] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_K"), [(CppEnums.VirtualKeyCode).KeyCode_L] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_L"), [(CppEnums.VirtualKeyCode).KeyCode_OEM_7] = "\'", [(CppEnums.VirtualKeyCode).KeyCode_RETURN] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_Enter"), [(CppEnums.VirtualKeyCode).KeyCode_SHIFT] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_Shift"), [(CppEnums.VirtualKeyCode).KeyCode_Z] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_Z"), [(CppEnums.VirtualKeyCode).KeyCode_X] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_X"), [(CppEnums.VirtualKeyCode).KeyCode_C] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_C"), [(CppEnums.VirtualKeyCode).KeyCode_V] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_V"), [(CppEnums.VirtualKeyCode).KeyCode_B] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_B"), [(CppEnums.VirtualKeyCode).KeyCode_N] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_N"), [(CppEnums.VirtualKeyCode).KeyCode_M] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_M"), [(CppEnums.VirtualKeyCode).KeyCode_OEM_2] = "/", [(CppEnums.VirtualKeyCode).KeyCode_SHIFT] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_Shift"), [(CppEnums.VirtualKeyCode).KeyCode_CONTROL] = "CONTROL", [(CppEnums.VirtualKeyCode).KeyCode_MENU] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_Alt"), [(CppEnums.VirtualKeyCode).KeyCode_SPACE] = PAGetString(Defines.StringSheet_GAME, "InputCustomizer_Space")}

