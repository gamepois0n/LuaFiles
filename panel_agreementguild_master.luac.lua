-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\guild\panel_agreementguild_master.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
local UI_TM = CppEnums.TextMode
local UCT = CppEnums.PA_UI_CONTROL_TYPE
Panel_AgreementGuild_Master:SetShow(false)
local _memberIndex = -1
local _isJoin = false
local _targetActorKeyRaw = 0
local _targetName = ""
local isRenew = false
local AgreementGuild_Master = {btn_Send = (UI.getChildControl)(Panel_AgreementGuild_Master, "Button_Confirm"), btn_Refuse = (UI.getChildControl)(Panel_AgreementGuild_Master, "Button_Refuse"), btn_Close = (UI.getChildControl)(Panel_AgreementGuild_Master, "Button_Close"), title = (UI.getChildControl)(Panel_AgreementGuild_Master, "StaticText_AgreementContentTitle"), content = (UI.getChildControl)(Panel_AgreementGuild_Master, "StaticText_AgreementContent"), radioBtnPeriod = (UI.getChildControl)(Panel_AgreementGuild_Master, "RadioButton_Period"), penaltyCostTitle = (UI.getChildControl)(Panel_AgreementGuild_Master, "StaticText_PenaltyCost"), dailyPaymentTitle = (UI.getChildControl)(Panel_AgreementGuild_Master, "StaticText_DailyPayment"), remainPeriodTitle = (UI.getChildControl)(Panel_AgreementGuild_Master, "StaticText_Period"), remainPeriod = (UI.getChildControl)(Panel_AgreementGuild_Master, "StaticText_PeriodValue"), dailyPayment = (UI.getChildControl)(Panel_AgreementGuild_Master, "StaticText_PaymentValue"), penaltyCost = (UI.getChildControl)(Panel_AgreementGuild_Master, "StaticText_PenaltyCostValue"), btnRenew = (UI.getChildControl)(Panel_AgreementGuild_Master, "Button_Period_Renew"), from = (UI.getChildControl)(Panel_AgreementGuild_Master, "StaticText_From"), to = (UI.getChildControl)(Panel_AgreementGuild_Master, "StaticText_To"), guildMark = (UI.getChildControl)(Panel_AgreementGuild_Master, "Static_GuildMark"), dailyPayment_edit = (UI.getChildControl)(Panel_AgreementGuild_Master, "Edit_Payment"), penaltyCost_edit = (UI.getChildControl)(Panel_AgreementGuild_Master, "Edit_PenaltyCost"), contractPeriod_edit = (UI.getChildControl)(Panel_AgreementGuild_Master, "Edit_ContractPeriod"), memberBenefit = 0, memberPenalty = 0, maxDailyPayment = (UI.getChildControl)(Panel_AgreementGuild_Master, "StaticText_MaxPayment"), maxpenaltyCost = (UI.getChildControl)(Panel_AgreementGuild_Master, "StaticText_MaxPenaltyCost"), _frame = (UI.getChildControl)(Panel_AgreementGuild_Master, "Frame_1"), usableActivity = 0, maxBenefitValue = 0, maxpenaltyCostValue = 0}
_frame_Content = (UI.getChildControl)(AgreementGuild_Master._frame, "Frame_1_Content")
_frame_Summary = (UI.getChildControl)(_frame_Content, "StaticText_1")
local periodValue = {[0] = 0, [1] = 1, [2] = 7, [3] = 14, [4] = 30}
local paymentPerDay = {[0] = 0, [1] = 1000, [2] = 7000, [3] = 14000, [4] = 30000}
local cancellationCharge = {[0] = 0, [1] = 500, [2] = 3500, [3] = 7000, [4] = 15000}
AgreementGuild_Master._radioBtn_Period = {}
for index = 0, 4 do
  -- DECOMPILER ERROR at PC191: Confused about usage of register: R16 in 'UnsetPending'

  (AgreementGuild_Master._radioBtn_Period)[index] = {}
  -- DECOMPILER ERROR at PC201: Confused about usage of register: R16 in 'UnsetPending'

  ;
  (AgreementGuild_Master._radioBtn_Period)[index] = (UI.createControl)(UCT.PA_UI_CONTROL_RADIOBUTTON, Panel_AgreementGuild_Master, "RadioButton_Period_" .. index)
  CopyBaseProperty(AgreementGuild_Master.radioBtnPeriod, (AgreementGuild_Master._radioBtn_Period)[index])
  ;
  ((AgreementGuild_Master._radioBtn_Period)[index]):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_AGREEMENT_MASTER_DAY", "day", periodValue[index]))
  ;
  ((AgreementGuild_Master._radioBtn_Period)[index]):SetPosX(((AgreementGuild_Master.radioBtnPeriod):GetPosX() + 150) * index)
  ;
  ((AgreementGuild_Master._radioBtn_Period)[index]):SetPosY(480)
  ;
  ((AgreementGuild_Master._radioBtn_Period)[index]):SetShow(false)
  ;
  ((AgreementGuild_Master._radioBtn_Period)[index]):addInputEvent("Mouse_LUp", "HandleClicked_AgreementGuild_Master_SetData(" .. index .. ")")
end
HandleClicked_AgreementGuild_Master_SetData = function(index)
  -- function num : 0_0 , upvalues : AgreementGuild_Master, _isJoin, paymentPerDay, cancellationCharge
  local self = AgreementGuild_Master
  ;
  ((self._radioBtn_Period)[index]):SetCheck(true)
  if _isJoin then
    (self.dailyPayment):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_AGREEMENT_MASTER_MONEY", "money", makeDotMoney(paymentPerDay[index])))
    ;
    (self.penaltyCost):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_AGREEMENT_MASTER_MONEY", "money", makeDotMoney(cancellationCharge[index])))
  else
    local usableActivity = self.usableActivity
    local tempBenefit32 = Int64toInt32(self.memberBenefit)
    local tempPenalty32 = Int64toInt32(self.memberPenalty)
    local useBenefit = 0
    if tempBenefit32 < paymentPerDay[index] then
      useBenefit = paymentPerDay[index]
    else
      useBenefit = tempBenefit32
    end
    local usePenalty = 0
    if tempPenalty32 < cancellationCharge[index] then
      usePenalty = cancellationCharge[index]
    else
      usePenalty = tempPenalty32
    end
    self.maxBenefitValue = useBenefit + useBenefit * (usableActivity / 100 / 100)
    self.maxpenaltyCostValue = usePenalty + usePenalty * (usableActivity / 100 / 100)
    AgreementGuild_SetMaxDailyPayment(paymentPerDay[index], self.maxBenefitValue)
    ;
    (self.maxpenaltyCost):SetText(makeDotMoney(toInt64(0, cancellationCharge[index])) .. " ~ " .. makeDotMoney(toInt64(0, self.maxpenaltyCostValue)) .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_INCENTIVE_MONEY"))
    ;
    (self.dailyPayment_edit):SetEditText(tostring(self.memberBenefit))
    ;
    (self.penaltyCost_edit):SetEditText(tostring(self.memberPenalty))
  end
end

AgreementGuild_Master.Initialize = function(self)
  -- function num : 0_1 , upvalues : AgreementGuild_Master
  AgreementGuild_Master:registEventHandler()
  _frame_Summary:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  if isGameTypeEnglish() then
    (self.dailyPayment_edit):SetSpanSize(180, ((self.dailyPayment_edit):GetSpanSize()).y)
    ;
    (self.penaltyCost_edit):SetSpanSize(180, ((self.penaltyCost_edit):GetSpanSize()).y)
    ;
    (self.penaltyCostTitle):SetSpanSize(50, ((self.penaltyCostTitle):GetSpanSize()).y)
    ;
    (self.dailyPaymentTitle):SetSpanSize(50, ((self.dailyPaymentTitle):GetSpanSize()).y)
    ;
    (self.remainPeriodTitle):SetSpanSize(50, ((self.remainPeriodTitle):GetSpanSize()).y)
  else
    ;
    (self.dailyPayment_edit):SetSpanSize(170, ((self.dailyPayment_edit):GetSpanSize()).y)
    ;
    (self.penaltyCost_edit):SetSpanSize(170, ((self.penaltyCost_edit):GetSpanSize()).y)
    ;
    (self.penaltyCostTitle):SetSpanSize(75, ((self.penaltyCostTitle):GetSpanSize()).y)
    ;
    (self.dailyPaymentTitle):SetSpanSize(75, ((self.dailyPaymentTitle):GetSpanSize()).y)
    ;
    (self.remainPeriodTitle):SetSpanSize(75, ((self.remainPeriodTitle):GetSpanSize()).y)
  end
end

AgreementGuild_Master.Update = function(self)
  -- function num : 0_2 , upvalues : UI_TM
  local guildWrapper = ToClient_GetMyGuildInfoWrapper()
  local guildName = guildWrapper:getName()
  ;
  (self.title):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_AGREEMENT_MASTER_CONTRACT", "guildName", guildName))
  ;
  (self.content):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self.content):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_AGREEMENT_3"))
  ;
  (self.content):SetShow(false)
  local isSet = setGuildTextureByGuildNo(guildWrapper:getGuildNo_s64(), self.guildMark)
  if isSet == false then
    (self.guildMark):ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Buttons.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(self.guildMark, 183, 1, 188, 6)
    ;
    ((self.guildMark):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    (self.guildMark):setRenderTexture((self.guildMark):getBaseTexture())
  else
    do
      ;
      ((self.guildMark):getBaseTexture()):setUV(0, 0, 1, 1)
      ;
      (self.guildMark):setRenderTexture((self.guildMark):getBaseTexture())
      _frame_Summary:SetAutoResize()
      _frame_Summary:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_AGREEMENT_3"))
      _frame_Content:SetSize(_frame_Content:GetSizeX(), _frame_Summary:GetTextSizeY())
      ;
      (self._frame):UpdateContentPos()
      if _frame_Content:GetSizeY() < (self._frame):GetSizeY() then
        ((self._frame):GetVScroll()):SetShow(false)
      else
        ;
        ((self._frame):GetVScroll()):SetShow(true)
      end
    end
  end
end

AgreementGuild_Master.SetPosition = function(self)
  -- function num : 0_3
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_AgreementGuild_Master:GetSizeX()
  local panelSizeY = Panel_AgreementGuild_Master:GetSizeY()
  Panel_AgreementGuild_Master:SetPosX(scrSizeX / 2 - panelSizeX / 2)
  Panel_AgreementGuild_Master:SetPosY(scrSizeY / 2 - panelSizeY / 2)
end

AgreementGuild_Master.SetShowContractPreSet = function(self, isShow)
  -- function num : 0_4 , upvalues : AgreementGuild_Master, _isJoin, periodValue
  local self = AgreementGuild_Master
  local usableActivity = self.usableActivity
  local startRadioIndex = 0
  if _isJoin == true then
    startRadioIndex = 0
  else
    startRadioIndex = 1
  end
  local sumIndex = 0
  for index = startRadioIndex, #periodValue do
    ((self._radioBtn_Period)[index]):SetPosX((self.radioBtnPeriod):GetPosX() + 80 * sumIndex)
    ;
    ((self._radioBtn_Period)[index]):SetShow(true)
    ;
    ((self._radioBtn_Period)[index]):SetCheck(false)
    sumIndex = sumIndex + 1
  end
  ;
  (self.dailyPayment):SetShow(true)
  ;
  (self.penaltyCost):SetShow(true)
  if isShow then
    HandleClicked_AgreementGuild_Master_SetData(#periodValue)
  end
  ;
  (self.dailyPayment_edit):SetShow(not isShow)
  ;
  (self.penaltyCost_edit):SetShow(not isShow)
  ;
  (self.maxDailyPayment):SetShow(not isShow)
  ;
  (self.maxpenaltyCost):SetShow(not isShow)
  ;
  (self.contractPeriod_edit):SetShow(false)
end

AgreementGuild_Master.SetHideContractControl = function(self)
  -- function num : 0_5 , upvalues : AgreementGuild_Master, periodValue
  local self = AgreementGuild_Master
  for i = 0, #periodValue do
    ((self._radioBtn_Period)[i]):SetShow(false)
    ;
    ((self._radioBtn_Period)[i]):SetCheck(false)
  end
  ;
  (self.dailyPayment_edit):SetShow(false)
  ;
  (self.penaltyCost_edit):SetShow(false)
  ;
  (self.contractPeriod_edit):SetShow(false)
  ;
  (self.maxDailyPayment):SetShow(false)
  ;
  (self.maxpenaltyCost):SetShow(false)
end

FGlobal_AgreementGuild_Master_Open_ForJoin = function(targetKeyRaw, targetName, preGuildActivity)
  -- function num : 0_6 , upvalues : _targetActorKeyRaw, _isJoin, _targetName, AgreementGuild_Master
  _targetActorKeyRaw = targetKeyRaw
  _isJoin = true
  _targetName = targetName
  local self = AgreementGuild_Master
  local textTemp = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_AGREEMENTGUILD_MASTER_FORJOIN", "targetName", targetName)
  ;
  (self.to):SetText(textTemp)
  ;
  (self.btn_Send):SetShow(true)
  ;
  (self.btn_Refuse):SetShow(true)
  ;
  (self.btn_Close):SetShow(false)
  ;
  (self.remainPeriod):SetShow(false)
  self:SetShowContractPreSet(true)
  ;
  (self.btnRenew):SetShow(false)
  AgreementGuild_Master:Update()
  AgreementGuild_Master:SetPosition()
  Panel_AgreementGuild_Master:SetShow(true)
end

FGlobal_AgreementGuild_Master_Open = function(memberIndex, requesterMemberGrade, usableActivity)
  -- function num : 0_7 , upvalues : AgreementGuild_Master, _isJoin, _memberIndex, _targetName, isRenew
  local self = AgreementGuild_Master
  _isJoin = false
  if usableActivity > 10000 then
    usableActivity = 10000
  end
  self.usableActivity = usableActivity
  local memberInfo = (ToClient_GetMyGuildInfoWrapper()):getMember(memberIndex)
  if memberInfo == nil then
    _PA_ASSERT(false, "FGlobal_AgreementGuild_Master_Open �\152 멤버인덱스가 비정상입니다 " .. tostring(memberIndex))
  end
  _memberIndex = memberIndex
  local name = memberInfo:getName()
  local expiration = memberInfo:getContractedExpirationUtc()
  self.memberBenefit = memberInfo:getContractedBenefit()
  self.memberPenalty = memberInfo:getContractedPenalty()
  local temp1 = nil
  if Int64toInt32(getLeftSecond_TTime64(expiration)) > 0 then
    temp1 = convertStringFromDatetime(getLeftSecond_TTime64(expiration))
  else
    temp1 = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_AGREEMENT_MASTER_REMAINPERIOD")
  end
  self:SetHideContractControl()
  ;
  (self.remainPeriod):SetShow(true)
  ;
  (self.remainPeriod):SetText(temp1)
  ;
  (self.dailyPayment):SetShow(true)
  ;
  (self.penaltyCost):SetShow(true)
  ;
  (self.dailyPayment):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_AGREEMENT_MASTER_MONEY", "money", makeDotMoney(self.memberBenefit)))
  ;
  (self.penaltyCost):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_AGREEMENT_MASTER_MONEY", "money", makeDotMoney(self.memberPenalty)))
  _targetName = name
  local textTemp = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_AGREEMENTGUILD_MASTER_FORJOIN", "targetName", name)
  ;
  (self.to):SetText(textTemp)
  ;
  (self.btn_Send):SetShow(false)
  ;
  (self.btn_Refuse):SetShow(false)
  ;
  (self.btn_Close):SetShow(true)
  isRenew = false
  local contractAble = memberInfo:getContractableUtc()
  do
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
    (self.btnRenew):SetShow(isRenew)
    AgreementGuild_Master:Update()
    AgreementGuild_Master:SetPosition()
    Panel_AgreementGuild_Master:SetShow(true)
    -- DECOMPILER ERROR: 4 unprocessed JMP targets
  end
end

agreementGuild_Master_Close = function()
  -- function num : 0_8 , upvalues : IM
  if not Panel_AgreementGuild_Master:GetShow() then
    return 
  end
  Panel_AgreementGuild_Master:SetShow(false)
  ClearFocusEdit()
  if AllowChangeInputMode() then
    if (UI.checkShowWindow)() then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    else
      ;
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
    end
  else
    SetFocusChatting()
  end
end

agreementGuild_Master_Send = function()
  -- function num : 0_9 , upvalues : AgreementGuild_Master, periodValue, paymentPerDay, cancellationCharge, _isJoin, _targetName, _memberIndex
  local self = AgreementGuild_Master
  local value_ContractPeriod, value_DailyPayment, value_PenaltyCost = nil, nil, nil
  if (self.dailyPayment_edit):GetShow() then
    value_DailyPayment = tonumber((self.dailyPayment_edit):GetEditText())
    value_PenaltyCost = tonumber((self.penaltyCost_edit):GetEditText())
    if value_DailyPayment == nil then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_AGREEMENTGUILD_MASTER_DAILYMONEY"))
      return 
    end
    if value_PenaltyCost == nil then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_AGREEMENTGUILD_MASTER_PENALTIES"))
      return 
    end
  else
    for i = 0, #periodValue do
      if ((self._radioBtn_Period)[i]):IsCheck() then
        value_ContractPeriod = periodValue[i]
        value_DailyPayment = paymentPerDay[i]
        value_PenaltyCost = cancellationCharge[i]
      end
    end
  end
  do
    for i = 0, #periodValue do
      if ((self._radioBtn_Period)[i]):IsCheck() then
        value_ContractPeriod = periodValue[i]
      end
    end
    if value_ContractPeriod == nil then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_AGREEMENTGUILD_MASTER_PERIOD_EDIT"))
      return 
    end
    if _isJoin == false then
      if value_ContractPeriod <= 0 then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_AGREEMENTGUILD_MASTER_PERIOD_EDIT"))
        return 
      end
      local checkedIndex = _AgreementGuild_Master_ReturnCheckedNum()
      if value_DailyPayment < paymentPerDay[checkedIndex] then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_AGREEMENTGUILD_MASTER_DAILYMONEY_LESS"))
        return 
      else
        if self.maxBenefitValue < value_DailyPayment then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_AGREEMENTGUILD_MASTER_DAILYMONEY_TOOMUCH"))
          return 
        else
          if value_PenaltyCost < cancellationCharge[checkedIndex] then
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_AGREEMENTGUILD_MASTER_BREACH_LESS"))
            return 
          else
            if self.maxpenaltyCostValue < value_PenaltyCost then
              Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_AGREEMENTGUILD_MASTER_BREACH_TOOMUCH"))
              return 
            end
          end
        end
      end
    end
    do
      if _isJoin then
        toClient_RequestInviteGuild(_targetName, value_ContractPeriod, value_DailyPayment, value_PenaltyCost)
      else
        ToClient_SuggestGuildContract(_memberIndex, value_ContractPeriod, value_DailyPayment, value_PenaltyCost)
      end
      agreementGuild_Master_Close()
    end
  end
end

FromClient_Agreement_Result = function()
  -- function num : 0_10 , upvalues : AgreementGuild_Master, _targetName
  local self = AgreementGuild_Master
  Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_AGREEMENT_MASTER_ACK_MSG", "familyName", _targetName))
end

HandleClicked_AgreementGuild_Master_SetEditBox = function(type)
  -- function num : 0_11 , upvalues : AgreementGuild_Master, IM
  local self = AgreementGuild_Master
  local control = nil
  if type == 0 then
    control = self.dailyPayment_edit
  else
    if type == 1 then
      control = self.penaltyCost_edit
    else
      if type == 2 then
        control = self.contractPeriod_edit
      end
    end
  end
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  control:SetEditText("", true)
end

_AgreementGuild_Master_ReturnCheckedNum = function()
  -- function num : 0_12 , upvalues : AgreementGuild_Master, periodValue
  local self = AgreementGuild_Master
  for idx = 1, #periodValue do
    local isCheck = ((self._radioBtn_Period)[idx]):IsCheck()
    if isCheck == true then
      return idx
    end
  end
end

HandleClicked_AgreementGuild_Master_Renew = function()
  -- function num : 0_13 , upvalues : AgreementGuild_Master, _memberIndex, paymentPerDay, cancellationCharge
  local self = AgreementGuild_Master
  local usableActivity = self.usableActivity
  local memberInfo = (ToClient_GetMyGuildInfoWrapper()):getMember(_memberIndex)
  if memberInfo == nil then
    _PA_ASSERT(false, "FGlobal_AgreementGuild_Master_Open �\152 멤버인덱스가 비정상입니다 " .. tostring(memberIndex))
  end
  local name = memberInfo:getName()
  local expiration = memberInfo:getContractedExpirationUtc()
  self.memberBenefit = memberInfo:getContractedBenefit()
  self.memberPenalty = memberInfo:getContractedPenalty()
  local temp1 = nil
  if Int64toInt32(getLeftSecond_TTime64(expiration)) > 0 then
    temp1 = convertStringFromDatetime(getLeftSecond_TTime64(expiration))
  else
    temp1 = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_AGREEMENT_MASTER_REMAINPERIOD")
  end
  ;
  (self.remainPeriod):SetShow(false)
  local tempBenefit32 = Int64toInt32(self.memberBenefit)
  local tempPenalty32 = Int64toInt32(self.memberPenalty)
  self:SetShowContractPreSet(false)
  ;
  (self.dailyPayment_edit):SetEditText(tostring(tempBenefit32))
  ;
  (self.penaltyCost_edit):SetEditText(tostring(tempPenalty32))
  ;
  ((self._radioBtn_Period)[4]):SetCheck(true)
  local checkedIndex = _AgreementGuild_Master_ReturnCheckedNum()
  local useBenefit = 0
  if tempBenefit32 < paymentPerDay[checkedIndex] then
    useBenefit = paymentPerDay[checkedIndex]
  else
    useBenefit = tempBenefit32
  end
  local usePenalty = 0
  if tempPenalty32 < cancellationCharge[checkedIndex] then
    usePenalty = cancellationCharge[checkedIndex]
  else
    usePenalty = tempPenalty32
  end
  self.maxBenefitValue = useBenefit + useBenefit * (usableActivity / 100 / 100)
  self.maxpenaltyCostValue = usePenalty + usePenalty * (usableActivity / 100 / 100)
  AgreementGuild_SetMaxDailyPayment(paymentPerDay[checkedIndex], self.maxBenefitValue)
  ;
  (self.maxpenaltyCost):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_AGREEMENTGUILD_MASTER_MAXDAILYPAYMENT", "checkedIndex", makeDotMoney(toInt64(0, cancellationCharge[checkedIndex])), "maxpenaltyCostValue", makeDotMoney(toInt64(0, self.maxpenaltyCostValue))))
  ;
  (self.dailyPayment):SetShow(false)
  ;
  (self.penaltyCost):SetShow(false)
  ;
  (self.btn_Close):SetShow(false)
  ;
  (self.btnRenew):SetShow(false)
  ;
  (self.btn_Send):SetShow(true)
  ;
  (self.btn_Refuse):SetShow(true)
end

AgreementGuild_Master.registEventHandler = function(self)
  -- function num : 0_14
  (self.btn_Send):addInputEvent("Mouse_LUp", "agreementGuild_Master_Send()")
  ;
  (self.btn_Refuse):addInputEvent("Mouse_LUp", "agreementGuild_Master_Close()")
  ;
  (self.btn_Close):addInputEvent("Mouse_LUp", "agreementGuild_Master_Close()")
  ;
  (self.btnRenew):addInputEvent("Mouse_LUp", "HandleClicked_AgreementGuild_Master_Renew()")
  ;
  (self.dailyPayment_edit):addInputEvent("Mouse_LUp", "HandleClicked_AgreementGuild_Master_SetEditBox(" .. 0 .. ")")
  ;
  (self.penaltyCost_edit):addInputEvent("Mouse_LUp", "HandleClicked_AgreementGuild_Master_SetEditBox(" .. 1 .. ")")
  ;
  (self.contractPeriod_edit):addInputEvent("Mouse_LUp", "HandleClicked_AgreementGuild_Master_SetEditBox(" .. 2 .. ")")
end

AgreementGuild_Master.registMessageHandler = function(self)
  -- function num : 0_15
end

AgreementGuild_SetMaxDailyPayment = function(checkIndex, benefitMax)
  -- function num : 0_16 , upvalues : AgreementGuild_Master
  local self = AgreementGuild_Master
  local maxBenefit = (math.min)(tonumber(benefitMax), tonumber((CppEnums.GuildBenefit).eMaxContractedBenefit))
  ;
  (self.maxDailyPayment):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_AGREEMENTGUILD_MASTER_MAXDAILYPAYMENT", "checkedIndex", makeDotMoney(toInt64(0, checkIndex)), "maxBenefitValue", makeDotMoney(maxBenefit)))
end

AgreementGuild_Master:Initialize()

