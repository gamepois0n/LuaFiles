-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\powergauge\cannonguage.luac 

-- params : ...
-- function num : 0
Panel_CannonGauge:SetShow(false)
local progress = (UI.getChildControl)(Panel_CannonGauge, "CannonGaugeBar")
local _txt_StaminaMax = (UI.getChildControl)(Panel_CannonGauge, "StaticText_CannonGaugeMax")
local elapsTime = 0
ConnonGauge_FrameUpdate = function(deltaTime)
  -- function num : 0_0 , upvalues : elapsTime, _txt_StaminaMax, progress
  elapsTime = elapsTime + deltaTime
  local nowPower = ToClient_getCommonGauge()
  local maxPower = ToClient_getMaxCommonGauge()
  local percent = nowPower / maxPower * 100
  if (math.floor)(percent) == 100 then
    return 
  end
  _txt_StaminaMax:SetText((string.format)("%d", (math.ceil)(percent)))
  progress:SetProgressRate(percent)
  progress:SetCurrentProgressRate(percent)
end

FGlobal_CannonGauge_Open = function()
  -- function num : 0_1
  Panel_CannonGauge:SetShow(true)
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
end

FGlobal_CannonGauge_Close = function()
  -- function num : 0_2
  Panel_CannonGauge:SetShow(false)
end

FromClient_CannonGauge_onScreenResize = function()
  -- function num : 0_3
  Panel_CannonGauge:ComputePos()
end

registerEvent("onScreenResize", "FromClient_CannonGauge_onScreenResize")
Panel_CannonGauge:RegisterUpdateFunc("ConnonGauge_FrameUpdate")

