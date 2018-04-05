-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\dance\panel_danceframe.luac 

-- params : ...
-- function num : 0
DanceFrame = {
_web = {}
}
-- DECOMPILER ERROR at PC6: Confused about usage of register: R0 in 'UnsetPending'

DanceFrame.initalize = function(self)
  -- function num : 0_0
  self._web = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_DanceFrame, "WebControl_EventNotify_WebLink")
  ;
  (self._web):SetShow(true)
  ;
  (self._web):SetPosX(11)
  ;
  (self._web):SetPosY(50)
  ;
  (self._web):SetSize(918, 655)
  ;
  (self._web):ResetUrl()
end

FGlobal_DanceFrame_Open = function()
  -- function num : 0_1
  DanceFrame:open()
end

FGlobal_DanceFrame_Close = function()
  -- function num : 0_2
  DanceFrame:close()
end

-- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

DanceFrame.open = function(self)
  -- function num : 0_3
  Panel_DanceFrame:SetShow(true, true)
  Panel_DanceFrame:SetPosX(getScreenSizeX() / 2 - Panel_DanceFrame:GetSizeX() / 2)
  Panel_DanceFrame:SetPosY(getScreenSizeY() / 2 - Panel_DanceFrame:GetSizeY() / 2)
  local url = "http://10.32.129.20/DanceEdit"
  ;
  (self._web):SetUrl(918, 655, url)
end

-- DECOMPILER ERROR at PC16: Confused about usage of register: R0 in 'UnsetPending'

DanceFrame.close = function(self)
  -- function num : 0_4
  Panel_DanceFrame:SetShow(false, false)
  Panel_DanceFrame:CloseUISubApp()
  ;
  (self._web):ResetUrl()
end

DanceFrame:initalize()
registerEvent("FromClient_OpenDanceFrame", "FGlobal_DanceFrame_Open")

