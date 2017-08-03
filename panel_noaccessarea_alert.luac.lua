-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\deadmessage\panel_noaccessarea_alert.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local noAccessWarningTime = 0
local elapsedTime = 0
local displayTime = -1
local _alertPanel = (UI.getChildControl)(Panel_NoAceessArea_Alert, "Static_AlertPanel")
local _textNoticeMsg = (UI.getChildControl)(Panel_NoAceessArea_Alert, "StaticText_Alert_NoticeText_0")
local _panelDanger = (UI.getChildControl)(Panel_NoAceessArea_Alert, "Static_Alert")
_textNoticeMsg:SetSize(500, 40)
DangerZone_Resize = function()
  -- function num : 0_0 , upvalues : _panelDanger, _alertPanel, _textNoticeMsg
  screenX = getScreenSizeX()
  screenY = getScreenSizeY()
  Panel_NoAceessArea_Alert:SetSize(screenX, screenY)
  _panelDanger:SetSize(screenX, screenY)
  _alertPanel:SetPosX(screenX / 2 - _alertPanel:GetSizeX() / 2)
  _alertPanel:SetPosY(screenY / 2 - _alertPanel:GetSizeY() / 2 + 150)
  _textNoticeMsg:SetPosX(screenX / 2 - _textNoticeMsg:GetSizeX() / 2)
  _textNoticeMsg:SetPosY(screenY / 2 - _textNoticeMsg:GetSizeY() / 2 + 150)
end

EventPlayerDead_HideUI = function()
  -- function num : 0_1
  Panel_NoAceessArea_Alert:SetShow(false)
end

noAccessArea_UpdatePerFrame = function(deltaTime)
  -- function num : 0_2 , upvalues : noAccessWarningTime, _panelDanger, _alertPanel, elapsedTime, displayTime
  if noAccessWarningTime <= 0 then
    Panel_NoAceessArea_Alert:SetShow(false)
    _panelDanger:SetShow(false)
    _panelDanger:ResetVertexAni()
    _alertPanel:ResetVertexAni()
    _panelDanger:SetAlpha(0)
    _alertPanel:SetAlpha(0)
    return 
  end
  elapsedTime = elapsedTime - deltaTime
  if noAccessWarningTime < elapsedTime then
    noAccessWarningTime = -1
  else
    local showTime = (math.floor)(elapsedTime)
    if displayTime ~= showTime then
      displayTime = showTime
      if displayTime < 0 then
        displayTime = 0
      end
      _panelDanger:SetShow(true)
      _panelDanger:ResetVertexAni()
      _panelDanger:SetVertexAniRun("Ani_Color_Danger1", true)
      _alertPanel:ResetVertexAni()
      _alertPanel:SetVertexAniRun("Ani_Color_AlertPanel", true)
    end
  end
end

setAccessibleWarning = function(isAccessibleWarning, warningTime)
  -- function num : 0_3 , upvalues : noAccessWarningTime, elapsedTime, displayTime, _textNoticeMsg, UI_TM
  if isInstanceField() == true then
    return 
  end
  Panel_NoAceessArea_Alert:SetShow(isAccessibleWarning)
  noAccessWarningTime = warningTime
  elapsedTime = warningTime
  displayTime = -1
  _textNoticeMsg:SetTextMode(UI_TM.eTextMode_AutoWrap)
end

NoAccessArea_InitEvent = function()
  -- function num : 0_4
  registerEvent("EventAccessibleAreaWarning", "setAccessibleWarning")
  Panel_NoAceessArea_Alert:RegisterUpdateFunc("noAccessArea_UpdatePerFrame")
end

NoAccessArea_InitEvent()
registerEvent("onScreenResize", "DangerZone_Resize")
registerEvent("EventSelfPlayerPreDead", "EventPlayerDead_HideUI")
DangerZone_Resize()

