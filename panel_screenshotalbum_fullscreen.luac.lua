-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\screenshotmode\panel_screenshotalbum_fullscreen.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
Panel_ScreenShotAlbum_FullScreen:SetShow(false, false)
Panel_ScreenShotAlbum_FullScreen:ActiveMouseEventEffect(true)
Panel_ScreenShotAlbum_FullScreen:setGlassBackground(true)
Panel_ScreenShotAlbum_FullScreen:RegisterShowEventFunc(true, "Panel_ScreenShotAlbum_FullScreen_ShowAni()")
Panel_ScreenShotAlbum_FullScreen:RegisterShowEventFunc(false, "Panel_ScreenShotAlbum_FullScreen_HideAni()")
Panel_ScreenShotAlbum_FullScreen_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_ScreenShotAlbum_FullScreen)
  local aniInfo1 = Panel_ScreenShotAlbum_FullScreen:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_ScreenShotAlbum_FullScreen:GetSizeX() / 2
  aniInfo1.AxisY = Panel_ScreenShotAlbum_FullScreen:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_ScreenShotAlbum_FullScreen:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_ScreenShotAlbum_FullScreen:GetSizeX() / 2
  aniInfo2.AxisY = Panel_ScreenShotAlbum_FullScreen:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_ScreenShotAlbum_FullScreen_HideAni = function()
  -- function num : 0_1
  Panel_ScreenShotAlbum_FullScreen:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_ScreenShotAlbum_FullScreen, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local titleBar = (UI.getChildControl)(Panel_ScreenShotAlbum_FullScreen, "StaticText_Title")
local _btn_Close = (UI.getChildControl)(Panel_ScreenShotAlbum_FullScreen, "Button_Close")
_btn_Close:addInputEvent("Mouse_LUp", "ScreenshotAlbum_FullScreen_Close()")
local _screenshotAlbumWeb = nil
Panel_ScreenShotAlbum_FullScreen_Initialize = function()
  -- function num : 0_2 , upvalues : _screenshotAlbumWeb
  _screenshotAlbumWeb = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_ScreenShotAlbum_FullScreen, "WebControl_ScreenshotAlbum")
  _screenshotAlbumWeb:SetShow(true)
  _screenshotAlbumWeb:SetSize(875, 635)
  _screenshotAlbumWeb:ResetUrl()
end

Panel_ScreenShotAlbum_FullScreen_Initialize()
ScreenshotAlbum_FullScreen_Open = function(addUrl)
  -- function num : 0_3 , upvalues : _screenshotAlbumWeb, titleBar
  audioPostEvent_SystemUi(13, 6)
  Panel_ScreenShotAlbum_FullScreen:SetShow(true, true)
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
  url = url .. addUrl
  local scrX = getScreenSizeX()
  local scrY = getScreenSizeY()
  Panel_ScreenShotAlbum_FullScreen:SetSize(scrX, scrY)
  Panel_ScreenShotAlbum_FullScreen:SetPosX(0)
  Panel_ScreenShotAlbum_FullScreen:SetPosY(0)
  _screenshotAlbumWeb:SetSize(scrX - 30, scrY - 70)
  _screenshotAlbumWeb:SetPosX(15)
  _screenshotAlbumWeb:SetPosY(55)
  _screenshotAlbumWeb:SetUrl(scrX - 30, scrY - 70, url, false, true)
  _screenshotAlbumWeb:SetIME(true)
  titleBar:SetSize(scrX - 13, titleBar:GetSizeY())
  titleBar:ComputePos()
end

ScreenshotAlbum_FullScreen_Close = function()
  -- function num : 0_4 , upvalues : _screenshotAlbumWeb
  FGlobal_ClearCandidate()
  _screenshotAlbumWeb:ResetUrl()
  Panel_ScreenShotAlbum_FullScreen:SetShow(false, false)
  FGlobal_ScreenshotAlbum_ShowByScreenShotFrame()
end

FGlobal_ScreenShotAlbumOpen_FullScreen = function(url)
  -- function num : 0_5
  FGlobal_ScreenshotAlbum_Close()
  ScreenshotAlbum_FullScreen_Open(url)
end


