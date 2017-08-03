-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\eventnotify\panel_eventnotify.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local IM = CppEnums.EProcessorInputMode
Panel_EventNotify:SetShow(false)
Panel_EventNotify:setGlassBackground(true)
Panel_EventNotify:ActiveMouseEventEffect(true)
Panel_EventNotify:RegisterShowEventFunc(true, "Panel_EventNotify_ShowAni()")
Panel_EventNotify:RegisterShowEventFunc(false, "Panel_EventNotify_HideAni()")
btnClose = (UI.getChildControl)(Panel_EventNotify, "Button_Close")
btnClose:addInputEvent("Mouse_LUp", "HandleClicked_EventNotify_Close()")
Panel_EventNotify_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_EventNotify)
  local aniInfo1 = Panel_EventNotify:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_EventNotify:GetSizeX() / 2
  aniInfo1.AxisY = Panel_EventNotify:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_EventNotify:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_EventNotify:GetSizeX() / 2
  aniInfo2.AxisY = Panel_EventNotify:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_EventNotify_HideAni = function()
  -- function num : 0_1
  Panel_EventNotify:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_EventNotify, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

Panel_EventNotify_Initialize = function()
  -- function num : 0_2
  _Web = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_EventNotify, "WebControl_EventNotify_WebLink")
  _Web:SetShow(true)
  _Web:SetPosX(42)
  _Web:SetPosY(68)
  _Web:SetSize(636, 494)
  _Web:ResetUrl()
end

Panel_EventNotify_Initialize()
EventNotify_Open = function(isDo, isMenu)
  -- function num : 0_3
  if not ToClient_IsPopUpToggle() then
    return 
  end
  if isGameTypeKR2() then
    return 
  end
  tempWrapper = getTemporaryInformationWrapper()
  if tempWrapper:isEventBeforeShow() and isDo == nil then
    return 
  end
  if isGameTypeRussia() and isServerFixedCharge() then
    return 
  end
  if not TutorialQuestCompleteCheck() and not isMenu then
    return 
  end
  audioPostEvent_SystemUi(13, 6)
  Panel_EventNotify:SetPosX(getScreenSizeX() / 2 - Panel_EventNotify:GetSizeX() / 2)
  Panel_EventNotify:SetPosY(getScreenSizeY() / 2 - Panel_EventNotify:GetSizeY() / 2)
  Panel_EventNotify:SetShow(true, true)
  local url = PAGetString(Defines.StringSheet_GAME, "LUA_EVENTNOTIFY_URL")
  if isGameTypeKorea() then
    url = PAGetString(Defines.StringSheet_GAME, "LUA_EVENTNOTIFY_URL")
  else
    if isGameTypeTaiwan() then
      if (CppEnums.CountryType).TW_ALPHA == getGameServiceType() then
        url = PAGetString(Defines.StringSheet_GAME, "LUA_EVENTNOTIFY_URL_TW_ALPHA")
      else
        if (CppEnums.CountryType).TW_REAL == getGameServiceType() then
          url = PAGetString(Defines.StringSheet_GAME, "LUA_EVENTNOTIFY_URL_TW")
        end
      end
    else
      if isGameTypeSA() then
        if (CppEnums.CountryType).SA_ALPHA == getGameServiceType() then
          url = PAGetString(Defines.StringSheet_GAME, "LUA_EVENTNOTIFY_URL_SA_ALPHA")
        else
          if (CppEnums.CountryType).SA_REAL == getGameServiceType() then
            url = PAGetString(Defines.StringSheet_GAME, "LUA_EVENTNOTIFY_URL_SA")
          end
        end
      else
        url = PAGetString(Defines.StringSheet_GAME, "LUA_EVENTNOTIFY_URL")
      end
    end
  end
  _Web:SetSize(636, 494)
  _Web:SetUrl(636, 494, url, false, true)
end

EventNotify_Close = function()
  -- function num : 0_4 , upvalues : IM
  audioPostEvent_SystemUi(13, 5)
  Panel_EventNotify:SetShow(false, false)
  _Web:ResetUrl()
  FGlobal_LevelupGuide_Open()
  if not tempWrapper:isEventBeforeShow() then
    tempWrapper:setEventBeforeShow(true)
  else
    ;
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
  end
end

FGlobal_EventNotifyClose = function()
  -- function num : 0_5
  EventNotify_Close()
end

HandleClicked_EventNotify_Close = function()
  -- function num : 0_6
  EventNotify_Close()
end

HandleClicked_EventNotify_Next = function()
  -- function num : 0_7
  EventNotify_Close()
end


