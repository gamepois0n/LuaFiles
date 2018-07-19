local _panel = Panel_Console_Dialog_GuildPopup
local GuildPopup = {
  _ui = {
    stc_Create_Guild = UI.getChildControl(_panel, "Static_Create_Guild")
  },
  _selectBtnIdx = {clan = 1, guild = 2},
  _currentBtn = nil
}
function GuildPopup:init()
  self._ui.txt_Title = UI.getChildControl(self._ui.stc_Create_Guild, "StaticText_Title")
  self._ui.stc_Main = UI.getChildControl(self._ui.stc_Create_Guild, "Static_Main")
  self._ui.btn_ClanMark = UI.getChildControl(self._ui.stc_Main, "RadioButton_Clan_Mark")
  self._ui.btn_ClanMark:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CREATECLAN_GUIDETITLE_CLAN"))
  self._ui.btn_GuildMark = UI.getChildControl(self._ui.stc_Main, "RadioButton_Guild_Mark")
  self._ui.btn_GuildMark:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CREATECLAN_GUIDETITLE_GUILD"))
  self._ui.txt_Tip = UI.getChildControl(self._ui.stc_Main, "StaticText_Tip")
  self._ui.txt_Tip:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  self._ui.txt_Tip:SetText(" ")
  self._ui.stc_BottomBg = UI.getChildControl(self._ui.stc_Create_Guild, "Static_BottomBg")
  self._ui.txt_Apply = UI.getChildControl(self._ui.stc_BottomBg, "StaticText_Apply")
  self:registEventHandler()
end
function GuildPopup:open()
  self:update()
  Panel_Console_Dialog_GuildPopup:SetShow(true)
end
function GuildPopup:close()
  Panel_Console_Dialog_GuildPopup:SetShow(false)
  ClearFocusEdit()
end
function GuildPopup:update()
  self._ui.btn_ClanMark:SetCheck(false)
  self._ui.btn_ClanMark:SetMonoTone(false)
  self._ui.btn_ClanMark:SetEnable(true)
  self._ui.btn_GuildMark:SetCheck(false)
  self._ui.btn_GuildMark:SetMonoTone(false)
  self._ui.btn_GuildMark:SetEnable(true)
  if false == ToClient_CanMakeGuild() then
    self._ui.btn_GuildMark:SetEnable(false)
    self._ui.btn_GuildMark:SetMonoTone(true)
  end
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if nil ~= myGuildListInfo then
    local guildGrade = myGuildListInfo:getGuildGrade()
    local isGuildMaster = getSelfPlayer():get():isGuildMaster()
    if 0 ~= guildGrade then
      self._ui.btn_ClanMark:SetMonoTone(true)
      self._ui.btn_ClanMark:SetEnable(false)
      self._ui.btn_GuildMark:SetMonoTone(true)
      self._ui.btn_GuildMark:SetEnable(false)
    elseif true == isGuildMaster then
      self._ui.btn_ClanMark:SetCheck(false)
      self._ui.btn_ClanMark:SetMonoTone(true)
      self._ui.btn_ClanMark:SetEnable(false)
      self._ui.btn_GuildMark:SetCheck(true)
      self._ui.btn_GuildMark:SetMonoTone(false)
      self._ui.btn_GuildMark:SetEnable(true)
    else
      self._ui.btn_ClanMark:SetCheck(true)
      self._ui.btn_ClanMark:SetMonoTone(false)
      self._ui.btn_ClanMark:SetEnable(true)
      self._ui.btn_GuildMark:SetCheck(false)
      self._ui.btn_GuildMark:SetMonoTone(false)
      self._ui.btn_GuildMark:SetEnable(true)
    end
  end
  local desc
  if true == self._ui.btn_ClanMark:IsCheck() then
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_CREATECLAN_GUIDEDESC_CLAN")
  elseif true == self._ui.btn_GuildMark:IsCheck() then
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_CREATECLAN_GUIDEDESC_GUILD")
  else
    desc = ""
  end
  self._currentBtn = nil
  self._ui.txt_Tip:SetText(desc)
end
function GuildPopup:registEventHandler()
  self._ui.btn_ClanMark:addInputEvent("Mouse_LUp", "InputMLUp_GuildPopup_SelectBtn(" .. self._selectBtnIdx.clan .. ")")
  self._ui.btn_ClanMark:addInputEvent("Mouse_On", "InputMO_GuildPopup_SetKeyguide(" .. self._selectBtnIdx.clan .. ")")
  self._ui.btn_GuildMark:addInputEvent("Mouse_LUp", "InputMLUp_GuildPopup_SelectBtn(" .. self._selectBtnIdx.guild .. ")")
  self._ui.btn_GuildMark:addInputEvent("Mouse_On", "InputMO_GuildPopup_SetKeyguide(" .. self._selectBtnIdx.guild .. ")")
  self._ui.txt_Apply:addInputEvent("Mouse_LUp", "InputMLUp_GuildPopup_Confirm()")
end
function PaGlobalFunc_GuildPopup_Open()
  self = GuildPopup
  self:open()
end
function PaGlobalFunc_GuildPopup_Close()
  self = GuildPopup
  self:close()
end
function InputMLUp_GuildPopup_SelectBtn(btnIdx)
  self = GuildPopup
  if self._currentBtn == btnIdx then
    InputMLUp_GuildPopup_Confirm()
    return
  end
  if btnIdx == self._selectBtnIdx.clan then
    self._ui.txt_Tip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CREATECLAN_GUIDEDESC_CLAN"))
  elseif btnIdx == self._selectBtnIdx.guild then
    self._ui.txt_Tip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CREATECLAN_GUIDEDESC_GUILD"))
  end
  self._currentBtn = btnIdx
  InputMO_GuildPopup_SetKeyguide(btnIdx)
end
function InputMO_GuildPopup_SetKeyguide(btnIdx)
  self = GuildPopup
  if self._currentBtn == btnIdx then
    self._ui.txt_Apply:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_LOBBY_CREATE"))
  else
    self._ui.txt_Apply:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_STABLE_EXCHANGE_SELECT"))
  end
end
function InputMLUp_GuildPopup_Confirm()
  self = GuildPopup
  if self._currentBtn == self._selectBtnIdx.clan then
  elseif self._currentBtn == self._selectBtnIdx.guild then
    if getSelfPlayer():get():getLevel() < 1 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_POPUP_NOLEVEL_ACK"))
      return
    end
    PaGlobalFunc_GuildCreate_Open()
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_POPUP_CLANORGUILD_SELECT_ACK"))
  end
end
function FromClient_luaLoadComplete_GuildPopup_Init()
  self = GuildPopup
  self:init()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_GuildPopup_Init")
