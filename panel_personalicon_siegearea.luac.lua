-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\righttopicons\panel_personalicon_siegearea.luac 

-- params : ...
-- function num : 0
local _btn_VillageSiegeArea = FGlobal_GetPersonalIconControl(4)
_btn_VillageSiegeArea:ActiveMouseEventEffect(true)
_btn_VillageSiegeArea:setGlassBackground(true)
local showSiegeArea = false
ToClient_toggleVillageSiegeArea(showSiegeArea)
ToggleVillageSiegeArea = function(isShow)
  -- function num : 0_0 , upvalues : showSiegeArea, _btn_VillageSiegeArea
  if isShow == false then
    showSiegeArea = not showSiegeArea
  else
    showSiegeArea = isShow
  end
  _btn_VillageSiegeArea:EraseAllEffect()
  if showSiegeArea then
    _btn_VillageSiegeArea:AddEffect("UI_VillageSiegeArea_01A", true, 0, 0)
  end
  ToClient_toggleVillageSiegeArea(showSiegeArea)
end

VillageSiegeArea_Tooltip_ShowToggle = function(isShow)
  -- function num : 0_1 , upvalues : _btn_VillageSiegeArea
  if isShow == false then
    TooltipSimple_Hide()
    return 
  end
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_VILLAGESEIGE_AREABUTTON")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_VILLAGESEIGE_AREABUTTON_DESC")
  TooltipSimple_Show(_btn_VillageSiegeArea, name, desc)
end


