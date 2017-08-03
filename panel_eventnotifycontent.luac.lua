-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\eventnotify\panel_eventnotifycontent.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
Panel_EventNotifyContent:SetShow(false)
Panel_EventNotifyContent:setGlassBackground(true)
Panel_EventNotifyContent:ActiveMouseEventEffect(true)
Panel_EventNotifyContent:RegisterShowEventFunc(true, "Panel_EventNotifyContent_ShowAni()")
Panel_EventNotifyContent:RegisterShowEventFunc(false, "Panel_EventNotifyContent_HideAni()")
local isBeforeShow = false
Panel_EventNotifyContent_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_EventNotifyContent)
  local aniInfo1 = Panel_EventNotifyContent:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_EventNotifyContent:GetSizeX() / 2
  aniInfo1.AxisY = Panel_EventNotifyContent:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_EventNotifyContent:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_EventNotifyContent:GetSizeX() / 2
  aniInfo2.AxisY = Panel_EventNotifyContent:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_EventNotifyContent_HideAni = function()
  -- function num : 0_1
  Panel_EventNotifyContent:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_EventNotifyContent, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local _btn_Close = ((UI.getChildControl)(Panel_EventNotifyContent, "Button_Close"))
local _Web = nil
local isShowEventNotifyContent = false
Panel_EventNotifyContent_Initialize = function()
  -- function num : 0_2 , upvalues : _Web
  _Web = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_EventNotifyContent, "WebControl_EventNotifyContent_WebLink")
  _Web:SetShow(true)
  _Web:SetPosX(43)
  _Web:SetPosY(63)
  _Web:SetSize(817, 600)
  _Web:ResetUrl()
  Panel_EventNotifyContent:SetSize(905, 700)
end

Panel_EventNotifyContent_Initialize()
FGlobal_EventNotifyContent_Open = function(eventIndex)
  -- function num : 0_3 , upvalues : _Web
  audioPostEvent_SystemUi(13, 6)
  local url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_EVENTCONTENT_URL", "index", eventIndex)
  if isGameTypeKorea() then
    url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_EVENTCONTENT_URL", "index", eventIndex)
  else
    if isGameTypeTaiwan() then
      if (CppEnums.CountryType).TW_ALPHA == getGameServiceType() then
        url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_EVENTCONTENT_URL_TW_ALPHA", "index", eventIndex)
      else
        if (CppEnums.CountryType).TW_REAL == getGameServiceType() then
          url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_EVENTCONTENT_URL_TW", "index", eventIndex)
        end
      end
    else
      if isGameTypeSA() then
        if (CppEnums.CountryType).SA_ALPHA == getGameServiceType() then
          url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_EVENTCONTENT_URL_SA_ALPHA", "index", eventIndex)
        else
          if (CppEnums.CountryType).SA_REAL == getGameServiceType() then
            url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_EVENTCONTENT_URL_SA", "index", eventIndex)
          end
        end
      else
        url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_EVENTCONTENT_URL", "index", eventIndex)
      end
    end
  end
  local isType = false
  if isGameTypeTaiwan() then
    isType = true
  else
    isType = false
  end
  _Web:SetSize(817, 600)
  _Web:SetUrl(817, 600, url, false, isType)
  Panel_EventNotifyContent:SetPosX(getScreenSizeX() / 2 - Panel_EventNotifyContent:GetSizeX() / 2)
  Panel_EventNotifyContent:SetPosY(getScreenSizeY() / 2 - Panel_EventNotifyContent:GetSizeY() / 2)
  Panel_EventNotifyContent:SetShow(true, true)
  SetUIMode((Defines.UIMode).eUIMode_EventNotify)
end

EventNotifyContent_Close = function()
  -- function num : 0_4 , upvalues : _Web
  _Web:ResetUrl()
  audioPostEvent_SystemUi(13, 5)
  Panel_EventNotifyContent:SetShow(false, false)
end

HandleClicked_EventNotifyContent_Close = function()
  -- function num : 0_5
  EventNotifyContent_Close()
  SetUIMode((Defines.UIMode).eUIMode_Default)
end

registerEvent("FromWeb_ExecuteLuaFuncByEvent", "FGlobal_EventNotifyContent_Open")
_btn_Close:addInputEvent("Mouse_LUp", "HandleClicked_EventNotifyContent_Close()")

