-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\itemmarket\panel_itemmarket_newalarm.luac 

-- params : ...
-- function num : 0
Panel_ItemMarket_NewAlarm:SetShow(false)
local PaGlobal_ItemMarket_NewAlarm = {
_ui = {_bg = (UI.getChildControl)(Panel_ItemMarket_NewAlarm, "Static_Bg"), _date = (UI.getChildControl)(Panel_ItemMarket_NewAlarm, "StaticText_Date"), _desc = (UI.getChildControl)(Panel_ItemMarket_NewAlarm, "StaticText_Desc"), _itemSlotBg = (UI.getChildControl)(Panel_ItemMarket_NewAlarm, "Static_Slot_IconBG"), _itemSlot = (UI.getChildControl)(Panel_ItemMarket_NewAlarm, "Static_Slot_Icon"), _closeIcon = (UI.getChildControl)(Panel_ItemMarket_NewAlarm, "Button_Win_Close")}
, 
_config = {createBorder = true, createEnchant = true, createCash = true}
, _enchantItemKey = nil, _aniTime = 0, _maxTime = 5, 
_itemSlot = {}
}
PaGlobal_ItemMarket_NewAlarm.Init = function(self)
  -- function num : 0_0
  ((self._ui)._desc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._bg):addInputEvent("Mouse_LUp", "FGlobal_ItemMarketAlarmList_New_Open()")
  ;
  ((self._ui)._closeIcon):addInputEvent("Mouse_LUp", "FGlobal_ItemMarket_NewAlarmClose()")
  Panel_ItemMarket_NewAlarm:RegisterUpdateFunc("UpdateFunc_checkAlramAnimation")
  ;
  (SlotItem.new)(self._itemSlot, "ItemMarketItemIconSlot", 0, (self._ui)._itemSlotBg, self._config)
  ;
  (self._itemSlot):createChild()
end

PaGlobal_ItemMarket_NewAlarm.ShowAni = function(self)
  -- function num : 0_1
  local alarmMoveAni1 = Panel_ItemMarket_NewAlarm:addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  alarmMoveAni1:SetStartPosition(getScreenSizeX() + 10, getScreenSizeY() - Panel_ItemMarket_NewAlarm:GetSizeY() - 80)
  alarmMoveAni1:SetEndPosition(getScreenSizeX() - Panel_ItemMarket_NewAlarm:GetSizeX() - 20, getScreenSizeY() - Panel_ItemMarket_NewAlarm:GetSizeY() - 80)
  alarmMoveAni1.IsChangeChild = true
  Panel_ItemMarket_NewAlarm:CalcUIAniPos(alarmMoveAni1)
  alarmMoveAni1:SetDisableWhileAni(true)
  if FGlobal_ItemMarket_AlarmList_SoundCheck() then
    audioPostEvent_SystemUi(10, 1)
  end
end

PaGlobal_ItemMarket_NewAlarm.HideAni = function(self)
  -- function num : 0_2
  local alarmMoveAni2 = Panel_ItemMarket_NewAlarm:addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  alarmMoveAni2:SetStartPosition(Panel_ItemMarket_NewAlarm:GetPosX(), getScreenSizeY() - Panel_ItemMarket_NewAlarm:GetSizeY() - 80)
  alarmMoveAni2:SetEndPosition(getScreenSizeX() + 10, getScreenSizeY() - Panel_ItemMarket_NewAlarm:GetSizeY() - 80)
  alarmMoveAni2.IsChangeChild = true
  Panel_ItemMarket_NewAlarm:CalcUIAniPos(alarmMoveAni2)
  alarmMoveAni2:SetDisableWhileAni(true)
  alarmMoveAni2:SetHideAtEnd(true)
  alarmMoveAni2:SetDisableWhileAni(true)
  Panel_Tooltip_Item_hideTooltip()
end

FGlobal_ItemMarket_NewAlarmShow = function(enchantItemKey, playerName, registTime)
  -- function num : 0_3 , upvalues : PaGlobal_ItemMarket_NewAlarm
  local self = PaGlobal_ItemMarket_NewAlarm
  local itemSSW = getItemEnchantStaticStatus(enchantItemKey)
  if itemSSW == nil then
    return 
  end
  self._enchantItemKey = enchantItemKey
  ;
  (self._itemSlot):setItemByStaticStatus(itemSSW)
  ;
  ((self._itemSlot).icon):addInputEvent("Mouse_On", "PaGlobal_ItemMarket_NewAlarm_TooltipShow()")
  ;
  ((self._itemSlot).icon):addInputEvent("Mouse_Out", "PaGlobal_ItemMarket_NewAlarm_TooltipHide()")
  local itemName = FGlobal_ChangeItemNameColorByGrade(enchantItemKey)
  if registTime then
    if playerName == true then
      ((self._ui)._desc):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_SELLBYPREBID_ALARMMSG2", "itemName", itemName))
    else
      ;
      ((self._ui)._desc):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGIST_ALARMMSG", "itemName", itemName))
    end
    ;
    ((self._ui)._date):SetText(registTime)
  else
    if playerName ~= nil then
      ((self._ui)._desc):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_ITEMMARKET_SELLBYPREBID_ALARMMSG", "itemName", itemName, "playerName", playerName))
    else
      ;
      ((self._ui)._desc):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGIST_ALARMMSG", "itemName", itemName))
    end
    ;
    ((self._ui)._date):SetText(getTimeYearMonthDayHourMinSecByTTime64(getUtc64()))
  end
  Panel_ItemMarket_NewAlarm:SetShow(true)
  self._aniTime = 0
  self:ShowAni()
  if registTime == nil then
    FGlobal_ItemMarket_AlarmIcon_Show()
  end
end

PaGlobal_ItemMarket_NewAlarm_TooltipShow = function()
  -- function num : 0_4 , upvalues : PaGlobal_ItemMarket_NewAlarm
  local self = PaGlobal_ItemMarket_NewAlarm
  if self._enchantItemKey == nil then
    return 
  end
  local itemSSW = getItemEnchantStaticStatus(self._enchantItemKey)
  if itemSSW == nil then
    return 
  end
  Panel_Tooltip_Item_SetPosition(0, (self._ui)._itemSlotBg, "itemMarketAlarm")
  Panel_Tooltip_Item_Show(itemSSW, Panel_ItemMarket_NewAlarm, true)
end

PaGlobal_ItemMarket_NewAlarm_TooltipHide = function()
  -- function num : 0_5
  Panel_Tooltip_Item_hideTooltip()
end

FGlobal_ItemMarket_NewAlarmClose = function()
  -- function num : 0_6 , upvalues : PaGlobal_ItemMarket_NewAlarm
  PaGlobal_ItemMarket_NewAlarm:HideAni()
end

UpdateFunc_checkAlramAnimation = function(deltaTime)
  -- function num : 0_7 , upvalues : PaGlobal_ItemMarket_NewAlarm
  if FGlobal_ItemMarketAlarm_CheckState() then
    return 
  end
  local self = PaGlobal_ItemMarket_NewAlarm
  self._aniTime = self._aniTime + deltaTime
  if self._maxTime < self._aniTime then
    self:HideAni()
    self._aniTime = 0
  end
end

PaGlobal_ItemMarket_NewAlarm:Init()

