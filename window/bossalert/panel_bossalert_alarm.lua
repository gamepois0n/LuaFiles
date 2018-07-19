Panel_BossAlertV2:SetShow(false)
local PaGlobal_BossAlert = {
  _ui = {
    _bg = UI.getChildControl(Panel_BossAlertV2, "Static_Bg"),
    _date = UI.getChildControl(Panel_BossAlertV2, "StaticText_Date"),
    _desc = UI.getChildControl(Panel_BossAlertV2, "StaticText_Desc"),
    _itemSlotBg = UI.getChildControl(Panel_BossAlertV2, "Static_Slot_IconBG"),
    _itemSlot = UI.getChildControl(Panel_BossAlertV2, "Static_Slot_Icon"),
    _closeIcon = UI.getChildControl(Panel_BossAlertV2, "Button_Win_Close")
  },
  _aniTime = 0,
  _maxTime = 10,
  updateTime = 0
}
function PaGlobal_BossAlert:Init()
  self._ui._desc:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  self._ui._bg:addInputEvent("Mouse_LUp", "PaGlobal_BossAlertSet_Show()")
  self._ui._closeIcon:addInputEvent("Mouse_LUp", "PaGlobal_BossAlert_NewAlarmClose()")
  Panel_BossAlertV2:RegisterUpdateFunc("UpdateFunc_checkBossAlramAnimation")
end
function PaGlobal_BossAlert:ShowAni()
  local alarmMoveAni1 = Panel_BossAlertV2:addMoveAnimation(0, 0.3, CppEnums.PAUI_ANIM_ADVANCE_TYPE.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  alarmMoveAni1:SetStartPosition(getScreenSizeX() + 10, getScreenSizeY() - Panel_BossAlertV2:GetSizeY() - 80)
  alarmMoveAni1:SetEndPosition(getScreenSizeX() - Panel_BossAlertV2:GetSizeX() - 20, getScreenSizeY() - Panel_BossAlertV2:GetSizeY() - 80)
  alarmMoveAni1.IsChangeChild = true
  Panel_BossAlertV2:CalcUIAniPos(alarmMoveAni1)
  alarmMoveAni1:SetDisableWhileAni(true)
  audioPostEvent_SystemUi(19, 50)
end
function PaGlobal_BossAlert:HideAni()
  local alarmMoveAni2 = Panel_BossAlertV2:addMoveAnimation(0, 0.3, CppEnums.PAUI_ANIM_ADVANCE_TYPE.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  alarmMoveAni2:SetStartPosition(Panel_BossAlertV2:GetPosX(), getScreenSizeY() - Panel_BossAlertV2:GetSizeY() - 80)
  alarmMoveAni2:SetEndPosition(getScreenSizeX() + 10, getScreenSizeY() - Panel_BossAlertV2:GetSizeY() - 80)
  alarmMoveAni2.IsChangeChild = true
  Panel_BossAlertV2:CalcUIAniPos(alarmMoveAni2)
  alarmMoveAni2:SetDisableWhileAni(true)
  alarmMoveAni2:SetHideAtEnd(true)
  alarmMoveAni2:SetDisableWhileAni(true)
  Panel_Tooltip_Item_hideTooltip()
end
function PaGlobal_BossAlert_NewAlarmShow(deltaTime)
  if not _ContetnsGroup_BossAlert then
    return
  end
  local self = PaGlobal_BossAlert
  self.updateTime = self.updateTime + deltaTime
  if self.updateTime < 60 then
    return
  end
  self.updateTime = 0
  if not PaGlobal_BossAlertSet_BossTimeCalc() then
    return
  end
  local isYear = ToClient_GetThisYear()
  local isMonth = ToClient_GetThisMonth()
  local isDay = ToClient_GetToday()
  local isHour = os.date("%H")
  local isMinute = os.date("%M")
  local isSecond = os.date("%S")
  local beforeTimeAlert = PaGlobal_BossAlertSet_ReturnTimeBeforeAlert()
  local bossTimeName = PaGlobal_BossAlertSet_ReturnNameAlert()
  self._ui._date:SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_BOSSALERT_ALARM_NAME_TIME", "bossName", tostring(bossTimeName), "bossTime", tostring(beforeTimeAlert)))
  self._ui._desc:SetText(PAGetStringParam3(Defines.StringSheet_GAME, "LUA_BOSSALERT_ALARM_DATE", "year", tostring(isYear), "month", tostring(isMonth), "day", tostring(isDay)) .. " " .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_BOSSALERT_ALARM_TIME", "hour", tostring(isHour), "minute", tostring(isMinute)))
  Panel_BossAlertV2:SetShow(true)
  self._aniTime = 0
  self:ShowAni()
end
function PaGlobal_BossAlert_TooltipShow()
  local self = PaGlobal_BossAlert
end
function PaGlobal_BossAlert_TooltipHide()
  Panel_Tooltip_Item_hideTooltip()
end
function PaGlobal_BossAlert_NewAlarmClose()
  PaGlobal_BossAlert:HideAni()
end
function UpdateFunc_checkBossAlramAnimation(deltaTime)
  if PaGlobal_BossAlertSet_ReturnKeep() then
    self.updateTime = 0
    return
  end
  local self = PaGlobal_BossAlert
  self._aniTime = self._aniTime + deltaTime
  if self._maxTime < self._aniTime then
    self:HideAni()
    self._aniTime = 0
    self.updateTime = 0
  end
end
PaGlobal_BossAlert:Init()
