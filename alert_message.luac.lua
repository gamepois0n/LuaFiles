-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\alert\alert_message.luac 

-- params : ...
-- function num : 0
PAGlobal_Alert_Message = {_showingSec = 1}
Panel_Alert_Message:SetShow(false, false)
Panel_Alert_Message:RegisterShowEventFunc(true, "AlertMessage_ShowAni()")
Panel_Alert_Message:RegisterShowEventFunc(false, "AlertMessage_HideAni()")
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_TT = CppEnums.PAUI_TEXTURE_TYPE
local UI_color = Defines.Color
local desc = (UI.getChildControl)(Panel_Alert_Message, "StaticText_Desc1")
AlertMessage_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV, UI_TT
  Panel_Alert_Message:ChangeSpecialTextureInfoName("new_ui_common_forlua/Default/Mask_MidHorizon.dds")
  local FadeMaskAni = Panel_Alert_Message:addTextureUVAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  FadeMaskAni:SetTextureType(UI_TT.PAUI_TEXTURE_TYPE_MASK)
  local uvStartX = 0
  local uvStartY = 0
  FadeMaskAni:SetStartUV(uvStartX, uvStartY, 0)
  FadeMaskAni:SetEndUV(0.6, 0, 0)
  FadeMaskAni:SetStartUV(1, 0, 1)
  FadeMaskAni:SetEndUV(0.4, 0, 1)
  FadeMaskAni:SetStartUV(0, 1, 2)
  FadeMaskAni:SetEndUV(0.6, 1, 2)
  FadeMaskAni:SetStartUV(1, 1, 3)
  FadeMaskAni:SetEndUV(0.4, 1, 3)
  FadeMaskAni.IsChangeChild = true
end

AlertMessage_HideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
  Panel_Alert_Message:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local closeAni = Panel_Alert_Message:addColorAnimation(0, 1, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  closeAni:SetStartColor(UI_color.C_FFFFFFFF)
  closeAni:SetEndColor(UI_color.C_00FFFFFF)
  closeAni:SetStartIntensity(3)
  closeAni:SetEndIntensity(1)
  closeAni.IsChangeChild = true
  closeAni:SetHideAtEnd(true)
  closeAni:SetDisableWhileAni(true)
end

FGlobal_Show_AlertMessage = function(msg, showTime)
  -- function num : 0_2 , upvalues : desc
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R2 in 'UnsetPending'

  PAGlobal_Alert_Message._showingSec = showTime
  Panel_Alert_Message:SetShow(false)
  PaGlobal_Radar_WarAlert(false)
  desc:SetText(msg)
  Panel_Alert_Message:SetPosX(getScreenSizeX() / 2 - Panel_Alert_Message:GetSizeX() / 2)
  Panel_Alert_Message:SetPosY(230)
  Panel_Alert_Message:SetShow(true, true)
end

local _time = 0
AlertMessage_FrameUpdate_ForHide = function(deltaTime)
  -- function num : 0_3 , upvalues : _time
  if _time < PAGlobal_Alert_Message._showingSec then
    _time = _time + deltaTime
  else
    if Panel_Alert_Message:GetShow() then
      Panel_Alert_Message:SetShow(false, false)
      _time = 0
    end
  end
end

Panel_Alert_Message:RegisterUpdateFunc("AlertMessage_FrameUpdate_ForHide")

