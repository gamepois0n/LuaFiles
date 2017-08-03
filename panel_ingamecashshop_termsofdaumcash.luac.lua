-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\ingamecashshop\panel_ingamecashshop_termsofdaumcash.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local preUIMode = (Defines.UIMode).eUIMode_InGameCashShop
Panel_IngameCashShop_TermsofDaumCash:SetShow(false)
Panel_IngameCashShop_TermsofDaumCash:setGlassBackground(true)
Panel_IngameCashShop_TermsofDaumCash:ActiveMouseEventEffect(true)
local termsofDaumCash = {panelTitle = (UI.getChildControl)(Panel_IngameCashShop_TermsofDaumCash, "StaticText_Title")}
Panel_IngameCashShop_TermsofDaumCash:RegisterShowEventFunc(true, "Panel_IngameCashShop_TermsofDaumCash_ShowAni()")
Panel_IngameCashShop_TermsofDaumCash:RegisterShowEventFunc(false, "Panel_IngameCashShop_TermsofDaumCash_HideAni()")
Panel_IngameCashShop_TermsofDaumCash_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_IngameCashShop_TermsofDaumCash)
  local aniInfo1 = Panel_IngameCashShop_TermsofDaumCash:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_IngameCashShop_TermsofDaumCash:GetSizeX() / 2
  aniInfo1.AxisY = Panel_IngameCashShop_TermsofDaumCash:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_IngameCashShop_TermsofDaumCash:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_IngameCashShop_TermsofDaumCash:GetSizeX() / 2
  aniInfo2.AxisY = Panel_IngameCashShop_TermsofDaumCash:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_IngameCashShop_TermsofDaumCash_HideAni = function()
  -- function num : 0_1
  Panel_IngameCashShop_TermsofDaumCash:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_IngameCashShop_TermsofDaumCash, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local _btn_Close = ((UI.getChildControl)(Panel_IngameCashShop_TermsofDaumCash, "Button_Close"))
local _Web = nil
Panel_IngameCashShop_TermsofDaumCash_Initialize = function()
  -- function num : 0_2 , upvalues : _Web
  _Web = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_IngameCashShop_TermsofDaumCash, "WebControl_TermsofDaumCash_WebLink")
  _Web:SetShow(true)
  _Web:SetPosX(43)
  _Web:SetPosY(63)
  _Web:SetSize(500, 552)
  _Web:ResetUrl()
end

Panel_IngameCashShop_TermsofDaumCash_Initialize()
termsofDaumCash_FirstUsePearl_Open = function(type)
  -- function num : 0_3 , upvalues : termsofDaumCash, _Web
  local self = termsofDaumCash
  audioPostEvent_SystemUi(13, 6)
  local url = ""
  -- DECOMPILER ERROR at PC17: Unhandled construct in 'MakeBoolean' P1

  if isGameServiceTypeKorReal() and type == 0 then
    url = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_TERMSOFDAUMCASH_URL_URL1")
  end
  if type == 1 then
    url = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_TERMSOFDAUMCASH_URL_URL2")
  end
  _Web:SetSize(500, 552)
  _Web:SetUrl(500, 552, url)
  ;
  (self.panelTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_TERMSOFDAUMCASH"))
  Panel_IngameCashShop_TermsofDaumCash:SetShow(true, true)
end

termsofDaumCash_Close = function()
  -- function num : 0_4 , upvalues : _Web
  _Web:ResetUrl()
  audioPostEvent_SystemUi(13, 5)
  Panel_IngameCashShop_TermsofDaumCash:SetShow(false, false)
end

HandleClicked_TermsofDaumCash_Close = function()
  -- function num : 0_5
  termsofDaumCash_Close()
end

HandleClicked_TermsofDaumCash_Next = function()
  -- function num : 0_6
  termsofDaumCash_Close()
end

FromClient_AcceptGeneralConditions = function()
  -- function num : 0_7
  if isGameServiceTypeKorReal() then
    termsofDaumCash_FirstUsePearl_Open(0)
  else
    termsofDaumCash_FirstUsePearl_Open(1)
  end
end

_btn_Close:addInputEvent("Mouse_LUp", "HandleClicked_TermsofDaumCash_Close()")
registerEvent("FromClient_AcceptGeneralConditions", "FromClient_AcceptGeneralConditions")

