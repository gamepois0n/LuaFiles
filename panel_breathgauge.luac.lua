-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\breathgauge\panel_breathgauge.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC6: Confused about usage of register: R0 in 'UnsetPending'

CppEnums.BreathGaugeUnderWater = {None = 0, UnderWater = 1, BreathOver = 2, Count = 3}
local staticBar = (UI.getChildControl)(Panel_BreathGauge, "HorseMpBar")
EventUpdateBreathGauge = function(breathGauge)
  -- function num : 0_0 , upvalues : staticBar
  local breathGaugeDefaultValue = ToClient_getMaxBreathGauge()
  if breathGauge <= 0 or breathGaugeDefaultValue <= breathGauge then
    Panel_BreathGauge:SetShow(false, false)
  else
    Panel_BreathGauge:SetShow(true, false)
  end
  staticBar:SetProgressRate(breathGauge * 100 / breathGaugeDefaultValue)
end

registerEvent("EventUpdateBreathGauge", "EventUpdateBreathGauge")

