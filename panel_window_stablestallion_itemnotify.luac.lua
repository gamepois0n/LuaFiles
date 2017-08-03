-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\stable\panel_window_stablestallion_itemnotify.luac 

-- params : ...
-- function num : 0
Panel_Window_StableStallion_ItemNotify:SetShow(false)
local _notify = (UI.getChildControl)(Panel_Window_StableStallion_ItemNotify, "StaticText_ItemDesc")
local _notifyBG = (UI.getChildControl)(Panel_Window_StableStallion_ItemNotify, "Static_DescBg")
ItemNotify_Open = function()
  -- function num : 0_0
  Panel_Window_StableStallion_ItemNotify:SetShow(true)
  local posX = Panel_Window_StableStallion:GetPosX()
  local posY = Panel_Window_StableStallion:GetPosY()
  local sizeX = Panel_Window_StableStallion_ItemNotify:GetSizeX()
  Panel_Window_StableStallion_ItemNotify:SetPosX(posX - sizeX)
  Panel_Window_StableStallion_ItemNotify:SetPosY(posY)
end

ItemNotify_Close = function()
  -- function num : 0_1
  Panel_Window_StableStallion_ItemNotify:SetShow(false)
end

Stallion_ItemNotify = function(skillKey, index)
  -- function num : 0_2 , upvalues : _notify, _notifyBG
  _notify:SetShow(true)
  if index == 0 then
    _notify:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLESTALLIONITEMNOTIFY_TEXT_ITEMNOTIFY_1"))
  else
    if index == 1 then
      _notify:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLESTALLIONITEMNOTIFY_TEXT_ITEMNOTIFY_2"))
    else
      if index == 2 then
        _notify:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLESTALLIONITEMNOTIFY_TEXT_ITEMNOTIFY_3"))
      else
        _notify:SetShow(false)
      end
    end
  end
  local notifySizeX = _notify:GetTextSizeX() + 65
  local notifySizeY = _notify:GetTextSizeY() + 65
  local notifyBGSizeX = _notifyBG:GetSizeX()
  local notifyBGSizeY = _notifyBG:GetSizeY() - 30
  local panelSizeX = Panel_Window_StableStallion_ItemNotify:GetSizeX()
  local panelSizeY = Panel_Window_StableStallion_ItemNotify:GetSizeY() - 30
  local sizeX = 0
  local sizeY = 0
  if panelSizeX < notifySizeX then
    sizeX = notifySizeX - panelSizeX
  end
  if panelSizeY < notifySizeY then
    sizeY = notifySizeY - panelSizeY
  end
  Panel_Window_StableStallion_ItemNotify:SetSize(panelSizeX + (sizeX), panelSizeY + (sizeY))
  _notifyBG:SetSize(notifyBGSizeX + (sizeX), notifyBGSizeY + (sizeY))
end


