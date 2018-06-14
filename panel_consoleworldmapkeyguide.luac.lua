-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\consolekeyguide\panel_consoleworldmapkeyguide.luac 

-- params : ...
-- function num : 0
Panel_WorldmapKeyGuide:SetShow(false)
PaGlobal_ConsoleWorldMapKeyGuide_SetPos = function()
  -- function num : 0_0
  Panel_WorldmapKeyGuide:SetPosX(getScreenSizeX() - Panel_WorldmapKeyGuide:GetSizeX())
  Panel_WorldmapKeyGuide:SetPosY(getScreenSizeY() - Panel_WorldmapKeyGuide:GetSizeY() - 50)
end

PaGlobal_ConsoleWorldMapKeyGuide_SetShow = function(isShow)
  -- function num : 0_1
  Panel_WorldmapKeyGuide:SetShow(isShow)
end

registerEvent("onScreenResize", "PaGlobal_ConsoleWorldMapKeyGuide_SetPos")

