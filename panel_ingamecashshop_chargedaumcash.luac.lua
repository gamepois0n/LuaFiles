-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\ingamecashshop\panel_ingamecashshop_chargedaumcash.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local preUIMode = (Defines.UIMode).eUIMode_InGameCashShop
local UI_SERVICE_RESOURCE = CppEnums.ServiceResourceType
Panel_IngameCashShop_ChargeDaumCash:SetShow(false)
Panel_IngameCashShop_ChargeDaumCash:setGlassBackground(true)
Panel_IngameCashShop_ChargeDaumCash:ActiveMouseEventEffect(true)
local termsofDaumCash = {panelTitle = (UI.getChildControl)(Panel_IngameCashShop_ChargeDaumCash, "StaticText_Title")}
local eCountryType = CppEnums.CountryType
local gameServiceType = getGameServiceType()
local isKorea = eCountryType.NONE == gameServiceType or eCountryType.DEV == gameServiceType or eCountryType.KOR_ALPHA == gameServiceType or eCountryType.KOR_REAL == gameServiceType or eCountryType.KOR_TEST == gameServiceType
local isNaver = (CppEnums.MembershipType).naver == getMembershipType()
Panel_IngameCashShop_ChargeDaumCash:RegisterShowEventFunc(true, "Panel_IngameCashShop_ChargeDaumCash_ShowAni()")
Panel_IngameCashShop_ChargeDaumCash:RegisterShowEventFunc(false, "Panel_IngameCashShop_ChargeDaumCash_HideAni()")
Panel_IngameCashShop_ChargeDaumCash_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_IngameCashShop_ChargeDaumCash)
  local aniInfo1 = Panel_IngameCashShop_ChargeDaumCash:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_IngameCashShop_ChargeDaumCash:GetSizeX() / 2
  aniInfo1.AxisY = Panel_IngameCashShop_ChargeDaumCash:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_IngameCashShop_ChargeDaumCash:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_IngameCashShop_ChargeDaumCash:GetSizeX() / 2
  aniInfo2.AxisY = Panel_IngameCashShop_ChargeDaumCash:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_IngameCashShop_ChargeDaumCash_HideAni = function()
  -- function num : 0_1
  Panel_IngameCashShop_ChargeDaumCash:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_IngameCashShop_ChargeDaumCash, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local _btn_Close = ((UI.getChildControl)(Panel_IngameCashShop_ChargeDaumCash, "Button_Close"))
do
  local _Web = nil
  Panel_IngameCashShop_ChargeDaumCash_Initialize = function()
  -- function num : 0_2 , upvalues : _Web
  _Web = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_IngameCashShop_ChargeDaumCash, "WebControl_ChargeDaumCash_WebLink")
  _Web:SetShow(true)
  _Web:SetPosX(43)
  _Web:SetPosY(63)
  _Web:SetSize(917, 586)
  _Web:ResetUrl()
end

  Panel_IngameCashShop_ChargeDaumCash_Initialize()
  chargeDaumCash_Open = function()
  -- function num : 0_3 , upvalues : termsofDaumCash, UI_SERVICE_RESOURCE, isNaver
  local self = termsofDaumCash
  local url = nil
  local langType = "EN"
  local SALangType = "PT"
  if UI_SERVICE_RESOURCE.eServiceResourceType_EN == getGameServiceResType() then
    langType = "EN"
  else
    if UI_SERVICE_RESOURCE.eServiceResourceType_FR == getGameServiceResType() then
      langType = "FR"
    else
      if UI_SERVICE_RESOURCE.eServiceResourceType_DE == getGameServiceResType() then
        langType = "DE"
      end
    end
  end
  if UI_SERVICE_RESOURCE.eServiceResourceType_ES == getGameServiceResType() then
    SALangType = "es"
  else
    if UI_SERVICE_RESOURCE.eServiceResourceType_PT == getGameServiceResType() then
      SALangType = "pt"
    end
  end
  if isGameServiceTypeKorReal() then
    if isNaver then
      url = "http://black.game.naver.com/black/billing/shop/index.daum"
    else
      url = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_CHARGEDAUMCASH_URL_URL1")
    end
  else
    if (CppEnums.GameServiceType).eGameServiceType_DEV == getGameServiceType() then
      url = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_CHARGEDAUMCASH_URL_URL2")
    else
      if isGameTypeEnglish() then
        if isSteamClient() then
          if not isSteamInGameOverlayEnabled() then
            local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_STEAM_ALERT")
            local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
            ;
            (MessageBox.showMessageBox)(messageBoxData)
            return 
          end
          do
            ToClient_requestCashChargeAuthSessionTicket()
            do
              local ticket = getSteamAuthSessionTicket()
              url = "https://www.blackdesertonline.com/steam/DaumCash.html?appId=582660&steamTicket=" .. ticket .. "&lang=" .. langType
              steamOverlayToWebPage(url)
              do return  end
              if (CppEnums.GameServiceType).eGameServiceType_NA_ALPHA == getGameServiceType() then
                url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_CHARGEDAUMCASH_URL_NA_TEST", "langType", langType)
              else
                if (CppEnums.GameServiceType).eGameServiceType_NA_REAL == getGameServiceType() then
                  url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_CHARGEDAUMCASH_URL_NA_REAL", "langType", langType)
                end
              end
              if (CppEnums.CountryType).TW_ALPHA == getGameServiceType() then
                url = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_CHARGEDAUMCASH_URL_TW_TEST")
              else
                if (CppEnums.CountryType).TW_REAL == getGameServiceType() then
                  url = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_CHARGEDAUMCASH_URL_TW_REAL")
                else
                  if (CppEnums.CountryType).SA_ALPHA == getGameServiceType() then
                    url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_CHARGEDAUMCASH_URL_SA_TEST", "lang", SALangType)
                  else
                    if (CppEnums.CountryType).SA_REAL == getGameServiceType() then
                      url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_CHARGEDAUMCASH_URL_SA_REAL", "lang", SALangType)
                    else
                      url = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_CHARGEDAUMCASH_URL_URL2")
                    end
                  end
                end
              end
              local exeIE = true
              if isGameTypeKorea() then
                exeIE = true
              else
                exeIE = false
              end
              ToClient_OpenChargeWebPage(url, exeIE)
              local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_NOTIFY_CHARGEDAUMCASH")
              local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = IngameCashShop_ChargeComplete, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
              ;
              (MessageBox.showMessageBox)(messageBoxData)
            end
          end
        end
      end
    end
  end
end

  IngameCashShop_ChargeComplete = function()
  -- function num : 0_4
  ToClient_ChargeComplete()
  InGameShop_RefreshCash()
end

  chargeDaumCash_Close = function()
  -- function num : 0_5
  audioPostEvent_SystemUi(13, 5)
  Panel_IngameCashShop_ChargeDaumCash:SetShow(false, false)
end

  HandleClicked_ChargeDaumCash_Close = function()
  -- function num : 0_6 , upvalues : isNaver
  if not isNaver then
    cashShop_requestCash()
  end
  chargeDaumCash_Close()
end

  FGlobal_BuyDaumCash = function()
  -- function num : 0_7
  chargeDaumCash_Open()
end

  FromClient_NeedPublishCash = function()
  -- function num : 0_8
  local messageboxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_NEEDPUBLISHCASH")
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYPEARLBOX_CONFIRM"), content = messageboxMemo, functionYes = FGlobal_BuyDaumCash, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

  FromClient_SteamCashChargeAuthTicketReady = function()
  -- function num : 0_9 , upvalues : UI_SERVICE_RESOURCE
  local url = nil
  local langType = "EN"
  if UI_SERVICE_RESOURCE.eServiceResourceType_EN == getGameServiceResType() then
    langType = "EN"
  else
    if UI_SERVICE_RESOURCE.eServiceResourceType_FR == getGameServiceResType() then
      langType = "FR"
    else
      if UI_SERVICE_RESOURCE.eServiceResourceType_DE == getGameServiceResType() then
        langType = "DE"
      end
    end
  end
  local ticket = getSteamAuthSessionTicket()
  url = "https://www.blackdesertonline.com/steam/DaumCash.html?appId=582660&steamTicket=" .. ticket .. "&lang=" .. langType
  steamOverlayToWebPage(url)
end

  _btn_Close:addInputEvent("Mouse_LUp", "HandleClicked_ChargeDaumCash_Close()")
  registerEvent("FromClient_NeedPublishCash", "FromClient_NeedPublishCash")
  registerEvent("FromClient_SteamCashChargeAuthTicketReady", "FromClient_SteamCashChargeAuthTicketReady")
  -- DECOMPILER ERROR: 2 unprocessed JMP targets
end

