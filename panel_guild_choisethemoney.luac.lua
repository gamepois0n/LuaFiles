-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\guild\panel_guild_choisethemoney.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
PaGlobal_Guild_ChoiseTheMoney = {
_ui = {_btn_XClose = (UI.getChildControl)(Panel_Guild_ChoiseTheMoney, "Button_Close"), _btn_Incentive = (UI.getChildControl)(Panel_Guild_ChoiseTheMoney, "Button_GoToIncenList"), _btn_Funds = (UI.getChildControl)(Panel_Guild_ChoiseTheMoney, "Button_GoToFundsList")}
}
-- DECOMPILER ERROR at PC26: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Guild_ChoiseTheMoney.Init = function(self)
  -- function num : 0_0
  ((self._ui)._btn_XClose):addInputEvent("Mouse_LUp", "PaGlobal_Guild_ChoiseTheMoney:LClickEvent(0)")
  ;
  ((self._ui)._btn_Incentive):addInputEvent("Mouse_LUp", "PaGlobal_Guild_ChoiseTheMoney:LClickEvent(1)")
  ;
  ((self._ui)._btn_Funds):addInputEvent("Mouse_LUp", "PaGlobal_Guild_ChoiseTheMoney:LClickEvent(2)")
end

-- DECOMPILER ERROR at PC29: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Guild_ChoiseTheMoney.Open = function(self)
  -- function num : 0_1
  Panel_Guild_ChoiseTheMoney:SetShow(true)
end

-- DECOMPILER ERROR at PC32: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Guild_ChoiseTheMoney.Hide = function(self)
  -- function num : 0_2
  Panel_Guild_ChoiseTheMoney:SetShow(false)
end

-- DECOMPILER ERROR at PC35: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Guild_ChoiseTheMoney.LClickEvent = function(self, clickType)
  -- function num : 0_3
  if clickType == nil then
    return 
  end
  if clickType == 0 then
    PaGlobal_Guild_ChoiseTheMoney:Hide()
  else
    if clickType == 1 then
      HandleCLicked_IncentiveOption()
      PaGlobal_Guild_ChoiseTheMoney:Hide()
    else
      if clickType == 2 then
        PaGlobal_Guild_SetFundsList_Open()
        PaGlobal_Guild_ChoiseTheMoney:Hide()
      end
    end
  end
end

PaGlobal_Guild_ChoiseTheMoney:Init()

