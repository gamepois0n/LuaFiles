-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\customization\panel_customization_webalbum.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
Panel_CustomizingAlbum:SetShow(false, false)
Panel_CustomizingAlbum:ActiveMouseEventEffect(true)
Panel_CustomizingAlbum:setGlassBackground(true)
Panel_CustomizingAlbum:RegisterShowEventFunc(true, "Panel_CustomizingAlbum_ShowAni()")
Panel_CustomizingAlbum:RegisterShowEventFunc(false, "Panel_CustomizingAlbum_HideAni()")
Panel_CustomizingAlbum_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_CustomizingAlbum)
  local aniInfo1 = Panel_CustomizingAlbum:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_CustomizingAlbum:GetSizeX() / 2
  aniInfo1.AxisY = Panel_CustomizingAlbum:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_CustomizingAlbum:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_CustomizingAlbum:GetSizeX() / 2
  aniInfo2.AxisY = Panel_CustomizingAlbum:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_CustomizingAlbum_HideAni = function()
  -- function num : 0_1
  Panel_CustomizingAlbum:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_CustomizingAlbum, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local _btn_Close = (UI.getChildControl)(Panel_CustomizingAlbum, "Button_Close")
_btn_Close:addInputEvent("Mouse_LUp", "CustomizingAlbum_Close()")
local _customizingAlbumWeb = nil
Panel_CustomizingAlbum_Initialize = function()
  -- function num : 0_2 , upvalues : _customizingAlbumWeb
  _customizingAlbumWeb = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_CustomizingAlbum, "WebControl_CustomizingAlbum")
  _customizingAlbumWeb:SetShow(true)
  _customizingAlbumWeb:SetPosX(15)
  _customizingAlbumWeb:SetPosY(55)
  _customizingAlbumWeb:SetSize(870, 630)
  _customizingAlbumWeb:ResetUrl()
end

Panel_CustomizingAlbum_Initialize()
local isCustomizationMode = nil
CustomizingAlbum_Open = function(isCTMode, isSceneState)
  -- function num : 0_3 , upvalues : _customizingAlbumWeb, isCustomizationMode
  audioPostEvent_SystemUi(13, 6)
  Panel_CustomizingAlbum:SetShow(true, true)
  FGlobal_SetCandidate()
  local UiConvertable = (CppEnums.ClientSceneState).eUIConvertableType_showTime
  if isSceneState == (CppEnums.ClientSceneState).eClientSceneStateType_Customization then
    UiConvertable = (CppEnums.UIConvertableType).eUIConvertableType_none
  else
    if isSceneState == (CppEnums.ClientSceneState).eClientSceneStateType_InGameCustomization then
      UiConvertable = (CppEnums.UIConvertableType).eUIConvertableType_none
    else
      if isSceneState == (CppEnums.ClientSceneState).eClientSceneStateType_InGame then
        UiConvertable = (CppEnums.UIConvertableType).eUIConvertableType_showTime
      end
    end
  end
  Panel_CustomizingAlbum:setUiConvertableType(UiConvertable)
  local temporaryWrapper = getTemporaryInformationWrapper()
  local worldNo = temporaryWrapper:getSelectedWorldServerNo()
  local url = PAGetString(Defines.StringSheet_GAME, "LUA_WEBALBUM_URL_KOR_DEV")
  if (CppEnums.CountryType).DEV == getGameServiceType() then
    url = PAGetString(Defines.StringSheet_GAME, "LUA_WEBALBUM_URL_KOR_DEV")
  else
    if (CppEnums.CountryType).KOR_ALPHA == getGameServiceType() then
      url = PAGetString(Defines.StringSheet_GAME, "LUA_WEBALBUM_URL_KOR_ALPHA")
    else
      if (CppEnums.CountryType).KOR_REAL == getGameServiceType() then
        url = PAGetString(Defines.StringSheet_GAME, "LUA_WEBALBUM_URL_KOR_REAL")
      else
        if (CppEnums.CountryType).NA_ALPHA == getGameServiceType() then
          if getServiceNationType() == 0 then
            url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WEBALBUM_URL_NA_ALPHA_NA", "port", worldNo)
          else
            if getServiceNationType() == 1 then
              url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WEBALBUM_URL_NA_ALPHA_EU", "port", worldNo)
            end
          end
        else
          if (CppEnums.CountryType).NA_REAL == getGameServiceType() then
            if getServiceNationType() == 0 then
              url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WEBALBUM_URL_NA_REAL_NA", "port", worldNo)
            else
              if getServiceNationType() == 1 then
                url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WEBALBUM_URL_NA_REAL_EU", "port", worldNo)
              end
            end
          else
            if (CppEnums.CountryType).JPN_ALPHA == getGameServiceType() then
              url = PAGetString(Defines.StringSheet_GAME, "LUA_WEBALBUM_URL_JP_ALPHA")
            else
              if (CppEnums.CountryType).JPN_REAL == getGameServiceType() then
                url = PAGetString(Defines.StringSheet_GAME, "LUA_WEBALBUM_URL_JP_REAL")
              else
                if (CppEnums.CountryType).RUS_ALPHA == getGameServiceType() then
                  url = PAGetString(Defines.StringSheet_GAME, "LUA_WEBALBUM_URL_RUS_ALPHA")
                else
                  if (CppEnums.CountryType).RUS_REAL == getGameServiceType() then
                    if isServerFixedCharge() then
                      url = PAGetString(Defines.StringSheet_GAME, "LUA_WEBALBUM_URL_RUS_REAL_P2P")
                    else
                      url = PAGetString(Defines.StringSheet_GAME, "LUA_WEBALBUM_URL_RUS_REAL_F2P")
                    end
                  else
                    if (CppEnums.CountryType).TW_ALPHA == getGameServiceType() then
                      url = PAGetString(Defines.StringSheet_GAME, "LUA_WEBALBUM_URL_TW_ALPHA")
                    else
                      if (CppEnums.CountryType).TW_REAL == getGameServiceType() then
                        url = PAGetString(Defines.StringSheet_GAME, "LUA_WEBALBUM_URL_TW_REAL")
                      else
                        if (CppEnums.CountryType).SA_ALPHA == getGameServiceType() then
                          url = PAGetString(Defines.StringSheet_GAME, "LUA_WEBALBUM_URL_SA_ALPHA")
                        else
                          if (CppEnums.CountryType).SA_REAL == getGameServiceType() then
                            url = PAGetString(Defines.StringSheet_GAME, "LUA_WEBALBUM_URL_SA_REAL")
                          else
                            if (CppEnums.CountryType).KR2_ALPHA == getGameServiceType() then
                              url = PAGetString(Defines.StringSheet_GAME, "LUA_WEBALBUM_URL_KR2_ALPHA")
                            else
                              if (CppEnums.CountryType).KR2_REAL == getGameServiceType() then
                                url = PAGetString(Defines.StringSheet_GAME, "LUA_WEBALBUM_URL_KR2_REAL")
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  local userNo = 0
  local userNickName = ""
  local cryptKey = ((getSelfPlayer()):get()):getWebAuthenticKeyCryptString()
  local classType = (getSelfPlayer()):getClassType()
  do
    local isGm = ToClient_SelfPlayerIsGM()
    if ToClient_isLobbyProcessor() then
      userNickName = getFamilyName()
      userNo = getUserNoByLobby()
    else
      userNickName = (getSelfPlayer()):getUserNickname()
      userNo = ((getSelfPlayer()):get()):getUserNo()
    end
    url = url .. "?userNo=" .. tostring(userNo) .. "&userNickname=" .. tostring(userNickName) .. "&certKey=" .. tostring(cryptKey) .. "&classType=" .. tostring(classType) .. "&isCustomizationMode=" .. tostring(isCTMode == true) .. "&isGm=" .. tostring(isGm)
    _customizingAlbumWeb:SetUrl(870, 630, url, false, true)
    _customizingAlbumWeb:SetIME(true)
    isCustomizationMode = isCTMode
    Panel_CustomizingAlbum:SetPosX(getScreenSizeX() / 2 - Panel_CustomizingAlbum:GetSizeX() / 2, getScreenSizeY() / 2 - Panel_CustomizingAlbum:GetSizeY() / 2)
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

CustomizingAlbum_Close = function()
  -- function num : 0_4 , upvalues : _customizingAlbumWeb
  FGlobal_ClearCandidate()
  _customizingAlbumWeb:ResetUrl()
  Panel_CustomizingAlbum:SetShow(false, false)
end

FGlobal_CustomizingAlbum_Show = function(isCTMode, isSceneState)
  -- function num : 0_5
  CustomizingAlbum_Open(isCTMode, isSceneState)
end

FGlobal_CustomizingAlbum_ShowByScreenShotFrame = function()
  -- function num : 0_6
  audioPostEvent_SystemUi(13, 6)
  Panel_CustomizingAlbum:SetShow(true, true)
end

FGlobal_CustomizingAlbum_Close = function()
  -- function num : 0_7
  Panel_CustomizingAlbum:SetShow(false, false)
end


