-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\guild\panel_guild_allianceinfo.luac 

-- params : ...
-- function num : 0
PaGlobal_Guild_AllianceInfo = {
_mainUi = {allianceInviteBg = (UI.getChildControl)(Panel_Guild_AllianceInfo, "Static_Frame_AllianceInviteBG"), allianceInfoBg = (UI.getChildControl)(Panel_Guild_AllianceInfo, "Static_Frame_AllianceInfoBG"), frame2 = (UI.getChildControl)(Panel_Guild_AllianceInfo, "Frame_2")}
, 
_inviteListConfig = {createCount = 0, startX = 0, startY = 8, gapY = 40, listSizeY = 0}
, 
_inviteUi = {}
, _allianceName = "", _leaderDefaultMemeberCount = 0, _selectedGuildIndex = 0, _createdCount = 0, _minLimitMemberCount = 10, _maxLimitMemberCount = 0, 
_allianceMemberName = {}
, 
_guildLimitMemeberCount = {}
, 
_taxConstRate = {}
, _currentTotalLimitMember = 0, _currentTotalTaxConst = 0, _isInvited = false, 
_taxRate_Default = {[0] = 0, [1] = 100, [2] = 20, [3] = 15, [4] = 15, [5] = 15, [6] = 14, [7] = 12, [8] = 11, [9] = 10, [10] = 10}
, defaultFrameBG_Alliance = nil}
-- DECOMPILER ERROR at PC62: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.OpenGuildAlliance = function(self)
  -- function num : 0_0
  local guildAlliance = ToClient_GetMyGuildAllianceWrapper()
  local _isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  local _isGuildAllianceMember = ((getSelfPlayer()):get()):isGuildAllianceMember()
  self:InviteInitialize()
  self:InfoInitialize()
  self:gulidalliance_CautionInitialize()
  if _isGuildAllianceMember ~= true then
    if _isGuildMaster == true then
      if guildAlliance == nil then
        self:Alliance_AllInputInitialize()
        ;
        ((self._mainUi).allianceInviteBg):SetShow(true)
        ;
        ((self._mainUi).allianceInfoBg):SetShow(false)
      else
        ;
        ((self._mainUi).allianceInviteBg):SetShow(false)
        ;
        ((self._mainUi).allianceInfoBg):SetShow(true)
      end
    else
      ;
      ((self._mainUi).allianceInfoBg):SetShow(false)
      ;
      ((self._mainUi).allianceInviteBg):SetShow(false)
    end
  else
    ;
    ((self._mainUi).allianceInviteBg):SetShow(false)
    ;
    ((self._mainUi).allianceInfoBg):SetShow(true)
  end
  if self._allianceName ~= nil then
    self._allianceName = ""
  end
end

-- DECOMPILER ERROR at PC65: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.InviteInitialize = function(self)
  -- function num : 0_1
  self._inviteUi = {}
  self._inviteUi = {edit_AllianceName = (UI.getChildControl)((self._mainUi).allianceInviteBg, "Edit_AllianceName"), button_AllianceName = (UI.getChildControl)((self._mainUi).allianceInviteBg, "Button_AllianceName"), button_AddAlliances = (UI.getChildControl)((self._mainUi).allianceInviteBg, "Button_AddAlliances"), guild_ListBg = (UI.getChildControl)((self._mainUi).allianceInviteBg, "Static_AddGuildListBG"), total_InfoUi = (UI.getChildControl)((self._mainUi).allianceInviteBg, "StaticText_Total_Info"), button_Invite = (UI.getChildControl)((self._mainUi).allianceInviteBg, "Button_Invite"), button_Initialize = (UI.getChildControl)((self._mainUi).allianceInviteBg, "Button_Initialize"), button_Cancel_Invite = (UI.getChildControl)((self._mainUi).allianceInviteBg, "Button_Cancel_Invite"), text_Wait = (UI.getChildControl)((self._mainUi).allianceInviteBg, "StaticText_Wait"), addGuildTitle = (UI.getChildControl)((self._mainUi).allianceInviteBg, "StaticText_AddGuildName"), frame = (UI.getChildControl)((self._mainUi).allianceInviteBg, "Frame_1")}
  -- DECOMPILER ERROR at PC83: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._inviteUi).guildList = {}
  -- DECOMPILER ERROR at PC121: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._inviteUi).guildList = {guild_TitleListBg = (UI.getChildControl)((self._inviteUi).guild_ListBg, "Static_Name_ListBG"), guildNameTemplete = (UI.getChildControl)((self._inviteUi).guild_ListBg, "Static_GuildNameTemplete"), guildMemberCountTemplete = (UI.getChildControl)((self._inviteUi).guild_ListBg, "Static_GuildMemberTemplete"), taxConstRateTemplete = (UI.getChildControl)((self._inviteUi).guild_ListBg, "Static_TaxConstRateTemplete"), button_DeleteGuild = (UI.getChildControl)((self._inviteUi).guild_ListBg, "Button_DeleteGuild")}
  -- DECOMPILER ERROR at PC131: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._inviteUi).guildList).limitGuildCountUi = (UI.getChildControl)(((self._inviteUi).guildList).guild_TitleListBg, "StaticText_GuildMemberCountName")
  -- DECOMPILER ERROR at PC141: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._inviteUi).guildList).limitTaxConstUi = (UI.getChildControl)(((self._inviteUi).guildList).guild_TitleListBg, "StaticText_TaxConstName")
  -- DECOMPILER ERROR at PC144: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._inviteUi).inputUi = {}
  -- DECOMPILER ERROR at PC159: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._inviteUi).inputUi = {
listNo = {}
, 
guildNameUi = {}
, 
button_confirmGuildNameUi = {}
, 
guildMemeberCountUi = {}
, 
taxConstRateUi = {}
, 
button_DeleteGuild = {}
}
  ;
  ((self._inviteUi).button_AllianceName):SetShow(false)
  -- DECOMPILER ERROR at PC172: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._inviteUi).frame1_Content = (UI.getChildControl)((self._inviteUi).frame, "Frame_1_Content")
  -- DECOMPILER ERROR at PC180: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._inviteUi).frame1_List = (UI.getChildControl)((self._inviteUi).frame1_Content, "Static_List")
  -- DECOMPILER ERROR at PC189: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._inviteUi).guildList).leaderNameUi = (UI.getChildControl)((self._inviteUi).frame1_List, "StaticText_LeaderName")
  -- DECOMPILER ERROR at PC198: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._inviteUi).guildList).leaderMemberCountUi = (UI.getChildControl)((self._inviteUi).frame1_List, "StaticText_LeaderMemberCount")
  -- DECOMPILER ERROR at PC207: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._inviteUi).guildList).leaderTaxConstCountUi = (UI.getChildControl)((self._inviteUi).frame1_List, "StaticText_LeaderTaxConstCount")
  for ii = 1, 9 do
    -- DECOMPILER ERROR at PC215: Confused about usage of register: R5 in 'UnsetPending'

    (((self._inviteUi).inputUi).listNo)[ii] = ii
    -- DECOMPILER ERROR at PC217: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._allianceMemberName)[ii] = ""
    -- DECOMPILER ERROR at PC219: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._guildLimitMemeberCount)[ii] = 10
    -- DECOMPILER ERROR at PC221: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._taxConstRate)[ii] = 0
  end
  local _guildWrapper = ToClient_GetMyGuildInfoWrapper()
  if _guildWrapper == nil then
    return 
  end
  -- DECOMPILER ERROR at PC231: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._allianceMemberName)[0] = _guildWrapper:getName()
  -- DECOMPILER ERROR at PC233: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._guildLimitMemeberCount)[0] = 10
  self._leaderDefaultMemeberCount = (self._guildLimitMemeberCount)[0]
  -- DECOMPILER ERROR at PC238: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._taxConstRate)[0] = 100
  ;
  (((self._inviteUi).guildList).leaderNameUi):SetText((self._allianceMemberName)[0])
  ;
  (((self._inviteUi).guildList).leaderMemberCountUi):SetText((self._guildLimitMemeberCount)[0] .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCEINFO_INFO_MEMBERCOUNT_TEXT"))
  ;
  (((self._inviteUi).guildList).leaderTaxConstCountUi):SetText((self._taxConstRate)[0] .. "%")
  ;
  (((self._inviteUi).guildList).leaderMemberCountUi):addInputEvent("Mouse_LUp", "PaGlobal_Guild_AllianceInfo:GuildLimitMemberCheck(0)")
  ;
  (((self._inviteUi).guildList).leaderTaxConstCountUi):addInputEvent("Mouse_LUp", "PaGlobal_Guild_AllianceInfo:taxConstCheck(0)")
  ;
  (((self._inviteUi).guildList).button_DeleteGuild):addInputEvent("Mouse_LUp", "PaGlobal_Guild_AllianceInfo:deleteGuildInput()")
  ;
  ((self._inviteUi).button_AddAlliances):addInputEvent("Mouse_LUp", "PaGlobal_Guild_AllianceInfo:OpenAllianceList()")
  ;
  ((self._inviteUi).button_AddAlliances):addInputEvent("Mouse_On", "PaGlobal_Guild_AllianceInfo:AllianceTooltips(true, 10)")
  ;
  ((self._inviteUi).button_AddAlliances):addInputEvent("Mouse_Out", "PaGlobal_Guild_AllianceInfo:AllianceTooltips(false)")
  ;
  ((self._inviteUi).button_AddAlliances):SetPosX(((self._inviteUi).addGuildTitle):GetTextSizeX() + 30)
  ;
  ((self._inviteUi).button_Invite):addInputEvent("Mouse_LUp", "PaGlobal_Guild_AllianceInfo:HandleClickedButtonConfirm()")
  ;
  ((self._inviteUi).button_Initialize):addInputEvent("Mouse_LUp", "PaGlobal_Guild_AllianceInfo:Alliance_AllInputInitialize()")
  ;
  ((self._inviteUi).button_Cancel_Invite):addInputEvent("Mouse_LUp", "PaGlobal_Guild_AllianceInfo:confirm_CancelInvite()")
  ;
  (((self._inviteUi).guildList).guildNameTemplete):SetShow(false)
  ;
  (((self._inviteUi).guildList).guildMemberCountTemplete):SetShow(false)
  ;
  (((self._inviteUi).guildList).taxConstRateTemplete):SetShow(false)
  ;
  (((self._inviteUi).guildList).button_DeleteGuild):SetShow(false)
  ;
  ((self._inviteUi).text_Wait):SetShow(false)
  self:InviteListCreate()
  self:totalGuildLimitMemberCheck()
  self:AllianceName_Init()
  self._createdCount = 0
  self:totalInfo()
end

-- DECOMPILER ERROR at PC68: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.InviteListCreate = function(self)
  -- function num : 0_2
  (((self._inviteUi).frame):GetVScroll()):SetShow(false)
  local plusSizeX = 0
  for ii = 1, 9 do
    if ii % 2 == 1 then
      plusSizeX = 348
    else
      plusSizeX = 0
    end
    -- DECOMPILER ERROR at PC32: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (((self._inviteUi).inputUi).guildNameUi)[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_EDIT, (self._inviteUi).frame1_List, "StaticText_GuildName" .. ii)
    CopyBaseProperty(((self._inviteUi).guildList).guildNameTemplete, (((self._inviteUi).inputUi).guildNameUi)[ii])
    ;
    ((((self._inviteUi).inputUi).guildNameUi)[ii]):SetPosX(10 + plusSizeX)
    ;
    ((((self._inviteUi).inputUi).guildNameUi)[ii]):SetPosY((self._inviteListConfig).startY + (self._inviteListConfig).gapY * (math.floor)(ii / 2))
    ;
    ((((self._inviteUi).inputUi).guildNameUi)[ii]):SetMaxInput(10)
    ;
    ((((self._inviteUi).inputUi).guildNameUi)[ii]):addInputEvent("Mouse_LUp", "PaGlobal_Guild_AllianceInfo:HandleClicked_AllianceGulildNameEditSetFocus(" .. (((self._inviteUi).inputUi).listNo)[ii] .. ")")
    ;
    ((((self._inviteUi).inputUi).guildNameUi)[ii]):RegistReturnKeyEvent("PaGlobal_Guild_AllianceInfo:AllianceMemberName_Regist(" .. (((self._inviteUi).inputUi).listNo)[ii] .. ")")
    ;
    ((((self._inviteUi).inputUi).guildNameUi)[ii]):SetText((self._allianceMemberName)[ii])
    ;
    ((((self._inviteUi).inputUi).guildNameUi)[ii]):SetEditText("")
    ;
    ((((self._inviteUi).inputUi).guildNameUi)[ii]):SetText(ii)
    ;
    ((((self._inviteUi).inputUi).guildNameUi)[ii]):SetShow(false)
    -- DECOMPILER ERROR at PC142: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (((self._inviteUi).inputUi).guildMemeberCountUi)[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, (self._inviteUi).frame1_List, "StaticText_GuildMemberCount" .. ii)
    CopyBaseProperty(((self._inviteUi).guildList).guildMemberCountTemplete, (((self._inviteUi).inputUi).guildMemeberCountUi)[ii])
    ;
    ((((self._inviteUi).inputUi).guildMemeberCountUi)[ii]):SetPosX(190 + plusSizeX)
    ;
    ((((self._inviteUi).inputUi).guildMemeberCountUi)[ii]):SetPosY((self._inviteListConfig).startY + (self._inviteListConfig).gapY * (math.floor)(ii / 2))
    ;
    ((((self._inviteUi).inputUi).guildMemeberCountUi)[ii]):addInputEvent("Mouse_LUp", "PaGlobal_Guild_AllianceInfo:GuildLimitMemberCheck(" .. (((self._inviteUi).inputUi).listNo)[ii] .. ")")
    ;
    ((((self._inviteUi).inputUi).guildMemeberCountUi)[ii]):SetShow(false)
    -- DECOMPILER ERROR at PC210: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (((self._inviteUi).inputUi).taxConstRateUi)[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, (self._inviteUi).frame1_List, "StaticText_TaxConstRate" .. ii)
    CopyBaseProperty(((self._inviteUi).guildList).taxConstRateTemplete, (((self._inviteUi).inputUi).taxConstRateUi)[ii])
    ;
    ((((self._inviteUi).inputUi).taxConstRateUi)[ii]):SetPosX(270 + plusSizeX)
    ;
    ((((self._inviteUi).inputUi).taxConstRateUi)[ii]):SetPosY((self._inviteListConfig).startY + (self._inviteListConfig).gapY * (math.floor)(ii / 2))
    ;
    ((((self._inviteUi).inputUi).taxConstRateUi)[ii]):addInputEvent("Mouse_LUp", "PaGlobal_Guild_AllianceInfo:taxConstCheck(" .. (((self._inviteUi).inputUi).listNo)[ii] .. ")")
    ;
    ((((self._inviteUi).inputUi).taxConstRateUi)[ii]):SetShow(false)
  end
  -- DECOMPILER ERROR at PC271: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (((self._inviteUi).inputUi).taxConstRateUi)[0] = ((self._inviteUi).guildList).leaderTaxConstCountUi
  ;
  (((self._inviteUi).frame):GetVScroll()):SetShow(false)
end

-- DECOMPILER ERROR at PC71: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.gulidalliance_CautionInitialize = function(self)
  -- function num : 0_3
  self.gulidalliance_Caution = (UI.getChildControl)(((self._mainUi).frame2):GetFrameContent(), "StaticText_GuildAlliance_Caution")
  ;
  (((self._mainUi).frame2):GetVScroll()):SetShow(false)
  ;
  (self.gulidalliance_Caution):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (((self._mainUi).frame2):GetVScroll()):ControlButtonUp()
  ;
  ((self._mainUi).frame2):UpdateContentPos()
  ;
  (((self._mainUi).frame2):GetFrameContent()):SetSize((((self._mainUi).frame2):GetFrameContent()):GetSizeX(), (self.gulidalliance_Caution):GetTextSizeY())
  ;
  (self.gulidalliance_Caution):SetText((self.gulidalliance_Caution):GetText())
  local _contentSizeY = (self.gulidalliance_Caution):GetTextSizeY()
  local _limitSize = (((self._mainUi).frame2):GetFrameContent()):GetSizeY()
  if _limitSize < _contentSizeY then
    (((self._mainUi).frame2):GetVScroll()):SetShow(true)
  end
end

-- DECOMPILER ERROR at PC74: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.AllianceName_Init = function(self)
  -- function num : 0_4
  ((self._inviteUi).edit_AllianceName):SetEditText("")
  ;
  ((self._inviteUi).edit_AllianceName):SetMaxInput(10)
  ;
  ((self._inviteUi).edit_AllianceName):addInputEvent("Mouse_LUp", "PaGlobal_Guild_AllianceInfo:HandleClicked_AllianceNameEditSetFocus()")
  ;
  ((self._inviteUi).edit_AllianceName):RegistReturnKeyEvent("PaGlobal_Guild_AllianceInfo:AllianceName_Regist()")
  ;
  ((self._inviteUi).edit_AllianceName):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GUILDALLIANCEINFO_ALLIANCENAMETIP_TEXT"))
end

-- DECOMPILER ERROR at PC77: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.AllianceTooltips = function(self, isShow, tipType)
  -- function num : 0_5
  local name, desc, control = nil, nil, nil
  name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCE_ADDALLIANCETIP_TITLE")
  desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCE_ADDALLIANCETIP_INFO")
  control = (self._inviteUi).button_AllianceName
  if isShow == true then
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

-- DECOMPILER ERROR at PC80: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.HandleClicked_AllianceNameEditSetFocus = function(self)
  -- function num : 0_6
  if self._allianceName == "" then
    ((self._inviteUi).edit_AllianceName):SetEditText("")
  else
    SetFocusEdit((self._inviteUi).edit_AllianceName)
  end
end

-- DECOMPILER ERROR at PC83: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.AllianceName_Regist = function(self)
  -- function num : 0_7
  ClearFocusEdit()
end

-- DECOMPILER ERROR at PC86: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.ConfirmAllianceName = function(self)
  -- function num : 0_8
  ToClient_CreateGuildAlliance(allianceName)
end

-- DECOMPILER ERROR at PC89: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.addAllianceTooltips = function(self, isShow, tipType)
  -- function num : 0_9
  local name, desc, control = nil, nil, nil
  name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCE_ADDALLIANCETIP_TITLE")
  desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCE_ADDALLIANCETIP_INFO")
  control = (self._inviteUi).button_AllianceName
  if isShow == true then
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

-- DECOMPILER ERROR at PC92: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.OpenAllianceList = function(self)
  -- function num : 0_10
  if self._createdCount < 9 and self._createdCount >= 0 then
    Panel_NumberPad_Close()
    if self._currentTotalLimitMember >= 100 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCEINFO_WARNING_MAX_GUILDMEMBER_COUNT"))
    else
      self._createdCount = self._createdCount + 1
      self:taxConstDefaultCheck(self._createdCount)
      self:currentTaxConstCheck()
      ;
      ((((self._inviteUi).inputUi).guildNameUi)[self._createdCount]):SetTextHorizonCenter()
      ;
      ((((self._inviteUi).inputUi).guildNameUi)[self._createdCount]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCEINFO_INPUTMEMBERNAME_TEXT"))
      ;
      ((((self._inviteUi).inputUi).guildMemeberCountUi)[self._createdCount]):SetText((self._guildLimitMemeberCount)[self._createdCount] .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCEINFO_INFO_MEMBERCOUNT_TEXT"))
      ;
      ((((self._inviteUi).inputUi).guildNameUi)[self._createdCount]):SetShow(true)
      ;
      ((((self._inviteUi).inputUi).guildMemeberCountUi)[self._createdCount]):SetShow(true)
      ;
      ((((self._inviteUi).inputUi).taxConstRateUi)[self._createdCount]):SetShow(true)
      ;
      (((self._inviteUi).guildList).button_DeleteGuild):SetShow(true)
      ;
      ((self._inviteUi).button_Invite):SetShow(true)
      ;
      ((self._inviteUi).button_Initialize):SetShow(true)
      ;
      ((self._inviteUi).button_Cancel_Invite):SetShow(true)
    end
    self:InviteListSizeCheck()
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCEINFO_TOTALMEMEBEROVER_TEXT"))
  end
  self:totalGuildLimitMemberCheck()
end

-- DECOMPILER ERROR at PC95: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.InviteListSizeCheck = function(self)
  -- function num : 0_11
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._inviteListConfig).listSizeY = (self._createdCount + 1) * (self._inviteListConfig).gapY + 5
  if (self._inviteListConfig).listSizeY > 1000 then
    ((self._inviteUi).frame1_Content):SetSize(((self._inviteUi).frame1_Content):GetSizeX(), (self._inviteListConfig).listSizeY)
    ;
    ((self._inviteUi).frame):UpdateContentPos()
    ;
    (((self._inviteUi).frame):GetVScroll()):SetShow(true)
  else
    ;
    (((self._inviteUi).frame):GetVScroll()):SetShow(false)
  end
end

-- DECOMPILER ERROR at PC98: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.AllianceMemberName_Regist = function(self, index)
  -- function num : 0_12
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R2 in 'UnsetPending'

  (self._allianceMemberName)[index] = tostring(((((self._inviteUi).inputUi).guildNameUi)[index]):GetEditText())
  ClearFocusEdit()
end

-- DECOMPILER ERROR at PC101: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.HandleClicked_AllianceGulildNameEditSetFocus = function(self, index)
  -- function num : 0_13
  if (self._allianceMemberName)[index] ~= "" then
    ((((self._inviteUi).inputUi).guildNameUi)[index]):SetText((self._allianceMemberName)[index])
    ;
    ((((self._inviteUi).inputUi).guildNameUi)[index]):SetEditText((self._allianceMemberName)[index])
  else
    ;
    ((((self._inviteUi).inputUi).guildNameUi)[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCEINFO_INPUTMEMBERNAME_TEXT"))
    ;
    ((((self._inviteUi).inputUi).guildNameUi)[index]):SetEditText("")
  end
  ;
  ((((self._inviteUi).inputUi).guildNameUi)[index]):SetTextHorizonCenter()
  ;
  ((((self._inviteUi).inputUi).guildNameUi)[index]):SetEditText(((((self._inviteUi).inputUi).guildNameUi)[index]):GetEditText(), true)
end

-- DECOMPILER ERROR at PC104: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.totalGuildLimitMemberCheck = function(self)
  -- function num : 0_14
  self._currentTotalLimitMember = 0
  self._maxLimitMemberCount = toInt64(0, 0)
  for ii = 0, self._createdCount do
    self._currentTotalLimitMember = self._currentTotalLimitMember + (self._guildLimitMemeberCount)[ii]
  end
  self._maxLimitMemberCount = toInt64(0, 100 - self._currentTotalLimitMember + (self._guildLimitMemeberCount)[self._selectedGuildIndex])
  ;
  (((self._inviteUi).guildList).limitGuildCountUi):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GUILDALLIANCEINFO_GUILD_LIMIT_MEMBER_COUNT_TITLE_TEXT"))
  self:totalInfo()
end

-- DECOMPILER ERROR at PC107: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.GuildLimitMemberCheck = function(self, index)
  -- function num : 0_15
  self._selectedGuildIndex = index
  Panel_NumberPad_Close()
  self:totalGuildLimitMemberCheck()
  Panel_NumberPad_Show(true, self._maxLimitMemberCount, 0, guildAlliaceMemberChanged)
end

guildAlliaceMemberChanged = function(count)
  -- function num : 0_16
  local self = PaGlobal_Guild_AllianceInfo
  local _count = Int64toInt32(count)
  if _count < self._minLimitMemberCount then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCE_WARNING_MIN_LIMIT_GUILD_COUNT"))
    -- DECOMPILER ERROR at PC19: Confused about usage of register: R3 in 'UnsetPending'

    if self._selectedGuildIndex == 0 then
      (self._guildLimitMemeberCount)[0] = self._minLimitMemberCount
      ;
      (((self._inviteUi).guildList).leaderMemberCountUi):SetText((self._guildLimitMemeberCount)[0] .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCEINFO_INFO_MEMBERCOUNT_TEXT"))
    else
      -- DECOMPILER ERROR at PC37: Confused about usage of register: R3 in 'UnsetPending'

      ;
      (self._guildLimitMemeberCount)[self._selectedGuildIndex] = self._minLimitMemberCount
      ;
      ((((self._inviteUi).inputUi).guildMemeberCountUi)[self._selectedGuildIndex]):SetText((self._guildLimitMemeberCount)[self._selectedGuildIndex] .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCEINFO_INFO_MEMBERCOUNT_TEXT"))
    end
  else
    if self._selectedGuildIndex == 0 then
      if _count < self._leaderDefaultMemeberCount then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCEINFO_WARNING_GUILDMEMBER_COUNT"))
        -- DECOMPILER ERROR at PC70: Confused about usage of register: R3 in 'UnsetPending'

        ;
        (self._guildLimitMemeberCount)[0] = self._leaderDefaultMemeberCount
        ;
        (((self._inviteUi).guildList).leaderMemberCountUi):SetText((self._guildLimitMemeberCount)[0] .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCEINFO_INFO_MEMBERCOUNT_TEXT"))
      else
        -- DECOMPILER ERROR at PC86: Confused about usage of register: R3 in 'UnsetPending'

        ;
        (self._guildLimitMemeberCount)[0] = _count
        ;
        (((self._inviteUi).guildList).leaderMemberCountUi):SetText((self._guildLimitMemeberCount)[0] .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCEINFO_INFO_MEMBERCOUNT_TEXT"))
      end
    else
      -- DECOMPILER ERROR at PC103: Confused about usage of register: R3 in 'UnsetPending'

      ;
      (self._guildLimitMemeberCount)[self._selectedGuildIndex] = _count
      ;
      ((((self._inviteUi).inputUi).guildMemeberCountUi)[self._selectedGuildIndex]):SetText(_count .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCEINFO_INFO_MEMBERCOUNT_TEXT"))
    end
  end
  PaGlobal_Guild_AllianceInfo:totalGuildLimitMemberCheck()
  PaGlobal_Guild_AllianceInfo:totalInfo()
end

-- DECOMPILER ERROR at PC112: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.taxConstDefaultCheck = function(self, index)
  -- function num : 0_17
  for ii = 0, index do
    -- DECOMPILER ERROR at PC8: Confused about usage of register: R6 in 'UnsetPending'

    (self._taxConstRate)[ii] = (self._taxRate_Default)[index + 1]
  end
end

-- DECOMPILER ERROR at PC115: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.currentTaxConstCheck = function(self)
  -- function num : 0_18
  self._currentTotalTaxConst = 0
  for ii = 0, self._createdCount do
    self._currentTotalTaxConst = self._currentTotalTaxConst + (self._taxConstRate)[ii]
    ;
    ((((self._inviteUi).inputUi).taxConstRateUi)[ii]):SetText((self._taxConstRate)[ii] .. "%")
    ;
    (((self._inviteUi).guildList).limitTaxConstUi):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GUILDALLIANCEINFO_GUILD_TAX_CONST_TITLE_TEXT"))
    self:totalInfo()
  end
end

-- DECOMPILER ERROR at PC118: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.taxConstCheck = function(self, index)
  -- function num : 0_19
  self._selectedGuildIndex = index
  Panel_NumberPad_Close()
  PaGlobal_Guild_AllianceInfo:currentTaxConstCheck()
  local _taxconstMin = (self._taxRate_Default)[index + 1]
  local _maxTaxConst = toInt64(0, 100 - self._currentTotalTaxConst + (self._taxConstRate)[self._selectedGuildIndex])
  Panel_NumberPad_Show(true, _maxTaxConst, 0, taxConstChanged)
end

taxConstChanged = function(count)
  -- function num : 0_20
  local self = PaGlobal_Guild_AllianceInfo
  Panel_NumberPad_Close()
  local _count = Int64toInt32(count)
  if _count < (self._taxRate_Default)[self._createdCount + 1] then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCEINFO_WARNING_TAXCONST_MIN"))
    _count = (self._taxRate_Default)[self._createdCount + 1]
  end
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._taxConstRate)[self._selectedGuildIndex] = _count
  ;
  ((((self._inviteUi).inputUi).taxConstRateUi)[self._selectedGuildIndex]):SetText((self._taxConstRate)[self._selectedGuildIndex] .. "%")
  PaGlobal_Guild_AllianceInfo:currentTaxConstCheck()
  PaGlobal_Guild_AllianceInfo:totalInfo()
end

-- DECOMPILER ERROR at PC123: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.deleteGuildInput = function(self)
  -- function num : 0_21
  local uiEdit = GetFocusEdit()
  if uiEdit == nil then
    if self._isInvited == false then
      self:inputInitialize(self._createdCount)
      self._createdCount = self._createdCount - 1
      if self._createdCount <= 0 then
        self._createdCount = 0
        ;
        (((self._inviteUi).guildList).button_DeleteGuild):SetShow(false)
      end
      self:taxConstDefaultCheck(self._createdCount)
      self:totalGuildLimitMemberCheck()
      self:currentTaxConstCheck()
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCE_WARNING_DELETEBUTTON"))
    end
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCE_WARNING_DELETEBUTTON_INPUT"))
  end
end

-- DECOMPILER ERROR at PC126: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.inputInitialize = function(self, index)
  -- function num : 0_22
  if self._createdCount > 0 then
    ((((self._inviteUi).inputUi).guildNameUi)[index]):SetShow(false)
    ;
    ((((self._inviteUi).inputUi).guildMemeberCountUi)[index]):SetShow(false)
    ;
    ((((self._inviteUi).inputUi).taxConstRateUi)[index]):SetShow(false)
    ;
    ((((self._inviteUi).inputUi).guildNameUi)[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCEINFO_INPUTMEMBERNAME_TEXT"))
    -- DECOMPILER ERROR at PC36: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self._allianceMemberName)[index] = ""
    -- DECOMPILER ERROR at PC39: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self._guildLimitMemeberCount)[index] = self._minLimitMemberCount
    -- DECOMPILER ERROR at PC44: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self._taxConstRate)[index - 1] = (self._taxRate_Default)[index]
    for ii = 1, index do
      ((((self._inviteUi).inputUi).taxConstRateUi)[index]):SetText((self._taxConstRate)[index - 1] .. "%")
    end
  end
end

-- DECOMPILER ERROR at PC129: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.totalInfo = function(self)
  -- function num : 0_23
  local _info = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GUILDALLIANCEINFO_GUILD_LIMIT_MEMBER_COUNT_TITLE_TEXT") .. " (" .. self._currentTotalLimitMember .. "/100)  " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GUILDALLIANCEINFO_GUILD_TAX_CONST_TITLE_TEXT") .. " (" .. self._currentTotalTaxConst .. "/100)"
  ;
  ((self._inviteUi).total_InfoUi):SetText(_info)
end

-- DECOMPILER ERROR at PC132: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.HandleClickedButtonConfirm = function(self)
  -- function num : 0_24
  self._allianceName = tostring(((self._inviteUi).edit_AllianceName):GetEditText())
  for ii = 1, self._createdCount do
    -- DECOMPILER ERROR at PC20: Confused about usage of register: R5 in 'UnsetPending'

    (self._allianceMemberName)[ii] = tostring(((((self._inviteUi).inputUi).guildNameUi)[ii]):GetEditText())
  end
  local _isDone = 0
  for ii = 0, self._createdCount do
    if (self._allianceMemberName)[ii] ~= "" then
      _isDone = _isDone + 1
    end
  end
  if self._allianceName == "" then
    self:notInputMessage(0)
  else
    if _isDone ~= self._createdCount + 1 then
      self:notInputMessage(1)
    else
      if self._currentTotalTaxConst ~= 100 then
        self:notInputMessage(2)
      else
        _isDone = 0
        self:confirm_AllianceCreate()
      end
    end
  end
end

-- DECOMPILER ERROR at PC135: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.confirm_AllianceCreate = function(self)
  -- function num : 0_25
  ToClient_RequestClearAllianceJoinQueue()
  for ii = 0, self._createdCount do
    ToClient_RequestAddAllianceJoinQueue((self._allianceMemberName)[ii], (self._taxConstRate)[ii], (self._guildLimitMemeberCount)[ii])
  end
  ToClient_CreateGuildAlliance(self._allianceName)
  self._isInvited = true
end

-- DECOMPILER ERROR at PC138: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.confirm_CancelInvite = function(self)
  -- function num : 0_26
  ToClient_CancelCreateGuildAlliance()
  self._isInvited = false
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCEINFO_CANCEL_CREATE_ALLIANCE"))
  ;
  ((self._inviteUi).text_Wait):SetShow(false)
end

-- DECOMPILER ERROR at PC141: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.notInputMessage = function(self, index)
  -- function num : 0_27
  local _title = ""
  local _info = ""
  if index == 0 then
    _info = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCEINFO_WARNING_NONE_ALLIANCENAME")
  else
    if index == 1 then
      _info = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCEINFO_WARNING_NONE_GUILDNAME")
    else
      if index == 2 then
        _info = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCEINFO_WARNING_NONE_TAX_CONST")
      end
    end
  end
  local messageBoxData = {title = _title, content = _info, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

-- DECOMPILER ERROR at PC144: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.Alliance_AllInputInitialize = function(self)
  -- function num : 0_28
  if self._isInvited == false then
    for ii = 1, self._createdCount do
      self:inputInitialize(ii)
    end
    self._createdCount = 0
    self._allianceName = ""
    ;
    ((self._inviteUi).edit_AllianceName):SetEditText("")
    ;
    (((self._inviteUi).guildList).button_DeleteGuild):SetShow(false)
    -- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._taxConstRate)[0] = (self._taxRate_Default)[1]
    ;
    ((self._inviteUi).edit_AllianceName):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GUILDALLIANCEINFO_ALLIANCENAMETIP_TEXT"))
  end
end

FGlobal_GuildAllianceDone = function(index, guildName)
  -- function num : 0_29
  local self = PaGlobal_Guild_AllianceInfo
  if __eCreateGuildAlliance_Create == index then
    ((self._inviteUi).text_Wait):SetShow(true)
  else
    if __eCreateGuildAlliance_Complete == index then
      Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDALLIANCE_ACCEPT_JOIN", "guildName", guildName))
      self:OpenGuildAlliance()
    else
      if __eCreateGuildAlliance_AcceptJoin == index then
        Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDALLIANCE_ACCEPT_JOIN", "guildName", guildName))
      else
        if __eCreateGuildAlliance_Reject == index then
          Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDALLIANCE_REJECT_JOIN", "guildName", guildName))
          self:OpenGuildAlliance()
        else
          self:OpenGuildAlliance()
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC149: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.InfoInitialize = function(self)
  -- function num : 0_30
  local guildAlliance = ToClient_GetMyGuildAllianceWrapper()
  if guildAlliance == nil then
    return 
  end
  local selfPlayerWrapper = getSelfPlayer()
  if selfPlayerWrapper == nil then
    return 
  end
  local selfPlayer = selfPlayerWrapper:get()
  if selfPlayer == nil then
    return 
  end
  local _myGuildNo = (getSelfPlayer()):getGuildNo_s64()
  local _allianceNo = guildAlliance:guildAllianceNo_s64()
  local _chairName = guildAlliance:getGuildAllianceChairName()
  local _allianceNameInfo = guildAlliance:getRepresentativeName()
  local _allianceMemberCount = guildAlliance:getMemberCount()
  local _guildNo = {}
  local _guildName = {}
  local _guildLimitMemberCount = {}
  local _currentGuildMemberCount = {}
  local _guildTaxConst = {}
  local _totalGuildMemberCount = 0
  local _leaderNo = 0
  for ii = 0, _allianceMemberCount - 1 do
    local allianceMember = guildAlliance:getMemberGuild(ii)
    _guildName[ii] = allianceMember:getName()
    _guildNo[ii] = allianceMember:getGuildNo_s64()
    _guildLimitMemberCount[ii] = guildAlliance:getLimitMemberCountOfMemberGuild(_guildNo[ii])
    _guildTaxConst[ii] = guildAlliance:getTaxRateOfMemberGuild(_guildNo[ii])
    _currentGuildMemberCount[ii] = allianceMember:getMemberCount()
    _totalGuildMemberCount = _totalGuildMemberCount + _currentGuildMemberCount[ii]
    if tostring(_guildName[ii]) == tostring(_chairName) then
      _leaderNo = ii
    end
  end
  self._infoUi = {infoBg = (UI.getChildControl)((self._mainUi).allianceInfoBg, "Static_AllianceInfo_BG"), noticeBg = (UI.getChildControl)((self._mainUi).allianceInfoBg, "Static_AllianceNotice_BG"), button_Disband = (UI.getChildControl)((self._mainUi).allianceInfoBg, "Button_Disband")}
  -- DECOMPILER ERROR at PC100: Confused about usage of register: R16 in 'UnsetPending'

  ;
  (self._infoUi).allyIconBG = (UI.getChildControl)((self._infoUi).infoBg, "Static_AllyIcon_BG")
  -- DECOMPILER ERROR at PC108: Confused about usage of register: R16 in 'UnsetPending'

  ;
  (self._infoUi).allianceMark = (UI.getChildControl)((self._infoUi).infoBg, "Static_Ally_Icon")
  -- DECOMPILER ERROR at PC116: Confused about usage of register: R16 in 'UnsetPending'

  ;
  (self._infoUi).btnGuildAllianceMark = (UI.getChildControl)((self._infoUi).infoBg, "Button_GuildAllianceMark")
  -- DECOMPILER ERROR at PC124: Confused about usage of register: R16 in 'UnsetPending'

  ;
  (self._infoUi).allinaceNameUi = (UI.getChildControl)((self._infoUi).infoBg, "StaticText_R_GuildAlliacneName")
  -- DECOMPILER ERROR at PC132: Confused about usage of register: R16 in 'UnsetPending'

  ;
  (self._infoUi).allMemeberCount = (UI.getChildControl)((self._infoUi).infoBg, "StaticText_MemberCountValue")
  -- DECOMPILER ERROR at PC140: Confused about usage of register: R16 in 'UnsetPending'

  ;
  (self._infoUi).leaderCheck = (UI.getChildControl)((self._infoUi).infoBg, "RadioButton_LeaderCheck")
  -- DECOMPILER ERROR at PC148: Confused about usage of register: R16 in 'UnsetPending'

  ;
  (self._infoUi).gulidNameTemplete = (UI.getChildControl)((self._infoUi).infoBg, "StaticText_GuildNameTemplete")
  -- DECOMPILER ERROR at PC156: Confused about usage of register: R16 in 'UnsetPending'

  ;
  (self._infoUi).guildMemberCountTemplete = (UI.getChildControl)((self._infoUi).infoBg, "Static_GuildMemberTemplete")
  -- DECOMPILER ERROR at PC164: Confused about usage of register: R16 in 'UnsetPending'

  ;
  (self._infoUi).guildtaxConstTemplete = (UI.getChildControl)((self._infoUi).infoBg, "StaticText_TaxConstRateTemplete")
  -- DECOMPILER ERROR at PC167: Confused about usage of register: R16 in 'UnsetPending'

  ;
  (self._infoUi).guildName = {}
  -- DECOMPILER ERROR at PC170: Confused about usage of register: R16 in 'UnsetPending'

  ;
  (self._infoUi).guildMemberCount = {}
  -- DECOMPILER ERROR at PC173: Confused about usage of register: R16 in 'UnsetPending'

  ;
  (self._infoUi).guildtaxConst = {}
  ;
  ((self._infoUi).gulidNameTemplete):SetShow(false)
  ;
  ((self._infoUi).guildMemberCountTemplete):SetShow(false)
  ;
  ((self._infoUi).guildtaxConstTemplete):SetShow(false)
  local _guildListConfig = {startX = 65, startY = 180, gapY = 21}
  ;
  ((self._infoUi).allinaceNameUi):SetText(tostring(_allianceNameInfo))
  ;
  ((self._infoUi).allMemeberCount):SetText(_totalGuildMemberCount .. " / 100")
  for ii = 0, 9 do
    -- DECOMPILER ERROR at PC224: Confused about usage of register: R21 in 'UnsetPending'

    ((self._infoUi).guildName)[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, (self._mainUi).allianceInfoBg, "StaticText_InfoGuildName" .. ii)
    CopyBaseProperty((self._infoUi).gulidNameTemplete, ((self._infoUi).guildName)[ii])
    ;
    (((self._infoUi).guildName)[ii]):SetPosX(_guildListConfig.startX)
    ;
    (((self._infoUi).guildName)[ii]):SetPosY(_guildListConfig.startY + _guildListConfig.gapY * ii)
    ;
    (((self._infoUi).guildName)[ii]):SetShow(false)
    -- DECOMPILER ERROR at PC266: Confused about usage of register: R21 in 'UnsetPending'

    ;
    ((self._infoUi).guildMemberCount)[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, (self._mainUi).allianceInfoBg, "StaticText_InfoGuildMemberCount" .. ii)
    CopyBaseProperty((self._infoUi).guildMemberCountTemplete, ((self._infoUi).guildMemberCount)[ii])
    ;
    (((self._infoUi).guildMemberCount)[ii]):SetPosX(_guildListConfig.startX + 140)
    ;
    (((self._infoUi).guildMemberCount)[ii]):SetPosY(_guildListConfig.startY + _guildListConfig.gapY * ii)
    ;
    (((self._infoUi).guildMemberCount)[ii]):SetShow(false)
    -- DECOMPILER ERROR at PC309: Confused about usage of register: R21 in 'UnsetPending'

    ;
    ((self._infoUi).guildtaxConst)[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, (self._mainUi).allianceInfoBg, "StaticText_InfoGuildTaxConst" .. ii)
    CopyBaseProperty((self._infoUi).guildtaxConstTemplete, ((self._infoUi).guildtaxConst)[ii])
    ;
    (((self._infoUi).guildtaxConst)[ii]):SetPosX(_guildListConfig.startX + 230)
    ;
    (((self._infoUi).guildtaxConst)[ii]):SetPosY(_guildListConfig.startY + _guildListConfig.gapY * ii)
    ;
    (((self._infoUi).guildtaxConst)[ii]):SetShow(false)
  end
  for ii = 0, _allianceMemberCount - 1 do
    (((self._infoUi).guildName)[ii]):SetText(_guildName[ii])
    ;
    (((self._infoUi).guildName)[ii]):SetShow(true)
    ;
    (((self._infoUi).guildMemberCount)[ii]):SetText(_currentGuildMemberCount[ii] .. "/" .. _guildLimitMemberCount[ii])
    ;
    (((self._infoUi).guildMemberCount)[ii]):SetShow(true)
    ;
    (((self._infoUi).guildtaxConst)[ii]):SetText(_guildTaxConst[ii] / CppDefine.e1Percent .. "%")
    ;
    (((self._infoUi).guildtaxConst)[ii]):SetShow(true)
  end
  -- DECOMPILER ERROR at PC396: Confused about usage of register: R17 in 'UnsetPending'

  ;
  (self._infoUi).editAllianceNoticeUi = (UI.getChildControl)((self._infoUi).noticeBg, "MultilineEdit_Introduce")
  -- DECOMPILER ERROR at PC404: Confused about usage of register: R17 in 'UnsetPending'

  ;
  (self._infoUi).button_Notice = (UI.getChildControl)((self._infoUi).noticeBg, "Button_Notice")
  ;
  ((self._infoUi).button_Notice):addInputEvent("Mouse_LUp", "PaGlobal_Guild_AllianceInfo:AllianceNotice_Regist()")
  ;
  ((self._infoUi).button_Notice):SetShow(false)
  -- DECOMPILER ERROR at PC423: Confused about usage of register: R17 in 'UnsetPending'

  ;
  (self._infoUi).button_NoticeInitialize = (UI.getChildControl)((self._infoUi).noticeBg, "Button_NoticeInitialize")
  ;
  ((self._infoUi).button_NoticeInitialize):addInputEvent("Mouse_LUp", "PaGlobal_Guild_AllianceInfo:AllianceNotice_Initialize()")
  ;
  ((self._infoUi).button_NoticeInitialize):SetShow(false)
  local _isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  if _isGuildMaster == true then
    ((self._infoUi).button_Disband):addInputEvent("Mouse_LUp", "PaGlobal_Guild_AllianceInfo:DisbandAlliance()")
  else
    ;
    ((self._infoUi).button_Disband):SetShow(false)
    ;
    ((self._infoUi).button_Disband):SetIgnore(true)
  end
  ;
  ((self._infoUi).leaderCheck):SetPosY(_guildListConfig.startY + _guildListConfig.gapY * _leaderNo - 80)
  ;
  ((self._infoUi).leaderCheck):SetCheck(true)
  ;
  ((self._infoUi).allianceMark):SetIgnore(true)
  ;
  ((self._infoUi).btnGuildAllianceMark):SetShow(false)
  local _notice = guildAlliance:getNotice()
  ;
  ((self._infoUi).editAllianceNoticeUi):SetText(_notice)
  if selfPlayer:isGuildAllianceChair() then
    ((self._infoUi).allianceMark):SetIgnore(false)
    ;
    ((self._infoUi).btnGuildAllianceMark):SetShow(true)
    ;
    ((self._infoUi).btnGuildAllianceMark):addInputEvent("Mouse_LUp", "FGlobal_Guild_AllianceInfo_ChangeMark()")
    ;
    ((self._infoUi).btnGuildAllianceMark):addInputEvent("Mouse_On", "FGlobal_Guild_AllianceInfo_MarkToolTip()")
    ;
    ((self._infoUi).btnGuildAllianceMark):addInputEvent("Mouse_Out", "TooltipSimple_Hide()")
    ;
    ((self._infoUi).editAllianceNoticeUi):SetIgnore(false)
    ;
    ((self._infoUi).editAllianceNoticeUi):addInputEvent("Mouse_LUp", "PaGlobal_Guild_AllianceInfo:HandleClicked_AllianceNoticeEditSetFocus()")
    ;
    ((self._infoUi).editAllianceNoticeUi):SetMaxInput(300)
    ;
    ((self._infoUi).editAllianceNoticeUi):RegistReturnKeyEvent("PaGlobal_Guild_AllianceInfo:AllianceNotice_Regist()")
    ;
    ((self._infoUi).editAllianceNoticeUi):SetEditText(_notice)
    ;
    ((self._infoUi).button_Notice):SetShow(true)
    ;
    ((self._infoUi).button_NoticeInitialize):SetShow(true)
    ;
    ((self._infoUi).noticeBg):SetIgnore(true)
  else
    ;
    ((self._infoUi).editAllianceNoticeUi):SetIgnore(true)
    ;
    ((self._infoUi).allyIconBG):SetIgnore(true)
  end
  ;
  ((self._infoUi).editAllianceNoticeUi):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  local isSet = setGuildTextureByAllianceNo(_allianceNo, (self._infoUi).allianceMark)
  if isSet == false then
    ((self._infoUi).allianceMark):ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Buttons.dds")
    local x1, y1, x2, y2 = setTextureUV_Func((self._infoUi).allianceMark, 183, 1, 188, 6)
    ;
    (((self._infoUi).allianceMark):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    ((self._infoUi).allianceMark):setRenderTexture(((self._infoUi).allianceMark):getBaseTexture())
  else
    do
      ;
      (((self._infoUi).allianceMark):getBaseTexture()):setUV(0, 0, 1, 1)
      ;
      ((self._infoUi).allianceMark):setRenderTexture(((self._infoUi).allianceMark):getBaseTexture())
    end
  end
end

FGlobal_Guild_AllianceInfo_ChangeMark = function()
  -- function num : 0_31
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCE_ADDMARK_MESSAGEBOX_TITLE"), content = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCE_ADDMARK_MESSAGEBOX_TEXT"), functionYes = FGlobal_GuildAllianceInfo_ChangeMarkContinue, functionNo = MessageBox_Empty_function, priority = (CppEnums.PA_UI_CONTROL_TYPE).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData, "top")
end

FGlobal_GuildAllianceInfo_ChangeMarkContinue = function()
  -- function num : 0_32
  guildMarkUpdate(true)
end

FGlobal_Guild_AllianceInfo_MarkToolTip = function()
  -- function num : 0_33
  local self = PaGlobal_Guild_AllianceInfo
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDALLIANCEMARK_BTN_TOOLTIP_NAME")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDALLIANCEMARK_BTN_TOOLTIP_DESC")
  local control = (self._infoUi).btnGuildAllianceMark
  TooltipSimple_Show(control, name, desc)
end

-- DECOMPILER ERROR at PC158: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.FGlobal_GuildAllianceInfoOnMarkChanged = function(self)
  -- function num : 0_34
  if self:isShowing() then
    self:InfoInitialize()
  end
end

-- DECOMPILER ERROR at PC161: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.isShowing = function(self)
  -- function num : 0_35
  return Panel_Guild_AllianceInfo:GetShow()
end

-- DECOMPILER ERROR at PC164: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.HandleClicked_AllianceNoticeEditSetFocus = function(self)
  -- function num : 0_36
  SetFocusEdit((self._infoUi).editAllianceNoticeUi)
  ;
  ((self._infoUi).editAllianceNoticeUi):SetMaxEditLine(16)
  ;
  ((self._infoUi).editAllianceNoticeUi):SetEditText(((self._infoUi).editAllianceNoticeUi):GetEditText(), true)
end

-- DECOMPILER ERROR at PC167: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.AllianceNotice_Regist = function(self)
  -- function num : 0_37
  local _notice = ((self._infoUi).editAllianceNoticeUi):GetEditText()
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._infoUi)._notice = tostring(_notice)
  ToClient_SetGuildAllianceNotice(_notice)
  ClearFocusEdit()
end

-- DECOMPILER ERROR at PC170: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.AllianceNotice_Initialize = function(self)
  -- function num : 0_38
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  (self._infoUi)._notice = ""
  ;
  ((self._infoUi).editAllianceNoticeUi):SetEditText("")
  ;
  ((self._infoUi).editAllianceNoticeUi):SetText((self._infoUi)._notice)
  ToClient_SetGuildAllianceNotice("")
end

-- DECOMPILER ERROR at PC173: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_AllianceInfo.DisbandAlliance = function(self)
  -- function num : 0_39
  local _title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCEINFO_MESSAGE_DISBAND_TITLE")
  local _content = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCEINFO_MESSAGE_DISBAND_INFO")
  local messageboxData = {title = _title, content = _content, functionYes = confirm_DisbandAlliance, functionNo = MessageBox_Empty_function, priority = (CppEnums.PA_UI_CONTROL_TYPE).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

confirm_DisbandAlliance = function()
  -- function num : 0_40
  local self = PaGlobal_Guild_AllianceInfo
  ToClient_RequestDestroyGuildAlliance()
end

FGlobal_GuildAllianceDisbandDone = function()
  -- function num : 0_41
  local self = PaGlobal_Guild_AllianceInfo
  local _title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCEINFO_MESSAGE_DISBAND_TITLE")
  local _content = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDALLIANCEINFO_MESSAGE_DISBAND_DONE")
  local messageBoxData = {title = _title, content = _content, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
  FGlobal_GuildAllianceDone()
end

FGlobal_GuildAlliance_Show = function(isShow)
  -- function num : 0_42
  local self = PaGlobal_Guild_AllianceInfo
  if isShow == true then
    (self.defaultFrameBG_Alliance):SetShow(true)
    self:OpenGuildAlliance()
  else
    ;
    (self.defaultFrameBG_Alliance):SetShow(false)
  end
end

FGlobal_GuildAllianceOnNoticeChanged = function()
  -- function num : 0_43
  local self = PaGlobal_Guild_AllianceInfo
  local guildAlliance = ToClient_GetMyGuildAllianceWrapper()
  if guildAlliance == nil then
    return 
  else
    self:OpenGuildAlliance()
    ;
    ((self._infoUi).editAllianceNoticeUi):SetText(guildAlliance:getNotice())
  end
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Panel_Guild_AllianceInfo")
registerEvent("EventChangeGuildInfo", "FGlobal_GuildAllianceInfoOnMarkChanged")
registerEvent("FromClient_ResponseGuildNotice", "FGlobal_GuildAllianceOnNoticeChanged")
registerEvent("FromClient_CreateGuildAlliance", "FGlobal_GuildAllianceDone")
registerEvent("FromClient_DestroyGuildAlliance", "FGlobal_GuildAllianceDisbandDone")
FromClient_luaLoadComplete_Panel_Guild_AllianceInfo = function()
  -- function num : 0_44
  local self = PaGlobal_Guild_AllianceInfo
  self:OpenGuildAlliance()
  self.defaultFrameBG_Alliance = (UI.getChildControl)(Panel_Window_Guild, "Static_Frame_AllianceBG")
  ;
  (self.defaultFrameBG_Alliance):MoveChilds((self.defaultFrameBG_Alliance):GetID(), Panel_Guild_AllianceInfo)
  deletePanel(Panel_Guild_AllianceInfo:GetID())
end


