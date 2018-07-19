local Panel_Dialog_DetectPlayer_info = {
  _ui = {
    static_CenterBg = nil,
    staticText_Desc = nil,
    edit_Name = nil
  },
  _text = {desc = nil, inEdit = nil}
}
function Panel_Dialog_DetectPlayer_info:registEventHandler()
  Panel_DetectPlayer:registerPadEvent(__eConsoleUIPadEvent_Up_X, "PaGlobalFunc_DetectPlayer_NameSetfocus()")
  Panel_DetectPlayer:registerPadEvent(__eConsoleUIPadEvent_Up_A, "PaGlobalFunc_DetectPlayer_Confirm()")
  self._ui.edit_Name:setXboxVirtualKeyBoardEndEvent("PaGlobalFunc_DetectPlayer_OnVirtualKeyboardEnd")
end
function Panel_Dialog_DetectPlayer_info:registerMessageHandler()
  registerEvent("FromClient_OpenDetectPlayer", "FromClient_DetectPlayer_OpenDetectPlayer")
  registerEvent("FromClient_CompleteDetectPlayer", "FromClient_DetectPlayer_CompleteDetectPlayer")
end
function Panel_Dialog_DetectPlayer_info:initialize()
  self:childControl()
  self:initValue()
  self:registerMessageHandler()
  self:registEventHandler()
end
function Panel_Dialog_DetectPlayer_info:initValue()
  self._text.desc = PAGetString(Defines.StringSheet_GAME, "LUA_DETECTPLAYER_GUIDEMSG")
  self._text.inEdit = PAGetString(Defines.StringSheet_GAME, "LUA_DETECTPLAYER_EDITPLAYERNAME_DEFAULTMSG")
end
function Panel_Dialog_DetectPlayer_info:childControl()
  self._ui.static_CenterBg = UI.getChildControl(Panel_DetectPlayer, "Static_CenterBg")
  self._ui.staticText_Desc = UI.getChildControl(self._ui.static_CenterBg, "StaticText_Desc")
  self._ui.edit_Name = UI.getChildControl(self._ui.static_CenterBg, "Edit_Name")
end
function Panel_Dialog_DetectPlayer_info:setBaseText()
  self._ui.staticText_Desc:SetText(self._text.desc)
  self._ui.edit_Name:SetText(self._text.inEdit)
end
function Panel_Dialog_DetectPlayer_info:setContent()
  self:setBaseText()
end
function Panel_Dialog_DetectPlayer_info:open()
  Panel_DetectPlayer:SetShow(true)
end
function Panel_Dialog_DetectPlayer_info:close()
  Panel_DetectPlayer:SetShow(false)
end
function PaGlobalFunc_DetectPlayer_GetShow()
  return Panel_DetectPlayer:GetShow()
end
function PaGlobalFunc_DetectPlayer_Open()
  local self = Panel_Dialog_DetectPlayer_info
  self:open()
end
function PaGlobalFunc_DetectPlayer_Close()
  local self = Panel_Dialog_DetectPlayer_info
  self:close()
end
function PaGlobalFunc_DetectPlayer_Show()
  local self = Panel_Dialog_DetectPlayer_info
  self:setContent()
  self:open()
end
function PaGlobalFunc_DetectPlayer_Exit()
  local self = Panel_Dialog_DetectPlayer_info
  if true == self._ui.edit_Name:GetFocusEdit() then
    ClearFocusEdit()
    return
  end
  self:close()
end
function PaGlobalFunc_DetectPlayer_ExitAll()
  local self = Panel_Dialog_DetectPlayer_info
  if true == self._ui.edit_Name:GetFocusEdit() then
    ClearFocusEdit()
  end
  self:close()
end
function PaGlobalFunc_DetectPlayer_Confirm()
  local self = Panel_Dialog_DetectPlayer_info
  local name = self._ui.edit_Name:GetEditText()
  local msgDefault = PAGetString(Defines.StringSheet_GAME, "LUA_DETECTPLAYER_EDITPLAYERNAME_DEFAULTMSG")
  if nil == name or "" == name or msgDefault == name then
    local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY")
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_DETECTPLAYER_ERRORMSG_PLAYERNAME_NIL")
    local messageboxData = {
      title = messageBoxTitle,
      content = messageBoxMemo,
      functionApply = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageboxData)
  elseif nil ~= string.find(name, " ") then
    local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY")
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_DETECTPLAYER_ERRORMSG_PLAYERNAME_SPACE")
    local messageboxData = {
      title = messageBoxTitle,
      content = messageBoxMemo,
      functionApply = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageboxData)
  else
    ToClient_DetectPlayer(name)
    self:close()
  end
end
function PaGlobalFunc_DetectPlayer_OnVirtualKeyboardEnd(str)
  local self = Panel_Dialog_DetectPlayer_info
  self._ui.edit_Name:SetEditText(str)
  ClearFocusEdit()
  PaGlobalFunc_DetectPlayer_Confirm()
end
function PaGlobalFunc_DetectPlayer_NameSetfocus()
  local self = Panel_Dialog_DetectPlayer_info
  if true == self._ui.edit_Name:GetFocusEdit() then
    ClearFocusEdit()
  else
    SetFocusEdit(self._ui.edit_Name)
    self._ui.edit_Name:SetEditText("")
  end
end
function FromClient_DetectPlayer_Init()
  local self = Panel_Dialog_DetectPlayer_info
  self:initialize()
end
function FromClient_DetectPlayer_Resize()
  local self = Panel_Dialog_DetectPlayer_info
  self:resize()
end
function FromClient_DetectPlayer_OpenDetectPlayer()
  PaGlobalFunc_DetectPlayer_Show()
end
function FromClient_DetectPlayer_CompleteDetectPlayer(position)
  FGlobal_PushOpenWorldMap()
  FromClient_RClickWorldmapPanel(position, true, false)
end
registerEvent("FromClient_luaLoadComplete", "FromClient_DetectPlayer_Init")
