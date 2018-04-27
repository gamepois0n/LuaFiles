-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\guild\panel_guild_invitationguildalliance.luac 

-- params : ...
-- function num : 0
local PaGlobal_Guild_InvitationGuildAlliance = {
_ui = {button_Confirm = (UI.getChildControl)(Panel_GuildAlliance_Invitation, "Button_Confirm"), button_Refuse = (UI.getChildControl)(Panel_GuildAlliance_Invitation, "Button_Refuse"), content = (UI.getChildControl)(Panel_GuildAlliance_Invitation, "StaticText_AgreementContent"), contentTitle = (UI.getChildControl)(Panel_GuildAlliance_Invitation, "StaticText_AgreementContentTitle"), from = (UI.getChildControl)(Panel_GuildAlliance_Invitation, "StaticText_From"), allianceInfo_BG = (UI.getChildControl)(Panel_GuildAlliance_Invitation, "Static_AllianceInfo_BG"), guildMark_Wax = (UI.getChildControl)(Panel_GuildAlliance_Invitation, "Static_Wax"), guildMark = (UI.getChildControl)(Panel_GuildAlliance_Invitation, "Static_GuildMark"), frame = (UI.getChildControl)(Panel_GuildAlliance_Invitation, "Frame_1"), frame2 = (UI.getChildControl)(Panel_GuildAlliance_Invitation, "Frame_2")}
, 
_listConfig = {startX = 0, startY = -5, gapY = 26, sizeY = 100}
}
OpenGuildAllianceInvitation = function()
  -- function num : 0_0 , upvalues : PaGlobal_Guild_InvitationGuildAlliance
  PaGlobal_Guild_InvitationGuildAlliance:initialize()
  Panel_GuildAlliance_Invitation:SetShow(true)
end

PaGlobal_Guild_InvitationGuildAlliance.initialize = function(self)
  -- function num : 0_1 , upvalues : PaGlobal_Guild_InvitationGuildAlliance
  local _allianceName = tostring(ToClient_getJoinAllianceName())
  local _guildName = {}
  local _tax = {}
  local _limitCount = {}
  local _count = ToClient_getJoinAllianceGuildCount() - 1
  for ii = 0, _count do
    _guildName[ii] = tostring(ToClient_getJoinAllianceGuildName(ii))
    _tax[ii] = ToClient_getJoinAllianceGuildPercent(ii)
    _limitCount[ii] = ToClient_getJoinAllianceGuildLimitCount(ii)
  end
  ;
  ((self._ui).content):SetAutoResize(true)
  ;
  ((self._ui).content):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui).frame_Summary):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui).frame_Summary):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GUILDALLIANCE_RULES"))
  ;
  ((self._ui).frame_Content):SetSize(((self._ui).frame_Content):GetSizeX(), ((self._ui).frame_Summary):GetTextSizeY())
  ;
  ((self._ui).frame2_Content):SetSize(((self._ui).frame2_Content):GetSizeX(), (self._listConfig).sizeY)
  PaGlobal_Guild_InvitationGuildAlliance:SetPosition()
  ;
  ((self._ui).frame):UpdateContentPos()
  if ((self._ui).frame_Content):GetSizeY() < ((self._ui).frame):GetSizeY() then
    (((self._ui).frame):GetVScroll()):SetShow(false)
  else
    ;
    (((self._ui).frame):GetVScroll()):SetShow(true)
  end
  for ii = 0, 9 do
    -- DECOMPILER ERROR at PC128: Confused about usage of register: R10 in 'UnsetPending'

    ((self._ui).guildName)[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, (self._ui).frame2_List, "StaticText_InvitiationGuildName" .. ii)
    CopyBaseProperty((self._ui).guildNameTemplete, ((self._ui).guildName)[ii])
    ;
    (((self._ui).guildName)[ii]):SetPosX((self._listConfig).startX + 60)
    ;
    (((self._ui).guildName)[ii]):SetPosY((self._listConfig).startY + (self._listConfig).gapY * ii)
    ;
    (((self._ui).guildName)[ii]):SetShow(false)
    -- DECOMPILER ERROR at PC174: Confused about usage of register: R10 in 'UnsetPending'

    ;
    ((self._ui).guildLimitMemberCount)[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, (self._ui).frame2_List, "StaticText_InvitiationGuildLimitMemberCount" .. ii)
    CopyBaseProperty((self._ui).guildLimitMemberTemplete, ((self._ui).guildLimitMemberCount)[ii])
    ;
    (((self._ui).guildLimitMemberCount)[ii]):SetPosX((self._listConfig).startX + 196)
    ;
    (((self._ui).guildLimitMemberCount)[ii]):SetPosY((self._listConfig).startY + (self._listConfig).gapY * ii)
    ;
    (((self._ui).guildLimitMemberCount)[ii]):SetShow(false)
    -- DECOMPILER ERROR at PC220: Confused about usage of register: R10 in 'UnsetPending'

    ;
    ((self._ui).guildtaxRate)[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, (self._ui).frame2_List, "StaticText_InvitiationGuildTaxRate" .. ii)
    CopyBaseProperty((self._ui).taxConstRateTemplete, ((self._ui).guildtaxRate)[ii])
    ;
    (((self._ui).guildtaxRate)[ii]):SetPosX((self._listConfig).startX + 280)
    ;
    (((self._ui).guildtaxRate)[ii]):SetPosY((self._listConfig).startY + (self._listConfig).gapY * ii)
    ;
    (((self._ui).guildtaxRate)[ii]):SetShow(false)
  end
  ;
  ((self._ui).contentTitle):SetText("[" .. _allianceName .. "] " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GUILDALLIANCE_COTRACT_TITLE"))
  for ii = 0, _count do
    (((self._ui).guildName)[ii]):SetText(_guildName[ii])
    ;
    (((self._ui).guildName)[ii]):SetShow(true)
    ;
    (((self._ui).guildLimitMemberCount)[ii]):SetText("" .. _limitCount[ii] .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCEINFO_INFO_MEMBERCOUNT_TEXT"))
    ;
    (((self._ui).guildLimitMemberCount)[ii]):SetShow(true)
    ;
    (((self._ui).guildtaxRate)[ii]):SetText("" .. _tax[ii] .. "%")
    ;
    (((self._ui).guildtaxRate)[ii]):SetShow(true)
  end
  local _list_SizeY = (self._listConfig).gapY * _count - 6
  self:SetPosition()
  ;
  ((self._ui).frame2):UpdateContentPos()
  ;
  (((self._ui).frame2):GetVScroll()):ControlButtonUp()
  ;
  ((self._ui).frame2_Content):SetSize(((self._ui).frame2_Content):GetSizeX(), _list_SizeY)
  if _list_SizeY <= ((self._ui).frame2):GetSizeY() then
    (((self._ui).frame2):GetVScroll()):SetShow(false)
  else
    ;
    (((self._ui).frame2):GetVScroll()):SetShow(true)
  end
  ;
  ((self._ui).guildMark):SetShow(false)
  ;
  ((self._ui).from):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCE_LEADER_NAME") .. _guildName[0])
  ;
  ((self._ui).button_Confirm):addInputEvent("Mouse_LUp", "guildAlliance_accept()")
  ;
  ((self._ui).button_Refuse):addInputEvent("Mouse_LUp", "guildAlliance_refuse()")
end

PaGlobal_Guild_InvitationGuildAlliance.update = function(self)
  -- function num : 0_2
end

PaGlobal_Guild_InvitationGuildAlliance.SetPosition = function(self)
  -- function num : 0_3
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_GuildAlliance_Invitation:GetSizeX()
  local panelSizeY = Panel_GuildAlliance_Invitation:GetSizeY()
  Panel_GuildAlliance_Invitation:SetPosX(scrSizeX / 2 - panelSizeX / 2)
  Panel_GuildAlliance_Invitation:SetPosY(scrSizeY / 2 - panelSizeY / 2)
end

FGlobal_AgreementGuild_Close = function()
  -- function num : 0_4
  if not Panel_AgreementGuild:GetShow() then
    return 
  end
  Panel_AgreementGuild:SetShow(false, false)
  ClearFocusEdit()
  CheckChattingInput()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Panel_GuildAlliance_Invitation")
registerEvent("ResponseGuildAlliance_invite", "FromClient_ResponseGuildAlliance_invite")
FromClient_luaLoadComplete_Panel_GuildAlliance_Invitation = function()
  -- function num : 0_5 , upvalues : PaGlobal_Guild_InvitationGuildAlliance
  local self = PaGlobal_Guild_InvitationGuildAlliance
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).guildNameTemplete = (UI.getChildControl)((self._ui).allianceInfo_BG, "StaticText_GuildNameTemplete")
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).guildLimitMemberTemplete = (UI.getChildControl)((self._ui).allianceInfo_BG, "Static_GuildLimitMemberTemplete")
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).taxConstRateTemplete = (UI.getChildControl)((self._ui).allianceInfo_BG, "StaticText_TaxConstRateTemplete")
  ;
  ((self._ui).guildNameTemplete):SetShow(false)
  ;
  ((self._ui).guildLimitMemberTemplete):SetShow(false)
  ;
  ((self._ui).taxConstRateTemplete):SetShow(false)
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).frame_Content = (UI.getChildControl)((self._ui).frame, "Frame_1_Content")
  -- DECOMPILER ERROR at PC55: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).frame2_Content = (UI.getChildControl)((self._ui).frame2, "Frame_2_Content")
  -- DECOMPILER ERROR at PC63: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).frame_Summary = (UI.getChildControl)((self._ui).frame_Content, "StaticText_1")
  -- DECOMPILER ERROR at PC71: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).frame2_List = (UI.getChildControl)((self._ui).frame2_Content, "Static_List")
  -- DECOMPILER ERROR at PC79: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).leaderCheck = (UI.getChildControl)((self._ui).frame2_List, "RadioButton_LeaderCheck")
  ;
  ((self._ui).leaderCheck):SetCheck(true)
  -- DECOMPILER ERROR at PC87: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).guildName = {}
  -- DECOMPILER ERROR at PC90: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).guildLimitMemberCount = {}
  -- DECOMPILER ERROR at PC93: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).guildtaxRate = {}
end

FromClient_ResponseGuildAlliance_invite = function(hostName)
  -- function num : 0_6
  OpenGuildAllianceInvitation()
end

guildAlliance_accept = function()
  -- function num : 0_7
  ToClient_sendJoinGuildAlliance(true)
  Panel_GuildAlliance_Invitation:SetShow(false)
end

guildAlliance_refuse = function()
  -- function num : 0_8
  ToClient_sendJoinGuildAlliance(false)
  Panel_GuildAlliance_Invitation:SetShow(false)
end


