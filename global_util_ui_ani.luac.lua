-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\include\global_util_ui_ani.luac 

-- params : ...
-- function num : 0
UIAni = {}
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_AV = CppEnums.PA_UI_ALIGNVERTICAL
local UI_TT = CppEnums.PAUI_TEXTURE_TYPE
local UI_color = Defines.Color
-- DECOMPILER ERROR at PC14: Confused about usage of register: R4 in 'UnsetPending'

UIAni.closeAni = function(panel)
  -- function num : 0_0 , upvalues : UI_ANI_ADV, UI_color
  panel:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local closeAni = panel:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  closeAni:SetStartColor(UI_color.C_FFFFFFFF)
  closeAni:SetEndColor(UI_color.C_00FFFFFF)
  closeAni:SetStartIntensity(3)
  closeAni:SetEndIntensity(1)
  closeAni.IsChangeChild = true
  closeAni:SetHideAtEnd(true)
  closeAni:SetDisableWhileAni(true)
end

-- DECOMPILER ERROR at PC18: Confused about usage of register: R4 in 'UnsetPending'

UIAni.showAniScaleElastic = function(panel, params)
  -- function num : 0_1 , upvalues : UI_ANI_ADV
  _PA_ASSERT(panel ~= nil, "panel 매개�\128수는 넣어 주셔�\188 합니�\164!")
  if params == nil then
    params = {}
  end
  local startTime = params.startTime and params.startTime or 0
  local middleTime = params.middleTime and params.middleTime or 0.08
  local endTime = params.endTime and params.endTime or 0.15
  local startScale = params.startScale and params.startScale or 0.5
  local middleScale = params.middleScale and params.middleScale or 1.1
  local endScale = params.endScale and params.endScale or 1
  if not params.scaleType or not params.scaleType then
    local scaleType = (CppEnums.PAUI_SCALE_ANIM_TYPE).PAUI_ANIM_TYPE_SCALE_Y
  end
  if middleTime < startTime then
    _PA_LOG("이재�\128", "잘못�\156 middleTime�\132 설정했습니다. middleTime�\132 강제�\156 �\128경합니다.")
    middleTime = startTime + 0.08
  end
  if endTime < middleTime then
    _PA_LOG("이재�\128", "잘못�\156 endTime�\132 설정했습니다. endTime�\132 강제�\156 �\128경합니다.")
    endTime = middleTime + 0.08
  end
  local animGrowing = panel:addScaleAnimation(startTime, middleTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  animGrowing:SetStartScale(startScale)
  animGrowing:SetEndScale(middleScale)
  animGrowing.AxisX = panel:GetSizeX() / 2
  animGrowing.AxisY = panel:GetSizeY() / 2
  animGrowing.ScaleType = scaleType
  animGrowing.IsChangeChild = true
  do
    local animShrinking = panel:addScaleAnimation(middleTime, endTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
    animShrinking:SetStartScale(middleScale)
    animShrinking:SetEndScale(endScale)
    animShrinking.AxisX = panel:GetSizeX() / 2
    animShrinking.AxisY = panel:GetSizeY() / 2
    animShrinking.ScaleType = scaleType
    animShrinking.IsChangeChild = true
    -- DECOMPILER ERROR: 18 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC21: Confused about usage of register: R4 in 'UnsetPending'

UIAni.TestFunc = function(panel, uvStX, uvStY, uvEndX, uvEndY)
  -- function num : 0_2
  local getGuildMarkTexture = guildMark:getBaseTexture()
  getGuildMarkTexture:setUV(uvStX, uvStY, uvEndX, uvEndY)
  guildMark:SetTexturePreload(false)
end

-- DECOMPILER ERROR at PC26: Confused about usage of register: R4 in 'UnsetPending'

UIAni.fadeInSCR_MidOut = function(panel)
  -- function num : 0_3 , upvalues : UI_ANI_ADV, UI_TT
  panel:ChangeSpecialTextureInfoName("new_ui_common_forlua/Default/Mask_MidHorizon.dds")
  local FadeMaskAni = panel:addTextureUVAnimation(0, 0.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  FadeMaskAni:SetTextureType(UI_TT.PAUI_TEXTURE_TYPE_MASK)
  FadeMaskAni:SetStartUV(0, 0, 0)
  FadeMaskAni:SetEndUV(0.6, 0, 0)
  FadeMaskAni:SetStartUV(1, 0, 1)
  FadeMaskAni:SetEndUV(0.4, 0, 1)
  FadeMaskAni:SetStartUV(0, 1, 2)
  FadeMaskAni:SetEndUV(0.6, 1, 2)
  FadeMaskAni:SetStartUV(1, 1, 3)
  FadeMaskAni:SetEndUV(0.4, 1, 3)
  FadeMaskAni.IsChangeChild = true
end

-- DECOMPILER ERROR at PC32: Confused about usage of register: R4 in 'UnsetPending'

UIAni.fadeInSCR_Up = function(panel)
  -- function num : 0_4 , upvalues : UI_ANI_ADV, UI_TT, UI_color
  panel:ChangeSpecialTextureInfoName("new_ui_common_forlua/Default/Mask_Gradient_toTop.dds")
  local FadeMaskAni = panel:addTextureUVAnimation(0, 0.75, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  FadeMaskAni:SetTextureType(UI_TT.PAUI_TEXTURE_TYPE_MASK)
  FadeMaskAni:SetStartUV(0, 0.1, 0)
  FadeMaskAni:SetEndUV(0, 0.6, 0)
  FadeMaskAni:SetStartUV(1, 0.1, 1)
  FadeMaskAni:SetEndUV(1, 0.6, 1)
  FadeMaskAni:SetStartUV(0, 0.4, 2)
  FadeMaskAni:SetEndUV(0, 1, 2)
  FadeMaskAni:SetStartUV(1, 0.4, 3)
  FadeMaskAni:SetEndUV(1, 1, 3)
  panel:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_IN)
  local aniInfo3 = panel:addColorAnimation(0, 0.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo3:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo3.IsChangeChild = true
  local aniInfo8 = panel:addColorAnimation(0.12, 0.23, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo8:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo8:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo8:SetStartIntensity(3)
  aniInfo8:SetEndIntensity(1)
end

-- DECOMPILER ERROR at PC38: Confused about usage of register: R4 in 'UnsetPending'

UIAni.fadeInSCR_Right = function(panel)
  -- function num : 0_5 , upvalues : UI_ANI_ADV, UI_TT, UI_color
  panel:ChangeSpecialTextureInfoName("new_ui_common_forlua/Default/Mask_Gradient_toRight.dds")
  local FadeMaskAni = panel:addTextureUVAnimation(0, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  FadeMaskAni:SetTextureType(UI_TT.PAUI_TEXTURE_TYPE_MASK)
  FadeMaskAni:SetStartUV(0.6, 0.1, 0)
  FadeMaskAni:SetEndUV(0.1, 0.1, 0)
  FadeMaskAni:SetStartUV(1, 1, 1)
  FadeMaskAni:SetEndUV(0.4, 1, 1)
  FadeMaskAni:SetStartUV(0.6, 1, 2)
  FadeMaskAni:SetEndUV(0.1, 1, 2)
  FadeMaskAni:SetStartUV(1, 1, 3)
  FadeMaskAni:SetEndUV(0.4, 1, 3)
  panel:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_IN)
  local aniInfo3 = panel:addColorAnimation(0, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo3:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo3.IsChangeChild = true
  local aniInfo8 = panel:addColorAnimation(0.12, 0.23, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo8:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo8:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo8:SetStartIntensity(3)
  aniInfo8:SetEndIntensity(1)
end

-- DECOMPILER ERROR at PC44: Confused about usage of register: R4 in 'UnsetPending'

UIAni.fadeInSCR_Down = function(panel)
  -- function num : 0_6 , upvalues : UI_ANI_ADV, UI_TT, UI_color
  panel:ChangeSpecialTextureInfoName("new_ui_common_forlua/Default/Mask_Gradient_toBottom.dds")
  local FadeMaskAni = panel:addTextureUVAnimation(0, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  FadeMaskAni:SetTextureType(UI_TT.PAUI_TEXTURE_TYPE_MASK)
  FadeMaskAni:SetStartUV(0, 0.6, 0)
  FadeMaskAni:SetEndUV(0, 0.1, 0)
  FadeMaskAni:SetStartUV(1, 0.6, 1)
  FadeMaskAni:SetEndUV(1, 0.1, 1)
  FadeMaskAni:SetStartUV(0, 1, 2)
  FadeMaskAni:SetEndUV(0, 0.4, 2)
  FadeMaskAni:SetStartUV(1, 1, 3)
  FadeMaskAni:SetEndUV(0, 0.4, 3)
  panel:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_IN)
  local aniInfo3 = panel:addColorAnimation(0, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo3:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo3.IsChangeChild = true
  local aniInfo8 = panel:addColorAnimation(0.15, 0.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo8:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo8:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo8:SetStartIntensity(3)
  aniInfo8:SetEndIntensity(1)
end

-- DECOMPILER ERROR at PC50: Confused about usage of register: R4 in 'UnsetPending'

UIAni.fadeInSCR_Left = function(panel)
  -- function num : 0_7 , upvalues : UI_ANI_ADV, UI_TT, UI_color
  panel:ChangeSpecialTextureInfoName("new_ui_common_forlua/Default/Mask_Gradient_toLeft.dds")
  local FadeMaskAni = panel:addTextureUVAnimation(0, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  FadeMaskAni:SetTextureType(UI_TT.PAUI_TEXTURE_TYPE_MASK)
  FadeMaskAni:SetStartUV(0, 0, 0)
  FadeMaskAni:SetEndUV(0.6, 0, 0)
  FadeMaskAni:SetStartUV(0.4, 0, 1)
  FadeMaskAni:SetEndUV(1, 0, 1)
  FadeMaskAni:SetStartUV(0, 1, 2)
  FadeMaskAni:SetEndUV(0.6, 1, 2)
  FadeMaskAni:SetStartUV(0.4, 1, 3)
  FadeMaskAni:SetEndUV(1, 1, 3)
  panel:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_IN)
  local aniInfo8 = panel:addColorAnimation(0, 0.12, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo8:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo8:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo8:SetStartIntensity(3)
  aniInfo8:SetEndIntensity(1)
  -- DECOMPILER ERROR at PC79: Confused about usage of register: R3 in 'UnsetPending'

  aniInfo3.IsChangeChild = true
end

-- DECOMPILER ERROR at PC53: Confused about usage of register: R4 in 'UnsetPending'

UIAni.fadeInSCR_Left_Clear = function(panel)
  -- function num : 0_8
  panel:ChangeSpecialTextureInfoName("")
end

-- DECOMPILER ERROR at PC59: Confused about usage of register: R4 in 'UnsetPending'

UIAni.fadeInSCRWorldMap_Down = function(panel)
  -- function num : 0_9 , upvalues : UI_ANI_ADV, UI_TT, UI_color
  local FadeMaskAni = panel:addTextureUVAnimation(0, 0.28, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  FadeMaskAni:SetTextureType(UI_TT.PAUI_TEXTURE_TYPE_MASK)
  FadeMaskAni:SetStartUV(0, 0.6, 0)
  FadeMaskAni:SetEndUV(0, 0.1, 0)
  FadeMaskAni:SetStartUV(1, 0.6, 1)
  FadeMaskAni:SetEndUV(1, 0.1, 1)
  FadeMaskAni:SetStartUV(0, 1, 2)
  FadeMaskAni:SetEndUV(0, 0.4, 2)
  FadeMaskAni:SetStartUV(1, 1, 3)
  FadeMaskAni:SetEndUV(0, 0.4, 3)
  panel:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_IN)
  local aniInfo3 = panel:addColorAnimation(0, 0.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo3:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo3.IsChangeChild = true
  local aniInfo8 = panel:addColorAnimation(0.12, 0.23, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo8:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo8:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo8:SetStartIntensity(3)
  aniInfo8:SetEndIntensity(1)
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R4 in 'UnsetPending'

UIAni.fadeInSCRDialog_MidOut = function(panel)
  -- function num : 0_10 , upvalues : UI_ANI_ADV, UI_TT
  panel:ChangeSpecialTextureInfoName("new_ui_common_forlua/Default/Mask_MidHorizon.dds")
  local FadeMaskAni = panel:addTextureUVAnimation(0, 2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  FadeMaskAni:SetTextureType(UI_TT.PAUI_TEXTURE_TYPE_MASK)
  FadeMaskAni:SetStartUV(0, 0, 0)
  FadeMaskAni:SetEndUV(0.6, 0, 0)
  FadeMaskAni:SetStartUV(1, 0, 1)
  FadeMaskAni:SetEndUV(0.4, 0, 1)
  FadeMaskAni:SetStartUV(0, 1, 2)
  FadeMaskAni:SetEndUV(0.6, 1, 2)
  FadeMaskAni:SetStartUV(1, 1, 3)
  FadeMaskAni:SetEndUV(0.4, 1, 3)
end

-- DECOMPILER ERROR at PC70: Confused about usage of register: R4 in 'UnsetPending'

UIAni.fadeInSCRDialog_Up = function(panel)
  -- function num : 0_11 , upvalues : UI_ANI_ADV, UI_TT, UI_color
  panel:ChangeSpecialTextureInfoName("new_ui_common_forlua/Default/Mask_Gradient_toTop.dds")
  local FadeMaskAni = panel:addTextureUVAnimation(0, 0.85, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  FadeMaskAni:SetTextureType(UI_TT.PAUI_TEXTURE_TYPE_MASK)
  FadeMaskAni:SetStartUV(0, 0.1, 0)
  FadeMaskAni:SetEndUV(0, 0.6, 0)
  FadeMaskAni:SetStartUV(1, 0.1, 1)
  FadeMaskAni:SetEndUV(1, 0.6, 1)
  FadeMaskAni:SetStartUV(0, 0.4, 2)
  FadeMaskAni:SetEndUV(0, 1, 2)
  FadeMaskAni:SetStartUV(1, 0.4, 3)
  FadeMaskAni:SetEndUV(1, 1, 3)
  panel:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_IN)
  local aniInfo3 = panel:addColorAnimation(0, 0.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo3:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo3.IsChangeChild = true
  local aniInfo8 = panel:addColorAnimation(0.12, 0.23, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo8:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo8:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo8:SetStartIntensity(3)
  aniInfo8:SetEndIntensity(1)
end

-- DECOMPILER ERROR at PC76: Confused about usage of register: R4 in 'UnsetPending'

UIAni.fadeInSCRDialog_Right = function(panel)
  -- function num : 0_12 , upvalues : UI_ANI_ADV, UI_TT, UI_color
  panel:ChangeSpecialTextureInfoName("new_ui_common_forlua/Default/Mask_Gradient_toRight.dds")
  local FadeMaskAni = panel:addTextureUVAnimation(0, 0.36, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  FadeMaskAni:SetTextureType(UI_TT.PAUI_TEXTURE_TYPE_MASK)
  FadeMaskAni:SetStartUV(0.6, 0.1, 0)
  FadeMaskAni:SetEndUV(0.1, 0.1, 0)
  FadeMaskAni:SetStartUV(1, 1, 1)
  FadeMaskAni:SetEndUV(0.4, 1, 1)
  FadeMaskAni:SetStartUV(0.6, 1, 2)
  FadeMaskAni:SetEndUV(0.1, 1, 2)
  FadeMaskAni:SetStartUV(1, 1, 3)
  FadeMaskAni:SetEndUV(0.4, 1, 3)
  panel:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_IN)
  local aniInfo3 = panel:addColorAnimation(0, 0.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo3:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo3.IsChangeChild = true
  local aniInfo8 = panel:addColorAnimation(0.12, 0.23, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo8:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo8:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo8:SetStartIntensity(3)
  aniInfo8:SetEndIntensity(1)
end

-- DECOMPILER ERROR at PC82: Confused about usage of register: R4 in 'UnsetPending'

UIAni.fadeInSCRDialog_Down = function(panel)
  -- function num : 0_13 , upvalues : UI_ANI_ADV, UI_TT, UI_color
  panel:ChangeSpecialTextureInfoName("new_ui_common_forlua/Default/Mask_Gradient_toBottom.dds")
  local FadeMaskAni = panel:addTextureUVAnimation(0, 0.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  FadeMaskAni:SetTextureType(UI_TT.PAUI_TEXTURE_TYPE_MASK)
  FadeMaskAni:SetStartUV(0, 0.6, 0)
  FadeMaskAni:SetEndUV(0, 0.1, 0)
  FadeMaskAni:SetStartUV(1, 0.6, 1)
  FadeMaskAni:SetEndUV(1, 0.1, 1)
  FadeMaskAni:SetStartUV(0, 1, 2)
  FadeMaskAni:SetEndUV(0, 0.4, 2)
  FadeMaskAni:SetStartUV(1, 1, 3)
  FadeMaskAni:SetEndUV(0, 0.4, 3)
  panel:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_IN)
  local aniInfo3 = panel:addColorAnimation(0, 0.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo3:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo3.IsChangeChild = true
end

-- DECOMPILER ERROR at PC88: Confused about usage of register: R4 in 'UnsetPending'

UIAni.fadeInSCRDialog_Left = function(panel)
  -- function num : 0_14 , upvalues : UI_ANI_ADV, UI_TT, UI_color
  panel:ChangeSpecialTextureInfoName("new_ui_common_forlua/Default/Mask_Gradient_toLeft.dds")
  local FadeMaskAni = panel:addTextureUVAnimation(0, 0.36, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  FadeMaskAni:SetTextureType(UI_TT.PAUI_TEXTURE_TYPE_MASK)
  FadeMaskAni:SetStartUV(0, 0, 0)
  FadeMaskAni:SetEndUV(0.6, 0, 0)
  FadeMaskAni:SetStartUV(0.4, 0, 1)
  FadeMaskAni:SetEndUV(1, 0, 1)
  FadeMaskAni:SetStartUV(0, 1, 2)
  FadeMaskAni:SetEndUV(0.6, 1, 2)
  FadeMaskAni:SetStartUV(0.4, 1, 3)
  FadeMaskAni:SetEndUV(1, 1, 3)
  panel:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_IN)
  local aniInfo3 = panel:addColorAnimation(0, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo3:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo3.IsChangeChild = true
  local aniInfo8 = panel:addColorAnimation(0.12, 0.23, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo8:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo8:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo8:SetStartIntensity(3)
  aniInfo8:SetEndIntensity(1)
end

-- DECOMPILER ERROR at PC92: Confused about usage of register: R4 in 'UnsetPending'

UIAni.AlphaAnimation = function(toAlpha, control, startTime, EndTime)
  -- function num : 0_15 , upvalues : UI_ANI_ADV
  control:ResetVertexAni()
  local alphaAni = control:addColorAnimation(startTime, EndTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  alphaAni:SetStartColorBySafe(PAUIColorType(control:GetAlpha() * 255, 255, 255, 255))
  alphaAni:SetEndColorBySafe(PAUIColorType(toAlpha * 255, 255, 255, 255))
  alphaAni.IsChangeChild = true
  return alphaAni
end

-- DECOMPILER ERROR at PC95: Confused about usage of register: R4 in 'UnsetPending'

UIAni.perFrameAlphaAnimation = function(toAlpha, control, rate)
  -- function num : 0_16
  local newAlpha = control:GetAlpha()
  if newAlpha == toAlpha then
    return 
  end
  if (math.abs)(toAlpha - newAlpha) < 0.01 then
    control:SetAlpha(toAlpha)
  else
    newAlpha = newAlpha + (toAlpha - newAlpha) * rate
    control:SetAlpha(newAlpha)
  end
  if newAlpha > 0 then
    control:SetShow(true)
  else
    control:SetShow(false)
  end
end

-- DECOMPILER ERROR at PC98: Confused about usage of register: R4 in 'UnsetPending'

UIAni.perFrameFontAlphaAnimation = function(toAlpha, control, rate)
  -- function num : 0_17
  local newAlpha = control:GetFontAlpha()
  if newAlpha == toAlpha then
    return 
  end
  if (math.abs)(toAlpha - newAlpha) < 0.01 then
    control:SetFontAlpha(toAlpha)
  else
    newAlpha = newAlpha + (toAlpha - newAlpha) * rate
    control:SetFontAlpha(newAlpha)
  end
  if newAlpha > 0 then
    control:SetShow(true)
  else
    control:SetShow(false)
  end
end

IsAniUse = function()
  -- function num : 0_18
  if _ContentsGroup_RenewUI_Dailog == true then
    return not Panel_Dialog_Main:GetShow()
  else
    return not Panel_Npc_Dialog:GetShow()
  end
end


