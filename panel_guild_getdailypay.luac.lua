-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\guild\panel_guild_getdailypay.luac 

-- params : ...
-- function num : 0
local getDailyPay = {_btn_GetMoney = (UI.getChildControl)(Panel_Guild_GetDailyPay, "Button_GetMoney"), _btn_Cancel = (UI.getChildControl)(Panel_Guild_GetDailyPay, "Button_Cancel"), _rdo_Inven = (UI.getChildControl)(Panel_Guild_GetDailyPay, "RadioButton_Inven"), _rdo_Warehouse = (UI.getChildControl)(Panel_Guild_GetDailyPay, "RadioButton_Warehouse")}
GetDailyPay_Init = function()
  -- function num : 0_0 , upvalues : getDailyPay
  local self = getDailyPay
  ;
  (self._rdo_Inven):SetCheck(true)
  ;
  (self._rdo_Warehouse):SetCheck(false)
end

GetDailyPay_Execute = function()
  -- function num : 0_1 , upvalues : getDailyPay
  local self = getDailyPay
  local isInven = (self._rdo_Inven):IsCheck()
  local isWarehouse = (self._rdo_Warehouse):IsCheck()
  local isGetCheck = false
  if isInven then
    isGetCheck = false
  else
    if isWarehouse then
      isGetCheck = true
    end
  end
  ToClient_TakeMyGuildBenefit(isGetCheck)
  FGlobal_GetDailyPay_Hide()
end

FGlobal_GetDailyPay_Show = function()
  -- function num : 0_2 , upvalues : getDailyPay
  local self = getDailyPay
  if not Panel_Guild_GetDailyPay:GetShow() then
    Panel_Guild_GetDailyPay:SetShow(true)
    ;
    (self._rdo_Inven):SetCheck(true)
    ;
    (self._rdo_Warehouse):SetCheck(false)
  end
end

FGlobal_GetDailyPay_Hide = function()
  -- function num : 0_3
  Panel_Guild_GetDailyPay:SetShow(false)
end

FGlobal_GetDailyPay_WarehouseCheckReturn = function()
  -- function num : 0_4 , upvalues : getDailyPay
  return (getDailyPay._rdo_Warehouse):IsCheck()
end

GetDailyPay_Event = function()
  -- function num : 0_5 , upvalues : getDailyPay
  local self = getDailyPay
  ;
  (self._btn_GetMoney):addInputEvent("Mouse_LUp", "GetDailyPay_Execute()")
  ;
  (self._btn_Cancel):addInputEvent("Mouse_LUp", "FGlobal_GetDailyPay_Hide()")
end

GetDailyPay_Init()
GetDailyPay_Event()

