-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\worldmap_grand\new_worldmap_lordmanager.luac 

-- params : ...
-- function num : 0
CloseButton = (UI.getChildControl)(Panel_Lord_Controller, "Button_Win_Close")
RegionName = (UI.getChildControl)(Panel_Lord_Controller, "StaticText_RegionName")
MakingRateProgressBar = (UI.getChildControl)(Panel_Lord_Controller, "Progress2_MakingRate")
FishRateProgressBar = (UI.getChildControl)(Panel_Lord_Controller, "Progress2_FishRate")
MakingRateText = (UI.getChildControl)(Panel_Lord_Controller, "StaticText_MakingRate")
FishRateText = (UI.getChildControl)(Panel_Lord_Controller, "StaticText_FishRate")
PlantControlButton = (UI.getChildControl)(Panel_Lord_Controller, "Button_PlantControl")
FishControlButton = (UI.getChildControl)(Panel_Lord_Controller, "Button_FishControl")
RainControlButton = (UI.getChildControl)(Panel_Lord_Controller, "Button_RainControl")
CloseButton:addInputEvent("Mouse_LUp", "FGlobal_LordManagerClose()")
FGlobal_LordManagerClose = function()
  -- function num : 0_0
  Panel_Lord_Controller:SetShow(false)
end


