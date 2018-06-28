local Window_Guild_CreateInfo = {
  _ui = {
    _edit_GuildName = UI.getChildControl(Panel_Console_Window_GuildCreate, "Edit_Name"),
    _edit_GuildCost = UI.getChildControl(Panel_Console_Window_GuildCreate, "Edit_GuildCost"),
    _button_Cancel = UI.getChildControl(Panel_Console_Window_GuildCreate, "Button_Cancel"),
    _button_Confirm = UI.getChildControl(Panel_Console_Window_GuildCreate, "Button_Confirm"),
    _staticText_NamingPolicy = UI.getChildControl(Panel_Console_Window_GuildCreate, "StaticText_NamingPolicy")
  }
}
function PaGlobalFunc_GuildCreate_Confirm()
  local self = Window_Guild_CreateInfo
  if "" == self._ui._edit_GuildName:GetEditText() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_POPUP_ENTER_GUILDNAME"))
    ClearFocusEdit()
    return
  end
  local isRaisingGuildGrade = false
  local guildGrade = 0
  local guildName = self._ui._edit_GuildName:GetEditText()
  local businessFunds = 100000
  guildGrade = 1
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
  local self = Window_Guild_CreateInfo
  ClearFocusEdit()
  self._ui._button_EditGuildName:addInputEvent("Mouse_LUp", "PaGlobalFunc_GuildCreate_SetFocus()")
end
function PaGlobalFunc_GuildCreate_SetFocus()
  local self = Window_Guild_CreateInfo
  SetFocusEdit(self._ui._edit_GuildName)
  self._ui._button_EditGuildName:addInputEvent("Mouse_LUp", "PaGlobalFunc_GuildCreate_ClearFocus()")
end
function Window_Guild_CreateInfo:InitEvent()
  self._ui._button_Confirm:addInputEvent("Mouse_LUp", "PaGlobalFunc_GuildCreate_Confirm()")
  self._ui._button_Cancel:addInputEvent("Mouse_LUp", "PaGlobalFunc_GuildCreate_Close()")
  if false == _ContentsGroup_isConsolePadControl then
    self._ui._button_EditGuildName:addInputEvent("Mouse_LUp", "PaGlobalFunc_GuildCreate_SetFocus()")
  end
  Panel_Console_Window_GuildCreate:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_X, "PaGlobalFunc_GuildCreate_SetFocus()")
  Panel_Console_Window_GuildCreate:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_A, "PaGlobalFunc_GuildCreate_Confirm()")
end
function Window_Guild_CreateInfo:InitControl()
  self._ui._edit_GuildName:SetMaxInput(getGameServiceTypeGuildNameLength())
  self._ui._button_EditGuildName = UI.getChildControl(self._ui._edit_GuildName, "StaticText_Key_ConsoleUI")
  self._ui._staticText_NamingPolicy:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  self._ui._staticText_NamingPolicy:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_POPUP_1"))
end
function PaGlobalFunc_GuildCreate_GetShow()
  return Panel_Console_Window_GuildCreate:GetShow()
end
function PaGlobalFunc_GuildCreate_Open()
  if true == PaGlobalFunc_GuildCreate_GetShow() then
    return
  end
  local self = Window_Guild_CreateInfo
  self._ui._edit_GuildName:SetEditText("")
  PaGlobalFunc_GuildCreate_SetShow(true, false)
end
function PaGlobalFunc_GuildCreate_Close()
  if false == PaGlobalFunc_GuildCreate_GetShow() then
    return
  end
  PaGlobalFunc_GuildCreate_SetShow(false, false)
end
function PaGlobalFunc_GuildCreate_SetShow(isShow, isAni)
  Panel_Console_Window_GuildCreate:SetShow(isShow, isAni)
end
function Window_Guild_CreateInfo:Initialize()
  self:InitControl()
  self:InitEvent()
end
function PaGlobalFunc_FromClient_GuildCreate_luaLoadComplete()
  local self = Window_Guild_CreateInfo
  self:Initialize()
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_FromClient_GuildCreate_luaLoadComplete")
