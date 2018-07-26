Panel_BossAlert_SettingV2:SetShow(false)
Panel_BossAlert_SettingV2:RegisterShowEventFunc(true, "PaGlobal_BossAlertSet_ShowAni()")
Panel_BossAlert_SettingV2:RegisterShowEventFunc(false, "PaGlobal_BossAlertSet_HideAni()")
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
function PaGlobal_BossAlertSet_ShowAni()
  audioPostEvent_SystemUi(0, 22)
  UIAni.fadeInSCR_Down(Panel_BossAlert_SettingV2)
  local aniInfo1 = Panel_BossAlert_SettingV2:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.2)
  aniInfo1.AxisX = Panel_BossAlert_SettingV2:GetSizeX() / 2
  aniInfo1.AxisY = Panel_BossAlert_SettingV2:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_BossAlert_SettingV2:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.2)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_BossAlert_SettingV2:GetSizeX() / 2
  aniInfo2.AxisY = Panel_BossAlert_SettingV2:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end
function PaGlobal_BossAlertSet_HideAni()
  audioPostEvent_SystemUi(1, 1)
  Panel_BossAlert_SettingV2:SetAlpha(1)
  local aniInfo = UIAni.AlphaAnimation(0, Panel_BossAlert_SettingV2, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end
local PaGlobal_BossAlertSet = {
  _ui = {
    btnClose = UI.getChildControl(Panel_BossAlert_SettingV2, "Button_CloseIcon"),
    checkPopUp = UI.getChildControl(Panel_BossAlert_SettingV2, "CheckButton_PopUp"),
    alertOnOffBG = UI.getChildControl(Panel_BossAlert_SettingV2, "Static_AlertOnOffBg"),
    alertBG = UI.getChildControl(Panel_BossAlert_SettingV2, "Static_AlertBg"),
    btn_Setting = UI.getChildControl(Panel_BossAlert_SettingV2, "Button_Setting"),
    btn_BossTime = UI.getChildControl(Panel_BossAlert_SettingV2, "Button_BossTime"),
    bottomDescBG = UI.getChildControl(Panel_BossAlert_SettingV2, "Static_BottomBg"),
    alertKeepBG = UI.getChildControl(Panel_BossAlert_SettingV2, "Static_AlertKeep"),
    alertON = nil,
    alertOFF = nil,
    allAlert_30m = nil,
    allAlert_15m = nil,
    allAlert_5m = nil,
    txt_BottomDesc = nil
  },
  savedPoint1 = 0,
  savedPoint2 = 0,
  savedPoint3 = 0,
  savedPoint4 = 0,
  savedPointSum = 0,
  returnValue = false,
  updateTime = 0,
  bossTime = {
    {
      2,
      11,
      16,
      20,
      23
    },
    {
      0,
      0,
      0,
      0,
      45
    }
  },
  bossName = {
    {
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_KARANDA"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_KZAKA"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_KZAKA"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_NUVER"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_KUTUM"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_KARANDA"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_KARANDA")
    },
    {
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_KZAKA_NUVER"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_KZAKA_NUVER"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_KZAKA_KUTUM"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_NUVER_KUTUM"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_KZAKA_NUVER"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_KZAKA_KUTUM"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_NUVER_KUTUM")
    },
    {
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_KARANDA_KUTUM"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_KZAKA_KUTUM"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_KZAKA_NUVER"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_KZAKA_NUVER"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_KARANDA_KUTUM"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_KARANDA_NUVER"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_KARANDA_KZAKA")
    },
    {
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_NUVER_KUTUM"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_KARANDA_NUVER"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_KARANDA_KUTUM"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_KARANDA_KZAKA"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_NUVER_KUTUM"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_KZAKA_KUTUM"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_GUINT_MURAKA")
    },
    {
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_KARANDA"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_OPIN"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_GAMOS"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_OPIN"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_GAMOS"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_OPIN"),
      PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_GAMOS")
    }
  }
}
function PaGlobal_BossAlertSet:Init()
  self._ui.alertON = UI.getChildControl(self._ui.alertOnOffBG, "RadioButton_AlertOn")
  self._ui.alertOFF = UI.getChildControl(self._ui.alertOnOffBG, "RadioButton_AlertOff")
  self._ui.allAlert_30m = UI.getChildControl(self._ui.alertBG, "Checkbox_30")
  self._ui.allAlert_15m = UI.getChildControl(self._ui.alertBG, "Checkbox_15")
  self._ui.allAlert_5m = UI.getChildControl(self._ui.alertBG, "Checkbox_5")
  self._ui.alertKeep = UI.getChildControl(self._ui.alertKeepBG, "RadioButton_AlertKeep")
  self._ui.alertNone = UI.getChildControl(self._ui.alertKeepBG, "RadioButton_AlertNone")
  self._ui.txt_BottomDesc = UI.getChildControl(self._ui.bottomDescBG, "StaticText_Desc")
  self._ui.btn_Setting:addInputEvent("Mouse_LUp", "PaGlobal_BossAlertSet_SetSetting()")
  self._ui.btn_BossTime:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"WorldBoss\" )")
  self._ui.btnClose:addInputEvent("Mouse_LUp", "PaGlobal_BossAlertSet_Hide()")
  self._ui.allAlert_30m:addInputEvent("Mouse_LUp", "PaGlobal_BossAlertSet_CheckAlert()")
  self._ui.allAlert_15m:addInputEvent("Mouse_LUp", "PaGlobal_BossAlertSet_CheckAlert()")
  self._ui.allAlert_5m:addInputEvent("Mouse_LUp", "PaGlobal_BossAlertSet_CheckAlert()")
  self._ui.checkPopUp:SetShow(false)
  self._ui.txt_BottomDesc:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  self._ui.txt_BottomDesc:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_BOSSALERTSET_BOTTOMDESC"))
  self._ui.txt_BottomDesc:SetSize(360, self._ui.txt_BottomDesc:GetTextSizeY())
  self._ui.bottomDescBG:SetSize(380, self._ui.txt_BottomDesc:GetTextSizeY() + 10)
  Panel_BossAlert_SettingV2:SetSize(406, self._ui.alertOnOffBG:GetSizeY() + self._ui.alertBG:GetSizeY() + self._ui.alertKeepBG:GetSizeY() + self._ui.bottomDescBG:GetSizeY() + 140)
  self._ui.bottomDescBG:ComputePos()
  self._ui.txt_BottomDesc:ComputePos()
  if isGameTypeJapan() then
  elseif isGameTypeRussia() then
  elseif isGameTypeEnglish() then
  elseif isGameTypeTaiwan() then
  elseif isGameTypeSA() then
  elseif isGameTypeTH() then
  elseif isGameTypeTR() then
  elseif isGameTypeID() then
  end
end
function PaGlobal_BossAlertSet_Show()
  if not _ContetnsGroup_BossAlert then
    return
  end
  local self = PaGlobal_BossAlertSet
  Panel_BossAlert_SettingV2:SetShow(true, true)
  Panel_BossAlert_SettingV2:SetPosX(getScreenSizeX() / 2 - Panel_BossAlert_SettingV2:GetSizeX() / 2)
  Panel_BossAlert_SettingV2:SetPosY(getScreenSizeY() / 2 - Panel_BossAlert_SettingV2:GetSizeY() / 2)
  local isAlert = ToClient_getGameUIManagerWrapper():getLuaCacheDataListNumber(CppEnums.GlobalUIOptionType.BossAlertOnOff)
  if 0 == isAlert then
    self._ui.alertON:SetCheck(false)
    self._ui.alertOFF:SetCheck(true)
  else
    self._ui.alertON:SetCheck(true)
    self._ui.alertOFF:SetCheck(false)
  end
  local isAlertKeep = ToClient_getGameUIManagerWrapper():getLuaCacheDataListNumber(CppEnums.GlobalUIOptionType.BossAlertKeep)
  if 0 == isAlertKeep then
    self._ui.alertKeep:SetCheck(true)
    self._ui.alertNone:SetCheck(false)
  else
    self._ui.alertKeep:SetCheck(false)
    self._ui.alertNone:SetCheck(true)
  end
  self:SetCheckUpdate()
end
function PaGlobal_BossAlertSet_CheckAlert()
  local self = PaGlobal_BossAlertSet
  if self._ui.allAlert_30m:IsCheck() then
    self.savedPoint2 = 10
  else
    self.savedPoint2 = 0
  end
  if self._ui.allAlert_15m:IsCheck() then
    self.savedPoint3 = 100
  else
    self.savedPoint3 = 0
  end
  if self._ui.allAlert_5m:IsCheck() then
    self.savedPoint4 = 1000
  else
    self.savedPoint4 = 0
  end
  self.savedPointSum = self.savedPoint1 + self.savedPoint2 + self.savedPoint3 + self.savedPoint4
end
function PaGlobal_BossAlertSet_SetSetting()
  local self = PaGlobal_BossAlertSet
  if self._ui.alertOFF:IsCheck() then
    ToClient_getGameUIManagerWrapper():setLuaCacheDataListNumber(CppEnums.GlobalUIOptionType.BossAlertOnOff, 0, CppEnums.VariableStorageType.eVariableStorageType_User)
  elseif self._ui.alertON:IsCheck() then
    ToClient_getGameUIManagerWrapper():setLuaCacheDataListNumber(CppEnums.GlobalUIOptionType.BossAlertOnOff, 1, CppEnums.VariableStorageType.eVariableStorageType_User)
  end
  if self._ui.alertKeep:IsCheck() then
    ToClient_getGameUIManagerWrapper():setLuaCacheDataListNumber(CppEnums.GlobalUIOptionType.BossAlertKeep, 0, CppEnums.VariableStorageType.eVariableStorageType_User)
  elseif self._ui.alertNone:IsCheck() then
    ToClient_getGameUIManagerWrapper():setLuaCacheDataListNumber(CppEnums.GlobalUIOptionType.BossAlertKeep, 1, CppEnums.VariableStorageType.eVariableStorageType_User)
  end
  PaGlobal_BossAlertSet_SetTime()
  PaGlobal_BossAlertSet_Hide()
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SET_CONFIRM"))
end
function PaGlobal_BossAlertSet_SetTime()
  local self = PaGlobal_BossAlertSet
  local isCheckCount = ToClient_getGameUIManagerWrapper():getLuaCacheDataListNumber(CppEnums.GlobalUIOptionType.BossAlertTime)
  if self.savedPointSum ~= isCheckCount then
    ToClient_getGameUIManagerWrapper():setLuaCacheDataListNumber(CppEnums.GlobalUIOptionType.BossAlertTime, self.savedPointSum, CppEnums.VariableStorageType.eVariableStorageType_User)
  end
end
function PaGlobal_BossAlertSet_ReturnTimeBeforeAlert()
  local rv = 0
  if tonumber(1) == tonumber(os.date("%H")) and tonumber(30) == tonumber(os.date("%M")) or tonumber(10) == tonumber(os.date("%H")) and tonumber(30) == tonumber(os.date("%M")) or tonumber(15) == tonumber(os.date("%H")) and tonumber(30) == tonumber(os.date("%M")) or tonumber(18) == tonumber(os.date("%H")) and tonumber(30) == tonumber(os.date("%M")) or tonumber(19) == tonumber(os.date("%H")) and tonumber(30) == tonumber(os.date("%M")) or tonumber(23) == tonumber(os.date("%H")) and tonumber(15) == tonumber(os.date("%M")) or tonumber(23) == tonumber(os.date("%H")) and tonumber(45) == tonumber(os.date("%M")) then
    rv = PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_BEFORE30")
  end
  if tonumber(1) == tonumber(os.date("%H")) and tonumber(45) == tonumber(os.date("%M")) or tonumber(10) == tonumber(os.date("%H")) and tonumber(45) == tonumber(os.date("%M")) or tonumber(15) == tonumber(os.date("%H")) and tonumber(45) == tonumber(os.date("%M")) or tonumber(18) == tonumber(os.date("%H")) and tonumber(45) == tonumber(os.date("%M")) or tonumber(19) == tonumber(os.date("%H")) and tonumber(45) == tonumber(os.date("%M")) or tonumber(23) == tonumber(os.date("%H")) and tonumber(30) == tonumber(os.date("%M")) or tonumber(0) == tonumber(os.date("%H")) and tonumber(0) == tonumber(os.date("%M")) then
    rv = PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_BEFORE15")
  end
  if tonumber(1) == tonumber(os.date("%H")) and tonumber(55) == tonumber(os.date("%M")) or tonumber(10) == tonumber(os.date("%H")) and tonumber(55) == tonumber(os.date("%M")) or tonumber(15) == tonumber(os.date("%H")) and tonumber(55) == tonumber(os.date("%M")) or tonumber(18) == tonumber(os.date("%H")) and tonumber(55) == tonumber(os.date("%M")) or tonumber(19) == tonumber(os.date("%H")) and tonumber(55) == tonumber(os.date("%M")) or tonumber(23) == tonumber(os.date("%H")) and tonumber(40) == tonumber(os.date("%M")) or tonumber(0) == tonumber(os.date("%H")) and tonumber(10) == tonumber(os.date("%M")) then
    rv = PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_BEFORE5")
  end
  return rv
end
function PaGlobal_BossAlertSet_ReturnNameAlert()
  local self = PaGlobal_BossAlertSet
  local rv = "\237\129\172\236\158\144\236\185\180"
  local timeCount = 1
  local isWeekly = os.date("*t").wday
  local isHour = os.date("%H")
  if tonumber(1) == tonumber(isHour) then
    timeCount = 1
  elseif tonumber(10) == tonumber(isHour) then
    timeCount = 2
  elseif tonumber(15) == tonumber(isHour) then
    timeCount = 3
  elseif tonumber(19) == tonumber(isHour) or tonumber(18) == tonumber(isHour) then
    timeCount = 4
  elseif tonumber(23) == tonumber(isHour) then
    timeCount = 5
  elseif tonumber(0) == tonumber(isHour) then
    return PAGetString(Defines.StringSheet_GAME, "LUA_BOSSALERT_SETTING_GAMOS")
  end
  rv = self.bossName[timeCount][isWeekly]
  return rv
end
function PaGlobal_BossAlertSet:SetCheckUpdate()
  local isCheckCount = ToClient_getGameUIManagerWrapper():getLuaCacheDataListNumber(CppEnums.GlobalUIOptionType.BossAlertTime)
  if 1110 == isCheckCount then
    self._ui.allAlert_30m:SetCheck(true)
    self._ui.allAlert_15m:SetCheck(true)
    self._ui.allAlert_5m:SetCheck(true)
  elseif 1100 == isCheckCount then
    self._ui.allAlert_30m:SetCheck(false)
    self._ui.allAlert_15m:SetCheck(true)
    self._ui.allAlert_5m:SetCheck(true)
  elseif 1010 == isCheckCount then
    self._ui.allAlert_30m:SetCheck(true)
    self._ui.allAlert_15m:SetCheck(false)
    self._ui.allAlert_5m:SetCheck(true)
  elseif 110 == isCheckCount then
    self._ui.allAlert_30m:SetCheck(true)
    self._ui.allAlert_15m:SetCheck(true)
    self._ui.allAlert_5m:SetCheck(false)
  else
    self._ui.allAlert_30m:SetCheck(10 == isCheckCount)
    self._ui.allAlert_15m:SetCheck(100 == isCheckCount)
    self._ui.allAlert_5m:SetCheck(1000 == isCheckCount)
  end
end
function PaGlobal_BossAlertSet_BossTimeCalc()
  local self = PaGlobal_BossAlertSet
  local isYear = ToClient_GetThisYear()
  local isMonth = ToClient_GetThisMonth()
  local isDay = ToClient_GetToday()
  local isHour = os.date("%H")
  local isMinute = os.date("%M")
  local isSecond = os.date("%S")
  local isBoss1_1 = tonumber(1) == tonumber(os.date("%H")) and tonumber(55) == tonumber(os.date("%M"))
  local isBoss1_2 = tonumber(1) == tonumber(os.date("%H")) and tonumber(45) == tonumber(os.date("%M"))
  local isBoss1_3 = tonumber(1) == tonumber(os.date("%H")) and tonumber(30) == tonumber(os.date("%M"))
  local isBoss2_1 = tonumber(10) == tonumber(os.date("%H")) and tonumber(55) == tonumber(os.date("%M"))
  local isBoss2_2 = tonumber(10) == tonumber(os.date("%H")) and tonumber(45) == tonumber(os.date("%M"))
  local isBoss2_3 = tonumber(10) == tonumber(os.date("%H")) and tonumber(30) == tonumber(os.date("%M"))
  local isBoss3_1 = tonumber(15) == tonumber(os.date("%H")) and tonumber(55) == tonumber(os.date("%M"))
  local isBoss3_2 = tonumber(15) == tonumber(os.date("%H")) and tonumber(45) == tonumber(os.date("%M"))
  local isBoss3_3 = tonumber(15) == tonumber(os.date("%H")) and tonumber(30) == tonumber(os.date("%M"))
  local isBoss4_1 = tonumber(19) == tonumber(os.date("%H")) and tonumber(55) == tonumber(os.date("%M"))
  local isBoss4_2 = tonumber(19) == tonumber(os.date("%H")) and tonumber(45) == tonumber(os.date("%M"))
  local isBoss4_3 = tonumber(19) == tonumber(os.date("%H")) and tonumber(30) == tonumber(os.date("%M"))
  local isBoss5_1 = tonumber(23) == tonumber(os.date("%H")) and tonumber(40) == tonumber(os.date("%M"))
  local isBoss5_2 = tonumber(23) == tonumber(os.date("%H")) and tonumber(30) == tonumber(os.date("%M"))
  local isBoss5_3 = tonumber(23) == tonumber(os.date("%H")) and tonumber(15) == tonumber(os.date("%M"))
  if "6" == os.date("%w") then
    isBoss4_1 = tonumber(18) == tonumber(os.date("%H")) and tonumber(55) == tonumber(os.date("%M"))
    isBoss4_2 = tonumber(18) == tonumber(os.date("%H")) and tonumber(45) == tonumber(os.date("%M"))
    isBoss4_3 = tonumber(18) == tonumber(os.date("%H")) and tonumber(30) == tonumber(os.date("%M"))
    isBoss5_3 = tonumber(23) == tonumber(os.date("%H")) and tonumber(45) == tonumber(os.date("%M"))
  elseif "0" == os.date("%w") then
    isBoss4_1 = tonumber(19) == tonumber(os.date("%H")) and tonumber(55) == tonumber(os.date("%M"))
    isBoss4_2 = tonumber(19) == tonumber(os.date("%H")) and tonumber(45) == tonumber(os.date("%M"))
    isBoss4_3 = tonumber(19) == tonumber(os.date("%H")) and tonumber(30) == tonumber(os.date("%M"))
    isBoss5_3 = tonumber(23) == tonumber(os.date("%H")) and tonumber(15) == tonumber(os.date("%M"))
  end
  local isTimeCount = ToClient_getGameUIManagerWrapper():getLuaCacheDataListNumber(CppEnums.GlobalUIOptionType.BossAlertTime)
  if 1110 == isTimeCount then
    self.returnValue = isBoss1_1 or isBoss1_2 or isBoss1_3 or isBoss2_1 or isBoss2_2 or isBoss2_3 or isBoss3_1 or isBoss3_2 or isBoss3_3 or isBoss4_1 or isBoss4_2 or isBoss4_3 or isBoss5_1 or isBoss5_2 or isBoss5_3
  elseif 100 == isTimeCount then
    self.returnValue = isBoss1_2 or isBoss2_2 or isBoss3_2 or isBoss4_2 or isBoss5_2
  elseif 1000 == isTimeCount then
    self.returnValue = isBoss1_1 or isBoss2_1 or isBoss3_1 or isBoss4_1 or isBoss5_1
  elseif 10 == isTimeCount then
    self.returnValue = isBoss1_3 or isBoss2_3 or isBoss3_3 or isBoss4_3 or isBoss5_3
  elseif 1100 == isTimeCount then
    self.returnValue = isBoss1_1 or isBoss1_2 or isBoss2_1 or isBoss2_2 or isBoss3_1 or isBoss3_2 or isBoss4_1 or isBoss4_2 or isBoss5_1 or isBoss5_2
  elseif 1010 == isTimeCount then
    self.returnValue = isBoss1_1 or isBoss1_3 or isBoss2_1 or isBoss2_3 or isBoss3_1 or isBoss3_3 or isBoss4_1 or isBoss4_3 or isBoss5_1 or isBoss5_3
  elseif 110 == isTimeCount then
    self.returnValue = isBoss1_2 or isBoss1_3 or isBoss2_2 or isBoss2_3 or isBoss3_2 or isBoss3_3 or isBoss4_2 or isBoss4_3 or isBoss5_2 or isBoss5_3
  else
    self.returnValue = false
  end
  self.updateTime = 0
  return self.returnValue
end
function PaGlobal_BossAlertSet_PopUp()
  local self = PaGlobal_BossAlertSet
  if self._ui.checkPopUp:IsCheck() then
    Panel_BossAlert_SettingV2:OpenUISubApp()
  else
    Panel_BossAlert_SettingV2:CloseUISubApp()
  end
  TooltipSimple_Hide()
end
function PaGlobal_BossAlertSet_Hide()
  local self = PaGlobal_BossAlertSet
  audioPostEvent_SystemUi(1, 1)
  Panel_BossAlert_SettingV2:SetShow(false, false)
end
function PaGlobal_BossAlertSet_ReturnKeep()
  local self = PaGlobal_BossAlertSet
  local isAlertKeep = ToClient_getGameUIManagerWrapper():getLuaCacheDataListNumber(CppEnums.GlobalUIOptionType.BossAlertKeep)
  if 0 == isAlertKeep then
    isAlertKeep = true
  else
    isAlertKeep = false
  end
  return isAlertKeep
end
function PaGlobal_BossAlertSet_PopUp_ShowIconToolTip(isShow)
  if isShow then
    local name = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_TOOLTIP_NAME")
    local desc = ""
  else
    TooltipSimple_Hide()
  end
end
PaGlobal_BossAlertSet:Init()
