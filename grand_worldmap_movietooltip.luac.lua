-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\worldmap_grand\grand_worldmap_movietooltip.luac 

-- params : ...
-- function num : 0
local _title = (UI.getChildControl)(Panel_WorldMap_MovieGuide, "StaticText_MovieTitle")
local _panelBG = (UI.getChildControl)(Panel_WorldMap_MovieGuide, "Static_MovieToolTipPanel_BG")
local _btn_Close = (UI.getChildControl)(Panel_WorldMap_MovieGuide, "Button_Close")
local _btn_Movie_1 = (UI.getChildControl)(Panel_WorldMap_MovieGuide, "Button_Movie_0")
local _btn_Movie_2 = (UI.getChildControl)(Panel_WorldMap_MovieGuide, "Button_Movie_1")
local _btn_Movie_3 = (UI.getChildControl)(Panel_WorldMap_MovieGuide, "Button_Movie_2")
local _btn_Movie_4 = (UI.getChildControl)(Panel_WorldMap_MovieGuide, "Button_Movie_3")
Panel_Worldmap_MovieGuide_Init = function()
  -- function num : 0_0 , upvalues : _btn_Movie_1, _btn_Movie_2, _btn_Movie_3, _btn_Movie_4, _btn_Close
  _btn_Movie_1:addInputEvent("Mouse_LUp", "Panel_MovieTheater640_GameGuide_Func(" .. 8 .. ")")
  _btn_Movie_2:addInputEvent("Mouse_LUp", "Panel_MovieTheater640_GameGuide_Func(" .. 9 .. ")")
  _btn_Movie_3:addInputEvent("Mouse_LUp", "Panel_MovieTheater640_GameGuide_Func(" .. 12 .. ")")
  _btn_Movie_4:addInputEvent("Mouse_LUp", "Panel_MovieTheater640_GameGuide_Func(" .. 17 .. ")")
  _btn_Close:addInputEvent("Mouse_LUp", "Panel_Worldmap_MovieGuide_Toggle()")
  Panel_WorldMap_MovieGuide:SetPosX(425)
  Panel_WorldMap_MovieGuide:SetPosY(70)
  Panel_WorldMap_MovieGuide:SetShow(false)
end

Panel_Worldmap_MovieGuide_Close = function()
  -- function num : 0_1
  Panel_MovieTheater640_Initialize()
  Panel_MovieTheater_640:SetShow(false, false)
  if ToClient_WorldMapIsShow() then
    WorldMapPopupManager:pop()
  end
end

Panel_Worldmap_MovieGuide_Open = function()
  -- function num : 0_2 , upvalues : _btn_Movie_1, _btn_Movie_2, _btn_Movie_3, _btn_Movie_4
  if ToClient_WorldMapIsShow() then
    WorldMapPopupManager:increaseLayer(true)
    WorldMapPopupManager:push(Panel_WorldMap_MovieGuide, true)
  end
  Panel_MovieTheater640_GameGuide_Func(8)
  _btn_Movie_1:addInputEvent("Mouse_LUp", "Panel_MovieTheater640_GameGuide_Func(" .. 8 .. ")")
  _btn_Movie_2:addInputEvent("Mouse_LUp", "Panel_MovieTheater640_GameGuide_Func(" .. 9 .. ")")
  _btn_Movie_3:addInputEvent("Mouse_LUp", "Panel_MovieTheater640_GameGuide_Func(" .. 12 .. ")")
  _btn_Movie_4:addInputEvent("Mouse_LUp", "Panel_MovieTheater640_GameGuide_Func(" .. 17 .. ")")
  Panel_MovieTheater_640:SetPosX(getScreenSizeX() / 2 - Panel_MovieTheater_640:GetSizeX() / 2)
  Panel_MovieTheater_640:SetPosY(getScreenSizeY() / 2 - Panel_MovieTheater_640:GetSizeY() / 2)
  Panel_WorldMap_MovieGuide:SetPosX(Panel_MovieTheater_640:GetPosX() - Panel_WorldMap_MovieGuide:GetSizeX() - 5)
  Panel_WorldMap_MovieGuide:SetPosY(Panel_MovieTheater_640:GetPosY() + Panel_MovieTheater_640:GetSizeY() - Panel_WorldMap_MovieGuide:GetSizeY())
end

Panel_Worldmap_MovieGuide_Toggle = function()
  -- function num : 0_3
  if Panel_WorldMap_MovieGuide:GetShow() == true then
    Panel_Worldmap_MovieGuide_Close()
  else
    Panel_Worldmap_MovieGuide_Open()
  end
end


