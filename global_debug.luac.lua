-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\include\global_debug.luac 

-- params : ...
-- function num : 0
if UI == nil then
  UI = {}
end
local debugText = nil
debugPanel = (UI.createPanel)("DebugaaPanel", 9999)
debugPanel:SetSize(500, 20)
debugPanel:SetHorizonRight()
debugPanel:SetVerticalTop()
debugPanel:setFlushAble(false)
debugText = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, debugPanel, "StaticText_Debug")
debugText:SetSize(500, 20)
debugText:SetTextVerticalTop()
local dbgMsgLog = (Array.new)()
if UI == nil then
  UI = {}
end
-- DECOMPILER ERROR at PC54: Confused about usage of register: R2 in 'UnsetPending'

UI.debugMessage = function(msg)
  -- function num : 0_0 , upvalues : dbgMsgLog, debugText
  if dbgMsgLog:length() > 30 then
    dbgMsgLog:pop_front()
  end
  dbgMsgLog:push_back(msg)
  debugText:SetText(dbgMsgLog:toString())
end

DebugPanel_MouseOn = function()
  -- function num : 0_1 , upvalues : debugText
  debugPanel:SetSize(500, getScreenSizeY())
  debugText:SetSize(500, getScreenSizeY())
end

DebugPanel_MouseOut = function()
  -- function num : 0_2 , upvalues : debugText
  debugPanel:SetSize(500, 20)
  debugText:SetSize(500, 20)
end

debugPanel:addInputEvent("Mouse_On", "DebugPanel_MouseOn()")
debugPanel:addInputEvent("Mouse_Out", "DebugPanel_MouseOut()")

