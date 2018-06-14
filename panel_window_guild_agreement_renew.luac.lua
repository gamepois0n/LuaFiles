-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\guild\console\panel_window_guild_agreement_renew.luac 

-- params : ...
-- function num : 0
local Window_GuildAgreementInfo = {_usableActivity, _memberBenefit, _memberPenalty, _targetName, _targetActorKeyRaw, _usableActivity, _sendContractPeriod, _sendDailyPayment, _sendPenaltyCost, _inviteGuildName, _inviteGuildMasterFamilyName, _inviteGuildMasterCharacterName, _period, _dailyPayment, _penaltyCost; 
_ui = {_static_AgreementContentBg = (UI.getChildControl)(Panel_Console_Window_GuildAgreement, "Static_AgreementContentBg"), _static_ConstractInfoBg = (UI.getChildControl)(Panel_Console_Window_GuildAgreement, "Static_ConstractInfoBg"), _static_TopBg = (UI.getChildControl)(Panel_Console_Window_GuildAgreement, "Static_TopBg"), _static_BottomBg = (UI.getChildControl)(Panel_Console_Window_GuildAgreement, "Static_BottomBg")}
, _isJoin = false, _memberIndex = -1, _isRenew = false, _s64_guildNo = 0}
PaGlobalFunc_AgreementGuild_Master_ContractOpen = function(memberIndex, requesterMemberGrade, usableActivity)
  -- function num : 0_0 , upvalues : Window_GuildAgreementInfo
  local self = Window_GuildAgreementInfo
  self._isJoin = false
  if usableActivity > 10000 then
    usableActivity = 10000
  end
  self._usableActivity = usableActivity
  ;
  ((self._ui)._staticText_Content):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_AGREEMENT_3"))
  local memberInfo = (ToClient_GetMyGuildInfoWrapper()):getMember(memberIndex)
  if memberInfo == nil then
    _PA_ASSERT(false, "FGlobal_AgreementGuild_Master_Open �\152 멤버인덱스가 비정상입니다 " .. tostring(memberIndex))
  end
  self._memberIndex = memberIndex
  local name = memberInfo:getName()
  local expiration = memberInfo:getContractedExpirationUtc()
  self._memberBenefit = memberInfo:getContractedBenefit()
  self._memberPenalty = memberInfo:getContractedPenalty()
  local temp1 = nil
  if Int64toInt32(getLeftSecond_TTime64(expiration)) > 0 then
    temp1 = convertStringFromDatetime(getLeftSecond_TTime64(expiration))
  else
    temp1 = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_AGREEMENT_MASTER_REMAINPERIOD")
  end
  ;
  ((self._ui)._staticText_Periodvalue):SetShow(true)
  ;
  ((self._ui)._staticText_Periodvalue):SetText(temp1)
  ;
  ((self._ui)._staticText_DailyPaymentValue):SetShow(true)
  ;
  ((self._ui)._staticText_PenaltyCostValue):SetShow(true)
  ;
  ((self._ui)._staticText_DailyPaymentValue):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_AGREEMENT_MASTER_MONEY", "money", makeDotMoney(self._memberBenefit)))
  ;
  ((self._ui)._staticText_PenaltyCostValue):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_AGREEMENT_MASTER_MONEY", "money", makeDotMoney(self._memberPenalty)))
  self._targetName = name
  ;
  ((self._ui)._staticText_ToValue):SetText(name)
  self._isRenew = false
  local contractAble = memberInfo:getContractableUtc()
  local contractAbleTo = false
  if requesterMemberGrade == 0 then
    if Int64toInt32(getLeftSecond_TTime64(contractAble)) <= 0 then
      isRenew = true
    else
      isRenew = false
    end
  else
    if requesterMemberGrade == 1 then
      if Int64toInt32(getLeftSecond_TTime64(contractAble)) <= 0 then
        contractAbleTo = true
      else
        contractAbleTo = false
      end
      isRenew = (memberInfo:getGrade() == 2 and contractAbleTo)
    else
      isRenew = false
    end
  end
  ;
  ((self._ui)._button_Confirm):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_AGREEMENTGUILDMASTER_BTN_PERIOD_RENEW"))
  ;
  ((self._ui)._button_Confirm):addInputEvent("Mouse_LUp", "PaGlobalFunc_AgreementGuild_SendReContract()")
  if _ContentsGroup_isConsolePadControl then
    Panel_Console_Window_GuildAgreement:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_A, "PaGlobalFunc_AgreementGuild_SendReContract()")
  end
  ;
  ((self._ui)._button_Close):addInputEvent("Mouse_LUp", "PaGlobalFunc_AgreementGuild_Close()")
  ;
  ((self._ui)._button_Confirm):SetShow(isRenew)
  if isRenew == true then
    ((self._ui)._button_Option):SetShow(true)
    Panel_Console_Window_GuildAgreement:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_Y, "PaGlobalFunc_AgreementGuild_SignOption_Open()")
  else
    ((self._ui)._button_Option):SetShow(false)
  end
  ;
  ((self._ui)._button_Close):addInputEvent("Mouse_LUp", "PaGlobalFunc_AgreementGuild_Close()")
  local guildWrapper = ToClient_GetMyGuildInfoWrapper()
  do
    local guildName = guildWrapper:getName()
    ;
    ((self._ui)._staticText_Title):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_AGREEMENT_MASTER_CONTRACT", "guildName", guildName))
    ;
    ((self._ui)._staticText_ContentTitle):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_AGREEMENT_MASTER_CONTRACT", "guildName", guildName))
    PaGlobalFunc_AgreementGuild_Open()
    -- DECOMPILER ERROR: 7 unprocessed JMP targets
  end
end

PaGlobal_AgreementGuild_InviteOpen = function(isJoin, hostUsername, hostname, guildName, period, benefit, penalty, s64_guildNo)
  -- function num : 0_1 , upvalues : Window_GuildAgreementInfo
  local self = Window_GuildAgreementInfo
  self._s64_guildNo = s64_guildNo
  if ((getSelfPlayer()):get()):isGuildMaster() then
    return 
  end
  self._isJoin = isJoin
  self._inviteGuildName = guildName
  self._inviteGuildMasterFamilyName = hostUsername
  self._inviteGuildMasterCharacterName = hostname
  self._period = period
  self._dailyPayment = benefit
  self._penaltyCost = penalty
  ;
  ((self._ui)._staticText_Periodvalue):SetText(self._period .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_DAY"))
  ;
  ((self._ui)._staticText_DailyPaymentValue):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_AGREEMENT_MASTER_MONEY", "money", makeDotMoney(self._dailyPayment)))
  ;
  ((self._ui)._staticText_PenaltyCostValue):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_AGREEMENT_MASTER_MONEY", "money", makeDotMoney(self._penaltyCost)))
  ;
  ((self._ui)._staticText_FromValue):SetText(self._inviteGuildMasterFamilyName .. "(" .. self._inviteGuildMasterCharacterName .. ")")
  local myNick = (getSelfPlayer()):getUserNickname()
  ;
  ((self._ui)._staticText_ToValue):SetText(myNick)
  ;
  ((self._ui)._button_Confirm):SetText("계약")
  ;
  ((self._ui)._button_Confirm):addInputEvent("Mouse_LUp", "PaGlobalFunc_AgreementGuild_AgreementConfirm()")
  if _ContentsGroup_isConsolePadControl then
    Panel_Console_Window_GuildAgreement:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_A, "PaGlobalFunc_AgreementGuild_AgreementConfirm()")
  end
  ;
  ((self._ui)._button_Close):addInputEvent("Mouse_LUp", "PaGlobalFunc_AgreementGuild_Master_InviteRefuse()")
  ;
  ((self._ui)._button_Confirm):SetShow(true)
  ;
  ((self._ui)._button_Option):SetShow(false)
  PaGlobalFunc_AgreementGuild_Open()
end

PaGlobalFunc_AgreementGuild_Master_InviteRefuse = function()
  -- function num : 0_2 , upvalues : Window_GuildAgreementInfo
  local self = Window_GuildAgreementInfo
  if self._isJoin then
    ToClient_RequestRefuseGuildInvite()
  else
    ToClient_RenewGuildContract(false)
  end
  PaGlobalFunc_AgreementGuild_Close()
end

PaGlobalFunc_AgreementGuild_AgreementConfirm = function()
  -- function num : 0_3 , upvalues : Window_GuildAgreementInfo
  local self = Window_GuildAgreementInfo
  local inputName = (getSelfPlayer()):getUserNickname()
  if self._isJoin then
    ToClient_RequestAcceptGuildInvite()
  else
    ToClient_RenewGuildContract(true)
  end
  PaGlobalFunc_AgreementGuild_Close()
end

PaGlobalFunc_AgreementGuild_SendReContract = function()
  -- function num : 0_4 , upvalues : Window_GuildAgreementInfo
  local self = Window_GuildAgreementInfo
  _PA_LOG("이호�\156", self._memberIndex)
  ToClient_SuggestGuildContract(self._memberIndex, tonumber(self._sendContractPeriod), tonumber(self._sendDailyPayment), tonumber(self._sendPenaltyCost))
  PaGlobalFunc_AgreementGuild_Close()
end

PaGlobalFunc_AgreementGuild_SendInvite = function()
  -- function num : 0_5 , upvalues : Window_GuildAgreementInfo
  local self = Window_GuildAgreementInfo
  toClient_RequestInviteGuild(self._targetName, tonumber(self._sendContractPeriod), tonumber(self._sendDailyPayment), tonumber(self._sendPenaltyCost))
  PaGlobalFunc_AgreementGuild_Close()
end

PaGlobalFunc_AgreementGuild_Open_ForJoin = function(targetKeyRaw, targetName, preGuildActivity)
  -- function num : 0_6 , upvalues : Window_GuildAgreementInfo
  local self = Window_GuildAgreementInfo
  self._targetActorKeyRaw = targetKeyRaw
  self._isJoin = true
  self._targetName = targetName
  ;
  ((self._ui)._staticText_ToValue):SetText(targetName)
  ;
  ((self._ui)._button_Confirm):SetText("계약")
  ;
  ((self._ui)._button_Confirm):addInputEvent("Mouse_LUp", "PaGlobalFunc_AgreementGuild_SendInvite()")
  if _ContentsGroup_isConsolePadControl then
    Panel_Console_Window_GuildAgreement:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_A, "PaGlobalFunc_AgreementGuild_SendInvite()")
  end
  ;
  ((self._ui)._button_Close):addInputEvent("Mouse_LUp", "PaGlobalFunc_AgreementGuild_Close()")
  ;
  ((self._ui)._button_Confirm):SetShow(true)
  ;
  ((self._ui)._button_Option):SetShow(true)
  PaGlobalFunc_AgreementGuild_SignOption_Open()
  PaGlobalFunc_AgreementGuild_SignOption_ContractDaySetData(4)
  PaGlobalFunc_AgreementGuild_SignOption_Confirm()
  PaGlobalFunc_AgreementGuild_Open()
end

PaGlobalFunc_AgreementGuild_AgreementSetData = function(contractPeriod, dailyPayment, value_penaltyCost)
  -- function num : 0_7 , upvalues : Window_GuildAgreementInfo
  local self = Window_GuildAgreementInfo
  self._sendContractPeriod = contractPeriod
  self._sendDailyPayment = dailyPayment
  self._sendPenaltyCost = value_penaltyCost
  ;
  ((self._ui)._staticText_Periodvalue):SetText(self._sendContractPeriod .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_DAY"))
  ;
  ((self._ui)._staticText_DailyPaymentValue):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_AGREEMENT_MASTER_MONEY", "money", makeDotMoney(self._sendDailyPayment)))
  ;
  ((self._ui)._staticText_PenaltyCostValue):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_AGREEMENT_MASTER_MONEY", "money", makeDotMoney(self._sendPenaltyCost)))
end

Window_GuildAgreementInfo.InitControl = function(self)
  -- function num : 0_8
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._staticText_Content = (UI.getChildControl)((self._ui)._static_AgreementContentBg, "StaticText_Content")
  ;
  ((self._ui)._staticText_Content):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._staticText_Content):SetAutoResize(true)
  ;
  ((self._ui)._staticText_Content):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_AGREEMENT_3"))
  -- DECOMPILER ERROR at PC36: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticText_ContentTitle = (UI.getChildControl)((self._ui)._static_AgreementContentBg, "StaticText_GuildName")
  -- DECOMPILER ERROR at PC44: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticText_Periodvalue = (UI.getChildControl)((self._ui)._static_ConstractInfoBg, "StaticText_PeriodValue")
  -- DECOMPILER ERROR at PC52: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticText_DailyPaymentValue = (UI.getChildControl)((self._ui)._static_ConstractInfoBg, "StaticText_DailyPaymentValue")
  -- DECOMPILER ERROR at PC60: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticText_PenaltyCostValue = (UI.getChildControl)((self._ui)._static_ConstractInfoBg, "StaticText_PenaltyCostValue")
  -- DECOMPILER ERROR at PC68: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticText_FromValue = (UI.getChildControl)((self._ui)._static_ConstractInfoBg, "StaticText_FromValue")
  -- DECOMPILER ERROR at PC76: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticText_ToValue = (UI.getChildControl)((self._ui)._static_ConstractInfoBg, "StaticText_ToValue")
  -- DECOMPILER ERROR at PC84: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticText_Title = (UI.getChildControl)((self._ui)._static_TopBg, "StaticText_TitleIcon")
  ;
  ((self._ui)._staticText_Title):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_AGREEMENT_2"))
  -- DECOMPILER ERROR at PC101: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._button_Confirm = (UI.getChildControl)((self._ui)._static_BottomBg, "Button_Confirm")
  -- DECOMPILER ERROR at PC109: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._button_Option = (UI.getChildControl)((self._ui)._static_BottomBg, "Button_Option")
  -- DECOMPILER ERROR at PC117: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._button_Close = (UI.getChildControl)((self._ui)._static_BottomBg, "Button_Close")
end

Window_GuildAgreementInfo.InitEvent = function(self)
  -- function num : 0_9
  ((self._ui)._button_Close):addInputEvent("Mouse_LUp", "PaGlobalFunc_AgreementGuild_Close()")
  ;
  ((self._ui)._button_Option):addInputEvent("Mouse_LUp", "PaGlobalFunc_AgreementGuild_SignOption_Open()")
end

PaGlobalFunc_AgreementGuild_GetIsJoin = function()
  -- function num : 0_10 , upvalues : Window_GuildAgreementInfo
  local self = Window_GuildAgreementInfo
  return self._isJoin
end

PaGlobalFunc_AgreementGuild_GetData = function()
  -- function num : 0_11 , upvalues : Window_GuildAgreementInfo
  local self = Window_GuildAgreementInfo
  return self._usableActivity, self._memberBenefit, self._memberPenalty
end

Window_GuildAgreementInfo.Initialize = function(self)
  -- function num : 0_12
  self:InitControl()
  self:InitEvent()
end

PaGlobalFunc_AgreementGuild_Master_GetShow = function()
  -- function num : 0_13
  return Panel_Console_Window_GuildAgreement:GetShow()
end

PaGlobalFunc_AgreementGuild_Open = function()
  -- function num : 0_14 , upvalues : Window_GuildAgreementInfo
  local self = Window_GuildAgreementInfo
  PaGlobalFunc_AgreementGuild_Master_SetShow(true, false)
end

PaGlobalFunc_AgreementGuild_Close = function()
  -- function num : 0_15 , upvalues : Window_GuildAgreementInfo
  local self = Window_GuildAgreementInfo
  self._memberIndex = -1
  self._isJoin = false
  self._usableActivity = nil
  self._memberIndex = -1
  self._memberBenefit = nil
  self._memberPenalty = nil
  self._targetName = nil
  self._isRenew = false
  self._targetActorKeyRaw = nil
  self._usableActivity = nil
  self._sendContractPeriod = nil
  self._sendDailyPayment = nil
  self._sendPenaltyCost = nil
  self._s64_guildNo = 0
  self._inviteGuildName = nil
  self._inviteGuildMasterFamilyName = nil
  self._inviteGuildMasterCharacterName = nil
  self._period = nil
  self._dailyPayment = nil
  self._penaltyCost = nil
  PaGlobalFunc_AgreementGuild_Master_SetShow(false, false)
end

PaGlobalFunc_AgreementGuild_Master_SetShow = function(isShow, isAni)
  -- function num : 0_16
  Panel_Console_Window_GuildAgreement:SetShow(isShow, isAni)
end

PaGlobalFunc_FromClient_GuildAgreement_luaLoadComplete = function()
  -- function num : 0_17 , upvalues : Window_GuildAgreementInfo
  local self = Window_GuildAgreementInfo
  self:Initialize()
end

registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_FromClient_GuildAgreement_luaLoadComplete")

