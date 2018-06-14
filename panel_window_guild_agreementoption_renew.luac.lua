-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\guild\console\panel_window_guild_agreementoption_renew.luac 

-- params : ...
-- function num : 0
local Window_GuildAgreementOptionInfo = {_contractPeriod, _dailyaPayment, _penaltyCost, _usableActivity, _memberBenefit, _memberPenalty, _maxBenefitValue, _maxpenaltyCostValue; 
_ui = {_static_ButtomBg = (UI.getChildControl)(Panel_Console_Window_SignOption, "Static_BottomBg"), _static_SignContentBg = (UI.getChildControl)(Panel_Console_Window_SignOption, "Static_SignContentBg"), 
_buttonList = {}
}
, _currentContractDayIndex = -1, 
_periodValue = {[0] = 0, [1] = 1, [2] = 7, [3] = 14, [4] = 30, [5] = 180, [6] = 365}
, 
_paymentPerDay = {[0] = 0, [1] = 1000, [2] = 7000, [3] = 14000, [4] = 30000, [5] = 180000, [6] = 365000}
, 
_cancellationCharge = {[0] = 0, [1] = 500, [2] = 3500, [3] = 7000, [4] = 15000, [5] = 90000, [6] = 182500}
, _isJoin = false}
PaGlobal_CheckGuildAgreement_DaliyPaymentUiEdit = function(targetUI)
  -- function num : 0_0 , upvalues : Window_GuildAgreementOptionInfo
  do
    local self = Window_GuildAgreementOptionInfo
    do return targetUI ~= nil and targetUI:GetKey() == ((self._ui)._edit_DailyPayment):GetKey() end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

PaGlobal_CheckGuildAgreement_DaliyPaymentClearFocusEdit = function()
  -- function num : 0_1 , upvalues : Window_GuildAgreementOptionInfo
  local self = Window_GuildAgreementOptionInfo
  ;
  ((self._ui)._edit_DailyPayment):SetText("", true)
  ClearFocusEdit()
  CheckChattingInput()
end

PaGlobal_CheckGuildAgreement_PenaltyCostUiEdit = function(targetUI)
  -- function num : 0_2 , upvalues : Window_GuildAgreementOptionInfo
  do
    local self = Window_GuildAgreementOptionInfo
    do return targetUI ~= nil and targetUI:GetKey() == ((self._ui)._edit_PenaltyCost):GetKey() end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

PaGlobal_CheckGuildAgreement_PenaltyCostClearFocusEdit = function()
  -- function num : 0_3 , upvalues : Window_GuildAgreementOptionInfo
  local self = Window_GuildAgreementOptionInfo
  ;
  ((self._ui)._edit_PenaltyCost):SetText("", true)
  ClearFocusEdit()
  CheckChattingInput()
end

PaGlobalFunc_AgreementGuild_SignOption_Open = function()
  -- function num : 0_4 , upvalues : Window_GuildAgreementOptionInfo
  local self = Window_GuildAgreementOptionInfo
  self._currentContractDayIndex = -1
  self._isJoin = PaGlobalFunc_AgreementGuild_GetIsJoin()
  local usableActivity, benefit, panalty = PaGlobalFunc_AgreementGuild_GetData()
  self._usableActivity = usableActivity
  self._memberBenefit = benefit
  self._memberPenalty = panalty
  ;
  ((self._ui)._edit_DailyPayment):SetIgnore(self._isJoin)
  ;
  ((self._ui)._edit_PenaltyCost):SetIgnore(self._isJoin)
  self:SetMaxDailyPayment((self._paymentPerDay)[0], 0)
  ;
  ((self._ui)._staticText_PenaltyRange):SetText(makeDotMoney(toInt64(0, (self._cancellationCharge)[0])) .. " ~ " .. 0 .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_INCENTIVE_MONEY"))
  ;
  ((self._ui)._staticText_PenaltyRange):SetShow(not self._isJoin)
  ;
  ((self._ui)._staticText_DailyPaymentRange):SetShow(not self._isJoin)
  PaGlobalFunc_AgreementGuild_SignOption_SetShow(true, false)
end

PaGlobalFunc_AgreementGuild_SignOption_Close = function()
  -- function num : 0_5 , upvalues : Window_GuildAgreementOptionInfo
  local self = Window_GuildAgreementOptionInfo
  self._contractPeriod = -1
  self._dailyaPayment = -1
  self._penaltyCost = -1
  self._isJoin = false
  self._usableActivity = -1
  self._memberBenefit = -1
  self._memberPenalty = -1
  self._maxBenefitValue = -1
  self._maxpenaltyCostValue = -1
  ;
  ((self._ui)._edit_DailyPayment):SetEditText("")
  ;
  ((self._ui)._edit_PenaltyCost):SetEditText("")
  for index = 0, #(self._ui)._buttonList do
    (((self._ui)._buttonList)[index]):SetCheck(false)
  end
  PaGlobalFunc_AgreementGuild_SignOption_SetShow(false, true)
end

PaGlobalFunc_AgreementGuild_SignOption_GetShow = function()
  -- function num : 0_6
  return Panel_Console_Window_SignOption:GetShow()
end

PaGlobalFunc_AgreementGuild_SignOption_SetShow = function(isShow, isAni)
  -- function num : 0_7
  Panel_Console_Window_SignOption:SetShow(isShow, isAni)
end

Window_GuildAgreementOptionInfo.InitControl = function(self)
  -- function num : 0_8
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._button_Confirm = (UI.getChildControl)((self._ui)._static_ButtomBg, "Button_Confirm")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._button_Close = (UI.getChildControl)((self._ui)._static_ButtomBg, "Button_Close")
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._buttonList)[0] = (UI.getChildControl)((self._ui)._static_SignContentBg, "RadioButton_0D")
  -- DECOMPILER ERROR at PC33: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._buttonList)[1] = (UI.getChildControl)((self._ui)._static_SignContentBg, "RadioButton_1D")
  -- DECOMPILER ERROR at PC42: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._buttonList)[2] = (UI.getChildControl)((self._ui)._static_SignContentBg, "RadioButton_7D")
  -- DECOMPILER ERROR at PC51: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._buttonList)[3] = (UI.getChildControl)((self._ui)._static_SignContentBg, "RadioButton_15D")
  -- DECOMPILER ERROR at PC60: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._buttonList)[4] = (UI.getChildControl)((self._ui)._static_SignContentBg, "RadioButton_30D")
  -- DECOMPILER ERROR at PC69: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._buttonList)[5] = (UI.getChildControl)((self._ui)._static_SignContentBg, "RadioButton_90D")
  -- DECOMPILER ERROR at PC78: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._buttonList)[6] = (UI.getChildControl)((self._ui)._static_SignContentBg, "RadioButton_365D")
  for index = 0, #(self._ui)._buttonList do
    (((self._ui)._buttonList)[index]):SetText((self._periodValue)[index] .. PAGetString(Defines.StringSheet_RESOURCE, "STABLE_INFO_TEXT_LIFETIME"))
  end
  -- DECOMPILER ERROR at PC106: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._edit_DailyPayment = (UI.getChildControl)((self._ui)._static_SignContentBg, "Edit_DailyPayment")
  -- DECOMPILER ERROR at PC114: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._edit_PenaltyCost = (UI.getChildControl)((self._ui)._static_SignContentBg, "Edit_PenaltyCost")
  -- DECOMPILER ERROR at PC122: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticText_DailyPaymentRange = (UI.getChildControl)((self._ui)._static_SignContentBg, "StaticText_DailyPaymentRange")
  -- DECOMPILER ERROR at PC130: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticText_PenaltyRange = (UI.getChildControl)((self._ui)._static_SignContentBg, "StaticText_PenaltyRange")
end

Window_GuildAgreementOptionInfo.InitEvent = function(self)
  -- function num : 0_9
  ((self._ui)._button_Confirm):addInputEvent("Mouse_LUp", "PaGlobalFunc_AgreementGuild_SignOption_Confirm()")
  ;
  ((self._ui)._button_Close):addInputEvent("Mouse_LUp", "PaGlobalFunc_AgreementGuild_SignOption_Close()")
  for index = 0, #(self._ui)._buttonList do
    (((self._ui)._buttonList)[index]):addInputEvent("Mouse_LUp", "PaGlobalFunc_AgreementGuild_SignOption_ContractDaySetData(" .. index .. ")")
  end
  ;
  ((self._ui)._edit_DailyPayment):addInputEvent("Mouse_LUp", "PaGlobalFunc_AgreementGuild_SignOption_DailyPayEditClick()")
  ;
  ((self._ui)._edit_PenaltyCost):addInputEvent("Mouse_LUp", "PaGlobalFunc_AgreementGuild_SignOption_PenaltyEditClick()")
end

PaGlobalFunc_AgreementGuild_SignOption_DailyPayEditClick = function()
  -- function num : 0_10 , upvalues : Window_GuildAgreementOptionInfo
  local self = Window_GuildAgreementOptionInfo
  ClearFocusEdit()
  local maxBenefit = nil
  if self._maxBenefitValue == nil then
    maxBenefit = 0
  else
    maxBenefit = (math.min)(tonumber(self._maxBenefitValue), tonumber((CppEnums.GuildBenefit).eMaxContractedBenefit))
  end
  Panel_NumberPad_Show(true, (toInt64(0, maxBenefit)), nil, PaGlobalFunc_AgreementGuild_SignOption_DailyPayComfirm, nil, nil, nil, nil, toInt64(0, maxBenefit))
  Panel_NumberPad_SetType("Guild_AgreementOption")
end

PaGlobalFunc_AgreementGuild_SignOption_DailyPayComfirm = function(inputNumber, param)
  -- function num : 0_11 , upvalues : Window_GuildAgreementOptionInfo
  local self = Window_GuildAgreementOptionInfo
  ;
  ((self._ui)._edit_DailyPayment):SetEditText(Int64toInt32(inputNumber))
end

PaGlobalFunc_AgreementGuild_SignOption_PenaltyEditClick = function()
  -- function num : 0_12 , upvalues : Window_GuildAgreementOptionInfo
  local self = Window_GuildAgreementOptionInfo
  ClearFocusEdit()
  local maxpenalty = nil
  if self._maxpenaltyCostValue == nil then
    maxpenalty = 0
  else
    maxpenalty = self._maxpenaltyCostValue
  end
  Panel_NumberPad_Show(true, toInt64(0, maxpenalty), param, PaGlobalFunc_AgreementGuild_SignOption_PenaltyComfirm, nil, nil, nil, nil, toInt64(0, maxpenalty))
  Panel_NumberPad_SetType("Guild_AgreementOption")
end

PaGlobalFunc_AgreementGuild_SignOption_PenaltyComfirm = function(inputNumber, param)
  -- function num : 0_13 , upvalues : Window_GuildAgreementOptionInfo
  local self = Window_GuildAgreementOptionInfo
  ;
  ((self._ui)._edit_PenaltyCost):SetEditText(Int64toInt32(inputNumber))
end

PaGlobalFunc_AgreementGuild_SignOption_Confirm = function()
  -- function num : 0_14 , upvalues : Window_GuildAgreementOptionInfo
  local self = Window_GuildAgreementOptionInfo
  local dailyPaymentValue = tonumber(((self._ui)._edit_DailyPayment):GetEditText())
  local penaltyCostValue = tonumber(((self._ui)._edit_PenaltyCost):GetEditText())
  if dailyPaymentValue == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_AGREEMENTGUILD_MASTER_DAILYMONEY"))
    return 
  end
  if penaltyCostValue == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_AGREEMENTGUILD_MASTER_PENALTIES"))
    return 
  end
  if self._currentContractDayIndex == -1 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_AGREEMENTGUILD_MASTER_PERIOD_EDIT"))
    return 
  end
  if self._isJoin == false then
    if dailyPaymentValue < (self._paymentPerDay)[self._currentContractDayIndex] then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_AGREEMENTGUILD_MASTER_DAILYMONEY_LESS"))
      return 
    else
      if self._maxBenefitValue < dailyPaymentValue then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_AGREEMENTGUILD_MASTER_DAILYMONEY_TOOMUCH"))
        return 
      else
        if penaltyCostValue < (self._cancellationCharge)[self._currentContractDayIndex] then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_AGREEMENTGUILD_MASTER_BREACH_LESS"))
          return 
        else
          if self._maxpenaltyCostValue < penaltyCostValue then
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_AGREEMENTGUILD_MASTER_BREACH_TOOMUCH"))
            return 
          end
        end
      end
    end
  end
  PaGlobalFunc_AgreementGuild_AgreementSetData((self._periodValue)[self._currentContractDayIndex], dailyPaymentValue, penaltyCostValue)
  PaGlobalFunc_AgreementGuild_SignOption_Close()
end

PaGlobalFunc_AgreementGuild_SignOption_ContractDaySetData = function(index)
  -- function num : 0_15 , upvalues : Window_GuildAgreementOptionInfo
  local self = Window_GuildAgreementOptionInfo
  self._currentContractDayIndex = index
  if self._isJoin == true then
    ((self._ui)._edit_DailyPayment):SetEditText((self._paymentPerDay)[index])
    ;
    ((self._ui)._edit_PenaltyCost):SetEditText((self._cancellationCharge)[index])
  else
    local usableActivity = self._usableActivity
    local tempBenefit32 = Int64toInt32(self._memberBenefit)
    local tempPenalty32 = Int64toInt32(self._memberPenalty)
    local useBenefit = 0
    if tempBenefit32 < (self._paymentPerDay)[index] then
      useBenefit = (self._paymentPerDay)[index]
    else
      useBenefit = tempBenefit32
    end
    local usePenalty = 0
    if tempPenalty32 < (self._cancellationCharge)[index] then
      usePenalty = (self._cancellationCharge)[index]
    else
      usePenalty = tempPenalty32
    end
    self._maxBenefitValue = useBenefit + useBenefit * (usableActivity / 100 / 100)
    self._maxpenaltyCostValue = usePenalty + usePenalty * (usableActivity / 100 / 100)
    self:SetMaxDailyPayment((self._paymentPerDay)[index], self._maxBenefitValue)
    ;
    ((self._ui)._staticText_PenaltyRange):SetText(makeDotMoney(toInt64(0, (self._cancellationCharge)[index])) .. " ~ " .. makeDotMoney(toInt64(0, self._maxpenaltyCostValue)) .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_INCENTIVE_MONEY"))
    ;
    ((self._ui)._edit_DailyPayment):SetEditText(tostring((self._paymentPerDay)[index]))
    ;
    ((self._ui)._edit_PenaltyCost):SetEditText(tostring((self._cancellationCharge)[index]))
  end
end

Window_GuildAgreementOptionInfo.SetMaxDailyPayment = function(self, checkIndex, benefitMax)
  -- function num : 0_16 , upvalues : Window_GuildAgreementOptionInfo
  local self = Window_GuildAgreementOptionInfo
  local maxBenefit = (math.min)(tonumber(benefitMax), tonumber((CppEnums.GuildBenefit).eMaxContractedBenefit))
  ;
  ((self._ui)._staticText_DailyPaymentRange):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_AGREEMENTGUILD_MASTER_MAXDAILYPAYMENT", "checkedIndex", makeDotMoney(toInt64(0, checkIndex)), "maxBenefitValue", makeDotMoney(maxBenefit)))
end

Window_GuildAgreementOptionInfo.Initialize = function(self)
  -- function num : 0_17
  self:InitControl()
  self:InitEvent()
end

PaGlobalFunc_FromClient_GuildAgreementOption_luaLoadComplete = function()
  -- function num : 0_18 , upvalues : Window_GuildAgreementOptionInfo
  local self = Window_GuildAgreementOptionInfo
  self:Initialize()
end

registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_FromClient_GuildAgreementOption_luaLoadComplete")

