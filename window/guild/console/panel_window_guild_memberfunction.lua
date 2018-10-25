local _panel = Panel_Window_Guild_MemberFunction
_panel:ignorePadSnapMoveToOtherPanel()
local GuildMemberFunction = {
  _ui = {
    stc_CenterBg = UI.getChildControl(_panel, "Static_CenterBg"),
    stc_BottomBg = UI.getChildControl(_panel, "Static_BottomBg")
  },
  _btnType = {
    showInfo = 0,
    recvPay = 1,
    renewAgreement = 2,
    modifySound = 3,
    inviteParty = 4,
    guildNotice = 5,
    guildIntro = 6,
    declareWar = 7,
    guildMark = 8,
    deportation = 9,
    changeMaster = 10,
    appointCommander = 11,
    cancelCommander = 12,
    leaveGuild = 13,
    disperseGuild = 14,
    showContract = 15,
    clanDeportation = 16,
    voiceOption = 17,
    funding = 18,
    protection = 19,
    cancelProtection = 20
  },
  _btnControl = {},
  _startBtnPos = 20,
  _currentBtnPos = 0,
  _btnYGap = 45,
  _currentBtnCount = 0,
  _currentMemberSortIdx = nil,
  _currentMemberIdx = nil,
  _currentMemberInfo = nil
}
function GuildMemberFunction:init()
  self._ui.btn_Template = UI.getChildControl(self._ui.stc_CenterBg, "Button_Template")
  PaGlobal_registerPanelOnBlackBackground(_panel)
  self:registEvent()
end
function GuildMemberFunction:open()
  local memberInfo = self._currentMemberInfo
  if nil == memberInfo then
    _PA_ASSERT(false, "\234\184\184\235\147\156 \235\169\164\235\178\132 \236\160\149\235\179\180\234\176\128 \236\152\172\235\176\148\235\165\180\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberFunction:open")
    return
  end
  self._currentBtnPos = self._startBtnPos
  local selfPlayer = getSelfPlayer()
  self:clearButton()
  if memberInfo:getName() == selfPlayer:getUserNickname() then
    self:addButton(self._btnType.showInfo)
    if memberInfo:isCollectableBenefit() and false == memberInfo:isFreeAgent() and toInt64(0, 0) < memberInfo:getContractedBenefit() then
      self:addButton(self._btnType.recvPay)
    end
  elseif true == selfPlayer:get():isGuildMaster() then
    if 1 == memberInfo:getGrade() then
      self:addButton(self._btnType.showInfo)
      self:addButton(self._btnType.deportation)
      self:addButton(self._btnType.cancelCommander)
      self:addButton(self._btnType.changeMaster)
      self:addButton(self._btnType.inviteParty)
    else
      self:addButton(self._btnType.showInfo)
      self:addButton(self._btnType.deportation)
      self:addButton(self._btnType.appointCommander)
      self:addButton(self._btnType.inviteParty)
      if memberInfo:isProtectable() then
        self:addButton(self._btnType.cancelProtection)
      else
        self:addButton(self._btnType.protection)
      end
    end
    self:addButton(self._btnType.funding)
    if true == memberInfo:isOnline() then
      self:addButton(self._btnType.voiceOption)
    end
  else
    self:addButton(self._btnType.showInfo)
    self:addButton(self._btnType.inviteParty)
    if true == memberInfo:isOnline() then
      self:addButton(self._btnType.voiceOption)
    end
  end
  self:addButton(self._btnType.showContract)
  _panel:SetShow(true)
end
function GuildMemberFunction:openGuildSetting()
  self._currentBtnPos = self._startBtnPos
  self:clearButton()
  local isGuildMaster = getSelfPlayer():get():isGuildMaster()
  local isGuildSubMaster = getSelfPlayer():get():isGuildSubMaster()
  if true == isGuildMaster then
    self:addButton(self._btnType.guildNotice)
    self:addButton(self._btnType.guildIntro)
    self:addButton(self._btnType.declareWar)
    self:addButton(self._btnType.guildMark)
    self:addButton(self._btnType.disperseGuild)
  elseif true == isGuildSubMaster then
    self:addButton(self._btnType.guildNotice)
    self:addButton(self._btnType.guildIntro)
    self:addButton(self._btnType.declareWar)
    self:addButton(self._btnType.guildMark)
    self:addButton(self._btnType.leaveGuild)
  else
    self:addButton(self._btnType.leaveGuild)
  end
  _panel:SetShow(true)
end
function GuildMemberFunction:openClanMemberSetting()
  self._currentBtnPos = self._startBtnPos
  self:clearButton()
  local isGuildMaster = getSelfPlayer():get():isGuildMaster()
  local isGuildSubMaster = getSelfPlayer():get():isGuildSubMaster()
  if true == isGuildMaster then
    if 1 == self._currentMemberInfo:getGrade() then
      self:addButton(self._btnType.cancelCommander)
    else
      self:addButton(self._btnType.appointCommander)
    end
    self:addButton(self._btnType.clanDeportation)
  elseif true == isGuildSubMaster then
    self:addButton(self._btnType.clanDeportation)
  else
    return
  end
  _panel:SetShow(true)
end
function GuildMemberFunction:addButton(btnType)
  local btnTemplate = UI.createAndCopyBasePropertyControl(self._ui.stc_CenterBg, "Button_Template", self._ui.stc_CenterBg, "Button_" .. btnType)
  if btnType == self._btnType.showInfo then
    btnTemplate:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GUILDFUNCTION_INFOBTN"))
  elseif btnType == self._btnType.recvPay then
    btnTemplate:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GUILDFUNCTION_PAYBTN"))
  elseif btnType == self._btnType.renewAgreement then
    btnTemplate:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_AGREEMENTGUILDMASTER_BTN_PERIOD_RENEW"))
  elseif btnType == self._btnType.modifySound then
    btnTemplate:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GUILDFUNCTION_SOUNDBTN"))
  elseif btnType == self._btnType.inviteParty then
    btnTemplate:SetText(PAGetString(Defines.StringSheet_RESOURCE, "INTERACTION_BTN_PARTY"))
  elseif btnType == self._btnType.guildNotice then
    btnTemplate:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GUILD_LIST_NOTICE_TITLE"))
  elseif btnType == self._btnType.guildIntro then
    btnTemplate:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GUILD_INTRODUCETITLE"))
  elseif btnType == self._btnType.declareWar then
    btnTemplate:SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_BTN_LETSWAR"))
  elseif btnType == self._btnType.guildMark then
    btnTemplate:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GUILDMARK_TITLE"))
  elseif btnType == self._btnType.deportation then
    btnTemplate:SetText(PAGetString(Defines.StringSheet_GAME, "GULD_BUTTON1"))
  elseif btnType == self._btnType.changeMaster then
    btnTemplate:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDLIST_BUTTONLIST_TEXT_0"))
  elseif btnType == self._btnType.appointCommander then
    btnTemplate:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_APPOINT_GUILDSUBMASTER"))
  elseif btnType == self._btnType.cancelCommander then
    btnTemplate:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDLIST_BUTTONLIST_TEXT_3"))
  elseif btnType == self._btnType.leaveGuild then
    btnTemplate:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_WITHDRAW_GUILD"))
  elseif btnType == self._btnType.disperseGuild then
    btnTemplate:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_DISPERSE_GUILD"))
  elseif btnType == self._btnType.showContract then
    btnTemplate:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GUILD_SHOWCONTRACT"))
  elseif btnType == self._btnType.clanDeportation then
    btnTemplate:SetText(PAGetString(Defines.StringSheet_RESOURCE, "GULD_BUTTON1"))
  elseif btnType == self._btnType.voiceOption then
    btnTemplate:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GUILDFUNCTION_SOUNDBTN"))
  elseif btnType == self._btnType.funding then
    btnTemplate:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GUILD_USEGUILDFUNDS_TITLE"))
  elseif btnType == self._btnType.protection then
    btnTemplate:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDLIST_BUTTONLIST_TEXT_4"))
  elseif btnType == self._btnType.cancelProtection then
    btnTemplate:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDLIST_BUTTONLIST_TEXT_5"))
  end
  btnTemplate:SetPosY(self._currentBtnPos)
  self._currentBtnPos = self._currentBtnPos + self._btnYGap
  btnTemplate:addInputEvent("Mouse_LUp", "InputMLUp_GuildMemberFunction_PressButton(" .. btnType .. ")")
  btnTemplate:SetShow(true)
  self._btnControl[btnType] = btnTemplate
end
function GuildMemberFunction:clearButton()
  for _, control in pairs(self._btnControl) do
    if nil ~= control then
      control:SetShow(false)
      UI.deleteControl(control)
    end
  end
  self._btnControl = {}
end
function GuildMemberFunction:close()
  _AudioPostEvent_SystemUiForXBOX(50, 3)
  _panel:SetShow(false)
end
function PaGlobalFunc_GuildMemberFunction_Close()
  GuildMemberFunction:close()
end
function GuildMemberFunction:registEvent()
end
function PaGlobalFunc_GuildMemberFunction_Init()
  local self = GuildMemberFunction
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberFunction")
    return
  end
  self:init()
end
function PaGlobalFunc_GuildMemberFunction_GetMemberIndex()
  local self = GuildMemberFunction
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberFunction")
    return
  end
  return self._currentMemberIdx
end
function PaGlobalFunc_GuildMemberFunction_GetMemberSortIndex()
  local self = GuildMemberFunction
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberFunction")
    return
  end
  return self._currentMemberSortIdx
end
function PaGlobalFunc_GuildMemberFunction_Open(index)
  local self = GuildMemberFunction
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberFunction")
    return
  end
  local guildInfo = ToClient_GetMyGuildInfoWrapper()
  if nil == guildInfo then
    return
  end
  local memberInfo = PaGlobalFunc_GuildMemberList_GetMemberInfoWithIndex(index)
  self._currentMemberSortIdx = index
  self._currentMemberIdx = memberInfo._idx
  local guildMemberInfo = guildInfo:getMember(self._currentMemberIdx)
  if nil == guildMemberInfo then
    return
  end
  self._currentMemberInfo = guildMemberInfo
  self:open()
end
function PaGlobalFunc_GuildMemberFunction_ClanOpen(index)
  local self = GuildMemberFunction
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberFunction")
    return
  end
  self._currentMemberIdx = index
  local guildInfo = ToClient_GetMyGuildInfoWrapper()
  if nil == guildInfo then
    return
  end
  local guildMemberInfo = guildInfo:getMember(self._currentMemberIdx)
  if nil == guildMemberInfo then
    return
  end
  self._currentMemberInfo = guildMemberInfo
  _AudioPostEvent_SystemUiForXBOX(8, 14)
  self:openClanMemberSetting()
end
function PaGlobalFunc_GuildSettingFunction_Open()
  local self = GuildMemberFunction
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberFunction")
    return
  end
  self._currentMemberIdx = nil
  self._currentMemberInfo = nil
  self:openGuildSetting()
  _AudioPostEvent_SystemUiForXBOX(8, 14)
end
function InputMLUp_GuildMemberFunction_PressButton(btnType)
  local self = GuildMemberFunction
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberFunction")
    return
  end
  if btnType == self._btnType.showInfo then
    local opened = PaGlobalFunc_GuildMemberInfo_Open()
  elseif btnType == self._btnType.recvPay then
    PaGlobalFunc_GuildMemberInfo_TakeGuildBenefit()
  elseif btnType == self._btnType.renewAgreement then
    PaGlobalFunc_GuildMemberInfo_OpenContract()
  elseif btnType == self._btnType.inviteParty then
    PaGlobalFunc_GuildMemberInfo_InviteParty()
  elseif btnType == self._btnType.deportation then
    PaGlobalFunc_GuildMemberInfo_MessageboxFunction(btnType)
  elseif btnType == self._btnType.appointCommander then
    PaGlobalFunc_GuildMemberInfo_MessageboxFunction(btnType)
  elseif btnType == self._btnType.cancelCommander then
    PaGlobalFunc_GuildMemberInfo_MessageboxFunction(btnType)
  elseif btnType == self._btnType.changeMaster then
    PaGlobalFunc_GuildMemberInfo_MessageboxFunction(btnType)
  elseif btnType == self._btnType.leaveGuild then
    PaGlobalFunc_GuildSettingFunction_WithdrawGuild()
  elseif btnType == self._btnType.disperseGuild then
    PaGlobalFunc_GuildSettingFunction_WithdrawGuild()
  elseif btnType == self._btnType.guildMark then
    PaGlobalFunc_GuildMark_Open()
  elseif btnType == self._btnType.guildIntro then
    PaGlobalFunc_GuildIntro_OpenIntroduce()
  elseif btnType == self._btnType.guildNotice then
    PaGlobalFunc_GuildIntro_OpenNotice()
  elseif btnType == self._btnType.declareWar then
    PaGlobalFunc_WarDeclare_Open()
  elseif btnType == self._btnType.showContract then
    PaGlobalFunc_GuildMemberInfo_OpenContract()
  elseif btnType == self._btnType.clanDeportation then
    PaGlobalFunc_GuildMemberInfo_MessageboxFunction(btnType)
  elseif btnType == self._btnType.voiceOption then
    PaGlobalFunc_GuildVoiceSet_Open()
  elseif btnType == self._btnType.funding then
    PaGlobalFunc_GuildFunding_Open(self._currentMemberIdx)
  elseif btnType == self._btnType.protection then
    PaGlobalFunc_GuildMemberInfo_MessageboxFunction(btnType)
  elseif btnType == self._btnType.cancelProtection then
    PaGlobalFunc_GuildMemberInfo_MessageboxFunction(btnType)
  end
  _AudioPostEvent_SystemUiForXBOX(50, 1)
  self:close()
end
function PaGlobalFunc_GuildMemberInfo_TakeGuildBenefit()
  local hasWareHouse = ToClient_HasWareHouseFromNpc()
  if hasWareHouse then
    PaGlobalFunc_GuildReceivePay_Open()
  else
    ToClient_TakeMyGuildBenefit(false)
  end
end
function PaGlobalFunc_GuildMemberInfo_OpenContract()
  local self = GuildMemberFunction
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberFunction")
    return
  end
  local guildInfo = ToClient_GetMyGuildInfoWrapper()
  if nil == guildInfo then
    return
  end
  local guildMemberInfo = guildInfo:getMember(self._currentMemberIdx)
  local usableActivity = guildMemberInfo:getUsableActivity()
  local isGuildMaster = getSelfPlayer():get():isGuildMaster()
  local isGuildSubMaster = getSelfPlayer():get():isGuildSubMaster()
  if true == isGuildMaster then
    PaGlobalFunc_AgreementGuild_Master_ContractOpen(self._currentMemberIdx, 0, usableActivity)
  elseif true == isGuildSubMaster then
    PaGlobalFunc_AgreementGuild_Master_ContractOpen(self._currentMemberIdx, 1, usableActivity)
  else
    PaGlobalFunc_AgreementGuild_Master_ContractOpen(self._currentMemberIdx, 2, usableActivity)
  end
end
function PaGlobalFunc_GuildMemberInfo_InviteParty()
  local self = GuildMemberFunction
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberFunction")
    return
  end
  if false == ToClient_IsGuildMemberBlocked(self._currentMemberIdx) then
    do
      local isOnline = self._currentMemberInfo:isOnline()
      local characterName = self._currentMemberInfo:getCharacterName()
      local function guildMemberPartyInvite()
        RequestParty_inviteCharacter(characterName)
      end
      local messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS")
      if true == isOnline then
        messageContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDLIST_GUILDMEMBERPARTYINVITE_MSG", "targetName", characterName)
        local messageboxData = {
          title = messageTitle,
          content = messageContent,
          functionYes = guildMemberPartyInvite,
          functionNo = MessageBox_Empty_function,
          priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
        }
        MessageBox.showMessageBox(messageboxData, "middle")
        return
      else
        messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_LIST_PARTYINVITE_NOTJOINMEMBER")
        local messageboxData = {
          title = messageTitle,
          content = messageContent,
          functionYes = MessageBox_Empty_function,
          priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
        }
        MessageBox.showMessageBox(messageboxData, "middle")
        return
      end
    end
  else
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_DONOTHAVE_PRIVILEGE")
    local messageBoxData = {
      title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"),
      content = messageBoxMemo,
      functionYes = MessageBox_Empty_function,
      functionNo = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageBoxData)
  end
end
function PaGlobalFunc_GuildSettingFunction_WithdrawGuild()
  local self = GuildMemberFunction
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberFunction")
    return
  end
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if nil == myGuildInfo then
    _PA_ASSERT(false, "\234\184\184\235\147\156 \236\160\149\235\179\180\234\176\128 \236\151\134\236\138\181\235\139\136\235\139\164!! : PaGlobalFunc_GuildMemberInfo_WithdrawGuild")
    return
  end
  local guildGrade = myGuildInfo:getGuildGrade()
  local messageboxData
  if true == getSelfPlayer():get():isGuildMaster() then
    if myGuildInfo:getMemberCount() <= 1 then
      messageboxData = {
        title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_DISPERSE_GUILD"),
        content = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_DISPERSE_GUILD_ASK"),
        functionYes = PaGlobalFunc_GuildSettingFunction_Disperse,
        functionNo = MessageBox_Empty_function,
        priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
      }
      MessageBox.showMessageBox(messageboxData)
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDDEL_BTN_TOOLTIP_DESC"))
    end
  else
    local messageText
    if 0 == guildGrade then
      messageText = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_CLANLIST_CLANOUT_ASK")
    else
      messageText = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_WITHDRAW_GUILD_ASK") .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_MENTINFO")
    end
    messageboxData = {
      title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_WITHDRAW_GUILD"),
      content = messageText,
      functionYes = PaGlobalFunc_GuildSettingFunction_Leave,
      functionNo = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageboxData)
  end
end
function PaGlobalFunc_GuildSettingFunction_Disperse()
  ToClient_RequestDestroyGuild()
  PaGlobalFunc_GuildMain_Close()
end
function PaGlobalFunc_GuildSettingFunction_Leave()
  ToClient_RequestDisjoinGuild()
  PaGlobalFunc_GuildMain_Close()
end
function PaGlobalFunc_GuildMemberInfo_MessageboxFunction(btnType)
  local self = GuildMemberFunction
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberFunction")
    return
  end
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if nil == myGuildListInfo then
    return
  end
  local myGuildMemberInfo = self._currentMemberInfo
  if nil == myGuildMemberInfo then
    return
  end
  local messageTitle = ""
  local messageContent = ""
  local yesFunction
  local targetName = myGuildMemberInfo:getName()
  local characterName = myGuildMemberInfo:getCharacterName()
  local isOnlineMember = myGuildMemberInfo:isOnline()
  if btnType == self._btnType.changeMaster then
    messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_DELEGATE_MASTER")
    messageContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_DELEGATE_MASTER_QUESTION", "target", "'" .. tostring(targetName) .. "'")
    yesFunction = MessageBoxYesFunction_GuildMemberFunction_ChangeGuildMaster
  elseif btnType == self._btnType.deportation then
    messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_EXPEL_GUILDMEMBER")
    messageContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_EXPEL_GUILDMEMBER_QUESTION", "target", "[" .. tostring(targetName) .. "]")
    yesFunction = MessageBoxYesFunction_GuildMemberFunction_ExpelMember
  elseif btnType == self._btnType.appointCommander then
    messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_APPOINT_GUILDSUBMASTER")
    messageContent = "'" .. tostring(targetName) .. "'" .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_APPOINT_GUILDSUBMASTER_QUESTION")
    yesFunction = MessageBoxYesFunction_GuildMemberFunction_AppointCommander
  elseif btnType == self._btnType.cancelCommander then
    messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_APPOINT_GUILDMEMBER")
    messageContent = "'" .. tostring(targetName) .. "'" .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_APPOINT_GUILDMEMBER_QUESTION")
    yesFunction = MessageBoxYesFunction_GuildMemberFunction_CancelAppoint
  elseif btnType == self._btnType.clanDeportation then
    messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_EXPEL_CLANMEMBER")
    messageContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CLAN_TEXT_EXPEL_CLANMEMBER_QUESTION", "name", targetName)
    yesFunction = MessageBoxYesFunction_GuildMemberFunction_ExpelMember
  elseif btnType == self._btnType.protection then
    messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_PROTECT_GUILDMEMBER")
    messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_PROTECT_GUILDMEMBER_DESC")
    yesFunction = MessageBoxYesFunction_ProtectMember
    GuildListInfoPage._buttonListBG:SetShow(false)
    local messageboxData = {
      title = messageTitle,
      content = messageContent,
      functionYes = yesFunction,
      functionNo = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageboxData, "top")
    return
  elseif btnType == self._btnType.cancelProtection then
    messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_CANCEL_PROTECT_GUILDMEMBER")
    messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_CANCEL_PROTECT_GUILDMEMBER_DESC")
    yesFunction = MessageBoxYesFunction_CancelProtectMember
  else
    UI.ASSERT(false, "\236\152\172\235\176\148\235\165\180\236\167\128 \236\149\138\236\157\128 \237\131\128\236\158\133\236\158\133\235\139\136\235\139\164!! : PaGlobalFunc_GuildMemberInfo_MessageboxFunction")
    return
  end
  local messageboxData = {
    title = messageTitle,
    content = messageContent,
    functionYes = yesFunction,
    functionNo = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageboxData)
end
function MessageBoxYesFunction_GuildMemberFunction_ExpelMember()
  local self = GuildMemberFunction
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberFunction")
    return
  end
  ToClient_RequestExpelMemberFromGuild(self._currentMemberIdx, self._currentMemberInfo:getUserNo())
end
function MessageBoxYesFunction_GuildMemberFunction_ChangeGuildMaster()
  local self = GuildMemberFunction
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberFunction")
    return
  end
  ToClient_RequestChangeGuildMemberGradeForMaster(self._currentMemberIdx)
  FGlobal_Notice_AuthorizationUpdate()
end
function MessageBoxYesFunction_GuildMemberFunction_AppointCommander()
  local self = GuildMemberFunction
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberFunction")
    return
  end
  ToClient_RequestChangeGuildMemberGrade(self._currentMemberIdx, 1)
  FGlobal_Notice_AuthorizationUpdate()
end
function MessageBoxYesFunction_GuildMemberFunction_CancelAppoint()
  local self = GuildMemberFunction
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberFunction")
    return
  end
  ToClient_RequestChangeGuildMemberGrade(self._currentMemberIdx, 2)
  FGlobal_Notice_AuthorizationUpdate()
end
function MessageBoxYesFunction_ProtectMember()
  ToClient_RequestChangeProtectMember(GuildMemberFunction._currentMemberIdx, true)
end
function MessageBoxYesFunction_CancelProtectMember()
  ToClient_RequestChangeProtectMember(GuildMemberFunction._currentMemberIdx, false)
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_GuildMemberFunction_Init")
