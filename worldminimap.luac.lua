-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\worldmap\worldminimap.luac 

-- params : ...
-- function num : 0
PaGlobal_WorldMiniMap = {_uiPanel = Panel_WorldMiniMap}
FromClient_InitWorldMiniMap = function()
  -- function num : 0_0
  if ToClient_IsDevelopment() then
    ToClient_initializeWorldMiniMap()
  end
  if Panel_WorldMiniMap ~= nil then
    Panel_WorldMiniMap:SetPosX(400)
    Panel_WorldMiniMap:SetPosY(400)
    Panel_WorldMiniMap:SetShow(true)
  end
end

FromClient_InitWorldMiniMap()

