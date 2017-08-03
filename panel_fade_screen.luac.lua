-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\fadescreen\panel_fade_screen.luac 

-- params : ...
-- function num : 0
Panel_Fade_Screen:SetPosX(0)
Panel_Fade_Screen:SetPosY(0)
Panel_Fade_Screen:SetShow(false, false)
Panel_Fade_Screen:SetSize(getScreenSizeX(), getScreenSizeY())
Panel_Fade_Screen:SetIgnore(true)
local lua_StaticText_FieldName = (UI.getChildControl)(Panel_Fade_Screen, "StaticText_FieldName")
local FieldNamePostionY = 0
local FieldNamePositionHalf = getScreenSizeY()
FieldNamePositionHalf = FieldNamePositionHalf / 4
lua_StaticText_FieldName:SetHorizonCenter()
lua_StaticText_FieldName:SetShow(false)
lua_StaticText_FieldName:SetSpanSize(0, FieldNamePositionHalf)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
startFadeIn = function(strFieldName)
  -- function num : 0_0 , upvalues : UI_color, lua_StaticText_FieldName, UI_ANI_ADV
  Panel_Fade_Screen:SetShow(true, false)
  Panel_Fade_Screen:SetColor(UI_color.C_FFFFFFFF)
  if strFieldName ~= nil then
    lua_StaticText_FieldName:SetShow(true)
    lua_StaticText_FieldName:SetText(strFieldName)
    lua_StaticText_FieldName:SetFontColor(UI_color.C_00FFFFFF)
    local aniText = lua_StaticText_FieldName:addColorAnimation(1, 2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
    aniText:SetStartColor(UI_color.C_00FFFFFF)
    aniText:SetEndColor(UI_color.C_FFFFFFFF)
    local aniText2 = lua_StaticText_FieldName:addColorAnimation(5, 6, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
    aniText2:SetStartColor(UI_color.C_FFFFFFFF)
    aniText2:SetEndColor(UI_color.C_00FFFFFF)
    local aniInfoFadeOut = Panel_Fade_Screen:addColorAnimation(6, 8, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
    aniInfoFadeOut:SetStartColor(UI_color.C_FFFFFFFF)
    aniInfoFadeOut:SetEndColor(0)
  else
    do
      lua_StaticText_FieldName:SetShow(false)
      local aniInfoFadeOut = Panel_Fade_Screen:addColorAnimation(1, 4, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
      aniInfoFadeOut:SetStartColor(UI_color.C_FFFFFFFF)
      aniInfoFadeOut:SetEndColor(0)
    end
  end
end

EventFadeInResize = function()
  -- function num : 0_1 , upvalues : lua_StaticText_FieldName
  Panel_Fade_Screen:SetSize(getScreenSizeX(), getScreenSizeY())
  local FieldNamePositionHalf = getScreenSizeY()
  FieldNamePositionHalf = FieldNamePositionHalf / 4
  lua_StaticText_FieldName:SetHorizonCenter()
  lua_StaticText_FieldName:SetShow(false)
  lua_StaticText_FieldName:SetSpanSize(0, FieldNamePositionHalf)
end

registerEvent("onScreenResize", "EventFadeInResize")
registerEvent("EventStartFadeIn", "startFadeIn()")

