-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\copyright\panel_copyright.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
Panel_Copyright:SetShow(false)
local PaGlobal_Copyright = {btn_Close = (UI.getChildControl)(Panel_Copyright, "Button_Win_Close"), _Web = nil}
PaGlobal_Copyright.init = function(self)
  -- function num : 0_0
  self._Web = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_Copyright, "WebControl_Copyright_WebLink")
  ;
  (self._Web):SetShow(true)
  ;
  (self._Web):SetVerticalMiddle()
  ;
  (self._Web):SetHorizonCenter()
  ;
  (self._Web):SetSize(1280, 720)
  ;
  (self._Web):ResetUrl()
  ;
  (self.btn_Close):addInputEvent("Mouse_LUp", "PaGlobal_Copyright_Close()")
end

PaGlobal_Copyright_ShowWindow = function()
  -- function num : 0_1 , upvalues : PaGlobal_Copyright
  local self = PaGlobal_Copyright
  Panel_Copyright:SetShow(true)
  ;
  (self._Web):ComputePos()
  ;
  (self._Web):SetUrl(1280, 720, "coui://UI_Data/UI_Html/copyright.html", false, true)
end

PaGlobal_Copyright_Close = function()
  -- function num : 0_2 , upvalues : PaGlobal_Copyright
  local self = PaGlobal_Copyright
  Panel_Copyright:SetShow(false)
  ;
  (self._Web):ResetUrl()
end

PaGlobal_Copyright:init()

