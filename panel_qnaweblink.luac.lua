-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\qnaweblink\panel_qnaweblink.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local preUIMode = (Defines.UIMode).eUIMode_InGameCashShop
Panel_QnAWebLink:SetShow(false, false)
Panel_QnAWebLink:ActiveMouseEventEffect(true)
Panel_QnAWebLink:setGlassBackground(true)
Panel_QnAWebLink:RegisterShowEventFunc(true, "Panel_QnAWebLink_ShowAni()")
Panel_QnAWebLink:RegisterShowEventFunc(false, "Panel_QnAWebLink_HideAni()")
local eCountryType = CppEnums.CountryType
local gameServiceType = getGameServiceType()
local isKorea = eCountryType.NONE == gameServiceType or eCountryType.DEV == gameServiceType or eCountryType.KOR_ALPHA == gameServiceType or eCountryType.KOR_REAL == gameServiceType or eCountryType.KOR_TEST == gameServiceType
local isNaver = (CppEnums.MembershipType).naver == getMembershipType()
Panel_QnAWebLink_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_QnAWebLink)
  local aniInfo1 = Panel_QnAWebLink:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_QnAWebLink:GetSizeX() / 2
  aniInfo1.AxisY = Panel_QnAWebLink:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_QnAWebLink:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_QnAWebLink:GetSizeX() / 2
  aniInfo2.AxisY = Panel_QnAWebLink:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_QnAWebLink_HideAni = function()
  -- function num : 0_1
  Panel_QnAWebLink:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_QnAWebLink, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local _btn_Close = (UI.getChildControl)(Panel_QnAWebLink, "Button_Close")
local _btn_CloseWindow = (UI.getChildControl)(Panel_QnAWebLink, "Button_CloseWindow")
local _buttonQuestion = ((UI.getChildControl)(Panel_QnAWebLink, "Button_Question"))
do
  local _qnaWeb = nil
  Panel_QnAWebLink_Initialize = function()
  -- function num : 0_2 , upvalues : _qnaWeb
  _qnaWeb = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_QnAWebLink, "WebControl_QnAWebLink")
  _qnaWeb:SetShow(true)
  _qnaWeb:SetPosX(43)
  _qnaWeb:SetPosY(63)
  _qnaWeb:SetSize(1015, 586)
  _qnaWeb:ResetUrl()
end

  Panel_QnAWebLink_ShowToggle = function()
  -- function num : 0_3 , upvalues : _qnaWeb, preUIMode
  local isShow = Panel_QnAWebLink:IsShow()
  if isShow == true then
    _qnaWeb:ResetUrl()
    audioPostEvent_SystemUi(13, 5)
    Panel_QnAWebLink:SetShow(false, false)
    SetUIMode(preUIMode)
    return false
  else
    audioPostEvent_SystemUi(13, 6)
    Panel_QnAWebLink:SetShow(true, true)
    _qnaWeb:SetUrl(1015, 586, PAGetString(Defines.StringSheet_GAME, "LUA_QNAWEBLINK_URL"))
    _qnaWeb:SetIME(true)
    preUIMode = GetUIMode()
    SetUIMode((Defines.UIMode).eUIMode_QnAWebLink)
    return true
  end
  return false
end

  FGlobal_QnAWebLink_Open = function()
  -- function num : 0_4 , upvalues : isKorea, isNaver
  if isKorea == true and isNaver == true then
    local naverLink = "http://black.game.naver.com/black/cs/faq/index.daum"
    ToClient_OpenChargeWebPage(naverLink, false)
  else
    do
      if isGameTypeKorea() then
        ToClient_OpenChargeWebPage(PAGetString(Defines.StringSheet_GAME, "LUA_QNAWEBLINK_URL"), false)
      else
        if isGameTypeTaiwan() then
          if (CppEnums.CountryType).TW_ALPHA == getGameServiceType() then
            ToClient_OpenChargeWebPage(PAGetString(Defines.StringSheet_GAME, "LUA_QNAWEBLINK_URL_TW_ALPHA"), false)
          else
            if (CppEnums.CountryType).TW_REAL == getGameServiceType() then
              ToClient_OpenChargeWebPage(PAGetString(Defines.StringSheet_GAME, "LUA_QNAWEBLINK_URL_TW_REAL"), false)
            end
          end
        else
          ToClient_OpenChargeWebPage(PAGetString(Defines.StringSheet_GAME, "LUA_QNAWEBLINK_URL"), false)
        end
      end
    end
  end
end

  FGlobal_QnAWebLink_Close = function()
  -- function num : 0_5 , upvalues : _qnaWeb
  _qnaWeb:ResetUrl()
  audioPostEvent_SystemUi(13, 5)
  Panel_QnAWebLink:SetShow(false, false)
  if AllowChangeInputMode() then
    (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_UiMode)
  else
    SetFocusChatting()
  end
end

  _btn_Close:addInputEvent("Mouse_LUp", "Panel_QnAWebLink_ShowToggle()")
  _btn_CloseWindow:addInputEvent("Mouse_LUp", "Panel_QnAWebLink_ShowToggle()")
  -- DECOMPILER ERROR: 2 unprocessed JMP targets
end

