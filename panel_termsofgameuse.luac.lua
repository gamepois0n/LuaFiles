-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\panel_termsofgameuse.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local preUIMode = (Defines.UIMode).eUIMode_InGameCashShop
Panel_TermsofGameUse:SetShow(false, false)
Panel_TermsofGameUse:ActiveMouseEventEffect(true)
Panel_TermsofGameUse:setGlassBackground(true)
Panel_TermsofGameUse:RegisterShowEventFunc(true, "Panel_TermsofGameUse_ShowAni()")
Panel_TermsofGameUse:RegisterShowEventFunc(false, "Panel_TermsofGameUse_HideAni()")
Panel_TermsofGameUse_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_TermsofGameUse)
  local aniInfo1 = Panel_TermsofGameUse:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_TermsofGameUse:GetSizeX() / 2
  aniInfo1.AxisY = Panel_TermsofGameUse:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_TermsofGameUse:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_TermsofGameUse:GetSizeX() / 2
  aniInfo2.AxisY = Panel_TermsofGameUse:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_TermsofGameUse_HideAni = function()
  -- function num : 0_1
  Panel_TermsofGameUse:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_TermsofGameUse, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local _btn_Close = (UI.getChildControl)(Panel_TermsofGameUse, "Button_Close")
local _btn_Agree = ((UI.getChildControl)(Panel_TermsofGameUse, "Button_Agree"))
local _Web = nil
Panel_TermsofGameUse_Initialize = function()
  -- function num : 0_2 , upvalues : _Web
  _Web = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_TermsofGameUse, "WebControl_TermsofGameUse_WebLink")
  _Web:SetShow(true)
  _Web:SetPosX(43)
  _Web:SetPosY(63)
  _Web:SetSize(917, 586)
  _Web:ResetUrl()
end

Panel_TermsofGameUse_Initialize()
FGlobal_TermsofGameUse_Open = function()
  -- function num : 0_3 , upvalues : _Web
  local isTermsString = PAGetString(Defines.StringSheet_GAME, "LUA_TERMSOFGAMEUSE_URL_TW")
  if isGameTypeKorea() then
    isTermsString = PAGetString(Defines.StringSheet_GAME, "LUA_TERMSOFGAMEUSE_URL")
  else
    if isGameTypeTaiwan() then
      if (CppEnums.CountryType).TW_ALPHA == getGameServiceType() then
        isTermsString = PAGetString(Defines.StringSheet_GAME, "LUA_TERMSOFGAMEUSE_URL_TW_ALPHA")
      else
        if (CppEnums.CountryType).TW_REAL == getGameServiceType() then
          isTermsString = PAGetString(Defines.StringSheet_GAME, "LUA_TERMSOFGAMEUSE_URL_TW")
        end
      end
    else
      isTermsString = PAGetString(Defines.StringSheet_GAME, "LUA_TERMSOFGAMEUSE_URL")
    end
  end
  audioPostEvent_SystemUi(13, 6)
  Panel_TermsofGameUse:SetShow(true, true)
  _Web:SetUrl(917, 586, isTermsString)
end

TermsofGameUse_Close = function()
  -- function num : 0_4 , upvalues : _Web
  _Web:ResetUrl()
  audioPostEvent_SystemUi(13, 5)
  Panel_TermsofGameUse:SetShow(false, false)
end

HandleClicked_TermsofGameUse_Close = function()
  -- function num : 0_5
  TermsofGameUse_Close()
end

HandleClicked_TermsofGameUse_Next = function()
  -- function num : 0_6
  TermsofGameUse_Close()
  FGlobal_Panel_Login_Enter()
end

FGlobal_HandleClicked_TermsofGameUse_Next = function()
  -- function num : 0_7
  HandleClicked_TermsofGameUse_Next()
end

FGlobal_TermsofGameUse_Close = function()
  -- function num : 0_8
  TermsofGameUse_Close()
end

_btn_Close:addInputEvent("Mouse_LUp", "HandleClicked_TermsofGameUse_Close()")
_btn_Agree:addInputEvent("Mouse_LUp", "HandleClicked_TermsofGameUse_Next()")

