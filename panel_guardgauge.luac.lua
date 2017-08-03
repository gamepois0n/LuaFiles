-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\mainstatus\panel_guardgauge.luac 

-- params : ...
-- function num : 0
local UI_color = Defines.Color
Panel_GuardGauge:SetShow(false, false)
local guardGauge = (UI.getChildControl)(Panel_GuardGauge, "Progress2_1")
local bar_FullGauge = (UI.getChildControl)(Panel_GuardGauge, "GuardGauge_ProgresssBG")
local txt_GuardGaugeMax = (UI.getChildControl)(Panel_GuardGauge, "StaticText_GuardGaugeCount")
Panel_GuardGauge:RegisterShowEventFunc(false, "Panel_GuardGauge_HideAni()")
Panel_GuardGauge:SetPosX(100)
Panel_GuardGauge:SetPosY(200)
Panel_GuardGauge_HideAni = function()
  -- function num : 0_0
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_GuardGauge, 0, 0.3)
  aniInfo:SetHideAtEnd(true)
end

local SpUseType = {Once = 0, Continue = 1, Recover = 2, Stop = 3, Reset = 4, None = 5}
GuardGauge_Update = function()
  -- function num : 0_1 , upvalues : bar_FullGauge, guardGauge, txt_GuardGaugeMax
  local selfPlayerWrapper = getSelfPlayer()
  if selfPlayerWrapper ~= nil then
    local sp = (selfPlayerWrapper:get()):getCurrentGuard()
    local maxSp = (selfPlayerWrapper:get()):getMaxGuard()
    if sp == maxSp then
      bar_FullGauge:SetShow(true)
      bar_FullGauge:EraseAllEffect()
      Panel_GuardGauge:SetShow(false, false)
      return 
    end
    if (UI.isFlushedUI)() == true then
      Panel_GuardGauge:SetShow(false, false)
      return 
    end
    local spRate = sp / maxSp
    local alpha = (1 - spRate) * 15
    local fullGauge = spRate * 100
    if alpha > 1 then
      alpha = 1
    end
    Panel_GuardGauge:SetAlphaChild(alpha)
    guardGauge:SetProgressRate(fullGauge)
    txt_GuardGaugeMax:SetFontAlpha(alpha)
    txt_GuardGaugeMax:SetText(tostring((math.floor)(spRate * 100)))
    Panel_GuardGauge:SetShow(true, false)
  end
end

registerEvent("FromClientGuardUpdate", "GuardGauge_Update()")
Panel_GuardGauge:RegisterUpdateFunc("GuardGauge_Update")

