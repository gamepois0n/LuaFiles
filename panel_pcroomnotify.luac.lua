-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\pcroomnotify\panel_pcroomnotify.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
Panel_PcRoomNotify:SetShow(false)
Panel_PcRoomNotify:setGlassBackground(true)
Panel_PcRoomNotify:ActiveMouseEventEffect(true)
Panel_PcRoomNotify:RegisterShowEventFunc(true, "Panel_PcRoomNotify_ShowAni()")
Panel_PcRoomNotify:RegisterShowEventFunc(false, "Panel_PcRoomNotify_HideAni()")
local isBeforeShow = false
Panel_PcRoomNotify_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_PcRoomNotify)
  local aniInfo1 = Panel_PcRoomNotify:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_PcRoomNotify:GetSizeX() / 2
  aniInfo1.AxisY = Panel_PcRoomNotify:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_PcRoomNotify:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_PcRoomNotify:GetSizeX() / 2
  aniInfo2.AxisY = Panel_PcRoomNotify:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_PcRoomNotify_HideAni = function()
  -- function num : 0_1
  Panel_PcRoomNotify:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_PcRoomNotify, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local _btn_Close = (UI.getChildControl)(Panel_PcRoomNotify, "Button_Close")
local _btn_Close2 = ((UI.getChildControl)(Panel_PcRoomNotify, "Button_Agree"))
local _Web = nil
local isShowPcRoomNotify = false
Panel_PcRoomNotify_Initialize = function()
  -- function num : 0_2 , upvalues : _Web
  _Web = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_PcRoomNotify, "WebControl_PcRoomNotify_WebLink")
  _Web:SetShow(true)
  _Web:SetPosX(43)
  _Web:SetPosY(63)
  _Web:SetSize(870, 600)
  _Web:ResetUrl()
end

Panel_PcRoomNotify_Initialize()
PcRoomNotify_FirstUsePearl_Open = function()
  -- function num : 0_3 , upvalues : _Web
  local temporaryPCRoomWrapper = getTemporaryInformationWrapper()
  local isPremiumPcRoom = temporaryPCRoomWrapper:isPremiumPcRoom()
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  if not isPremiumPcRoom then
    return 
  end
  if temporaryPCRoomWrapper:isPcRoomBeforeShow() then
    return 
  end
  audioPostEvent_SystemUi(13, 6)
  local isSvc = (getGameServiceType())
  local url = nil
  if isSvc == 1 or isSvc == 2 or isSvc == 4 then
    url = PAGetString(Defines.StringSheet_GAME, "LUA_PCROOMNOTIFY_DEV_URL")
  else
    if isSvc == 3 then
      url = PAGetString(Defines.StringSheet_GAME, "LUA_PCROOMNOTIFY_URL")
    else
      if isSvc == 5 or isSvc == 6 then
        url = PAGetString(Defines.StringSheet_GAME, "LUA_PCROOMNOTIFY_URL")
      else
        return 
      end
    end
  end
  _Web:SetSize(870, 600)
  _Web:SetUrl(870, 600, url)
  Panel_PcRoomNotify:SetPosX(getScreenSizeX() / 2 - Panel_PcRoomNotify:GetSizeX() / 2)
  Panel_PcRoomNotify:SetPosY(getScreenSizeY() / 2 - Panel_PcRoomNotify:GetSizeY() / 2)
  Panel_PcRoomNotify:SetShow(true, false)
  temporaryPCRoomWrapper:setPcRoomBeforeShow(true)
end

PcRoomNotify_Close = function()
  -- function num : 0_4 , upvalues : _Web
  _Web:ResetUrl()
  audioPostEvent_SystemUi(13, 5)
  Panel_PcRoomNotify:SetShow(false, false)
  EventNotify_Open()
end

FGlobal_PcRoomNotifyClose = function()
  -- function num : 0_5
  PcRoomNotify_Close()
end

HandleClicked_PcRoomNotify_Close = function()
  -- function num : 0_6
  PcRoomNotify_Close()
end

HandleClicked_PcRoomNotify_Next = function()
  -- function num : 0_7
  PcRoomNotify_Close()
end

FromClient_IsPcRoomPlayer = function()
  -- function num : 0_8 , upvalues : isShowPcRoomNotify
  if not isShowPcRoomNotify then
    PcRoomNotify_FirstUsePearl_Open()
    isShowPcRoomNotify = false
  end
end

_btn_Close:addInputEvent("Mouse_LUp", "HandleClicked_PcRoomNotify_Close()")
_btn_Close2:addInputEvent("Mouse_LUp", "HandleClicked_PcRoomNotify_Close()")

