-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\skill\panel_window_skill_animation.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
Skill_ShowAni = function()
  -- function num : 0_0
  (UIAni.fadeInSCR_Down)(Panel_Window_Skill)
end

Skill_HideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
  Panel_Window_Skill:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local skillHideAni = Panel_Window_Skill:addColorAnimation(0, 0.12, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  skillHideAni:SetStartColor(UI_color.C_FFFFFFFF)
  skillHideAni:SetEndColor(UI_color.C_00FFFFFF)
  skillHideAni:SetStartIntensity(3)
  skillHideAni:SetEndIntensity(1)
  skillHideAni.IsChangeChild = true
  skillHideAni:SetHideAtEnd(true)
  skillHideAni:SetDisableWhileAni(true)
end

-- DECOMPILER ERROR at PC13: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Skill.OpenLearnAni1 = function(self)
  -- function num : 0_2 , upvalues : UI_ANI_ADV
  local aniInfo1 = Panel_Window_Skill:addScaleAnimation(0, 0.12, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_Window_Skill:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Window_Skill:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
end

-- DECOMPILER ERROR at PC17: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Skill.OpenLearnAni2 = function(self)
  -- function num : 0_3 , upvalues : UI_ANI_ADV
  local aniInfo2 = Panel_Window_Skill:addScaleAnimation(0.12, 0.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Window_Skill:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Window_Skill:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end


