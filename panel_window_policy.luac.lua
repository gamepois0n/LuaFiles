-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\policy\panel_window_policy.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
Panel_Window_Policy:SetShow(false)
local PaGlobal_Policy = {
_ui = {btnConfirm = (UI.getChildControl)(Panel_Window_Policy, "StaticText_Confirm"), btnCancel = (UI.getChildControl)(Panel_Window_Policy, "StaticText_Close")}
, _Web = nil}
PaGlobal_Policy.init = function(self)
  -- function num : 0_0
  self._Web = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_Window_Policy, "WebControl_Policy_WebLink")
  ;
  (self._Web):SetShow(true)
  ;
  (self._Web):SetSize(1280, 720)
  ;
  (self._Web):SetPosX(20)
  ;
  (self._Web):SetPosY(20)
  ;
  (self._Web):ResetUrl()
end

PaGlobal_Policy_ShowWindow = function(isLogin)
  -- function num : 0_1 , upvalues : PaGlobal_Policy
  local self = PaGlobal_Policy
  Panel_Window_Policy:SetShow(true)
  ;
  (self._Web):ComputePos()
  ;
  (self._Web):SetUrl(1280, 720, "coui://UI_Data/UI_Html/policy.html", false, true)
  ;
  ((self._ui).btnConfirm):SetShow(isLogin)
  ;
  ((self._ui).btnCancel):SetShow(not isLogin)
end

PaGlobal_Policy_Close = function()
  -- function num : 0_2 , upvalues : PaGlobal_Policy
  local self = PaGlobal_Policy
  Panel_Window_Policy:SetShow(false)
  ;
  (self._Web):ResetUrl()
end

PaGlobal_Policy:init()

