-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\screenshotmode\panel_screenshot_webalbum.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
Panel_ScreenShotAlbum:SetShow(false, false)
Panel_ScreenShotAlbum:ActiveMouseEventEffect(true)
Panel_ScreenShotAlbum:setGlassBackground(true)
Panel_ScreenShotAlbum:RegisterShowEventFunc(true, "Panel_ScreenShotAlbum_ShowAni()")
Panel_ScreenShotAlbum:RegisterShowEventFunc(false, "Panel_ScreenShotAlbum_HideAni()")
Panel_ScreenShotAlbum_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_ScreenShotAlbum)
  local aniInfo1 = Panel_ScreenShotAlbum:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_ScreenShotAlbum:GetSizeX() / 2
  aniInfo1.AxisY = Panel_ScreenShotAlbum:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_ScreenShotAlbum:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_ScreenShotAlbum:GetSizeX() / 2
  aniInfo2.AxisY = Panel_ScreenShotAlbum:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_ScreenShotAlbum_HideAni = function()
  -- function num : 0_1
  Panel_ScreenShotAlbum:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_ScreenShotAlbum, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local _btn_Close = (UI.getChildControl)(Panel_ScreenShotAlbum, "Button_Close")
_btn_Close:addInputEvent("Mouse_LUp", "ScreenshotAlbum_Close()")
local _screenshotAlbumWeb = nil
Panel_ScreenShotAlbum_Initialize = function()
  -- function num : 0_2 , upvalues : _screenshotAlbumWeb
  _screenshotAlbumWeb = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_ScreenShotAlbum, "WebControl_ScreenshotAlbum")
  _screenshotAlbumWeb:SetShow(true)
  _screenshotAlbumWeb:SetPosX(15)
  _screenshotAlbumWeb:SetPosY(55)
  _screenshotAlbumWeb:SetSize(875, 635)
  _screenshotAlbumWeb:ResetUrl()
end

Panel_ScreenShotAlbum_Initialize()
ScreenshotAlbum_Open = function()
  -- function num : 0_3 , upvalues : _screenshotAlbumWeb
  audioPostEvent_SystemUi(13, 6)
  Panel_ScreenShotAlbum:SetShow(true, true)
  FGlobal_SetCandidate()
  local temporaryWrapper = getTemporaryInformationWrapper()
  local worldNo = temporaryWrapper:getSelectedWorldServerNo()
  local url = "http://10.32.129.20/ScreenShot/"
  if (CppEnums.CountryType).KOR_ALPHA == getGameServiceType() then
    url = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOT_WEBALBUM_ALPHA")
  else
    if (CppEnums.CountryType).KOR_REAL == getGameServiceType() then
      url = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOT_WEBALBUM_REAL")
    else
      if (CppEnums.CountryType).NA_ALPHA == getGameServiceType() then
        if getServiceNationType() == 0 then
          url = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOT_WEBALBUM_ALPHA_NA")
        else
          if getServiceNationType() == 1 then
            url = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOT_WEBALBUM_ALPHA_EU")
          end
        end
      else
        if (CppEnums.CountryType).NA_REAL == getGameServiceType() then
          if getServiceNationType() == 0 then
            url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SCREENSHOT_WEBALBUM_REAL_NA", "worldNo", worldNo)
          else
            if getServiceNationType() == 1 then
              url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SCREENSHOT_WEBALBUM_REAL_EU", "worldNo", worldNo)
            end
          end
        else
          if (CppEnums.CountryType).JPN_ALPHA == getGameServiceType() then
            url = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOT_WEBALBUM_ALPHA_JP")
          else
            if (CppEnums.CountryType).JPN_REAL == getGameServiceType() then
              url = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOT_WEBALBUM_REAL_JP")
            else
              if (CppEnums.CountryType).RUS_ALPHA == getGameServiceType() then
                url = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOT_WEBALBUM_ALPHA_RUS")
              else
                if (CppEnums.CountryType).RUS_REAL == getGameServiceType() then
                  if isServerFixedCharge() then
                    url = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOT_WEBALBUM_REAL_RUS_P2P")
                  else
                    url = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOT_WEBALBUM_REAL_RUS_F2P")
                  end
                else
                  if (CppEnums.CountryType).TW_ALPHA == getGameServiceType() then
                    url = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOT_WEBALBUM_ALPHA_TW")
                  else
                    if (CppEnums.CountryType).TW_REAL == getGameServiceType() then
                      url = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOT_WEBALBUM_REAL_TW")
                    else
                      if (CppEnums.CountryType).SA_ALPHA == getGameServiceType() then
                        url = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOT_WEBALBUM_ALPHA_SA")
                      else
                        if (CppEnums.CountryType).SA_REAL == getGameServiceType() then
                          url = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOT_WEBALBUM_REAL_SA")
                        else
                          if (CppEnums.CountryType).KR2_ALPHA == getGameServiceType() then
                            url = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOT_WEBALBUM_ALPHA_KR2")
                          else
                            if (CppEnums.CountryType).KR2_REAL == getGameServiceType() then
                              url = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOT_WEBALBUM_REAL_KR2")
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
  if getSelfPlayer() == nil then
    return 
  end
  local userNo = ((getSelfPlayer()):get()):getUserNo()
  local cryptKey = ((getSelfPlayer()):get()):getWebAuthenticKeyCryptString()
  local classType = (getSelfPlayer()):getClassType()
  local isGm = ToClient_SelfPlayerIsGM()
  url = url .. "?userNo=" .. tostring(userNo) .. "&certKey=" .. tostring(cryptKey) .. "&classType=" .. tostring(classType) .. "&isGm=" .. tostring(isGm)
  _screenshotAlbumWeb:SetUrl(875, 635, url, false, true)
  _screenshotAlbumWeb:SetIME(true)
  Panel_ScreenShotAlbum:SetPosX(getScreenSizeX() / 2 - Panel_ScreenShotAlbum:GetSizeX() / 2, getScreenSizeY() / 2 - Panel_ScreenShotAlbum:GetSizeY() / 2)
end

ScreenshotAlbum_Close = function()
  -- function num : 0_4 , upvalues : _screenshotAlbumWeb
  FGlobal_ClearCandidate()
  _screenshotAlbumWeb:ResetUrl()
  Panel_ScreenShotAlbum:SetShow(false, false)
end

FGlobal_ScreenshotAlbum_Show = function(isCTMode)
  -- function num : 0_5
  ScreenshotAlbum_Open(isCTMode)
end

FGlobal_ScreenshotAlbum_ShowByScreenShotFrame = function()
  -- function num : 0_6
  audioPostEvent_SystemUi(13, 6)
  Panel_ScreenShotAlbum:SetShow(true, true)
end

FGlobal_ScreenshotAlbum_Close = function()
  -- function num : 0_7
  Panel_ScreenShotAlbum:SetShow(false, false)
end


