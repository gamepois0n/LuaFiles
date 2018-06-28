local PaGlobal_NewMailAlarm = {_animationTime = 0, _remainTime = 4}
function PaGlobal_NewMailAlarm:ShowAni()
  local alarmMoveAni1 = Panel_Widget_NewMailAlarm_Renew:addMoveAnimation(0, 0.3, CppEnums.PAUI_ANIM_ADVANCE_TYPE.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  alarmMoveAni1:SetStartPosition(getScreenSizeX() + 10, getScreenSizeY() - Panel_Widget_NewMailAlarm_Renew:GetSizeY() - 80)
  alarmMoveAni1:SetEndPosition(getScreenSizeX() - Panel_Widget_NewMailAlarm_Renew:GetSizeX() - 20, getScreenSizeY() - Panel_Widget_NewMailAlarm_Renew:GetSizeY() - 80)
  alarmMoveAni1.IsChangeChild = true
  Panel_Widget_NewMailAlarm_Renew:CalcUIAniPos(alarmMoveAni1)
  alarmMoveAni1:SetDisableWhileAni(true)
end
function PaGlobal_NewMailAlarm:HideAni()
  local alarmMoveAni2 = Panel_Widget_NewMailAlarm_Renew:addMoveAnimation(0, 0.3, CppEnums.PAUI_ANIM_ADVANCE_TYPE.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  alarmMoveAni2:SetStartPosition(Panel_Widget_NewMailAlarm_Renew:GetPosX(), getScreenSizeY() - Panel_Widget_NewMailAlarm_Renew:GetSizeY() - 80)
  alarmMoveAni2:SetEndPosition(getScreenSizeX() + 10, getScreenSizeY() - Panel_Widget_NewMailAlarm_Renew:GetSizeY() - 80)
  alarmMoveAni2.IsChangeChild = true
  Panel_Widget_NewMailAlarm_Renew:CalcUIAniPos(alarmMoveAni2)
  alarmMoveAni2:SetDisableWhileAni(true)
  alarmMoveAni2:SetHideAtEnd(true)
  alarmMoveAni2:SetDisableWhileAni(true)
  Panel_Tooltip_Item_hideTooltip()
end
function NewMailAlarm(deltaTime)
  local self = PaGlobal_NewMailAlarm
  self._animationTime = self._animationTime + deltaTime
  if self._remainTime < self._animationTime then
    self._animationTime = 0
    self:HideAni()
  end
end
function FromClient_NewMailAlram()
  audioPostEvent_SystemUi(10, 1)
  local self = PaGlobal_NewMailAlarm
  self._animationTime = 0
  Panel_Widget_NewMailAlarm_Renew:SetShow(true)
  self:ShowAni()
end
Panel_Widget_NewMailAlarm_Renew:RegisterUpdateFunc("NewMailAlarm")
registerEvent("FromClient_NewMail", "FromClient_NewMailAlram")
