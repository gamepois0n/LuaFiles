-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\nakmessage\actionmessage.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local IM = CppEnums.EProcessorInputMode
local _text_Msg = (UI.getChildControl)(Panel_ActionMessage, "MsgText")
Panel_ActionMessage:setFlushAble(false)
Panel_ActionMessage:RegisterShowEventFunc(true, "ActionMessageShowAni()")
Panel_ActionMessage:RegisterShowEventFunc(false, "ActionMessageHideAni()")
ActionMessageShowAni = function()
  -- function num : 0_0 , upvalues : IM, UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_ActionMessage)
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiModeNotInput)
  local aniInfo1 = Panel_ActionMessage:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_ActionMessage:GetSizeX() / 2
  aniInfo1.AxisY = Panel_ActionMessage:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_ActionMessage:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_ActionMessage:GetSizeX() / 2
  aniInfo2.AxisY = Panel_ActionMessage:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

ActionMessageHideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
  Panel_ActionMessage:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_ActionMessage:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

ActionMessageShowByObservertory = function()
  -- function num : 0_2 , upvalues : _text_Msg
  if Panel_WatchingMode:GetShow() then
    return 
  end
  _text_Msg:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ACTIONNAKMESSAGE"))
  Panel_ActionMessage:SetShow(true, true)
end

ActionMessageHide = function()
  -- function num : 0_3
  Panel_ActionMessage:SetShow(false, true)
end

ActionMessagePanel_Resize = function()
  -- function num : 0_4
  Panel_ActionMessage:SetPosX((getScreenSizeX() - Panel_ActionMessage:GetSizeX()) * 0.5)
end

ActionMessagePanel_Resize()
ActionChartEventBindFunction(305, ActionMessageShowByObservertory)
ActionChartEventBindFunction(306, ActionMessageHide)

