-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\keyboardhelp\panel_window_keyboardhelp.luac 

-- params : ...
-- function num : 0
Panel_KeyboardHelp:SetShow(false, false)
local keyboardHelp = {btn_XClose = (UI.getChildControl)(Panel_KeyboardHelp, "Button_Close"), btn_Close = (UI.getChildControl)(Panel_KeyboardHelp, "Button_CloseWindow"), btn_Help = (UI.getChildControl)(Panel_KeyboardHelp, "Button_Help")}
KeyBoardHelp_Init = function()
  -- function num : 0_0 , upvalues : keyboardHelp
  if isGameTypeKR2() then
    (keyboardHelp.btn_Help):SetShow(false)
  end
end

KeyboardHelpShow = function()
  -- function num : 0_1
  if Panel_KeyboardHelp:GetShow() then
    return 
  end
  audioPostEvent_SystemUi(1, 0)
  Panel_KeyboardHelp:SetShow(true)
end

FGlobal_KeyboardHelpShow = function()
  -- function num : 0_2
  if Panel_KeyboardHelp:IsShow() then
    Panel_KeyboardHelp:SetShow(false)
    return false
  else
    audioPostEvent_SystemUi(1, 0)
    Panel_KeyboardHelp:SetShow(true)
    return true
  end
end

KeyboardHelpHide = function()
  -- function num : 0_3
  Panel_KeyboardHelp:SetShow(false)
end

keyboardHelp.registEventHandler = function(self)
  -- function num : 0_4
  (self.btn_Close):addInputEvent("Mouse_LUp", "KeyboardHelpHide()")
  ;
  (self.btn_XClose):addInputEvent("Mouse_LUp", "KeyboardHelpHide()")
  ;
  (self.btn_Help):addInputEvent("Mouse_LUp", "FGlobal_Panel_WebHelper_ShowToggle()")
end

KeyBoardHelp_Init()
keyboardHelp:registEventHandler()

