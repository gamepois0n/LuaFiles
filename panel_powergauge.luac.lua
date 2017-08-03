-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\powergauge\panel_powergauge.luac 

-- params : ...
-- function num : 0
Panel_PowerGauge:SetShow(false)
local progress = (UI.getChildControl)(Panel_PowerGauge, "Progress2_Gauge")
local progressValue = (UI.getChildControl)(Panel_PowerGauge, "StaticText_GaugeValue")
local wp = 0
local checkValue = false
local elapsTime = 0
PowerGauge_FrameUpdate = function(deltaTime)
  -- function num : 0_0 , upvalues : elapsTime, checkValue, wp, progressValue, progress
  elapsTime = elapsTime + deltaTime
  if checkValue then
    local nowPower = ToClient_getCommonGauge()
    local maxPower = ToClient_getMaxCommonGauge()
    local percent = nowPower / maxPower * 100
    if wp < (math.floor)(nowPower) or (math.floor)(nowPower) > 10 and (math.floor)(nowPower) < 0 then
      return 
    end
    progressValue:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_POWERGAUGE_PROGRESSVALUE", "percent", (string.format)("%d", (math.floor)(nowPower))))
    progress:SetProgressRate(percent)
    progress:SetCurrentProgressRate(percent)
  else
    do
      progressValue:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_POWERGAUGE_READY"))
    end
  end
end

local resetCheck = false
FGlobal_PowerGauge_Open = function()
  -- function num : 0_1 , upvalues : checkValue, resetCheck, elapsTime, progress, wp
  checkValue = false
  if not resetCheck then
    resetCheck = true
    elapsTime = 0
    progress:SetProgressRate(0)
    progress:SetCurrentProgressRate(0)
  end
  FromClient_PowerGauge_onScreenResize()
  Panel_PowerGauge:SetShow(true)
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  wp = selfPlayer:getWp()
  if wp == 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_POWERGAUGE_NOPOWER"))
  end
end

FGlobal_PowerGuage_StatCheck = function()
  -- function num : 0_2 , upvalues : checkValue, resetCheck
  checkValue = true
  resetCheck = false
end

FGlobal_PowerGauge_Close = function()
  -- function num : 0_3
  Panel_PowerGauge:SetShow(false)
end

FromClient_PowerGauge_onScreenResize = function()
  -- function num : 0_4
  Panel_PowerGauge:SetPosX(getScreenSizeX() / 2 - Panel_PowerGauge:GetSizeX() * 2.6)
  Panel_PowerGauge:SetPosY(getScreenSizeY() / 2 - Panel_PowerGauge:GetSizeY() / 1.8)
end

registerEvent("onScreenResize", "FromClient_PowerGauge_onScreenResize")
Panel_PowerGauge:RegisterUpdateFunc("PowerGauge_FrameUpdate")

