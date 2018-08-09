local _panel = Panel_Window_Clan_Renew
local ClanRenew = {
  _ui = {
    stc_TopBg = UI.getChildControl(_panel, "Static_TopBg"),
    stc_ListBg = UI.getChildControl(_panel, "Static_GuildListBg"),
    stc_BottomBg = UI.getChildControl(_panel, "Static_BottomBg")
  }
}
function ClanRenew:init()
  self._ui.list_ClanMemberList = UI.getChildControl(self._ui.stc_ListBg, "List2_GuildlistBg")
  self._ui.btn_YConsoleUI = UI.getChildControl(self._ui.stc_BottomBg, "Button_Y_ConsoleUI")
  self._ui.btn_AConsoleUI = UI.getChildControl(self._ui.stc_BottomBg, "Button_A_ConsoleUI")
  self:registEventHandler()
end
function ClanRenew:registEventHandler()
  registerEvent("progressEventCancelByAttacked", "PaGlobalFunc_ClanRenew_Close")
  self._ui.list_ClanMemberList:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobalFunc_ClanRenew_CreateControl")
  self._ui.list_ClanMemberList:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
  _panel:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "InputMLUp_ClanRenew_LeaveClan()")
  registerEvent("FromClient_ResponseChangeGuildMemberGrade", "PaGlobalFunc_ClanRenew_Update")
  registerEvent("FromClient_RequestExpelMemberFromGuild", "PaGlobalFunc_ClanRenew_Update")
  registerEvent("FromClient_ResponseGuildUpdate", "PaGlobalFunc_ClanRenew_Update")
end
function ClanRenew:open()
  self:update()
  _panel:SetShow(true)
end
function PaGlobalFunc_ClanRenew_Close()
  ClanRenew:close()
end
function ClanRenew:close()
  _panel:SetShow(false)
end
function ClanRenew:update()
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if nil == myGuildInfo then
    self:close()
    return
  end
  local isGuildMaster = getSelfPlayer():get():isGuildMaster()
  if true == isGuildMaster then
    self._ui.btn_YConsoleUI:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CLANLIST_BTN_CLANDISPERSAL"))
  else
    self._ui.btn_YConsoleUI:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CLAN_LEAVE"))
  end
  local memberCount = myGuildInfo:getMemberCount()
  self._ui.list_ClanMemberList:getElementManager():clearKey()
  for memberIdx = 0, memberCount - 1 do
    self._ui.list_ClanMemberList:getElementManager():pushKey(toInt64(0, memberIdx))
  end
end
function PaGlobalFunc_ClanRenew_Init()
  local self = ClanRenew
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ClanRenew")
    return
  end
  self:init()
end
function FGlobal_ClanList_Open()
  local self = ClanRenew
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ClanRenew")
    return
  end
  self:open()
end
function FGlobal_ClanList_Close()
  local self = ClanRenew
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ClanRenew")
    return
  end
  self:close()
end
function PaGlobalFunc_ClanRenew_GetShow()
  return _panel:GetShow()
end
function PaGlobalFunc_ClanRenew_CreateControl(content, key)
  local self = ClanRenew
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ClanRenew")
    return
  end
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if nil == myGuildInfo then
    self:close()
    return
  end
  local index = Int64toInt32(key)
  local memberInfo = myGuildInfo:getMember(index)
  if nil == memberInfo then
    return
  end
  local stc_Focus = UI.getChildControl(content, "Static_Focus")
  local txt_Grade = UI.getChildControl(content, "StaticText_Grade")
  local txt_Level = UI.getChildControl(content, "StaticText_LevelTitle")
  local txt_Name = UI.getChildControl(content, "StaticText_NameValue")
  local txt_Class = UI.getChildControl(content, "StaticText_ClassValue")
  local memberGrade = memberInfo:getGrade()
  if 0 == memberGrade then
    txt_Grade:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDMASTER"))
  elseif 1 == memberGrade then
    txt_Grade:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDSUBMASTER"))
  elseif 2 == memberGrade then
    txt_Grade:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDMEMBER"))
  end
  if true == memberInfo:isOnline() then
    txt_Level:SetText(memberInfo:getLevel())
    txt_Name:SetText(memberInfo:getName() .. " (" .. memberInfo:getCharacterName() .. ")")
    txt_Class:SetText(CppEnums.ClassType2String[memberInfo:getClassType()])
  else
    txt_Level:SetText("-")
    txt_Name:SetText(memberInfo:getName() .. " ( - )")
    txt_Class:SetText("-")
  end
  local isGuildMaster = getSelfPlayer():get():isGuildMaster()
  local isGuildSubMaster = getSelfPlayer():get():isGuildSubMaster()
  local selfName = getSelfPlayer():getUserNickname()
  stc_Focus:addInputEvent("Mouse_On", "InputMO_ClanRenew_ShowKeyGuide(false)")
  if memberInfo:getName() ~= selfName and (true == isGuildMaster or true == isGuildSubMaster) then
    stc_Focus:addInputEvent("Mouse_LUp", "PaGlobalFunc_GuildMemberFunction_ClanOpen(" .. index .. ")")
    stc_Focus:addInputEvent("Mouse_On", "InputMO_ClanRenew_ShowKeyGuide(true)")
  end
end
function PaGlobalFunc_ClanRenew_Update()
  local self = ClanRenew
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ClanRenew")
    return
  end
  self:update()
end
function InputMLUp_ClanRenew_LeaveClan()
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if nil == myGuildInfo then
    _PA_ASSERT(false, "\234\184\184\235\147\156 \236\160\149\235\179\180\234\176\128 \236\151\134\236\138\181\235\139\136\235\139\164!! : InputMLUp_ClanRenew_LeaveClan")
    return
  end
  local messageboxData
  if true == getSelfPlayer():get():isGuildMaster() then
    if myGuildInfo:getMemberCount() <= 1 then
      messageboxData = {
        title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_DISPERSE_CLAN"),
        content = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_DISPERSE_CLAN_ASK"),
        functionYes = _ClanList_LeaveClanContinue,
        functionNo = MessageBox_Empty_function,
        priority = CppEnums.PA_UI_CONTROL_TYPE.PAUIMB_PRIORITY_LOW
      }
      MessageBox.showMessageBox(messageboxData)
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_CANT_CLAN_DISPERSE"))
    end
  else
    local tempText = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_CLANLIST_CLANOUT_ASK")
    messageboxData = {
      title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_WITHDRAW_CLAN"),
      content = tempText,
      functionYes = _ClanList_DisJoinContinue,
      functionNo = MessageBox_Empty_function,
      priority = CppEnums.PA_UI_CONTROL_TYPE.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageboxData)
  end
end
function _ClanList_LeaveClanContinue()
  FGlobal_ClanList_Close()
  ToClient_RequestDestroyGuild()
end
function _ClanList_DisJoinContinue()
  FGlobal_ClanList_Close()
  ToClient_RequestDisjoinGuild()
end
function InputMO_ClanRenew_ShowKeyGuide(isShow)
  local self = ClanRenew
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ClanRenew")
    return
  end
  self._ui.btn_AConsoleUI:SetShow(isShow)
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_ClanRenew_Init")
