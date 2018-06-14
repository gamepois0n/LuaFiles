-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\guild\console\panel_window_guild_create.luac 

-- params : ...
-- function num : 0
local Window_Guild_CreateInfo = {
_ui = {_edit_GuildName = (UI.getChildControl)(Panel_Console_Window_GuildCreate, "Edit_Name"), _edit_GuildCost = (UI.getChildControl)(Panel_Console_Window_GuildCreate, "Edit_GuildCost"), _button_Cancel = (UI.getChildControl)(Panel_Console_Window_GuildCreate, "Button_Cancel"), _button_Confirm = (UI.getChildControl)(Panel_Console_Window_GuildCreate, "Button_Confirm"), _staticText_NamingPolicy = (UI.getChildControl)(Panel_Console_Window_GuildCreate, "StaticText_NamingPolicy")}
}
PaGlobalFunc_GuildCreate_Confirm = function()
  -- function num : 0_0 , upvalues : Window_Guild_CreateInfo
  local self = Window_Guild_CreateInfo
  if ((self._ui)._edit_GuildName):GetEditText() == "" then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_POPUP_ENTER_GUILDNAME"))
    ClearFocusEdit()
    return 
  end
  local isRaisingGuildGrade = false
  local guildGrade = 0
  local guildName = ((self._ui)._edit_GuildName):GetEditText()
  local businessFunds = 100000
  guildGrade = 1
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  do
    if myGuildListInfo ~= nil then
      local myGuildGrade = myGuildListInfo:getGuildGrade()
      if myGuildGrade ~= 0 then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_POPUP_NOGUILD_NOUPGRADE_ACK"))
        ClearFocusEdit()
        return 
      end
      isRaisingGuildGrade = true
    end
    if isRaisingGuildGrade == false then
      ToClient_RequestCreateGuild(guildName, guildGrade, businessFunds)
    else
      ToClient_RequestRaisingGuildGrade(guildGrade, businessFunds)
    end
    PaGlobalFunc_GuildCreate_Close()
    ClearFocusEdit()
  end
end

PaGlobalFunc_GuildCreate_ClearFocus = function()
  -- function num : 0_1 , upvalues : Window_Guild_CreateInfo
  local self = Window_Guild_CreateInfo
  ClearFocusEdit()
  ;
  ((self._ui)._button_EditGuildName):addInputEvent("Mouse_LUp", "PaGlobalFunc_GuildCreate_SetFocus()")
end

PaGlobalFunc_GuildCreate_SetFocus = function()
  -- function num : 0_2 , upvalues : Window_Guild_CreateInfo
  local self = Window_Guild_CreateInfo
  SetFocusEdit((self._ui)._edit_GuildName)
  ;
  ((self._ui)._button_EditGuildName):addInputEvent("Mouse_LUp", "PaGlobalFunc_GuildCreate_ClearFocus()")
end

Window_Guild_CreateInfo.InitEvent = function(self)
  -- function num : 0_3
  ((self._ui)._button_Confirm):addInputEvent("Mouse_LUp", "PaGlobalFunc_GuildCreate_Confirm()")
  ;
  ((self._ui)._button_Cancel):addInputEvent("Mouse_LUp", "PaGlobalFunc_GuildCreate_Close()")
  if _ContentsGroup_isConsolePadControl == false then
    ((self._ui)._button_EditGuildName):addInputEvent("Mouse_LUp", "PaGlobalFunc_GuildCreate_SetFocus()")
  end
  Panel_Console_Window_GuildCreate:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_X, "PaGlobalFunc_GuildCreate_SetFocus()")
  Panel_Console_Window_GuildCreate:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_A, "PaGlobalFunc_GuildCreate_Confirm()")
end

Window_Guild_CreateInfo.InitControl = function(self)
  -- function num : 0_4
  ((self._ui)._edit_GuildName):SetMaxInput(getGameServiceTypeGuildNameLength())
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._button_EditGuildName = (UI.getChildControl)((self._ui)._edit_GuildName, "StaticText_Key_ConsoleUI")
  ;
  ((self._ui)._staticText_NamingPolicy):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._staticText_NamingPolicy):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_POPUP_1"))
end

PaGlobalFunc_GuildCreate_GetShow = function()
  -- function num : 0_5
  return Panel_Console_Window_GuildCreate:GetShow()
end

PaGlobalFunc_GuildCreate_Open = function()
  -- function num : 0_6 , upvalues : Window_Guild_CreateInfo
  if PaGlobalFunc_GuildCreate_GetShow() == true then
    return 
  end
  local self = Window_Guild_CreateInfo
  ;
  ((self._ui)._edit_GuildName):SetEditText("")
  PaGlobalFunc_GuildCreate_SetShow(true, false)
end

PaGlobalFunc_GuildCreate_Close = function()
  -- function num : 0_7
  if PaGlobalFunc_GuildCreate_GetShow() == false then
    return 
  end
  PaGlobalFunc_GuildCreate_SetShow(false, false)
end

PaGlobalFunc_GuildCreate_SetShow = function(isShow, isAni)
  -- function num : 0_8
  Panel_Console_Window_GuildCreate:SetShow(isShow, isAni)
end

Window_Guild_CreateInfo.Initialize = function(self)
  -- function num : 0_9
  self:InitControl()
  self:InitEvent()
end

PaGlobalFunc_FromClient_GuildCreate_luaLoadComplete = function()
  -- function num : 0_10 , upvalues : Window_Guild_CreateInfo
  local self = Window_Guild_CreateInfo
  self:Initialize()
end

registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_FromClient_GuildCreate_luaLoadComplete")

