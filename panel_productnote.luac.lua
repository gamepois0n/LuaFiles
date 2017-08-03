-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\productnote\panel_productnote.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local preUIMode = (Defines.UIMode).eUIMode_Default
local IM = CppEnums.EProcessorInputMode
Panel_ProductNote:SetShow(false, false)
Panel_ProductNote:ActiveMouseEventEffect(true)
Panel_ProductNote:setGlassBackground(true)
Panel_ProductNote:RegisterShowEventFunc(true, "Panel_ProductNote_ShowAni()")
Panel_ProductNote:RegisterShowEventFunc(false, "Panel_ProductNote_HideAni()")
Panel_ProductNote_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_ProductNote)
  local aniInfo1 = Panel_ProductNote:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_ProductNote:GetSizeX() / 2
  aniInfo1.AxisY = Panel_ProductNote:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_ProductNote:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_ProductNote:GetSizeX() / 2
  aniInfo2.AxisY = Panel_ProductNote:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_ProductNote_HideAni = function()
  -- function num : 0_1
  Panel_ProductNote:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_ProductNote, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local _btn_Close = (UI.getChildControl)(Panel_ProductNote, "Button_Close")
local _btn_CloseWindow = (UI.getChildControl)(Panel_ProductNote, "Button_CloseWindow")
local _btn_PopUp = (UI.getChildControl)(Panel_ProductNote, "CheckButton_PopUp")
local isPopUpContentsEnable = ToClient_IsContentsGroupOpen("240")
_btn_PopUp:SetShow(isPopUpContentsEnable)
_btn_PopUp:addInputEvent("Mouse_LUp", "HandleClicked_ProductNote_PopUp()")
_btn_PopUp:addInputEvent("Mouse_On", "ProductNote_PopUp_ShowIconToolTip( true )")
_btn_PopUp:addInputEvent("Mouse_Out", "ProductNote_PopUp_ShowIconToolTip( false )")
local _buttonQuestion = (UI.getChildControl)(Panel_ProductNote, "Button_Question")
_buttonQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"ProductNote\" )")
_buttonQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"ProductNote\", \"true\")")
_buttonQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"ProductNote\", \"false\")")
local _productWeb = nil
Panel_ProductNote_Initialize = function()
  -- function num : 0_2 , upvalues : _productWeb
  _productWeb = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_ProductNote, "WebControl_ProductNote")
  _productWeb:SetShow(true)
  _productWeb:SetPosX(43)
  _productWeb:SetPosY(63)
  _productWeb:SetSize(700, 558)
  _productWeb:ResetUrl()
end

Panel_ProductNote_Initialize()
Panel_ProductNote_ShowToggle = function()
  -- function num : 0_3 , upvalues : _productWeb, IM, _btn_PopUp
  local isShow = Panel_ProductNote:IsShow()
  if ToClient_IsConferenceMode() then
    return 
  end
  if isShow == true then
    FGlobal_ClearCandidate()
    _productWeb:ResetUrl()
    audioPostEvent_SystemUi(13, 5)
    Panel_ProductNote:SetShow(false, false)
    ClearFocusEdit()
    ;
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    _btn_PopUp:SetCheck(false)
    if Panel_ProductNote:IsUISubApp() then
      Panel_ProductNote:CloseUISubApp()
    end
    return false
  else
    audioPostEvent_SystemUi(13, 6)
    Panel_ProductNote:SetShow(true, true)
    FGlobal_SetCandidate()
    _productWeb:SetUrl(700, 558, "coui://UI_Data/UI_Html/Window/ProductNote/ProductNote_CategoryItemList.html?nodeProduct")
    _productWeb:SetIME(true)
    return true
  end
  return true
end

Panel_ProductNoteClose = function()
  -- function num : 0_4
end

ProductNote_Item_ShowToggle = function(itemKey)
  -- function num : 0_5 , upvalues : _productWeb, _btn_PopUp
  if ToClient_IsConferenceMode() then
    return 
  end
  if isShow == true then
    FGlobal_ClearCandidate()
    _productWeb:ResetUrl()
    audioPostEvent_SystemUi(13, 5)
    Panel_ProductNote:SetShow(false, false)
    if AllowChangeInputMode() then
      ClearFocusEdit()
      ;
      (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_UiMode)
    else
      SetFocusChatting()
    end
    _btn_PopUp:SetCheck(false)
    if Panel_ProductNote:IsUISubApp() then
      Panel_ProductNote:CloseUISubApp()
    end
  else
    audioPostEvent_SystemUi(13, 6)
    Panel_ProductNote:SetShow(true, true)
    FGlobal_SetCandidate()
    _productWeb:SetUrl(700, 558, "coui://UI_Data/UI_Html/Window/ProductNote/ProductNote_CategoryItemList.html?manufacture&" .. itemKey)
    _productWeb:SetIME(true)
  end
end

ProductNote_onScreenResize = function()
  -- function num : 0_6
  Panel_ProductNote:SetPosX((math.floor)((getScreenSizeX() - Panel_ProductNote:GetSizeX()) / 2))
  Panel_ProductNote:SetPosY((math.floor)((getScreenSizeY() - Panel_ProductNote:GetSizeY()) / 2))
end

HandleClicked_ProductNote_PopUp = function()
  -- function num : 0_7 , upvalues : _btn_PopUp
  if _btn_PopUp:IsCheck() then
    Panel_ProductNote:OpenUISubApp()
  else
    Panel_ProductNote:CloseUISubApp()
  end
  TooltipSimple_Hide()
end

ProductNote_PopUp_ShowIconToolTip = function(isShow)
  -- function num : 0_8 , upvalues : _btn_PopUp
  if isShow then
    local name = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_TOOLTIP_NAME")
    local desc = ""
    if _btn_PopUp:IsCheck() then
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_CHECK_TOOLTIP")
    else
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_NOCHECK_TOOLTIP")
    end
    TooltipSimple_Show(_btn_PopUp, name, desc)
  else
    do
      TooltipSimple_Hide()
    end
  end
end

_btn_Close:addInputEvent("Mouse_LUp", "Panel_ProductNote_ShowToggle()")
_btn_CloseWindow:addInputEvent("Mouse_LUp", "Panel_ProductNote_ShowToggle()")
registerEvent("onScreenResize", "ProductNote_onScreenResize")

