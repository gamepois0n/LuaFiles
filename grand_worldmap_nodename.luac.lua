-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\worldmap_grand\grand_worldmap_nodename.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UI_PP = CppEnums.PAUIMB_PRIORITY
local UI_TT = CppEnums.PAUI_TEXTURE_TYPE
Panel_NodeName:RegisterShowEventFunc(true, "Panel_NodeName_ShowAni()")
Panel_NodeName:RegisterShowEventFunc(false, "Panel_NodeName_HideAni()")
local Txt_NodeName = (UI.getChildControl)(Panel_NodeName, "StaticText_NodeName")
local L_Line = (UI.getChildControl)(Panel_NodeName, "Static_L_Line")
local R_Line = (UI.getChildControl)(Panel_NodeName, "Static_R_Line")
L_Line:SetIgnore(true)
R_Line:SetIgnore(true)
Panel_NodeName_ShowAni = function()
  -- function num : 0_0 , upvalues : Txt_NodeName, UI_ANI_ADV, UI_TT, UI_color
  Txt_NodeName:EraseAllEffect()
  local FadeMaskAni = Panel_NodeName:addTextureUVAnimation(0, 1.28, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  FadeMaskAni:SetTextureType(UI_TT.PAUI_TEXTURE_TYPE_MASK)
  FadeMaskAni:SetStartUV(0, 0.6, 0)
  FadeMaskAni:SetEndUV(0, 0.1, 0)
  FadeMaskAni:SetStartUV(1, 0.6, 1)
  FadeMaskAni:SetEndUV(1, 0.1, 1)
  FadeMaskAni:SetStartUV(0, 1, 2)
  FadeMaskAni:SetEndUV(0, 0.4, 2)
  FadeMaskAni:SetStartUV(1, 1, 3)
  FadeMaskAni:SetEndUV(0, 0.4, 3)
  Panel_NodeName:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_IN)
  local aniInfo3 = Panel_NodeName:addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo3:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo3.IsChangeChild = true
  local aniInfo8 = Panel_NodeName:addColorAnimation(0.45, 1.23, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo8:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo8:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo8:SetStartIntensity(3)
  aniInfo8:SetEndIntensity(1)
end

Panel_NodeName_HideAni = function()
  -- function num : 0_1
end

NodeName_Show = function()
  -- function num : 0_2 , upvalues : L_Line, R_Line
  Panel_NodeName:SetShow(true, true)
  Panel_NodeName:SetPosX(getScreenSizeX() / 2 - Panel_NodeName:GetPosY() / 2)
  Panel_NodeName:SetPosY(getScreenSizeY() / 6)
  L_Line:SetSize(getScreenSizeX() / 2 - 278, 11)
  R_Line:SetSize(getScreenSizeX() / 2 - 278, 11)
  L_Line:SetPosX(Panel_NodeName:GetPosX() * -1)
  R_Line:SetPosX(getScreenSizeX() - getScreenSizeX() / 2 + 278 - Panel_NodeName:GetPosX())
  L_Line:SetPosY(15)
  R_Line:SetPosY(15)
end

FGlobal_SetNodeName = function(nodeName)
  -- function num : 0_3 , upvalues : Txt_NodeName
  Txt_NodeName:SetText(nodeName)
end

NodeName_Hide = function()
  -- function num : 0_4 , upvalues : Txt_NodeName
  Txt_NodeName:EraseAllEffect()
  Panel_NodeName:SetShow(false)
end

NodeName_ShowToggle = function(isShow)
  -- function num : 0_5
  if isShow then
    NodeName_Show()
  else
    NodeName_Hide()
  end
end


