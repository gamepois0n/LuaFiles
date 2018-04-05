-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\worldmap_grand\grand_worldmap_movietooltip.luac 

-- params : ...
-- function num : 0
local _btn_Close = (UI.getChildControl)(Panel_MovieWorldMapGuide_Web, "Button_Close")
Panel_Worldmap_MovieGuide_Init = function()
  -- function num : 0_0 , upvalues : _btn_Close
  _btn_Close:addInputEvent("Mouse_LUp", "Panel_Worldmap_MovieGuide_Toggle()")
  Panel_MovieWorldMapGuide_Web:SetPosX(425)
  Panel_MovieWorldMapGuide_Web:SetPosY(70)
  Panel_MovieWorldMapGuide_Web:SetShow(false)
end

Panel_Worldmap_MovieGuide_Open = function()
  -- function num : 0_1
  if ToClient_WorldMapIsShow() then
    WorldMapPopupManager:increaseLayer(true)
    WorldMapPopupManager:push(Panel_MovieWorldMapGuide_Web, true)
  end
  PaGlobal_MovieWorldMapGuide_Web:Open()
  Panel_MovieGuide_Weblist:SetPosX(getScreenSizeX() / 2 - Panel_MovieGuide_Weblist:GetSizeX() / 2)
  Panel_MovieGuide_Weblist:SetPosY(getScreenSizeY() / 2 - Panel_MovieGuide_Weblist:GetSizeY() / 2)
  Panel_MovieWorldMapGuide_Web:SetPosX(Panel_MovieGuide_Weblist:GetPosX() - Panel_MovieWorldMapGuide_Web:GetSizeX() - 5)
  Panel_MovieWorldMapGuide_Web:SetPosY(Panel_MovieGuide_Weblist:GetPosY() + Panel_MovieGuide_Weblist:GetSizeY() - Panel_MovieWorldMapGuide_Web:GetSizeY())
end

Panel_Worldmap_MovieGuide_Toggle = function()
  -- function num : 0_2
  if Panel_MovieWorldMapGuide_Web:GetShow() == true then
    PaGlobal_MovieWorldMapGuide_Web:Close()
  else
    PaGlobal_MovieWorldMapGuide_Web:Open()
  end
end


