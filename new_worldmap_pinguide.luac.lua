-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\worldmap_grand\new_worldmap_pinguide.luac 

-- params : ...
-- function num : 0
local VCK = CppEnums.VirtualKeyCode
FromClient_AddFlickerPin = function(uiControl, position, isForGuild)
  -- function num : 0_0
  uiControl:EraseAllEffect()
  local guideParam = NavigationGuideParam()
  if isForGuild then
    uiControl:AddEffect("UI_WorldMap_Ping01", false, 0, 0)
    guideParam._color = float4(1, 0.8, 0.6, 1)
    guideParam._bgColor = float4(0.6, 0.2, 0.2, 0.3)
    guideParam._beamColor = float4(0.4, 0.15, 0.15, 1)
  else
    uiControl:AddEffect("UI_WorldMap_Ping02", false, 0, 0)
    guideParam._color = float4(1, 0.8, 0.6, 1)
    guideParam._bgColor = float4(0.6, 0.2, 0.2, 0.3)
    guideParam._beamColor = float4(0.4, 0.15, 0.15, 1)
  end
  worldmap_addNavigationBeam(position, guideParam, true)
end

FromClient_LDownWorldMapPanel = function()
  -- function num : 0_1 , upvalues : VCK
  if isKeyPressed(VCK.KeyCode_CONTROL) then
    ToClient_requestWordmapPin(true, false)
  else
    if isKeyPressed(VCK.KeyCode_SHIFT) then
      ToClient_requestWordmapPin(false, false)
    end
  end
end

FromClient_LDoubleClickWorldMapPanel = function()
  -- function num : 0_2 , upvalues : VCK
  if isKeyPressed(VCK.KeyCode_CONTROL) then
    ToClient_requestWordmapPin(true, true)
  else
    if isKeyPressed(VCK.KeyCode_SHIFT) then
      ToClient_requestWordmapPin(false, true)
    end
  end
end

FromClient_LClickPin = function(actorKey, isForGuild)
  -- function num : 0_3 , upvalues : VCK
  if isKeyPressed(VCK.KeyCode_CONTROL) and isForGuild == true then
    ToClient_RequestDeletePositionGuide(actorKey, isForGuild)
  else
    if isKeyPressed(VCK.KeyCode_SHIFT) and isForGuild == false then
      ToClient_RequestDeletePositionGuide(actorKey, isForGuild)
    end
  end
end

registerEvent("FromClient_AddFlickerPin", "FromClient_AddFlickerPin")
registerEvent("FromClient_LDownWorldMapPanel", "FromClient_LDownWorldMapPanel")
registerEvent("FromClient_LDoubleClickWorldMapPanel", "FromClient_LDoubleClickWorldMapPanel")
registerEvent("FromClient_LClickPin", "FromClient_LClickPin")

