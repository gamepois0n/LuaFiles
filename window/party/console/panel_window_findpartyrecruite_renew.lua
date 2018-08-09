local Panel_Window_FindPartyRecruite_info = {
  _ui = {
    static_CenterBg = nil,
    edit_AdDesc = nil,
    static_Level = nil,
    static_BottomBg = nil,
    staticText_X_ConsoleUI = nil,
    staticText_A_ConsoleUI = nil,
    staticText_B_ConsoleUI = nil
  },
  _value = {selectLevel = 1},
  _config = {maxlevel = 60},
  _enum = {},
  _keyGuide = {}
}
function Panel_Window_FindPartyRecruite_info:registEventHandler()
  Panel_PartyRecruite:registerPadEvent(__eConsoleUIPadEvent_DpadUp, "PaGlobalFunc_FindPartyRecruite_SetLevel(1)")
  Panel_PartyRecruite:registerPadEvent(__eConsoleUIPadEvent_DpadDown, "PaGlobalFunc_FindPartyRecruite_SetLevel(-1)")
  Panel_PartyRecruite:registerPadEvent(__eConsoleUIPadEvent_Up_X, "PaGlobalFunc_FindPartyRecruite_Edit()")
  Panel_PartyRecruite:registerPadEvent(__eConsoleUIPadEvent_Up_A, "PaGlobalFunc_FindPartyRecruite_Confrim()")
  self._ui.edit_AdDesc:setXboxVirtualKeyBoardEndEvent("PaGlobalFunc_FindPartyRecruite_OnVirtualKeyboardEnd")
end
function Panel_Window_FindPartyRecruite_info:registerMessageHandler()
  registerEvent("onScreenResize", "FromClient_FindPartyRecruite_Resize")
end
function Panel_Window_FindPartyRecruite_info:initialize()
  self:childControl()
  self:initValue()
  self:resize()
  self:registerMessageHandler()
  self:registEventHandler()
end
function Panel_Window_FindPartyRecruite_info:initValue()
  self._value.selectLevel = 1
end
function Panel_Window_FindPartyRecruite_info:resize()
  PaGlobalFunc_ConsoleKeyGuide_SetAlign(self._keyGuide, self._ui.static_BottomBg, CONSOLEKEYGUID_ALIGN_TYPE.eALIGN_TYPE_RIGHT)
end
function Panel_Window_FindPartyRecruite_info:childControl()
  self._ui.static_CenterBg = UI.getChildControl(Panel_PartyRecruite, "Static_CenterBg")
  self._ui.edit_AdDesc = UI.getChildControl(self._ui.static_CenterBg, "Edit_AdDesc")
  self._ui.static_Level = UI.getChildControl(self._ui.static_CenterBg, "Static_Level")
  self._ui.static_BottomBg = UI.getChildControl(Panel_PartyRecruite, "Static_BottomBg")
  self._ui.staticText_X_ConsoleUI = UI.getChildControl(self._ui.static_BottomBg, "StaticText_X_ConsoleUI")
  self._ui.staticText_A_ConsoleUI = UI.getChildControl(self._ui.static_BottomBg, "StaticText_A_ConsoleUI")
  self._ui.staticText_B_ConsoleUI = UI.getChildControl(self._ui.static_BottomBg, "StaticText_B_ConsoleUI")
  self._keyGuide = {
    self._ui.staticText_X_ConsoleUI,
    self._ui.staticText_A_ConsoleUI,
    self._ui.staticText_B_ConsoleUI
  }
end
function Panel_Window_FindPartyRecruite_info:setBaseText()
  local baseText = PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLISTRECRUITE_DEFALUTTEXT")
  self._ui.edit_AdDesc:SetEditText(baseText)
end
function Panel_Window_FindPartyRecruite_info:setBaseLevel()
  self._ui.static_Level:SetText(tostring(self._value.selectLevel))
end
function Panel_Window_FindPartyRecruite_info:open()
  Panel_PartyRecruite:SetShow(true)
end
function Panel_Window_FindPartyRecruite_info:close()
  Panel_PartyRecruite:SetShow(false)
end
function PaGlobalFunc_FindPartyRecruite_GetShow()
  return Panel_PartyRecruite:GetShow()
end
function PaGlobalFunc_FindPartyRecruite_Open()
  local self = Panel_Window_FindPartyRecruite_info
  self:open()
end
function PaGlobalFunc_FindPartyRecruite_Close()
  local self = Panel_Window_FindPartyRecruite_info
  self:close()
end
function PaGlobalFunc_FindPartyRecruite_Show()
  local self = Panel_Window_FindPartyRecruite_info
  self:initValue()
  self:setBaseText()
  self:setBaseLevel()
  self:resize()
  self:open()
end
function PaGlobalFunc_FindPartyRecruite_Exit()
  local self = Panel_Window_FindPartyRecruite_info
  if true == self._ui.edit_AdDesc:GetFocusEdit() then
    ClearFocusEdit()
    return
  end
  self:close()
end
function PaGlobalFunc_FindPartyRecruite_ExitAll()
  local self = Panel_Window_FindPartyRecruite_info
  if true == self._ui.edit_AdDesc:GetFocusEdit() then
    ClearFocusEdit()
  end
  self:close()
end
function PaGlobalFunc_FindPartyRecruite_SetLevel(value)
  ToClient_padSnapResetControl()
  local self = Panel_Window_FindPartyRecruite_info
  if 0 == self._value.selectLevel + value then
    return
  end
  if self._config.maxlevel < self._value.selectLevel + value then
    return
  end
  self._value.selectLevel = self._value.selectLevel + value
  self:setBaseLevel()
end
function PaGlobalFunc_FindPartyRecruite_Confrim()
  local self = Panel_Window_FindPartyRecruite_info
  local msg = self._ui.edit_AdDesc:GetEditText()
  local baseText = PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLISTRECRUITE_DEFALUTTEXT")
  if "" == msg or baseText == msg then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLISTRECRUITE_REGISTALERT"))
    return
  end
  ToClient_RequestPartyRecruitment(msg, self._value.selectLevel, 5)
  self:close()
end
function PaGlobalFunc_FindPartyRecruite_Edit()
  local self = Panel_Window_FindPartyRecruite_info
  if true == self._ui.edit_AdDesc:GetFocusEdit() then
    ClearFocusEdit()
  else
    SetFocusEdit(self._ui.edit_AdDesc)
    self._ui.edit_AdDesc:SetEditText("")
  end
end
function PaGlobalFunc_FindPartyRecruite_OnVirtualKeyboardEnd(str)
  local self = Panel_Window_FindPartyRecruite_info
  self._ui.edit_AdDesc:SetEditText(str)
  ClearFocusEdit()
end
function FromClient_FindPartyRecruite_Init()
  local self = Panel_Window_FindPartyRecruite_info
  self:initialize()
end
function FromClient_FindPartyRecruite_Resize()
  local self = Panel_Window_FindPartyRecruite_info
  self:resize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_FindPartyRecruite_Init")
