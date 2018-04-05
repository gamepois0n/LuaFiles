-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\guild\panel_guild_useguildfunds.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
PaGlobal_Guild_UseGuildFunds = {
_ui = {mainBG = (UI.getChildControl)(Panel_Guild_UseGuildFunds, "Static_MainBG"), btn_Close = (UI.getChildControl)(Panel_Guild_UseGuildFunds, "Button_Close"), desc = (UI.getChildControl)(Panel_Guild_UseGuildFunds, "StaticText_Desc")}
, _selectIndex = nil, _limitPrice = 0}
-- DECOMPILER ERROR at PC29: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Guild_UseGuildFunds.init = function(self)
  -- function num : 0_0 , upvalues : UI_TM
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).btn_Set = (UI.getChildControl)((self._ui).mainBG, "Button_Set")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).edit_Input = (UI.getChildControl)((self._ui).mainBG, "Edit_InputFunds")
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).chk_Unlimit = (UI.getChildControl)((self._ui).mainBG, "CheckButton_FundsLimit")
  ;
  ((self._ui).btn_Close):addInputEvent("Mouse_LUp", "PaGlobal_Guild_UseGuildFunds:ShowToggle(nil, false)")
  ;
  ((self._ui).btn_Set):addInputEvent("Mouse_LUp", "PaGlobal_Guild_UseGuildFunds:ApplyMemberPriceLimit()")
  ;
  ((self._ui).edit_Input):addInputEvent("Mouse_LUp", "PaGlobal_Guild_UseGuildFunds:SetFunds()")
  ;
  ((self._ui).chk_Unlimit):addInputEvent("Mouse_LUp", "PaGlobal_Guild_UseGuildFunds:CheckLimit()")
  ;
  ((self._ui).chk_Unlimit):SetEnableArea(0, 0, ((self._ui).chk_Unlimit):GetTextSizeX() + 40, 25)
  ;
  ((self._ui).desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((self._ui).desc):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GUILD_USEGUILDFUNDS_DESC"))
end

-- DECOMPILER ERROR at PC32: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Guild_UseGuildFunds.ShowToggle = function(self, selectIndex, isShow)
  -- function num : 0_1
  if isShow == nil then
    return 
  end
  self._limitPrice = 0
  if isShow == false then
    Panel_NumberPad_Show(false, (Defines.s64_const).s64_0, 0, nil)
  else
    local guildMember = (ToClient_GetMyGuildInfoWrapper()):getMember(selectIndex)
    local memberIsLimit = guildMember:getIsPriceLimit()
    if memberIsLimit == true then
      self._limitPrice = guildMember:getPriceLimit()
      ;
      ((self._ui).edit_Input):SetText(makeDotMoney(self._limitPrice))
      ;
      ((self._ui).edit_Input):SetIgnore(false)
      ;
      ((self._ui).chk_Unlimit):SetCheck(false)
    else
      ;
      ((self._ui).edit_Input):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_USEGUILDFUNDS_UNLIMITED"))
      ;
      ((self._ui).edit_Input):SetIgnore(true)
      ;
      ((self._ui).chk_Unlimit):SetCheck(true)
    end
  end
  do
    self._selectIndex = selectIndex
    Panel_Guild_UseGuildFunds:SetShow(isShow)
  end
end

-- DECOMPILER ERROR at PC35: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Guild_UseGuildFunds.SetFunds = function(self)
  -- function num : 0_2
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildInfo == nil then
    return 
  end
  if ((self._ui).chk_Unlimit):IsCheck() == true then
    return 
  end
  Panel_NumberPad_Show(true, myGuildInfo:getGuildBusinessFunds_s64(), 0, PaGlobal_Guild_UseGuildFunds_InputNumber)
end

-- DECOMPILER ERROR at PC38: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Guild_UseGuildFunds.CheckLimit = function(self)
  -- function num : 0_3
  self._limitPrice = 0
  if ((self._ui).chk_Unlimit):IsCheck() == true then
    ((self._ui).edit_Input):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_USEGUILDFUNDS_UNLIMITED"))
    ;
    ((self._ui).edit_Input):SetIgnore(true)
  else
    ;
    ((self._ui).edit_Input):SetText("0")
    ;
    ((self._ui).edit_Input):SetIgnore(false)
  end
end

PaGlobal_Guild_UseGuildFunds_InputNumber = function(inputNumber, param)
  -- function num : 0_4
  PaGlobal_Guild_UseGuildFunds:Update(inputNumber, param)
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Guild_UseGuildFunds.Update = function(self, inputNumber, param)
  -- function num : 0_5
  if ((self._ui).chk_Unlimit):IsCheck() == true then
    ((self._ui).edit_Input):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_USEGUILDFUNDS_UNLIMITED"))
    ;
    ((self._ui).edit_Input):SetIgnore(true)
    return 
  end
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildInfo == nil then
    return 
  end
  local limitPriceMax = myGuildInfo:getGuildBusinessFunds_s64()
  if limitPriceMax < inputNumber then
    inputNumber = limitPriceMax
  end
  self._limitPrice = inputNumber
  ;
  ((self._ui).edit_Input):SetIgnore(false)
  ;
  ((self._ui).edit_Input):SetText(makeDotMoney(self._limitPrice))
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Guild_UseGuildFunds.ApplyMemberPriceLimit = function(self)
  -- function num : 0_6
  if ((self._ui).chk_Unlimit):IsCheck() == true then
    ToClient_SetGuildMemberPriceLimit(self._selectIndex, 0, false)
  else
    ToClient_SetGuildMemberPriceLimit(self._selectIndex, self._limitPrice, true)
  end
  self:ShowToggle(nil, false)
end

PaGlobal_Guild_UseGuildFunds:init()

