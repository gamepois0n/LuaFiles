local _panel = Panel_Console_Window_GuildCreate
local GuildCreate = {
  _ui = {
    _edit_GuildName = UI.getChildControl(_panel, "Edit_Name"),
    _edit_GuildCost = UI.getChildControl(_panel, "Edit_GuildCost"),
    _button_Cancel = UI.getChildControl(_panel, "Button_Cancel"),
    _button_Confirm = UI.getChildControl(_panel, "Button_Confirm"),
    _staticText_NamingPolicy = UI.getChildControl(_panel, "StaticText_NamingPolicy")
  },
  _createGuildGrade = nil,
  _isRaisingGuildGrade = false
}
function GuildCreate:init()
  self:InitControl()
  self:InitEvent()
end
function GuildCreate:InitControl()
  self._ui._edit_GuildName:SetMaxInput(getGameServiceTypeGuildNameLength())
  self._ui._button_EditGuildName = UI.getChildControl(self._ui._edit_GuildName, "StaticText_Key_ConsoleUI")
  self._ui._staticText_NamingPolicy:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  self._ui._staticText_NamingPolicy:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_POPUP_1"))
end
function GuildCreate:InitEvent()
  self._ui._button_Confirm:addInputEvent("Mouse_LUp", "PaGlobalFunc_GuildCreate_Confirm()")
  self._ui._button_Cancel:addInputEvent("Mouse_LUp", "PaGlobalFunc_GuildCreate_Close()")
  if false == _ContentsGroup_isConsolePadControl then
    self._ui._button_EditGuildName:addInputEvent("Mouse_LUp", "PaGlobalFunc_GuildCreate_SetFocus()")
  end
  _panel:registerPadEvent(__eConsoleUIPadEvent_Up_X, "PaGlobalFunc_GuildCreate_SetFocus()")
  _panel:registerPadEvent(__eConsoleUIPadEvent_Up_A, "PaGlobalFunc_GuildCreate_Confirm()")
end
function GuildCreate:open()
  _panel:SetShow(true)
end
function GuildCreate:close()
  _panel:SetShow(false)
end
function PaGlobalFunc_GuildCreate_GetShow()
  return _panel:GetShow()
end
function PaGlobalFunc_GuildCreate_Confirm()
  local self = GuildCreate
  if "" == self._ui._edit_GuildName:GetEditText() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_POPUP_ENTER_GUILDNAME"))
    ClearFocusEdit()
    return
  end
  local isRaisingGuildGrade = false
  local guildGrade = self._createGuildGrade
  local guildName = self._ui._edit_GuildName:GetEditText()
  local businessFunds = 100000
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if nil ~= myGuildListInfo then
    local myGuildGrade = myGuildListInfo:getGuildGrade()
    if 0 ~= myGuildGrade then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_POPUP_NOGUILD_NOUPGRADE_ACK"))
      ClearFocusEdit()
      return
    end
    isRaisingGuildGrade = true
  end
  if false == isRaisingGuildGrade then
    ToClient_RequestCreateGuild(guildName, guildGrade, businessFunds)
  else
    ToClient_RequestRaisingGuildGrade(guildGrade, businessFunds)
  end
  PaGlobalFunc_GuildCreate_Close()
  ClearFocusEdit()
end
function PaGlobalFunc_GuildCreate_ClearFocus()
  local self = GuildCreate
  ClearFocusEdit()
  self._ui._button_EditGuildName:addInputEvent("Mouse_LUp", "PaGlobalFunc_GuildCreate_SetFocus()")
end
function PaGlobalFunc_GuildCreate_SetFocus()
  local self = GuildCreate
  SetFocusEdit(self._ui._edit_GuildName)
  self._ui._button_EditGuildName:addInputEvent("Mouse_LUp", "PaGlobalFunc_GuildCreate_ClearFocus()")
end
function PaGlobalFunc_GuildCreate_Open(createGuildGrade)
  if true == PaGlobalFunc_GuildCreate_GetShow() then
    return
  end
  local self = GuildCreate
  self._createGuildGrade = createGuildGrade
  self._ui._edit_GuildName:SetEditText("")
  self:open()
end
function PaGlobalFunc_GuildCreate_Close()
  local self = GuildCreate
  self:close()
end
function FromClient_GuildCreate_luaLoadComplete()
  local self = GuildCreate
  self:init()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_GuildCreate_luaLoadComplete")
